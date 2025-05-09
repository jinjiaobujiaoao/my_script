function [d,p] = normal_significance_test(preData, postData)
% 输入:
% preData: 1x20 数组，干预前数据
% postData: 1x20 数组，干预后数据

% 正态性检验（Shapiro-Wilk）
[~, p_pre, ~] = swtest(preData); % 进行干预前数据的Shapiro-Wilk正态性检验
[~, p_post, ~] = swtest(postData); % 进行干预后数据的Shapiro-Wilk正态性检验

% 效应量检验（cohen’s d）
d = cohen_d(preData, postData);


% 如果两组数据都符合正态性（p值 > 0.05）
if p_pre > 0.05 && p_post > 0.05
    testMethod = 't-test';  % 使用配对 t 检验
    [~, p] = ttest(preData, postData);
else
    testMethod = 'Wilcoxon signed-rank test';  % 使用 Wilcoxon 符号秩检验
    [p, ~] = signrank(preData, postData);
end

% 显示显著性检验结果
disp(['显著性检验方法：', testMethod]);
disp(['显著性检验 p-value: ', num2str(p)]);
disp(['效应量 cohen’s d: ', num2str(abs(d))]);
disp(' ');
end