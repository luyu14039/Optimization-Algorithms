%% ��ջ�������
clc;
clear;
close all;

%% ������Ҫ�ֶ��޸�
dim = 5; % ������ά��
maxgen = 20000; % ����������������Ҫ�޸ģ�
sizepop = 2000; % ��Ⱥ��ģ
Fitness = @(x) sum(100*(x(2:end) - x(1:end-1).^2).^2 + (1 - x(1:end-1)).^2); % ������Ӧ�Ⱥ���
%�磺��ά�� Rastrigin ���Ǻ��� Fitness = @(x) 20 + x(1)^2 - 10*cos(2*pi*x(1)) + x(2)^2 - 10*cos(2*pi*x(2));
%�磺��ά Ackley ���� Fitness = @(x) -20*exp(-0.2*sqrt((x(1)^2 + x(2)^2 + x(3)^2)/3)) - exp((cos(2*pi*x(1)) + cos(2*pi*x(2)) + cos(2*pi*x(3)))/3) + 20 + exp(1);
a = 2; % ��Χ���ޣ�������Ҫ�޸ģ�
b = 8; % ��Χ���ޣ�������Ҫ�޸ģ�
X_axis = a + (b - a)*rand(1, dim);% �����ʼ����ӬȺ��λ��

%% ������ٶ�������Сֵ
for i = 1:sizepop
    % ������������
    X(i, :) = X_axis + 2*rand(1, dim)-1;
    % �������ζŨ��
    D(i) = sqrt(sum(X(i, :).^2));
    S(i, :) = 1./D(i);
    % ��Ӧ�Ⱥ���
    Smell(i) = Fitness(S(i, :));
end

% �ҳ��˹�ӬȺ����ζ��Ũ����͵Ĺ�Ӭ(��Сֵ)
[bestSmell, bestindex] = min(Smell);
% �����ζŨ�ȡ���Ӭλ�á���Ӧ������λ��
X_axis = X(bestindex, :);
Smellbest = bestSmell;
FXbest = S(bestindex, :);

%% ��Ӭ����Ѱ��
for gen = 1:maxgen
    % ����λ�ú��ٶȸ���
    for i = 1:sizepop
        X(i, :) = X_axis + 2*rand(1, dim)-1;
        X(i, :) = max(min(X(i, :), b), a);
        D(i) = sqrt(sum(X(i, :).^2));
        S(i, :) = 1./D(i);
        % ��Ӧ�Ⱥ���
        Smell(i) = Fitness(S(i, :));
    end
    % ������ζŨ��ֵѰ�Ҽ�ֵ
    [bestSmell, bestindex] = min(Smell);
    % �������ֵλ��
    if bestSmell < Smellbest
        X_axis = X(bestindex, :);
        Smellbest = bestSmell;
        FXbest = S(bestindex, :);
    end
    % ÿ������Smellֵ��¼��yy�����У�����¼���ŵ�������
    yy(gen) = Smellbest;
    Xbest(gen, :) = X_axis;
end

%% �����ʾ
disp(['��Ӧ�Ⱥ�������λ�ã�', num2str(FXbest)]);
disp(['��Ӧ�Ⱥ������Ž⣺', num2str(yy(end))]);

%% ���Ƶ���ζ��Ũ�����Ӭ����·������ͼ
figure(1);
plot(yy, 'r', 'linewidth', 2);
title('�Ż�����', 'fontsize', 12)
xlabel('��������', 'fontsize', 12); 
ylabel('��ζŨ��(��Ӧ��ֵ)', 'fontsize', 12);

% ����ά�ȿ��ܴ��� 2���޷�ֱ�ӻ��ƹ�Ӭ����·����������Կ��ǻ��Ʋ���ά�ȵ�ͶӰ
if dim >= 2
    figure(2);
    gen = 1:maxgen;
    plot(Xbest(:, 1), Xbest(:, 2), 'r.'); % ����ǰ����ά�ȵ�ͶӰ
    title('��Ӭ�Ż��㷨Ѱ��·�ߣ�ǰ����ά��ͶӰ��', 'fontsize',14)
    xlabel('X_1-axis', 'fontsize', 12); 
    ylabel('X_2-axis', 'fontsize', 12);
end