// Pointers found by TehSeven and ZombieWizzard
// Coded by ZombieWizzard

state("speedrunners")
{
	byte gameType : "steam_api.dll", 0x0002C5A8, 0x8, 0x14, 0x3c, 0x44, 0x1c, 0x34, 0x20, 0x20, 0x4, 0x8, 0x50;
	byte gameState : "steam_api.dll", 0x0002C5A8, 0x8, 0x14, 0x3c, 0x44, 0x1c, 0x34, 0x20, 0x20, 0x4, 0x8, 0x51;
}

start
{
	return current.gameState == 5 && current.gameType == 7;
}

split
{
	if (!vars.splitted && current.gameState == 6){
		vars.splitted = true;
		return true;
	}
}

isLoading
{
	return current.gameState == 3;
}

init
{
	vars.splitted = false;
}


update
{
	if (current.gameState != 6){
		vars.splitted = false;
	}
}
