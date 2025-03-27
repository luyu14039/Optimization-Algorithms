clc,clear,close all
warning off;
format longG;


% 启动计时器
tic;

%% %%%%%%  萤火虫参数设置 %%%%%% %%
% 最大迭代次数
MaxGen = 5000;

% 当前迭代次数
t = 0;

% 问题维度
Dim = 2;

% 种群数量
PopSize = 20;

% 步长因子
alpha = 0.5;

% 初始吸引度
beta0 = 1.0;

% 萤火虫个体位置（解）上下界
ub = 10;
lb = -10;

% 光吸收系数
gamma = 1.0 / (ub-lb)^2;

% 初始化种群
PopSolution = unifrnd(lb, ub, [PopSize Dim]);

% 评估适应值
Light = Sphere(PopSolution);

% 记录最优值
[GBestFitness, GBestIndex]=min(Light);
GBestSolution = PopSolution(GBestIndex, :);

% 记录每一代最优值
GBestFitness_It = zeros(1, MaxGen);

%% %%%%%%%% 迭代开始 %%%%%%%% %%
% FA主体开始
while t < MaxGen
    t = t + 1;
    
    % 自适应步长因子
    alpha = ( 1 - t / MaxGen ) * alpha;
    
    % for i start
    for i = 1:PopSize
        % for j start
        for j = 1:PopSize
            % if j ~= i start
            if j ~= i
                % if 适应值 start
                if Light(j, 1) < Light(i, 1)
                    % 个体之间距离
                    r_ij = norm(PopSolution(i, :) - PopSolution(j, :));
                    
                    % 吸引度
                    rand1= unifrnd(0, 1);
                    rand2 = unifrnd(0, 1);
                    if rand2 < 0.5
                        beta0 = rand1;
                    end
                    beta = beta0 * exp(-gamma * r_ij ^ 2);
                    
                    % 更新种群
                    PopSolution(i, :) = PopSolution(i, :) + beta .* ( PopSolution(j, :) - PopSolution(i, :) ) + alpha .* (rand(1, Dim) - 0.5);
                    
                    % 边界处理
                    PopSolution(i, :) = max(PopSolution(i, :), lb);
                    PopSolution(i, :) = min(PopSolution(i, :), ub);
                    
                    % 重新评估适应值
                    Light(i, 1) = Sphere(PopSolution(i, :));
                 
                end
                % if 适应值 end
            end
            % if j ~= i start
        end
        % for j end
    end
    % for i end
    
    % 记录最优
    [CBestFitness, CBestIndex] = min(Light);
    if CBestFitness < GBestFitness
        GBestFitness = CBestFitness;
        GBestSolution = PopSolution(CBestIndex, :);
    end
    
    % 输出每一次迭代最优值
    fprintf('第%d代，最优值：%d\n', t, GBestFitness);
    
    % 记录每一代最优值
    GBestFitness_It(1, t) = GBestFitness;

end
% FA主体结束

% 画图
figure
x = 1:MaxGen;
y = GBestFitness_It;
plot(x, y, 'LineWidth', 1.5);
xlabel('Iteration', 'Fontname', 'Times New Roman', 'FontSize', 12);
ylabel('Best Fitness', 'Fontname', 'Times New Roman', 'FontSize', 12);

% 记录程序运行时间
CPUTime   = toc;











