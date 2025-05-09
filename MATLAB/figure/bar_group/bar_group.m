function bar_group(bar_group_data,bar_group_figure_information)
% figure;
% hold on;
data_value = bar_group_data.value;
data_std = bar_group_data.std;
value_p = bar_group_data.p;

legend_name = bar_group_figure_information.legend;
case_name = bar_group_figure_information.xticklabels;
font_size = bar_group_figure_information.FontSize;
font_name = 'Times New Roman';

bar_color = bar_group_figure_information.bar_color;
bar_width_coefficient = bar_group_figure_information.bar_width_coefficient;
bar_gap_width_coefficient = bar_group_figure_information.bar_gap_width_coefficient;

legend_plot = bar_group_figure_information.legend_plot;

xline_plot = bar_group_figure_information.xline_plot;
xline_color = bar_group_figure_information.xline_color;
%%
X = 1:size(data_value,1);
Y = data_value + data_std;

number_group = size(data_value,2);
number_case = size(data_value,1);

bar_width = 1/number_group * bar_width_coefficient;
bar_gap_width = bar_width * bar_gap_width_coefficient;

bar_handle_all = gobjects(number_group,1);

for i_bar = 1:number_group

    X_bar = X + (i_bar - 1)*(bar_width + bar_gap_width) - (bar_width + bar_gap_width)*(number_group/2 - 0.5);
    bar_handle = bar(X_bar,data_value(:,i_bar),bar_width);
    bar_handle.FaceColor = bar_color(i_bar,:);
    bar_handle.EdgeColor = "none";
    bar_handle_all(i_bar) = bar_handle;

    errorbar_handle = errorbar(X_bar,data_value(:,i_bar),data_std(:,i_bar));
    errorbar_handle.Color = 'k';
    errorbar_handle.LineWidth = 0.75;
    errorbar_handle.LineStyle = 'none';

end

ax = gca;
ax.Layer = 'top';
ax.FontSize = font_size;

ax.XTick = X;
ax.XTickLabel = case_name;

XAxis_excess_length = (1 - ax.XLim(1)) - (bar_width*number_group + bar_gap_width*(number_group - 1))/2;
ax.XLim(1) = ax.XLim(1) + XAxis_excess_length * 0.75;
ax.XLim(2) = ax.XLim(2) - XAxis_excess_length * 0.75;

ax.YAxis.FontName = font_name;
ax.YLim = [0,max(Y(:))*1.2];

if xline_plot
    x_line = 1.5:number_case + 0.5;
    xline(x_line,'Color',xline_color,'LineWidth',1,'LineStyle','-','Alpha',0.75);
end

if legend_plot
    leg = legend(bar_handle_all,legend_name);
    leg.Box = 'off';
    leg.FontSize = font_size;
end

for i_case = 1:number_case
    if value_p(i_case) < 0.001 ||  value_p(i_case) == 0.001
        text(X(i_case),max(Y(i_case,:))*1.05,'***','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',font_size);
    elseif (value_p(i_case) > 0.001 && value_p(i_case) < 0.05) || value_p(i_case) == 0.05
        text(X(i_case),max(Y(i_case,:))*1.05,'*','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',font_size);
    end
end

end


