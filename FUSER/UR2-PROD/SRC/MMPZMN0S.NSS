* >Natural Source Header 000000 /*<RO>>
* :NatName MMPZMN0S
* :UID PAUL
* :Mode S
* :CP
* :Date 20061128
* :Time 1941000
* <Natural Source Header /*<<RO>
/***********************************************************************
/*
/* яхярелю: ARM-K
/* опнцпюллю: ахгмея лернд
/*
/* пюгпюанрвхй: сгнпхм о.ю.
/* дюрю бшосяйю:
/*
/* мюгбюмхе: сопюбкърэ люрепхюкэмни онгхжхеи опхундмнцн нпдепю
/* йнлюмдш:
/*  - NEW
/*  - EDIT
/*  - VIEW
/*
/* хяопюбкемхъ:
/*
/***********************************************************************
DEFINE DATA
PARAMETER USING XXERX00A
PARAMETER USING XXCTXX0A
PARAMETER USING XMBMXX1A
PARAMETER USING MEPHMN0A
PARAMETER USING UXCSXX0A
/*
LOCAL USING XXXXEC0L
LOCAL USING XPMXXX1A
LOCAL USING MEPZMN0A
END-DEFINE
DEFINE SUBROUTINE MMPZMN0S
/*
IF BM-COMMAND NE 'NEW' AND BM-COMMAND NE 'EDIT' AND
   BM-COMMAND NE 'VIEW' AND BM-COMMAND NE "DELETE" THEN
     MOVE BM-COMMAND TO ERROR-ADDITION(1)
     *ERROR-NR := EC-UNKNOW-COMMAND
END-IF
/*
IF BM-COMMAND NE 'NEW' THEN
  IF BM-OBJECT EQ 0 THEN
     *ERROR-NR := EC-OBJECT-ID-REQUIRED
  END-IF
ELSE
  RESET BM-OBJECT
END-IF
IF MEPHMN0A.PO-ID EQ 0 THEN
  *ERROR-NR := EC-OBJECT-ID-REQUIRED
END-IF
/*
MOVE BM-OBJECT TO MEPZMN0A.PZ-ID
MOVE MEPHMN0A.PO-ID TO MEPZMN0A.PO-ID
/*
MOVE BM-COMMAND TO BM-COMMAND-PROCESS
/*
DECIDE ON FIRST VALUE BM-COMMAND
  VALUE "NEW"
     MX-FUNCTION-NAME := 'мНБЮ  ОНГХЖХ '
  VALUE "EDIT"
     MX-FUNCTION-NAME := 'пЕДЮЙРХПНБЮМХЕ ОНГХЖХХ'
  VALUE "VIEW"
     MX-FUNCTION-NAME := 'оПНЯЛНРП ОНГХЖХХ'
  NONE VALUE
     IGNORE
END-DECIDE
/*
REPEAT
/*  WRITE BM-OBJECT BM-COMMAND BM-COMMAND-EXIT MX-COMMAND MX-COMMAND-EXIT
  PERFORM INTERFACE-BUILD
  PERFORM COMMAND-PROCESS
  UNTIL BO-COMMAND-PROCESS NE " "
END-REPEAT
/* ярюмдюпрмши хмрептеия онкэгнбюрекъ
INCLUDE MMXXMN5C
/* ярюмдюпрмше йнлюмдш
INCLUDE MMXXMN6C "MIPZMN0S" "MPPZMN0S" "MEPHMN0A" "MEPZMN0A"
/*
INCLUDE XXERSY1C
END-SUBROUTINE
END

