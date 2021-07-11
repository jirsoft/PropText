#INCLUDE "PropText.INC"   'include PropText library 
LOAD FONT "SimplEd.FNT"   'load user font
initAll.PROP              'init built-in fonts
initFont.PROP(8)          'init user font
DIM INTEGER fnt, dx, dy=100
DIM STRING test
CONST sample="Proportional text"


text.PROP(MM.HRES\2,0," Proportinal text is yellow, standard text is white for comparation... ","CT", 8, RGB(BLACK), RGB(WHITE))
FOR fnt = 1 TO 8
  IF fnt=6 THEN
    test = "0123456789"
  ELSE
    test = sample
  ENDIF    
  text.PROP(dx,dy,test,"LT", fnt, RGB(YELLOW))
  text.PROP(MM.HRES\2,dy,test,"CT", fnt, RGB(YELLOW))
  text.PROP(MM.HRES-1,dy,test,"RT", fnt, RGB(YELLOW))
  INC dy, MM.INFO(FONTHEIGHT)
  TEXT dx,dy,test,"LT", fnt,,  RGB(WHITE)
  TEXT MM.HRES\2,dy,test,"CT", fnt,,  RGB(WHITE)
  TEXT MM.HRES-1,dy,test,"RT", fnt,,  RGB(WHITE)
  INC dy, 2*MM.INFO(FONTHEIGHT)
NEXT fnt

END

