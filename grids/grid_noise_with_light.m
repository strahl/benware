function grid = grid_monosearchnoise()

  % controlling the sound presentation
  grid.stimGenerationFunctionName = 'makeCSDprobeWithLight';
  grid.sampleRate = 24414.0625*8;  % ~100kHz

  % essentials
  grid.name = 'noise_with_light';
  
  % stimulus grid structure
 grid.stimGridTitles = {'Stimulus Length (ms)', 'Noise Delay (ms)', ...
      'Noise Length (ms)', 'Light voltage (V)', 'Light delay (ms)', 'Light Duration (ms)', 'Level'};
 %grid.stimGrid = [1000 300 50 5 0.01 700 80; 1000 300 50 0 0.01 700 80;];
 % grid.stimGrid = [2000 500 50 0 0.01 700 80];

  % for jonathan
  fprintf('**jonathans mouse!!**');
  grid.stimGrid = [1000 25 5 0 25 5 80; ...
                  1000 25 5 5 25 5 -80; ...
                  1000 25 5 5 25 5 80; ...
                 ];
  
  % sweep parameters
  grid.postStimSilence = 0;
  grid.repeatsPerCondition = 200;
  %grid.saveWaveforms = false;
  
  % set this using absolute calibration
  grid.stimLevelOffsetDB = -92;
  
