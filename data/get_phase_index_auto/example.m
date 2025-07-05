clc;clear;close all

addpath(fullfile(pwd,'function'));
data = readtable('subject_01.mot',"FileType","text","Delimiter",'\t');
data_force = data.ground_force_vy;

parameter.data_force = data_force;
parameter.frequency = 1000;
parameter.number_times = 3;

index = get_phase_index_auto(parameter);