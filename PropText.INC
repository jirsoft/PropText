DIM STRING offset.PROP(8), width.PROP(8) 'needed for library to work
SUB text.PROP(x%, y%, txt$, alig$, f%, fc%, bc%)
  'draw proportional text txt$ on x%, y% with alignment alig$ in font f% with forecolor f% and backcolor b% 

  LOCAL INTEGER i, xx=x%, yy=y%, o, w, ww=ASC(MID$(offset.PROP(f%), 1, 1))
  LOCAL STRING c, a="L"
  FONT f%
  
  IF INSTR(alig$, "R") OR INSTR(alig$, "r")THEN
    w = getTextWidth.PROP(f%, txt$)
    o = ASC(MID$(offset.PROP(f%), ASC(LEFT$(txt$,1)), 1))
    INC xx, -w + o
  ELSEIF INSTR(alig$, "C") OR INSTR(alig$, "c") THEN
    w = getTextWidth.PROP(f%, txt$)
    o = ASC(MID$(offset.PROP(f%), ASC(LEFT$(txt$,1)), 1))
    INC xx, -(w\2) + o
  ENDIF
  IF INSTR(alig$,"B") OR INSTR(alig$,"b") THEN
    CAT a, "B"
  ELSEIF INSTR(alig$,"M") OR INSTR(alig$,"m") THEN
    CAT a, "M"
  ELSE
    CAT a, "T"
  ENDIF
  FOR i=1 TO LEN(txt$)
    c = MID$(txt$, i, 1)
    o = ASC(MID$(offset.PROP(f%), ASC(c), 1))
    w = ASC(MID$(width.PROP(f%), ASC(c), 1))
    INC xx, -o'
    IF bc%>0 THEN BOX xx+o, yy, w+o+ww, MM.INFO(FONTHEIGHT), 0,,bc%
    TEXT xx, yy, c, a,,, fc%, -1
    INC xx, w + o + ww
  NEXT i
END SUB

SUB initAll.PROP
  'initialise proportional offsets and widths for all built-in fonts

  LOCAL INTEGER f
  FOR f = 1 TO 7
    initFont.PROP(f)
  NEXT f
END SUB

SUB initFont.PROP(f%)
  'initialise proportional offsets and widths for complete font f%

  LOCAL INTEGER c, x, y, o, w

  FONT f%
  offset.PROP(f%) = CHR$((MM.INFO(FONTWIDTH)\8)+1) + STRING$(254,0)
  width.PROP(f%) = STRING$(255, MM.INFO(FONTWIDTH))
  PAGE WRITE 1
  FOR c=32 TO 255
    o = -1
    w = -1
    TEXT 0, 0, CHR$(c), "LT",,,RGB(WHITE), RGB(BLACK)
    FOR x=0 TO MM.INFO(FONTWIDTH)-1
      FOR y=0 TO MM.INFO(FONTHEIGHT)-1
        IF PIXEL(x, y)>0 THEN
          o = x
          EXIT FOR
        ENDIF      
      NEXT y
      IF o>=0 THEN EXIT FOR
    NEXT x
    IF o<0 THEN o=0
    MID$(offset.PROP(f%), c, 1) = CHR$(o)
    FOR x=MM.INFO(FONTWIDTH)-1 TO 0 STEP -1
      FOR y=0 TO MM.INFO(FONTHEIGHT)-1
        IF PIXEL(x, y)>0 THEN
          w = x
          EXIT FOR
        ENDIF      
      NEXT y
      IF w>=0 THEN EXIT FOR
    NEXT x
    IF w<0 THEN w=MM.INFO(FONTWIDTH)\4
    MID$(width.PROP(f%), c, 1) = CHR$(w-o+1)
  NEXT c
  PAGE WRITE 0
END SUB

FUNCTION getTextWidth.PROP(f%, txt$) AS INTEGER
  'get width of proportional text txt$ drawn in font f% in pixels

  LOCAL INTEGER i, ww = ASC(MID$(offset.PROP(f%), 1, 1))
  getTextWidth.PROP = 0
  FOR i = 1 TO LEN(txt$)
    INC getTextWidth.PROP, ASC(MID$(width.PROP(f%), ASC(MID$(txt$, i, 1)), 1)) + ww
  NEXT i
  IF txt$<>"" THEN INC getTextWidth.PROP, -ww
END FUNCTION
