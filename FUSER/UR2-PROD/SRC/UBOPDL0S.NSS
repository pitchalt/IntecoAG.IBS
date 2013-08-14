* >Natural Source Header 000000 /*<RO>>
* :NatName UBOPDL0S
* :UID PAUL
* :Mode S
* :CP
* :Date 20070627
* :Time 1734000
* <Natural Source Header /*<<RO>
/***********************************************************************
/*
/* яхярелю:
/* опнцпюллю:
/*
/* пюгпюанрвхй:  сгнпхм о.ю.
/* дюрю бшосяйю:
/*
/* мюгбюмхе:  спнбемэ ахгмея днаюбхрэ мнбсч ноепюжхч б пецхярпш
/*
/* хяопюбкемхъ:
/*
/***********************************************************************
DEFINE DATA
PARAMETER USING XXERX00A
PARAMETER USING XXCTXX0A
PARAMETER USING UBOPDL0A
PARAMETER USING UXCSXX0A
/*
LOCAL USING XXXXEC0L
LOCAL USING UXXXEC0L
LOCAL USING UDOPMN0A
END-DEFINE
DEFINE SUBROUTINE UBOPDL0S
RESET XXERX00A
/*
MOVE XXCTXX0A.TX-ID TO UDOPMN0A.TX-ID
MOVE UBOPDL0A.DEL-DC-ID TO UDOPMN0A.DEL-DC-ID
MOVE 'DELDOC' TO UDOPMN0A.DL-COMMAND
IF XXCTXX0A.IS-OP-DEBUG THEN
  WRITE 'DEL OP' UDOPMN0A.DEL-DC-ID
/*  *ERROR-NR := EC-UNKNOW-COMMAND
END-IF
MOVE XXCTXX0A.IS-OP-DEBUG TO UDOPMN0A.IS-OP-DEBUG
PERFORM UDOPMN0S XXERX00A UDOPMN0A
IF RETURN-CODE NE 0 THEN *ERROR-NR := EC-QUIT-STACK-TRACE END-IF
/*
INCLUDE XXERSY1C
END-SUBROUTINE
END


