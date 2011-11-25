* >Natural Source Header 000000 /*<RO>>
* :NatName MBXXOP0S
* :UID PAUL
* :Mode S
* :CP
* :Date 20070531
* :Time 1211000
* <Natural Source Header /*<<RO>
/* ОПИСАТЕЛЬ
/* 100 - описание дл  остатков
/* 200 - описание дл  оборотов
/* 300 - описание дл  материалов в цехе
/******************************************************

DEFINE DATA
PARAMETER USING XXERX00A
PARAMETER USING MBXXOP0A
/*
LOCAL USING MXITAT0L
LOCAL
1 #COUNTER   (I4)
END-DEFINE
DEFINE SUBROUTINE MBXXOP0S
  DECIDE ON FIRST MBXXOP0A.OP-COMMAND
     VALUE 'LOCATE'
        PERFORM LOCATE-OPISAN
     NONE VALUE
        IGNORE
  END-DECIDE
/*************************************************************
DEFINE SUBROUTINE LOCATE-OPISAN
/*
  IF OP-ID = 100 THEN    /*
     RESET #COUNTER
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10050
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TYPE-STEK(#COUNTER)  := "STEK-MT"
     OP-TITLE(#COUNTER)      := 'Материал'
     OP-ATTR(#COUNTER) := "AN"  /*
/*******
     ADD 1 TO #COUNTER
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-CODE-AT(#COUNTER)    := 10003
     OP-TYPE-STEK(#COUNTER)  := "STEK-MO"
     OP-TITLE(#COUNTER)      := 'Материально ответственный'
     OP-ATTR(#COUNTER) := "AN"  /*
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10061
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TYPE-STEK(#COUNTER)  := "STEK-GM"
     OP-TITLE(#COUNTER)      := 'Группы материалов'
     OP-ATTR(#COUNTER) := "AN"  /*
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10060
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TYPE-STEK(#COUNTER)  := "STEK-PR"
     OP-TITLE(#COUNTER)      := 'Партии'
     OP-ATTR(#COUNTER) := "AN"  /*
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10067
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TYPE-STEK(#COUNTER)  := "STEK-DF"
     OP-TITLE(#COUNTER)      := 'Признак годности'
     OP-ATTR(#COUNTER) := "AN"  /*
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 50000
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TYPE-STEK(#COUNTER)  := "STEK-IT"
     OP-TITLE(#COUNTER)      := 'Регистры'
     OP-ATTR(#COUNTER) := "AN"  /*
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10104
     OP-ATTR(#COUNTER) := "EI"
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TITLE(#COUNTER)      := 'ПЛАН ЕДИЗ'
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10103
     OP-ATTR(#COUNTER) := "PK"
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TITLE(#COUNTER)      := 'БАЗ.КОЛ.'
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10102
     OP-ATTR(#COUNTER) := "PK"
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TITLE(#COUNTER)      := 'ПРИХ.КОЛ'
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10104
     OP-ATTR(#COUNTER) := "PK"
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TITLE(#COUNTER)      := 'ПЛАН.КОЛ'
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10105
     OP-ATTR(#COUNTER) := "PK"
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TITLE(#COUNTER)      := 'СУММА'
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10103
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-ATTR(#COUNTER) := "EI"  /*
     OP-TITLE(#COUNTER)      := 'Баз Едиз'
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10102
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-ATTR(#COUNTER) := "EI"
     OP-TITLE(#COUNTER)      := 'ПРИХ ЕДИЗ'
/*******
  END-IF
/************************************************************
  IF OP-ID = 200 THEN
     RESET #COUNTER
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10050
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TYPE-STEK(#COUNTER)  := "STEK-MT"
     OP-TITLE(#COUNTER)      := 'Материал'
     OP-ATTR(#COUNTER) := "AN"  /*
/*******
     ADD 1 TO #COUNTER
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-CODE-AT(#COUNTER)    := 10003
     OP-TYPE-STEK(#COUNTER)  := "STEK-MO"
     OP-TITLE(#COUNTER)      := 'Материально ответственный'
     OP-ATTR(#COUNTER) := "AN"  /*
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10061
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TYPE-STEK(#COUNTER)  := "STEK-GM"
     OP-TITLE(#COUNTER)      := 'Группы материалов'
     OP-ATTR(#COUNTER) := "AN"  /*
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10060
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TYPE-STEK(#COUNTER)  := "STEK-PR"
     OP-TITLE(#COUNTER)      := 'Партии'
     OP-ATTR(#COUNTER) := "AN"  /*
/********
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10067
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TYPE-STEK(#COUNTER)  := "STEK-DF"
     OP-TITLE(#COUNTER)      := 'Признак годности'
     OP-ATTR(#COUNTER) := "AN"  /*
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10009
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TYPE-STEK(#COUNTER)  := "STEK-BS"
     OP-TITLE(#COUNTER)      := 'Субсчета'
     OP-ATTR(#COUNTER) := "AN"  /*
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 50000
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TYPE-STEK(#COUNTER)  := "STEK-IT"
     OP-TITLE(#COUNTER)      := 'Регистры'
     OP-ATTR(#COUNTER) := "AN"  /*
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10104
     OP-ATTR(#COUNTER) := "EI"
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TITLE(#COUNTER)      := 'ПЛАН ЕДИЗ'
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10103
     OP-ATTR(#COUNTER) := "PK1"
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TITLE(#COUNTER)      := 'БАЗ.КОЛ.'
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10103
     OP-ATTR(#COUNTER) := "PK2"
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TITLE(#COUNTER)      := 'БАЗ.КОЛ.'
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10103
     OP-ATTR(#COUNTER) := "PK3"
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TITLE(#COUNTER)      := 'БАЗ.КОЛ.'
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10103
     OP-ATTR(#COUNTER) := "PK4"
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TITLE(#COUNTER)      := 'БАЗ.КОЛ.'
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10102
     OP-ATTR(#COUNTER) := "PK1"
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TITLE(#COUNTER)      := 'ПРИХ.КОЛ'
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10102
     OP-ATTR(#COUNTER) := "PK2"
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TITLE(#COUNTER)      := 'ПРИХ.КОЛ'
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10102
     OP-ATTR(#COUNTER) := "PK3"
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TITLE(#COUNTER)      := 'ПРИХ.КОЛ'
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10102
     OP-ATTR(#COUNTER) := "PK4"
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TITLE(#COUNTER)      := 'ПРИХ.КОЛ'
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10104
     OP-ATTR(#COUNTER) := "PK1"
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TITLE(#COUNTER)      := 'ПЛАН.КОЛ'
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10104
     OP-ATTR(#COUNTER) := "PK2"
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TITLE(#COUNTER)      := 'ПЛАН.КОЛ'
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10104
     OP-ATTR(#COUNTER) := "PK3"
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TITLE(#COUNTER)      := 'ПЛАН.КОЛ'
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10104
     OP-ATTR(#COUNTER) := "PK4"
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TITLE(#COUNTER)      := 'ПЛАН.КОЛ'
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10105
     OP-ATTR(#COUNTER) := "PK1"
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TITLE(#COUNTER)      := 'СУММА'
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10105
     OP-ATTR(#COUNTER) := "PK2"
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TITLE(#COUNTER)      := 'СУММА'
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10105
     OP-ATTR(#COUNTER) := "PK3"
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TITLE(#COUNTER)      := 'СУММА'
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10105
     OP-ATTR(#COUNTER) := "PK4"
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TITLE(#COUNTER)      := 'СУММА'
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10103
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-ATTR(#COUNTER) := "EI"  /*
     OP-TITLE(#COUNTER)      := 'Баз Едиз'
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10102
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-ATTR(#COUNTER) := "EI"
     OP-TITLE(#COUNTER)      := 'ПРИХ ЕДИЗ'
  END-IF
/* КОДЫ
/* 10003 - МАТ ОТВЕТСТВЕН
/* 10050 - КОД МАТЕРИАЛА
/* 10080 - СЧЕТ МАТЕРИАЛА
/* 10075 - ГРУППЫ МАТЕРИАЛОВ
/*
/* 10011 - ЦЕНА
/* 10012 - СУММА
/* 10013 - СРЕДНЕЕ КОЛ
/**********************************************************
  IF OP-ID = 300 THEN    /*
     RESET #COUNTER
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10050
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TYPE-STEK(#COUNTER)  := "STEK-MT"
     OP-TITLE(#COUNTER)      := 'Материал'
     OP-ATTR(#COUNTER) := "AN"  /*
/*******
     ADD 1 TO #COUNTER
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-CODE-AT(#COUNTER)    := 10003
     OP-TYPE-STEK(#COUNTER)  := "STEK-MO"
     OP-TITLE(#COUNTER)      := 'Материально ответственный'
     OP-ATTR(#COUNTER) := "AN"  /*
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10061
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TYPE-STEK(#COUNTER)  := "STEK-GM"
     OP-TITLE(#COUNTER)      := 'Группы материалов'
     OP-ATTR(#COUNTER) := "AN"  /*
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10060
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TYPE-STEK(#COUNTER)  := "STEK-PR"
     OP-TITLE(#COUNTER)      := 'Партии'
     OP-ATTR(#COUNTER) := "AN"  /*
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10067
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TYPE-STEK(#COUNTER)  := "STEK-DF"
     OP-TITLE(#COUNTER)      := 'Признак годности'
     OP-ATTR(#COUNTER) := "AN"  /*
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10009
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TYPE-STEK(#COUNTER)  := "STEK-BS"
     OP-TITLE(#COUNTER)      := 'Субсчета'
     OP-ATTR(#COUNTER) := "AN"  /*
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 50000
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TYPE-STEK(#COUNTER)  := "STEK-IT"
     OP-TITLE(#COUNTER)      := 'Регистры'
     OP-ATTR(#COUNTER) := "AN"  /*
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10066
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TYPE-STEK(#COUNTER)  := "STEK-ZK"
     OP-TITLE(#COUNTER)      := 'Заказы'
     OP-ATTR(#COUNTER) := "AN"  /*
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := MT-BASE-ATTR-ID
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TYPE-STEK(#COUNTER)  := "MT-BASE"
     OP-TITLE(#COUNTER)      := 'Основной материал'
     OP-ATTR(#COUNTER) := "AN"  /*
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10104
     OP-ATTR(#COUNTER) := "EI"
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TITLE(#COUNTER)      := 'ПЛАН ЕДИЗ'
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10103
     OP-ATTR(#COUNTER) := "PK"
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TITLE(#COUNTER)      := 'БАЗ.КОЛ.'
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10102
     OP-ATTR(#COUNTER) := "PK"
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TITLE(#COUNTER)      := 'ПРИХ.КОЛ'
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10104
     OP-ATTR(#COUNTER) := "PK"
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TITLE(#COUNTER)      := 'ПЛАН.КОЛ'
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10105
     OP-ATTR(#COUNTER) := "PK"
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-TITLE(#COUNTER)      := 'СУММА'
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10103
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-ATTR(#COUNTER) := "EI"  /*
     OP-TITLE(#COUNTER)      := 'Баз Едиз'
/*******
     ADD 1 TO #COUNTER
     OP-CODE-AT(#COUNTER)    := 10102
     OP-POR-NUMBER(#COUNTER) := #COUNTER
     OP-ATTR(#COUNTER) := "EI"
     OP-TITLE(#COUNTER)      := 'ПРИХ ЕДИЗ'
/*******
  END-IF

END-SUBROUTINE
END-SUBROUTINE
END




