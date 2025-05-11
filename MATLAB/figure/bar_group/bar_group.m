function bar_group(input)

data_value = input.data.value;
data_std = input.data.std;

if isfield(input.data,'p')

    value_p = ones(length(data_value),1);
    value_p = value_p(:);

else

    value_p = input.data.p;

end

if isfield(input,'legend_name')

    legend_plot = true;
    legend_name = input.legend;

else

    legend_plot = false;

end

if isfield(input,'xline_color')

    xline_plot = true;
    xline_color = input.xline_color;

else

    xline_plot = false;

end

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

bar_color = input.bar_color;

case_name = input.xticklabels;
font_size = input.FontSize;
font_name = 'Times New Roman';

%-----------------------------------------------------------------------

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

    x_line = 1.5:number_case - 0.5;
    xline(x_line,'Color',xline_color,'LineWidth',1,'LineStyle','-','Alpha',0.75);

end

if legend_plot

    leg = legend(bar_handle_all,legend_name);
    leg.Box = 'off';
    leg.FontSize = font_size;

end

for i_case = 1:number_case

    if value_p(i_case) < 0.001 ||  value_p(i_case) == 0.001

        text(X(i_case),max(Y(i_case,:))*1.05,'***','HorizontalAlignment',...
            'center','VerticalAlignment','middle','FontSize',font_size);

    elseif (value_p(i_case) > 0.001 && value_p(i_case) < 0.05) || value_p(i_case) == 0.05

        text(X(i_case),max(Y(i_case,:))*1.05,'*','HorizontalAlignment',...
            'center','VerticalAlignment','middle','FontSize',font_size);

    end

end

end