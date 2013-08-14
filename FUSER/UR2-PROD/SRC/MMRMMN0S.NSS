* >Natural Source Header 000000 /*<RO>>
* :NatName MMRMMN0S
* :UID INTECO
* :Mode S
* :CP
* :Date 20060718
* :Time 1529000
* <Natural Source Header /*<<RO>
/***********************************************************************
/*
/* СИСТЕМА: ARM-K
/* ПРОГРАММА: БИЗНЕС МЕТОД
/*
/* РАЗРАБОТЧИК: УЗОРИН П.А.
/* ДАТА ВЫПУСКА:
/*
/* НАЗВАНИЕ: УПРАВЛЯТЬ МАТЕРИАЛЬНОЙ ПОЗИЦИЕЙ ПРИХОДНОГО ОРДЕРА
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
PARAMETER USING MERHMN0A
PARAMETER USING UXCSXX0A
/*
LOCAL USING XXXXEC0L
LOCAL USING XPMXXX1A
LOCAL USING MERMMN0A
LOCAL USING UETXMN0A
END-DEFINE
DEFINE SUBROUTINE MMRMMN0S
RESET XXERX00A BO-COMMAND-PROCESS
/*
IF BM-COMMAND NE "NEW" AND BM-COMMAND NE "EDIT" AND
   BM-COMMAND NE "VIEW" AND BM-COMMAND NE "DELETE" THEN
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
IF MERHMN0A.RO-ID EQ 0 THEN
  *ERROR-NR := EC-OBJECT-ID-REQUIRED
END-IF
/*
MOVE BM-OBJECT TO MERMMN0A.RM-ID
MOVE MERHMN0A.RO-ID TO MERMMN0A.RO-ID
/*
MOVE BM-COMMAND TO BM-COMMAND-PROCESS
/*
DECIDE ON FIRST VALUE BM-COMMAND
  VALUE "NEW"
     MX-FUNCTION-NAME := 'Нова  позици '
  VALUE "EDIT"
     MX-FUNCTION-NAME := 'Редактирование позиции'
  VALUE "VIEW"
     MX-FUNCTION-NAME := 'Просмотр позиции'
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
/* СТАНДАРТНЫЙ ИНТЕРФЕЙС ПОЛЬЗОВАТЕЛЯ
/*INCLUDE MMXXMN5C
DEFINE SUBROUTINE INTERFACE-BUILD
/* RESET COMMAND
  INCLUDE XPCPRS0C
/* COMMON COMMAND
  INCLUDE XPCKAD0C "'EXIT'" "'EXIT'" "'PF3'" '"Выход"'
  INCLUDE XPCKAD0C "'EXIT'" "'EXIT'" "'CLR'" '"Выход"'
  DECIDE ON EVERY VALUE BM-COMMAND-PROCESS
     /* Строка инструментов
     VALUE "NEW-HDR"
        INCLUDE XPCBAD0C "'NEW'"   "'EDIT-LIST'"     '"Добав"'
     VALUE "EDIT-HDR"
        INCLUDE XPCBAD0C "'CHECK'"  "' '"            '"Материал"'
        INCLUDE XPCBAD0C "'SAVE'"   "'EDIT-LIST'"    '"Партии"'
     VALUE "EDIT-LIST"
        INCLUDE XPCBAD0C "'CHECK'"  "'EDIT-HDR'"     '"Материал"'
        INCLUDE XPCBAD0C "'CHECK'"  "' '"            '"Партии"'
     VALUE "VIEW-HDR"
        INCLUDE XPCBAD0C "'EXIT'"  "' '"             '"Материал"'
        INCLUDE XPCBAD0C "'EXIT'"  "'VIEW-LIST'"     '"Партии"'
     VALUE "VIEW-LIST"
        INCLUDE XPCBAD0C "'EXIT'"  "'VIEW-HDR'"      '"Материал"'
        INCLUDE XPCBAD0C "'EXIT'"  "' '"             '"Партии"'
     /* Клавиши
     VALUE "NEW-HDR", "EDIT-HDR"
        INCLUDE XPCKAD1C "'SELECT'" "'PF11'" '"Выбор"'
        INCLUDE XPCKAD1C "'CHECK'"  "'ENTR'" '"Провр"'
     VALUE "EDIT-LIST", "VIEW-LIST"
        INCLUDE XPCKAD2C /* Листание списка
     VALUE "NEW-HDR"
        INCLUDE XPCKAD0C "'NEW'"   "'EDIT-LIST'" "'PF5'"  '"Добав"'
     VALUE "EDIT-HDR"
        INCLUDE XPCKAD0C "'SAVE'"  "'SAVE'" "'PF5'"  '"Готов"'
     VALUE "EDIT-LIST"
        INCLUDE XPCKAD1C "'CHECK'"   "'ENTR'" '"Провр"'
     NONE VALUE
        IGNORE
  END-DECIDE
END-SUBROUTINE
/* СТАНДАРТНЫЕ КОМАНДЫ
DEFINE SUBROUTINE COMMAND-PROCESS
  DECIDE ON FIRST VALUE BM-COMMAND-PROCESS
     INCLUDE MMXXCP1C "MIRMMN0S" "MPRMMN0S" "MPROPL0S" "MERMMN0A"
  END-DECIDE
END-SUBROUTINE
/*INCLUDE MMXXMN6C "MIRMMN0S" "MPRMMN0S" "MERHMN0A" "MERMMN0A"
/*
INCLUDE XMTXMN0C
/*
INCLUDE XMERSY1C
END-SUBROUTINE
END

