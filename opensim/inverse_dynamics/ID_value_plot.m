function ID_value_plot(ID_output_file,weight)

ID_data = readtable(ID_output_file,'FileType','text','Delimiter','\t','HeaderLines',6);

% 读取选择关节的运动角动量
name_all = {'hip_r','knee_r','foot_r','hip_l','knee_l','foot_l','lumbar','pelvis','pelvis_xyz'};
name.hip_r = {'hip_flexion_r_moment','hip_adduction_r_moment','hip_rotation_r_moment'};
name.knee_r = {'knee_angle_r_moment','knee_angle_r_ie_moment','knee_angle_r_vv_moment'};
name.foot_r = {'ankle_angle_r_moment','subtalar_angle_r_moment'};
name.hip_l = {'hip_flexion_l_moment','hip_adduction_l_moment','hip_rotation_l_moment'};
name.knee_l = {'knee_angle_l_moment','knee_angle_l_ie_moment','knee_angle_l_vv_moment'};
name.foot_l = {'ankle_angle_l_moment','subtalar_angle_l_moment'};
name.lumbar = {'lumbar_extension_moment','lumbar_bending_moment','lumbar_rotation_moment'};
name.pelvis = {'pelvis_tilt_moment','pelvis_list_moment','pelvis_rotation_moment'};
name.pelvis_xyz = {'pelvis_tx_force','pelvis_ty_force','pelvis_tz_force'};

% 画图3*3
figure;
tiledlayout(3,3,"TileSpacing","compact","Padding","compact");
sgtitle('Moment');
for i_name_1 = 1:length(name_all)
    name_itr = char(name_all(i_name_1));
    nexttile;
    hold on
    for i_name_2 = 1:length(name.(name_itr))
        value_ID = ID_data.(char(name.(name_itr)(i_name_2)));
        plot(value_ID/weight,'LineWidth',2,'DisplayName',char(name.(name_itr)(i_name_2)));
        title(name_itr,'Interpreter','none');
    end
    legend('Interpreter','none','Box','off','Color','none');
    hold off
end
