* >Natural Source Header 000000 /*<RO>>
* :NatName ADDKST
* :UID IEN
* :Mode S
* :CP
* :Date 20101115
* :Time 0918550
* <Natural Source Header /*<<RO>
DEFINE DATA
  PARAMETER
  1 RES_VO(A1)  /* 5 - перезапись / 4 - нова  запись/ 3 - удаление
  PARAMETER USING ADKSTPRM
  LOCAL USING LCLSTAT
*
  LOCAL
  1 OGUSER VIEW OF IBS-SYS-FILE
    2 OG-KD
    2 REDEFINE OG-KD
    3 OGKD(N5/2)
*
  1 KEYOG(A10)
  1 REDEFINE KEYOG
    2 KEYOGOG(N5/2)
*
  1 KEYOGCS(A16)
  1 REDEFINE KEYOGCS
    2 CSOG(N5) 2 CSCT(N6) 2 CSST(A5)
  1 KEYOGST(A16)
  1 REDEFINE KEYOGST
    2 STOG(N5) 2 STST(A5) 2 STCT(N6)
*
END-DEFINE
*
DEFINE SUBROUTINE ADDKST
KEYOGOG(*) := ADKSTPRM.OG-ID
* выбор всех пользователей c кодом > 1000
HISTOGRAM OGUSER OG-KD > KEYOG
  STOG := CSOG := OGKD(2)
  STST := CSST := ADKSTPRM.ST-F
  STCT := CSCT := ADKSTPRM.CT-F
/* удалить данные Статьи аналитики дл  них
    IF RES_VO = '3'
F0.  FIND VIEWSTAT OG-ST = KEYOGST
     PERFORM UPKSTREC
     DELETE(F0.)
     END-FIND
    END-IF
/* записать данные Статьи аналитики дл  них если это новые данные
    IF RES_VO = '4'
     PERFORM UPKSTREC
     STORE VIEWSTAT
    END-IF
/* обновить данные Статьи аналитики дл  них если запись редактируетс
    IF RES_VO = '5'
F1.  FIND VIEWSTAT OG-CS = KEYOGCS
     IF NO RECORD     /* если была разсинхронизаци  с кодификатором 1000
      PERFORM UPKSTREC
      STORE VIEWSTAT
      ESCAPE BOTTOM(F1.)
     END-NOREC
     PERFORM UPKSTREC
     UPDATE(F1.)
     END-FIND
    END-IF
END-HISTOGRAM
*
DEFINE SUBROUTINE UPKSTREC
MOVE BY NAME ADKSTPRM TO VIEWSTAT
 VIEWSTAT.OG-ID  := OGKD(2)
END-SUBROUTINE
*
END-SUBROUTINE
END
