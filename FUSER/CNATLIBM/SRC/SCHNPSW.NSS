* >Natural Source Header 000000 /*<RO>>
* :NatName SCHNPSW
* :UID NAT22605
* :Mode S
* :CP
* :Date 20061017
* :Time 1656330
* <Natural Source Header /*<<RO>
**********************************************************************
*                                                                    *
*   бедемхе днярсою                                                  *
*                                                                    *
**********************************************************************
DEFINE DATA
  PARAMETER USING PSWPRM1
  LOCAL USING PSWVIEW
  LOCAL USING STEKL
  LOCAL
  1 MSG(A30)
  1 KEYPSW0(A31)
  1 REDEFINE KEYPSW0
    2 KOG(N5)  2 KSY(A5)  2 KTY(A5)  2 KOB(A16)
  1 OPSW(A10)  1 RPSW(A10)  1 FLGP(N5)  1 FLGO(N5)  1 #POVT(A30)
  1 TTL(A30)
END-DEFINE
DEFINE SUBROUTINE CHNPSW
SET KEY ALL
DEFINE WINDOW WIN1
  SIZE 10*35
  BASE 05 / 10
  CONTROL SCREEN
  FRAMED ON POSITION OFF
*
KOG := ORG  KSY := SKEY.SYST  KTY := 'USER'  KOB := USR
SET WINDOW 'WIN1'
FIND PSWVIEW RKEY = KEYPSW0
  RPSW := OPSW := PSW := FLDA1
END-FIND
IF OPSW NE ' '  TTL := 'ббедхре ярюпши оюпнкэ'
  ELSE TTL := 'ббедхре мнбши оюпнкэ'
END-IF
REPEAT
  INPUT USING MAP 'CHNPSWM1'
  IF *PF-KEY = 'PF3'  ESCAPE BOTTOM  END-IF
  IF OPSW NE PSW AND OPSW NE ' '  ADD 1 TO FLGO
    IF FLGO > 5   ESCAPE BOTTOM  END-IF
    REINPUT 'мебепмши оюпнкэ' ALARM
  END-IF
  ADD 1 TO FLGP  OPSW := ' '
  IF FLGP = 1
    TTL := 'ббедхре мнбши оюпнкэ'
    ESCAPE TOP
  END-IF
  IF FLGP = 2  RPSW := PSW  TTL := 'ббедхре ондрбепфдемхе'
    ESCAPE TOP
  END-IF
  IF RPSW NE PSW  ADD 1 TO FLGP
    IF FLGP > 7   ESCAPE BOTTOM  END-IF
    REINPUT 'мебепмши оюпнкэ' ALARM
  END-IF
  FIND PSWVIEW RKEY = KEYPSW0
    FLDA1 := PSW
    UPDATE
  END-FIND
  END OF TRANSACTION
  ESCAPE BOTTOM
END-REPEAT
SET WINDOW OFF
END-SUBROUTINE
END
