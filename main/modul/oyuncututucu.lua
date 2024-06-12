
oyuncututucu = {}

local serveroyunculari = {}
local katilimciarkadaslari = {}

function oyuncututucu.serverEkle(tablo)
	table.insert(serveroyunculari, tablo)
end

function oyuncututucu.katilimciEkle(tablo)
	table.insert(katilimciarkadaslari, tablo)
end

function oyuncututucu.serverDondur(i)
	if i then
		return serveroyunculari[i]
	end
	return serveroyunculari
end

function oyuncututucu.katilimciDondur(i)
	if i then
		return katilimciarkadaslari[i]
	end
	return katilimciarkadaslari
end

function oyuncututucu.resetle()
	serveroyunculari = {}
	katilimciarkadaslari = {}
end

return oyuncututucu