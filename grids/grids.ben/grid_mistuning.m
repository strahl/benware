function grid = grid_mistuning()
% grid_mistunings() -- defines Astrid's mistuning stimuli
%   Usage: 
%      grid  = grid_mistunings()
%   Outputs:
%      grid    return a benware(TM) grid with Astrid's mistuning stimuli permuted over the desired iterations
%
% Author: stef@nstrahl.de
% Version: $Id: grid_mistuning.m 125 2013-11-03 13:37:28Z stefan $

[status,hostname] = system('hostname');          % get name of host benware is currently running on

% switch strtrim(hostname)
%     case {'ATWSN647','schleppi'}
%         compensationFilterFile = '../calibration/compensationFilters.100k.mat';
%     case 'ben'
%         compensationFilterFile = '/Users/ben/scratch/expt.42/calib.expt42/compensationFilters100k.mat';
%     otherwise
%         compensationFilterFile = ...
%               'e:\auditory-objects\calibration\calib.ben.18.11.2013\compensationFilters.100k.mat'; % 100kHz
% end

% controlling the sound presentation
grid.sampleRate                 = 24414.0625*4;  % ~100kHz, a sampling frequency the TDT System 3 Sigma Delta D/A converter can do
% NB stimulus generation program must match this sample rate value
grid.stimGenerationFunctionName = 'getStimFromStructAstrid';

global CALIBRATE;
if CALIBRATE
  fprintf('For calibration only!');
  pause;
  settingsFile = 'E:\auditory-objects\benware\benware\astrid\SettingsCalibMistuned2013_11_18.m';
else
  settingsFile = 'E:\auditory-objects\benware\benware\astrid\SettingsMistuned2013_11_18.m';    
end

fprintf('Generating stimuli...\n');
grid.stimuli = CreateAstridStimuli(settingsFile); %, compensationFilterFile);
grid.stimGridTitles = {'Stim set'};

if CALIBRATE
    grid.stimGrid = createPermutationGrid(1); % calibration will be done at 80dB SPL
else
    grid.stimGrid = createPermutationGrid(1:length(grid.stimuli)); % correct level will be handled within CreateAstridStimuli()
end

% set this using absolute calibration
%grid.stimLevelOffsetDB = [0 0]-25; % can the two identical values be replaced by
%grid.stimLevelOffsetDB = -16-7+5;      % just one scalar value?

% sweep parameters
grid.postStimSilence = 0;         % no need of silence between stimulus sets, WAV files have trailing inter stimulus interval
grid.repeatsPerCondition = 1;     % we need permutation between stimuli so it is done within the WAV files
