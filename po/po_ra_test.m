%% 主程序
clear; clc;

% 参数设置
N = 500;         % 种群规模
dim = 2;       % 问题维度
Max_iter = 5;% 最大迭代次数
lb = -5.12;     % 搜索下界
ub = 5.12;      % 搜索上界
X_list = [];

% 运行PO算法
[best_pos, best_fit, Convergence_curve, X_list] = parrot_optimizer(N, Max_iter, lb, ub, dim);

% 展示最终粒子群聚集情况
figure
scatter(X_list(:,1), X_list(:,2), 'filled', 'MarkerFaceColor', 'b');

% 结果展示
disp(['最优解: ', num2str(best_pos)]);
disp(['最小适应度: ', num2str(best_fit)]);
figure;
plot(Convergence_curve);
title('收敛曲线');
xlabel('迭代次数');
ylabel('适应度值');

%% 鹦鹉优化器核心函数
function [X_best, f_best, Convergence_curve,X_list] = parrot_optimizer(N, Max_iter, lb, ub, dim)
    % 初始化种群
    X = initialization(N, dim, ub, lb);
    fitness = rastrigin(X);  % 计算初始适应度
    
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
                theta = 0.25*pi*t/Max_iter;
                term1 = rand*cos(theta)*(X_best - X(i,:));
                term2 = cos(rand*pi)*(t/Max_iter)^(2/Max_iter)*(X(i,:) - X_best);
                X_new = X(i,:) + term1 - term2;
            end
            
            % 边界约束处理
            X_new = max(X_new, lb);
            X_new = min(X_new, ub);
            
            % 贪婪选择
            f_new = rastrigin(X_new);
            if f_new < fitness(i)
                X(i,:) = X_new;
                fitness(i) = f_new;
            end
        end
        X_list = X;
        
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



%% Rastrigin目标函数
function y = rastrigin(x)
    % 输入：x为N×dim矩阵，每行代表一个个体
    % 输出：N×1向量，每个个体的适应度值
    y = sum(x.^2 - 10*cos(2*pi*x) + 10, 2);
end

%% 种群初始化函数
function X = initialization(N, dim, ub, lb)
    % 生成均匀分布的初始种群
    X = rand(N, dim).*(ub - lb) + lb;
end