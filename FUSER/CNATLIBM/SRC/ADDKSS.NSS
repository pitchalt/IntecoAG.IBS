* >Natural Source Header 000000 /*<RO>>
* :NatName ADDKSS
* :UID IEN
* :Mode S
* :CP
* :Date 20101115
* :Time 0918550
* <Natural Source Header /*<<RO>
DEFINE DATA
  PARAMETER
  1 RES_VO(A1)  /* 5 - перезапись/ 4 - нова  запись/ 3 - удаление
  PARAMETER USING ADKBSPRM
  LOCAL USING LCLBSL
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
  1 KEYKSS(A10)
  1 REDEFINE KEYKSS
    2 KSSOG(N5)  2 KSSSS(N5)
END-DEFINE
*
DEFINE SUBROUTINE ADDKSS
KEYOGOG(*) := ADKBSPRM.OG-ID
     KSSSS := ADKBSPRM.SS-ID
* выбор всех пользователей c кодом > 1000
HISTOGRAM OGUSER OG-KD > KEYOG
  KSSOG := OGKD(2)
/* удалить данные С/Счёта дл  них
    IF RES_VO = '3'
F0.  FIND IBS-BS-FILE OG-SS = KEYKSS
     ACCEPT IF IBS-BS-FILE.SS-ID NE 0 /* выбор C/Счета
     PERFORM UPKSSREC
     DELETE(F0.)
     END-FIND
    END-IF
/* записать данные С/Счёта дл  них если это новый С/Счёт
    IF RES_VO = '4'
     PERFORM UPKSSREC
     STORE IBS-BS-FILE
    END-IF
/* обновить данные С/Счёта дл  них если запись редактируетс
    IF RES_VO = '5'
F1.  FIND IBS-BS-FILE OG-SS = KEYKSS WHERE IBS-BS-FILE.SS-ID NE 0 /* выбор С/Счетов
     IF NO RECORD     /* если была разсинхронизаци  с кодификатором 1000
      PERFORM UPKSSREC
      STORE IBS-BS-FILE
      ESCAPE BOTTOM(F1.)
     END-NOREC
     PERFORM UPKSSREC
     UPDATE(F1.)
     END-FIND
    END-IF
END-HISTOGRAM
*
DEFINE SUBROUTINE UPKSSREC
MOVE BY NAME ADKBSPRM TO IBS-BS-FILE
 IBS-BS-FILE.OG-ID  := OGKD(2)
END-SUBROUTINE
*
END-SUBROUTINE
END
