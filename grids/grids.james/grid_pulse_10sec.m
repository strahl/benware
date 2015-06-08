function grid = grid_pulse_10sec()

  % controlling the sound presentation
  grid.sampleRate = 24414.0625*4;  % ~100kHz
  grid.stimGenerationFunctionName = 'makeCSDprobeWithLight';
  
  % stimulus grid structure
  grid.stimGridTitles = {'Stimulus Length (ms)', 'Noise Delay (ms)', ...
           'Noise Length (ms)', 'Light voltage (V)', 'Light delay (ms)', 'Light Duration (ms)', 'Level'};
  %grid.stimGrid = [1000 250 50 8 0.01 750 80; 1000 250 50 0 0.01 750 80;];
  grid.stimGrid = createPermutationGrid(10000, 250, 0, 5, 100, 50, 80);

  % for jonathan
  %fprintf('**jonathans mouse!!**');
  %grid.stimGrid = [1000 25 5 0 25 5 80; ...
  %                1000 25 5 5 25 5 -80; ...
   %               1000 25 5 5 25 5 80; ...
   %              ];
  
  % sweep parameters
  grid.postStimSilence = 0;
  grid.repeatsPerCondition = 200;
  
  % set this using absolute calibration
  grid.stimLevelOffsetDB = [-11 0];
  
