
//{{BLOCK(lose)

//======================================================================
//
//	lose, 256x256@4, 
//	+ palette 16 entries, not compressed
//	+ 238 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 32 + 7616 + 2048 = 9696
//
//	Time-stamp: 2020-12-01, 20:55:13
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LOSE_H
#define GRIT_LOSE_H

#define loseTilesLen 7616
extern const unsigned short loseTiles[3808];

#define loseMapLen 2048
extern const unsigned short loseMap[1024];

#define losePalLen 32
extern const unsigned short losePal[16];

#endif // GRIT_LOSE_H

//}}BLOCK(lose)
