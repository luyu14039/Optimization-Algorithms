%% 主程序（带实时动画和轨迹线）
clear; clc;

% 参数设置
N = 100;        % 种群规模
dim = 2;        % 二维问题
Max_iter = 500; % 迭代次数
lb = -10;       % 搜索范围
ub = 10;

% 预计算函数曲面
[X,Y] = meshgrid(linspace(lb,ub,1000));
Z = arrayfun(@(x,y) shubert([x y]), X, Y);

% 初始化图形窗口
figure('Position', [100 100 1200 600])
ax1 = subplot(1,2,1,'Parent',gcf);
surf(ax1, X,Y,Z,'EdgeColor','none','FaceAlpha',0.7);
hold(ax1, 'on');
scatter_handle = scatter3(ax1, 0,0,0, 30, 'r','filled');
traj_line = animatedline(ax1, 'Color',[0 1 1 0.6],...
    'LineWidth',1.5, 'Marker','o', 'MarkerSize',4,...
    'MarkerFaceColor','w');
title(ax1,'实时粒子搜索轨迹');
xlabel('x'); ylabel('y'); zlabel('f(x,y)');
view(ax1, -45, 30);
colormap(jet)
colorbar

% 收敛曲线子图
ax2 = subplot(1,2,2);
conv_plot = animatedline(ax2, 'Color','b','LineWidth',1.5);
title(ax2,'收敛曲线');
xlabel('迭代次数'); ylabel('最优适应度');
grid on
axis([0 Max_iter -200 0])

% 运行优化算法（修正后的轨迹记录输出）
[best_pos, best_fit, Convergence_curve, all_positions, best_positions] = parrot_optimizer_animated(N, Max_iter, lb, ub, dim);

% 实时动画显示
for iter = 1:Max_iter
    current_pos = all_positions{iter};
    fitness_vals = shubert(current_pos);
    
    % 更新粒子位置散点图
    set(scatter_handle, 'XData', current_pos(:,1),...
                       'YData', current_pos(:,2),...
                       'ZData', fitness_vals);
    
    % 更新最优轨迹线
    current_best = best_positions{iter};
    best_fitness = shubert(current_best);
    addpoints(traj_line, current_best(1), current_best(2), best_fitness);
    
    % 更新收敛曲线
    addpoints(conv_plot, iter, Convergence_curve(iter));
    
    % 控制动画速度
    drawnow limitrate
    pause(0.05)
end

%% 修正后的PO算法（完整轨迹记录）
function [X_best, f_best, Convergence_curve, all_positions, best_positions] = parrot_optimizer_animated(N, Max_iter, lb, ub, dim)
    % 初始化
    X = initialization(N, dim, ub, lb);
    fitness = shubert(X);
    [f_best, idx] = min(fitness);
    X_best = X(idx,:);
    all_positions = cell(Max_iter,1);  
    best_positions = cell(Max_iter,1);
    
    % 迭代优化
    for t = 1:Max_iter
        X_mean = mean(X, 1);
        all_positions{t} = X;
        best_positions{t} = X_best;
        
        for i = 1:N
            % 随机行为选择
            St = randi([1,4]);
            
            % 行为1：觅食行为
            if St == 1
                beta = 1.5;
                sigma = (gamma(1+beta)*sin(pi*beta/2)/(gamma((1+beta)/2)*beta*2^((beta-1)/2)))^(1/beta);
                u = normrnd(0, sigma, [1,dim]);
                v = normrnd(0, 1, [1,dim]);
                Levy = u./(abs(v).^(1/beta));
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
                    X_new = X(i,:) + factor;
                end
            
            % 行为4：恐惧行为    
            else
                theta = 0.5*pi*t/Max_iter;
                term1 = rand*cos(theta)*(X_best - X(i,:));
                term2 = cos(rand*pi)*(t/Max_iter)^(2/Max_iter)*(X(i,:) - X_best);
                X_new = X(i,:) + term1 - term2;
            end

            % 边界约束
            X_new = min(max(X_new, lb), ub);
            
            % 贪婪选择（新增关键步骤）
            f_new = shubert(X_new);
            if f_new < fitness(i)
                X(i,:) = X_new;
                fitness(i) = f_new;
            end
        end
        
        % 更新全局最优（修正后的逻辑）
        [current_min, idx] = min(fitness);
        if current_min < f_best
            f_best = current_min;
            X_best = X(idx,:);
        end
        
        Convergence_curve(t) = f_best;
    end
end

%% 其他函数保持不变
function y = shubert(x)
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

function X = initialization(N, dim, ub, lb)
    X = rand(N, dim).*(ub - lb) + lb;
end