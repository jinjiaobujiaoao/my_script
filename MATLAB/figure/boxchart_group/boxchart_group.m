function handles_boxchart = boxchart_group(data)

[index_all_case, index_all_group] = get_index(data);

x = index_all_group;
y = data(:);
index_group = index_all_case;

handles_boxchart = boxchart(x, y, 'GroupByColor', index_group);


end

function [index_all_case, index_all_group] = get_index(data)

number_case = size(data, 1);
number_group = size(data, 2);
number_data = size(data, 3);

index_all_case = nan(length(data(:)), 1);
index_all_group = nan(length(data(:)), 1);

number_index = 0;
for i_number_case = 1:number_case

    for i_number_group = 1:number_group

        for i_number_data = 1:number_data

            number_index = number_index + 1;
            index = ...
                i_number_case + ...
                (i_number_group-1) * number_case + ...
                (i_number_data-1) * number_case * number_group;
            
            index_all_case(index) = i_number_group;
            index_all_group(index) = i_number_case*2;


        end

    end

end

end
