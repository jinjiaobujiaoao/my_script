function [force_header,force_table] = tsv_to_mot(force_file_all)
force_table = get_force_table(force_file_all);
row_number = size(force_table,1);
column_number = size(force_table,2);
force_header = get_force_header(row_number,column_number);
end