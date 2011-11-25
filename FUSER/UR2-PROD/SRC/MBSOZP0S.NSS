* >Natural Source Header 000000 /*<RO>>
* :NatName MBSOZP0S
* :UID Àäìèíèñò
* :Mode S
* :CP
* :Date 20000102
* :Time 0000000
* <Natural Source Header /*<<RO>
/* ÃÎËÎÂÍÀß ÏÐÎÃÐÀÌÌÀ ÓÏÐÀÂËÅÍÈß ÑÆÀÒÈÅÌ
DEFINE DATA
PARAMETER USING XXERX00A
PARAMETER USING MBXXZP1A    /* ÇÀÏÐÎÑÛ
PARAMETER USING MBXXSS0A    /* ÑÒÅÊ
PARAMETER USING MBXXOP0A
PARAMETER USING XXCTXX0A
LOCAL USING MBXXZP0L
LOCAL USING MBXXOP0L
LOCAL USING MBXXDS0A
LOCAL USING MBXXDO0A
LOCAL USING MBXXDO0L
LOCAL USING XXXXEC0L
/*
/* LOCAL USING CXMOS0DL
LOCAL
1 #K   (I4)
1 #KK   (I4)
1 #I   (I4)
1 #II   (I4)
1 #STEK        (B4)
1 #IN-STEK     (B4)
1 #IN-STEK-T   (B4)
1 #OUT-STEK    (B4)
1 #OUT-STEK-T  (B4)
1 #Q           (I4)
1 #COUNTER     (I4)
1 #DO-PD-ATTR-NAME  (A10)
1 #J   (I4)
1 #OS-KOL-ELEMENT (I4) /* ÊÎËÈ×ÅÑÒÂÎ ÝËÅÌÅÍÒÎÂ ÄËß ÑÆÀÒÈß
1 #STEK-LEN       (I4)
1 #NUM-OSN-STEK   (I4)
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
1 #OP-ATTR1      (A10)
1 REDEFINE #OP-ATTR1
  2 #OP-ATTR     (A2)
1 #COL-EQ        (I4)
1 #ELEMENT       (1:5)
  2 #ELEM-N      (I4)
  2 #ELEM-P7     (P7)
  2 #ELEM-P15    (P15)
  2 #ELEM-ATTR   (A2)
END-DEFINE
DEFINE SUBROUTINE MBSOZP0S
RESET XXERX00A
RESET MBXXZP1A.ITOG-PK(*)   /* Î×ÈÙÀÅÌ ÈÒÎÃ ÏÎ ÏÎÊÀÇÀÒÅËßÌ
/*
  EXAMINE MBXXSS0A.DS-TYPE-STEK(*) FOR 'ONCE' GIVING INDEX #NUM-OSN-STEK
/*
  IF MBXXZP1A.ZP-PD-CODE(1) NE 0  /* ÐÀÑØÈÔÐÎÂÊÀ
     #Q := MBXXZP1A.C-STACK
/*     IF MBXXZP1A.OS-KOL-ELEMENT(#Q + 1) NE 0 /* ÅÑËÈ ÏÅÐÅÑÁÎÐÊÀ ÍÀ ÎÄÍÎÌ ÓÐÎÂÍÅ

     /* ÏÐÅÎÁÐÀÇÎÂÀÍÈÅ ÎÑÍÎÂÍÎÃÎ ÑÒÅÊÀ Â ÇÀÂÈÑÈÌÎÑÒÈ ÎÒ ÇÀÏÐÎÑÀ
     /* ÍÀÄÎ ÎÏÐÅÄÅËÈÒÜ ÍÎÌÅÐ ÝËÅÌÅÍÒÀ ÊÎÒÎÐÛÉ ÌÛ ÀÍÀËÈÇÈÐÓÅÌ
     INCLUDE MBSOZP0C "MBXXZP1A.ZP-PD-CODE(#KK)" "MBXXZP1A.ZP-PD-VALUE(#KK)"
                       "MBXXZP1A.ZP-PD-ATTR(#KK)"
     IF MBXXZP1A.C-STACK = 1 THEN
        MOVE MBXXSS0A.STACK-LEN(#NUM-OSN-STEK) TO #STEK-LEN
     ELSE
        IF MBXXZP1A.C-STACK > 1 THEN
           #Q := MBXXZP1A.C-STACK
           MOVE MBXXZP1A.OS-KOL-ELEMENT(#Q) TO #STEK-LEN
        ELSE
           WRITE 'MBSOZP0S' 'ÎØÈÁÊÀ. Îáðàòèòåñü ê ðàçðàáîò÷èêó'
           ESCAPE ROUTINE
        END-IF
     END-IF
     /*
     RESET MBXXZP0L.COUTER-ELEM #ELEMENT(*)
     FOR #KK = 1 TO MBXXZP0L-CONST.ARRAY-DS-ELEMENT
     IF MBXXZP1A.ZP-PD-CODE(#KK) = 0 THEN ESCAPE BOTTOM END-IF
     FOR #I = 1 TO MBXXOP0L-CONST.OP-ARRAY-ELEM
        IF MBXXOP0A.OP-CODE-AT(#I) EQ MBXXZP1A.ZP-PD-CODE(#KK)
           AND MBXXOP0A.OP-ATTR-SHOT(#I) EQ MBXXZP1A.ZP-PD-ATTR(#KK)
           ADD 1 TO MBXXZP0L.COUTER-ELEM
           IF MBXXZP1A.DS-ELEMENT(#KK) = H'00000000'
              IF MBXXZP1A.ZP-PD-ATTR(#KK) = "EI"
                 #ELEM-N(COUTER-ELEM):= (MBXXOP0A.OP-POR-NUMBER(#I)
                 - MBXXOP0A.OP-KOL-AN) + MBXXOP0A.OP-KOL-EAN
                 MOVE "EI" TO #ELEM-ATTR(COUTER-ELEM)
                 MOVE MBXXZP1A.ZP-PD-VALUE(#KK) TO #ELEM-P15(COUTER-ELEM)
              ELSE
                 WRITE 'íå îïðåäåëåí ýëåìåíò'
              END-IF
           ELSE
              #ELEM-N(COUTER-ELEM) := MBXXOP0A.OP-POR-NUMBER(#I)
              MOVE MBXXZP1A.DS-ELEMENT(#KK) TO #ELEM-P7(COUTER-ELEM)
           END-IF
           ESCAPE BOTTOM
        END-IF
     END-FOR
     END-FOR
     /* ÎÏÐÅÄÅËÅÍÈÅ ÊÎË-ÂÀ ÀÍÀËÈÒÈÊ ÄËß ÀÍÀËÈÇÀ
     MOVE MBXXSS0A.STACK-NUMBER(#NUM-OSN-STEK) TO #IN-STEK /* ÎÑÍÎÂÍÎÉ ÑÒÅÊ
     RESET #K
     FOR #I = 1 TO #STEK-LEN
        MOVE #I TO MBXXDO0L.STACK-POS
        CALL 'RWSX' MBXXDO0L.STACK-POS MBXXDO0L.STACK-REC-B(1) MBXXDO0L.STACK-READ
                    #IN-STEK
        /*
        RESET #COL-EQ
        FOR #KK 1 TO MBXXZP0L.COUTER-ELEM
           MOVE #ELEM-N(#KK) TO #II
           IF #ELEM-ATTR(#KK) NE "EI" THEN
              IF MBXXDO0L.ANALITIK(#II) EQ  #ELEM-P7(#KK)
                 ADD 1 TO #COL-EQ
              ELSE
                 #COL-EQ := -1
                 ESCAPE BOTTOM
              END-IF
           ELSE
              IF MBXXDO0L.POKAZAT(#II) EQ  #ELEM-P15(#KK)
                 ADD 1 TO #COL-EQ
              ELSE
                 #COL-EQ := -1
                 ESCAPE BOTTOM
              END-IF
           END-IF
        END-FOR
        IF #COL-EQ = -1
           RESET #COL-EQ
        END-IF
        IF MBXXZP0L.COUTER-ELEM = #COL-EQ
           ADD 1 TO #K /* ÊÎËÈ×ÅÑÒÂÎ ÝËÅÌÅÍÒÎÂ ÓÄÎÂËÅÒÂÎÐßÞÙÈÕ ÓÑËÎÂÈÞ
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
  ELSE
     MOVE MBXXSS0A.STACK-NUMBER(#NUM-OSN-STEK) TO #IN-STEK
     MOVE MBXXSS0A.STACK-COUNT(#NUM-OSN-STEK) TO MBXXZP0L.STACK-POS
     MOVE MBXXSS0A.STACK-LEN(#NUM-OSN-STEK) TO #COUNTER
     MOVE MBXXSS0A.STACK-LEN(#NUM-OSN-STEK) TO #OS-KOL-ELEMENT
  END-IF
  /*
/******************************************************************
/* ÁËÎÊ ÑÆÀÒÈß (SVDX)
/******************************************************************
/* ÂÛÄÅËßÅÌ ÝÊÐÀÍÍÛÉ ÑÒÅÊ
  CALL 'GTNX' #OUT-STEK-T /* ÈÒÎÃÎÂÛÉ ÑÒÅÊ (ÑÆÀÒÛÉ)
  MOVE MBXXOP0A.STACK-REC-LENR TO MBXXZP0L.STACK-FIELD-LEN /* ÄËÈÍÀ ÝËÅÌÅÍÒÀ
  MOVE MBXXSS0A.STACK-LEN(#NUM-OSN-STEK) TO MBXXZP0L.STACK-POS
  CALL 'GTSX' MBXXZP0L.STACK-FIELD-LEN MBXXZP0L.STACK-POS #OUT-STEK-T
/*
  FOR #I = 1 TO MBXXZP0L-CONST.ARRAY-ITOG-PK
     IF MBXXZP1A.ZP-ATTR-CRIT(#I) = 0 ESCAPE BOTTOM END-IF
     FOR #K = 1 TO MBXXOP0L-CONST.OP-ARRAY-ELEM
        IF MBXXOP0A.OP-CODE-AT(#K) = MBXXZP1A.ZP-ATTR-CRIT(#I)
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
FOR MBXXDO0L.STACK-POS-I = 1 TO #OS-KOL-ELEMENT
  /* ×ÈÒÀÅÌ ÎÑÍÎÂÍÎÉ ÑTÅÊ
  MOVE MBXXDO0L.STACK-POS-I TO MBXXDO0L.STACK-POS
  CALL 'RWSX' MBXXDO0L.STACK-POS MBXXDO0L.STACK-REC-B(1) MBXXDO0L.STACK-READ
              #IN-STEK
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
/* ÑÎÐÒÈÐÓÅÌ ÎÑÍÎÂÍÎÉ ÑÒÅÊ ÏÎ ÍÅÎÁÕÎÄÈÌÛÌ ÝËÅÌÅÍÒÀÌ
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
RESET #COUNTER-PK  /* MBXXDO0L.STACK-REC-BT(*)
RESET MBXXDO0L.OS-NPP-T MBXXDO0L.OS-SORT-T
RESET MBXXDO0L.ANALITIK-T(1:OP-KOL-AN)
RESET MBXXDO0L.POKAZAT-T(OP-KOL-EAN+1:75)
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

/* RESET MBXXop0a .STACK-REC-B(1)
RESET MBXXDO0L.OS-NPP MBXXDO0L.OS-SORT
RESET MBXXDO0L.ANALITIK(1:OP-KOL-AN)
RESET MBXXDO0L.POKAZAT(OP-KOL-EAN+1:75)
END-SORT
/****---------------------------------------********
  CALL 'GTNX' #OUT-STEK /* ÈÒÎÃÎÂÛÉ ÑÒÅÊ (ÑÆÀÒÛÉ)
  ADD 1 TO MBXXZP1A.C-STACK
  MOVE #ITOG-SVDX TO MBXXZP0L.STACK-POS
  CALL 'GTSX' MBXXZP0L.STACK-FIELD-LEN MBXXZP0L.STACK-POS #OUT-STEK
  FOR #I = 1 TO #ITOG-SVDX
     MOVE #I TO MBXXDO0L.STACK-POS
     CALL 'RWSX' MBXXDO0L.STACK-POS MBXXDO0L.STACK-REC-B(1) MBXXDO0L.STACK-READ
              #OUT-STEK-T
     CALL 'RWSX' MBXXDO0L.STACK-POS MBXXDO0L.STACK-REC-B(1) MBXXDO0L.STACK-WRITE
              #OUT-STEK
  END-FOR
/* îñâîáîæäåíèå âðåìåííûõ ñòåêîâ
  CALL "FRSX" #OUT-STEK-T
  /*PERFORM READ-STACK
/*******************************************************************************
/* ÊÎÍÅÖ ÁËÎÊÀ ÑÆÀÒÈß
/*******************************************************************************
        MOVE MBXXZP1A.C-STACK TO #Q
        MOVE #OUT-STEK TO MBXXZP1A.STACK-OUT /* ÐÅÇÓËÜÒ ÑÒÅÊ
/*
        MOVE #OUT-STEK TO MBXXZP1A.STACK-NUMBER(#Q)
        MOVE #ITOG-SVDX TO MBXXZP1A.STACK-COUNT(#Q) /* ÐÀÑÏÐÅÄÅËÅÍÍÛÅ ÝËÅÌÅÍÒÛ
        MOVE #ITOG-SVDX TO MBXXZP1A.STACK-LEN(#Q) /* /*ÊÎË-ÂÎ ÇÀÏÎËÍÅÍÛÕ ÝËÅÌÅÍÒÎÂ
        MOVE MBXXZP1A.ZP-CODE TO MBXXZP1A.ST-CODE(#Q)
        MOVE MBXXZP1A.ZP-PD-CODE(*) TO MBXXZP1A.ST-PD-CODE(#Q,*)
        MOVE MBXXZP1A.ZP-PD-VALUE(*) TO MBXXZP1A.ST-PD-VALUE(#Q,*)
        MOVE MBXXZP1A.ZP-PD-ATTR(*) TO MBXXZP1A.ST-PD-ATTR(#Q,*)
        MOVE MBXXZP1A.ZP-VALUE-A TO MBXXZP1A.ST-VALUE-A(#Q)
        MOVE #OS-KOL-ELEMENT TO MBXXZP1A.OS-KOL-ELEMENT(#Q) /* ÊÎË-ÂÎ ÝËÅÌÅÍÒÎÂ ÄËß ÀÍÀËÈÇÀ
        MOVE #STACK-ELEM-LEN TO MBXXZP1A.STACK-ELEM-LEN(#Q) /* ÄËÈÍÀ ÝËÅÌÅÍÒÀ ÑÒÅÊÀ
/*
DEFINE SUBROUTINE ADD-POKAZAT
  ADD 1 TO #COUNTER-PK
  FOR #I 1 TO MBXXOP0L-CONST.OP-ARRAY-ELEM
     IF MBXXOP0A.OP-ATTR(#I) = " " ESCAPE BOTTOM END-IF
     RESET #K
        MOVE LEFT MBXXOP0A.OP-ATTR(#I) TO MBXXOP0A.OP-ATTR(#I)
        IF MBXXOP0A.OP-ATTR-SHOT(#I) = "PK"
           #K := (MBXXOP0A.OP-POR-NUMBER(#I) - MBXXOP0A.OP-KOL-AN)
                                   + MBXXOP0A.OP-KOL-EAN
           /* ïîäñ÷åò èòîãî ïî ïîêàçàòåë ì
           FOR #G = 1 TO MBXXZP0L-CONST.ARRAY-ITOG-PK
              IF MBXXZP1A.PK-CODE (#G) = 0
                 MOVE OP-CODE-AT(#I) TO MBXXZP1A.PK-CODE(#G)
                 MOVE MBXXOP0A.OP-ATTR(#I) TO MBXXZP1A.OP-ATTR(#G)
              END-IF
              IF OP-CODE-AT(#I) = MBXXZP1A.PK-CODE(#G)
                 AND MBXXOP0A.OP-ATTR(#I) = MBXXZP1A.OP-ATTR(#G)
                 MBXXZP1A.PK-VALUE-ITOG(#G) := MBXXZP1A.PK-VALUE-ITOG(#G) +
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

