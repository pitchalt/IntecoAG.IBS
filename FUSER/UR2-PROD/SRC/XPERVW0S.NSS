* >Natural Source Header 000000 /*<RO>>
* :NatName XPERVW0S
* :UID PAUL
* :Mode S
* :CP
* :Date 20070121
* :Time 1959000
* <Natural Source Header /*<<RO>
/***********************************************************************
/*
/* яхярелю: ARM-K
/* опнцпюллю: опнялнрп
/*
/* пюгпюанрвхй: сгнпхм о.ю.
/* дюрю бшосяйю:
/*
/* мюгбюмхе: опнялнрп яхярелмшу ньханй
/* йнлюмдш:
/*
/* хяопюбкемхъ:
/*
/***********************************************************************
DEFINE DATA
PARAMETER USING XXERX00A
LOCAL
1 #MSG-PARAM                   /* PARAMETERS FOR CALLNAT
2 #ERROR-NUMBER (N04)   /* 1 THRU 9999
2 #LANG-NUMB    (I01)   /* 1 THRU 60 , SIMILAR TO *LANGUAGE
2 #RESPONSE     (N04)   /* ERROR DURING EXECUTION OF USR0120N
2 #SHORT-TEXT   (A65)   INIT <'<<< SHORT TEXT NOT FOUND >>>'>
1 #ERROR-MSG    (A75)
END-DEFINE
DEFINE SUBROUTINE XPERVW0S
/*
DEFINE WINDOW ERROR-WINDOW
  SIZE 22*76
  BASE 3/3
  TITLE 'бмсрпеммъъ ньхайю'
  CONTROL WINDOW
  FRAMED ON
/*
FORMAT KD=ON
SET CONTROL 'M4'
SET CONTROL 'YB'
SET KEY PF3 NAMED 'бшунд'
REPEAT
  IF RETURN-CODE < 0 THEN
     IF RETURN-CODE < -1 THEN
        #LANG-NUMB := *LANGUAGE
        #ERROR-NUMBER := ERROR-NUMBER
        CALLNAT 'USR0120N' #MSG-PARAM
        IF #RESPONSE EQ -2 THEN
           #LANG-NUMB := 1
           #ERROR-NUMBER := ERROR-NUMBER
           CALLNAT 'USR0120N' #MSG-PARAM
        END-IF
        COMPRESS 'NAT' ERROR-NUMBER ' ' #SHORT-TEXT INTO #ERROR-MSG
              LEAVING NO SPACE
        INPUT WINDOW='ERROR-WINDOW'
           WITH TEXT #ERROR-MSG, ERROR-ADDITION(1), ERROR-ADDITION(2),
                 ERROR-ADDITION(3), ERROR-ADDITION(4), ERROR-ADDITION(5)
           USING MAP 'XPERVW0M'
     ELSE
        INPUT WINDOW='ERROR-WINDOW'
           WITH TEXT *ERROR-NUMBER, ERROR-ADDITION(1), ERROR-ADDITION(2),
                 ERROR-ADDITION(3), ERROR-ADDITION(4), ERROR-ADDITION(5)
           USING MAP 'XPERVW0M'

     END-IF
  ELSE
     INPUT WINDOW='ERROR-WINDOW'
        WITH TEXT *RETURN-CODE, ERROR-ADDITION(1), ERROR-ADDITION(2),
             ERROR-ADDITION(3), ERROR-ADDITION(4), ERROR-ADDITION(5)
        USING MAP 'XPERVW0M'
  END-IF
  IF *PF-KEY EQ 'PF3' THEN
     ESCAPE BOTTOM
  END-IF
END-REPEAT
END-SUBROUTINE
END
