000001* PDX    - CATP2CV  C0291396 03/25/10 10:15:52 TBLAMUR            00001009
000200 IDENTIFICATION DIVISION.                                         00002000
000300 PROGRAM-ID.    CATP2CV.                                          00003000
000700*REMARKS.                                                         00004000
000800******************************************************************00005000
      *  P2 FILE UPDATE                                                 00006000
      *  SSR #69400 FLIP CUST ACCOUNT FROM CLIENT 10 TO 210.            00007000
      *                                                                 00008000
000900* LOOKUP CUST ACCOUNT ON AUX FILE. IF NOT FOUND, WRITE OUT ASIS.  00009000
001100*                                                                 00010004
000900* FOUND:                                                          00020004
000900*  CLIENT 10:                                                     00030000
000900*  CHANGE THE ACCOUNT NUMBER TO CLIENT 10 OMNI AND WRITE OUT.     00050000
000900*  COPY ALL SECURITY TRAILER RECORDS TO OMNI.                     00051004
000900*  ADD A TRAILER SAYING PAID TO RIDGE ACCOUNT BBB-AAAAA-T(ORIG AC)00052004
000900*                                                                 00053004
000900*  CLIENT 210:                                                    00060000
000900*  BOOK ORIGINAL RECORD INTO CUST ACCOUNT AS ON ORIG FILE AS 210. 00070004
000900*  COPY ALL SECURITY TRAILER RECORDS.                             00071004
000900*  CHANGE THE ACCOUNT NUMBER TO CLIENT 210 OMNI AND WRITE OUT,    00072004
000900*  FLIP THE DEBIT/CREDIT.                                         00080004
000900*  COPY ALL SECURITY TRAILER RECORDS TO 210 OMNI.                 00081004
000900*  ADD TRAILER SAYING DLVR TO RIDGE ACCOUNT BBB-AAAAA-T(ORIG AC)  00091004
004300******************************************************************00100000
004400     EJECT                                                        00110000
004500 ENVIRONMENT DIVISION.                                            00120000
004600 CONFIGURATION SECTION.                                           00130000
004900 INPUT-OUTPUT SECTION.                                            00140000
005000                                                                  00150000
005100 FILE-CONTROL.                                                    00160000
005200                                                                  00170000
005300     SELECT INPUT-P2     ASSIGN TO UT-S-INP2                      00180000
                                   FILE STATUS IS INPUT-P2-STATUS.      00190000
                                                                        00200000
           SELECT AUXFILE          ASSIGN       TO AUXFILE              00210000
                                   ACCESS MODE  IS DYNAMIC              00220000
                                   ORGANIZATION IS INDEXED              00230000
                                   RECORD KEY   IS FD-AUX23-XREF-KEY    00240000
                                   FILE STATUS  IS AUXFILE-STAT.        00250000
005300     SELECT OUTPUT-P2    ASSIGN TO UT-S-OUTP2                     00260000
                                      FILE STATUS IS OUTPUT-P2-STATUS.  00270000
005300     SELECT OUTPUT-P2CV  ASSIGN TO UT-S-OUTP2CV                   00280000
                                      FILE STATUS IS OUTPUT-P2CV-STATUS.00290000
                                                                        00300000
005900 DATA DIVISION.                                                   00310000
006000 FILE SECTION.                                                    00320000
006100                                                                  00330000
006200 FD  INPUT-P2                                                     00340000
006300     RECORDING MODE IS F                                          00350000
006400     LABEL RECORDS ARE STANDARD                                   00360000
006500     BLOCK CONTAINS 0 RECORDS.                                    00370000
006600 01  INPUT-P2-RECORD             PIC X(120).                      00380000
       01  P2-BK-RECORD.                                                00390000
               03  P2-BK-TRID          PIC XXX   VALUE 'BNS'.           00400000
               03  FILLER-1  REDEFINES P2-BK-TRID.                      00410000
                   05  P2-BK-TRID-X        PIC X.                       00420000
                   05  P2-BK-BATCH-CODE    PIC XX.                      00430000
               03  P2-BK-BROKER-NBR    PIC XXX.                         00440000
               03  P2-BK-BUY-SELL-CODE PIC X.                           00450000
               03  P2-BK-QUANTITY  PIC 9(11) COMP-3.                    00460000
               03  P2-BK-QUANTITY-X                                     00470000
                          REDEFINES P2-BK-QUANTITY.                     00480000
                   05  P2-BK-QUANTITY-SW   PIC X.                       00490000
                   05  FILLER              PIC X(5).                    00500000
               03  P2-BK-SECURITY-NBR  PIC X(7).                        00510000
               03  FILLER              PIC XX    VALUE SPACES.          00520000
               03  P2-BK-ENTRY-CODE    PIC XXX   VALUE 'TFR'.           00530000
               03  FILLER              PIC X(5)  VALUE SPACES.          00540000
               03  P2-BK-BR-ACCT-T-C.                                   00550000
                 05  P2-BK-BR-ACCT-T.                                   00560000
                   07  P2-BK-BRANCH    PIC XXX.                         00570000
                   07  P2-BK-ACCOUNT   PIC X(5).                        00580000
                   07  P2-BK-TYPE      PIC 9.                           00590000
                 05  P2-BK-CHECK-DIGIT PIC X.                           00600000
               03  P2-BK-SPIN-DTW      PIC XX    VALUE SPACES.          00610000
               03  P2-BK-AMOUNT        PIC 9(16)V99 COMP-3.             00620000
               03  P2-BK-AMOUNT-DOLLARS REDEFINES P2-BK-AMOUNT          00630000
                                       PIC 9(18)   COMP-3.              00640000
               03  P2-BK-DESCRIPTION.                                   00650000
                   05  FILLER          PIC X(4)  VALUE 'ACAT'.          00660000
                   05  P2-BK-CNTL-NBR  PIC X(14).                       00670000
                   05  FILLER          PIC X(5)  VALUE ' BOS '.         00680000
                   05  P2-BK-CNTRA-BKR PIC X(4).                        00690000
               03  FILLER              PIC X     VALUE SPACES.          00700000
               03  P2-BK-CURRENCY      PIC XXX   VALUE '000'.           00710000
               03  P2-BK-VALUE-DT      PIC 9(07)  COMP-3.               00720000
               03  P2-BK-VALUE-DT-X  REDEFINES P2-BK-VALUE-DT           00730000
                                       PIC X(04).                       00740000
               03  FILLER              PIC X(06)  VALUE SPACES.         00750000
               03  P2-BK-FRACTION      PIC V9(5).                       00760000
               03  P2-BK-FRACTION-X    REDEFINES P2-BK-FRACTION         00770000
                                       PIC X(05).                       00780000
               03  FILLER              PIC X(22)  VALUE SPACES.         00790000
      *                                                                 00800000
       01  P2-BK-TRAILER-RECORD.                                        00810000
               03  P2-BKT-TRID           PIC X(03).                     00820000
               03  FILLER-1  REDEFINES P2-BKT-TRID.                     00830000
                   05  P2-BKT-TRID-X     PIC X(01).                     00840000
                   05  P2-BKT-BATCH-CODE PIC X(02).                     00850000
               03  P2-BKT-BROKER-NBR     PIC X(03).                     00860000
               03  P2-BKT-BUY-SELL-CODE  PIC X(01).                     00870000
               03  P2-BKT-QUANTITY-X     PIC X(06).                     00880000
               03  P2-BKT-SECURITY-NBR   PIC X(07).                     00890000
               03  FILLER                PIC X(02).                     00900000
               03  P2-BKT-ENTRY-CODE     PIC X(03).                     00910000
               03  FILLER                PIC X(05).                     00920000
               03  P2-BKT-BR-ACCT-T-C.                                  00930000
                 05  P2-BKT-BR-ACCT-T.                                  00940000
                   07  P2-BKT-BRANCH     PIC X(03).                     00950000
                   07  P2-BKT-ACCOUNT    PIC X(05).                     00960000
                   07  P2-BKT-TYPE       PIC X(01).                     00970000
                 05  P2-BKT-CHECK-DIGIT  PIC X(01).                     00980000
               03  FILLER                PIC X(02).                     00990000
               03  P2-BKT-AMOUNT-X       PIC X(10).                     01000000
               03  P2-BKT-DESCRIPTION.                                  01010000
                   05  P2-BKT-RESCODE    PIC X(02).                     01020000
                   05  P2-BKT-RESDESC    PIC X(25).                     01030000
               03  P2-BKT-HYPHEN         PIC X(01) VALUE SPACES.        01040000
               03  FILLER                PIC X(03).                     01050000
               03  FILLER                PIC X(10) VALUE SPACES.        01060000
               03  P2-BKT-FRACTION       PIC V9(5).                     01070000
               03  P2-BKT-FRACTION-X     REDEFINES P2-BKT-FRACTION      01080000
                                         PIC X(05).                     01090000
               03  FILLER                PIC X(22) VALUE SPACES.        01100000
006621     SKIP3                                                        01110000
       FD  AUXFILE                                                      01120000
           LABEL RECORDS ARE STANDARD.                                  01130000
           COPY AUX23REC REPLACING ==:PFX:== BY ==FD-==.                01140000
006701     SKIP3                                                        01150000
006200 FD  OUTPUT-P2                                                    01160000
006300     RECORDING MODE IS F                                          01170000
006400     LABEL RECORDS ARE STANDARD                                   01180000
006500     BLOCK CONTAINS 0 RECORDS.                                    01190000
006600 01  OUTPUT-P2-RECORD            PIC X(120).                      01200000
006701     SKIP3                                                        01210000
006200 FD  OUTPUT-P2CV                                                  01220000
006300     RECORDING MODE IS F                                          01230000
006400     LABEL RECORDS ARE STANDARD                                   01240000
006500     BLOCK CONTAINS 0 RECORDS.                                    01250000
006600 01  OUTPUT-P2CV-RECORD          PIC X(120).                      01260000
006701     SKIP3                                                        01270000
006718/                                                                 01280000
009800 WORKING-STORAGE SECTION.                                         01290000
009900                                                                  01300000
010000 COPY PDXIDCOB.                                                   01310000
010100                                                                  01320000
010200 77  PGM-NAME                    PIC X(8) VALUE 'CATP2CV'.        01330000
010605 77  INPUT-P2-READ               PIC S9(9) COMP-3    VALUE +0.    01340000
010605 77  OUTPUT-P2-WRITE             PIC S9(9) COMP-3    VALUE +0.    01350000
010605 77  OUTPUT-P2CV-WRITE           PIC S9(9) COMP-3    VALUE +0.    01360000
       77  CL010-OMNI-ACCOUNT          PIC X(10) VALUE '0965223720'.    01370000
       77  CL210-OMNI-ACCOUNT          PIC X(10) VALUE '0975223728'.    01380000
       77  WS-SAVE-BK-BR-ACCT-T-C      PIC X(10).                       01390000
       77  WS-SAVE-BUY-SELL-CODE       PIC X.                           01400000
       77  P2BKPG-RECS                 PIC 9(11)  VALUE 0.              01410000
       01  WORK-AREA.                                                   01420000
           05  INPUT-P2-STATUS            PIC X(02).                    01430000
               88 INPUT-P2-OKAY          VALUE '00'.                    01440000
           05  OUTPUT-P2-STATUS           PIC X(02).                    01450000
               88 OUTPUT-P2-OKAY         VALUE '00'.                    01460000
           05  OUTPUT-P2CV-STATUS         PIC X(02).                    01470000
               88 OUTPUT-P2CV-OKAY       VALUE '00'.                    01480000
           05  INPUT-EOF-SW               PIC X(01)  VALUE 'N'.         01490000
               88 INPUT-P2-EOF           VALUE 'Y'.                     01500000
           05  ABEND-CD                   PIC S9(04) COMP SYNC VALUE 0. 01510000
           05  DATE-RECORD.                                             01520000
               10  DATE-FIELD             PIC X(05) VALUE 'DATE='.      01530000
               10  FILLER                 PIC X(115).                   01540000
           05  SUB                        PIC S9(4) COMP.               01550000
           05  WS-RECS-LOADED             PIC S9(4) COMP.               01560000
           05  WS-CL210-OMNI-REC OCCURS 10 TIMES                        01570000
                                          PIC X(120).                   01580000
       01  W-AUXFILE-FIELDS.                                            01590000
           05  AUXFILE-STAT              PIC  X(002).                   01600000
               88 AUXFILE-OKAY           VALUE '00' THRU '09', '97'.    01610000
               88 AUXFILE-FOUND          VALUE '00'.                    01620000
               88 AUXFILE-NOT-FOUND      VALUE '23'.                    01630000
               88 AUXFILE-END-OF-FILE    VALUE '10'.                    01640000
               88 AUXFILE-EMPTY-MISSING  VALUE '35'.                    01650000
           05  W-AUXFILE-CNT             PIC  9(009) COMP-3 VALUE 0.    01660000
                                                                        01670000
       01  P2-DEBIT-SIGN               PIC X     VALUE '0'.             01680000
       01  P2-CREDIT-SIGN              PIC X     VALUE '-'.             01690000
                                                                        01700000
043300* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 01710000
043400*    INPUT P2 RECORD WORK AREA                                    01720000
043500* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 01730000
128700 01  FILLER                 PIC X(16) VALUE 'INPUT-P2-WS '.       01740000
128800 01  INPUT-P2-WORK-AREA.                                          01750000
           02  WS-P2-BK-RECORD.                                         01760000
               03  WS-P2-BK-TRID       PIC XXX   VALUE 'BNS'.           01770000
               03  FILLER-1  REDEFINES WS-P2-BK-TRID.                   01780000
                   05  WS-P2-BK-TRID-X     PIC X.                       01790000
                   05  WS-P2-BK-BATCH-CODE PIC XX.                      01800000
               03  WS-P2-BK-BROKER-NBR PIC XXX.                         01810000
               03  WS-P2-BK-BUY-SELL-CODE PIC X.                        01820000
               03  WS-P2-BK-QUANTITY PIC 9(11) COMP-3.                  01830000
               03  WS-P2-BK-QUANTITY-X                                  01840000
                          REDEFINES WS-P2-BK-QUANTITY.                  01850000
                   05  WS-P2-BK-QUANTITY-SW PIC X.                      01860000
                   05  FILLER              PIC X(5).                    01870000
               03  WS-P2-BK-SECURITY-NBR PIC X(7).                      01880000
               03  FILLER              PIC XX    VALUE SPACES.          01890000
               03  WS-P2-BK-ENTRY-CODE PIC XXX   VALUE 'TFR'.           01900000
               03  FILLER              PIC X(5)  VALUE SPACES.          01910000
               03  WS-P2-BK-BR-ACCT-T-C.                                01920000
                 05  WS-P2-BK-BR-ACCT.                                  01930000
                   07  WS-P2-BK-BRANCH    PIC XXX.                      01940000
                   07  WS-P2-BK-ACCOUNT   PIC X(5).                     01950000
                 05  WS-P2-BK-TYPE        PIC 9.                        01960000
                 05  WS-P2-BK-CHECK-DIGIT PIC X.                        01970000
               03  WS-P2-BK-SPIN-DTW   PIC XX    VALUE SPACES.          01980000
               03  WS-P2-BK-AMOUNT     PIC 9(16)V99 COMP-3.             01990000
               03  WS-P2-BK-AMOUNT-DOLLARS REDEFINES WS-P2-BK-AMOUNT    02000000
                                       PIC 9(18)   COMP-3.              02010000
               03  WS-P2-BK-DESCRIPTION.                                02020000
                   05  FILLER          PIC X(4)  VALUE 'ACAT'.          02030000
                   05  WS-P2-BK-CNTL-NBR PIC X(14).                     02040000
                   05  FILLER          PIC X(5)  VALUE ' BOS '.         02050000
                   05  WS-P2-BK-CNTRA-BKR PIC X(4).                     02060000
               03  FILLER              PIC X     VALUE SPACES.          02070000
               03  WS-P2-BK-CURRENCY   PIC XXX   VALUE '000'.           02080000
               03  WS-P2-BK-VALUE-DT   PIC 9(07)  COMP-3.               02090000
               03  WS-P2-BK-VALUE-DT-X REDEFINES WS-P2-BK-VALUE-DT      02100000
                                       PIC X(04).                       02110000
               03  FILLER              PIC X(06)  VALUE SPACES.         02120000
               03  WS-P2-BK-FRACTION   PIC V9(5).                       02130000
               03  WS-P2-BK-FRACTION-X REDEFINES WS-P2-BK-FRACTION      02140000
                                       PIC X(05).                       02150000
               03  FILLER              PIC X(22)  VALUE SPACES.         02160000
      *                                                                 02170000
           02  WS-P2-BK-TRAILER-RECORD.                                 02180000
               03  WS-P2-BKT-TRID        PIC X(03).                     02190000
               03  FILLER-1  REDEFINES WS-P2-BKT-TRID.                  02200000
                   05  WS-P2-BKT-TRID-X  PIC X(01).                     02210000
                   05  WS-P2-BKT-BATCH-CODE PIC X(02).                  02220000
               03  WS-P2-BKT-BROKER-NBR  PIC X(03).                     02230000
               03  WS-P2-BKT-BUY-SELL-CODE PIC X(01).                   02240000
               03  WS-P2-BKT-QUANTITY-X  PIC X(06).                     02250000
               03  WS-P2-BKT-SECURITY-NBR PIC X(07).                    02260000
               03  FILLER                PIC X(02).                     02270000
               03  WS-P2-BKT-ENTRY-CODE  PIC X(03).                     02280000
               03  FILLER                PIC X(05).                     02290000
               03  WS-P2-BKT-BR-ACCT-T-C.                               02300000
                 05  WS-P2-BKT-BR-ACCT.                                 02310000
                   07  WS-P2-BKT-BRANCH  PIC X(03).                     02320000
                   07  WS-P2-BKT-ACCOUNT PIC X(05).                     02330000
                 05  WS-P2-BKT-TYPE      PIC X(01).                     02340000
                 05  WS-P2-BKT-CHECK-DIGIT PIC X(01).                   02350000
               03  FILLER                PIC X(02).                     02360000
               03  WS-P2-BKT-AMOUNT-X    PIC X(10).                     02370000
               03  WS-P2-BKT-DESCRIPTION.                               02380000
                   05  WS-P2-BKT-RESCODE PIC X(02).                     02390000
                   05  WS-P2-BKT-RESDESC PIC X(25).                     02400000
               03  WS-P2-BKT-HYPHEN      PIC X(01) VALUE SPACES.        02410000
               03  WS-P2-BKT-CURRENCY    PIC X(03).                     02420000
               03  FILLER                PIC X(10) VALUE SPACES.        02430000
               03  WS-P2-BKT-FRACTION    PIC V9(5).                     02440000
               03  FILLER                PIC X(22) VALUE SPACES.        02450000
043300* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 02460000
043400*    OUTPUT P2 RECORD WORK AREA                                   02470000
043500* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 02480000
128700 01  FILLER                 PIC X(16) VALUE 'OUTPUT-P2-WS '.      02490000
      *                                                                 02500000
         COPY STUBCPY.                                                  02510000
00085 /                                                                 02520000
035142                                                                  02530000
035143 PROCEDURE DIVISION.                                              02540000
035144     COPY  MSGCOBO.                                               02550000
035153                                                                  02560000
035154     OPEN INPUT  INPUT-P2.                                        02570000
           DISPLAY 'CATP2CV : INPUT P2 FILE OPENED FOR INPUT '          02580000
                       ' FILE STATUS = ' INPUT-P2-STATUS.               02590000
                                                                        02600000
           IF  INPUT-P2-OKAY                                            02610000
               CONTINUE                                                 02620000
           ELSE                                                         02630000
               MOVE 3001               TO  ABEND-CD                     02640000
               DISPLAY ' '                                              02650000
               DISPLAY 'CATP2CV: U3001 - DD INP2  OPEN ERR, '           02660000
                       ' FILE STATUS = ' INPUT-P2-STATUS                02670000
               CALL  ABEND  USING ABEND-CD                              02680000
           END-IF.                                                      02690000
                                                                        02700000
           OPEN INPUT AUXFILE.                                          02710000
           DISPLAY 'CATP2CV: AUXFILE   OPENED FOR INPUT.  STATUS = '    02720000
                                              AUXFILE-STAT              02730000
           IF  AUXFILE-OKAY                                             02740000
               CONTINUE                                                 02750000
           ELSE                                                         02760000
               DISPLAY 'CATP2CV: ERROR OPENING AUXFILE'                 02770000
               DISPLAY 'CATP2CV: OPEN STATUS = ' AUXFILE-STAT           02780000
               DISPLAY 'CATP2CV: U3001 - ABENDING ON BAD FILE STATUS'   02790000
               MOVE +3003    TO ABEND-CD                                02800000
               CALL ABEND USING ABEND-CD                                02810000
           END-IF.                                                      02820000
                                                                        02830000
035154     OPEN OUTPUT  OUTPUT-P2.                                      02840000
           DISPLAY 'CATP2CV : OUTPUT P2 FILE OPENED FOR INPUT '         02850000
                       ' FILE STATUS = ' OUTPUT-P2-STATUS.              02860000
                                                                        02870000
           IF  OUTPUT-P2-OKAY                                           02880000
               CONTINUE                                                 02890000
           ELSE                                                         02900000
               MOVE 3002                  TO  ABEND-CD                  02910000
               DISPLAY ' '                                              02920000
               DISPLAY 'CATP2CV: U3002 - DD OUTP2  OPEN ERR, '          02930000
                       ' FILE STATUS = ' OUTPUT-P2-STATUS               02940000
               CALL  ABEND  USING ABEND-CD                              02950000
           END-IF.                                                      02960000
                                                                        02970000
           OPEN OUTPUT  OUTPUT-P2CV.                                    02980000
           DISPLAY 'CATP2CV : OUTPUT P2CV FILE OPENED OK '              02990000
                       ' FILE STATUS = ' OUTPUT-P2CV-STATUS.            03000000
                                                                        03010000
           IF  OUTPUT-P2CV-OKAY                                         03020000
               CONTINUE                                                 03030000
           ELSE                                                         03040000
               MOVE 3003                  TO  ABEND-CD                  03050000
               DISPLAY ' '                                              03060000
               DISPLAY 'CATP2CV: U3002 - DD OUTP2CV OPEN ERR, '         03070000
                       ' FILE STATUS = ' OUTPUT-P2CV-STATUS             03080000
               CALL  ABEND  USING ABEND-CD                              03090000
           END-IF.                                                      03100000
                                                                        03110000
           PERFORM 1500-READ-P2-FILE.                                   03120000
035297     PERFORM 1000-PROCESS-INPUT                                   03130000
035298        THRU 1000-PROCESS-INPUT-EXIT                              03140000
035299        UNTIL INPUT-P2-EOF.                                       03150000
035300                                                                  03160000
           MOVE  'REC-CNT='             TO  OUTPUT-P2-RECORD            03170000
           MOVE  OUTPUT-P2-WRITE        TO  P2BKPG-RECS.                03180000
           MOVE  P2BKPG-RECS            TO  OUTPUT-P2-RECORD(9:11).     03190000
           WRITE OUTPUT-P2-RECORD.                                      03200000
                                                                        03210000
           MOVE  'REC-CNT='             TO  OUTPUT-P2CV-RECORD          03220000
           MOVE  OUTPUT-P2CV-WRITE      TO  P2BKPG-RECS.                03230000
           MOVE  P2BKPG-RECS            TO  OUTPUT-P2CV-RECORD(9:11).   03240000
           WRITE OUTPUT-P2CV-RECORD.                                    03250000
                                                                        03260000
035302     CLOSE    INPUT-P2,                                           03270000
035303              OUTPUT-P2                                           03280000
035303              OUTPUT-P2CV.                                        03290000
           CLOSE AUXFILE                                                03300000
           DISPLAY 'CATP2CV: AUXFILE  CLOSED. STATUS = '                03310000
                                             AUXFILE-STAT.              03320000
035304                                                                  03330000
           DISPLAY '   '.                                               03340000
           DISPLAY ' ************************************************'  03350000
           DISPLAY ' ***    INPUT  RECORD COUNT = ' INPUT-P2-READ       03360000
                                                              '    ***' 03370008
                     '  INCL HDR/TRL'.                                  03371008
           DISPLAY ' ***    OUTPUT RECORD COUNT = ' OUTPUT-P2-WRITE     03380000
           DISPLAY ' ***    OUTPUT RECORD CL 210= ' OUTPUT-P2CV-WRITE   03390000
                                                              '    ***'.03400000
           DISPLAY ' ************************************************'  03410000
           DISPLAY ' ******                                   *******'. 03420000
           DISPLAY ' ******  CATP2CV COMPLETED SUCCESSFULLY   *******'. 03430000
           DISPLAY ' ******                                   *******'. 03440000
           DISPLAY ' ************************************************'  03450000
           DISPLAY '   '.                                               03460000
035318     STOP RUN.                                                    03470000
035319/                                                                 03480000
035320 1000-PROCESS-INPUT.                                              03490000
      *** HANDLE EMPTY DATA SET ****                                    03500000
           IF INPUT-P2-EOF AND                                          03510000
              INPUT-P2-READ = +0                                        03520000
              GO TO 1000-PROCESS-INPUT-EXIT                             03530000
           ELSE                                                         03540000
              IF P2-BK-RECORD(1:8) =  'REC-CNT='                        03550000
                 SET INPUT-P2-EOF TO TRUE                               03560000
                 GO TO 1000-PROCESS-INPUT-EXIT                          03570000
              END-IF                                                    03580000
           END-IF.                                                      03590000
                                                                        03600000
      ***** CHECK FIRST RECORD - DATE RECORD WRITE TO BOTH FILES *****  03610006
           IF INPUT-P2-RECORD (1:5) = DATE-FIELD                        03620000
              WRITE OUTPUT-P2-RECORD FROM  INPUT-P2-RECORD              03640000
              WRITE OUTPUT-P2CV-RECORD FROM  INPUT-P2-RECORD            03650000
              PERFORM 1500-READ-P2-FILE                                 03660000
              GO TO 1000-PROCESS-INPUT-EXIT                             03670000
           END-IF.                                                      03680000
                                                                        03690000
           IF P2-BK-BROKER-NBR NOT = '010'                              03691006
              WRITE OUTPUT-P2-RECORD FROM  INPUT-P2-RECORD              03692006
              ADD 1 TO OUTPUT-P2-WRITE                                  03693006
              PERFORM 1500-READ-P2-FILE                                 03694006
              GO TO 1000-PROCESS-INPUT-EXIT                             03695006
           END-IF.                                                      03696006
                                                                        03697006
   ******  READ AUX FILE                                                03700000
                                                                        03710000
           MOVE 0 TO SUB.                                               03720000
           MOVE SPACES TO FD-AUX23-XREF-KEY.                            03730000
           MOVE P2-BK-BR-ACCT-T-C(1:3) TO FD-AUX23-XREF-KEY(2:3)        03740000
           MOVE P2-BK-BR-ACCT-T-C(4:5) TO FD-AUX23-XREF-KEY(8:5)        03750000
           READ AUXFILE.                                                03760000
           ADD 1 TO W-AUXFILE-CNT.                                      03770000
           IF NOT AUXFILE-FOUND                                         03780000
TEST********  DISPLAY 'NOT FOUND AUX KEY=' FD-AUX23-XREF-KEY            03790000
              WRITE OUTPUT-P2-RECORD FROM  INPUT-P2-RECORD              03800000
              ADD 1 TO OUTPUT-P2-WRITE                                  03810000
              PERFORM 1500-READ-P2-FILE                                 03820000
              GO TO 1000-PROCESS-INPUT-EXIT                             03830000
           END-IF.                                                      03840000
           DISPLAY 'FOUND AUX KEY=' FD-AUX23-XREF-KEY                   03850000
                                                                        03860000
      *** AUXFILE-FOUND                                                 03870000
*********  MOVE FD-AUX23-ADP-BRANCH  TO W-BRANCH-CD                     03880000
*********  MOVE FD-AUX23-ADP-ACCOUNT TO W-ACCT-CD                       03890000
                                                                        03900000
           MOVE P2-BK-BR-ACCT-T-C   TO WS-SAVE-BK-BR-ACCT-T-C           03910000
           MOVE P2-BK-BUY-SELL-CODE TO WS-SAVE-BUY-SELL-CODE            03920000
           MOVE P2-BK-RECORD TO WS-P2-BK-RECORD                         03930000
           MOVE '210'        TO WS-P2-BK-BROKER-NBR.                    03940000
           WRITE OUTPUT-P2CV-RECORD FROM WS-P2-BK-RECORD                03950000
           ADD 1 TO OUTPUT-P2CV-WRITE                                   03960000
           MOVE CL210-OMNI-ACCOUNT  TO WS-P2-BK-BR-ACCT-T-C.            03970000
           IF WS-SAVE-BUY-SELL-CODE  =  P2-DEBIT-SIGN                   03980000
              MOVE P2-CREDIT-SIGN   TO WS-P2-BK-BUY-SELL-CODE           03990000
           ELSE                                                         04000000
              MOVE P2-DEBIT-SIGN    TO WS-P2-BK-BUY-SELL-CODE           04010000
           END-IF.                                                      04020000
           ADD 1 TO SUB.                                                04030000
           MOVE WS-P2-BK-RECORD TO WS-CL210-OMNI-REC(SUB).              04040000
                                                                        04050000
           MOVE '010' TO WS-P2-BK-BROKER-NBR.                           04060000
           MOVE CL010-OMNI-ACCOUNT    TO WS-P2-BK-BR-ACCT-T-C.          04070000
           MOVE WS-SAVE-BUY-SELL-CODE TO WS-P2-BK-BUY-SELL-CODE         04080000
           WRITE OUTPUT-P2-RECORD FROM WS-P2-BK-RECORD                  04090000
           ADD 1 TO OUTPUT-P2-WRITE.                                    04100000
                                                                        04110000
           PERFORM 1500-READ-P2-FILE.                                   04120000
           DISPLAY 'ATLOOP' P2-BK-BR-ACCT-T-C ' ' WS-SAVE-BK-BR-ACCT-T-C04130000
             ' ' P2-BKT-HYPHEN                                          04140000
           PERFORM  UNTIL INPUT-P2-EOF                                  04150000
             OR P2-BK-BR-ACCT-T-C NOT = WS-SAVE-BK-BR-ACCT-T-C          04160000
             OR P2-BKT-HYPHEN NOT = '-'                                 04170000
                DISPLAY 'WRITING 210 CUST TRAILER'                      04171000
                MOVE P2-BK-RECORD TO WS-P2-BK-TRAILER-RECORD            04172000
                MOVE '210'        TO WS-P2-BKT-BROKER-NBR               04173000
                WRITE OUTPUT-P2CV-RECORD FROM WS-P2-BK-TRAILER-RECORD   04174000
                ADD 1 TO OUTPUT-P2CV-WRITE                              04175000
                                                                        04176000
                MOVE CL210-OMNI-ACCOUNT  TO  WS-P2-BKT-BR-ACCT-T-C      04177000
                IF WS-SAVE-BUY-SELL-CODE =  P2-DEBIT-SIGN               04178000
                   MOVE P2-CREDIT-SIGN TO WS-P2-BKT-BUY-SELL-CODE       04179000
                ELSE                                                    04180000
                   MOVE P2-DEBIT-SIGN  TO WS-P2-BKT-BUY-SELL-CODE       04190000
                END-IF                                                  04200000
                ADD 1 TO SUB                                            04210000
                MOVE WS-P2-BK-TRAILER-RECORD TO WS-CL210-OMNI-REC(SUB)  04220000
                                                                        04230000
                MOVE '010' TO WS-P2-BKT-BROKER-NBR                      04240000
                MOVE CL010-OMNI-ACCOUNT    TO WS-P2-BKT-BR-ACCT-T-C     04250000
                MOVE WS-SAVE-BUY-SELL-CODE TO WS-P2-BKT-BUY-SELL-CODE   04260000
                WRITE OUTPUT-P2-RECORD FROM WS-P2-BK-TRAILER-RECORD     04270000
                ADD 1 TO OUTPUT-P2-WRITE                                04280000
                                                                        04290000
                PERFORM 1500-READ-P2-FILE                               04300000
           END-PERFORM.                                                 04310000
                                                                        04320000
******** CREATE TRAILER ON OMNI ACCOUNTS                                04330000
           MOVE SPACES TO WS-P2-BK-TRAILER-RECORD.                      04340000
           MOVE WS-P2-BK-TRID         TO WS-P2-BKT-TRID                 04350000
           MOVE '010'                 TO WS-P2-BKT-BROKER-NBR           04360000
           MOVE CL010-OMNI-ACCOUNT    TO WS-P2-BKT-BR-ACCT-T-C.         04370000
           MOVE WS-SAVE-BUY-SELL-CODE TO WS-P2-BKT-BUY-SELL-CODE        04371000
           MOVE WS-P2-BK-SECURITY-NBR TO WS-P2-BKT-SECURITY-NBR         04372000
           MOVE '-'                   TO WS-P2-BKT-HYPHEN               04373000
           MOVE ZEROS                 TO WS-P2-BKT-CURRENCY             04374000
                                         WS-P2-BKT-FRACTION             04375000
           MOVE 'DLVR TO RIDGE '      TO WS-P2-BKT-DESCRIPTION(1:14)    04376002
           MOVE WS-SAVE-BK-BR-ACCT-T-C(1:3)                             04377000
                                      TO WS-P2-BKT-DESCRIPTION(15:3)    04378000
           MOVE '-'                   TO WS-P2-BKT-DESCRIPTION(18:1)    04379000
           MOVE WS-SAVE-BK-BR-ACCT-T-C(4:5)                             04380000
                                      TO WS-P2-BKT-DESCRIPTION(19:5)    04380100
           MOVE '-'                   TO WS-P2-BKT-DESCRIPTION(24:1)    04380200
           MOVE WS-SAVE-BK-BR-ACCT-T-C(9:1)                             04380300
                                      TO WS-P2-BKT-DESCRIPTION(25:1)    04380400
           WRITE OUTPUT-P2-RECORD FROM WS-P2-BK-TRAILER-RECORD          04380500
           ADD 1 TO OUTPUT-P2-WRITE.                                    04380600
                                                                        04380700
           MOVE '210'                 TO WS-P2-BKT-BROKER-NBR           04380800
           MOVE CL210-OMNI-ACCOUNT    TO WS-P2-BKT-BR-ACCT-T-C.         04380900
           IF WS-SAVE-BUY-SELL-CODE  =  P2-DEBIT-SIGN                   04381000
              MOVE P2-CREDIT-SIGN     TO WS-P2-BKT-BUY-SELL-CODE        04382000
           ELSE                                                         04383000
              MOVE P2-DEBIT-SIGN      TO WS-P2-BKT-BUY-SELL-CODE        04384000
           END-IF.                                                      04385000
           ADD 1 TO SUB                                                 04386000
           MOVE 'PAID TO RIDGE '      TO WS-P2-BKT-DESCRIPTION(1:14)    04386102
           MOVE WS-P2-BK-TRAILER-RECORD TO WS-CL210-OMNI-REC(SUB).      04387000
                                                                        04388000
           MOVE SUB TO WS-RECS-LOADED.                                  04389000
           PERFORM VARYING SUB FROM 1 BY 1                              04390000
                 UNTIL SUB > WS-RECS-LOADED                             04400000
              WRITE OUTPUT-P2CV-RECORD FROM WS-CL210-OMNI-REC(SUB)      04401000
              ADD 1 TO OUTPUT-P2CV-WRITE                                04402000
           END-PERFORM.                                                 04403000
                                                                        04404000
       1000-PROCESS-INPUT-EXIT.                                         04405000
           EXIT.                                                        04406000
                                                                        04407000
       1500-READ-P2-FILE.                                               04408000
           READ INPUT-P2                                                04409000
               AT END                                                   04410000
                  DISPLAY ' /// END OF INPUT P2 FILE IS REACHED ///'    04420000
                  SET INPUT-P2-EOF TO TRUE                              04430000
               NOT                                                      04440000
               AT END                                                   04450000
                  ADD 1 TO INPUT-P2-READ                                04460000
                  DISPLAY 'READ ' P2-BK-BR-ACCT-T-C ' ' P2-BKT-HYPHEN   04470000
                   ' REC# ' INPUT-P2-READ                               04480000
           END-READ.                                                    04490000
