function [s,n] = adjustScore(score, t, lambda0)
% ========================================================================
% Copyright(c) 2014 Peng Ye, Jayant Kumar and David Doermann
% All Rights Reserved.
% Please refer to the following paper
% Peng Ye, Jayant Kumar and David Doermann, "Beyond Human Opinion Scores: 
% Blind Image Quality Assessment based on Synthetic Scores", CVPR2014.
%----------------------------------------------------------------------

% score: the input score
% t: rank of the object
% s: adjust the input score to obey the rank t better
% score: the higher the better. 
% t: the lower the better

% Examples:
% load('PATH_TO_YOUR_FR_MEASURE_FILE','gmsd','vif','fsim','fsimc','wssim');
% scores = [vif, fsim, fsimc, wssim, -gmsd]; % the higher the better
% rrf = RRF(scores, 60);
% s = adjustScore(1-gmsd, -rrf, 4);

L = length(t);
n = zeros(L,1);
[sort_t, idx] = sort(t,'ascend');

id = 1:L;
n(idx) = (id-1)-(L-id);

% for i=1:L,
%	id = find(idx==i);
%	n1 = id-1;
%	n2 = L-id;
%	n(i) = n1-n2;
% end

%for i=1:L,
%    n1 = length(find(t<t(i))); % images better than i
%    n2 = length(find(t>t(i))); % images worse than i
%    n(i) = n1-n2;
%end

if ~exist('lambda0','var'),
    lambda0 = 1;
end

lambda = lambda0*(max(score)-min(score))/length(t);
s = score-lambda*n/2; % the higher the better