function I = imgshift(I0, x, y)
	if exist('x', 'var') ~= 1 || isempty(x)
		x = 0;
	end
	if exist('y', 'var') ~= 1 || isempty(y)
		y = 0;
	end

	[rows, cols] = size(I0);
	[xF, yF] = meshgrid( ...
		((1:cols) - round(cols * .5 + .5)), ...
		((1:rows) - round(rows * .5 + .5))  ...
		);
	fftmat = fftshift(fft2(I0)) .* ...
		exp(-1i * 2 * pi .* (xF * x / cols + yF * y / rows));
	I = real(ifft2(ifftshift(fftmat)));
end