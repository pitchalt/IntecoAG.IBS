* >Natural Source Header 000000 /*<RO>>
* :NatName DEFMENU
* :UID LMV
* :Mode S
* :CP
* :Date 20050523
* :Time 1243330
* <Natural Source Header /*<<RO>
*******************************************************************
*                                                                 *
*  нопедекемхе янярюбю лемч                                       *
*                                                                 *
*******************************************************************
DEFINE DATA
  PARAMETER USING PRMDEF
  LOCAL USING CONFL
  LOCAL USING PSWVIEW
  LOCAL USING STEKL
END-DEFINE
DEFINE SUBROUTINE DEFMENU
POLZ2 := #USG  KEYPSWOG := OG2 := #ORG
KEYPSWSY := SYST2 := SYSTP
MENU2 := PGMMENU  KEYPSWTP := 'UMOD'
RESET QLINE P-FUNC(*) P-PG(*) PROGS(*)
FIND IBS-CONF-FILE SUPCONF = CKEY2
  FOR #I 1 C*SOSTAV
    IF #USR NE ' '            /* оюпнкх еярэ
      KEYPSWPG := PGM(#I)
P1.   FIND NUMBER PSWVIEW RKEY = KEYPSW AND FLDA2 = #USR
      IF *NUMBER(P1.) NE 0  ADD 1 TO QLINE
        P-FUNC(QLINE) := NM-PGM(#I)
        P-PG(QLINE) := PGM(#I)
        PROGS(QLINE) := STARTER(#I)
      END-IF
      ELSE  ADD 1 TO QLINE
      P-FUNC(QLINE) := NM-PGM(#I)
      P-PG(QLINE) := PGM(#I)
      PROGS(QLINE) := STARTER(#I)
    END-IF
  END-FOR
END-FIND
KLR := QLINE
END-SUBROUTINE
END

