* >Natural Source Header 000000 /*<RO>>
* :NatName SNAVPSWA
* :UID MSA
* :Mode S
* :CP
* :Date 20070701
* :Time 1225330
* <Natural Source Header /*<<RO>
**********************************************************************
*                                                                    *
*   ¬≈ƒ≈Õ»≈ ƒŒ—“”œ¿                                                  *
*                                                                    *
**********************************************************************
DEFINE DATA
  PARAMETER USING PSWPRM
  LOCAL USING CONFL
  LOCAL USING PSWVIEW
  LOCAL USING STEKL
  LOCAL
  1 STPGM(A79)
  1 REDEFINE STPGM
    2 STSYST(A10)
    2 PGM(A8)
    2 NMPGM(A30)
    2 NMMENU(A30)
    2 STACC(A1)
  1 REDEFINE STPGM
    2 PUS(B1)
  1 STUSR(A170)
  1 REDEFINE STUSR
    2 STSYST(A10/10)
    2 USR(A8)
    2 NMUSR(A50)
    2 PSW(A10)
    2 STNUM(N2)
  1 REDEFINE STUSR
    2 PUS(B1)
  1 INPUT-REC(A170/1:15)
  1 REDEFINE INPUT-REC
    2 #INPUT-REC(15)
     3 #FIELD-05(A10/10)  /* —»—“≈Ã€
     3 #FIELD-01(A8)      /* KOƒ
     3 #FIELD-02(A50)     /* O¡O«HA◊EH»E
     3 #FIELD-03(A10)     /* œ¿–ŒÀ‹
     3 #FIELD-04(N2)      /*  ŒÀ-¬Œ —»—“≈Ã
  1 FUN-NM-G(A060)  1 REG-NM-G(A040)  1 SYS-NM-G(A060)  1 POS2(N7)
  1 #NMPGM(A30/10)  1 ACC(A1/10)  1 C-ACC(C/10)  1 #PSW(A8)  1 MRK(I4)
  1 #NM-MENU(A30/10)  1 OPSW(A8)  1 RPSW(A8)
  1 X1(B4)  1 #SYST(A10)
  1 MSYST(A10/10)  1 M-TY(A1/10)  1 C-TY(C/10)
  1 CSYST(A10/10) CONST < 'ASUM', 'UOC', 'UFRO', 'UZP', 'SU', 'PPD',
                          'ADS' >
  1 STEK3(A12)
  1 REDEFINE STEK3
    2 STSYST(A10)
    2 STNUM(N2)
  1 REDEFINE STEK3
    2 PUS(B1)
  1 C-PSW(C)
  1 #POVT(A30)  1 FLGN(N1)
  1 K-PSW(A31)
  1 REDEFINE K-PSW
    2 P-OG(N5)  2 P-SY(A5)  2 P-TP(A5)  2 P-OB(A16)
  1 K-SY(A18)
  1 REDEFINE K-SY
    2 S-OG(N5)  2 S-SY(A5)  2 S-US(A8)
    1 FLGO(N1)  1 FLGP(N1)
END-DEFINE
DEFINE SUBROUTINE SNAVPSWA
DEFINE WINDOW WIN1
  SIZE 15*70
  BASE 5 / 5
  TITLE 'œÂÂ˜ÂÌ¸ ÙÛÌÍˆËÈ'
  CONTROL SCREEN
  FRAMED ON POSITION OFF
DEFINE WINDOW WIN2
  SIZE 7*35
  BASE 5 / 20
  TITLE 'œ‡ÓÎ¸'
  CONTROL SCREEN
  FRAMED ON POSITION OFF
DEFINE WINDOW WIN3
  SIZE 15*40
  BASE 5 / 20
  TITLE 'œÂÂ˜ÂÌ¸ ÒËÒÚÂÏ'
  CONTROL SCREEN
  FRAMED ON POSITION OFF
SYS-NM-G := '                          Õ¿—“–Œ… ¿ —»—“≈Ã€'
REG-NM-G := '                  ¬≈ƒ≈Õ»≈ ƒŒ—“”œ¿'
CALL 'GTNX' XR
XN1 := XR
XI := 79  XW := 5000  CALL 'GTSX' XI XW XN1
CALL 'GTNX' XR
XN2 := XR  XI := 168  CALL 'GTSX' XI XW XN2
CALL 'GTNX' XR
XN3 := XR
XN3 := XR  XI := 12  CALL 'GTSX' XI XW XN3
CALL 'GTNX' XR
XN4 := XR
XI := 49  XW := 500  CALL 'GTSX' XI XW XN4
XW := 1  XR := 0  IS1 := IS2 := 0
C-TY(8:10) := (AD=PN)
* —Œ—“¿¬ —»—“≈Ã
READ IBS-CONF-FILE
  ACCEPT IF IBS-CONF-FILE.OG-POLZ = SKEY.ORG AND POLZOV = POLZ
  STPGM.STSYST := IBS-CONF-FILE.SYST
  FOR #I 1 C*SOSTAV
    STPGM.PGM := IBS-CONF-FILE.PGM(#I)
    STPGM.NMPGM := IBS-CONF-FILE.NM-PGM(#I)
    STPGM.NMMENU := IBS-CONF-FILE.NM-MENU
    ADD 1 TO IS1  XI := IS1
    CALL 'RWSX' XI STPGM XW XN1
  END-FOR
END-READ
* œŒÀ‹«Œ¬¿“≈À»
READ PSWVIEW WHERE OG-ID EQ ORG AND RTYPE EQ 'USER'
AND PSWVIEW.OBJ-ID NE ' '
  STUSR.USR := PSWVIEW.OBJ-ID  STUSR.NMUSR := PSWVIEW.STR(1)
  STUSR.PSW := FLDA1  FLGN := 1
  XI := 101  X1 := 8  CALL 'CMPXF' USR XI X1 XN2
  IF XI = 0  ADD 1 TO IS2  XI := IS2
    RESET STUSR.STSYST(*) STUSR.STNUM
    ELSE  CALL 'RWSX' XI STUSR XR XN2
  END-IF
  FOR #I 1 10
    IF STUSR.STSYST(#I) = ' '  STUSR.STSYST(#I) := PSWVIEW.SYST
      ADD 1 TO STUSR.STNUM  ESCAPE BOTTOM
    END-IF
  END-FOR
  CALL 'RWSX' XI STUSR XW XN2
END-READ
*
MRK := #N := 1
REPEAT
  #K := #N + 14  RESET #L
  FOR #I #N #K
    ADD 1 TO #L
    IF #I <= IS2  XI := #I  CALL 'RWSX' XI STUSR XR XN2
      #FIELD-01(#L) := STUSR.USR  #FIELD-02(#L) := STUSR.NMUSR
      #FIELD-03(#L) := STUSR.PSW  #FIELD-04(#L) := STUSR.STNUM
      #FIELD-05(#L,*) := STUSR.STSYST(*)
      RESET #FIELD-04(#L)
      FOR #J 1 10
        IF STUSR.STSYST(#J) NE ' '  ADD 1 TO #FIELD-04(#L) END-IF
      END-FOR
      ELSE  RESET #FIELD-01(#L) #FIELD-02(#L) #FIELD-03(#L)
      #FIELD-04(#L) #FIELD-05(#L,*)
    END-IF
  END-FOR
  SET KEY OFF
  SET KEY ON
  SET KEY PF3 PF5 PF6 PF7 PF8 PF9 PF10 PF11
  INPUT MARK MRK USING MAP 'NAVPSWM5'
  IF *PF-KEY = 'PF3'  ESCAPE BOTTOM  END-IF
  RESET #SYST
  FOR #I 1 15
    IF #FIELD-01(#I) = ' '  STUSR.PUS := H'FF'
      ELSE
      IF #I NE 15  #II := #I + 1
        FOR #L #II 15
          IF #FIELD-01(#I) = #FIELD-01(#L)
            REINPUT 'ƒ”¡À»–Œ¬¿Õ»≈ »ƒ≈Õ“»‘» ¿“Œ–¿' MARK *#FIELD-01(#L)
            ALARM
          END-IF
        END-FOR
      END-IF
      FOR #II 1 IS1
        IF NOT ( #II = #N THRU #K )
          XI := #II  CALL 'RWSX' XI STUSR XR XN2
          IF #FIELD-01(#I) = STUSR.USR
            REINPUT 'ƒ”¡À»–Œ¬¿Õ»≈ »ƒ≈Õ“»‘» ¿“Œ–¿' MARK *#FIELD-01(#I)
            ALARM
          END-IF
        END-IF
      END-FOR
      STUSR.USR := #FIELD-01(#I)  STUSR.NMUSR := #FIELD-02(#I)
      STUSR.PSW := #FIELD-03(#I)  STUSR.STNUM := #FIELD-04(#I)
      STUSR.STSYST(*) := #FIELD-05(#I,*)
    END-IF
    XI := #N + #I - 1  CALL 'RWSX' XI STUSR XW XN2
  END-FOR
  IF *PF-KEY = 'PF11'
    FOR #I 1 15
      IF *CURS-FIELD = POS(#FIELD-01(#I)) OR = POS(#FIELD-02(#I))
      OR = POS(#FIELD-04(#I)) AND #FIELD-01(#I) NE ' '
        XI := #N + #I - 1  #K := #I  CALL 'RWSX' XI STUSR XR XN2
        POS2 := XI
        STUSR.USR := #FIELD-01(#I)  STUSR.NMUSR :=  #FIELD-02(#I)
        STUSR.PSW := #FIELD-03(#I) STUSR.STNUM :=  #FIELD-04(#I)
        STUSR.STSYST(*) := #FIELD-05(#I,*)
        FOR #J 1 10
          IF STUSR.STSYST(#J) NE ' '  ADD 1 TO #FIELD-04(#I) END-IF
        END-FOR
        CALL 'RWSX' XI STUSR XW XN2
        SET WINDOW 'WIN3'
        SET KEY OFF
        SET KEY ON
        SET KEY PF3 PF2
        FOR #I 1 10
          IF CSYST(#I) NE ' '
            S-OG := ORG  S-SY := CSYST(#I)  S-US := STUSR.USR
P0.         FIND NUMBER PSWVIEW SY-USER = K-SY
            IF *NUMBER(P0.) = 0
              COMPRESS '>' CSYST(#I) '.' TO MSYST(#I) LEAVING NO
              ELSE  COMPRESS CSYST(#I) TO MSYST(#I) LEAVING NO
            END-IF
          END-IF
        END-FOR
        REPEAT
          INPUT USING MAP 'NAVPSWM6'
          IF *PF-KEY = 'PF3'  ESCAPE BOTTOM  END-IF
          CALL 'NULX' ' ' XN3  RESET IS3
          IF *PF-KEY = 'PF2'
            FOR #I 1 10
              IF *CURS-FIELD = POS(M-TY(#I))
                COMPRESS '/' CSYST(#I) TO MSYST(#I) LEAVING NO
                #SYST := CSYST(#I)
                ESCAPE BOTTOM
              END-IF
            END-FOR
          END-IF
          FOR #I 1 10
            EXAMINE MSYST(#I) '/' GIVING POSITION #J
            IF #J NE 0  STEK3.STSYST := CSYST(#I)
              ELSE  RESET STEK3.STSYST
            END-IF
            STEK3.STNUM := 0
            IF STEK3.STSYST = ' '  STEK3.PUS := H'FF'  END-IF
            XI := #I  CALL 'RWSX' XI STEK3 XW XN3
          END-FOR
          CALL 'PRSX' XW XW XN3
          XI := POS2  CALL 'RWSX' XI STUSR XR XN2
          RESET STUSR.STSYST(*)
          FOR #I 1 10
            XI := #I  CALL 'RWSX' XI STEK3 XR XN3
            STUSR.STSYST(#I) := STEK3.STSYST
          END-FOR
          XI := POS2  CALL 'RWSX' XI STUSR XW XN2
          IF *PF-KEY = 'PF2' AND #SYST NE ' '  ESCAPE BOTTOM  END-IF
        END-REPEAT
        SET WINDOW OFF
        IF #SYST = ' '  SET CONTROL 'K0'  END-IF
        ESCAPE BOTTOM
      END-IF
    END-FOR
  END-IF
  IF *PF-KEY = 'PF2'
    SET WINDOW 'WIN1'
    #NN := 1
    CALL 'NULX' ' ' XN4  RESET IS4
*
    XI := 1  CALL 'SLCX' #SYST XI H'0000000A' XN1 XN4
    IS4 := XI
*
    REPEAT
      #KK := #NN + 9  RESET #L C-ACC(*)
       FOR #II #NN #KK
         ADD 1 TO #L
         IF #II <= IS4  XI := #II  CALL 'RWSX' XI STPGM XR XN4
           #NMPGM(#L) := STPGM.NMPGM
           P-OG := ORG  P-SY := #SYST  P-TP := 'UMOD'  P-OB :=STPGM.PGM
P.         FIND NUMBER PSWVIEW  RKEY = K-PSW
           IF *NUMBER(P.) NE 0  ACC(#L) := 'X'
             ELSE  ACC(#L) := ' '
           END-IF
*          ACC(#L) := STPGM.STACC
           #NM-MENU(#L) := STPGM.NMMENU
           ELSE  RESET #NMPGM(#L) ACC(#L) #NM-MENU(#L)
           C-ACC(#L) := (AD=PN)
         END-IF
       END-FOR
       SET KEY ALL
      INPUT USING MAP 'NAVPSWM2'
      IF *PF-KEY = 'PF3'  ESCAPE BOTTOM  END-IF
      FOR #II 1 10
        XI := #NN + #II - 1  CALL 'RWSX' XI STPGM XR XN4
        STACC := ACC(#II)
        CALL 'RWSX' XI STPGM XW XN4
      END-FOR
      IF *PF-KEY = 'PF5'  ESCAPE BOTTOM  END-IF
      IF *PF-KEY = 'PF4'
        FOR #II 1 IS1  XI := #II  CALL 'RWSX' XI STPGM XR XN4
          STACC := 'X'  CALL 'RWSX' XI STPGM XW XN4
        END-FOR
        SET CONTROL 'K05'
        ESCAPE BOTTOM
      END-IF
      IF *PF-KEY = 'PF7' AND #NN > 10  #NN := #NN - 10
        MRK := 1
      END-IF
      IF *PF-KEY = 'PF8' AND #KK < IS1  ADD 10 TO #NN
        MRK := 1
      END-IF
    END-REPEAT
    IF *PF-KEY = 'PF5'
      READ PSWVIEW
        IF OG-ID EQ ORG AND PSWVIEW.SYST EQ #SYST
        AND RTYPE EQ 'UMOD' AND FLDA2 = STUSR.USR
          DELETE
        END-IF
        END OF TRANSACTION
      END-READ
      FOR #II 1 IS4  XI := #II  CALL 'RWSX' XI STPGM XR XN4
        IF STACC NE ' '  PSWVIEW.OG-ID := ORG
          PSWVIEW.SYST  := #SYST  PSWVIEW.RTYPE := 'UMOD'
          PSWVIEW.OBJ-ID := STPGM.PGM  PSWVIEW.FLDA1 := STUSR.PSW
          PSWVIEW.FLDA2 := STUSR.USR
          STORE PSWVIEW
          END OF TRANSACTION
        END-IF
      END-FOR
      FOR #II 1 IS1  XI := #II  CALL 'RWSX' XI STPGM XR XN1
        IF STPGM.STSYST = #SYST  STPGM.PUS := H'FF'
          CALL 'RWSX' XI STPGM XW XN1
        END-IF
      END-FOR
      CALL 'PRSX' XW XW XN1
      XI := 1  CALL 'CMPX' ' ' XI XW XN1
      IS1 := XI  IS1 := IS1 - 1
      FOR #II 1 IS4  XI := #II  CALL 'RWSX' XI STPGM XR XN4
        ADD 1 TO IS1  CALL 'RWSX' XI STPGM XW XN1
      END-FOR
    END-IF
    SET WINDOW OFF
    SET CONTROL 'K0'
  END-IF
  IF *PF-KEY = 'PF6'
    FOR #I 1 15
      IF #FIELD-01(#I) NE ' ' AND
      *CURS-FIELD = POS(#FIELD-01(#I)) OR = POS(#FIELD-02(#I))
        MRK := *CURS-FIELD
        SET WINDOW 'WIN2'
        OPSW := #PSW := #FIELD-03(#I)  FLGN := FLGO := FLGP := 0
        RPSW := ' '
        IF #PSW NE ' '  #POVT := '¬¬≈ƒ»“≈ —“¿–€… œ¿–ŒÀ‹'
          ELSE  #POVT := '¬¬≈ƒ»“≈ ÕŒ¬€… œ¿–ŒÀ‹'
        END-IF
        REPEAT
          INPUT USING MAP 'NAVPSWM3'
          IF *PF-KEY = 'PF3'
            SET WINDOW OFF
            SET CONTROL 'K0'
            ESCAPE BOTTOM
          END-IF
          IF OPSW = ' '  OPSW := #PSW  FLGN :=  1  END-IF
          IF OPSW NE #PSW AND FLGP NE 1
            REINPUT 'œ¿–ŒÀ» Õ≈ —Œ¬œ¿ƒ¿ﬁ“' ALARM
            ADD 1 TO FLGO
            IF FLGO > 5  SET CONTROL 'K3'  ESCAPE BOTTOM  END-IF
          END-IF
          IF FLGN = 0 AND FLGP = 0
            #POVT := '¬¬≈ƒ»“≈ ÕŒ¬€… œ¿–ŒÀ‹' ADD 1 TO FLGP
            ESCAPE TOP
          END-IF
          OPSW := #PSW
          IF RPSW = ' '  RPSW := #PSW
            #POVT := '¬¬≈ƒ»“≈ œŒƒ“¬≈–∆ƒ≈Õ»≈'
            ESCAPE TOP
          END-IF
          IF RPSW NE #PSW  ADD 1 TO FLGO
            IF FLGO > 5  SET CONTROL 'K3'  ESCAPE BOTTOM  END-IF
            IF RPSW NE #PSW
              REINPUT 'œ¿–ŒÀ» Õ≈ —Œ¬œ¿ƒ¿ﬁ“' ALARM
            END-IF
          END-IF
          XI := #N + #I - 1  CALL 'RWSX' XI STUSR XR XN2
          STUSR.PSW := #PSW
          CALL 'RWSX' XI STUSR XW XN2
          SET WINDOW OFF
          SET CONTROL 'K0'
          ESCAPE BOTTOM
        END-REPEAT
      END-IF
    END-FOR
  END-IF
  CALL 'PRSX' XW XW XN2
  XI := 101  CALL 'CMPX' ' ' XI XW XN2
  IS2 := XI  IS2 := IS2 - 1
  IF *PF-KEY = 'PF5'  ESCAPE BOTTOM  END-IF
  IF *PF-KEY = 'PF7' AND #N > 15  #N := #N - 15  END-IF
  IF *PF-KEY = 'PF8' AND #K <= IS2  #N := #N + 15  END-IF
  IF *PF-KEY = 'PF9'  #N := 1  END-IF
  IF *PF-KEY = 'PF10'  #K := IS2  #N := #K - 14
    IF #N < 1  #N := 1  END-IF
  END-IF
END-REPEAT
IF *PF-KEY = 'PF5'
  READ PSWVIEW WHERE OG-ID EQ ORG AND RTYPE EQ 'USER'
    DELETE
  END-READ
  FOR #I 1 IS2
    XI := #I  CALL 'RWSX' XI STUSR XR XN2
    PSWVIEW.OG-ID := ORG
    PSWVIEW.RTYPE := 'USER'
    PSWVIEW.OBJ-ID := STUSR.USR
    PSWVIEW.STR(1) := STUSR.NMUSR
    PSWVIEW.FLDA1 := STUSR.PSW
    FOR #J 1 10
      IF STUSR.STSYST(#J) NE ' '  PSWVIEW.SYST := STUSR.STSYST(#J)
        STORE PSWVIEW
      END-IF
    END-FOR
    END OF TRANSACTION
  END-FOR
END-IF
CALL 'FRSX' XN1  CALL 'FRSX' XN2
CALL 'FRSX' XN3  CALL 'FRSX' XN4
END-SUBROUTINE
END
