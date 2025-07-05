function angle_CRP = continuous_relative_phase(angle_1,angle_2)
% angle_1 = Phase_Angle(angle_1);
angle_1 = Hilbert_PA(angle_1);

% angle_2 = Phase_Angle(angle_2);
angle_2 = Hilbert_PA(angle_2);

angle_CRP = CRP(angle_1,angle_2);
end