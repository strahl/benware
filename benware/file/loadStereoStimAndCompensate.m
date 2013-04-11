function [stim, stimInfo] = loadStereoStimAndCompensate(sweepNum, grid, expt)
% [stim, stimInfo] = loadWavAndCompensate(sweepNum, grid, expt)
%
% Load a stereo f32 or wav file and compensate using however many compensation
% filters are available. The correct stimulus files are found by
% finding experiment parameters in the grid and expt structures, and 
% using constructStimPath to replace % tokens with appropriate values
% (sweepNum, etc)
%
% This is the standard benware function for doing this job. Others may and do
% exist for special reasons, but this is usually the one to use.
% 
% sweepNum, grid, expt: standard benWare variables
%
% This is now powered by loadStimFileAndCompensate

% generate stimInfo structure
stimInfo.sweepNum = sweepNum;
stimInfo.stimGridTitles = grid.stimGridTitles;
stimInfo.stimParameters = grid.randomisedGrid(sweepNum, :);
stimInfo.stimFile = constructStimPath(grid, expt, sweepNum);

fprintf(['  * Getting stimulus ' num2str(sweepNum) ' from ' escapepath(stimInfo.stimFile) '...']);

stim = loadStereoStimFileAndCompensate(stimInfo.stimFile, grid.compensationFilters, grid.stimLevelOffsetDB+stimInfo.stimParameters(end));