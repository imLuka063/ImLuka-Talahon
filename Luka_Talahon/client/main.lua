local standardVolumeOutput = 1.0;

RegisterNetEvent('Luka:Sound:EinSpieler')
AddEventHandler('Luka:Sound:EinSpieler', function(soundFile, soundVolume)
    SendNUIMessage({
        transactionType     = 'playSound',
        transactionFile     = soundFile,
        transactionVolume   = soundVolume
    })
end)

RegisterNetEvent('Luka:Sound:AlleSpieler')
AddEventHandler('Luka:Sound:AlleSpieler', function(soundFile, soundVolume)
    SendNUIMessage({
        transactionType     = 'playSound',
        transactionFile     = soundFile,
        transactionVolume   = soundVolume
    })
end)

RegisterNetEvent('Luka:Sound:mitDistanz')
AddEventHandler('Luka:Sound:mitDistanz', function(playerNetId, maxDistance, soundFile, soundVolume)
    local lCoords = GetEntityCoords(GetPlayerPed(-1))
    local eCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerNetId)))
    local distIs  = Vdist(lCoords.x, lCoords.y, lCoords.z, eCoords.x, eCoords.y, eCoords.z)
    if(distIs <= maxDistance) then
        SendNUIMessage({
            transactionType     = 'playSound',
            transactionFile     = soundFile,
            transactionVolume   = soundVolume
        })
    end
end)


RegisterCommand('talahon', function()
    ExecuteCommand("e karate ")
    local playerNetId = PlayerId() -- Die Netzwerk-ID des lokalen Spielers
    local maxDistance = 5.0 -- Der maximale Abstand, innerhalb dessen der Sound abgespielt werden soll (in Metern)
    local soundFile = 'talahon' -- Der Name der OGG-Datei, die abgespielt werden soll
    local soundVolume = 1.0 -- Die Lautstärke des Sounds (optional, Standardwert ist 1.0)

    -- Event auslösen, um den Sound abzuspielen, wenn der Spieler innerhalb der maxDistance vom playOnEntity ist
    TriggerEvent('Luka:Sound:mitDistanz', playerNetId, maxDistance, soundFile, soundVolume)

    Citizen.Wait(2000) -- Wartezeit, um sicherzustellen, dass der Sound abgespielt wird (optional, je nach Bedarf anpassen)
    
    ExecuteCommand("emotecancel ")
    ExecuteCommand("e karate ")
end, false)


