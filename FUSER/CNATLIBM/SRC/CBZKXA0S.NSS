* >Natural Source Header 000000 /*<RO>>
* :NatName CBZKXA0S
* :UID MSA
* :Mode S
* :CP
* :Date 20110811
* :Time 1215140
* <Natural Source Header /*<<RO>
DEFINE DATA
/*GLOBAL USING UFROG
PARAMETER USING CBZKXA0A
LOCAL USING IBS-RECL
LOCAL USING ASRZSYSL
LOCAL USING LCLZKL
LOCAL
1 #NB(A7)
1 REDEFINE #NB
2 NBPO(N5)  2 NBGP(N2)
/*
1 #I       (I4)
1 #IS-KB   (L)
END-DEFINE
DEFINE SUBROUTINE CBZKXA0S
/*IF GM-IDENT-G < 201001 THEN ESCAPE ROUTINE END-IF
IF NOT CBZKXA0A.IS-PO-LOAD THEN
  FIND ASRZ-SYS-FILE KK-F = 'ÃÏ' AND KD-F = 712
     FOR #I 1 C*NB-F
        #NB := NB-F(#I)
/*     WRITE "TEST" NBPO NBGP
        IF NBGP = 1 THEN
           ADD 1 TO CBZKXA0A-PO-C
           CBZKXA0A.PO-LIST(CBZKXA0A-PO-C) := NBPO
/*        WRITE #PO-C #PO-LIST(#PO-C)
        END-IF
     END-FOR
  END-FIND
  CBZKXA0A.IS-PO-LOAD := TRUE
END-IF
/*
PERFORM CHECK-KB
PERFORM CHECK-AC
/*
DEFINE SUBROUTINE CHECK-AC
FZ.
  FIND ZAKAZ WITH ZK-F EQ CBZKXA0A.ZK-CODE
     IF NO RECORD FOUND
        FIND ZAKAZ WITH ZZ-F EQ CBZKXA0A.ZK-CODE
        END-FIND
     END-NOREC
     IF AC-TYPE EQ 20 THEN
/* 1 Ö - ÖÝÐÏ
/* 2 Ã - Ãîñçàêàç
/* 3 À - ÍÈÎÊÐ ÂÝÄ
/* 4 Â - ÂÝÄ
/* 5 Í - ÍÈÎÊÐ
/* 6 ÏÐ - Ïðî÷èå
/* 7 Ê - Êîíâåðñè
/* 8     Ãàðàíòè
     DECIDE ON FIRST VALUE ZT-OID
     VALUE 1
        IF NDS-PRIZN EQ "Î" THEN
           IF ET-CODE EQ 300
              CBZKXA0A.AC-CODE := 2035
           ELSE
              CBZKXA0A.AC-CODE := 2032
           END-IF
        ELSE IF NDS-PRIZN EQ "Í" THEN
           IF ET-CODE EQ 300
              CBZKXA0A.AC-CODE := 2034
           ELSE
              CBZKXA0A.AC-CODE := 2031
           END-IF
        ELSE
           WRITE CBZKXA0A.ZK-CODE "ÑÒÀÂÊÀ ÍÄÑ" NDS-PRIZN
        END-IF END-IF
     VALUE 2
        IF NDS-PRIZN EQ "Î" THEN
           IF CBZKXA0A.ET-CODE EQ 300 THEN
              IF CBZKXA0A.SZ-CODE EQ 6003 THEN
                 CBZKXA0A.AC-CODE := 2026
              ELSE
                 CBZKXA0A.AC-CODE := 2025
              END-IF
           ELSE
              IF #IS-KB THEN
                 CBZKXA0A.AC-CODE := 2016
              ELSE
                 CBZKXA0A.AC-CODE := 2015
              END-IF
           END-IF
        ELSE IF NDS-PRIZN EQ "Í" THEN
           IF CBZKXA0A.ET-CODE EQ 300 THEN
              IF CBZKXA0A.SZ-CODE EQ 6003 THEN
                 CBZKXA0A.AC-CODE := 2022
              ELSE
                 CBZKXA0A.AC-CODE := 2021
              END-IF
           ELSE
              IF #IS-KB THEN
                 CBZKXA0A.AC-CODE := 2012
              ELSE
                 CBZKXA0A.AC-CODE := 2011
              END-IF
           END-IF
        ELSE
           WRITE CBZKXA0A.ZK-CODE "ÑÒÀÂÊÀ ÍÄÑ" NDS-PRIZN
        END-IF END-IF
     VALUE 3
           IF CBZKXA0A.ET-CODE EQ 300
              CBZKXA0A.AC-CODE := 2093
           ELSE
              IF #IS-KB THEN
                 CBZKXA0A.AC-CODE := 2092
              ELSE
                 CBZKXA0A.AC-CODE := 2091
              END-IF
           END-IF
     VALUE 4
        IF NDS-PRIZN EQ "Í" THEN
           IF CBZKXA0A.ET-CODE EQ 300 THEN
              CBZKXA0A.AC-CODE := 2063
           ELSE
              IF #IS-KB THEN
                 CBZKXA0A.AC-CODE := 2062
              ELSE
                 CBZKXA0A.AC-CODE := 2061
              END-IF
           END-IF
        ELSE IF NDS-PRIZN EQ "Î" THEN
           IF CBZKXA0A.ET-CODE EQ 300 THEN
              IF CBZKXA0A.SZ-CODE EQ 6003 THEN
                 CBZKXA0A.AC-CODE := 2067
              ELSE
                 CBZKXA0A.AC-CODE := 2066
              END-IF
           ELSE
              IF #IS-KB THEN
                 CBZKXA0A.AC-CODE := 2065
              ELSE
                 CBZKXA0A.AC-CODE := 2064
              END-IF
           END-IF
        ELSE
           WRITE CBZKXA0A.ZK-CODE  "ÑÒÀÂÊÀ ÍÄÑ" NDS-PRIZN
        END-IF  END-IF
     VALUE 5
        CBZKXA0A.AC-CODE := 2081
     VALUE 6
        IF NDS-PRIZN EQ "Î" THEN
           IF CBZKXA0A.ET-CODE EQ 300 THEN
              CBZKXA0A.AC-CODE := 2045
           ELSE
              IF #IS-KB THEN
                 CBZKXA0A.AC-CODE := 2042
              ELSE
                 CBZKXA0A.AC-CODE := 2041
              END-IF
           END-IF
        ELSE IF NDS-PRIZN EQ "Í" THEN
           IF CBZKXA0A.ET-CODE EQ 300 THEN
              CBZKXA0A.AC-CODE := 2047
           ELSE
              IF #IS-KB THEN
                 CBZKXA0A.AC-CODE := 2044
              ELSE
                 CBZKXA0A.AC-CODE := 2043
              END-IF
           END-IF
        ELSE
           WRITE CBZKXA0A.ZK-CODE "ÑÒÀÂÊÀ ÍÄÑ" NDS-PRIZN
        END-IF  END-IF
     VALUE 7
        CBZKXA0A.AC-CODE := 2049
     VALUE 8
        CBZKXA0A.AC-CODE := 2050
     NONE VALUE
        WRITE "UNKNOW REGIM" CBZKXA0A.ZK-CODE ZAKAZ.BS-F ZT-OID
     END-DECIDE
     ELSE
        CBZKXA0A.AC-CODE := ZAKAZ.BS-F
     END-IF
  END-FIND
END-SUBROUTINE
/*
DEFINE SUBROUTINE CHECK-KB
  RESET #IS-KB
  FOR #I 1 CBZKXA0A-PO-C
/*     IF #PO EQ 501 THEN
/*        WRITE #PO #I #PO-LIST(#I)
/*     END-IF
     IF CBZKXA0A.PO-CODE EQ CBZKXA0A.PO-LIST(#I) THEN
        #IS-KB := TRUE
        ESCAPE BOTTOM
     END-IF
  END-FOR
END-SUBROUTINE
END-SUBROUTINE
END
