* >Natural Source Header 000000 /*<RO>>
* :NatName UBCLMN0S
* :UID INTECO
* :Mode S
* :CP
* :Date 20060526
* :Time 1839000
* <Natural Source Header /*<<RO>
/***********************************************************************
/*
/* —»—“≈Ã¿:
/* œ–Œ√–¿ÃÃ¿:
/*
/* –¿«–¿¡Œ“◊» :  ”«Œ–»Õ œ.¿.
/* ƒ¿“¿ ¬€œ”— ¿:
/*
/* Õ¿«¬¿Õ»≈:  ”–Œ¬≈Õ‹ ¡»«Õ≈— –¿¡Œ“¿ — Œœ»—¿Õ»≈Ã «¿œ»—» ƒŒ ”Ã≈Õ“¿
/*
/*  ŒÃ¿Õƒ€:
/*   READ
/*   ADD
/*   UPDATE
/*   DELETE
/*
/* »—œ–¿¬À≈Õ»ﬂ:
/*
/***********************************************************************
DEFINE DATA
PARAMETER USING XXERX00A
PARAMETER USING XXCTXX0A
PARAMETER USING UBCLMN0A
PARAMETER USING UXCSXX0A
/*
LOCAL USING XXXXEC0L
/*LOCAL USING UDITMN0A
END-DEFINE
/*
DEFINE SUBROUTINE UBCLMN0S
RESET XXERX00A
/*
DECIDE ON FIRST VALUE BL-COMMAND
VALUE 'READ'
  PERFORM RECORD-READ
NONE VALUE
  MOVE BL-COMMAND TO ERROR-ADDITION(1)
  *ERROR-NR := EC-UNKNOW-COMMAND
END-DECIDE
/*
DEFINE SUBROUTINE RECORD-READ
  IF UBCLMN0A.CL-ID EQ 0 THEN
     *ERROR-NR := EC-OBJECT-ID-REQUIRED
  END-IF
  DECIDE ON FIRST VALUE UBCLMN0A.CL-ID
     VALUE 1000
        CL-COMBINATOR-ID := 1001
        CL-OP-CURRENT-ID := 1002
        CL-OP-CONFIRM-ID := 1003
        CL-SA-CURRENT-ID := 1004
        MOVE 901 TO AD-ATTR-IDS(1)
        MOVE 902 TO AD-ATTR-IDS(2)
        MOVE 903 TO AD-ATTR-IDS(3)
     VALUE 2000
        CL-COMBINATOR-ID := 2001
        CL-OP-CURRENT-ID := 2002
        CL-OP-CONFIRM-ID := 2003
        CL-SA-CURRENT-ID := 2004
        MOVE 901 TO AD-ATTR-IDS(1)
        MOVE 902 TO AD-ATTR-IDS(2)
        MOVE 903 TO AD-ATTR-IDS(3)
     VALUE -1000
        CL-COMBINATOR-ID := -1001
        CL-OP-CURRENT-ID := -1002
        CL-OP-CONFIRM-ID := -1003
        CL-SA-CURRENT-ID := -1004
        MOVE 901 TO AD-ATTR-IDS(1)
        MOVE 902 TO AD-ATTR-IDS(2)
        MOVE 903 TO AD-ATTR-IDS(3)
     NONE VALUE
        *ERROR-NR := EC-UNKNOW-COMMAND
  END-DECIDE
END-SUBROUTINE
/*
INCLUDE XXERSY1C
END-SUBROUTINE
END
