function marker_label = get_marker_existed(marker_label_default, marker_label)

number_logical = ismember(marker_label_default,marker_label);
if sum(number_logical)
    marker_label = char(marker_label_default(number_logical));
else
    marker_label = '';
end
end