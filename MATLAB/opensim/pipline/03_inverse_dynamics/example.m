clear;close all;clc

import org.opensim.modeling.*

parameter.model = Model(fullfile(pwd,'file_prepared','subject_01_model.osim'));
% parameter.ID_coordinates_file = fullfile(pwd,'file_prepared','subject_01_IK.mot');
% parameter.ID_force_file = fullfile(pwd,'file_prepared','subject_01_GRF.mot');
% parameter.ID_time_range = [1,10];

parameter.ID_coordinates_file = fullfile(pwd,'file_prepared','subject_01.mot');
parameter.ID_force_file = fullfile(pwd,'file_prepared','subject_01(1).mot');
parameter.ID_time_range = [1,30];

parameter.ID_output_file = fullfile(pwd,'inverse_dynamics.sto');
% parameter.ID_lowpass_cutoff_frequency = 20;
% parameter.plot_value = false;
% parameter.plot_grf = false;
% parameter.weight = 75;

ID(parameter);
