* >Natural Source Header 000000 /*<RO>>
* :NatName MMMZMN0S
* :UID PAUL
* :Mode S
* :CP
* :Date 20061109
* :Time 1352000
* <Natural Source Header /*<<RO>
/***********************************************************************
/*
/* СИСТЕМА: ARM-K
/* ПРОГРАММА: БИЗНЕС МЕТОД
/*
/* РАЗРАБОТЧИК: УЗОРИН П.А.
/* ДАТА ВЫПУСКА:
/*
/* НАЗВАНИЕ: УПРАВЛЯТЬ МАТЕРИАЛЬНОЙ ПОЗИЦИЕЙ
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
/*PARAMETER USING MERXHM0A
PARAMETER USING MEMZMN0A
PARAMETER USING UXCSXX0A
/*
LOCAL USING XXXXEC0L
LOCAL USING XPMXXX1A
LOCAL USING UETXMN0A
END-DEFINE
DEFINE SUBROUTINE MMMZMN0S
RESET XXERX00A BO-COMMAND-PROCESS
/*
DECIDE ON EVERY VALUE BM-COMMAND
VALUE "NEW"
  MX-FUNCTION-NAME := 'Новый заменитель'
VALUE "VIEW"
  MX-FUNCTION-NAME := 'Просмотр заменител '
VALUE "NEW"
  RESET BM-OBJECT
VALUE "VIEW"
  IF BM-OBJECT EQ 0 THEN *ERROR-NR := EC-OBJECT-ID-REQUIRED END-IF
NONE VALUE
  MOVE BM-COMMAND TO ERROR-ADDITION(1)
  *ERROR-NR := EC-UNKNOW-COMMAND
END-DECIDE
/*
MOVE BM-OBJECT TO MEMZMN0A.MZ-ID
/*
MOVE BM-COMMAND TO BM-COMMAND-PROCESS
/*
REPEAT
/*  WRITE BM-OBJECT BM-COMMAND BM-COMMAND-EXIT MX-COMMAND MX-COMMAND-EXIT
  PERFORM INTERFACE-BUILD
/*  IF *USER = "PAUL" THEN WRITE *PROGRAM BM-COMMAND-PROCESS MERXMM0A.ZK-ID END-IF
  PERFORM COMMAND-PROCESS
/*  IF *USER = "PAUL" THEN WRITE *PROGRAM BM-COMMAND-PROCESS MERXMM0A.ZK-ID END-IF
  IF RETURN-CODE NE 0 THEN ESCAPE ROUTINE END-IF
  UNTIL BO-COMMAND-PROCESS NE " "
END-REPEAT
/* СТАНДАРТНЫЙ ИНТЕРФЕЙС ПОЛЬЗОВАТЕЛЯ
DEFINE SUBROUTINE INTERFACE-BUILD
/* RESET COMMAND
  INCLUDE XPCPRS0C
/* COMMON COMMAND
  INCLUDE XPCKAD0C "'EXIT'" "'EXIT'" "'PF3'" '"Выход"'
  INCLUDE XPCKAD0C "'EXIT'" "'EXIT'" "'CLR'" '"Выход"'
  DECIDE ON EVERY VALUE BM-COMMAND-PROCESS
     /* Строка инструментов
/*     VALUE "NEW-HDR"
/*        INCLUDE XPCBAD0C "'NEW'"    "'EDIT-LIST'"     '"Bыдач"'
/*     VALUE "EDIT-HDR"
/*        INCLUDE XPCBAD0C "'CHECK'"  "' '"            '"Материал"'
/*        INCLUDE XPCBAD0C "'SAVE'"   "'EDIT-LIST'"    '"Партии"'
/*     VALUE "EDIT-LIST"
/*        INCLUDE XPCBAD0C "'CHECK'"  "'EDIT-HDR'"     '"Материал"'
/*        INCLUDE XPCBAD0C "'CHECK'"  "' '"            '"Партии"'
/*     VALUE "VIEW-HDR"
/*        INCLUDE XPCBAD0C "'EXIT'"  "' '"             '"Материал"'
/*        INCLUDE XPCBAD0C "'EXIT'"  "'VIEW-LIST'"     '"Партии"'
/*     VALUE "VIEW-LIST"
/*        INCLUDE XPCBAD0C "'EXIT'"  "'VIEW-HDR'"      '"Материал"'
/*        INCLUDE XPCBAD0C "'EXIT'"  "' '"             '"Партии"'
     /* Клавиши
     VALUE "NEW-HDR"
        INCLUDE XPCKAD1C "'SELECT'" "'PF11'" '"Выбор"'
        INCLUDE XPCKAD1C "'CHECK'"  "'ENTR'" '"Провр"'
/*     VALUE "EDIT-LIST", "VIEW-LIST", "EDIT-PARTY"
/*        INCLUDE XPCKAD2C /* Листание списка
     VALUE "NEW-HDR"
        INCLUDE XPCKAD0C "'NEW'"   "'SAVE'" "'PF5'"  '"Добав"'
/*     VALUE "EDIT-HDR"
/*        INCLUDE XPCKAD0C "'SAVE'"  "'SAVE'" "'PF5'"  '"Готов"'
/*     VALUE "EDIT-PARTY"
/*        INCLUDE XPCKAD0C "'SAVE'"  "'SAVE-PARTY'" "'PF5'"  '"Сохрн"'
/*     VALUE "EDIT-LIST", "EDIT-PARTY"
/*        INCLUDE XPCKAD1C "'CHECK'"   "'ENTR'" '"Провр"'
     NONE VALUE
        IGNORE
  END-DECIDE
END-SUBROUTINE
/* СТАНДАРТНЫЕ КОМАНДЫ
DEFINE SUBROUTINE COMMAND-PROCESS
  DECIDE ON FIRST VALUE BM-COMMAND-PROCESS
     INCLUDE MMXXCP1C "MIMZMN0S" "MPMZMN0S" "MPMZMN0S" "MEMZMN0A"
  END-DECIDE
END-SUBROUTINE
/*
INCLUDE XMTXMN0C
/*
INCLUDE XMERSY1C
END-SUBROUTINE
END

