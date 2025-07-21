function [theta, rho] = xy2pol(x, y)
	theta = mod(atan2d(y, x) + 90, 360);
	rho = hypot(x, y);
end