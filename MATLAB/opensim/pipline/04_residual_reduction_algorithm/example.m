clc;clear;close all

file_prepared_path = fullfile(pwd,'file_prepared');

RRA_time_range = [0.81,1.3];

RRA_model_file_path = file_prepared_path;
RRA_model_file_name = 'ModelScaledMarkerAdj.osim';
RRA_model_file = fullfile(RRA_model_file_path,RRA_model_file_name);

RRA_externalLoads_file_path = file_prepared_path;
RRA_externalLoads_file_name = 'externalLoads.xml';
RRA_externalLoads_file = fullfile(RRA_externalLoads_file_path,RRA_externalLoads_file_name);

RRA_desired_kinematics_file_path = file_prepared_path;
RRA_desired_kinematics_file_name = 'IK_results_Left1.mot';
RRA_desired_kinematics_file = fullfile(RRA_desired_kinematics_file_path,RRA_desired_kinematics_file_name);

RRA_task_set_file_path = file_prepared_path;
RRA_task_set_file_name = 'subj01_acl_RRA_Tasks-ie.xml';
RRA_task_set_file = fullfile(RRA_task_set_file_path,RRA_task_set_file_name);

RRA_constraints_file_path = '';
RRA_constraints_file_name = '';
RRA_constraints_file = fullfile(RRA_constraints_file_path,RRA_constraints_file_name);

import org.opensim.modeling.*
RRA_force_set_file_path = file_prepared_path;
RRA_force_set_file_name = 'subj01_acl_RRA_Actuators-ie.xml';
RRA_force_set_file = ArrayStr();
RRA_force_set_file.append(fullfile(RRA_force_set_file_path,RRA_force_set_file_name));

RRA_output_model_file_path = file_prepared_path;
RRA_output_model_file_name = 'RRA_model.osim';
RRA_output_model_file = fullfile(RRA_output_model_file_path,RRA_output_model_file_name);

RRA_output_file_path = fullfile(pwd,'file_result');
RRA_output_file_name = 'subject';


RRA_information.time_range = RRA_time_range;
RRA_information.model_file = RRA_model_file;
RRA_information.externalLoads_file = RRA_externalLoads_file;
RRA_information.desired_kinematics_file = RRA_desired_kinematics_file;
RRA_information.task_set_file = RRA_task_set_file;
RRA_information.constraints_file = RRA_constraints_file;
RRA_information.force_set_file = RRA_force_set_file;
RRA_information.output_model_file = RRA_output_model_file;
RRA_information.output_file_path = RRA_output_file_path;
RRA_information.output_file_name = RRA_output_file_name;


Residual_Reduction_Algorithm(RRA_information);



