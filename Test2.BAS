OPTION EXPLICIT

#INCLUDE "PropText.INC"   'include PropText library 
initAll.PROP              'init built-in fonts
font.PROP(2)                    'set font
tab.PROP(2*MM.INFO(FONTWIDTH))  'set TAB positions

DIM STRING prg = MM.INFO(CURRENT), ln

?
OPEN prg FOR INPUT AS #1
  DO WHILE NOT EOF(#1)
    LINE INPUT #1, ln
    replaceAll(ln, "  ", CHR$(8))
    printLn.PROP(ln)
  LOOP
CLOSE #1
'SAVE IMAGE "SS.BMP"
END

SUB replaceAll(txt$, src$, dst$)
  LOCAL INTEGER p = INSTR(txt$, src$)

  DO WHILE p>0
    txt$ = LEFT$(txt$, p-1) + dst$ + MID$(txt$, p + LEN(src$))
    p = INSTR(txt$, src$)
  LOOP
END SUB


