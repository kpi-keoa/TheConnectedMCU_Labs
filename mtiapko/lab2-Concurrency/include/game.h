#ifndef __GAME_H__
#define __GAME_H__

enum TEAM_E
{
	LEFT_TEAM = 0,
	RIGHT_TEAM
};

void game_win(enum TEAM_E team);  //  shows which team won
void game_play();                 //  main game loop

#endif  //  !__GAME_H__
