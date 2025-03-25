ESX = exports.es_extended:getSharedObject()

RegisterCommand('gonggao', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == 'admin' then
        TriggerClientEvent('Song_AdminGongGao:OpenInputMenu', source)
    else
        TriggerClientEvent('esx:showNotification', source, '你没有权限使用此命令。')
    end
end, false)

RegisterServerEvent('Song_AdminGongGao:SendAnnouncement')
AddEventHandler('Song_AdminGongGao:SendAnnouncement', function(message, duration)
    TriggerClientEvent('Song_AdminGongGao:ShowAnnouncement', -1, message, duration)
end)