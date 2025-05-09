function IK_value_plot(IK_output_file)
% 读取输出的IK数据
IK_data = readtable(IK_output_file, 'FileType', 'text', 'Delimiter', '\t', 'HeaderLines', 10);
% 读取选择关节的运动角度
name_all = {'hip_r','knee_r','foot_r','hip_l','knee_l','foot_l','lumbar','pelvis'};
name.hip_r = {'hip_flexion_r','hip_adduction_r','hip_rotation_r'};
name.knee_r = {'knee_angle_r','knee_angle_r_ie','knee_angle_r_vv'};
name.foot_r = {'ankle_angle_r','subtalar_angle_r'};
name.hip_l = {'hip_flexion_l','hip_adduction_l','hip_rotation_l'};
name.knee_l = {'knee_angle_l','knee_angle_l_ie','knee_angle_l_vv'};
name.foot_l = {'ankle_angle_l','subtalar_angle_l'};
name.lumbar = {'lumbar_extension','lumbar_bending','lumbar_rotation'};
name.pelvis = {'pelvis_tilt','pelvis_list','pelvis_rotation'};


figure;
% 画图3*3
tiledlayout(3,3,"TileSpacing","compact","Padding","compact");
sgtitle('Angle');
for i_name_1 = 1:length(name_all)
    name_itr = char(name_all(i_name_1));
    nexttile;
    hold on
    for i_name_2 = 1:length(name.(name_itr))
        value_IK = IK_data.(char(name.(name_itr)(i_name_2)));
        plot(value_IK,'LineWidth',2,'DisplayName',char(name.(name_itr)(i_name_2)));
        title(name_itr,'Interpreter','none');
    end
    legend('Interpreter','none','Box','off','Color','none');
    hold off
end
