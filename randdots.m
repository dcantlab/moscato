function [xy, nn, mask] = randdots(mask, diameters)
	[mh, mw] = size(mask);
	[mx, my] = meshgrid(1:mw, 1:mh);

	seedmap = rand(mh, mw);
	xy = zeros(2, length(diameters));
	nn = 0;
	for i = 1:length(diameters)
		dd = diameters(i);

		bumpmap = ones(mh + 2, mw + 2);
		bumpmap(2:(end - 1), 2:(end - 1)) = 1 - mask;
		bumpmap = filter2(apply_shape(mapt_rho(dd), dd / 2), bumpmap, 'same');
		voidmap = seedmap .* (1 - min(1, bumpmap(2:(end - 1), 2:(end - 1))));
		if max(voidmap(:)) == 0
			warning('no space left: %d out of %d dots placed', nn, length(diameters));
			break;
		end

		nn = nn + 1;
		[~, xx] = max(max(voidmap, [], 1));
		[~, yy] = max(max(voidmap, [], 2));
		mask = mask .* (1 - apply_shape(hypot(mx - xx, my - yy), dd / 2));

		xy(:, i) = [xx - (mw / 2); yy - (mh / 2)];
	end
	xy = round(xy(:, 1:nn));
end