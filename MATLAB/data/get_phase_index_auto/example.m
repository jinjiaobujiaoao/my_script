clc;clear;close all

addpath(fullfile(pwd,'function'));
data = readtable('subject_14.mot',"FileType","text","Delimiter",'\t', 'VariableNamingRule', 'preserve');
data_force = data.ground_force_vy;

input.data_force = data_force;
input.frequency = 1000;
input.number_times = 3;

index = get_phase_index_auto(input);