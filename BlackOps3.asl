state("blackops3")
{
	int maploads : 0x51AC2FC;
	int fastloads_safehouse : 0x3534808;
	int fastloads_nightmares : 0xA54AD00;
	int fastloads_mission : 0x4D28860;
	string70 levelStringName : 0x940C5E8;
	string70 levelGametype : 0x1770D5DC;
	int livesplit_start : 0x353CA60;
	int currentsafehouse_mission : 0xA55BDF4;
	int campaignreset_timer : 0x53DC2A0;
	int missionsplitter_1 : 0xA570308;
	int missionsplitter_2 : 0xA55BEF4;
	int missionsplitter_3 : 0x1683FD50;
	int missionsplitter_4 : 0x544776C;
	int missionsplitter_5 : 0x10A80AE8;
	int missionsplitter_6 : 0x10A81944;
	int missionsplitter_7 : 0x180E7A5C;           //delayed split (splits when the cutscene starts) but best memory value
	int missionsplitter_8 : 0x17A60B08;
	int missionsplitter_9 : 0x4713B30;
	int missionsplitter_10 : 0x180EA22C;
	int missionsplitter_11 : 0xA62F600;           //delayed split (splits when the credits fully load and not just when the screen is black) but best memory value
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
	settings.Add("old_missionsplit", false, "Auto-Split By Map (Less Buggy // Doesn't Work on Nightmares)");
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
		if((((current.levelStringName=="cp_mi_eth_prologue") && (current.missionsplitter_1!=0) && (settings["blackops"]) && (vars.mission1split!=true))))
		{
			vars.mission1split = true;
			return true;
		}
		if((((current.levelStringName=="cp_mi_zurich_newworld") && (current.missionsplitter_2!=0) && (settings["newworld"]) && (vars.mission2split!=true))))
		{
			vars.mission2split = true;
			return true;
		}
		if((((current.levelStringName=="cp_mi_sing_blackstation") && (current.missionsplitter_3!=0) && (settings["indarkness"]) && (vars.mission3split!=true))))
		{
			vars.mission3split = true;
			return true;
		}
		if((((current.levelStringName=="cp_mi_sing_biodomes2") && (current.missionsplitter_4!=0) && (settings["provocation"]) && (vars.mission4split!=true))))
		{
			vars.mission4split = true;
			return true;
		}
		if((((current.levelStringName=="cp_mi_sing_sgen") && (current.missionsplitter_5!=0) && (settings["hypocenter"]) && (vars.mission5split!=true))))
		{
			vars.mission5split = true;
			return true;
		}
		if((((current.levelStringName=="cp_mi_sing_vengeance") && (current.missionsplitter_6!=0) && (settings["vengeance"]) && (vars.mission6split!=true))))
		{
			vars.mission6split = true;
			return true;
		}
		if((((current.levelStringName=="cp_mi_cairo_ramses2") && (current.missionsplitter_7!=0) && (settings["risefall"]) && (vars.mission7split!=true))))
		{
			vars.mission7split = true;
			return true;
		}
		if((((current.levelStringName=="cp_mi_cairo_infection3") && (current.missionsplitter_8!=0) && (settings["demonwithin"]) && (vars.mission8split!=true))))
		{
			vars.mission8split = true;
			return true;
		}
		if((((current.levelStringName=="cp_mi_cairo_aquifer") && (current.missionsplitter_9!=0) && (settings["sandcastle"]) && (vars.mission9split!=true))))
		{
			vars.mission9split = true;
			return true;
		}
		if((((current.levelStringName=="cp_mi_cairo_lotus3") && (current.missionsplitter_10!=0) && (settings["lotus"]) && (vars.mission10split!=true))))
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
}

reset
{
	return((current.campaignreset_timer==1) && (current.levelStringName=="core_frontend"));
}

isLoading
{
	if(settings["load_remover"])
	{
		if (current.maploads == 0) return true;
		if ((current.levelStringName=="cp_sh_singapore") && (current.fastloads_safehouse!=-1)) return true;
		if ((current.levelStringName=="cp_sh_cairo") && (current.fastloads_safehouse!=-1)) return true;
		if ((current.levelStringName=="cp_sh_mobile") && (current.fastloads_safehouse!=-1)) return true;
		if ((((((current.levelGametype!="cpzm") && (current.levelStringName!="core_frontend") && (current.levelStringName!="cp_sh_singapore") && (current.levelStringName!="cp_sh_cairo") && (current.levelStringName!="cp_sh_mobile") && (current.fastloads_mission==4)))))) return true;
		if ((((((current.levelGametype=="cpzm") && (current.levelStringName!="core_frontend") && (current.levelStringName!="cp_sh_singapore") && (current.levelStringName!="cp_sh_cairo") && (current.levelStringName!="cp_sh_mobile") && (current.fastloads_nightmares==0)))))) return true;
	}
	return false;
}
