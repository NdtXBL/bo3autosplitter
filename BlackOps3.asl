state("blackops3")
{
	int maploads : 0x348F7DC;
	int whiteload_newworld1 : 0x17E7902C;
	int whiteload_newworld2 : 0x4D4B910;
	int fastloads_loadoutsequence : 0xA6296A0;
	int fastloads_safehouse : 0x3534808;
	int fastloads_nightmares : 0xA54AC40;
	int fastloads_mission : 0x4D28860;
	string70 levelStringName : 0x940C5E8;
	string70 levelGametype : 0x1770D5DC;
	int livesplit_start : 0x353CA60;
	int currentsafehouse_mission : 0xA55BDF4;
	int campaignreset_timer : 0x53DC2A0;
	int mission_skipto : 0xA55BEF0;
	int missionsplitter_1 : 0x180E109C;
	int missionsplitter_2 : 0xA55BEF4;
	int missionsplitter_3 : 0x1683FD50;
	int missionsplitter_4 : 0x544776C;
	int missionsplitter_5 : 0x10A80AE8;
	int missionsplitter_6 : 0x10A81944;
	int missionsplitter_7 : 0x10A9E428;
	int missionsplitter_8 : 0xF514D70;            // IGNORE, USING SKIPTO INSTEAD
	int missionsplitter_9 : 0x4713B30;
	int missionsplitter_10 : 0x180EA22C;	    // IGNORE, USING SKIPTO INSTEAD
	int missionsplitter_11 : 0x3534808;
	int missionreset_data : 0x10C3AE10;
}

startup
{
	vars.mission1split = false;
	vars.mission2split = false;
	vars.mission3split = false;
	vars.mission4split = false;
	vars.mission5split = false;
	vars.mission6split = false;
	vars.mission7split = false;
	vars.mission8split = false;
	vars.mission9split = false;
	vars.mission10split = false;
	vars.mission11split = false;
	settings.Add("start_insafehouse", true, "Start Timer in Safehouse (For NG UI Stack)");
	settings.Add("load_remover", true, "Load Remover");
	settings.Add("old_missionsplit", false, "Auto-Split By Map (Not Recommended)");
	settings.Add("setting_ilmode", false, "IL Mode");
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
	if ((((((((((((((settings["setting_ilmode"]) && (old.fastloads_mission!=18) && (current.fastloads_mission==18) && (current.levelStringName != "cp_sh_mobile") && (current.levelStringName != "cp_sh_singapore") && (current.levelStringName != "cp_sh_cairo") && (current.levelStringName != "core_frontend") && (current.levelStringName != "cp_mi_sing_biodomes2") && (current.levelStringName != "cp_mi_cairo_ramses2") && (current.levelStringName != "cp_mi_cairo_infection2") && (current.levelStringName != "cp_mi_cairo_infection3") && (current.levelStringName != "cp_mi_cairo_lotus2") && (current.levelStringName != "cp_mi_cairo_lotus3") && (current.maploads != 0)))))))))))))) return true;
	if ((((old.fastloads_mission!=18) && (current.fastloads_mission==18) && (current.levelStringName == "cp_mi_eth_prologue") && (current.maploads != 0)))) return true;
	if (((((old.fastloads_safehouse!=-1) && (current.fastloads_safehouse==-1) && (current.levelStringName == "cp_sh_mobile") && (current.maploads != 0) && (settings["start_insafehouse"]))))) return true;
	if (((((old.fastloads_safehouse!=-1) && (current.fastloads_safehouse==-1) && (current.levelStringName == "cp_sh_singapore") && (current.maploads != 0) && (settings["start_insafehouse"]))))) return true;
	if (((((old.fastloads_safehouse!=-1) && (current.fastloads_safehouse==-1) && (current.levelStringName == "cp_sh_cairo") && (current.maploads != 0) && (settings["start_insafehouse"]))))) return true;
	return false;
}

onReset
{
	vars.mission1split = false;
	vars.mission2split = false;
	vars.mission3split = false;
	vars.mission4split = false;
	vars.mission5split = false;
	vars.mission6split = false;
	vars.mission7split = false;
	vars.mission8split = false;
	vars.mission9split = false;
	vars.mission10split = false;
	vars.mission11split = false;
}

split
{
	if(settings["old_missionsplit"])
	{
		if(((current.levelStringName=="cp_mi_zurich_newworld") && (settings["blackops"]) && (vars.mission1split!=true)))
		{
			vars.mission1split = true;
			return true;
		}
		if(((((current.levelStringName=="cp_sh_singapore") && (current.maploads == 0) && (settings["newworld"]) && (vars.mission2split!=true) && (current.currentsafehouse_mission==2)))))
		{
			vars.mission2split = true;
			return true;
		}
		if(((((current.levelStringName=="cp_sh_singapore") && (current.maploads == 0) && (settings["indarkness"]) && (vars.mission3split!=true) && (current.currentsafehouse_mission==3)))))
		{
			vars.mission3split = true;
			return true;
		}
		if(((((current.levelStringName=="cp_sh_singapore") && (current.maploads == 0) && (settings["provocation"]) && (vars.mission4split!=true) && (current.currentsafehouse_mission==5)))))
		{
			vars.mission4split = true;
			return true;
		}
		if(((((current.levelStringName=="cp_sh_mobile") && (current.maploads == 0) && (settings["hypocenter"]) && (vars.mission5split!=true) && (current.currentsafehouse_mission==6)))))
		{
			vars.mission5split = true;
			return true;
		}
		if(((((current.levelStringName=="cp_sh_cairo") && (current.maploads == 0) && (settings["vengeance"]) && (vars.mission6split!=true) && (current.currentsafehouse_mission==7)))))
		{
			vars.mission6split = true;
			return true;
		}
		if(((((current.levelStringName=="cp_sh_cairo") && (current.maploads == 0) && (settings["risefall"]) && (vars.mission7split!=true) && (current.currentsafehouse_mission==9)))))
		{
			vars.mission7split = true;
			return true;
		}
		if(((((current.levelStringName=="cp_sh_cairo") && (current.maploads == 0) && (settings["demonwithin"]) && (vars.mission8split!=true) && (current.currentsafehouse_mission==12)))))
		{
			vars.mission8split = true;
			return true;
		}
		if(((((current.levelStringName=="cp_sh_cairo") && (current.maploads == 0) && (settings["sandcastle"]) && (vars.mission9split!=true) && (current.currentsafehouse_mission==13)))))
		{
			vars.mission9split = true;
			return true;
		}
		if(((((current.levelStringName=="cp_sh_mobile") && (current.maploads == 0) && (settings["lotus"]) && (vars.mission10split!=true) && (current.currentsafehouse_mission==16)))))
		{
			vars.mission10split = true;
			return true;
		}
		if((((current.levelStringName=="cp_mi_zurich_coalescence") && (current.missionsplitter_11!=0) && (settings["life"]) && (vars.mission11split!=true))))
		{
			vars.mission11split = true;
			return true;
		}
		return false;
	}
	else
	{
		if(((((current.levelStringName=="cp_mi_eth_prologue") && (current.missionsplitter_1!=0) && (current.mission_skipto==8388608) && (settings["blackops"]) && (vars.mission1split!=true)))))
		{
			vars.mission1split = true;
			return true;
		}
		if(((((current.levelStringName=="cp_mi_zurich_newworld") && (current.missionsplitter_2!=0) && (current.mission_skipto==268435456) && (settings["newworld"]) && (vars.mission2split!=true)))))
		{
			vars.mission2split = true;
			return true;
		}
		if(((((current.levelStringName=="cp_mi_sing_blackstation") && (current.missionsplitter_3!=0) && (current.mission_skipto==262144) && (settings["indarkness"]) && (vars.mission3split!=true)))))
		{
			vars.mission3split = true;
			return true;
		}
		if(((((current.levelStringName=="cp_mi_sing_biodomes2") && (current.missionsplitter_4!=0) && (current.mission_skipto==64) && (settings["provocation"]) && (vars.mission4split!=true)))))
		{
			vars.mission4split = true;
			return true;
		}
		if(((((current.levelStringName=="cp_mi_sing_sgen") && (current.missionsplitter_5!=0) && (current.mission_skipto==67108864) && (settings["hypocenter"]) && (vars.mission5split!=true)))))
		{
			vars.mission5split = true;
			return true;
		}
		if(((((current.levelStringName=="cp_mi_sing_vengeance") && (current.missionsplitter_6!=0) && (current.mission_skipto==131072) && (settings["vengeance"]) && (vars.mission6split!=true)))))
		{
			vars.mission6split = true;
			return true;
		}
		if(((((current.levelStringName=="cp_mi_cairo_ramses2") && (current.missionsplitter_7!=0) && (current.mission_skipto==1024) && (settings["risefall"]) && (vars.mission7split!=true)))))
		{
			vars.mission7split = true;
			return true;
		}
		if((((current.levelStringName=="cp_mi_cairo_infection3") && (current.mission_skipto==512) && (settings["demonwithin"]) && (vars.mission8split!=true))))
		{
			vars.mission8split = true;
			return true;
		}
		if(((((current.levelStringName=="cp_mi_cairo_aquifer") && (current.missionsplitter_9!=0) && (current.mission_skipto==1048576) && (settings["sandcastle"]) && (vars.mission9split!=true)))))
		{
			vars.mission9split = true;
			return true;
		}
		if((((current.levelStringName=="cp_mi_cairo_lotus3") && (current.mission_skipto==64) && (settings["lotus"]) && (vars.mission10split!=true))))
		{
			vars.mission10split = true;
			return true;
		}
		if(((((current.levelStringName=="cp_mi_zurich_coalescence") && (current.mission_skipto==134217728) && (current.missionsplitter_11!=-1) && (settings["life"]) && (vars.mission11split!=true)))))
		{
			vars.mission11split = true;
			return true;
		}
		return false;
	}
}

reset
{
	if ((((settings["setting_ilmode"]) && (current.levelStringName=="cp_mi_eth_prologue") && (current.missionreset_data!=old.missionreset_data) && (current.maploads != 0)))) return true;
	if ((((settings["setting_ilmode"]) && (current.levelStringName=="cp_mi_zurich_newworld") && (current.missionreset_data!=old.missionreset_data) && (current.maploads != 0)))) return true;
	if ((((settings["setting_ilmode"]) && (current.levelStringName=="cp_mi_sing_biodomes") && (current.missionreset_data!=old.missionreset_data) && (current.maploads != 0)))) return true;
	if ((((settings["setting_ilmode"]) && (current.levelStringName=="cp_mi_sing_sgen") && (current.missionreset_data!=old.missionreset_data) && (current.maploads != 0)))) return true;
	if ((((settings["setting_ilmode"]) && (current.levelStringName=="cp_mi_sing_vengeance") && (current.missionreset_data!=old.missionreset_data) && (current.maploads != 0)))) return true;
	if ((((settings["setting_ilmode"]) && (current.levelStringName=="cp_mi_cairo_ramses") && (current.missionreset_data!=old.missionreset_data) && (current.maploads != 0)))) return true;
	if ((((settings["setting_ilmode"]) && (current.levelStringName=="cp_mi_cairo_infection") && (current.missionreset_data!=old.missionreset_data) && (current.maploads != 0)))) return true;
	if ((((settings["setting_ilmode"]) && (current.levelStringName=="cp_mi_cairo_aquifer") && (current.missionreset_data!=old.missionreset_data) && (current.maploads != 0)))) return true;
	if ((((settings["setting_ilmode"]) && (current.levelStringName=="cp_mi_cairo_lotus") && (old.missionreset_data!=current.missionreset_data) && (current.maploads != 0)))) return true;
	if ((((settings["setting_ilmode"]) && (current.levelStringName=="cp_mi_zurich_coalescence") && (current.missionreset_data!=old.missionreset_data) && (current.maploads != 0)))) return true;
	if((current.campaignreset_timer==1) && (current.levelStringName=="core_frontend")) return true;
}

isLoading
{
	if(settings["load_remover"])
	{
		if (current.maploads == 0) return true;
		if ((current.levelStringName=="cp_sh_singapore") && (current.fastloads_safehouse!=-1)) return true;
		if ((current.levelStringName=="cp_sh_cairo") && (current.fastloads_safehouse!=-1)) return true;
		if ((current.levelStringName=="cp_sh_mobile") && (current.fastloads_safehouse!=-1)) return true;
		if (((current.levelStringName=="cp_mi_zurich_newworld") && (current.mission_skipto==8) && (current.whiteload_newworld2!=0))) return true;
		if (((current.levelStringName=="cp_mi_zurich_newworld") && (current.mission_skipto==16) && (current.whiteload_newworld2!=0))) return true;
		if (((current.levelStringName=="cp_mi_zurich_newworld") && (current.mission_skipto==2048) && (current.whiteload_newworld2!=0))) return true;
		if (((current.levelStringName=="cp_mi_zurich_newworld") && (current.mission_skipto==262144) && (current.whiteload_newworld2!=0))) return true;
		if (((current.levelStringName=="cp_mi_zurich_newworld") && (current.mission_skipto==33554432) && (current.whiteload_newworld2!=0))) return true;
		if (((current.levelStringName=="cp_mi_zurich_newworld") && (current.mission_skipto==536870912) && (current.whiteload_newworld2!=0))) return true;
		if (((current.levelStringName=="cp_mi_eth_prologue") && (current.mission_skipto==0) && (current.fastloads_loadoutsequence!=0))) return true;
		if (((current.levelStringName=="cp_mi_eth_prologue") && (current.mission_skipto==16777216) && (current.fastloads_loadoutsequence!=0))) return true;
		if (((current.levelStringName=="cp_mi_zurich_newworld") && (current.mission_skipto==0) && (current.fastloads_loadoutsequence!=0))) return true;
		if (((current.levelStringName=="cp_mi_zurich_newworld") && (current.mission_skipto==536870912) && (current.fastloads_loadoutsequence!=0))) return true;
		if (((current.levelStringName=="cp_mi_sing_blackstation") && (current.mission_skipto==0) && (current.fastloads_loadoutsequence!=0))) return true;
		if (((current.levelStringName=="cp_mi_sing_blackstation") && (current.mission_skipto==524288) && (current.fastloads_loadoutsequence!=0))) return true;
		if (((current.levelStringName=="cp_mi_sing_biodomes") && (current.mission_skipto==0) && (current.fastloads_loadoutsequence!=0))) return true;
		if (((current.levelStringName=="cp_mi_sing_biodomes") && (current.mission_skipto==8192) && (current.fastloads_loadoutsequence!=0))) return true;
		if (((current.levelStringName=="cp_mi_sing_biodomes2") && (current.mission_skipto==0) && (current.fastloads_loadoutsequence!=0))) return true;
		if (((current.levelStringName=="cp_mi_sing_biodomes2") && (current.mission_skipto==64) && (current.fastloads_loadoutsequence!=0))) return true;
		if (((current.levelStringName=="cp_mi_sing_sgen") && (current.mission_skipto==0) && (current.fastloads_loadoutsequence!=0))) return true;
		if (((current.levelStringName=="cp_mi_sing_sgen") && (current.mission_skipto==67108864) && (current.fastloads_loadoutsequence!=0))) return true;
		if (((current.levelStringName=="cp_mi_sing_vengeance") && (current.mission_skipto==0) && (current.fastloads_loadoutsequence!=0))) return true;
		if (((current.levelStringName=="cp_mi_sing_vengeance") && (current.mission_skipto==131072) && (current.fastloads_loadoutsequence!=0))) return true;
		if (((current.levelStringName=="cp_mi_cairo_ramses") && (current.mission_skipto==0) && (current.fastloads_loadoutsequence!=0))) return true;
		if (((current.levelStringName=="cp_mi_cairo_ramses") && (current.mission_skipto==128) && (current.fastloads_loadoutsequence!=0))) return true;
		if (((current.levelStringName=="cp_mi_cairo_ramses2") && (current.mission_skipto==0) && (current.fastloads_loadoutsequence!=0))) return true;
		if (((current.levelStringName=="cp_mi_cairo_ramses2") && (current.mission_skipto==1024) && (current.fastloads_loadoutsequence!=0))) return true;
		if (((current.levelStringName=="cp_mi_cairo_infection") && (current.mission_skipto==0) && (current.fastloads_loadoutsequence!=0))) return true;
		if (((current.levelStringName=="cp_mi_cairo_infection") && (current.mission_skipto==512) && (current.fastloads_loadoutsequence!=0))) return true;
		if (((current.levelStringName=="cp_mi_cairo_infection2") && (current.mission_skipto==0) && (current.fastloads_loadoutsequence!=0))) return true;
		if (((current.levelStringName=="cp_mi_cairo_infection2") && (current.mission_skipto==131072) && (current.fastloads_loadoutsequence!=0))) return true;
		if (((current.levelStringName=="cp_mi_cairo_infection3") && (current.mission_skipto==0) && (current.fastloads_loadoutsequence!=0))) return true;
		if (((current.levelStringName=="cp_mi_cairo_infection3") && (current.mission_skipto==512) && (current.fastloads_loadoutsequence!=0))) return true;
		if (((current.levelStringName=="cp_mi_cairo_aquifer") && (current.mission_skipto==0) && (current.fastloads_loadoutsequence!=0))) return true;
		if (((current.levelStringName=="cp_mi_cairo_aquifer") && (current.mission_skipto==1048576) && (current.fastloads_loadoutsequence!=0))) return true;
		if (((current.levelStringName=="cp_mi_cairo_lotus") && (current.mission_skipto==0) && (current.fastloads_loadoutsequence!=0))) return true;
		if (((current.levelStringName=="cp_mi_cairo_lotus") && (current.mission_skipto==512) && (current.fastloads_loadoutsequence!=0))) return true;
		if (((current.levelStringName=="cp_mi_cairo_lotus2") && (current.mission_skipto==0) && (current.fastloads_loadoutsequence!=0))) return true;
		if (((current.levelStringName=="cp_mi_cairo_lotus2") && (current.mission_skipto==8192) && (current.fastloads_loadoutsequence!=0))) return true;
		if (((current.levelStringName=="cp_mi_cairo_lotus3") && (current.mission_skipto==0) && (current.fastloads_loadoutsequence!=0))) return true;
		if (((current.levelStringName=="cp_mi_cairo_lotus3") && (current.mission_skipto==64) && (current.fastloads_loadoutsequence!=0))) return true;
		if ((((((current.levelGametype!="cpzm") && (current.levelStringName!="core_frontend") && (current.levelStringName!="cp_sh_singapore") && (current.levelStringName!="cp_sh_cairo") && (current.levelStringName!="cp_sh_mobile") && (current.fastloads_mission==4)))))) return true;
		if ((((((current.levelGametype=="cpzm") && (current.levelStringName!="core_frontend") && (current.levelStringName!="cp_sh_singapore") && (current.levelStringName!="cp_sh_cairo") && (current.levelStringName!="cp_sh_mobile") && (current.fastloads_nightmares==0)))))) return true;
	}
	return false;
}
