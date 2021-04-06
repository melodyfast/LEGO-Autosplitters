state("LEGOCloneWars")
{
    byte status : 0xB9FAA4;
    byte statust : 0xBBC69C;
    byte newgame : 0xA6DF90;
    byte newgamet : 0xA6DFA2;
}

startup
{
    refreshRate = 60;
}

split
{
    if (current.status > old.status && current.statust > old.statust) return true;
}

start
{
    if (current.newgame > old.newgame && current.newgamet > old.newgamet) return true;
}