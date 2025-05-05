function [X_best, f_best, Convergence_curve, all_positions] = parrot_optimizer_animated(N, Max_iter, lb, ub, dim)
    % 初始化
    X = initialization(N, dim, ub, lb);
    fitness = shubert(X);
    [f_best, idx] = min(fitness);
    X_best = X(idx,:);
    all_positions = cell(Max_iter,1);  % 新增轨迹存储
    
    % 初始化 Convergence_curve 数组
    Convergence_curve = zeros(Max_iter, 1);  % 预先分配足够内存
    
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