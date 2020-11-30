state("LEGOStarWarsSaga")
{
    byte status : 0x526BD0;
    byte statust : 0x481C38;
    byte newgame : 0x47B738;
}

startup
{
    vars.stopwatch = new Stopwatch();
    refreshRate = 60;
    vars.splitActions = (EventHandler)((s, e) => {
        vars.stopwatch.Reset();
    });
    timer.OnSplit += vars.splitActions;
}

split
{
    if (current.status > old.status && current.statust != old.statust) vars.stopwatch.Restart();
    if (vars.stopwatch.ElapsedMilliseconds > 767) return true;
}

start
{
    return current.newgame == 1 && old.newgame == 0;
}