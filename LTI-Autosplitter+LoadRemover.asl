state("LEGO The Incredibles_DX11")
{
    float time : 0x02C24100, 0x28;
    byte status : 0x02BF5428, 0x58, 0x8, 0x0, 0x10, 0x4A0;
    byte pause : 0x2BCFA98;
}

startup
{
    refreshRate = 60;
}

split
{
    return current.status == 1 && old.status == 0;
}

isLoading
{
    return current.time == old.time && current.pause == 0 && current.status == 0;
}