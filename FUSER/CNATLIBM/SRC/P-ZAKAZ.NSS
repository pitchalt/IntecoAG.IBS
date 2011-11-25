* >Natural Source Header 000000 /*<RO>>
* :NatName P-ZAKAZ
* :UID TIROD
* :Mode S
* :CP
* :Date 20080429
* :Time 0833330
* <Natural Source Header /*<<RO>
* просроченные заказы
DEFINE DATA
PARAMETER USING PRMNAVI
  LOCAL USING LCLZKL
  LOCAL USING STEKL
  LOCAL
  1 LEN-ST(B4) INIT < 75 >
  1 IBS(N5)
  1 INPUT-REC(A75/15)
  1 REDEFINE INPUT-REC
    2 #INPUT-REC(15)
      3 #ZK(A9)  3 #NM(A50)  3 #DT-OT(N8)  3 #DT-ZA(N8)
  1 C-DT(C/15)
END-DEFINE
DEFINE WINDOW WIN
SIZE 7 * 25
BASE 10 / 30
TITLE 'Укажите счет'
CONTROL SCREEN
DEFINE SUBROUTINE P-ZAKAZ
SET KEY ALL
SET WINDOW 'WIN'
INPUT(AD=MIL IP=OFF SG=OFF ZP=OFF) IBS
IF *PF-KEY = 'PF3'  ESCAPE ROUTINE  END-IF
IF IBS = 0  REINPUT 'Счет' MARK *IBS ALARM  END-IF
SET WINDOW OFF
CALL 'GTNX' XN1
XI := 5000  CALL 'GTSX' LEN-ST XI XN1
FIND ZAKAZ BS-F = IBS
  ACCEPT IF ZK-F NE ' ' AND DT-ZA <= *DATN
  ADD 1 TO IS1  XI := IS1  #ZK(1) := ZK-F  #NM(1) := NM-F
  #DT-OT(1) := DT-OT  #DT-ZA(1) := DT-ZA
  CALL 'RWSX' XI INPUT-REC(1) XW XN1
END-FIND
*
IF IS1 = 0  WRITE ////// 20T 'ПО СЧЕТУ' IBS 'НЕТ ПРОСРОЧЕННЫХ ЗАКАЗОВ'
  ELSE  #N := 1
  REPEAT
    #K := #N + 14  RESET #L C-DT(*)
    FOR #I #N #K
      ADD 1 TO #L
      IF #I <= IS1  XI := #I
      CALL 'RWSX' XI INPUT-REC(#L) XR XN1
        ELSE  RESET INPUT-REC(#L)
        C-DT(#L) := (AD=PN)
      END-IF
    END-FOR
    INPUT USING MAP 'NAVZKM9'
    IF *PF-KEY = 'PF3'  ESCAPE BOTTOM  END-IF
    FOR #I 1 15
      #L := #N + #I - 1
      IF #L <= IS1
        IF #DT-ZA(#I) NE MASK(YYYYMMDD)
          REINPUT 'Дата' MARK *#DT-ZA(#I) ALARM
        END-IF
        XI := #L  CALL 'RWSX' XI INPUT-REC(#I) XW XN1
      END-IF
    END-FOR
    IF *PF-KEY = 'PF5'  ESCAPE BOTTOM  END-IF
    IF *PF-KEY = 'PF7' AND #N > 15  ADD -15 TO #N  END-IF
    IF *PF-KEY = 'PF8' AND #K < IS1  ADD 15 TO #N  END-IF
  END-REPEAT
  IF *PF-KEY = 'PF5'
    FOR #I 1 IS1
      XI := #I  CALL 'RWSX' XI INPUT-REC(1) XR XN1
      FIND ZAKAZ ZK-F = #ZK(1)
        IF #DT-ZA(1) <= *DATN  ZZ-F := ZK-F  RESET ZK-F
          ELSE  DT-ZA := #DT-ZA(1)
        END-IF
        UPDATE
        END OF TRANSACTION
      END-FIND
    END-FOR
  END-IF
END-IF
CALL 'FRSX' XN1
END-SUBROUTINE
END
