* >Natural Source Header 000000 /*<RO>>
* :NatName STNU
* :UID IBSFIN
* :Mode S
* :CP
* :Date 20030202
* :Time 1245330
* <Natural Source Header /*<<RO>
/********************************************
/*                                          *
/*       опнбепйю нопедекемхъ ярюреи        *
/*                                          *
/*                                   TNA    *
/********************************************
DEFINE DATA
* GLOBAL USING UFROG
 PARAMETER USING PRMSTSET
 LOCAL USING PRMHELP
 LOCAL USING LCLSTSET
 LOCAL
1 KEYSETUP(A16)
1 REDEFINE KEYSETUP
 2 KEYOG(N5)
 2 KEYTT(A5)
 2 KEYCD(N6)
1 LOCALSET
 2 POINT(A1)
 2 NULL(A1)
 2 FILL(A1)
 2 MAXLEV(N2)
1 I(I4)
1 POSIT(I4)
1 LOCALERROR(I4)
1 ERRORTEXT(A70)
END-DEFINE
DEFINE SUBROUTINE STNU
KEYSETUP.KEYOG := STSETUPP.OG_ID
KEYSETUP.KEYTT := NAME_TABLE_STSETUPV
KEYSETUP.KEYCD := MAGIC_NUMBER_STSETUPV
FIND (1) STSETUPV OG-ST = KEYSETUP
  IF STSETUPV.NULL NE ' '  RESULT_ID := 1
    ELSE  RESULT_ID := 2
  END-IF
END-FIND
END-SUBROUTINE
END
