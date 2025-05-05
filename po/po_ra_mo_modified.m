%% 主程序
clear; clc;

% 参数设置
N           = 15000;        % 种群规模
dim         = 2;            % 问题维度
Max_iter    = 5;            % 常规迭代次数
Max_son_iter= 200;          % 子种群优化迭代次数
K           = 5;            % 初始聚类数
K_son       = 2;            % 子类聚类数
SM_bound    = 0.05;         % 稳定性阈值
bounds      = [-1.12,1.12;-1.12,1.12];
behavior_weights = [0.25, 0.25, 0.25, 0.25];  % 行为权重
delta       = 0.2;%距离条件

% 运行PO算法
Archive = mo_parrot_optimizer(@rastrigin, N, Max_iter, Max_son_iter, bounds, dim, K, K_son, delta, SM_bound, behavior_weights);
disp('找到的多模态最优解：');
disp(Archive);

%% 鹦鹉优化器核心函数
function [Archive] = mo_parrot_optimizer(fitness, N, Max_iter, Max_son_iter, bounds, dim, K, K_son, delta, SM_bound, behavior_weights)
Archive = [];
% 初始化种群
X = initialize_population(N, dim, bounds);
[normalized_optimized_pop, scaling_params] = normalize_data(X, bounds);

% 初始聚类
Centers = CenterFind(normalized_optimized_pop', K);
Result = Kmeans_plus(normalized_optimized_pop', K, Centers);
populations = split_population(X, Result.label);

while true
    new_populations = {};
    all_stable = true;

    for i = 1:length(populations)
        current_pop = populations{i};
        if isempty(current_pop)
            continue;
        end

        % 子种群优化
        [optimized_pop, is_converged] = PO_MO_partial(fitness, current_pop, Max_iter, bounds, behavior_weights);

        % 收敛处理
        if is_converged
            Archive = add_to_archive(Archive, optimized_pop(1,:), delta, bounds, fitness);
            continue;
        end

        % 稳定性分析
        [normalized_optimized_pop, ~] = normalize_data(optimized_pop, bounds);
        [normalized_current_pop, ~] = normalize_data(current_pop, bounds);
        SM = evaluate_population(fitness, optimized_pop, current_pop);

        % 存档处理
        if SM < SM_bound
            [optimized_pop, ~] = PO_MO_partial(fitness, optimized_pop, Max_son_iter, bounds, behavior_weights);
            [~, idx] = min(arrayfun(@(k) fitness(optimized_pop(k,:)), 1:size(optimized_pop,1)));
            Archive = add_to_archive(Archive, optimized_pop(idx,:), delta, bounds, fitness);
        else
            % 二次聚类
            all_stable = false;
            if size(normalized_optimized_pop,1) >= 2
                Centers = CenterFind(normalized_optimized_pop', K_son);
                Result = Kmeans_plus(normalized_optimized_pop', K_son, Centers);
                sub_pops = split_population(optimized_pop, Result.label);
                new_populations = [new_populations, sub_pops];
            end
        end
    end

    % 种群更新
    if ~isempty(new_populations)
        populations = new_populations;
    elseif all_stable
        break;
    end
end
end

%% Rastrigin目标函数
function y = rastrigin(x)
y = -sum(x.^2 - 10*cos(2*pi*x) + 10, 2);
end

%% 种群初始化函数
function pop = initialize_population(pop_size, dim, bounds)
pop = zeros(pop_size, dim);
for i = 1:pop_size
    pop(i,:) = bounds(:,1)' + (bounds(:,2)-bounds(:,1))'.*rand(1,dim);
end
end

%% 数据标准化函数
function [normalized_data, scaling_params] = normalize_data(data, bounds)
scaling_params.min = bounds(:,1)';
scaling_params.range = bounds(:,2)' - bounds(:,1)';
normalized_data = (data - scaling_params.min) ./ scaling_params.range;
end

%% 数据反标准化函数
function original_data = denormalize_data(normalized_data, scaling_params)
original_data = normalized_data .* scaling_params.range + scaling_params.min;
end

%% 聚类中心选择
function Centers = CenterFind(Datas, K)
[dim, Num] = size(Datas);
Centers = zeros(dim, K);
first_idx = randi(Num);
Centers(:,1) = Datas(:,first_idx);

for k = 2:K
    D = pdist2(Datas', Centers(:,1:k-1)').^2;
    min_D = min(D, [], 2);

    if sum(min_D) == 0
        Centers(:,k) = Datas(:,randi(Num));
    else
        prob = min_D / sum(min_D);
        next_idx = randsample(Num, 1, true, prob);
        Centers(:,k) = Datas(:,next_idx);
    end
end
end

%% Kmeans++聚类
function Result = Kmeans_plus(Datas, K, Centers)
[dim, Num] = size(Datas);
labels = ones(Num, 1);
max_iter = 100;

for iter = 1:max_iter
    D = pdist2(Datas', Centers');
    [~, new_labels] = min(D, [], 2);

    if isequal(new_labels, labels)
        break;
    end

    labels = new_labels;

    for k = 1:K
        cluster_points = Datas(:, labels == k);
        if isempty(cluster_points)
            Centers(:,k) = Datas(:,randi(Num));
        else
            Centers(:,k) = mean(cluster_points, 2);
        end
    end
end

Result.label = labels;
Result.Center = Centers;
end

%% 种群分割函数
function sub_pops = split_population(pop, labels)
unique_labels = unique(labels);
sub_pops = cell(1, length(unique_labels));
for i = 1:length(unique_labels)
    sub_pops{i} = pop(labels == unique_labels(i), :);
end
end

%% 并行PO优化函数
function [optimized_pop, is_converged] = PO_MO_partial(fitness, pop, max_iter, bounds, behavior_weights)
if nargin < 5 || isempty(behavior_weights)
    behavior_weights = [0.25, 0.25, 0.25, 0.25];
else
    behavior_weights = behavior_weights / sum(behavior_weights);
end

is_converged = false;
pop_size = size(pop,1);
dim = size(pop,2);
X = pop;

% 初始适应度计算
fitness_values = arrayfun(@(k) fitness(X(k,:)), 1:pop_size);
[f_best, idx] = min(fitness_values);
X_best = X(idx,:);

% 边界参数
lb = bounds(:,1)';
ub = bounds(:,2)';

% 权重预计算
cumulative_weights = cumsum(behavior_weights);

for epoch = 1:max_iter
    % 收敛检测
    if all(abs(X - X(1,:)) < 1e-6, 'all')
        optimized_pop = X(1,:);
        is_converged = true;
        return;
    end

    X_mean = mean(X, 1);
    current_X_best = X_best;
    current_X_mean = X_mean;

    % 并行更新
    par_X = X;
    par_fitness_values = fitness_values;

    parfor i = 1:pop_size
        x_i = par_X(i,:);
        current_fitness_i = par_fitness_values(i);

        % 行为选择
        rand_val = rand;
        St = find(rand_val <= cumulative_weights, 1, 'first');

        % 更新规则
        if St == 1
            beta = 1.5;
            sigma = (gamma(1+beta)*sin(pi*beta/2)/(gamma((1+beta)/2)*beta*2^((beta-1)/2)))^(1/beta);
            u = normrnd(0, sigma, [1,dim]);
            v = normrnd(0, 1, [1,dim]);
            Levy = u./(abs(v).^(1/beta));
            step = rand*(1 - epoch/max_iter)^(2*epoch/max_iter);
            X_new = (x_i - current_X_best).*Levy + step*current_X_mean;

        elseif St == 2
            beta = 1.5;
            sigma = (gamma(1+beta)*sin(pi*beta/2)/(gamma((1+beta)/2)*beta*2^((beta-1)/2)))^(1/beta);
            u = normrnd(0, sigma, [1,dim]);
            v = normrnd(0, 1, [1,dim]);
            Levy = u./(abs(v).^(1/beta));
            X_new = x_i + current_X_best.*Levy + rand(1,dim);

        elseif St == 3
            if rand <= 0.5
                factor = 0.2*rand*(1 - epoch/max_iter);
                X_new = factor*(x_i - current_X_mean);
            else
                factor = 0.2 * rand(1,dim) .* exp(-epoch./(rand(1,dim)*max_iter));
                X_new = x_i + factor;
            end

        elseif St == 4
            theta = 0.5*pi*epoch/max_iter;
            term1 = rand*cos(theta)*(current_X_best - x_i);
            term2 = cos(rand*pi)*(epoch/max_iter)^(2/max_iter)*(x_i - current_X_best);
            X_new = x_i + term1 - term2;
        end

        % 边界约束
        X_new = min(max(X_new, lb), ub);

        % 贪婪选择
        new_fitness = fitness(X_new);
        if new_fitness < current_fitness_i
            par_X(i,:) = X_new;
            par_fitness_values(i) = new_fitness;
        end
    end

    % 同步更新
    X = par_X;
    fitness_values = par_fitness_values;

    % 更新全局最优
    [current_min, idx] = min(fitness_values);
    if current_min < f_best
        f_best = current_min;
        X_best = X(idx,:);
    end
end

optimized_pop = X;
end

%% 存档更新函数
function Archive = add_to_archive(Archive, new_solution, delta, bounds, fitness)
if isempty(Archive)
    Archive = new_solution;
    return;
end

% 标准化处理
[normalized_archive, scaling_params] = normalize_data(Archive, bounds);
normalized_new = normalize_data(new_solution, bounds);

% 距离计算
distances = pdist2(normalized_archive, normalized_new);
[min_dist, idx] = min(distances);

% 存档更新
if min_dist > delta
    Archive = [Archive; new_solution];
else
    if fitness(new_solution) < fitness(Archive(idx,:))
        Archive(idx,:) = new_solution;
    end
end
end

%% 稳定性评估函数
function SM = evaluate_population(fitness, pop, his_pop)
[pop_size,~] = size(pop);
current_fitness = arrayfun(@(k) fitness(pop(k,:)), 1:size(pop,1));
his_fitness = arrayfun(@(k) fitness(his_pop(k,:)), 1:size(pop,1));

[best_his_fitness, ~] = min(his_fitness);
less_than_best = current_fitness > best_his_fitness;
count = sum(less_than_best(:));
SM = count/pop_size;
end