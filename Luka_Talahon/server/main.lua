
RegisterServerEvent('luka_SV:EinSpieler')
AddEventHandler('luka_SV:EinSpieler', function(clientNetId, soundFile, soundVolume)
    TriggerClientEvent('luka_CL:EinSpieler', clientNetId, soundFile, soundVolume)
end)

RegisterServerEvent('luka_SV:PlayOnSource')
AddEventHandler('luka_SV:PlayOnSource', function(soundFile, soundVolume)
    TriggerClientEvent('luka_CL:EinSpieler', source, soundFile, soundVolume)
end)


RegisterServerEvent('luka_SV:AlleSpieler')
AddEventHandler('luka_SV:AlleSpieler', function(soundFile, soundVolume)
    TriggerClientEvent('luka_CL:AlleSpieler', -1, soundFile, soundVolume)
end)

RegisterServerEvent('luka_SV:mitDistanz')
AddEventHandler('luka_SV:mitDistanz', function(maxDistance, soundFile, soundVolume)
    TriggerClientEvent('luka_CL:mitDistanz', -1, source, maxDistance, soundFile, soundVolume)
end)
