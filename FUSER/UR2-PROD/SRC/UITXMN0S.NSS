* >Natural Source Header 000000 /*<RO>>
* :NatName UITXMN0S
* :UID INTECO
* :Mode S
* :CP
* :Date 20060620
* :Time 1613000
* <Natural Source Header /*<<RO>
/***********************************************************************
/*
/* яхярелю:
/* опнцпюллю:
/*
/* пюгпюанрвхй:  сгнпхм о.ю.
/* дюрю бшосяйю:
/*
/* мюгбюмхе:  спнбемэ ахгмея пюанрю я гюцнкнбйнл
/***********************************************************************
DEFINE DATA
PARAMETER USING XXERX00A
PARAMETER USING XXCTXX0A
PARAMETER USING UETXMN0A
/*
LOCAL USING XXXXEC0L
/*
END-DEFINE
DEFINE SUBROUTINE UITXMN0S
RESET XXERX00A
/*
PERFORM UETXMN0S XXERX00A XXCTXX0A UETXMN0A
IF NOT TX-NOT-MANAGED THEN
  IF RETURN-CODE EQ 0 THEN
     END TRANSACTION
  ELSE
     BACKOUT TRANSACTION
  END-IF
END-IF
IF RETURN-CODE LT 0 THEN *ERROR-NR := EC-QUIT-STACK-TRACE END-IF
/*
INCLUDE XXERSY1C
END-SUBROUTINE
END
