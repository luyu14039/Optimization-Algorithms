%%Copyright：
%%copyright:（HIT 23永坦）孟美汐、姜予涵
%%（没有被带去看电影，而且还得抽时间去亚冬会排练的）雪豹

%% 模拟退火: 求解函数y = 11*sin(x) + 7*cos(5*x)在[-3,3]内的最大值

tic
clear; clc

%% 编写该函数文件
function y = Obj_fun1(x)
    y = 11*sin(x) + 7*cos(5*x);
end

%% 参数初始化
narvs = 1; % 变量个数
T0 = 100;   % 初始温度
T = T0; % 迭代中温度会发生改变，第一次迭代时温度就是T0
maxgen = 400;  % 最大迭代次数
Lk = 100;  % 每个温度下的迭代次数
alfa = 0.95;  % 温度衰减系数
x_lb = -3; % x的下界
x_ub = 3; % x的上界

%%  随机生成一个初始解
x0 = zeros(1,narvs); % 生成1行narvs列的零矩阵，用于记录自变量的值
for i = 1: narvs
    x0(i) = x_lb(i) + (x_ub(i)-x_lb(i))*rand(1); % 生成在[-3,3]的随机数
end
y0 = Obj_fun1(x0); % 计算当前解的函数值
max_y = y0;     % 初始化找到的最佳的解对应的函数值为y0

%% 模拟退火过程
for iter = 1 : maxgen  % 外循环,采用的是指定最大迭代次数以控制循环次数
    for i = 1 : Lk  % 内循环，在每个温度下开始迭代
        y = randn(1,narvs);  % 生成1行narvs列的N(0,1)随机数，记录不同自变量下的函数值
        z = y / sqrt(sum(y.^2)); % 根据新解的产生规则计算z
        x_new = x0 + z*T; % 根据新解的产生规则计算x_new的值
        % 如果这个新解的位置超出了定义域，利用线性插值的方式来将超出下界的值调整回合法区间内
        for j = 1: narvs
            if x_new(j) < x_lb(j) % 判断新解x_new是否小于自变量下界
                r = rand(1); % 生成成一个介于0到1之间的随机数r
                x_new(j) = r*x_lb(j)+(1-r)*x0(j); % 取一部分下界值，取一部分当前解的值
                                                  % 二者相加使得新解的值能被调整到一个介于当前解和下界值之间的合法位置
            elseif x_new(j) > x_ub(j) % 判断新解x_new是否大于自变量上界
                r = rand(1);
                x_new(j) = r*x_ub(j)+(1-r)*x0(j);% 同理使得新解被调整到一个介于当前解和上界值之间的合法位置
            end
        end
        x1 = x_new;    % 将调整后的x_new赋值给新解x1
        y1 = Obj_fun1(x1);  % 计算新解的函数值
        if y1 > y0    % 如果新解函数值大于当前解的函数值
            x0 = x1; % 更新当前解为新解
            y0 = y1;
        else
            p = exp(-(y0 - y1)/T); % 根据Metropolis准则计算一个概率
            if rand(1) < p   % 生成一个随机数和这个概率比较，如果概率大于该随机数，则接受新解
                x0 = x1; % 更新当前解为新解
                y0 = y1;
            end
        end
        % 判断是否要更新找到的最佳的解
        if y0 > max_y  % 如果当前解更好，则对其进行更新
            max_y = y0;  % 更新最大的y
            best_x = x0;  % 更新找到的最好的x
        end
    end
    T = alfa*T;   % 温度下降
end
disp('最佳的位置是：'); disp(best_x)
disp('此时最优值是：'); disp(max_y)
toc