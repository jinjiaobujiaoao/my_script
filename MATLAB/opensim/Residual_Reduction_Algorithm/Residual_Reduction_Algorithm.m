function Residual_Reduction_Algorithm(RRA_information)
time_range = RRA_information.time_range;
model_file = RRA_information.model_file;
externalLoads_file = RRA_information.externalLoads_file;
desired_kinematics_file = RRA_information.desired_kinematics_file;
task_set_file = RRA_information.task_set_file;
constraints_file = RRA_information.constraints_file;
force_set_file = RRA_information.force_set_file;
output_model_file = RRA_information.output_model_file;
output_file_path = RRA_information.output_file_path;
output_file_name = RRA_information.output_file_name;

RRA_file_path = pwd;
RRA_file_name = 'RRA_setup.xml';
RRA_file = fullfile(RRA_file_path,RRA_file_name);

RRA_output_precision = 8;
RRA_lowpass_cutoff_frequency = 6;
RRA_adjusted_com_body = 'torso';

%% 1. 生成RRA Setup XML文件
import org.opensim.modeling.*
RRA_Tool = RRATool(); 
RRA_Tool.setModelFilename(model_file);
RRA_Tool.setReplaceForceSet(true);
RRA_Tool.setForceSetFiles(force_set_file);
RRA_Tool.setResultsDir(output_file_path);
RRA_Tool.setOutputPrecision(RRA_output_precision);
RRA_Tool.setInitialTime(time_range(1));
RRA_Tool.setFinalTime(time_range(2));
RRA_Tool.setSolveForEquilibrium(true);
RRA_Tool.setMaximumNumberOfSteps(20000);
RRA_Tool.setMaxDT(1);
RRA_Tool.setMinDT(1e-08);
RRA_Tool.setErrorTolerance(1e-05);

RRA_Tool.setExternalLoadsFileName(externalLoads_file);
RRA_Tool.setDesiredKinematicsFileName(desired_kinematics_file);
RRA_Tool.setTaskSetFileName(task_set_file);
RRA_Tool.setConstraintsFileName(constraints_file);
RRA_Tool.setLowpassCutoffFrequency(RRA_lowpass_cutoff_frequency);
RRA_Tool.setAdjustCOMToReduceResiduals(true);
RRA_Tool.setAdjustedCOMBody(RRA_adjusted_com_body);
RRA_Tool.setOutputModelFileName(output_model_file);
RRA_Tool.print(RRA_file);

clearvars RRA_Tool;
%% 执行 RRA
RRA_Tool = RRATool(RRA_file);
RRA_Tool.setName(output_file_name);
RRA_Tool.run();

RRA_average_residuals = readlines(fullfile(output_file_path,[output_file_name,'_avgResiduals.txt']));
disp(RRA_average_residuals);
end

