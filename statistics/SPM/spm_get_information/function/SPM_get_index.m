function [index_start,index_end] = SPM_get_index(z,z_star)
index_1 = z > z_star;
index_1 = [0,index_1,0];
index_2 = diff(index_1);
index_start = find(index_2 > 0);
index_end = find(index_2 < 0);

length_data = length(z);
if length(index_start) ~= length(index_end)
    if (length(index_start) > length(index_end)) && (index_start(end) ~= length_data)
        index_end = [index_end,length_data - 1];
    elseif (length(index_start) > length(index_end)) && (index_start(end) == length_data)
        index_end = [index_end,length_data - 1];
    elseif (length(index_start) < length(index_end)) && (index_end(1) ~= 1)
        index_start = [1,index_start];
    elseif (length(index_start) < length(index_end)) && (index_end(1) == 1)
        index_start = [0,index_start];
    end
end

index_start = index_start - 1;
index_end = index_end - 1;
end
