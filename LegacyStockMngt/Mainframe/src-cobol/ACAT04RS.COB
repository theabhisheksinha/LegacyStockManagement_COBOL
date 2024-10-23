000001* PDX    - ACAT04RS C0330171 08/31/12 12:03:58 TBLAMUR            00001000
000001* LRM014 SSR# 86856 DISPLAY FCUR LONG BAL AS A CREDIT.                    
000001* PDX    - ACAT04RS C0318727 01/11/12 13:23:26 TBLAMUR            00001000
000001* PDX    - ACAT04RS C0301531 02/02/11 08:45:08 TBLAMUR            00001000
000001* LRM012 SSR# 70607 PUT BACK COMMENTED LOGIC.                             
000001* PDX    - ACAT04RS C0302589 11/22/10 13:40:49 TBLAMUR            00001000
000001* LRM013 SSR# 70666 PASS AUDIT INFO TO ACAT04DA ON ACCEPT.                
000001* PDX    - ACAT04RS C0301531 09/30/10 11:54:38 TBLAMUR            00001000
000001* LRM012 SSR# 70607 DO NOT ALLOW CHANGES AFTER DAY 2 CYCLE 5              
000001* PDX    - ACAT04RS C0287777 11/03/09 10:30:22 TBLAMUR            00001000
000001* LRM011 SSR# 65670 SUB PENNY PRICE POPUP MSG                             
000001* PDX    - ACAT04RS C0284083 07/28/09 13:59:59 TBLAMUR            00001000
000001* LRM010 SSR# 64156 LOOK AT TABL FOR EXTENDED CYCLE CUTOFF TIMES.         
000001* PDX    - ACAT04RS C0277094 04/06/09 10:57:23 TBDOJUN            00001000
000001* DJ0003 SSR# 61684 AUCTION RATE SECURITY POPUP MSG               00001100
000001* PDX    - ACAT04RS C0275533 03/05/09 11:28:19 TBLAMUR            00001200
000001* LRM009 SSR 57665 ALLOW USER TO ENTER Y TO ACCEL,REJ,ACCEPT.     00001300
000001* PDX    - ACAT04RS C0263391 07/18/08 09:19:06 TBLAMUR            00001400
000001* LRM008 SSR# 55766 ASCENDIS INTERFACE. BROWSE ONLY UNLESS        00001500
      *          SCON OVERRIDE 'ACAXASCENDIS' SET IN ACAT01CP.          00001600
000001* PDX    - ACAT04RS C0250441 06/25/07 09:35:36 TBLAMUR            00001700
000001* LRM007 SSR 53075 SPIN-OFF CHANGES                               00001800
000001* PDX    - ACAT04RS C0245632 03/01/07 11:04:31 TBLAMUR            00001900
      * LRM006 SSR 49202 CONTINUED - ADD DESCR DSPLY FOR REGT AND 90DR  00002000
000001* PDX    - ACAT04RS C0240732 11/09/06 14:20:34 TBLAMUR            00002100
      * LRM006 SSR 49202 ADD REGT AND 90 DAY RESTRICTION EXCP POPUP MSG 00002200
000001* PDX    - ACAT04RS C0238544 08/28/06 14:44:40 TBLAMUR            00002300
      * LRM005 - 45145 CREATE WARNING MSG WHEN USERS ATTEMPT TO REJECT  00002400
      *          AFTER NSCC CUT OFF TIME ON LAST DAY.                   00002500
      *          (LAST DAY MARKED ON VTRNFR BY BATCH).                  00002600
000001* PDX    - ACAT04RS C0231507 07/07/06 15:29:19 TBEDTAK            00002700
      * ET0004 - 40661 RETAIN USER ID OF INITIATOR.                     00002800
      * ET0003 - 45744 BLOCK ENTRY BASED ON ACCOUNT FREEZE.             00002900
000001* PDX    - ACAT04RS C0215192 02/14/05 10:13:25 TBEDTAK            00003000
000001* PDX    - ACAT04RS C0214674 12/29/04 10:32:59 TBEDTAK            00003100
      * ET0002 - SSR 40633  ANNUITY RECEIVER ADJUSTMENTS(DELETES)       00003200
      *        - FIX BUG - CD FIELD IS NOT PROTECTED WHEN STATUS >= 300 00003300
000001* PDX    - ACAT04RS C0211347 12/21/04 16:13:48 TBEDTAK            00003400
      * ET0001 - SSR 29649  MF AUTO DELETE - CHANGED IN ACAT04DC PROG.  00003500
      *        - FIX BUG   DELETE IS NOT WORKING WHEN TRY TO DELETE MF  00003600
      *          RECORD RIGHT AFTER MF RECORD IS UNDELETED.             00003700
      *          NEITHER DOES UNDELETE FUNCTION.                        00003800
000001* PDX    - ACAT04RS C0158587 09/04/01 13:33:40 TBLAMUR            00003900
      * DJ0002 SSR# R3848800 MUTUAL FUND RECEIVER ADJUSTMENTS(DELETES)  00004000
      *        ADD "CD" TO MAP FOR ACTION CODE DELETE OR UNDELETE       00004100
      *        ALLOW "CD" ONLY FOR UPDATE-ALLOW USERS AND MUTUAL FUNDS  00004200
000001* PDX    - ACAT04RS C0155452 03/12/01 08:22:45 TBDOJUN            00004300
000001* PDX    - ACAT04RS C0152388 01/05/01 10:24:42 TBLAMUR            00004400
000001* PDX    - ACAT04RS C0130065 09/23/99 09:16:54 TBLAMUR            00004500
000001* PDX    - ACAT04RS C0126743 06/07/99 09:31:55 TBTIKUO            00004600
000001* PDX    - ACAT04RS C0123136 04/07/99 15:48:45 TBTIKUO            00004700
000001* PDX    - ACAT04RS C0122061 02/20/99 14:27:24 TBLAMUR            00005000
000001* PDX    - ACAT04RS C0121426 02/11/99 15:55:41 TBEDTAK            00006000
000001* PDX    - ACAT04RS C0120812 02/04/99 18:55:55 TBEDTAK            00007000
000001* PDX    - ACAT04RS C0119861 01/20/99 12:19:12 TBTIKUO            00008000
000001* PDX    - ACAT04RS C0119290 01/07/99 15:27:23 TBTIKUO            00009000
000001* PDX    - ACAT04RS C0117770 11/14/98 20:32:01 TBLAMUR            00010000
000001* PDX    - ACAT04RS C0112193 11/13/98 16:19:49 TBLAMUR            00020000
       IDENTIFICATION DIVISION.                                         00030000
       PROGRAM-ID.    ACAT04RS.                                         00040000
       AUTHOR.  T. KUO.                                                 00050000
      *REMARKS.                                                         00060000
      **-------------------------------------------------------------** 00070000
      *           ACATS  REVIEW STANDARD TRANSFERS                    * 00080000
      **-------------------------------------------------------------** 00090000
       ENVIRONMENT DIVISION.                                            00100000
       DATA DIVISION.                                                   00110000
       WORKING-STORAGE SECTION.                                         00120000
       COPY PDXIDCOB.                                                   00130000
       77  TWA-SIZE                   PIC S9(4)        COMP.            00140000
       77  WS-CICS-RESP               PIC S9(8)        COMP   VALUE +0. 00150000
       77  WS-AMT-S                   PIC S9(15)V9(2)  COMP-3 VALUE +0. 00160000
       77  WS-BAL01-DEC2              PIC S9(15)V9(2)         VALUE +0. 00170000
       77  WS-BAL02-DEC2              PIC S9(15)V9(2)         VALUE +0. 00180000
       77  WS-BAL05-DEC2              PIC S9(15)V9(2)         VALUE +0. 00190000
       77  WS-SMA-DEC2                PIC S9(15)V9(2)         VALUE +0. 00200000
       77  WS-ASSET-DEC2              PIC S9(15)V9(2)  COMP-3 VALUE +0. 00210000
       77  WS-QTY-DEC4                PIC S9(13)V9(4)  COMP-3 VALUE +0. 00220000
       77  WS-ASSET-NUM2              PIC Z(15)V9(2)-  VALUE  ZERO.     00230000
       77  WS-ASSET-NUM4              PIC Z(13)V9(4)-  VALUE  ZERO.     00240000
       77  MAX-ASSET-NBR              PIC S9(4)  COMP  VALUE +9999.     00250000
ET0003 77  WS-ACFREEZ                 PIC X(08)        VALUE 'ACATRST '.00260000
      *******************************************************           00270000
      *      TSQ WORK AREA                                              00280000
      *******************************************************           00290000
       01  TSQ-WORK-AREA.                                               00300000
           05  TSQ-NAME.                                                00310000
               09 TERM-ID             PIC X(04).                        00320000
               09 TRAN-ID             PIC X(04).                        00330000
           05  ITEM-NUM               PIC S9(04) COMP      VALUE +1.    00340000
      *******************************************************           00350000
      *      GET DATE TIME LAYOUT                                       00360000
      *******************************************************           00370000
       01  WSWORKAREA.                                                  00380000
           05  WSABSTIME           PIC S9(08) COMP.                     00390000
           05  WSMMDDYY.                                                00400000
               09 WS-CUR-MM        PIC XX.                              00410000
               09  FILLER          PIC X.                               00420000
               09 WS-CUR-DD        PIC XX.                              00430000
               09  FILLER          PIC X.                               00440000
               09 WS-CUR-YY        PIC XX.                              00450000
           05  WSDATESEP           PIC X(01) VALUE '/'.                 00460000
           05  WSTIME.                                                  00470000
               09  WS-TIME-HH      PIC XX.                              00480000
               09  FILLER          PIC X.                               00490000
               09  WS-TIME-MM      PIC XX.                              00500000
               09  FILLER          PIC X.                               00510000
               09  WS-TIME-SS      PIC XX.                              00520000
LRM005     05  WS-TIME-HHMM        PIC X(04).                           00521000
           05  WSTIMESEP           PIC X(01) VALUE ':'.                 00530000
LRM010     05  WS-CYCLE5-HHMM      PIC X(04) VALUE '1530'.                      
LRM012     05  WS-CYCLE5-CUTOFF-SW PIC X(01) VALUE 'N'.                         
LRM012         88  WS-CYCLE5-CUTOFF VALUE 'Y'.                                  
                                                                        00540000
       EJECT                                                            00550000
      *******************************************************           00560000
      *      B1 WORK AREA                                               00570000
      *******************************************************           00580000
       01  B1-RECORD.                                                   00590000
           05  B1-REC-ID.                                               00600000
               09  B1-CLIENT-NO          PIC 9(03) COMP-3.              00610000
               09  B1-CARD-NO            PIC 9(07) COMP-3.              00620000
               09  B1-CLIENT             PIC 9(03) COMP-3.              00630000
               09  B1-SEQUENCE           PIC 9(05) COMP-3 VALUE 1.      00640000
           05  B1-REC-TYP-3              PIC X(01) VALUE '3'.           00650000
           05  B1-COUNTRY                PIC X(03).                     00660000
           05  FILLER REDEFINES B1-COUNTRY.                             00670000
               09  B1-PROCESS-POST-DAYS  PIC X(02).                     00680000
               09  FILLER                PIC X(01).                     00690000
           05  FILLER                    PIC X(07).                     00700000
                                                                        00710000
       EJECT                                                            00720000
                                                                        00730000
      *******************************************************           00740000
      *      ACAT04RS WORK AREA                                         00750000
      *******************************************************           00760000
       01  ACAT04RS-WORK-AREA.                                          00770000
           05  CALLED-PROGRAM-NAME        PIC X(08).                    00780000
           05  WORK-QTY-X                 PIC X(20).                    00790000
           05  FILLER REDEFINES WORK-QTY-X.                             00800000
               09 WORK-QTY                PIC 9(12)V9(05).              00810000
               09 FILLER                  PIC X(03).                    00820000
           05  WORK-DATE-X.                                             00830000
               09 WORK-DATE-X-MM          PIC X(02).                    00840000
               09 FILLER                  PIC X(01).                    00850000
               09 WORK-DATE-X-YY          PIC X(02).                    00860000
           05  WORK-DATE.                                               00870000
               09 WORK-DATE-MM            PIC X(02).                    00880000
               09 WORK-DATE-YY            PIC X(02).                    00890000
           05  TWA-CLIENT-NO-X.                                         00900000
               09 TWA-CLIENT-NO-9         PIC 9(04).                    00910000
           05  WS-DATE-YYYYMMDD           PIC 9(08).                    00920000
           05  WS-DATE-FIELDS REDEFINES WS-DATE-YYYYMMDD.               00930000
               09  WS-DATE-CC             PIC X(02).                    00940000
               09  WS-DATE-YY             PIC X(02).                    00950000
               09  WS-DATE-MM             PIC X(02).                    00960000
               09  WS-DATE-DD             PIC X(02).                    00970000
           05  WS-DATE-EDIT.                                            00980000
               09  WS-DATE-MM             PIC X(02).                    00990000
               09  FILLER                 PIC X(01)  VALUE '/'.         01000000
               09  WS-DATE-DD             PIC X(02).                    01010000
               09  FILLER                 PIC X(01)  VALUE '/'.         01020000
               09  WS-DATE-YY             PIC X(02).                    01030000
           05  WS-FORMAT-DATE.                                          01040000
               09  WS-MM                  PIC X(02).                    01050000
               09  FILLER                 PIC X(01)  VALUE '/'.         01060000
               09  WS-DD                  PIC X(02).                    01070000
               09  FILLER                 PIC X(01)  VALUE '/'.         01080000
               09  WS-YY                  PIC X(02).                    01090000
           05  DATE-FOUND-FLAG            PIC X(01) VALUE 'N'.          01100000
               88  DATE-FOUND             VALUE 'Y'.                    01110000
           05  WK-BROWSE-FORWARD-FLAG     PIC X(01) VALUE 'Y'.          01120000
               88  WK-BROWSE-FORWARD      VALUE 'Y'.                    01130000
               88  WK-BROWSE-BACKWARD     VALUE 'N'.                    01140000
           05  FIRST-TIME-FLAG            PIC X(01)  VALUE 'N'.         01150000
               88  FIRST-TIME             VALUE  'Y'.                   01160000
           05  WS-UPDATE-IND              PIC X(01)  VALUE 'N'.         01170000
           05  ERASE-KEY-VALUE            PIC S9(04) COMP VALUE +128.   01180000
           05  FILLER REDEFINES ERASE-KEY-VALUE.                        01190000
               09  FILLER                 PIC X(01).                    01200000
               09  ERASE-KEY              PIC X(01).                    01210000
           05  WS-SSN-ONE.                                              01220000
               09  WS-SSN-ONE-1           PIC 9(03).                    01230000
               09  WS-SSN-ONE-2           PIC 9(02).                    01240000
               09  WS-SSN-ONE-3           PIC 9(04).                    01250000
           05  WS-SSN-ONE-REFORM.                                       01260000
               09  WS-SSN-ONE-1R          PIC 9(03).                    01270000
               09  FILLER                 PIC X(01)  VALUE '-'.         01280000
               09  WS-SSN-ONE-2R          PIC 9(02).                    01290000
               09  FILLER                 PIC X(01)  VALUE '-'.         01300000
               09  WS-SSN-ONE-3R          PIC 9(04).                    01310000
           05  WS-SSN-TWO.                                              01320000
               09  WS-SSN-TWO-1           PIC 9(03).                    01330000
               09  WS-SSN-TWO-2           PIC 9(02).                    01340000
               09  WS-SSN-TWO-3           PIC 9(04).                    01350000
           05  WS-SSN-TWO-REFORM.                                       01360000
               09  WS-SSN-TWO-1R          PIC 9(03).                    01370000
               09  FILLER                 PIC X(01)  VALUE '-'.         01380000
               09  WS-SSN-TWO-2R          PIC 9(02).                    01390000
               09  FILLER                 PIC X(01)  VALUE '-'.         01400000
               09  WS-SSN-TWO-3R          PIC 9(04).                    01410000
           05  DATA-ONLY-FLAG             PIC X(01)  VALUE 'N'.         01420000
               88  DATA-ONLY              VALUE  'Y'.                   01430000
           05  WK-CURSOR                  PIC S9(04) COMP.              01440000
           05  SYSTEM-MSG                 PIC X(79) VALUE SPACES.       01450000
           05  ABEND-LINE.                                              01460000
               09  ABEND-MSG              PIC X(30).                    01470000
               09  FILLER                 PIC X(11) VALUE ' EIBRESP ='. 01480000
               09  ABEND-EIBRESP          PIC 99.                       01490000
ET0003     05  WS-ACCT-FREEZE-MSG-LINES.                                01500000
ET0003         09 WS-FULL-FREEZE-MSG      PIC X(23) VALUE               01510000
ET0003            'ACCOUNT IS FULLY FROZEN'.                            01510100
ET0003         09 WS-CASH-FREEZE-MSG      PIC X(29) VALUE               01510200
ET0003            'ACCOUNT IS FROZEN FOR CASH IN'.                      01510300
ET0003         09 WS-SEC-FREEZE-MSG       PIC X(28) VALUE               01510400
ET0003            'ACCOUNT IS FROZEN FOR SEC IN'.                       01510500
           05  WS-FILE-NOT-OPEN-MSG.                                    01510600
               09  WS-FILE-ID             PIC X(9)  VALUE 'ACAT04'.     01510700
               09  FILLER                 PIC X(23) VALUE               01510800
                'FILE IS NOT AVAILABLE.'.                               01510900
           05  UNAUTH-MESSAGE             PIC X(79)                     01511000
               VALUE 'UNAUTHORIZED USER.'.                              01512000
           05  SEC-MESSAGE                PIC X(79)                     01513000
               VALUE 'SIGN ON SECURITY NOT AVAILABLE, TRY AGAIN.'.      01514000
           05  ERROR-PROG-MSG.                                          01515000
               09  ERROR-PROG-NAME        PIC X(08).                    01516000
               09  FILLER                 PIC X(71)                     01517000
                   VALUE ' PROGRAM NOT AVAILIABLE.'.                    01518000
           05 WS-DB2-ERROR-MSG.                                         01519000
               10 FILLER                 PIC X(36) VALUE                01520000
               'ACAT04RS - DB2 ERROR '.                                 01530000
               10 WS-DB2-ERROR-FUNCTION  PIC X(06) VALUE SPACES.        01540000
               10 WS-DB2-ERROR-TABLE     PIC X(09) VALUE SPACES.        01550000
               10 WS-DB2-ERROR-ID        PIC -999  VALUE SPACES.        01560000
LRM007         10 FILLER                 PIC X(15) VALUE                01570000
LRM007            ' CALL HELP DESK'.                                    01571000
           05  ACT-COUNT                  PIC 9(03).                    01580000
           05  LINE-COUNT                 PIC 9(03).                    01590000
           05  IDX                        PIC S9(03) COMP-3.            01600000
           05  C-IDX                      PIC S9(03) COMP-3.            01610000
           05  SECLINK-TABLE-POINTER      PIC S9(8) COMP VALUE +0.      01620000
           05  SECLINK-TABLE-PTR REDEFINES                              01630000
               SECLINK-TABLE-POINTER    USAGE IS POINTER.               01640000
           05  WS-ACAT-NEXT                     PIC X(01).              01650000
           05  WS-CUSTNM.                                               01660000
               10  WS-CUSTNM-LN1                PIC X(30).              01670000
               10  WS-CUSTNM-LN2                PIC X(30).              01680000
06/04      05  WS-ALERT-MSG                     PIC X(35)  VALUE        01690000
06/04          'THIS ACCOUNT HAS AN ALERT MESSAGE'.                     01700000
06/04      05  WS-RESTRICTED-MSG                PIC X(35)  VALUE        01710000
06/04          'THIS ITEM IS A RESTRICTED SECURITY'.                    01720000
           05  WS-ASSET-DESC.                                           01730000
               10  WS-ASSET-DESC1               PIC X(30).              01740000
               10  WS-ASSET-DESC2               PIC X(30).              01750000
               10  WS-ASSET-DESC3               PIC X(30).              01760000
            05  WS-INPUT-VALIDATE-SW            PIC X(01)  VALUE SPACE. 01770000
                88  INPUT-VALIDATED             VALUE 'Y'.              01780000
                88  NO-INPUT                    VALUE 'N'.              01790000
            05  WS-M4ACCPT                      PIC X(02)  VALUE SPACE. 01800000
                88  INPUT-ACCPT-IA              VALUE 'IA'.             01810000
                88  INPUT-ACCPT-DA              VALUE 'DA'.             01820000
            05  WS-M4ACCEL                      PIC X(02)  VALUE SPACE. 01830000
                88  INPUT-ACCEL-IX              VALUE 'IX'.             01840000
                88  INPUT-ACCEL-DX              VALUE 'DX'.             01850000
            05  WS-M4AREJ                       PIC X(02)  VALUE SPACE. 01860000
                88  INPUT-REJ-IR                VALUE 'IR'.             01870000
                88  INPUT-REJ-DR                VALUE 'DR'.             01880000
            05  WS-M4AREJC                      PIC X(02)  VALUE SPACE. 01890000
                88  INPUT-REJC-RC               VALUE 'RC'.             01900000
                88  INPUT-REJC-DC               VALUE 'DC'.             01910000
            05  WS-CURSOR                  PIC X(02)  VALUE SPACE.      01920000
DJ0002          88  CURSOR-ON-MCD          VALUE 'CD'.                  01930000
                88  CURSOR-ON-M4NEXT       VALUE 'NX'.                  01940000
                88  CURSOR-ON-M4ACCPT      VALUE 'AP'.                  01950000
                88  CURSOR-ON-M4ACCEL      VALUE 'AX'.                  01960000
                88  CURSOR-ON-M4REJ        VALUE 'RJ'.                  01970000
                88  CURSOR-ON-M4REJC       VALUE 'RC'.                  01980000
                88  CURSOR-ON-MBR          VALUE 'BR'.                  01990000
                88  CURSOR-ON-MAC          VALUE 'AC'.                  02000000
                88  CURSOR-ON-MRR          VALUE 'RR'.                  02010000
                88  CURSOR-ON-MCBRKR       VALUE 'BK'.                  02020000
                88  CURSOR-ON-MTFR         VALUE 'TR'.                  02030000
                88  CURSOR-ON-MSTAT        VALUE 'ST'.                  02040000
            05  WS-SEND-CMNT-SW            PIC X(02).                   02050000
                88  VIEW-ACCT-CMNT         VALUE 'VT'.                  02060000
                88  VIEW-BAL1-CMNT         VALUE 'V1'.                  02070000
                88  VIEW-BAL2-CMNT         VALUE 'V2'.                  02080000
                88  VIEW-BAL5-CMNT         VALUE 'V5'.                  02090000
                88  VIEW-SECR-CMNT         VALUE 'VA'.                  02100000
                88  VIEW-REJC-CMNT         VALUE 'JC'.                  02110000
01/08       05  WS-NBR-OF-DAYS.                                         02120000
                10  FILLER                 PIC X(01)  VALUE '-'.        02130000
                10  WS-DAYS                PIC 9(02).                   02140000
01/08       05  WS-STATUS-TABLE.                                        02150000
                10  MSG-100.                                            02160000
                    15  MSG-100-X          PIC X(11)  VALUE             02170000
                       '100/REQUEST'.                                   02180000
                    15  FILLER             PIC X(03)  VALUE ' - '.      02190000
                    15  MSG-100-N          PIC X(02).                   02200000
                10  MSG-110.                                            02210000
                    15 MSG-110-X           PIC X(18)  VALUE             02220000
                       '110/REQUEST ADJUST'.                            02230000
                    15  FILLER             PIC X(03)  VALUE ' - '.      02240000
                    15  MSG-110-N          PIC X(02).                   02250000
                10  MSG-120.                                            02260000
                    15  MSG-120-X          PIC X(20)  VALUE             02270000
                        '120/REQUEST ADJ PAST'.                         02280000
                    15  FILLER             PIC X(03)  VALUE ' - '.      02290000
                    15  MSG-120-N          PIC X(02).                   02300000
                10  MSG-130.                                            02310000
                    15 MSG-130-X           PIC X(16)  VALUE             02320000
                        '130/REQUEST PAST'.                             02330000
                    15  FILLER             PIC X(03)  VALUE ' - '.      02340000
                    15  MSG-130-N          PIC X(02).                   02350000
                10  MSG-140.                                            02360000
                    15 MSG-140-X           PIC X(20)  VALUE             02370000
                        '140/REQUEST REJECTED'.                         02380000
                    15  FILLER             PIC X(03)  VALUE ' - '.      02390000
                    15  MSG-140-N          PIC X(02).                   02400000
                10  MSG-200.                                            02410000
                    15 MSG-200-X           PIC X(10)  VALUE             02420000
                       '200/REVIEW'.                                    02430000
                    15  FILLER             PIC X(03)  VALUE ' - '.      02440000
                    15  MSG-200-N          PIC X(02).                   02450000
                10  MSG-210.                                            02460000
                    15 MSG-210-X           PIC X(17)  VALUE             02470000
                       '210/REVIEW ADJUST'.                             02480000
                    15  FILLER             PIC X(03)  VALUE ' - '.      02490000
                    15  MSG-210-N          PIC X(02).                   02500000
                10  MSG-220.                                            02510000
                    15 MSG-220-X           PIC X(16)  VALUE             02520000
                       '220/REVIEW ERROR'.                              02530000
                    15  FILLER             PIC X(03)  VALUE ' - '.      02540000
                    15  MSG-220-N          PIC X(02).                   02550000
                10  MSG-230.                                            02560000
                    15 MSG-230-X           PIC X(22)  VALUE             02570000
                       '230/REVIEW ACCELERATED'.                        02580000
                    15  FILLER             PIC X(03)  VALUE ' - '.      02590000
                    15  MSG-230-N          PIC X(02).                   02600000
DJ0002          10  MSG-240.                                            02610000
DJ0002              15 MSG-240-X           PIC X(19)  VALUE             02620000
DJ0002                 '240/REV-ADJ-REC-ACL'.                           02630000
DJ0002              15  FILLER             PIC X(03)  VALUE ' - '.      02640000
DJ0002              15  MSG-240-N          PIC X(02).                   02650000
                10  MSG-300.                                            02660000
                    15 MSG-300-X           PIC X(15)  VALUE             02670000
                       '300/SETTLE PREP'.                               02680000
                    15  FILLER             PIC X(03)  VALUE ' - '.      02690000
                    15  MSG-300-N          PIC X(02).                   02700000
                10  MSG-310.                                            02710000
                    15 MSG-310-X           PIC X(16)  VALUE             02720000
                       '310/SETTLE CLOSE'.                              02730000
                    15  FILLER             PIC X(03)  VALUE ' - '.      02740000
                    15  MSG-310-N          PIC X(02).                   02750000
                10  MSG-400.                                            02760000
                    15  MSG-400-X           PIC X(15)  VALUE            02770000
                        '400/CLOSE PURGE'.                              02780000
                    15  FILLER             PIC X(03)  VALUE ' - '.      02790000
                    15  MSG-400-N          PIC X(02).                   02800000
                10  MSG-500.                                            02810000
                    15  MSG-500-X           PIC X(25)  VALUE            02820000
                       '500/MEMO PARTIAL TRANSFER'.                     02830000
                    15  FILLER             PIC X(03)  VALUE ' - '.      02840000
                    15  MSG-500-N          PIC X(02).                   02850000
                10  MSG-510.                                            02860000
                    15  MSG-510-X           PIC X(23)  VALUE            02870000
                       '510/MEMO PURGE PART TFR'.                       02880000
                    15  FILLER             PIC X(03)  VALUE ' - '.      02890000
                    15  MSG-510-N          PIC X(02).                   02900000
            05  WS-MSG-OUT                 PIC X(79).                   02910000
            05  WS-ERROR-SW                PIC X(01).                   02920000
                88  ERROR-YES              VALUE 'Y'.                   02930000
            05  WS-CICS-MSG.                                            02940000
                10  WS-CICS-DISPLAY        PIC X(21) VALUE SPACES.      02950000
                10  FILLER                 PIC X     VALUE SPACES.      02960000
                10  WS-DISPLAY-CICS-DESC.                               02970000
                    15  FILLER             PIC X(20) VALUE              02980000
                          'CICS RETURN CODE = '.                        02990000
                    15  FILLER             PIC X(02) VALUE SPACES.      03000000
                    15  WS-CICS-RC         PIC X(06) VALUE SPACES.      03010000
                    15  FILLER             PIC X(05) VALUE SPACES.      03020000
                10  FILLER                 PIC X(21) VALUE              03030000
                          'CONTACT HELP DESK'.                          03040000
           EJECT                                                        03050000
      *******************************************************           03060000
      *               ACATEDIT  WORK AREA                               03070000
      *******************************************************           03080000
       01  EDIT-AMT-AREA.                                               03090000
           05  WK-AMT-CODE                PIC X(01) VALUE 'D'.          03100000
           05  WK-AMT-NUM-ITEM            PIC S9(03) COMP-3 VALUE +1.   03110000
           05  WK-AMT-IN-LEN              PIC S9(03) COMP-3 VALUE +19.  03120000
           05  WK-AMT-OUT-LEN             PIC S9(03) COMP-3 VALUE +17.  03130000
           05  WK-AMT-IN                  PIC X(19) VALUE LOW-VALUE.    03140000
           05  WK-AMT-OUT                 PIC S9(15)V99.                03150000
           05  WK-AMT-DECIMAL-LEN         PIC S9(03) COMP-3 VALUE +2.   03160000
           05  WK-AMT-COMMAR              PIC X(01) VALUE 'Y'.          03170000
           05  WK-AMT-RET-CODE            PIC X(01) VALUE SPACE.        03180000
           05  FILLER                     PIC X(01) VALUE HIGH-VALUE.   03190000
                                                                        03200000
       01  WK-FORMATTED-AMT.                                            03210000
           05  WK-AMT-COMMAS-3      PIC ZZZ,ZZZ,ZZZ,ZZZ.99-.            03220000
           05  WK-AMT-COMMAS-2      PIC ZZZZZZZ,ZZZ,ZZZ.99-.            03230000
           05  WK-AMT-COMMAS-1      PIC ZZZZZZZZZZZ,ZZZ.99-.            03240000
           05  WK-AMT-COMMAS-0      PIC ZZZZZZZZZZZZZZZ.99-.            03250000
                                                                        03260000
       01  EDIT-QTY-AREA.                                               03270000
           05  WK-QTY-CODE                PIC X(01) VALUE 'D'.          03280000
           05  WK-QTY-NUM-ITEM            PIC S9(03) COMP-3 VALUE +1.   03290000
           05  WK-QTY-IN-LEN              PIC S9(03) COMP-3 VALUE +22.  03300000
           05  WK-QTY-OUT-LEN             PIC S9(03) COMP-3 VALUE +21.  03310000
           05  WK-QTY-IN                  PIC X(22) VALUE LOW-VALUE.    03320000
           05  WK-QTY-OUT.                                              03330000
               07  WK-QTY-OUT-WHOLE       PIC 9(17).                    03340000
               07  WK-QTY-OUT-FRACTION    PIC SV9(04).                  03350000
           05  WK-QTY-OUT-D1X REDEFINES WK-QTY-OUT.                     03360000
               07  FILLER                 PIC X.                        03370000
               07  WK-QTY-OUT-D1          PIC S9(16)V9.                 03380000
               07  FILLER                 PIC X(03).                    03390000
           05  WK-QTY-OUT-D2X REDEFINES WK-QTY-OUT.                     03400000
               07  FILLER                 PIC X(02).                    03410000
               07  WK-QTY-OUT-D2          PIC S9(15)V99.                03420000
               07  FILLER                 PIC X(02).                    03430000
           05  WK-QTY-OUT-D3X REDEFINES WK-QTY-OUT.                     03440000
               07  FILLER                 PIC X(03).                    03450000
               07  WK-QTY-OUT-D3          PIC S9(14)V999.               03460000
               07  FILLER                 PIC X.                        03470000
           05  WK-QTY-OUT-D4X REDEFINES WK-QTY-OUT.                     03480000
               07  FILLER                 PIC X(04).                    03490000
               07  WK-QTY-OUT-D4          PIC S9(13)V9999.              03500000
           05  WK-QTY-DECIMAL-LEN         PIC S9(03) COMP-3 VALUE +4.   03510000
           05  WK-QTY-COMMAR              PIC X(01) VALUE 'Y'.          03520000
           05  WK-QTY-RET-CODE            PIC X(01) VALUE SPACE.        03530000
           05  FILLER                     PIC X(01) VALUE HIGH-VALUE.   03540000
                                                                        03550000
        01  WS-MQTY-AREA.                                               03560000
DJ0002     05  WS-MQTY-ED-D2           PIC  ZZZZZZ,ZZZ,ZZZ,ZZZ.99-.     03570000
      *----------------------------------------------------------------*03580000
       EJECT                                                            03590000
ET0003 01  ACATRSTIO-CALL-AREA.                                         03600000
ET0003     COPY ACATRSIO.                                               03610000
ET0003     EJECT                                                        03620000
       COPY SECLINKC.                                                   03630000
            EJECT                                                       03640000
       COPY ATTR.                                                       03650000
            EJECT                                                       03660000
       COPY DFHAID.                                                     03670000
            EJECT                                                       03680000
DJ0002 COPY DFHBMSCA.                                                   03690000
            EJECT                                                       03700000
       COPY ACAT0FIO.                                                   03710000
            EJECT                                                       03720000
       COPY ACATSRCH.                                                   03730000
            EJECT                                                       03740000
       COPY ACATCOM.                                                    03750000
            EJECT                                                       03760000
       01  ACAT04M-IO-AREA                PIC X(1000).                  03770000
      ****  HDR & TRL MAPS ***************                              03780000
       COPY ACAT00M.                                                    03790000
      ****  ACAT04RS MAP   ***************                              03800000
       COPY ACAT04M.                                                    03810000
      ************************************                              03820000
       EJECT                                                            03830000
      ******************************************************************03840000
       01  ACAT04IO-AREA.                                               03850000
       COPY ACAT04IO.                                                   03860000
       EJECT                                                            03870000
       01  ACAT90CM-AREA.                                               03880000
       COPY ACAT90TS.                                                   03890000
                                                                                
LRM010 01  TABL-RECORD.                                                         
LRM010    03  TABL-KEY.                                                         
LRM010        05  TABL-LITERAL   PIC X(33) VALUE 'ACAT        DCYCLE5'.         
LRM010    03  TABL-DATA.                                                        
LRM010        05  FILLER         PIC X(01).                                     
LRM010        05  TABL-HHMM      PIC X(04).                                     
LRM010        05  FILLER         PIC X(56).                                     
       EJECT                                                            03900000
       LINKAGE SECTION.                                                 03910000
       01  DFHCOMMAREA.                                                 03920000
           03  FILLER                           PIC X(2000).            03930000
       COPY TWACOMM.                                                    03940000
      ******************************************************************03950000
      * WARNING: TWA-ACAT04IO-AREA MUST MATCH ACAT04IO-AREA            *03960000
      ******************************************************************03970000
           03 TWA-ACAT04IO-AREA.                                        03980000
              05 TWA-ACAT04IO-FIRST-TIME-SW       PIC X(01).            03990000
                 88  TWA-ACAT04IO-FIRST-TIME      VALUE 'Y'.            04000000
              05 TWA-DB2-INFO.                                          04010000
                 07  TWA-FUNCTION                     PIC X(02).        04020000
                      88 TWA-SRCH-VASSET                VALUE 'RA'.     04030000
                      88 TWA-SRCH-VTRNFR                VALUE 'RT'.     04040000
                      88 TWA-UPDT-VTRNFR                VALUE 'UT'.     04050000
                      88 TWA-INSR-VINITRNF              VALUE 'II'.     04060000
                      88 TWA-DLTE-VINITRNF              VALUE 'DI'.     04070000
DJ0002                88 TWA-ISRT-VINITAST              VALUE 'IS'.     04080000
DJ0002                88 TWA-DLTE-VINITAST              VALUE 'DS'.     04090000
                 07  TWA-SRCH-ACTION.                                   04100000
                     10  TWA-SEARCH-VTRNFR            PIC X(01).        04110000
                         88 TWA-SRCH-VTRNFR-FWD          VALUE 'F'.     04120000
                         88 TWA-SRCH-VTRNFR-BWD          VALUE 'B'.     04130000
                         88 TWA-SRCH-VTRNFR-PND          VALUE 'P'.     04140000
                     10  TWA-SEARCH-VASSET            PIC X(01).        04150000
                         88 TWA-SRCH-VASSET-FWD          VALUE 'F'.     04160000
                         88 TWA-SRCH-VASSET-BWD          VALUE 'B'.     04170000
                     10  TWA-PREV-VASSET-ACT          PIC X(01).        04180000
                         88 TWA-PREV-VASSET-FWD          VALUE 'F'.     04190000
                         88 TWA-PREV-VASSET-BWD          VALUE 'B'.     04200000
                 05  TWA-RETURN-CODES.                                  04210000
                     07 TWA-DB2-ERROR-SW          PIC X(01).            04220000
                        88 TWA-DB2-ERROR                  VALUE 'Y'.    04230000
                     07 TWA-VTRNFR-SW             PIC X(01).            04240000
                        88 TWA-VTRNFR-FOUND               VALUE 'Y'.    04250000
                        88 TWA-VTRNFR-NOT-FOUND           VALUE 'N'.    04260000
                        88 TWA-VTRNFR-UPDATED             VALUE 'U'.    04270000
                        88 TWA-VTRNFR-FIRST               VALUE 'F'.    04280000
                        88 TWA-VTRNFR-LAST                VALUE 'L'.    04290000
                     07 TWA-VINITRNF-SW            PIC X(01).           04300000
                        88 TWA-VINITRNF-FOUND               VALUE 'Y'.  04310000
                        88 TWA-VINITRNF-NOT-FOUND           VALUE 'N'.  04320000
                        88 TWA-VINITRNF-UPDATED             VALUE 'U'.  04330000
                        88 TWA-VINITRNF-INSERTED            VALUE 'I'.  04340000
                        88 TWA-VINITRNF-DELETED             VALUE 'D'.  04350000
                     07 TWA-VASSET-SW        PIC X(01).                 04360000
                        88 TWA-VASSET-FOUND                 VALUE 'Y'.  04370000
                        88 TWA-VASSET-NOT-FOUND             VALUE 'N'.  04380000
                        88 TWA-VASSET-FIRST                 VALUE 'F'.  04390000
                        88 TWA-VASSET-LAST                  VALUE 'L'.  04400000
01/22                07 TWA-VOPTN-SW        PIC X(01).                  04410000
                        88 TWA-VOPTN-FOUND                 VALUE 'Y'.   04420000
                        88 TWA-VOPTN-NOT-FOUND             VALUE 'N'.   04430000
DJ0002               07 TWA-VINITAST-SW      PIC X(01).                 04440000
DJ0002                  88 TWA-VINITAST-FOUND              VALUE 'Y'.   04450000
DJ0002                  88 TWA-VINITAST-NOT-FOUND      VALUE 'N' ' '.   04460000
                     07  TWA-SQLCA.                                     04470000
                        10  TWA-SQLCAID               PIC X(08).        04480000
                        10  TWA-SQLCODE               PIC S9(9) COMP-4. 04490000
                        10  TWA-SQLERRM.                                04500000
                            13  TWA-SQLERRML          PIC S9(04) COMP.  04510000
                            13  TWA-SQLERRMC          PIC X(70).        04520000
                     07  TWA-ACAT04IO-COUNT.                            04530000
                        10 TWA-ACAT04IO-VTRNFR-COUNT     PIC 9(9) COMP. 04540000
                        10 TWA-ACAT04IO-VASSET-COUNT     PIC 9(9) COMP. 04550000
                        10 TWA-ACAT04IO-VASSET-COUNT-SV  PIC 9(9) COMP. 04560000
                        10 TWA-ACAT04IO-MAX-VASSET-SEQ   PIC 9(4) COMP. 04570000
               05 TWA-SV-TRNFR-KEY.                                     04580000
                   10 TWA-SV-CLIENT-NBR         PIC X(04).              04590000
                   10 TWA-SV-ACAT-CNTL-NBR      PIC X(14).              04600000
                   10 TWA-SV-BRANCH-CD          PIC X(03).              04610000
                   10 TWA-SV-ACCT-CD            PIC X(05).              04620000
                   10 TWA-SV-RR-CD              PIC X(03).              04630000
                   10 TWA-SV-BRKR               PIC X(04).              04640000
                   10 TWA-SV-TFR                PIC X(03).              04650000
                   10 TWA-SV-RD                 PIC X(01).              04660000
                   10 TWA-SV-STCD               PIC X(03).              04670000
                   10 TWA-SV-SD                 PIC X(06).              04680000
                   10 TWA-SV-ASSET-SEQ-NBR      PIC S9(4) COMP.         04690000
ET0003         05  TWA-ACCT-FREEZ-PROCESS       PIC X(01).              04700000
ET0003         05  TWA-ACCT-FREEZ-TYPE          PIC X(01).              04710000
ET0004         05  TWA-SNON-ID                  PIC X(04).              04720000
ET0004         05  TWA-USER-NAME                PIC X(20).              04730000
ET0004         05  TWA-USER-ID                  PIC X(08).              04740000
ET0004         05  TWA-NET-NAME                 PIC X(08).              04750000
               05  ACAT04DA-TWA-AREA.                                   04760000
                   10 TWA-SCREEN-IND            PIC X(01).              04770000
                   10 TWA-CLIENT-NBR            PIC X(04).              04780000
                   10 TWA-ACAT-CONTROL-NBR      PIC X(14).              04790000
                   10 TWA-BRANCH-CD             PIC X(03).              04800000
                   10 TWA-ACCT-CD               PIC X(05).              04810000
                   10 TWA-RR-CD                 PIC X(03).              04820000
                   10 TWA-TFR-TYPE              PIC X(03).              04830000
                   10 TWA-STCD                  PIC X(03).              04840000
                   10 TWA-DAYS                  PIC 9(02).              04850000
                   10 TWA-RCV-NBR               PIC X(04).              04860000
                   10 TWA-DLVR-NBR              PIC X(04).              04870000
                   10 TWA-ACCT-DLVR-NBR         PIC X(20).              04880000
                   10 TWA-ACCT-RCV-NBR          PIC X(20).              04890000
                   10 TWA-RCV-CUST-NM           PIC X(60).              04900000
                   10 TWA-RCV-SS-PRIM-NBR       PIC X(09).              04910000
                   10 TWA-RCV-SS-SCNDY-NBR      PIC X(09).              04920000
                   10 TWA-RCV-ACCT-TYPE-CD      PIC X(02).              04930000
                   10 TWA-INIT-TRANS-TYPE-CD    PIC X(01).              04940000
                   10 TWA-VINITRNF-NSCC-PEND-CD PIC X(01).              04950000
                   10 TWA-VTRNFR-NSCC-PEND-CD   PIC X(01).              04960000
LRM006             10 FILLER                    PIC X(01).              04970000
                   10 TWA-STTLM-DT              PIC X(10).              04980000
                   10 TWA-VTRNFR-CMNT           PIC X(120).             04990000
06/04              10 TWA-ALERT-IND             PIC X(01).              05000000
01/05              10 TWA-BAL01                 PIC S9(15)V99 COMP-3.   05010000
12/31              10 TWA-BAL01-STTLM-RSN-CD    PIC X(04).              05020000
12/31                 88  TWA-BAL01-CREDIT      VALUE 'CRED'.           05030000
12/31                 88  TWA-BAL01-DEBIT       VALUE 'DEB '.           05040000
01/05              10 TWA-BAL02                 PIC S9(15)V99 COMP-3.   05050000
12/31              10 TWA-BAL02-STTLM-RSN-CD    PIC X(04).              05060000
12/31                 88  TWA-BAL02-CREDIT      VALUE 'CRED'.           05070000
12/31                 88  TWA-BAL02-DEBIT       VALUE 'DEB '.           05080000
01/05              10 TWA-BAL05                 PIC S9(15)V99 COMP-3.   05090000
12/31              10 TWA-BAL05-STTLM-RSN-CD    PIC X(04).              05100000
12/31                 88  TWA-BAL05-CREDIT      VALUE 'CRED'.           05110000
12/31                 88  TWA-BAL05-DEBIT       VALUE 'DEB '.           05120000
01/05              10 TWA-SMA                   PIC S9(15)V99 COMP-3.   05130000
                   10 TWA-RETURN-MSG            PIC X(70).              05140000
               05  ACAT04IO-TWA-EXCEPTIONS.                             05150000
                   10 FILLER                       PIC X(1).            05160000
                   10 TWA-ACCT-ACTIVITY-IND        PIC X(1).            05170000
                   10 TWA-ACCT-ORDERS-IND          PIC X(1).            05180000
                   10 TWA-ACCT-RJCT-RSBM-IND       PIC X(1).            05190000
                   10 TWA-ACCT-DB-BAL-T1-IND       PIC X(1).            05200000
                   10 TWA-ACCT-MRGN-DB-IND         PIC X(1).            05210000
                   10 TWA-ACCT-SHRT-PSTN-IND       PIC X(1).            05220000
                   10 TWA-ACCT-SEC-RSTRD-IND       PIC X(1).            05230000
                   10 TWA-ACCT-AST-EXCS-IND        PIC X(1).            05240000
                   10 TWA-ACCT-OPTN-PSTN-IND       PIC X(1).            05250000
                   10 TWA-ACCT-LTD-PRTNR-IND       PIC X(1).            05260000
                   10 TWA-ACCT-TIN-MSMTH-IND       PIC X(1).            05270000
                   10 TWA-ACCT-DPLCT-TRN-IND       PIC X(1).            05280000
                   10 TWA-ACCT-CUST-70-IND         PIC X(1).            05290000
                   10 TWA-ACCT-QULFD-PLN-IND       PIC X(1).            05300000
                   10 TWA-ACCT-MNGD-IND            PIC X(1).            05310000
                   10 TWA-ACCT-PRVT-RNG-IND        PIC X(1).            05320000
                   10 TWA-ACCT-BRKR-TIF-IND        PIC X(1).            05330000
                   10 TWA-NSCC-NON-ADP-IND         PIC X(1).            05340000
                   10 TWA-COMMENTS-IND             PIC X(1).            05350000
ET0003             10 TWA-ACCT-FRZN-IND            PIC X(01).           05360000
LRM005             10 TWA-STTLM-TM-CD              PIC X(1).            05361000
LRM006             10 TWA-90DR-IND                 PIC X(1).            05362000
LRM006             10 TWA-REGT-IND                 PIC X(1).            05363000
DJ0003             10 TWA-AUCTION-RATE-IND         PIC X(1).            05363000
LRM011             10 TWA-SUB-PENNY-PRICE-IND      PIC X(1).            05363000
               05  ACAT04DC-TWA-AREA.                                   05370000
                   10 TWA-SEC-NBR                 PIC X(12).            05380000
                   10 TWA-TRANS-TYPE-CD           PIC X(01).            05390000
                   10 TWA-CSH-MGN-SHRT-CD         PIC X(01).            05400000
                      88 TWA-CASH-ASSET             VALUE 'C'.          05410000
                      88 TWA-MARGIN-ASSET           VALUE 'M'.          05420000
                      88 TWA-SHORT-ASSET            VALUE 'S'.          05430000
                   10 TWA-PSTN-CD                  PIC X(01).           05440000
                      88 TWA-SHORT-ASSET-QTY        VALUE 'S'.          05450000
                      88 TWA-LONG-ASSET-QTY         VALUE 'L'.          05460000
                      88 TWA-NA-ASSET-QTY           VALUE 'N'.          05470000
01/22              10 TWA-OPTN-CTGY-CD              PIC X(02).          05480000
01/22              10 TWA-OPT-BS-CD                 PIC X(01).          05490000
                      88  TWA-OPT-BUY               VALUE 'B'.          05500000
                      88  TWA-OPT-SELL              VALUE 'S'.          05510000
                   10 TWA-WHEN-ISSUED              PIC X(01).           05520000
                   10 TWA-STTLM-LOCATION           PIC X(02).           05530000
                   10 TWA-TRNFR-TYPE-RSN-CD        PIC X(02).           05540000
01/05              10 TWA-ASSET-QTY              PIC S9(13)V9(4) COMP-3.05550000
01/05              10 TWA-ASSET-AMT                PIC S9(15)V99 COMP-3.05560000
                   10 TWA-ASSET-DESC               PIC X(140).          05570000
                   10 TWA-ASSET-CMNT               PIC X(120).          05580000
01/22              10 TWA-OPTN-CMNT-TXT            PIC X(16).           05590000
06/04              10 TWA-RESTRICTED-IND           PIC X(01).           05600000
DJ0002             10 TWA-ASSET-PRC-CTGY-CD        PIC X(04).           05610000
                                                                        05620000
DJ0002***---ONLY RECEIVER IS ALLOWED TO DELETE MUTUAL FUND ASSET ONLY.  05630000
DJ0002             10 TWA-VINITAST-TRANS-TYPE  PIC X(01).               05640000
DJ0002                88  TWA-VINITAST-DEL     VALUE 'D'.               05650000
LRM006             10 TWA-STTLM-RSN-CD         PIC X(04).               05651000
                                                                        05660000
               05 TWA-INPUT-AREA.                                       05670000
                 07  ACAT04IO-TWA-INPUT.                                05680000
DJ0002             10 TWA-MCD                   PIC X(01).              05690000
DJ0002                 88 TWA-MCD-DELETE        VALUE 'D'.              05700000
DJ0002                 88 TWA-MCD-UNDELETE      VALUE ' '.              05710000
                   10 TWA-M4NEXT                PIC X(01).              05720000
                   10 TWA-M4ACCPT               PIC X(01).              05730000
                       88 TWA-XFR-ACCPT-YES     VALUE 'S'.              05740000
                       88 TWA-XFR-ACCPT-NO      VALUE ' '.              05750000
                   10 TWA-M4ACCEL               PIC X(01).              05760000
                       88 TWA-XFR-ACCEL-YES     VALUE 'S'.              05770000
                       88 TWA-XFR-ACCEL-NO      VALUE ' '.              05780000
                   10 TWA-M4REJ                 PIC X(01).              05790000
                       88 TWA-XFR-REJ-YES       VALUE 'S'.              05800000
                       88 TWA-XFR-REJ-NO        VALUE ' '.              05810000
                   10 TWA-M4REJC                PIC X(01).              05820000
                       88 TWA-XFR-REJC-YES      VALUE 'S'.              05830000
                       88 TWA-XFR-REJC-NO       VALUE ' '.              05840000
                   10 TWA-VINITRNF-CMNT         PIC X(120).             05850000
                 07 TWA-TRLM-INPUT.                                     05860000
                   10 TWA-MBR                   PIC X(03).              05870000
                   10 TWA-MAC                   PIC X(05).              05880000
                   10 TWA-MRR                   PIC X(03).              05890000
                   10 TWA-MCBRKR                PIC X(04).              05900000
                   10 TWA-MTFR                  PIC X(03).              05910000
                   10 TWA-MRD                   PIC X(01).              05920000
                   10 TWA-MSTAT                 PIC X(03).              05930000
                   10 TWA-MSD                   PIC X(06).              05940000
      ******************************************************************05950000
      *   END OF TWA-ACAT04IO-AREA (MUST MATCH ACAT04IO-AREA)          *05960000
      ******************************************************************05970000
           03 TWA-ACAT-AREA.                                            05980000
              05 TWA-CAME-FROM-PENDING-SW       PIC X(01).              05990000
                 88 TWA-CAME-FROM-PENDING                 VALUE 'Y'.    06000000
              05 TWA-PREV-ACTIONS.                                      06010000
                 07 TWA-PREV-NEXT               PIC X(01).              06020000
                 07 TWA-PREV-ACCEPT             PIC X(01).              06030000
                 07 TWA-PREV-ACCEL              PIC X(01).              06040000
                 07 TWA-PREV-REJ                PIC X(01).              06050000
                 07 TWA-PREV-REJ-CMNT           PIC X(01).              06060000
              05 TWA-PREV-TRLM-INPUT.                                   06070000
                 07 TWA-PREV-MBR                PIC X(03).              06080000
                 07 TWA-PREV-MAC                PIC X(05).              06090000
                 07 TWA-PREV-MRR                PIC X(03).              06100000
                 07 TWA-PREV-MCBRKR             PIC X(04).              06110000
                 07 TWA-PREV-MTFR               PIC X(03).              06120000
                 07 TWA-PREV-MRD                PIC X(01).              06130000
                 07 TWA-PREV-MSTAT              PIC X(03).              06140000
                 07 TWA-PREV-MSD                PIC X(06).              06150000
                                                                        06160000
DJ0002        05 TWA-PREV-MCD                   PIC X(01).              06170000
                                                                        06180000
      **                                                                06190000
      ************************* BOTTOM OF DATA *************************06200000
                                                                        06210000
           EJECT                                                        06220000
                                                                        06230000
       PROCEDURE DIVISION.                                              06240000
       0000-INITIALIZATION.                                             06250000
           EXEC CICS IGNORE CONDITION   ERROR  ITEMERR MAPFAIL LENGERR  06260000
                     NOSPACE NOSTG  NOTFND    PGMIDERR QIDERR           06270000
           END-EXEC.                                                    06280000
                                                                        06290000
           EXEC CICS ASSIGN TWALENG (TWA-SIZE)                          06300000
           END-EXEC.                                                    06310000
           IF TWA-SIZE = 0                                              06320000
              MOVE LOW-VALUE TO ACAT04MO                                06330000
              MOVE 'TWA SIZE EQUAL ZERO, FATAL ERROR' TO TWA-RETURN-MSG 06340000
                    TWA-RETURN-MSG                                      06350000
              PERFORM  0830-ERROR-RTN.                                  06360000
                                                                        06370000
           EXEC CICS ADDRESS TWA (ADDRESS OF TWA-AREA)                  06380000
           END-EXEC.                                                    06390000
                                                                        06400000
                                                                        06410000
       0100-MAIN-PROCESSING.                                            06420000
           MOVE TWA-CLIENT-NO TO TWA-CLIENT-NO-9.                       06430000
           MOVE SPACES        TO TWA-RETURN-MSG.                        06440000
           MOVE LOW-VALUE     TO ACAT04MO.                              06450000
           IF NOT ACAT-SIGN-ON-UPDATE                                   06460000
              MOVE ATT-PROT  TO M4ACCELA M4ACCPTA M4REJA M4REJCA        06470000
DJ0002        MOVE ATT-PROT  TO MCDA                                    06480000
           ELSE                                                         06490000
              MOVE ATT-UNPROT-BRT TO M4NEXTA, M4ACCPTA, M4ACCELA,       06500000
                                     M4REJA,  M4REJCA                   06510000
           END-IF.                                                      06520000
           PERFORM 0150-GET-DATE-TIME-RTN.                              06530000
           MOVE DFHCOMMAREA          TO ACATCOMM-COMMAREA.              06540000
           PERFORM 0770-SET-TRANS-SEC-RTN.                              06550000
           INITIALIZE TWA-ACAT-AREA.                                    06560000
      **                                                                06570000
      **  XCTL FROM "PENDING TRANSFER INQ" ************                 06580000
           IF ACAT-CALLING-PROG-NAME = 'ACAT21PT'  AND                  06590000
              ACAT-PROGRAM-NAME = 'ACAT21PT'       AND                  06600000
              ACAT-CONTROL-NBR > SPACE             AND                  06610000
              ACAT-BR-AC > SPACE                                        06620000
                 PERFORM 0180-CAME-FROM-PENDING-SCREEN                  06630000
           END-IF.                                                      06640000
                                                                        06650000
           IF EIBAID = DFHPF10    AND                                   06660000
              ACAT-CALLING-PROG-NAME = 'ACAT90CM'                       06670000
              PERFORM 0240-RETURN-FROM-ACAT90CM                         06680000
           ELSE                                                         06690000
           IF EIBAID = DFHPF10    AND                                   06700000
              ACAT-CALLING-PROG-NAME = 'ACAT0FCP'                       06710000
              PERFORM 0260-RETURN-FROM-ACAT0FCP                         06720000
           ELSE                                                         06730000
              IF ACAT-PROGRAM-NAME = 'ACAT04RS'                         06740000
                  PERFORM 0230-CONTINUE-PROCESS                         06750000
              ELSE                                                      06760000
                 IF ACAT-PROGRAM-NAME = 'RATT01  '                      06770000
                     MOVE EIBTRMID TO TERM-ID                           06780000
                     MOVE 'ACA4' TO TRAN-ID                             06790000
                     PERFORM 0610-READ-TSQ                              06800000
                     MOVE TWA-ACAT04IO-AREA TO ACAT04IO-AREA            06810000
                     PERFORM 0810-MAP-INPUT-AREA  THRU 0810-EXIT        06820000
                     PERFORM 0800-SEND-MAP-RETURN                       06830000
                 ELSE                                                   06840000
                     PERFORM 0200-FIRST-TIME-THRU                       06850000
                 END-IF                                                 06860000
              END-IF                                                    06870000
           END-IF.                                                      06880000
                                                                        06890000
      /                                                                 06900000
       0150-GET-DATE-TIME-RTN.                                          06910000
           EXEC  CICS ASKTIME                                           06920000
                 ABSTIME(WSABSTIME)                                     06930000
           END-EXEC.                                                    06940000
           EXEC  CICS FORMATTIME                                        06950000
                 ABSTIME(WSABSTIME)                                     06960000
                 MMDDYY(WSMMDDYY)                                       06970000
                 DATESEP(WSDATESEP)                                     06980000
                 TIME(WSTIME)                                           06990000
                 TIMESEP(WSTIMESEP)                                     07000000
           END-EXEC.                                                    07010000
LRM005     MOVE WS-TIME-HH TO WS-TIME-HHMM(1 : 2).                      07011000
LRM005     MOVE WS-TIME-MM TO WS-TIME-HHMM(3 : 2).                      07012000
LRM010     EXEC CICS READ DATASET('TABLFLE ' )                                  
LRM010                INTO   (TABL-RECORD)                                      
LRM010                RIDFLD (TABL-KEY)                                         
LRM010                RESP   (WS-CICS-RESP)                                     
LRM010     END-EXEC                                                             
LRM010                                                                          
LRM010     IF WS-CICS-RESP = DFHRESP(NORMAL)                                    
LRM010     AND TABL-HHMM > WS-CYCLE5-HHMM                                       
LRM010         MOVE TABL-HHMM TO WS-CYCLE5-HHMM                                 
LRM010     END-IF.                                                              
      /                                                                 07020000
      *----------------------------------------------------------------*07030000
      *  CONTROL WAS PASSED FROM ACAT21PT TO INQUIRE/UPDATE FUL TRNFR. *07040000
      *   NOTE: WHEN THE PROGRAM CONTROL IS PASSED FROM ACAT21PT,      *07050000
      *         PROTECT AND DISABLE ALL SEARCH ENGINE FIELDS.          *07060000
      *----------------------------------------------------------------*07070000
       0180-CAME-FROM-PENDING-SCREEN.                                   07080000
           MOVE EIBTRMID   TO TERM-ID.                                  07090000
           MOVE 'ACA4'     TO TRAN-ID.                                  07100000
           PERFORM 0600-DELETE-TSQ.                                     07110000
           MOVE ATT-ASKIP                                               07120000
             TO MMBRA MMACA MMRRA MMTFRA MMRDA MMBKRA MMSTATA MMSDA.    07130000
           INITIALIZE TWA-ACAT04IO-AREA ACAT04IO-AREA.                  07140000
           SET FIRST-TIME               TO TRUE.                        07150000
           SET TWA-ACAT04IO-FIRST-TIME  TO TRUE.                        07160000
           SET TWA-CAME-FROM-PENDING    TO TRUE.                        07170000
           SET ACAT04IO-SRCH-VTRNFR     TO TRUE.                        07180000
           SET ACAT04IO-SRCH-VTRNFR-PND TO TRUE.                        07190000
           MOVE ACAT-CONTROL-NBR  TO ACAT04IO-SV-ACAT-CNTL-NBR.         07200000
           MOVE TWA-CLIENT-NO-9   TO ACAT04IO-SV-CLIENT-NBR.            07210000
           PERFORM 0500-CALL-ACAT04DA.                                  07220000
           IF ACAT04IO-VTRNFR-FOUND                                     07230000
              SET ACAT04IO-SRCH-VASSET-FWD TO TRUE                      07240000
              PERFORM 0510-RETRIEVE-DETAIL                              07250000
           ELSE                                                         07260000
           IF ACAT04IO-DB2-ERROR                                        07270000
              MOVE 'SELECT'          TO WS-DB2-ERROR-FUNCTION           07280000
              MOVE ACAT04IO-SQLCAID  TO WS-DB2-ERROR-TABLE              07290000
              MOVE ACAT04IO-SQLCODE  TO WS-DB2-ERROR-ID                 07300000
              MOVE WS-DB2-ERROR-MSG  TO TWA-RETURN-MSG                  07310000
              PERFORM 0830-ERROR-RTN.                                   07320000
                                                                        07330000
           IF ACAT04IO-RETURN-MSG > SPACES                              07340000
              MOVE ACAT04IO-RETURN-MSG TO SYSTEM-MSG                    07350000
           END-IF.                                                      07360000
           MOVE ACAT04IO-AREA TO  TWA-ACAT04IO-AREA.                    07370000
           PERFORM 0405-MOVE-SV-KEYS.                                   07380000
           MOVE SPACES TO M4ACCPTO M4ACCELO M4REJO M4REJCO.             07390000
           PERFORM 0810-MAP-INPUT-AREA THRU 0810-EXIT.                  07400000
           PERFORM 0620-WRITE-TSQ.                                      07410000
           PERFORM 0800-SEND-MAP-RETURN.                                07420000
      /                                                                 07430000
       0200-FIRST-TIME-THRU.                                            07440000
      ****===> SEARCH BAR SHOULD BE CHECKED ?????                       07450000
           MOVE EIBTRMID      TO TERM-ID.                               07460000
           MOVE 'ACA4'        TO TRAN-ID.                               07470000
           PERFORM 0600-DELETE-TSQ.                                     07480000
           SET FIRST-TIME  TO TRUE.                                     07490000
           SET ACAT04IO-FIRST-TIME  TO TRUE.                            07500000
           INITIALIZE TWA-SV-TRNFR-KEY.                                 07510000
      ***                                                               07520000
      **------------- GET TRAILER INPUT FROM ACAT01CP -----------------*07530000
      ***                                                               07540000
           MOVE TWA-CLIENT-NO-9      TO TWA-SV-CLIENT-NBR.              07550000
           IF ACAT-INP-BRANCH > SPACES                                  07560000
              MOVE ACAT-INP-BRANCH   TO TWA-MBR TWA-SV-BRANCH-CD MMBRO  07570000
           END-IF.                                                      07580000
           IF ACAT-INP-ACCOUNT > SPACES                                 07590000
              MOVE ACAT-INP-ACCOUNT  TO TWA-MAC TWA-SV-ACCT-CD MMACO    07600000
           END-IF.                                                      07610000
           IF ACAT-INP-RR > SPACES                                      07620000
              MOVE ACAT-INP-RR       TO TWA-MRR TWA-SV-RR-CD MMRDO      07630000
           END-IF.                                                      07640000
           IF ACAT-INP-CONTRA-BKR > SPACES                              07650000
              MOVE ACAT-INP-CONTRA-BKR TO TWA-MCBRKR TWA-SV-BRKR MMBKRO 07660000
           END-IF.                                                      07670000
           IF ACAT-INP-TFR-TYP > SPACES                                 07680000
              MOVE ACAT-INP-TFR-TYP  TO  TWA-MTFR TWA-SV-TFR MMTFRO     07690000
           END-IF.                                                      07700000
           IF ACAT-INP-RCV-DEL > SPACES                                 07710000
              MOVE ACAT-INP-RCV-DEL  TO  TWA-MRD TWA-SV-RD MMRDO        07720000
           END-IF.                                                      07730000
           IF ACAT-INP-STTL-DT > SPACES                                 07740000
              MOVE ACAT-INP-STTL-DT  TO  TWA-MSD TWA-SV-SD MMSDO        07750000
           END-IF.                                                      07760000
           IF ACAT-INP-STATUS > SPACES                                  07770000
              MOVE ACAT-INP-STATUS   TO  TWA-MSTAT TWA-SV-STCD MMSTATO  07780000
              EVALUATE TWA-MSTAT                                        07790000
                 WHEN 'REQ'     MOVE  '100' TO TWA-SV-STCD              07800000
                 WHEN 'RQA'     MOVE  '110' TO TWA-SV-STCD              07810000
                 WHEN 'RQP'     MOVE  '130' TO TWA-SV-STCD              07820000
                 WHEN 'RQR'     MOVE  '140' TO TWA-SV-STCD              07830000
                 WHEN 'REV'     MOVE  '200' TO TWA-SV-STCD              07840000
                 WHEN 'RVA'     MOVE  '210' TO TWA-SV-STCD              07850000
                 WHEN 'RVE'     MOVE  '220' TO TWA-SV-STCD              07860000
                 WHEN 'RVX'     MOVE  '230' TO TWA-SV-STCD              07870000
                 WHEN 'STP'     MOVE  '300' TO TWA-SV-STCD              07880000
                 WHEN 'STC'     MOVE  '310' TO TWA-SV-STCD              07890000
                 WHEN 'CLP'     MOVE  '400' TO TWA-SV-STCD              07900000
                 WHEN 'PUR'     MOVE  '500' TO TWA-SV-STCD              07910000
                 WHEN 'MPP'     MOVE  '510' TO TWA-SV-STCD              07920000
                 WHEN 'REJ'     MOVE  '600' TO TWA-SV-STCD              07930000
           END-IF.                                                      07940000
                                                                        07950000
           MOVE TWA-TRLM-INPUT    TO TWA-PREV-TRLM-INPUT.               07960000
           MOVE LOW-VALUES        TO ACAT04IO-SAVE-KEYS.                07970000
           MOVE TWA-SV-TRNFR-KEY  TO ACAT04IO-SAVE-KEYS.                07980000
           MOVE TWA-TRLM-INPUT    TO ACAT04IO-TRLM-INPUT.               07990000
           IF ACAT04IO-TRLM-INPUT > SPACES                              08000000
              MOVE LOW-VALUES TO ACAT04IO-INPUT                         08010000
           END-IF.                                                      08020000
                                                                        08030000
SECR       IF  ACAT-SUPER-SIGN-ON-UPDATE  OR                            08040000
SECR           ACAT-SUPER-SIGN-ON-BROWSE                                08050000
SECR           PERFORM 0400-DISPLAY-ACAT04M THRU 0400-EXIT              08060000
SECR       ELSE                                                         08070000
SECR           PERFORM 0760-BR-AE-SECURITY                              08080000
SECR           IF SRCH-SIGNON-SECR-CHECK-PASS                           08090000
SECR               PERFORM 0400-DISPLAY-ACAT04M THRU 0400-EXIT          08100000
SECR           ELSE                                                     08110000
SECR              MOVE 'USER IS NOT AUTHORIZED TO REVIEW THIS ACCOUNT'  08120000
SECR                   TO SYSTEM-MSG                                    08130000
SECR              SET CURSOR-ON-MBR           TO TRUE                   08140000
SECR              MOVE ATT-UNPROT-BRT         TO MMBRA                  08150000
SECR              PERFORM  0800-SEND-MAP-RETURN                         08160000
SECR           END-IF                                                   08170000
SECR       END-IF.                                                      08180000
           MOVE SPACE TO FIRST-TIME-FLAG, ACAT04IO-FIRST-TIME-SW.       08190000
      /                                                                 08200000
       0230-CONTINUE-PROCESS.                                           08210000
                                                                        08220000
           PERFORM 0250-RECEIVE-MAP-RTN.                                08230000
           EVALUATE TRUE                                                08240000
                WHEN EIBAID = DFHENTER                                  08250000
                     PERFORM 0300-ENTER-KEY-RTN                         08260000
                WHEN EIBAID = DFHPF1                                    08270000
                     PERFORM 0310-VIEW-COMMENTS                         08280000
                WHEN EIBAID = DFHPF3                                    08290000
                     PERFORM 0320-PF3-TO-MARGIN                         08300000
                WHEN EIBAID = DFHPF6                                    08310000
                     PERFORM 0330-PF6-TO-EXCEPTION                      08320000
                WHEN EIBAID = DFHPA1                                    08330000
                     PERFORM 0340-PAGE-FORWARD-PA1                      08340000
                WHEN EIBAID = DFHPA2                                    08350000
                     PERFORM 0350-PAGE-BACKWARD-PA2                     08360000
                WHEN EIBAID = DFHPF7                                    08370000
                     PERFORM 0360-PREV-TFR-PF7                          08380000
                WHEN EIBAID = DFHPF8                                    08390000
                     PERFORM 0370-NEXT-TFR-PF8                          08400000
                WHEN EIBAID = DFHPF9                                    08410000
                     PERFORM 0390-VIEW-FUND-REG                         08420000
                WHEN EIBAID = DFHPF10 OR DFHPF12                        08430000
                     PERFORM 0900-RETURN-TO-CICS                        08440000
                WHEN EIBAID = DFHPF11 OR DFHCLEAR                       08450000
                     PERFORM 0910-RETURN-CONTROL-RTN                    08460000
                WHEN OTHER                                              08470000
                     MOVE EIBTRMID      TO TERM-ID                      08480000
                     MOVE 'ACA4'        TO TRAN-ID                      08490000
                     PERFORM 0610-READ-TSQ                              08500000
                     SET CURSOR-ON-M4NEXT  TO TRUE                      08510000
                     MOVE 'ERROR FUNCTION KEY' TO TWA-RETURN-MSG        08520000
                     PERFORM 0830-ERROR-RTN                             08530000
           END-EVALUATE.                                                08540000
                                                                        08550000
      /                                                                 08560000
       0240-RETURN-FROM-ACAT90CM.                                       08570000
                                                                        08580000
           MOVE EIBTRMID         TO TERM-ID.                            08590000
           MOVE 'ACA4'           TO TRAN-ID.                            08600000
           PERFORM 0610-READ-TSQ.                                       08610000
           MOVE TWA-ACAT04IO-AREA TO ACAT04IO-AREA.                     08620000
           PERFORM 0550-READ-ACAT90CM-TS-RTN.                           08630000
                                                                        08640000
           IF TWA-SCREEN-IND     = 'A' AND                              08650000
              TWA-XFR-REJC-YES         AND                              08660000
              ACAT90CM-TS-UPDATE                                        08670000
              SET INPUT-REJC-RC TO TRUE                                 08680000
              MOVE ACAT90CM-TS-MCCMNT-X120 TO TWA-VINITRNF-CMNT         08690000
              PERFORM 0450-PROCESS-INPUT                                08700000
           ELSE                                                         08710000
              MOVE LOW-VALUE     TO ACAT04MO                            08720000
              MOVE SPACES  TO M4ACCPTO, M4ACCELO, M4REJO, M4REJCO       08730000
              PERFORM 0810-MAP-INPUT-AREA THRU 0810-EXIT                08740000
              PERFORM 0800-SEND-MAP-RETURN                              08750000
           END-IF.                                                      08760000
      /                                                                 08770000
       0250-RECEIVE-MAP-RTN.                                            08780000
           MOVE LOW-VALUE  TO ACAT04MI, ACAT04MO.                       08790000
           MOVE +1000   TO  ACAT-RECEIVE-MAP-LENGTH.                    08800000
      ***  HEADER MAP PORTION                                           08810000
           EXEC CICS RECEIVE MAP('HDRMAP')                              08820000
                     MAPSET('ACAT00M')                                  08830000
                     FROM(ACAT-RECEIVE-MAP)                             08840000
                     INTO(HDRMAPI)                                      08850000
           END-EXEC                                                     08860000
                                                                        08870000
      ***  MAP BODY PORTION                                             08880000
           EXEC CICS RECEIVE MAP('ACAT04M')                             08890000
                             MAPSET('ACAT04M')                          08900000
                             FROM(ACAT-RECEIVE-MAP)                     08910000
                             LENGTH(ACAT-RECEIVE-MAP-LENGTH)            08920000
                             INTO(ACAT04MI)                             08930000
           END-EXEC.                                                    08940000
                                                                        08950000
      ***  TRAILER MAP PORTION                                          08960000
           EXEC CICS RECEIVE MAP('TRLMAP')                              08970000
                     MAPSET('ACAT00M')                                  08980000
                     FROM(ACAT-RECEIVE-MAP)                             08990000
                     INTO(TRLMAPI)                                      09000000
           END-EXEC.                                                    09010000
      /                                                                 09020000
       0260-RETURN-FROM-ACAT0FCP.                                       09030000
                                                                        09040000
           MOVE EIBTRMID         TO TERM-ID.                            09050000
           MOVE 'ACA4'           TO TRAN-ID.                            09060000
           PERFORM 0610-READ-TSQ.                                       09070000
           MOVE TWA-ACAT04IO-AREA TO ACAT04IO-AREA.                     09080000
                                                                        09090000
           MOVE LOW-VALUE     TO ACAT04MO.                              09100000
           MOVE SPACES TO M4ACCPTO, M4ACCELO, M4REJO, M4REJCO.          09110000
           PERFORM 0810-MAP-INPUT-AREA  THRU  0810-EXIT.                09120000
           PERFORM 0800-SEND-MAP-RETURN.                                09130000
      /                                                                 09140000
       0290-CLEAR-SCREEN.                                               09150000
           MOVE SPACE TO M4BRO                                          09160000
                         M4ACO                                          09170000
                         M4RRO                                          09180000
                         M4NAMEO                                        09190000
                         M4CSTPO                                        09200000
                         M4CBRBRO                                       09210000
                         M4BAL01I                                       09220000
                         M4NAME2O                                       09230000
                         M4CACCTO                                       09240000
                         M4BAL02I                                       09250000
                         M4BAL05I                                       09260000
                         M4SMAI                                         09270000
                         M4SSN1O                                        09280000
                         M4CNBRO                                        09290000
                         M4SSN2O                                        09300000
06/04                    M4ALRTO                                        09310000
                         M4TFRTPO                                       09320000
                         M4SDO                                          09330000
                         M4SECRO                                        09340000
                         M4STYPEO                                       09350000
                         M4WIO                                          09360000
                         M4SLOCO                                        09370000
DJ0002                   MCDO                                           09380000
                         M4QTYI                                         09390000
                         M4DESCO                                        09400000
                         M4AMTO                                         09410000
                         M4DESC2O                                       09420000
                         M4DESC3O                                       09430000
06/04                    M4RSMSGO                                       09440000
                         M4ACCPTO                                       09450000
                         M4ACCELO                                       09460000
                         M4REJO                                         09470000
                         M4REJCO.                                       09480000
      /                                                                 09490000
       0300-ENTER-KEY-RTN.                                              09500000
                                                                        09510000
           MOVE SPACE TO WS-INPUT-VALIDATE-SW.                          09520000
           MOVE EIBTRMID      TO TERM-ID.                               09530000
           MOVE 'ACA4'        TO TRAN-ID.                               09540000
           PERFORM 0610-READ-TSQ.                                       09550000
                                                                        09560000
           PERFORM 0410-EDIT-INPUT-FIELDS.                              09570000
                                                                        09580000
           IF TWA-CAME-FROM-PENDING                                     09590000
              PERFORM 0810-MAP-INPUT-AREA  THRU 0810-EXIT               09600000
              MOVE ATT-ASKIP TO MMBRA  MMACA   MMRRA    MMTFRA          09610000
                                MMRDA  MMBKRA  MMSTATA  MMSDA           09620000
              MOVE EIBTRMID   TO TERM-ID                                09630000
              MOVE 'ACA4'     TO TRAN-ID                                09640000
              PERFORM 0600-DELETE-TSQ                                   09650000
              PERFORM 0620-WRITE-TSQ                                    09660000
              PERFORM 0800-SEND-MAP-RETURN                              09670000
           END-IF.                                                      09680000
                                                                        09690000
           PERFORM 0415-EDIT-ACAT00M-RTN.                               09700000
           IF ACAT-NO-SRCH-ENTRY                                        09710000
              CONTINUE                                                  09720000
           ELSE                                                         09730000
              PERFORM 0290-CLEAR-SCREEN                                 09740000
              MOVE LOW-VALUES     TO ACAT04IO-SAVE-KEYS                 09750000
              MOVE TWA-MBR        TO ACAT04IO-SV-BRANCH-CD              09760000
              MOVE TWA-MAC        TO ACAT04IO-SV-ACCT-CD                09770000
              MOVE TWA-MRR        TO ACAT04IO-SV-RR-CD                  09780000
              MOVE TWA-MCBRKR     TO ACAT04IO-SV-BRKR                   09790000
              MOVE TWA-MTFR       TO ACAT04IO-SV-TFR                    09800000
              MOVE TWA-MSTAT      TO ACAT04IO-SV-STCD                   09810000
              MOVE TWA-TRLM-INPUT TO ACAT04IO-TRLM-INPUT                09820000
              PERFORM 0400-DISPLAY-ACAT04M THRU 0400-EXIT               09830000
                                                                        09840000
           IF NO-INPUT                                                  09850000
              PERFORM 0810-MAP-INPUT-AREA  THRU 0810-EXIT               09860000
              PERFORM 0620-WRITE-TSQ                                    09870000
              SET CURSOR-ON-M4NEXT TO TRUE                              09880000
              PERFORM 0800-SEND-MAP-RETURN                              09890000
           ELSE                                                         09900000
              MOVE TWA-SV-TRNFR-KEY  TO ACAT04IO-SAVE-KEYS              09910000
              MOVE SPACES            TO ACAT04IO-RETURN-MSG             09920000
              MOVE LOW-VALUES        TO ACAT04IO-SV-ACAT-CNTL-NBR       09930000
              MOVE TWA-TRLM-INPUT    TO ACAT04IO-TRLM-INPUT             09940000
              PERFORM 0400-DISPLAY-ACAT04M THRU 0400-EXIT               09950000
           END-IF.                                                      09960000
                                                                        09970000
      /                                                                 09980000
       0310-VIEW-COMMENTS.                                              09990000
      *===> SEND POP UP SCREEN                                          10000000
           MOVE EIBTRMID         TO TERM-ID.                            10010000
           MOVE 'ACA4'           TO TRAN-ID.                            10020000
           PERFORM 0610-READ-TSQ.                                       10030000
           PERFORM 0315-CHECK-EIBCPOSN.                                 10040000
           PERFORM 0530-PREP-FOR-POPUP.                                 10050000
      /                                                                 10060000
       0315-CHECK-EIBCPOSN.                                             10070000
                                                                        10080000
           IF EIBAID = DFHPF1                                           10090000
              IF (EIBCPOSN >= 455  AND <= 480 )                         10100000
                 SET VIEW-BAL1-CMNT            TO TRUE                  10110000
              ELSE                                                      10120000
                 IF (EIBCPOSN >= 535 AND <= 560 )                       10130000
                    SET VIEW-BAL2-CMNT         TO TRUE                  10140000
                 ELSE                                                   10150000
                    IF (EIBCPOSN >= 615 AND <= 640 )                    10160000
                       SET VIEW-BAL5-CMNT      TO TRUE                  10170000
                    ELSE                                                10180000
                       IF (EIBCPOSN >= 1121 AND <= 1600)                10190000
                           SET VIEW-SECR-CMNT  TO TRUE                  10200000
                       ELSE                                             10210000
                          IF (EIBCPOSN >= 1 AND < 1121)                 10220000
                             SET VIEW-ACCT-CMNT TO TRUE                 10230000
                          ELSE                                          10240000
                             IF EIBCPOSN = 1756                         10250000
                                SET VIEW-REJC-CMNT TO TRUE              10260000
                             ELSE                                       10270000
                                SET CURSOR-ON-M4NEXT TO TRUE            10280000
                                MOVE 'TAB TO THE FIELD TO VIEW COMMENTS'10290000
                                TO SYSTEM-MSG                           10300000
                                PERFORM 0830-ERROR-RTN                  10310000
                             END-IF                                     10320000
                          END-IF                                        10330000
                       END-IF                                           10340000
                    END-IF                                              10350000
                 END-IF                                                 10360000
              END-IF                                                    10370000
           END-IF.                                                      10380000
      /                                                                 10390000
      *                                                                 10400000
       0320-PF3-TO-MARGIN.                                              10410000
      *===> JUMP TO ACAT01CP & MARGIN                                   10420000
           MOVE EIBTRMID      TO TERM-ID.                               10430000
           MOVE 'ACA4'        TO TRAN-ID.                               10440000
           PERFORM 0610-READ-TSQ.                                       10450000
           PERFORM 0900-RETURN-TO-CICS.                                 10460000
                                                                        10470000
       0330-PF6-TO-EXCEPTION.                                           10480000
      *===> SEND POP UP SCREEN                                          10490000
           PERFORM 0530-PREP-FOR-POPUP.                                 10500000
                                                                        10510000
       0340-PAGE-FORWARD-PA1.                                           10520000
      *===> SCROLL DOWN ASSET INFO WITHIN THE ACCOUNT                   10530000
           MOVE EIBTRMID      TO TERM-ID.                               10540000
           MOVE 'ACA4'        TO TRAN-ID.                               10550000
           PERFORM 0610-READ-TSQ.                                       10560000
           SET CURSOR-ON-M4NEXT TO TRUE.                                10570000
           MOVE SPACES            TO TWA-RETURN-MSG.                    10580000
           MOVE TWA-ACAT04IO-AREA TO ACAT04IO-AREA.                     10590000
           MOVE SPACES            TO ACAT04IO-RETURN-MSG.               10600000
           SET ACAT04IO-SRCH-VASSET      TO TRUE.                       10610000
           SET ACAT04IO-SRCH-VASSET-FWD TO TRUE.                        10620000
           PERFORM 0520-CALL-ACAT04DC.                                  10630000
01/07      IF ACAT04IO-RETURN-MSG > SPACES                              10640000
  |           MOVE ACAT04IO-RETURN-MSG TO SYSTEM-MSG                    10650000
01/07      END-IF.                                                      10660000
           MOVE ACAT04IO-AREA  TO  TWA-ACAT04IO-AREA.                   10670000
           PERFORM 0405-MOVE-SV-KEYS.                                   10680000
           MOVE EIBTRMID  TO TERM-ID.                                   10690000
           MOVE 'ACA4'    TO TRAN-ID.                                   10700000
           PERFORM 0600-DELETE-TSQ.                                     10710000
           PERFORM 0820-MAP-INPUT-ASSET.                                10720000
           PERFORM 0620-WRITE-TSQ                                       10730000
           SET DATA-ONLY  TO TRUE.                                      10740000
           PERFORM 0800-SEND-MAP-RETURN.                                10750000
      /                                                                 10760000
       0350-PAGE-BACKWARD-PA2.                                          10770000
      *===> SCROLL UP ASSET INFO WITHIN THE ACCOUNT                     10780000
           MOVE EIBTRMID      TO TERM-ID.                               10790000
           MOVE 'ACA4'        TO TRAN-ID.                               10800000
           PERFORM 0610-READ-TSQ.                                       10810000
           SET CURSOR-ON-M4NEXT TO TRUE.                                10820000
           MOVE SPACES            TO TWA-RETURN-MSG.                    10830000
           MOVE TWA-ACAT04IO-AREA TO ACAT04IO-AREA.                     10840000
           SET ACAT04IO-SRCH-VASSET       TO TRUE.                      10850000
           SET ACAT04IO-SRCH-VASSET-BWD TO TRUE.                        10860000
           PERFORM 0520-CALL-ACAT04DC.                                  10870000
01/07      IF ACAT04IO-RETURN-MSG > SPACES                              10880000
  |           MOVE ACAT04IO-RETURN-MSG TO SYSTEM-MSG                    10890000
01/07      END-IF.                                                      10900000
           MOVE ACAT04IO-AREA   TO  TWA-ACAT04IO-AREA.                  10910000
           PERFORM 0405-MOVE-SV-KEYS.                                   10920000
           MOVE EIBTRMID   TO TERM-ID.                                  10930000
           MOVE 'ACA4'     TO TRAN-ID.                                  10940000
           PERFORM 0600-DELETE-TSQ.                                     10950000
           PERFORM 0820-MAP-INPUT-ASSET.                                10960000
           PERFORM 0620-WRITE-TSQ                                       10970000
           SET DATA-ONLY  TO TRUE.                                      10980000
           PERFORM 0800-SEND-MAP-RETURN.                                10990000
      /                                                                 11000000
       0360-PREV-TFR-PF7.                                               11010000
      *===> SCROLL UP TO PREVIOUS TRANSFER                              11020000
           MOVE EIBTRMID      TO TERM-ID.                               11030000
           MOVE 'ACA4'        TO TRAN-ID.                               11040000
           PERFORM 0610-READ-TSQ.                                       11050000
           IF TWA-CAME-FROM-PENDING                                     11060000
              PERFORM 0600-DELETE-TSQ                                   11070000
              PERFORM 0810-MAP-INPUT-AREA THRU 0810-EXIT                11080000
              PERFORM 0620-WRITE-TSQ                                    11090000
              SET DATA-ONLY TO TRUE                                     11100000
              MOVE 'PF7 NOT AVAILABLE - PRESS PF10 TO RETURN TO PENDING 11110000
      -            'INQUIRY'                                            11120000
                TO  SYSTEM-MSG                                          11130000
              PERFORM 0800-SEND-MAP-RETURN.                             11140000
                                                                        11150000
           MOVE +0     TO TWA-SV-ASSET-SEQ-NBR.                         11160000
           MOVE SPACES   TO TWA-RETURN-MSG.                             11170000
           MOVE SPACES TO M4ACCPTO, M4ACCELO, M4REJO, M4REJCO.          11180000
           MOVE LOW-VALUES        TO ACAT04IO-TWA-INPUT.                11190000
           MOVE TWA-ACAT04IO-AREA  TO ACAT04IO-AREA.                    11200000
           MOVE TWA-TRLM-INPUT    TO ACAT04IO-TRLM-INPUT.               11210000
           SET ACAT04IO-FIRST-TIME TO TRUE.                             11220000
           MOVE 'B'   TO  ACAT04IO-SEARCH-VTRNFR.                       11230000
           MOVE 'F'   TO  ACAT04IO-SEARCH-VASSET.                       11240000
           MOVE 'RT'  TO  ACAT04IO-FUNCTION.                            11250000
           PERFORM 0500-CALL-ACAT04DA.                                  11260000
           IF ACAT04IO-VTRNFR-FOUND                                     11270000
              PERFORM 0510-RETRIEVE-DETAIL                              11280000
           ELSE                                                         11290000
              IF ACAT04IO-DB2-ERROR                                     11300000
                 MOVE 'SELECT'          TO WS-DB2-ERROR-FUNCTION        11310000
                 MOVE ACAT04IO-SQLCAID  TO WS-DB2-ERROR-TABLE           11320000
                 MOVE ACAT04IO-SQLCODE  TO WS-DB2-ERROR-ID              11330000
                 MOVE WS-DB2-ERROR-MSG  TO TWA-RETURN-MSG               11340000
                 PERFORM 0830-ERROR-RTN                                 11350000
              END-IF                                                    11360000
           END-IF.                                                      11370000
01/07      IF ACAT04IO-RETURN-MSG > SPACES                              11380000
              MOVE ACAT04IO-RETURN-MSG TO SYSTEM-MSG                    11390000
           END-IF.                                                      11400000
           MOVE ACAT04IO-AREA      TO  TWA-ACAT04IO-AREA.               11410000
           PERFORM 0405-MOVE-SV-KEYS.                                   11420000
           MOVE EIBTRMID      TO TERM-ID.                               11430000
           MOVE 'ACA4'        TO TRAN-ID.                               11440000
           PERFORM 0600-DELETE-TSQ.                                     11450000
           PERFORM 0810-MAP-INPUT-AREA THRU 0810-EXIT.                  11460000
           PERFORM 0620-WRITE-TSQ.                                      11470000
           SET DATA-ONLY TO TRUE.                                       11480000
           PERFORM 0800-SEND-MAP-RETURN.                                11490000
                                                                        11500000
      /                                                                 11510000
       0370-NEXT-TFR-PF8.                                               11520000
      *===> SCROLL DOWN TO NEXT TRANSFER                                11530000
                                                                        11540000
           MOVE EIBTRMID      TO TERM-ID.                               11550000
           MOVE 'ACA4'        TO TRAN-ID.                               11560000
           PERFORM 0610-READ-TSQ.                                       11570000
           IF TWA-CAME-FROM-PENDING                                     11580000
              PERFORM 0600-DELETE-TSQ                                   11590000
              PERFORM 0810-MAP-INPUT-AREA  THRU 0810-EXIT               11600000
              PERFORM 0620-WRITE-TSQ                                    11610000
              SET DATA-ONLY TO TRUE                                     11620000
              MOVE 'PF8 NOT AVAILABLE - PRESS PF10 TO RETURN TO PENDING 11630000
      -            'INQUIRY'                                            11640000
                TO  SYSTEM-MSG                                          11650000
              PERFORM 0800-SEND-MAP-RETURN.                             11660000
                                                                        11670000
           MOVE +0     TO  TWA-SV-ASSET-SEQ-NBR.                        11680000
           MOVE SPACES            TO TWA-RETURN-MSG.                    11690000
03/26      MOVE SPACES TO M4NEXTO, M4ACCPTO, M4ACCELO, M4REJO, M4REJCO. 11700000
           MOVE LOW-VALUES        TO ACAT04IO-TWA-INPUT.                11710000
           MOVE TWA-ACAT04IO-AREA  TO  ACAT04IO-AREA.                   11720000
           MOVE TWA-TRLM-INPUT    TO ACAT04IO-TRLM-INPUT.               11730000
           SET ACAT04IO-FIRST-TIME  TO TRUE.                            11740000
           MOVE 'F'  TO  ACAT04IO-SEARCH-VTRNFR.                        11750000
           MOVE 'F'   TO  ACAT04IO-SEARCH-VASSET.                       11760000
           MOVE 'RT'  TO  ACAT04IO-FUNCTION.                            11770000
           PERFORM 0500-CALL-ACAT04DA.                                  11780000
           IF ACAT04IO-VTRNFR-FOUND                                     11790000
              PERFORM 0510-RETRIEVE-DETAIL                              11800000
           ELSE                                                         11810000
              IF ACAT04IO-DB2-ERROR                                     11820000
                 MOVE 'SELECT'          TO WS-DB2-ERROR-FUNCTION        11830000
                 MOVE ACAT04IO-SQLCAID  TO WS-DB2-ERROR-TABLE           11840000
                 MOVE ACAT04IO-SQLCODE  TO WS-DB2-ERROR-ID              11850000
                 MOVE WS-DB2-ERROR-MSG  TO TWA-RETURN-MSG               11860000
                 PERFORM 0830-ERROR-RTN                                 11870000
              END-IF                                                    11880000
           END-IF.                                                      11890000
01/07      IF ACAT04IO-RETURN-MSG > SPACES                              11900000
              MOVE ACAT04IO-RETURN-MSG TO SYSTEM-MSG                    11910000
01/07      END-IF.                                                      11920000
           MOVE ACAT04IO-AREA      TO  TWA-ACAT04IO-AREA.               11930000
           PERFORM 0405-MOVE-SV-KEYS.                                   11940000
           MOVE SPACES  TO M4NEXTO, M4ACCPTO, M4ACCELO, M4REJO, M4REJCO.11950000
           MOVE EIBTRMID      TO TERM-ID.                               11960000
           MOVE 'ACA4'        TO TRAN-ID.                               11970000
           PERFORM 0600-DELETE-TSQ.                                     11980000
           PERFORM 0810-MAP-INPUT-AREA  THRU 0810-EXIT.                 11990000
           PERFORM 0620-WRITE-TSQ.                                      12000000
           SET DATA-ONLY TO TRUE.                                       12010000
           PERFORM 0800-SEND-MAP-RETURN.                                12020000
                                                                        12030000
      /                                                                 12040000
       0390-VIEW-FUND-REG.                                              12050000
           MOVE EIBTRMID      TO TERM-ID.                               12060000
           MOVE 'ACA4'        TO TRAN-ID.                               12070000
           PERFORM 0610-READ-TSQ.                                       12080000
           IF TWA-STTLM-LOCATION = '10'                                 12090000
             MOVE EIBTRMID TO TERM-ID                                   12100000
             MOVE 'AMFX' TO TRAN-ID                                     12110000
             INITIALIZE ACAT0F01-COMMAREA                               12120000
             PERFORM 0630-BUILD-ACAT0F01-TS-RTN                         12130000
             MOVE 'ACAT0FCP' TO CALLED-PROGRAM-NAME                     12140000
             PERFORM 0710-INVOKE-DETAIL-PROGRAM-RTN                     12150000
           ELSE                                                         12160000
               MOVE 'THIS ASSET DOES NOT HAVE FUND/REG INFO' TO         12170000
                    SYSTEM-MSG                                          12180000
               MOVE ATT-UNPROT-BRT   TO M4NEXTA                         12190000
               SET CURSOR-ON-M4NEXT TO TRUE                             12200000
               PERFORM 0830-ERROR-RTN                                   12210000
           END-IF.                                                      12220000
      /                                                                 12230000
       0400-DISPLAY-ACAT04M.                                            12240000
      ***************************************************************** 12250000
      **     THIS ROUTINE SHOULD RETRIEVE INFO FROM ACAT_TRNFR       ** 12260000
      **          ACAT_INT_TRNF  ACAT_ASSET                          ** 12270000
      ***************************************************************** 12280000
                                                                        12290000
           IF FIRST-TIME                                                12300000
              MOVE 'N' TO FIRST-TIME-FLAG                               12310000
              IF ACAT-CALLING-PROG-NAME = 'ACAT21PT'  AND               12320000
                 ACAT-PROGRAM-NAME = 'ACAT21PT'       AND               12330000
                 ACAT-CONTROL-NBR > SPACE             AND               12340000
                 ACAT-BR-AC > SPACE                   AND               12350000
                 (ACAT-INP-SEL = SPACE OR LOW-VALUE)                    12360000
                 SET ACAT04IO-SRCH-VTRNFR     TO TRUE                   12370000
                 SET ACAT04IO-SRCH-VTRNFR-PND TO TRUE                   12380000
                 MOVE ACAT-CONTROL-NBR TO ACAT04IO-SV-ACAT-CNTL-NBR     12390000
              ELSE                                                      12400000
                 INITIALIZE ACAT04IO-AREA                               12410000
                 SET ACAT04IO-FIRST-TIME      TO TRUE                   12420000
                 SET ACAT04IO-SRCH-VTRNFR     TO TRUE                   12430000
                 SET ACAT04IO-SRCH-VTRNFR-FWD TO TRUE                   12440000
              END-IF                                                    12450000
           ELSE                                                         12460000
              SET ACAT04IO-SRCH-VTRNFR TO TRUE                          12470000
              SET ACAT04IO-SRCH-VTRNFR-FWD TO TRUE                      12480000
           END-IF.                                                      12490000
                                                                        12500000
           MOVE TWA-SV-TRNFR-KEY     TO ACAT04IO-SAVE-KEYS.             12510000
           MOVE TWA-CLIENT-NO-9      TO ACAT04IO-SV-CLIENT-NBR.         12520000
TCK        MOVE TWA-TRLM-INPUT       TO ACAT04IO-TRLM-INPUT.            12530000
                                                                        12540000
       0400A-SEARCH-VTRNFR.                                             12550000
           PERFORM 0500-CALL-ACAT04DA.                                  12560000
           IF ACAT04IO-VTRNFR-FOUND                                     12570000
NEW           IF TWA-MBR > SPACES                                       12580000
                 IF ACAT04IO-BRANCH-CD > TWA-MBR                        12590000
                    MOVE ACAT04IO-AREA TO TWA-ACAT04IO-AREA             12600000
                    PERFORM 0405-MOVE-SV-KEYS                           12610000
                    MOVE EIBTRMID TO TERM-ID                            12620000
                    MOVE 'ACA4' TO TRAN-ID                              12630000
                    PERFORM 0600-DELETE-TSQ                             12640000
                    PERFORM 0620-WRITE-TSQ                              12650000
                    MOVE SPACES TO M4ACCPTO, M4ACCELO, M4REJO, M4REJCO  12660000
                    MOVE                                                12670000
TCK                 'NO FULL TRANSFER REVIEW IS FOUND UNDER THIS BRANCH'12680000
TCK                 TO SYSTEM-MSG                                       12690000
TCK                 SET CURSOR-ON-MBR        TO TRUE                    12700000
TCK                 MOVE ATT-UNPROT-BRT      TO MMBRA                   12710000
TCK                 PERFORM 0800-SEND-MAP-RETURN                        12720000
                 END-IF                                                 12730000
              END-IF                                                    12740000
03/23         IF ACAT04IO-ACAT-CONTROL-NBR = LOW-VALUE OR SPACES AND    12750000
03/23            ACAT04IO-BRANCH-CD = LOW-VALUE OR SPACES               12760000
02/23            CONTINUE                                               12770000
02/23         ELSE                                                      12780000
                 SET ACAT04IO-SRCH-VASSET-FWD TO TRUE                   12790000
                 PERFORM 0510-RETRIEVE-DETAIL                           12800000
              END-IF                                                    12810000
           ELSE                                                         12820000
              IF ACAT04IO-DB2-ERROR                                     12830000
                 MOVE 'SELECT'          TO WS-DB2-ERROR-FUNCTION        12840000
                 MOVE ACAT04IO-SQLCAID  TO WS-DB2-ERROR-TABLE           12850000
                 MOVE ACAT04IO-SQLCODE  TO WS-DB2-ERROR-ID              12860000
                 MOVE WS-DB2-ERROR-MSG  TO TWA-RETURN-MSG               12870000
                 PERFORM 0830-ERROR-RTN                                 12880000
              END-IF                                                    12890000
           END-IF.                                                      12900000
01/07      IF ACAT04IO-RETURN-MSG > SPACES                              12910000
              MOVE ACAT04IO-RETURN-MSG TO SYSTEM-MSG                    12920000
01/07      END-IF.                                                      12930000
           MOVE ACAT04IO-AREA TO  TWA-ACAT04IO-AREA.                    12940000
           PERFORM 0405-MOVE-SV-KEYS.                                   12950000
           MOVE EIBTRMID      TO TERM-ID.                               12960000
           MOVE 'ACA4'        TO TRAN-ID.                               12970000
           PERFORM 0600-DELETE-TSQ.                                     12980000
           MOVE SPACES TO M4ACCPTO, M4ACCELO, M4REJO, M4REJCO.          12990000
           PERFORM 0810-MAP-INPUT-AREA THRU 0810-EXIT.                  13000000
           PERFORM 0620-WRITE-TSQ.                                      13010000
           PERFORM 0800-SEND-MAP-RETURN.                                13020000
                                                                        13030000
       0400-EXIT. EXIT.                                                 13040000
      /                                                                 13050000
                                                                        13060000
       0405-MOVE-SV-KEYS.                                               13070000
           MOVE TWA-CLIENT-NBR       TO  TWA-SV-CLIENT-NBR.             13080000
           MOVE TWA-ACAT-CONTROL-NBR TO  TWA-SV-ACAT-CNTL-NBR.          13090000
           MOVE TWA-BRANCH-CD        TO  TWA-SV-BRANCH-CD.              13100000
           MOVE TWA-ACCT-CD          TO  TWA-SV-ACCT-CD.                13110000
           MOVE TWA-RR-CD            TO  TWA-SV-RR-CD.                  13120000
           MOVE TWA-DLVR-NBR         TO  TWA-SV-BRKR.                   13130000
           MOVE TWA-TFR-TYPE         TO  TWA-SV-TFR.                    13140000
           MOVE TWA-STCD             TO  TWA-SV-STCD.                   13150000
      /                                                                 13160000
       0410-EDIT-INPUT-FIELDS.                                          13170000
                                                                        13180000
TCK        IF M4NEXTL > +0                                              13190000
TCK           MOVE M4NEXTI TO TWA-M4NEXT                                13200000
TCK        END-IF.                                                      13210000
                                                                        13220000
DJ0002***--ONLY FOR MUTUAL FUND (MFNM,MFMM)                             13230000
ET0002***--AND ALSO FOR ANNUITY (STTL_LOC = 60 OR 65)                   13240000
DJ0002     IF (TWA-ASSET-PRC-CTGY-CD = 'MFNM' OR 'MFMM')                13250000
ET0002     OR (TWA-STTLM-LOCATION = '60' OR '65')                       13260000
DJ0002        IF MCDA = DFHBMEOF                                        13270000
DJ0002*--------IGNORE ERASE EOF. REPLACE IT WITH ORIGINAL.              13280000
DJ0002           MOVE TWA-PREV-MCD TO MCDI                              13290000
DJ0002        ELSE                                                      13300000
DJ0002          IF MCDL > 0                                             13310000
DJ0002             IF  MCDI >= ' '                                      13320000
DJ0002                 MOVE MCDI         TO TWA-MCD                     13330000
DJ0002             END-IF                                               13340000
DJ0002          END-IF                                                  13350000
DJ0002        END-IF                                                    13360000
DJ0002     END-IF.                                                      13370000
                                                                        13380000
           IF M4ACCPTL > 0                                              13390000
              IF M4ACCPTI = TWA-M4ACCPT                                 13400000
                 CONTINUE                                               13410000
              ELSE                                                      13420000
                 MOVE M4ACCPTI TO TWA-M4ACCPT                           13430000
              END-IF                                                    13440000
           END-IF.                                                      13450000
           MOVE ATT-UNPROT TO M4ACCPTA.                                 13460000
                                                                        13470000
           IF M4ACCELL > 0                                              13480000
              IF M4ACCELI = TWA-M4ACCEL                                 13490000
                 CONTINUE                                               13500000
              ELSE                                                      13510000
                 MOVE M4ACCELI TO TWA-M4ACCEL                           13520000
              END-IF                                                    13530000
           END-IF.                                                      13540000
           MOVE ATT-UNPROT TO M4ACCELA.                                 13550000
                                                                        13560000
           IF M4REJL > 0                                                13570000
              IF M4REJI = TWA-M4REJ                                     13580000
                 CONTINUE                                               13590000
              ELSE                                                      13600000
                 MOVE M4REJI TO TWA-M4REJ                               13610000
              END-IF                                                    13620000
           END-IF.                                                      13630000
           MOVE ATT-UNPROT TO M4REJA.                                   13640000
                                                                        13650000
           IF M4REJCL > 0                                               13660000
              IF M4REJCI = TWA-M4REJC                                   13670000
                 CONTINUE                                               13680000
              ELSE                                                      13690000
                 MOVE M4REJCI TO TWA-M4REJC                             13700000
              END-IF                                                    13710000
           END-IF.                                                      13720000
           MOVE ATT-UNPROT TO M4REJCA.                                  13730000
                                                                        13740000
           IF (TWA-M4ACCPT = TWA-PREV-ACCEPT)   AND                     13750000
              (TWA-M4ACCEL = TWA-PREV-ACCEL)    AND                     13760000
              (TWA-M4REJ   = TWA-PREV-REJ)      AND                     13770000
DJ0002        (TWA-MCD     = TWA-PREV-MCD)      AND                     13780000
              (TWA-M4REJC  = TWA-PREV-REJ-CMNT)                         13790000
                   SET NO-INPUT     TO  TRUE                            13800000
           ELSE                                                         13810000
               MOVE TWA-M4ACCPT  TO TWA-PREV-ACCEPT                     13820000
               MOVE TWA-M4ACCEL  TO TWA-PREV-ACCEL                      13830000
               MOVE TWA-M4REJ    TO TWA-PREV-REJ                        13840000
               MOVE TWA-M4REJC   TO TWA-PREV-REJ-CMNT                   13850000
           END-IF.                                                      13860000
                                                                        13870000
TCK        MOVE EIBTRMID      TO TERM-ID.                               13880000
TCK        MOVE 'ACA4'        TO TRAN-ID.                               13890000
TCK        PERFORM 0600-DELETE-TSQ.                                     13900000
TCK        PERFORM 0620-WRITE-TSQ.                                      13910000
TCK        PERFORM 0610-READ-TSQ.                                       13920000
                                                                        13930000
TCK        IF TWA-M4NEXT GREATER SPACES AND NOT = 'C'                   13940000
TCK           PERFORM 0700-PROCESS-JUMP-RTN                             13950000
           END-IF.                                                      13960000
                                                                        13970000
           IF TWA-INIT-TRANS-TYPE-CD = 'R'                              13980000
              PERFORM  0430-VALIDATE-R-FIELDS                           13990000
           ELSE                                                         14000000
              IF TWA-INIT-TRANS-TYPE-CD = 'X'                           14010000
                 PERFORM 0425-VALIDATE-X-FIELDS                         14020000
              ELSE                                                      14030000
                 PERFORM 0420-VALIDATE-X-R-FIELDS                       14040000
              END-IF                                                    14050000
           END-IF.                                                      14060000
                                                                        14070000
      *SSR# R38488 MUTUAL FUND RECEIVER ADJUSTMENTS                     14080000
DJ0002     PERFORM 0440-VALIDATE-MCD THRU 0440-EXIT.                    14090000
                                                                        14100000
       0410-EXIT.                                                       14110000
           EXIT.                                                        14120000
      /                                                                 14130000
      ***************************************************************** 14140000
       0415-EDIT-ACAT00M-RTN.                                           14150000
      *----------------------------------------------------------------*14160000
      *             EDIT  TRAILER  MAP   (SEARCH BAR ENTRIES)          *14170000
      *----------------------------------------------------------------*14180000
                                                                        14190000
           MOVE LOW-VALUES  TO ACAT04IO-DA ACAT04IO-SEARCH-VTRNFR.      14200000
                                                                        14210000
           MOVE ZERO    TO ACAT04IO-BAL01, ACAT04IO-BAL02,              14220000
                           ACAT04IO-BAL05, ACAT04IO-SMA.                14230000
                                                                        14240000
           MOVE TWA-CLIENT-NO-9      TO TWA-SV-CLIENT-NBR.              14250000
                                                                        14260000
           IF MMBRL > 0                                                 14270000
              IF MMBRI = TWA-MBR                                        14280000
                 CONTINUE                                               14290000
              ELSE                                                      14300000
                 IF MMBRI > SPACES                                      14310000
                    MOVE MMBRI TO TWA-MBR TWA-SV-BRANCH-CD              14320000
                 ELSE                                                   14330000
                    MOVE SPACE TO TWA-MBR TWA-SV-BRANCH-CD              14340000
                 END-IF                                                 14350000
              END-IF                                                    14360000
           ELSE                                                         14370000
              IF MMBRA = ERASE-KEY                                      14380000
                 MOVE SPACE  TO TWA-MBR TWA-SV-BRANCH-CD                14390000
              END-IF                                                    14400000
           END-IF.                                                      14410000
           MOVE ATT-UNPROT TO MMBRA.                                    14420000
                                                                        14430000
           IF MMACL > 0                                                 14440000
              IF MMACI = TWA-MAC                                        14450000
                 CONTINUE                                               14460000
              ELSE                                                      14470000
TCK              IF MMACI > SPACES                                      14480000
TCK                 MOVE MMACI TO TWA-MAC TWA-SV-ACCT-CD                14490000
TCK              ELSE                                                   14500000
TCK                 MOVE SPACES TO TWA-MAC TWA-SV-ACCT-CD               14510000
TCK              END-IF                                                 14520000
              END-IF                                                    14530000
           ELSE                                                         14540000
              IF MMACA = ERASE-KEY                                      14550000
                 MOVE SPACE  TO TWA-MAC TWA-SV-ACCT-CD                  14560000
TCK           ELSE                                                      14570000
TCK              IF MMBRL > 0                                           14580000
TCK                 MOVE LOW-VALUE TO TWA-MAC TWA-SV-ACCT-CD            14590000
TCK              END-IF                                                 14600000
TCK           END-IF.                                                   14610000
           MOVE ATT-UNPROT TO MMACA.                                    14620000
                                                                        14630000
           IF MMRRL > 0                                                 14640000
              IF MMRRI = TWA-MRR                                        14650000
                 CONTINUE                                               14660000
              ELSE                                                      14670000
TCK              IF MMRRI > SPACES                                      14680000
TCK                 MOVE MMRRI TO TWA-MRR TWA-SV-RR-CD                  14690000
TCK              ELSE                                                   14700000
TCK                 MOVE SPACES TO TWA-MRR TWA-SV-RR-CD                 14710000
TCK              END-IF                                                 14720000
              END-IF                                                    14730000
           ELSE                                                         14740000
              IF MMRRA = ERASE-KEY                                      14750000
                 MOVE SPACE  TO TWA-MRR TWA-SV-RR-CD                    14760000
TCK           ELSE                                                      14770000
TCK              IF MMBRL > 0                                           14780000
TCK                 MOVE LOW-VALUE TO TWA-MRR TWA-SV-RR-CD              14790000
TCK              END-IF                                                 14800000
TCK           END-IF.                                                   14810000
           MOVE ATT-UNPROT TO MMRRA.                                    14820000
                                                                        14830000
           IF MMTFRL > 0                                                14840000
              IF MMTFRI = TWA-MTFR                                      14850000
                 CONTINUE                                               14860000
              ELSE                                                      14870000
                 MOVE MMTFRI TO TWA-MTFR TWA-TFR-TYPE                   14880000
              END-IF                                                    14890000
           ELSE                                                         14900000
              IF MMTFRA = ERASE-KEY                                     14910000
                 MOVE SPACE  TO TWA-MTFR TWA-TFR-TYPE.                  14920000
           MOVE ATT-UNPROT TO MMTFRA.                                   14930000
                                                                        14940000
           IF MMBKRL > 0                                                14950000
              IF MMBKRI = TWA-MCBRKR                                    14960000
                 CONTINUE                                               14970000
              ELSE                                                      14980000
                 MOVE MMBKRI TO TWA-MCBRKR TWA-SV-BRKR                  14990000
              END-IF                                                    15000000
           ELSE                                                         15010000
              IF MMBKRA = ERASE-KEY                                     15020000
                 MOVE SPACE  TO TWA-MCBRKR TWA-SV-BRKR.                 15030000
           MOVE ATT-UNPROT TO MMBKRA.                                   15040000
                                                                        15050000
           IF MMRDL > 0                                                 15060000
              IF MMRDI = TWA-MRD                                        15070000
                 CONTINUE                                               15080000
              ELSE                                                      15090000
                 MOVE MMRDI  TO TWA-MRD TWA-SV-RD                       15100000
              END-IF                                                    15110000
           ELSE                                                         15120000
              IF MMRDA = ERASE-KEY                                      15130000
                 MOVE SPACE  TO TWA-MRD TWA-SV-RD.                      15140000
           MOVE ATT-UNPROT TO MMRDA.                                    15150000
                                                                        15160000
           IF MMSTATL > 0                                               15170000
              IF MMSTATI = TWA-MSTAT                                    15180000
                 CONTINUE                                               15190000
              ELSE                                                      15200000
                 MOVE MMSTATI  TO TWA-MSTAT                             15210000
              END-IF                                                    15220000
           ELSE                                                         15230000
              IF MMSTATA = ERASE-KEY                                    15240000
                 MOVE SPACE  TO TWA-MSTAT                               15250000
           MOVE ATT-UNPROT TO MMSTATA.                                  15260000
                                                                        15270000
           EVALUATE TWA-MSTAT                                           15280000
              WHEN 'REQ'  MOVE  '100' TO TWA-SV-STCD                    15290000
              WHEN 'RQA'  MOVE  '110' TO TWA-SV-STCD                    15300000
              WHEN 'RQP'  MOVE  '130' TO TWA-SV-STCD                    15310000
              WHEN 'RQR'  MOVE  '140' TO TWA-SV-STCD                    15320000
              WHEN 'REV'  MOVE  '200' TO TWA-SV-STCD                    15330000
              WHEN 'RVA'  MOVE  '210' TO TWA-SV-STCD                    15340000
              WHEN 'RVE'  MOVE  '220' TO TWA-SV-STCD                    15350000
              WHEN 'RVX'  MOVE  '230' TO TWA-SV-STCD                    15360000
              WHEN 'STP'  MOVE  '300' TO TWA-SV-STCD                    15370000
              WHEN 'STC'  MOVE  '310' TO TWA-SV-STCD                    15380000
              WHEN 'CLP'  MOVE  '400' TO TWA-SV-STCD                    15390000
              WHEN 'PUR'  MOVE  '500' TO TWA-SV-STCD                    15400000
              WHEN 'MPP'  MOVE  '510' TO TWA-SV-STCD                    15410000
              WHEN 'REJ'  MOVE  '600' TO TWA-SV-STCD                    15420000
           END-EVALUATE.                                                15430000
                                                                        15440000
           IF MMSDL > 0                                                 15450000
              IF MMSDI = TWA-MSD                                        15460000
                 CONTINUE                                               15470000
              ELSE                                                      15480000
                 MOVE MMSDI  TO TWA-MSD TWA-SV-SD                       15490000
              END-IF                                                    15500000
           ELSE                                                         15510000
              IF MMSDA = ERASE-KEY                                      15520000
                 MOVE SPACE  TO TWA-MSD TWA-SV-SD.                      15530000
           MOVE ATT-UNPROT TO MMSDA.                                    15540000
                                                                        15550000
           PERFORM 0416-CHECK-IF-SRCH-CHANGED.                          15560000
     *                                                                  15570000
           IF ACAT-SRCH-ENTRY                                           15580000
              MOVE SPACES TO ACAT-SEARCH-RETURN                         15590000
              PERFORM 0417-CALL-ACATSRCH-RTN                            15600000
              IF ACAT-SRCH-MSG = SPACES OR LOW-VALUES                   15610000
                 PERFORM 0760-BR-AE-SECURITY                            15620000
SECR             IF SRCH-SIGNON-SECR-CHECK-PASS                         15630000
                    CONTINUE                                            15640000
SECR             ELSE                                                   15650000
SECR                MOVE                                                15660000
SECR                'USER IS NOT AUTHORIZED TO REVIEW THIS ACCOUNT'     15670000
SECR                   TO SYSTEM-MSG                                    15680000
SECR                 SET CURSOR-ON-MBR           TO TRUE                15690000
SECR                 MOVE ATT-UNPROT-BRT         TO MMBRA               15700000
SECR                 PERFORM  0800-SEND-MAP-RETURN                      15710000
SECR              END-IF                                                15720000
              ELSE                                                      15730000
                 MOVE ACAT-SRCH-MSG TO SYSTEM-MSG                       15740000
                 PERFORM 0418-SRCH-CURSOR-RTN                           15750000
                 PERFORM 0830-ERROR-RTN                                 15760000
              END-IF                                                    15770000
           END-IF.                                                      15780000
      /                                                                 15790000
      *--------------------------------------------------------------*  15800000
      *     CHECK IF USER CHANGED ANY SEARCH ENGINE FIELD            *  15810000
      *--------------------------------------------------------------*  15820000
       0416-CHECK-IF-SRCH-CHANGED.                                      15830000
           SET ACAT-NO-SRCH-ENTRY TO TRUE.                              15840000
                                                                        15850000
           IF TWA-MBR NOT = TWA-PREV-MBR                                15860000
              SET ACAT-SRCH-ENTRY TO TRUE.                              15870000
           IF TWA-MAC NOT = TWA-PREV-MAC                                15880000
              SET ACAT-SRCH-ENTRY TO TRUE.                              15890000
           IF TWA-MRR NOT = TWA-PREV-MRR                                15900000
              SET ACAT-SRCH-ENTRY TO TRUE.                              15910000
           IF TWA-MCBRKR NOT = TWA-PREV-MCBRKR                          15920000
              SET ACAT-SRCH-ENTRY TO TRUE.                              15930000
           IF TWA-MTFR NOT = TWA-PREV-MTFR                              15940000
              SET ACAT-SRCH-ENTRY TO TRUE.                              15950000
           IF TWA-MRD NOT = TWA-PREV-MRD                                15960000
              SET ACAT-SRCH-ENTRY TO TRUE.                              15970000
           IF TWA-MSTAT NOT = TWA-PREV-MSTAT                            15980000
              SET ACAT-SRCH-ENTRY TO TRUE.                              15990000
           IF TWA-MSD NOT = TWA-PREV-MSD                                16000000
              SET ACAT-SRCH-ENTRY TO TRUE.                              16010000
                                                                        16020000
           MOVE TWA-MBR    TO ACAT-INP-BRANCH.                          16030000
           MOVE TWA-MAC    TO ACAT-INP-ACCOUNT.                         16040000
           MOVE TWA-MRR    TO ACAT-INP-RR.                              16050000
           MOVE TWA-MCBRKR TO ACAT-INP-CONTRA-BKR.                      16060000
           MOVE TWA-MTFR   TO ACAT-INP-TFR-TYP.                         16070000
           MOVE TWA-MRD    TO ACAT-INP-RCV-DEL.                         16080000
           MOVE TWA-MSTAT  TO ACAT-INP-STATUS.                          16090000
           MOVE TWA-MSD    TO ACAT-INP-STTL-DT.                         16100000
                                                                        16110000
           IF TWA-TRLM-INPUT   = TWA-PREV-TRLM-INPUT                    16120000
              SET ACAT-NO-SRCH-ENTRY TO TRUE.                           16130000
                                                                        16140000
           IF TWA-TRLM-INPUT = SPACE                                    16150000
              MOVE SPACE TO ACAT-SEARCH-RETURN.                         16160000
                                                                        16170000
      /                                                                 16180000
       0417-CALL-ACATSRCH-RTN.                                          16190000
           EXEC CICS LINK                                               16200000
                PROGRAM ('ACATSRCH')                                    16210000
                COMMAREA (ACAT-SEARCH-AREA)                             16220000
           END-EXEC.                                                    16230000
           IF EIBRESP NOT = +0                                          16240000
              MOVE 'LINK TO ACATSRCH IS FAILED! ' TO SYSTEM-MSG         16250000
              PERFORM 0418-SRCH-CURSOR-RTN                              16260000
              PERFORM 0830-ERROR-RTN                                    16270000
           END-IF.                                                      16280000
                                                                        16290000
       0418-SRCH-CURSOR-RTN.                                            16300000
           IF TWA-MBR = SPACES  OR  LOW-VALUES                          16310000
              CONTINUE                                                  16320000
           ELSE                                                         16330000
              SET CURSOR-ON-MBR TO TRUE                                 16340000
           END-IF.                                                      16350000
                                                                        16360000
           IF TWA-MAC = SPACES  OR  LOW-VALUES                          16370000
              CONTINUE                                                  16380000
           ELSE                                                         16390000
              SET CURSOR-ON-MAC TO TRUE                                 16400000
           END-IF.                                                      16410000
                                                                        16420000
           IF TWA-MRR   =  SPACES  OR  LOW-VALUES                       16430000
              CONTINUE                                                  16440000
           ELSE                                                         16450000
              SET CURSOR-ON-MRR TO TRUE                                 16460000
           END-IF.                                                      16470000
                                                                        16480000
           IF TWA-MTFR  =  SPACES  OR  LOW-VALUES                       16490000
              CONTINUE                                                  16500000
           ELSE                                                         16510000
              SET CURSOR-ON-MTFR TO TRUE                                16520000
           END-IF.                                                      16530000
                                                                        16540000
           IF TWA-MCBRKR =  SPACES  OR  LOW-VALUES                      16550000
              CONTINUE                                                  16560000
           ELSE                                                         16570000
              MOVE -1    TO  MMBKRL                                     16580000
              SET CURSOR-ON-MCBRKR TO TRUE                              16590000
           END-IF.                                                      16600000
                                                                        16610000
           IF TWA-MSTAT =  SPACES  OR  LOW-VALUES                       16620000
              CONTINUE                                                  16630000
           ELSE                                                         16640000
              SET CURSOR-ON-MSTAT TO TRUE                               16650000
           END-IF.                                                      16660000
                                                                        16670000
      /                                                                 16680000
       0420-VALIDATE-X-R-FIELDS.                                        16690000
           IF TWA-M4ACCPT > SPACE  AND                                  16700000
              (TWA-M4REJ   > SPACE OR                                   16710000
              TWA-M4REJC  > SPACE)                                      16720000
              SET CURSOR-ON-M4ACCPT TO TRUE                             16730000
              MOVE ' CAN NOT ACCEPT AND REJECT AT SAME TIME'            16740000
              TO TWA-RETURN-MSG                                         16750000
              PERFORM 0830-ERROR-RTN                                    16760000
           END-IF.                                                      16770000
                                                                        16780000
           IF TWA-M4ACCEL > SPACE  AND                                  16790000
              (TWA-M4REJ  > SPACE  OR                                   16800000
              TWA-M4REJC  > SPACE)                                      16810000
              SET CURSOR-ON-M4ACCEL TO TRUE                             16820000
              MOVE ' CAN NOT ACCELERATE AND REJECT AT SAME TIME'        16830000
              TO TWA-RETURN-MSG                                         16840000
              PERFORM 0830-ERROR-RTN                                    16850000
           END-IF.                                                      16860000
                                                                        16870000
           IF TWA-M4REJ   > SPACE  AND                                  16880000
              TWA-M4REJC  > SPACE                                       16890000
              SET CURSOR-ON-M4REJ   TO TRUE                             16900000
              MOVE ' CAN NOT ENTER BOTH FIELDS AT SAME TIME'            16910000
              TO TWA-RETURN-MSG                                         16920000
              PERFORM 0830-ERROR-RTN                                    16930000
           END-IF.                                                      16940000
                                                                        16950000
           IF TWA-VTRNFR-NSCC-PEND-CD = 'A'                             16960000
              IF TWA-M4ACCPT = SPACE                                    16970000
                 IF TWA-M4REJ = 'S'                                     16980000
                    SET INPUT-ACCPT-DA TO TRUE                          16990000
                    SET INPUT-REJ-IR TO TRUE                            17000000
                    MOVE ATT-PROT TO M4ACCELA M4ACCPTA                  17010000
                    PERFORM 0450-PROCESS-INPUT                          17020000
                 END-IF                                                 17030000
              ELSE                                                      17040000
                 IF TWA-M4ACCEL = 'S'                                   17050000
                    SET INPUT-ACCEL-IX TO TRUE                          17060000
                    PERFORM 0450-PROCESS-INPUT                          17070000
                 END-IF                                                 17080000
              END-IF                                                    17090000
           ELSE                                                         17100000
              IF TWA-M4ACCPT = 'S'                                      17110000
                 IF TWA-M4ACCEL = 'S'                                   17120000
                    SET INPUT-ACCPT-IA TO TRUE                          17130000
                    SET INPUT-ACCEL-IX TO TRUE                          17140000
                    PERFORM 0450-PROCESS-INPUT                          17150000
                 END-IF                                                 17160000
              END-IF                                                    17170000
           END-IF.                                                      17180000
                                                                        17190000
           IF M4REJL > +0                                               17200000
LRM009        IF TWA-M4REJ = 'Y'                                        17210006
LRM009           MOVE 'S' TO TWA-M4REJ ACAT04IO-M4REJ                   17210106
LRM009        END-IF                                                    17210206
              IF TWA-M4REJ = 'S'                                        17211001
                 SET INPUT-REJ-IR TO TRUE                               17220000
                 MOVE ATT-PROT    TO M4ACCELA, M4ACCPTA                 17230000
                 PERFORM 0450-PROCESS-INPUT                             17240000
              ELSE                                                      17250000
                 SET CURSOR-ON-M4REJ TO TRUE                            17260000
                 MOVE ATT-PROT    TO M4ACCELA, M4ACCPTA                 17270000
                 MOVE ATT-UNPROT-BRT TO M4REJA                          17280000
                 MOVE ' ENTER "S" OR "Y" TO REJECT' TO TWA-RETURN-MSG   17290001
              END-IF                                                    17300000
           END-IF.                                                      17310000
                                                                        17320000
           IF M4REJCL > +0                                              17330000
LRM009        IF TWA-M4REJC = 'Y'                                       17340006
LRM009           MOVE 'S' TO TWA-M4REJC ACAT04IO-M4REJC                 17340106
LRM009        END-IF                                                    17340206
              IF TWA-M4REJC = 'S'                                       17341001
                 MOVE ATT-PROT TO M4ACCELA, M4ACCPTA                    17350000
                 PERFORM 0540-SEND-POPUP-SCREEN                         17360000
              ELSE                                                      17370000
                 SET CURSOR-ON-M4REJC TO TRUE                           17380000
                 MOVE ATT-PROT        TO M4ACCELA, M4ACCPTA             17390000
                 MOVE ATT-UNPROT-BRT  TO M4REJCA                        17400000
                 MOVE ' ENTER "S" OR "Y" TO REJECT W/CMNT'              17410001
                           TO TWA-RETURN-MSG                            17411001
           END-IF.                                                      17420000
                                                                        17430000
           IF M4ACCELL > +0                                             17440000
LRM009        IF TWA-M4ACCEL = 'Y'                                      17441006
LRM009           MOVE 'S' TO TWA-M4ACCEL ACAT04IO-M4ACCEL               17442006
LRM009        END-IF                                                    17443006
              IF TWA-M4ACCEL = 'S'                                      17450000
                 MOVE ATT-PROT TO M4ACCPTA, M4REJA, M4REJCA             17460000
                 SET INPUT-ACCEL-IX TO TRUE                             17470000
                 PERFORM 0450-PROCESS-INPUT                             17480000
              ELSE                                                      17490000
                 SET CURSOR-ON-M4ACCEL TO TRUE                          17500000
                 MOVE ATT-UNPROT-BRT TO M4ACCELA                        17510000
LRM009           MOVE ' MUST BE "S" OR "Y"' TO TWA-RETURN-MSG           17520006
                 PERFORM 0830-ERROR-RTN                                 17530000
              END-IF                                                    17540000
           END-IF.                                                      17550000
                                                                        17560000
           IF M4ACCPTL > +0                                             17570000
              IF TWA-M4ACCPT = SPACE                                    17580000
                 IF TWA-VTRNFR-NSCC-PEND-CD = 'A'                       17590000
                    SET INPUT-ACCPT-DA TO TRUE                          17600000
                    PERFORM 0450-PROCESS-INPUT                          17610000
                 ELSE                                                   17620000
                    IF TWA-VTRNFR-NSCC-PEND-CD = SPACE OR LOW-VALUE     17630000
                      MOVE 'THIS TRANSFER HAS NOT BEEN ACCEPTED!'       17640000
                          TO TWA-RETURN-MSG                             17650000
                      SET CURSOR-ON-M4ACCPT TO TRUE                     17660000
                      MOVE ATT-PROT TO M4REJA M4REJCA M4ACCELA          17670000
                      PERFORM 0830-ERROR-RTN                            17680000
                    ELSE                                                17690000
                      MOVE 'THIS TRANSFER CAN NOT BE UN-ACCEPTED!'      17700000
                          TO TWA-RETURN-MSG                             17710000
                      SET CURSOR-ON-M4ACCPT TO TRUE                     17720000
                      MOVE ATT-PROT TO M4REJA M4REJCA M4ACCELA          17730000
                      PERFORM 0830-ERROR-RTN                            17740000
                    END-IF                                              17750000
                 END-IF                                                 17760000
              ELSE                                                      17770000
LRM009           IF TWA-M4ACCPT = 'Y'                                   17780006
LRM009           AND (TWA-VTRNFR-NSCC-PEND-CD = SPACE OR LOW-VALUE)     17780106
LRM009              MOVE 'S' TO TWA-M4ACCPT ACAT04IO-M4ACCPT            17780206
LRM009           END-IF                                                 17780306
                 IF TWA-M4ACCPT = 'S'                                   17781001
                    IF TWA-VTRNFR-NSCC-PEND-CD = SPACE OR LOW-VALUE     17790000
                       SET INPUT-ACCPT-IA TO TRUE                       17800000
                       PERFORM 0450-PROCESS-INPUT                       17810000
                    ELSE                                                17820000
                       IF TWA-VTRNFR-NSCC-PEND-CD = 'A'                 17830000
                         MOVE 'THIS TRANSFER WAS ALREADY BEEN ACCEPTED!'17840000
                             TO TWA-RETURN-MSG                          17850000
                         SET CURSOR-ON-M4ACCPT TO TRUE                  17860000
                         MOVE ATT-UNPROT-BRT TO M4ACCPTA                17870000
                         MOVE ATT-PROT TO M4REJA M4REJCA M4ACCELA       17880000
                         MOVE LOW-VALUE TO TWA-M4ACCPT TWA-PREV-ACCEPT  17890000
                         PERFORM 0830-ERROR-RTN                         17900000
                       ELSE                                             17910000
                         MOVE 'THIS TRANSFER CAN NOT BE ACCEPTED!'      17920000
                             TO TWA-RETURN-MSG                          17930000
                         SET CURSOR-ON-M4ACCPT TO TRUE                  17940000
                         MOVE ATT-PROT TO M4REJA M4REJCA M4ACCELA       17950000
                         PERFORM 0830-ERROR-RTN                         17960000
                       END-IF                                           17970000
                     END-IF                                             17980000
                 ELSE                                                   17990000
                   SET CURSOR-ON-M4ACCPT TO TRUE                        18000000
                   MOVE ' MUST BE SPACE ' TO TWA-RETURN-MSG             18010000
                   MOVE ATT-PROT TO M4REJA M4REJCA M4ACCELA             18020000
                   PERFORM 0830-ERROR-RTN                               18030000
              END-IF                                                    18040000
           END-IF.                                                      18050000
      /                                                                 18060000
       0425-VALIDATE-X-FIELDS.                                          18070000
      *                                                                 18080000
      ** WHEN TWA-INIT-TRANS-TYPE-CD = 'X'  (ACCELERATED)               18090000
      *                                                                 18100000
                                                                        18110000
           IF TWA-M4ACCEL > SPACE  AND                                  18120000
              (TWA-M4REJ  > SPACE  OR                                   18130000
              TWA-M4REJC  > SPACE )                                     18140000
              SET CURSOR-ON-M4ACCEL TO TRUE                             18150000
              MOVE ' CAN NOT ACCELERATE AND REJECT AT SAME TIME'        18160000
              TO TWA-RETURN-MSG                                         18170000
              PERFORM 0830-ERROR-RTN                                    18180000
           END-IF.                                                      18190000
                                                                        18200000
           IF M4ACCELL > +0                                             18210000
              IF TWA-VTRNFR-NSCC-PEND-CD = 'A'                          18220000
                 IF TWA-M4ACCEL = SPACE                                 18230000
                    SET INPUT-ACCEL-DX TO TRUE                          18240000
                    PERFORM 0450-PROCESS-INPUT                          18250000
                 ELSE                                                   18260000
                 IF TWA-M4ACCPT = SPACE                                 18270000
                    SET INPUT-ACCPT-DA TO TRUE                          18280000
                    PERFORM 0450-PROCESS-INPUT                          18290000
                 ELSE                                                   18300000
                 IF (TWA-M4ACCEL = SPACE) AND                           18310000
                    (TWA-M4ACCPT = SPACE)                               18320000
                      SET INPUT-ACCPT-DA TO TRUE                        18330000
                      SET INPUT-ACCEL-DX TO TRUE                        18340000
                      PERFORM 0450-PROCESS-INPUT                        18350000
                 END-IF END-IF END-IF                                   18360000
              ELSE                                                      18370000
              IF TWA-M4ACCEL = SPACE                                    18380000
                 SET INPUT-ACCEL-DX TO TRUE                             18390000
                 PERFORM 0450-PROCESS-INPUT                             18400000
              ELSE                                                      18410000
                 IF TWA-M4ACCEL = 'S'                                   18420000
                   MOVE 'THIS TRANSFER WAS ALREADY BEEN ACCELERATED!'   18430000
                       TO TWA-RETURN-MSG                                18440000
                   SET CURSOR-ON-M4ACCEL TO TRUE                        18450000
                   MOVE ATT-PROT TO M4REJA  M4REJCA  M4ACCPTA           18460000
                   MOVE SPACE TO M4ACCELO, M4REJO, M4REJCO M4ACCPTO     18470000
                   PERFORM 0830-ERROR-RTN                               18480000
                 ELSE                                                   18490000
                   SET CURSOR-ON-M4ACCEL TO TRUE                        18500000
                   MOVE ATT-PROT TO M4REJA  M4REJCA  M4ACCPTA           18510000
                   MOVE ' MUST BE SPACE ' TO TWA-RETURN-MSG             18520000
                   PERFORM 0830-ERROR-RTN                               18530000
              END-IF                                                    18540000
           END-IF.                                                      18550000
      /                                                                 18560000
       0430-VALIDATE-R-FIELDS.                                          18570000
      *                                                                 18580000
      ** WHEN TWA-INIT-TRANS-TYPE-CD = 'R'                              18590000
      *                                                                 18600000
           IF TWA-M4ACCEL > SPACE  AND                                  18610000
              (TWA-M4REJ  > SPACE  OR                                   18620000
              TWA-M4REJC  > SPACE )                                     18630000
              SET CURSOR-ON-M4ACCEL TO TRUE                             18640000
              MOVE ' CAN NOT ACCELERATE AND REJECT AT SAME TIME'        18650000
              TO TWA-RETURN-MSG                                         18660000
              PERFORM 0830-ERROR-RTN                                    18670000
           END-IF.                                                      18680000
                                                                        18690000
           IF M4REJL > +0   AND  M4REJCL = +0                           18700000
              IF TWA-M4REJ = SPACE                                      18710000
                 SET INPUT-REJ-DR TO TRUE                               18720000
                 PERFORM 0450-PROCESS-INPUT                             18730000
              ELSE                                                      18740000
                 IF TWA-M4REJ = 'S'                                     18750000
                    MOVE 'THIS TRANSFER WAS ALREADY BEEN REJECTED!'     18760000
                        TO TWA-RETURN-MSG                               18770000
                    SET CURSOR-ON-M4REJ   TO TRUE                       18780000
                    PERFORM 0830-ERROR-RTN                              18790000
                 ELSE                                                   18800000
                    SET CURSOR-ON-M4REJ   TO TRUE                       18810000
                    MOVE ' MUST BE SPACE ' TO TWA-RETURN-MSG            18820000
                    PERFORM 0830-ERROR-RTN                              18830000
                 END-IF                                                 18840000
              END-IF                                                    18850000
           ELSE                                                         18860000
              IF M4REJCL > +0 AND  M4REJL = +0                          18870000
                 IF TWA-M4REJC = SPACE                                  18880000
                    SET INPUT-REJC-DC TO TRUE                           18890000
                    PERFORM 0450-PROCESS-INPUT                          18900000
                 ELSE                                                   18910000
                    IF TWA-M4REJC = 'S'                                 18920000
                       MOVE 'THIS TRANSFER WAS ALREADY BEEN REJECTED!'  18930000
                           TO TWA-RETURN-MSG                            18940000
                       SET CURSOR-ON-M4REJC  TO TRUE                    18950000
                       PERFORM 0830-ERROR-RTN                           18960000
                    ELSE                                                18970000
                       SET CURSOR-ON-M4REJC  TO TRUE                    18980000
                       MOVE ' MUST BE SPACE ' TO TWA-RETURN-MSG         18990000
                       PERFORM 0830-ERROR-RTN                           19000000
                 END-IF                                                 19010000
           END-IF.                                                      19020000
                                                                        19030000
           IF  M4REJL  > +0   AND                                       19040000
               M4REJCL > +0                                             19050000
               SET CURSOR-ON-M4REJ  TO TRUE                             19060000
               MOVE ' CAN NOT ENTER BOTH FIELDS'                        19070000
                    TO TWA-RETURN-MSG                                   19080000
               PERFORM 0830-ERROR-RTN                                   19090000
           END-IF.                                                      19100000
                                                                        19110000
           IF  M4REJL  = +0   AND                                       19120000
               M4REJCL = +0                                             19130000
              MOVE EIBTRMID   TO TERM-ID                                19140000
              MOVE 'ACA4'     TO TRAN-ID                                19150000
              PERFORM 0600-DELETE-TSQ                                   19160000
              PERFORM 0810-MAP-INPUT-AREA  THRU 0810-EXIT               19170000
              PERFORM 0620-WRITE-TSQ                                    19180000
              SET DATA-ONLY TO TRUE                                     19190000
              PERFORM 0800-SEND-MAP-RETURN                              19200000
           END-IF.                                                      19210000
                                                                        19220000
      /                                                                 19230000
DJ0002 0440-VALIDATE-MCD.                                               19240000
DJ0002***                                                               19250000
DJ0002***  SSR# R38488 MUTUAL FUND RECEIVER ADJUSTMENTS                 19260000
DJ0002***  VALIDATE THE ACTION CODE FOR THE ASSET(MUTUAL FUND ONLY)     19270000
DJ0002***  IF 'D', IF NOT FOUND ON VINITAST                             19280000
DJ0002***               CREATE THE DELETE-ASSET RECORD ON VINITAST      19290000
DJ0002***          ELSE DELETE THE DELETE-ASSET RECORD FROM VINITAST    19300000
DJ0002***  IF ' ', DELETE THE DELETE-ASSET RECORD FROM VINITAST         19310000
DJ0002***                                                               19320000
DJ0002     IF TWA-MCD = TWA-PREV-MCD                                    19330000
DJ0002        CONTINUE                                                  19340000
DJ0002     ELSE                                                         19350000
DJ0002       PERFORM 0441-CHECK-CUTOFF-TIME                             19360000
DJ0002       IF TWA-MCD = ' '  OR 'D'                                   19370000
DJ0002          SET CURSOR-ON-MCD TO TRUE                               19380000
DJ0002          IF TWA-MCD = 'D'                                        19390000
DJ0002***------CREATE DELETE-RECORD ON VINITAST                         19400000
DJ0002             PERFORM 0444-DELETE-MUTUAL-FUND                      19410000
DJ0002             MOVE '(ACAT04RS) ASSET WILL BE DELETED'              19420000
DJ0002               TO SYSTEM-MSG                                      19430000
ET0001             MOVE TWA-MCD TO TWA-PREV-MCD                         19440000
ET0001                             TWA-VINITAST-TRANS-TYPE              19450000
DJ0002          ELSE                                                    19460000
DJ0002***------REMOVE DELETE-RECORD FROM VINITAST                       19470000
DJ0002             PERFORM 0446-UNDELETE-MUTUAL-FUND                    19480000
DJ0002             MOVE '(ACAT04RS) ASSET WILL NOT BE DELETED'          19490000
DJ0002               TO SYSTEM-MSG                                      19500000
ET0001             MOVE TWA-MCD TO TWA-PREV-MCD                         19510000
ET0001                             TWA-VINITAST-TRANS-TYPE              19520000
DJ0002          END-IF                                                  19530000
DJ0002***------DISPLAY MESSAGE AFTER PROCESSING                         19540000
DJ0002          MOVE EIBTRMID      TO TERM-ID                           19550000
DJ0002          MOVE 'ACA4'        TO TRAN-ID                           19560000
DJ0002          PERFORM 0600-DELETE-TSQ                                 19570000
DJ0002          PERFORM 0620-WRITE-TSQ                                  19580000
DJ0002          PERFORM 0850-SEND-MAP-DATA-ONLY                         19590000
DJ0002       ELSE                                                       19600000
DJ0002***-----DISPLAY ERROR MESSAGE BECAUSE VALUE IS INCORRECT          19610000
DJ0002          SET CURSOR-ON-MCD TO TRUE                               19620000
DJ0002          MOVE '(ACAT04RS) CD MUST BE D OR SPACE'                 19630000
DJ0002            TO SYSTEM-MSG                                         19640000
DJ0002          MOVE EIBTRMID      TO TERM-ID                           19650000
DJ0002          MOVE 'ACA4'        TO TRAN-ID                           19660000
DJ0002          PERFORM 0600-DELETE-TSQ                                 19670000
DJ0002          PERFORM 0620-WRITE-TSQ                                  19680000
DJ0002          PERFORM 0850-SEND-MAP-DATA-ONLY                         19690000
DJ0002       END-IF                                                     19700000
DJ0002     END-IF.                                                      19710000
DJ0002                                                                  19720000
DJ0002 0440-EXIT. EXIT.                                                 19730000
DJ0002                                                                  19740000
DJ0002 0441-CHECK-CUTOFF-TIME.                                          19750000
DJ0002                                                                  19760000
DJ0002***----DO NOT ACCEPT UPDATES AFTER 3:30 PM.                       19770000
LRM010     IF WS-TIME-HHMM > WS-CYCLE5-HHMM                             19790000
DJ0002        SET CURSOR-ON-MCD TO TRUE                                 19800000
DJ0002        MOVE TWA-PREV-MCD TO TWA-MCD                              19810000
DJ0002        MOVE                                                      19820000
DJ0002          '(ACAT04RS) NO ADJUSTMENT CAN BE MADE AFTER 3:30PM EST' 19830000
DJ0002          TO SYSTEM-MSG                                           19840000
DJ0002        MOVE EIBTRMID      TO TERM-ID                             19850000
DJ0002        MOVE 'ACA4'        TO TRAN-ID                             19860000
DJ0002        PERFORM 0600-DELETE-TSQ                                   19870000
DJ0002        PERFORM 0620-WRITE-TSQ                                    19880000
DJ0002        PERFORM 0850-SEND-MAP-DATA-ONLY                           19890000
DJ0002     END-IF.                                                      19900000
DJ0002                                                                  19910000
DJ0002 0441-EXIT. EXIT.                                                 19920000
DJ0002                                                                  19930000
DJ0002 0444-DELETE-MUTUAL-FUND.                                         19940000
DJ0002     MOVE SPACES            TO TWA-RETURN-MSG.                    19950000
DJ0002     MOVE TWA-ACAT04IO-AREA TO ACAT04IO-AREA.                     19960000
DJ0002     MOVE SPACES            TO ACAT04IO-RETURN-MSG.               19970000
DJ0002     MOVE 'D' TO ACAT04IO-VINITAST-TRANS-TYPE                     19980000
DJ0002     SET ACAT04IO-ISRT-VINITAST TO TRUE.                          19990000
DJ0002     PERFORM 0520-CALL-ACAT04DC.                                  20000000
DJ0002     IF ACAT04IO-DB2-ERROR                                        20010000
DJ0002        MOVE 'SELECT'             TO WS-DB2-ERROR-FUNCTION        20020000
DJ0002        MOVE ACAT04IO-SQLCAID     TO WS-DB2-ERROR-TABLE           20030000
DJ0002        MOVE ACAT04IO-SQLCODE     TO WS-DB2-ERROR-ID              20040000
DJ0002        MOVE WS-DB2-ERROR-MSG     TO TWA-RETURN-MSG               20050000
DJ0002        PERFORM 0830-ERROR-RTN                                    20060000
DJ0002     END-IF.                                                      20070000
DJ0002                                                                  20080000
DJ0002 0446-UNDELETE-MUTUAL-FUND.                                       20090000
DJ0002     MOVE SPACES            TO TWA-RETURN-MSG.                    20100000
DJ0002     MOVE TWA-ACAT04IO-AREA TO ACAT04IO-AREA.                     20110000
DJ0002     MOVE SPACES            TO ACAT04IO-RETURN-MSG.               20120000
DJ0002     MOVE ' ' TO ACAT04IO-VINITAST-TRANS-TYPE                     20130000
DJ0002     SET ACAT04IO-DLTE-VINITAST TO TRUE.                          20140000
DJ0002     PERFORM 0520-CALL-ACAT04DC.                                  20150000
DJ0002     IF ACAT04IO-DB2-ERROR                                        20160000
DJ0002        MOVE 'SELECT'             TO WS-DB2-ERROR-FUNCTION        20170000
DJ0002        MOVE ACAT04IO-SQLCAID     TO WS-DB2-ERROR-TABLE           20180000
DJ0002        MOVE ACAT04IO-SQLCODE     TO WS-DB2-ERROR-ID              20190000
DJ0002        MOVE WS-DB2-ERROR-MSG     TO TWA-RETURN-MSG               20200000
DJ0002        PERFORM 0830-ERROR-RTN                                    20210000
DJ0002     END-IF.                                                      20220000
      /                                                                 20230000
      *---------------------------------------------------------------* 20240000
      *      UPDATE (ADD/DELETE/MODIFY) DATABASE                      * 20250000
      *---------------------------------------------------------------* 20260000
       0450-PROCESS-INPUT.                                              20270000
           MOVE TWA-ACAT04IO-AREA TO ACAT04IO-AREA.                     20280000
                                                                        20290000
      **<< UNACCEPT AND REJECT >>                                       20300000
           IF INPUT-ACCPT-DA AND INPUT-REJ-IR                           20310000
              PERFORM 0455-UPDATE-VTRNFR                                20320000
              MOVE ACAT04IO-AREA TO TWA-ACAT04IO-AREA                   20330000
              IF TWA-VTRNFR-UPDATED                                     20340000
                 SET CURSOR-ON-M4ACCPT TO TRUE                          20350000
                 MOVE ' ' TO TWA-M4ACCPT M4ACCPTO TWA-PREV-ACCEPT       20360000
              ELSE                                                      20370000
                 MOVE ACAT04IO-RETURN-MSG TO TWA-RETURN-MSG             20380000
                 PERFORM 0830-ERROR-RTN                                 20390000
              END-IF                                                    20400000
              PERFORM 0460-INSERT-INITRNF                               20410000
              MOVE ACAT04IO-AREA TO TWA-ACAT04IO-AREA                   20420000
              IF TWA-VINITRNF-INSERTED                                  20430000
                 SET CURSOR-ON-M4ACCEL TO TRUE                          20440000
                 MOVE 'S' TO ACAT04IO-M4REJ                             20450000
                 MOVE                                                   20460000
                   '"ACCEPT" CANCELLED - "REJECT" TRANSFER REQUEST WI   20470000
      -            'LL BE SENT TO NSCC'                                 20480000
                   TO SYSTEM-MSG                                        20490000
                 PERFORM 0451-SETUP-N-SEND-MAP                          20500000
              ELSE                                                      20510000
                 MOVE ACAT04IO-RETURN-MSG TO TWA-RETURN-MSG             20520000
                 PERFORM 0830-ERROR-RTN                                 20530000
              END-IF                                                    20540000
           END-IF.                                                      20550000
                                                                        20560000
      **<< ACCEPT AND ACCELERATE >>                                     20570000
           IF INPUT-ACCPT-IA AND INPUT-ACCEL-IX                         20580000
LRM013           MOVE ACAT-SIGN-ON-ID     TO ACAT04IO-SIGN-ON-ID        22682000
LRM013           MOVE ACAT-CICS-USER-NAME TO ACAT04IO-USER-NAME         22682100
LRM013           MOVE ACAT-CICS-USER-ID   TO ACAT04IO-USER-ID           22682200
LRM013           MOVE ACAT-CICS-NETNAME   TO ACAT04IO-NET-NAME          22682300
                 PERFORM 0455-UPDATE-VTRNFR                             20590000
                 MOVE ACAT04IO-AREA TO TWA-ACAT04IO-AREA                20600000
                 IF TWA-VTRNFR-UPDATED                                  20610000
                    SET CURSOR-ON-M4ACCPT TO TRUE                       20620000
                    MOVE 'S' TO TWA-M4ACCPT M4ACCPTO  TWA-PREV-ACCEPT   20630000
                 ELSE                                                   20640000
                    MOVE ACAT04IO-RETURN-MSG TO TWA-RETURN-MSG          20650000
                    PERFORM 0830-ERROR-RTN                              20660000
                 END-IF                                                 20670000
                 PERFORM 0460-INSERT-INITRNF                            20680000
                 MOVE ACAT04IO-AREA TO TWA-ACAT04IO-AREA                20690000
                 IF TWA-VINITRNF-INSERTED                               20700000
                    SET CURSOR-ON-M4ACCEL TO TRUE                       20710000
                    MOVE 'S' TO ACAT04IO-M4ACCEL                        20720000
                    MOVE                                                20730000
                      '"ACCEPT" COMPLETED - "ACCELERATE" TRANSFER REQUES20740000
      -               'T WILL BE SENT TO NSCC'                          20750000
                      TO SYSTEM-MSG                                     20760000
                    PERFORM 0451-SETUP-N-SEND-MAP                       20770000
                 ELSE                                                   20780000
                    MOVE ACAT04IO-RETURN-MSG TO TWA-RETURN-MSG          20790000
                    PERFORM 0830-ERROR-RTN                              20800000
                 END-IF                                                 20810000
           END-IF.                                                      20820000
                                                                        20830000
      **<< UNACCEPT AND UNACCELERATE >>                                 20840000
           IF INPUT-ACCPT-DA  AND  INPUT-ACCEL-DX                       20850000
                 PERFORM 0455-UPDATE-VTRNFR                             20860000
                 MOVE ACAT04IO-AREA TO TWA-ACAT04IO-AREA                20870000
                 IF TWA-VTRNFR-UPDATED                                  20880000
                    SET CURSOR-ON-M4ACCPT TO TRUE                       20890000
                    MOVE ' ' TO TWA-M4ACCPT M4ACCPTO TWA-PREV-ACCEPT    20900000
                 ELSE                                                   20910000
                    MOVE ACAT04IO-RETURN-MSG TO TWA-RETURN-MSG          20920000
                    PERFORM 0830-ERROR-RTN                              20930000
                 END-IF                                                 20940000
                 PERFORM 0470-DELETE-INITRNF                            20950000
                 MOVE ACAT04IO-AREA TO TWA-ACAT04IO-AREA                20960000
                 IF TWA-VINITRNF-DELETED                                20970000
                    SET CURSOR-ON-M4ACCEL TO TRUE                       20980000
                    MOVE SPACE TO ACAT04IO-M4ACCEL                      20990000
                    MOVE                                                21000000
                      '"ACCEPT" CANCELLED - "ACCELERATE" TRANSFER REQUES21010000
      -               'T CANCELLED'                                     21020000
                      TO SYSTEM-MSG                                     21030000
                    PERFORM 0451-SETUP-N-SEND-MAP                       21040000
                 ELSE                                                   21050000
                    MOVE ACAT04IO-RETURN-MSG TO TWA-RETURN-MSG          21060000
                    PERFORM 0830-ERROR-RTN                              21070000
                 END-IF                                                 21080000
           END-IF.                                                      21090000
                                                                        21100000
      **<< ACCEPT - UPDATE TRANSFER - MOVE 'A' TO NSCC_PEND_CD >>       21110000
           IF INPUT-ACCPT-IA                                            21120000
LRM013           MOVE ACAT-SIGN-ON-ID     TO ACAT04IO-SIGN-ON-ID        22682000
LRM013           MOVE ACAT-CICS-USER-NAME TO ACAT04IO-USER-NAME         22682100
LRM013           MOVE ACAT-CICS-USER-ID   TO ACAT04IO-USER-ID           22682200
LRM013           MOVE ACAT-CICS-NETNAME   TO ACAT04IO-NET-NAME          22682300
                 PERFORM 0455-UPDATE-VTRNFR                             21130000
                 MOVE ACAT04IO-AREA TO TWA-ACAT04IO-AREA                21140000
                 IF TWA-VTRNFR-UPDATED                                  21150000
                    SET CURSOR-ON-M4ACCPT TO TRUE                       21160000
                    MOVE 'S' TO TWA-M4ACCPT M4ACCPTO  TWA-PREV-ACCEPT   21170000
                    MOVE '"ACCEPT" COMPLETED'  TO SYSTEM-MSG            21180000
                    PERFORM 0451-SETUP-N-SEND-MAP                       21190000
                 ELSE                                                   21200000
                    MOVE ACAT04IO-RETURN-MSG TO TWA-RETURN-MSG          21210000
                    PERFORM 0830-ERROR-RTN                              21220000
                 END-IF                                                 21230000
           END-IF.                                                      21240000
                                                                        21250000
      **<< UNACCEPT - UPDATE TRANSFER - MOVE ' ' TO NSCC_PEND_CD >>     21260000
           IF INPUT-ACCPT-DA                                            21270000
                 PERFORM 0455-UPDATE-VTRNFR                             21280000
                 MOVE ACAT04IO-AREA TO TWA-ACAT04IO-AREA                21290000
                 IF TWA-VTRNFR-UPDATED                                  21300000
                    SET CURSOR-ON-M4ACCPT TO TRUE                       21310000
                    MOVE ' ' TO TWA-M4ACCPT M4ACCPTO TWA-PREV-ACCEPT    21320000
                    MOVE '"ACCEPT" CANCELLED'                           21330000
                      TO SYSTEM-MSG                                     21340000
                    PERFORM 0451-SETUP-N-SEND-MAP                       21350000
                 ELSE                                                   21360000
                    MOVE ACAT04IO-RETURN-MSG TO TWA-RETURN-MSG          21370000
                    PERFORM 0830-ERROR-RTN                              21380000
                 END-IF                                                 21390000
           END-IF.                                                      21400000
                                                                        21410000
      **<< ACCELERATE - INSERT INIT TRANSFER >>                         21420000
           IF INPUT-ACCEL-IX                                            21430000
                 PERFORM 0460-INSERT-INITRNF                            21440000
                 MOVE ACAT04IO-AREA TO TWA-ACAT04IO-AREA                21450000
                 IF TWA-VINITRNF-INSERTED                               21460000
                    SET CURSOR-ON-M4ACCEL TO TRUE                       21470000
                    MOVE 'S' TO ACAT04IO-M4ACCEL                        21480000
LRM005              IF TWA-STTLM-TM-CD = 'L'                            21481000
LRM010              AND WS-TIME-HHMM > WS-CYCLE5-HHMM                   21482000
LRM005              MOVE 'WARNING-PAST CUTOFF TIME;SUBMITTING WILL CAUSE21483000
LRM005-                    ' NSCC ERROR' TO SYSTEM-MSG                  21484000
LRM005              ELSE                                                21485000
                    MOVE                                                21490000
                      '"ACCELERATE" TRANSFER REQUEST WILL BE SENT TO NSC21500000
      -               'C'                                               21510000
                      TO SYSTEM-MSG                                     21520000
LRM005              END-IF                                              21521000
                    PERFORM 0451-SETUP-N-SEND-MAP                       21530000
                 ELSE                                                   21540000
                    MOVE ACAT04IO-RETURN-MSG TO TWA-RETURN-MSG          21550000
                    PERFORM 0830-ERROR-RTN                              21560000
                 END-IF                                                 21570000
           END-IF.                                                      21580000
                                                                        21590000
      **<< REJECT - INSERT INIT TRANSFER >>                             21600000
           IF INPUT-REJ-IR                                              21610000
                 PERFORM 0460-INSERT-INITRNF                            21620000
                 MOVE ACAT04IO-AREA TO TWA-ACAT04IO-AREA                21630000
                 IF TWA-VINITRNF-INSERTED                               21640000
                    SET CURSOR-ON-M4ACCEL TO TRUE                       21650000
                    MOVE 'S' TO ACAT04IO-M4REJ                          21660000
LRM005              IF TWA-STTLM-TM-CD = 'L'                            21661000
LRM010              AND WS-TIME-HHMM > WS-CYCLE5-HHMM                   21662000
LRM005              MOVE 'WARNING-PAST CUTOFF TIME;SUBMITTING WILL CAUSE21663000
LRM005-                    ' NSCC ERROR' TO SYSTEM-MSG                  21670000
LRM005              ELSE                                                21670100
                    MOVE                                                21671000
                      '"REJECT" TRANSFER REQUEST WILL BE SENT TO NSCC'  21680000
                      TO SYSTEM-MSG                                     21690000
LRM005              END-IF                                              21691000
                    PERFORM 0451-SETUP-N-SEND-MAP                       21700000
                 ELSE                                                   21710000
                    MOVE ACAT04IO-RETURN-MSG TO TWA-RETURN-MSG          21720000
                    PERFORM 0830-ERROR-RTN                              21730000
                 END-IF                                                 21740000
           END-IF.                                                      21750000
                                                                        21760000
      **<< REJECT WITH COMMENT - INSERT INIT TRANSFER >>                21770000
           IF INPUT-REJC-RC                                             21780000
                 PERFORM 0460-INSERT-INITRNF                            21790000
                 MOVE ACAT04IO-AREA TO TWA-ACAT04IO-AREA                21800000
                 IF TWA-VINITRNF-INSERTED                               21810000
                    SET CURSOR-ON-M4ACCEL TO TRUE                       21820000
                    MOVE 'S' TO ACAT04IO-M4REJC                         21830000
LRM005              IF TWA-STTLM-TM-CD = 'L'                            21831000
LRM010              AND WS-TIME-HHMM > WS-CYCLE5-HHMM                   21832000
LRM005              MOVE 'WARNING-PAST CUTOFF TIME;SUBMITTING WILL CAUSE21833000
LRM005-                    ' NSCC ERROR' TO SYSTEM-MSG                  21834000
LRM005              ELSE                                                21835000
                    MOVE                                                21840000
                      '"REJECT WITH CMNTS" TRANSFER REQUEST WILL BE SENT21850000
      -               ' TO NSCC'                                        21860000
                      TO SYSTEM-MSG                                     21870000
LRM005              END-IF                                              21871000
                    PERFORM 0451-SETUP-N-SEND-MAP                       21880000
                 ELSE                                                   21890000
                    MOVE ACAT04IO-RETURN-MSG TO TWA-RETURN-MSG          21900000
                    PERFORM 0830-ERROR-RTN                              21910000
                 END-IF                                                 21920000
           END-IF.                                                      21930000
                                                                        21940000
      **<< UNACCELERATE - DELETE INIT TRANSFER >>                       21950000
           IF INPUT-ACCEL-DX                                            21960000
                 PERFORM 0470-DELETE-INITRNF                            21970000
                 MOVE ACAT04IO-AREA TO TWA-ACAT04IO-AREA                21980000
                 IF TWA-VINITRNF-DELETED                                21990000
                    SET CURSOR-ON-M4ACCEL TO TRUE                       22000000
                    MOVE SPACE TO ACAT04IO-M4ACCEL                      22010000
                    MOVE '"ACCELERATE" TRANSFER REQUEST CANCELLED'      22020005
                      TO SYSTEM-MSG                                     22030000
                    PERFORM 0451-SETUP-N-SEND-MAP                       22040000
                 ELSE                                                   22050000
                    MOVE ACAT04IO-RETURN-MSG TO TWA-RETURN-MSG          22060000
                    PERFORM 0830-ERROR-RTN                              22070000
                 END-IF                                                 22080000
           END-IF.                                                      22090000
                                                                        22100000
      **<< UNREJECT - DELETE INIT TRANSFER >>                           22110000
           IF INPUT-REJ-DR                                              22120000
                 PERFORM 0470-DELETE-INITRNF                            22130000
                 MOVE ACAT04IO-AREA TO TWA-ACAT04IO-AREA                22140000
                 IF TWA-VINITRNF-DELETED                                22150000
                    SET CURSOR-ON-M4REJ TO TRUE                         22160000
                    MOVE SPACE TO ACAT04IO-M4REJ                        22170000
                    MOVE '"REJECT" TRANSFER REQUEST CANCEL REJECT'      22180005
                      TO SYSTEM-MSG                                     22190000
                    PERFORM 0451-SETUP-N-SEND-MAP                       22200000
                 ELSE                                                   22210000
                    MOVE ACAT04IO-RETURN-MSG   TO  TWA-RETURN-MSG       22220000
                    PERFORM 0830-ERROR-RTN                              22230000
                 END-IF                                                 22240000
           END-IF.                                                      22250000
                                                                        22260000
      **<< UNDONE 'REJECT WITH CMNTS' - DELETE INIT TRANSFER >>         22270000
           IF INPUT-REJC-DC                                             22280000
                 PERFORM 0470-DELETE-INITRNF                            22290000
                 MOVE ACAT04IO-AREA TO TWA-ACAT04IO-AREA                22300000
                 IF TWA-VINITRNF-DELETED                                22310000
                    SET CURSOR-ON-M4REJC TO TRUE                        22320000
                    MOVE ' ' TO ACAT04IO-M4REJC                         22330000
                    MOVE                                                22340000
                      '"REJECT WITH CMNTS" TRANSFER REQUEST CANCELLED'  22350005
                      TO SYSTEM-MSG                                     22360000
                    PERFORM 0451-SETUP-N-SEND-MAP                       22370000
                 ELSE                                                   22380000
                    MOVE ACAT04IO-RETURN-MSG   TO  TWA-RETURN-MSG       22390000
                    PERFORM 0830-ERROR-RTN                              22400000
                 END-IF                                                 22410000
           END-IF.                                                      22420000
                                                                        22430000
      /                                                                 22440000
       0451-SETUP-N-SEND-MAP.                                           22450000
           MOVE EIBTRMID      TO TERM-ID.                               22460000
           MOVE 'ACA4'        TO TRAN-ID.                               22470000
           PERFORM 0600-DELETE-TSQ.                                     22480000
           PERFORM 0810-MAP-INPUT-AREA THRU 0810-EXIT                   22490000
           PERFORM 0620-WRITE-TSQ.                                      22500000
           PERFORM 0800-SEND-MAP-RETURN.                                22510000
                                                                        22520000
      /                                                                 22530000
       0455-UPDATE-VTRNFR.                                              22540000
           SET ACAT04IO-UPDT-VTRNFR TO TRUE.                            22550000
           PERFORM 0500-CALL-ACAT04DA.                                  22560000
           IF ACAT04IO-DB2-ERROR                                        22570000
              MOVE 'SELECT'             TO WS-DB2-ERROR-FUNCTION        22580000
              MOVE ACAT04IO-SQLCAID     TO WS-DB2-ERROR-TABLE           22590000
              MOVE ACAT04IO-SQLCODE     TO WS-DB2-ERROR-ID              22600000
              MOVE WS-DB2-ERROR-MSG     TO TWA-RETURN-MSG               22610000
              PERFORM 0830-ERROR-RTN                                    22620000
           END-IF.                                                      22630000
                                                                        22640000
       0460-INSERT-INITRNF.                                             22650000
           IF INPUT-REJC-RC                                             22660000
              MOVE TWA-VINITRNF-CMNT TO ACAT04IO-VINITRNF-CMNT          22670000
           END-IF.                                                      22680000
ET0003     MOVE SPACE               TO ACAT04IO-ACCT-FREEZ-PROCESS.     22681000
ET0004     MOVE ACAT-SIGN-ON-ID     TO ACAT04IO-SIGN-ON-ID.             22682000
ET0004     MOVE ACAT-CICS-USER-NAME TO ACAT04IO-USER-NAME.              22682100
ET0004     MOVE ACAT-CICS-USER-ID   TO ACAT04IO-USER-ID.                22682200
ET0004     MOVE ACAT-CICS-NETNAME   TO ACAT04IO-NET-NAME.               22682300
                                                                        22682400
           SET ACAT04IO-ISRT-VINITRNF TO TRUE.                          22682500
           PERFORM 0500-CALL-ACAT04DA.                                  22682600
           IF ACAT04IO-DB2-ERROR                                        22682700
              MOVE 'SELECT'             TO WS-DB2-ERROR-FUNCTION        22682800
              MOVE ACAT04IO-SQLCAID     TO WS-DB2-ERROR-TABLE           22682900
              MOVE ACAT04IO-SQLCODE     TO WS-DB2-ERROR-ID              22683000
              MOVE WS-DB2-ERROR-MSG     TO TWA-RETURN-MSG               22684000
              PERFORM 0830-ERROR-RTN                                    22685000
           END-IF.                                                      22686000
                                                                        22687000
       0470-DELETE-INITRNF.                                             22688000
           MOVE 'DI'   TO  ACAT04IO-FUNCTION.                           22689000
           PERFORM 0500-CALL-ACAT04DA.                                  22690000
           IF ACAT04IO-DB2-ERROR                                        22700000
              MOVE 'SELECT'             TO WS-DB2-ERROR-FUNCTION        22710000
              MOVE ACAT04IO-SQLCAID     TO WS-DB2-ERROR-TABLE           22720000
              MOVE ACAT04IO-SQLCODE     TO WS-DB2-ERROR-ID              22730000
              MOVE WS-DB2-ERROR-MSG     TO TWA-RETURN-MSG               22740000
              PERFORM 0830-ERROR-RTN                                    22750000
           END-IF.                                                      22760000
      /                                                                 22770000
       0500-CALL-ACAT04DA.                                              22780000
      *** LINK TO ACAT04DA, ONE VTRNFR ROW WILL BE RETURNED     ****    22790000
                                                                        22800000
           EXEC CICS LINK                                               22810000
                PROGRAM ('ACAT04DA')                                    22820000
                COMMAREA (ACAT04IO-AREA)                                22830000
           END-EXEC.                                                    22840000
                                                                        22850000
           IF EIBRESP NOT = +0                                          22860000
              MOVE 'LINK TO ACAT04DA IS FAILED! ' TO TWA-RETURN-MSG     22870000
              SET CURSOR-ON-M4NEXT   TO TRUE                            22880000
              PERFORM 0830-ERROR-RTN                                    22890000
           END-IF.                                                      22900000
                                                                        22910000
           MOVE ACAT04IO-SAVE-KEYS  TO  TWA-SV-TRNFR-KEY.               22920000
      /                                                                 22930000
       0510-RETRIEVE-DETAIL.                                            22940000
                                                                        22950000
           IF ACAT04IO-VASSET-FOUND                                     22960000
              MOVE 'RA' TO ACAT04IO-FUNCTION                            22970000
              PERFORM 0520-CALL-ACAT04DC                                22980000
              IF ACAT04IO-DB2-ERROR                                     22990000
                 MOVE 'SELECT'          TO WS-DB2-ERROR-FUNCTION        23000000
                 MOVE ACAT04IO-SQLCAID  TO WS-DB2-ERROR-TABLE           23010000
                 MOVE ACAT04IO-SQLCODE  TO WS-DB2-ERROR-ID              23020000
                 MOVE WS-DB2-ERROR-MSG  TO TWA-RETURN-MSG               23030000
                 PERFORM 0830-ERROR-RTN                                 23040000
              END-IF                                                    23050000
           END-IF.                                                      23060000
                                                                        23070000
       0520-CALL-ACAT04DC.                                              23080000
                                                                        23090000
           EXEC CICS LINK                                               23100000
                PROGRAM ('ACAT04DC')                                    23110000
                COMMAREA (ACAT04IO-AREA)                                23120000
           END-EXEC.                                                    23130000
                                                                        23140000
           IF EIBRESP NOT = +0                                          23150000
              MOVE 'LINK TO ACAT04DC IS FAILED! ' TO TWA-RETURN-MSG     23160000
              SET CURSOR-ON-M4NEXT   TO TRUE                            23170000
              PERFORM 0830-ERROR-RTN                                    23180000
           END-IF.                                                      23190000
                                                                        23200000
           MOVE ACAT04IO-SAVE-KEYS  TO  TWA-SV-TRNFR-KEY.               23210000
      /                                                                 23220000
       0530-PREP-FOR-POPUP.                                             23230000
                                                                        23240000
           MOVE EIBTRMID      TO TERM-ID.                               23250000
           MOVE 'ACA4'        TO TRAN-ID.                               23260000
           PERFORM 0610-READ-TSQ.                                       23270000
           PERFORM 0540-SEND-POPUP-SCREEN.                              23280000
                                                                        23290000
       0540-SEND-POPUP-SCREEN.                                          23300000
           INITIALIZE ACAT90CM-TS-AREA.                                 23310000
           PERFORM 0560-WRITE-ACAT90CM-TS-RTN.                          23320000
           MOVE '$' TO WS-ACAT-NEXT.                                    23330000
           MOVE 'ACAT90CM' TO CALLED-PROGRAM-NAME.                      23340000
           PERFORM 0710-INVOKE-DETAIL-PROGRAM-RTN.                      23350000
      /                                                                 23360000
       0550-READ-ACAT90CM-TS-RTN.                                       23370000
           MOVE EIBTRMID TO TERM-ID.                                    23380000
           MOVE 'ACA$'   TO TRAN-ID.                                    23390000
           INITIALIZE ACAT90CM-TS-AREA.                                 23400000
           EXEC CICS READQ TS QUEUE(TSQ-NAME)                           23410000
                              INTO(ACAT90CM-TS-AREA)                    23420000
                              LENGTH(LENGTH OF ACAT90CM-TS-AREA)        23430000
                              ITEM(ITEM-NUM)                            23440000
           END-EXEC.                                                    23450000
           IF EIBRESP = +0                                              23460000
              IF ACAT90CM-TS-SCREEN = 'A'                               23470000
                 IF TWA-XFR-REJC-YES   AND                              23480000
                    ACAT90CM-TS-UPDATE                                  23490000
                    MOVE ACAT90CM-TS-MCCMNT-X120 TO TWA-VINITRNF-CMNT   23500000
                 ELSE                                                   23510000
                    CONTINUE                                            23520000
                 END-IF                                                 23530000
              ELSE                                                      23540000
                 IF ACAT90CM-TS-SCREEN = 'T'                            23550000
                    MOVE ACAT90CM-TS-MCTYPE TO TWA-RCV-ACCT-TYPE-CD     23560000
                 ELSE                                                   23570000
                    IF ACAT90CM-TS-SCREEN = 'X'                         23580000
                       CONTINUE                                         23590000
                    END-IF                                              23600000
                 END-IF                                                 23610000
              END-IF                                                    23620000
           END-IF.                                                      23630000
                                                                        23640000
      /                                                                 23650000
       0560-WRITE-ACAT90CM-TS-RTN.                                      23660000
                                                                        23670000
           PERFORM 0570-CALL-ACAT90CM.                                  23680000
                                                                        23690000
           MOVE 'ACA$'   TO TRAN-ID.                                    23700000
           EXEC CICS DELETEQ TS QUEUE(TSQ-NAME)                         23710000
           END-EXEC.                                                    23720000
                                                                        23730000
           EXEC CICS WRITEQ TS QUEUE(TSQ-NAME)                          23740000
                     FROM(ACAT90CM-TS-AREA)                             23750000
                     LENGTH(LENGTH OF ACAT90CM-TS-AREA)                 23760000
                     ITEM(ITEM-NUM)                                     23770000
           END-EXEC.                                                    23780000
           IF EIBRESP NOT = +0                                          23790000
              MOVE LOW-VALUE TO ACAT04MO                                23800000
              MOVE 'ACAT04 WRITE TSQ ERROR ON ACA$'                     23810000
                TO TWA-RETURN-MSG                                       23820000
           END-IF.                                                      23830000
                                                                        23840000
       0570-CALL-ACAT90CM.                                              23850000
                                                                        23860000
           IF EIBAID = DFHPF1                                           23870000
              EVALUATE TRUE                                             23880000
                WHEN VIEW-ACCT-CMNT                                     23890000
                     MOVE 'A'   TO TWA-SCREEN-IND, ACAT90CM-TS-SCREEN   23900000
                     MOVE SPACE TO ACAT90CM-TS-UPDATE-IND               23910000
                WHEN VIEW-SECR-CMNT                                     23920000
                     MOVE 'S' TO TWA-SCREEN-IND, ACAT90CM-TS-SCREEN     23930000
                     MOVE SPACE TO ACAT90CM-TS-UPDATE-IND               23940000
                WHEN VIEW-BAL1-CMNT                                     23950000
                     MOVE '1' TO TWA-SCREEN-IND, ACAT90CM-TS-SCREEN     23960000
                     MOVE SPACE TO ACAT90CM-TS-UPDATE-IND               23970000
                WHEN VIEW-BAL2-CMNT                                     23980000
                     MOVE '2' TO TWA-SCREEN-IND, ACAT90CM-TS-SCREEN     23990000
                     MOVE SPACE TO ACAT90CM-TS-UPDATE-IND               24000000
                WHEN VIEW-BAL5-CMNT                                     24010000
                     MOVE '5' TO TWA-SCREEN-IND, ACAT90CM-TS-SCREEN     24020000
                     MOVE SPACE TO ACAT90CM-TS-UPDATE-IND               24030000
                WHEN VIEW-REJC-CMNT                                     24040000
                     MOVE 'A'   TO TWA-SCREEN-IND, ACAT90CM-TS-SCREEN   24050000
                     MOVE SPACE TO ACAT90CM-TS-UPDATE-IND               24060000
              END-EVALUATE                                              24070000
           ELSE                                                         24080000
              IF EIBAID = DFHPF6                                        24090000
                 MOVE 'X'   TO TWA-SCREEN-IND, ACAT90CM-TS-SCREEN       24100000
                 MOVE SPACE TO ACAT90CM-TS-UPDATE-IND                   24110000
              ELSE                                                      24120000
                 IF EIBAID = DFHENTER AND                               24130000
                    TWA-XFR-REJC-YES                                    24140000
                    MOVE 'A' TO TWA-SCREEN-IND, ACAT90CM-TS-SCREEN      24150000
                    MOVE 'Y' TO ACAT90CM-TS-UPDATE-IND                  24160000
                 END-IF                                                 24170000
              END-IF                                                    24180000
           END-IF.                                                      24190000
                                                                        24200000
           MOVE EIBTRMID      TO TERM-ID.                               24210000
           MOVE 'ACA4'        TO TRAN-ID.                               24220000
           PERFORM 0600-DELETE-TSQ.                                     24230000
           PERFORM 0620-WRITE-TSQ.                                      24240000
                                                                        24250000
      **** MOVE FIELDS TO ACAT90CM-TS-AREA ========>                    24260000
                                                                        24270000
           MOVE TWA-BRANCH-CD              TO ACAT90CM-TS-MBR.          24280000
           MOVE TWA-ACCT-CD                TO ACAT90CM-TS-MAC.          24290000
           MOVE TWA-RR-CD                  TO ACAT90CM-TS-MRR.          24300000
           MOVE TWA-RCV-ACCT-TYPE-CD       TO ACAT90CM-TS-MCTYPE.       24310000
           MOVE TWA-DLVR-NBR               TO ACAT90CM-TS-MCBRKR.       24320000
           MOVE SPACE                      TO ACAT90CM-TS-MCBNAM.       24330000
           MOVE TWA-ACCT-DLVR-NBR          TO ACAT90CM-TS-MCACCT.       24340000
           MOVE TWA-RCV-CUST-NM            TO WS-CUSTNM.                24350000
           MOVE WS-CUSTNM-LN1              TO ACAT90CM-TS-MNAME.        24360000
           MOVE WS-CUSTNM-LN2              TO ACAT90CM-TS-MNAME2.       24370000
           MOVE SPACE                      TO ACAT90CM-TS-MNAME3.       24380000
           MOVE TWA-RCV-SS-PRIM-NBR        TO ACAT90CM-TS-MSSN.         24390000
           MOVE TWA-RCV-SS-SCNDY-NBR       TO ACAT90CM-TS-MSSN2.        24400000
01/07                                                                   24410000
           IF ACAT90CM-TS-SCREEN = 'X'                                  24420000
             MOVE TWA-ACCT-ACTIVITY-IND   TO ACAT90CM-ACCT-ACTIVITY-IND 24430000
             MOVE TWA-ACCT-ORDERS-IND     TO ACAT90CM-ACCT-ORDERS-IND   24440000
             MOVE TWA-ACCT-RJCT-RSBM-IND  TO ACAT90CM-ACCT-RJCT-RSBM-IND24450000
             MOVE TWA-ACCT-DB-BAL-T1-IND  TO ACAT90CM-ACCT-DB-BAL-T1-IND24460000
             MOVE TWA-ACCT-MRGN-DB-IND    TO ACAT90CM-ACCT-MRGN-DB-IND  24470000
             MOVE TWA-ACCT-SHRT-PSTN-IND  TO ACAT90CM-ACCT-SHRT-PSTN-IND24480000
             MOVE TWA-ACCT-SEC-RSTRD-IND  TO ACAT90CM-ACCT-SEC-RSTRD-IND24490000
             MOVE TWA-ACCT-AST-EXCS-IND   TO ACAT90CM-ACCT-AST-EXCS-IND 24500000
             MOVE TWA-ACCT-OPTN-PSTN-IND  TO ACAT90CM-ACCT-OPTN-PSTN-IND24510000
             MOVE TWA-ACCT-LTD-PRTNR-IND  TO ACAT90CM-ACCT-LTD-PRTNR-IND24520000
             MOVE TWA-ACCT-TIN-MSMTH-IND  TO ACAT90CM-ACCT-TIN-MSMTH-IND24530000
             MOVE TWA-ACCT-DPLCT-TRN-IND  TO ACAT90CM-ACCT-DPLCT-TRN-IND24540000
             MOVE TWA-ACCT-CUST-70-IND    TO ACAT90CM-ACCT-CUST-70-IND  24550000
             MOVE TWA-ACCT-QULFD-PLN-IND  TO ACAT90CM-ACCT-QULFD-PLN-IND24560000
             MOVE TWA-ACCT-MNGD-IND       TO ACAT90CM-ACCT-MNGD-IND     24570000
             MOVE TWA-ACCT-PRVT-RNG-IND   TO ACAT90CM-ACCT-PRVT-RNG-IND 24580000
             MOVE TWA-ACCT-BRKR-TIF-IND   TO ACAT90CM-ACCT-BRKR-TIF-IND 24590000
             MOVE TWA-NSCC-NON-ADP-IND    TO ACAT90CM-NSCC-NON-ADP-IND  24600000
             MOVE TWA-COMMENTS-IND        TO ACAT90CM-COMMENTS-IND      24610000
ET0003       MOVE TWA-ACCT-FREEZ-TYPE     TO ACAT90CM-ACCOUNT-FREEZE-IND24620000
ET0003       MOVE TWA-ACCT-FRZN-IND    TO ACAT90CM-BATCH-FREEZE-FND-IND 24630000
LRM006       MOVE TWA-REGT-IND         TO ACAT90CM-REGT-VIOLATION-IND   24631000
LRM006       MOVE TWA-90DR-IND         TO ACAT90CM-DAYT-VIOLATION-IND   24633000
DJ0003       MOVE TWA-AUCTION-RATE-IND TO ACAT90CM-AUCTION-RATE-IND     24633000
LRM011       MOVE TWA-SUB-PENNY-PRICE-IND                               24633000
LRM011                                 TO ACAT90CM-SUB-PENNY-PRICE-IND  24633000
           ELSE                                                         24640000
              IF ACAT90CM-TS-SCREEN = 'S'                               24650000
                 MOVE TWA-ASSET-CMNT       TO ACAT90CM-TS-MCCMNT-X120   24660000
              ELSE                                                      24670000
                 IF ACAT90CM-TS-SCREEN = 'A'                            24680000
                    IF TWA-VINITRNF-CMNT > SPACE                        24690000
                       MOVE TWA-VINITRNF-CMNT TO ACAT90CM-TS-MCCMNT-X12024700000
                    ELSE                                                24710000
                       MOVE TWA-VTRNFR-CMNT TO ACAT90CM-TS-MCCMNT-X120  24720000
                    END-IF                                              24730000
                 END-IF                                                 24740000
              END-IF                                                    24750000
           END-IF.                                                      24760000
      /                                                                 24770000
       0600-DELETE-TSQ.                                                 24780000
                                                                        24790000
           EXEC CICS DELETEQ TS QUEUE(TSQ-NAME)                         24800000
           END-EXEC.                                                    24810000
                                                                        24820000
       0610-READ-TSQ.                                                   24830000
                                                                        24840000
           EXEC CICS READQ TS QUEUE(TSQ-NAME)                           24850000
                              INTO (TWA-AREA)                           24860000
                              LENGTH(LENGTH OF TWA-AREA)                24870000
                              ITEM(ITEM-NUM)                            24880000
           END-EXEC.                                                    24890000
           IF (EIBRESP NOT = +0)                                        24900000
           AND (NOT FIRST-TIME)                                         24910000
               MOVE LOW-VALUE TO ACAT04MO                               24920000
               MOVE 'ACAT04RS READ TSQ ERROR'                           24930000
               TO TWA-RETURN-MSG                                        24940000
               PERFORM 0830-ERROR-RTN                                   24950000
           END-IF.                                                      24960000
                                                                        24970000
                                                                        24980000
       0620-WRITE-TSQ.                                                  24990000
                                                                        25000000
           EXEC CICS WRITEQ TS QUEUE(TSQ-NAME)                          25010000
                              FROM(TWA-AREA)                            25020000
                              LENGTH(LENGTH OF TWA-AREA)                25030000
                              ITEM(ITEM-NUM)                            25040000
           END-EXEC.                                                    25050000
           IF (EIBRESP NOT = +0)                                        25060000
           AND (NOT FIRST-TIME)                                         25070000
              MOVE 'ACAT04RS WRITE TSQ ERROR.' TO TWA-RETURN-MSG        25080000
           END-IF.                                                      25090000
                                                                        25100000
      /                                                                 25110000
       0630-BUILD-ACAT0F01-TS-RTN.                                      25120000
                                                                        25130000
           MOVE EIBTRMID      TO TERM-ID.                               25140000
           MOVE 'ACA4'        TO TRAN-ID.                               25150000
           PERFORM 0610-READ-TSQ.                                       25160000
                                                                        25170000
           INITIALIZE ACAT0F01-COMMAREA.                                25180000
           MOVE TWA-CLIENT-NBR       TO ACAT0F01-CLIENT-NBR.            25190000
           MOVE TWA-ACAT-CONTROL-NBR TO ACAT0F01-CONTROL-NBR.           25200000
10/12      MOVE TWA-SEC-NBR          TO ACAT0F01-ISIN-SEC-ISSUE-CD.     25210000
           MOVE TWA-SV-ASSET-SEQ-NBR TO ACAT0F01-ASSET-SEQ-NBR.         25220000
           MOVE TWA-ASSET-DESC       TO ACAT0F01-ASSET-DESC.            25230000
           MOVE TWA-BRANCH-CD        TO ACAT0F01-BRANCH.                25240000
           MOVE TWA-ACCT-CD          TO ACAT0F01-ACCOUNT.               25250000
           MOVE TWA-RR-CD            TO ACAT0F01-ACCT-RR-CD.            25260000
                                                                        25270000
           MOVE EIBTRMID TO TERM-ID.                                    25280000
           MOVE 'AMFX'   TO TRAN-ID.                                    25290000
           EXEC CICS DELETEQ TS QUEUE(TSQ-NAME)                         25300000
           END-EXEC.                                                    25310000
                                                                        25320000
           EXEC CICS WRITEQ TS QUEUE(TSQ-NAME)                          25330000
                     FROM(ACAT0F01-COMMAREA)                            25340000
                     LENGTH(LENGTH OF ACAT0F01-COMMAREA)                25350000
                     ITEM(ITEM-NUM)                                     25360000
           END-EXEC.                                                    25370000
           IF EIBRESP NOT = +0                                          25380000
              MOVE LOW-VALUE TO ACAT04MO                                25390000
              MOVE 'ACAT04 WRITE TSQ ERROR ON AMFX'                     25400000
                TO TWA-RETURN-MSG                                       25410000
           END-IF.                                                      25420000
      /                                                                 25430000
       0700-PROCESS-JUMP-RTN.                                           25440000
SECR       PERFORM 0750-SCREEN-SECURITY-CHECK.                          25450000
TCK        IF M4NEXTL > +0                                              25460000
              MOVE M4NEXTI   TO WS-ACAT-NEXT, TWA-M4NEXT                25470000
TCK        ELSE                                                         25480000
TCK           IF TWA-M4NEXT > SPACE                                     25490000
TCK              MOVE TWA-M4NEXT TO WS-ACAT-NEXT                        25500000
TCK           END-IF                                                    25510000
TCK        END-IF.                                                      25520000
                                                                        25530000
       COPY ACATJUMP.                                                   25540000
                                                                        25550000
           IF CALLED-PROGRAM-NAME = SPACES                              25560000
              SET CURSOR-ON-M4NEXT   TO TRUE                            25570000
              MOVE ATT-UNPROT-BRT-MDT TO M4NEXTA                        25580000
              MOVE 'NEXT TRANSACTION SELECTION IS INVALID' TO           25590000
                  TWA-RETURN-MSG                                        25600000
              PERFORM 0830-ERROR-RTN                                    25610000
           END-IF.                                                      25620000
                                                                        25630000
           MOVE WS-ACAT-NEXT      TO ACAT-NEXT ACAT-INP-SEL.            25640000
           SET CURSOR-ON-M4NEXT   TO TRUE                               25650000
           PERFORM 0710-INVOKE-DETAIL-PROGRAM-RTN.                      25660000
      /                                                                 25670000
       0710-INVOKE-DETAIL-PROGRAM-RTN.                                  25680000
           EXEC CICS XCTL PROGRAM(CALLED-PROGRAM-NAME)                  25690000
                          COMMAREA(ACATCOMM-COMMAREA)                   25700000
           END-EXEC.                                                    25710000
                                                                        25720000
                                                                        25730000
       0720-RETURN-FROM-DETAIL-RTN.                                     25740000
           MOVE EIBTRMID      TO TERM-ID.                               25750000
           MOVE 'ACAX'        TO TRAN-ID.                               25760000
           PERFORM 0600-DELETE-TSQ.                                     25770000
           SET FIRST-TIME TO TRUE.                                      25780000
                                                                        25790000
                                                                        25800000
 SECR  0750-SCREEN-SECURITY-CHECK.                                      25810000
           IF  ACAT-SUPER-SIGN-ON-UPDATE                                25820000
                OR                                                      25830000
               ACAT-SUPER-SIGN-ON-BROWSE                                25840000
                OR                                                      25850000
               ACAT-JUMP-ANYWHERE                                       25860000
                OR                                                      25870000
               ACAT-NEXT = '$'                                          25880000
                CONTINUE                                                25890000
           ELSE                                                         25900000
TCK            MOVE EIBTRMID      TO TERM-ID                            25910000
TCK            MOVE 'ACA4'        TO TRAN-ID                            25920000
TCK            PERFORM 0610-READ-TSQ                                    25930000
TCK               IF TWA-M4NEXT > SPACE                                 25940000
TCK                 MOVE TWA-M4NEXT TO ACAT-SCREEN-IND                  25950000
TCK               END-IF                                                25960000
               SET ACAT-UPDATE-MODE TO TRUE                             25970000
               MOVE SPACES    TO SECLINK-LIST                           25980000
               MOVE '2'       TO SECLINK-ACTION-CODE                    25990000
               MOVE 'SCON'    TO SECLINK-TYPE                           26000000
               MOVE ACAT-SEC-LIT TO SECLINK-ITEM                        26010000
               PERFORM 0799-CALL-SECLINK-RTN                            26020000
               IF (SECLINK-RETURN-CODE = '00' OR '20')                  26030000
                  SET ACAT-SIGN-ON-UPDATE TO TRUE                       26040000
                  MOVE SECLINK-USER-ID TO ACAT-SIGN-ON-ID               26050000
               ELSE                                                     26060000
                  SET ACAT-BROWSE-MODE TO TRUE                          26070000
                  MOVE SPACES    TO SECLINK-LIST                        26080000
                  MOVE '2'       TO SECLINK-ACTION-CODE                 26090000
                  MOVE 'SCON'    TO SECLINK-TYPE                        26100000
                  MOVE ACAT-SEC-LIT TO SECLINK-ITEM                     26110000
                  PERFORM 0799-CALL-SECLINK-RTN                         26120000
                  IF SECLINK-RETURN-CODE = '00' OR '20'                 26130000
                     MOVE SPACE TO ACAT-SIGN-ON-SEC-FLAG                26140000
                  ELSE                                                  26150000
                     MOVE 'USER NOT AUTHORIZED TO USE NEXT SELECTION '  26160000
                          TO SYSTEM-MSG                                 26170000
                     MOVE TWA-M4NEXT  TO SYSTEM-MSG(44 : 1)             26180000
                     SET CURSOR-ON-M4NEXT     TO TRUE                   26190000
                     MOVE ATT-UNPROT-BRT      TO M4NEXTA                26200000
                     PERFORM 0830-ERROR-RTN                             26210000
                  END-IF                                                26220000
               END-IF                                                   26230000
           END-IF.                                                      26240000
      /                                                                 26250000
       0760-BR-AE-SECURITY.                                             26260000
           INITIALIZE ACAT-SRCH-COMM-AREA.                              26270000
           SET SECURITY-LOOKUP      TO TRUE.                            26280000
           MOVE ACAT-INP-BRANCH     TO SRCH-INP-BRANCH.                 26290000
           MOVE ACAT-INP-RR         TO SRCH-INP-RR.                     26300000
           EXEC CICS LINK                                               26310000
                     PROGRAM('ACATSRCH')                                26320000
                     COMMAREA(ACAT-SRCH-COMM-AREA)                      26330000
                     LENGTH(LENGTH OF ACAT-SRCH-COMM-AREA)              26340000
           END-EXEC.                                                    26350000
      /                                                                 26360000
       0770-SET-TRANS-SEC-RTN.                                          26370000
ET0004     MOVE ACAT-SIGN-ON-ID      TO ACAT04IO-SIGN-ON-ID.            26380000
ET0004     MOVE ACAT-CICS-NETNAME    TO ACAT04IO-NET-NAME.              26390000
ET0004     MOVE ACAT-CICS-USER-ID    TO ACAT04IO-USER-ID.               26400000
ET0004     MOVE ACAT-CICS-USER-NAME  TO ACAT04IO-USER-NAME.             26410000
                                                                        26420000
           IF ACAT-SUPER-SIGN-ON-UPDATE                                 26430000
              SET ACAT-SIGN-ON-UPDATE TO TRUE                           26440000
           ELSE                                                         26450000
               MOVE 'CU'         TO ACAT-SCREEN-IND                     26460000
               SET ACAT-UPDATE-MODE TO TRUE                             26470000
               MOVE SPACES    TO SECLINK-LIST                           26480000
               MOVE '2'       TO SECLINK-ACTION-CODE                    26490000
               MOVE 'SCON'    TO SECLINK-TYPE                           26500000
               MOVE ACAT-SEC-LIT TO SECLINK-ITEM                        26510000
               PERFORM 0799-CALL-SECLINK-RTN                            26520000
               IF SECLINK-RETURN-CODE = '00' OR '20'                    26530000
                  SET ACAT-SIGN-ON-UPDATE TO TRUE                       26540000
               ELSE                                                     26550000
                  SET ACAT-SIGN-ON-BROWSE TO TRUE                       26560000
           END-IF.                                                      26570000
                                                                        26570100
LRM008*---------------------------------------------------------------- 26570200
LRM008* WHEN ASCENDIS CLIENT, AND USER ORIGINALLY HAD UPDATE AUTH, LOOK 26570300
LRM008* FOR SPECIAL OVERRIDE SCON TO ALLOW UPDATE.  IF NOT SPECIAL SCON 26570400
LRM008* ONLY ALLOW UPDATE TO REGISTRATION SCREENS, OTHERWISE BROWSE     26570500
LRM008* ONLY ON ALL FUNCTIONS.                                          26570600
LRM008*---------------------------------------------------------------- 26570700
LRM008     IF (ACAT-ASCENDIS-CLIENT OR ACAT-ASCENDIS-OVERRIDE)          26571000
LRM008        IF ACAT-SIGN-ON-UPDATE                                    26572000
LRM008           MOVE SPACES         TO SECLINK-LIST                    26572100
LRM008           MOVE '2'            TO SECLINK-ACTION-CODE             26572200
LRM008           MOVE 'SCON'         TO SECLINK-TYPE                    26572300
LRM008           MOVE 'ACAXASCENDIS' TO SECLINK-ITEM                    26572400
LRM008           PERFORM 0799-CALL-SECLINK-RTN                          26572500
LRM008           IF (SECLINK-RETURN-CODE = '00' OR '20')                26572600
LRM008              CONTINUE                                            26572700
LRM008           ELSE                                                   26572800
LRM008              SET ACAT-SIGN-ON-ASCENDIS-RSTRCT TO TRUE            26572900
LRM008        ELSE                                                      26573000
LRM008           SET ACAT-SIGN-ON-BROWSE TO TRUE                        26574000
LRM008        END-IF                                                    26575000
LRM008     END-IF.                                                      26576000
                                                                        26580000
                                                                                
       0799-CALL-SECLINK-RTN.                                           26600000
           EXEC CICS LINK PROGRAM ('SECLINK')                           26610000
                COMMAREA(SECLINK-LIST)                                  26620000
                LENGTH(LENGTH OF SECLINK-LIST)                          26630000
           END-EXEC.                                                    26640000
                                                                        26650000
      /                                                                 26660000
       0800-SEND-MAP-RETURN.                                            26670000
                                                                        26680000
           IF  DATA-ONLY                                                26690000
               PERFORM 0850-SEND-MAP-DATA-ONLY                          26700000
           ELSE                                                         26710000
               PERFORM 0870-SEND-MAP-ERASE                              26720000
           END-IF.                                                      26730000
      /                                                                 26740000
       0810-MAP-INPUT-AREA.                                             26750000
                                                                        26760000
LRM012* SHOW CYCLE5 CUTOFF MSG AND FORCE BROWSE MODE WHEN THE USER              
LRM012* HAS AN UPDATE SNON, THE TRANSFER IS IN AN UPDATABLE STATUS,             
LRM012* AND IT'S THE LAST DAY TO REACT.  THE L IS SET BY CAT711.                
LRM012* WE ARE BLOCKING FUNCTIONS - ASSET DELETE, ACCEL AND REJECT.             
LRM012     IF (TWA-STTLM-TM-CD = 'L'                                            
LRM012     AND WS-TIME-HHMM > WS-CYCLE5-HHMM)                                   
LRM012     AND (TWA-STCD >= '200' AND <= '300')                         27800000
LRM012        IF ACAT-SIGN-ON-UPDATE                                            
LRM012           SET ACAT-SIGN-ON-BROWSE TO TRUE                                
LRM012           SET WS-CYCLE5-CUTOFF    TO TRUE                                
LRM012     END-IF.                                                              
           IF NOT ERROR-YES                                             26770000
              MOVE LOW-VALUES                                           26780000
                TO ACAT04MO                                             26790000
              MOVE SPACE                                                26800000
                TO M4NEXTO M4ACCPTO M4ACCELO M4REJO M4REJCO TRLMSGO.    26810000
                                                                        26820000
           IF TWA-VTRNFR-NOT-FOUND                                      26830000
              MOVE ATT-ASKIP TO M4ACCELA M4ACCPTA M4REJA M4REJCA        26840000
              GO TO 0810-EXIT.                                          26850000
                                                                        26860000
           MOVE ATT-UNPROT-BRT TO M4NEXTA, M4ACCELA, M4ACCPTA,          26870000
                                           M4REJA, M4REJCA.             26880000
                                                                        26890000
           MOVE TWA-BRANCH-CD           TO ACAT-BR.                     26900000
           MOVE TWA-ACCT-CD             TO ACAT-AC.                     26910000
           MOVE  TWA-BRANCH-CD          TO M4BRO.                       26920000
           MOVE  TWA-ACCT-CD            TO M4ACO.                       26930000
           MOVE  TWA-RR-CD              TO M4RRO.                       26940000
           MOVE  TWA-ACAT-CONTROL-NBR   TO M4CNBRO.                     26950000
           MOVE  TWA-RCV-ACCT-TYPE-CD   TO M4CSTPO.                     26960000
           MOVE  TWA-DLVR-NBR           TO M4CBRBRO.                    26970000
           MOVE  TWA-ACCT-DLVR-NBR      TO M4CACCTO.                    26980000
           MOVE  TWA-RCV-CUST-NM        TO WS-CUSTNM.                   26990000
           MOVE  WS-CUSTNM-LN1          TO M4NAMEO.                     27000000
           MOVE  WS-CUSTNM-LN2          TO M4NAME2O.                    27010000
           IF TWA-RCV-SS-PRIM-NBR = SPACES OR LOW-VALUE OR ZEROS        27020000
               MOVE SPACES              TO M4SSN1O                      27030000
           ELSE                                                         27040000
               MOVE TWA-RCV-SS-PRIM-NBR TO WS-SSN-ONE                   27050000
               MOVE WS-SSN-ONE-1        TO WS-SSN-ONE-1R                27060000
               MOVE WS-SSN-ONE-2        TO WS-SSN-ONE-2R                27070000
               MOVE WS-SSN-ONE-3        TO WS-SSN-ONE-3R                27080000
               MOVE WS-SSN-ONE-REFORM   TO M4SSN1O                      27090000
           END-IF.                                                      27100000
           IF TWA-RCV-SS-SCNDY-NBR = SPACES OR LOW-VALUES OR ZEROS      27110000
               MOVE SPACES              TO M4SSN2O                      27120000
           ELSE                                                         27130000
               MOVE TWA-RCV-SS-SCNDY-NBR TO WS-SSN-TWO                  27140000
               MOVE WS-SSN-TWO-1        TO WS-SSN-TWO-1R                27150000
               MOVE WS-SSN-TWO-2        TO WS-SSN-TWO-2R                27160000
               MOVE WS-SSN-TWO-3        TO WS-SSN-TWO-3R                27170000
               MOVE WS-SSN-TWO-REFORM   TO M4SSN2O                      27180000
           END-IF.                                                      27190000
           MOVE  TWA-TFR-TYPE           TO M4TFRTPO.                    27200000
           IF TWA-STTLM-DT = '0001-01-01'                               27210000
              MOVE   SPACES             TO M4SDO                        27220000
           ELSE                                                         27230000
              MOVE  TWA-STTLM-DT        TO M4SDO                        27240000
           END-IF.                                                      27250000
                                                                        27260000
           IF TWA-CASH-ASSET                                            27270000
              MOVE '01'  TO  M4STYPEO                                   27280000
           ELSE                                                         27290000
              IF TWA-MARGIN-ASSET                                       27300000
                 MOVE '02' TO M4STYPEO                                  27310000
              ELSE                                                      27320000
                 IF TWA-SHORT-ASSET                                     27330000
                    MOVE '05' TO M4STYPEO                               27340000
                 END-IF                                                 27350000
              END-IF                                                    27360000
           END-IF.                                                      27370000
                                                                        27380000
06/04 ** ALERT MESSAGE ***                                              27390000
06/04      IF TWA-ALERT-IND = 'Y'                                       27400000
06/04         MOVE ATT-PROT-BRT TO M4ALRTA                              27410000
06/04         MOVE WS-ALERT-MSG TO M4ALRTO                              27420000
06/04      ELSE                                                         27430000
06/04         MOVE SPACES       TO M4ALRTO                              27440000
06/04      END-IF.                                                      27450000
                                                                        27460000
      **<< BAL01 >>                                                     27470000
           IF TWA-BAL01 IS NOT NUMERIC                                  27480000
              MOVE +0        TO WS-BAL01-DEC2                           27490000
           ELSE                                                         27500000
              MOVE TWA-BAL01 TO WS-BAL01-DEC2                           27510000
           END-IF.                                                      27520000
                                                                        27530000
      **<< BAL02 >>                                                     27540000
           IF TWA-BAL02 IS NOT NUMERIC                                  27550000
              MOVE +0        TO WS-BAL02-DEC2                           27560000
           ELSE                                                         27570000
              MOVE TWA-BAL02 TO WS-BAL02-DEC2                           27580000
           END-IF.                                                      27590000
                                                                        27600000
      **<< BAL05 >>                                                     27610000
           IF TWA-BAL05 IS NOT NUMERIC                                  27620000
              MOVE +0        TO WS-BAL05-DEC2                           27630000
           ELSE                                                         27640000
              MOVE TWA-BAL05 TO WS-BAL05-DEC2                           27650000
           END-IF.                                                      27660000
                                                                        27670000
      **<< SMA >>                                                       27680000
           IF TWA-SMA IS NOT NUMERIC                                    27690000
              MOVE +0      TO WS-AMT-S                                  27700000
           ELSE                                                         27710000
              MOVE TWA-SMA TO WS-SMA-DEC2                               27720000
           END-IF.                                                      27730000
                                                                        27740000
           MOVE  WS-BAL01-DEC2          TO M4BAL01O.                    27750000
           MOVE  WS-BAL02-DEC2          TO M4BAL02O.                    27760000
           MOVE  WS-BAL05-DEC2          TO M4BAL05O.                    27770000
           MOVE  WS-SMA-DEC2            TO M4SMAO.                      27780000
                                                                        27790000
           EVALUATE TWA-STCD                                            27800000
               WHEN '100'                                               27810000
                    MOVE TWA-DAYS            TO MSG-100-N               27820000
                    MOVE MSG-100             TO M4STATO                 27830000
               WHEN '110'                                               27840000
                    MOVE TWA-DAYS            TO MSG-110-N               27850000
                    MOVE MSG-110             TO M4STATO                 27860000
               WHEN '120'                                               27870000
                    MOVE TWA-DAYS            TO MSG-120-N               27880000
                    MOVE MSG-120             TO M4STATO                 27890000
               WHEN '130'                                               27900000
                    MOVE TWA-DAYS            TO MSG-130-N               27910000
                    MOVE MSG-130             TO M4STATO                 27920000
               WHEN '140'                                               27930000
                    MOVE TWA-DAYS            TO MSG-140-N               27940000
                    MOVE MSG-140             TO M4STATO                 27950000
               WHEN '200'                                               27960000
                    MOVE TWA-DAYS            TO MSG-200-N               27970000
                    MOVE MSG-200             TO M4STATO                 27980000
               WHEN '210'                                               27990000
                    MOVE TWA-DAYS            TO MSG-210-N               28000000
                    MOVE MSG-210             TO M4STATO                 28010000
               WHEN '220'                                               28020000
                    MOVE TWA-DAYS            TO MSG-220-N               28030000
                    MOVE MSG-220             TO M4STATO                 28040000
               WHEN '230'                                               28050000
                    MOVE TWA-DAYS            TO MSG-230-N               28060000
                    MOVE MSG-230             TO M4STATO                 28070000
DJ0002         WHEN '240'                                               28080000
DJ0002              MOVE TWA-DAYS            TO MSG-240-N               28090000
DJ0002              MOVE MSG-240             TO M4STATO                 28100000
               WHEN '300'                                               28110000
                    MOVE TWA-DAYS            TO MSG-300-N               28120000
                    MOVE MSG-300             TO M4STATO                 28130000
               WHEN '310'                                               28140000
                    MOVE TWA-DAYS            TO MSG-310-N               28150000
                    MOVE MSG-310             TO M4STATO                 28160000
               WHEN '400'                                               28170000
                    MOVE TWA-DAYS            TO MSG-400-N               28180000
                    MOVE MSG-400             TO M4STATO                 28190000
               WHEN '500'                                               28200000
                    MOVE TWA-DAYS            TO MSG-500-N               28210000
                    MOVE MSG-500             TO M4STATO                 28220000
               WHEN '510'                                               28230000
                    MOVE TWA-DAYS            TO MSG-510-N               28240000
                    MOVE MSG-510             TO M4STATO                 28250000
               WHEN OTHER                                               28260000
                    MOVE TWA-STCD            TO M4STATO                 28270000
           END-EVALUATE.                                                28280000
                                                                        28290000
           IF NOT ERROR-YES                                             28300000
              MOVE TWA-M4NEXT      TO M4NEXTO                           28310000
              MOVE TWA-M4ACCPT     TO M4ACCPTO                          28320000
              MOVE TWA-M4ACCEL     TO M4ACCELO                          28330000
              MOVE TWA-M4REJ       TO M4REJO                            28340000
              MOVE TWA-M4REJC      TO M4REJCO.                          28350000
                                                                        28360000
           IF NOT TWA-CAME-FROM-PENDING                                 28370000
              MOVE  TWA-MBR    TO MMBRO                                 28380000
              MOVE  TWA-MAC    TO MMACO                                 28390000
              MOVE  TWA-MRR    TO MMRRO                                 28400000
              MOVE  TWA-MCBRKR TO MMBKRO                                28410000
              MOVE  TWA-MTFR   TO MMTFRO                                28420000
              MOVE  TWA-MRD    TO MMRDO                                 28430000
              MOVE  TWA-MSTAT  TO MMSTATO                               28440000
              MOVE  TWA-MSD    TO MMSDO.                                28450000
                                                                        28460000
           PERFORM 0820-MAP-INPUT-ASSET.                                28470000
                                                                        28480000
TCK        IF NOT ACAT-SIGN-ON-UPDATE                                   28490000
TCK           MOVE ATT-PROT  TO M4ACCELA M4ACCPTA M4REJA M4REJCA        28500000
DJ0002        MOVE ATT-PROT  TO MCDA                                    28510000
           END-IF.                                                      28520000
       0810-EXIT.                                                       28530000
           EXIT.                                                        28540000
      /                                                                 28550000
       0820-MAP-INPUT-ASSET.                                            28560000
                                                                        28570000
           MOVE LOW-VALUES TO M4SECRO, M4STYPEO, M4WIO, M4SLOCO,        28580000
06/04                         M4DESCO, M4DESC2O, M4DESC3O, M4RSMSGO.    28590000
           MOVE ZEROS      TO M4QTYO, M4AMTO.                           28600000
           MOVE  TWA-SEC-NBR            TO M4SECRO.                     28610000
*                                                                       28620000
           IF TWA-CASH-ASSET                                            28630000
              MOVE '01'  TO  M4STYPEO                                   28640000
           ELSE                                                         28650000
              IF TWA-MARGIN-ASSET                                       28660000
                 MOVE '02' TO M4STYPEO                                  28670000
              ELSE                                                      28680000
                 IF TWA-SHORT-ASSET                                     28690000
                    MOVE '05' TO M4STYPEO                               28700000
                 END-IF                                                 28710000
              END-IF                                                    28720000
           END-IF.                                                      28730000
                                                                        28740000
           MOVE  TWA-WHEN-ISSUED   TO M4WIO.                            28750000
           MOVE  TWA-STTLM-LOCATION TO M4SLOCO.                         28760000
                                                                        28770000
LRM006     IF TWA-ASSET-DESC = SPACES                                   28771000
LRM006     AND TWA-STTLM-LOCATION = '45'                                28771100
LRM006     AND TWA-STTLM-RSN-CD > SPACES                                28772000
LRM006        MOVE TWA-STTLM-RSN-CD     TO TWA-ASSET-DESC               28773000
LRM006        MOVE 'MEMO'               TO TWA-ASSET-DESC (6 : 4)       28774000
LRM006     END-IF.                                                      28775000
                                                                        28776000
01/22      IF TWA-ASSET-DESC = SPACES                                   28780000
              MOVE TWA-OPTN-CMNT-TXT    TO WS-ASSET-DESC                28790000
              MOVE WS-ASSET-DESC1       TO M4DESCO                      28800000
              MOVE WS-ASSET-DESC2       TO M4DESC2O                     28810000
              MOVE WS-ASSET-DESC3       TO M4DESC3O                     28820000
01/22      ELSE                                                         28830000
              MOVE TWA-ASSET-DESC       TO WS-ASSET-DESC                28840000
              MOVE WS-ASSET-DESC1       TO M4DESCO                      28850000
              MOVE WS-ASSET-DESC2       TO M4DESC2O                     28860000
              MOVE WS-ASSET-DESC3       TO M4DESC3O                     28870000
01/22      END-IF.                                                      28880000
                                                                        28890000
06/04      IF TWA-RESTRICTED-IND = 'Y'                                  28900000
06/04         MOVE ATT-PROT-BRT              TO M4RSMSGA                28910000
06/04         MOVE WS-RESTRICTED-MSG         TO M4RSMSGO                28920000
06/04      ELSE                                                         28930000
06/04         MOVE SPACES                    TO M4RSMSGO                28940000
06/04      END-IF.                                                      28950000
                                                                        28960000
      **<< ASSET AMT >>                                                 28970000
           IF TWA-ASSET-AMT IS NUMERIC                                  28980000
              MOVE TWA-ASSET-AMT TO WS-ASSET-DEC2                       28990000
LRM014        IF TWA-STTLM-LOCATION = '50'                                      
LRM014        AND TWA-STTLM-RSN-CD  = 'FCUR'                                    
LRM014           IF TWA-LONG-ASSET-QTY                                  29000000
LRM014              COMPUTE WS-ASSET-DEC2 = WS-ASSET-DEC2 * -1          29010000
LRM014           END-IF                                                 29020000
LRM014           MOVE WS-ASSET-DEC2 TO WS-MQTY-ED-D2                    29030000
LRM014        ELSE                                                              
                 IF TWA-SHORT-ASSET-QTY                                 29000000
                    COMPUTE WS-ASSET-DEC2 = WS-ASSET-DEC2 * -1          29010000
                 END-IF                                                 29020000
                 MOVE TWA-ASSET-AMT TO WS-MQTY-ED-D2                    29030000
LRM014        END-IF                                                    29020000
              MOVE WS-MQTY-ED-D2 TO M4AMTO                              29040000
           END-IF.                                                      29050000
                                                                        29060000
      **<< ASSET QTY >>                                                 29070000
           IF TWA-ASSET-QTY IS NUMERIC                                  29080000
              MOVE TWA-ASSET-QTY TO WS-QTY-DEC4                         29090000
              IF TWA-OPTN-CTGY-CD > '00'                                29100000
                 IF TWA-OPT-SELL                                        29110000
                    COMPUTE WS-QTY-DEC4 = WS-QTY-DEC4 * -1              29120000
                 END-IF                                                 29130000
              ELSE                                                      29140000
                 IF TWA-SHORT-ASSET-QTY                                 29150000
                    COMPUTE WS-QTY-DEC4 = WS-QTY-DEC4 * -1              29160000
                 END-IF                                                 29170000
              END-IF                                                    29180000
                 MOVE WS-QTY-DEC4 TO M4QTYO                             29190000
           END-IF.                                                      29200000
                                                                        29210000
DJ0002***--ONLY USED FOR MUTUAL FUND                                    29220000
ET0001     IF (TWA-ASSET-PRC-CTGY-CD = 'MFNM' OR 'MFMM')                29230000
ET0002     OR (TWA-STTLM-LOCATION = '60' OR '65')                       29240000
DJ0002        MOVE TWA-VINITAST-TRANS-TYPE  TO MCDO TWA-MCD TWA-PREV-MCD29250000
ET0001     ELSE                                                         29260000
ET0001        MOVE SPACE               TO MCDO TWA-MCD TWA-PREV-MCD     29270000
ET0001     END-IF                                                       29280000
                                                                        29290000
DJ0002***---UNPROTECT MCD ONLY IF MUTUAL FUND,                          29300000
DJ0002***---UPDATE ALLOWED AND IT IS BEFORE 3:30PM                      29301000
DJ0002     IF ((TWA-ASSET-PRC-CTGY-CD = 'MFNM' OR 'MFMM')               29302000
ET0002          OR (TWA-STTLM-LOCATION = '60' OR '65'))                 29302100
DJ0002     AND ACAT-SIGN-ON-UPDATE                                      29302200
LRM010         IF WS-TIME-HHMM > WS-CYCLE5-HHMM                         29302400
DJ0002             MOVE ATT-PROT    TO MCDA                             29302500
DJ0002         ELSE                                                     29302600
DJ0002             MOVE ATT-UNPROT  TO MCDA                             29302700
DJ0002         END-IF                                                   29302800
DJ0002     ELSE                                                         29302900
DJ0002         MOVE ATT-PROT    TO MCDA                                 29303000
DJ0002     END-IF.                                                      29304000
                                                                        29305000
           IF TWA-INIT-TRANS-TYPE-CD = 'R'                              29306000
              MOVE ATT-PROT  TO M4ACCELA, M4ACCPTA                      29307000
              MOVE ATT-UNPROT TO M4REJA, M4REJCA                        29308000
              MOVE 'THIS TRANSFER HAD BEEN REJECTED'                    29309000
                      TO TWA-RETURN-MSG                                 29310000
ET0003        IF TWA-VINITRNF-NSCC-PEND-CD = 'H'                        29320000
ET0003           MOVE 'TRANSFER FLAGGED TO BE REJECTED ON HOLD'         29330000
ET0003             TO  TWA-RETURN-MSG                                   29340000
ET0003        END-IF                                                    29350000
              IF TWA-VINITRNF-CMNT = SPACES OR LOW-VALUES               29360000
                 MOVE 'S' TO TWA-M4REJ TWA-PREV-REJ                     29370000
                 MOVE 'Y' TO M4REJO                                     29380000
                 SET CURSOR-ON-M4REJ TO TRUE                            29390000
              ELSE                                                      29400000
                 MOVE 'S' TO TWA-M4REJC TWA-PREV-REJ-CMNT               29410000
                 MOVE 'Y' TO M4REJCO                                    29420000
                 SET CURSOR-ON-M4REJC TO TRUE                           29430000
              END-IF                                                    29440000
           ELSE                                                         29450000
              IF NOT ERROR-YES                                          29460000
                 MOVE SPACE TO M4REJO, M4REJCO                          29470000
              END-IF                                                    29480000
           END-IF.                                                      29490000
                                                                        29500000
           IF TWA-INIT-TRANS-TYPE-CD = 'X'                              29510000
              MOVE ATT-PROT  TO M4REJA, M4REJCA, M4ACCPTA               29520000
              MOVE ATT-UNPROT-BRT TO M4ACCELA                           29530000
              MOVE 'THIS TRANSFER HAD BEEN ACCELERATED'                 29540000
                   TO TWA-RETURN-MSG                                    29550000
              MOVE 'S' TO TWA-M4ACCEL TWA-PREV-ACCEL                    29560000
              MOVE 'Y' TO M4ACCELO                                      29570000
              SET CURSOR-ON-M4ACCEL        TO TRUE                      29580000
           ELSE                                                         29590000
              IF NOT ERROR-YES                                          29600000
                 MOVE SPACE TO M4ACCELO                                 29610000
              END-IF                                                    29620000
           END-IF.                                                      29630000
                                                                        29640000
           IF TWA-VTRNFR-NSCC-PEND-CD = 'A'                             29650000
              MOVE ATT-UNPROT TO  M4ACCPTA M4ACCELA M4REJA M4REJCA      29660000
              MOVE 'Y'        TO  M4ACCPTO                              29670000
              MOVE 'S'        TO  TWA-M4ACCPT TWA-PREV-ACCEPT           29680000
              SET CURSOR-ON-M4ACCPT TO TRUE                             29690000
              MOVE 'THIS TRANSFER HAD BEEN ACCEPTED' TO TWA-RETURN-MSG  29700000
           ELSE                                                         29710000
              IF NOT ERROR-YES                                          29720000
                 MOVE SPACE     TO M4ACCPTO                             29730000
              END-IF                                                    29740000
           END-IF.                                                      29750000
                                                                        29760000
           IF TWA-VINITRNF-NSCC-PEND-CD = 'Y'                           29770000
              SET CURSOR-ON-M4NEXT TO TRUE                              29780000
              MOVE ATT-ASKIP TO M4ACCELA, M4REJA, M4REJCA, M4ACCPTA     29790000
              MOVE LOW-VALUES TO TWA-M4ACCEL, TWA-M4REJ, TWA-M4REJC     29800000
                                 TWA-M4ACCPT                            29810000
                                 TWA-PREV-ACCEPT TWA-PREV-ACCEL         29820000
                                 TWA-PREV-REJ    TWA-PREV-REJ-CMNT      29830000
              MOVE SPACES TO M4ACCELO, M4REJO, M4REJCO, M4ACCPTO        29840000
              MOVE 'NSCC PENDING, BROWSE ONLY!'  TO SYSTEM-MSG          29850000
           END-IF.                                                      29860000
                                                                        29870000
      ***  TIF CAN NOT BE ACCELERATED IF STATUS IS NOT '200'  *****     29880000
      ***  TIF CAN NOT BE ACCEPTED, ACCELERATED, REJECTED IF STATUS     29890000
      ***  IS < '200' OR > '230'                              *****     29900000
                                                                        29910000
           IF TWA-VTRNFR-FOUND                                          29920000
              IF TWA-STCD = '200'                                       29930000
                 IF TWA-RETURN-MSG > SPACES OR                          29940000
                     SYSTEM-MSG  > SPACES                               29950000
                     SET CURSOR-ON-M4NEXT TO TRUE                       29960000
                     MOVE ATT-UNPROT-BRT TO M4ACCELA, M4ACCPTA,         29970000
                                            M4REJA, M4REJCA             29980000
                 ELSE                                                   29990000
                    SET CURSOR-ON-M4NEXT TO TRUE                        30000000
                    MOVE SPACES TO M4ACCELO, M4ACCPTO,                  30010000
                                    M4REJO, M4REJCO                     30020000
                    MOVE LOW-VALUES TO TWA-M4ACCEL, TWA-M4REJ,          30030000
                                    TWA-M4ACCPT, TWA-M4REJC             30040000
                                    TWA-PREV-ACCEPT TWA-PREV-ACCEL      30050000
                                    TWA-PREV-REJ    TWA-PREV-REJ-CMNT   30060000
                    MOVE ATT-UNPROT-BRT TO M4ACCELA, M4ACCPTA,          30070000
                                           M4REJA, M4REJCA              30080000
                 END-IF                                                 30090000
              ELSE                                                      30100000
01/24            IF TWA-STCD < '200'   OR                               30110000
01/24               TWA-STCD > '230'                                    30120000
12/30               SET CURSOR-ON-M4NEXT TO TRUE                        30130000
                    MOVE ATT-UNPROT-BRT TO M4NEXTA,                     30140000
                    MOVE ATT-PROT TO                                    30150000
                                   M4ACCELA, M4ACCPTA, M4REJA, M4REJCA  30160000
ET0002                             MCDA                                 30170000
                    MOVE                                                30180000
                    'THIS TIF IS NOT IN REVIEW STATUS, BROWSE ONLY !'   30190000
                      TO TWA-RETURN-MSG                                 30200000
01/24             ELSE                                                  30210000
DJ0002              IF WS-CURSOR NOT > ' '                              30220000
01/24                  SET CURSOR-ON-M4NEXT TO TRUE                     30230000
DJ0002              END-IF                                              30240000
                    MOVE ATT-UNPROT-BRT TO M4NEXTA, M4ACCPTA,           30250000
                                            M4REJA, M4REJCA             30260000
                    MOVE ATT-PROT TO M4ACCELA                           30270000
                  END-IF                                                30280000
              END-IF                                                    30290000
           END-IF.                                                      30300000
                                                                        30310000
           IF SYSTEM-MSG = SPACES OR LOW-VALUES                         30320000
              IF TWA-VTRNFR-FIRST OR                                    30330000
                 TWA-VTRNFR-LAST  OR                                    30340000
                 TWA-VASSET-FIRST OR                                    30350000
                 TWA-VASSET-LAST                                        30360000
                 MOVE TWA-RETURN-MSG    TO SYSTEM-MSG                   30370000
              ELSE                                                      30380000
                 MOVE TWA-RETURN-MSG    TO SYSTEM-MSG                   30390000
              END-IF                                                    30400000
           END-IF.                                                      30410000
                                                                        30420000
           IF NOT ACAT-SIGN-ON-UPDATE                                   30430000
              MOVE ATT-PROT  TO M4ACCELA M4ACCPTA M4REJA M4REJCA        30440000
DJ0002        MOVE ATT-PROT  TO MCDA                                    30450000
           END-IF.                                                      30460000
ET0003                                                                  30461000
ET0003     IF  (ACAT-ACCOUNT-FREEZE-CLIENT)                             30462000
ET0003     AND (TWA-VTRNFR-FOUND OR TWA-VTRNFR-FIRST OR TWA-VTRNFR-LAST)30463000
ET0003     AND (TWA-STCD >= '200' AND TWA-STCD < '300')                 30464000
ET0003     AND (TWA-VINITRNF-NSCC-PEND-CD NOT = 'Y')                    30465000
ET0003     AND (TWA-VTRNFR-NSCC-PEND-CD NOT = 'A')                      30466000
ET0003         MOVE TWA-CLIENT-NO-X    TO ACATRSIO-CLIENT-NBR           30467000
ET0003         MOVE TWA-SV-BRANCH-CD   TO ACATRSIO-BRANCH               30468000
ET0003                                    ACAT04IO-SV-BRANCH-CD         30469000
ET0003         MOVE TWA-SV-ACCT-CD     TO ACATRSIO-ACCOUNT              30469100
ET0003                                    ACAT04IO-SV-ACCT-CD           30469200
ET0003         SET ACATRSIO-LOOKUP-ACCOUNT-FREEZE TO TRUE               30469300
ET0003         PERFORM 1010-LINK-TO-ACFREEZ-IO                          30469400
ET0003         IF ACATRSIO-FREEZE-CASH-IN                               30469500
ET0003            IF ACATRSIO-FREEZE-SEC-IN                             30469600
ET0003               MOVE 'F' TO TWA-ACCT-FREEZ-TYPE                    30469700
ET0003               PERFORM 0824-ACCT-FREEZ-PROCESS                    30469800
ET0003               MOVE WS-FULL-FREEZE-MSG  TO SYSTEM-MSG             30469900
ET0003            ELSE                                                  30470000
ET0003               MOVE 'C' TO TWA-ACCT-FREEZ-TYPE                    30470100
ET0003               PERFORM 0824-ACCT-FREEZ-PROCESS                    30470200
ET0003               MOVE WS-CASH-FREEZE-MSG  TO SYSTEM-MSG             30470300
ET0003            END-IF                                                30470400
ET0003         ELSE                                                     30470500
ET0003            IF ACATRSIO-FREEZE-SEC-IN                             30470600
ET0003               MOVE 'S' TO TWA-ACCT-FREEZ-TYPE                    30470700
ET0003               PERFORM 0824-ACCT-FREEZ-PROCESS                    30470800
ET0003               MOVE WS-SEC-FREEZE-MSG   TO SYSTEM-MSG             30470900
ET0003            ELSE                                                  30471000
ET0003               MOVE SPACE TO TWA-ACCT-FREEZ-TYPE                  30471100
ET0003            END-IF                                                30471200
ET0003         END-IF                                                   30471300
ET0003     END-IF.                                                      30471400
ET0003                                                                  30471500
LRM012     IF WS-CYCLE5-CUTOFF                                                  
LRM012         MOVE 'PAST CYCLE 5 CUTOFF ON LAST DAY / BROWSE ONLY'             
LRM012                                            TO SYSTEM-MSG                 
LRM012     END-IF.                                                              
       EJECT                                                            30471600
ET0003*                                                                 30471700
ET0003*----------------------------------------------------------------*30471800
ET0003* ACCOUNT IS FROZEN                                               30471900
ET0003*  (1) PROTECT ALL FIELDS EXCEPT SEARCH FIELDS.                   30472000
ET0003*  (2) CREATE REJECT RECORD IN ACTITRF.                           30473000
ET0003*  (3) UPDATE ACCT-FRZN-IND OF VTRNFR.                            30473100
ET0003*      ACCT-FRZN-IND = 'Y' MEANS ACCT FREEZE FOUND BY BATCH PROG  30473200
ET0003*      ACCT-FRZN-IND = 'O' MEANS ACCT FREEZE FOUND BY ONLINE PROG 30473300
ET0003*----------------------------------------------------------------*30473400
ET0003 0824-ACCT-FREEZ-PROCESS.                                         30473500
           SET CURSOR-ON-M4NEXT TO TRUE                                 30473600
                                                                        30473700
           MOVE ATT-ASKIP       TO MCDA                                 30473800
                                   M4ACCELA                             30473900
                                   M4ACCPTA                             30474000
                                   M4REJA                               30474100
                                   M4REJCA.                             30474200
                                                                        30474300
           IF TWA-INIT-TRANS-TYPE-CD = 'R'                              30474400
              CONTINUE                                                  30474500
           ELSE                                                         30474600
              MOVE 'S' TO TWA-M4REJC ACAT04IO-M4REJC                    30474700
              MOVE 'Y' TO M4REJCO                                       30474800
              MOVE ' ' TO TWA-M4REJ  ACAT04IO-M4REJ                     30474900
              MOVE ' ' TO M4REJO                                        30475000
              MOVE 'Y'                   TO ACAT04IO-ACCT-FREEZ-PROCESS 30476000
ET0004        MOVE ACAT-SIGN-ON-ID       TO ACAT04IO-SIGN-ON-ID         30476100
ET0004        MOVE ACAT-CICS-USER-NAME   TO ACAT04IO-USER-NAME          30476200
ET0004        MOVE ACAT-CICS-USER-ID     TO ACAT04IO-USER-ID            30476300
ET0004        MOVE ACAT-CICS-NETNAME     TO ACAT04IO-NET-NAME           30476400
              SET ACAT04IO-ISRT-VINITRNF TO TRUE                        30476500
              PERFORM 0500-CALL-ACAT04DA                                30476600
              IF ACAT04IO-DB2-ERROR                                     30476700
                 MOVE 'SELECT'           TO WS-DB2-ERROR-FUNCTION       30476800
                 MOVE ACAT04IO-SQLCAID   TO WS-DB2-ERROR-TABLE          30476900
                 MOVE ACAT04IO-SQLCODE   TO WS-DB2-ERROR-ID             30477000
                 MOVE WS-DB2-ERROR-MSG   TO TWA-RETURN-MSG              30477100
                 PERFORM 0830-ERROR-RTN                                 30477200
              END-IF                                                    30477300
              MOVE ACAT04IO-VINITRNF-CMNT TO TWA-VINITRNF-CMNT          30477400
           END-IF.                                                      30477500
                                                                        30477600
           IF TWA-ACCT-FRZN-IND = 'Y' OR 'O'                            30477700
              CONTINUE                                                  30477800
           ELSE                                                         30477900
              SET ACAT04IO-UPDT-FRZN-IND TO TRUE                        30478000
              PERFORM 0500-CALL-ACAT04DA                                30478100
           END-IF.                                                      30478200
       EJECT                                                            30478300
      /                                                                 30478400
       0830-ERROR-RTN.                                                  30478500
           SET ERROR-YES TO TRUE.                                       30478600
           IF  M4NEXTI = SPACE                                          30478700
               MOVE SPACES TO ACAT-INP-SEL                              30478800
                              ACAT-NEXT                                 30478900
           END-IF.                                                      30479000
           PERFORM 0810-MAP-INPUT-AREA  THRU 0810-EXIT.                 30480000
           MOVE EIBTRMID      TO TERM-ID.                               30490000
           MOVE 'ACA4'        TO TRAN-ID.                               30500000
           PERFORM 0600-DELETE-TSQ.                                     30510000
           PERFORM 0620-WRITE-TSQ.                                      30520000
           PERFORM 0850-SEND-MAP-DATA-ONLY.                             30530000
      /                                                                 30540000
       0840-CURSOR-POSITION.                                            30550000
                                                                        30560000
           EVALUATE WS-CURSOR                                           30570000
DJ0002          WHEN 'CD' MOVE -1 TO MCDL                               30580000
DJ0002                    MOVE ATT-UNPROT-BRT  TO MCDA                  30590000
                WHEN 'NX' MOVE -1 TO M4NEXTL                            30600000
                          MOVE ATT-UNPROT-BRT  TO M4NEXTA               30610000
                WHEN 'AP' MOVE -1 TO M4ACCPTL                           30620000
                          MOVE ATT-UNPROT-BRT  TO M4ACCPTA              30630000
                WHEN 'AX' MOVE -1 TO M4ACCELL                           30640000
                          MOVE ATT-UNPROT-BRT  TO M4ACCELA              30650000
                WHEN 'RJ' MOVE -1 TO M4REJL                             30660000
                          MOVE ATT-UNPROT-BRT  TO M4REJA                30670000
                WHEN 'RC' MOVE -1 TO M4REJCL                            30680000
                          MOVE ATT-UNPROT-BRT  TO M4REJCA               30690000
                WHEN 'BR' MOVE -1 TO MMBRL                              30700000
                          MOVE ATT-UNPROT-BRT  TO MMBRA                 30710000
                WHEN 'AC' MOVE -1 TO MMACL                              30720000
                          MOVE ATT-UNPROT-BRT  TO MMACA                 30730000
                WHEN 'RR' MOVE -1 TO MMRRL                              30740000
                          MOVE ATT-UNPROT-BRT  TO MMRRA                 30750000
                WHEN 'TR' MOVE -1 TO MMTFRL                             30760000
                          MOVE ATT-UNPROT-BRT  TO MMTFRA                30770000
                WHEN 'BK' MOVE -1 TO MMBKRL                             30780000
                          MOVE ATT-UNPROT-BRT  TO MMBKRA                30790000
                WHEN 'ST' MOVE -1 TO MMSTATL                            30800000
                          MOVE ATT-UNPROT-BRT  TO MMSTATA               30810000
                WHEN OTHER MOVE -1 TO M4NEXTL                           30820000
           END-EVALUATE.                                                30830000
                                                                        30840000
DJ0001     IF NOT ACAT-SIGN-ON-UPDATE                                   30850000
DJ0001        MOVE ATT-PROT  TO M4ACCELA M4ACCPTA M4REJA M4REJCA        30860000
DJ0002        MOVE ATT-PROT  TO MCDA                                    30870000
DJ0001     END-IF.                                                      30880000
      /                                                                 30890000
       0850-SEND-MAP-DATA-ONLY.                                         30900000
                                                                        30910000
           PERFORM 0150-GET-DATE-TIME-RTN.                              30920000
           MOVE 'ACAX'        TO  MTRANSO.                              30930000
           MOVE WSMMDDYY      TO  MDATEO.                               30940000
           MOVE WSTIME        TO  MTIMEO.                               30950000
           MOVE ACAT-CLIENT-NO  TO MCLINBO.                             30960000
                                                                        30970000
      ***  MAP HEADER                                                   30980000
           EXEC CICS SEND MAP('HDRMAP')                                 30990000
                     MAPSET('ACAT00M')                                  31000000
                     FROM (HDRMAPO)                                     31010000
                     DATAONLY                                           31020000
                     ACCUM                                              31030000
           END-EXEC.                                                    31040000
                                                                        31050000
      ***  MAP BODY                                                     31060000
                                                                        31070000
           PERFORM 0840-CURSOR-POSITION.                                31080000
                                                                        31090000
                                                                        31100000
           EXEC CICS SEND MAP('ACAT04M')                                31110000
                     MAPSET('ACAT04M')                                  31120000
                     FROM(ACAT04MO)                                     31130000
                     CURSOR                                             31140000
                     DATAONLY                                           31150000
                     ACCUM                                              31160000
           END-EXEC.                                                    31170000
                                                                        31180000
      ***  MAP TRAILER                                                  31190000
           MOVE ATT-ASKIP-BRT  TO  TRLMSGA.                             31200000
LRM008     IF ACAT-ASCENDIS-CLIENT                                      31201000
LRM008     AND (SYSTEM-MSG(1 : 10) = LOW-VALUES OR SPACES)              31210000
LRM008        MOVE 'ASCENDIS CLIENT / BROWSE ONLY' TO  SYSTEM-MSG       31210100
LRM008     END-IF.                                                      31210200
                                                                        31210300
           IF SYSTEM-MSG(1 : 10) = LOW-VALUES                           31211000
              MOVE SPACES         TO  TRLMSGO                           31220000
           ELSE                                                         31230000
              MOVE SYSTEM-MSG     TO  TRLMSGO.                          31240000
           EXEC CICS SEND MAP('TRLMAP')                                 31250000
                     MAPSET('ACAT00M')                                  31260000
                     FROM(TRLMAPO)                                      31270000
                     DATAONLY                                           31280000
                     CURSOR                                             31290000
                     ACCUM                                              31300000
           END-EXEC.                                                    31310000
           EXEC CICS SEND PAGE                                          31320000
           END-EXEC.                                                    31330000
           IF EIBRCODE NOT EQUAL LOW-VALUES                             31340000
              MOVE '0850-SEND-MAP-DATA ' TO WS-CICS-DISPLAY             31350000
              MOVE EIBRCODE          TO WS-CICS-RC                      31360000
              MOVE WS-CICS-MSG       TO WS-MSG-OUT                      31370000
              PERFORM 0920-SEND-MSG-RETURN-TO-CICS                      31380000
           ELSE                                                         31390000
              MOVE 'ACAT04RS' TO ACAT-PROGRAM-NAME                      31400000
              MOVE 'C'      TO ACAT-NEXT, ACAT-INP-SEL                  31410000
              PERFORM 0900-RETURN-TO-CICS.                              31420000
      /                                                                 31430000
       0870-SEND-MAP-ERASE.                                             31440000
                                                                        31450000
           PERFORM 0150-GET-DATE-TIME-RTN.                              31460000
           MOVE 'ACAX'        TO  MTRANSO.                              31470000
           MOVE WSMMDDYY      TO  MDATEO.                               31480000
           MOVE WSTIME        TO  MTIMEO.                               31490000
           MOVE ACAT-CLIENT-NO  TO MCLINBO.                             31500000
      ***  MAP HEADER                                                   31510000
           EXEC CICS SEND MAP('HDRMAP')                                 31520000
                     MAPSET('ACAT00M')                                  31530000
                     FROM (HDRMAPO)                                     31540000
                     ERASE                                              31550000
                     ACCUM                                              31560000
           END-EXEC.                                                    31570000
                                                                        31580000
           PERFORM 0840-CURSOR-POSITION.                                31590000
                                                                        31600000
           EXEC CICS SEND MAP('ACAT04M')                                31610000
                     MAPSET('ACAT04M')                                  31620000
                     FROM(ACAT04MO)                                     31630000
                     CURSOR                                             31640000
                     ACCUM                                              31650000
           END-EXEC.                                                    31660000
                                                                        31670000
      ***  MAP TRAILER                                                  31680000
LRM008     IF ACAT-ASCENDIS-CLIENT                                      31681000
LRM008     AND (SYSTEM-MSG(1 : 10) = LOW-VALUES OR SPACES)              31682000
LRM008        MOVE 'ASCENDIS CLIENT / BROWSE ONLY' TO  SYSTEM-MSG       31683000
LRM008     END-IF.                                                      31684000
           MOVE SPACES         TO  TRLMSGO.                             31690000
           MOVE SYSTEM-MSG     TO  TRLMSGO.                             31700000
           MOVE ATT-ASKIP-BRT  TO  TRLMSGA.                             31710000
           EXEC CICS SEND MAP('TRLMAP')                                 31720000
                     MAPSET('ACAT00M')                                  31730000
                     FROM(TRLMAPO)                                      31740000
                     CURSOR                                             31750000
                     ACCUM                                              31760000
           END-EXEC.                                                    31770000
           EXEC CICS SEND PAGE                                          31780000
           END-EXEC.                                                    31790000
           IF EIBRCODE NOT EQUAL LOW-VALUES                             31800000
              MOVE '0870-SEND-MAP-ERASE' TO WS-CICS-DISPLAY             31810000
              MOVE EIBRCODE          TO WS-CICS-RC                      31820000
              MOVE WS-CICS-MSG       TO WS-MSG-OUT                      31830000
              PERFORM 0920-SEND-MSG-RETURN-TO-CICS                      31840000
           ELSE                                                         31850000
              MOVE 'ACAT04RS' TO ACAT-PROGRAM-NAME                      31860000
              MOVE 'C'      TO ACAT-NEXT, ACAT-INP-SEL                  31870000
              PERFORM 0900-RETURN-TO-CICS.                              31880000
      /                                                                 31890000
       0900-RETURN-TO-CICS.                                             31900000
                                                                        31910000
12/16      IF TWA-SRCH-VTRNFR-PND   AND                                 31920000
              ACAT-CALLING-PROG-NAME NOT = 'ACAT21PT'                   31930000
              MOVE 'ACAT21PT' TO ACAT-CALLING-PROG-NAME                 31940000
           END-IF.                                                      31950000
                                                                        31960000
           EXEC CICS RETURN                                             31970000
                     TRANSID('ACAX')                                    31980000
                     COMMAREA(ACATCOMM-COMMAREA)                        31990000
           END-EXEC.                                                    32000000
                                                                        32010000
       0910-RETURN-CONTROL-RTN.                                         32020000
           EXEC CICS SEND CONTROL                                       32030000
                            ERASE                                       32040000
                           FREEKB                                       32050000
           END-EXEC.                                                    32060000
           EXEC CICS XCTL PROGRAM ('RATT01')                            32070000
           END-EXEC.                                                    32080000
           EXEC CICS RETURN                                             32090000
           END-EXEC.                                                    32100000
                                                                        32110000
       0920-SEND-MSG-RETURN-TO-CICS.                                    32120000
           EXEC CICS                                                    32130000
                SEND                                                    32140000
                FROM (WS-MSG-OUT)                                       32150000
                ERASE                                                   32160000
           END-EXEC.                                                    32170000
                                                                        32180000
           EXEC CICS                                                    32190000
                RETURN                                                  32200000
           END-EXEC.                                                    32210000
                                                                        32220000
ET0003*                                                                 32230000
ET0003*----------------------------------------------------------------*32240000
ET0003*    CALL ACCOUNT FREEZ IO MODULE                                 32250000
ET0003*----------------------------------------------------------------*32260000
ET0003 1010-LINK-TO-ACFREEZ-IO.                                         32270000
ET0003     EXEC CICS LINK PROGRAM (WS-ACFREEZ)                          32280000
ET0003          COMMAREA(ACATRSTIO-CALL-AREA)                           32281000
ET0003          LENGTH(LENGTH OF ACATRSTIO-CALL-AREA)                   32282000
ET0003     END-EXEC.                                                    32283000
ET0003                                                                  32284000
       HANG-CICS.                                                       32285000
           GOBACK.                                                      32286000
      ******************************************************************32287000
      *    END OF ACAT04RS                                             *32288000
      ******************************************************************32289000
