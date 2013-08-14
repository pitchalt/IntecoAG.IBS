* >Natural Source Header 000000 /*<RO>>
* :NatName SELHNDLR
* :UID T_IEN
* :Mode S
* :CP
* :Date 20091216
* :Time 1014330
* <Natural Source Header /*<<RO>
DEFINE DATA
PARAMETER
1 OG-USER(N5)
* На входе #TYP - идент.-р кодификатора
*          #DAT - пусто
1 #TYP(A3)
1 #DAT(A250)
LOCAL USING STAN19L
LOCAL
1 #TMP(A250)
1 REDEFINE #TMP 2 COD-ZK(A9) 2 NM-ZK(A30) /* заказы
1 REDEFINE #TMP 2 COD-PO(N5) 2 NM-PO(A30) /* подразделени
1 REDEFINE #TMP 2 CDST(N5)   2 NMST(A30)  /* код аналитики ZT,19,SK
1 REDEFINE #TMP 2 INDATA(A70)             /* валюты
1 REDEFINE #TMP 2 COD-VO(N5) 2 NM-VO(A30) /* внешние организации
1 REDEFINE #TMP 2 COD-TN(N5) 2 COD-NM(A30)/* табельный номер
1 REDEFINE #TMP 2 COD-SS(N5) 2 NM-SS(A70) /* субсчета
1 REDEFINE #TMP 2 COD-ST(N5) 2 NM-ST(A70) /* статьи затрат
END-DEFINE
* По #TYP вызывает подпрограмму ведени
* соответствующего кодификатора.
* Может возвращать в  #DAT
* (зависит от подпрограммы ведени )
* выбранный код и наименование.
DEFINE SUBROUTINE SELHNDLR
  DECIDE ON FIRST VALUE OF #TYP
   VALUE 'ZAK' /* заказы
    COD-ZK := #DAT
    CALLNAT 'SELZAKN' OG-USER COD-ZK NM-ZK
    IF *PF-KEY = 'PF3' THEN RESET COD-ZK END-IF
   VALUE 'POD' /* подразделени
    CALLNAT 'SELPON'  OG-USER COD-PO NM-PO
    IF *PF-KEY = 'PF3' THEN RESET COD-PO END-IF
   VALUE 'NZT' /* расходование
    CALLNAT 'SELSTAN' OG-USER STANZT CDST NMST
    IF *PF-KEY = 'PF3' THEN RESET CDST END-IF
   VALUE 'N19' /* ндс
    CALLNAT 'SELSTAN' OG-USER STAN19 CDST NMST
    IF *PF-KEY = 'PF3' THEN RESET CDST END-IF
   VALUE 'NSK' /* склад
    CALLNAT 'SELSTAN' OG-USER STANSK CDST NMST
    IF *PF-KEY = 'PF3' THEN RESET CDST END-IF
   VALUE 'VAL' /* валюты
    CALLNAT 'SELVA'   INDATA OG-USER
   VALUE 'VOR' /* внешние организации
    CALLNAT 'SELVON'  OG-USER COD-VO NM-VO
    IF *PF-KEY = 'PF3' THEN RESET COD-VO END-IF
   VALUE 'TBN' /* табельный номер
    CALLNAT 'SELTBN'  OG-USER COD-TN COD-NM
    IF *PF-KEY = 'PF3' THEN RESET COD-TN END-IF
   VALUE 'BSS' /* субсчета
    CALLNAT 'SELBSBS' OG-USER COD-SS NM-SS
    IF *PF-KEY = 'PF3' THEN RESET COD-SS END-IF
   VALUE 'STZ' /* статьи затрат
    CALLNAT 'SELSTZ'   COD-ST NM-ST  OG-USER
    IF *PF-KEY = 'PF3' THEN RESET COD-ST END-IF
* ...
   ANY VALUE
    #DAT := #TMP
   NONE IGNORE
  END-DECIDE
END-SUBROUTINE
END
