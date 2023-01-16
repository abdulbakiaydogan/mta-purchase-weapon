addEvent('silahpanel:satinal',true)
addEventHandler('silahpanel:satinal',root,function(name,price,id)
 if exports.global:hasMoney(source, tonumber(price)) then
    local silahisim = getWeaponNameFromID(tonumber(id))
    local cid = tonumber(getElementData(source,"account:character:id"))
    local serial = exports.global:createWeaponSerial(1,cid)
    give, error = exports["item-system"]:giveItem(source, 115, tonumber(id)..":"..serial..":"..silahisim.."::")
    if give then
        exports.global:takeMoney(source, tonumber(price))
        outputChatBox('[!] #ffffffBaşarıyla '..name..' satın aldın.',source,0,255,0,true)
    else
        outputChatBox('[!] #ffffff'..name..'için üstünde yeterli yer yok.',source,255,0,0,true)
    end
end
end)