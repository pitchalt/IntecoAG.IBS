* >Natural Source Header 000000 /*<RO>>
* :NatName MMROPR0S
* :UID PAUL
* :Mode S
* :CP
* :Date 20070118
* :Time 2246000
* <Natural Source Header /*<<RO>
/***********************************************************************
/*
/* яхярелю: ARM-K
/* опнцпюллю: ахгмея лернд
/*
/* пюгпюанрвхй: сгнпхм о.ю.
/* дюрю бшосяйю:
/*
/* мюгбюмхе: опнялнрп опхундмнцн нпдепю
/* йнлюмдш:
/*  - VIEW
/*
/* хяопюбкемхъ:
/*
/***********************************************************************
DEFINE DATA
PARAMETER USING XXERX00A
PARAMETER USING XXCTXX0A
PARAMETER USING XMBMXX1A
PARAMETER USING UXCSXX0A
/*PARAMETER USING CPTSXX0A
/*
/*LOCAL USING CPCPXX0L
LOCAL USING XXXXEC0L
LOCAL USING XPMXXX1A
/*
LOCAL USING XPMNXX0A
/*
LOCAL
1 #I       (I4)
1 #ITEM    (I4)
1 #J       (I4)
1 #NAME    (A70)
1 #IS-POZ  (L)
1 #BREAK   (N9)
END-DEFINE
DEFINE SUBROUTINE MMROPR0S
PERFORM MPROXP0S XXERX00A XXCTXX0A XMBMXX1A UXCSXX0A
IF RETURN-CODE NE 0 THEN PERFORM XPERVW0S XXERX00A END-IF
MOVE BM-COMMAND TO BO-COMMAND-PROCESS
INCLUDE XXERSY1C
END-SUBROUTINE
END
