function A = pngread(varargin)
	[A, cmap, amap] = imread(varargin{:});
	if ~isempty(cmap)
		rmap = cmap(:, 1);
		gmap = cmap(:, 2);
		bmap = cmap(:, 3);
		A = cat(3, rmap(A + 1), gmap(A + 1), bmap(A + 1));
	end
	if ~isempty(amap)
		A = cat(3, A, amap);
	end
end