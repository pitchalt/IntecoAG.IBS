* >Natural Source Header 000000 /*<RO>>
* :NatName MMPONW0S
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
LOCAL USING MEPHMN0A
LOCAL USING UETXMN0A
END-DEFINE
DEFINE SUBROUTINE MMPONW0S
/*
RESET XXERX00A BO-COMMAND-PROCESS
/*
IF BM-COMMAND NE "NEW" THEN
  MOVE BM-COMMAND TO XXERX00A.ERROR-ADDITION(1)
  *ERROR-NR := EC-UNKNOW-COMMAND
END-IF
RESET BM-OBJECT
/*
MOVE 'Создать приход' TO MX-FUNCTION-NAME
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
MOVE MEPHMN0A.PO-ID TO BM-OBJECT
/*
DEFINE SUBROUTINE INTERFACE-BUILD
  INCLUDE XPCPRS0C
/* Общие команды
  INCLUDE XPCKAD0C "'EXIT'" "'EXIT'" "'PF3'" '"Выход"'
  INCLUDE XPCKAD0C "'EXIT'" "'EXIT'" "'CLR'" '"Выход"'
  DECIDE ON EVERY VALUE BM-COMMAND-PROCESS
     /* Строка инструментов
     VALUE "NEW-HDR"
        INCLUDE XPCBAD0C "'NEW'"   "'EDIT-LIST'"    '"Далее"'
     VALUE "EDIT-HDR"
        INCLUDE XPCBAD0C "'SAVE'"  "'EDIT-LIST'"    '"Далее"'
     VALUE "EDIT-LIST"
        INCLUDE XPCBAD0C "'CHECK'"  "'EDIT-HDR'"    '"Назад"'
        INCLUDE XPCBAD0C "'CHECK'"  "'EDIT-ZATR'"   '"Далее"'
     VALUE "EDIT-ZATR"
        INCLUDE XPCBAD0C "'CHECK'"  "'EDIT-LIST'"    '"Назад"'
        INCLUDE XPCBAD0C "'CHECK'"  "'SAVE'"         '"Далее"'
     /* Клавиши
     VALUE "NEW-HDR"
        INCLUDE XPCKAD0C "'NEW'"   "'EDIT-LIST'" "'PF5'"  '"Далее"'
     VALUE "EDIT-HDR"
        INCLUDE XPCKAD0C "'SAVE'"  "'EDIT-LIST'" "'PF5'"  '"Далее"'
     VALUE "NEW-HDR", "EDIT-HDR"
        INCLUDE XPCKAD1C "'SELECT'"   "'PF11'" '"Выбор"'
        INCLUDE XPCKAD1C "'CHECK'"    "'ENTR'" '"Провр"'
     VALUE "EDIT-LIST"
        INCLUDE XPCKAD1C "'CHECK'"   "'ENTR'" '"Провр"'
        INCLUDE XPCKAD0C "'CHECK'"   "'EDIT-ZATR'" "'PF5'"  '"Далее"'
     VALUE "EDIT-ZATR"
        INCLUDE XPCKAD1C "'CHECK'"   "'ENTR'" '"Провр"'
        INCLUDE XPCKAD0C "'CHECK'"   "'SAVE'" "'PF5'"  '"Готово"'
     VALUE "EDIT-LIST", 'EDIT-ZATR'
        INCLUDE XPCKAD2C /* Листание списка
        INCLUDE XPCKAD3C /* Редактирование списка
     NONE VALUE
        IGNORE
  END-DECIDE
END-SUBROUTINE
/*
DEFINE SUBROUTINE COMMAND-PROCESS
  DECIDE ON FIRST VALUE BM-COMMAND-PROCESS
     VALUE "EDIT-ZATR"
        MOVE "EDIT" TO MX-COMMAND
        PERFORM MPPZLS0S XXERX00A XXCTXX0A XPMXXX1A MEPHMN0A UXCSXX0A
        IF RETURN-CODE NE 0 THEN *ERROR-NR := EC-QUIT-STACK-TRACE END-IF
     INCLUDE MMXXCP0C "MIPHMN0S" "MPPHMN0S" "MPPMLS0S" "MEPHMN0A"
  END-DECIDE
END-SUBROUTINE
/*
INCLUDE XMTXMN0C
/*
INCLUDE XMERSY1C
END-SUBROUTINE
END
