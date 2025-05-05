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