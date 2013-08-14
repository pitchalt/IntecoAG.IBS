* >Natural Source Header 000000 /*<RO>>
* :NatName ADDKBS
* :UID IEN
* :Mode S
* :CP
* :Date 20101115
* :Time 0918550
* <Natural Source Header /*<<RO>
DEFINE DATA
  PARAMETER
  1 RES_VO(A1)  /* 5 - перезапись / 4 - нова  запись/ 3 - удаление
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
  1 KEYKBS(A8)
  1 REDEFINE KEYKBS
    2 KBSOG(N5)  2 KBSBS(N3)
END-DEFINE
*
DEFINE SUBROUTINE ADDKBS
KEYOGOG(*) := ADKBSPRM.OG-ID
     KBSBS := ADKBSPRM.BS-ID
* выбор всех пользователей c кодом > 1000
HISTOGRAM OGUSER OG-KD > KEYOG
  KBSOG := OGKD(2)
/* удалить данные Б/Счёта дл  них
    IF RES_VO = '3'
F0.  FIND IBS-BS-FILE OG-BS = KEYKBS
     ACCEPT IF IBS-BS-FILE.SS-ID = 0 /* выбор Б/Счета
     PERFORM UPKBSREC
     DELETE(F0.)
     END-FIND
    END-IF
/* записать данные Б/Счёта дл  них если это новый Б/Счёт
    IF RES_VO = '4'
     PERFORM UPKBSREC
     STORE IBS-BS-FILE
    END-IF
/* обновить данные Б/Счёта дл  них если запись редактируетс
    IF RES_VO = '5'
F1.  FIND IBS-BS-FILE OG-BS = KEYKBS WHERE IBS-BS-FILE.SS-ID = 0 /* выбор Б/Счета
     IF NO RECORD     /* если была разсинхронизаци  с кодификатором 1000
      PERFORM UPKBSREC
      STORE IBS-BS-FILE
      ESCAPE BOTTOM(F1.)
     END-NOREC
     PERFORM UPKBSREC
     UPDATE(F1.)
     END-FIND
    END-IF
/* обновить данные С/Счётов по обновлению Б/Счёта дл  них если запись редактируетс
    IF RES_VO ='6'
F2.  FIND IBS-BS-FILE OG-BS = KEYKBS WHERE IBS-BS-FILE.SS-ID NE 0 /* выбор C/Счетов
     IF NO RECORD     /* если была разсинхронизаци  с кодификатором 1000
      PERFORM UPKBSREC
      STORE IBS-BS-FILE
      ESCAPE BOTTOM(F2.)
     END-NOREC
      ASSIGN IBS-BS-FILE.RZ-ID = ADKBSPRM.RZ-ID
      ASSIGN IBS-BS-FILE.AP-ID = ADKBSPRM.AP-ID
      ASSIGN IBS-BS-FILE.FL-BL = ADKBSPRM.FL-BL
*     ASSIGN IBS-BS-FILE.FL-AN = ADKBSPRM.FL-AN
*     ASSIGN IBS-BS-FILE.FL-DI = ADKBSPRM.FL-DI
*     ASSIGN IBS-BS-FILE.FL-PO = ADKBSPRM.FL-PO
      ASSIGN IBS-BS-FILE.PG-ID = ADKBSPRM.PG-ID
      ASSIGN IBS-BS-FILE.OG-ID = OGKD(2)
     UPDATE(F2.)
     END-FIND
    END-IF
END-HISTOGRAM
*
DEFINE SUBROUTINE UPKBSREC
MOVE BY NAME ADKBSPRM TO IBS-BS-FILE
 IBS-BS-FILE.OG-ID  := OGKD(2)
END-SUBROUTINE
*
END-SUBROUTINE
END
