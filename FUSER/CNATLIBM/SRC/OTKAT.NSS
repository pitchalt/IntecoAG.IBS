* >Natural Source Header 000000 /*<RO>>
* :NatName OTKAT
* :UID T_MSA
* :Mode S
* :CP
* :Date 20100309
* :Time 1651330
* <Natural Source Header /*<<RO>
DEFINE DATA
 PARAMETER USING OTK_PRMS
 LOCAL USING UOC-DOCL
 LOCAL USING UOC-DOC
 LOCAL USING UOCL
 LOCAL USING UOCL1
 LOCAL USING CHREBCD
 LOCAL USING CHR1251
 LOCAL USING LCLFROL4
 LOCAL
  1 SKEY(A20)
   1 REDEFINE SKEY
   2 KEY-OG(N5)
   2 KEY-IN(A15)
  1 DT1(N8)
  1 AMO(P13.2)  1 FLG(N2)
  1 #OP(N5)
  1 #DT(N8)
  1 REDEFINE #DT
    2 DTGM(N6)
  1 FLG8(N1)
  1 OG-IDENT-G(N5) INIT < 1000 >
  1 OPSYS(A3)
 END-DEFINE
DEFINE SUBROUTINE OTKAT
OPSYS := *OPSYS
INCLUDE DEFOPSYS
 IF FLG-ST = 0 OR FLG-ST > 3  FLG-ST := 3 END-IF
 DT1 := DT-OST * 100
 SKEY.KEY-IN := INV-N SKEY.KEY-OG := OG-IDENT-G
 FIND UOC-DOC-FILE
  WITH  OI-F = SKEY AND DD-F >= DT1
  SORTED NR-F DESCENDING
     #DT := UOC-DOC-FILE.DD-F  RESET FLG8
     IF TY-F = 'PR' OR = 'DO'
      THEN
       IF FLG-ST = 1 OR = 3  SU1 := SU1 - SU-F(1)  END-IF
       IF FLG-ST = 2 OR = 3  SU2 := SU2 - SU-F(2)
       END-IF
       KL := KL - KL-F
      ELSE
       IF TY-F = 'SP' OR = 'RE'  THEN
        IF FLG-ST = 1 OR = 3  SU1 := SU1 + SU-F(1)  END-IF
        IF FLG-ST = 2 OR = 3  SU2 := SU2 + SU-F(2)    END-IF
*       IF ( PRM-IDENT-G(1) = SYS-K ) OR
*       ( USG = 'AERO7' AND SU-F(1) NE SU-F(2) )
*         FOR #I 1 C*OB-F
*           #OB := OB-F(#I)
*           IF USG = 'AERO7' AND OBSU < 0  ESCAPE TOP  END-IF
*           IF OBOS = KI-F AND OBBO = 4  SU2 := SU2 - OBSU   END-IF
*           IF OBKS = KI-F AND OBBO = 3  SU2 := SU2 - OBSU   END-IF
*         END-FOR
*       END-IF
        KL := KL + KL-F
       END-IF
       IF TY-F = 'IZ' OR = 'ID'
         IF FLG-ST = 2 OR = 3 OR = 0  SU2 := SU2 - SU-F(2)  END-IF
       END-IF
     END-IF
     IF TY-F = 'PE'
       BS1 := KS-F
       IF KI-F NE 0  BS2 := KI-F  END-IF
       OTR := KO-F  VD  := KV-F
       OTK_PARMS.MO :=  PS-F
       IF UOC-DOC-FILE.OS-F NE UOC-DOC-FILE.KS-F
         SKK := 'BS'  SKD := UOC-DOC-FILE.OS-F
         XI := 1  CALL 'CMPXF' SKK XI H'00000007' XN7
         IF XI NE 0  CALL 'RWSX' XI STEKSY XR XN7
           IF PRBS1 = 'Y'  SKD := UOC-DOC-FILE.KS-F
             XI := 1  CALL 'CMPXF' SKK XI H'00000007' XN7
             IF XI NE 0  CALL 'RWSX' XI STEKSY XR XN7
               IF PRBS1 = 'N'
* D1.              FIND UOC-DOC-FIL OI-F = SKEY AND TY-F = 'PR'
*                WHERE GGMM-F = UOC-DOC-FILE.GGMM-F
*                FLG8 := 1
*               END-FIND
                 IF FLG8 = 0
                   FOR #I 1 C*OB-F
                     #OB := OB-F(#I)
                     IF SU-F(1) = 0
                       IF ( UOC-DOC-FILE.KS-F = OBKS AND OBBO = 3 ) OR
                       ( UOC-DOC-FILE.KS-F = OBOS AND OBBO = 4 )
                         SU1 := SU1 + OBSU
                       END-IF
                       IF ( UOC-DOC-FILE.KS-F = OBKS AND OBBO = 4 ) OR
                       ( UOC-DOC-FILE.KS-F = OBOS AND OBBO = 3 )
                         SU1 := SU1 - OBSU
                       END-IF
                       ELSE
                       IF KS-F = OBOS OR = OBKS AND NOT ( OS-F = OBOS OR = OBOS )
                         IF ( KS-F = OBOS AND OBBO = 3 ) OR ( KS-F = OBKS AND OBBO = 4 )
                           SU1 := SU1 - OBSU
                         END-IF
                         IF ( KS-F = OBKS AND OBBO = 3 ) OR ( KS-F = OBOS AND OBBO = 4 )
                           SU1 := SU1 + OBSU
                         END-IF
                       END-IF
                     END-IF
                   END-FOR
                 END-IF
               END-IF
             END-IF
           END-IF
         END-IF
       END-IF
     END-IF
END-FIND
   SKK := 'BS'  SKD := BS1
   XI := 1  CALL 'CMPXF' SKK XI H'00000007' XN7
   IF XI NE 0  CALL 'RWSX' XI STEKSY XR XN7
     IF PRBS1 = 'N'  RESET OTK_PARMS.DW  END-IF
   END-IF
   IF FLG-ST = 2 OR = 3
     PERFORM GET_AMO  DT-OST INV-N AMO
     SU2 := SU2 - AMO
   END-IF
   END-SUBROUTINE
 END
