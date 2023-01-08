
//{{BLOCK(instructions)

//======================================================================
//
//	instructions, 256x256@4, 
//	+ palette 16 entries, not compressed
//	+ 363 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 32 + 11616 + 2048 = 13696
//
//	Time-stamp: 2020-12-02, 02:08:24
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTIONS_H
#define GRIT_INSTRUCTIONS_H

#define instructionsTilesLen 11616
extern const unsigned short instructionsTiles[5808];

#define instructionsMapLen 2048
extern const unsigned short instructionsMap[1024];

#define instructionsPalLen 32
extern const unsigned short instructionsPal[16];

#endif // GRIT_INSTRUCTIONS_H

//}}BLOCK(instructions)
