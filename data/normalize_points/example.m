clc;clear;close all

line = rand(1,24);
number_points = 101;
method = 'linear';
line_new = normalize_points(line,number_points,method);





%%
line_1 = rand(1,24);
line_2 = rand(1,51);
line_3 = rand(1,31);
line_cell = {line_1,line_2,line_3};
line_cell_new = cellfun(@normalize_points,line_cell,'UniformOutput',false);
