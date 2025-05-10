%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%segment_marker_set%%%
% 分躯干、骨盆、大腿（左/右）、小腿（左/右）、足（左/右）设置标记点
% 依次设置名称、权重、是否参与IK运算
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function marker_set = IK_marker_set()

% IK_marker_set 标记点名称、权重、是否参与IK

% 骨性标记点

% 躯干
segment_marker_set.name.torso_bone_landmarks = {'Top.Head','Sternum', 'L.Acromium','R.Acromium'};
segment_marker_set.weight.torso_bone_landmarks = [0, 0, 1, 1];
segment_marker_set.apply.torso_bone_landmarks = [false, false, true, true];

% 骨盆
segment_marker_set.name.pelvis_bone_landmarks = {'V.Sacral','L.ASIS','R.ASIS'};
segment_marker_set.weight.pelvis_bone_landmarks = [5, 5, 5];
segment_marker_set.apply.pelvis_bone_landmarks = [true, true, true];

% 大腿-左
segment_marker_set.name.thigh_l_bone_landmarks = {'L.Thigh.Front','L.Knee.Lat','L.Knee.Med'};
segment_marker_set.weight.thigh_l_bone_landmarks = [0, 5, 5];
segment_marker_set.apply.thigh_l_bone_landmarks = [false, true, true];

% 大腿-右
segment_marker_set.name.thigh_r_bone_landmarks = {'R.Thigh.Front','R.Knee.Lat','R.Knee.Med'};
segment_marker_set.weight.thigh_r_bone_landmarks = [0, 5, 5];
segment_marker_set.apply.thigh_r_bone_landmarks = [false, true, true];

% 小腿-左
segment_marker_set.name.shank_l_bone_landmarks = {'L.Shank.Front','L.Ankle.Lat','L.Ankle.Med'};
segment_marker_set.weight.shank_l_bone_landmarks = [0, 1, 1];
segment_marker_set.apply.shank_l_bone_landmarks = [false, true, true];

% 小腿-右
segment_marker_set.name.shank_r_bone_landmarks = {'R.Shank.Front','R.Ankle.Lat','R.Ankle.Med'};
segment_marker_set.weight.shank_r_bone_landmarks = [0, 1, 1];
segment_marker_set.apply.shank_r_bone_landmarks = [false, true, true];

% 足-左
segment_marker_set.name.foot_l_bone_landmarks = {'L.Heel','L.Toe.Lat','L.Toe.Tip'};
segment_marker_set.weight.foot_l_bone_landmarks = [1, 1, 1];
segment_marker_set.apply.foot_l_bone_landmarks = [true, true, true];

% 足-右
segment_marker_set.name.foot_r_bone_landmarks = {'R.Heel','R.Toe.Lat','R.Toe.Tip'};
segment_marker_set.weight.foot_r_bone_landmarks = [1, 1, 1];
segment_marker_set.apply.foot_r_bone_landmarks = [true, true, true];

% 追踪点

% 大腿-左
segment_marker_set.name.thigh_l_tracking = {'L.Thigh1','L.Thigh2','L.Thigh3','L.Thigh4'};
segment_marker_set.weight.thigh_l_tracking = [3, 3, 3, 3];
segment_marker_set.apply.thigh_l_tracking = [true, true, true, true];

% 大腿-右
segment_marker_set.name.thigh_r_tracking = {'R.Thigh1','R.Thigh2','R.Thigh3','R.Thigh4'};
segment_marker_set.weight.thigh_r_tracking = [3, 3, 3, 3];
segment_marker_set.apply.thigh_r_tracking = [true, true, true, true];

% 小腿-左
segment_marker_set.name.shank_l_tracking = {'L.Shank1','L.Shank2','L.Shank3','L.Shank4'};
segment_marker_set.weight.shank_l_tracking = [3, 3, 3, 3];
segment_marker_set.apply.shank_l_tracking = [true, true, true, true];

% 小腿-右
segment_marker_set.name.shank_r_tracking = {'R.Shank1','R.Shank2','R.Shank3','R.Shank4'};
segment_marker_set.weight.shank_r_tracking = [3, 3, 3, 3];
segment_marker_set.apply.shank_r_tracking = [true, true, true, true];


%------------------------------------------------------------------------

% segment_marker_set 名称 组合

marker_set.name.bone_landmarks = [...
    segment_marker_set.name.torso_bone_landmarks,...
    segment_marker_set.name.pelvis_bone_landmarks,...
    segment_marker_set.name.thigh_l_bone_landmarks,...
    segment_marker_set.name.thigh_r_bone_landmarks,...
    segment_marker_set.name.shank_l_bone_landmarks,...
    segment_marker_set.name.shank_r_bone_landmarks,...
    segment_marker_set.name.foot_l_bone_landmarks,...
    segment_marker_set.name.foot_r_bone_landmarks];

marker_set.name.tracking = [...
    segment_marker_set.name.thigh_l_tracking,....
    segment_marker_set.name.thigh_r_tracking,...
    segment_marker_set.name.shank_l_tracking,...
    segment_marker_set.name.shank_r_tracking];

marker_set.name_all = [marker_set.name.bone_landmarks,marker_set.name.tracking];

% segment_marker_set 权重 组合

marker_set.weight.bone_landmarks = [...
    segment_marker_set.weight.torso_bone_landmarks,...
    segment_marker_set.weight.pelvis_bone_landmarks,...
    segment_marker_set.weight.thigh_l_bone_landmarks,...
    segment_marker_set.weight.thigh_r_bone_landmarks,...
    segment_marker_set.weight.shank_l_bone_landmarks,...
    segment_marker_set.weight.shank_r_bone_landmarks,...
    segment_marker_set.weight.foot_l_bone_landmarks,...
    segment_marker_set.weight.foot_r_bone_landmarks];

marker_set.weight.tracking = [...
    segment_marker_set.weight.thigh_l_tracking,....
    segment_marker_set.weight.thigh_r_tracking,...
    segment_marker_set.weight.shank_l_tracking,...
    segment_marker_set.weight.shank_r_tracking];

marker_set.weight_all = [marker_set.weight.bone_landmarks,marker_set.weight.tracking];

% segment_marker_set IK是否参与组合

marker_set.apply.bone_landmarks = [...
    segment_marker_set.apply.torso_bone_landmarks,...
    segment_marker_set.apply.pelvis_bone_landmarks,...
    segment_marker_set.apply.thigh_l_bone_landmarks,...
    segment_marker_set.apply.thigh_r_bone_landmarks,...
    segment_marker_set.apply.shank_l_bone_landmarks,...
    segment_marker_set.apply.shank_r_bone_landmarks,...
    segment_marker_set.apply.foot_l_bone_landmarks,...
    segment_marker_set.apply.foot_r_bone_landmarks];

marker_set.apply.tracking = [...
    segment_marker_set.apply.thigh_l_tracking,....
    segment_marker_set.apply.thigh_r_tracking,...
    segment_marker_set.apply.shank_l_tracking,...
    segment_marker_set.apply.shank_r_tracking];

marker_set.apply_all = [marker_set.apply.bone_landmarks,marker_set.apply.tracking];