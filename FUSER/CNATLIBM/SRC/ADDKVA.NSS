* >Natural Source Header 000000 /*<RO>>
* :NatName ADDKVA
* :UID !!TEST!!
* :Mode S
* :CP
* :Date 20101115
* :Time 0838480
* <Natural Source Header /*<<RO>
DEFINE DATA
  PARAMETER
  1 RES_VO(A1) /* 5 - перезапись/ 4 - нова  запись/ 3 - удаление
  PARAMETER USING ADKVAPRM
  LOCAL USING LCLVAL
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
  1 KEYKVA(A8)
  1 REDEFINE KEYKVA
    2 KVAOG(N5)  2 KVAVA(A3)
END-DEFINE
*
DEFINE SUBROUTINE ADDKVA
KEYOGOG(*) := ADKVAPRM.OG-ID
* выбор всех пользователей c кодом > 1000
HISTOGRAM OGUSER OG-KD > KEYOG
/* удалить данные валют дл  них
    IF RES_VO = '3'
D.  FIND IBS-KVA-FILE OG-VV = KEYKVA
     PERFORM UPKVAREC
     DELETE(D.)
     END-FIND
    END-IF
/* перезаписать данные валют дл  них если запись редактируетс
    IF RES_VO = '5'
     KVAOG := OGKD(2)
     KVAVA := ADKVAPRM.VV-ID
F.   FIND IBS-KVA-FILE OG-VV = KEYKVA
     IF NO RECORD     /* если была разсинхронизаци  с кодификатором 1000
      PERFORM UPKVAREC
      STORE IBS-KVA-FILE
      ESCAPE BOTTOM(F.)
     END-NOREC
     PERFORM UPKVAREC
     UPDATE(F.)
     END-FIND
      ELSE
/* записать данные валют дл  них если это нова  запись
     PERFORM UPKVAREC
     STORE IBS-KVA-FILE
    END-IF
END-HISTOGRAM
*
DEFINE SUBROUTINE UPKVAREC
MOVE BY NAME ADKVAPRM TO IBS-KVA-FILE
 IBS-KVA-FILE.OG-ID  := OGKD(2)
END-SUBROUTINE
*
END-SUBROUTINE
END
