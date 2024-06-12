
Kayitci = {}

local kayityeri = sys.get_save_file("kusculuk", "kuskaydi")
local karakterkaydiyeri = sys.get_save_file("kusculuk", "karakterkaydi")
local temakaydiyeri = sys.get_save_file("kusculuk", "temakaydi")

function Kayitci.dayakyendimi(cevap)
	local a = sys.load(kayityeri)
	if cevap == "evet" then 
		a.dayak = true
		sys.save(kayityeri, a)
	else
		return a.dayak
	end
end

function Kayitci.eski(tur,deger)
	local a = sys.load(kayityeri)
	if tur == "gabag" then
		if deger == nil then
			a.gabag = a.gabag + 1
		else
			a.gabag = deger
		end
	elseif tur == "score" then
		a.best = deger
	elseif tur == "gcoin" then
		a.gcoin = deger
	end
	sys.save(kayityeri, a)
end

function Kayitci.kaydidondur(tur)

	local a = sys.load(kayityeri)

	if tur == "gcoin" then
		return a.gcoin
	elseif tur == "gabag" then
		return a.gabag
	elseif tur == "best" then
		return a.best
	end
	
end

function Kayitci.karakterkaydet(tablo)
	sys.save(karakterkaydiyeri, tablo)
end

function Kayitci.temakaydet(tablo)
	sys.save(temakaydiyeri, tablo)
end

function Kayitci.karakteryukle()
	return sys.load(karakterkaydiyeri)
end

function Kayitci.temayukle()
	return sys.load(temakaydiyeri)
end

function Kayitci.ktb(tur)
	if tur == "k" then
		return sys.load(kayityeri).k
	elseif tur == "t" then
		return sys.load(kayityeri).t
	elseif tur == "b" then
		return sys.load(kayityeri).b
	end
end

function Kayitci.ktb_yaz(tur,deger)
	local a = sys.load(kayityeri)
	if tur == "k" then
		a.k = deger
	elseif tur == "t" then
		a.t = deger
	elseif tur == "b" then
		a.b = deger
	end
	sys.save(kayityeri, a)
end

return Kayitci















