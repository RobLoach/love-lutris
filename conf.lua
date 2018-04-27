local lib = nil
if (love ~= nil) then
  lib = love
elseif (lutro ~= nil) then
  lib = lutro
end

-- Configuration
function lib.conf(t)
	-- Application metadata
	t.title = 'Lutris'
	t.author = 'Rob Loach'
	t.version = '11.0'
	t.identity = 'lutro-lutris'
	t.description = "Lutris game launcher for RetroArch/Love2D"
	t.width = 1440
	t.height = 900
	if t.window then
		t.window.width = t.width
		t.window.height = t.height
	end
end
