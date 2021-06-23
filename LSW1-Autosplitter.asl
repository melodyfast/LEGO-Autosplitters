state("LegoStarwars")
{
    byte status : 0x39C58D;
    byte start : 0x39B0D0;
    byte title : 0x37B618;
    byte cutscene : 0x38D04C;
    string16 door : 0x39B0E0;
}

startup
{
    settings.Add("newgame", true, "Start on New Game");
    settings.Add("freeplay", false, "Start on Level Entry (Free Play)");
    settings.Add("maul", true, "End on Darth Maul Outro (Any%)");
    settings.Add("vader", false, "End on Darth Vader Outro (All Minikits)");
    settings.Add("anh", false, "End on A New Hope Outro (100% NSR)");
}

split
{
    if (settings["maul"] && current.door == "door_8" && current.cutscene == 1) return true;
    if (settings["vader"] && current.door == "door_fight" && current.cutscene == 1) return true;
    if (settings["anh"] && current.door == "door_from_room2" && current.cutscene == 1) return true;
    if (current.status == 18 && old.status == 0) return true;
}

start
{
    if (settings["newgame"] && current.start > old.start && current.title == 1) return true;
    if (settings["freeplay"] && current.door == "") return true;
}
