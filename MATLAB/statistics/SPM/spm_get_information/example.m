clc;clear;close all
addpath(fullfile(pwd,'function'));
load data_example.mat

number_case = 1;
if number_case == 1
    parameter_spm = parameter_spmi;
elseif number_case == 2
    parameter_spm = parameter_spmi_f;
end

[information_spmi] = SPM_get_information(parameter_spm);

