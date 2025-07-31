function boxchart_group(input)

value = input.value;
group_number = size(value,2);
case_number = size(value,1);
case_name = input.case_name;
font_size = input.font_size;
group_color = input.group_color;

if isfield(input,'bar_width_coefficient')

    bar_width_coefficient = input.bar_width_coefficient;

else

    bar_width_coefficient = 50/100;

end

if isfield(input,'bar_gap_width_coefficient')

    bar_gap_width_coefficient = input.bar_gap_width_coefficient;

else

    bar_gap_width_coefficient = 30/100;

end

if isfield(input,'legend_name')

    legend_plot = true;
    legend_name = input.legend_name;

else

    legend_plot = false;

end

%--------------------------------------------------------------------------

boxchart_width = 1/group_number * bar_width_coefficient;
boxchart_gap_width = boxchart_width * bar_gap_width_coefficient;
case_length = boxchart_width * group_number + boxchart_gap_width * (group_number - 1);
group_length = case_length / group_number;



boxchart_handle_all = gobjects(group_number,1);
value_mean_all = zeros(case_number,group_number);
x_boxchart_all = zeros(case_number,group_number);
for i_case_number = 1:case_number

    for i_group_number = 1:group_number

        % value_itr = value{i_case_number,i_group_number};
        value_itr = squeeze(value(i_case_number, i_group_number, :));
        value_mean = mean(value_itr);
        value_mean_all(i_case_number,i_group_number) = value_mean;
        % value_max = max(value_itr);
        % value_min = min(value_itr);

        x_boxchart = i_case_number - case_length/2 + group_length * (i_group_number - 0.5);
        x_boxchart_all(i_case_number,i_group_number) = x_boxchart;

        boxchart_handle = boxchart( ...
            x_boxchart*ones(length(value_itr),1),value_itr, ...
            'BoxFaceColor',group_color(i_group_number,:),...
            'BoxFaceAlpha',0.8,...
            'BoxEdgeColor',group_color(i_group_number,:),...
            'BoxMedianLineColor','k',...
            'BoxWidth',boxchart_width,...
            'MarkerStyle','.',...
            'MarkerColor',group_color(i_group_number,:),...
            'MarkerSize',80*boxchart_width,...
            'Notch','off');

        if i_case_number == case_number

            boxchart_handle_all(i_group_number) = boxchart_handle;

        end

    end

end

ax = gca;
ax.FontSize = font_size;

ax.XTick = 1:case_number;
ax.XTickLabel = case_name;
ax.XLim(1) = 1 - case_length * 0.6;
ax.XLim(2) = case_number + case_length * 0.6;
ax.YAxis.FontName = 'Times New Roman';


if legend_plot

    legend(boxchart_handle_all,legend_name,...
        "Box","off",...
        'AutoUpdate','off',...
        'EdgeColor','none',...
        'FontSize',font_size);

end





end