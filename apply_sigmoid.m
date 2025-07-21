function N = apply_sigmoid(M, k, x0)
	if exist('x0', 'var') ~= 1 || isempty(x0)
		x0 = 0;
	end

	N = 1 ./ (1 + exp(-k .* (M - x0)));
end