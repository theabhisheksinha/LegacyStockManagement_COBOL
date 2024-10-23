000001* PDX    - ACAT05RN C0360050 12/23/14 10:39:36 TBLAMUR            00001009
000001* LRM026* SSR# 99388 BLOCK ACCEL ON RCL DAY-3                     00001101
000001* PDX    - ACAT05RN C0318727 01/11/12 13:24:32 TBLAMUR            00001200
000001* PDX    - ACAT05RN C0307245 03/14/11 16:05:32 TBLAMUR            00001300
000001* LRM025* SSR# 74450 ALLOW FULL REQUEST OF SHORT OPTION.          00001400
000001* PDX    - ACAT05RN C0302589 10/22/10 10:29:00 TBLAMUR            00001500
000001* LRM024 SSR# 70666 PASS AUDIT INFO TO ACAT04DA ON ACCEPT.        00001600
000001* PDX    - ACAT05RN C0290669 01/12/10 14:47:07 TBLAMUR            00001700
000001* LRM023 - SSR# 65698 DSPLY FULL/FULL- IN CASH BAL ON PTR.        00001800
000001* PDX    - ACAT05RN C0287777 11/03/09 10:42:19 TBLAMUR            00001900
000001* LRM022 - SSR# 65670 SUB PENNY PRICE MSG                         00002000
000001* PDX    - ACAT05RN C0284083 07/28/09 14:49:20 TBLAMUR            00002100
000001* LRM021 SSR# 64156 LOOK AT TABL FOR EXTENDED CYCLE CUTOFF TIMES. 00002200
000001* PDX    - ACAT05RN C0277094 04/06/09 10:57:43 TBDOJUN            00003000
DJ0003* DJ0003 - SSR# 61684 AUCTION RATE SECURITY MSG                   00020000
000001* PDX    - ACAT05RN C0275533 03/05/09 13:30:55 TBLAMUR            00030000
LRM020* SSR 57665 CONSISTENCY AMONG SCREENS, ALLOW Y INPUT TO           00040000
LRM020*  REJECT, ACCEPT OR ACCELERATE.                                  00050000
000001* PDX    - ACAT05RN C0272581 11/03/08 16:19:50 TBLAMUR            00060000
LRM019* SSR# 61164 NEW TRANSFER TYPE PTF, NO RJECTS ALLOWED.            00070000
000001* PDX    - ACAT05RN C0266650 07/09/08 15:44:55 TBLAMUR            00080000
LRM018* SSR# 47236 ADD PF2 FUNCTION TO ACAT90 TO INPUT REALTIME SPAD.   00090000
000001* PDX    - ACAT05RN C0263391 05/09/08 09:41:42 TBLAMUR            00100000
LRM017* SSR# 55766 ASCENDIS INTERFACE. BROWSE ONLY FOR PTR, PTD         00110000
LRM017*   UNLESS SCON OVERRIDE.                                         00120000
000001* PDX    - ACAT05RN C0250441 06/25/07 09:38:43 TBLAMUR            00130000
LRM016* SSR 53075 SPIN-OFF CHANGES                                      00140000
000001* PDX    - ACAT05RN C0240732 11/09/06 08:41:41 TBLAMUR            00150000
LRM015* SSR 49202 SELECT GIFT INDICATOR TO DISPLAY ON EXCEPTION POPUP   00160000
000001* PDX    - ACAT05RN C0238544 08/28/06 11:43:47 TBLAMUR            00170000
LRM014* SSR 45145 CREATE WARNING MSG WHEN USERS ATTEMPT TO REJECT       00180000
LRM014*   AFTER NSCC CUT OFF TIME.  NON STDS ONLY HAVE TODAY TO REJECT, 00190000
LRM014*   EXCEPT RCL HAS 3 DAYS (LAST DAY MARKED ON VTRNFR BY BATCH).   00200000
000001* PDX    - ACAT05RN C0231507 07/07/06 15:36:29 TBEDTAK            00210000
ET0010* JUN'06 - BUG - INCORRECT REASON CODE IS DISPLAYED IN ASSET MAP. 00220000
ET0011* JUN'06 - 45744 BLOCK ENTRY BASED ON ACCOUNT FREEZE.             00230000
ET0012* JUN'06 - 40661 RETAIN USER ID OF INITIATOR.                     00240000
ET0013* JUN'06 - BUG - USER UNABLE TO MANUALLY REJECT WHEN NSCC-PEND-CD 00250000
ET0013* JUN'06   OF INITIAL TRANSFER = 'H'. REFER TO ET0007 CHANGE.     00260000
000001* PDX    - ACAT05RN C0225230 10/21/05 11:34:33 TBEDTAK            00270000
000001* PDX    - ACAT05RN C0222099 07/20/05 11:08:38 TBEDTAK            00280000
000001* PDX    - ACAT05RN C0216719 04/05/05 15:00:58 TBEDTAK            00290000
000001* PDX    - ACAT05RN C0215192 02/14/05 08:18:03 TBLAMUR            00300000
000001* PDX    - ACAT05RN C0214488 12/08/04 11:23:26 TBLAMUR            00310000
000001* PDX    - ACAT05RN C0205792 06/08/04 13:27:24 TBLAMUR            00320000
000001* PDX    - ACAT05RN C0181954 12/12/02 15:17:06 TBEDTAK            00330000
000001* PDX    - ACAT05RN C0179784 10/24/02 14:18:02 TBEDTAK            00340000
000001* PDX    - ACAT05RN C0160324 06/25/01 09:30:59 TBLAMUR            00350000
000001* PDX    - ACAT05RN C0155452 03/12/01 08:23:11 TBDOJUN            00360000
000001* PDX    - ACAT05RN C0126743 06/11/99 09:33:30 TBEDTAK            00370000
000001* PDX    - ACAT05RN C0123136 04/08/99 15:17:16 TBEDTAK            00380000
000001* PDX    - ACAT05RN C0120336 02/05/99 22:40:13 TBEDTAK            00390000
000001* PDX    - ACAT05RN C0119290 12/17/98 08:52:08 TBTIKUO            00400000
000001* PDX    - ACAT05RN C0117770 11/19/98 12:16:48 TBTIKUO            00410000
000001* PDX    - ACAT05RN C0112193 11/13/98 16:20:43 TBLAMUR            00420000
       IDENTIFICATION DIVISION.                                         00430000
       PROGRAM-ID.    ACAT05RN.                                         00440000
       AUTHOR.  T. KUO.                                                 00450000
      *REMARKS.                                                         00460000
      **-------------------------------------------------------------** 00470000
      *           ACATS  REVIEW NON-STATNDARD TRANSFERS               * 00480000
      **-------------------------------------------------------------** 00490000
ET0001*12/05/02 - ADD ACCELERATION FIELD TO A SCREEN                    00500000
ET0001*         - FIX BUGS                                              00510000
ET0002*06/01/04 - ALLOW PTR TO BE REJECTED (REGULATORY CHANGE)          00520000
LRM003*12/08/04 - SSR 0039844 ALLOW/FIX PF9 LINK                        00530000
LRM004*02/14/05 - DO NOT ALLOW PF9 ABOVE 310 STATUS. BLOCK 500,510 ETC. 00540000
ET0005*APRIL 05 - DISPLAY COMMENT MSG INDICATOR IF COMMENT EXISTS       00550000
ET0006*JUL'05 - SSR 39848 ADD CAGE TAG FD AND ALLOW USER TO UPDATE IT.  00560000
ET0007*JUL'05 - SSR 43192 MOVE SPACE TO NSCC-PEND-CD WHEN UPDATING      00570000
      *JUL'05   REJECT RECORD.                                          00580000
ET0008*NOV'05 - SSR 39800 IDENTIFY DUPE MFC/FRV AND DISPLAY MSG IF FOUND00590000
LRM009*NOV'05 - SSR 43083 ADD PTR FULL ASSET REQUEST MESSAGE            00600000
ET0009*NOV'05 - NON SSR   UPDATE NEWLY ADDED DB2 COL CICS_SGNON_ID      00610000
                                                                        00620000
       ENVIRONMENT DIVISION.                                            00630000
       DATA DIVISION.                                                   00640000
       WORKING-STORAGE SECTION.                                         00650000
       COPY PDXIDCOB.                                                   00660000
       77  TWA-SIZE                   PIC S9(4)        COMP.            00670000
       77  WS-CICS-RESP               PIC S9(8)        COMP   VALUE +0. 00680000
       77  WS-AMT-S                   PIC S9(15)V9(2)  COMP-3 VALUE +0. 00690000
       77  WS-BAL01-DEC2              PIC S9(15)V9(2)  COMP-3 VALUE +0. 00700000
       77  WS-BAL02-DEC2              PIC S9(15)V9(2)  COMP-3 VALUE +0. 00710000
       77  WS-BAL05-DEC2              PIC S9(15)V9(2)  COMP-3 VALUE +0. 00720000
       77  WS-ASSET-DEC2              PIC S9(15)V9(2)  COMP-3 VALUE +0. 00730000
       77  WS-QTY-DEC4                PIC S9(13)V9(4)  COMP-3.          00740000
ET0011 77  WS-ACFREEZ                 PIC X(08)        VALUE 'ACATRST '.00750000
      *77  WS-ASSET-NUM2              PIC Z(15)V9(2)-  VALUE  ZERO.     00760000
      *77  WS-ASSET-NUM5              PIC Z(13)V9(4)-  VALUE  ZERO.     00770000
      *******************************************************           00780000
      *      TSQ WORK AREA                                              00790000
      *******************************************************           00800000
       01  TSQ-WORK-AREA.                                               00810000
           05  TSQ-NAME.                                                00820000
               09 TERM-ID             PIC X(04).                        00830000
               09 TRAN-ID             PIC X(04).                        00840000
           05  ITEM-NUM               PIC S9(04) COMP      VALUE +1.    00850000
      /                                                                 00860000
      *******************************************************           00870000
      *      GET DATE TIME LAYOUT                                       00880000
      *******************************************************           00890000
       01  WSWORKAREA.                                                  00900000
           05  WSABSTIME           PIC S9(08) COMP.                     00910000
           05  WSMMDDYY.                                                00920000
               09 WS-CUR-MM        PIC XX.                              00930000
               09  FILLER          PIC X.                               00940000
               09 WS-CUR-DD        PIC XX.                              00950000
               09  FILLER          PIC X.                               00960000
               09 WS-CUR-YY        PIC XX.                              00970000
           05  WSDATESEP           PIC X(01) VALUE '/'.                 00980000
           05  WSTIME.                                                  00990000
               09  WS-TIME-HH      PIC XX.                              01000000
               09  FILLER          PIC X.                               01010000
               09  WS-TIME-MM      PIC XX.                              01020000
               09  FILLER          PIC X.                               01030000
               09  WS-TIME-SS      PIC XX.                              01040000
LRM014     05  WS-TIME-HHMM        PIC X(04).                           01050000
           05  WSTIMESEP           PIC X(01) VALUE ':'.                 01060000
LRM021     05  WS-CYCLE5-HHMM      PIC X(04) VALUE '1530'.              01061000
                                                                        01070000
      *******************************************************           01080000
      *      B1 WORK AREA                                               01090000
      *******************************************************           01100000
       01  B1-RECORD.                                                   01110000
           05  B1-REC-ID.                                               01120000
               09  B1-CLIENT-NO          PIC 9(03) COMP-3.              01130000
               09  B1-CARD-NO            PIC 9(07) COMP-3.              01140000
               09  B1-CLIENT             PIC 9(03) COMP-3.              01150000
               09  B1-SEQUENCE           PIC 9(05) COMP-3 VALUE 1.      01160000
           05  B1-REC-TYP-3              PIC X(01) VALUE '3'.           01170000
           05  B1-COUNTRY                PIC X(03).                     01180000
           05  FILLER REDEFINES B1-COUNTRY.                             01190000
               09  B1-PROCESS-POST-DAYS  PIC X(02).                     01200000
               09  FILLER                PIC X(01).                     01210000
           05  FILLER                    PIC X(07).                     01220000
                                                                        01230000
       EJECT                                                            01240000
                                                                        01250000
      *******************************************************           01260000
      *      ACAT05RN WORK AREA                                         01270000
      *******************************************************           01280000
       01  ACAT05RN-WORK-AREA.                                          01290000
           05  CALLED-PROGRAM-NAME        PIC X(08).                    01300000
           05  WORK-QTY-X                 PIC X(20).                    01310000
           05  FILLER REDEFINES WORK-QTY-X.                             01320000
               09 WORK-QTY                PIC 9(12)V9(05).              01330000
               09 FILLER                  PIC X(03).                    01340000
           05  WORK-DATE-X.                                             01350000
               09 WORK-DATE-X-MM          PIC X(02).                    01360000
               09 FILLER                  PIC X(01).                    01370000
               09 WORK-DATE-X-YY          PIC X(02).                    01380000
           05  WORK-DATE.                                               01390000
               09 WORK-DATE-MM            PIC X(02).                    01400000
               09 WORK-DATE-YY            PIC X(02).                    01410000
           05  TWA-CLIENT-NO-X.                                         01420000
               09 TWA-CLIENT-NO-9         PIC 9(04).                    01430000
           05  WS-DATE-YYYYMMDD           PIC 9(08).                    01440000
           05  WS-DATE-FIELDS REDEFINES WS-DATE-YYYYMMDD.               01450000
               09  WS-DATE-CC             PIC X(02).                    01460000
               09  WS-DATE-YY             PIC X(02).                    01470000
               09  WS-DATE-MM             PIC X(02).                    01480000
               09  WS-DATE-DD             PIC X(02).                    01490000
           05  WS-DATE-EDIT.                                            01500000
               09  WS-DATE-MM             PIC X(02).                    01510000
               09  FILLER                 PIC X(01)  VALUE '/'.         01520000
               09  WS-DATE-DD             PIC X(02).                    01530000
               09  FILLER                 PIC X(01)  VALUE '/'.         01540000
               09  WS-DATE-YY             PIC X(02).                    01550000
           05  WS-FORMAT-DATE.                                          01560000
               09  WS-MM                  PIC X(02).                    01570000
               09  FILLER                 PIC X(01)  VALUE '/'.         01580000
               09  WS-DD                  PIC X(02).                    01590000
               09  FILLER                 PIC X(01)  VALUE '/'.         01600000
               09  WS-YY                  PIC X(02).                    01610000
           05  DATE-FOUND-FLAG            PIC X(01) VALUE 'N'.          01620000
               88  DATE-FOUND             VALUE 'Y'.                    01630000
           05  WS-REASON-CODE-POPUP-SW    PIC X(01).                    01640000
               88  REASON-CODE-POPUP-YES  VALUE 'Y'.                    01650000
           05  WS-SEND-CMNT-SW            PIC X(01).                    01660000
               88  SEND-ACCT-CMNT         VALUE 'T'.                    01670000
               88  SEND-SECR-CMNT         VALUE 'A'.                    01680000
           05  WK-BROWSE-FORWARD-FLAG     PIC X(01) VALUE 'Y'.          01690000
               88  WK-BROWSE-FORWARD      VALUE 'Y'.                    01700000
               88  WK-BROWSE-BACKWARD     VALUE 'N'.                    01710000
           05  FIRST-TIME-FLAG            PIC X(01)  VALUE 'N'.         01720000
               88  FIRST-TIME             VALUE  'Y'.                   01730000
           05  WS-UPDATE-SW               PIC X(01) VALUE SPACE.        01740000
               88  WS-UPDATE-OK           VALUE 'Y'.                    01750000
           05  WS-UPDATE-IND              PIC X(01)  VALUE 'N'.         01760000
           05  ERASE-KEY-VALUE            PIC S9(04) COMP VALUE +128.   01770000
           05  FILLER REDEFINES ERASE-KEY-VALUE.                        01780000
               09  FILLER                 PIC X(01).                    01790000
               09  ERASE-KEY              PIC X(01).                    01800000
           05  WS-SSN-ONE.                                              01810000
               09  WS-SSN-ONE-1           PIC 9(03).                    01820000
               09  WS-SSN-ONE-2           PIC 9(02).                    01830000
               09  WS-SSN-ONE-3           PIC 9(04).                    01840000
           05  WS-SSN-ONE-REFORM.                                       01850000
               09  WS-SSN-ONE-1R          PIC 9(03).                    01860000
               09  FILLER                 PIC X(01)  VALUE '-'.         01870000
               09  WS-SSN-ONE-2R          PIC 9(02).                    01880000
               09  FILLER                 PIC X(01)  VALUE '-'.         01890000
               09  WS-SSN-ONE-3R          PIC 9(04).                    01900000
           05  WS-SSN-TWO.                                              01910000
               09  WS-SSN-TWO-1           PIC 9(03).                    01920000
               09  WS-SSN-TWO-2           PIC 9(02).                    01930000
               09  WS-SSN-TWO-3           PIC 9(04).                    01940000
           05  WS-SSN-TWO-REFORM.                                       01950000
               09  WS-SSN-TWO-1R          PIC 9(03).                    01960000
               09  FILLER                 PIC X(01)  VALUE '-'.         01970000
               09  WS-SSN-TWO-2R          PIC 9(02).                    01980000
               09  FILLER                 PIC X(01)  VALUE '-'.         01990000
               09  WS-SSN-TWO-3R          PIC 9(04).                    02000000
           05  DATA-ONLY-FLAG             PIC X(01)  VALUE 'N'.         02010000
               88  DATA-ONLY              VALUE  'Y'.                   02020000
           05  WK-CURSOR                  PIC S9(04) COMP.              02030000
           05  WS-NBR-OF-DAYS.                                          02040000
               10  FILLER                 PIC X(01) VALUE '-'.          02050000
               10  WS-DAYS                PIC 9(02).                    02060000
            05  WS-STATUS-TABLE.                                        02070000
                10  MSG-100.                                            02080000
                    15  MSG-100-X          PIC X(11)  VALUE             02090000
                       '100/REQUEST'.                                   02100000
                    15  FILLER             PIC X(03)  VALUE ' - '.      02110000
                    15  MSG-100-N          PIC X(02).                   02120000
                10  MSG-110.                                            02130000
                    15 MSG-110-X           PIC X(18)  VALUE             02140000
                       '110/REQUEST ADJUST'.                            02150000
                    15  FILLER             PIC X(03)  VALUE ' - '.      02160000
                    15  MSG-110-N          PIC X(02).                   02170000
                10  MSG-120.                                            02180000
                    15  MSG-120-X          PIC X(20)  VALUE             02190000
                        '120/REQUEST ADJ PAST'.                         02200000
                    15  FILLER             PIC X(03)  VALUE ' - '.      02210000
                    15  MSG-120-N          PIC X(02).                   02220000
                10  MSG-130.                                            02230000
                    15 MSG-130-X           PIC X(16)  VALUE             02240000
                        '130/REQUEST PAST'.                             02250000
                    15  FILLER             PIC X(03)  VALUE ' - '.      02260000
                    15  MSG-130-N          PIC X(02).                   02270000
                10  MSG-140.                                            02280000
                    15 MSG-140-X           PIC X(20)  VALUE             02290000
                        '140/REQUEST REJECTED'.                         02300000
                    15  FILLER             PIC X(03)  VALUE ' - '.      02310000
                    15  MSG-140-N          PIC X(02).                   02320000
                10  MSG-200.                                            02330000
                    15 MSG-200-X           PIC X(10)  VALUE             02340000
                       '200/REVIEW'.                                    02350000
                    15  FILLER             PIC X(03)  VALUE ' - '.      02360000
                    15  MSG-200-N          PIC X(02).                   02370000
                10  MSG-210.                                            02380000
                    15 MSG-210-X           PIC X(17)  VALUE             02390000
                       '210/REVIEW ADJUST'.                             02400000
                    15  FILLER             PIC X(03)  VALUE ' - '.      02410000
                    15  MSG-210-N          PIC X(02).                   02420000
                10  MSG-220.                                            02430000
                    15 MSG-220-X           PIC X(16)  VALUE             02440000
                       '220/REVIEW ERROR'.                              02450000
                    15  FILLER             PIC X(03)  VALUE ' - '.      02460000
                    15  MSG-220-N          PIC X(02).                   02470000
                10  MSG-230.                                            02480000
                    15 MSG-230-X           PIC X(22)  VALUE             02490000
                       '230/REVIEW ACCELERATED'.                        02500000
                    15  FILLER             PIC X(03)  VALUE ' - '.      02510000
                    15  MSG-230-N          PIC X(02).                   02520000
                10  MSG-300.                                            02530000
                    15 MSG-300-X           PIC X(15)  VALUE             02540000
                       '300/SETTLE PREP'.                               02550000
                    15  FILLER             PIC X(03)  VALUE ' - '.      02560000
                    15  MSG-300-N          PIC X(02).                   02570000
                10  MSG-310.                                            02580000
                    15 MSG-310-X           PIC X(16)  VALUE             02590000
                       '310/SETTLE CLOSE'.                              02600000
                    15  FILLER             PIC X(03)  VALUE ' - '.      02610000
                    15  MSG-310-N          PIC X(02).                   02620000
                10  MSG-400.                                            02630000
                    15  MSG-400-X           PIC X(15)  VALUE            02640000
                        '400/CLOSE PURGE'.                              02650000
                    15  FILLER             PIC X(03)  VALUE ' - '.      02660000
                    15  MSG-400-N          PIC X(02).                   02670000
                10  MSG-500.                                            02680000
                    15  MSG-500-X           PIC X(12)  VALUE            02690000
                       '500/REQUEST'.                                   02700000
                    15  FILLER             PIC X(03)  VALUE ' - '.      02710000
                    15  MSG-500-N          PIC X(02).                   02720000
                10  MSG-510.                                            02730000
                    15  MSG-510-X           PIC X(23)  VALUE            02740000
                       '510/MEMO PURGE PART TFR'.                       02750000
                    15  FILLER             PIC X(03)  VALUE ' - '.      02760000
                    15  MSG-510-N          PIC X(02).                   02770000
           05  SYSTEM-MSG                 PIC X(79) VALUE SPACES.       02780000
           05  ABEND-LINE.                                              02790000
               09  ABEND-MSG              PIC X(30).                    02800000
               09  FILLER                 PIC X(11) VALUE ' EIBRESP ='. 02810000
               09  ABEND-EIBRESP          PIC 99.                       02820000
           05  UNAUTH-MESSAGE             PIC X(79)                     02830000
               VALUE 'UNAUTHORIZED USER.'.                              02840000
           05  SEC-MESSAGE                PIC X(79)                     02850000
               VALUE 'SIGN ON SECURITY NOT AVAILABLE, TRY AGAIN.'.      02860000
           05  ERROR-PROG-MSG.                                          02870000
               09  ERROR-PROG-NAME        PIC X(08).                    02880000
               09  FILLER                 PIC X(71)                     02890000
                   VALUE ' PROGRAM NOT AVAILIABLE.'.                    02900000
           05 WS-DB2-ERROR-MSG.                                         02910000
               10 FILLER                 PIC X(36) VALUE                02920000
               'ACAT05RN - DB2 ERROR '.                                 02930000
               10 WS-DB2-ERROR-FUNCTION  PIC X(06) VALUE SPACES.        02940000
               10 WS-DB2-ERROR-TABLE     PIC X(09) VALUE SPACES.        02950000
               10 WS-DB2-ERROR-ID        PIC -999  VALUE SPACES.        02960000
LRM016         10 FILLER                 PIC X(15) VALUE                02970000
LRM016            ' CALL HELP DESK'.                                    02980000
ET0011     05  WS-FREEZ-FOUND-SW          PIC X(01).                    02990000
ET0011         88  WS-FREEZ-FOUND                   VALUE 'Y'.          03000000
ET0011         88  WS-FREEZ-NOT-FOUND               VALUE 'N'.          03010000
ET0011     05  WS-ACCT-FRZN-IND           PIC X(01).                    03020000
ET0011     05  WS-ACCT-FREEZE-MSG-LINES.                                03030000
ET0011         09 WS-FULL-FREEZE-MSG      PIC X(40) VALUE               03040000
ET0011            'ACCOUNT IS FULLY FROZEN'.                            03050000
ET0011         09 WS-CASH-FREEZE-MSG      PIC X(40) VALUE               03060000
ET0011            'ACCOUNT IS FROZEN FOR CASH'.                         03070000
ET0011         09 WS-SEC-FREEZE-MSG       PIC X(40) VALUE               03080000
ET0011            'ACCOUNT IS FROZEN FOR SECURITY'.                     03090000
ET0011     05  WS-BAL01-CR-DR-IND         PIC X(01).                    03100000
ET0011         88  WS-BAL01-CR                      VALUE 'C'.          03110000
ET0011         88  WS-BAL01-DR                      VALUE 'D'.          03120000
ET0011     05  WS-BAL02-CR-DR-IND         PIC X(01).                    03130000
ET0011         88  WS-BAL02-CR                      VALUE 'C'.          03140000
ET0011         88  WS-BAL02-DR                      VALUE 'D'.          03150000
ET0011     05  WS-BAL05-CR-DR-IND         PIC X(01).                    03160000
ET0011         88  WS-BAL05-CR                      VALUE 'C'.          03170000
ET0011         88  WS-BAL05-DR                      VALUE 'D'.          03180000
           05  ACT-COUNT                  PIC 9(03).                    03190000
           05  LINE-COUNT                 PIC 9(03).                    03200000
           05  IDX                        PIC S9(03) COMP-3.            03210000
           05  C-IDX                      PIC S9(03) COMP-3.            03220000
           05  SECLINK-TABLE-POINTER      PIC S9(8) COMP VALUE +0.      03230000
           05  SECLINK-TABLE-PTR REDEFINES                              03240000
               SECLINK-TABLE-POINTER    USAGE IS POINTER.               03250000
           05  WS-ACAT-NEXT                     PIC X(01).              03260000
           05  WS-CUSTNM.                                               03270000
               10  WS-CUSTNM-LN1                PIC X(30).              03280000
               10  WS-CUSTNM-LN2                PIC X(30).              03290000
           05  WS-ASSET-DESC.                                           03300000
               10  WS-ASSET-DESC1               PIC X(30).              03310000
               10  WS-ASSET-DESC2               PIC X(30).              03320000
               10  WS-ASSET-DESC3               PIC X(30).              03330000
            05  WS-INPUT-VALIDATE-SW            PIC X(01)  VALUE SPACE. 03340000
                88  INPUT-VALIDATED             VALUE 'Y'.              03350000
                88  NO-INPUT                    VALUE 'N'.              03360000
            05  WS-M5ACCPT                      PIC X(02)  VALUE SPACE. 03370000
                88  INPUT-ACCPT-IA              VALUE 'IA'.             03380000
                88  INPUT-ACCPT-DA              VALUE 'DA'.             03390000
ET0001      05  WS-M5ACCEL                      PIC X(01)  VALUE SPACE. 03400000
ET0001          88  INPUT-ACCEL                 VALUE 'A'.              03410000
ET0001          88  INPUT-UNACCEL               VALUE 'U'.              03420000
            05  WS-M5REJ                        PIC X(02)  VALUE SPACE. 03430000
                88  INPUT-REJ-IR                VALUE 'IR'.             03440000
                88  INPUT-REJ-DR                VALUE 'DR'.             03450000
            05  WS-M5REJC                       PIC X(02)  VALUE SPACE. 03460000
                88  INPUT-REJC-RC               VALUE 'RC'.             03470000
                88  INPUT-REJC-DC               VALUE 'DC'.             03480000
ET0001      05  WS-ACCEPT-N-XCEL-SW             PIC X(01).              03490000
ET0001          88  WS-ACCEPT-N-XCEL                       VALUE 'Y'.   03500000
ET0001          88  WS-UNACCEPT-N-UNXCEL                   VALUE 'N'.   03510000
ET0001      05  WS-REJ-ERASED-SW                PIC X(01).              03520000
ET0001          88 WS-REJ-ERASED                           VALUE 'Y'.   03530000
ET0001      05  WS-REJ-CMNT-ERASED-SW           PIC X(01).              03540000
ET0001          88 WS-REJ-CMNT-ERASED                      VALUE 'Y'.   03550000
ET0001      05  WS-ACCEPT-ERASED-SW             PIC X(01).              03560000
ET0001          88 WS-ACCEPT-ERASED                        VALUE 'Y'.   03570000
ET0001      05  WS-ACCEL-ERASED-SW              PIC X(01).              03580000
ET0001          88 WS-ACCEL-ERASED                         VALUE 'Y'.   03590000
ET0007      05  WS-REJECT-SELECTED-SW           PIC X(01).              03600000
ET0007          88 WS-REJECT-SELECTED                      VALUE 'Y'.   03610000
ET0007      05  WS-REJECT-CMNT-SELECTED-SW      PIC X(01).              03620000
ET0007          88 WS-REJECT-CMNT-SELECTED                 VALUE 'Y'.   03630000
            05  WS-CURSOR                       PIC X(02)  VALUE SPACE. 03640000
                88  CURSOR-ON-M5ACCPT           VALUE 'AP'.             03650000
ET0001          88  CURSOR-ON-M5ACCEL           VALUE 'AL'.             03660000
                88  CURSOR-ON-M5REJ             VALUE 'RJ'.             03670000
                88  CURSOR-ON-M5REJC            VALUE 'RC'.             03680000
                88  CURSOR-ON-M5NEXT            VALUE 'NX'.             03690000
                88  CURSOR-ON-MBR               VALUE 'BR'.             03700000
                88  CURSOR-ON-MAC               VALUE 'AC'.             03710000
                88  CURSOR-ON-MRR               VALUE 'RR'.             03720000
                88  CURSOR-ON-MCBRKR            VALUE 'BK'.             03730000
                88  CURSOR-ON-MTFR              VALUE 'TR'.             03740000
                88  CURSOR-ON-MSTAT             VALUE 'ST'.             03750000
            05  WS-SEND-CMNT-SW            PIC X(02).                   03760000
                88  VIEW-ACCT-CMNT         VALUE 'VT'.                  03770000
                88  VIEW-BAL1-CMNT         VALUE 'V1'.                  03780000
                88  VIEW-BAL2-CMNT         VALUE 'V2'.                  03790000
                88  VIEW-BAL5-CMNT         VALUE 'V5'.                  03800000
                88  VIEW-SECR-CMNT         VALUE 'VA'.                  03810000
                88  VIEW-REJC-CMNT         VALUE 'JC'.                  03820000
            05  WS-MSG-OUT                 PIC X(79).                   03830000
            05  WS-ERROR-SW                PIC X(01).                   03840000
                88  ERROR-YES              VALUE 'Y'.                   03850000
                88  ERROR-NO               VALUE ' '.                   03860000
            05  WS-CICS-MSG.                                            03870000
                10  WS-CICS-DISPLAY        PIC X(21) VALUE SPACES.      03880000
                10  FILLER                 PIC X     VALUE SPACES.      03890000
                10  WS-DISPLAY-CICS-DESC.                               03900000
                    15  FILLER             PIC X(20) VALUE              03910000
                          'CICS RETURN CODE = '.                        03920000
                    15  FILLER             PIC X(02) VALUE SPACES.      03930000
                    15  WS-CICS-RC         PIC X(06) VALUE SPACES.      03940000
                    15  FILLER             PIC X(05) VALUE SPACES.      03950000
                10  FILLER                 PIC X(21) VALUE              03960000
                          'CONTACT HELP DESK'.                          03970000
      *******************************************************           03980000
      *               ACATEDIT  WORK AREA                               03990000
      *******************************************************           04000000
       01  EDIT-AMT-AREA.                                               04010000
           05  WK-AMT-CODE                PIC X(01) VALUE 'D'.          04020000
           05  WK-AMT-NUM-ITEM            PIC S9(03) COMP-3 VALUE +1.   04030000
           05  WK-AMT-IN-LEN              PIC S9(03) COMP-3 VALUE +19.  04040000
           05  WK-AMT-OUT-LEN             PIC S9(03) COMP-3 VALUE +17.  04050000
           05  WK-AMT-IN                  PIC X(19) VALUE LOW-VALUE.    04060000
           05  WK-AMT-OUT                 PIC S9(15)V99.                04070000
           05  WK-AMT-DECIMAL-LEN         PIC S9(03) COMP-3 VALUE +2.   04080000
           05  WK-AMT-COMMAR              PIC X(01) VALUE 'Y'.          04090000
           05  WK-AMT-RET-CODE            PIC X(01) VALUE SPACE.        04100000
           05  FILLER                     PIC X(01) VALUE HIGH-VALUE.   04110000
                                                                        04120000
       01  WK-FORMATTED-AMT.                                            04130000
           05  WK-AMT-COMMAS-3      PIC ZZZ,ZZZ,ZZZ,ZZZ.99-.            04140000
           05  WK-AMT-COMMAS-2      PIC ZZZZZZZ,ZZZ,ZZZ.99-.            04150000
           05  WK-AMT-COMMAS-1      PIC ZZZZZZZZZZZ,ZZZ.99-.            04160000
           05  WK-AMT-COMMAS-0      PIC ZZZZZZZZZZZZZZZ.99-.            04170000
                                                                        04180000
       01  EDIT-QTY-AREA.                                               04190000
           05  WK-QTY-CODE                PIC X(01) VALUE 'D'.          04200000
           05  WK-QTY-NUM-ITEM            PIC S9(03) COMP-3 VALUE +1.   04210000
           05  WK-QTY-IN-LEN              PIC S9(03) COMP-3 VALUE +22.  04220000
           05  WK-QTY-OUT-LEN             PIC S9(03) COMP-3 VALUE +21.  04230000
           05  WK-QTY-IN                  PIC X(22) VALUE LOW-VALUE.    04240000
           05  WK-QTY-OUT.                                              04250000
               07  WK-QTY-OUT-WHOLE       PIC 9(17).                    04260000
               07  WK-QTY-OUT-FRACTION    PIC SV9(04).                  04270000
           05  WK-QTY-OUT-D1X REDEFINES WK-QTY-OUT.                     04280000
               07  FILLER                 PIC X.                        04290000
               07  WK-QTY-OUT-D1          PIC S9(16)V9.                 04300000
               07  FILLER                 PIC X(03).                    04310000
           05  WK-QTY-OUT-D2X REDEFINES WK-QTY-OUT.                     04320000
               07  FILLER                 PIC X(02).                    04330000
               07  WK-QTY-OUT-D2          PIC S9(15)V99.                04340000
               07  FILLER                 PIC X(02).                    04350000
           05  WK-QTY-OUT-D3X REDEFINES WK-QTY-OUT.                     04360000
               07  FILLER                 PIC X(03).                    04370000
               07  WK-QTY-OUT-D3          PIC S9(14)V999.               04380000
               07  FILLER                 PIC X.                        04390000
           05  WK-QTY-OUT-D4X REDEFINES WK-QTY-OUT.                     04400000
               07  FILLER                 PIC X(04).                    04410000
               07  WK-QTY-OUT-D4          PIC S9(13)V9999.              04420000
           05  WK-QTY-DECIMAL-LEN         PIC S9(03) COMP-3 VALUE +4.   04430000
           05  WK-QTY-COMMAR              PIC X(01) VALUE 'Y'.          04440000
           05  WK-QTY-RET-CODE            PIC X(01) VALUE SPACE.        04450000
           05  FILLER                     PIC X(01) VALUE HIGH-VALUE.   04460000
                                                                        04470000
        01  WS-MQTY-AREA.                                               04480000
           05  WS-MQTY-ED-D4           PIC ZZZZ,ZZZ,ZZZ,ZZZ.9999-.      04490000
           05  WS-MQTY-ED-D3 REDEFINES WS-MQTY-ED-D4                    04500000
                                       PIC ZZZZZ,ZZZ,ZZZ,ZZZ.999-.      04510000
           05  WS-MQTY-ED-D2 REDEFINES WS-MQTY-ED-D3                    04520000
                                       PIC ZZZZZZ,ZZZ,ZZZ,ZZZ.99-.      04530000
           05  WS-MQTY-ED-D1 REDEFINES WS-MQTY-ED-D2                    04540000
                                       PIC ZZZZZZZ,ZZZ,ZZZ,ZZZ.9-.      04550000
           05  WS-MQTY-ED-D0 REDEFINES WS-MQTY-ED-D1                    04560000
                                       PIC ZZZZZ,ZZZ,ZZZ,ZZZ,ZZZ-.      04570000
      *----------------------------------------------------------------*04580000
           EJECT                                                        04590000
ET0011 01  ACATRSTIO-CALL-AREA.                                         04600000
ET0011     COPY ACATRSIO.                                               04610000
ET0011     EJECT                                                        04620000
       COPY ACATSRCH.                                                   04630000
            EJECT                                                       04640000
       COPY SECLINKC.                                                   04650000
            EJECT                                                       04660000
       COPY ATTR.                                                       04670000
            EJECT                                                       04680000
       COPY DFHAID.                                                     04690000
            EJECT                                                       04700000
       COPY ACATCOM.                                                    04710000
            EJECT                                                       04720000
       01  ACAT05M-IO-AREA                PIC X(1000).                  04730000
      ****  HDR & TRL MAPS ***************                              04740000
       COPY ACAT00M.                                                    04750000
      ****  ACAT05RN MAP   ***************                              04760000
       COPY ACAT05M.                                                    04770000
      ************************************                              04780000
       EJECT                                                            04790000
      ******************************************************************04800000
       01  ACAT05IO-AREA.                                               04810000
       COPY ACAT05IO.                                                   04820000
       EJECT                                                            04830000
       01  ACAT90CM-AREA.                                               04840000
       COPY ACAT90TS.                                                   04850000
       EJECT                                                            04860000
      *01  ACAT0FIO-AREA.                                               04870000
       COPY ACAT0FIO.                                                   04880000
                                                                        04881000
LRM021 01  TABL-RECORD.                                                 04882000
LRM021    03  TABL-KEY.                                                 04883000
LRM021        05  TABL-LITERAL   PIC X(33) VALUE 'ACAT        DCYCLE5'. 04884000
LRM021    03  TABL-DATA.                                                04885000
LRM021        05  FILLER         PIC X(01).                             04886000
LRM021        05  TABL-HHMM      PIC X(04).                             04887000
LRM021        05  FILLER         PIC X(56).                             04888000
       EJECT                                                            04890000
       LINKAGE SECTION.                                                 04900000
       01  DFHCOMMAREA.                                                 04910000
           03  FILLER                           PIC X(2000).            04920000
       COPY TWACOMM.                                                    04930000
           03 TWA-ACAT05IO-AREA.                                        04940000
              05 TWA-ACAT05IO-FIRST-TIME-SW       PIC X(01).            04950000
                 88  TWA-ACAT05IO-FIRST-TIME      VALUE 'Y'.            04960000
              05 TWA-DB2-INFO.                                          04970000
                 07  TWA-FUNCTION                     PIC X(02).        04980000
                    88  TWA-SRCH-VASSET                 VALUE 'RA'.     04990000
                    88  TWA-SRCH-VTRNFR                 VALUE 'RT'.     05000000
                    88  TWA-UPDT-VTRNFR                 VALUE 'UT'.     05010000
                    88  TWA-INSR-VINITRNF               VALUE 'II'.     05020000
                    88  TWA-DLTE-VINITRNF               VALUE 'DI'.     05030000
ET0006              88  TWA-UPDATE-VASSET               VALUE 'UA'.     05040000
ET0011              88  TWA-SRCH-FRZN-ASSET             VALUE 'SF'.     05050000
                 07  TWA-SRCH-ACTION.                                   05060000
                     10  TWA-SEARCH-VTRNFR            PIC X(01).        05070000
                         88 TWA-SRCH-VTRNFR-FWD          VALUE 'F'.     05080000
                         88 TWA-SRCH-VTRNFR-BWD          VALUE 'B'.     05090000
                         88 TWA-SRCH-VTRNFR-PND          VALUE 'P'.     05100000
ET0008                   88 TWA-SRCH-VTRNFR-CSR          VALUE 'C'.     05110000
                     10  TWA-SEARCH-VASSET            PIC X(01).        05120000
                         88 TWA-SRCH-VASSET-FWD          VALUE 'F'.     05130000
                         88 TWA-SRCH-VASSET-BWD          VALUE 'B'.     05140000
                     10  TWA-PREV-VASSET-ACT          PIC X(01).        05150000
                         88 TWA-PREV-VASSET-FWD          VALUE 'F'.     05160000
                         88 TWA-PREV-VASSET-BWD          VALUE 'B'.     05170000
                 05  TWA-RETURN-CODES.                                  05180000
                     07 TWA-DB2-ERROR-SW          PIC X(01).            05190000
                        88 TWA-DB2-ERROR                  VALUE 'Y'.    05200000
                     07 TWA-VTRNFR-SW             PIC X(01).            05210000
                        88 TWA-VTRNFR-FOUND               VALUE 'Y'.    05220000
                        88 TWA-VTRNFR-NOT-FOUND           VALUE 'N'.    05230000
                        88 TWA-VTRNFR-UPDATED             VALUE 'U'.    05240000
                        88 TWA-VTRNFR-FIRST               VALUE 'F'.    05250000
                        88 TWA-VTRNFR-LAST                VALUE 'L'.    05260000
                     07 TWA-VINITRNF-SW            PIC X(01).           05270000
                        88 TWA-VINITRNF-FOUND               VALUE 'Y'.  05280000
                        88 TWA-VINITRNF-NOT-FOUND           VALUE 'N'.  05290000
                        88 TWA-VINITRNF-UPDATED             VALUE 'U'.  05300000
                        88 TWA-VINITRNF-INSERTED            VALUE 'I'.  05310000
                        88 TWA-VINITRNF-DELETED             VALUE 'D'.  05320000
                     07 TWA-VASSET-SW        PIC X(01).                 05330000
                        88 TWA-VASSET-FOUND                 VALUE 'Y'.  05340000
                        88 TWA-VASSET-NOT-FOUND             VALUE 'N'.  05350000
                        88 TWA-VASSET-UPDATED               VALUE 'U'.  05360000
                        88 TWA-VASSET-FIRST                 VALUE 'F'.  05370000
                        88 TWA-VASSET-LAST                  VALUE 'L'.  05380000
                     07 TWA-VOPTN-SW        PIC X(01).                  05390000
                        88 TWA-VOPTN-FOUND                 VALUE 'Y'.   05400000
                        88 TWA-VOPTN-NOT-FOUND             VALUE 'N'.   05410000
                     07  TWA-SQLCA.                                     05420000
                        10  TWA-SQLCAID               PIC X(08).        05430000
                        10  TWA-SQLCODE               PIC S9(9) COMP-4. 05440000
                        10  TWA-SQLERRM.                                05450000
                            13  TWA-SQLERRML          PIC S9(04) COMP.  05460000
                            13  TWA-SQLERRMC          PIC X(70).        05470000
ET0008               07  TWA-MFC-FRV-DUPE-IND            PIC X(01).     05480000
ET0011               07  TWA-FREEZ-ASSET-FND-SW          PIC X(01).     05490000
ET0011                   88  TWA-FREEZ-CASH-FOUND        VALUE 'C'.     05500000
ET0011                   88  TWA-FREEZ-SEC-FOUND         VALUE 'S'.     05510000
                     07  TWA-ACAT05IO-COUNT.                            05520000
                        10 TWA-ACAT05IO-VTRNFR-COUNT     PIC 9(9) COMP. 05530000
                        10 TWA-ACAT05IO-VASSET-COUNT     PIC 9(9) COMP. 05540000
                        10 TWA-ACAT05IO-VASSET-COUNT-SV  PIC 9(9) COMP. 05550000
                        10 TWA-ACAT05IO-MAX-VASSET-SEQ   PIC 9(4) COMP. 05560000
               05 TWA-SV-TRNFR-KEY.                                     05570000
                   10 TWA-SV-CLIENT-NBR         PIC X(04).              05580000
                   10 TWA-SV-ACAT-CNTL-NO       PIC X(14).              05590000
                   10 TWA-SV-BRANCH-CD          PIC X(03).              05600000
                   10 TWA-SV-ACCT-CD            PIC X(05).              05610000
                   10 TWA-SV-RR-CD              PIC X(03).              05620000
                   10 TWA-SV-BRKR               PIC X(04).              05630000
                   10 TWA-SV-TFR                PIC X(03).              05640000
                   10 TWA-SV-STCD               PIC X(03).              05650000
                   10 TWA-SV-ASSET-SEQ-NBR      PIC S9(4) COMP.         05660000
ET0009         05  TWA-ACAT-SIGN-ON-ID          PIC X(04).              05670000
ET0012         05  TWA-USER-NAME                PIC X(20).              05680000
ET0012         05  TWA-USER-ID                  PIC X(08).              05690000
ET0012         05  TWA-NET-NAME                 PIC X(08).              05700000
ET0011         05  TWA-FREEZ-TYPE.                                      05710000
ET0011             07 TWA-FREEZ-CASH-IN         PIC X(01).              05720000
ET0011             07 TWA-FREEZ-CASH-OUT        PIC X(01).              05730000
ET0011             07 TWA-FREEZ-SEC-IN          PIC X(01).              05740000
ET0011             07 TWA-FREEZ-SEC-OUT         PIC X(01).              05750000
               05  ACAT05DA-TWA-AREA.                                   05760000
                   10 TWA-SCREEN-IND            PIC X(01).              05770000
                   10 TWA-CLIENT-NBR            PIC X(04).              05780000
                   10 TWA-ACAT-CONTROL-NBR      PIC X(14).              05790000
                   10 TWA-BRANCH-CD             PIC X(03).              05800000
                   10 TWA-ACCT-CD               PIC X(05).              05810000
                   10 TWA-RR-CD                 PIC X(03).              05820000
                   10 TWA-TFR-TYPE              PIC X(03).              05830000
                   10 TWA-STTS-CD               PIC X(03).              05840000
                   10 TWA-DAYS                  PIC 9(02).              05850000
                   10 TWA-RCV-NBR               PIC X(04).              05860000
                   10 TWA-DLVR-NBR              PIC X(04).              05870000
                   10 TWA-ACCT-DLVR-NBR         PIC X(20).              05880000
                   10 TWA-ACCT-RCV-NBR          PIC X(20).              05890000
                   10 TWA-RCV-CUST-NM           PIC X(60).              05900000
                   10 TWA-RCV-SS-PRIM-NBR       PIC X(09).              05910000
                   10 TWA-RCV-SS-SCNDY-NBR      PIC X(09).              05920000
                   10 TWA-RCV-ACCT-TYPE-CD      PIC X(02).              05930000
                   10 TWA-INIT-TRANS-TYPE-CD    PIC X(01).              05940000
                   10 TWA-VINITRNF-NSCC-PEND-CD PIC X(01).              05950000
                   10 TWA-VTRNFR-NSCC-PEND-CD   PIC X(01).              05960000
                   10 TWA-STTLM-RSN-CD          PIC X(01).              05970000
                   10 TWA-TRNFR-TYPE-RJCT-CD    PIC X(02).              05980000
                   10 TWA-STTLM-DT              PIC X(10).              05990000
                   10 TWA-VTRNFR-CMNT           PIC X(120).             06000000
                   10 TWA-ALERT-IND             PIC X(01).              06010000
ET0008             10 TWA-ACAT-CNTL-ASTD-NBR    PIC X(14).              06020000
ET0008             10 TWA-FRV-MFC-CMPLT-IND     PIC X(01).              06030000
                   10 TWA-RSCD01                PIC X(02).              06040000
                   10 TWA-RSCD02                PIC X(02).              06050000
                   10 TWA-RSCD05                PIC X(02).              06060000
                   10 TWA-BAL01                 PIC S9(15)V99 COMP-3.   06070000
LRM023             10 TWA-BAL01-FULL-RQST       PIC X.                  06071000
LRM023             10 TWA-BAL01-FULL-DB-CR      PIC X.                  06072000
                   10 TWA-BAL02                 PIC S9(15)V99 COMP-3.   06080000
LRM023             10 TWA-BAL02-FULL-RQST       PIC X.                  06081000
LRM023             10 TWA-BAL02-FULL-DB-CR      PIC X.                  06082000
                   10 TWA-BAL05                 PIC S9(15)V99 COMP-3.   06090000
LRM023             10 TWA-BAL05-FULL-RQST       PIC X.                  06091000
LRM023             10 TWA-BAL05-FULL-DB-CR      PIC X.                  06092000
                   10 TWA-RETURN-MSG            PIC X(70).              06100000
               05  ACAT05IO-TWA-EXCEPTIONS.                             06110000
                   10 FILLER                       PIC X(1).            06120000
                   10 TWA-ACCT-ACTIVITY-IND        PIC X(1).            06130000
                   10 TWA-ACCT-ORDERS-IND          PIC X(1).            06140000
                   10 TWA-ACCT-RJCT-RSBM-IND       PIC X(1).            06150000
                   10 TWA-ACCT-DB-BAL-T1-IND       PIC X(1).            06160000
                   10 TWA-ACCT-MRGN-DB-IND         PIC X(1).            06170000
                   10 TWA-ACCT-SHRT-PSTN-IND       PIC X(1).            06180000
                   10 TWA-ACCT-SEC-RSTRD-IND       PIC X(1).            06190000
                   10 TWA-ACCT-AST-EXCS-IND        PIC X(1).            06200000
                   10 TWA-ACCT-OPTN-PSTN-IND       PIC X(1).            06210000
                   10 TWA-ACCT-LTD-PRTNR-IND       PIC X(1).            06220000
                   10 TWA-ACCT-TIN-MSMTH-IND       PIC X(1).            06230000
                   10 TWA-ACCT-DPLCT-TRN-IND       PIC X(1).            06240000
                   10 TWA-ACCT-CUST-70-IND         PIC X(1).            06250000
                   10 TWA-ACCT-QULFD-PLN-IND       PIC X(1).            06260000
                   10 TWA-ACCT-MNGD-IND            PIC X(1).            06270000
                   10 TWA-ACCT-PRVT-RNG-IND        PIC X(1).            06280000
                   10 TWA-ACCT-BRKR-TIF-IND        PIC X(1).            06290000
                   10 TWA-NSCC-NON-ADP-IND         PIC X(1).            06300000
                   10 TWA-COMMENTS-IND             PIC X(1).            06310000
ET0011             10 TWA-ACCT-FRZN-IND            PIC X(01).           06320000
LRM014             10 TWA-STTLM-TM-CD              PIC X(1).            06330000
LRM015             10 TWA-GIFT-IND                 PIC X(1).            06340000
DJ0003             10 TWA-AUCTION-RATE-IND         PIC X(1).            06350000
LRM022             10 TWA-SUB-PENNY-PRICE-IND      PIC X(1).            06351000
               05  ACAT05DC-TWA-AREA.                                   06360000
                   10 TWA-SEC-NBR                 PIC X(12).            06370000
                   10 TWA-TRANS-TYPE-CD           PIC X(01).            06380000
                   10 TWA-CSH-MGN-SHRT-CD         PIC X(01).            06390000
                      88 TWA-CASH-ASSET             VALUE 'C'.          06400000
                      88 TWA-MARGIN-ASSET           VALUE 'M'.          06410000
                      88 TWA-SHORT-ASSET            VALUE 'S'.          06420000
                   10 TWA-PSTN-CD                  PIC X(01).           06430000
                      88 TWA-SHORT-ASSET-QTY        VALUE 'S'.          06440000
                      88 TWA-LONG-ASSET-QTY         VALUE 'L'.          06450000
                      88 TWA-NA-ASSET-QTY           VALUE 'N'.          06460000
                   10 TWA-OPTN-CTGY-CD              PIC X(02).          06470000
                   10 TWA-OPT-BS-CD                 PIC X(01).          06480000
                      88  TWA-OPT-BUY               VALUE 'B'.          06490000
                      88  TWA-OPT-SELL              VALUE 'S'.          06500000
                   10 TWA-WHEN-ISSUED             PIC X(01).            06510000
                   10 TWA-STTLM-LOCATION          PIC X(02).            06520000
                   10 TWA-TRNFR-TYPE-RSN-CD       PIC X(02).            06530000
                   10 TWA-ASSET-QTY              PIC S9(13)V9(4) COMP-3.06540000
                   10 TWA-ASSET-AMT              PIC S9(15)V99   COMP-3.06550000
                   10 TWA-ASSET-DESC              PIC X(140).           06560000
                   10 TWA-ASSET-CMNT              PIC X(120).           06570000
                   10 TWA-SBMT-BRKR               PIC X(04).            06580000
                   10 TWA-RESTRICTED-IND          PIC X(01).            06590000
ET0006             10 TWA-CAGE-TAG                PIC X(11).            06600000
LRM009             10 TWA-ASSET-RQST-QTY-CD       PIC X.                06610000
               05  TWA-INPUT-AREA.                                      06620000
                 07 ACAT05IO-TWA-INPUT.                                 06630000
                   10 TWA-M5NEXT                PIC X(01).              06640000
                   10 TWA-M5ACCPT               PIC X(01).              06650000
                       88 TWA-XFR-ACCPT-YES     VALUE 'S'.              06660000
                       88 TWA-XFR-ACCPT-NO      VALUE ' '.              06670000
ET0001             10 TWA-M5ACCEL               PIC X(01).              06680000
                   10 TWA-M5REJ                 PIC X(01).              06690000
                       88 TWA-XFR-REJ-YES       VALUE 'S'.              06700000
                       88 TWA-XFR-REJ-NO        VALUE ' '.              06710000
                   10 TWA-M5REJC                PIC X(01).              06720000
                       88 TWA-XFR-REJC-YES      VALUE 'S'.              06730000
                       88 TWA-XFR-REJC-NO       VALUE ' '.              06740000
                   10 TWA-VINITRNF-CMNT         PIC X(120).             06750000
                 07 TWA-TRLM-INPUT.                                     06760000
                   10 TWA-MBR                   PIC X(03).              06770000
                   10 TWA-MAC                   PIC X(05).              06780000
                   10 TWA-MRR                   PIC X(03).              06790000
                   10 TWA-MCBRKR                PIC X(04).              06800000
                   10 TWA-MTFR                  PIC X(03).              06810000
                   10 TWA-MSTAT                 PIC X(03).              06820000
           03 TWA-ACAT-AREA.                                            06830000
              05 TWA-CAME-FROM-PENDING-SW       PIC X(01).              06840000
                 88 TWA-CAME-FROM-PENDING                 VALUE 'Y'.    06850000
              05 TWA-PREV-ACTIONS.                                      06860000
                 07 TWA-PREV-NEXT               PIC X(01).              06870000
                 07 TWA-PREV-ACCEPT             PIC X(01).              06880000
                 07 TWA-PREV-ACCEL              PIC X(01).              06890000
                 07 TWA-PREV-REJ                PIC X(01).              06900000
                 07 TWA-PREV-REJ-CMNT           PIC X(01).              06910000
              05 TWA-PREV-TRLM-INPUT.                                   06920000
                 07 TWA-PREV-MBR                PIC X(03).              06930000
                 07 TWA-PREV-MAC                PIC X(05).              06940000
                 07 TWA-PREV-MRR                PIC X(03).              06950000
                 07 TWA-PREV-MCBRKR             PIC X(04).              06960000
                 07 TWA-PREV-MTFR               PIC X(03).              06970000
                 07 TWA-PREV-MRD                PIC X(01).              06980000
                 07 TWA-PREV-MSTAT              PIC X(03).              06990000
                 07 TWA-PREV-MSD                PIC X(06).              07000000
ET0006        05 TWA-CAGE-TAG-PREV              PIC X(11).              07010000
      **                                                                07020000
      ************************* BOTTOM OF DATA *************************07030000
                                                                        07040000
           EJECT                                                        07050000
                                                                        07060000
       PROCEDURE DIVISION.                                              07070000
       0000-INITIALIZATION.                                             07080000
           EXEC CICS IGNORE CONDITION   ERROR  ITEMERR MAPFAIL LENGERR  07090000
                     NOSPACE NOSTG  NOTFND    PGMIDERR QIDERR           07100000
           END-EXEC.                                                    07110000
                                                                        07120000
           EXEC CICS ASSIGN TWALENG (TWA-SIZE)                          07130000
           END-EXEC.                                                    07140000
           IF TWA-SIZE = 0                                              07150000
              MOVE LOW-VALUE TO ACAT05AO, ACAT05BO                      07160000
              MOVE 'TWA SIZE EQUAL ZERO, FATAL ERROR' TO SYSTEM-MSG     07170000
              PERFORM  0830-ERROR-RTN.                                  07180000
                                                                        07190000
           EXEC CICS ADDRESS TWA (ADDRESS OF TWA-AREA)                  07200000
           END-EXEC.                                                    07210000
                                                                        07220000
                                                                        07230000
       0100-MAIN-PROCESSING.                                            07240000
           MOVE TWA-CLIENT-NO TO TWA-CLIENT-NO-9.                       07250000
           MOVE SPACES        TO SYSTEM-MSG.                            07260000
           MOVE LOW-VALUE     TO ACAT05AO ACAT05BO.                     07270000
           MOVE ATT-UNPROT TO M5NEXTA M5REJA M5REJCA.                   07280000
           PERFORM 0150-GET-DATE-TIME-RTN.                              07290000
           MOVE DFHCOMMAREA          TO ACATCOMM-COMMAREA.              07300000
                                                                        07310000
                                                                        07320000
           IF ACAT-SUPER-SIGN-ON-UPDATE                                 07330000
              SET WS-UPDATE-OK     TO TRUE                              07340000
           ELSE                                                         07350000
              PERFORM 0170-CHECK-UPDATE-MODE.                           07360000
      **                                                                07370000
      **  XCTL FROM "PENDING TRANSFER INQ" ************                 07380000
           IF ACAT-CALLING-PROG-NAME = 'ACAT21PT'  AND                  07390000
              ACAT-PROGRAM-NAME = 'ACAT21PT'       AND                  07400000
              ACAT-CONTROL-NBR > SPACE             AND                  07410000
              ACAT-BR-AC > SPACE                                        07420000
              MOVE EIBTRMID   TO TERM-ID                                07430000
              MOVE 'ACA5'     TO TRAN-ID                                07440000
              PERFORM 0600-DELETE-TSQ                                   07450000
              SET FIRST-TIME TO TRUE                                    07460000
              SET  TWA-ACAT05IO-FIRST-TIME TO TRUE                      07470000
              SET  TWA-CAME-FROM-PENDING   TO TRUE                      07480000
              MOVE ACAT-CONTROL-NBR  TO ACAT05IO-SV-ACAT-CNTL-NBR       07490000
              MOVE LOW-VALUES TO TWA-SV-BRANCH-CD, TWA-SV-ACCT-CD,      07500000
                                 TWA-SV-RR-CD, TWA-SV-BRKR, TWA-SV-TFR, 07510000
                                 TWA-SV-STCD                            07520000
              PERFORM 0400-DISPLAY-ACAT05M                              07530000
              MOVE SPACE TO FIRST-TIME-FLAG, ACAT05IO-FIRST-TIME-SW     07540000
           END-IF.                                                      07550000
      **                                                                07560000
           IF EIBAID = DFHPF10    AND                                   07570000
              ACAT-CALLING-PROG-NAME = 'ACAT90CM'                       07580000
              PERFORM 0240-RETURN-FROM-ACAT90CM                         07590000
              PERFORM 0810-MAP-INPUT-AREA  THRU 0810-EXIT               07600000
              MOVE 'N' TO DATA-ONLY-FLAG                                07610000
              PERFORM 0800-SEND-MAP-RETURN                              07620000
           ELSE                                                         07630000
              IF EIBAID = DFHPF10               AND                     07640000
                 ACAT-CALLING-PROG-NAME = 'ACAT0FCP'                    07650000
                  PERFORM 0260-RETURN-FROM-ACAT0FCP                     07660000
              ELSE                                                      07670000
                 IF ACAT-PROGRAM-NAME = 'ACAT05RN'                      07680000
                     PERFORM 0230-CONTINUE-PROCESS                      07690000
                 ELSE                                                   07700000
                    IF ACAT-PROGRAM-NAME = 'RATT01  '                   07710000
                        MOVE EIBTRMID TO TERM-ID                        07720000
                        MOVE 'ACA5' TO TRAN-ID                          07730000
                        PERFORM 0610-READ-TSQ                           07740000
                        MOVE TWA-ACAT05IO-AREA TO ACAT05IO-AREA         07750000
                        MOVE LOW-VALUE TO ACAT05AO ACAT05BO             07760000
                        PERFORM 0810-MAP-INPUT-AREA  THRU 0810-EXIT     07770000
                        PERFORM 0800-SEND-MAP-RETURN                    07780000
                    ELSE                                                07790000
                        PERFORM 0200-FIRST-TIME-THRU                    07800000
                    END-IF                                              07810000
                 END-IF                                                 07820000
              END-IF                                                    07830000
           END-IF.                                                      07840000
                                                                        07850000
           EJECT                                                        07860000
                                                                        07870000
       0150-GET-DATE-TIME-RTN.                                          07880000
           EXEC  CICS ASKTIME                                           07890000
                 ABSTIME(WSABSTIME)                                     07900000
           END-EXEC.                                                    07910000
           EXEC  CICS FORMATTIME                                        07920000
                 ABSTIME(WSABSTIME)                                     07930000
                 MMDDYY(WSMMDDYY)                                       07940000
                 DATESEP(WSDATESEP)                                     07950000
                 TIME(WSTIME)                                           07960000
                 TIMESEP(WSTIMESEP)                                     07970000
           END-EXEC.                                                    07980000
LRM014     MOVE WS-TIME-HH TO WS-TIME-HHMM(1 : 2).                      07990000
LRM014     MOVE WS-TIME-MM TO WS-TIME-HHMM(3 : 2).                      08000000
LRM021     EXEC CICS READ DATASET('TABLFLE ' )                          08001000
LRM021                INTO   (TABL-RECORD)                              08002000
LRM021                RIDFLD (TABL-KEY)                                 08003000
LRM021                RESP   (WS-CICS-RESP)                             08004000
LRM021     END-EXEC                                                     08005000
LRM021                                                                  08006000
LRM021     IF WS-CICS-RESP = DFHRESP(NORMAL)                            08007000
LRM021     AND TABL-HHMM > WS-CYCLE5-HHMM                               08008000
LRM021         MOVE TABL-HHMM TO WS-CYCLE5-HHMM                         08009000
LRM021     END-IF.                                                      08009100
                                                                        08010000
       0170-CHECK-UPDATE-MODE.                                          08020000
           MOVE SPACES    TO SECLINK-LIST.                              08030000
           MOVE '2'       TO SECLINK-ACTION-CODE.                       08040000
           MOVE 'SCON'    TO SECLINK-TYPE.                              08050000
           MOVE 'ACAXEU'  TO SECLINK-ITEM.                              08060000
           PERFORM CALL-SECLINK-RTN.                                    08070000
           IF SECLINK-RETURN-CODE = '00' OR '20'                        08080000
              SET WS-UPDATE-OK  TO TRUE.                                08090000
       EJECT                                                            08100000
                                                                        08110000
       0200-FIRST-TIME-THRU.                                            08120000
      ****===> SEARCH BAR SHOULD BE CHECKED ?????                       08130000
           MOVE EIBTRMID      TO TERM-ID.                               08140000
           MOVE 'ACA5'        TO TRAN-ID.                               08150000
           PERFORM 0600-DELETE-TSQ.                                     08160000
           INITIALIZE TWA-SV-TRNFR-KEY.                                 08170000
           SET FIRST-TIME  TO TRUE.                                     08180000
           SET ACAT05IO-FIRST-TIME  TO TRUE.                            08190000
      ***                                                               08200000
      **------------- GET TRAILER INPUT FROM ACAT01CP -----------------*08210000
      ***                                                               08220000
           MOVE TWA-CLIENT-NO-9      TO TWA-SV-CLIENT-NBR.              08230000
           IF ACAT-INP-BRANCH > SPACES                                  08240000
              MOVE ACAT-INP-BRANCH   TO TWA-MBR, TWA-SV-BRANCH-CD,      08250000
           END-IF.                                                      08260000
           IF ACAT-INP-ACCOUNT > SPACES                                 08270000
              MOVE ACAT-INP-ACCOUNT  TO TWA-MAC, TWA-SV-ACCT-CD         08280000
           END-IF.                                                      08290000
           IF ACAT-INP-RR > SPACES                                      08300000
              MOVE ACAT-INP-RR       TO TWA-MRR, TWA-SV-RR-CD           08310000
           END-IF.                                                      08320000
           IF ACAT-INP-CONTRA-BKR > SPACES                              08330000
              MOVE ACAT-INP-CONTRA-BKR TO TWA-MCBRKR, TWA-SV-BRKR       08340000
           END-IF.                                                      08350000
           IF ACAT-INP-TFR-TYP > SPACES                                 08360000
              MOVE ACAT-INP-TFR-TYP  TO  TWA-MTFR, TWA-SV-TFR           08370000
           END-IF.                                                      08380000
           IF ACAT-INP-STATUS > SPACES                                  08390000
              MOVE ACAT-INP-STATUS   TO  TWA-MSTAT, TWA-SV-STCD         08400000
              EVALUATE TWA-MSTAT                                        08410000
                 WHEN 'REQ'     MOVE  '100' TO TWA-SV-STCD              08420000
                 WHEN 'RQA'     MOVE  '110' TO TWA-SV-STCD              08430000
                 WHEN 'RQP'     MOVE  '130' TO TWA-SV-STCD              08440000
                 WHEN 'RQR'     MOVE  '140' TO TWA-SV-STCD              08450000
                 WHEN 'REV'     MOVE  '200' TO TWA-SV-STCD              08460000
                 WHEN 'RVA'     MOVE  '210' TO TWA-SV-STCD              08470000
                 WHEN 'RVE'     MOVE  '220' TO TWA-SV-STCD              08480000
                 WHEN 'RVX'     MOVE  '230' TO TWA-SV-STCD              08490000
                 WHEN 'STP'     MOVE  '300' TO TWA-SV-STCD              08500000
                 WHEN 'STC'     MOVE  '310' TO TWA-SV-STCD              08510000
                 WHEN 'CLP'     MOVE  '400' TO TWA-SV-STCD              08520000
                 WHEN 'PUR'     MOVE  '500' TO TWA-SV-STCD              08530000
                 WHEN 'MPP'     MOVE  '510' TO TWA-SV-STCD              08540000
                 WHEN 'REJ'     MOVE  '600' TO TWA-SV-STCD              08550000
              END-EVALUATE                                              08560000
           END-IF.                                                      08570000
           MOVE LOW-VALUES           TO ACAT05IO-SAVE-KEYS.             08580000
           MOVE TWA-SV-TRNFR-KEY     TO ACAT05IO-SAVE-KEYS.             08590000
           MOVE TWA-TRLM-INPUT       TO ACAT05IO-TRLM-INPUT.            08600000
           IF ACAT05IO-TRLM-INPUT > SPACES                              08610000
              MOVE LOW-VALUES TO ACAT05IO-INPUT                         08620000
           END-IF.                                                      08630000
           PERFORM 0400-DISPLAY-ACAT05M.                                08640000
           MOVE SPACE TO FIRST-TIME-FLAG, ACAT05IO-FIRST-TIME-SW.       08650000
                                                                        08660000
       EJECT                                                            08670000
                                                                        08680000
       0230-CONTINUE-PROCESS.                                           08690000
      **                                                                08700000
           PERFORM 0250-RECEIVE-MAP-RTN.                                08710000
           EVALUATE TRUE                                                08720000
                WHEN EIBAID = DFHENTER                                  08730000
                     PERFORM 0300-ENTER-KEY-RTN                         08740000
                WHEN EIBAID = DFHPF1                                    08750000
                     PERFORM 0310-VIEW-COMMENTS                         08760000
LRM018          WHEN EIBAID = DFHPF2                                    08770000
LRM018             AND (WS-UPDATE-OK)                                   08780000
LRM018               PERFORM 0315-CREATE-SPAD-LINK                      08790000
                WHEN EIBAID = DFHPF3                                    08800000
                     PERFORM 0320-PF3-TO-MARGIN                         08810000
                WHEN EIBAID = DFHPF5                                    08820000
                     PERFORM 0330-REASON-CODES-POPUP                    08830000
                WHEN EIBAID = DFHPA1                                    08840000
                     PERFORM 0340-PAGE-FORWARD-PA1                      08850000
                WHEN EIBAID = DFHPA2                                    08860000
                     PERFORM 0350-PAGE-BACKWARD-PA2                     08870000
                WHEN EIBAID = DFHPF6                                    08880000
                     PERFORM 0360-EXCEPTIONS-POPUP                      08890000
                WHEN EIBAID = DFHPF7                                    08900000
                     PERFORM 0370-PREV-TFR-PF7                          08910000
                WHEN EIBAID = DFHPF8                                    08920000
                     PERFORM 0380-NEXT-TFR-PF8                          08930000
                WHEN EIBAID = DFHPF9                                    08940000
                     PERFORM 0390-VIEW-FUND-REG                         08950000
                WHEN EIBAID = DFHPF10 OR DFHPF12                        08960000
                     PERFORM 0900-RETURN-TO-CICS                        08970000
                WHEN EIBAID = DFHPF11 OR DFHCLEAR                       08980000
                     PERFORM 0910-RETURN-CONTROL-RTN                    08990000
                WHEN OTHER                                              09000000
                     MOVE LOW-VALUE TO ACAT05AO ACAT05BO                09010000
                     MOVE EIBTRMID         TO TERM-ID                   09020000
                     MOVE 'ACA5'           TO TRAN-ID                   09030000
                     PERFORM 0610-READ-TSQ                              09040000
                     SET CURSOR-ON-M5NEXT  TO TRUE                      09050000
                     MOVE 'ERROR FUNCTION KEY' TO SYSTEM-MSG            09060000
                     PERFORM 0830-ERROR-RTN                             09070000
           END-EVALUATE.                                                09080000
      /                                                                 09090000
       0240-RETURN-FROM-ACAT90CM.                                       09100000
                                                                        09110000
           MOVE EIBTRMID         TO TERM-ID.                            09120000
           MOVE 'ACA5'           TO TRAN-ID.                            09130000
           PERFORM 0610-READ-TSQ.                                       09140000
           MOVE TWA-ACAT05IO-AREA TO ACAT05IO-AREA.                     09150000
           PERFORM 0550-READ-ACAT90CM-TS-RTN.                           09160000
                                                                        09170000
           IF TWA-SCREEN-IND     = 'A' AND                              09180000
              TWA-XFR-REJC-YES         AND                              09190000
              ACAT90CM-TS-UPDATE                                        09200000
              IF WS-UPDATE-OK                                           09210000
LRM017        AND (NOT ACAT-ASCENDIS-CLIENT                             09220000
LRM017         OR (ACAT-ASCENDIS-CLIENT                                 09230000
LRM017         AND (TWA-TFR-TYPE NOT = 'PTR' AND 'PTD')))               09240000
                 SET INPUT-REJC-RC TO TRUE                              09250000
                 MOVE ACAT90CM-TS-MCCMNT-X120 TO TWA-VINITRNF-CMNT      09260000
                 PERFORM 0450-PROCESS-INPUT                             09270000
              ELSE                                                      09280000
                 MOVE LOW-VALUES  TO  ACAT05AO, ACAT05BO                09290000
                 MOVE SPACES TO M5ACCPTO, M5REJO, M5REJCO               09300000
ET0001                          M5ACCELO                                09310000
                 PERFORM 0810-MAP-INPUT-AREA THRU 0810-EXIT             09320000
LRM017           IF ACAT-ASCENDIS-CLIENT                                09330000
LRM017              MOVE 'UNAUTHORIZED TO REJECT / ASCENDIS'            09340000
LRM017                                            TO SYSTEM-MSG         09350000
LRM017           ELSE                                                   09360000
                    MOVE 'UNAUTHORIZED TO REJECT' TO SYSTEM-MSG         09370000
LRM017           END-IF                                                 09380000
                 PERFORM 0800-SEND-MAP-RETURN                           09390000
              END-IF                                                    09400000
           ELSE                                                         09410000
              MOVE LOW-VALUES  TO  ACAT05AO, ACAT05BO                   09420000
              MOVE SPACES TO M5ACCPTO, M5REJO, M5REJCO                  09430000
ET0001                       M5ACCELO                                   09440000
              PERFORM 0810-MAP-INPUT-AREA THRU 0810-EXIT                09450000
              PERFORM 0800-SEND-MAP-RETURN                              09460000
           END-IF.                                                      09470000
      /                                                                 09480000
       0250-RECEIVE-MAP-RTN.                                            09490000
           MOVE LOW-VALUE TO ACAT05AO ACAT05BO.                         09500000
           MOVE +1000   TO  ACAT-RECEIVE-MAP-LENGTH.                    09510000
      ***  HEADER MAP PORTION                                           09520000
           EXEC CICS RECEIVE MAP('HDRMAP')                              09530000
                     MAPSET('ACAT00M')                                  09540000
                     FROM(ACAT-RECEIVE-MAP)                             09550000
                     INTO(HDRMAPI)                                      09560000
           END-EXEC                                                     09570000
                                                                        09580000
      ***  MAP BODY PORTION                                             09590000
           EXEC CICS RECEIVE MAP('ACAT05A')                             09600000
                             MAPSET('ACAT05M')                          09610000
                             FROM(ACAT-RECEIVE-MAP)                     09620000
                             LENGTH(ACAT-RECEIVE-MAP-LENGTH)            09630000
                             INTO(ACAT05AI)                             09640000
           END-EXEC.                                                    09650000
                                                                        09660000
           EXEC CICS RECEIVE MAP('ACAT05B')                             09670000
                             MAPSET('ACAT05M')                          09680000
                             FROM(ACAT-RECEIVE-MAP)                     09690000
                             LENGTH(ACAT-RECEIVE-MAP-LENGTH)            09700000
                             INTO(ACAT05BI)                             09710000
           END-EXEC.                                                    09720000
                                                                        09730000
      ***  TRAILER MAP PORTION                                          09740000
           EXEC CICS RECEIVE MAP('TRLMAP')                              09750000
                     MAPSET('ACAT00M')                                  09760000
                     FROM(ACAT-RECEIVE-MAP)                             09770000
                     INTO(TRLMAPI)                                      09780000
           END-EXEC.                                                    09790000
                                                                        09800000
      /                                                                 09810000
       0260-RETURN-FROM-ACAT0FCP.                                       09820000
                                                                        09830000
           MOVE EIBTRMID         TO TERM-ID.                            09840000
           MOVE 'ACA5'           TO TRAN-ID.                            09850000
           PERFORM 0610-READ-TSQ.                                       09860000
           MOVE TWA-ACAT05IO-AREA TO ACAT05IO-AREA.                     09870000
           MOVE LOW-VALUE     TO ACAT05AO, ACAT05BO.                    09880000
           MOVE SPACES TO M5ACCPTO, M5REJO, M5REJCO.                    09890000
ET0001     MOVE SPACES TO M5ACCELO.                                     09900000
           PERFORM 0810-MAP-INPUT-AREA  THRU  0810-EXIT.                09910000
           PERFORM 0800-SEND-MAP-RETURN.                                09920000
      /                                                                 09930000
       0300-ENTER-KEY-RTN.                                              09940000
           MOVE EIBTRMID      TO TERM-ID.                               09950000
           MOVE 'ACA5'        TO TRAN-ID.                               09960000
           PERFORM 0610-READ-TSQ.                                       09970000
                                                                        09980000
           IF M5NEXTL > 0                                               09990000
              IF M5NEXTI = TWA-M5NEXT                                   10000000
                 CONTINUE                                               10010000
              ELSE                                                      10020000
                 MOVE M5NEXTI TO TWA-M5NEXT                             10030000
              END-IF                                                    10040000
           ELSE                                                         10050000
              IF M5NEXTA = ERASE-KEY                                    10060000
                 MOVE SPACES TO TWA-M5NEXT                              10070000
              END-IF.                                                   10080000
           MOVE ATT-UNPROT TO M5NEXTA.                                  10090000
           IF TWA-M5NEXT = 'E'                                          10100000
              MOVE SPACE TO M5NEXTO TWA-M5NEXT.                         10110000
           IF TWA-M5NEXT > SPACES                                       10120000
              PERFORM 0700-PROCESS-JUMP-RTN.                            10130000
                                                                        10140000
           MOVE SPACE TO WS-INPUT-VALIDATE-SW.                          10150000
           MOVE TWA-ACAT05IO-AREA TO ACAT05IO-AREA.                     10160000
           PERFORM 0410-EDIT-INPUT-FIELDS.                              10170000
           PERFORM 0415-EDIT-ACAT00M-RTN.                               10180000
           IF NO-INPUT             AND                                  10190000
              ACAT-NO-SRCH-ENTRY                                        10200000
              PERFORM 0810-MAP-INPUT-AREA  THRU 0810-EXIT               10210000
ET0006        MOVE EIBTRMID TO TERM-ID                                  10220000
ET0006        MOVE 'ACA5'  TO TRAN-ID                                   10230000
ET0006        PERFORM 0600-DELETE-TSQ                                   10240000
ET0006        PERFORM 0620-WRITE-TSQ                                    10250000
              SET CURSOR-ON-M5NEXT TO TRUE                              10260000
              PERFORM 0800-SEND-MAP-RETURN                              10270000
           ELSE                                                         10280000
              MOVE TWA-SV-TRNFR-KEY  TO ACAT05IO-SAVE-KEYS              10290000
              MOVE SPACES            TO ACAT05IO-RETURN-MSG             10300000
              MOVE LOW-VALUES        TO ACAT05IO-SV-ACAT-CNTL-NBR       10310000
              MOVE TWA-TRLM-INPUT    TO ACAT05IO-TRLM-INPUT             10320000
              PERFORM 0400-DISPLAY-ACAT05M                              10330000
           END-IF.                                                      10340000
      *                                                                 10350000
       0310-VIEW-COMMENTS.                                              10360000
      ***** PF1 KEY ENTERED                                             10370000
      *===> SEND POP UP SCREEN                                          10380000
           PERFORM 0480-CHECK-EIBCPOSN.                                 10390000
           PERFORM 0530-PREP-FOR-POPUP.                                 10400000
LRM018 0315-CREATE-SPAD-LINK.                                           10410000
           PERFORM 0530-PREP-FOR-POPUP.                                 10420000
      *                                                                 10430000
       0320-PF3-TO-MARGIN.                                              10440000
      *===> JUMP TO ACAT01CP & MARGIN                                   10450000
           MOVE EIBTRMID      TO TERM-ID.                               10460000
           MOVE 'ACA5'        TO TRAN-ID.                               10470000
           PERFORM 0610-READ-TSQ.                                       10480000
           PERFORM 0900-RETURN-TO-CICS.                                 10490000
      *                                                                 10500000
       0330-REASON-CODES-POPUP.                                         10510000
      *===> SEND POP UP SCREEN                                          10520000
           PERFORM 0480-CHECK-EIBCPOSN.                                 10530000
           IF REASON-CODE-POPUP-YES                                     10540000
              PERFORM 0530-PREP-FOR-POPUP                               10550000
           END-IF.                                                      10560000
      /                                                                 10570000
       0340-PAGE-FORWARD-PA1.                                           10580000
      *===> SCROLL DOWN ASSET INFO WITHIN THE ACCOUNT                   10590000
           MOVE EIBTRMID      TO TERM-ID.                               10600000
           MOVE 'ACA5'        TO TRAN-ID.                               10610000
           PERFORM 0610-READ-TSQ.                                       10620000
           MOVE SPACES            TO TWA-RETURN-MSG.                    10630000
           MOVE TWA-ACAT05IO-AREA TO ACAT05IO-AREA                      10640000
           SET ACAT05IO-SRCH-VASSET     TO TRUE                         10650000
           SET ACAT05IO-SRCH-VASSET-FWD TO TRUE                         10660000
           PERFORM 0520-CALL-ACAT05DC.                                  10670000
           MOVE ACAT05IO-AREA   TO  TWA-ACAT05IO-AREA.                  10680000
           PERFORM 0405-MOVE-SV-KEYS.                                   10690000
           MOVE LOW-VALUES TO  ACAT05BO.                                10700000
      **   MOVE SPACES     TO M5REJO, M5REJCO.                          10710000
           MOVE EIBTRMID   TO TERM-ID.                                  10720000
           MOVE 'ACA5'     TO TRAN-ID.                                  10730000
           PERFORM 0600-DELETE-TSQ.                                     10740000
      ***  PERFORM 0810-MAP-INPUT-AREA THRU 0810-EXIT.                  10750000
           PERFORM 0820-MAP-INPUT-ASSET.                                10760000
           PERFORM 0620-WRITE-TSQ                                       10770000
           SET DATA-ONLY TO TRUE.                                       10780000
           PERFORM 0800-SEND-MAP-RETURN.                                10790000
      /                                                                 10800000
       0350-PAGE-BACKWARD-PA2.                                          10810000
      *===> SCROLL UP ASSET INFO WITHIN THE ACCOUNT                     10820000
           MOVE EIBTRMID      TO TERM-ID.                               10830000
           MOVE 'ACA5'        TO TRAN-ID.                               10840000
           PERFORM 0610-READ-TSQ.                                       10850000
           MOVE SPACES            TO TWA-RETURN-MSG.                    10860000
           MOVE TWA-ACAT05IO-AREA TO ACAT05IO-AREA                      10870000
           SET ACAT05IO-SRCH-VASSET     TO TRUE                         10880000
           SET ACAT05IO-SRCH-VASSET-BWD TO TRUE                         10890000
           PERFORM 0520-CALL-ACAT05DC.                                  10900000
           MOVE ACAT05IO-AREA   TO  TWA-ACAT05IO-AREA.                  10910000
           PERFORM 0405-MOVE-SV-KEYS.                                   10920000
           MOVE LOW-VALUES TO  ACAT05BO.                                10930000
           MOVE EIBTRMID   TO TERM-ID.                                  10940000
           MOVE 'ACA5'     TO TRAN-ID.                                  10950000
           PERFORM 0600-DELETE-TSQ.                                     10960000
           PERFORM 0820-MAP-INPUT-ASSET.                                10970000
           PERFORM 0620-WRITE-TSQ                                       10980000
           SET DATA-ONLY TO TRUE.                                       10990000
           PERFORM 0800-SEND-MAP-RETURN.                                11000000
      /                                                                 11010000
       0360-EXCEPTIONS-POPUP.                                           11020000
      *===> SEND POP UP SCREEN                                          11030000
            PERFORM 0530-PREP-FOR-POPUP.                                11040000
      /                                                                 11050000
       0370-PREV-TFR-PF7.                                               11060000
      *===> SCROLL UP TO PREVIOUS TRANSFER                              11070000
           MOVE EIBTRMID      TO TERM-ID.                               11080000
           MOVE 'ACA5'        TO TRAN-ID.                               11090000
           PERFORM 0610-READ-TSQ.                                       11100000
           IF TWA-CAME-FROM-PENDING OR                                  11110000
              TWA-SRCH-VTRNFR-PND                                       11120000
              MOVE '  **** PAGEING UP IS NOT AVAILABLE ****   '         11130000
              TO SYSTEM-MSG                                             11140000
              SET ERROR-YES TO TRUE                                     11150000
              SET DATA-ONLY TO TRUE                                     11160000
              PERFORM 0800-SEND-MAP-RETURN                              11170000
           END-IF.                                                      11180000
           MOVE LOW-VALUES TO ACAT05AO, ACAT05BO.                       11190000
           MOVE +0             TO TWA-SV-ASSET-SEQ-NBR.                 11200000
           MOVE SPACES         TO TWA-RETURN-MSG,                       11210000
                                  ACAT05IO-TWA-INPUT.                   11220000
           MOVE TWA-ACAT05IO-AREA  TO  ACAT05IO-AREA.                   11230000
           SET ACAT05IO-FIRST-TIME  TO TRUE.                            11240000
           SET ACAT05IO-SRCH-VTRNFR     TO TRUE.                        11250000
           SET ACAT05IO-SRCH-VTRNFR-BWD TO TRUE.                        11260000
           SET ACAT05IO-SRCH-VASSET-FWD TO TRUE.                        11270000
           PERFORM 0500-CALL-ACAT05DA.                                  11280000
           IF ACAT05IO-VTRNFR-FOUND                                     11290000
              SET ACAT05IO-SRCH-VASSET     TO TRUE                      11300000
              PERFORM 0510-RETRIEVE-DETAIL                              11310000
           ELSE                                                         11320000
              IF ACAT05IO-DB2-ERROR                                     11330000
                 MOVE 'SELECT'          TO WS-DB2-ERROR-FUNCTION        11340000
                 MOVE ACAT05IO-SQLCAID  TO WS-DB2-ERROR-TABLE           11350000
                 MOVE ACAT05IO-SQLCODE  TO WS-DB2-ERROR-ID              11360000
                 MOVE WS-DB2-ERROR-MSG  TO TWA-RETURN-MSG               11370000
                 PERFORM 0830-ERROR-RTN                                 11380000
              END-IF                                                    11390000
           END-IF.                                                      11400000
           MOVE ACAT05IO-AREA TO  TWA-ACAT05IO-AREA.                    11410000
           PERFORM 0405-MOVE-SV-KEYS.                                   11420000
           MOVE SPACES        TO M5ACCPTO, M5REJO, M5REJCO.             11430000
ET0001     MOVE SPACES        TO M5ACCELO.                              11440000
           MOVE EIBTRMID      TO TERM-ID.                               11450000
           MOVE 'ACA5'        TO TRAN-ID.                               11460000
           PERFORM 0600-DELETE-TSQ.                                     11470000
           PERFORM 0810-MAP-INPUT-AREA THRU 0810-EXIT.                  11480000
           PERFORM 0620-WRITE-TSQ                                       11490000
           SET DATA-ONLY TO TRUE.                                       11500000
           PERFORM 0800-SEND-MAP-RETURN.                                11510000
      /                                                                 11520000
       0380-NEXT-TFR-PF8.                                               11530000
      *===> SCROLL DOWN TO NEXT TRANSFER                                11540000
           MOVE EIBTRMID      TO TERM-ID.                               11550000
           MOVE 'ACA5'        TO TRAN-ID.                               11560000
           PERFORM 0610-READ-TSQ.                                       11570000
           IF TWA-CAME-FROM-PENDING OR                                  11580000
              TWA-SRCH-VTRNFR-PND                                       11590000
              MOVE '  **** PAGEING DOWN IS NOT AVAILABLE ****   '       11600000
              TO SYSTEM-MSG                                             11610000
              SET ERROR-YES TO TRUE                                     11620000
              SET DATA-ONLY TO TRUE                                     11630000
              PERFORM 0800-SEND-MAP-RETURN                              11640000
           END-IF.                                                      11650000
           MOVE LOW-VALUES TO ACAT05AO, ACAT05BO.                       11660000
           MOVE +0                 TO  TWA-SV-ASSET-SEQ-NBR.            11670000
           MOVE SPACES             TO  TWA-RETURN-MSG,                  11680000
                                       ACAT05IO-TWA-INPUT.              11690000
           MOVE TWA-ACAT05IO-AREA  TO  ACAT05IO-AREA.                   11700000
           SET ACAT05IO-FIRST-TIME  TO TRUE.                            11710000
           SET ACAT05IO-SRCH-VTRNFR     TO TRUE.                        11720000
           SET ACAT05IO-SRCH-VTRNFR-FWD TO TRUE.                        11730000
           SET ACAT05IO-SRCH-VASSET-FWD TO TRUE.                        11740000
           PERFORM 0500-CALL-ACAT05DA.                                  11750000
           IF ACAT05IO-VTRNFR-FOUND                                     11760000
              SET ACAT05IO-SRCH-VASSET     TO TRUE                      11770000
              PERFORM 0510-RETRIEVE-DETAIL                              11780000
           ELSE                                                         11790000
              IF ACAT05IO-DB2-ERROR                                     11800000
                 MOVE 'SELECT'          TO WS-DB2-ERROR-FUNCTION        11810000
                 MOVE ACAT05IO-SQLCAID  TO WS-DB2-ERROR-TABLE           11820000
                 MOVE ACAT05IO-SQLCODE  TO WS-DB2-ERROR-ID              11830000
                 MOVE WS-DB2-ERROR-MSG  TO TWA-RETURN-MSG               11840000
                 PERFORM 0830-ERROR-RTN                                 11850000
              END-IF                                                    11860000
           END-IF.                                                      11870000
           MOVE ACAT05IO-AREA TO  TWA-ACAT05IO-AREA.                    11880000
           PERFORM 0405-MOVE-SV-KEYS.                                   11890000
           MOVE SPACES        TO  M5REJO, M5REJCO, M5ACCPTO.            11900000
ET0001     MOVE SPACES        TO  M5ACCELO.                             11910000
           MOVE EIBTRMID      TO TERM-ID.                               11920000
           MOVE 'ACA5'        TO TRAN-ID.                               11930000
           PERFORM 0600-DELETE-TSQ.                                     11940000
           PERFORM 0810-MAP-INPUT-AREA THRU 0810-EXIT.                  11950000
           PERFORM 0620-WRITE-TSQ                                       11960000
           SET DATA-ONLY TO TRUE.                                       11970000
           PERFORM 0800-SEND-MAP-RETURN.                                11980000
      /                                                                 11990000
       0390-VIEW-FUND-REG.                                              12000000
     *                                                                  12010000
LRM003     MOVE EIBTRMID   TO TERM-ID                                   12020000
LRM003     MOVE 'ACA5'     TO TRAN-ID                                   12030000
LRM003     PERFORM 0610-READ-TSQ                                        12040000
LRM003     MOVE TWA-ACAT05IO-AREA TO ACAT05IO-AREA                      12050000
           IF TWA-STTLM-LOCATION = '10'                                 12060000
LRM004     AND TWA-STTS-CD <= '310'                                     12070000
               MOVE EIBTRMID TO TERM-ID                                 12080000
               MOVE 'AMFX' TO  TRAN-ID                                  12090000
               INITIALIZE ACAT0F01-COMMAREA                             12100000
               PERFORM 0630-BUILD-ACAT0F01-TS-RTN                       12110000
               MOVE 'ACAT0FCP' TO CALLED-PROGRAM-NAME                   12120000
               PERFORM 0710-INVOKE-DETAIL-PROGRAM-RTN                   12130000
           ELSE                                                         12140000
               MOVE LOW-VALUE TO ACAT05AO ACAT05BO                      12150000
               MOVE EIBTRMID         TO TERM-ID                         12160000
               MOVE 'ACA5'           TO TRAN-ID                         12170000
               PERFORM 0610-READ-TSQ                                    12180000
LRM004         IF TWA-STTS-CD > '310'                                   12190000
LRM004           MOVE ' PF9 NOT AVAILABLE FOR TIF STATUS' TO            12200000
LRM004              SYSTEM-MSG                                          12210000
LRM004         ELSE                                                     12220000
                 MOVE ' ASSET DOES NOT HAVE FUND/REG INFO' TO           12230000
                    SYSTEM-MSG                                          12240000
LRM004         END-IF                                                   12250000
               MOVE ATT-UNPROT-BRT TO M5NEXTA                           12260000
               SET CURSOR-ON-M5NEXT TO TRUE                             12270000
               SET ERROR-YES TO TRUE                                    12280000
               PERFORM 0830-ERROR-RTN                                   12290000
           END-IF.                                                      12300000
     /                                                                  12310000
       0400-DISPLAY-ACAT05M.                                            12320000
      ***************************************************************** 12330000
      **     THIS ROUTINE SHOULD RETRIEVE INFO FROM ACAT_TRNFR       ** 12340000
      **          ACAT_INT_TRNF  ACAT_ASSET                          ** 12350000
      ***************************************************************** 12360000
                                                                        12370000
           IF FIRST-TIME                                                12380000
              MOVE 'N' TO FIRST-TIME-FLAG                               12390000
              IF TWA-CAME-FROM-PENDING                                  12400000
                 SET ACAT05IO-SRCH-VTRNFR     TO TRUE                   12410000
                 SET ACAT05IO-SRCH-VTRNFR-PND TO TRUE                   12420000
                 MOVE ACAT-CONTROL-NBR  TO ACAT05IO-SV-ACAT-CNTL-NBR    12430000
              ELSE                                                      12440000
                 SET ACAT05IO-SRCH-VTRNFR     TO TRUE                   12450000
                 SET ACAT05IO-SRCH-VTRNFR-FWD TO TRUE                   12460000
              END-IF                                                    12470000
           ELSE                                                         12480000
              SET ACAT05IO-SRCH-VTRNFR TO TRUE                          12490000
           END-IF.                                                      12500000
      *                                                                 12510000
           MOVE TWA-CLIENT-NO-9      TO ACAT05IO-SV-CLIENT-NBR.         12520000
      *                                                                 12530000
           PERFORM 0500-CALL-ACAT05DA.                                  12540000
           IF ACAT05IO-VTRNFR-FOUND                                     12550000
              SET ACAT05IO-SRCH-VASSET-FWD TO TRUE                      12560000
              PERFORM 0510-RETRIEVE-DETAIL                              12570000
              IF ACAT05IO-DB2-ERROR                                     12580000
                 MOVE 'SELECT'          TO WS-DB2-ERROR-FUNCTION        12590000
                 MOVE ACAT05IO-SQLCAID  TO WS-DB2-ERROR-TABLE           12600000
                 MOVE ACAT05IO-SQLCODE  TO WS-DB2-ERROR-ID              12610000
                 MOVE WS-DB2-ERROR-MSG  TO TWA-RETURN-MSG               12620000
                 PERFORM 0830-ERROR-RTN                                 12630000
              END-IF                                                    12640000
           END-IF.                                                      12650000
           MOVE ACAT05IO-AREA TO  TWA-ACAT05IO-AREA.                    12660000
           PERFORM 0405-MOVE-SV-KEYS.                                   12670000
           MOVE EIBTRMID      TO TERM-ID.                               12680000
           MOVE 'ACA5'        TO TRAN-ID.                               12690000
           PERFORM 0600-DELETE-TSQ.                                     12700000
           MOVE SPACES TO M5ACCPTO, M5REJO, M5REJCO.                    12710000
ET0001     MOVE SPACES TO M5ACCELO.                                     12720000
           PERFORM 0810-MAP-INPUT-AREA THRU 0810-EXIT.                  12730000
           PERFORM 0620-WRITE-TSQ.                                      12740000
           PERFORM 0800-SEND-MAP-RETURN.                                12750000
      /                                                                 12760000
       0405-MOVE-SV-KEYS.                                               12770000
           MOVE TWA-CLIENT-NBR       TO  TWA-SV-CLIENT-NBR.             12780000
           MOVE TWA-ACAT-CONTROL-NBR TO  TWA-SV-ACAT-CNTL-NO.           12790000
           MOVE TWA-BRANCH-CD        TO  TWA-SV-BRANCH-CD.              12800000
           MOVE TWA-ACCT-CD          TO  TWA-SV-ACCT-CD.                12810000
           MOVE TWA-RR-CD            TO  TWA-SV-RR-CD.                  12820000
           MOVE TWA-DLVR-NBR         TO  TWA-SV-BRKR.                   12830000
           MOVE TWA-TFR-TYPE         TO  TWA-SV-TFR.                    12840000
      *                                                                 12850000
       0410-EDIT-INPUT-FIELDS.                                          12860000
ET0006     MOVE ATT-ASKIP TO M5TAGA.                                    12870000
ET0006                                                                  12880000
ET0006     IF  (TWA-TFR-TYPE = 'FRV' OR 'MFC')                          12890000
ET0006     AND (TWA-STTS-CD = '200')                                    12900000
ET0006     AND (WS-UPDATE-OK)                                           12910000
ET0006          PERFORM 0411-CAGE-TAG-RTN                               12920000
ET0006     END-IF.                                                      12930000
      *                                                                 12940000
           IF TWA-VINITRNF-NSCC-PEND-CD = 'Y'                           12950000
              MOVE ATT-ASKIP  TO M5REJA, M5REJCA, M5ACCPTA              12960000
ET0001                           M5ACCELA                               12970000
              MOVE EIBTRMID   TO TERM-ID                                12980000
              MOVE 'ACA5'     TO TRAN-ID                                12990000
              PERFORM 0600-DELETE-TSQ                                   13000000
ET0001*       MOVE SPACES  TO  M5REJO, M5REJCO, M5ACCPTA                13010000
ET0001        MOVE SPACES  TO  M5REJO, M5REJCO, M5ACCPTO M5ACCELO       13020000
              PERFORM 0810-MAP-INPUT-AREA THRU 0810-EXIT                13030000
              PERFORM 0620-WRITE-TSQ                                    13040000
              PERFORM 0800-SEND-MAP-RETURN                              13050000
           ELSE                                                         13060000
ET0001        PERFORM 0413-INPUT-TO-TWA-FLDS                            13070000
              MOVE ATT-UNPROT TO  M5REJA, M5REJCA, M5ACCPTA             13080000
ET0001        IF TWA-TFR-TYPE = 'RCL'                                   13090000
ET0001           MOVE ATT-UNPROT TO M5ACCELA                            13100000
ET0001        ELSE                                                      13110000
ET0001           MOVE ATT-ASKIP  TO M5ACCELA                            13120000
ET0001        END-IF                                                    13130000
              SET CURSOR-ON-M5NEXT TO TRUE                              13140000
           END-IF.                                                      13150000
      *                                                                 13160000
ET0001**   IF M5REJL  =  +0    AND                                      13170000
ET0001**      M5REJCL =  +0    AND                                      13180000
ET0001**      M5ACCPTL = +0                                             13190000
ET0001**      SET NO-INPUT     TO  TRUE                                 13200000
ET0001**      MOVE ATT-UNPROT TO  M5REJA, M5REJCA, M5ACCPTA             13210000
ET0001**   END-IF.                                                      13220000
ET0001     IF  (M5REJL  =  +0  AND  NOT WS-REJ-ERASED)                  13230000
ET0001     AND (M5REJCL =  +0  AND  NOT WS-REJ-CMNT-ERASED)             13240000
ET0001     AND (M5ACCPTL = +0  AND  NOT WS-ACCEPT-ERASED)               13250000
ET0001     AND (M5ACCELL = +0  AND  NOT WS-ACCEL-ERASED)                13260000
ET0001        SET NO-INPUT     TO  TRUE                                 13270000
ET0001     END-IF.                                                      13280000
      *                                                                 13290000
           IF (M5REJL  > +0  OR                                         13300000
               M5REJCL > +0 )  AND                                      13310000
               M5ACCPTL > +0                                            13320000
ET0001        MOVE SPACE TO TWA-M5REJ TWA-M5REJC TWA-M5ACCPT            13330000
              MOVE ' CANNOT REJECT AND ACCEPT AT SAME TIME' TO          13340000
                   SYSTEM-MSG                                           13350000
              SET ERROR-YES        TO TRUE                              13360000
              SET CURSOR-ON-M5REJ  TO TRUE                              13370000
              MOVE ATT-UNPROT-BRT  TO M5REJCA M5ACCPTA                  13380000
              PERFORM 0830-ERROR-RTN                                    13390000
ET0001     ELSE                                                         13400000
ET0001     IF (M5REJL   > +0 OR WS-REJ-ERASED  ) AND                    13410000
ET0001        (M5ACCELL > +0 OR WS-ACCEL-ERASED)                        13420000
ET0001        MOVE SPACE TO TWA-M5REJ TWA-M5ACCEL                       13430000
ET0001        MOVE 'BOTH "REJECT" AND "ACCELERATE" CAN NOT BE PROCESSED 13440000
ET0001-            'AT THE SAME TIME'                                   13450000
ET0001          TO  SYSTEM-MSG                                          13460000
ET0001        SET ERROR-YES        TO TRUE                              13470000
ET0001        SET CURSOR-ON-M5REJ  TO TRUE                              13480000
ET0001        MOVE ATT-UNPROT-BRT  TO M5REJA M5ACCELA                   13490000
ET0001        PERFORM 0830-ERROR-RTN                                    13500000
ET0001     ELSE                                                         13510000
ET0001     IF (M5REJCL  > +0 OR WS-REJ-CMNT-ERASED) AND                 13520000
ET0001        (M5ACCELL > +0 OR WS-ACCEL-ERASED   )                     13530000
ET0001        MOVE SPACE TO TWA-M5REJC TWA-M5ACCEL                      13540000
ET0001        MOVE '"REJECT W/CMNT" AND "ACCELERATE" CAN NOT BE PROCESSE13550000
ET0001-            'D AT THE SAME TIME'                                 13560000
ET0001          TO  SYSTEM-MSG                                          13570000
ET0001        SET ERROR-YES        TO TRUE                              13580000
ET0001        SET CURSOR-ON-M5REJC TO TRUE                              13590000
ET0001        MOVE ATT-UNPROT-BRT  TO M5REJCA M5ACCELA                  13600000
ET0001        PERFORM 0830-ERROR-RTN                                    13610000
           END-IF.                                                      13620000
                                                                        13630000
ET0001**   IF M5REJL > +0  AND                                          13640000
ET0001**      M5REJCL > +0                                              13650000
ET0001**      MOVE ' CANNOT ENTER BOTH FIELDS AT SAME TIME' TO          13660000
ET0001**           SYSTEM-MSG                                           13670000
ET0001**      SET ERROR-YES        TO TRUE                              13680000
ET0001**      SET CURSOR-ON-M5REJ  TO TRUE                              13690000
ET0001**      MOVE ATT-UNPROT-BRT  TO M5REJCA                           13700000
ET0001**      PERFORM 0830-ERROR-RTN                                    13710000
ET0001**   END-IF.                                                      13720000
                                                                        13730000
ET0001     IF  (M5REJL  > +0 OR WS-REJ-ERASED)                          13740000
ET0001     AND (M5REJCL > +0 OR WS-REJ-CMNT-ERASED)                     13750000
ET0001        IF TWA-INIT-TRANS-TYPE-CD = 'R'                           13760000
ET0001           IF (TWA-M5REJ = SPACE) AND (TWA-M5REJC = SPACE)        13770000
ET0001              MOVE 'SPACES NOT ALLOWED IN BOTH REJECT FIELDS AT SA13780000
ET0001-                  'ME TIME'                                      13790000
ET0001                TO  SYSTEM-MSG                                    13800000
ET0001              SET ERROR-YES        TO TRUE                        13810000
ET0001              SET CURSOR-ON-M5REJ  TO TRUE                        13820000
ET0001              MOVE ATT-UNPROT-BRT  TO M5REJA M5REJCA              13830000
ET0001              PERFORM 0830-ERROR-RTN                              13840000
ET0001           END-IF                                                 13850000
ET0001        ELSE                                                      13860000
ET0001           IF (TWA-M5REJ > SPACE) AND (TWA-M5REJC > SPACE)        13870000
ET0001              MOVE 'MULTIPLE REJECT ENTRIES ARE NOT PERMITTED'    13880000
ET0001                TO  SYSTEM-MSG                                    13890000
ET0001              SET ERROR-YES        TO TRUE                        13900000
ET0001              SET CURSOR-ON-M5REJ  TO TRUE                        13910000
ET0001              MOVE ATT-UNPROT-BRT  TO M5REJA M5REJCA              13920000
ET0001              PERFORM 0830-ERROR-RTN                              13930000
ET0001           END-IF                                                 13940000
ET0001        END-IF                                                    13950000
ET0001     END-IF.                                                      13960000
                                                                        13970000
ET0001**   IF M5REJL > +0                                               13980000
ET0001**      MOVE M5REJI   TO TWA-M5REJ                                13990000
ET0001**   END-IF.                                                      14000000
ET0001**   IF M5REJCL > +0                                              14010000
ET0001**      MOVE M5REJCI  TO TWA-M5REJC                               14020000
ET0001**   END-IF.                                                      14030000
ET0001                                                                  14040000
LRM026     IF  (TWA-INIT-TRANS-TYPE-CD = SPACE OR LOW-VALUE)            14050002
LRM026     AND M5ACCELL > 0                                             14080008
LRM026     AND (TWA-M5ACCEL = 'Y' OR 'S')                               14081006
LRM026     AND TWA-TFR-TYPE = 'RCL'                                     14090002
LRM026     AND TWA-STTLM-TM-CD = 'L'                                    14092002
LRM026        MOVE 'ACCELERATION NOT PERMITTED FOR "RCL" ON DAY=3'      14092102
LRM026            TO  SYSTEM-MSG                                        14092302
LRM026         SET ERROR-YES         TO TRUE                            14092402
LRM026         SET CURSOR-ON-M5ACCEL TO TRUE                            14092502
LRM026         MOVE ATT-UNPROT-BRT   TO M5ACCELA                        14092602
LRM026         PERFORM 0830-ERROR-RTN                                   14092702
LRM026     ELSE                                                         14093002
ET0001     IF  (TWA-INIT-TRANS-TYPE-CD = SPACE OR LOW-VALUE)            14094002
ET0001     AND (TWA-VTRNFR-NSCC-PEND-CD = SPACE OR LOW-VALUE)           14095002
ET0001        IF  (M5ACCPTL > 0 AND TWA-M5ACCPT = 'S')                  14096002
ET0001        AND (M5ACCELL > 0 AND TWA-M5ACCEL = 'S')                  14097002
ET0001           IF TWA-TFR-TYPE = 'RCL'                                14098002
ET0001              SET WS-ACCEPT-N-XCEL    TO TRUE                     14100002
ET0001              PERFORM 0450-PROCESS-INPUT                          14110002
ET0001           ELSE                                                   14120000
ET0001             MOVE 'ACCELERATION PERMITTED FOR "RCL" TRANSFER ONLY'14130000
ET0001               TO  SYSTEM-MSG                                     14140000
ET0001              SET ERROR-YES         TO TRUE                       14150000
ET0001              SET CURSOR-ON-M5ACCEL TO TRUE                       14160000
ET0001              MOVE ATT-UNPROT-BRT   TO M5ACCELA                   14170000
ET0001              PERFORM 0830-ERROR-RTN                              14180000
ET0001           END-IF                                                 14190000
ET0001        END-IF                                                    14200000
ET0001     ELSE                                                         14210000
ET0001     IF  (TWA-INIT-TRANS-TYPE-CD  = 'X')                          14220000
ET0001     AND (TWA-VTRNFR-NSCC-PEND-CD = 'A')                          14230000
ET0001        IF  ((M5ACCPTL > 0 OR WS-ACCEPT-ERASED)                   14240000
ET0001              AND (TWA-M5ACCPT = SPACE ))                         14250000
ET0001        AND ((M5ACCELL > 0 OR WS-ACCEL-ERASED)                    14260000
ET0001              AND (TWA-M5ACCEL = SPACE ))                         14270000
ET0001           SET WS-UNACCEPT-N-UNXCEL TO TRUE                       14280000
ET0001           PERFORM 0450-PROCESS-INPUT                             14290000
ET0001        END-IF                                                    14300000
ET0001     END-IF.                                                      14310000
ET0001                                                                  14320000
           IF M5ACCPTL > +0                                             14330000
ET0001     OR WS-ACCEPT-ERASED                                          14340000
              MOVE M5ACCPTI  TO TWA-M5ACCPT                             14350000
              PERFORM 0440-VALIDATE-ACCEPT-FIELD                        14360000
           END-IF.                                                      14370000
      *                                                                 14380000
ET0001     IF M5ACCELL > +0                                             14390000
ET0001     OR WS-ACCEL-ERASED                                           14400000
ET0001         PERFORM 0445-VALIDATE-ACCELERATE                         14410000
ET0001     END-IF.                                                      14420000
      *                                                                 14430000
           IF TWA-INIT-TRANS-TYPE-CD = 'R'                              14440000
ET0007        MOVE SPACE TO WS-REJECT-SELECTED-SW                       14450000
ET0007                      WS-REJECT-CMNT-SELECTED-SW                  14460000
              PERFORM 0430-VALIDATE-R-FIELDS                            14470000
ET0007           THRU 0430-EXIT                                         14480000
ET0007        IF WS-REJECT-SELECTED OR WS-REJECT-CMNT-SELECTED          14490000
ET0007           PERFORM 0420-VALIDATE-NON-R-FIELDS                     14500000
ET0007        END-IF                                                    14510000
           ELSE                                                         14520000
              PERFORM 0420-VALIDATE-NON-R-FIELDS                        14530000
           END-IF.                                                      14540000
      *                                                                 14550000
       0410-EXIT.                                                       14560000
           EXIT.                                                        14570000
      /                                                                 14580000
ET0006 0411-CAGE-TAG-RTN.                                               14590000
           IF M5TAGL > +0                                               14600000
              IF M5TAGO = TWA-CAGE-TAG                                  14610000
                 CONTINUE                                               14620000
              ELSE                                                      14630000
                 MOVE M5TAGO  TO TWA-CAGE-TAG                           14640000
              END-IF                                                    14650000
           ELSE                                                         14660000
              IF M5TAGA = ERASE-KEY                                     14670000
                 MOVE SPACE   TO TWA-CAGE-TAG                           14680000
              END-IF                                                    14690000
           END-IF.                                                      14700000
           IF TWA-CAGE-TAG = LOW-VALUE                                  14710000
              MOVE SPACE TO  TWA-CAGE-TAG                               14720000
           END-IF.                                                      14730000
           MOVE ATT-UNPROT TO M5TAGA.                                   14740000
                                                                        14750000
           IF TWA-CAGE-TAG = TWA-CAGE-TAG-PREV                          14760000
              CONTINUE                                                  14770000
           ELSE                                                         14780000
              MOVE TWA-CAGE-TAG          TO TWA-CAGE-TAG-PREV           14790000
              MOVE SPACE                 TO TWA-SRCH-ACTION             14800000
              SET TWA-UPDATE-VASSET      TO TRUE                        14810000
              MOVE TWA-ACAT05IO-AREA     TO ACAT05IO-AREA               14820000
              PERFORM 0500-CALL-ACAT05DA                                14830000
              MOVE ACAT05IO-AREA         TO TWA-ACAT05IO-AREA           14840000
           END-IF.                                                      14850000
      /                                                                 14860000
ET0001 0413-INPUT-TO-TWA-FLDS.                                          14870000
           IF M5REJL > +0                                               14880000
              IF M5REJO = TWA-M5REJ                                     14890000
                 CONTINUE                                               14900000
              ELSE                                                      14910000
                 MOVE M5REJO  TO TWA-M5REJ                              14920000
              END-IF                                                    14930000
           ELSE                                                         14940000
              IF M5REJA = ERASE-KEY                                     14950000
                 MOVE SPACE   TO TWA-M5REJ                              14960000
                 SET WS-REJ-ERASED TO TRUE                              14970000
              END-IF                                                    14980000
           END-IF.                                                      14990000
           IF TWA-M5REJ = LOW-VALUE                                     15000000
              MOVE SPACE TO  TWA-M5REJ.                                 15010000
                                                                        15020000
           IF M5REJCL > +0                                              15030000
              IF M5REJCO = TWA-M5REJC                                   15040000
                 CONTINUE                                               15050000
              ELSE                                                      15060000
                 MOVE M5REJCO TO TWA-M5REJC                             15070000
              END-IF                                                    15080000
           ELSE                                                         15090000
              IF M5REJCA = ERASE-KEY                                    15100000
                 MOVE SPACE   TO TWA-M5REJC                             15110000
                 SET WS-REJ-CMNT-ERASED TO TRUE                         15120000
              END-IF                                                    15130000
           END-IF.                                                      15140000
           IF TWA-M5REJC = LOW-VALUE                                    15150000
              MOVE SPACE TO  TWA-M5REJC.                                15160000
                                                                        15170000
           IF M5ACCPTL > +0                                             15180000
              IF M5ACCPTO = TWA-M5ACCPT                                 15190000
                 CONTINUE                                               15200000
              ELSE                                                      15210000
                 MOVE M5ACCPTO TO TWA-M5ACCPT                           15220000
              END-IF                                                    15230000
           ELSE                                                         15240000
              IF M5ACCPTA = ERASE-KEY                                   15250000
                 MOVE SPACE   TO TWA-M5ACCPT                            15260000
                 SET WS-ACCEPT-ERASED TO TRUE                           15270000
              END-IF                                                    15280000
           END-IF.                                                      15290000
           IF TWA-M5ACCPT = LOW-VALUE                                   15300000
              MOVE SPACE TO  TWA-M5ACCPT.                               15310000
                                                                        15320000
           IF M5ACCELL > +0                                             15330000
              IF M5ACCELO = TWA-M5ACCEL                                 15340000
                 CONTINUE                                               15350000
              ELSE                                                      15360000
                 MOVE M5ACCELO TO TWA-M5ACCEL                           15370000
              END-IF                                                    15380000
           ELSE                                                         15390000
              IF M5ACCELA = ERASE-KEY                                   15400000
                 MOVE SPACE   TO TWA-M5ACCEL                            15410000
                 SET WS-ACCEL-ERASED TO TRUE                            15420000
              END-IF                                                    15430000
           END-IF.                                                      15440000
           IF TWA-M5ACCEL = LOW-VALUE                                   15450000
              MOVE SPACE TO  TWA-M5ACCEL.                               15460000
                                                                        15470000
      ***************************************************************** 15480000
       0415-EDIT-ACAT00M-RTN.                                           15490000
      *----------------------------------------------------------------*15500000
      *             EDIT  TRAILER  MAP   (SEARCH BAR ENTRIES)          *15510000
      *----------------------------------------------------------------*15520000
      *                                                                 15530000
           MOVE LOW-VALUES  TO ACAT05IO-SAVE-KEYS, ACAT05IO-DA,         15540000
                               ACAT05IO-SEARCH-VTRNFR.                  15550000
                                                                        15560000
           MOVE ZERO    TO ACAT05IO-BAL01, ACAT05IO-BAL02,              15570000
                           ACAT05IO-BAL05.                              15580000
      *                                                                 15590000
           MOVE TWA-CLIENT-NO-9      TO TWA-SV-CLIENT-NBR.              15600000
      *                                                                 15610000
           IF MMBRL > 0                                                 15620000
              SET ACAT-SRCH-ENTRY   TO TRUE                             15630000
              IF MMBRI = SPACES                                         15640000
                 MOVE SPACES TO ACAT-INP-BRANCH, TWA-MBR                15650000
                                TWA-SV-BRANCH-CD                        15660000
              ELSE                                                      15670000
                 MOVE MMBRI TO ACAT-INP-BRANCH, TWA-MBR                 15680000
                                TWA-SV-BRANCH-CD                        15690000
              END-IF                                                    15700000
           ELSE                                                         15710000
              IF MMBRA = ERASE-KEY                                      15720000
                 MOVE SPACES TO ACAT-INP-BRANCH, TWA-MBR                15730000
                                TWA-SV-BRANCH-CD                        15740000
              ELSE                                                      15750000
                 MOVE ACAT-INP-BRANCH  TO  TWA-MBR                      15760000
                                           TWA-SV-BRANCH-CD             15770000
              END-IF                                                    15780000
           END-IF.                                                      15790000
                                                                        15800000
           IF MMACL > 0                                                 15810000
              SET ACAT-SRCH-ENTRY TO TRUE                               15820000
              IF MMACI = SPACES                                         15830000
                 MOVE SPACES TO ACAT-INP-ACCOUNT, TWA-MAC               15840000
                                TWA-SV-ACCT-CD                          15850000
              ELSE                                                      15860000
                 MOVE MMACI TO ACAT-INP-ACCOUNT, TWA-MAC                15870000
                                TWA-SV-ACCT-CD                          15880000
              END-IF                                                    15890000
           ELSE                                                         15900000
              IF MMACA = ERASE-KEY                                      15910000
                 MOVE SPACES TO ACAT-INP-ACCOUNT, TWA-MAC               15920000
                                TWA-SV-ACCT-CD                          15930000
              ELSE                                                      15940000
                 MOVE ACAT-INP-ACCOUNT TO  TWA-MAC, TWA-SV-ACCT-CD      15950000
              END-IF                                                    15960000
           END-IF.                                                      15970000
                                                                        15980000
           IF MMRRL > 0                                                 15990000
              SET ACAT-SRCH-ENTRY TO TRUE                               16000000
              IF MMRRI = SPACES                                         16010000
                 MOVE SPACES TO ACAT-INP-RR, TWA-MRR, TWA-SV-RR-CD      16020000
              ELSE                                                      16030000
                 MOVE MMRRI TO ACAT-INP-RR, TWA-MRR,  TWA-SV-RR-CD      16040000
              END-IF                                                    16050000
           ELSE                                                         16060000
              IF MMRRA = ERASE-KEY                                      16070000
                 MOVE SPACES TO ACAT-INP-RR, TWA-SV-RR-CD, TWA-MRR,     16080000
              ELSE                                                      16090000
                 MOVE ACAT-INP-RR  TO  TWA-SV-RR-CD, TWA-MRR,           16100000
              END-IF                                                    16110000
           END-IF.                                                      16120000
                                                                        16130000
           IF MMTFRL > 0                                                16140000
              SET ACAT-SRCH-ENTRY TO TRUE                               16150000
              IF MMTFRI = SPACES                                        16160000
ET0001**         MOVE SPACES TO ACAT-INP-TFR-TYP,TWA-TFR-TYPE, TWA-MTFR 16170000
ET0001           MOVE SPACES TO ACAT-INP-TFR-TYP TWA-SV-TFR    TWA-MTFR 16180000
              ELSE                                                      16190000
ET0001**         MOVE MMTFRI TO ACAT-INP-TFR-TYP, TWA-TFR-TYPE, TWA-MTFR16200000
ET0001           MOVE MMTFRI TO ACAT-INP-TFR-TYP  TWA-SV-TFR    TWA-MTFR16210000
              END-IF                                                    16220000
           ELSE                                                         16230000
              IF MMTFRA = ERASE-KEY                                     16240000
ET0001**         MOVE SPACES TO ACAT-INP-TFR-TYP, TWA-TFR-TYPE, TWA-MTFR16250000
ET0001           MOVE SPACES TO ACAT-INP-TFR-TYP  TWA-SV-TFR    TWA-MTFR16260000
              ELSE                                                      16270000
ET0001**         MOVE ACAT-INP-TFR-TYP TO TWA-TFR-TYPE, TWA-MTFR        16280000
ET0001           MOVE ACAT-INP-TFR-TYP TO TWA-SV-TFR    TWA-MTFR        16290000
              END-IF                                                    16300000
           END-IF.                                                      16310000
                                                                        16320000
           IF MMBKRL > 0                                                16330000
              SET ACAT-SRCH-ENTRY TO TRUE                               16340000
              IF MMBKRI = SPACES                                        16350000
                 MOVE SPACES TO ACAT-INP-CONTRA-BKR,                    16360000
                                TWA-SV-BRKR, TWA-MCBRKR                 16370000
              ELSE                                                      16380000
                 MOVE MMBKRI TO ACAT-INP-CONTRA-BKR,                    16390000
                                TWA-SV-BRKR, TWA-MCBRKR                 16400000
              END-IF                                                    16410000
           ELSE                                                         16420000
              IF MMBKRA = ERASE-KEY                                     16430000
                 MOVE SPACES TO ACAT-INP-CONTRA-BKR,                    16440000
                                TWA-SV-BRKR, TWA-MCBRKR                 16450000
              ELSE                                                      16460000
                 MOVE ACAT-INP-CONTRA-BKR TO TWA-SV-BRKR, TWA-MCBRKR    16470000
              END-IF                                                    16480000
           END-IF.                                                      16490000
                                                                        16500000
           IF MMSTATL > 0                                               16510000
              SET ACAT-SRCH-ENTRY TO TRUE                               16520000
              IF MMSTATI = SPACES                                       16530000
                 MOVE SPACES TO ACAT-INP-STATUS, TWA-SV-STCD TWA-MSTAT  16540000
              ELSE                                                      16550000
                 MOVE MMSTATI TO ACAT-INP-STATUS, TWA-SV-STCD, TWA-MSTAT16560000
                 EVALUATE TWA-MSTAT                                     16570000
                    WHEN 'REQ'  MOVE  '100' TO TWA-SV-STCD              16580000
                    WHEN 'RQA'  MOVE  '110' TO TWA-SV-STCD              16590000
                    WHEN 'RAP'  MOVE  '120' TO TWA-SV-STCD              16600000
                    WHEN 'RQP'  MOVE  '130' TO TWA-SV-STCD              16610000
                    WHEN 'RQR'  MOVE  '140' TO TWA-SV-STCD              16620000
                    WHEN 'REV'  MOVE  '200' TO TWA-SV-STCD              16630000
                    WHEN 'RVA'  MOVE  '210' TO TWA-SV-STCD              16640000
                    WHEN 'RVE'  MOVE  '220' TO TWA-SV-STCD              16650000
                    WHEN 'RVX'  MOVE  '230' TO TWA-SV-STCD              16660000
                    WHEN 'STP'  MOVE  '300' TO TWA-SV-STCD              16670000
                    WHEN 'STC'  MOVE  '310' TO TWA-SV-STCD              16680000
                    WHEN 'CLP'  MOVE  '400' TO TWA-SV-STCD              16690000
                    WHEN 'PUR'  MOVE  '500' TO TWA-SV-STCD              16700000
                    WHEN 'MPP'  MOVE  '510' TO TWA-SV-STCD              16710000
                    WHEN 'REJ'  MOVE  '600' TO TWA-SV-STCD              16720000
                 END-EVALUATE                                           16730000
              END-IF                                                    16740000
           ELSE                                                         16750000
              IF MMSTATA = ERASE-KEY                                    16760000
                 MOVE SPACES TO ACAT-INP-STATUS, TWA-MSTAT, TWA-SV-STCD 16770000
              ELSE                                                      16780000
                 MOVE ACAT-INP-STATUS TO TWA-SV-STCD, TWA-MSTAT         16790000
              END-IF                                                    16800000
           END-IF.                                                      16810000
                                                                        16820000
           IF (ACAT-INP-BRANCH = SPACES OR LOW-VALUES)     AND          16830000
              (ACAT-INP-ACCOUNT = SPACES OR LOW-VALUES)    AND          16840000
              (ACAT-INP-RR = SPACE OR LOW-VALUES)          AND          16850000
              (ACAT-INP-TFR-TYP = SPACES OR LOW-VALUES)    AND          16860000
              (ACAT-INP-RCV-DEL = SPACE  OR LOW-VALUES)    AND          16870000
              (ACAT-INP-CONTRA-BKR = SPACES OR LOW-VALUES) AND          16880000
              (ACAT-INP-STATUS = SPACES OR LOW-VALUES)     AND          16890000
              (ACAT-INP-STTL-DT = SPACES OR LOW-VALUES)                 16900000
               MOVE SPACES TO ACAT-SEARCH-RETURN                        16910000
               SET ACAT-NO-SRCH-ENTRY TO TRUE                           16920000
           END-IF.                                                      16930000
     *                                                                  16940000
           IF ACAT-SRCH-ENTRY                                           16950000
              MOVE SPACES TO ACAT-SEARCH-RETURN                         16960000
              PERFORM 0490-CALL-ACATSRCH-RTN                            16970000
              IF ACAT-SRCH-MSG = SPACES OR LOW-VALUES                   16980000
                 CONTINUE                                               16990000
              ELSE                                                      17000000
                 MOVE ACAT-SRCH-MSG TO SYSTEM-MSG                       17010000
                 SET ERROR-YES TO TRUE                                  17020000
                 PERFORM 0830-ERROR-RTN                                 17030000
              END-IF                                                    17040000
           END-IF.                                                      17050000
                                                                        17060000
       EJECT                                                            17070000
                                                                        17080000
      ***************************************************************** 17090000
      /                                                                 17100000
       0420-VALIDATE-NON-R-FIELDS.                                      17110000
      *                                                                 17120000
           IF TWA-M5REJ   > SPACE  AND                                  17130000
              TWA-M5REJC  > SPACE                                       17140000
ET0001        MOVE ATT-UNPROT-BRT TO M5REJA M5REJCA                     17150000
              SET CURSOR-ON-M5REJ TO TRUE                               17160000
              MOVE ' ONLY ONE SELECTION IS PERMITTED'                   17170000
              TO SYSTEM-MSG                                             17180000
              PERFORM 0830-ERROR-RTN                                    17190000
           END-IF.                                                      17200000
      *                                                                 17210000
ET0001     IF TWA-M5REJ = 'S'                                           17220000
ET0001        IF TWA-INIT-TRANS-TYPE-CD = 'X'                           17230000
ET0001           SET CURSOR-ON-M5REJ TO TRUE                            17240000
ET0001           MOVE 'REJECT NOT PERMITTED - ALREADY ACCELERATED'      17250000
ET0001             TO  SYSTEM-MSG                                       17260000
ET0001           PERFORM 0830-ERROR-RTN                                 17270000
ET0001        END-IF                                                    17280000
ET0001     END-IF.                                                      17290000
ET0001     IF TWA-M5REJC = 'S'                                          17300000
ET0001        IF TWA-INIT-TRANS-TYPE-CD = 'X'                           17310000
ET0001           SET CURSOR-ON-M5REJC TO TRUE                           17320000
ET0001           MOVE 'REJECT CMNT NOT PERMITTED - ALREADY ACCELERATED' 17330000
ET0001             TO  SYSTEM-MSG                                       17340000
ET0001           PERFORM 0830-ERROR-RTN                                 17350000
ET0001        END-IF                                                    17360000
ET0001     END-IF.                                                      17370000
      ***************************************************************** 17380000
      *****                                                             17390000
ET0001**   IF M5REJL > +0                                               17400000
ET0001     IF M5REJL > +0  OR WS-REJ-ERASED                             17410000
LRM020        IF TWA-M5REJ = 'Y'                                        17420000
LRM020           MOVE 'S' TO TWA-M5REJ ACAT05IO-M5REJ                   17430000
LRM020        END-IF                                                    17440000
              IF TWA-M5REJ = 'S'                                        17450000
                 IF WS-UPDATE-OK                                        17460000
LRM017           AND (NOT ACAT-ASCENDIS-CLIENT                          17470000
LRM017            OR (ACAT-ASCENDIS-CLIENT                              17480000
LRM017            AND (TWA-TFR-TYPE NOT = 'PTR' AND 'PTD')))            17490000
                    SET INPUT-REJ-IR TO TRUE                            17500000
                    PERFORM 0450-PROCESS-INPUT                          17510000
                 ELSE                                                   17520000
                    SET CURSOR-ON-M5REJ      TO TRUE                    17530000
LRM017              IF ACAT-ASCENDIS-CLIENT                             17540000
LRM017                 MOVE 'UNAUTHORIZED TO REJECT / ASCENDIS'         17550000
LRM017                                            TO SYSTEM-MSG         17560000
LRM017              ELSE                                                17570000
                       MOVE 'UNAUTHORIZED TO REJECT' TO SYSTEM-MSG      17580000
LRM017              END-IF                                              17590000
                    PERFORM 0830-ERROR-RTN                              17600000
                 END-IF                                                 17610000
              ELSE                                                      17620000
ET0001        IF TWA-M5REJ = SPACE                                      17630000
ET0001           CONTINUE                                               17640000
ET0001        ELSE                                                      17650000
                 SET CURSOR-ON-M5REJ      TO TRUE                       17660000
                 MOVE ' ENTER "S" OR "Y" TO REJECT ' TO SYSTEM-MSG      17670000
                 PERFORM 0830-ERROR-RTN                                 17680000
              END-IF                                                    17690000
ET0001        END-IF                                                    17700000
           END-IF.                                                      17710000
                                                                        17720000
ET0001**   IF M5REJCL > +0                                              17730000
ET0001     IF M5REJCL > +0  OR WS-REJ-CMNT-ERASED                       17740000
LRM020        IF TWA-M5REJC = 'Y'                                       17750000
LRM020           MOVE 'S' TO TWA-M5REJC ACAT05IO-M5REJC                 17760000
LRM020        END-IF                                                    17770000
              IF TWA-M5REJC = 'S'                                       17780000
                 IF TWA-M5REJ = SPACE OR LOW-VALUE                      17790000
                    PERFORM 0540-SEND-POPUP-SCREEN                      17800000
                 ELSE                                                   17810000
                    SET CURSOR-ON-M5REJC TO TRUE                        17820000
ET0001              MOVE ATT-UNPROT-BRT TO M5REJA M5REJCA               17830000
                    MOVE ' YOU CAN ONLY ENTER ONE FIELD'                17840000
                        TO SYSTEM-MSG                                   17850000
                    PERFORM 0830-ERROR-RTN                              17860000
                 END-IF                                                 17870000
              ELSE                                                      17880000
ET0001        IF TWA-M5REJC = SPACE                                     17890000
ET0001           CONTINUE                                               17900000
ET0001        ELSE                                                      17910000
                 SET CURSOR-ON-M5REJC TO TRUE                           17920000
                 MOVE 'ENTER "S" OR "Y" TO REJECT ' TO SYSTEM-MSG       17930000
                 PERFORM 0830-ERROR-RTN                                 17940000
              END-IF                                                    17950000
ET0001        END-IF                                                    17960000
           END-IF.                                                      17970000
      /                                                                 17980000
      ***************************************************************** 17990000
       0430-VALIDATE-R-FIELDS.                                          18000000
      *                                                                 18010000
      ** WHEN TWA-INIT-TRANS-TYPE-CD = 'R'                              18020000
      *                                                                 18030000
ET0001**   IF M5REJL > +0   AND  M5REJCL = +0                           18040000
ET0001     IF  (M5REJL  > +0  OR WS-REJ-ERASED)                         18050000
ET0001     AND (M5REJCL = +0 AND NOT WS-REJ-CMNT-ERASED)                18060000
              IF TWA-M5REJ = SPACE                                      18070000
ET0013*****      IF TWA-VINITRNF-NSCC-PEND-CD = 'H'                     18080000
ET0013*****         CONTINUE                                            18090000
ET0013*****      ELSE                                                   18100000
                    IF WS-UPDATE-OK                                     18110000
LRM017              AND (NOT ACAT-ASCENDIS-CLIENT                       18120000
LRM017               OR (ACAT-ASCENDIS-CLIENT                           18130000
LRM017               AND (TWA-TFR-TYPE NOT = 'PTR' AND 'PTD')))         18140000
                       SET INPUT-REJ-DR TO TRUE                         18150000
                       PERFORM 0450-PROCESS-INPUT                       18160000
                    ELSE                                                18170000
LRM017                 IF ACAT-ASCENDIS-CLIENT                          18180000
LRM017                    MOVE 'UNAUTHORIZED TO UNREJECT / ASCENDIS'    18190000
LRM017                                                  TO SYSTEM-MSG   18200000
LRM017                 ELSE                                             18210000
                          MOVE 'UNAUTHRIZE TO UNREJECT' TO SYSTEM-MSG   18220000
LRM017                 END-IF                                           18230000
                       SET CURSOR-ON-M5REJ   TO TRUE                    18240000
                       PERFORM 0830-ERROR-RTN                           18250000
                    END-IF                                              18260000
ET0013*****      END-IF                                                 18270000
              ELSE                                                      18280000
                 IF TWA-M5REJ = 'S'                                     18290000
ET0007**            MOVE 'THIS TRANSFER HAS BEEN REJECTED!'             18300000
ET0007**                TO SYSTEM-MSG                                   18310000
ET0007**            SET CURSOR-ON-M5REJ   TO TRUE                       18320000
ET0007**            PERFORM 0830-ERROR-RTN                              18330000
ET0007              SET WS-REJECT-SELECTED TO TRUE                      18340000
                 ELSE                                                   18350000
                    SET CURSOR-ON-M5REJ   TO TRUE                       18360000
ET0001**            MOVE ' MUST BE SPACE ' TO SYSTEM-MSG                18370000
ET0007              IF TWA-VINITRNF-NSCC-PEND-CD = 'H'                  18380000
ET0007                 MOVE 'ENTER "S" OR "Y" TO REJECT'  TO SYSTEM-MSG 18390000
ET0007              ELSE                                                18400000
ET0001                 MOVE 'ENTER SPACE TO UNREJECT' TO SYSTEM-MSG     18410000
ET0007              END-IF                                              18420000
                    PERFORM 0830-ERROR-RTN                              18430000
                 END-IF                                                 18440000
              END-IF                                                    18450000
           ELSE                                                         18460000
ET0001**      IF M5REJCL > +0 AND  M5REJL = +0                          18470000
ET0001        IF  (M5REJCL > +0  OR WS-REJ-CMNT-ERASED)                 18480000
ET0001        AND (M5REJL  = +0 AND NOT WS-REJ-ERASED)                  18490000
                 IF TWA-M5REJC = SPACE                                  18500000
ET0013*****         IF TWA-VINITRNF-NSCC-PEND-CD = 'H'                  18510000
ET0013*****            CONTINUE                                         18520000
ET0013*****         ELSE                                                18530000
                       IF WS-UPDATE-OK                                  18540000
LRM017                 AND (NOT ACAT-ASCENDIS-CLIENT                    18550000
LRM017                  OR (ACAT-ASCENDIS-CLIENT                        18560000
LRM017                  AND (TWA-TFR-TYPE NOT = 'PTR' AND 'PTD')))      18570000
                          SET INPUT-REJC-DC TO TRUE                     18580000
                          PERFORM 0450-PROCESS-INPUT                    18590000
                       ELSE                                             18600000
LRM017                    IF ACAT-ASCENDIS-CLIENT                       18610000
LRM017                      MOVE 'UNAUTHORIZED TO UNREJECT / ASCENDIS'  18620000
LRM017                                            TO SYSTEM-MSG         18630000
LRM017                    ELSE                                          18640000
                           MOVE 'UNAUTHORIZED TO UNREJECT' TO SYSTEM-MSG18650000
LRM017                    END-IF                                        18660000
                          SET CURSOR-ON-M5REJC  TO TRUE                 18670000
                          PERFORM 0830-ERROR-RTN                        18680000
                       END-IF                                           18690000
ET0013*****         END-IF                                              18700000
                 ELSE                                                   18710000
                    IF TWA-M5REJC = 'S'                                 18720000
ET0007**               MOVE 'THIS TRANSFER HAS BEEN REJECTED!'          18730000
ET0007**                   TO SYSTEM-MSG                                18740000
ET0007**               SET CURSOR-ON-M5REJC  TO TRUE                    18750000
ET0007**               PERFORM 0830-ERROR-RTN                           18760000
ET0007                 SET WS-REJECT-CMNT-SELECTED TO TRUE              18770000
                    ELSE                                                18780000
                       SET CURSOR-ON-M5REJC  TO TRUE                    18790000
ET0001**               MOVE ' MUST BE SPACE ' TO SYSTEM-MSG             18800000
ET0007                 IF TWA-VINITRNF-NSCC-PEND-CD = 'H'               18810000
ET0007                   MOVE 'ENTER "S" OR "Y" TO REJECT' TO SYSTEM-MSG18820000
ET0007                 ELSE                                             18830000
ET0001                    MOVE 'ENTER SPACE TO UNREJECT' TO SYSTEM-MSG  18840000
ET0007                 END-IF                                           18850000
                       PERFORM 0830-ERROR-RTN                           18860000
                 END-IF                                                 18870000
           END-IF.                                                      18880000
ET0007                                                                  18890000
ET0007     IF WS-REJECT-SELECTED OR WS-REJECT-CMNT-SELECTED             18900000
ET0007          GO TO 0430-EXIT                                         18910000
ET0007     END-IF.                                                      18920000
ET0007                                                                  18930000
      ***                                                               18940000
           IF  M5REJL  > +0   AND                                       18950000
               M5REJCL > +0                                             18960000
               SET CURSOR-ON-M5REJ  TO TRUE                             18970000
ET0001         MOVE ATT-UNPROT-BRT  TO M5REJA M5REJCA                   18980000
               MOVE ' CAN NOT ENTER BOTH FIELDS'                        18990000
                    TO SYSTEM-MSG                                       19000000
               PERFORM 0830-ERROR-RTN                                   19010000
           END-IF.                                                      19020000
      ***                                                               19030000
ET0001**   IF  M5REJL  = +0   AND                                       19040000
ET0001**       M5REJCL = +0                                             19050000
ET0001     IF  (M5REJL  = +0  AND  NOT WS-REJ-ERASED)                   19060000
ET0001     AND (M5REJCL = +0  AND  NOT WS-REJ-CMNT-ERASED)              19070000
              MOVE EIBTRMID   TO TERM-ID                                19080000
              MOVE 'ACA5'     TO TRAN-ID                                19090000
              PERFORM 0600-DELETE-TSQ                                   19100000
              PERFORM 0810-MAP-INPUT-AREA THRU 0810-EXIT                19110000
              PERFORM 0620-WRITE-TSQ                                    19120000
ET0001**      MOVE SPACES  TO  M5REJO, M5REJCO                          19130000
              PERFORM 0800-SEND-MAP-RETURN                              19140000
           END-IF.                                                      19150000
ET0007 0430-EXIT.      EXIT.                                            19160000
      /                                                                 19170000
       0440-VALIDATE-ACCEPT-FIELD.                                      19180000
      *                                                                 19190000
ET0001     IF TWA-M5ACCPT = 'S'                                         19200000
ET0001        IF TWA-INIT-TRANS-TYPE-CD = 'R'                           19210000
ET0001           SET CURSOR-ON-M5ACCPT TO TRUE                          19220000
ET0001           MOVE 'ACCEPT NOT PERMITTED - ALREADY REJECTED'         19230000
ET0001             TO  SYSTEM-MSG                                       19240000
ET0001           PERFORM 0830-ERROR-RTN                                 19250000
ET0001        END-IF                                                    19260000
ET0001     END-IF.                                                      19270000
ET0001                                                                  19280000
ET0001**   IF M5ACCPTL > +0                                             19290000
ET0001     IF M5ACCPTL > +0 OR WS-ACCEPT-ERASED                         19300000
              IF TWA-M5ACCPT = SPACE                                    19310000
                 IF TWA-VTRNFR-NSCC-PEND-CD = 'A'                       19320000
                    IF WS-UPDATE-OK                                     19330000
LRM017              AND (NOT ACAT-ASCENDIS-CLIENT                       19340000
LRM017               OR (ACAT-ASCENDIS-CLIENT                           19350000
LRM017               AND (TWA-TFR-TYPE NOT = 'PTR' AND 'PTD')))         19360000
                       SET INPUT-ACCPT-DA TO TRUE                       19370000
                       PERFORM 0450-PROCESS-INPUT                       19380000
                    ELSE                                                19390000
LRM017                IF ACAT-ASCENDIS-CLIENT                           19400000
LRM017                   MOVE 'UNAUTHORIZED TO UNACCEPT / ASCENDIS'     19410000
LRM017                                             TO SYSTEM-MSG        19420000
LRM017                ELSE                                              19430000
                         MOVE 'UNAUTHORIZED TO UNACCEPT' TO SYSTEM-MSG  19440000
LRM017                END-IF                                            19450000
                      SET CURSOR-ON-M5ACCPT TO TRUE                     19460000
                      MOVE ATT-PROT TO M5REJA M5REJCA                   19470000
                      MOVE SPACE TO  M5REJO, M5REJCO                    19480000
                      PERFORM 0830-ERROR-RTN                            19490000
                    END-IF                                              19500000
ET0001**         ELSE                                                   19510000
ET0001**            IF TWA-VTRNFR-NSCC-PEND-CD = SPACE OR LOW-VALUE     19520000
ET0001**              MOVE 'THIS TRANSFER HAS NOT BEEN ACCEPTED!'       19530000
ET0001**                TO SYSTEM-MSG                                   19540000
ET0001**              SET CURSOR-ON-M5ACCPT TO TRUE                     19550000
ET0001**              MOVE ATT-PROT TO M5REJA M5REJCA                   19560000
ET0001**              MOVE SPACE TO  M5REJO, M5REJCO                    19570000
ET0001**              PERFORM 0830-ERROR-RTN                            19580000
ET0001**            ELSE                                                19590000
ET0001**              MOVE 'THIS TRANSFER CAN NOT BE UN-ACCEPTED!'      19600000
ET0001**                  TO SYSTEM-MSG                                 19610000
ET0001**              SET CURSOR-ON-M5ACCPT TO TRUE                     19620000
ET0001**              MOVE ATT-PROT TO M5REJA M5REJCA                   19630000
ET0001**              MOVE SPACE TO M5REJO, M5REJCO                     19640000
ET0001**              PERFORM 0830-ERROR-RTN                            19650000
ET0001**            END-IF                                              19660000
                 END-IF                                                 19670000
              ELSE                                                      19680000
LRM020           IF TWA-M5ACCPT = 'Y'                                   19690000
LRM020              MOVE 'S' TO TWA-M5ACCPT ACAT05IO-M5ACCPT            19700000
LRM020           END-IF                                                 19710000
                 IF TWA-M5ACCPT = 'S'                                   19720000
                    IF (TWA-VTRNFR-NSCC-PEND-CD = SPACE OR LOW-VALUE)   19730000
                       IF WS-UPDATE-OK                                  19740000
LRM017                 AND (NOT ACAT-ASCENDIS-CLIENT                    19750000
LRM017                  OR (ACAT-ASCENDIS-CLIENT                        19760000
LRM017                  AND (TWA-TFR-TYPE NOT = 'PTR' AND 'PTD')))      19770000
                          SET INPUT-ACCPT-IA TO TRUE                    19780000
                          PERFORM 0450-PROCESS-INPUT                    19790000
                       ELSE                                             19800000
LRM017                   IF ACAT-ASCENDIS-CLIENT                        19810000
LRM017                     MOVE 'UNAUTHORIZED TO ACCEPT / ASCENDIS'     19820000
LRM017                                                 TO SYSTEM-MSG    19830000
LRM017                   ELSE                                           19840000
                            MOVE 'UNAUTHORIZED TO ACCEPT' TO SYSTEM-MSG 19850000
LRM017                   END-IF                                         19860000
                         SET CURSOR-ON-M5ACCPT TO TRUE                  19870000
                         MOVE ATT-UNPROT-BRT TO M5ACCPTA                19880000
                         MOVE ATT-PROT TO M5REJA M5REJCA                19890000
                         MOVE LOW-VALUE TO TWA-M5ACCPT                  19900000
                         MOVE SPACE TO M5REJO, M5REJCO                  19910000
                         PERFORM 0830-ERROR-RTN                         19920000
                       END-IF                                           19930000
                    ELSE                                                19940000
                       IF TWA-VTRNFR-NSCC-PEND-CD = 'A'                 19950000
                         MOVE 'TRANSFER WAS ALREADY ACCEPTED!'          19960000
                             TO SYSTEM-MSG                              19970000
                         SET CURSOR-ON-M5ACCPT TO TRUE                  19980000
                         MOVE ATT-UNPROT-BRT TO M5ACCPTA                19990000
                         MOVE ATT-PROT TO M5REJA M5REJCA                20000000
                         MOVE LOW-VALUE TO TWA-M5ACCPT                  20010000
                         MOVE SPACE TO M5REJO, M5REJCO                  20020000
                         PERFORM 0830-ERROR-RTN                         20030000
                       ELSE                                             20040000
                         MOVE 'THIS TRANSFER CAN NOT BE ACCEPTED!'      20050000
                             TO SYSTEM-MSG                              20060000
                         SET CURSOR-ON-M5ACCPT TO TRUE                  20070000
                         MOVE ATT-PROT TO M5REJA M5REJCA                20080000
                         MOVE SPACE TO  M5REJO, M5REJCO                 20090000
                         PERFORM 0830-ERROR-RTN                         20100000
                       END-IF                                           20110000
                     END-IF                                             20120000
                 ELSE                                                   20130000
                   SET CURSOR-ON-M5ACCPT TO TRUE                        20140000
ET0001**           MOVE ' MUST BE SPACE ' TO TWA-RETURN-MSG             20150000
ET0001             IF TWA-VTRNFR-NSCC-PEND-CD = 'A'                     20160000
ET0001                MOVE 'INVALID ENTRY - ENTER SPACE TO UNACCEPT'    20170000
ET0001                  TO  SYSTEM-MSG                                  20180000
ET0001             ELSE                                                 20190000
ET0001                MOVE 'INVALID ENTRY - ENTER "S" OR "Y" TO ACCEPT' 20200000
ET0001                  TO  SYSTEM-MSG                                  20210000
ET0001             END-IF                                               20220000
                   MOVE ATT-PROT TO M5REJA M5REJCA                      20230000
                   MOVE SPACE TO M5REJO, M5REJCO                        20240000
                   PERFORM 0830-ERROR-RTN                               20250000
                   MOVE ATT-PROT TO M5REJA M5REJCA                      20260000
                   MOVE SPACE TO M5REJO, M5REJCO                        20270000
                   PERFORM 0830-ERROR-RTN                               20280000
              END-IF                                                    20290000
           END-IF.                                                      20300000
      ***************************************************************** 20310000
ET0001*---------------------------------------------------------------* 20320000
ET0001* BOTH "ACCEPT" & "ACCELERATE" CAN BE PROCESSED AT SAME TIME      20330000
ET0001*---------------------------------------------------------------* 20340000
ET0001*(1) ACCELERATE                                                   20350000
ET0001*    - ENTER 'S' IN AN ACCELERATE FIELD.                          20360000
ET0001*    - SET INPUT-ACCEL TO TRUE.                                   20370000
ET0001*    - MOVE 'X' TO INIT-TRANS-TYPE-CD OF VINITRNF.                20380000
ET0001*    - MOVE '00' TO TRNFR_TYPE_RJCT_CD OF VINITRNF.               20390000
ET0001*    - ADD VINITRNF.                                              20400000
ET0001*(2) UN-ACCELERATE                                                20410000
ET0001*    - ENTER SPACE IN AN ACCELERATE FIELD IF ALREADY ACCELERATED. 20420000
ET0001*    - SET INPUT-UNACCEL TO TRUE.                                 20430000
ET0001*    - DELETE VINITRNF.                                           20440000
ET0001*---------------------------------------------------------------* 20450000
ET0001 0445-VALIDATE-ACCELERATE.                                        20460000
           IF TWA-M5ACCEL = 'S'                                         20470000
              IF TWA-INIT-TRANS-TYPE-CD = 'R'                           20480000
                 SET CURSOR-ON-M5ACCEL TO TRUE                          20490000
                 MOVE 'ACCELERATE NOT PERMITTED - ALREADY REJECTED'     20500000
                   TO  SYSTEM-MSG                                       20510000
                 PERFORM 0830-ERROR-RTN                                 20520000
              END-IF                                                    20530000
           END-IF.                                                      20540000
                                                                        20550000
LRM020     IF TWA-M5ACCEL = 'Y'                                         20560000
LRM020     AND TWA-TFR-TYPE = 'RCL'                                     20570000
LRM020        MOVE 'S' TO TWA-M5ACCEL ACAT05IO-M5ACCEL                  20580000
LRM020     END-IF.                                                      20590000
                                                                        20600000
           IF TWA-M5ACCEL = 'S'                                         20610000
              IF TWA-TFR-TYPE = 'RCL'                                   20620000
                 PERFORM 0446-ACCEL-SELECTED                            20630000
              ELSE                                                      20640000
                 SET CURSOR-ON-M5ACCEL TO TRUE                          20650000
                 MOVE 'ACCELERATION PERMITTED FOR "RCL" TRANSFER ONLY'  20660000
                   TO  SYSTEM-MSG                                       20670000
                 PERFORM 0830-ERROR-RTN                                 20680000
              END-IF                                                    20690000
           ELSE                                                         20700000
           IF TWA-M5ACCEL = SPACE                                       20710000
              PERFORM 0447-ACCEL-UNSELECTED                             20720000
           ELSE                                                         20730000
              PERFORM 0448-INVALID-ACCEL-ENTRY                          20740000
           END-IF.                                                      20750000
      *                                                                 20760000
ET0001 0446-ACCEL-SELECTED.                                             20770000
           IF TWA-INIT-TRANS-TYPE-CD = 'X'                              20780000
              CONTINUE                                                  20790000
           ELSE                                                         20800000
           IF TWA-INIT-TRANS-TYPE-CD = SPACE OR LOW-VALUE               20810000
              IF WS-UPDATE-OK                                           20820000
LRM017        AND (NOT ACAT-ASCENDIS-CLIENT                             20830000
LRM017         OR (ACAT-ASCENDIS-CLIENT                                 20840000
LRM017         AND (TWA-TFR-TYPE NOT = 'PTR' AND 'PTD')))               20850000
                 SET INPUT-ACCEL TO TRUE                                20860000
                 PERFORM 0450-PROCESS-INPUT                             20870000
              ELSE                                                      20880000
LRM017           IF ACAT-ASCENDIS-CLIENT                                20890000
LRM017              MOVE 'UNAUTHORIZED TO ACCELERATE / ASCENDIS'        20900000
LRM017                                            TO SYSTEM-MSG         20910000
LRM017           ELSE                                                   20920000
                    MOVE 'UNAUTHORIZED TO ACCELERATE' TO SYSTEM-MSG     20930000
LRM017           END-IF                                                 20940000
                 SET CURSOR-ON-M5ACCEL TO TRUE                          20950000
                 MOVE ATT-UNPROT-BRT TO M5ACCELA                        20960000
                 PERFORM 0830-ERROR-RTN                                 20970000
              END-IF                                                    20980000
           ELSE                                                         20990000
           IF TWA-INIT-TRANS-TYPE-CD = 'R'                              21000000
              MOVE 'ACCELERATION NOT ALLOWED FOR A REJECTED TRANSFER'   21010000
                TO  SYSTEM-MSG                                          21020000
              SET CURSOR-ON-M5ACCEL TO TRUE                             21030000
              MOVE ATT-UNPROT-BRT TO M5REJA M5REJCA M5ACCELA            21040000
              PERFORM 0830-ERROR-RTN                                    21050000
           ELSE                                                         21060000
              MOVE 'INVALID "ACCELERATE" ENTRY' TO SYSTEM-MSG           21070000
              SET CURSOR-ON-M5ACCEL TO TRUE                             21080000
              MOVE ATT-UNPROT-BRT TO M5ACCELA                           21090000
              PERFORM 0830-ERROR-RTN                                    21100000
           END-IF.                                                      21110000
      *                                                                 21120000
ET0001 0447-ACCEL-UNSELECTED.                                           21130000
           IF TWA-INIT-TRANS-TYPE-CD = 'R' OR SPACE OR LOW-VALUE        21140000
              CONTINUE                                                  21150000
           ELSE                                                         21160000
           IF TWA-INIT-TRANS-TYPE-CD = 'X'                              21170000
              IF WS-UPDATE-OK                                           21180000
LRM017        AND (NOT ACAT-ASCENDIS-CLIENT                             21190000
LRM017         OR (ACAT-ASCENDIS-CLIENT                                 21200000
LRM017         AND (TWA-TFR-TYPE NOT = 'PTR' AND 'PTD')))               21210000
                 SET INPUT-UNACCEL TO TRUE                              21220000
                 PERFORM 0450-PROCESS-INPUT                             21230000
              ELSE                                                      21240000
LRM017           IF ACAT-ASCENDIS-CLIENT                                21250000
LRM017              MOVE 'UNAUTHORIZED TO UN-ACCELERATE / ASCENDIS'     21260000
LRM017                                            TO SYSTEM-MSG         21270000
LRM017           ELSE                                                   21280000
                    MOVE 'UNAUTHORIZED TO UN-ACCELERATE' TO SYSTEM-MSG  21290000
LRM017           END-IF                                                 21300000
                 SET CURSOR-ON-M5ACCEL TO TRUE                          21310000
                 MOVE ATT-UNPROT-BRT TO M5ACCELA                        21320000
                 PERFORM 0830-ERROR-RTN                                 21330000
              END-IF                                                    21340000
           ELSE                                                         21350000
              MOVE 'INVALID ENTRY' TO SYSTEM-MSG                        21360000
              SET CURSOR-ON-M5ACCEL TO TRUE                             21370000
              MOVE ATT-UNPROT-BRT TO M5ACCELA                           21380000
              PERFORM 0830-ERROR-RTN                                    21390000
           END-IF.                                                      21400000
      *                                                                 21410000
ET0001 0448-INVALID-ACCEL-ENTRY.                                        21420000
           IF TWA-INIT-TRANS-TYPE-CD = SPACE OR LOW-VALUE               21430000
              MOVE 'ENTER "S" OR "Y" TO ACCELERATE' TO SYSTEM-MSG       21440000
              SET CURSOR-ON-M5ACCEL TO TRUE                             21450000
              MOVE ATT-UNPROT-BRT TO M5ACCELA                           21460000
              PERFORM 0830-ERROR-RTN                                    21470000
           ELSE                                                         21480000
           IF TWA-INIT-TRANS-TYPE-CD = 'X'                              21490000
              MOVE 'ENTER SPACE TO UN-ACCELERATE' TO SYSTEM-MSG         21500000
              SET CURSOR-ON-M5ACCEL TO TRUE                             21510000
              MOVE ATT-UNPROT-BRT TO M5ACCELA                           21520000
              PERFORM 0830-ERROR-RTN                                    21530000
           ELSE                                                         21540000
              MOVE 'INVALID "ACCELERATE" ENTRY' TO SYSTEM-MSG           21550000
              SET CURSOR-ON-M5ACCEL TO TRUE                             21560000
              MOVE ATT-UNPROT-BRT TO M5ACCELA                           21570000
              PERFORM 0830-ERROR-RTN                                    21580000
           END-IF.                                                      21590000
       EJECT                                                            21600000
      *                                                                 21610000
      /                                                                 21620000
       0450-PROCESS-INPUT.                                              21630000
ET0001      IF WS-ACCEPT-N-XCEL                                         21640000
ET0001         SET INPUT-ACCPT-IA TO TRUE                               21650000
ET0001      ELSE                                                        21660000
ET0001      IF WS-UNACCEPT-N-UNXCEL                                     21670000
ET0001         SET INPUT-ACCPT-DA TO TRUE                               21680000
ET0001      END-IF.                                                     21690000
                                                                        21700000
            IF INPUT-ACCPT-IA   OR                                      21710000
               INPUT-ACCPT-DA                                           21720000
               MOVE TWA-M5ACCPT TO ACAT05IO-M5ACCPT                     21730000
ET0001**       PERFORM 0455-UPDATE-VTRNFR                               21740000
ET0001         PERFORM 0455-UPDATE-VTRNFR THRU 0455-EXIT                21750000
            END-IF.                                                     21760000
                                                                        21770000
ET0001      IF WS-ACCEPT-N-XCEL                                         21780000
ET0001         SET INPUT-ACCEL TO TRUE                                  21790000
ET0001      ELSE                                                        21800000
ET0001      IF WS-UNACCEPT-N-UNXCEL                                     21810000
ET0001         SET INPUT-UNACCEL TO TRUE                                21820000
ET0001      END-IF.                                                     21830000
ET0001      IF INPUT-ACCEL                                              21840000
ET0001         MOVE 'S'   TO TWA-M5ACCEL ACAT05IO-M5ACCEL               21850000
ET0001         PERFORM 0460-INSERT-INITRNF                              21860000
ET0001      ELSE                                                        21870000
ET0001      IF INPUT-UNACCEL                                            21880000
ET0001         MOVE SPACE TO TWA-M5ACCEL ACAT05IO-M5ACCEL               21890000
ET0001         PERFORM 0470-DELETE-INITRNF                              21900000
ET0001      END-IF.                                                     21910000
ET0001                                                                  21920000
            IF M5REJL > +0                                              21930000
               MOVE TWA-M5REJ    TO ACAT05IO-M5REJ                      21940000
               IF INPUT-REJ-IR                                          21950000
                  PERFORM 0460-INSERT-INITRNF                           21960000
               ELSE                                                     21970000
                  IF INPUT-REJ-DR OR                                    21980000
                     INPUT-REJC-DC                                      21990000
                     PERFORM 0470-DELETE-INITRNF                        22000000
                  END-IF                                                22010000
               END-IF                                                   22020000
            END-IF.                                                     22030000
                                                                        22040000
            IF M5REJCL > +0     AND                                     22050000
               TWA-XFR-REJC-NO  AND                                     22060000
               INPUT-REJC-DC                                            22070000
               MOVE TWA-M5REJC   TO ACAT05IO-M5REJC                     22080000
               PERFORM 0470-DELETE-INITRNF                              22090000
            END-IF.                                                     22100000
                                                                        22110000
           IF TWA-SCREEN-IND     = 'A' AND                              22120000
              TWA-XFR-REJC-YES         AND                              22130000
              ACAT90CM-TS-UPDATE       AND                              22140000
              INPUT-REJC-RC                                             22150000
              MOVE TWA-M5REJC   TO ACAT05IO-M5REJC                      22160000
              PERFORM 0460-INSERT-INITRNF                               22170000
           END-IF.                                                      22180000
                                                                        22190000
      /                                                                 22200000
      ***************************************************************** 22210000
       0455-UPDATE-VTRNFR.                                              22220000
           SET ACAT05IO-UPDT-VTRNFR TO TRUE.                            22230000
LRM024     MOVE ACAT-CICS-USER-NAME TO ACAT05IO-USER-NAME.              22231000
LRM024     MOVE ACAT-CICS-USER-ID   TO ACAT05IO-USER-ID.                22232000
LRM024     MOVE ACAT-CICS-NETNAME   TO ACAT05IO-NET-NAME.               22233000
           PERFORM 0500-CALL-ACAT05DA.                                  22240000
           IF ACAT05IO-DB2-ERROR                                        22250000
              MOVE 'SELECT'             TO WS-DB2-ERROR-FUNCTION        22260000
              MOVE ACAT05IO-SQLCAID     TO WS-DB2-ERROR-TABLE           22270000
              MOVE ACAT05IO-SQLCODE     TO WS-DB2-ERROR-ID              22280000
              MOVE WS-DB2-ERROR-MSG     TO TWA-RETURN-MSG               22290000
              PERFORM 0830-ERROR-RTN                                    22300000
           END-IF.                                                      22310000
           MOVE ACAT05IO-AREA TO   TWA-ACAT05IO-AREA.                   22320000
                                                                        22330000
           IF TWA-VTRNFR-UPDATED                                        22340000
              IF INPUT-ACCPT-IA                                         22350000
                 SET CURSOR-ON-M5ACCPT  TO TRUE                         22360000
                 MOVE 'S' TO   TWA-M5ACCPT, M5ACCPTO                    22370000
                 MOVE 'YOU JUST ACCEPTED THIS TIF' TO TWA-RETURN-MSG    22380000
              ELSE                                                      22390000
                 IF INPUT-ACCPT-DA                                      22400000
                    SET CURSOR-ON-M5ACCPT  TO TRUE                      22410000
                    MOVE ' ' TO  TWA-M5ACCPT, M5ACCPTO                  22420000
                    MOVE 'THIS TIF WILL NOT BE ACCEPTED'                22430000
                                                   TO TWA-RETURN-MSG    22440000
                 END-IF                                                 22450000
              END-IF                                                    22460000
           ELSE                                                         22470000
              MOVE ACAT05IO-RETURN-MSG         TO  TWA-RETURN-MSG       22480000
              PERFORM 0830-ERROR-RTN                                    22490000
           END-IF.                                                      22500000
     ***                                                                22510000
ET0001     IF WS-ACCEPT-N-XCEL                                          22520000
ET0001     OR WS-UNACCEPT-N-UNXCEL                                      22530000
ET0001         GO TO 0455-EXIT.                                         22540000
ET0001                                                                  22550000
           MOVE LOW-VALUES    TO ACAT05AO, ACAT05BO.                    22560000
           MOVE EIBTRMID      TO TERM-ID.                               22570000
           MOVE 'ACA5'        TO TRAN-ID.                               22580000
           PERFORM 0600-DELETE-TSQ.                                     22590000
           PERFORM 0810-MAP-INPUT-AREA THRU 0810-EXIT                   22600000
           PERFORM 0620-WRITE-TSQ.                                      22610000
           SET DATA-ONLY TO TRUE.                                       22620000
           PERFORM 0800-SEND-MAP-RETURN.                                22630000
ET0001 0455-EXIT.  EXIT.                                                22640000
      /                                                                 22650000
       0460-INSERT-INITRNF.                                             22660000
      *    MOVE 'II' TO ACAT05IO-FUNCTION.                              22670000
ET0011     MOVE SPACE               TO ACAT05IO-FREEZ-TYPE.             22680000
ET0012     MOVE ACAT-CICS-USER-NAME TO ACAT05IO-USER-NAME.              22690000
ET0012     MOVE ACAT-CICS-USER-ID   TO ACAT05IO-USER-ID.                22700000
ET0012     MOVE ACAT-CICS-NETNAME   TO ACAT05IO-NET-NAME.               22710000
                                                                        22720000
           SET ACAT05IO-ISRT-VINITRNF TO TRUE.                          22730000
           IF INPUT-REJC-RC                                             22740000
              MOVE TWA-VINITRNF-CMNT TO ACAT05IO-VINITRNF-CMNT          22750000
           END-IF.                                                      22760000
           MOVE ACAT-ADP-BROKER TO TWA-SBMT-BRKR ACAT05IO-SBMT-BRKR.    22770000
                                                                        22780000
           PERFORM 0500-CALL-ACAT05DA.                                  22790000
           IF ACAT05IO-DB2-ERROR                                        22800000
              MOVE 'SELECT'             TO WS-DB2-ERROR-FUNCTION        22810000
              MOVE ACAT05IO-SQLCAID     TO WS-DB2-ERROR-TABLE           22820000
              MOVE ACAT05IO-SQLCODE     TO WS-DB2-ERROR-ID              22830000
              MOVE WS-DB2-ERROR-MSG     TO TWA-RETURN-MSG               22840000
              PERFORM 0830-ERROR-RTN                                    22850000
           END-IF.                                                      22860000
           MOVE ACAT05IO-AREA TO   TWA-ACAT05IO-AREA.                   22870000
                                                                        22880000
           IF TWA-VINITRNF-INSERTED  OR                                 22890000
              TWA-VINITRNF-UPDATED                                      22900000
              IF INPUT-REJ-IR                                           22910000
                 SET CURSOR-ON-M5REJ  TO TRUE                           22920000
                 MOVE 'S' TO     TWA-M5REJ, M5REJO                      22930000
LRM014           IF (TWA-TFR-TYPE = 'RCL'                               22940000
LRM014           AND TWA-STTLM-TM-CD = 'L'                              22950000
LRM021           AND WS-TIME-HHMM > WS-CYCLE5-HHMM)                     22960000
LRM014           OR (TWA-TFR-TYPE NOT = 'RCL'                           22970000
LRM021           AND WS-TIME-HHMM > WS-CYCLE5-HHMM)                     22980000
LRM014              MOVE 'WARNING-PAST CUTOFF TIME;SUBMITTING WILL CAUSE22990000
LRM014-                    ' NSCC ERROR' TO SYSTEM-MSG                  23000000
LRM014              ELSE                                                23010000
                 MOVE 'TRANSFER REJECT REQUEST WILL BE SENT TO NSCC'    23020000
                   TO  SYSTEM-MSG                                       23030000
LRM014           END-IF                                                 23040000
              ELSE                                                      23050000
                 IF INPUT-REJC-RC                                       23060000
                    SET CURSOR-ON-M5REJC  TO TRUE                       23070000
                    MOVE 'S' TO TWA-M5REJC, M5REJCO                     23080000
LRM014              IF (TWA-TFR-TYPE = 'RCL'                            23090000
LRM014              AND TWA-STTLM-TM-CD = 'L'                           23100000
LRM021              AND WS-TIME-HHMM > WS-CYCLE5-HHMM)                  23110000
LRM014              OR (TWA-TFR-TYPE NOT = 'RCL'                        23120000
LRM021              AND WS-TIME-HHMM > WS-CYCLE5-HHMM)                  23130000
LRM014              MOVE 'WARNING-PAST CUTOFF TIME;SUBMITTING WILL CAUSE23140000
LRM014-                    ' NSCC ERROR' TO SYSTEM-MSG                  23150000
LRM014              ELSE                                                23160000
                    MOVE 'TRANSFER REJECT REQUEST WITH COMMENT WILL BE S23170000
      -                  'ENT TO NSCC'  TO SYSTEM-MSG                   23180000
LRM014              END-IF                                              23190000
                 END-IF                                                 23200000
              END-IF                                                    23210000
ET0001        IF INPUT-ACCEL                                            23220000
ET0001           MOVE 'S' TO  TWA-M5ACCEL M5ACCELO                      23230000
ET0001           IF WS-ACCEPT-N-XCEL                                    23240000
ET0001              SET CURSOR-ON-M5ACCPT TO TRUE                       23250000
ET0001              MOVE ATT-UNPROT-BRT TO M5ACCPTA M5ACCELA            23260000
ET0001              MOVE '"ACCEPT" AND "ACCELERATE" COMPLETED'          23270000
ET0001                TO  SYSTEM-MSG                                    23280000
ET0001           ELSE                                                   23290000
ET0001              SET CURSOR-ON-M5ACCEL TO TRUE                       23300000
ET0001              MOVE ATT-UNPROT-BRT TO M5ACCELA                     23310000
ET0001              MOVE 'TRANSFER ACCELERATION COMPLETED'              23320000
ET0001                TO  SYSTEM-MSG                                    23330000
ET0001           END-IF                                                 23340000
ET0001        END-IF                                                    23350000
           ELSE                                                         23360000
              MOVE ACAT05IO-RETURN-MSG         TO  SYSTEM-MSG           23370000
              PERFORM 0830-ERROR-RTN                                    23380000
           END-IF.                                                      23390000
                                                                        23400000
           MOVE LOW-VALUES    TO ACAT05AO, ACAT05BO.                    23410000
           MOVE EIBTRMID      TO TERM-ID.                               23420000
           MOVE 'ACA5'        TO TRAN-ID.                               23430000
           PERFORM 0600-DELETE-TSQ.                                     23440000
           PERFORM 0810-MAP-INPUT-AREA THRU 0810-EXIT                   23450000
           PERFORM 0620-WRITE-TSQ.                                      23460000
           PERFORM 0800-SEND-MAP-RETURN.                                23470000
      /                                                                 23480000
      ***************************************************************** 23490000
       0470-DELETE-INITRNF.                                             23500000
           MOVE 'DI'   TO  ACAT05IO-FUNCTION.                           23510000
           PERFORM 0500-CALL-ACAT05DA.                                  23520000
           IF ACAT05IO-DB2-ERROR                                        23530000
              MOVE 'SELECT'             TO WS-DB2-ERROR-FUNCTION        23540000
              MOVE ACAT05IO-SQLCAID     TO WS-DB2-ERROR-TABLE           23550000
              MOVE ACAT05IO-SQLCODE     TO WS-DB2-ERROR-ID              23560000
              MOVE WS-DB2-ERROR-MSG     TO TWA-RETURN-MSG               23570000
              PERFORM 0830-ERROR-RTN                                    23580000
           END-IF.                                                      23590000
           MOVE ACAT05IO-AREA      TO     TWA-ACAT05IO-AREA.            23600000
           IF TWA-VINITRNF-DELETED                                      23610000
              IF INPUT-REJ-DR                                           23620000
                 SET CURSOR-ON-M5REJ       TO TRUE                      23630000
                 MOVE SPACE TO     TWA-M5REJ                            23640000
ET0001           MOVE SPACE TO     TWA-M5REJC                           23650000
                 MOVE 'TRANSFER REJECT REQUEST CANCELLED'               23660000
                   TO  SYSTEM-MSG                                       23670000
              ELSE                                                      23680000
              IF INPUT-REJC-DC                                          23690000
                 SET CURSOR-ON-M5REJC      TO TRUE                      23700000
                 MOVE ' ' TO TWA-M5REJC                                 23710000
ET0001           MOVE ' ' TO TWA-M5REJ                                  23720000
                 MOVE 'TRANSFER REJECT WITH COMMENT REQUEST CANCELLED'  23730000
                   TO  SYSTEM-MSG                                       23740000
ET0001        ELSE                                                      23750000
ET0001        IF INPUT-UNACCEL                                          23760000
ET0001           MOVE ' ' TO  TWA-M5ACCEL                               23770000
ET0001           IF WS-UNACCEPT-N-UNXCEL                                23780000
ET0001              SET CURSOR-ON-M5ACCPT TO TRUE                       23790000
ET0001              MOVE '"ACCEPT" AND "ACCELERATE" CANCELLED'          23800000
ET0001                TO  SYSTEM-MSG                                    23810000
ET0001           ELSE                                                   23820000
ET0001              SET CURSOR-ON-M5ACCEL TO TRUE                       23830000
ET0001              MOVE 'ACCELERATION REQUEST CANCELLED'               23840000
ET0001                TO  SYSTEM-MSG                                    23850000
ET0001           END-IF                                                 23860000
ET0001        END-IF                                                    23870000
              END-IF END-IF                                             23880000
           ELSE                                                         23890000
              MOVE ACAT05IO-RETURN-MSG      TO  SYSTEM-MSG              23900000
              PERFORM 0830-ERROR-RTN                                    23910000
           END-IF.                                                      23920000
      *                                                                 23930000
      ****                                                              23940000
           MOVE EIBTRMID      TO TERM-ID.                               23950000
           MOVE 'ACA5'        TO TRAN-ID.                               23960000
           PERFORM 0600-DELETE-TSQ.                                     23970000
           PERFORM 0810-MAP-INPUT-AREA THRU 0810-EXIT.                  23980000
           PERFORM 0620-WRITE-TSQ.                                      23990000
           MOVE ATT-UNPROT  TO  M5REJA, M5REJCA.                        24000000
           PERFORM 0800-SEND-MAP-RETURN.                                24010000
      /                                                                 24020000
      ******************************************************************24030000
       0480-CHECK-EIBCPOSN.                                             24040000
           IF EIBAID = DFHPF1                                           24050000
              IF (EIBCPOSN >= 459  AND <= 480 )   OR                    24060000
                 (EIBCPOSN >= 539  AND <= 560 )   OR                    24070000
                 (EIBCPOSN >= 619  AND <= 640 )   OR                    24080000
                 (EIBCPOSN >= 1201 AND <= 1920)                         24090000
                  SET SEND-SECR-CMNT           TO TRUE                  24100000
              ELSE                                                      24110000
                 IF EIBCPOSN >= 1 AND < 1201                            24120000
                    SET SEND-ACCT-CMNT         TO TRUE                  24130000
                  END-IF                                                24140000
              END-IF                                                    24150000
           END-IF.                                                      24160000
                                                                        24170000
           IF EIBAID = DFHPF5                                           24180000
              SET REASON-CODE-POPUP-YES TO TRUE                         24190000
           END-IF.                                                      24200000
      *                                                                 24210000
           IF EIBAID = DFHPF1                                           24220000
              IF (EIBCPOSN >= 455  AND <= 480 )                         24230000
                 SET VIEW-BAL1-CMNT            TO TRUE                  24240000
              ELSE                                                      24250000
                 IF (EIBCPOSN >= 535 AND <= 560 )                       24260000
                    SET VIEW-BAL2-CMNT         TO TRUE                  24270000
                 ELSE                                                   24280000
                    IF (EIBCPOSN >= 615 AND <= 640 )                    24290000
                       SET VIEW-BAL5-CMNT      TO TRUE                  24300000
                    ELSE                                                24310000
                       IF (EIBCPOSN >= 1121 AND <= 1600)                24320000
                           SET VIEW-SECR-CMNT  TO TRUE                  24330000
                       ELSE                                             24340000
                          IF (EIBCPOSN >= 1 AND < 1121)                 24350000
                             SET VIEW-ACCT-CMNT TO TRUE                 24360000
                          ELSE                                          24370000
                             IF EIBCPOSN = 1756                         24380000
                                SET VIEW-REJC-CMNT TO TRUE              24390000
                             ELSE                                       24400000
                                MOVE LOW-VALUE TO ACAT05AO ACAT05BO     24410000
                                MOVE EIBTRMID         TO TERM-ID        24420000
                                MOVE 'ACA5'           TO TRAN-ID        24430000
                                PERFORM 0610-READ-TSQ                   24440000
                                MOVE 'TAB TO THE FIELD TO VIEW COMMENTS'24450000
                                TO SYSTEM-MSG                           24460000
                                SET CURSOR-ON-M5NEXT TO TRUE            24470000
                                SET ERROR-YES TO TRUE                   24480000
                                PERFORM 0830-ERROR-RTN                  24490000
                             END-IF                                     24500000
                          END-IF                                        24510000
                       END-IF                                           24520000
                    END-IF                                              24530000
                 END-IF                                                 24540000
              END-IF                                                    24550000
           END-IF.                                                      24560000
      /                                                                 24570000
      ******************************************************************24580000
       0490-CALL-ACATSRCH-RTN.                                          24590000
           EXEC CICS LINK                                               24600000
                PROGRAM ('ACATSRCH')                                    24610000
                COMMAREA (ACAT-SEARCH-AREA)                             24620000
           END-EXEC.                                                    24630000
           IF EIBRESP NOT = +0                                          24640000
              MOVE 'LINK TO ACATSRCH IS FAILED! ' TO SYSTEM-MSG         24650000
              PERFORM 0495-SRCH-CURSOR-RTN                              24660000
     ****     SET ERROR-YES TO TRUE                                     24670000
              PERFORM 0830-ERROR-RTN                                    24680000
           END-IF.                                                      24690000
                                                                        24700000
       0495-SRCH-CURSOR-RTN.                                            24710000
           IF TWA-MBR = SPACES  OR  LOW-VALUES                          24720000
              CONTINUE                                                  24730000
           ELSE                                                         24740000
              IF ACAT-SRCH-BR > SPACE                                   24750000
                 SET CURSOR-ON-MBR TO TRUE                              24760000
              END-IF                                                    24770000
           END-IF.                                                      24780000
                                                                        24790000
           IF TWA-MAC = SPACES  OR  LOW-VALUES                          24800000
              CONTINUE                                                  24810000
           ELSE                                                         24820000
              IF ACAT-SRCH-ACCT > SPACE                                 24830000
                 SET CURSOR-ON-MAC TO TRUE                              24840000
              END-IF                                                    24850000
           END-IF.                                                      24860000
                                                                        24870000
           IF TWA-MRR   =  SPACES  OR  LOW-VALUES                       24880000
              CONTINUE                                                  24890000
           ELSE                                                         24900000
              IF ACAT-SRCH-RR > SPACE                                   24910000
                 SET CURSOR-ON-MRR TO TRUE                              24920000
              END-IF                                                    24930000
           END-IF.                                                      24940000
                                                                        24950000
           IF TWA-MTFR  =  SPACES  OR  LOW-VALUES                       24960000
              CONTINUE                                                  24970000
           ELSE                                                         24980000
              IF  ACAT-SRCH-TFR > SPACE                                 24990000
                 SET CURSOR-ON-MTFR TO TRUE                             25000000
              END-IF                                                    25010000
           END-IF.                                                      25020000
                                                                        25030000
           IF TWA-MCBRKR =  SPACES  OR  LOW-VALUES                      25040000
              CONTINUE                                                  25050000
           ELSE                                                         25060000
              IF ACAT-SRCH-CONTRA-BKR > SPACE                           25070000
                 SET CURSOR-ON-MCBRKR TO TRUE                           25080000
              END-IF                                                    25090000
           END-IF.                                                      25100000
                                                                        25110000
           IF TWA-MSTAT =  SPACES  OR  LOW-VALUES                       25120000
              CONTINUE                                                  25130000
           ELSE                                                         25140000
              IF ACAT-SRCH-STATUS > SPACE                               25150000
                 SET CURSOR-ON-MSTAT TO TRUE                            25160000
              END-IF                                                    25170000
           END-IF.                                                      25180000
                                                                        25190000
      /*************************************************************    25200000
       0500-CALL-ACAT05DA.                                              25210000
      *** LINK TO ACAT05DA, ONE VTRNFR ROW WILL BE RETURNED     ****    25220000
                                                                        25230000
ET0009     MOVE ACAT-SIGN-ON-ID TO ACAT05IO-ACAT-SIGN-ON-ID.            25240000
                                                                        25250000
           EXEC CICS LINK                                               25260000
                PROGRAM ('ACAT05DA')                                    25270000
                COMMAREA (ACAT05IO-AREA)                                25280000
           END-EXEC.                                                    25290000
                                                                        25300000
           IF EIBRESP NOT = +0                                          25310000
              MOVE 'LINK TO ACAT05DA IS FAILED! ' TO SYSTEM-MSG         25320000
              SET CURSOR-ON-M5NEXT   TO TRUE                            25330000
              PERFORM 0830-ERROR-RTN                                    25340000
           END-IF.                                                      25350000
                                                                        25360000
ET0006     IF ACAT-SRCH-ENTRY                                           25370000
ET0006        MOVE 0 TO ACAT05IO-SV-ASSET-SEQ-NBR                       25380000
ET0006     END-IF.                                                      25390000
           MOVE ACAT05IO-SAVE-KEYS  TO  TWA-SV-TRNFR-KEY.               25400000
      /                                                                 25410000
       0510-RETRIEVE-DETAIL.                                            25420000
                                                                        25430000
           IF ACAT05IO-VASSET-FOUND                                     25440000
              MOVE 'RA' TO ACAT05IO-FUNCTION                            25450000
              PERFORM 0520-CALL-ACAT05DC                                25460000
              IF ACAT05IO-DB2-ERROR                                     25470000
                 MOVE 'SELECT'          TO WS-DB2-ERROR-FUNCTION        25480000
                 MOVE ACAT05IO-SQLCAID  TO WS-DB2-ERROR-TABLE           25490000
                 MOVE ACAT05IO-SQLCODE  TO WS-DB2-ERROR-ID              25500000
                 MOVE WS-DB2-ERROR-MSG  TO TWA-RETURN-MSG               25510000
                 PERFORM 0830-ERROR-RTN                                 25520000
              END-IF                                                    25530000
           END-IF.                                                      25540000
                                                                        25550000
       0520-CALL-ACAT05DC.                                              25560000
                                                                        25570000
           EXEC CICS LINK                                               25580000
                PROGRAM ('ACAT05DC')                                    25590000
                COMMAREA (ACAT05IO-AREA)                                25600000
           END-EXEC.                                                    25610000
                                                                        25620000
           IF EIBRESP NOT = +0                                          25630000
              MOVE 'LINK TO ACAT05DC IS FAILED! ' TO SYSTEM-MSG         25640000
              SET CURSOR-ON-M5NEXT   TO TRUE                            25650000
              PERFORM 0830-ERROR-RTN                                    25660000
           END-IF.                                                      25670000
                                                                        25680000
           MOVE ACAT05IO-SAVE-KEYS  TO  TWA-SV-TRNFR-KEY.               25690000
      /                                                                 25700000
       0530-PREP-FOR-POPUP.                                             25710000
      *                                                                 25720000
           MOVE EIBTRMID      TO TERM-ID.                               25730000
           MOVE 'ACA5'        TO TRAN-ID.                               25740000
           PERFORM 0610-READ-TSQ.                                       25750000
           PERFORM 0540-SEND-POPUP-SCREEN.                              25760000
      *                                                                 25770000
       0540-SEND-POPUP-SCREEN.                                          25780000
           INITIALIZE ACAT90CM-TS-AREA.                                 25790000
           PERFORM 0560-WRITE-ACAT90CM-TS-RTN.                          25800000
           MOVE '$' TO WS-ACAT-NEXT.                                    25810000
           MOVE 'ACAT90CM' TO CALLED-PROGRAM-NAME.                      25820000
           PERFORM 0710-INVOKE-DETAIL-PROGRAM-RTN.                      25830000
                                                                        25840000
       0550-READ-ACAT90CM-TS-RTN.                                       25850000
           MOVE EIBTRMID TO TERM-ID.                                    25860000
           MOVE 'ACA$'   TO TRAN-ID.                                    25870000
           INITIALIZE ACAT90CM-TS-AREA.                                 25880000
           EXEC CICS READQ TS QUEUE(TSQ-NAME)                           25890000
                              INTO(ACAT90CM-TS-AREA)                    25900000
                              LENGTH(LENGTH OF ACAT90CM-TS-AREA)        25910000
                              ITEM(ITEM-NUM)                            25920000
           END-EXEC.                                                    25930000
           IF EIBRESP = +0                                              25940000
              IF ACAT90CM-TS-SCREEN = 'A'                               25950000
                 IF TWA-XFR-REJC-YES   AND                              25960000
                    ACAT90CM-TS-UPDATE                                  25970000
                    SET INPUT-REJC-RC TO TRUE                           25980000
                    MOVE ACAT90CM-TS-MCCMNT-X120 TO TWA-VINITRNF-CMNT   25990000
                 ELSE                                                   26000000
                    CONTINUE                                            26010000
                 END-IF                                                 26020000
              ELSE                                                      26030000
                 IF ACAT90CM-TS-SCREEN = 'T'                            26040000
                    MOVE ACAT90CM-TS-MCTYPE TO TWA-RCV-ACCT-TYPE-CD     26050000
                 ELSE                                                   26060000
                    IF ACAT90CM-TS-SCREEN = 'R ' OR  'X'                26070000
                       CONTINUE                                         26080000
                    END-IF                                              26090000
                 END-IF                                                 26100000
              END-IF                                                    26110000
           END-IF.                                                      26120000
      /                                                                 26130000
       0560-WRITE-ACAT90CM-TS-RTN.                                      26140000
                                                                        26150000
           PERFORM 0570-CALL-ACAT90CM.                                  26160000
                                                                        26170000
           MOVE 'ACA$'   TO TRAN-ID.                                    26180000
           EXEC CICS DELETEQ TS QUEUE(TSQ-NAME)                         26190000
           END-EXEC.                                                    26200000
                                                                        26210000
           EXEC CICS WRITEQ TS QUEUE(TSQ-NAME)                          26220000
                     FROM(ACAT90CM-TS-AREA)                             26230000
                     LENGTH(LENGTH OF ACAT90CM-TS-AREA)                 26240000
                     ITEM(ITEM-NUM)                                     26250000
           END-EXEC.                                                    26260000
           IF EIBRESP NOT = +0                                          26270000
              MOVE LOW-VALUE TO ACAT05AO, ACAT05BO                      26280000
              MOVE 'ACAT05 WRITE TSQ ERROR ON ACA$'                     26290000
                TO SYSTEM-MSG                                           26300000
           END-IF.                                                      26310000
                                                                        26320000
       0570-CALL-ACAT90CM.                                              26330000
                                                                        26340000
           IF EIBAID = DFHPF1  AND                                      26350000
              SEND-ACCT-CMNT                                            26360000
              MOVE 'A'   TO TWA-SCREEN-IND, ACAT90CM-TS-SCREEN          26370000
              MOVE SPACE TO ACAT90CM-TS-UPDATE-IND                      26380000
           ELSE                                                         26390000
              IF EIBAID = DFHPF1 AND                                    26400000
                 SEND-SECR-CMNT                                         26410000
                 MOVE 'S' TO TWA-SCREEN-IND, ACAT90CM-TS-SCREEN         26420000
                 MOVE SPACE TO ACAT90CM-TS-UPDATE-IND                   26430000
              ELSE                                                      26440000
LRM018          IF EIBAID = DFHPF2                                      26450000
LRM018             MOVE 'P' TO TWA-SCREEN-IND, ACAT90CM-TS-SCREEN       26460000
LRM018             MOVE 'Y' TO ACAT90CM-TS-UPDATE-IND                   26470000
LRM018          ELSE                                                    26480000
                 IF EIBAID = DFHPF5                                     26490000
                    MOVE 'R' TO TWA-SCREEN-IND, ACAT90CM-TS-SCREEN      26500000
                    MOVE SPACE TO ACAT90CM-TS-UPDATE-IND                26510000
                 ELSE                                                   26520000
                    IF EIBAID = DFHPF6                                  26530000
                       MOVE 'X' TO TWA-SCREEN-IND, ACAT90CM-TS-SCREEN   26540000
                       MOVE SPACE TO ACAT90CM-TS-UPDATE-IND             26550000
                    ELSE                                                26560000
                       IF EIBAID = DFHENTER AND                         26570000
                          TWA-XFR-REJC-YES                              26580000
                          MOVE 'A' TO TWA-SCREEN-IND, ACAT90CM-TS-SCREEN26590000
                          MOVE 'Y' TO ACAT90CM-TS-UPDATE-IND            26600000
                       END-IF                                           26610000
                    END-IF                                              26620000
                 END-IF                                                 26630000
LRM018          END-IF                                                  26640000
              END-IF                                                    26650000
           END-IF.                                                      26660000
                                                                        26670000
           MOVE EIBTRMID      TO TERM-ID.                               26680000
           MOVE 'ACA5'        TO TRAN-ID.                               26690000
           PERFORM 0600-DELETE-TSQ.                                     26700000
           PERFORM 0620-WRITE-TSQ.                                      26710000
                                                                        26720000
      **** MOVE FIELDS TO ACAT90CM-TS-AREA ========>                    26730000
                                                                        26740000
           MOVE TWA-BRANCH-CD              TO ACAT90CM-TS-MBR.          26750000
           MOVE TWA-ACCT-CD                TO ACAT90CM-TS-MAC.          26760000
           MOVE TWA-RR-CD                  TO ACAT90CM-TS-MRR.          26770000
           MOVE TWA-RCV-ACCT-TYPE-CD       TO ACAT90CM-TS-MCTYPE.       26780000
           MOVE TWA-DLVR-NBR               TO ACAT90CM-TS-MCBRKR.       26790000
           MOVE SPACE                      TO ACAT90CM-TS-MCBNAM.       26800000
           MOVE TWA-ACCT-DLVR-NBR          TO ACAT90CM-TS-MCACCT.       26810000
           MOVE TWA-RCV-CUST-NM            TO WS-CUSTNM.                26820000
           MOVE WS-CUSTNM-LN1              TO ACAT90CM-TS-MNAME.        26830000
           MOVE WS-CUSTNM-LN2              TO ACAT90CM-TS-MNAME2.       26840000
           MOVE SPACE                      TO ACAT90CM-TS-MNAME3.       26850000
           MOVE TWA-RCV-SS-PRIM-NBR        TO ACAT90CM-TS-MSSN.         26860000
           MOVE TWA-RCV-SS-SCNDY-NBR       TO ACAT90CM-TS-MSSN2.        26870000
                                                                        26880000
           IF ACAT90CM-TS-SCREEN = 'A'                                  26890000
              IF TWA-VINITRNF-CMNT > SPACE                              26900000
                 MOVE TWA-VINITRNF-CMNT    TO ACAT90CM-TS-MCCMNT-X120   26910000
              ELSE                                                      26920000
                 MOVE TWA-VTRNFR-CMNT      TO ACAT90CM-TS-MCCMNT-X120   26930000
              END-IF                                                    26940000
ET0002        IF  TWA-XFR-REJC-YES                                      26950000
ET0002        AND (TWA-TFR-TYPE = 'PTR')                                26960000
ET0002        AND (TWA-STTS-CD = '500')                                 26970000
ET0002        AND (TWA-INIT-TRANS-TYPE-CD NOT = 'R')                    26980000
ET0002                MOVE SPACE           TO ACAT90CM-TS-MCCMNT-X120   26990000
ET0002        END-IF                                                    27000000
           ELSE                                                         27010000
              IF ACAT90CM-TS-SCREEN = 'S'                               27020000
                 MOVE TWA-ASSET-CMNT       TO ACAT90CM-TS-MCCMNT-X120   27030000
              END-IF                                                    27040000
           END-IF.                                                      27050000
                                                                        27060000
           IF ACAT90CM-TS-SCREEN = 'X'                                  27070000
             MOVE TWA-ACCT-ACTIVITY-IND   TO ACAT90CM-ACCT-ACTIVITY-IND 27080000
             MOVE TWA-ACCT-ORDERS-IND     TO ACAT90CM-ACCT-ORDERS-IND   27090000
             MOVE TWA-ACCT-RJCT-RSBM-IND  TO ACAT90CM-ACCT-RJCT-RSBM-IND27100000
             MOVE TWA-ACCT-DB-BAL-T1-IND  TO ACAT90CM-ACCT-DB-BAL-T1-IND27110000
             MOVE TWA-ACCT-MRGN-DB-IND    TO ACAT90CM-ACCT-MRGN-DB-IND  27120000
             MOVE TWA-ACCT-SHRT-PSTN-IND  TO ACAT90CM-ACCT-SHRT-PSTN-IND27130000
             MOVE TWA-ACCT-SEC-RSTRD-IND  TO ACAT90CM-ACCT-SEC-RSTRD-IND27140000
             MOVE TWA-ACCT-AST-EXCS-IND   TO ACAT90CM-ACCT-AST-EXCS-IND 27150000
             MOVE TWA-ACCT-OPTN-PSTN-IND  TO ACAT90CM-ACCT-OPTN-PSTN-IND27160000
             MOVE TWA-ACCT-LTD-PRTNR-IND  TO ACAT90CM-ACCT-LTD-PRTNR-IND27170000
             MOVE TWA-ACCT-TIN-MSMTH-IND  TO ACAT90CM-ACCT-TIN-MSMTH-IND27180000
             MOVE TWA-ACCT-DPLCT-TRN-IND  TO ACAT90CM-ACCT-DPLCT-TRN-IND27190000
             MOVE TWA-ACCT-CUST-70-IND    TO ACAT90CM-ACCT-CUST-70-IND  27200000
             MOVE TWA-ACCT-QULFD-PLN-IND  TO ACAT90CM-ACCT-QULFD-PLN-IND27210000
             MOVE TWA-ACCT-MNGD-IND       TO ACAT90CM-ACCT-MNGD-IND     27220000
             MOVE TWA-ACCT-PRVT-RNG-IND   TO ACAT90CM-ACCT-PRVT-RNG-IND 27230000
             MOVE TWA-ACCT-BRKR-TIF-IND   TO ACAT90CM-ACCT-BRKR-TIF-IND 27240000
             MOVE TWA-NSCC-NON-ADP-IND    TO ACAT90CM-NSCC-NON-ADP-IND  27250000
             MOVE TWA-COMMENTS-IND        TO ACAT90CM-COMMENTS-IND      27260000
ET0011       MOVE TWA-ACCT-FRZN-IND     TO ACAT90CM-BATCH-FREEZE-FND-IND27270000
ET0011       IF TWA-FREEZ-TYPE = 'YYYY'                                 27280000
ET0011          MOVE 'F'                TO ACAT90CM-ACCOUNT-FREEZE-IND  27290000
ET0011          MOVE SPACE              TO ACAT90CM-FREEZE-CASH-IN-IND  27300000
ET0011                                     ACAT90CM-FREEZE-CASH-OUT-IND 27310000
ET0011                                     ACAT90CM-FREEZE-SEC-IN-IND   27320000
ET0011                                     ACAT90CM-FREEZE-SEC-OUT-IND  27330000
ET0011       ELSE                                                       27340000
ET0011          MOVE SPACE              TO ACAT90CM-ACCOUNT-FREEZE-IND  27350000
ET0011          MOVE TWA-FREEZ-CASH-IN  TO ACAT90CM-FREEZE-CASH-IN-IND  27360000
ET0011          MOVE TWA-FREEZ-CASH-OUT TO ACAT90CM-FREEZE-CASH-OUT-IND 27370000
ET0011          MOVE TWA-FREEZ-SEC-IN   TO ACAT90CM-FREEZE-SEC-IN-IND   27380000
ET0011          MOVE TWA-FREEZ-SEC-OUT  TO ACAT90CM-FREEZE-SEC-OUT-IND  27390000
ET0011       END-IF                                                     27400000
LRM015       MOVE TWA-GIFT-IND          TO ACAT90CM-GIFT-IND            27410000
DJ0003       MOVE TWA-AUCTION-RATE-IND  TO ACAT90CM-AUCTION-RATE-IND    27420000
LRM022       MOVE TWA-SUB-PENNY-PRICE-IND                               27421000
LRM022                                  TO ACAT90CM-SUB-PENNY-PRICE-IND 27422000
           END-IF.                                                      27430000
      /                                                                 27440000
       0600-DELETE-TSQ.                                                 27450000
                                                                        27460000
           EXEC CICS DELETEQ TS QUEUE(TSQ-NAME)                         27470000
           END-EXEC.                                                    27480000
                                                                        27490000
       0610-READ-TSQ.                                                   27500000
                                                                        27510000
           EXEC CICS READQ TS QUEUE(TSQ-NAME)                           27520000
                              INTO (TWA-AREA)                           27530000
                              LENGTH(LENGTH OF TWA-AREA)                27540000
                              ITEM(ITEM-NUM)                            27550000
           END-EXEC.                                                    27560000
           IF (EIBRESP NOT = +0)                                        27570000
           AND (NOT FIRST-TIME)                                         27580000
               MOVE LOW-VALUE TO ACAT05AO, ACAT05BO                     27590000
               MOVE 'ACAT05RN READ TSQ ERROR'                           27600000
               TO SYSTEM-MSG                                            27610000
               PERFORM 0830-ERROR-RTN                                   27620000
           END-IF.                                                      27630000
                                                                        27640000
       0620-WRITE-TSQ.                                                  27650000
                                                                        27660000
           EXEC CICS WRITEQ TS QUEUE(TSQ-NAME)                          27670000
                              FROM(TWA-AREA)                            27680000
                              LENGTH(LENGTH OF TWA-AREA)                27690000
                              ITEM(ITEM-NUM)                            27700000
           END-EXEC.                                                    27710000
           IF (EIBRESP NOT = +0)                                        27720000
           AND (NOT FIRST-TIME)                                         27730000
              MOVE 'ACAT05RN WRITE TSQ ERROR.' TO SYSTEM-MSG            27740000
           END-IF.                                                      27750000
      /                                                                 27760000
       0630-BUILD-ACAT0F01-TS-RTN.                                      27770000
      *                                                                 27780000
           MOVE EIBTRMID      TO TERM-ID.                               27790000
           MOVE 'ACA5'        TO TRAN-ID.                               27800000
           PERFORM 0610-READ-TSQ.                                       27810000
      *                                                                 27820000
           INITIALIZE ACAT0F01-COMMAREA.                                27830000
           MOVE TWA-CLIENT-NBR       TO ACAT0F01-CLIENT-NBR.            27840000
           MOVE TWA-ACAT-CONTROL-NBR TO ACAT0F01-CONTROL-NBR.           27850000
           MOVE TWA-SEC-NBR          TO ACAT0F01-ISIN-SEC-ISSUE-CD.     27860000
           MOVE TWA-SV-ASSET-SEQ-NBR TO ACAT0F01-ASSET-SEQ-NBR.         27870000
           MOVE TWA-ASSET-DESC       TO ACAT0F01-ASSET-DESC.            27880000
           MOVE TWA-BRANCH-CD        TO ACAT0F01-BRANCH.                27890000
           MOVE TWA-ACCT-CD          TO ACAT0F01-ACCOUNT.               27900000
           MOVE TWA-RR-CD            TO ACAT0F01-ACCT-RR-CD.            27910000
LRM003     MOVE 'ACAT05RN'           TO ACAT0F01-CALL-RTN-PROGRAM.      27920000
                                                                        27930000
           MOVE EIBTRMID TO TERM-ID.                                    27940000
           MOVE 'AMFX'   TO TRAN-ID.                                    27950000
           EXEC CICS DELETEQ TS QUEUE(TSQ-NAME)                         27960000
           END-EXEC.                                                    27970000
                                                                        27980000
           EXEC CICS WRITEQ TS QUEUE(TSQ-NAME)                          27990000
                     FROM(ACAT0F01-COMMAREA)                            28000000
                     LENGTH(LENGTH OF ACAT0F01-COMMAREA)                28010000
                     ITEM(ITEM-NUM)                                     28020000
           END-EXEC.                                                    28030000
           IF EIBRESP NOT = +0                                          28040000
              MOVE 'ACAT05 WRITE TSQ ERROR ON AMFX'                     28050000
                TO TWA-RETURN-MSG                                       28060000
           END-IF.                                                      28070000
      /                                                                 28080000
       0700-PROCESS-JUMP-RTN.                                           28090000
           MOVE TWA-M5NEXT   TO WS-ACAT-NEXT.                           28100000
       COPY ACATJUMP.                                                   28110000
           IF CALLED-PROGRAM-NAME = SPACES                              28120000
              MOVE LOW-VALUE TO ACAT05AO ACAT05BO                       28130000
              MOVE EIBTRMID         TO TERM-ID                          28140000
              MOVE 'ACA5'           TO TRAN-ID                          28150000
              PERFORM 0610-READ-TSQ                                     28160000
              SET CURSOR-ON-M5NEXT   TO TRUE                            28170000
              MOVE ATT-UNPROT-BRT     TO M5NEXTA                        28180000
              MOVE 'NEXT TRANSACTION SELECTION IS INVALID' TO           28190000
                  SYSTEM-MSG                                            28200000
              PERFORM 0830-ERROR-RTN.                                   28210000
                                                                        28220000
           MOVE WS-ACAT-NEXT TO ACAT-NEXT ACAT-INP-SEL.                 28230000
           SET CURSOR-ON-M5NEXT   TO TRUE                               28240000
           PERFORM SCREEN-SECURITY-CHECK.                               28250000
           MOVE 'ACAT05RN' TO  ACAT-CALLING-PROG-NAME.                  28260000
           PERFORM 0710-INVOKE-DETAIL-PROGRAM-RTN.                      28270000
                                                                        28280000
       EJECT                                                            28290000
                                                                        28300000
       0710-INVOKE-DETAIL-PROGRAM-RTN.                                  28310000
           EXEC CICS XCTL PROGRAM(CALLED-PROGRAM-NAME)                  28320000
                          COMMAREA(ACATCOMM-COMMAREA)                   28330000
           END-EXEC.                                                    28340000
                                                                        28350000
       0720-RETURN-FROM-DETAIL-RTN.                                     28360000
           MOVE EIBTRMID      TO TERM-ID.                               28370000
           MOVE 'ACAX'        TO TRAN-ID.                               28380000
           PERFORM 0600-DELETE-TSQ.                                     28390000
           SET FIRST-TIME TO TRUE.                                      28400000
                                                                        28410000
       0799-CALL-SECLINK-RTN.                                           28420000
           EXEC CICS LINK PROGRAM ('SECLINK')                           28430000
                COMMAREA(SECLINK-LIST)                                  28440000
                LENGTH(LENGTH OF SECLINK-LIST)                          28450000
           END-EXEC.                                                    28460000
                                                                        28470000
       EJECT                                                            28480000
           EJECT                                                        28490000
                                                                        28500000
       0800-SEND-MAP-RETURN.                                            28510000
                                                                        28520000
           MOVE SYSTEM-MSG     TO  TRLMSGO.                             28530000
           IF  SYSTEM-MSG NOT = SPACES                                  28540000
               MOVE ATT-ASKIP-BRT  TO  TRLMSGO                          28550000
           END-IF.                                                      28560000
           IF  DATA-ONLY                                                28570000
               PERFORM 0850-SEND-MAP-DATA-ONLY                          28580000
           ELSE                                                         28590000
               PERFORM 0870-SEND-MAP-ERASE                              28600000
           END-IF.                                                      28610000
           MOVE 'ACAT05RN' TO ACAT-PROGRAM-NAME.                        28620000
           MOVE 'E'        TO ACAT-NEXT, ACAT-INP-SEL.                  28630000
           PERFORM 0900-RETURN-TO-CICS.                                 28640000
                                                                        28650000
           EJECT                                                        28660000
                                                                        28670000
       0810-MAP-INPUT-AREA.                                             28680000
                                                                        28690000
           MOVE LOW-VALUES              TO ACAT05AO, ACAT05BO.          28700000
           MOVE  SPACE   TO  M5REJO M5REJCO M5ACCPTO.                   28710000
ET0001     MOVE  SPACE   TO  M5ACCELO.                                  28720000
           MOVE  TWA-BRANCH-CD          TO ACAT-BR, M5BRO.              28730000
           MOVE  TWA-ACCT-CD            TO ACAT-AC, M5ACO.              28740000
           MOVE  TWA-RR-CD              TO M5RRO.                       28750000
           MOVE  TWA-ACAT-CONTROL-NBR   TO M5CNBRO.                     28760000
           MOVE  TWA-RCV-ACCT-TYPE-CD   TO M5CSTPO.                     28770000
           MOVE  TWA-DLVR-NBR           TO M5CBRBRO.                    28780000
           MOVE  TWA-ACCT-DLVR-NBR      TO M5CACCTO.                    28790000
           MOVE  TWA-RCV-CUST-NM        TO WS-CUSTNM.                   28800000
           MOVE  WS-CUSTNM-LN1          TO M5NAMEO.                     28810000
           MOVE  WS-CUSTNM-LN2          TO M5NAME2O.                    28820000
           IF TWA-RCV-SS-PRIM-NBR = SPACES OR LOW-VALUES OR ZEROS       28830000
               MOVE SPACES              TO M5SSN1O                      28840000
           ELSE                                                         28850000
               MOVE TWA-RCV-SS-PRIM-NBR TO WS-SSN-ONE                   28860000
               MOVE WS-SSN-ONE-1        TO WS-SSN-ONE-1R                28870000
               MOVE WS-SSN-ONE-2        TO WS-SSN-ONE-2R                28880000
               MOVE WS-SSN-ONE-3        TO WS-SSN-ONE-3R                28890000
               MOVE WS-SSN-ONE-REFORM   TO M5SSN1O                      28900000
           END-IF.                                                      28910000
                                                                        28920000
           IF TWA-RCV-SS-SCNDY-NBR = SPACES OR LOW-VALUES OR ZEROS      28930000
               MOVE SPACES              TO M5SSN2O                      28940000
           ELSE                                                         28950000
               MOVE TWA-RCV-SS-SCNDY-NBR TO WS-SSN-TWO                  28960000
               MOVE WS-SSN-TWO-1        TO WS-SSN-TWO-1R                28970000
               MOVE WS-SSN-TWO-2        TO WS-SSN-TWO-2R                28980000
               MOVE WS-SSN-TWO-3        TO WS-SSN-TWO-3R                28990000
               MOVE WS-SSN-TWO-REFORM   TO M5SSN2O                      29000000
           END-IF.                                                      29010000
                                                                        29020000
           MOVE  TWA-TFR-TYPE           TO M5TFRTPO.                    29030000
           IF TWA-STTLM-DT = '0001-01-01'                               29040000
              MOVE   SPACES             TO M5SDO                        29050000
           ELSE                                                         29060000
              MOVE  TWA-STTLM-DT        TO M5SDO                        29070000
           END-IF.                                                      29080000
           MOVE  TWA-RCV-ACCT-TYPE-CD   TO M5CSTPO.                     29090000
ET0010**   MOVE  TWA-TRNFR-TYPE-RSN-CD  TO M5RSNCDO.                    29100000
      *                                                                 29110000
           IF TWA-CASH-ASSET                                            29120000
              MOVE '01'                      TO M5STYPEO                29130000
           ELSE                                                         29140000
              IF TWA-MARGIN-ASSET                                       29150000
                 MOVE '02'                   TO M5STYPEO                29160000
              ELSE                                                      29170000
                 IF TWA-SHORT-ASSET                                     29180000
                    MOVE '05'                TO M5STYPEO                29190000
                 END-IF                                                 29200000
              END-IF                                                    29210000
           END-IF.                                                      29220000
                                                                        29230000
           IF TWA-ALERT-IND = 'Y'                                       29240000
              MOVE 'ACCOUNT HAS AN ALERT MSG - SEE "W" SCREEN FOR DETAIL29250000
      -            'S'      TO  M5ALMSGO                                29260000
           ELSE                                                         29270000
              MOVE  SPACES  TO  M5ALMSGO                                29280000
           END-IF.                                                      29290000
                                                                        29300000
      **<< BAL01 >>                                                     29310000
           IF TWA-BAL01 IS NOT NUMERIC                                  29320000
              MOVE +0         TO WS-BAL01-DEC2                          29330000
           ELSE                                                         29340000
              MOVE TWA-BAL01  TO WS-BAL01-DEC2                          29350000
           END-IF.                                                      29360000
                                                                        29370000
      **<< BAL02 >>                                                     29380000
           IF TWA-BAL02 IS NOT NUMERIC                                  29390000
              MOVE +0         TO WS-BAL02-DEC2                          29400000
           ELSE                                                         29410000
              MOVE TWA-BAL02  TO WS-BAL02-DEC2                          29420000
           END-IF.                                                      29430000
                                                                        29440000
      **<< BAL05 >>                                                     29450000
           IF TWA-BAL05 IS NOT NUMERIC                                  29460000
              MOVE +0         TO WS-BAL05-DEC2                          29470000
           ELSE                                                         29480000
              MOVE TWA-BAL05  TO WS-BAL05-DEC2                          29490000
           END-IF.                                                      29500000
                                                                        29510000
LRM023     IF TWA-BAL01-FULL-RQST = 'F'                                 29511000
LRM023        IF TWA-BAL01-FULL-DB-CR = 'C'                             29512000
LRM023           MOVE '            FULL-' TO M5BAL01I                   29513000
LRM023        ELSE                                                      29513100
LRM023           MOVE '            FULL ' TO M5BAL01I                   29514000
LRM023        END-IF                                                    29515000
LRM023     ELSE                                                         29516000
LRM023        MOVE  WS-BAL01-DEC2         TO M5BAL01O                   29520000
LRM023     END-IF.                                                      29520100
                                                                        29521000
LRM023     IF TWA-BAL02-FULL-RQST = 'F'                                 29522000
LRM023        IF TWA-BAL02-FULL-DB-CR = 'C'                             29523000
LRM023           MOVE '            FULL-' TO M5BAL02I                   29524000
LRM023        ELSE                                                      29525000
LRM023           MOVE '            FULL ' TO M5BAL02I                   29526000
LRM023        END-IF                                                    29527000
LRM023     ELSE                                                         29528000
              MOVE  WS-BAL02-DEC2         TO M5BAL02O                   29530000
LRM023     END-IF.                                                      29531000
                                                                        29531100
LRM023     IF TWA-BAL05-FULL-RQST = 'F'                                 29532000
LRM023        IF TWA-BAL05-FULL-DB-CR = 'C'                             29533000
LRM023           MOVE '            FULL-' TO M5BAL05I                   29534000
LRM023        ELSE                                                      29535000
LRM023           MOVE '            FULL ' TO M5BAL05I                   29536000
LRM023        END-IF                                                    29537000
LRM023     ELSE                                                         29538000
              MOVE  WS-BAL05-DEC2         TO M5BAL05O                   29540000
LRM023     END-IF.                                                      29541000
                                                                        29550000
           EVALUATE TWA-STTS-CD                                         29560000
               WHEN '100'                                               29570000
                    MOVE TWA-DAYS            TO MSG-100-N               29580000
                    MOVE MSG-100             TO M5STATO                 29590000
               WHEN '110'                                               29600000
                    MOVE TWA-DAYS            TO MSG-110-N               29610000
                    MOVE MSG-110             TO M5STATO                 29620000
               WHEN '120'                                               29630000
                    MOVE TWA-DAYS            TO MSG-120-N               29640000
                    MOVE MSG-120             TO M5STATO                 29650000
               WHEN '130'                                               29660000
                    MOVE TWA-DAYS            TO MSG-130-N               29670000
                    MOVE MSG-130             TO M5STATO                 29680000
               WHEN '140'                                               29690000
                    MOVE TWA-DAYS            TO MSG-140-N               29700000
                    MOVE MSG-140             TO M5STATO                 29710000
               WHEN '200'                                               29720000
                    MOVE TWA-DAYS            TO MSG-200-N               29730000
                    MOVE MSG-200             TO M5STATO                 29740000
               WHEN '210'                                               29750000
                    MOVE TWA-DAYS            TO MSG-210-N               29760000
                    MOVE MSG-210             TO M5STATO                 29770000
               WHEN '220'                                               29780000
                    MOVE TWA-DAYS            TO MSG-220-N               29790000
                    MOVE MSG-220             TO M5STATO                 29800000
               WHEN '230'                                               29810000
                    MOVE TWA-DAYS            TO MSG-230-N               29820000
                    MOVE MSG-230             TO M5STATO                 29830000
               WHEN '300'                                               29840000
                    MOVE TWA-DAYS            TO MSG-300-N               29850000
                    MOVE MSG-300             TO M5STATO                 29860000
               WHEN '310'                                               29870000
                    MOVE TWA-DAYS            TO MSG-310-N               29880000
                    MOVE MSG-310             TO M5STATO                 29890000
               WHEN '400'                                               29900000
                    MOVE TWA-DAYS            TO MSG-400-N               29910000
                    MOVE MSG-400             TO M5STATO                 29920000
               WHEN '500'                                               29930000
                    MOVE TWA-DAYS            TO MSG-500-N               29940000
                    MOVE MSG-500             TO M5STATO                 29950000
               WHEN '510'                                               29960000
                    MOVE TWA-DAYS            TO MSG-510-N               29970000
                    MOVE MSG-510             TO M5STATO                 29980000
               WHEN OTHER                                               29990000
                    MOVE TWA-STTS-CD         TO M5STATO                 30000000
           END-EVALUATE.                                                30010000
                                                                        30020000
           MOVE TWA-RSCD01            TO MRSCD01O.                      30030000
           MOVE TWA-RSCD02            TO MRSCD02O.                      30040000
           MOVE TWA-RSCD05            TO MRSCD05O.                      30050000
ET0010**   MOVE TWA-TRNFR-TYPE-RSN-CD TO M5RSNCDO.                      30060000
           MOVE TWA-M5NEXT     TO M5NEXTO.                              30070000
           MOVE TWA-MBR        TO MMBRO.                                30080000
           MOVE TWA-MAC        TO MMACO.                                30090000
           MOVE TWA-MRR        TO MMRRO                                 30100000
           MOVE TWA-MCBRKR     TO MMBKRO.                               30110000
           MOVE TWA-MTFR       TO MMTFRO.                               30120000
           MOVE TWA-MSTAT      TO MMSTATO.                              30130000
ET0001     IF TWA-TFR-TYPE  = 'RCL'                                     30140000
ET0001        MOVE ATT-UNPROT TO M5ACCELA                               30150000
ET0001     ELSE                                                         30160000
ET0001        MOVE ATT-ASKIP  TO M5ACCELA                               30170000
ET0001     END-IF.                                                      30180000
                                                                        30190000
ET0005     MOVE SPACE TO CMNTINDO.                                      30200000
ET0005                                                                  30210000
ET0005     IF ((TWA-VINITRNF-CMNT > SPACE) OR (TWA-VTRNFR-CMNT > SPACE))30220000
ET0005     AND (TWA-ASSET-CMNT > SPACE)                                 30230000
ET0005          MOVE 'COMMENTS EXIST'  TO CMNTINDO                      30240000
ET0005     ELSE                                                         30250000
ET0005     IF ((TWA-VINITRNF-CMNT > SPACE) OR (TWA-VTRNFR-CMNT > SPACE))30260000
ET0005     AND (TWA-ASSET-CMNT = SPACE OR LOW-VALUE)                    30270000
ET0005          MOVE 'ACCOUNT COMMENT' TO CMNTINDO                      30280000
ET0005     ELSE                                                         30290000
ET0005     IF ((TWA-VINITRNF-CMNT = SPACE OR LOW-VALUE)  AND            30300000
ET0005         (TWA-VTRNFR-CMNT   = SPACE OR LOW-VALUE))                30310000
ET0005     AND (TWA-ASSET-CMNT > SPACE)                                 30320000
ET0005          MOVE 'ASSET COMMENT '  TO CMNTINDO                      30330000
ET0005     END-IF.                                                      30340000
                                                                        30350000
ET0008     MOVE SPACE TO M5WARNO.                                       30360000
ET0008     IF  TWA-STTS-CD = '200'                                      30370000
ET0008     AND TWA-MFC-FRV-DUPE-IND = 'Y'                               30380000
ET0008         MOVE 'POSSIBLE DUPE - VERIFY BY 3:00PM' TO M5WARNO       30390000
ET0008     END-IF.                                                      30400000
ET0008                                                                  30410000
           PERFORM 0820-MAP-INPUT-ASSET.                                30420000
       0810-EXIT.                                                       30430000
           EXIT.                                                        30440000
       EJECT                                                            30450000
      *                                                                 30460000
       0820-MAP-INPUT-ASSET.                                            30470000
                                                                        30480000
           MOVE LOW-VALUES    TO M5SECRO, M5STYPEO, M5WIO, M5SLOCO,     30490000
                                 M5DESCO, M5DESC2O, M5DESC3O.           30500000
ET0006     MOVE LOW-VALUES    TO M5TAGO.                                30510000
           MOVE ZEROS         TO M5QTYO, M5AMTO.                        30520000
           MOVE TWA-SEC-NBR   TO M5SECRO.                               30530000
*                                                                       30540000
           IF TWA-CASH-ASSET                                            30550000
              MOVE '01'  TO  M5STYPEO                                   30560000
           ELSE                                                         30570000
              IF TWA-MARGIN-ASSET                                       30580000
                 MOVE '02' TO M5STYPEO                                  30590000
              ELSE                                                      30600000
                 IF TWA-SHORT-ASSET                                     30610000
                    MOVE '05' TO M5STYPEO                               30620000
                 END-IF                                                 30630000
              END-IF                                                    30640000
           END-IF.                                                      30650000
                                                                        30660000
ET0010     MOVE  TWA-TRNFR-TYPE-RSN-CD TO M5RSNCDO.                     30670000
           MOVE  TWA-WHEN-ISSUED    TO M5WIO.                           30680000
           MOVE  TWA-STTLM-LOCATION TO M5SLOCO.                         30690000
           MOVE  TWA-ASSET-DESC     TO WS-ASSET-DESC.                   30700000
           MOVE  WS-ASSET-DESC1     TO M5DESCO.                         30710000
           MOVE  WS-ASSET-DESC2     TO M5DESC2O.                        30720000
           MOVE  WS-ASSET-DESC3     TO M5DESC3O.                        30730000
ET0006     MOVE  TWA-CAGE-TAG       TO M5TAGO TWA-CAGE-TAG-PREV.        30740000
ET0006     IF  (TWA-TFR-TYPE = 'FRV' OR 'MFC')                          30750000
ET0006     AND (TWA-STTS-CD = '200')                                    30760000
ET0006     AND (WS-UPDATE-OK)                                           30770000
ET0006          MOVE ATT-UNPROT  TO M5TAGA                              30780000
ET0006     ELSE                                                         30790000
ET0006          MOVE ATT-ASKIP   TO M5TAGA                              30800000
ET0006     END-IF.                                                      30810000
      *                                                                 30820000
           IF TWA-RESTRICTED-IND = 'Y'                                  30830000
              MOVE 'SECURITY RESTRICTED - SEE "X" SCREEN FOR DETAILS'   30840000
                TO  M5RSMSGO                                            30850000
           ELSE                                                         30860000
              MOVE  SPACES  TO  M5RSMSGO                                30870000
           END-IF.                                                      30880000
      *                                                                 30890000
      **<< ASSET QTY >>                                                 30900000
LRM009     IF TWA-TFR-TYPE = 'PTR'                                      30910000
LRM009     AND TWA-ASSET-RQST-QTY-CD = 'F'                              30920000
LRM025        IF TWA-PSTN-CD = 'S'                                      30921000
LRM025           MOVE '   FULL RQST SHORT' TO M5QTYI                    30921100
LRM025        ELSE                                                      30921200
LRM009           MOVE '         FULL RQST' TO M5QTYI                    30922000
LRM009     ELSE                                                         30940000
           IF TWA-ASSET-QTY IS NUMERIC                                  30950000
              MOVE TWA-ASSET-QTY TO WS-QTY-DEC4                         30960000
              IF TWA-OPTN-CTGY-CD > '00'                                30970000
                 IF TWA-OPT-SELL                                        30980000
                    COMPUTE WS-QTY-DEC4 = WS-QTY-DEC4 * -1              30990000
                 END-IF                                                 31000000
              ELSE                                                      31010000
                 IF TWA-SHORT-ASSET-QTY                                 31020000
                    COMPUTE WS-QTY-DEC4 = WS-QTY-DEC4 * -1              31030000
                 END-IF                                                 31040000
              END-IF                                                    31050000
              MOVE WS-QTY-DEC4 TO M5QTYO                                31060000
           END-IF.                                                      31070000
      *                                                                 31080000
      **<< ASSET AMT >>                                                 31090000
           IF TWA-ASSET-AMT IS NUMERIC                                  31100000
              MOVE TWA-ASSET-AMT TO WS-ASSET-DEC2                       31110000
              IF TWA-SHORT-ASSET-QTY                                    31120000
                 COMPUTE WS-ASSET-DEC2 = WS-ASSET-DEC2 * -1             31130000
              END-IF                                                    31140000
              MOVE TWA-ASSET-AMT TO WS-MQTY-ED-D2                       31150000
              MOVE WS-MQTY-ED-D2 TO M5AMTO                              31160000
           END-IF.                                                      31170000
      *                                                                 31180000
      **<< REJECT >>                                                    31190000
           IF TWA-INIT-TRANS-TYPE-CD = 'R'                              31200000
              MOVE ATT-PROT  TO  M5ACCPTA                               31210000
              MOVE ATT-UNPROT TO M5REJA, M5REJCA                        31220000
              IF TWA-VINITRNF-CMNT = SPACES OR LOW-VALUES               31230000
                 MOVE 'Y' TO M5REJO                                     31240000
                 SET CURSOR-ON-M5REJ TO TRUE                            31250000
              ELSE                                                      31260000
                 MOVE 'Y' TO M5REJCO                                    31270000
                 SET CURSOR-ON-M5REJC TO TRUE                           31280000
              END-IF                                                    31290000
           END-IF.                                                      31300000
ET0001*                                                                 31310000
ET0001**<< ACCELERATE >>                                                31320000
ET0001     IF TWA-INIT-TRANS-TYPE-CD = 'X'                              31330000
ET0001        MOVE ATT-PROT   TO M5ACCPTA M5REJA M5REJCA                31340000
ET0001        MOVE 'Y'        TO M5ACCELO                               31350000
ET0001     END-IF.                                                      31360000
                                                                        31370000
      *                                                                 31380000
      **<< ACCEPT >>                                                    31390000
           IF TWA-VTRNFR-NSCC-PEND-CD = 'A'                             31400000
              MOVE ATT-PROT     TO M5REJA, M5REJCA                      31410000
              MOVE ATT-UNPROT   TO M5ACCPTA                             31420000
              MOVE 'Y'          TO M5ACCPTO                             31430000
     *        MOVE 'S'          TO TWA-M5ACCPT                          31440000
ET0001**      SET CURSOR-ON-M5ACCPT TO TRUE                             31450000
           END-IF.                                                      31460000
                                                                        31470000
     *                                                                  31480000
           IF (SYSTEM-MSG  = SPACES OR LOW-VALUES)                      31490000
              IF TWA-INIT-TRANS-TYPE-CD = 'R'                           31500000
                 IF TWA-VINITRNF-NSCC-PEND-CD = 'H'                     31510000
ET0011**            MOVE 'TRANSFER FLAGGED TO BE REJECTED'              31520000
ET0011              MOVE 'TRANSFER FLAGGED TO BE REJECTED ON HOLD'      31530000
                         TO TWA-RETURN-MSG                              31540000
ET0011**            MOVE ' ' TO M5REJO M5REJCO                          31550000
                 ELSE                                                   31560000
                 IF TWA-VINITRNF-NSCC-PEND-CD = ' '                     31570000
                    MOVE 'TRANSFER REJECT REQUEST WILL BE SENT TO NSCC' 31580000
                         TO TWA-RETURN-MSG                              31590000
                 ELSE                                                   31600000
                 IF TWA-VINITRNF-NSCC-PEND-CD = 'Y'                     31610000
                    MOVE 'TRANSFER REJECT REQUEST WAS SENT TO NSCC'     31620000
                         TO TWA-RETURN-MSG                              31630000
                 END-IF END-IF END-IF                                   31640000
              ELSE                                                      31650000
                 IF TWA-VTRNFR-NSCC-PEND-CD = 'A'                       31660000
LRM018             IF TWA-TFR-TYPE = 'FRV'                              31670000
LRM018             AND (WS-UPDATE-OK)                                   31680000
LRM018              MOVE                                                31690000
LRM018       'THIS TRANSFER HAS BEEN ACCEPTED/PRESS PF2 TO CREATE SPAD' 31700000
LRM018                   TO TWA-RETURN-MSG                              31710000
LRM018             ELSE                                                 31720000
                    MOVE 'THIS TRANSFER HAS BEEN ACCEPTED'              31730000
                         TO TWA-RETURN-MSG                              31740000
LRM018             END-IF                                               31750000
                 ELSE                                                   31760000
                    SET CURSOR-ON-M5NEXT TO TRUE                        31770000
                    MOVE SPACES TO TWA-M5REJ, TWA-M5REJC,               31780000
                                   TWA-M5ACCPT                          31790000
                    MOVE SPACES TO M5ACCPTO, M5REJO, M5REJCO,           31800000
                    MOVE ATT-UNPROT TO M5ACCPTA, M5REJA, M5REJCA        31810000
                 END-IF                                                 31820000
              END-IF                                                    31830000
           END-IF.                                                      31840000
                                                                        31850000
           IF TWA-VINITRNF-NSCC-PEND-CD = 'Y'                           31860000
              SET CURSOR-ON-M5NEXT TO TRUE                              31870000
              MOVE ATT-ASKIP  TO M5REJA, M5REJCA, M5ACCPTA              31880000
              MOVE SPACES TO TWA-M5ACCPT, TWA-M5REJ, TWA-M5REJC         31890000
              MOVE SPACES TO M5REJO, M5REJCO, M5ACCPTO                  31900000
              MOVE 'TRANSFER REJECT REQUEST WAS SENT TO NSCC'           31910000
                TO SYSTEM-MSG                                           31920000
           ELSE                                                         31930000
              IF TWA-VTRNFR-FOUND   AND                                 31940000
                 (TWA-STTS-CD < '200'  OR                               31950000
                  TWA-STTS-CD > '230')                                  31960000
ET0002            AND (TWA-TFR-TYPE NOT = 'PTR'                         31970000
ET0002              AND TWA-STTS-CD = '500')                            31980000
ET0001**          MOVE ATT-UNPROT-BRT  TO  M5NEXTA                      31990000
                  MOVE ATT-PROT  TO M5REJA, M5REJCA, M5ACCPTA           32000000
                  MOVE 'THIS TIF IS NOT IN REVIEW STATUS, BROWSE ONLY!' 32010000
                  TO TWA-RETURN-MSG                                     32020000
              ELSE                                                      32030000
                  IF TWA-RETURN-MSG > SPACES OR                         32040000
                     SYSTEM-MSG     > SPACES                            32050000
ET0001**             MOVE ATT-UNPROT-BRT TO M5REJA, M5REJCA, M5ACCPTA   32060000
ET0001               CONTINUE                                           32070000
                  ELSE                                                  32080000
                     SET CURSOR-ON-M5NEXT TO TRUE                       32090000
                     MOVE SPACES TO M5REJO, M5REJCO, M5ACCPTO,          32100000
                          TWA-M5REJ, TWA-M5REJC, TWA-M5ACCPT            32110000
ET0001**             MOVE ATT-UNPROT-BRT TO M5REJA, M5REJCA, M5ACCPTA   32120000
                  END-IF                                                32130000
              END-IF                                                    32140000
           END-IF.                                                      32150000
                                                                        32160000
           IF (SYSTEM-MSG > SPACES)  OR                                 32170000
              ERROR-YES                                                 32180000
              CONTINUE                                                  32190000
           ELSE                                                         32200000
              IF (SYSTEM-MSG = LOW-VALUES OR SPACES) OR                 32210000
                 TWA-VTRNFR-UPDATED   OR                                32220000
                 TWA-VINITRNF-INSERTED OR                               32230000
                 TWA-VINITRNF-DELETED                                   32240000
                 MOVE TWA-RETURN-MSG    TO   SYSTEM-MSG                 32250000
                 IF INPUT-REJ-IR                                        32260000
                    SET CURSOR-ON-M5REJ TO TRUE                         32270000
                    MOVE 'S' TO  TWA-M5REJ, M5REJO                      32280000
                 ELSE                                                   32290000
                    IF INPUT-REJC-RC                                    32300000
                       SET CURSOR-ON-M5REJC TO TRUE                     32310000
                       MOVE 'S' TO TWA-M5REJC, M5REJCO                  32320000
                    END-IF                                              32330000
                 END-IF                                                 32340000
              END-IF                                                    32350000
           END-IF.                                                      32360000
                                                                        32370000
           IF (SYSTEM-MSG > SPACES)  OR                                 32380000
              ERROR-YES                                                 32390000
              CONTINUE                                                  32400000
           ELSE                                                         32410000
           IF SYSTEM-MSG = SPACES OR LOW-VALUES                         32420000
              IF TWA-VTRNFR-FIRST OR                                    32430000
                 TWA-VTRNFR-LAST  OR                                    32440000
                 TWA-VASSET-FIRST OR                                    32450000
                 TWA-VASSET-LAST  OR                                    32460000
ET0006           TWA-VASSET-NOT-FOUND OR                                32470000
                 TWA-VTRNFR-NOT-FOUND                                   32480000
                 MOVE TWA-RETURN-MSG TO SYSTEM-MSG                      32490000
              END-IF                                                    32500000
           END-IF.                                                      32510000
ET0011                                                                  32520000
ET0011     IF  (ACAT-ACCOUNT-FREEZE-CLIENT)                             32530000
ET0011     AND (TWA-VTRNFR-FOUND OR TWA-VTRNFR-FIRST OR TWA-VTRNFR-LAST)32540000
ET0011     AND (TWA-STTS-CD >= '200' AND TWA-STTS-CD < '300')           32550000
ET0011     AND (TWA-VINITRNF-NSCC-PEND-CD NOT = 'Y')                    32560000
ET0011     AND (TWA-VTRNFR-NSCC-PEND-CD NOT = 'A')                      32570000
ET0011     AND (TWA-TFR-TYPE = 'PTR' OR 'PTD')                          32580000
ET0011         MOVE TWA-CLIENT-NO-X      TO ACATRSIO-CLIENT-NBR         32590000
ET0011                                      ACAT05IO-SV-CLIENT-NBR      32600000
ET0011         MOVE TWA-ACAT-CONTROL-NBR TO ACAT05IO-SV-ACAT-CNTL-NBR   32610000
ET0011         MOVE TWA-BRANCH-CD        TO ACATRSIO-BRANCH             32620000
ET0011                                      ACAT05IO-SV-BRANCH-CD       32630000
ET0011         MOVE TWA-ACCT-CD          TO ACATRSIO-ACCOUNT            32640000
ET0011                                      ACAT05IO-SV-ACCT-CD         32650000
ET0011         SET ACATRSIO-LOOKUP-ACCOUNT-FREEZE TO TRUE               32660000
ET0011         PERFORM 2000-LINK-TO-ACFREEZ-IO                          32670000
ET0011         IF  ACATRSIO-FREEZE-CASH-IN                              32680000
ET0011         AND ACATRSIO-FREEZE-CASH-OUT                             32690000
ET0011         AND ACATRSIO-FREEZE-SEC-IN                               32700000
ET0011         AND ACATRSIO-FREEZE-SEC-OUT                              32710000
ET0011            MOVE 'YYYY' TO ACAT05IO-FREEZ-TYPE                    32720000
ET0011                           TWA-FREEZ-TYPE                         32730000
ET0011            MOVE WS-FULL-FREEZE-MSG  TO SYSTEM-MSG                32740000
ET0011            PERFORM 0824-ACCCT-FREEZ-PROCESS                      32750000
ET0011         ELSE                                                     32760000
ET0011            IF ACATRSIO-FREEZE-CASH-IN                            32770000
ET0011            OR ACATRSIO-FREEZE-CASH-OUT                           32780000
ET0011            OR ACATRSIO-FREEZE-SEC-IN                             32790000
ET0011            OR ACATRSIO-FREEZE-SEC-OUT                            32800000
ET0011                PERFORM 0822-CASH-OR-SEC-FREEZ-CHECK              32810000
ET0011                IF ACAT05IO-FREEZ-CASH-FOUND                      32820000
ET0011                   MOVE WS-CASH-FREEZE-MSG  TO SYSTEM-MSG         32830000
ET0011                   PERFORM 0824-ACCCT-FREEZ-PROCESS               32840000
ET0011                ELSE                                              32850000
ET0011                   IF ACAT05IO-FREEZ-SEC-FOUND                    32860000
ET0011                      MOVE WS-SEC-FREEZE-MSG   TO SYSTEM-MSG      32870000
ET0011                      PERFORM 0824-ACCCT-FREEZ-PROCESS            32880000
ET0011                   END-IF                                         32890000
ET0011                END-IF                                            32900000
ET0011            ELSE                                                  32910000
ET0011                MOVE SPACE  TO ACAT05IO-FREEZ-TYPE                32920000
ET0011            END-IF                                                32930000
ET0011         END-IF                                                   32940000
ET0011         IF (TWA-M5REJC = 'S')                                    32950000
ET0011         OR (M5REJCO    = 'Y')                                    32960000
ET0011             MOVE SPACE  TO TWA-M5REJ  ACAT05IO-M5REJ  M5REJO     32970000
ET0011         END-IF                                                   32980000
ET0011     END-IF.                                                      32990000
ET0011                                                                  33000000
      /                                                                 33010000
ET0011*                                                                 33020000
ET0011*----------------------------------------------------------------*33030000
ET0011*  CASH OR SECURITY FREEZE CHECK                                  33040000
ET0011*    (1) IF 'CASH OUT' IS FROZEN, FREEZE ANY DEBIT  AMOUNT.       33050000
ET0011*    (2) IF 'CASH IN'  IS FROZEN, FREEZE ANY CREDIT AMOUNT.       33060000
ET0011*    (3) IF 'SEC OUT'  IS FROZEN, FREEZE ANY SHORT  POSITION.     33070000
ET0011*    (4) IF 'SEC IN'   IS FROZEN, FREEZE ANY LONG   POSITION.     33080000
ET0011*----------------------------------------------------------------*33090000
ET0011 0822-CASH-OR-SEC-FREEZ-CHECK.                                    33100000
           MOVE SPACE  TO ACAT05IO-FREEZ-TYPE.                          33110000
           IF ACATRSIO-FREEZE-CASH-IN                                   33120000
              MOVE 'Y' TO ACAT05IO-FREEZ-CASH-IN                        33130000
                          TWA-FREEZ-CASH-IN                             33140000
           END-IF.                                                      33150000
           IF ACATRSIO-FREEZE-CASH-OUT                                  33160000
              MOVE 'Y' TO ACAT05IO-FREEZ-CASH-OUT                       33170000
                          TWA-FREEZ-CASH-OUT                            33180000
           END-IF.                                                      33190000
           IF ACATRSIO-FREEZE-SEC-IN                                    33200000
              MOVE 'Y' TO ACAT05IO-FREEZ-SEC-IN                         33210000
                          TWA-FREEZ-SEC-IN                              33220000
           END-IF.                                                      33230000
           IF ACATRSIO-FREEZE-SEC-OUT                                   33240000
              MOVE 'Y' TO ACAT05IO-FREEZ-SEC-OUT                        33250000
                          TWA-FREEZ-SEC-OUT                             33260000
           END-IF.                                                      33270000
                                                                        33280000
           SET ACAT05IO-SRCH-FRZN-ASSET TO TRUE.                        33290000
                                                                        33300000
           PERFORM 0500-CALL-ACAT05DA.                                  33310000
                                                                        33320000
           IF ACAT05IO-DB2-ERROR                                        33330000
              MOVE 'SELECT'            TO WS-DB2-ERROR-FUNCTION         33340000
              MOVE ACAT05IO-SQLCAID    TO WS-DB2-ERROR-TABLE            33350000
              MOVE ACAT05IO-SQLCODE    TO WS-DB2-ERROR-ID               33360000
              MOVE WS-DB2-ERROR-MSG    TO TWA-RETURN-MSG                33370000
              PERFORM 0830-ERROR-RTN                                    33380000
           END-IF.                                                      33390000
ET0011*                                                                 33400000
ET0011*----------------------------------------------------------------*33410000
ET0011* ACCOUNT IS FROZEN                                               33420000
ET0011*  (1) PROTECT ALL FIELDS EXCEPT SEARCH FIELDS.                   33430000
ET0011*  (2) CREATE REJECT RECORD IN ACTITRF.                           33440000
ET0011*  (3) UPDATE ACCT-FRZN-IND OF VTRNFR.                            33450000
ET0011*      ACCT-FRZN-IND = 'Y' MEANS ACCT FREEZE FOUND BY BATCH PROG  33460000
ET0011*      ACCT-FRZN-IND = 'O' MEANS ACCT FREEZE FOUND BY ONLINE PROG 33470000
ET0011*----------------------------------------------------------------*33480000
ET0011 0824-ACCCT-FREEZ-PROCESS.                                        33490000
           SET CURSOR-ON-M5NEXT TO TRUE.                                33500000
                                                                        33510000
           MOVE ATT-ASKIP       TO M5ACCELA                             33520000
                                   M5ACCPTA                             33530000
                                   M5REJA                               33540000
                                   M5REJCA.                             33550000
                                                                        33560000
           IF TWA-INIT-TRANS-TYPE-CD = 'R'                              33570000
              CONTINUE                                                  33580000
           ELSE                                                         33590000
              MOVE 'S' TO TWA-M5REJC ACAT05IO-M5REJC                    33600000
              MOVE ' ' TO TWA-M5REJ  ACAT05IO-M5REJ                     33610000
              MOVE 'Y' TO M5REJCO                                       33620000
              MOVE ' ' TO M5REJO                                        33630000
              MOVE ACAT-ADP-BROKER        TO TWA-SBMT-BRKR              33640000
                                             ACAT05IO-SBMT-BRKR         33650000
ET0012        MOVE ACAT-CICS-USER-NAME    TO ACAT05IO-USER-NAME         33660000
ET0012        MOVE ACAT-CICS-USER-ID      TO ACAT05IO-USER-ID           33670000
ET0012        MOVE ACAT-CICS-NETNAME      TO ACAT05IO-NET-NAME          33680000
              SET ACAT05IO-ISRT-VINITRNF  TO TRUE                       33690000
              PERFORM 0500-CALL-ACAT05DA                                33700000
              IF ACAT05IO-DB2-ERROR                                     33710000
                 MOVE 'SELECT'            TO WS-DB2-ERROR-FUNCTION      33720000
                 MOVE ACAT05IO-SQLCAID    TO WS-DB2-ERROR-TABLE         33730000
                 MOVE ACAT05IO-SQLCODE    TO WS-DB2-ERROR-ID            33740000
                 MOVE WS-DB2-ERROR-MSG    TO TWA-RETURN-MSG             33750000
                 PERFORM 0830-ERROR-RTN                                 33760000
              ELSE                                                      33770000
                 MOVE ACAT05IO-VINITRNF-CMNT                            33780000
                      TO   TWA-VINITRNF-CMNT                            33790000
                 MOVE ACAT05IO-INIT-TRANS-TYPE-CD                       33800000
                      TO   TWA-INIT-TRANS-TYPE-CD                       33810000
                 MOVE ACAT05IO-VINITRNF-NSCC-PEND-CD                    33820000
                      TO   TWA-VINITRNF-NSCC-PEND-CD                    33830000
              END-IF                                                    33840000
           END-IF.                                                      33850000
                                                                        33860000
           IF TWA-ACCT-FRZN-IND = 'Y' OR 'O'                            33870000
              CONTINUE                                                  33880000
           ELSE                                                         33890000
              SET ACAT05IO-UPDT-FRZN-IND TO TRUE                        33900000
              PERFORM 0500-CALL-ACAT05DA                                33910000
           END-IF.                                                      33920000
                                                                        33930000
       EJECT                                                            33940000
       0830-ERROR-RTN.                                                  33950000
           IF  M5NEXTI = SPACE                                          33960000
               MOVE SPACES TO ACAT-INP-SEL                              33970000
                              ACAT-NEXT                                 33980000
           END-IF.                                                      33990000
           MOVE EIBTRMID      TO TERM-ID.                               34000000
           MOVE 'ACA5'        TO TRAN-ID.                               34010000
           PERFORM 0600-DELETE-TSQ.                                     34020000
           PERFORM 0620-WRITE-TSQ                                       34030000
           PERFORM 0850-SEND-MAP-DATA-ONLY.                             34040000
           PERFORM 0900-RETURN-TO-CICS.                                 34050000
      /                                                                 34060000
       0840-CURSOR-POSITION.                                            34070000
                                                                        34080000
           EVALUATE WS-CURSOR                                           34090000
                WHEN 'NX' MOVE -1 TO M5NEXTL                            34100000
                          MOVE ATT-UNPROT-BRT  TO M5NEXTA               34110000
                WHEN 'AP' MOVE -1 TO M5ACCPTL                           34120000
                          MOVE ATT-UNPROT-BRT  TO M5ACCPTA              34130000
ET0001          WHEN 'AL' MOVE -1 TO M5ACCELL                           34140000
ET0001                    MOVE ATT-UNPROT-BRT  TO M5ACCELA              34150000
                WHEN 'RJ' MOVE -1 TO M5REJL                             34160000
                          MOVE ATT-UNPROT-BRT  TO M5REJA                34170000
                WHEN 'RC' MOVE -1 TO M5REJCL                            34180000
                          MOVE ATT-UNPROT-BRT  TO M5REJCA               34190000
                WHEN 'BR' MOVE -1 TO MMBRL                              34200000
                          MOVE ATT-UNPROT-BRT  TO MMBRA                 34210000
                WHEN 'AC' MOVE -1 TO MMACL                              34220000
                          MOVE ATT-UNPROT-BRT  TO MMACA                 34230000
                WHEN 'RR' MOVE -1 TO MMRRL                              34240000
                          MOVE ATT-UNPROT-BRT  TO MMRRA                 34250000
                WHEN 'TR' MOVE -1 TO MMTFRL                             34260000
                          MOVE ATT-UNPROT-BRT  TO MMTFRA                34270000
                WHEN 'BK' MOVE -1 TO MMBKRL                             34280000
                          MOVE ATT-UNPROT-BRT  TO MMBKRA                34290000
                WHEN 'ST' MOVE -1 TO MMSTATL                            34300000
                          MOVE ATT-UNPROT-BRT  TO MMSTATA               34310000
                WHEN OTHER MOVE -1 TO M5NEXTL                           34320000
           END-EVALUATE.                                                34330000
                                                                        34340000
DJ0001     IF NOT ACAT-SIGN-ON-UPDATE                                   34350000
DJ0001        MOVE ATT-PROT TO  M5REJA, M5REJCA, M5ACCPTA               34360000
ET0001                          M5ACCELA                                34370000
DJ0001     END-IF.                                                      34380000
                                                                        34390000
      /                                                                 34400000
       0850-SEND-MAP-DATA-ONLY.                                         34410000
                                                                        34420000
           PERFORM 0150-GET-DATE-TIME-RTN.                              34430000
           MOVE 'ACAX'        TO  MTRANSO.                              34440000
           MOVE WSMMDDYY      TO  MDATEO.                               34450000
           MOVE WSTIME        TO  MTIMEO.                               34460000
           MOVE ACAT-CLIENT-NO  TO MCLINBO.                             34470000
      ***                                                               34480000
      ***  MAP HEADER                                                   34490000
           EXEC CICS SEND MAP('HDRMAP')                                 34500000
                     MAPSET('ACAT00M')                                  34510000
                     FROM (HDRMAPO)                                     34520000
                     DATAONLY                                           34530000
                     ACCUM                                              34540000
           END-EXEC.                                                    34550000
      ***  MAP BODY                                                     34560000
      *    MOVE TWA-M5NEXT      TO M5NEXTO.                             34570000
      *    MOVE TWA-M5REJ       TO M5REJO.                              34580000
      *    MOVE TWA-M5REJC      TO M5REJCO.                             34590000
                                                                        34600000
           IF ACAT-SRCH-MSG > SPACES                                    34610000
              PERFORM 0495-SRCH-CURSOR-RTN                              34620000
           END-IF.                                                      34630000
                                                                        34640000
           PERFORM 0840-CURSOR-POSITION.                                34650000
      ****                                                              34660000
           EXEC CICS SEND MAP('ACAT05A')                                34670000
                     MAPSET('ACAT05M')                                  34680000
                     FROM(ACAT05AO)                                     34690000
                     DATAONLY                                           34700000
                     CURSOR                                             34710000
                     ACCUM                                              34720000
           END-EXEC.                                                    34730000
                                                                        34740000
           EXEC CICS SEND MAP('ACAT05B')                                34750000
                     MAPSET('ACAT05M')                                  34760000
                     FROM(ACAT05BO)                                     34770000
                     DATAONLY                                           34780000
                     CURSOR                                             34790000
                     ACCUM                                              34800000
           END-EXEC.                                                    34810000
                                                                        34820000
      ***  MAP TRAILER                                                  34830000
           MOVE ATT-ASKIP-BRT   TO TRLMSGA.                             34840000
           IF SYSTEM-MSG(1 : 10) = LOW-VALUES                           34850000
              MOVE SPACES        TO  TRLMSGO                            34860000
           ELSE                                                         34870000
              MOVE SYSTEM-MSG    TO  TRLMSGO.                           34880000
           EXEC CICS SEND MAP('TRLMAP')                                 34890000
                     MAPSET('ACAT00M')                                  34900000
                     FROM(TRLMAPO)                                      34910000
                     DATAONLY                                           34920000
                     CURSOR                                             34930000
                     ACCUM                                              34940000
           END-EXEC.                                                    34950000
           EXEC CICS SEND PAGE                                          34960000
           END-EXEC.                                                    34970000
           IF EIBRCODE NOT EQUAL LOW-VALUES                             34980000
              MOVE '0850-SEND-MAP-DATA ' TO WS-CICS-DISPLAY             34990000
              MOVE EIBRCODE          TO WS-CICS-RC                      35000000
              MOVE WS-CICS-MSG       TO WS-MSG-OUT                      35010000
              PERFORM 0920-SEND-MSG-RETURN-TO-CICS                      35020000
           ELSE                                                         35030000
              MOVE 'ACAT05RN' TO ACAT-PROGRAM-NAME.                     35040000
              MOVE 'E'      TO ACAT-NEXT, ACAT-INP-SEL.                 35050000
              PERFORM 0900-RETURN-TO-CICS.                              35060000
      /                                                                 35070000
       0870-SEND-MAP-ERASE.                                             35080000
                                                                        35090000
           PERFORM 0150-GET-DATE-TIME-RTN.                              35100000
           MOVE 'ACAX'        TO  MTRANSO.                              35110000
           MOVE WSMMDDYY      TO  MDATEO.                               35120000
           MOVE WSTIME        TO  MTIMEO.                               35130000
           MOVE ACAT-CLIENT-NO  TO MCLINBO.                             35140000
      ***  MAP HEADER                                                   35150000
           EXEC CICS SEND MAP('HDRMAP')                                 35160000
                     MAPSET('ACAT00M')                                  35170000
                     FROM (HDRMAPO)                                     35180000
                     ERASE                                              35190000
                     ACCUM                                              35200000
           END-EXEC.                                                    35210000
                                                                        35220000
      ***  MAP BODY                                                     35230000
      *    MOVE TWA-M5NEXT      TO M5NEXTO.                             35240000
      *    MOVE TWA-M5REJ       TO M5REJO.                              35250000
      *    MOVE TWA-M5REJC      TO M5REJCO.                             35260000
                                                                        35270000
           IF ACAT-SRCH-MSG > SPACES                                    35280000
              PERFORM 0495-SRCH-CURSOR-RTN                              35290000
           END-IF.                                                      35300000
                                                                        35310000
           PERFORM 0840-CURSOR-POSITION.                                35320000
                                                                        35330000
           EXEC CICS SEND MAP('ACAT05A')                                35340000
                     MAPSET('ACAT05M')                                  35350000
                     FROM(ACAT05AO)                                     35360000
                     CURSOR                                             35370000
                     ACCUM                                              35380000
           END-EXEC.                                                    35390000
                                                                        35400000
           EXEC CICS SEND MAP('ACAT05B')                                35410000
                     MAPSET('ACAT05M')                                  35420000
                     FROM(ACAT05BO)                                     35430000
                     CURSOR                                             35440000
                     ACCUM                                              35450000
           END-EXEC.                                                    35460000
                                                                        35470000
      ***  MAP TRAILER                                                  35480000
           MOVE ATT-ASKIP-BRT  TO  TRLMSGA.                             35490000
           IF SYSTEM-MSG(1 : 10) = LOW-VALUES                           35500000
              MOVE SPACES        TO  TRLMSGO                            35510000
           ELSE                                                         35520000
              MOVE SYSTEM-MSG    TO  TRLMSGO.                           35530000
           EXEC CICS SEND MAP('TRLMAP')                                 35540000
                     MAPSET('ACAT00M')                                  35550000
                     FROM(TRLMAPO)                                      35560000
                     CURSOR                                             35570000
                     ACCUM                                              35580000
           END-EXEC.                                                    35590000
           EXEC CICS SEND PAGE                                          35600000
           END-EXEC.                                                    35610000
           IF EIBRCODE NOT EQUAL LOW-VALUES                             35620000
              MOVE '0870-SEND-MAP-ERASE' TO WS-CICS-DISPLAY             35630000
              MOVE EIBRCODE          TO WS-CICS-RC                      35640000
              MOVE WS-CICS-MSG       TO WS-MSG-OUT                      35650000
              PERFORM 0920-SEND-MSG-RETURN-TO-CICS                      35660000
           ELSE                                                         35670000
              MOVE 'ACAT05RN' TO ACAT-PROGRAM-NAME.                     35680000
              MOVE 'E'      TO ACAT-NEXT, ACAT-INP-SEL.                 35690000
              PERFORM 0900-RETURN-TO-CICS.                              35700000
       EJECT                                                            35710000
                                                                        35720000
       0900-RETURN-TO-CICS.                                             35730000
      *                                                                 35740000
           IF TWA-SRCH-VTRNFR-PND                                       35750000
           AND (NOT TWA-CAME-FROM-PENDING)                              35760000
                 MOVE 'ACAT21PT' TO ACAT-CALLING-PROG-NAME              35770000
           END-IF.                                                      35780000
                                                                        35790000
           EXEC CICS RETURN                                             35800000
                     TRANSID('ACAX')                                    35810000
                     COMMAREA(ACATCOMM-COMMAREA)                        35820000
           END-EXEC.                                                    35830000
                                                                        35840000
       0910-RETURN-CONTROL-RTN.                                         35850000
           EXEC CICS SEND CONTROL                                       35860000
                            ERASE                                       35870000
                           FREEKB                                       35880000
           END-EXEC.                                                    35890000
           EXEC CICS XCTL PROGRAM ('RATT01')                            35900000
           END-EXEC.                                                    35910000
           EXEC CICS RETURN                                             35920000
           END-EXEC.                                                    35930000
                                                                        35940000
           EJECT                                                        35950000
                                                                        35960000
       0920-SEND-MSG-RETURN-TO-CICS.                                    35970000
           EXEC CICS                                                    35980000
                SEND                                                    35990000
                FROM (WS-MSG-OUT)                                       36000000
                ERASE                                                   36010000
           END-EXEC.                                                    36020000
                                                                        36030000
           EXEC CICS                                                    36040000
                RETURN                                                  36050000
           END-EXEC.                                                    36060000
                                                                        36070000
           EJECT                                                        36080000
ET0011*                                                                 36090000
ET0011*----------------------------------------------------------------*36100000
ET0011*    CALL ACCOUNT FREEZ IO MODULE                                 36110000
ET0011*----------------------------------------------------------------*36120000
ET0011 2000-LINK-TO-ACFREEZ-IO.                                         36130000
           EXEC CICS LINK PROGRAM (WS-ACFREEZ)                          36140000
                COMMAREA(ACATRSTIO-CALL-AREA)                           36150000
                LENGTH(LENGTH OF ACATRSTIO-CALL-AREA)                   36160000
           END-EXEC.                                                    36170000
                                                                        36180000
      *                                                                 36190000
       SCREEN-SECURITY-CHECK.                                           36200000
           IF  ACAT-SUPER-SIGN-ON-UPDATE                                36210000
               SET ACAT-SIGN-ON-UPDATE TO TRUE                          36220000
           ELSE                                                         36230000
           IF  ACAT-SUPER-SIGN-ON-BROWSE                                36240000
               MOVE SPACE  TO ACAT-SIGN-ON-SEC-FLAG                     36250000
           ELSE                                                         36260000
               MOVE ACAT-NEXT TO ACAT-SCREEN-IND                        36270000
               SET ACAT-UPDATE-MODE TO TRUE                             36280000
               MOVE SPACES    TO SECLINK-LIST                           36290000
               MOVE '2'       TO SECLINK-ACTION-CODE                    36300000
               MOVE 'SCON'    TO SECLINK-TYPE                           36310000
               MOVE ACAT-SEC-LIT TO SECLINK-ITEM                        36320000
               PERFORM CALL-SECLINK-RTN                                 36330000
               IF SECLINK-RETURN-CODE = '00' OR '20'                    36340000
                  SET ACAT-SIGN-ON-UPDATE TO TRUE                       36350000
               ELSE                                                     36360000
                  SET ACAT-BROWSE-MODE TO TRUE                          36370000
                  MOVE SPACES    TO SECLINK-LIST                        36380000
                  MOVE '2'       TO SECLINK-ACTION-CODE                 36390000
                  MOVE 'SCON'    TO SECLINK-TYPE                        36400000
                  MOVE ACAT-SEC-LIT TO SECLINK-ITEM                     36410000
                  PERFORM CALL-SECLINK-RTN                              36420000
                  IF SECLINK-RETURN-CODE = '00' OR '20'                 36430000
                     MOVE SPACE TO ACAT-SIGN-ON-SEC-FLAG                36440000
                  ELSE                                                  36450000
                     MOVE 'USER NOT AUTHORIZED TO USE NEXT SELECTION '  36460000
                       TO SYSTEM-MSG                                    36470000
                     MOVE ACAT-SCREEN-IND                               36480000
                       TO SYSTEM-MSG(44 : 1)                            36490000
                     MOVE 'E'        TO ACAT-NEXT ACAT-INP-SEL          36500000
                     MOVE 'ACAT05RN' TO ACAT-PROGRAM-NAME               36510000
                     MOVE  SPACES    TO ACAT-CALLING-PROG-NAME          36520000
                     PERFORM 0830-ERROR-RTN                             36530000
                  END-IF                                                36540000
               END-IF                                                   36550000
           END-IF END-IF.                                               36560000
LRM017*---------------------------------------------------------------- 36570000
LRM017* WHEN ASCENDIS CLIENT, AND USER ORIGINALLY HAD UPDATE AUTH, LOOK 36580000
LRM017* FOR SPECIAL OVERRIDE SCON TO ALLOW UPDATE.  IF NOT SPECIAL SCON 36590000
LRM017* ONLY ALLOW UPDATE TO REGISTRATION SCREENS, OTHERWISE BROWSE     36600000
LRM017* ONLY ON ALL FUNCTIONS.                                          36610000
LRM017*---------------------------------------------------------------- 36620000
LRM017     IF ACAT-ASCENDIS-CLIENT                                      36630000
LRM017        IF ACAT-SIGN-ON-UPDATE                                    36640000
LRM017           MOVE SPACES         TO SECLINK-LIST                    36650000
LRM017           MOVE '2'            TO SECLINK-ACTION-CODE             36660000
LRM017           MOVE 'SCON'         TO SECLINK-TYPE                    36670000
LRM017           MOVE 'ACAXASCENDIS' TO SECLINK-ITEM                    36680000
LRM017           PERFORM 0799-CALL-SECLINK-RTN                          36690000
LRM017           IF (SECLINK-RETURN-CODE = '00' OR '20')                36700000
LRM017              CONTINUE                                            36710000
LRM017           ELSE                                                   36720000
LRM017              SET ACAT-SIGN-ON-ASCENDIS-RSTRCT TO TRUE            36730000
LRM017        ELSE                                                      36740000
LRM017           SET ACAT-SIGN-ON-BROWSE TO TRUE                        36750000
LRM017        END-IF                                                    36760000
LRM017     END-IF.                                                      36770000
           EJECT                                                        36780000
       CALL-SECLINK-RTN.                                                36790000
           EXEC CICS LINK PROGRAM ('SECLINK')                           36800000
                COMMAREA(SECLINK-LIST)                                  36810000
                LENGTH(LENGTH OF SECLINK-LIST)                          36820000
           END-EXEC.                                                    36830000
                                                                        36840000
       HANG-CICS.                                                       36850000
           GOBACK.                                                      36860000
           EJECT                                                        36870000
