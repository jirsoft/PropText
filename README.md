# PropText
Simple library for use standard fonts on CMM2 as proportional ones. Started with version 0.02, you can mix standard (monospaced) PRINT and TEXT commands with proportional from this library. This library can be used for example in text adventures, because of better readability of texts...

Usage:

*initAll.PROP*...initialise offsets and widths for all built-in fonts

*initFont.PROP(fnt%)*...initialise offsets and widths for font fnt%

*text.PROP(x%,y%,txt$,al%,fnt%,fc%,bc%)*...similar to TEXT command, just size parameter is ommited

*print.PROP(txt$, addSpace$)*...prints proportional txt$ on current position, wraps character to next line, without line feed. If the string addSpace$ is not empty, then to N-th SPACE (" ") in txt$ is added PX pixels, where PX=ASC(MID$(addSpace$, N, 1))

*print.PROP(txt$, addSpace$)*...prints proportional txt$ on current position, wraps character to next line, without line feed

*printLn.PROP(txt$)*...same as print.PROP with line feed

*wrap.PROP(txt$)*...**word wrapped** proportional text output

*justify.PROP(txt$, txtWidth%, dx%)*...**full jutified left and right word wrapped** proportional text with size txtWidth% written to offset dx%

*getTextWidth.PROP(fnt$, txt$)*...returns width of the proportinal text in font fnt% in pixels





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
