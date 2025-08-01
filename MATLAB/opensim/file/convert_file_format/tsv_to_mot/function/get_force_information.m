function force_information = get_force_information(force_file_trc)
pattern.number_sample = 'NO_OF_SAMPLES';
pattern.frequency = 'FREQUENCY';
pattern.first_sample = 'FIRST_SAMPLE';
pattern.force_plate_corner_coordinate = {
    'FORCE_PLATE_CORNER_POSX_POSY_X', 'FORCE_PLATE_CORNER_POSX_POSY_Y', 'FORCE_PLATE_CORNER_POSX_POSY_Z';
    'FORCE_PLATE_CORNER_NEGX_POSY_X', 'FORCE_PLATE_CORNER_NEGX_POSY_Y', 'FORCE_PLATE_CORNER_NEGX_POSY_Z';
    'FORCE_PLATE_CORNER_NEGX_NEGY_X', 'FORCE_PLATE_CORNER_NEGX_NEGY_Y', 'FORCE_PLATE_CORNER_NEGX_NEGY_Z';
    'FORCE_PLATE_CORNER_POSX_NEGY_X', 'FORCE_PLATE_CORNER_POSX_NEGY_Y', 'FORCE_PLATE_CORNER_POSX_NEGY_Z'
    };
pattern.header = ['SAMPLE',char(9),'TIME'];

name_pattern = fieldnames(pattern);
for i_name_pattern = 1:length(name_pattern)
    number.(char(name_pattern(i_name_pattern))) = get_number_target(force_file_trc,pattern.(char(name_pattern(i_name_pattern))));
end
number.coordinate_force_plate = cellfun(@(x) get_number_target(force_file_trc,x),pattern.force_plate_corner_coordinate,'UniformOutput',false);
number.coordinate_force_plate = cell2mat(number.coordinate_force_plate);

file_trc_lines = readlines(force_file_trc);
for i_name_pattern = 1:length(name_pattern)
    itr = split(file_trc_lines(number.(char(name_pattern(i_name_pattern)))));
    switch itr(1)
        case {'NO_OF_SAMPLES','FREQUENCY','FIRST_SAMPLE'}
            force_information.(char(name_pattern(i_name_pattern))) = str2double(itr(2));
        case 'SAMPLE'
            continue;
        otherwise
            force_information.(char(name_pattern(i_name_pattern))) = ...
                arrayfun(@(i) split(file_trc_lines(i)),number.coordinate_force_plate,'UniformOutput',false);
            force_information.(char(name_pattern(i_name_pattern))) = ...
                cellfun(@(x) x(2),force_information.(char(name_pattern(i_name_pattern))),'UniformOutput',false);
            force_information.(char(name_pattern(i_name_pattern))) = ...
                cellstr(force_information.(char(name_pattern(i_name_pattern))));
            force_information.(char(name_pattern(i_name_pattern))) = ...
                str2double(force_information.(char(name_pattern(i_name_pattern))));
    end
end

end