function B = reprow(A, n)
	szA = size(A);
	B = zeros([szA(1) * n, szA(2:end)]);
	for i = 1:n
		B(i:n:end, :, :) = A(:, :, :);
	end
end