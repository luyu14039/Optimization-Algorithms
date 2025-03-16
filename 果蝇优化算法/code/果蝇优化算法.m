%% 清空环境变量
clc;
clear;
close all;

%% 根据需要手动修改
dim = 5; % 变量的维度
maxgen = 20000; % 迭代次数（根据需要修改）
sizepop = 2000; % 种群规模
Fitness = @(x) sum(100*(x(2:end) - x(1:end-1).^2).^2 + (1 - x(1:end-1)).^2); % 定义适应度函数
%如：二维的 Rastrigin 三角函数 Fitness = @(x) 20 + x(1)^2 - 10*cos(2*pi*x(1)) + x(2)^2 - 10*cos(2*pi*x(2));
%如：三维 Ackley 函数 Fitness = @(x) -20*exp(-0.2*sqrt((x(1)^2 + x(2)^2 + x(3)^2)/3)) - exp((cos(2*pi*x(1)) + cos(2*pi*x(2)) + cos(2*pi*x(3)))/3) + 20 + exp(1);
a = 2; % 范围下限（根据需要修改）
b = 8; % 范围上限（根据需要修改）
X_axis = a + (b - a)*rand(1, dim);% 随机初始化果蝇群体位置

%% 个体和速度最大和最小值
for i = 1:sizepop
    % 随机方向与距离
    X(i, :) = X_axis + 2*rand(1, dim)-1;
    % 距离和气味浓度
    D(i) = sqrt(sum(X(i, :).^2));
    S(i, :) = 1./D(i);
    % 适应度函数
    Smell(i) = Fitness(S(i, :));
end

% 找出此果蝇群体中味道浓度最低的果蝇(求极小值)
[bestSmell, bestindex] = min(Smell);
% 最佳气味浓度、果蝇位置、适应度最优位置
X_axis = X(bestindex, :);
Smellbest = bestSmell;
FXbest = S(bestindex, :);

%% 果蝇迭代寻优
for gen = 1:maxgen
    % 粒子位置和速度更新
    for i = 1:sizepop
        X(i, :) = X_axis + 2*rand(1, dim)-1;
        X(i, :) = max(min(X(i, :), b), a);
        D(i) = sqrt(sum(X(i, :).^2));
        S(i, :) = 1./D(i);
        % 适应度函数
        Smell(i) = Fitness(S(i, :));
    end
    % 根据气味浓度值寻找极值
    [bestSmell, bestindex] = min(Smell);
    % 保留最佳值位置
    if bestSmell < Smellbest
        X_axis = X(bestindex, :);
        Smellbest = bestSmell;
        FXbest = S(bestindex, :);
    end
    % 每代最优Smell值记录到yy数组中，并记录最优迭代坐标
    yy(gen) = Smellbest;
    Xbest(gen, :) = X_axis;
end

%% 结果显示
disp(['适应度函数最优位置：', num2str(FXbest)]);
disp(['适应度函数最优解：', num2str(yy(end))]);

%% 绘制迭代味道浓度与果蝇飞行路径趋势图
figure(1);
plot(yy, 'r', 'linewidth', 2);
title('优化过程', 'fontsize', 12)
xlabel('迭代次数', 'fontsize', 12); 
ylabel('气味浓度(适应度值)', 'fontsize', 12);

% 由于维度可能大于 2，无法直接绘制果蝇飞行路径，这里可以考虑绘制部分维度的投影
if dim >= 2
    figure(2);
    gen = 1:maxgen;
    plot(Xbest(:, 1), Xbest(:, 2), 'r.'); % 绘制前两个维度的投影
    title('果蝇优化算法寻优路线（前两个维度投影）', 'fontsize',14)
    xlabel('X_1-axis', 'fontsize', 12); 
    ylabel('X_2-axis', 'fontsize', 12);
end