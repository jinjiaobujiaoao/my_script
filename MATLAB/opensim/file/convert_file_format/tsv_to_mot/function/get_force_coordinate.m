function force_coordinate = get_force_coordinate(force_file_trc,force_plate_corner_coordinate)
file_force_table = readtable(force_file_trc,'FileType','text');
[file_force_table.COP_X,file_force_table.COP_Y] = deal(file_force_table.COP_Y,file_force_table.COP_X);
file_force_table.COP_X = file_force_table.COP_X + force_plate_corner_coordinate(1);
file_force_table.COP_Y = file_force_table.COP_Y + force_plate_corner_coordinate(2);

[file_force_table.COP_X, file_force_table.COP_Y,file_force_table.COP_Z] = ...
    deal(file_force_table.COP_X/1000, file_force_table.COP_Z/1000,-file_force_table.COP_Y/1000);
[file_force_table.Force_X, file_force_table.Force_Y,file_force_table.Force_Z] = ...
    deal(-file_force_table.Force_Y, file_force_table.Force_Z,file_force_table.Force_X);
[file_force_table.Moment_X, file_force_table.Moment_Y,file_force_table.Moment_Z] = ...
    deal(-file_force_table.Moment_Y, file_force_table.Moment_Z,file_force_table.Moment_Y);


force_coordinate.cop_xyz = [file_force_table.COP_X, file_force_table.COP_Y,file_force_table.COP_Z];
force_coordinate.force_xyz = [file_force_table.Force_X, file_force_table.Force_Y,file_force_table.Force_Z];
force_coordinate.moment_xyz = [file_force_table.Moment_X, file_force_table.Moment_Y,file_force_table.Moment_Z];
end