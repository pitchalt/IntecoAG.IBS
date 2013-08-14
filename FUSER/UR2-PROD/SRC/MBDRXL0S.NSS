* >Natural Source Header 000000 /*<RO>>
* :NatName MBDRXL0S
* :UID INTECO
* :Mode S
* :CP
* :Date 20061026
* :Time 1649000
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
/*
/* »—œ–¿¬À≈Õ»ﬂ:
/*
/***********************************************************************
DEFINE DATA
PARAMETER USING XXERX00A
PARAMETER USING XXCTXX0A
PARAMETER USING MBDRXL0A
PARAMETER USING UXCSXX0A
/*
LOCAL USING XXXXEC0L
LOCAL USING UDDRLS0A
END-DEFINE
DEFINE SUBROUTINE MBDRXL0S
/*
IF MBDRXL0A.DD-ID EQ 0 THEN *ERROR-NR := EC-OBJECT-ID-REQUIRED END-IF
IF MBDRXL0A.DR-UP-ID EQ 0 THEN *ERROR-NR := EC-OBJECT-ID-REQUIRED END-IF
INCLUDE MBXXLS0C "MBDRXL0A" "MBDRXL0A.DD-ID" "DR-UP-ID"
                 "DR-ID(*)" "DR-SORT(*)"
/*
INCLUDE XXERSY1C
END-SUBROUTINE
END

