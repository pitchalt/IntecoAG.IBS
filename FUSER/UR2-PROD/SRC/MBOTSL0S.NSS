* >Natural Source Header 000000 /*<RO>>
* :NatName MBOTSL0S
* :UID Админист
* :Mode S
* :CP
* :Date 20000102
* :Time 0000000
* <Natural Source Header /*<<RO>
/***********************************************************************
/*
/* СИСТЕМА: ARM-K
/* ПРОГРАММА:
/*
/* РАЗРАБОТЧИК: Ковальчук О.Д.
/* ДАТА ВЫПУСКА:
/*
/* НАЗВАНИЕ: Заполение реквизитов дл  поиска сальдо
/* КОМАНДЫ:
/*  - NEW
/*  - VIEW
/*
/* ИСПРАВЛЕНИЯ:
/*
/***********************************************************************
DEFINE DATA
PARAMETER USING XXERX00A
PARAMETER USING MBOTSL0A
PARAMETER USING MBXXOP0A
/* ОПИСАНИЕ ЭКРАННОЙ ФОРМЫ
LOCAL USING MBOTSL0L
LOCAL USING XXXXEC0L
LOCAL USING MBXXOP0L
LOCAL
1 #I          (I4)
1 #J          (I4)
1 #K          (I4)
1 #CURS-FIELD (I4)
END-DEFINE
DEFINE SUBROUTINE MBOTSL0S
RESET XXERX00A MBOTSL0A.XX-COMMAND
SET KEY PF4 NAMED 'Выбор'
SET KEY ENTR NAMED 'Выбор'
SET KEY PF3 NAMED 'Выход'
SET CONTROL "M03"
SET CONTROL 'M=RE'
MOVE *PROGRAM TO MBOTSL0L.OT-VIEW-PROGRAM
/*
MBOTSL0L.SL-CMD-C(*) := (AD=PN)
FOR #I = 1 TO MBXXOP0L-CONST.OP-ARRAY-ELEM
  IF MBXXOP0A.OP-CODE-AT(#I) = 0
     ESCAPE BOTTOM
  END-IF
  IF MBXXOP0A.OP-ATTR(#I) = "AN" AND MBXXOP0A.OP-PRIZNAK(#I) = TRUE THEN
     FOR #J = 1 TO 20
        IF MBOTSL0A.OT-FIX-ANALITIK(#J) = 0 THEN
           ADD 1 TO #K
           MBOTSL0L.SL-CODE-AT(#K) := MBXXOP0A.OP-CODE-AT(#I)
           MBOTSL0L.SL-NAME(#K) := MBXXOP0A.OP-TITLE(#I)
           RESET MBOTSL0L.SL-CMD-C(#K)
           ESCAPE BOTTOM
        END-IF
        IF MBOTSL0A.OT-FIX-ANALITIK(#J) = MBXXOP0A.OP-CODE-AT(#I)
           ESCAPE BOTTOM
        END-IF
     END-FOR
  END-IF
END-FOR
IF MBOTSL0A.OT-OP-COMMAND NE ' ' THEN
  IF MBOTSL0A.OT-OP-COMMAND EQ "DOWN" OR
    (MBOTSL0A.OT-OP-COMMAND EQ "REFRECH" AND MBOTSL0A.OT-LEVEL > 1)
    ADD 1 TO #K
    MBOTSL0L.SL-CODE-AT(#K) := 0
    MBOTSL0L.SL-NAME(#K) := 'Отображение операций.'
    RESET MBOTSL0L.SL-CMD-C(#K)
END-IF
END-IF


IF #K = 0
  MBOTSL0A.XX-COMMAND := 'EXIT'
  XXERX00A.RETURN-CODE := -1
  *ERROR-NR := XXXXEC0L.EC-OBJECT-NOT-FOUND
  ESCAPE ROUTINE
END-IF
/*
REPEAT
/*
INPUT USING MAP "MBOTSL0M"
/*
DECIDE ON FIRST VALUE *PF-KEY
  VALUE 'PF3'
     MBOTSL0A.XX-COMMAND := 'EXIT'
     ESCAPE ROUTINE
  VALUE 'PF4' , 'ENTR'
     #CURS-FIELD := *CURS-FIELD
     FOR #I = 1 TO 15
        IF #CURS-FIELD EQ POS(MBOTSL0L.SL-CMD(#I))
           IF MBOTSL0L.SL-CODE-AT(#I) = 0 AND
              MBOTSL0L.SL-NAME(#I) = 'Отображение операций.'
              MBOTSL0A.OT-OP-COMMAND := "VIEW-OP"
              ESCAPE ROUTINE
           END-IF
           MBOTSL0A.OT-CODE := MBOTSL0L.SL-CODE-AT(#I)
           ESCAPE ROUTINE
        END-IF
     END-FOR
  NONE VALUE IGNORE
END-DECIDE
END-REPEAT
INCLUDE XXERSY1C
END-SUBROUTINE
END


