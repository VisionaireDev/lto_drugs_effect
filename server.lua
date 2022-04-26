VORP = exports.vorp_inventory:vorp_inventoryApi()

-- Weed/Smoke/Fumer
VORP.RegisterUsableItem("weed", function(data)
	VORP.subItem(data.source, "weed", 1)
	TriggerClientEvent('lto_drugs_effect:weed', data.source)
end)

-- Moonshine/Drink/Drunk/Alcool
VORP.RegisterUsableItem("moonshine", function(data)
	VORP.subItem(data.source, "moonshine", 1)
	TriggerClientEvent('lto_drugs_effect:moonshine', data.source)
end)

-- Mush/Eat/Manger
VORP.RegisterUsableItem("mush", function(data)
	VORP.subItem(data.source, "mush", 1)
	TriggerClientEvent('lto_drugs_effect:mush', data.source)
end)