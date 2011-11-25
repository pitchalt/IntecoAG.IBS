* >Natural Source Header 000000 /*<RO>>
* :NatName UDDRLS0S
* :UID PAUL
* :Mode S
* :CP
* :Date 20070925
* :Time 2323000
* <Natural Source Header /*<<RO>
/***********************************************************************
/*
/* яхярелю:
/* опнцпюллю: UDDOMA0S
/*
/* пюгпюанрвхй:  йнбюкэвсй н.д.
/* дюрю бшосяйю:
/*
/* мюгбюмхе:  спнбемэ дюммшу времхе яохяйю днйслемрнб б люяяхб щкелемрнб
/*            (ме анкэье 20 щкелемрнб)
/* йнлюмдш:
/*  - DOWN
/*  - UP
/*  - TOP
/*  - END
/*
/*
/* хяопюбкемхъ:
/*
/***********************************************************************
DEFINE DATA
PARAMETER USING XXERX00A
PARAMETER USING UDDRLS0A
LOCAL USING UDDRLS0L
LOCAL USING XXXXEC0L
LOCAL
1 #I                 (I4)
1 #M                 (I4)
1 #START             (I02) INIT <0>
1 #STOP              (I02)
1 #STEP              (I02) INIT <1>
1 #KLUCH             (P11) INIT <0>
1 #KOD               (P11) INIT <0>
1 #SEQ               (A1)  INIT <'A'>
1 #INDEX-ARRAY       (I4)
1 #OLD-ID            (P13)
END-DEFINE
DEFINE SUBROUTINE UDDRLS0S
#INDEX-ARRAY :=  UDDRLS0A.DR-LIST-C
RESET XXERX00A
DR-CONT-SUPER.DR-UP-ID := UDDRLS0A.DR-UP-ID
DR-CONT-SUPER.DR-TYPE-ID := UDDRLS0A.DR-TYPE-ID
DECIDE ON FIRST VALUE UDDRLS0A.DL-COMMAND
    VALUE "RELOAD"
      #SEQ := 'A'
      IF LI-START < 0 THEN LI-START := 0 END-IF
      DR-CONT-SUPER.DR-SORT := LI-START + 1
      #START := 0
      #STEP := 1
      #STOP := UDDRLS0A.DR-LIST-C
      PERFORM READ-LIST
    VALUE 'NEXT' /* якедсчыхи бмхг
      IS-TOP := FALSE
      #SEQ := 'A'
      DR-CONT-SUPER.DR-SORT := LI-END
      #START := 0
      #STEP := 1
      #STOP := UDDRLS0A.DR-LIST-C
      PERFORM READ-LIST
    VALUE 'PREV'   /* якедсчыхи ббепу
      IS-BOTTOM := FALSE
      #SEQ := 'D'
      IF LI-START NE 0
        DR-CONT-SUPER.DR-SORT := LI-START
      ELSE
        DR-CONT-SUPER.DR-SORT := LI-END - 1
      END-IF
      #START := UDDRLS0A.DR-LIST-C + 1
      #STEP := -1
      #STOP := 1
      PERFORM READ-LIST
    VALUE 'TOP'  /* вхрюрэ я мювюкю
      IS-BOTTOM := FALSE
      IS-TOP := TRUE
      #SEQ := 'A'
      DR-CONT-SUPER.DR-SORT  := 0
      #START := 0
      #STEP := 1
      #STOP := UDDRLS0A.DR-LIST-C
      PERFORM READ-LIST
    VALUE 'BOTTOM'  /* вхрюрэ я йнмжю
      IS-BOTTOM := TRUE
      IS-TOP := FALSE
      #SEQ := 'D'
      DR-CONT-SUPER.DR-SORT  := 9999999
      #START := UDDRLS0A.DR-LIST-C + 1
      #STEP := -1
      #STOP := 1
      PERFORM READ-LIST
    NONE VALUE
     MOVE DL-COMMAND TO ERROR-ADDITION(1)
     *ERROR-NR := EC-UNKNOW-COMMAND
  END-DECIDE
/************************************************************************
DEFINE SUBROUTINE READ-LIST
/*  WRITE *PROGRAM "READ-LIST"
  REPEAT
     #I := #START
     RESET DR-LIST(*) UDDRLS0A.DR-LIST-C
     R1. READ UR-DOC-DATA-LIST IN LOGICAL VARIABLE #SEQ WITH DR-CONT-SUPER
                                             STARTING FROM DR-CONT-SUPER
        IF UDDRLS0A.DR-UP-ID NE UR-DOC-DATA-LIST.DR-UP-ID
           OR UDDRLS0A.DR-TYPE-ID NE UR-DOC-DATA-LIST.DR-TYPE-ID
           ESCAPE BOTTOM
        END-IF
        IF UDDRLS0A.TX-ID EQ UR-DOC-DATA-LIST.DR-TX-CURRENT-ID THEN
           IF UR-DOC-DATA-LIST.DR-TX-STATUS = 'N' OR
              UR-DOC-DATA-LIST.DR-TX-STATUS = 'A' THEN
              #I := #I + #STEP
              MOVE BY NAME UR-DOC-DATA-LIST TO DR-LIST(#I)
              ADD 1 TO UDDRLS0A.DR-LIST-C
           END-IF
        ELSE
           IF UR-DOC-DATA-LIST.DR-TX-STATUS = 'N' OR
              UR-DOC-DATA-LIST.DR-TX-STATUS = 'D' THEN
              #I := #I + #STEP
              MOVE BY NAME UR-DOC-DATA-LIST TO DR-LIST(#I)
              ADD 1 TO UDDRLS0A.DR-LIST-C
           END-IF
        END-IF
        IF #I = #STOP
           ESCAPE BOTTOM
        END-IF
     END-READ
/*
     IF (#SEQ = 'A' AND #I = 0) OR (#SEQ = 'D' AND #I > 1) THEN
        IF #SEQ = 'D' AND #I > 1
           IS-TOP := TRUE
           ESCAPE BOTTOM
        END-IF
        IF #SEQ = 'A' AND #I = 0
           IS-BOTTOM    := TRUE
           UDDRLS0A.DR-SORT(1) := LI-END
           ESCAPE BOTTOM
        END-IF
     ELSE
        ESCAPE BOTTOM
     END-IF
  END-REPEAT
  RESET LI-START LI-END
  LI-START     := UDDRLS0A.DR-SORT(1)  - 1
  IF LI-START = 0 THEN
     IS-TOP := TRUE
  END-IF
  IF UDDRLS0A.DR-SORT(#INDEX-ARRAY) NE 0
     LI-END   := UDDRLS0A.DR-SORT(#INDEX-ARRAY) + 1
  ELSE
     LI-END   := UDDRLS0A.DR-SORT(1)
     IS-BOTTOM   := TRUE
  END-IF
END-SUBROUTINE
/*
INCLUDE XXERSY1C
END-SUBROUTINE
END
