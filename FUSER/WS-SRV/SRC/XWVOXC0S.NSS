/***********************************************************************
/*
/* SYSTEM: WS-SRV
/* PROGRAM: XWVOXC0N
/*
/* DEVELOPER:  UPA
/* MAKE DATA:
/*
/* NAME:  VO CATALOG LIST
/*
/* CHANGES:
/*
/*
/*
/*
/***********************************************************************
DEFINE DATA
PARAMETER USING XXERX00A
PARAMETER USING XWVOXCIA
PARAMETER USING XWVOXCOA
/*
LOCAL
1 #I       (I4)
1 #LEN     (I4)
END-DEFINE
DEFINE SUBROUTINE XWVOXC0S
  #LEN := 10
  EXPAND ARRAY XWVOXCOA.VO-LIST TO (1:#LEN)
  XWVOXCOA.C@VO-LIST := #LEN
  FOR #I = 1 TO #LEN
     VO-CODE(#I) := #I
     VO-UP-TIME(#I) := *TIMX
  END-FOR
END-SUBROUTINE
END

