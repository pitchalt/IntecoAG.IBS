* >Natural Source Header 000000 /*<RO>>
* :NatName LDGOLD
* :UID T_INTECO
* :Mode S
* :CP
* :Date 20091124
* :Time 1046330
* <Natural Source Header /*<<RO>
DEFINE DATA
  PARAMETER
  1 OG_IDENT_G(N5)
  1 NMGLD(A12/200)
  LOCAL USING ASUMGLD
  LOCAL USING STEKL
  LOCAL
    1 KEY1(A7)               /*  ÏOÈCKOBÛÉ KËÞ× HA×AËÜHÛÉ
    1 REDEFINE KEY1
      2 KEYOG1(N5)            /*  KOÄ
      2 KEYKD1(A2)            /*  METKA
END-DEFINE
*
DEFINE SUBROUTINE LDGOLD
  KEYOG1 := OG_IDENT_G   KEYKD1 := 'GL'
  FIND ASUM-GLD TP-Z = KEY1 SORTED KD-F
    #I := KD-F  NMGLD(#I) := NAMEMAT
  END-FIND
END-SUBROUTINE
END
