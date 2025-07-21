function keys = KbNames(varargin)
	keys = zeros(1, nargin);
	for i = 1:nargin
		keys(i) = KbName(varargin{i});
	end
end