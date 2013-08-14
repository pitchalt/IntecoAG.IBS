* >Natural Source Header 000000 /*<RO>>
* :NatName MMRONW0S
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
LOCAL USING MERHMN0A
LOCAL USING UETXMN0A
END-DEFINE
DEFINE SUBROUTINE MMRONW0S
/*
RESET XXERX00A BO-COMMAND-PROCESS
/*
IF BM-COMMAND NE "NEW" THEN
  MOVE BM-COMMAND TO XXERX00A.ERROR-ADDITION(1)
  *ERROR-NR := EC-UNKNOW-COMMAND
END-IF
RESET BM-OBJECT
/*
MOVE 'Создать расход' TO MX-FUNCTION-NAME
/*
MOVE BM-COMMAND TO BM-COMMAND-PROCESS
/*
REPEAT
/*  WRITE BM-OBJECT BM-COMMAND BM-COMMAND-PROCESS MERHMN0A.RO-NUMBER MERHMN0A.RO-DATE
  PERFORM INTERFACE-BUILD
  PERFORM COMMAND-PROCESS
  IF RETURN-CODE NE 0 THEN ESCAPE BOTTOM END-IF
  UNTIL BO-COMMAND-PROCESS NE " "
END-REPEAT
/*
MOVE MERHMN0A.RO-ID TO BM-OBJECT
/*
DEFINE SUBROUTINE INTERFACE-BUILD
  INCLUDE XPCPRS0C
/* Общие команды
  INCLUDE XPCKAD0C "'EXIT'" "'EXIT'" "'PF3'" '"Выход"'
  INCLUDE XPCKAD0C "'EXIT'" "'EXIT'" "'CLR'" '"Выход"'
  DECIDE ON EVERY VALUE BM-COMMAND-PROCESS
     /* Строка инструментов
     VALUE "NEW-HDR"
        IF MERHMN0A.IS-MT-REQUIRED THEN
           INCLUDE XPCBAD0C "'NEW'"   "'EDIT-OST'"    '"Далее"'
        ELSE
           INCLUDE XPCBAD0C "'NEW'"   "'EDIT-LIST'"    '"Далее"'
        END-IF
     VALUE "EDIT-HDR"
        IF MERHMN0A.IS-MT-REQUIRED THEN
           INCLUDE XPCBAD0C "'SAVE'"  "'EDIT-OST'"    '"Далее"'
        ELSE
           INCLUDE XPCBAD0C "'SAVE'"  "'EDIT-LIST'"    '"Далее"'
        END-IF
     VALUE "EDIT-OST"
        INCLUDE XPCBAD0C "'CHECK'"  "'EDIT-HDR'"    '"Назад"'
        INCLUDE XPCBAD0C "'CHECK'"  "'EDIT-LIST'"   '"Далее"'
     VALUE "EDIT-LIST"
        IF MERHMN0A.IS-MT-REQUIRED THEN
           INCLUDE XPCBAD0C "'CHECK'"  "'EDIT-OST'"    '"Назад"'
        ELSE
           INCLUDE XPCBAD0C "'CHECK'"  "'EDIT-HDR'"    '"Назад"'
        END-IF
        INCLUDE XPCBAD0C "'CHECK'"  "'SAVE'"        '"Готово"'
     /* Клавиши
     VALUE "NEW-HDR"
        IF MERHMN0A.IS-MT-REQUIRED THEN
           INCLUDE XPCKAD0C "'NEW'"   "'EDIT-OST'" "'PF5'"  '"Далее"'
        ELSE
           INCLUDE XPCKAD0C "'NEW'"   "'EDIT-LIST'" "'PF5'"  '"Далее"'
        END-IF
     VALUE "EDIT-HDR"
        IF MERHMN0A.IS-MT-REQUIRED THEN
           INCLUDE XPCKAD0C "'SAVE'"  "'EDIT-OST'" "'PF5'"  '"Далее"'
        ELSE
           INCLUDE XPCKAD0C "'SAVE'"  "'EDIT-LIST'" "'PF5'"  '"Далее"'
        END-IF
     VALUE "NEW-HDR", "EDIT-HDR"
        INCLUDE XPCKAD1C "'SELECT'"   "'PF11'" '"Выбор"'
        INCLUDE XPCKAD1C "'CHECK'"    "'ENTR'" '"Провр"'
     VALUE "EDIT-OST"
        INCLUDE XPCKAD2C /* Листание списка
        INCLUDE XPCKAD0C "'SAVE'"  "'EDIT-LIST'" "'PF5'"  '"Далее"'
        INCLUDE XPCKAD1C "'LINE-EDIT'"   "'PF4'" '"Редак"'
     VALUE "EDIT-LIST"
        INCLUDE XPCKAD1C "'CHECK'"   "'ENTR'" '"Провр"'
        INCLUDE XPCKAD0C "'CHECK'"   "'SAVE'" "'PF5'"  '"Готово"'
        INCLUDE XPCKAD2C /* Листание списка
        IF NOT MERHMN0A.IS-MT-REQUIRED THEN
           INCLUDE XPCKAD1C "'LINE-NEW'"    "'PF2'" '"Добав"'
        END-IF
        INCLUDE XPCKAD1C "'LINE-EDIT'"   "'PF4'" '"Редак"'
        INCLUDE XPCKAD1C "'LINE-DEL'"    "'PF6'" '"Удал"'
     NONE VALUE
        IGNORE
  END-DECIDE
END-SUBROUTINE
/*
DEFINE SUBROUTINE COMMAND-PROCESS
  DECIDE ON FIRST VALUE BM-COMMAND-PROCESS
     VALUE "EDIT-OST"
        MOVE "NEW" TO MX-COMMAND
        PERFORM MPROSL0S XXERX00A XXCTXX0A XPMXXX1A MERHMN0A UXCSXX0A
        IF RETURN-CODE NE 0 THEN *ERROR-NR := EC-QUIT-STACK-TRACE END-IF
     INCLUDE MMXXCP0C "MIRHMN0S" "MPRHMN0S" "MPRMLS0S" "MERHMN0A"
  END-DECIDE
END-SUBROUTINE
/*
INCLUDE XMTXMN0C
/*
INCLUDE XMERSY1C
END-SUBROUTINE
END
