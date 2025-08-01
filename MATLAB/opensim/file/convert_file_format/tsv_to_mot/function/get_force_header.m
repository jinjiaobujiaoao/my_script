function force_header = get_force_header(row_number,column_number)
line_1 = ['nRows=',num2str(row_number)];
line_2 = ['nColumns=',num2str(column_number)];
line_3 = 'inDegrees=yes';
line_4 = 'endheader';
force_header = {line_1;line_2;line_3;line_4};
end