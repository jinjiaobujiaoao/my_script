function IK_error_plot()
figure;
grid on;
hold on;

% 读取IK errors
filePath = fullfile(pwd, "_ik_marker_errors.sto");
data = readtable(filePath, 'FileType', 'text', 'Delimiter', '\t', 'HeaderLines', 6);

time = data.time;
total_squared_error = data.total_squared_error;
marker_error_rms = data.marker_error_RMS;
marker_error_max = data.marker_error_max;

% 显示IK errors
fprintf('%-25s %10.3f\n', 'mean marker error max:', mean(marker_error_max));
fprintf('%-25s %10.3f\n', 'mean total squared error:', mean(total_squared_error));
fprintf('%-25s %10.3f\n', 'mean marker error rms:', mean(marker_error_rms));

line_1 = plot(total_squared_error,'k-', 'LineWidth',2,'DisplayName', '\fontname{Times New Roman}total squared error');
line_2 = plot(marker_error_rms,'r-', 'LineWidth',2,'DisplayName', '\fontname{Times New Roman}marker error rms');
line_3 = plot(marker_error_max,'b-', 'LineWidth',2,'DisplayName', '\fontname{Times New Roman}marker error max');
hold off
yline(0.02,'r--','\fontname{Times New Roman}Max errors line','FontSize',16,'LineWidth',2, ...
    'LabelHorizontalAlignment','center','LabelVerticalAlignment','middle');

legend_handle = legend([line_1,line_2,line_3],'FontSize',16,'Interpreter','tex');
set(legend_handle,'box','off','color','none');

ylabel('\fontname{Times New Roman}marker errors value(m)','FontSize',16);

xticklabels(time);
xlabel('\fontname{Times New Roman}time(s)','FontSize',16);

