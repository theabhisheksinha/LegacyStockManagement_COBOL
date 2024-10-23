000001* PDX    - ACAT02IT C0318727 01/11/12 13:18:32 TBLAMUR            00001000
000001* PDX    - ACAT02IT C0305327 12/14/10 08:54:05 TBLAMUR            00001100
LRM014* SSR# 73009 USE COPY CATACTYP TO STANDARIZE ACCOUNT TYPE LOOKUP. 00001200
000001* PDX    - ACAT02IT C0290767 01/29/10 11:48:08 TBEDTAK            00001300
ET0001* SSR# 65991 RESUBMIT STATUS 600 TRANSFER AS A NEW TRANSFER. RE-  00001400
ET0001*      SUBMIT STAT 140 AS A NEW TRANSFER IF RESUBMISSION IS PAST  00001500
ET0001*      CYCLE 5 CUTOFF TIME 15:30 OF DAY 2.                        00001600
000001* PDX    - ACAT02IT C0275533 03/18/09 09:28:08 TBLAMUR            00001700
LRM013* SSR# 57674 DEFAULT TO SUBMIT FROM B1/COMMAREA AND REMOVE        00001800
LRM013* NO ERRORS FOUND MESSAGE                                         00001900
000001* PDX    - ACAT02IT C0272581 12/01/08 16:23:08 TBLAMUR            00002000
LRM012* SSR# 61164 BLOCK PARTIPANT TYPE 3 - FUND COMPANY.               00002100
000001* PDX    - ACAT02IT C0273647 11/28/08 13:34:19 TBLAMUR            00002200
LRM011* MODIFY SSR 57271 WHEN BOTH ACCOUNT AND CUST TYPE ENTERED/CHANGED00002300
LRM011* AT THE SAME TIME, ACCEPT CUST TYPE AS KEYED, DON'T DEFAULT IT.  00002400
000001* PDX    - ACAT02IT C0267683 07/29/08 10:18:57 TBLAMUR            00002500
LRM010* SSR# 57271 REPLACE CUST TYPE DEFAULT WHEN CUST ACCT IS CHANGED. 00002600
LRM009* SSR# 57275 CORRECT -803 RESUBMIT AFTER ALREADY ADDED            00002700
LRM008* SSR# 56326 RETAIN COMMENT ON INITIAL ENTRY.                     00002800
000001* PDX    - ACAT02IT C0263391 07/21/08 08:21:42 TBLAMUR            00002900
LRM007* SSR# 55766 ASCENDIS INTERFACE. BROWSE ONLY UNLESS SCON OVERRIDE 00003000
000001* PDX    - ACAT02IT C0250441 06/25/07 09:05:53 TBLAMUR            00003100
LRM006* SSR# 53075 SPIN-OFF CHANGES                                     00003200
000001* PDX    - ACAT02IT C0240732 11/09/06 13:31:52 TBLAMUR            00003300
LRM005* SSR# 49202 ALLOW 6 NEW ACCOUNT TYPES.                           00003400
000001* PDX    - ACAT02IT C0240592 10/20/06 14:25:51 TBLAMUR            00003500
LRM004* SSR# 48634 USE N/A ADT CUSTOMER TYPE TO LOOKUP ACCOUNT TYPE     00003600
000001* PDX    - ACAT02IT C0231507 04/21/06 08:48:11 TBLAMUR            00003700
LRM003* SSR# 45744 BLOCK ENTRY BASED ON ACCOUNT FREEZE                  00003800
LRM003* SSR# 40661 RETAIN USER ID OF INITIATOR.                         00003900
000001* PDX    - ACAT02IT C0227932 12/12/05 08:48:36 TBLAMUR            00004000
LRM002* SSR# 42405 CONTRA ACCOUNT EDIT WARNING, B1 434730               00004100
000001* PDX    - ACAT02IT C0209298 08/09/04 11:23:58 TBDOJUN            00004200
000001* SSR# 38232 RECOMPILED FOR NEW ACAT02IO COPYBOOK. NO CHANGE.     00004300
000001* PDX    - ACAT02IT C0179784 09/13/02 12:22:56 TBLAMUR            00005000
000001* PDX    - ACAT02IT C0160324 06/22/01 16:26:25 TBLAMUR            00006000
000001* PDX    - ACAT02IT C0146352 08/23/00 10:29:56 TBLAMUR            00007000
000001* PDX    - ACAT02IT C0122261 03/15/99 12:28:51 TBLAMUR            00008000
000001* PDX    - ACAT02IT C0122453 03/01/99 11:54:37 TBLAMUR            00009000
000001* PDX    - ACAT02IT C0120327 01/31/99 20:16:45 TBLAMUR            00010000
000001* PDX    - ACAT02IT C0119769 01/04/99 15:30:05 TBLAMUR            00020000
000001* PDX    - ACAT02IT C0109165 10/01/98 11:06:42 TBLAMUR            00030000
000100 IDENTIFICATION DIVISION.                                         00040000
000200 PROGRAM-ID.    ACAT02IT.                                         00050000
000300 AUTHOR.  LARRY MUREY.                                            00060000
000400*REMARKS.                                                         00070000
000500**-------------------------------------------------------------** 00080000
000600*  ACAT INITIAL TRANSFER REQUEST                               *  00090000
      *LRM 11-25-98.                                                    00100000
      *  ALLOW SCROLLING THRU ENTIRE CLIENT (NOT WITHIN BR/AC).         00110000
      *  TIGHTEN UP EDIT ON SUBMIT = Y INDICATOR (DON'T ALLOW S).       00120000
      *  COPY CUST-TYPE DEFAULT LOGIC FROM CAT513.                      00130000
000700**-------------------------------------------------------------** 00140000
000800 ENVIRONMENT DIVISION.                                            00150000
000900 DATA DIVISION.                                                   00160000
001000 WORKING-STORAGE SECTION.                                         00170000
001100 COPY PDXIDCOB.                                                   00180000
001200 77  TWA-SIZE                       PIC S9(4) COMP.               00190000
       77  WS-B1PRINT-LENGTH              PIC S9(4) COMP.               00200000
001300 77  ACATVR-DATASET                 PIC X(08) VALUE 'ACATIT'.     00210000
TEMP   77  WS-EDITMOD                     PIC X(08) VALUE 'EDITMOD2'.   00220000
TEMP   77  WS-ACATNAIO                    PIC X(08) VALUE 'ACAT00NA'.   00230000
TEMP   77  WS-ACATPPIO                    PIC X(08) VALUE 'ACATPPDB'.   00240000
TEMP   77  WS-ACAT02DB                    PIC X(08) VALUE 'ACAT02DB'.   00250000
TEMP   77  WS-ACATSRCH                    PIC X(08) VALUE 'ACATSRCH'.   00260000
LRM002 77  WS-ACATRST                     PIC X(08) VALUE 'ACATRST '.   00270000
                                                                        00280000
       77  WS-MCACCT                      PIC X(20) VALUE SPACES.       00290000
       77  CURR-EDIT-LEN                  PIC S9(4) COMP  VALUE +35.    00300000
001400*******************************************************           00310000
001500*      TSQ WORK AREA                                              00320000
001600*******************************************************           00330000
001700 01  TSQ-WORK-AREA.                                               00340000
001800     05  TSQ-NAME.                                                00350000
001900         09 TERM-ID                     PIC X(04).                00360000
002000         09 TRAN-ID                     PIC X(04).                00370000
002100     05  ITEM-NUM                       PIC S9(04) COMP VALUE +1. 00380000
002200 EJECT                                                            00390000
       01  WS-DB2-PROBLEM-MSG.                                          00400000
           05  FILLER                     PIC X(36) VALUE               00410000
           'ACAT02IT - DB2 UNEXPECTED ERROR '.                          00420000
           05  WS-DB2-PROBLEM-FUNCTION    PIC X(06) VALUE SPACES.       00430000
           05  WS-DB2-PROBLEM-TABLE       PIC X(09) VALUE SPACES.       00440000
           05  WS-DB2-PROBLEM-ID          PIC -999  VALUE SPACES.       00450000
LRM006     05  FILLER                     PIC X(15) VALUE               00460000
LRM006         ' CALL HELP DESK'.                                       00470000
                                                                        00480000
       01  WS-SUBMITTED-MSG               PIC X(70) VALUE               00490000
           'TIF ALREADY SUBMITTED TO NSCC; AWAITING REPLY; BROWSE ONLY'.00500000
       01  WS-ACKNOWLEDGE-MSG             PIC X(50) VALUE               00510000
           'TIF AWAITING NSCC ACKNOWLEDGEMENT; BROWSE ONLY'.            00520000
       01  WS-DUPE-MSG.                                                 00530000
           05  WS-DUPE-MSG-TEXT           PIC X(51) VALUE SPACES.       00540000
           05  WS-DUPE-CONTROL-NBR        PIC X(14) VALUE SPACES.       00550000
       01  EDIT-CURR-AREA.                                              00560000
           05  WK-TABLE-LOOKUP-CODE       PIC X(01) VALUE 'E'.          00570000
           05  WK-NUM-OF-TABLE            PIC S9(03) COMP-3 VALUE +1.   00580000
           05  WK-NAME-OF-LOOKUP-TABLE    PIC X(08) VALUE SPACE.        00590000
           05  WK-NUM-OF-LOOKUP-ENTRY     PIC S9(03) COMP-3 VALUE +1.   00600000
           05  WK-ISSUE-CURR-IN           PIC X(10) VALUE LOW-VALUE.    00610000
           05  WK-ISSUE-CURR-OUT          PIC X(10) VALUE SPACES.       00620000
           05  WK-ISSUE-CURR-RET-CODE     PIC X(01) VALUE SPACE.        00630000
           05  FILLER                     PIC X(01) VALUE HIGH-VALUE.   00640000
002200 EJECT                                                            00650000
004300*******************************************************           00660000
004400*      GET DATE TIME LAYOUT                                       00670000
004500*******************************************************           00680000
004600 01  WSWORKAREA.                                                  00690000
004700     05  WSABSTIME           PIC S9(08) COMP.                     00700000
004800     05  WSMMDDYY.                                                00710000
               09 WS-CUR-MM        PIC XX.                              00720000
               09  FILLER          PIC X.                               00730000
               09 WS-CUR-DD        PIC XX.                              00740000
               09  FILLER          PIC X.                               00750000
               09 WS-CUR-YY        PIC XX.                              00760000
004900     05  WSDATESEP           PIC X(01) VALUE '/'.                 00770000
005000     05  WSTIME.                                                  00780000
               09  WS-TIME-HH      PIC XX.                              00790000
               09  FILLER          PIC X.                               00800000
               09  WS-TIME-MM      PIC XX.                              00810000
               09  FILLER          PIC X.                               00820000
               09  WS-TIME-SS      PIC XX.                              00830000
005100     05  WSTIMESEP           PIC X(01) VALUE ':'.                 00840000
ET0001     05  WS-CURRENT-TIME.                                         00850000
ET0001         09  WS-CURRENT-HH   PIC XX.                              00860000
ET0001         09  WS-CURRENT-MM   PIC XX.                              00870000
005200                                                                  00880000
005300 EJECT                                                            00890000
005400*******************************************************           00900000
005500*      I/O CALL AREAS.                                            00910000
005600*******************************************************           00920000
       01  ACATNAIO-CALL-AREA.                                          00930000
           COPY ACATNAIO.                                               00940000
                                                                        00950000
       01  ACATPPIO-CALL-AREA.                                          00960000
           COPY ACATPPIO.                                               00970000
                                                                        00980000
LRM002 01  ACATRSTIO-CALL-AREA.                                         00990000
LRM002     COPY ACATRSIO.                                               01000000
                                                                        01001000
       01  ACAT02IO-CALL-AREA.                                          01002000
           COPY ACAT02IO.                                               01003000
005300 EJECT                                                            01004000
005400*******************************************************           01005000
005500*      B1 WORK AREA                                               01006000
005600*******************************************************           01007000
       01  B1-RECORD.                                                   01008000
           05  B1-REC-ID.                                               01009000
               09  B1-CLIENT-NO          PIC 9(03) COMP-3.              01010000
               09  B1-CARD-NO            PIC 9(07) COMP-3.              01020000
               09  B1-CLIENT             PIC 9(03) COMP-3.              01030000
               09  B1-SEQUENCE           PIC 9(05) COMP-3 VALUE 1.      01040000
           05  B1-REC-TYP-3              PIC X(01) VALUE '3'.           01050000
           05  B1-RETURN-VALUE           PIC X(35).                     01060000
006100                                                                  01070000
006000 EJECT                                                            01080000
006100                                                                  01090000
006200*******************************************************           01100000
006300*      ACAT02 WORK AREA                                           01110000
006400*******************************************************           01120000
006500 01  ACAT-WORK-AREA.                                              01130000
           05  W-SUB1                    PIC  9(004) VALUE 0.           01140000
           05 W-IRA-B1-SW                PIC  X(001).                   01150000
              88 W-IRA-B1-FOUND               VALUE 'Y'.                01160000
           05 W-CLASS-CODE-B1-SW         PIC  X(001).                   01170000
              88 W-CLASS-CODE-B1-FOUND        VALUE 'Y'.                01180000
LRM004     05 W-CUST-TYPE-B1-SW          PIC  X(001).                   01190000
LRM004        88 W-CUST-TYPE-B1-FOUND         VALUE 'Y'.                01200000
LRM004     05 W-ADT-CUSTOMER-TYPE.                                      01210000
LRM004        07 W-ADT-CUSTOMER-TYPE-9   PIC  9(003).                   01220000
           05 W-RETIRE-ACCOUNT-SW        PIC  X(001).                   01230000
              88 W-RETIRE-ACCOUNT-FOUND       VALUE 'Y'.                01240000
           05 W-IRA-BR-RANGE-SW          PIC  X(001).                   01250000
              88 W-IRA-BR-RANGE-FOUND         VALUE 'Y'.                01260000
           05 W-IRA-BR-ACT-RANGE-SW      PIC  X(001).                   01270000
              88 W-IRA-BR-ACT-RANGE-FOUND     VALUE 'Y'.                01280000
434531     05  BH-ACAT-DEFAULT-CUSTOMER-TYPE   PIC XX VALUE SPACES.     01290000
434504     05  BH-ACAT-DEFINE-CUSTOMER-TYPE   PIC X(1) VALUE '0'.       01300000
434534     05  BH-ACAT-RETIRE-ACT-SUB-CTG-NO   PIC S9(3) COMP-3 VALUE 0.01310000
           05  BH-ACAT-RETIRE-ACT-SUB-CTG.                              01320000
               07  BH-ACAT-RETIRE-ACT-SUB-CTG-ENT OCCURS 40 TIMES.      01330000
                   09  BH-ACAT-RETIRE-ACT-IRA-CODE     PIC X(1).        01340000
                   09  FILLER                          PIC X.           01350000
                   09  BH-ACAT-RETIRE-ACT-CUST-TYPE    PIC X(2).        01360000
434535     05  BH-ACAT-CUST-TYPE-VALUE-NO    PIC 9(3) COMP-3 VALUE 0.   01370000
           05  BH-ACAT-CUST-TYPE-VALUES.                                01380000
               07  BH-ACAT-CUST-TYPE-VALUE-ENTRY  OCCURS 100 TIMES.     01390000
                   09  BH-ACAT-CUST-TYPE-FROM-NA       PIC X(3).        01400000
                   09  FILLER                          PIC X.           01410000
                   09  BH-ACAT-CUST-ACCT-TYPE          PIC X(2).        01420000
009125     05  BH-MGCA-IRA-BR-RANGE-NO       PIC 9(3) COMP-3 VALUE 0.   01430000
           05  BH-MGCA-IRA-BR-RANGE.                                    01440000
               07  BH-MGCA-IRA-BR-RANGE-ENTRY      OCCURS 50 TIMES.     01450000
                   09  BH-MGCA-IRA-BR-RANGE-LO         PIC X(3).        01460000
                   09  FILLER                          PIC X.           01470000
                   09  BH-MGCA-IRA-BR-RANGE-HI         PIC X(3).        01480000
009126     05  BH-MGCA-IRA-BR-ACT-RANGE-NO   PIC 9(3) COMP-3 VALUE 0.   01490000
           05  BH-MGCA-IRA-BR-ACT-RANGE.                                01500000
               07  BH-MGCA-IRA-BR-ACT-RANGE-ENTRY  OCCURS 50 TIMES.     01510000
                   09  BH-MGCA-IRA-BR-ACT-BR-LO        PIC X(3).        01520000
                   09  FILLER                          PIC X.           01530000
                   09  BH-MGCA-IRA-BR-ACT-BR-HI        PIC X(3).        01540000
                   09  FILLER                          PIC X.           01550000
                   09  BH-MGCA-IRA-BR-ACT-ACT-LO       PIC X(5).        01560000
                   09  FILLER                          PIC X.           01570000
                   09  BH-MGCA-IRA-BR-ACT-ACT-HI       PIC X(5).        01580000
           05  CURRENCY-NUM               PIC 9(03).                    01590000
           05  CURRENCY-X REDEFINES CURRENCY-NUM                        01600000
                                          PIC X(03).                    01610000
           05  WORK-AUTH-BRANCH           PIC X(03).                    01620000
           05  WORK-AUTH-AE               PIC X(03).                    01630000
006600     05  CALLED-PROGRAM-NAME        PIC X(08).                    01640000
006600     05  WORK-QTY-X                 PIC X(20).                    01650000
006700     05  FILLER REDEFINES WORK-QTY-X.                             01660000
006800         09 WORK-QTY                PIC 9(12)V9(05).              01670000
006900         09 FILLER                  PIC X(03).                    01680000
007000     05  WORK-DATE-X.                                             01690000
007100         09 WORK-DATE-X-MM          PIC X(02).                    01700000
007200         09 FILLER                  PIC X(01).                    01710000
007300         09 WORK-DATE-X-YY          PIC X(02).                    01720000
007400     05  WORK-DATE.                                               01730000
007500         09 WORK-DATE-MM            PIC X(02).                    01740000
007600         09 WORK-DATE-YY            PIC X(02).                    01750000
007700     05  TWA-CLIENT-NO-X.                                         01760000
007700         09 TWA-CLIENT-NO-9         PIC 9(04).                    01770000
007800     05  WK-BRW-KEY.                                              01780000
007900         09 WK-BRW-CLIENT           PIC X(03).                    01790000
007900         09 WK-BRW-RECORD-TYPE      PIC X(02)   VALUE '90'.       01800000
008000         09 WK-BRW-CUR-BR-AC.                                     01810000
                  15 WK-BRW-CURRENCY      PIC X(03).                    01820000
                  15 WK-BRW-BRANCH        PIC X(03).                    01830000
                  15 WK-BRW-ACCOUNT       PIC X(05).                    01840000
           05  WK-SUSPEND-COUNT           PIC S9(04) COMP VALUE ZERO.   01850000
           05  WK-BROWSE-FORWARD-FLAG     PIC X(01) VALUE 'Y'.          01860000
               88  WK-BROWSE-FORWARD      VALUE 'Y'.                    01870000
               88  WK-BROWSE-BACKWARD     VALUE 'N'.                    01880000
008300     05  ALARM-NEEDED-FLAG          PIC X(01)  VALUE 'N'.         01890000
008400         88  ALARM-NEEDED           VALUE  'Y'.                   01900000
008700     05  END-OF-DATA-FLAG           PIC X(01)  VALUE 'N'.         01910000
008800         88  END-OF-DATA            VALUE  'Y'.                   01920000
008900     05  INPUT-ERROR-FLAG           PIC X(01)  VALUE 'N'.         01930000
009000         88  INPUT-ERROR            VALUE  'Y'.                   01940000
009100     05  FIRST-TIME-FLAG            PIC X(01)  VALUE 'N'.         01950000
009200         88  FIRST-TIME             VALUE  'Y'.                   01960000
           05  WS-DELETE-FLAG             PIC X(01)  VALUE 'N'.         01970000
               88  WS-DELETE              VALUE 'Y'.                    01980000
           05  WS-ACCOUNT-CHANGED-FLAG    PIC X(01)  VALUE 'N'.         01990000
               88  ACCOUNT-CHANGED        VALUE  'Y'.                   02000000
LRM011     05  WS-ACCOUNT-TYPE-CHANGED-FG PIC X(01)  VALUE 'N'.         02010000
LRM011         88  ACCOUNT-TYPE-CHANGED   VALUE  'Y'.                   02020000
           05  WS-ERROR-THIS-LINE-FLAG    PIC X(01)  VALUE 'N'.         02030000
               88  ERROR-THIS-LINE        VALUE  'Y'.                   02040000
           05  WS-MCACCT-SW               PIC X(01)  VALUE 'N'.         02050000
               88  MCACCT-ERROR           VALUE 'Y'.                    02060000
ET0001     05  WS-LATE-REJ-SUBMIT-SW      PIC X(01).                    02070000
009300     05  ERASE-KEY-VALUE            PIC S9(04) COMP VALUE +128.   02080000
009400     05  FILLER REDEFINES ERASE-KEY-VALUE.                        02090000
009500         09  FILLER                 PIC X(01).                    02100000
009600         09  ERASE-KEY              PIC X(01).                    02110000
009700     05  REFORMAT-TIME              PIC 9(07).                    02120000
009800     05  FILLER REDEFINES REFORMAT-TIME.                          02130000
009900         09  FILLER                 PIC X(01).                    02140000
010000         09  REFORMAT-HH            PIC X(02).                    02150000
010100         09  REFORMAT-MM            PIC X(02).                    02160000
010200         09  FILLER                 PIC X(02).                    02170000
010300     05  WORK-TIME.                                               02180000
010400         09  WORK-HH                PIC X(02).                    02190000
010500         09  FILLER                 PIC X(01) VALUE ':'.          02200000
010600         09  WORK-MM                PIC X(02).                    02210000
010700     05  INPUT-OPT-SPACE-FLAG       PIC X(01)  VALUE 'N'.         02220000
010800         88  INPUT-OPT-SPACE        VALUE  'Y'.                   02230000
010900     05  DATA-ONLY-FLAG             PIC X(01)  VALUE 'N'.         02240000
011000         88  DATA-ONLY              VALUE  'Y'.                   02250000
           05  WK-CURSOR                  PIC S9(04) COMP.              02260000
           05  SYSTEM-MSG                 PIC X(79) VALUE SPACES.       02270000
           05  ABEND-LINE.                                              02280000
               09  ABEND-MSG              PIC X(30).                    02290000
               09  FILLER                 PIC X(11) VALUE ' EIBRESP ='. 02300000
               09  ABEND-EIBRESP          PIC 99.                       02310000
011100     05  UNAUTH-MESSAGE             PIC X(79)                     02320000
011500         VALUE 'UNAUTHORIZED USER.'.                              02330000
011100     05  SEC-MESSAGE                PIC X(79)                     02340000
011500         VALUE 'SIGN ON SECURITY NOT AVAILABLE, TRY AGAIN.'.      02350000
011200     05  ERROR-PROG-MSG.                                          02360000
011300         09  ERROR-PROG-NAME        PIC X(08).                    02370000
011400         09  FILLER                 PIC X(71)                     02380000
011500             VALUE ' PROGRAM NOT AVAILIABLE.'.                    02390000
LRM003     05  WS-FULL-FREEZE-MSG         PIC X(23) VALUE               02400000
LRM003                              'ACCOUNT IS FULLY FROZEN'.          02401000
LRM003     05  WS-CASH-FREEZE-MSG         PIC X(29) VALUE               02402000
LRM003                              'ACCOUNT IS FROZEN FOR CASH IN'.    02403000
LRM003     05  WS-SEC-FREEZE-MSG          PIC X(28) VALUE               02404000
LRM003                              'ACCOUNT IS FROZEN FOR SEC IN'.     02405000
011600     05  SAVE-INTRAN-FLAG           PIC X(01).                    02406000
011700     05  PREV-INTRAN-FLAG           PIC X(01).                    02407000
011800     05  WS-ACAT-NEXT               PIC X.                        02408000
011900     05  LINE-COUNT                 PIC 9(03).                    02409000
012000     05  SUB                        PIC S9(03) COMP-3.            02410000
012000     05  SUB2                       PIC S9(03) COMP-3.            02420000
           05  WS-SSN-EDIT-FLAG           PIC X  VALUE SPACES.          02430000
               88  SSN-INVALID            VALUE 'I'.                    02440000
               88  SSN-VALID              VALUE 'V'.                    02450000
           05  WS-SSN-EDIT                PIC X(11) VALUE SPACES.       02460000
00032                                                                   02470000
           EJECT                                                        02480000
       COPY ACATCOM.                                                    02490000
           EJECT                                                        02500000
       COPY ACATSRCH.                                                   02510000
           EJECT                                                        02520000
       COPY SECLINKC.                                                   02530000
           EJECT                                                        02540000
017600 COPY ATTR.                                                       02550000
017700     EJECT                                                        02560000
017800 COPY DFHAID.                                                     02570000
017900     EJECT                                                        02580000
018000 COPY ACAT00M.                                                    02590000
018000 COPY ACAT02M.                                                    02600000
                                                                        02600100
           EJECT                                                        02600200
018000 COPY CATACTYP.                                                   02601000
                                                                        02610000
021300      EJECT                                                       02770000
       01  WS-POP-UP-WORKAREA.                                          02780000
            COPY ACAT90TS.                                              02790000
021300      EJECT                                                       02800000
021400 LINKAGE SECTION.                                                 02810000
021500 01  DFHCOMMAREA.                                                 02820000
021600     03  FILLER                    PIC X(2000).                   02830000
                                                                        02840000
021700 COPY TWACOMMN.                                                   02850000
021800     03 TWA-ACAT-AREA.                                            02860000
              05 TWA-ACAT-NOT-FOUND-FLAG      PIC X(01).                02870000
014100           88 TWA-ACAT-NOT-FOUND        VALUE 'Y'.                02880000
              05  TWA-CONFIRM-FLAG            PIC X.                    02890000
                 88 TWA-CONFIRM               VALUE 'Y'.                02900000
013800        05 TWA-INTRAN-FLAG              PIC X.                    02910000
014100           88 TWA-INTRAN-BRW            VALUE 'B'.                02920000
014200           88 TWA-INTRAN-UPDATE         VALUE 'U'.                02930000
014200           88 TWA-INTRAN-ACT            VALUE 'T'.                02940000
014300           88 TWA-INTRAN-NO-CHANGE      VALUE 'N'.                02950000
              05 TWA-ACTION            PIC X.                           02960000
              05 TWA-MAP-TABLE.                                         02970000
                  07 TWA-SCREEN        PIC X(01).                       02980000
                  07 TWA-ACAT90CM-TS-UPDATE-IND                         02990000
                                       PIC X(01).                       03000000
                  07 TWA-BRN-ACCT.                                      03010000
                     09 TWA-MBR           PIC X(03).                    03020000
                     09 TWA-MAC           PIC X(05).                    03030000
                  07 TWA-MRR           PIC X(03).                       03040000
                  07 TWA-MCTYPE        PIC X(02).                       03050000
                  07 TWA-MCBRKR        PIC X(04).                       03060000
                  07 TWA-MCBNAM        PIC X(30).                       03070000
                  07 TWA-MCACCT        PIC X(20).                       03080000
                  07 TWA-MNAME         PIC X(30).                       03090000
                  07 TWA-MNAME2        PIC X(30).                       03100000
                  07 TWA-MNAME3        PIC X(30).                       03110000
                  07 TWA-MSSN          PIC X(11).                       03120000
                  07 TWA-MSSN2         PIC X(11).                       03130000
                  07 TWA-MCCMNT-X120.                                   03140000
                     09 TWA-MCCMNT     PIC X(60).                       03150000
                     09 TWA-MCCMNT2    PIC X(60).                       03160000
                  07 TWA-NA-IRA        PIC X(01).                       03170000
                  07 TWA-MSUBM         PIC X(01).                       03180000
                  07 TWA-MACAT         PIC X(14).                       03190000
                  07 TWA-MSTAT         PIC X(03).                       03200000
                  07 TWA-MNEXT         PIC X(01).                       03210000
                  07 TWA-MCMNT         PIC X(01).                       03220000
                  07 TWA-MDEL          PIC X(01).                       03230000
                  07 TWA-MMRR          PIC X(03).                       03240000
                  07 TWA-MSD           PIC X(08).                       03250000
                  07 TWA-CONTROL-NBR   PIC X(14).                       03260000
                  07 TWA-TRNFR-TYPE-RJCT-CD PIC X(02).                  03270000
                  07 TWA-ORIG-DLVR-NBR PIC X(04).                       03280000
                  07 TWA-ORIG-DLVR-ACCT PIC X(20).                      03290000
                  07 TWA-TRANS-TYPE-CD PIC X(01).                       03300000
                  07 TWA-STTS-CD       PIC X(03).                       03310000
                  07 TWA-UPDT-TMSTP    PIC X(26).                       03320000
                  07 TWA-MMBR          PIC X(03).                       03330000
                  07 TWA-MMAC          PIC X(05).                       03340000
                  07 TWA-HIST-DELETE-IND PIC X.                         03350000
ET0001            07 TWA-STTLM-TM-CD     PIC X.                         03360000
              05 TWA-CALLING-PROG      PIC X(08).                       03370000
              05 TWA-HISTORY-NOTITY-IND PIC X.                          03380000
                 88 TWA-HISTORY-NOTIFIED VALUE 'Y'.                     03390000
LRM002        05 TWA-EDIT-MCBRKR       PIC X(04).                       03390100
LRM002        05 TWA-EDIT-MCACCT       PIC X(20).                       03390200
              05 TWA-PRIOR-INP-SEL     PIC X.                           03390300
              05 TWA-PAGE-AREA.                                         03390400
                  07 TWA-CURRENT-KEY.                                   03390500
                     09 TWA-CURRENT-BRANCH  PIC X(03).                  03390600
                     09 TWA-CURRENT-ACCOUNT PIC X(05).                  03390700
023800                                                                  03390800
           EJECT                                                        03390900
  *****COPY ACATRPRQ REPLACING ==:ACAT:== BY ==MI==.                    03391000
023900     EJECT                                                        03392000
023800                                                                  03393000
024000 PROCEDURE DIVISION.                                              03394000
024100 INITIALIZATION.                                                  03395000
024200     EXEC CICS IGNORE CONDITION DUPKEY DUPREC  ENDFILE  ERROR     03396000
024300               ILLOGIC INVREQ   IOERR  ITEMERR LENGERR  MAPFAIL   03397000
024400               NOSPACE NOSTG    NOTFND         PGMIDERR QIDERR    03398000
024500     END-EXEC.                                                    03399000
024600     EXEC CICS HANDLE CONDITION NOTOPEN (NOT-OPEN)                03400000
024700                               DISABLED (NOT-OPEN)                03410000
024800                               DSIDERR  (NOT-OPEN)                03420000
024900     END-EXEC.                                                    03430000
025000                                                                  03440000
025100     EXEC CICS ASSIGN TWALENG (TWA-SIZE)                          03450000
025200     END-EXEC.                                                    03460000
025300     IF TWA-SIZE = 0                                              03470000
              MOVE LOW-VALUE TO ACAT02MO                                03480000
025400        MOVE 'TWA SIZE EQUAL ZERO, FATAL ERROR' TO SYSTEM-MSG     03490000
025500        PERFORM  ERROR-RTN.                                       03500000
025600                                                                  03510000
025700     EXEC CICS ADDRESS TWA (ADDRESS OF TWA-AREA)                  03520000
025800     END-EXEC.                                                    03530000
025900                                                                  03540000
026000     EJECT                                                        03550000
026100                                                                  03560000
026200 MAIN-PROCESSING.                                                 03570000
026300     MOVE EIBTRMID TO TERM-ID.                                    03580000
026400     MOVE EIBTRNID TO TRAN-ID.                                    03590000
026500     MOVE TWA-CLIENT-NO TO TWA-CLIENT-NO-9.                       03600000
026600     MOVE 'N'           TO END-OF-DATA-FLAG.                      03610000
026700     MOVE SPACES        TO SYSTEM-MSG.                            03620000
           MOVE 0             TO WK-SUSPEND-COUNT.                      03630000
           MOVE 0             TO WK-CURSOR.                             03640000
026800     MOVE 0             TO LINE-COUNT.                            03650000
026900     MOVE LOW-VALUE     TO ACAT02MO.                              03660000
     ***   MOVE ATT-UNPROT TO NEXTA                                     03670000
027100     PERFORM GET-DATE-AND-TIME-RTN.                               03680000
027200     MOVE DFHCOMMAREA          TO ACATCOMM-COMMAREA.              03690000
           PERFORM SET-TRANSACTION-SECURITY-RTN.                        03700000
           IF ACAT-CALLING-PROG-NAME = 'ACAT06JC'                       03710000
           AND ACAT-INP-SEL NOT = 'A'                                   03720000
              MOVE '6' TO TWA-ACTION                                    03730000
              MOVE ACAT-CALLING-PROG-NAME TO TWA-CALLING-PROG           03740000
              MOVE ACAT-INP-SEL TO TWA-PRIOR-INP-SEL                    03750000
           ELSE                                                         03760000
           IF ACAT-CALLING-PROG-NAME = 'ACAT07JS'                       03770000
           AND ACAT-INP-SEL NOT = 'A'                                   03780000
              MOVE '6' TO TWA-ACTION                                    03790000
              MOVE ACAT-CALLING-PROG-NAME TO TWA-CALLING-PROG           03800000
              MOVE ACAT-INP-SEL TO TWA-PRIOR-INP-SEL                    03810000
           ELSE                                                         03820000
           IF ACAT-CALLING-PROG-NAME = 'ACAT22TH'                       03830000
           AND ACAT-INP-SEL NOT = 'A'                                   03840000
              MOVE '7' TO TWA-ACTION                                    03850000
              MOVE ACAT-CALLING-PROG-NAME TO TWA-CALLING-PROG           03860000
              MOVE ACAT-INP-SEL TO TWA-PRIOR-INP-SEL                    03870000
           ELSE                                                         03880000
              MOVE SPACES                 TO TWA-CALLING-PROG           03890000
           END-IF.                                                      03900000
           MOVE ' ' TO ACAT-INP-SEL.                                    03910000
           IF  ACAT-PROGRAM-NAME = 'ACAT02IT'                           03920000
               MOVE SPACES TO ACAT-CALLING-PROG-NAME                    03930000
028100         PERFORM CONTINUE-PROCESS                                 03940000
028000     ELSE                                                         03950000
           IF  ACAT-PROGRAM-NAME = 'RATT01  '                           03960000
               MOVE SPACES TO ACAT-CALLING-PROG-NAME                    03970000
032500         PERFORM READ-TSQ-RTN                                     03980000
032600         PERFORM DELETE-TSQ-RTN                                   03990000
028000     ELSE                                                         04000000
               MOVE 'ACAT02IT' TO ACAT-PROGRAM-NAME                     04010000
027900         PERFORM FIRST-TIME-THRU                                  04020000
028300     END-IF.                                                      04030000
028400     EJECT                                                        04040000
028500                                                                  04050000
028600 GET-DATE-AND-TIME-RTN.                                           04060000
028700     EXEC  CICS ASKTIME                                           04070000
028800           ABSTIME(WSABSTIME)                                     04080000
028900     END-EXEC.                                                    04090000
029000     EXEC  CICS FORMATTIME                                        04100000
029100           ABSTIME(WSABSTIME)                                     04110000
029200           MMDDYY(WSMMDDYY)                                       04120000
029300           DATESEP(WSDATESEP)                                     04130000
029400           TIME(WSTIME)                                           04140000
029500           TIMESEP(WSTIMESEP)                                     04150000
029600     END-EXEC.                                                    04160000
029900                                                                  04170000
030800     EJECT                                                        04180000
030900                                                                  04190000
031000 FIRST-TIME-THRU.                                                 04200000
           IF EIBAID = DFHPF10                                          04210000
           AND ACAT-CALLING-PROG-NAME = 'ACAT90CM'                      04220000
              PERFORM READ-TSQ-RTN                                      04230000
              PERFORM DELETE-TSQ-RTN                                    04240000
              PERFORM READ-ACAT90CM-TS-RTN                              04250000
              MOVE 'DISPLAY REFRESHED' TO SYSTEM-MSG                    04260000
              MOVE TWA-PRIOR-INP-SEL TO ACAT-INP-SEL                    04270000
           ELSE                                                         04280000
              MOVE SPACES              TO TWA-MAP-TABLE                 04290000
              MOVE ACAT-INP-BRANCH     TO TWA-MBR  TWA-CURRENT-BRANCH   04300000
              MOVE ACAT-INP-ACCOUNT    TO TWA-MAC  TWA-CURRENT-ACCOUNT  04310000
              MOVE ACAT-INP-RR         TO TWA-MMRR                      04320000
              MOVE ACAT-INP-CONTRA-BKR TO TWA-MCBRKR                    04330000
              MOVE SPACES TO TWA-PRIOR-INP-SEL                          04340000
           END-IF.                                                      04350000
           MOVE SPACES TO TWA-MCMNT MCMNTO.                             04360000
           SET FIRST-TIME TO TRUE.                                      04370000
           MOVE 'A' TO ACAT-NEXT                                        04380000
           PERFORM DELETE-TSQ-RTN.                                      04390000
           IF TWA-ACTION = '6' OR '7'                                   04400000
              PERFORM FORMAT-FROM-PRIOR-TIF-RTN.                        04410000
           PERFORM REFORMAT-SCREEN-DETAIL.                              04420000
           PERFORM PROCESS-MAP-ITEMS                                    04430000
               THRU PROCESS-MAP-ITEMS-EXIT.                             04440000
                                                                        04450000
   ***** CAUSE UPDATE UPON RETURN FROM POP-UP IF NO ERRORS FOUND.       04460000
           IF ACAT-SIGN-ON-UPDATE                                       04470000
           AND NOT INPUT-ERROR                                          04480000
           AND ACAT-CALLING-PROG-NAME = 'ACAT90CM'                      04490000
               PERFORM UPDATE-ACAT-IT-RTN.                              04500000
                                                                        04510000
           IF NOT ACAT-SIGN-ON-UPDATE                                   04520000
           AND EIBAID = DFHPF2                                          04530000
LRM007        IF ACAT-ASCENDIS-CLIENT                                   04540000
LRM007           MOVE                                                   04550000
LRM007     'ASCENDIS USER DOES NOT HAVE CREATE AUTHORITY; PF2 IGNORED'  04560000
LRM007              TO SYSTEM-MSG                                       04570000
LRM007        ELSE                                                      04580000
                 MOVE                                                   04590000
                   'USER DOES NOT HAVE CREATE AUTHORITY; PF2 IGNORED'   04600000
                    TO SYSTEM-MSG                                       04610000
           END-IF.                                                      04620000
           MOVE SPACES TO ACAT-CALLING-PROG-NAME                        04630000
           PERFORM SEND-MAP-ERASE.                                      04640000
           PERFORM WRITE-TSQ-RTN.                                       04650000
           PERFORM RETURN-TO-CICS.                                      04660000
       EJECT                                                            04670000
       SET-TRANSACTION-SECURITY-RTN.                                    04680000
LRM007     IF ACAT-ASCENDIS-CLIENT                                      04690000
LRM007        SET ACAT-SIGN-ON-BROWSE TO TRUE                           04700000
LRM007     ELSE                                                         04710000
           IF ACAT-SUPER-SIGN-ON-UPDATE                                 04720000
              SET ACAT-SIGN-ON-UPDATE TO TRUE                           04730000
           ELSE                                                         04740000
               MOVE 'AU'         TO ACAT-SCREEN-IND                     04750000
               SET ACAT-UPDATE-MODE TO TRUE                             04760000
               MOVE SPACES    TO SECLINK-LIST                           04770000
               MOVE '2'       TO SECLINK-ACTION-CODE                    04780000
               MOVE 'SCON'    TO SECLINK-TYPE                           04790000
               MOVE ACAT-SEC-LIT TO SECLINK-ITEM                        04800000
               PERFORM CALL-SECLINK-RTN                                 04810000
               IF SECLINK-RETURN-CODE = '00' OR '20'                    04820000
                  SET ACAT-SIGN-ON-UPDATE TO TRUE                       04830000
               ELSE                                                     04840000
                  SET ACAT-SIGN-ON-BROWSE TO TRUE                       04850000
           END-IF.                                                      04860000
                                                                        04870000
       READ-B1-RTN.                                                     04880000
           MOVE +22 TO WS-B1PRINT-LENGTH.                               04890000
           EXEC CICS READ                                               04900000
                     DATASET('B1PRINT')                                 04910000
                     INTO(B1-RECORD)                                    04920000
                     RIDFLD(B1-REC-ID)                                  04930000
                     LENGTH(WS-B1PRINT-LENGTH)                          04940000
           END-EXEC.                                                    04950000
       READ-B1-RTN-LONG.                                                04960000
           EXEC CICS READ                                               04970000
                     DATASET('B1PRINT')                                 04980000
                     INTO(B1-RECORD)                                    04990000
                     RIDFLD(B1-REC-ID)                                  05000000
                     LENGTH(LENGTH OF B1-RECORD)                        05010000
           END-EXEC.                                                    05020000
       EJECT                                                            05030000
                                                                        05040000
   400 CONTINUE-PROCESS.                                                05050000
032500     PERFORM READ-TSQ-RTN.                                        05060000
032600     PERFORM DELETE-TSQ-RTN.                                      05070000
032700     SET DATA-ONLY TO TRUE.                                       05080000
033000     EVALUATE TRUE                                                05090000
033100          WHEN EIBAID = DFHPF11 OR DFHCLEAR                       05100000
033200               PERFORM RETURN-CONTROL-RTN                         05110000
033300          WHEN EIBAID = DFHENTER OR DFHPF9                        05120000
033400               PERFORM ENTER-KEY-RTN                              05130000
                WHEN EIBAID = DFHPF1                                    05140000
                     MOVE 'A' TO TWA-SCREEN                             05150000
LRM008               PERFORM RECEIVE-MAP-RTN                            05160000
LRM008               PERFORM EDIT-INPUT-BRW-RTN                         05170000
LRM008               PERFORM MERGE-MAP-DTL-RTN                          05180000
                     PERFORM SEND-POPUP-MAP-RTN                         05190000
                WHEN EIBAID = DFHPF2                                    05200000
                     MOVE 'A' TO TWA-ACTION                             05210000
                     PERFORM FIRST-TIME-THRU                            05220000
033500          WHEN EIBAID = DFHPA1                                    05230000
033600               PERFORM PAGE-FORWARD-RTN                           05240000
033700          WHEN EIBAID = DFHPA2                                    05250000
033800               PERFORM PAGE-BACKWARD-RTN                          05260000
033900          WHEN OTHER                                              05270000
                     MOVE LOW-VALUE TO ACAT02MO                         05280000
                     MOVE -1 TO MNEXTL                                  05290000
034000               MOVE 'ERROR FUNCTION KEY'                          05300000
034100                 TO SYSTEM-MSG                                    05310000
034200               PERFORM ERROR-RTN                                  05320000
034300     END-EVALUATE.                                                05330000
034400                                                                  05340000
034500     EJECT                                                        05350000
037400                                                                  05360000
037500 RECEIVE-MAP-RTN.                                                 05370000
037600     EXEC CICS RECEIVE MAP('TRLMAP')                              05380000
037700                       MAPSET('ACAT00M')                          05390000
                             FROM(ACAT-RECEIVE-MAP)                     05400000
037800                       LENGTH(ACAT-RECEIVE-MAP-LENGTH)            05410000
037900     END-EXEC.                                                    05420000
           MOVE +1000 TO ACAT-RECEIVE-MAP-LENGTH.                       05430000
037600     EXEC CICS RECEIVE MAP('ACAT02M')                             05440000
037700                       MAPSET('ACAT02M')                          05450000
                             FROM(ACAT-RECEIVE-MAP)                     05460000
037800                       LENGTH(ACAT-RECEIVE-MAP-LENGTH)            05470000
037900     END-EXEC.                                                    05480000
038000                                                                  05490000
038100     EJECT                                                        05500000
038200                                                                  05510000
038300 ENTER-KEY-RTN.                                                   05520000
038400     PERFORM RECEIVE-MAP-RTN.                                     05530000
038700     PERFORM EDIT-INPUT-BRW-RTN.                                  05540000
*******    IF ACAT-SIGN-ON-UPDATE                                       05550000
038600        PERFORM MERGE-MAP-DTL-RTN.                                05560000
038600     PERFORM MERGE-MAP-NEXT-RTN.                                  05570000
039300     IF TWA-MNEXT GREATER SPACES AND NOT = 'A'                    05580000
              MOVE TWA-MNEXT TO ACAT-INP-SEL                            05590000
039300        PERFORM PROCESS-JUMP-RTN.                                 05600000
           IF TWA-MCMNT GREATER ' '                                     05610000
              MOVE 'A' TO TWA-SCREEN                                    05620000
              PERFORM SEND-POPUP-MAP-RTN.                               05630000
           IF TWA-MCTYPE(1 : 1) = '?'                                   05640000
           OR EIBAID = DFHPF9                                           05650000
              MOVE 'T' TO TWA-SCREEN                                    05660000
              PERFORM SEND-POPUP-MAP-RTN.                               05670000
039300**** IF TWA-INTRAN-BRW                                            05680000
**********    PERFORM PROCESS-BRW-ACATVR-RTN                            05690000
039900**** ELSE                                                         05700000
*********  IF ACAT-SIGN-ON-UPDATE                                       05710000
065800        MOVE 'N' TO INPUT-ERROR-FLAG                              05720000
              PERFORM PROCESS-MAP-ITEMS                                 05730000
                    THRU PROCESS-MAP-ITEMS-EXIT                         05740000
              IF NOT ACAT-SIGN-ON-UPDATE                                05750000
              OR INPUT-ERROR                                            05760000
LRM013        OR (TWA-INTRAN-BRW AND TWA-ACTION NOT = 'A')              05770000
              OR FIRST-TIME                                             05780000
                 MOVE SPACES TO TWA-INTRAN-FLAG                         05790000
                 PERFORM ERROR-RTN                                      05800000
              ELSE                                                      05810000
LRM013          MOVE SPACES TO TWA-INTRAN-FLAG                          05820000
                PERFORM UPDATE-ACAT-IT-RTN                              05830000
                PERFORM ERROR-RTN.                                      05840000
                                                                        05850000
           PERFORM ERROR-RTN.                                           05860000
040200                                                                  05870000
040300 EJECT                                                            05880000
040300 PROCESS-JUMP-RTN.                                                05890000
           MOVE 'ACAT02IT' TO ACAT-CALLING-PROG-NAME.                   05900000
           MOVE ACAT-INP-SEL   TO WS-ACAT-NEXT.                         05910000
           MOVE 'A'            TO ACAT-NEXT ACAT-INP-SEL.               05920000
  *****    MOVE ACAT-COMMON-WORK-AREA TO ACAT-SUM-RESTORE-AREA          05930000
  *****                                  ACAT-NFD-RESTORE-AREA.         05940000
           PERFORM SCREEN-SECURITY-CHECK.                               05950000
                                                                        05960000
       COPY ACATJUMP.                                                   05970000
           IF CALLED-PROGRAM-NAME = SPACES                              05980000
              MOVE -1             TO MNEXTL                             05990000
              MOVE ATT-UNPROT-BRT TO MNEXTA                             06000000
              MOVE 'NEXT TRANSACTION SELECTION IS INVALID' TO           06010000
                  SYSTEM-MSG                                            06020000
              MOVE SPACES     TO ACAT-CALLING-PROG-NAME                 06030000
              PERFORM ERROR-RTN.                                        06040000
                                                                        06050000
           MOVE -1 TO MNEXTL.                                           06060000
           MOVE WS-ACAT-NEXT         TO ACAT-INP-SEL ACAT-NEXT.         06070000
********** MOVE ACAT-INP-TO-ACCOUNT  TO ACAT-BRW-TOP-TO-ACCOUNT.        06080000
           PERFORM INVOKE-DETAIL-PROGRAM-RTN.                           06090000
           MOVE -1 TO MNEXTL.                                           06100000
           PERFORM ERROR-RTN.                                           06110000
                                                                        06120000
       SCREEN-SECURITY-CHECK.                                           06130000
           IF  ACAT-SUPER-SIGN-ON-UPDATE                                06140000
           OR  ACAT-SUPER-SIGN-ON-BROWSE                                06150000
           OR  ACAT-JUMP-ANYWHERE                                       06160000
           OR  WS-ACAT-NEXT = '$'                                       06170000
               CONTINUE                                                 06180000
           ELSE                                                         06190000
               MOVE WS-ACAT-NEXT TO ACAT-SCREEN-IND                     06200000
               SET ACAT-UPDATE-MODE TO TRUE                             06210000
               MOVE SPACES    TO SECLINK-LIST                           06220000
               MOVE '2'       TO SECLINK-ACTION-CODE                    06230000
               MOVE 'SCON'    TO SECLINK-TYPE                           06240000
               MOVE ACAT-SEC-LIT TO SECLINK-ITEM                        06250000
               PERFORM CALL-SECLINK-RTN                                 06260000
               IF SECLINK-RETURN-CODE = '00' OR '20'                    06270000
                  MOVE SECLINK-USER-ID TO ACAT-SIGN-ON-ID               06280000
               ELSE                                                     06290000
                  SET ACAT-BROWSE-MODE TO TRUE                          06300000
                  MOVE SPACES    TO SECLINK-LIST                        06310000
                  MOVE '2'       TO SECLINK-ACTION-CODE                 06320000
                  MOVE 'SCON'    TO SECLINK-TYPE                        06330000
                  MOVE ACAT-SEC-LIT TO SECLINK-ITEM                     06340000
                  PERFORM CALL-SECLINK-RTN                              06350000
                  IF SECLINK-RETURN-CODE = '00' OR '20'                 06360000
                     MOVE SPACE TO ACAT-SIGN-ON-SEC-FLAG                06370000
                  ELSE                                                  06380000
                     MOVE 'USER NOT AUTHORIZED TO USE NEXT SELECTION '  06390000
                          TO SYSTEM-MSG                                 06400000
                     MOVE WS-ACAT-NEXT                                  06410000
                          TO SYSTEM-MSG(44 : 1)                         06420000
                     MOVE -1             TO MNEXTL                      06430000
                     MOVE ATT-UNPROT-BRT TO MNEXTA                      06440000
                     PERFORM ERROR-RTN                                  06450000
                  END-IF                                                06460000
               END-IF                                                   06470000
           END-IF.                                                      06480000
       EJECT                                                            06490000
   100 EDIT-INPUT-BRW-RTN.                                              06500000
      *    MOVE TWA-INTRAN-FLAG TO SAVE-INTRAN-FLAG.                    06510000
           IF MMBRL > 0                                                 06520000
              IF MMBRI = TWA-MMBR                                       06530000
                 CONTINUE                                               06540000
              ELSE                                                      06550000
                 MOVE MMBRI TO TWA-MMBR                                 06560000
                               ACAT-INP-BRANCH                          06570000
              END-IF                                                    06580000
           ELSE                                                         06590000
           IF MMBRA = ERASE-KEY                                         06600000
                 MOVE SPACES TO TWA-MMBR                                06610000
                               ACAT-INP-BRANCH                          06620000
           END-IF END-IF.                                               06630000
                                                                        06640000
           IF MMACL > 0                                                 06650000
              IF MMACI = TWA-MMAC                                       06660000
                 CONTINUE                                               06670000
              ELSE                                                      06680000
                 MOVE MMACI TO TWA-MMAC                                 06690000
                               ACAT-INP-ACCOUNT                         06700000
              END-IF                                                    06710000
           ELSE                                                         06720000
           IF MMACA = ERASE-KEY                                         06730000
                 MOVE SPACES TO TWA-MMAC                                06740000
                               ACAT-INP-ACCOUNT                         06750000
           END-IF END-IF.                                               06760000
                                                                        06770000
           IF MMRRL > 0                                                 06780000
              MOVE MMRRI TO    ACAT-INP-RR                              06790000
           ELSE                                                         06800000
           IF MMRRA = ERASE-KEY                                         06810000
                 MOVE SPACES TO ACAT-INP-RR                             06820000
           END-IF END-IF.                                               06830000
                                                                        06840000
           IF MMTFRL > 0                                                06850000
              MOVE MMTFRI TO   ACAT-INP-TFR-TYP                         06860000
           ELSE                                                         06870000
           IF MMTFRA = ERASE-KEY                                        06880000
                 MOVE SPACES TO ACAT-INP-TFR-TYP                        06890000
           END-IF END-IF.                                               06900000
                                                                        06910000
           IF MMRDL > 0                                                 06920000
              MOVE MMRDI TO    ACAT-INP-RCV-DEL                         06930000
           ELSE                                                         06940000
           IF MMRDA = ERASE-KEY                                         06950000
                 MOVE SPACES TO ACAT-INP-RCV-DEL                        06960000
           END-IF END-IF.                                               06970000
                                                                        06980000
           IF MMBKRL > 0                                                06990000
              MOVE MMBKRI TO   ACAT-INP-CONTRA-BKR                      07000000
           ELSE                                                         07010000
           IF MMBKRA = ERASE-KEY                                        07020000
                 MOVE SPACES TO ACAT-INP-CONTRA-BKR                     07030000
           END-IF END-IF.                                               07040000
                                                                        07050000
           IF MMSTATL > 0                                               07060000
              MOVE MMSTATI TO  ACAT-INP-STATUS                          07070000
           ELSE                                                         07080000
           IF MMSTATA = ERASE-KEY                                       07090000
                 MOVE SPACES TO ACAT-INP-STATUS                         07100000
           END-IF END-IF.                                               07110000
                                                                        07120000
           IF MMSDL > 0                                                 07130000
              MOVE MMSDI TO    ACAT-INP-STTL-DT                         07140000
           ELSE                                                         07150000
           IF MMSDA = ERASE-KEY                                         07160000
                 MOVE SPACES TO ACAT-INP-STTL-DT                        07170000
           END-IF END-IF.                                               07180000
                                                                        07190000
           IF MBRL > 0                                                  07200000
              IF MBRI = TWA-MBR                                         07210000
                 CONTINUE                                               07220000
              ELSE                                                      07230000
                 MOVE MBRI TO TWA-MBR                                   07240000
                 SET TWA-INTRAN-BRW TO TRUE                             07250000
                 SET ACCOUNT-CHANGED TO TRUE                            07260000
              END-IF                                                    07270000
           ELSE                                                         07280000
           IF MBRA = ERASE-KEY                                          07290000
                 MOVE SPACES TO TWA-MBR                                 07300000
                 SET TWA-INTRAN-BRW TO TRUE                             07310000
                 SET ACCOUNT-CHANGED TO TRUE                            07320000
           END-IF END-IF.                                               07330000
                                                                        07340000
           IF MACL > 0                                                  07350000
              IF MACI = TWA-MAC                                         07360000
                 CONTINUE                                               07370000
              ELSE                                                      07380000
                 MOVE MACI TO TWA-MAC                                   07390000
                 SET TWA-INTRAN-BRW TO TRUE                             07400000
                 SET ACCOUNT-CHANGED TO TRUE                            07410000
              END-IF                                                    07420000
           ELSE                                                         07430000
           IF MACA = ERASE-KEY                                          07440000
                 MOVE SPACES TO TWA-MAC                                 07450000
                 SET TWA-INTRAN-BRW TO TRUE                             07460000
                 SET ACCOUNT-CHANGED TO TRUE                            07470000
           END-IF END-IF.                                               07480000
                                                                        07490000
                                                                        07500000
062900 MERGE-MAP-DTL-RTN.                                               07510000
           IF MCBRKRL > 0                                               07520000
              IF MCBRKRI = TWA-MCBRKR                                   07530000
                 CONTINUE                                               07540000
              ELSE                                                      07550000
                 MOVE MCBRKRI TO TWA-MCBRKR                             07560000
           ELSE                                                         07570000
           IF MCBRKRA = ERASE-KEY                                       07580000
                 MOVE SPACES TO TWA-MCBRKR                              07590000
           END-IF END-IF.                                               07600000
                                                                        07610000
           IF MCACCTL > 0                                               07620000
              IF MCACCTI = TWA-MCACCT                                   07630000
                 CONTINUE                                               07640000
              ELSE                                                      07650000
                 MOVE MCACCTI(1 : MCACCTL) TO TWA-MCACCT                07660000
           ELSE                                                         07670000
           IF MCACCTA = ERASE-KEY                                       07680000
                 MOVE SPACES TO TWA-MCACCT                              07690000
           END-IF END-IF.                                               07700000
                                                                        07710000
           PERFORM                                                      07720000
               VARYING SUB2 FROM 1 BY 1                                 07730000
                  UNTIL SUB2 > 20                                       07740000
              IF TWA-MCACCT(SUB2 : 1) < SPACES                          07750000
                 MOVE SPACES TO TWA-MCACCT(SUB2 : 1)                    07760000
              END-IF                                                    07770000
           END-PERFORM.                                                 07780000
           IF MCTYPEL > 0                                               07790000
LRM011        IF MCTYPEI NOT = TWA-MCTYPE                               07800000
LRM011           SET ACCOUNT-TYPE-CHANGED TO TRUE                       07810000
                 MOVE MCTYPEI TO TWA-MCTYPE                             07820000
LRM011        END-IF                                                    07830000
           ELSE                                                         07840000
           IF MCTYPEA = ERASE-KEY                                       07850000
                 MOVE SPACES TO TWA-MCTYPE                              07860000
           END-IF END-IF.                                               07870000
                                                                        07880000
           IF MCBNAML > 0                                               07890000
              MOVE MCBNAMI TO TWA-MCBNAM                                07900000
           ELSE                                                         07910000
           IF MCBNAMA = ERASE-KEY                                       07920000
                 MOVE SPACES TO TWA-MCBNAM                              07930000
           END-IF END-IF.                                               07940000
                                                                        07950000
           IF MNAMEL > 0                                                07960000
              MOVE MNAMEI(1 : MNAMEL) TO TWA-MNAME                      07970000
           ELSE                                                         07980000
           IF MNAMEA = ERASE-KEY                                        07990000
                 MOVE SPACES TO TWA-MNAME                               08000000
           END-IF END-IF.                                               08010000
                                                                        08020000
           IF MNAME2L > 0                                               08030000
              MOVE MNAME2I(1 : MNAME2L) TO TWA-MNAME2                   08040000
           ELSE                                                         08050000
           IF MNAME2A = ERASE-KEY                                       08060000
                 MOVE SPACES TO TWA-MNAME2                              08070000
           END-IF END-IF.                                               08080000
                                                                        08090000
           PERFORM                                                      08100000
               VARYING SUB2 FROM 1 BY 1                                 08110000
                  UNTIL SUB2 > 30                                       08120000
              IF TWA-MNAME(SUB2 : 1) < SPACES                           08130000
                 MOVE SPACES TO TWA-MNAME(SUB2 : 1)                     08140000
              END-IF                                                    08150000
              IF TWA-MNAME2(SUB2 : 1) < SPACES                          08160000
                 MOVE SPACES TO TWA-MNAME2(SUB2 : 1)                    08170000
              END-IF                                                    08180000
           END-PERFORM.                                                 08190000
                                                                        08200000
           IF MSSNL > 0                                                 08210000
              MOVE MSSNI(1 : MSSNL) TO TWA-MSSN                         08220000
           ELSE                                                         08230000
           IF MSSNA = ERASE-KEY                                         08240000
                 MOVE SPACES TO TWA-MSSN                                08250000
           END-IF END-IF.                                               08260000
                                                                        08270000
           IF MSSN2L > 0                                                08280000
              MOVE MSSN2I(1 : MSSN2L) TO TWA-MSSN2                      08290000
           ELSE                                                         08300000
           IF MSSN2A = ERASE-KEY                                        08310000
                 MOVE SPACES TO TWA-MSSN2                               08320000
           END-IF END-IF.                                               08330000
                                                                        08340000
           IF MACATL > 0                                                08350000
              MOVE MACATI TO TWA-MACAT                                  08360000
           ELSE                                                         08370000
           IF MACATA = ERASE-KEY                                        08380000
                 MOVE SPACES TO TWA-MACAT                               08390000
           END-IF END-IF.                                               08400000
                                                                        08410000
           IF MSTATL > 0                                                08420000
              MOVE MSTATI TO TWA-MSTAT                                  08430000
           ELSE                                                         08440000
           IF MSTATA = ERASE-KEY                                        08450000
                 MOVE SPACES TO TWA-MSTAT                               08460000
           END-IF END-IF.                                               08470000
                                                                        08480000
           IF MSDL > 0                                                  08490000
              MOVE MSDI TO TWA-MSD                                      08500000
           ELSE                                                         08510000
           IF MSDA = ERASE-KEY                                          08520000
                 MOVE SPACES TO TWA-MSD                                 08530000
           END-IF END-IF.                                               08540000
                                                                        08550000
062900 MERGE-MAP-NEXT-RTN.                                              08560000
           IF MNEXTL > 0                                                08570000
              MOVE MNEXTI TO TWA-MNEXT                                  08580000
           ELSE                                                         08590000
           IF MNEXTA = ERASE-KEY                                        08600000
                 MOVE SPACES TO TWA-MNEXT                               08610000
           END-IF END-IF.                                               08620000
                                                                        08630000
           IF MSUBML > 0                                                08640000
              MOVE MSUBMI TO TWA-MSUBM                                  08650000
           ELSE                                                         08660000
           IF MSUBMA = ERASE-KEY                                        08670000
                 MOVE SPACES TO TWA-MSUBM                               08680000
           END-IF END-IF.                                               08690000
                                                                        08700000
           IF MCMNTL > 0                                                08710000
              MOVE MCMNTI TO TWA-MCMNT                                  08720000
           ELSE                                                         08730000
           IF MCMNTA = ERASE-KEY                                        08740000
                 MOVE SPACES TO TWA-MCMNT                               08750000
           END-IF END-IF.                                               08760000
                                                                        08770000
           IF MDELL > 0                                                 08780000
              MOVE MDELI TO TWA-MDEL                                    08790000
           ELSE                                                         08800000
           IF MDELA = ERASE-KEY                                         08810000
                 MOVE SPACES TO TWA-MDEL                                08820000
           END-IF END-IF.                                               08830000
                                                                        08840000
       EJECT                                                            08850000
       MOVE-ACAT02IO-TO-TWA-RTN.                                        08860000
           MOVE ACAT02IO-DLVR-NBR   TO TWA-MCBRKR                       08870000
                                       TWA-ORIG-DLVR-NBR.               08880000
           MOVE ACAT02IO-DLVR-ACCT  TO TWA-MCACCT                       08890000
                                       TWA-ORIG-DLVR-ACCT.              08900000
           MOVE ACAT02IO-RCV-ACCT   TO TWA-MBR.                         08910000
           MOVE ACAT02IO-RCV-ACCT(4 : 5)   TO TWA-MAC.                  08920000
           MOVE ACAT02IO-RR-CD             TO TWA-MRR.                  08930000
           MOVE ACAT02IO-CMNT-TXT          TO TWA-MCCMNT-X120.          08940000
           MOVE ACAT02IO-RCV-ACCT-TYPE-CD  TO TWA-MCTYPE.               08950000
           MOVE ACAT02IO-RCV-CUST-NM            TO TWA-MNAME.           08960000
           MOVE ACAT02IO-RCV-CUST-NM(31 : 30)   TO TWA-MNAME2.          08970000
           MOVE ACAT02IO-RCV-SS-PRIM-NBR(1 : 3) TO TWA-MSSN.            08980000
           MOVE ACAT02IO-RCV-SS-PRIM-NBR(4 : 2) TO TWA-MSSN(5 : 2).     08990000
           MOVE ACAT02IO-RCV-SS-PRIM-NBR(6 : 4) TO TWA-MSSN(8 : 4).     09000000
           MOVE '-'                             TO TWA-MSSN(4 : 1)      09010000
                                                   TWA-MSSN(7 : 1).     09020000
           IF ACAT02IO-RCV-SS-SCNDY-NBR NOT GREATER SPACES              09030000
              MOVE SPACES TO TWA-MSSN2                                  09040000
           ELSE                                                         09050000
              MOVE ACAT02IO-RCV-SS-SCNDY-NBR(1 : 3) TO TWA-MSSN2        09060000
              MOVE ACAT02IO-RCV-SS-SCNDY-NBR(4 : 2) TO TWA-MSSN2(5 : 2) 09070000
              MOVE ACAT02IO-RCV-SS-SCNDY-NBR(6 : 4) TO TWA-MSSN2(8 : 4) 09080000
              MOVE '-'                              TO TWA-MSSN2(4 : 1) 09090000
                                                       TWA-MSSN2(7 : 1) 09100000
           END-IF.                                                      09110000
           IF ACAT02IO-NSCC-SUBMIT-ELIGABLE                             09120000
               MOVE 'Y'   TO TWA-MSUBM                                  09130000
           ELSE                                                         09140000
              MOVE SPACES TO TWA-MSUBM.                                 09150000
                                                                        09160000
           IF ACAT02IO-NSCC-SUBMITTED                                   09170000
           OR NOT ACAT-SIGN-ON-UPDATE                                   09180000
               MOVE 'B' TO TWA-ACTION                                   09190000
           ELSE                                                         09200000
               MOVE 'C' TO TWA-ACTION.                                  09210000
                                                                        09220000
           MOVE ACAT02IO-CONTROL-NBR   TO TWA-CONTROL-NBR.              09230000
           MOVE ACAT02IO-TRNFR-TYPE-RJCT-CD                             09240000
                                       TO TWA-TRNFR-TYPE-RJCT-CD.       09250000
           MOVE ACAT02IO-TRANS-TYPE-CD TO TWA-TRANS-TYPE-CD.            09260000
           MOVE ACAT02IO-STTS-CD       TO TWA-STTS-CD.                  09270000
ET0001     MOVE ACAT02IO-STTLM-TM-CD   TO TWA-STTLM-TM-CD.              09271000
           MOVE SPACES                 TO TWA-MDEL.                     09280000
           MOVE ACAT02IO-UPDT-TMSTP    TO TWA-UPDT-TMSTP.               09290000
                                                                        09300000
       REFORMAT-SCREEN-DETAIL.                                          09310000
********   MOVE LOW-VALUES  TO ACAT02MO.                                09320000
           MOVE TWA-MBR     TO MBRO.                                    09330000
           MOVE TWA-MAC     TO MACO.                                    09340000
           MOVE TWA-MRR     TO MRRO.                                    09350000
           MOVE TWA-MCTYPE  TO MCTYPEO.                                 09360000
           MOVE TWA-MCBRKR  TO MCBRKRO.                                 09370000
           MOVE TWA-MCBNAM  TO MCBNAMO.                                 09380000
           MOVE TWA-MCACCT  TO MCACCTO.                                 09390000
           MOVE TWA-MNAME   TO MNAMEO.                                  09400000
           MOVE TWA-MNAME2  TO MNAME2O.                                 09410000
           MOVE TWA-MSSN    TO MSSNO.                                   09420000
           MOVE TWA-MSSN2   TO MSSN2O.                                  09430000
           MOVE TWA-MACAT   TO MACATO.                                  09440000
           MOVE TWA-MSTAT   TO MSTATO.                                  09450000
           MOVE TWA-MSD     TO MSDO.                                    09460000
           MOVE TWA-MNEXT   TO MNEXTO.                                  09470000
           MOVE TWA-MSUBM   TO MSUBMO.                                  09480000
           MOVE TWA-MCMNT   TO MCMNTO.                                  09490000
           MOVE TWA-MDEL    TO MDELO.                                   09500000
           MOVE TWA-MMBR    TO MMBRO.                                   09510000
           MOVE TWA-MMAC    TO MMACO.                                   09520000
           SET FIRST-TIME TO TRUE.                                      09530000
                                                                        09540000
           MOVE TWA-CONTROL-NBR TO MACATO.                              09550000
           PERFORM SET-STATUS-MSG-RTN.                                  09560000
S/D ****** NOT DEFINED...    TO MSDO.                                   09570000
                                                                        09580000
           SKIP3                                                        09590000
       SET-STATUS-MSG-RTN.                                              09600000
           IF TWA-STTS-CD NOT GREATER SPACES                            09610000
              MOVE SPACES TO MSTATO                                     09620000
           ELSE                                                         09630000
           EVALUATE TWA-STTS-CD                                         09640000
               WHEN '100'                                               09650000
                    MOVE '100-REQUEST'               TO MSTATO          09660000
               WHEN '110'                                               09670000
                    MOVE '110-REQUEST ADJUST'        TO MSTATO          09680000
               WHEN '120'                                               09690000
                    MOVE '120-REQUEST ADJUST PAST'   TO MSTATO          09700000
               WHEN '130'                                               09710000
                    MOVE '130-REQUEST PAST'          TO MSTATO          09720000
               WHEN '140'                                               09730000
                    MOVE '140-REQUEST REJECT'        TO MSTATO          09740000
               WHEN '200'                                               09750000
                    MOVE '200-REVIEW'                TO MSTATO          09760000
               WHEN '210'                                               09770000
                    MOVE '210-REVIEW ADJUST'         TO MSTATO          09780000
               WHEN '220'                                               09790000
                    MOVE '220-REVIEW ERROR'          TO MSTATO          09800000
               WHEN '230'                                               09810000
                    MOVE '230-REVIEW ACCELERATE'     TO MSTATO          09820000
               WHEN '300'                                               09830000
                    MOVE '300-SETTLE PREP'   TO MSTATO                  09840000
               WHEN '310'                                               09850000
                    MOVE '310-SETTLE CLOSE'  TO MSTATO                  09860000
               WHEN '400'                                               09870000
                    MOVE '400-CLOSE PURGE'   TO MSTATO                  09880000
               WHEN '500'                                               09890000
                    MOVE '500-MEMO PARTIAL REQUEST'      TO MSTATO      09900000
               WHEN '510'                                               09910000
                    MOVE '510-MEMO PURGE PARTIAL REQUEST' TO MSTATO     09920000
               WHEN '600'                                               09930000
                    MOVE '600-REJECT'    TO MSTATO                      09940000
               WHEN OTHER                                               09950000
                    MOVE TWA-STTS-CD     TO MSTATO                      09960000
           END-EVALUATE.                                                09970000
                                                                        09980000
           EJECT                                                        09990000
       PROCESS-MAP-ITEMS.                                               10000000
           IF TWA-MDEL = 'Y'                                            10010000
           AND TWA-ACTION = 'C'                                         10020000
              GO TO PROCESS-MAP-ITEMS-EXIT.                             10030000
                                                                        10040000
           MOVE ATT-UNPROT TO MBRA.                                     10050000
           IF TWA-MBR NOT GREATER SPACES                                10060000
              MOVE ATT-UNPROT-BRT TO MBRA                               10070000
              IF NOT INPUT-ERROR                                        10080000
                 MOVE -1 TO MBRL                                        10090000
                 MOVE 'BRANCH IS REQUIRED' TO SYSTEM-MSG                10100000
                 SET INPUT-ERROR TO TRUE.                               10110000
                                                                        10120000
           MOVE ATT-UNPROT TO MACA.                                     10130000
           IF TWA-MAC NOT GREATER SPACES                                10140000
              MOVE ATT-UNPROT-BRT TO MACA                               10150000
              IF NOT INPUT-ERROR                                        10160000
                 MOVE -1 TO MACL                                        10170000
                 MOVE 'ACCOUNT IS REQUIRED' TO SYSTEM-MSG               10180000
                 SET INPUT-ERROR TO TRUE.                               10190000
                                                                        10200000
           IF NOT INPUT-ERROR                                           10210000
              SET ACATNAIO-NA-READ TO TRUE                              10220000
              MOVE TWA-CLIENT-NO-X(2 : 3) TO ACATNAIO-CLIENT            10230000
              MOVE TWA-MBR         TO ACATNAIO-BR                       10240000
              MOVE TWA-MAC         TO ACATNAIO-AC                       10250000
              PERFORM LINK-TO-ACATNAIO-RTN                              10260000
              IF ACATNAIO-NOT-FOUND                                     10270000
                 MOVE ATT-UNPROT-BRT TO MBRA                            10280000
                                        MACA                            10290000
                 MOVE -1 TO MBRL                                        10300000
                 MOVE 'BRANCH/ACCOUNT NOT ON N/A' TO SYSTEM-MSG         10310000
                 SET INPUT-ERROR TO TRUE                                10320000
              ELSE                                                      10330000
                 MOVE ACATNAIO-RR    TO TWA-MRR     MRRO                10340000
                 IF  ACAT-SUPER-SIGN-ON-UPDATE                          10350000
                 OR  ACAT-SUPER-SIGN-ON-BROWSE                          10360000
                    CONTINUE                                            10370000
                 ELSE                                                   10380000
                    MOVE TWA-MRR  TO SRCH-INP-RR                        10390000
                    MOVE TWA-MBR  TO SRCH-INP-BRANCH                    10400000
                    PERFORM SIGNON-SECR-CHECK-RTN                       10410000
                    IF SRCH-SIGNON-SECR-CHECK-FAIL                      10420000
                       MOVE ATT-UNPROT-BRT TO MBRA                      10430000
                                              MACA                      10440000
                       MOVE -1 TO MBRL                                  10450000
                       MOVE SRCH-MSG TO SYSTEM-MSG                      10460000
                       SET INPUT-ERROR TO TRUE                          10470000
                       PERFORM ERROR-RTN                                10480000
                    END-IF                                              10490000
                 END-IF                                                 10490100
LRM003           IF NOT INPUT-ERROR                                     10490200
LRM003           AND ACAT-ACCOUNT-FREEZE-CLIENT                         10490300
LRM003              MOVE TWA-CLIENT-NO-X TO ACATRSIO-CLIENT-NBR         10490400
LRM003              MOVE TWA-MBR TO ACATRSIO-BRANCH                     10490500
LRM003              MOVE TWA-MAC TO ACATRSIO-ACCOUNT                    10490600
LRM003              MOVE ALL 'N' TO ACATRSIO-FREEZE-INDICATORS          10490700
LRM003              MOVE 'Y' TO ACATRSIO-FREEZE-B                       10490800
LRM003                          ACATRSIO-FREEZE-D                       10490900
LRM003              SET ACATRSIO-LOOKUP-ACCOUNT-FREEZE TO TRUE          10491000
LRM003              PERFORM LINK-TO-ACATRSTIO-RTN                       10492000
LRM003              IF ACATRSIO-FREEZE-CASH-IN                          10493000
LRM003              OR ACATRSIO-FREEZE-SEC-IN                           10494000
LRM003                 MOVE ATT-UNPROT-BRT TO MBRA                      10495000
LRM003                                        MACA                      10496000
LRM003                 MOVE -1 TO MBRL                                  10497000
LRM003                 SET INPUT-ERROR TO TRUE                          10498000
LRM003                 IF ACATRSIO-FREEZE-CASH-IN                       10499000
LRM003                    IF ACATRSIO-FREEZE-SEC-IN                     10499100
LRM003                       MOVE WS-FULL-FREEZE-MSG TO SYSTEM-MSG      10499200
LRM003                    ELSE                                          10499300
LRM003                       MOVE WS-CASH-FREEZE-MSG TO SYSTEM-MSG      10499400
LRM003                 ELSE                                             10499500
LRM003                    MOVE WS-SEC-FREEZE-MSG TO SYSTEM-MSG          10499600
LRM003                 END-IF                                           10499700
LRM003              END-IF                                              10499800
LRM003           END-IF                                                 10499900
                 IF (TWA-MNAME NOT > SPACES                             10500000
                 OR ACCOUNT-CHANGED )                                   10510000
                    IF ACATNAIO-SSN(1 : 1) GREATER SPACES               10520000
                       MOVE ACATNAIO-SSN(1 : 3) TO TWA-MSSN(1 : 3)      10530000
                       MOVE '-'                 TO TWA-MSSN(4 : 1)      10540000
                       MOVE ACATNAIO-SSN(4 : 2) TO TWA-MSSN(5 : 2)      10550000
                       MOVE '-'                 TO TWA-MSSN(7 : 1)      10560000
                       MOVE ACATNAIO-SSN(6 : 4) TO TWA-MSSN(8 : 4)      10570000
                    ELSE                                                10580000
                       MOVE SPACES TO TWA-MSSN                          10590000
                    END-IF                                              10600000
                    MOVE TWA-MSSN TO MSSNO                              10610000
                    IF ACATNAIO-SSN2(1 : 1) GREATER SPACES              10620000
                       MOVE ACATNAIO-SSN2(1 : 3) TO TWA-MSSN2(1 : 3)    10630000
                       MOVE '-'                  TO TWA-MSSN2(4 : 1)    10640000
                       MOVE ACATNAIO-SSN2(4 : 2) TO TWA-MSSN2(5 : 2)    10650000
                       MOVE '-'                  TO TWA-MSSN2(7 : 1)    10660000
                       MOVE ACATNAIO-SSN2(6 : 4) TO TWA-MSSN2(8 : 4)    10670000
                    ELSE                                                10680000
                       MOVE SPACES TO TWA-MSSN2                         10690000
                    END-IF                                              10700000
                    MOVE TWA-MSSN2 TO MSSN2O                            10710000
                    MOVE ACATNAIO-IRA   TO TWA-NA-IRA                   10720000
                    MOVE ACATNAIO-NAME  TO TWA-MNAME   MNAMEO           10730000
                    MOVE ACATNAIO-NAME2 TO TWA-MNAME2  MNAME2O.         10740000
                                                                        10750000
           MOVE ATT-UNPROT TO MCTYPEA.                                  10760000
           IF (TWA-MCTYPE NOT GREATER SPACES                            10770000
LRM011     OR (TWA-MCTYPE GREATER SPACES                                10780000
LRM010       AND ACCOUNT-CHANGED                                        10780100
LRM011       AND NOT ACCOUNT-TYPE-CHANGED))                             10780200
           AND ACATNAIO-FOUND                                           10780300
              PERFORM SET-CUST-TYPE-B1-DEFAULT-RTN                      10780400
              MOVE TWA-MCTYPE  TO MCTYPEO                               10780500
           END-IF.                                                      10780600
                                                                        10780700
           IF TWA-MCTYPE NOT GREATER SPACES                             10780800
              MOVE ATT-UNPROT-BRT TO MCTYPEA                            10780900
              IF NOT INPUT-ERROR                                        10781000
                 MOVE -1 TO MCTYPEL                                     10782000
                 MOVE                                                   10783000
                   'CUST ACCOUNT TYPE IS REQUIRED; PRESS PF9 FOR LIST'  10784000
                        TO SYSTEM-MSG                                   10785000
                 SET INPUT-ERROR TO TRUE                                10786000
              END-IF                                                    10787000
           ELSE                                                         10788000
              MOVE 1 TO SUB                                             10789000
LRM014        PERFORM UNTIL SUB > WS-ACCOUNT-TYPE-CHOICES               10790000
                        OR WS-ACCOUNT-TYPE(SUB) = TWA-MCTYPE            10800000
                 ADD 1 TO SUB                                           10810000
              END-PERFORM                                               10820000
LRM014        IF SUB > WS-ACCOUNT-TYPE-CHOICES                          10830000
                 MOVE ATT-UNPROT-BRT TO MCTYPEA                         10840000
                 IF NOT INPUT-ERROR                                     10850000
                    MOVE -1 TO MCTYPEL                                  10860000
                    MOVE                                                10870000
                     'CUST ACCOUNT TYPE IS INVALID; PRESS PF9 FOR LIST' 10880000
                            TO SYSTEM-MSG                               10890000
                    SET INPUT-ERROR TO TRUE.                            10900000
                                                                        10910000
           MOVE ATT-UNPROT TO MCBRKRA.                                  10920000
           IF TWA-MCBRKR NOT GREATER SPACES                             10930000
              MOVE ATT-UNPROT-BRT TO MCBRKRA                            10940000
              IF NOT INPUT-ERROR                                        10950000
                 MOVE -1 TO MCBRKRL                                     10960000
                 MOVE 'CONTRA BROKER IS REQUIRED' TO SYSTEM-MSG         10970000
                 SET INPUT-ERROR TO TRUE                                10980000
              END-IF                                                    10990000
           ELSE                                                         11000000
           IF TWA-MCBRKR = ACAT-ADP-BROKER                              11010000
              MOVE ATT-UNPROT-BRT TO MCBRKRA                            11020000
              IF NOT INPUT-ERROR                                        11030000
                 MOVE -1 TO MCBRKRL                                     11040000
                 MOVE 'CONTRA BROKER CANNOT BE YOURSELF' TO SYSTEM-MSG  11050000
                 SET INPUT-ERROR TO TRUE                                11060000
              END-IF                                                    11070000
           ELSE                                                         11080000
              MOVE TWA-MCBRKR TO ACATPPIO-BRKR                          11090000
              SET ACATPPIO-READ TO TRUE                                 11100000
              PERFORM LINK-TO-ACATPPIO-RTN                              11110000
              IF ACATPPIO-FOUND                                         11120000
LRM012        AND (ACATPPIO-PRTCP-TYPE-CD = '1' OR '2')                 11130000
                 MOVE ACATPPIO-NAME TO TWA-MCBNAM  MCBNAMO              11140000
              ELSE                                                      11150000
                 MOVE SPACES        TO TWA-MCBNAM  MCBNAMO              11160000
                 MOVE ATT-UNPROT-BRT TO MCBRKRA                         11170000
                 IF NOT INPUT-ERROR                                     11180000
                    MOVE -1 TO MCBRKRL                                  11190000
                    SET INPUT-ERROR TO TRUE                             11200000
                    IF ACATPPIO-NOT-FOUND                               11210000
                       MOVE 'CONTRA BROKER IS INVALID' TO SYSTEM-MSG    11220000
                    ELSE                                                11230000
                    IF ACATPPIO-DB-ERROR                                11240000
                       MOVE 'READ'            TO WS-DB2-PROBLEM-FUNCTION11250000
                       MOVE ACATPPIO-SQLCAID  TO WS-DB2-PROBLEM-TABLE   11260000
                       MOVE ACATPPIO-SQLCODE  TO WS-DB2-PROBLEM-ID      11270000
                       MOVE WS-DB2-PROBLEM-MSG TO SYSTEM-MSG            11280000
                       PERFORM DB2-ERROR-RTN                            11290000
LRM012              ELSE                                                11300000
LRM012                 MOVE 'CONTRA BROKER / FUND COMPANY IS INVALID'   11310000
LRM012                                         TO SYSTEM-MSG            11320000
LRM012        END-IF.                                                   11330000
                                                                        11340000
           MOVE ATT-UNPROT TO MCACCTA.                                  11350000
LRM002     MOVE SPACES TO MCACMSGO.                                     11360000
           PERFORM JUSTIFY-LEFT-MCACCT.                                 11370000
           IF MCACCT-ERROR                                              11380000
              MOVE ATT-UNPROT-BRT TO MCACCTA                            11390000
              IF NOT INPUT-ERROR                                        11400000
                 MOVE -1 TO MCACCTL                                     11410000
                 MOVE 'CONTRA ACCOUNT CHARACTERS NOT A THRU Z, 0 THRU 9'11420000
                                TO SYSTEM-MSG                           11430000
                 SET INPUT-ERROR TO TRUE                                11440000
              END-IF                                                    11450000
           ELSE                                                         11460000
           IF TWA-MCACCT(1 : 1) NOT GREATER SPACES                      11470000
              MOVE ATT-UNPROT-BRT TO MCACCTA                            11480000
              IF NOT INPUT-ERROR                                        11490000
                 MOVE -1 TO MCACCTL                                     11500000
                 MOVE 'CONTRA ACCOUNT IS REQUIRED' TO SYSTEM-MSG        11510000
                 SET INPUT-ERROR TO TRUE                                11520000
              END-IF                                                    11530000
           ELSE                                                         11540000
              MOVE TWA-MCACCT TO MCACCTO                                11550000
LRM002        IF TWA-MCACCT > SPACES                                    11560000
LRM002        AND TWA-MCBRKR > SPACES                                   11570000
LRM002           MOVE TWA-CLIENT-NO-X TO ACATRSIO-CLIENT-NBR            11580000
LRM002           SET ACATRSIO-EDIT-CONTRA-ACCT TO TRUE                  11590000
LRM002           MOVE TWA-MCBRKR TO ACATRSIO-BRKR-CONTRA-NBR            11600000
LRM002           MOVE TWA-MCACCT TO ACATRSIO-CONTRA-ACCT                11610000
LRM002           PERFORM LINK-TO-ACATRSTIO-RTN                          11620000
LRM002           IF ACATRSIO-CONTRA-EDIT-FAIL                           11630000
LRM002              MOVE ATT-ASKIP-BRT  TO MCACMSGA                     11640000
LRM002              MOVE 'ACCOUNT EDIT WARNING' TO MCACMSGO             11650000
LRM002              IF ACATRSIO-CONTRA-ACCT-FAIL-NBR > '00'             11651000
LRM002                 MOVE ACATRSIO-CONTRA-ACCT-FAIL-NBR               11652000
LRM002                                          TO MCACMSGO (22 : 2)    11653000
LRM002              END-IF                                              11654000
LRM002              IF (TWA-ACTION = 'A' OR LOW-VALUES)                 11655000
LRM002              AND (TWA-MCACCT NOT = TWA-EDIT-MCACCT               11656000
LRM002               OR TWA-MCBRKR NOT = TWA-EDIT-MCBRKR)               11657000
LRM002                 MOVE ATT-UNPROT-BRT TO MCACCTA                   11658000
LRM002                 MOVE TWA-MCACCT TO TWA-EDIT-MCACCT               11659000
LRM002                 MOVE TWA-MCBRKR TO TWA-EDIT-MCBRKR               11659100
LRM002                 IF NOT INPUT-ERROR                               11659200
LRM002                    MOVE -1 TO MCACCTL                            11659300
LRM002                    MOVE                                          11659400
LRM002                   'PRESS ENTER TO BYPASS CONTRA ACCOUNT WARNING' 11659500
LRM002                       TO SYSTEM-MSG                              11659600
LRM002                    SET INPUT-ERROR TO TRUE                       11659700
LRM002     END-IF.                                                      11659800
                                                                        11659900
      *---------------------------------------------------------------* 11660000
      * THE ACTION DETERMINATION LOGIC BELOW ASSUMES (INSERT) WHEN TIF  11670000
      * NOT FOUND AND (UPDATE) WHEN FOUND.  ONCE A RECORD IS DISPLAYED, 11680000
      * THEN CHANGES TO BR/AC IS A LOGICAL KEY CHANGE (NEW SESSION),    11690000
      * CHANGES TO DLVR BRKR/ACCT IS AN (UPDATE) TO THIS RECORD, EXCEPT 11700000
      * FOR CHANGES TO ACTIVE TRANSFERS.                                11710000
      *---------------------------------------------------------------* 11720000
******** ON KEY CHANGE, SEE WHAT'S ON FILE...                           11730000
           IF NOT INPUT-ERROR                                           11740000
           AND (TWA-INTRAN-BRW                                          11750000
             OR TWA-MCBRKR NOT = TWA-ORIG-DLVR-NBR                      11760000
             OR TWA-MCACCT NOT = TWA-ORIG-DLVR-ACCT)                    11770000
              PERFORM READ-ACAT-RTN                                     11780000
              IF ACAT02IO-PTR-FOUND                                     11790000
                 SET INPUT-ERROR TO TRUE                                11800000
                 MOVE ATT-UNPROT-BRT TO MCBRKRA                         11810000
                                        MCACCTA                         11820000
                 MOVE -1 TO MCBRKRL                                     11830000
                 MOVE                                                   11840000
                  'INITIAL PTR EXISTS FOR THIS CONTRA BROKER / ACCOUNT' 11850000
                                TO SYSTEM-MSG                           11860000
              ELSE                                                      11870000
              IF ACAT02IO-FUL-HISTORY                                   11880000
                 IF NOT TWA-HISTORY-NOTIFIED                            11890000
                    MOVE 'A' TO TWA-ACTION                              11900000
                    SET TWA-HISTORY-NOTIFIED TO TRUE                    11910000
                    MOVE ATT-UNPROT-BRT TO MBRA                         11920000
                                           MACA                         11930000
                    MOVE -1 TO MBRL                                     11940000
                    SET INPUT-ERROR TO TRUE                             11950000
                    MOVE                                                11960000
                   'HISTORY TIF(S) WILL BE DELETED FOR THIS BR/ACCT  '  11970000
                      TO WS-DUPE-MSG-TEXT                               11980000
                   MOVE ACAT02IO-DUPE-CONTROL-NBR TO WS-DUPE-CONTROL-NBR11990000
                   MOVE WS-DUPE-MSG TO SYSTEM-MSG                       12000000
                 ELSE                                                   12010000
                   SET ACAT02IO-NOT-FOUND TO TRUE                       12020000
              ELSE                                                      12030000
              IF ACAT02IO-OTHER-ACTIVE                                  12040000
                 MOVE ATT-UNPROT-BRT TO MBRA                            12050000
                                        MACA                            12060000
                 MOVE -1 TO MBRL                                        12070000
                 SET INPUT-ERROR TO TRUE                                12080000
                 MOVE                                                   12090000
                   'TIF NOT ALLOWED - OTHER ACTIVE TRANSFER FOUND'      12100000
                      TO WS-DUPE-MSG-TEXT                               12110000
                 MOVE ACAT02IO-DUPE-CONTROL-NBR TO WS-DUPE-CONTROL-NBR  12120000
                 MOVE WS-DUPE-MSG TO SYSTEM-MSG                         12130000
              ELSE                                                      12140000
              IF (ACAT02IO-NOT-FOUND                                    12150000
              OR (ACAT02IO-ACTIVE-FOUND                                 12160000
                 AND ACAT02IO-STTS-CD = '140' OR '600'))                12170000
                 IF ACAT-SIGN-ON-UPDATE                                 12180000
LRM                 IF TWA-ACTION = 'C'                                 12190000
LRM                 AND TWA-CONTROL-NBR > SPACES                        12200000
LRM                    CONTINUE                                         12210000
                    ELSE                                                12220000
                       MOVE 'A' TO TWA-ACTION                           12230000
                 ELSE                                                   12240000
                    SET TWA-INTRAN-BRW TO TRUE                          12250000
                    MOVE ATT-UNPROT-BRT TO MCBRKRA                      12260000
                                           MCACCTA                      12270000
                    IF NOT INPUT-ERROR                                  12280000
                       MOVE -1 TO MCBRKRL                               12290000
                       MOVE                                             12300000
                       'TIF NOT FOUND; USE PA1 FOR GENERIC BROWSE'      12310000
                                TO SYSTEM-MSG                           12320000
                       SET INPUT-ERROR TO TRUE                          12330000
                    END-IF                                              12340000
              ELSE                                                      12350000
  ********** FOUND...                                                   12360000
                 IF NOT TWA-INTRAN-BRW                                  12370000
                 AND TWA-ACTION = 'C'                                   12380000
                 AND TWA-ORIG-DLVR-NBR > SPACES                         12390000
                 AND (TWA-ORIG-DLVR-NBR NOT = TWA-MCBRKR                12400000
                   OR TWA-ORIG-DLVR-ACCT NOT = TWA-MCACCT)              12410000
                    MOVE ATT-UNPROT-BRT TO MCBRKRA                      12420000
                                           MCACCTA                      12430000
                    IF NOT INPUT-ERROR                                  12440000
                       MOVE -1 TO MCBRKRL                               12450000
                       MOVE                                             12460000
                     'CONTRA BRKR/ACCOUNT ALREADY EXISTS ON ANOTHER TIF'12470000
                                TO SYSTEM-MSG                           12480000
                       SET INPUT-ERROR TO TRUE                          12490000
                    END-IF                                              12500000
                 ELSE                                                   12510000
                    IF TWA-INTRAN-BRW                                   12520000
                    OR (TWA-ACTION NOT = 'B' AND 'C')                   12530000
                       MOVE SPACES TO TWA-INTRAN-FLAG                   12540000
                       PERFORM MOVE-ACAT02IO-TO-TWA-RTN                 12550000
                       PERFORM REFORMAT-SCREEN-DETAIL                   12560000
                       IF (ACAT02IO-FOUND                               12570000
                       AND NOT ACAT02IO-NSCC-SUBMITTED                  12580000
                       AND ACAT-SIGN-ON-UPDATE)                         12590000
                          MOVE 'C' TO TWA-ACTION                        12600000
                          MOVE -1 TO MNAMEL                             12610000
                          IF TWA-MSUBM = 'Y'                            12620000
                             MOVE 'TIF DISPLAYED / AWAITING NSCC XMIT'  12630000
                                 TO SYSTEM-MSG                          12640000
                          ELSE                                          12650000
                             MOVE 'TIF DISPLAYED / SUBMIT PENDING'      12660000
                                 TO SYSTEM-MSG                          12670000
                          END-IF                                        12680000
                       ELSE                                             12690000
                          MOVE 'B' TO TWA-ACTION                        12700000
                          MOVE -1 TO MNEXTL                             12710000
                          SET INPUT-ERROR TO TRUE                       12720000
                          IF ACAT02IO-NSCC-ACKNOWLEDGEMENT              12730000
                             MOVE WS-ACKNOWLEDGE-MSG TO SYSTEM-MSG      12740000
                          ELSE                                          12750000
                          IF ACAT02IO-NSCC-SUBMITTED                    12760000
                             MOVE WS-SUBMITTED-MSG TO SYSTEM-MSG        12770000
                          ELSE                                          12780000
                          IF ACAT02IO-ACTIVE-FOUND                      12790000
LRM007                       IF ACAT-ASCENDIS-CLIENT                    12800000
LRM007                       MOVE                                       12810000
LRM007             'ACTIVE TRANSFER DISPLAYED / BROWSE ONLY / ASCENDIS' 12820000
LRM007                            TO SYSTEM-MSG                         12830000
LRM007                       ELSE                                       12840000
                             MOVE                                       12840100
                               'ACTIVE TRANSFER DISPLAYED / BROWSE ONLY'12840200
                                  TO SYSTEM-MSG                         12840300
                          ELSE                                          12840400
LRM007                       IF ACAT-ASCENDIS-CLIENT                    12840500
LRM007                       MOVE                                       12840600
LRM007                   'TRANSFER DISPLAYED / BROWSE ONLY / ASCENDIS'  12840700
LRM007                            TO SYSTEM-MSG                         12840800
LRM007                       ELSE                                       12840900
                             MOVE 'TRANSFER DISPLAYED / BROWSE ONLY'    12841000
                                  TO SYSTEM-MSG.                        12842000
                                                                        12843000
           MOVE ATT-UNPROT TO  MNAMEA                                   12844000
                               MNAME2A.                                 12845000
                                                                        12846000
           MOVE ATT-UNPROT TO  MSSNA.                                   12847000
           IF TWA-MSSN = SPACES                                         12848000
              MOVE ATT-UNPROT-BRT TO MSSNA                              12849000
              IF NOT INPUT-ERROR                                        12850000
                 MOVE -1 TO MSSNL                                       12860000
                 MOVE 'TAX ID NUMBER IS REQUIRED' TO SYSTEM-MSG         12870000
                    SET INPUT-ERROR TO TRUE                             12880000
              END-IF                                                    12890000
           ELSE                                                         12900000
              MOVE TWA-MSSN TO WS-SSN-EDIT                              12910000
              PERFORM SSN-EDIT-RTN                                      12920000
              IF SSN-INVALID                                            12930000
                 MOVE ATT-UNPROT-BRT TO MSSNA                           12940000
                 IF NOT INPUT-ERROR                                     12950000
                    MOVE -1 TO MSSNL                                    12960000
                    MOVE 'TAX ID NUMBER IS INVALID' TO SYSTEM-MSG       12970000
                    SET INPUT-ERROR TO TRUE                             12980000
                 END-IF                                                 12990000
              ELSE                                                      13000000
                 MOVE WS-SSN-EDIT TO TWA-MSSN MSSNO.                    13010000
                                                                        13020000
           MOVE ATT-UNPROT TO  MSSN2A.                                  13030000
           IF TWA-MSSN2 NOT = SPACES AND LOW-VALUES                     13040000
              MOVE TWA-MSSN2 TO WS-SSN-EDIT                             13050000
              PERFORM SSN-EDIT-RTN                                      13060000
              IF SSN-INVALID                                            13070000
                 MOVE ATT-UNPROT-BRT TO MSSN2A                          13080000
                 IF NOT INPUT-ERROR                                     13090000
                    MOVE -1 TO MSSN2L                                   13100000
                    MOVE '2ND TAX ID NUMBER IS INVALID' TO SYSTEM-MSG   13110000
                    SET INPUT-ERROR TO TRUE                             13120000
                 END-IF                                                 13130000
              ELSE                                                      13140000
                 MOVE WS-SSN-EDIT TO TWA-MSSN2 MSSN2O.                  13150000
                                                                        13160000
                                                                        13170000
           MOVE ATT-UNPROT TO MCMNTA.                                   13180000
           IF TWA-MCMNT GREATER SPACES                                  13190000
           AND TWA-MCMNT NOT = 'Y' AND 'N'                              13200000
              MOVE ATT-UNPROT-BRT TO MCMNTA                             13210000
              IF NOT INPUT-ERROR                                        13220000
                 MOVE -1 TO MCMNTL                                      13230000
                 MOVE 'COMMENT INDICATOR MUST BE Y, N OR SPACE'         13240000
                             TO SYSTEM-MSG                              13250000
                 SET INPUT-ERROR TO TRUE.                               13260000
                                                                        13270000
           MOVE ATT-UNPROT TO MSUBMA                                    13280000
           IF TWA-MSUBM GREATER SPACES                                  13290000
           AND TWA-MSUBM NOT = 'Y' AND 'N'                              13300000
              MOVE ATT-UNPROT-BRT TO MSUBMA                             13310000
              IF NOT INPUT-ERROR                                        13320000
                 MOVE -1 TO MSUBML                                      13330000
                 MOVE 'SUBMIT INDICATOR MUST BE Y, N OR SPACE'          13340000
                             TO SYSTEM-MSG                              13350000
                 SET INPUT-ERROR TO TRUE                                13360000
LRM013        END-IF                                                    13370000
LRM013     ELSE                                                         13380000
LRM013     IF TWA-MSUBM = SPACES                                        13390000
LRM013     AND NOT FIRST-TIME                                           13400000
LRM013     AND TWA-ACTION = 'A'                                         13410000
LRM013     AND NOT INPUT-ERROR                                          13420000
LRM013     AND ACAT-DEFAULT-TO-SUBMIT-IND = '1'                         13430000
LRM013        MOVE 'Y' TO TWA-MSUBM MSUBMO                              13440000
LRM013     END-IF.                                                      13450000
                                                                        13460000
           MOVE ATT-UNPROT TO MDELA.                                    13470000
           IF TWA-MDEL GREATER SPACES                                   13480000
           AND TWA-MDEL NOT = 'Y' AND 'N'                               13490000
              MOVE ATT-UNPROT-BRT TO MDELA                              13500000
              IF NOT INPUT-ERROR                                        13510000
                 MOVE -1 TO MDELL                                       13520000
                 MOVE 'DELETE INDICATOR MUST BE Y, N OR SPACE'          13530000
                             TO SYSTEM-MSG                              13540000
                 SET INPUT-ERROR TO TRUE.                               13550000
                                                                        13560000
           IF TWA-ACTION NOT = 'C'                                      13570000
              MOVE ATT-ASKIP TO MDELA.                                  13580000
                                                                        13590000
           IF TWA-ACTION = 'B'                                          13600000
           OR NOT ACAT-SIGN-ON-UPDATE                                   13610000
              PERFORM ASKIP-MAP-RTN                                     13620000
              MOVE ATT-UNPROT TO MBRA MACA                              13630000
              MOVE -1 TO MBRL                                           13640000
           ELSE                                                         13650000
           IF NOT INPUT-ERROR                                           13660000
           AND SYSTEM-MSG NOT > SPACES                                  13670000
              MOVE 'NO ERRORS FOUND' TO SYSTEM-MSG                      13680000
              MOVE -1 TO MNAMEL.                                        13690000
       PROCESS-MAP-ITEMS-EXIT. EXIT.                                    13700000
                                                                        13710000
       SIGNON-SECR-CHECK-RTN.                                           13720000
           SET SECURITY-LOOKUP TO TRUE.                                 13730000
           EXEC CICS LINK PROGRAM (WS-ACATSRCH)                         13740000
                COMMAREA(ACAT-SRCH-COMM-AREA)                           13750000
                LENGTH(LENGTH OF ACAT-SRCH-COMM-AREA)                   13760000
           END-EXEC.                                                    13770000
       JUSTIFY-LEFT-MCACCT.                                             13780000
           MOVE 1 TO SUB SUB2.                                          13790000
           MOVE SPACES TO WS-MCACCT.                                    13800000
           PERFORM UNTIL SUB GREATER 20                                 13810000
              IF TWA-MCACCT(SUB : 1) NOT = SPACES AND LOW-VALUES        13820000
                 IF ((TWA-MCACCT(SUB : 1) >= 'A' AND <= 'Z')            13830000
                  OR (TWA-MCACCT(SUB : 1) >= '0' AND <= '9'))           13840000
                    MOVE TWA-MCACCT(SUB : 1) TO WS-MCACCT(SUB2 : 1)     13850000
                    ADD 1 TO SUB2                                       13860000
                 ELSE                                                   13870000
                    SET MCACCT-ERROR TO TRUE                            13880000
                    MOVE 20 TO SUB                                      13890000
                 END-IF                                                 13900000
              END-IF                                                    13910000
              ADD 1 TO SUB                                              13920000
           END-PERFORM.                                                 13930000
                                                                        13940000
           IF NOT MCACCT-ERROR                                          13950000
              MOVE WS-MCACCT TO TWA-MCACCT.                             13960000
                                                                        13970000
       SSN-EDIT-RTN.                                                    13980000
           IF (WS-SSN-EDIT(1 : 3) NUMERIC                               13990000
           AND WS-SSN-EDIT(4 : 1) = '-'                                 14000000
           AND WS-SSN-EDIT(7 : 1) = '-'                                 14010000
           AND WS-SSN-EDIT(5 : 2) NUMERIC                               14020000
           AND WS-SSN-EDIT(8 : 4) NUMERIC)                              14030000
              SET SSN-VALID TO TRUE                                     14040000
           ELSE                                                         14050000
           IF (WS-SSN-EDIT(1 : 9) NUMERIC                               14060000
           AND WS-SSN-EDIT(10 : 2) = SPACES)                            14070000
              MOVE WS-SSN-EDIT(8 : 2) TO WS-SSN-EDIT(10 : 2)            14080000
              MOVE WS-SSN-EDIT(6 : 2) TO WS-SSN-EDIT(8 : 2)             14090000
              MOVE WS-SSN-EDIT(5 : 1) TO WS-SSN-EDIT(6 : 1)             14100000
              MOVE WS-SSN-EDIT(4 : 1) TO WS-SSN-EDIT(5 : 1)             14110000
              MOVE '-'                TO WS-SSN-EDIT(4 : 1)             14120000
                                         WS-SSN-EDIT(7 : 1)             14130000
              SET SSN-VALID TO TRUE                                     14140000
           ELSE                                                         14150000
              SET SSN-INVALID TO TRUE                                   14160000
           END-IF.                                                      14170000
                                                                        14180000
       SET-CUST-TYPE-B1-DEFAULT-RTN.                                    14190000
           MOVE TWA-CLIENT-NO   TO B1-CLIENT-NO B1-CLIENT.              14200000
           MOVE 434531          TO B1-CARD-NO.                          14210000
           PERFORM READ-B1-RTN.                                         14220000
           IF EIBRESP  = +0                                             14230000
           AND B1-RETURN-VALUE(1 : 2) GREATER SPACES                    14240000
               MOVE B1-RETURN-VALUE(1 : 2) TO TWA-MCTYPE                14250000
                                        BH-ACAT-DEFAULT-CUSTOMER-TYPE   14260000
           END-IF.                                                      14270000
           IF  BH-ACAT-DEFAULT-CUSTOMER-TYPE > ' '                      14280000
               MOVE BH-ACAT-DEFAULT-CUSTOMER-TYPE TO TWA-MCTYPE         14290000
           ELSE                                                         14300000
               MOVE 'SN'                          TO TWA-MCTYPE         14310000
           END-IF.                                                      14320000
                                                                        14330000
***********PERFORM 5314-CHECK-RETIRE-RANGE THRU 5314-EXIT.              14340000
                                                                        14350000
           PERFORM 5315-CHECK-IRA-BR-RANGE THRU 5315-EXIT.              14360000
           IF  W-IRA-BR-RANGE-SW = 'Y'                                  14370000
               CONTINUE                                                 14380000
           ELSE                                                         14390000
               PERFORM 5316-CHECK-IRA-BR-ACT-RANGE THRU 5316-EXIT       14400000
           END-IF.                                                      14410000
                                                                        14420000
           MOVE 434534          TO B1-CARD-NO.                          14430000
           MOVE ZERO TO EIBRESP.                                        14440000
           MOVE 1 TO B1-SEQUENCE.                                       14450000
           PERFORM UNTIL EIBRESP NOT = ZERO                             14460000
                    OR B1-SEQUENCE > 40                                 14470000
              PERFORM READ-B1-RTN                                       14480000
              IF EIBRESP  = +0                                          14490000
                 IF B1-RETURN-VALUE(1 : 1) GREATER SPACES               14500000
                    ADD 1 TO BH-ACAT-RETIRE-ACT-SUB-CTG-NO              14510000
                    MOVE B1-RETURN-VALUE(1 : 4) TO                      14520000
                         BH-ACAT-RETIRE-ACT-SUB-CTG-ENT(B1-SEQUENCE)    14530000
                 END-IF                                                 14540000
                 ADD 1 TO B1-SEQUENCE                                   14550000
              END-IF                                                    14560000
           END-PERFORM.                                                 14570000
           MOVE 1 TO B1-SEQUENCE.                                       14580000
                                                                        14590000
           MOVE 434504          TO B1-CARD-NO.                          14600000
           PERFORM READ-B1-RTN.                                         14610000
           IF EIBRESP  = +0                                             14620000
           AND B1-RETURN-VALUE(1 : 1) GREATER SPACES                    14630000
               MOVE B1-RETURN-VALUE(1 : 1) TO                           14640000
                   BH-ACAT-DEFINE-CUSTOMER-TYPE                         14650000
           END-IF.                                                      14660000
                                                                        14670000
           IF  BH-ACAT-RETIRE-ACT-SUB-CTG-NO > 0                        14680000
           AND ACATNAIO-IRA > ' '                                       14690000
               PERFORM 5311-EDIT-IRA-IND THRU 5311-EXIT                 14700000
           ELSE                                                         14710000
LRM004         PERFORM 5312-LOAD-CLASS-CODE-B1                          14711000
               IF  BH-ACAT-DEFINE-CUSTOMER-TYPE = '0'                   14712000
                   PERFORM 5312-EDIT-CLASS-CODE THRU 5312-EXIT          14713000
               ELSE                                                     14714000
                   IF  BH-ACAT-DEFINE-CUSTOMER-TYPE = '1'               14715000
                       PERFORM 5313-EDIT-ADT-CUST-TYPE THRU 5313-EXIT   14716000
                   END-IF                                               14717000
               END-IF                                                   14718000
           END-IF.                                                      14719000
                                                                        14720000
                                                                        14730000
       5311-EDIT-IRA-IND.                                               14740000
           MOVE 434534          TO B1-CARD-NO.                          14750000
           MOVE ZERO TO EIBRESP.                                        14760000
           MOVE 1 TO B1-SEQUENCE.                                       14770000
           PERFORM UNTIL EIBRESP NOT = ZERO                             14780000
                    OR B1-SEQUENCE > 40                                 14790000
              PERFORM READ-B1-RTN                                       14800000
              IF EIBRESP  = +0                                          14810000
                 ADD 1 TO BH-ACAT-RETIRE-ACT-SUB-CTG-NO                 14820000
                 MOVE B1-RETURN-VALUE(1 : 4) TO                         14830000
                        BH-ACAT-RETIRE-ACT-SUB-CTG-ENT(B1-SEQUENCE)     14840000
                 ADD 1 TO B1-SEQUENCE                                   14850000
              END-IF                                                    14860000
           END-PERFORM.                                                 14870000
           MOVE 1 TO B1-SEQUENCE.                                       14880000
                                                                        14890000
           MOVE 'N' TO W-IRA-B1-SW.                                     14900000
           MOVE 1 TO W-SUB1.                                            14910000
       5311-LOOP.                                                       14920000
           IF  BH-ACAT-RETIRE-ACT-IRA-CODE (W-SUB1) = ' '               14930000
               GO TO 5311-EXIT                                          14940000
           END-IF                                                       14950000
           IF  BH-ACAT-RETIRE-ACT-IRA-CODE (W-SUB1) =                   14960000
                                             ACATNAIO-IRA               14970000
               MOVE BH-ACAT-RETIRE-ACT-CUST-TYPE (W-SUB1)               14980000
                                             TO TWA-MCTYPE              14990000
               MOVE 'Y' TO W-IRA-B1-SW                                  15000000
           END-IF                                                       15010000
           IF  W-SUB1 < BH-ACAT-RETIRE-ACT-SUB-CTG-NO                   15020000
               ADD 1 TO W-SUB1                                          15030000
               GO TO 5311-LOOP                                          15040000
           END-IF.                                                      15050000
                                                                        15060000
       5311-EXIT. EXIT.                                                 15070000
      /                                                                 15080000
LRM004 5312-LOAD-CLASS-CODE-B1.                                         15090000
           MOVE 434535          TO B1-CARD-NO.                          15100000
           MOVE ZERO TO EIBRESP.                                        15110000
           MOVE 1 TO B1-SEQUENCE.                                       15120000
           PERFORM UNTIL EIBRESP NOT = ZERO                             15130000
                    OR B1-SEQUENCE > 100                                15140000
              PERFORM READ-B1-RTN                                       15150000
              IF EIBRESP  = +0                                          15160000
LRM004           IF B1-RETURN-VALUE(1 : 3) > SPACES                     15170000
                    ADD 1 TO  BH-ACAT-CUST-TYPE-VALUE-NO                15180000
                    MOVE B1-RETURN-VALUE(1 : 6) TO                      15190000
                        BH-ACAT-CUST-TYPE-VALUE-ENTRY(B1-SEQUENCE)      15200000
LRM007              ADD 1 TO B1-SEQUENCE                                15210000
LRM007           ELSE                                                   15220000
LRM007              MOVE +13 TO EIBRESP                                 15230000
LRM004           END-IF                                                 15240000
              END-IF                                                    15250000
           END-PERFORM.                                                 15260000
           MOVE 1 TO B1-SEQUENCE.                                       15270000
                                                                        15280000
       5312-EDIT-CLASS-CODE.                                            15290000
           MOVE 'N' TO W-CLASS-CODE-B1-SW.                              15300000
           MOVE 1 TO W-SUB1.                                            15310000
       5312-LOOP.                                                       15320000
           IF  W-SUB1 > BH-ACAT-CUST-TYPE-VALUE-NO                      15330000
           OR  BH-ACAT-CUST-TYPE-FROM-NA (W-SUB1) = ' '                 15340000
           OR  W-CLASS-CODE-B1-SW  = 'Y'                                15350000
               GO TO 5312-EXIT                                          15360000
           END-IF                                                       15370000
           IF  BH-ACAT-CUST-TYPE-FROM-NA (W-SUB1)                       15380000
                                           = ACATNAIO-ACCT-CLASS-EXP    15390000
               MOVE BH-ACAT-CUST-ACCT-TYPE (W-SUB1)                     15400000
                                                 TO TWA-MCTYPE          15410000
               MOVE 'Y' TO W-CLASS-CODE-B1-SW                           15420000
LRM004         GO TO 5312-EXIT                                          15430000
           END-IF                                                       15440000
           IF  W-SUB1 < BH-ACAT-CUST-TYPE-VALUE-NO                      15450000
           AND W-CLASS-CODE-B1-SW NOT = 'Y'                             15460000
               ADD 1 TO W-SUB1                                          15470000
               GO TO 5312-LOOP                                          15480000
           END-IF.                                                      15490000
                                                                        15500000
       5312-EXIT. EXIT.                                                 15510000
      /                                                                 15520000
       5313-EDIT-ADT-CUST-TYPE.                                         15530000
                                                                        15540000
LRM004     IF BH-ACAT-CUST-TYPE-VALUE-NO = 0                            15550000
              EVALUATE ACATNAIO-ADT-CUSTOMER-TYPE                       15560000
                    WHEN  000     CONTINUE                              15570000
                    WHEN  001     MOVE 'TR' TO TWA-MCTYPE               15580000
                    WHEN  003     MOVE 'CU' TO TWA-MCTYPE               15590000
                    WHEN  004     MOVE 'CO' TO TWA-MCTYPE               15600000
                    WHEN  008     MOVE 'SN' TO TWA-MCTYPE               15610000
                    WHEN  011     MOVE 'JT' TO TWA-MCTYPE               15620000
                    WHEN  012     MOVE 'JT' TO TWA-MCTYPE               15630000
                    WHEN  013     MOVE 'AG' TO TWA-MCTYPE               15640000
                    WHEN  015     MOVE 'QP' TO TWA-MCTYPE               15650000
                    WHEN  018     MOVE 'TR' TO TWA-MCTYPE               15660000
                    WHEN  021     MOVE '21' TO TWA-MCTYPE               15670000
                    WHEN OTHER    MOVE 'OT' TO TWA-MCTYPE               15680000
              END-EVALUATE                                              15690000
LRM004        GO TO 5313-EXIT                                           15700000
LRM004     END-IF.                                                      15701000
LRM004                                                                  15702000
LRM004     MOVE 'N' TO W-CUST-TYPE-B1-SW.                               15703000
LRM004     MOVE 1 TO W-SUB1.                                            15704000
LRM004     MOVE ACATNAIO-ADT-CUSTOMER-TYPE TO W-ADT-CUSTOMER-TYPE-9.    15705000
LRM004 5313-LOOP.                                                       15706000
LRM004     IF  BH-ACAT-CUST-TYPE-FROM-NA (W-SUB1) = ' '                 15707000
LRM004         GO TO 5313-EXIT                                          15708000
LRM004     END-IF                                                       15709000
LRM004     IF  BH-ACAT-CUST-TYPE-FROM-NA (W-SUB1)                       15709100
LRM004                               =  W-ADT-CUSTOMER-TYPE             15709200
LRM004         MOVE BH-ACAT-CUST-ACCT-TYPE (W-SUB1)                     15709300
LRM004                                           TO TWA-MCTYPE          15709400
LRM004         MOVE 'Y' TO W-CUST-TYPE-B1-SW                            15709500
LRM004         GO TO 5313-EXIT                                          15709600
LRM004     END-IF                                                       15709700
LRM004     IF  W-SUB1 < BH-ACAT-CUST-TYPE-VALUE-NO                      15709800
LRM004         ADD 1 TO W-SUB1                                          15709900
LRM004         GO TO 5313-LOOP                                          15710000
LRM004     END-IF.                                                      15710100
LRM004                                                                  15710200
       5313-EXIT. EXIT.                                                 15710300
      /                                                                 15710400
       5315-CHECK-IRA-BR-RANGE.                                         15710500
           MOVE 009125          TO B1-CARD-NO.                          15710600
           MOVE ZERO TO EIBRESP.                                        15710700
           MOVE 1 TO B1-SEQUENCE.                                       15710800
           PERFORM UNTIL EIBRESP NOT = ZERO                             15710900
                    OR B1-SEQUENCE > 49                                 15711000
              PERFORM READ-B1-RTN                                       15712000
              IF EIBRESP  = +0                                          15713000
                 IF B1-RETURN-VALUE(1 : 3) > SPACES                     15714000
                    ADD 1 TO BH-MGCA-IRA-BR-RANGE-NO                    15715000
                    MOVE B1-RETURN-VALUE(1 : 7) TO                      15716000
                        BH-MGCA-IRA-BR-RANGE-ENTRY(B1-SEQUENCE)         15717000
                    ADD 1 TO B1-SEQUENCE                                15718000
                 ELSE                                                   15719000
                    MOVE +13 TO EIBRESP                                 15720000
                 END-IF                                                 15730000
              END-IF                                                    15740000
           END-PERFORM.                                                 15750000
           MOVE 1 TO B1-SEQUENCE.                                       15760000
                                                                        15770000
           MOVE 'N' TO W-IRA-BR-RANGE-SW.                               15780000
           IF  BH-MGCA-IRA-BR-RANGE-NO = 0                              15790000
               GO TO 5315-EXIT.                                         15800000
           MOVE 1 TO W-SUB1.                                            15810000
       5315-LOOP.                                                       15820000
           IF  TWA-MBR  >= BH-MGCA-IRA-BR-RANGE-LO (W-SUB1) AND         15830000
               TWA-MBR  <= BH-MGCA-IRA-BR-RANGE-HI (W-SUB1)             15840000
               MOVE 'IR'  TO TWA-MCTYPE                                 15850000
               MOVE 'Y' TO W-IRA-BR-RANGE-SW                            15860000
***************DISPLAY*'***IRA-BR*FOUND*'*******************************15870000
*********************'*LO='*BH-MGCA-IRA-BR-RANGE-LO*(W-SUB1)************15880000
*********************'*HI='*BH-MGCA-IRA-BR-RANGE-HI*(W-SUB1)************15890000
           ELSE                                                         15900000
               IF  W-SUB1 < BH-MGCA-IRA-BR-RANGE-NO                     15910000
                   ADD 1 TO W-SUB1                                      15920000
               GO TO 5315-LOOP                                          15930000
           END-IF.                                                      15940000
                                                                        15950000
       5315-EXIT. EXIT.                                                 15960000
      /                                                                 15970000
       5316-CHECK-IRA-BR-ACT-RANGE.                                     15980000
           MOVE 009126          TO B1-CARD-NO.                          15990000
           MOVE ZERO TO EIBRESP.                                        16000000
           MOVE 1 TO B1-SEQUENCE.                                       16010000
           PERFORM UNTIL EIBRESP NOT = ZERO                             16020000
                    OR B1-SEQUENCE > 49                                 16030000
              PERFORM READ-B1-RTN-LONG                                  16040000
              IF EIBRESP  = +0                                          16050000
                 IF B1-RETURN-VALUE(1 : 3) > SPACES                     16060000
                    ADD 1 TO BH-MGCA-IRA-BR-ACT-RANGE-NO                16070000
                    MOVE B1-RETURN-VALUE(1 : 19) TO                     16080000
                        BH-MGCA-IRA-BR-ACT-RANGE-ENTRY(B1-SEQUENCE)     16090000
                    ADD 1 TO B1-SEQUENCE                                16100000
                 ELSE                                                   16110000
                    MOVE +13 TO EIBRESP                                 16120000
                 END-IF                                                 16130000
              END-IF                                                    16140000
           END-PERFORM.                                                 16150000
           MOVE 1 TO B1-SEQUENCE.                                       16160000
                                                                        16170000
           MOVE 'N' TO W-IRA-BR-ACT-RANGE-SW.                           16180000
           IF  BH-MGCA-IRA-BR-ACT-RANGE-NO = 0                          16190000
               GO TO 5316-EXIT.                                         16200000
           MOVE 1 TO W-SUB1.                                            16210000
       5316-LOOP.                                                       16220000
           IF  (TWA-MBR >= BH-MGCA-IRA-BR-ACT-BR-LO (W-SUB1) AND        16230000
                TWA-MBR <= BH-MGCA-IRA-BR-ACT-BR-HI (W-SUB1))           16240000
           AND (TWA-MAC >= BH-MGCA-IRA-BR-ACT-ACT-LO (W-SUB1) AND       16250000
                TWA-MAC <= BH-MGCA-IRA-BR-ACT-ACT-HI (W-SUB1))          16260000
                  MOVE 'IR'  TO TWA-MCTYPE                              16270000
                  MOVE 'Y' TO W-IRA-BR-ACT-RANGE-SW                     16280000
******************DISPLAY*'***IRA-BR-ACT*FOUND*'************************16290000
*********************'*LO='*BH-MGCA-IRA-BR-ACT-BR-LO*(W-SUB1)***********16300000
*********************'*HI='*BH-MGCA-IRA-BR-ACT-BR-HI*(W-SUB1)***********16310000
*********************'*LO='*BH-MGCA-IRA-BR-ACT-ACT-LO*(W-SUB1)**********16320000
*********************'*HI='*BH-MGCA-IRA-BR-ACT-ACT-HI*(W-SUB1)**********16330000
           ELSE                                                         16340000
               IF  W-SUB1 < BH-MGCA-IRA-BR-ACT-RANGE-NO                 16350000
                   ADD 1 TO W-SUB1                                      16360000
               GO TO 5316-LOOP                                          16370000
           END-IF.                                                      16380000
                                                                        16390000
       5316-EXIT. EXIT.                                                 16400000
                                                                        16410000
062700 EJECT                                                            16420000
062800                                                                  16430000
       RETURN-FROM-DETAIL-RTN.                                          16440000
031100     PERFORM DELETE-TSQ-RTN.                                      16450000
031200     SET FIRST-TIME TO TRUE.                                      16460000
070900                                                                  16470000
087000     EJECT                                                        16480000
       CALL-SECLINK-RTN.                                                16490000
00442      EXEC CICS LINK PROGRAM ('SECLINK')                           16500000
                COMMAREA(SECLINK-LIST)                                  16510000
00443           LENGTH(LENGTH OF SECLINK-LIST)                          16520000
           END-EXEC.                                                    16530000
                                                                        16540000
           EJECT                                                        16550000
087100                                                                  16560000
       INVOKE-DETAIL-PROGRAM-RTN.                                       16570000
           EXEC CICS XCTL PROGRAM(CALLED-PROGRAM-NAME)                  16580000
                          COMMAREA(ACATCOMM-COMMAREA)                   16590000
           END-EXEC.                                                    16600000
  ******** MOVE 'Y' TO ACAT-NOTFND-FLAG.                                16610000
           MOVE CALLED-PROGRAM-NAME TO ERROR-PROG-NAME.                 16620000
           MOVE 'A' TO ACAT-NEXT.                                       16630000
           MOVE ERROR-PROG-MSG    TO SYSTEM-MSG.                        16640000
           MOVE LOW-VALUE TO ACAT02MO.                                  16650000
           MOVE SPACES     TO ACAT-CALLING-PROG-NAME.                   16660000
                                                                        16670000
096300     EJECT                                                        16680000
096400                                                                  16690000
   500 INIT-MAP-RTN.                                                    16700000
096600     MOVE SPACES     TO ACAT02MO                                  16710000
                              TWA-MAP-TABLE.                            16720000
098100     EJECT                                                        16730000
                                                                        16740000
           SKIP3                                                        16750000
       ASKIP-MAP-RTN.                                                   16760000
           MOVE ATT-ASKIP TO MCTYPEA                                    16770000
                             MCBRKRA                                    16780000
                             MCBNAMA                                    16790000
                             MCACCTA                                    16800000
                             MNAMEA                                     16810000
                             MNAME2A                                    16820000
                             MSSNA                                      16830000
                             MSSN2A                                     16840000
                             MACATA                                     16850000
                             MSTATA                                     16860000
                             MSDA                                       16870000
                             MSUBMA                                     16880000
                             MCMNTA.                                    16890000
102000 EJECT                                                            16900000
102100                                                                  16910000
103000 SEND-MAP-RETURN.                                                 16920000
           MOVE -1 TO MBRL.                                             16930000
103600     IF (LINE-COUNT = 0)                                          16940000
103700     AND DATA-ONLY                                                16950000
104000        EVALUATE TRUE                                             16960000
104100           WHEN EIBAID = DFHPA1                                   16970000
104200               SET ALARM-NEEDED TO TRUE                           16980000
104300               MOVE 'BOTTOM OF DATA.         ' TO SYSTEM-MSG      16990000
104400           WHEN EIBAID = DFHPA2                                   17000000
104500               SET ALARM-NEEDED TO TRUE                           17010000
104600               MOVE 'TOP OF DATA.            ' TO SYSTEM-MSG      17020000
104700           WHEN OTHER                                             17030000
104800               PERFORM ACAT-IT-NOT-FOUND-RTN                      17040000
104900        END-EVALUATE                                              17050000
105000     END-IF.                                                      17060000
           PERFORM INIT-MAP-INPUT-AREA.                                 17070000
           MOVE ATT-UNPROT TO MNEXTA                                    17080000
105100     SET TWA-INTRAN-NO-CHANGE TO TRUE.                            17090000
105100     MOVE 'N' TO  TWA-ACAT-NOT-FOUND-FLAG.                        17100000
105200     MOVE SYSTEM-MSG     TO  TRLMSGO.                             17110000
105300     IF  SYSTEM-MSG NOT = SPACES                                  17120000
105400         MOVE ATT-ASKIP-BRT  TO  TRLMSGA                          17130000
105500     END-IF.                                                      17140000
127200     PERFORM WRITE-TSQ-RTN.                                       17150000
    00     IF  DATA-ONLY                                                17160000
105700         PERFORM SEND-MAP-DATA-ONLY                               17170000
105800     ELSE                                                         17180000
105900         PERFORM SEND-MAP-ERASE                                   17190000
           END-IF.                                                      17200000
           MOVE 'ACAT02IT' TO ACAT-PROGRAM-NAME.                        17210000
106000     PERFORM RETURN-TO-CICS.                                      17220000
106100                                                                  17230000
106200     EJECT                                                        17240000
106100                                                                  17250000
       INIT-MAP-INPUT-AREA.                                             17260000
           MOVE ACAT-INP-BRANCH      TO MBRO.                           17270000
           MOVE ACAT-INP-ACCOUNT     TO MACO.                           17280000
           MOVE TWA-CLIENT-NO-X(2 : 3) TO MCLINBO.                      17290000
029700     MOVE WSTIME            TO MTIMEO.                            17300000
029800     MOVE WSMMDDYY          TO MDATEO.                            17310000
106100                                                                  17320000
106200     EJECT                                                        17330000
106100                                                                  17340000
       ACAT-IT-NOT-FOUND-RTN.                                           17350000
           IF EIBAID = DFHPF10                                          17360000
           OR WS-DELETE                                                 17370000
           OR FIRST-TIME                                                17380000
           OR TWA-INTRAN-BRW                                            17390000
              MOVE LOW-VALUE TO ACAT02MO                                17400000
              PERFORM INIT-MAP-RTN                                      17410000
              MOVE LOW-VALUE TO TWA-MAP-TABLE                           17420000
                                ACAT02MO.                               17430000
                                                                        17440000
           PERFORM INIT-MAP-INPUT-AREA.                                 17450000
           MOVE ATT-UNPROT TO MNEXTA.                                   17460000
           MOVE ATT-UNPROT-BRT TO MBRA                                  17470000
           MOVE -1 TO MBRL                                              17480000
           IF NOT ACAT-SIGN-ON-UPDATE                                   17490000
              PERFORM ASKIP-MAP-RTN.                                    17500000
           IF WS-DELETE                                                 17510000
              MOVE 'RECORD DELETED / NO RECORDS FOUND' TO TRLMSGO       17520000
           ELSE                                                         17530000
              MOVE 'NO RECORDS FOUND' TO TRLMSGO.                       17540000
           MOVE ATT-ASKIP-BRT  TO  TRLMSGA                              17550000
           IF FIRST-TIME                                                17560000
           OR WS-DELETE                                                 17570000
              MOVE 'ACAT02IT' TO ACAT-PROGRAM-NAME                      17580000
              PERFORM SEND-MAP-ERASE                                    17590000
           ELSE                                                         17600000
              PERFORM SEND-MAP-DATA-ONLY.                               17610000
                                                                        17620000
           PERFORM WRITE-TSQ-RTN                                        17630000
           PERFORM RETURN-TO-CICS.                                      17640000
                                                                        17650000
106200     EJECT                                                        17660000
106100                                                                  17670000
106400 SEND-MAP-ERASE.                                                  17680000
027000     MOVE 'ACAX'        TO MTRANSO.                               17690000
           MOVE TWA-CLIENT-NO-X(2 : 3) TO MCLINBO.                      17700000
029700     MOVE WSTIME        TO MTIMEO.                                17710000
029800     MOVE WSMMDDYY      TO MDATEO.                                17720000
106500     EXEC CICS SEND MAP('HDRMAP')                                 17730000
106600               MAPSET('ACAT00M')                                  17740000
106700               FROM(HDRMAPO)                                      17750000
106800               ACCUM                                              17760000
                     CURSOR                                             17770000
106900               ERASE                                              17780000
107000     END-EXEC.                                                    17790000
106500     EXEC CICS SEND MAP('ACAT02M')                                17800000
106600               MAPSET('ACAT02M')                                  17810000
106700               FROM(ACAT02MO)                                     17820000
106800               ACCUM                                              17830000
                     CURSOR                                             17840000
107000     END-EXEC.                                                    17850000
           MOVE SYSTEM-MSG TO TRLMSGO.                                  17860000
106500     EXEC CICS SEND MAP('TRLMAP')                                 17870000
106600               MAPSET('ACAT00M')                                  17880000
106700               FROM(TRLMAPO)                                      17890000
106800               ACCUM                                              17900000
107000     END-EXEC.                                                    17910000
106500     EXEC CICS SEND PAGE                                          17920000
107000     END-EXEC.                                                    17930000
107100                                                                  17940000
107200 EJECT                                                            17950000
107300                                                                  17960000
107400 SEND-MAP-DATA-ONLY.                                              17970000
027000     MOVE 'ACAX'         TO MTRANSO.                              17980000
029700     MOVE WSTIME         TO MTIMEO.                               17990000
029800     MOVE WSMMDDYY       TO MDATEO.                               18000000
    ***    IF FIRST-TIME                                                18010000
    ***    AND (WK-CURSOR NOT = 0)                                      18020000
              EXEC CICS SEND MAP('HDRMAP')                              18030000
                        MAPSET('ACAT00M')                               18040000
                        FROM(HDRMAPO)                                   18050000
                        ACCUM                                           18060000
                        CURSOR                                          18070000
                        DATAONLY                                        18080000
               END-EXEC                                                 18090000
107600         EXEC CICS SEND MAP('ACAT02M')                            18100000
107700                   MAPSET('ACAT02M')                              18110000
107800                   FROM(ACAT02MO)                                 18120000
107900                   CURSOR                                         18130000
108000                   DATAONLY                                       18140000
                         ACCUM                                          18150000
108100         END-EXEC                                                 18160000
               MOVE SYSTEM-MSG TO TRLMSGO                               18170000
               EXEC CICS SEND MAP('TRLMAP')                             18180000
                         MAPSET('ACAT00M')                              18190000
                         FROM(TRLMAPO)                                  18200000
                         DATAONLY                                       18210000
                         ACCUM                                          18220000
               END-EXEC                                                 18230000
               EXEC CICS SEND PAGE                                      18240000
               END-EXEC.                                                18250000
108200                                                                  18260000
       SEND-POPUP-MAP-RTN.                                              18270000
           IF ACAT-SIGN-ON-UPDATE                                       18280000
           AND TWA-ACTION NOT = 'B'                                     18290000
              MOVE 'Y' TO TWA-ACAT90CM-TS-UPDATE-IND                    18300000
           ELSE                                                         18310000
              MOVE 'N' TO TWA-ACAT90CM-TS-UPDATE-IND.                   18320000
                                                                        18330000
           MOVE SPACES TO TWA-MCMNT.                                    18340000
           MOVE 'A' TO ACAT-INP-SEL.                                    18350000
           PERFORM WRITE-TSQ-RTN.                                       18360000
           PERFORM WRITE-ACAT90CM-TS-RTN.                               18370000
           MOVE '$' TO WS-ACAT-NEXT.                                    18380000
           MOVE 'ACAT90CM' TO CALLED-PROGRAM-NAME.                      18390000
           PERFORM INVOKE-DETAIL-PROGRAM-RTN.                           18400000
                                                                        18410000
       WRITE-ACAT90CM-TS-RTN.                                           18420000
           MOVE 'ACA$'   TO TRAN-ID.                                    18430000
           EXEC CICS DELETEQ TS QUEUE(TSQ-NAME)                         18440000
           END-EXEC.                                                    18450000
                                                                        18460000
           MOVE TWA-MAP-TABLE TO ACAT90CM-TS-AREA.                      18470000
124700     EXEC CICS WRITEQ TS QUEUE(TSQ-NAME)                          18480000
124800                         FROM(ACAT90CM-TS-AREA)                   18490000
124900                         LENGTH(LENGTH OF ACAT90CM-TS-AREA)       18500000
                               ITEM(ITEM-NUM)                           18510000
125000     END-EXEC.                                                    18520000
125100     IF EIBRESP NOT = +0                                          18530000
              MOVE LOW-VALUE TO ACAT02MO                                18540000
125200        MOVE 'ACAT02 WRITE TSQ ERROR ON ACA$'                     18550000
125300          TO SYSTEM-MSG                                           18560000
125500     END-IF.                                                      18570000
                                                                        18580000
123600 READ-ACAT90CM-TS-RTN.                                            18590000
           MOVE 'ACA$'   TO TRAN-ID.                                    18600000
           EXEC CICS READQ TS QUEUE(TSQ-NAME)                           18610000
                              INTO(ACAT90CM-TS-AREA)                    18620000
                              LENGTH(LENGTH OF ACAT90CM-TS-AREA)        18630000
                              ITEM(ITEM-NUM)                            18640000
124000     END-EXEC.                                                    18650000
125100     IF EIBRESP = +0                                              18660000
              IF ACAT90CM-TS-SCREEN = 'A'                               18670000
                 MOVE ACAT90CM-TS-MCCMNT-X120 TO TWA-MCCMNT-X120        18680000
                 MOVE ACAT90CM-TS-MSUBM       TO TWA-MSUBM              18690000
              ELSE                                                      18700000
              IF ACAT90CM-TS-SCREEN = 'T'                               18710000
                 MOVE ACAT90CM-TS-MCTYPE TO TWA-MCTYPE                  18720000
           END-IF.                                                      18730000
           MOVE 'ACAX'   TO TRAN-ID.                                    18740000
108300 EJECT                                                            18750000
108400                                                                  18760000
108500 PAGE-FORWARD-RTN.                                                18770000
           MOVE TWA-CLIENT-NO-X   TO ACAT02IO-CLIENT-NBR.               18780000
           MOVE ACAT-ADP-BROKER   TO ACAT02IO-RCV-NBR.                  18790000
           MOVE TWA-MBR        TO ACAT02IO-RCV-ACCT                     18800000
           MOVE TWA-MAC        TO ACAT02IO-RCV-ACCT(4 : 5)              18810000
           MOVE TWA-MCBRKR     TO ACAT02IO-DLVR-NBR                     18820000
           MOVE TWA-MCACCT     TO ACAT02IO-DLVR-ACCT                    18830000
                                                                        18840000
           MOVE TWA-MBR         TO TWA-CURRENT-BRANCH.                  18850000
           MOVE TWA-MAC         TO TWA-CURRENT-ACCOUNT.                 18860000
                                                                        18870000
           SET ACAT02IO-IT-READ-NEXTA TO TRUE.                          18880000
                                                                        18890000
           PERFORM LINK-TO-ACAT02IO-RTN.                                18900000
                                                                        18910000
           IF ACAT02IO-NOT-FOUND                                        18920000
              MOVE 'BOTTOM OF DATA' TO SYSTEM-MSG                       18930000
              PERFORM  ERROR-RTN                                        18940000
           ELSE                                                         18950000
           IF NOT ACAT02IO-FOUND                                        18960000
              MOVE LOW-VALUE TO ACAT02MO                                18970000
              MOVE 'P-FWD'           TO WS-DB2-PROBLEM-FUNCTION         18980000
              MOVE ACAT02IO-SQLCAID  TO WS-DB2-PROBLEM-TABLE            18990000
              MOVE ACAT02IO-SQLCODE  TO WS-DB2-PROBLEM-ID               19000000
              MOVE WS-DB2-PROBLEM-MSG TO SYSTEM-MSG                     19010000
              PERFORM DB2-ERROR-RTN.                                    19020000
                                                                        19030000
                                                                        19040000
           SET TWA-INTRAN-BRW TO TRUE.                                  19050000
           PERFORM MOVE-ACAT02IO-TO-TWA-RTN.                            19060000
           PERFORM REFORMAT-SCREEN-DETAIL.                              19070000
           PERFORM PROCESS-MAP-ITEMS                                    19080000
                  THRU PROCESS-MAP-ITEMS-EXIT.                          19090000
           MOVE SPACES TO TWA-INTRAN-FLAG.                              19100000
           PERFORM SEND-MAP-DATA-ONLY.                                  19110000
           PERFORM WRITE-TSQ-RTN.                                       19120000
           PERFORM RETURN-TO-CICS.                                      19130000
                                                                        19140000
111200     EJECT                                                        19150000
111300                                                                  19160000
111400 PAGE-BACKWARD-RTN.                                               19170000
           MOVE TWA-CLIENT-NO-X   TO ACAT02IO-CLIENT-NBR.               19180000
           MOVE ACAT-ADP-BROKER   TO ACAT02IO-RCV-NBR.                  19190000
           MOVE TWA-MBR        TO ACAT02IO-RCV-ACCT                     19200000
           MOVE TWA-MAC        TO ACAT02IO-RCV-ACCT(4 : 5)              19210000
           MOVE TWA-MCBRKR     TO ACAT02IO-DLVR-NBR                     19220000
           MOVE TWA-MCACCT     TO ACAT02IO-DLVR-ACCT                    19230000
                                                                        19240000
           MOVE TWA-MBR         TO TWA-CURRENT-BRANCH.                  19250000
           MOVE TWA-MAC         TO TWA-CURRENT-ACCOUNT.                 19260000
                                                                        19270000
           SET ACAT02IO-IT-READ-PREVA TO TRUE.                          19280000
                                                                        19290000
           PERFORM LINK-TO-ACAT02IO-RTN.                                19300000
                                                                        19310000
           IF ACAT02IO-NOT-FOUND                                        19320000
              MOVE 'TOP OF DATA' TO SYSTEM-MSG                          19330000
              PERFORM  ERROR-RTN                                        19340000
           ELSE                                                         19350000
           IF NOT ACAT02IO-FOUND                                        19360000
              MOVE LOW-VALUE TO ACAT02MO                                19370000
              MOVE 'P-BCK'           TO WS-DB2-PROBLEM-FUNCTION         19380000
              MOVE ACAT02IO-SQLCAID  TO WS-DB2-PROBLEM-TABLE            19390000
              MOVE ACAT02IO-SQLCODE  TO WS-DB2-PROBLEM-ID               19400000
              MOVE WS-DB2-PROBLEM-MSG TO SYSTEM-MSG                     19410000
              PERFORM DB2-ERROR-RTN.                                    19420000
                                                                        19430000
           SET TWA-INTRAN-BRW TO TRUE.                                  19440000
           PERFORM MOVE-ACAT02IO-TO-TWA-RTN.                            19450000
           PERFORM REFORMAT-SCREEN-DETAIL.                              19460000
           PERFORM PROCESS-MAP-ITEMS                                    19470000
                  THRU PROCESS-MAP-ITEMS-EXIT.                          19480000
           MOVE SPACES TO TWA-INTRAN-FLAG.                              19490000
           PERFORM SEND-MAP-DATA-ONLY.                                  19500000
           PERFORM WRITE-TSQ-RTN.                                       19510000
           PERFORM RETURN-TO-CICS.                                      19520000
                                                                        19530000
           EJECT                                                        19540000
       LINK-TO-ACATNAIO-RTN.                                            19550000
00442      EXEC CICS LINK PROGRAM (WS-ACATNAIO)                         19560000
                COMMAREA(ACATNAIO-CALL-AREA)                            19570000
00443           LENGTH(LENGTH OF ACATNAIO-CALL-AREA)                    19580000
           END-EXEC.                                                    19590000
                                                                        19600000
       LINK-TO-ACATPPIO-RTN.                                            19610000
00442      EXEC CICS LINK PROGRAM (WS-ACATPPIO)                         19620000
                COMMAREA(ACATPPIO-CALL-AREA)                            19630000
00443           LENGTH(LENGTH OF ACATPPIO-CALL-AREA)                    19640000
           END-EXEC.                                                    19650000
                                                                        19660000
LRM002 LINK-TO-ACATRSTIO-RTN.                                           19670000
LRM002     EXEC CICS LINK PROGRAM (WS-ACATRST)                          19680000
LRM002          COMMAREA(ACATRSTIO-CALL-AREA)                           19690000
LRM002          LENGTH(LENGTH OF ACATRSTIO-CALL-AREA)                   19700000
LRM002     END-EXEC.                                                    19710000
                                                                        19720000
       LINK-TO-ACAT02IO-RTN.                                            19730000
           MOVE ACAT-SUPER-SIGN-ON-SEC-FLAG                             19740000
                    TO ACAT02IO-SUPER-SIGN-FLAG.                        19750000
00442      EXEC CICS LINK PROGRAM (WS-ACAT02DB)                         19760000
                COMMAREA(ACAT02IO-CALL-AREA)                            19770000
00443           LENGTH(LENGTH OF ACAT02IO-CALL-AREA)                    19780000
           END-EXEC.                                                    19790000
       UPDATE-ACAT-IT-RTN.                                              19800000
              IF TWA-ACTION = 'A'                                       19810000
                 PERFORM CREATE-ACAT-IT-RECORD                          19820000
              ELSE                                                      19830000
              IF TWA-ACTION = 'C'                                       19840000
                 IF TWA-MDEL = 'Y'                                      19850000
                    PERFORM DELETE-ACAT-IT-RECORD                       19860000
                 ELSE                                                   19870000
                    PERFORM UPDATE-ACAT-IT-RECORD                       19880000
              END-IF END-IF END-IF.                                     19890000
                                                                        19900000
           EJECT                                                        19910000
       CREATE-ACAT-IT-RECORD.                                           19920000
           SET ACAT02IO-IT-ISRT TO TRUE.                                19930000
           MOVE TWA-CLIENT-NO-X   TO ACAT02IO-CLIENT-NBR.               19940000
           MOVE TWA-MCBRKR        TO ACAT02IO-DLVR-NBR.                 19950000
           MOVE TWA-MCACCT        TO ACAT02IO-DLVR-ACCT.                19960000
           MOVE ACAT-ADP-BROKER   TO ACAT02IO-RCV-NBR.                  19970000
           MOVE TWA-MBR           TO ACAT02IO-RCV-ACCT.                 19980000
           MOVE TWA-MAC           TO ACAT02IO-RCV-ACCT(4 : 5).          19990000
           MOVE TWA-MCCMNT-X120   TO ACAT02IO-CMNT-TXT.                 20000000
           IF ACAT-OCC-BROKER > SPACES                                  20010000
              MOVE '0'             TO ACAT02IO-RCV-OCC-BRKR-NBR(1 : 1)  20020000
              MOVE ACAT-OCC-BROKER TO ACAT02IO-RCV-OCC-BRKR-NBR(2 : 4)  20030000
           ELSE                                                         20040000
              MOVE SPACES          TO ACAT02IO-RCV-OCC-BRKR-NBR.        20050000
           MOVE TWA-MRR           TO ACAT02IO-RR-CD.                    20060000
           MOVE TWA-MCTYPE        TO ACAT02IO-RCV-ACCT-TYPE-CD.         20070000
           MOVE TWA-MNAME         TO ACAT02IO-RCV-CUST-NM.              20080000
           MOVE TWA-MNAME2        TO ACAT02IO-RCV-CUST-NM(31 : 30).     20090000
           MOVE TWA-MSSN(1 : 3)   TO ACAT02IO-RCV-SS-PRIM-NBR(1 : 3).   20100000
           MOVE TWA-MSSN(5 : 2)   TO ACAT02IO-RCV-SS-PRIM-NBR(4 : 2).   20110000
           MOVE TWA-MSSN(8 : 4)   TO ACAT02IO-RCV-SS-PRIM-NBR(6 : 4).   20120000
           IF TWA-MSSN2(1 : 1) NOT GREATER SPACES                       20130000
              MOVE SPACES           TO ACAT02IO-RCV-SS-SCNDY-NBR        20140000
           ELSE                                                         20150000
              MOVE TWA-MSSN2(1 : 3) TO ACAT02IO-RCV-SS-SCNDY-NBR(1 : 3) 20160000
              MOVE TWA-MSSN2(5 : 2) TO ACAT02IO-RCV-SS-SCNDY-NBR(4 : 2) 20170000
              MOVE TWA-MSSN2(8 : 4) TO ACAT02IO-RCV-SS-SCNDY-NBR(6 : 4) 20180000
           END-IF.                                                      20190000
           IF TWA-MSUBM = 'Y'                                           20200000
              SET ACAT02IO-NSCC-SUBMIT-ELIGABLE TO TRUE                 20210000
           ELSE                                                         20220000
              SET ACAT02IO-NSCC-SUBMIT-HOLD     TO TRUE.                20230000
           MOVE TWA-HIST-DELETE-IND TO ACAT02IO-HIST-DELETE-IND.        20240000
           MOVE SPACES TO TWA-HIST-DELETE-IND.                          20250000
           MOVE TWA-CONTROL-NBR TO ACAT02IO-CONTROL-NBR.                20260000
           IF TWA-CONTROL-NBR > SPACES                                  20270000
              IF (TWA-TRNFR-TYPE-RJCT-CD >= '01' AND <= '05')           20280000
ET0001        AND (TWA-STTS-CD NOT = '600')                             20281000
                 MOVE 'C' TO ACAT02IO-TRANS-TYPE-CD                     20290000
                 MOVE 'Y' TO ACAT02IO-ACCT-RJCT-RSBM-IND                20300000
                 MOVE SPACES          TO ACAT02IO-RCV-OCC-BRKR-NBR      20310000
              ELSE                                                      20320000
                 MOVE 'A' TO ACAT02IO-TRANS-TYPE-CD                     20330000
                 MOVE 'Y' TO ACAT02IO-ACCT-RJCT-RSBM-IND                20340000
           ELSE                                                         20350000
              MOVE 'A' TO ACAT02IO-TRANS-TYPE-CD                        20360000
              MOVE ' ' TO ACAT02IO-ACCT-RJCT-RSBM-IND                   20370000
           END-IF.                                                      20380000
ET0001     IF  (TWA-STTS-CD = '140')                                    20390000
ET0001     AND (TWA-TRNFR-TYPE-RJCT-CD >= '01' AND <= '05')             20400000
ET0001        MOVE WS-TIME-HH TO WS-CURRENT-HH                          20410000
ET0001        MOVE WS-TIME-MM TO WS-CURRENT-MM                          20420000
ET0001        IF  TWA-STTLM-TM-CD = 'L'                                 20430000
ET0001        AND WS-CURRENT-TIME > '1530'                              20440000
ET0001           MOVE 'A'    TO ACAT02IO-TRANS-TYPE-CD                  20470000
ET0001           MOVE 'Y'    TO ACAT02IO-ACCT-RJCT-RSBM-IND             20480000
ET0001           MOVE 'Y'    TO WS-LATE-REJ-SUBMIT-SW                   20480100
ET0001        END-IF                                                    20481000
ET0001     END-IF.                                                      20482000
           IF TWA-HISTORY-NOTIFIED                                      20489000
              MOVE SPACES TO TWA-HISTORY-NOTITY-IND                     20490000
              MOVE 'Y' TO ACAT02IO-HIST-DELETE-IND                      20500000
           ELSE                                                         20510000
              MOVE ' ' TO ACAT02IO-HIST-DELETE-IND                      20520000
           END-IF.                                                      20530000
LRM003     MOVE ACAT-SIGN-ON-ID      TO ACAT02IO-SNON-ID                20540000
LRM003     MOVE ACAT-CICS-NETNAME    TO ACAT02IO-NETNAME                20541000
LRM003     MOVE ACAT-CICS-USER-ID    TO ACAT02IO-USER-ID                20542000
LRM003     MOVE ACAT-CICS-USER-NAME  TO ACAT02IO-USER-NAME              20543000
           PERFORM LINK-TO-ACAT02IO-RTN.                                20544000
           IF ACAT02IO-GOOD-RESP                                        20545000
              MOVE -1 TO MSUBML                                         20546000
              IF TWA-MSUBM = 'Y'                                        20547000
LRM013           MOVE 'RECORD CREATED SUCCESSFULLY / AWAITING NSCC XMIT'20548000
                                                         TO SYSTEM-MSG  20549000
ET0001           IF WS-LATE-REJ-SUBMIT-SW = 'Y'                         20550000
ET0001              MOVE 'PAST RESUBMIT CUTOFF TIME - NEW REC CREATED / 20560000
ET0001-                  'AWAITING NSCC XMIT'                           20570000
ET0001                TO SYSTEM-MSG                                     20580000
ET0001           END-IF                                                 20590000
              ELSE                                                      20600000
                 MOVE 'RECORD RETAINED / SUBMIT PENDING' TO SYSTEM-MSG  20610000
ET0001           IF WS-LATE-REJ-SUBMIT-SW = 'Y'                         20611000
ET0001              MOVE 'PAST RESUBMIT CUTOFF TIME - NEW RECORD CREATED20612000
ET0001-                  ' AND RETAINED / SUBMIT PENDING'               20613000
ET0001                TO SYSTEM-MSG                                     20613100
ET0001           END-IF                                                 20613200
              END-IF                                                    20613300
              MOVE 'C' TO TWA-ACTION                                    20613400
              MOVE ACAT02IO-DLVR-NBR  TO TWA-ORIG-DLVR-NBR              20613500
              MOVE ACAT02IO-DLVR-ACCT TO TWA-ORIG-DLVR-ACCT             20613600
              MOVE ATT-UNPROT TO MDELA                                  20613700
              MOVE ACAT02IO-UPDT-TMSTP TO TWA-UPDT-TMSTP                20613800
              PERFORM  ERROR-RTN                                        20613900
           ELSE                                                         20614000
              MOVE LOW-VALUE TO ACAT02MO                                20615000
              MOVE 'WRITE'           TO WS-DB2-PROBLEM-FUNCTION         20616000
              MOVE ACAT02IO-SQLCAID  TO WS-DB2-PROBLEM-TABLE            20617000
              MOVE ACAT02IO-SQLCODE  TO WS-DB2-PROBLEM-ID               20618000
              MOVE WS-DB2-PROBLEM-MSG TO SYSTEM-MSG                     20619000
              PERFORM DB2-ERROR-RTN.                                    20620000
                                                                        20630000
           SKIP3                                                        20640000
                                                                        20650000
       UPDATE-ACAT-IT-RECORD.                                           20660000
           SET ACAT02IO-IT-UPD  TO TRUE.                                20670000
           MOVE TWA-CLIENT-NO-X   TO ACAT02IO-CLIENT-NBR.               20680000
           MOVE TWA-MCBRKR        TO ACAT02IO-DLVR-NBR.                 20690000
           MOVE TWA-MCACCT        TO ACAT02IO-DLVR-ACCT.                20700000
           MOVE ACAT-ADP-BROKER   TO ACAT02IO-RCV-NBR.                  20710000
           MOVE TWA-MBR           TO ACAT02IO-RCV-ACCT.                 20720000
           MOVE TWA-MAC           TO ACAT02IO-RCV-ACCT(4 : 5).          20730000
           MOVE TWA-MCCMNT-X120   TO ACAT02IO-CMNT-TXT.                 20740000
           MOVE TWA-MRR           TO ACAT02IO-RR-CD.                    20750000
           MOVE TWA-MCTYPE        TO ACAT02IO-RCV-ACCT-TYPE-CD.         20760000
           MOVE TWA-MNAME         TO ACAT02IO-RCV-CUST-NM.              20770000
           MOVE TWA-MNAME2        TO ACAT02IO-RCV-CUST-NM(31 : 30).     20780000
           MOVE TWA-MSSN(1 : 3)   TO ACAT02IO-RCV-SS-PRIM-NBR(1 : 3).   20790000
           MOVE TWA-MSSN(5 : 2)   TO ACAT02IO-RCV-SS-PRIM-NBR(4 : 2).   20800000
           MOVE TWA-MSSN(8 : 4)   TO ACAT02IO-RCV-SS-PRIM-NBR(6 : 4).   20810000
           IF TWA-MSSN2(1 : 1) NOT GREATER SPACES                       20820000
              MOVE SPACES           TO ACAT02IO-RCV-SS-SCNDY-NBR        20830000
           ELSE                                                         20840000
              MOVE TWA-MSSN2(1 : 3) TO ACAT02IO-RCV-SS-SCNDY-NBR(1 : 3) 20850000
              MOVE TWA-MSSN2(5 : 2) TO ACAT02IO-RCV-SS-SCNDY-NBR(4 : 2) 20860000
              MOVE TWA-MSSN2(8 : 4) TO ACAT02IO-RCV-SS-SCNDY-NBR(6 : 4) 20870000
           END-IF.                                                      20880000
           IF TWA-MSUBM = 'Y'                                           20890000
              SET ACAT02IO-NSCC-SUBMIT-ELIGABLE TO TRUE                 20900000
           ELSE                                                         20910000
              SET ACAT02IO-NSCC-SUBMIT-HOLD     TO TRUE.                20920000
           MOVE TWA-ORIG-DLVR-NBR  TO ACAT02IO-ORIG-DLVR-NBR.           20930000
           MOVE TWA-ORIG-DLVR-ACCT TO ACAT02IO-ORIG-DLVR-ACCT.          20940000
           MOVE TWA-CONTROL-NBR    TO ACAT02IO-CONTROL-NBR.             20950000
           MOVE ' ' TO ACAT02IO-ACCT-RJCT-RSBM-IND                      20960000
           MOVE TWA-UPDT-TMSTP     TO ACAT02IO-UPDT-TMSTP.              20970000
LRM003     MOVE ACAT-SIGN-ON-ID     TO ACAT02IO-SNON-ID                 20980000
LRM003     MOVE ACAT-CICS-NETNAME   TO ACAT02IO-NETNAME                 20990000
LRM003     MOVE ACAT-CICS-USER-ID   TO ACAT02IO-USER-ID                 21000000
LRM003     MOVE ACAT-CICS-USER-NAME TO ACAT02IO-USER-NAME               21010000
                                                                        21020000
           PERFORM LINK-TO-ACAT02IO-RTN.                                21030000
           IF ACAT02IO-GOOD-RESP                                        21040000
              MOVE ACAT02IO-UPDT-TMSTP TO TWA-UPDT-TMSTP                21050000
              IF TWA-MSUBM = 'Y'                                        21060000
                 MOVE -1 TO MBRL                                        21070000
LRM013           MOVE 'RECORD UPDATED SUCCESSFULLY / AWAITING NSCC XMIT'21080000
                      TO SYSTEM-MSG                                     21090000
              ELSE                                                      21100000
                 MOVE -1 TO MSUBML                                      21110000
                 MOVE 'UPDATE RETAINED / SUBMIT PENDING' TO SYSTEM-MSG  21120000
              END-IF                                                    21130000
              PERFORM  ERROR-RTN                                        21140000
           ELSE                                                         21150000
           IF ACAT02IO-UPDT-TMSTP-NG                                    21160000
           OR ACAT02IO-NSCC-PEND-NG                                     21170000
           OR ACAT02IO-NOT-FOUND                                        21180000
              PERFORM UPDATE-FAIL-RTN                                   21190000
           ELSE                                                         21200000
              MOVE LOW-VALUE TO ACAT02MO                                21210000
              MOVE 'REPL '           TO WS-DB2-PROBLEM-FUNCTION         21220000
              MOVE ACAT02IO-SQLCAID  TO WS-DB2-PROBLEM-TABLE            21230000
              MOVE ACAT02IO-SQLCODE  TO WS-DB2-PROBLEM-ID               21240000
              MOVE WS-DB2-PROBLEM-MSG TO SYSTEM-MSG                     21250000
              PERFORM DB2-ERROR-RTN.                                    21260000
           MOVE ATT-UNPROT TO MDELA.                                    21270000
                                                                        21280000
       UPDATE-FAIL-RTN.                                                 21290000
           IF ACAT02IO-NOT-FOUND                                        21300000
              MOVE                                                      21310000
             'UPDATE REJECTED; THIS TIF WAS DELETED BY SOMEONE ELSE'    21320000
                TO SYSTEM-MSG                                           21330000
              MOVE ' ' TO TWA-ACTION                                    21340000
              MOVE SPACES TO TWA-MAP-TABLE                              21350000
              MOVE LOW-VALUES TO ACAT02MO                               21360000
              MOVE -1 TO MBRL                                           21370000
              MOVE ACAT02IO-DLVR-NBR   TO TWA-MCBRKR                    21380000
              MOVE ACAT02IO-DLVR-ACCT  TO TWA-MCACCT                    21390000
              MOVE ACAT02IO-RCV-ACCT   TO TWA-MBR                       21400000
              MOVE ACAT02IO-RCV-ACCT(4 : 5)   TO TWA-MAC                21410000
              SET FIRST-TIME TO TRUE                                    21420000
              PERFORM ERROR-RTN                                         21430000
           END-IF.                                                      21440000
                                                                        21450000
           IF ACAT02IO-UPDT-TMSTP-NG                                    21460000
              MOVE                                                      21470000
             'UPDATE REJECTED; OTHER CHANGE MADE PRIOR TO THIS REQUEST; 21480000
      -      'SCREEN REFRESHED'                                         21490000
                TO SYSTEM-MSG                                           21500000
           ELSE                                                         21510000
           IF ACAT02IO-NSCC-PEND-NG                                     21520000
              MOVE                                                      21530000
             'UPDATE REJECTED; THIS TIF ALREADY SENT TO NSCC; SCREEN REF21540000
      -      'RESHED'                                                   21550000
                TO SYSTEM-MSG                                           21560000
           ELSE                                                         21570000
              MOVE  'UPDATE REJECTED; SCREEN REFRESHED'  TO SYSTEM-MSG  21580000
           END-IF.                                                      21590000
                                                                        21600000
   ***** REREAD RECORD, MOVE TO TWA AND SCREEN, DISPLAY:                21610000
           PERFORM READ-ACAT-RTN.                                       21620000
           PERFORM MOVE-ACAT02IO-TO-TWA-RTN.                            21630000
           PERFORM REFORMAT-SCREEN-DETAIL.                              21640000
           PERFORM ERROR-RTN.                                           21650000
                                                                        21660000
           SKIP3                                                        21670000
       READ-ACAT-RTN.                                                   21680000
           MOVE SPACES TO ACAT02IO-CALL-AREA.                           21690000
           SET ACAT02IO-IT-READ TO TRUE.                                21700000
           MOVE TWA-CLIENT-NO-X   TO ACAT02IO-CLIENT-NBR.               21710000
           MOVE TWA-MCBRKR        TO ACAT02IO-DLVR-NBR.                 21720000
           MOVE TWA-MCACCT        TO ACAT02IO-DLVR-ACCT.                21730000
           MOVE ACAT-ADP-BROKER   TO ACAT02IO-RCV-NBR.                  21740000
           MOVE TWA-MBR           TO ACAT02IO-RCV-ACCT.                 21750000
           MOVE TWA-MAC           TO ACAT02IO-RCV-ACCT(4 : 5).          21760000
           PERFORM LINK-TO-ACAT02IO-RTN.                                21770000
           IF ACAT02IO-DB2-ERROR                                        21780000
              MOVE 'READ'            TO WS-DB2-PROBLEM-FUNCTION         21790000
              MOVE ACAT02IO-SQLCAID  TO WS-DB2-PROBLEM-TABLE            21800000
              MOVE ACAT02IO-SQLCODE  TO WS-DB2-PROBLEM-ID               21810000
              MOVE WS-DB2-PROBLEM-MSG TO SYSTEM-MSG                     21820000
              PERFORM DB2-ERROR-RTN.                                    21830000
                                                                        21840000
                                                                        21850000
       FORMAT-FROM-PRIOR-TIF-RTN.                                       21860000
******** ASSUME ACAT06,07 TIF IS ON ACTIVE TABLE, NOT HISTORY.          21870000
********    AND ACAT22TH  TIF IS ON HISTORY...                          21880000
           IF TWA-ACTION = '6'                                          21890000
              SET ACAT02IO-IT-GET-ACTIVE TO TRUE                        21900000
           ELSE                                                         21910000
              SET ACAT02IO-IT-GET-HISTORY TO TRUE.                      21920000
           MOVE TWA-CLIENT-NO-X   TO ACAT02IO-CLIENT-NBR.               21930000
           MOVE ACAT-CONTROL-NBR  TO ACAT02IO-CONTROL-NBR.              21940000
           PERFORM LINK-TO-ACAT02IO-RTN.                                21950000
LRM        IF (ACAT02IO-ACTIVE-FOUND                                    21960000
           AND TWA-ACTION = '6')                                        21970000
LRM        OR (ACAT02IO-HISTORY-FOUND                                   21980000
           AND TWA-ACTION = '7')                                        21990000
              PERFORM MOVE-ACAT02IO-TO-TWA-RTN                          22000000
              PERFORM REFORMAT-SCREEN-DETAIL                            22010000
              MOVE 'A' TO TWA-ACTION                                    22020000
LRM009***SEE IF THIS TRANSFER EXISTS ON INITIAIL TABLE                  22030000
LRM009        PERFORM READ-ACAT-RTN                                     22040000
LRM009        IF ACAT02IO-FOUND                                         22050000
LRM009        OR ACAT02IO-PTR-FOUND                                     22060000
LRM009           SET INPUT-ERROR TO TRUE                                22070000
LRM009           PERFORM MOVE-ACAT02IO-TO-TWA-RTN                       22080000
LRM009           PERFORM REFORMAT-SCREEN-DETAIL                         22090000
LRM009           MOVE ATT-UNPROT-BRT TO MCBRKRA                         22100000
LRM009                                  MCACCTA                         22110000
LRM009           MOVE -1 TO MCBRKRL                                     22111000
LRM009           IF ACAT02IO-PTR-FOUND                                  22112000
LRM009           MOVE                                                   22113000
LRM009            'INITIAL PTR EXISTS FOR THIS CONTRA BROKER / ACCOUNT' 22114000
LRM009                          TO SYSTEM-MSG                           22115000
LRM009           ELSE                                                   22116000
LRM009           MOVE                                                   22117000
LRM009            'INITIAL XFER EXISTS FOR THIS CONTRA BROKER / ACCOUNT'22118000
LRM009                          TO SYSTEM-MSG                           22119000
LRM009           END-IF                                                 22120000
LRM009        END-IF                                                    22121000
           ELSE                                                         22122000
           IF ACAT02IO-FUL-HISTORY                                      22123000
              SET INPUT-ERROR TO TRUE                                   22124000
              MOVE -1             TO MACATL                             22125000
              MOVE ATT-UNPROT-BRT TO MACATA                             22126000
              MOVE 'TIF NOT ALLOWED; TIF HISTORY FOUND WITH FUL DLVRY'  22127000
                   TO WS-DUPE-MSG-TEXT                                  22128000
              MOVE ACAT02IO-DUPE-CONTROL-NBR TO WS-DUPE-CONTROL-NBR     22129000
              MOVE WS-DUPE-MSG TO SYSTEM-MSG                            22130000
              PERFORM ERROR-RTN.                                        22140000
                                                                        22150000
           IF ACAT02IO-OTHER-ACTIVE                                     22160000
              SET INPUT-ERROR TO TRUE                                   22170000
              MOVE -1             TO MACATL                             22180000
              MOVE ATT-UNPROT-BRT TO MACATA                             22190000
              MOVE 'TIF NOT ALLOWED - OTHER ACTIVE TRANSFER FOUND'      22200000
                   TO WS-DUPE-MSG-TEXT                                  22210000
              MOVE ACAT02IO-DUPE-CONTROL-NBR TO WS-DUPE-CONTROL-NBR     22220000
              MOVE WS-DUPE-MSG TO SYSTEM-MSG                            22230000
              PERFORM ERROR-RTN.                                        22240000
                                                                        22250000
           SKIP3                                                        22260000
       DELETE-ACAT-IT-RECORD.                                           22270000
           SET ACAT02IO-IT-DEL TO TRUE.                                 22280000
           MOVE TWA-CLIENT-NO-X   TO ACAT02IO-CLIENT-NBR.               22290000
           MOVE TWA-MCBRKR        TO ACAT02IO-DLVR-NBR.                 22300000
           MOVE TWA-MCACCT        TO ACAT02IO-DLVR-ACCT.                22310000
           MOVE ACAT-ADP-BROKER   TO ACAT02IO-RCV-NBR.                  22320000
           MOVE TWA-MBR           TO ACAT02IO-RCV-ACCT.                 22330000
           MOVE TWA-MAC           TO ACAT02IO-RCV-ACCT(4 : 5).          22340000
           MOVE TWA-ORIG-DLVR-NBR  TO ACAT02IO-ORIG-DLVR-NBR.           22350000
           MOVE TWA-ORIG-DLVR-ACCT TO ACAT02IO-ORIG-DLVR-ACCT.          22360000
           PERFORM LINK-TO-ACAT02IO-RTN.                                22370000
                                                                        22380000
           IF ACAT02IO-DB2-ERROR                                        22390000
              MOVE 'DELETE'          TO WS-DB2-PROBLEM-FUNCTION         22400000
              MOVE ACAT02IO-SQLCAID  TO WS-DB2-PROBLEM-TABLE            22410000
              MOVE ACAT02IO-SQLCODE  TO WS-DB2-PROBLEM-ID               22420000
              MOVE WS-DB2-PROBLEM-MSG TO SYSTEM-MSG                     22430000
              PERFORM DB2-ERROR-RTN.                                    22440000
           MOVE SPACES TO TWA-MAP-TABLE.                                22450000
           MOVE 'A' TO TWA-ACTION                                       22460000
           PERFORM REFORMAT-SCREEN-DETAIL.                              22470000
           PERFORM PROCESS-MAP-ITEMS                                    22480000
                  THRU PROCESS-MAP-ITEMS-EXIT.                          22490000
           MOVE 'TIF DELETED' TO SYSTEM-MSG.                            22500000
           PERFORM SEND-MAP-ERASE.                                      22510000
           PERFORM WRITE-TSQ-RTN.                                       22520000
           PERFORM RETURN-TO-CICS.                                      22530000
120800                                                                  22540000
       EJECT                                                            22550000
120900 NOT-OPEN.                                                        22560000
           IF FIRST-TIME                                                22570000
              MOVE 'ACAT02IT' TO ACAT-PROGRAM-NAME                      22580000
              MOVE LOW-VALUES TO ACAT02MO.                              22590000
                                                                        22600000
           PERFORM INIT-MAP-RTN.                                        22610000
           MOVE 'BIPRINT FILE IS NOT AVAILABLE.' TO TRLMSGO.            22620000
           MOVE  ATT-ASKIP-BRT                TO TRLMSGA.               22630000
           MOVE -1 TO MNEXTL.                                           22640000
127200     PERFORM WRITE-TSQ-RTN.                                       22650000
121200     PERFORM SEND-MAP-ERASE.                                      22660000
121300     PERFORM RETURN-TO-CICS.                                      22670000
120800                                                                  22680000
120700     EJECT                                                        22690000
                                                                        22700000
       DB2-ERROR-RTN.                                                   22710000
           PERFORM ERROR-RTN.                                           22720000
121400                                                                  22730000
121700 ERROR-RTN.                                                       22740000
           MOVE TWA-CLIENT-NO-X(2 : 3)  TO MCLINBO.                     22750000
029700     MOVE WSTIME         TO  MTIMEO.                              22760000
029800     MOVE WSMMDDYY       TO  MDATEO.                              22770000
   800     MOVE SYSTEM-MSG     TO  TRLMSGO.                             22780000
121900     MOVE ATT-ASKIP-BRT  TO  TRLMSGA.                             22790000
           IF FIRST-TIME                                                22800000
              PERFORM SEND-MAP-ERASE                                    22810000
           ELSE                                                         22820000
              PERFORM SEND-MAP-DATA-ONLY.                               22830000
127200     PERFORM WRITE-TSQ-RTN.                                       22840000
122100     PERFORM RETURN-TO-CICS.                                      22850000
122200                                                                  22860000
122300     EJECT                                                        22870000
122400                                                                  22880000
123600 READ-TSQ-RTN.                                                    22890000
123700     EXEC CICS READQ TS QUEUE(TSQ-NAME)                           22900000
123800                        INTO(TWA-AREA)                            22910000
123900                        LENGTH(LENGTH OF TWA-AREA)                22920000
                              ITEM(ITEM-NUM)                            22930000
124000     END-EXEC.                                                    22940000
125100     IF (EIBRESP NOT = +0)                                        22950000
           AND (NOT FIRST-TIME)                                         22960000
              MOVE LOW-VALUE TO ACAT02MO                                22970000
125200        MOVE 'ACAT02 READ TSQ ERROR.'                             22980000
125300          TO SYSTEM-MSG                                           22990000
125400        PERFORM ERROR-RTN                                         23000000
125500     END-IF.                                                      23010000
124100                                                                  23020000
124200 DELETE-TSQ-RTN.                                                  23030000
124300     EXEC CICS DELETEQ TS QUEUE(TSQ-NAME)                         23040000
124400     END-EXEC.                                                    23050000
124500                                                                  23060000
124600 WRITE-TSQ-RTN.                                                   23070000
124700     EXEC CICS WRITEQ TS QUEUE(TSQ-NAME)                          23080000
124800                         FROM(TWA-AREA)                           23090000
124900                         LENGTH(LENGTH OF TWA-AREA)               23100000
                               ITEM(ITEM-NUM)                           23110000
125000     END-EXEC.                                                    23120000
125100     IF EIBRESP NOT = +0                                          23130000
              MOVE LOW-VALUE TO ACAT02MO                                23140000
125200        MOVE 'ACAT02 WRITE TSQ ERROR.'                            23150000
125300          TO SYSTEM-MSG                                           23160000
125500     END-IF.                                                      23170000
125600                                                                  23180000
136400     EJECT                                                        23190000
125800                                                                  23200000
125900 RETURN-CONTROL-RTN.                                              23210000
126000     EXEC CICS SEND CONTROL                                       23220000
126100                      ERASE                                       23230000
126200                     FREEKB                                       23240000
126300     END-EXEC.                                                    23250000
126400     EXEC CICS XCTL PROGRAM ('RATT01')                            23260000
126500     END-EXEC.                                                    23270000
126600     EXEC CICS RETURN                                             23280000
126700     END-EXEC.                                                    23290000
126800                                                                  23300000
126900     EJECT                                                        23310000
127000                                                                  23320000
127100 RETURN-TO-CICS.                                                  23330000
           MOVE TWA-CALLING-PROG TO ACAT-CALLING-PROG-NAME.             23340000
127300     EXEC CICS RETURN                                             23350000
127400               TRANSID('ACAX')                                    23360000
127500               COMMAREA(ACATCOMM-COMMAREA)                        23370000
127600     END-EXEC.                                                    23380000
127700                                                                  23390000
127800 HANG-CICS.                                                       23400000
127900     GOBACK.                                                      23410000
127000                                                                  23420000
