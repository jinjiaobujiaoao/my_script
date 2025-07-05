%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 先人工选取运动阶段，然后再在选择的运动阶段内精确识别
% 用GRF确定 ，阈值为 threshold = ？N
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;clear;close all
addpath(fullfile(pwd,'function'));

force_file = fullfile(pwd,'example_GRF.mot');
force_table = readtable(force_file,'FileType','text','Delimiter','\t',...
    'NumHeaderLines',6);
data = force_table.ground_force_vy;

figure;
threshold = 10;
plot_result = true;
[index_start,index_end] = get_phase_index(data,threshold,plot_result);


