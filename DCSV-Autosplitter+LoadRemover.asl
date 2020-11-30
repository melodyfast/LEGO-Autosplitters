state("LEGO DC Super-villains_DX11")
{
    byte status : 0x2DB02B0;
    byte loading : 0x3618AF1;
}

split
{
    return current.status == 1 && old.status == 0;
}

isLoading 
{
    return current.loading == 1;
}
