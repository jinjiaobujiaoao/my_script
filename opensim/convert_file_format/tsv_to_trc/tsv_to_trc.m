function [marker_header,marker_data] = tsv_to_trc(marker_file_trc)

[marker_label,index_marker_exist] = get_marker_label(marker_file_trc);

marker_number = length(marker_label);

frequency_number = get_number_target(marker_file_trc,'FREQUENCY');
makrker_line = readlines(marker_file_trc);
line_itr = split(makrker_line(frequency_number));
frequency = str2double(line_itr(2));

marker_coordinate_label = get_marker_coordinate_label(marker_number);

marker_data = readmatrix(marker_file_trc,"FileType","text");
number_frame = size(marker_data,1);

header_information.number_type_file = 4;
header_information.path_file = marker_file_trc;
header_information.rate_data = frequency;
header_information.rate_camera = frequency;
header_information.number_frame = number_frame;
header_information.number_marker = marker_number;
header_information.units = 'mm';
header_information.rate_data_orignal = frequency;
header_information.frame_start_data_orignal = 0;
header_information.number_frame_orignal = frequency;
header_information.name_marker = marker_label;
header_information.name_axis = marker_coordinate_label;
marker_header = get_marker_header(header_information);

%%
marker_data = get_marker_data(marker_file_trc);
index_marker_exist = repmat(index_marker_exist,1,3);
index_marker_exist = index_marker_exist';
index_marker_exist = reshape(index_marker_exist,1,[]);
index_marker_exist = [true,true,index_marker_exist];
marker_data = marker_data(:,index_marker_exist);
end