* >Natural Source Header 000000 /*<RO>>
* :NatName ZK-ST
* :UID MSA
* :Mode S
* :CP
* :Date 20050219
* :Time 2031330
* <Natural Source Header /*<<RO>
* ПРОСМОТР СТАТИСТИКИ ИЗМЕНЕНИЙ ЗАКАЗОВ
DEFINE DATA
  PARAMETER
  1 #ISN(N7)
  LOCAL USING ZAKIL     /* VIEW НА ФАЙЛ ZAKAZ
  LOCAL USING STEKL
  LOCAL
  1 USR(A8/10)  1 #DT(N8/10)  1 #TM(A5/10)
  1 RTM(N7)
  1 REDEFINE RTM
    2 TMHH(A2)  2 TMMM(A2)
END-DEFINE
*
DEFINE SUBROUTINE ZK-ST
*
DEFINE WINDOW W-ST
  SIZE 14*30
  BASE 4/40
  TITLE 'Статистика изменений'
  CONTROL WINDOW
  FRAMED ON
*
SET WINDOW 'W-ST'
SET KEY ALL
IF #ISN NE 0
  GET ZAK-IL #ISN
END-IF
#N := 1
REPEAT
  #K := #N + 9  RESET #L
  FOR #I #N #K
    ADD 1 TO #L
    IF #I <= C*STATISTIC
      USR(#L) := ST-USR(#L)  #DT(#L) := ST-DT(#L)  RTM := ST-TM(#L)
      COMPRESS TMHH ':' TMMM INTO #TM(#L) LEAVING NO
      ELSE  RESET USR(#L)  #DT(#L)  #TM(#L)
    END-IF
  END-FOR
  INPUT USING MAP 'SZAKILM9'
  IF *PF-KEY = 'PF3'  ESCAPE BOTTOM  END-IF
  IF *PF-KEY = 'PF7' AND #N > 10  #N := #N - 10  END-IF
  IF *PF-KEY = 'PF8' AND #K < C*STATISTIC  ADD 10 TO #N  END-IF
END-REPEAT
SET WINDOW OFF
*
END-SUBROUTINE
*
END
