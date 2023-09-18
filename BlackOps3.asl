state("blackops3")
{
	int loads_switchmap : 0x348F7DC;
	int whiteload_newworld : 0x4D4B910;
	int fastloads_mission : 0x4D28860; //breaks when death warps are retriggered. skill issue tho.
	int fastloads_common : 0x3534808; //this would be the perfect fastloads code if it didn't stop the timer during the mission briefing and random cutscenes (seems to be 3rd person cutscenes). Another issue: doesn't stop timer when a death warp is re-triggered. Not huge since it's due to a skill issue but atleast it doesn't break entirely like the original code.
	string70 mapname : 0x940C5E8;
	string70 gamemode : 0x1770D5DC;
	int safehousedeploymission : 0xA55BDF4;
	int campaignreset_timer : 0x53DC2A0;
	int mission_skipto : 0xA55BEF0;
	int missioncomplete : 0x19E85FDC;	//mission complete dialog in the safehouses. doesn't include Black Ops and Life, using mission loadout sequence insead.
	int mission_currentsequence1 : 0xA55BDF0;	//current mission sequence, used to patch fast loads issues
	int mission_currentsequence2 : 0xA55BDF4;	//current mission sequence, used to patch fast loads issues
	int fastloads_patcher1 : 0xF973CA4;	//checks if gameplay is active, and if so the fast loads are never accounted for. Doesn't account for cutscenes
	int missionreset_data : 0x10C3AE10;
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
	settings.Add("setting_safeguard", false, "Mission Dialog Safeguard"); //curently a little buggy so this is disabled by default as of right now
	settings.Add("setting_ilmode", false, "IL Mode");
	settings.Add("setting_ilskiptor", false, "Reset By Skipto", "setting_ilmode");
	settings.Add("setting_ilskiptos", false, "Split By Skipto", "setting_ilmode");
	settings.Add("load_remover", true, "Load Remover");
	settings.Add("setting_fastloads", true, "Remove Fast-Loads", "load_remover");
	settings.Add("og_fastloads", false, "OG Fast-Loads", "setting_fastloads");
	settings.Add("setting_loadoutseq", true, "Remove Mission Load-out Sequence", "load_remover");
	settings.Add("aslmissions", true, "Auto-Split Missions");
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

start
{
	if ((settings["setting_ilmode"]) && (old.fastloads_mission!=18) && (current.fastloads_mission==18) && (current.mapname != "cp_sh_mobile") && (current.mapname != "cp_sh_singapore") && (current.mapname != "cp_sh_cairo") && (current.mapname != "core_frontend") && (current.mapname != "cp_mi_sing_biodomes2") && (current.mapname != "cp_mi_cairo_ramses2") && (current.mapname != "cp_mi_cairo_infection2") && (current.mapname != "cp_mi_cairo_infection3") && (current.mapname != "cp_mi_cairo_lotus2") && (current.mapname != "cp_mi_cairo_lotus3") && (current.loads_switchmap != 0)) return true;
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
}

split
{
	if((current.mapname=="cp_mi_eth_prologue") && (old.mission_skipto==16777216) && (current.mission_skipto==0) && (settings["blackops"]) && (vars.blackopssplit!=true) && (current.loads_switchmap!=0))
	{
		vars.blackopssplit = true;
		return true;
	}
	if((current.mapname=="cp_sh_singapore") && (settings["newworld"]) && (current.safehousedeploymission==2) && (vars.newworldsplit!=true) && (current.loads_switchmap!=0))
	{
		vars.newworldsplit = true;
		return true;	
	}
	if((current.mapname=="cp_sh_singapore") && (settings["indarkness"]) && (current.safehousedeploymission==3) && (vars.indarknesssplit!=true) && (current.loads_switchmap!=0))
	{
		vars.indarknesssplit = true;
		return true;	
	}
	if((current.mapname=="cp_sh_singapore") && (settings["provocation"]) && (current.safehousedeploymission==5) && (vars.provocationsplit!=true) && (current.loads_switchmap!=0))
	{
		vars.provocationsplit = true;
		return true;
	}
	if((current.mapname=="cp_sh_mobile") && (settings["hypocenter"]) && (current.safehousedeploymission==6) && (vars.hypocentersplit!=true) && (current.loads_switchmap!=0))
	{
		vars.hypocentersplit = true;
		return true;
	}
	if((current.mapname=="cp_sh_mobile") && (settings["vengeance"]) && (current.safehousedeploymission==7) && (vars.vengeancesplit!=true) && (current.loads_switchmap!=0))
	{
		vars.vengeancesplit = true;
		return true;
	}
	if((current.mapname=="cp_sh_cairo") && (settings["risefall"]) && (current.safehousedeploymission==9) && (vars.risefallsplit!=true) && (current.loads_switchmap!=0))
	{
		vars.risefallsplit = true;
		return true;
	}
	if((current.mapname=="cp_sh_cairo") && (settings["demonwithin"]) && (current.safehousedeploymission==12) && (vars.demonwithinsplit!=true) && (current.loads_switchmap!=0))
	{
		vars.demonwithinsplit = true;
		return true;
	}
	if((current.mapname=="cp_sh_cairo") && (settings["sandcastle"]) && (current.safehousedeploymission==13) && (vars.sandcastlesplit!=true) && (current.loads_switchmap!=0))
	{
		vars.sandcastlesplit = true;
		return true;
	}
	if((current.mapname=="cp_sh_mobile") && (settings["lotus"]) && (current.safehousedeploymission==16) && (vars.lotustowerssplit!=true) && (current.loads_switchmap!=0))
	{
		vars.lotustowerssplit = true;
		return true;
	}
	if((current.mapname=="cp_mi_zurich_coalescence") && (old.mission_skipto==134217728) && (current.mission_skipto==0) && (settings["life"]) && (vars.lifesplit!=true) && (current.loads_switchmap!=0))
	{
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
			if(current.mission_skipto!=0 && current.mission_skipto!=8 && current.mission_skipto!=16 && old.mission_skipto<current.mission_skipto && settings["setting_ilskiptos"])
			{
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
			if ((current.mapname=="cp_mi_eth_prologue") && (old.mission_skipto==0) && (current.mission_skipto==8) && (current.loads_switchmap != 0)) return true;
			if ((current.mapname=="cp_mi_zurich_newworld") && (old.mission_skipto==0) && (current.mission_skipto==8) && (current.loads_switchmap != 0)) return true;
			if ((current.mapname=="cp_mi_sing_biodomes") && (old.mission_skipto==0) && (current.mission_skipto==8) && (current.loads_switchmap != 0)) return true;
			if ((current.mapname=="cp_mi_sing_sgen") && (old.mission_skipto==0) && (current.mission_skipto==8) && (current.loads_switchmap != 0)) return true;
			if ((current.mapname=="cp_mi_sing_vengeance") && (old.mission_skipto==0) && (current.mission_skipto==8) && (current.loads_switchmap != 0)) return true;
			if ((current.mapname=="cp_mi_cairo_ramses") && (old.mission_skipto==0) && (current.mission_skipto==8) && (current.loads_switchmap != 0)) return true;
			if ((current.mapname=="cp_mi_cairo_infection") && (old.mission_skipto==0) && (current.mission_skipto==8) && (current.loads_switchmap != 0)) return true;
			if ((current.mapname=="cp_mi_cairo_aquifer") && (old.mission_skipto==0) && (current.mission_skipto==8) && (current.loads_switchmap != 0)) return true;
			if ((current.mapname=="cp_mi_cairo_lotus") && (old.mission_skipto==0) && (current.mission_skipto==8) && (current.loads_switchmap != 0)) return true;
			if ((current.mapname=="cp_mi_zurich_coalescence") && (old.mission_skipto==0) && (current.mission_skipto==8) && (current.loads_switchmap != 0)) return true;
		}
		else
		{
			if ((current.mapname=="cp_mi_eth_prologue") && (current.missionreset_data!=old.missionreset_data) && (current.loads_switchmap != 0)) return true;
			if ((current.mapname=="cp_mi_zurich_newworld") && (current.missionreset_data!=old.missionreset_data) && (current.loads_switchmap != 0)) return true;
			if ((current.mapname=="cp_mi_sing_biodomes") && (current.missionreset_data!=old.missionreset_data) && (current.loads_switchmap != 0)) return true;
			if ((current.mapname=="cp_mi_sing_sgen") && (current.missionreset_data!=old.missionreset_data) && (current.loads_switchmap != 0)) return true;
			if ((current.mapname=="cp_mi_sing_vengeance") && (current.missionreset_data!=old.missionreset_data) && (current.loads_switchmap != 0)) return true;
			if ((current.mapname=="cp_mi_cairo_ramses") && (current.missionreset_data!=old.missionreset_data) && (current.loads_switchmap != 0)) return true;
			if ((current.mapname=="cp_mi_cairo_infection") && (current.missionreset_data!=old.missionreset_data) && (current.loads_switchmap != 0)) return true;
			if ((current.mapname=="cp_mi_cairo_aquifer") && (current.missionreset_data!=old.missionreset_data) && (current.loads_switchmap != 0)) return true;
			if ((current.mapname=="cp_mi_cairo_lotus") && (old.missionreset_data!=current.missionreset_data) && (current.loads_switchmap != 0)) return true;
			if ((current.mapname=="cp_mi_zurich_coalescence") && (current.missionreset_data!=old.missionreset_data) && (current.loads_switchmap != 0)) return true;
		}
	}
	else
	{
		if ((current.mapname=="cp_mi_eth_prologue") && (old.mission_skipto==0) && (current.mission_skipto==8) && (current.loads_switchmap != 0)) return true;
	}
	if((current.campaignreset_timer==1) && (current.mapname=="core_frontend")) 
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
			if(settings["og_fastloads"])
			{
				if ((current.gamemode!="cpzm") && (current.mapname!="core_frontend") && (current.mapname!="cp_sh_singapore") && (current.mapname!="cp_sh_cairo") && (current.mapname!="cp_sh_mobile") && (current.fastloads_mission==4)) return true;
				if ((current.mapname=="cp_mi_eth_prologue") && (current.fastloads_common!=-1) && (current.mission_skipto==128)) return true;
				if ((current.mapname=="cp_mi_eth_prologue") && (current.fastloads_common!=-1) && (current.mission_skipto==16384)) return true;
				if ((current.mapname=="cp_mi_zurich_newworld") && (current.fastloads_common!=-1) && (current.mission_skipto==1048576)) return true;
				if ((current.mapname=="cp_mi_zurich_newworld") && (current.fastloads_common!=-1) && (current.mission_skipto==2097152)) return true;
				if ((current.mapname=="cp_mi_zurich_newworld") && (current.fastloads_common!=-1) && (current.mission_skipto==268435456)) return true;
				if ((current.mapname=="cp_mi_sing_blackstation") && (current.fastloads_common!=-1) && (current.mission_skipto==512)) return true;
				if ((current.mapname=="cp_mi_sing_blackstation") && (current.fastloads_common!=-1) && (current.mission_skipto==131072)) return true;
				if ((current.mapname=="cp_mi_sing_biodomes") && (current.fastloads_common!=-1) && (current.mission_skipto==128)) return true;
				if ((current.mapname=="cp_mi_sing_biodomes") && (current.fastloads_common!=-1) && (current.mission_skipto==512)) return true;
				if ((current.mapname=="cp_mi_sing_sgen") && (current.fastloads_common!=-1) && (current.mission_skipto==32)) return true;
				if ((current.mapname=="cp_mi_sing_sgen") && (current.fastloads_common!=-1) && (current.mission_skipto==128)) return true;
				if ((current.mapname=="cp_mi_sing_sgen") && (current.fastloads_common!=-1) && (current.mission_skipto==256)) return true;
				if ((current.mapname=="cp_mi_sing_sgen") && (current.fastloads_common!=-1) && (current.mission_skipto==2048)) return true;
				if ((current.mapname=="cp_mi_cairo_ramses2") && (current.fastloads_common!=-1) && (current.mission_skipto==512)) return true;
				if ((current.mapname=="cp_mi_cairo_lotus") && (current.fastloads_common!=-1) && (current.mission_skipto==128)) return true;
				if ((current.mapname=="cp_mi_cairo_lotus") && (current.fastloads_common!=-1) && (current.mission_skipto==512)) return true;
				if ((current.mapname=="cp_mi_cairo_lotus2") && (current.fastloads_common!=-1) && (current.mission_skipto==32)) return true;
				if ((current.mapname=="cp_mi_cairo_lotus2") && (current.fastloads_common!=-1) && (current.mission_skipto==128)) return true;
				if ((current.mapname=="cp_mi_cairo_lotus2") && (current.fastloads_common!=-1) && (current.mission_skipto==256)) return true;
				if ((current.mapname=="cp_mi_cairo_lotus2") && (current.fastloads_common!=-1) && (current.mission_skipto==4096)) return true;
				if ((current.mapname=="cp_sh_singapore") && (current.fastloads_common!=-1)) return true;
				if ((current.mapname=="cp_sh_cairo") && (current.fastloads_common!=-1)) return true;
				if ((current.mapname=="cp_sh_mobile") && (current.fastloads_common!=-1)) return true;
			}
			else
			{
				if ((current.mapname=="cp_sh_mobile") || (current.mapname=="cp_sh_cairo") || (current.mapname=="cp_sh_singapore") || (current.mapname=="cp_mi_eth_prologue") || (current.mapname=="cp_mi_zurich_newworld") || (current.mapname=="cp_mi_sing_blackstation") || (current.mapname=="cp_mi_sing_biodomes") || (current.mapname=="cp_mi_sing_biodomes2") || (current.mapname=="cp_mi_sing_sgen") || (current.mapname=="cp_mi_sing_vengeance") || (current.mapname=="cp_mi_cairo_ramses") || (current.mapname=="cp_mi_cairo_ramses2") || (current.mapname=="cp_mi_cairo_infection") || (current.mapname=="cp_mi_cairo_infection2") || (current.mapname=="cp_mi_cairo_infection3") || (current.mapname=="cp_mi_cairo_aquifer") || (current.mapname=="cp_mi_cairo_lotus") || (current.mapname=="cp_mi_cairo_lotus2") || (current.mapname=="cp_mi_cairo_lotus3") || (current.mapname=="cp_mi_zurich_coalescence"))
				{
					if(current.fastloads_common!=-1)
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
							if((current.mapname=="cp_mi_cairo_lotus2") && (current.mission_skipto==512) && (current.mission_currentsequence1==536870970)) //taylor cutscene
							{
								return false;
							}
							if((current.mapname=="cp_mi_eth_prologue") && (current.mission_skipto==8) && (current.mission_currentsequence2==2048)) //initial cutscene
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
							if((current.mapname=="cp_mi_cairo_aquifer") && (current.mission_skipto==8) && (current.mission_currentsequence1==-2147221504))
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
							if((current.mapname=="cp_mi_cairo_lotus2") && (current.mission_skipto==512) && (current.mission_currentsequence1==268435484)) //taylor cutscene
							{
								return false;
							}
							if((current.mapname=="cp_mi_eth_prologue") && (current.mission_skipto==8) && (current.mission_currentsequence2==1024)) //initial cutscene
							{
								return false;
							}
						}
						if(current.fastloads_patcher1==1 && !(current.mapname=="cp_mi_cairo_aquifer" && (current.mission_skipto==8)))
						{
							//note: sand castle skipto #1 is to be excluded because the gameplay is considered active on this memory code since the jet is being controlled in the background while the load is occuring
							return false;
						}
						return true;
					}
				}
			}
			if ((current.mapname=="cp_mi_zurich_newworld") && (current.mission_skipto==8) && (current.whiteload_newworld!=0)) return true;
			if ((current.mapname=="cp_mi_zurich_newworld") && (current.mission_skipto==16) && (current.whiteload_newworld!=0)) return true;
			if ((current.mapname=="cp_mi_zurich_newworld") && (current.mission_skipto==2048) && (current.whiteload_newworld!=0)) return true;
			if ((current.mapname=="cp_mi_zurich_newworld") && (current.mission_skipto==262144) && (current.whiteload_newworld!=0)) return true;
			if ((current.mapname=="cp_mi_zurich_newworld") && (current.mission_skipto==33554432) && (current.whiteload_newworld!=0)) return true;
			if ((current.mapname=="cp_mi_zurich_newworld") && (current.mission_skipto==536870912) && (current.whiteload_newworld!=0)) return true;
		}
	}
	return false;
}
