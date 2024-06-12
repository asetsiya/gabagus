
local Kayitci = require("main.modul.kayitci")

KarakterIsim = {}

local Karakterlist = {
	
	{id = 1,
	name = "MOON",
	price = 0},

	{id = 2,
	name = "CHICKEN",
	price = 100},

	{id = 3,
	name = "BEAR",
	price = 100},

	{id = 4,
	name = "DOG",
	price = 150},

	{id = 5,
	name = "SMURF",
	price = 200},

	{id = 6,
	name = "SUN",
	price = 140},

	{id = 7,
	name = "MERCURY",
	price = 250},

	{id = 8,
	name = "VENUS",
	price = 120},

	{id = 9,
	name = "EARTH",
	price = 900},

	{id = 10,
	name = "MARS",
	price = 100},

	{id = 11,
	name = "JUPITER",
	price = 500},

	{id = 12,
	name = "SATURN",
	price = 150},

	{id = 13,
	name = "URANUS",
	price = 250},

	{id = 14,
	name = "NEPTUN",
	price = 350}
}

function KarakterIsim.kontrol()
	local kaydedilen_karakterler = Kayitci.karakteryukle()
	local yeni_karakterlist = {}
	for i, karakter in ipairs(Karakterlist) do
		yeni_karakterlist[i] = {}
		for k, v in pairs(karakter) do
			yeni_karakterlist[i][k] = v
		end
	end
	for i, karakter in ipairs(kaydedilen_karakterler) do
		if karakter.price == 0 then
			yeni_karakterlist[i].price = 0
		end
		if karakter.name ~= Karakterlist[i].name then
			yeni_karakterlist[i].name = Karakterlist[i].name
		end
	end
	Kayitci.karakterkaydet(yeni_karakterlist)
end


function KarakterIsim.sayi()
	return #Kayitci.karakteryukle()
end

function KarakterIsim.getir(data)
	return Kayitci.karakteryukle()[tonumber(string.sub(data, 10))].name
	--return "isimsiz"
end

function KarakterIsim.fiyat(data)
	return Kayitci.karakteryukle()[tonumber(string.sub(data, 10))].price
	--return 0
end

function KarakterIsim.satinal(data)
	local a = Kayitci.karakteryukle()
	a[tonumber(string.sub(data, 10))].price = 0
	Kayitci.karakterkaydet(a)
end


return KarakterIsim











