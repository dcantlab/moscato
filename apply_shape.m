function N = apply_shape(M, r, pitch)  % use pitch = 2 for circle
	if exist('pitch', 'var') ~= 1 || isempty(pitch)
		pitch = 1;
	end

	N = apply_sigmoid(M, -12.465 ./ pitch, r);
end