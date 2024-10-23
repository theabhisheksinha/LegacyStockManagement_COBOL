000001* PDX    - CAT31    C0296621 06/07/10 16:23:26 TBLAMUR            00001000
LRM006* SSR 71810 REPORT FOREIGN FEE                                    00001000
000001* PDX    - CAT31    C0249006 06/29/07 12:05:01 TBDOJUN            00001000
DJ0004* SSR 47339 SUPPORT DUALLY LISTED SECURITIES                      00001000
DJ0004*           POPULATE GETMSD-CLIENT-PL2 WHEN CALLING GETMSD        00001000
000001* PDX    - CAT31    C0226568 11/11/05 15:44:47 TBEDTAK            00001000
ET0001* SSR 31952 FIX WHERE REPORTED FEES DO NOT MATCH WITH BOOKED FEES.00001000
000001* PDX    - CAT31    C0194849 08/25/03 10:24:46 TBLAMUR            00001000
000001* PDX    - CAT31    C0182051 03/11/03 11:14:28 TBLAMUR            00001000
LRM002* SSR 0029711 MARGIN RETOOL CALL GETVBAL                                  
000001* PDX    - CAT31    C0187527 03/07/03 02:31:10 TBLAMUR            00001000
000001* PDX    - CAT31    C0158444 05/29/01 10:47:57 TBLAMUR            00001000
000001* PDX    - CAT31    C0154377 02/14/01 08:58:17 TBLAMUR            00001000
LRM001* PMR01649945 INCREASE MNY-MKT TABLE TO 5000                              
000001* PDX    - CAT31    C0143243 06/09/00 04:27:53 TBDOJUN            00001000
DJ0003* PMR01506259 INCREASE SPAD-MSG TABLE TO 500                              
000001* PDX    - CAT31    C0129261 08/24/99 15:29:01 TBDOJUN            00001000
      * DJ0002 - ALPHA BRANCH AND ACCOUNT                               00001000
000001* PDX    - CAT31    C0130324 08/24/99 05:47:59 TBDOJUN            00001000
DJ0001* PMR1345597 DJ0001 INCREASE OPTION TABLE SIZE TO 500             00001000
000001* PDX    - CAT31    C0112856 07/09/98 13:00:59 TBELPIN            00001000
000001* PDX    - CAT31    C0112117 06/08/98 17:45:15 TBDOJUN            00001000
000001* PMR1084774 FIX BALNC READ ERROR X'04' INVALID LENGTH            00001000
000001*            LAST RECORD ON FILE IS HIGH-VALUE KEY, LRECL = 100   00001000
000001* PDX    - CAT31    C0110030 04/15/98 17:01:47 TBDOJUN            00001000
      * PMR1059927 INCREASE SPAD-MSG TABLE TO 200                               
000001* PDX    - CAT31    C0109386 03/30/98 18:22:40 TQCHSCA            00001000
      * 109386 - FIX PROBLEM WITH TRANSFER FEE DISPLACEMENTS                    
000001* PDX    - CAT31    C0106087 01/26/98 11:21:51 TBELPIN            00001000
000001* PDX    - CAT31    C0105623 01/09/98 16:15:04 TBDOJUN            00001000
000001*        - SSR#1659600 - DISPLAY REORG TYPE ON REPORT             CAT31   
000001*        - CONVERT PDX TO DB2SRC TO USE DB2 MSD REORG TABLE       CAT31   
000001* PDX    - CAT31    C0102808 10/24/97 09:00:07 TQCHSCA            CAT31   
000001* PDX    - CAT31    C0102492 10/16/97 09:23:35 TQCHSCA            CAT31   
000001* PDX    - CAT31    C0101898 10/07/97 14:42:01 TQCHSCA            CAT31   
000001* PDX    - CAT31    C0100514 09/24/97 12:13:43 TQCHSCA            CAT31   
000001* PDX    - CAT31    C0099711 09/11/97 10:09:27 TQCHSCA            CAT31   
000001* PDX    - CAT31    C0100193 08/28/97 16:23:13 TBEDLEW            CAT31   
000001* PDX    - CAT31    C0099363 08/21/97 14:44:28 TQCHSCA            CAT31   
000001* PDX    - CAT31    C0099174 07/29/97 18:56:43 TQCHSCA            CAT31   
000001* PDX    - CAT31    C0098390 07/29/97 12:33:15 TBEDLEW            CAT31   
000001* PDX    - CAT31    C0098329 07/24/97 10:05:35 TQCHSCA            CAT31   
000001* PDX    - CAT31    C0097565 06/30/97 16:01:49 TBEDLEW            CAT31   
000001* PDX    - CAT31    C0096674 06/23/97 16:27:35 TBEDLEW            CAT31   
000001* PDX    - CAT31    C0095941 06/04/97 10:24:34 TBEDLEW            CAT31   
000001* PDX    - CAT31    C0095703 05/15/97 12:19:38 TBEDLEW            CAT31   
000001* PDX    - CAT31    C0092687 05/08/97 16:40:21 TBEDLEW            CAT31   
       IDENTIFICATION DIVISION.                                         CAT31   
       PROGRAM-ID.  CAT31.                                              CAT31   
      ***************************************************************** CAT31   
      *04/98                                                          * CAT31   
      *    THIS PROGRAM USES A DB2 FILE                               * CAT31   
      *    THE PDX LIBTYPE IS DB2SRC                                  * CAT31   
      *    PROGRAM MUST BE BINDED AFTER COMPILING                     * CAT31   
      *                                                                *        
      *    06/28/98  ENP 112719     - USE EXPANDED MSD STRIKE PRICE    *        
      *                                                                *        
      ***************************************************************** CAT31   
                                                                        CAT31   
       ENVIRONMENT DIVISION.                                            CAT31   
                                                                        CAT31   
       INPUT-OUTPUT SECTION.                                            CAT31   
       FILE-CONTROL.                                                    CAT31   
                                                                        CAT31   
           SELECT ACAT-DELIVER-FILE                                     CAT31   
                                   ASSIGN ACATDLVR.                     CAT31   
                                                                        CAT31   
           SELECT REG-OPT-FILE                                          CAT31   
                                   ASSIGN REGOPV                        CAT31   
                                   ORGANIZATION INDEXED                 CAT31   
                                   ACCESS MODE RANDOM                   CAT31   
                                   RECORD KEY IS REG-OPT-KEY-AREA       CAT31   
                                   FILE STATUS IS                       CAT31   
                                       REG-FILE-STATUS.                 CAT31   
                                                                        CAT31   
           SELECT SPAD-FILE    ASSIGN  SPADFL                           CAT31   
                                   ACCESS MODE  IS DYNAMIC              CAT31   
                                   ORGANIZATION IS INDEXED              CAT31   
                                   RECORD KEY   IS SPAD-VSAM-KEY        CAT31   
                                   FILE STATUS  IS SPAD-FILE-STATUS.    CAT31   
                                                                        CAT31   
           SELECT ANNU-FILE    ASSIGN  ANNUFL                           CAT31   
                                   ACCESS MODE  IS RANDOM               CAT31   
                                   ORGANIZATION IS INDEXED              CAT31   
                                   RECORD KEY   IS ANCV-KEY             CAT31   
                                   FILE STATUS  IS ANNU-FILE-STATUS.    CAT31   
                                                                        CAT31   
           SELECT POSITION-FILE    ASSIGN POSFILE.                      CAT31   
                                                                        CAT31   
           SELECT REPORT-FILE      ASSIGN ACATRPT.                      CAT31   
                                                                        CAT31   
           SELECT SORT-FILE        ASSIGN  TO  SORTWK01.                CAT31   
                                                                        CAT31   
       DATA DIVISION.                                                   CAT31   
       FILE SECTION.                                                    CAT31   
       FD  ACAT-DELIVER-FILE                                            CAT31   
           RECORDING MODE IS V                                          CAT31   
           LABEL RECORDS ARE STANDARD                                   CAT31   
           BLOCK CONTAINS 0 RECORDS.                                    CAT31   
       COPY ACATDELV.                                                   CAT31   
                                                                        CAT31   
       FD  REG-OPT-FILE.                                                CAT31   
       01  REGISTRATION-OPT-REC.                                        CAT31   
       COPY BNWREGOP.                                                   CAT31   
                                                                        CAT31   
       FD  ANNU-FILE.                                                   CAT31   
       COPY BAN1C1R.                                                    CAT31   
                                                                        CAT31   
       FD  SPAD-FILE                                                    CAT31   
           RECORD CONTAINS 25 TO 120                                    CAT31   
           LABEL RECORDS ARE STANDARD.                                  CAT31   
       01  SPAD-VSAM-RECORD.                                            CAT31   
           10 SPAD-VSAM-KEY.                                            CAT31   
              12 SPM-CLT                       PIC 9(3)    COMP-3.      CAT31   
              12 SPM-BR                        PIC X(3).                CAT31   
              12 SPM-DASH                      PIC X.                   CAT31   
              12 SPM-ACCT                      PIC X(5).                CAT31   
              12 FILLER                        PIC X(12).               CAT31   
           10 FILLER                           PIC X(97).               CAT31   
       01  SPAD-REC-1                          PIC X(25).               CAT31   
       01  SPAD-REC-2                          PIC X(88).               CAT31   
       01  SPAD-REC-3                          PIC X(31).               CAT31   
                                                                        CAT31   
       FD  POSITION-FILE                                                CAT31   
           RECORDING MODE IS V                                          CAT31   
           LABEL RECORDS STANDARD                                       CAT31   
           BLOCK CONTAINS 0 RECORDS.                                    CAT31   
       01  POS-REC                    PIC X(230).                       CAT31   
                                                                        CAT31   
       FD  REPORT-FILE                                                  CAT31   
           RECORDING MODE IS F                                          CAT31   
           LABEL RECORDS STANDARD                                       CAT31   
           BLOCK CONTAINS 0 RECORDS                                     CAT31   
           RECORD CONTAINS 143 CHARACTERS.                              CAT31   
       01  REPORT-REC                  PIC X(143).                      CAT31   
                                                                        CAT31   
       SD  SORT-FILE.                                                   CAT31   
       01  SORT-REC.                                                    CAT31   
           05  S-CLIENT                PIC 9(03).                       CAT31   
           05  S-CONTROLLER            PIC 9(03).                       CAT31   
           05  S-BRANCH                PIC X(03).                       CAT31   
           05  S-ACCOUNT               PIC X(05).                       CAT31   
           05  S-CUSIP                 PIC X(09).                       CAT31   
           05  S-PROCESS-CODE          PIC X.                           CAT31   
           05  S-TRAN-TYPE             PIC X(02).                       CAT31   
LRM006     05  FILLER                  PIC X(498).                      CAT31   
                                                                        CAT31   
      ****************************************************************  CAT31   
           EJECT                                                        CAT31   
       WORKING-STORAGE SECTION.                                         CAT31   
DJ0002     COPY PDXIDCOB.                                               CAT31   
           COPY STUBCPY.                                                        
           03  ZCHKDGT                    PIC X(08) VALUE 'ZCHKDGT'.    CAT31   
       01  GETVBAL                          PIC X(08) VALUE 'ZGETVBAL'.         
           COPY GETVBALC REPLACING ==:GETVBAL:== BY ==GETVBAL==.                
           COPY CUSBALRE REPLACING ==:BAL:==     BY ==BAL==.                    
           COPY ACBALALP.                                                       
           COPY BVHEADER.                                                       
           COPY BVTRILER.                                                       
       01  FILE-STATUS-FIELDS.                                          CAT31   
           05  REG-FILE-STATUS            PIC XX.                       CAT31   
               88  REG-FILE-INVALID-KEY         VALUE '20' THRU '29'.   CAT31   
           05  ACAT-FILE-STATUS           PIC XX.                       CAT31   
               88  IO-ACTION-OK               VALUE '00'  '97'.         CAT31   
               88  ACAT-FILE-AT-END           VALUE '10'.               CAT31   
               88  ACAT-INVALID-KEY           VALUE '20' THRU '29'.     CAT31   
           05  BALNC-FILE-STATUS          PIC XX.                       CAT31   
               88  BALNC-FILE-OK              VALUE '00'.               CAT31   
               88  BALNC-OPEN-OK              VALUE '00' '05' '97'.     CAT31   
               88  BALNC-ENDFILE              VALUE '10'.               CAT31   
               88  BALNC-NOTFOUND             VALUE '23'.               CAT31   
           05  SPAD-FILE-STATUS           PIC XX.                       CAT31   
               88  SPAD-FILE-OK               VALUE '00'.               CAT31   
               88  SPAD-OPEN-OK               VALUE '00' '05' '97'.     CAT31   
               88  SPAD-ENDFILE               VALUE '10'.               CAT31   
               88  SPAD-NOTFOUND              VALUE '23'.               CAT31   
           05  ANNU-FILE-STATUS           PIC XX.                       CAT31   
               88  ANNU-FILE-OK               VALUE '00'.               CAT31   
               88  ANNU-OPEN-OK               VALUE '00' '05' '97'.     CAT31   
               88  ANNU-ENDFILE               VALUE '10'.               CAT31   
               88  ANNU-NOTFOUND              VALUE '23'.               CAT31   
       01  BALNC-FILE-CODE.                                             CAT31   
           05  BALNC-REC-CODE     COMP    PIC S9(4).                    CAT31   
           05  BALNC-FUNC-CODE    COMP    PIC S9(4).                    CAT31   
           05  BALNC-FDBK-CODE    COMP    PIC S9(4).                    CAT31   
                                                                        CAT31   
       01  WORK-FIELDS.                                                 CAT31   
           05  PGM-NME                 PIC X(5)  VALUE 'CAT31'.         CAT31   
           05  WS-SAVE-CLIENT          PIC 9(3)  VALUE ZERO.            CAT31   
           05  WS-BROKER-CLEARING-NUM  PIC XXXX.                        CAT31   
           05  WS-CLIENT-NAME          PIC X(30).                       CAT31   
           05  CLIENT-STREAM           PIC X.                           CAT31   
           05  WS-PAGE                 PIC 9(7) VALUE ZERO.             CAT31   
           05  PAGE-ADV                PIC 9.                           CAT31   
           05  WS-TEST-FIELD           PIC X(9).                        CAT31   
           05  WS-TEST-POSITION REDEFINES WS-TEST-FIELD                 CAT31   
                                       PIC S9(12)V9(5) COMP-3.          CAT31   
           05  WS-TEST-AMOUNT   REDEFINES WS-TEST-POSITION              CAT31   
                                       PIC S9(15)V9(2) COMP-3.          CAT31   
      *   WORK FIELDS FOR USING CLIENT, BRANCH NUMBERS AS NUMERICS      CAT31   
           05  WS-CLIENT-NO.                                            CAT31   
               10  WS-CLIENT-NO-A      PIC XXX.                         CAT31   
               10  WS-CLIENT-NO-N  REDEFINES WS-CLIENT-NO-A PIC 999.    CAT31   
           05  CLIENT-SUB              PIC 999 COMP-3 VALUE 0.          CAT31   
           05  AD-SUB                  PIC 999        VALUE 0.          CAT31   
           05  B1-SUB                  PIC 999 COMP-3 VALUE 0.          CAT31   
           05  B1-SUB1                 PIC 999 COMP-3 VALUE 0.          CAT31   
           05  B1-SUB1-SVE             PIC 999 COMP-3 VALUE 0.          CAT31   
           05  B1-SUB2                 PIC 999 COMP-3 VALUE 0.          CAT31   
           05  B1-SUB2-SVE             PIC 999 COMP-3 VALUE 0.          CAT31   
           05  B3-SUB                  PIC 999 COMP-3 VALUE 0.          CAT31   
           05  B4-SUB                  PIC 999 COMP-3 VALUE 0.          CAT31   
           05  B5-SUB                  PIC 999 COMP-3 VALUE 0.          CAT31   
           05  B6-SUB                  PIC 999 COMP-3 VALUE 0.          CAT31   
           05  B7-SUB                  PIC 999 COMP-3 VALUE 0.          CAT31   
           05  B8-SUB                  PIC 999 COMP-3 VALUE 0.          CAT31   
           05  B9-SUB                  PIC 999 COMP-3 VALUE 0.          CAT31   
           05  SP-SUB                  PIC 999 COMP-3 VALUE 0.          CAT31   
           05  OPT-SUB                 PIC 999 COMP-3 VALUE 0.          CAT31   
           05  M1-SUB                  PIC 999 COMP-3 VALUE 0.          CAT31   
           05  M2-SUB                  PIC 999 COMP-3 VALUE 0.          CAT31   
           05  MO-SUB                  PIC 999 COMP-3 VALUE 0.          CAT31   
           05  PR-SUB                  PIC 99         VALUE 0.          CAT31   
           05  I-SUB                   PIC 999 COMP-3 VALUE 0.          CAT31   
           05  MMS-SUB                 PIC 9999 COMP-3 VALUE 0.         CAT31   
           05  PRT-SUB                 PIC 9999 COMP-3 VALUE 0.         CAT31   
           05  B11-SUB                 PIC 999 COMP-3 VALUE 0.          CAT31   
           05  B1-TBL-CNT              PIC 999 COMP-3 VALUE 0.          CAT31   
           05  B1-TABLE-SIZE           PIC 999 COMP-3 VALUE ZERO.       CAT31   
           05  IDX-INP                 PIC 9(4) COMP.                   CAT31   
           05  CLIENT-KEY              PIC 999 VALUE ZERO.              CAT31   
           05  WS-CONTROLLER           PIC 999 VALUE ZERO.              CAT31   
           05  LINECNT                 PIC 999 VALUE 99.                CAT31   
           05  PAGECNT                 PIC 999 VALUE ZERO.              CAT31   
           05  CASH-BAL                PIC 9(9)V99 COMP-3  VALUE ZERO.  CAT31   
           05  MINUS-ONE               PIC S9(4) COMP VALUE -1.         CAT31   
           05  ABEND-CODE              PIC S9(4) COMP VALUE ZERO.       CAT31   
           05  SIGNED-MM               PIC S9(3) COMP-3 VALUE ZERO.     CAT31   
      *ABORT AND SPIE CODES                                             CAT31   
           05  ABORT-CODE              PIC S9(4) COMP SYNC VALUE 99.    CAT31   
      * FIELDS FOR MOVING SOME B1 DATA SPEC 9(5) ACTUALLY 9(3)V99       CAT31   
           05  XFER-FEE-IN             PIC 9(5).                        CAT31   
           05  XFER-FEE-ACTUAL REDEFINES XFER-FEE-IN                    CAT31   
                                       PIC 9(3)V99.                     CAT31   
           05  XFER-IND-AREA           PIC X(35).                       CAT31   
           05  FILLER REDEFINES XFER-IND-AREA.                          CAT31   
               10  XFER-IND-TEST OCCURS 35 TIMES                        CAT31   
                                       PIC X.                           CAT31   
           05  T-BR                    PIC X(3).                        CAT31   
           05  FEE-WORK                PIC 9(3)V99 COMP-3 VALUE ZERO.   CAT31   
           05  MAINT-WORK              PIC 9(3)V99 COMP-3 VALUE ZERO.   CAT31   
           05  TOTAL-FEES              PIC 9(5)V99 COMP-3 VALUE ZERO.   CAT31   
           05  TEST-ACCT-IRA-FEE-NO    PIC 9(3)    COMP-3.              CAT31   
           05  TEST-ACCT-IRA-FEES.                                      CAT31   
             07  TEST-ACCT-IRA-FEE-ENT OCCURS 100 TIMES.                CAT31   
               10  TEST-ACCT-IRA-FEE-LO    PIC X(3).                    CAT31   
               10  TEST-ACCT-IRA-FEE-HI    PIC X(3).                    CAT31   
               10  TEST-ACCT-IRA-FEE-AMT   PIC 9(3)V99.                 CAT31   
           05  TEST-ACCT-IRA-CODES     PIC X(35).                       CAT31   
           05  WK-MS-CLASS.                                             CAT31   
               10  WK-MS-CLASS-1       PIC 9      VALUE ZERO.           CAT31   
               10  WK-MS-CLASS-2-5     PIC 9(4)   VALUE ZERO.           CAT31   
               10  WK-MS-CLASS-6-7     PIC 9(2)   VALUE ZERO.           CAT31   
           05  FILLER                  REDEFINES WK-MS-CLASS.           CAT31   
               10  WK-MS-CLASS-1-2-3   PIC 9(3).                        CAT31   
               10  WK-MS-CLASS-4       PIC 9.                           CAT31   
               10  WK-MS-CLASS-5-7     PIC 9(3).                        CAT31   
           05  FILLER                  REDEFINES WK-MS-CLASS.           CAT31   
               10  FILLER              PIC 9.                           CAT31   
               10  WK-MS-CLASS-2       PIC 9.                           CAT31   
               10  WK-MS-CLASS-3-4     PIC 9(2).                        CAT31   
               10  WK-MS-CLASS-5       PIC 9.                           CAT31   
               10  WK-MS-CLASS-6       PIC 9.                           CAT31   
               10  WK-MS-CLASS-7       PIC 9.                           CAT31   
           05  WK-MS-SEC-TYPE-P        PIC 9(5)   COMP-3  VALUE 0.      CAT31   
           05  FILLER                  REDEFINES WK-MS-SEC-TYPE-P.      CAT31   
               10  WK-MS-SEC-TYPE-X    PIC X(2).                        CAT31   
               10  FILLER              PIC 9.                           CAT31   
           05  WK-MS-SEC-TYPE-N        PIC 9(5)   VALUE 0.              CAT31   
           05  FILLER                  REDEFINES WK-MS-SEC-TYPE-N.      CAT31   
               10  WK-MS-SEC-TYPE      PIC 9(4).                        CAT31   
               10  FILLER              PIC 9.                           CAT31   
           05  WK-MS-EXP-DATE          PIC 9(8)         VALUE ZERO.     CAT31   
           05  FILLER                  REDEFINES WK-MS-EXP-DATE.        CAT31   
               10  FILLER              PIC 9(3).                        CAT31   
               10  WK-MS-EXP-Y         PIC 9.                           CAT31   
               10  WK-MS-EXP-MM        PIC 9(2).                        CAT31   
               10  FILLER              PIC 9(2).                        CAT31   
           05  WK-MS-SEC.                                               CAT31   
               10  WK-MS-SEC-1         PIC X.                           CAT31   
               10  WK-MS-SEC-2-7       PIC X(6).                        CAT31   
           05  CURRENT-ACCOUNT-KEY.                                     CAT31   
               10  CAK-CLIENT          PIC 9(3).                        CAT31   
DJ0002         10  CAK-BRANCH          PIC X(3).                        CAT31   
DJ0002         10  CAK-ACCOUNT         PIC X(5).                        CAT31   
           05  POSITION-IN-KEY.                                         CAT31   
               10  PIK-CLIENT          PIC 9(3).                        CAT31   
DJ0002         10  PIK-BRANCH          PIC X(3).                        CAT31   
DJ0002         10  PIK-ACCOUNT         PIC X(5).                        CAT31   
           05  SPAD-START-KEY.                                          CAT31   
               10  SSK-CLI             PIC 9(3)  COMP-3 VALUE ZERO.     CAT31   
               10  SSK-BR              PIC X(3).                        CAT31   
               10  FILLER              PIC X         VALUE '-'.         CAT31   
               10  SSK-ACCT            PIC X(5).                        CAT31   
               10  FILLER              PIC X(12)     VALUE LOW-VALUES.  CAT31   
                                                                        CAT31   
       01  MONEY-MARKET-HOLDINGS.                                       CAT31   
           05  MNY-MKT-SEQ  OCCURS 5000 TIMES.                          CAT31   
               10  MMS-CLIENT          PIC 9(3).                        CAT31   
               10  MMS-CONTROLLER      PIC 9(3).                        CAT31   
               10  MMS-BRANCH          PIC X(3).                        CAT31   
               10  MMS-ACCOUNT         PIC X(5).                        CAT31   
       01  LAST-MNY-MKT-SEQ            PIC X(14)     VALUE SPACES.      CAT31   
       01  OPT-WORK-AREA.                                               CAT31   
           05  SUB                PIC 9(02).                            CAT31   
           05  SUB1               PIC 9(02).                            CAT31   
           05  OPT-SYMBOL         PIC X(03).                            CAT31   
           05  OPTION-SYMBOL   REDEFINES OPT-SYMBOL                     CAT31   
                                  PIC X(01) OCCURS 3 TIMES.             CAT31   
           05  OPTION-SYMBOL1     PIC X(01) OCCURS 3 TIMES.             CAT31   
           05  OPT-WORK1          PIC X(12).                            CAT31   
           05  OPT-WORK2   REDEFINES  OPT-WORK1.                        CAT31   
             10  OPT-WORK3        PIC X(01) OCCURS 12 TIMES.            CAT31   
                                                                        CAT31   
       01  ACAT-OPTION-AREA.                                            CAT31   
DJ0001     05  ACT-OPTION-DATA    OCCURS 900 TIMES.                     CAT31   
               10  ACT-OPTION-IND          PIC X.                       CAT31   
               10  ACT-OPT-QTY             PIC S9(9)V9999.              CAT31   
               10  ACT-OPT-BUY-SELL        PIC X.                       CAT31   
               10  ACT-OPT-PUT-CALL        PIC X.                       CAT31   
               10  ACT-OPT-OPEN-CLOSE      PIC X.                       CAT31   
               10  ACT-OPT-SYMBOL          PIC X(6).                    CAT31   
               10  ACT-OPT-EXPIRE-DTE.                                  CAT31   
                   15  ACT-OPT-EXPIRE-MM   PIC X(2).                    CAT31   
                   15  ACT-OPT-EXPIRE-Y    PIC X.                       CAT31   
               10  ACT-OPT-PRICE           PIC 9(3)V9(4).               CAT31   
               10  ACT-OPT-1-8TH-PRICE     PIC 9.                       CAT31   
               10  ACT-OPT-OPTION-DATA     PIC X(15).                   CAT31   
           05  ACT-OPTION-CTR              PIC 9(3) COMP-3 VALUE ZERO.  CAT31   
       01  COUNTERS COMP-3.                                             CAT31   
           02  JOB-COUNTERS.                                            CAT31   
               05  WS-ACAT-INP-CNT             PIC 9(7) VALUE 0.        CAT31   
               05  ACATDELV-READ-COUNT         PIC 9(7) VALUE ZERO.     CAT31   
               05  ACATDELV-ACTIVE             PIC 9(7) VALUE ZERO.     CAT31   
               05  ACATDELV-DTL-RECS           PIC 9(7) VALUE ZERO.     CAT31   
               05  ACATDELV-BYP-CLI            PIC 9(7) VALUE ZERO.     CAT31   
               05  ACATDELV-BYP-RANGE          PIC 9(7) VALUE ZERO.     CAT31   
               05  ACATDELV-RPT-RECS           PIC 9(7) VALUE ZERO.     CAT31   
               05  POSITION-RECS-READ          PIC 9(7) VALUE ZERO.     CAT31   
               05  BALNC-READ                  PIC 9(7) VALUE ZERO.     CAT31   
               05  POS-SEC-CNT                 PIC 9(7) VALUE ZERO.     CAT31   
               05  SQL-ROW-FND-CNT             PIC 9(7) VALUE ZERO.     CAT31   
               05  SQL-ROW-NOT-CNT             PIC 9(7) VALUE ZERO.     CAT31   
               05  REORG-VALID-CNT             PIC 9(7) VALUE ZERO.     CAT31   
           02  CLIENT-COUNTERS.                                         CAT31   
               05  CL-ACATDELV-READ-COUNT      PIC 9(7) VALUE ZERO.     CAT31   
               05  CL-ACATDELV-ACTIVE          PIC 9(7) VALUE ZERO.     CAT31   
               05  CL-ACATDELV-INACTIVE        PIC 9(7) VALUE ZERO.     CAT31   
               05  CL-ACATDELV-ACCT-NOT-ACTIVE PIC 9(7) VALUE ZERO.     CAT31   
               05  ACCOUNT-ACTIVE-COUNT        PIC 9(7) VALUE ZERO.     CAT31   
               05  B212-COUNT                  PIC 9(7) VALUE ZERO.     CAT31   
                                                                        CAT31   
       01  ANNUITY-LIT   PIC X(19) VALUE '* ANNUITY ON FILE *'.         CAT31   
       01  MARGIN-LIT    PIC X(18) VALUE '* MARGIN ACCOUNT *'.          CAT31   
       01  AGE-70PLUS-LIT PIC X(23) VALUE '* AGE 70 1/2 OR OLDER *'.    CAT31   
                                                                        CAT31   
       01  WS-ACCT-NUMBER.                                              CAT31   
DJ0002     05 WS-BRCH                  PIC X(03) VALUE ' '.             CAT31   
DJ0002     05 WS-ACCT                  PIC X(05) VALUE ' '.             CAT31   
           05 WS-TYPE                  PIC 9(01) VALUE 0.               CAT31   
       01  LENGTH-KEY                  PIC 9(02) VALUE 9.               CAT31   
       01  WS-CKDG                     PIC X(01) VALUE ' '.             CAT31   
                                                                        CAT31   
       01  REPORT-COUNTERS.                                             CAT31   
           05  ACAT-ACCT-CASH-SMA       PIC S9(9)V99 COMP-3 VALUE ZERO. CAT31   
           05  ACAT-ACCT-CASH-TY01      PIC S9(9)V99 COMP-3 VALUE ZERO. CAT31   
           05  ACAT-ACCT-CASH-TY02      PIC S9(9)V99 COMP-3 VALUE ZERO. CAT31   
           05  ACAT-ACCT-CASH-TY05      PIC S9(9)V99 COMP-3 VALUE ZERO. CAT31   
           05  ACAT-ACCT-CASH           PIC S9(9)V99 COMP-3 VALUE ZERO. CAT31   
           05  ACAT-IRA-MAINT-FEE       PIC S9(9)V99 COMP-3 VALUE ZERO. CAT31   
           05  ACAT-LEGG-MAINT-FEE      PIC S9(9)V99 COMP-3 VALUE ZERO. CAT31   
           05  ACAT-EQUITY-COUNTERS.                                    CAT31   
             07  ACAT-EQUITY-AREA OCCURS 10 TIMES.                      CAT31   
               10  ACAT-ACCT-EQUITY     PIC S9(9)V99 COMP-3 VALUE ZERO. CAT31   
           05  ACAT-ACCT-NET-BAL        PIC S9(9)V99 COMP-3 VALUE ZERO. CAT31   
           05  ACAT-ACCT-TOT-EQUITY     PIC S9(9)V99 COMP-3 VALUE ZERO. CAT31   
           EJECT                                                        CAT31   
       01  SWITCHES.                                                    CAT31   
           05  ACAT-FIRST-TIME-SW            PIC X VALUE 'Y'.           CAT31   
               88  ACAT-FIRST-TIME                 VALUE 'Y'.           CAT31   
           05  ACAT-DELIVER-EOF-SW           PIC X VALUE ' '.           CAT31   
               88  ACAT-DELIVER-FILE-AT-END        VALUE 'Y'.           CAT31   
           05  POSITION-FILE-EOF-SW          PIC X VALUE ' '.           CAT31   
               88  POSITION-END-OF-FILE            VALUE 'Y'.           CAT31   
           05  ACAT-RECORD-SW                PIC X VALUE ' '.           CAT31   
               88  ACAT-RECORD-WRITTEN             VALUE 'Y'.           CAT31   
           05  MEMO-SEARCH-STATUS-SW         PIC X VALUE ' '.           CAT31   
               88  MEMO-CODE-NOT-FOUND             VALUE 'N'.           CAT31   
               88  MEMO-CODE-FOUND                 VALUE 'Y'.           CAT31   
           05  MEMO-SEARCH-SW                PIC X VALUE ' '.           CAT31   
               88  END-OF-MEMO-SEARCH              VALUE 'Y'.           CAT31   
           05  ACAT-CASH-REPORTING-SW        PIC X VALUE ' '.           CAT31   
               88  ACAT-CASH-REPORTED              VALUE 'Y'.           CAT31   
           05  B1-TABLE-SEARCH-STATUS        PIC X VALUE ' '.           CAT31   
               88  B1-ENTRY-FOUND                  VALUE 'Y'.           CAT31   
               88  B1-ENTRY-NOT-FOUND              VALUE 'N'.           CAT31   
           05  B1-TABLE-SEARCH-SWITCH        PIC X VALUE ' '.           CAT31   
               88  B1-SEARCH-END                   VALUE 'Y'.           CAT31   
           05  B1-RANGE-SEARCH-STATUS        PIC X VALUE ' '.           CAT31   
               88  B1-RANGE-FOUND                  VALUE 'Y'.           CAT31   
               88  B1-RANGE-NOT-FOUND              VALUE 'N'.           CAT31   
           05  B1-RANGE-SEARCH-SWITCH        PIC X VALUE ' '.           CAT31   
               88  B1-RANGE-SEARCH-END             VALUE 'Y'.           CAT31   
           05  ACAT-EXCLUDE-SW               PIC X VALUE 'N'.           CAT31   
               88  EXCLUDE-THIS-REC                VALUE 'Y'.           CAT31   
           05  FIRST-B212-READ-SW            PIC X VALUE 'Y'.           CAT31   
               88  FIRST-B212-READ                 VALUE 'Y'.           CAT31   
           05 CLIENT-ACCOUNT-SEARCH-STATUS   PIC X.                     CAT31   
               88 CLIENT-ACCT-SEARCH-PENDING     VALUE 'P'.             CAT31   
               88 DONE-SEARCHING-CLIENT-ACCT     VALUE 'F' 'N'.         CAT31   
           05 CLIENT-ACCOUNT-STATUS          PIC X.                     CAT31   
               88 CLIENT-ACCT-ACTIVE             VALUE 'F'.             CAT31   
               88 CLIENT-ACCT-NOT-ACTIVE         VALUE 'N'.             CAT31   
           05  POSITION-FOUND-IND            PIC X.                     CAT31   
               88 POS-ACCOUNT-FOUND              VALUE 'P'.             CAT31   
               88 POS-ACCOUNT-NOT-FOUND          VALUE 'N'.             CAT31   
           05  ACCOUNT-ITEM-IND              PIC X.                     CAT31   
               88 ACTIVE-ACCOUNT-ITEM            VALUE 'A'.             CAT31   
               88 NOT-ACTIVE-ACCOUNT-ITEM        VALUE 'I'.             CAT31   
           05  ACCOUNT-IND                   PIC X.                     CAT31   
               88 ACTIVE-ACCOUNT                 VALUE 'A'.             CAT31   
               88 NOT-ACTIVE-ACCOUNT             VALUE 'I'.             CAT31   
               88 INACTIVE-ACCOUNT               VALUE 'I'.             CAT31   
C02808*    05  MUTUAL-FUND-IND               PIC X.                     CAT31   
C02808*        88 MUTUAL-FUND                    VALUE 'Y'.             CAT31   
           05  B1-RESULT                     PIC X.                     CAT31   
               88 CLIENT-NOT-FOUND               VALUE '9'.             CAT31   
               88 CLIENT-FOUND                   VALUE '0'.             CAT31   
               88 NO-MORE-CLIENTS                VALUE 'X'.             CAT31   
           05  MSD-RESULT                    PIC X.                     CAT31   
               88 MSD-RECORD-FOUND               VALUE '9'.             CAT31   
               88 MSD-RECORD-NOT-FOUND           VALUE '0'.             CAT31   
           05  NEW-ACCOUNT-SW                PIC X VALUE 'N'.           CAT31   
               88  NEW-ACCOUNT                   VALUE 'Y'.             CAT31   
           05  ACCOUNT-SUMMARY-SW            PIC X VALUE 'N'.           CAT31   
               88  ACCOUNT-SUMMARY               VALUE 'Y'.             CAT31   
           05  TYPE-BAL                      PIC X VALUE ' '.           CAT31   
               88  CREDIT-BAL                    VALUE 'C'.             CAT31   
               88  DEBIT-BAL                     VALUE 'D'.             CAT31   
C02808*    05  ACCOUNT-POSITION-SW           PIC X VALUE ' '.           CAT31   
C02808*        88  ACCOUNT-HAS-POSITIONS         VALUE 'Y'.             CAT31   
C02808*    05  ACCOUNT-CASH-SW               PIC X VALUE ' '.           CAT31   
C02808*        88  ACCOUNT-HAS-CASH              VALUE 'Y'.             CAT31   
C02808*    05  ACCOUNT-OUTSIDE-FUNDS-SW      PIC X VALUE ' '.           CAT31   
C02808*        88  ACCOUNT-HAS-OUTSIDE-FUNDS     VALUE 'Y'.             CAT31   
C02808*    05  ACCOUNT-LEGG-FUNDS-SW         PIC X VALUE ' '.           CAT31   
C02808*        88  ACCOUNT-HAS-LEGG-FUNDS        VALUE 'Y'.             CAT31   
C02808     05  WS-POS-TYPE-LEGG              PIC 9(9) VALUE 0.          CAT31   
C02808     05  WS-POS-TYPE-NON-LEGG          PIC 9(9) VALUE 0.          CAT31   
           EJECT                                                        CAT31   
      ****************************************************************  CAT31   
      *   NAME AND ADDRESS FILE AREAS                                   CAT31   
      ****************************************************************  CAT31   
      /                                                                 CAT31   
       01  PIC X(32)  VALUE '        GETNA RECORD LAYOUT     '.         CAT31   
       COPY GETNACOB.                                                   CAT31   
       01  GETNA-SEGMENT-INCLUDES.                                      CAT31   
       COPY NASEGHDR.                                                   CAT31   
       COPY NASEGPPA.                                                   CAT31   
       COPY NASEGPPB.                                                   CAT31   
       COPY NASEGEND.                                                   CAT31   
           EJECT                                                        CAT31   
      ****************************************************************  CAT31   
      *   POSITION RECORDS                                              CAT31   
      ****************************************************************  CAT31   
      * POSITION WORK AREA                                              CAT31   
       COPY POSRECOB.                                                   CAT31   
           EJECT                                                        CAT31   
      * SPAD FILE WORK AREA                                             CAT31   
       COPY SPADEXP3.                                                   CAT31   
           EJECT                                                        CAT31   
      ****************************************************************  CAT31   
      *   B1 TABLE                                                      CAT31   
      ****************************************************************  CAT31   
                                                                        CAT31   
       01 GETB1-RESULT PIC X VALUE '0'.                                 CAT31   
           88 B1-ITEM-FOUND VALUE '1'.                                  CAT31   
           88 B1-ITEM-NOT-FOUND VALUE '0'.                              CAT31   
       01 SEARCH-B1-RESULT PIC X VALUE '0'.                             CAT31   
           88 B1-TABLE-ITEM-FOUND VALUE '1'.                            CAT31   
           88 B1-TABLE-ITEM-NOT-FOUND VALUE '0'.                        CAT31   
       01 B1-BROKER-SEARCH-KEY PIC XXXX.                                CAT31   
       01  B1-COUNT PIC 9999 COMP VALUE 500.                            CAT31   
      *****                                                             CAT31   
       01  B1-TABLE.                                                    CAT31   
           03  B1-ITEMS OCCURS 500 TIMES.                               CAT31   
               05  B1-ADP-CLIENT                PIC 9(03).              CAT31   
               05  B1-BROKER                    PIC X(04).              CAT31   
               05  B1-MAINT-FEE-FOR-IRA         PIC X(01).              CAT31   
               05  B1-CLI-XFER-FEE              PIC 9(3)V99.            CAT31   
C09386*        05  B1-CLI-XFER-FEE              PIC 9(5).               CAT31   
               05  B1-CLI-XFER-FEE-IRA          PIC 9(3)V99.            CAT31   
C09386*        05  B1-CLI-XFER-FEE-IRA          PIC 9(5).               CAT31   
               05  B1-ACCT-XFER-FEE-IRA-DFLT    PIC 9(3)V99.            CAT31   
C09386*        05  B1-ACCT-XFER-FEE-IRA-DFLT    PIC 9(5).               CAT31   
               05  B1-ACCT-IRA-FEE-CODE         PIC X(35).              CAT31   
               05  B1-CL-HIT                    PIC X(01).              CAT31   
               05  B1-CLIENT-NAME               PIC X(30).              CAT31   
               05  B1-PRE-VAL-RPT-IND           PIC X.                  CAT31   
               05  B1-RCD-CNT                   PIC S9(9)  COMP-3.      CAT31   
               05  B1-CNTL-RANGE-NO             PIC 9(03)  COMP-3.      CAT31   
               05  B1-XFER-RANGE-NO             PIC 9(03)  COMP-3.      CAT31   
               05  B1-XFER-IRA-RANGE-NO         PIC 9(03)  COMP-3.      CAT31   
               05  B1-ACCT-XFER-IRA-RANGE-NO    PIC 9(03)  COMP-3.      CAT31   
               05  B1-CNTL-TABLE.                                       CAT31   
                   07  B1-CNTL-RANGE-ENTRS  OCCURS 100 TIMES.           CAT31   
                       09  B1-CNTL-CODE     PIC 9(3).                   CAT31   
                       09  B1-CNTL-BR-LOW   PIC X(03).                  CAT31   
                       09  B1-CNTL-BR-HIGH  PIC X(03).                  CAT31   
                       09  B1-CNTL-HIT      PIC X(01).                  CAT31   
               05  B1-XFER-TABLE.                                       CAT31   
                   07  B1-XFER-RANGE-ENTRS  OCCURS 100 TIMES.           CAT31   
                       09  B1-XFER-FEE      PIC 999V99.                 CAT31   
                       09  B1-XFER-BR-LOW   PIC X(03).                  CAT31   
                       09  B1-XFER-BR-HIGH  PIC X(03).                  CAT31   
               05  B1-XFER-IRA-TABLE.                                   CAT31   
                   07  B1-XFER-RANGE-ENTRS  OCCURS 100 TIMES.           CAT31   
                       09  B1-XFER-IRA-FEE      PIC 999V99.             CAT31   
                       09  B1-XFER-IRA-BR-LOW   PIC X(03).              CAT31   
                       09  B1-XFER-IRA-BR-HIGH  PIC X(03).              CAT31   
               05  B1-ACCT-XFER-IRA-TABLE.                              CAT31   
                   07  B1-ACCT-XFER-RANGE-ENTRS  OCCURS 100 TIMES.      CAT31   
                       09  B1-ACCT-XFER-IRA-FEE      PIC 999V99.        CAT31   
                       09  B1-ACCT-XFER-IRA-BR-LOW   PIC X(03).         CAT31   
                       09  B1-ACCT-XFER-IRA-BR-HIGH  PIC X(03).         CAT31   
                                                                        CAT31   
       01  B1-WRK-TABLE.                                                CAT31   
           03  B1-WRK-ITEMS.                                            CAT31   
               05  B1-WRK-ADP-CLIENT                 PIC 9(03).         CAT31   
               05  B1-WRK-BROKER                     PIC X(04).         CAT31   
               05  B1-WRK-MAINT-FEE-FOR-IRA          PIC X(01).         CAT31   
               05  B1-WRK-CLI-XFER-FEE               PIC 9(3)V99.       CAT31   
C09386*        05  B1-WRK-CLI-XFER-FEE               PIC 9(5).          CAT31   
               05  B1-WRK-CLI-XFER-FEE-IRA           PIC 9(3)V99.       CAT31   
C09386*        05  B1-WRK-CLI-XFER-FEE-IRA           PIC 9(5).          CAT31   
               05  B1-WRK-ACCT-XFER-FEE-IRA-DFLT     PIC 9(3)V99.       CAT31   
C09386*        05  B1-WRK-ACCT-XFER-FEE-IRA-DFLT     PIC 9(5).          CAT31   
               05  B1-WRK-ACCT-IRA-FEE-CODE          PIC X(35).         CAT31   
               05  B1-WRK-CL-HIT                     PIC X(01).         CAT31   
               05  B1-WRK-CLIENT-NAME                PIC X(30).         CAT31   
               05  B1-WRK-PRE-VAL-RPT-IND            PIC X.             CAT31   
               05  B1-WRK-RCD-CNT                    PIC S9(9)  COMP-3. CAT31   
               05  B1-WRK-CNTL-RANGE-NO              PIC 9(03)  COMP-3. CAT31   
               05  B1-WRK-XFER-RANGE-NO              PIC 9(03)  COMP-3. CAT31   
               05  B1-WRK-XFER-IRA-RANGE-NO          PIC 9(03)  COMP-3. CAT31   
               05  B1-WRK-ACCT-XFER-IRA-RANGE-NO     PIC 9(03)  COMP-3. CAT31   
               05  B1-WRK-CNTL-TABLE.                                   CAT31   
                   07  B1-WRK-CNTL-RANGE-ENTRS OCCURS 100 TIMES.        CAT31   
                       09  B1-WRK-CNTL-CODE          PIC 9(3).          CAT31   
                       09  B1-WRK-CNTL-BR-LOW        PIC X(03).         CAT31   
                       09  B1-WRK-CNTL-BR-HIGH       PIC X(03).         CAT31   
                       09  B1-WRK-CNTL-HIT           PIC X(01).         CAT31   
               05  B1-WRK-XFER-TABLE.                                   CAT31   
                   07  B1-WRK-XFER-RANGE-ENTRS OCCURS 100 TIMES.        CAT31   
                       09  B1-WRK-XFER-FEE           PIC 999V99.        CAT31   
                       09  B1-WRK-XFER-BR-LOW        PIC X(03).         CAT31   
                       09  B1-WRK-XFER-BR-HIGH       PIC X(03).         CAT31   
               05  B1-WRK-XFER-IRA-TABLE.                               CAT31   
                   07  B1-WRK-XFER-RANGE-ENTRS OCCURS 100 TIMES.        CAT31   
                       09  B1-WRK-XFER-IRA-FEE       PIC 999V99.        CAT31   
                       09  B1-WRK-XFER-IRA-BR-LOW    PIC X(03).         CAT31   
                       09  B1-WRK-XFER-IRA-BR-HIGH   PIC X(03).         CAT31   
               05  B1-WRK-ACCT-XFER-IRA-TABLE.                          CAT31   
                   07  B1-WRK-ACCT-XFER-RANGE-ENTRS OCCURS 100 TIMES.   CAT31   
                       09  B1-WRK-ACCT-XFER-FEE-IRA      PIC 999V99.    CAT31   
                       09  B1-WRK-ACCT-XFER-IRA-BR-LOW   PIC X(03).     CAT31   
                       09  B1-WRK-ACCT-XFER-IRA-BR-HIGH  PIC X(03).     CAT31   
                                                                        CAT31   
       EJECT                                                            CAT31   
      ****************************************************************  CAT31   
      *  B1-INFO                                                        CAT31   
       COPY BHINFO.                                                     CAT31   
       EJECT                                                            CAT31   
       COPY BHICS.                                                      CAT31   
       EJECT                                                            CAT31   
       COPY BHBTS2.                                                     CAT31   
       EJECT                                                            CAT31   
       COPY BHATB.                                                      CAT31   
       EJECT                                                            CAT31   
      ****************************************************************  CAT31   
      *    MASTER SECURITY RECORD                                    *  CAT31   
       COPY GETMSDCE.                                                   CAT31   
      ****************************************************************  CAT31   
           EJECT                                                        CAT31   
      ****************************************************************  CAT31   
      *    TIME/DATE FIELDS                                          *  CAT31   
      ****************************************************************  CAT31   
       COPY BPDATESC.                                                   CAT31   
       01  DATE-FIELDS.                                                 CAT31   
           05  PROC-DATE.                                               CAT31   
               10  PD-CC        PIC XX.                                 CAT31   
               10  PD-YY        PIC XX.                                 CAT31   
               10  PD-MM        PIC XX.                                 CAT31   
               10  PD-DD        PIC XX.                                 CAT31   
           05  PROC-DATE-N      PIC 9(08) VALUE 0.                      CAT31   
           05  TEST-DATE.                                               CAT31   
               10  TS-CC        PIC XX.                                 CAT31   
               10  TS-YY        PIC XX.                                 CAT31   
               10  TS-MM        PIC XX.                                 CAT31   
               10  TS-DD        PIC XX.                                 CAT31   
           05  DATE-CALC.                                               CAT31   
               10  DC-CCYY      PIC 9(4).                               CAT31   
               10  DC-MMDD.                                             CAT31   
                   15  DC-MM    PIC 9(2).                               CAT31   
                   15  DC-DD    PIC 9(2).                               CAT31   
           05  DATE-CALC-N REDEFINES DATE-CALC PIC 9(8).                CAT31   
                                                                        CAT31   
           05  WORK-DATE-MMDDYY.                                        CAT31   
               10  WK-MM        PIC XX.                                 CAT31   
               10  WK-DD        PIC XX.                                 CAT31   
               10  WK-YY        PIC XX.                                 CAT31   
                                                                        CAT31   
       EJECT                                                            CAT31   
                                                                        CAT31   
      *********************** REPORT HEADERS ********************       CAT31   
       01  HDR1.                                                        CAT31   
           05  FILLER                  PIC X       VALUE SPACES.        CAT31   
           05  FILLER                  PIC X(9)    VALUE ' CAT31 - '.   CAT31   
           05  H1-CLIENT               PIC X(3).                        CAT31   
           05  FILLER                  PIC X      VALUE ' '.            CAT31   
           05  H1-CLIENT-NAME          PIC X(30).                       CAT31   
           05  FILLER                  PIC X(3)   VALUE SPACES.         CAT31   
           05  FILLER                  PIC X(75)  VALUE                 CAT31   
               'AUTOMATED CUSTOMER ACCOUNT TRANSFER SYSTEM'.            CAT31   
           05  FILLER                  PIC X(5)   VALUE 'PAGE '.        CAT31   
           05  H1-PGENO                PIC ZZ9.                         CAT31   
                                                                        CAT31   
       01  HDR2.                                                        CAT31   
           05  FILLER                  PIC X(49) VALUE SPACES.          CAT31   
           05  FILLER                  PIC X(68) VALUE                  CAT31   
               'ACATS DELIVERY ASSET VALUATION REPORT '.                CAT31   
           05  FILLER                  PIC X(5)  VALUE 'DATE '.         CAT31   
           05  H2-PROC-DATE.                                            CAT31   
               10  H2-MM               PIC X(2).                        CAT31   
               10  FILLER              PIC X     VALUE '/'.             CAT31   
               10  H2-DD               PIC X(2).                        CAT31   
               10  FILLER              PIC X     VALUE '/'.             CAT31   
               10  H2-YY               PIC X(2).                        CAT31   
                                                                        CAT31   
       01  HDR3.                                                        CAT31   
           05  FILLER                  PIC X(57)  VALUE SPACES.         CAT31   
           05  FILLER                  PIC X(60)  VALUE                 CAT31   
               'PRE-VALIDATION  '.                                      CAT31   
       01  HDR4.                                                        CAT31   
C98390     05  FILLER                  PIC X(42)  VALUE                 CAT31   
C98390         '  REPORT: DELIVER     STATUS: CONTROL'.                 CAT31   
C98390     05  FILLER                  PIC X(14)  VALUE                 CAT31   
C98390         'ACCOUNT TYPE: '.                                        CAT31   
C98390     05  H4-ACCT-TYPE            PIC X(10).                       CAT31   
C98390     05  FILLER                  PIC X(18)  VALUE                 CAT31   
C98390         '     CONTRA TYPE: '.                                    CAT31   
C99363     05  H4-CONTRA-ACCT-TYPE     PIC X(12).                       CAT31   
C99363     05  FILLER                  PIC X(16)  VALUE SPACES.         CAT31   
C98930     05  H4-MARGIN-MSG           PIC X(18).                       CAT31   
                                                                        CAT31   
       01  HDR5.                                                        CAT31   
           05  FILLER                  PIC X(14)  VALUE                 CAT31   
               '  ACCOUNT NO. '.                                        CAT31   
           05  H5-BRANCH               PIC X(3).                        CAT31   
           05  FILLER                  PIC X      VALUE '-'.            CAT31   
           05  H5-ACCOUNT              PIC X(5).                        CAT31   
           05  FILLER                  PIC X(30)  VALUE                 CAT31   
               '    CONTRA BROKER ACCOUNT NO. '.                        CAT31   
           05  H5-CONTRA-BKR-ACCT      PIC X(15).                       CAT31   
           05  FILLER                  PIC X(3)   VALUE SPACES.         CAT31   
           05  FILLER                  PIC X(15)  VALUE                 CAT31   
               'CONTRA BKR NO. '.                                       CAT31   
           05  H5-CONTRA-BKR           PIC X(4).                        CAT31   
           05  FILLER                  PIC X(3)   VALUE SPACES.         CAT31   
           05  FILLER                  PIC X(17)  VALUE                 CAT31   
               'NSCC CONTROL NO. '.                                     CAT31   
           05  H5-NSCC-CNTL            PIC X(8).                        CAT31   
                                                                        CAT31   
       01  HDR6.                                                        CAT31   
           05  FILLER                  PIC X(14) VALUE '  CONTROLLER '. CAT31   
           05  H6-CONTROLLER           PIC X(3).                        CAT31   
           05  FILLER                  PIC X(11) VALUE '   SS/TIN: '.   CAT31   
           05  H6-SSN-TAXID            PIC X(11).                       CAT31   
           05  FILLER                  PIC X(8)  VALUE SPACES.          CAT31   
           05  FILLER                  PIC X(12) VALUE 'CONTRA TIN: '.  CAT31   
           05  H6-CONTRA-TAXID         PIC X(11).                       CAT31   
           05  FILLER                  PIC X(05) VALUE SPACES.          CAT31   
           05  H6-ANNUITY-MSG          PIC X(19) VALUE SPACES.          CAT31   
           05  FILLER                  PIC X(05) VALUE SPACES.          CAT31   
           05  H6-70PLUS-MSG           PIC X(23).                       CAT31   
                                                                        CAT31   
       01  HDR6C.                                                       CAT31   
           05  FILLER                  PIC X(100)  VALUE '  (CONT.) '.  CAT31   
                                                                        CAT31   
       01  HDR7.                                                        CAT31   
           05  FILLER                  PIC X(17)  VALUE                 CAT31   
               'ACCOUNT TITLE: '.                                       CAT31   
           05  H7-ACCT-TITLE           PIC X(30).                       CAT31   
           05  FILLER                  PIC X(12) VALUE SPACES.          CAT31   
           05  FILLER                  PIC X(4)  VALUE 'SMA '.          CAT31   
           05  H7-SMAT                 PIC Z,ZZZ,ZZZ,ZZZ,ZZ9.99.        CAT31   
           05  FILLER                  PIC X(13) VALUE                  CAT31   
               '   BALANCES: '.                                         CAT31   
           05  H7-BALANCE              PIC Z,ZZZ,ZZZ,ZZZ,ZZ9.99CR.      CAT31   
           05  FILLER                  PIC X(5)  VALUE '  TY '.         CAT31   
           05  H7-TYPE                 PIC X(2).                        CAT31   
                                                                        CAT31   
       01  HDR7A.                                                       CAT31   
           05  FILLER                  PIC X(17)  VALUE SPACES.         CAT31   
           05  H7A-ACCT-TITLE          PIC X(30).                       CAT31   
           05  FILLER                  PIC X(49) VALUE SPACES.          CAT31   
           05  H7A-BALANCE             PIC Z,ZZZ,ZZZ,ZZZ,ZZ9.99CR.      CAT31   
           05  H7A-TY-LIT              PIC X(5)  VALUE '  TY '.         CAT31   
           05  H7A-TYPE                PIC X(2).                        CAT31   
                                                                        CAT31   
       01  HDR8.                                                        CAT31   
           05  FILLER                  PIC X(17) VALUE                  CAT31   
               '    BROKER NAME: '.                                     CAT31   
           05  H8-BROKER-NAME          PIC X(30).                       CAT31   
           05  FILLER                  PIC X(60) VALUE SPACES.          CAT31   
                                                                        CAT31   
       01  HDR9.                                                        CAT31   
           05  FILLER                  PIC X(01) VALUE SPACES.          CAT31   
           05  FILLER                  PIC X(16) VALUE                  CAT31   
               '   QUANTITY     '.                                      CAT31   
           05  FILLER                  PIC X(01) VALUE SPACES.          CAT31   
           05  FILLER                  PIC X(09) VALUE                  CAT31   
               'CUSIP NO.'.                                             CAT31   
           05  FILLER                  PIC X(01) VALUE SPACES.          CAT31   
           05  FILLER                  PIC X(05) VALUE                  CAT31   
               'REORG'.                                                 CAT31   
           05  FILLER                  PIC X(01) VALUE SPACES.          CAT31   
           05  FILLER                  PIC X(05) VALUE SPACES.          CAT31   
           05  FILLER                  PIC X(43) VALUE                  CAT31   
               'SECURITY DESCRIPTION '.                                 CAT31   
           05  FILLER                  PIC X(41) VALUE                  CAT31   
               'VALUE   TY      MEMO QTY          MESSAGE'.             CAT31   
                                                                        CAT31   
       01  DETAIL-LINE-1.                                               CAT31   
           05  FILLER                  PIC X(1)  VALUE SPACES.          CAT31   
           05  DL1-QUANTITY            PIC X(16).                       CAT31   
           05  DL1-QTY-FRAC  REDEFINES DL1-QUANTITY                     CAT31   
                                       PIC --,---,--9.99999.            CAT31   
           05  FILLER                  PIC X(1)  VALUE SPACES.          CAT31   
           05  DL1-CUSIP               PIC X(9).                        CAT31   
           05  FILLER                  PIC X(2)  VALUE SPACES.          CAT31   
           05  DL1-REORG-CD            PIC X(3).                        CAT31   
           05  FILLER                  PIC X(2)  VALUE SPACES.          CAT31   
           05  DL1-SEC-DESCR           PIC X(30).                       CAT31   
           05  FILLER                  PIC X(3)  VALUE SPACES.          CAT31   
           05  DL1-ASSET-VALUE         PIC Z,ZZZ,ZZZ,ZZZ,ZZ9.99-.       CAT31   
           05  FILLER                  PIC X(2)  VALUE SPACES.          CAT31   
           05  DL1-TYPE                PIC X(2).                        CAT31   
           05  DL1-DASH                PIC X(1).                        CAT31   
           05  DL1-CKDG                PIC X(1).                        CAT31   
           05  DL1-MEMO-QUANTITY       PIC X(14).                       CAT31   
           05  DL1-MEMO-QTY-FRAC  REDEFINES DL1-MEMO-QUANTITY           CAT31   
                                       PIC Z,ZZZ,ZZ9.9999.              CAT31   
           05  FILLER REDEFINES DL1-MEMO-QUANTITY.                      CAT31   
               10  DL1-MEMO-QTY-WHOLE  PIC Z,ZZZ,ZZ9.                   CAT31   
               10  FILLER              PIC X(5).                        CAT31   
           05  FILLER                  PIC X(2)  VALUE SPACES.          CAT31   
           05  DL1-MEMO-MSG            PIC X(22).                       CAT31   
                                                                        CAT31   
       01  DETAIL-LINE-1A.                                              CAT31   
           05  FILLER                  PIC X(01) VALUE SPACES.          CAT31   
           05  FILLER                  PIC X(16) VALUE SPACES.          CAT31   
           05  FILLER                  PIC X(01) VALUE SPACES.          CAT31   
           05  FILLER                  PIC X(09).                       CAT31   
           05  FILLER                  PIC X(02) VALUE SPACES.          CAT31   
           05  FILLER                  PIC X(03).                       CAT31   
           05  FILLER                  PIC X(02) VALUE SPACES.          CAT31   
           05  DL1A-SEC-DESCR          PIC X(30).                       CAT31   
           05  FILLER                  PIC X(30) VALUE SPACES.          CAT31   
           05  DL1A-MEMO-QUANTITY      PIC X(14).                       CAT31   
           05  DL1A-MEMO-QTY-FRAC  REDEFINES DL1A-MEMO-QUANTITY         CAT31   
                                       PIC Z,ZZZ,ZZ9.9999.              CAT31   
           05  FILLER REDEFINES DL1A-MEMO-QUANTITY.                     CAT31   
               10  DL1A-MEMO-QTY-WHOLE  PIC Z,ZZZ,ZZ9.                  CAT31   
               10  FILLER              PIC X(5).                        CAT31   
           05  FILLER                  PIC X(2)  VALUE SPACES.          CAT31   
           05  DL1A-MEMO-MSG            PIC X(22).                      CAT31   
                                                                        CAT31   
       01  SUMMARY-HDR.                                                 CAT31   
           05  FILLER                  PIC X(58)  VALUE SPACES.         CAT31   
           05  FILLER                  PIC X(15)  VALUE                 CAT31   
               '*** SUMMARY ***'.                                       CAT31   
                                                                        CAT31   
       01  SUMMARY-DTL.                                                 CAT31   
           05  FILLER                  PIC X(10)  VALUE SPACES.         CAT31   
           05  FILLER                  PIC X(9)   VALUE 'ACCOUNT '.     CAT31   
           05  SD-BRANCH               PIC X(3).                        CAT31   
           05  FILLER                  PIC X      VALUE '-'.            CAT31   
           05  SD-ACCOUNT              PIC X(5).                        CAT31   
           05  FILLER                  PIC X(2)   VALUE SPACES.         CAT31   
           05  FILLER                  PIC X(43)  VALUE                 CAT31   
           'HAS ONE OR MORE POSITIONS IN A MONEY MARKET'.               CAT31   
                                                                        CAT31   
       01  SPAD-DETAIL-LINE.                                            CAT31   
           05  FILLER                  PIC X(9)   VALUE SPACES.         CAT31   
           05  SPAD-DETAIL-MSG         PIC X(50).                       CAT31   
                                                                        CAT31   
       01  OPT-HDR1.                                                    CAT31   
           05  FILLER                  PIC X(46)  VALUE                 CAT31   
               '   QUANTITY     BUY/     SYMBOL     PUT/'.              CAT31   
           05  FILLER                  PIC X(50)  VALUE                 CAT31   
               'OPEN/      EXP Y    EXERCISE         OPTIONAL'.         CAT31   
       01  OPT-HDR2.                                                    CAT31   
           05  FILLER                  PIC X(16)  VALUE SPACES.         CAT31   
           05  FILLER                  PIC X(20)  VALUE 'SELL'.         CAT31   
           05  FILLER                  PIC X(50)  VALUE                 CAT31   
               'CALL      CLOSE      MTH R     PRICE'.                  CAT31   
           05  FILLER                  PIC X(4)   VALUE 'DATA'.         CAT31   
                                                                        CAT31   
       01  OPT-DETAIL.                                                  CAT31   
           05  FILLER                  PIC X(5)   VALUE SPACES.         CAT31   
           05  OPDTL-QTY               PIC ZZ,ZZ9-.                     CAT31   
           05  FILLER                  PIC X(4)   VALUE SPACES.         CAT31   
           05  OPDTL-BUY-SELL          PIC X(4).                        CAT31   
           05  FILLER                  PIC X(6)   VALUE SPACES.         CAT31   
           05  OPDTL-SYMBOL            PIC X(6).                        CAT31   
           05  FILLER                  PIC X(5)   VALUE SPACES.         CAT31   
           05  OPDTL-PUT-CALL          PIC X(4).                        CAT31   
           05  FILLER                  PIC X(6)   VALUE SPACES.         CAT31   
           05  OPDTL-OPEN-CLOSE        PIC X(5).                        CAT31   
           05  FILLER                  PIC X(7)   VALUE SPACES.         CAT31   
           05  OPDTL-EXPIRE-MM         PIC XX.                          CAT31   
           05  FILLER                  PIC X      VALUE SPACES.         CAT31   
           05  OPDTL-EXPIRE-Y          PIC X.                           CAT31   
           05  FILLER                  PIC X(4)   VALUE SPACES.         CAT31   
           05  OPDTL-PRICE             PIC ZZ9.999.                     CAT31   
           05  FILLER                  PIC X(7)   VALUE SPACES.         CAT31   
           05  OPDTL-DATA              PIC X(15).                       CAT31   
                                                                        CAT31   
       01  TOT-LINE.                                                    CAT31   
           05  FILLER                  PIC X(48)  VALUE SPACES.         CAT31   
           05  TL-MSG                  PIC X(18).                       CAT31   
           05  TL-VALUE                PIC Z,ZZZ,ZZZ,ZZZ,ZZ9.99-.       CAT31   
                                                                        CAT31   
       01  TOT-LINE-LEGG.                                               CAT31   
           05  FILLER                  PIC X(7)   VALUE SPACES.         CAT31   
           05  TLL-MSG1                PIC X(27).                       CAT31   
           05  TLL-FEES                PIC ZZ9.99.                      CAT31   
           05  FILLER                  PIC X(8)   VALUE SPACES.         CAT31   
           05  TLL-MSG                 PIC X(18).                       CAT31   
           05  TLL-VALUE               PIC Z,ZZZ,ZZZ,ZZZ,ZZ9.99-.       CAT31   
                                                                        CAT31   
LRM006 01  FRGN-FEE-LINE.                                               CAT31   
LRM006     05  FILLER                  PIC X(7)   VALUE SPACES.         CAT31   
LRM006     05  FRGN-MSG1               PIC X(25).                       CAT31   
LRM006     05  FRGN-FEES               PIC ZZZZ9.99.                    CAT31   
                                                                        CAT31   
       01  NO-ACTV-LINE.                                                CAT31   
           05  FILLER                  PIC X(40)  VALUE SPACES.         CAT31   
           05  NAL-MSG                 PIC X(90).                       CAT31   
                                                                        CAT31   
       01  ASTERICK-LINE               PIC X(130) VALUE ALL '*'.        CAT31   
                                                                        CAT31   
       01  PRINTAREA.                                                   CAT31   
           05  PRINTSPACE.                                              CAT31   
               10  CC                  PIC X.                           CAT31   
               10  PRINT-AREA          PIC X(132).                      CAT31   
           05  TRACSPACE.                                               CAT31   
               10  TRAC-CLI            PIC 9(3) COMP-3.                 CAT31   
               10  TRAC-CNTL           PIC 9(3) COMP-3.                 CAT31   
               10  FILLER              PIC X(6) VALUE LOW-VALUES.       CAT31   
                                                                        CAT31   
       01  SPAD-MSG-AREA.                                               CAT31   
DJ0003     05  SPAD-MSG-LINE OCCURS 500 TIMES PIC X(50).                CAT31   
           05  SPAD-MSG-CTR            PIC 9(3) COMP-3 VALUE ZERO.      CAT31   
                                                                        CAT31   
       01  ACCOUNT-AREA.                                                CAT31   
           05  ACCOUNT-TYPES.                                           CAT31   
               10  FILLER          PIC X(20) VALUE 'SINGLE '.           CAT31   
               10  FILLER          PIC X(20) VALUE 'JOINT '.            CAT31   
               10  FILLER          PIC X(20) VALUE 'ROLLOVER'.          CAT31   
               10  FILLER          PIC X(20) VALUE 'IRA     '.          CAT31   
               10  FILLER          PIC X(20) VALUE 'PROF PENSION '.     CAT31   
               10  FILLER          PIC X(20) VALUE 'OTHER  '.           CAT31   
               10  FILLER          PIC X(20) VALUE 'ESTATE '.           CAT31   
               10  FILLER          PIC X(20) VALUE 'CUSTODIAN '.        CAT31   
               10  FILLER          PIC X(20) VALUE 'TRUST '.            CAT31   
               10  FILLER          PIC X(20) VALUE 'CORPORATE '.        CAT31   
           05  FILLER REDEFINES ACCOUNT-TYPES.                          CAT31   
               10  ACT-TYPE OCCURS 10 TIMES PIC X(20).                  CAT31   
       01  WK-LEN                  PIC S9(4) COMP SYNC VALUE +0.        CAT31   
       01  FILLER  REDEFINES WK-LEN.                                    CAT31   
           05  FILLER              PIC X.                               CAT31   
           05  WK-LEN-X            PIC X.                               CAT31   
      * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   CAT31   
      * * *  MEMO ENTRY MUST BE IN POS-MEMO-CODE (HEX) ASCENDING SEQ    CAT31   
      * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   CAT31   
                                                                        CAT31   
       01  MEMO-TABLE.                                                  CAT31   
           05 FIL PIC X(30) VALUE '1  SEG MEMO                   '.     CAT31   
           05 FIL PIC X(30) VALUE '2 MSOLD OUT OF SEG MEMO       '.     CAT31   
           05 FIL PIC X(30) VALUE '3 MIN TRANSIT MEMO            '.     CAT31   
           05 FIL PIC X(30) VALUE '4 MTRANSFER MEMO (AT AGENT)   '.     CAT31   
           05 FIL PIC X(30) VALUE '5 MTRANSFER TO MATCH MEMO     '.     CAT31   
           05 FIL PIC X(30) VALUE '6 MLEGAL TRANSFER MEMO        '.     CAT31   
           05 FIL PIC X(30) VALUE '7 5SAFEKEEPING MEMO (UNSIGNED)'.     CAT31   
           05 FIL PIC X(30) VALUE '8 5SAFEKEEPING MEMO (SIGNED)  '.     CAT31   
           05 FIL PIC X(30) VALUE '9 MCOD MEMO                   '.     CAT31   
           05 FIL PIC X(30) VALUE 'A MCOR MEMO                   '.     CAT31   
           05 FIL PIC X(30) VALUE 'B MMEMO B (CLIENT DEFINED)    '.     CAT31   
           05 FIL PIC X(30) VALUE 'C MMEMO C (CLIENT DEFINED)    '.     CAT31   
      *                                                                 CAT31   
       01  FILLER                  REDEFINES MEMO-TABLE.                CAT31   
           05  MEMO-TABLE-ENTRY    OCCURS 12 TIMES.                     CAT31   
                                                                        CAT31   
               10  MEMO-CODE-DEC   PIC X.                               CAT31   
               10  MEMO-CODE-HEX   PIC X.                               CAT31   
               10  MEMO-DM         PIC X.                               CAT31   
               10  MEMO-DESC       PIC X(27).                           CAT31   
      ****************************************************************  CAT31   
           EJECT                                                        CAT31   
       01  ACAT-DATA-REC.                                               CAT31   
           05  ACAT-KEY.                                                CAT31   
               10  ADR-CLIENT              PIC 9(3).                    CAT31   
               10  ADR-CONTROLLER          PIC 9(3).                    CAT31   
               10  ADR-BRANCH              PIC X(3).                    CAT31   
               10  ADR-ACCOUNT             PIC X(5).                    CAT31   
           05  ADR-CUSIP                   PIC X(9).                    CAT31   
           05  ADR-PROCESS-CODE            PIC X.                       CAT31   
           05  ADR-TRAN-TYPE               PIC XX.                      CAT31   
           05  ADR-TRAN-SEQ                PIC 99.                      CAT31   
           05  ADR-CLIENT-NAME             PIC X(30).                   CAT31   
           05  ADR-ACCT-TITLE              PIC X(51).                   CAT31   
           05  ADR-ADP-SEC-NO              PIC X(7).                    CAT31   
           05  ADR-SECURITY-DESC1          PIC X(30).                   CAT31   
           05  ADR-SECURITY-DESC2          PIC X(30).                   CAT31   
           05  ADR-SECURITY-DESC3          PIC X(30).                   CAT31   
           05  ADR-CNTL-NO                 PIC X(8).                    CAT31   
           05  ADR-CONTRA-BKR              PIC X(4).                    CAT31   
           05  ADR-BROKER-NAME             PIC X(30).                   CAT31   
           05  ADR-CONTRA-ACCT             PIC X(15).                   CAT31   
           05  ADR-ASSET-QTY               PIC S9(9)V99999.             CAT31   
           05  ADR-ASSET-VALUE             PIC S9(15)V99.               CAT31   
           05  ADR-SS-TAX-ID               PIC X(9).                    CAT31   
           05  ADR-IRA-KEOUGH-IND          PIC X.                       CAT31   
           05  ADR-CONTRA-TAX-ID           PIC X(9).                    CAT31   
           05  ADR-MEMO-COUNT              PIC 9.                       CAT31   
           05  ADR-MEMO-AREA OCCURS 4 TIMES.                            CAT31   
               10  ADR-MEMO-CODE           PIC X.                       CAT31   
               10  ADR-MEMO-QTY            PIC S9(9)V9999.              CAT31   
               10  ADR-MEMO-SPLIT REDEFINES ADR-MEMO-QTY.               CAT31   
                   15  ADR-MEMO-QTY-WHOLE  PIC S9(9).                   CAT31   
                   15  ADR-MEMO-QTY-FRAC   PIC V9(4).                   CAT31   
           05  ADR-XFER-FEE                PIC 9(3)V99.                 CAT31   
           05  ADR-XFER-FEE-IRA            PIC 9(3)V99.                 CAT31   
           05  ADR-IRA-MAINT-FEE           PIC 9(3)V99.                 CAT31   
           05  ADR-MUTUAL-FUND-IND         PIC X.                       CAT31   
           05  ADR-ACCT-FLAT-IND           PIC X.                       CAT31   
           05  ADR-70PLUS-IND              PIC X.                       CAT31   
           05  ADR-MARGIN-IND              PIC X.                       CAT31   
           05  ADR-SPAD-MSG                PIC X(50).                   CAT31   
C98390     05  ADR-CONTRA-ACCT-TYPE        PIC X(2).                    CAT31   
C98390     05  ADR-ANNUITY-MSG             PIC X(1).                    CAT31   
C02492     05  ADR-DTC-IND                 PIC X.                       CAT31   
C02492     05  ADR-CNS-IND                 PIC X.                       CAT31   
           05  ADR-NOT-RPT-IND             PIC X.                       CAT31   
           05  ADR-REORG-CD                PIC X(3).                    CAT31   
           05  ADR-OPTION-DATA.                                         CAT31   
               10  ADR-OPTION-IND          PIC X.                       CAT31   
               10  ADR-OPT-QTY             PIC S9(9)V9999.              CAT31   
               10  ADR-OPT-BUY-SELL        PIC X.                       CAT31   
               10  ADR-OPT-PUT-CALL        PIC X.                       CAT31   
               10  ADR-OPT-OPEN-CLOSE      PIC X.                       CAT31   
               10  ADR-OPT-SYMBOL          PIC X(6).                    CAT31   
               10  ADR-OPT-EXPIRE-DTE.                                  CAT31   
                   15  ADR-OPT-EXPIRE-MM   PIC X(2).                    CAT31   
                   15  ADR-OPT-EXPIRE-Y    PIC X.                       CAT31   
               10  ADR-OPT-PRICE           PIC 9(3)V9(4).               CAT31   
               10  ADR-OPT-1-8TH-PRICE     PIC 9.                       CAT31   
               10  ADR-OPT-OPTION-DATA     PIC X(15).                   CAT31   
ET0001     05  ADR-ACAT-CONTROL-NBR        PIC X(14).                   CAT31   
ET0001     05  ADR-ACCT-TRNFR-FEE-AMT      PIC S9(3)V9(2) COMP-3.       CAT31   
ET0001     05  ADR-ACCT-IRA-TRMNT-AMT      PIC S9(3)V9(2) COMP-3.       CAT31   
ET0001     05  ADR-ACCT-IRA-MAINT-AMT      PIC S9(3)V9(2) COMP-3.       CAT31   
LRM006     05  ADR-FRGN-FEE-AMT-TOT        PIC S9(5)V9(2) COMP-3.       CAT31   
                                                                        CAT31   
       01  SAVE-DATA-REC.                                               CAT31   
           05  SAVE-KEY.                                                CAT31   
               10  SAVE-CLIENT             PIC 9(3).                    CAT31   
               10  SAVE-CONTROLLER         PIC 9(3).                    CAT31   
               10  SAVE-BRANCH             PIC X(3).                    CAT31   
               10  SAVE-ACCOUNT            PIC X(5).                    CAT31   
           05  SAVE-CUSIP                  PIC X(9).                    CAT31   
           05  SAVE-PROCESS-CODE           PIC X.                       CAT31   
           05  SAVE-TRAN-TYPE              PIC XX.                      CAT31   
           05  SAVE-TRAN-SEQ               PIC 99.                      CAT31   
           05  SAVE-CLIENT-NAME            PIC X(30).                   CAT31   
           05  SAVE-ACCT-TITLE             PIC X(51).                   CAT31   
           05  SAVE-ADP-SEC-NO             PIC X(7).                    CAT31   
           05  SAVE-SECURITY-DESC1         PIC X(30).                   CAT31   
           05  SAVE-SECURITY-DESC2         PIC X(30).                   CAT31   
           05  SAVE-SECURITY-DESC3         PIC X(30).                   CAT31   
           05  SAVE-CNTL-NO                PIC X(8).                    CAT31   
           05  SAVE-CONTRA-BKR             PIC X(4).                    CAT31   
           05  SAVE-BROKER-NAME            PIC X(30).                   CAT31   
           05  SAVE-CONTRA-ACCT            PIC X(15).                   CAT31   
           05  SAVE-ASSET-QTY              PIC S9(9)V99999.             CAT31   
           05  SAVE-ASSET-VALUE            PIC S9(15)V99.               CAT31   
           05  SAVE-SS-TAX-ID              PIC X(9).                    CAT31   
           05  SAVE-IRA-KEOUGH-IND         PIC X.                       CAT31   
           05  SAVE-CONTRA-TAX-ID          PIC X(9).                    CAT31   
           05  SAVE-MEMO-COUNT             PIC 9.                       CAT31   
           05  SAVE-MEMO-AREA OCCURS 4 TIMES.                           CAT31   
               10  SAVE-MEMO-CODE          PIC X.                       CAT31   
               10  SAVE-MEMO-QTY           PIC S9(9)V9999.              CAT31   
               10  SAVE-MEMO-SPLIT REDEFINES SAVE-MEMO-QTY.             CAT31   
                   15  SAVE-MEMO-QTY-WHOLE PIC S9(9).                   CAT31   
                   15  SAVE-MEMO-QTY-FRAC  PIC V9(4).                   CAT31   
           05  SAVE-XFER-FEE               PIC 9(3)V99.                 CAT31   
           05  SAVE-XFER-FEE-IRA           PIC 9(3)V99.                 CAT31   
           05  SAVE-IRA-MAINT-FEE          PIC 9(3)V99.                 CAT31   
           05  SAVE-MUTUAL-FUND-IND        PIC X.                       CAT31   
           05  SAVE-ACCT-FLAT-IND          PIC X.                       CAT31   
           05  SAVE-70PLUS-IND             PIC X.                       CAT31   
           05  SAVE-MARGIN-IND             PIC X.                       CAT31   
           05  SAVE-SPAD-MSG               PIC X(50).                   CAT31   
C98390     05  SAVE-CONTRA-ACCT-TYPE       PIC X(2).                    CAT31   
C98390     05  SAVE-ANNUITY-MSG            PIC X(1).                    CAT31   
C02492     05  SAVE-DTC-IND                PIC X.                       CAT31   
C02492     05  SAVE-CNS-IND                PIC X.                       CAT31   
           05  SAVE-NOT-RPT-IND            PIC X.                       CAT31   
           05  SAVE-REORG-CD               PIC X(3).                    CAT31   
           05  SAVE-OPTION-DATA.                                        CAT31   
               10  SAVE-OPTION-IND         PIC X.                       CAT31   
               10  SAVE-OPT-QTY            PIC S9(9)V9999.              CAT31   
               10  SAVE-OPT-BUY-SELL       PIC X.                       CAT31   
               10  SAVE-OPT-PUT-CALL       PIC X.                       CAT31   
               10  SAVE-OPT-OPEN-CLOSE     PIC X.                       CAT31   
               10  SAVE-OPT-SYMBOL         PIC X(6).                    CAT31   
               10  SAVE-OPT-EXPIRE-DTE.                                 CAT31   
                   15  SAVE-OPT-EXPIRE-MM  PIC X(2).                    CAT31   
                   15  SAVE-OPT-EXPIRE-Y   PIC X.                       CAT31   
               10  SAVE-OPT-PRICE          PIC 9(3)V9(4).               CAT31   
               10  SAVE-OPT-1-8TH-PRICE    PIC 9.                       CAT31   
               10  SAVE-OPT-OPTION-DATA    PIC X(15).                   CAT31   
ET0001     05  SAVE-ACAT-CONTROL-NBR       PIC X(14).                   CAT31   
ET0001     05  SAVE-ACCT-TRNFR-FEE-AMT     PIC S9(3)V9(2) COMP-3.       CAT31   
ET0001     05  SAVE-ACCT-IRA-TRMNT-AMT     PIC S9(3)V9(2) COMP-3.       CAT31   
ET0001     05  SAVE-ACCT-IRA-MAINT-AMT     PIC S9(3)V9(2) COMP-3.       CAT31   
           EJECT                                                        CAT31   
       01  WS-REORG-AREA.                                               CAT31   
           05  WS-ADP-SEC-NO     PIC  X(07) VALUE ' '.                  CAT31   
           05  WS-REORG-CD       PIC  X(03) VALUE ' '.                  CAT31   
               88  VALID-REORG-CD    VALUE                              CAT31   
                                       'WTS' 'RTS' 'TEN' 'BMP' 'BCP'    CAT31   
                                       'BMF' 'BCF' 'RED' 'MEL'.         CAT31   
                                                                        CAT31   
       01  FILLER.                                                      CAT31   
           05  FILLER            PIC  X(16) VALUE '* SQL INCLUDES *'.   CAT31   
                                                                        CAT31   
           EXEC SQL INCLUDE SQLCA    END-EXEC.                          CAT31   
           EXEC SQL INCLUDE VMSDRGNZ END-EXEC.                          CAT31   
                                                                        CAT31   
       01  DSNTIAR                     PIC X(08) VALUE 'DSNTIAR'.       CAT31   
       01  WS-DB2-MESSAGE-AREA.                                         CAT31   
           05  WS-DB2-MSG-LEN          PIC S9(04) COMP VALUE +960.      CAT31   
           05  WS-ERROR-MSG            PIC X(80) OCCURS 12 TIMES        CAT31   
                   INDEXED BY WS-ERROR-INDEX.                           CAT31   
       01  WS-ERR-LINE-LEN             PIC S9(09) COMP VALUE +80.       CAT31   
           EJECT                                                        CAT31   
       LINKAGE SECTION.                                                 CAT31   
       01  PARM-DATA.                                                   CAT31   
           05  PARM-LENGTH              PIC S9(4)  COMP.                CAT31   
               88  PARM-LENGTH-VALID               VALUE +2.            CAT31   
           05  PARM-INFO.                                               CAT31   
               10  PARM-STREAM              PIC X.                      CAT31   
                   88  PARM-STREAM-VALID           VALUES ARE           CAT31   
                   'A' THRU 'Z' '0' THRU '9'.                           CAT31   
               10  PARM-ABEND               PIC X.                      CAT31   
                   88  NO-ABEND                    VALUE 'N'.           CAT31   
                   88  ABEND-PGM                   VALUE 'Y'.           CAT31   
           EJECT                                                        CAT31   
                                                                        CAT31   
       PROCEDURE DIVISION USING PARM-DATA.                              CAT31   
DJ0002     DISPLAY 'CAT31 - ACATS DELIVERY ASSET VALUATION REPORT'.     CAT31   
DJ0002     DISPLAY ' '.                                                 CAT31   
           COPY MSGCOBO.                                                CAT31   
DJ0002     DISPLAY ' '.                                                 CAT31   
                                                                        CAT31   
       MAINLINE SECTION.                                                CAT31   
                                                                        CAT31   
           PERFORM 0100-DATE-PARM-RTN THRU                              CAT31   
                   0100-DATE-PARM-RTN-EXIT.                             CAT31   
           PERFORM 0200-FILE-INIT THRU                                  CAT31   
                   0200-FILE-INIT-EXIT.                                 CAT31   
                                                                        CAT31   
           PERFORM 0300-LOAD-B1-TABLE THRU                              CAT31   
                   0300-LOAD-B1-TABLE-EXIT.                             CAT31   
                                                                        CAT31   
           IF B1-TBL-CNT = ZERO                                         CAT31   
             DISPLAY 'NO CLIENTS SELECTED FOR THIS RUN '                CAT31   
             GO TO 0005-ENDJOB.                                         CAT31   
           MOVE B1-TBL-CNT TO B1-COUNT.                                 CAT31   
                                                                        CAT31   
           SORT  SORT-FILE                                              CAT31   
                 ASCENDING KEY  S-CLIENT                                CAT31   
                                S-CONTROLLER                            CAT31   
                                S-BRANCH                                CAT31   
                                S-ACCOUNT                               CAT31   
                                S-PROCESS-CODE                          CAT31   
                                S-CUSIP                                 CAT31   
                                S-TRAN-TYPE                             CAT31   
                 INPUT PROCEDURE  0400-PROCESS-ACAT-FILE THRU           CAT31   
                                  0400-PROCESS-ACAT-FILE-EXIT           CAT31   
                OUTPUT PROCEDURE  1400-PRELIM-ACAT-REPORT THRU          CAT31   
                                  1400-PRELIM-ACAT-REPORT-EXIT.         CAT31   
                                                                        CAT31   
           IF SORT-RETURN NOT = ZERO                                    CAT31   
             DISPLAY 'INTERNAL SORT FAILED, SORT RC = '                 CAT31   
                     SORT-RETURN                                        CAT31   
             MOVE +4000  TO  ABORT-CODE                                 CAT31   
             PERFORM ABEND-RTN.                                         CAT31   
                                                                        CAT31   
       0005-ENDJOB.                                                     CAT31   
           PERFORM 1800-END-OF-JOB-ROUTINE THRU                         CAT31   
                   1800-END-OF-JOB-ROUTINE-EXIT.                        CAT31   
                                                                        CAT31   
C02808     MOVE ZERO TO RETURN-CODE.                                    CAT31   
           GOBACK.                                                      CAT31   
      /                                                                 CAT31   
                                                                        CAT31   
       0100-DATE-PARM-RTN.                                              CAT31   
                                                                        CAT31   
           MOVE  PGM-NME         TO  BPDATES-CALLING-PGM.               CAT31   
           MOVE  'C'             TO  BPDATES-REQ-TYPE.                  CAT31   
           CALL   BPDATES   USING  BPDATES-PARAMETERS.                  CAT31   
                                                                        CAT31   
           MOVE BPD-PROC-DATE    TO  PROC-DATE.                         CAT31   
           MOVE BPD-PROC-DATE    TO  PROC-DATE-N.                       CAT31   
                                                                        CAT31   
           MOVE PD-MM            TO  H2-MM                              CAT31   
                                     WK-MM.                             CAT31   
           MOVE PD-DD            TO  H2-DD                              CAT31   
                                     WK-DD.                             CAT31   
           MOVE PD-YY            TO  H2-YY                              CAT31   
                                     WK-YY.                             CAT31   
                                                                        CAT31   
           DISPLAY 'PROCESS DATE = '  PROC-DATE.                        CAT31   
                                                                        CAT31   
      * CALCULATE DATE 70 1/2 YEARS BACK FROM END OF CURRENT YEAR       CAT31   
                                                                        CAT31   
           MOVE PROC-DATE  TO  DATE-CALC.                               CAT31   
           COMPUTE DC-CCYY = DC-CCYY - 70.                              CAT31   
           MOVE 06         TO  DC-MM.                                   CAT31   
           MOVE 30         TO  DC-DD.                                   CAT31   
           DISPLAY '70 & 1/2 YEARS BACK FROM END OF THIS YEAR - '       CAT31   
                DATE-CALC.                                              CAT31   
                                                                        CAT31   
      * CHECK PARM                                                      CAT31   
           IF PARM-LENGTH-VALID                                         CAT31   
             CONTINUE                                                   CAT31   
           ELSE                                                         CAT31   
             DISPLAY 'PARM LENGTH IS INVALID, LENGTH MUST BE 1 CHAR '   CAT31   
             DISPLAY 'PARM ENTERED - ' PARM-INFO                        CAT31   
             DISPLAY 'PROGRAM CAT31 ABENDED '                           CAT31   
             MOVE +2000  TO  ABORT-CODE                                 CAT31   
             PERFORM ABEND-RTN.                                         CAT31   
                                                                        CAT31   
           IF PARM-STREAM-VALID                                         CAT31   
             CONTINUE                                                   CAT31   
           ELSE                                                         CAT31   
             DISPLAY 'PARM IS 2 CHARS FIRST CHAR IS JOB STREAM'         CAT31   
             DISPLAY 'PARM INVALID, MUST BE 1 CHAR ALPHANUMERIC '       CAT31   
             DISPLAY 'PARM ENTERED - ' PARM-INFO                        CAT31   
             DISPLAY 'PROGRAM CAT31 ABENDED '                           CAT31   
             MOVE +2000  TO  ABORT-CODE                                 CAT31   
             PERFORM ABEND-RTN.                                         CAT31   
                                                                        CAT31   
           IF PARM-ABEND = 'N' OR 'Y'                                   CAT31   
             CONTINUE                                                   CAT31   
           ELSE                                                         CAT31   
             DISPLAY 'PARM IS 2 CHARS SECOND CHAR IS ABEND PARM'        CAT31   
             DISPLAY 'PARM-ABEND INVALID, MUST BE 1 CHAR N OR Y '       CAT31   
             DISPLAY 'PARM ENTERED - ' PARM-INFO                        CAT31   
             DISPLAY 'PROGRAM CAT31 ABENDED '                           CAT31   
             MOVE +2000  TO  ABORT-CODE                                 CAT31   
             PERFORM ABEND-RTN.                                         CAT31   
                                                                        CAT31   
           INITIALIZE ACAT-EQUITY-COUNTERS.                             CAT31   
                                                                        CAT31   
           INITIALIZE B1-TABLE.                                         CAT31   
           INITIALIZE MONEY-MARKET-HOLDINGS.                            CAT31   
                                                                        CAT31   
       0100-DATE-PARM-RTN-EXIT. EXIT.                                   CAT31   
           EJECT                                                        CAT31   
                                                                        CAT31   
       0200-FILE-INIT.                                                  CAT31   
                                                                        CAT31   
           OPEN INPUT ACAT-DELIVER-FILE                                 CAT31   
                      POSITION-FILE.                                    CAT31   
           OPEN INPUT REG-OPT-FILE.                                     CAT31   
           IF REG-FILE-STATUS = '00' OR '97'                            CAT31   
             CONTINUE                                                   CAT31   
           ELSE                                                         CAT31   
              DISPLAY 'ERROR OPENING REGISTRATION OPTION FILE '         CAT31   
              'FILE STATUS = ' REG-FILE-STATUS                          CAT31   
              MOVE +3004 TO ABORT-CODE                                  CAT31   
              PERFORM ABEND-RTN                                         CAT31   
           END-IF.                                                      CAT31   
                                                                        CAT31   
      *    OPEN INPUT BALNC-FILE.                                       CAT31   
           MOVE 'O'    TO GETVBAL-FILE                                          
           MOVE 'O'    TO GETVBAL-FUNC                                          
           PERFORM CALL-GETVBAL                                                 
                                                                                
           IF BALNC-OPEN-OK                                             CAT31   
             CONTINUE                                                   CAT31   
           ELSE                                                         CAT31   
              DISPLAY 'ERROR OPENING BALNC FILE '                       CAT31   
              'FILE STATUS = ' BALNC-FILE-STATUS                        CAT31   
              MOVE +3020 TO ABORT-CODE                                  CAT31   
              PERFORM ABEND-RTN                                         CAT31   
           END-IF.                                                      CAT31   
                                                                        CAT31   
           OPEN INPUT SPAD-FILE.                                        CAT31   
           IF SPAD-OPEN-OK                                              CAT31   
             CONTINUE                                                   CAT31   
           ELSE                                                         CAT31   
              DISPLAY 'ERROR OPENING SPAD FILE '                        CAT31   
              'FILE STATUS = ' SPAD-FILE-STATUS                         CAT31   
              MOVE +3024 TO ABORT-CODE                                  CAT31   
              PERFORM ABEND-RTN                                         CAT31   
           END-IF.                                                      CAT31   
                                                                        CAT31   
           OPEN INPUT ANNU-FILE.                                        CAT31   
           IF ANNU-OPEN-OK                                              CAT31   
             CONTINUE                                                   CAT31   
           ELSE                                                         CAT31   
              DISPLAY 'ERROR OPENING ANNUFL FILE'                       CAT31   
              'FILE STATUS = ' ANNU-FILE-STATUS                         CAT31   
              MOVE +3024 TO ABORT-CODE                                  CAT31   
              PERFORM ABEND-RTN                                         CAT31   
           END-IF.                                                      CAT31   
                                                                        CAT31   
           OPEN OUTPUT REPORT-FILE.                                     CAT31   
                                                                        CAT31   
           READ ACAT-DELIVER-FILE                                       CAT31   
             AT END                                                     CAT31   
             SET ACAT-DELIVER-FILE-AT-END TO TRUE                       CAT31   
             GO TO 0200-FILE-INIT-EXIT.                                 CAT31   
                                                                        CAT31   
           IF ACAT-DATE-RECKEY NOT = LOW-VALUES                         CAT31   
              DISPLAY 'ACAT DELIVER HEADER NOT FOUND'                   CAT31   
                  DISPLAY 'JOB ENDING'                                  CAT31   
              MOVE +4004 TO ABORT-CODE                                  CAT31   
              PERFORM ABEND-RTN                                         CAT31   
           ELSE                                                         CAT31   
                DISPLAY 'ACAT DELIVER FILE DATE = '                     CAT31   
                         ACAT-DATE-MMDDYY                               CAT31   
                DISPLAY 'PROCESSING STREAM = '                          CAT31   
                         PARM-STREAM                                    CAT31   
            END-IF.                                                     CAT31   
                                                                        CAT31   
           IF NO-ABEND                                                  CAT31   
             GO TO 0200-FILE-INIT-EXIT.                                 CAT31   
                                                                        CAT31   
           IF ACAT-DATE-MMDDYY  =  WORK-DATE-MMDDYY                     CAT31   
             CONTINUE                                                   CAT31   
           ELSE                                                         CAT31   
             DISPLAY 'ACAT FILE AND PGM PROCESS DATES NOT EQUAL'        CAT31   
             DISPLAY 'ACAT FILE HEADER DATE - ' ACAT-DATE-MMDDYY        CAT31   
             DISPLAY 'PROGRAM PROCESS DATE  - ' WORK-DATE-MMDDYY        CAT31   
             DISPLAY 'PROGRAM CAT31 ABENDED'                            CAT31   
             MOVE +4008  TO  ABORT-CODE                                 CAT31   
             PERFORM ABEND-RTN.                                         CAT31   
                                                                        CAT31   
       0200-FILE-INIT-EXIT.  EXIT.                                      CAT31   
            EJECT                                                       CAT31   
                                                                        CAT31   
       0300-LOAD-B1-TABLE.                                              CAT31   
                                                                        CAT31   
           PERFORM VARYING I-SUB FROM 1 BY 1                            CAT31   
               UNTIL I-SUB > 500                                        CAT31   
               MOVE ZERO TO B1-ADP-CLIENT(I-SUB)                        CAT31   
                              B1-BROKER (I-SUB)                         CAT31   
           END-PERFORM.                                                 CAT31   
                                                                        CAT31   
           PERFORM VARYING B1-SUB   FROM 1 BY 1                         CAT31   
               UNTIL B1-SUB   > B1-COUNT                                CAT31   
               SET B1-ITEM-NOT-FOUND TO TRUE                            CAT31   
               PERFORM 0310-GET-B1-INFO THRU                            CAT31   
                       0310-GET-B1-INFO-EXIT                            CAT31   
               IF B1-ITEM-FOUND                                         CAT31   
                   PERFORM 0320-LOAD-B1-ITEM THRU                       CAT31   
                           0320-LOAD-B1-ITEM-EXIT                       CAT31   
               END-IF                                                   CAT31   
           END-PERFORM.                                                 CAT31   
       0300-LOAD-B1-TABLE-EXIT.  EXIT.                                  CAT31   
                                                                        CAT31   
       0310-GET-B1-INFO.                                                CAT31   
           MOVE SPACES    TO  BH-BROKER-HEADER-INFO.                    CAT31   
           MOVE B1-SUB    TO BH-BROKER-NUMBER-N.                        CAT31   
           MOVE '010'     TO BH-LOGICAL-RECORD-CODE.                    CAT31   
           MOVE SPACES    TO BH-B2-INFO-ID.                             CAT31   
           CALL  GETB1V  USING BH-BROKER-HEADER-INFO                    CAT31   
           END-CALL.                                                    CAT31   
                                                                        CAT31   
           PERFORM 0315-DETERMINE-CLI-STRM THRU                         CAT31   
                   0315-DETERMINE-CLI-STRM-EXIT.                        CAT31   
           IF BH-BROKER-ACTIVE AND                                      CAT31   
              CLIENT-STREAM  = PARM-STREAM                              CAT31   
             CONTINUE                                                   CAT31   
           ELSE                                                         CAT31   
             SET B1-ITEM-NOT-FOUND TO TRUE                              CAT31   
             GO TO 0310-GET-B1-INFO-EXIT.                               CAT31   
                                                                        CAT31   
           MOVE SPACE     TO BH-ICS-INFO.                               CAT31   
           MOVE B1-SUB    TO BH-BROKER-NUMBER-N.                        CAT31   
           MOVE '015'     TO BH-LOGICAL-RECORD-CODE.                    CAT31   
           MOVE '501000'  TO BH-B2-INFO-ID.                             CAT31   
           CALL  GETB1V  USING BH-BROKER-HEADER-INFO,                   CAT31   
                              BH-ICS-INFO                               CAT31   
           END-CALL.                                                    CAT31   
                                                                        CAT31   
                                                                        CAT31   
           IF BH-ICS-ACTIVE AND                                         CAT31   
              BH-ICS-ACAT-DATA-EXTRACT = '1'                            CAT31   
             CONTINUE                                                   CAT31   
           ELSE                                                         CAT31   
             SET B1-ITEM-NOT-FOUND TO TRUE                              CAT31   
             GO TO 0310-GET-B1-INFO-EXIT.                               CAT31   
                                                                        CAT31   
           MOVE SPACE     TO BH-BTS2-INFO.                              CAT31   
           MOVE B1-SUB    TO BH-BROKER-NUMBER-N.                        CAT31   
           MOVE '015'     TO BH-LOGICAL-RECORD-CODE.                    CAT31   
           MOVE '511000'  TO BH-B2-INFO-ID.                             CAT31   
           CALL  GETB1V  USING BH-BROKER-HEADER-INFO,                   CAT31   
                              BH-BTS2-INFO                              CAT31   
           END-CALL.                                                    CAT31   
                                                                        CAT31   
           IF BH-BTS2-ACTIVE AND                                        CAT31   
              BH-BTS2-ACAT-RC-PRE-VALIDAT-RP = '1'                      CAT31   
             CONTINUE                                                   CAT31   
           ELSE                                                         CAT31   
             SET B1-ITEM-NOT-FOUND TO TRUE                              CAT31   
             GO TO 0310-GET-B1-INFO-EXIT.                               CAT31   
                                                                        CAT31   
           MOVE SPACE     TO BH-ATB-INFO.                               CAT31   
           MOVE B1-SUB    TO BH-BROKER-NUMBER-N.                        CAT31   
           MOVE '015'     TO BH-LOGICAL-RECORD-CODE.                    CAT31   
           MOVE '451140'  TO BH-B2-INFO-ID.                             CAT31   
           CALL  GETB1V  USING BH-BROKER-HEADER-INFO,                   CAT31   
                              BH-ATB-INFO                               CAT31   
           END-CALL.                                                    CAT31   
                                                                        CAT31   
           SET B1-ITEM-FOUND TO TRUE.                                   CAT31   
                                                                        CAT31   
       0310-GET-B1-INFO-EXIT. EXIT.                                     CAT31   
                                                                        CAT31   
       0315-DETERMINE-CLI-STRM.                                         CAT31   
           MOVE BH-BROKER-MINI-MAXI-SUBGROUP TO CLIENT-STREAM           CAT31   
           IF CLIENT-STREAM = SPACE                                     CAT31   
              MOVE BH-BROKER-MINI-MAXI-INDICATOR TO CLIENT-STREAM       CAT31   
           END-IF.                                                      CAT31   
       0315-DETERMINE-CLI-STRM-EXIT. EXIT.                              CAT31   
           EJECT                                                        CAT31   
       0320-LOAD-B1-ITEM.                                               CAT31   
           ADD 1 TO B1-TBL-CNT.                                         CAT31   
           MOVE 'N'                                 TO                  CAT31   
                   B1-CL-HIT     (B1-TBL-CNT).                          CAT31   
           MOVE BH-BROKER-NUMBER-N                  TO                  CAT31   
                   B1-ADP-CLIENT (B1-TBL-CNT).                          CAT31   
           MOVE BH-BROKER-OLD-CLEARING-HOUSE (2:4)  TO                  CAT31   
                   B1-BROKER     (B1-TBL-CNT).                          CAT31   
           MOVE BH-BROKER-NAME                      TO                  CAT31   
                   B1-CLIENT-NAME (B1-TBL-CNT).                         CAT31   
           MOVE BH-BTS2-ACAT-MAINT-FEE-FOR-IRA      TO                  CAT31   
                   B1-MAINT-FEE-FOR-IRA (B1-TBL-CNT).                   CAT31   
           MOVE BH-BTS2-ACAT-RC-PRE-VALIDAT-RP      TO                  CAT31   
                   B1-PRE-VAL-RPT-IND (B1-TBL-CNT).                     CAT31   
           MOVE BH-BTS-ACAT-TRANSFER-FEE            TO                  CAT31   
C09386             XFER-FEE-IN                                                  
C09386     MOVE XFER-FEE-ACTUAL                     TO                          
                   B1-CLI-XFER-FEE (B1-TBL-CNT).                        CAT31   
           MOVE BH-BTS-ACAT-TRANSFER-FEE-IRA        TO                  CAT31   
C09386             XFER-FEE-IN                                                  
C09386     MOVE XFER-FEE-ACTUAL                     TO                          
                   B1-CLI-XFER-FEE-IRA (B1-TBL-CNT).                    CAT31   
           MOVE BH-BTS2-ACAT-IRA-CODE-FEE-EXT       TO                  CAT31   
                   B1-ACCT-IRA-FEE-CODE (B1-TBL-CNT).                   CAT31   
           MOVE BH-BTS-ACAT-TRF-FEE-IRA-EXT         TO                  CAT31   
C09386             XFER-FEE-IN                                                  
C09386     MOVE XFER-FEE-ACTUAL                     TO                          
                   B1-ACCT-XFER-FEE-IRA-DFLT (B1-TBL-CNT).              CAT31   
                                                                        CAT31   
C02808     DISPLAY 'CLIENT ' B1-ADP-CLIENT (B1-TBL-CNT)                 CAT31   
C02808             ' WILL BE PROCESSED'.                                CAT31   
           IF BH-ATB-ACTIVE                                             CAT31   
             MOVE BH-ATB-ACAT-BR-CONTROL-CODE-NO      TO                CAT31   
                     B1-CNTL-RANGE-NO   (B1-TBL-CNT)                    CAT31   
             MOVE BH-ATB-ACAT-BR-TRANSF-FEE-NO        TO                CAT31   
                     B1-XFER-RANGE-NO     (B1-TBL-CNT)                  CAT31   
             MOVE BH-ATB-ACAT-BR-TRF-IRA-FEE-NO        TO               CAT31   
                     B1-XFER-IRA-RANGE-NO     (B1-TBL-CNT)              CAT31   
             MOVE BH-ATB-ACAT-BR-TRF-IRA-EXT-NO        TO               CAT31   
                     B1-ACCT-XFER-IRA-RANGE-NO (B1-TBL-CNT)             CAT31   
      *      PERFORM 0325-LOAD-B1-ITEM-TABLE THRU                       CAT31   
      *              0325-LOAD-B1-ITEM-TABLE-EXIT                       CAT31   
      *              VARYING B11-SUB FROM 1 BY 1                        CAT31   
      *              UNTIL B11-SUB > BH-ATB-ACAT-BR-CONTROL-CODE-NO     CAT31   
             PERFORM 0330-LOAD-B1-REG-FEES THRU                         CAT31   
                     0330-LOAD-B1-REG-FEES-EXIT                         CAT31   
                     VARYING B11-SUB FROM 1 BY 1                        CAT31   
                     UNTIL B11-SUB > BH-ATB-ACAT-BR-TRANSF-FEE-NO       CAT31   
             PERFORM 0335-LOAD-B1-IRA-FEES THRU                         CAT31   
                     0335-LOAD-B1-IRA-FEES-EXIT                         CAT31   
                     VARYING B11-SUB FROM 1 BY 1                        CAT31   
                     UNTIL B11-SUB > BH-ATB-ACAT-BR-TRF-IRA-FEE-NO      CAT31   
             PERFORM 0340-LOAD-B1-ACCT-FEES THRU                        CAT31   
                     0340-LOAD-B1-ACCT-FEES-EXIT                        CAT31   
                     VARYING B11-SUB FROM 1 BY 1                        CAT31   
                     UNTIL B11-SUB > BH-ATB-ACAT-BR-TRF-IRA-EXT-NO      CAT31   
           DISPLAY B1-ITEMS (B1-TBL-CNT).                               CAT31   
                                                                        CAT31   
       0320-LOAD-B1-ITEM-EXIT.  EXIT.                                   CAT31   
                                                                        CAT31   
       0325-LOAD-B1-ITEM-TABLE.                                         CAT31   
           MOVE  'N'                                           TO       CAT31   
                B1-CNTL-HIT        (B1-TBL-CNT B11-SUB).                CAT31   
           MOVE  BH-ATB-ACAT-BR-CONTROL-CODE     (B11-SUB)     TO       CAT31   
                B1-CNTL-CODE       (B1-TBL-CNT B11-SUB).                CAT31   
           MOVE  BH-ATB-ACAT-BR-CONTROL-CODE-LO  (B11-SUB)     TO       CAT31   
                B1-CNTL-BR-LOW     (B1-TBL-CNT B11-SUB).                CAT31   
           MOVE  BH-ATB-ACAT-BR-CONTROL-CODE-HI  (B11-SUB)     TO       CAT31   
                B1-CNTL-BR-HIGH    (B1-TBL-CNT B11-SUB).                CAT31   
       0325-LOAD-B1-ITEM-TABLE-EXIT. EXIT.                              CAT31   
                                                                        CAT31   
       0330-LOAD-B1-REG-FEES.                                           CAT31   
           MOVE  'N'                                           TO       CAT31   
                B1-CNTL-HIT        (B1-TBL-CNT B11-SUB).                CAT31   
           MOVE  BH-ATB-ACAT-BR-TRANSF-FEE-AMT   (B11-SUB)     TO       CAT31   
                B1-XFER-FEE        (B1-TBL-CNT B11-SUB).                CAT31   
           MOVE  BH-ATB-ACAT-BR-TRANSF-FEE-LO    (B11-SUB)     TO       CAT31   
                B1-XFER-BR-LOW     (B1-TBL-CNT B11-SUB).                CAT31   
           MOVE  BH-ATB-ACAT-BR-TRANSF-FEE-HI    (B11-SUB)     TO       CAT31   
                B1-XFER-BR-HIGH    (B1-TBL-CNT B11-SUB).                CAT31   
       0330-LOAD-B1-REG-FEES-EXIT.  EXIT.                               CAT31   
                                                                        CAT31   
       0335-LOAD-B1-IRA-FEES.                                           CAT31   
           MOVE  'N'                                           TO       CAT31   
                B1-CNTL-HIT        (B1-TBL-CNT B11-SUB).                CAT31   
           MOVE  BH-ATB-ACAT-BR-TRF-IRA-FEE-AMT  (B11-SUB)     TO       CAT31   
                B1-XFER-IRA-FEE    (B1-TBL-CNT B11-SUB).                CAT31   
           MOVE  BH-ATB-ACAT-BR-TRF-IRA-FEE-LO   (B11-SUB)     TO       CAT31   
                B1-XFER-IRA-BR-LOW (B1-TBL-CNT B11-SUB).                CAT31   
           MOVE  BH-ATB-ACAT-BR-TRF-IRA-FEE-HI   (B11-SUB)     TO       CAT31   
                B1-XFER-IRA-BR-HIGH (B1-TBL-CNT B11-SUB).               CAT31   
       0335-LOAD-B1-IRA-FEES-EXIT.  EXIT.                               CAT31   
                                                                        CAT31   
       0340-LOAD-B1-ACCT-FEES.                                          CAT31   
           MOVE  'N'                                           TO       CAT31   
                B1-CNTL-HIT        (B1-TBL-CNT B11-SUB).                CAT31   
           MOVE  BH-ATB-ACAT-BR-TRF-IRA-EXT-AMT  (B11-SUB)     TO       CAT31   
                B1-ACCT-XFER-IRA-FEE    (B1-TBL-CNT B11-SUB).           CAT31   
           MOVE  BH-ATB-ACAT-BR-TRF-IRA-EXT-LO   (B11-SUB)     TO       CAT31   
                B1-ACCT-XFER-IRA-BR-LOW (B1-TBL-CNT B11-SUB).           CAT31   
           MOVE  BH-ATB-ACAT-BR-TRF-IRA-EXT-HI   (B11-SUB)     TO       CAT31   
                B1-ACCT-XFER-IRA-BR-HIGH (B1-TBL-CNT B11-SUB).          CAT31   
       0340-LOAD-B1-ACCT-FEES-EXIT.  EXIT.                              CAT31   
           EJECT                                                        CAT31   
       0400-PROCESS-ACAT-FILE.                                          CAT31   
                                                                        CAT31   
           IF ACAT-DELIVER-FILE-AT-END                                  CAT31   
             GO TO 0420-CHECK-B1-FILE.                                  CAT31   
                                                                        CAT31   
           READ ACAT-DELIVER-FILE                                       CAT31   
             AT END                                                     CAT31   
               DISPLAY 'ACAT DELIVER FILE AT END'                       CAT31   
               SET ACAT-DELIVER-FILE-AT-END TO TRUE                     CAT31   
             GO TO 0420-CHECK-B1-FILE.                                  CAT31   
                                                                        CAT31   
           ADD 1 TO WS-ACAT-INP-CNT.                                    CAT31   
                                                                        CAT31   
           IF ACAT-REC-CODE NOT = '3A'                                  CAT31   
             GO TO 0400-PROCESS-ACAT-FILE.                              CAT31   
                                                                        CAT31   
           ADD 1 TO ACATDELV-DTL-RECS.                                  CAT31   
                                                                        CAT31   
           MOVE 'N' TO B1-TABLE-SEARCH-STATUS.                          CAT31   
           MOVE ' ' TO B1-TABLE-SEARCH-SWITCH.                          CAT31   
                                                                        CAT31   
      * IS ACAT CLIENT IN B1 TABLE                                      CAT31   
      * ON MATCH CONTINUE                                               CAT31   
           MOVE 1    TO  B1-SUB1.                                       CAT31   
           PERFORM UNTIL B1-SEARCH-END                                  CAT31   
                                                                        CAT31   
            IF B1-SUB1 > B1-TBL-CNT                                     CAT31   
              MOVE 'N'  TO  B1-TABLE-SEARCH-STATUS                      CAT31   
              MOVE 'Y'  TO  B1-TABLE-SEARCH-SWITCH                      CAT31   
            END-IF                                                      CAT31   
                                                                        CAT31   
           IF B1-ADP-CLIENT (B1-SUB1) = ACAT-CLT                        CAT31   
             MOVE B1-ITEMS (B1-SUB1) TO B1-WRK-ITEMS                    CAT31   
             MOVE B1-SUB1  TO  B1-SUB1-SVE                              CAT31   
             MOVE 'Y'  TO  B1-TABLE-SEARCH-STATUS                       CAT31   
             MOVE 'Y'  TO  B1-TABLE-SEARCH-SWITCH                       CAT31   
             END-IF                                                     CAT31   
                                                                        CAT31   
             ADD 1  TO  B1-SUB1                                         CAT31   
           END-PERFORM.                                                 CAT31   
                                                                        CAT31   
           IF B1-ENTRY-FOUND                                            CAT31   
             CONTINUE                                                   CAT31   
           ELSE                                                         CAT31   
             ADD 1 TO ACATDELV-BYP-CLI                                  CAT31   
             GO TO 0400-PROCESS-ACAT-FILE.                              CAT31   
                                                                        CAT31   
      * DETERMINE IF ACAT BRANCH IS WITHIN RANGES ON B1 TABLE           CAT31   
                                                                        CAT31   
      *    MOVE  'N'  TO  B1-RANGE-SEARCH-STATUS.                       CAT31   
      *    MOVE  ' '  TO  B1-RANGE-SEARCH-SWITCH.                       CAT31   
      *    MOVE  1    TO  B1-SUB2.                                      CAT31   
      *    PERFORM UNTIL B1-RANGE-SEARCH-END                            CAT31   
                                                                        CAT31   
      *      IF B1-SUB2 > B1-WRK-CNTL-RANGE-NO                          CAT31   
      *        MOVE 'N'  TO  B1-RANGE-SEARCH-STATUS                     CAT31   
      *        MOVE 'Y'  TO  B1-RANGE-SEARCH-SWITCH                     CAT31   
      *      END-IF                                                     CAT31   
      *      IF  (ACAT-BR > B1-WRK-CNTL-BR-LOW (B1-SUB2) OR             CAT31   
      *           ACAT-BR = B1-WRK-CNTL-BR-LOW (B1-SUB2)) AND           CAT31   
      *          (ACAT-BR < B1-WRK-CNTL-BR-HIGH (B1-SUB2) OR            CAT31   
      *           ACAT-BR = B1-WRK-CNTL-BR-HIGH (B1-SUB2)) AND          CAT31   
      *           B1-SUB2 NOT > B1-WRK-CNTL-RANGE-NO                    CAT31   
      *        MOVE B1-WRK-CNTL-CODE (B1-SUB2) TO WS-CONTROLLER         CAT31   
      *        MOVE 'Y'  TO  B1-RANGE-SEARCH-STATUS                     CAT31   
      *        MOVE 'Y'  TO  B1-RANGE-SEARCH-SWITCH                     CAT31   
      *        MOVE B1-SUB2  TO  B1-SUB2-SVE                            CAT31   
      *      END-IF                                                     CAT31   
                                                                        CAT31   
      *      ADD 1  TO  B1-SUB2                                         CAT31   
      *    END-PERFORM.                                                 CAT31   
                                                                        CAT31   
      *    IF B1-RANGE-NOT-FOUND                                        CAT31   
      *      ADD 1 TO ACATDELV-BYP-RANGE                                CAT31   
      *      GO TO 0400-PROCESS-ACAT-FILE.                              CAT31   
                                                                        CAT31   
      *  BRANCH IS WITHIN REPORTING RANGES                              CAT31   
      *  PROCESS THE RECORD                                             CAT31   
                                                                        CAT31   
           MOVE SPACE         TO ACAT-RECORD-SW.                        CAT31   
           PERFORM 0500-ACAT-ACCT-ANAL THRU                             CAT31   
                   0500-ACAT-ACCT-ANAL-EXIT.                            CAT31   
                                                                        CAT31   
           IF ACAT-RECORD-WRITTEN                                       CAT31   
             MOVE 'Y'  TO  B1-CL-HIT (B1-SUB1-SVE)                      CAT31   
      *      MOVE 'Y'  TO  B1-CNTL-HIT (B1-SUB1-SVE B1-SUB2-SVE).       CAT31   
           ELSE                                                         CAT31   
             PERFORM 0450-SETUP-SORT-REC THRU                           CAT31   
                     0450-SETUP-SORT-REC-EXIT                           CAT31   
             PERFORM 0475-GET-NAME-ADDRESS THRU                         CAT31   
                     0475-GET-NAME-ADDRESS-EXIT                         CAT31   
             MOVE 'Y' TO ADR-ACCT-FLAT-IND                              CAT31   
             IF  GETNA-RETURN-FOUND  AND                                CAT31   
                 NOT  NAPPA-SEGMENT-MISSING                             CAT31   
                 MOVE  NAPPA-SOC-SEC-TAX-ID-N1 TO  ADR-SS-TAX-ID        CAT31   
                 MOVE  NAPPA-IRA-KEOUGH-IND    TO  ADR-IRA-KEOUGH-IND   CAT31   
             END-IF                                                     CAT31   
      * DETERMINE IF CUSTOMER IS 70 1/2 YEARS OLD OR OLDER              CAT31   
             IF  GETNA-RETURN-FOUND  AND                                CAT31   
                 NOT  NAPPA-SEGMENT-MISSING  AND                        CAT31   
                      NAPPA-DATE-OF-BIRTH NOT = ZERO AND                CAT31   
                      NAPPA-DATE-OF-BIRTH NOT > DATE-CALC-N             CAT31   
               MOVE '1'    TO  ADR-70PLUS-IND                           CAT31   
             END-IF                                                     CAT31   
                                                                        CAT31   
      * CHECK FOR MARGIN ACCOUNT                                        CAT31   
             IF  GETNA-RETURN-FOUND  AND                                CAT31   
                 NOT  NAPPA-SEGMENT-MISSING  AND                        CAT31   
                      NAPPA-ACCT-TYPE (2) = '2'                         CAT31   
               MOVE '1'    TO  ADR-MARGIN-IND                           CAT31   
             END-IF                                                     CAT31   
             PERFORM 0480-READ-ANNU-FILE THRU                           CAT31   
                     0480-READ-ANNU-FILE-EXIT                           CAT31   
             IF ANNU-FILE-OK                                            CAT31   
               MOVE '1'    TO  ADR-ANNUITY-MSG                          CAT31   
             END-IF                                                     CAT31   
             PERFORM 1100-REGULAR-XFER-FEE-RTN THRU                     CAT31   
                     1100-REGULAR-XFER-FEE-RTN-EXIT                     CAT31   
             IF NAPPA-IRA-KEOUGH-IND NOT = SPACES AND                   CAT31   
                NAPPA-IRA-KEOUGH-IND NOT = LOW-VALUES                   CAT31   
               PERFORM 1200-IRA-XFER-FEE-RTN THRU                       CAT31   
                       1200-IRA-XFER-FEE-RTN-EXIT                       CAT31   
             END-IF                                                     CAT31   
             PERFORM 1000-RELEASE-REC THRU                              CAT31   
                     1000-RELEASE-REC-EXIT                              CAT31   
           END-IF.                                                      CAT31   
                                                                        CAT31   
           GO TO 0400-PROCESS-ACAT-FILE.                                CAT31   
       0420-CHECK-B1-FILE.                                              CAT31   
           MOVE 1 TO B4-SUB.                                            CAT31   
           PERFORM 0575-B1-NOT-RPTING THRU                              CAT31   
                   0575-B1-NOT-RPTING-EXIT                              CAT31   
                    VARYING B3-SUB FROM 1 BY 1                          CAT31   
                     UNTIL B3-SUB > B1-TBL-CNT.                         CAT31   
                                                                        CAT31   
       0400-PROCESS-ACAT-FILE-EXIT. EXIT.                               CAT31   
           EJECT                                                        CAT31   
                                                                        CAT31   
       0450-SETUP-SORT-REC.                                             CAT31   
                                                                        CAT31   
           INITIALIZE ACAT-DATA-REC.                                    CAT31   
                                                                        CAT31   
           MOVE ACAT-CLT            TO  ADR-CLIENT.                     CAT31   
           MOVE WS-CONTROLLER       TO  ADR-CONTROLLER.                 CAT31   
           MOVE ACAT-BR             TO  ADR-BRANCH.                     CAT31   
           MOVE ACAT-ACCT           TO  ADR-ACCOUNT.                    CAT31   
           MOVE B1-WRK-CLIENT-NAME  TO  ADR-CLIENT-NAME.                CAT31   
           MOVE ACAT-CONTRA-BROKER  TO  ADR-CONTRA-BKR.                 CAT31   
           MOVE ACAT-BROKER-NAME    TO  ADR-BROKER-NAME.                CAT31   
           MOVE ACAT-CONTRA-ACCT    TO  ADR-CONTRA-ACCT.                CAT31   
           MOVE ACAT-CTRL-NO        TO  ADR-CNTL-NO.                    CAT31   
           MOVE ACAT-CONTRA-TAXID   TO  ADR-CONTRA-TAX-ID.              CAT31   
           MOVE ACAT-ACCT-NAME1     TO  ADR-ACCT-TITLE (1:30).          CAT31   
           MOVE ACAT-ACCT-NAME2 (1:21) TO ADR-ACCT-TITLE (31:20).       CAT31   
C98390     MOVE ACAT-CONTRA-ACCT-TYPE TO ADR-CONTRA-ACCT-TYPE.          CAT31   
C02808     MOVE  NAPPA-IRA-KEOUGH-IND    TO  ADR-IRA-KEOUGH-IND.        CAT31   
ET0001     MOVE  ACAT-CONTROL-NUMBER     TO  ADR-ACAT-CONTROL-NBR.      CAT31   
ET0001     MOVE  ACAT-TRNFR-FEE-AMT      TO  ADR-ACCT-TRNFR-FEE-AMT.    CAT31   
ET0001     MOVE  ACAT-IRA-MAINT-AMT      TO  ADR-ACCT-IRA-TRMNT-AMT.    CAT31   
ET0001     MOVE  ACAT-IRA-TRMNT-AMT      TO  ADR-ACCT-IRA-MAINT-AMT.    CAT31   
LRM006     MOVE  ACAT-FRGN-FEE-AMT-TOT   TO  ADR-FRGN-FEE-AMT-TOT.              
                                                                        CAT31   
       0450-SETUP-SORT-REC-EXIT.  EXIT.                                 CAT31   
                                                                        CAT31   
      ********************************************************          CAT31   
      * READ NAME AND ADDRESS FILE FOR THIS CUSTOMER                    CAT31   
      *    INITIALIZE  GETNA-PARAMETERS.                                CAT31   
      ********************************************************          CAT31   
       0475-GET-NAME-ADDRESS.                                           CAT31   
           MOVE  'R'                        TO  GETNA-REQ-FUNC.         CAT31   
           MOVE  'R'                        TO  GETNA-REQ-FILE.         CAT31   
           MOVE  'R'                        TO  GETNA-REQ-FUNC2.        CAT31   
           MOVE  'N'                        TO  GETNA-REQ-YEAREND.      CAT31   
           MOVE  PGM-NME                    TO  GETNA-PGM-NAME.         CAT31   
           MOVE  ACAT-CLT                   TO  GETNA-KEY-CLIENT.       CAT31   
           MOVE  '00'                       TO  GETNA-KEY-BRANCH1-2.    CAT31   
           MOVE  ACAT-BR                    TO  GETNA-KEY-BRANCH3-5.    CAT31   
           MOVE  '00000'                    TO  GETNA-KEY-ACCOUNT1-5.   CAT31   
           MOVE  ACAT-ACCT                  TO  GETNA-KEY-ACCOUNT6-10.  CAT31   
           CALL   GETNA                   USING GETNA-PARAMETERS        CAT31   
                                                GETNA-SEGMENT-INCLUDES  CAT31   
           END-CALL.                                                    CAT31   
                                                                        CAT31   
       0475-GET-NAME-ADDRESS-EXIT.  EXIT.                               CAT31   
           EJECT                                                        CAT31   
       0480-READ-ANNU-FILE.                                             CAT31   
           MOVE SPACES TO ANNUITY-CONTRACT-VALUE-RECORD.                CAT31   
           MOVE ADR-CLIENT TO ANCV-CLIENT-NUMBER.                       CAT31   
           MOVE ADR-BRANCH TO ANCV-ACCT-BR-3.                           CAT31   
           MOVE ADR-ACCOUNT TO ANCV-ACCOUNT-NUMBER.                     CAT31   
           MOVE LOW-VALUES TO ANCV-CARRIER-CODE.                        CAT31   
           MOVE LOW-VALUES TO ANCV-CONTRACT-ID.                         CAT31   
           MOVE 'B' TO ANCV-RECORD-TYPE.                                CAT31   
           READ  ANNU-FILE.                                             CAT31   
           IF  ANNU-ENDFILE  OR                                         CAT31   
               ANNU-NOTFOUND                                            CAT31   
               CONTINUE                                                 CAT31   
           ELSE                                                         CAT31   
             IF  ANNU-FILE-OK                                           CAT31   
                 CONTINUE                                               CAT31   
             ELSE                                                       CAT31   
                 DISPLAY 'ERROR READING ANNUFL, STATUS = '              CAT31   
                          ANNU-FILE-STATUS                              CAT31   
                 MOVE +1099           TO    ABEND-CODE                  CAT31   
                 CALL  ABEND          USING ABEND-CODE                  CAT31   
             END-IF                                                     CAT31   
           END-IF.                                                      CAT31   
       0480-READ-ANNU-FILE-EXIT.  EXIT.                                 CAT31   
                                                                        CAT31   
       0500-ACAT-ACCT-ANAL.                                             CAT31   
                                                                        CAT31   
      * FIRST GET CASH BALANCE FOR THIS CLIENT, BRANCH, ACCOUNT         CAT31   
                                                                        CAT31   
           PERFORM 0510-GET-ACCT-CASH THRU                              CAT31   
                   0510-GET-ACCT-CASH-EXIT.                             CAT31   
                                                                        CAT31   
           IF BALNC-ENDFILE  OR                                         CAT31   
              BALNC-NOTFOUND OR                                         CAT31   
              CMBL-KEY = HIGH-VALUES                                    CAT31   
             CONTINUE                                                   CAT31   
           ELSE                                                         CAT31   
             IF ACAT-CLT   =  CMBL-COMPANY-CODE  AND                    CAT31   
                ACAT-BR    =  CMBL-OFFICE-CODE   AND                    CAT31   
                ACAT-ACCT  =  CMBL-ACCOUNT-NUMBER                       CAT31   
               PERFORM 0520-GET-CASH THRU                               CAT31   
                       0520-GET-CASH-EXIT.                              CAT31   
                                                                        CAT31   
           MOVE ACAT-CLT  TO  CAK-CLIENT.                               CAT31   
           MOVE ACAT-BR   TO  CAK-BRANCH.                               CAT31   
           MOVE ACAT-ACCT TO  CAK-ACCOUNT.                              CAT31   
                                                                        CAT31   
           PERFORM 0600-GET-POSITIONS THRU                              CAT31   
                   0600-GET-POSITIONS-EXIT.                             CAT31   
                                                                        CAT31   
           PERFORM 0750-GET-SPAD-MSGS THRU                              CAT31   
                   0750-GET-SPAD-MSGS-EXIT.                             CAT31   
                                                                        CAT31   
       0500-ACAT-ACCT-ANAL-EXIT.  EXIT.                                 CAT31   
                                                                        CAT31   
       0510-GET-ACCT-CASH.                                              CAT31   
                                                                        CAT31   
      *******************                                               CAT31   
       READ-BALNC-FILE.                                                 CAT31   
      *******************                                               CAT31   
********   MOVE  LOW-VALUES                TO  GETVBAL-PARM.                    
           MOVE  'CAT31'                   TO  GETVBAL-CALLING-PROGRAM.         
           MOVE  'O'  TO GETVBAL-FILE                                           
           MOVE  'R'  TO GETVBAL-FUNC                                           
                                                                        CAT31   
           MOVE  ACAT-CLT                   TO  GETVBAL-OLD-CLIENT.     CAT31   
           MOVE  ACAT-BR                    TO  GETVBAL-OLD-BRANCH.     CAT31   
           MOVE  ACAT-ACCT                  TO  GETVBAL-OLD-ACCT.       CAT31   
           MOVE  ZEROES                     TO  GETVBAL-OLD-CUR-CODE.   CAT31   
           SET GETVBAL-OLD-FILLER-SPACE    TO  TRUE.                    CAT31   
                                                                        CAT31   
           PERFORM CALL-GETVBAL                                                 
           IF  BALNC-ENDFILE  OR                                        CAT31   
               BALNC-NOTFOUND                                           CAT31   
             GO TO 0510-GET-ACCT-CASH-EXIT                              CAT31   
           ELSE                                                         CAT31   
             IF  NOT  BALNC-FILE-OK                                     CAT31   
                 DISPLAY  'BALNC START ERROR, STATUS = '                CAT31   
                           BALNC-FILE-STATUS '   KEY = '                CAT31   
                           CMBL-KEY                                     CAT31   
                 MOVE +1099           TO    ABEND-CODE                  CAT31   
                 CALL  ABEND          USING ABEND-CODE                  CAT31   
             END-IF                                                     CAT31   
           END-IF.                                                      CAT31   
                                                                        CAT31   
           ADD  +1                      TO  BALNC-READ.                 CAT31   
                                                                        CAT31   
       0510-GET-ACCT-CASH-EXIT.  EXIT.                                  CAT31   
           EJECT                                                        CAT31   
                                                                        CAT31   
       0520-GET-CASH.                                                   CAT31   
      * CUSTOMER BALANCE RECORD FOUND FOR ACCOUNT                       CAT31   
      * SETUP COMMON FIELDS FOR SORT RECORD                             CAT31   
                                                                        CAT31   
           PERFORM 0450-SETUP-SORT-REC THRU                             CAT31   
                   0450-SETUP-SORT-REC-EXIT.                            CAT31   
                                                                        CAT31   
           MOVE ZERO                TO  ADR-ASSET-QTY.                  CAT31   
           MOVE SPACES              TO  ADR-CUSIP.                      CAT31   
                                                                        CAT31   
           PERFORM 0475-GET-NAME-ADDRESS THRU                           CAT31   
                   0475-GET-NAME-ADDRESS-EXIT.                          CAT31   
                                                                        CAT31   
           IF  GETNA-RETURN-FOUND  AND                                  CAT31   
               NOT  NAPPA-SEGMENT-MISSING                               CAT31   
               MOVE  NAPPA-SOC-SEC-TAX-ID-N1 TO  ADR-SS-TAX-ID          CAT31   
               MOVE  NAPPA-IRA-KEOUGH-IND    TO  ADR-IRA-KEOUGH-IND     CAT31   
      *        DISPLAY 'NAME/ADDR BIRTH-DATE - ' NAPPA-DATE-OF-BIRTH    CAT31   
           END-IF.                                                      CAT31   
                                                                        CAT31   
      *    MOVE 'CUSTOMER NOT ON NAME ADDRESS FILE' TO ADR-ACCT-TITLE.  CAT31   
      *    IF  GETNA-RETURN-FOUND  AND                                  CAT31   
      *        NOT  NAPPB-SEGMENT-MISSING                               CAT31   
      *        MOVE  NAPPB-NA-LINES (1:51)  TO  ADR-ACCT-TITLE          CAT31   
      *    END-IF.                                                      CAT31   
                                                                        CAT31   
      * DETERMINE IF CUSTOMER IS 70 1/2 YEARS OLD OR OLDER              CAT31   
           IF  GETNA-RETURN-FOUND  AND                                  CAT31   
               NOT  NAPPA-SEGMENT-MISSING  AND                          CAT31   
                    NAPPA-DATE-OF-BIRTH NOT = ZERO AND                  CAT31   
                    NAPPA-DATE-OF-BIRTH NOT > DATE-CALC-N               CAT31   
             MOVE '1'    TO  ADR-70PLUS-IND.                            CAT31   
                                                                        CAT31   
      * IS THIS A MARGIN ACCOUNT                                        CAT31   
           IF  GETNA-RETURN-FOUND  AND                                  CAT31   
               NOT  NAPPA-SEGMENT-MISSING  AND                          CAT31   
                    NAPPA-ACCT-TYPE (2) = '2'                           CAT31   
             MOVE '1'    TO  ADR-MARGIN-IND.                            CAT31   
                                                                        CAT31   
      * IS THERE AN ANNUITY ON ACCOUNT                                  CAT31   
           PERFORM 0480-READ-ANNU-FILE THRU                             CAT31   
                   0480-READ-ANNU-FILE-EXIT.                            CAT31   
           IF  ANNU-FILE-OK                                             CAT31   
               MOVE '1'    TO  ADR-ANNUITY-MSG                          CAT31   
           ELSE                                                         CAT31   
               MOVE  ' ' TO ADR-ANNUITY-MSG                             CAT31   
           END-IF.                                                      CAT31   
                                                                        CAT31   
           IF CMBL-ACTYP1-PRESENT = 1                                   CAT31   
             MOVE '01'                         TO ADR-TRAN-TYPE         CAT31   
             MOVE CMBL1-TRADE-DATE-BAL-YSTDY (1)  TO  ADR-ASSET-VALUE   CAT31   
             PERFORM 1100-REGULAR-XFER-FEE-RTN THRU                     CAT31   
                     1100-REGULAR-XFER-FEE-RTN-EXIT                     CAT31   
             IF NAPPA-IRA-KEOUGH-IND NOT = SPACES AND                   CAT31   
                NAPPA-IRA-KEOUGH-IND NOT = LOW-VALUES                   CAT31   
               PERFORM 1200-IRA-XFER-FEE-RTN THRU                       CAT31   
                       1200-IRA-XFER-FEE-RTN-EXIT                       CAT31   
             END-IF                                                     CAT31   
             PERFORM 1000-RELEASE-REC THRU                              CAT31   
                     1000-RELEASE-REC-EXIT.                             CAT31   
                                                                        CAT31   
           IF CMBL-ACTYP2-PRESENT = 1                                   CAT31   
             MOVE '02'                         TO ADR-TRAN-TYPE         CAT31   
             MOVE CMBL2-TRADE-DATE-BAL-YSTDY (1)  TO  ADR-ASSET-VALUE   CAT31   
             PERFORM 1100-REGULAR-XFER-FEE-RTN THRU                     CAT31   
                     1100-REGULAR-XFER-FEE-RTN-EXIT                     CAT31   
             IF NAPPA-IRA-KEOUGH-IND NOT = SPACES AND                   CAT31   
                NAPPA-IRA-KEOUGH-IND NOT = LOW-VALUES                   CAT31   
               PERFORM 1200-IRA-XFER-FEE-RTN THRU                       CAT31   
                       1200-IRA-XFER-FEE-RTN-EXIT                       CAT31   
             END-IF                                                     CAT31   
             PERFORM 1000-RELEASE-REC THRU                              CAT31   
                     1000-RELEASE-REC-EXIT.                             CAT31   
                                                                        CAT31   
           IF CMBL-ACTYP3-PRESENT = 1                                   CAT31   
             MOVE '01'                         TO ADR-TRAN-TYPE         CAT31   
             MOVE CMBL3-TRADE-DATE-BAL-YSTDY (1)  TO  ADR-ASSET-VALUE   CAT31   
             PERFORM 1100-REGULAR-XFER-FEE-RTN THRU                     CAT31   
                     1100-REGULAR-XFER-FEE-RTN-EXIT                     CAT31   
             IF NAPPA-IRA-KEOUGH-IND NOT = SPACES AND                   CAT31   
                NAPPA-IRA-KEOUGH-IND NOT = LOW-VALUES                   CAT31   
               PERFORM 1200-IRA-XFER-FEE-RTN THRU                       CAT31   
                       1200-IRA-XFER-FEE-RTN-EXIT                       CAT31   
             END-IF                                                     CAT31   
             PERFORM 1000-RELEASE-REC THRU                              CAT31   
                     1000-RELEASE-REC-EXIT.                             CAT31   
                                                                        CAT31   
           IF CMBL-ACTYP4-PRESENT = 1                                   CAT31   
             MOVE '01'                         TO ADR-TRAN-TYPE         CAT31   
             MOVE CMBL4-TRADE-DATE-BAL-YSTDY (1)  TO  ADR-ASSET-VALUE   CAT31   
             PERFORM 1100-REGULAR-XFER-FEE-RTN THRU                     CAT31   
                     1100-REGULAR-XFER-FEE-RTN-EXIT                     CAT31   
             IF NAPPA-IRA-KEOUGH-IND NOT = SPACES AND                   CAT31   
                NAPPA-IRA-KEOUGH-IND NOT = LOW-VALUES                   CAT31   
               PERFORM 1200-IRA-XFER-FEE-RTN THRU                       CAT31   
                       1200-IRA-XFER-FEE-RTN-EXIT                       CAT31   
             END-IF                                                     CAT31   
             PERFORM 1000-RELEASE-REC THRU                              CAT31   
                     1000-RELEASE-REC-EXIT.                             CAT31   
                                                                        CAT31   
           IF CMBL-ACTYP5-PRESENT = 1                                   CAT31   
             MOVE '05'                         TO ADR-TRAN-TYPE         CAT31   
             MOVE CMBL5-TRADE-DATE-BAL-YSTDY (1)  TO  ADR-ASSET-VALUE   CAT31   
             PERFORM 1100-REGULAR-XFER-FEE-RTN THRU                     CAT31   
                     1100-REGULAR-XFER-FEE-RTN-EXIT                     CAT31   
             IF NAPPA-IRA-KEOUGH-IND NOT = SPACES AND                   CAT31   
                NAPPA-IRA-KEOUGH-IND NOT = LOW-VALUES                   CAT31   
               PERFORM 1200-IRA-XFER-FEE-RTN THRU                       CAT31   
                       1200-IRA-XFER-FEE-RTN-EXIT                       CAT31   
             END-IF                                                     CAT31   
             PERFORM 1000-RELEASE-REC THRU                              CAT31   
                     1000-RELEASE-REC-EXIT.                             CAT31   
                                                                        CAT31   
           IF CMBL-ACTYP6-PRESENT = 1                                   CAT31   
             MOVE '01'                         TO ADR-TRAN-TYPE         CAT31   
             MOVE CMBL6-TRADE-DATE-BAL-YSTDY (1)  TO  ADR-ASSET-VALUE   CAT31   
             PERFORM 1100-REGULAR-XFER-FEE-RTN THRU                     CAT31   
                     1100-REGULAR-XFER-FEE-RTN-EXIT                     CAT31   
             IF NAPPA-IRA-KEOUGH-IND NOT = SPACES AND                   CAT31   
                NAPPA-IRA-KEOUGH-IND NOT = LOW-VALUES                   CAT31   
               PERFORM 1200-IRA-XFER-FEE-RTN THRU                       CAT31   
                       1200-IRA-XFER-FEE-RTN-EXIT                       CAT31   
             END-IF                                                     CAT31   
             PERFORM 1000-RELEASE-REC THRU                              CAT31   
                     1000-RELEASE-REC-EXIT.                             CAT31   
                                                                        CAT31   
           IF CMBL-ACTYP7-PRESENT = 1                                   CAT31   
             MOVE '01'                         TO ADR-TRAN-TYPE         CAT31   
             MOVE CMBL7-TRADE-DATE-BAL-YSTDY (1)  TO  ADR-ASSET-VALUE   CAT31   
             PERFORM 1100-REGULAR-XFER-FEE-RTN THRU                     CAT31   
                     1100-REGULAR-XFER-FEE-RTN-EXIT                     CAT31   
             IF NAPPA-IRA-KEOUGH-IND NOT = SPACES AND                   CAT31   
                NAPPA-IRA-KEOUGH-IND NOT = LOW-VALUES                   CAT31   
               PERFORM 1200-IRA-XFER-FEE-RTN THRU                       CAT31   
                       1200-IRA-XFER-FEE-RTN-EXIT                       CAT31   
             END-IF                                                     CAT31   
             PERFORM 1000-RELEASE-REC THRU                              CAT31   
                     1000-RELEASE-REC-EXIT.                             CAT31   
                                                                        CAT31   
           IF CMBL-ACTYP8-PRESENT = 1                                   CAT31   
             MOVE '01'                         TO ADR-TRAN-TYPE         CAT31   
             MOVE CMBL8-TRADE-DATE-BAL-YSTDY (1)  TO  ADR-ASSET-VALUE   CAT31   
             PERFORM 1100-REGULAR-XFER-FEE-RTN THRU                     CAT31   
                     1100-REGULAR-XFER-FEE-RTN-EXIT                     CAT31   
             IF NAPPA-IRA-KEOUGH-IND NOT = SPACES AND                   CAT31   
                NAPPA-IRA-KEOUGH-IND NOT = LOW-VALUES                   CAT31   
               PERFORM 1200-IRA-XFER-FEE-RTN THRU                       CAT31   
                       1200-IRA-XFER-FEE-RTN-EXIT                       CAT31   
             END-IF                                                     CAT31   
             PERFORM 1000-RELEASE-REC THRU                              CAT31   
                     1000-RELEASE-REC-EXIT.                             CAT31   
                                                                        CAT31   
           IF CMBL-ACTYP9-PRESENT = 1                                   CAT31   
             MOVE '01'                         TO ADR-TRAN-TYPE         CAT31   
             MOVE CMBL9-TRADE-DATE-BAL-YSTDY (1)  TO  ADR-ASSET-VALUE   CAT31   
             PERFORM 1100-REGULAR-XFER-FEE-RTN THRU                     CAT31   
                     1100-REGULAR-XFER-FEE-RTN-EXIT                     CAT31   
             IF NAPPA-IRA-KEOUGH-IND NOT = SPACES AND                   CAT31   
                NAPPA-IRA-KEOUGH-IND NOT = LOW-VALUES                   CAT31   
               PERFORM 1200-IRA-XFER-FEE-RTN THRU                       CAT31   
                       1200-IRA-XFER-FEE-RTN-EXIT                       CAT31   
             END-IF                                                     CAT31   
             PERFORM 1000-RELEASE-REC THRU                              CAT31   
                     1000-RELEASE-REC-EXIT.                             CAT31   
                                                                        CAT31   
      * NOW GET SMA TOTAL IF PRESENT                                    CAT31   
           IF CMBL-TOTAL-SMA = ZERO                                     CAT31   
             CONTINUE                                                   CAT31   
           ELSE                                                         CAT31   
             MOVE '00'            TO ADR-TRAN-TYPE                      CAT31   
             MOVE CMBL-TOTAL-SMA  TO ADR-ASSET-VALUE                    CAT31   
             PERFORM 1100-REGULAR-XFER-FEE-RTN THRU                     CAT31   
                     1100-REGULAR-XFER-FEE-RTN-EXIT                     CAT31   
             IF NAPPA-IRA-KEOUGH-IND NOT = SPACES AND                   CAT31   
                NAPPA-IRA-KEOUGH-IND NOT = LOW-VALUES                   CAT31   
               PERFORM 1200-IRA-XFER-FEE-RTN THRU                       CAT31   
                       1200-IRA-XFER-FEE-RTN-EXIT                       CAT31   
             END-IF                                                     CAT31   
             PERFORM 1000-RELEASE-REC THRU                              CAT31   
                     1000-RELEASE-REC-EXIT.                             CAT31   
                                                                        CAT31   
       0520-GET-CASH-EXIT.  EXIT.                                       CAT31   
       EJECT                                                            CAT31   
       0575-B1-NOT-RPTING.                                              CAT31   
                                                                        CAT31   
           IF B1-CL-HIT (B3-SUB) NOT = 'Y'                              CAT31   
      *      IF B1-CNTL-RANGE-NO (B3-SUB) = ZERO                        CAT31   
               INITIALIZE ACAT-DATA-REC                                 CAT31   
               MOVE B1-ADP-CLIENT   (B3-SUB) TO ADR-CLIENT              CAT31   
               MOVE B1-CLIENT-NAME  (B3-SUB) TO ADR-CLIENT-NAME         CAT31   
               MOVE ZEROS                 TO ADR-CONTROLLER             CAT31   
               MOVE LOW-VALUES            TO ADR-CUSIP                  CAT31   
               RELEASE SORT-REC FROM ACAT-DATA-REC.                     CAT31   
      *      ELSE                                                       CAT31   
      *        MOVE 1  TO  B5-SUB                                       CAT31   
      *        PERFORM UNTIL B5-SUB > B1-CNTL-RANGE-NO (B3-SUB)         CAT31   
      *        INITIALIZE ACAT-DATA-REC                                 CAT31   
      *        MOVE B1-ADP-CLIENT   (B3-SUB) TO ADR-CLIENT              CAT31   
      *        MOVE B1-CLIENT-NAME  (B3-SUB) TO ADR-CLIENT-NAME         CAT31   
      *        MOVE B1-CNTL-CODE (B3-SUB B5-SUB) TO ADR-CONTROLLER      CAT31   
      *        MOVE LOW-VALUES TO ADR-CUSIP                             CAT31   
      *        RELEASE SORT-REC FROM ACAT-DATA-REC                      CAT31   
      *        ADD 1 TO B5-SUB                                          CAT31   
      *        END-PERFORM                                              CAT31   
      *      END-IF                                                     CAT31   
      *    ELSE                                                         CAT31   
      *      PERFORM UNTIL B4-SUB > B1-CNTL-RANGE-NO (B3-SUB)           CAT31   
      *      IF B1-CNTL-HIT (B3-SUB B4-SUB) NOT = 'Y'                   CAT31   
      *        INITIALIZE ACAT-DATA-REC                                 CAT31   
      *        MOVE B1-ADP-CLIENT   (B3-SUB) TO ADR-CLIENT              CAT31   
      *        MOVE B1-CLIENT-NAME  (B3-SUB) TO ADR-CLIENT-NAME         CAT31   
      *        MOVE B1-CNTL-CODE (B3-SUB B4-SUB) TO ADR-CONTROLLER      CAT31   
      *        MOVE LOW-VALUES            TO ADR-CUSIP                  CAT31   
      *        RELEASE SORT-REC FROM ACAT-DATA-REC                      CAT31   
      *      END-IF                                                     CAT31   
      *        ADD 1 TO B4-SUB                                          CAT31   
      *      END-PERFORM                                                CAT31   
      *      END-IF.                                                    CAT31   
                                                                        CAT31   
      *    MOVE 1 TO B4-SUB.                                            CAT31   
                                                                        CAT31   
       0575-B1-NOT-RPTING-EXIT.    EXIT.                                CAT31   
                                                                        CAT31   
           EJECT                                                        CAT31   
      ************************************************************      CAT31   
      * PROCESS POSITIONS RECORDS                                       CAT31   
      ************************************************************      CAT31   
       0600-GET-POSITIONS.                                              CAT31   
                                                                        CAT31   
           IF POSITION-END-OF-FILE                                      CAT31   
             GO TO 0600-GET-POSITIONS-EXIT.                             CAT31   
                                                                        CAT31   
           IF CURRENT-ACCOUNT-KEY = POSITION-IN-KEY                     CAT31   
             CONTINUE                                                   CAT31   
           ELSE                                                         CAT31   
             GO TO 0650-GET-NEW-POSITIONS.                              CAT31   
                                                                        CAT31   
           MOVE 'N'  TO  NEW-ACCOUNT-SW.                                CAT31   
           PERFORM UNTIL NEW-ACCOUNT                                    CAT31   
             PERFORM 0800-PROCESS-POSITIONS THRU                        CAT31   
                     0800-PROCESS-POSITIONS-EXIT                        CAT31   
             PERFORM 0700-READ-POSITION-REC THRU                        CAT31   
                     0700-READ-POSITION-REC-EXIT                        CAT31   
             IF CURRENT-ACCOUNT-KEY = POSITION-IN-KEY                   CAT31   
               CONTINUE                                                 CAT31   
             ELSE                                                       CAT31   
               MOVE 'Y' TO NEW-ACCOUNT-SW                               CAT31   
             END-IF                                                     CAT31   
           END-PERFORM.                                                 CAT31   
           GO TO 0600-GET-POSITIONS-EXIT.                               CAT31   
                                                                        CAT31   
       0650-GET-NEW-POSITIONS.                                          CAT31   
                                                                        CAT31   
           IF POSITION-END-OF-FILE                                      CAT31   
             GO TO 0600-GET-POSITIONS-EXIT.                             CAT31   
                                                                        CAT31   
           IF CURRENT-ACCOUNT-KEY < POSITION-IN-KEY                     CAT31   
             GO TO 0600-GET-POSITIONS-EXIT.                             CAT31   
                                                                        CAT31   
           PERFORM 0700-READ-POSITION-REC THRU                          CAT31   
                   0700-READ-POSITION-REC-EXIT.                         CAT31   
                                                                        CAT31   
           IF CURRENT-ACCOUNT-KEY > POSITION-IN-KEY                     CAT31   
             GO TO 0650-GET-NEW-POSITIONS.                              CAT31   
                                                                        CAT31   
           IF CURRENT-ACCOUNT-KEY < POSITION-IN-KEY                     CAT31   
             GO TO 0600-GET-POSITIONS-EXIT.                             CAT31   
                                                                        CAT31   
      * ACCOUNTS ARE EQUAL                                              CAT31   
           MOVE 'N'  TO  NEW-ACCOUNT-SW.                                CAT31   
           PERFORM UNTIL NEW-ACCOUNT                                    CAT31   
             PERFORM 0800-PROCESS-POSITIONS THRU                        CAT31   
                     0800-PROCESS-POSITIONS-EXIT                        CAT31   
             PERFORM 0700-READ-POSITION-REC THRU                        CAT31   
                     0700-READ-POSITION-REC-EXIT                        CAT31   
             IF CURRENT-ACCOUNT-KEY = POSITION-IN-KEY                   CAT31   
               CONTINUE                                                 CAT31   
             ELSE                                                       CAT31   
               MOVE 'Y' TO NEW-ACCOUNT-SW                               CAT31   
             END-IF                                                     CAT31   
           END-PERFORM.                                                 CAT31   
                                                                        CAT31   
       0600-GET-POSITIONS-EXIT.  EXIT.                                  CAT31   
                                                                        CAT31   
           EJECT                                                        CAT31   
                                                                        CAT31   
       0700-READ-POSITION-REC.                                          CAT31   
           READ POSITION-FILE INTO POS-RECORD                           CAT31   
             AT END MOVE 'Y' TO POSITION-FILE-EOF-SW                    CAT31   
                     MOVE '99999999999' TO POSITION-IN-KEY              CAT31   
                      DISPLAY 'END OF FILE - POSITION FILE '            CAT31   
                      GO TO 0700-READ-POSITION-REC-EXIT.                CAT31   
                                                                        CAT31   
           ADD  1          TO  POSITION-RECS-READ.                      CAT31   
           MOVE POS-CLT    TO  PIK-CLIENT.                              CAT31   
           MOVE POS-BR     TO  PIK-BRANCH.                              CAT31   
           MOVE POS-ACCT   TO  PIK-ACCOUNT.                             CAT31   
                                                                        CAT31   
           IF POS-SEC (1:3) = '866'                                     CAT31   
             GO TO 0700-READ-POSITION-REC.                              CAT31   
                                                                        CAT31   
           IF POS-SEC  = '9999340' OR '9999348'                         CAT31   
             GO TO 0700-READ-POSITION-REC.                              CAT31   
                                                                        CAT31   
       0700-READ-POSITION-REC-EXIT.  EXIT.                              CAT31   
                                                                        CAT31   
           EJECT                                                        CAT31   
       0750-GET-SPAD-MSGS.                                              CAT31   
                                                                        CAT31   
           MOVE LOW-VALUES     TO  SPAD-VSAM-KEY.                       CAT31   
           MOVE ACAT-CLT       TO  SPM-CLT.                             CAT31   
           MOVE ACAT-BR        TO  SPM-BR.                              CAT31   
           MOVE '-'            TO  SPM-DASH.                            CAT31   
           MOVE ACAT-ACCT      TO  SPM-ACCT.                            CAT31   
                                                                        CAT31   
           START SPAD-FILE KEY NOT LESS THAN SPAD-VSAM-KEY.             CAT31   
                                                                        CAT31   
           IF SPAD-ENDFILE  OR                                          CAT31   
              SPAD-NOTFOUND                                             CAT31   
             GO TO 0750-GET-SPAD-MSGS-EXIT                              CAT31   
           ELSE                                                         CAT31   
             IF NOT SPAD-FILE-OK                                        CAT31   
                DISPLAY  'SPAD FILE START ERROR, STATUS = '             CAT31   
                SPAD-FILE-STATUS '   KEY = '                            CAT31   
                SPAD-VSAM-KEY                                           CAT31   
                MOVE +2000      TO    ABEND-CODE                        CAT31   
                CALL ABEND      USING ABEND-CODE                        CAT31   
             END-IF                                                     CAT31   
           END-IF.                                                      CAT31   
                                                                        CAT31   
       0760-NEXT-SPAD-REC.                                              CAT31   
           READ SPAD-FILE  NEXT RECORD.                                 CAT31   
                                                                        CAT31   
           IF SPAD-ENDFILE  OR                                          CAT31   
              SPAD-NOTFOUND                                             CAT31   
             GO TO 0750-GET-SPAD-MSGS-EXIT                              CAT31   
           ELSE                                                         CAT31   
             IF NOT SPAD-FILE-OK                                        CAT31   
                DISPLAY  'SPAD FILE START ERROR, STATUS = '             CAT31   
                SPAD-FILE-STATUS '   KEY = '                            CAT31   
                SPAD-VSAM-KEY                                           CAT31   
                MOVE +2000      TO    ABEND-CODE                        CAT31   
                CALL ABEND      USING ABEND-CODE                        CAT31   
             END-IF                                                     CAT31   
           END-IF.                                                      CAT31   
                                                                        CAT31   
           IF SPM-CLT   =  ACAT-CLT   AND                               CAT31   
              SPM-BR    =  ACAT-BR    AND                               CAT31   
              SPM-ACCT  =  ACAT-ACCT                                    CAT31   
             CONTINUE                                                   CAT31   
           ELSE                                                         CAT31   
              GO TO 0750-GET-SPAD-MSGS-EXIT.                            CAT31   
                                                                        CAT31   
      * SPAD MESSAGE RECORDS HAVE SEQ # IN POSITIONS 21-23              CAT31   
           IF SPAD-VSAM-KEY (21:3) NUMERIC                              CAT31   
             CONTINUE                                                   CAT31   
           ELSE                                                         CAT31   
             GO TO 0760-NEXT-SPAD-REC.                                  CAT31   
                                                                        CAT31   
           MOVE SPAD-REC-2   TO  SPAD-REC.                              CAT31   
                                                                        CAT31   
           IF  SPM-EXP-DATE-CCYYMMDD  NUMERIC                           CAT31   
               IF  SPM-EXP-DATE-CCYYMMDD  <  PROC-DATE-N                CAT31   
             GO TO 0760-NEXT-SPAD-REC                                   CAT31   
           END-IF.                                                      CAT31   
                                                                        CAT31   
           PERFORM 0450-SETUP-SORT-REC THRU                             CAT31   
                   0450-SETUP-SORT-REC-EXIT.                            CAT31   
                                                                        CAT31   
           PERFORM 0475-GET-NAME-ADDRESS THRU                           CAT31   
                   0475-GET-NAME-ADDRESS-EXIT.                          CAT31   
                                                                        CAT31   
           MOVE 'M'             TO  ADR-PROCESS-CODE.                   CAT31   
           MOVE 'SPADMSG'       TO  ADR-CUSIP.                          CAT31   
           MOVE '90'            TO  ADR-TRAN-TYPE.                      CAT31   
           MOVE SPM-MESG        TO  ADR-SPAD-MSG.                       CAT31   
                                                                        CAT31   
           IF  GETNA-RETURN-FOUND  AND                                  CAT31   
               NOT  NAPPA-SEGMENT-MISSING                               CAT31   
               MOVE  NAPPA-SOC-SEC-TAX-ID-N1 TO  ADR-SS-TAX-ID          CAT31   
               MOVE  NAPPA-IRA-KEOUGH-IND    TO  ADR-IRA-KEOUGH-IND     CAT31   
           END-IF.                                                      CAT31   
                                                                        CAT31   
      *    MOVE 'CUSTOMER NOT ON NAME ADDRESS FILE' TO ADR-ACCT-TITLE.  CAT31   
      *    IF  GETNA-RETURN-FOUND  AND                                  CAT31   
      *        NOT  NAPPB-SEGMENT-MISSING                               CAT31   
      *        MOVE  NAPPB-NA-LINES (1:51)  TO  ADR-ACCT-TITLE          CAT31   
      *    END-IF.                                                      CAT31   
                                                                        CAT31   
      * DETERMINE IF CUSTOMER IS 70 1/2 YEARS OLD OR OLDER              CAT31   
           IF  GETNA-RETURN-FOUND  AND                                  CAT31   
               NOT  NAPPA-SEGMENT-MISSING  AND                          CAT31   
                    NAPPA-DATE-OF-BIRTH NOT = ZERO AND                  CAT31   
                    NAPPA-DATE-OF-BIRTH NOT > DATE-CALC-N               CAT31   
             MOVE '1'    TO  ADR-70PLUS-IND.                            CAT31   
                                                                        CAT31   
      * IS THIS A MARGIN ACCOUNT                                        CAT31   
           IF  GETNA-RETURN-FOUND  AND                                  CAT31   
               NOT  NAPPA-SEGMENT-MISSING  AND                          CAT31   
                    NAPPA-ACCT-TYPE (2) = '2'                           CAT31   
             MOVE '1'    TO  ADR-MARGIN-IND.                            CAT31   
                                                                        CAT31   
      * IS THERE AN ANNUITY ON ACCOUNT                                  CAT31   
           PERFORM 0480-READ-ANNU-FILE THRU                             CAT31   
                   0480-READ-ANNU-FILE-EXIT.                            CAT31   
           IF  ANNU-FILE-OK                                             CAT31   
               MOVE '1'    TO  ADR-ANNUITY-MSG                          CAT31   
           ELSE                                                         CAT31   
               MOVE  ' ' TO ADR-ANNUITY-MSG                             CAT31   
           END-IF.                                                      CAT31   
                                                                        CAT31   
      * CALCULATE TRANSFER FEES                                         CAT31   
           PERFORM 1100-REGULAR-XFER-FEE-RTN THRU                       CAT31   
                   1100-REGULAR-XFER-FEE-RTN-EXIT.                      CAT31   
           IF NAPPA-IRA-KEOUGH-IND NOT = SPACES AND                     CAT31   
              NAPPA-IRA-KEOUGH-IND NOT = LOW-VALUES                     CAT31   
             PERFORM 1200-IRA-XFER-FEE-RTN THRU                         CAT31   
                     1200-IRA-XFER-FEE-RTN-EXIT.                        CAT31   
                                                                        CAT31   
           PERFORM 1000-RELEASE-REC THRU                                CAT31   
                   1000-RELEASE-REC-EXIT.                               CAT31   
                                                                        CAT31   
           GO TO 0760-NEXT-SPAD-REC.                                    CAT31   
                                                                        CAT31   
       0750-GET-SPAD-MSGS-EXIT.  EXIT.                                  CAT31   
                                                                        CAT31   
           EJECT                                                        CAT31   
                                                                        CAT31   
      ************************************************************      CAT31   
      * BUILD SORT RECORD                                               CAT31   
      * GET SECURITY DESC AND CUSIP                                     CAT31   
      * READ REGISTRATION OPTION FILE                                   CAT31   
      ************************************************************      CAT31   
       0800-PROCESS-POSITIONS.                                          CAT31   
                                                                        CAT31   
           PERFORM 0450-SETUP-SORT-REC THRU                             CAT31   
                   0450-SETUP-SORT-REC-EXIT.                            CAT31   
                                                                        CAT31   
           MOVE POS-QTY             TO  ADR-ASSET-QTY.                  CAT31   
           MOVE POS-TOT-MKT-VALUE   TO  ADR-ASSET-VALUE.                CAT31   
           IF POS-QTY < ZERO                                            CAT31   
              COMPUTE ADR-ASSET-VALUE = (ADR-ASSET-VALUE * -1)          CAT31   
           END-IF.                                                      CAT31   
           MOVE POS-DESC1           TO  ADR-SECURITY-DESC1.             CAT31   
           MOVE POS-DESC2           TO  ADR-SECURITY-DESC2.             CAT31   
           MOVE POS-DESC3           TO  ADR-SECURITY-DESC3.             CAT31   
           MOVE POS-SEC             TO  ADR-ADP-SEC-NO.                 CAT31   
                                                                        CAT31   
           MOVE '00'                TO  ADR-TRAN-TYPE.                  CAT31   
                                                                        CAT31   
           IF VALID-POS-TYPE                                            CAT31   
             MOVE POS-TYPE          TO  ADR-TRAN-TYPE (2:1)             CAT31   
           ELSE                                                         CAT31   
             DISPLAY 'INVALID POS-TYPE (POSITION TYPE) IN POS RECORD'   CAT31   
             DISPLAY 'POS-TYPE - ' POS-TYPE                             CAT31   
             DISPLAY 'RECORD IMAGE FOLLOWS'                             CAT31   
             DISPLAY POS-RECORD                                         CAT31   
             DISPLAY 'THIS RECORD BYPASSED'                             CAT31   
             GO TO 0800-PROCESS-POSITIONS-EXIT.                         CAT31   
                                                                        CAT31   
           PERFORM 0475-GET-NAME-ADDRESS THRU                           CAT31   
                   0475-GET-NAME-ADDRESS-EXIT.                          CAT31   
                                                                        CAT31   
           IF  GETNA-RETURN-FOUND  AND                                  CAT31   
               NOT  NAPPA-SEGMENT-MISSING                               CAT31   
               MOVE  NAPPA-SOC-SEC-TAX-ID-N1 TO  ADR-SS-TAX-ID          CAT31   
               MOVE  NAPPA-IRA-KEOUGH-IND    TO  ADR-IRA-KEOUGH-IND     CAT31   
           END-IF.                                                      CAT31   
                                                                        CAT31   
      *    MOVE 'CUSTOMER NOT ON NAME ADDRESS FILE' TO ADR-ACCT-TITLE.  CAT31   
      *    IF  GETNA-RETURN-FOUND  AND                                  CAT31   
      *        NOT  NAPPB-SEGMENT-MISSING                               CAT31   
      *        MOVE  NAPPB-NA-LINES (1:51)  TO  ADR-ACCT-TITLE          CAT31   
      *    END-IF.                                                      CAT31   
                                                                        CAT31   
      * DETERMINE IF CUSTOMER IS 70 1/2 YEARS OLD OR OLDER              CAT31   
           IF  GETNA-RETURN-FOUND  AND                                  CAT31   
               NOT  NAPPA-SEGMENT-MISSING  AND                          CAT31   
                    NAPPA-DATE-OF-BIRTH NOT = ZERO AND                  CAT31   
                    NAPPA-DATE-OF-BIRTH NOT > DATE-CALC-N               CAT31   
             MOVE '1'    TO  ADR-70PLUS-IND.                            CAT31   
                                                                        CAT31   
      * IS THIS A MARGIN ACCOUNT                                        CAT31   
           IF  GETNA-RETURN-FOUND  AND                                  CAT31   
               NOT  NAPPA-SEGMENT-MISSING  AND                          CAT31   
                    NAPPA-ACCT-TYPE (2) = '2'                           CAT31   
             MOVE '1'    TO  ADR-MARGIN-IND.                            CAT31   
                                                                        CAT31   
      * IS THERE AN ANNUITY ON ACCOUNT                                  CAT31   
           PERFORM 0480-READ-ANNU-FILE THRU                             CAT31   
                   0480-READ-ANNU-FILE-EXIT.                            CAT31   
           IF  ANNU-FILE-OK                                             CAT31   
               MOVE '1'    TO  ADR-ANNUITY-MSG                          CAT31   
           ELSE                                                         CAT31   
               MOVE  ' ' TO ADR-ANNUITY-MSG                             CAT31   
           END-IF.                                                      CAT31   
                                                                        CAT31   
      * POSITION RECORD GET CUSIP FROM MSD FILE                         CAT31   
                                                                        CAT31   
           MOVE '         '        TO ADR-CUSIP.                        CAT31   
           PERFORM 0900-GET-MSD THRU                                    CAT31   
                   0900-GET-MSD-EXIT.                                   CAT31   
           IF MSD-RECORD-FOUND                                          CAT31   
             MOVE MS-CUSIP-NO     TO ADR-CUSIP                          CAT31   
             PERFORM 0950-GET-REG-OPT THRU                              CAT31   
                     0950-GET-REG-OPT-EXIT                              CAT31   
           END-IF.                                                      CAT31   
                                                                        CAT31   
                                                                        CAT31   
      * RECORD CAN BE FOUND ON MSD BUT STILL HAVE NO CUSIP              CAT31   
      * MONEY MARKET PORTFOLIOS MAY NOT HAVE A CUSIP                    CAT31   
                                                                        CAT31   
           IF ADR-CUSIP = SPACES OR LOW-VALUES                          CAT31   
             MOVE '000000000'  TO  ADR-CUSIP.                           CAT31   
                                                                        CAT31   
      * MEMO PROCESSING CHECK FOR MEMOS IF PRESENT INCLUDE ON SORTREC   CAT31   
                                                                        CAT31   
           MOVE ZERO   TO  M1-SUB.                                      CAT31   
           MOVE 1      TO  M2-SUB.                                      CAT31   
           PERFORM UNTIL M2-SUB > 4                                     CAT31   
           MOVE POS-MEMO-CODE (M2-SUB) TO  WK-LEN-X                     CAT31   
             IF POS-MEMO-CODE (M2-SUB) NOT = SPACES     AND             CAT31   
                POS-MEMO-CODE (M2-SUB) NOT = LOW-VALUES AND             CAT31   
                POS-MEMO-QTY  (M2-SUB) NOT = ZERO       AND             CAT31   
                WK-LEN                 NOT = 1                          CAT31   
               ADD 1   TO  M1-SUB                                       CAT31   
               MOVE POS-MEMO-CODE (M2-SUB)  TO                          CAT31   
                                ADR-MEMO-CODE (M1-SUB)                  CAT31   
               MOVE POS-MEMO-QTY  (M2-SUB)  TO                          CAT31   
                                ADR-MEMO-QTY  (M1-SUB)                  CAT31   
             END-IF                                                     CAT31   
           ADD 1 TO M2-SUB                                              CAT31   
           END-PERFORM.                                                 CAT31   
                                                                        CAT31   
           MOVE M1-SUB  TO  ADR-MEMO-COUNT.                             CAT31   
                                                                        CAT31   
      * TRANSFER FEES MUST NOW BE CALCULATED DETERMINE ACCT TYPE        CAT31   
                                                                        CAT31   
           PERFORM 1100-REGULAR-XFER-FEE-RTN THRU                       CAT31   
                   1100-REGULAR-XFER-FEE-RTN-EXIT.                      CAT31   
           IF NAPPA-IRA-KEOUGH-IND NOT = SPACES AND                     CAT31   
                NAPPA-IRA-KEOUGH-IND NOT = LOW-VALUES                   CAT31   
             PERFORM 1200-IRA-XFER-FEE-RTN THRU                         CAT31   
                     1200-IRA-XFER-FEE-RTN-EXIT.                        CAT31   
                                                                        CAT31   
      * CHECK FOR PERIODIC PAYMENT RECORD                               CAT31   
      * FOR REPORTING IT MUST SORT BEFORE SECURITIES                    CAT31   
           IF POS-SEC = 'A000555'                                       CAT31   
             MOVE ALL '0'  TO  ADR-CUSIP.                               CAT31   
                                                                        CAT31   
           IF POS-SEC > 'A000045' AND                                   CAT31   
              POS-SEC < 'A001000'                                       CAT31   
             MOVE '1'  TO  ADR-NOT-RPT-IND.                             CAT31   
                                                                        CAT31   
      * IS THIS AN OPTION                                               CAT31   
           IF (WK-MS-SEC-1 = '8' OR '9')                                CAT31   
                 AND                                                    CAT31   
               (WK-MS-CLASS-1-2-3 = 664 OR 665) AND                     CAT31   
                 MSD-RECORD-FOUND                                       CAT31   
                 MOVE MS-OPTION-EXP-DATE     TO WK-MS-EXP-DATE          CAT31   
      *          DISPLAY 'EXPIRE DATE - ' WK-MS-EXP-DATE                CAT31   
                 MOVE WK-MS-EXP-MM           TO ADR-OPT-EXPIRE-MM       CAT31   
                 MOVE WK-MS-EXP-Y            TO ADR-OPT-EXPIRE-Y        CAT31   
ENP001           MOVE MS-EXP-OPTION-STRIKE-PRICE TO ADR-OPT-PRICE       CAT31   
                 MOVE POS-QTY                TO ADR-OPT-QTY             CAT31   
                 MOVE '1'                    TO ADR-OPTION-IND          CAT31   
                 MOVE 'C'                    TO ADR-OPT-OPEN-CLOSE      CAT31   
                 MOVE '80'                   TO ADR-TRAN-TYPE           CAT31   
                 MOVE POS-DESC1              TO ADR-OPT-OPTION-DATA     CAT31   
                 MOVE 'OPTION'               TO ADR-CUSIP               CAT31   
              IF WK-MS-CLASS-1-2-3 = 664                                CAT31   
                 MOVE 'C'                    TO ADR-OPT-PUT-CALL        CAT31   
              ELSE                                                      CAT31   
                 MOVE 'P'                    TO ADR-OPT-PUT-CALL        CAT31   
              END-IF                                                    CAT31   
                                                                        CAT31   
              IF POS-QTY > ZERO                                         CAT31   
                 MOVE '2'                    TO ADR-OPT-BUY-SELL        CAT31   
              ELSE                                                      CAT31   
                 MOVE '1'                    TO ADR-OPT-BUY-SELL        CAT31   
              END-IF                                                    CAT31   
                                                                        CAT31   
              IF  MS-SYMBOL   = SPACES                                  CAT31   
                 MOVE SPACES    TO ADR-OPT-SYMBOL                       CAT31   
              ELSE                                                      CAT31   
                 PERFORM 960-GET-SYMBOL-FOR-OPTION THRU                 CAT31   
                         960-GET-SYMBOL-FOR-OPTION-EXIT                 CAT31   
              END-IF                                                    CAT31   
           END-IF.                                                      CAT31   
                                                                        CAT31   
      * SECURITY FOUND ON MSD AND REG OPT FILE                          CAT31   
      * DETERMINE IF ITS A MUTUAL FUND                                  CAT31   
C02808*    MOVE SPACE               TO  MUTUAL-FUND-IND.                CAT31   
C02808*                                                                 CAT31   
C02808*    IF MSD-RECORD-FOUND AND                                      CAT31   
C02808*      ((WK-MS-CLASS-1 = 1  AND  WK-MS-CLASS-2 = 5)  OR           CAT31   
C02808*       (WK-MS-CLASS-1 = 6  AND  WK-MS-CLASS-2 = 3))              CAT31   
C02808*      IF  WK-MS-CLASS-7 = 6                                      CAT31   
C02808*         CONTINUE                                                CAT31   
C02808*      ELSE                                                       CAT31   
C02808*         MOVE 'Y' TO MUTUAL-FUND-IND                             CAT31   
C02808*                     ADR-MUTUAL-FUND-IND                         CAT31   
C02808*      END-IF                                                     CAT31   
C02808*    END-IF.                                                      CAT31   
C02808*                                                                 CAT31   
C02492                                                                  CAT31   
C02492         MOVE  'N'                  TO  ADR-DTC-IND.              CAT31   
C02492         MOVE  'N'                  TO  ADR-CNS-IND.              CAT31   
C02492         EVALUATE  WK-MS-CLASS (1:1)                              CAT31   
C02492             WHEN  '1'                                            CAT31   
C02492               IF (WK-MS-CLASS (4:1) = '3' OR '4')                CAT31   
C02492                   MOVE  'Y'    TO  ADR-DTC-IND                   CAT31   
C02492               END-IF                                             CAT31   
C02492               IF (WK-MS-CLASS (5:1) = '5' OR '6')                CAT31   
C02492                   MOVE  'Y'    TO  ADR-CNS-IND                   CAT31   
C02492               END-IF                                             CAT31   
C02492             WHEN  '2'                                            CAT31   
C02492               IF (WK-MS-CLASS (4:1) = '2' OR '3' OR '4')         CAT31   
C02492                   MOVE  'Y'    TO  ADR-DTC-IND                   CAT31   
C02492               END-IF                                             CAT31   
C02492               IF (WK-MS-CLASS (5:1) = '2' OR '5' OR '6')         CAT31   
C02492                   MOVE  'Y'    TO  ADR-CNS-IND                   CAT31   
C02492               END-IF                                             CAT31   
C02492             WHEN  '3'                                            CAT31   
C02492               IF  (WK-MS-CLASS (4:1) = '2' OR '3' OR '4')        CAT31   
C02492                   MOVE  'Y'    TO  ADR-DTC-IND                   CAT31   
C02492               END-IF                                             CAT31   
C02492               IF  (WK-MS-CLASS (5:1) = '2' OR '6')               CAT31   
C02492                   MOVE  'Y'    TO  ADR-CNS-IND                   CAT31   
C02492               END-IF                                             CAT31   
C02492             WHEN  '4'                                            CAT31   
C02492               IF (WK-MS-CLASS (4:1) = '2' OR '3' OR '4')         CAT31   
C02492                   MOVE  'Y'    TO  ADR-DTC-IND                   CAT31   
C02492               END-IF                                             CAT31   
C02492               IF  WK-MS-CLASS (5:1) = '6'                        CAT31   
C02492                   MOVE  'Y'    TO  ADR-CNS-IND                   CAT31   
C02492               END-IF                                             CAT31   
C02492             WHEN  '6'                                            CAT31   
C02492               IF  WK-MS-CLASS (2:1) = '6'                        CAT31   
C02492                   CONTINUE                                       CAT31   
C02492               ELSE                                               CAT31   
C02492                 IF WK-MS-CLASS (4:1) = '3'                       CAT31   
C02492                    MOVE  'Y'    TO  ADR-DTC-IND                  CAT31   
C02492                 END-IF                                           CAT31   
C02492                 IF  (WK-MS-CLASS (5:1) = '5' OR '6')             CAT31   
C02492                     MOVE  'Y'   TO  ADR-CNS-IND                  CAT31   
C02492                 END-IF                                           CAT31   
C02492               END-IF                                             CAT31   
C02492             WHEN  '7'                                            CAT31   
C02492               IF (WK-MS-CLASS (4:1) = '3' OR '4')                CAT31   
C02492                  MOVE  'Y'    TO  ADR-DTC-IND                    CAT31   
C02492               END-IF                                             CAT31   
C02492               IF  WK-MS-CLASS (5:1) = '6'                        CAT31   
C02492                   MOVE  'Y'   TO  ADR-CNS-IND                    CAT31   
C02492               END-IF                                             CAT31   
C02492             WHEN  OTHER                                          CAT31   
C02492                   CONTINUE                                       CAT31   
C02492         END-EVALUATE.                                            CAT31   
                                                                        CAT31   
      * MAINTENANCE FEES APPLY FOR LEGG MASON ONLY                      CAT31   
C02808*                                                                 CAT31   
C02808*       IF B1-WRK-MAINT-FEE-FOR-IRA = '1' AND                     CAT31   
C02808*          NAPPA-IRA-KEOUGH-IND NOT = SPACE AND                   CAT31   
C02808*          ADR-PROCESS-CODE = 'L'                                 CAT31   
C02808*          MOVE 10 TO ADR-IRA-MAINT-FEE                           CAT31   
C02808*       END-IF.                                                   CAT31   
C02808*       IF B1-WRK-MAINT-FEE-FOR-IRA = '1' AND                     CAT31   
C02808*          NAPPA-IRA-KEOUGH-IND NOT = SPACE AND                   CAT31   
C02808*          ADR-PROCESS-CODE = 'O' AND                             CAT31   
C02808*          MUTUAL-FUND                                            CAT31   
C02808*          MOVE 35  TO  ADR-IRA-MAINT-FEE                         CAT31   
C02808*       END-IF.                                                   CAT31   
C02808      MOVE  0  TO ADR-IRA-MAINT-FEE.                              CAT31   
                                                                        CAT31   
           PERFORM 2000-MSDDB2-RTN THRU                                 CAT31   
                   2000-MSDDB2-RTN-EXIT.                                CAT31   
           IF  VALID-REORG-CD                                           CAT31   
               ADD 1                TO  REORG-VALID-CNT                 CAT31   
               MOVE WS-REORG-CD     TO  ADR-REORG-CD                    CAT31   
           ELSE                                                         CAT31   
               MOVE SPACES          TO  ADR-REORG-CD                    CAT31   
           END-IF.                                                      CAT31   
                                                                        CAT31   
           PERFORM 1000-RELEASE-REC THRU                                CAT31   
                   1000-RELEASE-REC-EXIT.                               CAT31   
                                                                        CAT31   
       0800-PROCESS-POSITIONS-EXIT.  EXIT.                              CAT31   
                                                                        CAT31   
           EJECT                                                        CAT31   
       0900-GET-MSD.                                                    CAT31   
      ************************************************************      CAT31   
      * GET MSD                                                         CAT31   
      ************************************************************      CAT31   
           SET GETMSD-DEVICE-DISK    TO TRUE                            CAT31   
           SET GETMSD-ACCESS-RANDOM  TO TRUE                            CAT31   
           SET GETMSD-FORMAT-EXPANDED TO TRUE                           CAT31   
DJ0004     MOVE LOW-VALUES           TO GETMSD-SEARCH-KEY-AREA          CAT31   
           MOVE POS-SEC              TO GETMSD-SEARCH-KEY-SEC           CAT31   
                                        WK-MS-SEC                       CAT31   
DJ0004     MOVE '0'                  TO GETMSD-WI-CODE                  CAT31   
DJ0004     MOVE ACAT-CLT             TO GETMSD-CLIENT-PL2               CAT31   
           CALL  GETMSDC  USING MASTER-SECURITY-RECORD                  CAT31   
           EVALUATE TRUE                                                CAT31   
              WHEN GETMSD-RETURN-IO-ERROR                               CAT31   
                  DISPLAY 'ERROR ACCESSING MSD FILE'                    CAT31   
                  MOVE +4040 TO ABORT-CODE                              CAT31   
                  PERFORM ABEND-RTN                                     CAT31   
              WHEN GETMSD-RETURN-REC-NOT-FOUND                          CAT31   
                  SET MSD-RECORD-NOT-FOUND TO TRUE                      CAT31   
              WHEN GETMSD-RETURN-VALID                                  CAT31   
                  SET MSD-RECORD-FOUND TO TRUE                          CAT31   
                  MOVE MS-FORMAT-IND       TO  WK-MS-CLASS-1            CAT31   
                  MOVE MS-SECURITY-TYPE    TO  WK-MS-SEC-TYPE-X         CAT31   
                  MOVE WK-MS-SEC-TYPE-P    TO  WK-MS-SEC-TYPE-N         CAT31   
                  MOVE WK-MS-SEC-TYPE      TO  WK-MS-CLASS-2-5          CAT31   
                  MOVE MS-SECURITY-TYPE-2  TO  WK-MS-CLASS-6-7          CAT31   
              WHEN OTHER                                                CAT31   
                  SET MSD-RECORD-NOT-FOUND TO TRUE                      CAT31   
           END-EVALUATE.                                                CAT31   
                                                                        CAT31   
       0900-GET-MSD-EXIT.  EXIT.                                        CAT31   
           EJECT                                                        CAT31   
       0950-GET-REG-OPT.                                                CAT31   
                                                                        CAT31   
           MOVE 'N'             TO  ACAT-EXCLUDE-SW.                    CAT31   
           MOVE ACAT-CLT        TO  CLIENT-NO.                          CAT31   
           MOVE SPACES          TO  CUSIP-15.                           CAT31   
           MOVE MS-CUSIP-NO     TO  CUSIP-9.                            CAT31   
                                                                        CAT31   
           READ REG-OPT-FILE.                                           CAT31   
           IF REG-FILE-INVALID-KEY                                      CAT31   
      *      DISPLAY 'NOT FOUND REG OP FILE KEY - ' REG-OPT-KEY-AREA    CAT31   
             MOVE 'O'             TO  ADR-PROCESS-CODE                  CAT31   
             GO TO 0950-GET-REG-OPT-EXIT.                               CAT31   
           IF REG-FILE-STATUS = '00'                                    CAT31   
             CONTINUE                                                   CAT31   
           ELSE                                                         CAT31   
             DISPLAY 'ERROR READING REGISTRATION OPTION FILE '          CAT31   
              'FILE STATUS = ' REG-FILE-STATUS                          CAT31   
              MOVE +4050 TO ABORT-CODE                                  CAT31   
              PERFORM ABEND-RTN.                                        CAT31   
                                                                        CAT31   
           IF PROCESSING-CODE = 'L'                                     CAT31   
             MOVE 'L'    TO  ADR-PROCESS-CODE                           CAT31   
           ELSE                                                         CAT31   
             MOVE 'O'    TO  ADR-PROCESS-CODE.                          CAT31   
                                                                        CAT31   
       0950-GET-REG-OPT-EXIT.  EXIT.                                    CAT31   
           EJECT                                                        CAT31   
       960-GET-SYMBOL-FOR-OPTION.                                       CAT31   
           SKIP3                                                        CAT31   
           MOVE MS-SYMBOL-AREA      TO OPT-WORK1                        CAT31   
           MOVE    12               TO SUB                              CAT31   
           PERFORM UNTIL NOT (OPT-WORK3 (SUB) = SPACES)                 CAT31   
               SUBTRACT 1  FROM SUB                                     CAT31   
           END-PERFORM                                                  CAT31   
           SKIP1                                                        CAT31   
           IF OPT-WORK3 (SUB) IS NUMERIC                                CAT31   
               PERFORM 965-OPTION-LOOP THRU                             CAT31   
                       965-OPTION-LOOP-EXIT                             CAT31   
           ELSE                                                         CAT31   
               SUBTRACT 2 FROM SUB                                      CAT31   
           END-IF                                                       CAT31   
           MOVE SPACES TO  OPTION-SYMBOL1 (1)                           CAT31   
                           OPTION-SYMBOL1 (2)                           CAT31   
                           OPTION-SYMBOL1 (3)                           CAT31   
           MOVE     3 TO   SUB1                                         CAT31   
           PERFORM UNTIL SUB = 1                                        CAT31   
               MOVE  OPT-WORK3 (SUB) TO  OPTION-SYMBOL1 (SUB1)          CAT31   
               SUBTRACT 1         FROM SUB                              CAT31   
                                       SUB1                             CAT31   
               END-SUBTRACT                                             CAT31   
           END-PERFORM                                                  CAT31   
           MOVE  1          TO SUB                                      CAT31   
                               SUB1                                     CAT31   
           MOVE SPACES      TO  OPT-SYMBOL                              CAT31   
           PERFORM UNTIL SUB1 > 3                                       CAT31   
               IF  OPTION-SYMBOL1 (SUB1) = SPACES                       CAT31   
                   ADD  1               TO SUB1                         CAT31   
               ELSE                                                     CAT31   
                   MOVE  OPTION-SYMBOL1 (SUB1) TO                       CAT31   
                       OPTION-SYMBOL (SUB)                              CAT31   
                   ADD  1               TO SUB1                         CAT31   
                                           SUB                          CAT31   
                   END-ADD                                              CAT31   
               END-IF                                                   CAT31   
           END-PERFORM                                                  CAT31   
           MOVE OPT-SYMBOL  TO ADR-OPT-SYMBOL.                          CAT31   
       960-GET-SYMBOL-FOR-OPTION-EXIT.  EXIT.                           CAT31   
           EJECT                                                        CAT31   
      ******************************************************************CAT31   
           SKIP1                                                        CAT31   
       965-OPTION-LOOP.                                                 CAT31   
           SKIP1                                                        CAT31   
           SUBTRACT 1 FROM SUB                                          CAT31   
           PERFORM UNTIL NOT (OPT-WORK3 (SUB) IS NUMERIC)               CAT31   
               SUBTRACT 1 FROM SUB                                      CAT31   
           END-PERFORM                                                  CAT31   
           SUBTRACT 1 FROM SUB.                                         CAT31   
       965-OPTION-LOOP-EXIT. EXIT.                                      CAT31   
           EJECT                                                        CAT31   
       1000-RELEASE-REC.                                                CAT31   
           RELEASE SORT-REC FROM ACAT-DATA-REC.                         CAT31   
           ADD 1      TO  ACATDELV-RPT-RECS.                            CAT31   
           MOVE 'Y'   TO  ACAT-RECORD-SW.                               CAT31   
       1000-RELEASE-REC-EXIT.                                           CAT31   
                                                                        CAT31   
           EJECT                                                        CAT31   
       1100-REGULAR-XFER-FEE-RTN.                                       CAT31   
                                                                        CAT31   
      * CARD 501306 IS DEFAULT                                          CAT31   
           MOVE B1-WRK-CLI-XFER-FEE      TO  ADR-XFER-FEE.              CAT31   
                                                                        CAT31   
      *** DETERMINE IF BRANCH FOR THIS ACCOUNT IS IN XFER FEE TABLE     CAT31   
      *** IF SO USE FEE FROM TABLE IN PLACE OF CLIENT LEVEL FEE         CAT31   
      * CARD 451142 OVERRIDES 501306 IF MATCH OCCURS                    CAT31   
                                                                        CAT31   
           MOVE  'N'  TO  B1-RANGE-SEARCH-STATUS.                       CAT31   
           MOVE  ' '  TO  B1-RANGE-SEARCH-SWITCH.                       CAT31   
           MOVE  1    TO  B6-SUB.                                       CAT31   
           PERFORM UNTIL B1-RANGE-SEARCH-END                            CAT31   
                                                                        CAT31   
             IF B6-SUB > B1-WRK-XFER-RANGE-NO                           CAT31   
               MOVE 'N'  TO  B1-RANGE-SEARCH-STATUS                     CAT31   
               MOVE 'Y'  TO  B1-RANGE-SEARCH-SWITCH                     CAT31   
             END-IF                                                     CAT31   
             IF  (ACAT-BR > B1-WRK-XFER-BR-LOW (B6-SUB) OR              CAT31   
                  ACAT-BR = B1-WRK-XFER-BR-LOW (B6-SUB)) AND            CAT31   
                 (ACAT-BR < B1-WRK-XFER-BR-HIGH (B6-SUB) OR             CAT31   
                  ACAT-BR = B1-WRK-XFER-BR-HIGH (B6-SUB)) AND           CAT31   
                  B6-SUB NOT > B1-WRK-XFER-RANGE-NO                     CAT31   
               MOVE B1-WRK-XFER-FEE (B6-SUB) TO ADR-XFER-FEE            CAT31   
               MOVE 'Y'  TO  B1-RANGE-SEARCH-STATUS                     CAT31   
               MOVE 'Y'  TO  B1-RANGE-SEARCH-SWITCH                     CAT31   
             END-IF                                                     CAT31   
                                                                        CAT31   
             ADD 1  TO  B6-SUB                                          CAT31   
           END-PERFORM.                                                 CAT31   
                                                                        CAT31   
       1100-REGULAR-XFER-FEE-RTN-EXIT.  EXIT.                           CAT31   
           EJECT                                                        CAT31   
       1200-IRA-XFER-FEE-RTN.                                           CAT31   
                                                                        CAT31   
      * TRANSFER FEES MAY APPLY TO SPECIFIC ACCOUNTS OR                 CAT31   
      * SPECIFIC ACCOUNTS WITHIN SPECIFIC BRANCHES                      CAT31   
      * COMPARE ACCOUNTS IRA-KEOUGH INDICATOR TO A TABLE IN THE B1 FILE CAT31   
      * IF THERE IS A MATCH USE A CORRESPONDING B1 VALUE AS THE XFER FEECAT31   
      * CARD 511233 IS CHARACTER STRING LENGTH 35                       CAT31   
                                                                        CAT31   
           IF B1-WRK-ACCT-IRA-FEE-CODE = SPACES OR LOW-VALUES           CAT31   
             GO TO 1225-NO-MATCH-511233.                                CAT31   
                                                                        CAT31   
           MOVE B1-WRK-ACCT-IRA-FEE-CODE TO XFER-IND-AREA.              CAT31   
           MOVE 1   TO  B8-SUB.                                         CAT31   
                                                                        CAT31   
           MOVE 'N' TO B1-TABLE-SEARCH-STATUS.                          CAT31   
           MOVE ' ' TO B1-TABLE-SEARCH-SWITCH.                          CAT31   
                                                                        CAT31   
           PERFORM UNTIL B1-SEARCH-END                                  CAT31   
                                                                        CAT31   
           IF ADR-IRA-KEOUGH-IND = XFER-IND-TEST (B8-SUB) AND           CAT31   
              B8-SUB < 36                                               CAT31   
             MOVE 'Y'  TO  B1-TABLE-SEARCH-STATUS                       CAT31   
             MOVE 'Y'  TO  B1-TABLE-SEARCH-SWITCH                       CAT31   
             END-IF                                                     CAT31   
                                                                        CAT31   
             ADD 1  TO  B8-SUB                                          CAT31   
            IF B8-SUB > 35                                              CAT31   
              MOVE 'N'  TO  B1-TABLE-SEARCH-STATUS                      CAT31   
              MOVE 'Y'  TO  B1-TABLE-SEARCH-SWITCH                      CAT31   
            END-IF                                                      CAT31   
                                                                        CAT31   
           END-PERFORM.                                                 CAT31   
                                                                        CAT31   
           IF B1-ENTRY-FOUND                                            CAT31   
             CONTINUE                                                   CAT31   
           ELSE                                                         CAT31   
             GO TO 1225-NO-MATCH-511233.                                CAT31   
                                                                        CAT31   
      * IRA/KEOUGH INDICATOR FOUND IN TABLE                             CAT31   
      * MATCH USE CARD 501308                                           CAT31   
           MOVE B1-WRK-ACCT-XFER-FEE-IRA-DFLT TO ADR-XFER-FEE-IRA.      CAT31   
                                                                        CAT31   
      *** IF BRANCH FOR THIS ACCOUNT IS IN IRA ACCT XFER FEE TABLE USE  CAT31   
      *** FEE FROM TABLE IN PLACE OF CLIENT AND BRANCH LEVEL IRA FEES   CAT31   
      * CARD 451145 OVERRIDES CARD 501308 IF BRANCH IS IN TABLE         CAT31   
                                                                        CAT31   
           MOVE  'N'  TO  B1-RANGE-SEARCH-STATUS.                       CAT31   
           MOVE  ' '  TO  B1-RANGE-SEARCH-SWITCH.                       CAT31   
           MOVE  1    TO  B9-SUB.                                       CAT31   
           MOVE ACAT-BR TO T-BR.                                        CAT31   
           PERFORM UNTIL B1-RANGE-SEARCH-END                            CAT31   
                                                                        CAT31   
             IF B9-SUB > B1-WRK-ACCT-XFER-IRA-RANGE-NO                  CAT31   
               MOVE 'N'  TO  B1-RANGE-SEARCH-STATUS                     CAT31   
               MOVE 'Y'  TO  B1-RANGE-SEARCH-SWITCH                     CAT31   
             END-IF                                                     CAT31   
             IF  (T-BR > B1-WRK-ACCT-XFER-IRA-BR-LOW (B9-SUB) OR        CAT31   
                  T-BR = B1-WRK-ACCT-XFER-IRA-BR-LOW (B9-SUB)) AND      CAT31   
                 (T-BR < B1-WRK-ACCT-XFER-IRA-BR-HIGH (B9-SUB) OR       CAT31   
                  T-BR = B1-WRK-XFER-IRA-BR-HIGH (B9-SUB)) AND          CAT31   
                  B9-SUB NOT > B1-WRK-ACCT-XFER-IRA-RANGE-NO            CAT31   
               MOVE B1-WRK-ACCT-XFER-FEE-IRA (B9-SUB) TO                CAT31   
                                     ADR-XFER-FEE-IRA                   CAT31   
               MOVE 'Y'  TO  B1-RANGE-SEARCH-STATUS                     CAT31   
               MOVE 'Y'  TO  B1-RANGE-SEARCH-SWITCH                     CAT31   
             END-IF                                                     CAT31   
                                                                        CAT31   
             ADD 1  TO  B9-SUB                                          CAT31   
           END-PERFORM.                                                 CAT31   
                                                                        CAT31   
           GO TO 1200-IRA-XFER-FEE-RTN-EXIT.                            CAT31   
                                                                        CAT31   
       1225-NO-MATCH-511233.                                            CAT31   
                                                                        CAT31   
      * USE CARD 501307 WHEN NO MATCH VS 511233                         CAT31   
           MOVE B1-WRK-CLI-XFER-FEE-IRA  TO  ADR-XFER-FEE-IRA.          CAT31   
                                                                        CAT31   
      *** DETERMINE IF BRANCH FOR THIS ACCOUNT IS IN IRA XFER FEE TABLE CAT31   
      *** IF SO USE FEE FROM TABLE IN PLACE OF CLIENT LEVEL IRA FEE     CAT31   
      * CARD 451143 OVERRIDES 501307 IF BRANCH IS IN TABLE              CAT31   
                                                                        CAT31   
           MOVE  'N'  TO  B1-RANGE-SEARCH-STATUS.                       CAT31   
           MOVE  ' '  TO  B1-RANGE-SEARCH-SWITCH.                       CAT31   
           MOVE  1    TO  B7-SUB.                                       CAT31   
           PERFORM UNTIL B1-RANGE-SEARCH-END                            CAT31   
                                                                        CAT31   
             IF B7-SUB > B1-WRK-XFER-IRA-RANGE-NO                       CAT31   
               MOVE 'N'  TO  B1-RANGE-SEARCH-STATUS                     CAT31   
               MOVE 'Y'  TO  B1-RANGE-SEARCH-SWITCH                     CAT31   
             END-IF                                                     CAT31   
             IF  (ACAT-BR > B1-WRK-XFER-IRA-BR-LOW (B7-SUB) OR          CAT31   
                  ACAT-BR = B1-WRK-XFER-IRA-BR-LOW (B7-SUB)) AND        CAT31   
                 (ACAT-BR < B1-WRK-XFER-IRA-BR-HIGH (B7-SUB) OR         CAT31   
                  ACAT-BR = B1-WRK-XFER-IRA-BR-HIGH (B7-SUB)) AND       CAT31   
                  B7-SUB NOT > B1-WRK-XFER-IRA-RANGE-NO                 CAT31   
               MOVE B1-WRK-XFER-IRA-FEE (B7-SUB) TO ADR-XFER-FEE-IRA    CAT31   
               MOVE 'Y'  TO  B1-RANGE-SEARCH-STATUS                     CAT31   
               MOVE 'Y'  TO  B1-RANGE-SEARCH-SWITCH                     CAT31   
             END-IF                                                     CAT31   
                                                                        CAT31   
             ADD 1  TO  B7-SUB                                          CAT31   
           END-PERFORM.                                                 CAT31   
                                                                        CAT31   
       1200-IRA-XFER-FEE-RTN-EXIT.  EXIT.                               CAT31   
           EJECT                                                        CAT31   
      *****************                                                 CAT31   
       1400-PRELIM-ACAT-REPORT  SECTION.                                CAT31   
      *****************                                                 CAT31   
                                                                        CAT31   
           DISPLAY '*** ' PGM-NME ' BEGINNING SORTOUT ROUTINE ***'.     CAT31   
                                                                        CAT31   
       1410-NEXT-REC.                                                   CAT31   
                                                                        CAT31   
           RETURN SORT-FILE INTO ACAT-DATA-REC                          CAT31   
             AT END GO TO 1400-PRELIM-ACAT-REPORT-EXIT.                 CAT31   
                                                                        CAT31   
           IF ACAT-FIRST-TIME                                           CAT31   
             MOVE 'N' TO ACAT-FIRST-TIME-SW                             CAT31   
             MOVE ACAT-DATA-REC    TO  SAVE-DATA-REC                    CAT31   
             IF ADR-CUSIP = SPACES                                      CAT31   
               PERFORM 1425-ADD-CASH THRU                               CAT31   
                       1425-ADD-CASH-EXIT                               CAT31   
               GO TO 1410-NEXT-REC                                      CAT31   
             ELSE                                                       CAT31   
               PERFORM 1750-HEADERS THRU                                CAT31   
                       1750-HEADERS-EXIT                                CAT31   
               PERFORM 1775-CASH-REPORTING THRU                         CAT31   
                       1775-CASH-REPORTING-EXIT                         CAT31   
               MOVE 'Y' TO ACAT-CASH-REPORTING-SW                       CAT31   
               PERFORM 1700-REPORTING THRU                              CAT31   
                       1700-REPORTING-EXIT                              CAT31   
               PERFORM 1450-ADD-EQUITY THRU                             CAT31   
                       1450-ADD-EQUITY-EXIT                             CAT31   
               GO TO 1410-NEXT-REC                                      CAT31   
           END-IF.                                                      CAT31   
                                                                        CAT31   
           IF ACAT-KEY = SAVE-KEY                                       CAT31   
             IF ADR-CUSIP = SPACES                                      CAT31   
               PERFORM 1425-ADD-CASH THRU                               CAT31   
                       1425-ADD-CASH-EXIT                               CAT31   
               GO TO 1410-NEXT-REC                                      CAT31   
             ELSE                                                       CAT31   
               IF ACAT-CASH-REPORTED                                    CAT31   
                 CONTINUE                                               CAT31   
               ELSE                                                     CAT31   
                 MOVE 'Y'  TO  ACAT-CASH-REPORTING-SW                   CAT31   
                 PERFORM 1750-HEADERS THRU                              CAT31   
                         1750-HEADERS-EXIT                              CAT31   
                 PERFORM 1775-CASH-REPORTING THRU                       CAT31   
                         1775-CASH-REPORTING-EXIT                       CAT31   
               END-IF                                                   CAT31   
                 PERFORM 1700-REPORTING THRU                            CAT31   
                         1700-REPORTING-EXIT                            CAT31   
               PERFORM 1450-ADD-EQUITY THRU                             CAT31   
                       1450-ADD-EQUITY-EXIT                             CAT31   
               GO TO 1410-NEXT-REC                                      CAT31   
             END-IF                                                     CAT31   
           ELSE                                                         CAT31   
      * KEYS ARE NOT EQUAL REPORT ACCOUNT TOTALS                        CAT31   
             IF ACAT-CASH-REPORTED                                      CAT31   
               CONTINUE                                                 CAT31   
             ELSE                                                       CAT31   
               PERFORM 1750-HEADERS THRU                                CAT31   
                       1750-HEADERS-EXIT                                CAT31   
               PERFORM 1775-CASH-REPORTING THRU                         CAT31   
                       1775-CASH-REPORTING-EXIT                         CAT31   
             END-IF                                                     CAT31   
             MOVE ' '     TO  ACAT-CASH-REPORTING-SW                    CAT31   
             IF (SAVE-CONTROLLER = ZEROS AND SAVE-BRANCH = SPACES) OR   CAT31   
                SAVE-BRANCH     = SPACES                                CAT31   
               CONTINUE                                                 CAT31   
             ELSE                                                       CAT31   
               PERFORM 1780-ACCOUNT-TOTALS THRU                         CAT31   
                       1780-ACCOUNT-TOTALS-EXIT                         CAT31   
C02808         MOVE ZERO TO   WS-POS-TYPE-LEGG                          CAT31   
C02808         MOVE ZERO TO   WS-POS-TYPE-NON-LEGG                      CAT31   
             END-IF                                                     CAT31   
             IF ADR-CLIENT = SAVE-CLIENT                                CAT31   
               CONTINUE                                                 CAT31   
             ELSE                                                       CAT31   
               PERFORM 1790-SUMMARY-REPORT THRU                         CAT31   
                       1790-SUMMARY-REPORT-EXIT                         CAT31   
               MOVE SPACES  TO  LAST-MNY-MKT-SEQ                        CAT31   
               MOVE ZERO    TO  MMS-SUB                                 CAT31   
               INITIALIZE MONEY-MARKET-HOLDINGS                         CAT31   
               MOVE ZERO TO PAGECNT                                     CAT31   
               MOVE SPACE   TO  ACCOUNT-SUMMARY-SW                      CAT31   
             END-IF                                                     CAT31   
             MOVE ACAT-DATA-REC TO SAVE-DATA-REC                        CAT31   
             MOVE ZERO    TO  ACAT-ACCT-CASH-SMA                        CAT31   
                              ACAT-ACCT-CASH-TY01                       CAT31   
                              ACAT-ACCT-CASH-TY02                       CAT31   
                              ACAT-ACCT-CASH-TY05                       CAT31   
                              ACAT-ACCT-CASH                            CAT31   
                              ACAT-ACCT-NET-BAL                         CAT31   
                              ACAT-ACCT-TOT-EQUITY                      CAT31   
                              ACAT-IRA-MAINT-FEE                        CAT31   
LRM006                        ACAT-FRGN-FEE-AMT-TOT                             
                              ACAT-LEGG-MAINT-FEE                       CAT31   
C02808                        WS-POS-TYPE-LEGG                          CAT31   
C02808                        WS-POS-TYPE-NON-LEGG                      CAT31   
C02808*      MOVE SPACES  TO  ACCOUNT-OUTSIDE-FUNDS-SW                  CAT31   
C02808*                       ACCOUNT-LEGG-FUNDS-SW                     CAT31   
C02808*                       ACCOUNT-POSITION-SW                       CAT31   
C02808*                       ACCOUNT-CASH-SW                           CAT31   
             INITIALIZE   ACAT-EQUITY-COUNTERS                          CAT31   
             IF ADR-CUSIP = SPACES                                      CAT31   
               PERFORM 1425-ADD-CASH THRU                               CAT31   
                       1425-ADD-CASH-EXIT                               CAT31   
               GO TO 1410-NEXT-REC                                      CAT31   
             ELSE                                                       CAT31   
               IF ACAT-CASH-REPORTED                                    CAT31   
                 CONTINUE                                               CAT31   
               ELSE                                                     CAT31   
                 MOVE 'Y'             TO ACAT-CASH-REPORTING-SW         CAT31   
                 PERFORM 1750-HEADERS THRU                              CAT31   
                         1750-HEADERS-EXIT                              CAT31   
                 PERFORM 1775-CASH-REPORTING THRU                       CAT31   
                         1775-CASH-REPORTING-EXIT                       CAT31   
               END-IF                                                   CAT31   
               PERFORM 1700-REPORTING THRU                              CAT31   
                       1700-REPORTING-EXIT                              CAT31   
               PERFORM 1450-ADD-EQUITY THRU                             CAT31   
                       1450-ADD-EQUITY-EXIT                             CAT31   
             END-IF                                                     CAT31   
           END-IF.                                                      CAT31   
           GO TO 1410-NEXT-REC.                                         CAT31   
                                                                        CAT31   
       1400-PRELIM-ACAT-REPORT-EXIT.  EXIT.                             CAT31   
                                                                        CAT31   
       1425-ADD-CASH.                                                   CAT31   
           IF ADR-TRAN-TYPE = '00'                                      CAT31   
             ADD ADR-ASSET-VALUE  TO ACAT-ACCT-CASH-SMA.                CAT31   
           IF ADR-TRAN-TYPE = '01'                                      CAT31   
             ADD ADR-ASSET-VALUE  TO ACAT-ACCT-CASH-TY01                CAT31   
                                     ACAT-ACCT-CASH.                    CAT31   
           IF ADR-TRAN-TYPE = '02'                                      CAT31   
             ADD ADR-ASSET-VALUE  TO ACAT-ACCT-CASH-TY02                CAT31   
                                     ACAT-ACCT-CASH.                    CAT31   
           IF ADR-TRAN-TYPE = '05'                                      CAT31   
             ADD ADR-ASSET-VALUE  TO ACAT-ACCT-CASH-TY05                CAT31   
                                     ACAT-ACCT-CASH.                    CAT31   
C02808*    IF ADR-TRAN-TYPE = '01' OR '02' OR '05'                      CAT31   
C02808*      MOVE 'Y'  TO ACCOUNT-CASH-SW.                              CAT31   
       1425-ADD-CASH-EXIT. EXIT.                                        CAT31   
                                                                        CAT31   
       1450-ADD-EQUITY.                                                 CAT31   
                                                                        CAT31   
      * CHECK FOR SPAD MSG RECORD BYPASS ADDITIONS IF PRESENT           CAT31   
           IF ADR-TRAN-TYPE = '80' OR '90'                              CAT31   
             GO TO 1450-ADD-EQUITY-EXIT.                                CAT31   
                                                                        CAT31   
           MOVE ADR-TRAN-TYPE   TO   AD-SUB.                            CAT31   
           ADD ADR-ASSET-VALUE  TO   ACAT-ACCT-EQUITY (AD-SUB)          CAT31   
                                     ACAT-ACCT-EQUITY (10).             CAT31   
      *    ADD ADR-IRA-MAINT-FEE TO  ACAT-IRA-MAINT-FEE.                CAT31   
C02808*                                                                 CAT31   
C02808*    IF ADR-MUTUAL-FUND-IND = SPACE                               CAT31   
C02808*      MOVE 'Y'  TO   ACCOUNT-POSITION-SW                         CAT31   
C02808*      GO TO 1450-ADD-EQUITY-EXIT.                                CAT31   
C02808*                                                                 CAT31   
C02808* MUTUAL FUND - DETERMINE IF LEGG OR OUTSIDE FUND                 CAT31   
C02808*    IF ADR-MUTUAL-FUND-IND = 'Y' AND                             CAT31   
C02808*       ADR-PROCESS-CODE = 'L'                                    CAT31   
C02808*      MOVE 'Y'           TO   ACCOUNT-LEGG-FUNDS-SW              CAT31   
C02808*      COMPUTE ACAT-LEGG-MAINT-FEE = ACAT-LEGG-MAINT-FEE          CAT31   
C02808*                                  + ADR-IRA-MAINT-FEE.           CAT31   
C02808*                                                                 CAT31   
C02808*    IF ACAT-LEGG-MAINT-FEE > 35                                  CAT31   
C02808*      MOVE 35       TO  ACAT-LEGG-MAINT-FEE.                     CAT31   
C02808*                                                                 CAT31   
C02808*    IF ADR-MUTUAL-FUND-IND = 'Y' AND                             CAT31   
C02808*       ADR-PROCESS-CODE = 'O'                                    CAT31   
C02808*      MOVE 'Y'           TO   ACCOUNT-OUTSIDE-FUNDS-SW.          CAT31   
                                                                        CAT31   
       1450-ADD-EQUITY-EXIT. EXIT.                                      CAT31   
           EJECT                                                        CAT31   
       1700-REPORTING.                                                  CAT31   
                                                                        CAT31   
           IF LINECNT > 55                                              CAT31   
             PERFORM 1750-HEADERS THRU                                  CAT31   
                     1750-HEADERS-EXIT                                  CAT31   
             IF (ADR-CONTROLLER = ZEROS AND ADR-BRANCH = SPACES)  OR    CAT31   
                ADR-BRANCH     = SPACES                                 CAT31   
               CONTINUE                                                 CAT31   
             ELSE                                                       CAT31   
               MOVE HDR6C       TO  PRINT-AREA                          CAT31   
               MOVE ' '         TO  CC                                  CAT31   
               PERFORM 1725-PRINT-LINE THRU                             CAT31   
                       1725-PRINT-LINE-EXIT                             CAT31   
               MOVE HDR9        TO  PRINT-AREA                          CAT31   
               MOVE ' '         TO  CC                                  CAT31   
               PERFORM 1725-PRINT-LINE THRU                             CAT31   
                       1725-PRINT-LINE-EXIT                             CAT31   
             END-IF                                                     CAT31   
           END-IF.                                                      CAT31   
                                                                        CAT31   
           IF ADR-CONTROLLER = ZEROS AND                                CAT31   
              ADR-BRANCH = SPACES                                       CAT31   
             MOVE '******* NO ACTIVITY FOR THIS CLIENT ********'        CAT31   
                                               TO NAL-MSG               CAT31   
             MOVE NO-ACTV-LINE                 TO PRINT-AREA            CAT31   
             MOVE '0'                          TO CC                    CAT31   
             PERFORM 1725-PRINT-LINE THRU                               CAT31   
                     1725-PRINT-LINE-EXIT                               CAT31   
             GO TO 1700-REPORTING-EXIT.                                 CAT31   
                                                                        CAT31   
           IF ADR-BRANCH = SPACES                                       CAT31   
             MOVE '***** NO ACTIVITY FOR THIS CONTROLLER ********'      CAT31   
                                               TO NAL-MSG               CAT31   
             MOVE NO-ACTV-LINE                 TO PRINT-AREA            CAT31   
             MOVE '0'                          TO CC                    CAT31   
             PERFORM 1725-PRINT-LINE THRU                               CAT31   
                     1725-PRINT-LINE-EXIT                               CAT31   
             GO TO 1700-REPORTING-EXIT.                                 CAT31   
                                                                        CAT31   
      * CHECK FOR OPTIONS - TRAN CODE 80                                CAT31   
      * IF PRESENT REPORT AFTER WRITING TOTALS                          CAT31   
           IF ADR-TRAN-TYPE = '80'                                      CAT31   
             ADD  1               TO  ACT-OPTION-CTR                    CAT31   
DJ0001       IF ACT-OPTION-CTR > 900                                    CAT31   
DJ0001         DISPLAY 'MORE THAN 900 OPTIONS FOR CUSTOMER '            CAT31   
DJ0001         DISPLAY 'SORT-KEY=' S-CLIENT                             CAT31   
DJ0001                    ' ' S-CONTROLLER                              CAT31   
DJ0001                    ' ' S-BRANCH                                  CAT31   
DJ0001                    ' ' S-ACCOUNT                                 CAT31   
DJ0001                    ' ' S-CUSIP                                   CAT31   
DJ0001                    ' ' S-PROCESS-CODE                            CAT31   
DJ0001                    ' ' S-TRAN-TYPE                               CAT31   
               DISPLAY 'INCREASE TABLE SIZE '                           CAT31   
               DISPLAY 'PROGRAM CAT31 ABENDED '                         CAT31   
               MOVE +2098          TO    ABEND-CODE                     CAT31   
               CALL ABEND          USING ABEND-CODE                     CAT31   
             END-IF                                                     CAT31   
             MOVE ADR-OPTION-DATA TO  ACT-OPTION-DATA (ACT-OPTION-CTR)  CAT31   
             GO TO 1700-REPORTING-EXIT.                                 CAT31   
                                                                        CAT31   
      * CHECK FOR SPAD MESSAGES ADR-TRAN-TYPE - 90                      CAT31   
      * TABLE MESSAGES WRITE AFTER TOTALS HAVE BEEN PRINTED             CAT31   
                                                                        CAT31   
           IF ADR-TRAN-TYPE = '90'                                      CAT31   
             ADD 1   TO  SPAD-MSG-CTR                                   CAT31   
DJ0003       IF SPAD-MSG-CTR > 500                                      CAT31   
DJ0003         DISPLAY 'CUSTOMER HAS MORE THAN 500 SPAD MESSAGES'       CAT31   
               DISPLAY 'CUSTOMER ACCOUNT - ' ACAT-KEY                   CAT31   
DJ0003         DISPLAY                                                  CAT31   
DJ0003         'INCREASE CAT31 WORKING STORAGE SPAD-MSG-LINE TABLE SIZE'CAT31   
               DISPLAY 'PROGRAM CAT31 ABENDED '                         CAT31   
               MOVE +2099           TO    ABEND-CODE                    CAT31   
               CALL  ABEND          USING ABEND-CODE                    CAT31   
             END-IF                                                     CAT31   
             MOVE ADR-SPAD-MSG       TO  SPAD-MSG-LINE (SPAD-MSG-CTR)   CAT31   
             GO TO 1700-REPORTING-EXIT.                                 CAT31   
                                                                        CAT31   
      * MOVE PRINT DATA TO DETAIL LINE                                  CAT31   
      * MAXIMUM OF 4 PRINT LINE POSSIBLE                                CAT31   
      * EACH POSITION MAY HAVE UP TO 3 DESCRIPTIONS AND 4 MEMOS         CAT31   
           MOVE SPACES                         TO DETAIL-LINE-1.        CAT31   
           MOVE  ADR-ASSET-QTY                 TO DL1-QTY-FRAC.         CAT31   
           IF  DL1-QUANTITY (11:6)  =  '.00000'                         CAT31   
               MOVE  SPACES                    TO DL1-QUANTITY (11:6)   CAT31   
           END-IF.                                                      CAT31   
           MOVE ADR-SECURITY-DESC1             TO DL1-SEC-DESCR.        CAT31   
                                                                        CAT31   
           IF ADR-CUSIP = '000000000'                                   CAT31   
             MOVE SPACES                       TO DL1-CUSIP             CAT31   
           ELSE                                                         CAT31   
             MOVE ADR-CUSIP                    TO DL1-CUSIP.            CAT31   
                                                                        CAT31   
DJ         MOVE ADR-REORG-CD                   TO DL1-REORG-CD.         CAT31   
                                                                        CAT31   
           MOVE ADR-ASSET-VALUE                TO DL1-ASSET-VALUE.      CAT31   
                                                                        CAT31   
           MOVE ADR-TRAN-TYPE                  TO DL1-TYPE.             CAT31   
                                                                        CAT31   
DJ0002     IF  ADR-BRANCH    > ' '   AND                                CAT31   
DJ0002         ADR-ACCOUNT   > ' '   AND                                CAT31   
               ADR-TRAN-TYPE NUMERIC                                    CAT31   
                                                                        CAT31   
               MOVE ADR-BRANCH       TO WS-BRCH                         CAT31   
               MOVE ADR-ACCOUNT      TO WS-ACCT                         CAT31   
               EVALUATE ADR-TRAN-TYPE                                   CAT31   
                   WHEN '01'  MOVE 1 TO WS-TYPE                         CAT31   
                   WHEN '02'  MOVE 2 TO WS-TYPE                         CAT31   
                   WHEN '05'  MOVE 5 TO WS-TYPE                         CAT31   
                   WHEN OTHER MOVE 0 TO WS-TYPE                         CAT31   
               END-EVALUATE                                             CAT31   
                                                                        CAT31   
               CALL  ZCHKDGT  USING  WS-ACCT-NUMBER                     CAT31   
                                     LENGTH-KEY                         CAT31   
                                     WS-CKDG                            CAT31   
               END-CALL                                                 CAT31   
               IF WS-CKDG  NUMERIC                                      CAT31   
                  MOVE '-'                         TO DL1-DASH          CAT31   
                  MOVE WS-CKDG                     TO DL1-CKDG          CAT31   
               END-IF                                                   CAT31   
           END-IF.                                                      CAT31   
                                                                        CAT31   
C02808     IF ADR-PROCESS-CODE = 'L'                                    CAT31   
C02808        ADD 1 TO WS-POS-TYPE-LEGG                                 CAT31   
C02808     ELSE                                                         CAT31   
C02808        ADD 1 TO WS-POS-TYPE-NON-LEGG                             CAT31   
C02808     END-IF.                                                      CAT31   
                                                                        CAT31   
           IF ADR-MEMO-COUNT > 0                                        CAT31   
             IF ADR-MEMO-QTY-FRAC (1) = ZERO                            CAT31   
               MOVE ADR-MEMO-QTY-WHOLE (1)    TO DL1-MEMO-QTY-WHOLE     CAT31   
             ELSE                                                       CAT31   
               MOVE ADR-MEMO-QTY (1)          TO DL1-MEMO-QTY-FRAC      CAT31   
             END-IF                                                     CAT31   
             MOVE 'N'                         TO MEMO-SEARCH-STATUS-SW  CAT31   
                                               MEMO-SEARCH-SW           CAT31   
             MOVE ADR-MEMO-CODE (1)  TO  WK-LEN-X                       CAT31   
             IF WK-LEN < 1 OR > 12                                      CAT31   
               MOVE 'MEMO CODE NOT FOUND'        TO DL1-MEMO-MSG        CAT31   
             ELSE                                                       CAT31   
               MOVE MEMO-DESC (WK-LEN)           TO DL1-MEMO-MSG        CAT31   
             END-IF                                                     CAT31   
           END-IF.                                                      CAT31   
           IF ADR-PROCESS-CODE = 'L' OR                                 CAT31   
              ADR-NOT-RPT-IND = '1'                                     CAT31   
C02492*      MOVE  'NOT RPT'                      TO DL1-MEMO-MSG.      CAT31   
C02492       MOVE  'NOT RPT'                      TO DL1-MEMO-MSG       CAT31   
C02492     ELSE                                                         CAT31   
C02492       IF ADR-MEMO-COUNT = 0                                      CAT31   
C02492          MOVE  'DTC='               TO DL1-MEMO-MSG              CAT31   
C02492          MOVE  ADR-DTC-IND          TO DL1-MEMO-MSG (5:1)        CAT31   
C02492          MOVE  'CNS='               TO DL1-MEMO-MSG (9:4)        CAT31   
C02492          MOVE  ADR-CNS-IND          TO DL1-MEMO-MSG (13:1)       CAT31   
C02492       END-IF                                                     CAT31   
C02492     END-IF.                                                      CAT31   
                                                                        CAT31   
                                                                        CAT31   
           MOVE DETAIL-LINE-1                  TO PRINT-AREA.           CAT31   
           MOVE '0'                            TO CC.                   CAT31   
                                                                        CAT31   
           PERFORM 1725-PRINT-LINE THRU                                 CAT31   
                   1725-PRINT-LINE-EXIT.                                CAT31   
                                                                        CAT31   
      * CHECK FOR MONEY MARKET HOLDING FOR SUMMARY REPORT               CAT31   
           IF ADR-NOT-RPT-IND = '1'                                     CAT31   
             IF ACAT-KEY = LAST-MNY-MKT-SEQ OR                          CAT31   
                ADR-ADP-SEC-NO = 'A000555'                              CAT31   
               CONTINUE                                                 CAT31   
             ELSE                                                       CAT31   
               ADD 1 TO MMS-SUB                                         CAT31   
               IF MMS-SUB > 5000                                        CAT31   
                 DISPLAY 'CUSTOMER HAS MORE THAN 5000 MONEY MKT HLDINGS'CAT31   
                 DISPLAY 'CUSTOMER ACCOUNT - ' ACAT-KEY                 CAT31   
                 DISPLAY 'INCREASE TABLE SIZE '                         CAT31   
                 DISPLAY 'PROGRAM CAT31 ABENDED '                       CAT31   
                 MOVE +3005           TO    ABEND-CODE                  CAT31   
                 CALL  ABEND          USING ABEND-CODE                  CAT31   
               END-IF                                                   CAT31   
               MOVE ACAT-KEY TO  MNY-MKT-SEQ (MMS-SUB)                  CAT31   
                                 LAST-MNY-MKT-SEQ                       CAT31   
             END-IF                                                     CAT31   
           END-IF.                                                      CAT31   
      * IS THERE DATA FOR LINE 2 IF SO PRINT IT                         CAT31   
           MOVE SPACES                         TO DETAIL-LINE-1A.       CAT31   
           IF ADR-SECURITY-DESC2 = (SPACES OR LOW-VALUES) AND           CAT31   
              ADR-MEMO-COUNT NOT > 1                                    CAT31   
C02492        IF ADR-MEMO-COUNT = 1                                     CAT31   
C02492           MOVE  'DTC='               TO DL1A-MEMO-MSG            CAT31   
C02492           MOVE  ADR-DTC-IND          TO DL1A-MEMO-MSG (5:1)      CAT31   
C02492           MOVE  'CNS='               TO DL1A-MEMO-MSG (9:4)      CAT31   
C02492           MOVE  ADR-CNS-IND          TO DL1A-MEMO-MSG (13:1)     CAT31   
C02492           MOVE DETAIL-LINE-1A        TO PRINT-AREA               CAT31   
C02492           MOVE ' '                   TO CC                       CAT31   
C02492           PERFORM 1725-PRINT-LINE THRU                           CAT31   
C02492                   1725-PRINT-LINE-EXIT                           CAT31   
C02492        END-IF                                                    CAT31   
             GO TO 1700-REPORTING-EXIT.                                 CAT31   
                                                                        CAT31   
           IF ADR-SECURITY-DESC2 = SPACES OR LOW-VALUES                 CAT31   
             CONTINUE                                                   CAT31   
           ELSE                                                         CAT31   
             MOVE ADR-SECURITY-DESC2           TO  DL1A-SEC-DESCR.      CAT31   
                                                                        CAT31   
           IF ADR-MEMO-COUNT > 1                                        CAT31   
             IF ADR-MEMO-QTY-FRAC (2) = ZERO                            CAT31   
               MOVE ADR-MEMO-QTY-WHOLE (2)    TO DL1A-MEMO-QTY-WHOLE    CAT31   
             ELSE                                                       CAT31   
               MOVE ADR-MEMO-QTY (2)          TO DL1A-MEMO-QTY-FRAC     CAT31   
             END-IF                                                     CAT31   
             MOVE 'N'                         TO MEMO-SEARCH-STATUS-SW  CAT31   
                                               MEMO-SEARCH-SW           CAT31   
             MOVE 1                              TO MO-SUB              CAT31   
             MOVE ADR-MEMO-CODE (2)  TO  WK-LEN-X                       CAT31   
             IF WK-LEN < 1 OR > 12                                      CAT31   
               MOVE 'MEMO CODE NOT FOUND'        TO DL1A-MEMO-MSG       CAT31   
             ELSE                                                       CAT31   
               MOVE MEMO-DESC (WK-LEN)           TO DL1A-MEMO-MSG       CAT31   
             END-IF                                                     CAT31   
C02492     ELSE                                                         CAT31   
C02492        IF ADR-MEMO-COUNT = 1                                     CAT31   
C02492           MOVE  'DTC='               TO DL1A-MEMO-MSG            CAT31   
C02492           MOVE  ADR-DTC-IND          TO DL1A-MEMO-MSG (5:1)      CAT31   
C02492           MOVE  'CNS='               TO DL1A-MEMO-MSG (9:4)      CAT31   
C02492           MOVE  ADR-CNS-IND          TO DL1A-MEMO-MSG (13:1)     CAT31   
C02492        END-IF                                                    CAT31   
           END-IF.                                                      CAT31   
           MOVE DETAIL-LINE-1A                 TO PRINT-AREA.           CAT31   
           MOVE ' '                            TO CC.                   CAT31   
                                                                        CAT31   
           PERFORM 1725-PRINT-LINE THRU                                 CAT31   
                   1725-PRINT-LINE-EXIT.                                CAT31   
                                                                        CAT31   
      * LINE 3 IF NECESSARY                                             CAT31   
           MOVE SPACES                         TO DETAIL-LINE-1A.       CAT31   
           IF ADR-SECURITY-DESC3 = (SPACES OR LOW-VALUES) AND           CAT31   
              ADR-MEMO-COUNT NOT > 2                                    CAT31   
C02492        IF ADR-MEMO-COUNT = 2                                     CAT31   
C02492           MOVE  'DTC='               TO DL1A-MEMO-MSG            CAT31   
C02492           MOVE  ADR-DTC-IND          TO DL1A-MEMO-MSG (5:1)      CAT31   
C02492           MOVE  'CNS='               TO DL1A-MEMO-MSG (9:4)      CAT31   
C02492           MOVE  ADR-CNS-IND          TO DL1A-MEMO-MSG (13:1)     CAT31   
C02492           MOVE DETAIL-LINE-1A        TO PRINT-AREA               CAT31   
C02492           MOVE ' '                   TO CC                       CAT31   
C02492           PERFORM 1725-PRINT-LINE THRU                           CAT31   
C02492                   1725-PRINT-LINE-EXIT                           CAT31   
C02492        END-IF                                                    CAT31   
             GO TO 1700-REPORTING-EXIT.                                 CAT31   
                                                                        CAT31   
           IF ADR-SECURITY-DESC3 = SPACES OR LOW-VALUES                 CAT31   
             CONTINUE                                                   CAT31   
           ELSE                                                         CAT31   
             MOVE ADR-SECURITY-DESC3           TO  DL1A-SEC-DESCR.      CAT31   
                                                                        CAT31   
           IF ADR-MEMO-COUNT > 2                                        CAT31   
             IF ADR-MEMO-QTY-FRAC (3) = ZERO                            CAT31   
               MOVE ADR-MEMO-QTY-WHOLE (3)    TO DL1A-MEMO-QTY-WHOLE    CAT31   
             ELSE                                                       CAT31   
               MOVE ADR-MEMO-QTY (3)          TO DL1A-MEMO-QTY-FRAC     CAT31   
             END-IF                                                     CAT31   
             MOVE 'N'                         TO MEMO-SEARCH-STATUS-SW  CAT31   
                                               MEMO-SEARCH-SW           CAT31   
             MOVE 1                              TO MO-SUB              CAT31   
             MOVE ADR-MEMO-CODE (3)  TO  WK-LEN-X                       CAT31   
             IF WK-LEN < 1 OR > 12                                      CAT31   
               MOVE 'MEMO CODE NOT FOUND'        TO DL1A-MEMO-MSG       CAT31   
             ELSE                                                       CAT31   
               MOVE MEMO-DESC (WK-LEN)           TO DL1A-MEMO-MSG       CAT31   
             END-IF                                                     CAT31   
C02492     ELSE                                                         CAT31   
C02492        IF ADR-MEMO-COUNT = 2                                     CAT31   
C02492           MOVE  'DTC='               TO DL1A-MEMO-MSG            CAT31   
C02492           MOVE  ADR-DTC-IND          TO DL1A-MEMO-MSG (5:1)      CAT31   
C02492           MOVE  'CNS='               TO DL1A-MEMO-MSG (9:4)      CAT31   
C02492           MOVE  ADR-CNS-IND          TO DL1A-MEMO-MSG (13:1)     CAT31   
C02492        END-IF                                                    CAT31   
           END-IF.                                                      CAT31   
           MOVE DETAIL-LINE-1A                 TO PRINT-AREA.           CAT31   
           MOVE ' '                            TO CC.                   CAT31   
                                                                        CAT31   
           PERFORM 1725-PRINT-LINE THRU                                 CAT31   
                   1725-PRINT-LINE-EXIT.                                CAT31   
                                                                        CAT31   
      * LINE 4 IF NECESSARY                                             CAT31   
           MOVE SPACES                         TO DETAIL-LINE-1A.       CAT31   
                                                                        CAT31   
           IF ADR-MEMO-COUNT NOT > 3                                    CAT31   
C02492        IF ADR-MEMO-COUNT = 3                                     CAT31   
C02492           MOVE  'DTC='               TO DL1A-MEMO-MSG            CAT31   
C02492           MOVE  ADR-DTC-IND          TO DL1A-MEMO-MSG (5:1)      CAT31   
C02492           MOVE  'CNS='               TO DL1A-MEMO-MSG (9:4)      CAT31   
C02492           MOVE  ADR-CNS-IND          TO DL1A-MEMO-MSG (13:1)     CAT31   
C02492           MOVE DETAIL-LINE-1A        TO PRINT-AREA               CAT31   
C02492           MOVE ' '                   TO CC                       CAT31   
C02492           PERFORM 1725-PRINT-LINE THRU                           CAT31   
C02492                   1725-PRINT-LINE-EXIT                           CAT31   
C02492        END-IF                                                    CAT31   
             GO TO 1700-REPORTING-EXIT.                                 CAT31   
                                                                        CAT31   
           IF ADR-MEMO-QTY-FRAC (4) = ZERO                              CAT31   
             MOVE ADR-MEMO-QTY-WHOLE (4)    TO DL1A-MEMO-QTY-WHOLE      CAT31   
           ELSE                                                         CAT31   
             MOVE ADR-MEMO-QTY (4)          TO DL1A-MEMO-QTY-FRAC       CAT31   
           END-IF.                                                      CAT31   
           MOVE 'N'                         TO MEMO-SEARCH-STATUS-SW    CAT31   
                                             MEMO-SEARCH-SW.            CAT31   
           MOVE 1                              TO MO-SUB.               CAT31   
           MOVE ADR-MEMO-CODE (4)  TO  WK-LEN-X.                        CAT31   
           IF WK-LEN < 1 OR > 12                                        CAT31   
             MOVE 'MEMO CODE NOT FOUND'        TO DL1A-MEMO-MSG         CAT31   
           ELSE                                                         CAT31   
             MOVE MEMO-DESC (WK-LEN)           TO DL1A-MEMO-MSG         CAT31   
           END-IF.                                                      CAT31   
           MOVE DETAIL-LINE-1A                 TO PRINT-AREA.           CAT31   
           MOVE ' '                            TO CC.                   CAT31   
                                                                        CAT31   
           PERFORM 1725-PRINT-LINE THRU                                 CAT31   
                   1725-PRINT-LINE-EXIT.                                CAT31   
                                                                        CAT31   
C02492        IF ADR-MEMO-COUNT = 4                                     CAT31   
C02492           MOVE  'DTC='               TO DL1A-MEMO-MSG            CAT31   
C02492           MOVE  ADR-DTC-IND          TO DL1A-MEMO-MSG (5:1)      CAT31   
C02492           MOVE  'CNS='               TO DL1A-MEMO-MSG (9:4)      CAT31   
C02492           MOVE  ADR-CNS-IND          TO DL1A-MEMO-MSG (13:1)     CAT31   
C02492           MOVE DETAIL-LINE-1A        TO PRINT-AREA               CAT31   
C02492           MOVE ' '                   TO CC                       CAT31   
C02492           PERFORM 1725-PRINT-LINE THRU                           CAT31   
C02492                   1725-PRINT-LINE-EXIT                           CAT31   
C02492        END-IF.                                                   CAT31   
       1700-REPORTING-EXIT. EXIT.                                       CAT31   
                                                                        CAT31   
       1725-PRINT-LINE.                                                 CAT31   
                                                                        CAT31   
           WRITE REPORT-REC FROM PRINTAREA.                             CAT31   
           IF CC = '1'                                                  CAT31   
             MOVE 3 TO LINECNT.                                         CAT31   
           IF CC = '-'                                                  CAT31   
             ADD 3 TO LINECNT.                                          CAT31   
           IF CC = '0'                                                  CAT31   
             ADD 2 TO LINECNT.                                          CAT31   
           IF CC = ' '                                                  CAT31   
             ADD 1 TO LINECNT.                                          CAT31   
                                                                        CAT31   
       1725-PRINT-LINE-EXIT.  EXIT.                                     CAT31   
                                                                        CAT31   
       1750-HEADERS.                                                    CAT31   
           MOVE SAVE-CLIENT             TO  TRAC-CLI.                   CAT31   
           MOVE SAVE-CONTROLLER         TO  TRAC-CNTL.                  CAT31   
                                                                        CAT31   
           ADD  1       TO  PAGECNT.                                    CAT31   
           MOVE SAVE-CLIENT             TO  H1-CLIENT                   CAT31   
           MOVE SAVE-CLIENT-NAME        TO  H1-CLIENT-NAME.             CAT31   
           MOVE PAGECNT                 TO  H1-PGENO.                   CAT31   
           MOVE HDR1                    TO  PRINT-AREA.                 CAT31   
           MOVE '1'                     TO  CC.                         CAT31   
           PERFORM 1725-PRINT-LINE THRU                                 CAT31   
                   1725-PRINT-LINE-EXIT.                                CAT31   
                                                                        CAT31   
           MOVE HDR2                    TO  PRINT-AREA.                 CAT31   
           MOVE ' '                     TO  CC.                         CAT31   
           PERFORM 1725-PRINT-LINE THRU                                 CAT31   
                   1725-PRINT-LINE-EXIT.                                CAT31   
                                                                        CAT31   
           MOVE HDR3                    TO  PRINT-AREA.                 CAT31   
           MOVE ' '                     TO  CC.                         CAT31   
           PERFORM 1725-PRINT-LINE THRU                                 CAT31   
                   1725-PRINT-LINE-EXIT.                                CAT31   
                                                                        CAT31   
           IF ACCOUNT-SUMMARY                                           CAT31   
             MOVE SUMMARY-HDR TO  PRINT-AREA                            CAT31   
             MOVE ' '         TO  CC                                    CAT31   
             PERFORM 1725-PRINT-LINE THRU                               CAT31   
                     1725-PRINT-LINE-EXIT                               CAT31   
             GO TO 1750-HEADERS-EXIT.                                   CAT31   
                                                                        CAT31   
           IF SAVE-IRA-KEOUGH-IND > SPACES                              CAT31   
             MOVE 'IRA/KEOUGH'          TO H4-ACCT-TYPE                 CAT31   
           ELSE                                                         CAT31   
             MOVE 'RETAIL'              TO H4-ACCT-TYPE.                CAT31   
                                                                        CAT31   
C99363*    IF SAVE-CONTRA-ACCT-TYPE = '03' OR '04' OR '05'              CAT31   
C99363*      MOVE 'IRA/KEOUGH'          TO H4-CONTRA-ACCT-TYPE          CAT31   
C99363*    ELSE                                                         CAT31   
C99363*      MOVE 'RETAIL'              TO H4-CONTRA-ACCT-TYPE.         CAT31   
C99363                                                                  CAT31   
C99363     EVALUATE  SAVE-CONTRA-ACCT-TYPE                              CAT31   
C99363         WHEN  '01'  MOVE  'SINGLE'       TO H4-CONTRA-ACCT-TYPE  CAT31   
C99363         WHEN  '02'  MOVE  'JOINT'        TO H4-CONTRA-ACCT-TYPE  CAT31   
C99363         WHEN  '03'  MOVE  'ROLLOVER'     TO H4-CONTRA-ACCT-TYPE  CAT31   
C99363         WHEN  '04'  MOVE  'IRA'          TO H4-CONTRA-ACCT-TYPE  CAT31   
C99363         WHEN  '05'  MOVE  'PROF PENSION' TO H4-CONTRA-ACCT-TYPE  CAT31   
C99363         WHEN  '06'  MOVE  'OTHER'        TO H4-CONTRA-ACCT-TYPE  CAT31   
C99363         WHEN  '07'  MOVE  'ESTATE'       TO H4-CONTRA-ACCT-TYPE  CAT31   
C99363         WHEN  '08'  MOVE  'CUSTODIAN'    TO H4-CONTRA-ACCT-TYPE  CAT31   
C99363         WHEN  '09'  MOVE  'TRUST'        TO H4-CONTRA-ACCT-TYPE  CAT31   
C99363         WHEN  '10'  MOVE  'CORPORATE'    TO H4-CONTRA-ACCT-TYPE  CAT31   
C99363         WHEN  OTHER MOVE  SPACES         TO H4-CONTRA-ACCT-TYPE  CAT31   
C99363     END-EVALUATE.                                                CAT31   
                                                                        CAT31   
           IF SAVE-MARGIN-IND = '1'                                     CAT31   
             MOVE MARGIN-LIT            TO  H4-MARGIN-MSG               CAT31   
           ELSE                                                         CAT31   
             MOVE SPACES                TO  H4-MARGIN-MSG.              CAT31   
                                                                        CAT31   
           MOVE HDR4                    TO  PRINT-AREA.                 CAT31   
           MOVE '0'                     TO  CC.                         CAT31   
           PERFORM 1725-PRINT-LINE THRU                                 CAT31   
                   1725-PRINT-LINE-EXIT.                                CAT31   
                                                                        CAT31   
           MOVE SAVE-BRANCH             TO  H5-BRANCH.                  CAT31   
           MOVE SAVE-ACCOUNT            TO  H5-ACCOUNT.                 CAT31   
           MOVE SAVE-CONTRA-ACCT        TO  H5-CONTRA-BKR-ACCT.         CAT31   
           MOVE SAVE-CONTRA-BKR         TO  H5-CONTRA-BKR.              CAT31   
           MOVE SAVE-CNTL-NO            TO  H5-NSCC-CNTL.               CAT31   
                                                                        CAT31   
           MOVE HDR5                    TO  PRINT-AREA.                 CAT31   
           MOVE ' '                     TO  CC.                         CAT31   
           PERFORM 1725-PRINT-LINE THRU                                 CAT31   
                   1725-PRINT-LINE-EXIT.                                CAT31   
                                                                        CAT31   
           IF SAVE-CONTROLLER = ZEROS                                   CAT31   
             MOVE SPACES                TO  H6-CONTROLLER               CAT31   
           ELSE                                                         CAT31   
             MOVE SAVE-CONTROLLER       TO  H6-CONTROLLER.              CAT31   
           MOVE SAVE-SS-TAX-ID (1:3)    TO  H6-SSN-TAXID (1:3).         CAT31   
           MOVE '-'                     TO  H6-SSN-TAXID (4:1).         CAT31   
           MOVE SAVE-SS-TAX-ID (4:2)    TO  H6-SSN-TAXID (5:2).         CAT31   
           MOVE '-'                     TO  H6-SSN-TAXID (7:1).         CAT31   
           MOVE SAVE-SS-TAX-ID (6:4)    TO  H6-SSN-TAXID (8:4).         CAT31   
                                                                        CAT31   
           MOVE SAVE-CONTRA-TAX-ID (1:3) TO  H6-CONTRA-TAXID (1:3).     CAT31   
           MOVE '-'                      TO  H6-CONTRA-TAXID (4:1).     CAT31   
           MOVE SAVE-CONTRA-TAX-ID (4:2) TO  H6-CONTRA-TAXID (5:2).     CAT31   
           MOVE '-'                      TO  H6-CONTRA-TAXID (7:1).     CAT31   
           MOVE SAVE-CONTRA-TAX-ID (6:4) TO  H6-CONTRA-TAXID (8:4).     CAT31   
                                                                        CAT31   
           IF SAVE-70PLUS-IND = '1'                                     CAT31   
             MOVE AGE-70PLUS-LIT        TO  H6-70PLUS-MSG               CAT31   
           ELSE                                                         CAT31   
             MOVE SPACES                TO  H6-70PLUS-MSG.              CAT31   
                                                                        CAT31   
           IF SAVE-ANNUITY-MSG = '1'                                    CAT31   
             MOVE ANNUITY-LIT           TO  H6-ANNUITY-MSG              CAT31   
           ELSE                                                         CAT31   
             MOVE SPACES                TO  H6-ANNUITY-MSG.             CAT31   
                                                                        CAT31   
           MOVE HDR6                    TO  PRINT-AREA.                 CAT31   
           MOVE ' '                     TO  CC.                         CAT31   
           PERFORM 1725-PRINT-LINE THRU                                 CAT31   
                   1725-PRINT-LINE-EXIT.                                CAT31   
                                                                        CAT31   
           MOVE 7                       TO  LINECNT.                    CAT31   
                                                                        CAT31   
       1750-HEADERS-EXIT.  EXIT.                                        CAT31   
           EJECT                                                        CAT31   
       1775-CASH-REPORTING.                                             CAT31   
           MOVE SAVE-ACCT-TITLE (1:30)  TO  H7-ACCT-TITLE.              CAT31   
           MOVE ACAT-ACCT-CASH-SMA      TO  H7-SMAT.                    CAT31   
           MOVE ACAT-ACCT-CASH-TY01     TO  H7-BALANCE.                 CAT31   
           MOVE '01'                    TO  H7-TYPE.                    CAT31   
                                                                        CAT31   
           MOVE HDR7                    TO  PRINT-AREA.                 CAT31   
           MOVE '0'                     TO  CC.                         CAT31   
           PERFORM 1725-PRINT-LINE THRU                                 CAT31   
                   1725-PRINT-LINE-EXIT.                                CAT31   
                                                                        CAT31   
           MOVE SAVE-ACCT-TITLE (31:20) TO  H7A-ACCT-TITLE.             CAT31   
           MOVE ACAT-ACCT-CASH-TY02     TO  H7A-BALANCE.                CAT31   
           MOVE '02'                    TO  H7A-TYPE.                   CAT31   
                                                                        CAT31   
           MOVE HDR7A                   TO  PRINT-AREA.                 CAT31   
           MOVE ' '                     TO  CC.                         CAT31   
           PERFORM 1725-PRINT-LINE THRU                                 CAT31   
                   1725-PRINT-LINE-EXIT.                                CAT31   
                                                                        CAT31   
           MOVE SPACES                  TO  H7A-ACCT-TITLE.             CAT31   
           MOVE ACAT-ACCT-CASH-TY05     TO  H7A-BALANCE.                CAT31   
           MOVE '05'                    TO  H7A-TYPE.                   CAT31   
                                                                        CAT31   
           MOVE HDR7A                   TO  PRINT-AREA.                 CAT31   
           MOVE ' '                     TO  CC.                         CAT31   
           PERFORM 1725-PRINT-LINE THRU                                 CAT31   
                   1725-PRINT-LINE-EXIT.                                CAT31   
                                                                        CAT31   
                                                                        CAT31   
      * CASH REPORTING COMPLETE NOW WRITE DETAIL HEADER                 CAT31   
                                                                        CAT31   
           MOVE SAVE-BROKER-NAME        TO  H8-BROKER-NAME.             CAT31   
           MOVE HDR8                    TO  PRINT-AREA.                 CAT31   
           MOVE '0'                     TO  CC.                         CAT31   
           PERFORM 1725-PRINT-LINE THRU                                 CAT31   
                   1725-PRINT-LINE-EXIT.                                CAT31   
                                                                        CAT31   
           MOVE HDR9                    TO  PRINT-AREA.                 CAT31   
           MOVE ' '                     TO  CC.                         CAT31   
           PERFORM 1725-PRINT-LINE THRU                                 CAT31   
                   1725-PRINT-LINE-EXIT.                                CAT31   
                                                                        CAT31   
                                                                        CAT31   
       1775-CASH-REPORTING-EXIT. EXIT.                                  CAT31   
           EJECT                                                        CAT31   
       1780-ACCOUNT-TOTALS.                                             CAT31   
           IF LINECNT > 45                                              CAT31   
             PERFORM 1750-HEADERS THRU                                  CAT31   
                     1750-HEADERS-EXIT                                  CAT31   
             MOVE HDR6C       TO  PRINT-AREA                            CAT31   
             MOVE ' '         TO  CC                                    CAT31   
             PERFORM 1725-PRINT-LINE THRU                               CAT31   
                     1725-PRINT-LINE-EXIT.                              CAT31   
                                                                        CAT31   
           MOVE 1                       TO PR-SUB.                      CAT31   
           PERFORM UNTIL PR-SUB > 9                                     CAT31   
             IF PR-SUB = 1 OR 2 OR 5                                    CAT31   
               MOVE 'TOTAL XX VALUES:'          TO  TL-MSG              CAT31   
               MOVE ACAT-ACCT-EQUITY (PR-SUB)   TO  TL-VALUE            CAT31   
               MOVE PR-SUB                      TO  TL-MSG (7:2)        CAT31   
               MOVE TOT-LINE                TO  PRINT-AREA              CAT31   
               MOVE '0'                     TO  CC                      CAT31   
               PERFORM 1725-PRINT-LINE THRU                             CAT31   
                       1725-PRINT-LINE-EXIT                             CAT31   
             ELSE                                                       CAT31   
               IF ACAT-ACCT-EQUITY (PR-SUB) NOT = ZERO                  CAT31   
                 MOVE 'TOTAL XX VALUES:'          TO  TL-MSG            CAT31   
                 MOVE ACAT-ACCT-EQUITY (PR-SUB)   TO  TL-VALUE          CAT31   
                 MOVE PR-SUB                      TO  TL-MSG (7:2)      CAT31   
                 MOVE TOT-LINE                TO  PRINT-AREA            CAT31   
                 MOVE '0'                     TO  CC                    CAT31   
                 PERFORM 1725-PRINT-LINE THRU                           CAT31   
                         1725-PRINT-LINE-EXIT                           CAT31   
                END-IF                                                  CAT31   
             END-IF                                                     CAT31   
                                                                        CAT31   
             ADD 1 TO PR-SUB                                            CAT31   
           END-PERFORM.                                                 CAT31   
                                                                        CAT31   
           COMPUTE FEE-WORK = SAVE-XFER-FEE + SAVE-XFER-FEE-IRA.        CAT31   
                                                                        CAT31   
           MOVE ZERO  TO  MAINT-WORK.                                   CAT31   
      *    IF ACAT-IRA-MAINT-FEE > 35                                   CAT31   
      *      MOVE 35  TO  MAINT-WORK                                    CAT31   
      *    ELSE                                                         CAT31   
      *      MOVE ACAT-IRA-MAINT-FEE TO MAINT-WORK.                     CAT31   
C02808                                                                  CAT31   
C02808     MOVE 'N' TO B1-TABLE-SEARCH-STATUS.                          CAT31   
C02808     MOVE ' ' TO B1-TABLE-SEARCH-SWITCH.                          CAT31   
C02808     MOVE 1    TO  B1-SUB1.                                       CAT31   
C02808     PERFORM UNTIL B1-SEARCH-END                                  CAT31   
C02808                                                                  CAT31   
C02808      IF B1-SUB1 > B1-TBL-CNT                                     CAT31   
C02808        MOVE 'N'  TO  B1-TABLE-SEARCH-STATUS                      CAT31   
C02808        MOVE 'Y'  TO  B1-TABLE-SEARCH-SWITCH                      CAT31   
C02808      END-IF                                                      CAT31   
C02808                                                                  CAT31   
C02808     IF B1-ADP-CLIENT (B1-SUB1) = SAVE-CLIENT                     CAT31   
C02808       MOVE B1-ITEMS (B1-SUB1) TO B1-WRK-ITEMS                    CAT31   
C02808       MOVE B1-SUB1  TO  B1-SUB1-SVE                              CAT31   
C02808       MOVE 'Y'  TO  B1-TABLE-SEARCH-STATUS                       CAT31   
C02808       MOVE 'Y'  TO  B1-TABLE-SEARCH-SWITCH                       CAT31   
C02808       END-IF                                                     CAT31   
C02808                                                                  CAT31   
C02808       ADD 1  TO  B1-SUB1                                         CAT31   
C02808     END-PERFORM.                                                 CAT31   
C02808                                                                  CAT31   
C02808     IF  B1-WRK-MAINT-FEE-FOR-IRA  = '1' AND                      CAT31   
C02808         H4-ACCT-TYPE = 'IRA/KEOUGH'                              CAT31   
C02808         CONTINUE                                                 CAT31   
C02808     ELSE                                                         CAT31   
C02808       GO TO 1780-ACCOUNT-TOTALS-CONT.                            CAT31   
C02808*                                                                 CAT31   
C02808*    IF (ACCOUNT-HAS-POSITIONS OR                                 CAT31   
C02808*        ACCOUNT-HAS-OUTSIDE-FUNDS  OR                            CAT31   
C02808*        SAVE-ACCT-FLAT-IND = 'Y')  AND                           CAT31   
C02808*        SAVE-IRA-KEOUGH-IND > SPACES                             CAT31   
C02808*      MOVE 35   TO  MAINT-WORK.                                  CAT31   
C02808*                                                                 CAT31   
C02808*    IF NOT ACCOUNT-HAS-POSITIONS AND                             CAT31   
C02808*       NOT ACCOUNT-HAS-OUTSIDE-FUNDS AND                         CAT31   
C02808*       ACCOUNT-HAS-LEGG-FUNDS AND                                CAT31   
C02808*       SAVE-IRA-KEOUGH-IND > SPACES                              CAT31   
C02808*      MOVE ACAT-LEGG-MAINT-FEE TO MAINT-WORK.                    CAT31   
C02808*                                                                 CAT31   
C02808*    IF ACCOUNT-HAS-CASH          AND                             CAT31   
C02808*       NOT ACCOUNT-HAS-POSITIONS AND                             CAT31   
C02808*       NOT ACCOUNT-HAS-OUTSIDE-FUNDS AND                         CAT31   
C02808*       NOT ACCOUNT-HAS-LEGG-FUNDS AND                            CAT31   
C02808*       SAVE-IRA-KEOUGH-IND > SPACES                              CAT31   
C02808*      MOVE 35   TO  MAINT-WORK.                                  CAT31   
C02808                                                                  CAT31   
C02808     IF  WS-POS-TYPE-LEGG = ZERO  AND                             CAT31   
C02808         WS-POS-TYPE-NON-LEGG = ZERO                              CAT31   
C02808         MOVE 35 TO MAINT-WORK                                    CAT31   
C02808     ELSE                                                         CAT31   
C02808       IF  WS-POS-TYPE-NON-LEGG  >  ZERO                          CAT31   
C02808           MOVE 35 TO MAINT-WORK                                  CAT31   
C02808       ELSE                                                       CAT31   
C02808           EVALUATE TRUE                                          CAT31   
C02808               WHEN WS-POS-TYPE-LEGG = 1                          CAT31   
C02808                    MOVE 10 TO MAINT-WORK                         CAT31   
C02808               WHEN WS-POS-TYPE-LEGG = 2                          CAT31   
C02808                    MOVE 20 TO MAINT-WORK                         CAT31   
C02808               WHEN WS-POS-TYPE-LEGG = 3                          CAT31   
C02808                    MOVE 30 TO MAINT-WORK                         CAT31   
C02808               WHEN OTHER                                         CAT31   
C02808                    MOVE 35 TO MAINT-WORK                         CAT31   
C02808           END-EVALUATE                                           CAT31   
C02808       END-IF                                                     CAT31   
C02808     END-IF.                                                      CAT31   
C02808                                                                  CAT31   
C02808 1780-ACCOUNT-TOTALS-CONT.                                        CAT31   
ET0001**   COMPUTE TOTAL-FEES  = FEE-WORK + MAINT-WORK.                 CAT31   
ET0001     COMPUTE TOTAL-FEES  = ADR-ACCT-TRNFR-FEE-AMT                 CAT31   
ET0001                         + ADR-ACCT-IRA-MAINT-AMT                 CAT31   
ET0001                         + ADR-ACCT-IRA-TRMNT-AMT                 CAT31   
LRM006                         + ADR-FRGN-FEE-AMT-TOT                   CAT31   
                                                                        CAT31   
           MOVE '   TRANSFER FEES APPLIED '  TO  TLL-MSG1.              CAT31   
                                                                        CAT31   
ET0001**   MOVE FEE-WORK                     TO  TLL-FEES.              CAT31   
ET0001     MOVE ADR-ACCT-TRNFR-FEE-AMT       TO TLL-FEES.               CAT31   
                                                                        CAT31   
           MOVE 'GRAND TOTAL '               TO  TLL-MSG.               CAT31   
           MOVE ACAT-ACCT-EQUITY (10)        TO  TLL-VALUE.             CAT31   
           MOVE TOT-LINE-LEGG                TO  PRINT-AREA.            CAT31   
                                                                        CAT31   
           MOVE ' '                     TO  CC.                         CAT31   
           PERFORM 1725-PRINT-LINE THRU                                 CAT31   
                   1725-PRINT-LINE-EXIT.                                CAT31   
                                                                        CAT31   
           MOVE 'MAINTENANCE FEES APPLIED '  TO  TLL-MSG1.              CAT31   
ET0001**   MOVE MAINT-WORK                   TO  TLL-FEES.              CAT31   
ET0001     MOVE ADR-ACCT-IRA-MAINT-AMT       TO TLL-FEES.               CAT31   
           MOVE 'NET BALANCES '              TO  TLL-MSG.               CAT31   
           COMPUTE ACAT-ACCT-CASH = ACAT-ACCT-CASH + TOTAL-FEES.        CAT31   
                                                                        CAT31   
           MOVE ACAT-ACCT-CASH          TO  TLL-VALUE.                  CAT31   
           MOVE TOT-LINE-LEGG           TO  PRINT-AREA.                 CAT31   
           MOVE ' '                     TO  CC.                         CAT31   
                                                                        CAT31   
           PERFORM 1725-PRINT-LINE THRU                                 CAT31   
                   1725-PRINT-LINE-EXIT.                                CAT31   
                                                                        CAT31   
      * DETERMINE CASH BALANCE TYPE - DEBIT OR CREDIT.                  CAT31   
           IF ACAT-ACCT-CASH > ZERO                                     CAT31   
             MOVE 'D'                   TO  TYPE-BAL.                   CAT31   
                                                                        CAT31   
           IF ACAT-ACCT-CASH < ZERO                                     CAT31   
             MOVE 'C'                   TO  TYPE-BAL.                   CAT31   
                                                                        CAT31   
      * DROP THE SIGN                                                   CAT31   
           MOVE ACAT-ACCT-CASH          TO  CASH-BAL.                   CAT31   
                                                                        CAT31   
      * CREDITS INCREASES TOTAL EQUITY, DEBIT DECREASE EQUITY           CAT31   
                                                                        CAT31   
           IF CASH-BAL = ZERO                                           CAT31   
             MOVE ACAT-ACCT-EQUITY (10)  TO ACAT-ACCT-TOT-EQUITY.       CAT31   
                                                                        CAT31   
           IF CREDIT-BAL                                                CAT31   
             COMPUTE ACAT-ACCT-TOT-EQUITY = ACAT-ACCT-EQUITY (10)       CAT31   
                                          + CASH-BAL.                   CAT31   
                                                                        CAT31   
           IF DEBIT-BAL                                                 CAT31   
             COMPUTE ACAT-ACCT-TOT-EQUITY = ACAT-ACCT-EQUITY (10)       CAT31   
                                          - CASH-BAL.                   CAT31   
ET0001**   MOVE 'EQUITY '               TO  TL-MSG.                     CAT31   
ET0001**   MOVE ACAT-ACCT-TOT-EQUITY    TO  TL-VALUE.                   CAT31   
ET0001**                                                                CAT31   
ET0001**   MOVE TOT-LINE                TO  PRINT-AREA.                 CAT31   
ET0001**   MOVE ' '                     TO  CC.                         CAT31   
ET0001**   PERFORM 1725-PRINT-LINE THRU                                 CAT31   
ET0001**           1725-PRINT-LINE-EXIT.                                CAT31   
ET0001                                                                  CAT31   
ET0001     MOVE ' IRA TRNFER FEES APPLIED '  TO  TLL-MSG1.              CAT31   
ET0001     MOVE ADR-ACCT-IRA-TRMNT-AMT       TO TLL-FEES.               CAT31   
ET0001                                                                  CAT31   
ET0001     MOVE 'EQUITY      '               TO  TLL-MSG.               CAT31   
ET0001     MOVE ACAT-ACCT-TOT-EQUITY         TO  TLL-VALUE.             CAT31   
ET0001     MOVE TOT-LINE-LEGG                TO  PRINT-AREA.            CAT31   
ET0001                                                                  CAT31   
ET0001     MOVE ' '                     TO  CC.                         CAT31   
ET0001     PERFORM 1725-PRINT-LINE THRU                                 CAT31   
ET0001             1725-PRINT-LINE-EXIT.                                CAT31   
                                                                        CAT31   
LRM006     MOVE '    FOREIGN FEES APPLIED '  TO FRGN-MSG1.              CAT31   
LRM006     MOVE ADR-FRGN-FEE-AMT-TOT         TO FRGN-FEES.              CAT31   
LRM006     MOVE FRGN-FEE-LINE                TO  PRINT-AREA.            CAT31   
LRM006                                                                  CAT31   
LRM006     MOVE ' '                     TO  CC.                         CAT31   
LRM006     PERFORM 1725-PRINT-LINE THRU                                 CAT31   
LRM006             1725-PRINT-LINE-EXIT.                                CAT31   
                                                                        CAT31   
      * CHECK FOR OPTION DATA IF PRESENT WRITE OPTION LINES NOW         CAT31   
                                                                        CAT31   
           IF ACT-OPTION-CTR = ZERO                                     CAT31   
             GO TO 1780-SPAD-PROCESSING.                                CAT31   
                                                                        CAT31   
           MOVE ' OPTION INFORMATION '   TO  ASTERICK-LINE (35:20).     CAT31   
           IF LINECNT > 45                                              CAT31   
             PERFORM 1750-HEADERS THRU                                  CAT31   
                     1750-HEADERS-EXIT                                  CAT31   
             MOVE HDR6C       TO  PRINT-AREA                            CAT31   
             MOVE ' '         TO  CC                                    CAT31   
             PERFORM 1725-PRINT-LINE THRU                               CAT31   
                     1725-PRINT-LINE-EXIT.                              CAT31   
                                                                        CAT31   
           MOVE ASTERICK-LINE TO  PRINT-AREA.                           CAT31   
           MOVE '0'           TO  CC.                                   CAT31   
           PERFORM 1725-PRINT-LINE THRU                                 CAT31   
                   1725-PRINT-LINE-EXIT.                                CAT31   
                                                                        CAT31   
           MOVE OPT-HDR1      TO  PRINT-AREA.                           CAT31   
           MOVE ' '           TO  CC.                                   CAT31   
           PERFORM 1725-PRINT-LINE THRU                                 CAT31   
                   1725-PRINT-LINE-EXIT.                                CAT31   
                                                                        CAT31   
           MOVE OPT-HDR2      TO  PRINT-AREA.                           CAT31   
           MOVE ' '           TO  CC.                                   CAT31   
           PERFORM 1725-PRINT-LINE THRU                                 CAT31   
                   1725-PRINT-LINE-EXIT.                                CAT31   
                                                                        CAT31   
           MOVE 1             TO  OPT-SUB.                              CAT31   
           PERFORM UNTIL OPT-SUB > ACT-OPTION-CTR                       CAT31   
                                                                        CAT31   
             IF LINECNT > 45                                            CAT31   
               PERFORM 1750-HEADERS THRU                                CAT31   
                       1750-HEADERS-EXIT                                CAT31   
               MOVE HDR6C       TO  PRINT-AREA                          CAT31   
               MOVE ' '         TO  CC                                  CAT31   
               PERFORM 1725-PRINT-LINE THRU                             CAT31   
                       1725-PRINT-LINE-EXIT                             CAT31   
                                                                        CAT31   
               MOVE ASTERICK-LINE TO  PRINT-AREA                        CAT31   
               MOVE '0'           TO  CC                                CAT31   
               PERFORM 1725-PRINT-LINE THRU                             CAT31   
                       1725-PRINT-LINE-EXIT                             CAT31   
                                                                        CAT31   
               MOVE OPT-HDR1      TO  PRINT-AREA                        CAT31   
               MOVE ' '           TO  CC                                CAT31   
               PERFORM 1725-PRINT-LINE THRU                             CAT31   
                       1725-PRINT-LINE-EXIT                             CAT31   
                                                                        CAT31   
               MOVE OPT-HDR2      TO  PRINT-AREA                        CAT31   
               MOVE ' '           TO  CC                                CAT31   
               PERFORM 1725-PRINT-LINE THRU                             CAT31   
                       1725-PRINT-LINE-EXIT                             CAT31   
             END-IF                                                     CAT31   
                                                                        CAT31   
             MOVE ACT-OPT-QTY   (OPT-SUB)  TO  OPDTL-QTY                CAT31   
             IF ACT-OPT-BUY-SELL  (OPT-SUB) = '1'                       CAT31   
               MOVE 'BUY'                  TO  OPDTL-BUY-SELL           CAT31   
             ELSE                                                       CAT31   
               MOVE 'SELL'                 TO  OPDTL-BUY-SELL           CAT31   
             END-IF                                                     CAT31   
                                                                        CAT31   
             IF ACT-OPT-PUT-CALL (OPT-SUB) = 'P'                        CAT31   
               MOVE 'PUT'                  TO  OPDTL-PUT-CALL           CAT31   
             ELSE                                                       CAT31   
               MOVE 'CALL'                 TO  OPDTL-PUT-CALL           CAT31   
             END-IF                                                     CAT31   
                                                                        CAT31   
             IF ACT-OPT-OPEN-CLOSE (OPT-SUB) = 'O'                      CAT31   
               MOVE 'OPEN'                 TO  OPDTL-OPEN-CLOSE         CAT31   
             ELSE                                                       CAT31   
               MOVE 'CLOSE'                TO  OPDTL-OPEN-CLOSE         CAT31   
             END-IF                                                     CAT31   
                                                                        CAT31   
             MOVE ACT-OPT-SYMBOL (OPT-SUB) TO  OPDTL-SYMBOL             CAT31   
             MOVE ACT-OPT-EXPIRE-MM (OPT-SUB) TO  OPDTL-EXPIRE-MM       CAT31   
             MOVE ACT-OPT-EXPIRE-Y (OPT-SUB) TO   OPDTL-EXPIRE-Y        CAT31   
             MOVE ACT-OPT-OPTION-DATA (OPT-SUB) TO OPDTL-DATA           CAT31   
      * MOVE PRICE INTEGER                                              CAT31   
      *      MOVE ACT-OPT-PRICE (OPT-SUB)       TO  FTD-NUM             CAT31   
             MOVE ACT-OPT-PRICE (OPT-SUB)       TO  OPDTL-PRICE         CAT31   
      *      MOVE ACT-OPT-1-8TH-PRICE (OPT-SUB) TO PR-SUB               CAT31   
      * ADD PRICE FRACTION IN 8THS                                      CAT31   
      *      IF ACT-OPT-1-8TH-PRICE (OPT-SUB) = ZERO                    CAT31   
      *        CONTINUE                                                 CAT31   
      *      ELSE                                                       CAT31   
      *        COMPUTE FTD-NUM = FTD-NUM +                              CAT31   
      *                          FTD-VALUES (PR-SUB)                    CAT31   
      *      END-IF                                                     CAT31   
                                                                        CAT31   
      * MOVE PRICE TO PRINT LINE                                        CAT31   
      *      MOVE FTD-NUM                        TO  OPDTL-PRICE        CAT31   
                                                                        CAT31   
             MOVE OPT-DETAIL                     TO  PRINT-AREA         CAT31   
             MOVE '0'                            TO  CC                 CAT31   
             PERFORM 1725-PRINT-LINE THRU                               CAT31   
                     1725-PRINT-LINE-EXIT                               CAT31   
                                                                        CAT31   
             ADD 1 TO  OPT-SUB                                          CAT31   
           END-PERFORM.                                                 CAT31   
                                                                        CAT31   
           MOVE ZERO  TO  ACT-OPTION-CTR.                               CAT31   
                                                                        CAT31   
       1780-SPAD-PROCESSING.                                            CAT31   
      * NOW PRINT SPAD MESSAGES IF PRESENT                              CAT31   
           MOVE ' SPAD MESSAGES '   TO  ASTERICK-LINE (35:20).          CAT31   
                                                                        CAT31   
           IF SPAD-MSG-CTR = ZERO                                       CAT31   
             GO TO 1780-ACCOUNT-TOTALS-EXIT.                            CAT31   
                                                                        CAT31   
           IF LINECNT > 50                                              CAT31   
             PERFORM 1750-HEADERS THRU                                  CAT31   
                     1750-HEADERS-EXIT                                  CAT31   
             MOVE HDR6C       TO  PRINT-AREA                            CAT31   
             MOVE ' '         TO  CC                                    CAT31   
             PERFORM 1725-PRINT-LINE THRU                               CAT31   
                     1725-PRINT-LINE-EXIT                               CAT31   
           END-IF.                                                      CAT31   
                                                                        CAT31   
           MOVE ASTERICK-LINE          TO  PRINT-AREA.                  CAT31   
           MOVE '0'                    TO  CC.                          CAT31   
           PERFORM 1725-PRINT-LINE THRU                                 CAT31   
                   1725-PRINT-LINE-EXIT.                                CAT31   
                                                                        CAT31   
           MOVE 1  TO  SP-SUB.                                          CAT31   
                                                                        CAT31   
           PERFORM UNTIL SP-SUB > SPAD-MSG-CTR                          CAT31   
             IF LINECNT > 55                                            CAT31   
               PERFORM 1750-HEADERS THRU                                CAT31   
                       1750-HEADERS-EXIT                                CAT31   
               MOVE HDR6C       TO  PRINT-AREA                          CAT31   
               MOVE ' '         TO  CC                                  CAT31   
               PERFORM 1725-PRINT-LINE THRU                             CAT31   
                       1725-PRINT-LINE-EXIT                             CAT31   
               MOVE ASTERICK-LINE          TO  PRINT-AREA               CAT31   
               MOVE '0'                    TO  CC                       CAT31   
               PERFORM 1725-PRINT-LINE THRU                             CAT31   
                       1725-PRINT-LINE-EXIT                             CAT31   
             END-IF                                                     CAT31   
             MOVE SPAD-MSG-LINE (SP-SUB) TO  SPAD-DETAIL-MSG            CAT31   
             MOVE SPAD-DETAIL-LINE       TO  PRINT-AREA                 CAT31   
             MOVE '0'                    TO  CC                         CAT31   
             PERFORM 1725-PRINT-LINE THRU                               CAT31   
                     1725-PRINT-LINE-EXIT                               CAT31   
             ADD 1   TO  SP-SUB                                         CAT31   
           END-PERFORM.                                                 CAT31   
                                                                        CAT31   
           MOVE ZERO    TO   SPAD-MSG-CTR.                              CAT31   
                                                                        CAT31   
       1780-ACCOUNT-TOTALS-EXIT. EXIT.                                  CAT31   
           EJECT                                                        CAT31   
       1790-SUMMARY-REPORT.                                             CAT31   
                                                                        CAT31   
           MOVE 'Y'     TO  ACCOUNT-SUMMARY-SW.                         CAT31   
           PERFORM 1750-HEADERS THRU                                    CAT31   
                   1750-HEADERS-EXIT.                                   CAT31   
                                                                        CAT31   
           IF MMS-SUB = ZERO                                            CAT31   
             MOVE '******* NO ACTIVITY FOR TODAY *******'               CAT31   
                                         TO NAL-MSG                     CAT31   
             MOVE NO-ACTV-LINE           TO PRINT-AREA                  CAT31   
             MOVE '0'                    TO CC                          CAT31   
             PERFORM 1725-PRINT-LINE THRU                               CAT31   
                     1725-PRINT-LINE-EXIT                               CAT31   
             GO TO 1790-SUMMARY-REPORT-EXIT.                            CAT31   
                                                                        CAT31   
           MOVE 1 TO PRT-SUB.                                           CAT31   
           PERFORM UNTIL PRT-SUB > MMS-SUB                              CAT31   
             MOVE MMS-BRANCH  (PRT-SUB)  TO  SD-BRANCH                  CAT31   
             MOVE MMS-ACCOUNT (PRT-SUB)  TO  SD-ACCOUNT                 CAT31   
             IF LINECNT > 55                                            CAT31   
               PERFORM 1750-HEADERS THRU                                CAT31   
                       1750-HEADERS-EXIT                                CAT31   
             END-IF                                                     CAT31   
             MOVE SUMMARY-DTL            TO PRINT-AREA                  CAT31   
             MOVE '0'                    TO CC                          CAT31   
             PERFORM 1725-PRINT-LINE THRU                               CAT31   
                     1725-PRINT-LINE-EXIT                               CAT31   
             ADD 1 TO PRT-SUB                                           CAT31   
           END-PERFORM.                                                 CAT31   
                                                                        CAT31   
       1790-SUMMARY-REPORT-EXIT.  EXIT.                                 CAT31   
           EJECT                                                        CAT31   
       1800-END-OF-JOB-ROUTINE.                                         CAT31   
                                                                        CAT31   
           IF ACATDELV-DTL-RECS = ZERO                                  CAT31   
             GO TO 1810-CONTROL-TOTALS.                                 CAT31   
                                                                        CAT31   
           IF ACAT-CASH-REPORTED                                        CAT31   
             IF (ADR-CONTROLLER = ZEROS AND ADR-BRANCH = SPACES) OR     CAT31   
                ADR-BRANCH     = SPACES                                 CAT31   
               CONTINUE                                                 CAT31   
             ELSE                                                       CAT31   
               PERFORM 1780-ACCOUNT-TOTALS THRU                         CAT31   
                       1780-ACCOUNT-TOTALS-EXIT                         CAT31   
               PERFORM 1790-SUMMARY-REPORT THRU                         CAT31   
                       1790-SUMMARY-REPORT-EXIT                         CAT31   
             END-IF                                                     CAT31   
           ELSE                                                         CAT31   
              PERFORM 1750-HEADERS THRU                                 CAT31   
                      1750-HEADERS-EXIT                                 CAT31   
              PERFORM 1775-CASH-REPORTING THRU                          CAT31   
                      1775-CASH-REPORTING-EXIT                          CAT31   
              IF (ADR-CONTROLLER = ZEROS AND ADR-BRANCH = SPACES) OR    CAT31   
                 ADR-BRANCH     = SPACES                                CAT31   
                CONTINUE                                                CAT31   
              ELSE                                                      CAT31   
               PERFORM 1780-ACCOUNT-TOTALS THRU                         CAT31   
                       1780-ACCOUNT-TOTALS-EXIT                         CAT31   
               PERFORM 1790-SUMMARY-REPORT THRU                         CAT31   
                       1790-SUMMARY-REPORT-EXIT                         CAT31   
              END-IF                                                    CAT31   
           END-IF.                                                      CAT31   
       1810-CONTROL-TOTALS.                                             CAT31   
                                                                        CAT31   
           CLOSE ACAT-DELIVER-FILE                                      CAT31   
                 POSITION-FILE                                          CAT31   
                 REPORT-FILE.                                           CAT31   
                                                                        CAT31   
      *    CLOSE BALNC-FILE                                             CAT31   
           MOVE 'C' TO GETVBAL-FUNC.                                            
           PERFORM CALL-GETVBAL.                                                
           CLOSE SPAD-FILE                                              CAT31   
                 ANNU-FILE                                              CAT31   
                 REG-OPT-FILE.                                          CAT31   
                                                                        CAT31   
           DISPLAY 'RECORDS READ              - ' ACATDELV-DTL-RECS.    CAT31   
           DISPLAY 'RECORDS BYPASSED CLIENT   - ' ACATDELV-BYP-CLI.     CAT31   
           DISPLAY 'RECORDS BYPASSED CNTL NO  - ' ACATDELV-BYP-RANGE.   CAT31   
DJ0002     DISPLAY 'BALANCE  RECORDS READ     - ' BALNC-READ            CAT31   
           DISPLAY 'POSITION RECORDS READ     - ' POSITION-RECS-READ.   CAT31   
           DISPLAY 'POSITION RECS  EXTRACTED  - ' POS-SEC-CNT.          CAT31   
           DISPLAY 'DB2 REORG-CD       FOUND  - ' SQL-ROW-FND-CNT.      CAT31   
           DISPLAY 'DB2 REORG-CD   NOT FOUND  - ' SQL-ROW-NOT-CNT.      CAT31   
           DISPLAY 'REORG-CD           VALID  - ' REORG-VALID-CNT.      CAT31   
           DISPLAY 'CAT31 ENDING NORMALLY.'.                            CAT31   
       1800-END-OF-JOB-ROUTINE-EXIT.  EXIT.                             CAT31   
           EJECT                                                        CAT31   
       2000-MSDDB2-RTN.                                                 CAT31   
      *  GET REORG CODE FROM MSD DB2 FILE                               CAT31   
                                                                        CAT31   
DJ***********TO TEST SQL 01/09/98                                       CAT31   
DJ    **   IF  ADR-ADP-SEC-NO(1:1) = 'A'                                CAT31   
DJ    **       MOVE 'A001227'       TO  WS-ADP-SEC-NO                   CAT31   
DJ    **   ELSE                                                         CAT31   
DJ    **       MOVE ADR-ADP-SEC-NO  TO  WS-ADP-SEC-NO                   CAT31   
DJ    **   END-IF.                                                      CAT31   
DJ***********TO TEST SQL 01/09/98                                       CAT31   
DJ         MOVE ADR-ADP-SEC-NO      TO  WS-ADP-SEC-NO.                  CAT31   
                                                                        CAT31   
           MOVE SPACES              TO  WS-REORG-CD.                    CAT31   
DJ0002     MOVE SPACES              TO  RGNZN-CD OF DCLVMSDRGNZ         CAT31   
           ADD  1 TO POS-SEC-CNT                                        CAT31   
                                                                        CAT31   
           EXEC SQL SELECT                                              CAT31   
                           RGNZN_CD                                     CAT31   
                INTO                                                    CAT31   
                           :DCLVMSDRGNZ.RGNZN-CD                        CAT31   
                FROM                                                    CAT31   
                           VMSDRGNZ                                     CAT31   
                WHERE                                                   CAT31   
                           SECURITY_ADP_NBR = :WS-ADP-SEC-NO            CAT31   
           END-EXEC                                                     CAT31   
                                                                        CAT31   
DJ0002     MOVE RGNZN-CD OF DCLVMSDRGNZ TO WS-REORG-CD                  CAT31   
           IF  SQLCODE  =  +0                                           CAT31   
               ADD  1 TO SQL-ROW-FND-CNT                                CAT31   
               DISPLAY 'CAT31: VMSDRGNZ:'                               CAT31   
                       ' CUSIP= ' ADR-CUSIP                             CAT31   
                       ' SEC= ' ADR-ADP-SEC-NO                          CAT31   
                       ' WS-ADP-NO= ' WS-ADP-SEC-NO                     CAT31   
                       ' REORG-CD= ' WS-REORG-CD                        CAT31   
           ELSE                                                         CAT31   
               ADD  1 TO SQL-ROW-NOT-CNT                                CAT31   
               IF  SQLCODE  NOT =  +100                                 CAT31   
DJ0002             DISPLAY 'CAT31: VMSDRGNZ:'                           CAT31   
DJ0002                 ' CUSIP= ' ADR-CUSIP                             CAT31   
DJ0002                 ' SEC= ' ADR-ADP-SEC-NO                          CAT31   
DJ0002                 ' WS-ADP-NO= ' WS-ADP-SEC-NO                     CAT31   
DJ0002                 ' REORG-CD= ' WS-REORG-CD                        CAT31   
DJ0002                     ' (SQL ERROR)'                               CAT31   
                   PERFORM  2010-MSDDB2-ERROR-RTN                       CAT31   
                      THRU  2010-MSDDB2-ERROR-RTN-EXIT                  CAT31   
               ELSE                                                     CAT31   
               DISPLAY 'CAT31: VMSDRGNZ:'                               CAT31   
                       ' CUSIP= ' ADR-CUSIP                             CAT31   
                       ' SEC= ' ADR-ADP-SEC-NO                          CAT31   
                       ' WS-ADP-NO= ' WS-ADP-SEC-NO                     CAT31   
DJ0002                 ' REORG-CD= ' WS-REORG-CD                        CAT31   
DJ0002                     ' (NOT FOUND)'                               CAT31   
               END-IF                                                   CAT31   
           END-IF.                                                      CAT31   
                                                                        CAT31   
       2000-MSDDB2-RTN-EXIT. EXIT.                                      CAT31   
                                                                        CAT31   
                                                                        CAT31   
                                                                        CAT31   
       2010-MSDDB2-ERROR-RTN.                                           CAT31   
                                                                        CAT31   
DJ0002     DISPLAY ' '.                                                 CAT31   
           CALL DSNTIAR USING SQLCA WS-DB2-MESSAGE-AREA                 CAT31   
                                    WS-ERR-LINE-LEN.                    CAT31   
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                   CAT31   
             UNTIL WS-ERROR-INDEX GREATER THAN 12                       CAT31   
                   IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES            CAT31   
                      DISPLAY WS-ERROR-MSG (WS-ERROR-INDEX)             CAT31   
                   END-IF                                               CAT31   
           END-PERFORM.                                                 CAT31   
                                                                        CAT31   
DJ0002     IF  SQLCODE = +100 OR -811                                   CAT31   
DJ0002         CONTINUE                                                 CAT31   
DJ0002     ELSE                                                         CAT31   
DJ0002         DISPLAY ' '                                              CAT31   
DJ0002         DISPLAY 'CAT31: U3999 - ABENDING ON BAD DB2 STATUS'      CAT31   
DJ0002         MOVE +3999  TO  ABORT-CODE                               CAT31   
DJ0002         PERFORM ABEND-RTN                                        CAT31   
DJ0002     END-IF.                                                      CAT31   
DJ0002     DISPLAY ' '.                                                 CAT31   
                                                                        CAT31   
       2010-MSDDB2-ERROR-RTN-EXIT.  EXIT.                               CAT31   
           EJECT                                                        CAT31   
       CALL-GETVBAL.                                                            
           CALL GETVBAL USING GETVBAL-PARM.                                     
           MOVE GETVBAL-FILE-STATUS TO BALNC-FILE-STATUS                        
           MOVE GETVBAL-VSAM-STATUS TO BALNC-FILE-CODE                          
           IF GETVBAL-FILE = 'N'                                                
              MOVE GETVBAL-NEW-RECORD TO BAL-REC                                
           ELSE                                                                 
              MOVE GETVBAL-OLD-RECORD TO CMBL-CUSTOMER-BALANCE-SEGMENT.         
       ABEND-RTN.                                                       CAT31   
           CALL  ABEND  USING ABORT-CODE.                               CAT31   
