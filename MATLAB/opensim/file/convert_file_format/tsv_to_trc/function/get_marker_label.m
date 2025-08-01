function [marker_label,index_marker_exist] = get_marker_label(file_trc)

line_all = readlines(file_trc);

number_target = get_number_target(file_trc,'MARKER_NAMES');
marker_label_default = get_marker_label_default();

marker_label = line_all(number_target);
marker_label = split(marker_label);
marker_label = marker_label(2:end);
marker_label = cellstr(marker_label);
marker_label = cellfun(@(x) get_marker_existed(marker_label_default, x), marker_label, 'UniformOutput', false);

index_marker_exist = ~cellfun(@isempty,marker_label);
marker_label = marker_label(index_marker_exist);
marker_label = cellfun(@(x) [x,char(9),char(9)],marker_label,'UniformOutput',false); %char(9) 是 TAB（ASCII 9），存储在 cell 里是一个真正的制表符。

end