
//{{BLOCK(room)

//======================================================================
//
//	room, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 485 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 15520 + 4096 = 20128
//
//	Time-stamp: 2020-12-02, 15:51:54
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_ROOM_H
#define GRIT_ROOM_H

#define roomTilesLen 15520
extern const unsigned short roomTiles[7760];

#define roomMapLen 4096
extern const unsigned short roomMap[2048];

#define roomPalLen 512
extern const unsigned short roomPal[256];

#endif // GRIT_ROOM_H

//}}BLOCK(room)
