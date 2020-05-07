ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('KrX-Ammunation:buyweapon')
AddEventHandler('KrX-Ammunation:buyweapon', function(price, weapon, label, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.hasWeapon(weapon) then
			TriggerClientEvent('esx:showNotification', source,'Vous possédez déjà ~b~cette arme !')
	else
		if xPlayer.getMoney() >= price then
			xPlayer.removeMoney(price)
	    	xPlayer.addWeapon(weapon, 42) 
			TriggerClientEvent('esx:showNotification', source, 'Vous avez acheté 1 ' .. label .. " pour ~g~" .. price .. "$ !")
	    end
	end
end)

