%% 主程序（带实时动画）
clear; clc;

% 参数设置
N = 250;        % 种群规模（建议调小以提高动画流畅度）
dim = 2;        % 二维问题
Max_iter = 1500; % 迭代次数
lb = -10;       % 搜索范围
ub = 10;

% 预计算函数曲面
[X,Y] = meshgrid(linspace(lb,ub,2500));
Z = arrayfun(@(x,y) shubert([x y]), X, Y);

% 初始化图形窗口
figure('Position', [100 100 1200 600])
ax1 = subplot(1,2,1,'Parent',gcf);
surf(ax1, X,Y,Z,'EdgeColor','none','FaceAlpha',0.7);
hold(ax1, 'on');
scatter_handle = scatter3(ax1, 0,0,0, 30, 'r','filled');
title(ax1,'实时粒子搜索轨迹');
xlabel('x'); ylabel('y'); zlabel('f(x,y)');
view(ax1, 135, -8); % 原代码第19行替换为这个视角
colormap(ax1, parula) % 更改为parula色图增强低值区对比度
colorbar(ax1, 'southoutside') % 将色条移到下方避免遮挡

% 收敛曲线子图
ax2 = subplot(1,2,2);
conv_plot = animatedline(ax2, 'Color','b','LineWidth',1.5);
title(ax2,'收敛曲线');
xlabel('迭代次数'); ylabel('最优适应度');
grid on
axis([0 Max_iter -200 0])

% 运行优化算法（修改后的函数）
[best_pos, best_fit, Convergence_curve, all_positions] = parrot_optimizer_animated(N, Max_iter, lb, ub, dim);

% 生成动画视频（可选）
writerObj = VideoWriter('PO_Animation.mp4','MPEG-4');
open(writerObj);

% 实时动画显示
for iter = 1:Max_iter
    current_pos = all_positions{iter};
    fitness_vals = shubert(current_pos);
    
    % 更新粒子位置散点图
    set(scatter_handle, 'XData', current_pos(:,1),...
                       'YData', current_pos(:,2),...
                       'ZData', fitness_vals);
    
    % 更新收敛曲线
    addpoints(conv_plot, iter, Convergence_curve(iter));
    
    % 捕获视频帧（取消注释保存视频）
    frame = getframe(gcf);
    writeVideo(writerObj, frame);
    
    % 控制动画速度
    drawnow limitrate
    pause(0.05)
end

% 关闭视频写入（取消注释保存视频）
close(writerObj);

%% 修改后的PO算法（带轨迹记录）
function [X_best, f_best, Convergence_curve, all_positions] = parrot_optimizer_animated(N, Max_iter, lb, ub, dim)
    % 初始化
    X = initialization(N, dim, ub, lb);
    fitness = shubert(X);
    [f_best, idx] = min(fitness);
    X_best = X(idx,:);
    all_positions = cell(Max_iter,1);  % 新增轨迹存储
    
    % 迭代优化
    for t = 1:Max_iter
        X_mean = mean(X, 1);
        all_positions{t} = X;  % 记录当前代粒子位置
        
        for i = 1:N
            % 随机行为选择（同原算法）
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
                theta = 0.8*pi*t/Max_iter;
                term1 = rand*cos(theta)*(X_best - X(i,:));
                term2 = cos(rand*pi)*(t/Max_iter)^(2/Max_iter)*(X(i,:) - X_best);
                X_new = X(i,:) + term1 - term2;
            end

            % 边界约束
            X_new = min(max(X_new, lb), ub);
            
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