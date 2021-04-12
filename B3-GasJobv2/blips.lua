-- https://discord.gg/2mNts9zxdn في حين مواجهة اي مشاكل بالسكربت يرجى فتح تذكرة برمجية 

local blips = {
	{title="<FONT FACE = 'A9eelsh'>"..'ﺯﺎﻐﻟﺍ ﺐﻴﺑﺎﻧﺍ ﻊﻴﻨﺼﺗ ﺕﺍﻭﺩﺍ ﺀﺍﺮﺷ', colour=45, id=17, x=1127.1334228516,y=-2034.9617919922,z=32.062713623047},--=== شراء ادوات تصنيع الغاز ===--
	{title="<FONT FACE = 'A9eelsh'>"..'ﺯﺎﻐﻟﺍ ﺐﻴﺑﺎﻧﺍ ﻊﻴﻨﺼﺗ', colour=45, id=18, x=1443.2824707031,y=6332.2001953125,z=23.98189163208},--=== تصنيع العاز  ===--
		{title="<FONT FACE = 'A9eelsh'>"..'ﺯﺎﻐﻟﺍ ﺐﻴﺑﺎﻧﺍ ﻊﻴﺑ', colour=45, id=19, x=851.5546875,y=-3087.81640625,z=5.900927066803},--=== بيع الغاز  ===--
}

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)