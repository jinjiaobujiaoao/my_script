clc;clear;close all
load example_data.mat

group_1_condition_1 = data{1};
group_2_condition_1 = data{2};
group_1_condition_2 = data{3};
group_2_condition_2 = data{4};
group_1_condition_3 = data{5};
group_2_condition_3 = data{6};
data_all = {group_1_condition_1,group_2_condition_1,...
   group_1_condition_2,group_2_condition_2,...
   group_1_condition_3,group_2_condition_3};

handle_figure.xlim = [1,101];
handle_figure.xticks = 1:20:101;
handle_figure.xticklabels = 0:20:100;
handle_figure.xlabel = '\fontname{SimSum}离心阶段\fontname{Times New Roman}/%';
handle_figure.ylim = [0,8];
handle_figure.yticks = 0:4:8;
handle_figure.yticklabels = 0:4:8;
handle_figure.ylabel = ['\fontname{SimSum}屈\fontname{Times New Roman}/' ...
    '\fontname{SimSum}伸角\fontname{Times New Roman}SD\fontname{SimSum}(°)'];
handle_figure.fontname = 'Times New Roman';
handle_figure.fontsize = 18;

figure;
hold on;
[indices,p_value] = SPM_with_rectangle(data_all,handle_figure);