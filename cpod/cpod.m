function obj = cpod(port, dur)
	if exist('port', 'var') ~= 1 || isempty(port)
		ports = serialportlist('available');
	else
		ports = string(port);
	end
	if exist('dur', 'var') ~= 1 || isempty(dur)
		dur = 5;
	end

	for p = 1:length(ports)
		device = serialport(ports(p), 115200, 'Timeout', 1);
		device.flush();
		write(device, '_c1', 'char');
		if strcmp(read(device, 5, 'char'), '_xid0')
			break;
		else
			clear device;
		end
	end
	if ~exist('device', 'var')
		error('No XID device found.');
	end

	obj = struct;
	obj.device = device;
	obj.getByte = @(val, idx) bitand(bitshift(val, -8 * (idx - 1)), 255);
	obj.setPulseDur = @(obj, dur) write(obj.device, ...
		sprintf('mp%c%c%c%c', obj.getByte(dur, 1), obj.getByte(dur, 2), ...
		obj.getByte(dur, 3), obj.getByte(dur, 4)), 'char');
	obj.trigger = @(obj, code) write(obj.device, ...
		sprintf('mh%c%c', obj.getByte(code, 1), obj.getByte(code, 2)), 'char');

	obj.setPulseDur(obj, dur);
end