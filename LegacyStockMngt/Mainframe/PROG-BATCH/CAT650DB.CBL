000001* PDX    - CAT650DB C0367472 06/11/15 09:45:24 TBLAMUR            00001004
000001* PDX    - CAT650DB C0354267 05/28/14 08:50:15 TBLAMUR            00001102
000001* PDX    - CAT650DB C0339180 04/01/13 15:31:33 TBLAMUR            00001200
000001* PDX    - CAT650DB C0329036 07/23/12 08:40:06 TBLAMUR            00001300
000001* PDX    - CAT650DB C0313692 10/21/11 15:47:51 TBLAMUR            00001400
000001* PDX    - CAT650DB C0315896 08/26/11 09:54:09 TBLAMUR            00001500
000001* PDX    - CAT650DB C0298905 07/09/10 09:06:37 TBLAMUR            00001600
000001* PDX    - CAT650DB C0297925 06/18/10 14:36:50 TBLAMUR            00001700
000001* PDX    - CAT650DB C0294120 03/23/10 14:30:33 TBLAMUR            00001800
000001* PDX    - CAT650DB C0290731 03/14/10 14:43:16 TBLAMUR            00001900
000001* PDX    - CAT650DB C0283838 11/16/09 13:22:20 TBLAMUR            00002000
000001* PDX    - CAT650DB C0282822 06/23/09 15:16:44 TBLAMUR            00002100
000001* PDX    - CAT650DB C0266889 12/06/08 11:01:06 TBLAMUR            00002200
000001* PDX    - CAT650DB C0272055 10/28/08 16:10:35 TBLAMUR            00002300
000001* PDX    - CAT650DB C0271622 10/10/08 15:01:49 TBLAMUR            00002400
000001* PDX    - CAT650DB C0228344 12/29/05 11:20:58 TBLAMUR            00002500
000001* PDX    - CAT650DB C0226392 10/07/05 14:38:04 TBLAMUR            00002600
000001* PDX    - CAT650DB C0222541 08/31/05 14:56:46 TBLAMUR            00002700
000001* PDX    - CAT650DB C0222725 06/28/05 15:55:07 TBLAMUR            00002800
000001* PDX    - CAT650DB C0218221 04/07/05 14:01:42 TBLAMUR            00002900
000001* PDX    - CAT650DB C0203594 01/10/05 09:35:55 TBLAMUR            00003000
000001* PDX    - CAT650DB C0215480 01/05/05 16:54:59 TBLAMUR            00003100
000001* PDX    - CAT650DB C0203594 01/05/05 15:56:16 TBLAMUR            00003200
000001* PDX    - CAT650DB C0210469 11/15/04 09:27:13 TBLAMUR            00003300
000001* PDX    - CAT650DB C0197426 04/14/04 10:35:52 TBLAMUR            00003400
000001* PDX    - CAT650DB C0200589 02/09/04 10:28:04 TBEDTAK            00003500
000001* PDX    - CAT650DB C0199458 01/23/04 10:47:28 TBLAMUR            00003600
000001* PDX    - CAT650DB C0172243 03/11/02 16:16:59 TBLAMUR            00003700
000001* PDX    - CAT650DB C0158537 06/25/01 16:25:31 TBDOJUN            00003800
      * DJ0001 - IF NOT ACATPEND, BYPASS MFC                            00003900
000001* PDX    - CAT650DB C0155938 03/26/01 12:05:48 TBLAMUR            00004000
000001* PDX    - CAT650DB C0155408 03/07/01 12:48:44 TBLAMUR            00004100
000001* PDX    - CAT650DB C0143695 09/06/00 08:14:24 TBLAMUR            00004200
000001* PDX    - CAT650DB C0129778 08/13/99 08:36:37 TBTIKUO            00004300
000001* PDX    - CAT650DB C0127169 07/13/99 17:52:45 TBTIKUO            00004400
000001* PDX    - CAT650DB C0126741 06/14/99 11:16:43 TBTIKUO            00004500
000001* PDX    - CAT650DB C0124431 05/14/99 10:14:46 TBLAMUR            00004600
000001* PDX    - CAT650DB C0123348 03/18/99 12:09:24 TBLAMUR            00004700
000001* PDX    - CAT650DB C0122583 03/05/99 07:48:09 TBLAMUR            00004800
000001* PDX    - CAT650DB C0122288 02/25/99 08:02:33 TBLAMUR            00004900
000001* PDX    - CAT650DB C0122068 02/21/99 09:36:59 TBYOHON            00005000
000001* PDX    - CAT650DB C0121875 02/17/99 18:08:25 TBDOJUN            00005100
000001* PDX    - CAT650DB C0120641 01/27/99 15:10:45 TBYOHON            00005200
000001* PDX    - CAT650DB C0119254 01/20/99 14:08:47 TBELPIN            00005300
000001* PDX    - CAT650DB C0120335 01/13/99 13:38:09 TBELPIN            00005400
000001* PDX    - CAT650DB C0119489 01/08/99 09:14:45 TBLAMUR            00005500
000001* PDX    - CAT650DB C0117772 12/15/98 12:23:35 TBJUCAS            00005600
000001* PDX    - CAT650DB C0119083 12/09/98 09:32:02 TBLAMUR            00005700
000001* PDX    - CAT650DB C0115132 10/21/98 10:21:04 TBLAMUR            00005800
       IDENTIFICATION DIVISION.                                         00005900
       PROGRAM-ID.  CAT650DB.                                           00006000
       AUTHOR.      LARRY MUREY.                                        00007000
       DATE-WRITTEN.  SEPT 1998.                                        00008000
                                                                        00009000
      *---------------------------------------------------------------- 00010000
      * THE PURPOSE OF THIS PROGRAM IS TO EXTRACT PENDING ASSETS FROM   00020000
      * DB2 TABLES ACTIVE TRANSFERS AND ASSETS (VTRNFR AND VASSET).     00030000
      * THIS FILE CONTAINS ASSETS BOOKING TONIGHT (PROCESS DATE = SETTLE00040000
      * DATE + 1) AND ASSETS NEEDED FOR CAGE T3/T4 (PROCESS DATE =      00050000
      * SETTLE DATE + 2). THIS FILE IS READ BY PROGRAM CAT862 TO PRODUCE00060000
      * THESE FEEDS.                                                    00070000
      * THE PROCESS DATE MAY BE OVERRIDDEN BY PARM DATE YYMMDD FORMAT.  00080000
      * THIS IS A NON-UPDATING PROGRAM AND MAY BE RERUN.                00090000
      *---------------------------------------------------------------- 00100000
      * PDX# C0127169 - NTWRK-CNTL-CD MODIFICATION                      00110000
      * (LOOK FOR TCK001)                                               00120000
      * LRM001 - VALUE-FREE-IND                                         00130000
      *---------------------------------------------------------------- 00140000
      * PDX# C0129778 - RETRIEVE STTLM-DT FROM VFNDSRVS, MAKE IT 8 BYES 00150000
      * (TCK002 )       TO FEED THE VALUE-DATE IN CAT650 OF OFFSET ACCT 00160000
      *                 TO THE SURPASS SECURITIES                       00170000
      *---------------------------------------------------------------- 00180000
LRM002* 3/26/01 FORCE OPTIONS FOR CLIENT 12 TO BOOK TO "8" NOT "9"      00190000
LRM002*   ADP SECURITY FOR BOTH RECEIVE AND DELIVERER.                  00200000
LRM003* 3/11/02 USE FREE ASSET LOGIC FOR 50 DDEL REGUADLESS IF BANK.    00210000
LRM004* 12/15/03 SSR 0031094 SHADOW POSTING EXTRACT AND NEW PARM        00220000
ET0001* MARCH 04 SSR 0029825 EXTRACT ACCT TYPE FROM MF DB2 TABLE        00230000
LRM005* 04/14/04 SSR 0036087 BANK HOLIDAY ISSUE.  SELECT PROCESS        00240000
LRM005*    DATE FROM FUND SERV.                                         00250000
LRM007* 08/31/04 SSR 0034535 PASS CAGE TAG NUMBER ON FAIL CLEAN-UPS.    00260000
LRM007* DON'T PASS MFC RECORDS ON CAGE RUN.                             00270000
LRM010* 12/20/04 SSR 0037157 UBS CL 235 (WM) WEALTH MNGT ACCOUNTS:      00280000
LRM010*   CAUSE ADDITIONAL TI WRITES (AS NEEDED) WITH MODIFIED ACCOUNT  00290000
LRM010*   NUMBERS TO BE SORTED LATER AND PROCESSED BY CAT650.           00300000
LRM010*   WM TIFS BE IDENTIFIED BY B1 32977 (WHEN POPULATED).           00310000
LRM010*   THE ACCOUNT NUMBERS USED ON TI (BASED ASSET CATEGORY) WILL    00320000
LRM010*   CORRESPOND TO ASSET TYPES / B1 434692.                        00330000
LRM011* 12/28/04 SSR 0046337 BYPASS ANNUITIES  (SETTLE LOC 60,65)       00340000
LRM012* 03/07/05 SSR 0040448 WM FUNDSERV BOOKING                        00350000
LRM013* 06/20/05 SSR 0041374 ORIG VALUE ON ROLLOVER RCL,FRV             00360000
LRM014* WEALTH MNGT CHANGE, PASS MFC ON CAGE RUN TO CAUSE FAIL CLEANUP  00370000
LRM015* SSR 39800, EXTRACT ASSOC CONTROL NBR                            00380000
LRM016* 11/30/05 SSR 37158 ONGOING, FORCE WM INTO TYPE 1 AND DROP SL=45.00390000
LRM016* QUAL SL 25,50 FOR FEDB AND FEQU OMNI(S).                        00400000
LRM017* 10/10/08 CLIENT 12 HARD CODING NEEDED FOR 224 BOOK OPTION 8...  00410000
LRM018* SSR 60125 RECOMPILE FOR EXPANSION TO ACATPEND AND ADD TI,AT     00420000
LRM018*   COMMENTS TO EXTRACT.                                          00430000
LRM019* SSR 61164 TREAT PTF AS FREE DELIVERY (LIKE BANK) AND FORCE TO   00440000
LRM019*   NEVER CAUSE A FAIL.                                           00450000
LRM020* SSR 64085 CAUSE PTF TO COME OUT ON SHADOW RUN. DO NOT WRITE     00460000
LRM020* AT RECORD WHEN QTY=0 IN SHADOW RUN.                             00470000
ED0002* SSR64624 - CHANGE JOB CAT7500Z (PROG CAT650DB) TO RUN BY STREAM.00480000
ED0002*  ADD ABEND BASED ON ILLOGICAL CONDITION, THAT A S/D ON OR PRIOR 00490000
ED0002*  TO TODAY SHOULD NOT BE FOUND - PROBABLE SCHEDULING BUG CAT712. 00500000
LRM021* SSR 69694 EXTRACT ORIGINAL SETTLE LOCATION ON MFC,FRV FOR CAGE. 00510000
LRM022* SSR 67942 EXTRACT CONTRA PARTICIPANT TYPE ON ASSET              00511000
LRM023* SSR 69017 ADD DATECHECK TO SHADOW POST RUN; VERIFY THE SETTLE   00512000
LRM023*     DATE MUST BE GREATER THAN TODAY.                            00512100
LRM024* SSR 69422 EXTRACT ORIGINAL ASSET AMT FOR FUND RECON REPORT.     00512200
LRM025* SSR 79797 EXTRACT PTF ASSET WITH ZERO QTY ON SHADOW RUN TO      00512300
LRM025*     CAUSE CAT660P TO CONDSIDER CREATING FEED TO MFRS.           00512400
LRM026* SSR 78938 EXTRACT FUNDSERV CNTL NBR TO USE ON P2 TRAILER.       00512500
LRM027* SSR 84763 80728 NEW COL FOR DELIVERING NON U$ POSITIONS.        00512600
LRM028* SSR 90340 EXTR NEW COL FOR ORIGINAL MEMO QTY FOR REVERSALS.     00512700
LRM029* SSR 98211 EXTR TRANSFER IN 240 STATUS ON SHADOW RUN.  THIS WILL 00512800
LRM029*     OCCUR ON DAY BEFORE BANK HOLIDAY, AND CAUSE CAT660P TO      00512900
LRM029*     PASS TO MFRS ON BNWTRAN FILE.                               00513000
LRM030* SSR 95232 TREAT APPROVED MUTUAL FUNDS LIKE A BANK, ASSET AMT=0  00514000
LRM030*    BASED ON B1 434768                                           00515000
      *---------------------------------------------------------------- 00520000
           EJECT                                                        00530000
      ***************************************************************** 00540000
       ENVIRONMENT DIVISION.                                            00550000
      ***************************************************************** 00560000
       INPUT-OUTPUT SECTION.                                            00570000
       FILE-CONTROL.                                                    00571000
                                                                        00572000
           SELECT PENDING-FILE                  ASSIGN  TO  ACATPEND.   00573000
                                                                        00574000
      ***************************************************************** 00575000
       DATA DIVISION.                                                   00576000
      ***************************************************************** 00577000
                                                                        00578000
       FILE SECTION.                                                    00579000
                                                                        00580000
       FD  PENDING-FILE                                                 00590000
           RECORDING MODE IS V                                          00600000
           BLOCK CONTAINS 0 RECORDS.                                    00610000
       COPY ACATPEND  REPLACING ==:FMT:== BY ==PEND==.                  00620000
                                                                        00630000
           EJECT                                                        00640000
      ******************************************************************00650000
       WORKING-STORAGE SECTION.                                         00660000
      ******************************************************************00670000
                                                                        00680000
       77  ABEND-CODE              COMP  PIC S9(4)   VALUE +9999.       00690000
                                                                        00700000
       77  ACAT-PROC-DATE                   PIC X(08)  VALUE ' '.       00710000
                                                                        00720000
       77  WS-TRADE-PLUS-1                  PIC X(08)  VALUE ' '.       00730000
ED0002 77  WS-TODAY-CCYYMMDD-DB2            PIC X(10).                  00740000
LRM007 77  WS-CAGE-MFC-DATE                 PIC X(08)  VALUE ' '.       00750000
                                                                        00760000
       77  WS-DATE                          PIC X(10).                  00770000
       77  WS-DATE-8                        PIC X(08).                  00780000
                                                                        00790000
       77  WS-TOTAL-TI-REC-CNTR  COMP-3  PIC  9(09)  VALUE ZEROES.      00800000
       77  WS-TOTAL-AT-REC-CNTR  COMP-3  PIC  9(09)  VALUE ZEROES.      00810000
       77  WS-TOTAL-OP-REC-CNTR  COMP-3  PIC  9(09)  VALUE ZEROES.      00820000
       77  WS-TOTAL-MF-REC-CNTR  COMP-3  PIC  9(09)  VALUE ZEROES.      00830000
       77  WS-TOTAL-FR-REC-CNTR  COMP-3  PIC  9(09)  VALUE ZEROES.      00840000
TCK001 77  WS-TOTAL-FS-REC-CNTR  COMP-3  PIC  9(09)  VALUE ZEROES.      00850000
       77  WS-TOTAL-OP-NOT-FND   COMP-3  PIC  9(09)  VALUE ZEROES.      00860000
       77  WS-TOTAL-MF-NOT-FND   COMP-3  PIC  9(09)  VALUE ZEROES.      00870000
       77  WS-TOTAL-FR-NOT-FND   COMP-3  PIC  9(09)  VALUE ZEROES.      00880000
TCK001 77  WS-TOTAL-FS-NOT-FND   COMP-3  PIC  9(09)  VALUE ZEROES.      00890000
TCK001 77  WS-TOTAL-VALFRE-CNTR  COMP-3  PIC  9(09)  VALUE ZEROES.      00900000
LRM030 77  WS-TOTAL-APRFND-CNTR  COMP-3  PIC  9(09)  VALUE ZEROES.      00901000
TCK001 77  WS-TOTAL-NTWRK-CNTR   COMP-3  PIC  9(09)  VALUE ZEROES.      00910000
       77  WS-ASSET-QUAN-V9      COMP-3  PIC  9(12)V9(5).               00920000
       77  PENDFILE-REC-CNTR     COMP-3  PIC  9(09)  VALUE ZEROES.      00930000
                                                                        00940000
TCK001 77  WS-MF-NTWRK-CD                PIC  X(01)  VALUE SPACE.       00950000
TCK001 77  WS-FR-NTWRK-CD                PIC  X(01)  VALUE SPACE.       00960000
TCK001 77  WS-FS-NTWRK-CD                PIC  X(01)  VALUE SPACE.       00970000
TCK001 77  WS-B1-NTWRK-CD                PIC  X(01)  VALUE SPACE.       00980000
           COPY STUBCPY.                                                00990000
       01  DATE-WORK-AREA.                                              01000000
           03  DATE-WORK-CC                PIC X(2).                    01010000
           03  DATE-WORK-YYMMDD            PIC X(6).                    01020000
           03  WS-ACAT-STTLM-DATE          PIC X(10).                   01030000
           03  WS-CAGE-STTLM-DATE          PIC X(10).                   01040000
LRM007     03  WS-CAGE-STTLM-MFC           PIC X(10).                   01050000
                                                                        01060000
       01  REQUEST-DATA.                                                01070000
           05  REQ-DATE             PIC X(6).                           01080000
           05  REQ-AREA             PIC X(2).                           01090000
           05  REQ-RC               PIC X(2).                           01100000
                                                                        01110000
           EJECT                                                        01120000
       01  B1-SUB               PIC S9(3) COMP-3 VALUE ZEROS.           01130000
ET0002 01  TBL-CNT              PIC S9(3) COMP-3 VALUE ZEROS.           01140000
ET0002 01  WS-WORK-AREA.                                                01150000
ET0002     05  WS-CLIENT-NBR-9             PIC 9(04).                   01151000
ET0002     05  WS-CLIENT-NBR        REDEFINES WS-CLIENT-NBR-9           01152000
ET0002                                     PIC X(04).                   01153000
       01  B1-TABLE.                                                    01154000
           05  B1-TABLE-ENTRY OCCURS 500 TIMES.                         01155000
               07  B1-MF-NETWRK-CTRL-IND   PIC X.                       01156000
ET0002         07  B1-CLT-NO               PIC 9(04).                   01157000
ET0002         07  B1-CLT-NAME             PIC X(30).                   01158000
ET0002         07  B1-BKR-CLR-NO           PIC X(04).                   01159000
ET0002         07  B1-STREAM               PIC X(01).                   01160000
ET0002         07  B1-STATUS               PIC X(01).                   01170000
ET0002         07  B1-ACAT-STATUS          PIC X(01).                   01180000
LRM030         07  B1-MF-ACCEP-AMT-BKP-BYPAS PIC X(01).                 01181000
                                                                        01190000
           COPY BHINFO.                                                 01200000
                                                                        01210000
           COPY BHACAT.                                                 01220000
                                                                        01230000
           EJECT                                                        01240000
           COPY ACATLOG REPLACING ==:LOG:== BY ==CLOG==.                01250000
                                                                        01260000
           EJECT                                                        01270000
           COPY BPDATESC.                                               01280000
                                                                        01290000
           SKIP3                                                        01300000
           COPY RECDATZC.                                               01310000
                                                                        01320000
LRM010 01  WS-WEALTH-MNGT-WORKAREA.                                     01330000
LRM010     05  WM-SUB                     PIC 9(3) COMP-3 VALUE 0.      01340000
LRM010     05  WM-CUSTOMER-ACCOUNT       PIC X(08) VALUE SPACES.        01350000
LRM010     05  WM-ACCOUNT-SW             PIC X     VALUE 'N'.           01360000
LRM010         88  NOT-WM-ACCOUNT                  VALUE 'N'.           01370000
LRM010         88  WM-ACCOUNT-FND                  VALUE 'Y'.           01380000
LRM010     05  WM-TI-WRITTEN-FLAGS.                                     01390000
LRM010         07  WM-OCC-SW             PIC X     VALUE SPACES.        01400000
LRM010             88 WM-OCC-FOUND                 VALUE 'Y'.           01410000
LRM010             88 WM-OCC-TI-WRITTEN            VALUE 'W'.           01420000
LRM010         07  WM-LOCAL-MKT-SW       PIC X     VALUE SPACES.        01430000
LRM010             88 WM-LOCAL-MKT-FOUND           VALUE 'Y'.           01440000
LRM010             88 WM-LOCAL-MKT-TI-WRITTEN      VALUE 'W'.           01450000
LRM010         07  WM-EUROCLEAR-SW       PIC X     VALUE SPACES.        01460000
LRM010             88 WM-EUROCLEAR-FOUND           VALUE 'Y'.           01470000
LRM010             88 WM-EUROCLEAR-TI-WRITTEN      VALUE 'W'.           01480000
LRM010         07  WM-GOVT-SW            PIC X     VALUE SPACES.        01490000
LRM010             88 WM-GOVT-FOUND                VALUE 'Y'.           01500000
LRM010             88 WM-GOVT-TI-WRITTEN           VALUE 'W'.           01510000
LRM010         07  WM-CASH-SW            PIC X     VALUE SPACES.        01520000
LRM010             88 WM-CASH-FOUND                VALUE 'Y'.           01530000
LRM010             88 WM-CASH-TI-WRITTEN           VALUE 'W'.           01540000
LRM010         07  WM-FUND-SW            PIC X     VALUE SPACES.        01550000
LRM010             88 WM-FUND-FOUND                VALUE 'Y'.           01560000
LRM010             88 WM-FUND-TI-WRITTEN           VALUE 'W'.           01570000
LRM010         07  WM-OTHER-ACCT-SW      PIC X     VALUE SPACES.        01580000
LRM010             88 WM-OTHER-FOUND               VALUE 'Y'.           01590000
LRM010             88 WM-OTHER-TI-WRITTEN          VALUE 'W'.           01600000
LRM010         07  WM-DEFAULT-ACCT-SW    PIC X     VALUE SPACES.        01610000
LRM010             88 WM-DEFAULT-FOUND             VALUE 'Y'.           01620000
LRM010             88 WM-DEFAULT-TI-WRITTEN        VALUE 'W'.           01630000
LRM010     05  WM-OCC-ACCOUNT            PIC X(08) VALUE '        '.    01640000
LRM010     05  WM-LOCAL-MKT-ACCOUNT      PIC X(08) VALUE '        '.    01650000
LRM010     05  WM-GOVT-ACCOUNT           PIC X(08) VALUE '        '.    01660000
LRM010     05  WM-CASH-ACCOUNT           PIC X(08) VALUE '        '.    01670000
LRM010     05  WM-OTHER-ACCOUNT          PIC X(08) VALUE '        '.    01680000
LRM010     05  WM-DEFAULT-ACCOUNT        PIC X(08) VALUE '        '.    01690000
LRM010     05  WM-EUROCLEAR-ACCOUNT      PIC X(08) VALUE '        '.    01700000
LRM010     05  WM-INTER-COMPANY-ACCOUNT  PIC X(08) VALUE '        '.    01710000
                                                                        01720000
       01  DSNTIAR                       PIC X(08)  VALUE 'DSNTIAR'.    01730000
       01  WS-DB2-MESSAGE-AREA.                                         01740000
           05  WS-DB2-MSG-LEN            PIC S9(04) COMP VALUE +960.    01750000
           05  WS-ERROR-MSG              PIC X(80)  OCCURS 12 TIMES     01760000
               INDEXED BY WS-ERROR-INDEX.                               01770000
       01  WS-ERR-LINE-LEN               PIC S9(09) COMP VALUE +80.     01780000
                                                                        01790000
       01  FILLER                      PIC  X(12)     VALUE             01800000
           'FR-PBL-AREA'.                                               01810000
                                                                        01820000
       01  FRP-AREA.                                                    01830000
           05  FRP-ACCT-NBR            PIC  X(20).                      01831000
           05  FRP-ZIP5-CD             PIC  X(05).                      01832000
           05  FRP-ZIP4-CD             PIC  X(04).                      01833000
           05  FRP-ACCT-PYBL-CD        PIC  X(01).                      01834000
           05  FRP-ISIN-CNTRY-CD       PIC  X(02).                      01835000
           05  FRP-ISIN-SEC-ISSUE-CD   PIC  X(09).                      01836000
           05  FRP-ISIN-SEC-CDG-CD     PIC  X(01).                      01837000
           05  FRP-PYBL-ALTNT-CD       PIC  X(01).                      01838000
           05  FRP-PYBL-ALTNT-RSN-TXT  PIC  X(20).                      01839000
           05  FRP-ADDRS-DVDND-IND     PIC  X(01).                      01840000
           05  FRP-ADDRS-SYSWL-IND     PIC  X(01).                      01850000
           05  FRP-ADDRS-ATMDF-IND     PIC  X(01).                      01860000
           05  FRP-CRSS-FND-RNVST-IND  PIC  X(01).                      01870000
           05  FRP-ALTNT-PYBL-IND      PIC  X(01).                      01880000
                                                                        01890000
       01  FRP-PYBL-NA-LINE-TXT        PIC  X(35).                      01900000
                                                                        01910000
       COPY ACATPEND  REPLACING ==:FMT:== BY ==FMT==.                   01920000
           EJECT                                                        01930000
      *DB2 COMMUNICATION AREA                                           01940000
           EXEC SQL                                                     01950000
              INCLUDE SQLCA                                             01960000
           END-EXEC.                                                    01970000
                                                                        01980000
           EJECT                                                        01990000
           EXEC SQL                                                     02000000
              INCLUDE VTRNFR                                            02010000
           END-EXEC.                                                    02020000
                                                                        02030000
           EJECT                                                        02040000
           EXEC SQL                                                     02050000
              INCLUDE VASSET                                            02060000
           END-EXEC.                                                    02070000
                                                                        02080000
           EJECT                                                        02090000
           EXEC SQL                                                     02100000
              INCLUDE VFNDRGST                                          02110000
           END-EXEC.                                                    02120000
                                                                        02130000
           EXEC SQL                                                     02140000
              INCLUDE VFNDSRVS                                          02150000
           END-EXEC.                                                    02160000
                                                                        02170000
           EJECT                                                        02180000
           EXEC SQL                                                     02190000
              INCLUDE VOPTN                                             02200000
           END-EXEC.                                                    02210000
                                                                        02220000
           EXEC SQL                                                     02230000
              INCLUDE VMF                                               02240000
           END-EXEC.                                                    02250000
                                                                        02260000
           EXEC SQL                                                     02270000
              INCLUDE VTRNHSTY                                          02280000
           END-EXEC.                                                    02290000
                                                                        02300000
           EXEC SQL                                                     02301000
              INCLUDE VASTHSTY                                          02302000
           END-EXEC.                                                    02303000
                                                                        02304000
      *DECLARE CURSOR TO OBTAIN ALL TI RECORDS THAT SETTLE TODAY OR     02305000
      *TOMORROW.                                                        02306000
           EXEC SQL                                                     02307000
              DECLARE NSCC_TI_CRSR CURSOR FOR                           02308000
                 SELECT                                                 02309000
                    CLIENT_NBR,                                         02310000
                    ACAT_CONTROL_NBR,                                   02320000
                    RCV_NBR,                                            02330000
                    ACCT_RCV_NBR,                                       02340000
                    DLVR_NBR,                                           02350000
                    ACCT_DLVR_NBR,                                      02360000
                    STTS_CD,                                            02370000
                    DAYS_STTS_QTY,                                      02380000
                    TRNFR_TYPE_CD,                                      02390000
                    DSTBN_SIDE_CD,                                      02400000
                    SBMTG_PRTCP_NBR,                                    02410000
                    RCV_CUST_NM,                                        02420000
                    RCV_SS_PRIM_NBR,                                    02430000
                    RCV_SS_SCNDY_NBR,                                   02440000
                    RCV_ACCT_TYPE_CD,                                   02450000
                    RCV_OCC_BRKR_NBR,                                   02460000
                    RCV_CRSPN_NBR,                                      02470000
                    STTLM_DT,                                           02480000
                    PRCS_DT,                                            02490000
LRM001              PRTCP_CONTRA_CD,                                    02500000
LRM015              ACAT_CNTL_ASTD_NBR,                                 02510000
LRM018              CMNT_TXT                                            02520000
                 FROM VTRNFR                                            02530000
                 WHERE   STTS_CD IN ('300', '310')                      02540000
ET0002               AND CLIENT_NBR = :WS-CLIENT-NBR                    02550000
           END-EXEC.                                                    02560000
                                                                        02570000
      *DECLARE CURSOR TO OBTAIN ALL TI RECORDS THAT ARE IN REVEIW       02580000
      *SETTLE PREP OR SETTLE CLOSE STATUS.                              02590000
           EXEC SQL                                                     02600000
              DECLARE NSCC_TI_MRGN CURSOR FOR                           02610000
                 SELECT                                                 02620000
                    CLIENT_NBR,                                         02630000
                    ACAT_CONTROL_NBR,                                   02640000
                    RCV_NBR,                                            02650000
                    ACCT_RCV_NBR,                                       02660000
                    DLVR_NBR,                                           02670000
                    ACCT_DLVR_NBR,                                      02680000
                    STTS_CD,                                            02690000
                    DAYS_STTS_QTY,                                      02700000
                    TRNFR_TYPE_CD,                                      02710000
                    DSTBN_SIDE_CD,                                      02720000
                    SBMTG_PRTCP_NBR,                                    02730000
                    RCV_CUST_NM,                                        02740000
                    RCV_SS_PRIM_NBR,                                    02750000
                    RCV_SS_SCNDY_NBR,                                   02760000
                    RCV_ACCT_TYPE_CD,                                   02770000
                    RCV_OCC_BRKR_NBR,                                   02780000
                    RCV_CRSPN_NBR,                                      02790000
                    STTLM_DT,                                           02800000
                    PRCS_DT,                                            02810000
                    PRTCP_CONTRA_CD,                                    02820000
LRM015              ACAT_CNTL_ASTD_NBR,                                 02830000
LRM018              CMNT_TXT                                            02840000
                 FROM VTRNFR                                            02850000
LRM029           WHERE                                                  02860003
LRM031            STTS_CD IN ('200', '210', '230', '240', '300', '310') 02861003
ET0002               AND CLIENT_NBR = :WS-CLIENT-NBR                    02870000
           END-EXEC.                                                    02880000
                                                                        02890000
      * DECLARE CURSOR TO OBTAIN ALL AT RECORDS FOR THIS CONTROL NBR    02900000
           EXEC SQL                                                     02910000
              DECLARE NSCC_AT1_CRSR CURSOR FOR                          02920000
                 SELECT                                                 02921000
                    CLIENT_NBR,                                         02922000
                    ACAT_CONTROL_NBR,                                   02923000
                    ASSET_SEQ_NBR,                                      02924000
                    TRANS_TYPE_CD,                                      02925000
                    SBMTG_PRTCP_NBR,                                    02926000
                    TRANS_RFRN_ID_CD,                                   02927000
                    ASSET_PRC_CTGY_CD,                                  02928000
                    OPTN_CTGY_CD,                                       02929000
                    STTLM_LCTN_CD,                                      02930000
                    STTLM_RSN_CD,                                       02940000
                    ISIN_CNTRY_CD,                                      02950000
                    ISIN_SEC_ISSUE_CD,                                  02960000
                    ISIN_SEC_CDG_CD,                                    02970000
                    ASSET_DESC_TXT,                                     02980000
                    ASSET_RQST_QTY_CD,                                  02990000
                    AST_RQST_TRANS_CD,                                  03000000
                    ASSET_QTY,                                          03010000
                    ASSET_PCT,                                          03020000
                    PSTN_CD,                                            03030000
                    ISO_CRNCY_CD,                                       03040000
                    ASSET_AMT,                                          03050000
TCK001              ASSET_AMT_STTS_CD,                                  03060000
                    BEARER_BOND_CD,                                     03070000
                    CSH_MGN_SHRT_CD,                                    03080000
                    WHI_CD,                                             03090000
                    TRNFR_TYPE_RSN_CD,                                  03100000
                    MBS_SERIAL_NBR,                                     03110000
                    ASSET_CMNT_TXT,                                     03120000
                    NSCC_PEND_CD,                                       03130000
                    SECURITY_ADP_NBR,                                   03140000
LRM007              CAGE_TAG_NBR,                                       03150000
LRM013              SCRTY_866_NBR,                                      03160000
LRM013              ASSET_866_QTY,                                      03170000
LRM027              CRNCY_CD,                                           03171000
LRM028              MEMO_ORG_RVRSL_QTY                                  03172000
                 FROM VASSET                                            03180000
                 WHERE CLIENT_NBR   = :DCLVTRNFR.CLIENT-NBR             03190000
                  AND  ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CONTROL-NBR   03200000
LRM011            AND NOT STTLM_LCTN_CD = '60'                          03210000
LRM011            AND NOT STTLM_LCTN_CD = '65'                          03220000
           END-EXEC.                                                    03230000
                                                                        03240000
                                                                        03250000
      * DECLARE CURSOR TO OBTAIN ALL FR RECORDS                         03260000
           EXEC SQL                                                     03270000
              DECLARE NSCC_FR_CRSR CURSOR FOR                           03280000
              SELECT                                                    03290000
                 CLIENT_NBR,                                            03300000
                 ACAT_CONTROL_NBR,                                      03310000
                 TRNFR_TYPE_CD,                                         03320000
                 SBMTG_PRTCP_NBR,                                       03330000
                 DLVR_NBR,                                              03340000
                 ASSET_SEQ_NBR,                                         03350000
                 ISIN_CNTRY_CD,                                         03360000
                 ISIN_SEC_ISSUE_CD,                                     03370000
                 ISIN_SEC_CDG_CD,                                       03380000
                 MF_TRANS_TYPE_CD,                                      03390000
                 FRCTN_CD,                                              03400000
                 NRA_TAX_PCT,                                           03410000
                 DSBMT_ACCRL_CD,                                        03420000
                 DSBMT_FRCTN_CSH_CD,                                    03430000
                 DSBMT_RSDL_CD,                                         03440000
                 BK_PHSCL_SHR_CD,                                       03450000
                 DLRVY_CD,                                              03460000
                 TPA_NBR,                                               03470000
                 CUST_NM,                                               03480000
                 FUND_ACCT_CD,                                          03490000
                 FNBR,                                                  03500000
                 BRKR_EXCTG_NBR,                                        03510000
                 NTWRK_CNTL_CD,                                         03520000
                 SS_TIN_CD,                                             03530000
                 SS_TIN_NBR,                                            03540000
                 LTCG_CD,                                               03550000
                 STCG_CD,                                               03560000
                 DVDND_CD,                                              03570000
                 WTHLD_CD,                                              03580000
                 PYBL_INFO_CD,                                          03590000
                 ZIP5_CD,                                               03600000
                 ZIP4_CD,                                               03610000
                 SOC_CD,                                                03620000
                 NAV_ACCT_IND,                                          03630000
                 MRGN_ACCT_IND,                                         03640000
                 CHCK_WRTNG_IND,                                        03650000
                 SL_ST_CD,                                              03660000
                 CNTRY_ORGN_CD,                                         03670000
                 ACCT_RR_NM,                                            03680000
                 ACCT_RR_CD,                                            03690000
                 BRCH_NBR,                                              03700000
                 PYBL_QTY,                                              03710000
                 MEMO_TXT,                                              03720000
                 ACH_IND,                                               03730000
                 PAC_IND,                                               03740000
                 SWP_IND,                                               03750000
                 ROA_LOI_AMT,                                           03760000
                 LOI_DT,                                                03770000
                 TRD_RLTD_IND,                                          03780000
                 ACCT_RLTD_NBR,                                         03790000
                 ACCT_RLTD_CD,                                          03800000
                 SWP_PAC_EFFCT_DT,                                      03810000
                 CDSC_PYMNT_CD,                                         03820000
                 DSBMT_OPTN_CD,                                         03830000
                 DSBMT_AMT,                                             03840000
                 PYMNT_JAN_IND,                                         03850000
                 PYMNT_FEB_IND,                                         03860000
                 PYMNT_MAR_IND,                                         03870000
                 PYMNT_APR_IND,                                         03880000
                 PYMNT_MAY_IND,                                         03890000
                 PYMNT_JUN_IND,                                         03900000
                 PYMNT_JUL_IND,                                         03910000
                 PYMNT_AUG_IND,                                         03920000
                 PYMNT_SEP_IND,                                         03930000
                 PYMNT_OCT_IND,                                         03940000
                 PYMNT_NOV_IND,                                         03950000
                 PYMNT_DEC_IND,                                         03960000
                 PYMNT_DT_CD,                                           03970000
                 RTRMT_TAX_CD,                                          03980000
                 SHRHR_BNK_ACCT_NBR,                                    03990000
                 SHRHR_BNK_TYPE_CD,                                     04000000
                 CHCK_FRST_DT,                                          04010000
                 ABA_ROUTING_NBR,                                       04020000
                 COST_BSS_CD,                                           04030000
                 NSCC_PEND_CD                                           04040000
              FROM VFNDRGST                                             04050000
              WHERE CLIENT_NBR   =  :DCLVTRNFR.CLIENT-NBR               04060000
                  AND  ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CONTROL-NBR   04070000
           END-EXEC.                                                    04080000
                                                                        04090000
           EJECT                                                        04100000
      ******************************************************************04110000
       LINKAGE SECTION.                                                 04120000
      ******************************************************************04130000
                                                                        04140000
       01  PARM-AREA.                                                   04150000
           05  PARM-LENGTH              PIC  S9(4) COMP.                04160000
ET0002**       88  PARM-LENGTH-VALID                    VALUE +08.      04170000
ET0002         88  PARM-LENGTH-VALID                    VALUE +09.      04180000
           05  PARM-INFO.                                               04190000
               10  PARM-ACAT-DATE           PIC X(06).                  04200000
                   88  PARM-ACAT-SPACE              VALUE SPACES.       04210000
                   88  PARM-ACAT-CAGE               VALUE 'ACATCA'.     04220000
                   88  PARM-ACAT-MARGIN             VALUE 'ACATMR'.     04230000
                   88  PARM-ACAT-PEND               VALUE 'ACATPE'.     04240000
LRM004             88  PARM-ACAT-SHADOW             VALUE 'ACATSH'.     04250000
LRM031             88  PARM-ACAT-FUNDSERV           VALUE 'ACATFN'.     04251001
               10  FILLER                   PIC X(2).                   04260000
ET0002     05  PARM-STREAM                  PIC X(1).                   04270000
                                                                        04280000
           EJECT                                                        04290000
      ***************************************************************** 04300000
       PROCEDURE DIVISION USING PARM-AREA.                              04310000
      ***************************************************************** 04320000
           DISPLAY 'CAT650DB - EXTRACT PENDING ASSETS'.                 04330000
           DISPLAY ' '.                                                 04340000
           COPY MSGCOBO.                                                04350000
                                                                        04360000
ET0002     IF PARM-LENGTH-VALID                                         04370000
ET0002        DISPLAY 'CAT650DB - PROCESSING "' PARM-STREAM '" STREAM'  04371000
ET0002     ELSE                                                         04371100
ET0002        DISPLAY '** CAT650DB ABEND - MISSING PARM'                04371200
ET0002        MOVE 0015 TO ABEND-CODE                                   04371300
ET0002        CALL  ABEND              USING ABEND-CODE                 04371400
ET0002     END-IF.                                                      04371500
           PERFORM INITIAL-ROUTINE.                                     04371600
                                                                        04371700
ET0002     IF PARM-ACAT-MARGIN                                          04371800
ET0002        DISPLAY 'SPECIAL MARGIN RUN'                              04371900
ET0002     ELSE                                                         04372000
ET0002     IF PARM-ACAT-SHADOW                                          04373000
ET0002        DISPLAY 'SPECIAL SHADOW RUN'                              04374000
ET0002     END-IF.                                                      04375000
ET0002                                                                  04376000
ET0002**   PERFORM PROCESS-ROUTINE.                                     04377000
ET0002     PERFORM PROCESS-ROUTINE                                      04378000
ET0002         VARYING B1-SUB FROM 1 BY 1                               04379000
ET0002                 UNTIL B1-SUB > TBL-CNT.                          04380000
                                                                        04390000
           PERFORM ENDJOB-ROUTINE.                                      04400000
                                                                        04410000
           GOBACK.                                                      04420000
                                                                        04430000
           EJECT                                                        04440000
       PROCESS-ROUTINE.                                                 04450000
ET0002     MOVE B1-CLT-NO (B1-SUB) TO WS-CLIENT-NBR-9.                  04460000
                                                                        04470000
           IF PARM-ACAT-MARGIN                                          04480000
ET0002**      DISPLAY 'SPECIAL MARGIN RUN'                              04490000
              EXEC SQL OPEN NSCC_TI_MRGN END-EXEC                       04500000
           ELSE                                                         04510000
LRM004     IF PARM-ACAT-SHADOW                                          04520000
ET0002**      DISPLAY 'SPECIAL SHADOW RUN'                              04530000
LRM004        EXEC SQL OPEN NSCC_TI_MRGN END-EXEC                       04540000
LRM004     ELSE                                                         04550000
LRM031     IF PARM-ACAT-FUNDSERV                                        04551001
LRM031        DISPLAY 'SPECIAL FUNDSERV RUN'                            04552000
LRM031        EXEC SQL OPEN NSCC_TI_MRGN END-EXEC                       04553000
LRM004     ELSE                                                         04554000
              EXEC SQL OPEN NSCC_TI_CRSR END-EXEC                       04560000
           END-IF.                                                      04570000
           IF SQLCODE NOT = +0                                          04580000
              MOVE 2400 TO ABEND-CODE                                   04590000
              PERFORM SQL-ERROR-ROUTINE                                 04600000
           END-IF.                                                      04610000
                                                                        04620000
           PERFORM UNTIL SQLCODE NOT = +0                               04630000
              IF PARM-ACAT-MARGIN                                       04640000
LRM004        OR PARM-ACAT-SHADOW                                       04650000
LRM031        OR PARM-ACAT-FUNDSERV                                     04651001
                EXEC SQL                                                04660000
                 FETCH NSCC_TI_MRGN                                     04670000
                    INTO                                                04680000
                     :DCLVTRNFR.CLIENT-NBR                              04690000
                    ,:DCLVTRNFR.ACAT-CONTROL-NBR                        04700000
                    ,:DCLVTRNFR.RCV-NBR                                 04710000
                    ,:DCLVTRNFR.ACCT-RCV-NBR                            04720000
                    ,:DCLVTRNFR.DLVR-NBR                                04730000
                    ,:DCLVTRNFR.ACCT-DLVR-NBR                           04740000
                    ,:DCLVTRNFR.STTS-CD                                 04750000
                    ,:DCLVTRNFR.DAYS-STTS-QTY                           04760000
                    ,:DCLVTRNFR.TRNFR-TYPE-CD                           04770000
                    ,:DCLVTRNFR.DSTBN-SIDE-CD                           04780000
                    ,:DCLVTRNFR.SBMTG-PRTCP-NBR                         04790000
                    ,:DCLVTRNFR.RCV-CUST-NM                             04800000
                    ,:DCLVTRNFR.RCV-SS-PRIM-NBR                         04810000
                    ,:DCLVTRNFR.RCV-SS-SCNDY-NBR                        04820000
                    ,:DCLVTRNFR.RCV-ACCT-TYPE-CD                        04830000
                    ,:DCLVTRNFR.RCV-OCC-BRKR-NBR                        04840000
                    ,:DCLVTRNFR.RCV-CRSPN-NBR                           04850000
                    ,:DCLVTRNFR.STTLM-DT                                04860000
                    ,:DCLVTRNFR.PRCS-DT                                 04870000
LRM001              ,:DCLVTRNFR.PRTCP-CONTRA-CD                         04880000
LRM015              ,:DCLVTRNFR.ACAT-CNTL-ASTD-NBR                      04890000
LRM018              ,:DCLVTRNFR.CMNT-TXT                                04900000
                END-EXEC                                                04910000
            ELSE                                                        04920000
                EXEC SQL                                                04930000
                 FETCH NSCC_TI_CRSR                                     04940000
                    INTO                                                04950000
                     :DCLVTRNFR.CLIENT-NBR                              04960000
                    ,:DCLVTRNFR.ACAT-CONTROL-NBR                        04970000
                    ,:DCLVTRNFR.RCV-NBR                                 04980000
                    ,:DCLVTRNFR.ACCT-RCV-NBR                            04990000
                    ,:DCLVTRNFR.DLVR-NBR                                05000000
                    ,:DCLVTRNFR.ACCT-DLVR-NBR                           05010000
                    ,:DCLVTRNFR.STTS-CD                                 05020000
                    ,:DCLVTRNFR.DAYS-STTS-QTY                           05030000
                    ,:DCLVTRNFR.TRNFR-TYPE-CD                           05040000
                    ,:DCLVTRNFR.DSTBN-SIDE-CD                           05050000
                    ,:DCLVTRNFR.SBMTG-PRTCP-NBR                         05060000
                    ,:DCLVTRNFR.RCV-CUST-NM                             05070000
                    ,:DCLVTRNFR.RCV-SS-PRIM-NBR                         05080000
                    ,:DCLVTRNFR.RCV-SS-SCNDY-NBR                        05090000
                    ,:DCLVTRNFR.RCV-ACCT-TYPE-CD                        05100000
                    ,:DCLVTRNFR.RCV-OCC-BRKR-NBR                        05110000
                    ,:DCLVTRNFR.RCV-CRSPN-NBR                           05120000
                    ,:DCLVTRNFR.STTLM-DT                                05130000
                    ,:DCLVTRNFR.PRCS-DT                                 05140000
LRM001              ,:DCLVTRNFR.PRTCP-CONTRA-CD                         05150000
LRM015              ,:DCLVTRNFR.ACAT-CNTL-ASTD-NBR                      05160000
LRM018              ,:DCLVTRNFR.CMNT-TXT                                05170000
                END-EXEC                                                05180000
              END-IF                                                    05190000
                                                                        05200000
              EVALUATE SQLCODE                                          05210000
                 WHEN +100                                              05220000
                    CONTINUE                                            05230000
                 WHEN +0                                                05240000
LRM010              MOVE SPACES TO WM-TI-WRITTEN-FLAGS                  05250000
LRM007              IF (TRNFR-TYPE-CD OF DCLVTRNFR = 'MFC' OR 'FRV')    05260000
LRM014               OR (TRNFR-TYPE-CD OF DCLVTRNFR = 'MFC'             05270000
LRM014                    AND CLIENT-NBR OF DCLVTRNFR = '1235' )        05280000
LRM007              AND PARM-ACAT-CAGE                                  05290000
LRM007              AND STTLM-DT OF DCLVTRNFR = WS-CAGE-STTLM-MFC       05300000
LRM007                  ADD 1 TO WS-TOTAL-TI-REC-CNTR                   05310000
LRM007                  PERFORM WRITE-TI-RECORD-RTN                     05320000
LRM007                  PERFORM FETCH-AT-RECORDS                        05330000
LRM007              ELSE                                                05340000
DJ0001              IF (TRNFR-TYPE-CD OF DCLVTRNFR = 'FRV')             05350000
DJ0001              AND (NOT PARM-ACAT-PEND)                            05360000
DJ0001                  CONTINUE                                        05370000
LRM020              ELSE                                                05370100
LRM020              IF (TRNFR-TYPE-CD OF DCLVTRNFR = 'PTF')             05390000
LRM020              AND (NOT PARM-ACAT-PEND AND NOT PARM-ACAT-SHADOW    05400001
LRM031                                      AND NOT PARM-ACAT-FUNDSERV) 05401001
LRM020                  CONTINUE                                        05410000
DJ0001              ELSE                                                05420000
                        ADD 1 TO WS-TOTAL-TI-REC-CNTR                   05430000
LRM010                  IF CLIENT-NBR OF DCLVTRNFR = '1235'             05440000
LRM010                     SET WM-ACCOUNT-FND TO TRUE                   05450000
LRM010                  ELSE                                            05460000
LRM010                     SET NOT-WM-ACCOUNT TO TRUE                   05470000
                           PERFORM WRITE-TI-RECORD-RTN                  05480000
LRM010                  END-IF                                          05490000
                        PERFORM FETCH-AT-RECORDS                        05500000
DJ0001              END-IF                                              05510000
LRM007              END-IF                                              05520000
LRM020              END-IF                                              05530000
                 WHEN OTHER                                             05540000
                    MOVE 2500 TO ABEND-CODE                             05550000
                    PERFORM SQL-ERROR-ROUTINE                           05560000
              END-EVALUATE                                              05570000
           END-PERFORM.                                                 05580000
                                                                        05590000
           IF SQLCODE NOT = +100                                        05600000
              MOVE 2800 TO ABEND-CODE                                   05610000
              PERFORM SQL-ERROR-ROUTINE                                 05620000
           END-IF                                                       05630000
                                                                        05640000
           IF PARM-ACAT-MARGIN                                          05650000
LRM004     OR PARM-ACAT-SHADOW                                          05660000
LRM031     OR PARM-ACAT-FUNDSERV                                        05661001
              EXEC SQL                                                  05670000
                 CLOSE NSCC_TI_MRGN                                     05680000
              END-EXEC                                                  05690000
           ELSE                                                         05700000
              EXEC SQL                                                  05710000
                 CLOSE NSCC_TI_CRSR                                     05720000
              END-EXEC                                                  05730000
           END-IF.                                                      05740000
                                                                        05750000
           IF SQLCODE NOT = +0                                          05760000
              MOVE 3200 TO ABEND-CODE                                   05770000
              PERFORM SQL-ERROR-ROUTINE                                 05780000
           ELSE                                                         05790000
              MOVE +0                       TO  SQLCODE                 05800000
           END-IF.                                                      05810000
                                                                        05820000
                                                                        05830000
       WRITE-TI-RECORD-RTN.                                             05840000
                                                                        05850000
           MOVE SPACES TO FMT-AT-RECORD.                                05860000
           MOVE CLIENT-NBR OF DCLVTRNFR TO FMT-TI-ADP-CL-NO.            05870000
           MOVE ACAT-CONTROL-NBR OF DCLVTRNFR TO FMT-TI-CONTROL-NUM.    05880000
           SET FMT-TI-RECORD-ID TO TRUE.                                05890000
           IF DSTBN-SIDE-CD OF DCLVTRNFR = 'R'                          05900000
              MOVE RCV-NBR OF DCLVTRNFR  TO FMT-TI-BROKER-CLEAR-NO      05910000
              MOVE DLVR-NBR OF DCLVTRNFR TO FMT-CONTRA-BRK-NUM          05920000
LRM010        IF WM-ACCOUNT-FND                                         05930000
LRM010           MOVE FMT-TI-CUST-ACCOUNT TO WM-DEFAULT-ACCOUNT         05940000
LRM010           MOVE ACCT-RCV-NBR OF DCLVTRNFR TO WM-CUSTOMER-ACCOUNT  05950000
LRM010           PERFORM REPLACE-WM-ACCOUNT-RTN                         05960000
LRM010           MOVE WM-CUSTOMER-ACCOUNT       TO FMT-TI-CUST-ACCOUNT  05970000
LRM010        ELSE                                                      05980000
                 MOVE ACCT-RCV-NBR OF DCLVTRNFR TO FMT-TI-CUST-ACCOUNT  05990000
LRM010        END-IF                                                    06000000
              MOVE ACCT-DLVR-NBR OF DCLVTRNFR TO FMT-CONTRA-ACCOUNT     06010000
              SET  FMT-CLNT-IS-RECEIVER TO TRUE                         06020000
           ELSE                                                         06030000
              MOVE DLVR-NBR OF DCLVTRNFR TO FMT-TI-BROKER-CLEAR-NO      06040000
              MOVE RCV-NBR OF DCLVTRNFR  TO FMT-CONTRA-BRK-NUM          06050000
LRM010        IF WM-ACCOUNT-FND                                         06060000
LRM010           MOVE FMT-TI-CUST-ACCOUNT TO WM-DEFAULT-ACCOUNT         06070000
LRM010           MOVE ACCT-DLVR-NBR OF DCLVTRNFR TO WM-CUSTOMER-ACCOUNT 06080000
LRM010           PERFORM REPLACE-WM-ACCOUNT-RTN                         06090000
LRM010           MOVE WM-CUSTOMER-ACCOUNT        TO FMT-TI-CUST-ACCOUNT 06100000
LRM010        ELSE                                                      06110000
                 MOVE ACCT-DLVR-NBR OF DCLVTRNFR TO FMT-TI-CUST-ACCOUNT 06120000
LRM010        END-IF                                                    06130000
              MOVE ACCT-RCV-NBR OF DCLVTRNFR TO FMT-CONTRA-ACCOUNT      06140000
              SET  FMT-CLNT-IS-DELIVERER TO TRUE                        06150000
           END-IF.                                                      06160000
******** THE FOLLOWING 6 LINES ADDED TO FLIP RECEIVER/DELIVERER         06170000
******** ON EXTRACT FOR 'RCL' AND 'FRV' TRANSACTIONS ONLY.              06180000
******** THESE HAVE AN OPPOSITE MEANING.                                06190000
LRM009*** THE FOLLOWING 3 LINES ADDED TO NOT FLIP ON CAGE FRV,MFC       06200000
LRM009     IF PARM-INFO(1 : 8) = 'ACATCAGE'                             06210000
LRM010     AND (TRNFR-TYPE-CD OF DCLVTRNFR NOT = 'RCL')                 06220000
LRM009        CONTINUE                                                  06230000
LRM009     ELSE                                                         06240000
           IF (TRNFR-TYPE-CD OF DCLVTRNFR = 'RCL' OR 'FRV')             06250000
              IF FMT-CLNT-IS-DELIVERER                                  06260000
                 SET  FMT-CLNT-IS-RECEIVER TO TRUE                      06270000
              ELSE                                                      06280000
                 SET  FMT-CLNT-IS-DELIVERER TO TRUE                     06290000
           END-IF.                                                      06300000
           MOVE STTS-CD  OF DCLVTRNFR TO FMT-STATUS-CD.                 06310000
           MOVE DAYS-STTS-QTY OF DCLVTRNFR TO FMT-DAYS-IN-STATUS.       06320000
           MOVE STTLM-DT OF DCLVTRNFR TO WS-DATE.                       06330000
ED0002     IF PARM-INFO(1 : 8) = 'ACATCAGE'                             06340000
ED0002     AND STTLM-DT OF DCLVTRNFR NOT = '0001-01-01'                 06341000
ED0002     AND STTLM-DT OF DCLVTRNFR <= WS-TODAY-CCYYMMDD-DB2           06342000
ED0002        DISPLAY 'CAGE RUN WITH SETTLE DATE LESS OR = TO TODAY'    06342100
ED0002        DISPLAY CLIENT-NBR OF DCLVTRNFR                           06342200
ED0002         ' '              ACAT-CONTROL-NBR OF DCLVTRNFR           06342300
ED0002         ' S/D=' STTLM-DT OF DCLVTRNFR                            06342400
ED0002         ' TDY=' WS-TODAY-CCYYMMDD-DB2                            06342500
ED0002        DISPLAY 'CHECK THAT CAT7120* ALREADY RAN'                 06342600
ED0002        MOVE 3600 TO ABEND-CODE                                   06342700
ED0002        PERFORM SQL-ERROR-ROUTINE                                 06342800
ED0002     END-IF.                                                      06342900
                                                                        06343000
LRM023     IF PARM-INFO(1 : 8) = 'ACATSHAD'                             06343100
LRM023     AND STTLM-DT OF DCLVTRNFR NOT = '0001-01-01'                 06343200
LRM023     AND (STTLM-DT OF DCLVTRNFR <= WS-TODAY-CCYYMMDD-DB2)         06343300
LRM023        DISPLAY 'SHADOW RUN WITH SETTLE DATE LESS/EQUAL TODAY'    06343400
LRM023        DISPLAY CLIENT-NBR OF DCLVTRNFR                           06343500
LRM023         ' '              ACAT-CONTROL-NBR OF DCLVTRNFR           06343600
LRM023         ' S/D= ON DB2=' STTLM-DT OF DCLVTRNFR                    06343700
LRM023         ' TDY=' WS-TODAY-CCYYMMDD-DB2                            06343800
LRM023        DISPLAY 'CHECK THAT CAT7120* ALREADY RAN'                 06343900
LRM023        MOVE 3700 TO ABEND-CODE                                   06344000
LRM023        PERFORM SQL-ERROR-ROUTINE                                 06344100
LRM023     END-IF.                                                      06344200
           MOVE WS-DATE(1 : 4) TO FMT-SETTL-DATE(1 : 4).                06344300
           MOVE WS-DATE(6 : 2) TO FMT-SETTL-DATE(5 : 2).                06344400
           MOVE WS-DATE(9 : 2) TO FMT-SETTL-DATE(7 : 2).                06345000
           MOVE FMT-SETTL-DATE TO FMT-AT-SETTL-DATE.                    06346000
           IF PARM-ACAT-MARGIN                                          06347000
              MOVE '310'          TO FMT-STATUS-CD                      06348000
              MOVE ACAT-PROC-DATE TO FMT-SETTL-DATE                     06349000
                                     FMT-AT-SETTL-DATE                  06350000
           END-IF.                                                      06360000
           MOVE PRCS-DT OF DCLVTRNFR TO WS-DATE.                        06370000
           MOVE WS-DATE(1 : 4) TO FMT-PROCESS-DATE (1 : 4).             06380000
           MOVE WS-DATE(6 : 2) TO FMT-PROCESS-DATE (5 : 2).             06390000
           MOVE WS-DATE(9 : 2) TO FMT-PROCESS-DATE (7 : 2).             06400000
           MOVE RCV-CUST-NM OF DCLVTRNFR TO FMT-ACT-TITLE.              06410000
           MOVE RCV-SS-PRIM-NBR OF DCLVTRNFR                            06420000
                                TO FMT-ACT-TIN-NUMBER.                  06430000
           MOVE TRNFR-TYPE-CD OF DCLVTRNFR TO FMT-TRNFR-TYPE.           06440000
           MOVE RCV-ACCT-TYPE-CD OF DCLVTRNFR TO FMT-ACT-TYPE.          06450000
LRM015     MOVE ACAT-CNTL-ASTD-NBR OF DCLVTRNFR TO FMT-CNTL-ASTD-NBR.   06460000
LRM018     MOVE CMNT-TXT OF DCLVTRNFR TO FMT-TI-COMMENT.                06470000
                                                                        06480000
******** THE FOLLING 3 LINES ADDED TO FORCE ALL WEALTH MNGT ACCOUNTS    06490000
******** TO BOOK AS NON IRA (NO 866 OUTPUT).                            06500000
LRM010     IF WM-ACCOUNT-FND                                            06510000
LRM010        MOVE 'SN'                       TO FMT-ACT-TYPE           06520000
LRM010     END-IF.                                                      06530000
                                                                        06540000
LRM010     IF NOT WM-ACCOUNT-FND                                        06550000
              WRITE PEND-TI-RECORD FROM  FMT-TI-RECORD                  06560000
              ADD 1    TO  PENDFILE-REC-CNTR                            06570000
LRM010     ELSE                                                         06580000
LRM010     IF WM-DEFAULT-FOUND                                          06590000
LRM010     AND NOT WM-DEFAULT-TI-WRITTEN                                06600000
LRM010        SET WM-DEFAULT-TI-WRITTEN TO TRUE                         06610000
LRM010        WRITE PEND-TI-RECORD FROM  FMT-TI-RECORD                  06620000
LRM010        ADD 1    TO  PENDFILE-REC-CNTR                            06630000
LRM010     END-IF                                                       06640000
LRM010     IF WM-OCC-FOUND                                              06650000
LRM010     AND NOT WM-OCC-TI-WRITTEN                                    06660000
LRM010        SET WM-OCC-TI-WRITTEN TO TRUE                             06670000
LRM010        MOVE WM-OCC-ACCOUNT   TO FMT-TI-CUST-ACCOUNT              06680000
LRM010        WRITE PEND-TI-RECORD FROM  FMT-TI-RECORD                  06690000
LRM010        ADD 1    TO  PENDFILE-REC-CNTR                            06700000
LRM010     END-IF                                                       06710000
LRM010     IF WM-EUROCLEAR-FOUND                                        06711000
LRM010     AND NOT WM-EUROCLEAR-TI-WRITTEN                              06712000
LRM010        SET WM-EUROCLEAR-TI-WRITTEN TO TRUE                       06713000
LRM010        MOVE WM-EUROCLEAR-ACCOUNT TO FMT-TI-CUST-ACCOUNT          06714000
LRM010        WRITE PEND-TI-RECORD FROM  FMT-TI-RECORD                  06715000
LRM010        ADD 1    TO  PENDFILE-REC-CNTR                            06716000
LRM010     END-IF                                                       06717000
LRM010     IF WM-LOCAL-MKT-FOUND                                        06718000
LRM010     AND NOT WM-LOCAL-MKT-TI-WRITTEN                              06719000
LRM010        SET WM-LOCAL-MKT-TI-WRITTEN TO TRUE                       06720000
LRM010        MOVE WM-LOCAL-MKT-ACCOUNT TO FMT-TI-CUST-ACCOUNT          06730000
LRM010        WRITE PEND-TI-RECORD FROM  FMT-TI-RECORD                  06740000
LRM010        ADD 1    TO  PENDFILE-REC-CNTR                            06750000
LRM010     END-IF                                                       06760000
LRM010     IF WM-GOVT-FOUND                                             06770000
LRM010     AND NOT WM-GOVT-TI-WRITTEN                                   06780000
LRM010        SET WM-GOVT-TI-WRITTEN TO TRUE                            06790000
LRM010        MOVE WM-GOVT-ACCOUNT      TO FMT-TI-CUST-ACCOUNT          06800000
LRM010        WRITE PEND-TI-RECORD FROM  FMT-TI-RECORD                  06810000
LRM010        ADD 1    TO  PENDFILE-REC-CNTR                            06820000
LRM010     END-IF                                                       06830000
LRM010     IF WM-CASH-FOUND                                             06840000
LRM010     AND NOT WM-CASH-TI-WRITTEN                                   06850000
LRM010        SET WM-CASH-TI-WRITTEN TO TRUE                            06860000
LRM010        MOVE WM-CASH-ACCOUNT      TO FMT-TI-CUST-ACCOUNT          06870000
LRM010        WRITE PEND-TI-RECORD FROM  FMT-TI-RECORD                  06880000
LRM010        ADD 1    TO  PENDFILE-REC-CNTR                            06890000
LRM010     END-IF                                                       06900000
LRM010     IF WM-FUND-FOUND                                             06910000
LRM010     AND NOT WM-FUND-TI-WRITTEN                                   06920000
LRM010        SET WM-FUND-TI-WRITTEN TO TRUE                            06930000
LRM010        MOVE WM-INTER-COMPANY-ACCOUNT TO FMT-TI-CUST-ACCOUNT      06940000
LRM010        WRITE PEND-TI-RECORD FROM  FMT-TI-RECORD                  06950000
LRM010        ADD 1    TO  PENDFILE-REC-CNTR                            06960000
LRM010     END-IF                                                       06970000
LRM010     IF WM-OTHER-FOUND                                            06980000
LRM010     AND NOT WM-OTHER-TI-WRITTEN                                  06990000
LRM010        SET WM-OTHER-TI-WRITTEN TO TRUE                           07000000
LRM010        MOVE WM-OTHER-ACCOUNT TO FMT-TI-CUST-ACCOUNT              07010000
LRM010        WRITE PEND-TI-RECORD FROM  FMT-TI-RECORD                  07020000
LRM010        ADD 1    TO  PENDFILE-REC-CNTR                            07030000
LRM010     END-IF.                                                      07040000
           EJECT                                                        07050000
      ******************                                                07060000
       FETCH-AT-RECORDS.                                                07070000
      ******************                                                07080000
                                                                        07090000
             EXEC SQL                                                   07091000
                OPEN NSCC_AT1_CRSR                                      07092000
             END-EXEC                                                   07093000
                                                                        07094000
           IF SQLCODE NOT = +0                                          07095000
              MOVE 3200 TO ABEND-CODE                                   07096000
              PERFORM SQL-ERROR-ROUTINE                                 07097000
           END-IF                                                       07098000
                                                                        07099000
           PERFORM UNTIL SQLCODE NOT = +0                               07100000
                 EXEC SQL                                               07110000
                    FETCH NSCC_AT1_CRSR                                 07120000
                      INTO                                              07130000
                     :DCLVASSET.CLIENT-NBR                              07140000
                    ,:DCLVASSET.ACAT-CONTROL-NBR                        07150000
                    ,:DCLVASSET.ASSET-SEQ-NBR                           07160000
                    ,:DCLVASSET.TRANS-TYPE-CD                           07170000
                    ,:DCLVASSET.SBMTG-PRTCP-NBR                         07180000
                    ,:DCLVASSET.TRANS-RFRN-ID-CD                        07190000
                    ,:DCLVASSET.ASSET-PRC-CTGY-CD                       07200000
                    ,:DCLVASSET.OPTN-CTGY-CD                            07210000
                    ,:DCLVASSET.STTLM-LCTN-CD                           07220000
                    ,:DCLVASSET.STTLM-RSN-CD                            07230000
                    ,:DCLVASSET.ISIN-CNTRY-CD                           07240000
                    ,:DCLVASSET.ISIN-SEC-ISSUE-CD                       07250000
                    ,:DCLVASSET.ISIN-SEC-CDG-CD                         07260000
                    ,:DCLVASSET.ASSET-DESC-TXT                          07270000
                    ,:DCLVASSET.ASSET-RQST-QTY-CD                       07280000
                    ,:DCLVASSET.AST-RQST-TRANS-CD                       07290000
                    ,:DCLVASSET.ASSET-QTY                               07300000
                    ,:DCLVASSET.ASSET-PCT                               07310000
                    ,:DCLVASSET.PSTN-CD                                 07320000
                    ,:DCLVASSET.ISO-CRNCY-CD                            07330000
                    ,:DCLVASSET.ASSET-AMT                               07340000
TCK001              ,:DCLVASSET.ASSET-AMT-STTS-CD                       07350000
                    ,:DCLVASSET.BEARER-BOND-CD                          07360000
                    ,:DCLVASSET.CSH-MGN-SHRT-CD                         07370000
                    ,:DCLVASSET.WHI-CD                                  07380000
                    ,:DCLVASSET.TRNFR-TYPE-RSN-CD                       07390000
                    ,:DCLVASSET.MBS-SERIAL-NBR                          07400000
                    ,:DCLVASSET.ASSET-CMNT-TXT                          07410000
                    ,:DCLVASSET.NSCC-PEND-CD                            07420000
                    ,:DCLVASSET.SECURITY-ADP-NBR                        07430000
LRM007              ,:DCLVASSET.CAGE-TAG-NBR                            07440000
LRM013              ,:DCLVASSET.SCRTY-866-NBR                           07450000
LRM013              ,:DCLVASSET.ASSET-866-QTY                           07460000
LRM027              ,:DCLVASSET.CRNCY-CD                                07461000
LRM028              ,:DCLVASSET.MEMO-ORG-RVRSL-QTY                      07462000
                 END-EXEC                                               07470000
                                                                        07480000
              EVALUATE SQLCODE                                          07490000
                 WHEN +100                                              07500000
                   CONTINUE                                             07510000
                 WHEN +0                                                07520000
LRM010             IF WM-ACCOUNT-FND                                    07530000
LRM010                PERFORM WRITE-TI-RECORD-RTN                       07531000
LRM010             END-IF                                               07532000
LRM016             IF WM-ACCOUNT-FND                                    07533000
LRM016             AND STTLM-LCTN-CD OF DCLVASSET = '45'                07534000
LRM016                CONTINUE                                          07535000
LRM016             ELSE                                                 07536000
                      ADD 1 TO WS-TOTAL-AT-REC-CNTR                     07537000
                      PERFORM WRITE-AT-RECORD                           07538000
LRM016             END-IF                                               07539000
              END-EVALUATE                                              07540000
           END-PERFORM.                                                 07550000
                                                                        07551000
           IF SQLCODE NOT = +100                                        07552000
              MOVE 3400 TO ABEND-CODE                                   07553000
              PERFORM SQL-ERROR-ROUTINE                                 07554000
           END-IF                                                       07555000
                                                                        07556000
           EXEC SQL                                                     07557000
              CLOSE NSCC_AT1_CRSR                                       07558000
           END-EXEC                                                     07559000
                                                                        07560000
           IF SQLCODE NOT = +0                                          07570000
              MOVE 4400 TO ABEND-CODE                                   07580000
              PERFORM SQL-ERROR-ROUTINE                                 07590000
           END-IF                                                       07600000
                                                                        07610000
           .                                                            07620000
                                                                        07630000
           EJECT                                                        07640000
      *****************                                                 07650000
       WRITE-AT-RECORD.                                                 07660000
      *****************                                                 07670000
                                                                        07680000
           MOVE CLIENT-NBR OF DCLVTRNFR TO FMT-AT-ADP-CL-NO.            07690000
           SET FMT-AT-RECORD-ID TO TRUE.                                07700000
           IF DSTBN-SIDE-CD OF DCLVTRNFR = 'R'                          07710000
ENP001        MOVE RCV-NBR OF DCLVTRNFR  TO FMT-AT-BROKER-CLEAR-NO      07720000
              MOVE DLVR-NBR OF DCLVTRNFR TO FMT-AT-CONTRA-BRK-NUM       07730000
LRM010        IF WM-ACCOUNT-FND                                         07740000
LRM010           MOVE WM-CUSTOMER-ACCOUNT       TO FMT-AT-CUST-ACCOUNT  07750000
LRM012           SET FMT-AT-WM TO TRUE                                  07760000
LRM016           SET FMT-CASH-ACT TO TRUE                               07770000
LRM010        ELSE                                                      07780000
                 MOVE ACCT-RCV-NBR OF DCLVTRNFR TO FMT-AT-CUST-ACCOUNT  07790000
LRM012           SET FMT-AT-NON-WM TO TRUE                              07800000
LRM010        END-IF                                                    07810000
              MOVE ACCT-DLVR-NBR OF DCLVTRNFR TO FMT-AT-CONTRA-ACCOUNT  07820000
              SET  FMT-AT-CLNT-IS-RECEIVER TO TRUE                      07830000
           ELSE                                                         07840000
ENP001        MOVE DLVR-NBR OF DCLVTRNFR TO FMT-AT-BROKER-CLEAR-NO      07850000
              MOVE RCV-NBR OF DCLVTRNFR TO FMT-AT-CONTRA-BRK-NUM        07860000
LRM010        IF WM-ACCOUNT-FND                                         07870000
LRM010           MOVE WM-CUSTOMER-ACCOUNT        TO FMT-AT-CUST-ACCOUNT 07880000
LRM012           SET FMT-AT-WM TO TRUE                                  07890000
LRM016           SET FMT-CASH-ACT TO TRUE                               07900000
LRM010        ELSE                                                      07910000
                 MOVE ACCT-DLVR-NBR OF DCLVTRNFR TO FMT-AT-CUST-ACCOUNT 07920000
LRM012           SET FMT-AT-NON-WM TO TRUE                              07930000
LRM010        END-IF                                                    07940000
              MOVE ACCT-RCV-NBR OF DCLVTRNFR TO FMT-AT-CONTRA-ACCOUNT   07950000
              SET  FMT-AT-CLNT-IS-DELIVERER TO TRUE                     07960000
           END-IF.                                                      07970000
******** THE FOLLOWING 6 LINES ADDED TO FLIP RECEIVER/DELIVERER         07980000
******** ON EXTRACT FOR 'RCL' AND 'FRV' TRANSACTIONS ONLY.              07990000
******** THESE HAVE AN OPPOSITE MEANING.                                08000000
LRM009*** THE FOLLOWING 3 LINES ADDED TO NOT FLIP ON CAGE FRV,MFC       08010000
LRM009     IF PARM-INFO(1 : 8) = 'ACATCAGE'                             08020000
LRM009        CONTINUE                                                  08030000
LRM009     ELSE                                                         08040000
           IF (TRNFR-TYPE-CD OF DCLVTRNFR = 'RCL' OR 'FRV')             08050000
              IF FMT-AT-CLNT-IS-DELIVERER                               08060000
                 SET  FMT-AT-CLNT-IS-RECEIVER TO TRUE                   08070000
              ELSE                                                      08080000
                 SET  FMT-AT-CLNT-IS-DELIVERER TO TRUE                  08090000
           END-IF.                                                      08100000
           MOVE ACAT-CONTROL-NBR OF DCLVTRNFR TO FMT-AT-CONTROL-NUM.    08110000
           MOVE ASSET-SEQ-NBR OF DCLVASSET TO FMT-ASSET-SEQ-NO-9.       08120000
                                                                        08130000
           MOVE ASSET-QTY OF DCLVASSET TO FMT-ASSET-QUAN                08140000
                                          WS-ASSET-QUAN-V9              08150000
                                          FMT-ASSET-QUAN-FRACTION.      08160000
                                                                        08170000
ENP001     MOVE WS-ASSET-QUAN-V9       TO FMT-ASSET-QUAN-WHOLE-NUM      08180000
ENP001                                    FMT-ASSET-QTY-DEC.            08190000
                                                                        08200000
           MOVE ISIN-SEC-ISSUE-CD OF DCLVASSET TO FMT-CUSIP-NUM.        08210000
           MOVE STTLM-LCTN-CD     OF DCLVASSET TO FMT-STTLM-LCTN-CD     08220000
           MOVE STTLM-RSN-CD      OF DCLVASSET TO FMT-STTLM-RSN-CD.     08230000
           MOVE PSTN-CD           OF DCLVASSET TO FMT-PSTN-CD.          08240000
                                                                        08250000
           MOVE ASSET-DESC-TXT OF DCLVASSET TO FMT-SEC-DESC-1.          08260000
                                                                        08270000
           IF STTLM-LCTN-CD OF DCLVASSET = '10'                         08280000
TCKDSP*       DISPLAY ' '                                               08290000
TCKDSP*       DISPLAY ' *** ENTER FUND SERV RTN ***'                    08300000
TCKDSP*       DISPLAY ' ACAT CONTROL NUM = ' FMT-AT-CONTROL-NUM         08310000
TCKDSP*       ', CUST ACCT NBR ' FMT-AT-CUST-ACCOUNT                    08320000
TCKDSP*       DISPLAY  'ADP SEC NO  '  FMT-ADP-SEC-NO                   08330000
TCKDSP*       ', ASSET SEQ NBR ' FMT-ASSET-SEQ-NO-9                     08340000
              PERFORM FORMAT-FUND-SERV-RTN THRU FORMAT-FUNDSRV-EXIT     08350000
           ELSE                                                         08360000
LRM005     MOVE SPACES TO FMT-FNDSRVS-PRCS-DT                           08370000
           IF STTLM-LCTN-CD OF DCLVASSET = '35'                         08380000
           AND OPTN-CTGY-CD OF DCLVASSET > '00'                         08390000
              PERFORM FORMAT-OPTION-RTN                                 08400000
LRM017        IF (CLIENT-NBR OF DCLVTRNFR = '0012' OR '0224')           08410000
LRM002        AND SECURITY-ADP-NBR OF DCLVASSET (1 : 1) = '9'           08420000
LRM002           MOVE '8' TO SECURITY-ADP-NBR OF DCLVASSET (1 : 1)      08430000
LRM002     END-IF.                                                      08440000
                                                                        08450000
******** OVERRIDE ACCT TYPE ON RECEIVER SHORT TO MARGIN AND DEFAULT     08460000
******** MISSING ACCT TYPE TO CASH:                                     08470000
LRM016     IF WM-ACCOUNT-FND                                            08480000
LRM016        MOVE 'C'             TO FMT-CASH-MGN-IND                  08490000
LRM016     ELSE                                                         08500000
           IF CSH-MGN-SHRT-CD OF DCLVASSET = 'C' OR 'M' OR 'S'          08510000
              MOVE CSH-MGN-SHRT-CD OF DCLVASSET TO FMT-CASH-MGN-IND     08520000
           ELSE                                                         08530000
              MOVE 'C'             TO FMT-CASH-MGN-IND                  08540000
           END-IF.                                                      08550000
                                                                        08560000
           MOVE BEARER-BOND-CD OF DCLVASSET TO FMT-SEC-TYPE.            08570000
           MOVE WHI-CD OF DCLVASSET TO FMT-SEC-WHEN-ISSUE-CD.           08580000
           MOVE ASSET-PRC-CTGY-CD OF DCLVASSET TO FMT-PRC-CTGY-CD.      08581000
           MOVE ASSET-PRC-CTGY-CD OF DCLVASSET TO FMT-ASSET-PRC-CTGY-CD.08582000
           MOVE OPTN-CTGY-CD OF DCLVASSET     TO FMT-CATEGORY.          08583000
LRM024     MOVE ASSET-AMT OF DCLVASSET TO FMT-ASSET-ORIGINAL-AMT.       08583100
******** THE FOLLOWING 4 LINES ADDED TO WIPE-OUT ASSET AMOUNT ON FREE   08584000
******** TRANSFER FROM BANK.                                            08585000
LRM003     IF (STTLM-LCTN-CD OF DCLVASSET = '50'                        08586000
LRM003       AND STTLM-RSN-CD OF DCLVASSET = 'DDEL')                    08587000
LRM019     OR ((PRTCP-CONTRA-CD OF DCLVTRNFR   = '1' OR '3')            08588000
             AND STTLM-LCTN-CD OF DCLVASSET NOT = '40')                 08589000
              MOVE ZEROS TO ASSET-AMT OF DCLVASSET                      08590000
              ADD +1 TO WS-TOTAL-VALFRE-CNTR                            08600000
TEST          DISPLAY 'WIPED AMT / FREE ASSET '                         08610000
                       CLIENT-NBR  OF DCLVTRNFR                         08620000
                  ' '  ACAT-CONTROL-NBR OF DCLVTRNFR                    08630000
                  ' '  ASSET-SEQ-NBR OF DCLVASSET                       08640000
LRM030     ELSE                                                         08641000
LRM030     IF STTLM-LCTN-CD OF DCLVASSET = '10'                         08642000
LRM030     AND B1-MF-ACCEP-AMT-BKP-BYPAS(B1-SUB) = '1'                  08643000
LRM030     AND FMT-ACCEPTED-BY-FUND                                     08644000
LRM030        MOVE ZEROS TO ASSET-AMT OF DCLVASSET                      08645000
LRM030        ADD +1 TO WS-TOTAL-APRFND-CNTR                            08646000
LRM030        DISPLAY 'WIPED AMT / APPROVED FUND '                      08647000
LRM030                 CLIENT-NBR  OF DCLVTRNFR                         08648000
LRM030            ' '  ACAT-CONTROL-NBR OF DCLVTRNFR                    08649000
LRM030            ' '  ASSET-SEQ-NBR OF DCLVASSET                       08649100
           END-IF.                                                      08650000
           MOVE ASSET-AMT OF DCLVASSET TO FMT-ASSET-VALUE               08660000
ENP001                                    FMT-ASSET-AMT-DEC.            08670000
           MOVE SECURITY-ADP-NBR OF DCLVASSET TO FMT-ADP-SEC-NO.        08680000
           MOVE ASSET-RQST-QTY-CD OF DCLVASSET TO FMT-ASSET-RQST-QTY-CD.08690000
           MOVE TRNFR-TYPE-RSN-CD OF DCLVASSET TO FMT-TRNFR-TYPE-RSN-CD.08700000
LRM007     MOVE CAGE-TAG-NBR      OF DCLVASSET TO FMT-CAGE-TAG.         08710000
LRM013     MOVE SCRTY-866-NBR     OF DCLVASSET TO FMT-SCRTY-866-NBR.    08720000
LRM013     MOVE ASSET-866-QTY     OF DCLVASSET TO FMT-ASSET-866-QTY.    08730000
LRM018     MOVE ISO-CRNCY-CD      OF DCLVASSET TO FMT-ISO-CRNCY-CD.     08740000
LRM018     MOVE ASSET-CMNT-TXT    OF DCLVASSET TO FMT-ASSET-COMMENT.    08750000
LRM027     MOVE CRNCY-CD          OF DCLVASSET TO FMT-CURRENCY-CD.      08751000
LRM028     MOVE MEMO-ORG-RVRSL-QTY OF DCLVASSET                         08752000
LRM028                              TO FMT-MEMO-ORG-RVRSL-QTY.          08753000
                                                                        08760000
           IF FMT-TRNFR-TYPE = 'MFC'                                    08770000
              PERFORM SEARCH-ORIG-STTL-DATE                             08780000
           END-IF.                                                      08790000
                                                                        08800000
LRM021     IF (FMT-TRNFR-TYPE = 'MFC' OR 'FRV')                         08810000
LRM021     AND PARM-ACAT-CAGE                                           08811000
LRM021        PERFORM SEARCH-ORIG-STTL-LCTN                             08820000
LRM021           THRU SEARCH-ORIG-STTL-LCTN-EXIT                        08830000
LRM021     END-IF.                                                      08840000
                                                                        08850000
LRM022     MOVE PRTCP-CONTRA-CD OF DCLVTRNFR TO                         08851000
LRM022                                 FMT-CONTRA-PARTICIPANT-TYPE      08856000
LRM020     IF (TRNFR-TYPE-CD OF DCLVTRNFR = 'PTF')                      08860000
LRM031     AND (PARM-ACAT-SHADOW OR PARM-ACAT-FUNDSERV)                 08870001
LRM020     AND ASSET-QTY OF DCLVASSET = ZERO                            08880000
LRM020        DISPLAY 'SHAD RUN / PTF ZERO QTY '                        08890000
LRM020           FMT-AT-ADP-CL-NO  ' ' FMT-AT-CONTROL-NUM               08891000
LRM025     END-IF.                                                      08892000
LRM025*****ELSE                                                         08892100
           WRITE PEND-AT-RECORD  FROM  FMT-AT-RECORD.                   08893000
           ADD 1    TO  PENDFILE-REC-CNTR.                              08894000
                                                                        08895000
TCK???*D   IF STTLM-LCTN-CD OF DCLVASSET = '10'                         08896000
TCK???*D      PERFORM FORMAT-FUND-SERV-RTN                              08897000
TCK???*D   END-IF.                                                      08898000
                                                                        08899000
           MOVE SPACES TO FMT-FSRV-ACKN-IND.                            08900000
                                                                        08910000
       FORMAT-OPTION-RTN.                                               08920000
           EXEC SQL                                                     08930000
              SELECT                                                    08940000
                BS_CD                                                   08950000
               ,PTCL_CD                                                 08960000
               ,OPTN_OPN_CLSD_CD                                        08970000
               ,SYM_CD                                                  08980000
               ,EXPTN_DT                                                08990000
               ,STPRC_INTEGER_AMT                                       09000000
               ,STPRC_FRCTN_AMT                                         09010000
               ,OPTN_ACCT_TYPE_CD                                       09020000
              INTO                                                      09030000
               :BS-CD                                                   09040000
               ,:PTCL-CD                                                09050000
               ,:OPTN-OPN-CLSD-CD                                       09060000
               ,:SYM-CD                                                 09070000
               ,:EXPTN-DT                                               09080000
               ,:STPRC-INTEGER-AMT                                      09090000
               ,:STPRC-FRCTN-AMT                                        09100000
               ,:OPTN-ACCT-TYPE-CD                                      09110000
                 FROM VOPTN                                             09120000
              WHERE CLIENT_NBR   =  :DCLVTRNFR.CLIENT-NBR               09130000
                  AND  ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CONTROL-NBR   09140000
                  AND  ASSET_SEQ_NBR = :DCLVASSET.ASSET-SEQ-NBR         09150000
           END-EXEC.                                                    09160000
           IF SQLCODE = +0                                              09170000
              ADD 1 TO WS-TOTAL-OP-REC-CNTR                             09180000
              PERFORM MOVE-OPTION-DETAILS                               09190000
           ELSE                                                         09200000
              ADD 1 TO WS-TOTAL-OP-NOT-FND                              09210000
              MOVE SPACES TO FMT-OPTION-AREA                            09220000
           END-IF.                                                      09230000
           MOVE +0 TO SQLCODE.                                          09240000
                                                                        09250000
       MOVE-OPTION-DETAILS.                                             09260000
           MOVE BS-CD TO FMT-BUY-SELL-IND.                              09270000
           MOVE PTCL-CD TO FMT-OPT-PUT-CALL.                            09280000
           MOVE OPTN-OPN-CLSD-CD TO FMT-OPEN-CLOSE.                     09290000
           MOVE SYM-CD TO FMT-OPTION-SYMBOL.                            09300000
           MOVE EXPTN-DT(1 : 4) TO FMT-OPT-EXP-CCYY.                    09310000
           MOVE EXPTN-DT(6 : 2) TO FMT-OPT-EXP-MM.                      09320000
           MOVE EXPTN-DT(9 : 2) TO FMT-OPT-EXP-DD.                      09330000
           MOVE OPTN-ACCT-TYPE-CD TO FMT-OPT-ACT-TYPE.                  09340000
                                                                        09350000
           EJECT                                                        09360000
      **********************                                            09370000
       FORMAT-FUND-SERV-RTN.                                            09380000
      **********************                                            09390000
                                                                        09400000
           INITIALIZE DCLVMF                                            09410000
           EXEC SQL                                                     09420000
              SELECT                                                    09430000
                UPDT_TMSTP                                              09440000
               ,PRGM_NM                                                 09450000
               ,MF_FUL_PRTL_STS_CD                                      09460000
               ,NTWRK_CNTL_CD                                           09470000
ET0001         ,ACCT_TYPE_CD                                            09480000
               ,BK_PHSCL_SHR_CD                                         09490000
              INTO                                                      09500000
                :DCLVMF.UPDT-TMSTP                                      09510000
               ,:DCLVMF.PRGM-NM                                         09520000
               ,:DCLVMF.MF-FUL-PRTL-STS-CD                              09530000
               ,:DCLVMF.NTWRK-CNTL-CD                                   09540000
ET0001         ,:DCLVMF.ACCT-TYPE-CD                                    09550000
               ,:DCLVMF.BK-PHSCL-SHR-CD                                 09560000
                 FROM VMF                                               09570000
              WHERE  CLIENT_NBR       = :DCLVTRNFR.CLIENT-NBR           09580000
                AND  ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CONTROL-NBR     09590000
                AND  ASSET_SEQ_NBR    = :DCLVASSET.ASSET-SEQ-NBR        09600000
           END-EXEC.                                                    09610000
                                                                        09620000
           IF SQLCODE = +0                                              09630000
              ADD 1 TO WS-TOTAL-MF-REC-CNTR                             09640000
              MOVE MF-FUL-PRTL-STS-CD OF DCLVMF TO FMT-ACTION-TYPE-CD   09650000
ET0001        MOVE ACCT-TYPE-CD       OF DCLVMF TO FMT-VMF-ACCT-TYPE-CD 09660000
DJ            MOVE BK-PHSCL-SHR-CD    OF DCLVMF TO FMT-BK-PHSCL-SHR-CD  09670000
LRM           IF FMT-CLNT-IS-DELIVERER                                  09680000
DJ               MOVE NTWRK-CNTL-CD   OF DCLVMF TO FMT-NTWRK-CNTL-CD    09690000
TCK002                                             WS-MF-NTWRK-CD       09700000
                                                                        09710000
TMP001*          DISPLAY ' '                                            09720000
TMP001*          DISPLAY ' NTWRK CNTL CD OF CLIENT ' FMT-AT-ADP-CL-NO,  09730000
TMP001*          ' ACCT # = ' FMT-AT-CUST-ACCOUNT,'CONTROL-NUM = '      09740000
TMP001*          FMT-AT-CONTROL-NUM, ' IS ', FMT-NTWRK-CNTL-CD ' AND '  09750000
TMP001*          ' DSTBN-SIDE-CD IS ' FMT-AT-DSTBN-SIDE-CD              09760000
                                                                        09770000
LRM           END-IF                                                    09780000
              MOVE UPDT-TMSTP         OF DCLVMF TO WS-DATE              09790000
              MOVE WS-DATE (1 : 4)  TO WS-DATE-8 (1 : 4)                09800000
              MOVE WS-DATE (6 : 2)  TO WS-DATE-8 (5 : 2)                09810000
              MOVE WS-DATE (9 : 2)  TO WS-DATE-8 (7 : 2)                09820000
              MOVE   ' '    TO FMT-UPDT-TMSTP                           09830000
TMP002**        DISPLAY ' '                                             09840000
TMP002**        DISPLAY ' FMT-ACTION-TYPE-CD = ' FMT-ACTION-TYPE-CD     09850000
              IF  FMT-ACTION-TYPE-CD = 'R' OR 'A'                       09860000
                  MOVE WS-DATE-8 TO FMT-UPDT-TMSTP                      09870000
              END-IF                                                    09880000
           ELSE                                                         09890000
              ADD 1 TO WS-TOTAL-MF-NOT-FND                              09900000
              MOVE ' '  TO FMT-ACTION-TYPE-CD                           09910000
                           FMT-NTWRK-CNTL-CD                            09920000
                           FMT-BK-PHSCL-SHR-CD                          09930000
                           FMT-UPDT-TMSTP                               09940000
ET0001                     FMT-VMF-ACCT-TYPE-CD                         09950000
           END-IF.                                                      09960000
TCK002*** TAKE OUT, OTHERWISE THE DELVERER WILL NOT GET STTLM-DT ***    09970000
TCK001*    IF FMT-CLNT-IS-DELIVERER                                     09980000
TCK001*       GO TO FORMAT-FUNDSRV-EXIT                                 09990000
TCK001*    END-IF.                                                      10000000
                                                                        10010000
TCK001     MOVE SPACE TO WS-FR-NTWRK-CD.                                10020000
           INITIALIZE DCLVFNDRGST.                                      10030000
           EXEC SQL                                                     10040000
              SELECT                                                    10050000
                RJCT_CD                                                 10060000
               ,SYS_RJCT_RSN_CD                                         10070000
               ,STTLM_ASCTD_DT                                          10080000
               ,STTLM_DT                                                10090000
               ,ACTION_TYPE_CD                                          10100000
               ,FUND_BK_CD                                              10110000
               ,NTWRK_CNTL_CD                                           10120000
               ,BK_PHSCL_SHR_CD                                         10130000
               ,PRCS_DT                                                 10140000
               ,NSCC_PEND_CD                                            10150000
              INTO                                                      10160000
                :DCLVFNDRGST.RJCT-CD                                    10170000
               ,:DCLVFNDRGST.SYS-RJCT-RSN-CD                            10180000
               ,:DCLVFNDRGST.STTLM-ASCTD-DT                             10190000
               ,:DCLVFNDRGST.STTLM-DT                                   10200000
               ,:DCLVFNDRGST.ACTION-TYPE-CD                             10210000
               ,:DCLVFNDRGST.FUND-BK-CD                                 10220000
               ,:DCLVFNDRGST.NTWRK-CNTL-CD                              10230000
               ,:DCLVFNDRGST.BK-PHSCL-SHR-CD                            10240000
               ,:DCLVFNDRGST.PRCS-DT                                    10250000
               ,:DCLVFNDRGST.NSCC-PEND-CD                               10260000
                 FROM VFNDRGST                                          10270000
              WHERE CLIENT_NBR       = :DCLVTRNFR.CLIENT-NBR            10280000
                AND ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CONTROL-NBR      10290000
                AND ASSET_SEQ_NBR    = :DCLVASSET.ASSET-SEQ-NBR         10300000
           END-EXEC.                                                    10310000
           IF SQLCODE = +0                                              10320000
              ADD 1 TO WS-TOTAL-FR-REC-CNTR                             10330000
              MOVE RJCT-CD          OF DCLVFNDRGST                      10340000
                                                TO FMT-RJCT-CD          10350000
              MOVE SYS-RJCT-RSN-CD  OF DCLVFNDRGST                      10360000
                                                TO FMT-SYS-RJCT-RSN-CD  10370000
              MOVE STTLM-ASCTD-DT   OF DCLVFNDRGST                      10380000
                                                TO FMT-STTLM-ASCTD-DT   10390000
              MOVE STTLM-DT         OF DCLVFNDRGST                      10400000
                                                TO FMT-STTLM-DT         10410000
              MOVE FUND-BK-CD       OF DCLVFNDRGST                      10420000
                                                TO FMT-FUND-BK-CD       10430000
              IF FMT-CLNT-IS-RECEIVER                                   10440000
LRM           AND NSCC-PEND-CD OF DCLVFNDRGST = 'A'                     10450000
                 MOVE NTWRK-CNTL-CD OF DCLVFNDRGST                      10460000
TCK001                                          TO WS-FR-NTWRK-CD       10470000
TCK002        ELSE                                                      10480000
TCK002           MOVE SPACES TO WS-FR-NTWRK-CD                          10490000
              END-IF                                                    10500000
           ELSE                                                         10510000
              ADD 1 TO WS-TOTAL-FR-NOT-FND                              10520000
              MOVE ' '                          TO FMT-RJCT-CD          10530000
              MOVE ' '                          TO FMT-SYS-RJCT-RSN-CD  10540000
              MOVE ' '                          TO FMT-STTLM-ASCTD-DT   10550000
              MOVE ' '                          TO FMT-STTLM-DT         10560000
              MOVE ' '                          TO FMT-FUND-BK-CD       10570000
TCKDSP*       DISPLAY ' '                                               10580000
TCKDSP*       DISPLAY  'ACAT CNTL NO  '  FMT-AT-CONTROL-NUM             10590000
TCKDSP*       ', CUST ACCT NBR ' FMT-AT-CUST-ACCOUNT                    10600000
TCKDSP*       DISPLAY  'ADP SEC NO  '  FMT-ADP-SEC-NO                   10610000
TCKDSP*       ', ASSET SEQ NBR ' FMT-ASSET-SEQ-NO                       10620000
TCKDSP*       ' IS NOT FOUND IN VFNDRGST '                              10630000
           END-IF.                                                      10640000
                                                                        10650000
      ******************************************************************10660000
      ***  USE B1 434613 FOR AS DEFAULT FOR NTWRK CNTL CD FOR RECEIVER: 10670000
      ******************************************************************10680000
TCK001     MOVE SPACE TO WS-B1-NTWRK-CD.                                10690000
           IF FMT-AT-CLNT-IS-RECEIVER                                   10700000
ET0002     AND B1-MF-NETWRK-CTRL-IND (B1-SUB) > SPACE                   10710000
ET0002        MOVE B1-MF-NETWRK-CTRL-IND (B1-SUB)                       10720000
TCK001                                          TO WS-B1-NTWRK-CD       10730000
TEST  *       DISPLAY 'B1-MF-NETWRK-CTRL-IND =  ' WS-B1-NTWRK-CD        10740000
TEST  *              ' FOR ' FMT-AT-ADP-CL-NO                           10750000
TEST  *           ' ' ACAT-CONTROL-NBR OF DCLVTRNFR                     10760000
TEST  *           ' SEQ NBR ' ASSET-SEQ-NBR OF DCLVASSET                10770000
TCK002     ELSE                                                         10780000
TCK002        MOVE SPACES TO WS-B1-NTWRK-CD                             10790000
           END-IF.                                                      10800000
                                                                        10810000
           MOVE +0 TO SQLCODE.                                          10820000
                                                                        10830000
TCK001***************************************************************** 10840000
TCK001* THE NTWRK-CNTL-CD IS UPDATED TO THE VFNDSRVS BY CAT580 WITH   * 10850000
TCK001* THE VALUE RETURNED BY NSCC. IN ORDER TO CAPTURE THE LATEST    * 10860000
TCK001* NTWRK-CNTL-CD FROM NSCC, IT IS NECESSARY TO RETRIEVE IT FROM  * 10870000
TCK001* VFNDSRVS IN THIS PROGRAM ALSO.                                * 10880000
TCK002* RETRIEVE STTLM_DT FOR CALCULATE VALUE-DATE OF OMNIBUS ACCT IN * 10890000
TCK002* CAT650                                                        * 10900000
TCK001***************************************************************** 10910000
TCK001                                                                  10920000
TCK001     MOVE SPACE TO WS-FS-NTWRK-CD.                                10930000
TCK001     INITIALIZE DCLVFNDSRVS.                                      10940000
TCK001     EXEC SQL                                                     10950000
TCK001        SELECT                                                    10960000
TCK001          NTWRK_CNTL_CD                                           10970000
TCK002         ,STTLM_DT                                                10980000
LRM005         ,PRCS_DT                                                 10990000
LRM026         ,FND_SERV_CNTL_NBR                                       10991000
TCK001        INTO                                                      11000000
TCK001          :DCLVFNDSRVS.NTWRK-CNTL-CD                              11010000
TCK002         ,:DCLVFNDSRVS.STTLM-DT                                   11020000
LRM005         ,:DCLVFNDSRVS.PRCS-DT                                    11030000
LRM026         ,:DCLVFNDSRVS.FND-SERV-CNTL-NBR                          11031000
TCK001           FROM VFNDSRVS                                          11040000
TCK001        WHERE  CLIENT_NBR       = :DCLVTRNFR.CLIENT-NBR           11050000
TCK001          AND  ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CONTROL-NBR     11060000
TCK001          AND  ASSET_SEQ_NBR    = :DCLVASSET.ASSET-SEQ-NBR        11070000
TCK001     END-EXEC.                                                    11080000
TCK001     IF SQLCODE = +0                                              11090000
TCK001        ADD 1 TO WS-TOTAL-FS-REC-CNTR                             11100000
LRM005        MOVE PRCS-DT OF DCLVFNDSRVS                               11110000
LRM005                                  TO FMT-FNDSRVS-PRCS-DT          11120000
LRM005        MOVE PRCS-DT OF DCLVFNDSRVS (6 : 2)                       11130000
LRM005                                  TO FMT-FNDSRVS-PRCS-DT(5 : 2)   11140000
LRM005        MOVE PRCS-DT OF DCLVFNDSRVS (9 : 2)                       11150000
LRM005                                  TO FMT-FNDSRVS-PRCS-DT(7 : 2)   11160000
TCK002        IF FMT-ACCEPTED-BY-FUND                                   11170000
TCK002           MOVE STTLM-DT OF DCLVFNDSRVS      TO FMT-STTLM-DT      11180000
TCK002        END-IF                                                    11190000
LRM026        MOVE FND-SERV-CNTL-NBR OF DCLVFNDSRVS                     11191000
LRM026                                  TO FMT-FND-SERV-CNTL-NBR        11192000
                                                                        11200000
TCK001        IF FMT-AT-CLNT-IS-RECEIVER              AND               11210000
TCK001           NTWRK-CNTL-CD OF DCLVFNDSRVS > SPACE                   11220000
TCK001           MOVE NTWRK-CNTL-CD OF DCLVFNDSRVS                      11230000
TCK001                                        TO WS-FS-NTWRK-CD         11240000
TMP001*          DISPLAY '  '                                           11250000
TMP001*          DISPLAY ' NTWRK-CNTL-CD OF VFNDSRVS = ' WS-FS-NTWRK-CD 11260000
TMP001*           ' FOR ' FMT-AT-ADP-CL-NO                              11270000
TMP001*        ' ' ACAT-CONTROL-NBR OF DCLVTRNFR                        11280000
TMP001*        ' SEQ NBR ' ASSET-SEQ-NBR OF DCLVASSET                   11290000
TCK001        ELSE                                                      11300000
TCK001           MOVE ' ' TO WS-FS-NTWRK-CD                             11310000
TCK001        END-IF                                                    11320000
TCK001     ELSE                                                         11330000
TCK001        MOVE ' '    TO WS-FS-NTWRK-CD                             11340000
TCK001        ADD 1 TO WS-TOTAL-FS-NOT-FND                              11350000
TMP002*       DISPLAY ' '                                               11360000
TMP002*       DISPLAY  'ACAT CNTL NO  '  FMT-AT-CONTROL-NUM             11370000
TMP002*       ', CUST ACCT NBR ' FMT-AT-CUST-ACCOUNT                    11380000
TMP002*       DISPLAY  'ADP SEC NO  '  FMT-ADP-SEC-NO                   11390000
TMP002*       ', ASSET SEQ NBR ' FMT-ASSET-SEQ-NO-9                     11400000
TMP002*       'IS NOT FOUND IN VFNDSRVS, REPLACED BY STTM-DT OF VTRNFR '11410000
TMP002*       '= ' FMT-STTLM-DT                                         11420000
TCK001     END-IF.                                                      11430000
TCK001                                                                  11440000
TCK002     IF FMT-AT-CLNT-IS-RECEIVER                                   11450000
TCK001        IF WS-FS-NTWRK-CD > SPACE                                 11460000
TCK001           MOVE WS-FS-NTWRK-CD TO FMT-NTWRK-CNTL-CD               11470000
TCK001           ADD  +1  TO WS-TOTAL-NTWRK-CNTR                        11480000
TCKTMP*          DISPLAY ' '                                            11490000
TCKTMP*          DISPLAY 'REPLACED NTWRK WITH VFNDSRVS ' WS-FS-NTWRK-CD 11500000
TCKTMP*           ' FOR ' FMT-AT-ADP-CL-NO                              11510000
TCKTMP*        ' ' ACAT-CONTROL-NBR OF DCLVTRNFR                        11520000
TCKTMP*        ' SEQ NBR ' ASSET-SEQ-NBR OF DCLVASSET                   11530000
TCK001        ELSE                                                      11540000
TCK001           IF WS-FR-NTWRK-CD > SPACE                              11550000
TCK001              MOVE WS-FR-NTWRK-CD TO FMT-NTWRK-CNTL-CD            11560000
TCK001              ADD +1 TO WS-TOTAL-NTWRK-CNTR                       11570000
TCK001           ELSE                                                   11580000
TCK001              MOVE WS-B1-NTWRK-CD TO FMT-NTWRK-CNTL-CD            11590000
TCK001              ADD +1 TO WS-TOTAL-NTWRK-CNTR                       11600000
TCKTMP*             DISPLAY ' '                                         11610000
TCKTMP*             DISPLAY 'REPLACED NTWRK WITH B1 ' FMT-NTWRK-CNTL-CD 11620000
TCKTMP*                 ' FOR ' FMT-AT-ADP-CL-NO                        11630000
TCKTMP*              ' ' ACAT-CONTROL-NBR OF DCLVTRNFR                  11640000
TCKTMP*              ' SEQ NBR ' ASSET-SEQ-NBR OF DCLVASSET             11650000
TCK001           END-IF                                                 11660000
TCK001        END-IF                                                    11670000
TCK002     END-IF.                                                      11680000
                                                                        11690000
TCKTMP***  DISPLAY ' FMT-NTWRK-CNTL-CD = '  FMT-NTWRK-CNTL-CD.          11700000
TCK001     IF FMT-AT-CLNT-IS-RECEIVER   AND                             11710000
TCK001        FMT-NTWRK-CNTL-CD NOT > SPACE                             11720000
TCKTMP        DISPLAY ' '                                               11730000
TCKTMP        DISPLAY ' !!!!!!!!!!! W A R N I N G !!!!!!!!!!!!!'        11740000
TCKTMP        DISPLAY ' NET WORK CONTROL INDICATOR HAS NO VALUE '       11750000
TCKTMP               ' FOR ' FMT-AT-ADP-CL-NO                           11760000
TCKTMP            ' ' ACAT-CONTROL-NBR OF DCLVTRNFR                     11770000
TCKTMP            ' SEQ NBR ' ASSET-SEQ-NBR OF DCLVASSET                11780000
TCK001        DISPLAY ' '                                               11790000
TCK001     END-IF.                                                      11800000
TCK001                                                                  11810000
TCK001     MOVE +0 TO SQLCODE.                                          11820000
TCK001                                                                  11830000
TCK001 FORMAT-FUNDSRV-EXIT.                                             11840000
TCK001     EXIT.                                                        11850000
TCK001***************************************************************** 11860000
           EJECT                                                        11870000
YH0001 SEARCH-ORIG-STTL-DATE.                                           11880000
      **********************                                            11890000
                                                                        11900000
           INITIALIZE DCLVTRNHSTY                                       11910000
           EXEC SQL                                                     11920000
              SELECT                                                    11930000
                ACAT_CONTROL_NBR                                        11940000
               ,STTLM_DT                                                11950000
              INTO                                                      11960000
                :DCLVTRNHSTY.ACAT-CONTROL-NBR                           11961000
               ,:DCLVTRNHSTY.STTLM-DT                                   11962000
                 FROM VTRNHSTY                                          11963000
              WHERE  CLIENT_NBR       = :DCLVTRNFR.CLIENT-NBR           11964000
                AND  ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CNTL-ASTD-NBR   11965000
           END-EXEC.                                                    11966000
                                                                        11967000
           IF SQLCODE = +0                                              11968000
              MOVE STTLM-DT  OF  DCLVTRNHSTY                            11969000
                                        TO FMT-STTLM-ASCTD-DT           11969100
           ELSE                                                         11969200
              MOVE ' '                  TO FMT-STTLM-ASCTD-DT           11969300
           END-IF.                                                      11969400
                                                                        11969500
       SEARCH-ORIG-STTL-DATE-EXIT.                                      11969600
           EXIT.                                                        11969700
                                                                        11969800
LRM021 SEARCH-ORIG-STTL-LCTN.                                           11969900
      **********************                                            11970000
                                                                        11970100
           IF SECURITY-ADP-NBR OF DCLVASSET NOT = SPACES                11970300
              EXEC SQL                                                  11970400
                SELECT                                                  11970500
                  STTLM_LCTN_CD                                         11970600
                INTO                                                    11970700
                  :DCLVASTHSTY.STTLM-LCTN-CD                            11970800
                 FROM VASTHSTY                                          11970900
              WHERE  CLIENT_NBR       = :DCLVTRNFR.CLIENT-NBR           11971000
                AND  ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CNTL-ASTD-NBR   11971100
                AND  SECURITY_ADP_NBR  = :DCLVASSET.SECURITY-ADP-NBR    11971200
              END-EXEC                                                  11971300
                                                                        11971400
              IF SQLCODE = +0 OR -811                                   11971500
                 MOVE STTLM-LCTN-CD OF DCLVASTHSTY                      11971700
                                        TO FMT-ORIG-STTLM-LCTN-CD       11971800
                 MOVE +0  TO SQLCODE                                    11972000
                 GO TO SEARCH-ORIG-STTL-LCTN-EXIT                       11972100
              END-IF                                                    11972200
           END-IF.                                                      11972300
                                                                        11972400
           IF ISIN-SEC-ISSUE-CD OF DCLVASSET = SPACES                   11972500
              MOVE '50' TO FMT-ORIG-STTLM-LCTN-CD                       11972600
              MOVE +0  TO SQLCODE                                       11972700
              GO TO SEARCH-ORIG-STTL-LCTN-EXIT                          11972800
           END-IF.                                                      11972900
                                                                        11973000
           EXEC SQL                                                     11973100
              SELECT                                                    11973200
                STTLM_LCTN_CD                                           11973300
              INTO                                                      11973400
                :DCLVASTHSTY.STTLM-LCTN-CD                              11973500
                 FROM VASTHSTY                                          11974000
              WHERE  CLIENT_NBR       = :DCLVTRNFR.CLIENT-NBR           11974100
                AND  ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CNTL-ASTD-NBR   11974200
                AND  ISIN_SEC_ISSUE_CD = :DCLVASSET.ISIN-SEC-ISSUE-CD   11974300
           END-EXEC.                                                    11974400
                                                                        11974500
           IF SQLCODE = +0 OR -811                                      11974600
              MOVE STTLM-LCTN-CD OF DCLVASTHSTY                         11974700
                                        TO FMT-ORIG-STTLM-LCTN-CD       11974800
           ELSE                                                         11975000
              MOVE '50'                 TO FMT-ORIG-STTLM-LCTN-CD       11975100
           END-IF.                                                      11975200
           MOVE +0  TO SQLCODE.                                         11975300
                                                                        11975400
       SEARCH-ORIG-STTL-LCTN-EXIT.                                      11975500
           EXIT.                                                        11975600
                                                                        11975700
                                                                        11975800
      *******************                                               11975900
       SQL-ERROR-ROUTINE.                                               11976000
      *******************                                               11976100
                                                                        11976200
           DISPLAY 'SQLCODE IS ' SQLCODE.                               11976300
                                                                        11976400
           CALL DSNTIAR               USING  SQLCA                      11976500
                                             WS-DB2-MESSAGE-AREA        11976600
                                             WS-ERR-LINE-LEN            11976700
                                                                        11976800
           DISPLAY ' '                                                  11976900
                                                                        11977000
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                   11977100
              UNTIL WS-ERROR-INDEX GREATER THAN 12                      11977200
                 IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES              11977300
                    DISPLAY '*** ' WS-ERROR-MSG (WS-ERROR-INDEX)        11977400
                 END-IF                                                 11977500
           END-PERFORM                                                  11977600
                                                                        11977700
           DISPLAY ' '                                                  11977800
           DISPLAY '*** PROGRAM IS ABENDING'                            11977900
           DISPLAY ' '                                                  11978000
                                                                        11978100
           EXEC SQL  ROLLBACK  END-EXEC                                 11978200
           CALL ABEND USING ABEND-CODE                                  11979000
                                                                        11980000
           .                                                            11990000
                                                                        12000000
           EJECT                                                        12010000
      *****************                                                 12020000
       INITIAL-ROUTINE.                                                 12030000
      *****************                                                 12040000
                                                                        12050000
           OPEN OUTPUT  PENDING-FILE                                    12060000
                                                                        12070000
DJ0001     DISPLAY 'CAT650DB - PARM-INFO = ' PARM-INFO                  12080000
                                                                        12090000
           MOVE  'CAT650DB'                   TO BPDATES-CALLING-PGM.   12100000
           MOVE  'C'                          TO BPDATES-REQ-TYPE.      12110000
                                                                        12120000
           CALL    BPDATES            USING BPDATES-PARAMETERS.         12130000
                                                                        12140000
ED0002     MOVE BPD-PROC-DATE(1:4) TO WS-TODAY-CCYYMMDD-DB2(1:4)        12150000
ED0002     MOVE '-'                TO WS-TODAY-CCYYMMDD-DB2(5:1)        12160000
ED0002     MOVE BPD-PROC-DATE(5:2) TO WS-TODAY-CCYYMMDD-DB2(6:2)        12170000
ED0002     MOVE '-'                TO WS-TODAY-CCYYMMDD-DB2(8:1)        12180000
ED0002     MOVE BPD-PROC-DATE(7:2) TO WS-TODAY-CCYYMMDD-DB2(9:2)        12190000
ED0002     DISPLAY 'TODAYS DATE DB2 COMPARE ' WS-TODAY-CCYYMMDD-DB2     12200000
                                                                        12210000
******** USE TODAY AND PLUS 1 DATES BELOW; THIS PROGRAM WILL RUN AFTER  12220000
******** DATE CHANGE.                                                   12230000
******** USE TOMORROW AND NEXT PROCESSING DAY FOR CAGE EXTRACT          12240000
LRM004** USE ONLY TOMORROW FOR SHADOW POSTING EXTRACT.                  12250000
           IF PARM-INFO(1 : 8) = 'ACATCAGE'                             12260000
              DISPLAY 'CAT650DB - SETTING CAGE EXTRACT DATES'           12270000
              MOVE BPD-PROC-PLUS-TWO-TD  TO ACAT-PROC-DATE              12280000
              MOVE BPD-PROC-PLUS-TWO-TD  TO  WS-TRADE-PLUS-1            12290000
LRM007        MOVE BPD-PROC-PLUS-ONE-TD  TO  WS-CAGE-MFC-DATE           12300000
           ELSE                                                         12310000
           EVALUATE  TRUE                                               12320000
             WHEN  PARM-ACAT-SPACE                                      12330000
                OR PARM-ACAT-PEND                                       12340000
                OR PARM-ACAT-MARGIN                                     12350000
                   MOVE BPD-PROC-DATE TO  ACAT-PROC-DATE                12360000
                   MOVE BPD-PROC-PLUS-ONE-TD  TO  WS-TRADE-PLUS-1       12370000
LRM004       WHEN  PARM-ACAT-SHADOW                                     12380000
LRM031       WHEN  PARM-ACAT-FUNDSERV                                   12381001
LRM004             MOVE BPD-PROC-PLUS-ONE-TD TO ACAT-PROC-DATE          12390000
LRM004                                            WS-TRADE-PLUS-1       12400000
             WHEN  PARM-ACAT-DATE  NUMERIC                              12410000
                   MOVE  PARM-ACAT-DATE       TO  DATE-WORK-YYMMDD      12420000
                   IF DATE-WORK-YYMMDD (1:2) > '80'                     12430000
                      MOVE '19'               TO  DATE-WORK-CC          12440000
                   ELSE                                                 12450000
                      MOVE '20'               TO  DATE-WORK-CC          12460000
                   END-IF                                               12470000
                   MOVE  DATE-WORK-AREA       TO  ACAT-PROC-DATE        12480000
                   MOVE  ACAT-PROC-DATE (5:4) TO  REQ-DATE (1:4)        12490000
                   MOVE  ACAT-PROC-DATE (3:2) TO  REQ-DATE (5:2)        12500000
                   MOVE  SPACES               TO  REQ-AREA              12510000
                   CALL    GENDATZ          USING REQUEST-DATA          12520000
                                                  LINK-DATES-AREA       12530000
                   IF  REQ-RC  >  1                                     12540000
                       DISPLAY 'ZGENDATZ FAILED USING ACATPRM PARM DATE'12550000
                       MOVE 1000 TO ABEND-CODE                          12560000
                       CALL  ABEND          USING ABEND-CODE            12570000
                   END-IF                                               12580000
                   MOVE BPD-PROC-PLUS-ONE-TD  TO  WS-TRADE-PLUS-1       12590000
             WHEN  OTHER                                                12600000
                   DISPLAY 'USERS ACAT PARM DATE NOT NUMERIC YYMMDD'    12610000
                   MOVE 2000 TO ABEND-CODE                              12620000
                   CALL  ABEND              USING ABEND-CODE            12630000
           END-EVALUATE.                                                12640000
                                                                        12650000
           MOVE ACAT-PROC-DATE(1 : 4) TO  WS-ACAT-STTLM-DATE(1 : 4).    12660000
           MOVE '-'                   TO  WS-ACAT-STTLM-DATE(5 : 1)     12670000
                                          WS-ACAT-STTLM-DATE(8 : 1)     12680000
           MOVE ACAT-PROC-DATE(5 : 2) TO  WS-ACAT-STTLM-DATE(6 : 2).    12690000
           MOVE ACAT-PROC-DATE(7 : 2) TO  WS-ACAT-STTLM-DATE(9 : 2).    12700000
                                                                        12710000
           MOVE WS-TRADE-PLUS-1(1 : 4) TO WS-CAGE-STTLM-DATE(1 : 4).    12720000
           MOVE '-'                    TO WS-CAGE-STTLM-DATE(5 : 1)     12730000
                                          WS-CAGE-STTLM-DATE(8 : 1)     12740000
           MOVE WS-TRADE-PLUS-1(5 : 2) TO WS-CAGE-STTLM-DATE(6 : 2).    12750000
           MOVE WS-TRADE-PLUS-1(7 : 2) TO WS-CAGE-STTLM-DATE(9 : 2).    12760000
                                                                        12770000
LRM007     MOVE WS-CAGE-MFC-DATE(1 : 4) TO WS-CAGE-STTLM-MFC(1 : 4).    12780000
LRM007     MOVE '-'                     TO WS-CAGE-STTLM-MFC(5 : 1)     12790000
LRM007                                     WS-CAGE-STTLM-MFC(8 : 1)     12800000
LRM007     MOVE WS-CAGE-MFC-DATE(5 : 2) TO WS-CAGE-STTLM-MFC(6 : 2).    12810000
LRM007     MOVE WS-CAGE-MFC-DATE(7 : 2) TO WS-CAGE-STTLM-MFC(9 : 2).    12820000
                                                                        12830000
           DISPLAY 'ACAT SETTLE DATE    ' ACAT-PROC-DATE                12840000
               ' ' WS-ACAT-STTLM-DATE.                                  12850000
           DISPLAY 'PROCESS DATE PLUS 1 ' WS-TRADE-PLUS-1               12860000
               ' ' WS-CAGE-STTLM-DATE.                                  12870000
                                                                        12880000
           SET FMT-HEADER-ID    TO TRUE.                                12890000
           SET FMT-HEADER-LIT1  TO TRUE.                                12900000
           SET FMT-HEADER-LIT2  TO TRUE.                                12910000
           SET FMT-HEADER-LIT3  TO TRUE.                                12920000
           MOVE ACAT-PROC-DATE  TO  FMT-BOOK-DATE                       12930000
           MOVE WS-TRADE-PLUS-1 TO  FMT-CAGE-DATE                       12940000
           WRITE PEND-HEADER-RECORD FROM  FMT-HEADER-RECORD.            12950000
                                                                        12960000
ET0002     MOVE ZERO   TO TBL-CNT.                                      12970000
           MOVE SPACES TO B1-TABLE.                                     12980000
           PERFORM  VARYING B1-SUB  FROM 1 BY 1                         12990000
                 UNTIL B1-SUB GREATER 500                               13000000
180600                                                                  13010000
180900       MOVE  ' '                 TO  BH-BROKER-HEADER-INFO        13020000
182400       MOVE  B1-SUB              TO  BH-BROKER-NUMBER-N           13030000
182500       MOVE  '015'               TO  BH-LOGICAL-RECORD-CODE       13040000
182600       MOVE  '434500'            TO  BH-B2-INFO-ID                13050000
182700       CALL   GETB1V           USING BH-BROKER-HEADER-INFO,       13060000
182800                                     BH-ACAT-INFO                 13070000
182900       END-CALL                                                   13080000
183000       IF  BH-ACAT-ACTIVE                                         13090000
ET0002         IF ((BH-BROKER-MINI-MAXI-INDICATOR = PARM-STREAM)        13091000
ET0002         OR (PARM-STREAM = 'Q' OR 'Z'))                           13091100
ET0002           ADD 1 TO TBL-CNT                                       13091200
00200 ** CARD-434613                                                    13091300
00210           MOVE BH-ACAT-MF-REG-NETWRK-CTRL-IND TO                  13091400
183500                       B1-MF-NETWRK-CTRL-IND   (TBL-CNT)          13091500
ET0002          MOVE BH-BROKER-NUMBER-N                                 13091600
ET0002                   TO  B1-CLT-NO               (TBL-CNT)          13091700
ET0002          MOVE BH-BROKER-NAME                                     13091800
ET0002                   TO  B1-CLT-NAME             (TBL-CNT)          13091900
ET0002          MOVE BH-BROKER-OLD-CLEARING-HOUSE (2:4)                 13092000
ET0002                   TO  B1-BKR-CLR-NO           (TBL-CNT)          13093000
ET0002          MOVE BH-BROKER-MINI-MAXI-INDICATOR                      13094000
ET0002                   TO  B1-STREAM               (TBL-CNT)          13095000
ET0002          MOVE BH-BROKER-STATUS                                   13096000
ET0002                   TO  B1-STATUS               (TBL-CNT)          13097000
ET0002          MOVE BH-ACAT-STATUS                                     13098000
ET0002                   TO  B1-ACAT-STATUS          (TBL-CNT)          13099000
LRM030          MOVE BH-ACAT-MF-ACCEP-AMT-BKP-BYPAS                     13099100
LRM030                   TO  B1-MF-ACCEP-AMT-BKP-BYPAS (TBL-CNT)        13099200
TCK001          DISPLAY ' B1 CLIENT ' BH-BROKER-NUMBER-N                13100000
ET0002                  ' STRM '   B1-STREAM      (TBL-CNT)             13110000
ET0002                  ' BRKR '   B1-BKR-CLR-NO  (TBL-CNT)             13120000
ET0002                  ' STATUS ' B1-STATUS      (TBL-CNT)             13130000
ET0002                  ' ACAT '   B1-ACAT-STATUS (TBL-CNT)             13131000
LRM030             ' BYP-FND-AMT ' B1-MF-ACCEP-AMT-BKP-BYPAS (TBL-CNT)  13131100
TCK001                  ' , HAS VALID NETWORK CNTL CD '                 13132000
TCK001                  BH-ACAT-MF-REG-NETWRK-CTRL-IND                  13133000
LRM010          IF B1-SUB = 235                                         13134000
LRM010             PERFORM SAVE-WM-ACCOUNT-RTN                          13135000
LRM010          END-IF                                                  13136000
ET0002         END-IF                                                   13137000
             END-IF                                                     13138000
           END-PERFORM.                                                 13139000
TEST **    DISPLAY 'LOADED B1 TABLE ' B1-TABLE.                         13140000
           EJECT                                                        13150000
LRM010 REPLACE-WM-ACCOUNT-RTN.                                          13160000
LRM010***-------------------------------------------------------------- 13170000
LRM010***   THE FOLLOWING RULES WILL CHANGE WHEN CLIENT RESPONDS WITH   13180000
LRM010***   DETAILS OF SPECIFICALLY WHAT ACCOUNTS CORRESPOND AND HOW    13190000
LRM010***   MANY ACCOUNTS ARE NEEDED.                                   13200000
LRM010***-------------------------------------------------------------- 13210000
LRM010     IF STTLM-LCTN-CD OF DCLVASSET = '35'                         13220000
LRM010     AND WM-OCC-ACCOUNT > SPACES                                  13230000
LRM010        MOVE WM-OCC-ACCOUNT  TO WM-CUSTOMER-ACCOUNT               13240000
LRM010        IF NOT WM-OCC-TI-WRITTEN                                  13250000
LRM010           SET WM-OCC-FOUND TO TRUE                               13260000
LRM010        END-IF                                                    13270000
LRM010     ELSE                                                         13280000
LRM010     IF ASSET-PRC-CTGY-CD OF DCLVASSET = 'FDEB'                   13290000
LRM016     AND (STTLM-LCTN-CD OF DCLVASSET = '25' OR '50')              13300000
LRM010     AND WM-EUROCLEAR-ACCOUNT > SPACES                            13310000
LRM010        MOVE WM-EUROCLEAR-ACCOUNT TO WM-CUSTOMER-ACCOUNT          13320000
LRM010        IF NOT WM-EUROCLEAR-TI-WRITTEN                            13330000
LRM010           SET WM-EUROCLEAR-FOUND TO TRUE                         13340000
LRM010        END-IF                                                    13350000
LRM010     ELSE                                                         13360000
LRM010     IF ASSET-PRC-CTGY-CD OF DCLVASSET = 'FEQU'                   13370000
LRM016     AND (STTLM-LCTN-CD OF DCLVASSET = '25' OR '50')              13380000
LRM010     AND WM-LOCAL-MKT-ACCOUNT > SPACES                            13390000
LRM010        MOVE WM-LOCAL-MKT-ACCOUNT TO WM-CUSTOMER-ACCOUNT          13400000
LRM010        IF NOT WM-LOCAL-MKT-TI-WRITTEN                            13410000
LRM010           SET WM-LOCAL-MKT-FOUND TO TRUE                         13420000
LRM010        END-IF                                                    13430000
LRM010     ELSE                                                         13440000
LRM010     IF ASSET-PRC-CTGY-CD OF DCLVASSET = 'GOVT'                   13450000
LRM016     AND (STTLM-LCTN-CD OF DCLVASSET = '25' OR '50')              13460000
LRM010     AND WM-GOVT-ACCOUNT > SPACES                                 13470000
LRM010        MOVE WM-GOVT-ACCOUNT TO WM-CUSTOMER-ACCOUNT               13480000
LRM010        IF NOT WM-GOVT-TI-WRITTEN                                 13490000
LRM010           SET WM-GOVT-FOUND TO TRUE                              13500000
LRM010        END-IF                                                    13510000
LRM010     ELSE                                                         13520000
LRM010     IF (STTLM-LCTN-CD OF DCLVASSET = '10'                        13530000
LRM010     OR (STTLM-LCTN-CD OF DCLVASSET = '50'                        13540000
LRM010     AND (ASSET-PRC-CTGY-CD OF DCLVASSET = 'MFMM' OR 'MFNM')))    13550000
LRM010     AND WM-INTER-COMPANY-ACCOUNT > SPACES                        13560000
LRM010        MOVE WM-INTER-COMPANY-ACCOUNT TO WM-CUSTOMER-ACCOUNT      13570000
LRM010        IF NOT WM-FUND-TI-WRITTEN                                 13580000
LRM010           SET WM-FUND-FOUND TO TRUE                              13590000
LRM010        END-IF                                                    13600000
LRM010     ELSE                                                         13610000
LRM010     IF STTLM-LCTN-CD OF DCLVASSET = '40'                         13620000
LRM010     AND WM-CASH-ACCOUNT > SPACES                                 13630000
LRM010        MOVE WM-CASH-ACCOUNT TO WM-CUSTOMER-ACCOUNT               13640000
LRM010        IF NOT WM-CASH-TI-WRITTEN                                 13650000
LRM010           SET WM-CASH-FOUND TO TRUE                              13660000
LRM010        END-IF                                                    13670000
LRM010     ELSE                                                         13680000
LRM010     IF WM-OTHER-ACCOUNT > SPACES                                 13690000
LRM010        MOVE WM-OTHER-ACCOUNT TO WM-CUSTOMER-ACCOUNT              13700000
LRM010        IF NOT WM-OTHER-TI-WRITTEN                                13710000
LRM010           SET WM-OTHER-FOUND TO TRUE                             13720000
LRM010        END-IF                                                    13730000
LRM010     ELSE                                                         13740000
LRM010     MOVE WM-DEFAULT-ACCOUNT TO WM-CUSTOMER-ACCOUNT               13750000
LRM010     IF NOT WM-DEFAULT-TI-WRITTEN                                 13760000
LRM010        SET WM-DEFAULT-FOUND TO TRUE                              13770000
LRM010     END-IF.                                                      13780000
LRM010 SAVE-WM-ACCOUNT-RTN.                                             13790000
LRM010     PERFORM VARYING WM-SUB FROM 1 BY 1                           13800000
LRM010        UNTIL WM-SUB > BH-ACAT-WM-OMNI-BOOKING-NO                 13810000
LRM010        IF BH-ACAT-WM-OMNI-BOOKING-ASSET(WM-SUB) = 'EUROCL'       13820000
LRM010           MOVE BH-ACAT-WM-OMNI-BOOKING-ACCT(WM-SUB)              13830000
LRM010                          TO WM-EUROCLEAR-ACCOUNT                 13840000
LRM010           DISPLAY 'CL235 EUROCLEAR AC  ' WM-EUROCLEAR-ACCOUNT    13850000
LRM010            ' ' BH-ACAT-WM-OMNI-BOOKING-ASSET(WM-SUB)             13860000
LRM010        ELSE                                                      13870000
LRM010        IF BH-ACAT-WM-OMNI-BOOKING-ASSET(WM-SUB) = 'LCLMKT'       13871000
LRM010           MOVE BH-ACAT-WM-OMNI-BOOKING-ACCT(WM-SUB)              13872000
LRM010                          TO WM-LOCAL-MKT-ACCOUNT                 13873000
LRM010           DISPLAY 'CL235 LOCAL MKT AC  ' WM-LOCAL-MKT-ACCOUNT    13874000
LRM010            ' ' BH-ACAT-WM-OMNI-BOOKING-ASSET(WM-SUB)             13875000
LRM010        ELSE                                                      13876000
LRM010        IF BH-ACAT-WM-OMNI-BOOKING-ASSET(WM-SUB) = 'CASH  '       13877000
LRM010           MOVE BH-ACAT-WM-OMNI-BOOKING-ACCT(WM-SUB)              13878000
LRM010                          TO WM-CASH-ACCOUNT                      13879000
LRM010           DISPLAY 'CL235 CASH AC       ' WM-CASH-ACCOUNT         13880000
LRM010            ' ' BH-ACAT-WM-OMNI-BOOKING-ASSET(WM-SUB)             13890000
LRM010        ELSE                                                      13900000
LRM010        IF BH-ACAT-WM-OMNI-BOOKING-ASSET(WM-SUB) = 'CASH  '       13901000
LRM010           MOVE BH-ACAT-WM-OMNI-BOOKING-ACCT(WM-SUB)              13902000
LRM010                          TO WM-CASH-ACCOUNT                      13903000
LRM010           DISPLAY 'CL235 CASH AC       ' WM-CASH-ACCOUNT         13904000
LRM010            ' ' BH-ACAT-WM-OMNI-BOOKING-ASSET(WM-SUB)             13905000
LRM010        ELSE                                                      13906000
LRM010        IF BH-ACAT-WM-OMNI-BOOKING-ASSET(WM-SUB) = 'GOVT  '       13907000
LRM010           MOVE BH-ACAT-WM-OMNI-BOOKING-ACCT(WM-SUB)              13908000
LRM010                          TO WM-GOVT-ACCOUNT                      13909000
LRM010           DISPLAY 'CL235 GOVT AC       ' WM-GOVT-ACCOUNT         13910000
LRM010            ' ' BH-ACAT-WM-OMNI-BOOKING-ASSET(WM-SUB)             13920000
LRM010        ELSE                                                      13930000
LRM010        IF BH-ACAT-WM-OMNI-BOOKING-ASSET(WM-SUB) = 'OCC   '       13940000
LRM010           MOVE BH-ACAT-WM-OMNI-BOOKING-ACCT(WM-SUB)              13950000
LRM010                          TO WM-OCC-ACCOUNT                       13960000
LRM010           DISPLAY 'CL235 OPTION AC     ' WM-OCC-ACCOUNT          13970000
LRM010            ' ' BH-ACAT-WM-OMNI-BOOKING-ASSET(WM-SUB)             13980000
LRM010        ELSE                                                      13990000
LRM010        IF BH-ACAT-WM-OMNI-BOOKING-ASSET(WM-SUB) = 'INCMPY'       14000000
LRM010           MOVE BH-ACAT-WM-OMNI-BOOKING-ACCT(WM-SUB)              14010000
LRM010                          TO WM-INTER-COMPANY-ACCOUNT             14020000
LRM010           DISPLAY 'CL235 INNER CMPY AC ' WM-INTER-COMPANY-ACCOUNT14030000
LRM010            ' ' BH-ACAT-WM-OMNI-BOOKING-ASSET(WM-SUB)             14040000
LRM010        ELSE                                                      14050000
LRM010        IF BH-ACAT-WM-OMNI-BOOKING-ASSET(WM-SUB) = 'OTHER '       14060000
LRM010           MOVE BH-ACAT-WM-OMNI-BOOKING-ACCT(WM-SUB)              14070000
LRM010                          TO WM-OTHER-ACCOUNT                     14080000
LRM010           DISPLAY 'CL235 OTHER ACCOUNT ' WM-OTHER-ACCOUNT        14090000
LRM010            ' ' BH-ACAT-WM-OMNI-BOOKING-ASSET(WM-SUB)             14100000
LRM010        ELSE                                                      14110000
LRM012        IF BH-ACAT-WM-OMNI-BOOKING-ASSET(WM-SUB) = 'PEND  '       14120000
LRM012           CONTINUE                                               14121000
LRM012        ELSE                                                      14122000
LRM010           DISPLAY 'UNKNOWN ASSET CATEGORY ON B1 CARD 434692 '    14123000
LRM010            ' ' BH-ACAT-WM-OMNI-BOOKING-ASSET(WM-SUB)             14124000
LRM010            ' ' BH-ACAT-WM-OMNI-BOOKING-ACCT(WM-SUB)              14125000
LRM010        END-IF END-IF END-IF END-IF END-IF END-IF END-IF END-IF   14126000
LRM011        END-IF                                                    14127000
LRM010     END-PERFORM.                                                 14128000
                                                                        14129000
           EJECT                                                        14130000
      ****************                                                  14140000
       ENDJOB-ROUTINE.                                                  14150000
      ****************                                                  14160000
                                                                        14170000
           CLOSE  PENDING-FILE                                          14180000
                                                                        14190000
           DISPLAY ' '                                                  14200000
           DISPLAY '   DB2 INPUT TOTALS'                                14210000
           DISPLAY '   -----------------'                               14220000
           DISPLAY 'NUMBER OF TI RECORDS: ' WS-TOTAL-TI-REC-CNTR        14230000
           DISPLAY 'NUMBER OF AT RECORDS: ' WS-TOTAL-AT-REC-CNTR        14231000
           DISPLAY 'NUMBER OF OP RECORDS: ' WS-TOTAL-OP-REC-CNTR        14232000
                               ' NOT-FND: ' WS-TOTAL-OP-NOT-FND         14233000
           DISPLAY 'NUMBER OF MF RECORDS: ' WS-TOTAL-MF-REC-CNTR        14234000
                               ' NOT-FND: ' WS-TOTAL-MF-NOT-FND         14235000
           DISPLAY 'NUMBER OF FR RECORDS: ' WS-TOTAL-FR-REC-CNTR        14236000
                               ' NOT-FND: ' WS-TOTAL-FR-NOT-FND         14237000
TCK001     DISPLAY 'NUMBER OF FS RECORDS: ' WS-TOTAL-FS-REC-CNTR        14238000
TCK001                         ' NOT-FND: ' WS-TOTAL-FS-NOT-FND         14239000
TCK001     DISPLAY 'NUMBER OF VALUE FREE: ' WS-TOTAL-VALFRE-CNTR        14240000
LRM030     DISPLAY ' APPROVED FUNDS FREE: ' WS-TOTAL-APRFND-CNTR        14241000
TCK001     DISPLAY 'NUMBER OF REPLACED NTWRK CNTL: '                    14250000
TCK001                                      WS-TOTAL-NTWRK-CNTR         14260000
           DISPLAY ' '                                                  14270000
           DISPLAY 'PEND FILE RECORDS   : ' PENDFILE-REC-CNTR           14280000
                                                                        14290000
           DISPLAY ' '                                                  14300000
           DISPLAY '***************************'                        14310000
           DISPLAY '* END OF CAT650DB PROGRAM *'                        14320000
           DISPLAY '***************************'                        14330000
           DISPLAY ' '.                                                 14340000
