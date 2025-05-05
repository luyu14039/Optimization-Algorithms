% 主测试代码，和原始代码相比进行了参数归一化，这个版本的SM比较直接，就是最优值/平均值
% 小小改动了一下参数、范围，改成找最大值了，和实际情况更加贴合
% 改了初值选择范围
% SM计算不再采用标准值
clc
clear
close all

% 参数设置
pop_size = 800;      % 总粒子数
c1 = 0.5;            % 认知因子
c2 = 1.5;            % 社会因子
w = 0.7;             % 惯性权重
max_iter = 6;       % 单次PSO优化迭代次数
chromosome_size = 2; % 解向量维度
% bounds = repmat([-1.5, 1.5], chromosome_size, 1); % 变量范围
% bounds = [-1.2,1.2;-1,0];
bounds = [-1,1;-1,1];
delta = 0.2;         % 解之间的最小距离阈值

% 调用多种群优化函数
Archive = multi_population_optimization(@rastrigin, pop_size, c1, c2, w, max_iter, chromosome_size, bounds, delta);

% 输出Archive中的解
disp('找到的多模态最优解：');
disp(Archive);

% ================== 核心函数实现 ==================
function [Archive] = multi_population_optimization(fitness, pop_size, c1, c2, w, max_iter, dim, bounds, delta)
    % 生成初始种群并标准化
    initial_pop = initialize_population(pop_size, dim, bounds);
    [normalized_optimized_pop, scaling_params] = normalize_data(initial_pop, bounds);
    
    % 初始聚类（使用标准化数据）
    Centers = CenterFind(normalized_optimized_pop', 2);
    Result = Kmeans_plus(normalized_optimized_pop', 2, Centers);
    
    % 划分初始子种群（使用原始数据）
    populations = split_population(initial_pop, Result.label);
    Archive = [];
    
    % 主优化循环
    while true
        new_populations = {};
        all_stable = true;
        
        for i = 1:length(populations)
            current_pop = populations{i};
            if isempty(current_pop)
                continue;
            end
            
            % 执行PSO优化（始终使用原始数据）
            [optimized_pop, is_converged] = PSO_MO_partial(fitness, current_pop, c1, c2, w, max_iter, bounds);
            
            % 处理完全收敛情况
            if is_converged
                Archive = add_to_archive(Archive, optimized_pop(1,:), delta, bounds, fitness);
                continue;
            end
            
            % 标准化当前种群用于稳定性分析
            [normalized_optimized_pop, ~] = normalize_data(optimized_pop, bounds);
            [normalized_current_pop, ~] = normalize_data(current_pop, bounds);
            
            % 计算稳定性指标（使用标准化数据）
            SM = evaluate_population(fitness, optimized_pop, current_pop);

            if SM < 0.1 % 稳定阈值
                % 提取最优解加入存档（使用原始数据）
                [optimized_pop, ~] = PSO_MO_partial(fitness, optimized_pop, 1.7, 1.2, 0.8, 100, bounds);%再进行一波彻底的优化
                [~, idx] = min(arrayfun(@(k) fitness(optimized_pop(k,:)), 1:size(optimized_pop,1)));
                Archive = add_to_archive(Archive, optimized_pop(idx,:), delta, bounds, fitness);
            else
                % 使用标准化数据进行聚类分裂
                all_stable = false;
                if size(normalized_optimized_pop,1) >= 2
                    Centers = CenterFind(normalized_optimized_pop', 2);
                    Result = Kmeans_plus(normalized_optimized_pop', 2, Centers);
                    
                    % 将聚类结果映射回原始数据
                    sub_pops = split_population(optimized_pop, Result.label);
                    new_populations = [new_populations, sub_pops];
                end
            end
        end
        
        % 更新种群列表
        if ~isempty(new_populations)
            populations = new_populations;
        elseif all_stable
            break;
        end
    end
end

% ================== 辅助函数 ==================
function pop = initialize_population(pop_size, dim, bounds)
    pop = zeros(pop_size, dim);
    for i = 1:pop_size
        pop(i,:) = bounds(:,1)' + (bounds(:,2)-bounds(:,1))'.*rand(1,dim);
    end
%     %正态分布生成
%     seed1 = [0.3, -0.2];
%     seed2 = [-0.3, -0.2];
%     % 计算每个种子生成的个体数量
%     num_seed1 = floor(pop_size / 2);
%     num_seed2 = pop_size - num_seed1;
%     % 围绕第一个种子生成个体
%     pop1 = ones(num_seed1, 1)*seed1 + 0.25*(ones(num_seed1, 1)*seed1).*randn(num_seed1, dim);
%     % 围绕第二个种子生成个体
%     pop2 = ones(num_seed2, 1)*seed2 + 0.25*(ones(num_seed2, 1)*seed2).*randn(num_seed2, dim);
%     % 合并种群
%     pop = [pop1; pop2];
%     % 镜像反射处理超出边界的值
%     lower_bounds = repmat(bounds(:, 1)', pop_size, 1);
%     upper_bounds = repmat(bounds(:, 2)', pop_size, 1);
%     % 处理小于下限的情况
%     below_lower = pop < lower_bounds;
%     pop(below_lower) = lower_bounds(below_lower) + (lower_bounds(below_lower) - pop(below_lower));
%     % 处理大于上限的情况
%     above_upper = pop > upper_bounds;
%     pop(above_upper) = upper_bounds(above_upper) - (pop(above_upper) - upper_bounds(above_upper));
%     % 再次检查是否还有超出边界的值，可能需要多次反射
%     while any(any(pop < lower_bounds | pop > upper_bounds))
%         below_lower = pop < lower_bounds;
%         pop(below_lower) = lower_bounds(below_lower) + (lower_bounds(below_lower) - pop(below_lower));
%         above_upper = pop > upper_bounds;
%         pop(above_upper) = upper_bounds(above_upper) - (pop(above_upper) - upper_bounds(above_upper));
%     end
end

function sub_pops = split_population(pop, labels)
    unique_labels = unique(labels);
    sub_pops = cell(1, length(unique_labels));
    for i = 1:length(unique_labels)
        sub_pops{i} = pop(labels == unique_labels(i), :);
    end
end

function [optimized_pop, is_converged] = PSO_MO_partial(fitness, pop, c1, c2, w, max_iter, bounds)
    is_converged = false;
    pop_size = size(pop,1);
    dim = size(pop,2);
    x = pop;
    v = zeros(pop_size, dim);
    pbest = x;
    pbest_fitness = arrayfun(@(k) fitness(x(k,:)), 1:pop_size);
    [~, idx] = min(pbest_fitness);
    gbest = x(idx,:);
    
    for epoch = 1:max_iter
        % 收敛检测
        if all(abs(x - x(1,:)) < 1e-6, 'all')
            optimized_pop = x(1,:);
            is_converged = true;
            return;
        end
        
        for i = 1:pop_size
            r1 = rand(1,dim);
            r2 = rand(1,dim);
            v(i,:) = w*v(i,:) + c1*r1.*(pbest(i,:)-x(i,:)) + c2*r2.*(gbest-x(i,:));
            x(i,:) = min(max(x(i,:) + v(i,:), bounds(:,1)'), bounds(:,2)');
            current_fitness = fitness(x(i,:));
            if current_fitness < pbest_fitness(i)
                pbest(i,:) = x(i,:);
                pbest_fitness(i) = current_fitness;
            end
        end
        [~, idx] = min(pbest_fitness);
        gbest = pbest(idx,:);
    end
    optimized_pop = x;
end

function SM = evaluate_population(fitness, pop, his_pop)
    [pop_size,~] = size(pop);
    current_fitness = arrayfun(@(k) fitness(pop(k,:)), 1:size(pop,1));
    his_fitness = arrayfun(@(k) fitness(his_pop(k,:)), 1:size(pop,1));
    [best_his_fitness, ~] = min(his_fitness);
    less_than_best = current_fitness > best_his_fitness;
    count = sum(less_than_best(:));%不如初值中最优值的元素的个数
    SM = count/pop_size; % 改进的稳定性指标
end
% function SM = evaluate_population(fitness, pop)
%     current_fitness = arrayfun(@(k) fitness(pop(k,:)), 1:size(pop,1));
%     [best_fitness, ~] = min(current_fitness);
%     avg_fitness = mean(current_fitness);
%     SM = abs(best_fitness - avg_fitness)/(abs(best_fitness) + eps); % 改进的稳定性指标
% end

function Archive = add_to_archive(Archive, new_solution, delta, bounds, fitness)
    % 输入说明：
    % delta - 标准化空间中的距离阈值（建议值0.05-0.2）
    
    if isempty(Archive)
        Archive = new_solution;
        return;
    end
    
    % 标准化所有存档解和新解
    [normalized_archive, scaling_params] = normalize_data(Archive, bounds);
    normalized_new = normalize_data(new_solution, bounds);
    
    % 计算标准化空间中的距离
    distances = pdist2(normalized_archive, normalized_new);
    [min_dist, idx] = min(distances);
    
    % 判断是否满足阈值
    if min_dist > delta
        Archive = [Archive; new_solution];
    else
        if fitness(new_solution) < fitness(Archive(idx,:))
            Archive(idx,:) = new_solution;
        end
    end
end

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

% =============== 新增标准化函数 ===============
function [normalized_data, scaling_params] = normalize_data(data, bounds)
    % 数据标准化：将各维度线性映射到[0,1]
    % 输入：
    %   data - 原始数据矩阵（N×dim）
    %   bounds - 各维度边界矩阵（dim×2）
    % 输出：
    %   normalized_data - 标准化后的数据
    %   scaling_params - 标准化参数结构体
    
    scaling_params.min = bounds(:,1)';
    scaling_params.range = bounds(:,2)' - bounds(:,1)';
    normalized_data = (data - scaling_params.min) ./ scaling_params.range;
end

function original_data = denormalize_data(normalized_data, scaling_params)
    % 数据反标准化
    original_data = normalized_data .* scaling_params.range + scaling_params.min;
end

function y = rastrigin(x)
    A = 10;
    y = A*numel(x) + sum(x.^2 - A*cos(2*pi*x));
    y = -y;
end