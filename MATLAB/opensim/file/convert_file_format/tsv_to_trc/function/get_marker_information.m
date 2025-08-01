function marker_information = get_marker_information(marker_file_trc)

marker_number = get_number_target(marker_file_trc,'NO_OF_MARKERS');
frequency_number = get_number_target(marker_file_trc,'FREQUENCY');
makrker_line = readlines(marker_file_trc);

line_itr = split(makrker_line(marker_number));
marker_information.marker_number = str2double(line_itr(2));
line_itr = split(makrker_line(frequency_number));
marker_information.frequency_number = str2double(line_itr(2));
end