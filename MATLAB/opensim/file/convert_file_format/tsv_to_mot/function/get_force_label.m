function force_label = get_force_label(force_number)
force_label.value_label = {'ground_force_vx', 'ground_force_vy', 'ground_force_vz'};
force_label.cop_label = {'ground_force_px', 'ground_force_py', 'ground_force_pz'};
force_label.moment_label = {'ground_torque_x', 'ground_torque_y', 'ground_torque_z'};

if force_number > 1
    force_label_name = fieldnames(force_label);
    for i_force_label = 1:length(force_label_name)
        force_label.(char(force_label_name(i_force_label))) = ...
            cellfun(@(x) [num2str(force_number - 1),'_',x],force_label.(char(force_label_name(i_force_label))),'UniformOutput',false);
    end
end

end