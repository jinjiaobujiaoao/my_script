clc;clear;close all
path_function = fullfile(pwd,'function');
addpath(path_function);

file_trc_1 = fullfile(pwd,'subject_01_right.tsv');
file_trc_2 = fullfile(pwd,'subject_01_left.tsv');

force_file_all = {file_trc_1,file_trc_2};

[force_header,force_table] = tsv_to_mot(force_file_all);

writelines(force_header,'file_result.mot');
writetable(force_table,'file_result.mot','FileType','text','Delimiter','\t','WriteMode','append','WriteVariableNames',true);

%%

clc;clear;close all
path_function = fullfile(pwd,'function');
addpath(path_function);

file_trc_1 = fullfile(pwd,'50DJ0001_f_9.tsv');
file_trc_2 = fullfile(pwd,'50DJ0001_f_8.tsv');

force_file_all = {file_trc_1};

[force_header,force_table] = tsv_to_mot(force_file_all);
writelines(force_header,'file_result.mot');
writetable(force_table,'file_result.mot','FileType','text','Delimiter','\t','WriteMode','append','WriteVariableNames',true);