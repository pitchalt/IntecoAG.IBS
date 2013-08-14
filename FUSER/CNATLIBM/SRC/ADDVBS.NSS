* >Natural Source Header 000000 /*<RO>>
* :NatName ADDVBS
* :UID IEN
* :Mode S
* :CP
* :Date 20101115
* :Time 0918550
* <Natural Source Header /*<<RO>
DEFINE DATA
  PARAMETER
  1 RES_VO(A1)  /* 5 - перезапись / 4 - нова  запись/ 3 - удаление
  PARAMETER USING ADVBSPRM
  LOCAL USING LCLBS
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
  1 KEYVBS(A8)
  1 REDEFINE KEYVBS
    2 VBSOG(N5)  2 VBSBS(N3)
*
END-DEFINE
*
DEFINE SUBROUTINE ADDVBS
KEYOGOG(*) := ADVBSPRM.OG-ID
     VBSBS := ADVBSPRM.BS-ID
* выбор всех пользователей c кодом > 1000
HISTOGRAM OGUSER OG-KD > KEYOG
  VBSOG := OGKD(2)
/* обновить данные Статьи аналитики дл  них если запись редактируетс
    IF RES_VO = '5'
F1.  FIND VIEW_BS OG-BS = KEYVBS WHERE VIEW_BS.SS-ID = ADVBSPRM.SS-ID
     IF NO RECORD     /* если была разсинхронизаци  с кодификатором 1000
      PERFORM UPVBSREC
      STORE VIEW_BS
      ESCAPE BOTTOM(F1.)
     END-NOREC
     PERFORM UPVBSREC
     UPDATE(F1.)
     END-FIND
    END-IF
END-HISTOGRAM
*
DEFINE SUBROUTINE UPVBSREC
MOVE BY NAME ADVBSPRM TO VIEW_BS
 VIEW_BS.OG-ID  := OGKD(2)
END-SUBROUTINE
*
END-SUBROUTINE
END
