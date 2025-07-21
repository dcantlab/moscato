function E = mapt_rho(rows, cols, theta, ratio)
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
	E = hypot(X * sqrt(ratio), Y / sqrt(ratio));
end