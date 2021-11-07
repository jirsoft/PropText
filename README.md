# PropText
Simple library for use standard fonts on CMM2 as proportional ones. Started with version 0.02, you can mix standard (monospaced) PRINT and TEXT commands with proportional from this library. This library can be used for example in text adventures, because of better readability of texts...

Usage:

*initAll.PROP*...initialise offsets and widths for all built-in fonts

*initFont.PROP(fnt%)*...initialise offsets and widths for font fnt%

*text.PROP(x%,y%,txt$,al%,fnt%,fc%,bc%)*...similar to TEXT command, just size parameter is ommited

*print.PROP(txt$, addSpace$)*...prints proportional txt$ on current position, wraps character to next line, without line feed. If the string addSpace$ is not empty, then to N-th SPACE (" ") in txt$ is added PX pixels, where PX=ASC(MID$(addSpace$, N, 1)). Supports TAB and LF in txt$

*printLn.PROP(txt$, addSpace$)*...same as print.PROP with line feed

*wrap.PROP(txt$)*...**word wrapped** proportional text output

*justify.PROP(txt$, txtWidth%, dx%)*...**full jutified left and right word wrapped** proportional text with size txtWidth% written to offset dx%

*justifyLine.PROP(txt$, txtWidth%, dx%)*...**full jutified left and right word wrapped** ONE LINE of proportional text with size txtWidth% written to offset dx%. In txt$ is then returned non printed rest

*getTextWidth.PROP(fnt$, txt$)*...returns width of the proportinal text in font fnt% in pixels

*tab.PROP (t%)*...set TAB positions to every t% pixels

*font.PROP (f%)*...set FONT number

*color.PROP (fc%, bc%)*...set colors for foreground and background



#### v0.06
	bugfixes

#### v0.05
	new command: justifyLine.PROP
	added Test3.BAS
	
#### v0.04
	new command: tab.PROP
	added support for TAB and LF to print.PROP command
	simpler printLn.PROP
	rename PropTest.BAS to Test1.BAS
	added Test2.BAS for tabulator test
	added screen shot Tabulators.png

#### v0.03
	new command: justify.PROP
	added possible extension of space width to print.PROP and printLn.PROP
	bugfixes

#### v0.02
	massive speedup of init thanks to precalculation of built-in fonts
	new commands: font.PROP, color.PROP, print.PROP, printLn.PROP, wrap.PROP

#### v0.01
	first version of this library
	commands: initAll.PROP, initFont.PROP, text.PROP, getTextWidth.PROP
 	included is test BASIC program and one user font for testing
