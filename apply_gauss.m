function N = apply_gauss(M, sd, x0)
	if exist('x0', 'var') ~= 1 || isempty(x0)
		x0 = 0;
	end

	N = exp(-.5 * ((M - x0) ./ sd) .^ 2);
end