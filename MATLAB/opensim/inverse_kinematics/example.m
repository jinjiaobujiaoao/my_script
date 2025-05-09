clear;close all;clc

import org.opensim.modeling.*;

parameter.IK_Model = Model(fullfile(pwd,'file_prepared','subject_01.osim'));
parameter.IK_marker_file = fullfile(pwd,'file_prepared','subject_01.trc');
parameter.IK_time_range = [0.5980,10];
parameter.IK_output_file = fullfile(pwd,'ik.mot');

% parameter.plot_error = false;
% parameter.plot_value = false;

IK(parameter);







