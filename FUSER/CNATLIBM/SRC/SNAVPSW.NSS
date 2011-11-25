* >Natural Source Header 000000 /*<RO>>
* :NatName SNAVPSW
* :UID MSA
* :Mode S
* :CP
* :Date 20090709
* :Time 2004330
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
  1 RSTPGM(A97)
  1 REDEFINE RSTPGM
    2 RPGM(A8)  2 X39(A39)  2 RSTNMENU(N5)  2 RSTNN(N5)  2 RSTNNM(A40)
  1 STPGM(A97)
  1 REDEFINE STPGM
    2 PGM(A8)  2 NMPGM(A30)  2 STACC(A1)  2 STMENU(A8)  2 STNMENU(N5)
    2 STNN(N5)  2 STNM-MENU(A40)
  1 STUSR(A68)
  1 REDEFINE STUSR
    2 USR(A8)  2 NMUSR(A50)  2 PSW(A10)
  1 REDEFINE STUSR
    2 PUS2(B1)
  1 INPUT-REC(A68/1:15)
  1 REDEFINE INPUT-REC
    2 #INPUT-REC(15)
     3 #FIELD-01(A8)      /* KOƒ
     3 #FIELD-02(A50)    /* O¡O«HA◊EH»E
     3 #FIELD-03(A10)
  1 FUN-NM-G (A060)  1 REG-NM-G (A040)  1 SYS-NM-G (A060)
  1 #NMPGM(A30/10)  1 ACC(A1/10)  1 C-ACC(C/10)  1 #PSW(A8)  1 MRK(I4)
  1 #NM-MENU(A30/10)  1 C-PSW(C)
  1 RPSW(A10)  1 OPSW(A10)  1 FLGO(N5)  1 FLGN(N5) 1 FLGP(N5)
  1 #POVT(A30)
  1 KCONF(A33)
  1 REDEFINE KCONF
    2 KCPL(A20)  2 KCSY(A8)  2 KCOG(N5)
  1 KPSW1(A31)
  1 REDEFINE KPSW1
    2 KPOG1(N5)  2 KPSY1(A5)  2 KPTP1(A5)  2 KPPG1(A16)
  1 KPSW2(A31)
  1 REDEFINE KPSW2
    2 KPOG2(N5)  2 KPSY2(A5)  2 KPTP2(A5)  2 KPPG2(A16)
  1 CURS(I4) INIT < 1 >
END-DEFINE
DEFINE SUBROUTINE SNAVPSW
SET KEY ALL
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
SYS-NM-G := 'Õ¿—“–Œ… ¿ —»—“≈Ã€'  CALLNAT 'CENTER60' SYS-NM-G
REG-NM-G := '¬≈ƒ≈Õ»≈ ƒŒ—“”œ¿'  CALLNAT 'CENTER40' REG-NM-G
CALL 'GTNX' XR
XN1 := XR
XI := 97  XW := 500  CALL 'GTSX' XI XW XN1
CALL 'GTNX' XR
XN2 := XR  XI := 68
CALL 'GTSX' XI XW XN2
CALL 'GTNX' XR
XN3 := XR  CALL 'GTSX' XI XW XN3
XW := 1  XR := 0  IS1 := IS2 := 0
* —Œ—“¿¬ —»—“≈Ã
KCPL := POLZ  KCSY := KPSY1 := KPSY2 := SKEY.SYST
KCOG := KPOG1 := KPOG2 := SKEY.ORG
FIND IBS-CONF-FILE SUPCONF1 = KCONF
  STMENU := IBS-CONF-FILE.MENU
  STNM-MENU := IBS-CONF-FILE.NM-MENU
  FOR #I 1 C*SOSTAV
    STPGM.PGM := IBS-CONF-FILE.PGM(#I)
    STPGM.NMPGM := IBS-CONF-FILE.NM-PGM(#I)
    ADD 1 TO IS1  STNN := XI := IS1  CALL 'RWSX' XI STPGM XW XN1
  END-FOR
END-FIND
* ”œŒ–ﬂƒŒ◊»“‹ œŒ Ã≈Õﬁ
FOR #I 1 IS1  XI := #I  CALL 'RWSX' XI STPGM XR XN1
  XI := 1  CALL 'CMPXF' STMENU XI H'00000008' XN1
  IF XI NE 0  CALL 'RWSX' XI RSTPGM XR XN1
    RSTNMENU := STNMENU := RSTNN  CALL 'RWSX' XI RSTPGM XW XN1
    XI := #I  CALL 'RWSX' XI STPGM XW XN1
    ELSE  STNMENU := 0  XI := #I  CALL 'RWSX' XI STPGM XW XN1
  END-IF
END-FOR
XI := 48  CALL 'SRTX' XI H'0000000A' XN1
* œŒÀ‹«Œ¬¿“≈À» » œ¿–ŒÀ»
KPTP2 := KPTP1 := 'USER'
MOVE ALL H'00' TO KPPG1  MOVE ALL H'FF' TO KPPG2
FIND PSWVIEW RKEY = KPSW1 THRU KPSW2
  STUSR.USR := PSWVIEW.OBJ-ID  STUSR.NMUSR := PSWVIEW.STR(1)
  STUSR.PSW := FLDA1
  ADD 1 TO IS2  XI := IS2  CALL 'RWSX' XI STUSR XW XN2
  CALL 'RWSX' XI STUSR XW XN3
END-FIND
IS3 := IS2
*
MRK := #N := 1
REPEAT
  #K := #N + 14  RESET #L
  FOR #I #N #K
    ADD 1 TO #L
    IF #I <= IS2  XI := #I  CALL 'RWSX' XI STUSR XR XN2
      #FIELD-01(#L) := STUSR.USR  #FIELD-02(#L) := STUSR.NMUSR
      #FIELD-03(#L) := STUSR.PSW
      ELSE  RESET #FIELD-01(#L) #FIELD-02(#L) #FIELD-03(#L)
    END-IF
  END-FOR
  INPUT MARK CURS USING MAP 'NAVPSWM1'
  IF *PF-KEY = 'PF3'  ESCAPE BOTTOM  END-IF
  CURS := *CURS-FIELD
  FOR #I 1 15
    IF #FIELD-01(#I) = ' '  PUS2 := H'FF'
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
      STUSR.PSW := #FIELD-03(#I)
    END-IF
    XI := #N + #I - 1  CALL 'RWSX' XI STUSR XW XN2
  END-FOR
  IF *PF-KEY = 'PF2'  MRK := *CURS-FIELD
    FOR #I 1 15
      IF #FIELD-01(#I) NE ' ' AND
      *CURS-FIELD = POS(#FIELD-01(#I)) OR = POS(#FIELD-02(#I))
        SET WINDOW 'WIN1'
        #NN := 1
        XI := #N + #I - 1  CALL 'RWSX' XI STUSR XR XN2
        FOR #II 1 IS1  XI := #II  CALL 'RWSX' XI STPGM XR XN1
          RESET STACC
          CALL 'RWSX' XI STPGM XW XN1
        END-FOR
        KPTP1 := KPTP2 := 'UMOD'
        MOVE ALL H'00' TO KPPG1  MOVE ALL H'FF' TO KPPG2
        FIND PSWVIEW RKEY = KPSW1 THRU KPSW2 AND FLDA2 = STUSR.USR
          FOR #II 1 IS1  XI := #II  CALL 'RWSX' XI STPGM XR XN1
            IF OBJ-ID = STPGM.PGM
              STACC := 'X'  CALL 'RWSX' XI STPGM XW XN1
            END-IF
          END-FOR
        END-FIND
        REPEAT
          #KK := #NN + 9  RESET #L C-ACC(*)
          FOR #II #NN #KK
            ADD 1 TO #L
            IF #II <= IS1  XI := #II  CALL 'RWSX' XI STPGM XR XN1
              #NMPGM(#L) := STPGM.NMPGM  ACC(#L) := STPGM.STACC
              #NM-MENU(#L) := STNM-MENU
              ELSE  RESET #NMPGM(#L) ACC(#L) #NM-MENU(#L)
              C-ACC(#L) := (AD=PN)
            END-IF
          END-FOR
          INPUT USING MAP 'NAVPSWM2'
          IF *PF-KEY = 'PF3'  ESCAPE BOTTOM  END-IF
          FOR #II 1 10
            XI := #NN + #II - 1  CALL 'RWSX' XI STPGM XR XN1
            STACC := ACC(#II)
            CALL 'RWSX' XI STPGM XW XN1
          END-FOR
          IF *PF-KEY = 'PF5'  ESCAPE BOTTOM  END-IF
          IF *PF-KEY = 'PF4'
            FOR #II 1 IS1  XI := #II  CALL 'RWSX' XI STPGM XR XN1
              STACC := 'X'
              CALL 'RWSX' XI STPGM XW XN1
            END-FOR
*           SET CONTROL 'K05'
*           ESCAPE BOTTOM
          END-IF
          IF *PF-KEY = 'PF7' AND #NN > 10  #NN := #NN - 10
            CURS := 1
          END-IF
          IF *PF-KEY = 'PF8' AND #KK < IS1  ADD 10 TO #NN
            CURS := 1
          END-IF
        END-REPEAT
        IF *PF-KEY = 'PF5'
          FIND PSWVIEW RKEY = KPSW1 THRU KPSW2 AND FLDA2 = STUSR.USR
            DELETE
            END OF TRANSACTION
          END-FIND
          FOR #II 1 IS1  XI := #II CALL 'RWSX' XI STPGM XR XN1
            IF STACC NE ' '
              PSWVIEW.OG-ID := ORG
              PSWVIEW.SYST  := SKEY.SYST
              PSWVIEW.RTYPE := 'UMOD'
              PSWVIEW.OBJ-ID := STPGM.PGM
              PSWVIEW.FLDA1 := STUSR.PSW
              PSWVIEW.FLDA2 := STUSR.USR
              STORE PSWVIEW
              END OF TRANSACTION
            END-IF
          END-FOR
        END-IF
        SET WINDOW OFF
        SET CONTROL 'K0'
      END-IF
    END-FOR
  END-IF
  IF *PF-KEY = 'PF6'
    FOR #I 1 15
      IF #FIELD-01(#I) NE ' ' AND
      *CURS-FIELD = POS(#FIELD-01(#I)) OR = POS(#FIELD-02(#I))
        MRK := *CURS-FIELD
        SET WINDOW 'WIN2'
        #PSW := #FIELD-03(#I)  FLGN := FLGO := FLGP := 0
        #POVT := '¬¬≈ƒ»“≈ ÕŒ¬€… œ¿–ŒÀ‹'
        REPEAT
          INPUT USING MAP 'NAVPSWM3'
          IF *PF-KEY = 'PF3'
            SET WINDOW OFF
            SET CONTROL 'K0'
            ESCAPE BOTTOM
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
  XI := 1  CALL 'CMPX' ' ' XI XW XN2
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
  KPTP2 := KPTP1 := 'USER'
  MOVE ALL H'00' TO KPPG1  MOVE ALL H'FF' TO KPPG2
P1. FIND NUMBER PSWVIEW RKEY = KPSW1 THRU KPSW2
  IF *NUMBER(P1.) < IS2  #J := IS2 - *NUMBER
    FOR #I 1 #J
      PSWVIEW.OG-ID := ORG
      PSWVIEW.SYST  := SKEY.SYST
      PSWVIEW.RTYPE := 'USER'
      STORE PSWVIEW
    END-FOR
  END-IF
  FIND PSWVIEW RKEY = KPSW1 THRU KPSW2
    IF *COUNTER <= IS2  XI := *COUNTER  CALL 'RWSX' XI STUSR XR XN2
      PSWVIEW.OG-ID := ORG
      PSWVIEW.SYST  := SKEY.SYST
      PSWVIEW.RTYPE := 'USER'
      PSWVIEW.OBJ-ID := STUSR.USR
      PSWVIEW.STR(1) := STUSR.NMUSR
      PSWVIEW.FLDA1 := STUSR.PSW
      UPDATE
      ELSE  DELETE
    END-IF
  END-FIND
  END OF TRANSACTION
  FOR #I 1 IS3
    XI := #I  CALL 'RWSX' XI STUSR XR XN3
    XI := 1  CALL 'CMPXF' STUSR.USR XI H'00000008' XN2
    IF XI = 0
      READ PSWVIEW
        IF OG-ID EQ ORG AND PSWVIEW.SYST EQ SKEY.SYST
        AND OBJ-ID = STUSR.USR
          DELETE
        END-IF
        END OF TRANSACTION
      END-READ
    END-IF
  END-FOR
END-IF
CALL 'FRSX' XN1  CALL 'FRSX' XN2  CALL 'FRSX' XN3
END-SUBROUTINE
END
