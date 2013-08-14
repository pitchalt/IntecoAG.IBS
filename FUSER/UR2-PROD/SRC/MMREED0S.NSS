* >Natural Source Header 000000 /*<RO>>
* :NatName MMREED0S
* :UID PAUL
* :Mode S
* :CP
* :Date 20000102
* :Time 0000000
* <Natural Source Header /*<<RO>
/***********************************************************************
/*
/* СИСТЕМА: ARM-K
/* ПРОГРАММА: БИЗНЕС МЕТОД
/*
/* РАЗРАБОТЧИК: УЗОРИН П.А.
/* ДАТА ВЫПУСКА:
/*
/* НАЗВАНИЕ: ПРИХОДНЫЙ ОРДЕР УПРАВЛЯТЬ
/* КОМАНДЫ:
/*  - NEW
/*  - EDIT
/*  - VIEW
/*
/* ИСПРАВЛЕНИЯ:
/*
/***********************************************************************
DEFINE DATA
PARAMETER USING XXERX00A
PARAMETER USING XXCTXX0A
PARAMETER USING XMBMXX1A
PARAMETER USING UXCSXX0A
/*
LOCAL USING XXXXEC0L
LOCAL USING XPMXXX1A
LOCAL USING MEREHM0A
LOCAL USING MEREML0A
LOCAL USING UETXMN0A
END-DEFINE
DEFINE SUBROUTINE MMREED0S
/*
RESET XXERX00A BO-COMMAND-PROCESS
/*
IF BM-COMMAND NE "EDIT" AND BM-COMMAND NE "VIEW" THEN
  MOVE BM-COMMAND TO XXERX00A.ERROR-ADDITION(1)
  *ERROR-NR := EC-UNKNOW-COMMAND
END-IF
IF BM-OBJECT EQ 0 THEN
  *ERROR-NR := EC-OBJECT-ID-REQUIRED
END-IF
MOVE BM-OBJECT TO MEREHM0A.REH-ID
/*
MOVE 'Редактировать отпуск на сторону' TO MX-FUNCTION-NAME
/*
MOVE BM-COMMAND TO BM-COMMAND-PROCESS
/*
REPEAT
/*  WRITE BM-OBJECT BM-COMMAND BM-COMMAND-EXIT MX-COMMAND MX-COMMAND-EXIT
  PERFORM INTERFACE-BUILD
  PERFORM COMMAND-PROCESS
  IF RETURN-CODE NE 0 THEN ESCAPE BOTTOM END-IF
  UNTIL BO-COMMAND-PROCESS NE " "
END-REPEAT
/*
DEFINE SUBROUTINE INTERFACE-BUILD
  INCLUDE XPCPRS0C
/* Общие команды
  INCLUDE XPCKAD0C "'EXIT'" "'EXIT'" "'PF3'" '"Выход"'
  INCLUDE XPCKAD0C "'EXIT'" "'EXIT'" "'CLR'" '"Выход"'
  DECIDE ON EVERY VALUE BM-COMMAND-PROCESS
     /* Строка инструментов
     VALUE "EDIT-HDR"
        INCLUDE XPCBAD0C "'CHECK'"  "' '"            '"Шапка"'
        INCLUDE XPCBAD0C "'SAVE'"   "'EDIT-LIST'"    '"ТМЦ"'
     VALUE "EDIT-LIST"
        INCLUDE XPCBAD0C "'CHECK'"  "'EDIT-HDR'"     '"Шапка"'
        INCLUDE XPCBAD0C "'CHECK'"  "' '"            '"ТМЦ"'
     /* Клавиши
     VALUE "EDIT-HDR"
        INCLUDE XPCKAD1C "'SELECT'"   "'PF11'" '"Выбор"'
        INCLUDE XPCKAD1C "'CHECK'"    "'ENTR'" '"Провр"'
        INCLUDE XPCKAD0C "'SAVE'"     "'SAVE'" "'PF5'" '"Готов"'
     VALUE "EDIT-LIST" /*, 'NEW-PTLS', 'NEW-PZLS'
        INCLUDE XPCKAD0C "'CHECK'"  "'SAVE'" "'PF5'" '"Готов"'
        INCLUDE XPCKAD2C /* Листание списка
        INCLUDE XPCKAD3C /* Редактирование списка
     NONE VALUE
        IGNORE
  END-DECIDE
END-SUBROUTINE
/*
DEFINE SUBROUTINE COMMAND-PROCESS
  DECIDE ON FIRST VALUE BM-COMMAND-PROCESS
     INCLUDE MMXXCP0C "MIREHM0S" "MPREHM0S" "MPREML0S" "MEREHM0A"
  END-DECIDE
END-SUBROUTINE
/*
INCLUDE XMTXMN0C
/*
INCLUDE XMERSY1C
END-SUBROUTINE
END
