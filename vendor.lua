-- Configures the package path to allow loading vendor paths.

-- Find the current source directory.
local dirname = debug.getinfo(1).source:match("@?(.*/)")

-- If the directory is available, add it using package.path.
if dirname then
	package.path = package.path .. ';' .. dirname .. '/vendor/lunajson/src/?.lua'
else
	-- If the current source directory isn't available, use the Love API.
	local paths = love.filesystem.getRequirePath()
	paths = paths .. ';vendor/lunajson/src/?.lua'
	love.filesystem.setRequirePath(paths)
end
