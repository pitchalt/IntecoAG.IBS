* >Natural Source Header 000000 /*<RO>>
* :NatName NPAVND3S
* :UID INTECO
* :Mode S
* :CP
* :Date 20090323
* :Time 0840330
* <Natural Source Header /*<<RO>
DEFINE DATA
parameter using NPAVND3A
LOCAL USING XXERX00A
LOCAL USING XXCTXX0A
LOCAL USING XXXXEC0L
LOCAL USING IBS-RECL
LOCAL USING IBS-OBJL
local using ibs-vol
LOCAL USING NPAVS10A
LOCAL USING NPAVS10L
LOCAL USING NPAVS20A
LOCAL USING NPAVS20L
LOCAL
1 #AC-BASE    (N5/1:2) INIT <6224, 6226>
1 #AC-NDS     (N5/1:2) INIT <6225, 6227>
1 #AC-68      (N5/1:2) INIT <6832, 6833>
1 #I          (I4)
1 #AC         (I4)
1 #IS-PP      (L)
/*
1 #OGos       (B10)
1 REDEFINE #OGOS
2 #OGOS-OG    (N5)
2 #OGOS-OS    (N5)
/*
1 #OGvo       (B10)
1 REDEFINE #OGvo
2 #OGvo-OG    (N5)
2 #OGvo-vo    (N5)
/*
1 #is-found   (l)
1 #ac-code    (n5)
1 #gm         (n6)
1 #ac-load    (n5)
1 #is-nds     (l)
1 #prov       (n5)
1 #screen
2 cur-pos     (i4)
2 input-data  (5)
3 stack-pos   (i4)
3 dii         (a31/1:2)
3 vo-id       (n5)
3 vo-name     (a79)
3 ob-credit-summ (n13.2)
3 ob-credit-nds  (n13.2)
3 ob-debet-summ  (n13.2)
3 ob-debet-nds   (n13.2)
3 add-debet-nds  (n13.2)
3 add-credit-nds (n13.2)
3 cur-debet-nds  (n13.2)
3 cur-credit-nds (n13.2)
1 #stack-pos     (i4)
1 #nds-max       (n13.2)
1 #nds           (n13.2)
1 #nds-all       (n13.2)
1 #nds-zero      (n13.2)
/*
1 #DI-ID      (A25)
1 REDEFINE #DI-ID
2 #DI4        (A4)
2 #DI-GM      (N6)
2 #DI-AC      (N5)
2 #DI-VO      (N5)
2 #DI-prov    (N5)
END-DEFINE
define subroutine NPAVND3S
FORMAT kd=on LS=160
#prov := prm-prov
#gm := prm-gm
#ac-code := prm-ac
/*
PERFORM AV-INIT
perform prov-init
/*
FOR #AC = 1 TO 2
  if #ac-base(#ac) eq #ac-code then
     perform load-summ
     perform load-nds
     move 5 to NPAVS10L.stack-field-pos
     move 5 to NPAVS10L.stack-field-len
     call "SRTX" NPAVS10L.stack-field-pos NPAVS10L.stack-field-len NPAVS10a.stack-number
     perform load-all-prov
     move 1 to NPAVS20L.stack-field-pos
     move 4 to NPAVS20L.stack-field-len
     call "SRTX" NPAVS20L.stack-field-pos NPAVS20L.stack-field-len NPAVS20a.stack-number
     escape bottom
  end-if
END-FOR
if NPAVS10A.STACK-LEN eq 0 then
  escape routine
end-if
/*
/*FOR #I = 1 TO NPAVS10A.STACK-LEN
/*  MOVE #I TO NPAVS10L.STACK-POS
/*  PERFORM AV-READ
/*  WRITE #I OB-OS sfa DI-KEY(1) DI-KEY(2)
/*     / NPAVS10L.ob-credit-summ NPAVS10L.ob-debet-nds
/*        NPAVS10L.ost-summ NPAVS10L.ost-nds
/*        NPAVS10L.ob-debet-summ NPAVS10L.ob-credit-nds
/*END-FOR
/*
FOR #I = 1 TO NPAVS20A.STACK-LEN
  MOVE #I TO NPAVS20L.STACK-POS
  PERFORM prov-READ
  move NPAVS20L.sfa-id to NPAVS10L.STACK-POS
  perform av-read
/* ÍÄÑ ê íà÷èñëåíèþ
  compute rounded #nds-max = NPAVS10L.ob-credit-summ * 18 / 118
  #nds-max := #nds-max - NPAVS10L.ob-credit-nds
  #nds := NPAVS20L.ob-credit-summ * 18 / 118
  #NDS := #NDS - NPAVS20L.ob-debet-NDS - NPAVS20L.add-debet-NDS
  if #nds-max ne 0 and sgn(#nds-max) eq sgn(#nds) then
     if abs(#nds-max) < abs(#nds) then
        #nds := #nds-max
     end-if
     NPAVS20L.cur-debet-NDS := #nds
     add abs(#nds) to #nds-all
  end-if
/* ÍÄÑ ê âû÷åòó
  compute rounded #nds-max = NPAVS10L.ob-debet-summ * 18 / 118
  #nds-max := #nds-max - NPAVS10L.ob-credit-nds
  #nds := NPAVS20L.ob-debet-summ * 18 / 118
  #NDS := #NDS - NPAVS20L.ob-CREDIT-NDS - NPAVS20L.add-CREDIT-NDS
  if #nds-max ne 0 and sgn(#nds-max) eq sgn(#nds) then
     if abs(#nds-max) < abs(#nds) then
        #nds := #nds-max
     end-if
     if NPAVS10L.ost-summ + NPAVS10L.ob-credit-summ - NPAVS10L.ob-debet-summ  eq 0 then
        #nds := NPAVS10L.ost-nds + NPAVS10L.ob-debet-nds - NPAVS10L.ob-credit-nds
     end-if
     NPAVS20L.cur-CREDIT-NDS := #nds
     add abs(#nds) to #nds-all
  end-if
/*
  perform prov-write
END-FOR
/*
if #nds-all > 0 then
/*
set key all
set key PF3 named 'Âûõîä'
set key PF5 named 'Ñîõðí'
set key PF7 named 'Ââåðõ'
set key PF8 named 'Âíèç'
/*
#screen.cur-pos := 1
repeat
  reset #screen.input-data(*)
  for #i = 1 to 5
     #stack-pos := #screen.cur-pos + #i - 1
     if #stack-pos > NPAVS20a.stack-len then
        escape bottom
     end-if
     move #stack-pos to NPAVS20L.STACK-POS
     PERFORM prov-READ
     move NPAVS20L.sfa-id to NPAVS10L.STACK-POS
     perform av-read
     move by name NPAVS20L.stack-rec-g to #screen.input-data(#i)
     move #stack-pos to #screen.stack-pos(#i)
     move DI-KEY(1) to dii(#i, 1)
     move DI-KEY(2) to dii(#i, 2)
/*
     move VO-CODE to #ogvo-vo
     move 1000 to #ogvo-og
     move VO-CODE  to #screen.vo-id(#i)
     find ibs-kvo-file with og-vo eq #ogvo
        move nm-og to #screen.vo-name(#i)
     end-find
  end-for
  input using map "NPAVND3M"
  if *pf-key eq "PF3" then escape bottom end-if
  for #i = 1 to 5
     #stack-pos := #screen.cur-pos + #i - 1
     if #stack-pos > NPAVS20a.stack-len then
        escape bottom
     end-if
     move #stack-pos to NPAVS20L.STACK-POS
     PERFORM prov-READ
     move NPAVS20L.sfa-id to NPAVS10L.STACK-POS
     perform av-read
     move #screen.cur-debet-nds(#i) to NPAVS20L.cur-debet-nds
     move #screen.cur-credit-nds(#i) to NPAVS20L.cur-credit-nds
     perform prov-write
  end-for
  if *pf-key eq "PF5" then
     perform save-data
     escape bottom
  end-if
  if *pf-key eq "PF7" then
     subtract 5 from #screen.cur-pos
     if #screen.cur-pos < 1 then
        #screen.cur-pos := 1
     end-if
  end-if
  if *pf-key eq "PF8" then
     add 5 to #screen.cur-pos
     if #screen.cur-pos > NPAVS20a.stack-len then
        subtract 5 from #screen.cur-pos
     end-if
  end-if
end-repeat
end-if
PERFORM AV-FREE
perform prov-free
/*
define subroutine load-summ
  #ac-load := #AC-BASE(#AC)
  #is-nds := false
  perform load-data
end-subroutine
/*
define subroutine load-nds
  #ac-load := #AC-nds(#AC)
  #is-nds := true
  perform load-data
end-subroutine
/*
define subroutine load-all-prov
  #ac-load := #AC-BASE(#AC)
  #is-nds := false
  perform load-prov
/*
  #ac-load := #AC-nds(#AC)
  #is-nds := true
  perform load-prov
end-subroutine
/*
define subroutine load-data
  #OGOS-OG := 1000
  #OGOS-OS := #AC-load
  FIND IBS-OBJ-FILE1 WITH OG-OS EQ #OGOS AND DT-ID EQ #gm
     reset NPAVS10L.stack-rec-g NPAVS10L.stack-key-g
     MOVE OB-ID TO VO-CODE
     MOVE DI-ID(1) TO DI-KEY(1)
     MOVE DI-ID(2) TO DI-KEY(2)
     PERFORM AV-LOCATE
     IF RETURN-CODE EQ EC-OBJECT-NOT-FOUND THEN
        PERFORM AV-PUSH
     ELSE
        PERFORM AV-READ
     END-IF
/*     write RETURN-CODE sfa vo-code DI-KEY(1) DI-KEY(2)
     FOR #I = 1 TO C*DI-ID
        IF TY-DI-ID-OBJ(#I) EQ "ÑÔÀ" THEN
           IF SFA-type EQ " " THEN
              MOVE DI-ID(#I) TO SFA
           ELSE
              IF SFA NE DI-ID(#I) THEN
                 WRITE "ÄÓÁËÈÊÀÒ ÑÀËÜÄÎ" DI-ID(#I) SFA SU-RU
              END-IF
           END-IF
        END-IF
     END-FOR
     if #is-nds then
        if bo-id eq 1 then
           add su-ru to NPAVS10L.ost-nds
        else
           subtract su-ru from NPAVS10L.ost-nds
        end-if
     else
        if bo-id eq 1 then
           subtract su-ru from NPAVS10L.ost-summ
        else
           add su-ru to NPAVS10L.ost-summ
        end-if
     end-if
     PERFORM AV-WRITE
  END-FIND
  FIND IBS-REC-FILE WITH OS-F EQ #AC-load AND GM-F EQ #gm
     accept kd-f eq 1000
     reset NPAVS10L.stack-rec-g NPAVS10L.stack-key-g
     MOVE OB-OS TO VO-CODE
     MOVE DI-OS(1) TO DI-KEY(1)
     MOVE DI-OS(2) TO DI-KEY(2)
     PERFORM AV-LOCATE
     IF RETURN-CODE EQ EC-OBJECT-NOT-FOUND THEN
        PERFORM AV-PUSH
     ELSE
        PERFORM AV-READ
     END-IF
/*     write RETURN-CODE sfa vo-code DI-KEY(1) DI-KEY(2)
     FOR #I = 1 TO C*DI-OS
        IF TY-DI-OS(#I) EQ "ÑÔÀ" THEN
           IF SFA-type EQ " " THEN
              MOVE DI-OS(#I) TO SFA
           ELSE
              IF SFA NE DI-OS(#I) THEN
                 WRITE "Äóáëü" BO-F TZ-ID OS-F KS-F ND-ID DT-ID DI-OS(#I) ">" SFA "<" SU-F
              END-IF
           END-IF
        END-IF
     END-FOR
     if #is-nds then
        if bo-f eq 3 then
           add su-f to NPAVS10L.ob-debet-nds
        else
           add su-f to NPAVS10L.ob-credit-nds
        end-if
     else
        if bo-f eq 3 then
           add su-f to NPAVS10L.ob-debet-summ
        else
           add su-f to NPAVS10L.ob-credit-summ
        end-if
     end-if
     PERFORM AV-WRITE
  END-FIND
end-subroutine
/*
define subroutine load-prov
  FIND IBS-REC-FILE WITH OS-F EQ #AC-load AND GM-F EQ #gm and n-prov = #prov
     accept kd-f eq 1000
     reset NPAVS10L.stack-rec-g NPAVS10L.stack-key-g
           NPAVS20L.stack-rec-g NPAVS20L.stack-key-g
     MOVE OB-OS TO VO-CODE
     MOVE DI-OS(1) TO DI-KEY(1)
     MOVE DI-OS(2) TO DI-KEY(2)
     PERFORM AV-LOCATE
     IF RETURN-CODE EQ EC-OBJECT-NOT-FOUND THEN
        write "error locate" VO-CODE DI-KEY(1) DI-KEY(2)
     ELSE
        PERFORM AV-READ
     END-IF
     move NPAVS10L.stack-pos to NPAVS20L.sfa-id
     perform prov-locate
     IF RETURN-CODE EQ EC-OBJECT-NOT-FOUND THEN
        perform prov-push
     ELSE
        PERFORM prov-READ
     END-IF
     if #is-nds then
        if bo-f eq 3 then
           if di4 eq "NPAV" then
              add su-f to NPAVS20L.add-debet-nds
           else
              add su-f to NPAVS20L.ob-debet-nds
           end-if
        else
           if di4 eq "NPAV" then
              add su-f to NPAVS20L.add-credit-nds
           else
              add su-f to NPAVS20L.ob-credit-nds
           end-if
        end-if
     else
        if bo-f eq 3 then
           add su-f to NPAVS20L.ob-debet-summ
        else
           add su-f to NPAVS20L.ob-credit-summ
        end-if
     end-if
     PERFORM prov-WRITE
  END-FIND
end-subroutine
/*
define subroutine save-data
/*
  #DI4 := "NPAV"
  #DI-GM := #gm
  #DI-AC := #ac-nds(#ac)
  #DI-VO := vo-code
  #DI-prov := #prov
  WRITE #DI-ID
  FIND IBS-REC-FILE WITH GM-F EQ #gm AND
        (OS-F EQ #ac-nds(#ac) OR KS-F EQ #ac-nds(#ac)) and n-prov eq #prov
     ACCEPT KD-F EQ 1000
     IF DI4 EQ "NPAV" THEN
        KD-F := -1001
        WRITE "DELETE" OS-F KS-F BO-F TZ-ID OB-OS IBS-REC-FILE.OB-ID SU-F
        UPDATE
     END-IF
  END-FIND
  FOR #I = 1 TO NPAVS20A.STACK-LEN
     MOVE #I TO NPAVS20L.STACK-POS
     PERFORM prov-READ
     move NPAVS20L.sfa-id to NPAVS10L.STACK-POS
     perform av-read
     reset ibs-rec-file
     #DI4 := "NPAV"
     #DI-GM := #gm
     #DI-AC := #ac-nds(#ac)
     #DI-VO := vo-code
     #DI-prov := #prov
     MOVE #DI-ID TO IBS-REC-FILE.DI-ID
     MOVE 1000 TO IBS-REC-FILE.KD-F
     IBS-REC-FILE.SY-F := "UFRO"
     MOVE #gm TO IBS-REC-FILE.GM-F
     PERFORM DEF-DATM IBS-REC-FILE.GM-F IBS-REC-FILE.DT-ID
     IBS-REC-FILE.ND-ID := 777
     IBS-REC-FILE.VA-ID := 'ÐÓÁ'
     IBS-REC-FILE.FL-AN := 'ÂÎ'
     IBS-REC-FILE.FL-KS := ' '
     IBS-REC-FILE.KU-ID := 0
     IBS-REC-FILE.N-PROV := #prov
/*     WRITE NPACS2SL.SALDO-OS NPACS2SL.SALDO-KS NPACS2SL.SUMM-OB-DEBET NPACS2SL.SUMM-OB-CREDIT
     add NPAVS20L.cur-DEBET-nds to NPAVS20L.add-DEBET-nds
     add NPAVS20L.cur-credit-nds to NPAVS20L.add-credit-nds
     if NPAVS20L.add-DEBET-nds > NPAVS20L.add-credit-nds then
        MOVE 3 TO IBS-REC-FILE.BO-F
        IBS-REC-FILE.SU-F := NPAVS20L.add-DEBET-nds - NPAVS20L.add-credit-nds
     else
        if NPAVS20L.add-DEBET-nds < NPAVS20L.add-credit-nds then
           MOVE 4 TO IBS-REC-FILE.BO-F
           IBS-REC-FILE.SU-F := NPAVS20L.add-credit-nds - NPAVS20L.add-DEBET-nds
        else
           ESCAPE TOP
        end-if
     end-if
     IBS-REC-FILE.TZ-ID := 1
/*
     MOVE #ac-nds(#ac) TO IBS-REC-FILE.OS-F
/*     MOVE NPXXANSL.ZK-CODE TO IBS-REC-FILE.ZK-OS
     move vo-code TO IBS-REC-FILE.OB-OS
     MOVE NPAVS10L.DI-KEY(1:2) TO IBS-REC-FILE.DI-OS(1:2)
     MOVE "10000" TO IBS-REC-FILE.KK-OS(1)
     MOVE 2 TO IBS-REC-FILE.KD-OS(1)
/*
     MOVE #ac-68(#ac) TO IBS-REC-FILE.KS-F
/*
     WRITE OS-F KS-F BO-F TZ-ID OB-OS gm-f IBS-REC-FILE.dt-id SU-F
* 1-ß
STREC100.
     STORE IBS-REC-FILE
     GET IBS-REC-FILE *ISN(STREC100.)
     ISN-REC := *ISN(STREC100.)
     UPDATE(STREC100.)
/*
     IF IBS-REC-FILE.BO-F EQ 3 THEN
        IBS-REC-FILE.BO-F := 4
     ELSE
        IBS-REC-FILE.BO-F := 3
     END-IF
     IBS-REC-FILE.TZ-ID := 2
/*
     MOVE #ac-nds(#ac) TO IBS-REC-FILE.kS-F
/*     MOVE NPXXANSL.ZK-CODE TO IBS-REC-FILE.ZK-OS
     move vo-code TO IBS-REC-FILE.OB-id
     MOVE NPAVS10L.DI-KEY(1:2) TO IBS-REC-FILE.DI-kS(1:2)
     MOVE "10000" TO IBS-REC-FILE.KK-kS(1)
     MOVE 2 TO IBS-REC-FILE.KD-kS(1)
/*
     MOVE #ac-68(#ac) TO IBS-REC-FILE.oS-F
     reset IBS-REC-FILE.OB-os IBS-REC-FILE.DI-oS(1:2)
           IBS-REC-FILE.KK-oS(1) IBS-REC-FILE.KD-oS(1)
/*
     DUBL-REC := "Y"
     WRITE OS-F KS-F BO-F TZ-ID IBS-REC-FILE.OB-ID gm-f IBS-REC-FILE.dt-id SU-F
     STORE IBS-REC-FILE
  END-FOR
  END TRANSACTION
end-subroutine
/*
define subroutine write-single-prov
  ignore
end-subroutine
/*
INCLUDE XXSTMN4C "NPAVS10A" "NPAVS10L-CONST" "NPAVS10L"
        "AV-INIT" "AV-FREE" "AV-REALLOC"
        "AV-PUSH" "AV-READ" "AV-WRITE" "AV-LOCATE"
/*
INCLUDE XXSTMN4C "NPAVS20A" "NPAVS20L-CONST" "NPAVS20L"
        "PROV-INIT" "PROV-FREE" "PROV-REALLOC"
        "PROV-PUSH" "PROV-READ" "PROV-WRITE" "PROV-LOCATE"
/*
end-subroutine
END
