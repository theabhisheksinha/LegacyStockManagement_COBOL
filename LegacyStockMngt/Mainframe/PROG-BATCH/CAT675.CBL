000001* PDX    - CAT675   C0352392 03/14/14 07:22:31 TBCHKOP            00001026
      * CSG001 - SSR#79667 CONVERT BOOKKEEPING FILE FROM P2 TO TACT.    00001106
000001* PDX    - CAT675   C0323672 03/12/12 15:07:10 TBLAMUR            00001200
      * LRM003 - SSR#82591 CORRECT ALPHA BRANCH BUG CAUSING A00928 TO   00001300
      *         COME OUT TWICE; CHANGE SR-WS-BRANCH-N TO BRANCH-X.      00001400
000001* PDX    - CAT675   C0210373 11/08/04 09:11:19 TBDOJUN            00001500
      * DJ0002 - SSR#29647 READ DELETED (AGED) ACCTS FILE AND SRMAS     00020000
      *        - 1.READ STOCK RECORD MASTER INSTEAD OF WRAP FILE        00030000
      *        - 2.READ DELETED ACCTS FILE FROM CAT610 AND              00040000
      *        -   CREATE REVERSAL P2 RECORD(TRIM M SPIN O) FOR DELETES 00050000
      *        - 3.REMOVE P2SORT INPUT AND OUTPUT.                      00060000
000001* PDX    - CAT675   C0185922 01/31/03 13:53:24 TBLAMUR            00070000
      * LRM002 - TABLE OVERFLOW BUG ON P2 SORT INPUT                    00080000
000001* PDX    - CAT675   C0158537 06/25/01 16:26:38 TBDOJUN            00090000
      * DJ0001 - SSR#R3848800 MUTUAL FUND RECEIVER ADJUSTMENTS(DELETES) 00100000
      *        - ADD STATUS 240 TO CURSOR                               00110000
000001* PDX    - CAT675   C0149951 02/08/01 16:33:39 TBTIKUO            00120000
000001* PDX    - CAT675   C0131104 09/13/99 13:43:22 TBLAMUR            00130000
000001* PDX    - CAT675   C0125675 07/22/99 16:02:04 TBTIKUO            00140000
000001* PDX    - CAT675   C0121293 02/16/99 18:19:40 TBTIKUO            00150000
       IDENTIFICATION DIVISION.                                         00160000
       PROGRAM-ID. CAT675.                                              00170000
      *---------------------------------------------------------------* 00180000
      *REMARKS.                                                       * 00190000
      *                                                               * 00200000
      *  THIS PROGRAM - CREATES THE P2 RECORD WITH CUSIP # 'A000928'  * 00210000
      *                 FOR STATUS OF EACH TIF THAT'S BEEN CHANGED    * 00220000
      *                 TO '200/210/220/230 ' BY THE END OF THE DAY   * 00230000
      *                 B1 = 434518 (ACATS DELIVERER)                 * 00240000
      *                                                               * 00250000
      * 05/99 - ADD SORTED P2 FILE FOR INPUT, LOAD IT INTO A TABLE,   * 00260000
      *         AND COMPARE ENTRIES TO DATA FETCHED FROM DB2 TABLE    * 00270000
      *         IF THEY ARE EQUAL, DO NOT WRITE P2 RECORD.            * 00280000
      *                                                               * 00290000
      * 09/99 - CHANGED TO CREATE WRAP FILE FOR P2 OUTPUT, TO CORRECT * 00300000
      *         ISSUE WHERE MEMOS GET CREATED EVERY OTHER DAY. THESE  * 00310000
      *         ARE DROPPED WHEN TIF IS NO LONGER ON VTRNFR           * 00320000
      * 11/00 - COBOL LE                                              * 00330000
CSG001* 03/14 - CONVERTING BOOKKEEPING FILE FROM P2 TO TACT           * 00331007
      *---------------------------------------------------------------* 00340000
           EJECT                                                        00350000
       ENVIRONMENT DIVISION.                                            00360000
       INPUT-OUTPUT SECTION.                                            00370000
                                                                        00380000
       FILE-CONTROL.                                                    00390000
                                                                        00400000
DJ0002     SELECT  ACCTDEL             ASSIGN  TO  UT-S-ACCTDEL         00410000
DJ0002                                 FILE STATUS IS ACCTDEL-STAT.     00420000
                                                                        00430000
           SELECT  CAT675-P2-FILE      ASSIGN  TO  P2FILE.              00440000
                                                                        00450000
           EJECT                                                        00460000
      ***************************************************************** 00470000
       DATA DIVISION.                                                   00480000
      ***************************************************************** 00490000
       FILE SECTION.                                                    00500000
                                                                        00510000
DJ0002***INPUT FROM CAT610 LRECL=30                                     00520000
DJ0002 FD  ACCTDEL                                                      00530000
DJ0002     LABEL RECORDS STANDARD                                       00540000
DJ0002     RECORDING MODE IS F                                          00550000
DJ0002     BLOCK CONTAINS 0 RECORDS.                                    00560000
DJ0002 01  ACCTDEL-RECORD.                                              00570000
DJ0002   03  ACCTDEL-REC.                                               00580000
DJ0002     05  ACCTDEL-KEY.                                             00590000
DJ0002         10  ACCTDEL-CLT-NBR       PIC X(04).                     00600000
DJ0002         10  ACCTDEL-BRANCH-NBR    PIC X(03).                     00610000
DJ0002         10  ACCTDEL-ACCT-NBR      PIC X(05).                     00620000
DJ0002     05  ACCTDEL-DATA              PIC X(18).                     00630000
DJ0002   03  ACCTDEL-DATE-REC REDEFINES ACCTDEL-REC.                    00640000
DJ0002     05  ACCTDEL-DATE-KEY          PIC X(12).                     00650000
DJ0002         88  ACCTDEL-DATEREC       VALUE LOW-VALUES.              00660000
DJ0002     05  ACCTDEL-DATE-LIT          PIC X(05).                     00670000
DJ0002         88  ACCTDEL-DATELIT       VALUE 'DATE='.                 00680000
DJ0002     05  ACCTDEL-DATE-CYMD         PIC X(08).                     00690000
DJ0002     05  FILLER                    PIC X(05).                     00700000
DJ0002   03  ACCTDEL-TRLR-REC REDEFINES ACCTDEL-DATE-REC.               00710000
DJ0002     05  ACCTDEL-TRLR-KEY          PIC X(12).                     00720000
DJ0002         88  ACCTDEL-TRLRREC       VALUE HIGH-VALUES.             00730000
DJ0002     05  ACCTDEL-TRLR-LIT          PIC X(06).                     00740000
DJ0002         88  ACCTDEL-TRLRLIT       VALUE 'COUNT='.                00750000
DJ0002     05  ACCTDEL-TRLR-COUNT        PIC 9(11).                     00760000
DJ0002     05  FILLER                    PIC X(01).                     00770000
                                                                        00780000
       FD  CAT675-P2-FILE                                               00790000
           RECORDING MODE IS F                                          00800000
           LABEL RECORDS STANDARD                                       00810000
           BLOCK CONTAINS 0 RECORDS.                                    00820000
       01  P2-RECORD                   PIC X(80).                       00830000
                                                                        00840000
           EJECT                                                        00850000
      ***************************************************************** 00860000
       WORKING-STORAGE  SECTION.                                        00870000
      ***************************************************************** 00880000
DJ0002     COPY PDXIDCOB.                                               00890000
       77  PGM-NAME                         PIC X(06)  VALUE 'CAT675'.  00900000
       77  ACAT-PROC-DATE                   PIC X(06)  VALUE ' '.       00910000
       77  PEND-PROC-DATE                   PIC X(06)  VALUE ' '.       00920000
       77  WS-DATE                          PIC 9(06)  VALUE 0.         00930000
       77  ABEND-CODE-1000      COMP        PIC S9(4)  VALUE +1000.     00940000
       77  ABEND-CODE-2000      COMP        PIC S9(4)  VALUE +2000.     00950000
DJ0002 77  ABEND-CODE-3001      COMP        PIC S9(4)  VALUE +3001.     00960000
DJ0002 77  ABEND-CODE-3005      COMP        PIC S9(4)  VALUE +3005.     00970000
CSG001 77  ABEND-CODE-3060      COMP        PIC S9(4)  VALUE +3060.     00971012
       77  ABEND-CODE-4000      COMP        PIC S9(4)  VALUE +4000.     00980000
       77  ABEND-CODE-4004      COMP        PIC S9(4)  VALUE +4004.     00990000
       77  ABEND-CODE-8000      COMP        PIC S9(4)  VALUE +8000.     01000000
       77  ABEND-CODE-8100      COMP        PIC S9(4)  VALUE +8100.     01010000
       77  ACAT-RECS-CLIENT      COMP       PIC S9(9)  VALUE +0.        01020000
       77  ACAT-RECS-TOTAL       COMP       PIC S9(9)  VALUE +0.        01030000
       77  B1-SUB                           PIC 9(4)    VALUE 0.        01040000
       77  B11-SUB                          PIC 9(4)    VALUE 0.        01050000
       77  B1-TBL-CNT                       PIC 9(4)    VALUE 0.        01060000
       77  B1-SUB1                          PIC 9(4)    VALUE 0.        01070000
       77  B1-SUB1-SVE                      PIC 9(4)    VALUE 0.        01080000
       77  B1-SUB2                          PIC 9(4)    VALUE 0.        01090000
       77  CNTL-SUB                         PIC 9(4)    VALUE 0.        01100000
       77  ACAT-EXTRACT-CLI                 PIC 9(3)    VALUE 0.        01110000
       77  ACAT-CLI-P                       PIC 9(3)    VALUE 0.        01120000
       77  WS-P2-SW                         PIC X      VALUE 'Y'.       01130000
       77  B1-TABLE-SEARCH-STATUS           PIC X(01)  VALUE ' '.       01140000
           88  B1-ENTRY-FOUND                          VALUE 'Y'.       01150000
           88  B1-ENTRY-NOT-FOUND                      VALUE 'N'.       01160000
       77  B1-TABLE-SEARCH-SWITCH           PIC X(01)  VALUE ' '.       01170000
           88  B1-SEARCH-END                           VALUE 'Y'.       01180000
       77  ACAT-FIRST-TIME-SW               PIC X(01)  VALUE 'Y'.       01190000
           88  ACAT-FIRST-TIME                         VALUE 'Y'.       01200000
       77  ACAT-EOF-SW                      PIC X      VALUE ' '.       01210000
           88  ACAT-EOF                                VALUE 'Y'.       01220000
DJ0002 77  END-OF-ACCTDEL-SW                PIC X(01)  VALUE ' '.       01230000
DJ0002     88  END-OF-ACCTDEL                          VALUE 'Y'.       01240000
       77  ACAT-CLI-TOT-SW                  PIC X      VALUE ' '.       01250000
           88  ACAT-CLIENT-TOTAL                       VALUE 'Y'.       01260000
       77  ACAT-VTRNFR-FND-SW               PIC X      VALUE ' '.       01270000
           88  VTRNFR-TIF-FOUND                        VALUE 'Y'.       01280000
           88  VTRNFR-TIF-NTFND                        VALUE 'N'.       01290000
       77  P2SORT-STAT             PIC X(02).                           01300000
           88 P2SORT-OKAY           VALUE '00' THRU '09', '97'.         01310000
           88 P2SORT-EOF            VALUE '10'.                         01320000
           88 P2SORT-EMPTY          VALUE '35'.                         01330000
       77  END-OF-P2SORT-SW         PIC X(01) VALUE 'N'.                01340000
           88  END-OF-P2SORT VALUE 'Y'.                                 01350000
       77  END-OF-P2TABLE-SW        PIC X(01) VALUE 'N'.                01360000
           88  END-OF-P2TABLE       VALUE 'Y'.                          01370000
       77  P2-ACCOUNT-EQUAL-SW      PIC X(01) VALUE 'N'.                01380000
           88  P2-ACCOUNT-EQUAL     VALUE 'Y'.                          01390000
           88  P2-ACCOUNT-NOT-EQUAL  VALUE 'N'.                         01400000
DJ0002 77  ACCTDEL-STAT             PIC X(02).                          01410000
DJ0002     88 ACCTDEL-OKAY           VALUE '00' THRU '09', '97'.        01420000
DJ0002     88 ACCTDEL-EOF            VALUE '10'.                        01430000
DJ0002     88 ACCTDEL-EMPTY          VALUE '35'.                        01440000
                                                                        01450000
       01  WS-COUNTERS.                                                 01460000
           05  P2SORT-CNT               PIC 9(11)  COMP-3  VALUE ZERO.  01470000
           05  SKIP-P2-CNT              PIC 9(11)  COMP-3  VALUE ZERO.  01480000
           05  WS-P2-CNT                PIC 9(11)  COMP-3  VALUE ZERO.  01490000
           05  ACAT-FETCH-RECS          PIC 9(11)  COMP-3  VALUE ZERO.  01500000
           05  ACAT-P2-RECS             PIC 9(11)  COMP-3  VALUE ZERO.  01510000
           05  ACAT-ACPT-RECS           PIC 9(11)  COMP-3  VALUE ZERO.  01520000
           05  ACAT-REJ-RECS            PIC 9(11)  COMP-3  VALUE ZERO.  01530000
DJ0002     05  W-ACCTDEL-READ-CNT       PIC 9(11)  VALUE 0.             01540000
DJ0002     05  W-SRMAS-FND-CNT          PIC 9(11)  VALUE 0.             01550000
DJ0002     05  W-SRMAS-NOTFND-CNT       PIC 9(11)  VALUE 0.             01560000
DJ0002     05  W-SRMAS-DEL-FND-CNT      PIC 9(11)  VALUE 0.             01570000
DJ0002     05  W-SRMAS-DEL-NOTFND-CNT   PIC 9(11)  VALUE 0.             01580000
                                                                        01590000
       01  DATE-FIELDS.                                                 01600000
           05  PROC-DATE.                                               01610000
               10  PD-CC        PIC XX.                                 01620000
               10  PD-YY        PIC XX.                                 01630000
               10  PD-MM        PIC XX.                                 01640000
               10  PD-DD        PIC XX.                                 01650000
           05  WORK-DATE-MMDDYY.                                        01660000
               10  WK-MM        PIC XX.                                 01670000
               10  WK-DD        PIC XX.                                 01680000
               10  WK-YY        PIC XX.                                 01690000
                                                                        01700000
       01  WS-VTRNFR.                                                   01710000
           02  WS-CLIENT-NO        PIC X(04).                           01720000
DJ0002     02  WS-CLIENT-NO-9 REDEFINES                                 01730000
DJ0002         WS-CLIENT-NO        PIC 9(04).                           01740000
           02  WS-BR-ACCT.                                              01750000
               05 WS-BR-CD         PIC X(03).                           01760000
               05 WS-ACCT-CD       PIC X(05).                           01770000
           02  WS-ACAT-CONTROL-NBR PIC X(14).                           01780000
           02  WS-PROCESS-DATE     PIC X(10).                           01790000
                                                                        01800000
       01  SV-VTRNFR.                                                   01810000
           02 SV-CLIENT-NO       PIC 9(04).                             01820000
           02 SV-BR-CD           PIC X(03).                             01830000
           02 SV-ACCT-CD         PIC X(05).                             01840000
                                                                        01850000
DJ0002***FROM CAT610 (FULL TRANSFER ACCOUNTS THAT WERE DELETED FROM     01860000
DJ0002***             HISTORY DATABASE AND HAD A "D" IN N/A ACAT-CD)    01870000
DJ0002***ACCTDEL RECORD LAYOUT LRECL=30                                 01880000
DJ0002 01  W-ACCTDEL-RECORD.                                            01890000
DJ0002   03  W-ACCTDEL-REC.                                             01900000
DJ0002     05  W-ACCTDEL-KEY.                                           01910000
DJ0002         10  W-ACCTDEL-CLT-NBR     PIC X(04).                     01920000
DJ0002         10  W-ACCTDEL-BRANCH-NBR  PIC X(03).                     01930000
DJ0002         10  W-ACCTDEL-ACCT-NBR    PIC X(05).                     01940000
DJ0002     05  W-ACCTDEL-DATA            PIC X(18).                     01950000
DJ0002   03  W-ACCTDEL-DATE-REC REDEFINES W-ACCTDEL-REC.                01960000
DJ0002     05  W-ACCTDEL-DATE-KEY        PIC X(12).                     01970000
DJ0002         88  W-ACCTDEL-DATEREC     VALUE LOW-VALUES.              01980000
DJ0002     05  W-ACCTDEL-DATE-LIT        PIC X(05).                     01990000
DJ0002         88  W-ACCTDEL-DATELIT     VALUE 'DATE='.                 02000000
DJ0002     05  W-ACCTDEL-DATE-CYMD       PIC X(08).                     02010000
DJ0002     05  FILLER                    PIC X(05).                     02020000
DJ0002   03  W-ACCTDEL-TRLR-REC REDEFINES W-ACCTDEL-DATE-REC.           02030000
DJ0002     05  W-ACCTDEL-TRLR-KEY        PIC X(12).                     02040000
DJ0002         88  W-ACCTDEL-TRLRREC     VALUE HIGH-VALUES.             02050000
DJ0002     05  W-ACCTDEL-TRLR-LIT        PIC X(06).                     02060000
DJ0002         88  W-ACCTDEL-TRLRLIT     VALUE 'COUNT='.                02070000
DJ0002     05  W-ACCTDEL-TRLR-COUNT      PIC 9(11).                     02080000
DJ0002     05  FILLER                    PIC X(01).                     02090000
DJ0002***                                                               02100000
      /                                                                 02110000
CSG001***TACT FIELDS                                                    02111004
CSG001 01  WS-TACT-FIELDS.                                              02111121
CSG001     05  WS-P2-TACT-CNT            PIC 9(11)  COMP-3  VALUE ZERO. 02113125
CSG001                                                                  02114004
CSG001 01  WS-AUDIT-SEGMENT-INIT.                                       02115004
CSG001     05  FILLER                    PIC X(02)  VALUE 'R1'.         02116025
CSG001     05  FILLER                    PIC X(08)  VALUE SPACES.       02117025
CSG001     05  FILLER                    PIC 9(04)  VALUE 0.            02118025
CSG001     05  FILLER                    PIC X(02)  VALUE SPACES.       02119025
CSG001     05  FILLER.                                                  02119104
CSG001         10  FILLER                PIC 9(04)  VALUE 0.            02119225
CSG001         10  FILLER                PIC 9(04)  VALUE 0.            02119325
CSG001         10  FILLER                PIC 9(04)  VALUE 0.            02119425
CSG001         10  FILLER                PIC 9(04)  VALUE 0.            02119525
CSG001         10  FILLER                PIC 9(04)  VALUE 0.            02119625
CSG001         10  FILLER                PIC 9(04)  VALUE 0.            02119725
CSG001         10  FILLER                PIC 9(04)  VALUE 0.            02119825
CSG001         10  FILLER                PIC 9(02)  VALUE 0.            02119925
CSG001         10  FILLER                PIC 9(04)  VALUE 0.            02120025
CSG001         10  FILLER                PIC 9(02)  VALUE 0.            02120125
CSG001         10  FILLER                PIC 9(04)  VALUE 0.            02120225
CSG001         10  FILLER                PIC X(15)  VALUE SPACES.       02120325
CSG001         10  FILLER                PIC 9(05)  VALUE 0.            02120425
CSG001     05  FILLER                    PIC X(324) VALUE SPACES.       02120525
CSG001/                                                                 02121304
       01  B1-TABLE-AREA.                                               02122000
           03  B1-TABLE OCCURS 500 TIMES.                               02130000
               05  B1-ADP-CL-NO             PIC 9(03).                  02140000
               05  B1-CL-HIT                PIC X(01).                  02150000
               05  B1-CLI-NAME              PIC X(30).                  02160000
               05  B1-DELIVERY-IND          PIC X.                      02170000
               05  B1-RCD-CNT               PIC S9(9) COMP-3.           02180000
      /                                                                 02190000
       01  P2-REC.                                                      02200000
           02  C-TRID         PIC X     VALUE 'M'.                      02210000
           02  C-BATCH-CD     PIC XX    VALUE 'AC'.                     02220000
           02  C-CLIENT       PIC XXX.                                  02230000
           02  C-BUY-SELL     PIC X.                                    02240000
           02  C-QUANTITY     PIC 9(6)  VALUE 000001.                   02250000
           02  C-SECURITY     PIC X(7)  VALUE 'A000928'.                02260000
           02  FILLER         PIC XX    VALUE SPACES.                   02270000
           02  C-ENTRY        PIC XXX   VALUE 'CAT'.                    02280000
           02  FILLER         PIC X(5)  VALUE SPACES .                  02290000
           02  C-ACCOUNT      PIC X(10).                                02300000
           02  FILLER REDEFINES C-ACCOUNT.                              02310000
               05  FILLER     PIC X(8).                                 02320000
               05  C-TYPE     PIC X(1).                                 02330000
               05  C-CKDIGT   PIC X(1).                                 02340000
           02  C-SPIN         PIC XX    VALUE 'O '.                     02350000
           02  C-AMOUNT       PIC X(10) VALUE SPACES.                   02360000
           02  C-DESCRIP      PIC X(27) VALUE SPACES.                   02370000
           02  FILLER         PIC X     VALUE SPACES.                   02380000
      /                                                                 02390000
       01  SORT-REC.                                                    02400000
           02  S-TRID         PIC X     VALUE 'M'.                      02410000
           02  S-BATCH-CD     PIC XX    VALUE 'AC'.                     02420000
           02  S-CLIENT       PIC XXX.                                  02430000
           02  S-BUY-SELL     PIC X.                                    02440000
           02  S-QUANTITY     PIC X(6)  VALUE '000001'.                 02450000
           02  S-SECURITY     PIC X(7)  VALUE 'A000928'.                02460000
           02  FILLER         PIC XX    VALUE SPACES.                   02470000
           02  S-ENTRY        PIC XXX   VALUE 'CAT'.                    02480000
           02  FILLER         PIC X(5)  VALUE SPACES .                  02490000
           02  S-ACCOUNT      PIC X(10).                                02500000
           02  FILLER REDEFINES S-ACCOUNT.                              02510000
               05  FILLER     PIC X(8).                                 02520000
               05  S-TYPE     PIC X(1).                                 02530000
               05  S-CKDIGT   PIC X(1).                                 02540000
           02  S-SPIN         PIC XX    VALUE 'O '.                     02550000
           02  S-AMOUNT       PIC X(10) VALUE SPACES.                   02560000
           02  S-DESCRIP      PIC X(27) VALUE SPACES.                   02570000
           02  FILLER         PIC X     VALUE SPACES.                   02580000
      /                                                                 02590000
      *** THIS IS A TABLE AREA TO HOLD INPUT SORTED P2 RECORDS *****    02600000
       01  P2-INPUT-AREA.                                               02610000
LRM002     02  P2-INPUT-TABLE  OCCURS 8000 TIMES                        02620000
                                ASCENDING I-CLIENT, I-BR, I-ACCT        02630000
                                INDEXED BY P2-INDEX.                    02640000
               05  I-CLIENT       PIC X(03).                            02650000
               05  I-BR-ACT.                                            02660000
                  07 I-BR         PIC X(03).                            02670000
                  07 I-ACCT       PIC X(05).                            02680000
      /                                                                 02690000
      ******************************************************************02700000
      * DB2 ERROR MESSAGE AREA                                         *02710000
      ******************************************************************02720000
       01  DSNTIAR                       PIC X(008) VALUE 'DSNTIAR'.    02730000
       01  W-DB2-MESSAGE-AREA.                                          02740000
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.    02750000
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES     02760000
                   INDEXED BY W-DB2-IDX.                                02770000
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.     02780000
                                                                        02790000
       01  W-DB2-ERR-MSG-OUT.                                           02800000
           05  FILLER            PIC X(04) VALUE '**  '.                02810000
           05  W-ERR-MSG-OUT     PIC X(50) VALUE SPACE.                 02820000
           05  FILLER            PIC X(12) VALUE '=> SQLCODE: '.        02830000
           05  W-SQLCODE-OUT     PIC -999.                              02840000
                                                                        02850000
LRM002 01  INFSND-DATA.                                                 02860000
LRM002     05 FILLER PIC X(8) VALUE 'CAT675 '.                          02870000
LRM002     05 INFSND-MSG PIC X(45) VALUE SPACES.                        02880000
      /                                                                 02890000
           COPY STUBCPY.                                                02900000
DJ0002     03  ZMSRIO                    PIC X(08) VALUE 'ZMSRIO  '.    02910000
      /                                                                 02920000
DJ0002 01  FILLER                        PIC X(08) VALUE 'GETSR   '.    02930000
DJ0002     COPY GETSR.                                                  02940000
DJ0002     COPY SRMAST.                                                 02950000
      /                                                                 02960000
DJ0002 01  FILLER                        PIC X(08) VALUE 'P2HDRTRL'.    02970000
DJ0002     COPY CP2WS.                                                  02980000
      /                                                                 02990000
           COPY BPDATESC.                                               03000000
      /                                                                 03010000
           COPY BHINFO.                                                 03020000
      /                                                                 03030000
           COPY BHACAT.                                                 03040000
      /                                                                 03050000
CSG001 01  FILLER                        PIC X(10) VALUE 'TACTIO:'.     03051007
CSG001     COPY TACTIOC   REPLACING ==:TACTIO:== BY ==TACTIO==.         03052007
CSG001/                                                                 03053007
CSG001 01  FILLER                        PIC X(10) VALUE 'RECTACT:'.    03054007
CSG001     COPY RECTACT   REPLACING ==:CI:== BY ==TACT==.               03055007
CSG001/                                                                 03056007
           EXEC SQL                                                     03060000
              INCLUDE SQLCA                                             03070000
           END-EXEC.                                                    03080000
      /                                                                 03090000
           EXEC SQL                                                     03100000
              INCLUDE VTRNFR                                            03110000
           END-EXEC.                                                    03120000
      /                                                                 03130000
           EXEC SQL                                                     03140000
             DECLARE  TFRCRSR  CURSOR FOR                               03150000
               SELECT                                                   03160000
                   CLIENT_NBR                                           03170000
                  ,BRANCH_CD                                            03180000
                  ,ACCT_CD                                              03190000
                  ,ACAT_CONTROL_NBR                                     03200000
                  ,PRCS_DT                                              03210000
               FROM                                                     03220000
                   VTRNFR                                               03230000
               WHERE CLIENT_NBR = :WS-CLIENT-NO                         03240000
                 AND DSTBN_SIDE_CD = 'D'                                03250000
DJ0001           AND STTS_CD IN ('200', '210', '220', '230', '240' )    03260000
                 AND DAYS_STTS_QTY = 1                                  03270000
                 AND TRNFR_TYPE_CD = 'FUL'                              03280000
               ORDER BY                                                 03290000
                   CLIENT_NBR                                           03300000
                  ,BRANCH_CD                                            03310000
                  ,ACCT_CD                                              03320000
           END-EXEC.                                                    03330000
      /                                                                 03340000
      ***************************************************************** 03350000
       LINKAGE SECTION.                                                 03360000
      ***************************************************************** 03370000
       01  PARM-AREA.                                                   03380000
           05  PARM-LENGTH                  PIC S9(4) COMP SYNC.        03390000
           05  PARM-INFO.                                               03400000
               10  PARM-STREAM              PIC X.                      03410000
                   88  PARM-STREAM-VALID                VALUES ARE      03420000
                       'A' THRU 'Z' '0' THRU '9'.                       03430000
               10  PARM-ABEND               PIC X.                      03440000
                   88  NO-ABEND                         VALUE 'N'.      03450000
                   88  YES-ABEND                        VALUE 'Y'.      03460000
                                                                        03470000
      /                                                                 03480000
       PROCEDURE DIVISION USING PARM-AREA.                              03490000
       MAINLINE SECTION.                                                03500000
DJ0002     DISPLAY 'CAT675 - CREATE P2 BKPG TRID M SPIN O'              03510000
DJ0002                     ' FOR "A000928" SECURITY NO'.                03520000
           DISPLAY ' '.                                                 03530000
           COPY MSGCOBO.                                                03540000
                                                                        03550000
           DISPLAY ' '.                                                 03560000
                                                                        03570000
           PERFORM  100-HOUSEKEEPING THRU                               03580000
                    100-HOUSEKEEPING-EXIT.                              03590000
                                                                        03600000
           PERFORM  200-INIT-B1-LOOP   THRU                             03610000
                    200-INIT-B1-LOOP-EXIT.                              03620000
                                                                        03630000
           PERFORM  300-GET-ACAT-REC THRU 300-EXIT                      03640000
                    VARYING B1-SUB1 FROM 1 BY 1                         03650000
                      UNTIL B1-SUB1 > B1-TBL-CNT.                       03660000
                                                                        03670000
           PERFORM 400-PROCESS-DELETE-FILE THRU 400-EXIT.               03680000
                                                                        03690000
       0005-ENDJOB.                                                     03700000
                                                                        03710000
           PERFORM 690-P2-TRL-RTN THRU 690-EXIT.                        03720000
                                                                        03730000
CSG001     PERFORM 830-WRITE-TACT-TRAILER  THRU 830-EXIT                03731001
CSG001     DISPLAY 'CAT675: BKPPG TA TRAILER WRITTEN. STATUS = '        03732001
CSG001                                         TACTIO-FILE-STATUS.      03733000
CSG001     PERFORM 840-CLOSE-TACT-FILE     THRU 840-EXIT                03734001
CSG001     DISPLAY ' '                                                  03735000
CSG001                                                                  03736000
           PERFORM  900-ENDJOB-ROUTINE                                  03740000
              THRU  900-ENDJOB-ROUTINE-EXIT.                            03750000
                                                                        03760000
           GOBACK.                                                      03770000
                                                                        03780000
           EJECT                                                        03790000
      ******************                                                03800000
       100-HOUSEKEEPING.                                                03810000
      ******************                                                03820000
                                                                        03830000
           DISPLAY 'CAT675: PARM-STREAM = ' PARM-STREAM                 03840000
           DISPLAY 'CAT675: PARM-ABEND  = ' PARM-ABEND                  03850000
                                                                        03860000
           IF PARM-LENGTH > 0                                           03870000
             CONTINUE                                                   03880000
           ELSE                                                         03890000
             DISPLAY 'PARM LENGTH IS INVALID, LENGTH MUST BE 1 CHAR '   03900000
             DISPLAY 'PARM ENTERED - ' PARM-INFO                        03910000
             DISPLAY 'PROGRAM CAT675 ABENDED '                          03920000
             CALL  ABEND         USING ABEND-CODE-2000.                 03930000
                                                                        03940000
           IF PARM-STREAM-VALID                                         03950000
             CONTINUE                                                   03960000
           ELSE                                                         03970000
             DISPLAY 'PARM INVALID, MUST BE 1 CHAR ALPHANUMERIC'        03980000
             DISPLAY 'PARM ENTERED - ' PARM-INFO                        03990000
             DISPLAY 'PROGRAM CAT675 ABENDED '                          04000000
             CALL  ABEND         USING ABEND-CODE-2000.                 04010000
                                                                        04020000
           IF PARM-ABEND = 'N' OR 'Y'                                   04030000
             CONTINUE                                                   04040000
           ELSE                                                         04050000
             MOVE 'N'    TO PARM-ABEND.                                 04060000
                                                                        04070000
           MOVE  PGM-NAME                TO BPDATES-CALLING-PGM.        04080000
           MOVE  'C'                     TO BPDATES-REQ-TYPE.           04090000
           CALL    BPDATES            USING BPDATES-PARAMETERS.         04100000
                                                                        04110000
           MOVE  BPD-PROC-DATE           TO  PROC-DATE.                 04120000
           MOVE  BPD-PROC-DATE (5:4)     TO  WORK-DATE-MMDDYY (1:4);    04130000
           MOVE  BPD-PROC-DATE (3:2)     TO  WORK-DATE-MMDDYY (5:2);    04140000
                                                                        04150000
           DISPLAY 'CAT675: PROCESS DATE = ' BPD-PROC-DATE.             04160000
                                                                        04170000
DJ0002     OPEN INPUT ACCTDEL.                                          04180000
DJ0002     DISPLAY 'CAT675: '                                           04190000
DJ0002              'ACCTDEL OPENED FOR INPUT; STATUS = '               04200000
DJ0002               ACCTDEL-STAT.                                      04210000
DJ0002     IF ACCTDEL-OKAY                                              04220000
DJ0002        CONTINUE                                                  04230000
DJ0002     ELSE                                                         04240000
DJ0002        DISPLAY 'CAT675: ERROR OPENING ACCTDEL '                  04250000
DJ0002        DISPLAY 'CAT675: OPEN STATUS = ' ACCTDEL-STAT             04260000
DJ0002        DISPLAY 'CAT675: U3001 - ABENDING ON BAD OPEN STATUS'.    04270000
                                                                        04280000
           OPEN OUTPUT CAT675-P2-FILE.                                  04290000
           SET ACAT-FIRST-TIME TO TRUE.                                 04300000
           PERFORM 600-P2-HDR-RTN THRU 600-EXIT.                        04310000
CSG001                                                                  04311000
CSG001***  CALL IO TO OPEN TACT FILE                                    04312000
CSG001***  CALL IO TO CREATE HEADER RECORD                              04313000
CSG001     PERFORM 800-OPEN-TACT-FILE     THRU 800-EXIT                 04315001
CSG001     PERFORM 810-WRITE-TACT-HEADER  THRU 810-EXIT.                04316001
CSG001     DISPLAY 'CAT675: BKPPG TA HEADER WRITTEN.    STATUS = '      04317001
CSG001                                         TACTIO-FILE-STATUS       04318000
           INITIALIZE B1-TABLE-AREA.                                    04320000
           INITIALIZE P2-INPUT-AREA.                                    04330000
           INITIALIZE WS-VTRNFR, SV-VTRNFR.                             04340000
                                                                        04350000
       100-HOUSEKEEPING-EXIT. EXIT.                                     04360000
      /                                                                 04370000
      ***************                                                   04380000
       200-INIT-B1-LOOP.                                                04390000
      ***************                                                   04400000
           DISPLAY ' '.                                                 04410000
           DISPLAY 'CAT675: B1 TABLE VALUES'.                           04420000
           MOVE 0                      TO  B1-TBL-CNT.                  04430000
           ADD  1                      TO  B1-SUB.                      04440000
           PERFORM  UNTIL  B1-SUB  >  500                               04450000
             MOVE  ' '                    TO  BH-BROKER-HEADER-INFO     04460000
             MOVE  B1-SUB                 TO  BH-BROKER-NUMBER-N        04470000
             MOVE  '010'                  TO  BH-LOGICAL-RECORD-CODE    04480000
             MOVE  ' '                    TO  BH-B2-INFO-ID             04490000
             CALL   GETB1V              USING BH-BROKER-HEADER-INFO     04500000
             END-CALL                                                   04510000
             IF  BH-BROKER-ACTIVE                                       04520000
               IF  PARM-STREAM  =  BH-BROKER-MINI-MAXI-INDICATOR        04530000
                   MOVE  ' '                 TO  BH-ACAT-INFO           04540000
                   MOVE  B1-SUB              TO  BH-BROKER-NUMBER-N     04550000
                   MOVE  '015'               TO  BH-LOGICAL-RECORD-CODE 04560000
                   MOVE  '434500'            TO  BH-B2-INFO-ID          04570000
                   CALL   GETB1V           USING BH-BROKER-HEADER-INFO, 04580000
                                                 BH-ACAT-INFO           04590000
                   END-CALL                                             04600000
                 IF  BH-ACAT-ACTIVE                                     04610000
                   IF  BH-ACAT-DELV-SECURITY-POSITION = '1'             04620000
                       ADD 1       TO B1-TBL-CNT                        04630000
                       MOVE  B1-SUB                              TO     04640000
                             B1-ADP-CL-NO               (B1-TBL-CNT)    04650000
                       MOVE BH-BROKER-NAME                       TO     04660000
                             B1-CLI-NAME                (B1-TBL-CNT)    04670000
                       MOVE ZERO                                 TO     04680000
                             B1-RCD-CNT                 (B1-TBL-CNT)    04690000
                       MOVE 'N'                                  TO     04700000
                             B1-CL-HIT                  (B1-TBL-CNT)    04710000
                       MOVE  BH-ACAT-DELV-SECURITY-POSITION      TO     04720000
                             B1-DELIVERY-IND            (B1-TBL-CNT)    04730000
                       DISPLAY 'CAT675:'                                04740000
                               ' CLIENT ' B1-SUB ' B1#434518, ACAT'     04750000
                       ' DELIVER SECURITY POSITION IS '                 04760000
                       BH-ACAT-DELV-SECURITY-POSITION                   04770000
                   END-IF                                               04780000
                  END-IF                                                04790000
                 END-IF                                                 04800000
                END-IF                                                  04810000
             ADD  1                      TO  B1-SUB                     04820000
           END-PERFORM.                                                 04830000
           DISPLAY ' '.                                                 04840000
           IF  B1-TBL-CNT =  0                                          04850000
               DISPLAY  'ZERO STREAM CLIENTS ARE B1-ACAT CLIENTS'       04860000
               DISPLAY  'INPUT ACAT FILE WILL BE BYPASSED'              04870000
           END-IF.                                                      04880000
                                                                        04890000
           DISPLAY  'CAT675: B1 TABLE COUNT - ' B1-TBL-CNT.             04900000
       200-INIT-B1-LOOP-EXIT.   EXIT.                                   04910000
      /                                                                 04920000
       210-READ-B1-TABLE.                                               04930000
           IF B1-SUB1 > B1-TBL-CNT                                      04940000
             MOVE 'Y'  TO  B1-TABLE-SEARCH-SWITCH                       04950000
             GO TO 210-EXIT.                                            04960000
                                                                        04970000
           IF B1-DELIVERY-IND (B1-SUB1) = '1'                           04980000
              MOVE ZERO     TO WS-CLIENT-NO                             04990000
              MOVE B1-ADP-CL-NO (B1-SUB1) TO WS-CLIENT-NO (2:3)         05000000
              MOVE ' '    TO  B1-TABLE-SEARCH-STATUS                    05010000
              MOVE B1-ADP-CL-NO (B1-SUB1) TO ACAT-EXTRACT-CLI           05020000
           END-IF.                                                      05030000
                                                                        05040000
       210-EXIT. EXIT.                                                  05050000
      /                                                                 05060000
       300-GET-ACAT-REC.                                                05070000
           IF ACAT-FIRST-TIME                                           05080000
              MOVE 'N' TO ACAT-FIRST-TIME-SW                            05090000
           END-IF.                                                      05100000
           MOVE 'N' TO B1-TABLE-SEARCH-STATUS.                          05110000
           MOVE ' ' TO B1-TABLE-SEARCH-SWITCH.                          05120000
                                                                        05130000
           PERFORM 210-READ-B1-TABLE THRU 210-EXIT.                     05140000
                                                                        05150000
           PERFORM 310-OPEN-TFRCRSR THRU 310-EXIT.                      05160000
           IF SQLCODE = +0                                              05170000
              INITIALIZE ACAT-EOF-SW                                    05180000
              PERFORM 320-FETCH-ACCT THRU 320-EXIT                      05190000
                     UNTIL ACAT-EOF                                     05200000
              IF ACAT-EOF                                               05210000
                 EXEC SQL CLOSE TFRCRSR END-EXEC                        05220000
              END-IF                                                    05230000
           END-IF.                                                      05240000
                                                                        05250000
       300-EXIT.  EXIT.                                                 05260000
      /                                                                 05270000
       310-OPEN-TFRCRSR.                                                05280000
           EXEC SQL                                                     05290000
              OPEN TFRCRSR                                              05300000
           END-EXEC.                                                    05310000
           IF SQLCODE = 0                                               05320000
              CONTINUE                                                  05330000
           ELSE                                                         05340000
              PERFORM  999-SQL-ERROR THRU 999-EXIT                      05350000
              MOVE 'DB2 CURSOR STATEMENT OPEN ERROR' TO W-ERR-MSG-OUT   05360000
              MOVE SQLCODE TO W-SQLCODE-OUT                             05370000
              DISPLAY ' '                                               05380000
              DISPLAY W-DB2-ERR-MSG-OUT                                 05390000
              DISPLAY '** PROGRAM CAT675 ABENDED '                      05400000
              CALL  ABEND     USING ABEND-CODE-4000.                    05410000
                                                                        05420000
       310-EXIT. EXIT.                                                  05430000
      /                                                                 05440000
       320-FETCH-ACCT.                                                  05450000
                                                                        05460000
           EXEC SQL                                                     05470000
              FETCH                                                     05480000
                 TFRCRSR                                                05490000
              INTO                                                      05500000
                :WS-CLIENT-NO                                           05510000
               ,:WS-BR-CD                                               05520000
               ,:WS-ACCT-CD                                             05530000
               ,:WS-ACAT-CONTROL-NBR                                    05540000
               ,:WS-PROCESS-DATE                                        05550000
           END-EXEC.                                                    05560000
                                                                        05570000
           IF SQLCODE = 0                                               05580000
              ADD 1 TO ACAT-FETCH-RECS                                  05590000
               PERFORM 350-CHECK-ACCT-NO THRU 350-EXIT                  05600000
               GO TO 320-FETCH-ACCT                                     05610000
           ELSE                                                         05620000
           IF SQLCODE = +100                                            05630000
              SET ACAT-EOF   TO TRUE                                    05640000
              IF B1-SUB1 = B1-TBL-CNT                                   05650000
                MOVE 'Y' TO B1-TABLE-SEARCH-SWITCH                      05660000
              END-IF                                                    05670000
           ELSE                                                         05680000
              PERFORM  999-SQL-ERROR THRU 999-EXIT                      05690000
              MOVE 'DB2 CURSOR STATEMENT FETCH ERROR' TO W-ERR-MSG-OUT  05700000
              MOVE SQLCODE TO W-SQLCODE-OUT                             05710000
              DISPLAY ' '                                               05720000
              DISPLAY W-DB2-ERR-MSG-OUT                                 05730000
              DISPLAY '** PROGRAM CAT675 ABENDED **'                    05740000
              CALL  ABEND     USING ABEND-CODE-4004                     05750000
           END-IF END-IF.                                               05760000
                                                                        05770000
       320-EXIT.  EXIT.                                                 05780000
      /                                                                 05790000
       350-CHECK-ACCT-NO.                                               05800000
                                                                        05810000
DJ0002     PERFORM 500-CHECK-SRMAS-FOR-A000928 THRU 500-EXIT.           05820000
DJ0002     IF  GETMSR-SUCCESS                                           05830000
DJ0002         ADD 1 TO W-SRMAS-FND-CNT                                 05840000
DJ0002     ELSE                                                         05850000
DJ0002         IF  GETMSR-NOT-FOUND                                     05860000
DJ0002             ADD 1 TO W-SRMAS-NOTFND-CNT                          05870000
DJ0002         END-IF                                                   05880000
DJ0002     END-IF.                                                      05890000
DJ0002     IF  GETMSR-SUCCESS                                           05900000
DJ0002         ADD 1 TO SKIP-P2-CNT                                     05910000
DJ0002         DISPLAY 'CAT675: SRMAS A000928 FOUND  '                  05920000
DJ0002                     SR-WS-CLIENT                                 05930000
DJ0002                 ' ' SR-WS-BRANCH-X ' ' SR-WS-ACCOUNT-6-10        05940000
DJ0002                   ' P2 NOT CREATED. SKIPPED'                     05950000
DJ0002     ELSE                                                         05960000
DJ0002*****    DISPLAY 'CAT675: SRMAS A000928 NOTFND '                  05970000
DJ0002*****                WS-CLIENT-NO(2:3)                            05980000
DJ0002*****            ' ' WS-BR-CD ' ' WS-ACCT-CD ' P2 CREATED'        05990000
DJ0002         MOVE WS-CLIENT-NO TO SV-CLIENT-NO                        06000000
DJ0002         MOVE WS-BR-CD     TO SV-BR-CD                            06010000
DJ0002         MOVE WS-ACCT-CD   TO SV-ACCT-CD                          06020000
DJ0002         PERFORM 630-WRITE-P2 THRU 630-EXIT                       06030000
CSG001                                                                  06031000
CSG001         PERFORM 700-WRITE-TACT                                   06035005
DJ0002     END-IF.                                                      06040000
                                                                        06050000
       350-EXIT.  EXIT.                                                 06060000
                                                                        06070000
      /                                                                 06080000
DJ0002 400-PROCESS-DELETE-FILE.                                         06090000
DJ0002***READ DELETE FILE, GET SRMAS RECORD FOR A000928.                06100000
DJ0002***IF FOUND, CREATE REVERSE P2 ENTRY TO REMOVE/DELETE FROM HOLDER.06110000
DJ0002     PERFORM 410-READ-DELETE-FILE THRU 410-EXIT                   06120000
DJ0002             UNTIL END-OF-ACCTDEL.                                06130000
DJ0002 400-EXIT.                                                        06140000
DJ0002     EXIT.                                                        06150000
                                                                        06160000
DJ0002 410-READ-DELETE-FILE.                                            06170000
DJ0002                                                                  06180000
DJ0002     PERFORM 420-READ-ACCTDEL-FILE THRU 420-EXIT                  06190000
DJ0002                                                                  06200000
DJ0002     IF NOT END-OF-ACCTDEL                                        06210000
DJ0002                                                                  06220000
DJ0002***-----USE THE FIELDS IN WS-VTRNFR TO READ SRMAS FILE            06230000
DJ0002        MOVE W-ACCTDEL-REC TO WS-VTRNFR                           06240000
DJ0002                                                                  06250000
DJ0002        PERFORM 500-CHECK-SRMAS-FOR-A000928 THRU 500-EXIT         06260000
DJ0002        IF  GETMSR-SUCCESS                                        06270000
DJ0002            ADD 1 TO W-SRMAS-DEL-FND-CNT                          06280000
DJ0002        ELSE                                                      06290000
DJ0002            IF  GETMSR-NOT-FOUND                                  06300000
DJ0002                ADD 1 TO W-SRMAS-DEL-NOTFND-CNT                   06310000
DJ0002            END-IF                                                06320000
DJ0002        END-IF                                                    06330000
DJ0002***-----IF A000928 IS ON SRMAS, CREATE P2 TO DELETE IT            06340000
DJ0002        IF  GETMSR-SUCCESS                                        06350000
DJ0002            PERFORM 650-WRITE-DELETE-P2 THRU 650-EXIT             06360000
DJ0002            DISPLAY 'CAT675: SRMAS A000928 FOUND  '               06370000
DJ0002                     SR-WS-CLIENT                                 06380000
DJ0002                 ' ' SR-WS-BRANCH-X ' ' SR-WS-ACCOUNT-6-10        06390000
DJ0002                   ' DELETE-P2 CREATED'                           06400000
DJ0002                   ' B/S=' C-BUY-SELL                             06410000
CSG001*                  ' QTY='C-QUANTITY                              06420025
CSG001                   ' QTY=' C-QUANTITY                             06420117
CSG001                                                                  06421001
CSG001            PERFORM 710-WRITE-DELETE-TACT                         06424005
DJ0002        ELSE                                                      06430000
DJ0002         DISPLAY 'CAT675: SRMAS A000928 NOTFND '                  06440000
DJ0002                  WS-CLIENT-NO(2:3)                               06450000
DJ0002              ' ' WS-BR-CD ' ' WS-ACCT-CD ' DELETE-P2 NOT CREATED'06460000
DJ0002        END-IF                                                    06470000
DJ0002     END-IF.                                                      06480000
DJ0002                                                                  06490000
DJ0002 410-EXIT.                                                        06500000
DJ0002     EXIT.                                                        06510000
      /                                                                 06520000
DJ0002 420-READ-ACCTDEL-FILE.                                           06530000
DJ0002                                                                  06540000
DJ0002     READ ACCTDEL INTO W-ACCTDEL-REC                              06550000
DJ0002          AT END SET END-OF-ACCTDEL TO TRUE                       06560000
DJ0002     END-READ.                                                    06570000
DJ0002                                                                  06580000
DJ0002     IF NOT END-OF-ACCTDEL                                        06590000
DJ0002        ADD 1 TO W-ACCTDEL-READ-CNT                               06600000
DJ0002        IF  W-ACCTDEL-KEY = LOW-VALUES                            06610000
DJ0002            DISPLAY 'W-ACCTDEL-DATE = ' W-ACCTDEL-DATE-CYMD       06620000
DJ0002            GO TO 420-READ-ACCTDEL-FILE                           06630000
DJ0002        END-IF                                                    06640000
DJ0002        IF  W-ACCTDEL-KEY = HIGH-VALUES                           06650000
DJ0002            DISPLAY 'W-ACCTDEL-TRLR-COUNT = ' W-ACCTDEL-TRLR-COUNT06660000
DJ0002            GO TO 420-READ-ACCTDEL-FILE                           06670000
DJ0002        END-IF                                                    06680000
DJ0002     END-IF.                                                      06690000
DJ0002                                                                  06700000
DJ0002 420-EXIT.                                                        06710000
DJ0002     EXIT.                                                        06720000
      /                                                                 06730000
DJ0002 500-CHECK-SRMAS-FOR-A000928.                                     06740000
DJ0002                                                                  06750000
DJ0002     MOVE 'O'                      TO GETMSR-FORMAT-ID.           06760000
DJ0002     MOVE 'D'                      TO GETMSR-DEVICE-ID.           06770000
DJ0002     MOVE 'V'                      TO GETMSR-FILE-TYPE.           06780000
DJ0002     MOVE 'R'                      TO GETMSR-ACCESS-IND.          06790000
DJ0002     MOVE ' '                      TO GETMSR-RETURN-CODE.         06800000
DJ0002     MOVE LOW-VALUES               TO SR-WS-SEQ.                  06810000
DJ0002     MOVE ZERO                     TO SR-WS-BRANCH                06820000
DJ0002                                      SR-WS-ACCOUNT-10.           06830000
DJ0002     MOVE WS-CLIENT-NO-9           TO SR-WS-CLIENT-N.             06840000
DJ0002     MOVE 'A000928'                TO SR-WS-SEC-NO.               06850000
DJ0002     MOVE WS-BR-CD                 TO SR-WS-BRANCH-X.             06860000
DJ0002     MOVE WS-ACCT-CD               TO SR-WS-ACCOUNT-6-10.         06870000
DJ0002     MOVE '1'                      TO SR-WS-TYPE.                 06880000
DJ0002     MOVE '5'                      TO SR-WS-TRID.                 06890000
DJ0002                                                                  06900000
DJ0002     CALL ZMSRIO             USING GETMSR-CALLING-INFO            06910000
DJ0002                                   SR-WS-RECORD.                  06920000
DJ0002                                                                  06930000
DJ0002 500-EXIT.                                                        06940000
DJ0002     EXIT.                                                        06950000
      /                                                                 06960000
       600-P2-HDR-RTN.                                                  06970000
      *----CREATE A HEADER RECORD FOR BOOKKEEPING FILE.                 06980000
           MOVE 'H'                      TO CP2-REQUEST-CODE.           06990000
           MOVE 'CAT675'                 TO CP2-PROGRAM-ID.             07000000
           MOVE 999                      TO CP2-CLIENT-NUMBER.          07010000
           CALL P2HDTR                   USING CP2-AREA CAT675-P2-FILE  07020000
           MOVE CP2-RETURN-RECORD        TO P2-RECORD.                  07030000
           DISPLAY 'CAT675: HDR-REC = '     P2-RECORD.                  07040000
           WRITE  P2-RECORD.                                            07050000
       600-EXIT.                                                        07060000
           EXIT.                                                        07070000
      /                                                                 07080000
      *----CREATE BOOKKEEPING RECORD TO ADD A000928                     07090000
       630-WRITE-P2.                                                    07100000
           MOVE WS-CLIENT-NO(2:3)    TO C-CLIENT.                       07110000
           MOVE WS-BR-ACCT           TO C-ACCOUNT.                      07120000
           MOVE '1'                  TO C-TYPE.                         07130000
           MOVE 'X'                  TO C-CKDIGT.                       07140000
           MOVE '0'                  TO C-BUY-SELL.                     07150000
           ADD 1 TO WS-P2-CNT.                                          07160000
           WRITE P2-RECORD FROM P2-REC.                                 07170000
                                                                        07180000
       630-EXIT.                                                        07190000
           EXIT.                                                        07200000
      /                                                                 07210000
      *----CREATE BOOKKEEPING RECORD TO REMOVE A000928                  07220000
       650-WRITE-DELETE-P2.                                             07230000
           MOVE WS-CLIENT-NO(2:3)    TO C-CLIENT.                       07240000
           MOVE WS-BR-ACCT           TO C-ACCOUNT.                      07250000
           MOVE '1'                  TO C-TYPE.                         07260000
           MOVE 'X'                  TO C-CKDIGT.                       07270000
           IF  SR-WS-TD-QTY      > 0                                    07280000
               MOVE '-'              TO C-BUY-SELL                      07290000
           ELSE                                                         07300000
               MOVE '0'              TO C-BUY-SELL                      07310000
           END-IF                                                       07320000
           MOVE SR-WS-TD-QTY         TO C-QUANTITY.                     07330000
           ADD 1 TO WS-P2-CNT.                                          07340000
           WRITE P2-RECORD FROM P2-REC.                                 07350000
       650-EXIT.                                                        07360000
           EXIT.                                                        07370000
      /                                                                 07380000
       690-P2-TRL-RTN.                                                  07390000
      *----CREATE A TRAILER RECORD FOR BOOKKEEPING FILE.                07400000
           MOVE 'T'                      TO CP2-REQUEST-CODE.           07410000
           MOVE WS-P2-CNT                TO CP2-RECORD-COUNT.           07420000
           CALL P2HDTR                   USING CP2-AREA CAT675-P2-FILE  07430000
           MOVE CP2-RETURN-RECORD        TO P2-RECORD.                  07440000
           DISPLAY 'CAT675: TRL-REC = '     P2-RECORD.                  07450000
           WRITE  P2-RECORD.                                            07460000
       690-EXIT.                                                        07470000
           EXIT.                                                        07480000
                                                                        07490000
CSG001/                                                                 07491001
CSG001 700-WRITE-TACT.                                                  07492005
CSG001*----CREATE A TACT RECORD FOR BOOKKEEPING FILE.                   07493021
CSG001***  FORMAT FIELDS ON TACT RECORD                                 07499901
CSG001     MOVE SPACES                      TO TACT-RECORD.             07500001
CSG001                                                                  07500101
CSG001*--- SET UP BASE SEGMENT                                          07500201
CSG001     MOVE 'D1'                        TO TACT-D-SEG-ID.           07500301
CSG001     MOVE 'CAT675'                    TO TACT-D-SEG-FOOTPRINT.    07500401
CSG001     MOVE 0700                        TO TACT-D-SEG-LEN.          07500501
CSG001     MOVE WS-CLIENT-NO(2:3)           TO TACT-CLIENT.             07500603
CSG001     MOVE WS-BR-CD                    TO TACT-BRANCH              07500703
CSG001     MOVE WS-ACCT-CD                  TO TACT-ACCOUNT             07500803
CSG001     MOVE '1'                         TO TACT-TYPE                07501003
CSG001     MOVE 'X'                         TO TACT-CHECK-DIGIT         07501103
CSG001     MOVE 'M'                         TO TACT-TRID                07501201
CSG001     MOVE 'MAJ'                       TO TACT-TRANSACTION-TYPE.   07501302
CSG001     MOVE ' D'                        TO TACT-BUY-SELL-CODE       07501402
CSG001     MOVE 000001                      TO TACT-QUANTITY            07501503
CSG001     MOVE 'AC'                        TO TACT-BATCH-CODE          07501601
CSG001     MOVE 'CAT'                       TO TACT-ENTRY-CODE(1:3)     07501702
CSG001     MOVE 'A000928'                   TO TACT-INPUT-SECURITY-ID-NO07503402
CSG001     MOVE 'O '                        TO TACT-MULTI-PURPOSE-SPIN  07503510
CSG001                                         TACT-MISC-ADJ-CODE       07503612
CSG001     MOVE 'CAT675'                    TO TACT-TRANS-SRC-CODE.     07503703
CSG001     MOVE '#@'                        TO TACT-D-DELIMITER         07505602
CSG001                                                                  07510102
CSG001*--- SET UP AUDIT  SEGMENT ('R1')                                 07510304
CSG001     MOVE  WS-AUDIT-SEGMENT-INIT      TO TACT-R-SEGMENT           07510404
CSG001     MOVE 'CAT675'                    TO TACT-R-SEG-FOOTPRINT     07510504
CSG001     MOVE 400                         TO TACT-R-SEG-LEN           07510604
CSG001                                         TACT-AUDIT-CNTL-SEG-LEN  07510704
CSG001     MOVE TACT-D-SEG-LEN              TO TACT-BASE-SEGMENT-LEN    07510804
CSG001     MOVE '#@'                        TO TACT-R-DELIMITER         07511104
CSG001                                                                  07511403
CSG001     ADD 1 TO WS-P2-TACT-CNT                                      07511521
CSG001     PERFORM 820-WRITE-TACT-DETAIL.                               07511709
CSG001                                                                  07511803
CSG001 700-EXIT.                                                        07511903
CSG001     EXIT.                                                        07512003
CSG001/                                                                 07512103
CSG001 710-WRITE-DELETE-TACT.                                           07512205
CSG001*----CREATE A TRAILER RECORD FOR BOOKKEEPING FILE.                07512303
CSG001*    MOVE '710-WRITE-DELETE-TACT            ' TO W-ROUTINE-1.     07512412
CSG001                                                                  07512805
CSG001***  FORMAT FIELDS ON TACT RECORD                                 07512903
CSG001     MOVE SPACES                      TO TACT-RECORD.             07513003
CSG001                                                                  07513103
CSG001*--- SET UP BASE SEGMENT                                          07513203
CSG001     MOVE 'D1'                        TO TACT-D-SEG-ID.           07513303
CSG001     MOVE 'CAT675'                    TO TACT-D-SEG-FOOTPRINT.    07513403
CSG001     MOVE 0700                        TO TACT-D-SEG-LEN.          07513503
CSG001     MOVE 'M'                         TO TACT-TRID                07513603
CSG001     MOVE 'MAJ'                       TO TACT-TRANSACTION-TYPE.   07513703
CSG001                                                                  07513803
CSG001     IF SR-WS-TD-QTY > 0                                          07513905
CSG001        MOVE  ' C'                    TO TACT-BUY-SELL-CODE       07514019
CSG001     ELSE                                                         07514103
CSG001        MOVE  ' D'                    TO TACT-BUY-SELL-CODE       07514219
CSG001     END-IF                                                       07514303
CSG001                                                                  07514403
CSG001     MOVE WS-CLIENT-NO(2:3)           TO TACT-CLIENT.             07514503
CSG001     MOVE 'AC'                        TO TACT-BATCH-CODE          07514603
CSG001     MOVE 'CAT'                       TO TACT-ENTRY-CODE(1:3)     07514703
CSG001     MOVE 'A000928'                   TO TACT-INPUT-SECURITY-ID-NO07514803
CSG001     MOVE 'O '                        TO TACT-MULTI-PURPOSE-SPIN  07514910
CSG001                                         TACT-MISC-ADJ-CODE       07515012
CSG001     MOVE SR-WS-TD-QTY                TO TACT-QUANTITY            07515110
CSG001     MOVE 'CAT675'                    TO TACT-TRANS-SRC-CODE.     07515210
CSG001                                                                  07515310
CSG001     MOVE WS-BR-CD                    TO TACT-BRANCH              07515410
CSG001     MOVE WS-ACCT-CD                  TO TACT-ACCOUNT             07515510
CSG001     MOVE '1'                         TO TACT-TYPE                07515610
CSG001     MOVE 'X'                         TO TACT-CHECK-DIGIT         07518303
CSG001     MOVE '#@'                        TO TACT-D-DELIMITER         07518402
CSG001                                                                  07518504
CSG001*--- SET UP AUDIT  SEGMENT ('R1')                                 07518604
CSG001     MOVE  WS-AUDIT-SEGMENT-INIT      TO TACT-R-SEGMENT           07518704
CSG001     MOVE 'CAT675'                    TO TACT-R-SEG-FOOTPRINT     07518804
CSG001     MOVE 400                         TO TACT-R-SEG-LEN           07518904
CSG001                                         TACT-AUDIT-CNTL-SEG-LEN  07519004
CSG001     MOVE TACT-D-SEG-LEN              TO TACT-BASE-SEGMENT-LEN    07519104
CSG001     MOVE '#@'                        TO TACT-R-DELIMITER         07519204
CSG001                                                                  07519304
CSG001     ADD 1 TO WS-P2-TACT-CNT                                      07523021
CSG001     PERFORM 820-WRITE-TACT-DETAIL.                               07523209
CSG001                                                                  07523302
CSG001 710-EXIT.                                                        07523402
CSG001     EXIT.                                                        07523502
CSG001                                                                  07523602
CSG001                                                                  07523702
CSG001******************************************************************07523802
CSG001* - ALL TACT I/O PARAGRAPHS ARE IN THE 800- SERIES                07523902
CSG001******************************************************************07524002
CSG001*                                                                 07524102
CSG001 800-OPEN-TACT-FILE.                                              07524202
CSG001******************************************************************07524302
CSG001*    -- OPEN OUTPUT TACT FILE                                     07524402
CSG001******************************************************************07524502
CSG001                                                                  07524602
CSG001     INITIALIZE  TACTIO-REQUEST-PARAMETERS.                       07524702
CSG001                                                                  07524802
CSG001     MOVE 'CAT675'                    TO TACTIO-CALLING-PGM-NAME. 07524902
CSG001     SET  TACTIO-OPEN-FILE            TO TRUE.                    07525002
CSG001     SET  TACTIO-OUTPUT-TACT          TO TRUE.                    07525102
CSG001     MOVE 'TACT'                      TO TACTIO-DDNAME.           07525202
CSG001     SET  TACTIO-VAR                  TO TRUE.                    07525302
CSG001     CALL TACTIO  USING TACTIO-REQUEST-PARAMETERS                 07525402
CSG001                        TACT-RECORD.                              07525502
CSG001                                                                  07525602
CSG001     IF  NOT TACTIO-COMP-SUCCESSFUL                               07525702
CSG001         DISPLAY 'OPEN TACT FILE ERROR'                           07525802
CSG001         DISPLAY 'PARA:   800-OPEN-TACT-FILE'                     07525902
CSG001         PERFORM 899-TACTIO-ERROR    THRU 899-EXIT                07526002
CSG001     END-IF.                                                      07526102
CSG001                                                                  07526202
CSG001 800-EXIT.                                                        07526302
CSG001     EXIT.                                                        07526402
CSG001/                                                                 07526502
CSG001 810-WRITE-TACT-HEADER.                                           07526602
CSG001******************************************************************07526702
CSG001*    WRITE TACT FILE HEADER                                       07526802
CSG001******************************************************************07526902
CSG001                                                                  07527002
CSG001     INITIALIZE  TACTIO-REQUEST-PARAMETERS.                       07527102
CSG001                                                                  07527202
CSG001     MOVE 'CAT675'                    TO TACTIO-CALLING-PGM-NAME. 07527302
CSG001     SET  TACTIO-WRITE-HEADER         TO TRUE.                    07527402
CSG001     SET  TACTIO-OUTPUT-TACT          TO TRUE.                    07527502
CSG001     MOVE 'TACT'                      TO TACTIO-DDNAME.           07527602
CSG001     SET  TACTIO-VAR                  TO TRUE.                    07527702
CSG001     CALL TACTIO  USING TACTIO-REQUEST-PARAMETERS                 07527802
CSG001                        TACT-RECORD.                              07527902
CSG001                                                                  07528002
CSG001     IF  NOT TACTIO-COMP-SUCCESSFUL                               07528102
CSG001         DISPLAY 'WRITE TACT HEADER RECORD ERROR'                 07528202
CSG001         DISPLAY 'PARA:   810-WRITE-TACT-HEADER'                  07528302
CSG001         PERFORM 899-TACTIO-ERROR    THRU 899-EXIT                07528402
CSG001     END-IF.                                                      07528502
CSG001                                                                  07528602
CSG001 810-EXIT.                                                        07528702
CSG001     EXIT.                                                        07528802
CSG001/                                                                 07528902
CSG001 820-WRITE-TACT-DETAIL.                                           07529002
CSG001******************************************************************07529102
CSG001*    WRITE TACT DETAIL RECORD                                     07529202
CSG001******************************************************************07529302
CSG001                                                                  07529402
CSG001     INITIALIZE  TACTIO-REQUEST-PARAMETERS.                       07529502
CSG001                                                                  07529602
CSG001     MOVE 'CAT675'                    TO TACTIO-CALLING-PGM-NAME. 07529702
CSG001     SET  TACTIO-WRITE-DETAIL         TO TRUE.                    07529802
CSG001     SET  TACTIO-OUTPUT-TACT          TO TRUE.                    07529902
CSG001     MOVE 'TACT'                      TO TACTIO-DDNAME.           07530002
CSG001     SET  TACTIO-VAR                  TO TRUE.                    07530102
CSG001     CALL TACTIO  USING TACTIO-REQUEST-PARAMETERS                 07530202
CSG001                        TACT-RECORD.                              07530302
CSG001                                                                  07530402
CSG001     IF  NOT TACTIO-COMP-SUCCESSFUL                               07530502
CSG001         DISPLAY 'WRITE TACT DETAIL RECORD ERROR'                 07530602
CSG001         DISPLAY 'PARA:   820-WRITE-TACT-HEADER'                  07530702
CSG001         PERFORM 899-TACTIO-ERROR    THRU 899-EXIT                07530802
CSG001     END-IF.                                                      07530902
CSG001                                                                  07531002
CSG001 820-EXIT.                                                        07531102
CSG001     EXIT.                                                        07531202
CSG001/                                                                 07531302
CSG001 830-WRITE-TACT-TRAILER.                                          07531402
CSG001******************************************************************07531502
CSG001*    WRITE TACT TRAILER                                           07531602
CSG001******************************************************************07531702
CSG001                                                                  07531802
CSG001     INITIALIZE  TACTIO-REQUEST-PARAMETERS.                       07531902
CSG001                                                                  07532002
CSG001     MOVE 'CAT675'                    TO TACTIO-CALLING-PGM-NAME. 07532102
CSG001     SET  TACTIO-WRITE-TRAILER        TO TRUE.                    07532202
CSG001     SET  TACTIO-OUTPUT-TACT          TO TRUE.                    07532302
CSG001     MOVE 'TACT'                      TO TACTIO-DDNAME.           07532402
CSG001     SET  TACTIO-VAR                  TO TRUE.                    07532502
CSG001     CALL TACTIO  USING TACTIO-REQUEST-PARAMETERS                 07532602
CSG001                        TACT-RECORD.                              07532702
CSG001                                                                  07532802
CSG001     IF  NOT TACTIO-COMP-SUCCESSFUL                               07532902
CSG001         DISPLAY 'WRITE TACT TRAILER RECORD ERROR'                07533002
CSG001         DISPLAY 'PARA:   830-WRITE-TACT-TRAILER'                 07533102
CSG001         PERFORM 899-TACTIO-ERROR    THRU 899-EXIT                07533202
CSG001     END-IF.                                                      07533302
CSG001                                                                  07533402
CSG001 830-EXIT.                                                        07533502
CSG001     EXIT.                                                        07533602
CSG001/                                                                 07533702
CSG001 840-CLOSE-TACT-FILE.                                             07533802
CSG001******************************************************************07533902
CSG001*    CLOSE OUTPUT TACT FILE                                       07534002
CSG001******************************************************************07534102
CSG001                                                                  07534202
CSG001     INITIALIZE  TACTIO-REQUEST-PARAMETERS.                       07534302
CSG001                                                                  07534402
CSG001     MOVE 'CAT675'                    TO TACTIO-CALLING-PGM-NAME. 07534502
CSG001     SET  TACTIO-CLOSE-FILE           TO TRUE.                    07534602
CSG001     SET  TACTIO-OUTPUT-TACT          TO TRUE.                    07534702
CSG001     MOVE 'TACT'                      TO TACTIO-DDNAME.           07534802
CSG001     SET  TACTIO-VAR                  TO TRUE.                    07534902
CSG001     CALL TACTIO  USING TACTIO-REQUEST-PARAMETERS                 07535002
CSG001                        TACT-RECORD.                              07535102
CSG001                                                                  07535202
CSG001     IF  NOT TACTIO-COMP-SUCCESSFUL                               07535302
CSG001         DISPLAY 'CLOSE TACT FILE ERROR'                          07535402
CSG001         DISPLAY 'PARA:   840-WRITE-TACT-TRAILER'                 07535502
CSG001         PERFORM 899-TACTIO-ERROR    THRU 899-EXIT                07535602
CSG001     END-IF.                                                      07535702
CSG001                                                                  07535802
CSG001 840-EXIT.                                                        07535902
CSG001     EXIT.                                                        07536002
CSG001/                                                                 07536102
CSG001 899-TACTIO-ERROR.                                                07536202
CSG001******************************************************************07536302
CSG001*    TACT ERROR                                                   07536402
CSG001******************************************************************07536502
CSG001                                                                  07536602
CSG001     DISPLAY '** CAT675: U3060 - BAD TACTIO MODULE RETURN CODE'.  07536712
CSG001     DISPLAY '          DDNAME       = ' TACTIO-DDNAME.           07536802
CSG001     DISPLAY '          FUNCTION     = ' TACTIO-FUNCTION-CODE.    07536902
CSG001     DISPLAY '          FILE-TYPE    = ' TACTIO-FILE-TYPE.        07537002
CSG001     DISPLAY '          RETURN-CODE  = ' TACTIO-RETURN-CODE.      07537102
CSG001     DISPLAY '          FILE-STATUS  = ' TACTIO-FILE-STATUS.      07537202
CSG001     DISPLAY '          ERROR-MESSAGE= ' TACTIO-ERROR-MESSAGE.    07537302
CSG001     DISPLAY ' '.                                                 07537402
CSG001                                                                  07537502
CSG001     CALL  ABEND  USING ABEND-CODE-3060.                          07537714
CSG001                                                                  07537902
CSG001 899-EXIT.                                                        07538002
CSG001     EXIT.                                                        07538102
CSG001/                                                                 07538202
       900-ENDJOB-ROUTINE.                                              07538302
                                                                        07538402
           DISPLAY ' '.                                                 07539000
           CLOSE CAT675-P2-FILE.                                        07540000
                                                                        07550000
DJ0002     CLOSE ACCTDEL.                                               07560000
                                                                        07570000
DJ0002**---CLOSE SRMAS FILE                                             07580000
DJ0002     MOVE 'C'          TO GETMSR-ACCESS-IND.                      07590000
DJ0002     CALL  ZMSRIO      USING GETMSR-CALLING-INFO                  07600000
                                    SR-WS-RECORD.                       07610000
                                                                        07620000
           DISPLAY ' '.                                                 07630000
           DISPLAY '************** CAT675 CONTROL TOTALS *************'.07640000
           DISPLAY 'ACAT TRANSFER FETCHED     ' ACAT-FETCH-RECS         07650000
DJ0002     DISPLAY 'W-SRMAS-FND-CNT           ' W-SRMAS-FND-CNT         07660000
DJ0002             ' P2 NOT CREATED'                                    07670000
DJ0002     DISPLAY 'W-SRMAS-NOTFND-CNT        ' W-SRMAS-NOTFND-CNT      07680000
DJ0002             ' P2 CREATED'                                        07690000
DJ0002     DISPLAY 'W-ACCTDEL-READ-CNT        ' W-ACCTDEL-READ-CNT      07700000
DJ0002     DISPLAY 'W-SRMAS-DEL-FND-CNT       ' W-SRMAS-DEL-FND-CNT     07710000
DJ0002             ' P2 CREATED'                                        07720000
DJ0002     DISPLAY 'W-SRMAS-DEL-NOTFND-CNT    ' W-SRMAS-DEL-NOTFND-CNT  07730000
DJ0002             ' P2 NOT CREATED'                                    07740000
           DISPLAY 'ACAT P2 RECORD WRITTEN    ' WS-P2-CNT.              07750000
CSG001     DISPLAY 'ACAT TA RECORD WRITTEN    ' WS-P2-TACT-CNT.         07751021
           DISPLAY '**************************************************'.07760000
                                                                        07770000
       900-ENDJOB-ROUTINE-EXIT. EXIT.                                   07780000
                                                                        07790000
       999-SQL-ERROR.                                                   07800000
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                  07810000
                                    W-DB2-MESSAGE-LEN.                  07820000
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                        07830000
             UNTIL W-DB2-IDX GREATER THAN 12                            07840000
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES              07850000
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)               07860000
                   END-IF                                               07870000
           END-PERFORM.                                                 07880000
                                                                        07890000
       999-EXIT. EXIT.                                                  07900000
      /                                                                 07910000
*******#################################################################07920000
