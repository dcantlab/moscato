function [resp, rt] = KbResponseWait(keys, timeout, baseSecs, useESC, devNum)
	if exist('keys', 'var') ~= 1 || isempty(keys)
		keys = KbName('space');
	end
	if exist('timeout', 'var') ~= 1 || isempty(timeout)
		timeout = Inf;
	end
	if exist('baseSecs', 'var') ~= 1 || isempty(baseSecs)
		baseSecs = GetSecs();
	end
	if exist('useESC', 'var') ~= 1 || isempty(useESC)
		useESC = true;
	end
	if exist('devNum', 'var') ~= 1 || isempty(devNum)
		devNum = -3;
	end

	if useESC
		escKey = KbName('ESCAPE');
	else
		escKey = [];
	end
	oldKeys = RestrictKeysForKbCheck(unique([keys, escKey]));
	resp = [];
	while isempty(resp) && (GetSecs() < (baseSecs + timeout))
		[~, keySecs, keyCode] = KbCheck(devNum);
		if any(keyCode(escKey) == 1)
			RestrictKeysForKbCheck(oldKeys);
			error('user abort: ESC key pressed');
		elseif any(keyCode(keys) == 1)
			resp = find(keyCode(keys) == 1, 1);
			KbReleaseWait(devNum);
		end
	end
	RestrictKeysForKbCheck(oldKeys);
	rt = keySecs - baseSecs;
end