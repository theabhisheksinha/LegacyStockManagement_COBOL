000001* PDX    - CAT500A  C0344128 09/16/13 09:52:07 TBLAMUR            00001000
000001* LRM014 SSR 94296 RECOMPILE FOR EXPANDED BNWMASTW AND CHANGE FD.         
000001* PDX    - CAT500A  C0334180 11/26/12 15:49:23 TBLAMUR            00001000
000001* LRM013 - SSR 89315 PASS WITHHELD ASSETS TO ASCENDIS AS TRANS=W          
000001* PDX    - CAT500A  C0275568 04/03/09 14:55:25 TBDOJUN            00001000
000001* DJ0007 SSR 61065 BH-MF-EXBR-OPTION(537483)=1,USE MF EXBR TABLE  00001000
000001* DJ0007 FOR THE MUTUAL FUND EXECUTING BROKER NUMBER              00001000
000001* PDX    - CAT500A  C0275600 01/14/09 16:14:43 TBLAMUR            00001000
000001* LRM012 - TASK 62679 BYPASS INIT ASSETS MARKED AS WITHHOLD.              
000001* PDX    - CAT500A  C0273186 11/18/08 13:23:28 TBLAMUR            00001000
000001* LRM011 - ASCENDIS CONTINUED.  CORRECT PARALLEL ASCENDIS EXTRACT         
000001* LRM011 - BY MARKING ACK_IND = S TI,AT TO X FIRST, THEREBY               
000001* LRM011 - CAUSING THEM TO BE SENT ONCE.                                  
000001* PDX    - CAT500A  C0270214 10/21/08 11:38:28 TBLAMUR            00001000
000001* LRM010 - SSR# 55766 ASCENDIS CONTINUED.  ASSURE ONLY                    
000001* LRM010 -  PTR,PTD AND FUL GO TO ASCENDIS.                               
000001* LRM010 -  ALLOW PTR REJECT TO GO OUT ON CYCLE 4.                        
000001* LRM010 - PARALLEL MODE, B1 434735 = 2, EXTRACT ACK-IND = 'P'            
000001* LRM010 - AND SET TO 'S' PULL FOR CAT501A.  WHEN ALREADY 'S'             
000001* LRM010 - SET TO 'X' SENT (CAT501A TO IGNORE).                           
000001* LRM010 - DO NOT UPDATE CYCLE, NSCC-PEND IN PARALLEL MODE.               
000001* PDX    - CAT500A  C0260091 04/30/08 10:54:42 TBLAMUR            00001000
000001* LRM009 - SSR# 55766 ASCENDIS INTEGRATION ADD PARM TO DEPICT             
000001* LRM009 - ASCENDIS NSCC FEED VS. ASCENDIS SINGLE CLIENT FEED.            
000001* LRM009 - BATCH BUILDS ROWS NSCC_ACK_IND = A, MEANING SEND               
000001* LRM009 - TO ASCENDIS.  THIS RUNS INTRA DAY AND AT NIGHT.                
000001* LRM009 - F/R SELECTION LOGIC COMMENTED OUT.                             
       IDENTIFICATION DIVISION.                                         00590000
       PROGRAM-ID.  CAT500A.                                            00600000
       DATE-WRITTEN.  APRIL 2008.                                       00610000
                                                                        00620000
      ***************************************************************** 00630000
      *                         REMARKS                               * 00640000
      ***************************************************************** 00650000
      * THIS PROGRAM SELECTS RECORDS FROM ACTITRF, ACTIAST, ACTIMF,   * 00660000
      * ACTIOPN, VFNDRGST, VFNDNA, VFNDPYBL, VFNDPYNA TABLES AND      * 00670000
      * CREATES NSCC INBOUND FILE WITH TI, AT AND FR RECORDS.         * 00680000
      * SPECIAL VERSION TO EXTRACT NSCC_ACK_IND = A ONLY TO SEND TO   * 00690000
      *          THE ASCENDIS SYSTEM.                                 * 00700000
      *          CAT500A SELECTS AND UPDATES NSCC_ACK_IND = 'U' AND   * 00710000
      *                 STORE CYCLE NUMBER IN CYCLE_CD.               * 00720000
      *                 THE 'U' DENOTES 'UNDER ASCENDIS CONTROL'      * 00730000
      *                 CAUSING VARIOUS ACAX FUNCTIONS TO BE BLOCKED. * 00740000
      *          CAT501 READS DB2 TABLE MATCH WITH NSCC_ACK_IND = 'U' * 00750000
      *                 AND CYCLE_CD WITH CYCLE-NBR IN CYCLE LOG      * 00770000
      *                 WRITES OUT TRANSMISSION FILE                  * 00780000
      ***************************************************************** 00790000
      ***************************************************************** 00800000
       ENVIRONMENT DIVISION.                                            00810000
      ***************************************************************** 00820000
       INPUT-OUTPUT SECTION.                                            00830000
       FILE-CONTROL.                                                    00840000
                                                                        00850000
           SELECT CYCLE-LOG                     ASSIGN  TO  CYCLELOG    00860000
                  ORGANIZATION IS INDEXED                               00870000
                  ACCESS MODE  IS DYNAMIC                               00880000
                  RECORD KEY   IS CYCLE-LOG-KEY                         00890000
                  FILE STATUS  IS CYCLE-LOG-STATUS.                     00900000
                                                                        00910000
           SELECT NTWREG-FILE                   ASSIGN  TO  NTWREGOP    00920000
                  ORGANIZATION IS  INDEXED                              00930000
                  ACCESS       IS  DYNAMIC                              00940000
                  RECORD KEY   IS  NTWREG-KEY-IN                        00950000
                  FILE STATUS  IS  NTWREG-FILE-STATUS.                  00960000
                                                                        00970000
           SELECT NTWMAST-FILE                  ASSIGN TO   NTWMAST     00980000
                  ACCESS       IS  DYNAMIC                              00990000
                  ORGANIZATION IS  INDEXED                              01000000
                  RECORD KEY   IS  NTWMAST-KEY-IN                       01010000
                  FILE STATUS  IS  NTWMAST-FILE-STATUS.                 01020000
                                                                        01030012
DJ0007     SELECT MFEXBR            ASSIGN TO MFEXBR                    01030012
DJ0007            ACCESS            RANDOM                              01030012
DJ0007            ORGANIZATION      INDEXED                             01030012
DJ0007            RECORD KEY IS     EXBR-KEY                            01030012
DJ0007            FILE STATUS IS    MFEXBR-STATUS.                      01030012
                                                                        01030012
DJ0006     SELECT ACATACTF         ASSIGN      TO ACATACTF              01040025
DJ0006                             FILE STATUS IS ACATACTF-FILE-STATUS. 01050025
                                                                        01060000
      ***************************************************************** 01070000
       DATA DIVISION.                                                   01080000
      ***************************************************************** 01090000
                                                                        01100000
       FILE SECTION.                                                    01110000
                                                                        01120000
       FD  CYCLE-LOG.                                                   01130000
       01  CYCLE-LOG-REC.                                               01140000
           05  CYCLE-LOG-KEY                      PIC X(25).            01150000
           05  FILLER                             PIC X(175).           01160000
                                                                        01170000
       FD  NTWREG-FILE.                                                 01180000
       01  NTWREG-RECORD.                                               01190000
           05  NTWREG-KEY-IN                PIC  X(18).                 01200000
           05  FILLER                       PIC  X(262).                01210000
                                                                        01220000
       FD  NTWMAST-FILE.                                                01230000
       01  NTWMAST-RECORD.                                              01240000
           05  NTWMAST-KEY-IN               PIC  X(39).                 01250000
LRM014     05  FILLER                       PIC  X(1121).               01260000
                                                                        01270012
DJ0007 FD  MFEXBR.                                                      01270012
DJ0007 01  MFEXBR-REC.                                                  01270012
DJ0007     COPY MFEXBR.                                                 01270012
                                                                        01270012
DJ0006 FD  ACATACTF                                                     01280025
DJ0006     RECORDING MODE IS F                                          01290012
DJ0006     BLOCK CONTAINS 0 RECORDS.                                    01300012
DJ0006     COPY ACATACTF REPLACING ==:ACATACTF:== BY ==ACATACTF==.      01310025
           EJECT                                                        01320000
      ******************************************************************01330000
       WORKING-STORAGE SECTION.                                         01340000
      ******************************************************************01350000
           COPY PDXIDCOB.                                               01360012
                                                                        01370000
       77  CYCLE-LOG-STATUS              PIC  X(02)  VALUE '00'.        01380000
       77  NTWREG-FILE-STATUS            PIC  X(02)  VALUE '00'.        01390000
       77  NTWMAST-FILE-STATUS           PIC  X(02)  VALUE '00'.        01400000
       77  ABEND-CODE              COMP  PIC S9(4)   VALUE +9999.       01410000
       77  WS-STREAM-IND                 PIC  X(01)  VALUE SPACES.      01420000
       77  WS-CLIENT                     PIC  X(04)  VALUE SPACES.      01430000
LRM005 77  WS-ADP-BROKER                 PIC  X(04)  VALUE SPACES.      01440000
       77  WS-LAST-PROC-DATE             PIC  9(08)  VALUE 0.           01450000
       77  WS-LAST-CYCLE-NBR             PIC  9(04)  VALUE 0.           01460000
       77  WS-PYBL-NBR             COMP  PIC S9(04)  VALUE ZEROES.      01470000
       77  WS-TO-TMSTMP                  PIC  X(26)  VALUE SPACES.      01480000
       77  WS-FROM-TMSTMP                PIC  X(26)  VALUE SPACES.      01490000
       77  WS-MULTI-BATCH-NBR            PIC  9(04).                    01500000
       77  WS-MULTI-BATCH-NBR-ALPHA                                     01510000
           REDEFINES WS-MULTI-BATCH-NBR  PIC  X(04).                    01520000
       77  WS-REC-CNTR           COMP-3  PIC  9(09)  VALUE ZEROES.      01530000
       77  WS-TOTAL-TI-REC-CNTR  COMP-3  PIC  9(09)  VALUE ZEROES.      01540000
       77  WS-TOTAL-AT-REC-CNTR  COMP-3  PIC  9(09)  VALUE ZEROES.      01550000
       77  WS-TOTAL-FR-REC-CNTR  COMP-3  PIC  9(09)  VALUE ZEROES.      01560000
       77  WS-TOTAL-REC-CNTR     COMP-3  PIC  9(09)  VALUE ZEROES.      01570000
       77  WS-TI-FETCH-CNTR      COMP-3  PIC  9(09)  VALUE ZEROES.      01580000
       77  WS-AT1-FETCH-CNTR     COMP-3  PIC  9(09)  VALUE ZEROES.      01590000
       77  WS-AT2-FETCH-CNTR     COMP-3  PIC  9(09)  VALUE ZEROES.      01600000
       77  WS-FR-FETCH-CNTR      COMP-3  PIC  9(09)  VALUE ZEROES.      01610000
       77  WS-TI-UPDT-CNTR       COMP-3  PIC  9(09)  VALUE ZEROES.      01620000
LRM011 77  WS-TI-UPDT-PARA-CNTR  COMP-3  PIC  9(09)  VALUE ZEROES.      01620000
LRM011 77  WS-AT-UPDT-PARA-CNTR  COMP-3  PIC  9(09)  VALUE ZEROES.      01630000
       77  WS-AT1-UPDT-CNTR      COMP-3  PIC  9(09)  VALUE ZEROES.      01630000
       77  WS-AT2-UPDT-CNTR      COMP-3  PIC  9(09)  VALUE ZEROES.      01640000
LRM010 77  WS-TI-UPDT-CNTR-S     COMP-3  PIC  9(09)  VALUE ZEROES.      01620000
LRM010 77  WS-AT1-UPDT-CNTR-S    COMP-3  PIC  9(09)  VALUE ZEROES.      01630000
LRM010 77  WS-AT2-UPDT-CNTR-S    COMP-3  PIC  9(09)  VALUE ZEROES.      01640000
       77  WS-AT-MF-CNTR         COMP-3  PIC  9(09)  VALUE ZEROES.      01650000
       77  WS-FR-UPDT-CNTR       COMP-3  PIC  9(09)  VALUE ZEROES.      01660000
       77  WS-TI-ACUTF-CNTR      COMP-3  PIC  9(09)  VALUE ZEROES.      01670000
       77  WS-AT-ACUTF-CNTR      COMP-3  PIC  9(09)  VALUE ZEROES.      01680000
       77  WS-FR-ACUTF-CNTR      COMP-3  PIC  9(09)  VALUE ZEROES.      01690000
       77  WS-PAYABLE-NBR          COMP  PIC S9(04)  VALUE ZEROES.      01700000
       77  NA-LINE-CNTR                  PIC  9(01)  VALUE ZEROES.      01710000
       77  WS-COMP-2             COMP-2              VALUE ZEROES.      01720000
       77  B1-SUB                        PIC  9(03)  VALUE ZEROES.      01730000
       77  S1                            PIC  9(03)  VALUE ZEROES.      01740000
       77  S2                            PIC  9(01)  VALUE ZEROES.      01750000
       77  S3                            PIC  9(01)  VALUE ZEROES.      01760000
       77  S4                            PIC  9(03)  VALUE ZEROES.      01770000
       77  NTW-HOUSE-ACCOUNT             PIC  X(20)  VALUE SPACES.      01780000
DJ0006 77  WS-DELETE-CLIENT              PIC  X(04)  VALUE SPACES.      08900000
DJ0006 77  WS-DELETE-ACTIAST-SW          PIC  X(01)  VALUE SPACES.      08900000
DJ0006     88  FOUND-ACTIAST-INIT-DELETE             VALUE 'Y'.         06230037
           COPY STUBCPY.                                                01790000
           03  CKDIGIT                   PIC X(08) VALUE 'CKDIGIT '.    01800000
DJ0007     03  BMFSEC                    PIC X(8)  VALUE 'BMFSEC  '.    01800000
                                                                        01810000
DJ0005 01  W-CKDIGIT.                                                   01820000
DJ0005     03 W-CKDIGIT-PARM.                                           01830000
DJ0005        05 W-CKDIGIT-LEN             PIC 9(02) VALUE 9.           01840000
DJ0005        05 W-CKDIGIT-ACCT-TC.                                     01850000
DJ0005           07 W-CKDIGIT-ACCT-T.                                   01860000
DJ0005              09 W-CKDIGIT-BRN-ACCT    PIC X(08).                 01870000
DJ0005              09 W-CKDIGIT-TYPE        PIC X(01).                 01880000
DJ0005           07 W-CKDIGIT-CK             PIC X(01) VALUE ' '.       01890000
DJ0005        05 W-CKDIGIT-ACCT-TC-1.                                   01900000
DJ0005           07 W-CKDIGIT-ACCT-T-1.                                 01910000
DJ0005              09 W-CKDIGIT-BRN-ACCT-1  PIC X(08).                 01920000
DJ0005              09 W-CKDIGIT-TYPE-1      PIC X(01).                 01930000
DJ0005           07 W-CKDIGIT-CK-1           PIC X(01) VALUE ' '.       01940000
                                                                        01950000
       01  WS-BRCH-ACCT-TC.                                             01960000
           05  WS-BRCH-ACCT-T.                                          01970000
               10  WS-BRCH-ACCT.                                        01980000
                   15  WS-BRCH           PIC  X(03)  VALUE SPACES.      01990000
                   15  WS-ACCT           PIC  X(05)  VALUE SPACES.      02000000
               10  WS-T                  PIC  X(01)  VALUE SPACES.      02010000
           05  WS-C                      PIC  X(01)  VALUE SPACES.      02020000
                                                                        02030000
       01  WS-TC                         PIC  X(02)  VALUE SPACES.      02040000
                                                                        02050000
LRM001 01  NS-BRCH-ACCT-TC.                                             02060000
LRM001     05  NS-BRCH-ACCT.                                            02070000
LRM001         10  NS-BRCH                  PIC  X(03).                 02080000
LRM001         10  NS-ACCT                  PIC  X(05).                 02090000
LRM001         10  NS-T                     PIC  X(01).                 02100000
LRM001     05 NS-C                          PIC  X(01).                 02110000
                                                                        02120000
DJ0001 01  W-MAST-KEY-SAVE               PIC  X(39)  VALUE SPACES.      02130000
DJ0001 01  W-REG-OPT-KEY-SAVE            PIC  X(18)  VALUE SPACES.      02140000
                                                                        02150000
       01  FILLER                        PIC  X(20)  VALUE              02160000
           'TIME PLAYGROUND'.                                           02170000
                                                                        02180000
       01  FILLER.                                                      02190000
           05  WS-TMSTMP-TIME                PIC  X(26).                02200000
           05  WS-TMSTMP-AREA REDEFINES                                 02210000
               WS-TMSTMP-TIME.                                          02220000
               10  FILLER                    PIC  X(11).                02230000
               10  WS-TMSTMP-HH              PIC  9(02).                02240000
               10  FILLER                    PIC  X(01).                02250000
               10  WS-TMSTMP-MM              PIC  9(02).                02260000
               10  FILLER                    PIC  X(01).                02270000
               10  WS-TMSTMP-SS              PIC  9(02).                02280000
               10  FILLER                    PIC  X(01).                02290000
               10  WS-TMSTMP-NNS             PIC  9(06).                02300000
                                                                        02310000
           05  WS-CURRENT-AREA.                                         02320000
               10  WS-CURRENT-HH             PIC  9(02).                02330000
               10  WS-CURRENT-MM             PIC  9(02).                02340000
               10  WS-CURRENT-SS             PIC  9(02).                02350000
               10  WS-CURRENT-NNS            PIC  9(06).                02360000
           05  WS-CURRENT-TIME REDEFINES                                02370000
               WS-CURRENT-AREA               PIC  9(12).                02380000
                                                                        02390000
           05  WS-TIA-TIME-AREA.                                        02400000
               10  WS-TIA-HHMM               PIC  9(04).                02410000
               10  WS-TIA-SS                 PIC  9(08).                02420000
           05  WS-TIA-TIME REDEFINES                                    02430000
               WS-TIA-TIME-AREA              PIC  9(12).                02440000
                                                                        02450000
           05  WS-TIC-TIME-AREA.                                        02460000
               10  WS-TIC-HHMM               PIC  9(04).                02470000
               10  WS-TIC-SS                 PIC  9(08).                02480000
           05  WS-TIC-TIME REDEFINES                                    02490000
               WS-TIC-TIME-AREA              PIC  9(12).                02500000
                                                                        02510000
           05  WS-TIRD-TIME-AREA.                                       02520000
               10  WS-TIRD-HHMM              PIC  9(04).                02530000
               10  WS-TIRD-SS                PIC  9(08).                02540000
           05  WS-TIRD-TIME REDEFINES                                   02550000
               WS-TIRD-TIME-AREA             PIC  9(12).                02560000
                                                                        02570000
           05  WS-TIRR-TIME-AREA.                                       02580000
               10  WS-TIRR-HHMM              PIC  9(04).                02590000
               10  WS-TIRR-SS                PIC  9(08).                02600000
           05  WS-TIRR-TIME REDEFINES                                   02610000
               WS-TIRR-TIME-AREA             PIC  9(12).                02620000
                                                                        02630000
           05  WS-TIX-TIME-AREA.                                        02640000
               10  WS-TIX-HHMM               PIC  9(04).                02650000
               10  WS-TIX-SS                 PIC  9(08).                02660000
           05  WS-TIX-TIME REDEFINES                                    02670000
               WS-TIX-TIME-AREA              PIC  9(12).                02680000
                                                                        02690000
           05  WS-ATA-TIME-AREA.                                        02700000
               10  WS-ATA-HHMM               PIC  9(04).                02710000
               10  WS-ATA-SS                 PIC  9(08).                02720000
           05  WS-ATA-TIME REDEFINES                                    02730000
               WS-ATA-TIME-AREA              PIC  9(12).                02740000
                                                                        02750000
           05  WS-ATCD-TIME-AREA.                                       02760000
               10  WS-ATCD-HHMM              PIC  9(04).                02770000
               10  WS-ATCD-SS                PIC  9(08).                02780000
           05  WS-ATCD-TIME REDEFINES                                   02790000
               WS-ATCD-TIME-AREA             PIC  9(12).                02800000
                                                                        02810000
LRM001     05  WS-ATRD-TIME-AREA.                                       02820000
LRM001         10  WS-ATRD-HHMM              PIC  9(04).                02830000
LRM001         10  WS-ATRD-SS                PIC  9(08).                02840000
LRM001     05  WS-ATRD-TIME REDEFINES                                   02850000
LRM001         WS-ATRD-TIME-AREA             PIC  9(12).                02860000
                                                                        02870000
           05  WS-FRA-TIME-AREA.                                        02880000
               10  WS-FRA-HHMM               PIC  9(04).                02890000
               10  WS-FRA-SS                 PIC  9(08).                02900000
           05  WS-FRA-TIME REDEFINES                                    02910000
               WS-FRA-TIME-AREA              PIC  9(12).                02920000
                                                                        02930000
       01  CLIENT-TABLE-CNTR             PIC  9(04)  VALUE 0.           02940000
                                                                        02950000
       01  CLIENT-TABLE-AREA.                                           02960000
           05  CLIENT-TABLE OCCURS 500 TIMES.                           02970000
               10  CLIENT-NUM            PIC  9(04)  VALUE ZEROES.      02980000
LRM005         10  CLIENT-ADP-BROKER     PIC  X(04)  VALUE SPACES.      02990000
               10  CLIENT-B1-434503      PIC  X(01)  VALUE SPACES.      03000000
               10  CLIENT-B1-434619      PIC  X(01)  VALUE SPACES.      03010000
               10  CLIENT-B1-434636      PIC  X(04)  VALUE SPACES.      03020000
               10  CLIENT-B1-540167.                                    03030000
                   15 CLIENT-B1-EXEC-BKR-REC-NO  PIC 9(03) COMP-3.      03040000
                   15 CLIENT-B1-EXEC-BKR-REC.                           03050000
                      20  CLIENT-B1-EXEC-BKR-ENTRY OCCURS 200 TIMES.    03060000
                          25  CLIENT-B1-EXEC-BKR-LO    PIC  X(03).      03070000
                          25  CLIENT-B1-EXEC-BKR-HI    PIC  X(03).      03080000
                          25  CLIENT-B1-EXEC-BKR-CLEAR PIC  X(04).      03090000
LRM001         10  CLIENT-B1-NS-BRCH-NSCC-BOX PIC X(10).                03100000
DJ0005         10  CLIENT-B1-SINGLE-FUND-ACCOUNT PIC X(1).              03110000
LRM009         10  CLIENT-B1-ASCENDIS    PIC  X(01)  VALUE SPACES.      03010000
DJ0007         10  CLIENT-B1-EXBR-OPTION PIC X(1).                      03010000
               10  CLIENT-TI-REC-CNTR    PIC  9(09)  COMP-3  VALUE 0.   03120000
               10  CLIENT-AT-REC-CNTR    PIC  9(09)  COMP-3  VALUE 0.   03130000
               10  CLIENT-FR-REC-CNTR    PIC  9(09)  COMP-3  VALUE 0.   03140000
LRM010         10  CLIENT-TI-REC-CNTR-S  PIC  9(09)  COMP-3  VALUE 0.   03120000
LRM010         10  CLIENT-AT-REC-CNTR-S  PIC  9(09)  COMP-3  VALUE 0.   03130000
LRM010         10  CLIENT-FR-REC-CNTR-S  PIC  9(09)  COMP-3  VALUE 0.   03140000
               10  CLIENT-ALL-REC-CNTR   PIC  9(09)  COMP-3  VALUE 0.   03150000
                                                                        03160000
       01  WS-CUST-NA-AREA.                                             03170000
           05  WS-CUST-NA-TABLE OCCURS 3 TIMES.                         03180000
               10  WS-CUST-NA-1          PIC  X(35)  VALUE SPACES.      03190000
               10  WS-CUST-NA-2          PIC  X(35)  VALUE SPACES.      03200000
               10  FILLER                PIC  X(23)  VALUE SPACES.      03210000
                                                                        03220000
       01  WS-ORIGINATOR.                                               03230000
           05  FILLER                    PIC  X(03)  VALUE 'ADP'.       03240000
           05  WS-ORIGINATOR-STREAM      PIC  X(01)  VALUE ' '.         03250000
                                                                        03260000
       01  WS-BPD-PROC-DATE.                                            03270000
           05  WS-BPD-CC                 PIC  X(02).                    03280000
           05  WS-BPD-YY                 PIC  X(02).                    03290000
           05  WS-BPD-MM                 PIC  X(02).                    03300000
           05  WS-BPD-DD                 PIC  X(02).                    03310000
                                                                        03320000
       01  WS-DATE-MMDDCCYY.                                            03330000
           05  WS-DATE-MM                PIC  X(02).                    03340000
           05  WS-DATE-DD                PIC  X(02).                    03350000
           05  WS-DATE-CC                PIC  X(02).                    03360000
           05  WS-DATE-YY                PIC  X(02).                    03370000
                                                                        03380000
       01  FILLER                        PIC  X(12)  VALUE              03390000
           'SWITCHES'.                                                  03400000
                                                                        03410000
       01  NTW-HOUSE-ACCT-SW             PIC  X(01)  VALUE 'N'.         03420000
           88  NTW-HOUSE-ACCT                        VALUE 'Y'.         03430000
                                                                        03440000
       01  NTW-OMNIBUS-ACCT-SW           PIC  X(01)  VALUE 'N'.         03450000
           88  NTW-OMNIBUS-ACCT                      VALUE 'Y'.         03460000
LRM004     88  NTW-DST-MFE-ACCT                      VALUE 'D'.         03470000
                                                                        03480000
LRM004 01  WS-DST-BOX-ACCT-TC.                                          03490000
LRM004     05  WS-DST-BRCH-ACCT.                                        03500000
LRM004         10  WS-DST-BRCH              PIC  X(03).                 03510000
LRM004         10  WS-DST-ACCT              PIC  X(05).                 03520000
LRM004         10  WS-DST-T                 PIC  X(01).                 03530000
LRM004     05 WS-DST-C                      PIC  X(01).                 03540000
                                                                        03550000
LRM001 01  NTW-NSCCSRC-ACCT-FLAG         PIC  X(01)  VALUE SPACES.      03560000
LRM001     88  NTW-NSCCSRC-ACCT                      VALUE 'Y'.         03570000
LRM001     88  NTW-NOT-NSCCSRC-ACCT                  VALUE 'N'.         03580000
                                                                        03590000
       01  IO-SUCCESSFUL-SW              PIC  X(01)  VALUE 'N'.         03600000
           88  IO-SUCCESSFUL                         VALUE 'Y'.         03610000
                                                                        03620000
       01  RANGE-FOUND                   PIC  X(01)  VALUE 'N'.         03630000
                                                                        03640000
       01  FILLER.                                                      03650000
           05  FETCH-IND                 PIC  X(01)  VALUE '1'.         03660000
TCK  ***** 05  CUTOFF-IND                PIC  X(01).                    03670000
TCK  *****     88  BEFORE-CUTOFF                     VALUE 'B'.         03680000
TCK  *****     88  AFTER-CUTOFF                      VALUE 'A'.         03690000
TCK        05  TI-CUTOFF-IND             PIC  X(01)  VALUE SPACE.       03700000
TCK            88  BEFORE-CUTOFF-TI                  VALUE 'B'.         03710000
TCK            88  AFTER-CUTOFF-TI                   VALUE 'A'.         03720000
TCK        05  AT-CUTOFF-IND             PIC  X(01)  VALUE SPACE.       03730000
TCK            88  BEFORE-CUTOFF-AT                  VALUE 'B'.         03740000
TCK            88  AFTER-CUTOFF-AT                   VALUE 'A'.         03750000
TCK        05  FR-CUTOFF-IND             PIC  X(01)  VALUE SPACE.       03760000
TCK            88  BEFORE-CUTOFF-FR                  VALUE 'B'.         03770000
TCK            88  AFTER-CUTOFF-FR                   VALUE 'A'.         03780000
           05  SQL-ERROR-IND             PIC  X(01)  VALUE ' '.         03790000
               88  BAD-UPDATE                            VALUE 'U'.     03800000
               88  BAD-FETCH                             VALUE 'F'.     03810000
               88  BAD-OPEN                              VALUE 'O'.     03820000
               88  BAD-CLOSE                             VALUE 'L'.     03830000
               88  BAD-SELECT                            VALUE 'S'.     03840000
               88  BAD-COMMIT                            VALUE 'M'.     03850000
               88  BAD-ROLLBACK                          VALUE 'R'.     03860000
               88  BAD-B1-CALL                           VALUE 'B'.     03870000
               88  BAD-INSERT                            VALUE 'I'.     03880000
           05  TROUBLE-DB2-OBJECT        PIC  X(15)      VALUE SPACES.  03890000
                                                                        03900000
       01  WS-FILE-DESC.                                                03910000
           05  FILLER                    PIC  X(03)  VALUE 'ADP'.       03920000
           05  WS-DESC-STREAM-IND        PIC  X(01)  VALUE ' '.         03930000
           05  FILLER                    PIC  X(16)                     03940000
               VALUE ' NSCC INPUT FILE'.                                03950000
                                                                        03960000
       01  WS-NM-END-LN-QTY-LONG         PIC  9(04).                    03970000
       01  FILLER                                                       03980000
           REDEFINES WS-NM-END-LN-QTY-LONG.                             03990000
           05  FILLER                    PIC  X(03).                    04000000
           05  WS-NM-END-LN-QTY          PIC  X(01).                    04010000
                                                                        04020000
       01  WS-FLOATING-AREA.                                            04030000
                                                                        04040000
           05  WS-INTEGER-AREA           PIC  9(12)V9(05).              04050000
           05  FILLER REDEFINES                                         04060000
               WS-INTEGER-AREA.                                         04070000
               10  WS-INTEGER            PIC  9(12).                    04080000
               10  FILLER                PIC V9(05).                    04090000
                                                                        04100000
           05  WS-DECIMAL                PIC V9(06).                    04110000
           05  WS-DECIMAL-ALPHA REDEFINES                               04120000
               WS-DECIMAL                PIC  X(06).                    04130000
           05  WS-DECIMAL-CNTR           PIC  9(01)  VALUE ZEROES.      04140000
                                                                        04150000
           05  WS-FIELD1.                                               04160000
               10  WS-FIELD1-INT         PIC  9(15).                    04170000
               10  WS-FIELD1-DEC         PIC  V9(01).                   04180000
           05  WS-FIELD-1 REDEFINES                                     04190000
               WS-FIELD1                 PIC  9(15)V9(01).              04200000
                                                                        04210000
           05  WS-FIELD2.                                               04220000
               10  WS-FIELD2-INT         PIC  9(14).                    04230000
               10  WS-FIELD2-DEC         PIC V9(02).                    04240000
           05  WS-FIELD-2 REDEFINES                                     04250000
               WS-FIELD2                 PIC  9(14)V9(02).              04260000
                                                                        04270000
           05  WS-FIELD3.                                               04280000
               10  WS-FIELD3-INT         PIC  9(13).                    04290000
               10  WS-FIELD3-DEC         PIC V9(03).                    04300000
           05  WS-FIELD-3 REDEFINES                                     04310000
               WS-FIELD3                 PIC  9(13)V9(03).              04320000
                                                                        04330000
           05  WS-FIELD4.                                               04340000
               10  WS-FIELD4-INT         PIC  9(12).                    04350000
               10  WS-FIELD4-DEC         PIC V9(04).                    04360000
           05  WS-FIELD-4 REDEFINES                                     04370000
               WS-FIELD4                 PIC  9(12)V9(04).              04380000
                                                                        04390000
           05  WS-MASK-0                 PIC  99999999999999999.        04400000
           05  WS-MASK-1                 PIC  999999999999999.9.        04410000
           05  WS-MASK-2                 PIC  99999999999999.99.        04420000
           05  WS-MASK-3                 PIC  9999999999999.999.        04430000
           05  WS-MASK-4                 PIC  999999999999.9999.        04440000
           05  WS-MASK-5                 PIC  99999999999.99999.        04450000
                                                                        04460000
           05  WS-FIELD5.                                               04470000
               10  WS-FIELD5-INT         PIC  9(11).                    04480000
               10  WS-FIELD5-DEC         PIC V9(05).                    04490000
           05  WS-FIELD-5 REDEFINES                                     04500000
               WS-FIELD5                 PIC  9(11)V9(05).              04510000
           05  WS-MASK-0-PCT             PIC  999999999999999.          04520000
           05  WS-MASK-1-PCT             PIC  9999999999999.9.          04530000
           05  WS-MASK-2-PCT             PIC  999999999999.99.          04540000
           05  WS-MASK-3-PCT             PIC  99999999999.999.          04550000
           05  WS-MASK-4-PCT             PIC  9999999999.9999.          04560000
           05  WS-MASK-5-PCT             PIC  999999999.99999.          04570000
           05  WS-DISBURS-AMT-0          PIC  9(14)V9(02).              04580000
           05  WS-DISBURS-AMT-1 REDEFINES                               04590000
               WS-DISBURS-AMT-0          PIC  9(06)V9(10).              04600000
           05  WS-DISBURS-AMT-2 REDEFINES                               04610000
               WS-DISBURS-AMT-0          PIC  9(12)V9(04).              04620000
                                                                        04630000
           EJECT                                                        04640000
           COPY BHINFO.                                                 04650000
                                                                        04660000
           EJECT                                                        04670000
           COPY BHACAT.                                                 04680000
                                                                        04690000
           EJECT                                                        04700000
LRM001     COPY BHMF.                                                   04710000
           COPY BHMF3.                                                  04720000
                                                                        04730000
           EJECT                                                        04740000
           COPY ZCATB1 REPLACING ==:ZCATB1:==  BY  ==ZCATB1==.          04750000
                                                                        04760000
           EJECT                                                        04770000
           COPY ACATLOG REPLACING ==:LOG:== BY ==CLOG==.                04780000
                                                                        04790008
           EJECT                                                        04800008
DJ0006 01  ACATACTF-FILE-STATUS     PIC  X(002).                        04810025
DJ0006     88 ACATACTF-OKAY         VALUE '00' THRU '09', '97'.         04820025
DJ0006     88 ACATACTF-END-OF-FILE  VALUE '10'.                         04830025
DJ0006     88 ACATACTF-EMPTY-MISSING VALUE '35'.                        04840025
DJ0006 01  W-ACATACTF-CNT           PIC  9(009) COMP-3 VALUE 0.         04850025
DJ0006 01  W-ACATACTF-DELETE-CNT    PIC  9(009) COMP-3 VALUE 0.         04850025
DJ0006 01  W-ACATACTF-CHANGE-CNT    PIC  9(009) COMP-3 VALUE 0.         04850025
DJ0006 01  W-VTRNFR-CNT             PIC  9(009) COMP-3 VALUE 0.         04850025
                                                                        04860012
DJ0006******************************************************************04870012
DJ0006* P2HDRTRL COMMAREA - USED TO CREATE HEADER AND TRAILER RECORDS  *04880012
DJ0006******************************************************************04890012
DJ0006 01  FILLER                        PIC X(008) VALUE 'CP2WS   '.   04900012
DJ0006     COPY CP2WS.                                                  04910012
      /                                                                 04860012
DJ0007 01  W-MF-FILE-STATUSES.                                          04860012
DJ0007     05  MFEXBR-STATUS             PIC X(002).                    04860012
DJ0007         88 VALID-MFEXBR-STATUS    VALUE '00' '04' '10' '23'.     04860012
DJ0007         88 MFEXBR-OKAY            VALUE '00' THRU '09', '97'.    04860012
DJ0007         88 MFEXBR-END-OF-FILE     VALUE '10'.                    04860012
DJ0007         88 MFEXBR-NOT-FOUND       VALUE '23'.                    04860012
DJ0007         88 MFEXBR-EMPTY-MISSING   VALUE '35'.                    04860012
DJ0007 01  W-MF-WORK-AREA.                                              04860012
DJ0007     05  W-MFMSD-CNT               PIC  9(009) COMP-3 VALUE 0.    04860012
DJ0007     05  W-MFMSD-FND-CNT           PIC  9(009) COMP-3 VALUE 0.    04860012
DJ0007     05  W-MFEXBR-CNT              PIC  9(009) COMP-3 VALUE 0.    04860012
DJ0007     05  W-MFEXBR-FND-CNT          PIC  9(009) COMP-3 VALUE 0.    04860012
DJ0007     05  W-MFMSD-FND-SW             PIC X(01).                    04860012
DJ0007         88  W-MFMSD-FOUND                    VALUE 'Y'.          04860012
DJ0007         88  W-MFMSD-NOT-FOUND                VALUE 'N'.          04860012
DJ0007     05  W-MFEXBR-FND-SW            PIC X(01).                    04860012
DJ0007         88  W-MFEXBR-FOUND                   VALUE 'Y'.          04860012
DJ0007         88  W-MFEXBR-NOT-FOUND               VALUE 'N'.          04860012
                                                                        04920000
DJ0007 01  BMFSECIO-CALLING-AREA.                                       04920000
DJ0007     COPY BMFSECIO.                                               04920000
                                                                        04920000
DJ0007 01  MFMSD-REC.                                                   04920000
DJ0007     COPY MFMSDREC.                                               04920000
           EJECT                                                        04920000
           COPY BPDATESC.                                               04930000
           EJECT                                                        04940000
       01  NTWREG-REC.                                                  04950000
           COPY BNWREGOP.                                               04960000
                                                                        04970000
           EJECT                                                        04980000
       01  NTWMAST-REC.                                                 04990000
           COPY BNWMASTW.                                               05000000
                                                                        05010000
       01  DSNTIAR                       PIC X(08)  VALUE 'DSNTIAR'.    05020000
       01  WS-DB2-MESSAGE-AREA.                                         05030000
           05  WS-DB2-MSG-LEN            PIC S9(04) COMP VALUE +960.    05040000
           05  WS-ERROR-MSG              PIC X(80)  OCCURS 12 TIMES     05050000
               INDEXED BY WS-ERROR-INDEX.                               05060000
       01  WS-ERR-LINE-LEN               PIC S9(09) COMP VALUE +80.     05070000
TCK    01  WS-SQLCODE                    PIC Z(8)9-.                    05080000
TCK    01  WS-TI-SQLCODE                 PIC S9(9)  COMP-4.             05090000
TCK    01  WS-AT-SQLCODE                 PIC S9(9)  COMP-4.             05100000
TCK    01  WS-FR-SQLCODE                 PIC S9(9)  COMP-4.             05110000
DJ0002 01  W-SQLERRD-3                   PIC S9(9).                     05120000
DJ0002 01  W-SQL-COUNT                   PIC --------9.                 05130000
TEMP   01  WS-ABEND-CTR                  PIC S9(3)  COMP-3  VALUE ZERO. 05140000
TCK    01  FILLER                        PIC X(15)  VALUE               05150000
           'DB2 COMMIT AREA'.                                           05160000
TCK    01  DB2-COMMIT-AREA.                                             05170000
TCK        05  WS-COMMIT-CTR             PIC S9(4)  COMP  VALUE ZERO.   05180000
TCK        05  WS-COMMIT-TOT-CTR         PIC S9(4)  COMP  VALUE ZERO.   05190000
TCK        05  WS-TI-KEYS.                                              05200000
               10  WS-TI-CLIENT          PIC X(04).                     05210000
               10  WS-TI-RCV-NBR         PIC X(04).                     05220000
               10  WS-TI-ACCT-RCV-NBR    PIC X(20).                     05230000
               10  WS-TI-DLVR-NBR        PIC X(04).                     05240000
               10  WS-TI-ACCT-DLVR-NBR   PIC X(20).                     05250000
               10  WS-TI-TRNFR-TYPE-CD   PIC X(03).                     05260000
TCK        05  WS-AT-KEYS.                                              05270000
               10  WS-AT-CLIENT           PIC X(04).                    05280000
               10  WS-AT-RCV-NBR         PIC X(04).                     05290000
               10  WS-AT-ACCT-RCV-NBR    PIC X(20).                     05300000
               10  WS-AT-DLVR-NBR        PIC X(04).                     05310000
               10  WS-AT-ACCT-DLVR-NBR   PIC X(20).                     05320000
               10  WS-AT-TRNFR-TYPE-CD   PIC X(03).                     05330000
               10  WS-AT-SEC-CD          PIC X(09).                     05340000
               10  WS-AT-SEC-CDG-CD      PIC X(01).                     05350000
               10  WS-AT-STTLM-LCTN-CD   PIC X(02).                     05360000
               10  WS-AT-CSH-MGN-SHRT-CD PIC X(01).                     05370000
           05  WS-FR-KEYS.                                              05380000
               10  WS-FR-CLIENT           PIC X(04).                    05390000
               10  WS-FR-ACAT-CONTROL-NBR  PIC X(14).                   05400000
               10  WS-FR-ASSET-SEQ-NBR     PIC 9(4).                    05410000
       01  FILLER                        PIC  X(12)      VALUE          05420000
           'TI FIELDS'.                                                 05430000
                                                                        05440000
       01  TI-AREA.                                                     05450000
           05  TI-TRANS-TYPE-CD          PIC  X(01).                    05460000
           05  TI-ACAT-CONTROL-NBR       PIC  X(14).                    05470000
           05  TI-TRNFR-TYPE-CD          PIC  X(03).                    05480000
           05  TI-SBMTG-PRTCP-NBR        PIC  X(04).                    05490000
           05  TI-RCV-NBR                PIC  X(04).                    05500000
           05  TI-DLVR-NBR               PIC  X(04).                    05510000
           05  TI-ACCT-RCV-NBR           PIC  X(20).                    05520000
           05  TI-RCV-CUST-NM            PIC  X(60).                    05530000
           05  TI-RCV-SS-PRIM-NBR        PIC  X(09).                    05540000
           05  TI-RCV-SS-SCNDY-NBR       PIC  X(09).                    05550000
           05  TI-RCV-ACCT-TYPE-CD       PIC  X(02).                    05560000
           05  TI-RCV-OCC-BRKR-NBR       PIC  X(05).                    05570000
           05  TI-RCV-CRSPN-NBR          PIC  X(04).                    05580000
           05  TI-ACCT-DLVR-NBR          PIC  X(20).                    05590000
           05  TI-TRNFR-TYPE-RJCT-CD     PIC  X(02).                    05600000
           05  TI-ACAT-CNTL-ASTD-NBR     PIC  X(14).                    05610000
           05  TI-STTLM-ASCTD-DT         PIC  X(10).                    05620000
           05  TI-TRANS-RFRN-ID-CD       PIC  X(20).                    05630000
           05  TI-NSCC-PEND-CD           PIC  X(01).                    05640000
LRM010     05  TI-NSCC-ACK-IND           PIC  X(01).                    05640000
           05  TI-CYCLE-CD               PIC  X(02).                    05650037
           05  TI-UPDT-TMSTP             PIC  X(26).                    05660037
DJ0006     05  TI-CRT-TMSTP            PIC X(26).                       05670037
DJ0006     05  TI-RR-CD                PIC X(3).                        05680037
DJ0006     05  TI-PRGM-NM              PIC X(8).                        05690037
DJ0006     05  TI-CICS-NET-NM          PIC X(8).                        05700037
DJ0006     05  TI-CICS-TERM-ID-CD      PIC X(4).                        05710037
DJ0006     05  TI-CICS-SGNON-ID        PIC X(4).                        05720037
DJ0006     05  TI-TPSCRT-USR-ID        PIC X(8).                        05730037
DJ0006     05  TI-TPSCRT-USR-NM        PIC X(20).                       05740037
DJ0006     05  TI-CLIENT-NBR           PIC X(4).                        05750037
                                                                        05760000
       01  FILLER                        PIC  X(12)      VALUE          05770000
           'AT AREA'.                                                   05780000
                                                                        05790000
       01  AT-AREA.                                                     05800000
           05  AT-TRANS-TYPE-CD      PIC  X(01).                        05810000
           05  AT-ACAT-CONTROL-NBR   PIC  X(14).                        05820000
           05  AT-TRNFR-TYPE-CD      PIC  X(03).                        05830000
           05  AT-SBMTG-PRTCP-NBR    PIC  X(04).                        05840000
           05  AT-RCV-NBR            PIC  X(04).                        05850000
           05  AT-DLVR-NBR           PIC  X(04).                        05860000
           05  AT-TRANS-RFRN-ID-CD   PIC  X(20).                        05870000
           05  AT-ASSET-SEQ-NBR      PIC S9(04)  COMP.                  05880000
           05  AT-ASSET-PRC-CTGY-CD  PIC  X(04).                        05890000
           05  AT-OPTN-CTGY-CD       PIC  X(02).                        05900000
           05  AT-STTLM-LCTN-CD      PIC  X(02).                        05910000
           05  AT-STTLM-RSN-CD       PIC  X(04).                        05920000
           05  AT-ISIN-CNTRY-CD      PIC  X(02).                        05930000
           05  AT-ISIN-SEC-ISSUE-CD  PIC  X(09).                        05940000
           05  AT-ISIN-SEC-CDG-CD    PIC  X(01).                        05950000
           05  AT-ASSET-DESC-TXT     PIC  X(140).                       05960000
           05  AT-ASSET-RQST-QTY-CD  PIC  X(01).                        05970000
           05  AT-AST-RQST-TRANS-CD  PIC  X(01).                        05980000
           05  AT-ASSET-QTY                      COMP-2.                05990000
           05  AT-ASSET-PCT                      COMP-2.                06000000
           05  AT-PSTN-CD            PIC  X(01).                        06010000
           05  AT-ISO-CRNCY-CD       PIC  X(03).                        06020000
           05  AT-ASSET-AMT                      COMP-2.                06030000
           05  AT-BEARER-BOND-CD     PIC  X(01).                        06040000
           05  AT-CSH-MGN-SHRT-CD    PIC  X(01).                        06050000
           05  AT-WHI-CD             PIC  X(01).                        06060000
           05  AT-TRNFR-TYPE-RSN-CD  PIC  X(02).                        06070000
           05  AT-MBS-SERIAL-NBR     PIC  X(03).                        06080000
           05  AT-ASSET-CMNT-TXT     PIC  X(120).                       06090000
           05  AT-ACCT-RCV-NBR       PIC  X(20).                        06100000
           05  AT-ACCT-DLVR-NBR      PIC  X(20).                        06110000
           05  AT-NSCC-PEND-CD       PIC  X(01).                        06120000
LRM010     05  AT-NSCC-ACK-IND       PIC  X(01).                        05640000
  ***** /* FOR CYCLE # */                                               06130000
           05  AT-RCRD-STTS-CD       PIC  X(01).                        06140037
           05  AT-UPDT-TMSTP         PIC  X(26).                        06150037
LRM001     05  AT-PRGM-NM            PIC  X(08).                        06160000
DJ0006     05  AT-CRT-TMSTP          PIC X(26).                         06170037
DJ0006     05  AT-CICS-NET-NM        PIC X(8).                          06180037
DJ0006     05  AT-CICS-TERM-ID-CD    PIC X(4).                          06190037
DJ0006     05  AT-CICS-SGNON-ID      PIC X(4).                          06200037
DJ0006     05  AT-TPSCRT-USR-ID      PIC X(8).                          06210037
DJ0006     05  AT-TPSCRT-USR-NM      PIC X(20).                         06220037
DJ0006     05  AT-SECURITY-ADP-NBR   PIC X(7).                          06230037
DJ0006     05  AT-CLIENT-NBR         PIC X(4).                          06230037
                                                                        06240000
       01  FILLER                    PIC  X(12)        VALUE            06250000
           'AT-OPTN AREA'.                                              06260000
                                                                        06270000
       01  ATO-AREA.                                                    06280000
           05  ATO-BS-CD             PIC  X(01).                        06290000
           05  ATO-PTCL-CD           PIC  X(01).                        06300000
           05  ATO-OPTN-OPN-CLSD-CD  PIC  X(01).                        06310000
           05  ATO-SYM-CD            PIC  X(06).                        06320000
           05  ATO-EXPTN-DT          PIC  X(10).                        06330000
           05  ATO-STPRC-INTEGER-AMT PIC S9(04)  COMP.                  06340000
           05  ATO-STPRC-FRCTN-AMT   PIC S9(04)  COMP.                  06350000
           05  ATO-DLVR-OCC-NBR      PIC  X(10).                        06360000
           05  ATO-OPTN-ACCT-TYPE-CD PIC  X(01).                        06370000
           05  ATO-ACCT-SUB-CD       PIC  X(04).                        06380000
           05  ATO-OPTN-CMNT-TXT     PIC  X(16).                        06390000
                                                                        06400000
       01  FILLER                        PIC  X(12)      VALUE          06410000
           'AT-FUND AREA'.                                              06420000
                                                                        06430000
       01  ATF-AREA.                                                    06440000
           05  ATF-FNBR                  PIC  X(20).                    06450000
           05  ATF-BK-PHSCL-SHR-CD       PIC  X(01).                    06460000
           05  ATF-NTWRK-CNTL-CD         PIC  X(01).                    06470000
           05  ATF-ACCT-TYPE-CD          PIC  X(01).                    06480000
           05  ATF-DVDND-CD              PIC  X(01).                    06490000
           05  ATF-LTCG-CD               PIC  X(01).                    06500000
           05  ATF-STCG-CD               PIC  X(01).                    06510000
           05  ATF-DVDND-PAYEE-CD        PIC  X(01).                    06520000
           05  ATF-BRKR-EXCTG-NBR        PIC  X(04).                    06530000
           05  ATF-MF-FULL-PRTL-CD       PIC  X(01).                    06540000
                                                                        06550000
       01  FILLER                        PIC  X(12)      VALUE          06560000
           'FR-AREA'.                                                   06570000
                                                                        06580000
       01  FR-AREA.                                                     06590000
           05  FR-ACAT-CONTROL-NBR     PIC  X(14).                      06600000
           05  FR-TRNFR-TYPE-CD        PIC  X(03).                      06610000
           05  FR-SBMTG-PRTCP-NBR      PIC  X(04).                      06620000
           05  FR-DLVR-NBR             PIC  X(04).                      06630000
           05  FR-ASSET-SEQ-NBR        PIC S9(04)  COMP.                06640000
           05  FR-ISIN-CNTRY-CD        PIC  X(02).                      06650000
           05  FR-ISIN-SEC-ISSUE-CD    PIC  X(09).                      06660000
           05  FR-ISIN-SEC-CDG-CD      PIC  X(01).                      06670000
           05  FR-MF-TRANS-TYPE-CD     PIC  X(01).                      06680000
           05  FR-FRCTN-CD             PIC  X(01).                      06690000
           05  FR-NRA-TAX-PCT          PIC SV9(2)  COMP-3.              06700000
           05  FR-DSBMT-ACCRL-CD       PIC  X(01).                      06710000
           05  FR-DSBMT-FRCTN-CSH-CD   PIC  X(01).                      06720000
           05  FR-DSBMT-RSDL-CD        PIC  X(01).                      06730000
           05  FR-BK-PHSCL-SHR-CD      PIC  X(01).                      06740000
           05  FR-DLRVY-CD             PIC  X(01).                      06750000
           05  FR-TPA-NBR              PIC  X(04).                      06760000
           05  FR-CUST-NM              PIC  X(20).                      06770000
           05  FR-FUND-ACCT-CD         PIC  X(01).                      06780000
           05  FR-FNBR                 PIC  X(20).                      06790000
           05  FR-BRKR-EXCTG-NBR       PIC  X(04).                      06800000
           05  FR-NTWRK-CNTL-CD        PIC  X(01).                      06810000
           05  FR-SS-TIN-CD            PIC  X(01).                      06820000
           05  FR-SS-TIN-NBR           PIC  X(09).                      06830000
           05  FR-NM-END-LN-QTY        PIC S9(04)  COMP.                06840000
           05  FR-LTCG-CD              PIC  X(01).                      06850000
           05  FR-STCG-CD              PIC  X(01).                      06860000
           05  FR-DVDND-CD             PIC  X(01).                      06870000
           05  FR-WTHLD-CD             PIC  X(01).                      06880000
           05  FR-PYBL-INFO-CD         PIC  X(01).                      06890000
           05  FR-ZIP5-CD              PIC  X(05).                      06900000
           05  FR-ZIP4-CD              PIC  X(04).                      06910000
           05  FR-SOC-CD               PIC  X(02).                      06920000
           05  FR-NAV-ACCT-IND         PIC  X(01).                      06930000
           05  FR-MRGN-ACCT-IND        PIC  X(01).                      06940000
           05  FR-CHCK-WRTNG-IND       PIC  X(01).                      06950000
           05  FR-SL-ST-CD             PIC  X(02).                      06960000
           05  FR-CNTRY-ORGN-CD        PIC  X(02).                      06970000
           05  FR-ACCT-RR-NM           PIC  X(15).                      06980000
           05  FR-ACCT-RR-CD           PIC  X(09).                      06990000
           05  FR-BRCH-NBR             PIC  X(09).                      07000000
           05  FR-PYBL-QTY             PIC S9(04)  COMP.                07010000
           05  FR-MEMO-TXT             PIC  X(12).                      07020000
           05  FR-ACH-IND              PIC  X(01).                      07030000
           05  FR-PAC-IND              PIC  X(01).                      07040000
           05  FR-SWP-IND              PIC  X(01).                      07050000
           05  FR-ROA-LOI-AMT          PIC S9(14)V9(2) COMP-3.          07060000
           05  FR-LOI-DT               PIC  X(10).                      07070000
           05  FR-TRD-RLTD-IND         PIC  X(01).                      07080000
           05  FR-ACCT-RLTD-NBR        PIC  X(20).                      07090000
           05  FR-ACCT-RLTD-CD         PIC  X(01).                      07100000
           05  FR-SWP-PAC-EFFCT-DT     PIC  X(10).                      07110000
           05  FR-CDSC-PYMNT-CD        PIC  X(01).                      07120000
           05  FR-DSBMT-OPTN-CD        PIC  X(01).                      07130000
           05  FR-DSBMT-AMT                        COMP-2.              07140000
           05  FR-PYMNT-JAN-IND         PIC  X(01).                     07150000
           05  FR-PYMNT-FEB-IND        PIC  X(01).                      07160000
           05  FR-PYMNT-MAR-IND        PIC  X(01).                      07170000
           05  FR-PYMNT-APR-IND        PIC  X(01).                      07180000
           05  FR-PYMNT-MAY-IND        PIC  X(01).                      07190000
           05  FR-PYMNT-JUN-IND        PIC  X(01).                      07200000
           05  FR-PYMNT-JUL-IND        PIC  X(01).                      07210000
           05  FR-PYMNT-AUG-IND        PIC  X(01).                      07220000
           05  FR-PYMNT-SEP-IND        PIC  X(01).                      07230000
           05  FR-PYMNT-OCT-IND        PIC  X(01).                      07240000
           05  FR-PYMNT-NOV-IND        PIC  X(01).                      07250000
           05  FR-PYMNT-DEC-IND        PIC  X(01).                      07260000
           05  FR-PYMNT-DT-CD          PIC  X(02).                      07270000
           05  FR-RTRMT-TAX-CD         PIC  X(02).                      07280000
           05  FR-SHRHR-BNK-ACCT-NBR   PIC  X(20).                      07290000
           05  FR-SHRHR-BNK-TYPE-CD    PIC  X(01).                      07300000
           05  FR-CHCK-FRST-DT         PIC  X(10).                      07310000
           05  FR-ABA-ROUTING-NBR      PIC  X(09).                      07320000
           05  FR-COST-BSS-CD          PIC  X(01).                      07330000
           05  FR-NSCC-PEND-CD         PIC  X(01).                      07340000
LRM010     05  FR-NSCC-ACK-IND       PIC  X(01).                        05640000
  ***** /* FOR CYCLE # */                                               07350000
TCK        05  FR-RCRD-STTS-CD         PIC  X(01).                      07360000
TCK        05  FR-UPDT-TMSTP           PIC  X(26).                      07370000
                                                                        07380000
       01  FR-CUST-NA-LINE-TXT         PIC  X(35).                      07390000
                                                                        07400000
       01  FILLER                      PIC  X(12)     VALUE             07410000
           'FR-PBL-AREA'.                                               07420000
                                                                        07430000
       01  FRP-AREA.                                                    07440000
           05  FRP-ACCT-NBR            PIC  X(20).                      07450000
           05  FRP-ZIP5-CD             PIC  X(05).                      07460000
           05  FRP-ZIP4-CD             PIC  X(04).                      07470000
           05  FRP-ACCT-PYBL-CD        PIC  X(01).                      07480000
           05  FRP-ISIN-CNTRY-CD       PIC  X(02).                      07490000
           05  FRP-ISIN-SEC-ISSUE-CD   PIC  X(09).                      07500000
           05  FRP-ISIN-SEC-CDG-CD     PIC  X(01).                      07510000
           05  FRP-PYBL-ALTNT-CD       PIC  X(01).                      07520000
           05  FRP-PYBL-ALTNT-RSN-TXT  PIC  X(20).                      07530000
           05  FRP-ADDRS-DVDND-IND     PIC  X(01).                      07540000
           05  FRP-ADDRS-SYSWL-IND     PIC  X(01).                      07550000
           05  FRP-ADDRS-ATMDF-IND     PIC  X(01).                      07560000
           05  FRP-CRSS-FND-RNVST-IND  PIC  X(01).                      07570000
           05  FRP-ALTNT-PYBL-IND      PIC  X(01).                      07580000
                                                                        07590000
       01  FRP-PYBL-NA-LINE-TXT        PIC  X(35).                      07600000
                                                                        07610000
      *DB2 COMMUNICATION AREA                                           07620000
           EJECT                                                        07630000
           EXEC SQL                                                     07640000
              INCLUDE SQLCA                                             07650000
           END-EXEC.                                                    07660000
                                                                        07670000
           EJECT                                                        07680000
           EXEC SQL                                                     07690000
              INCLUDE ACTITRF                                           07700000
           END-EXEC.                                                    07710000
                                                                        07720000
           EJECT                                                        07730000
           EXEC SQL                                                     07740000
              INCLUDE ACTIAST                                           07750000
           END-EXEC.                                                    07760000
                                                                        07770000
           EJECT                                                        07780000
           EXEC SQL                                                     07790000
              INCLUDE ACTIMF                                            07800000
           END-EXEC.                                                    07810000
                                                                        07820000
           EJECT                                                        07830000
           EXEC SQL                                                     07840000
              INCLUDE VFNDRGST                                          07850000
           END-EXEC.                                                    07860000
                                                                        07870000
           EJECT                                                        07880000
           EXEC SQL                                                     07890000
              INCLUDE VFNDNA                                            07900000
           END-EXEC.                                                    07910000
                                                                        07920000
           EJECT                                                        07930000
           EXEC SQL                                                     07940000
              INCLUDE VFNDPYBL                                          07950000
           END-EXEC.                                                    07960000
                                                                        07970000
           EJECT                                                        07980000
           EXEC SQL                                                     07990000
              INCLUDE VFNDPYNA                                          08000000
           END-EXEC.                                                    08010000
                                                                        08020000
           EJECT                                                        07980000
DJ0006     EXEC SQL                                                     07990000
DJ0006        INCLUDE VTRNFR                                            08000000
DJ0006     END-EXEC.                                                    08010000
                                                                        08020000
           EJECT                                                        07980000
LRM011*DECLARE CURSOR TO OBTAIN ALL TI RECORDS ALREADY SENT IN PARALLEL 08030000
LRM011*MODE TO ASCENDIS                                                 08030000
LRM011     EXEC SQL                                                     08040000
LRM011        DECLARE NSCC_TI_PARA_CRSR CURSOR WITH HOLD FOR            08050000
LRM011           SELECT                                                 08060000
LRM011              TRANS_TYPE_CD,                                      08070037
LRM011              ACAT_CONTROL_NBR,                                   08080000
LRM011              TRNFR_TYPE_CD,                                      08090000
LRM011              SBMTG_PRTCP_NBR,                                    08100000
LRM011              RCV_NBR,                                            08110000
LRM011              DLVR_NBR,                                           08120000
LRM011              ACCT_RCV_NBR,                                       08130000
LRM011              RCV_CUST_NM,                                        08140000
LRM011              RCV_SS_PRIM_NBR,                                    08150000
LRM011              RCV_SS_SCNDY_NBR,                                   08160000
LRM011              RCV_ACCT_TYPE_CD,                                   08170000
LRM011              RCV_OCC_BRKR_NBR,                                   08180000
LRM011              RCV_CRSPN_NBR,                                      08190000
LRM011              ACCT_DLVR_NBR,                                      08200000
LRM011              TRNFR_TYPE_RJCT_CD,                                 08210000
LRM011              ACAT_CNTL_ASTD_NBR,                                 08220000
LRM011              STTLM_ASCTD_DT,                                     08230000
LRM011              TRANS_RFRN_ID_CD,                                   08240000
LRM011              NSCC_PEND_CD,                                       08250000
LRM011              NSCC_ACK_IND,                                       08250000
LRM011              CYCLE_CD,                                           08260037
LRM011              UPDT_TMSTP,                                         08270037
LRM011              CRT_TMSTP,                                          08280039
LRM011              RR_CD,                                              08290037
LRM011              PRGM_NM,                                            08300037
LRM011              CICS_NET_NM,                                        08310037
LRM011              CICS_TERM_ID_CD,                                    08320037
LRM011              CICS_SGNON_ID,                                      08330037
LRM011              TPSCRT_USR_ID,                                      08340037
LRM011              TPSCRT_USR_NM,                                      08350037
LRM011              CLIENT_NBR                                          08360037
LRM011           FROM ACTITRF                                           08370000
LRM011           WHERE CLIENT_NBR   =  :WS-CLIENT               AND     08380000
LRM011                 TRNFR_TYPE_CD   IN ('FUL', 'PTR', 'PTD') AND             
LRM011                 NSCC_ACK_IND    = 'S'                                    
LRM011     END-EXEC.                                                    08400000
LRM011     EJECT                                                                
LRM011* DECLARE CURSOR TO OBTAIN ALL AT RECORDS ALREADY SENT IN PARALLEL08430000
LRM011*MODE TO ASCENDIS                                                 08030000
LRM011     EXEC SQL                                                     08440000
LRM011        DECLARE NSCC_AT_PARA_CRSR CURSOR WITH HOLD FOR            08450000
LRM011           SELECT                                                 08460000
LRM011              TRANS_TYPE_CD,                                      08470000
LRM011              ACAT_CONTROL_NBR,                                   08480000
LRM011              TRNFR_TYPE_CD,                                      08490000
LRM011              SBMTG_PRTCP_NBR,                                    08500000
LRM011              RCV_NBR,                                            08510000
LRM011              DLVR_NBR,                                           08520000
LRM011              TRANS_RFRN_ID_CD,                                   08530000
LRM011              ASSET_SEQ_NBR,                                      08540000
LRM011              ASSET_PRC_CTGY_CD,                                  08550000
LRM011              OPTN_CTGY_CD,                                       08560000
LRM011              STTLM_LCTN_CD,                                      08570000
LRM011              STTLM_RSN_CD,                                       08580000
LRM011              ISIN_CNTRY_CD,                                      08590000
LRM011              ISIN_SEC_ISSUE_CD,                                  08600000
LRM011              ISIN_SEC_CDG_CD,                                    08610000
LRM011              ASSET_DESC_TXT,                                     08620000
LRM011              ASSET_RQST_QTY_CD,                                  08630000
LRM011              AST_RQST_TRANS_CD,                                  08640000
LRM011              ASSET_QTY,                                          08650000
LRM011              ASSET_PCT,                                          08660000
LRM011              PSTN_CD,                                            08670000
LRM011              ISO_CRNCY_CD,                                       08680000
LRM011              ASSET_AMT,                                          08690000
LRM011              BEARER_BOND_CD,                                     08700000
LRM011              CSH_MGN_SHRT_CD,                                    08710000
LRM011              WHI_CD,                                             08720000
LRM011              TRNFR_TYPE_RSN_CD,                                  08730000
LRM011              MBS_SERIAL_NBR,                                     08740000
LRM011              ASSET_CMNT_TXT,                                     08750000
LRM011              ACCT_RCV_NBR,                                       08760000
LRM011              ACCT_DLVR_NBR,                                      08770000
LRM011              NSCC_PEND_CD,                                       08780000
LRM011              NSCC_ACK_IND,                                       08780000
LRM011              RCRD_STTS_CD,                                       08790000
LRM011              UPDT_TMSTP,                                         08800000
LRM011              PRGM_NM,                                            08810043
LRM011              CRT_TMSTP,                                          08820039
LRM011              CICS_NET_NM,                                        08830037
LRM011              CICS_TERM_ID_CD,                                    08840037
LRM011              CICS_SGNON_ID,                                      08850037
LRM011              TPSCRT_USR_ID,                                      08860037
LRM011              TPSCRT_USR_NM,                                      08870037
LRM011              SECURITY_ADP_NBR,                                   08870037
LRM011              CLIENT_NBR                                          08880037
LRM011           FROM ACTIAST                                           08890000
LRM011           WHERE  CLIENT_NBR   =  :WS-CLIENT  AND                 08900000
LRM011                 NSCC_ACK_IND =  'S'                                      
LRM011     END-EXEC.                                                    08970000
LRM013********     NOT NSCC_WTHLD_CD = 'W'                                      
           EJECT                                                                
      *DECLARE CURSOR TO OBTAIN ALL TI RECORDS FOR THE CLIENT           08030000
           EXEC SQL                                                     08040000
              DECLARE NSCC_TI_CRSR CURSOR WITH HOLD FOR                 08050000
                 SELECT                                                 08060000
                    TRANS_TYPE_CD,                                      08070037
                    ACAT_CONTROL_NBR,                                   08080000
                    TRNFR_TYPE_CD,                                      08090000
                    SBMTG_PRTCP_NBR,                                    08100000
                    RCV_NBR,                                            08110000
                    DLVR_NBR,                                           08120000
                    ACCT_RCV_NBR,                                       08130000
                    RCV_CUST_NM,                                        08140000
                    RCV_SS_PRIM_NBR,                                    08150000
                    RCV_SS_SCNDY_NBR,                                   08160000
                    RCV_ACCT_TYPE_CD,                                   08170000
                    RCV_OCC_BRKR_NBR,                                   08180000
                    RCV_CRSPN_NBR,                                      08190000
                    ACCT_DLVR_NBR,                                      08200000
                    TRNFR_TYPE_RJCT_CD,                                 08210000
                    ACAT_CNTL_ASTD_NBR,                                 08220000
                    STTLM_ASCTD_DT,                                     08230000
                    TRANS_RFRN_ID_CD,                                   08240000
                    NSCC_PEND_CD,                                       08250000
LRM010              NSCC_ACK_IND,                                       08250000
                    CYCLE_CD,                                           08260037
                    UPDT_TMSTP,                                         08270037
DJ0006              CRT_TMSTP,                                          08280039
DJ0006              RR_CD,                                              08290037
DJ0006              PRGM_NM,                                            08300037
DJ0006              CICS_NET_NM,                                        08310037
DJ0006              CICS_TERM_ID_CD,                                    08320037
DJ0006              CICS_SGNON_ID,                                      08330037
DJ0006              TPSCRT_USR_ID,                                      08340037
DJ0006              TPSCRT_USR_NM,                                      08350037
DJ0006              CLIENT_NBR                                          08360037
                 FROM ACTITRF                                           08370000
                 WHERE CLIENT_NBR   =  :WS-CLIENT               AND     08380000
LRM010                 TRNFR_TYPE_CD   IN ('FUL', 'PTR', 'PTD') AND             
LRM010                 NSCC_ACK_IND    IN ('A', 'P')                            
           END-EXEC.                                                    08400000
                                                                        08410000
                                                                        08420000
      * DECLARE CURSOR TO OBTAIN ALL AT RECORDS FOR "FUL" REQUESTS      08430000
           EXEC SQL                                                     08440000
              DECLARE NSCC_AT1_CRSR CURSOR WITH HOLD FOR                08450000
                 SELECT                                                 08460000
                    TRANS_TYPE_CD,                                      08470000
                    ACAT_CONTROL_NBR,                                   08480000
                    TRNFR_TYPE_CD,                                      08490000
                    SBMTG_PRTCP_NBR,                                    08500000
                    RCV_NBR,                                            08510000
                    DLVR_NBR,                                           08520000
                    TRANS_RFRN_ID_CD,                                   08530000
                    ASSET_SEQ_NBR,                                      08540000
                    ASSET_PRC_CTGY_CD,                                  08550000
                    OPTN_CTGY_CD,                                       08560000
                    STTLM_LCTN_CD,                                      08570000
                    STTLM_RSN_CD,                                       08580000
                    ISIN_CNTRY_CD,                                      08590000
                    ISIN_SEC_ISSUE_CD,                                  08600000
                    ISIN_SEC_CDG_CD,                                    08610000
                    ASSET_DESC_TXT,                                     08620000
                    ASSET_RQST_QTY_CD,                                  08630000
                    AST_RQST_TRANS_CD,                                  08640000
                    ASSET_QTY,                                          08650000
                    ASSET_PCT,                                          08660000
                    PSTN_CD,                                            08670000
                    ISO_CRNCY_CD,                                       08680000
                    ASSET_AMT,                                          08690000
                    BEARER_BOND_CD,                                     08700000
                    CSH_MGN_SHRT_CD,                                    08710000
                    WHI_CD,                                             08720000
                    TRNFR_TYPE_RSN_CD,                                  08730000
                    MBS_SERIAL_NBR,                                     08740000
                    ASSET_CMNT_TXT,                                     08750000
                    ACCT_RCV_NBR,                                       08760000
                    ACCT_DLVR_NBR,                                      08770000
                    NSCC_PEND_CD,                                       08780000
LRM010              NSCC_ACK_IND,                                       08780000
TCK                 RCRD_STTS_CD,                                       08790000
TCK                 UPDT_TMSTP,                                         08800000
                    PRGM_NM,                                            08810043
DJ0006              CRT_TMSTP,                                          08820039
DJ0006              CICS_NET_NM,                                        08830037
DJ0006              CICS_TERM_ID_CD,                                    08840037
DJ0006              CICS_SGNON_ID,                                      08850037
DJ0006              TPSCRT_USR_ID,                                      08860037
DJ0006              TPSCRT_USR_NM,                                      08870037
DJ0006              SECURITY_ADP_NBR,                                   08870037
DJ0006              CLIENT_NBR                                          08880037
                 FROM ACTIAST                                           08890000
                 WHERE  CLIENT_NBR   =  :WS-CLIENT  AND                 08900000
LRM010               ((NSCC_ACK_IND  IN ('A', 'P')  AND                         
                       TRNFR_TYPE_CD = 'FUL')                           08910000
LRM010            OR  (NSCC_ACK_IND  IN ('A', 'P')  AND                         
                       TRNFR_TYPE_CD = 'PTR'        AND                 08930000
                       NOT RCV_NBR      = :WS-ADP-BROKER  AND           08940000
                       SBMTG_PRTCP_NBR  = :WS-ADP-BROKER))              08950000
           END-EXEC.                                                    08970000
LRM013*********    NOT NSCC_WTHLD_CD = 'W'          AND                         
      **         FOR UPDATE OF NSCC_PEND_CD                             08980000
      **                      ,UPDT_TMSTP                               08990000
      **                      ,PRGM_NM                                  09000000
                                                                        09010000
      * DECLARE CURSOR TO OBTAIN ALL AT RECORDS FOR NON-STANDARD REQUEST09020000
           EXEC SQL                                                     09030000
              DECLARE NSCC_AT2_CRSR CURSOR WITH HOLD FOR                09040000
                 SELECT                                                 09050000
                    TRANS_TYPE_CD,                                      09060000
                    ACAT_CONTROL_NBR,                                   09070000
                    TRNFR_TYPE_CD,                                      09080000
                    SBMTG_PRTCP_NBR,                                    09090000
                    RCV_NBR,                                            09100000
                    DLVR_NBR,                                           09110000
                    TRANS_RFRN_ID_CD,                                   09120000
                    ASSET_SEQ_NBR,                                      09130000
                    ASSET_PRC_CTGY_CD,                                  09140000
                    OPTN_CTGY_CD,                                       09150000
                    STTLM_LCTN_CD,                                      09160000
                    STTLM_RSN_CD,                                       09170000
                    ISIN_CNTRY_CD,                                      09180000
                    ISIN_SEC_ISSUE_CD,                                  09190000
                    ISIN_SEC_CDG_CD,                                    09200000
                    ASSET_DESC_TXT,                                     09210000
                    ASSET_RQST_QTY_CD,                                  09220000
                    AST_RQST_TRANS_CD,                                  09230000
                    ASSET_QTY,                                          09240000
                    ASSET_PCT,                                          09250000
                    PSTN_CD,                                            09260000
                    ISO_CRNCY_CD,                                       09270000
                    ASSET_AMT,                                          09280000
                    BEARER_BOND_CD,                                     09290000
                    CSH_MGN_SHRT_CD,                                    09300000
                    WHI_CD,                                             09310000
                    TRNFR_TYPE_RSN_CD,                                  09320000
                    MBS_SERIAL_NBR,                                     09330000
                    ASSET_CMNT_TXT,                                     09340000
                    ACCT_RCV_NBR,                                       09350000
                    ACCT_DLVR_NBR,                                      09360000
                    NSCC_PEND_CD,                                       09370000
LRM010              NSCC_ACK_IND,                                       09370000
                    RCRD_STTS_CD,                                       09380037
                    UPDT_TMSTP,                                         09390037
                    PRGM_NM,                                            09400037
DJ0006              CRT_TMSTP,                                          09410041
DJ0006              CICS_NET_NM,                                        09420037
DJ0006              CICS_TERM_ID_CD,                                    09430037
DJ0006              CICS_SGNON_ID,                                      09440037
DJ0006              TPSCRT_USR_ID,                                      09450037
DJ0006              TPSCRT_USR_NM,                                      09460037
DJ0006              SECURITY_ADP_NBR,                                   08870037
DJ0006              CLIENT_NBR                                          09470037
                 FROM ACTIAST                                           09480000
                 WHERE CLIENT_NBR    =  :WS-CLIENT              AND     09490000
LRM010                 NSCC_ACK_IND  IN ('A', 'P')              AND             
                       DLVR_NBR      =  :TI-DLVR-NBR            AND     09500000
                       RCV_NBR       =  :TI-RCV-NBR             AND     09510000
                       ACCT_DLVR_NBR =  :TI-ACCT-DLVR-NBR       AND     09520000
                       ACCT_RCV_NBR  =  :TI-ACCT-RCV-NBR        AND     09530000
                       TRNFR_TYPE_CD =  :TI-TRNFR-TYPE-CD       AND     09540000
LRM007                 ACAT_CONTROL_NBR = :TI-ACAT-CONTROL-NBR          09560000
           END-EXEC.                                                    09570000
LRM013********     NOT NSCC_WTHLD_CD = 'W'                                      
      *          FOR UPDATE OF NSCC_PEND_CD                             09580000
      *                       ,UPDT_TMSTP                               09590000
      *                       ,PRGM_NM                                  09600000
                                                                        09610000
      * DECLARE CURSOR TO OBTAIN ALL FR RECORDS                         09620000
           EXEC SQL                                                     09630000
              DECLARE NSCC_FR_CRSR CURSOR WITH HOLD FOR                 09640000
              SELECT                                                    09650000
                 ACAT_CONTROL_NBR,                                      09660000
                 TRNFR_TYPE_CD,                                         09670000
                 SBMTG_PRTCP_NBR,                                       09680000
                 DLVR_NBR,                                              09690000
                 ASSET_SEQ_NBR,                                         09700000
                 ISIN_CNTRY_CD,                                         09710000
                 ISIN_SEC_ISSUE_CD,                                     09720000
                 ISIN_SEC_CDG_CD,                                       09730000
                 MF_TRANS_TYPE_CD,                                      09740000
                 FRCTN_CD,                                              09750000
                 NRA_TAX_PCT,                                           09760000
                 DSBMT_ACCRL_CD,                                        09770000
                 DSBMT_FRCTN_CSH_CD,                                    09780000
                 DSBMT_RSDL_CD,                                         09790000
                 BK_PHSCL_SHR_CD,                                       09800000
                 DLRVY_CD,                                              09810000
                 TPA_NBR,                                               09820000
                 CUST_NM,                                               09830000
                 FUND_ACCT_CD,                                          09840000
                 FNBR,                                                  09850000
                 BRKR_EXCTG_NBR,                                        09860000
                 NTWRK_CNTL_CD,                                         09870000
                 SS_TIN_CD,                                             09880000
                 SS_TIN_NBR,                                            09890000
                 NM_END_LN_QTY,                                         09900000
                 LTCG_CD,                                               09910000
                 STCG_CD,                                               09920000
                 DVDND_CD,                                              09930000
                 WTHLD_CD,                                              09940000
                 PYBL_INFO_CD,                                          09950000
                 ZIP5_CD,                                               09960000
                 ZIP4_CD,                                               09970000
                 SOC_CD,                                                09980000
                 NAV_ACCT_IND,                                          09990000
                 MRGN_ACCT_IND,                                         10000000
                 CHCK_WRTNG_IND,                                        10010000
                 SL_ST_CD,                                              10020000
                 CNTRY_ORGN_CD,                                         10030000
                 ACCT_RR_NM,                                            10040000
                 ACCT_RR_CD,                                            10050000
                 BRCH_NBR,                                              10060000
                 PYBL_QTY,                                              10070000
                 MEMO_TXT,                                              10080000
                 ACH_IND,                                               10090000
                 PAC_IND,                                               10100000
                 SWP_IND,                                               10110000
                 ROA_LOI_AMT,                                           10120000
                 LOI_DT,                                                10130000
                 TRD_RLTD_IND,                                          10140000
                 ACCT_RLTD_NBR,                                         10150000
                 ACCT_RLTD_CD,                                          10160000
                 SWP_PAC_EFFCT_DT,                                      10170000
                 CDSC_PYMNT_CD,                                         10180000
                 DSBMT_OPTN_CD,                                         10190000
                 DSBMT_AMT,                                             10200000
                 PYMNT_JAN_IND,                                         10210000
                 PYMNT_FEB_IND,                                         10220000
                 PYMNT_MAR_IND,                                         10230000
                 PYMNT_APR_IND,                                         10240000
                 PYMNT_MAY_IND,                                         10250000
                 PYMNT_JUN_IND,                                         10260000
                 PYMNT_JUL_IND,                                         10270000
                 PYMNT_AUG_IND,                                         10280000
                 PYMNT_SEP_IND,                                         10290000
                 PYMNT_OCT_IND,                                         10300000
                 PYMNT_NOV_IND,                                         10310000
                 PYMNT_DEC_IND,                                         10320000
                 PYMNT_DT_CD,                                           10330000
                 RTRMT_TAX_CD,                                          10340000
                 SHRHR_BNK_ACCT_NBR,                                    10350000
                 SHRHR_BNK_TYPE_CD,                                     10360000
                 CHCK_FRST_DT,                                          10370000
                 ABA_ROUTING_NBR,                                       10380000
                 COST_BSS_CD,                                           10390000
                 NSCC_PEND_CD,                                          10400000
LRM010           NSCC_ACK_IND,                                          10400000
TCK              RCRD_STTS_CD,                                          10410000
TCK              UPDT_TMSTP                                             10420000
              FROM VFNDRGST                                             10430000
              WHERE CLIENT_NBR      = :WS-CLIENT                AND     10440000
LRM010                 NSCC_ACK_IND = 'Z'                                       
           END-EXEC.                                                    10460000
                                                                        10470000
DJ0006* DECLARE CURSOR TO OBTAIN ALL AT RECORDS THAT WERE DELETED       08430000
DJ0006     EXEC SQL                                                     08440000
DJ0006        DECLARE AT_DELETE_CURSOR CURSOR WITH HOLD FOR             08450000
DJ0006           SELECT                                                 08460000
DJ0006              TRANS_TYPE_CD,                                      08470000
DJ0006              ACAT_CONTROL_NBR,                                   08480000
DJ0006              TRNFR_TYPE_CD,                                      08490000
DJ0006              SBMTG_PRTCP_NBR,                                    08500000
DJ0006              RCV_NBR,                                            08510000
DJ0006              DLVR_NBR,                                           08520000
DJ0006              TRANS_RFRN_ID_CD,                                   08530000
DJ0006              ASSET_SEQ_NBR,                                      08540000
DJ0006              ASSET_PRC_CTGY_CD,                                  08550000
DJ0006              OPTN_CTGY_CD,                                       08560000
DJ0006              STTLM_LCTN_CD,                                      08570000
DJ0006              STTLM_RSN_CD,                                       08580000
DJ0006              ISIN_CNTRY_CD,                                      08590000
DJ0006              ISIN_SEC_ISSUE_CD,                                  08600000
DJ0006              ISIN_SEC_CDG_CD,                                    08610000
DJ0006              ASSET_DESC_TXT,                                     08620000
DJ0006              ASSET_RQST_QTY_CD,                                  08630000
DJ0006              AST_RQST_TRANS_CD,                                  08640000
DJ0006              ASSET_QTY,                                          08650000
DJ0006              ASSET_PCT,                                          08660000
DJ0006              PSTN_CD,                                            08670000
DJ0006              ISO_CRNCY_CD,                                       08680000
DJ0006              ASSET_AMT,                                          08690000
DJ0006              BEARER_BOND_CD,                                     08700000
DJ0006              CSH_MGN_SHRT_CD,                                    08710000
DJ0006              WHI_CD,                                             08720000
DJ0006              TRNFR_TYPE_RSN_CD,                                  08730000
DJ0006              MBS_SERIAL_NBR,                                     08740000
DJ0006              ASSET_CMNT_TXT,                                     08750000
DJ0006              ACCT_RCV_NBR,                                       08760000
DJ0006              ACCT_DLVR_NBR,                                      08770000
DJ0006              NSCC_PEND_CD,                                       08780000
LRM010              NSCC_ACK_IND,                                       08780000
DJ0006              RCRD_STTS_CD,                                       08790000
DJ0006              UPDT_TMSTP,                                         08800000
DJ0006              PRGM_NM,                                            08810043
DJ0006              CRT_TMSTP,                                          08820039
DJ0006              CICS_NET_NM,                                        08830037
DJ0006              CICS_TERM_ID_CD,                                    08840037
DJ0006              CICS_SGNON_ID,                                      08850037
DJ0006              TPSCRT_USR_ID,                                      08860037
DJ0006              TPSCRT_USR_NM,                                      08870037
DJ0006              SECURITY_ADP_NBR,                                   08870037
DJ0006              CLIENT_NBR                                          08880037
DJ0006           FROM ACTIAST                                           08890000
DJ0006           WHERE (CLIENT_NBR    =  :WS-DELETE-CLIENT      AND     08900000
LRM010                 NSCC_ACK_IND   IN ('A', 'P'))        OR                  
DJ0006                (CLIENT_NBR     = :WS-CLIENT              AND     10440000
LRM010                 NSCC_ACK_IND   IN ('A', 'P')             AND             
DJ0006                 PRGM_NM LIKE 'ACAT%'  AND                        08810043
DJ0006                 (NSCC_PEND_CD  =  'D' OR                         08960000
DJ0006                  TRANS_TYPE_CD =  'D'))                          08470000
DJ0006     END-EXEC.                                                    08970000
LRM013*******      NOT NSCC_WTHLD_CD  = 'W'                     AND             
                                                                        10470000
DJ0006* DECLARE CURSOR TO OBTAIN ALL AT RECORDS THAT HAS AMT = 0        08430000
DJ0006     EXEC SQL                                                     08440000
DJ0006        DECLARE AT_CHANGE_CURSOR CURSOR WITH HOLD FOR             08450000
DJ0006           SELECT                                                 08460000
DJ0006              TRANS_TYPE_CD,                                      08470000
DJ0006              ACAT_CONTROL_NBR,                                   08480000
DJ0006              TRNFR_TYPE_CD,                                      08490000
DJ0006              SBMTG_PRTCP_NBR,                                    08500000
DJ0006              RCV_NBR,                                            08510000
DJ0006              DLVR_NBR,                                           08520000
DJ0006              TRANS_RFRN_ID_CD,                                   08530000
DJ0006              ASSET_SEQ_NBR,                                      08540000
DJ0006              ASSET_PRC_CTGY_CD,                                  08550000
DJ0006              OPTN_CTGY_CD,                                       08560000
DJ0006              STTLM_LCTN_CD,                                      08570000
DJ0006              STTLM_RSN_CD,                                       08580000
DJ0006              ISIN_CNTRY_CD,                                      08590000
DJ0006              ISIN_SEC_ISSUE_CD,                                  08600000
DJ0006              ISIN_SEC_CDG_CD,                                    08610000
DJ0006              ASSET_DESC_TXT,                                     08620000
DJ0006              ASSET_RQST_QTY_CD,                                  08630000
DJ0006              AST_RQST_TRANS_CD,                                  08640000
DJ0006              ASSET_QTY,                                          08650000
DJ0006              ASSET_PCT,                                          08660000
DJ0006              PSTN_CD,                                            08670000
DJ0006              ISO_CRNCY_CD,                                       08680000
DJ0006              ASSET_AMT,                                          08690000
DJ0006              BEARER_BOND_CD,                                     08700000
DJ0006              CSH_MGN_SHRT_CD,                                    08710000
DJ0006              WHI_CD,                                             08720000
DJ0006              TRNFR_TYPE_RSN_CD,                                  08730000
DJ0006              MBS_SERIAL_NBR,                                     08740000
DJ0006              ASSET_CMNT_TXT,                                     08750000
DJ0006              ACCT_RCV_NBR,                                       08760000
DJ0006              ACCT_DLVR_NBR,                                      08770000
DJ0006              NSCC_PEND_CD,                                       08780000
LRM010              NSCC_ACK_IND,                                       08780000
DJ0006              RCRD_STTS_CD,                                       08790000
DJ0006              UPDT_TMSTP,                                         08800000
DJ0006              PRGM_NM,                                            08810043
DJ0006              CRT_TMSTP,                                          08820039
DJ0006              CICS_NET_NM,                                        08830037
DJ0006              CICS_TERM_ID_CD,                                    08840037
DJ0006              CICS_SGNON_ID,                                      08850037
DJ0006              TPSCRT_USR_ID,                                      08860037
DJ0006              TPSCRT_USR_NM,                                      08870037
DJ0006              SECURITY_ADP_NBR,                                   08870037
DJ0006              CLIENT_NBR                                          08880037
DJ0006           FROM ACTIAST                                           08890000
DJ0006           WHERE CLIENT_NBR    =  :WS-CLIENT  AND                 08900000
LRM010                 NSCC_ACK_IND  IN ('A', 'P')  AND                         
DJ0006                (ASSET_AMT     =  0  AND                          08960000
DJ0006                 TRANS_TYPE_CD = 'C')                             08470000
DJ0006     END-EXEC.                                                    08970000
LRM013*********    NOT NSCC_WTHLD_CD  = 'W'         AND                         
           EJECT                                                        10480000
      ******************************************************************10490000
       LINKAGE SECTION.                                                 10500000
      ******************************************************************10510000
                                                                        10520000
       01  PARM-AREA.                                                   10530000
           05  PARM-LENGTH              PIC  S9(4) COMP.                10540000
           05  LS-STREAM-IND            PIC  X(01).                     10550000
           05  FILLER                   PIC  X(01).                     10560000
           05  LS-TIA-LIT               PIC  X(04).                     10570000
           05  LS-TIA-TIME              PIC  9(04).                     10580000
           05  FILLER                   PIC  X(01).                     10590000
           05  LS-TIC-LIT               PIC  X(04).                     10600000
           05  LS-TIC-TIME              PIC  9(04).                     10610000
           05  FILLER                   PIC  X(01).                     10620000
           05  LS-TIRD-LIT              PIC  X(05).                     10630000
           05  LS-TIRD-TIME             PIC  9(04).                     10640000
           05  FILLER                   PIC  X(01).                     10650000
           05  LS-TIRR-LIT              PIC  X(05).                     10660000
           05  LS-TIRR-TIME             PIC  9(04).                     10670000
           05  FILLER                   PIC  X(01).                     10680000
           05  LS-TIX-LIT               PIC  X(04).                     10690000
           05  LS-TIX-TIME              PIC  9(04).                     10700000
           05  FILLER                   PIC  X(01).                     10710000
           05  LS-ATA-LIT               PIC  X(04).                     10720000
           05  LS-ATA-TIME              PIC  9(04).                     10730000
           05  FILLER                   PIC  X(01).                     10740000
           05  LS-ATCD-LIT              PIC  X(05).                     10750000
           05  LS-ATCD-TIME             PIC  9(04).                     10760000
LRM001     05  FILLER                   PIC  X(01).                     10770000
LRM001     05  LS-ATRD-LIT              PIC  X(05).                     10780000
LRM001     05  LS-ATRD-TIME             PIC  9(04).                     10790000
           05  FILLER                   PIC  X(01).                     10800000
           05  LS-FRA-LIT               PIC  X(04).                     10810000
           05  LS-FRA-TIME              PIC  9(04).                     10820000
                                                                        10830000
           EJECT                                                        10840000
      ***************************************************************** 10850000
       PROCEDURE DIVISION USING PARM-AREA.                              10860000
      ***************************************************************** 10870000
DJ0001     DISPLAY 'CAT500A - SELECTS & UPDATES WITH NSCC_ACK_IND=U'    10880000
DJ0001                     ' AND STORE CYCLE NUMBER IN CYCLE_CD'        10890000
DJ0001     DISPLAY '       - FORMAT FUNDS PORTION FOR PARTIALS'         10900000
DJ0001     DISPLAY ' '.                                                 10910000
                                                                        10920000
           COPY MSGCOBO.                                                10930000
                                                                        10940000
           PERFORM INITIAL-ROUTINE.                                     10950000
                                                                        10960000
           PERFORM PROCESS-ROUTINE.                                     10970000
                                                                        10980000
           PERFORM ENDJOB-ROUTINE.                                      10990000
                                                                        11000000
           GOBACK.                                                      11010000
                                                                        11020000
           EJECT                                                        11030000
      *****************                                                 11040000
       PROCESS-ROUTINE.                                                 11050000
      *****************                                                 11060000
                                                                        11070000
           PERFORM BUILD-CLIENT-TABLE                                   11080000
                                                                        11090000
           PERFORM READ-CYCLE-LOG-HEADER                                11100000
                                                                        11110000
           PERFORM FORMAT-CYCLE-LOG-KEY                                 11120000
                                                                        11130027
DJ0006     PERFORM 7600-WRITE-ACATACTF-HEADER                           11140052
                                                                        11150000
           DISPLAY 'CLIENTS LOADED IN B1 TABLE ' CLIENT-TABLE-CNTR      11160000
           PERFORM VARYING S1 FROM 1 BY 1                               11170000
              UNTIL S1 > CLIENT-TABLE-CNTR                              11180000
              MOVE CLIENT-NUM (S1)          TO  WS-CLIENT               11190000
                                                CLOG-KEY-ADP-CLNT-NBR   11200000
LRM005        MOVE CLIENT-ADP-BROKER (S1)   TO  WS-ADP-BROKER           11210000
LRM009*----------------------------------------------------------------         
LRM009* EXTRACT ONLY BATCH BUILT ROWS ACK=A TO SEND TO ASCENDIS FOR             
LRM009* AN ASCENDIS CLIENT. THE ASCENDIS RETURNED ROWS ELIGABLE TO SEND         
LRM009* TO NSCC ARE EXTRACRTED IN CAT500A. F/R IS NOT SENT TO ASCENDIS.         
LRM009*----------------------------------------------------------------         
LRM009        IF (CLIENT-B1-ASCENDIS (S1) = '1' OR '2')                         
LRM009           IF CLIENT-B1-ASCENDIS (S1) = '1'                               
LRM010              DISPLAY 'ASCENDIS PRODUCTION CLIENT '                       
LRM010                  CLIENT-B1-ASCENDIS (S1) ' FETCHING ACK=A'               
LRM010           ELSE                                                           
LRM010***------- PARALLEL MODE ----------------------------------------         
LRM010*** THE FOLLOWING 4 LINES WILL CAUSE ALL ROWS ALREADY MARKED AS           
LRM010*** 'S' - PULLED TO CHANGE TO 'X' - ALREADY SENT, CAUSING THEM            
LRM010*** NOT TO BE NOT SENT AGAIN, FOLLOWED BY THE SAME ROUTINES WITH          
LRM010*** ACK='P' TO CAUSE THESE TO CHANGE TO 'S' SO CAT501 PULLS THEM          
LRM010*** IN ASCENDIS EXTRACT RUN.                                              
LRM010*----------------------------------------------------------------         
LRM010              DISPLAY 'ASCENDIS PARALLEL CLIENT '                         
LRM010                  CLIENT-B1-ASCENDIS (S1) ' FETCHING ACK=P FIRST'         
LRM011              PERFORM 6000-FETCH-PARALLEL-TI                      11250000
LRM011              PERFORM 6500-FETCH-PARALLEL-AT                      11250000
LRM010           END-IF                                                         
DJ0006           PERFORM 7000-FETCH-ACTIAST-DELETES                     11250000
DJ0006           PERFORM 7100-FETCH-ACTIAST-CHANGES                     11250000
**********    DISPLAY ' *** STARTS PROCESSING FOR CLIENT # ' WS-CLIENT  11220000
                 PERFORM FETCH-TI-RECORDS                               11230000
                 MOVE '1'                      TO  FETCH-IND            11240000
                 PERFORM FETCH-AT-RECORDS                               11250000
LRM009*********  IF CLIENT-B1-434503 (S1) = '1'                         11260000
LRM009*********     PERFORM FETCH-FR-RECORDS                            11270000
LRM009*********  END-IF                                                 11280000
                 PERFORM WRITE-CYCLE-LOG-DETAIL                         11290000
              END-IF                                                    11280000
           END-PERFORM                                                  11300000
                                                                        11310000
           PERFORM REWRITE-CYCLE-LOG-HEADER                             11320000
           .                                                            11400000
           EJECT                                                        11420000
      ********************                                              11430000
       BUILD-CLIENT-TABLE.                                              11440000
      ********************                                              11450000
                                                                        11460000
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500        11470000
              MOVE SPACES                   TO  BH-BROKER-HEADER-INFO   11480000
                                                BH-ACAT-INFO            11490000
              MOVE B1-SUB                   TO  BH-BROKER-NUMBER        11500000
              MOVE '015'                    TO  BH-LOGICAL-RECORD-CODE  11510000
              MOVE '434500'                 TO  BH-B2-INFO-ID           11520000
              CALL  GETB1V               USING  BH-BROKER-HEADER-INFO   11530000
                                                BH-ACAT-INFO            11540000
              IF BH-BROKER-ACTIVE AND BH-ACAT-ACTIVE                    11550000
                 IF BH-BROKER-MINI-MAXI-SUBGROUP NOT = SPACES           11560000
                    MOVE BH-BROKER-MINI-MAXI-SUBGROUP                   11570000
                                            TO  WS-STREAM-IND           11580000
                 ELSE                                                   11590000
                    MOVE BH-BROKER-MINI-MAXI-INDICATOR                  11600000
                                            TO  WS-STREAM-IND           11610000
                 END-IF                                                 11620000
                 IF (LS-STREAM-IND  = WS-STREAM-IND                     11630000
LRM                AND B1-SUB NOT = 063)                                11640000
LRM              OR (LS-STREAM-IND = 'Q'                                11650000
LRM                AND B1-SUB NOT = 063)                                11660000
LRM              OR (LS-STREAM-IND = 'J'                                11670000
LRM                AND B1-SUB = 063)                                    11680000
                    ADD 1                   TO  S1                      11690000
                    MOVE B1-SUB             TO  CLIENT-NUM (S1)         11700000
LRM005              MOVE BH-BROKER-OLD-CLEARING-HOUSE(2 : 4)            11710000
LRM005                                      TO  CLIENT-ADP-BROKER (S1)  11720000
                    IF BH-ACAT-FUND-REGISTRATION = '1'                  11730000
                       MOVE '1'             TO  CLIENT-B1-434503 (S1)   11740000
                    ELSE                                                11750000
                       MOVE '0'             TO  CLIENT-B1-434503 (S1)   11760000
                    END-IF                                              11770000
                    MOVE BH-ACAT-MF-REGIST-RECEIVE-BKR                  11780000
                                            TO  CLIENT-B1-434636 (S1)   11790000
                    MOVE BH-ACAT-MF-REG-DIVD-PAYEE-IND                  11800000
                                            TO  CLIENT-B1-434619 (S1)   11810000
LRM009              MOVE BH-ACAT-ASCENDIS-USER TO CLIENT-B1-ASCENDIS(S1)11820000
LRM001              MOVE B1-SUB     TO  BH-BROKER-NUMBER                11830000
LRM001              MOVE '015'            TO  BH-LOGICAL-RECORD-CODE    11840000
LRM001              MOVE '537000'         TO  BH-B2-INFO-ID             11850000
LRM001              CALL  GETB1V         USING  BH-BROKER-HEADER-INFO   11860000
LRM001                                          BH-MF-INFO              11870000
LRM001              IF BH-MF-ACTIVE                                     11880000
DJ0007                 DISPLAY 'CLT ' B1-SUB                            11890000
DJ0007                          ' BH-MF-EXBR-OPTION        (537483) = ' 11900000
DJ0007                            BH-MF-EXBR-OPTION                     11910000
DJ0005                 DISPLAY 'CLT ' B1-SUB                            11890000
DJ0005                          ' BH-MF-SINGLE-FUND-ACCOUNT(537486) = ' 11900000
DJ0005                            BH-MF-SINGLE-FUND-ACCOUNT             11910000
DJ0005                 MOVE BH-MF-SINGLE-FUND-ACCOUNT TO                11920000
DJ0005                  CLIENT-B1-SINGLE-FUND-ACCOUNT (S1)              11930000
DJ0007                 MOVE BH-MF-EXBR-OPTION         TO                11920000
DJ0007                  CLIENT-B1-EXBR-OPTION         (S1)              11930000
LRM001                 MOVE BH-MFN-OMNIBUS-NSCC-BOX-ACCT TO             11940000
LRM001                                  NS-BRCH-ACCT-TC                 11950000
LRM001                 IF BH-MFN-OMNIBUS-NSCC-BOX-ACCT NOT = SPACE      11960000
LRM001                    CALL  CKDIGIT   USING  NS-BRCH-ACCT           11970000
LRM001                                           W-CKDIGIT-LEN          11980000
LRM001                                           NS-C                   11990000
LRM001                    MOVE NS-BRCH-ACCT-TC TO                       12000000
LRM001                          CLIENT-B1-NS-BRCH-NSCC-BOX (S1)         12010000
LRM001                 END-IF                                           12020000
LRM004                 MOVE BH-MFN-DST-MFE-NSCC-BOX-ACCT TO             12030000
LRM004                                  WS-DST-BOX-ACCT-TC              12040000
LRM004                 IF BH-MFN-DST-MFE-NSCC-BOX-ACCT NOT = SPACE      12050000
LRM004                    CALL  CKDIGIT   USING  WS-DST-BRCH-ACCT       12060000
LRM004                                           W-CKDIGIT-LEN          12070000
LRM004                                           WS-DST-C               12080000
LRM004                 END-IF                                           12090000
LRM001              END-IF                                              12100000
                    MOVE  ' '               TO  BH-MF3-INFO             12110000
                    MOVE CLIENT-NUM (S1)    TO  BH-BROKER-NUMBER-N      12120000
                    MOVE  '015'             TO  BH-LOGICAL-RECORD-CODE  12130000
                    MOVE  '540000'          TO  BH-B2-INFO-ID           12140000
                    CALL   GETB1V        USING  BH-BROKER-HEADER-INFO   12150000
                                                BH-MF3-INFO             12160000
                    IF BH-MF3-ACTIVE AND                                12170000
                       BH-MF3-SUB-EXEC-BKR-REC-NO NUMERIC               12180000
                       MOVE BH-MF3-SUB-EXEC-BKR-REC-NO                  12190000
                            TO  CLIENT-B1-EXEC-BKR-REC-NO (S1)          12200000
                       MOVE BH-MF3-SUB-EXEC-BKR-REC                     12210000
                            TO  CLIENT-B1-EXEC-BKR-REC (S1)             12220000
                    ELSE                                                12230000
                       MOVE 0 TO CLIENT-B1-EXEC-BKR-REC-NO (S1)         12240000
                    END-IF                                              12250000
                 END-IF                                                 12260000
              END-IF                                                    12270000
           END-PERFORM                                                  12280000
                                                                        12290000
           IF S1 = 0                                                    12300000
              DISPLAY ' '                                               12310000
              DISPLAY '****************************************'        12320000
              DISPLAY '* THERE ARE NOT ACAT ACTIVE CLIENTS ON *'        12330000
              DISPLAY '* THIS STREAM: ' LS-STREAM-IND                   12340000
                      '                       *'                        12350000
              DISPLAY '****************************************'        12360000
           ELSE                                                         12370000
              MOVE S1                       TO  CLIENT-TABLE-CNTR       12380000
           END-IF                                                       12390000
                                                                        12400000
           .                                                            12410000
                                                                        12420000
           EJECT                                                        12430000
      ***********************                                           12440000
       READ-CYCLE-LOG-HEADER.                                           12450000
      ***********************                                           12460000
                                                                        12470000
           MOVE LOW-VALUES                  TO  CLOG-KEY                12480000
           MOVE LS-STREAM-IND               TO  CLOG-KEY-STREAM-IND     12490000
           MOVE 'I'                         TO  CLOG-KEY-INOUT-IND      12500000
           MOVE '1'                         TO  CLOG-KEY-CONFIRM-IND    12510000
           MOVE CLOG-KEY                    TO  CYCLE-LOG-KEY           12520000
                                                                        12530000
           READ CYCLE-LOG                 INTO  CLOG-RECORD             12540000
                                                                        12550000
TMP        DISPLAY ' '                                                  12560000
TMP        DISPLAY 'CYCLE NBR ON CYCLE LOG = ' CLOG-LAST-SENT-CYCLE-NBR.12570000
TMP                                                                     12580000
           EVALUATE CYCLE-LOG-STATUS                                    12590000
              WHEN '00'                                                 12600000
                 MOVE CLOG-LAST-SENT-PROC-DATE  TO  WS-LAST-PROC-DATE   12610000
                 MOVE CLOG-LAST-SENT-CYCLE-NBR  TO  WS-LAST-CYCLE-NBR   12620000
                 MOVE CLOG-LAST-TO-TMSTMP       TO  WS-FROM-TMSTMP      12630000
              WHEN '23'                                                 12640000
                 DISPLAY ' '                                            12650000
                 DISPLAY '*********************************************'12660000
                 DISPLAY '* CLOG HEADER REC. FOR NSCC INPUT OUTBOUND  *'12670000
                 DISPLAY '* IS NOT FOUND - ONE WILL BE CREATED        *'12680000
                 DISPLAY '*********************************************'12690000
                 MOVE '19950101'                TO  WS-LAST-PROC-DATE   12700000
                 MOVE 9                         TO  WS-LAST-CYCLE-NBR   12710000
                 MOVE '1995-01-01-01.01.01.000001' TO WS-FROM-TMSTMP    12720000
              WHEN OTHER                                                12730000
                 DISPLAY ' '                                            12740000
                 DISPLAY '*********************************************'12750000
                 DISPLAY '* UNABLE TO READ CYCLE LOG HEADER RECORD FOR*'12760000
                 DISPLAY '* INPUT OUTBOUND, STATUS = ' CYCLE-LOG-STATUS 12770000
                         '                 *'                           12780000
                 DISPLAY '* PROGRAM IS ABENDING!                      *'12790000
                 DISPLAY '*********************************************'12800000
                 DISPLAY ' '                                            12810000
                 CALL ABEND              USING  ABEND-CODE              12820000
           END-EVALUATE                                                 12830000
                                                                        12840000
           DISPLAY ' '                                                  12850000
           DISPLAY '***********************************************'    12860000
           DISPLAY '* FROM TIMESTAMP = ' WS-FROM-TMSTMP ' *'            12870000
           DISPLAY '*---------------------------------------------*'    12880000
           DISPLAY '* TO   TIMESTAMP = ' WS-TO-TMSTMP ' *'              12890000
           DISPLAY '***********************************************'    12900000
                                                                        12910000
           .                                                            12920000
                                                                        12930000
           EJECT                                                        12940000
      **********************                                            12950000
       FORMAT-CYCLE-LOG-KEY.                                            12960000
      **********************                                            12970000
                                                                        12980000
           MOVE WS-LAST-CYCLE-NBR           TO  WS-MULTI-BATCH-NBR.     12990000
TEMP  *                                                                 13000000
           DISPLAY 'LAST CYCLE BATCH NUMBER = ' WS-MULTI-BATCH-NBR.     13010000
           DISPLAY 'LAST PROC DATE = '  WS-LAST-PROC-DATE.              13020000
           DISPLAY 'BPD PROC DATE  = ' BPD-PROC-DATE.                   13030000
TEMP  *                                                                 13040000
           IF WS-LAST-PROC-DATE = BPD-PROC-DATE                         13050000
              ADD 1                         TO  WS-MULTI-BATCH-NBR      13060000
              IF WS-MULTI-BATCH-NBR > 0009                              13070000
                 DISPLAY                                                13080000
                 'BE AWARE: THIS CYCLE NUMBER IS GREATER THAN 9!!!'     13090000
                 UPON CONSOLE                                           13100000
                 DISPLAY ' '                                            13110000
                 DISPLAY '***************************************'      13120000
                 DISPLAY '* THIS CYCLE NUMBER IS GREATER THAN 9 *'      13130000
                 DISPLAY '* NUMBER OF CYCLES SHOUD NOT EXCEED 9 *'      13140000
                 DISPLAY '***************************************'      13150000
              END-IF                                                    13160000
           ELSE                                                         13170000
              IF WS-LAST-PROC-DATE < BPD-PROC-DATE                      13180000
                 MOVE 0001                  TO  WS-MULTI-BATCH-NBR      13190000
              ELSE                                                      13200000
                 DISPLAY ' '                                            13210000
                 DISPLAY '*******************************************'  13220000
                 DISPLAY '* LAST PROCESSING DATE = ' WS-LAST-PROC-DATE  13230000
                          '         *'                                  13240000
                 DISPLAY '* CURRENT PROCESSING DATE = '                 13250000
                          BPD-PROC-DATE '      *'                       13260000
                 DISPLAY '* LAST PROC. DATE IS GREATER THAN CURRENT *'  13270000
                 DISPLAY '* PROGRAM IS ABENDING!                    *'  13280000
                 DISPLAY '*******************************************'  13290000
                 CALL ABEND              USING  ABEND-CODE              13300000
              END-IF                                                    13310000
           END-IF                                                       13320000
            MOVE LS-STREAM-IND              TO  CLOG-KEY-STREAM-IND     13330000
            SET CLOG-KEY-NSCC-INPUT         TO  TRUE                    13340000
            SET CLOG-KEY-TO-NSCC            TO  TRUE                    13350000
            MOVE BPD-PROC-DATE              TO  CLOG-KEY-PROC-DATE      13360000
            MOVE WS-MULTI-BATCH-NBR         TO  CLOG-KEY-CYCLE-NBR      13370000
            DISPLAY '*************************'                         13380000
            DISPLAY '* CURRENT CYCLE IS ' WS-MULTI-BATCH-NBR ' *'       13390000
            DISPLAY '*************************'                         13400000
                                                                        13410000
            .                                                           13420000
                                                                        13430000
           EJECT                                                        13440000
      ************************                                          13450000
       WRITE-CYCLE-LOG-DETAIL.                                          13460000
      ************************                                          13470000
      *    DISPLAY ' WRITE-CYCLE-LOG-DETAIL ------------->'.            13480000
                                                                        13490000
           MOVE SPACES                      TO  CLOG-NSCC-INPUT         13500000
           MOVE ZEROES                      TO  CLOG-SEND-TI-REC-CNTR   13510000
                                                CLOG-SEND-AT-REC-CNTR   13520000
                                                CLOG-SEND-FR-REC-CNTR   13530000
           MOVE WS-TO-TMSTMP                TO  CLOG-SEND-TMSTMP        13540000
           MOVE CLIENT-TI-REC-CNTR (S1)     TO  CLOG-SEND-TI-REC-CNTR   13550000
           MOVE CLIENT-AT-REC-CNTR (S1)     TO  CLOG-SEND-AT-REC-CNTR   13560000
           MOVE CLIENT-FR-REC-CNTR (S1)     TO  CLOG-SEND-FR-REC-CNTR   13570000
                                                                        13580000
           WRITE CYCLE-LOG-REC            FROM  CLOG-RECORD             13590000
                                                                        13600000
           EVALUATE CYCLE-LOG-STATUS                                    13610000
              WHEN '00'                                                 13620000
                 CONTINUE                                               13630000
              WHEN '22'                                                 13640000
                 REWRITE CYCLE-LOG-REC    FROM  CLOG-RECORD             13650000
                 IF CYCLE-LOG-STATUS NOT = '00'                         13660000
                    DISPLAY ' '                                         13670000
                    DISPLAY '***********************************'       13680000
                    DISPLAY '* UNABLE TO REWRITE DETAIL TO LOG *'       13690000
                    DISPLAY '* CYCLE-LOG-STATUS = ' CYCLE-LOG-STATUS    13700000
                            '           *'                              13710000
                    DISPLAY '***********************************'       13720000
                END-IF                                                  13730000
              WHEN OTHER                                                13740000
                    DISPLAY ' '                                         13750000
                    DISPLAY '*********************************'         13760000
                    DISPLAY '* UNABLE TO WRITE DETAIL TO LOG *'         13770000
                    DISPLAY '* CYCLE-LOG-STATUS = ' CYCLE-LOG-STATUS    13780000
                            '         *'                                13790000
                    DISPLAY '*********************************'         13800000
           END-EVALUATE                                                 13810000
                                                                        13820000
           .                                                            13830000
                                                                        13840000
           EJECT                                                        13850000
      ******************                                                13860000
       FETCH-TI-RECORDS.                                                13870000
      ******************                                                13880000
                                                                        13890000
           EXEC SQL OPEN NSCC_TI_CRSR END-EXEC                          13900000
           IF SQLCODE NOT = +0                                          13910000
              MOVE SQLCODE TO WS-SQLCODE                                13920000
              SET BAD-OPEN                  TO  TRUE                    13930000
              MOVE 'TI CURSOR OPEN'         TO  TROUBLE-DB2-OBJECT      13940000
              PERFORM SQL-ERROR-ROUTINE                                 13950000
           END-IF                                                       13960000
                                                                        13970000
TCK        PERFORM UNTIL WS-TI-SQLCODE NOT = +0                         13980000
              EXEC SQL                                                  13990000
                 FETCH NSCC_TI_CRSR       INTO :TI-AREA                 14000000
              END-EXEC                                                  14010000
                                                                        14020000
              MOVE SQLCODE TO WS-SQLCODE                                14030000
TCK                           WS-TI-SQLCODE                             14040000
                                                                        14050000
              EVALUATE SQLCODE                                          14060000
                 WHEN +100                                              14070000
                    CONTINUE                                            14080000
                 WHEN +0                                                14090000
                    ADD  +1  TO WS-TI-FETCH-CNTR                        14100000
TCK   *             ADD  +1  TO  CLIENT-TI-REC-CNTR (S1)                14110000
TCK   *             ADD  +1  TO  CLIENT-ALL-REC-CNTR (S1)               14120000
                    PERFORM CHECK-TI-CUTOFF                             14130000
TCK                 IF BEFORE-CUTOFF-TI                                 14140000
TCK   *                DISPLAY ' '                                      14150000
TCK   *                DISPLAY '*------ FETCH-TI-RECORDS ---------*'    14160000
TCK   *                DISPLAY ' CLIENT_NBR = ' WS-CLIENT               14170000
TCK   *                     ' DLVR_NBR =  ' TI-DLVR-NBR                 14180000
TCK   *                     ' ACCT_DLVR_NBR = ' TI-ACCT-DLVR-NBR        14190000
TCK   *                     ' RCV_NBR  =  ' TI-RCV-NBR                  14200000
TCK   *                     ' ACCT_RCV_NBR = ' TI-ACCT-RCV-NBR          14210000
TCK   *                     ' TRNFR_TYPE_CD = ' TI-TRNFR-TYPE-CD        14220000
TCK   *                     ' TRANS_TYPE_CD = ' TI-TRANS-TYPE-CD        14230000
TCK   *                     ' SBMTG_PRTCP_NBR = ' TI-SBMTG-PRTCP-NBR    14240000
TCK   *                     ' UPDT_TMSTP  = ' TI-UPDT-TMSTP             14250000
TCK   *             DISPLAY ' '                                         14260000
                       PERFORM UPDATE-TI-PEND-CD                        14270007
                       ADD +1 TO CLIENT-TI-REC-CNTR (S1)                14280000
TCK                    ADD +1 TO CLIENT-ALL-REC-CNTR (S1)               14290000
                       IF TI-TRNFR-TYPE-CD NOT = 'FUL' AND              14300000
                          TI-TRANS-RFRN-ID-CD > SPACES                  14310000
                          MOVE '2'          TO  FETCH-IND               14320000
LRM010                 ELSE                                                     
LRM010                    MOVE '1'          TO  FETCH-IND               11240000
                       END-IF                                           14330000
TCK                    PERFORM FETCH-AT-RECORDS                         14340000
TCK                 ELSE                                                14350000
                       ADD +1  TO  WS-TI-ACUTF-CNTR                     14360000
                    END-IF                                              14370000
                 WHEN OTHER                                             14380000
TCK                 DISPLAY '================================== '       14390000
TCK                 DISPLAY '**** ABEND AT FETCH-TI-RECORD **** '       14400000
TCK                 DISPLAY '================================== '       14410000
TCK                 DISPLAY ' CLIENT_NBR = ' WS-CLIENT                  14420000
TCK                         ' DLVR_NBR =  ' TI-DLVR-NBR                 14430000
TCK                         ' RCV_NBR  =  ' TI-RCV-NBR                  14440000
TCK                         ' ACCT_DLVR_NBR = ' TI-ACCT-DLVR-NBR        14450000
TCK                         ' ACCT_RCV_NBR = ' TI-ACCT-RCV-NBR          14460000
TCK                         ' TRNFR_TYPE_CD = ' TI-TRNFR-TYPE-CD        14470000
TCK                         ' TRANS_TYPE_CD = ' TI-TRANS-TYPE-CD        14480000
TCK                         ' SBMTG_PRTCP_NBR = ' TI-SBMTG-PRTCP-NBR    14490000
TCK                 DISPLAY ' '                                         14500000
                    MOVE SQLCODE TO WS-SQLCODE                          14510000
                    SET BAD-FETCH           TO  TRUE                    14520000
                    MOVE 'TI CURSOR FETCH'  TO  TROUBLE-DB2-OBJECT      14530000
                    PERFORM SQL-ERROR-ROUTINE                           14540000
              END-EVALUATE                                              14550000
           END-PERFORM                                                  14560000
                                                                        14570000
           EXEC SQL                                                     14580000
              CLOSE NSCC_TI_CRSR                                        14590000
           END-EXEC                                                     14600000
                                                                        14610000
           IF SQLCODE NOT = +0                                          14620000
              MOVE SQLCODE TO WS-SQLCODE                                14630000
              SET BAD-CLOSE                 TO  TRUE                    14640000
              MOVE 'TI CURSOR CLOSE'        TO  TROUBLE-DB2-OBJECT      14650000
              PERFORM SQL-ERROR-ROUTINE                                 14660000
           ELSE                                                         14670000
              MOVE +0                       TO  SQLCODE                 14680000
                                                WS-TI-SQLCODE           14690000
           END-IF                                                       14700000
                                                                        14710000
           .                                                            14720000
                                                                        14730000
           EJECT                                                        14740000
      ******************                                                14750000
       FETCH-AT-RECORDS.                                                14760000
      ******************                                                14770000
                                                                        14780000
           IF FETCH-IND = '1'                                           14790000
             EXEC SQL                                                   14800000
                OPEN NSCC_AT1_CRSR                                      14810000
             END-EXEC                                                   14820000
           ELSE                                                         14830000
             EXEC SQL                                                   14840000
                OPEN NSCC_AT2_CRSR                                      14850000
             END-EXEC                                                   14860000
           END-IF                                                       14870000
                                                                        14880000
           IF SQLCODE NOT = +0                                          14890000
              MOVE SQLCODE TO WS-SQLCODE                                14900000
              SET BAD-OPEN                  TO  TRUE                    14910000
              MOVE 'AT CURSOR OPEN'         TO  TROUBLE-DB2-OBJECT      14920000
              PERFORM SQL-ERROR-ROUTINE                                 14930000
           END-IF                                                       14940000
                                                                        14950000
           PERFORM UNTIL WS-AT-SQLCODE NOT = +0                         14960000
              IF FETCH-IND = '1'                                        14970000
                 EXEC SQL                                               14980000
                    FETCH NSCC_AT1_CRSR  INTO  :AT-AREA                 14990000
                 END-EXEC                                               15000000
              ELSE                                                      15010000
                 EXEC SQL                                               15020000
                    FETCH NSCC_AT2_CRSR  INTO  :AT-AREA                 15030000
                 END-EXEC                                               15040000
              END-IF                                                    15050000
                                                                        15060000
              MOVE SQLCODE TO WS-SQLCODE                                15070000
TCK           MOVE SQLCODE TO WS-AT-SQLCODE                             15080000
                                                                        15090000
              EVALUATE SQLCODE                                          15100000
                 WHEN +100                                              15110000
                   CONTINUE                                             15120000
                 WHEN +0                                                15130000
                   IF FETCH-IND = '1'                                   15140000
                      ADD +1 TO WS-AT1-FETCH-CNTR                       15150000
                   ELSE                                                 15160000
                      ADD +1 TO WS-AT2-FETCH-CNTR                       15170000
                   END-IF                                               15180000
                   IF   AT-ASSET-SEQ-NBR = 0                            15190000
                     MOVE 'A'     TO  AT-TRANS-TYPE-CD                  15200000
                   END-IF                                               15210000
                   PERFORM CHECK-AT-CUTOFF                              15220000
                   IF BEFORE-CUTOFF-AT                                  15230000
                      PERFORM UPDATE-AT-PEND-CD                         15240000
                      ADD +1 TO CLIENT-AT-REC-CNTR (S1)                 15250000
TCK                   ADD +1 TO CLIENT-ALL-REC-CNTR (S1)                15260000
                      IF AT-STTLM-LCTN-CD = '10'                        15270000
DJ0004                AND NOT (AT-TRNFR-TYPE-CD = 'PTR' AND             15280000
DJ0004                         AT-SBMTG-PRTCP-NBR = AT-RCV-NBR)         15290000
                         PERFORM FORMAT-FUNDS-PORTION                   15300000
                         ADD +1 TO  WS-AT-MF-CNTR                       15310000
                      END-IF                                            15320000
                      MOVE 0 TO SQLCODE                                 15330000
                   ELSE                                                 15340000
                       ADD +1  TO  WS-AT-ACUTF-CNTR                     15350000
                   END-IF                                               15360000
                 WHEN OTHER                                             15370000
TCK                 DISPLAY '================================== '       15380000
TCK                 DISPLAY '**** ABEND AT FETCH-AT-RECORD **** '       15390000
TCK                 DISPLAY '================================== '       15400000
TCK                 DISPLAY ' CLIENT_NBR =  ' WS-CLIENT                 15410000
TCK                 DISPLAY ' DLVR_NBR =  ' TI-DLVR-NBR                 15420000
TCK                 DISPLAY ' RCV_NBR  =  ' TI-RCV-NBR                  15430000
TCK                 DISPLAY ' ACCT_DLVR_NBR = ' TI-ACCT-DLVR-NBR        15440000
TCK                 DISPLAY ' ACCT_RCV_NBR = ' TI-ACCT-RCV-NBR          15450000
TCK                 DISPLAY ' TRNFR_TYPE_CD = ' TI-TRNFR-TYPE-CD        15460000
TCK                 DISPLAY ' TRANS_TYPE_CD = ' TI-TRANS-TYPE-CD        15470000
TCK                 DISPLAY ' CSH_MGN_SHRT_CD = ' AT-CSH-MGN-SHRT-CD    15480000
TCK                 DISPLAY ' OPTN_CTGY_CD = ' AT-OPTN-CTGY-CD          15490000
                    MOVE SQLCODE TO WS-SQLCODE                          15500000
                   SET BAD-FETCH          TO  TRUE                      15510000
                   IF FETCH-IND = '1'                                   15520000
                      MOVE 'AT1 CURSR FETCH' TO  TROUBLE-DB2-OBJECT     15530000
                   ELSE                                                 15540000
                      MOVE 'AT2 CURSR FETCH' TO  TROUBLE-DB2-OBJECT     15550000
                   END-IF                                               15560000
                   PERFORM SQL-ERROR-ROUTINE                            15570000
              END-EVALUATE                                              15580000
           END-PERFORM                                                  15590000
                                                                        15600000
      *    IF SQLCODE NOT = +100                                        15610000
      *       SET BAD-FETCH                 TO  TRUE                    15620000
      *       IF FETCH-IND = '1'                                        15630000
      *          MOVE 'AT1 CURSR FETCH'    TO  TROUBLE-DB2-OBJECT       15640000
      *       ELSE                                                      15650000
      *          MOVE 'AT2 CURSR FETCH'    TO  TROUBLE-DB2-OBJECT       15660000
      *       END-IF                                                    15670000
      *       PERFORM SQL-ERROR-ROUTINE                                 15680000
      *    END-IF                                                       15690000
                                                                        15700000
                                                                        15710000
           IF FETCH-IND = '1'                                           15720000
              EXEC SQL                                                  15730000
                 CLOSE NSCC_AT1_CRSR                                    15740000
              END-EXEC                                                  15750000
           ELSE                                                         15760000
              EXEC SQL                                                  15770000
                 CLOSE NSCC_AT2_CRSR                                    15780000
              END-EXEC                                                  15790000
           END-IF                                                       15800000
                                                                        15810000
           IF SQLCODE NOT = +0                                          15820000
              MOVE SQLCODE TO WS-SQLCODE                                15830000
              SET BAD-CLOSE                 TO  TRUE                    15840000
              IF FETCH-IND = '1'                                        15850000
                 MOVE 'AT1 CURSR CLOSE'    TO  TROUBLE-DB2-OBJECT       15860000
              ELSE                                                      15870000
                 MOVE 'AT2 CURSR CLOSE'      TO  TROUBLE-DB2-OBJECT     15880000
              END-IF                                                    15890000
              PERFORM SQL-ERROR-ROUTINE                                 15900000
           ELSE                                                         15910000
              MOVE +0                       TO  SQLCODE                 15920000
                                                WS-AT-SQLCODE           15930000
           END-IF                                                       15940000
                                                                        15950000
           .                                                            15960000
                                                                        15970000
           EJECT                                                        15980000
      ******************                                                15990000
       FETCH-FR-RECORDS.                                                16000000
      ******************                                                16010000
                                                                        16020000
           EXEC SQL OPEN NSCC_FR_CRSR END-EXEC                          16030000
           IF SQLCODE NOT = +0                                          16040000
              MOVE SQLCODE TO WS-SQLCODE                                16050000
              SET BAD-OPEN                  TO  TRUE                    16060000
              MOVE 'FR CURSOR'              TO  TROUBLE-DB2-OBJECT      16070000
              PERFORM SQL-ERROR-ROUTINE                                 16080000
           END-IF                                                       16090000
                                                                        16100000
TCK        PERFORM UNTIL WS-FR-SQLCODE NOT = +0                         16110000
              EXEC SQL                                                  16120000
                 FETCH NSCC_FR_CRSR INTO :FR-AREA                       16130000
              END-EXEC                                                  16140000
                                                                        16150000
TCK           MOVE SQLCODE TO WS-FR-SQLCODE                             16160000
                                                                        16170000
              EVALUATE SQLCODE                                          16180000
                 WHEN +100                                              16190000
                    CONTINUE                                            16200000
                 WHEN +0                                                16210000
LRM                 IF FR-NSCC-PEND-CD = 'Y'                            16220000
LRM                    PERFORM UPDATE-FR-PEND-CD-R                      16230000
                    ELSE                                                16240000
                      ADD +1 TO WS-FR-FETCH-CNTR                        16250000
                      PERFORM CHECK-FR-CUTOFF                           16260000
                      IF BEFORE-CUTOFF-FR                               16270000
                         PERFORM UPDATE-FR-PEND-CD                      16280000
  TCK                    ADD +1 TO CLIENT-FR-REC-CNTR (S1)              16290000
  TCK                    ADD +1 TO CLIENT-ALL-REC-CNTR (S1)             16300000
                      ELSE                                              16310000
                         ADD +1  TO  WS-AT-ACUTF-CNTR                   16320000
                      END-IF                                            16330000
                    END-IF                                              16340000
                 WHEN OTHER                                             16350000
TCK                 DISPLAY '================================== '       16360000
TCK                 DISPLAY '**** ABEND AT FETCH-FR-RECORD **** '       16370000
TCK                 DISPLAY '================================== '       16380000
TCK                 DISPLAY ' CLIENT_NBR = ' WS-CLIENT                  16390000
TCK                 DISPLAY ' DLVR_NBR =  ' AT-DLVR-NBR                 16400000
TCK                 DISPLAY ' RCV_NBR  =  ' AT-RCV-NBR                  16410000
TCK                 DISPLAY ' ACCT_DLVR_NBR = ' AT-ACCT-DLVR-NBR        16420000
TCK                 DISPLAY ' ACCT_RCV_NBR = ' AT-ACCT-RCV-NBR          16430000
TCK                 DISPLAY ' TRNFR_TYPE_CD = ' AT-TRNFR-TYPE-CD        16440000
TCK                 DISPLAY ' TRANS_TYPE_CD = ' AT-TRANS-TYPE-CD        16450000
TCK                 DISPLAY ' SBMTG_PRTCP_NBR = ' AT-SBMTG-PRTCP-NBR    16460000
TCK                 DISPLAY ' '                                         16470000
                    MOVE SQLCODE TO WS-SQLCODE                          16480000
                    SET BAD-FETCH           TO  TRUE                    16490000
                    MOVE 'FR CURSOR FETCH'        TO  TROUBLE-DB2-OBJECT16500000
                    PERFORM SQL-ERROR-ROUTINE                           16510000
              END-EVALUATE                                              16520000
           END-PERFORM                                                  16530000
                                                                        16540000
      *    IF SQLCODE NOT = +100                                        16550000
      *       SET BAD-FETCH                 TO  TRUE                    16560000
      *       MOVE 'FR CURSOR FETCH'        TO  TROUBLE-DB2-OBJECT      16570000
      *       PERFORM SQL-ERROR-ROUTINE                                 16580000
      *    END-IF                                                       16590000
                                                                        16600000
           EXEC SQL                                                     16610000
              CLOSE NSCC_FR_CRSR                                        16620000
           END-EXEC                                                     16630000
                                                                        16640000
           IF SQLCODE NOT = +0                                          16650000
              MOVE SQLCODE TO WS-SQLCODE                                16660000
              SET BAD-CLOSE                 TO  TRUE                    16670000
              MOVE 'FR CURSOR CLOSE'        TO  TROUBLE-DB2-OBJECT      16680000
              PERFORM SQL-ERROR-ROUTINE                                 16690000
           ELSE                                                         16700000
              MOVE +0                       TO  SQLCODE                 16710000
                                                WS-FR-SQLCODE           16720000
           END-IF                                                       16730000
                                                                        16740000
           .                                                            16750000
                                                                        16760000
           EJECT                                                        16770000
      *******************                                               16780000
       UPDATE-TI-PEND-CD.                                               16790000
      *******************                                               16800000
TEMP***    DISPLAY '  UPDATE-TI-PEND-CD =======>   '                    16810000
                                                                        16820007
DJ0006*---(WRITE ACTIVITY RECORD BEFORE PRGM-NM GET OVERLAYED)          16830007
DJ0006*---(FOR PRGM_NM LIKE 'ACAT%%%%')                                 16840007
DJ0006     IF  (TI-PRGM-NM (1:4) = 'ACAT')                              16850031
DJ0006     AND (TI-TRANS-TYPE-CD = 'R' OR 'A')                          16860049
DJ0006        PERFORM 7300-WRITE-ACATACTF-TI THRU 7300-EXIT             16870052
DJ0006     END-IF.                                                      16860049
                                                                        16880007
           MOVE WS-MULTI-BATCH-NBR-ALPHA (3:2) TO TI-CYCLE-CD.          16890000
LRM010     IF CLIENT-B1-ASCENDIS (S1) = '1'                                     
LRM010        MOVE 'U' TO TI-NSCC-ACK-IND                                       
             EXEC SQL                                                   16900000
              UPDATE ACTITRF                                            16910000
              SET NSCC_PEND_CD = 'Y'                                    16920000
LRM010           ,NSCC_ACK_IND = :TI-NSCC-ACK-IND                               
                 ,CYCLE_CD     = :TI-CYCLE-CD                           16930000
                 ,UPDT_TMSTP   = :WS-TMSTMP-TIME                        16940000
                 ,PRGM_NM      = 'CAT500A '                             16950000
TCK           WHERE CLIENT_NBR    = :WS-CLIENT                          16960000
TCK             AND DLVR_NBR      = :TI-DLVR-NBR                        16970000
TCK             AND ACCT_DLVR_NBR = :TI-ACCT-DLVR-NBR                   16980000
TCK             AND RCV_NBR       = :TI-RCV-NBR                         16990000
TCK             AND ACCT_RCV_NBR  = :TI-ACCT-RCV-NBR                    17000000
TCK             AND TRNFR_TYPE_CD = :TI-TRNFR-TYPE-CD                   17010000
LRM007          AND ACAT_CONTROL_NBR = :TI-ACAT-CONTROL-NBR             17020000
             END-EXEC                                                   17030000
LRM010     ELSE                                                                 
LRM010       IF TI-NSCC-ACK-IND = 'P'                                           
LRM010           MOVE 'S' TO TI-NSCC-ACK-IND                                    
LRM010       ELSE                                                               
LRM010          DISPLAY 'UNEXPECTED ACK-IND ON TI ' TI-NSCC-ACK-IND             
LRM010            ' ' WS-CLIENT ' ' TI-ACCT-DLVR-NBR                    16960000
LRM010            ' ' TI-ACCT-RCV-NBR                                   17000000
LRM010       END-IF                                                             
LRM010       EXEC SQL                                                   16900000
LRM010        UPDATE ACTITRF                                            16910000
LRM010        SET NSCC_ACK_IND = :TI-NSCC-ACK-IND                               
LRM010        WHERE CLIENT_NBR    = :WS-CLIENT                          16960000
LRM010          AND DLVR_NBR      = :TI-DLVR-NBR                        16970000
LRM010          AND ACCT_DLVR_NBR = :TI-ACCT-DLVR-NBR                   16980000
LRM010          AND RCV_NBR       = :TI-RCV-NBR                         16990000
LRM010          AND ACCT_RCV_NBR  = :TI-ACCT-RCV-NBR                    17000000
LRM010          AND TRNFR_TYPE_CD = :TI-TRNFR-TYPE-CD                   17010000
LRM010          AND ACAT_CONTROL_NBR = :TI-ACAT-CONTROL-NBR             17020000
LRM010        END-EXEC                                                  17030000
LRM010     END-IF                                                       17030000
                                                                        17040000
           IF SQLCODE NOT = +0                                          17050000
TCK           DISPLAY '**** ABEND AT UPDATE-TI-RECORD **** '            17060000
TCK           DISPLAY ' CLIENT_NBR = ' WS-CLIENT                        17070000
TCK           DISPLAY ' DLVR_NBR =  ' TI-DLVR-NBR                       17080000
TCK           DISPLAY ' RCV_NBR  =  ' TI-RCV-NBR                        17090000
TCK           DISPLAY ' ACCT_DLVR_NBR = ' TI-ACCT-DLVR-NBR              17100000
TCK           DISPLAY ' ACCT_RCV_NBR = ' TI-ACCT-RCV-NBR                17110000
TCK           DISPLAY ' TRNFR_TYPE_CD = ' TI-TRNFR-TYPE-CD              17120000
TCK           DISPLAY ' TRANS_TYPE_CD = ' TI-TRANS-TYPE-CD              17130000
TCK           DISPLAY ' SBMTG_PRTCP_NBR = ' TI-SBMTG-PRTCP-NBR          17140000
TCK           DISPLAY ' '                                               17150000
              MOVE SQLCODE TO WS-SQLCODE                                17160000
              SET BAD-UPDATE               TO  TRUE                     17170000
              MOVE 'ACTITRF UPDATE'        TO  TROUBLE-DB2-OBJECT       17180000
              PERFORM SQL-ERROR-ROUTINE                                 17190000
TCK        ELSE                                                         17200000
TCK           ADD  +1  TO  WS-TOTAL-TI-REC-CNTR                         17210000
TCK           ADD  +1  TO  WS-TOTAL-REC-CNTR                            17220000
              ADD  +1  TO  WS-TI-UPDT-CNTR                              17230000
TCK           ADD  +1  TO  WS-COMMIT-CTR                                17240000
TEMP          ADD  +1  TO  WS-ABEND-CTR                                 17250000
TCK           IF WS-COMMIT-CTR > +0                                     17260000
                 MOVE WS-CLIENT         TO WS-TI-CLIENT                 17270000
TCK              MOVE TI-DLVR-NBR       TO WS-TI-DLVR-NBR               17280000
TCK              MOVE TI-ACCT-DLVR-NBR  TO WS-TI-ACCT-DLVR-NBR          17290000
TCK              MOVE TI-RCV-NBR        TO WS-TI-RCV-NBR                17300000
TCK              MOVE TI-ACCT-RCV-NBR   TO WS-TI-ACCT-RCV-NBR           17310000
TCK              MOVE TI-TRNFR-TYPE-CD  TO WS-TI-TRNFR-TYPE-CD          17320000
TCK              PERFORM DB2-COMMIT                                     17330000
TEMP  *       ELSE                                                      17340000
TEMP  *          IF WS-ABEND-CTR > +42                                  17350000
TEMP  *             DISPLAY '!!!!!!!  FORCE ABEND  !!!!!!!!'            17360000
TEMP  *             PERFORM ENDJOB-ROUTINE                              17370000
TEMP  *             SET BAD-UPDATE         TO  TRUE                     17380000
TEMP  *             MOVE 'ACTITRF UPDATE' TO   TROUBLE-DB2-OBJECT       17390000
TEMP  *             PERFORM SQL-ERROR-ROUTINE                           17400000
TCK           END-IF                                                    17410000
           END-IF.                                                      17420000
                                                                        17430000
           EJECT                                                        17440000
      *******************                                               17450000
       UPDATE-AT-PEND-CD.                                               17460000
      *******************                                               17470000
                                                                        17540007
           MOVE WS-MULTI-BATCH-NBR-ALPHA (4:1) TO AT-RCRD-STTS-CD.      17550000
LRM001     IF AT-PRGM-NM(1 : 6) = 'ACAT04'                              17560000
LRM001        MOVE 'CAT500RD' TO PRGM-NM OF DCLACTIAST                  17570000
LRM001     ELSE                                                         17580000
LRM001        MOVE 'CAT500A ' TO PRGM-NM OF DCLACTIAST                  17590000
LRM001     END-IF.                                                      17600000
LRM010     IF  CLIENT-B1-ASCENDIS (S1) = '1'                                    
              EXEC SQL                                                  17620000
                 UPDATE ACTIAST                                         17630000
                 SET NSCC_PEND_CD = 'Y'                                 17640000
LRM009              ,NSCC_ACK_IND = 'U'                                         
                    ,RCRD_STTS_CD = :AT-RCRD-STTS-CD                    17650000
                    ,UPDT_TMSTP   = :WS-TMSTMP-TIME                     17660000
                    ,PRGM_NM      = :DCLACTIAST.PRGM-NM                 17670000
TCK              WHERE CLIENT_NBR        = :WS-CLIENT                   17680000
TCK                AND DLVR_NBR          = :AT-DLVR-NBR                 17690000
TCK                AND ACCT_DLVR_NBR     = :AT-ACCT-DLVR-NBR            17700000
TCK                AND RCV_NBR           = :AT-RCV-NBR                  17710000
TCK                AND ACCT_RCV_NBR      = :AT-ACCT-RCV-NBR             17720000
TCK                AND ISIN_CNTRY_CD     = :AT-ISIN-CNTRY-CD            17730000
TCK                AND ISIN_SEC_ISSUE_CD = :AT-ISIN-SEC-ISSUE-CD        17740000
TCK                AND ISIN_SEC_CDG_CD   = :AT-ISIN-SEC-CDG-CD          17750000
TCK                AND STTLM_LCTN_CD     = :AT-STTLM-LCTN-CD            17760000
TCK                AND CSH_MGN_SHRT_CD   = :AT-CSH-MGN-SHRT-CD          17770000
              END-EXEC                                                  17780000
LRM010     ELSE                                                                 
LRM010       IF AT-NSCC-ACK-IND = 'P'                                           
TEST             DISPLAY 'STARTING WITH P ' AT-ACAT-CONTROL-NBR                 
LRM010           MOVE 'S' TO AT-NSCC-ACK-IND                                    
LRM010       ELSE                                                               
LRM010          DISPLAY 'UNEXPECTED ACK-IND ON AT ' AT-NSCC-ACK-IND             
LRM010            ' ' WS-CLIENT ' ' AT-ACAT-CONTROL-NBR                 16960000
LRM010       END-IF                                                             
TEST         DISPLAY 'USING ' AT-NSCC-ACK-IND ' ' AT-ACAT-CONTROL-NBR           
TEST            ' FETCH-IND ' FETCH-IND                                         
LRM010       EXEC SQL                                                   17620000
LRM010           UPDATE ACTIAST                                         17630000
LRM010           SET NSCC_ACK_IND = :AT-NSCC-ACK-IND                    17640000
LRM010           WHERE CLIENT_NBR        = :WS-CLIENT                   17680000
LRM010             AND ASSET_SEQ_NBR     = :AT-ASSET-SEQ-NBR            17680000
LRM010             AND ACAT_CONTROL_NBR  = :AT-ACAT-CONTROL-NBR                 
LRM010             AND TRNFR_TYPE_CD     = :AT-TRNFR-TYPE-CD                    
LRM010             AND DLVR_NBR          = :AT-DLVR-NBR                 17690000
LRM010             AND ACCT_DLVR_NBR     = :AT-ACCT-DLVR-NBR            17700000
LRM010             AND RCV_NBR           = :AT-RCV-NBR                  17710000
LRM010             AND ACCT_RCV_NBR      = :AT-ACCT-RCV-NBR             17720000
LRM010             AND ISIN_CNTRY_CD     = :AT-ISIN-CNTRY-CD            17730000
LRM010             AND ISIN_SEC_ISSUE_CD = :AT-ISIN-SEC-ISSUE-CD        17740000
LRM010             AND ISIN_SEC_CDG_CD   = :AT-ISIN-SEC-CDG-CD          17750000
LRM010             AND STTLM_LCTN_CD     = :AT-STTLM-LCTN-CD            17760000
LRM010             AND CSH_MGN_SHRT_CD   = :AT-CSH-MGN-SHRT-CD          17770000
LRM010       END-EXEC                                                   17780000
LRM010     END-IF.                                                      17970000
TEMP ****  DISPLAY '  UPDATE-AT-PEND-CD =======>  CURSOR= ' FETCH-IND   17980000
TEMP ****  DISPLAY '         TI-TRNFR-TYPE-CD = ' TI-TRNFR-TYPE-CD      17990000
                                                                        18000000
           IF SQLCODE NOT = +0                                          18010000
TCK           DISPLAY '=================================== '            18020000
TCK           DISPLAY '**** ABEND AT UPDATE-AT-RECORD **** '            18030000
TCK           DISPLAY '=================================== '            18040000
TCK           DISPLAY ' CLIENT_NBR =  ' WS-CLIENT                       18050000
TCK           DISPLAY ' DLVR_NBR =  ' TI-DLVR-NBR                       18060000
TCK           DISPLAY ' RCV_NBR  =  ' TI-RCV-NBR                        18070000
TCK           DISPLAY ' ACCT_DLVR_NBR = ' TI-ACCT-DLVR-NBR              18080000
TCK           DISPLAY ' ACCT_RCV_NBR = ' TI-ACCT-RCV-NBR                18090000
TCK           DISPLAY ' TRNFR_TYPE_CD = ' TI-TRNFR-TYPE-CD              18100000
TCK           DISPLAY ' TRANS_TYPE_CD = ' TI-TRANS-TYPE-CD              18110000
TCK           DISPLAY ' CSH_MGN_SHRT_CD = ' AT-CSH-MGN-SHRT-CD          18120000
TCK           DISPLAY ' OPTN_CTGY_CD = ' AT-OPTN-CTGY-CD                18130000
              MOVE SQLCODE TO WS-SQLCODE                                18140000
              SET BAD-UPDATE                TO  TRUE                    18150000
              MOVE 'ACTIAST UPDATE'        TO  TROUBLE-DB2-OBJECT       18160000
              PERFORM SQL-ERROR-ROUTINE                                 18170000
TCK        ELSE                                                         18180000
TCK           IF FETCH-IND = '1'                                        18190000
                 ADD +1 TO WS-AT1-UPDT-CNTR                             18200000
              ELSE                                                      18210000
                 ADD +1 TO WS-AT2-UPDT-CNTR                             18220000
              END-IF                                                    18230000
TCK           ADD  +1  TO WS-TOTAL-AT-REC-CNTR                          18240000
TCK           ADD  +1  TO  WS-TOTAL-REC-CNTR                            18250000
TCK           ADD  +1  TO  WS-COMMIT-CTR                                18260000
TEMP          ADD  +1  TO  WS-ABEND-CTR                                 18270000
TCK           IF WS-COMMIT-CTR > +0                                     18280000
TCK                MOVE WS-CLIENT            TO WS-AT-CLIENT            18290000
TCK                MOVE AT-DLVR-NBR          TO WS-AT-DLVR-NBR          18300000
TCK                MOVE AT-ACCT-DLVR-NBR     TO WS-AT-ACCT-DLVR-NBR     18310000
TCK                MOVE AT-RCV-NBR           TO WS-AT-RCV-NBR           18320000
TCK                MOVE AT-ACCT-RCV-NBR      TO WS-AT-ACCT-RCV-NBR      18330000
TCK                MOVE AT-ISIN-SEC-ISSUE-CD TO WS-AT-SEC-CD            18340000
TCK                MOVE AT-ISIN-SEC-CDG-CD   TO WS-AT-SEC-CDG-CD        18350000
TCK                MOVE AT-STTLM-LCTN-CD     TO WS-AT-STTLM-LCTN-CD     18360000
TCK                MOVE AT-CSH-MGN-SHRT-CD   TO WS-AT-CSH-MGN-SHRT-CD   18370000
TCK              PERFORM DB2-COMMIT                                     18380000
TCK           END-IF                                                    18390000
           END-IF.                                                      18400000
                                                                        18410000
           EJECT                                                        18420000
      *******************                                               18430000
       UPDATE-FR-PEND-CD.                                               18440000
      *******************                                               18450000
                                                                        18460000
TEMP ****  DISPLAY '  UPDATE-FR-PEND-CD =======>   '                    18470000
           MOVE WS-MULTI-BATCH-NBR-ALPHA (4:1) TO FR-RCRD-STTS-CD.      18480000
           EXEC SQL                                                     18490000
              UPDATE VFNDRGST                                           18500000
              SET NSCC_PEND_CD = 'Y'                                    18510000
                 ,RCRD_STTS_CD = :FR-RCRD-STTS-CD                       18520000
                 ,UPDT_TMSTP   = :WS-TMSTMP-TIME                        18530000
                 ,PRGM_NM      = 'CAT500A '                             18540000
TCK           WHERE CLIENT_NBR       = :WS-CLIENT                       18550000
TCK             AND ACAT_CONTROL_NBR = :FR-ACAT-CONTROL-NBR             18560000
TCK             AND ASSET_SEQ_NBR    = :FR-ASSET-SEQ-NBR                18570000
           END-EXEC                                                     18580000
                                                                        18590000
           IF SQLCODE NOT = +0                                          18600000
TCK           DISPLAY '==================================='             18610000
TCK           DISPLAY '**** ABEND AT UPDATE-FR-RECORD ****'             18620000
TCK           DISPLAY '==================================='             18630000
TCK           DISPLAY ' CLIENT_NBR =  ' WS-CLIENT                       18640000
TCK           DISPLAY ' DLVR_NBR = ' TI-DLVR-NBR                        18650000
TCK           DISPLAY ' RCV_NBR  =  ' TI-RCV-NBR                        18660000
TCK           DISPLAY ' ACCT_DLVR_NBR = ' TI-ACCT-DLVR-NBR              18670000
TCK           DISPLAY ' ACCT_RCV_NBR = ' TI-ACCT-RCV-NBR                18680000
TCK           DISPLAY ' TRNFR_TYPE_CD = ' TI-TRNFR-TYPE-CD              18690000
TCK           DISPLAY ' TRANS_TYPE_CD = ' TI-TRANS-TYPE-CD              18700000
TCK           DISPLAY ' CSH_MGN_SHRT_CD = ' AT-CSH-MGN-SHRT-CD          18710000
TCK           DISPLAY ' OPTN_CTGY_CD = ' AT-OPTN-CTGY-CD                18720000
TCK           DISPLAY ' ACAT_CONTROL_NBR = ' FR-ACAT-CONTROL-NBR        18730000
TCK           DISPLAY ' ASSET_SEQ_NBR = ' FR-ASSET-SEQ-NBR              18740000
              MOVE SQLCODE TO WS-SQLCODE                                18750000
              SET BAD-UPDATE                TO  TRUE                    18760000
              MOVE 'VFNDRGST UPDATE'       TO  TROUBLE-DB2-OBJECT       18770000
              PERFORM SQL-ERROR-ROUTINE                                 18780000
TCK        ELSE                                                         18790000
TCK           ADD  +1  TO  WS-FR-UPDT-CNTR                              18800000
TCK           ADD  +1  TO  WS-TOTAL-FR-REC-CNTR                         18810000
TCK           ADD  +1  TO  WS-TOTAL-REC-CNTR                            18820000
TCK           ADD  +1  TO  WS-COMMIT-CTR                                18830000
TEMP          ADD  +1  TO  WS-ABEND-CTR                                 18840000
TCK           IF WS-COMMIT-CTR > +0                                     18850000
                 MOVE WS-CLIENT           TO WS-FR-CLIENT               18860000
                 MOVE FR-ACAT-CONTROL-NBR TO WS-FR-ACAT-CONTROL-NBR     18870000
                 MOVE FR-ASSET-SEQ-NBR    TO WS-FR-ASSET-SEQ-NBR        18880000
TCK              PERFORM DB2-COMMIT                                     18890000
              END-IF                                                    18900000
           END-IF                                                       18910000
           .                                                            18920000
      *******************                                               18930000
LRM    UPDATE-FR-PEND-CD-R.                                             18940000
      *******************                                               18950000
LRM**** THIS PARAGRAPH WAS ADDED TO MARK ANY FUND REGISTRATIONS THAT    18960000
LRM**** MISSED THE CUTOFF AS "R" AND NOT SEND TO NSCC.                  18970000
                                                                        18980000
           EXEC SQL                                                     18990000
              UPDATE VFNDRGST                                           19000000
              SET NSCC_PEND_CD = 'R'                                    19010000
              WHERE CLIENT_NBR       = :WS-CLIENT                       19020000
                AND ACAT_CONTROL_NBR = :FR-ACAT-CONTROL-NBR             19030000
                AND ASSET_SEQ_NBR    = :FR-ASSET-SEQ-NBR                19040000
           END-EXEC                                                     19050000
                                                                        19060000
           IF SQLCODE NOT = +0                                          19070000
              DISPLAY '==================================='             19080000
              DISPLAY '** ABEND AT UPDATE-FR-PEND-CD-R  **'             19090000
              DISPLAY '==================================='             19100000
              DISPLAY ' CLIENT_NBR =  ' WS-CLIENT                       19110000
TCK           DISPLAY ' DLVR_NBR = ' TI-DLVR-NBR                        19120000
TCK           DISPLAY ' RCV_NBR  =  ' TI-RCV-NBR                        19130000
TCK           DISPLAY ' ACCT_DLVR_NBR = ' TI-ACCT-DLVR-NBR              19140000
TCK           DISPLAY ' ACCT_RCV_NBR = ' TI-ACCT-RCV-NBR                19150000
TCK           DISPLAY ' TRNFR_TYPE_CD = ' TI-TRNFR-TYPE-CD              19160000
TCK           DISPLAY ' TRANS_TYPE_CD = ' TI-TRANS-TYPE-CD              19170000
TCK           DISPLAY ' CSH_MGN_SHRT_CD = ' AT-CSH-MGN-SHRT-CD          19180000
TCK           DISPLAY ' OPTN_CTGY_CD = ' AT-OPTN-CTGY-CD                19190000
TCK           DISPLAY ' ACAT_CONTROL_NBR = ' FR-ACAT-CONTROL-NBR        19200000
TCK           DISPLAY ' ASSET_SEQ_NBR = ' FR-ASSET-SEQ-NBR              19210000
              MOVE SQLCODE TO WS-SQLCODE                                19220000
              SET BAD-UPDATE                TO  TRUE                    19230000
              MOVE 'VFNDRGST UPDATE'       TO  TROUBLE-DB2-OBJECT       19240000
              PERFORM SQL-ERROR-ROUTINE                                 19250000
TCK        ELSE                                                         19260000
TCK           ADD  +1  TO  WS-FR-UPDT-CNTR                              19270000
TCK           ADD  +1  TO  WS-TOTAL-FR-REC-CNTR                         19280000
TCK           ADD  +1  TO  WS-TOTAL-REC-CNTR                            19290000
TCK           ADD  +1  TO  WS-COMMIT-CTR                                19300000
TEMP          ADD  +1  TO  WS-ABEND-CTR                                 19310000
TCK           IF WS-COMMIT-CTR > +0                                     19320000
                 MOVE WS-CLIENT           TO WS-FR-CLIENT               19330000
                 MOVE FR-ACAT-CONTROL-NBR TO WS-FR-ACAT-CONTROL-NBR     19340000
                 MOVE FR-ASSET-SEQ-NBR    TO WS-FR-ASSET-SEQ-NBR        19350000
TCK              PERFORM DB2-COMMIT                                     19360000
              END-IF                                                    19370000
           END-IF                                                       19380000
           .                                                            19390000
           EJECT                                                        19400000
      *****************                                                 19410000
       CHECK-TI-CUTOFF.                                                 19420000
      *****************                                                 19430000
                                                                        19440000
           EXEC SQL                                                     19450000
              SET :WS-TMSTMP-TIME = CURRENT TIMESTAMP                   19460000
           END-EXEC                                                     19470000
                                                                        19480000
           IF SQLCODE NOT = +0                                          19490000
              MOVE SQLCODE TO WS-SQLCODE                                19500000
              MOVE 'TI TIMESTAMP'           TO  TROUBLE-DB2-OBJECT      19510000
              PERFORM SQL-ERROR-ROUTINE                                 19520000
           END-IF                                                       19530000
                                                                        19540000
           MOVE WS-TMSTMP-HH                TO  WS-CURRENT-HH           19550000
           MOVE WS-TMSTMP-MM                TO  WS-CURRENT-MM           19560000
           MOVE WS-TMSTMP-SS                TO  WS-CURRENT-SS           19570000
           MOVE WS-TMSTMP-NNS               TO  WS-CURRENT-NNS          19580000
                                                                        19590000
           SET BEFORE-CUTOFF-TI             TO  TRUE                    19600000
                                                                        19610000
           EVALUATE TI-TRANS-TYPE-CD                                    19620000
              WHEN 'A'                                                  19630000
                 IF WS-CURRENT-TIME > WS-TIA-TIME                       19640000
                    SET AFTER-CUTOFF-TI     TO  TRUE                    19650000
                 END-IF                                                 19660000
              WHEN 'C'                                                  19670000
                 IF WS-CURRENT-TIME > WS-TIC-TIME                       19680000
                    SET AFTER-CUTOFF-TI     TO  TRUE                    19690000
                 END-IF                                                 19700000
              WHEN 'R'                                                  19710000
                 IF TI-SBMTG-PRTCP-NBR = TI-DLVR-NBR AND                19720000
                    (TI-TRNFR-TYPE-RJCT-CD >= 01 AND <= 09)             19730000
                    IF WS-CURRENT-TIME > WS-TIRD-TIME                   19740000
LRM005              OR (TI-TRNFR-TYPE-CD = 'PTR'                        19750000
LRM010               AND WS-CURRENT-TIME > WS-TIRD-TIME)                19760000
LRM005****           AND WS-CURRENT-TIME > WS-TIA-TIME)                 19760000
                       SET AFTER-CUTOFF-TI     TO  TRUE                 19770000
                    END-IF                                              19780000
                 ELSE                                                   19790000
                    IF TI-SBMTG-PRTCP-NBR = TI-RCV-NBR AND              19800000
                       TI-TRNFR-TYPE-RJCT-CD >= 21 AND <= 26            19810000
                       IF WS-CURRENT-TIME > WS-TIRR-TIME                19820000
                          SET AFTER-CUTOFF-TI  TO  TRUE                 19830000
                       END-IF                                           19840000
                    END-IF                                              19850000
                 END-IF                                                 19860000
              WHEN 'X'                                                  19870000
                 IF WS-CURRENT-TIME > WS-TIX-TIME                       19880000
                    SET AFTER-CUTOFF-TI     TO  TRUE                    19890000
LRM009* CODE BELOW REMOVED TO NOT SEND F/R TO ASCENDIS UNTIL FUTURE             
LRM009* CHANGES ARE MADE TO SUPPORT THIS.                                       
LRM008***********ELSE                                                   19900000
LRM008***            DISPLAY 'LOOKING FOR ACCEL FUNDS '                 19910000
LRM008***                 TI-ACAT-CONTROL-NBR                           19920000
LRM008***            MOVE TI-ACAT-CONTROL-NBR TO AT-ACAT-CONTROL-NBR    19930000
LRM008***************PERFORM RELEASE-FR-FOR-SPECIALS                    19940000
                 END-IF                                                 19950000
              WHEN OTHER                                                19960000
                 CONTINUE                                               19970000
           END-EVALUATE.                                                19980000
                                                                        19990000
           EJECT                                                        20000000
      *****************                                                 20010000
       CHECK-AT-CUTOFF.                                                 20020000
      *****************                                                 20030000
                                                                        20040000
           EXEC SQL                                                     20050000
              SET :WS-TMSTMP-TIME = CURRENT TIMESTAMP                   20060000
           END-EXEC                                                     20070000
                                                                        20080000
           IF SQLCODE NOT = +0                                          20090000
              MOVE SQLCODE TO WS-SQLCODE                                20100000
              MOVE 'AT TIMESTAMP'           TO  TROUBLE-DB2-OBJECT      20110000
              PERFORM SQL-ERROR-ROUTINE                                 20120000
           END-IF                                                       20130000
                                                                        20140000
           MOVE WS-TMSTMP-HH                TO  WS-CURRENT-HH           20150000
           MOVE WS-TMSTMP-MM                TO  WS-CURRENT-MM           20160000
           MOVE WS-TMSTMP-SS                TO  WS-CURRENT-SS           20170000
           MOVE WS-TMSTMP-NNS               TO  WS-CURRENT-NNS          20180000
                                                                        20190000
TCK        SET BEFORE-CUTOFF-AT             TO  TRUE                    20200000
                                                                        20210000
********* CUTOFF-TIME = PARM TIME SPECIFIED; ATA OR ATCD.               20220000
********* CURRENT TIME = 12 BYTE TIME DERIVED FROM SQL CURR TMSTMP.     20230000
LRM005**<< AT ADD CUT OFF TIME FOR DELIVERER PTR IS CYCLE 3 WHICH   >>  20240000
LRM005**<< IS SAME AS TI CUT OFF TIME                               >>  20250000
           EVALUATE TRUE                                                20260000
              WHEN AT-TRANS-TYPE-CD = 'A'                               20270000
LRM005           IF (AT-TRNFR-TYPE-CD   = 'PTR'          AND            20280000
LRM005               AT-RCV-NBR     NOT = WS-ADP-BROKER  AND            20290000
LRM005               AT-SBMTG-PRTCP-NBR = WS-ADP-BROKER )               20300000
LRM005               IF WS-CURRENT-TIME > WS-TIA-TIME                   20310000
LRM005                  SET AFTER-CUTOFF-AT     TO  TRUE                20320000
LRM005               END-IF                                             20330000
LRM005           ELSE                                                   20340000
                 IF WS-CURRENT-TIME > WS-ATA-TIME                       20350000
TCK                 SET AFTER-CUTOFF-AT     TO  TRUE                    20360000
TEST                DISPLAY 'AT ADD CURRENT TIME ' WS-CURRENT-TIME      20370000
TEST                       ' PAST ATA CUTOFF ' WS-ATA-TIME              20380000
                 END-IF                                                 20390000
LRM005           END-IF                                                 20400000
              WHEN AT-TRANS-TYPE-CD = 'C' OR 'D'                        20410000
LRM001           IF AT-TRANS-TYPE-CD = 'D'                              20420000
LRM001           AND AT-PRGM-NM(1 : 6) = 'ACAT04'                       20430000
LRM001             IF  WS-CURRENT-TIME > WS-ATRD-TIME                   20440000
LRM001               SET AFTER-CUTOFF-AT     TO  TRUE                   20450000
LRM001                 DISPLAY 'AT RD CURRENT TIME ' WS-CURRENT-TIME    20460000
LRM001                      ' PAST ATRD CUTOFF ' WS-ATRD-TIME           20470000
LRM001             ELSE                                                 20480000
LRM001                 CONTINUE                                         20490000
LRM001           ELSE                                                   20500000
                 IF WS-CURRENT-TIME > WS-ATCD-TIME                      20510000
TCK                 SET AFTER-CUTOFF-AT     TO  TRUE                    20520000
TEST                DISPLAY 'AT C/D CURRENT TIME ' WS-CURRENT-TIME      20530000
TEST                       ' PAST ATCD CUTOFF ' WS-ATCD-TIME            20540000
                 END-IF END-IF                                          20550000
DJ0002           IF  AT-TRANS-TYPE-CD = 'D'                             20560000
DJ0002           AND BEFORE-CUTOFF-AT                                   20570000
DJ0002               PERFORM RELEASE-FR-FOR-SPECIALS                    20580000
DJ0002           END-IF                                                 20590000
              WHEN OTHER                                                20600000
TEST                DISPLAY 'AT CUTOFF WITH UNKNOWN A/C/D TRANS TYPE '  20610000
TEST                      AT-TRANS-TYPE-CD                              20620000
           END-EVALUATE                                                 20630000
           .                                                            20640000
           EJECT                                                        20650000
DJ0002*******************************                                   20660000
DJ0002 RELEASE-FR-FOR-SPECIALS.                                         20670000
DJ0002*******************************                                   20680000
DJ0002* RELEASE THE FUND REGISTRATIONS WHEN THERE IS AN ASSET DELETE    20690000
LRM008* OR THE CLIENT ACCELERATES TO THRANSFER.                         20700000
DJ0002* IF FUND REG ALREADY RELEASED FOR THIS CTL NBR, BYPASS.          20710000
DJ0002                                                                  20720000
DJ0002     IF  AT-ACAT-CONTROL-NBR NOT = FR-ACAT-CONTROL-NBR            20730000
DJ0002         PERFORM UPDATE-FR-PEND-CD-FOR-SPECIALS                   20740000
DJ0002     END-IF                                                       20750000
DJ0002     .                                                            20760000
           EJECT                                                        20770000
DJ0002*******************************                                   20780000
DJ0002 UPDATE-FR-PEND-CD-FOR-SPECIALS.                                  20790000
DJ0002*******************************                                   20800000
DJ0002* CHANGE THE PEND CODE TO ' ' TO RELEASE FUND REGISTRATIONS       20810000
DJ0002*                                                                 20820000
DJ0002     DISPLAY '  UPDATE-FR-PEND-CD-FOR-SPECIALS FOR'               20830000
DJ0002                  ' ' WS-CLIENT                                   20840000
DJ0002                  ' ' AT-ACAT-CONTROL-NBR                         20850000
DJ0002                  ' ' AT-ASSET-SEQ-NBR                            20860000
DJ0002          '  (TO RELEASE FR BECAUSE USER DELETED SOME ASSETS)'    20870000
DJ0002     MOVE WS-MULTI-BATCH-NBR-ALPHA (4:1) TO FR-RCRD-STTS-CD       20880000
DJ0002     MOVE AT-ACAT-CONTROL-NBR            TO FR-ACAT-CONTROL-NBR   20890000
DJ0002                                                                  20900000
DJ0002     EXEC SQL                                                     20910000
DJ0002        UPDATE VFNDRGST                                           20920000
DJ0002        SET NSCC_PEND_CD = ' '                                    20930000
DJ0002           ,RCRD_STTS_CD = :FR-RCRD-STTS-CD                       20940000
DJ0002           ,UPDT_TMSTP   = :WS-TMSTMP-TIME                        20950000
DJ0002           ,PRGM_NM      = 'CAT500A '                             20960000
DJ0002        WHERE CLIENT_NBR       = :WS-CLIENT                       20970000
DJ0002          AND ACAT_CONTROL_NBR = :FR-ACAT-CONTROL-NBR             20980000
DJ0002     END-EXEC                                                     20990000
DJ0002                                                                  21000000
DJ0002     MOVE SQLERRD(3)          TO W-SQLERRD-3                      21010000
DJ0002     MOVE W-SQLERRD-3         TO W-SQL-COUNT                      21020000
DJ0002                                                                  21030000
DJ0002     IF SQLCODE = +0                                              21040000
DJ0002          DISPLAY '    FR RELEASED FOR'                           21050000
DJ0002                  ' ' WS-CLIENT                                   21060000
DJ0002                  ' ' FR-ACAT-CONTROL-NBR                         21070000
DJ0002          ' COUNT = ' W-SQL-COUNT                                 21080000
DJ0002        ADD  W-SQLERRD-3      TO WS-FR-UPDT-CNTR                  21090000
DJ0002        ADD  W-SQLERRD-3      TO WS-TOTAL-FR-REC-CNTR             21100000
DJ0002        ADD  W-SQLERRD-3      TO WS-TOTAL-REC-CNTR                21110000
DJ0002        ADD  W-SQLERRD-3      TO WS-COMMIT-CTR                    21120000
DJ0002        ADD  W-SQLERRD-3      TO WS-ABEND-CTR                     21130000
DJ0002        IF WS-COMMIT-CTR > +0                                     21140000
DJ0002           MOVE WS-CLIENT           TO WS-FR-CLIENT               21150000
DJ0002           MOVE FR-ACAT-CONTROL-NBR TO WS-FR-ACAT-CONTROL-NBR     21160000
DJ0002           MOVE FR-ASSET-SEQ-NBR    TO WS-FR-ASSET-SEQ-NBR        21170000
DJ0002           PERFORM DB2-COMMIT                                     21180000
DJ0002        END-IF                                                    21190000
DJ0002     ELSE                                                         21200000
DJ0002       IF SQLCODE = +100                                          21210000
DJ0002          DISPLAY '    NO FR FOUND FOR'                           21220000
DJ0002                  ' ' WS-CLIENT                                   21230000
DJ0002                  ' ' FR-ACAT-CONTROL-NBR                         21240000
DJ0002       ELSE                                                       21250000
DJ0002          DISPLAY '==========================================='   21260000
DJ0002          DISPLAY '*** ABEND AT UPDATE-FR-PEND-CD-FOR-SPECIALS'   21270000
DJ0002          DISPLAY '==========================================='   21280000
DJ0002          DISPLAY ' CLIENT_NBR =  ' WS-CLIENT                     21290000
DJ0002          DISPLAY ' DLVR_NBR = ' TI-DLVR-NBR                      21300000
DJ0002          DISPLAY ' RCV_NBR  =  ' TI-RCV-NBR                      21310000
DJ0002          DISPLAY ' ACCT_DLVR_NBR = ' TI-ACCT-DLVR-NBR            21320000
DJ0002          DISPLAY ' ACCT_RCV_NBR = ' TI-ACCT-RCV-NBR              21330000
DJ0002          DISPLAY ' TRNFR_TYPE_CD = ' TI-TRNFR-TYPE-CD            21340000
DJ0002          DISPLAY ' TRANS_TYPE_CD = ' TI-TRANS-TYPE-CD            21350000
DJ0002          DISPLAY ' CSH_MGN_SHRT_CD = ' AT-CSH-MGN-SHRT-CD        21360000
DJ0002          DISPLAY ' OPTN_CTGY_CD = ' AT-OPTN-CTGY-CD              21370000
DJ0002          DISPLAY ' ACAT_CONTROL_NBR = ' FR-ACAT-CONTROL-NBR      21380000
DJ0002          DISPLAY ' ASSET_SEQ_NBR = '    FR-ASSET-SEQ-NBR         21390000
DJ0002          MOVE SQLCODE TO WS-SQLCODE                              21400000
DJ0002          SET BAD-UPDATE                TO  TRUE                  21410000
DJ0002          MOVE 'VFNDRGST UPDATE'       TO  TROUBLE-DB2-OBJECT     21420000
DJ0002          PERFORM SQL-ERROR-ROUTINE                               21430000
DJ0002       END-IF                                                     21440000
DJ0002     END-IF                                                       21450000
DJ0002     .                                                            21460000
           EJECT                                                        21470000
      *****************                                                 21480000
       CHECK-FR-CUTOFF.                                                 21490000
      *****************                                                 21500000
                                                                        21510000
           EXEC SQL                                                     21520000
              SET :WS-TMSTMP-TIME = CURRENT TIMESTAMP                   21530000
           END-EXEC                                                     21540000
                                                                        21550000
           IF SQLCODE NOT = +0                                          21560000
              MOVE SQLCODE TO WS-SQLCODE                                21570000
              MOVE 'FR TIMESTAMP'           TO  TROUBLE-DB2-OBJECT      21580000
              PERFORM SQL-ERROR-ROUTINE                                 21590000
           END-IF                                                       21600000
                                                                        21610000
           MOVE WS-TMSTMP-HH                TO  WS-CURRENT-HH           21620000
           MOVE WS-TMSTMP-MM                TO  WS-CURRENT-MM           21630000
           MOVE WS-TMSTMP-SS                TO  WS-CURRENT-SS           21640000
           MOVE WS-TMSTMP-NNS               TO  WS-CURRENT-NNS          21650000
                                                                        21660000
           IF WS-CURRENT-TIME > WS-FRA-TIME                             21670000
              SET AFTER-CUTOFF-FR           TO  TRUE                    21680000
           ELSE                                                         21690000
              SET BEFORE-CUTOFF-FR          TO  TRUE                    21700000
           END-IF.                                                      21710000
                                                                        21720000
           EJECT                                                        21730000
      **********************                                            21740000
       FORMAT-FUNDS-PORTION.                                            21750000
      **********************                                            21760000
                                                                        21770000
      ** JUST TO CHECK IF ACTIMF ROW DOES EXIST ***                     21780000
                                                                        21790000
           EXEC SQL                                                     21800000
              SELECT                                                    21810000
                 FNBR,                                                  21820000
                 BK_PHSCL_SHR_CD,                                       21830000
                 NTWRK_CNTL_CD,                                         21840000
                 ACCT_TYPE_CD,                                          21850000
                 DVDND_CD,                                              21860000
                 LTCG_CD,                                               21870000
                 STCG_CD,                                               21880000
                 DVDND_PAYEE_CD,                                        21890000
                 BRKR_EXCTG_NBR,                                        21900000
                 MF_FULL_PRTL_CD                                        21910000
              INTO :ATF-AREA                                            21920000
              FROM ACTIMF                                               21930000
              WHERE CLIENT_NBR        = :WS-CLIENT             AND      21940000
                    RCV_NBR           = :AT-RCV-NBR            AND      21950000
                    ACCT_DLVR_NBR     = :AT-ACCT-DLVR-NBR      AND      21960000
                    ACCT_RCV_NBR      = :AT-ACCT-RCV-NBR       AND      21970000
                    DLVR_NBR          = :AT-DLVR-NBR           AND      21980000
                    STTLM_LCTN_CD     = :AT-STTLM-LCTN-CD      AND      21990000
                    ISIN_CNTRY_CD     = :AT-ISIN-CNTRY-CD      AND      22000000
                    ISIN_SEC_ISSUE_CD = :AT-ISIN-SEC-ISSUE-CD  AND      22010000
                    ISIN_SEC_CDG_CD   = :AT-ISIN-SEC-CDG-CD    AND      22020000
                    CSH_MGN_SHRT_CD   = :AT-CSH-MGN-SHRT-CD    AND      22030000
LRM007              ACAT_CONTROL_NBR  = :AT-ACAT-CONTROL-NBR   AND      22040000
LRM007              ASSET_SEQ_NBR     = :AT-ASSET-SEQ-NBR               22050000
           END-EXEC                                                     22060000
                                                                        22070000
           EVALUATE SQLCODE                                             22080000
              WHEN 0                                                    22090000
                 CONTINUE                                               22100000
TEMP  **   DISPLAY ' '                                                  22110000
TEMP  *    DISPLAY '**  FORMAT-FUND-PORTION  =============> '           22120000
      *       DISPLAY ' WS-CLIENT =  ' WS-CLIENT                        22130000
      *               ' AT-ACAT-CONTROL-NBR = ' AT-ACAT-CONTROL-NBR     22140000
      *               ' AT-RCV-NBR =  ' AT-RCV-NBR                      22150000
      *               ' AT-ACCT-RCV-NBR = ' AT-ACCT-RCV-NBR             22160000
      *               ' AT-DLVR-NBR =  ' AT-DLVR-NBR                    22170000
      *               ' AT-ACCT-DLVR-NBR = ' AT-ACCT-DLVR-NBR           22180000
      *               ' AT-ISIN-CNTRY-CD = ' AT-ISIN-CNTRY-CD           22190000
      *               ' AT-ISIN-SEC-ISSUE-CD = ' AT-ISIN-SEC-ISSUE-CD   22200000
      *               ' AT-ISIN-SEC-CDG-CD = ' AT-ISIN-SEC-CDG-CD       22210000
      *               ' AT-STTLM-LCTN-CD =  ' AT-STTLM-LCTN-CD          22220000
      *               ' AT-CSH-MGN-SHRT-CD = ' AT-CSH-MGN-SHRT-CD       22230000
      *       DISPLAY ' ------------   ATF-AREA  ------------------'    22240000
      *               '   ATF-FNBR = ' ATF-FNBR,                        22250000
      *               ' ATF-BK-PHSCL-SHR-CD = ' ATF-BK-PHSCL-SHR-CD,    22260000
      *               ' ATF-NTWRK-CNTL-CD = ' ATF-NTWRK-CNTL-CD,        22270000
      *               ' ATF-ACCT-TYPE-CD = ' ATF-ACCT-TYPE-CD ,         22280000
      *               ' ATF-DVDND-CD = ' ATF-DVDND-CD,                  22290000
      *               ' ATF-LTCG-CD = ' ATF-LTCG-CD,                    22300000
      *               ' ATF-STCG-CD = ' ATF-STCG-CD,                    22310000
      *               ' ATF-DVDND-PAYEE-CD = ' ATF-DVDND-PAYEE-CD,      22320000
      *               ' ATF-BRKR-EXCTG-NBR = ' ATF-BRKR-EXCTG-NBR       22330000
      *               ' ATF-MF-FULL-PRTL-CD = ' ATF-MF-FULL-PRTL-CD     22340000
TEMP  ***  DISPLAY ' '                                                  22350000
              WHEN +100                                                 22360000
                 PERFORM MOVE-FUND-DEFAULTS                             22370000
                 PERFORM INSERT-FUND-DEFAULTS                           22380000
                 MOVE +0 TO SQLCODE                                     22390000
              WHEN OTHER                                                22400000
              DISPLAY ' '                                               22410000
              DISPLAY '========================================='       22420000
              DISPLAY '######### TROUBLE IN SELECT ACTIMF #####'        22430000
              DISPLAY '========================================='       22440000
              DISPLAY '  CLIENT_NBR = ' WS-CLIENT                       22450000
                   ' ACAT_CONTROL_NBR = ' AT-ACAT-CONTROL-NBR           22460000
                   ' RCV_NBR  = ' AT-RCV-NBR                            22470000
                   ' ACCT_DLVR_NBR = ' AT-ACCT-DLVR-NBR                 22480000
                   ' ACCT_RCV_NBR  = ' AT-ACCT-RCV-NBR                  22490000
                   ' DLVR_NBR  = ' AT-DLVR-NBR                          22500000
                   ' STTLM_LCTN_CD  = ' AT-STTLM-LCTN-CD                22510000
                   ' ISIN_CNTRY_CD  = ' AT-ISIN-CNTRY-CD                22520000
                   ' ISIN_SEC_ISSUE_CD = ' AT-ISIN-SEC-ISSUE-CD         22530000
                   ' ISIN_SEC_CDG_CD = ' AT-ISIN-SEC-CDG-CD             22540000
                   ' CSH_MGN_SHRT_CD = ' AT-CSH-MGN-SHRT-CD             22550000
LRM007             ' ACAT_CONTROL_NBR = ' AT-ACAT-CONTROL-NBR           22560000
LRM007             ' ASSET_SEQ_NBR = ' AT-ASSET-SEQ-NBR                 22570000
                 MOVE SQLCODE TO WS-SQLCODE                             22580000
                 SET BAD-SELECT             TO  TRUE                    22590000
                 MOVE 'ACTIMF SELECT'       TO  TROUBLE-DB2-OBJECT      22600000
                 PERFORM SQL-ERROR-ROUTINE                              22610000
           END-EVALUATE                                                 22620000
           MOVE +0                       TO  SQLCODE.                   22630000
                                                                        22640000
                                                                        22650000
           EJECT                                                        22660000
      ********************                                              22670000
       MOVE-FUND-DEFAULTS.                                              22680000
      ********************                                              22690000
                                                                        22700000
           INITIALIZE DCLACTIMF                                         22710000
                      ATF-AREA.                                         22720000
           MOVE AT-ACCT-DLVR-NBR (1:3)      TO  WS-BRCH.                22730000
           MOVE AT-ACCT-DLVR-NBR (4:5)      TO  WS-ACCT.                22740000
                                                                        22750000
           EVALUATE AT-CSH-MGN-SHRT-CD                                  22760000
              WHEN 'C'                                                  22770000
                 MOVE '1'                    TO  WS-T                   22780000
              WHEN 'M'                                                  22790000
                 MOVE '2'                    TO  WS-T                   22800000
              WHEN 'S'                                                  22810000
                 MOVE '5'                    TO  WS-T                   22820000
              WHEN OTHER                                                22830000
                 MOVE ' '                    TO  WS-T                   22840000
           END-EVALUATE.                                                22850000
                                                                        22860000
           CALL  CKDIGIT                  USING  WS-BRCH-ACCT-TC        22870000
                                                 W-CKDIGIT-LEN          22880000
                                                 WS-C.                  22890000
                                                                        22900000
DJ0005     MOVE WS-BRCH-ACCT-TC   TO W-CKDIGIT-ACCT-TC                  22910000
DJ0005     IF CLIENT-B1-SINGLE-FUND-ACCOUNT (S1) = '1'                  22920000
DJ0005        MOVE W-CKDIGIT-ACCT-TC TO W-CKDIGIT-ACCT-TC-1             22930000
DJ0005        IF W-CKDIGIT-TYPE = '1'                                   22940000
DJ0005           CONTINUE                                               22950000
DJ0005        ELSE                                                      22960000
DJ0005           MOVE '1'        TO W-CKDIGIT-TYPE-1                    22970000
DJ0005           MOVE ' '        TO W-CKDIGIT-CK-1                      22980000
DJ0005           CALL CKDIGIT USING W-CKDIGIT-ACCT-T-1                  22990000
DJ0005                              W-CKDIGIT-LEN                       23000000
DJ0005                              W-CKDIGIT-CK-1                      23010000
DJ0005           DISPLAY ' W-CKDIGIT-ACCT-TC=' W-CKDIGIT-ACCT-TC        23020000
DJ0005                   ' W-CKDIGIT-ACCT-TC-1=' W-CKDIGIT-ACCT-TC-1    23030000
DJ0005        END-IF                                                    23040000
DJ0005     END-IF.                                                      23050000
                                                                        23060000
LRM001     SET NTW-NOT-NSCCSRC-ACCT         TO  TRUE.                   23070000
           PERFORM READ-NTWREGOP.                                       23080000
                                                                        23090000
           PERFORM READ-NTWMAST.                                        23100000
                                                                        23110000
           MOVE SPACES                      TO  ATF-FNBR.               23120000
           IF AT-TRANS-TYPE-CD = 'A'                                    23130000
DJ0005      IF CLIENT-B1-SINGLE-FUND-ACCOUNT (S1) = '1'                 23140000
DJ0005        MOVE WS-CLIENT (2:3)          TO  ATF-FNBR (1:3)          23150000
DJ0005        MOVE W-CKDIGIT-ACCT-TC-1      TO  ATF-FNBR (4:10)         23160000
DJ0005     ELSE                                                         23170000
              MOVE WS-CLIENT (2:3)          TO  ATF-FNBR (1:3)          23180000
DJ0005        MOVE W-CKDIGIT-ACCT-TC        TO  ATF-FNBR (4:10)         23190000
DJ0005     END-IF.                                                      23200000
                                                                        23210000
           IF IO-SUCCESSFUL                                             23220000
              IF (MATRIX-LEVEL = '1' OR '2' OR '3' OR '4')              23230000
DJ0005         IF CLIENT-B1-SINGLE-FUND-ACCOUNT (S1) = '1'              23240000
DJ0005            MOVE WS-CLIENT (2:3)      TO  ATF-FNBR (1:3)          23250000
DJ0005            MOVE W-CKDIGIT-ACCT-TC-1  TO  ATF-FNBR (4:10)         23260000
DJ0005         ELSE                                                     23270000
                  MOVE WS-CLIENT (2:3)      TO  ATF-FNBR (1:3)          23280000
DJ0005            MOVE W-CKDIGIT-ACCT-TC    TO  ATF-FNBR (4:10)         23290000
DJ0005         END-IF                                                   23300000
              ELSE                                                      23310000
                 IF MATRIX-LEVEL = '6'                                  23320000
                    MOVE CUST-ACCT-NO       TO  ATF-FNBR                23330000
                 END-IF                                                 23340000
              END-IF                                                    23350000
           ELSE                                                         23360000
              IF NTW-HOUSE-ACCT                                         23370000
                 MOVE NTW-HOUSE-ACCOUNT     TO  ATF-FNBR                23380000
              END-IF                                                    23390000
           END-IF.                                                      23400000
                                                                        23410000
           IF NTW-OMNIBUS-ACCT                                          23420000
LRM004     OR NTW-DST-MFE-ACCT                                          23430000
              MOVE NTW-HOUSE-ACCOUNT        TO  ATF-FNBR                23440000
           END-IF.                                                      23450000
                                                                        23460000
           MOVE '0'                         TO  ATF-NTWRK-CNTL-CD.      23470000
                                                                        23480000
           IF NTW-HOUSE-ACCT                                            23490000
              MOVE '0'                      TO  ATF-NTWRK-CNTL-CD       23500000
           END-IF.                                                      23510000
                                                                        23520000
           IF IO-SUCCESSFUL                                             23530000
              IF MATRIX-LEVEL = '1' OR '2' OR '3' OR '4'                23540000
                 MOVE MATRIX-LEVEL          TO  ATF-NTWRK-CNTL-CD       23550000
              ELSE                                                      23560000
                 IF MATRIX-LEVEL = '6'                                  23570000
                    MOVE '0'                TO  ATF-NTWRK-CNTL-CD       23580000
                 END-IF                                                 23590000
              END-IF                                                    23600000
           END-IF.                                                      23610000
                                                                        23620000
           MOVE 'R'                      TO  ATF-DVDND-CD               23630000
                                             ATF-LTCG-CD                23640000
                                             ATF-STCG-CD.               23650000
                                                                        23660000
           IF IO-SUCCESSFUL                                             23670000
              EVALUATE DIVIDEND-CODE                                    23680000
                 WHEN '0'                                               23690000
                    MOVE 'C'             TO  ATF-DVDND-CD               23700000
                    MOVE 'C'             TO  ATF-LTCG-CD                23710000
                    MOVE 'C'             TO  ATF-STCG-CD                23720000
                 WHEN '1'                                               23730000
                    MOVE 'R'             TO  ATF-DVDND-CD               23740000
                    MOVE 'R'             TO  ATF-LTCG-CD                23750000
                    MOVE 'R'             TO  ATF-STCG-CD                23760000
                 WHEN '2'                                               23770000
                    MOVE 'C'             TO  ATF-DVDND-CD               23780000
                    MOVE 'C'             TO  ATF-LTCG-CD                23790000
                    MOVE 'R'             TO  ATF-STCG-CD                23800000
                 WHEN '3'                                               23810000
                    MOVE 'C'             TO  ATF-DVDND-CD               23820000
                    MOVE 'R'             TO  ATF-LTCG-CD                23830000
                    MOVE 'R'             TO  ATF-STCG-CD                23840000
                 WHEN '4'                                               23850000
                    MOVE 'C'             TO  ATF-DVDND-CD               23860000
                    MOVE 'R'             TO  ATF-LTCG-CD                23870000
                    MOVE 'C'             TO  ATF-STCG-CD                23880000
                 WHEN '5'                                               23890000
                    MOVE 'R'             TO  ATF-DVDND-CD               23900000
                    MOVE 'C'             TO  ATF-LTCG-CD                23910000
                    MOVE 'C'             TO  ATF-STCG-CD                23920000
                 WHEN '6'                                               23930000
                    MOVE 'R'             TO  ATF-DVDND-CD               23940000
                    MOVE 'R'             TO  ATF-LTCG-CD                23950000
                    MOVE 'C'             TO  ATF-STCG-CD                23960000
                 WHEN '7'                                               23970000
                    MOVE 'R'             TO  ATF-DVDND-CD               23980000
                    MOVE 'C'             TO  ATF-LTCG-CD                23990000
                    MOVE 'R'             TO  ATF-STCG-CD                24000000
              END-EVALUATE                                              24010000
           END-IF.                                                      24020000
                                                                        24030000
           MOVE '1'                         TO  ATF-ACCT-TYPE-CD.       24040000
                                                                        24050000
           IF NTW-OMNIBUS-ACCT OR                                       24060000
LRM004        NTW-DST-MFE-ACCT OR                                       24070000
              NTW-HOUSE-ACCT   OR                                       24080000
             (IO-SUCCESSFUL AND MATRIX-LEVEL = '3')                     24090000
              MOVE '2'                      TO  ATF-ACCT-TYPE-CD        24100000
           ELSE                                                         24110000
              IF IO-SUCCESSFUL                                          24120000
                 IF MATRIX-LEVEL = '1' OR '2' OR '3' OR '4'             24130000
                    MOVE '1'                TO  ATF-ACCT-TYPE-CD        24140000
                 END-IF                                                 24150000
              END-IF                                                    24160000
           END-IF.                                                      24170000
                                                                        24180000
           MOVE '1'                         TO  ATF-BK-PHSCL-SHR-CD.    24190000
                                                                        24200000
           IF NTW-OMNIBUS-ACCT OR                                       24210000
LRM004        NTW-DST-MFE-ACCT OR                                       24220000
              NTW-HOUSE-ACCT   OR                                       24230000
             (IO-SUCCESSFUL AND MATRIX-LEVEL = '6')                     24240000
              MOVE '1'                      TO  ATF-BK-PHSCL-SHR-CD     24250000
           ELSE                                                         24260000
              IF IO-SUCCESSFUL                                          24270000
                 IF MATRIX-LEVEL = '1' OR '2' OR '3' OR '4'             24280000
                    MOVE '0'                TO  ATF-BK-PHSCL-SHR-CD     24290000
                 END-IF                                                 24300000
              END-IF                                                    24310000
           END-IF.                                                      24320000
                                                                        24330000
LRM001     MOVE CLIENT-B1-NS-BRCH-NSCC-BOX (S1) TO NS-BRCH-ACCT-TC.     24340000
LRM001     IF IO-SUCCESSFUL                                             24350000
LRM001        IF     NTW-NSCCSRC-ACCT                                   24360000
LRM001        AND (NS-BRCH-ACCT-TC NOT = SPACE AND LOW-VALUE)           24370000
LRM001        DISPLAY 'APPLY O-NSCC B1 537596 TO FNBR: '                24380000
LRM001                NS-BRCH-ACCT-TC                                   24390000
LRM001        MOVE WS-CLIENT (2:3)       TO  ATF-FNBR (1:3)             24400000
LRM001        MOVE NS-BRCH-ACCT-TC       TO  ATF-FNBR (4:  )            24410000
LRM001        MOVE '0'                   TO  ATF-BK-PHSCL-SHR-CD        24420000
LRM001        MOVE '3'                   TO  ATF-NTWRK-CNTL-CD          24430000
LRM001     END-IF.                                                      24440000
LRM004     IF IO-SUCCESSFUL                                             24450000
LRM004     AND NTW-DST-MFE-ACCT                                         24460000
LRM004     AND (WS-DST-BOX-ACCT-TC NOT = SPACE AND LOW-VALUE)           24470000
LRM004       DISPLAY 'APPLY O-NSCC B1 537601 TO FNBR: '                 24480000
LRM004                WS-DST-BOX-ACCT-TC                                24490000
LRM004       MOVE WS-CLIENT (2:3)       TO  ATF-FNBR (1:3)              24500000
LRM004       MOVE WS-DST-BOX-ACCT-TC    TO  ATF-FNBR (4:  )             24510000
LRM004       MOVE '0'                   TO  ATF-BK-PHSCL-SHR-CD         24520000
LRM004       MOVE '3'                   TO  ATF-NTWRK-CNTL-CD           24530000
LRM004     END-IF.                                                      24540000
                                                                        24550000
           MOVE 'N'                         TO  RANGE-FOUND.            24560000
                                                                        24570000
           PERFORM VARYING S4 FROM 1 BY 1                               24580000
              UNTIL S4 > CLIENT-B1-EXEC-BKR-REC-NO (S1) OR              24590000
                         RANGE-FOUND = 'Y' OR                           24600000
                         (S4 > 200)                                     24610000
              IF WS-BRCH >= CLIENT-B1-EXEC-BKR-LO (S1, S4)  AND         24620000
                 WS-BRCH <= CLIENT-B1-EXEC-BKR-HI (S1, S4)              24630000
                 MOVE CLIENT-B1-EXEC-BKR-CLEAR (S1, S4)                 24640000
                                             TO ATF-BRKR-EXCTG-NBR      24650000
                 MOVE 'Y'                    TO  RANGE-FOUND            24660000
              END-IF                                                    24670000
           END-PERFORM.                                                 24680000
                                                                        24690000
           IF RANGE-FOUND = 'N' OR                                      24700000
             (RANGE-FOUND = 'Y' AND                                     24710000
              ATF-BRKR-EXCTG-NBR = ('0000' OR SPACES OR LOW-VALUES))    24720000
              MOVE CLIENT-B1-434636 (S1)    TO  ATF-BRKR-EXCTG-NBR      24730000
           END-IF.                                                      24740000
                                                                        24750000
           IF NTW-OMNIBUS-ACCT                                          24760000
LRM004     OR NTW-DST-MFE-ACCT                                          24770000
              MOVE CLIENT-B1-434636 (S1)    TO  ATF-BRKR-EXCTG-NBR      24780000
           END-IF.                                                      24790000
                                                                        24800000
DJ0007***--                                                             24800000
DJ0007***--USE MFEXBR FOR FR-BRKR-EXCTG-NBR IF B1 537483 = '1'          24800000
DJ0007     IF  CLIENT-B1-EXBR-OPTION (S1) = '1'                         24800000
DJ0007         PERFORM READ-MFMSD                                       24800000
DJ0007         PERFORM READ-MFEXBR                                      24800000
DJ0007         IF W-MFEXBR-FND-SW = 'Y'                                 24800000
DJ0007            MOVE EXBR-EXECUTING-BROKER                            24800000
DJ0007                                 TO FR-BRKR-EXCTG-NBR             24800000
DJ0007         END-IF                                                   24800000
DJ0007     END-IF                                                       24800000
                                                                        24800000
           MOVE 'N'                         TO  ATF-DVDND-PAYEE-CD.     24810000
                                                                        24820000
           IF NTW-OMNIBUS-ACCT OR                                       24830000
LRM004        NTW-DST-MFE-ACCT OR                                       24840000
              NTW-HOUSE-ACCT                                            24850000
              MOVE '1'                      TO  ATF-DVDND-PAYEE-CD      24860000
           ELSE                                                         24870000
              IF IO-SUCCESSFUL                                          24880000
                 IF MATRIX-LEVEL = '1' OR '2' OR '3' OR '4'             24890000
                    EVALUATE PAYABLE-INFO-INDICATOR                     24900000
                       WHEN '0'                                         24910000
                          MOVE '0'          TO  ATF-DVDND-PAYEE-CD      24920000
                       WHEN '3'                                         24930000
                          MOVE '1'          TO  ATF-DVDND-PAYEE-CD      24940000
                       WHEN OTHER                                       24950000
                          MOVE 'N'          TO  ATF-DVDND-PAYEE-CD      24960000
                    END-EVALUATE                                        24970000
                 END-IF                                                 24980000
              ELSE                                                      24990000
                 EVALUATE CLIENT-B1-434619 (S1)                         25000000
                    WHEN '0'                                            25010000
                       MOVE 'N'             TO  ATF-DVDND-PAYEE-CD      25020000
                    WHEN '1'                                            25030000
                       MOVE '0'             TO  ATF-DVDND-PAYEE-CD      25040000
                    WHEN '2'                                            25050000
                       MOVE '1'             TO  ATF-DVDND-PAYEE-CD      25060000
                    WHEN '3'                                            25070000
                       MOVE '2'             TO  ATF-DVDND-PAYEE-CD      25080000
                    WHEN OTHER                                          25090000
                       MOVE 'N'             TO  ATF-DVDND-PAYEE-CD      25100000
                 END-EVALUATE                                           25110000
              END-IF                                                    25120000
           END-IF.                                                      25130000
                                                                        25140000
           MOVE '2'                         TO  ATF-MF-FULL-PRTL-CD.    25150000
                                                                        25160000
           IF NTW-OMNIBUS-ACCT  OR                                      25170000
LRM004        NTW-DST-MFE-ACCT  OR                                      25180000
              NTW-HOUSE-ACCT                                            25190000
              MOVE '2'                      TO  ATF-MF-FULL-PRTL-CD     25200000
           ELSE                                                         25210000
LRM006        IF AT-TRNFR-TYPE-CD = 'FUL'                               25220000
              AND (MATRIX-LEVEL = '1' OR '2' OR '3' OR '4')             25230000
                 MOVE '1'                   TO  ATF-MF-FULL-PRTL-CD     25240000
              END-IF                                                    25250000
           END-IF.                                                      25260000
                                                                        25270000
           EJECT                                                        25280000
      ***************                                                   25290000
       READ-NTWREGOP.                                                   25300000
      ***************                                                   25310000
                                                                        25320000
           MOVE 'N'                         TO  NTW-HOUSE-ACCT-SW.      25330000
           MOVE 'N'                         TO  NTW-OMNIBUS-ACCT-SW.    25340000
           MOVE SPACES                      TO  NTW-HOUSE-ACCOUNT.      25350000
           MOVE SPACES                      TO  NTWREG-REC.             25360000
           MOVE SPACES                      TO  NTWREG-KEY-IN.          25370000
           MOVE WS-CLIENT (2:3)             TO  NTWREG-KEY-IN (1:3).    25380000
           MOVE AT-ISIN-SEC-ISSUE-CD        TO  NTWREG-KEY-IN (6:9).    25390000
                                                                        25400000
DJ0001     MOVE NTWREG-KEY-IN               TO  W-REG-OPT-KEY-SAVE      25410000
           READ NTWREG-FILE               INTO  NTWREG-REC.             25420000
                                                                        25430000
           IF NTWREG-FILE-STATUS = '00' OR '97'                         25440000
           IF WS-CLIENT (2:3) = CLIENT-NO OF NTWREG-REC AND             25450000
              AT-ISIN-SEC-ISSUE-CD  = CUSIP-9 OF NTWREG-REC             25460000
              IF REG-OP-HOUSE-ACCT > SPACES                             25470000
                 MOVE REG-OP-HOUSE-ACCT     TO  NTW-HOUSE-ACCOUNT       25480000
                 SET NTW-HOUSE-ACCT         TO  TRUE                    25490000
              ELSE                                                      25500000
                 MOVE SPACES                TO  NTW-HOUSE-ACCOUNT       25510000
                 MOVE 'N'                   TO  NTW-HOUSE-ACCT-SW       25520000
              END-IF                                                    25530000
              IF OMNIBUS-PROCESSING OF NTWREG-REC                       25540000
                 SET NTW-OMNIBUS-ACCT       TO  TRUE                    25550000
              ELSE                                                      25560000
LRM004        IF DST-DIRECT  OF NTWREG-REC                              25570000
LRM004           SET NTW-DST-MFE-ACCT TO TRUE                           25580000
LRM004        ELSE                                                      25590000
                 MOVE 'N'                   TO  NTW-OMNIBUS-ACCT-SW     25600000
              END-IF END-IF                                             25610000
LRM001        IF TBL-MNT-SOURCE-NSCC                                    25620000
LRM001           SET NTW-NSCCSRC-ACCT       TO  TRUE                    25630000
LRM001        END-IF                                                    25640000
DJ0001        IF AT-TRNFR-TYPE-CD = 'PTD' OR 'PTR'                      25650000
DJ0001           DISPLAY AT-TRNFR-TYPE-CD ' '                           25660000
DJ0001                   'BNWREGOP-FOUND : ' REG-OPT-KEY-AREA           25670000
DJ0001        END-IF                                                    25680000
           ELSE                                                         25690000
              MOVE SPACES                   TO  NTW-HOUSE-ACCOUNT       25700000
              MOVE 'N'                      TO  NTW-HOUSE-ACCT-SW       25710000
              MOVE 'N'                      TO  NTW-OMNIBUS-ACCT-SW     25720000
DJ0001        IF AT-TRNFR-TYPE-CD = 'PTD' OR 'PTR'                      25730000
DJ0001           DISPLAY AT-TRNFR-TYPE-CD ' '                           25740000
DJ0001                   'BNWREGOP-NOTFND: ' W-REG-OPT-KEY-SAVE         25750000
DJ0001                         ' RETURNED: ' REG-OPT-KEY-AREA           25760000
DJ0001        END-IF                                                    25770000
           END-IF                                                       25780000
           END-IF.                                                      25790000
                                                                        25800000
           EJECT                                                        25810000
      *************                                                     25820000
       READ-NTWMAST.                                                    25830000
      *************                                                     25840000
                                                                        25850000
           MOVE 'N'                          TO  IO-SUCCESSFUL-SW.      25860000
           MOVE SPACES                       TO  NTWMAST-REC.           25870000
           MOVE 0                            TO  PAYABLE-SEQUENCE-NO.   25880000
           MOVE ZEROES                       TO  ACCT-ID OF NTWMAST-REC.25890000
           MOVE WS-CLIENT (2:3)              TO  CLIENT-NO              25900000
                                                 OF NTWMAST-REC         25910000
                                                 CLIENT OF NTWMAST-REC. 25920000
           MOVE AT-ISIN-SEC-ISSUE-CD         TO  CUSIP-9 OF NTWMAST-REC.25930000
           MOVE WS-BRCH                      TO  BRANCH-3               25940000
                                                 OF NTWMAST-REC.        25950000
           MOVE WS-ACCT                      TO  ACCT-5 OF NTWMAST-REC. 25960000
                                                                        25970000
           MOVE WS-TC                        TO  ACCT-TYPE-CHK-DGT      25980000
                                                 OF NTWMAST-REC.        25990000
           MOVE MAST-KEY-AREA                TO  NTWMAST-KEY-IN         26000000
DJ0001                                           W-MAST-KEY-SAVE        26010000
                                                                        26020000
           READ NTWMAST-FILE               INTO  NTWMAST-REC.           26030000
                                                                        26040000
           IF WS-CLIENT (2:3) = CLIENT-NO OF NTWMAST-REC    AND         26050000
              AT-ISIN-SEC-ISSUE-CD = CUSIP-9 OF NTWMAST-REC AND         26060000
              WS-BRCH = BRANCH-3 OF NTWMAST-REC             AND         26070000
              WS-ACCT = ACCT-5   OF NTWMAST-REC             AND         26080000
              WS-TC   = ACCT-TYPE-CHK-DGT OF NTWMAST-REC                26090000
              SET IO-SUCCESSFUL             TO  TRUE                    26100000
DJ0001        IF AT-TRNFR-TYPE-CD = 'PTD' OR 'PTR'                      26110000
DJ0001           DISPLAY AT-TRNFR-TYPE-CD ' '                           26120000
DJ0001                   'BNWMAST -FOUND : ' MAST-KEY-AREA              26130000
DJ0001                     ' MATRIX-LEVEL= ' MATRIX-LEVEL               26140000
DJ0001        END-IF                                                    26150000
DJ0001     ELSE                                                         26160000
DJ0001        IF AT-TRNFR-TYPE-CD = 'PTD' OR 'PTR'                      26170000
DJ0001           DISPLAY AT-TRNFR-TYPE-CD ' '                           26180000
DJ0001                   'BNWMAST -NOTFND: ' W-MAST-KEY-SAVE            26190000
DJ0001                         ' RETURNED: ' MAST-KEY-AREA              26200000
DJ0001        END-IF                                                    26210000
           END-IF.                                                      26220000
                                                                        26230000
DJ0007***************                                                   26230000
DJ0007 READ-MFMSD.                                                      26230000
DJ0007***************                                                   26230000
DJ0007     MOVE 'N'                TO W-MFMSD-FND-SW                    26230000
DJ0007     ADD 1 TO W-MFMSD-CNT                                         26230000
DJ0007     INITIALIZE BMFSECIO-AREA                                     26230000
DJ0007     MOVE AT-ISIN-SEC-ISSUE-CD      TO BMFSECIO-SECURITY          26230000
DJ0007     SET BMFSECIO-REQUEST-MSD-MFMSD TO TRUE                       26230000
DJ0007     CALL BMFSEC USING BMFSECIO-AREA                              26230000
DJ0007     EVALUATE TRUE                                                26230000
DJ0007       WHEN BMFSECIO-RETURN-OK                                    26230000
DJ0007            ADD 1 TO W-MFMSD-FND-CNT                              26230000
DJ0007            MOVE 'Y'                 TO W-MFMSD-FND-SW            26230000
DJ0007            MOVE BMFSECIO-MFMSD-AREA TO MFMSD-REC                 26230000
DJ0007       WHEN BMFSECIO-RC-MFMSD-NOT-FOUND                           26230000
DJ0007            DISPLAY '    BMFSEC NOTFND: ' AT-ISIN-SEC-ISSUE-CD    26230000
DJ0007                     ' ' BMFSECIO-ERROR-DESC                      26230000
DJ0007       WHEN BMFSECIO-INVALID-RETURN                               26230000
DJ0007            DISPLAY 'BMFSECIO READ ERROR, RETURN CODE:'           26230000
DJ0007                     BMFSECIO-RETURN-CODE ' '                     26230000
DJ0007                     BMFSECIO-ERROR-DESC                          26230000
DJ0007            DISPLAY '**     ABENDING *'                           26230000
DJ0007            MOVE +3888 TO ABEND-CODE                              26230000
DJ0007            CALL ABEND USING ABEND-CODE                           26230000
DJ0007     END-EVALUATE.                                                26230000
                                                                        26230000
           EJECT                                                        26230000
DJ0007***************                                                   26230000
DJ0007 READ-MFEXBR.                                                     26230000
DJ0007***************                                                   26230000
DJ0007     MOVE 'N'                TO W-MFEXBR-FND-SW                   26230000
DJ0007     IF W-MFMSD-FND-SW = 'Y'                                      26230000
DJ0007        MOVE ' '                   TO MFEXBR-REC                  26230000
DJ0007        MOVE WS-CLIENT (2:3)       TO EXBR-CLIENT                 26230000
DJ0007        MOVE WS-BRCH               TO EXBR-BRANCH                 26230000
DJ0007        MOVE FUND-NO OF MFMSD-REC  TO EXBR-FUND-NO                26230000
DJ0007        ADD 1 TO W-MFEXBR-CNT                                     26230000
DJ0007        READ MFEXBR                                               26230000
DJ0007        IF MFEXBR-STATUS = '00'                                   26230000
DJ0007           ADD 1 TO W-MFEXBR-FND-CNT                              26230000
DJ0007           MOVE 'Y'                TO W-MFEXBR-FND-SW             26230000
DJ0007           DISPLAY '    MFEXBR FOUND : ' EXBR-CLIENT              26230000
DJ0007                              ' BRANCH ' EXBR-BRANCH              26230000
DJ0007                             ' FUND-NO ' EXBR-FUND-NO             26230000
DJ0007                  ' EXECUTING-BROKER = ' EXBR-EXECUTING-BROKER    26230000
DJ0007        ELSE                                                      26230000
DJ0007           MOVE 'N'                TO W-MFEXBR-FND-SW             26230000
DJ0007           DISPLAY '    MFEXBR NOTFND: ' EXBR-CLIENT              26230000
DJ0007                              ' BRANCH ' EXBR-BRANCH              26230000
DJ0007                             ' FUND-NO ' EXBR-FUND-NO             26230000
DJ0007                       ' FILE-STATUS = ' MFEXBR-STATUS            26230000
DJ0007        END-IF                                                    26230000
DJ0007     END-IF.                                                      26230000
                                                                        26230000
           EJECT                                                        26240000
      **********************                                            26250000
       INSERT-FUND-DEFAULTS.                                            26260000
      **********************                                            26270000
                                                                        26280000
           EXEC SQL                                                     26290000
              INSERT INTO ACTIMF                                        26300000
                 ( CLIENT_NBR                                           26310000
                  ,DLVR_NBR                                             26320000
                  ,RCV_NBR                                              26330000
                  ,ACCT_DLVR_NBR                                        26340000
                  ,ACCT_RCV_NBR                                         26350000
                  ,ISIN_CNTRY_CD                                        26360000
                  ,ISIN_SEC_ISSUE_CD                                    26370000
                  ,ISIN_SEC_CDG_CD                                      26380000
                  ,STTLM_LCTN_CD                                        26390000
LRM007            ,ACAT_CONTROL_NBR                                     26400000
LRM007            ,ASSET_SEQ_NBR                                        26410000
LRM007            ,TRNFR_TYPE_CD                                        26420000
                  ,CSH_MGN_SHRT_CD                                      26430000
                  ,BK_PHSCL_SHR_CD                                      26440000
                  ,BK_PHSC_SHR_STS_CD                                   26450000
                  ,NTWRK_CNTL_CD                                        26460000
                  ,NTWRK_CNTL_STTS_CD                                   26470000
                  ,ACCT_TYPE_CD                                         26480000
                  ,ACCT_TYPE_STTS_CD                                    26490000
                  ,DVDND_CD                                             26500000
                  ,DVDND_STTS_CD                                        26510000
                  ,DVDND_PAYEE_CD                                       26520000
                  ,DVDND_PYE_STTS_CD                                    26530000
                  ,LTCG_CD                                              26540000
                  ,BRKR_EXCTG_NBR                                       26550000
                  ,BRKR_EXCTG_STTS_CD                                   26560000
                  ,STCG_CD                                              26570000
                  ,MF_FULL_PRTL_CD                                      26580000
                  ,MF_FUL_PRTL_STS_CD                                   26590000
                  ,RGSTN_CD                                             26600000
                  ,FNBR                                                 26610000
                  ,FND_ACT_NBR_STS_CD                                   26620000
                  ,DSTBN_SIDE_CD                                        26630000
                  ,PRCS_DT                                              26640000
                  ,CRT_TMSTP                                            26650000
                  ,UPDT_TMSTP                                           26660000
                  ,CICS_TERM_ID_CD                                      26670000
                  ,PRGM_NM                                              26680000
                  ,SECURITY_ADP_NBR                                     26690000
LRM007            ,FCST_ACCT_RCVR_NBR)                                  26700000
              VALUES                                                    26710000
                 ( :WS-CLIENT                                           26720000
                  ,:AT-DLVR-NBR                                         26730000
                  ,:AT-RCV-NBR                                          26740000
                  ,:AT-ACCT-DLVR-NBR                                    26750000
                  ,:AT-ACCT-RCV-NBR                                     26760000
                  ,:AT-ISIN-CNTRY-CD                                    26770000
                  ,:AT-ISIN-SEC-ISSUE-CD                                26780000
                  ,:AT-ISIN-SEC-CDG-CD                                  26790000
                  ,:AT-STTLM-LCTN-CD                                    26800000
LRM007            ,:AT-ACAT-CONTROL-NBR                                 26810000
LRM007            ,:AT-ASSET-SEQ-NBR                                    26820000
LRM007            ,:AT-TRNFR-TYPE-CD                                    26830000
                  ,:AT-CSH-MGN-SHRT-CD                                  26840000
                  ,:ATF-BK-PHSCL-SHR-CD                                 26850000
                  ,:DCLACTIMF.BK-PHSC-SHR-STS-CD                        26860000
                  ,:ATF-NTWRK-CNTL-CD                                   26870000
                  ,:DCLACTIMF.NTWRK-CNTL-STTS-CD                        26880000
                  ,:ATF-ACCT-TYPE-CD                                    26890000
                  ,:DCLACTIMF.ACCT-TYPE-STTS-CD                         26900000
                  ,:ATF-DVDND-CD                                        26910000
                  ,:DCLACTIMF.DVDND-STTS-CD                             26920000
                  ,:ATF-DVDND-PAYEE-CD                                  26930000
                  ,:DCLACTIMF.DVDND-PYE-STTS-CD                         26940000
                  ,:ATF-LTCG-CD                                         26950000
                  ,:ATF-BRKR-EXCTG-NBR                                  26960000
                  ,:DCLACTIMF.BRKR-EXCTG-STTS-CD                        26970000
                  ,:ATF-STCG-CD                                         26980000
                  ,:ATF-MF-FULL-PRTL-CD                                 26990000
                  ,:DCLACTIMF.MF-FUL-PRTL-STS-CD                        27000000
                  ,:DCLACTIMF.RGSTN-CD                                  27010000
                  ,:ATF-FNBR                                            27020000
                  ,:DCLACTIMF.FND-ACT-NBR-STS-CD                        27030000
                  ,'D'                                                  27040000
                  ,'0001-01-01'                                         27050000
                  ,:WS-TMSTMP-TIME                                      27060000
                  ,:WS-TMSTMP-TIME                                      27070000
                  ,:DCLACTIMF.CICS-TERM-ID-CD                           27080000
                  ,'CAT500A '                                           27090000
                  ,:DCLACTIMF.SECURITY-ADP-NBR                          27100000
LRM007            ,:DCLACTIMF.FCST-ACCT-RCVR-NBR)                       27110000
           END-EXEC.                                                    27120000
                                                                        27130000
           IF SQLCODE NOT = +0                                          27140000
              MOVE SQLCODE TO WS-SQLCODE                                27150000
              DISPLAY 'PROBLEM ON ACTIMF '                              27160000
              DISPLAY 'WS-CLIENT           ' WS-CLIENT                  27170000
              DISPLAY 'AT-DLVR-NBR         ' AT-DLVR-NBR                27180000
              DISPLAY 'AT-RCV-NBR          ' AT-RCV-NBR                 27190000
              DISPLAY 'AT-ACCT-DLVR-NBR    ' AT-ACCT-DLVR-NBR           27200000
              DISPLAY 'AT-ACCT-RCV-NBR     ' AT-ACCT-RCV-NBR            27210000
              DISPLAY 'AT-ISIN-CNTRY-CD    ' AT-ISIN-CNTRY-CD           27220000
              DISPLAY 'AT-ISIN-SEC-ISSUE-CD' AT-ISIN-SEC-ISSUE-CD       27230000
              DISPLAY 'AT-ISIN-SEC-CDG-CD  ' AT-ISIN-SEC-CDG-CD         27240000
              DISPLAY 'AT-STTLM-LCTN-CD    ' AT-STTLM-LCTN-CD           27250000
              DISPLAY 'AT-CSH-MGN-SHRT-CD  ' AT-CSH-MGN-SHRT-CD         27260000
              SET BAD-INSERT             TO  TRUE                       27270000
              MOVE 'ACTIMF INSERT'       TO  TROUBLE-DB2-OBJECT         27280000
              PERFORM SQL-ERROR-ROUTINE                                 27290000
           END-IF.                                                      27300000
                                                                        27310000
TEMP       DISPLAY ' '                                                  27320000
TEMP       DISPLAY '  INSERT-FUND-DEFAULTS =============> '.            27330000
              DISPLAY 'WS-CLIENT =  ' WS-CLIENT                         27340000
                      ' AT-ACAT-CONTROL-NBR = ' AT-ACAT-CONTROL-NBR     27350000
                      ' AT-RCV-NBR =  ' AT-RCV-NBR                      27360000
                      ' AT-ACCT-RCV-NBR = ' AT-ACCT-RCV-NBR             27370000
                      ' AT-DLVR-NBR =  ' AT-DLVR-NBR                    27380000
                      ' AT-ACCT-DLVR-NBR = ' AT-ACCT-DLVR-NBR           27390000
                      ' AT-ISIN-CNTRY-CD = ' AT-ISIN-CNTRY-CD           27400000
                      ' AT-ISIN-SEC-ISSUE-CD = ' AT-ISIN-SEC-ISSUE-CD   27410000
                      ' AT-ISIN-SEC-CDG-CD = ' AT-ISIN-SEC-CDG-CD       27420000
                      ' AT-STTLM-LCTN-CD =  ' AT-STTLM-LCTN-CD          27430000
                      ' AT-CSH-MGN-SHRT-CD = ' AT-CSH-MGN-SHRT-CD       27440000
LRM007                ' AT-ACAT-CONTROL-NBR = ' AT-ACAT-CONTROL-NBR     27450000
LRM007                ' AT-ASSET-SEQ-NBR = ' AT-ASSET-SEQ-NBR           27460000
LRM007                ' AT-TRNFR-TYPE-CD = ' AT-TRNFR-TYPE-CD           27470000
              DISPLAY ' ------------   ATF-AREA  ------------------'    27480000
                      '   ATF-FNBR = ' ATF-FNBR,                        27490000
                      ' ATF-BK-PHSCL-SHR-CD = ' ATF-BK-PHSCL-SHR-CD     27500000
                      ' ATF-NTWRK-CNTL-CD = ' ATF-NTWRK-CNTL-CD         27510000
                      ' ATF-ACCT-TYPE-CD = ' ATF-ACCT-TYPE-CD           27520000
                      ' ATF-DVDND-CD = ' ATF-DVDND-CD                   27530000
                      ' ATF-LTCG-CD = ' ATF-LTCG-CD                     27540000
                      ' ATF-STCG-CD = ' ATF-STCG-CD                     27550000
                      ' ATF-DVDND-PAYEE-CD = ' ATF-DVDND-PAYEE-CD       27560000
                      ' ATF-BRKR-EXCTG-NBR = ' ATF-BRKR-EXCTG-NBR       27570000
                      ' ATF-MF-FULL-PRTL-CD = ' ATF-MF-FULL-PRTL-CD     27580000
TEMP       DISPLAY ' '.                                                 27590000
                                                                        27600000
                                                                        27610000
           EJECT                                                        27620000
      *****************                                                 27630000
TCK    DB2-COMMIT.                                                      27640000
      *****************                                                 27650000
           EXEC SQL                                                     27660000
                COMMIT                                                  27670000
           END-EXEC.                                                    27680000
           IF SQLCODE NOT = +0                                          27690000
TCK           DISPLAY '=========================='                      27700000
TCK           DISPLAY '**** ABEND AT COMMIT  ****'                      27710000
TCK           DISPLAY '=========================='                      27720000
              SET BAD-COMMIT           TO  TRUE                         27730000
              MOVE 'DB2 CPOMMIT'       TO  TROUBLE-DB2-OBJECT           27740000
              PERFORM SQL-ERROR-ROUTINE                                 27750000
TCK        END-IF.                                                      27760000
      *    DISPLAY '<<<  PROGRAM CAT500A COMMIT PERFORMED, AFTER ===>'  27770000
      *    IF WS-TI-KEYS > SPACES                                       27780000
      *       DISPLAY '**** TI-RCV-NBR =  ' WS-TI-RCV-NBR               27790000
      *       DISPLAY '     TI-ACCT-RCV-NBR = ' WS-TI-ACCT-RCV-NBR      27800000
      *       DISPLAY '     TI-DLVR-NBR = ' WS-TI-DLVR-NBR              27810000
      *       DISPLAY '     TI-ACCT-DLVR-NBR = ' WS-TI-ACCT-DLVR-NBR    27820000
      *       DISPLAY '     TI-TRNFR-TYPE-CD = ' WS-TI-TRNFR-TYPE-CD    27830000
      *       DISPLAY '     CYCLE NUMBER = ' TI-CYCLE-CD                27840000
      *    END-IF.                                                      27850000
      *    IF WS-AT-KEYS > SPACES                                       27860000
      *       DISPLAY '*** AT-CLIENT = '         WS-AT-CLIENT           27870000
      *       DISPLAY '    AT-DLVR-NBR = '       WS-AT-DLVR-NBR         27880000
      *       DISPLAY '    AT-ACCT-DLVR-NBR = '  WS-AT-ACCT-DLVR-NBR    27890000
      *       DISPLAY '    AT-RCV-NBR = '        WS-AT-RCV-NBR          27900000
      *       DISPLAY '    AT-ACCT-RCV-NBR = '   WS-AT-ACCT-RCV-NBR     27910000
      *       DISPLAY '    AT-ISIN-SEC-CD = '    WS-AT-SEC-CD           27920000
      *       DISPLAY '    AT-ISIN-SEC-CDG-CD = ' WS-AT-SEC-CDG-CD      27930000
      *       DISPLAY '    AT-STTLM-LCTN-CD = '  WS-AT-STTLM-LCTN-CD    27940000
      *       DISPLAY '    AT-CSH-MGN-SHRT-CD = ' WS-AT-CSH-MGN-SHRT-CD 27950000
      *       DISPLAY '    CYCLE NUMBER = ' AT-RCRD-STTS-CD             27960000
      *    END-IF.                                                      27970000
      *    IF WS-FR-KEYS > SPACES                                       27980000
      *       DISPLAY '**** FR-CLIENT = '        WS-FR-CLIENT           27990000
      *       DISPLAY '     FR-ACAT-CNTL-NBR = ' WS-FR-ACAT-CONTROL-NBR 28000000
      *       DISPLAY '     FR-ASSET-SEQ-NBR = ' WS-FR-ASSET-SEQ-NBR    28010000
      *       DISPLAY '    CYCLE NUMBER = ' FR-RCRD-STTS-CD             28020000
      **   END-IF.                                                      28030000
                                                                        28040000
TCK        ADD +1 TO WS-COMMIT-TOT-CTR.                                 28050000
           MOVE ZERO TO WS-COMMIT-CTR.                                  28060000
           MOVE SPACES TO WS-TI-KEYS, WS-AT-KEYS, WS-FR-KEYS.           28070000
           EJECT                                                        28080000
      **************************                                        28090000
       REWRITE-CYCLE-LOG-HEADER.                                        28100000
      **************************                                        28110000
                                                                        28120000
 TMP       DISPLAY ' '                                                  28130000
           DISPLAY ' REWRITE-CYCLE-LOG-HEADER --------------->'.        28140000
                                                                        28150000
           MOVE SPACES                    TO  CLOG-NSCC-LAST-SENT-HDR   28160000
           MOVE ZEROES                    TO  CLOG-LAST-SENT-PROC-DATE  28170000
                                              CLOG-LAST-SENT-CYCLE-NBR  28180000
                                              CLOG-LAST-SENT-REC-CNTR   28190000
                                              CLOG-LAST-SENT-TI-REC-CNTR28200000
                                              CLOG-LAST-SENT-AT-REC-CNTR28210000
                                              CLOG-LAST-SENT-FR-REC-CNTR28220000
           MOVE LOW-VALUES                TO  CLOG-KEY-A                28230000
           MOVE BPD-PROC-DATE             TO  CLOG-LAST-SENT-PROC-DATE  28240000
           MOVE WS-MULTI-BATCH-NBR        TO  CLOG-LAST-SENT-CYCLE-NBR  28250000
           MOVE WS-FROM-TMSTMP            TO  CLOG-LAST-FROM-TMSTMP     28260000
           MOVE WS-TO-TMSTMP              TO  CLOG-LAST-TO-TMSTMP       28270000
           MOVE WS-TOTAL-REC-CNTR         TO  CLOG-LAST-SENT-REC-CNTR   28280000
           MOVE WS-TOTAL-TI-REC-CNTR      TO  CLOG-LAST-SENT-TI-REC-CNTR28290000
           MOVE WS-TOTAL-AT-REC-CNTR      TO  CLOG-LAST-SENT-AT-REC-CNTR28300000
           MOVE WS-TOTAL-FR-REC-CNTR      TO  CLOG-LAST-SENT-FR-REC-CNTR28310000
                                                                        28320000
TMP        DISPLAY ' '                                                  28330000
TMP        DISPLAY ' CYCLE LOG HEADER KEY = ' CYCLE-LOG-KEY.            28340000
                                                                        28350000
           REWRITE CYCLE-LOG-REC       FROM  CLOG-RECORD                28360000
                                                                        28370000
           IF CYCLE-LOG-STATUS = '23'                                   28380000
              WRITE CYCLE-LOG-REC      FROM  CLOG-RECORD                28390000
           END-IF                                                       28400000
                                                                        28410000
           IF CYCLE-LOG-STATUS NOT = '00'                               28420000
              DISPLAY ' '                                               28430000
              DISPLAY '**********************************************'  28440000
              DISPLAY '* CANNOT UPDATE  THE CYCLE LOG HEADER RECORD *'  28450000
              DISPLAY '* KEY = ' CLOG-KEY-STREAM-IND,                   28460000
                                  CLOG-KEY-INOUT-IND                    28470000
                      '                 *'                              28480000
              DISPLAY '* STATUS = ' CYCLE-LOG-STATUS                    28490000
                      '                                *'               28500000
              DISPLAY '* PROGRAM IS ABENDING!                       *'  28510000
              DISPLAY ' '                                               28520000
              CALL ABEND            USING  ABEND-CODE                   28530000
           END-IF                                                       28540000
                                                                        28550000
           .                                                            28560000
LRM011 6000-FETCH-PARALLEL-TI.                                          13870000
LRM011                                                                  13890000
LRM011     EXEC SQL OPEN NSCC_TI_PARA_CRSR END-EXEC                     13900000
LRM011     IF SQLCODE NOT = +0                                          13910000
LRM011        MOVE SQLCODE TO WS-SQLCODE                                13920000
LRM011        SET BAD-OPEN                  TO  TRUE                    13930000
LRM011        MOVE 'TI PARA CURSOR OPEN'    TO  TROUBLE-DB2-OBJECT      13940000
LRM011        PERFORM SQL-ERROR-ROUTINE                                 13950000
LRM011     END-IF                                                       13960000
LRM011                                                                  13970000
LRM011     PERFORM UNTIL WS-TI-SQLCODE NOT = +0                         13980000
LRM011        EXEC SQL                                                  13990000
LRM011           FETCH NSCC_TI_PARA_CRSR       INTO :TI-AREA            14000000
LRM011        END-EXEC                                                  14010000
LRM011                                                                  14020000
LRM011        MOVE SQLCODE TO WS-SQLCODE                                14030000
LRM011                        WS-TI-SQLCODE                             14040000
LRM011                                                                  14050000
LRM011        EVALUATE SQLCODE                                          14060000
LRM011           WHEN +100                                              14070000
LRM011              CONTINUE                                            14080000
LRM011           WHEN +0                                                14090000
LRM011              PERFORM 6100-UPDATE-TI-PARA-CD                      14270007
LRM011              ADD +1 TO WS-TI-UPDT-PARA-CNTR                      14280000
LRM011           WHEN OTHER                                             14380000
LRM011              DISPLAY '================================== '       14390000
LRM011              DISPLAY '**** ABEND TI FETCH-TI-PARA   **** '       14400000
LRM011              DISPLAY '================================== '       14410000
LRM011              DISPLAY ' CLIENT_NBR = ' WS-CLIENT                  14420000
LRM011                      ' DLVR_NBR =  ' TI-DLVR-NBR                 14430000
LRM011                      ' RCV_NBR  =  ' TI-RCV-NBR                  14440000
LRM011                      ' ACCT_DLVR_NBR = ' TI-ACCT-DLVR-NBR        14450000
LRM011                      ' ACCT_RCV_NBR = ' TI-ACCT-RCV-NBR          14460000
LRM011                      ' TRNFR_TYPE_CD = ' TI-TRNFR-TYPE-CD        14470000
LRM011                      ' TRANS_TYPE_CD = ' TI-TRANS-TYPE-CD        14480000
LRM011                      ' SBMTG_PRTCP_NBR = ' TI-SBMTG-PRTCP-NBR    14490000
LRM011              DISPLAY ' '                                         14500000
LRM011              MOVE SQLCODE TO WS-SQLCODE                          14510000
LRM011              SET BAD-FETCH           TO  TRUE                    14520000
LRM011              MOVE 'TI CURSOR FETCH'  TO  TROUBLE-DB2-OBJECT      14530000
LRM011              PERFORM SQL-ERROR-ROUTINE                           14540000
LRM011        END-EVALUATE                                              14550000
LRM011     END-PERFORM                                                  14560000
LRM011                                                                  14570000
LRM011     EXEC SQL                                                     14580000
LRM011        CLOSE NSCC_TI_PARA_CRSR                                   14590000
LRM011     END-EXEC                                                     14600000
LRM011                                                                  14610000
LRM011     IF SQLCODE NOT = +0                                          14620000
LRM011        MOVE SQLCODE TO WS-SQLCODE                                14630000
LRM011        SET BAD-CLOSE                 TO  TRUE                    14640000
LRM011        MOVE 'TI CURSOR PARA CLOSE'   TO  TROUBLE-DB2-OBJECT      14650000
LRM011        PERFORM SQL-ERROR-ROUTINE                                 14660000
LRM011     ELSE                                                         14670000
LRM011        MOVE +0                       TO  SQLCODE                 14680000
LRM011                                          WS-TI-SQLCODE           14690000
LRM011     END-IF                                                       14700000
LRM011                                                                  14710000
LRM011     .                                                            14720000
LRM011                                                                  14730000
LRM011 6100-UPDATE-TI-PARA-CD.                                          14270007
LRM011     EXEC SQL                                                     14580000
LRM011        UPDATE ACTITRF                                            16910000
LRM011        SET NSCC_ACK_IND = 'X'                                    16920000
LRM011        WHERE CLIENT_NBR    = :WS-CLIENT                          16960000
LRM011          AND DLVR_NBR      = :TI-DLVR-NBR                        16970000
LRM011          AND ACCT_DLVR_NBR = :TI-ACCT-DLVR-NBR                   16980000
LRM011          AND RCV_NBR       = :TI-RCV-NBR                         16990000
LRM011          AND ACCT_RCV_NBR  = :TI-ACCT-RCV-NBR                    17000000
LRM011          AND TRNFR_TYPE_CD = :TI-TRNFR-TYPE-CD                   17010000
LRM011          AND ACAT_CONTROL_NBR = :TI-ACAT-CONTROL-NBR             17020000
LRM011     END-EXEC                                                     17030000
LRM011     IF SQLCODE NOT = +0                                          17050000
LRM011        DISPLAY '**** ABEND TI UPDATE-TI-PARA   **** '            17060000
LRM011        DISPLAY ' CLIENT_NBR = ' WS-CLIENT                        17070000
LRM011        DISPLAY ' DLVR_NBR =  ' TI-DLVR-NBR                       17080000
LRM011        DISPLAY ' RCV_NBR  =  ' TI-RCV-NBR                        17090000
LRM011        DISPLAY ' ACCT_DLVR_NBR = ' TI-ACCT-DLVR-NBR              17100000
LRM011        DISPLAY ' ACCT_RCV_NBR = ' TI-ACCT-RCV-NBR                17110000
LRM011        DISPLAY ' TRNFR_TYPE_CD = ' TI-TRNFR-TYPE-CD              17120000
LRM011        DISPLAY ' TRANS_TYPE_CD = ' TI-TRANS-TYPE-CD              17130000
LRM011        DISPLAY ' SBMTG_PRTCP_NBR = ' TI-SBMTG-PRTCP-NBR          17140000
LRM011        DISPLAY ' '                                               17150000
LRM011        MOVE SQLCODE TO WS-SQLCODE                                17160000
LRM011        SET BAD-UPDATE               TO  TRUE                     17170000
LRM011        MOVE 'ACTITRF UPDATE'        TO  TROUBLE-DB2-OBJECT       17180000
LRM011        PERFORM SQL-ERROR-ROUTINE                                 17190000
LRM011     END-IF.                                                      17190000
LRM011     EJECT                                                        14740000
LRM011 6500-FETCH-PARALLEL-AT.                                          14760000
LRM011                                                                  14780000
LRM011     EXEC SQL                                                     14800000
LRM011        OPEN NSCC_AT_PARA_CRSR                                    14810000
LRM011     END-EXEC                                                     14820000
LRM011                                                                  14880000
LRM011     IF SQLCODE NOT = +0                                          14890000
LRM011        MOVE SQLCODE TO WS-SQLCODE                                14900000
LRM011        SET BAD-OPEN                  TO  TRUE                    14910000
LRM011        MOVE 'AT PARA CURSOR OPEN'    TO  TROUBLE-DB2-OBJECT      14920000
LRM011        PERFORM SQL-ERROR-ROUTINE                                 14930000
LRM011     END-IF                                                       14940000
LRM011                                                                  14950000
LRM011     PERFORM UNTIL WS-AT-SQLCODE NOT = +0                         14960000
LRM011        EXEC SQL                                                  14980000
LRM011              FETCH NSCC_AT_PARA_CRSR  INTO  :AT-AREA             14990000
LRM011        END-EXEC                                                  15000000
LRM011                                                                  15060000
LRM011        MOVE SQLCODE TO WS-SQLCODE                                15070000
LRM011        MOVE SQLCODE TO WS-AT-SQLCODE                             15080000
LRM011                                                                  15090000
LRM011        EVALUATE SQLCODE                                          15100000
LRM011           WHEN +100                                              15110000
LRM011             CONTINUE                                             15120000
LRM011           WHEN +0                                                15130000
LRM011             PERFORM 6600-UPDATE-AT-PARA-CD                       14270007
LRM011              ADD +1 TO WS-AT-UPDT-PARA-CNTR                      14280000
LRM011           WHEN OTHER                                             15370000
LRM011              DISPLAY '================================== '       15380000
LRM011              DISPLAY '**** ABEND AT FETCH-AT-PARA   **** '       15390000
LRM011              DISPLAY '================================== '       15400000
LRM011              DISPLAY ' CLIENT_NBR =  ' WS-CLIENT                 15410000
LRM011              DISPLAY ' DLVR_NBR =  ' TI-DLVR-NBR                 15420000
LRM011              DISPLAY ' RCV_NBR  =  ' TI-RCV-NBR                  15430000
LRM011              DISPLAY ' ACCT_DLVR_NBR = ' TI-ACCT-DLVR-NBR        15440000
LRM011              DISPLAY ' ACCT_RCV_NBR = ' TI-ACCT-RCV-NBR          15450000
LRM011              DISPLAY ' TRNFR_TYPE_CD = ' TI-TRNFR-TYPE-CD        15460000
LRM011              DISPLAY ' TRANS_TYPE_CD = ' TI-TRANS-TYPE-CD        15470000
LRM011              DISPLAY ' CSH_MGN_SHRT_CD = ' AT-CSH-MGN-SHRT-CD    15480000
LRM011              DISPLAY ' OPTN_CTGY_CD = ' AT-OPTN-CTGY-CD          15490000
LRM011              MOVE SQLCODE TO WS-SQLCODE                          15500000
LRM011             SET BAD-FETCH          TO  TRUE                      15510000
LRM011                MOVE 'AT PARA CRSR FETCH' TO TROUBLE-DB2-OBJECT   15530000
LRM011             PERFORM SQL-ERROR-ROUTINE                            15570000
LRM011        END-EVALUATE                                              15580000
LRM011     END-PERFORM                                                  15590000
LRM011                                                                  15600000
LRM011                                                                  15710000
LRM011     EXEC SQL                                                     15730000
LRM011        CLOSE NSCC_AT_PARA_CRSR                                   15740000
LRM011     END-EXEC                                                     15750000
LRM011                                                                  15810000
LRM011     IF SQLCODE NOT = +0                                          15820000
LRM011        MOVE SQLCODE TO WS-SQLCODE                                15830000
LRM011        SET BAD-CLOSE                 TO  TRUE                    15840000
LRM011           MOVE 'AT PARA CURSR CLOSE' TO  TROUBLE-DB2-OBJECT      15860000
LRM011        PERFORM SQL-ERROR-ROUTINE                                 15900000
LRM011     ELSE                                                         15910000
LRM011        MOVE +0                       TO  SQLCODE                 15920000
LRM011                                          WS-AT-SQLCODE           15930000
LRM011     END-IF                                                       15940000
LRM011                                                                  15950000
LRM011     .                                                            15960000
LRM011 6600-UPDATE-AT-PARA-CD.                                          14270007
LRM011     EXEC SQL                                                     17620000
LRM011           UPDATE ACTIAST                                         17630000
LRM011           SET NSCC_ACK_IND = 'X'                                 17640000
LRM011           WHERE CLIENT_NBR        = :WS-CLIENT                   17680000
LRM011             AND DLVR_NBR          = :AT-DLVR-NBR                 17690000
LRM011             AND ACCT_DLVR_NBR     = :AT-ACCT-DLVR-NBR            17700000
LRM011             AND RCV_NBR           = :AT-RCV-NBR                  17710000
LRM011             AND ACCT_RCV_NBR      = :AT-ACCT-RCV-NBR             17720000
LRM011             AND ISIN_CNTRY_CD     = :AT-ISIN-CNTRY-CD            17730000
LRM011             AND ISIN_SEC_ISSUE_CD = :AT-ISIN-SEC-ISSUE-CD        17740000
LRM011             AND ISIN_SEC_CDG_CD   = :AT-ISIN-SEC-CDG-CD          17750000
LRM011             AND STTLM_LCTN_CD     = :AT-STTLM-LCTN-CD            17760000
LRM011             AND CSH_MGN_SHRT_CD   = :AT-CSH-MGN-SHRT-CD          17770000
LRM011        END-EXEC                                                  17780000
LRM011                                                                  15970000
LRM011     IF SQLCODE NOT = +0                                          18010000
LRM011        DISPLAY '=================================== '            18020000
LRM011        DISPLAY '**** ABEND AT UPDATE-AT-PARA   **** '            18030000
LRM011        DISPLAY '=================================== '            18040000
LRM011        DISPLAY ' CLIENT_NBR =  ' WS-CLIENT                       18050000
LRM011        DISPLAY ' DLVR_NBR =  ' TI-DLVR-NBR                       18060000
LRM011        DISPLAY ' RCV_NBR  =  ' TI-RCV-NBR                        18070000
LRM011        DISPLAY ' ACCT_DLVR_NBR = ' TI-ACCT-DLVR-NBR              18080000
LRM011        DISPLAY ' ACCT_RCV_NBR = ' TI-ACCT-RCV-NBR                18090000
LRM011        DISPLAY ' TRNFR_TYPE_CD = ' TI-TRNFR-TYPE-CD              18100000
LRM011        DISPLAY ' TRANS_TYPE_CD = ' TI-TRANS-TYPE-CD              18110000
LRM011        DISPLAY ' CSH_MGN_SHRT_CD = ' AT-CSH-MGN-SHRT-CD          18120000
LRM011        DISPLAY ' OPTN_CTGY_CD = ' AT-OPTN-CTGY-CD                18130000
LRM011        MOVE SQLCODE TO WS-SQLCODE                                18140000
LRM011        SET BAD-UPDATE                TO  TRUE                    18150000
LRM011        MOVE 'ACTIAST UPDATE PARA'   TO  TROUBLE-DB2-OBJECT       18160000
LRM011        PERFORM SQL-ERROR-ROUTINE                                 18170000
LRM011     END-IF.                                                              
           EJECT                                                        15980000
DJ0006/                                                                 28561052
DJ0006 7000-FETCH-ACTIAST-DELETES.                                      28562052
DJ0006*---(FETCH ACTIAST WHERE NSCC_PEND_CD='D'          )              11340007
DJ0006*---(  AND PRGM_NM LIKE 'ACAT%%%%'                 )              11350007
DJ0006*---(WRITE ACTIVITY RECORD FOR DELETED ACTIAST ROWS)              11360007
DJ0006*---(DELETE ROW WHERE NSCC_PEND_CD='D'             )              11380007
DJ0006                                                                  28562152
DJ0006     MOVE WS-CLIENT TO WS-DELETE-CLIENT.                          08900000
DJ0006     MOVE 'D'       TO WS-DELETE-CLIENT(1 : 1).                   08900000
DJ0006     EXEC SQL OPEN AT_DELETE_CURSOR END-EXEC                      28562252
DJ0006     IF SQLCODE NOT = +0                                          28562352
DJ0006        MOVE SQLCODE TO WS-SQLCODE                                28562452
DJ0006        SET BAD-OPEN                  TO  TRUE                    28562552
DJ0006        MOVE 'AT_DELETE_CURSOR OPEN'  TO  TROUBLE-DB2-OBJECT      28562652
DJ0006        PERFORM SQL-ERROR-ROUTINE                                 28562752
DJ0006     END-IF                                                       28562852
DJ0006                                                                  28562952
DJ0006     MOVE SPACE TO WS-DELETE-ACTIAST-SW                           08900000
DJ0006     PERFORM UNTIL WS-AT-SQLCODE NOT = +0                         28563052
DJ0006        EXEC SQL                                                  28563152
DJ0006           FETCH AT_DELETE_CURSOR    INTO :AT-AREA                28563252
DJ0006        END-EXEC                                                  28563352
DJ0006                                                                  28563452
DJ0006        MOVE SQLCODE TO WS-SQLCODE                                28563552
DJ0006                        WS-AT-SQLCODE                             28563652
DJ0006                                                                  28563752
DJ0006        EVALUATE SQLCODE                                          28563852
DJ0006           WHEN +100                                              28563952
DJ0006              IF FOUND-ACTIAST-INIT-DELETE                        06230037
DJ0006                 PERFORM 7500-DELETE-ACTIAST                      28564052
DJ0006              END-IF                                              28564152
DJ0006           WHEN +0                                                28564152
DJ0006                 ADD 1 TO W-ACATACTF-DELETE-CNT                   29250052
DJ0006                 PERFORM 7400-WRITE-ACATACTF-AT THRU 7400-EXIT    29250052
DJ0006           WHEN OTHER                                             28567052
DJ0006              DISPLAY '================================== '       28567152
DJ0006              DISPLAY '**** ABEND AT FETCH-AT-DELETE **** '       28567252
DJ0006              DISPLAY '================================== '       28567352
DJ0006              DISPLAY ' CLIENT_NBR = ' WS-CLIENT                  28567452
DJ0006                      ' DLVR_NBR =  ' AT-DLVR-NBR                 28567552
DJ0006                      ' RCV_NBR  =  ' AT-RCV-NBR                  28567652
DJ0006                      ' ACCT_DLVR_NBR = ' AT-ACCT-DLVR-NBR        28567752
DJ0006                      ' ACCT_RCV_NBR = ' AT-ACCT-RCV-NBR          28567852
DJ0006                      ' TRNFR_TYPE_CD = ' AT-TRNFR-TYPE-CD        28567952
DJ0006                      ' TRANS_TYPE_CD = ' AT-TRANS-TYPE-CD        28568052
DJ0006                      ' SBMTG_PRTCP_NBR = ' AT-SBMTG-PRTCP-NBR    28568152
DJ0006              DISPLAY ' '                                         28568252
DJ0006              MOVE SQLCODE TO WS-SQLCODE                          28568352
DJ0006              SET BAD-FETCH                 TO TRUE               28568452
DJ0006              MOVE 'AT_DELETE_CURSOR FETCH' TO TROUBLE-DB2-OBJECT 28568552
DJ0006              PERFORM SQL-ERROR-ROUTINE                           28568652
DJ0006        END-EVALUATE                                              28568752
DJ0006     END-PERFORM                                                  28568852
DJ0006                                                                  28568952
DJ0006     EXEC SQL                                                     28569052
DJ0006        CLOSE AT_DELETE_CURSOR                                    28569152
DJ0006     END-EXEC                                                     28569252
DJ0006                                                                  28569352
DJ0006     IF SQLCODE NOT = +0                                          28569452
DJ0006        MOVE SQLCODE TO WS-SQLCODE                                28569552
DJ0006        SET BAD-CLOSE                 TO  TRUE                    28569652
DJ0006        MOVE 'AT_DELETE_CURSOR CLOSE' TO  TROUBLE-DB2-OBJECT      28569752
DJ0006        PERFORM SQL-ERROR-ROUTINE                                 28569852
DJ0006     ELSE                                                         28569952
DJ0006        MOVE +0                       TO  SQLCODE                 28570052
DJ0006                                          WS-AT-SQLCODE           28570152
DJ0006     END-IF.                                                      28570252
DJ0006 7000-EXIT. EXIT.                                                 28570552
DJ0006/                                                                 28561052
DJ0006 7100-FETCH-ACTIAST-CHANGES.                                      28562052
DJ0006*---(WRITE ACTIVITY RECORD FOR CHANGED ACTIAST ROWS)              11360007
DJ0006                                                                  28562152
DJ0006     EXEC SQL OPEN AT_CHANGE_CURSOR END-EXEC                      28562252
DJ0006     IF SQLCODE NOT = +0                                          28562352
DJ0006        MOVE SQLCODE TO WS-SQLCODE                                28562452
DJ0006        SET BAD-OPEN                  TO  TRUE                    28562552
DJ0006        MOVE 'AT_CHANGE_CURSOR OPEN'  TO  TROUBLE-DB2-OBJECT      28562652
DJ0006        PERFORM SQL-ERROR-ROUTINE                                 28562752
DJ0006     END-IF                                                       28562852
DJ0006                                                                  28562952
DJ0006     PERFORM UNTIL WS-AT-SQLCODE NOT = +0                         28563052
DJ0006        EXEC SQL                                                  28563152
DJ0006           FETCH AT_CHANGE_CURSOR    INTO :AT-AREA                28563252
DJ0006        END-EXEC                                                  28563352
DJ0006                                                                  28563452
DJ0006        MOVE SQLCODE TO WS-SQLCODE                                28563552
DJ0006                        WS-AT-SQLCODE                             28563652
DJ0006                                                                  28563752
DJ0006        EVALUATE SQLCODE                                          28563852
DJ0006           WHEN +100                                              28563952
DJ0006              CONTINUE                                            28564052
DJ0006           WHEN +0                                                28564152
DJ0006                 ADD 1 TO W-ACATACTF-CHANGE-CNT                   29250052
DJ0006                 PERFORM 7400-WRITE-ACATACTF-AT THRU 7400-EXIT    29250052
DJ0006           WHEN OTHER                                             28567052
DJ0006              DISPLAY '================================== '       28567152
DJ0006              DISPLAY '**** ABEND AT FETCH-AT-CHANGE **** '       28567252
DJ0006              DISPLAY '================================== '       28567352
DJ0006              DISPLAY ' CLIENT_NBR = ' WS-CLIENT                  28567452
DJ0006                      ' DLVR_NBR =  ' AT-DLVR-NBR                 28567552
DJ0006                      ' RCV_NBR  =  ' AT-RCV-NBR                  28567652
DJ0006                      ' ACCT_DLVR_NBR = ' AT-ACCT-DLVR-NBR        28567752
DJ0006                      ' ACCT_RCV_NBR = ' AT-ACCT-RCV-NBR          28567852
DJ0006                      ' TRNFR_TYPE_CD = ' AT-TRNFR-TYPE-CD        28567952
DJ0006                      ' TRANS_TYPE_CD = ' AT-TRANS-TYPE-CD        28568052
DJ0006                      ' SBMTG_PRTCP_NBR = ' AT-SBMTG-PRTCP-NBR    28568152
DJ0006              DISPLAY ' '                                         28568252
DJ0006              MOVE SQLCODE TO WS-SQLCODE                          28568352
DJ0006              SET BAD-FETCH                 TO TRUE               28568452
DJ0006              MOVE 'AT_CHANGE_CURSOR FETCH' TO TROUBLE-DB2-OBJECT 28568552
DJ0006              PERFORM SQL-ERROR-ROUTINE                           28568652
DJ0006        END-EVALUATE                                              28568752
DJ0006     END-PERFORM                                                  28568852
DJ0006                                                                  28568952
DJ0006     EXEC SQL                                                     28569052
DJ0006        CLOSE AT_CHANGE_CURSOR                                    28569152
DJ0006     END-EXEC                                                     28569252
DJ0006                                                                  28569352
DJ0006     IF SQLCODE NOT = +0                                          28569452
DJ0006        MOVE SQLCODE TO WS-SQLCODE                                28569552
DJ0006        SET BAD-CLOSE                 TO  TRUE                    28569652
DJ0006        MOVE 'AT_CHANGE_CURSOR CLOSE' TO  TROUBLE-DB2-OBJECT      28569752
DJ0006        PERFORM SQL-ERROR-ROUTINE                                 28569852
DJ0006     ELSE                                                         28569952
DJ0006        MOVE +0                       TO  SQLCODE                 28570052
DJ0006                                          WS-AT-SQLCODE           28570152
DJ0006     END-IF.                                                      28570252
DJ0006 7100-EXIT. EXIT.                                                 28570552
DJ0006/                                                                 28710012
DJ0006 7300-WRITE-ACATACTF-TI.                                          28720052
DJ0006     MOVE SPACES                   TO ACATACTF-RECORD             28730025
DJ0006     MOVE TI-CLIENT-NBR            TO ACATACTF-CLIENT-NBR         28750025
DJ0006     IF  TI-TRANS-TYPE-CD = 'R'                                   28760037
DJ0006         MOVE '1'                  TO ACATACTF-ACTION             28770037
DJ0006     ELSE                                                         28780012
DJ0006       IF  TI-TRANS-TYPE-CD = 'A'                                 28790037
DJ0006           MOVE '2'                TO ACATACTF-ACTION             28800037
DJ0006       ELSE                                                       28810012
DJ0006         IF  TI-TRANS-TYPE-CD = 'D'                               28820037
DJ0006             MOVE '3'              TO ACATACTF-ACTION             28830037
DJ0006         END-IF                                                   28840012
DJ0006       END-IF                                                     28840012
DJ0006     END-IF.                                                      28840012
DJ0006     MOVE 'T'                      TO ACATACTF-REC-ID             28850049
DJ0006     IF  TI-SBMTG-PRTCP-NBR = TI-RCV-NBR                          28860037
DJ0006         MOVE TI-ACCT-RCV-NBR      TO ACATACTF-ACCT-NBR           28890025
DJ0006     ELSE                                                         28900021
DJ0006         MOVE TI-ACCT-DLVR-NBR     TO ACATACTF-ACCT-NBR           28920025
DJ0006     END-IF.                                                      28930021
DJ0006     MOVE TI-ACAT-CONTROL-NBR      TO ACATACTF-ACAT-CTL-NBR       28950025
DJ0006     MOVE 0000                     TO ACATACTF-SEQ-NBR            28960037
DJ0006     MOVE TI-TRANS-TYPE-CD         TO ACATACTF-TRANS-TYPE-CD      29000025
DJ0006     MOVE TI-TRNFR-TYPE-CD         TO ACATACTF-TRNFR-TYPE-CD      28980025
DJ0006     MOVE BPD-PROC-DATE            TO ACATACTF-BPD-PROC-DATE      29010037
DJ0006     MOVE TI-RR-CD                 TO ACATACTF-RR-CD              29020025
DJ0006     MOVE WS-MULTI-BATCH-NBR-ALPHA (3:2) TO ACATACTF-CYCLE-CD     29570037
DJ0006     MOVE TI-PRGM-NM               TO ACATACTF-PRGM-NM            29060025
DJ0006     MOVE TI-CRT-TMSTP             TO ACATACTF-CRT-TMSTP          29080025
DJ0006     MOVE TI-UPDT-TMSTP            TO ACATACTF-UPDT-TMSTP         29100025
DJ0006     MOVE TI-CICS-TERM-ID-CD       TO ACATACTF-CICS-TERM-ID-CD    29120025
DJ0006     MOVE TI-CICS-SGNON-ID         TO ACATACTF-CICS-SGNON-ID      29140025
DJ0006     MOVE TI-CICS-NET-NM           TO ACATACTF-CICS-NET-NM        29160047
DJ0006     MOVE TI-TPSCRT-USR-ID         TO ACATACTF-TPSCRT-USR-ID      29180025
DJ0006     MOVE TI-TPSCRT-USR-NM         TO ACATACTF-TPSCRT-USR-NM      29200025
DJ0006     MOVE ' '                      TO ACATACTF-SECURITY-ADP-NBR   29280025
DJ0006     MOVE ' '                      TO ACATACTF-STTLM-LCTN-CD      29280025
DJ0006     WRITE ACATACTF-RECORD.                                       29210025
DJ0006     ADD 1 TO W-ACATACTF-CNT.                                     29220025
DJ0006 7300-EXIT. EXIT.                                                 29230052
DJ0006/                                                                 29240012
DJ0006 7400-WRITE-ACATACTF-AT.                                          29250052
DJ0006     MOVE SPACES                   TO ACATACTF-RECORD             29260047
DJ0006     IF AT-CLIENT-NBR(1 : 1) = 'D'                                06230037
DJ0006        SET FOUND-ACTIAST-INIT-DELETE TO TRUE                     06230037
DJ0006        MOVE '0' TO  AT-CLIENT-NBR(1 : 1)                         06230037
DJ0006     END-IF                                                       06230037
DJ0006     MOVE AT-CLIENT-NBR            TO ACATACTF-CLIENT-NBR         29280025
DJ0006     MOVE '3'                      TO ACATACTF-ACTION             29360037
DJ0006     MOVE 'A'                      TO ACATACTF-REC-ID             29380049
DJ0006     IF  AT-SBMTG-PRTCP-NBR = AT-RCV-NBR                          29390037
DJ0006         MOVE AT-ACCT-RCV-NBR      TO ACATACTF-ACCT-NBR           29420025
DJ0006     ELSE                                                         29430023
DJ0006         MOVE AT-ACCT-DLVR-NBR     TO ACATACTF-ACCT-NBR           29450025
DJ0006     END-IF.                                                      29460023
DJ0006     MOVE AT-ACAT-CONTROL-NBR      TO ACATACTF-ACAT-CTL-NBR       29480025
DJ0006     MOVE AT-ASSET-SEQ-NBR         TO ACATACTF-SEQ-NBR            29500025
DJ0006     MOVE AT-TRANS-TYPE-CD         TO ACATACTF-TRANS-TYPE-CD      29540025
DJ0006     MOVE AT-TRNFR-TYPE-CD         TO ACATACTF-TRNFR-TYPE-CD      29520025
DJ0006     PERFORM 7410-GET-RR-CD THRU 7410-EXIT                        29560025
DJ0006     MOVE BPD-PROC-DATE            TO ACATACTF-BPD-PROC-DATE      29010037
DJ0006     MOVE WS-MULTI-BATCH-NBR-ALPHA (3:2) TO ACATACTF-CYCLE-CD     29570037
DJ0006     MOVE AT-PRGM-NM               TO ACATACTF-PRGM-NM            29600025
DJ0006     MOVE AT-CRT-TMSTP             TO ACATACTF-CRT-TMSTP          29620025
DJ0006     MOVE AT-UPDT-TMSTP            TO ACATACTF-UPDT-TMSTP         29640025
DJ0006     MOVE AT-CICS-TERM-ID-CD       TO ACATACTF-CICS-TERM-ID-CD    29660025
DJ0006     MOVE AT-CICS-SGNON-ID         TO ACATACTF-CICS-SGNON-ID      29680025
DJ0006     MOVE AT-CICS-NET-NM           TO ACATACTF-CICS-NET-NM        29700047
DJ0006     MOVE AT-TPSCRT-USR-ID         TO ACATACTF-TPSCRT-USR-ID      29720025
DJ0006     MOVE AT-TPSCRT-USR-NM         TO ACATACTF-TPSCRT-USR-NM      29740025
DJ0006     MOVE AT-SECURITY-ADP-NBR      TO ACATACTF-SECURITY-ADP-NBR   29280025
DJ0006     MOVE AT-STTLM-LCTN-CD         TO ACATACTF-STTLM-LCTN-CD      29280025
DJ0006     WRITE ACATACTF-RECORD.                                       29750025
DJ0006     ADD 1 TO W-ACATACTF-CNT.                                     29760025
DJ0006 7400-EXIT. EXIT.                                                 29770052
DJ0006/                                                                 29780027
DJ0006 7410-GET-RR-CD.                                                  29790052
DJ0006     INITIALIZE DCLVTRNFR                                         29800027
DJ0006                                                                  29800027
DJ0006     EXEC SQL SELECT                                              29800027
DJ0006              CLIENT_NBR                                          29800027
DJ0006             ,ACAT_CONTROL_NBR                                    29800027
DJ0006             ,RR_CD                                               29800027
DJ0006        INTO                                                      29800027
DJ0006             :DCLVTRNFR.CLIENT-NBR                                29800027
DJ0006            ,:DCLVTRNFR.ACAT-CONTROL-NBR                          29800027
DJ0006            ,:DCLVTRNFR.RR-CD                                     29800027
DJ0006         FROM  VTRNFR                                             29800027
DJ0006        WHERE  CLIENT_NBR        = :AT-CLIENT-NBR                 29800027
DJ0006          AND  ACAT_CONTROL_NBR  = :AT-ACAT-CONTROL-NBR           29800027
DJ0006     END-EXEC                                                     29800027
DJ0006                                                                  29800027
DJ0006     IF SQLCODE = +0                                              28569452
DJ0006         MOVE RR-CD OF DCLVTRNFR   TO ACATACTF-RR-CD              29560025
DJ0006         ADD 1 TO W-VTRNFR-CNT                                    29560025
DJ0006     ELSE                                                         29800027
DJ0006         MOVE '###'                TO ACATACTF-RR-CD              29560025
DJ0006     END-IF.                                                      29800027
DJ0006                                                                  29800027
DJ0006 7410-EXIT. EXIT.                                                 29770052
DJ0006/                                                                 28571027
DJ0006  7500-DELETE-ACTIAST.                                            06230037
DJ0006     EXEC SQL DELETE                                              29800027
DJ0006         FROM  ACTIAST                                            29800027
DJ0006        WHERE  CLIENT_NBR        = :WS-DELETE-CLIENT              29800027
DJ0006          AND  ACAT_CONTROL_NBR  = :AT-ACAT-CONTROL-NBR           29800027
DJ0006     END-EXEC.                                                    29800027
DJ0006     MOVE +0 TO SQLCODE.                                          29800027
DJ0006/                                                                 28571027
DJ0006 7600-WRITE-ACATACTF-HEADER.                                      28580052
DJ0006     MOVE ' '                      TO ACATACTF-HEADER-RECORD      28590027
DJ0006     MOVE 'H'                      TO CP2-REQUEST-CODE.           28600027
DJ0006     MOVE 'CAT500A'                TO CP2-PROGRAM-ID.             28610027
DJ0006     MOVE 999                      TO CP2-CLIENT-NUMBER.          28620027
DJ0006     CALL P2HDTR                USING CP2-AREA                    28630027
DJ0006                                      ACATACTF.                   28640027
DJ0006     MOVE CP2-RETURN-RECORD        TO ACATACTF-HEADER-RECORD      28650027
DJ0006     MOVE 'CYCLE='                 TO ACATACTF-HDR-CYCLE-LIT      28660027
DJ0006     MOVE WS-MULTI-BATCH-NBR-ALPHA(3:2) TO ACATACTF-HDR-CYCLE-NO  28670027
DJ0006     DISPLAY 'CAT500A ACATACTF-HDR= ' ACATACTF-HEADER-RECORD(1:80)28680027
DJ0006     WRITE ACATACTF-RECORD.                                       28690027
DJ0006 7600-EXIT. EXIT.                                                 28700052
DJ0006/                                                                 29780027
DJ0006 7700-WRITE-ACATACTF-TRAILER.                                     29790052
DJ0006     MOVE ' '                      TO ACATACTF-TRAILER-RECORD     29800027
DJ0006     MOVE 'T'                      TO CP2-REQUEST-CODE.           29810027
DJ0006     MOVE 'CAT500A'                TO CP2-PROGRAM-ID.             29820027
DJ0006     MOVE W-ACATACTF-CNT           TO CP2-RECORD-COUNT.           29830027
DJ0006     MOVE 999                      TO CP2-CLIENT-NUMBER.          29840027
DJ0006     CALL P2HDTR                USING CP2-AREA                    29850027
DJ0006                                      ACATACTF.                   29860027
DJ0006     MOVE CP2-RETURN-RECORD        TO ACATACTF-TRAILER-RECORD     29870027
DJ0006     MOVE 'CYCLE='                 TO ACATACTF-TRL-CYCLE-LIT      29880027
DJ0006     MOVE WS-MULTI-BATCH-NBR-ALPHA(3:2) TO ACATACTF-TRL-CYCLE-NO  29890027
DJ0006     DISPLAY 'CAT500A: ACATACTF-TRL= '                            29900027
DJ0006                                    ACATACTF-TRAILER-RECORD(1:80) 29900027
DJ0006     WRITE ACATACTF-RECORD.                                       29910027
DJ0006     DISPLAY 'CAT500A: ACATACTF-CNT= ' W-ACATACTF-CNT.            29920027
DJ0006     DISPLAY 'CAT500A: ACATACTF-DEL= ' W-ACATACTF-DELETE-CNT.     29920027
DJ0006     DISPLAY 'CAT500A: ACATACTF-CHG= ' W-ACATACTF-CHANGE-CNT.     29920027
DJ0006     DISPLAY 'CAT500A: W-VTRNFR-CNT= ' W-VTRNFR-CNT.              29920027
DJ0006 7700-EXIT. EXIT.                                                 29930052
                                                                        29940012
           EJECT                                                        29950012
      *******************                                               29960012
       SQL-ERROR-ROUTINE.                                               29970012
      *******************                                               29980012
                                                                        29990000
           CALL DSNTIAR               USING  SQLCA                      30000000
                                             WS-DB2-MESSAGE-AREA        30010000
                                             WS-ERR-LINE-LEN            30020000
                                                                        30030000
           DISPLAY ' '                                                  30040000
                                                                        30050000
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                   30060000
              UNTIL WS-ERROR-INDEX GREATER THAN 12                      30070000
                 IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES              30080000
                    DISPLAY '*** ' WS-ERROR-MSG (WS-ERROR-INDEX)        30090000
                 END-IF                                                 30100000
           END-PERFORM                                                  30110000
                                                                        30120000
           DISPLAY ' '                                                  30130000
           DISPLAY '*** DB2 OBJECT IN TROUBLE IS ' TROUBLE-DB2-OBJECT   30140000
           DISPLAY '*** PROGRAM IS ABENDING!'                           30150000
TCK        DISPLAY '**** ABENDING SQLCODE = ' WS-SQLCODE                30160000
TEMP  *    DISPLAY '  WS-ABEND-CTR = ' WS-ABEND-CTR                     30170000
           DISPLAY ' '                                                  30180000
                                                                        30190000
           EXEC SQL  ROLLBACK  END-EXEC                                 30200000
           CALL ABEND      USING ABEND-CODE                             30210000
                                                                        30220000
           .                                                            30230000
                                                                        30240000
           EJECT                                                        30250000
      *****************                                                 30260000
       INITIAL-ROUTINE.                                                 30270000
      *****************                                                 30280000
                                                                        30290000
           OPEN INPUT   NTWREG-FILE                                     30300000
                        NTWMAST-FILE.                                   30310000
                                                                        30320000
           OPEN I-O CYCLE-LOG                                           30330000
                                                                        30340000
           IF CYCLE-LOG-STATUS = '00' OR '97'                           30350000
              CONTINUE                                                  30360000
           ELSE                                                         30370000
              DISPLAY ' '                                               30380000
              DISPLAY '*****************************'                   30390000
              DISPLAY '* BAD OPEN OF CYCLELOG FILE *'                   30400000
              DISPLAY '* VSAM STATUS = ' CYCLE-LOG-STATUS '          *' 30410000
              DISPLAY '* PROGRAM IS ABENDING       *'                   30420000
              DISPLAY '*****************************'                   30430000
              DISPLAY ' '                                               30440000
              MOVE +0001                 TO  ABEND-CODE                 30450000
              CALL ABEND              USING  ABEND-CODE                 30460000
           END-IF                                                       30470000
                                                                        30480000
DJ0007     OPEN INPUT MFEXBR.                                           30480000
DJ0007     DISPLAY 'CAT500A: MFEXBR   OPENED FOR INPUT.  STATUS = '     30480000
DJ0007                                        MFEXBR-STATUS             30480000
DJ0007     IF  MFEXBR-OKAY                                              30480000
DJ0007         CONTINUE                                                 30480000
DJ0007     ELSE                                                         30480000
DJ0007         DISPLAY 'CAT500A: ERROR OPENING MFEXBR'                  30480000
DJ0007         DISPLAY 'CAT500A: OPEN STATUS = ' MFEXBR-STATUS          30480000
DJ0007         DISPLAY 'CAT500A: U3001 - ABENDING ON BAD FILE STATUS'   30480000
DJ0007         MOVE +3001    TO ABEND-CODE                              30480000
DJ0007         CALL ABEND USING ABEND-CODE                              30480000
DJ0007     END-IF.                                                      30480000
                                                                        30480000
DJ0006     OPEN OUTPUT ACATACTF.                                        30490025
DJ0006     DISPLAY 'CAT500A: ACATACTF OPENED FOR OUTPUT. STATUS = '     30500025
DJ0006                                         ACATACTF-FILE-STATUS.    30510025
DJ0006     IF  ACATACTF-OKAY                                            30520025
DJ0006         CONTINUE                                                 30530012
DJ0006     ELSE                                                         30540012
DJ0006         DISPLAY 'CAT500A: ERROR OPENING ACATACTF'                30550025
DJ0006         DISPLAY 'CAT500A: OPEN STATUS = ' ACATACTF-FILE-STATUS   30560025
DJ0006                      '.  OUTPUT-CNT = ' W-ACATACTF-CNT           30570025
DJ0006         DISPLAY 'CAT500A: U3008 - ABENDING ON BAD FILE STATUS'   30580012
DJ0006         MOVE +3008    TO ABEND-CODE                              30590012
DJ0006         CALL ABEND USING ABEND-CODE                              30600012
DJ0006     END-IF.                                                      30610012
                                                                        30620012
           MOVE 'CAT500A'                TO  BPDATES-CALLING-PGM        30630000
           MOVE 'C'                      TO  BPDATES-REQ-TYPE           30640000
           MOVE '  '                     TO  BPDATES-CALENDAR-TYPE      30650000
           CALL  BPDATES              USING  BPDATES-PARAMETERS         30660000
                                                                        30670000
           IF BPD-VALID-RETURN                                          30680000
              CONTINUE                                                  30690000
           ELSE                                                         30700000
              DISPLAY ' '                                               30710000
              DISPLAY '*******************************'                 30720000
              DISPLAY '* BPDATES INVALID-RETURN = ' BPDATES-RETURN-CODE 30730000
                      ' *'                                              30740000
              DISPLAY '* PROGRAM IS ABENDING         *'                 30750000
              DISPLAY '*******************************'                 30760000
              DISPLAY ' '                                               30770000
              CALL ABEND              USING  ABEND-CODE                 30780000
           END-IF                                                       30790000
                                                                        30800000
           EXEC SQL                                                     30810000
               SET :WS-TO-TMSTMP = CURRENT TIMESTAMP                    30820000
           END-EXEC                                                     30830000
                                                                        30840000
           IF SQLCODE NOT = +0                                          30850000
              DISPLAY 'SQLCODE = ' SQLCODE                              30860000
              PERFORM SQL-ERROR-ROUTINE                                 30870000
           END-IF                                                       30880000
                                                                        30890000
           DISPLAY ' '                                                  30900000
           DISPLAY '              CUTOFF TIMES:'                        30910000
           DISPLAY '              -------------'                        30920000
           DISPLAY 'TI ADD               : ' LS-TIA-TIME                30930000
           DISPLAY 'TI CHANGE/DELETE     : ' LS-TIC-TIME                30940000
           DISPLAY 'TI REJECT (DELIVERER): ' LS-TIRD-TIME               30950000
           DISPLAY 'TI REJECT (RECEIVER) : ' LS-TIRR-TIME               30960000
           DISPLAY 'TI ACCELERATE        : ' LS-TIX-TIME                30970000
           DISPLAY ' '                                                  30980000
           DISPLAY 'AT ADD               : ' LS-ATA-TIME                30990000
           DISPLAY 'AT CHANGE/DELETE     : ' LS-ATCD-TIME               31000000
           DISPLAY ' '                                                  31010000
           DISPLAY 'FR ADD               : ' LS-FRA-TIME                31020000
                                                                        31030000
           MOVE LS-TIA-TIME                 TO  WS-TIA-HHMM             31040000
           MOVE LS-TIC-TIME                 TO  WS-TIC-HHMM             31050000
           MOVE LS-TIRD-TIME                TO  WS-TIRD-HHMM            31060000
           MOVE LS-TIRR-TIME                TO  WS-TIRR-HHMM            31070000
           MOVE LS-TIX-TIME                 TO  WS-TIX-HHMM             31080000
           MOVE LS-ATA-TIME                 TO  WS-ATA-HHMM             31090000
           MOVE LS-ATCD-TIME                TO  WS-ATCD-HHMM            31100000
LRM001     MOVE LS-ATRD-TIME                TO  WS-ATRD-HHMM            31110000
           MOVE LS-FRA-TIME                 TO  WS-FRA-HHMM             31120000
                                                                        31130000
           MOVE ZEROES                      TO  WS-TIA-SS               31140000
                                                WS-TIC-SS               31150000
                                                WS-TIRD-SS              31160000
                                                WS-TIRR-SS              31170000
                                                WS-TIX-SS               31180000
                                                WS-ATA-SS               31190000
                                                WS-ATCD-SS              31200000
                                                WS-ATRD-SS              31210000
                                                WS-FRA-SS               31220000
                                                WS-COMMIT-CTR           31230000
                                                WS-ABEND-CTR            31240000
DJ0002     MOVE ' '                         TO  FR-ACAT-CONTROL-NBR     31250000
           .                                                            31260000
                                                                        31270000
           EJECT                                                        31280000
      ****************                                                  31290000
       ENDJOB-ROUTINE.                                                  31300000
      ****************                                                  31310000
                                                                        31320000
           CLOSE  CYCLE-LOG                                             31330000
                  NTWREG-FILE                                           31340000
                  NTWMAST-FILE.                                         31350000
                                                                        31360012
DJ0007     CLOSE MFEXBR                                                 31360012
DJ0007     DISPLAY 'CAT500A: MFEXBR   CLOSED. STATUS = '                31360012
DJ0007                                        MFEXBR-STATUS.            31360012
DJ0007     DISPLAY 'CAT500A: W-MFMSD-CNT      = ' W-MFMSD-CNT           31360012
DJ0007                     ' W-MFMSD-FND-CNT  = ' W-MFMSD-FND-CNT       31360012
DJ0007     DISPLAY 'CAT500A: W-MFEXBR-CNT     = ' W-MFEXBR-CNT          31360012
DJ0007                     ' W-MFEXBR-FND-CNT = ' W-MFEXBR-FND-CNT      31360012
                                                                        31360012
DJ0006     PERFORM 7700-WRITE-ACATACTF-TRAILER.                         31370052
DJ0006     CLOSE ACATACTF                                               31380025
DJ0006     DISPLAY 'CAT500A: ACATACTF CLOSED. STATUS = '                31390025
DJ0006                                       ACATACTF-FILE-STATUS.      31400025
                                                                        31410012
           PERFORM VARYING S1 FROM 1 BY 1                               31420000
              UNTIL S1 > CLIENT-TABLE-CNTR                              31430000
              DISPLAY ' '                                               31440000
              DISPLAY '   TOTALS FOR CLIENT ' CLIENT-NUM (S1)           31450000
              DISPLAY '   ----------------------'                       31460000
              DISPLAY 'NUMBER OF TI RECORDS: '                          31470000
                                       CLIENT-TI-REC-CNTR (S1)          31480000
              DISPLAY 'NUMBER OF AT RECORDS: '                          31490000
                       CLIENT-AT-REC-CNTR (S1)                          31500000
              IF CLIENT-B1-434503 (S1) = '0'                            31510000
DJ0001           DISPLAY 'CLIENT ' CLIENT-NUM (S1)                      31520000
DJ0001                           ' WILL SUPPLY FR RECORDS ITSELF.'      31530000
DJ0001                           ' CLIENT-B1-434503 = 0'                31540000
              ELSE                                                      31550000
                 DISPLAY 'NUMBER OF FR RECORDS: '                       31560000
                                              CLIENT-FR-REC-CNTR (S1)   31570000
              END-IF                                                    31580000
LRM010        DISPLAY 'NBR OF PARA  TI RECORDS: '                       31470000
LRM010                                 CLIENT-TI-REC-CNTR-S (S1)        31480000
LRM010                 ' CHANGED P TO S'                                        
LRM010        DISPLAY 'NBR OF PARA  AT RECORDS: '                       31490000
LRM010                 CLIENT-AT-REC-CNTR-S (S1)                        31500000
LRM010                 ' CHANGED P TO S'                                        
              DISPLAY 'CLIENT TOTAL RECORDS: ' CLIENT-ALL-REC-CNTR (S1) 31590000
              DISPLAY '                   ***'                          31600000
           END-PERFORM                                                  31610000
                                                                        31620000
           DISPLAY ' '                                                  31630000
           DISPLAY '----------------------------------'                 31640000
           DISPLAY ' DB2 UPDATE TOTALS (MEETS CUTOFF) '                 31650000
           DISPLAY '----------------------------------'                 31660000
           DISPLAY 'NUMBER OF TI   RECORDS: ' WS-TOTAL-TI-REC-CNTR      31670000
           DISPLAY 'NUMBER OF AT1  RECORDS: ' WS-AT1-UPDT-CNTR          31680000
           DISPLAY 'NUMBER OF AT2  RECORDS: ' WS-AT2-UPDT-CNTR          31690000
           DISPLAY 'NUMBER OF AT   RECORDS: ' WS-TOTAL-AT-REC-CNTR      31700000
           DISPLAY 'NUMBER OF MF   RECORDS: ' WS-AT-MF-CNTR             31710000
           DISPLAY 'NUMBER OF FR   RECORDS: ' WS-TOTAL-FR-REC-CNTR      31720000
           DISPLAY 'NUMBER OF TOTAL       : ' WS-TOTAL-REC-CNTR         31730000
           DISPLAY 'TOTAL NUMBER OF DB2 COMMIT: ' WS-COMMIT-TOT-CTR     31740000
                                                                        31750000
           IF WS-TI-ACUTF-CNTR > +0     OR                              31760000
              WS-AT-ACUTF-CNTR > +0     OR                              31770000
              WS-FR-ACUTF-CNTR > +0                                     31780000
              DISPLAY ' '                                               31790000
              DISPLAY '   ---------------------------------'            31800000
              DISPLAY '    ITEM COUNTS THAT MISSED CUTOFF  '            31810000
              DISPLAY '   ---------------------------------'            31820000
              DISPLAY 'NUMBER OF TI RECORDS: ' WS-TI-ACUTF-CNTR         31830000
              DISPLAY 'NUMBER OF AT RECORDS: ' WS-AT-ACUTF-CNTR         31840000
              DISPLAY 'NUMBER OF MF RECORDS: ' WS-FR-ACUTF-CNTR         31850000
              INITIALIZE WS-TI-ACUTF-CNTR, WS-AT-ACUTF-CNTR,            31860000
                         WS-FR-ACUTF-CNTR                               31870000
            END-IF.                                                     31880000
LRM011     DISPLAY  'NUMBER OF TI PARALLEL ALREADY SENT '               14280000
LRM011               WS-TI-UPDT-PARA-CNTR                               14280000
LRM011     DISPLAY  'NUMBER OF AT PARALLEL ALREADY SENT '               14280000
LRM011               WS-AT-UPDT-PARA-CNTR                               14280000
                                                                        31890000
           DISPLAY ' '                                                  31900000
           DISPLAY '**************************'                         31910000
           DISPLAY '* END OF CAT500A PROGRAM *'                         31920000
           DISPLAY '**************************'                         31930000
           DISPLAY ' '                                                  31940000
                                                                        31950000
           .                                                            31960000
