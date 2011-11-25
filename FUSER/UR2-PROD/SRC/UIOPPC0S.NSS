* >Natural Source Header 000000 /*<RO>>
* :NatName UIOPPC0S
* :UID INTECO
* :Mode S
* :CP
* :Date 20060620
* :Time 1721000
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
PARAMETER USING UEOPPC0A
PARAMETER USING UXCSXX0A
/*
LOCAL USING XXXXEC0L
/*
END-DEFINE
DEFINE SUBROUTINE UIOPPC0S
RESET XXERX00A
/*
PERFORM UEOPPC0S XXERX00A XXCTXX0A UEOPPC0A UXCSXX0A
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
