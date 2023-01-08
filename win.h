
//{{BLOCK(win)

//======================================================================
//
//	win, 256x256@4, 
//	+ palette 16 entries, not compressed
//	+ 227 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 32 + 7264 + 2048 = 9344
//
//	Time-stamp: 2020-12-01, 20:50:51
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WIN_H
#define GRIT_WIN_H

#define winTilesLen 7264
extern const unsigned short winTiles[3632];

#define winMapLen 2048
extern const unsigned short winMap[1024];

#define winPalLen 32
extern const unsigned short winPal[16];

#endif // GRIT_WIN_H

//}}BLOCK(win)
