-- https://discord.gg/2mNts9zxdn في حين مواجهة اي مشاكل بالسكربت يرجى فتح تذكرة برمجية 

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRPclient = Tunnel.getInterface("vRP", "vrp_Farmer") 
vRP = Proxy.getInterface("vRP")  

vRP.defInventoryItem({"gastools", "ادوات تصنيع الغاز", "قم بأستخدام هذي الادوات لتصنيع انابيب غاز", function(args) 
    local choices = {}
	
	choices["Use"] = {function(player,choice,mod)
		local user_id = vRP.getUserId({player})
        if user_id ~= nil then
            vRP.tryGetInventoryItem({user_id, "gastools", 1, true})
            TriggerClientEvent('gas', player)
            vRP.closeMenu({player})
        end
    end}
   
    return choices
end, 0.05})  

amount = 1000           -- سعر شراء ادوات التصنيع مقابل الحبة فقط

RegisterServerEvent('iasamanta')
AddEventHandler('iasamanta',function()
    local thePlayer = source
    local user_id = vRP.getUserId({thePlayer})
    local money =  vRP.getMoney({user_id})
      if user_id ~= nil then 
        vRP.prompt({thePlayer, "How many do you want to buy?", "", function(player,cat) 
            cat = tonumber(cat)  
              if (cat > 0) then 
                local cost = cat *amount 
                if (money >= cost) then 
                    vRP.tryPayment({user_id, cost}) 
                    vRP.giveInventoryItem({user_id,"gastools",cat,true})
                    vRPclient.notify(thePlayer,{"~g~لقد خصم منك "..cost})
                else 
                    vRPclient.notify(thePlayer,{"لا تمتلك الاموال الكافية"})
                end
            else  
                vRPclient.notify(thePlayer,{"لا يمكنك الشراء بهذا العدد"})
            end
        end})
    end

end)
RegisterServerEvent('dafaina')
AddEventHandler('dafaina', function()
     local thePlayer = source
	local user_id = vRP.getUserId({thePlayer})
   if user_id ~= nil then 
    vRP.giveInventoryItem({user_id, "gascan", 1, true}) 
   end

end) 
 
plata = 3000     -- السعر مقابل انبوبة واحدة

RegisterServerEvent('iabani') 
AddEventHandler('iabani', function()
     local thePlayer = source
	local user_id = vRP.getUserId({thePlayer})
 local faina = vRP.getInventoryItemAmount({user_id,"gascan"}) 
 local paycheck =  plata * faina  
   if vRP.tryGetInventoryItem({user_id, "gascan", faina, true}) then           
          vRP.giveMoney({user_id, paycheck})
          vRPclient.notify(thePlayer, {"~b~You recived: "..paycheck.." ~r~$"})  
          
   else 
    vRPclient.notify(thePlayer, {"~b~لا تمتلك ادوات تصنيع الغاز"})  
   end
end) 

