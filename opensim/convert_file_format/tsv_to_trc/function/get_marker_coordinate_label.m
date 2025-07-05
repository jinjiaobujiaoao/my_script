function marker_coordinate_label = get_marker_coordinate_label(number_marker)
marker_coordinate_label = arrayfun(@(i) {['X',num2str(i)],['Y',num2str(i)],['Z',num2str(i)]},1:number_marker,'UniformOutput',false);
marker_coordinate_label = [marker_coordinate_label{:}];
end