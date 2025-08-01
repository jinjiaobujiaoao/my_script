%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 输入.c3d文件及文件路径，例如：file_c3d = 'D:\path_1\path_2\...\motion.c3d'
% 输入.trc文件及文件路径，例如：file_trc = 'D:\path_3\path_4\...\marker.trc'
% 输出butterworth滤波后文件，截止频率（cutoff_frequency）自调，如下所示
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function c3d_to_trc(file_c3d,file_trc)
%% c3d文件中读取.tsv文件
% 获得读取的c3d文件路径以及路径名
[file_path_c3d,file_name_c3d] = fileparts(file_c3d);
% 获得trc文件储存路径以及路径名
[file_path_trc,file_name_trc] = fileparts(file_trc);
% 将c3d文件导出为.tsv格式
[rMakers] = c3d_export_trc(file_path_c3d,[file_name_c3d,'.c3d'],file_path_trc,[file_name_trc,'.trc']);

%% 删除空行（第6行）
lines_number = 6;
matrix = readmatrix(file_trc,'FileType','text','Delimiter','\t','NumHeaderLines',lines_number);
lines = readlines(file_trc);
lines(lines_number) = [];

%% 使用低通、零滞、4 阶 butterworth 滤波器处理 markers数据，截止频率为 cutoff_frequency（如下）
sampling_frequency = rMakers;
cutoff_frequency = 12;
filter_passes = 4;

for i_matrix = 3:width(matrix)
columnData = matrix(:,i_matrix);
[data_butter_array] = butterworth_dual_pass_filters(columnData,sampling_frequency,cutoff_frequency,filter_passes);
matrix(:,i_matrix) = data_butter_array;
end

%% 写入原文件
writelines(lines(1:5),file_trc);
writematrix(matrix,file_trc,'FileType','text','Delimiter','\t','WriteMode','append');