function T = mapt_theta(rows, cols, theta)
	if exist('cols', 'var') ~= 1 || isempty(cols)
		cols = rows;
	end
	if exist('theta', 'var') ~= 1 || isempty(theta)
		theta = 0;
	end

	[X, Y] = mapt_linear(rows, cols, theta);
	T = xy2pol(X, Y);
end