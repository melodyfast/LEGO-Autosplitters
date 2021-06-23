state("LEGOStarWarsSaga")
{
    byte status : 0x526BD0;
    byte statust : 0x481C38;
    byte newgame : 0x47B738;
    byte posb : 0x40B708;
    byte posc : 0x40B70C;
    string12 stream : 0x4CBB90;
}

state("LEGOStarWarsSaga.exe.unpacked")
{
    byte status : 0x526BD0;
    byte statust : 0x481C38;
    byte newgame : 0x47B738;
    byte posb : 0x40B708;
    byte posc : 0x40B70C;
    string12 stream : 0x4CBB90;
}

startup
{
    settings.Add("splitdelay", true, "Split on Status Wipe");
    settings.Add("splitcs", false, "Split on Cutscene End (LSW1 Splits)");
    settings.Add("bespincs", true, "End on Bespin Outro (Any%)");
    vars.stopwatch = new Stopwatch();
    refreshRate = 60;
    vars.splitActions = (EventHandler)((s, e) => {
        vars.stopwatch.Reset();
    });
    timer.OnSplit += vars.splitActions;
}

split
{
    if (settings["splitdelay"] && current.status > old.status && current.statust != old.statust) vars.stopwatch.Restart();
    if (vars.stopwatch.ElapsedMilliseconds > 767) return true;
    if (settings["splitcs"] && current.status > old.status) return true;
    if (settings["bespincs"] && current.posb == 90 && current.posc == 180 && current.stream == "Escape_Outro") return true;
}

start
{
    return current.newgame == 1 && old.newgame == 0;
}
