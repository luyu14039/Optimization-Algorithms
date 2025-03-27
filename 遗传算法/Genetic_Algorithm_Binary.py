import random
import math


# 定义适应度函数
def fitness(individual):
    # 将二进制表示的个体转换为十进制数
    x = int(''.join(map(str, individual)), 2)
    return x ** 2


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


# 交叉操作（单点交叉）
def crossover(parent1, parent2):
    point = random.randint(1, len(parent1) - 1)
    child1 = parent1[:point] + parent2[point:]
    child2 = parent2[:point] + parent1[point:]
    return child1, child2


# 变异操作
def mutate(individual, mutation_rate=0.01):
    for i in range(len(individual)):
        if random.random() < mutation_rate:
            individual[i] = 1 - individual[i]
    return individual


# 初始化种群
def initialize_population(pop_size, gene_length):
    return [[random.randint(0, 1) for _ in range(gene_length)] for _ in range(pop_size)]


# 遗传算法主函数
def genetic_algorithm(pop_size=20, gene_length=5, generations=100, mutation_rate=0.01, elite_rate=0.05):
    population = initialize_population(pop_size, gene_length)
    elite_size = int(pop_size * elite_rate)
    for generation in range(generations):
        fitness_scores = [fitness(ind) for ind in population]

        # 打印当前最优解的信息
        best_individual = population[fitness_scores.index(max(fitness_scores))]
        best_value = fitness(best_individual)
        print(f"Generation {generation}: Best value = {best_value}, Best individual = {best_individual}")

        # 选择新的种群
        new_population = selection(population, fitness_scores, elite_size)

        # 进行交叉和变异操作生成子代
        children = []
        while len(children) < pop_size - elite_size:
            parent1 = random.choice(new_population)
            parent2 = random.choice(new_population)
            child1, child2 = crossover(parent1, parent2)
            children.append(mutate(child1, mutation_rate))
            children.append(mutate(child2, mutation_rate))

        # 确保新种群的大小为 pop_size
        new_population = new_population[:elite_size] + children[:pop_size - elite_size]

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
print(f"Decoded value: {int(''.join(map(str, best_individual)), 2)}")