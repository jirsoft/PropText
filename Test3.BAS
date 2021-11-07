OPTION EXPLICIT

'#INCLUDE "../LIB/PropText.INC"   'include PropText library 
#INCLUDE "PropText.INC"   'include PropText library 
LOAD FONT "SimplEd.FNT"   'load user font
initAll.PROP              'init built-in fonts
initFont.PROP(8)          'init user font

DIM STRING test
DIM INTEGER f
font.PROP(8):color.PROP(RGB(BLACK),RGB(WHITE))
?:?:?"justifyLine.PROP sample:"
color.PROP(RGB(YELLOW))
preview
END

SUB preview
  LOCAL STRING sample = "This is a sample of the text, that can be printed as full word justified from left and right using variable interword space. "

  font.PROP 8

  DO WHILE sample<>""
    justifyLine.PROP sample, 250, 100
  LOOP
END SUB
