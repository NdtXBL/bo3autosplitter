/*
Black Ops 3 Campaign Auto-Splitter
By: Ndt

This is an auto-splitter and load remover for BO3 campaign speedruns. As of right now, there are different
versions of the game, so I will breakdown how to find these memory codes easily incase any of them are
updated. We could do dynamic memory code searching but I don't feel like learning how to do that tbh, I'm
alright with this.

================================================================================

loads_switchmap: accounts for map loads on the load remover. is 0 while loading. is 1 while inactive.

Example: While on the main menu, you can just search for 1 codes. This will take a bit, but so do these loads. Now load the safehouse and then search through
that same list but for the ones that changed to 0. Once the safehouse loads, you can switch it back to 1. You can do the same thing immediately by exiting and searching
for 0 during that exit load. And you can rinse and repeat that process. This code is pretty easy to find.


--------------------------------------------------------------------------------

loads_fastload: accounts for fastloads, which are in-game loads with treyarch icons. can be a positive number when loading. is -1 while inactive.

Example: While on the main menu, you can just search for -1 codes. Then boot up the safehouse. After the treyarch loading icon is revealed, pause the game
(while the load is active) and search for anything above -1. It usually is 2 in this scenario, but I'd search for values in between 1 and 4 to be safe. Then
just switch back to -1 when the fastload is complete.


--------------------------------------------------------------------------------

loads_whiteigc: accounts for the mini-loading screens on new world, which is where the white infinite loading movie plays.

Example: While the white infinite video is not playing, search for 0 codes. This can legit be anywhere. Main menu, safehouse, New World, doesn't matter. Next, load New World and skip the first
cutscene when it appears. After the white infinite loading screen is active, pause the game and search for any value above 5. For me, it was 9 on my first attempt. When it ends search for 0 again.
You can restart the mission and stumble upon it again. Whatever that number was, it should increase. Since it was 9 for me on my first attempt, it ended up being 10 the next time I saw it. It kept
increasing every time I stumbled upon it and went back to 0 when it wasn't active. What is consistent about this code is that it's always 0 when they are not playing, and it seems to be a value in
between 5-20 when it is playing.

--------------------------------------------------------------------------------

cp_statsreset: checks when you reset your stats, which prompts a timer reset for Any% runs.

Example: If on the main menu, you can search for 0 codes. Now reset your campaign stats and immediately search for 1. Once it finishes that initial loading sequence, it switches back to 0
and stays that way until you reset again. Resetting will again put it to 1 very briefly. This code is very consistent and does not seem to fluctuate at all. It's either 0 if you aren't
resetting stats or 1 if you are.

--------------------------------------------------------------------------------

mission_skipto: checks which skipto you are currently on during a mission.

Example: If on the main menu, you can search for 0 codes. Then load Life. After skipping the first cutscene and regaining control, pause the game and search for 32 codes. Now
grab the skipto ahead, which is when you cross the street, then search for 64 codes. Reset the mission, wait for the cutscene to show up and search for 16 codes. You can then
skip it and search for 32 again. Cycle continues until you find it.


--------------------------------------------------------------------------------

mission_currentsequence1: determines which objective you are on. important for patching up fastloads issues.

Optional: If on the main menu, you can search for 1 codes. If in the mobile safehouse, you could also search for 2 codes (this fluctuates though). I would load Life though.
Example: Once you load Life, search for 2097152 while on the mission briefing text. After that finishes, pause the game and search for 2228224. You can then skip the cutscene and search for
2129920 (wait 1-2 seconds after skipping the cutscene though). You can then restart the mission and pause the game during the fastload (you gotta be a bit quick to it) and then search for 0.
You can then repeat the cycle until you find the code.


--------------------------------------------------------------------------------

mission_currentsequence2: once again, determines which objective you are on. this one behaves slightly different so it's important for parts where the other one isn't really useful for.

Optional: If on the main menu, you can search for 0 codes. If in the mobile safehouse, you could also search for 8 codes (this fluctuates though). I would load Life though.
Example: Once you load Life, search for 16809984 while on the mission briefing text. After that finishes, pause the game and search for 16777216. You can then restart the
mission and pause the game during the fastload (you gotta be a bit quick to it) and then search for 0. You can then repeat the cycle until you find the code.

--------------------------------------------------------------------------------

mapname: determines the map that is currently loaded. you'll need to know the codename of the map, which can be seen in my map documentation or through the developer console.

Example: "cp_mi_zurich_coalescense" is the mapname for Life. While on the main menu, the mapname is "core_frontend". Additionally, the mobile safehouse is
"cp_sh_mobile". You'll also see this memory code change to a map that is non-existent while on map loads.

--------------------------------------------------------------------------------

gamemode: determines the gamemode that is currently loaded. you'll need to know the codename of the gamemode.

Example: "coop" is the gamemode for campaign. Anytime you are in a campaign lobby in-game (can't be the main menu), this will
return "coop". On the otherhand, nightmares will display "cpzm". To make this process easier, you can go to custom games and switch the gamemode
to team deathmatch. Then search for "tdm" after loading match. You can then switch the gamemode to capture the flag and you can search
for "ctf". Switch to search and destroy and search for "sd". Finally, you can top it off by heading over to the campaign and searching for "coop".

================================================================================

*/

state("BlackOps3", "steam")
{
	int loads_switchmap : 0x348F7DC;
	int loads_fastload : 0x3534808;
	int loads_whiteigc : 0x4D4B910;
	int cp_statsreset : 0x53DC2A0;
	int mission_skipto : 0xA55BEF0;
	int mission_currentsequence1 : 0xA55BDF0;
	int mission_currentsequence2 : 0xA55BDF4;
	string70 mapname : 0x940C5E8;
	string70 gamemode : 0x1770D5DC;
}

state("BlackOps3", "windows")
{
	int loads_switchmap : 0x33D075C;
	int loads_fastload : 0x3475788;
	int loads_whiteigc : 0x3B10F80;
	int cp_statsreset : 0x9BB4710;
	int mission_skipto : 0x7F1F0A0;
	int mission_currentsequence1 : 0x7F1EFA0;
	int mission_currentsequence2 : 0x7F1EFA4;
	string70 mapname : 0x90FC4D0;
	string70 gamemode : 0x1858937C;
}

state("boiii_vanilla", "boiii")
{
	int loads_switchmap : "blackops3.exe", 0x348F7DC;
	int loads_fastload : "blackops3.exe", 0x3534808;
	int loads_whiteigc : "blackops3.exe", 0x4D4B910;
	int cp_statsreset : "blackops3.exe", 0x53DC2A0;
	int mission_skipto : "blackops3.exe", 0xA55BEF0;
	int mission_currentsequence1 : "blackops3.exe", 0xA55BDF0;
	int mission_currentsequence2 : "blackops3.exe", 0xA55BDF4;
	string70 mapname : "blackops3.exe", 0x940C5E8;
	string70 gamemode : "blackops3.exe", 0x1770D5DC;
}

startup
{
	vars.resettingcampaign = false;
	vars.blackopssplit = false;
	vars.newworldsplit = false;
	vars.indarknesssplit = false;
	vars.provocationsplit = false;
	vars.hypocentersplit = false;
	vars.vengeancesplit = false;
	vars.risefallsplit = false;
	vars.demonwithinsplit = false;
	vars.sandcastlesplit = false;
	vars.lotustowerssplit = false;
	vars.lifesplit = false;
	vars.skiptoHistory = new List<int>();
	vars.mapHistory = new List<string>();
	vars.ilreset = false;
	settings.Add("setting_ilmode", false, "IL Mode");
	settings.SetToolTip("setting_ilmode", "Auto-splitter settings designed for focusing on IL runs.");
	settings.Add("setting_ilskiptor", true, "Reset By Skipto", "setting_ilmode");
	settings.SetToolTip("setting_ilskiptor", "Makes it so that the auto-splitter automatically resets when restarting a mission.");
	settings.Add("setting_ilskiptos", false, "Split By Skipto", "setting_ilmode");
	settings.SetToolTip("setting_ilskiptos", "Splits everytime a new skipto has been collected. Only use if you know how many skiptos there are per mission or have the proper split files for this setup.");
	settings.Add("setting_ilskiptost", false, "Start Safeguard", "setting_ilmode");
	settings.SetToolTip("setting_ilskiptost", "Only starts the timer on IL mode after an auto-reset.");
	settings.Add("load_remover", true, "Load Remover");
	settings.SetToolTip("load_remover", "Removes loads automatically, enabling an LRT re-time without speedrun mods having to do so.");
	settings.Add("setting_fastloads", true, "Remove Fast-Loads", "load_remover");
	settings.SetToolTip("setting_fastloads", "Determines if the load remover accounts for fast loads or not. This is in place due to it breaking on co-op.");
	settings.Add("setting_loadoutseq", true, "Remove Mission Load-out Sequence", "load_remover");
	settings.SetToolTip("setting_loadoutseq", "Determines if the load remover accounts for mission load-out sequences or not. This is in place due to it breaking on co-op.");
	settings.Add("map_safeguard", true, "Map Safeguard");
	settings.SetToolTip("map_safeguard", "Double checks to make sure that you have entered the previous map before splitting. Only necessary on campaign (not nightmares).");
	settings.Add("aslmissions", true, "Auto-Split Missions");
	settings.SetToolTip("aslmissions", "Determines if the auto-splitter is functioning or not. The subvalues being checked or unchecked will determine if those missions are accounted for individually.");
	vars.aslmissions = new Dictionary<string,string> 
	{  
		{"blackops", "Black Ops"},
    	{"newworld", "New World"},
    	{"indarkness", "In Darkness"},
    	{"provocation", "Provocation"},
    	{"hypocenter", "Hypercenter"},
    	{"vengeance", "Vengeance"},
    	{"risefall", "Rise & Fall"},
    	{"demonwithin", "Demon Within"},
    	{"sandcastle", "Sand Castle"},
    	{"lotus", "Lotus Towers"},
    	{"life", "Life"},
	};
 	foreach (var missionnm in vars.aslmissions)
	{
		settings.Add(missionnm.Key, true, missionnm.Value, "aslmissions");
    };
}

init
{
	if (modules.First().ModuleMemorySize == 441708544) //STEAM MEMORY SIZE: 531329024
	{
		version = "windows";
	}
}

start
{
	if ((settings["setting_ilmode"]) && ((vars.ilreset == true && settings["setting_ilskiptost"]) || !(settings["setting_ilskiptost"])) && (current.mapname != "cp_sh_mobile") && (current.mapname != "cp_sh_singapore") && (current.mapname != "cp_sh_cairo") && (current.mapname != "core_frontend") && (current.mapname != "cp_mi_sing_biodomes2") && (current.mapname != "cp_mi_cairo_ramses2") && (current.mapname != "cp_mi_cairo_infection2") && (current.mapname != "cp_mi_cairo_infection3") && (current.mapname != "cp_mi_cairo_lotus2") && (current.mapname != "cp_mi_cairo_lotus3") && (current.loads_switchmap != 0)) 
	{
		if(current.gamemode=="cpzm") //nightmares
		{
			if((current.mapname=="cp_mi_eth_prologue") && (current.mission_skipto==8) && (current.mission_currentsequence1==1073741832))
			{
				vars.ilreset = false;
		    	return true;
			}
			if((current.mapname=="cp_mi_zurich_newworld") && (current.mission_skipto==8) && (current.mission_currentsequence2==2176))
			{
				vars.ilreset = false;
		    	return true;
			}
			if((current.mapname=="cp_mi_sing_blackstation") && (current.mission_skipto==8) && (current.mission_currentsequence2==128))
			{
				vars.ilreset = false;
		    	return true;
			}
			if((current.mapname=="cp_mi_sing_biodomes") && (current.mission_skipto==8) && (current.mission_currentsequence2==256))
			{
				vars.ilreset = false;
		    	return true;
			}
			if((current.mapname=="cp_mi_sing_sgen") && (current.mission_skipto==8) && (current.mission_currentsequence2==-2147450880))
			{
				vars.ilreset = false;
		    	return true;
			}
			if((current.mapname=="cp_mi_sing_vengeance") && (current.mission_skipto==8) && (current.mission_currentsequence1==1073743896))
			{
				vars.ilreset = false;
		    	return true;
			}
			if((current.mapname=="cp_mi_cairo_ramses") && (current.mission_skipto==8) && (current.mission_currentsequence2==12293))
			{
				vars.ilreset = false;
		    	return true;
			}
			if((current.mapname=="cp_mi_cairo_infection") && (current.mission_skipto==8) && (current.mission_currentsequence2==537395200))
			{
				vars.ilreset = false;
		    	return true;
			}
			if((current.mapname=="cp_mi_cairo_aquifer") && (current.mission_skipto==8) && (current.mission_currentsequence2==16809984))
			{
				vars.ilreset = false;
		    	return true;
			}
			if((current.mapname=="cp_mi_cairo_lotus") && (current.mission_skipto==8) && (current.mission_currentsequence1==1073741840))
			{
				vars.ilreset = false;
		    	return true;
			}
			if((current.mapname=="cp_mi_zurich_coalescence") && (current.mission_skipto==16))
			{
				vars.ilreset = false;
		    	return true;
			}
		}
		else //campaign
		{
			if((current.mapname=="cp_mi_eth_prologue") && (current.mission_skipto==8) && (current.mission_currentsequence2==128))
			{
				vars.ilreset = false;
		    	return true;
			}
			if((current.mapname=="cp_mi_zurich_newworld") && (current.mission_skipto==8) && (current.mission_currentsequence2==1152))
			{
				vars.ilreset = false;
		    	return true;
			}
			if((current.mapname=="cp_mi_sing_blackstation") && (current.mission_skipto==8) && (current.mission_currentsequence2==64))
			{
				vars.ilreset = false;
		    	return true;
			}
			if((current.mapname=="cp_mi_sing_biodomes") && (current.mission_skipto==8) && (current.mission_currentsequence2==128))
			{
				vars.ilreset = false;
		    	return true;
			}
			if((current.mapname=="cp_mi_sing_sgen") && (current.mission_skipto==8) && (current.mission_currentsequence2==1073758208))
			{
				vars.ilreset = false;
		    	return true;
			}
			if((current.mapname=="cp_mi_sing_vengeance") && (current.mission_skipto==8) && (current.mission_currentsequence1==536871944))
			{
				vars.ilreset = false;
		    	return true;
			}
			if((current.mapname=="cp_mi_cairo_ramses") && (current.mission_skipto==8) && (current.mission_currentsequence2==6146))
			{
				vars.ilreset = false;
		    	return true;
			}
			if((current.mapname=="cp_mi_cairo_infection") && (current.mission_skipto==8) && (current.mission_currentsequence2==268697600))
			{
				vars.ilreset = false;
		    	return true;
			}
			if((current.mapname=="cp_mi_cairo_aquifer") && (current.mission_skipto==8) && (current.mission_currentsequence1==-2147221504))
			{
				vars.ilreset = false;
		    	return true;
			}
			if((current.mapname=="cp_mi_cairo_lotus") && (current.mission_skipto==8) && (current.mission_currentsequence1==536870912))
			{
				vars.ilreset = false;
		    	return true;
			}
			if((current.mapname=="cp_mi_zurich_coalescence") && (current.mission_skipto==16))
			{
				vars.ilreset = false;
		    	return true;
			}
		}
	}
	if ((current.gamemode!="cpzm") && (current.mission_currentsequence2==128 && current.mission_skipto==8) && (current.mapname == "cp_mi_eth_prologue") && (current.loads_switchmap != 0)) return true;
	if ((current.gamemode=="cpzm") && (current.mission_currentsequence2==-2147450880 && current.mission_skipto==8) && (current.mapname == "cp_mi_sing_sgen") && (current.loads_switchmap != 0)) return true;
	if(vars.resettingcampaign==true && current.loads_switchmap!=0)
	{
		vars.resettingcampaign = false;
		return true;
	}
	return false;
}

onReset
{
	vars.blackopssplit = false;
	vars.newworldsplit = false;
	vars.indarknesssplit = false;
	vars.provocationsplit = false;
	vars.hypocentersplit = false;
	vars.vengeancesplit = false;
	vars.risefallsplit = false;
	vars.demonwithinsplit = false;
	vars.sandcastlesplit = false;
	vars.lotustowerssplit = false;
	vars.lifesplit = false;
	vars.skiptoHistory.Clear();
	vars.mapHistory.Clear();
}

update
{
    if (current.mapname != null && !(vars.mapHistory.Contains(current.mapname)) && settings["map_safeguard"])
    {
        vars.mapHistory.Add(current.mapname);
    }
}

split
{
	if((current.mapname=="cp_mi_eth_prologue") && (old.mission_skipto==16777216) && (current.mission_skipto==0) && (settings["blackops"]) && (vars.blackopssplit!=true) && (current.loads_switchmap!=0))
	{
		vars.blackopssplit = true;
		return true;
	}
	if((current.mapname=="cp_sh_singapore") && (settings["newworld"]) && (current.mission_currentsequence2==2) && (vars.newworldsplit!=true) && (current.loads_switchmap!=0))
	{
		if (settings["map_safeguard"] && !(vars.mapHistory.Contains("cp_mi_zurich_newworld")))
	    {
	        return false;
	    }
		vars.newworldsplit = true;
		return true;	
	}
	if((current.mapname=="cp_sh_singapore") && (settings["indarkness"]) && (current.mission_currentsequence2==3) && (vars.indarknesssplit!=true) && (current.loads_switchmap!=0))
	{
		if (settings["map_safeguard"] && !(vars.mapHistory.Contains("cp_mi_sing_blackstation")))
	    {
	        return false;
	    }
		vars.indarknesssplit = true;
		return true;	
	}
	if((current.mapname=="cp_sh_singapore") && (settings["provocation"]) && (current.mission_currentsequence2==5) && (vars.provocationsplit!=true) && (current.loads_switchmap!=0))
	{
		if (settings["map_safeguard"] && !(vars.mapHistory.Contains("cp_mi_sing_biodomes2")))
	    {
	        return false;
	    }
		vars.provocationsplit = true;
		return true;
	}
	if((current.mapname=="cp_sh_mobile") && (settings["hypocenter"]) && (current.mission_currentsequence2==6) && (vars.hypocentersplit!=true) && (current.loads_switchmap!=0))
	{
		if (settings["map_safeguard"] && !(vars.mapHistory.Contains("cp_mi_sing_sgen")))
	    {
	        return false;
	    }
		vars.hypocentersplit = true;
		return true;
	}
	if((current.mapname=="cp_sh_mobile") && (settings["vengeance"]) && (current.mission_currentsequence2==7) && (vars.vengeancesplit!=true) && (current.loads_switchmap!=0))
	{
		if (settings["map_safeguard"] && !(vars.mapHistory.Contains("cp_mi_sing_vengeance")))
	    {
	        return false;
	    }
		vars.vengeancesplit = true;
		return true;
	}
	if((current.mapname=="cp_sh_cairo") && (settings["risefall"]) && (current.mission_currentsequence2==9) && (vars.risefallsplit!=true) && (current.loads_switchmap!=0))
	{
		if (settings["map_safeguard"] && !(vars.mapHistory.Contains("cp_mi_cairo_ramses2")))
	    {
	        return false;
	    }
		vars.risefallsplit = true;
		return true;
	}
	if((current.mapname=="cp_sh_cairo") && (settings["demonwithin"]) && (current.mission_currentsequence2==12) && (vars.demonwithinsplit!=true) && (current.loads_switchmap!=0))
	{
		if (settings["map_safeguard"] && !(vars.mapHistory.Contains("cp_mi_cairo_infection3")))
	    {
	        return false;
	    }
		vars.demonwithinsplit = true;
		return true;
	}
	if((current.mapname=="cp_sh_cairo") && (settings["sandcastle"]) && (current.mission_currentsequence2==13) && (vars.sandcastlesplit!=true) && (current.loads_switchmap!=0))
	{
		if (settings["map_safeguard"] && !(vars.mapHistory.Contains("cp_mi_cairo_aquifer")))
	    {
	        return false;
	    }
		vars.sandcastlesplit = true;
		return true;
	}
	if((current.mapname=="cp_sh_mobile") && (settings["lotus"]) && (current.mission_currentsequence2==16) && (vars.lotustowerssplit!=true) && (current.loads_switchmap!=0))
	{
		if (settings["map_safeguard"] && !(vars.mapHistory.Contains("cp_mi_cairo_lotus3")))
	    {
	        return false;
	    }
		vars.lotustowerssplit = true;
		return true;
	}
	if((current.mapname=="cp_mi_zurich_coalescence") && (old.mission_skipto==134217728) && (current.mission_skipto==0) && (settings["life"]) && (vars.lifesplit!=true) && (current.loads_switchmap!=0))
	{
		if (settings["map_safeguard"] && !(vars.mapHistory.Contains("cp_mi_zurich_coalescence")))
	    {
	        return false;
	    }
		vars.lifesplit = true;
		return true;
	}
	if(current.gamemode=="cpzm")
	{	
		if((current.mapname=="cp_mi_zurich_newworld") && (old.mission_skipto==536870912) && (current.mission_skipto==0) && (settings["newworld"]) && (vars.newworldsplit!=true) && (current.loads_switchmap!=0))
		{
			vars.newworldsplit = true;
			return true;
		}
		if((current.mapname=="cp_mi_sing_blackstation") && (old.mission_skipto==524288) && (current.mission_skipto==0) && (settings["indarkness"]) && (vars.indarknesssplit!=true) && (current.loads_switchmap!=0))
		{
			vars.indarknesssplit = true;
			return true;
		}
		if((current.mapname=="cp_mi_sing_biodomes2") && (old.mission_skipto==64) && (current.mission_skipto==0) && (settings["provocation"]) && (vars.provocationsplit!=true) && (current.loads_switchmap!=0))
		{
			vars.provocationsplit = true;
			return true;
		}
		if((current.mapname=="cp_mi_sing_sgen") && (old.mission_skipto==67108864) && (current.mission_skipto==0) && (settings["hypocenter"]) && (vars.hypocentersplit!=true) && (current.loads_switchmap!=0))
		{
			vars.hypocentersplit = true;
			return true;
		}
		if((current.mapname=="cp_mi_sing_vengeance") && (old.mission_skipto==131072) && (current.mission_skipto==0) && (settings["vengeance"]) && (vars.vengeancesplit!=true) && (current.loads_switchmap!=0))
		{
			vars.vengeancesplit = true;
			return true;
		}
		if((current.mapname=="cp_mi_cairo_ramses2") && (old.mission_skipto==1024) && (current.mission_skipto==0) && (settings["risefall"]) && (vars.risefallsplit!=true) && (current.loads_switchmap!=0))
		{
			vars.risefallsplit = true;
			return true;
		}
		if((current.mapname=="cp_mi_cairo_infection3") && (old.mission_skipto==512) && (current.mission_skipto==0) && (settings["demonwithin"]) && (vars.demonwithinsplit!=true) && (current.loads_switchmap!=0))
		{
			vars.demonwithinsplit = true;
			return true;
		}
		if((current.mapname=="cp_mi_cairo_aquifer") && (old.mission_skipto==1048576) && (current.mission_skipto==0) && (settings["sandcastle"]) && (vars.sandcastlesplit!=true) && (current.loads_switchmap!=0))
		{
			vars.sandcastlesplit = true;
			return true;
		}
		if((current.mapname=="cp_mi_cairo_lotus3") && (old.mission_skipto==64) && (current.mission_skipto==0) && (settings["lotus"]) && (vars.lotustowerssplit!=true) && (current.loads_switchmap!=0))
		{
			vars.lotustowerssplit = true;
			return true;
		}
	}
	if(settings["setting_ilmode"])
	{
		if ((current.mapname=="cp_mi_eth_prologue") || (current.mapname=="cp_mi_zurich_newworld") || (current.mapname=="cp_mi_sing_blackstation") || (current.mapname=="cp_mi_sing_biodomes") || (current.mapname=="cp_mi_sing_biodomes2") || (current.mapname=="cp_mi_sing_vengeance") || (current.mapname=="cp_mi_cairo_ramses") || (current.mapname=="cp_mi_cairo_ramses2") || (current.mapname=="cp_mi_cairo_infection") || (current.mapname=="cp_mi_cairo_infection2") || (current.mapname=="cp_mi_cairo_infection3") || (current.mapname=="cp_mi_cairo_aquifer") || (current.mapname=="cp_mi_cairo_lotus") || (current.mapname=="cp_mi_cairo_lotus2") || (current.mapname=="cp_mi_cairo_lotus3") || (current.mapname=="cp_mi_zurich_coalescence"))
		{
			if(current.mission_skipto!=0 && current.mission_skipto!=8 && current.mission_skipto!=16 && old.mission_skipto<current.mission_skipto && !vars.skiptoHistory.Contains(current.mission_skipto) && settings["setting_ilskiptos"])
			{
				vars.skiptoHistory.Add(current.mission_skipto);
				return true;
			}
		}
	}
	return false;
}

reset
{
	if(settings["setting_ilmode"])
	{
		if(settings["setting_ilskiptor"])
		{
		    if ((current.mapname=="cp_mi_eth_prologue") && (old.mission_skipto==0) && (current.mission_skipto==8) && (current.loads_switchmap != 0))
		    {
		        vars.ilreset = true;
		        return true;
		    }
		    if ((current.mapname=="cp_mi_zurich_newworld") && (old.mission_skipto==0) && (current.mission_skipto==8) && (current.loads_switchmap != 0)) 
		    {
		        vars.ilreset = true;
		        return true;
		    }
		    if ((current.mapname=="cp_mi_sing_blackstation") && (old.mission_skipto==0) && (current.mission_skipto==8) && (current.loads_switchmap != 0)) 
		    {
		        vars.ilreset = true;
		        return true;
		    }
		    if ((current.mapname=="cp_mi_sing_biodomes") && (old.mission_skipto==0) && (current.mission_skipto==8) && (current.loads_switchmap != 0)) 
		    {
		        vars.ilreset = true;
		        return true;
		    }
		    if ((current.mapname=="cp_mi_sing_sgen") && (old.mission_skipto==0) && (current.mission_skipto==8) && (current.loads_switchmap != 0)) 
		    {
		        vars.ilreset = true;
		        return true;
		    }
		    if ((current.mapname=="cp_mi_sing_vengeance") && (old.mission_skipto==0) && (current.mission_skipto==8) && (current.loads_switchmap != 0)) 
		    {
		        vars.ilreset = true;
		        return true;
		    }
		    if ((current.mapname=="cp_mi_cairo_ramses") && (old.mission_skipto==0) && (current.mission_skipto==8) && (current.loads_switchmap != 0)) 
		    {
		        vars.ilreset = true;
		        return true;
		    }
		    if ((current.mapname=="cp_mi_cairo_infection") && (old.mission_skipto==0) && (current.mission_skipto==8) && (current.loads_switchmap != 0)) 
		    {
		        vars.ilreset = true;
		        return true;
		    }
		    if ((current.mapname=="cp_mi_cairo_aquifer") && (old.mission_skipto==0) && (current.mission_skipto==8) && (current.loads_switchmap != 0)) 
		    {
		        vars.ilreset = true;
		        return true;
		    }
		    if ((current.mapname=="cp_mi_cairo_lotus") && (old.mission_skipto==0) && (current.mission_skipto==8) && (current.loads_switchmap != 0)) 
		    {
		        vars.ilreset = true;
		        return true;
		    }
		    if ((current.mapname=="cp_mi_zurich_coalescence") && (old.mission_skipto==0) && (current.mission_skipto==8) && (current.loads_switchmap != 0)) 
		    {
		        vars.ilreset = true;
		        return true;
		    }
		}
	}
	else
	{
		if ((current.mapname=="cp_mi_eth_prologue") && (old.mission_skipto==0) && (current.mission_skipto==8) && (current.loads_switchmap != 0)) return true;
	}
	if((current.cp_statsreset==1) && (current.mapname=="core_frontend")) 
	{
		vars.resettingcampaign = true;
		return true;
	}
}

isLoading
{
	if(settings["load_remover"])
	{
		if (current.loads_switchmap == 0) return true;
		if(settings["setting_fastloads"])
		{
			if(settings["setting_loadoutseq"])
			{
				if ((current.mapname=="cp_mi_eth_prologue") && (current.mission_skipto==0)) return true; //was 16777216
				if ((current.mapname=="cp_mi_zurich_newworld") && (current.mission_skipto==0)) return true; //was 536870912
				if ((current.mapname=="cp_mi_sing_blackstation") && (current.mission_skipto==0)) return true; //was 524288
				if ((current.mapname=="cp_mi_sing_biodomes") && (current.mission_skipto==0)) return true; //was 8192
				if ((current.mapname=="cp_mi_sing_biodomes2") && (current.mission_skipto==0)) return true; //was 64
				if ((current.mapname=="cp_mi_sing_sgen") && (current.mission_skipto==0)) return true; //was 67108864
				if ((current.mapname=="cp_mi_sing_vengeance") && (current.mission_skipto==0)) return true; //was 131072
				if ((current.mapname=="cp_mi_cairo_ramses") && (current.mission_skipto==0)) return true; //was 128
				if ((current.mapname=="cp_mi_cairo_ramses2") && (current.mission_skipto==0)) return true; //was 1024
				if ((current.mapname=="cp_mi_cairo_infection") && (current.mission_skipto==0)) return true; //was 512
				if ((current.mapname=="cp_mi_cairo_infection2") && (current.mission_skipto==0)) return true; //was 131072
				if ((current.mapname=="cp_mi_cairo_infection3") && (current.mission_skipto==0)) return true; //was 512
				if ((current.mapname=="cp_mi_cairo_aquifer") && (current.mission_skipto==0)) return true; //was 1048576
				if ((current.mapname=="cp_mi_cairo_lotus") && (current.mission_skipto==0)) return true; //was 512
				if ((current.mapname=="cp_mi_cairo_lotus2") && (current.mission_skipto==0)) return true; //was 8192
				if ((current.mapname=="cp_mi_cairo_lotus3") && (current.mission_skipto==0)) return true; //was 64
			}
			if ((current.mapname=="cp_sh_mobile") || (current.mapname=="cp_sh_cairo") || (current.mapname=="cp_sh_singapore") || (current.mapname=="cp_mi_eth_prologue") || (current.mapname=="cp_mi_zurich_newworld") || (current.mapname=="cp_mi_sing_blackstation") || (current.mapname=="cp_mi_sing_biodomes") || (current.mapname=="cp_mi_sing_biodomes2") || (current.mapname=="cp_mi_sing_sgen") || (current.mapname=="cp_mi_sing_vengeance") || (current.mapname=="cp_mi_cairo_ramses") || (current.mapname=="cp_mi_cairo_ramses2") || (current.mapname=="cp_mi_cairo_infection") || (current.mapname=="cp_mi_cairo_infection2") || (current.mapname=="cp_mi_cairo_infection3") || (current.mapname=="cp_mi_cairo_aquifer") || (current.mapname=="cp_mi_cairo_lotus") || (current.mapname=="cp_mi_cairo_lotus2") || (current.mapname=="cp_mi_cairo_lotus3") || (current.mapname=="cp_mi_zurich_coalescence"))
			{
				if(current.loads_fastload!=-1)
				{
					if(current.gamemode=="cpzm") //nightmares
					{
						if((current.mapname=="cp_mi_eth_prologue") && (current.mission_skipto==8) && (current.mission_currentsequence1==1073741832 || current.mission_currentsequence1==1073750024))
						{
							return false;
						}
						if((current.mapname=="cp_mi_zurich_newworld") && (current.mission_skipto==8) && (current.mission_currentsequence2==2176 || current.mission_currentsequence2==1048704))
						{
							return false;
						}
						if((current.mapname=="cp_mi_sing_blackstation") && (current.mission_skipto==8) && (current.mission_currentsequence2==128 || current.mission_currentsequence1==130))
						{
							return false;
						}
						if((current.mapname=="cp_mi_sing_biodomes") && (current.mission_skipto==8) && (current.mission_currentsequence2==256 || current.mission_currentsequence1==4112 || current.mission_currentsequence1==-2147481584 || current.mission_currentsequence1==-2147479536))
						{
							return false;
						}
						if((current.mapname=="cp_mi_sing_sgen") && (current.mission_skipto==8) && (current.mission_currentsequence2==-2147450880 || current.mission_currentsequence1==65552))
						{
							return false;
						}
						if((current.mapname=="cp_mi_sing_vengeance") && (current.mission_skipto==8) && (current.mission_currentsequence1==1073743896 || current.mission_currentsequence1==34840))
						{
							return false;
						}
						if((current.mapname=="cp_mi_cairo_ramses") && (current.mission_skipto==8) && (current.mission_currentsequence2==12293 || current.mission_currentsequence1==386))
						{
							return false;
						}
						if((current.mapname=="cp_mi_cairo_infection") && (current.mission_skipto==8) && (current.mission_currentsequence2==537395200 || current.mission_currentsequence1==33152))
						{
							return false;
						}
						if((current.mapname=="cp_mi_cairo_aquifer") && (current.mission_skipto==8) && (current.mission_currentsequence2==16809984))
						{
							return false;
						}
						if((current.mapname=="cp_mi_cairo_lotus") && (current.mission_skipto==8) && (current.mission_currentsequence1==1073741840 || current.mission_currentsequence1==1040))
						{
							return false;
						}
						if((current.mapname=="cp_mi_zurich_coalescence") && (current.mission_skipto==8 || current.mission_skipto==16) && (current.mission_currentsequence1==4195328 || current.mission_currentsequence1==4457472))
						{
							return false;
						}
						if((current.mapname=="cp_mi_cairo_lotus2") && (current.mission_skipto==16 || current.mission_skipto==32) && (current.mission_currentsequence1==536870930)) //before the mobile shop ride (sacrifices a bit of load)
						{
							return false;
						}
						if((current.mapname=="cp_mi_cairo_lotus2") && (current.mission_skipto==512) && (current.mission_currentsequence1==536870970)) //taylor cutscene
						{
							return false;
						}
						if((current.mapname=="cp_mi_cairo_lotus2") && (current.mission_skipto==512 || current.mission_skipto==1024) && (current.mission_currentsequence2==64)) //post taylor cutscene
						{
							return false;
						}
						if((current.mapname=="cp_mi_cairo_ramses") && (current.mission_skipto==64) && (current.mission_currentsequence1==362)) //RAPs cutscene
						{
							return false;
						}
						if((current.mapname=="cp_mi_eth_prologue") && (current.mission_skipto==8) && (current.mission_currentsequence2==2048)) //initial cutscene
						{
							return false;
						}
						if((current.mapname=="cp_mi_cairo_ramses2") && (current.mission_skipto==32 || current.mission_skipto==256) && (current.mission_currentsequence1==11680 || current.mission_currentsequence1==2689  || current.mission_currentsequence1==10880 || current.mission_currentsequence1==10881)) //dedonating spikes
						{
							return false;
						}
						if((current.mapname=="cp_mi_cairo_ramses2") && (current.mission_skipto==512) && (current.mission_currentsequence1==3459)) //final alley objective
						{
							return false;
						}
						if((current.mapname=="cp_mi_cairo_ramses2") && (current.mission_skipto==512) && (current.mission_currentsequence2==2048)) //final alley objective
						{
							return false;
						}
						if((current.mapname=="cp_mi_cairo_ramses2") && (current.mission_skipto==512) && (current.mission_currentsequence2!=0)) //final alley objective
						{
							return false;
						}
						if((current.mapname=="cp_mi_cairo_ramses2") && (current.mission_skipto==512) && (current.mission_currentsequence1==11137)) //plaza battle cutscene
						{
							return false;
						}
						if((current.mapname=="cp_mi_cairo_ramses2") && (current.mission_skipto==1024)) //entire fucking plaza skipto. idk it just breaks here
						{
							return false;
						}
						if((current.mapname=="cp_mi_sing_blackstation") && (current.mission_skipto==128)) //anchor part in darkness
						{
							return false;
						}
						if((current.mapname=="cp_mi_sing_blackstation") && (current.mission_skipto==1024)) //slow motion battle in darkness
						{
							return false;
						}
					}
					else //campaign
					{
						if((current.mapname=="cp_mi_eth_prologue") && (current.mission_skipto==8) && (current.mission_currentsequence2==128 || current.mission_currentsequence2==1152))
						{
							return false;
						}
						if((current.mapname=="cp_mi_zurich_newworld") && (current.mission_skipto==8) && (current.mission_currentsequence2==1152 || current.mission_currentsequence2==524416))
						{
							return false;
						}
						if((current.mapname=="cp_mi_sing_blackstation") && (current.mission_skipto==8) && (current.mission_currentsequence2==64 || current.mission_currentsequence1==64))
						{
							return false;
						}
						if((current.mapname=="cp_mi_sing_biodomes") && (current.mission_skipto==8) && (current.mission_currentsequence2==128 || current.mission_currentsequence1==2048 || current.mission_currentsequence1==1073742848 || current.mission_currentsequence1==1073743872))
						{
							return false;
						}
						if((current.mapname=="cp_mi_sing_sgen") && (current.mission_skipto==8) && (current.mission_currentsequence2==1073758208 || current.mission_currentsequence1==32768))
						{
							return false;
						}
						if((current.mapname=="cp_mi_sing_vengeance") && (current.mission_skipto==8) && (current.mission_currentsequence1==536871944 || current.mission_currentsequence1==17416))
						{
							return false;
						}
						if((current.mapname=="cp_mi_cairo_ramses") && (current.mission_skipto==8) && (current.mission_currentsequence2==6146 || current.mission_currentsequence1==-2147483456))
						{
							return false;
						}
						if((current.mapname=="cp_mi_cairo_infection") && (current.mission_skipto==8) && (current.mission_currentsequence2==268697600 || current.mission_currentsequence1==16512))
						{
							return false;
						}
						if((current.mapname=="cp_mi_cairo_aquifer") && (current.mission_skipto==8) && (current.mission_currentsequence1==-2147221504)) //initial cutscene
						{
							return false;
						}
						if((current.mapname=="cp_mi_cairo_lotus") && (current.mission_skipto==8) && (current.mission_currentsequence1==536870912 || current.mission_currentsequence1==512))
						{
							return false;
						}
						if((current.mapname=="cp_mi_zurich_coalescence") && (current.mission_skipto==8 || current.mission_skipto==16) && (current.mission_currentsequence1==2097152 || current.mission_currentsequence1==2228224))
						{
							return false;
						}
						if((current.mapname=="cp_mi_cairo_lotus2") && (current.mission_skipto==16 || current.mission_skipto==32) && (current.mission_currentsequence1==268435464)) //before the mobile shop ride (sacrifices a bit of load)
						{
							return false;
						}
						if((current.mapname=="cp_mi_cairo_lotus2") && (current.mission_skipto==512) && (current.mission_currentsequence1==268435484)) //taylor cutscene
						{
							return false;
						}
						if((current.mapname=="cp_mi_cairo_lotus2") && (current.mission_skipto==512 || current.mission_skipto==1024) && (current.mission_currentsequence2==32)) //post taylor cutscene
						{
							return false;
						}
						if((current.mapname=="cp_mi_cairo_ramses") && (current.mission_skipto==64) && (current.mission_currentsequence1==-2147483468)) //RAPs cutscene
						{
							return false;
						}
						if((current.mapname=="cp_mi_eth_prologue") && (current.mission_skipto==8) && (current.mission_currentsequence2==1024)) //initial cutscene
						{
							return false;
						}
						if((current.mapname=="cp_mi_cairo_ramses2") && (current.mission_skipto==512) && (current.mission_currentsequence1==-2147481981)) //final alley objective
						{
							return false;
						}
						if((current.mapname=="cp_mi_cairo_ramses2") && (current.mission_skipto==512) && (current.mission_currentsequence2==4194304)) //final alley objective
						{
							return false;
						}
						if((current.mapname=="cp_mi_cairo_ramses2") && (current.mission_skipto==32 || current.mission_skipto==256) && (current.mission_currentsequence1==5792 || current.mission_currentsequence1==5120  || current.mission_currentsequence1==5376 || current.mission_currentsequence1==5377)) //dedonating spikes
						{
							return false;
						}
						if((current.mapname=="cp_mi_cairo_ramses2") && (current.mission_skipto==512) && (current.mission_currentsequence2!=0)) //final alley objective
						{
							return false;
						}
						if((current.mapname=="cp_mi_cairo_ramses2") && (current.mission_skipto==512) && (current.mission_currentsequence1==-2147478143)) //plaza battle cutscene
						{
							return false;
						}
						if((current.mapname=="cp_mi_cairo_ramses2") && (current.mission_skipto==1024)) //entire fucking plaza skipto. idk it just breaks here
						{
							return false;
						}
						if((current.mapname=="cp_mi_sing_blackstation") && (current.mission_skipto==128)) //anchor part in darkness
						{
							return false;
						}
						if((current.mapname=="cp_mi_sing_blackstation") && (current.mission_skipto==1024)) //slow motion battle in darkness
						{
							return false;
						}
					}
					return true;
				}
			}
			if ((current.mapname=="cp_mi_zurich_newworld") && (current.mission_skipto==8) && (current.loads_whiteigc!=0)) return true;
			if ((current.mapname=="cp_mi_zurich_newworld") && (current.mission_skipto==16) && (current.loads_whiteigc!=0)) return true;
			if ((current.mapname=="cp_mi_zurich_newworld") && (current.mission_skipto==2048) && (current.loads_whiteigc!=0)) return true;
			if ((current.mapname=="cp_mi_zurich_newworld") && (current.mission_skipto==262144) && (current.loads_whiteigc!=0)) return true;
			if ((current.mapname=="cp_mi_zurich_newworld") && (current.mission_skipto==33554432) && (current.loads_whiteigc!=0)) return true;
			if ((current.mapname=="cp_mi_zurich_newworld") && (current.mission_skipto==536870912) && (current.loads_whiteigc!=0)) return true;
		}
	}
	return false;
}
