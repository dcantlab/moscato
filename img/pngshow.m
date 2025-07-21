function pngshow(I, varargin)
	bgcolor = [];
	for p = 1:(nargin - 1)
		if strcmp('BgColor', varargin{p}) ...
				|| strcmp('bgColor', varargin{p}) ...
				|| strcmp('bgcolor', varargin{p})
			bgcolor = varargin{p + 1};
			varargin = varargin([1:(p-1), (p + 2):end]);
			break;
		end
	end

	if any(size(I, 3) == [2, 4])
		I = pngblend(I, bgcolor);
	end
	imshow(I, varargin{:});
end