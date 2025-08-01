function force_table = get_force_table(force_file_all)
force_number =  length(force_file_all);
force_cell_all = cell(1,force_number);
for i_force_number = 1:force_number
    force_file_trc = char(force_file_all(i_force_number));
    force_information = get_force_information(force_file_trc);
    force_plate_corner_coordinate = mean(force_information.force_plate_corner_coordinate,1);
    force_coordinate = get_force_coordinate(force_file_trc,force_plate_corner_coordinate);
    force_label = get_force_label(i_force_number);
    force_table_part_0 = array2table([force_coordinate.force_xyz,force_coordinate.cop_xyz,force_coordinate.moment_xyz],'VariableNames',...
        [force_label.value_label,force_label.cop_label,force_label.moment_label]);
    force_cell_all(i_force_number) = {force_table_part_0};
end

force_table_part_1 = cellfun(@(x) x(:,1:6),force_cell_all,'UniformOutput',false);
force_table_part_2 = cellfun(@(x) x(:,7:9),force_cell_all,'UniformOutput',false);
force_table_part_3 = [horzcat(force_table_part_1{:}),horzcat(force_table_part_2{:})];

time = ((0:force_information.number_sample - 1) + force_information.first_sample)/force_information.frequency;
time = time';
force_table_part_4 = array2table(time,"VariableNames",{'time'});

force_table = [force_table_part_4,force_table_part_3];
end