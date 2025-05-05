import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
from scipy.special import gamma
import time


# 目标函数 Shubert
def shubert(x):
    t1 = np.zeros(x.shape[0])
    t2 = np.zeros(x.shape[0])
    for i in range(1, 6):
        t1 += i * np.cos((i + 1) * x[:, 0] + i)
        t2 += i * np.cos((i + 1) * x[:, 1] + i)
    return t1 * t2


# 种群初始化
def initialization(N, dim, lb, ub):
    return np.random.uniform(lb, ub, size=(N, dim))


# 改进的鹦鹉优化算法（带轨迹记录）
def parrot_optimizer_animated(N, Max_iter, lb, ub, dim):
    # 初始化
    X = initialization(N, dim, lb, ub)
    fitness = shubert(X)
    f_best = np.min(fitness)
    idx = np.argmin(fitness)
    X_best = X[idx, :]
    all_positions = []
    Convergence_curve = np.zeros(Max_iter)

    for t in range(Max_iter):
        X_mean = np.mean(X, axis=0)
        all_positions.append(X.copy())

        for i in range(N):
            St = np.random.randint(1, 5)  # 1-4

            if St == 1:  # 觅食行为
                beta = 1.5
                sigma = (gamma(1 + beta) * np.sin(np.pi * beta / 2) / (
                            gamma((1 + beta) / 2) * beta * 2 ** ((beta - 1) / 2))) ** (1 / beta)
                u = np.random.normal(0, sigma, dim)
                v = np.random.normal(0, 1, dim)
                Levy = u / np.abs(v) ** (1 / beta)
                step = np.random.rand() * (1 - (t + 1) / Max_iter) ** (2 * (t + 1) / Max_iter)
                X_new = (X[i] - X_best) * Levy + step * X_mean

            elif St == 2:  # 停留行为
                beta = 1.5
                sigma = (gamma(1 + beta) * np.sin(np.pi * beta / 2) / (
                            gamma((1 + beta) / 2) * beta * 2 ** ((beta - 1) / 2))) ** (1 / beta)
                u = np.random.normal(0, sigma, dim)
                v = np.random.normal(0, 1, dim)
                Levy = u / np.abs(v) ** (1 / beta)
                X_new = X[i] + X_best * Levy + np.random.rand(dim)

            elif St == 3:  # 交流行为
                if np.random.rand() <= 0.5:
                    factor = 0.2 * np.random.rand() * (1 - (t + 1) / Max_iter)
                    X_new = factor * (X[i] - X_mean)
                else:
                    factor = 0.2 * np.random.rand(dim) * np.exp(-(t + 1) / (np.random.rand(dim) * Max_iter))
                    X_new = X[i] + factor

            else:  # 恐惧行为
                theta = 0.5 * np.pi * (t + 1) / Max_iter
                term1 = np.random.rand() * np.cos(theta) * (X_best - X[i])
                term2 = np.cos(np.random.rand() * np.pi) * ((t + 1) / Max_iter) ** (2 / Max_iter) * (X[i] - X_best)
                X_new = X[i] + term1 - term2

            # 边界处理
            X_new = np.clip(X_new, lb, ub)

            # 贪婪选择
            f_new = shubert(X_new.reshape(1, -1))[0]
            if f_new < fitness[i]:
                X[i] = X_new
                fitness[i] = f_new

        # 更新全局最优
        current_min = np.min(fitness)
        if current_min < f_best:
            f_best = current_min
            idx = np.argmin(fitness)
            X_best = X[idx].copy()

        Convergence_curve[t] = f_best

    return X_best, f_best, Convergence_curve, all_positions


# 主程序
if __name__ == "__main__":
    # 参数设置
    N = 100  # 种群规模（适当减小以提高性能）
    Max_iter = 50  # 迭代次数
    lb, ub = -10, 10
    dim = 2

    # 预计算函数曲面（适当降低分辨率）
    x = np.linspace(lb, ub, 500)
    y = np.linspace(lb, ub, 500)
    X_grid, Y_grid = np.meshgrid(x, y)
    points = np.column_stack((X_grid.ravel(), Y_grid.ravel()))
    Z = shubert(points).reshape(X_grid.shape)

    # 初始化图形界面
    plt.ion()
    fig = plt.figure(figsize=(12, 6))

    # 3D曲面子图
    ax1 = fig.add_subplot(121, projection='3d')
    surf = ax1.plot_surface(X_grid, Y_grid, Z, cmap='jet',
                            rstride=2, cstride=2, alpha=0.6,
                            antialiased=False)
    scat = ax1.scatter([], [], [], s=30, c='r', alpha=0.8)
    ax1.set_title('Real-time Particle Trajectory')
    ax1.set_xlabel('x')
    ax1.set_ylabel('y')
    ax1.set_zlabel('f(x,y)')
    ax1.view_init(elev=30, azim=-45)
    fig.colorbar(surf, ax=ax1, shrink=0.6)

    # 收敛曲线子图
    ax2 = fig.add_subplot(122)
    line, = ax2.plot([], [], 'b-', linewidth=1.5)
    ax2.set_title('Convergence Curve')
    ax2.set_xlabel('Iteration')
    ax2.set_ylabel('Best Fitness')
    ax2.grid(True)
    ax2.set_xlim(0, Max_iter)
    ax2.set_ylim(-200, 0)

    # 运行优化算法
    start_time = time.time()
    X_best, best_fit, conv_curve, all_positions = parrot_optimizer_animated(
        N, Max_iter, lb, ub, dim)
    print(f"Optimization completed in {time.time() - start_time:.2f}s")

    # 动画更新
    for t in range(Max_iter):
        current_pos = all_positions[t]
        fitness_vals = shubert(current_pos)

        # 更新3D散点
        scat._offsets3d = (current_pos[:, 0], current_pos[:, 1], fitness_vals)

        # 更新收敛曲线
        line.set_data(np.arange(t + 1), conv_curve[:t + 1])

        # 调整视图
        fig.canvas.draw()
        fig.canvas.flush_events()

        # 控制动画速度
        plt.pause(0.05)

    plt.ioff()
    plt.show()