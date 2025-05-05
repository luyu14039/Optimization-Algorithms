clc
clear
close all
%% 测试代码
%参数设置
pop_size = 50;
c1 = 1.5;
c2 = 1.5;
w = 0.5;
max_iter = 100;
chromosome_size = 4;
X_first = [0 0 0 0];
%问题设置
%假定我只知道x_data和y_data这个数据表（这里数据表是我用二次函数生成的），要用三次函数拟合，也就是把下面0，2，3，1这三个系数搜出来
global x_data y_data
x_data = -1:0.1:1;
y_data = 2.*x_data.^2+3.*x_data+1;
%函数调用
[best_coeffs, best_fitness_history] = PSO(@poly_fitness, pop_size, c1, c2, w, max_iter, chromosome_size, X_first);
%结果输出
fprintf('最优多项式系数: %.4f, %.4f, %.4f, %.4f\n', best_coeffs(1), best_coeffs(2), best_coeffs(3),best_coeffs(4));
%绘图
figure
plot(best_fitness_history)
title('目标函数变化');%可以看出目标函数，也就是误差平方和收敛

figure;
x_fit = linspace(-2, 2, 100);
y_fit = polyval(best_coeffs, x_fit);
plot(x_fit, y_fit,'LineWidth',1.2,'Color','m');
hold on;
scatter(x_data,y_data, 'filled','b');
legend('拟合曲线','散点数据');
title('多项式拟合结果');
xlabel('x');
ylabel('y');

%% PSO  用于目标函数最小值搜索
% fitness: 目标函数调用名，用于计算每个粒子的适应度值。
% pop_size: 粒子群的大小，即粒子（或解）的数量。
% c1: 认知学习因子，控制粒子向自身历史最优位置移动的速度权重。
% c2: 社会学习因子，控制粒子向群体历史最优位置移动的速度权重。
% w: 惯性权重，控制粒子保持原来速度的倾向。
% max_iter: 最大迭代次数，即算法运行的总轮数。
% chromosome_size: 每个粒子的维度，即解向量的大小。
% X_first: 初始位置的范围或均值，以及随机扰动的基数
function [best_coeffs, best_fitness_history] = PSO(fitness, pop_size, c1, c2, w, max_iter, chromosome_size, X_first)
    % 初始化粒子位置和速度矩阵
    x = zeros(pop_size, chromosome_size);
    v = zeros(pop_size, chromosome_size);

    % 赋初值
    for i = 1: pop_size
        for j = 1: chromosome_size
            x(i, j) = X_first(j) + X_first(j) * 0.05 * randn(1, 1);
            v(i, j) = randn(1, 1);
        end
    end

    % 初始化个体历史最优位置和适应度值
    p = zeros(pop_size, 1);
    local = x;
    for i = 1: pop_size
        p(i) = fitness(x(i, :));
    end

    % 寻找初始全局最优位置
    [~, best_index] = min(p);
    best = x(best_index, :);

    % 迭代过程
    best_fitness_history = zeros(max_iter, 1);
    for epoch = 1: max_iter
        for i = 1: pop_size
            % 更新速度
            r1 = rand(size(x(i, :)));
            r2 = rand(size(x(i, :)));
            v(i, :) = w * v(i, :) + c1 * r1.* (local(i, :) - x(i, :)) + c2 * r2.* (best - x(i, :));
            % 更新位置
            x(i, :) = x(i, :) + v(i, :);

            % 更新个体历史最优位置
            current_fitness = fitness(x(i, :));
            if current_fitness < p(i)
                p(i) = current_fitness;
                local(i, :) = x(i, :);
            end

            % 更新全局最优位置
            if p(i) < fitness(best)
                best = local(i, :);
            end
        end
        best_fitness_history(epoch) = fitness(best);
        disp(epoch);
    end

    % 输出结果
    disp('目标函数取最小值时的自变量:');
    best_coeffs = best';
    disp('目标函数取最小值:');
    final_fitness = fitness(best);
end

% 待优化函数，计算多项式与给定数据点的误差平方和
function fitness = poly_fitness(coeffs)
    global x_data y_data
    y_pred = polyval(coeffs, x_data);
    fitness = sum((y_pred - y_data).^2);
end