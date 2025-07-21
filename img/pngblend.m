function I = pngblend(I, B)
	[h, w, l] = size(I);
	if (l == 2) || (l == 4)
		c = class(I);
		I = double(I);
		if exist('B', 'var') ~= 1 || isempty(B)
			switch c
				case 'double'
					B = repmat(.5, [h, w]);
				case 'uint8'
					B = repmat(128, [h, w]);
				case 'uint16'
					B = repmat(32768, [h, w]);
				otherwise
					error('First argument must be double, uint8, or uint16');
			end
		elseif isscalar(B)
			B = repmat(double(B), [h, w]);
		elseif numel(B) == 3
			B = repmat(reshape(double(B), [1 1 3]), [h, w]);
		end

		switch c
			case 'double'
				A = I(:, :, end);
			case 'uint8'
				A = I(:, :, end) / 255;
			case 'uint16'
				A = I(:, :, end) / 65535;
			otherwise
				error('First argument must be double, uint8, or uint16');
		end
		I = I(:, :, 1:(end - 1));

		if (l == 4) || (size(B, 3) == 3)
			if l == 2
				I = repmat(I, [1 1 3]);
			end
			if size(B, 3) == 1
				B = repmat(B, [1 1 3]);
			end
			A = repmat(A, [1 1 3]);
		end
		I = cast((I .* A) + (B .* (1 - A)), c);
	end
end