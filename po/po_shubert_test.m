%% 主程序
clear; clc;

% 参数设置
N = 500;        % 种群规模（扩大以覆盖多峰）
dim = 2;        % 二维问题
Max_iter = 500; % 增加迭代次数
lb = -10;       % 标准搜索范围
ub = 10; 

% 运行PO算法
[best_pos, best_fit, Convergence_curve] = parrot_optimizer(N, Max_iter, lb, ub, dim);

% 结果展示
disp(['最优坐标: [', num2str(best_pos), ']']);
disp(['最小适应度: ', num2str(best_fit)]);

% 绘制三维函数曲面与粒子轨迹
[X,Y] = meshgrid(-10:0.1:10);
Z = shubert([X(:), Y(:)]);
Z = reshape(Z, size(X));
figure;
surf(X,Y,Z); hold on;
scatter3(best_pos(1), best_pos(2), best_fit, 100, 'r*'); 
title('Shubert函数优化结果');
xlabel('x'); ylabel('y'); zlabel('f(x,y)');

%% 鹦鹉优化器核心函数
function [X_best, f_best, Convergence_curve] = parrot_optimizer(N, Max_iter, lb, ub, dim)
    % 初始化种群
    X = initialization(N, dim, ub, lb);
    fitness = shubert(X);  % 计算初始适应度
    
    % 记录最优解
    [f_best, idx] = min(fitness);
    X_best = X(idx,:);
    Convergence_curve = zeros(1, Max_iter);
    
    % 迭代优化
    for t = 1:Max_iter
        X_mean = mean(X, 1);  % 种群平均位置
        
        for i = 1:N
            % 随机选择行为模式 (1:觅食, 2:停留, 3:交流, 4:恐惧)
            St = randi([1,4]);
            
            % 行为1：觅食行为
            if St == 1
                beta = 1.5;  % Levy指数
                sigma = (gamma(1+beta)*sin(pi*beta/2)/(gamma((1+beta)/2)*beta*2^((beta-1)/2)))^(1/beta);
                u = normrnd(0, sigma, [1,dim]);
                v = normrnd(0, 1, [1,dim]);
                Levy = u./(abs(v).^(1/beta));  % Levy飞行向量
                
                step = rand*(1 - t/Max_iter)^(2*t/Max_iter);
                X_new = (X(i,:) - X_best).*Levy + step*X_mean;
            
            % 行为2：停留行为    
            elseif St == 2
                beta = 1.5;
                sigma = (gamma(1+beta)*sin(pi*beta/2)/(gamma((1+beta)/2)*beta*2^((beta-1)/2)))^(1/beta);
                u = normrnd(0, sigma, [1,dim]);
                v = normrnd(0, 1, [1,dim]);
                Levy = u./(abs(v).^(1/beta));
                
                X_new = X(i,:) + X_best.*Levy + rand(1,dim);
            
            % 行为3：交流行为    
            elseif St == 3
                if rand <= 0.5
                    factor = 0.2*rand*(1 - t/Max_iter);
                    X_new = factor*(X(i,:) - X_mean);
                else
                    factor = 0.2 * rand(1,dim) .* exp(-t./(rand(1,dim)*Max_iter));
                    X_new = X(i,:) + factor;  % 添加随机扰动向量
                end
            
            % 行为4：恐惧行为    
            else
                theta = 0.5*pi*t/Max_iter;
                term1 = rand*cos(theta)*(X_best - X(i,:));
                term2 = cos(rand*pi)*(t/Max_iter)^(2/Max_iter)*(X(i,:) - X_best);
                X_new = X(i,:) + term1 - term2;
            end
            
            % 边界约束处理
            X_new = max(X_new, lb);
            X_new = min(X_new, ub);
            
            % 贪婪选择
            f_new = shubert(X_new);
            if f_new < fitness(i)
                X(i,:) = X_new;
                fitness(i) = f_new;
            end
        end
        
        % 更新全局最优
        [current_min, idx] = min(fitness);
        if current_min < f_best
            f_best = current_min;
            X_best = X(idx,:);
        end
        
        % 记录收敛曲线
        Convergence_curve(t) = f_best;
    end
end

%% Shubert目标函数
function y = shubert(x)
    % 输入：x为N×2矩阵，每行代表一个个体（二维）
    % 输出：N×1向量，每个个体的适应度值
    [N, ~] = size(x);
    y = zeros(N,1);
    for k = 1:N
        t1 = 0; t2 = 0;
        for i = 1:5
            t1 = t1 + i * cos((i+1)*x(k,1) + i);
            t2 = t2 + i * cos((i+1)*x(k,2) + i);
        end
        y(k) = t1 * t2;
    end
end
%% 种群初始化函数
function X = initialization(N, dim, ub, lb)
    % 生成均匀分布的初始种群
    X = rand(N, dim).*(ub - lb) + lb;
end