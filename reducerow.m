function D = reducerow(M, IV1, IV2, DV, fun, showHeader)
	if exist('fun', 'var') ~=1 || isempty(fun)
		fun = @(x) sum(x(:));
	end
	if ~exist('showHeader', 'var') ~=1 || isempty(showHeader)
		showHeader = true;
	end

	n = size(M, 1);
	IVr_vals = unique(M(:, IV1), 'rows');
	[IVr_rows, IVr_cols] = size(IVr_vals);
	IVc_vals = unique(M(:, IV2), 'rows');
	[IVc_rows, IVc_cols] = size(IVc_vals);

	if ~showHeader
		IVc_cols = 0;
		IVr_cols = 0;
	end
	D = zeros(IVc_cols + IVr_rows, IVr_cols + IVc_rows);
	if showHeader
		D(IVc_cols + (1:IVr_rows), 1:IVr_cols) = IVr_vals;
		D(1:IVc_cols, IVr_cols + (1:IVc_rows)) = IVc_vals';
	end

	for r = 1:IVr_rows
		for c = 1:IVc_rows
			IVr_idx = all(M(:, IV1) == repmat(IVr_vals(r, :), n, 1), 2);
			IVc_idx = all(M(:, IV2) == repmat(IVc_vals(c, :), n, 1), 2);
			DV_data = M(IVr_idx & IVc_idx, DV);
			D(IVc_cols + r, IVr_cols + c) = fun(DV_data);
		end
	end
end