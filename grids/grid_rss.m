function grid = grid_rss

  % essentials
  grid.name = 'rss';

  % controlling the sound presentation
  grid.initFunction = 'loadStimSetAndCalib';
  grid.stimGenerationFunctionName = 'getStimFromSetAndCompensate';
  grid.setFile = 'e:\christian\thesis\chapter 2\experiments\anesthetized\animals\R1911\sets\Calibrated\RSS_sub_Anesthetized4_calib.mat';
  grid.compensationFilterFile = 'e:\auditory-objects\calibration\calib.expt35\compensationFilters.100k.mat';
  grid.compensationFilterVar = 'compensationFilters.L';
  grid.sampleRate = 24414.0625*4;  % ~50kHz
  grid.monoStim = true;

  load(grid.setFile);
  n_stim = length(stim_set.stimuli);
  clear stim_set;
  % stimulus grid structure
  grid.stimGridTitles = {'StimID', 'Level'};
  grid.stimGrid = createPermutationGrid(1:n_stim,[85 75]);
  
  % sweep parameters
  grid.sweepLength = 0.5; % seconds
  grid.repeatsPerCondition = 15;
  
  % set this using absolute calibration
  grid.stimLevelOffsetDB = -45;
