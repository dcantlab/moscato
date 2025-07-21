function DrawCenteredText(w, text, color, offset, lineHeight, alignLeft)
	if ~iscell(text)
		text = splitlines(text);
	end
	if exist('color', 'var') ~= 1 || isempty(color)
		color = [0 0 0];
	end
	if exist('offset', 'var') ~= 1 || isempty(offset)
		offset = [0 0];
	end
	if exist('lineHeight', 'var') ~= 1 || isempty(lineHeight)
		lineHeight = 1.5;
	end
	if exist('alignLeft', 'var') ~= 1 || isempty(alignLeft)
		alignLeft = false;
	end


	wRect = Screen('Rect', w);
	[wcx, wcy] = RectCenter(wRect);
	lines = numel(text);
	tRect = zeros(lines, 4);
	for i = 1:lines
		tRect(i, :) = round(Screen('TextBounds', w, double(text{i})));
	end
	tRect(1:(end - 1), 4) = tRect(1:(end - 1), 4) .* lineHeight;

	tx = round(wcx - (tRect(:, 3) / 2) + offset(1));
	ty = round(wcy - (sum(tRect(:, 4)) / 2) + offset(2) ...
		+ cumsum([0; tRect(1:(end - 1), 4)]));
	if alignLeft
		tx(:) = min(tx);
	end
	for i = 1:lines
		Screen('DrawText', w, double(text{i}), tx(i), ty(i), color);
	end
end