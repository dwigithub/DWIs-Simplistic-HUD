	--[[--------------------------------------------------------------------------------------------------------------------------------
											 deal with it's Simplistic HUD because I can't think of a good name
																	Author: deal with it
												Special thanks to Facepunch forum users "Thane" and "MPan1"
																for helping me fix my problems
																	    Version 2.0
	----------------------------------------------------------------------------------------------------------------------------------]]
		
	surface.CreateFont( "Font", {
		font = "Impact",
		extended = false,
		size = 30,
		weight = 500,
		blursize = 0,
		scanlines = 0,
		antialias = true,
		underline = false,
		italic = false,
		strikeout = false,
		symbol = false,
		rotary = false,
		shadow = false,
		additive = false,
		outline = true,
	} )

		surface.CreateFont( "Font2", {
		font = "Impact",
		extended = false,
		size = 40,
		weight = 500,
		blursize = 0,
		scanlines = 0,
		antialias = true,
		underline = false,
		italic = false,
		strikeout = false,
		symbol = false,
		rotary = false,
		shadow = false,
		additive = false,
		outline = true,
	} )


local client = LocalPlayer()
local model = vgui.Create("SpawnIcon")
model:SetPos(10 + 10, ScrH() - 154)

function removeammo(name)
	for _, v in pairs({"CHudAmmo", "CHudSecondaryAmmo"})do
		if name == v then return false end
	end
end
hook.Add("HUDShouldDraw", "removeammofunc", removeammo)

hook.Add("HUDPaint" , "DrawMyHUD" , function()

	local health = LocalPlayer():Health()
	draw.RoundedBox(0,20,ScrH() - 90,300 + 4 , 30 + 4,Color(40, 40, 40, 230))
	draw.RoundedBox(0,22,ScrH() - 88,health * 3,30,Color(255,50,50, 115))
	draw.SimpleText(health.. "%" , "Font",10 + 157, ScrH() - 72,Color(255,255,255),1, 1)

	local armor = LocalPlayer():Armor()
	draw.RoundedBox(0,20,ScrH() - 50,300 + 4 , 30 + 4,Color(40, 40, 40, 230))
	draw.RoundedBox(0,22,ScrH() - 48,armor * 3,30,Color(0,0,255, 115))
	draw.SimpleText(armor.. "%" , "Font",10 + 157, ScrH() - 32,Color(255,255,255),1, 1)

	local Money = LocalPlayer():getDarkRPVar("money") or 0
	draw.SimpleText("$".. Money ,"Font",10 + 280, ScrH() - 130,Color(50,175,0, 230),1, 1)
	
	local Salary = LocalPlayer():getDarkRPVar("salary") or 0
	draw.SimpleText("$".. Salary ,"Font",10 + 280, ScrH() - 105,Color(255,255,0, 230),1, 1)

	local Job = LocalPlayer():getDarkRPVar("job")
	draw.SimpleText(Job , "Font", 10 + 63, ScrH() - 105,Color(255,255,255, 175),0, 1)

	draw.SimpleText(LocalPlayer():Nick() , "Font", 10 + 63, ScrH() - 130,Color(255,255,255, 185),0, 1)

        model:SetModel(LocalPlayer():GetModel())
        	timer.Create("RefreshAvatar", 1, 0, function()
		if LocalPlayer():GetModel() ~= model.Entity:GetModel() then
			model:Remove()

		end
	end)

        if client:GetActiveWeapon():Clip1() >= 0 then
		draw.RoundedBox(3, ScrW() - 165, ScrH() - 115,150,100,Color(40,40,40, 230))
		draw.RoundedBox(3, ScrW() - 163, ScrH() - 113,150 - 4,100 - 4,Color(100, 100, 150, 115))
        draw.SimpleText(client:GetActiveWeapon():Clip1(),"Font2",ScrW() - 130, ScrH() - 65,Color(255,255,255), 1, 1)
        draw.SimpleText(client:GetAmmoCount(client:GetActiveWeapon():GetPrimaryAmmoType()), "Font2",ScrW() - 50, ScrH() - 65,Color(255,255,255), 1, 1)
        draw.SimpleText(client:GetActiveWeapon():GetPrintName(), "Font",ScrW() - 90, ScrH() - 128,Color(255,255,255), 1, 1)
        draw.RoundedBox(0, ScrW() - 90, ScrH() - 105,1,80,Color(245,245,245,57))
    else
    draw.SimpleText(client:GetActiveWeapon():GetPrintName(), "Font",ScrW() / 2, ScrH() - 60,Color(255,255,255,185), 1, 1)

end
end)