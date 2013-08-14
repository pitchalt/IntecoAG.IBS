* >Natural Source Header 000000 /*<RO>>
* :NatName MBTBMN0S
* :UID PAUL
* :Mode S
* :CP
* :Date 20070430
* :Time 1700000
* <Natural Source Header /*<<RO>
/*
/*
/* 11000  “»œ ƒŒ ”Ã≈Õ“¿
/* 11001  ÕŒÃ≈– ƒŒ ”Ã≈Õ“¿
/* 11002  ƒ¿“¿ ƒŒ ”Ã≈Õ“¿
/* 11003  œŒ—“¿¬Ÿ» 
/* 11004  Ã¿“ Œ“¬≈“—“¬≈ÕÕ€…
/* 11005  √–”œœ¿ Ã¿“≈–»¿À¿
/* 11006  Ã¿“≈–»¿À¿À
/* 11007  ““Õ“Õ
/* 11008  —◊≈“ ‘¿ “”–¿
/* 11009  œÀ¿“≈∆ÕŒ≈ œŒ–”◊≈Õ»≈
/*
DEFINE DATA
PARAMETER USING XXERX00A
PARAMETER USING MBTBMN0A
/*
LOCAL USING MXDRAT0L
/*
END-DEFINE
/*
DEFINE SUBROUTINE MBTBMN0S
/*
DECIDE ON FIRST VALUE MBTBMN0A.TB-COMMAND
  VALUE 'LOCATE'
     PERFORM LOCATE
  NONE VALUE IGNORE
END-DECIDE
/*****
DEFINE SUBROUTINE LOCATE
  RESET MBTBMN0A.MN-STRUCTURA(*)
  DECIDE ON FIRST VALUE MBTBMN0A.TB-CODE
/* 11000  “»œ ƒŒ ”Ã≈Õ“¿
     VALUE 11000
        IGNORE
/*        MBTBMN0A.MN-TYPE-NABOR(1) := 1000
/*        MBTBMN0A.MN-TYPE-REC(1) := 100
/*        MBTBMN0A.MN-CODE(1,1) := 1    MN-CODE(1,2) := 2
/*        MBTBMN0A.MN-ARIFM(1) := 'EQ'
/*        MBTBMN0A.MN-LEVEL(1) := 1
/* 11001  ÕŒÃ≈– ƒŒ ”Ã≈Õ“¿
     VALUE 11001
/*
        MBTBMN0A.MN-TYPE-NABOR(1) := 1000
        MBTBMN0A.MN-TYPE-REC(1) := 1001
        MBTBMN0A.MN-CODE(1,1) := DC-NUMBER-ATTR-ID
        MBTBMN0A.MN-ARIFM(1) := 'SE'
        MBTBMN0A.MN-LEVEL(1) := 1
        /*
        MBTBMN0A.MN-TYPE-NABOR(2) := 1600
        MBTBMN0A.MN-TYPE-REC(2) := 1601
        MBTBMN0A.MN-CODE(2,1) := DC-NUMBER-ATTR-ID
        MBTBMN0A.MN-ARIFM(2) := 'SE'
        MBTBMN0A.MN-LEVEL(2) := 1
        /*
        MBTBMN0A.MN-TYPE-NABOR(3) := 1700
        MBTBMN0A.MN-TYPE-REC(3) := 1701
        MBTBMN0A.MN-CODE(3,1) := DC-NUMBER-ATTR-ID
        MBTBMN0A.MN-ARIFM(3) := 'SE'
        MBTBMN0A.MN-LEVEL(3) := 1
        /*
        MBTBMN0A.MN-TYPE-NABOR(4) := 1800
        MBTBMN0A.MN-TYPE-REC(4) := 1801
        MBTBMN0A.MN-CODE(4,1) := DC-NUMBER-ATTR-ID
        MBTBMN0A.MN-ARIFM(4) := 'SE'
        MBTBMN0A.MN-LEVEL(4) := 1
/* 11002  ƒ¿“¿ ƒŒ ”Ã≈Õ“¿
     VALUE 11002
/*
        MBTBMN0A.MN-TYPE-NABOR(1) := 1000
        MBTBMN0A.MN-TYPE-REC(1) := 1001
        MBTBMN0A.MN-CODE(1,1) :=  DC-DATE-ATTR-ID
        MBTBMN0A.MN-ARIFM(1) := 'TH'
        MBTBMN0A.MN-LEVEL(1) := 1
        /*
        MBTBMN0A.MN-TYPE-NABOR(2) := 1600
        MBTBMN0A.MN-TYPE-REC(2) := 1601
        MBTBMN0A.MN-CODE(2,1) := DC-DATE-ATTR-ID
        MBTBMN0A.MN-ARIFM(2) := 'TH'
        MBTBMN0A.MN-LEVEL(2) := 1
        /*
        MBTBMN0A.MN-TYPE-NABOR(3) := 1700
        MBTBMN0A.MN-TYPE-REC(3) := 1701
        MBTBMN0A.MN-CODE(3,1) := DC-DATE-ATTR-ID
        MBTBMN0A.MN-ARIFM(3) := 'TH'
        MBTBMN0A.MN-LEVEL(3) := 1
        /*
        MBTBMN0A.MN-TYPE-NABOR(4) := 1800
        MBTBMN0A.MN-TYPE-REC(4) := 1801
        MBTBMN0A.MN-CODE(4,1) := DC-DATE-ATTR-ID
        MBTBMN0A.MN-ARIFM(4) := 'TH'
        MBTBMN0A.MN-LEVEL(4) := 1
/* 11003  œŒ—“¿¬Ÿ» 
     VALUE 11003
/*
        MBTBMN0A.MN-TYPE-NABOR(1) := 1000
        MBTBMN0A.MN-TYPE-REC(1) := 1001
        MBTBMN0A.MN-CODE(1,1) :=  DR-VO-IN-ATTR-ID
        MBTBMN0A.MN-ARIFM(1) := "EQ"
        MBTBMN0A.MN-LEVEL(1) := 1
        /*
        MBTBMN0A.MN-TYPE-NABOR(2) := 1600
        MBTBMN0A.MN-TYPE-REC(2) := 1601
        MBTBMN0A.MN-CODE(2,1) := -1
        MBTBMN0A.MN-ARIFM(2) := "EQ"
        MBTBMN0A.MN-LEVEL(2) := 1
        /*
        MBTBMN0A.MN-TYPE-NABOR(3) := 1700
        MBTBMN0A.MN-TYPE-REC(3) := 1701
        MBTBMN0A.MN-CODE(3,1) := -1
        MBTBMN0A.MN-ARIFM(3) := "EQ"
        MBTBMN0A.MN-LEVEL(3) := 1
/*
        MBTBMN0A.MN-TYPE-NABOR(4) := 1800
        MBTBMN0A.MN-TYPE-REC(4) := 1801
        MBTBMN0A.MN-CODE(4,1) :=  DR-VO-ATTR-ID
        MBTBMN0A.MN-ARIFM(4) := "EQ"
        MBTBMN0A.MN-LEVEL(4) := 1
/* 11004  Ã¿“ Œ“¬≈“—“¬≈ÕÕ€…
     VALUE 11004
        MBTBMN0A.MN-TYPE-NABOR(1) := 1000
        MBTBMN0A.MN-TYPE-REC(1) := 1001
        MBTBMN0A.MN-CODE(1,1) :=  DR-MO-IN-ATTR-ID
        MBTBMN0A.MN-CODE(1,2) :=  DR-MO-OUT-ATTR-ID
        MBTBMN0A.MN-ARIFM(1) := "EQ"
        MBTBMN0A.MN-LEVEL(1) := 1
        /*
        MBTBMN0A.MN-TYPE-NABOR(2) := 1600
        MBTBMN0A.MN-TYPE-REC(2) := 1601
        MBTBMN0A.MN-CODE(2,1) :=  DR-MO-IN-ATTR-ID
        MBTBMN0A.MN-CODE(2,2) :=  DR-MO-OUT-ATTR-ID
        MBTBMN0A.MN-ARIFM(2) := "EQ"
        MBTBMN0A.MN-LEVEL(2) := 1
        /*
        MBTBMN0A.MN-TYPE-NABOR(3) := 1700
        MBTBMN0A.MN-TYPE-REC(3) := 1701
        MBTBMN0A.MN-CODE(3,1) :=  DR-MO-IN-ATTR-ID
        MBTBMN0A.MN-CODE(3,2) :=  DR-MO-OUT-ATTR-ID
        MBTBMN0A.MN-ARIFM(3) := "EQ"
        MBTBMN0A.MN-LEVEL(3) := 1
        /*
        MBTBMN0A.MN-TYPE-NABOR(4) := 1800
        MBTBMN0A.MN-TYPE-REC(4) := 1801
        MBTBMN0A.MN-CODE(4,1) :=  DR-MO-IN-ATTR-ID
        MBTBMN0A.MN-CODE(4,2) :=  DR-MO-OUT-ATTR-ID
        MBTBMN0A.MN-ARIFM(4) := "EQ"
        MBTBMN0A.MN-LEVEL(4) := 1
/* 11005  √–”œœ¿ Ã¿“≈–»¿À¿
     VALUE 11005
/*
        MBTBMN0A.MN-TYPE-NABOR(1) := 1000
        MBTBMN0A.MN-TYPE-REC(1) := 1002
        MBTBMN0A.MN-CODE(1,1) :=  DR-GM-ATTR-ID
        MBTBMN0A.MN-ARIFM(1) := "EQ"
        MBTBMN0A.MN-LEVEL(1) := 2
        /*
        MBTBMN0A.MN-TYPE-NABOR(2) := 1600
        MBTBMN0A.MN-TYPE-REC(2) := 1602
        MBTBMN0A.MN-CODE(2,1) := DR-GM-ATTR-ID
        MBTBMN0A.MN-ARIFM(2) := "EQ"
        MBTBMN0A.MN-LEVEL(2) := 2
        /*
        MBTBMN0A.MN-TYPE-NABOR(3) := 1700
        MBTBMN0A.MN-TYPE-REC(3) := 1702
        MBTBMN0A.MN-CODE(3,1) := DR-GM-ATTR-ID
        MBTBMN0A.MN-ARIFM(3) := "EQ"
        MBTBMN0A.MN-LEVEL(3) := 2
        /*
        MBTBMN0A.MN-TYPE-NABOR(4) := 1800
        MBTBMN0A.MN-TYPE-REC(4) := 1802
        MBTBMN0A.MN-CODE(4,1) := DR-GM-ATTR-ID
        MBTBMN0A.MN-ARIFM(4) := "EQ"
        MBTBMN0A.MN-LEVEL(4) := 2
/* 11006  Ã¿“≈–»¿À¿À
     VALUE 11006
/*
        MBTBMN0A.MN-TYPE-NABOR(1) := 1000
        MBTBMN0A.MN-TYPE-REC(1) := 1002
        MBTBMN0A.MN-CODE(1,1) :=  DR-MT-ATTR-ID
        MBTBMN0A.MN-ARIFM(1) := "EQ"
        MBTBMN0A.MN-LEVEL(1) := 2
        /*
        MBTBMN0A.MN-TYPE-NABOR(2) := 1600
        MBTBMN0A.MN-TYPE-REC(2) := 1602
        MBTBMN0A.MN-CODE(2,1) := DR-MT-ATTR-ID
        MBTBMN0A.MN-ARIFM(2) := "EQ"
        MBTBMN0A.MN-LEVEL(2) := 2
        /*
        MBTBMN0A.MN-TYPE-NABOR(3) := 1700
        MBTBMN0A.MN-TYPE-REC(3) := 1702
        MBTBMN0A.MN-CODE(3,1) := DR-MT-ATTR-ID
        MBTBMN0A.MN-ARIFM(3) := "EQ"
        MBTBMN0A.MN-LEVEL(3) := 2
        /*
        MBTBMN0A.MN-TYPE-NABOR(4) := 1800
        MBTBMN0A.MN-TYPE-REC(4) := 1802
        MBTBMN0A.MN-CODE(4,1) := DR-MT-ATTR-ID
        MBTBMN0A.MN-ARIFM(4) := "EQ"
        MBTBMN0A.MN-LEVEL(4) := 2
        /*
/* 11007  ““Õ“Õ
     VALUE 11007
/*
        MBTBMN0A.MN-TYPE-NABOR(1) := 1000
        MBTBMN0A.MN-TYPE-REC(1) := 1001
        MBTBMN0A.MN-CODE(1,1) := 10005
        MBTBMN0A.MN-ARIFM(1) := "EQ"
        MBTBMN0A.MN-LEVEL(1) := 1
        /*
        MBTBMN0A.MN-TYPE-NABOR(2) := 1600
        MBTBMN0A.MN-TYPE-REC(2) := 1601
        MBTBMN0A.MN-CODE(2,1) := -1
        MBTBMN0A.MN-ARIFM(2) := "EQ"
        MBTBMN0A.MN-LEVEL(2) := 1
/* 11008  —◊≈“ ‘¿ “”–¿
     VALUE 11008
/*
        MBTBMN0A.MN-TYPE-NABOR(1) := 1000
        MBTBMN0A.MN-TYPE-REC(1) := 1001
        MBTBMN0A.MN-CODE(1,1) :=  10004
        MBTBMN0A.MN-ARIFM(1) := "EQ"
        MBTBMN0A.MN-LEVEL(1) := 1
        /*
        MBTBMN0A.MN-TYPE-NABOR(2) := 1600
        MBTBMN0A.MN-TYPE-REC(2) := 1601
        MBTBMN0A.MN-CODE(2,1) := -1
        MBTBMN0A.MN-ARIFM(2) := "EQ"
        MBTBMN0A.MN-LEVEL(2) := 1
/* 11009  œÀ¿“≈∆ÕŒ≈ œŒ–”◊≈Õ»≈
     VALUE 11009
/*
        MBTBMN0A.MN-TYPE-NABOR(1) := 1000
        MBTBMN0A.MN-TYPE-REC(1) := 1001
        MBTBMN0A.MN-CODE(1,1) :=  10007
        MBTBMN0A.MN-ARIFM(1) := "EQ"
        MBTBMN0A.MN-LEVEL(1) := 1
        /*
        MBTBMN0A.MN-TYPE-NABOR(2) := 1600
        MBTBMN0A.MN-TYPE-REC(2) := 1601
        MBTBMN0A.MN-CODE(2,1) := -1
        MBTBMN0A.MN-ARIFM(2) := "EQ"
        MBTBMN0A.MN-LEVEL(2) := 1
    VALUE 11010
        MBTBMN0A.MN-TYPE-NABOR(1) := 1000
        MBTBMN0A.MN-TYPE-REC(1) := 1001
        MBTBMN0A.MN-CODE(1,1) :=  -1
        MBTBMN0A.MN-ARIFM(1) := "EQ"
        MBTBMN0A.MN-LEVEL(1) := 1
        /*
        MBTBMN0A.MN-TYPE-NABOR(2) := 1600
        MBTBMN0A.MN-TYPE-REC(2) := 1601
        MBTBMN0A.MN-CODE(2,1) := -1
        MBTBMN0A.MN-ARIFM(2) := "EQ"
        MBTBMN0A.MN-LEVEL(2) := 1
        /*
        MBTBMN0A.MN-TYPE-NABOR(3) := 1700
        MBTBMN0A.MN-TYPE-REC(3) := 1702
        MBTBMN0A.MN-CODE(3,1) :=  DR-DOC-LK-ATTR-ID
        MBTBMN0A.MN-ARIFM(3) := "EQ"
        MBTBMN0A.MN-LEVEL(3) := 2
        /*
        MBTBMN0A.MN-TYPE-NABOR(4) := 1800
        MBTBMN0A.MN-TYPE-REC(4) := 1801
        MBTBMN0A.MN-CODE(4,1) := -1
        MBTBMN0A.MN-ARIFM(4) := "EQ"
        MBTBMN0A.MN-LEVEL(4) := 1
     VALUE 11011
/*
        MBTBMN0A.MN-TYPE-NABOR(1) := 1000
        MBTBMN0A.MN-TYPE-REC(1) := 1001
        MBTBMN0A.MN-CODE(1,1) := DC-PACKAGE-ATTR-ID
        MBTBMN0A.MN-ARIFM(1) := 'EQ'
        MBTBMN0A.MN-LEVEL(1) := 1
        /*
        MBTBMN0A.MN-TYPE-NABOR(2) := 1600
        MBTBMN0A.MN-TYPE-REC(2) := 1601
        MBTBMN0A.MN-CODE(2,1) := DC-PACKAGE-ATTR-ID
        MBTBMN0A.MN-ARIFM(2) := 'EQ'
        MBTBMN0A.MN-LEVEL(2) := 1
        /*
        MBTBMN0A.MN-TYPE-NABOR(3) := 1700
        MBTBMN0A.MN-TYPE-REC(3) := 1701
        MBTBMN0A.MN-CODE(3,1) := DC-PACKAGE-ATTR-ID
        MBTBMN0A.MN-ARIFM(3) := 'EQ'
        MBTBMN0A.MN-LEVEL(3) := 1
        /*
        MBTBMN0A.MN-TYPE-NABOR(4) := 1800
        MBTBMN0A.MN-TYPE-REC(4) := 1801
        MBTBMN0A.MN-CODE(4,1) := DC-PACKAGE-ATTR-ID
        MBTBMN0A.MN-ARIFM(4) := 'EQ'
        MBTBMN0A.MN-LEVEL(4) := 1
     NONE VALUE
        IGNORE
     END-DECIDE
  END-SUBROUTINE
END-SUBROUTINE
END


