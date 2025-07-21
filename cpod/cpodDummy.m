function obj = cpodDummy(port, dur)
	if exist('port', 'var') ~= 1 || isempty(port)
		device = 'dummy';
	else
		device = sprintf('%s (dummy)', strtrim(port));
	end
	if exist('dur', 'var') ~= 1 || isempty(dur)
		dur = 5;
	end

	obj = struct;
	obj.device = device;
	obj.getByte = @(val, idx) bitand(bitshift(val, -8 * (idx - 1)), 255);
	obj.setPulseDur = @(obj, dur) fprintf('[cpodDummy.setPulseDur] device=%s, dur=%d\n', obj.device, dur);
	obj.trigger = @(obj, code) fprintf('[cpodDummy.trigger] device=%s, code=%d\n', obj.device, code);

	obj.setPulseDur(obj, dur);
end