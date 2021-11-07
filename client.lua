--[[
Copyright (C) 2021 Sub-Zero Interactive

All rights reserved.

Permission is hereby granted, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software with 'All rights reserved'. Even if 'All rights reserved' is very clear :

  You shall not sell and/or resell this software
  The rights to use, modify and merge
  The above copyright notice and this permission notice shall be included in all copies and files of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
--]]
local tint = nil
local display = false

RegisterCommand("checktint", function()
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            SetDisplay(true)

            if GetVehicleWindowTint(vehicle) == -1  then
                SendNUIMessage({    
                    type = "data",
                    tint = 'None',
                    textColor = '--color-black'
                })
            elseif GetVehicleWindowTint(vehicle) == 0 then
                SendNUIMessage({
                    type = "data",
                    tint = 'Stock',
                    textColor = '--color-black'
                })
            elseif GetVehicleWindowTint(vehicle) == 1 then
                SendNUIMessage({
                    type = "data",
                    tint = 'Pure Black',
                    textColor = '--color-red'
                })
            elseif GetVehicleWindowTint(vehicle) == 2 then
                SendNUIMessage({
                    type = "data",
                    tint = 'Dark Smoke',
                    textColor = '--color-red'
                })
            elseif GetVehicleWindowTint(vehicle) == 3 then
                SendNUIMessage({
                    type = "data",
                    tint = 'Light Smoke',
                    textColor = '--color-black'
                })
            elseif GetVehicleWindowTint(vehicle) == 4 then
                SendNUIMessage({
                    type = "data",
                    tint = 'Limo',
                    textColor = '--color-black'
                })
            elseif GetVehicleWindowTint(vehicle) == 5 then
                SendNUIMessage({
                    type = "data",
                    tint = 'Green',
                    textColor = '--color-black'
                })
            end
        end
        FreezeEntityPosition(PlayerPedId(), false)
end, false)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

RegisterNUICallback("exit", function(data)
    SetDisplay(false)
    SendNUIMessage({
        type = "data",
        tint = 'None',
        textColor = '--color-black'
    })
end)

RegisterNetEvent('szi_windowtint:displayTint')
AddEventHandler('szi_windowtint:displayTint', function(tint, color)
    SendNUIMessage({
        type = "data",
        tint = tint,
        textColor = color
    })
end)
