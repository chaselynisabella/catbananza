
//{{BLOCK(intro)

//======================================================================
//
//	intro, 256x256@8, 
//	+ palette 16 entries, not compressed
//	+ 41 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 32 + 2624 + 2048 = 4704
//
//	Time-stamp: 2020-11-30, 02:09:41
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INTRO_H
#define GRIT_INTRO_H

#define introTilesLen 2624
extern const unsigned short introTiles[1312];

#define introMapLen 2048
extern const unsigned short introMap[1024];

#define introPalLen 32
extern const unsigned short introPal[16];

#endif // GRIT_INTRO_H

//}}BLOCK(intro)
