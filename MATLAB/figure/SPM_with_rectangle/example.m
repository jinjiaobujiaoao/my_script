clc;
clear;
close all;
load example_data.mat;

figure;

input.data = data;
input.index_all = {[0, 20]; [0, 5]; [0, 25; 30, 35]};

% input.number_title = 5;
% input.number_figure_1 = 30;
% input.number_figure_2 = 4;
% input.number_gap_1 = 10;
% input.number_gap_2 = 1;

% input.box_color = [0.7, 0.7, 0.7];
% input.line_width = 2;
% input.group_color = [
%     88 , 140, 194;
%     142, 111, 145;
%     196,  82,  97]...
%     /256;


handles_fig = SPM_with_rectangle(input);




