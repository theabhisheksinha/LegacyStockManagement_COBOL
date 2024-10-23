000001* PDX    - CAT992   C0310447 06/16/11 14:40:49 TBLAMUR            00001029
LRM004* SSR 76586 CREATED FILE WITH MASKED SSN HAVING ASTERICS.         00001128
LRM004*   SSN PRESENT ON INTRA-DAY, EOD REPORT (SAME FORMAT) ONLY.      00001202
000001* PDX    - CAT992   C0290842 02/07/10 12:13:17 TBLAMUR            00001300
TNK003* SSR 65954 WRITE OUT NO TRANSFER ACTIVITY MASSAGE                00001400
000001* PDX    - CAT992   C0252815 08/14/07 15:18:47 TBLAMUR            00001500
LRM002* SSR 53131 SPLIT FILE BY CLIENT BASED ON CLIENT PARM             00001600
000001* PDX    - CAT992   C0151283 12/18/00 13:47:29 TBTIKUO            00001700
000001* PDX    - CAT992   C0124750 04/20/99 14:19:16 TBYOHON            00001800
000001* PDX    - CAT992   C0119911 12/31/98 10:33:47 TBYOHON            00001900
000001* PDX    - CAT992   C0118720 11/30/98 14:25:54 TBLAMUR            00002000
000100 IDENTIFICATION DIVISION.                                         00002100
000200 PROGRAM-ID.  CAT992.                                             00003000
003600 ENVIRONMENT DIVISION.                                            00004000
003700 INPUT-OUTPUT SECTION.                                            00005000
003800 FILE-CONTROL.                                                    00006000
003900                                                                  00007000
004000     SELECT INFILE           ASSIGN       TO INFILE.              00008000
004300     SELECT OUTFILE          ASSIGN       TO OUTFILE.             00009000
LRM002     SELECT OUTFILE-CLIENT   ASSIGN       TO OUTCLT.              00009100
004400                                                                  00010000
005200 DATA DIVISION.                                                   00020000
005300 FILE SECTION.                                                    00030000
005400 FD  INFILE                                                       00040000
005800     BLOCK CONTAINS 0 RECORDS.                                    00050000
005900 01  IN-REC    PIC X(133).                                        00060000
006500                                                                  00070000
006600 FD  OUTFILE                                                      00080000
007000     BLOCK CONTAINS 0 RECORDS.                                    00090000
007100                                                                  00100000
007200 01  OUT-REC   PIC X(143).                                        00110000
007300                                                                  00120000
LRM002 FD  OUTFILE-CLIENT                                               00121000
LRM002     BLOCK CONTAINS 0 RECORDS.                                    00122000
LRM002                                                                  00123000
LRM002 01  OUT-REC-CLIENT PIC X(133).                                   00124000
LRM002                                                                  00125000
008500 WORKING-STORAGE SECTION.                                         00130000
008600 COPY PDXIDCOB.                                                   00140000
       01  WS-ABEND-AREA.                                               00141000
TCK001     05 ABEND-CODE      PIC S9(4) COMP SYNC VALUE +0.             00142000
TCK001*    05 ABEND-DUMPSW    PIC X(1) VALUE 'D'.                       00143000
008700                                                                  00150000
008800 01  W-FIELDS.                                                    00160000
009100     05  FILLER                    PIC  X(001) VALUE '0'.         00170000
009200         88 END-OF-INPUT                       VALUE '1'.         00180000
TNK003     05  W-PARM-CLIENT-WRITE       PIC  X(001) VALUE '0'.         00181000
TNK003         88 PARM-CLIENT-WRITE                  VALUE '1'.         00182000
011700     05  W-TABLE-ENTRY-CNT         PIC  9(003) VALUE 0.           00190000
014500     05  W-SUB1                    PIC  9(004) VALUE 0.           00200000
014500     05  W-MAX1                    PIC  9(004) VALUE 0.           00210000
015100     05  W-INFILE-CNT              PIC  9(009) VALUE 0.           00220000
LRM002     05  WS-PARM-CLIENT            PIC  9(003) COMP-3 VALUE 0.    00221000
015200                                                                  00230000
015300 01  WS-IN-REC.                                                   00240000
015401     05 FILLER PIC X(01).                                         00250000
015400     05 WS-FORTH-ID.                                              00260000
015401        10 FILLER PIC X(05).                                      00270000
                88 WS-IN-DUMMY   VALUE 'TRANS'.                         00280000
                88 WS-IN-FIRST   VALUE 'DATE:' ' DATE'.                 00290000
                88 WS-IN-SECOND  VALUE 'TIME:' ' TYPE'.                 00300000
                88 WS-IN-THIRD   VALUE '     '.                         00310000
015401        10 FILLER PIC X(13).                                      00320000
                88 WS-IN-FORTH   VALUE 'ARTICIPANT: '.                  00330000
015401        10 WS-IN-PART PIC X(04).                                  00340000
015400     05 FILLER REDEFINES WS-FORTH-ID.                             00350000
015401        10 FILLER PIC X(13).                                      00360000
                 88 WS-IN-FORTH-FUND  VALUE 'PARTICIPANT: '.            00370000
015401        10 WS-IN-PART-FUND PIC X(04).                             00380000
015400     05 FILLER REDEFINES WS-FORTH-ID.                             00390000
015401        10 FILLER PIC X(14).                                      00400000
                 88 WS-IN-FORTH-STLR  VALUE 'PARTICIPANT:  '.           00410000
015401        10 WS-IN-PART-STLR PIC X(04).                             00420000
015410     05 FILLER.                                                   00430000
015411        10 FILLER PIC X(20).                                      00440000
015420     05 FILLER.                                                   00450000
015421        10 FILLER PIC X(20).                                      00460000
015430     05 FILLER.                                                   00470000
015431        10 FILLER PIC X(20).                                      00480000
015440     05 FILLER.                                                   00490000
015441        10 FILLER PIC X(20).                                      00500000
015450     05 FILLER.                                                   00510000
015460        10 FILLER PIC X(20).                                      00520000
015470     05 FILLER.                                                   00530000
015480        10 FILLER PIC X(13).                                      00540000
015500                                                                  00550000
015600 01  WS-IN-REC1    PIC X(133).                                    00560000
015610 01  WS-IN-REC2    PIC X(133).                                    00570000
015620 01  WS-IN-REC3.                                                  00580000
TNK003*    05 FILLER     PIC X(61).                                     00581000
TNK003     05 FILLER     PIC X(54).                                     00581100
TNK003     05 FILLER     PIC X(07).                                     00581200
TNK003        88 WS-CYCLE-PROC VALUE 'CYCLE  '.                         00581300
           05 WS-IN-CYCLE PIC X(01).                                    00582000
           05 FILLER     PIC X(71).                                     00583000
015630 01  WS-IN-REC4    PIC X(133).                                    00590000
TNK003 01  WS-OUT-DATA2.                                                00590100
TNK003     05 WS-FILLER     PIC X(050) VALUE SPACES.                    00590200
TNK003     05 WS-FILLER     PIC X(025) VALUE                            00590300
TNK003        'NO TRANSFER ACTIVITY FOR '.                              00590400
TNK003     05 WS-OUT-LIT    PIC X(006).                                 00590500
TNK003     05 WS-OUT-CYCLE  PIC X(001).                                 00590600
TNK003     05 WS-FILLER     PIC X(051) VALUE SPACES.                    00590700
015900 01  WS-OUT-REC.                                                  00600000
016000     05 WS-OUT-DATA   PIC X(133).                                 00610000
016010     05 WS-OUT-CLIENT PIC 9(3) COMP-3.                            00620000
016020     05 FILLER        PIC X(08) VALUE SPACE.                      00630000
LRM004 01  FILLER REDEFINES WS-OUT-REC.                                 00631024
LRM004     05 FILLER PIC X(41).                                         00632024
LRM004     05 FILLER PIC X(11).                                         00633024
LRM004           88 WS-OUT-SSN-ID1    VALUE 'SSN/TAX-ID:'.              00634024
LRM004     05 FILLER PIC X(01).                                         00635024
LRM004     05 WS-OUT-SSN1.                                              00636024
LRM004        07 WS-OUT-SSN1-1-3  PIC X(03).                            00637024
LRM004        07 FILLER           PIC X(01).                            00638024
LRM004        07 WS-OUT-SSN1-4-5  PIC X(02).                            00639024
LRM004        07 FILLER           PIC X(01).                            00639124
LRM004        07 WS-OUT-SSN1-6-9  PIC X(04).                            00639224
LRM004     05 FILLER           PIC X(01).                               00639324
LRM004     05 WS-OUT-SSN2.                                              00639424
LRM004        07 WS-OUT-SSN2-1-3  PIC X(03).                            00639524
LRM004        07 FILLER           PIC X(01).                            00639624
LRM004        07 WS-OUT-SSN2-4-5  PIC X(02).                            00639724
LRM004        07 FILLER           PIC X(01).                            00639824
LRM004        07 WS-OUT-SSN2-6-9  PIC X(04).                            00639924
LRM004 01  FILLER REDEFINES WS-OUT-REC.                                 00640026
LRM004     05 FILLER PIC X(50).                                         00640126
LRM004     05 WS-OUT-SSN3.                                              00640526
LRM004        07 WS-OUT-SSN3-1-3  PIC X(03).                            00640626
LRM004        07 FILLER           PIC X(01).                            00640726
LRM004        07 WS-OUT-SSN3-4-5  PIC X(02).                            00640826
LRM004        07 FILLER           PIC X(01).                            00640926
LRM004        07 WS-OUT-SSN3-6-9  PIC X(04).                            00641026
LRM004     05 FILLER           PIC X(01).                               00641126
LRM004     05 WS-OUT-SSN4.                                              00641226
LRM004        07 WS-OUT-SSN4-1-3  PIC X(03).                            00641326
LRM004        07 FILLER           PIC X(01).                            00641426
LRM004        07 WS-OUT-SSN4-4-5  PIC X(02).                            00641526
LRM004        07 FILLER           PIC X(01).                            00641626
LRM004        07 WS-OUT-SSN4-6-9  PIC X(04).                            00641726
016800 01  FILLER                        PIC X(008) VALUE 'W-TAB   '.   00642026
016900 01  W-TAB-AREA.                                                  00650000
017000     05  W-TAB OCCURS 1000 TIMES INDEXED BY TAB-X.                00660000
017200         10 W-TAB-CLIENT-NBR           PIC X(004).                00670000
017210         10 W-TAB-CLIENT-N   REDEFINES W-TAB-CLIENT-NBR PIC 9(4). 00680000
017300         10 W-TAB-BRK-NBR              PIC X(004).                00690000
TNK003         10 W-TAB-DATA-IND             PIC X(001).                00691000
TNK003            88 W-TAB-DATA-PRESENT    VALUE 'Y'.                   00692000
018200                                                                  00700000
           COPY BHINFO.                                                 00710000
           COPY BHACAT.                                                 00710100
TCK001     COPY STUBCPY.                                                00711000
020300***************************************************************** 00720000
020400*    LINKAGE SECTION                                            * 00730000
020500***************************************************************** 00740000
020600 LINKAGE SECTION.                                                 00750000
020700 01  L-JCL-PARMS.                                                 00760000
020800     05  PARMLENGTH                PIC S9(004) COMP SYNC.         00770000
020900     05  PARM-REPORT-ID            PIC  X(001).                   00780000
LRM004         88  EOD-REPORT                        VALUE ' '.         00790007
021000         88  FUND-REPORT                       VALUE 'F'.         00791000
LRM004         88  REJ-REPORT                        VALUE 'R'.         00792000
021000         88  STLR-REPORT                       VALUE 'S'.         00800000
020900     05  PARM-CYCLE                PIC  X(001).                   00801000
LRM002     05  PARM-CLIENT-SPLIT-FIELDS.                                00802000
LRM002         07  PARM-CLIENT-ID        PIC X(002).                    00802100
LRM002             88  PARM-CLIENT-RUN               VALUE 'CL'.        00802200
LRM002         07  PARM-CLIENT-NBR       PIC  X(003).                   00803000
LRM004     05  PARM-MASK-ID              PIC  X(001).                   00804001
LRM004         88  PARM-MASK-RUN                     VALUE 'M'.         00805001
021600                                                                  00810000
021700 PROCEDURE DIVISION USING L-JCL-PARMS.                            00820000
021800*                         ===========                             00830000
021900 0000-MAIN SECTION.                                               00840000
022300     COPY MSGCOBO.                                                00850000
022500                                                                  00860000
027900     OPEN INPUT  INFILE                                           00870000
030800          OUTPUT OUTFILE                                          00880000
LRM002                 OUTFILE-CLIENT.                                  00881000
022500                                                                  00890000
LRM002     IF PARM-CLIENT-RUN                                           00891000
LRM002        DISPLAY 'CAT992 PARM SET FOR CLIENT EXTRACT '             00892000
LRM002           PARM-CLIENT-NBR                                        00893000
LRM002        IF PARM-CLIENT-NBR NUMERIC                                00893100
LRM002           MOVE PARM-CLIENT-NBR TO WS-PARM-CLIENT                 00893200
LRM002     END-IF.                                                      00894000
                                                                        00895000
022800     PERFORM 1500-LOAD-TABLE     THRU 1500-EXIT.                  00900000
022500                                                                  00910000
023000     PERFORM 2000-PROCESS                                         00920000
                 UNTIL END-OF-INPUT.                                    00930000
022500                                                                  00940000
TNK003     PERFORM 4000-NOTRANSFER     THRU 4000-EXIT.                  00941000
                                                                        00942000
023200     CLOSE INFILE OUTFILE OUTFILE-CLIENT.                         00950000
022500                                                                  00960000
023400     GOBACK.                                                      00970000
033800                                                                  00980000
041100 1500-LOAD-TABLE.                                                 00990000
041200                                                                  01000000
041800     PERFORM VARYING W-SUB1 FROM 1 BY 1 UNTIL W-SUB1 > 999        01010000
042100       MOVE W-SUB1  TO BH-BROKER-NUMBER-N                         01020000
042200       MOVE '015'     TO BH-LOGICAL-RECORD-CODE                   01030000
             MOVE  '434500'            TO  BH-B2-INFO-ID                01042000
             CALL   GETB1V           USING BH-BROKER-HEADER-INFO,       01043000
                                           BH-ACAT-INFO                 01044000
             END-CALL                                                   01045000
             IF BH-BROKER-ACTIVE                                        01050000
              AND BH-ACAT-ACTIVE                                        01051000
              AND BH-BROKER-CLEARING-HOUSE (2 : 4) NOT = '0969'         01060000
              AND BH-USA-BROKER                                         01070000
                ADD   1    TO W-MAX1                                    01080000
                MOVE W-SUB1     TO W-TAB-CLIENT-N (W-MAX1)              01090000
                MOVE BH-BROKER-CLEARING-HOUSE (2 : 4)                   01100000
042400                            TO W-TAB-BRK-NBR    (W-MAX1)          01110000
                DISPLAY 'CLT=' W-TAB-CLIENT-N (W-MAX1)                  01111000
                        '    BRK=' W-TAB-BRK-NBR    (W-MAX1)            01112000
             END-IF                                                     01120000
043000     END-PERFORM.                                                 01130000
043100                                                                  01140000
043500 1500-EXIT.                                                       01150000
043600     EXIT.                                                        01160000
043700/                                                                 01170000
043800 2000-PROCESS.                                                    01180000
043900                                                                  01190000
044000     PERFORM 3000-READ                                            01200000
044100        UNTIL WS-IN-FIRST    OR END-OF-INPUT.                     01210000
043900                                                                  01220000
044200     IF NOT END-OF-INPUT                                          01230000
044400       MOVE WS-IN-REC    TO WS-IN-REC1                            01240000
LRM002       IF NOT PARM-CLIENT-RUN                                     01241000
044400          MOVE '1'          TO WS-IN-REC1(1 : 1)                  01250000
LRM002       END-IF                                                     01251000
044410       PERFORM 3000-READ                                          01260000
044420       MOVE WS-IN-REC    TO WS-IN-REC2                            01270000
044430       PERFORM 3000-READ                                          01280000
             IF (WS-IN-FORTH-STLR AND STLR-REPORT)                      01281000
               MOVE SPACES     TO WS-IN-REC3                            01282000
               MOVE WS-IN-REC  TO WS-IN-REC4                            01283000
                 PERFORM 2500-PRINT-REPORT                              01283100
             ELSE                                                       01283200
044440         MOVE WS-IN-REC    TO WS-IN-REC3                          01283300
044450         PERFORM 3000-READ                                        01283400
044460         MOVE WS-IN-REC    TO WS-IN-REC4                          01283500
               IF  WS-IN-FORTH                                          01283600
                OR (WS-IN-FORTH-FUND AND FUND-REPORT)                   01283700
                OR (WS-IN-FORTH-STLR AND STLR-REPORT)                   01283800
                 PERFORM 2500-PRINT-REPORT                              01283900
               END-IF                                                   01284000
             END-IF                                                     01285000
044500     END-IF.                                                      01286000
043900                                                                  01287000
       2500-PRINT-REPORT.                                               01288000
                                                                        01288100
044510     MOVE  0    TO WS-OUT-CLIENT                                  01289000
           PERFORM VARYING W-SUB1 FROM 1 BY 1 UNTIL W-SUB1 > W-MAX1     01290000
             IF FUND-REPORT AND                                         01300000
042400          W-TAB-BRK-NBR (W-SUB1) = WS-IN-PART-FUND                01310000
TNK003         SET  W-TAB-DATA-PRESENT(W-SUB1) TO TRUE                  01311000
042200         MOVE W-TAB-CLIENT-N (W-SUB1)                             01320000
044510                           TO WS-OUT-CLIENT                       01330000
042300         MOVE W-MAX1   TO W-SUB1                                  01340000
             ELSE                                                       01350000
              IF STLR-REPORT AND                                        01360000
042400          W-TAB-BRK-NBR (W-SUB1) = WS-IN-PART-STLR                01370000
TNK003         SET  W-TAB-DATA-PRESENT(W-SUB1) TO TRUE                  01371000
042200         MOVE W-TAB-CLIENT-N (W-SUB1)                             01380000
044510                           TO WS-OUT-CLIENT                       01390000
042300         MOVE W-MAX1   TO W-SUB1                                  01400000
              ELSE                                                      01410000
042400         IF W-TAB-BRK-NBR (W-SUB1) = WS-IN-PART                   01420000
TNK003          SET  W-TAB-DATA-PRESENT(W-SUB1) TO TRUE                 01421000
042200          MOVE W-TAB-CLIENT-N (W-SUB1)                            01430000
044510                           TO WS-OUT-CLIENT                       01440000
042300          MOVE W-MAX1   TO W-SUB1                                 01450000
               END-IF                                                   01460000
              END-IF                                                    01470000
             END-IF                                                     01480000
043000     END-PERFORM.                                                 01490000
           IF WS-OUT-CLIENT NOT = 0                                     01491000
             IF  PARM-CYCLE > '0'                                       01492000
              IF  PARM-CYCLE NOT = WS-IN-CYCLE                          01493000
                  DISPLAY '**** WRONG CYCLE   TRY LATER PLEASE ***'     01494000
                  DISPLAY 'RUN CYCLE ' PARM-CYCLE                       01495000
                  DISPLAY 'CYCLE ON FILE ' WS-IN-CYCLE                  01495100
                  DISPLAY '**** REFERESH CA11 AND START FROM   ***'     01496000
                  DISPLAY '**** THE TOP AGAIN TO TAKE IN NEW GDG**'     01497000
                  MOVE 3000    TO ABEND-CODE                            01497100
TCK001            CALL  ABEND    USING ABEND-CODE                       01497200
              END-IF                                                    01498000
             END-IF                                                     01499000
           END-IF.                                                      01499100
044520                                                                  01500000
044600     IF  WS-OUT-CLIENT NOT = 0                                    01510000
LRM002        IF PARM-CLIENT-RUN                                        01511000
LRM002        AND WS-OUT-CLIENT = WS-PARM-CLIENT                        01512000
TNK003          IF W-PARM-CLIENT-WRITE = 0                              01513000
TNK003            SET PARM-CLIENT-WRITE TO TRUE                         01514000
TNK003          END-IF                                                  01515000
LRM002          WRITE OUT-REC-CLIENT FROM WS-IN-REC1                    01530000
LRM002          WRITE OUT-REC-CLIENT FROM WS-IN-REC2                    01540000
LRM002          WRITE OUT-REC-CLIENT FROM WS-IN-REC3                    01550000
LRM002          WRITE OUT-REC-CLIENT FROM WS-IN-REC4                    01560000
LRM002        ELSE                                                      01590100
044700          MOVE WS-IN-REC1 TO WS-OUT-DATA                          01591000
044800          PERFORM WRITE-REPORT                                    01592000
044700          MOVE WS-IN-REC2 TO WS-OUT-DATA                          01593000
044800          PERFORM WRITE-REPORT                                    01594000
044700          MOVE WS-IN-REC3 TO WS-OUT-DATA                          01595000
044800          PERFORM WRITE-REPORT                                    01596000
044700          MOVE WS-IN-REC4 TO WS-OUT-DATA                          01597000
044800          PERFORM WRITE-REPORT                                    01598000
LRM002        END-IF                                                    01599000
044000        PERFORM 3000-READ                                         01600000
044800        PERFORM                                                   01610000
044100          UNTIL WS-IN-FIRST    OR END-OF-INPUT                    01620000
LRM002          IF PARM-CLIENT-RUN                                      01631000
LRM002          AND WS-OUT-CLIENT = WS-PARM-CLIENT                      01631100
LRM002             WRITE OUT-REC-CLIENT FROM WS-IN-REC                  01632000
LRM002          ELSE                                                    01633000
                   MOVE WS-IN-REC   TO WS-OUT-DATA                      01634000
044800             PERFORM WRITE-REPORT                                 01640000
LRM002          END-IF                                                  01641000
044000          PERFORM 3000-READ                                       01650000
044800        END-PERFORM                                               01660000
045300     END-IF.                                                      01670000
045400                                                                  01680000
049600                                                                  01690000
050000 3000-READ.                                                       01700000
050100                                                                  01710000
050600     READ INFILE INTO WS-IN-REC                                   01720000
050700          AT END                                                  01730000
050800             SET END-OF-INPUT  TO TRUE                            01740000
050900             DISPLAY 'CAT992: END OF INPUT REACHED - '            01750000
                                    W-INFILE-CNT                        01760000
                NOT AT END                                              01770000
                   IF WS-IN-DUMMY                                       01780000
                   OR (WS-IN-REC = SPACES                               01790000
LRM002             AND NOT PARM-CLIENT-RUN)                             01791000
                     GO TO 3000-READ                                    01800000
                   END-IF                                               01810000
051400             ADD  1          TO W-INFILE-CNT                      01820000
051200     END-READ.                                                    01830000
051300                                                                  01840000
TNK003 4000-NOTRANSFER.                                                 01841000
TNK003     IF W-INFILE-CNT NOT = 0                                      01841100
TNK003      IF WS-CYCLE-PROC                                            01841200
TNK003        MOVE 'CYCLE '    TO WS-OUT-LIT                            01841300
TNK003        MOVE WS-IN-CYCLE TO WS-OUT-CYCLE                          01841400
TNK003      ELSE                                                        01841500
TNK003        MOVE 'EOD   '    TO WS-OUT-LIT                            01841600
TNK003        MOVE  SPACE      TO WS-OUT-CYCLE                          01841700
TNK003      END-IF                                                      01841800
TNK003      IF PARM-CLIENT-RUN                                          01841900
TNK003        IF W-PARM-CLIENT-WRITE = 0                                01842000
TNK003          MOVE '      1'    TO WS-IN-REC1(127:7)                  01842100
TNK003          WRITE OUT-REC-CLIENT FROM WS-IN-REC1                    01842200
TNK003          MOVE  SPACES  TO WS-IN-REC2(20:80)                      01842300
TNK003          WRITE OUT-REC-CLIENT FROM WS-IN-REC2                    01842400
TNK003          WRITE OUT-REC-CLIENT FROM WS-OUT-DATA2                  01842500
TNK003        END-IF                                                    01842600
TNK003      ELSE                                                        01842700
TNK003        PERFORM VARYING W-SUB1 FROM 1 BY 1 UNTIL W-SUB1 > W-MAX1  01842800
TNK003         IF NOT W-TAB-DATA-PRESENT(W-SUB1)                        01843000
TNK003           MOVE W-TAB-CLIENT-N (W-SUB1)                           01843100
TNK003                             TO WS-OUT-CLIENT                     01843200
TNK003           MOVE '      1'    TO WS-IN-REC1(127:7)                 01843300
TNK003           MOVE WS-IN-REC1   TO WS-OUT-DATA                       01843400
TNK003           PERFORM WRITE-REPORT                                   01843500
TNK003           MOVE WS-IN-REC2   TO WS-OUT-DATA                       01843600
TNK003           MOVE SPACES       TO WS-OUT-DATA(20:80)                01843700
TNK003           PERFORM WRITE-REPORT                                   01843800
TNK003           MOVE WS-OUT-DATA2 TO WS-OUT-DATA                       01843900
TNK003           PERFORM WRITE-REPORT                                   01844000
TNK003         END-IF                                                   01844100
TNK003        END-PERFORM                                               01844200
TNK003      END-IF.                                                     01844300
TNK003 4000-EXIT.                                                       01844400
TNK003     EXIT.                                                        01844500
TNK003/                                                                 01845000
053000 WRITE-REPORT.                                                    01850000
LRM004     IF PARM-MASK-RUN                                             01850126
LRM004     AND EOD-REPORT                                               01850226
LRM004     AND WS-OUT-SSN-ID1                                           01850326
LRM004     AND WS-OUT-SSN1-1-3 > SPACES                                 01850426
LRM004     AND WS-OUT-SSN1-1-3 NOT = '000'                              01850526
LRM004        MOVE ALL '*' TO WS-OUT-SSN1-1-3                           01851128
LRM004                        WS-OUT-SSN1-4-5                           01851228
LRM004                        WS-OUT-SSN1-6-9                           01851328
LRM004        IF WS-OUT-SSN2-1-3 > SPACES                               01851526
LRM004        AND WS-OUT-SSN2-1-3 NOT = '000'                           01851626
LRM004           MOVE ALL '*' TO WS-OUT-SSN2-1-3                        01852328
LRM004                           WS-OUT-SSN2-4-5                        01852428
LRM004                           WS-OUT-SSN2-6-9                        01852528
LRM004        END-IF                                                    01852726
LRM004     END-IF.                                                      01852826
                                                                        01852926
LRM004     IF PARM-MASK-RUN                                             01853026
LRM004     AND EOD-REPORT                                               01853126
LRM004     AND WS-OUT-REC(2:1) > SPACES                                 01853226
LRM004     AND WS-OUT-REC(3:1) > SPACES                                 01853326
LRM004     AND WS-OUT-REC(4:1) > SPACES                                 01853426
LRM004     AND WS-OUT-REC(5:1) > SPACES                                 01853526
LRM004     AND WS-OUT-REC(6:3) = SPACES                                 01853626
LRM004     AND WS-OUT-SSN3-1-3 > SPACES                                 01853726
LRM004     AND WS-OUT-SSN3-1-3 NOT = '000'                              01853826
LRM004        MOVE ALL '*' TO WS-OUT-SSN3-1-3                           01854428
LRM004                        WS-OUT-SSN3-4-5                           01854528
LRM004                        WS-OUT-SSN3-6-9                           01854628
LRM004        IF WS-OUT-SSN4-1-3 > SPACES                               01854826
LRM004        AND WS-OUT-SSN4-1-3 NOT = '000'                           01854926
LRM004           MOVE ALL '*' TO WS-OUT-SSN4-1-3                        01855628
LRM004                           WS-OUT-SSN4-4-5                        01855728
LRM004                           WS-OUT-SSN4-6-9                        01855828
LRM004     END-IF.                                                      01856026
                                                                        01857026
053100     WRITE OUT-REC  FROM WS-OUT-REC.                              01862026
