%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% AST: Tool for Automatic Scaling of generic MSK OpenSim models
% Authors: Andrea Di Pietro, University of Pisa, (Italy)
%          Alex Bersani, Alma Mater Studiorum - University of Bologna, (Italy)
%          Uploaded on 23/12/2023
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Input:
%       - Unscaled OpenSim model
%       - TRC static file
%       - Starting Scaling setup file
%
%   Output:
%       - Scaled MSK model with Marker Registering and all unlocked coordinates
%       - Scaled MSK model with Marker Registering
%       - Solving Setup Files
%
%
% Created for OpenSim 4.3
%
% "AST: an OpenSim-based tool for the automatic scaling of generic musculoskeletal models" © 2024
% by Andrea Di Pietro and Alex Bersani is licensed under CC BY-NC 4.0
% Please cite : "AST: an OpenSim-based tool for the automatic scaling of generic musculoskeletal models;
%                Andrea Di Pietro, Alex Bersani, Cristina Curreli,Francesca Di Puccio; Computers in Biology and Medicine; 2024"
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function scale_model(parameter)

Info = parameter.Info;
BaseModelFile = parameter.file_model_base;
TRCFile = parameter.file_scale_trc;
SetupFile = parameter.file_scale_task;
targetpath = parameter.file_path_target;
prepared_file_path = parameter.file_path_prepared;
model_name = parameter.model_name;

%% 创建临时文件夹，储存迭代文件

fclose("all");

if exist(fullfile(prepared_file_path,'file'),'dir')
    rmdir(fullfile(prepared_file_path,'file'),'s');
end
mkdir(fullfile(prepared_file_path,'file'));

copyfile(fullfile(prepared_file_path,BaseModelFile),fullfile(prepared_file_path,'file',BaseModelFile));
copyfile(fullfile(prepared_file_path,TRCFile),fullfile(prepared_file_path,'file',TRCFile));
copyfile(fullfile(prepared_file_path,SetupFile),fullfile(prepared_file_path,'file',SetupFile));


filePath = fullfile(prepared_file_path,'\file');

TRCFolder = filePath;
modelFolder = filePath;
startingSetupFolder = filePath;

%%
% addpath(genpath(cd))
import org.opensim.modeling.*;
tic
%% importing data files to run operations, parameters to set, defining the manual scale factors
run inputAST
name_ModelScaledAdj='ModelScaledMarkerAdj.osim'; % Name of the final scaled model

%% Setup Tool user paramenters
Km=200; % iterations Threshold : number of iterations
EndErr=0.02; % End condition for RMS error of loop while
ManualScaleErr=0.025; % error over which the scaling becomes manual for all bodies
rep=4; % number of times to perform manual scaling just for detected segment
rep2=8;%  number of times to perform manual scaling for all segments
%% start of algorithm's parameter : Don't modify these parameters
s=-1; % initially the sign for adding the position increment is negative
k=1; % first cycle
flag=0; % flag = 1 if the tool is scaling with Manual scaing factor just for some segments
ind=0; % counter for flag used as a controller
flag2=0;% flag2 =  if the tool is scaling with Manual scaing factor just for all segments
ind2=0;% counter for flag2 used as a controller

%% Creation of algorithm required tool
% Scale tool: loading pre-existent scaling setup file then uploading it
% Creation Ik tool for Static trial from Scaling setup
% Creation of Scale tool with Manual scale factor if RMS erorr exceeds ManualScaleErr Threshold
run createTools

%% determininig coordinate values
if pose==1 % pose =1 means you have chosen to match the experimental pose
    ScaleTool(path_manualScale).run; %Run the manual scaling tool
    ScaledModelFirst= Model(fullfile(modelFolder,ScaledFileName)); % calling the Scaled model
    ikCoord=InverseKinematicsTool(path_ik_static); % call back IK tool for static trial
    ikCoord.setModel(ScaledModelFirst); % set the Scaled model in the IK tool
    ikCoord.run; % run IK
    [CoordData, Coordhead]=load_mot(fullfile(modelFolder,CoordFileName));% load the just computed coordinates
    CoordData=CoordData(:,2:end); % exclude time column from the IK result file
    AvgCoordData = deg2rad(mean(CoordData));% averaging coordinates over time and convert to radians
    AvgCoordData(4:6)=zeros(1,3); % The translation of the pelvis are set to 0 !!!!! To modify in case of different coordinates sequence of the model !!!!!
    %putting the coordinate values inside scaling marker placer
    d=1;
    for u=0:model.getJointSet.getSize-1 % for every joint
        for v=0:model.getJointSet.get(u).numCoordinates-1 % get every coordinate from every joint
            model.getJointSet.get(u).get_coordinates(v).set_clamped(0); % not clamped
            model.getJointSet.get(u).get_coordinates(v).set_default_value(AvgCoordData(d));% insert in every coordinate the relative computed value from IK
            d=d+1;
        end
    end
    model.print(fullfile(modelFolder,modelFile));%save the model with new coordinates
end
markerset=model.getMarkerSet; % getting the generic markerset from unscaled model
markerset.print(fullfile(modelFolder,'MarkerSet.xml')); % printing the markerset
Nmarkers=markerset.getSize;% retrive number of markers

%% Execution of Autoscaling
run AST_core_v1

%% create the final scaled model with marker placement
if ManualBodies~=0
    AdjScaler=ScaleTool(path_ScalerMix);
else
    AdjScaler=ScaleTool(fullfile(modelFolder,SetupFile));%New scale tool with marker adjustments
end
AdjScaler.getGenericModelMaker.setModelFileName(modelFile);
AdjScaler.getMarkerPlacer.setApply(1);%repositioning markers after scaling
AdjScaler.getMarkerPlacer.setOutputModelFileName(name_ModelScaledAdj);%set the scaled model name
path_SetupScaleAdj=fullfile(modelFolder, 'ScalingSetupMarkerAdj.xml');
AdjScaler.print(path_SetupScaleAdj); %save setup file
ScaleTool(path_SetupScaleAdj).run; %create model
modelScaledUnlocked=UnlockModel(modelFolder,name_ModelScaledAdj);% unblocking coordinates to scaled model if at least one locked coordinate has been detected
tEnd=cputime;
ElapsedTime=tEnd-tStart;

tempo_exc = toc;
tempo_minuti_exc = tempo_exc/60;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%  删除迭代文件，将 model 复制到 targetpath
fprintf('用时：%.3f s\n',tempo_exc);
parentPath = fileparts(filePath);
fclose("all");
if exist(fullfile(targetpath,model_name),"file")
    delete(fullfile(targetpath,model_name));
end
copyfile(fullfile(parentPath,'file','ModelScaledMarkerAdj.osim'),fullfile(targetpath,model_name));
rmdir(fullfile(parentPath,'file'), 's');  % 删除文件夹及其中的所有内容





