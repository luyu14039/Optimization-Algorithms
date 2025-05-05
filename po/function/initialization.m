function X = initialization(N, dim, ub, lb)
    % 生成均匀分布的初始种群
    X = rand(N, dim).*(ub - lb) + lb;
end