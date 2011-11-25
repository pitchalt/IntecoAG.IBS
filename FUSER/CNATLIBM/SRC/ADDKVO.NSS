* >Natural Source Header 000000 /*<RO>>
* :NatName ADDKVO
* :UID IEN
* :Mode S
* :CP
* :Date 20101115
* :Time 0918550
* <Natural Source Header /*<<RO>
DEFINE DATA
  PARAMETER
  1 RES_VO(A1) /* 5 - перезапись/ 4 - нова  запись
  PARAMETER USING ADKVOPRM
  LOCAL
  1 IBS-KVO-FILE VIEW OF IBS-SYS-FILE
    2 OG-ID  2 VO-ID
    2 NM-OG
    2 REDEFINE NM-OG
      3 NM-OG1(A40)  3 NM-OG2(A40)
    2 AD-OG  2 NN-ID  2 RE-OG
    2 VO-DI(1:5)  2 NM-PL
    2 UP-DT(D)  2 UP-PG  2 UP-ID  2 UP-US
    2 VO-NM-SH(1:50)  2 NA-F
    2 CT-F  2 ST-F
    2 C*PR-ID  2 C*RS-OG(1:15)  2 C*RS-VA(1:15)
    2 PR-ID(1:15)
      3 BN-OG  3 RS-OG(1:15)  3 RS-VA(1:15)
    2 FL-DG
*
  1 OGUSER VIEW OF IBS-SYS-FILE
    2 OG-KD
    2 REDEFINE OG-KD
    3 OGKD(N5/2)
*
  1 KEYOG(A10)
  1 REDEFINE KEYOG
    2 KEYOGOG(N5/2)
*
  1 KEYVO(A10)
  1 REDEFINE KEYVO
    2 KEYVOOG(N5)  2 KEYVOVO(N5)
END-DEFINE
*
DEFINE SUBROUTINE ADDKVO
KEYOGOG(*) := ADKVOPRM.OG-ID
* выбор всех пользователей c кодом > 1000
HISTOGRAM OGUSER OG-KD > KEYOG
/* перезаписать данные ВО дл  них если запись редактируетс
    IF RES_VO = '5'
     KEYVOOG := OGKD(2)
     KEYVOVO := ADKVOPRM.VO-ID
F.   FIND IBS-KVO-FILE OG-VO = KEYVO
     IF NO RECORD     /* если была разсинхронизаци  с кодификатором 1000
      PERFORM UPKVOREC
      STORE IBS-KVO-FILE
      ESCAPE BOTTOM(F.)
     END-NOREC
     PERFORM UPKVOREC
     UPDATE(F.)
     END-FIND
      ELSE
/* записать данные ВО дл  них если это нова  ВО
     PERFORM UPKVOREC
     STORE IBS-KVO-FILE
    END-IF
END-HISTOGRAM
*
DEFINE SUBROUTINE UPKVOREC
MOVE BY NAME ADKVOPRM TO IBS-KVO-FILE
 IBS-KVO-FILE.OG-ID  := OGKD(2)
END-SUBROUTINE
*
END-SUBROUTINE
END
