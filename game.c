#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "shootSound.h"

// Spritesheet
#include "spritesheet.h"


// mouse sprite
ANISPRITE mouse;

// lives sprites
ANISPRITE lives[LIVES];
int livesLeft;

// cheese sprites 
ANISPRITE cheese[CHEESECOUNT];
int cheeseTimer;
int ammoCount = 3; 

// win cheese sprites
ANISPRITE winCheese[WINCHEESE];
int winCTimer;

// Cheese bullets
ANISPRITE bullets[CHEESECOUNT];

// cat sprites
ANISPRITE cats[CATCOUNT];
int catTimer; 

// Pillar sprites
ANISPRITE pillars[PILLARCOUNT];
int pillarTimer;

// background variables
int hOff;
int vOff;

// random seed
int seed;

OBJ_ATTR shadowOAM[128];
enum {SPRITEFRONT, SPRITEBACK, SPRITELEFT, SPRITERIGHT, SPRITEIDLE}; 
// ================================= GAME SET-UP + UPDATE ================================== 
// initializes game 
void initGame() {
	initMouse();
    initCheese();
    initCats();
    initLives();
    initBullets();
    initPillars();
    initWinC();
}

void updateGame() {
    updateMouse();

    // timer so cats do not all spawn at once
    catTimer++;
    // as mouse moves to right, cats spawn 
    if (catTimer % 100 == 0) {
        catAppear();
    }
    for (int i = 0; i < CATCOUNT; i++) {
        updateCats(&cats[i]);
    }

    // renders cheese as we move to the right 
    cheeseTimer++;
    if (cheeseTimer % 100 == 0) {
       cheeseAppear();
    }
    for (int i = 0; i < CHEESECOUNT; i++) {
        updateCheese(&cheese[i]);
    }

    // renders winning cheese sprites as we move to the right
    winCTimer++;
    if (winCTimer > 1000) {
        if (winCTimer % 100 == 0) { // delays how long after scrolling winning cheeses appear
            winCAppear();
        }
    }
    for (int i = 0; i < WINCHEESE; i++) {
        updateWinC(&winCheese[i]);
    }

    // renders pillars as we move to the right 
    pillarTimer++;
    if (pillarTimer % 100 == 0) {
        pillarAppear();
    }

    // updates all bullets
    for (int i = 0; i < CHEESECOUNT; i++) {
		updateBullets(&bullets[i]);
    }
    updateLives();

    // background scrolls to the right 
    hOff++;
    waitForVBlank();
    REG_BG0HOFF = hOff;
}

void drawGame() {
    drawMouse();
    for (int i = 0; i < CATCOUNT; i++) {
        drawCats(&cats[i]);
    }
    for (int i = 0; i < CHEESECOUNT; i++) {
        drawCheese(&cheese[i]);
    }
    for (int i = 0; i < WINCHEESE; i++) {
        drawWinC(&winCheese[i]);
    }
    for (int i = 0; i < CHEESECOUNT; i++) {
		drawBullets(&bullets[i]);
    }
    for (int i = 0; i < PILLARCOUNT; i++) {
        drawPillar(&pillars[i]);
    }
    drawLives();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
}
// ================================= MOUSE INITIALIZATION + MOVEMENT ================================== 
void initMouse() {
    mouse.hOff = 0;
	mouse.worldRow = 60; //center
	mouse.worldCol = 20; //left
    mouse.screenRow = mouse.worldRow - vOff;
    mouse.screenCol = mouse.worldCol - mouse.hOff;
	mouse.height = 16;
	mouse.width = 16;
	mouse.rdel = 1;
	mouse.cdel = 1;
	mouse.aniState = SPRITEIDLE;
    mouse.tileCol = 1;
    mouse.tileRow = 1;
	mouse.curFrame = 0;
	mouse.active = 1;
	mouse.hide = 0;
	mouse.aniCounter = 0;
	mouse.numFrames = 4;
    mouse.cheatState = 0;
}

// Draws mouse sprite 
void drawMouse() {
    shadowOAM[0].attr0 = (ROWMASK & mouse.worldRow) | ATTR0_SQUARE;
	shadowOAM[0].attr1 = (COLMASK & mouse.worldCol) | ATTR1_SMALL;
	shadowOAM[0].attr2 = ATTR2_TILEID(mouse.aniState * 2, 0); // fix when add sprites
}

// Handles every frame of mouse movement 
void updateMouse() {
    // handles directional movement
    if (BUTTON_HELD(BUTTON_UP)) {
        if (mouse.worldRow > 0) {
            mouse.aniState = SPRITEBACK;
            mouse.worldRow--;
        }
    }
    if (BUTTON_HELD(BUTTON_DOWN)) {
        if(mouse.worldRow + mouse.height < 160) {
            mouse.aniState = SPRITEFRONT;
            mouse.worldRow++;
        }
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        if(mouse.worldCol + mouse.width < 240) {
            mouse.aniState = SPRITERIGHT; 
            mouse.worldCol++;
        }
    }
    if (BUTTON_HELD(BUTTON_LEFT)) {
        if(mouse.worldCol> 0) {
            mouse.aniState = SPRITELEFT; 
            mouse.worldCol -= 2;
        }   
    }

    // handles collision with wall
    if (mouse.worldCol <= 0) {
        livesLeft--;
    }
    // handles mouse animation 
    if (mouse.aniState != SPRITEIDLE) {
		mouse.prevAniState = mouse.aniState;
		mouse.aniState = SPRITEIDLE;
	}
    // Change the animation frame every 10 frames of gameplay
    if(mouse.aniCounter % 10 == 0) {
		mouse.curFrame++;
		if (mouse.curFrame >= mouse.numFrames) {
			mouse.curFrame = 0;
		}
	}	
    if (mouse.aniState == SPRITEIDLE) {
		mouse.curFrame = 0;
		mouse.aniState = mouse.prevAniState;
	} else {
		mouse.aniCounter++;
	}

    // shooting mechanics + direction
    if (BUTTON_PRESSED(BUTTON_A) && mouse.aniState == SPRITELEFT && ammoCount > 0) {
		playSoundB(shootSound_data,shootSound_length, 0);
		shootLeft();
        ammoCount--;
	}

	if (BUTTON_PRESSED(BUTTON_A) && mouse.aniState == SPRITERIGHT && ammoCount > 0) {
		playSoundB(shootSound_data,shootSound_length, 0);
		shootRight();
        ammoCount--;
	}
	if (BUTTON_PRESSED(BUTTON_A) && mouse.aniState == SPRITEBACK && ammoCount > 0) {
		playSoundB(shootSound_data,shootSound_length, 0);
		shootUp();
        ammoCount--;
	}
	if (BUTTON_PRESSED(BUTTON_A) && mouse.aniState == SPRITEFRONT && ammoCount > 0) {
        playSoundB(shootSound_data,shootSound_length, 0);
		shootDown();
        ammoCount--;
	}
    if (BUTTON_PRESSED(BUTTON_SELECT)) { // activate cheat code 
	    mouse.cheatState = 1;
    }

    // handle cat + mouse collision
    for (int i = 0; i < CATCOUNT; i++) {
        if (mouse.cheatState == 0) {
            if (cats[i].active) {
		        if (collision(mouse.worldCol, mouse.worldRow, mouse.width, mouse.height, 
            cats[i].screenCol - hOff, cats[i].screenRow, cats[i].height, cats[i].width) == 1) {
			    livesLeft--;
                cats[i].active = 0;
		    }
            }   
	    } else {
            break;
        }
    }

    // handle mouse + cheese collision & adds ammo 
    for (int i = 0; i < CHEESECOUNT; i++) {
        if (cheese[i].active) {
            if (collision(mouse.worldCol, mouse.worldRow, mouse.width, mouse.height, 
            cheese[i].screenCol - hOff, cheese[i].screenRow, cheese[i].height, cheese[i].width) == 1) {
                cheese[i].active = 0;
                ammoCount++;
		    }
        }
    }

    // handle mouse + winning cheese collision 
    for (int i = 0; i < WINCHEESE; i++) {
        if (winCheese[i].active) {
            if (collision(mouse.worldCol, mouse.worldRow, mouse.width, mouse.height, 
            winCheese[i].screenCol - hOff, winCheese[i].screenRow, winCheese[i].height, winCheese[i].width)) {
                hOff = 0;
                goToWin();
		    }
        }
    }

    // handle mouse + pillar collision
    for (int i = 0; i < PILLARCOUNT; i++) {
        if (pillars[i].active) {
		    if (collision(mouse.worldCol, mouse.worldRow, mouse.width, mouse.height,
                pillars[i].screenCol - hOff, pillars[i].screenRow, pillars[i].height, pillars[i].width) == 1) {
			    mouse.worldCol -= 20;
		    }
        }
	}
}
// ================================= CAT INITIALIZATION + MOVEMENT ================================== 
// Spawns pool of cats
void initCats() {
    for (int i = 0; i < CATCOUNT; i++) {
		cats[i].height = 16;
		cats[i].width = 16;   
		cats[i].worldRow = 0;
		cats[i].worldCol = 0;
		cats[i].rdel = 1;
        cats[i].cdel = 1;
		cats[i].active = 0;
        cats[i].tileRow = 1;
        cats[i].tileCol = 0;
        cats[i].hOff = 0;
	}
}

// Spawns cat 
void catAppear() {
    for (int i = 0; i < CATCOUNT; i++) {
		if (!cats[i].active) {
			// Position the new cat
			cats[i].screenRow = rand() % 100 + 20; // it keeps spawning from the same point
            cats[i].screenCol = SCREENWIDTH + hOff;

            // randomizes cat speed
            cats[i].cdel = rand() % 2 + 1;
            cats[i].hOff++;

			// Take the cat out of the pool
			cats[i].active = 1;
			// Break out of the loop
			break;
		}
	}
}

// handles every-frame movement of the cat
void updateCats(ANISPRITE* c) {
    if (c->active) {
        if (c->worldRow < mouse.worldRow) {
            c->screenRow += c->rdel;
        } else if (c->worldRow >= mouse.worldRow) {
            c->screenRow -= c->rdel;
        }
        c->screenCol -= c->cdel;
        if (c->screenRow <= 1 || c->screenRow + c->height-1 >= 160)
			c->rdel *= -1;

        // handling cat-bullet collision
        for (int i = 0; i < CHEESECOUNT; i++) {
            if (bullets[i].active && collision(c->screenCol - hOff, c->screenRow, c->width, c->height,
                bullets[i].worldCol, bullets[i].worldRow, bullets[i].width, bullets[i].height)) {
                // Put bullet back in the pool
                bullets[i].active = 1;
                c->active = 0;
            }
        }
    }
}

 // draws cats
void drawCats() { 
    for (int i = 0; i < CATCOUNT; i++) {
        if (cats[i].active) {
            shadowOAM[4+i].attr0 = (ROWMASK & cats[i].screenRow) | ATTR0_SQUARE;
            shadowOAM[4+i].attr1 = (COLMASK & cats[i].screenCol - hOff) | ATTR1_SMALL;
            shadowOAM[4+i].attr2 = ATTR2_TILEID(0, 4);
        } else {
            shadowOAM[4 + i].attr0 |= ATTR0_HIDE;
        }
    }
}
// ================================= CHEESE INITIALIZATION ================================== 
void initCheese() {
	for (int i = 0; i < CHEESECOUNT; i++) {
		cheese[i].height = 16;
		cheese[i].width = 16;   
		cheese[i].worldRow = 0;
		cheese[i].worldCol = 0;
		cheese[i].active = 0;
        cheese[i].rdel = 1;
        cheese[i].cdel = 1;
        cheese[i].tileRow = 0;
        cheese[i].tileCol = 0;
        cheese[i].hOff = 0;
	}
}

void updateCheese() {
    for (int i = 0; i < CHEESECOUNT; i++) {
        if (collision(mouse.screenCol - hOff, mouse.screenRow, mouse.width, mouse.height,
            cheese[i].worldCol, cheese[i].worldRow, cheese[i].width, cheese[i].height)) {

            // Put bullet back in the pool
            cheese[i].active = 0;
            ammoCount++;
        }
    }
}

void cheeseAppear() {
    for (int i = 0; i < CHEESECOUNT; i++) {
		if (!cheese[i].active) {

			// Position the new cheese
			cheese[i].screenRow = rand() % 100 + 20; // it keeps spawning from the same point
            cheese[i].screenCol = SCREENWIDTH + hOff;

            // scrolls cheese w screen
            cheese[i].hOff++;

			// Take the cheese out of the pool
			cheese[i].active = 1;

			// Break out of the loop
			break;
		}
	}
}

void drawCheese() {
    for (int i = 0; i < CHEESECOUNT; i++) {
        if (!cheese[i].active) {
	        shadowOAM[60 + i].attr0 |= ATTR0_HIDE;
	    } else if (cheese[i].active) {
            shadowOAM[60+i].attr0 = (ROWMASK & cheese[i].screenRow) | ATTR0_SQUARE;
            shadowOAM[60+i].attr1 = (COLMASK & cheese[i].screenCol - hOff) | ATTR1_SMALL;
            shadowOAM[60+i].attr2 = ATTR2_TILEID(0, 10);
        }
    }
}

// ================================= WINNING CHEESE INITIALIZATION ====================================
void initWinC() {
	for (int i = 0; i < WINCHEESE; i++) {
		winCheese[i].height = 16;
		winCheese[i].width = 16;   
		winCheese[i].worldRow = 0;
		winCheese[i].worldCol = 0;
		winCheese[i].active = 0;
        winCheese[i].rdel = 1;
        winCheese[i].cdel = 1;
        winCheese[i].tileRow = 0;
        winCheese[i].tileCol = 0;
        winCheese[i].hOff = 0;
	}
}

void updateWinC() {
    for (int i = 0; i < WINCHEESE; i++) {
        if (collision(mouse.screenCol - hOff, mouse.screenRow, mouse.width, mouse.height,
            winCheese[i].worldCol, winCheese[i].worldRow, winCheese[i].width, winCheese[i].height)) {
                hOff = 0;
                goToWin();
        }
    }
}



void winCAppear() {
    for (int i = 0; i < WINCHEESE; i++) {
		if (!winCheese[i].active) {

			// Position the new cat
			winCheese[i].screenRow = rand() % 100 + 20; // it keeps spawning from the same point
            winCheese[i].screenCol = SCREENWIDTH + hOff;

            // scrolls with screen
            winCheese[i].hOff++;

			// Take the cheese out of the pool
			winCheese[i].active = 1;

			// Break out of the loop
			break;
		}
	}
}

void drawWinC() {
    for (int i = 0; i < WINCHEESE; i++) {
        if (!winCheese[i].active) {
	        shadowOAM[90 + i].attr0 |= ATTR0_HIDE;
	    } else if (cheese[i].active) {
            shadowOAM[90+i].attr0 = (ROWMASK & winCheese[i].screenRow) | ATTR0_SQUARE;
            shadowOAM[90+i].attr1 = (COLMASK & winCheese[i].screenCol - hOff) | ATTR1_SMALL;
            shadowOAM[90+i].attr2 = ATTR2_TILEID(2, 10);
        }
    }
}

// ================================= BULLET INITIALIZATION + HANDLING ================================== 
void initBullets() {
	for (int i = 0; i < ammoCount; i++) {
		bullets[i].height = 8;
		bullets[i].width = 8;   
		bullets[i].worldRow = mouse.worldRow + (mouse.height/2) - 4;
		bullets[i].worldCol = mouse.worldCol + (mouse.width/2);
		bullets[i].rdel = 1;
        bullets[i].cdel = 1;
		bullets[i].active = 0;
        bullets[i].hide = 1;
        bullets[i].tileRow = 0;
        bullets[i].tileCol = 0;
        bullets[i].hOff = 0;
        bullets[i].screenRow = bullets[i].worldCol - bullets[i].hOff;
        bullets[i].screenCol = bullets[i].worldRow - vOff;
	}
}

void updateBullets(ANISPRITE * b) {
    if (b->active && b->direction == 1
				&& b->worldCol + b->cdel <= SCREENWIDTH-1   
				&& b->worldCol + b->cdel > 0 - b->width) {
			b->worldCol -= b->cdel + 2;

		} else if (b->worldRow + b->height-1 >= 0 && b->direction == 2 && b->worldCol + b->cdel > 0 && b->worldCol + b->cdel < SCREENWIDTH-1) {
			b->worldCol += b->cdel + 2;
		} else if (b->active && b->direction == 3 
				&& b->worldRow + b->rdel <= SCREENHEIGHT-1 
				&& b->worldRow + b->rdel > 0 - b->height ) { //move bullet until it is off top side of screen
			
			b->worldRow -= b->rdel + 2;

		} else if (b->active && b->direction == 4 
				&& b->worldRow + b->rdel <= SCREENHEIGHT + b->height //move bullet until it is off bottom side of screen
				&& b->worldRow + b->rdel > 0 - b->height ) { 
			
			b->worldRow += b->rdel + 2;

		} else {
			b->active = 0;
						
		}
}

// shoot upward when the sprite is facing up
void shootUp() {
    for (int i = 0; i < CHEESECOUNT; i++) {
	    if (!bullets[i].active) {
			//set the bullet direction
			bullets[i].direction = 3;

            // spawns bullet
			bullets[i].worldRow = mouse.worldRow + 2; 
			bullets[i].worldCol = mouse.worldCol + (mouse.width/2); 

			bullets[i].hide = 0;
			bullets[i].active = 1;
			


			// Break out of the loop
			break;
		}
	}
}

// shoot downward when the sprite is facing down
void shootDown() {
    for (int i = 0; i < CHEESECOUNT; i++) {
		if (!bullets[i].active) {
			//set the bullet direction
			bullets[i].direction = 4;

			bullets[i].worldRow = mouse.worldRow; //makes position look more realistic in spawning
			bullets[i].worldCol = mouse.worldCol ; //makes position look more realistic in spawning
			
			// Take the bubble out of the pool
			bullets[i].hide = 0;
			bullets[i].active = 1;

			// Break out of the loop
			break;
		}
	}
}

// shoot rightward when the sprite is facing right
void shootRight() {
    for (int i = 0; i < CHEESECOUNT; i++) {
		if (!bullets[i].active) {
			//set the bullet direction
			bullets[i].direction = 2;

			bullets[i].worldRow = mouse.worldRow + 2;
			bullets[i].worldCol = mouse.worldCol + mouse.width/2 - bullets[i].width/2;

			// Take the bullet out of the pool
			bullets[i].hide = 0;
			bullets[i].active = 1;

			// Break out of the loop
			break;
		}
	}
}

// shoot leftward when the sprite is facing left
void shootLeft() {
    for (int i = 0; i < CHEESECOUNT; i++) {
		if (!bullets[i].active) {
			// Take the bullet out of the pool
			bullets[i].hide = 0;
			bullets[i].active = 1;
			
			//set the bullet direction
			bullets[i].direction = 1;

			bullets[i].worldRow = mouse.worldRow + (mouse.height/2) - 4; 
			bullets[i].worldCol = mouse.worldCol + 2; 
		
			// Break out of the loop
			break;
		}

	}
}

void drawBullets() {
    for (int i = 0; i < CHEESECOUNT; i++) {
        if (!bullets[i].active) { 
	        shadowOAM[20 + i].attr0 |= ATTR0_HIDE; 
        } else if (bullets[i].active) {
            shadowOAM[20+i].attr0 = (ROWMASK & bullets[i].worldRow + 3) | ATTR0_SQUARE;
            shadowOAM[20+i].attr1 = (COLMASK & bullets[i].worldCol) | ATTR1_TINY;
            shadowOAM[20+i].attr2 = ATTR2_TILEID(0, 12);
        }
    }
}

// ================================= PILLAR INITIALIZATION ================================== 
void initPillars() {
	for (int i = 0; i < PILLARCOUNT; i++) {
		pillars[i].height = 32;
		pillars[i].width = 16;   
		pillars[i].worldRow = 0;
		pillars[i].worldCol = 0;
		pillars[i].rdel = 1;
        pillars[i].cdel = 1;
		pillars[i].active = 0;
        pillars[i].tileRow = 0;
        pillars[i].tileCol = 0;
        pillars[i].hOff = 0;
	}
}

void pillarAppear() {
    for (int i = 0; i < PILLARCOUNT; i++) {
		if (!pillars[i].active) {
			// Position the new pillar
			pillars[i].screenRow = (SCREENHEIGHT - pillars[i].height) - (rand() % 100); // spawns top
            pillars[i].screenCol = SCREENWIDTH + hOff + (rand() % 100);

            pillars[i].hOff++;

			// Take the pillar out of the pool
			pillars[i].active = 1;

			// Break out of the loop
			break;
		}
	}
}



// renders obstacles 
void drawPillar() {
    for (int i = 0; i < PILLARCOUNT; i++) {
        if (pillars[i].active) {
            shadowOAM[50+i].attr0 = (ROWMASK & pillars[i].screenRow) | ATTR0_TALL;
            shadowOAM[50+i].attr1 = (COLMASK & pillars[i].screenCol - hOff) | ATTR1_MEDIUM;
            shadowOAM[50+i].attr2 = ATTR2_TILEID(0, 6);
        }
    }
}
// ================================= LIVES INITIALIZATION ================================== 
void initLives() {
	livesLeft = LIVES;
	for (int i = 0; i < 3; i++) {
		lives[i].hOff = 0;
	    lives[i].height = 16;
	    lives[i].width = 16;
	    lives[i].active = 1;
	    lives[i].screenRow = 4;
	    lives[i].screenCol = 180 + (20 * i);
	    lives[i].tileRow = 8;
	    lives[i].tileCol = 9;
	    lives[i].hide = 0;
	}
}

// hides lives based on livesLeft update
void updateLives() {
    if (livesLeft == 2) {
        lives[2].hide = 1;
    }
    if (livesLeft == 1) {
        lives[1].hide = 1;
    }
    if (livesLeft == 0) {
        lives[0].hide = 1;
        vOff = 0;
        hOff = 0;
        goToLose();
    }
}

// renders heart sprites 
void drawLives() {
    for (int i = 0; i < LIVES; i++) {
	    if (lives[i].hide) {
	        shadowOAM[1 + i].attr0 |= ATTR0_HIDE;
	    } else {
	        shadowOAM[1 + i].attr0 = (ROWMASK & lives[i].screenRow) | ATTR0_SQUARE;
	        shadowOAM[1 + i].attr1 = (COLMASK & lives[i].screenCol) | ATTR1_SMALL;
	        shadowOAM[1 + i].attr2 = ATTR2_TILEID(0, 2); // lives[i].tileCol,lives[i].tileRow
	    }
    }
}