* >Natural Source Header 000000 /*<RO>>
* :NatName NBRCSU4S
* :UID PAUL
* :Mode S
* :CP
* :Date 20071129
* :Time 1748000
* <Natural Source Header /*<<RO>
/********************************************************
/*
/* яхярелю: NU
/* опнцпюллю: NBRCSU3S
/*
/* пюгпюанрвхй: KARLOV SERGEY
/* дюрю бшосяйю:2004-08-31
/*
/* мюгбюмхе: ЯЮКЭДН  б оепхнде он а/C
/*
/*
/********************************************************
DEFINE DATA
 PARAMETER USING XXERX00A
 PARAMETER USING NBRCSU2A
 LOCAL USING SU-RECL
 LOCAL USING LCLBSL
 LOCAL
 1 #KEY1(A8)             /* йкчв дкъ опнбепйх мюкхвхъ яса/явернб
    1 REDEFINE #KEY1
      2 #KEYOG(N05)       /* нпцюмхгюжхъ
      2 #KEYBS(N03)       /* а/явер
 1 #BS-FOUNDED(L)
 1 #KEY2(A10)             /* йкчв дкъ ясаявернб
    1 REDEFINE #KEY2
      2 #KEY2OG(N05)       /* нпцюмхгюжхъ
      2 #KEY2SS (N05)       /* ясаявер
 1 #Q-SS(N5)
 1 #SS(N5/1:50)
 1 #DATA(A8)
 1 REDEFINE #DATA
  2 #DATN6(N6)
 1 #DAT1 (N6)
 1 #DAT2 (N6)
 1 #BO(A1)
 1 #BO2(A1)
END-DEFINE
DEFINE SUBROUTINE NBRCSU4S
IF NBRCSU2A.DT-START = 0
   INCLUDE XXERUS1C '1663'
 END-IF
 /* опнбепхл яв╗рхй
 #KEY2OG := NBRCSU2A.OG-ID
 #KEY2SS := NBRCSU2A.BS-ID
BS. FIND NUMBER IBS-BS-FILE WITH OG-SS = #KEY2
 IF *NUMBER(BS.) = 0
  THEN
   INCLUDE XXERUS1C '1661'
  END-IF
  /*
  MOVE EDITED NBRCSU2A.DT-START(EM=YYYYMMDD) TO #DATA
  #DAT1 := #DATN6
  #BO := NBRCSU2A.BO-ID
*  WRITE #DAT1 #DAT2
*  WRITE #SS(*)
  FIND SU-REC-FILE WITH GM-F = #DAT1 AND OS-F = NBRCSU2A.BS-ID AND
                       KD-F = NBRCSU2A.OG-ID
    IF  (
          ((SU-REC-FILE.BO-F = '1' OR = '2' ) AND NBRCSU2A.BO-ID = 0)
        OR
          ( SU-REC-FILE.BO-F = #BO AND NBRCSU2A.BO-ID NE 0 )
         )
/*     OR ( SU-REC-FILE.KS-F = #SS(*) AND SU-REC-FILE.BO-F = #BO2)
     THEN
        IF NBRCSU2A.BO-ID NE 0 THEN
           ADD SU-REC-FILE.SU-F TO NBRCSU2A.RC-SUM
        ELSE
           IF BO-ID EQ 1 THEN
              ADD SU-REC-FILE.SU-F TO NBRCSU2A.RC-SUM
           ELSE
              SUBTRACT SU-REC-FILE.SU-F FROM NBRCSU2A.RC-SUM
           END-IF
        END-IF
     END-IF
  END-FIND
 INCLUDE XXERSY1C
END-SUBROUTINE /* NBRCSU3S
END

