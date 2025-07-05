% Set flag indicating whether or not to convert length units from mm to m
% 0 = no, 1 = yes
%convertLengthUnits = 0 if unspecified;

function [rMakers] = c3d_export_trc(path,filename,markersFilepath,markersFilename)

% The function names output .trc and .mot files with the same
% basename as the selcted input .c3d file.

convertLengthUnits =  0;

%% Example of using the Matlab-OpenSim class

%% Load OpenSim libs
import org.opensim.modeling.*

%% Get the path to a C3D file
% [filename, path] = uigetfile('*.c3d');
c3dpath = fullfile(path,filename);

%% Construct an opensimC3D object with input c3d path
% Constructor takes full path to c3d file and an integer for forceplate
% representation in output forces file (0 = electrical center, 1 = COP).
c3d = osimC3D(c3dpath,1);

%% Get some stats...
% Get the number of marker trajectories
nTrajectories = c3d.getNumTrajectories();
% Get the marker data rate
rMakers = c3d.getRate_marker();

% Get Start and end time
t0 = c3d.getStartTime();
tn = c3d.getEndTime();

%% Rotate the data
c3d.rotateData('x',-90);

%% Get the c3d in different forms
% Get OpenSim tables
markerTable = c3d.getTable_markers();

% Get as Matlab Structures
% [markerStruct,~] = c3d.getAsStructs();

%% Convert COP (mm to m) and Moments (Nmm to Nm)
if convertLengthUnits
    c3d.convertMillimeters2Meters();
end

%% Write the marker and force data to file
% Define output file names
% basename = strtok(filename,'.');
% markersFilename = strcat(basename,'_markers.trc');

% Write marker data to trc file.
% c3d.writeTRC()                       Write to dir of input c3d.
% c3d.writeTRC('Walking.trc')          Write to dir of input c3d with defined file name.
% c3d.writeTRC('C:/data/Walking.trc')  Write to defined path input path.
c3d.writeTRC(fullfile(markersFilepath,markersFilename));


