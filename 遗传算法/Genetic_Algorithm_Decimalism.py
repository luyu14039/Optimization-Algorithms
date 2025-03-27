# -*- coding: utf-8 -*-
"""
Created on Sat Jan 11 13:51:54 2025

@author: piaoy
"""

#自适应调整交叉率和变异率
import random
import math
import numpy as np


# 定义适应度函数
def fitness(individual):
    return abs(math.sin(individual) ** 2 * math.sin(2 * individual))


# 选择操作（轮盘赌选择 + 精英选择）
def selection(population, fitness_scores, elite_size):
    # 先对种群和适应度分数进行排序，以便选择精英个体
    sorted_population = [x for _, x in sorted(zip(fitness_scores, population), reverse=True)]
    new_population = sorted_population[:elite_size]
    remaining_size = len(population) - elite_size
    max_fitness = sum(fitness_scores)
    while len(new_population) < len(population):
        pick = random.uniform(0, max_fitness)
        current = 0
        for individual, score in zip(population, fitness_scores):
            current += score
            if current > pick:
                new_population.append(individual)
                break
    return new_population


# 交叉操作（算术交叉和单点交叉结合）
def crossover(parent1, parent2, Pc):
    # 以自适应交叉率 Pc 决定是否进行交叉
    if random.random() < Pc:
        # 以 0.5 的概率选择算术交叉或单点交叉
        if random.random() < 0.5:
            alpha = random.uniform(0, 1)
            child1 = alpha * parent1 + (1 - alpha) * parent2
            child2 = alpha * parent2 + (1 - alpha) * parent1
        else:
            # 将 parent1 和 parent2 转换为 numpy 数组
            parent1 = np.array([parent1])
            parent2 = np.array([parent2])
            if len(parent1) > 1:
                # 单点交叉
                crossover_point = random.randint(1, len(parent1) - 1)
                child1 = np.concatenate((parent1[:crossover_point], parent2[crossover_point:]))
                child2 = np.concatenate((parent2[:crossover_point], parent1[crossover_point:]))
            else:
                # 如果长度为 1，则使用算术交叉作为替代
                alpha = random.uniform(0, 1)
                child1 = alpha * parent1 + (1 - alpha) * parent2
                child2 = alpha * parent2 + (1 - alpha) * parent1
            # 转换回 float 类型
            child1 = child1[0]
            child2 = child2[0]
    else:
        child1, child2 = parent1, parent2
    return child1, child2


# 变异操作（高斯变异）
def mutate(individual, Pm, min_val=0, max_val=2):
    # 以自适应变异率 Pm 决定是否进行变异
    if random.random() < Pm:
        # 从正态分布中采样变异值
        mutation_value = np.random.normal(0, 0.1)
        individual += mutation_value
        # 确保个体值在范围 [min_val, max_val] 内
        individual = max(min_val, min(individual, max_val))
    return individual


# 初始化种群
def initialize_population(population_size, min_val=0, max_val=2):
    return [random.uniform(min_val, max_val) for _ in range(population_size)]


# 遗传算法主函数
def genetic_algorithm(population_size=100, generations=100, elite_rate=0.05, min_val=0, max_val=2):
    population = initialize_population(population_size, min_val, max_val)
    elite_size = int(population_size * elite_rate)
    # 改进的自适应遗传算法参数
    Pc1 = 0.9  # 当个体适应度小于平均适应度时的交叉率
    Pc2 = 0.6  # 当个体适应度大于等于平均适应度时的交叉率
    Pm1 = 0.1  # 当个体适应度小于平均适应度时的变异率
    Pm2 = 0.01  # 当个体适应度大于等于平均适应度时的变异率
    for generation in range(generations):
        fitness_scores = [fitness(ind) for ind in population]
        f_max = max(fitness_scores)
        f_avg = sum(fitness_scores) / len(fitness_scores)
        # 打印当前最优解的信息
        best_individual = population[fitness_scores.index(max(fitness_scores))]
        best_value = fitness(best_individual)
        print(f"Generation {generation}: Best value = {best_value}, Best individual = {best_individual}")
        # 选择新的种群
        new_population = selection(population, fitness_scores, elite_size)
        # 进行交叉和变异操作生成子代
        children = []
        while len(children) < population_size - elite_size:
            parent1 = random.choice(new_population)
            parent2 = random.choice(new_population)
            f1 = fitness(parent1)
            f2 = fitness(parent2)
            f_cross = max(f1, f2)
            # 自适应调整交叉率
            if f_cross >= f_avg:
                Pc = Pc1 - ((Pc1 - Pc2) / (f_max - f_avg)) * (f_cross - f_avg)
            else:
                Pc = Pc1
            # 自适应调整变异率
            f_mutate = fitness(parent1)
            if f_mutate >= f_avg:
                Pm = Pm1 - ((Pm1 - Pm2) / (f_max - f_avg)) * (f_max - f_mutate)
            else:
                Pm = Pm1
            child1, child2 = crossover(parent1, parent2, Pc)
            children.append(mutate(child1, Pm, min_val, max_val))
            children.append(mutate(child2, Pm, min_val, max_val))
        # 确保新种群的大小为 population_size
        new_population = new_population[:elite_size] + children[:population_size - elite_size]
        population = new_population

    # 计算 population 中每个个体的适应度
    fitness_values = list(map(fitness, population))
    # 找到最大适应度的索引
    best_index = fitness_values.index(max(fitness_values))
    # 获取最优个体
    best_individual = population[best_index]
    # 计算最优个体的适应度
    best_value = fitness(best_individual)
    return best_value, best_individual


# 运行遗传算法
best_value, best_individual = genetic_algorithm()
print(f"Best value found: {best_value}")
print(f"Best individual found: {best_individual}")