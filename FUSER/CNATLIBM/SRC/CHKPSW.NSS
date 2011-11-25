* >Natural Source Header 000000 /*<RO>>
* :NatName CHKPSW
* :UID MSA
* :Mode S
* :CP
* :Date 20071230
* :Time 2337330
* <Natural Source Header /*<<RO>
**********************************************************************
*                                                                    *
*   ВЕДЕНИЕ ДОСТУПА                                                  *
*                                                                    *
**********************************************************************
DEFINE DATA
  PARAMETER USING PSWPRM1
  LOCAL USING PSWVIEW
  LOCAL USING STEKL
  LOCAL USING LCLFROL4
  LOCAL
  1 MSG(A30)
  1 KEYPSW0(A31)
  1 REDEFINE KEYPSW0
    2 KOG(N5)
    2 KSY(A5)
    2 KTY(A5)
    2 KOB(A16)
  1 KEYPSW1(A31)
  1 REDEFINE KEYPSW1
    2 KOG1(N5)
    2 KSY1(A5)
    2 KTY1(A5)
    2 KOB1(A16)
  1 BH00(B1)
  1 REDEFINE BH00
    2 H00(A1)
  1 BHFF(B1)
  1 REDEFINE BHFF
    2 HFF(A1)
END-DEFINE
DEFINE SUBROUTINE CHKPSW
SET KEY ALL
DEFINE WINDOW WIN1
  SIZE 10 * 26
  BASE 08 / 26
  TITLE 'Доступ'
  CONTROL SCREEN
  FRAMED ON POSITION OFF
*
BH00 := H'00'  BHFF := H'FF'  #OPSYS := *OPSYS
KOG := KOG1 := SKEY.ORG  KSY := KSY1 := SKEY.SYST  KTY := KTY1 := 'USER'
KOB := H00  KOB1 := HFF
FIND NUMBER PSWVIEW RKEY = KEYPSW0 THRU KEYPSW1
IF *NUMBER = 0   #RC := 1  ESCAPE ROUTINE  END-IF
SET WINDOW 'WIN1'
REPEAT
  INCLUDE INPPC '"CHKPSCM1"' '"CHKPSWM1"'
  IF *PF-KEY = 'PF3'  ESCAPE ROUTINE  END-IF
  IF USR = ' '  REINPUT 'Им ' MARK *USR ALARM  END-IF
  IF PSW = ' '  REINPUT 'Пароль' MARK *PSW ALARM  END-IF
  KOB := USR
  FIND NUMBER PSWVIEW RKEY = KEYPSW0 AND FLDA1 = PSW
  IF *NUMBER NE 0
    SET WINDOW OFF  #RC := 1  ESCAPE ROUTINE
  END-IF
  ADD 1 TO #I  #J := 5 - #I
  IF #J < 0  SET WINDOW OFF ESCAPE ROUTINE  END-IF
  COMPRESS 'Неверно. Осталось' #J 'попыток' INTO MSG
  REINPUT MSG ALARM
END-REPEAT
END-SUBROUTINE
END
