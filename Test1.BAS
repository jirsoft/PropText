OPTION EXPLICIT

#INCLUDE "PropText.INC"   'include PropText library 
LOAD FONT "SimplEd.FNT"   'load user font
initAll.PROP              'init built-in fonts
initFont.PROP(8)          'init user font

DIM STRING test
DIM INTEGER f
CONST sample="Proportional text"
?:preview
font.PROP(8):color.PROP(RGB(BLACK),RGB(WHITE))
?:?"print.PROP sample:"
color.PROP(RGB(YELLOW))
preview1
font.PROP(8):color.PROP(RGB(BLACK),RGB(WHITE))
?:?:?"wrap.PROP sample:"
color.PROP(RGB(YELLOW))
preview2
font.PROP(8):color.PROP(RGB(BLACK),RGB(WHITE))
?:?:?"justify.PROP sample:"
color.PROP(RGB(YELLOW))
preview3
'SAVE IMAGE "SS.BMP"
END
SUB preview
  LOCAL INTEGER fnt

  color.PROP RGB(NOTBLACK), RGB(WHITE)
  font.PROP 8
  printLn.PROP("PropText Library by JirSoft, proportional text is yellow, standard text is white for comparation... ")
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

SUB preview1
  LOCAL INTEGER i

  color.PROP RGB(YELLOW), RGB(NOTBLACK)
  font.PROP 8
  FOR i=1 to 50
    print.PROP sample+" "
  NEXT i
END SUB

SUB preview2
  LOCAL INTEGER i
  color.PROP RGB(YELLOW), RGB(NOTBLACK)
  font.PROP 5
  FOR i=1 to 5
    wrap.PROP "This is a sample of the text, that can be printed as word wrapped... "
  NEXT i
END SUB

SUB preview3
  LOCAL STRING sample = "This is a sample of the text, that can be printed as full word justified from left and right using variable interword space. "
  LOCAL INTEGER dy = MM.INFO(VPOS)

  font.PROP 8
  ?@(0,dy);:justify.PROP sample, 300
  font.PROP 4
  ?@(0,dy);:justify.PROP sample, 200, 320
  font.PROP 7
  ?@(0,dy);:justify.PROP sample, 150, 540
  font.PROP 1
  ?@(0,dy);:justify.PROP sample, 200, 710
  font.PROP 3
  ?@(0,dy);:justify.PROP sample, 345, 930
END SUB
