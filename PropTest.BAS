OPTION EXPLICIT

#INCLUDE "PropText.INC"   'include PropText library 
LOAD FONT "SimplEd.FNT"   'load user font
initAll.PROP              'init built-in fonts
initFont.PROP(8)          'init user font

DIM STRING test
DIM INTEGER f
CONST sample="Proportional text"
MODE 1
preview
?:?:?"print.PROP sample:"
preview2(8)
?:?:?"wrap.PROP sample:"
preview3(1)
SAVE IMAGE "SS.BMP"
END
SUB preview
  LOCAL INTEGER fnt

  color.PROP RGB(NOTBLACK), RGB(WHITE)
  font.PROP 8
  printLn.PROP(" Proportional text is yellow, standard text is white for comparation... ")
  FOR fnt = 1 TO 8
    IF fnt=6 THEN
      test = "0123456789"
    ELSE
      test = sample
    ENDIF
    font.PROP fnt
    color.PROP RGB(WHITE), RGB(NOTBLACK)
    PRINT test" ";
    color.PROP RGB(YELLOW), RGB(NOTBLACK)
    printLn.PROP test
  NEXT fnt
END SUB

SUB preview2(f%)
  LOCAL INTEGER i

  color.PROP RGB(WHITE), RGB(NOTBLACK)
  font.PROP f%
  FOR i=1 to 50
    print.PROP sample+" "
  NEXT i
END SUB

SUB preview3(f%)
  LOCAL INTEGER i
  color.PROP RGB(WHITE), RGB(NOTBLACK)
  font.PROP f%
  FOR i=1 to 20
    wrap.PROP "This is a sample of the text, that can be printed as word wrapped... "
  NEXT i
END SUB


