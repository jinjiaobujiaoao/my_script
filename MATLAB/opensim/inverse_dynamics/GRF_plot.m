

function GRF_plot(force_file,time_range,weight,sampling_frequency)
GRF_data = readtable(force_file,"FileType","text",'Delimiter','\t','HeaderLines',6);

% 选择读取的GRF变量
name_all = {'force_value_1','force_value_2','force_point_1','force_point_2'};
name.force_value_1 = {'ground_force_vx','ground_force_vy','ground_force_vz'};
name.force_point_1 = {'ground_force_px','ground_force_py','ground_force_pz'};
name.force_value_2 = {'x1_ground_force_vx','x1_ground_force_vy','x1_ground_force_vz'};
name.force_point_2 = {'x1_ground_force_px','x1_ground_force_py','x1_ground_force_pz'};

figure;
tiledlayout(2,2,"TileSpacing","compact","Padding","compact");
for i_name_all = 1:length(name_all)
    nexttile;
    hold on;
    grid on;
    name_itr = name.(char(name_all(i_name_all)));
    for i_name = 1:length(name_itr)
        value_GRF = GRF_data.(char(name_itr(i_name)));
        if i_name_all == 1 || i_name_all == 2
            plot(value_GRF/(weight*9.8),'LineWidth',2,'DisplayName',char(name_itr(i_name)));
        else
            plot(value_GRF,'LineWidth',2,'DisplayName',char(name_itr(i_name)));
        end
    end
    x_tick_labels = [time_range(1),(time_range(1)+time_range(2))/2,time_range(2)];
    xlim([time_range(1),time_range(2)]*sampling_frequency);
    xticks(x_tick_labels*sampling_frequency);
    xticklabels(x_tick_labels);
    legend('Interpreter','none');
    hold off;
end


