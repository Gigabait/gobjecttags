/*=====================================================================
== Made by Mario 'Tibba'Sinn 										 ==
== CONTACT: mariosgameroominquiries@gmail.com" 						 ==
== YOUTUBE: https://www.youtube.com/channel/UCVYG2ZDHynAXgYLP6J9hxUg ==
== STEAM: https://steamcommunity.com/profiles/76561198191730261/     ==
== GITHUB: https://github.com/TibbaRrule/gquipmentslots				 ==
=======================================================================
== Please consider subscribing to my youtube channel if you end up   ==
== using this addon.												 ==
=======================================================================
== LICENSE: CC BY-NC 4.0											 ==
== https://creativecommons.org/licenses/by-nc/4.0/ 					 ==
=======================================================================*/
// Network Library written by Acecool, permission has been given to release this addon with the library included.
// This is a personalized version seperate from official releases.
// Acecool Contact: https://discordapp.com/widget?id=222545724544516097 or https://discordapp.com/channels/222545724544516097/222545724544516097
 
 
ObjectTags = ObjectTags || {};

ObjectTags.ShowDebugPrints = false;

if ObjectTags.ShowDebugPrints then

	print( "Including Object Tag Files.")

end

if SERVER then

	AddCSLuaFile( "ext/flagsnwlib.lua")
	include( "ext/flagsnwlib.lua" )
	include("objtags/filesystem/tagmysql.lua")
	include("objtags/filesystem/tagsql.lua")
	include("objtags/filesystem/tagdata.lua")

	// Load Serverside Scripts
	for k,v in pairs(file.Find("objtags/sv/*.lua", "LUA")) do
		include( "objtags/sv/" .. v )

	end

	// Load Clientside Scripts
	for k,v in pairs(file.Find("objtags/cl/*.lua", "LUA")) do
		AddCSLuaFile( "objtags/cl/" .. v )

	end

	// Load Shared Scripts
	for k,v in pairs(file.Find("objtags/*.lua", "LUA")) do
		AddCSLuaFile( "objtags/" .. v )
		include( "objtags/" .. v )
	end


end 

if CLIENT then

	include( "ext/flagsnwlib.lua" )

	// Load Clientside Scripts
	for k,v in pairs(file.Find("objtags/cl/*.lua", "LUA")) do
		include( "objtags/cl/" .. v )

	end

	// Load Shared Scripts
	for k,v in pairs(file.Find("objtags/*.lua", "LUA")) do
		
		include( "objtags/" .. v )

	end

end


   