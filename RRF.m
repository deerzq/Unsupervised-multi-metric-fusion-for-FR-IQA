function rrf = RRF(scores, k)
% compute RRF score given a list of FR measures:
% INPUT:
% scores: NxK matrix of FR measures (N-number of images, K-number of FR measures), bigger score-->higher quality score
% k: constant used in computing RRF score
% OUTPUT:
% rrf: rrf score for each object

[N, K] = size(scores); % N: # object, K: # ranked list

rrf = zeros(N,1);

if ~exist('k','var'),
    k = 60;
end

for i=1:K,
    [~, r] = sort(scores(:,i), 'descend'); % r(k)-th object is ranked in the k-th place, score is the bigger the better
	rrf(r) = rrf(r)+1./(k+(1:N)'); % rrf score: the bigger the better
end








