* >Natural Source Header 000000 /*<RO>>
* :NatName SZAKILZ
* :UID MSA
* :Mode S
* :CP
* :Date 20050217
* :Time 1624330
* <Natural Source Header /*<<RO>
*
*  ВЕДЕНИЕ АРХИВА ЗАКАЗОВ ИЛ (ЗАКРЫТИЕ ЗАКАЗА)
*
DEFINE DATA
  PARAMETER
  1 OG-IDENT-G(N5)
  1 USR-G(A8)
  LOCAL USING ZAKIL     /* VIEW НА ФАЙЛ ZAKAZ
  LOCAL USING STEKL
  LOCAL
  1 IZK(A9)
  1 MNM(A250)
  1 REDEFINE MNM
    2 #NM(A50/5)
  1 DTZ(N8)
END-DEFINE
*
DEFINE SUBROUTINE SZAKILZ
*
SET KEY ALL
*
REPEAT
  INPUT USING MAP 'SZAKILM4'
  IF *PF-KEY = 'PF3'  ESCAPE BOTTOM  END-IF
  IF IZK = ' '  REINPUT 'Шифр заказа' ALARM  END-IF
Z1. FIND NUMBER ZAK-IL ZZ-F = IZK
  IF *NUMBER(Z1.) NE 0  REINPUT 'Заказ уже закрыт' ALARM  END-IF
Z2. FIND ZAK-IL ZK-F = IZK
    MNM := NM-F
  END-FIND
  IF *NUMBER(Z2.) = 0  REINPUT 'Заказ не существует' ALARM  END-IF
INPUT ';'
  REPEAT
    INPUT USING MAP 'SZAKILM5'
    IF *PF-KEY = 'PF3'  ESCAPE BOTTOM  END-IF
    IF DTZ = 0  DTZ := *DATN  END-IF
    IF DTZ NE MASK(YYYYMMDD)  REINPUT 'Дата' ALARM  END-IF
    IF *PF-KEY = 'PF5'
      FIND ZAK-IL ZK-F = IZK
        ZZ-F := ZK-F  RESET ZK-F
        DT-ZA := DTZ  #I := C*STATISTIC  ADD 1 TO #I
        ST-USR(#I) := USR-G  ST-DT(#I) := *DATN  ST-TM(#I) := *TIMN
        UPDATE
      END-FIND
      END OF TRANSACTION
    END-IF
  END-REPEAT
END-REPEAT
*
END-SUBROUTINE
*
END
