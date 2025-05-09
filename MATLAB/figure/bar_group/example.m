clc;clear;close all
%% 一组
bar_group_data.value = [14;
                        13;
                        20;
                        16];
bar_group_data.std = [1;
                      4;
                      5;
                      6];
bar_group_data.p = [0.005,0.3,0.011,0.7];
%% 两组
bar_group_data.value = [14,17;
                        13,18;
                        20,15;
                        16,19];
bar_group_data.std = [1,2;
                      4,1;
                      5,4;
                      6,4];
bar_group_data.p = [0.005,0.3,0.011,0.7];
%% 三组
bar_group_data.value = [14,17,17;
                        13,18,17;
                        20,15,17;
                        16,19,17];
bar_group_data.std = [1,2,2;
                      4,1,2;
                      5,4,2;
                      6,4,2];
bar_group_data.p = [0.005,0.3,0.011,0.7];
%%
bar_group_figure_information.legend = {'\fontname{Times New Roman}group 1','group 2','group 3'};
bar_group_figure_information.xticklabels = {'\fontname{Times New Roman}case 1','case 2','case 3','case 4'};
bar_group_figure_information.FontSize = 30;

bar_group_figure_information.bar_color =  [[218,238,200]/256;
                                           [159,217,192]/256;
                                           [159,217,192]/256];
bar_group_figure_information.bar_width_coefficient = 50/100;
bar_group_figure_information.bar_gap_width_coefficient = 3/10;

bar_group_figure_information.legend_plot = true;

bar_group_figure_information.xline_plot = true;
bar_group_figure_information.xline_color = [0,0,0]/256;

figure;
hold on;
bar_group(bar_group_data,bar_group_figure_information);


% set(gcf,'Units','normalized','OuterPosition',[0,0,1,1]);