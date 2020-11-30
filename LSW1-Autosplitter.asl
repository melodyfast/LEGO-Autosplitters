state("LegoStarwars")
{
    byte status : 0x39C58D;
    byte start : 0x39B0D0;
}

split
{
    return current.status == 18 && old.status == 0;
}

start
{
    return current.start > old.start;
}
