# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern volatile unsigned short *videoBuffer;
# 85 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 157 "myLib.h"
void hideSprites();






typedef struct {
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 198 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 209 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 249 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 285 "myLib.h"
typedef void (*ihp)(void);
# 305 "myLib.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "myLib.c" 2


unsigned volatile short *videoBuffer = (unsigned short *)0x6000000;


DMA *dma = (DMA *)0x40000B0;


void setPixel3(int col, int row, unsigned short color)
{

    videoBuffer[((row)*(240)+(col))] = color;
}


void setPixel4(int col, int row, unsigned char colorIndex)
{
    volatile unsigned short pixelData = videoBuffer[((row)*(240)+(col)) / 2];
    if (col & 1)
    {
        pixelData &= 0x00FF;
        pixelData |= colorIndex << 8;
    }
    else
    {
        pixelData &= 0xFF00;
        pixelData |= colorIndex;
    }
    videoBuffer[((row)*(240)+(col)) / 2] = pixelData;
}


void drawRect3(int col, int row, int width, int height, volatile unsigned short color)
{

    for (int r = 0; r < height; r++)
    {
        DMANow(3, &color, &videoBuffer[((row + r)*(240)+(col))], (2 << 23) | width);
    }
}


void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex)
{
    volatile unsigned short pixelData = colorIndex | (colorIndex << 8);
    for (int r = 0; r < height; r++)
    {

        if (width == 1)
            setPixel4(col, row + r, colorIndex);
        else if (width == 2)
        {
            setPixel4(col, row + r, colorIndex);
            setPixel4(col + 1, row + r, colorIndex);
        }
        else if ((col & 1) && (width & 1))
        {
            setPixel4(col, row + r, colorIndex);
            DMANow(3, &pixelData, &videoBuffer[((row + r)*(240)+(col + 1)) / 2], (2 << 23) | (width - 1) / 2);
        }
        else if (width & 1)
        {
            DMANow(3, &pixelData, &videoBuffer[((row + r)*(240)+(col)) / 2], (2 << 23) | (width - 1) / 2);
            setPixel4(col + width - 1, row + r, colorIndex);
        }
        else if (col & 1)
        {
            setPixel4(col, row + r, colorIndex);
            DMANow(3, &pixelData, &videoBuffer[((row + r)*(240)+(col + 1)) / 2], (2 << 23) | (width - 2) / 2);
            setPixel4(col + width - 1, row + r, colorIndex);
        }
        else
        {
            DMANow(3, &pixelData, &videoBuffer[((row + r)*(240)+(col)) / 2], (2 << 23) | width / 2);
        }
    }
}


void fillScreen3(volatile unsigned short color)
{
    unsigned short c = color;
    DMANow(3, &c, videoBuffer, (2 << 23) | (240 * 160));
}


void fillScreen4(volatile unsigned char colorIndex)
{
    volatile unsigned short pixelData = colorIndex | (colorIndex << 8);
    DMANow(3, &pixelData, videoBuffer, (2 << 23) | (240 * 160) / 2);
}


void drawImage3(int col, int row, int width, int height, const unsigned short *image)
{
    for (int r = 0; r < height; r++)
    {
        DMANow(3, &image[((r)*(width)+(0))], &videoBuffer[((row + r)*(240)+(col))], width);
    }
}


void drawImage4(int col, int row, int width, int height, const unsigned short *image)
{
    for (int i = 0; i < height; i++)
    {
        DMANow(3, &image[((i)*(width / 2)+(0))], &videoBuffer[((row + i)*(240)+(col)) / 2], width / 2);
    }
}


void drawFullscreenImage3(const unsigned short *image)
{

    DMANow(3, image, videoBuffer, 240 * 160);
}


void drawFullscreenImage4(const unsigned short *image)
{
    DMANow(3, image, videoBuffer, 240 * 160 / 2);
}


void waitForVBlank()
{
    while ((*(volatile unsigned short *)0x4000006) > 160)
        ;
    while ((*(volatile unsigned short *)0x4000006) < 160)
        ;
}


void flipPage()
{

    if ((*(volatile unsigned short *)0x4000000) & (1<<4))
    {
        videoBuffer = ((unsigned short *)0x600A000);
    }
    else
    {
        videoBuffer = ((unsigned short *)0x6000000);
    }
    (*(volatile unsigned short *)0x4000000) ^= (1<<4);
}


void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt)
{

    dma[channel].cnt = 0;


    dma[channel].src = src;
    dma[channel].dst = dst;


    dma[channel].cnt = cnt | (1 << 31);
}


int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB)
{
    return rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB && colA < colB + widthB - 1 && colA + widthA - 1 > colB;
}


void hideSprites()
{
    for (int i = 0; i < 128; i++)
    {
        shadowOAM[i].attr0 = (2<<8);
    }
}
