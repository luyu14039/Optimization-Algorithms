import random
import numpy as np
import matplotlib.pyplot as plt
import time


def my_function():
    for i in range(1000000):
        pass


# 记录开始时间
start_time = time.time()


# 调用函数
my_function()


# 计算两个城市之间的距离，假设城市坐标存储在 cities 中
def distance(city1, city2):
    return np.sqrt((city1[0] - city2[0]) ** 2 + (city1[1] - city2[1]) ** 2)


# 适应度函数，使用总路程的倒数作为适应度
def fitness(individual, adj_matrix):
    total_distance = 0
    for i in range(len(individual) - 1):
        total_distance += adj_matrix[individual[i]][individual[i + 1]]
    total_distance += adj_matrix[individual[-1]][individual[0]]  # 回到起点
    return 1 / total_distance


# 选择操作（轮盘赌选择 + 精英选择）
def selection(population, fitness_scores, elite_size, adj_matrix):
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


# 顺序交叉 (Order Crossover, OX)
def crossover(parent1, parent2):
    size = len(parent1)
    start, end = sorted(random.sample(range(size), 2))
    child1 = [-1] * size
    child2 = [-1] * size
    # 先复制交叉部分
    for i in range(start, end):
        child1[i] = parent1[i]
        child2[i] = parent2[i]
    index1 = end % size
    index2 = end % size
    # 填充未交叉部分
    for i in range(size):
        if parent2[i] not in child1:
            child1[index1] = parent2[i]
            index1 = (index1 + 1) % size
        if parent1[i] not in child2:
            child2[index2] = parent1[i]
            index2 = (index2 + 1) % size
    # 增加扰动操作，避免局部最优
    if random.random() < 0.1:  # 10% 的概率进行扰动
        perturb_index1, perturb_index2 = random.sample(range(size), 2)
        child1[perturb_index1], child1[perturb_index2] = child1[perturb_index2], child1[perturb_index1]
        perturb_index1, perturb_index2 = random.sample(range(size), 2)
        child2[perturb_index1], child2[perturb_index2] = child2[perturb_index2], child2[perturb_index1]
    return child1, child2


# 高斯变异
def mutate(individual):
    mu = 0  # 均值
    sigma = 0.1  # 标准差
    for i in range(len(individual)):
        # 对每个位置的值添加高斯噪声
        noise = np.random.normal(mu, sigma)
        individual[i] += noise
        individual[i] = int(round(individual[i]))  # 将元素转换为最接近的整数
    return individual


# 初始化种群，生成随机的城市排列
def initialize_population(population_size, num_cities):
    population = []
    for _ in range(population_size):
        individual = list(range(num_cities))
        random.shuffle(individual)
        population.append(individual)
    return population


# 遗传算法主函数
def genetic_algorithm(population_size=1000, generations=100, elite_rate=0.2, num_cities=20):
    cities = [[60, 200], [180, 200], [80, 180], [140, 180], [20, 160],
             [100, 160], [200, 160], [140, 140], [40, 120], [100, 120],
             [180, 100], [60, 80], [120, 80], [180, 60], [20, 40],
             [100, 40], [200, 40], [20, 20], [60, 20], [160, 20]]
    # 构建邻接矩阵
    adj_matrix = np.zeros((num_cities, num_cities))
    for i in range(num_cities):
        for j in range(num_cities):
            adj_matrix[i][j] = distance(cities[i], cities[j])

    population = initialize_population(population_size, num_cities)
    elite_size = int(population_size * elite_rate)
    for generation in range(generations):
        fitness_scores = [fitness(ind, adj_matrix) for ind in population]
        f_max = max(fitness_scores)
        f_avg = sum(fitness_scores) / len(fitness_scores)
        # 打印当前最优解的信息
        best_individual = population[fitness_scores.index(max(fitness_scores))]
        best_value = 1 / fitness(best_individual, adj_matrix)
        print(f"Generation {generation}: Best value = {best_value}, Best individual = {best_individual}")
        # 选择新的种群
        new_population = selection(population, fitness_scores, elite_size, adj_matrix)
        # 进行交叉和变异操作生成子代
        children = []
        while len(children) < population_size - elite_size:
            parent1 = random.choice(new_population)
            parent2 = random.choice(new_population)
            child1, child2 = crossover(parent1, parent2)
            children.append(mutate(child1))
            children.append(mutate(child2))
        # 确保新种群的大小为 population_size
        new_population = new_population[:elite_size] + children[:population_size - elite_size]
        population = new_population

    # 计算 population 中每个个体的适应度
    fitness_values = [fitness(ind, adj_matrix) for ind in population]
    # 找到最大适应度的索引
    best_index = fitness_values.index(max(fitness_values))
    # 获取最优个体
    best_individual = population[best_index]
    # 计算最优个体的适应度
    best_value = 1 / fitness(best_individual, adj_matrix)
    return best_value, best_individual


# 运行遗传算法
best_value, best_individual = genetic_algorithm()
print(f"Best value found: {best_value}")
print(f"Best individual found: {best_individual}")
# 记录结束时间
end_time = time.time()

# 计算运行时间
run_time = end_time - start_time
print(f"函数运行时间：{run_time} 秒")

# 可视化最优路径
cities = [[60, 200], [180, 200], [80, 180], [140, 180], [20, 160],
         [100, 160], [200, 160], [140, 140], [40, 120], [100, 120],
         [180, 100], [60, 80], [120, 80], [180, 60], [20, 40],
         [100, 40], [200, 40], [20, 20], [60, 20], [160, 20]]
best_path = [cities[i] for i in best_individual] + [cities[best_individual[0]]]
plt.figure(figsize=(8, 6))
plt.plot(*zip(*best_path), marker='o', markersize=8, linestyle='-')
plt.show()

print("Hello, GPT-4!")