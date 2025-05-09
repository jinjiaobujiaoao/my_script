function d = cohen_d(group1, group2)
    % cohen_d 计算两组数据之间的 Cohen's d 效应量
    %
    % 输入:
    % group1 - 第一组数据（向量形式）
    % group2 - 第二组数据（向量形式）
    %
    % 输出:
    % d - Cohen's d 效应量

    % 计算两组的均值和标准差
    mean1 = mean(group1);
    mean2 = mean(group2);
    
    std1 = std(group1);
    std2 = std(group2);
    
    % 计算合并标准差（pooled standard deviation）
    pooled_std = sqrt(((numel(group1) - 1) * std1^2 + (numel(group2) - 1) * std2^2) / (numel(group1) + numel(group2) - 2));
    
    % 计算 Cohen's d
    d = (mean1 - mean2) / pooled_std;
end
