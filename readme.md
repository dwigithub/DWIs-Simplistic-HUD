##How to Install
1. Goto C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\addons\darkrpmodification-master\lua\darkrp_modules\hudreplacement\cl_hudreplacement.lua
2. On line 20, change the "true" next to ["DarkRP_LocalPlayerHUD"] to false
3. Paste everything that's in DWIs_Simplistic_HUD.lua into cl_hudreplacement.lua under "The Custom HUD only draws health"
4. Save

##Changelog
7.14.16
v2 Released
•Colours don't pop out as much
•Everything's slightly transparent
•Fixed the ammo counter with some SWEPs (SWEPs that have -1 ammo don't have an ammo counter)
•Added the gun name next for the ammo counter, and for SWEPs with -1 ammo, the name is in the middle
•Fixed the alignment for health bar armor bar, job name, and name
•Fixed the playermodels staying after changing jobs (for the most part)
---
7.17.16
v2.5 Released
•Fixed some issues
•Removed icon model, changed to DModelPanel
Issues:
•You have to save on server startup,  otherwise the ammo counter won't work.
•I still don't know how to make an ammo bar (I want the width of the rounded box to lower as the ammo lowers, and I want it to be even)
Update: Woops! Released with without the playermodel changing! Updating it now :)
---
8.10.16
v2.6 Released
•Major bug fix - fixed the issue where you had to save whenever a player joined!

P.S.: I'm back :D I haven't developed the HUD for about a month.