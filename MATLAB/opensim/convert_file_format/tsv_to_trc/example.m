clc;clear;close all;

path_function = fullfile(pwd,'function');
addpath(path_function);

rate = 200;
marker_file_trc = fullfile(pwd,'file_example.tsv');

[marker_header,marker_data] = tsv_to_trc(marker_file_trc);

writelines(marker_header, 'file_result.trc');
writematrix(marker_data,'file_result.trc','FileType','text','Delimiter','\t','WriteMode','append');

