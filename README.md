中文

如果您是QBCore 请转到以下路径替换代码
Song_AdminGongGao/server/sv_main.lua

把整段替换以下代码重启插件即可
QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand('gonggao', function(source, args, rawCommand)
    local Player = QBCore.Functions.GetPlayer(source)
    if QBCore.Functions.HasPermission(source, 'admin') then
        TriggerClientEvent('Song_AdminGongGao:OpenInputMenu', source)
    else
        TriggerClientEvent('QBCore:Notify', source, '你没有权限使用此命令。', 'error')
    end
end, false)

RegisterServerEvent('Song_AdminGongGao:SendAnnouncement')
AddEventHandler('Song_AdminGongGao:SendAnnouncement', function(message, duration)
    TriggerClientEvent('Song_AdminGongGao:ShowAnnouncement', -1, message, duration)
end)

如果您使用的语言是中文且用的是QBCore只需做到以上操作即可享受插件 ESX不需要做任何修改

English

If your language is Chinese and you are using QBCore, you can enjoy the plugin by doing the above If you are using ESX, you do not need to make any changes

If you're using QBCore, go to the path below to replace the code
Song_AdminGongGao/server/sv_main.lua

Replace the entire segment with the following code and restart the plugin

QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand('gonggao', function(source, args, rawCommand)
    local Player = QBCore.Functions.GetPlayer(source)
    if QBCore.Functions.HasPermission(source, 'admin') then
        TriggerClientEvent('Song_AdminGongGao:OpenInputMenu', source)
    else
        TriggerClientEvent('QBCore:Notify', source, 'You do not have permission to use this command', 'error')
    end
end, false)

If you're using ESX, go to the following path to replace the code
Song_AdminGongGao/client/cl_main.lua

Replace the entire segment with the following code and restart the plugin

RegisterNetEvent('Song_AdminGongGao:OpenInputMenu')
AddEventHandler('Song_AdminGongGao:OpenInputMenu', function()
local input = lib.inputDialog('Publish Announcement', {
    { type = 'input', label = 'Announcement Content', placeholder = 'Please enter the announcement content', required = true },
    { type = 'number', label = 'Duration (seconds)', placeholder = 'Default 5 seconds', default = 5 }
})

    if input then
        local message = input[1]
        local duration = input[2] * 1000
        TriggerServerEvent('Song_AdminGongGao:SendAnnouncement', message, duration)
    end
end)

Song_AdminGongGao/server/sv_main.lua

RegisterCommand('gonggao', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == 'admin' then
        TriggerClientEvent('Song_AdminGongGao:OpenInputMenu', source)
    else
        TriggerClientEvent('esx:showNotification', source, 'You do not have permission to use this command')
    end
end, false)
