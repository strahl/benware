function grid = grid_bilateral_noise

  % controlling the sound presentation
  grid.sampleRate = 24414.0625*4;  % ~50kHz
  grid.stimGenerationFunctionName = 'makeBilateralNoise';

  % stimulus grid structure
  grid.stimGridTitles = {'Duration', 'LeftDelay', 'RightDelay', 'BothDelay', 'Level'};
  grid.stimGrid = [45 0 100 200 110];
  

%   fprintf('Calibration only!\n');
%   grid.stimGrid = [500 0 1000 2000 80];  

  % sweep parameters
  grid.postStimSilence = 0.2; %seconds
  
  % search mode
  grid.repeatsPerCondition = Inf;
  grid.saveWaveforms = false;
  
  % set this using absolute calibration
  grid.stimLevelOffsetDB = [-116 -116]+80;