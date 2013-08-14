* >Natural Source Header 000000 /*<RO>>
* :NatName UDDCMN0S
* :UID INTECO
* :Mode S
* :CP
* :Date 20060413
* :Time 1935000
* <Natural Source Header /*<<RO>
/***********************************************************************
/*
/* яхярелю:
/* опнцпюллю:
/*
/* пюгпюанрвхй:  сгнпхм о.ю.
/* дюрю бшосяйю:
/*
/* мюгбюмхе:  спнбемэ дюммшу пюанрю я реумхвеяйни гюохяэч днйслемрю
/*            опнйях й пюанрю я гюохяэч днйслемрю
/* йнлюмдш:
/*   READ
/*   ADD
/*   UPDATE
/*   DELETE
/*
/* хяопюбкемхъ:
/*
/***********************************************************************
DEFINE DATA
PARAMETER USING XXERX00A
PARAMETER USING UDDCMN0A
*
LOCAL USING XXXXEC0L
LOCAL USING UDDRMN0A
/*
END-DEFINE
DEFINE SUBROUTINE UDDCMN0S
RESET XXERX00A
/*
MOVE BY NAME UDDCMN0A TO UDDRMN0A
PERFORM UDDRMN0S XXERX00A UDDRMN0A
IF RETURN-CODE NE 0 THEN *ERROR-NR := EC-QUIT-STACK-TRACE END-IF
MOVE BY NAME UDDRMN0A TO UDDCMN0A
/*
INCLUDE XXERSY1C
END-SUBROUTINE
END
