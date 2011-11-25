* >Natural Source Header 000000 /*<RO>>
* :NatName ST-SH150
* :UID MSA
* :Mode S
* :CP
* :Date 20080128
* :Time 1900330
* <Natural Source Header /*<<RO>
* ¡€—“–€… œŒ»— . «¿œ»—‹ ¬ ¡¿«”
DEFINE DATA
  PARAMETER USING PRM-SH1
  LOCAL USING STEKL
  LOCAL USING UPCSL
  LOCAL
  1 R-SH(A100/150)  1 LEN-SH(N3)
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
  1 RRY(A100/150)
END-DEFINE
DEFINE SUBROUTINE ST-SH150
  DD := H'7F'  DD2 := H'22'
  IF *OPSYS = SCAN 'CMS'  EXAMINE ST-NM #DD REPLACE ' '
    ELSE  EXAMINE ST-NM #DD2 REPLACE ' '
  END-IF
  FOR #I 1 C-IGNOR
    EXAMINE ST-NM IGNOR(#I) REPLACE ' '
  END-FOR
  EXAMINE ST-NM '„.' DELETE
  EXAMINE ST-NM '√.' DELETE
  EXAMINE ST-NM TRANSLATE INTO UPPER
  EXAMINE ST-NM TRANSLATE USING UPCS(*)
  SEPARATE ST-NM INTO R-SH(*) WITH DELIMITERS ' '
  FOR #I 1 50
    IF R-SH(#I) NE ' '
      ADD 1 TO LEN-SH  RRY(LEN-SH) := R-SH(#I)
    END-IF
  END-FOR
  R-SH(*) := RRY(*)
  IF LEN-SH <= 150  #M := LEN-SH
    FOR #I 1 LEN-SH
      EXAMINE FULL R-SH(#I) ' ' GIVING POSITION #J
      ADD -1 TO #J
      IF #J > 3  #L := #J - 2
        FOR #K 2 #L
          ADD 1 TO #M
          IF #M > 150  ESCAPE BOTTOM  END-IF
          #N := #J - #K + 1
          R-SH(#M) := SUBSTR(R-SH(#I),#K,#N)
        END-FOR
      END-IF
    END-FOR
  END-IF
  SH-NM(*) := R-SH(*)
END-SUBROUTINE
END
