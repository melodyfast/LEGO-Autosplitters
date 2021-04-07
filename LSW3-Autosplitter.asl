state("LEGOCloneWars")
{
    byte status : 0xBBC744;
    byte statust : 0xBBC745;
    byte newgame : 0xA6DF90;
    byte newgamet : 0xA6DFA2;
}

startup
{
    refreshRate = 60;
}

split
{
    if (current.status != old.status && current.statust != old.statust) return true;
}

start
{
    if (current.newgame > old.newgame && current.newgamet > old.newgamet) return true;
}
