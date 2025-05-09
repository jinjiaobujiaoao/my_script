clc;clear;close all
load example_data.mat

boxchart_group_data.value = {data.case_1.group_1,data.case_1.group_2,data.case_1.group_3;
    data.case_2.group_1,data.case_2.group_2,data.case_2.group_3;
    data.case_3.group_1,data.case_3.group_2,data.case_3.group_3;
    data.case_4.group_1,data.case_4.group_2,data.case_4.group_3};

boxchart_group_data.bar_width_coefficient = 60/100;
boxchart_group_data.bar_gap_width_coefficient = 3/10;

boxchart_group_data.font_size = 25;
boxchart_group_data.case_name = {'\fontname{Times New Roman}case 1','case 2','case 3','case 4'};

boxchart_group_data.group_color =  [[0,0,0]/256;
                                    [100,100,100]/256;
                                    [159,217,192]/256];

boxchart_group_data.significant_plot = true;
boxchart_group_data.p_value = [0.005,0.3,0.011,0.7];
boxchart_group_data.p_position = 5000;

boxchart_group_data.legend_plot = true;
boxchart_group_data.legend_name = {'group 1','group 2','group 3'};

boxchart_group_data.value_mean_plot = true;
boxchart_group_data.mean_marker_color = [0,0,0];

boxchart_group_data.xline_plot = true;
boxchart_group_data.xline_color = [0 0 0];

boxchart_group(boxchart_group_data);