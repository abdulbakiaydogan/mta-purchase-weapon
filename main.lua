screen = Vector2(guiGetScreenSize())
w, h = 550, 300
nx, ny = (screen.x-w)/2, (screen.y-h)/2

font, font1, font2 = exports.fonts:getFont('RobotoB',14), exports.fonts:getFont('Roboto',10), exports.fonts:getFont('RobotoB',12)

tabs = {
    
    {char='silahlar'},
    
}

vipitems = {
    {model='Colt',price=1750000,id=22},
    {model='Deagle',price=3250000,id=24},
    {model='Uzi',price=5000000,id=28},
    {model='Tec-9',price=6250000,id=32},
    {model='MP5',price=12500000,id=29},
    {model='Shotgun',price=22500000,id=25},
    {model='Rifle',price=25000000,id=33},
}

items = {
    {model='Colt',price=3500000,id=22},
    {model='Deagle',price=6500000,id=24},
    {model='Uzi',price=10000000,id=28},
    {model='Tec-9',price=12500000,id=32},
    {model='MP5',price=25000000,id=29},
    {model='Shotgun',price=45000000,id=25},
    {model='Rifle',price=50000000,id=33},
}

local secenek = items


local silahped= createPed(295, 1404.2579589844, -1300.28125, 13.802195358276)
setPedRotation(silahped, 273.3962097168)
setElementDimension( silahped, 0)
setElementInterior( silahped , 0 )
setElementData(silahped, 'name', 'Kacakci Necirvan', false)
setElementData(silahped, "talk", 1, false)
setPedAnimation ( silahped, "INT_OFFICE", "OFF_Sit_Bored_Loop", -1, true, false, false )
setElementFrozen(silahped, true)



addEvent('silahpanel:open',true)
addEventHandler('silahpanel:open', root, function()
    if not isTimer(render) then
        page = 1
        scroll = 0
        render = setTimer(function()
            roundedRectangle(nx,ny,w,h,tocolor(10,10,10))
			dxDrawShadowText(' silah satın alma paneli',nx+5,ny+15,w,h,tocolor(255,255,255),1,font)
            dxDrawText('kapat',nx+500,ny+10,w-470,h-270,tocolor(255,255,255),1,font1)
            if mousePos(nx+465,ny+5,w-470,h-270) and getKeyState('mouse1') then
                killTimer(render)
            end
            if getElementData(localPlayer, "vip") == 4 then
                secenek = vipitems
            else
                secenek = items
            end
                counter = 0
                y = 0
                for k, v in pairs(secenek) do
                    if k > scroll and counter < 6 then
                        roundedRectangle(nx+10,ny+60 + y,w-20,h-270,tocolor(10,10,10))
                        roundedRectangle(nx+420,ny+65 + y,w-440,h-280,mousePos(nx+420,ny+65 + y,w-440,h-280) and tocolor(30,137,54) or tocolor(40,40,40,180))
                        dxDrawText(v.model,nx+15,ny+67.5 +y,w,h,tocolor(255,255,255),1,font1)
                        dxDrawText('satın al',nx+425,ny+67.5 + y,w-400,h-100,tocolor(255,255,255),1,font1)
                        dxDrawText(tonumber(v.price)..' TL',nx+425 - dxGetTextWidth(tonumber(v.price)..' TL',1,font1,false) - 30,ny+67.5 +y,w,h,tocolor(30,137,54),1,font1)
                        if mousePos(nx+420,ny+65 + y,w-440,h-280) and getKeyState('mouse1') then
                            triggerServerEvent('silahpanel:satinal',localPlayer,v.model,v.price, v.id)
                            killTimer(render)
                        end
                        counter = counter + 1
                        y = y + 35
                end
            end
        end,0,0)
    end
end)

function up()
    if isTimer(render) then
        if scroll > 0 then
            scroll = scroll - 1
        end
    end
end

function down()
    if isTimer(render) then
        if scroll <= counter - 5 then
            scroll = scroll + 1
        end
    end
end
bindKey("mouse_wheel_up", "down", up)
bindKey("mouse_wheel_down", "down", down)


