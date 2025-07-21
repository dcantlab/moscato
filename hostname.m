function name = hostname()
	[r, name] = system('hostname');
	if r ~= 0
		warning('cannot determine hostname, falling back to [default]');
		name = 'default';
	else
		name = strtrim(name);
		if ~isempty(regexp(name, '\.local$', 'once'))  % for macOS
			warning('removing ''.local'' at the end of hostname');
			name = regexprep(name, '\.local$', '');
		end
	end
end