000001* PDX    - CAT760   C0166572 11/06/01 10:00:54 TBLAMUR            00001000
000001* PDX    - CAT760   C0151594 12/18/00 15:38:59 TBDOJUN            00001000
      * DJ0001 SSR# R0513700 FIX SHORT POSITIONS ON REPORT              CAT760  
000001* PDX    - CAT760   C0150964 12/04/00 21:06:22 TBJOHAR            CAT760  
000001* PDX    - CAT760   C0127247 06/16/99 01:40:10 TBJOHAR            CAT760  
000001* PDX    - CAT760   C0122170 02/23/99 17:49:44 TBJUCAS            CAT760  
000001* PDX    - CAT760   C0122064 02/20/99 16:11:45 TBJUCAS            CAT760  
000001* PDX    - CAT760   C0121877 02/17/99 13:42:44 TBJUCAS            CAT760  
000001* PDX    - CAT760   C0121343 02/12/99 11:11:22 TBJUCAS            CAT760  
       IDENTIFICATION DIVISION.                                         CAT760  
       PROGRAM-ID. CAT760.                                              CAT760  
      *                                                                 CAT760  
       DATE-WRITTEN. FEBRUARY 1999.                                     CAT760  
      *---------------------------------------------------------------* CAT760  
      *REMARKS.                                                       * CAT760  
      *                                                               * CAT760  
      *  THIS PROGRAM - CREATES THE ACATS RECEIVER ASSET VALUATION    * CAT760  
      *                 REPORT FROM THE SIAC716 FILE. THE B1 FILE     * CAT760  
      *                 IS ALSO USED IN THIS PROGRAM TO SELECT        * CAT760  
      *                 ACCOUNTS FOR REPORTING.                       * CAT760  
      *                                                               * CAT760  
      *               - THE REPORT IS IN CLIENT, CONTROLLER, BRANCH   * CAT760  
      *                 AND ACCOUNT NUMBER SEQUENCE.                  * CAT760  
      *                                                               * CAT760  
      *  THIS PROGRAM IS MODELED AFTER CAT32.                         * CAT760  
      *---------------------------------------------------------------* CAT760  
      *   02/23/99  JPC   REMOVED SELECT OF UNUSED COLUMS             * CAT760  
      *---------------------------------------------------------------* CAT760  
           EJECT                                                        CAT760  
       ENVIRONMENT DIVISION.                                            CAT760  
       INPUT-OUTPUT SECTION.                                            CAT760  
                                                                        CAT760  
       FILE-CONTROL.                                                    CAT760  
      ***********************  INPUT FILES  *************************** CAT760  
                                                                        CAT760  
           SELECT  REPORT-FILE         ASSIGN  TO  UT-S-REPORT.         CAT760  
                                                                        CAT760  
           SELECT  SORT-FILE           ASSIGN  TO  SORTWK01.            CAT760  
                                                                        CAT760  
           EJECT                                                        CAT760  
      ***************************************************************** CAT760  
       DATA DIVISION.                                                   CAT760  
      ***************************************************************** CAT760  
       FILE SECTION.                                                    CAT760  
                                                                        CAT760  
       FD  REPORT-FILE                                                  CAT760  
           RECORDING MODE IS F                                          CAT760  
           DATA RECORD IS REPORT-REC.                                   CAT760  
       01  REPORT-REC                  PIC X(143).                      CAT760  
                                                                        CAT760  
       SD  SORT-FILE.                                                   CAT760  
       01  SORT-REC.                                                    CAT760  
           05  SORT-CLIENT             PIC 9(03).                       CAT760  
           05  SORT-CONTROLLER         PIC 9(03).                       CAT760  
           05  SORT-BRANCH             PIC X(03).                       CAT760  
           05  SORT-ACCOUNT            PIC X(05).                       CAT760  
           05  SORT-CNTL-NO            PIC X(14).                       CAT760  
           05  SORT-CUSIP              PIC X(09).                       CAT760  
           05  SORT-TRAN-TYPE          PIC X(02).                       CAT760  
           05  FILLER                  PIC X(372).                      CAT760  
           EJECT                                                        CAT760  
      ***************************************************************** CAT760  
       WORKING-STORAGE  SECTION.                                        CAT760  
      ***************************************************************** CAT760  
       77  PGM-NAME                         PIC X(06)  VALUE 'CAT760'.  CAT760  
                                                                        CAT760  
       77  WS-ACAT-PROC-DATE                PIC X(06)  VALUE ' '.       CAT760  
                                                                        CAT760  
       77  PEND-PROC-DATE                   PIC X(06)  VALUE ' '.       CAT760  
                                                                        CAT760  
       77  WS-DATE                          PIC 9(06)  VALUE 0.         CAT760  
                                                                        CAT760  
       77  GETXREF                          PIC X(8)  VALUE 'ZGETXREF'. CAT760  
       77  ABEND-CODE-2000      COMP        PIC S9(4)  VALUE +2000.     CAT760  
                                                                        CAT760  
       77  ABEND-CODE-4004      COMP        PIC S9(4)  VALUE +4004.     CAT760  
       77  ABEND-CODE-4008      COMP        PIC S9(4)  VALUE +4008.     CAT760  
       77  ABEND-CODE-4012      COMP        PIC S9(4)  VALUE +4012.     CAT760  
       77  ABEND-CODE-4016      COMP        PIC S9(4)  VALUE +4016.     CAT760  
       77  ABEND-CODE-4020      COMP        PIC S9(4)  VALUE +4020.     CAT760  
       77  ABEND-CODE-4024      COMP        PIC S9(4)  VALUE +4024.     CAT760  
       77  ABEND-CODE-4028      COMP        PIC S9(4)  VALUE +4028.     CAT760  
       77  ABEND-CODE-4090      COMP        PIC S9(4)  VALUE +4090.     CAT760  
       77  ABEND-CODE-4091      COMP        PIC S9(4)  VALUE +4091.     CAT760  
                                                                        CAT760  
       77  ABEND-CODE-8000      COMP        PIC S9(4)  VALUE +8000.     CAT760  
       77  MINUS-ONE                        PIC S9(4)  VALUE -1.        CAT760  
                                                                        CAT760  
       77  B1-SUB                           PIC 9(4)    VALUE 0.        CAT760  
       77  B11-SUB                          PIC 9(4)    VALUE 0.        CAT760  
       77  B1-TBL-CNT                       PIC 9(4)    VALUE 0.        CAT760  
       77  B1-SUB1                          PIC 9(4)    VALUE 0.        CAT760  
       77  B1-SUB1-SVE                      PIC 9(4)    VALUE 0.        CAT760  
       77  B3-SUB                           PIC 9(4)    VALUE 0.        CAT760  
       77  B6-SUB                           PIC 9(4)    VALUE 0.        CAT760  
       77  EQ-SUB                           PIC 9(4)    VALUE 0.        CAT760  
       77  ACT-SUB                          PIC 9(4)    VALUE 0.        CAT760  
       77  OPT-SUB                          PIC 9(4)    VALUE 0.        CAT760  
       77  MVE-SUB                          PIC 9(4)    VALUE 0.        CAT760  
       77  MEMO-SUB                         PIC 9(4)    VALUE 0.        CAT760  
       77  PR-SUB                           PIC 9(4)    VALUE 0.        CAT760  
       77  T-SUB1                           PIC 9(4)    VALUE 0.        CAT760  
       77  T-SUB2                           PIC 9(4)    VALUE 0.        CAT760  
       77  LINECNT                          PIC 9(4)    VALUE 99.       CAT760  
       77  PAGECNT                          PIC 9(4)    VALUE 0.        CAT760  
       77  TEST-BR                          PIC 9(3)    VALUE 0.        CAT760  
       77  TEST-ACCT                        PIC 9(5)    VALUE 0.        CAT760  
       77  CASH-BAL              COMP-3     PIC 9(9)V99 VALUE 0.        CAT760  
       77  WORK-WHOLE-NUM                   PIC S9(9)   VALUE 0.        CAT760  
                                                                        CAT760  
       77  WS-PREV-REC-TYPE                 PIC X(01)  VALUE ' '.       CAT760  
           88  WS-PREV-HEADER-REC                      VALUE 'H'.       CAT760  
           88  WS-PREV-TRAILER-REC                     VALUE 'T'.       CAT760  
           88  WS-PREV-DATA-RECS                       VALUE 'D'.       CAT760  
                                                                        CAT760  
       77  B1-TABLE-SEARCH-STATUS           PIC X(01)  VALUE ' '.       CAT760  
           88  B1-ENTRY-FOUND                          VALUE 'Y'.       CAT760  
           88  B1-ENTRY-NOT-FOUND                      VALUE 'N'.       CAT760  
                                                                        CAT760  
       77  B1-TABLE-SEARCH-SWITCH           PIC X(01)  VALUE ' '.       CAT760  
           88  B1-SEARCH-END                           VALUE 'Y'.       CAT760  
                                                                        CAT760  
       77  B1-RANGE-SEARCH-STATUS           PIC X(01)  VALUE ' '.       CAT760  
           88  B1-RANGE-FOUND                          VALUE 'Y'.       CAT760  
           88  B1-RANGE-NOT-FOUND                      VALUE 'N'.       CAT760  
                                                                        CAT760  
       77  B1-RANGE-SEARCH-SWITCH           PIC X(01)  VALUE ' '.       CAT760  
           88  B1-RANGE-SEARCH-END                     VALUE 'Y'.       CAT760  
                                                                        CAT760  
       77  WS-ACAT-FIRST-TIME-SW            PIC X(01)  VALUE 'Y'.       CAT760  
           88  WS-ACAT-FIRST-TIME                      VALUE 'Y'.       CAT760  
                                                                        CAT760  
       77  WS-ACAT-CASH-REPORTING-SW        PIC X(01)  VALUE ' '.       CAT760  
           88  WS-ACAT-CASH-REPORTED                   VALUE 'Y'.       CAT760  
                                                                        CAT760  
       77  WS-ACAT-DELETE-SW                PIC X(01)  VALUE ' '.       CAT760  
           88  WS-ACAT-DELETED                         VALUE 'Y'.       CAT760  
                                                                        CAT760  
       77  WS-ACAT-EOF-SW                   PIC X(01)  VALUE ' '.       CAT760  
           88  WS-ACAT-EOF                             VALUE 'Y'.       CAT760  
                                                                        CAT760  
       77  WS-ASST-EOF-SW                   PIC X(01)  VALUE ' '.       CAT760  
           88  WS-ASST-EOF                             VALUE 'Y'.       CAT760  
                                                                        CAT760  
       77  WS-ACAT-BYPASS-SW                PIC X(01)  VALUE ' '.       CAT760  
           88  WS-ACAT-BYPASS                          VALUE 'Y'.       CAT760  
                                                                        CAT760  
       77  ADR-ACCT-TEST                    PIC X(02)  VALUE '  '.      CAT760  
           88  ADR-IRA                                 VALUE '03' '04'  CAT760  
                                                             '05'.      CAT760  
       77  WS-MEMO-MSG-SW                   PIC X      VALUE ' '.       CAT760  
           88  WS-MEMO-MSG                             VALUE 'Y'.       CAT760  
                                                                        CAT760  
       77  WS-EQUITY-PROCESS-SW             PIC X      VALUE ' '.       CAT760  
           88  WS-EQUITY-PROCESS-DONE                  VALUE 'Y'.       CAT760  
                                                                        CAT760  
       77  WS-TYPE-BAL                      PIC X      VALUE ' '.       CAT760  
           88  WS-CREDIT-BAL                           VALUE 'C'.       CAT760  
           88  WS-DEBIT-BAL                            VALUE 'D'.       CAT760  
                                                                        CAT760  
       77  WS-VASSET-IND                    PIC X      VALUE ' '.       CAT760  
           88  WS-VASSET-FOUND                         VALUE 'Y'.       CAT760  
                                                                        CAT760  
       01  SPIE-KEY                     PIC S9(08) COMP    VALUE +133.  CAT760  
       01  SPIE-GRP                     PIC X(04)          VALUE 'ACAT'.CAT760  
                                                                        CAT760  
       01  WS-COUNTERS.                                                 CAT760  
           05  WS-ACAT-HDRS-READ        PIC 9(7)   COMP-3  VALUE ZERO.  CAT760  
           05  WS-ACAT-BYP-RECS         PIC 9(7)   COMP-3  VALUE ZERO.  CAT760  
           05  WS-ACAT-REJ-RECS         PIC 9(7)   COMP-3  VALUE ZERO.  CAT760  
           05  WS-ACAT-DTL-RECS         PIC 9(7)   COMP-3  VALUE ZERO.  CAT760  
           05  WS-ACAT-ACPT-RECS        PIC 9(7)   COMP-3  VALUE ZERO.  CAT760  
           05  WS-ACAT-DLVR-RECS        PIC 9(7)     COMP-3 VALUE ZERO. CAT760  
           05  WS-ACAT-ACCT-CASH-SMA    PIC S9(9)V99 COMP-3 VALUE ZERO. CAT760  
           05  WS-ACAT-ACCT-CASH-TY01   PIC S9(9)V99 COMP-3 VALUE ZERO. CAT760  
           05  WS-ACAT-ACCT-CASH-TY02   PIC S9(9)V99 COMP-3 VALUE ZERO. CAT760  
           05  WS-ACAT-ACCT-CASH-TY05   PIC S9(9)V99 COMP-3 VALUE ZERO. CAT760  
           05  WS-ACAT-ACCT-CASH        PIC S9(9)V99 COMP-3 VALUE ZERO. CAT760  
           05  WS-ACAT-ACCT-EQUITY-TY01 PIC S9(9)V99 COMP-3 VALUE ZERO. CAT760  
           05  WS-ACAT-ACCT-EQUITY-TY02 PIC S9(9)V99 COMP-3 VALUE ZERO. CAT760  
           05  WS-ACAT-ACCT-EQUITY-TY05 PIC S9(9)V99 COMP-3 VALUE ZERO. CAT760  
           05  WS-ACAT-ACCT-EQUITY      PIC S9(9)V99 COMP-3 VALUE ZERO. CAT760  
           05  WS-ACAT-ACCT-NET-BAL     PIC S9(9)V99 COMP-3 VALUE ZERO. CAT760  
           05  WS-ACAT-ACCT-TOT-EQUITY  PIC S9(9)V99 COMP-3 VALUE ZERO. CAT760  
       01  WORK-AREA.                                                   CAT760  
           05  WS-ACAT-ASSET-VALUE       PIC  S9(14)V9999 COMP-3.       CAT760  
           05  WS-COMMA-PTR              PIC  9(002) VALUE 0.           CAT760  
           05  WS-QTY-PTR                PIC  9(002) VALUE 0.           CAT760  
           05  WS-INT-PTR                PIC  9(002) VALUE 0.           CAT760  
           05  WS-DEC-PTR                PIC  9(002) VALUE 0.           CAT760  
           05  WS-COMMA-FND-SW           PIC  X(001) VALUE ' '.         CAT760  
                                                                        CAT760  
           05  WS-QTY-X.                                                CAT760  
               07  WS-QTY-BYTE           PIC X OCCURS 17 TIMES.         CAT760  
           05  WS-QTY REDEFINES WS-QTY-X PIC 9(17).                     CAT760  
                                                                        CAT760  
           05  WS-QTY-N                  PIC 9(13)V9(4).                CAT760  
           05  FILLER REDEFINES WS-QTY-N.                               CAT760  
               07  WS-QTY-INT            PIC 9(13).                     CAT760  
               07  WS-QTY-DEC            PIC 9(04).                     CAT760  
                                                                        CAT760  
           05  WS-INT                    PIC 9(17).                     CAT760  
           05  WS-INT-X REDEFINES WS-INT.                               CAT760  
               07  WS-INT-BYTE           PIC X OCCURS 17 TIMES.         CAT760  
                                                                        CAT760  
           05  WS-DEC                    PIC 9(04).                     CAT760  
           05  WS-DEC-X REDEFINES WS-DEC.                               CAT760  
               07  WS-DEC-BYTE           PIC X OCCURS  4 TIMES.         CAT760  
           05  WS-CLIENT-NBR             PIC 9(03).                     CAT760  
           EJECT                                                        CAT760  
           EJECT                                                        CAT760  
           COPY STUBCPY.                                                CAT760  
           EJECT                                                        CAT760  
           COPY BPDATESC.                                               CAT760  
           EJECT                                                        CAT760  
           COPY BHINFO.                                                 CAT760  
           EJECT                                                        CAT760  
           COPY BHICS.                                                  CAT760  
           EJECT                                                        CAT760  
           EJECT                                                        CAT760  
           COPY BHBTS2.                                                 CAT760  
           EJECT                                                        CAT760  
           COPY BHATB.                                                  CAT760  
           EJECT                                                        CAT760  
       01  HDR1.                                                        CAT760  
           05  FILLER                  PIC X       VALUE SPACES.        CAT760  
           05  FILLER                  PIC X(10)   VALUE ' CAT760 - '.  CAT760  
           05  H1-CLIENT               PIC X(3).                        CAT760  
           05  FILLER                  PIC X      VALUE ' '.            CAT760  
           05  H1-CLIENT-NAME          PIC X(30).                       CAT760  
           05  FILLER                  PIC X(2)   VALUE SPACES.         CAT760  
           05  FILLER                  PIC X(75)  VALUE                 CAT760  
               'AUTOMATED CUSTOMER ACCOUNT TRANSFER SYSTEM'.            CAT760  
           05  FILLER                  PIC X(5)   VALUE 'PAGE '.        CAT760  
           05  H1-PGENO                PIC ZZ9.                         CAT760  
                                                                        CAT760  
       01  HDR2.                                                        CAT760  
           05  FILLER                  PIC X(49) VALUE SPACES.          CAT760  
C03575*    05  FILLER                  PIC X(68) VALUE                  CAT760  
C03575*        'ACATS SETTLEMENT VALUATION REPORT '.                    CAT760  
C03575     05  FILLER                  PIC X(68) VALUE                  CAT760  
C03575         '      ACATS VALUATION REPORT '.                         CAT760  
           05  FILLER                  PIC X(5)  VALUE 'DATE '.         CAT760  
           05  H2-PROC-DATE.                                            CAT760  
               10  H2-MM               PIC X(2).                        CAT760  
               10  FILLER              PIC X     VALUE '/'.             CAT760  
               10  H2-DD               PIC X(2).                        CAT760  
               10  FILLER              PIC X     VALUE '/'.             CAT760  
               10  H2-YY               PIC X(2).                        CAT760  
                                                                        CAT760  
       01  HDR3.                                                        CAT760  
           05  FILLER                  PIC X(57)  VALUE SPACES.         CAT760  
           05  FILLER                  PIC X(60)  VALUE                 CAT760  
               'TRANSMISSION OUTPUT '.                                  CAT760  
       01  HDR4.                                                        CAT760  
           05  FILLER                  PIC X(31)  VALUE                 CAT760  
               '  REPORT: RECEIVE      STATUS: '.                       CAT760  
           05  H4-STATUS               PIC X(14).                       CAT760  
           05  FILLER                  PIC X(15)  VALUE                 CAT760  
               'ACCOUNT TYPE: '.                                        CAT760  
           05  H4-ACCT-TYPE            PIC X(45).                       CAT760  
                                                                        CAT760  
       01  HDR5.                                                        CAT760  
           05  FILLER                  PIC X(14)  VALUE                 CAT760  
               '  ACCOUNT NO. '.                                        CAT760  
           05  H5-BRANCH               PIC X(3).                        CAT760  
           05  FILLER                  PIC X      VALUE '-'.            CAT760  
           05  H5-ACCOUNT              PIC X(5).                        CAT760  
           05  FILLER                  PIC X(30)  VALUE                 CAT760  
               '    CONTRA BROKER ACCOUNT NO. '.                        CAT760  
           05  H5-CONTRA-BKR-ACCT      PIC X(15).                       CAT760  
           05  FILLER                  PIC X(3)   VALUE SPACES.         CAT760  
           05  FILLER                  PIC X(15)  VALUE                 CAT760  
               'CONTRA BKR NO. '.                                       CAT760  
           05  H5-CONTRA-BKR           PIC X(4).                        CAT760  
           05  FILLER                  PIC X(3)   VALUE SPACES.         CAT760  
           05  FILLER                  PIC X(17)  VALUE                 CAT760  
               'NSCC CONTROL NO. '.                                     CAT760  
           05  H5-NSCC-CNTL            PIC X(14).                       CAT760  
                                                                        CAT760  
       01  HDR6.                                                        CAT760  
           05  FILLER                  PIC X(14) VALUE '  CONTROLLER '. CAT760  
           05  H6-CONTROLLER           PIC X(3).                        CAT760  
                                                                        CAT760  
       01  HDR6C.                                                       CAT760  
           05  FILLER                  PIC X(100)  VALUE '  (CONT.) '.  CAT760  
                                                                        CAT760  
       01  HDR7.                                                        CAT760  
           05  FILLER                  PIC X(17)  VALUE                 CAT760  
               'ACCOUNT TITLE: '.                                       CAT760  
           05  H7-ACCT-TITLE           PIC X(30).                       CAT760  
           05  FILLER                  PIC X(18) VALUE SPACES.          CAT760  
           05  FILLER                  PIC X(4)  VALUE 'SMA '.          CAT760  
           05  H7-SMAT                 PIC Z,ZZZ,ZZZ,ZZZ,ZZ9.99.        CAT760  
           05  FILLER                  PIC X(13) VALUE                  CAT760  
               '   BALANCES: '.                                         CAT760  
           05  H7-BALANCE              PIC Z,ZZZ,ZZZ,ZZZ,ZZ9.99CR.      CAT760  
           05  FILLER                  PIC X(4)  VALUE ' TY '.          CAT760  
           05  H7-TYPE                 PIC X(2).                        CAT760  
                                                                        CAT760  
       01  HDR7A.                                                       CAT760  
           05  FILLER                  PIC X(17)  VALUE SPACES.         CAT760  
           05  H7A-ACCT-TITLE          PIC X(21).                       CAT760  
           05  FILLER                  PIC X(2)  VALUE SPACES.          CAT760  
           05  H7A-SS-TAX-ID           PIC X(9).                        CAT760  
           05  FILLER                  PIC X(53) VALUE SPACES.          CAT760  
           05  H7A-BALANCE             PIC Z,ZZZ,ZZZ,ZZZ,ZZ9.99CR.      CAT760  
           05  H7A-TY-LIT              PIC X(4)  VALUE ' TY '.          CAT760  
           05  H7A-TYPE                PIC X(2).                        CAT760  
                                                                        CAT760  
       01  HDR8.                                                        CAT760  
           05  FILLER                  PIC X(47) VALUE                  CAT760  
               '  QUANTITY        CUSIP NO.    '.                       CAT760  
           05  FILLER                  PIC X(48) VALUE                  CAT760  
               'SECURITY DESCRIPTION '.                                 CAT760  
           05  FILLER                  PIC X(35) VALUE                  CAT760  
               'VALUE   TY      MEMO/MESSAGE '.                         CAT760  
                                                                        CAT760  
           EJECT                                                        CAT760  
       01  DETAIL-LINE-1.                                               CAT760  
           05  FILLER                  PIC X     VALUE SPACES.          CAT760  
           05  DL1-QUANTITY            PIC X(15).                       CAT760  
           05  DL1-QTY-FRAC  REDEFINES DL1-QUANTITY                     CAT760  
                                       PIC Z,ZZZ,ZZ9.9999-.             CAT760  
           05  FILLER REDEFINES DL1-QUANTITY.                           CAT760  
               10  DL1-QTY-WHOLE       PIC Z,ZZZ,ZZ9-.                  CAT760  
               10  FILLER              PIC X(5).                        CAT760  
           05  FILLER                  PIC X(2)  VALUE SPACES.          CAT760  
           05  DL1-CUSIP               PIC X(9).                        CAT760  
           05  FILLER                  PIC X(2)  VALUE SPACES.          CAT760  
           05  DL1-SEC-DESCR           PIC X(50).                       CAT760  
           05  FILLER                  PIC X(1)  VALUE SPACES.          CAT760  
           05  DL1-ASSET-VALUE         PIC Z,ZZZ,ZZZ,ZZZ,ZZ9.99-.       CAT760  
           05  FILLER                  PIC X(2)  VALUE SPACES.          CAT760  
           05  DL1-TYPE                PIC X(2).                        CAT760  
           05  FILLER                  PIC X(3)  VALUE SPACES.          CAT760  
           05  DL1-WS-MEMO-MSG         PIC X(25).                       CAT760  
                                                                        CAT760  
       01  DETAIL-LINE-1A.                                              CAT760  
           05  FILLER                  PIC X(34) VALUE SPACES.          CAT760  
           05  DL1A-SEC-DESCR          PIC X(50).                       CAT760  
                                                                        CAT760  
       01  TOT-LINE.                                                    CAT760  
           05  FILLER                  PIC X(59)  VALUE SPACES.         CAT760  
           05  TL-MSG                  PIC X(21).                       CAT760  
           05  TL-VALUE                PIC Z,ZZZ,ZZZ,ZZZ,ZZ9.99-.       CAT760  
           05  TL-VALUE-X REDEFINES TL-VALUE                            CAT760  
                                       PIC X(21).                       CAT760  
           05  FILLER                  PIC X      VALUE SPACES.         CAT760  
           05  TL-AST                  PIC X(3)   VALUE SPACES.         CAT760  
                                                                        CAT760  
       01  NO-ACTV-LINE.                                                CAT760  
           05  FILLER                  PIC X(40)  VALUE SPACES.         CAT760  
           05  NAL-MSG                 PIC X(90).                       CAT760  
                                                                        CAT760  
       01  ASTERICK-LINE               PIC X(130) VALUE ALL '*'.        CAT760  
                                                                        CAT760  
       01  OPT-HDR1.                                                    CAT760  
           05  FILLER                  PIC X(46)  VALUE                 CAT760  
               '   QUANTITY     BUY/     SYMBOL     PUT/'.              CAT760  
           05  FILLER                  PIC X(50)  VALUE                 CAT760  
               'OPEN/      EXP Y    EXERCISE         OPTIONAL'.         CAT760  
       01  OPT-HDR2.                                                    CAT760  
           05  FILLER                  PIC X(16)  VALUE SPACES.         CAT760  
           05  FILLER                  PIC X(20)  VALUE 'SELL'.         CAT760  
           05  FILLER                  PIC X(50)  VALUE                 CAT760  
               'CALL      CLOSE      MTH R     PRICE'.                  CAT760  
           05  FILLER                  PIC X(4)   VALUE 'DATA'.         CAT760  
                                                                        CAT760  
       01  OPT-DETAIL.                                                  CAT760  
           05  FILLER                  PIC X(5)   VALUE SPACES.         CAT760  
           05  OPDTL-QTY               PIC 9(5).                        CAT760  
           05  FILLER                  PIC X(6)   VALUE SPACES.         CAT760  
           05  OPDTL-BUY-SELL          PIC X(4).                        CAT760  
           05  FILLER                  PIC X(6)   VALUE SPACES.         CAT760  
           05  OPDTL-SYMBOL            PIC X(6).                        CAT760  
           05  FILLER                  PIC X(5)   VALUE SPACES.         CAT760  
           05  OPDTL-PUT-CALL          PIC X(4).                        CAT760  
           05  FILLER                  PIC X(6)   VALUE SPACES.         CAT760  
           05  OPDTL-OPEN-CLOSE        PIC X(5).                        CAT760  
           05  FILLER                  PIC X(7)   VALUE SPACES.         CAT760  
           05  OPDTL-EXPIRE-MM         PIC XX.                          CAT760  
           05  FILLER                  PIC X      VALUE SPACES.         CAT760  
           05  OPDTL-EXPIRE-YY         PIC X.                           CAT760  
           05  FILLER                  PIC X(4)   VALUE SPACES.         CAT760  
           05  OPDTL-PRICE             PIC ZZ9.999.                     CAT760  
           05  FILLER                  PIC X(7)   VALUE SPACES.         CAT760  
           05  OPDTL-DATA              PIC X(15).                       CAT760  
                                                                        CAT760  
       01  DELETE-MSG-LINE1.                                            CAT760  
           05  FILLER                  PIC X(67) VALUE SPACES.          CAT760  
           05  FILLER                  PIC X(52) VALUE ALL '*'.         CAT760  
                                                                        CAT760  
       01  DELETE-MSG-LINE2.                                            CAT760  
           05  FILLER                  PIC X(67) VALUE SPACES.          CAT760  
           05  FILLER                  PIC X     VALUE '*'.             CAT760  
           05  FILLER                  PIC X(50) VALUE SPACES.          CAT760  
           05  FILLER                  PIC X     VALUE '*'.             CAT760  
                                                                        CAT760  
       01  DELETE-MSG-LINE3.                                            CAT760  
           05  FILLER                  PIC X(67) VALUE SPACES.          CAT760  
           05  FILLER                  PIC X(52) VALUE                  CAT760  
           '*  ONE OR MORE ASSET RECORDS DELETED FROM TRANSFER *'.      CAT760  
                                                                        CAT760  
       01  PRINTAREA.                                                   CAT760  
           05  PRINTSPACE.                                              CAT760  
               10  CC                  PIC X.                           CAT760  
               10  PRINT-AREA          PIC X(132).                      CAT760  
           05  TRACSPACE.                                               CAT760  
               10  TRAC-CLI            PIC 9(3) COMP-3.                 CAT760  
               10  TRAC-CNTL           PIC 9(3) COMP-3.                 CAT760  
               10  FILLER              PIC X(6) VALUE LOW-VALUES.       CAT760  
                                                                        CAT760  
       01  EQUITY-NUM.                                                  CAT760  
           05  EQ-PREFIX           PIC X(4)  VALUE SPACES.              CAT760  
           05  EQ-NUMX             PIC X(21).                           CAT760  
       01  FILLER REDEFINES EQUITY-NUM.                                 CAT760  
           05  EQ-CHAR OCCURS 25 TIMES PIC X.                           CAT760  
                                                                        CAT760  
       01  ACCOUNT-AREA.                                                CAT760  
           05  ACCOUNT-TYPES.                                           CAT760  
               10  FILLER          PIC X(17) VALUE 'SINGLE         SN'. CAT760  
               10  FILLER          PIC X(17) VALUE 'JOINT          JT'. CAT760  
               10  FILLER          PIC X(17) VALUE 'ROLLOVER       DR'. CAT760  
               10  FILLER          PIC X(17) VALUE 'IRA            IR'. CAT760  
               10  FILLER          PIC X(17) VALUE 'PROF PENSION   QP'. CAT760  
               10  FILLER          PIC X(17) VALUE 'OTHER          OT'. CAT760  
               10  FILLER          PIC X(17) VALUE 'ESTATE         ES'. CAT760  
               10  FILLER          PIC X(17) VALUE 'CUSTODIAN      CU'. CAT760  
               10  FILLER          PIC X(17) VALUE 'TRUST          TR'. CAT760  
               10  FILLER          PIC X(17) VALUE 'CORPORATE      CO'. CAT760  
           05  ACT-TYPE-GROUP REDEFINES ACCOUNT-TYPES.                  CAT760  
               10  ACT-TYPE-ARRAY OCCURS 10 TIMES INDEXED BY TYP-INDX.  CAT760  
                   15  ACT-TYPE-DESC    PIC X(15).                      CAT760  
                   15  ACT-TYPE         PIC X(02).                      CAT760  
                                                                        CAT760  
       01  WS-ACAT-DEL-HDR.                                             CAT760  
           05  FILLER                  PIC X(15) VALUE LOW-VALUES.      CAT760  
           05  FILLER                  PIC X(5)  VALUE 'DATE='.         CAT760  
           05  WS-ACAT-DEL-HDR-DTE     PIC X(8).                        CAT760  
           05  FILLER                  PIC X(52) VALUE LOW-VALUES.      CAT760  
                                                                        CAT760  
           EJECT                                                        CAT760  
       01  ADR-REC.                                                     CAT760  
           05  ADR-KEY.                                                 CAT760  
               10  ADR-CLIENT              PIC 9(3).                    CAT760  
               10  ADR-CONTROLLER          PIC 9(3).                    CAT760  
               10  ADR-BRANCH              PIC X(3).                    CAT760  
               10  ADR-ACCOUNT             PIC X(5).                    CAT760  
               10  ADR-CNTL-NO             PIC X(14).                   CAT760  
           05  ADR-CUSIP                   PIC X(9).                    CAT760  
           05  ADR-TRAN-TYPE               PIC X(2).                    CAT760  
           05  ADR-CLIENT-NAME             PIC X(30).                   CAT760  
           05  ADR-ACCT-TITLE              PIC X(51).                   CAT760  
           05  ADR-SECURITY-DESC           PIC X(50).                   CAT760  
           05  ADR-CONTRA-BKR              PIC X(4).                    CAT760  
           05  ADR-CONTRA-ACCT             PIC X(15).                   CAT760  
           05  ADR-ASSET-QTY               PIC S9(13)V9999.             CAT760  
           05  ADR-ASSET-SPLIT REDEFINES ADR-ASSET-QTY.                 CAT760  
               10  ADR-ASSET-QTY-WHOLE     PIC 9(13).                   CAT760  
               10  ADR-ASSET-QTY-FRAC      PIC SV9(4).                  CAT760  
               88  ADR-ASSET-QTY-WHOLE-NUM VALUE .0.                    CAT760  
           05  ADR-ASSET-VALUE             PIC S9(14)V9999.             CAT760  
           05  ADR-MEMO-IND                PIC X.                       CAT760  
           05  ADR-SS-TAX-ID               PIC X(9).                    CAT760  
           05  ADR-TYPE-ACCOUNT            PIC X(02).                   CAT760  
           05  ADR-CURRENT-STATUS          PIC 9(03).                   CAT760  
           05  ADR-SETTLMENT-IND           PIC X(02).                   CAT760  
               88  ADR-CNS                   VALUE '05'.                CAT760  
               88  ADR-FUNDADR-SERV          VALUE '10'.                CAT760  
               88  ADR-PTC                   VALUE '15'.                CAT760  
               88  ADR-GSCC                  VALUE '20'.                CAT760  
               88  ADR-DTC                   VALUE '25'.                CAT760  
               88  ADR-UNDELIVERABLE         VALUE '30'.                CAT760  
               88  ADR-OCC                   VALUE '35'.                CAT760  
               88  ADR-CASH                  VALUE '40'.                CAT760  
               88  ADR-MEMO                  VALUE '45'.                CAT760  
               88  ADR-R-D                   VALUE '50'.                CAT760  
           05  ADR-SETTLMENT-RSN-CD        PIC X(04).                   CAT760  
               88  ADR-CREDIT                   VALUE 'CRED'.           CAT760  
               88  ADR-DEBIT                    VALUE 'DEB '.           CAT760  
               88  ADR-SMA                      VALUE 'SMA '.           CAT760  
               88  ADR-SAFE-KEEPING             VALUE 'SFK '.           CAT760  
               88  ADR-OPTION                   VALUE 'OPT '.           CAT760  
               88  ADR-EXPIRING-OPTION          VALUE 'EXPO'.           CAT760  
               88  ADR-RESTRICTED-SECURITY      VALUE 'RSEC'.           CAT760  
               88  ADR-UNDERLYING-SECURITY      VALUE 'USEC'.           CAT760  
               88  ADR-UNDERLYING-CASH-BAL      VALUE 'CASH'.           CAT760  
               88  ADR-COMMENT                  VALUE 'COMT'.           CAT760  
               88  ADR-NON-CNS                  VALUE 'NSET'.           CAT760  
               88  ADR-FOREIGN-CURR             VALUE 'FCUR'.           CAT760  
               88  ADR-DELAYED-DELIVERY         VALUE 'DDEL'.           CAT760  
               88  ADR-SYSTEM-X-CNS             VALUE 'XSET'.           CAT760  
               88  ADR-IPO                      VALUE 'IPO'.            CAT760  
           05  ADR-OPTION-DATA.                                         CAT760  
               10  ADR-OPTION-IND          PIC X.                       CAT760  
               10  ADR-OPT-QTY             PIC 9(13)V9999.              CAT760  
               10  ADR-OPT-BUY-SELL        PIC X.                       CAT760  
               10  ADR-OPT-PUT-CALL        PIC X.                       CAT760  
               10  ADR-OPT-OPEN-CLOSE      PIC X.                       CAT760  
               10  ADR-OPT-SYMBOL          PIC X(6).                    CAT760  
               10  ADR-OPT-EXPIRE-DTE.                                  CAT760  
                   15  ADR-OPT-EXPIRE-MM   PIC X(2).                    CAT760  
                   15  ADR-OPT-EXPIRE-YY   PIC X.                       CAT760  
               10  ADR-OPT-PRICE           PIC 9(3).                    CAT760  
               10  ADR-OPT-1-8TH-PRICE     PIC 9.                       CAT760  
               10  ADR-OPT-OPTION-DATA     PIC X(15).                   CAT760  
           05  ADR-MEMO-DESC               PIC X(120).                  CAT760  
           05  ADR-SHORT-IND               PIC X.                       CAT760  
           05  ADR-DELETE-IND              PIC X.                       CAT760  
           05  FILLER                      PIC X(7).                    CAT760  
                                                                        CAT760  
       01  SAVE-REC.                                                    CAT760  
           05  SAVE-KEY.                                                CAT760  
               10  SAVE-CLIENT             PIC 9(3).                    CAT760  
               10  SAVE-CONTROLLER         PIC 9(3).                    CAT760  
               10  SAVE-BRANCH             PIC X(3).                    CAT760  
               10  SAVE-ACCOUNT            PIC X(5).                    CAT760  
               10  SAVE-CNTL-NO            PIC X(14).                   CAT760  
           05  SAVE-CUSIP                  PIC X(9).                    CAT760  
           05  SAVE-TRAN-TYPE              PIC X(2).                    CAT760  
           05  SAVE-CLIENT-NAME            PIC X(30).                   CAT760  
           05  SAVE-ACCT-TITLE             PIC X(51).                   CAT760  
           05  SAVE-SECURITY-DESC          PIC X(50).                   CAT760  
           05  SAVE-CONTRA-BKR             PIC X(4).                    CAT760  
           05  SAVE-CONTRA-ACCT            PIC X(15).                   CAT760  
           05  SAVE-ASSET-QTY              PIC S9(13)V9999.             CAT760  
           05  SAVE-ASSET-SPLIT REDEFINES SAVE-ASSET-QTY.               CAT760  
               10  SAVE-ASSET-QTY-WHOLE    PIC 9(13).                   CAT760  
               10  SAVE-ASSET-QTY-FRAC     PIC SV9(4).                  CAT760  
               88  SAVE-ASSET-QTY-WHOLE-NUM VALUE .0.                   CAT760  
           05  SAVE-ASSET-VALUE            PIC S9(14)V9999.             CAT760  
           05  SAVE-MEMO-IND               PIC X.                       CAT760  
           05  SAVE-SS-TAX-ID              PIC X(9).                    CAT760  
           05  SAVE-TYPE-ACCOUNT           PIC X(02).                   CAT760  
           05  SAVE-CURRENT-STATUS         PIC 9(03).                   CAT760  
           05  SAVE-SETTLMENT-IND          PIC X(02).                   CAT760  
           05  SAVE-SETTLMENT-RSN-CD       PIC X(04).                   CAT760  
           05  SAVE-OPTION-DATA.                                        CAT760  
               10  SAVE-OPTION-IND         PIC X.                       CAT760  
               10  SAVE-OPT-QTY            PIC 9(13)V9999.              CAT760  
               10  SAVE-OPT-BUY-SELL       PIC X.                       CAT760  
               10  SAVE-OPT-PUT-CALL       PIC X.                       CAT760  
               10  SAVE-OPT-OPEN-CLOSE     PIC X.                       CAT760  
               10  SAVE-OPT-SYMBOL         PIC X(6).                    CAT760  
               10  SAVE-OPT-EXPIRE-DTE.                                 CAT760  
                   15  SAVE-OPT-EXPIRE-MM  PIC X(2).                    CAT760  
                   15  SAVE-OPT-EXPIRE-YY  PIC X.                       CAT760  
               10  SAVE-OPT-PRICE          PIC 9(3).                    CAT760  
               10  SAVE-OPT-1-8TH-PRICE    PIC 9.                       CAT760  
               10  SAVE-OPT-OPTION-DATA    PIC X(15).                   CAT760  
           05  SAVE-MEMO-DESC              PIC X(120).                  CAT760  
           05  SAVE-SHORT-IND              PIC X.                       CAT760  
           05  SAVE-DELETE-IND             PIC X.                       CAT760  
           05  FILLER                      PIC X(7).                    CAT760  
                                                                        CAT760  
C00514 01  WS-BRANCH PIC 999 VALUE ZERO.                                CAT760  
                                                                        CAT760  
       01  PROC-DATE.                                                   CAT760  
           05  PD-CC                   PIC X(2).                        CAT760  
           05  PD-YY                   PIC X(2).                        CAT760  
           05  PD-MM                   PIC X(2).                        CAT760  
           05  PD-DD                   PIC X(2).                        CAT760  
                                                                        CAT760  
       01  BR-ACCT-TEST-AREA.                                           CAT760  
           05  BR-ACCT-IN              PIC X(15).                       CAT760  
           05  FILLER REDEFINES BR-ACCT-IN.                             CAT760  
               10  B-CHAR OCCURS 15 TIMES                               CAT760  
                                       PIC X.                           CAT760  
           05  BR-ACCT-CNV             PIC X(8).                        CAT760  
           05  FILLER REDEFINES BR-ACCT-CNV.                            CAT760  
               10  C-CHAR OCCURS 8 TIMES                                CAT760  
                                       PIC X.                           CAT760  
       01  ACAT-OPTION-AREA.                                            CAT760  
           05  ACT-OPTION-DATA    OCCURS 4000 TIMES.                    CAT760  
               10  ACT-OPTION-IND          PIC X.                       CAT760  
               10  ACT-OPT-QTY             PIC 9(13)V9999.              CAT760  
               10  ACT-OPT-BUY-SELL        PIC X.                       CAT760  
               10  ACT-OPT-PUT-CALL        PIC X.                       CAT760  
               10  ACT-OPT-OPEN-CLOSE      PIC X.                       CAT760  
               10  ACT-OPT-SYMBOL          PIC X(6).                    CAT760  
               10  ACT-OPT-EXPIRE-DTE.                                  CAT760  
                   15  ACT-OPT-EXPIRE-MM   PIC X(2).                    CAT760  
                   15  ACT-OPT-EXPIRE-YY   PIC X.                       CAT760  
               10  ACT-OPT-PRICE           PIC 9(3).                    CAT760  
               10  ACT-OPT-1-8TH-PRICE     PIC 9.                       CAT760  
               10  ACT-OPT-OPTION-DATA     PIC X(15).                   CAT760  
           05  ACT-OPTION-CTR              PIC 9(3) COMP-3 VALUE ZERO.  CAT760  
       01  ACAT-MEMO-AREA.                                              CAT760  
           05  ACT-MEMO-DATA    OCCURS 200 TIMES.                       CAT760  
               10  ACT-MEMO-DESC           PIC X(120).                  CAT760  
           05  ACT-MEMO-CTR                PIC 9(3) COMP-3 VALUE ZERO.  CAT760  
       01  FRAC-TO-DEC-AREA.                                            CAT760  
           05  FTD-TABLE.                                               CAT760  
               10  FILLER                  PIC V999 VALUE 0.125.        CAT760  
               10  FILLER                  PIC V999 VALUE 0.250.        CAT760  
               10  FILLER                  PIC V999 VALUE 0.375.        CAT760  
               10  FILLER                  PIC V999 VALUE 0.500.        CAT760  
               10  FILLER                  PIC V999 VALUE 0.625.        CAT760  
               10  FILLER                  PIC V999 VALUE 0.750.        CAT760  
               10  FILLER                  PIC V999 VALUE 0.875.        CAT760  
           05  FILLER REDEFINES FTD-TABLE.                              CAT760  
               10  FTD-VALUES OCCURS 7 TIMES PIC V999.                  CAT760  
           05  FTD-NUM                     PIC 9(3)V999.                CAT760  
           EJECT                                                        CAT760  
       01  B1-TABLE-AREA.                                               CAT760  
           03  B1-TABLE OCCURS 500 TIMES.                               CAT760  
               05  B1-ADP-CL-NO             PIC 9(03).                  CAT760  
               05  B1-BKR-CLR-NO            PIC X(04).                  CAT760  
               05  B1-CL-HIT                PIC X(01).                  CAT760  
               05  B1-CLI-NAME              PIC X(30).                  CAT760  
               05  B1-ASSET-VAL-IND         PIC X.                      CAT760  
               05  B1-RCD-CNT               PIC S9(9)  COMP-3.          CAT760  
               05  B1-CNTL-RANGE-NO         PIC 9(03)  COMP-3.          CAT760  
               05  B1-CNTL-TABLE.                                       CAT760  
                   07  B1-CNTL-RANGE-ENTRS  OCCURS 100 TIMES.           CAT760  
                       09  B1-CNTL-CODE     PIC 9(3).                   CAT760  
                       09  B1-CNTL-BR-LOW   PIC X(03).                  CAT760  
                       09  B1-CNTL-BR-HIGH  PIC X(03).                  CAT760  
                       09  B1-CNTL-HIT      PIC X(01).                  CAT760  
                                                                        CAT760  
       01  B1-WORK-TABLE-AREA.                                          CAT760  
           03  B1-WRK-TABLE.                                            CAT760  
               05  B1-WRK-ADP-CL-NO             PIC 9(03).              CAT760  
               05  B1-WRK-BKR-CLR-NO            PIC X(04).              CAT760  
               05  B1-WRK-CL-HIT                PIC X.                  CAT760  
               05  B1-WRK-NAME                  PIC X(30).              CAT760  
               05  B1-WRK-ASSET-VAL-IND         PIC X.                  CAT760  
               05  B1-WRK-RCD-CNT               PIC S9(9)  COMP-3.      CAT760  
               05  B1-WRK-CNTL-RANGE-NO         PIC 9(03)  COMP-3.      CAT760  
               05  B1-WRK-CNTL-TABLE.                                   CAT760  
                   07  B1-WRK-CNTL-RANGE-ENTRS  OCCURS 100 TIMES.       CAT760  
                       09  B1-WRK-CNTL-CODE     PIC 9(3).               CAT760  
                       09  B1-WRK-CNTL-BR-LOW   PIC X(03).              CAT760  
                       09  B1-WRK-CNTL-BR-HIGH  PIC X(03).              CAT760  
                       09  B1-WRK-CNTL-HIT      PIC X.                  CAT760  
                                                                        CAT760  
           EJECT                                                        CAT760  
       01  FILLER.                                                      CAT760  
       COPY GETXFCOB.                                                   CAT760  
           EJECT                                                        CAT760  
       01  DSNTIAR                       PIC X(008) VALUE 'DSNTIAR'.    CAT760  
       01  FILLER                        PIC X(008) VALUE 'SQLCA   '.   CAT760  
           EXEC SQL INCLUDE SQLCA        END-EXEC.                      CAT760  
       01  FILLER                        PIC X(008) VALUE 'VTRNFR'.     CAT760  
           EXEC SQL INCLUDE VTRNFR END-EXEC.                            CAT760  
       01  FILLER                        PIC X(008) VALUE 'VASSET'.     CAT760  
           EXEC SQL INCLUDE VASSET END-EXEC.                            CAT760  
       01  FILLER                        PIC X(008) VALUE 'VOPTN'.      CAT760  
           EXEC SQL INCLUDE VOPTN END-EXEC.                             CAT760  
       01  FILLER                        PIC X(008) VALUE 'VTRNCS'.     CAT760  
           EXEC SQL                                                     CAT760  
                DECLARE VTRNCS CURSOR WITH HOLD FOR                     CAT760  
                SELECT                                                  CAT760  
                    T.CLIENT_NBR                                        CAT760  
                   ,T.ACAT_CONTROL_NBR                                  CAT760  
                   ,T.DLVR_NBR                                          CAT760  
                   ,T.ACCT_DLVR_NBR                                     CAT760  
                   ,T.RCV_NBR                                           CAT760  
                   ,T.ACCT_RCV_NBR                                      CAT760  
                   ,T.RCV_CUST_NM                                       CAT760  
                   ,T.RCV_SS_PRIM_NBR                                   CAT760  
                   ,T.RCV_ACCT_TYPE_CD                                  CAT760  
                   ,T.ACAT_CNTL_ASTD_NBR                                CAT760  
                   ,T.CMNT_TXT                                          CAT760  
                   ,T.STTS_CD                                           CAT760  
                FROM VTRNFR T                                           CAT760  
                WHERE T.DSTBN_SIDE_CD = 'R'                             CAT760  
                  AND T.STTS_CD IN ('200','210','220')                  CAT760  
                ORDER BY CLIENT_NBR                                     CAT760  
                        ,ACAT_CONTROL_NBR                               CAT760  
                FOR FETCH ONLY                                          CAT760  
           END-EXEC.                                                    CAT760  
       01  FILLER                        PIC X(008) VALUE 'VASTCS'.     CAT760  
           EXEC SQL                                                     CAT760  
                DECLARE VASTCS CURSOR WITH HOLD FOR                     CAT760  
                SELECT                                                  CAT760  
                    A.ASSET_SEQ_NBR                                     CAT760  
                   ,A.CONTROL_NBR_STS_CD                                CAT760  
                   ,A.STTLM_LCTN_CD                                     CAT760  
                   ,A.STTLM_RSN_CD                                      CAT760  
                   ,A.ISIN_SEC_ISSUE_CD                                 CAT760  
                   ,A.ASSET_DESC_TXT                                    CAT760  
                   ,A.ASSET_QTY                                         CAT760  
                   ,A.ASSET_AMT                                         CAT760  
                   ,A.CSH_MGN_SHRT_CD                                   CAT760  
                   ,A.OPTN_CTGY_CD                                      CAT760  
DJ0001             ,A.PSTN_CD                                           CAT760  
                FROM VASSET A                                           CAT760  
                WHERE CLIENT_NBR          = :DCLVTRNFR.CLIENT-NBR       CAT760  
                  AND ACAT_CONTROL_NBR    = :DCLVTRNFR.ACAT-CONTROL-NBR CAT760  
                  FOR FETCH ONLY                                        CAT760  
           END-EXEC.                                                    CAT760  
       01  WS-DB2-MESSAGE-AREA.                                         CAT760  
           05  WS-DB2-MSG-LEN            PIC S9(04) COMP VALUE +960.    CAT760  
           05  WS-DB2-ERROR-MSG          PIC X(080) OCCURS 12 TIMES     CAT760  
                   INDEXED BY WS-DB2-IDX.                               CAT760  
       01  WS-DB2-MESSAGE-LEN            PIC S9(09) COMP VALUE +80.     CAT760  
                                                                        CAT760  
       01  WS-DB2-WORKAREA.                                             CAT760  
           05  ROLLBACK-SQLCA            PIC  X(122).                   CAT760  
           05  ROLLBACK-RETURN           PIC S9(009) COMP.              CAT760  
               88  ROLLBACK-OK                VALUE +0.                 CAT760  
               88  ROLLBACK-AB                VALUE -999 THRU -1        CAT760  
                                                    +1   THRU +999.     CAT760  
           05  COMMIT-SQLCA              PIC  X(122).                   CAT760  
           05  COMMIT-RETURN             PIC S9(009) COMP.              CAT760  
               88  COMMIT-OK                  VALUE +0.                 CAT760  
               88  COMMIT-AB                  VALUE -999 THRU -1        CAT760  
                                                    +1   THRU +999.     CAT760  
           05  WS-COMMIT-CTR             PIC  9(009) COMP-3             CAT760  
                                              VALUE 0.                  CAT760  
           05  WS-LAST-COMMIT-INFILE-CNT PIC  9(009) VALUE 0.           CAT760  
           05  WS-DB2-TABLE-NAME         PIC  X(008).                   CAT760  
           05  WS-DB2-ACTION             PIC  X(008).                   CAT760  
           05  WS-DB2-SQLCODE            PIC  ---9.                     CAT760  
                                                                        CAT760  
       01  FILLER                        PIC  X(008) VALUE 'TIMESTMP'.  CAT760  
       01  WS-CURRENT-TIMESTAMP          PIC  X(026).                   CAT760  
       01  FILLER                        PIC X(008) VALUE 'END-O-WS'.   CAT760  
           EJECT                                                        CAT760  
      ***************************************************************** CAT760  
       LINKAGE SECTION.                                                 CAT760  
      ***************************************************************** CAT760  
       01  PARM-AREA.                                                   CAT760  
           05  PARM-LENGTH                  PIC S9(4) COMP SYNC.        CAT760  
C03575         88  PARM-LENGTH-VALID                    VALUE +2.       CAT760  
           05  PARM-INFO.                                               CAT760  
               10  PARM-STREAM              PIC X.                      CAT760  
                   88  PARM-STREAM-VALID                VALUES ARE      CAT760  
                       'A' THRU 'Z' '0' THRU '9'.                       CAT760  
               10  PARM-ABEND               PIC X.                      CAT760  
                   88  NO-ABEND                         VALUE 'N'.      CAT760  
                   88  YES-ABEND                        VALUE 'Y'.      CAT760  
                                                                        CAT760  
           EJECT                                                        CAT760  
       PROCEDURE DIVISION USING PARM-AREA.                              CAT760  
       MAINLINE SECTION.                                                CAT760  
           COPY MSGCOBO.                                                CAT760  
                                                                        CAT760  
           CALL  SPIEEXIT                     USING DCLVTRNFR           CAT760  
                                                    SPIE-KEY            CAT760  
                                                    SPIE-GRP            CAT760  
           END-CALL.                                                    CAT760  
                                                                        CAT760  
           DISPLAY ' '.                                                 CAT760  
           DISPLAY '*** ' PGM-NAME ' BEGINNING INITIAL ROUTINE ***'.    CAT760  
                                                                        CAT760  
           PERFORM  100-HOUSEKEEPING THRU                               CAT760  
                    100-HOUSEKEEPING-EXIT.                              CAT760  
                                                                        CAT760  
           PERFORM  200-INIT-B1-LOOP THRU                               CAT760  
                    200-INIT-B1-LOOP-EXIT.                              CAT760  
                                                                        CAT760  
           IF B1-TBL-CNT = ZERO                                         CAT760  
             GO TO 0005-ENDJOB.                                         CAT760  
                                                                        CAT760  
               SORT  SORT-FILE                                          CAT760  
                     ASCENDING KEY  SORT-CLIENT                         CAT760  
                                    SORT-CONTROLLER                     CAT760  
                                    SORT-BRANCH                         CAT760  
                                    SORT-ACCOUNT                        CAT760  
                                    SORT-CNTL-NO                        CAT760  
                                    SORT-CUSIP                          CAT760  
                                    SORT-TRAN-TYPE                      CAT760  
                     INPUT PROCEDURE  300-SORTIN-ROUTINE THRU           CAT760  
                                      300-SORTIN-ROUTINE-EXIT           CAT760  
                    OUTPUT PROCEDURE  600-SORTOUT-ROUTINE THRU          CAT760  
                                      600-SORTOUT-ROUTINE-EXIT.         CAT760  
                                                                        CAT760  
               IF  SORT-RETURN  NOT =  ZERO                             CAT760  
                   DISPLAY  'INTERNAL SORT FAILED, SORT RC = '          CAT760  
                             SORT-RETURN                                CAT760  
                   CALL  ABEND            USING ABEND-CODE-8000         CAT760  
               END-IF.                                                  CAT760  
                                                                        CAT760  
       0005-ENDJOB.                                                     CAT760  
           PERFORM  900-ENDJOB-ROUTINE                                  CAT760  
              THRU  900-ENDJOB-ROUTINE-EXIT.                            CAT760  
                                                                        CAT760  
           MOVE ZERO   TO   RETURN-CODE.                                CAT760  
                                                                        CAT760  
           GOBACK.                                                      CAT760  
                                                                        CAT760  
           EJECT                                                        CAT760  
      ******************                                                CAT760  
       100-HOUSEKEEPING.                                                CAT760  
      ******************                                                CAT760  
                                                                        CAT760  
           IF PARM-LENGTH-VALID                                         CAT760  
             CONTINUE                                                   CAT760  
           ELSE                                                         CAT760  
             DISPLAY 'PARM LENGTH IS INVALID, LENGTH MUST BE 3 CHAR '   CAT760  
             DISPLAY 'PARM ENTERED - ' PARM-INFO                        CAT760  
             DISPLAY 'PROGRAM CAT760 ABENDED '                          CAT760  
             CALL ABEND          USING ABEND-CODE-2000.                 CAT760  
                                                                        CAT760  
           IF PARM-STREAM-VALID                                         CAT760  
             CONTINUE                                                   CAT760  
           ELSE                                                         CAT760  
             DISPLAY 'PARM INVALID, MUST BE 1 CHAR ALPHANUMERIC'        CAT760  
             DISPLAY 'PARM ENTERED - ' PARM-INFO                        CAT760  
             DISPLAY 'PROGRAM CAT760 ABENDED '                          CAT760  
             CALL ABEND          USING ABEND-CODE-2000.                 CAT760  
                                                                        CAT760  
           IF PARM-ABEND = 'N' OR 'Y'                                   CAT760  
             CONTINUE                                                   CAT760  
           ELSE                                                         CAT760  
             DISPLAY 'PARM-ABEND INVALID MUST BE 1 CHAR N OR Y'         CAT760  
             DISPLAY 'PARM ENTERED - ' PARM-INFO                        CAT760  
             DISPLAY 'PROGRAM CAT760 ABENDED '                          CAT760  
             CALL ABEND          USING ABEND-CODE-2000.                 CAT760  
                                                                        CAT760  
                                                                        CAT760  
           MOVE  PGM-NAME                TO BPDATES-CALLING-PGM.        CAT760  
           MOVE  'C'                     TO BPDATES-REQ-TYPE.           CAT760  
           CALL  BPDATES              USING BPDATES-PARAMETERS.         CAT760  
                                                                        CAT760  
           MOVE  BPD-PROC-DATE           TO  PROC-DATE.                 CAT760  
           MOVE  PD-MM                   TO  H2-MM.                     CAT760  
           MOVE  PD-DD                   TO  H2-DD.                     CAT760  
           MOVE  PD-YY                   TO  H2-YY.                     CAT760  
           MOVE  BPD-PROC-DATE           TO  WS-ACAT-DEL-HDR-DTE.       CAT760  
                                                                        CAT760  
           DISPLAY 'PROCESS DATE = ' BPD-PROC-DATE.                     CAT760  
                                                                        CAT760  
           OPEN OUTPUT REPORT-FILE.                                     CAT760  
                                                                        CAT760  
           INITIALIZE B1-TABLE-AREA.                                    CAT760  
                                                                        CAT760  
           MOVE ' OPTION INFORMATION '   TO  ASTERICK-LINE (35:20).     CAT760  
           EXEC SQL OPEN VTRNCS                                         CAT760  
           END-EXEC.                                                    CAT760  
           IF  SQLCODE = 0                                              CAT760  
               CONTINUE                                                 CAT760  
           ELSE                                                         CAT760  
               PERFORM 800-SQL-ERROR THRU 800-EXIT                      CAT760  
               CALL ABEND             USING ABEND-CODE-8000             CAT760  
           END-IF.                                                      CAT760  
                                                                        CAT760  
       100-HOUSEKEEPING-EXIT. EXIT.                                     CAT760  
           EJECT                                                        CAT760  
      ***************                                                   CAT760  
       200-INIT-B1-LOOP.                                                CAT760  
      ***************                                                   CAT760  
                                                                        CAT760  
           DISPLAY ' '.                                                 CAT760  
           DISPLAY  'B1 TABLE VALUES'.                                  CAT760  
           MOVE 0                      TO  B1-TBL-CNT.                  CAT760  
           ADD  1                      TO  B1-SUB.                      CAT760  
           PERFORM  UNTIL  B1-SUB  >  500                               CAT760  
                                                                        CAT760  
             MOVE  ' '                    TO  BH-BROKER-HEADER-INFO     CAT760  
             MOVE  B1-SUB                 TO  BH-BROKER-NUMBER-N        CAT760  
             MOVE  '010'                  TO  BH-LOGICAL-RECORD-CODE    CAT760  
             MOVE  ' '                    TO  BH-B2-INFO-ID             CAT760  
             CALL  GETB1V               USING BH-BROKER-HEADER-INFO     CAT760  
             END-CALL                                                   CAT760  
                                                                        CAT760  
             IF  BH-BROKER-ACTIVE                                       CAT760  
                                                                        CAT760  
                                                                        CAT760  
               IF  PARM-STREAM  =  BH-BROKER-MINI-MAXI-INDICATOR        CAT760  
                   MOVE  ' '                 TO  BH-ICS-INFO            CAT760  
                   MOVE  B1-SUB              TO  BH-BROKER-NUMBER-N     CAT760  
                   MOVE  '015'               TO  BH-LOGICAL-RECORD-CODE CAT760  
                   MOVE  '501000'            TO  BH-B2-INFO-ID          CAT760  
                   CALL  GETB1V            USING BH-BROKER-HEADER-INFO, CAT760  
                                                 BH-ICS-INFO            CAT760  
                   END-CALL                                             CAT760  
                                                                        CAT760  
                   MOVE  ' '                 TO  BH-BTS2-INFO           CAT760  
                   MOVE  B1-SUB              TO  BH-BROKER-NUMBER-N     CAT760  
                   MOVE  '015'               TO  BH-LOGICAL-RECORD-CODE CAT760  
                   MOVE  '511000'            TO  BH-B2-INFO-ID          CAT760  
                   CALL  GETB1V            USING BH-BROKER-HEADER-INFO, CAT760  
                                                 BH-BTS2-INFO           CAT760  
                   END-CALL                                             CAT760  
                 IF  BH-ICS-ACTIVE                                      CAT760  
                                                                        CAT760  
                   IF  BH-ICS-ACAT-DATA-EXTRACT = '1'       AND         CAT760  
                       BH-BTS2-ACTIVE                       AND         CAT760  
                       BH-BTS2-ACAT-SETTL-VALUATIN-RP = '1'             CAT760  
                       ADD 1       TO B1-TBL-CNT                        CAT760  
                       MOVE  B1-SUB                              TO     CAT760  
                             B1-ADP-CL-NO               (B1-TBL-CNT)    CAT760  
                       MOVE BH-BROKER-NAME                       TO     CAT760  
                             B1-CLI-NAME                (B1-TBL-CNT)    CAT760  
                       MOVE  BH-BROKER-OLD-CLEARING-HOUSE (2:4)  TO     CAT760  
                             B1-BKR-CLR-NO              (B1-TBL-CNT)    CAT760  
                       MOVE  BH-BTS2-ACAT-SETTL-VALUATIN-RP      TO     CAT760  
                             B1-ASSET-VAL-IND           (B1-TBL-CNT)    CAT760  
                       MOVE  ZERO                                TO     CAT760  
                             B1-RCD-CNT                 (B1-TBL-CNT)    CAT760  
DJ0001                 DISPLAY        B1-SUB                            CAT760  
DJ0001                            ' ' BH-BROKER-NAME                    CAT760  
DJ0001                 ' BH-BTS2-ACAT-SETTL-VALUATIN-RP(511211)='       CAT760  
DJ0001                   BH-BTS2-ACAT-SETTL-VALUATIN-RP                 CAT760  
                                                                        CAT760  
                       MOVE  ' '           TO  BH-ATB-INFO              CAT760  
                       MOVE  B1-SUB        TO  BH-BROKER-NUMBER-N       CAT760  
                       MOVE  '015'         TO  BH-LOGICAL-RECORD-CODE   CAT760  
                       MOVE  '451140'      TO  BH-B2-INFO-ID            CAT760  
                       CALL  GETB1V      USING BH-BROKER-HEADER-INFO,   CAT760  
                                               BH-ATB-INFO              CAT760  
                       END-CALL                                         CAT760  
                       IF BH-ATB-ACTIVE                                 CAT760  
                         MOVE  BH-ATB-ACAT-BR-CONTROL-CODE-NO      TO   CAT760  
                               B1-CNTL-RANGE-NO           (B1-TBL-CNT)  CAT760  
                         PERFORM 210-MOVE-TABLE THRU                    CAT760  
                                 210-MOVE-TABLE-EXIT                    CAT760  
                                  VARYING B11-SUB FROM 1 BY 1           CAT760  
                                  UNTIL B11-SUB >                       CAT760  
                                    BH-ATB-ACAT-BR-CONTROL-CODE-NO      CAT760  
                       END-IF                                           CAT760  
                       DISPLAY  B1-TABLE (B1-TBL-CNT)                   CAT760  
                      END-IF                                            CAT760  
                     END-IF                                             CAT760  
                  END-IF                                                CAT760  
                 END-IF                                                 CAT760  
               ADD  1                      TO  B1-SUB                   CAT760  
           END-PERFORM.                                                 CAT760  
           DISPLAY ' '.                                                 CAT760  
           IF  B1-TBL-CNT =  0                                          CAT760  
               DISPLAY  'ZERO STREAM CLIENTS ARE B1-ACAT CLIENTS'       CAT760  
               DISPLAY  'INPUT ACAT FILE WILL BE BYPASSED'              CAT760  
           END-IF.                                                      CAT760  
                                                                        CAT760  
           DISPLAY  'B1 TABLE COUNT - ' B1-TBL-CNT.                     CAT760  
       200-INIT-B1-LOOP-EXIT.   EXIT.                                   CAT760  
                                                                        CAT760  
       210-MOVE-TABLE.                                                  CAT760  
           MOVE  BH-ATB-ACAT-BR-CONTROL-CODE   (B11-SUB)      TO        CAT760  
                B1-CNTL-CODE       (B1-TBL-CNT B11-SUB).                CAT760  
           MOVE  BH-ATB-ACAT-BR-CONTROL-CODE-LO (B11-SUB)     TO        CAT760  
                B1-CNTL-BR-LOW     (B1-TBL-CNT B11-SUB).                CAT760  
           MOVE  BH-ATB-ACAT-BR-CONTROL-CODE-HI (B11-SUB)     TO        CAT760  
                B1-CNTL-BR-HIGH    (B1-TBL-CNT B11-SUB).                CAT760  
           MOVE 'N'                                           TO        CAT760  
                B1-CNTL-HIT        (B1-TBL-CNT B11-SUB).                CAT760  
       210-MOVE-TABLE-EXIT. EXIT.                                       CAT760  
           EJECT                                                        CAT760  
      *****************                                                 CAT760  
       300-SORTIN-ROUTINE  SECTION.                                     CAT760  
      *****************                                                 CAT760  
                                                                        CAT760  
           MOVE 1 TO B1-SUB1                                            CAT760  
           DISPLAY '*** ' PGM-NAME ' BEGINNING SORTINP ROUTINE ***'.    CAT760  
                                                                        CAT760  
       310-NEXT-ACAT-SET.                                               CAT760  
                                                                        CAT760  
           PERFORM 400-FETCH-TRN-RECORD THRU                            CAT760  
                   400-FETCH-TRN-RECORD-EXIT.                           CAT760  
                                                                        CAT760  
           IF  WS-ACAT-EOF                                              CAT760  
               GO TO 390-CHECK-B1-FILE                                  CAT760  
           END-IF.                                                      CAT760  
           IF CLIENT-NBR OF DCLVTRNFR (2:3) NOT = WS-CLIENT-NBR         CAT760  
              MOVE 'N' TO B1-TABLE-SEARCH-STATUS                        CAT760  
              MOVE ' ' TO B1-TABLE-SEARCH-SWITCH                        CAT760  
              PERFORM 500-SEARCH-B1-TABLE THRU                          CAT760  
                      500-SEARCH-B1-TABLE-EXIT                          CAT760  
                      VARYING B1-SUB1 FROM 1 BY 1                       CAT760  
                        UNTIL B1-SEARCH-END                             CAT760  
              IF B1-ENTRY-FOUND                                         CAT760  
JPC00X***        DISPLAY 'B1-WRK-TABLE - ' B1-WRK-TABLE                 CAT760  
                 MOVE ' '                TO WS-ACAT-BYPASS-SW           CAT760  
              ELSE                                                      CAT760  
                 MOVE 'Y'                TO WS-ACAT-BYPASS-SW           CAT760  
              END-IF                                                    CAT760  
           END-IF.                                                      CAT760  
           IF  WS-ACAT-BYPASS                                           CAT760  
               GO TO 310-NEXT-ACAT-SET.                                 CAT760  
                                                                        CAT760  
           MOVE ACCT-RCV-NBR OF DCLVTRNFR      TO  BR-ACCT-IN.          CAT760  
           MOVE SPACES                         TO  BR-ACCT-CNV.         CAT760  
           MOVE 1                              TO  T-SUB1 T-SUB2.       CAT760  
           PERFORM UNTIL T-SUB1 > 15 OR                                 CAT760  
                         T-SUB2 > 8                                     CAT760  
             IF   B-CHAR (T-SUB1) NUMERIC                               CAT760  
               MOVE B-CHAR (T-SUB1) TO C-CHAR (T-SUB2)                  CAT760  
               ADD 1     TO  T-SUB1 T-SUB2                              CAT760  
             ELSE                                                       CAT760  
               ADD 1     TO  T-SUB1                                     CAT760  
             END-IF                                                     CAT760  
           END-PERFORM.                                                 CAT760  
                                                                        CAT760  
           IF BR-ACCT-CNV (1:3) NUMERIC                                 CAT760  
           AND BR-ACCT-CNV (4:5) NUMERIC                                CAT760  
              MOVE BR-ACCT-CNV (1:3)  TO  TEST-BR                       CAT760  
              MOVE BR-ACCT-CNV (4:5)  TO  TEST-ACCT                     CAT760  
           ELSE                                                         CAT760  
              DISPLAY 'INVALID BRANCH ACCOUNT ON VTRNFR TABLE'          CAT760  
              DISPLAY 'CONVERTED BR ACCT - ' BR-ACCT-CNV                CAT760  
              GO TO 310-NEXT-ACAT-SET.                                  CAT760  
                                                                        CAT760  
           EXEC SQL OPEN VASTCS                                         CAT760  
           END-EXEC.                                                    CAT760  
           IF  SQLCODE = 0                                              CAT760  
               CONTINUE                                                 CAT760  
           ELSE                                                         CAT760  
               PERFORM 800-SQL-ERROR THRU 800-EXIT                      CAT760  
               CALL ABEND             USING ABEND-CODE-8000             CAT760  
           END-IF.                                                      CAT760  
           MOVE SPACE TO WS-ASST-EOF-SW                                 CAT760  
           PERFORM UNTIL WS-ASST-EOF                                    CAT760  
               PERFORM 405-FETCH-AST-RECORD                             CAT760  
                  THRU 405-FETCH-AST-RECORD-EXIT                        CAT760  
               IF WS-ASST-EOF                                           CAT760  
                  CONTINUE                                              CAT760  
               ELSE                                                     CAT760  
                  PERFORM 430-MOVE-ASSET                                CAT760  
                     THRU 430-MOVE-ASSET-EXIT                           CAT760  
                  IF ADR-TRAN-TYPE = SPACES                             CAT760  
                     CONTINUE                                           CAT760  
                  ELSE                                                  CAT760  
                     ADD 3 TO WS-ACAT-ACPT-RECS                         CAT760  
                     RELEASE SORT-REC FROM ADR-REC                      CAT760  
                  END-IF                                                CAT760  
               END-IF                                                   CAT760  
           END-PERFORM                                                  CAT760  
           EXEC SQL CLOSE VASTCS                                        CAT760  
           END-EXEC.                                                    CAT760  
           GO TO 310-NEXT-ACAT-SET.                                     CAT760  
       430-MOVE-ASSET.                                                  CAT760  
           INITIALIZE ADR-REC.                                          CAT760  
           PERFORM 550-B1-BR-RANGE-SEARCH THRU                          CAT760  
                   550-B1-BR-RANGE-SEARCH-EXIT.                         CAT760  
                                                                        CAT760  
                                                                        CAT760  
      * ACAT BRANCH IS IN BRANCH RANGE ON B1 TABLE BUILD SORT RECORD    CAT760  
                                                                        CAT760  
           MOVE B1-WRK-ADP-CL-NO               TO  ADR-CLIENT.          CAT760  
           MOVE B1-WRK-NAME                    TO  ADR-CLIENT-NAME.     CAT760  
                                                                        CAT760  
           MOVE TEST-BR                        TO  ADR-BRANCH.          CAT760  
           MOVE TEST-ACCT                      TO  ADR-ACCOUNT.         CAT760  
           MOVE ACAT-CONTROL-NBR OF DCLVTRNFR  TO  ADR-CNTL-NO.         CAT760  
           MOVE RCV-CUST-NM OF DCLVTRNFR       TO  ADR-ACCT-TITLE       CAT760  
           MOVE DLVR-NBR OF DCLVTRNFR          TO  ADR-CONTRA-BKR.      CAT760  
JPC00X     MOVE RCV-SS-PRIM-NBR OF DCLVTRNFR   TO  ADR-SS-TAX-ID        CAT760  
           MOVE ACCT-DLVR-NBR OF DCLVTRNFR     TO  ADR-CONTRA-ACCT.     CAT760  
           MOVE RCV-ACCT-TYPE-CD OF DCLVTRNFR  TO  ADR-TYPE-ACCOUNT.    CAT760  
           MOVE STTS-CD OF DCLVTRNFR           TO  ADR-CURRENT-STATUS   CAT760  
           MOVE STTLM-LCTN-CD OF DCLVASSET     TO  ADR-SETTLMENT-IND.   CAT760  
                                                                        CAT760  
      * DETERMINE REPORTING RECORD TYPE                                 CAT760  
                                                                        CAT760  
           MOVE ASSET-AMT OF DCLVASSET TO WS-ACAT-ASSET-VALUE           CAT760  
                                                                        CAT760  
           IF STTLM-RSN-CD OF DCLVASSET = 'SMA'                         CAT760  
              MOVE SPACES          TO  ADR-CUSIP                        CAT760  
                                         ADR-SECURITY-DESC              CAT760  
              MOVE '00'            TO  ADR-TRAN-TYPE                    CAT760  
              MOVE ZERO            TO  ADR-ASSET-QTY                    CAT760  
              MOVE WS-ACAT-ASSET-VALUE TO ADR-ASSET-VALUE.              CAT760  
                                                                        CAT760  
           IF CSH-MGN-SHRT-CD OF DCLVASSET = 'C'                        CAT760  
           AND STTLM-LCTN-CD OF DCLVASSET = '40'                        CAT760  
           AND (STTLM-RSN-CD OF DCLVASSET = 'CRED' OR 'DEB')            CAT760  
             MOVE SPACES            TO  ADR-CUSIP                       CAT760  
                                        ADR-SECURITY-DESC               CAT760  
             MOVE '01'              TO  ADR-TRAN-TYPE                   CAT760  
             MOVE ZERO              TO  ADR-ASSET-QTY                   CAT760  
             IF STTLM-RSN-CD OF DCLVASSET = 'CRED'                      CAT760  
               COMPUTE ADR-ASSET-VALUE = WS-ACAT-ASSET-VALUE * MINUS-ONECAT760  
             ELSE                                                       CAT760  
               MOVE WS-ACAT-ASSET-VALUE TO ADR-ASSET-VALUE              CAT760  
             END-IF                                                     CAT760  
           END-IF.                                                      CAT760  
                                                                        CAT760  
           IF CSH-MGN-SHRT-CD OF DCLVASSET = 'M'                        CAT760  
           AND STTLM-LCTN-CD OF DCLVASSET = '40'                        CAT760  
           AND (STTLM-RSN-CD OF DCLVASSET = 'CRED' OR 'DEB')            CAT760  
             MOVE SPACES            TO  ADR-CUSIP                       CAT760  
                                        ADR-SECURITY-DESC               CAT760  
             MOVE '02'              TO  ADR-TRAN-TYPE                   CAT760  
             MOVE ZERO              TO  ADR-ASSET-QTY                   CAT760  
             IF STTLM-RSN-CD OF DCLVASSET = 'CRED'                      CAT760  
               COMPUTE ADR-ASSET-VALUE = WS-ACAT-ASSET-VALUE * MINUS-ONECAT760  
             ELSE                                                       CAT760  
               MOVE WS-ACAT-ASSET-VALUE TO ADR-ASSET-VALUE              CAT760  
             END-IF                                                     CAT760  
           END-IF.                                                      CAT760  
                                                                        CAT760  
           IF CSH-MGN-SHRT-CD OF DCLVASSET = 'S'                        CAT760  
           AND STTLM-LCTN-CD OF DCLVASSET = '40'                        CAT760  
           AND (STTLM-RSN-CD OF DCLVASSET = 'CRED' OR 'DEB')            CAT760  
             MOVE SPACES            TO  ADR-CUSIP                       CAT760  
                                        ADR-SECURITY-DESC               CAT760  
             MOVE '05'              TO  ADR-TRAN-TYPE                   CAT760  
             MOVE ZERO              TO  ADR-ASSET-QTY                   CAT760  
             IF STTLM-RSN-CD OF DCLVASSET = 'CRED'                      CAT760  
               COMPUTE ADR-ASSET-VALUE = WS-ACAT-ASSET-VALUE * MINUS-ONECAT760  
             ELSE                                                       CAT760  
               MOVE WS-ACAT-ASSET-VALUE TO ADR-ASSET-VALUE              CAT760  
             END-IF                                                     CAT760  
           END-IF.                                                      CAT760  
                                                                        CAT760  
           IF RCV-ACCT-TYPE-CD OF DCLVTRNFR = 'OT'                      CAT760  
           AND STTLM-LCTN-CD OF DCLVASSET = '40'                        CAT760  
           AND (STTLM-RSN-CD OF DCLVASSET = 'CRED' OR 'DEB')            CAT760  
             MOVE SPACES            TO  ADR-CUSIP                       CAT760  
                                        ADR-SECURITY-DESC               CAT760  
             MOVE '01'              TO  ADR-TRAN-TYPE                   CAT760  
             MOVE ZERO              TO  ADR-ASSET-QTY                   CAT760  
             IF STTLM-RSN-CD OF DCLVASSET = 'CRED'                      CAT760  
               COMPUTE ADR-ASSET-VALUE = WS-ACAT-ASSET-VALUE * MINUS-ONECAT760  
             ELSE                                                       CAT760  
               MOVE WS-ACAT-ASSET-VALUE TO ADR-ASSET-VALUE              CAT760  
             END-IF                                                     CAT760  
           END-IF.                                                      CAT760  
                                                                        CAT760  
           IF OPTN-CTGY-CD  OF DCLVASSET > '00'                         CAT760  
              PERFORM 420-SELECT-VOPTN THRU 420-EXIT                    CAT760  
              MOVE ASSET-QTY OF DCLVASSET   TO  ADR-OPT-QTY             CAT760  
              MOVE 'Y'                      TO  ADR-OPTION-IND          CAT760  
              MOVE BS-CD OF DCLVOPTN        TO  ADR-OPT-BUY-SELL        CAT760  
              MOVE SYM-CD OF DCLVOPTN       TO  ADR-OPT-SYMBOL          CAT760  
              MOVE OPTN-OPN-CLSD-CD OF DCLVOPTN TO ADR-OPT-OPEN-CLOSE   CAT760  
              MOVE PTCL-CD OF DCLVOPTN      TO  ADR-OPT-PUT-CALL        CAT760  
              MOVE EXPTN-DT OF DCLVOPTN (6:2) TO  ADR-OPT-EXPIRE-MM     CAT760  
              MOVE EXPTN-DT OF DCLVOPTN (4:1) TO  ADR-OPT-EXPIRE-YY     CAT760  
              MOVE STPRC-INTEGER-AMT OF DCLVOPTN TO ADR-OPT-PRICE       CAT760  
              MOVE STPRC-FRCTN-AMT OF DCLVOPTN TO ADR-OPT-1-8TH-PRICE   CAT760  
              IF ADR-OPT-1-8TH-PRICE IS NUMERIC                         CAT760  
              AND ADR-OPT-1-8TH-PRICE > '0'                             CAT760  
              AND ADR-OPT-1-8TH-PRICE < '8'                             CAT760  
                  CONTINUE                                              CAT760  
              ELSE                                                      CAT760  
                MOVE 0                           TO ADR-OPT-1-8TH-PRICE CAT760  
              END-IF                                                    CAT760  
              MOVE HIGH-VALUES              TO  ADR-CUSIP               CAT760  
              MOVE '90'                     TO  ADR-TRAN-TYPE.          CAT760  
                                                                        CAT760  
           IF  STTLM-LCTN-CD OF DCLVASSET = '45'                        CAT760  
           AND ADR-TRAN-TYPE = SPACES                                   CAT760  
             MOVE 'Y'           TO  ADR-MEMO-IND                        CAT760  
             MOVE ASSET-DESC-TXT OF DCLVASSET TO ADR-MEMO-DESC          CAT760  
             MOVE '000000000'   TO  ADR-CUSIP                           CAT760  
             MOVE '95'          TO  ADR-TRAN-TYPE.                      CAT760  
                                                                        CAT760  
           IF  ADR-TRAN-TYPE = SPACES                                   CAT760  
              IF (STTLM-RSN-CD OF DCLVASSET = 'CRED' OR 'DEB' OR 'CASH')CAT760  
                  CONTINUE                                              CAT760  
               ELSE                                                     CAT760  
                  MOVE ASSET-QTY OF DCLVASSET TO ADR-ASSET-QTY          CAT760  
                  IF ISIN-SEC-ISSUE-CD OF DCLVASSET > SPACES            CAT760  
                     MOVE ISIN-SEC-ISSUE-CD OF DCLVASSET                CAT760  
                       TO ADR-CUSIP                                     CAT760  
                  ELSE                                                  CAT760  
                      MOVE '000000000' TO ADR-CUSIP                     CAT760  
                  END-IF                                                CAT760  
                  MOVE ASSET-DESC-TXT OF DCLVASSET  TO ADR-SECURITY-DESCCAT760  
                  MOVE WS-ACAT-ASSET-VALUE TO ADR-ASSET-VALUE           CAT760  
                                                                        CAT760  
                  EVALUATE CSH-MGN-SHRT-CD OF DCLVASSET                 CAT760  
                      WHEN 'C'                                          CAT760  
                           MOVE '01' TO ADR-TRAN-TYPE                   CAT760  
                      WHEN 'M'                                          CAT760  
                           MOVE '02' TO ADR-TRAN-TYPE                   CAT760  
                      WHEN 'S'                                          CAT760  
                           MOVE '05' TO ADR-TRAN-TYPE                   CAT760  
                  END-EVALUATE                                          CAT760  
                                                                        CAT760  
DJ0001            IF PSTN-CD         OF DCLVASSET = 'S'                 CAT760  
DJ0001               MOVE 'Y'        TO  ADR-SHORT-IND                  CAT760  
DJ0001               COMPUTE ADR-ASSET-VALUE = ADR-ASSET-VALUE *        CAT760  
DJ0001                                         MINUS-ONE                CAT760  
DJ0001               COMPUTE ADR-ASSET-QTY   = ADR-ASSET-QTY   *        CAT760  
DJ0001                                         MINUS-ONE                CAT760  
DJ0001               DISPLAY '1 SHORT POS'                              CAT760  
DJ0001                    ' ' ADR-CLIENT                                CAT760  
DJ0001                    ' ' ADR-BRANCH                                CAT760  
DJ0001                    ' ' ADR-ACCOUNT                               CAT760  
DJ0001                    ' ' ADR-TRAN-TYPE                             CAT760  
DJ0001                    ' ' ADR-ASSET-QTY                             CAT760  
DJ0001                    ' ' ADR-SECURITY-DESC                         CAT760  
DJ0001                    ' ' ADR-ASSET-VALUE                           CAT760  
DJ0001            END-IF                                                CAT760  
                END-IF.                                                 CAT760  
                                                                        CAT760  
                                                                        CAT760  
       430-MOVE-ASSET-EXIT. EXIT.                                       CAT760  
                                                                        CAT760  
       390-CHECK-B1-FILE.                                               CAT760  
           PERFORM 575-B1-NOT-RPTING THRU                               CAT760  
                   575-B1-NOT-RPTING-EXIT                               CAT760  
                     VARYING B3-SUB FROM 1 BY 1                         CAT760  
                       UNTIL B3-SUB > B1-TBL-CNT.                       CAT760  
                                                                        CAT760  
       300-SORTIN-ROUTINE-EXIT.  EXIT.                                  CAT760  
                                                                        CAT760  
           EJECT                                                        CAT760  
       400-FETCH-TRN-RECORD.                                            CAT760  
           EXEC SQL                                                     CAT760  
               FETCH VTRNCS                                             CAT760  
               INTO                                                     CAT760  
                    :DCLVTRNFR.CLIENT-NBR                               CAT760  
                   ,:DCLVTRNFR.ACAT-CONTROL-NBR                         CAT760  
                   ,:DCLVTRNFR.DLVR-NBR                                 CAT760  
                   ,:DCLVTRNFR.ACCT-DLVR-NBR                            CAT760  
                   ,:DCLVTRNFR.RCV-NBR                                  CAT760  
                   ,:DCLVTRNFR.ACCT-RCV-NBR                             CAT760  
                   ,:DCLVTRNFR.RCV-CUST-NM                              CAT760  
                   ,:DCLVTRNFR.RCV-SS-PRIM-NBR                          CAT760  
                   ,:DCLVTRNFR.RCV-ACCT-TYPE-CD                         CAT760  
                   ,:DCLVTRNFR.ACAT-CNTL-ASTD-NBR                       CAT760  
                   ,:DCLVTRNFR.CMNT-TXT                                 CAT760  
                   ,:DCLVTRNFR.STTS-CD                                  CAT760  
           END-EXEC                                                     CAT760  
           EVALUATE SQLCODE                                             CAT760  
               WHEN 0                                                   CAT760  
                    ADD 1 TO WS-ACAT-DTL-RECS                           CAT760  
               WHEN +100                                                CAT760  
                    DISPLAY 'FETCH END OF FILE'                         CAT760  
                    MOVE 'Y' TO WS-ACAT-EOF-SW                          CAT760  
                    GO TO 400-FETCH-TRN-RECORD-EXIT                     CAT760  
               WHEN OTHER                                               CAT760  
                    PERFORM 800-SQL-ERROR THRU 800-EXIT                 CAT760  
                    CALL ABEND        USING ABEND-CODE-8000             CAT760  
           END-EVALUATE.                                                CAT760  
                                                                        CAT760  
       400-FETCH-TRN-RECORD-EXIT. EXIT.                                 CAT760  
           EJECT                                                        CAT760  
       405-FETCH-AST-RECORD.                                            CAT760  
           INITIALIZE DCLVASSET                                         CAT760  
           EXEC SQL                                                     CAT760  
               FETCH VASTCS                                             CAT760  
               INTO                                                     CAT760  
                    :DCLVASSET.ASSET-SEQ-NBR                            CAT760  
                   ,:DCLVASSET.CONTROL-NBR-STS-CD                       CAT760  
                   ,:DCLVASSET.STTLM-LCTN-CD                            CAT760  
                   ,:DCLVASSET.STTLM-RSN-CD                             CAT760  
                   ,:DCLVASSET.ISIN-SEC-ISSUE-CD                        CAT760  
                   ,:DCLVASSET.ASSET-DESC-TXT                           CAT760  
                   ,:DCLVASSET.ASSET-QTY                                CAT760  
                   ,:DCLVASSET.ASSET-AMT                                CAT760  
                   ,:DCLVASSET.CSH-MGN-SHRT-CD                          CAT760  
                   ,:DCLVASSET.OPTN-CTGY-CD                             CAT760  
DJ0001             ,:DCLVASSET.PSTN-CD                                  CAT760  
           END-EXEC                                                     CAT760  
           EVALUATE SQLCODE                                             CAT760  
               WHEN 0                                                   CAT760  
                    CONTINUE                                            CAT760  
               WHEN +100                                                CAT760  
                    MOVE 'Y' TO WS-ASST-EOF-SW                          CAT760  
JPC00X**            DISPLAY 'END OF FILE AST'                           CAT760  
                    GO TO 405-FETCH-AST-RECORD-EXIT                     CAT760  
               WHEN OTHER                                               CAT760  
                    PERFORM 800-SQL-ERROR THRU 800-EXIT                 CAT760  
                    CALL ABEND        USING ABEND-CODE-8000             CAT760  
           END-EVALUATE.                                                CAT760  
                                                                        CAT760  
       405-FETCH-AST-RECORD-EXIT. EXIT.                                 CAT760  
           EJECT                                                        CAT760  
       420-SELECT-VOPTN.                                                CAT760  
           INITIALIZE DCLVOPTN                                          CAT760  
           MOVE SPACES TO WS-VASSET-IND                                 CAT760  
           EXEC SQL SELECT                                              CAT760  
                    BS_CD                                               CAT760  
                   ,PTCL_CD                                             CAT760  
                   ,OPTN_OPN_CLSD_CD                                    CAT760  
                   ,SYM_CD                                              CAT760  
                   ,EXPTN_DT                                            CAT760  
                   ,STPRC_INTEGER_AMT                                   CAT760  
                   ,STPRC_FRCTN_AMT                                     CAT760  
                   ,STPRC_INTEGER_AMT                                   CAT760  
                   ,STPRC_FRCTN_AMT                                     CAT760  
               INTO                                                     CAT760  
                    :DCLVOPTN.BS-CD                                     CAT760  
                   ,:DCLVOPTN.PTCL-CD                                   CAT760  
                   ,:DCLVOPTN.OPTN-OPN-CLSD-CD                          CAT760  
                   ,:DCLVOPTN.SYM-CD                                    CAT760  
                   ,:DCLVOPTN.EXPTN-DT                                  CAT760  
                   ,:DCLVOPTN.STPRC-INTEGER-AMT                         CAT760  
                   ,:DCLVOPTN.STPRC-FRCTN-AMT                           CAT760  
                   ,:DCLVOPTN.STPRC-INTEGER-AMT                         CAT760  
                   ,:DCLVOPTN.STPRC-FRCTN-AMT                           CAT760  
               FROM VOPTN                                               CAT760  
              WHERE CLIENT_NBR       = :DCLVTRNFR.CLIENT-NBR            CAT760  
                AND ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CONTROL-NBR      CAT760  
                AND ASSET_SEQ_NBR    = :DCLVASSET.ASSET-SEQ-NBR         CAT760  
           END-EXEC                                                     CAT760  
                                                                        CAT760  
           IF  SQLCODE  =  +0                                           CAT760  
               SET WS-VASSET-FOUND TO TRUE                              CAT760  
           ELSE                                                         CAT760  
               IF  SQLCODE  =  +100                                     CAT760  
                   CONTINUE                                             CAT760  
              ELSE                                                      CAT760  
                 PERFORM 800-SQL-ERROR THRU 800-EXIT                    CAT760  
                 CALL ABEND        USING ABEND-CODE-8000                CAT760  
           END-IF.                                                      CAT760  
                                                                        CAT760  
                                                                        CAT760  
       420-EXIT. EXIT.                                                  CAT760  
       500-SEARCH-B1-TABLE.                                             CAT760  
           IF B1-SUB1 > B1-TBL-CNT                                      CAT760  
              MOVE 'N'  TO  B1-TABLE-SEARCH-STATUS                      CAT760  
              MOVE 'Y'  TO  B1-TABLE-SEARCH-SWITCH                      CAT760  
              GO TO 500-SEARCH-B1-TABLE-EXIT.                           CAT760  
                                                                        CAT760  
           IF B1-ADP-CL-NO (B1-SUB1) = CLIENT-NBR OF DCLVTRNFR (2:3)    CAT760  
JPC00X**      DISPLAY 'ADP CLIENT NO - ' CLIENT-NBR OF DCLVTRNFR        CAT760  
              MOVE B1-TABLE (B1-SUB1) TO B1-WRK-TABLE                   CAT760  
              MOVE B1-SUB1  TO  B1-SUB1-SVE                             CAT760  
              MOVE 'Y'  TO  B1-TABLE-SEARCH-STATUS                      CAT760  
JPC00X**      DISPLAY 'CLT FOUND: ' CLIENT-NBR OF DCLVTRNFR (2:3)       CAT760  
              MOVE 'Y'  TO  B1-TABLE-SEARCH-SWITCH                      CAT760  
              MOVE B1-ADP-CL-NO (B1-SUB1) TO WS-CLIENT-NBR              CAT760  
              GO TO 500-SEARCH-B1-TABLE-EXIT.                           CAT760  
                                                                        CAT760  
       500-SEARCH-B1-TABLE-EXIT. EXIT.                                  CAT760  
                                                                        CAT760  
       550-B1-BR-RANGE-SEARCH.                                          CAT760  
           MOVE 'Y'  TO  B1-CL-HIT (B1-SUB1-SVE).                       CAT760  
           ADD  1    TO  B1-RCD-CNT (B1-SUB1-SVE).                      CAT760  
                                                                        CAT760  
       550-B1-BR-RANGE-SEARCH-EXIT.  EXIT.                              CAT760  
                                                                        CAT760  
       575-B1-NOT-RPTING.                                               CAT760  
                                                                        CAT760  
           IF B1-CL-HIT (B3-SUB) NOT = 'Y'                              CAT760  
               INITIALIZE ADR-REC                                       CAT760  
               MOVE B1-ADP-CL-NO (B3-SUB) TO ADR-CLIENT                 CAT760  
               MOVE B1-CLI-NAME  (B3-SUB) TO ADR-CLIENT-NAME            CAT760  
               MOVE ZEROS                 TO ADR-CONTROLLER             CAT760  
               MOVE LOW-VALUES            TO ADR-CUSIP                  CAT760  
               RELEASE SORT-REC FROM ADR-REC.                           CAT760  
                                                                        CAT760  
       575-B1-NOT-RPTING-EXIT.    EXIT.                                 CAT760  
           EJECT                                                        CAT760  
       580-REFORMAT-ASSET   SECTION.                                    CAT760  
                                                                        CAT760  
           MOVE 0                        TO WS-INT                      CAT760  
                                            WS-DEC                      CAT760  
                                            WS-QTY-N                    CAT760  
           MOVE ' '                      TO WS-COMMA-FND-SW             CAT760  
                                                                        CAT760  
           PERFORM VARYING WS-COMMA-PTR FROM 1 BY 1                     CAT760  
                     UNTIL WS-COMMA-PTR > 17 OR WS-COMMA-FND-SW = 'Y'   CAT760  
                        IF WS-QTY-BYTE(WS-COMMA-PTR) = ','              CAT760  
                           MOVE 'Y'      TO WS-COMMA-FND-SW             CAT760  
                        END-IF                                          CAT760  
           END-PERFORM                                                  CAT760  
                                                                        CAT760  
           IF  WS-COMMA-FND-SW = 'Y'                                    CAT760  
               MOVE 17                   TO WS-INT-PTR                  CAT760  
               MOVE WS-COMMA-PTR TO WS-QTY-PTR                          CAT760  
               SUBTRACT 2     FROM WS-QTY-PTR                           CAT760  
               PERFORM VARYING WS-QTY-PTR FROM WS-QTY-PTR BY -1         CAT760  
                       UNTIL WS-QTY-PTR = 0                             CAT760  
                       MOVE WS-QTY-BYTE(WS-QTY-PTR)                     CAT760  
                                         TO WS-INT-BYTE(WS-INT-PTR)     CAT760  
                       SUBTRACT 1 FROM WS-INT-PTR                       CAT760  
               END-PERFORM                                              CAT760  
               MOVE 1                    TO WS-DEC-PTR                  CAT760  
               MOVE WS-COMMA-PTR TO WS-QTY-PTR                          CAT760  
               PERFORM VARYING WS-QTY-PTR FROM WS-QTY-PTR BY 1          CAT760  
                       UNTIL WS-DEC-PTR > 4 OR WS-QTY-PTR > 17          CAT760  
                       MOVE WS-QTY-BYTE(WS-QTY-PTR)                     CAT760  
                                         TO WS-DEC-BYTE(WS-DEC-PTR)     CAT760  
                       ADD 1        TO WS-DEC-PTR                       CAT760  
               END-PERFORM                                              CAT760  
           ELSE                                                         CAT760  
               MOVE WS-QTY               TO WS-INT                      CAT760  
           END-IF.                                                      CAT760  
           MOVE WS-INT                   TO WS-QTY-INT.                 CAT760  
           MOVE WS-DEC                   TO WS-QTY-DEC.                 CAT760  
                                                                        CAT760  
       580-EXIT. EXIT.                                                  CAT760  
      *****************                                                 CAT760  
       600-SORTOUT-ROUTINE  SECTION.                                    CAT760  
      *****************                                                 CAT760  
                                                                        CAT760  
           DISPLAY '*** ' PGM-NAME ' BEGINNING SORTOUT ROUTINE ***'.    CAT760  
                                                                        CAT760  
           IF WS-ACAT-DTL-RECS = ZERO                                   CAT760  
             GO TO 600-SORTOUT-ROUTINE-EXIT.                            CAT760  
                                                                        CAT760  
       610-NEXT-REC.                                                    CAT760  
                                                                        CAT760  
           RETURN SORT-FILE INTO ADR-REC                                CAT760  
             AT END GO TO 600-SORTOUT-ROUTINE-EXIT.                     CAT760  
                                                                        CAT760  
           IF WS-ACAT-FIRST-TIME                                        CAT760  
             MOVE 'N' TO WS-ACAT-FIRST-TIME-SW                          CAT760  
             MOVE ADR-REC TO           SAVE-REC                         CAT760  
             IF ADR-CUSIP = SPACES                                      CAT760  
               PERFORM 625-ADD-CASH THRU                                CAT760  
                       625-ADD-CASH-EXIT                                CAT760  
               GO TO 610-NEXT-REC                                       CAT760  
             ELSE                                                       CAT760  
               PERFORM 750-HEADERS THRU                                 CAT760  
                       750-HEADERS-EXIT                                 CAT760  
               PERFORM 775-CASH-REPORTING THRU                          CAT760  
                       775-CASH-REPORTING-EXIT                          CAT760  
               MOVE 'Y' TO WS-ACAT-CASH-REPORTING-SW                    CAT760  
               PERFORM 700-REPORTING THRU                               CAT760  
                       700-REPORTING-EXIT                               CAT760  
               PERFORM 650-ADD-EQUITY THRU                              CAT760  
                       650-ADD-EQUITY-EXIT                              CAT760  
               GO TO 610-NEXT-REC                                       CAT760  
           END-IF.                                                      CAT760  
                                                                        CAT760  
           IF ADR-KEY = SAVE-KEY                                        CAT760  
             IF ADR-CUSIP = SPACES                                      CAT760  
               PERFORM 625-ADD-CASH THRU                                CAT760  
                       625-ADD-CASH-EXIT                                CAT760  
               GO TO 610-NEXT-REC                                       CAT760  
             ELSE                                                       CAT760  
               IF WS-ACAT-CASH-REPORTED                                 CAT760  
                 CONTINUE                                               CAT760  
               ELSE                                                     CAT760  
                 MOVE 'Y'  TO  WS-ACAT-CASH-REPORTING-SW                CAT760  
                 PERFORM 750-HEADERS THRU                               CAT760  
                         750-HEADERS-EXIT                               CAT760  
                 PERFORM 775-CASH-REPORTING THRU                        CAT760  
                         775-CASH-REPORTING-EXIT                        CAT760  
               END-IF                                                   CAT760  
                 PERFORM 700-REPORTING THRU                             CAT760  
                         700-REPORTING-EXIT                             CAT760  
               PERFORM 650-ADD-EQUITY THRU                              CAT760  
                       650-ADD-EQUITY-EXIT                              CAT760  
               GO TO 610-NEXT-REC                                       CAT760  
           ELSE                                                         CAT760  
      * KEYS ARE NOT EQUAL REPORT ACCOUNT TOTALS                        CAT760  
             IF WS-ACAT-CASH-REPORTED                                   CAT760  
               CONTINUE                                                 CAT760  
             ELSE                                                       CAT760  
               PERFORM 750-HEADERS THRU                                 CAT760  
                       750-HEADERS-EXIT                                 CAT760  
               PERFORM 775-CASH-REPORTING THRU                          CAT760  
                       775-CASH-REPORTING-EXIT                          CAT760  
             END-IF                                                     CAT760  
             MOVE ' '     TO  WS-ACAT-CASH-REPORTING-SW                 CAT760  
             IF (SAVE-CONTROLLER = ZEROS AND SAVE-BRANCH = SPACES) OR   CAT760  
                SAVE-BRANCH     = SPACES                                CAT760  
               CONTINUE                                                 CAT760  
             ELSE                                                       CAT760  
               PERFORM 780-ACCOUNT-TOTALS THRU                          CAT760  
                       780-ACCOUNT-TOTALS-EXIT                          CAT760  
             END-IF                                                     CAT760  
             IF ADR-CLIENT = SAVE-CLIENT                                CAT760  
               CONTINUE                                                 CAT760  
             ELSE                                                       CAT760  
               MOVE ZERO TO PAGECNT                                     CAT760  
             END-IF                                                     CAT760  
             IF ADR-CLIENT = SAVE-CLIENT                                CAT760  
               CONTINUE                                                 CAT760  
             ELSE                                                       CAT760  
               MOVE ZERO  TO  PAGECNT                                   CAT760  
             END-IF                                                     CAT760  
             MOVE ADR-REC TO SAVE-REC                                   CAT760  
             MOVE ZERO    TO  WS-ACAT-ACCT-CASH-SMA                     CAT760  
                              WS-ACAT-ACCT-CASH-TY01                    CAT760  
                              WS-ACAT-ACCT-CASH-TY02                    CAT760  
                              WS-ACAT-ACCT-CASH-TY05                    CAT760  
                              WS-ACAT-ACCT-CASH                         CAT760  
                              WS-ACAT-ACCT-EQUITY-TY01                  CAT760  
                              WS-ACAT-ACCT-EQUITY-TY02                  CAT760  
                              WS-ACAT-ACCT-EQUITY-TY05                  CAT760  
                              WS-ACAT-ACCT-EQUITY                       CAT760  
                              WS-ACAT-ACCT-NET-BAL                      CAT760  
                              WS-ACAT-ACCT-TOT-EQUITY                   CAT760  
             MOVE SPACES  TO  WS-ACAT-DELETE-SW                         CAT760  
             IF ADR-CUSIP = SPACES                                      CAT760  
               PERFORM 625-ADD-CASH THRU                                CAT760  
                       625-ADD-CASH-EXIT                                CAT760  
               GO TO 610-NEXT-REC                                       CAT760  
             ELSE                                                       CAT760  
               IF WS-ACAT-CASH-REPORTED                                 CAT760  
                 CONTINUE                                               CAT760  
               ELSE                                                     CAT760  
                 MOVE 'Y'             TO WS-ACAT-CASH-REPORTING-SW      CAT760  
                 PERFORM 750-HEADERS THRU                               CAT760  
                         750-HEADERS-EXIT                               CAT760  
                 PERFORM 775-CASH-REPORTING THRU                        CAT760  
                         775-CASH-REPORTING-EXIT                        CAT760  
               END-IF                                                   CAT760  
               PERFORM 700-REPORTING THRU                               CAT760  
                       700-REPORTING-EXIT                               CAT760  
               PERFORM 650-ADD-EQUITY THRU                              CAT760  
                       650-ADD-EQUITY-EXIT                              CAT760  
           END-IF.                                                      CAT760  
           GO TO 610-NEXT-REC.                                          CAT760  
                                                                        CAT760  
       600-SORTOUT-ROUTINE-EXIT.  EXIT.                                 CAT760  
                                                                        CAT760  
       625-ADD-CASH.                                                    CAT760  
           IF ADR-TRAN-TYPE = '00'                                      CAT760  
             ADD ADR-ASSET-VALUE  TO WS-ACAT-ACCT-CASH-SMA.             CAT760  
           IF ADR-TRAN-TYPE = '01'                                      CAT760  
             ADD ADR-ASSET-VALUE  TO WS-ACAT-ACCT-CASH-TY01             CAT760  
                                     WS-ACAT-ACCT-CASH.                 CAT760  
           IF ADR-TRAN-TYPE = '02'                                      CAT760  
             ADD ADR-ASSET-VALUE  TO WS-ACAT-ACCT-CASH-TY02             CAT760  
                                     WS-ACAT-ACCT-CASH.                 CAT760  
           IF ADR-TRAN-TYPE = '05'                                      CAT760  
             ADD ADR-ASSET-VALUE  TO WS-ACAT-ACCT-CASH-TY05             CAT760  
                                     WS-ACAT-ACCT-CASH.                 CAT760  
                                                                        CAT760  
      * RECORDS DELETED BY BROKER ARE CODED AS SMA RECORDS WITH         CAT760  
      * ZERO CASH TURN ON INDICATOR FOR MESSAGE LINE AT ACCOUNT END     CAT760  
           IF ADR-TRAN-TYPE = '00' AND                                  CAT760  
              ADR-DELETE-IND = 'Y'                                      CAT760  
             MOVE 'Y'  TO  WS-ACAT-DELETE-SW.                           CAT760  
                                                                        CAT760  
       625-ADD-CASH-EXIT. EXIT.                                         CAT760  
                                                                        CAT760  
       650-ADD-EQUITY.                                                  CAT760  
           IF ADR-TRAN-TYPE = '01'                                      CAT760  
             ADD ADR-ASSET-VALUE  TO WS-ACAT-ACCT-EQUITY-TY01           CAT760  
                                     WS-ACAT-ACCT-EQUITY.               CAT760  
           IF ADR-TRAN-TYPE = '02'                                      CAT760  
             ADD ADR-ASSET-VALUE  TO WS-ACAT-ACCT-EQUITY-TY02           CAT760  
                                     WS-ACAT-ACCT-EQUITY.               CAT760  
           IF ADR-TRAN-TYPE = '05'                                      CAT760  
             ADD ADR-ASSET-VALUE  TO WS-ACAT-ACCT-EQUITY-TY05           CAT760  
                                     WS-ACAT-ACCT-EQUITY.               CAT760  
       650-ADD-EQUITY-EXIT. EXIT.                                       CAT760  
           EJECT                                                        CAT760  
       700-REPORTING.                                                   CAT760  
                                                                        CAT760  
           MOVE SPACES            TO  DETAIL-LINE-1                     CAT760  
                                      WS-MEMO-MSG-SW.                   CAT760  
                                                                        CAT760  
      * CHECK FOR OPTIONS - TRAN CODE 90                                CAT760  
      * IF PRESENT REPORT AFTER WRITING TOTALS                          CAT760  
           IF ADR-TRAN-TYPE = '90'                                      CAT760  
             ADD  1               TO  ACT-OPTION-CTR                    CAT760  
             IF ACT-OPTION-CTR > 4000                                   CAT760  
               DISPLAY 'MORE THAN 4000 OPTIONS FOR CUSTOMER '           CAT760  
               DISPLAY 'INCREASE TABLE SIZE '                           CAT760  
               DISPLAY 'PROGRAM CAT760 ABENDED '                        CAT760  
               CALL ABEND          USING ABEND-CODE-4090                CAT760  
             END-IF                                                     CAT760  
             MOVE ADR-OPTION-DATA TO  ACT-OPTION-DATA (ACT-OPTION-CTR)  CAT760  
             GO TO 700-REPORTING-EXIT.                                  CAT760  
                                                                        CAT760  
      * CHECK FOR MEMOS - TRAN CODE 95                                  CAT760  
      * IF PRESENT REPORT AFTER TOTALS AND OPTIONS                      CAT760  
           IF ADR-TRAN-TYPE = '95'                                      CAT760  
             ADD  1               TO  ACT-MEMO-CTR                      CAT760  
             IF ACT-MEMO-CTR > 100                                      CAT760  
               DISPLAY 'MORE THAN 100 MEMOS FOR CUSTOMER '              CAT760  
               DISPLAY 'INCREASE TABLE SIZE '                           CAT760  
               DISPLAY 'PROGRAM CAT760 ABENDED '                        CAT760  
               CALL ABEND          USING ABEND-CODE-4091                CAT760  
             END-IF                                                     CAT760  
             MOVE ADR-MEMO-DESC TO  ACT-MEMO-DESC (ACT-MEMO-CTR)        CAT760  
             GO TO 700-REPORTING-EXIT.                                  CAT760  
                                                                        CAT760  
           IF LINECNT > 55                                              CAT760  
             PERFORM 750-HEADERS THRU                                   CAT760  
                     750-HEADERS-EXIT                                   CAT760  
             IF (ADR-CONTROLLER = ZEROS AND ADR-BRANCH = SPACES) OR     CAT760  
                ADR-BRANCH     = SPACES                                 CAT760  
               CONTINUE                                                 CAT760  
             ELSE                                                       CAT760  
               MOVE HDR6C       TO  PRINT-AREA                          CAT760  
               MOVE ' '         TO  CC                                  CAT760  
               PERFORM 725-PRINT-LINE THRU                              CAT760  
                       725-PRINT-LINE-EXIT                              CAT760  
             END-IF                                                     CAT760  
           END-IF.                                                      CAT760  
                                                                        CAT760  
           IF ADR-CONTROLLER = ZEROS AND                                CAT760  
              ADR-BRANCH = SPACES                                       CAT760  
             MOVE '******* NO ACTIVITY FOR THIS CLIENT ********'        CAT760  
                                               TO NAL-MSG               CAT760  
             MOVE NO-ACTV-LINE                 TO PRINT-AREA            CAT760  
             MOVE '0'                          TO CC                    CAT760  
             PERFORM 725-PRINT-LINE THRU                                CAT760  
                     725-PRINT-LINE-EXIT                                CAT760  
             GO TO 700-REPORTING-EXIT.                                  CAT760  
                                                                        CAT760  
           IF ADR-BRANCH = SPACES                                       CAT760  
             MOVE '***** NO ACTIVITY FOR THIS CONTROLLER ********'      CAT760  
                                               TO NAL-MSG               CAT760  
             MOVE NO-ACTV-LINE                 TO PRINT-AREA            CAT760  
             MOVE '0'                          TO CC                    CAT760  
             PERFORM 725-PRINT-LINE THRU                                CAT760  
                     725-PRINT-LINE-EXIT                                CAT760  
             GO TO 700-REPORTING-EXIT.                                  CAT760  
                                                                        CAT760  
           MOVE SPACES                         TO DETAIL-LINE-1.        CAT760  
           MOVE ADR-TRAN-TYPE                  TO DL1-TYPE.             CAT760  
           IF ADR-MEMO-IND = 'Y'                                        CAT760  
             MOVE '       MEMO ONLY '          TO DL1-WS-MEMO-MSG.      CAT760  
                                                                        CAT760  
           IF ADR-CUSIP = ('000000000' OR LOW-VALUES) AND               CAT760  
              ADR-MEMO-IND NOT = 'Y'                                    CAT760  
             MOVE 'CUSIP NUMBER NOT ENTERED'   TO DL1-WS-MEMO-MSG.      CAT760  
                                                                        CAT760  
      *    FIND THIS SECURITY ON ADP XREF-GETXREF - CUSIP NUMBER IS KEY CAT760  
                                                                        CAT760  
           IF ADR-CUSIP = '000000000' OR LOW-VALUES                     CAT760  
             CONTINUE                                                   CAT760  
           ELSE                                                         CAT760  
             MOVE 'D'         TO GETXRF-DEVICE-IND                      CAT760  
             MOVE 'R'         TO GETXRF-ACCESS-IND                      CAT760  
             MOVE SPACE       TO GETXRF-RETURN-CODE                     CAT760  
             MOVE ADR-CUSIP   TO GETXRF-SEARCH-KEY-CUSIP-SYM(1:9)       CAT760  
             MOVE SPACES      TO GETXRF-SEARCH-KEY-CUSIP-SYM(10:3)      CAT760  
             MOVE '0'         TO GETXRF-WI-CODE                         CAT760  
             CALL GETXREF    USING GETXRF-CALLING-INFO                  CAT760  
             IF GETXRF-RETURN-VALID                                     CAT760  
               CONTINUE                                                 CAT760  
             ELSE                                                       CAT760  
               MOVE 'CUSIP NOT FOUND XREF FILE'  TO  DL1-WS-MEMO-MSG    CAT760  
             END-IF                                                     CAT760  
           END-IF.                                                      CAT760  
                                                                        CAT760  
           MOVE ADR-ASSET-QTY-WHOLE  TO  WORK-WHOLE-NUM.                CAT760  
                                                                        CAT760  
DJ0001     IF  ADR-ASSET-QTY < 0                                        CAT760  
DJ0001         MOVE 'SHORT POSITION'  TO  DL1-WS-MEMO-MSG               CAT760  
DJ0001         COMPUTE WORK-WHOLE-NUM = WORK-WHOLE-NUM * MINUS-ONE      CAT760  
DJ0001               DISPLAY '2 SHORT POS'                              CAT760  
DJ0001                    ' ' ADR-CLIENT                                CAT760  
DJ0001                    ' ' ADR-BRANCH                                CAT760  
DJ0001                    ' ' ADR-ACCOUNT                               CAT760  
DJ0001                    ' ' ADR-TRAN-TYPE                             CAT760  
DJ0001                    ' ' ADR-ASSET-QTY                             CAT760  
DJ0001                    ' ' ADR-SECURITY-DESC                         CAT760  
DJ0001                    ' ' ADR-ASSET-VALUE                           CAT760  
DJ0001     END-IF.                                                      CAT760  
                                                                        CAT760  
           IF ADR-ASSET-QTY-WHOLE-NUM                                   CAT760  
             MOVE WORK-WHOLE-NUM               TO DL1-QTY-WHOLE         CAT760  
           ELSE                                                         CAT760  
             MOVE ADR-ASSET-QTY                TO DL1-QTY-FRAC.         CAT760  
                                                                        CAT760  
           MOVE ADR-SECURITY-DESC              TO DL1-SEC-DESCR.        CAT760  
           IF ADR-CUSIP = '000000000' OR LOW-VALUES                     CAT760  
             MOVE SPACES                       TO DL1-CUSIP             CAT760  
           ELSE                                                         CAT760  
             MOVE ADR-CUSIP                    TO DL1-CUSIP.            CAT760  
                                                                        CAT760  
           MOVE ADR-ASSET-VALUE                TO DL1-ASSET-VALUE.      CAT760  
                                                                        CAT760  
           IF ADR-SETTLMENT-IND = '45'                                  CAT760  
              AND ADR-MEMO-IND NOT = 'Y'                                CAT760  
              AND DL1-WS-MEMO-MSG NOT = SPACES                          CAT760  
             MOVE 'Y'   TO   WS-MEMO-MSG-SW.                            CAT760  
                                                                        CAT760  
           IF ADR-SETTLMENT-IND > SPACES                                CAT760  
              AND ADR-MEMO-IND NOT = 'Y'                                CAT760  
              AND DL1-WS-MEMO-MSG = SPACES                              CAT760  
              EVALUATE ADR-SETTLMENT-IND                                CAT760  
                  WHEN '05'                                             CAT760  
                        MOVE 'CNS'        TO  DL1-WS-MEMO-MSG           CAT760  
                  WHEN '10'                                             CAT760  
                        MOVE 'FUND-SERV'  TO  DL1-WS-MEMO-MSG           CAT760  
                  WHEN '15'                                             CAT760  
                        MOVE 'PTC'        TO  DL1-WS-MEMO-MSG           CAT760  
                  WHEN '20'                                             CAT760  
                        MOVE 'GSCC'       TO  DL1-WS-MEMO-MSG           CAT760  
                  WHEN '20'                                             CAT760  
                        MOVE 'GSCC'       TO  DL1-WS-MEMO-MSG           CAT760  
                  WHEN '25'                                             CAT760  
                        MOVE 'DTC'        TO  DL1-WS-MEMO-MSG           CAT760  
                  WHEN '30'                                             CAT760  
                        MOVE 'UNDELIVERABLE'  TO DL1-WS-MEMO-MSG        CAT760  
                  WHEN '35'                                             CAT760  
                        MOVE 'OCC'        TO  DL1-WS-MEMO-MSG           CAT760  
                  WHEN '40'                                             CAT760  
                        MOVE 'CASH'       TO  DL1-WS-MEMO-MSG           CAT760  
                  WHEN '45'                                             CAT760  
                        MOVE 'MEMO'       TO  DL1-WS-MEMO-MSG           CAT760  
                  WHEN '50'                                             CAT760  
                        MOVE 'R-D'        TO  DL1-WS-MEMO-MSG           CAT760  
              END-EVALUATE                                              CAT760  
           END-IF.                                                      CAT760  
                                                                        CAT760  
           MOVE DETAIL-LINE-1                  TO PRINT-AREA.           CAT760  
           MOVE '0'                            TO CC.                   CAT760  
                                                                        CAT760  
           PERFORM 725-PRINT-LINE THRU                                  CAT760  
                   725-PRINT-LINE-EXIT.                                 CAT760  
                                                                        CAT760  
           IF WS-MEMO-MSG                                               CAT760  
              MOVE SPACE             TO  WS-MEMO-MSG-SW                 CAT760  
              MOVE SPACES            TO  DETAIL-LINE-1                  CAT760  
              EVALUATE TRUE                                             CAT760  
                  WHEN ADR-NON-CNS                                      CAT760  
                    MOVE 'NON-CNS'          TO DL1-WS-MEMO-MSG          CAT760  
                  WHEN ADR-SYSTEM-X-CNS                                 CAT760  
                    MOVE 'X-CNS'            TO DL1-WS-MEMO-MSG          CAT760  
                  WHEN ADR-DELAYED-DELIVERY                             CAT760  
                    MOVE 'DELAYED DELIVERY' TO DL1-WS-MEMO-MSG          CAT760  
                  WHEN ADR-SAFE-KEEPING                                 CAT760  
                    MOVE 'SAFEKEEPING'      TO  DL1-WS-MEMO-MSG         CAT760  
                  WHEN ADR-RESTRICTED-SECURITY                          CAT760  
                    MOVE 'RESTRICTED SEC'   TO DL1-WS-MEMO-MSG          CAT760  
              END-EVALUATE                                              CAT760  
              MOVE DETAIL-LINE-1         TO PRINT-AREA                  CAT760  
              MOVE ' '                   TO CC                          CAT760  
                                                                        CAT760  
              PERFORM 725-PRINT-LINE THRU                               CAT760  
                      725-PRINT-LINE-EXIT.                              CAT760  
                                                                        CAT760  
       700-REPORTING-EXIT. EXIT.                                        CAT760  
                                                                        CAT760  
       725-PRINT-LINE.                                                  CAT760  
                                                                        CAT760  
           WRITE REPORT-REC FROM PRINTAREA.                             CAT760  
           IF CC = '1'                                                  CAT760  
             MOVE 3 TO LINECNT.                                         CAT760  
           IF CC = '-'                                                  CAT760  
             ADD 3 TO LINECNT.                                          CAT760  
           IF CC = '0'                                                  CAT760  
             ADD 2 TO LINECNT.                                          CAT760  
           IF CC = ' '                                                  CAT760  
             ADD 1 TO LINECNT.                                          CAT760  
                                                                        CAT760  
       725-PRINT-LINE-EXIT.  EXIT.                                      CAT760  
                                                                        CAT760  
       750-HEADERS.                                                     CAT760  
           MOVE SAVE-CLIENT             TO  TRAC-CLI.                   CAT760  
C00514     MOVE SAVE-CONTROLLER         TO  TRAC-CNTL.                  CAT760  
C00514     IF  SAVE-BRANCH NUMERIC                                      CAT760  
C00514         MOVE  SAVE-BRANCH TO WS-BRANCH                           CAT760  
C00514         MOVE  WS-BRANCH   TO TRAC-CNTL                           CAT760  
C00514     ELSE                                                         CAT760  
C00514         MOVE  ZERO TO TRAC-CNTL                                  CAT760  
C00514     END-IF.                                                      CAT760  
C00514     MOVE SAVE-BRANCH             TO  TRAC-CNTL.                  CAT760  
                                                                        CAT760  
           ADD  1       TO  PAGECNT.                                    CAT760  
           MOVE SAVE-CLIENT             TO  H1-CLIENT                   CAT760  
           MOVE SAVE-CLIENT-NAME        TO  H1-CLIENT-NAME.             CAT760  
           MOVE PAGECNT                 TO  H1-PGENO.                   CAT760  
           MOVE HDR1                    TO  PRINT-AREA.                 CAT760  
           MOVE '1'                     TO  CC.                         CAT760  
           PERFORM 725-PRINT-LINE THRU                                  CAT760  
                   725-PRINT-LINE-EXIT.                                 CAT760  
                                                                        CAT760  
           MOVE HDR2                    TO  PRINT-AREA.                 CAT760  
           MOVE '0'                     TO  CC.                         CAT760  
           PERFORM 725-PRINT-LINE THRU                                  CAT760  
                   725-PRINT-LINE-EXIT.                                 CAT760  
                                                                        CAT760  
           MOVE HDR3                    TO  PRINT-AREA.                 CAT760  
           MOVE '0'                     TO  CC.                         CAT760  
           PERFORM 725-PRINT-LINE THRU                                  CAT760  
                   725-PRINT-LINE-EXIT.                                 CAT760  
                                                                        CAT760  
           IF SAVE-TYPE-ACCOUNT = ZEROS                                 CAT760  
              MOVE SPACES            TO H4-ACCT-TYPE                    CAT760  
           ELSE                                                         CAT760  
              SET TYP-INDX TO 1                                         CAT760  
              SEARCH ACT-TYPE-ARRAY VARYING TYP-INDX                    CAT760  
                  AT END MOVE SPACES TO H4-ACCT-TYPE                    CAT760  
                WHEN ACT-TYPE (TYP-INDX) = SAVE-TYPE-ACCOUNT            CAT760  
                     MOVE ACT-TYPE-DESC (TYP-INDX) TO H4-ACCT-TYPE      CAT760  
              END-SEARCH                                                CAT760  
           END-IF                                                       CAT760  
                                                                        CAT760  
           EVALUATE SAVE-CURRENT-STATUS                                 CAT760  
               WHEN '200'                                               CAT760  
                    MOVE 'REVIEW'        TO  H4-STATUS                  CAT760  
               WHEN '210'                                               CAT760  
                    MOVE 'REVIEW ADJUST' TO  H4-STATUS                  CAT760  
               WHEN '220'                                               CAT760  
                    MOVE 'REVIEW ERROR'  TO  H4-STATUS                  CAT760  
               WHEN OTHER                                               CAT760  
                    MOVE SPACES          TO  H4-STATUS                  CAT760  
           END-EVALUATE.                                                CAT760  
                                                                        CAT760  
           MOVE HDR4                    TO  PRINT-AREA.                 CAT760  
           MOVE '-'                     TO  CC.                         CAT760  
           PERFORM 725-PRINT-LINE THRU                                  CAT760  
                   725-PRINT-LINE-EXIT.                                 CAT760  
                                                                        CAT760  
           MOVE SAVE-BRANCH             TO  H5-BRANCH.                  CAT760  
           MOVE SAVE-ACCOUNT            TO  H5-ACCOUNT.                 CAT760  
           MOVE SAVE-CONTRA-ACCT        TO  H5-CONTRA-BKR-ACCT.         CAT760  
           MOVE SAVE-CONTRA-BKR         TO  H5-CONTRA-BKR.              CAT760  
           MOVE SAVE-CNTL-NO            TO  H5-NSCC-CNTL.               CAT760  
                                                                        CAT760  
           MOVE HDR5                    TO  PRINT-AREA.                 CAT760  
           MOVE ' '                     TO  CC.                         CAT760  
           PERFORM 725-PRINT-LINE THRU                                  CAT760  
                   725-PRINT-LINE-EXIT.                                 CAT760  
                                                                        CAT760  
           IF SAVE-CONTROLLER = ZEROS                                   CAT760  
             MOVE SPACES                TO  H6-CONTROLLER               CAT760  
           ELSE                                                         CAT760  
             MOVE SAVE-CONTROLLER       TO  H6-CONTROLLER.              CAT760  
                                                                        CAT760  
           MOVE HDR6                    TO  PRINT-AREA.                 CAT760  
           MOVE ' '                     TO  CC.                         CAT760  
           PERFORM 725-PRINT-LINE THRU                                  CAT760  
                   725-PRINT-LINE-EXIT.                                 CAT760  
                                                                        CAT760  
       750-HEADERS-EXIT.  EXIT.                                         CAT760  
           EJECT                                                        CAT760  
       775-CASH-REPORTING.                                              CAT760  
                                                                        CAT760  
           MOVE SAVE-ACCT-TITLE (1:30)  TO  H7-ACCT-TITLE.              CAT760  
           MOVE WS-ACAT-ACCT-CASH-SMA   TO  H7-SMAT.                    CAT760  
           MOVE WS-ACAT-ACCT-CASH-TY01  TO  H7-BALANCE.                 CAT760  
           MOVE '01'                    TO  H7-TYPE.                    CAT760  
                                                                        CAT760  
           MOVE HDR7                    TO  PRINT-AREA.                 CAT760  
           MOVE '0'                     TO  CC.                         CAT760  
           PERFORM 725-PRINT-LINE THRU                                  CAT760  
                   725-PRINT-LINE-EXIT.                                 CAT760  
                                                                        CAT760  
           MOVE SAVE-ACCT-TITLE (31:21) TO  H7A-ACCT-TITLE.             CAT760  
           MOVE SAVE-SS-TAX-ID          TO  H7A-SS-TAX-ID.              CAT760  
           MOVE WS-ACAT-ACCT-CASH-TY02  TO  H7A-BALANCE.                CAT760  
           MOVE '02'                    TO  H7A-TYPE.                   CAT760  
           MOVE ' TY '                  TO  H7A-TY-LIT.                 CAT760  
                                                                        CAT760  
           MOVE HDR7A                   TO  PRINT-AREA.                 CAT760  
           MOVE ' '                     TO  CC.                         CAT760  
           PERFORM 725-PRINT-LINE THRU                                  CAT760  
                   725-PRINT-LINE-EXIT.                                 CAT760  
                                                                        CAT760  
           MOVE SPACES                  TO  HDR7A.                      CAT760  
           MOVE WS-ACAT-ACCT-CASH-TY05  TO  H7A-BALANCE.                CAT760  
           MOVE '05'                    TO  H7A-TYPE.                   CAT760  
           MOVE ' TY '                  TO  H7A-TY-LIT.                 CAT760  
                                                                        CAT760  
           MOVE HDR7A                   TO  PRINT-AREA.                 CAT760  
           MOVE ' '                     TO  CC.                         CAT760  
           PERFORM 725-PRINT-LINE THRU                                  CAT760  
                   725-PRINT-LINE-EXIT.                                 CAT760  
                                                                        CAT760  
      * CASH REPORTING COMPLETE NOW WRITE DETAIL HEADER                 CAT760  
                                                                        CAT760  
           MOVE HDR8                    TO  PRINT-AREA.                 CAT760  
           MOVE '0'                     TO  CC.                         CAT760  
           PERFORM 725-PRINT-LINE THRU                                  CAT760  
                   725-PRINT-LINE-EXIT.                                 CAT760  
                                                                        CAT760  
       775-CASH-REPORTING-EXIT. EXIT.                                   CAT760  
                                                                        CAT760  
       780-ACCOUNT-TOTALS.                                              CAT760  
           IF LINECNT > 45                                              CAT760  
             PERFORM 750-HEADERS THRU                                   CAT760  
                     750-HEADERS-EXIT                                   CAT760  
             MOVE HDR6C       TO  PRINT-AREA                            CAT760  
             MOVE ' '         TO  CC                                    CAT760  
             PERFORM 725-PRINT-LINE THRU                                CAT760  
                     725-PRINT-LINE-EXIT.                               CAT760  
                                                                        CAT760  
           MOVE 'TOTAL 01 VALUES:'      TO  TL-MSG.                     CAT760  
           MOVE WS-ACAT-ACCT-EQUITY-TY01 TO TL-VALUE.                   CAT760  
                                                                        CAT760  
           MOVE TOT-LINE                TO  PRINT-AREA.                 CAT760  
           MOVE '0'                     TO  CC.                         CAT760  
           PERFORM 725-PRINT-LINE THRU                                  CAT760  
                   725-PRINT-LINE-EXIT.                                 CAT760  
                                                                        CAT760  
           MOVE 'TOTAL 02 VALUES:'      TO  TL-MSG.                     CAT760  
           MOVE WS-ACAT-ACCT-EQUITY-TY02 TO TL-VALUE.                   CAT760  
                                                                        CAT760  
           MOVE TOT-LINE                TO  PRINT-AREA.                 CAT760  
           MOVE ' '                     TO  CC.                         CAT760  
           PERFORM 725-PRINT-LINE THRU                                  CAT760  
                   725-PRINT-LINE-EXIT.                                 CAT760  
                                                                        CAT760  
           MOVE 'TOTAL 05 VALUES:'      TO  TL-MSG.                     CAT760  
           MOVE WS-ACAT-ACCT-EQUITY-TY05 TO TL-VALUE.                   CAT760  
                                                                        CAT760  
           MOVE TOT-LINE                TO  PRINT-AREA.                 CAT760  
           MOVE ' '                     TO  CC.                         CAT760  
           PERFORM 725-PRINT-LINE THRU                                  CAT760  
                   725-PRINT-LINE-EXIT.                                 CAT760  
                                                                        CAT760  
           MOVE 'GRAND TOTAL '          TO  TL-MSG.                     CAT760  
           MOVE WS-ACAT-ACCT-EQUITY     TO  TL-VALUE.                   CAT760  
                                                                        CAT760  
           MOVE TOT-LINE                TO  PRINT-AREA.                 CAT760  
           MOVE ' '                     TO  CC.                         CAT760  
           PERFORM 725-PRINT-LINE THRU                                  CAT760  
                   725-PRINT-LINE-EXIT.                                 CAT760  
                                                                        CAT760  
           MOVE 'NET BALANCES '         TO  TL-MSG.                     CAT760  
           MOVE WS-ACAT-ACCT-CASH       TO  TL-VALUE.                   CAT760  
                                                                        CAT760  
           MOVE TOT-LINE                TO  PRINT-AREA.                 CAT760  
           MOVE ' '                     TO  CC.                         CAT760  
           PERFORM 725-PRINT-LINE THRU                                  CAT760  
                   725-PRINT-LINE-EXIT.                                 CAT760  
                                                                        CAT760  
      * DETERMINE CASH BALANCE TYPE - DEBIT OR CREDIT.                  CAT760  
           IF WS-ACAT-ACCT-CASH > ZERO                                  CAT760  
             MOVE 'D'                   TO  WS-TYPE-BAL.                CAT760  
                                                                        CAT760  
           IF WS-ACAT-ACCT-CASH < ZERO                                  CAT760  
             MOVE 'C'                   TO  WS-TYPE-BAL.                CAT760  
                                                                        CAT760  
      * DROP THE SIGN                                                   CAT760  
           MOVE WS-ACAT-ACCT-CASH       TO  CASH-BAL.                   CAT760  
                                                                        CAT760  
      * CREDITS INCREASES TOTAL EQUITY, DEBITS DECREASE EQUITY          CAT760  
                                                                        CAT760  
           IF CASH-BAL = ZERO                                           CAT760  
             MOVE WS-ACAT-ACCT-EQUITY   TO  WS-ACAT-ACCT-TOT-EQUITY.    CAT760  
                                                                        CAT760  
           IF WS-CREDIT-BAL                                             CAT760  
             COMPUTE WS-ACAT-ACCT-TOT-EQUITY = WS-ACAT-ACCT-EQUITY      CAT760  
                                          + CASH-BAL.                   CAT760  
                                                                        CAT760  
           IF WS-DEBIT-BAL                                              CAT760  
             COMPUTE WS-ACAT-ACCT-TOT-EQUITY = WS-ACAT-ACCT-EQUITY      CAT760  
                                          - CASH-BAL.                   CAT760  
                                                                        CAT760  
           MOVE 'EQUITY '               TO  TL-MSG.                     CAT760  
           MOVE WS-ACAT-ACCT-TOT-EQUITY TO  TL-VALUE.                   CAT760  
                                                                        CAT760  
           IF WS-ACAT-ACCT-TOT-EQUITY < ZERO                            CAT760  
             MOVE SPACES                TO  EQ-PREFIX                   CAT760  
             MOVE TL-VALUE-X            TO  EQ-NUMX                     CAT760  
             MOVE SPACE                 TO  WS-EQUITY-PROCESS-SW        CAT760  
             MOVE 1                     TO  EQ-SUB                      CAT760  
             PERFORM UNTIL WS-EQUITY-PROCESS-DONE                       CAT760  
      * FIRST POSSIBLE NON SPACE CHAR IS POSITION 5                     CAT760  
               IF EQ-CHAR (EQ-SUB) NOT = SPACE                          CAT760  
                 SUBTRACT 4 FROM EQ-SUB GIVING MVE-SUB                  CAT760  
                 MOVE '***'      TO  EQUITY-NUM (MVE-SUB:3)             CAT760  
                 MOVE EQUITY-NUM TO  TOT-LINE (77:25)                   CAT760  
                 MOVE 'Y'        TO  WS-EQUITY-PROCESS-SW               CAT760  
               END-IF                                                   CAT760  
               ADD 1             TO  EQ-SUB                             CAT760  
             END-PERFORM                                                CAT760  
             MOVE '***'          TO  TL-AST                             CAT760  
           END-IF.                                                      CAT760  
                                                                        CAT760  
           MOVE TOT-LINE                TO  PRINT-AREA.                 CAT760  
           MOVE ' '                     TO  CC.                         CAT760  
           PERFORM 725-PRINT-LINE THRU                                  CAT760  
                   725-PRINT-LINE-EXIT.                                 CAT760  
                                                                        CAT760  
           MOVE SPACES                TO  TOT-LINE.                     CAT760  
                                                                        CAT760  
           IF WS-ACAT-DELETED                                           CAT760  
             IF LINECNT > 45                                            CAT760  
               PERFORM 750-HEADERS THRU                                 CAT760  
                       750-HEADERS-EXIT                                 CAT760  
               MOVE HDR6C       TO  PRINT-AREA                          CAT760  
               MOVE ' '         TO  CC                                  CAT760  
               PERFORM 725-PRINT-LINE THRU                              CAT760  
                       725-PRINT-LINE-EXIT                              CAT760  
             END-IF                                                     CAT760  
             MOVE DELETE-MSG-LINE1 TO  PRINT-AREA                       CAT760  
             MOVE '0'              TO  CC                               CAT760  
             PERFORM 725-PRINT-LINE THRU                                CAT760  
                     725-PRINT-LINE-EXIT                                CAT760  
             MOVE DELETE-MSG-LINE2 TO  PRINT-AREA                       CAT760  
             MOVE ' '              TO  CC                               CAT760  
             PERFORM 725-PRINT-LINE THRU                                CAT760  
                     725-PRINT-LINE-EXIT                                CAT760  
             MOVE DELETE-MSG-LINE3 TO  PRINT-AREA                       CAT760  
             MOVE ' '              TO  CC                               CAT760  
             PERFORM 725-PRINT-LINE THRU                                CAT760  
                     725-PRINT-LINE-EXIT                                CAT760  
             MOVE DELETE-MSG-LINE2 TO  PRINT-AREA                       CAT760  
             MOVE ' '              TO  CC                               CAT760  
             PERFORM 725-PRINT-LINE THRU                                CAT760  
                     725-PRINT-LINE-EXIT                                CAT760  
             MOVE DELETE-MSG-LINE1 TO  PRINT-AREA                       CAT760  
             MOVE ' '              TO  CC                               CAT760  
             PERFORM 725-PRINT-LINE THRU                                CAT760  
                     725-PRINT-LINE-EXIT                                CAT760  
           END-IF.                                                      CAT760  
                                                                        CAT760  
      * CHECK FOR OPTION DATA IF PRESENT WRITE OPTION LINES NOW         CAT760  
                                                                        CAT760  
           IF ACT-OPTION-CTR = ZERO                                     CAT760  
             GO TO 780-MEMO-PROCESSING.                                 CAT760  
                                                                        CAT760  
           MOVE ' OPTION INFORMATION '   TO  ASTERICK-LINE (35:20).     CAT760  
           IF LINECNT > 45                                              CAT760  
             PERFORM 750-HEADERS THRU                                   CAT760  
                     750-HEADERS-EXIT                                   CAT760  
             MOVE HDR6C       TO  PRINT-AREA                            CAT760  
             MOVE ' '         TO  CC                                    CAT760  
             PERFORM 725-PRINT-LINE THRU                                CAT760  
                     725-PRINT-LINE-EXIT.                               CAT760  
                                                                        CAT760  
           MOVE ASTERICK-LINE TO  PRINT-AREA.                           CAT760  
           MOVE '0'           TO  CC.                                   CAT760  
           PERFORM 725-PRINT-LINE THRU                                  CAT760  
                   725-PRINT-LINE-EXIT.                                 CAT760  
                                                                        CAT760  
           MOVE OPT-HDR1      TO  PRINT-AREA.                           CAT760  
           MOVE ' '           TO  CC.                                   CAT760  
           PERFORM 725-PRINT-LINE THRU                                  CAT760  
                   725-PRINT-LINE-EXIT.                                 CAT760  
                                                                        CAT760  
           MOVE OPT-HDR2      TO  PRINT-AREA.                           CAT760  
           MOVE ' '           TO  CC.                                   CAT760  
           PERFORM 725-PRINT-LINE THRU                                  CAT760  
                   725-PRINT-LINE-EXIT.                                 CAT760  
                                                                        CAT760  
           MOVE 1             TO  OPT-SUB.                              CAT760  
           PERFORM UNTIL OPT-SUB > ACT-OPTION-CTR                       CAT760  
                                                                        CAT760  
             IF LINECNT > 45                                            CAT760  
               PERFORM 750-HEADERS THRU                                 CAT760  
                       750-HEADERS-EXIT                                 CAT760  
               MOVE HDR6C       TO  PRINT-AREA                          CAT760  
               MOVE ' '         TO  CC                                  CAT760  
               PERFORM 725-PRINT-LINE THRU                              CAT760  
                       725-PRINT-LINE-EXIT                              CAT760  
                                                                        CAT760  
               MOVE ASTERICK-LINE TO  PRINT-AREA                        CAT760  
               MOVE '0'           TO  CC                                CAT760  
               PERFORM 725-PRINT-LINE THRU                              CAT760  
                       725-PRINT-LINE-EXIT                              CAT760  
                                                                        CAT760  
               MOVE OPT-HDR1      TO  PRINT-AREA                        CAT760  
               MOVE ' '           TO  CC                                CAT760  
               PERFORM 725-PRINT-LINE THRU                              CAT760  
                       725-PRINT-LINE-EXIT                              CAT760  
                                                                        CAT760  
               MOVE OPT-HDR2      TO  PRINT-AREA                        CAT760  
               MOVE ' '           TO  CC                                CAT760  
               PERFORM 725-PRINT-LINE THRU                              CAT760  
                       725-PRINT-LINE-EXIT                              CAT760  
             END-IF                                                     CAT760  
                                                                        CAT760  
             MOVE ACT-OPT-QTY   (OPT-SUB)  TO  OPDTL-QTY                CAT760  
             IF ACT-OPT-BUY-SELL  (OPT-SUB) = 'B'                       CAT760  
               MOVE 'BUY'                  TO  OPDTL-BUY-SELL           CAT760  
             ELSE                                                       CAT760  
               MOVE 'SELL'                 TO  OPDTL-BUY-SELL           CAT760  
             END-IF                                                     CAT760  
                                                                        CAT760  
             IF ACT-OPT-PUT-CALL (OPT-SUB) = 'P'                        CAT760  
               MOVE 'PUT'                  TO  OPDTL-PUT-CALL           CAT760  
             ELSE                                                       CAT760  
               MOVE 'CALL'                 TO  OPDTL-PUT-CALL           CAT760  
             END-IF                                                     CAT760  
                                                                        CAT760  
             IF ACT-OPT-OPEN-CLOSE (OPT-SUB) = 'O'                      CAT760  
               MOVE 'OPEN'                 TO  OPDTL-OPEN-CLOSE         CAT760  
             ELSE                                                       CAT760  
               MOVE 'CLOSE'                TO  OPDTL-OPEN-CLOSE         CAT760  
             END-IF                                                     CAT760  
                                                                        CAT760  
             MOVE ACT-OPT-SYMBOL (OPT-SUB) TO  OPDTL-SYMBOL             CAT760  
             MOVE ACT-OPT-EXPIRE-MM (OPT-SUB) TO  OPDTL-EXPIRE-MM       CAT760  
             MOVE ACT-OPT-EXPIRE-YY (OPT-SUB) TO  OPDTL-EXPIRE-YY       CAT760  
      * MOVE PRICE INTEGER                                              CAT760  
             MOVE ACT-OPT-PRICE (OPT-SUB)       TO  FTD-NUM             CAT760  
             MOVE ACT-OPT-1-8TH-PRICE (OPT-SUB) TO PR-SUB               CAT760  
      * ADD PRICE FRACTION IN 8THS                                      CAT760  
             IF ACT-OPT-1-8TH-PRICE (OPT-SUB) = ZERO                    CAT760  
               CONTINUE                                                 CAT760  
             ELSE                                                       CAT760  
               COMPUTE FTD-NUM = FTD-NUM +                              CAT760  
                                 FTD-VALUES (PR-SUB)                    CAT760  
             END-IF                                                     CAT760  
                                                                        CAT760  
      * MOVE PRICE TO PRINT LINE                                        CAT760  
             MOVE FTD-NUM                        TO  OPDTL-PRICE        CAT760  
             MOVE ACT-OPT-OPTION-DATA (OPT-SUB)  TO  OPDTL-DATA         CAT760  
                                                                        CAT760  
             MOVE OPT-DETAIL                     TO  PRINT-AREA         CAT760  
             MOVE '0'                            TO  CC                 CAT760  
             PERFORM 725-PRINT-LINE THRU                                CAT760  
                     725-PRINT-LINE-EXIT                                CAT760  
                                                                        CAT760  
             ADD 1 TO  OPT-SUB                                          CAT760  
           END-PERFORM.                                                 CAT760  
                                                                        CAT760  
           MOVE ZERO  TO  ACT-OPTION-CTR.                               CAT760  
                                                                        CAT760  
       780-MEMO-PROCESSING.                                             CAT760  
                                                                        CAT760  
           IF ACT-MEMO-CTR = ZERO                                       CAT760  
             GO TO 780-ACCOUNT-TOTALS-EXIT.                             CAT760  
                                                                        CAT760  
           MOVE '** MEMO INFORMATION '  TO  ASTERICK-LINE (35:20).      CAT760  
                                                                        CAT760  
           IF LINECNT > 50                                              CAT760  
             PERFORM 750-HEADERS THRU                                   CAT760  
                     750-HEADERS-EXIT                                   CAT760  
             MOVE HDR6C       TO  PRINT-AREA                            CAT760  
             MOVE ' '         TO  CC                                    CAT760  
             PERFORM 725-PRINT-LINE THRU                                CAT760  
                     725-PRINT-LINE-EXIT.                               CAT760  
                                                                        CAT760  
           MOVE ASTERICK-LINE TO  PRINT-AREA.                           CAT760  
           MOVE '0'           TO  CC.                                   CAT760  
           PERFORM 725-PRINT-LINE THRU                                  CAT760  
                   725-PRINT-LINE-EXIT.                                 CAT760  
                                                                        CAT760  
           MOVE SPACES        TO  PRINT-AREA.                           CAT760  
           MOVE ' '           TO  CC.                                   CAT760  
           PERFORM 725-PRINT-LINE THRU                                  CAT760  
                   725-PRINT-LINE-EXIT.                                 CAT760  
                                                                        CAT760  
           MOVE 1             TO MEMO-SUB.                              CAT760  
           PERFORM UNTIL MEMO-SUB > ACT-MEMO-CTR                        CAT760  
                                                                        CAT760  
             IF LINECNT > 50                                            CAT760  
               PERFORM 750-HEADERS THRU                                 CAT760  
                       750-HEADERS-EXIT                                 CAT760  
               MOVE HDR6C       TO  PRINT-AREA                          CAT760  
               MOVE ' '         TO  CC                                  CAT760  
               PERFORM 725-PRINT-LINE THRU                              CAT760  
                       725-PRINT-LINE-EXIT                              CAT760  
                                                                        CAT760  
               MOVE ASTERICK-LINE TO  PRINT-AREA                        CAT760  
               MOVE '0'           TO  CC                                CAT760  
               PERFORM 725-PRINT-LINE THRU                              CAT760  
                       725-PRINT-LINE-EXIT                              CAT760  
                                                                        CAT760  
               MOVE SPACES        TO  PRINT-AREA                        CAT760  
               MOVE ' '           TO  CC                                CAT760  
               PERFORM 725-PRINT-LINE THRU                              CAT760  
                       725-PRINT-LINE-EXIT                              CAT760  
             END-IF                                                     CAT760  
                                                                        CAT760  
             MOVE ACT-MEMO-DESC (MEMO-SUB)  TO  PRINT-AREA (8:120)      CAT760  
             MOVE ' '           TO  CC                                  CAT760  
             PERFORM 725-PRINT-LINE THRU                                CAT760  
                     725-PRINT-LINE-EXIT                                CAT760  
                                                                        CAT760  
             ADD 1              TO  MEMO-SUB                            CAT760  
           END-PERFORM.                                                 CAT760  
                                                                        CAT760  
           MOVE ZERO            TO  ACT-MEMO-CTR.                       CAT760  
                                                                        CAT760  
       780-ACCOUNT-TOTALS-EXIT. EXIT.                                   CAT760  
           EJECT                                                        CAT760  
       800-SQL-ERROR SECTION.                                           CAT760  
           DISPLAY '800-SQL-ERROR'                                      CAT760  
                                                                        CAT760  
           PERFORM 820-DISPLAY-DB2-MSG THRU 820-EXIT                    CAT760  
                                                                        CAT760  
           DISPLAY ' '                                                  CAT760  
           CALL DSNTIAR USING SQLCA WS-DB2-MESSAGE-AREA                 CAT760  
                                    WS-DB2-MESSAGE-LEN.                 CAT760  
           PERFORM VARYING WS-DB2-IDX FROM 1 BY 1                       CAT760  
             UNTIL WS-DB2-IDX GREATER THAN 12                           CAT760  
                   IF WS-DB2-ERROR-MSG (WS-DB2-IDX) > SPACES            CAT760  
                      DISPLAY WS-DB2-ERROR-MSG (WS-DB2-IDX)             CAT760  
                   END-IF                                               CAT760  
           END-PERFORM.                                                 CAT760  
                                                                        CAT760  
       800-EXIT. EXIT.                                                  CAT760  
       820-DISPLAY-DB2-MSG SECTION.                                     CAT760  
                                                                        CAT760  
           DISPLAY ' '                                                  CAT760  
           CALL DSNTIAR USING SQLCA WS-DB2-MESSAGE-AREA                 CAT760  
                                    WS-DB2-MESSAGE-LEN.                 CAT760  
           PERFORM VARYING WS-DB2-IDX FROM 1 BY 1                       CAT760  
             UNTIL WS-DB2-IDX GREATER THAN 12                           CAT760  
                   IF WS-DB2-ERROR-MSG (WS-DB2-IDX) > SPACES            CAT760  
                      DISPLAY WS-DB2-ERROR-MSG (WS-DB2-IDX)             CAT760  
                   END-IF                                               CAT760  
           END-PERFORM.                                                 CAT760  
                                                                        CAT760  
       820-EXIT. EXIT.                                                  CAT760  
       900-ENDJOB-ROUTINE.                                              CAT760  
                                                                        CAT760  
           IF WS-ACAT-DTL-RECS = ZERO                                   CAT760  
             GO TO 910-CONTROL-TOTALS.                                  CAT760  
                                                                        CAT760  
           IF WS-ACAT-CASH-REPORTED                                     CAT760  
             IF (ADR-CONTROLLER = ZEROS AND ADR-BRANCH = SPACES) OR     CAT760  
                ADR-BRANCH     = SPACES                                 CAT760  
               CONTINUE                                                 CAT760  
             ELSE                                                       CAT760  
               PERFORM 780-ACCOUNT-TOTALS THRU                          CAT760  
                       780-ACCOUNT-TOTALS-EXIT                          CAT760  
             END-IF                                                     CAT760  
           ELSE                                                         CAT760  
              PERFORM 750-HEADERS THRU                                  CAT760  
                      750-HEADERS-EXIT                                  CAT760  
              PERFORM 775-CASH-REPORTING THRU                           CAT760  
                      775-CASH-REPORTING-EXIT                           CAT760  
              IF (ADR-CONTROLLER = ZEROS AND ADR-BRANCH = SPACES) OR    CAT760  
                 ADR-BRANCH     = SPACES                                CAT760  
                CONTINUE                                                CAT760  
              ELSE                                                      CAT760  
               PERFORM 780-ACCOUNT-TOTALS THRU                          CAT760  
                       780-ACCOUNT-TOTALS-EXIT                          CAT760  
              END-IF                                                    CAT760  
           END-IF.                                                      CAT760  
           EXEC SQL CLOSE VTRNCS                                        CAT760  
           END-EXEC.                                                    CAT760  
       910-CONTROL-TOTALS.                                              CAT760  
                                                                        CAT760  
           DISPLAY '************ CAT760 CONTROL TOTALS *************'.  CAT760  
           DISPLAY ' CLIENT TOTALS '.                                   CAT760  
           MOVE 1 TO B6-SUB.                                            CAT760  
           PERFORM UNTIL B6-SUB > B1-TBL-CNT                            CAT760  
             DISPLAY 'CLIENT - ' B1-ADP-CL-NO (B6-SUB) ' '              CAT760  
                     B1-CLI-NAME (B6-SUB) '  REPORT RECORDS WRITTEN - ' CAT760  
                     B1-RCD-CNT (B6-SUB)                                CAT760  
             ADD 1 TO B6-SUB                                            CAT760  
           END-PERFORM.                                                 CAT760  
                                                                        CAT760  
           DISPLAY 'ACAT DETAIL RCDS READ     '     WS-ACAT-DTL-RECS.   CAT760  
                                                                        CAT760  
           CLOSE REPORT-FILE.                                           CAT760  
                                                                        CAT760  
       900-ENDJOB-ROUTINE-EXIT. EXIT.                                   CAT760  
                                                                        CAT760  
