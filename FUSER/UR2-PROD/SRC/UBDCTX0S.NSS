* >Natural Source Header 000000 /*<RO>>
* :NatName UBDCTX0S
* :UID ARMK01
* :Mode S
* :CP
* :Date 20060706
* :Time 1641000
* <Natural Source Header /*<<RO>
/***********************************************************************
/*
/* яхярелю:
/* опнцпюллю: XETXMN0S
/*
/* пюгпюанрвхй: йнбюкэвсй н.д.
/* дюрю бшосяйю:
/*
/* мюгбюмхе:  ахгмея спнбемэ пюанрю я хдемрхтхйюрнпюлх рпюмгюйжхи
/*  - COMMIT
/*  - ROLLBACK
/*
/* хяопюбкемхъ:
/*
/***********************************************************************
DEFINE DATA
PARAMETER USING XXERX00A
PARAMETER USING XXCTXX0A
PARAMETER USING UBDCTX0A  /* бундмнъ накюярэ дюммшу
/*
LOCAL USING XXXXEC0L
LOCAL USING UDDRTX0A
LOCAL USING UDOPTX0A
/*
END-DEFINE
DEFINE SUBROUTINE UBDCTX0S
RESET XXERX00A
DECIDE ON FIRST VALUE BL-COMMAND
  VALUE 'COMMIT'
     PERFORM TX-FINISH
  VALUE 'ROLLBACK'
     PERFORM TX-FINISH
  NONE VALUE
     MOVE BL-COMMAND TO ERROR-ADDITION(1)
     *ERROR-NR := EC-UNKNOW-COMMAND
END-DECIDE
/*
DEFINE SUBROUTINE TX-FINISH
/* тхйяхпсел гюохях днйслемрнб
  IF UBDCTX0A.TX-ID EQ 0 THEN
     UBDCTX0A.TX-ID := XXCTXX0A.TX-ID
  END-IF
  MOVE UBDCTX0A.TX-ID TO UDDRTX0A.TX-ID
  MOVE UBDCTX0A.BL-COMMAND TO UDDRTX0A.DL-COMMAND
  PERFORM UDDRTX0S XXERX00A UDDRTX0A
  IF RETURN-CODE NE 0 THEN *ERROR-NR := EC-QUIT-STACK-TRACE END-IF
/* тхйяхпсел гюохях пецхярпнб
  MOVE UBDCTX0A.TX-ID TO UDOPTX0A.TX-ID
  MOVE UBDCTX0A.BL-COMMAND TO UDOPTX0A.DL-COMMAND
  PERFORM UDOPTX0S XXERX00A UDOPTX0A
  IF RETURN-CODE NE 0 THEN *ERROR-NR := EC-QUIT-STACK-TRACE END-IF
/*
END-SUBROUTINE
/*
INCLUDE XXERSY1C
END-SUBROUTINE
END
