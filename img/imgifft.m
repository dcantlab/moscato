function I = imgifft(A, P)
	fftmat = A .* exp(P * 1i);
	I = real(ifft2(ifftshift(fftmat)));
end