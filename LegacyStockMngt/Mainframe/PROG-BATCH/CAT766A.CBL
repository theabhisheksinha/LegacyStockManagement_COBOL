000001* PDX    - CAT766A  C0285901 10/12/09 09:50:13 TBLAMUR            00001093
000400***************************************************************** 00010000
000500 IDENTIFICATION DIVISION.                                         00020000
000600***************************************************************** 00030000
000700 PROGRAM-ID. CAT766A.                                             00040000
000800*                                                                 00050000
000900*---------------------------------------------------------------* 00060001
000800* THE PURPOSE OF THIS PROGRAM IS TO CREATE THE MSD FUZZY MATCH    00070001
000800* REPORT.  CAT766 CREATES INPUT OF TI, AT RECEIVER SIDE RECORDS   00080004
000800* WHERE THE MSD WAS MATCHED (ADP-SEC > SPACE).  READ THRU THIS    00090004
000800* FILE, MOVE THE TI REC TO WS, THEN PROCESS THE AT REC(S) WHICH   00100004
000800* FOLLOW.  THERE ARE TWO TYPES ON MATCHING CRITERIA TO MSD IN     00110081
000800* CAT515, STANDARD COUNTRY-CUSIP-CHECK DIGIT (ALL 12 BYTES) AND   00110181
000800* THE SUBMITTER ISIN FIELD IN THE ASSET DESCRIPTION.              00110281
000800*                                                                 00110381
000800* FOR THE STANDARD MATCH - USE BYTES 3-11 (ASSUMED TO BE THE      00111081
000800* CUSIP) TO READ MSD, IF FOUND, BYPASS.  THEN ONLY REPORT THESE   00112082
000800* WHEN THERE ARE MULITPLE MATCHES TO THE MSDISIN FILE             00113081
000800* (AS SEEN ON MSIF).                                              00120081
000800*                                                                 00121081
000800* THE NON STANDARD (SUBMMITTER ISIN) MATCH IN CAT515 USES         00130081
000800* EITHER 9 OR 12 BYTES MATCH TO MSD.  CAT515 MARKS THE ASSET      00150081
000800* AS TO WHICH MATCH IT HAD.  USE BYTES 3-11                       00160082
000800* (CUSIP) TO READ MSD, IF FOUND, BYPASS.  THEN REPORT THESE       00161082
000800* REGARDLESS IF ANY MATCHES ARE FOUND ON MSDISIN FILE.            00170082
000800* THE 9 BYTE MATCH IS LOOKED UP IN A REFORMATTED VERSION OF THIS  00180004
000800* SAME MSDISIN FILE, WHICH WAS SORTED, WITH KEY STARTING IN BYTES 00190004
000800* 3-11 OF THE ISIN FOR MULTIPLE MATCHES.                          00200004
000900*---------------------------------------------------------------* 00210001
000800*                                                                 00220001
005304***************************************************************** 00230000
005305 ENVIRONMENT DIVISION.                                            00240000
005306***************************************************************** 00250000
005307 INPUT-OUTPUT SECTION.                                            00260000
005308                                                                  00270000
005309 FILE-CONTROL.                                                    00280000
005310***********************  INPUT FILES  *************************** 00290000
005320                                                                  00300000
005330     SELECT  PEND-FILE           ASSIGN  TO  UT-S-IPEND           00310000
005340                            FILE STATUS  IS  PEND-FILE-STATUS.    00320000
005350                                                                  00330000
005380     SELECT MSDISIN-FILE      ASSIGN  TO  MSDISIN                 00340001
005390        ORGANIZATION  IS  INDEXED                                 00350000
005400        ACCESS        IS  DYNAMIC                                 00360000
005500        RECORD KEY    IS  MSDISIN-KEY-FIELD                       00370001
005600        FILE STATUS   IS  MSDISIN-FILE-STATUS.                    00380007
009000                                                                  00390000
005380     SELECT MSDCUSIP-FILE     ASSIGN  TO  MSDCUSIP                00391064
005390        ORGANIZATION  IS  INDEXED                                 00392064
005400        ACCESS        IS  DYNAMIC                                 00393064
005500        RECORD KEY    IS  MSDCUSIP-KEY-FIELD                      00394064
005600        FILE STATUS   IS  MSDCUSIP-FILE-STATUS.                   00395064
009000                                                                  00396064
009100     SELECT  REPT-FILE           ASSIGN  TO  UT-S-REPORT          00400036
009200                            FILE STATUS  IS  REPT-FILE-STATUS.    00410036
009400/                                                                 00420000
009500***************************************************************** 00430000
009600 DATA DIVISION.                                                   00440000
009700***************************************************************** 00450000
009800 FILE SECTION.                                                    00460000
009900                                                                  00470000
010000 FD  PEND-FILE                                                    00480000
010100     RECORDING MODE V                                             00490000
010200     BLOCK CONTAINS 0 RECORDS.                                    00500000
010300                                                                  00510000
010400     COPY ACATRCVR  REPLACING ==:FMT:== BY ==PEND==.              00520000
010500                                                                  00530000
012200 FD  MSDISIN-FILE.                                                00540001
012300 01  MSDISIN-REC-IN.                                              00550001
012400     05  MSDISIN-KEY-FIELD.                                       00560001
012500         10  MSDISIN-KEY-ISIN-NBR  PIC X(12).                     00570007
012600         10  MSDISIN-KEY-CNTRY-CD  PIC X(02).                     00580001
017900     05  MSDISIN-ADP-NO        PIC X(07).                         00590001
                                                                        00600001
012200 FD  MSDCUSIP-FILE.                                               00601064
012300 01  MSDCUSIP-REC-IN.                                             00602064
017900     05  MSDCUSIP-ISIN-CNTRY-CD    PIC X(02).                     00602166
012400     05  MSDCUSIP-KEY-FIELD.                                      00603064
012500         10  MSDCUSIP-KEY-CUSIP    PIC X(09).                     00604064
012500         10  FILLER                PIC X(01).                     00604166
012600         10  MSDCUSIP-KEY-CNTRY-CD PIC X(02).                     00605064
017900         10  MSDCUSIP-ADP-NO       PIC X(07).                     00606064
                                                                        00607064
018000 FD  REPT-FILE                                                    00610036
018100     RECORDING MODE F                                             00620000
018200     BLOCK CONTAINS 0 RECORDS                                     00630000
018300     LABEL RECORDS ARE STANDARD                                   00640000
018400     RECORD CONTAINS 143 CHARACTERS.                              00650000
                                                                        00672036
       01  REPT-REC.                                                    00673038
           03 REPT-LINE             PIC  X(133).                        00674038
           03 REPT-CLT              PIC S9(003) COMP-3.                 00675038
           03 REPT-FIL              PIC  X(008).                        00676038
      /                                                                 00677038
018700                                                                  00680000
018800                                                                  00690000
018900***************************************************************** 00700000
019000 WORKING-STORAGE  SECTION.                                        00710000
019100***************************************************************** 00720000
019200 77  PGM-NAME                         PIC X(07)  VALUE 'CAT766A'. 00730000
019300 77  MSDISIN-FILE-STATUS              PIC  X(02)  VALUE '00'.     00740007
022200     88  MSDISIN-FILE-OK               VALUE '00' THRU '09', '97'.00750004
022400     88  MSDISIN-ENDFILE               VALUE '10'.                00760004
022400     88  MSDISIN-NOTFOUND              VALUE '23'.                00770004
020000                                                                  00780000
019300 77  MSDCUSIP-FILE-STATUS             PIC  X(02)  VALUE '00'.     00781064
022200     88  MSDCUSIP-FILE-OK              VALUE '00' THRU '09', '97'.00782064
022400     88  MSDCUSIP-ENDFILE              VALUE '10'.                00783064
022400     88  MSDCUSIP-NOTFOUND             VALUE '23'.                00784064
020000                                                                  00785064
019300 77  REPT-FILE-STATUS                 PIC  X(02)  VALUE '00'.     00790036
022200     88  REPT-FILE-OK                            VALUE '00'.      00800036
022300     88  XMSDPI-OPEN-OK                          VALUE '00' '97'. 00810002
020000                                                                  00820002
020100 77  ACAT-PROC-DATE                   PIC X(08)  VALUE ' '.       00830002
020200                                                                  00840000
020700 77  WS-DATE                          PIC 9(08)  VALUE 0.         00850000
020800                                                                  00860000
       77  ABEND-CD                  PIC  9(009) COMP SYNC VALUE 0.     00870004
021400                                                                  00880000
021600 77  ACAT-RECS-TOTAL       COMP       PIC S9(9)  VALUE +0.        00890000
021600                                                                  00900004
021600 77  WS-MSDISIN-MATCH-COUNT COMP      PIC S9(9)  VALUE +0.        00910004
021600 77  WS-MSDISIN-GROUP-COUNT COMP      PIC S9(9)  VALUE +0.        00911017
021600 77  WS-MSDCUSIP-MATCH-COUNT COMP     PIC S9(9)  VALUE +0.        00912064
021600 77  WS-MSDCUSIP-GROUP-COUNT COMP     PIC S9(9)  VALUE +0.        00913064
021700                                                                  00920000
022100 77  PEND-FILE-STATUS                 PIC X(02).                  00930000
022200     88  PEND-FILE-OK                            VALUE '00'.      00940000
022300     88  PEND-OPEN-OK                            VALUE '00' '97'. 00950000
022400     88  PEND-ENDFILE                            VALUE '10'.      00960000
025000                                                                  00970000
025100 77  WS-NEW-TI-SW                     PIC X(1) VALUE SPACE.       00980000
025200     88  NEW-TI                                VALUE 'Y'.         00990000
025300     88  NOT-NEW-TI                            VALUE 'N'.         01000000
025400 77  WS-NEW-AT-SW                     PIC X(1) VALUE SPACE.       01010000
025500     88  NEW-AT                                VALUE 'Y'.         01020000
025600     88  NOT-NEW-AT                            VALUE 'N'.         01030000
027600                                                                  01040000
030900 77  END-OF-PEND-FILE-SWITCH          PIC X(01)  VALUE 'N'.       01050000
031000     88  END-OF-PEND-FILE                        VALUE 'Y'.       01060000
                                                                        01070036
       01  W-CURRENT-FIELDS.                                            01070536
           05  W-CURR-CLIENT             PIC X(03).                     01070636
           05  W-CURR-CLIENT-N REDEFINES                                01070736
               W-CURR-CLIENT             PIC 9(003).                    01070836
                                                                        01070936
       01  W-FIELDS.                                                    01071034
           05  B1-SUB                    PIC 9(4)    VALUE 0.           01071236
           05  W-PAGE-CNT                PIC  9(11) VALUE 0.            01071334
           05  W-LINE-CNT                PIC  9(11) VALUE 60.           01071434
           05  LD-PROC-DATE.                                            01071534
               10 LD-PROC-DATE-MM        PIC  X(02).                    01071634
               10 LD-PROC-DATE-DD        PIC  X(02).                    01071734
               10 LD-PROC-DATE-YY        PIC  X(02).                    01071834
           05  W-PROC-DATE.                                             01071934
               10 W-PROC-DATE-CC         PIC  X(02).                    01072034
               10 W-PROC-DATE-YY         PIC  X(02).                    01072134
               10 W-PROC-DATE-MM         PIC  X(02).                    01072234
               10 W-PROC-DATE-DD         PIC  X(02).                    01072334
           05  W-PROC-DATE-N REDEFINES                                  01072434
               W-PROC-DATE               PIC  9(008).                   01072534
           05  W-SYS-DATE                PIC  9(006) VALUE 0.           01072634
           05  FILLER  REDEFINES                                        01072734
               W-SYS-DATE.                                              01072834
               10  W-SYS-YY              PIC  X(002).                   01072934
               10  W-SYS-MM              PIC  X(002).                   01073034
               10  W-SYS-DD              PIC  X(002).                   01073134
           05  W-SYS-TIME                PIC  9(008) VALUE 0.           01073234
           05  FILLER  REDEFINES                                        01073334
               W-SYS-TIME.                                              01073434
               10  W-SYS-HH              PIC  X(002).                   01073534
               10  W-SYS-MN              PIC  X(002).                   01073634
               10  W-SYS-SS              PIC  X(002).                   01073734
               10  W-SYS-MS              PIC  X(002).                   01073834
           05  W-REPT-LINE               PIC  X(133).                   01073936
                                                                        01074034
005940     COPY STUBCPY.                                                01075007
047200     COPY BPDATESC.                                               01080000
047300/                                                                 01090000
048800     COPY MSDISINC.                                               01100001
187000/                                                                 01100107
048800     COPY ACATCUSP.                                               01100265
187000/                                                                 01100365
010400     COPY ACATRCVR  REPLACING ==:FMT:== BY ==FMT==.               01101007
187000/                                                                 01110000
047400     COPY BHINFO.                                                 01110132
047500/                                                                 01110232
047600     COPY BHACAT.                                                 01110332
047500/                                                                 01110432
      ******************************************************************01111023
      * GETMSD COMMAREA                                                *01112023
      ******************************************************************01113023
       01  FILLER                        PIC X(08) VALUE 'GETMSDCE'.    01114023
           COPY GETMSDCE.                                               01115023
      /                                                                 01116032
       01  W-HDR1-REC.                                                  01120133
           05  FILLER                       PIC  X(01) VALUE '1'.       01121033
           05  FILLER                       PIC  X(08) VALUE            01122033
               'CAT766A '.                                              01123033
           05  W-HDR1-CLT                   PIC  Z999.                  01124033
           05  FILLER                       PIC  X(01) VALUE ' '.       01125033
           05  W-HDR1-CLT-NAME              PIC  X(30) VALUE ' '.       01126033
           05  FILLER                       PIC  X(04) VALUE ' '.       01127033
           05  FILLER                       PIC  X(42) VALUE            01128033
               'AUTOMATED CUSTOMER ACCOUNT TRANSFER SYSTEM'.            01129033
           05  FILLER                       PIC  X(12) VALUE ' '.       01129133
           05  FILLER                       PIC  X(13) VALUE            01129233
               'PROCESS DATE '.                                         01129333
           05  W-HDR1-MM                    PIC  X(02).                 01129433
           05  W-HDR1-S1                    PIC  X(01) VALUE '/'.       01129533
           05  W-HDR1-DD                    PIC  X(02).                 01129633
           05  W-HDR1-S2                    PIC  X(01) VALUE '/'.       01129733
           05  W-HDR1-YY                    PIC  X(02).                 01129833
           05  FILLER                       PIC  X(01) VALUE ' '.       01129933
           05  FILLER                       PIC  X(05) VALUE            01130033
               'PAGE '.                                                 01130133
           05  W-HDR1-PAGE                  PIC  ZZZ9.                  01130233
                                                                        01130333
       01  W-HDR2-REC.                                                  01130433
           05  FILLER                       PIC  X(01) VALUE ' '.       01130533
           05  FILLER                       PIC  X(57) VALUE ' '.       01130633
           05  FILLER                       PIC  X(42) VALUE            01130733
               'MSD FUZZY MATCH REPORT'.                                01130861
           05  FILLER                       PIC  X(06) VALUE ' '.       01130933
           05  FILLER                       PIC  X(09) VALUE            01131033
               'RUN TIME '.                                             01131133
           05  W-HDR2-MM                    PIC  X(02).                 01131233
           05  W-HDR2-S1                    PIC  X(01) VALUE '/'.       01131333
           05  W-HDR2-DD                    PIC  X(02).                 01131433
           05  W-HDR2-S2                    PIC  X(01) VALUE '/'.       01131533
           05  W-HDR2-YY                    PIC  X(02).                 01131633
           05  FILLER                       PIC  X(01) VALUE ' '.       01131733
           05  W-HDR2-HH                    PIC  X(02).                 01131833
           05  W-HDR2-CC                    PIC  X(01) VALUE ':'.       01131933
           05  W-HDR2-MN                    PIC  X(02).                 01132033
           05  FILLER                       PIC  X(04) VALUE ' '.       01132133
                                                                        01132233
       01  W-HDR3-REC.                                                  01132333
           05  FILLER                       PIC  X(01) VALUE '0'.       01132433
           05  FILLER                       PIC  X(40) VALUE            01132533
              'BR-ACCT     ISIN/CUSIP      CONTROL NBR'.                01132633
           05  FILLER                       PIC  X(30) VALUE            01132733
              '    BRD NBR    MESSAGE        '.                         01132859
           05  FILLER                       PIC  X(52) VALUE            01132933
              'SETTLE LOC   PRICING CATG    SETTLE REASON   CREATED'.   01133033
                                                                        01133133
       01  W-DTL1-REC.                                                  01133233
           05  FILLER                       PIC  X(01) VALUE '0'.       01133333
           05  W-DTL1-BRANCH                PIC  X(03).                 01133433
           05  FILLER                       PIC  X(01) VALUE '-'.       01133533
           05  W-DTL1-ACCOUNT               PIC  X(05).                 01133633
           05  FILLER                       PIC  X(03) VALUE ' '.       01133733
           05  W-DTL1-ISIN.                                             01133864
               07  W-DTL1-CNTRY             PIC  X(03).                 01133933
               07  W-DTL1-CUSIP             PIC  X(09).                 01134033
               07  W-DTL1-CKDG              PIC  X(02).                 01134133
           05  FILLER                       PIC  X(02) VALUE ' '.       01134233
           05  W-DTL1-CONTROL-NBR           PIC  X(14).                 01134333
           05  FILLER                       PIC  X(02) VALUE ' '.       01134433
           05  W-DTL1-ADP-NO                PIC  X(07).                 01134551
           05  FILLER                       PIC  X(03) VALUE ' '.       01134633
           05  W-DTL1-LOOKUP-MSG            PIC  X(17).                 01134751
           05  FILLER                       PIC  X(03) VALUE ' '.       01134851
           05  W-DTL1-SETTLE-LOC            PIC  X(10).                 01134951
           05  FILLER                       PIC  X(04) VALUE ' '.       01135051
           05  W-DTL1-PRICING-CAT           PIC  X(04).                 01135151
           05  FILLER                       PIC  X(12) VALUE ' '.       01135251
           05  W-DTL1-SETTLE-RSN            PIC  X(04).                 01135351
           05  FILLER                       PIC  X(10) VALUE ' '.       01135451
           05  W-DTL1-TMSTP                 PIC  X(16).                 01135551
                                                                        01135651
       01  W-DTL2-REC.                                                  01135751
           05  FILLER                       PIC  X(01) VALUE ' '.       01135851
           05  FILLER                       PIC  X(30) VALUE ' '.       01135961
           05  FILLER                       PIC  X(06) VALUE ' DESC:'.  01136051
           05  W-DTL2-DESC                  PIC  X(100).                01136151
                                                                        01136251
       01  W-DTL3-REC.                                                  01136351
           05  FILLER                       PIC  X(01) VALUE ' '.       01136451
           05  FILLER                       PIC  X(36) VALUE ' '.       01136561
           05  W-DTL3-DESC                  PIC  X(40).                 01136651
                                                                        01136751
       01  W-DTL4-REC.                                                  01136859
           05  FILLER                       PIC  X(01) VALUE ' '.       01136961
           05  FILLER                       PIC  X(12) VALUE ' '.       01137259
           05  W-DTL4-ISIN.                                             01137359
               07  W-DTL1-CNTRY             PIC  X(03).                 01137459
               07  W-DTL1-CUSIP             PIC  X(09).                 01137559
               07  W-DTL1-CKDG              PIC  X(02).                 01137659
           05  FILLER                       PIC  X(18) VALUE ' '.       01137759
           05  W-DTL4-ADP-NO                PIC  X(07).                 01138059
           05  FILLER                       PIC  X(03) VALUE ' '.       01139059
           05  W-DTL4-MATCHED-MSG           PIC  X(07).                 01139159
                                                                        01139259
187200 PROCEDURE DIVISION.                                              01139301
187600     COPY MSGCOBO.                                                01140000
187700                                                                  01150000
187800     PERFORM  INITIAL-ROUTINE                                     01160000
187900        THRU  INITIAL-ROUTINE-EXIT.                               01170000
188000                                                                  01180000
199500     PERFORM  UNTIL  B1-SUB  >  500                               01181032
199600       ADD  1  TO B1-SUB                                          01182046
199900       MOVE  ' '                    TO  BH-BROKER-HEADER-INFO     01185032
200000       MOVE  B1-SUB                 TO  BH-BROKER-NUMBER-N        01186032
200100       MOVE  '015'               TO  BH-LOGICAL-RECORD-CODE       01187032
200200       MOVE  '434500'            TO  BH-B2-INFO-ID                01188032
200300       CALL  GETB1V            USING BH-BROKER-HEADER-INFO,       01189032
200400                                     BH-ACAT-INFO                 01189132
200600       IF  BH-BROKER-ACTIVE                                       01189232
200500       AND BH-ACAT-ACTIVE                                         01189332
             AND BH-BROKER-CLEARING-HOUSE(1:4) NOT = '0969'             01189732
                MOVE ZERO TO W-PAGE-CNT                                 01191034
                MOVE 60   TO W-LINE-CNT                                 01191134
                MOVE B1-SUB TO W-CURR-CLIENT-N                          01192034
                PERFORM PROCESS-CLIENT-RTN                              01200038
                IF W-PAGE-CNT = ZERO                                    01211034
                   PERFORM WRITE-NO-DETAILS-TODAY-RTN                   01212034
                END-IF                                                  01213034
             END-IF                                                     01214034
           END-PERFORM.                                                 01215034
                                                                        01216038
189100     PERFORM  ENDJOB-ROUTINE.                                     01220007
189300                                                                  01240000
189400     GOBACK.                                                      01250000
189500/                                                                 01260000
189600*****************                                                 01270000
189700 INITIAL-ROUTINE.                                                 01280003
189800*****************                                                 01290000
189900                                                                  01300000
190000     DISPLAY ' '.                                                 01310000
190100     DISPLAY '*** ' PGM-NAME ' BEGINNING INITIAL ROUTINE ***'.    01320000
190200                                                                  01330000
190900     PERFORM  INIT-OPEN-FILES.                                    01340000
191300     PERFORM  INIT-READ-INPUT-HDRS.                               01350000
191600                                                                  01360000
192200     DISPLAY '*** ' PGM-NAME ' COMPLETED INITIAL ROUTINE ***'.    01370000
192300                                                                  01380000
192400***********************                                           01390000
192500 INITIAL-ROUTINE-EXIT.  EXIT.                                     01400000
192600***********************                                           01410000
221400     EJECT                                                        01420000
221500******************                                                01430000
221600 INIT-OPEN-FILES.                                                 01440000
221700******************                                                01450000
221800                                                                  01460000
           MOVE  'CAT766A'                    TO BPDATES-CALLING-PGM.   01470004
           MOVE  'C'                          TO BPDATES-REQ-TYPE.      01480004
                                                                        01490004
           CALL    BPDATES            USING BPDATES-PARAMETERS.         01500004
                                                                        01510004
           DISPLAY 'PROCESS DATE  = ' BPD-PROC-DATE.                    01520004
           MOVE BPD-PROC-DATE            TO W-PROC-DATE.                01530034
           MOVE BPD-PROC-DATE(3:2)       TO LD-PROC-DATE-YY.            01540034
           MOVE BPD-PROC-DATE(5:2)       TO LD-PROC-DATE-MM.            01550034
           MOVE BPD-PROC-DATE(7:2)       TO LD-PROC-DATE-DD.            01560034
           DISPLAY 'CAT527: PROC-DATE= ' BPD-PROC-DATE                  01560134
                      '  LD-PROC-DATE= ' LD-PROC-DATE.                  01560234
                                                                        01560334
           ACCEPT W-SYS-DATE             FROM DATE.                     01560434
           ACCEPT W-SYS-TIME             FROM TIME.                     01560534
                                                                        01561034
221900     OPEN  INPUT  PEND-FILE                                       01570001
222000     IF  NOT  PEND-OPEN-OK                                        01580000
222100         DISPLAY  'OLDPEND FILE OPEN ERROR, STATUS = '            01590000
222200                   PEND-FILE-STATUS                               01600000
222300     END-IF.                                                      01610000
222400                                                                  01620000
222500     OPEN  INPUT  MSDISIN-FILE.                                   01630001
022300     IF NOT  MSDISIN-FILE-OK                                      01640004
222100         DISPLAY  'MSDISIN FILE OPEN ERROR, STATUS = '            01650001
222200                   MSDISIN-FILE-STATUS                            01660001
222300     END-IF.                                                      01670001
226400                                                                  01680000
222500     OPEN  INPUT  MSDCUSIP-FILE.                                  01681064
022300     IF NOT  MSDCUSIP-FILE-OK                                     01682064
222100         DISPLAY  'MSDCUSIP FILE OPEN ERROR, STATUS = '           01683064
222200                   MSDCUSIP-FILE-STATUS                           01684064
222300     END-IF.                                                      01685064
226400                                                                  01686064
226500     OPEN  OUTPUT  REPT-FILE.                                     01690036
                                                                        01690123
           MOVE 'D'              TO GETMSD-DEVICE-IND                   01691023
           MOVE 'R'              TO GETMSD-ACCESS-IND                   01692023
           MOVE 'E'              TO GETMSD-FORMAT-IND.                  01693026
230000     EJECT                                                        01700000
230100***********************                                           01710000
230200 INIT-READ-INPUT-HDRS.                                            01720000
230300***********************                                           01730000
230400     PERFORM  READ-PEND-FILE.                                     01740057
230500                                                                  01750000
230600     IF  END-OF-PEND-FILE                                         01760001
230700           DISPLAY 'ACATPEND FILE HAS ZERO RECORDS'               01770000
230750           MOVE 1000 TO ABEND-CD                                  01780004
230800           CALL ABEND                 USING ABEND-CD              01790004
230900     END-IF                                                       01800000
231000     IF  NOT PEND-HEADER-ID                                       01810000
231100           DISPLAY 'ACATPEND FILE HEADER MISSING'                 01820000
230750           MOVE 1200 TO ABEND-CD                                  01830004
231200           CALL ABEND                 USING ABEND-CD              01840004
231300     END-IF.                                                      01850000
238800     PERFORM READ-PEND-FILE.                                      01851057
232400                                                                  01860000
237687     EJECT                                                        01870000
       PROCESS-CLIENT-RTN.                                              01871038
           PERFORM PROCESS-PEND-FILE                                    01872038
              UNTIL END-OF-PEND-FILE                                    01873038
                  OR FMT-TI-ADP-CL-NO-X > W-CURR-CLIENT.                01874044
                                                                        01876038
237688 PROCESS-PEND-FILE.                                               01880038
237689                                                                  01890000
238000     IF PEND-TI-RECORD-ID                                         01930055
238100        MOVE PEND-TI-RECORD      TO FMT-TI-RECORD                 01940055
238300     ELSE                                                         01950055
238400        MOVE PEND-AT-RECORD      TO FMT-AT-RECORD                 01960055
                 IF FMT-SEC-DESC-1 (114:15) = 'SUBMITTER ISIN:'         01962083
                 AND FMT-MATCH-SUBMITTER-ISIN-9                         01963086
238600              PERFORM LOOKUP-SUBMITTER-ISIN9-RTN                  01970086
238600                 THRU LOOKUP-SUBMITTER-ISIN9-EXIT                 01980086
                 ELSE                                                   01980164
238600              PERFORM LOOKUP-MSD-BY-ISIN-RTN                      01981064
238600                 THRU LOOKUP-MSD-BY-ISIN-EXIT                     01982064
                 END-IF                                                 01983064
238700     END-IF.                                                      01990055
238800     PERFORM READ-PEND-FILE.                                      02000057
239000                                                                  02020000
238800 READ-PEND-FILE.                                                  02021057
005330     READ PEND-FILE                                               02022007
188200        AT END                                                    02023007
188200          SET END-OF-PEND-FILE TO TRUE.                           02024007
240200                                                                  02030000
       LOOKUP-MSD-BY-ISIN-RTN.                                          02040064
           MOVE LOW-VALUES                TO GETMSD-SEARCH-KEY-AREA     02049230
           MOVE SPACES TO MSDISIN-KEY-CNTRY-CD                          02050055
                          GETMSD-SEARCH-KEY.                            02051030
           IF FMT-ISIN > SPACES                                         02060004
              MOVE FMT-ISIN-SEC-ISSUE-CD     TO GETMSD-SEARCH-KEY       02070072
              MOVE FMT-ISIN TO MSDISIN-KEY-ISIN-NBR                     02071072
              MOVE 'ISIN MATCH' TO W-DTL1-LOOKUP-MSG                    02072086
           ELSE                                                         02080004
              IF FMT-SEC-DESC-1 (114:15) = 'SUBMITTER ISIN:'            02080186
                 MOVE FMT-SEC-DESC-1 (131:9) TO GETMSD-SEARCH-KEY       02080286
                 MOVE FMT-SEC-DESC-1 (129:12) TO MSDISIN-KEY-ISIN-NBR   02080386
                 MOVE 'SUBMITTER ISIN 12' TO W-DTL1-LOOKUP-MSG          02080486
              ELSE                                                      02080586
                  DISPLAY 'ILLOGIC MATCH TO MSD WITH NO ISIN '          02081086
                      FMT-AT-CONTROL-NUM ' ' FMT-ASSET-SEQ-NO           02082086
                  GO TO LOOKUP-MSD-BY-ISIN-EXIT                         02090086
           END-IF.                                                      02110004
                                                                        02120004
           MOVE FMT-AT-ADP-CL-NO          TO GETMSD-CLIENT-PL2          02121124
           CALL GETMSDC USING MASTER-SECURITY-RECORD                    02122123
           IF GETMSD-RETURN-VALID                                       02122281
                GO TO LOOKUP-MSD-BY-ISIN-EXIT                           02122981
           END-IF.                                                      02123076
                                                                        02124023
           IF FMT-SEC-DESC-1 (114:15) = 'SUBMITTER ISIN:'               02124190
              ADD 1 TO WS-MSDISIN-GROUP-COUNT                           02124290
              PERFORM WRITE-VASSET-RTN                                  02124390
           END-IF.                                                      02125090
                                                                        02126090
           MOVE MSDISIN-KEY-FIELD TO MSDISIN-ISIN-NBR                   02131030
           START MSDISIN-FILE KEY NOT < MSDISIN-KEY-FIELD               02140004
           IF MSDISIN-FILE-OK                                           02150004
              CONTINUE                                                  02160004
           ELSE                                                         02170004
           IF MSDISIN-ENDFILE                                           02180055
           OR MSDISIN-NOTFOUND                                          02190055
                GO TO LOOKUP-MSD-BY-ISIN-EXIT                           02200090
           ELSE                                                         02210004
              DISPLAY 'CAT766A: MSDISNS FILE, START BROWSE ERROR'       02220004
                      ' FILE-STATUS = ' MSDISIN-FILE-STATUS             02230007
              DISPLAY 'MSDISIN-FILE-KEY = ' MSDISIN-KEY-FIELD           02240004
              MOVE +1999    TO ABEND-CD                                 02250004
              CALL ABEND USING ABEND-CD                                 02260004
           END-IF.                                                      02270004
                                                                        02280004
           MOVE ZERO TO WS-MSDISIN-MATCH-COUNT.                         02281009
           PERFORM UNTIL NOT MSDISIN-FILE-OK                            02290004
                  OR MSDISIN-KEY-FIELD (1 : 12) NOT = MSDISIN-ISIN-NBR  02300004
              READ MSDISIN-FILE NEXT RECORD                             02310004
              IF MSDISIN-FILE-OK                                        02320004
                 IF MSDISIN-KEY-FIELD (1 : 12) = MSDISIN-ISIN-NBR       02320192
                    IF FMT-SEC-DESC-1 (114:15) = 'SUBMITTER ISIN:'      02321092
                       MOVE MSDISIN-REC-IN TO MSDISIN-REC               02321192
                       PERFORM WRITE-MSDISIN-RTN                        02321292
                    ELSE                                                02322092
                       ADD 1 TO WS-MSDISIN-MATCH-COUNT                  02340092
                       IF WS-MSDISIN-MATCH-COUNT = 1                    02350092
                          ADD 1 TO WS-MSDISIN-GROUP-COUNT               02351092
                          MOVE MSDISIN-REC-IN TO MSDISIN-REC            02360092
                       ELSE                                             02370092
                       IF WS-MSDISIN-MATCH-COUNT = 2                    02371092
                          ADD 1 TO WS-MSDISIN-GROUP-COUNT               02372092
                          PERFORM WRITE-VASSET-RTN                      02373092
                          PERFORM WRITE-MSDISIN-RTN                     02373192
                          MOVE MSDISIN-REC-IN TO MSDISIN-REC            02374092
                          PERFORM WRITE-MSDISIN-RTN                     02375092
                       ELSE                                             02376092
                       IF WS-MSDISIN-MATCH-COUNT > 2                    02380092
                          MOVE MSDISIN-REC-IN TO MSDISIN-REC            02440092
                          PERFORM WRITE-MSDISIN-RTN                     02450092
                       END-IF END-IF END-IF                             02460092
                 END-IF END-IF                                          02470090
              ELSE                                                      02480004
                 IF MSDISIN-ENDFILE                                     02490004
                    CONTINUE                                            02500004
                 ELSE                                                   02510004
                    DISPLAY ' CAT766A: MSDIISIN FILE, READ NEXT ERROR'  02520004
                            ' FILE-STATUS = ' MSDISIN-FILE-STATUS       02530009
                    DISPLAY 'MSDISIN-FILE-KEY = ' MSDISIN-KEY-FIELD     02540004
                    MOVE +2000    TO ABEND-CD                           02550004
                    CALL ABEND USING ABEND-CD                           02560004
                 END-IF                                                 02570004
              END-IF                                                    02580011
           END-PERFORM.                                                 02581011
       LOOKUP-MSD-BY-ISIN-EXIT. EXIT.                                   02590064
                                                                        02600000
       LOOKUP-SUBMITTER-ISIN9-RTN.                                      02601086
           DISPLAY 'SUBMITTER ISIN9 OF 12 = 'FMT-SEC-DESC-1 (129:12)    02602086
                ' ' FMT-AT-CONTROL-NUM ' ' FMT-ASSET-SEQ-NO             02602185
           MOVE SPACES TO MSDCUSIP-KEY-FIELD.                           02603069
           MOVE FMT-SEC-DESC-1 (131:9) TO MSDCUSIP-KEY-CUSIP            02609366
           MOVE 'SUBMITTER ISIN 9' TO W-DTL1-LOOKUP-MSG                 02609486
           MOVE MSDCUSIP-KEY-FIELD TO WS-MSDCUSIP-KEY                   02612066
           START MSDCUSIP-FILE KEY NOT < MSDCUSIP-KEY-FIELD             02612165
           IF MSDCUSIP-FILE-OK                                          02612265
              CONTINUE                                                  02612364
           ELSE                                                         02612464
           IF MSDISIN-ENDFILE                                           02612564
           OR MSDISIN-NOTFOUND                                          02612664
              GO TO LOOKUP-SUBMITTER-ISIN9-EXIT                         02612788
           ELSE                                                         02612864
              DISPLAY 'CAT766A: MSDCUSIP FILE, START BROWSE ERROR'      02612966
                      ' FILE-STATUS = ' MSDCUSIP-FILE-STATUS            02613066
              DISPLAY 'MSDCUSIP-FILE-KEY = ' MSDCUSIP-KEY-FIELD         02613166
              MOVE +2999    TO ABEND-CD                                 02613266
              CALL ABEND USING ABEND-CD                                 02613364
           END-IF.                                                      02613464
                                                                        02613564
           MOVE ZERO TO WS-MSDCUSIP-MATCH-COUNT.                        02613666
           PERFORM UNTIL NOT MSDCUSIP-FILE-OK                           02613766
                 OR MSDCUSIP-KEY-CUSIP NOT = WS-MSDCUSIP-CUSIP-NBR      02613866
              READ MSDCUSIP-FILE NEXT RECORD                            02613966
              IF MSDCUSIP-FILE-OK                                       02614066
                 IF MSDCUSIP-KEY-CUSIP = WS-MSDCUSIP-CUSIP-NBR          02614166
                    ADD 1 TO WS-MSDCUSIP-MATCH-COUNT                    02614266
                    IF WS-MSDCUSIP-MATCH-COUNT = 1                      02614366
                       MOVE MSDCUSIP-REC-IN TO WS-MSDCUSIP-REC          02614488
                    ELSE                                                02614588
                    IF WS-MSDCUSIP-MATCH-COUNT = 2                      02614688
                       PERFORM WRITE-VASSET-RTN                         02614788
                       PERFORM WRITE-MSDCUSIP-RTN                       02614888
                       MOVE MSDCUSIP-REC-IN TO WS-MSDCUSIP-REC          02614986
                       PERFORM WRITE-MSDCUSIP-RTN                       02615286
                    ELSE                                                02615364
                    IF WS-MSDCUSIP-MATCH-COUNT > 2                      02615488
                       MOVE MSDCUSIP-REC-IN TO WS-MSDCUSIP-REC          02615586
                       PERFORM WRITE-MSDCUSIP-RTN                       02615666
                    END-IF END-IF END-IF                                02615764
                 END-IF                                                 02615864
              ELSE                                                      02615964
                 IF MSDCUSIP-ENDFILE                                    02616066
                    CONTINUE                                            02616164
                 ELSE                                                   02616264
                    DISPLAY ' CAT766A: MSDICUSIP FILE, READ NEXT ERROR' 02616366
                            ' FILE-STATUS = ' MSDCUSIP-FILE-STATUS      02616466
                    DISPLAY 'MSDCUSIP-FILE-KEY = ' MSDCUSIP-KEY-FIELD   02616566
                    MOVE +3000    TO ABEND-CD                           02616666
                    CALL ABEND USING ABEND-CD                           02616764
                 END-IF                                                 02616864
              END-IF                                                    02616964
           END-PERFORM.                                                 02617064
       LOOKUP-SUBMITTER-ISIN9-EXIT. EXIT.                               02617186
                                                                        02617264
       WRITE-VASSET-RTN.                                                02617364
     ***   DISPLAY ' MSDISIN COUNT ' WS-MSDISIN-MATCH-COUNT             02620019
     ***       ' ' MSDISIN-REC.                                         02630019
           DISPLAY FMT-AT-CONTROL-NUM                                   02631020
               ' ' FMT-AT-CUST-ACCOUNT(1 : 3) '-'                       02631120
                   FMT-AT-CUST-ACCOUNT(4 : 5)                           02632019
               ' ' MSDISIN-REC                                          02633021
               ' ' W-DTL1-LOOKUP-MSG                                    02634086
           MOVE FMT-TI-CUST-ACCOUNT(1:3) TO  W-DTL1-BRANCH              02635048
           MOVE FMT-TI-CUST-ACCOUNT(4:5) TO  W-DTL1-ACCOUNT             02636053
           MOVE FMT-ISIN                 TO W-DTL1-ISIN.                02639048
           MOVE FMT-AT-CONTROL-NUM       TO W-DTL1-CONTROL-NBR          02639548
           MOVE FMT-ADP-SEC-NO           TO W-DTL1-ADP-NO.              02639653
           MOVE FMT-STTLM-LCTN-CD        TO W-DTL1-SETTLE-LOC           02639948
           MOVE FMT-PRC-CTGY-CD          TO W-DTL1-PRICING-CAT          02640148
           MOVE FMT-TRNFR-TYPE-RSN-CD    TO W-DTL1-SETTLE-RSN           02640348
           MOVE FMT-AT-CRT-TIMESTAMP     TO W-DTL1-TMSTP                02640549
           MOVE W-DTL1-REC               TO W-REPT-LINE.                02640650
           PERFORM 7700-WRITE-LINE THRU 7700-EXIT.                      02640750
           ADD 2                         TO W-LINE-CNT.                 02640850
                                                                        02640948
           MOVE FMT-SEC-D-100            TO W-DTL2-DESC                 02641050
           MOVE W-DTL2-REC           TO W-REPT-LINE                     02641150
           PERFORM 7700-WRITE-LINE THRU 7700-EXIT                       02641250
           ADD 1                     TO W-LINE-CNT                      02641350
                                                                        02641448
           IF FMT-SEC-D-40 NOT = SPACES                                 02641550
              MOVE FMT-SEC-D-40          TO W-DTL3-DESC                 02641650
              MOVE W-DTL3-REC           TO W-REPT-LINE                  02641750
              PERFORM 7700-WRITE-LINE THRU 7700-EXIT                    02641850
              ADD 1                     TO W-LINE-CNT                   02641950
           END-IF.                                                      02642050
       WRITE-MSDISIN-RTN.                                               02642150
           MOVE MSDISIN-KEY-FIELD        TO W-DTL4-ISIN.                02642259
           MOVE MSDISIN-ADP-NO           TO W-DTL4-ADP-NO               02642359
                                            GETMSD-SEARCH-KEY.          02642451
           CALL GETMSDC USING MASTER-SECURITY-RECORD                    02642551
           MOVE SPACES            TO W-DTL2-DESC                        02642651
           IF  GETMSD-RETURN-VALID                                      02642751
              MOVE MS-DESC1          TO W-DTL2-DESC(1:30)               02642951
              MOVE MS-DESC2          TO W-DTL2-DESC(32:30)              02643051
              MOVE MS-DESC3          TO W-DTL2-DESC(63:30)              02643151
           END-IF                                                       02643251
           IF FMT-ADP-SEC-NO =  MSDISIN-ADP-NBR                         02643359
              MOVE '**MATCHED**' TO W-DTL4-MATCHED-MSG                  02643463
           ELSE                                                         02643559
              MOVE SPACES        TO W-DTL4-MATCHED-MSG                  02643663
           END-IF.                                                      02643759
           MOVE W-DTL4-REC           TO W-REPT-LINE                     02643859
           PERFORM 7700-WRITE-LINE THRU 7700-EXIT                       02643951
           ADD 1                     TO W-LINE-CNT.                     02644051
           MOVE W-DTL2-REC           TO W-REPT-LINE                     02644151
           PERFORM 7700-WRITE-LINE THRU 7700-EXIT                       02644251
           ADD 1                     TO W-LINE-CNT.                     02644351
       WRITE-MSDCUSIP-RTN.                                              02644466
           MOVE WS-MSDCUSIP-REC(1:12)    TO W-DTL4-ISIN.                02644567
           MOVE WS-MSDCUSIP-ADP-NBR      TO W-DTL4-ADP-NO               02644669
                                            GETMSD-SEARCH-KEY.          02644766
           CALL GETMSDC USING MASTER-SECURITY-RECORD                    02644866
           MOVE SPACES            TO W-DTL2-DESC                        02644966
           IF  GETMSD-RETURN-VALID                                      02645066
              MOVE MS-DESC1          TO W-DTL2-DESC(1:30)               02645166
              MOVE MS-DESC2          TO W-DTL2-DESC(32:30)              02645266
              MOVE MS-DESC3          TO W-DTL2-DESC(63:30)              02645366
           END-IF                                                       02645466
           IF FMT-ADP-SEC-NO =  WS-MSDCUSIP-ADP-NBR                     02645567
              MOVE '**MATCHED**' TO W-DTL4-MATCHED-MSG                  02645666
           ELSE                                                         02645766
              MOVE SPACES        TO W-DTL4-MATCHED-MSG                  02645866
           END-IF.                                                      02645966
           MOVE W-DTL4-REC           TO W-REPT-LINE                     02646066
           PERFORM 7700-WRITE-LINE THRU 7700-EXIT                       02646166
           ADD 1                     TO W-LINE-CNT.                     02646266
           MOVE W-DTL2-REC           TO W-REPT-LINE                     02646366
           PERFORM 7700-WRITE-LINE THRU 7700-EXIT                       02646466
           ADD 1                     TO W-LINE-CNT.                     02646566
740200/                                                                 02647066
750000****************                                                  02650000
750100 ENDJOB-ROUTINE.                                                  02660007
750200****************                                                  02670000
750300                                                                  02680000
021600     DISPLAY 'TOTAL ISINS  PRINTED ' WS-MSDISIN-GROUP-COUNT       02681067
021600     DISPLAY 'TOTAL CUSIPS PRINTED ' WS-MSDCUSIP-GROUP-COUNT      02682067
751700     CLOSE  PEND-FILE.                                            02690000
751800     IF  NOT  PEND-FILE-OK                                        02700000
751900         DISPLAY  'OLDPEND FILE CLOSE ERROR, STATUS = '           02710000
752000                   PEND-FILE-STATUS                               02720000
752100     END-IF.                                                      02730000
752200                                                                  02740000
752300     CLOSE  MSDISIN-FILE.                                         02750002
752400     IF  NOT  MSDISIN-FILE-OK                                     02760002
752500         DISPLAY  'MSDISIN FILE CLOSE ERROR, STATUS = '           02770002
752600                   MSDISIN-FILE-STATUS                            02780002
752700     END-IF.                                                      02790000
752800                                                                  02800000
752300     CLOSE  MSDCUSIP-FILE.                                        02801067
752400     IF  NOT  MSDCUSIP-FILE-OK                                    02802067
752500         DISPLAY  'MSDCUSIP FILE CLOSE ERROR, STATUS = '          02803067
752600                   MSDCUSIP-FILE-STATUS                           02804067
752700     END-IF.                                                      02805067
752800                                                                  02806067
756200     CLOSE  REPT-FILE.                                            02810036
756300     IF  NOT  REPT-FILE-OK                                        02820036
756400         DISPLAY  'XMSDPI FILE CLOSE ERROR, STATUS = '            02830007
756500                   REPT-FILE-STATUS                               02840036
230750           MOVE 3000 TO ABEND-CD                                  02850004
757600         CALL ABEND                 USING ABEND-CD                02860004
756600     END-IF.                                                      02870000
                                                                        02871042
       WRITE-NO-DETAILS-TODAY-RTN.                                      02880034
           MOVE 'NO DETAILS TO REPORT TODAY' TO  W-DTL3-DESC            02900034
           MOVE W-DTL3-REC           TO W-REPT-LINE                     02910034
           PERFORM 7700-WRITE-LINE THRU 7700-EXIT.                      02920034
           SKIP3                                                        02940034
       7700-WRITE-LINE.                                                 02950034
                                                                        02960034
           IF   W-LINE-CNT > 56                                         02970034
                PERFORM 7800-WRITE-HDR THRU 7800-EXIT.                  02980034
                                                                        02990034
           MOVE W-REPT-LINE              TO REPT-LINE.                  03000034
           MOVE B1-SUB                   TO REPT-CLT.                   03010036
           MOVE LOW-VALUES               TO REPT-FIL.                   03020034
           WRITE REPT-REC.                                              03030034
                                                                        03040034
       7700-EXIT. EXIT.                                                 03050034
           SKIP3                                                        03060034
       7800-WRITE-HDR.                                                  03070039
                                                                        03080034
           ADD  1                        TO W-PAGE-CNT.                 03090034
                                                                        03100034
           MOVE W-PAGE-CNT               TO W-HDR1-PAGE.                03110034
                                                                        03120034
           MOVE B1-SUB                   TO W-HDR1-CLT.                 03130036
           MOVE BH-BROKER-NAME                                          03140036
                                         TO W-HDR1-CLT-NAME.            03150034
                                                                        03160034
           MOVE W-PROC-DATE-MM           TO W-HDR1-MM.                  03170034
           MOVE W-PROC-DATE-DD           TO W-HDR1-DD.                  03180034
           MOVE W-PROC-DATE-YY           TO W-HDR1-YY.                  03190034
                                                                        03200034
           MOVE W-HDR1-REC               TO REPT-LINE.                  03210034
           MOVE B1-SUB                   TO REPT-CLT                    03220036
           MOVE LOW-VALUES               TO REPT-FIL.                   03230034
           WRITE REPT-REC.                                              03240034
           MOVE W-SYS-MM                 TO W-HDR2-MM.                  03250034
           MOVE W-SYS-DD                 TO W-HDR2-DD.                  03260034
           MOVE W-SYS-YY                 TO W-HDR2-YY.                  03270034
           MOVE W-SYS-HH                 TO W-HDR2-HH.                  03280034
           MOVE W-SYS-MN                 TO W-HDR2-MN.                  03290034
                                                                        03300034
           MOVE W-HDR2-REC               TO REPT-LINE.                  03310034
           MOVE B1-SUB                   TO REPT-CLT                    03320036
           MOVE LOW-VALUES               TO REPT-FIL.                   03330034
           WRITE REPT-REC.                                              03340034
                                                                        03350034
           MOVE W-HDR3-REC               TO REPT-LINE.                  03360034
           MOVE B1-SUB                   TO REPT-CLT                    03370036
           MOVE LOW-VALUES               TO REPT-FIL.                   03380034
           WRITE REPT-REC.                                              03390034
                                                                        03400034
           MOVE 6                        TO W-LINE-CNT.                 03410034
                                                                        03420034
       7800-EXIT. EXIT.                                                 03430034
      /                                                                 03440034
