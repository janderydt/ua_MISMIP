function [UserVar,CtrlVar,MeshBoundaryCoordinates]=DefineInitialInputs(UserVar,CtrlVar)

CtrlVar.Experiment='misomip_exp3';
CtrlVar.doplots=0; CtrlVar.doRemeshPlots=1;

xd=1800e3; xu=0 ; yl=10e3 ; yr=-10e3;
MeshBoundaryCoordinates=flipud([xu yr ; xd yr ; xd yl ; xu yl]);

%% Types of runs
CtrlVar.TimeDependentRun=1;
CtrlVar.time=0 ;
CtrlVar.dt=0.01;
CtrlVar.TotalNumberOfForwardRunSteps=1e10;
CtrlVar.AdaptiveTimeStepping=1 ;
CtrlVar.TotalTime=285e3;

CtrlVar.DefineOutputsDt=500; % in years
CtrlVar.ThicknessConstraints=1;
CtrlVar.ThickMin=1;


%% Solver
CtrlVar.InfoLevelNonLinIt=1;


%% Restart 
CtrlVar.Restart=0;  CtrlVar.WriteRestartFile=1;


%% Mesh generation and remeshing parameters

CtrlVar.ReadInitialMesh=0;    % if true then read FE mesh (coordinates, connectivity) directly from a .mat file
% unless the adaptive meshing option is used, no further meshing is done.
CtrlVar.ReadInitialMeshFileName='NewMeshFile.mat';

CtrlVar.TriNodes=3 ;

CtrlVar.MeshSize=2.5e3;
CtrlVar.MeshSizeMin=0.05*CtrlVar.MeshSize;
CtrlVar.MeshSizeMax=CtrlVar.MeshSize;
CtrlVar.MaxNumberOfElements=25000;

%% for adaptive meshing
CtrlVar.AdaptMesh=1; CtrlVar.ReadInitialMesh=0;  
% CtrlVar.AdaptMesh=0; CtrlVar.ReadInitialMesh=1;  
                            
CtrlVar.ReadInitialMeshFileName="InitialMeshFile.mat";
CtrlVar.SaveAdaptMeshFileName="AdaptMeshFile.mat"; 

CtrlVar.AdaptMeshAndThenStop=0;  
CtrlVar.GmshMeshingAlgorithm=8;     % see gmsh manual

CtrlVar.AdaptMeshInitial=1  ; 
CtrlVar.AdaptMeshRunStepInterval=1 ; % Number of run-steps between mesh adaptation
CtrlVar.AdaptMeshMaxIterations=4;  % Number of adapt mesh iterations within each run-step.
CtrlVar.AdaptMeshUntilChangeInNumberOfElementsLessThan=0;

CtrlVar.InfoLevelAdaptiveMeshing=10;
CtrlVar.MeshRefinementMethod='explicit:local:newest vertex bisection';

% I=1;
% CtrlVar.ExplicitMeshRefinementCriteria(I).Name='effective strain rates';
% CtrlVar.ExplicitMeshRefinementCriteria(I).Scale=0.01;
% CtrlVar.ExplicitMeshRefinementCriteria(I).EleMin=[];
% CtrlVar.ExplicitMeshRefinementCriteria(I).EleMax=[];
% CtrlVar.ExplicitMeshRefinementCriteria(I).p=[];
% CtrlVar.ExplicitMeshRefinementCriteria(I).InfoLevel=1;
% CtrlVar.ExplicitMeshRefinementCriteria(I).Use=false;
% 
% 
% I=I+1;
% CtrlVar.ExplicitMeshRefinementCriteria(I).Name='effective strain rates gradient';
% CtrlVar.ExplicitMeshRefinementCriteria(I).Scale=0.001/1000;
% CtrlVar.ExplicitMeshRefinementCriteria(I).EleMin=[];
% CtrlVar.ExplicitMeshRefinementCriteria(I).EleMax=[];
% CtrlVar.ExplicitMeshRefinementCriteria(I).p=[];'Ua2D_Restartfile.mat'
% CtrlVar.ExplicitMeshRefinementCriteria(I).InfoLevel=1;
% CtrlVar.ExplicitMeshRefinementCriteria(I).Use=true;


CtrlVar.MeshAdapt.GLrange=[10000 1250 ; 2000 500];                                                    

%% plotting

CtrlVar.PlotLabels=0 ; CtrlVar.PlotMesh=1; CtrlVar.PlotBCs=1;
CtrlVar.PlotXYscale=1000;     % used to scale x and y axis of some of the figures, only used for plotting purposes

%%

CtrlVar.NameOfRestartFiletoWrite=sprintf("Ua2D_Restartfile-%s.mat",...
    CtrlVar.Experiment);
CtrlVar.NameOfRestartFiletoRead=CtrlVar.NameOfRestartFiletoWrite;


end