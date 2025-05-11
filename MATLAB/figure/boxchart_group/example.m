clc;clear;close all
load example_data.mat

input.value = {data.case_1.group_1,data.case_1.group_2,data.case_1.group_3;
    data.case_2.group_1,data.case_2.group_2,data.case_2.group_3;
    data.case_3.group_1,data.case_3.group_2,data.case_3.group_3;
    data.case_4.group_1,data.case_4.group_2,data.case_4.group_3};

input.font_size = 25;
input.case_name = {'\fontname{Times New Roman}case 1','case 2','case 3','case 4'};

input.legend_name = {'group 1','group 2','group 3'};

input.group_color =  [
    [0,0,0]/256;
    [100,100,100]/256;
    [159,217,192]/256];

% input.bar_width_coefficient = 60/100;
% input.bar_gap_width_coefficient = 3/10;
% input.p_value = [0.005,0.3,0.011,0.7];
% input.p_position_y = 5000;
% input.value_mean_plot = true;
% input.mean_marker_color = [0,0,0];
% input.xline_color = [0 0 0];

%--------------------------------------------------------------------------

figure;
hold on;
boxchart_group(input);