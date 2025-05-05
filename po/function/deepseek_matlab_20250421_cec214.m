%% 主程序（带实时动画）
clear; clc;

% 参数设置
N = 150;        % 种群规模（建议调小以提高动画流畅度）
dim = 2;        % 二维问题
Max_iter = 150; % 迭代次数
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