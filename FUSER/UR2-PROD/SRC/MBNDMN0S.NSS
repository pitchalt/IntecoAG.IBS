* >Natural Source Header 000000 /*<RO>>
* :NatName MBNDMN0S
* :UID INTECO
* :Mode S
* :CP
* :Date 20060611
* :Time 1523000
* <Natural Source Header /*<<RO>
/***********************************************************************
/*
/* —»—“≈Ã¿:
/* œ–Œ√–¿ÃÃ¿:
/*
/* –¿«–¿¡Œ“◊» :
/* ƒ¿“¿ ¬€œ”— ¿:
/*
/* Õ¿«¬¿Õ»≈:
/*  ŒÃ¿Õƒ€:
/*  - LOCATE
/*  - SELECT
/*
/* »—œ–¿¬À≈Õ»ﬂ:
/*
/***********************************************************************
DEFINE DATA
PARAMETER USING XXERX00A
PARAMETER USING XXCTXX0A
PARAMETER USING MBNDMN0A
/*PARAMETER USING UXCSXX0A
LOCAL USING XXXXEC0L
END-DEFINE
DEFINE SUBROUTINE MBNDMN0S
RESET XXERX00A
DECIDE ON FIRST VALUE MBNDMN0A.BL-COMMAND
  VALUE 'READ'
     PERFORM CHEK-RECORD
  VALUE 'CHEK'
     PERFORM CHEK-RECORD
  VALUE 'LOCATE'
     PERFORM LOCATE-RECORD
  NONE VALUE
     MOVE BL-COMMAND TO ERROR-ADDITION(1)
     *ERROR-NR := EC-UNKNOW-COMMAND
END-DECIDE
/*
DEFINE SUBROUTINE CHEK-RECORD
  IF MBNDMN0A.ND-ID = 0
     *ERROR-NR := EC-OBJECT-ID-REQUIRED
  END-IF
  DECIDE ON FIRST VALUE MBNDMN0A.ND-ID
     VALUE 1
           MBNDMN0A.ND-CODE := 1
           MBNDMN0A.ND-STAVKA := '20%'
           MBNDMN0A.ND-VALUE := 20
     VALUE 2
           MBNDMN0A.ND-CODE := 2
           MBNDMN0A.ND-STAVKA := '10%'
           MBNDMN0A.ND-VALUE := 10
     VALUE 3
           MBNDMN0A.ND-CODE := 3
           MBNDMN0A.ND-STAVKA := '0%'
           MBNDMN0A.ND-VALUE := 0
     VALUE 4
           MBNDMN0A.ND-CODE := 4
           MBNDMN0A.ND-STAVKA := 'Õ≈Œ¡À'
           MBNDMN0A.ND-VALUE := 0
     VALUE 5
           MBNDMN0A.ND-CODE := 5
           MBNDMN0A.ND-STAVKA := '18%'
           MBNDMN0A.ND-VALUE := 18
     NONE VALUE IGNORE
  END-DECIDE
END-SUBROUTINE
/*
DEFINE SUBROUTINE LOCATE-RECORD
  *ERROR-NR := EC-UNKNOW-COMMAND
/*  MOVE MBNDMN0A.ND-CODE TO MBNDMN0A.ND-ID
/*  PERFORM CHECK-RECORD
END-SUBROUTINE
/*
INCLUDE XXERSY1C
END-SUBROUTINE
END




