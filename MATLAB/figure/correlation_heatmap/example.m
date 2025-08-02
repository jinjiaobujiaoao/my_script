clc;
clear;
close all;

load example_data.mat;

input.data_R = data_R;
input.data_P = data_P;

% input.font_size = 15;
% input.bubble_size = [3, 30];
% input.color_map = [
%     88, 140, 194;
%     143, 178, 213;
%     199, 217, 232;
%     227, 236, 245;
%     247, 225, 228;
%     234, 197, 202;
%     215, 138, 151;
%     196,  82,  97]/256;

correlation_heatmap(input);


