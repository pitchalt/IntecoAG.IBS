* >Natural Source Header 000000 /*<RO>>
* :NatName ST-SHORT
* :UID TIROD
* :Mode S
* :CP
* :Date 20080206
* :Time 0944330
* <Natural Source Header /*<<RO>
* ¡€—“–€… œŒ»— . «¿œ»—‹ ¬ ¡¿«”
DEFINE DATA
  PARAMETER USING PRM-SH
  LOCAL USING STEKL
  LOCAL USING UPCSL
  LOCAL
  1 R-SH(A100/100)  1 LEN-SH(N3)
  1 DIGIT(A1/10) INIT <'0','1','2','3','4','5','6','7','8','9'>
  1 UTRACT     (B2/1:11) INIT <
    H'B9C1', H'EDC2', H'BDC5', H'CDD2', H'CFD4', H'DAC8',
    H'DBD6', H'DED7', H'DFC3', H'EAE3', H'CAE7'>
  1 REDEFINE UTRACT
  2 UTRACT-A (A2/1:11)
  1 C-IGNOR(N5) CONST < 17 >
  1 IGNOR(A1/C-IGNOR) INIT
  < '''', '<', '>', '+',
     '!', '@', '#', '$', '%' ,
     '^', '&', '*', '(', ')',
     ';', ':', '/'   >
  1 DD(B1)
  1 REDEFINE DD
    2 #DD(A1)
  1 DD2(B1)
  1 REDEFINE DD2
    2 #DD2(A1)
  1 RRY(A100/50)
  1 #POS1    (I4)
  1 #POS2   (I4)
  1 #COUNT1 (I4)
  1 #COUNT2 (I4)
  1 #STR    (A100)
  1 REDEFINE #STR
  2 #STR-A  (A1/1:100)
  1 #NUM    (N10.6)
  1 REDEFINE #NUM
  2 #NUM-10 (N10)
  2 #NUM-6  (A6)
END-DEFINE
/*
DEFINE SUBROUTINE ST-SHORT
  RESET R-SH(*)
  DD := H'7F'  DD2 := H'22'
  IF *OPSYS = SCAN 'CMS'  EXAMINE ST-NM #DD REPLACE ' '
    ELSE  EXAMINE ST-NM #DD2 REPLACE ' '
  END-IF
  EXAMINE ST-NM TRANSLATE INTO UPPER CASE
  EXAMINE ST-NM TRANSLATE USING UPCS(*)
  FOR #I 1 C-IGNOR
    EXAMINE ST-NM IGNOR(#I) REPLACE ' '
  END-FOR
  EXAMINE ST-NM '„.' DELETE
  EXAMINE ST-NM '√.' DELETE
  SEPARATE ST-NM LEFT JUSTIFIED INTO R-SH(*) IGNORE
        WITH DELIMITERS ' ' GIVING NUMBER #POS1
  ADD 1 TO #POS1
  #I := 0
  REPEAT
     ADD 1 TO #I
     IF #I > 50 OR #POS1 > 50 THEN ESCAPE BOTTOM END-IF
     IF #I > #POS1 THEN ESCAPE BOTTOM END-IF
     MOVE R-SH(#I) TO #STR
     EXAMINE #STR FOR " " GIVING LENGTH #COUNT1
     IF #COUNT1 < 2 THEN R-SH(#I) := " " ESCAPE TOP END-IF
     EXAMINE #STR FOR '-' GIVING NUMBER #COUNT1
     IF #COUNT1 NE 0 THEN
        SEPARATE #STR LEFT JUSTIFIED INTO R-SH(#POS1:50) IGNORE
              WITH DELIMITERS '-' GIVING NUMBER #COUNT2
        ADD #COUNT2 TO #POS1
        ESCAPE TOP
     END-IF
     EXAMINE #STR FOR "," REPLACE "." GIVING NUMBER #COUNT1
     IF #STR IS (N10.6) THEN
        #NUM := VAL(#STR)
        IF #NUM < 0 THEN #NUM := #NUM * -1 END-IF
        EXAMINE #NUM-6  FOR "0" REPLACE " "
        EXAMINE #NUM-6  FOR " " REPLACE "0"
        IF #NUM-6 EQ '000000' THEN #NUM-6 := " " END-IF
        COMPRESS #NUM-10 #NUM-6 INTO #STR WITH DELIMITER "."
     ELSE
        MOVE R-SH(#I) TO  #STR
        RESET #COUNT2
        FOR #J = 1 TO 100
          IF #STR-A(#J) EQ " " THEN ESCAPE BOTTOM END-IF
          IF #STR-A(#J) EQ DIGIT(*) THEN
            ADD 1 TO #COUNT2
          ELSE IF #STR-A(#J) EQ '.' OR EQ ',' THEN
            IGNORE
          ELSE
            MOVE " " TO #STR-A(#J)
          END-IF END-IF
        END-FOR
        IF #COUNT2 NE 0 THEN
          SEPARATE #STR LEFT JUSTIFIED INTO R-SH(#POS1:50) IGNORE
                  WITH DELIMITERS ' ' GIVING NUMBER #COUNT2
          IF #COUNT2 > 1 THEN
            ADD #COUNT2 TO #POS1
          ELSE
            EXAMINE #STR FOR ',' REPLACE '.'
            EXAMINE #STR FOR '.' GIVING NUMBER #COUNT2
            IF #COUNT2 > 1 THEN
               SEPARATE #STR LEFT JUSTIFIED INTO R-SH(#POS1:50) IGNORE
                  WITH DELIMITERS '.' GIVING NUMBER #COUNT2
               ADD #COUNT2 TO #POS1
            END-IF
          END-IF
          ESCAPE TOP
        ELSE
          EXAMINE R-SH(#I) FOR " " GIVING LENGTH #COUNT2
          IF #COUNT2 < 4 THEN
            ESCAPE TOP
          END-IF
          SUBTRACT 1 FROM #COUNT2
          MOVE SUBSTRING(R-SH(#I),2,#COUNT2) TO #STR
       END-IF
     END-IF
     IF NOT (R-SH(*) EQ #STR) THEN
        MOVE #STR TO R-SH(#POS1)
        ADD 1 TO #POS1
     END-IF
  END-REPEAT
  SH-NM(*) := R-SH(1:50)
END-SUBROUTINE
END
