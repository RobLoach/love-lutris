-- Configures the package path to allow loading vendor paths.
local lib = nil
if (love ~= nil) then
  lib = love
elseif (lutro ~= nil) then
  lib = lutro
end

-- Find the current source directory to append the vendor paths.
local paths = lib.filesystem.getRequirePath()

-- LunaJSON
paths = paths .. ';vendor/lunajson/src/?.lua'

-- If the dirname is available, append it to the paths too.
local dirname = debug.getinfo(1).source:match("@?(.*/)")
if dirname then
	paths = paths .. ';' .. dirname .. '/vendor/lunajson/src/?.lua'
end

-- Finally, add the require paths.
lib.filesystem.setRequirePath(paths)
