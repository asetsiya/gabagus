local Kayitci = require("main.modul.kayitci")

Temalar = {}

local Temalist = {
	
	{id = 1,
	name = "NIGHT",
	eg = 0,
	price = 0},

	{id = 2,
	name = "DESERT",
	eg = 3,
	price = 100},

	{id = 3,
	name = "PURPLE",
	eg = 1,
	price = 500},

	{id = 4,
	name = "NATURE",
	eg = 0,
	price = 300},
}

-- easteregg 0=yok 1,2,3 olabilir (baska da olabilir mi emin degilim)
-- eg = 0 means no easteregg

function Temalar.kontrol()
	local kaydedilen_temalar = Kayitci.temayukle()
	local yeni_temalist = {}
	for i, tema in ipairs(Temalist) do
		yeni_temalist[i] = {}
		for k, v in pairs(tema) do
			yeni_temalist[i][k] = v
		end
	end
	for i, tema in ipairs(kaydedilen_temalar) do
		if tema.price == 0 then
			yeni_temalist[i].price = 0
		end
		if tema.name ~= Temalist[i].name then
			yeni_temalist[i].name = Temalist[i].name
		end
	end
	Kayitci.temakaydet(yeni_temalist)
end

function Temalar.isimsayisi()
	return #Kayitci.temayukle()
end

function Temalar.isimgetir(data)
	return Kayitci.temayukle()[tonumber(string.sub(data, 6,7))].name
end

function Temalar.eg(data)
	return Kayitci.temayukle()[tonumber(string.sub(data, 6,7))].eg
end

function Temalar.fiyat(data)
	return Kayitci.temayukle()[tonumber(string.sub(data, 6,7))].price
end

function Temalar.satinal(data)
	local a = Kayitci.temayukle()
	a[tonumber(string.sub(data, 6,7))].price = 0
	Kayitci.temakaydet(a)
end


return Temalar











