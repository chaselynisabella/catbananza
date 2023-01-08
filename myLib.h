#ifndef MY_LIB_H
#define MY_LIB_H

// Common Typedefs
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

// Common Macros
#define OFFSET(col,row,rowlen) ((row)*(rowlen)+(col))

// ================================= DISPLAY ==================================

// Display Control Register
#define REG_DISPCTL (*(volatile unsigned short *)0x4000000)
#define MODE0 0
#define MODE3 3
#define MODE4 4
#define DISP_BACKBUFFER (1<<4)
#define BG0_ENABLE      (1<<8)
#define BG1_ENABLE      (1<<9)
#define BG2_ENABLE      (1<<10)
#define BG3_ENABLE      (1<<11)
#define SPRITE_ENABLE   (1<<12)
#define SPRITE_MODE_2D  (0<<6)
#define SPRITE_MODE_1D  (1<<6)

// Background Control Registers
#define REG_BG0CNT (*(volatile unsigned short*)0x4000008)
#define REG_BG1CNT (*(volatile unsigned short*)0x400000A)
#define REG_BG2CNT (*(volatile unsigned short*)0x400000C)
#define REG_BG3CNT (*(volatile unsigned short*)0x400000E)

#define BG_CHARBLOCK(num)   ((num)<<2)
#define BG_SCREENBLOCK(num) ((num)<<8)
#define BG_4BPP             (0<<7)
#define BG_8BPP             (1<<7)
#define BG_SIZE_SMALL       (0<<14)  // 32x32 tiles
#define BG_SIZE_WIDE        (1<<14)  // 64x32 tiles
#define BG_SIZE_TALL        (2<<14)  // 32x64 tiles
#define BG_SIZE_LARGE       (3<<14)  // 64x64 tiles

// Background Offset Registers
#define REG_BG0HOFF (*(volatile unsigned short *)0x04000010)
#define REG_BG0VOFF (*(volatile unsigned short *)0x04000012)

#define REG_BG1HOFF (*(volatile unsigned short *)0x04000014)
#define REG_BG1VOFF (*(volatile unsigned short *)0x04000016)

#define REG_BG2HOFF (*(volatile unsigned short *)0x04000018)
#define REG_BG2VOFF (*(volatile unsigned short *)0x0400001A)

#define REG_BG3HOFF (*(volatile unsigned short *)0x0400001C)
#define REG_BG3VOFF (*(volatile unsigned short *)0x0400001E)

// Display Status Registers
#define SCANLINECOUNTER (*(volatile unsigned short *)0x4000006)

// Display Constants
#define SCREENHEIGHT 160
#define SCREENWIDTH  240

// Video Buffer
extern volatile unsigned short *videoBuffer;
#define FRONTBUFFER ((unsigned short *)0x6000000)
#define BACKBUFFER  ((unsigned short *)0x600A000)

// Palettes
#define PALETTE       ((unsigned short *)0x5000000)
#define SPRITEPALETTE ((unsigned short *)0x5000200)

// Color
#define COLOR(r,g,b) ((r) | (g)<<5 | (b)<<10)
#define BLACK   COLOR(0,0,0)
#define WHITE   COLOR(31,31,31)
#define GRAY    COLOR(15,15,15)
#define RED     COLOR(31,0,0)
#define GREEN   COLOR(0,31,0)
#define BLUE    COLOR(0,0,31)
#define CYAN    COLOR(0,31,31)
#define MAGENTA COLOR(31,0,31)
#define YELLOW  COLOR(31,31,0)

// Character and Screen Blocks
typedef struct {
	u16 tileimg[8192];
} charblock;
#define CHARBLOCK ((charblock *)0x6000000)

typedef struct {
	u16 tilemap[1024];
} screenblock;
#define SCREENBLOCK ((screenblock *)0x6000000)

// Mode 3 Drawing Functions
void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);

// Mode 4 Drawing Functions
void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);

// Miscellaneous Drawing Functions
void waitForVBlank();
void flipPage();


// ================================= SPRITES ==================================

// Sprite Attribute Struct
typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;

// Object Attribute Memory
#define OAM ((OBJ_ATTR*)(0x7000000))
extern OBJ_ATTR shadowOAM[];

// Attribute 0
#define ATTR0_REGULAR      (0<<8)  // Normal Rendering
#define ATTR0_AFFINE       (1<<8)  // Affine Rendering
#define ATTR0_HIDE         (2<<8)  // No Rendering (Hidden)
#define ATTR0_DOUBLEAFFINE (3<<8)  // Double Affine Rendering
#define ATTR0_NOBLEND      (0<<10) // Disable Alpha Blending
#define ATTR0_BLEND        (1<<10) // Enable Alpha Blending
#define ATTR0_WINDOW       (2<<10) // Object Window Mode
#define ATTR0_MOSAIC       (1<<12) // Enable Mosaic Effect
#define ATTR0_4BPP         (0<<13)
#define ATTR0_8BPP         (1<<13)
#define ATTR0_SQUARE       (0<<14)
#define ATTR0_WIDE         (1<<14) //        |  TINY  | SMALL  | MEDIUM | LARGE  |
#define ATTR0_TALL         (2<<14) // --------------------------------------------
                                   // SQUARE |  8x8   | 16x16  | 32x32  | 64x64  |
// Attribute 1                     // --------------------------------------------
#define ATTR1_HFLIP  (1<<12)       //  WIDE  |  16x8  | 32x8   | 32x16  | 64x32  |
#define ATTR1_VFLIP  (1<<13)       // --------------------------------------------
#define ATTR1_TINY   (0<<14)       //  TALL  |  8x16  | 8x32   | 16x32  | 32x64  |
#define ATTR1_SMALL  (1<<14)       // --------------------------------------------
#define ATTR1_MEDIUM (2<<14)
#define ATTR1_LARGE  (3<<14)

// Attribute 2
#define ATTR2_TILEID(col, row) ((row)*32+(col))
#define ATTR2_PRIORITY(num)    ((num)<<10)
#define ATTR2_PALROW(row)      ((row)<<12)

// Sprite Functions
void hideSprites();

// Sprite Constants
#define ROWMASK 0xFF
#define COLMASK 0x1FF

// Generic struct for animated sprite
typedef struct {
    int hOff;
    int worldRow;
    int worldCol;
    int screenRow;
    int screenCol;
    int tileRow;
    int tileCol;
    int direction;
    int rdel;
    int cdel;
    int width;
    int height;
    int active;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
    int cheatState;
} ANISPRITE;


// ================================== INPUT ===================================

// Button Register
#define BUTTONS (*(volatile unsigned short *)0x04000130)

// Button Masks
#define BUTTON_A		(1<<0)
#define BUTTON_B		(1<<1)
#define BUTTON_SELECT	(1<<2)
#define BUTTON_START	(1<<3)
#define BUTTON_RIGHT	(1<<4)
#define BUTTON_LEFT		(1<<5)
#define BUTTON_UP		(1<<6)
#define BUTTON_DOWN		(1<<7)
#define BUTTON_R		(1<<8)
#define BUTTON_L		(1<<9)

// Variables for Button Macros
extern unsigned short oldButtons;
extern unsigned short buttons;

// Button Macros
#define BUTTON_HELD(key)    (~(BUTTONS) & (key))
#define BUTTON_PRESSED(key) (!(~(oldButtons)&(key)) && (~buttons & (key)))


// =================================== DMA ====================================

// DMA Struct
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;

// First DMA Register Address
extern DMA *dma;

// Destination Adjustment
#define DMA_DESTINATION_INCREMENT (0 << 21)
#define DMA_DESTINATION_DECREMENT (1 << 21)
#define DMA_DESTINATION_FIXED (2 << 21)
#define DMA_DESTINATION_RESET (3 << 21)

// Source Adjustment
#define DMA_SOURCE_INCREMENT (0 << 23)
#define DMA_SOURCE_DECREMENT (1 << 23)
#define DMA_SOURCE_FIXED (2 << 23)

// VBlank and HBlank Repeats
#define DMA_REPEAT (1 << 25)

// Chunk Size
#define DMA_16 (0 << 26)
#define DMA_32 (1 << 26)

// Timing Mode
#define DMA_AT_NOW (0 << 28)
#define DMA_AT_VBLANK (1 << 28)
#define DMA_AT_HBLANK (2 << 28)
#define DMA_AT_REFRESH (3 << 28)

// Interrupts
#define DMA_IRQ (1 << 30)

// Begin DMA
#define DMA_ON (1 << 31)

// DMA Functions
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);

// =================================== TIMERS ====================================

// CONTROLLERS
#define REG_TM0CNT *(volatile unsigned short*)0x4000102
#define REG_TM1CNT *(volatile unsigned short*)0x4000106
#define REG_TM2CNT *(volatile unsigned short*)0x400010A
#define REG_TM3CNT *(volatile unsigned short*)0x400010E

// TIMER VALUES
#define REG_TM0D       *(volatile unsigned short*)0x4000100
#define REG_TM1D       *(volatile unsigned short*)0x4000104
#define REG_TM2D       *(volatile unsigned short*)0x4000108
#define REG_TM3D       *(volatile unsigned short*)0x400010C

// Timer flags
#define TIMER_ON      (1<<7)
#define TIMER_OFF     (0<<7)
#define TM_IRQ        (1<<6)
#define TM_CASCADE    (1<<2)
#define TM_FREQ_1     0
#define TM_FREQ_64    1
#define TM_FREQ_256   2
#define TM_FREQ_1024  3

// =================================== INTERRUPTS ====================================

// CONTROLLER
#define REG_IME *(unsigned short*)0x4000208
// ENABLER
#define REG_IE *(unsigned short*)0x4000200
// FLAG
#define REG_IF *(volatile unsigned short*)0x4000202

// INTERRUPT HANDLER FUNCTION POINTER
typedef void (*ihp)(void);
// INTERRUPT HANDLER REG
#define REG_INTERRUPT *((ihp*)0x03007FFC)
// DISPLAY STATUS
#define REG_DISPSTAT *(unsigned short*)0x4000004

//interrupt constants for turning them on
#define INT_VBLANK_ENABLE 1 << 3

//interrupt constants for checking which type of interrupt happened 
#define INT_VBLANK 1 << 0   
#define INT_TM0 1<<3    
#define INT_TM1 1<<4    
#define INT_TM2 1<<5    
#define INT_TM3 1<<6    
#define INT_BUTTON 1 << 12

// ============================== MISCELLANEOUS ===============================

// Miscellaneous Functions
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);


#endif