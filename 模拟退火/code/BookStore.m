%%Copyright：
%%copyright:（HIT 23永坦）孟美汐、姜予涵
%%（没有被带去看电影，而且还得抽时间去亚冬会排练的）雪豹

%% 模拟退火解决书店买书问题  
tic
rng('shuffle')  % 控制随机数的生成，否则每次打开matlab得到的结果都一样

load book_data  % 这个文件一定要在当前文件夹下面
% 这个数据文件里面保存了两个矩阵：M是每本书在每家店的价格; freight表示每家店的运费
[s, b] = size(M);  % s是书店的数量，b是要购买的书的数量

%% 参数初始化
T0 = 1000;   % 初始温度
T = T0; % 迭代中温度会发生改变，第一次迭代时温度就是T0
maxgen = 1000;  % 最大迭代次数
Lk = 200;  % 每个温度下的迭代次数
alfa = 0.95;  % 温度衰减系数

%%  随机生成一个初始解
way0 = randi([1, s],1,b); % 在1-s这些整数中随机抽取一个1*b的向量，表示这b本书分别在哪家书店购买
money0 = calculate_money(way0,freight,M,b); % 调用calculate_money函数计算这个方案的花费
min_money = money0;     % 初始化找到的最佳的解对应的花费为money0

%% 模拟退火过程
for iter = 1 : maxgen  
    for i = 1 : Lk  
        way1 = gen_new_way(way0,s,b);  % 调用gen_new_way函数生成新的方案
        money1 = calculate_money(way1,freight,M,b); % 计算新方案的花费
        if money1 < money0    % 如果新方案的花费小于当前方案的花费
            way0 = way1; % 更新当前方案为新方案
            money0 = money1;
        else
            p = exp(-(money1 - money0)/T); % 根据Metropolis准则计算一个概率
            if rand(1) < p   % 生成一个随机数和这个概率比较，如果该随机数小于这个概率
                way0 = way1;
                money0 = money1;
            end
        end
        % 判断是否要更新找到的最佳的解
        if money0 < min_money  % 如果当前解更好，则对其进行更新
            min_money = money0;  % 更新最小的花费
            best_way = way0;  % 更新找到的最佳方案
        end
    end
    T = alfa*T;   % 温度下降
end

disp('最佳的方案是：'); disp(mat2str(best_way))
disp('此时最优值是：'); disp(min_money)

