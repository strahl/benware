function grid = grid_drc200k_plus_light()

  % controlling the sound presentation
  grid.stimGenerationFunctionName = 'loadStimCompensateAddLight';
  grid.stimDir = 'e:\auditory-objects\sounds-uncalib\mouse.drc.5\';
  %grid.stimDir = '/Users/ben/scratch/texture/texture.v2/renamed/';
  grid.sampleRate = 24414.0625*8;  % ~200kHz

  % essentials
  grid.name = 'drc200k_plus_light';
  % drc1_contrast10.f32
  grid.stimFilename = 'drc%1_contrast%2.f32';
  
  % stimulus grid structure
  grid.stimGridTitles = {'DRC ID', 'Contrast', 'Light voltage', 'Level'};  
  %grid.stimGrid = createPermutationGrid(1:5, 1:7, [0 5], 80); 
  grid.stimGrid = createPermutationGrid(1:4, [10 30], [0 5], 80); 

  % for calibration
  %grid.stimGrid = createPermutationGrid(9, 9, 80);
  
  % compensation filter
  grid.initFunction = 'loadCompensationFilters';
  grid.compensationFilterFile = ...
    'e:\auditory-objects\calibration\james-01\calibL_200k.mat';

  grid.compensationFilterVarNames = {'calibL_200k.filter'};

  % sweep parameters
  grid.postStimSilence = 0;
  grid.repeatsPerCondition = 5;
  
  % set this using absolute calibration
  grid.stimLevelOffsetDB = [3 3];
  