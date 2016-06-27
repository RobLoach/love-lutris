-- Configures the package path to allow loading vendor paths.
local dirname = debug.getinfo(1).source:match("@?(.*/)")
if dirname then
	package.path = package.path .. ';' .. dirname .. '/vendor/lunajson/src/?.lua'
else
	package.path = package.path .. ';' .. love.filesystem.getSourceBaseDirectory() .. 'vendor/lunajson/src/?.lua'
end

--package.path = debug.getinfo(1, "S").source:match[[^@?(.*[\/])[^\/]-$]] .."?.lua;".. package.path

