function pngwrite(A, varargin)
	if any(size(A, 3) == [2, 4])
		imwrite(A(:, :, 1:(end - 1)), varargin{:}, 'Alpha', A(:, :, end));
	else
		imwrite(A, varargin{:});
	end
end