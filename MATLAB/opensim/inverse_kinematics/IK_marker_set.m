%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 分躯干、骨盆、大腿（左/右）、小腿（左/右）、足（左/右）设置标记点
% 依次设置名称、权重、是否参与IK运算
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [IK_marker_task_name,IK_marker_task_weight,IK_marker_task_apply] = IK_marker_set()

% marker 标记点名称、权重、是否参与IK
% 躯干
IK_marker_task_name_torso = {'Top.Head','Sternum', 'L.Acromium','R.Acromium'};
IK_marker_task_weight_torso = [0, 0, 1, 1];
IK_marker_task_apply_torso = [false, false, true, true];
% 骨盆
IK_marker_task_name_pelvis = {'V.Sacral','L.ASIS','R.ASIS'};
IK_marker_task_weight_pelvis = [5, 5, 5];
IK_marker_task_apply_pelvis = [true, true, true];
% 大腿-左
IK_marker_task_name_thigh_l = {'L.Thigh.Front','L.Knee.Lat','L.Knee.Med'};
IK_marker_task_weight_thigh_l = [0, 5, 5];
IK_marker_task_apply_thigh_l = [false, true, true];
% 大腿-右
IK_marker_task_name_thigh_r = {'R.Thigh.Front','R.Knee.Lat','R.Knee.Med'};
IK_marker_task_weight_thigh_r = [0, 5, 5];
IK_marker_task_apply_thigh_r = [false, true, true];
% 小腿-左
IK_marker_task_name_shank_l = {'L.Shank.Front','L.Ankle.Lat','L.Ankle.Med'};
IK_marker_task_weight_shank_l = [0, 1, 1];
IK_marker_task_apply_shank_l = [false, true, true];
% 小腿-右
IK_marker_task_name_shank_r = {'R.Shank.Front','R.Ankle.Lat','R.Ankle.Med'};
IK_marker_task_weight_shank_r = [0, 1, 1];
IK_marker_task_apply_shank_r = [false, true, true];
% 足-左
IK_marker_task_name_foot_l = {'L.Heel','L.Toe.Lat','L.Toe.Tip'};
IK_marker_task_weight_foot_l = [1, 1, 1];
IK_marker_task_apply_foot_l = [true, true, true];
% 足-有
IK_marker_task_name_foot_r = {'R.Heel','R.Toe.Lat','R.Toe.Tip'};
IK_marker_task_weight_foot_r = [1, 1, 1];
IK_marker_task_apply_foot_r = [true, true, true];

% marker 名称 组合
IK_marker_task_name = [IK_marker_task_name_torso,IK_marker_task_name_pelvis,IK_marker_task_name_thigh_l,...
    IK_marker_task_name_thigh_r,IK_marker_task_name_shank_l,IK_marker_task_name_shank_r,...
    IK_marker_task_name_foot_l,IK_marker_task_name_foot_r];
% marker 权重 组合
IK_marker_task_weight = [IK_marker_task_weight_torso,IK_marker_task_weight_pelvis,IK_marker_task_weight_thigh_l,...
    IK_marker_task_weight_thigh_r,IK_marker_task_weight_shank_l,IK_marker_task_weight_shank_r,...
    IK_marker_task_weight_foot_l,IK_marker_task_weight_foot_r];
% marker IK是否参与 组合
IK_marker_task_apply = [IK_marker_task_apply_torso,IK_marker_task_apply_pelvis,IK_marker_task_apply_thigh_l,...
    IK_marker_task_apply_thigh_r,IK_marker_task_apply_shank_l,IK_marker_task_apply_shank_r,...
    IK_marker_task_apply_foot_l,IK_marker_task_apply_foot_r];