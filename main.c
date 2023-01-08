#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "game.h"

// Include all bg's + state screens
#include "start.h"
#include "intro.h"
#include "instructions.h"
#include "room.h" 
#include "pause.h"
#include "win.h"
#include "lose.h"

// Include sprite sheet
#include "spritesheet.h"

// Include sound elements
#include "sound.h"
#include "startSound.h"
#include "gameSound.h"
#include "loseSound.h"
#include "winSound.h"
#include "shootSound.h"



// Prototypes
void initialize();

// State Prototypes
void goToStart();
void start();
void goToIntro();
void intro();
void goToInstructions();
void instructions();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// States
enum
{
    START,
    INTRO,
    INSTRUCTIONS, 
    GAME,
    PAUSE,
    WIN,
    LOSE
};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Sound variables
SOUND soundA;
SOUND soundB;

// Shadow OAM
OBJ_ATTR shadowOAM[128];

// Random Seed
int seed;

// Text Buffer
char buffer[41];

int main() {
    initialize();

    while (1) {
        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
        switch (state) {
        case START:
            start();
            break;
        case INSTRUCTIONS:
            instructions();
            break;
        case GAME:
            game();
            break;
        case PAUSE:
            pause();
            break;
        case WIN:
            win();
            break;
        case LOSE:
            lose();
            break;
        }
        waitForVBlank();
        DMANow(3, shadowOAM, OAM, 128*4);
    }
}

// Sets up GBA
void initialize() {
    
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
	REG_BG0CNT = BG_SIZE_SMALL | BG_4BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);

    setupInterrupts();
	setupSounds();

    buttons = BUTTONS;
    oldButtons = 0;

    // begin & load start screen 
    goToStart();
}

// Sets up the start state
void goToStart() {

    REG_BG0CNT = BG_SIZE_SMALL | BG_4BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);

    //Load the palette for your tiles
    DMANow(3, startPal, PALETTE, startPalLen / 2);

    //Load your tiles into the charblock that your background is using
    DMANow(3, startTiles,& CHARBLOCK[0], startTilesLen / 2);

    //Load your tile map into the screenblock that your background is using
    DMANow(3, startMap, &SCREENBLOCK[28], startMapLen / 2);
    
    hideSprites();
    waitForVBlank();
    
    DMANow(3, shadowOAM, OAM, 512);

    stopSound();  
	playSoundA(startSound_data, startSound_length, 1);
    

    // Begin the seed randomization
    seed = 0;

    state = START;

}

// Runs every frame of the start state
void start() {

    waitForVBlank();

    // handles state transtions
    if (BUTTON_PRESSED(BUTTON_START)) {
        stopSound();
        playSoundA(gameSound_data, gameSound_length, 1);
		goToGame();
		initGame();
	}
    if (BUTTON_PRESSED(BUTTON_RIGHT)) {
        goToInstructions();        
    }

}

// sets up the instruction state
void goToInstructions() {

    REG_BG0CNT = BG_SIZE_SMALL | BG_4BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);

	DMANow(3, instructionsPal, PALETTE, instructionsPalLen / 2);
	DMANow(3, instructionsTiles, &CHARBLOCK[0], instructionsTilesLen / 2);
	DMANow(3, instructionsMap, &SCREENBLOCK[28], instructionsMapLen / 2);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

	state = INSTRUCTIONS;
}

// Runs the instruction state 
void instructions() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame(); 
    }
    if (BUTTON_PRESSED(BUTTON_LEFT)) {
        goToStart();
    }
}

// Sets up the game state
void goToGame() {

    REG_BG0CNT = BG_SIZE_WIDE | BG_4BPP | BG_CHARBLOCK(1) | BG_SCREENBLOCK(29);
    REG_DISPCTL |= SPRITE_ENABLE;

    // Set up the background 
	DMANow(3, roomPal, PALETTE, roomPalLen / 2);
	DMANow(3, roomTiles, &CHARBLOCK[1], roomTilesLen / 2);
	DMANow(3, roomMap, &SCREENBLOCK[29], roomMapLen / 2);


    // Set up the sprites
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);


	state = GAME;
}

// Runs every frame of the game state
void game() {
    
    updateGame();
	drawGame();
	waitForVBlank();

    // state transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        pauseSound();
        goToPause();
    }
}

// Sets up the pause state
void goToPause() {
    hideSprites();
	waitForVBlank();
	

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;



    // hacky, but basically disables sprites for this state
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    REG_BG0CNT = BG_4BPP | BG_SCREENBLOCK(27) | BG_CHARBLOCK(1) | BG_SIZE_SMALL;


    //Load the palette for your tiles
    DMANow(3, pausePal, PALETTE, 256);

    //Back BG
    //Load your tiles into the charblock that your background is using
    DMANow(3, pauseTiles,& CHARBLOCK[1], pauseTilesLen/2);

    //Load your tile map into the screenblock that your background is using
    DMANow(3, pauseMap, &SCREENBLOCK[27], pauseMapLen/2);

    DMANow(3, shadowOAM, OAM, 512);

	state = PAUSE;
}

// Runs every frame of the pause state
void pause() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        unpauseSound();
        goToGame(); 
    }
    if (BUTTON_PRESSED(BUTTON_RIGHT)) {
        // restarts/quits the game
        goToStart();
    }
}

// Sets up the win state
void goToWin() {
	
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    // hacky, but basically disables sprites for this state
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    REG_BG0CNT = BG_4BPP | BG_SCREENBLOCK(26) | BG_CHARBLOCK(1) | BG_SIZE_SMALL;


    //Load the palette for your tiles
    DMANow(3, winPal, PALETTE, 256);

    //Back BG
    //Load your tiles into the charblock that your background is using
    DMANow(3, winTiles,& CHARBLOCK[1], winTilesLen/2);

    //Load your tile map into the screenblock that your background is using
    DMANow(3, winMap, &SCREENBLOCK[26], winMapLen/2);


    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);


	state = WIN;

}

// Runs every frame of the win state
void win() {
    hideSprites();
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart(); 
    }
}

// Sets up the lose state
void goToLose() {
    hideSprites();
	waitForVBlank();
	

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    // hacky, but basically disables sprites for this state
    REG_DISPCTL = MODE0 | BG0_ENABLE;

    REG_BG0CNT = BG_4BPP | BG_SCREENBLOCK(26) | BG_CHARBLOCK(1) | BG_SIZE_SMALL;


    //Load the palette for your tiles
    DMANow(3, losePal, PALETTE, 256);

    //Back BG
    //Load your tiles into the charblock that your background is using
    DMANow(3, loseTiles,& CHARBLOCK[1], loseTilesLen/2);

    //Load your tile map into the screenblock that your background is using
    DMANow(3, loseMap, &SCREENBLOCK[26], loseMapLen/2);

    DMANow(3, shadowOAM, OAM, 512);


	state = LOSE;
}

// Runs every frame of the lose state
void lose() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart(); 
    }
}