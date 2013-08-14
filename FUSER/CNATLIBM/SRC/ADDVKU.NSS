* >Natural Source Header 000000 /*<RO>>
* :NatName ADDVKU
* :UID IEN
* :Mode S
* :CP
* :Date 20101115
* :Time 0918550
* <Natural Source Header /*<<RO>
DEFINE DATA
  PARAMETER
  1 RES_VO(A1)  /* 5 - перезапись/ 4 - нова  запись
  PARAMETER USING ADVKUPRM
  LOCAL USING LCLKUL
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
  1 KEYVKU(A16)
  1 REDEFINE KEYVKU
    2 VKUOG(N5)  2 VKUVA(A3) 2 VKUDT(N8)
END-DEFINE
*
DEFINE SUBROUTINE ADDVKU
KEYOGOG(*) := ADVKUPRM.OG-ID
* выбор всех пользователей c кодом > 1000
HISTOGRAM OGUSER OG-KD > KEYOG
/* перезаписать данные курса валют дл  них если запись редактируетс
    IF RES_VO = '5'
     VKUOG := OGKD(2)
     VKUVA := ADVKUPRM.VA-ID
     VKUDT := ADVKUPRM.DT-ID
F.   FIND IBS-VKU-FILE OG-VA-DT = KEYVKU
     IF NO RECORD     /* если была разсинхронизаци  с кодификатором 1000
      PERFORM UPVKUREC
      STORE IBS-VKU-FILE
      ESCAPE BOTTOM(F.)
     END-NOREC
     PERFORM UPVKUREC
     UPDATE(F.)
     END-FIND
      ELSE
/* записать данные курса валют дл  них если это нова  запись
     PERFORM UPVKUREC
     STORE IBS-VKU-FILE
    END-IF
END-HISTOGRAM
*
DEFINE SUBROUTINE UPVKUREC
MOVE BY NAME ADVKUPRM TO IBS-VKU-FILE
 IBS-VKU-FILE.OG-ID  := OGKD(2)
END-SUBROUTINE
*
END-SUBROUTINE
END
