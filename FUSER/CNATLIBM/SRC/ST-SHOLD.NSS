* >Natural Source Header 000000 /*<RO>>
* :NatName ST-SHOLD
* :UID ARMK01
* :Mode S
* :CP
* :Date 20060720
* :Time 1937330
* <Natural Source Header /*<<RO>
* ¡€—“–€… œŒ»— . «¿œ»—‹ ¬ ¡¿«”
DEFINE DATA
  PARAMETER USING PRM-SH
  LOCAL USING STEKL
  LOCAL
  1 R-SH(A100/50)  1 LEN-SH(N3)
  1 C-IGNOR(N5) CONST < 20 >
  1 IGNOR(A1/C-IGNOR) INIT < '"', '''', '<', '>', '-' ,
  '!', '@', '#', '$', '%' ,
  '^', '&', '*', '(', ')',
  ';', ':', '/', ',', '.' >
  1 DD(B1)
  1 REDEFINE DD
    2 #DD(A1)
  1 DD2(B1)
  1 REDEFINE DD2
    2 #DD2(A1)
  1 RRY(A100/50)
END-DEFINE
DEFINE SUBROUTINE ST-SHOLD
  DD := H'7F'  DD2 := H'22'
  IF *OPSYS = SCAN 'CMS'  EXAMINE ST-NM #DD REPLACE ' '
    ELSE  EXAMINE ST-NM #DD2 REPLACE ' '
  END-IF
  FOR #I 1 C-IGNOR
    EXAMINE ST-NM IGNOR(#I) REPLACE ' '
  END-FOR
  EXAMINE ST-NM '„.' DELETE
  EXAMINE ST-NM '√.' DELETE
  SEPARATE ST-NM INTO R-SH(*) WITH DELIMITERS ' '
  FOR #I 1 50
    IF R-SH(#I) NE ' '
      ADD 1 TO LEN-SH  RRY(LEN-SH) := R-SH(#I)
    END-IF
  END-FOR
  R-SH(*) := RRY(*)
  IF LEN-SH <= 50  #M := LEN-SH
    FOR #I 1 LEN-SH
      EXAMINE FULL R-SH(#I) ' ' GIVING POSITION #J
      ADD -1 TO #J
      IF #J > 3  #L := #J - 2
        FOR #K 2 #L
          ADD 1 TO #M
          IF #M > 50  ESCAPE BOTTOM  END-IF
          #N := #J - #K + 1
          R-SH(#M) := SUBSTR(R-SH(#I),#K,#N)
        END-FOR
      END-IF
    END-FOR
  END-IF
  SH-NM(*) := R-SH(*)
END-SUBROUTINE
END
