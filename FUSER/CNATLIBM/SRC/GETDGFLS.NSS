* >Natural Source Header 000000 /*<RO>>
* :NatName GETDGFLS
* :UID INTECO
* :Mode S
* :CP
* :Date 20090924
* :Time 0848330
* <Natural Source Header /*<<RO>
*********************************************
* Получить флаг аналитики договор на
* с/счете или коде внешней организации
*********************************************
DEFINE DATA
PARAMETER
1 #OG(N5)   /* организаци  - пользовател
1 REDEFINE #OG 2 #OGA(A5)
1 #OB(N5)   /* номер С/счёта или код ВО
1 REDEFINE #OB 2 #OBA(A5)
1 #KD(A2)   /* 'SS'          или 'VO' в соответствии с #OB
1 #FL(A1)   /* возвращаетс  ' '/'Н'/'М'/'Д'
LOCAL USING LCLFROL4
LOCAL USING CHR1251
LOCAL USING CHREBCD
LOCAL
1 IBS-BS  VIEW OF IBS-BS-FILE
2 FL-DG
2 OG-SS
1 IBS-KVO VIEW OF IBS-SYS-FILE
2 FL-DG
2 OG-VO
LOCAL
1 OGOB(A10)
1 OPSYS(A3)
END-DEFINE
DEFINE SUBROUTINE GETDGFLS
OPSYS := *OPSYS
INCLUDE DEFOPSYS
IF #KD = 'SS'
COMPRESS #OGA #OBA INTO OGOB LEAVING NO
SS. FIND IBS-BS OG-SS = OGOB
IF FL-DG = ' ' THEN FL-DG := SYS-N END-IF
#FL := FL-DG
END-FIND
IF *NUMBER(SS.) = 0 #FL := SYS-N END-IF
END-IF
*
IF #KD = 'VO'
COMPRESS #OGA #OBA INTO OGOB LEAVING NO
VO. FIND IBS-KVO OG-VO = OGOB
IF FL-DG = ' ' THEN FL-DG := SYS-N END-IF
#FL := FL-DG
END-FIND
IF *NUMBER(VO.) = 0 #FL := SYS-N END-IF
END-IF
END-SUBROUTINE
END
