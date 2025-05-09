function [index_start,index_end] = get_phase_index_auto_ones(parameter)

data_force = parameter.data_force;
frequency = parameter.frequency;

[~, col] = max(data_force);

data_force_flipped = flipud(data_force);
[index_start,~] = find(data_force_flipped(length(data_force) - col : end) < 1,1);
index_start = col - index_start;

[index_end,~] = find(data_force(index_start + frequency : end) < 10,1);
if isempty(index_end)

    index_end = length(data_force);

else

    index_end = index_start + frequency + index_end;

end