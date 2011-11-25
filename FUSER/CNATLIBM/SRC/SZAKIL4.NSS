* >Natural Source Header 000000 /*<RO>>
* :NatName SZAKIL4
* :UID MSA
* :Mode S
* :CP
* :Date 20050623
* :Time 1653330
* <Natural Source Header /*<<RO>
*
*  ВЕДЕНИЕ АРХИВА ЗАКАЗОВ ИЛ
*
DEFINE DATA
  PARAMETER
  1 OG-IDENT-G(N5)
  1 USR-G(A8)
  1 #ISN(N7)
  1 #RW(A1)
  LOCAL USING ZAKIL     /* VIEW НА ФАЙЛ ZAKAZ
  LOCAL USING ZAKILW    /* VIEW НА ФАЙЛ ZAKAZ
  LOCAL USING STEKL      /* ОБЩИЕ ПЕРЕМЕННЫЕ
  LOCAL USING PRMHELP
  LOCAL USING LCLRECL        /* VIEW HA ФAЙЛ IBS-REC-FILE
  LOCAL USING LCLBSL
  LOCAL USING LCLPOL
  LOCAL USING LCLVOL
  LOCAL USING LCLVAL
  LOCAL USING CHREBCD
  LOCAL USING CHR1251
  LOCAL USING LCLFROL4
  LOCAL
  1 OPSYS(A3)  1 POSIT(N11)
  1 NM-OTV-PO(A44)  1 NM-VO(A44)  1 TTLWIN(A40)  1 X1(B4)
  1 #ST(N5/1:17,1:2)  1 C-RWM(C/17,2)  1 C-RW(C)
  1 NDS-NM(A25)  1 NM-O-ISP(A44)  1 NM-OSN-PRO(A32)
  1 NM-R-TE(A44)  1 NM-TR(A44)  1 NM-TS(A44)  1 NM-TZ(A44)
  1 NM-V-FI(A44)  1 NM-VD(A44)  1 KKK(A2)  1 I70(A70)
  1 RPO(N5)  1 RNM(A50)  1 #VA(A3/10)  1 #SU(N13.2/10)  1 #SR(N8/10)
  1 RNM30(A30)
  1 KEYSS(A10)
  1 REDEFINE KEYSS
    2 KEYSSOG(N5)
    2 KEYSSSS(N5)
  1 KEYVA(A8)
  1 REDEFINE KEYVA
    2 KEYVAOG(N5)
    2 KEYVAVA(A3)
END-DEFINE
DEFINE SUBROUTINE SZAKIL4
*
DEFINE WINDOW DOPWIN
  SIZE 14*60
  BASE 2/2
  TITLE TTLWIN
  CONTROL WINDOW
  FRAMED ON
*
DEFINE WINDOW DOPRT
  SIZE 10*75
  BASE 2/2
  TITLE TTLWIN
  CONTROL WINDOW
  FRAMED ON
*
DEFINE WINDOW WINVA
  SIZE 14*15
  BASE 2/2
  TITLE TTLWIN
  CONTROL WINDOW
  FRAMED ON
*
  SET KEY ALL
  IF #RW = 'R'  SET KEY PF5=OFF
    C-RW := C-RWM(*,*) := (AD=PD)
  END-IF
  OPSYS := *OPSYS
  INCLUDE DEFOPSYS
  KEYVAOG := OG-IDENT-G
  GET ZAK-IL #ISN
* ЗАПОЛНИТЬ НАИМЕНОВАНИЯ
  CALLNAT 'GETNMPO' OG-IDENT-G ZAK-IL.OTV-PODR RNM
  NM-OTV-PO := RNM
  CALLNAT 'GETNMVO' OG-IDENT-G ZAK-IL.KOD-VO RNM
  NM-VO := RNM
  IF ZAK-IL.S-RUK-TE-KD(1) IS (N5)  RPO := ZAK-IL.RUK-TE-KD(1)
    KKK := 'Z2'  CALLNAT 'GETNMVF' OG-IDENT-G RPO KKK RNM
    NM-R-TE := RNM
  END-IF
  IF ZAK-IL.S-OTV-ISP-KD(1) IS (N5)  RPO := ZAK-IL.OTV-ISP-KD(1)
    KKK := 'Z4'  CALLNAT 'GETNMVF' OG-IDENT-G RPO KKK RNM
    NM-O-ISP := RNM
  END-IF
  IF ZAK-IL.S-VID-FI(1) IS (N5)  RPO := ZAK-IL.#VID-FI(1)  KKK := 'Z3'
    CALLNAT 'GETNMVF' OG-IDENT-G RPO KKK RNM
    NM-V-FI := RNM
  END-IF
  IF ZAK-IL.S-OSN-KD(1) IS (N5)  RPO := ZAK-IL.OSN-KD(1)  KKK := 'Z6'
    CALLNAT 'GETNMVF' OG-IDENT-G RPO KKK RNM
    NM-OSN-PRO := RNM
  END-IF
  IF ZAK-IL.S-NDS-KD IS (N5)  RPO := ZAK-IL.NDS-KD  KKK := 'Z5'
    CALLNAT 'GETNMVF' OG-IDENT-G RPO KKK RNM
    NDS-NM := RNM
  END-IF
  IF ZAK-IL.S-TIP-VO IS (N5)  RPO := ZAK-IL.#TIP-VO  KKK := 'Z7'
    CALLNAT 'GETNMVF' OG-IDENT-G RPO KKK RNM
    NM-TZ := RNM
  END-IF
  IF ZAK-IL.S-TIP-SAM IS (N5)  RPO := ZAK-IL.#TIP-SAM  KKK := 'Z8'
    CALLNAT 'GETNMVF' OG-IDENT-G RPO KKK RNM
    NM-TS := RNM
  END-IF
  IF ZAK-IL.S-TIP-RAB IS (N5)  RPO := ZAK-IL.#TIP-RAB  KKK := 'Z9'
    CALLNAT 'GETNMVF' OG-IDENT-G RPO KKK RNM
    NM-TR := RNM
  END-IF
  IF ZAK-IL.S-VID-DEYAT IS (N5)  RPO := ZAK-IL.#VID-DEYAT  KKK := 'Z0'
    CALLNAT 'GETNMVF' OG-IDENT-G RPO KKK RNM
    NM-VD := RNM
  END-IF
  RESET #K
  FOR #I 1 17
    FOR #J 1 2
      ADD 1 TO #K   #ST(#I,#J) := ST-PL(#K)
    END-FOR
  END-FOR
  POSIT := 1
  REPEAT
    INPUT MARK POSIT USING MAP 'SZAKILM8'
    IF *PF-KEY = 'PF3'  ESCAPE BOTTOM  END-IF
    IF *PF-KEY = 'PF11'
      IF *CURS-FIELD = POS(KOD-VO)
        POSIT := POS(ZAK-IL.OSN-KD(1))
        CALLNAT 'SELVON' OG-IDENT-G KOD-VO RNM30
        IF *PF-KEY NE 'PF3'  NM-VO := RNM30  END-IF
      END-IF
      IF *CURS-FIELD = POS(OTV-PODR)
        POSIT := POS(ZAK-IL.RUK-TE-KD(1))
        CALLNAT 'SELPON' OG-IDENT-G OTV-PODR RNM30
        IF *PF-KEY NE 'PF3'  NM-OTV-PO := RNM30  END-IF
      END-IF
      IF *CURS-FIELD = POS(ZAK-IL.NDS-KD)  RESET I70
        POSIT := POS(ZAK-IL.#TIP-VO)
        CALLNAT 'SNAVND' ZAK-IL.NDS-KD I70 'R'
        IF *PF-KEY NE 'PF3'  NDS-NM := I70  END-IF
      END-IF
      IF *CURS-FIELD = POS(ZAK-IL.#TIP-VO)  RESET I70
        POSIT := POS(ZAK-IL.#TIP-SAM)
        CALLNAT 'SNAVTZ' ZAK-IL.#TIP-VO I70 'R'
        IF *PF-KEY NE 'PF3'  NM-TZ := I70  END-IF
      END-IF
      IF *CURS-FIELD = POS(ZAK-IL.#TIP-SAM)  RESET I70
        POSIT := POS(ZAK-IL.#TIP-RAB)
        CALLNAT 'SNAVSM' ZAK-IL.#TIP-SAM I70 'R'
        IF *PF-KEY NE 'PF3'  NM-TS := I70  END-IF
      END-IF
      IF *CURS-FIELD = POS(ZAK-IL.#TIP-RAB)  RESET I70
        POSIT := POS(ZAK-IL.#VID-DEYAT)
        CALLNAT 'SNAVTR' ZAK-IL.#TIP-RAB I70 'R'
        IF *PF-KEY NE 'PF3'  NM-TR := I70  END-IF
      END-IF
      IF *CURS-FIELD = POS(ZAK-IL.VAL-DG(1))  RESET I70
        POSIT := POS(ZAK-IL.VAL-PL(1))
        CALLNAT 'SELVA' I70 OG-IDENT-G
        IF *PF-KEY NE 'PF3'  ZAK-IL.VAL-DG(1) := I70  END-IF
      END-IF
      IF *CURS-FIELD = POS(ZAK-IL.VAL-PL(1))  RESET I70
        POSIT :=  POS(ZAK-IL.NDS-KD)
        CALLNAT 'SELVA' I70 OG-IDENT-G
        IF *PF-KEY NE 'PF3' ZAK-IL.VAL-PL(1) := I70  END-IF
      END-IF
      IF *CURS-FIELD = POS(ZAK-IL.#VID-DEYAT)  RESET I70
        POSIT := POS(#ST(1,1))
        CALLNAT 'SNAVVD' ZAK-IL.#VID-DEYAT I70 'R'
        IF *PF-KEY NE 'PF3' NM-VD := I70  END-IF
      END-IF
      IF *CURS-FIELD = POS(ZAK-IL.RUK-TE-KD(1))
        POSIT := POS(ZAK-IL.OTV-ISP-KD(1))
        RPO := ZAK-IL.RUK-TE-KD(1)  RESET I70
        CALLNAT 'SNAVRT' RPO I70 'R'
        IF *PF-KEY NE 'PF3' ZAK-IL.RUK-TE-KD(1) := RPO  NM-R-TE := I70  END-IF
      END-IF
      IF *CURS-FIELD = POS(ZAK-IL.OTV-ISP-KD(1))
        POSIT := POS(ZAK-IL.#VID-FI(1))
        RPO := ZAK-IL.OTV-ISP-KD(1)
        CALLNAT 'SNAVOI' RPO I70 'R'
        IF *PF-KEY NE 'PF3' ZAK-IL.OTV-ISP-KD(1) := RPO  NM-O-ISP := I70  END-IF
      END-IF
      IF *CURS-FIELD = POS(ZAK-IL.#VID-FI(1))  RESET I70
        POSIT := POS(KOD-VO)
        RPO := ZAK-IL.#VID-FI(1)
        CALLNAT 'SNAVVF' RPO I70 'R'
        IF *PF-KEY NE 'PF3' ZAK-IL.#VID-FI(1) := RPO  NM-V-FI := I70  END-IF
      END-IF
      IF *CURS-FIELD = POS(ZAK-IL.OSN-KD(1))  RESET I70
        POSIT := POS(ZAK-IL.OSN-ND(1))
        RPO := ZAK-IL.OSN-KD(1)
        CALLNAT 'SNAVOS' RPO I70 'R'
        IF *PF-KEY NE 'PF3' ZAK-IL.OSN-KD(1) := RPO  NM-OSN-PRO := I70  END-IF
      END-IF
      RESET #K
      FOR #I 1 17
        FOR #J 1 2
          IF *CURS-FIELD = POS(#ST(#I,#J))  RESET I70
          #L := #I + 1  IF #L > 17  #L := 1  END-IF
           POSIT := POS(#ST(#L,#J))
           RPO := ZAK-IL.OSN-KD(1)
            CALLNAT 'SELST' RPO I70 OG-IDENT-G
            IF *PF-KEY NE 'PF3'  #ST(#I,#J) := RPO   END-IF
            #K := 1
            ESCAPE BOTTOM
          END-IF
        END-FOR
        IF #K = 1  ESCAPE BOTTOM  END-IF
      END-FOR
      ESCAPE TOP
    END-IF
    IF ZAK-IL.RASP = ' '
      REINPUT 'Распор жение' MARK *ZAK-IL.RASP ALARM
    END-IF
    IF ZAK-IL.DT-RASP NE MASK(YYYYMMDD)
      REINPUT 'Дата' MARK *ZAK-IL.DT-RASP ALARM
    END-IF
    IF ZAK-IL.OTV-PODR = 0  RESET NM-OTV-PO
      REINPUT 'Подразделение' MARK *ZAK-IL.OTV-PODR ALARM
      ELSE  CALLNAT 'GETNMPO' OG-IDENT-G ZAK-IL.OTV-PODR RNM
      IF RNM = ' '
        REINPUT 'Неверный код подразделени ' MARK *ZAK-IL.OTV-PODR ALARM
      END-IF
      NM-OTV-PO := RNM
    END-IF
    IF ZAK-IL.RUK-TE-KD(1) = 0
      REINPUT 'Руководитель' MARK *ZAK-IL.RUK-TE-KD(1) ALARM
      ELSE  RPO := ZAK-IL.RUK-TE-KD(1)  KKK := 'Z2'
      CALLNAT 'GETNMVF' OG-IDENT-G RPO KKK RNM
      IF RNM = ' '
        REINPUT 'Неверный табельный номер' MARK *ZAK-IL.RUK-TE-KD(1) ALARM
      END-IF
      NM-R-TE := RNM
    END-IF
    IF ZAK-IL.OTV-ISP-KD(1) = 0
      REINPUT 'Исполнитель' MARK *ZAK-IL.OTV-ISP-KD(1) ALARM
      ELSE  RPO := ZAK-IL.OTV-ISP-KD(1)  KKK := 'Z4'
      CALLNAT 'GETNMVF' OG-IDENT-G RPO KKK RNM
      IF RNM = ' '
        REINPUT 'Неверный табельный номер' MARK *OTV-ISP-KD(1) ALARM
      END-IF
      NM-R-TE := RNM
    END-IF
    IF ZAK-IL.#VID-FI(1) = 0
      REINPUT 'Вид финанс.' MARK *ZAK-IL.#VID-FI(1) ALARM
      ELSE  RPO := ZAK-IL.#VID-FI(1)  KKK := 'Z3'
      CALLNAT 'GETNMVF' OG-IDENT-G RPO KKK RNM
      IF RNM = ' '
        REINPUT 'Неверный вид финансировани ' MARK *ZAK-IL.#VID-FI(1) ALARM
      END-IF
      NM-V-FI := RNM
    END-IF
    IF ZAK-IL.KOD-VO = 0
      REINPUT 'Заказчик' MARK *ZAK-IL.KOD-VO ALARM
      ELSE  CALLNAT 'GETNMVO' OG-IDENT-G ZAK-IL.KOD-VO RNM
      IF RNM = ' '
        REINPUT 'Неверный код заказчика' MARK *ZAK-IL.KOD-VO ALARM
      END-IF
      NM-VO := RNM
    END-IF
    IF ZAK-IL.OSN-KD(1) = 0
      REINPUT 'Основание' MARK *ZAK-IL.OSN-KD(1) ALARM
      ELSE  RPO := ZAK-IL.OSN-KD(1)  KKK := 'Z6'
      CALLNAT 'GETNMVF' OG-IDENT-G RPO KKK RNM
      IF RNM = ' '
        REINPUT 'Неверный код основани ' MARK *ZAK-IL.OSN-KD(1) ALARM
      END-IF
      NM-OSN-PRO := RNM
    END-IF
    IF ZAK-IL.SR-S NE MASK(YYYYMMDD)
      REINPUT 'Дата' MARK *ZAK-IL.SR-S ALARM
    END-IF
    IF ZAK-IL.SR-PO NE MASK(YYYYMMDD)
      REINPUT 'Дата' MARK *ZAK-IL.SR-PO ALARM
    END-IF
    IF ZAK-IL.VAL-PL(1) = ' '  ZAK-IL.VAL-PL(1) := SYS-RUB  END-IF
    IF ZAK-IL.VAL-DG(1) = ' '  ZAK-IL.VAL-DG(1) := SYS-RUB  END-IF
    IF ZAK-IL.VAL-PL(1) NE SYS-RUB
      KEYVAVA := ZAK-IL.VAL-PL(1)
      FIND NUMBER IBS-KVA-FILE OG-VA = KEYVA
      IF *NUMBER = 0
        REINPUT 'Неверный код валюты' MARK *ZAK-IL.VAL-PL(1) ALARM
      END-IF
    END-IF
    IF ZAK-IL.VAL-DG(1) NE SYS-RUB
      KEYVAVA := ZAK-IL.VAL-DG(1)
      FIND NUMBER IBS-KVA-FILE OG-VA = KEYVA
      IF *NUMBER = 0
        REINPUT 'Неверный код валюты' MARK *ZAK-IL.VAL-DG(1) ALARM
      END-IF
    END-IF
    IF ZAK-IL.NDS-KD = 0
      REINPUT 'НДС' MARK *ZAK-IL.NDS-KD ALARM
      ELSE  KKK := 'Z5'  CALLNAT 'GETNMVF' OG-IDENT-G ZAK-IL.NDS-KD KKK RNM
      IF RNM = ' '
        REINPUT 'Неверный код основани ' MARK *ZAK-IL.NDS-KD ALARM
      END-IF
      NDS-NM := RNM
    END-IF
    IF ZAK-IL.#TIP-VO = 0
      REINPUT 'Тип' MARK *ZAK-IL.#TIP-VO ALARM
      ELSE  KKK := 'Z7'  CALLNAT 'GETNMVF' OG-IDENT-G ZAK-IL.#TIP-VO KKK RNM
      IF RNM = ' '
        REINPUT 'Неверный тип' MARK *ZAK-IL.#TIP-VO  ALARM
      END-IF
      NM-TZ := RNM
    END-IF
    IF ZAK-IL.#TIP-SAM = 0
      REINPUT 'Тип' MARK *ZAK-IL.#TIP-SAM ALARM
      ELSE  KKK := 'Z8'  CALLNAT 'GETNMVF' OG-IDENT-G ZAK-IL.#TIP-SAM KKK RNM
      IF RNM = ' '
        REINPUT 'Неверный тип' MARK *ZAK-IL.#TIP-SAM  ALARM
      END-IF
      NM-TS := RNM
    END-IF
    IF ZAK-IL.#TIP-RAB = 0
      REINPUT 'Тип' MARK *ZAK-IL.#TIP-RAB ALARM
      ELSE  KKK := 'Z9'  CALLNAT 'GETNMVF' OG-IDENT-G ZAK-IL.#TIP-RAB KKK RNM
      IF RNM = ' '
        REINPUT 'Неверный тип' MARK *ZAK-IL.#TIP-RAB  ALARM
      END-IF
      NM-TR := RNM
    END-IF
    IF ZAK-IL.#VID-DEYAT = 0
      REINPUT 'Вид' MARK *ZAK-IL.#VID-DEYAT ALARM
      ELSE  KKK := 'Z0'  CALLNAT 'GETNMVF' OG-IDENT-G ZAK-IL.#VID-DEYAT KKK RNM
      IF RNM = ' '
        REINPUT 'Неверный вид' MARK *ZAK-IL.#VID-DEYAT ALARM
      END-IF
      NM-VD := RNM
    END-IF
    FOR #I 1 17
      FOR #J 1 2
        IF #ST(#I,#J) NE 0
          RPO := #ST(#I,#J)  CALLNAT 'GETNMST' OG-IDENT-G RPO RNM
          IF RNM = ' '
            REINPUT 'Неверный код статьи' MARK *#ST(#I,#J) ALARM
          END-IF
        END-IF
      END-FOR
    END-FOR
    IF *PF-KEY = 'PF4'
      IF *CURS-FIELD = POS(ZAK-IL.VAL-PL(1)) OR = POS(ZAK-IL.VAL-DG(1))
        SET WINDOW 'WINVA'
        IF *CURS-FIELD = POS(ZAK-IL.VAL-PL(1))
          POSIT := POS(ZAK-IL.VAL-PL(1))
          #VA(*) := ZAK-IL.VAL-PL(*)  TTLWIN := 'Валюты платежа'
          ELSE  #VA(*) := ZAK-IL.VAL-DG(*)  TTLWIN := 'Валюты договора'
          POSIT := POS(ZAK-IL.VAL-DG(1))
        END-IF
        REPEAT
          INPUT USING MAP 'SZAKIM7'
          IF *PF-KEY = 'PF11'
            FOR #J 1 10
              IF *CURS-FIELD = POS(#VA(#J))  RESET I70
                CALLNAT 'SELVA' I70 OG-IDENT-G
                #VA(#J) := I70
                ESCAPE BOTTOM
              END-IF
            END-FOR
            ESCAPE TOP
          END-IF
          FOR #J 1 10
            IF #VA(#J) NE ' ' AND #VA(#J) NE SYS-RUB
              KEYVAVA := #VA(#J)
V1.           FIND NUMBER IBS-KVA-FILE OG-VA = KEYVA
              IF *NUMBER(V1.) = 0
                IF *PF-KEY NE 'PF3'
                  REINPUT 'Неверный код валюты' MARK *#VA(#J) ALARM
                END-IF
              END-IF
            END-IF
          END-FOR
          IF *PF-KEY = 'PF3' OR = 'PF5'  ESCAPE BOTTOM  END-IF
        END-REPEAT
        IF *PF-KEY = 'PF5'
          IF TTLWIN = 'Валюты платежа'  ZAK-IL.VAL-PL(*) := #VA(*)
            ELSE  ZAK-IL.VAL-DG(*) := #VA(*)
          END-IF
        END-IF
        SET WINDOW OFF  SET CONTROL 'K0'
      END-IF
      IF  *CURS-FIELD = POS(ZAK-IL.SROK-ISP-T(1)) OR = POS(ZAK-IL.SROK-VIP-T(1))
        IF *CURS-FIELD = POS(ZAK-IL.SROK-ISP-T(1))  TTLWIN := 'Сроки по оплате'
          #SR(*) := ZAK-IL.#SROK-ISP-T(*)  #SU(*) := ZAK-IL.SROK-ISP-SU(*)
          POSIT := POS(ZAK-IL.SROK-ISP-T(1))
          ELSE  TTLWIN := 'Сроки по поставке'
          #SR(*) := ZAK-IL.#SROK-VIP-T(*)  #SU(*) := ZAK-IL.SROK-VIP-SU(*)
          POSIT := POS(ZAK-IL.SROK-VIP-T(1))
        END-IF
        SET WINDOW 'DOPWIN'
        REPEAT
          INPUT USING MAP 'SZAKILM2'
          IF *PF-KEY = 'PF3'  ESCAPE BOTTOM  END-IF
          IF *PF-KEY = 'PF5'
            IF TTLWIN = 'Сроки по оплате'
              ZAK-IL.SROK-ISP-T(*) := #SR(*)  ZAK-IL.SROK-ISP-SU(*) := #SU(*)
              ELSE  ZAK-IL.SROK-VIP-T(*) := #SR(*)  ZAK-IL.SROK-VIP-SU(*) := #SU(*)
            END-IF
            ESCAPE BOTTOM
          END-IF
        END-REPEAT
        SET WINDOW OFF  SET CONTROL 'K0'
      END-IF
    END-IF
    IF *PF-KEY = 'PF5'
Z1.   GET ZAK-ILW #ISN
      MOVE BY NAME ZAK-IL TO ZAK-ILW
      #I := C*STATISTIC  ADD 1 TO #I
      IF #I > 50  PERFORM CMPR  END-IF
      RESET #K
      FOR #I 1 17
        FOR #J 1 2
          ADD 1 TO #K  ST-PL(#K) := #ST(#I,#J)
        END-FOR
      END-FOR
      IF ZAK-ILW.DT-ZA NE 0 AND ZAK-ILW.ZK-F NE ' '
        ZAK-ILW.ZZ-F := ZAK-ILW.ZK-F  RESET ZAK-ILW.ZK-F
      END-IF
      IF ZAK-IL.DT-ZA = 0 AND ZAK-ILW.ZK-F = ' '
        ZAK-ILW.ZK-F := ZAK-ILW.ZZ-F  RESET ZAK-ILW.ZZ-F
      END-IF
      ST-USR(#I) := USR-G  ST-DT(#I) := *DATN  ST-TM(#I) := *TIMN
      UPDATE(Z1.)
      END OF TRANSACTION
    END-IF
  END-REPEAT
  SET CONTROL 'K0'
*
DEFINE SUBROUTINE CMPR
  FOR #L 2 50
    #M := #L - 1
    ZAK-IL.ST-USR(#M) := ZAK-IL.ST-USR(#L)
    ZAK-IL.ST-DT(#M) := ZAK-IL.ST-DT(#L)
    ZAK-IL.ST-TM(#M) := ZAK-IL.ST-TM(#L)
  END-FOR
END-SUBROUTINE
*
END-SUBROUTINE
END
