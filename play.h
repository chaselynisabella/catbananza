
//{{BLOCK(play)

//======================================================================
//
//	play, 256x256@4, 
//	+ palette 16 entries, not compressed
//	+ 2 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 32 + 64 + 2048 = 2144
//
//	Time-stamp: 2020-11-30, 14:08:21
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PLAY_H
#define GRIT_PLAY_H

#define playTilesLen 64
extern const unsigned short playTiles[32];

#define playMapLen 2048
extern const unsigned short playMap[1024];

#define playPalLen 32
extern const unsigned short playPal[16];

#endif // GRIT_PLAY_H

//}}BLOCK(play)
