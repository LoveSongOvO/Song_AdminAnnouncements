local isAnnouncementShown = false

RegisterNetEvent('Song_AdminGongGao:OpenInputMenu')
AddEventHandler('Song_AdminGongGao:OpenInputMenu', function()
    local input = lib.inputDialog('发布公告', {
        { type = 'input', label = '公告内容', placeholder = '请输入公告内容', required = true },
        { type = 'number', label = '持续时间（秒）', placeholder = '默认 5 秒', default = 5 }
    })

    if input then
        local message = input[1]
        local duration = input[2] * 1000
        TriggerServerEvent('Song_AdminGongGao:SendAnnouncement', message, duration)
    end
end)

RegisterNetEvent('Song_AdminGongGao:ShowAnnouncement')
AddEventHandler('Song_AdminGongGao:ShowAnnouncement', function(message, duration)
    if not isAnnouncementShown then
        isAnnouncementShown = true
        SendNUIMessage({
            type = 'showAnnouncement',
            message = message,
            duration = duration
        })
        Citizen.Wait(duration or 5000)
        isAnnouncementShown = false
    end
end)