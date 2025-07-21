function [A, P] = imgfft(I)
	fftmat = fftshift(fft2(I));
	A = abs(fftmat);
	P = angle(fftmat);
end