lib = nil
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
	t.version = '0.10.1'
	t.identity = 'lutro-lutris'
	t.description = "Lutris game launcher for RetroArch/Love2D"
	t.width = 1280
	t.height = 720
end
