function plot_rastrigin_3d()
    % 参数设置
    lower_bound = -1.12;
    upper_bound = 1.12;
    step = 0.1;  % 控制曲面平滑度与计算量的平衡
    
    % 生成二维网格
    [X, Y] = meshgrid(lower_bound:step:upper_bound);
    
    % 计算Rastrigin函数值
    Z = zeros(size(X));
    for i = 1:size(X,1)
        for j = 1:size(X,2)
            Z(i,j) = rastrigin([X(i,j), Y(i,j)]);
        end
    end
    
    % 创建三维曲面图
    figure('Name','Rastrigin Function 3D Visualization','Color','white')
    surf(X, Y, Z);
    
    % 图形美化
    shading interp       % 平滑表面着色
    colormap(jet)        % 使用彩虹色系
    light                % 添加光照
    lighting gouraud     % 平滑光照渲染
    material dull        % 表面材质设置
    
    % 坐标轴标注
    xlabel('x_1', 'FontSize', 12)
    ylabel('x_2', 'FontSize', 12)
    zlabel('f(x)', 'FontSize', 12)
    title('Rastrigin Function Surface', 'FontSize', 14)
    
    % 视角调整（方位角，俯仰角）
    view(-45, 30)        % 最佳观测角度
    colorbar             % 显示颜色标尺
    axis tight          % 紧凑坐标范围
end

function y = rastrigin(x)
    % Rastrigin函数计算
    % 输入x应为N×2矩阵，返回N×1结果
    y = sum(x.^2 - 10*cos(2*pi*x)) + 10*size(x,2);
end