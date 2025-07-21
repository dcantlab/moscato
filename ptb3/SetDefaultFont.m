function SetDefaultFont(fontNames, fontSize)
	if exist('fontNames', 'var') ~= 1 || isempty(fontNames)
		fontNames = {'Helvetica', 'Arial'};
	elseif ~iscell(fontNames)
		fontNames = {fontNames};
	end
	if exist('fontSize', 'var') ~= 1 || isempty(fontSize)
		fontSize = 24;
	end

	Screen('Preference', 'TextRenderer',     1);
	Screen('Preference', 'TextAntiAliasing', 1);
	availFonts = listfonts();
	for i = 1:length(fontNames)
		if any(strcmp(availFonts, fontNames{i}))
			Screen('Preference', 'DefaultFontName', fontNames{i});
			break;
		end
	end
	Screen('Preference', 'DefaultFontSize', fontSize);
end