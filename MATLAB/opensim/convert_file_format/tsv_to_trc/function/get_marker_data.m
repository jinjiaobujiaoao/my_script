function marker_data = get_marker_data(file_trc)
marker_data = readmatrix(file_trc,"FileType","text");
frame = marker_data(:,1);
time = marker_data(:,2);
marker_data = marker_data(:,3:end);
marker_data = arrayfun(@(i) [marker_data(:,3*i - 2),marker_data(:,3*i),-marker_data(:,3*i - 1)],1:size(marker_data,2)/3,'UniformOutput',false);
marker_data = cell2mat(marker_data);
marker_data = [frame,time,marker_data];
end