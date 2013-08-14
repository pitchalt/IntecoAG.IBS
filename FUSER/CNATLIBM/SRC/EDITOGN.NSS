* >Natural Source Header 000000 /*<RO>>
* :NatName EDITOGN
* :UID IEN
* :Mode S
* :CP
* :Date 20101115
* :Time 0918550
* <Natural Source Header /*<<RO>
DEFINE DATA
  PARAMETER USING PR4NAVVO
  LOCAL USING PR4NAVBN
  LOCAL USING LCLFROL4
  LOCAL USING LCLRECL
  LOCAL USING CHR1251
  LOCAL USING CHREBCD
  LOCAL USING PPD-L
  LOCAL USING LCLKKL
  LOCAL USING LCLBNL
  LOCAL USING STEKL
  LOCAL USING PRM-NM1
  LOCAL USING PRM-SH1
  LOCAL USING ADKVOPRM   /* PDA орг.-ий-пользователей с кодом > 1000
  LOCAL
  1 IBS-KVO-FILE VIEW OF IBS-SYS-FILE
    2 OG-ID  2 VO-ID
    2 NM-OG
    2 REDEFINE NM-OG
      3 NM-OG1(A40)  3 NM-OG2(A40)
    2 AD-OG  2 NN-ID  2 RE-OG
    2 VO-DI(1:5)  2 NM-PL
    2 UP-DT  2 UP-PG  2 UP-ID  2 UP-US
    2 VO-NM-SH(1:50)  2 NA-F
    2 CT-F  2 ST-F
    2 C*PR-ID  2 C*RS-OG(1:15)  2 C*RS-VA(1:15)
    2 PR-ID(1:15)
      3 BN-OG  3 RS-OG(1:15)  3 RS-VA(1:15)
    2 FL-DG
*
  1 KPP(A20)  1 REGION(N3)  1 SHNM(A15/5)  1 INM1(A100)  1 R-NM(A30/50)
*
  1 FUN_NM_G(A60)  1 CURLINE(N7)  1 LINESCH(N7)
  1 KEYVO(A10)
  1 REDEFINE KEYVO
    2 KEYVOOG(N5)  2 KEYVOVO(N5)
  1 KEYBN(A13)
  1 REDEFINE KEYBN
    2 KEYBNOG(N5)  2 KEYBNBN(N8)
  1 KEYBIC(A25)
  1 REDEFINE KEYBIC
    2 KEYBICOG(N5)  2 KEYBICBIC(A20)
*
  1 #BIC(A15)
  1 #BN(N8/15)  1 #RS(A20/15,15)  1 #VA(A3/15,15)
  1 DOP_INFO(A30)
  1 REDEFINE DOP_INFO
    2 OKVED(A10)  2 OGRN(A20)
  1 OPSYS(A3)
END-DEFINE
*
DEFINE WINDOW RAS_SCH
       SIZE 17*78
       BASE 3/1
       TITLE 'Банки и счета'
       CONTROL SCREEN
       FRAMED ON
*
DEFINE SUBROUTINE EDITOGN
  OPSYS := *OPSYS
  INCLUDE DEFOPSYS
  FUN_NM_G := '*** Ведение кодификатора внешних организаций ***'
  CALLNAT 'CENTER60' FUN_NM_G
  KEYVOOG := KEYBNOG := KEYBICOG := KODIF_VO.OG_ID_G
  IF KODIF_VO.RES_VO = '4' /* ввод новой ВО -> получить дл  неё код ВО
    FIND IBS-KK-FILE OG-ID = KODIF_VO.OG_ID_G AND KK-F = 'MO'
    IF NO
      IBS-KK-FILE.OG-ID := KODIF_VO.OG_ID_G
      IBS-KK-FILE.KK-F := 'MO'
      IBS-KK-FILE.KD-F := 0
    END-NOREC
      ADD 1 TO IBS-KK-FILE.KD-F  KODIF_VO.VO_ID := IBS-KK-FILE.KD-F
      IF *NUMBER = 0
         STORE IBS-KK-FILE
        ELSE
         UPDATE
      END-IF
      END OF TRANSACTION
    END-FIND
    RESET IBS-KVO-FILE.BN-OG(*) IBS-KVO-FILE.RS-OG(*,*) IBS-KVO-FILE.RS-VA(*,*)
  ELSE  KEYVOVO := KODIF_VO.VO_ID
V.  FIND IBS-KVO-FILE OG-VO = KEYVO
      KODIF_VO.VO_NAME1 := IBS-KVO-FILE.NM-OG1
      KODIF_VO.VO_NAME2 := IBS-KVO-FILE.NM-OG2
      KODIF_VO.VO_ADDR  := IBS-KVO-FILE.AD-OG
      KODIF_VO.VO_INN   := IBS-KVO-FILE.NN-ID
      REGION := IBS-KVO-FILE.RE-OG
      SHNM(*) := IBS-KVO-FILE.VO-DI(*)
      KPP := IBS-KVO-FILE.NM-PL
      DOP_INFO := IBS-KVO-FILE.NA-F
      KODIF_VO.VO_FLDG := IBS-KVO-FILE.FL-DG
    END-FIND
    IF *NUMBER(V.) = 0
      KODIF_VO.RES_VO := '0'  ESCAPE ROUTINE
    END-IF
  END-IF
  SET KEY ALL
  REPEAT
    INPUT USING MAP 'EDITVOM1'
    IF *PF-KEY = 'PF3'  KODIF_VO.RES_VO := 'N'  ESCAPE BOTTOM  END-IF
    IF *PF-KEY = 'PF6' AND KODIF_VO.RES_VO = '4'  ESCAPE BOTTOM  END-IF
    IF KODIF_VO.VO_ADDR = ' '
      REINPUT 'Адрес' MARK *KODIF_VO.VO_ADDR ALARM
    END-IF
    IF NOT(KODIF_VO.VO_FLDG  = SYS-D OR = SYS-N OR = ' ')
      REINPUT 'Аналитика договора: Д/Н' MARK *KODIF_VO.VO_FLDG ALARM
    END-IF
    IF *PF-KEY = 'PF5'  ESCAPE BOTTOM  END-IF
    IF *PF-KEY = 'PF6'  RESET CURLINE
R.    FIND NUMBER IBS-REC-FILE OB-OS = KODIF_VO.VO_ID
      OR OB-ID = KODIF_VO.VO_ID
      CURLINE := *NUMBER(R.)
      IF CURLINE = 0
D.      FIND NUMBER PPDDOC DU-OK= KODIF_VO.VO_ID
        CURLINE := *NUMBER(D.)
      END-IF
      IF CURLINE NE 0
        REINPUT 'Удал ть нельз . Есть данные' ALARM
      END-IF
    END-IF
    IF *PF-KEY = 'PF11'  LINESCH := 1
      SET WINDOW 'RAS_SCH'
      REPEAT
        IF IBS-KVO-FILE.BN-OG(LINESCH) NE 0
         KEYBNBN := IBS-KVO-FILE.BN-OG(LINESCH)
          FIND IBS-KBN-FILE OG-BN = KEYBN
            #BIC := MF-ID
          END-FIND
        END-IF
        INPUT USING MAP 'EDITVOM3'
        IF *PF-KEY = 'PF3'  ESCAPE BOTTOM  END-IF
        IF *PF-KEY = 'PF12'
          RESET IBS-KVO-FILE.RS-OG(LINESCH,*) IBS-KVO-FILE.RS-VA(LINESCH,*)
          ESCAPE TOP
        END-IF
        IF *PF-KEY = 'PF11'  CALLNAT 'SYSNAVBN' KODIF_BN
          IF KODIF_BN.RES_BN EQ 'Y' THEN
            IBS-KVO-FILE.BN-OG(LINESCH) := KODIF_BN.BN_ID
            #BIC := KODIF_BN.BN_BIC
          END-IF
          ESCAPE TOP
        END-IF
        IF #BIC NE ' '  KEYBICBIC := #BIC  #J := 0
          FIND IBS-KBN-FILE OG-BIC = KEYBIC
            IBS-KVO-FILE.BN-OG(LINESCH) := BN-ID
          END-FIND
          FOR #I 1 15
            IF IBS-KVO-FILE.RS-OG(LINESCH,#I) NE ' '  ADD 1 TO #J
              IF IBS-KVO-FILE.RS-VA(LINESCH,#I) = ' '
                REINPUT 'Валюта' MARK *IBS-KVO-FILE.RS-VA(LINESCH,#I) ALARM
              END-IF
            END-IF
          END-FOR
          IF #J = 0
            REINPUT 'Укажите счет' MARK *IBS-KVO-FILE.RS-OG(LINESCH,1) ALARM
          END-IF
          IF *PF-KEY = 'PF7' AND LINESCH > 1
            ADD -1 TO LINESCH
          END-IF
          IF *PF-KEY = 'PF8' AND LINESCH < 15
            ADD 1 TO LINESCH
          END-IF
        END-IF
        IF *PF-KEY = 'PF5'  ESCAPE BOTTOM  END-IF
      END-REPEAT
      SET WINDOW OFF
    END-IF
  END-REPEAT
  IF *PF-KEY = 'PF5' /* запись в Б.Д. новой ВО или редактированной
    #BN(*)   := IBS-KVO-FILE.BN-OG(*)
    #RS(*,*) := IBS-KVO-FILE.RS-OG(*,*)
    #VA(*,*) := IBS-KVO-FILE.RS-VA(*,*)
    IF KODIF_VO.RES_VO = '5' /* если ВО не нова  прочитать заново
G.   GET IBS-KVO-FILE *ISN(V.)
    END-IF
    IBS-KVO-FILE.OG-ID  := KEYVOOG
    IBS-KVO-FILE.VO-ID  := IBS-KVO-FILE.CT-F := KODIF_VO.VO_ID
    IBS-KVO-FILE.NM-OG1 := KODIF_VO.VO_NAME1
    IBS-KVO-FILE.NM-OG2 := KODIF_VO.VO_NAME2
    IBS-KVO-FILE.AD-OG  := KODIF_VO.VO_ADDR
    IBS-KVO-FILE.NN-ID  := KODIF_VO.VO_INN
    IBS-KVO-FILE.RE-OG  := REGION
    IBS-KVO-FILE.FL-DG  := KODIF_VO.VO_FLDG
    IBS-KVO-FILE.VO-DI(*) := SHNM(*)
    IBS-KVO-FILE.NM-PL  := KPP
    IBS-KVO-FILE.NA-F   := DOP_INFO
    IBS-KVO-FILE.UP-DT  := *DATX
    IBS-KVO-FILE.UP-PG  := *PROGRAM
    IBS-KVO-FILE.UP-ID  := *INIT-ID
    IBS-KVO-FILE.UP-US  := *INIT-USER
    COMPRESS IBS-KVO-FILE.NM-OG IBS-KVO-FILE.AD-OG INTO INM1
    PERFORM ST-SHORT INM1 R-NM(*)
    IBS-KVO-FILE.VO-NM-SH(*) := R-NM(*)
    IBS-KVO-FILE.ST-F := 'VO'
    IBS-KVO-FILE.BN-OG(*) := #BN(*)
    IBS-KVO-FILE.RS-OG(*,*) := #RS(*,*)
    IBS-KVO-FILE.RS-VA(*,*) := #VA(*,*)
    MOVE BY NAME IBS-KVO-FILE TO ADKVOPRM
    IF KODIF_VO.RES_VO = '5'                 /* перезаписать данные ВО дл  орг.-ии пользовател  1000
     UPDATE(G.)
    PERFORM ADDKVO KODIF_VO.RES_VO ADKVOPRM /* дл  остальных орг.-ий пользователей
      ELSE
     STORE IBS-KVO-FILE                      /* записать данные ВО дл  орг.-ии пользовател  1000
     PERFORM ADDKVO KODIF_VO.RES_VO ADKVOPRM /* дл  остальных орг.-ий пользователей
    END-IF
    END OF TRANSACTION
    KODIF_VO.RES_VO := 'Y'   /* ВО введена/отредактирована успешно
  END-IF
END-SUBROUTINE
*
END
