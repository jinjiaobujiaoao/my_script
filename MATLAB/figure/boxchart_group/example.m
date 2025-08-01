clc;
clear;
close all;

load example_data.mat;
disp(information_example_data);

data = example_data;

figure;
hold on;
handles_boxchart = boxchart_group(data);
