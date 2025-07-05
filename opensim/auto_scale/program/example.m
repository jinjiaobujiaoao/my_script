clear;clc;close all

[parent_path,~] = fileparts(pwd); 

parameter.Info = {{'180'};{'60'};{'168'};{'75'}};
parameter.file_model_base = 'gait2392_simbody_ie_vv.osim';
parameter.file_scale_trc = 'nixindi.trc';
parameter.file_scale_task = 'Scaled_Task.xml';
parameter.file_path_target = pwd;
parameter.file_path_prepared = fullfile(parent_path,'prepared_file');
parameter.model_name = 'Model_Scaled.xml';

scale_model(parameter);