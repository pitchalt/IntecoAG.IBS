* >Natural Source Header 000000 /*<RO>>
* :NatName UDOPPC0S
* :UID INTECO
* :Mode S
* :CP
* :Date 20060516
* :Time 1132000
* <Natural Source Header /*<<RO>
/***********************************************************************
/*
/* —»—“≈Ã¿:
/* œ–Œ√–¿ÃÃ¿:
/*
/* –¿«–¿¡Œ“◊» :  ”«Œ–»Õ œ.¿.
/* ƒ¿“¿ ¬€œ”— ¿:
/*
/* Õ¿«¬¿Õ»≈:  ”–Œ¬≈Õ‹ ƒ¿ÕÕ€’ –¿¡Œ“¿ — «¿œ»—‹ﬁ ƒŒ ”Ã≈Õ“¿
/*
/*  ŒÃ¿Õƒ€:
/*   GETNUMBER
/*   GETLIST
/* »—œ–¿¬À≈Õ»ﬂ:
/*
/***********************************************************************
DEFINE DATA
PARAMETER USING XXERX00A
PARAMETER USING UDOPPC0A
/*
LOCAL USING XXXXEC0L
LOCAL USING UXXXEC0L
LOCAL USING UDXXID0L
LOCAL USING UDOPMN0L
/*
LOCAL
1 #COUNT       (I4)
END-DEFINE
DEFINE SUBROUTINE UDOPPC0S
RESET XXERX00A
/*
DECIDE ON FIRST VALUE DL-COMMAND
VALUE 'GETNUMBER'
  PERFORM GET-NUMBER
VALUE 'GETLIST'
  PERFORM GET-LIST
NONE VALUE
  MOVE DL-COMMAND TO ERROR-ADDITION(1)
  *ERROR-NR := EC-UNKNOW-COMMAND
END-DECIDE
/*
DEFINE SUBROUTINE GET-NUMBER
FN1.
  FIND NUMBER UR-ACC-OP-ID-VIEW WITH OP-PACK-REQUIRED NE 0
  MOVE *NUMBER (FN1.) TO OP-NUMBER
END-SUBROUTINE
/*
DEFINE SUBROUTINE GET-LIST
  FIND (20) UR-ACC-OP-ID-VIEW WITH OP-PACK-REQUIRED NE 0
     ADD 1 TO #COUNT
     MOVE UR-ACC-OP-ID-VIEW.OP-ID(1) TO OP-LIST-ID(#COUNT)
  END-FIND
END-SUBROUTINE
/*
INCLUDE XXERSY1C
END-SUBROUTINE
END

