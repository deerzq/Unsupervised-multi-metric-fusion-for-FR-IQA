Unsupervised-multi-metric-fusion-for-FR-IQA
===========================================

Unsupervised muti-metric fusion for Full-Reference (FR) Image Quality Assessment (IQA)

% ========================================================================
% Copyright(c) 2014 Peng Ye, Jayant Kumar and David Doermann
% All Rights Reserved.
% Please refer to the following paper
% Peng Ye, Jayant Kumar and David Doermann, "Beyond Human Opinion Scores: 
% Blind Image Quality Assessment based on Synthetic Scores", CVPR2014.
%----------------------------------------------------------------------

adjustScore.m and RRF.m implements the unsupervised multi-metric fusion method described in the above paper. 

% Examples:
load('PATH_TO_YOUR_FR_MEASURE_FILE','gmsd','vif','fsim','fsimc','wssim');
scores = [vif, fsim, fsimc, wssim, -gmsd]; % the higher the better
rrf = RRF(scores, 60);
s = adjustScore(1-gmsd, -rrf, 4);
