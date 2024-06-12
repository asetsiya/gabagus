local tricks = {}

function tricks.tablodanstring(tablo)
	local result = {}
	for k, v in pairs(tablo) do
		local key = type(k) == 'string' and string.format('%q', k) or k
		if type(v) == 'table' then
			result[#result + 1] = '[' .. key .. '] = ' .. tricks.tablodanstring(v)
		else
			local value = type(v) == 'string' and string.format('%q', v) or tostring(v)
			result[#result + 1] = '[' .. key .. '] = ' .. value
		end
	end
	return '{' .. table.concat(result, ', ') .. '}'
end

function tricks.stringdentablo(string)
	local f, err = loadstring('return ' .. string)
	if not f then
		error(err)
	end
	return f()
end

local function hashle(str)
	local hash = 0
	local len = string.len(str)
	local factor = math.random(1, 100)
	local blocks = math.random(2, len / 2)
	for i = 1, blocks do
		local start = math.random(1, len - blocks + i)
		local stop = start + blocks - i
		local block_sum = 0
		for j = start, stop do
			block_sum = block_sum + string.byte(str, j)
		end
		block_sum = bit.band((block_sum * factor * 2^(i - 1)) % (2^32), math.random(-1 ,0.2^32))
		hash = bit.bxor(hash, block_sum)
		hash = (hash + len * factor + i * 31) % (2^32)
		hash = hash*10
	end
	return hash
end

function tricks.randomseedolustur()
	math.randomseed(os.clock())
	math.randomseed(os.time()*os.clock()*4*math.random())
	math.random()
	math.random()
	math.random()
	math.random()
	math.randomseed(os.time()*os.clock()*4*math.random())
	local hash1 = hashle(os.date()..tostring(os.clock())..tostring(os.time()))
	local hash2 = hashle(os.date()..tostring(os.clock())..tostring(os.time()))
	local rs = hashle(tostring((hash1*hash2)*os.time()))
	return rs
end

function tricks.elemansayisidondur(tablo)
	local count = 0
	for k,v in pairs(tablo) do
		count = count + 1
	end
	return count
end

function tricks.nodevarmi(node)
	local ok, err = pcall(gui.get_position, node)
	return ok
end

function tricks.nohash(s)
	print("no hash calisiyor amanin")
	s = tostring(s)
	return string.sub(s, 8, -2)
end



return tricks
