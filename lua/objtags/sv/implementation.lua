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

	print( "Including Object Tag Implementations.")

end 

/* Thanks Overv */
// https://gmod.facepunch.com/f/gmoddev/lhhv/Get-player-by-name/1/

function RetrievePlayerByName( name )
	name = name:lower()
	for k , v in pairs( player.GetAll() ) do
		if ( v:Nick():lower():find( name, 1, true ) ) then
			return v
		end
	end
end

hook.Add( "PlayerSay", "ChatTagManagement", function( ply, text, public )

	if ply:IsDev() then

		local _Sentence = string.Explode( " " , string.lower( text ) );
		local IsPrivate = false;

		if ( _Sentence[1] == "!addtag" ) then

			local _p = RetrievePlayerByName( _Sentence[2])

			if _p && _p:IsPlayer() then
				
				_p:AddTag( _Sentence[3] )
				
				ply:ChatPrint( "Added the tag of " .. _Sentence[3] .. " to " .. _p:Nick() )
				_p:ChatPrint( ply:Nick() .. " has added the following tag to your account: " .. _Sentence[3] )
			end


			return "";
			
		elseif ( _Sentence[1] == "!remtag" ) then
			
			local _p = RetrievePlayerByName( _Sentence[2])

			if _p && _p:IsPlayer() then

				_p:RemoveTag( _Sentence[3] )

				ply:ChatPrint( "Removed the tag of " .. _Sentence[3] .. " to " .. _p:Nick() )
				_p:ChatPrint( ply:Nick() .. " has removed the following tag to your account: " .. _Sentence[3] )

			end
			
			return "";
		end

	end

	return text;

end )

gameevent.Listen( "player_disconnect" );
hook.Add( "player_disconnect", "SavePlayerTagsOnDisconnect", function( _data )

	// All of the data values; shown in case saving is done using steamid, or whatever...
	local _id = _data.userid;			// Same as Player:UniqueID( );
	local _p = Player( _id ); 			// The Player Entity, if valid
	local _steamID = data.networkid // 

	//DarkRPranks.jobtiming.UpdateJobTime( _p , _p:Team() )
	//print(_steamid)
	//PrintTable(_p:getFlag("PlayerJobTimes", {})) 

	ObjectTags.system.SavePlayerTags( _id )

end );

hook.Add( "ShutDown", "SaveAllPlayerTags", function( )
	
	for k , v in pairs( player.GetHumans() ) do

		ObjectTags.system.SavePlayerTags( v:SteamID() )

	end	
	
end );

hook.Add( "PlayerFullyConnected" , "LoadJobTimeTable", function( _p, _clientside ) 

	ObjectTags.system.LoadPlayerTags( _p:SteamID() )

end)