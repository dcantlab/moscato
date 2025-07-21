function [x, y] = pol2xy(theta, rho)
	if ~exist('rho', 'var') || isempty(rho)
		rho = ones(size(theta));
	end

	x = cosd(theta - 90) .* rho;
	y = sind(theta - 90) .* rho;
end