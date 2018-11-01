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

if ObjectTags.ShowDebugPrints then

	print( "Including Object Tag Config.")

end

ObjectTags = ObjectTags || {};
ObjectTags.config = {};

ObjectTags.config.SaveMode = 1// 0 = SQL, 1 = MySQL, 2 = txt files;
ObjectTags.config.SaveLocation = "entitytags/" // Folder Relative to garrysmod/data/
ObjectTags.config.SQLTableName = "playerTags" // Relative to save method 0;