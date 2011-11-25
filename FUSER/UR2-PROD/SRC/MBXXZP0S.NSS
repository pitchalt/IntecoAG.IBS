* >Natural Source Header 000000 /*<RO>>
* :NatName MBXXZP0S
* :UID ARMK01
* :Mode S
* :CP
* :Date 20070605
* :Time 1710000
* <Natural Source Header /*<<RO>
/* цнкнбмюъ опнцпюллю сопюбкемхъ яфюрхел
DEFINE DATA
PARAMETER USING XXERX00A
PARAMETER USING MBXXZP0A    /* гюопняш
PARAMETER USING MBXXSS0A    /* ярей
PARAMETER USING MBXXOP0A
PARAMETER USING XXCTXX0A
LOCAL USING MBXXZP0L
LOCAL USING MBXXDS0A
LOCAL USING MBXXDO0A
LOCAL USING MBXXDO0L
LOCAL USING XXXXEC0L
/*
LOCAL USING MBXXOP0L
/* LOCAL USING CXMOS0DL
LOCAL
1 #K   (I4)
1 #I   (I4)
1 #STEK        (B4)
1 #IN-STEK     (B4)
1 #IN-STEK-T   (B4)
1 #OUT-STEK    (B4)
1 #OUT-STEK-T  (B4)
1 #Q           (I2)
1 #COUNTER     (I4)
1 #DO-PD-ATTR-NAME  (A10)
1 #J   (I4)
1 #OS-KOL-ELEMENT (I4) /* йнкхвеярбн щкелемрнб дкъ яфюрхъ
1 #STEK-LEN       (I4)
1 #NUM-OSN-STEK   (I4)
1 #N-ELEM         (I4)
1 #STACK-ELEM-LEN (I4)
1 #SORT-IND-A   (I2/1:5)
1 #SORT-IND-P   (I2/1:5)
1 #SA            (I2)
1 #SP            (I2)
1 #SORT-VALUE    (P15/1:5)
1 #SORT          (I2)
1 #SORT-IND      (I2)
1 #ITOG-SVDX     (I4)
1 #SORT-COUNTER  (I4)
1 #COUNTER-PK    (I4)
1 #G             (I2)
END-DEFINE
DEFINE SUBROUTINE MBXXZP0S
RESET XXERX00A
RESET MBXXZP0A.ITOG-PK(*)   /* нвхыюел хрнц он онйюгюрекъл
/*
  EXAMINE MBXXSS0A.DS-TYPE-STEK(*) FOR 'ONCE' GIVING INDEX #NUM-OSN-STEK
/*
  IF MBXXZP0A.ZP-PD-CODE NE 0  /* пюяьхтпнбйю
     #Q := MBXXZP0A.C-STACK
/*     IF MBXXZP0A.OS-KOL-ELEMENT(#Q + 1) NE 0 /* еякх оепеяанпйю мю ндмнл спнбме
     /* опенапюгнбюмхе нямнбмнцн ярейю б гюбхяхлнярх нр гюопняю
     /* мюдн нопедекхрэ мнлеп щкелемрю йнрнпши лш юмюкхгхпсел
     INCLUDE MBXXZP0C 'MBXXZP0A.ZP-PD-CODE' 'MBXXZP0A.ZP-PD-VALUE'
     IF MBXXZP0A.C-STACK = 1 THEN
        MOVE MBXXSS0A.STACK-LEN(#NUM-OSN-STEK) TO #STEK-LEN
     ELSE
        #Q := MBXXZP0A.C-STACK
        MOVE MBXXZP0A.OS-KOL-ELEMENT(#Q) TO #STEK-LEN
     END-IF
     /*
     FOR #I = 1 TO 30
        IF MBXXOP0A.OP-CODE-AT(#I) EQ MBXXZP0A.ZP-PD-CODE
           #N-ELEM := MBXXOP0A.OP-POR-NUMBER(#I)
           ESCAPE BOTTOM
        END-IF
     END-FOR
     /* нопедекемхе йнк-бю юмюкхрхй дкъ юмюкхгю
     MOVE MBXXSS0A.STACK-NUMBER(#NUM-OSN-STEK) TO #IN-STEK /* нямнбмни ярей
     RESET #K
     FOR #I = 1 TO #STEK-LEN
        MOVE #I TO MBXXDO0L.STACK-POS
        CALL 'RWSX' MBXXDO0L.STACK-POS MBXXDO0L.STACK-REC-B(1) MBXXDO0L.STACK-READ
                    #IN-STEK
        IF MBXXDO0L.ANALITIK(#N-ELEM) = MBXXDS0A.DS-ELEM-STEK
           ADD 1 TO #K /* йнкхвеярбн щкелемрнб сднбкербнпъчыху сякнбхч
           IF #I NE #K /*
              MOVE MBXXDO0L.STACK-REC-B(*) TO MBXXDO0L.STACK-REC-BT(*)
              MOVE #K TO MBXXDO0L.STACK-POS
              CALL 'RWSX' MBXXDO0L.STACK-POS MBXXDO0L.STACK-REC-B(1) MBXXDO0L.STACK-READ
                          #IN-STEK
              /*
              MOVE #I TO MBXXDO0L.STACK-POS
              CALL 'RWSX' MBXXDO0L.STACK-POS MBXXDO0L.STACK-REC-B(1) MBXXDO0L.STACK-WRITE
                          #IN-STEK
              /*
              MOVE MBXXDO0L.STACK-REC-BT(*) TO MBXXDO0L.STACK-REC-B(*)
              MOVE #K TO MBXXDO0L.STACK-POS
              CALL 'RWSX' MBXXDO0L.STACK-POS MBXXDO0L.STACK-REC-B(1) MBXXDO0L.STACK-WRITE
                          #IN-STEK
           END-IF
        END-IF
     END-FOR
     MOVE #K TO #OS-KOL-ELEMENT
/*     END-IF
  ELSE
     MOVE MBXXSS0A.STACK-NUMBER(#NUM-OSN-STEK) TO #IN-STEK
     MOVE MBXXSS0A.STACK-COUNT(#NUM-OSN-STEK) TO MBXXZP0L.STACK-POS
     MOVE MBXXSS0A.STACK-LEN(#NUM-OSN-STEK) TO #COUNTER
     MOVE MBXXSS0A.STACK-LEN(#NUM-OSN-STEK) TO #OS-KOL-ELEMENT
  END-IF
  /*
/******************************************************************
/* акнй яфюрхъ (SVDX)
/******************************************************************
/* бшдекъел щйпюммши ярей
  CALL 'GTNX' #OUT-STEK-T /* хрнцнбши ярей (яфюрши)
  MOVE MBXXOP0A.STACK-REC-LENR TO MBXXZP0L.STACK-FIELD-LEN /* дкхмю щкелемрю
  MOVE MBXXSS0A.STACK-LEN(#NUM-OSN-STEK) TO MBXXZP0L.STACK-POS
  CALL 'GTSX' MBXXZP0L.STACK-FIELD-LEN MBXXZP0L.STACK-POS #OUT-STEK-T
/*
  FOR #I = 1 TO 20
     IF MBXXZP0A.ZP-ATTR-CRIT(#I) = 0 ESCAPE BOTTOM END-IF
     FOR #K = 1 TO MBXXOP0L-CONST.OP-ARRAY-ELEM
        IF MBXXOP0A.OP-CODE-AT(#K) = MBXXZP0A.ZP-ATTR-CRIT(#I)
           IF MBXXOP0A.OP-ATTR(#K) = "AN"
              ADD 1 TO #SA
              MOVE MBXXOP0A.OP-POR-NUMBER(#K) TO #SORT-IND-A(#SA)
              ESCAPE BOTTOM
           END-IF
           IF MBXXOP0A.OP-ATTR(#K) = "EI"
              ADD 1 TO #SP
              #SORT-IND-P(#SP) := (MBXXOP0A.OP-POR-NUMBER(#K) - MBXXOP0A.OP-KOL-AN)
                       + MBXXOP0A.OP-KOL-EAN
              ESCAPE BOTTOM
           END-IF
        END-IF
     END-FOR
  END-FOR
/*
REPEAT
  /* вхрюел нямнбмни яTей
  ADD 1 TO MBXXDO0L.STACK-POS-I
  IF #OS-KOL-ELEMENT < MBXXDO0L.STACK-POS-I
     ESCAPE BOTTOM
  END-IF
  MOVE MBXXDO0L.STACK-POS-I TO MBXXDO0L.STACK-POS
  CALL 'RWSX' MBXXDO0L.STACK-POS MBXXDO0L.STACK-REC-B(1) MBXXDO0L.STACK-READ
              #IN-STEK
/*IF *USER EQ "ARMK01" THEN
/*   WRITE *PROGRAM ANALITIK(1) ANALITIK(2) ANALITIK(8) ANALITIK(9)
/*END-IF
  /*
  RESET #SORT #SORT-VALUE(*)
  FOR #I 1 TO 5
     IF #SORT-IND-A(#I) = 0 ESCAPE BOTTOM END-IF
     ADD 1 TO #SORT
     MOVE #SORT-IND-A(#I) TO #SORT-IND
     MOVE MBXXDO0L.ANALITIK(#SORT-IND) TO #SORT-VALUE(#SORT)
  END-FOR
  FOR #I 1 TO 5
     IF #SORT-IND-P(#I) = 0 ESCAPE BOTTOM END-IF
     ADD 1 TO #SORT
     MOVE #SORT-IND-P(#I) TO #SORT-IND
     MOVE MBXXDO0L.POKAZAT(#SORT-IND) TO #SORT-VALUE(#SORT)
  END-FOR
/*
/* янпрхпсел нямнбмни ярей он менаундхлшл щкелемрюл
  END-ALL
/*
  SORT #SORT-VALUE(1) #SORT-VALUE(2) #SORT-VALUE(3) #SORT-VALUE(4)
  #SORT-VALUE(5) USING MBXXDO0L.STACK-REC-B(*)
/*
ADD 1 TO #SORT-COUNTER
PERFORM ADD-POKAZAT
/*
AT BREAK #SORT-VALUE(5)
  ADD 1 TO #ITOG-SVDX
  MOVE #ITOG-SVDX TO MBXXDO0L.STACK-POS
  CALL 'RWSX' MBXXDO0L.STACK-POS MBXXDO0L.STACK-REC-BT(1) MBXXDO0L.STACK-WRITE
              #OUT-STEK-T
  RESET MBXXDO0L.STACK-REC-BT(*) #COUNTER-PK
END-BREAK
/*
AT BREAK #SORT-VALUE(4)
  IGNORE
END-BREAK
/*
AT BREAK #SORT-VALUE(3)
  IGNORE
END-BREAK
/*
AT BREAK #SORT-VALUE(2)
  IGNORE
END-BREAK
/*
AT BREAK #SORT-VALUE(1)
  IGNORE
END-BREAK
RESET MBXXDO0L.STACK-REC-B(1)
END-SORT
/****---------------------------------------********
  CALL 'GTNX' #OUT-STEK /* хрнцнбши ярей (яфюрши)
  ADD 1 TO MBXXZP0A.C-STACK
  MOVE #ITOG-SVDX TO MBXXZP0L.STACK-POS
  CALL 'GTSX' MBXXZP0L.STACK-FIELD-LEN MBXXZP0L.STACK-POS #OUT-STEK
  FOR #I = 1 TO #ITOG-SVDX
     MOVE #I TO MBXXDO0L.STACK-POS
     CALL 'RWSX' MBXXDO0L.STACK-POS MBXXDO0L.STACK-REC-B(1) MBXXDO0L.STACK-READ
              #OUT-STEK-T
     CALL 'RWSX' MBXXDO0L.STACK-POS MBXXDO0L.STACK-REC-B(1) MBXXDO0L.STACK-WRITE
              #OUT-STEK
  END-FOR
/* НЯБНАНФДЕМХЕ БПЕЛЕММШУ ЯРЕЙНБ
  CALL "FRSX" #OUT-STEK-T
  /*PERFORM READ-STACK
/*******************************************************************************
/* йнмеж акнйю яфюрхъ
/*******************************************************************************
        MOVE MBXXZP0A.C-STACK TO #Q
        MOVE #OUT-STEK TO MBXXZP0A.STACK-OUT /* пегскэр ярей
/*
        MOVE #OUT-STEK TO MBXXZP0A.STACK-NUMBER(#Q)
        MOVE #ITOG-SVDX TO MBXXZP0A.STACK-COUNT(#Q) /* пюяопедекеммше щкелемрш
        MOVE #ITOG-SVDX TO MBXXZP0A.STACK-LEN(#Q) /* /*йнк-бн гюонкмемшу щкелемрнб
        MOVE MBXXZP0A.ZP-CODE TO MBXXZP0A.ST-CODE(#Q)
        MOVE MBXXZP0A.ZP-PD-CODE TO MBXXZP0A.ST-PD-CODE(#Q)
        MOVE MBXXZP0A.ZP-PD-VALUE TO MBXXZP0A.ST-PD-VALUE(#Q)
        MOVE MBXXZP0A.ZP-VALUE-A TO MBXXZP0A.ST-VALUE-A(#Q)
        MOVE #OS-KOL-ELEMENT TO MBXXZP0A.OS-KOL-ELEMENT(#Q) /* йнк-бн щкелемрнб дкъ юмюкхгю
        MOVE #STACK-ELEM-LEN TO MBXXZP0A.STACK-ELEM-LEN(#Q) /* дкхмю щкелемрю ярейю
/*
DEFINE SUBROUTINE ADD-POKAZAT
  ADD 1 TO #COUNTER-PK
  FOR #I 1 TO MBXXOP0L-CONST.OP-ARRAY-ELEM
     IF MBXXOP0A.OP-ATTR(#I) = " " ESCAPE BOTTOM END-IF
     RESET #K
        IF MBXXOP0A.OP-ATTR(#I) = "PK"
           #K := (MBXXOP0A.OP-POR-NUMBER(#I) - MBXXOP0A.OP-KOL-AN)
                                   + MBXXOP0A.OP-KOL-EAN
           /* ОНДЯВЕР ХРНЦН ОН ОНЙЮГЮРЕК Л
           FOR #G = 1 TO 10
              IF MBXXZP0A.PK-CODE (#G) = 0
                 MOVE OP-CODE-AT(#I) TO MBXXZP0A.PK-CODE(#G)
              END-IF
              IF MBXXOP0A.OP-CODE-AT(#I) = MBXXZP0A.PK-CODE(#G)
                 MBXXZP0A.PK-VALUE-ITOG(#G) := MBXXZP0A.PK-VALUE-ITOG(#G) +
                                      MBXXDO0L.POKAZAT(#K)
                 ESCAPE BOTTOM
              END-IF
           END-FOR
           /******************************
           IF #COUNTER-PK > 1 THEN
              MBXXDO0L.POKAZAT-T(#K) := MBXXDO0L.POKAZAT-T(#K)
                                      + MBXXDO0L.POKAZAT(#K)
           ELSE
              MOVE MBXXDO0L.STACK-REC-B(*) TO MBXXDO0L.STACK-REC-BT(*)
           END-IF
        END-IF
  END-FOR
END-SUBROUTINE
/*
DEFINE SUBROUTINE READ-STACK
 RESET MBXXDO0L.STACK-POS-I MBXXDO0L.STACK-POS
 REPEAT
    ADD 1 TO MBXXDO0L.STACK-POS-I
     MOVE MBXXDO0L.STACK-POS-I TO MBXXDO0L.STACK-POS
     CALL 'RWSX' MBXXDO0L.STACK-POS MBXXDO0L.STACK-REC-B(1) MBXXDO0L.STACK-READ
                 #OUT-STEK
    IF MBXXDO0L.STACK-REC-B(1) = H'00'
        ESCAPE BOTTOM
     END-IF
  RESET MBXXDO0L.STACK-REC-G
  END-REPEAT
END-SUBROUTINE
/*
INCLUDE XXERSY1C
END-SUBROUTINE
END
