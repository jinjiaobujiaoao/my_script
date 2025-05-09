function boxchart_group(boxchart_group_data)
value = boxchart_group_data.value;
group_number = size(value,2);
case_number = size(value,1);

case_name = boxchart_group_data.case_name;
font_size = boxchart_group_data.font_size;
group_color = boxchart_group_data.group_color;

bar_width_coefficient = boxchart_group_data.bar_width_coefficient;
bar_gap_width_coefficient = boxchart_group_data.bar_gap_width_coefficient;
boxchart_width = 1/group_number * bar_width_coefficient;
boxchart_gap_width = boxchart_width * bar_gap_width_coefficient;

xline_plot = boxchart_group_data.xline_plot;
if xline_plot
    xline_color = boxchart_group_data.xline_color;
end

legend_plot = boxchart_group_data.legend_plot;
if legend_plot
    legend_name = boxchart_group_data.legend_name;
end

value_mean_plot = boxchart_group_data.value_mean_plot;
if value_mean_plot
    mean_marker_color = boxchart_group_data.mean_marker_color;
end

significant_plot = boxchart_group_data.significant_plot;
if significant_plot
    p_value = boxchart_group_data.p_value;
    p_position = boxchart_group_data.p_position;
end

case_length = boxchart_width * group_number + boxchart_gap_width * (group_number - 1);
group_length = case_length / group_number;

%%
figure;
hold on;
boxchart_handle_all = gobjects(group_number,1);
value_mean_all = zeros(case_number,group_number);
x_boxchart_all = zeros(case_number,group_number);
for i_case_number = 1:case_number
    for i_group_number = 1:group_number

        value_itr = value{i_case_number,i_group_number};
        value_mean = mean(value_itr);
        value_mean_all(i_case_number,i_group_number) = value_mean;
        value_max = max(value_itr);
        value_min = min(value_itr);

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
            'Notch','on');

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
ax.YLim = [value_min * 0.8,value_max * 1.2];

if xline_plot && case_number > 1
    x_line = 1.5:case_number - 0.5;
    xline(x_line,'Color',xline_color,'LineWidth',1,'LineStyle','-','Alpha',0.75);
end

if legend_plot
    legend(boxchart_handle_all,legend_name,...
        "Box","off",...
        'AutoUpdate','off',...
        'EdgeColor','none',...
        'FontSize',font_size);
end

if value_mean_plot
    for i_case_number = 1:case_number
        for i_group_number = 1:group_number
            plot(x_boxchart_all(i_case_number,:),value_mean_all(i_case_number,:),...
                'Color',mean_marker_color,...
                'Marker','o',...
                'MarkerFaceColor',mean_marker_color,...
                'MarkerEdgeColor',1 - mean_marker_color,...
                'MarkerSize',30*boxchart_width);
        end
    end
end

if significant_plot
    for i_case_number = 1:case_number
        if p_value(i_case_number) < 0.001 ||  p_value(i_case_number) == 0.001
            text(i_case_number,p_position,'***','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',font_size);
        elseif (p_value(i_case_number) > 0.001 && p_value(i_case_number) < 0.05) || p_value(i_case_number) == 0.05
            text(i_case_number,p_position,'*','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',font_size);
        end
    end
end

end