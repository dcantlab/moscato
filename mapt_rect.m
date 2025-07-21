function M = mapt_rect(rows, cols, theta, ratio)
	if exist('cols', 'var') ~= 1 || isempty(cols)
		cols = rows;
	end
	if exist('theta', 'var') ~= 1 || isempty(theta)
		theta = 0;
	end
	if exist('ratio', 'var') ~= 1 || isempty(ratio)
		ratio = 1;
	end

	[X, Y] = mapt_linear(rows, cols, theta);
	M = max(abs(X) * sqrt(ratio), abs(Y) / sqrt(ratio));
end