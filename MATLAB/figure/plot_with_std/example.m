clc;clear;close all

load data_example.mat

% -------------------------------------------------------------------------

figure;
hold on;

input.data_mean = mean(data_subject_1,2);
input.data_std = std(data_subject_1,0,2);
input.color_shadow = [1,0,0];
plot_with_std(input);

input.data_mean = mean(data_subject_2,2);
input.data_std = std(data_subject_2,0,2);
input.color_shadow = [0,1,0];
plot_with_std(input);