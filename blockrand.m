function R = blockrand(M, n)
	[rows, cols] = size(M);
	R = zeros([rows * n, cols + 1]);
	for i = 1:n
		idx = (i - 1) * rows + (1:rows);
		R(idx, 1) = i;
		R(idx, 2:end) = M(randperm(rows), :);
	end
end