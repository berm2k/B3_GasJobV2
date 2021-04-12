-- https://discord.gg/2mNts9zxdn في حين مواجهة اي مشاكل بالسكربت يرجى فتح تذكرة برمجية 

vRP = Proxy.getInterface("vRP") 
x, y, z = 1443.2824707031,6332.2001953125,23.98189163208                                        -- نقطة استخدام الادوات لتصنيع الانابيب


timplagradinarit = 10      -- planting time in  seconds
timplacules =  10            -- harvesting time in seconds
 
       
local plantsObject = GetHashKey("")         -- the plant
local plants = {}

caciula = false 

RegisterNetEvent('gas')
AddEventHandler('gas', function()
     local player = GetPlayerPed(-1)
     local coord = GetEntityCoords(player) 
       if (GetDistanceBetweenCoords(coord.x, coord.y, coord.z, x, y, z-1.7, true)) < 40.0 then   
         TaskStartScenarioInPlace(player,"WORLD_HUMAN_WELDING", 0, true)   
        vRP.notify({"~r~انت الان تقوم بالتصنيع "..timplagradinarit.."  بالثواني"})
         Citizen.Wait(timplagradinarit * 1000)     -- time for planting
         RequestModel(plantsObject)
         plants[#plants+1] = CreateObject(plantsObject, coord.x, coord.y, coord.z-3.2, false, false, true)
         vRP.notify({"~r~انت الان تقوم بالتصنيع "..timplacules.."  بالثواني"})
          Citizen.Wait(timplagradinarit * 1000)     -- time for planting  
             for i,v in pairs (plants) do 
           
          DeleteObject(plants[i])
          plants[i] = nil
          TriggerServerEvent('dafaina')
          ClearPedTasksImmediately(player)   
             end
       else 
        vRP.notify({"~r~ﻂﻘﻓ ﺺﺼﺨﻤﻟﺍ ﻥﺎﻜﻤﻟﺎﺑ ﺕﺍﻭﺩﻻﺍ ﻡﺍﺪﺨﺘﺳﺄﺑ ﻢﻗ"})
        end   
end)
 
Citizen.CreateThread(function()
  while true do 
    Citizen.Wait(0)
  local player = GetPlayerPed(-1)
  local coord = GetEntityCoords(player) 
  if (GetDistanceBetweenCoords(coord.x, coord.y, coord.z, 851.5546875,-3087.81640625,5.900927066803, true)) < 5.0 then           -- نقطة البيع
    Draw3DText(851.5546875,-3087.81640625,5.900927066803-0.8,"<FONT FACE = 'A9eelsh'>"..'~w~ﺯﺎﻐﻟﺍ ﻊﻴﺒﻟ ~g~[E]~w~ ﻂﻐﺿﺍ',0.1,0.1)    -- نقطة البيع
    DrawMarker(0, 851.5546875,-3087.81640625,5.900927066803,0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 255, 128, 0, 50,true, true, 2, nil, nil, true )   -- نقطة البيع
    if(IsControlJustReleased(1, 51))then
      TriggerServerEvent('iabani')
    end
  end
 end
end)


Citizen.CreateThread(function()
    while true do 
      Citizen.Wait(0) 
      local player = GetPlayerPed(-1)
      local coord = GetEntityCoords(player)
      if (GetDistanceBetweenCoords(coord.x, coord.y, coord.z, x, y, z-1.7, true)) < 5.0 then   
        Draw3DText(x, y, z-0.8,"<FONT FACE = 'A9eelsh'>"..'ﺎﻨﻫ ﺯﺎﻐﻟﺍ ﺔﻋﺎﻨﺼﺑ ﻢﻗ',0.1,0.1)  
        DrawMarker(22, x, y, z,0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 2, 250, 0, 50, true, true, 2, nil, nil, true ) 
      end
    end
end)

Citizen.CreateThread(function()
  while true do 
    Citizen.Wait(0) 
    local player = GetPlayerPed(-1)
    local coord = GetEntityCoords(player)
    if (GetDistanceBetweenCoords(coord.x, coord.y, coord.z,1127.1334228516,-2034.9617919922,32.062713623047 , true)) < 5.0 then   
      Draw3DText(1127.1334228516,-2034.9617919922,32.062713623047-0.8,"<FONT FACE = 'A9eelsh'>"..'ﺯﺎﻐﻟﺍ ﻊﻴﻨﺼﺗ ﺕﺍﻭﺩﺍ ﺀﺍﺮﺸﻟ ﻂﻐﺿﺍ',0.1,0.1) 
      DrawMarker(42, 1127.1334228516,-2034.9617919922,32.062713623047,0.0, 0.0, 0.0, 0.0, 200.0, 0.0, 1.5, 1.5, 1.5, 0, 53, 250, 50, true, true, 2, nil, nil, true ) 
      if(IsControlJustReleased(1, 51))then
        TriggerServerEvent('iasamanta')
      end 
    end
  end
end)
                                                                                                      

function Draw3DText(x,y,z,textInput,scaleX,scaleY)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
    local scale = (1/dist)*20
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov   
    SetTextScale(scaleX*scale, scaleY*scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(250, 250, 250, 255)
    SetTextDropshadow(1, 1, 1, 1, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+2, 0)
    DrawText(0.0, 0.0)
end