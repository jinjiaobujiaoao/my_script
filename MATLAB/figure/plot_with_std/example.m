clc;clear;close all

data = randn(100, 50); % 100个点，50个样本
data_mean = mean(data, 2);          
data_std = std(data, 0, 2);  
color_shadow = [0.3,0.3,0.3];

figure;
hold on;
plot_with_std(data_mean,data_std,color_shadow + 0.5);

data = randn(100, 50); % 100个点，50个样本
data_mean = mean(data, 2);          
data_std = std(data, 0, 2);  
color_shadow = [0.3,0.3,0.3];


plot_with_std(data_mean,data_std,color_shadow - 0.2);