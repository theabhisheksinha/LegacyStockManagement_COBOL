000001* PDX    - CAT670NS C0322803 03/10/12 16:06:34 TBLAMUR            00001008
LRM003* SSR 83091 CLIENT 10 CHARGE FOREIGN FEE FOR LEGACY ACCOUNTS.     00001105
000001* PDX    - CAT670NS C0296621 10/14/10 14:42:21 TBLAMUR            00001200
LRM002* SSR 71810 CHANGE FOREIGN ASSET CUSTODIAL FEES B1 434913 434755  00003000
LRM002*   FOR PTR,PTD ONLY, FOR EACH APPLICABLE ASSET.                  00004000
LRM002*   THIS PROCESS IS DRIVEN BY THE CAT650DB.ACATPEND FILE.         00004100
LRM002*   RULES ARE B1 STREETSIDE AC IS FOUND ON STOCK RECORD FOR THIS  00005000
LRM002*      SECURITY, AND MSD HAS CNS=N, AND ISIN(1:2) NOT 'US'.       00006000
LRM002*             10/13/10 REMOVED DTC=Y FROM THE BYPASS.             00007000
LRM002*   TO CAUSE THIS, READ MSD FOR ISIN, APPLY B1 MATCHING AND FEE   00008000
LRM002*   CREATION LOGIC IN A SIMILIAR MANNER AS CAT820.                00009000
LRM002*   THE FEE/DEBIT IS APPLIED TO THE CUSTOMER ACCOUNT, NOT ADDED   00009100
LRM002*   TO THE ACAT TYPE1 BALANCE ON THE SETTLEMENT DATE.             00009200
000001* PDX    - CAT670NS C0272055 11/11/08 16:03:57 TBLAMUR            00010000
LRM001* SSR 60125 RECOMPILE FOR EXPANSION TO ACATPEND                   00020000
000001* PDX    - CAT670NS C0218823 05/09/05 10:41:11 TBLAMUR            00030000
       IDENTIFICATION DIVISION.                                         00040000
       PROGRAM-ID.  CAT670NS.                                           00050000
                                                                        00060000
      *-------------------------------------------------------------*   00070000
      *  THE PURPOSE OF THIS PROGRAM IS TO BOOK ACAT TRANSFER FEES      00080000
      *    FOR PTR BASED ON B1S 434706,904,922.                         00090000
      *  PROGRAM WAS MODELLED FROM CAT820 AND CAT670 ON 03-23-05.       00100000
      * 05/09/05 ADDED FUNCTION TO EXTRACT INTRA-DAY P2 DETAILS         00110000
      *    (LIQUIDATION RECORDS) COMBINE THEM INTO THE TIF FILE         00120000
      *-------------------------------------------------------------*   00130000
                                                                        00140000
       ENVIRONMENT DIVISION.                                            00150000
                                                                        00160000
       INPUT-OUTPUT SECTION.                                            00170000
       FILE-CONTROL.                                                    00180000
                                                                        00190000
           SELECT PEND-I-FILE      ASSIGN PENDFLI.                      00200000
           SELECT P2-ID-FILE       ASSIGN P2ID.                         00210000
                                                                        00220000
           SELECT P2BKPG-FILE      ASSIGN P2BKPG.                       00230000
                                                                        00240000
       DATA DIVISION.                                                   00250000
       FILE SECTION.                                                    00260000
       FD  PEND-I-FILE                                                  00270000
           RECORDING MODE IS V                                          00280000
           LABEL RECORDS ARE STANDARD                                   00290000
           BLOCK CONTAINS 0 RECORDS.                                    00300000
       COPY ACATPEND REPLACING ==:FMT:== BY ==PEND==.                   00310000
                                                                        00320000
       FD  P2-ID-FILE                                                   00330000
           RECORDING MODE IS F                                          00340000
           LABEL RECORDS ARE STANDARD                                   00350000
           BLOCK CONTAINS 0 RECORDS.                                    00360000
       01  P2-ID-REC                   PIC X(120).                      00370000
                                                                        00380000
       FD  P2BKPG-FILE                                                  00390000
           RECORDING MODE IS F                                          00400000
           LABEL RECORDS STANDARD                                       00410000
           BLOCK CONTAINS 0 RECORDS                                     00420000
           RECORD CONTAINS 120 CHARACTERS.                              00430000
       01  P2BKPG-RECORD               PIC X(120).                      00440000
                                                                        00450000
           EJECT                                                        00460000
       WORKING-STORAGE SECTION.                                         00470000
                                                                        00480000
       01  FILE-STATUS-FIELDS.                                          00490000
           05  REG-FILE-STATUS            PIC XX.                       00500000
               88  REG-FILE-INVALID-KEY         VALUE '20' THRU '29'.   00510000
           05  PEND-FILE-STATUS           PIC XX.                       00520000
               88  IO-ACTION-OK               VALUE '00'  '97'.         00530000
               88  PEND-FILE-AT-END           VALUE '10'.               00540000
               88  PEND-INVALID-KEY           VALUE '20' THRU '29'.     00550000
           COPY STUBCPY.                                                00560000
LRM002 01  ZMSRIO                   PIC  X(08)      VALUE 'ZMSRIO'.     00570000
       01  WORK-FIELDS.                                                 00580000
           05  PGM-NME                 PIC X(8)  VALUE 'CAT670NS'.      00590000
           05  WS-SAVE-CLIENT          PIC 9(3)  VALUE ZERO.            00600000
           05  WS-BROKER-CLEARING-NUM  PIC XXXX.                        00610000
           05  WS-CLIENT-NAME          PIC X(30).                       00620000
           05  CLIENT-STREAM           PIC X.                           00630000
           05  W-SUB1                  PIC  9(004) VALUE 0.             00640000
           05  B1-SUB                  PIC 999 COMP-3 VALUE 0.          00650000
           05  B1-SUB1                 PIC 999 COMP-3 VALUE 0.          00660000
           05  B6-SUB                  PIC 999 COMP-3 VALUE 0.          00670000
           05  B7-SUB                  PIC 999 COMP-3 VALUE 0.          00680000
           05  B9-SUB                  PIC 999 COMP-3 VALUE 0.          00690000
           05  B11-SUB                 PIC 999 COMP-3 VALUE 0.          00700000
LRM002     05  B13-SUB                 PIC 999 COMP-3 VALUE 0.          00710000
           05  I-SUB                   PIC 999 COMP-3 VALUE 0.          00720000
           05  IRA-SUB                 PIC 999 COMP-3 VALUE 0.          00730000
           05  B1-TBL-CNT              PIC 999 COMP-3 VALUE 0.          00740000
           05  ABEND-CODE              PIC S9(4) COMP VALUE ZERO.       00750000
      *ABORT AND SPIE CODES                                             00760000
           05  ABORT-CODE              PIC S9(4) COMP SYNC VALUE 99.    00770000
      * FIELDS FOR MOVING SOME B1 DATA SPEC 9(5) ACTUALLY 9(3)V99       00780000
           05  XFER-FEE-IN             PIC 9(5).                        00790000
           05  XFER-FEE-ACTUAL REDEFINES XFER-FEE-IN                    00800000
                                       PIC 9(3)V99.                     00810000
           05  XFER-IND-AREA           PIC X(35).                       00820000
           05  FILLER REDEFINES XFER-IND-AREA.                          00830000
               10  XFER-IND-TEST OCCURS 35 TIMES                        00840000
                                       PIC X.                           00850000
           05  MAINT-WORK              PIC 9(3)V99 COMP-3 VALUE ZERO.   00860000
           05  TEST-XFER-BATCH-ENTRY   PIC X(06).                       00870000
           05  CURRENT-ACCOUNT-KEY.                                     00880000
               10  CAK-CLIENT          PIC 9(3).                        00890000
               10  CAK-BRAC.                                            00900000
                   12  CAK-BRANCH      PIC X(3).                        00910000
                   12  CAK-ACCOUNT     PIC X(5).                        00920000
           05  WS-DATE-YYMMDD          PIC X(06).                       00930000
           05  WS-DATE-CCYYMMDD        PIC X(08).                       00940000
LRM002     05  WK-CNS-IND              PIC X(01)  VALUE 'N'.            00950000
LRM002     05  WK-DTC-IND              PIC X(01)  VALUE 'N'.            00960000
LRM002     05  WK-MS-CLASS.                                             00970000
LRM002         10  WK-MS-CLASS-1       PIC 9.                           00980000
LRM002         10  WK-MS-CLASS-2-5     PIC 9(4).                        00990000
LRM002         10  WK-MS-CLASS-6-7     PIC 9(2).                        01000000
LRM002     05  WK-MS-SEC-TYPE-P        PIC 9(5)   COMP-3  VALUE 0.      01010000
LRM002     05  FILLER                  REDEFINES WK-MS-SEC-TYPE-P.      01020000
LRM002         10  WK-MS-SEC-TYPE-X    PIC X(2).                        01030000
LRM002         10  FILLER              PIC 9.                           01040000
LRM002     05  WK-MS-SEC-TYPE-N        PIC 9(5)   VALUE 0.              01050000
LRM002     05  FILLER                  REDEFINES WK-MS-SEC-TYPE-N.      01060000
LRM002         10  WK-MS-SEC-TYPE      PIC 9(4).                        01070000
LRM002         10  FILLER              PIC 9.                           01080000
LRM002     05  WK-TRNFR-TYPE           PIC X(03)  VALUE SPACES.         01090000
LRM002     05  WK-STATUS-CD            PIC X(03)  VALUE SPACES.         01100000
LRM003     05  WS-LEGACY-ACCOUNT-SW    PIC X VALUE 'N'.                 01101001
LRM003         88  LEGACY-ACCOUNT                  VALUE 'Y'.           01102001
LRM003         88  NOT-LEGACY-ACCOUNT              VALUE 'N'.           01103001
                                                                        01110000
       01  XFER-FEE-DESCRIPTION.                                        01120000
           05  XFE-MSG           PIC X(18).                             01130000
           05  XFE-AMOUNT        PIC ZZ9.99.                            01140000
       01  FEE-WORK-AREA.                                               01150000
           05  XFER-FEE-REG            PIC 9(3)V99      VALUE ZERO.     01160000
           05  XFER-FEE-OFFSET         PIC X(09)        VALUE SPACES.   01170000
           05  XFER-FEE-REG-BATCH      PIC X(2)         VALUE SPACES.   01180000
           05  XFER-FEE-REG-ENTRY      PIC X(3)         VALUE SPACES.   01190000
           05  XFER-FEE-IRA            PIC 9(3)V99      VALUE ZERO.     01200000
           05  XFER-FEE-IRA-OFFSET     PIC X(09)        VALUE SPACES.   01210000
           05  XFER-FEE-IRA-BATCH      PIC X(2)         VALUE SPACES.   01220000
           05  XFER-FEE-IRA-ENTRY      PIC X(3)         VALUE SPACES.   01230000
           05  MAINT-FEE-IRA           PIC 9(3)V99      VALUE ZERO.     01240000
           05  MAINT-FEE-IRA-OFFSET    PIC X(09)        VALUE SPACES.   01250000
           05  MAINT-FEE-BATCH         PIC X(2)         VALUE SPACES.   01260000
           05  MAINT-FEE-ENTRY         PIC X(3)         VALUE SPACES.   01270000
           05  FEE-WORK                PIC 9(3)V99      VALUE ZERO.     01280000
LRM002     05  FRGN-FEE-AMT            PIC 9(5)V99      VALUE ZERO.     01290000
LRM002     05  FRGN-FEE-OFFSET         PIC X(09)        VALUE SPACES.   01300000
LRM002     05  FRGN-FEE-BATCH          PIC X(2)         VALUE SPACES.   01310000
LRM002     05  FRGN-FEE-ENTRY          PIC X(3)         VALUE SPACES.   01320000
                                                                        01330000
       01  COUNTERS COMP-3.                                             01340000
           02  JOB-COUNTERS.                                            01350000
               05  PEND-DTL-RECS               PIC 9(7) VALUE ZERO.     01360000
LRM002         05  PEND-PRTL-FEE-RECS          PIC 9(7) VALUE ZERO.     01370000
LRM002         05  PEND-FOREIGN-FEE-CHARGED    PIC 9(7) VALUE ZERO.     01380000
               05  PEND-BYP-CLI                PIC 9(7) VALUE ZERO.     01390000
               05  PEND-BYP-RANGE              PIC 9(7) VALUE ZERO.     01400000
               05  P2-ID-DETAILS               PIC 9(11) VALUE ZERO.    01410000
               05  P2-RECS-WRTN                PIC 9(11) VALUE ZERO.    01420000
                                                                        01430000
           EJECT                                                        01440000
       01  SWITCHES.                                                    01450000
           05  ACAT-FIRST-TIME-SW            PIC X VALUE 'Y'.           01460000
               88  ACAT-FIRST-TIME                 VALUE 'Y'.           01470000
           05  PEND-FILE-EOF-SW              PIC X VALUE ' '.           01480000
               88  PEND-END-OF-FILE                VALUE 'Y'.           01490000
           05  P2-ID-FILE-EOF-SW             PIC X VALUE ' '.           01500000
               88  P2-ID-END-OF-FILE               VALUE 'Y'.           01510000
           05  ACAT-RECORD-SW                PIC X VALUE ' '.           01520000
               88  ACAT-RECORD-WRITTEN             VALUE 'Y'.           01530000
           05  MEMO-SEARCH-SW                PIC X VALUE ' '.           01540000
               88  END-OF-MEMO-SEARCH              VALUE 'Y'.           01550000
           05  B1-TABLE-SEARCH-STATUS        PIC X VALUE ' '.           01560000
               88  B1-ENTRY-FOUND                  VALUE 'Y'.           01570000
               88  B1-ENTRY-NOT-FOUND              VALUE 'N'.           01580000
           05  B1-TABLE-SEARCH-SWITCH        PIC X VALUE ' '.           01590000
               88  B1-SEARCH-END                   VALUE 'Y'.           01600000
           05  B1-RANGE-SEARCH-STATUS        PIC X VALUE ' '.           01610000
               88  B1-RANGE-FOUND                  VALUE 'Y'.           01620000
               88  B1-RANGE-NOT-FOUND              VALUE 'N'.           01630000
           05  B1-RANGE-SEARCH-SWITCH        PIC X VALUE ' '.           01640000
               88  B1-RANGE-SEARCH-END             VALUE 'Y'.           01650000
           05  ACAT-EXCLUDE-SW               PIC X VALUE 'N'.           01660000
               88  EXCLUDE-THIS-REC                VALUE 'Y'.           01670000
           05 CLIENT-ACCOUNT-SEARCH-STATUS   PIC X.                     01680000
               88 CLIENT-ACCT-SEARCH-PENDING     VALUE 'P'.             01690000
               88 DONE-SEARCHING-CLIENT-ACCT     VALUE 'F' 'N'.         01700000
           05 CLIENT-ACCOUNT-STATUS          PIC X.                     01710000
               88 CLIENT-ACCT-ACTIVE             VALUE 'F'.             01720000
               88 CLIENT-ACCT-NOT-ACTIVE         VALUE 'N'.             01730000
           05  ACCOUNT-ITEM-IND              PIC X.                     01740000
               88 ACTIVE-ACCOUNT-ITEM            VALUE 'A'.             01750000
               88 NOT-ACTIVE-ACCOUNT-ITEM        VALUE 'I'.             01760000
           05  ACCOUNT-IND                   PIC X.                     01770000
               88 ACTIVE-ACCOUNT                 VALUE 'A'.             01780000
               88 NOT-ACTIVE-ACCOUNT             VALUE 'I'.             01790000
               88 INACTIVE-ACCOUNT               VALUE 'I'.             01800000
           05  B1-RESULT                     PIC X.                     01810000
               88 CLIENT-NOT-FOUND               VALUE '9'.             01820000
               88 CLIENT-FOUND                   VALUE '0'.             01830000
               88 NO-MORE-CLIENTS                VALUE 'X'.             01840000
           05  NEW-ACCOUNT-SW                PIC X VALUE 'N'.           01850000
               88  NEW-ACCOUNT                   VALUE 'Y'.             01860000
           05  P2-PROCESS-TYPE               PIC X VALUE ' '.           01870000
LRM002         88  P2-FOREIGN                      VALUE 'F'.           01880000
               88  P2-XFER                         VALUE 'X'.           01890000
               88  P2-XFER-IRA                     VALUE 'Y'.           01900000
               88  P2-MAINT                        VALUE 'M'.           01910000
           05  IRA-ACCOUNT-IND               PIC X VALUE ' '.           01920000
               88  IRA-ACCOUNT                     VALUE 'Y'.           01930000
               88  NON-IRA-ACCOUNT                 VALUE 'N'.           01940000
           05  MGCA-IRA-ACCOUNT-IND          PIC X VALUE ' '.           01950000
               88  MGCA-IRA-ACCOUNT                VALUE 'Y'.           01960000
               88  NON-MGCA-IRA-ACCOUNT            VALUE 'N'.           01970000
           05  WS-ALTERNATE-IRA-IND          PIC X VALUE ' '.           01980000
               88  ALTERNATE-IRA-ACCOUNT           VALUE 'Y'.           01990000
               88  NON-ALTERNATE-IRA-ACCOUNT       VALUE 'N'.           02000000
                                                                        02010000
           EJECT                                                        02020000
       01  PIC X(32)  VALUE '        GETNA RECORD LAYOUT     '.         02030000
       COPY GETNACOB.                                                   02040000
       01  GETNA-SEGMENT-INCLUDES.                                      02050000
       COPY NASEGHDR.                                                   02060000
       COPY NASEGPPA.                                                   02070000
       COPY NASEGEND.                                                   02080000
           EJECT                                                        02090000
       01  FILLER                      PIC X(16) VALUE 'P2BKPG-REC-WS'. 02100000
       01  BKCNS-ACAT-OUT-WORK-AREA.                                    02110000
           02  P2-BK-RECORD.                                            02120000
               03  P2-BK-TRID          PIC X     VALUE 'B'.             02130000
               03  P2-BK-BATCH-CODE    PIC XX.                          02140000
               03  P2-BK-BROKER-NBR    PIC XXX.                         02150000
               03  P2-BK-BUY-SELL-CODE PIC X.                           02160000
               03  P2-BK-QUANTITY  PIC 9(11) COMP-3.                    02170000
               03  P2-BK-QUANTITY-X                                     02180000
                         REDEFINES P2-BK-QUANTITY.                      02190000
                   05  P2-BK-QUANTITY-SW   PIC X.                       02200000
                   05  FILLER              PIC X(5).                    02210000
               03  P2-BK-SECURITY-NBR  PIC X(7).                        02220000
               03  FILLER              PIC XX    VALUE SPACES.          02230000
               03  P2-BK-ENTRY-CODE    PIC XXX.                         02240000
               03  FILLER              PIC X(5)  VALUE SPACES.          02250000
               03  P2-BK-BR-ACCT-T-C.                                   02260000
                 05  P2-BK-BR-ACCT-T.                                   02270000
                   07  P2-BK-BRANCH    PIC XXX.                         02280000
                   07  P2-BK-ACCOUNT   PIC X(5).                        02290000
                   07  P2-BK-TYPE      PIC 9.                           02300000
                 05  P2-BK-CHECK-DIGIT PIC X.                           02310000
               03  P2-BK-SPIN-DTW      PIC XX    VALUE SPACES.          02320000
               03  P2-BK-AMOUNT-XX.                                     02330000
                   05  P2-BK-AMOUNT    PIC 9(16)V99 COMP-3.             02340000
               03  P2-BK-DESCRIPTION.                                   02350000
                   05  FILLER          PIC X(5)  VALUE 'ACAT '.         02360000
                   05  P2-BK-CNTL-NBR  PIC X(8).                        02370000
                   05  FILLER          PIC X(5)  VALUE ' BOS '.         02380000
                   05  P2-BK-CNTRA-BKR PIC X(4).                        02390000
                   05  FILLER          PIC X(5)  VALUE SPACES.          02400000
               03  FILLER              PIC X     VALUE SPACES.          02410000
               03  P2-BK-CURRENCY      PIC XXX   VALUE '000'.           02420000
               03  FILLER              PIC X(10)  VALUE SPACES.         02430000
               03  P2-BK-FRACTION      PIC V9(5).                       02440000
               03  P2-BK-FRACTION-X    REDEFINES P2-BK-FRACTION         02450000
                                       PIC X(05).                       02460000
               03  FILLER              PIC X(22)  VALUE SPACES.         02470000
           02  P2-BK-OFFSET-RECORD.                                     02480000
               03  P2-BK-CONST         PIC XXX.                         02490000
               03  FILLER              PIC X(5).                        02500000
               03  P2-BK-QUANTITY-XT.                                   02510000
                   05  P2-BK-QUAN      PIC 9(9)  COMP-3.                02520000
               03  FILLER              PIC X(9).                        02530000
               03  P2-BK-ENTRY-CODE-T  PIC XXX.                         02540000
               03  FILLER              PIC X(5)  VALUE SPACES.          02550000
               03  P2-BK-OFFSET-BR-ACCT-T-C    PIC X(10).               02560000
               03  FILLER              PIC X(02).                       02570000
               03  P2-BK-AMOUNT-X      PIC X(10).                       02580000
               03  P2-BK-RES-DESCRIPTION.                               02590000
                   05  P2-BK-RESCODE   PIC X(2).                        02600000
                   05  P2-BK-RESDESC   PIC X(25).                       02610000
               03  P2-BK-IPHEN         PIC X     VALUE SPACES.          02620000
               03  FILLER              PIC XXX.                         02630000
               03  FILLER              PIC X(10)  VALUE SPACES.         02640000
               03  P2-BK-FRAC          PIC V9(5).                       02650000
               03  FILLER              PIC X(22)  VALUE SPACES.         02660000
           02  P2-BK-TRAILER-RECORD.                                    02670000
               03  P2-BKT-TRID           PIC X(03).                     02680000
               03  FILLER-1  REDEFINES P2-BKT-TRID.                     02690000
                   05  P2-BKT-TRID-X     PIC X(01).                     02700000
                   05  P2-BKT-BATCH-CODE PIC X(02).                     02710000
               03  P2-BKT-BROKER-NBR     PIC X(03).                     02720000
               03  P2-BKT-BUY-SELL-CODE  PIC X(01).                     02730000
               03  P2-BKT-QUANTITY-X     PIC X(06).                     02740000
               03  P2-BKT-SECURITY-NBR   PIC X(07).                     02750000
               03  FILLER                PIC X(02).                     02760000
               03  P2-BKT-ENTRY-CODE     PIC X(03).                     02770000
               03  FILLER                PIC X(05).                     02780000
               03  P2-BKT-BR-ACCT-T-C.                                  02790000
                 05  P2-BKT-BR-ACCT-T.                                  02800000
                   07  P2-BKT-BRANCH     PIC X(03).                     02810000
                   07  P2-BKT-ACCOUNT    PIC X(05).                     02820000
                   07  P2-BKT-TYPE       PIC X(01).                     02830000
                 05  P2-BKT-CHECK-DIGIT  PIC X(01).                     02840000
               03  FILLER                PIC X(02).                     02850000
               03  P2-BKT-AMOUNT-X       PIC X(10).                     02860000
               03  P2-BKT-DESCRIPTION.                                  02870000
                   05  P2-BKT-RESCODE    PIC X(02).                     02880000
                   05  P2-BKT-RESDESC    PIC X(25).                     02890000
               03  P2-BKT-HYPHEN         PIC X(01) VALUE SPACES.        02900000
               03  FILLER                PIC X(03).                     02910000
               03  FILLER                PIC X(10) VALUE SPACES.        02920000
               03  P2-BKT-FRACTION       PIC V9(5).                     02930000
               03  P2-BKT-FRACTION-X     REDEFINES P2-BKT-FRACTION      02940000
                                         PIC X(05).                     02950000
               03  FILLER                PIC X(22) VALUE SPACES.        02960000
       01  P2-DEBIT-SIGN               PIC X     VALUE '0'.             02970000
       01  P2-CREDIT-SIGN              PIC X     VALUE '-'.             02980000
       01  P2-QUANTITY-PRESENT         PIC X     VALUE LOW-VALUES.      02990000
       01  P2-NO-QUANTITY-PRESENT      PIC X     VALUE SPACE.           03000000
       01  P2-OUTREC                   PIC X(120).                      03010000
       01  P2-DESC-WORK.                                                03020000
           05  PDW-MSG                 PIC X(17).                       03030000
           05  FILLER                  PIC X     VALUE SPACE.           03040000
           05  PDW-BR                  PIC X(3).                        03050000
           05  FILLER                  PIC X     VALUE '-'.             03060000
           05  PDW-ACCT                PIC X(5).                        03070000
                                                                        03080000
           EJECT                                                        03090000
      ****************************************************************  03100000
      *   B1 TABLE                                                      03110000
      ****************************************************************  03120000
                                                                        03130000
       01 GETB1-RESULT PIC X VALUE '0'.                                 03140000
           88 B1-ITEM-FOUND VALUE '1'.                                  03150000
           88 B1-ITEM-NOT-FOUND VALUE '0'.                              03160000
       01 SEARCH-B1-RESULT PIC X VALUE '0'.                             03170000
           88 B1-TABLE-ITEM-FOUND VALUE '1'.                            03180000
           88 B1-TABLE-ITEM-NOT-FOUND VALUE '0'.                        03190000
       01 B1-BROKER-SEARCH-KEY PIC XXXX.                                03200000
       01  B1-COUNT PIC 9999 COMP VALUE 400.                            03210000
      *****                                                             03220000
       01  B1-TABLE.                                                    03230000
           03  B1-ITEMS OCCURS 400 TIMES.                               03240000
               05  B1-ADP-CLIENT                PIC 9(03).              03250000
               05  B1-BROKER                    PIC X(04).              03260000
               05  B1-MAINT-FEE-FOR-IRA         PIC X(01).              03270000
               05  B1-CLI-XFER-FEE              PIC 999V99.             03280000
               05  B1-CLI-XFER-FEE-IRA          PIC 999V99.             03290000
               05  B1-ACCT-IRA-FEE-CODE         PIC X(35).              03300000
               05  B1-BTCH-ENTR-CODE            PIC X(05).              03310000
               05  B1-CLIENT-NAME               PIC X(30).              03320000
               05  B1-XFER-RANGE-NO             PIC 9(03)  COMP-3.      03330000
               05  B1-XFER-IRA-MAINT-RANGE-NO   PIC 9(03)  COMP-3.      03340000
434520         05  B1-XFER-DO-NOT-BOOK-TRF-FEE  PIC X.                  03350000
434706         05  B1-XFER-FEE-IRA-ACT-PTR      PIC X.                  03360000
434721         05  B1-PTR-TRAN-FEE-TRLR         PIC X(30).              03370000
LRM002         05  B1-ACAT-FRGN-FEE-DESCRIPTION PIC X(27).              03380000
                                                                        03390000
00200 ** CARD-434539                                                    03400000
06740         05  B1-ACAT-RETIRE-ACCOUNTS-NO  PIC 9(3) COMP-3.          03410000
06740         05  B1-ACAT-RETIRE-ACCOUNTS.                              03420000
06760             07  B1-ACAT-RETIRE-ACCOUNTS-ENTRY OCCURS 20 TIMES.    03430000
06800                 09  B1-ACAT-RETIRE-ACCOUNTS-LO    PIC X(8).       03440000
06800                 09  B1-ACAT-RETIRE-ACCOUNTS-HI    PIC X(8).       03450000
00200 ** CARD-434922 400                                                03460000
               05  B1-XFER-TABLE.                                       03470000
                   07  B1-XFER-RANGE-ENTRS  OCCURS 400 TIMES.           03480000
                       09  B1-XFER-FEE      PIC 999V99.                 03490000
                       09  B1-XFER-BRAC-LOW   PIC X(08).                03500000
                       09  B1-XFER-BRAC-HIGH  PIC X(08).                03510000
                       09  B1-XFER-OFFSET-TY  PIC X(09).                03520000
                       09  B1-XFER-BATCH      PIC X(02).                03530000
                       09  B1-XFER-ENTRY      PIC X(03).                03540000
               05  B1-XFER-IRA-TABLE.                                   03550000
434904             07  B1-XFER-RANGE-IRA-ENTRS  OCCURS 100 TIMES.       03560000
                       09  B1-XFER-IRA-FEE      PIC 999V99.             03570000
                       09  B1-XFER-IRA-BRAC-LOW   PIC X(08).            03580000
                       09  B1-XFER-IRA-BRAC-HIGH  PIC X(08).            03590000
                       09  B1-XFER-IRA-FEE-CODE   PIC X.                03600000
                       09  B1-XFER-IRA-FEE-OFFSET PIC X(09).            03610000
                       09  B1-XFER-IRA-FEE-BATCH  PIC X(02).            03620000
                       09  B1-XFER-IRA-FEE-ENTRY  PIC X(03).            03630000
                       09  B1-XFER-IRA-FEE-FR-DATE PIC X(08).           03640000
                       09  B1-XFER-IRA-FEE-TO-DATE PIC X(08).           03650000
00020 ** CARD-009125                                                    03660000
06740      05  B1-MGCA-IRA-BR-RANGE-NO               PIC 9(3) COMP-3.   03670000
06750      05  B1-MGCA-IRA-BR-RANGE.                                    03680000
06760          07  B1-MGCA-IRA-BR-RANGE-ENTRY      OCCURS 50 TIMES.     03690000
06800              09  B1-MGCA-IRA-BR-RANGE-LO         PIC X(3).        03700000
06800              09  B1-MGCA-IRA-BR-RANGE-HI         PIC X(3).        03710000
00299                                                                   03720000
00020 ** CARD-009126                                                    03730000
06740      05  B1-MGCA-IRA-BR-ACT-RANGE-NO           PIC 9(3) COMP-3.   03740000
06750      05  B1-MGCA-IRA-BR-ACT-RANGE.                                03750000
06760          07  B1-MGCA-IRA-BR-ACT-RANGE-ENTRY  OCCURS 50 TIMES.     03760000
06800              09  B1-MGCA-IRA-BR-ACT-BR-LO        PIC X(3).        03770000
06800              09  B1-MGCA-IRA-BR-ACT-BR-HI        PIC X(3).        03780000
06800              09  B1-MGCA-IRA-BR-ACT-ACT-LO       PIC X(5).        03790000
06800              09  B1-MGCA-IRA-BR-ACT-ACT-HI       PIC X(5).        03800000
      ** CARD-434671                                                    03810000
           05  B1-ACAT-IRA-FEE-CODE-VALUES.                             03820000
               07  B1-ACAT-IRA-FEE-CODE-VAL-NO       PIC 9(3) COMP-3.   03830000
               07  B1-ACAT-IRA-FEE-CODE-VAL     OCCURS  36  PIC X(1).   03840000
      ** CARD-434672                                                    03850000
           05  B1-ACAT-IRA-FEE-TAX-ID-VALUES.                           03860000
               07  B1-ACAT-IRA-FEE-TAX-ID-VAL-NO     PIC 9(3) COMP-3.   03870000
               07  B1-ACAT-IRA-FEE-TAX-ID-VAL     OCCURS  20  PIC X(9). 03880000
                                                                        03890000
       01  B1-WRK-TABLE.                                                03900000
           03  B1-WRK-ITEMS.                                            03910000
               05  B1-WRK-ADP-CLIENT            PIC 9(03).              03920000
               05  B1-WRK-BROKER                PIC X(04).              03930000
               05  B1-WRK-MAINT-FEE-FOR-IRA     PIC X(01).              03940000
               05  B1-WRK-CLI-XFER-FEE          PIC 999V99.             03950000
               05  B1-WRK-CLI-XFER-FEE-IRA      PIC 999V99.             03960000
               05  B1-WRK-ACCT-IRA-FEE-CODE     PIC X(35).              03970000
               05  B1-WRK-BTCH-ENTR-CODE        PIC X(05).              03980000
               05  B1-WRK-CLIENT-NAME           PIC X(30).              03990000
               05  B1-WRK-XFER-RANGE-NO         PIC 9(03)  COMP-3.      04000000
               05  B1-WRK-XFER-IRA-MAINT-RANGE-NO PIC 9(03) COMP-3.     04010000
434520         05  B1-434520-DO-NOT-BOOK-TRF-FEE PIC X.                 04020000
434706         05  B1-434706-FEE-IRA-ACCT-PTR    PIC X.                 04030000
434721         05  B1-WRK-PTR-TRAN-FEE-TRLR      PIC X(30).             04040000
LRM002         05  B1-WRK-FRGN-FEE-DESCRIPTION  PIC X(27).              04050000
               05  B1-WRK-RETIRE-ACCOUNTS-NO   PIC 9(3) COMP-3.         04060000
               05  B1-WRK-RETIRE-ACCOUNTS.                              04070000
                   07  B1-WRK-RETIRE-ACCOUNTS-ENTRY OCCURS 20 TIMES.    04080000
                      09  B1-WRK-RETIRE-ACCOUNTS-LO     PIC X(8).       04090000
                      09  B1-WRK-RETIRE-ACCOUNTS-HI     PIC X(8).       04100000
                                                                        04110000
               05  B1-WRK-XFER-TABLE.                                   04120000
434912             07  B1-WRK-XFER-RANGE-ENTRS OCCURS 400 TIMES.        04130000
                       09  B1-WRK-XFER-FEE  PIC 999V99.                 04140000
                       09  B1-WRK-XFER-BRAC-LOW PIC X(08).              04150000
                       09  B1-WRK-XFER-BRAC-HIGH PIC X(08).             04160000
                       09  B1-WRK-XFER-OFFSET    PIC X(09).             04170000
                       09  B1-WRK-XFER-BATCH     PIC X(02).             04180000
                       09  B1-WRK-XFER-ENTRY     PIC X(03).             04190000
MAINT          05  B1-WRK-XFER-IRA-MAINT-TABLE.                         04200000
434904             07  B1-WRK-XFER-RANGE-IRA-ENTRS OCCURS 100 TIMES.    04210000
                       09  B1-WRK-XFER-IRA-MAINT-FEE PIC 999V99.        04220000
                       09  B1-WRK-XFER-IRA-MAINT-BRAC-LOW PIC X(08).    04230000
                       09  B1-WRK-XFER-IRA-MAINT-BRAC-HI PIC X(08).     04240000
                       09  B1-WRK-XFER-IRA-MAINT-FEE-CODE PIC X.        04250000
                       09  B1-WRK-XFER-IRA-MAINT-OFFSET PIC X(09).      04260000
                       09  B1-WRK-XFER-IRA-MAINT-BATCH PIC X(02).       04270000
                       09  B1-WRK-XFER-IRA-MAINT-ENTRY PIC X(03).       04280000
                       09  B1-WRK-XFER-IRA-MAINT-FR-DATE PIC X(08).     04290000
                       09  B1-WRK-XFER-IRA-MAINT-TO-DATE PIC X(08).     04300000
06740      05  B1-WRK-MGCA-IRA-BR-RANGE-NO           PIC 9(3) COMP-3.   04310000
06750      05  B1-WRK-MGCA-IRA-BR-RANGE.                                04320000
06760          07  B1-WRK-MGCA-IRA-BR-RANGE-ENTRY  OCCURS 50 TIMES.     04330000
06800              09  B1-WRK-MGCA-IRA-BR-RANGE-LO     PIC X(3).        04340000
06800              09  B1-WRK-MGCA-IRA-BR-RANGE-HI     PIC X(3).        04350000
00299                                                                   04360000
00020 ** CARD-009126                                                    04370000
06740      05  B1-WK-MGCA-IRA-BR-ACT-RANGE-NO       PIC 9(3) COMP-3.    04380000
06750      05  B1-WK-MGCA-IRA-BR-ACT-RANGE.                             04390000
06760          07  B1-WK-MGCA-IRA-BR-ACT-RNG-ENT   OCCURS 50 TIMES.     04400000
06800              09  B1-WK-MGCA-IRA-BR-ACT-BR-LO    PIC X(3).         04410000
06800              09  B1-WK-MGCA-IRA-BR-ACT-BR-HI    PIC X(3).         04420000
06800              09  B1-WK-MGCA-IRA-BR-ACT-ACT-LO   PIC X(5).         04430000
06800              09  B1-WK-MGCA-IRA-BR-ACT-ACT-HI   PIC X(5).         04440000
      ** CARD-434671                                                    04450000
           05  B1-WK-IRA-FEE-CODE-VALUES.                               04460000
               07  B1-WK-IRA-FEE-CODE-VAL-NO      PIC 9(3) COMP-3.      04470000
               07  B1-WK-IRA-FEE-CODE-TBL.                              04480000
                   09  B1-WK-IRA-FEE-CODE-VAL  OCCURS  36  PIC X(1).    04490000
      ** CARD-434672                                                    04500000
           05  B1-WK-IRA-FEE-TAX-ID-VALUES.                             04510000
               07  B1-WK-IRA-FEE-TAX-ID-VAL-NO    PIC 9(3) COMP-3.      04520000
               07  B1-WK-IRA-FEE-TAX-ID-VAL    OCCURS  20  PIC X(9).    04530000
      *                                                                 04540000
      ****************************************************************  04550000
      *  B1-INFO                                                        04560000
       COPY BHINFO.                                                     04570000
       EJECT                                                            04580000
       COPY BHBTS2.                                                     04590000
       EJECT                                                            04600000
       COPY BHACAT.                                                     04610000
       COPY BHAT2.                                                      04620000
LRM003 COPY BHAT3.                                                      04630000
       COPY BHAT4.                                                      04640000
       EJECT                                                            04650000
       01  FILLER                        PIC X(08) VALUE 'BHMGCA  '.    04660000
           COPY BHMGCA.                                                 04670000
       EJECT                                                            04680000
      ****************************************************************  04690000
      *    TIME/DATE FIELDS                                          *  04700000
      ****************************************************************  04710000
       COPY BPDATESC.                                                   04720000
       01  DATE-FIELDS.                                                 04730000
           05  PROC-DATE.                                               04740000
               10  PD-CC        PIC XX.                                 04750000
               10  PD-YY        PIC XX.                                 04760000
               10  PD-MM        PIC XX.                                 04770000
               10  PD-DD        PIC XX.                                 04780000
           05  WORK-DATE-MMDDYY.                                        04790000
               10  WK-MM        PIC XX.                                 04800000
               10  WK-DD        PIC XX.                                 04810000
               10  WK-YY        PIC XX.                                 04820000
                                                                        04830000
LRM002 COPY GETMRCOB.                                                   04840000
LRM002 01  GET-SR-WORK-AREA.                                            04850000
LRM002     05  SRMAS-KEY.                                               04860000
LRM002         10 SRMAS-CLIENT     PIC XXX   VALUE SPACE.               04870000
LRM002         10 SRMAS-CUSIP.                                          04880000
LRM002            15 SRMAS-CUSIP-9  PIC X(09).                          04890000
LRM002            15 SRMAS-CUSIP-3  PIC X(03).                          04900000
LRM002         10 SRMAS-BR-AC.                                          04910000
LRM002            15 SRMAS-BRANCH   PIC X(03).                          04920000
LRM002            15 SRMAS-ACCT     PIC X(05).                          04930000
LRM002         10 SRMAS-CUR-TYP-CHK.                                    04940000
LRM002            15 SRMAS-CURR     PIC X(03).                          04950000
LRM002            15 SRMAS-TYPE     PIC X(01).                          04960000
LRM002            15 SRMAS-CHK      PIC X(01).                          04970000
LRM002     05  SR-OFFSET-ACCOUNT-FOUND-SW  PIC X(01).                   04980000
LRM002         88  SR-OFFSET-ACCOUNT-FOUND            VALUE 'Y'.        04990000
LRM002     05  WS-SR-PROC-KEY.                                          05000000
LRM002         07 WS-SR-PROC-CL-CUSIP.                                  05010000
LRM002            10 WS-SR-PROC-CLIENT PIC XXX  VALUE SPACE.            05020000
LRM002            10 FILLER            PIC X    VALUE LOW-VALUES.       05030000
LRM002            10 WS-SR-PROC-CUSIP.                                  05040000
LRM002               15 WS-SR-PROC-CUSIP-1-2  PIC X(02).                05050000
LRM002               15 WS-SR-PROC-CUSIP-3-11 PIC X(09).                05060000
LRM002               15 WS-SR-PROC-CUSIP-12   PIC X(01).                05070000
LRM002               15 WS-SR-PROC-CUSIP-13-15.                         05080000
LRM002                  20 WS-SR-PROC-CUSIP-2 PIC X(02).                05090000
LRM002                  20 WS-SR-PROC-CUSIP-1 PIC X(01).                05100000
LRM002         07 WS-SR-PROC-SYMBOL           PIC X(12)  VALUE SPACES.  05110000
LRM002         07 FILLER                      PIC X(02).                05120000
LRM002         07 WS-SR-FAM-NUM         PIC X(02).                      05130000
LRM002         07 WS-SR-PROC-BRANCH     PIC X(03).                      05140000
LRM002         07 WS-SR-PROC-ACCT-1-5   PIC X(05).                      05150000
LRM002         07 WS-SR-PROC-ACCT-6-10  PIC X(05).                      05160000
LRM002         07 WS-SR-PROC-CURR-TYPE-CK.                              05170000
LRM002            15 WS-SR-PROC-CURR PIC X(03).                         05180000
LRM002            15 WS-SR-PROC-TYPE PIC X(01).                         05190000
LRM002            15 WS-SR-PROC-CHK PIC X(01).                          05200000
                                                                        05210000
LRM002     05  WS-STOCK-REC-TD-QTY    PIC S9(12)V9(5) COMP-3.           05220000
LRM002     05  WS-SR-LOOKUP-BRAC.                                       05230000
LRM002         07  WS-SR-LOOKUP-BR    PIC X(3).                         05240000
LRM002         07  WS-SR-LOOKUP-AC    PIC X(5).                         05250000
LRM002                                                                  05260000
      ******************************************************************05270000
      * GETMSD COMMAREA                                                *05280000
      ******************************************************************05290000
       01  FILLER                        PIC X(08) VALUE 'GETMSDCE'.    05300000
           COPY GETMSDCE.                                               05310000
      /                                                                 05320000
       LINKAGE SECTION.                                                 05330000
       01  PARM-DATA.                                                   05340000
           05  PARM-LENGTH              PIC S9(4)  COMP.                05350000
               88  PARM-LENGTH-VALID               VALUE +1.            05360000
           05  PARM-INFO.                                               05370000
               10  PARM-STREAM              PIC X.                      05380000
                   88  PARM-STREAM-VALID           VALUES ARE           05390000
                   'A' THRU 'Z' '0' THRU '9'.                           05400000
           EJECT                                                        05410000
                                                                        05420000
       PROCEDURE DIVISION USING PARM-DATA.                              05430000
           COPY MSGCOBO.                                                05440000
                                                                        05450000
           PERFORM 0100-DATE-PARM-RTN THRU                              05460000
                   0100-DATE-PARM-RTN-EXIT.                             05470000
           PERFORM 0200-FILE-INIT THRU                                  05480000
                   0200-FILE-INIT-EXIT.                                 05490000
                                                                        05500000
           PERFORM 0300-LOAD-B1-TABLE THRU                              05510000
                   0300-LOAD-B1-TABLE-EXIT.                             05520000
                                                                        05530000
           MOVE ZEROS TO B1-SUB1.                                       05540000
           PERFORM 0400-PROCESS-PEND-FILE                               05550000
                            THRU  0400-PROCESS-PEND-FILE-EXIT           05560000
               UNTIL PEND-FILE-EOF-SW = 'Y'.                            05570000
                                                                        05580000
           PERFORM 0600-PROCESS-INTRA-DAY-FILE                          05590000
                            THRU  0600-EXIT                             05600000
               UNTIL P2-ID-FILE-EOF-SW = 'Y'.                           05610000
                                                                        05620000
           IF B1-TBL-CNT = ZERO                                         05630000
             DISPLAY 'NO CLIENTS SELECTED FOR THIS RUN '                05640000
             GO TO 0005-ENDJOB.                                         05650000
           MOVE B1-TBL-CNT TO B1-COUNT.                                 05660000
                                                                        05670000
       0005-ENDJOB.                                                     05680000
                                                                        05690000
           PERFORM 1800-END-OF-JOB-ROUTINE THRU                         05700000
                   1800-END-OF-JOB-ROUTINE-EXIT.                        05710000
                                                                        05720000
           GOBACK.                                                      05730000
           EJECT                                                        05740000
                                                                        05750000
       0100-DATE-PARM-RTN.                                              05760000
                                                                        05770000
           MOVE  PGM-NME         TO  BPDATES-CALLING-PGM.               05780000
           MOVE  'C'             TO  BPDATES-REQ-TYPE.                  05790000
           CALL   BPDATES   USING  BPDATES-PARAMETERS.                  05800000
                                                                        05810000
           MOVE BPD-PROC-DATE        TO  PROC-DATE.                     05820000
                                                                        05830000
           MOVE PD-MM            TO  WK-MM.                             05840000
           MOVE PD-DD            TO  WK-DD.                             05850000
           MOVE PD-YY            TO  WK-YY.                             05860000
                                                                        05870000
           DISPLAY 'PROCESS DATE = '  PROC-DATE.                        05880000
                                                                        05890000
      * CHECK PARM                                                      05900000
           IF PARM-LENGTH-VALID                                         05910000
             CONTINUE                                                   05920000
           ELSE                                                         05930000
             DISPLAY 'PARM LENGTH IS INVALID, LENGTH MUST BE 1 CHAR '   05940000
             DISPLAY 'PARM ENTERED - ' PARM-INFO                        05950000
             DISPLAY 'PROGRAM CAT670NS ABENDED '                        05960000
             MOVE +2000  TO  ABORT-CODE                                 05970000
             PERFORM ABEND-RTN.                                         05980000
                                                                        05990000
           IF PARM-STREAM-VALID                                         06000000
             CONTINUE                                                   06010000
           ELSE                                                         06020000
             DISPLAY 'PARM IS 1 CHARS FIRST CHAR IS JOB STREAM'         06030000
             DISPLAY 'PARM INVALID, MUST BE 1 CHAR'                     06040000
             DISPLAY 'PARM ENTERED - ' PARM-INFO                        06050000
             DISPLAY 'PROGRAM CAT670NS ABENDED '                        06060000
             MOVE +2000  TO  ABORT-CODE                                 06070000
             PERFORM ABEND-RTN.                                         06080000
                                                                        06090000
           INITIALIZE B1-TABLE.                                         06100000
                                                                        06110000
       0100-DATE-PARM-RTN-EXIT. EXIT.                                   06120000
           EJECT                                                        06130000
       0200-FILE-INIT.                                                  06140000
                                                                        06150000
           OPEN INPUT PEND-I-FILE.                                      06160000
           OPEN INPUT P2-ID-FILE.                                       06170000
LRM002     SET     GETMSR-FORMAT-NEW   TO TRUE.                         06180000
LRM002     SET     GETMSR-DEVICE-DISK  TO TRUE.                         06190000
LRM002     SET     GETMSR-VSAM         TO TRUE.                         06200000
LRM002     SET     GETMSR-USA          TO TRUE                          06210000
                                                                        06220000
           OPEN OUTPUT P2BKPG-FILE.                                     06230000
                                                                        06240000
           READ PEND-I-FILE                                             06250000
             AT END                                                     06260000
                 MOVE 'Y' TO  PEND-FILE-EOF-SW                          06270000
                  GO TO 0200-FILE-INIT-EXIT.                            06280000
                                                                        06290000
           IF NOT PEND-HEADER-ID                                        06300000
              DISPLAY 'TRFS FILE HEADER NOT FOUND'                      06310000
                  DISPLAY 'JOB ENDING'                                  06320000
              MOVE +4004 TO ABORT-CODE                                  06330000
              PERFORM ABEND-RTN                                         06340000
           ELSE                                                         06350000
                DISPLAY 'PEND FILE DATE = '                             06360000
                         PEND-BOOK-DATE                                 06370000
           END-IF.                                                      06380000
                                                                        06390000
      * WRITE P2BKPG FILE HEARER RECORD                                 06400000
           MOVE SPACES   TO  P2BKPG-RECORD.                             06410000
           MOVE 'DATE='  TO  P2BKPG-RECORD.                             06420000
           MOVE WORK-DATE-MMDDYY TO P2BKPG-RECORD (6:6).                06430000
           WRITE P2BKPG-RECORD.                                         06440000
                                                                        06450000
       0200-FILE-INIT-EXIT.  EXIT.                                      06460000
            EJECT                                                       06470000
                                                                        06480000
       0300-LOAD-B1-TABLE.                                              06490000
                                                                        06500000
           PERFORM VARYING I-SUB FROM 1 BY 1                            06510000
               UNTIL I-SUB > 400                                        06520000
               MOVE ZERO TO B1-ADP-CLIENT(I-SUB)                        06530000
                              B1-BROKER (I-SUB)                         06540000
           END-PERFORM.                                                 06550000
                                                                        06560000
           PERFORM VARYING B1-SUB   FROM 1 BY 1                         06570000
               UNTIL B1-SUB   > B1-COUNT                                06580000
               SET B1-ITEM-NOT-FOUND TO TRUE                            06590000
               PERFORM 0310-GET-B1-INFO THRU                            06600000
                       0310-GET-B1-INFO-EXIT                            06610000
               IF B1-ITEM-FOUND                                         06620000
                   PERFORM 0320-LOAD-B1-ITEM THRU                       06630000
                           0320-LOAD-B1-ITEM-EXIT                       06640000
               END-IF                                                   06650000
           END-PERFORM.                                                 06660000
       0300-LOAD-B1-TABLE-EXIT.  EXIT.                                  06670000
                                                                        06680000
       0310-GET-B1-INFO.                                                06690000
                                                                        06700000
           MOVE SPACES    TO  BH-BROKER-HEADER-INFO.                    06710000
           MOVE B1-SUB    TO BH-BROKER-NUMBER-N.                        06720000
           MOVE '010'     TO BH-LOGICAL-RECORD-CODE.                    06730000
           MOVE SPACES    TO BH-B2-INFO-ID.                             06740000
           CALL  GETB1V  USING BH-BROKER-HEADER-INFO                    06750000
           END-CALL.                                                    06760000
                                                                        06770000
           PERFORM 0315-DETERMINE-CLI-STRM THRU                         06780000
                   0315-DETERMINE-CLI-STRM-EXIT.                        06790000
                                                                        06800000
000100     IF BH-BROKER-ACTIVE AND                                      06810000
              CLIENT-STREAM  = PARM-STREAM                              06820000
             CONTINUE                                                   06830000
           ELSE                                                         06840000
             SET B1-ITEM-NOT-FOUND TO TRUE                              06850000
             GO TO 0310-GET-B1-INFO-EXIT.                               06860000
                                                                        06870000
                                                                        06880000
           MOVE B1-SUB    TO BH-BROKER-NUMBER-N.                        06890000
           MOVE '015'     TO BH-LOGICAL-RECORD-CODE.                    06900000
           MOVE '434500'  TO BH-B2-INFO-ID.                             06910000
           CALL  GETB1V  USING BH-BROKER-HEADER-INFO,                   06920000
                              BH-ACAT-INFO                              06930000
           END-CALL.                                                    06940000
434501     IF BH-ACAT-ACTIVE                                            06950000
              IF BH-ACAT-TRAN-FEE-IRA-ACCT-PTR = '0'                    06960000
                 DISPLAY B1-SUB ' ONLY ONE PTR FEE 434706'              06970000
              ELSE                                                      06980000
                 DISPLAY B1-SUB ' BOOK BOTH PTR FEES 434706'            06990000
              END-IF                                                    07000000
           ELSE                                                         07010000
             SET B1-ITEM-NOT-FOUND TO TRUE                              07020000
             GO TO 0310-GET-B1-INFO-EXIT.                               07030000
                                                                        07040000
           MOVE B1-SUB    TO BH-BROKER-NUMBER-N.                        07050000
           MOVE '015'     TO BH-LOGICAL-RECORD-CODE.                    07060000
           MOVE '434900'  TO BH-B2-INFO-ID.                             07070000
           CALL  GETB1V  USING BH-BROKER-HEADER-INFO,                   07080000
                              BH-AT2-INFO                               07090000
           END-CALL.                                                    07100000
434901     IF BH-AT2-ACTIVE                                             07110000
               CONTINUE                                                 07120000
           ELSE                                                         07130000
               DISPLAY 'NO IRA MAINT FEE B1 FOR CLIENT ' B1-SUB         07140000
               MOVE ZEROS TO BH-AT2-IRA-MAINT-FEE-PTR-NO.               07150000
                                                                        07160000
           SET B1-ITEM-FOUND TO TRUE.                                   07170000
                                                                        07180000
           MOVE B1-SUB    TO BH-BROKER-NUMBER-N.                        07190000
           MOVE '015'     TO BH-LOGICAL-RECORD-CODE.                    07200000
           MOVE '434920'  TO BH-B2-INFO-ID.                             07210000
           CALL  GETB1V  USING BH-BROKER-HEADER-INFO,                   07220000
                              BH-AT4-INFO                               07230000
           END-CALL.                                                    07240000
434910     IF BH-AT4-ACTIVE                                             07250000
             DISPLAY 'CLIENT : ' B1-SUB                                 07260000
                    ' BHAT4 PTR TRANSFER FEES NO: '                     07270000
                   BH-AT4-TRANSF-FEES-MAI-NO                            07280000
           ELSE                                                         07290000
             DISPLAY 'NO PTR TRANSFER FEES FOR CLIENT ' B1-SUB          07300000
             MOVE ZEROS TO BH-AT4-TRANSF-FEES-MAI-NO                    07310000
           END-IF.                                                      07320000
                                                                        07330000
           MOVE '009110'                   TO BH-B2-INFO-ID             07340000
           CALL  GETB1V                 USING BH-BROKER-HEADER-INFO,    07350000
                                              BH-MGCA-INFO              07360000
           END-CALL.                                                    07370000
       0310-GET-B1-INFO-EXIT. EXIT.                                     07380000
                                                                        07390000
       0315-DETERMINE-CLI-STRM.                                         07400000
           MOVE BH-BROKER-MINI-MAXI-INDICATOR TO CLIENT-STREAM.         07410000
       0315-DETERMINE-CLI-STRM-EXIT. EXIT.                              07420000
           EJECT                                                        07430000
       0320-LOAD-B1-ITEM.                                               07440000
           DISPLAY ' '.                                                 07450000
           DISPLAY 'FOUND ACTIVE ACAT CLIENT ' B1-SUB.                  07460000
           MOVE B1-SUB TO B1-TBL-CNT.                                   07470000
           MOVE BH-BROKER-NUMBER-N                  TO                  07480000
                   B1-ADP-CLIENT (B1-TBL-CNT).                          07490000
           MOVE BH-BROKER-OLD-CLEARING-HOUSE (2:4)  TO                  07500000
                   B1-BROKER     (B1-TBL-CNT).                          07510000
           MOVE BH-BROKER-NAME                      TO                  07520000
                   B1-CLIENT-NAME (B1-TBL-CNT).                         07530000
           MOVE SPACE TO  B1-MAINT-FEE-FOR-IRA (B1-TBL-CNT).            07540000
           MOVE ZERO TO B1-CLI-XFER-FEE (B1-TBL-CNT).                   07550000
           MOVE ZERO TO B1-CLI-XFER-FEE-IRA (B1-TBL-CNT).               07560000
           MOVE ZERO TO XFER-FEE-IN                                     07570000
      *** CARD 534520                                                   07580000
           MOVE BH-ACAT-DO-NOT-BOOK-TRF-FEE TO                          07590000
                   B1-XFER-DO-NOT-BOOK-TRF-FEE (B1-TBL-CNT).            07600000
      *** CARD 434706                                                   07610000
           MOVE BH-ACAT-TRAN-FEE-IRA-ACCT-PTR TO                        07620000
                   B1-XFER-FEE-IRA-ACT-PTR (B1-TBL-CNT).                07630000
      *** CARD 434721                                                   07640000
           MOVE BH-ACAT-PTR-TRAN-FEE-TRLR TO                            07650000
                   B1-PTR-TRAN-FEE-TRLR (B1-TBL-CNT).                   07660000
           MOVE SPACES                              TO                  07670000
                   B1-ACCT-IRA-FEE-CODE (B1-TBL-CNT).                   07680000
           MOVE BH-ACAT-TRANS-FEE-BATCH-ENTRY       TO                  07690000
                   B1-BTCH-ENTR-CODE    (B1-TBL-CNT).                   07700000
LRM002     MOVE BH-ACAT-FOREIGN-FEE-DESCRIPT TO                         07710000
LRM002          B1-ACAT-FRGN-FEE-DESCRIPTION (B1-TBL-CNT).              07720000
      ****                                                              07730000
      ** CARD-434671                                                    07740000
           MOVE SPACES TO B1-ACAT-IRA-FEE-CODE-VALUES (B1-TBL-CNT).     07750000
           MOVE BH-ACAT-IRA-FEE-CODE-VAL-NO TO                          07760000
                  B1-ACAT-IRA-FEE-CODE-VAL-NO (B1-TBL-CNT).             07770000
           PERFORM VARYING IRA-SUB  FROM 1 BY 1                         07780000
               UNTIL IRA-SUB  > BH-ACAT-IRA-FEE-CODE-VAL-NO             07790000
                  MOVE BH-ACAT-IRA-FEE-CODE-VAL (IRA-SUB) TO            07800000
                       B1-ACAT-IRA-FEE-CODE-VAL(B1-TBL-CNT IRA-SUB)     07810000
           END-PERFORM.                                                 07820000
      ** CARD-434672                                                    07830000
           MOVE SPACES TO B1-ACAT-IRA-FEE-TAX-ID-VALUES (B1-TBL-CNT).   07840000
           MOVE BH-ACAT-IRA-FEE-TAX-ID-VAL-NO TO                        07850000
                   B1-ACAT-IRA-FEE-TAX-ID-VAL-NO (B1-TBL-CNT).          07860000
           PERFORM VARYING IRA-SUB  FROM 1 BY 1                         07870000
               UNTIL IRA-SUB  > BH-ACAT-IRA-FEE-TAX-ID-VAL-NO           07880000
                 MOVE BH-ACAT-IRA-FEE-TAX-ID-VAL (IRA-SUB) TO           07890000
                      B1-ACAT-IRA-FEE-TAX-ID-VAL (B1-TBL-CNT IRA-SUB)   07900000
           END-PERFORM.                                                 07910000
           DISPLAY 'CAT670NS - B1-434671 ' B1-ACAT-IRA-FEE-CODE-VAL-NO  07920000
             (B1-TBL-CNT) ' ' B1-ACAT-IRA-FEE-CODE-VALUES(B1-TBL-CNT).  07930000
           DISPLAY 'CAT670NS - B1-434672 ' B1-ACAT-IRA-FEE-TAX-ID-VAL-NO07940000
             (B1-TBL-CNT) ' ' B1-ACAT-IRA-FEE-TAX-ID-VALUES(B1-TBL-CNT).07950000
                                                                        07960000
           MOVE  BH-AT4-TRANSF-FEES-MAI-NO TO                           07970000
                 B1-XFER-RANGE-NO (B1-TBL-CNT).                         07980000
                                                                        07990000
           PERFORM 0330-LOAD-B1-REG-FEES THRU                           08000000
                    0330-LOAD-B1-REG-FEES-EXIT                          08010000
                    VARYING B6-SUB FROM 1 BY 1                          08020000
                    UNTIL B6-SUB > BH-AT4-TRANSF-FEES-MAI-NO.           08030000
                                                                        08040000
           MOVE BH-AT2-IRA-MAINT-FEE-PTR-NO TO                          08050000
                 B1-XFER-IRA-MAINT-RANGE-NO (B1-TBL-CNT).               08060000
           PERFORM 0335-LOAD-B1-IRA-FEES THRU                           08070000
                   0335-LOAD-B1-IRA-FEES-EXIT                           08080000
                   VARYING B11-SUB FROM 1 BY 1                          08090000
                   UNTIL B11-SUB > BH-AT2-IRA-MAINT-FEE-PTR-NO          08100000
           PERFORM 0345-LOAD-IRA-ACCTS THRU                             08110000
                   0345-LOAD-IRA-ACCTS-EXIT                             08120000
                   VARYING B11-SUB FROM 1 BY 1                          08130000
                   UNTIL B11-SUB > BH-ACAT-RETIRE-ACCOUNTS-NO.          08140000
           MOVE BH-ACAT-RETIRE-ACCOUNTS-NO TO                           08150000
                B1-ACAT-RETIRE-ACCOUNTS-NO (B1-TBL-CNT).                08160000
           IF BH-MGCA-ACTIVE                                            08170000
              PERFORM 0350-LOAD-MGCA-IRA-BR                             08180000
                        VARYING B11-SUB FROM 1 BY 1                     08190000
                        UNTIL B11-SUB > BH-MGCA-IRA-BR-RANGE-NO         08200000
              MOVE BH-MGCA-IRA-BR-ACT-RANGE-NO TO                       08210000
                             B1-MGCA-IRA-BR-ACT-RANGE-NO (B1-TBL-CNT)   08220000
              PERFORM 0355-LOAD-MGCA-IRA-BRAC                           08230000
                        VARYING B11-SUB FROM 1 BY 1                     08240000
                        UNTIL B11-SUB > BH-MGCA-IRA-BR-ACT-RANGE-NO     08250000
              MOVE BH-MGCA-IRA-BR-RANGE-NO TO                           08260000
                             B1-MGCA-IRA-BR-RANGE-NO (B1-TBL-CNT)       08270000
           ELSE                                                         08280000
              MOVE ZEROS TO  B1-MGCA-IRA-BR-ACT-RANGE-NO (B1-TBL-CNT)   08290000
                             B1-MGCA-IRA-BR-RANGE-NO (B1-TBL-CNT)       08300000
           END-IF.                                                      08310000
                                                                        08320000
       0320-LOAD-B1-ITEM-EXIT.  EXIT.                                   08330000
                                                                        08340000
       0330-LOAD-B1-REG-FEES.                                           08350000
      *** LOAD B1 434922 FIELDS                                         08360000
           MOVE BH-AT4-TRANSF-FEES-MAI-LO  (B6-SUB)    TO               08370000
                           B1-XFER-BRAC-LOW (B1-TBL-CNT B6-SUB).        08380000
           MOVE BH-AT4-TRANSF-FEES-MAI-HI  (B6-SUB)    TO               08390000
                           B1-XFER-BRAC-HIGH (B1-TBL-CNT B6-SUB).       08400000
           MOVE BH-AT4-TRANSF-FEES-MAI-AMT (B6-SUB)    TO               08410000
                           B1-XFER-FEE (B1-TBL-CNT B6-SUB).             08420000
           MOVE BH-AT4-TRANSF-FEES-MAI-OFFSET (B6-SUB) TO               08430000
                           B1-XFER-OFFSET-TY  (B1-TBL-CNT B6-SUB).      08440000
           MOVE BH-AT4-TRANSF-FEES-MAI-BATCH (B6-SUB)  TO               08450000
                           B1-XFER-BATCH  (B1-TBL-CNT B6-SUB).          08460000
           MOVE BH-AT4-TRANSF-FEES-MAI-ENTRY (B6-SUB)  TO               08470000
                           B1-XFER-ENTRY (B1-TBL-CNT B6-SUB).           08480000
                                                                        08490000
       0330-LOAD-B1-REG-FEES-EXIT.  EXIT.                               08500000
                                                                        08510000
       0335-LOAD-B1-IRA-FEES.                                           08520000
      *** LOAD B1 434904 FIELDS                                         08530000
           MOVE  BH-AT2-IRA-MAINT-FEE-PTR-AMT (B11-SUB)  TO             08540000
                B1-XFER-IRA-FEE    (B1-TBL-CNT B11-SUB).                08550000
           MOVE  BH-AT2-IRA-MAINT-FEE-PTR-LO   (B11-SUB)   TO           08560000
                B1-XFER-IRA-BRAC-LOW (B1-TBL-CNT B11-SUB).              08570000
           MOVE  BH-AT2-IRA-MAINT-FEE-PTR-HI   (B11-SUB)   TO           08580000
                B1-XFER-IRA-BRAC-HIGH (B1-TBL-CNT B11-SUB).             08590000
           MOVE  BH-AT2-IRA-MAINT-FEE-PTR-CD   (B11-SUB)   TO           08600000
                B1-XFER-IRA-FEE-CODE  (B1-TBL-CNT B11-SUB).             08610000
           MOVE  BH-AT2-IRA-MAINT-FEE-PTR-OFF  (B11-SUB)   TO           08620000
                B1-XFER-IRA-FEE-OFFSET (B1-TBL-CNT B11-SUB).            08630000
           MOVE  BH-AT2-IRA-MAINT-FEE-PTR-BT    (B11-SUB)    TO         08640000
                B1-XFER-IRA-FEE-BATCH  (B1-TBL-CNT B11-SUB).            08650000
           MOVE  BH-AT2-IRA-MAINT-FEE-PTR-ENTRY (B11-SUB)    TO         08660000
                B1-XFER-IRA-FEE-ENTRY  (B1-TBL-CNT B11-SUB).            08670000
           MOVE BH-AT2-IRA-MAINT-FEE-PTR-FR    (B11-SUB) TO             08680000
                                    WS-DATE-YYMMDD                      08690000
                                    WS-DATE-CCYYMMDD (3 : 6).           08700000
           IF WS-DATE-YYMMDD (1 : 2) > '90'                             08710000
               MOVE '19' TO         WS-DATE-CCYYMMDD (1 : 2)            08720000
           ELSE                                                         08730000
               MOVE '20' TO         WS-DATE-CCYYMMDD (1 : 2)            08740000
           END-IF.                                                      08750000
           MOVE WS-DATE-CCYYMMDD TO                                     08760000
                B1-XFER-IRA-FEE-FR-DATE (B1-TBL-CNT B11-SUB).           08770000
           MOVE BH-AT2-IRA-MAINT-FEE-PTR-TO    (B11-SUB) TO             08780000
                                    WS-DATE-YYMMDD                      08790000
                                    WS-DATE-CCYYMMDD (3 : 6).           08800000
           IF WS-DATE-YYMMDD (1 : 2) > '90'                             08810000
               MOVE '19' TO         WS-DATE-CCYYMMDD (1 : 2)            08820000
           ELSE                                                         08830000
               MOVE '20' TO         WS-DATE-CCYYMMDD (1 : 2)            08840000
           END-IF.                                                      08850000
           MOVE WS-DATE-CCYYMMDD TO                                     08860000
                B1-XFER-IRA-FEE-TO-DATE (B1-TBL-CNT B11-SUB).           08870000
       0335-LOAD-B1-IRA-FEES-EXIT.  EXIT.                               08880000
                                                                        08890000
       0345-LOAD-IRA-ACCTS.                                             08900000
00200 ** CARD-434539                                                    08910000
           MOVE  BH-ACAT-RETIRE-ACCOUNTS-LO   (B11-SUB)     TO          08920000
                B1-ACAT-RETIRE-ACCOUNTS-LO  (B1-TBL-CNT B11-SUB).       08930000
           MOVE  BH-ACAT-RETIRE-ACCOUNTS-HI   (B11-SUB)     TO          08940000
                B1-ACAT-RETIRE-ACCOUNTS-HI  (B1-TBL-CNT B11-SUB).       08950000
       0345-LOAD-IRA-ACCTS-EXIT. EXIT.                                  08960000
                                                                        08970000
       0350-LOAD-MGCA-IRA-BR.                                           08980000
           MOVE  BH-MGCA-IRA-BR-RANGE-ENTRY (B11-SUB) TO                08990000
                B1-MGCA-IRA-BR-RANGE-ENTRY  (B1-TBL-CNT B11-SUB).       09000000
                                                                        09010000
       0355-LOAD-MGCA-IRA-BRAC.                                         09020000
           MOVE  BH-MGCA-IRA-BR-ACT-RANGE-ENTRY (B11-SUB) TO            09030000
                B1-MGCA-IRA-BR-ACT-RANGE-ENTRY (B1-TBL-CNT B11-SUB).    09040000
           EJECT                                                        09050000
       0400-PROCESS-PEND-FILE.                                          09060000
                                                                        09070000
           PERFORM 0500-READ-PEND-RTN                                   09080000
                    THRU 0500-EXIT.                                     09090000
                                                                        09100000
           IF PEND-FILE-EOF-SW = 'Y'                                    09110000
              GO TO 0400-PROCESS-PEND-FILE-EXIT.                        09120000
                                                                        09130000
           MOVE PEND-TI-ADP-CL-NO-X   TO  CAK-CLIENT.                   09140000
           MOVE PEND-TI-CUST-ACCOUNT  TO  CAK-BRAC.                     09150000
                                                                        09160000
                                                                        09170000
      * IS ACAT CLIENT IN B1 TABLE                                      09180000
      * ON MATCH CONTINUE                                               09190000
           IF PEND-TI-ADP-CL-NO NUMERIC                                 09200000
           AND (PEND-TI-ADP-CL-NO >= 1 AND <= 400)                      09210000
             IF PEND-TI-ADP-CL-NO   NOT = B1-SUB1                       09220000
                MOVE PEND-TI-ADP-CL-NO TO B1-SUB1                       09230000
                IF B1-ADP-CLIENT (B1-SUB1) = PEND-TI-ADP-CL-NO          09240000
                  MOVE B1-ITEMS (B1-SUB1) TO B1-WRK-ITEMS               09250000
                  SET B1-ENTRY-FOUND TO TRUE                            09260000
                ELSE                                                    09270000
                  SET B1-ENTRY-NOT-FOUND TO TRUE                        09280000
                END-IF                                                  09290000
             END-IF                                                     09300000
           END-IF.                                                      09310000
                                                                        09320000
           IF B1-ENTRY-FOUND                                            09330000
             CONTINUE                                                   09340000
           ELSE                                                         09350000
              ADD 1 TO PEND-BYP-CLI                                     09360000
              GO TO 0400-PROCESS-PEND-FILE.                             09370000
                                                                        09380000
LRM002     IF PEND-AT-RECORD-ID                                         09390000
LRM002     AND PEND-AT-CLNT-IS-DELIVERER                                09400000
LRM002     AND (WK-TRNFR-TYPE = 'PTR' OR 'PTD')                         09410000
LRM002     AND (WK-STATUS-CD = '300' OR '310')                          09420000
LRM002     AND PEND-AT-SETTL-DATE = PROC-DATE                           09430000
LRM002     AND PEND-ADP-SEC-NO > SPACES                                 09440000
LRM002     AND BH-AT3-ACTIVE                                            09450000
LRM002     AND BH-AT3-FOREIGN-FEE-NO > ZERO                             09460000
LRM002         PERFORM 0520-READ-MSD-RTN                                09470000
LRM002            THRU 0520-EXIT                                        09480000
LRM002         IF MSD-ISIN > SPACES                                     09490000
LRM002         AND MSD-ISIN NOT = 'US'                                  09500000
LRM002*********AND WK-DTC-IND NOT = 'Y'                                 09510000
LRM002         AND WK-CNS-IND NOT = 'Y'                                 09520000
LRM002            PERFORM 1300-LOOKUP-FRGN-FEE-RTN                      09530000
LRM003               THRU 1300-LOOKUP-FRGN-FEE-EXIT                     09530103
LRM002         END-IF                                                   09531000
LRM002     END-IF.                                                      09532000
LRM002                                                                  09533000
           IF PEND-TI-RECORD-ID                                         09534000
           AND PEND-CLNT-IS-DELIVERER                                   09535000
           AND PEND-TRNFR-TYPE = 'PTR'                                  09536000
           AND (PEND-STATUS-CD = '300' OR '310')                        09537000
           AND PEND-SETTL-DATE = PROC-DATE                              09538000
               CONTINUE                                                 09539000
           ELSE                                                         09539100
              GO TO 0400-PROCESS-PEND-FILE-EXIT                         09539200
           END-IF.                                                      09539300
                                                                        09539400
           ADD 1 TO PEND-PRTL-FEE-RECS.                                 09539500
     **                                                                 09539600
     ** CHANGED TO DETERMINE IRA ACCOUNT OR NOT BASED ON MGCA B1(S).    09539700
     ** CARDS 009125 AND 009126.                                        09539800
           SET NON-MGCA-IRA-ACCOUNT TO TRUE.                            09539900
           SET NON-IRA-ACCOUNT TO TRUE.                                 09540000
           SET NON-ALTERNATE-IRA-ACCOUNT TO TRUE.                       09540100
           PERFORM 5315-CHECK-IRA-BR-RANGE THRU 5315-EXIT.              09540200
           IF MGCA-IRA-ACCOUNT                                          09540300
               CONTINUE                                                 09540400
           ELSE                                                         09540500
               PERFORM 5316-CHECK-IRA-BR-ACT-RANGE THRU 5316-EXIT       09540600
           END-IF.                                                      09540700
                                                                        09540800
           IF MGCA-IRA-ACCOUNT                                          09540900
              SET IRA-ACCOUNT TO TRUE                                   09541000
           END-IF.                                                      09542000
      ********************************************************          09543000
      * READ NAME AND ADDRESS FILE FOR THIS CUSTOMER                    09544000
      *    INITIALIZE  GETNA-PARAMETERS.                                09545000
      *    ONLY NEED KEOUGH INDICATOR!                                  09546000
      ********************************************************          09547000
                                                                        09548000
           MOVE  'R'                        TO  GETNA-REQ-FUNC.         09549000
           MOVE  'R'                        TO  GETNA-REQ-FILE.         09550000
           MOVE  'R'                        TO  GETNA-REQ-FUNC2.        09560000
           MOVE  'N'                        TO  GETNA-REQ-YEAREND.      09570000
           MOVE  PGM-NME                    TO  GETNA-PGM-NAME.         09580000
           MOVE  CAK-CLIENT                 TO  GETNA-KEY-CLIENT.       09590000
           MOVE  '00'                       TO  GETNA-KEY-BRANCH1-2.    09600000
           MOVE  CAK-BRANCH                 TO  GETNA-KEY-BRANCH3-5.    09610000
           MOVE  '00000'                    TO  GETNA-KEY-ACCOUNT1-5.   09620000
           MOVE  CAK-ACCOUNT                TO  GETNA-KEY-ACCOUNT6-10.  09630000
           CALL   GETNA                   USING GETNA-PARAMETERS        09640000
                                                GETNA-SEGMENT-INCLUDES  09650000
           END-CALL.                                                    09660000
                                                                        09670000
           IF  GETNA-RETURN-FOUND  AND                                  09680000
               NOT  NAPPA-SEGMENT-MISSING                               09690000
               CONTINUE                                                 09700000
           ELSE                                                         09710000
               DISPLAY 'CUSTOMER NOT ON NAME/ADDRESS FILE '             09720000
               DISPLAY 'ACAT DATA RECORD -> ' PEND-TI-RECORD            09730000
               GO TO 0400-PROCESS-PEND-FILE.                            09740000
                                                                        09750000
           MOVE ZERO            TO  XFER-FEE-IRA                        09760000
                                    XFER-FEE-REG                        09770000
                                    MAINT-FEE-IRA.                      09780000
                                                                        09790000
      * DETERMINE TRANSFER FEES                                         09800000
                                                                        09810000
      *---------------------------------------------------------------- 09820000
434706*   B1-434706-FEE-IRA-ACCT-PTR APPLIED AS FOLLOWS:                09830000
      * 0 - CHARGE ONLY ONE FEE;                                        09840000
      *       FOR IRA - ONLY TERMINATION FEE IF APPLICABLE              09850000
      *         OTHERWISE IF NO TERMINATION FEE, CONSIDER REGULAR FEE.  09860000
      *       ASSUME ANNUAL FEE STILL APPLIES!                          09870000
      * 1 - CHARGE EVERYTHING THAT APPLIES (UPTO 2 FEES):               09880000
      *       REGULAR FEE, IRA TERMINATION FEE.                         09890000
      *---------------------------------------------------------------- 09900000
                                                                        09910000
           IF NOT MGCA-IRA-ACCOUNT                                      09920000
           AND B1-WK-IRA-FEE-CODE-VAL-NO > ZERO                         09930000
           AND NAPPA-IRA-KEOUGH-IND > SPACES                            09940000
              PERFORM VARYING IRA-SUB FROM 1 BY 1                       09950000
                  UNTIL IRA-SUB > B1-WK-IRA-FEE-CODE-VAL-NO             09960000
                    OR B1-WK-IRA-FEE-CODE-VAL(IRA-SUB) =                09970000
                          NAPPA-IRA-KEOUGH-IND                          09980000
              END-PERFORM                                               09990000
              IF IRA-SUB NOT > B1-WK-IRA-FEE-CODE-VAL-NO                10000000
                 IF B1-WK-IRA-FEE-TAX-ID-VAL-NO = ZEROS                 10010000
                    SET MGCA-IRA-ACCOUNT TO TRUE                        10020000
                    SET IRA-ACCOUNT TO TRUE                             10030000
                    SET ALTERNATE-IRA-ACCOUNT TO TRUE                   10040000
                 ELSE                                                   10050000
                    PERFORM VARYING IRA-SUB FROM 1 BY 1                 10060000
                        UNTIL IRA-SUB > B1-WK-IRA-FEE-TAX-ID-VAL-NO     10070000
                           OR B1-WK-IRA-FEE-TAX-ID-VAL(IRA-SUB) =       10080000
                                 NAPPA-SOC-SEC-TAX-ID1                  10090000
                    END-PERFORM                                         10100000
                    IF IRA-SUB NOT > B1-WK-IRA-FEE-TAX-ID-VAL-NO        10110000
                       SET MGCA-IRA-ACCOUNT TO TRUE                     10120000
                       SET IRA-ACCOUNT TO TRUE                          10130000
                       SET ALTERNATE-IRA-ACCOUNT TO TRUE                10140000
                    END-IF                                              10150000
                END-IF                                                  10160000
              END-IF                                                    10170000
           END-IF.                                                      10180000
                                                                        10190000
           PERFORM 1100-REGULAR-XFER-FEE-RTN THRU                       10200000
                   1100-REGULAR-XFER-FEE-RTN-EXIT.                      10210000
                                                                        10220000
           IF MGCA-IRA-ACCOUNT                                          10230000
           AND IRA-ACCOUNT                                              10240000
             PERFORM 1200-IRA-MAINT-FEE-RTN THRU                        10250000
                     1200-IRA-MAINT-FEE-RTN-EXIT.                       10260000
                                                                        10270000
           IF B1-434706-FEE-IRA-ACCT-PTR = '0'                          10280000
              IF MAINT-FEE-IRA > ZEROS                                  10290000
                 COMPUTE FEE-WORK = MAINT-FEE-IRA                       10300000
                 MOVE ZEROS TO      XFER-FEE-REG                        10310000
              ELSE                                                      10320000
                 COMPUTE FEE-WORK = XFER-FEE-REG                        10330000
                 MOVE ZEROS TO      MAINT-FEE-IRA                       10340000
           ELSE                                                         10350000
              COMPUTE FEE-WORK = XFER-FEE-REG + MAINT-FEE-IRA           10360000
           END-IF.                                                      10370000
                                                                        10380000
           IF XFER-FEE-REG NOT = ZERO                                   10390000
           AND B1-434520-DO-NOT-BOOK-TRF-FEE NOT = '1'                  10400000
             SET P2-XFER TO TRUE                                        10410000
             PERFORM 1400-P2-REC-RTN THRU                               10420000
                     1400-P2-REC-RTN-EXIT                               10430000
           END-IF.                                                      10440000
                                                                        10450000
           IF MGCA-IRA-ACCOUNT                                          10460000
             CONTINUE                                                   10470000
           ELSE                                                         10480000
             GO TO 0400-PROCESS-PEND-FILE.                              10490000
                                                                        10500000
           IF MAINT-FEE-IRA NOT = ZERO                                  10510000
           AND B1-434520-DO-NOT-BOOK-TRF-FEE NOT = '1'                  10520000
             SET P2-MAINT TO TRUE                                       10530000
             PERFORM 1400-P2-REC-RTN THRU                               10540000
                     1400-P2-REC-RTN-EXIT.                              10550000
                                                                        10560000
       0400-PROCESS-PEND-FILE-EXIT. EXIT.                               10570000
                                                                        10580000
       0500-READ-PEND-RTN.                                              10590000
           READ PEND-I-FILE                                             10600000
             AT END                                                     10610000
                  DISPLAY 'PEND FILE AT END'                            10620000
                  MOVE 'Y' TO PEND-FILE-EOF-SW                          10630000
                  GO TO 0500-EXIT                                       10640000
           END-READ.                                                    10650000
                                                                        10660000
           IF PEND-FILE-EOF-SW NOT = 'Y'                                10670000
           AND PEND-HEADER-ID                                           10680000
               DISPLAY 'FOUND HEADER ON PEND.'                          10690000
                       ' DATE ' PEND-BOOK-DATE                          10700000
               GO TO 0500-READ-PEND-RTN                                 10710000
           END-IF.                                                      10720000
                                                                        10730000
LRM002     ADD 1 TO PEND-DTL-RECS.                                      10740000
LRM002     IF BH-AT3-CLIENT NOT NUMERIC                                 10750000
LRM002     OR BH-AT3-CLIENT NOT = PEND-AT-ADP-CL-NO                     10760000
LRM002        MOVE PEND-AT-ADP-CL-NO TO BH-BROKER-NUMBER-N              10770000
LRM002        MOVE '015'     TO BH-LOGICAL-RECORD-CODE                  10780000
LRM002        MOVE '434910'  TO BH-B2-INFO-ID                           10790000
LRM002        CALL  GETB1V  USING BH-BROKER-HEADER-INFO,                10800000
LRM002                            BH-AT3-INFO                           10810000
LRM002        END-CALL                                                  10820000
LRM002        IF NOT BH-AT3-ACTIVE                                      10830000
LRM002           MOVE PEND-AT-ADP-CL-NO TO BH-AT3-CLIENT                10840000
LRM002        END-IF                                                    10850000
LRM002     END-IF.                                                      10860000
                                                                        10870000
LRM002     IF PEND-TI-RECORD-ID                                         10880000
LRM002        MOVE PEND-TRNFR-TYPE TO WK-TRNFR-TYPE                     10890000
LRM002        MOVE PEND-STATUS-CD  TO WK-STATUS-CD                      10900000
TEST          DISPLAY 'SAVED WK ' WK-TRNFR-TYPE ' ' WK-STATUS-CD        10910000
                ' ' PEND-TI-CONTROL-NUM                                 10920000
TEST***    ELSE                                                         10930000
TEST***        DISPLAY 'WE READ '                                       10940000
TEST***         PEND-AT-RECORD-TYPE ' '                                 10950000
TEST***         PEND-AT-CONTROL-NUM  ' '                                10960000
TEST***         WK-TRNFR-TYPE  ' '                                      10970000
TEST***         WK-STATUS-CD ' '                                        10980000
TEST***         PEND-AT-SETTL-DATE ' ' PROC-DATE ' '                    10990000
TEST***         PEND-AT-DSTBN-SIDE-CD  ' '                              11000000
TEST***         PEND-ADP-SEC-NO ' '                                     11010000
TEST***         ' AT3-STATUS ' BH-AT3-STATUS                            11020000
TEST***         IF BH-AT3-ACTIVE                                        11030000
TEST***            DISPLAY 'AT3 FEE CNT ' BH-AT3-FOREIGN-FEE-NO         11040000
LRM002     END-IF.                                                      11050000
                                                                        11060000
LRM002 0500-EXIT. EXIT.                                                 11070000
LRM002                                                                  11080000
LRM002 0520-READ-MSD-RTN.                                               11090000
LRM002     MOVE 'D'                      TO GETMSD-DEVICE-IND.          11100000
LRM002     MOVE 'R'                      TO GETMSD-ACCESS-IND.          11110000
LRM002     MOVE 'E'                      TO GETMSD-FORMAT-IND.          11120000
LRM002     MOVE SPACE                    TO GETMSD-RETURN-CODE.         11130000
LRM002     MOVE LOW-VALUES               TO GETMSD-SEARCH-KEY-AREA.     11140000
LRM002     MOVE PEND-ADP-SEC-NO          TO GETMSD-SEARCH-KEY.          11150000
LRM002     MOVE '0'                      TO GETMSD-WI-CODE              11160000
LRM002     MOVE PEND-TI-ADP-CL-NO        TO GETMSD-CLIENT-PL2.          11170000
LRM002                                                                  11180000
LRM002     CALL GETMSDC               USING MASTER-SECURITY-RECORD.     11181000
LRM002                                                                  11182000
LRM002     IF  NOT GETMSD-RETURN-VALID                                  11183000
LRM002         DISPLAY 'ZGETMSDC CALL FAILED '                          11184000
LRM002           ' RETURN CODE ' GETMSD-RETURN-CODE                     11185000
LRM002         GO TO 0520-EXIT                                          11186000
LRM002     END-IF.                                                      11187000
LRM002     MOVE MS-FORMAT-IND            TO WK-MS-CLASS-1               11188000
LRM002     MOVE MS-SECURITY-TYPE         TO WK-MS-SEC-TYPE-X            11189000
LRM002     MOVE WK-MS-SEC-TYPE-P         TO WK-MS-SEC-TYPE-N            11190000
LRM002     MOVE WK-MS-SEC-TYPE           TO WK-MS-CLASS-2-5             11200000
LRM002     MOVE MS-SECURITY-TYPE-2       TO WK-MS-CLASS-6-7             11210000
LRM002     IF MSD-SEG-14-ABSENT                                         11220000
LRM002        MOVE SPACES TO MSD-ISIN                                   11230000
LRM002     ELSE                                                         11240000
TEST          DISPLAY 'MSD FOUND - ISIN=' MSD-ISIN ' ' PEND-ADP-SEC-NO  11250000
LRM002             ' WK-MS-CLASS=' WK-MS-CLASS                          11260000
LRM002     END-IF.                                                      11270000
LRM002     MOVE 'N' TO WK-DTC-IND WK-CNS-IND.                           11280000
LRM002     IF (WK-MS-CLASS (4:1) = '2' OR '3' OR '4'                    11290000
LRM002                          OR '5' OR '6' OR '7')                   11300000
LRM002         MOVE  'Y'       TO WK-DTC-IND                            11310000
TEST*********  DISPLAY 'DTC=Y'                                          11320000
LRM002     END-IF.                                                      11330000
LRM002     EVALUATE WK-MS-CLASS (1:1)                                   11340000
LRM002         WHEN '1'                                                 11350000
LRM002               IF (WK-MS-CLASS (5:1) = '5' OR '6')                11360000
LRM002                   MOVE  'Y'       TO WK-CNS-IND                  11370000
LRM002               END-IF                                             11380000
LRM002         WHEN '2'                                                 11390000
LRM002               IF (WK-MS-CLASS (5:1) = '2' OR '5' OR '6')         11400000
LRM002                   MOVE  'Y'       TO WK-CNS-IND                  11410000
LRM002               END-IF                                             11420000
LRM002         WHEN '3'                                                 11430000
LRM002               IF  (WK-MS-CLASS (5:1) = '2' OR '6')               11440000
LRM002                   MOVE  'Y'       TO WK-CNS-IND                  11450000
LRM002               END-IF                                             11460000
LRM002         WHEN '4'                                                 11470000
LRM002               IF  WK-MS-CLASS (5:1) = '6'                        11480000
LRM002                   MOVE  'Y'       TO WK-CNS-IND                  11490000
LRM002               END-IF                                             11500000
LRM002         WHEN '6'                                                 11510000
LRM002               IF  WK-MS-CLASS (2:1) = '6'                        11520000
LRM002                   CONTINUE                                       11530000
LRM002               ELSE                                               11540000
LRM002                 IF  (WK-MS-CLASS (5:1) = '5' OR '6')             11550000
LRM002                     MOVE  'Y'     TO WK-CNS-IND                  11560000
LRM002                 END-IF                                           11570000
LRM002               END-IF                                             11580000
LRM002         WHEN '7'                                                 11590000
LRM002               IF  WK-MS-CLASS (5:1) = '6'                        11600000
LRM002                   MOVE  'Y'       TO WK-CNS-IND                  11610000
LRM002               END-IF                                             11620000
LRM002         WHEN OTHER                                               11630000
LRM002              CONTINUE                                            11640000
LRM002     END-EVALUATE.                                                11650000
TEST       IF WK-CNS-IND = 'Y'                                          11660000
TEST           DISPLAY 'CNS=Y'.                                         11670000
LRM002 0520-EXIT. EXIT.                                                 11680000
           EJECT                                                        11690000
       0600-PROCESS-INTRA-DAY-FILE.                                     11700000
           READ P2-ID-FILE                                              11710000
             AT END                                                     11720000
                  DISPLAY 'P2 ID FILE AT END'                           11730000
                  MOVE 'Y' TO P2-ID-FILE-EOF-SW                         11740000
                  GO TO 0600-EXIT                                       11750000
           END-READ.                                                    11760000
                                                                        11770000
           IF P2-ID-REC(1 : 4) = 'DATE'                                 11780000
              DISPLAY 'READ HEADER ' P2-ID-REC (1 : 62)                 11790000
           ELSE                                                         11800000
           IF P2-ID-REC(1 : 7) = 'REC-CNT'                              11810000
              DISPLAY 'READ TRAILER ' P2-ID-REC (1 : 62)                11820000
           ELSE                                                         11830000
              WRITE P2BKPG-RECORD FROM P2-ID-REC                        11840000
              ADD 1 TO  P2-RECS-WRTN                                    11850000
              ADD 1 TO  P2-ID-DETAILS                                   11860000
           END-IF.                                                      11870000
       0600-EXIT. EXIT.                                                 11880000
                                                                        11890000
           EJECT                                                        11900000
       1100-REGULAR-XFER-FEE-RTN.                                       11910000
      *** DETERMINE IF BRANCH FOR THIS ACCOUNT IS IN XFER FEE TABLE     11920000
      *** IF SO USE FEE FROM TABLE IN PLACE OF CLIENT LEVEL FEE         11930000
      * CARD 451142 OVERRIDES 501306 IF BRANCH IS WITHIN TBL RANGE      11940000
                                                                        11950000
           MOVE  'N'  TO  B1-RANGE-SEARCH-STATUS.                       11960000
           MOVE  ' '  TO  B1-RANGE-SEARCH-SWITCH.                       11970000
           MOVE  1    TO  B6-SUB.                                       11980000
           PERFORM UNTIL B1-RANGE-SEARCH-END                            11990000
                                                                        12000000
434912       IF B6-SUB > B1-WRK-XFER-RANGE-NO                           12010000
               MOVE 'N'  TO  B1-RANGE-SEARCH-STATUS                     12020000
               MOVE 'Y'  TO  B1-RANGE-SEARCH-SWITCH                     12030000
             END-IF                                                     12040000
             IF  CAK-BRAC >= B1-WRK-XFER-BRAC-LOW (B6-SUB)              12050000
             AND CAK-BRAC <= B1-WRK-XFER-BRAC-HIGH (B6-SUB)             12060000
             AND B6-SUB NOT > B1-WRK-XFER-RANGE-NO                      12070000
                MOVE B1-WRK-XFER-FEE (B6-SUB) TO XFER-FEE-REG           12080000
                MOVE B1-WRK-XFER-OFFSET(B6-SUB) TO XFER-FEE-OFFSET      12090000
                MOVE B1-WRK-XFER-BATCH(B6-SUB) TO XFER-FEE-REG-BATCH    12100000
                MOVE B1-WRK-XFER-ENTRY(B6-SUB) TO XFER-FEE-REG-ENTRY    12110000
                MOVE 'Y' TO B1-RANGE-SEARCH-STATUS                      12120000
                MOVE 'Y' TO B1-RANGE-SEARCH-SWITCH                      12130000
             END-IF                                                     12140000
                                                                        12150000
             ADD 1  TO  B6-SUB                                          12160000
           END-PERFORM.                                                 12170000
                                                                        12180000
       1100-REGULAR-XFER-FEE-RTN-EXIT.  EXIT.                           12190000
                                                                        12200000
           EJECT                                                        12210000
       1200-IRA-MAINT-FEE-RTN.                                          12220000
                                                                        12230000
      **** IF NON-ALTERNATE-IRA-ACCOUNT                                 12240000
      ****   GO TO 1225-NO-MATCH-511233.                                12250000
                                                                        12260000
           MOVE  'N'  TO  B1-RANGE-SEARCH-STATUS.                       12270000
           MOVE  ' '  TO  B1-RANGE-SEARCH-SWITCH.                       12280000
           MOVE  1    TO  B9-SUB.                                       12290000
434902     PERFORM UNTIL B1-RANGE-SEARCH-END                            12300000
                                                                        12310000
             IF B9-SUB > B1-WRK-XFER-IRA-MAINT-RANGE-NO                 12320000
               MOVE 'N'  TO  B1-RANGE-SEARCH-STATUS                     12330000
               MOVE 'Y'  TO  B1-RANGE-SEARCH-SWITCH                     12340000
             END-IF                                                     12350000
             IF  CAK-BRAC >= B1-WRK-XFER-IRA-MAINT-BRAC-LOW (B9-SUB)    12360000
             AND CAK-BRAC <= B1-WRK-XFER-IRA-MAINT-BRAC-HI (B9-SUB)     12370000
             AND B9-SUB NOT > B1-WRK-XFER-IRA-MAINT-RANGE-NO            12380000
             AND PROC-DATE >= B1-WRK-XFER-IRA-MAINT-FR-DATE (B9-SUB)    12390000
             AND PROC-DATE <= B1-WRK-XFER-IRA-MAINT-TO-DATE (B9-SUB)    12400000
               MOVE B1-WRK-XFER-IRA-MAINT-FEE (B9-SUB) TO MAINT-FEE-IRA 12410000
               MOVE B1-WRK-XFER-IRA-MAINT-OFFSET (B9-SUB) TO            12420000
                                                   MAINT-FEE-IRA-OFFSET 12430000
               MOVE B1-WRK-XFER-IRA-MAINT-BATCH (B9-SUB) TO             12440000
                                                   MAINT-FEE-BATCH      12450000
               MOVE B1-WRK-XFER-IRA-MAINT-ENTRY (B9-SUB) TO             12460000
                                                   MAINT-FEE-ENTRY      12470000
               MOVE 'Y'  TO  B1-RANGE-SEARCH-STATUS                     12480000
               MOVE 'Y'  TO  B1-RANGE-SEARCH-SWITCH                     12490000
             END-IF                                                     12500000
                                                                        12510000
             ADD 1  TO  B9-SUB                                          12520000
           END-PERFORM.                                                 12530000
       1200-IRA-MAINT-FEE-RTN-EXIT. EXIT.                               12540000
           EJECT                                                        12550000
LRM002 1300-LOOKUP-FRGN-FEE-RTN.                                        12560000
LRM003* FIRST LOOK IN 434913 FOR PENSON LEGACY ACCOUNT MATCH TO         12561001
LRM003* ACCOUNT 0AAAAAAA.                                               12562007
LRM003     SET NOT-LEGACY-ACCOUNT TO TRUE.                              12563001
LRM003     IF CAK-CLIENT = 010                                          12564001
LRM003        IF (CAK-BRANCH = '203' OR '384' OR '385' OR '386' OR '387'12565001
LRM003             OR '388' OR '389' OR '390' OR '398' OR '479' OR '607'12566001
LRM003             OR '609' OR '742' OR '962' OR '981')                 12567001
LRM003        OR (CAK-BRANCH(1:1) >= 'A' AND <= 'Z')                    12568001
LRM003        OR (CAK-BRANCH(2:1) >= 'A' AND <= 'Z')                    12569001
LRM003        OR (CAK-BRANCH(3:1) >= 'A' AND <= 'Z')                    12569101
LRM003           SET LEGACY-ACCOUNT TO TRUE                             12569201
LRM003     END-IF.                                                      12569301
LRM003     IF LEGACY-ACCOUNT                                            12569401
LRM003         MOVE SPACES TO SR-OFFSET-ACCOUNT-FOUND-SW                12569501
LRM003         PERFORM VARYING B13-SUB FROM 1 BY 1                      12569601
LRM003            UNTIL B13-SUB > BH-AT3-FOREIGN-FEE-NO                 12569701
LRM003               OR SR-OFFSET-ACCOUNT-FOUND                         12569801
LRM003                  IF BH-AT3-FOREIGN-FEE-ACCT(B13-SUB)             12569901
LRM003                                   = '0AAAAAAA'                   12570007
LRM003                     SET SR-OFFSET-ACCOUNT-FOUND TO TRUE          12570101
LRM003                     DISPLAY 'MATCHED BRAC TO B1 ON FRGN FEE '    12570201
LRM003                         ' CLI = ' CAK-CLIENT                     12570303
LRM003                         ' LEGACY ACCT= ' CAK-BRAC                12570403
LRM003                         ' SECURITY= ' PEND-ADP-SEC-NO            12570503
LRM003                     PERFORM 1350-CREATE-FOREIGN-FEE-RTN          12570701
LRM003                        THRU 1350-CREATE-FOREIGN-FEE-EXIT         12570801
LRM003                     GO TO 1300-LOOKUP-FRGN-FEE-EXIT              12570903
LRM003                  END-IF                                          12571001
LRM003         END-PERFORM                                              12571101
LRM003     END-IF.                                                      12571201
LRM002*----------------------------------------------------------------*12572000
LRM002*  READ STOCK RECORD TO LOOK FOR MATCH OF B1 434913 STREETSIDE    12580000
LRM002*  ACCOUNT FOR THIS SECURITY.                                     12590000
LRM002*----------------------------------------------------------------*12600000
                                                                        12610000
LRM002     MOVE LOW-VALUES TO WS-SR-PROC-KEY                            12620000
LRM002     MOVE PEND-AT-ADP-CL-NO    TO WS-SR-PROC-CLIENT               12630000
LRM002     MOVE SPACES               TO WS-SR-PROC-CUSIP-1-2            12640000
TEST       DISPLAY 'LOOKING FOR FRGN FEE MS-CUSIP ' MS-CUSIP-NO         12650000
LRM002     IF MS-CUSIP-NO > SPACES                                      12660000
LRM002        MOVE MS-CUSIP-NO       TO WS-SR-PROC-CUSIP-3-11           12670000
LRM002        MOVE MS-CUSIP-AREA(10:3) TO WS-SR-PROC-CUSIP-13-15        12680000
LRM002     ELSE                                                         12690000
LRM002        MOVE 'XX'              TO WS-SR-PROC-CUSIP-3-11(1:2)      12700000
LRM002        MOVE PEND-ADP-SEC-NO   TO WS-SR-PROC-CUSIP-3-11(3:7)      12710000
LRM002        MOVE '000'                TO WS-SR-PROC-CUSIP-13-15       12720000
LRM002     END-IF.                                                      12730000
LRM002     MOVE SPACES               TO WS-SR-PROC-CUSIP-12             12740000
LRM002     MOVE WS-SR-PROC-KEY       TO SR-WS-SEQ.                      12750000
LRM002     SET GETMSR-ACCESS-START TO TRUE                              12760000
LRM002     PERFORM CALL-GET-SRMAS                                       12770000
LRM002                                                                  12780000
TEST       DISPLAY 'AFTER START GETMSR RC = ' GETMSR-RETURN-CODE        12790000
TEST       DISPLAY 'SR-WS-KEY ' SR-WS-SEQ.                              12800000
LRM002     MOVE ZEROS TO WS-STOCK-REC-TD-QTY                            12810000
LRM002     MOVE SPACES TO SRMAS-BR-AC                                   12820000
LRM002                    SR-OFFSET-ACCOUNT-FOUND-SW.                   12830000
LRM002     PERFORM UNTIL SR-WS-SEQ(1:19) > WS-SR-PROC-KEY(1:19)         12840000
LRM002                OR SR-WS-SEQ = HIGH-VALUE                         12850000
LRM002                OR SRMAS-BR-AC >                                  12860000
LRM002                   BH-AT3-FOREIGN-FEE-ACCT(BH-AT3-FOREIGN-FEE-NO) 12870000
LRM002                OR SR-OFFSET-ACCOUNT-FOUND                        12880000
LRM002         SET GETMSR-ACCESS-NEXT TO TRUE                           12890000
LRM002         PERFORM CALL-GET-SRMAS                                   12900000
TEST           DISPLAY 'READNEXT KEY RETURNED ' SR-WS-SEQ               12910000
LRM002         PERFORM VARYING B13-SUB FROM 1 BY 1                      12920000
LRM002            UNTIL B13-SUB > BH-AT3-FOREIGN-FEE-NO                 12930000
LRM002               OR SR-OFFSET-ACCOUNT-FOUND                         12940000
LRM002                  IF BH-AT3-FOREIGN-FEE-ACCT(B13-SUB)             12950000
LRM002                                   = SRMAS-BR-AC                  12960000
LRM002                     SET SR-OFFSET-ACCOUNT-FOUND TO TRUE          12970000
LRM002                     DISPLAY 'MATCHED BRAC TO B1 ON FRGN FEE '    12980000
LRM002                         ' CLI = ' PEND-TI-ADP-CL-NO              12990000
LRM002                         SRMAS-BR-AC ' ' PEND-ADP-SEC-NO          13000000
LRM002                     PERFORM 1350-CREATE-FOREIGN-FEE-RTN          13010000
LRM002                        THRU 1350-CREATE-FOREIGN-FEE-EXIT         13020000
LRM002                  END-IF                                          13030000
LRM002         END-PERFORM                                              13040000
LRM002     END-PERFORM.                                                 13050000
LRM002                                                                  13060000
LRM002 CALL-GET-SRMAS.                                                  13070000
LRM002**** SEE BMG13M ***                                               13080000
LRM002     CALL ZMSRIO  USING  GETMSR-CALLING-INFO SR-WS-RECORD.        13090000
TEST       DISPLAY 'GETMSR RC = ' GETMSR-RETURN-CODE                    13100000
LRM002                                                                  13110000
LRM002     IF  GETMSR-EOF                                               13120000
LRM002         MOVE HIGH-VALUE   TO SRMAS-KEY                           13130000
LRM002     ELSE                                                         13140000
LRM002     IF  GETMSR-RETURN-CODE =  SPACE                              13150000
LRM002         MOVE SR-WS-CLIENT        TO SRMAS-CLIENT                 13160000
LRM002         MOVE SR-WS-CUSIP-3-11    TO SRMAS-CUSIP-9                13170000
LRM002         MOVE SR-WS-CUSIP-13-15   TO SRMAS-CUSIP-3                13180000
LRM002         MOVE SR-WS-BRANCH(3:3)   TO SRMAS-BRANCH                 13190000
LRM002         MOVE SR-WS-ACCOUNT-6-10  TO SRMAS-ACCT                   13200000
LRM002         MOVE SR-WS-CURRENCY      TO SRMAS-CURR                   13210000
LRM002         MOVE SR-WS-TYPE          TO SRMAS-TYPE                   13220000
LRM002         MOVE SR-WS-CHECK-DIGIT   TO SRMAS-CHK                    13230000
LRM002         IF SR-WS-TD-QTY NUMERIC                                  13240000
LRM002            MOVE SR-WS-TD-QTY TO WS-STOCK-REC-TD-QTY              13250000
LRM002         END-IF                                                   13260000
LRM002     ELSE                                                         13270000
LRM002     IF  GETMSR-RETURN-CODE = 'N'                                 13280000
LRM002         CONTINUE                                                 13290000
LRM002     ELSE                                                         13300000
LRM002         DISPLAY 'CAT820 - CALL MSRIO I/O ERROR'                  13310000
LRM002                 ' RETURN CODE = '  GETMSR-RETURN-CODE            13320000
LRM002         MOVE  1300  TO  ABORT-CODE                               13330000
LRM002         GO TO  ABEND-RTN                                         13340000
LRM002     END-IF END-IF END-IF.                                        13350000
LRM002                                                                  13360000
LRM003 1300-LOOKUP-FRGN-FEE-EXIT. EXIT.                                 13361003
                                                                        13362003
LRM002 1350-CREATE-FOREIGN-FEE-RTN.                                     13370000
LRM002     MOVE 'F'  TO  P2-PROCESS-TYPE                                13380000
LRM002     ADD 1 TO PEND-FOREIGN-FEE-CHARGED.                           13390000
LRM002     ADD  BH-AT3-FOREIGN-FEE-AMT(B13-SUB) TO FRGN-FEE-AMT         13400000
LRM002     DISPLAY 'HAVE FRGN FEE ' FRGN-FEE-AMT                        13410000
LRM002     IF BH-AT3-FOREIGN-FEE-BOOK-IND (B13-SUB) = '1'               13420000
LRM002        MOVE PEND-AT-ADP-CL-NO    TO CAK-CLIENT                   13430000
LRM002        MOVE PEND-AT-CUST-ACCOUNT TO CAK-BRAC                     13440000
LRM002        PERFORM 1400-P2-REC-RTN THRU                              13450000
LRM002                1400-P2-REC-RTN-EXIT                              13460000
LRM002     END-IF.                                                      13470000
LRM002 1350-CREATE-FOREIGN-FEE-EXIT. EXIT.                              13480000
           EJECT                                                        13490000
       1400-P2-REC-RTN.                                                 13500000
           MOVE SPACES          TO  P2-BK-QUANTITY-X                    13510000
                                    P2-BK-QUANTITY-SW                   13520000
                                    P2-BK-SECURITY-NBR                  13530000
                                    P2-BK-FRACTION-X.                   13540000
           MOVE CAK-CLIENT      TO  P2-BK-BROKER-NBR.                   13550000
           MOVE CAK-BRANCH      TO  P2-BK-BRANCH.                       13560000
           MOVE CAK-ACCOUNT     TO  P2-BK-ACCOUNT.                      13570000
           MOVE '1'             TO  P2-BK-TYPE.                         13580000
           MOVE 'X'             TO  P2-BK-CHECK-DIGIT.                  13590000
      **** GET BATCH/ENTRY CODE FROM B1 - 434649 (WITHOUT ACCT RANGE)   13600000
           MOVE B1-WRK-BTCH-ENTR-CODE (1:2)                             13610000
                                TO  P2-BK-BATCH-CODE.                   13620000
           MOVE B1-WRK-BTCH-ENTR-CODE (3:3)                             13630000
                                TO  P2-BK-ENTRY-CODE.                   13640000
           MOVE P2-DEBIT-SIGN   TO  P2-BK-BUY-SELL-CODE.                13650000
           IF P2-XFER                                                   13660000
             MOVE XFER-FEE-REG          TO  P2-BK-AMOUNT                13670000
             MOVE 'TRANSFER FEE     $'  TO  XFE-MSG                     13680000
             MOVE XFER-FEE-REG          TO  XFE-AMOUNT                  13690000
             MOVE XFER-FEE-REG-BATCH    TO  P2-BK-BATCH-CODE            13700000
             MOVE XFER-FEE-REG-ENTRY    TO  P2-BK-ENTRY-CODE            13710000
           END-IF.                                                      13720000
                                                                        13730000
           IF P2-MAINT                                                  13740000
             MOVE MAINT-FEE-IRA         TO  P2-BK-AMOUNT                13750000
             MOVE 'IRA MAINT FEE    $'  TO  XFE-MSG                     13760000
             MOVE MAINT-FEE-IRA         TO  XFE-AMOUNT                  13770000
             MOVE MAINT-FEE-BATCH       TO  P2-BK-BATCH-CODE            13780000
             MOVE MAINT-FEE-ENTRY       TO  P2-BK-ENTRY-CODE            13790000
           END-IF.                                                      13800000
                                                                        13810000
LRM002     IF P2-FOREIGN                                                13820000
LRM002       MOVE BH-AT3-FOREIGN-FEE-AMT(B13-SUB) TO P2-BK-AMOUNT       13830000
LRM002       MOVE PEND-ADP-SEC-NO              TO  P2-BK-SECURITY-NBR   13840000
LRM002       MOVE 'FOREIGN DLVY FEE $'         TO  XFE-MSG              13850000
LRM002       MOVE BH-AT3-FOREIGN-FEE-AMT(B13-SUB) TO XFE-AMOUNT         13860000
LRM002       MOVE BH-AT3-FOREIGN-FEE-BATCH(B13-SUB)                     13870000
LRM002                                            TO P2-BK-BATCH-CODE   13880000
LRM002       MOVE BH-AT3-FOREIGN-FEE-ENTRY-CD(B13-SUB)                  13890000
LRM002                                            TO P2-BK-ENTRY-CODE   13900000
LRM002     END-IF.                                                      13910000
                                                                        13920000
           MOVE XFER-FEE-DESCRIPTION    TO  P2-BK-DESCRIPTION.          13930000
                                                                        13940000
           MOVE P2-BK-RECORD    TO  P2-OUTREC.                          13950000
           PERFORM 1600-WRITE-P2BKPG-REC THRU                           13960000
                   1600-WRITE-P2BKPG-REC-EXIT.                          13970000
                                                                        13980000
           IF B1-WRK-PTR-TRAN-FEE-TRLR NOT = SPACES                     13990000
           AND P2-XFER                                                  14000000
                MOVE P2-BK-RECORD TO P2-BK-TRAILER-RECORD               14010000
                MOVE B1-WRK-PTR-TRAN-FEE-TRLR TO P2-BKT-DESCRIPTION     14020000
                MOVE SPACES TO P2-BKT-QUANTITY-X                        14030000
                               P2-BKT-ENTRY-CODE                        14040000
                               P2-BKT-AMOUNT-X                          14050000
                MOVE '-' TO P2-BKT-HYPHEN                               14060000
                MOVE 0 TO P2-BKT-FRACTION                               14070000
                PERFORM 1700-WRITE-P2BKPG-TRAILER                       14080000
           END-IF.                                                      14090000
                                                                        14100000
TEST       DISPLAY '1400- FRGN FEE DESC ' B1-WRK-FRGN-FEE-DESCRIPTION   14110000
LRM002     IF P2-FOREIGN                                                14120000
LRM002     AND B1-WRK-FRGN-FEE-DESCRIPTION > SPACES                     14130000
LRM002        MOVE P2-BK-RECORD TO P2-BK-TRAILER-RECORD                 14140000
LRM002        MOVE B1-WRK-FRGN-FEE-DESCRIPTION TO P2-BKT-DESCRIPTION    14150000
LRM002        MOVE SPACES TO P2-BKT-QUANTITY-X                          14160000
LRM002                       P2-BKT-ENTRY-CODE                          14170000
LRM002                       P2-BKT-AMOUNT-X                            14180000
LRM002        MOVE '-' TO  P2-BKT-HYPHEN                                14190000
LRM002        MOVE 0 TO P2-BKT-FRACTION                                 14200000
LRM002        MOVE P2-BK-TRAILER-RECORD  TO  P2-OUTREC                  14210000
LRM002        PERFORM 1700-WRITE-P2BKPG-TRAILER                         14220000
LRM002     END-IF.                                                      14230000
                                                                        14240000
      * NOW WRITE OFFSET CREDIT P2 RECORD                               14250000
                                                                        14260000
           IF P2-XFER                                                   14270000
               MOVE 'XFER FEE FOR ACCT'      TO PDW-MSG                 14280000
               MOVE XFER-FEE-OFFSET          TO P2-BK-BR-ACCT-T.        14290000
                                                                        14300000
           IF P2-MAINT                                                  14310000
               MOVE 'IRA MAINT FEE '         TO PDW-MSG                 14320000
               MOVE MAINT-FEE-IRA-OFFSET     TO P2-BK-BR-ACCT-T.        14330000
                                                                        14340000
LRM002     IF P2-FOREIGN                                                14350000
LRM002         MOVE 'FRGN FEE FOR ACCT'      TO PDW-MSG                 14360000
LRM002         MOVE BH-AT3-FOREIGN-FEE-OFFSET(B13-SUB)                  14370000
LRM002                                       TO P2-BK-BR-ACCT-T.        14380000
           MOVE P2-CREDIT-SIGN   TO  P2-BK-BUY-SELL-CODE.               14390000
           MOVE P2-BK-RECORD    TO  P2-BK-OFFSET-RECORD.                14400000
                                                                        14410000
           MOVE CAK-BRANCH TO PDW-BR.                                   14420000
           MOVE CAK-ACCOUNT TO PDW-ACCT.                                14430000
           MOVE P2-DESC-WORK    TO  P2-BK-RES-DESCRIPTION.              14440000
                                                                        14450000
           MOVE P2-BK-OFFSET-RECORD     TO  P2-OUTREC.                  14460000
           PERFORM 1600-WRITE-P2BKPG-REC THRU                           14470000
                   1600-WRITE-P2BKPG-REC-EXIT.                          14480000
                                                                        14490000
                                                                        14500000
       1400-P2-REC-RTN-EXIT. EXIT.                                      14510000
                                                                        14520000
       1600-WRITE-P2BKPG-REC.                                           14530000
                                                                        14540000
           WRITE P2BKPG-RECORD FROM P2-OUTREC.                          14550000
           ADD 1 TO  P2-RECS-WRTN.                                      14560000
                                                                        14570000
       1600-WRITE-P2BKPG-REC-EXIT.  EXIT.                               14580000
                                                                        14590000
       1700-WRITE-P2BKPG-TRAILER.                                       14600000
                                                                        14610000
           WRITE P2BKPG-RECORD FROM P2-BK-TRAILER-RECORD.               14620000
           ADD 1 TO  P2-RECS-WRTN.                                      14630000
                                                                        14640000
       1800-END-OF-JOB-ROUTINE.                                         14650000
                                                                        14660000
           MOVE 'REC-CNT='   TO  P2BKPG-RECORD.                         14670000
           MOVE P2-RECS-WRTN TO  P2BKPG-RECORD (9:11).                  14680000
           WRITE P2BKPG-RECORD.                                         14690000
                                                                        14700000
           CLOSE PEND-I-FILE                                            14710000
                 P2-ID-FILE                                             14720000
                 P2BKPG-FILE.                                           14730000
                                                                        14740000
                                                                        14750000
           DISPLAY 'PEND RECORDS READ         - ' PEND-DTL-RECS.        14760000
           DISPLAY 'PEND RECORDS FOR PRTL FEE - ' PEND-PRTL-FEE-RECS.   14770000
           DISPLAY 'PEND RECS BYPASSED CLIENT - ' PEND-BYP-CLI.         14780000
           DISPLAY 'INTRA DAY DETAILS COPIED  - ' P2-ID-DETAILS.        14790000
LRM002     DISPLAY 'FOREIGN FEES CREATED      - '                       14800000
LRM002                                       PEND-FOREIGN-FEE-CHARGED   14810000
           DISPLAY 'CAT670NS ENDING NORMALLY.'.                         14820000
       1800-END-OF-JOB-ROUTINE-EXIT.  EXIT.                             14830000
                                                                        14840000
       5315-CHECK-IRA-BR-RANGE.                                         14850000
                                                                        14860000
           IF  B1-WRK-MGCA-IRA-BR-RANGE-NO = 0                          14870000
               GO TO 5315-EXIT.                                         14880000
           MOVE 1 TO W-SUB1.                                            14890000
       5315-LOOP.                                                       14900000
           IF  CAK-BRAC >= B1-WRK-MGCA-IRA-BR-RANGE-LO (W-SUB1) AND     14910000
               CAK-BRAC <= B1-WRK-MGCA-IRA-BR-RANGE-HI (W-SUB1)         14920000
               SET MGCA-IRA-ACCOUNT TO TRUE                             14930000
***************DISPLAY*'***IRA-BR*FOUND*'*******************************14940000
*********************'*LO='*BH-MGCA-IRA-BR-RANGE-LO*(W-SUB1)************14950000
*********************'*HI='*BH-MGCA-IRA-BR-RANGE-HI*(W-SUB1)************14960000
           ELSE                                                         14970000
               IF  W-SUB1 < B1-WRK-MGCA-IRA-BR-RANGE-NO                 14980000
                   ADD 1 TO W-SUB1                                      14990000
               GO TO 5315-LOOP                                          15000000
           END-IF.                                                      15010000
                                                                        15020000
       5315-EXIT. EXIT.                                                 15030000
      /                                                                 15040000
       5316-CHECK-IRA-BR-ACT-RANGE.                                     15050000
                                                                        15060000
           IF  B1-WK-MGCA-IRA-BR-ACT-RANGE-NO = 0                       15070000
               GO TO 5316-EXIT.                                         15080000
           MOVE 1 TO W-SUB1.                                            15090000
       5316-LOOP.                                                       15100000
           IF  (CAK-BRANCH >= B1-WK-MGCA-IRA-BR-ACT-BR-LO  (W-SUB1) AND 15110000
                CAK-BRANCH  <= B1-WK-MGCA-IRA-BR-ACT-BR-HI   (W-SUB1))  15120000
           AND (CAK-ACCOUNT >= B1-WK-MGCA-IRA-BR-ACT-ACT-LO (W-SUB1) AND15130000
                CAK-ACCOUNT <= B1-WK-MGCA-IRA-BR-ACT-ACT-HI (W-SUB1))   15140000
                  SET MGCA-IRA-ACCOUNT TO TRUE                          15150000
******************DISPLAY*'***IRA-BR-ACT*FOUND*'************************15160000
*********************'*LO='*BH-MGCA-IRA-BR-ACT-BR-LO*(W-SUB1)***********15170000
*********************'*HI='*BH-MGCA-IRA-BR-ACT-BR-HI*(W-SUB1)***********15180000
*********************'*LO='*BH-MGCA-IRA-BR-ACT-ACT-LO*(W-SUB1)**********15190000
*********************'*HI='*BH-MGCA-IRA-BR-ACT-ACT-HI*(W-SUB1)**********15200000
           ELSE                                                         15210000
               IF  W-SUB1 < B1-WK-MGCA-IRA-BR-ACT-RANGE-NO              15220000
                   ADD 1 TO W-SUB1                                      15230000
               GO TO 5316-LOOP                                          15240000
           END-IF.                                                      15250000
                                                                        15260000
       5316-EXIT. EXIT.                                                 15270000
                                                                        15280000
       ABEND-RTN.                                                       15290000
           CALL  ABEND  USING ABORT-CODE.                               15300000
                                                                        15310000
