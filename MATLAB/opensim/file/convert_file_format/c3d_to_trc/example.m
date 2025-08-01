clc;clear;close all
file_path_function = pwd;
addpath(file_path_function);

file_c3d = fullfile(pwd,'file_c3d.c3d');
file_trc = fullfile(pwd,'file_trc.trc');

% file_c3d = fullfile('D:\Temporary Files','BD0001.c3d');
% file_trc = fullfile('D:\Temporary Files','BD0001.trc');
get_file_trc(file_c3d,file_trc);