function N = apply_grating(M, freq, phase)
	if exist('phase', 'var') ~= 1 || isempty(phase)
		phase = 0;
	end

	N = cosd(M .* freq * 360 + phase) * .5 + .5;
end