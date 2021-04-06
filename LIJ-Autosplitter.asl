state("LEGOIndy")
{
    byte status : 0x6D39F0;
    byte statust : 0x6927D8;
    byte newgame : 0x6C1664;
    byte newgamet : 0x6CC7A8;
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