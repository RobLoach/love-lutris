-- Dependencies
require('vendor')
require('conf')

-- Load
function lutro.load()
	-- Load the available games
	local success, result = pcall(getInstalledGames)
	if success then
		games = result
	else
		games = {}
	end

	-- Allow the user to launch Lutro.
	table.insert(games, 1, {
		slug = '',
		name = 'Launch Lutris',
	})

	-- Initialization
	font = lutro.graphics.newImageFont('resources/font.png', ' abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?-+/')
	lutro.graphics.setFont(font)
	lutro.graphics.setBackgroundColor(1, 53, 146)

	lineHeight = 20
	currentSelection = 1
	keyHoldTimer = 0
	keyHoldResetTime = 1000
	keySpeed = 5000

	logo = lutro.graphics.newImage('resources/logo.png')
end

-- Draw
function lutro.draw()
	lutro.graphics.clear()
	lutro.graphics.draw(logo, lineHeight, lineHeight)

	-- Show each game.
	local y = lineHeight * 2
	for i, game in ipairs(games) do
		-- Display the menu cursor if needed
		if currentSelection == i then
			lutro.graphics.rectangle('fill', 256 + lineHeight * 2, y + lineHeight / 4, lineHeight / 3, lineHeight / 3)
		end
		-- Display the menu item
		lutro.graphics.print(game.name, 256 + lineHeight * 3, y)
		y = y + lineHeight
	end
end

-- Update
function lutro.update(dt)
	-- Up
	if lutro.input.joypad("up") == 1 and keyHoldTimer <= 0 then
		currentSelection = currentSelection - 1
		keyHoldTimer = keyHoldResetTime
		if currentSelection < 1 then
			currentSelection = 1
		end
	-- Down
	elseif lutro.input.joypad("down") == 1 and keyHoldTimer <= 0 then
		currentSelection = currentSelection + 1
		keyHoldTimer = keyHoldResetTime
		if currentSelection > table.getn(games) then
			currentSelection = table.getn(games)
		end
	-- Select
	elseif (lutro.input.joypad("start") == 1 or lutro.input.joypad("b") == 1 or lutro.input.joypad("y") == 1 or lutro.input.joypad("a") == 1 or lutro.input.joypad("x") == 1) and keyHoldTimer <= 0 then
		keyHoldTimer = keyHoldResetTime * 2
		game = games[currentSelection]
		--os.execute('lutris lutris:' .. game.slug)
		local f = io.popen('lutris lutris:' .. game.slug)
		f:close()
	-- Nothing
	else
		keyHoldTimer = keyHoldTimer - dt * keySpeed
	end
end

-- Retrieve the installed Lutro games
function getInstalledGames()
	-- Dependencies
	local json = require('lunajson')

	-- Load installed Lutris games
	local output = capture('lutris --json --list-games --installed')
	return json.decode(output)
end

-- Capture the standard output from running an executable.
function capture(cmd, raw)
	local f = assert(io.popen(cmd, 'r'))
	local s = assert(f:read('*a'))
	f:close()
	if raw then return s end
	s = string.gsub(s, '^%s+', '')
	s = string.gsub(s, '%s+$', '')
	s = string.gsub(s, '[\n\r]+', ' ')
	return s
end
