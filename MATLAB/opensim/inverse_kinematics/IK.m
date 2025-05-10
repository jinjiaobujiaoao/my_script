%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IK_Model                  模型文件
% IK_marker_file            标记点文件
% IK_time_range IK          执行时间
% IK_coordinates_file       坐标文件（一般不需要，设定为：''）
% IK_output_motion_file     IK输出文件路径及其文件名（例子：'D:\path_1\path_2\ik.mot'）
% error_plot             是否可视化IK error   true/false
% value_plot             是否可视化IK value   true/false
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function IK(input)

IK_Model = input.IK_Model;
IK_marker_file = input.IK_marker_file;
IK_time_range = input.IK_time_range;
IK_output_file = input.IK_output_file;

if isfield('plot_error',input)

    plot_error = input.plot_error;

else

    plot_error = false;

end

if isfield('plot_value',input)

    plot_value = input.plot_value;

else

    plot_value = false;

end

import org.opensim.modeling.*;
% 导入模型
IK_Model.initSystem();
% 创建IK工具
IKTool = InverseKinematicsTool();
% 应用模型于IK
IKTool.setModel(IK_Model);
% 设置IK起、止时间
IKTool.setStartTime(IK_time_range(1));
IKTool.setEndTime(IK_time_range(2));
% 设置经IK后的结果文件保存路径
IKTool.setOutputMotionFileName(IK_output_file);

% 获得IK marker标记点属性
marker_set = IK_marker_set();

% 设置IK marker标记点属性
IK_task_set = IKTool.get_IKTaskSet();
% 设置IK marker名称（Name）、权重（Weight）、是否参与（Apply）
for i = 1:size(marker_set.name_all,2)

    IK_marker_task = IKMarkerTask();
    IK_marker_task.setName(marker_set.name_all{i});
    IK_marker_task.setWeight(marker_set.weight_all(i));
    IK_marker_task.setApply(marker_set.apply_all(i));
    IK_task_set.cloneAndAppend(IK_marker_task);

end

% 设置标记点
IKTool.setMarkerDataFileName(IK_marker_file);
% 设置坐标（一般不需要单独设置，默认为：''）
IK_coordinates_file = '';
IKTool.set_coordinate_file(IK_coordinates_file);
% 执行IK
IKTool.run();

% IK value 可视化
if plot_value

    IK_value_plot(IK_output_file);

end

% IK errors 可视化
if plot_error

    IK_error_plot();

end









