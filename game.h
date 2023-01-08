#include <stdlib.h>
#include "myLib.h"

// Constants
#define LIVES 3
#define CATCOUNT 10
#define CHEESECOUNT 10
#define PILLARCOUNT 10
#define WINCHEESE 3 

// Variables 
extern ANISPRITE mouse;
extern ANISPRITE cats[CATCOUNT];
extern ANISPRITE cheese[CHEESECOUNT];
extern ANISPRITE pillars[PILLARCOUNT];
extern ANISPRITE lives[LIVES];
extern ANISPRITE bullets[CHEESECOUNT];
extern ANISPRITE winCheese[WINCHEESE];

// Game Prototypes
void initGame();
void updateGame();
void drawGame();

// Mouse prototypes
void initMouse();
void updateMouse();
void drawMouse();

// Cat prototypes
void initCats();
void catAppear();
void updateCats();
void drawCats();

// Cheese prototypes
void initCheese();
void cheeseAppear();
void updateCheese();
void drawCheese();

// Winning cheese prototype
void initWinC();
void winCAppear();
void updateWinC();
void drawWinC();

// Bullet prototypes
void initBullets();
void updateBullets();
void drawBullets();

// Pillar prototypes
void initPillar();
void updatePillar();
void drawPillar();

// Lives prototypes
void initLives();
void updateLives();
void drawLives();