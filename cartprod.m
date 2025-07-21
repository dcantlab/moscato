function M = cartprod(varargin)
	M = zeros(1, 0);
	for i = nargin:-1:1
		var = varargin{i};
		M = [
			reprow(var, size(M, 1)), ...
			repmat(M, size(var, 1), 1) ...
			];
	end
end