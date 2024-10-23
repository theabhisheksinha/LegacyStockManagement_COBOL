000001* PDX    - ACAT05DA C0302589 10/22/10 10:07:03 TBLAMUR            00001005
LRM020* SSR 70666 CREATE AUDIT ROW IN VTRNFRAU FOR CLIENT               00001101
LRM020*   ACCEPT.  THIS WILL BE REPORTED IN CAT761.                     00001200
000001* PDX    - ACAT05DA C0290669 01/12/10 14:49:09 TBLAMUR            00001300
LRM019* SSR 65698 DISPLAY FULL CASH BAL REQUEST ON PTR IN 500 STATUS    00001400
000001* PDX    - ACAT05DA C0287777 11/03/09 10:33:04 TBLAMUR            00001500
LRM018* SSR 65670 SUB PENNY PRICE MSG                                   00001600
000001* PDX    - ACAT05DA C0277094 04/06/09 10:56:24 TBDOJUN            00001700
DJ0001* DJ0001 SSR 61684 AUCTION RATE SECURITY MSG                      00001800
000001* PDX    - ACAT05DA C0272581 12/22/08 08:13:18 TBLAMUR            00001900
LRM017* SSR 61164 INCLUDE NEW TRANSFER TPPE PTF ON THE SCREEN.          00002000
000001* PDX    - ACAT05DA C0274611 12/18/08 13:41:27 TBLAMUR            00002100
LRM016* SSR# 55766 DO NOT COPY ACK-IND FROM HSTY TABLE                  00002200
000001* PDX    - ACAT05DA C0263391 04/04/08 14:10:58 TBLAMUR            00002300
LRM015* SSR 55766 ASCENDIS INTERFACE. WIPE ACK_IND ON UPDATE.           00002400
000001* PDX    - ACAT05DA C0241220 11/13/06 16:11:40 TBLAMUR            00002500
LRM014* SSR 46059 AUTOWIRES PROJECT - NOTE AS ACCEPTED IN 2NDARY COL    00002600
000001* PDX    - ACAT05DA C0240732 11/09/06 08:17:21 TBLAMUR            00002700
LRM013* SSR 49202 SELECT GIFT INDICATOR TO DISPLAY ON EXCEPTION POPUP   00002800
000001* PDX    - ACAT05DA C0238544 08/25/06 09:09:04 TBLAMUR            00002900
LRM012* SSR 45145 ADD REJECT TOO LATE WARNING                           00003000
000001* PDX    - ACAT05DA C0231507 07/07/06 14:36:00 TBEDTAK            00004000
ET0011* JUN 06 - NON-SSR BUG - STTS-CD IS USED AS PART OF KEY TO READ   00005000
ET0011* JUN 06   ACTITRF THAT CAUSES TO UNABLE TO UPDATE TBL.           00006000
ET0010* JUN 06 - 040661 RETAIN USER ID OF INITIATOR.                    00007000
ET0009* JUN 06 - 045744 BLOCK ENTRY BASED ON ACCOUNT FREEZE.            00008000
000001* PDX    - ACAT05DA C0225230 10/21/05 11:27:44 TBEDTAK            00009000
000001* PDX    - ACAT05DA C0222099 07/06/05 16:06:50 TBEDTAK            00010000
000001* PDX    - ACAT05DA C0215192 01/05/05 10:01:00 TBEDTAK            00020000
000001* PDX    - ACAT05DA C0205792 06/01/04 11:43:08 TBEDTAK            00030000
000001* PDX    - ACAT05DA C0181954 11/08/02 16:23:07 TBEDTAK            00040000
000001* PDX    - ACAT05DA C0157168 08/17/01 15:23:25 TBLAMUR            00050000
000001* PDX    - ACAT05DA C0142590 05/25/00 13:43:01 TBLAMUR            00060000
000001* PDX    - ACAT05DA C0126743 07/22/99 16:14:35 TBLAMUR            00070000
000001* PDX    - ACAT05DA C0123136 04/06/99 10:18:57 TBEDTAK            00080000
000001* PDX    - ACAT05DA C0120336 02/05/99 22:38:31 TBEDTAK            00090000
000001* PDX    - ACAT05DA C0119290 12/17/98 10:33:23 TBTIKUO            00100000
000001* PDX    - ACAT05DA C0117770 11/23/98 09:51:34 TBTIKUO            00110000
000001* PDX    - ACAT05DA C0112193 11/13/98 16:18:37 TBLAMUR            00120000
       IDENTIFICATION DIVISION.                                         00130000
       PROGRAM-ID.    ACAT05DA.                                         00140000
       AUTHOR.        TINA KUO.                                         00150000
       DATE-WRITTEN.                                                    00160000
       DATE-COMPILED.                                                   00170000
      *---------------------------------------------------------------* 00180000
      *                                                               * 00190000
      *   THIS IS THE ACATS I/O MODULE CALLED BY ACAT05RN,            * 00200000
      *   IT HANDLES DB2 FUNCTIONS OF TABLE ACAT_TRNF, ACAT_INIT_TRNF * 00210000
      *                                                               * 00220000
      *---------------------------------------------------------------* 00230000
ET0001*11/25/02 ADD "ACCELERATE" PROCESS                              * 00240000
ET0002*06/01/04 REJECT PTR WITH REJECT CODE 21                        * 00250000
ET0003*JAN.2005 DB2 TABLE KEY CHANGE WITH NEW TABLE NAME              * 00260000
ET0004*07/01/05 SSR 39848 DISPLAY CAGE TAG# AND ALLOW USER TO UPDATE. * 00270000
ET0005*07/01/05 SSR 43192 MOVE SPACE TO NSCC-PEND-CD WHEN UPDATING    * 00280000
      *                   REJECT RECORD.                              * 00290000
ET0006*07/01/05 FIX BUG                                               * 00300000
ET0007*OCT.2005 SSR 39800 IDENTIFY DUPLICATE MFC/FRV AND DISPLAY MSG. * 00310000
ET0008*OCT.2005 NON SSR   UPDATE NEWLY ADDED DB2 COL CICS_SGNON_ID.     00320000
      ***************************************************************** 00330000
       ENVIRONMENT DIVISION.                                            00340000
                                                                        00350000
       DATA DIVISION.                                                   00360000
                                                                        00370000
       WORKING-STORAGE SECTION.                                         00380000
       COPY PDXIDCOB.                                                   00390000
       01  FILLER                          PIC X(60)                    00400000
           VALUE 'ACAT05DA WORKING STORAGE BEGINS HERE'.                00410000
      *                                                                 00420000
092700*77  TWA-SIZE                         PIC S9(4) COMP.             00430000
092700 77  WS-CICS-RESPONSE                 PIC S9(8) COMP   VALUE +0.  00440000
092700 77  WS-COUNT                         PIC S9(9) COMP   VALUE +0.  00450000
092700 77  WS-EIBCALEN                      PIC S9(8) COMP.             00460000
ET0007 77  MAX-TBL-CNT                      PIC S9(7) COMP-3 VALUE +500.00470000
       01  WS-ACAT05DA-WORK-AREA.                                       00480000
           05  WS-FIRST-TIME-SW             PIC X(01) VALUE SPACE.      00490000
               88 FIRST-TIME                         VALUE 'Y'.         00500000
           05  WS-VTRNFR-AREA.                                          00510000
               10 SEARCH-VTRNFR-SW          PIC X(01) VALUE SPACE.      00520000
                  88 SEARCH-VTRNFR                   VALUE 'Y'.         00530000
               10 FOUND-VTRNFR-SW           PIC X(01) VALUE SPACE.      00540000
                  88  VTRNFR-FOUND                   VALUE 'Y'.         00550000
                  88  VTRNFR-NOT-FOUND               VALUE 'N'.         00560000
           05  WS-VINITRNF-AREA.                                        00570000
               10 SEARCH-VINITRNF-SW        PIC X(01) VALUE SPACE.      00580000
                  88 SEARCH-VINITRNF                 VALUE 'Y'.         00590000
               10 FOUND-VINITRNF-SW         PIC X(01) VALUE SPACE.      00600000
                  88  VINITRNF-FOUND                 VALUE 'Y'.         00610000
                  88  VINITRNF-NOT-FOUND             VALUE 'N'.         00620000
           05  WS-CURRENT-VTRNFR-SW            PIC X.                   00630000
               88  CURRENT-VTRNFR-FOUND           VALUE 'Y'.            00640000
               88  CURRENT-VTRNFR-NOT-FOUND       VALUE 'Y'.            00650000
           05  WS-TRANSFER-FOUND-SW            PIC X.                   00660000
               88  WS-TRANSFER-FOUND              VALUE 'Y'.            00670000
               88  WS-TRANSFER-NOT-FOUND          VALUE 'N'.            00680000
               88  WS-TRANSFER-FOUND-ERR          VALUE 'E'.            00690000
           05  WS-EXIT-LOOP-SW                 PIC X.                   00700000
               88  WS-EXIT-LOOP                   VALUE 'Y'.            00710000
01/12 *------- BEG                                                      00720000
01/12      05  CASH-BALANCE-WORK-AREA.                                  00730000
01/05          10  WS-BAL                   USAGE COMP-2.               00740000
               10  SV-BAL01                 PIC S9(15)V9(2) COMP-3.     00750000
               10  SV-BAL02                 PIC S9(15)V9(2) COMP-3.     00760000
               10  SV-BAL05                 PIC S9(15)V9(2) COMP-3.     00770000
               10  SV-BAL01C                PIC S9(15)V9(2) COMP-3.     00780000
               10  SV-BAL01D                PIC S9(15)V9(2) COMP-3.     00790000
               10  SV-BAL02C                PIC S9(15)V9(2) COMP-3.     00800000
               10  SV-BAL02D                PIC S9(15)V9(2) COMP-3.     00810000
               10  SV-BAL05C                PIC S9(15)V9(2) COMP-3.     00820000
               10  SV-BAL05D                PIC S9(15)V9(2) COMP-3.     00830000
12/31          10  SV-BAL01-STTLM-RSN-CD    PIC X(04)   VALUE SPACES.   00840000
12/31          10  SV-BAL02-STTLM-RSN-CD    PIC X(04)   VALUE SPACES.   00850000
12/31          10  SV-BAL05-STTLM-RSN-CD    PIC X(04)   VALUE SPACES.   00860000
LRM019         10  SV-BAL01-FULL-RQST       PIC X(01)   VALUE SPACES.   00861000
LRM019         10  SV-BAL02-FULL-RQST       PIC X(01)   VALUE SPACES.   00862000
LRM019         10  SV-BAL05-FULL-RQST       PIC X(01)   VALUE SPACES.   00863000
01/05          10  WS-STTLM-LCTN-CD         PIC X(02)   VALUE SPACES.   00870000
01/05          10  WS-CSH-MGN-SHRT-CD       PIC X(01)   VALUE SPACES.   00880000
01/05          10  WS-PSTN-CD               PIC X(01)   VALUE SPACES.   00890000
01/12 *------- END                                                      00900000
           05  WS-TRANS-TYPE-CD             PIC X(01).                  00910000
           05  WS-PRCS-DT                   PIC X(10).                  00920000
           05  WS-STTLM-ASCTD-DT            PIC X(10).                  00930000
           05  WS-TIMESTAMP                 PIC X(26).                  00940000
           05  WS-SBMT-BRKR                 PIC X(04).                  00950000
ET0004     05  WS-TRMID                     PIC X(04).                  00960000
ET0007     05  WS-ACAT-CNTRL                PIC X(14).                  00970000
ET0007     05  WS-RCV-BR-AC-WITH-MASK.                                  00980000
ET0007         07  WS-RCV-BR-AC             PIC X(08).                  00990000
ET0007         07  WS-RCV-BR-AC-MASK        PIC X(12).                  01000000
ET0007     05  WS-RCV-BR-AC-NBR             PIC X(20).                  01010000
ET0007     05  WS-DUPE-FOUND-SW             PIC X(01).                  01020000
ET0007         88  WS-DUPE-FOUND                      VALUE 'Y'.        01030000
ET0007     05  WS-ASSET-TBL-AREA.                                       01040000
ET0007         07  WS-ASSET-TBL             PIC X(09) OCCURS 500 TIMES. 01050000
      ******************************************************************01060000
           05  TSQ-WORK-AREA.                                           01070000
               10  TSQ-NAME.                                            01080000
                   15  TERM-ID             PIC X(04).                   01090000
                   15  TRAN-ID             PIC X(04).                   01100000
               10  ITEM-NUM                PIC S9(04)  COMP VALUE +0.   01110000
               10  MAX-ITEM-NUM            PIC S9(04)  COMP VALUE +0.   01120000
      ******************************************************************01130000
       01  WS-IO-AREA.                                                  01140000
           05  WS-SAVE-KEY.                                             01150000
               10  SV-CLIENT-NBR            PIC X(04).                  01160000
               10  SV-ACAT-CNTL-NBR         PIC X(14).                  01170000
               10  SV-BRANCH-CD             PIC X(03).                  01180000
               10  SV-ACCT-CD               PIC X(05).                  01190000
               10  SV-RR-CD                 PIC X(03).                  01200000
NEW            10  SV-BRKR                      PIC X(04).              01210000
NEW            10  SV-TFR                       PIC X(03).              01220000
NEW            10  SV-STCD                      PIC X(03).              01230000
               10  SV-ASSET-SEQ-NBR             PIC S9(4) COMP.         01240000
NEW   *        10  SV-DLVR-NBR                  PIC X(04).              01250000
NEW   *        10  SV-RCV-NBR                   PIC X(04).              01260000
NEW   *        10  SV-ACCT-DLVR-NBR             PIC X(20).              01270000
NEW   *        10  SV-ACCT-RCV-NBR              PIC X(20).              01280000
NEW   *        10  SV-STTLM-LCTN-CD             PIC X(02).              01290000
NEW   *        10  SV-SEC-ISSUE-CD              PIC X(09).              01300000
ET0008     05  WS-ACAT-SIGN-ON-ID               PIC X(04).              01310000
           05  WS-ACAT05DA-IO.                                          01320000
               10 WS-SCREEN-IND                 PIC X(01).              01330000
               10 WS-CLIENT-NBR                 PIC X(04).              01340000
               10 WS-ACAT-CONTROL-NBR           PIC X(14).              01350000
               10 WS-BRANCH-CD                  PIC X(03).              01360000
               10 WS-ACCT-CD                    PIC X(05).              01370000
               10 WS-RR-CD                      PIC X(03).              01380000
               10 WS-TFR-TYPE                   PIC X(03).              01390000
               10 WS-STTS-CD                    PIC X(03).              01400000
01/12          10 WS-DAYS                       PIC S9(04) COMP.        01410000
               10 WS-RCV-NBR                    PIC X(04).              01420000
               10 WS-DLVR-NBR                   PIC X(04).              01430000
               10 WS-ACCT-DLVR-NBR              PIC X(20).              01440000
               10 WS-ACCT-RCV-NBR               PIC X(20).              01450000
               10 WS-RCV-CUST-NM                PIC X(60).              01460000
               10 WS-RCV-SS-PRIM-NBR            PIC X(09).              01470000
               10 WS-RCV-SS-SCNDY-NBR           PIC X(09).              01480000
               10 WS-RCV-ACCT-TYPE-CD           PIC X(02).              01490000
               10 WS-INIT-TRANS-TYPE-CD         PIC X(01).              01500000
               10 WS-VINITRNF-NSCC-PEND-CD      PIC X(01).              01510000
               10 WS-VTRNFR-NSCC-PEND-CD        PIC X(01).              01520000
               10 WS-STTLM-RSN-CD               PIC X(01).              01530000
               10 WS-TRNFR-TYPE-RJCT-CD         PIC X(02).              01540000
               10 WS-STTLM-DT                   PIC X(10).              01550000
               10 WS-VTRNFR-CMNT                PIC X(120).             01560000
               10 WS-ALERT-IND                  PIC X(01).              01570000
ET0007         10 WS-ACAT-CNTL-ASTD-NBR         PIC X(14).              01580000
ET0007         10 WS-FRV-MFC-CMPLT-IND          PIC X(01).              01590000
               10 WS-DSTBN-SIDE-CD              PIC X(01).              01600000
               10 WS-RSCD01                     PIC X(02).              01610000
               10 WS-RSCD02                     PIC X(02).              01620000
               10 WS-RSCD05                     PIC X(02).              01630000
01/12          10 WS-BAL01                      PIC S9(15)V99 COMP-3.   01640000
01/12          10 WS-BAL02                      PIC S9(15)V99 COMP-3.   01650000
01/12          10 WS-BAL05                      PIC S9(15)V99 COMP-3.   01660000
               10 WS-RETURN-MSG                 PIC X(70).              01670000
           05  WS-ACAT05DA-EXCEPTIONS.                                  01680000
               10 FILLER                        PIC X(1).               01690000
               10 WS-TS-EXCEPTIONS.                                     01700000
                  15 WS-ACCT-ACTIVITY-IND          PIC X(1).            01710000
                  15 WS-ACCT-ORDERS-IND            PIC X(1).            01720000
                  15 WS-ACCT-RJCT-RSBM-IND         PIC X(1).            01730000
                  15 WS-ACCT-DB-BAL-T1-IND         PIC X(1).            01740000
                  15 WS-ACCT-MRGN-DB-IND           PIC X(1).            01750000
                  15 WS-ACCT-SHRT-PSTN-IND         PIC X(1).            01760000
                  15 WS-ACCT-SEC-RSTRD-IND         PIC X(1).            01770000
                  15 WS-ACCT-AST-EXCS-IND          PIC X(1).            01780000
                  15 WS-ACCT-OPTN-PSTN-IND         PIC X(1).            01790000
                  15 WS-ACCT-LTD-PRTNR-IND         PIC X(1).            01800000
                  15 WS-ACCT-TIN-MSMTH-IND         PIC X(1).            01810000
                  15 WS-ACCT-DPLCT-TRN-IND         PIC X(1).            01820000
                  15 WS-ACCT-CUST-70-IND           PIC X(1).            01830000
                  15 WS-ACCT-QULFD-PLN-IND         PIC X(1).            01840000
                  15 WS-ACCT-MNGD-IND              PIC X(1).            01850000
                  15 WS-ACCT-PRVT-RNG-IND          PIC X(1).            01860000
                  15 WS-ACCT-BRKR-TIF-IND          PIC X(1).            01870000
                  15 WS-NSCC-NON-ADP-IND           PIC X(1).            01880000
                  15 WS-ACCT-COMMENTS-IND          PIC X(1).            01890000
ET0009            15 WS-ACCT-FRZN-IND              PIC X(1).            01900000
LRM012            15 WS-STTLM-TM-CD                PIC X(1).            01910000
LRM013            15 WS-GIFT-IND                   PIC X(1).            01920000
DJ0001            15 WS-AUCTION-RATE-IND           PIC X(1).            01921000
LRM018            15 WS-SUB-PENNY-PRICE-IND        PIC X(1).            01922000
           05 WS-ACAT05DA-INPUT.                                        01930000
              10 WS-M5NEXT                         PIC X(01).           01940000
              10 WS-M5ACCPT                        PIC X(01).           01950000
ET0001        10 WS-M5ACCEL                        PIC X(01).           01960000
              10 WS-M5REJ                          PIC X(01).           01970000
              10 WS-M5REJC                         PIC X(01).           01980000
              10 WS-VINITRNF-CMNT                  PIC X(120).          01990000
           05 WS-TRLM-INPUT.                                            02000000
              10 WS-MBR                            PIC X(03).           02010000
              10 WS-MAC                            PIC X(05).           02020000
              10 WS-MRR                            PIC X(03).           02030000
              10 WS-MCBRKR                         PIC X(04).           02040000
              10 WS-MTFR                           PIC X(03).           02050000
              10 WS-MSTAT                          PIC X(03).           02060000
      ******************************************************************02070000
       01  WS-ABEND-MESSAGE.                                            02080000
           05  FILLER                      PIC X(24) VALUE              02090000
             'ACAT05DA ABENDED ====> '.                                 02100000
           05  WS-ABCODE                   PIC X(04) VALUE SPACES.      02110000
                                                                        02120000
       01  WS-ERRL-DATA.                                                02130000
           05  REQUEST-TYPE                PIC X(01).                   02140000
               88  WRITE-ERROR-TO-LOG          VALUE 'W'.               02150000
           05  CALLING-TRAN-ID             PIC X(04).                   02160000
           05  CALLING-PROGRAM-ID          PIC X(08).                   02170000
           05  SQLCA-AREA                  PIC X(136).                  02180000
       01  WS-WORK-AREA.                                                02190000
           05  WS-SEC-DESC                 PIC X(30).                   02200000
           05  SUB                         PIC S9(04) COMP.             02210000
ET0007     05  SUB-AST                     PIC S9(07) COMP-3.           02220000
       EJECT                                                            02230000
       COPY ACATSRCH.                                                   02240000
       EJECT                                                            02250000
       COPY SECLINKC.                                                   02260000
       EJECT                                                            02270000
           EXEC SQL                                                     02280000
                INCLUDE SQLCA                                           02290000
           END-EXEC                                                     02300000
      /                                                                 02310000
      *====>  ACAT TRANSFER TABLE                                       02320000
014700     EXEC SQL                                                     02330000
PC             INCLUDE VTRNFR                                           02340000
014900     END-EXEC.                                                    02350000
015000/                                                                 02360000
LRM020*====>  ACAT TRANSFER AUDIT TABLE                                 02361000
LRM020     EXEC SQL                                                     02362000
LRM020         INCLUDE VTRNFRAU                                         02363000
LRM020     END-EXEC.                                                    02364000
015000/                                                                 02365000
      *====>  ACAT INITIAL TRANSFER TABLE                               02370000
014700     EXEC SQL                                                     02380000
ET0003**       INCLUDE VINITRNF                                         02390000
ET0003         INCLUDE ACTITRF                                          02400000
014900     END-EXEC.                                                    02410000
015000/                                                                 02420000
      *====>  ACAT ASSET  TABLE                                         02430000
014700     EXEC SQL                                                     02440000
PC             INCLUDE VASSET                                           02450000
014900     END-EXEC.                                                    02460000
015000/                                                                 02470000
      *====> DECLARE CURSOR (FWD_CSR) <===========*                     02480000
                                                                        02490000
014700     EXEC SQL                                                     02500000
PC             DECLARE FWD_CSR  CURSOR FOR                              02510000
092700         SELECT                                                   02520000
                     CLIENT_NBR                                         02530000
                   , BRANCH_CD                                          02540000
                   , ACCT_CD                                            02550000
                   , RR_CD                                              02560000
                   , ACAT_CONTROL_NBR                                   02570000
                   , TRNFR_TYPE_CD                                      02580000
                   , STTS_CD                                            02590000
01/12              , DAYS_STTS_QTY                                      02600000
                   , RCV_NBR                                            02610000
                   , DLVR_NBR                                           02620000
                   , ACCT_DLVR_NBR                                      02630000
                   , ACCT_RCV_NBR                                       02640000
                   , RCV_CUST_NM                                        02650000
                   , RCV_SS_PRIM_NBR                                    02660000
                   , RCV_SS_SCNDY_NBR                                   02670000
                   , RCV_ACCT_TYPE_CD                                   02680000
                   , STTLM_DT                                           02690000
                   , CMNT_TXT                                           02700000
                   , DSTBN_SIDE_CD                                      02710000
                   , NSCC_PEND_CD                                       02720000
                   , ACCT_ACTIVITY_IND                                  02730000
                   , ACCT_ORDERS_IND                                    02740000
                   , ACCT_RJCT_RSBM_IND                                 02750000
                   , ACCT_DB_BAL_T1_IND                                 02760000
                   , ACCT_MRGN_DB_IND                                   02770000
                   , ACCT_SHRT_PSTN_IND                                 02780000
                   , ACCT_SEC_RSTRD_IND                                 02790000
                   , ACCT_AST_EXCS_IND                                  02800000
                   , ACCT_OPTN_PSTN_IND                                 02810000
                   , ACCT_LTD_PRTNR_IND                                 02820000
                   , ACCT_TIN_MSMTH_IND                                 02830000
                   , ACCT_DPLCT_TRN_IND                                 02840000
                   , ACCT_CUST_70_IND                                   02850000
                   , ACCT_QULFD_PLN_IND                                 02860000
                   , ACCT_MNGD_IND                                      02870000
                   , ACCT_PRVT_RNG_IND                                  02880000
                   , ACCT_BRKR_TIF_IND                                  02890000
                   , NSCC_NON_ADP_IND                                   02900000
                   , ALERT_IND                                          02910000
ET0007             , ACAT_CNTL_ASTD_NBR                                 02920000
ET0007             , FRV_MFC_CMPLT_IND                                  02930000
ET0009             , ACCT_FRZN_IND                                      02940000
LRM012             , STTLM_TM_CD                                        02950000
LRM013             , GIFT_IND                                           02960000
DJ0001             , AUCTION_RT_IND                                     02961000
LRM018             , PENNY_STK_IND                                      02962000
092900                FROM VTRNFR                                       02970000
093000         WHERE (CLIENT_NBR = :SV-CLIENT-NBR)                      02980000
                 AND (DSTBN_SIDE_CD = 'R')                              02990000
01/20            AND (NOT NSCC_PEND_CD = 'A')                           03000000
                 AND (TRNFR_TYPE_CD IN                                  03010000
LRM017             ('RCR','FRV','PTD','PTR','PTF','CRD','RCL','MFC'))   03020000
ET0001**         AND (STTS_CD IN ('200','210','220','230'))             03030000
ET0001           AND (STTS_CD IN ('200','210','220','230','500'))       03040000
                 AND  ((BRANCH_CD > :SV-BRANCH-CD     OR                03050000
                       (BRANCH_CD = :SV-BRANCH-CD AND                   03060000
                        ACCT_CD > :SV-ACCT-CD)        OR                03070000
                       (BRANCH_CD = :SV-BRANCH-CD AND                   03080000
                        ACCT_CD = :SV-ACCT-CD     AND                   03090000
                        ACAT_CONTROL_NBR > :SV-ACAT-CNTL-NBR)) AND      03100000
                       RR_CD         LIKE :SV-RR-CD            AND      03110000
                       DLVR_NBR      LIKE :SV-BRKR             AND      03120000
                       TRNFR_TYPE_CD LIKE :SV-TFR              AND      03130000
                       STTS_CD       LIKE :SV-STCD )                    03140000
                 ORDER BY  BRANCH_CD, ACCT_CD, RR_CD, DLVR_NBR,         03150000
                           TRNFR_TYPE_CD, STTS_CD, ACAT_CONTROL_NBR     03160000
014900     END-EXEC.                                                    03170000
015000/                                                                 03180000
      *====> DECLARE CURSOR (BWD_CSR) <===========*                     03190000
                                                                        03200000
014700     EXEC SQL                                                     03210000
PC             DECLARE BWD_CSR  CURSOR FOR                              03220000
092700         SELECT                                                   03230000
                     CLIENT_NBR                                         03240000
                   , BRANCH_CD                                          03250000
                   , ACCT_CD                                            03260000
                   , RR_CD                                              03270000
                   , ACAT_CONTROL_NBR                                   03280000
                   , TRNFR_TYPE_CD                                      03290000
                   , STTS_CD                                            03300000
01/12              , DAYS_STTS_QTY                                      03310000
                   , RCV_NBR                                            03320000
                   , DLVR_NBR                                           03330000
                   , ACCT_DLVR_NBR                                      03340000
                   , ACCT_RCV_NBR                                       03350000
                   , RCV_CUST_NM                                        03360000
                   , RCV_SS_PRIM_NBR                                    03370000
                   , RCV_SS_SCNDY_NBR                                   03380000
                   , RCV_ACCT_TYPE_CD                                   03390000
                   , STTLM_DT                                           03400000
                   , CMNT_TXT                                           03410000
                   , DSTBN_SIDE_CD                                      03420000
                   , NSCC_PEND_CD                                       03430000
                   , ACCT_ACTIVITY_IND                                  03440000
                   , ACCT_ORDERS_IND                                    03450000
                   , ACCT_RJCT_RSBM_IND                                 03460000
                   , ACCT_DB_BAL_T1_IND                                 03470000
                   , ACCT_MRGN_DB_IND                                   03480000
                   , ACCT_SHRT_PSTN_IND                                 03490000
                   , ACCT_SEC_RSTRD_IND                                 03500000
                   , ACCT_AST_EXCS_IND                                  03510000
                   , ACCT_OPTN_PSTN_IND                                 03520000
                   , ACCT_LTD_PRTNR_IND                                 03530000
                   , ACCT_TIN_MSMTH_IND                                 03540000
                   , ACCT_DPLCT_TRN_IND                                 03550000
                   , ACCT_CUST_70_IND                                   03560000
                   , ACCT_QULFD_PLN_IND                                 03570000
                   , ACCT_MNGD_IND                                      03580000
                   , ACCT_PRVT_RNG_IND                                  03590000
                   , ACCT_BRKR_TIF_IND                                  03600000
                   , NSCC_NON_ADP_IND                                   03610000
                   , ALERT_IND                                          03620000
ET0007             , ACAT_CNTL_ASTD_NBR                                 03630000
ET0007             , FRV_MFC_CMPLT_IND                                  03640000
ET0009             , ACCT_FRZN_IND                                      03650000
LRM012             , STTLM_TM_CD                                        03660000
LRM013             , GIFT_IND                                           03670000
DJ0001             , AUCTION_RT_IND                                     03671000
LRM018             , PENNY_STK_IND                                      03672000
092900                FROM VTRNFR                                       03680000
093000         WHERE (CLIENT_NBR = :SV-CLIENT-NBR)                      03690000
                 AND (DSTBN_SIDE_CD = 'R')                              03700000
01/20            AND (NOT NSCC_PEND_CD = 'A')                           03710000
                 AND (TRNFR_TYPE_CD IN                                  03720000
LRM017                ('RCR','FRV','PTD','PTR','PTF','CRD','RCL','MFC'))03730000
ET0002**         AND (STTS_CD IN ('200','210','220','230'))             03740000
ET0002           AND (STTS_CD IN ('200','210','220','230','500'))       03750000
                 AND  ((BRANCH_CD < :SV-BRANCH-CD     OR                03760000
                       (BRANCH_CD = :SV-BRANCH-CD AND                   03770000
                        ACCT_CD < :SV-ACCT-CD)        OR                03780000
                       (BRANCH_CD = :SV-BRANCH-CD AND                   03790000
                        ACCT_CD = :SV-ACCT-CD     AND                   03800000
                        ACAT_CONTROL_NBR < :SV-ACAT-CNTL-NBR)) AND      03810000
                       RR_CD         LIKE :SV-RR-CD            AND      03820000
                       DLVR_NBR      LIKE :SV-BRKR             AND      03830000
                       TRNFR_TYPE_CD LIKE :SV-TFR              AND      03840000
                       STTS_CD       LIKE :SV-STCD )                    03850000
                 ORDER BY  BRANCH_CD DESC, ACCT_CD DESC, RR_CD DESC,    03860000
                           DLVR_NBR DESC, TRNFR_TYPE_CD DESC,           03870000
                           STTS_CD DESC, ACAT_CONTROL_NBR DESC          03880000
014900     END-EXEC.                                                    03890000
015000/                                                                 03900000
ET0007     EXEC SQL                                                     03910000
ET0007        DECLARE TRNFR_CSR  CURSOR FOR                             03920000
ET0007           SELECT                                                 03930000
ET0007               CLIENT_NBR                                         03940000
ET0007              ,BRANCH_CD                                          03950000
ET0007              ,ACCT_CD                                            03960000
ET0007              ,RR_CD                                              03970000
ET0007              ,ACAT_CONTROL_NBR                                   03980000
ET0007              ,TRNFR_TYPE_CD                                      03990000
ET0007              ,STTS_CD                                            04000000
ET0007              ,DAYS_STTS_QTY                                      04010000
ET0007              ,RCV_NBR                                            04020000
ET0007              ,DLVR_NBR                                           04030000
ET0007              ,ACCT_DLVR_NBR                                      04040000
ET0007              ,ACCT_RCV_NBR                                       04050000
ET0007              ,RCV_CUST_NM                                        04060000
ET0007              ,RCV_SS_PRIM_NBR                                    04070000
ET0007              ,RCV_SS_SCNDY_NBR                                   04080000
ET0007              ,RCV_ACCT_TYPE_CD                                   04090000
ET0007              ,DSTBN_SIDE_CD                                      04100000
ET0007              ,NSCC_PEND_CD                                       04110000
ET0007              ,FRV_MFC_CMPLT_IND                                  04120000
ET0009              ,ACCT_FRZN_IND                                      04130000
ET0007           FROM                                                   04140000
ET0007              VTRNFR                                              04150000
ET0007          WHERE                                                   04160000
ET0007              CLIENT_NBR = :SV-CLIENT-NBR                         04170000
ET0007              AND DSTBN_SIDE_CD = 'R'                             04180000
ET0007              AND TRNFR_TYPE_CD IN ('MFC','FRV')                  04190000
ET0007              AND STTS_CD IN ('200', '300', '310')                04200000
ET0007              AND ACAT_CNTL_ASTD_NBR = :WS-ACAT-CNTL-ASTD-NBR     04210000
ET0007              AND DLVR_NBR = :WS-DLVR-NBR                         04220000
ET0007              AND ACCT_DLVR_NBR = :WS-ACCT-DLVR-NBR               04230000
ET0007              AND RCV_NBR = :WS-RCV-NBR                           04240000
ET0007              AND ACCT_RCV_NBR LIKE :WS-RCV-BR-AC-NBR             04250000
ET0007     END-EXEC.                                                    04260000
ET0007/                                                                 04270000
ET0007*                                                                 04280000
ET0007     EXEC SQL                                                     04290000
ET0007        DECLARE ASSET_CSR  CURSOR FOR                             04300000
ET0007           SELECT                                                 04310000
ET0007               CLIENT_NBR                                         04320000
ET0007              ,ACAT_CONTROL_NBR                                   04330000
ET0007              ,ASSET_SEQ_NBR                                      04340000
ET0007              ,SBMTG_PRTCP_NBR                                    04350000
ET0007              ,TRANS_TYPE_CD                                      04360000
ET0007              ,ASSET_PRC_CTGY_CD                                  04370000
ET0007              ,STTLM_LCTN_CD                                      04380000
ET0007              ,STTLM_RSN_CD                                       04390000
ET0007              ,ISIN_CNTRY_CD                                      04400000
ET0007              ,ISIN_SEC_ISSUE_CD                                  04410000
ET0007              ,ISIN_SEC_CDG_CD                                    04420000
ET0007              ,ASSET_QTY                                          04430000
ET0007              ,ASSET_PCT                                          04440000
ET0007              ,PSTN_CD                                            04450000
ET0007              ,ISO_CRNCY_CD                                       04460000
ET0007              ,ASSET_AMT                                          04470000
ET0007              ,CSH_MGN_SHRT_CD                                    04480000
ET0007              ,WHI_CD                                             04490000
ET0007              ,TRNFR_TYPE_RSN_CD                                  04500000
ET0007              ,NSCC_PEND_CD                                       04510000
ET0007              ,FAIL_SENT_CAGE_IND                                 04520000
ET0007              ,FAIL_OPEN_CAGE_IND                                 04530000
ET0007              ,SECURITY_ADP_NBR                                   04540000
ET0007              ,RCL_SENT_NSCC_IND                                  04550000
ET0007              ,FRV_SENT_NSCC_IND                                  04560000
ET0007              ,TRNFR_TYPE_CD                                      04570000
ET0007           FROM                                                   04580000
ET0007              VASSET                                              04590000
ET0007          WHERE                                                   04600000
ET0007              CLIENT_NBR = :SV-CLIENT-NBR                         04610000
ET0007              AND ACAT_CONTROL_NBR = :WS-ACAT-CNTRL               04620000
ET0007     END-EXEC.                                                    04630000
ET0007/                                                                 04640000
      *                                                                 04650000
01/12 **==========> DECLARE SUM1C_CSR CURSOR <===================       04660000
      *                                                                 04670000
            EXEC SQL                                                    04680000
                DECLARE SUM1C_CSR CURSOR FOR                            04690000
                   SELECT SUM(ASSET_AMT)                                04700000
                   FROM VASSET                                          04710000
                   WHERE (CLIENT_NBR = :SV-CLIENT-NBR)                  04720000
                     AND (ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR)         04730000
                     AND (ISIN_SEC_ISSUE_CD = '         ')              04740000
                     AND (STTLM_LCTN_CD = '40')                         04750000
                     AND (STTLM_RSN_CD = 'CRED')                        04760000
                     AND (CSH_MGN_SHRT_CD = 'C')                        04770000
01/12       END-EXEC.                                                   04780000
      *                                                                 04790000
01/12 **==========> DECLARE SUM1D_CSR CURSOR <===================       04800000
      *                                                                 04810000
            EXEC SQL                                                    04820000
                DECLARE SUM1D_CSR CURSOR FOR                            04830000
                   SELECT SUM(ASSET_AMT)                                04840000
                   FROM VASSET                                          04850000
                   WHERE (CLIENT_NBR = :SV-CLIENT-NBR)                  04860000
                     AND (ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR)         04870000
                     AND (ISIN_SEC_ISSUE_CD = '         ')              04880000
                     AND (STTLM_LCTN_CD = '40')                         04890000
                     AND (STTLM_RSN_CD = 'DEB ')                        04900000
                     AND (CSH_MGN_SHRT_CD = 'C')                        04910000
01/12       END-EXEC.                                                   04920000
      *                                                                 04930000
01/12 **==========> DECLARE SUM2C_CSR CURSOR <===================       04940000
      *                                                                 04950000
            EXEC SQL                                                    04960000
                DECLARE SUM2C_CSR CURSOR FOR                            04970000
                   SELECT SUM(ASSET_AMT)                                04980000
                   FROM VASSET                                          04990000
                   WHERE (CLIENT_NBR = :SV-CLIENT-NBR)                  05000000
                     AND (ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR)         05010000
                     AND (ISIN_SEC_ISSUE_CD = '         ')              05020000
                     AND (STTLM_LCTN_CD = '40')                         05030000
                     AND (STTLM_RSN_CD = 'CRED')                        05040000
                     AND (CSH_MGN_SHRT_CD = 'M')                        05050000
01/12       END-EXEC.                                                   05060000
      *                                                                 05070000
01/12 **==========> DECLARE SUM2D_CSR CURSOR <===================       05080000
      *                                                                 05090000
            EXEC SQL                                                    05100000
                DECLARE SUM2D_CSR CURSOR FOR                            05110000
                   SELECT SUM(ASSET_AMT)                                05120000
                   FROM VASSET                                          05130000
                   WHERE (CLIENT_NBR = :SV-CLIENT-NBR)                  05140000
                     AND (ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR)         05150000
                     AND (ISIN_SEC_ISSUE_CD = '         ')              05160000
                     AND (STTLM_LCTN_CD = '40')                         05170000
                     AND (STTLM_RSN_CD = 'DEB ')                        05180000
                     AND (CSH_MGN_SHRT_CD = 'M')                        05190000
01/12       END-EXEC.                                                   05200000
      *                                                                 05210000
      *                                                                 05220000
01/12 **==========> DECLARE SUM5C_CSR CURSOR <===================       05230000
      *                                                                 05240000
            EXEC SQL                                                    05250000
                 DECLARE SUM5C_CSR CURSOR FOR                           05260000
                   SELECT SUM(ASSET_AMT)                                05270000
                   FROM VASSET                                          05280000
                   WHERE (CLIENT_NBR = :SV-CLIENT-NBR)                  05290000
                     AND (ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR)         05300000
                     AND (ISIN_SEC_ISSUE_CD = '         ')              05310000
                     AND (STTLM_LCTN_CD = '40')                         05320000
                     AND (STTLM_RSN_CD = 'CRED')                        05330000
                     AND (CSH_MGN_SHRT_CD = 'S')                        05340000
            END-EXEC.                                                   05350000
      *                                                                 05360000
      *                                                                 05370000
01/12 **==========> DECLARE SUM5D_CSR CURSOR <===================       05380000
      *                                                                 05390000
            EXEC SQL                                                    05400000
                DECLARE SUM5D_CSR CURSOR FOR                            05410000
                   SELECT SUM(ASSET_AMT)                                05420000
                   FROM VASSET                                          05430000
                   WHERE (CLIENT_NBR = :SV-CLIENT-NBR)                  05440000
                     AND (ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR)         05450000
                     AND (ISIN_SEC_ISSUE_CD = '         ')              05460000
                     AND (STTLM_LCTN_CD = '40')                         05470000
                     AND (STTLM_RSN_CD = 'DEB ')                        05480000
                     AND (CSH_MGN_SHRT_CD = 'S')                        05490000
01/12       END-EXEC.                                                   05500000
      *                                                                 05510000
      **********************************************************        05520000
      *****      L I N K A G E  S E C T I O N              *****        05530000
      **********************************************************        05540000
       LINKAGE SECTION.                                                 05550000
                                                                        05560000
       01  DFHCOMMAREA.                                                 05570000
      *01  ACAT05IO-COMM-AREA.                                          05580000
           COPY ACAT05IO.                                               05590000
      ************************ BOTTOM OF DATA **************************05600000
      /                                                                 05610000
      **********************************************************        05620000
      *****   P R O C E D U R E   D I V I S I O N           *****       05630000
      **********************************************************        05640000
       PROCEDURE DIVISION.                                              05650000
                                                                        05660000
           MOVE EIBCALEN TO WS-EIBCALEN.                                05670000
                                                                        05680000
           IF WS-EIBCALEN > +0                                          05690000
              PERFORM 0000-MAIN-RTN                                     05700000
           ELSE                                                         05710000
              EXEC CICS RETURN END-EXEC                                 05720000
           END-IF.                                                      05730000
                                                                        05740000
      *                                                                 05750000
       0000-MAIN-RTN.                                                   05760000
      *                                                                 05770000
      **** NOT COME IN FROM SEARCH BAR ================>                05780000
           MOVE ACAT05IO-SAVE-KEYS    TO  WS-SAVE-KEY.                  05790000
ET0008     MOVE ACAT05IO-ACAT-SIGN-ON-ID  TO WS-ACAT-SIGN-ON-ID.        05800000
                                                                        05810000
           IF ACAT05IO-FIRST-TIME                                       05820000
092600          EXEC SQL                                                05830000
092700            SELECT COUNT(*)                                       05840000
                      INTO : WS-COUNT                                   05850000
092900                FROM VTRNFR                                       05860000
093000            WHERE (CLIENT_NBR  = :SV-CLIENT-NBR)                  05870000
                  AND (TRNFR_TYPE_CD IN                                 05880000
LRM017               ('RCR','FRV','PTD','PTR','PTF','CRD','RCL','MFC')) 05890000
ET0002**          AND (STTS_CD IN ('200', '210', '220', '230'))         05900000
ET0002            AND (STTS_CD IN ('200', '210', '220', '230','500'))   05910000
                  AND (DSTBN_SIDE_CD = 'R')                             05920000
                END-EXEC                                                05930000
                                                                        05940000
                IF WS-COUNT = +0                                        05950000
                   SET ACAT05IO-VTRNFR-NOT-FOUND TO TRUE                05960000
                   MOVE 'NO TRANSFER FOR THIS CLIENT (ACAT05DA)'        05970000
                         TO ACAT05IO-RETURN-MSG                         05980000
                   EXEC CICS RETURN END-EXEC                            05990000
                ELSE                                                    06000000
                   SET ACAT05IO-VTRNFR-FOUND TO TRUE                    06010000
                   MOVE WS-COUNT TO ACAT05IO-VTRNFR-COUNT               06020000
                END-IF                                                  06030000
           END-IF.                                                      06040000
                                                                        06050000
           MOVE SPACE                 TO  WS-FIRST-TIME-SW.             06060000
           MOVE ACAT05IO-SAVE-KEYS    TO  WS-SAVE-KEY.                  06070000
           MOVE SPACE                 TO  ACAT05IO-MFC-FRV-DUPE-IND.    06080000
      *                                                                 06090000
           IF ACAT05IO-ISRT-VINITRNF                                    06100000
              PERFORM 0700-ISRT-VINITRNF                                06110000
           ELSE                                                         06120000
             IF ACAT05IO-DLTE-VINITRNF                                  06130000
                PERFORM 0800-DLTE-VINITRNF                              06140000
             ELSE                                                       06150000
                 IF ACAT05IO-UPDT-VTRNFR                                06160000
                    PERFORM 0900-UPDT-VTRNFR                            06170000
                 ELSE                                                   06180000
                    IF ACAT05IO-SRCH-VTRNFR                             06190000
                       IF SV-ACAT-CNTL-NBR = LOW-VALUES OR SPACES       06200000
                          SET ACAT05IO-SRCH-VTRNFR-FWD TO TRUE          06210000
                       END-IF                                           06220000
ET0004              ELSE                                                06230000
ET0004                 IF ACAT05IO-UPDATE-VASSET                        06240000
ET0004                    PERFORM 1000-UPDT-VASSET                      06250000
ET0009                 ELSE                                             06260000
ET0009                    IF ACAT05IO-SRCH-FRZN-ASSET                   06270000
ET0009                       PERFORM 1100-SRCH-FRZN-ASSET               06280000
ET0009                    ELSE                                          06290000
ET0009                       IF ACAT05IO-UPDT-FRZN-IND                  06300000
ET0009                          PERFORM 0940-UPDATE-ACCT-FRZN-IND       06310000
ET0009                       END-IF                                     06320000
ET0009                    END-IF                                        06330000
ET0004                 END-IF                                           06340000
                    END-IF                                              06350000
                 END-IF                                                 06360000
             END-IF                                                     06370000
           END-IF.                                                      06380000
      *                                                                 06390000
           IF ACAT05IO-SRCH-VTRNFR                                      06400000
              IF ACAT05IO-SRCH-VTRNFR-FWD                               06410000
                   PERFORM 0100-FETCH-VTRNFR-FWD                        06420000
              ELSE                                                      06430000
                  IF ACAT05IO-SRCH-VTRNFR-BWD                           06440000
                     PERFORM 0200-FETCH-VTRNFR-BWD                      06450000
                  ELSE                                                  06460000
                     IF ACAT05IO-SRCH-VTRNFR-PND                        06470000
                        PERFORM 0670-RETRIEVE-FOR-PENDING               06480000
                     END-IF                                             06490000
                  END-IF                                                06500000
              END-IF                                                    06510000
           END-IF.                                                      06520000
                                                                        06530000
           IF ACAT05IO-VINITRNF-INSERTED                                06540000
              IF ACAT05IO-M5REJ = 'S'                                   06550000
                 MOVE 'NEW REJECTED TRANSFER IS CREATED'                06560000
                 TO WS-RETURN-MSG                                       06570000
              ELSE                                                      06580000
                 IF ACAT05IO-M5REJC = 'S'                               06590000
                    MOVE 'NEW REJECTED/COMMENTS TRANSFER IS CREATED'    06600000
                    TO WS-RETURN-MSG                                    06610000
ET0001           ELSE                                                   06620000
ET0001              IF ACAT05IO-M5ACCEL = 'S'                           06630000
ET0001                 MOVE 'TRANSFER ACCELERATED'                      06640000
ET0001                   TO  WS-RETURN-MSG                              06650000
ET0001              END-IF                                              06660000
                 END-IF                                                 06670000
              END-IF                                                    06680000
           END-IF.                                                      06690000
                                                                        06700000
ET0001**   IF ACAT05IO-VINITRNF-DELETED                                 06710000
ET0001**      IF ACAT05IO-M5REJ = ' '                                   06720000
ET0001**         MOVE 'THIS TIF WILL NOT BE REJECTED '                  06730000
ET0001**         TO WS-RETURN-MSG                                       06740000
ET0001**      ELSE                                                      06750000
ET0001**         IF ACAT05IO-M5REJC = ' '                               06760000
ET0001**            MOVE 'THIS TIF W/CMNTS WILL NOT BE REJECTED '       06770000
ET0001**            TO WS-RETURN-MSG                                    06780000
ET0001**         END-IF                                                 06790000
ET0001**      END-IF                                                    06800000
ET0001**   END-IF.                                                      06810000
                                                                        06820000
           IF ACAT05IO-SRCH-VTRNFR    AND                               06830000
              ACAT05IO-VTRNFR-FOUND                                     06840000
              MOVE WS-SAVE-KEY TO ACAT05IO-SAVE-KEYS                    06850000
              PERFORM 0500-MOVE-DATA                                    06860000
           ELSE                                                         06870000
              MOVE WS-RETURN-MSG  TO ACAT05IO-RETURN-MSG                06880000
           END-IF.                                                      06890000
                                                                        06900000
           EXEC CICS RETURN END-EXEC.                                   06910000
      /                                                                 06920000
       0050-SETUP-SRCH-KEYS.                                            06930000
      *                                                                 06940000
11/09 **** SET UP KEYS FOR SEARCH ENGINE =============>                 06950000
BEG==>     IF ACAT05IO-MBR = SPACE OR LOW-VALUE                         06960000
              IF ACAT05IO-SV-BRANCH-CD = SPACE OR LOW-VALUE             06970000
                 MOVE ALL '%' TO SV-BRANCH-CD, SV-ACCT-CD               06980000
              ELSE                                                      06990000
                 CONTINUE                                               07000000
              END-IF                                                    07010000
           END-IF.                                                      07020000
                                                                        07030000
           IF ACAT05IO-MAC = SPACE OR LOW-VALUE                         07040000
              IF ACAT05IO-SV-ACCT-CD = SPACE OR LOW-VALUE               07050000
                 MOVE ALL '%' TO SV-ACCT-CD                             07060000
              END-IF                                                    07070000
           END-IF.                                                      07080000
                                                                        07090000
           IF ACAT05IO-MRR  = SPACE OR LOW-VALUE                        07100000
              MOVE ALL '%' TO SV-RR-CD                                  07110000
           ELSE                                                         07120000
              MOVE ACAT05IO-MRR TO SV-RR-CD                             07130000
           END-IF.                                                      07140000
                                                                        07150000
           IF ACAT05IO-MCBRKR = SPACE OR LOW-VALUE                      07160000
              MOVE ALL '%' TO SV-BRKR                                   07170000
           ELSE                                                         07180000
              MOVE ACAT05IO-MCBRKR  TO  SV-BRKR                         07190000
           END-IF.                                                      07200000
                                                                        07210000
           IF ACAT05IO-MTFR  = SPACE OR LOW-VALUE                       07220000
              MOVE ALL '%' TO SV-TFR                                    07230000
           ELSE                                                         07240000
              MOVE ACAT05IO-MTFR TO SV-TFR                              07250000
           END-IF.                                                      07260000
                                                                        07270000
           IF ACAT05IO-MSTAT  = SPACE OR LOW-VALUE                      07280000
              MOVE ALL '%' TO SV-STCD                                   07290000
           ELSE                                                         07300000
              EVALUATE ACAT05IO-MSTAT                                   07310000
                 WHEN 'REQ'     MOVE  '100' TO SV-STCD                  07320000
                 WHEN 'RQA'     MOVE  '110' TO SV-STCD                  07330000
                 WHEN 'RQP'     MOVE  '130' TO SV-STCD                  07340000
                 WHEN 'RQR'     MOVE  '140' TO SV-STCD                  07350000
                 WHEN 'REV'     MOVE  '200' TO SV-STCD                  07360000
                 WHEN 'RVA'     MOVE  '210' TO SV-STCD                  07370000
                 WHEN 'RVE'     MOVE  '220' TO SV-STCD                  07380000
                 WHEN 'RVX'     MOVE  '230' TO SV-STCD                  07390000
                 WHEN 'STP'     MOVE  '300' TO SV-STCD                  07400000
                 WHEN 'STC'     MOVE  '310' TO SV-STCD                  07410000
                 WHEN 'CLP'     MOVE  '400' TO SV-STCD                  07420000
                 WHEN 'PUR'     MOVE  '500' TO SV-STCD                  07430000
                 WHEN 'MPP'     MOVE  '510' TO SV-STCD                  07440000
                 WHEN 'REJ'     MOVE  '600' TO SV-STCD                  07450000
              END-EVALUATE                                              07460000
           END-IF.                                                      07470000
                                                                        07480000
           IF ACAT05IO-SV-ACAT-CNTL-NBR = SPACE OR LOW-VALUE            07490000
              MOVE ALL '%'  TO SV-ACAT-CNTL-NBR                         07500000
           END-IF.                                                      07510000
END=>*****                                                              07520000
       0050-EXIT.                                                       07530000
           EXIT.                                                        07540000
      /                                                                 07550000
       0100-FETCH-VTRNFR-FWD.                                           07560000
      *----------------------------------------------------------------*07570000
      *       FORWARD FETCH ROWS  FROM VTRNFR (ACAT_TRNFR) TABLE       *07580000
      *----------------------------------------------------------------*07590000
                                                                        07600000
           PERFORM 0050-SETUP-SRCH-KEYS THRU 0050-EXIT.                 07610000
                                                                        07620000
           EXEC SQL                                                     07630000
               OPEN FWD_CSR                                             07640000
           END-EXEC.                                                    07650000
                                                                        07660000
           MOVE SPACE TO WS-EXIT-LOOP-SW.                               07670000
           PERFORM UNTIL WS-EXIT-LOOP                                   07680000
              PERFORM 0110-FETCH-VTRNFR-FWD-CSR                         07690000
              IF WS-TRANSFER-FOUND                                      07700000
                 PERFORM 0170-BR-AE-SECURITY                            07710000
                 IF SRCH-SIGNON-SECR-CHECK-PASS                         07720000
                    SET WS-EXIT-LOOP TO TRUE                            07730000
                    SET ACAT05IO-VTRNFR-FOUND TO TRUE                   07740000
                    MOVE WS-CLIENT-NBR       TO SV-CLIENT-NBR           07750000
                    MOVE WS-ACAT-CONTROL-NBR TO SV-ACAT-CNTL-NBR        07760000
                    IF WS-VTRNFR-CMNT > SPACES                          07770000
                       MOVE 'Y'               TO WS-ACCT-COMMENTS-IND   07780000
                    ELSE                                                07790000
                       MOVE SPACE             TO WS-ACCT-COMMENTS-IND   07800000
                    END-IF                                              07810000
ET0007              IF  (WS-TFR-TYPE = 'MFC' OR 'FRV')                  07820000
ET0007              AND (WS-STTS-CD = '200' OR '300' OR '310')          07830000
ET0007                 PERFORM 1500-TRNFR-MFC-FRV-DUPE-CHECK            07840000
ET0007                    THRU 1500-EXIT                                07850000
ET0007              END-IF                                              07860000
                    PERFORM 0300-SEARCH-VINITRNF                        07870000
                 END-IF                                                 07880000
              ELSE                                                      07890000
              IF WS-TRANSFER-NOT-FOUND                                  07900000
                 SET WS-EXIT-LOOP TO TRUE                               07910000
                 IF ACAT05IO-CLIENT-NBR > SPACES                        07920000
                    SET ACAT05IO-VTRNFR-LAST TO TRUE                    07930000
                    MOVE 'NO MORE TIF UNDER THIS SELECTION'             07940000
                      TO  WS-RETURN-MSG                                 07950000
                 ELSE                                                   07960000
                    SET ACAT05IO-VTRNFR-NOT-FOUND TO TRUE               07970000
                    MOVE 'NO TIF UNDER THIS SELECTION'                  07980000
                      TO  WS-RETURN-MSG                                 07990000
                 END-IF                                                 08000000
              ELSE                                                      08010000
              IF WS-TRANSFER-FOUND-ERR                                  08020000
                 SET WS-EXIT-LOOP TO TRUE                               08030000
                 SET ACAT05IO-VTRNFR-NOT-FOUND TO TRUE                  08040000
                 PERFORM 9000-WRITE-TO-CICS-LOG                         08050000
                 PERFORM 9500-RETURN-DB2-ERROR                          08060000
              END-IF END-IF END-IF                                      08070000
           END-PERFORM.                                                 08080000
                                                                        08090000
           EXEC SQL                                                     08100000
               CLOSE FWD_CSR                                            08110000
           END-EXEC.                                                    08120000
                                                                        08130000
           IF ACAT05IO-VTRNFR-FOUND                                     08140000
              PERFORM 0600-SRCH-ASSET                                   08150000
              MOVE SPACE TO ACAT05IO-FIRST-TIME-SW                      08160000
           END-IF.                                                      08170000
094300*                                                                 08180000
094400 0100-EXIT.                                                       08190000
094500     EXIT.                                                        08200000
092500/                                                                 08210000
       0110-FETCH-VTRNFR-FWD-CSR.                                       08220000
           EXEC SQL                                                     08230000
                FETCH  FWD_CSR                                          08240000
                 INTO                                                   08250000
                       :WS-CLIENT-NBR                                   08260000
                      ,:WS-BRANCH-CD                                    08270000
                      ,:WS-ACCT-CD                                      08280000
                      ,:WS-RR-CD                                        08290000
                      ,:WS-ACAT-CONTROL-NBR                             08300000
                      ,:WS-TFR-TYPE                                     08310000
                      ,:WS-STTS-CD                                      08320000
                      ,:WS-DAYS                                         08330000
                      ,:WS-RCV-NBR                                      08340000
                      ,:WS-DLVR-NBR                                     08350000
                      ,:WS-ACCT-DLVR-NBR                                08360000
                      ,:WS-ACCT-RCV-NBR                                 08370000
                      ,:WS-RCV-CUST-NM                                  08380000
                      ,:WS-RCV-SS-PRIM-NBR                              08390000
                      ,:WS-RCV-SS-SCNDY-NBR                             08400000
                      ,:WS-RCV-ACCT-TYPE-CD                             08410000
                      ,:WS-STTLM-DT                                     08420000
                      ,:WS-VTRNFR-CMNT                                  08430000
                      ,:WS-DSTBN-SIDE-CD                                08440000
                      ,:WS-VTRNFR-NSCC-PEND-CD                          08450000
                      ,:WS-ACCT-ACTIVITY-IND                            08460000
                      ,:WS-ACCT-ORDERS-IND                              08470000
                      ,:WS-ACCT-RJCT-RSBM-IND                           08480000
                      ,:WS-ACCT-DB-BAL-T1-IND                           08490000
                      ,:WS-ACCT-MRGN-DB-IND                             08500000
                      ,:WS-ACCT-SHRT-PSTN-IND                           08510000
                      ,:WS-ACCT-SEC-RSTRD-IND                           08520000
                      ,:WS-ACCT-AST-EXCS-IND                            08530000
                      ,:WS-ACCT-OPTN-PSTN-IND                           08540000
                      ,:WS-ACCT-LTD-PRTNR-IND                           08550000
                      ,:WS-ACCT-TIN-MSMTH-IND                           08560000
                      ,:WS-ACCT-DPLCT-TRN-IND                           08570000
                      ,:WS-ACCT-CUST-70-IND                             08580000
                      ,:WS-ACCT-QULFD-PLN-IND                           08590000
                      ,:WS-ACCT-MNGD-IND                                08600000
                      ,:WS-ACCT-PRVT-RNG-IND                            08610000
                      ,:WS-ACCT-BRKR-TIF-IND                            08620000
                      ,:WS-NSCC-NON-ADP-IND                             08630000
                      ,:WS-ALERT-IND                                    08640000
ET0007                ,:WS-ACAT-CNTL-ASTD-NBR                           08650000
ET0007                ,:WS-FRV-MFC-CMPLT-IND                            08660000
ET0009                ,:WS-ACCT-FRZN-IND                                08670000
LRM012                ,:WS-STTLM-TM-CD                                  08680000
LRM013                ,:WS-GIFT-IND                                     08690000
DJ0001                ,:WS-AUCTION-RATE-IND                             08691000
LRM018                ,:WS-SUB-PENNY-PRICE-IND                          08692000
            END-EXEC.                                                   08700000
      *                                                                 08710000
            MOVE SPACE TO WS-TRANSFER-FOUND-SW.                         08720000
            IF SQLCODE = +0                                             08730000
               SET WS-TRANSFER-FOUND TO TRUE                            08740000
            ELSE                                                        08750000
            IF SQLCODE = +100                                           08760000
               SET WS-TRANSFER-NOT-FOUND TO TRUE                        08770000
            ELSE                                                        08780000
               SET WS-TRANSFER-FOUND-ERR TO TRUE.                       08790000
       EJECT                                                            08800000
      *                                                                 08810000
       0170-BR-AE-SECURITY.                                             08820000
           INITIALIZE ACAT-SRCH-COMM-AREA.                              08830000
           SET SECURITY-LOOKUP TO TRUE.                                 08840000
           MOVE WS-BRANCH-CD   TO SRCH-INP-BRANCH.                      08850000
           MOVE WS-RR-CD       TO SRCH-INP-RR.                          08860000
           EXEC CICS LINK                                               08870000
                     PROGRAM('ACATSRCH')                                08880000
                     COMMAREA(ACAT-SRCH-COMM-AREA)                      08890000
                     LENGTH(LENGTH OF ACAT-SRCH-COMM-AREA)              08900000
           END-EXEC.                                                    08910000
       EJECT                                                            08920000
                                                                        08930000
       0200-FETCH-VTRNFR-BWD.                                           08940000
      *----------------------------------------------------------------*08950000
      *   BACKWARD FETCH ROWS FROM VTRNFR (ACAT_TRNFR) TABLE           *08960000
      *----------------------------------------------------------------*08970000
                                                                        08980000
           PERFORM 0050-SETUP-SRCH-KEYS THRU 0050-EXIT.                 08990000
                                                                        09000000
           EXEC SQL                                                     09010000
               OPEN BWD_CSR                                             09020000
           END-EXEC.                                                    09030000
                                                                        09040000
           MOVE SPACE TO WS-EXIT-LOOP-SW.                               09050000
           PERFORM UNTIL WS-EXIT-LOOP                                   09060000
              PERFORM 0210-FETCH-VTRNFR-BWD-CSR                         09070000
              IF WS-TRANSFER-FOUND                                      09080000
                 PERFORM 0170-BR-AE-SECURITY                            09090000
                 IF SRCH-SIGNON-SECR-CHECK-PASS                         09100000
                    SET WS-EXIT-LOOP TO TRUE                            09110000
                    SET ACAT05IO-VTRNFR-FOUND TO TRUE                   09120000
                    MOVE WS-CLIENT-NBR        TO SV-CLIENT-NBR          09130000
                    MOVE WS-ACAT-CONTROL-NBR  TO SV-ACAT-CNTL-NBR       09140000
                    IF WS-VTRNFR-CMNT > SPACES                          09150000
                       MOVE 'Y'               TO WS-ACCT-COMMENTS-IND   09160000
                    ELSE                                                09170000
                       MOVE SPACE             TO WS-ACCT-COMMENTS-IND   09180000
                    END-IF                                              09190000
ET0007              IF  (WS-TFR-TYPE = 'MFC' OR 'FRV')                  09200000
ET0007              AND (WS-STTS-CD = '200' OR '300' OR '310')          09210000
ET0007                 PERFORM 1500-TRNFR-MFC-FRV-DUPE-CHECK            09220000
ET0007                    THRU 1500-EXIT                                09230000
ET0007              END-IF                                              09240000
                    PERFORM 0300-SEARCH-VINITRNF                        09250000
                 END-IF                                                 09260000
              ELSE                                                      09270000
              IF WS-TRANSFER-NOT-FOUND                                  09280000
                 SET WS-EXIT-LOOP TO TRUE                               09290000
                 SET VTRNFR-NOT-FOUND TO TRUE                           09300000
                 IF ACAT05IO-CLIENT-NBR > SPACES                        09310000
                    SET ACAT05IO-VTRNFR-FIRST TO TRUE                   09320000
                    MOVE 'FIRST TIF UNDER THIS SELECTION'               09330000
                      TO  WS-RETURN-MSG                                 09340000
                 ELSE                                                   09350000
                    SET ACAT05IO-VTRNFR-NOT-FOUND TO TRUE               09360000
                    MOVE 'NO TIF UNDER THIS SELECTION'                  09370000
                      TO  WS-RETURN-MSG                                 09380000
                 END-IF                                                 09390000
              ELSE                                                      09400000
              IF WS-TRANSFER-FOUND-ERR                                  09410000
                 SET WS-EXIT-LOOP TO TRUE                               09420000
                 SET VTRNFR-NOT-FOUND TO TRUE                           09430000
                 SET ACAT05IO-VTRNFR-NOT-FOUND TO TRUE                  09440000
                 PERFORM 9000-WRITE-TO-CICS-LOG                         09450000
                 PERFORM 9500-RETURN-DB2-ERROR                          09460000
              END-IF END-IF END-IF                                      09470000
           END-PERFORM.                                                 09480000
                                                                        09490000
           EXEC SQL                                                     09500000
               CLOSE BWD_CSR                                            09510000
           END-EXEC.                                                    09520000
                                                                        09530000
           IF ACAT05IO-VTRNFR-FOUND                                     09540000
              PERFORM 0600-SRCH-ASSET                                   09550000
              MOVE SPACE TO ACAT05IO-FIRST-TIME-SW                      09560000
           END-IF.                                                      09570000
094300*                                                                 09580000
094400 0200-EXIT.                                                       09590000
094500     EXIT.                                                        09600000
092500/                                                                 09610000
      *                                                                 09620000
       0210-FETCH-VTRNFR-BWD-CSR.                                       09630000
            EXEC SQL                                                    09640000
                 FETCH  BWD_CSR                                         09650000
                  INTO                                                  09660000
                       :WS-CLIENT-NBR                                   09670000
                      ,:WS-BRANCH-CD                                    09680000
                      ,:WS-ACCT-CD                                      09690000
                      ,:WS-RR-CD                                        09700000
                      ,:WS-ACAT-CONTROL-NBR                             09710000
                      ,:WS-TFR-TYPE                                     09720000
                      ,:WS-STTS-CD                                      09730000
                      ,:WS-DAYS                                         09740000
                      ,:WS-RCV-NBR                                      09750000
                      ,:WS-DLVR-NBR                                     09760000
                      ,:WS-ACCT-DLVR-NBR                                09770000
                      ,:WS-ACCT-RCV-NBR                                 09780000
                      ,:WS-RCV-CUST-NM                                  09790000
                      ,:WS-RCV-SS-PRIM-NBR                              09800000
                      ,:WS-RCV-SS-SCNDY-NBR                             09810000
                      ,:WS-RCV-ACCT-TYPE-CD                             09820000
                      ,:WS-STTLM-DT                                     09830000
                      ,:WS-VTRNFR-CMNT                                  09840000
                      ,:WS-DSTBN-SIDE-CD                                09850000
                      ,:WS-VTRNFR-NSCC-PEND-CD                          09860000
                      ,:WS-ACCT-ACTIVITY-IND                            09870000
                      ,:WS-ACCT-ORDERS-IND                              09880000
                      ,:WS-ACCT-RJCT-RSBM-IND                           09890000
                      ,:WS-ACCT-DB-BAL-T1-IND                           09900000
                      ,:WS-ACCT-MRGN-DB-IND                             09910000
                      ,:WS-ACCT-SHRT-PSTN-IND                           09920000
                      ,:WS-ACCT-SEC-RSTRD-IND                           09930000
                      ,:WS-ACCT-AST-EXCS-IND                            09940000
                      ,:WS-ACCT-OPTN-PSTN-IND                           09950000
                      ,:WS-ACCT-LTD-PRTNR-IND                           09960000
                      ,:WS-ACCT-TIN-MSMTH-IND                           09970000
                      ,:WS-ACCT-DPLCT-TRN-IND                           09980000
                      ,:WS-ACCT-CUST-70-IND                             09990000
                      ,:WS-ACCT-QULFD-PLN-IND                           10000000
                      ,:WS-ACCT-MNGD-IND                                10010000
                      ,:WS-ACCT-PRVT-RNG-IND                            10020000
                      ,:WS-ACCT-BRKR-TIF-IND                            10030000
                      ,:WS-NSCC-NON-ADP-IND                             10040000
                      ,:WS-ALERT-IND                                    10050000
ET0007                ,:WS-ACAT-CNTL-ASTD-NBR                           10060000
ET0007                ,:WS-FRV-MFC-CMPLT-IND                            10070000
ET0009                ,:WS-ACCT-FRZN-IND                                10080000
LRM012                ,:WS-STTLM-TM-CD                                  10090000
LRM013                ,:WS-GIFT-IND                                     10100000
DJ0001                ,:WS-AUCTION-RATE-IND                             10101000
LRM018                ,:WS-SUB-PENNY-PRICE-IND                          10102000
            END-EXEC.                                                   10110000
            MOVE SPACE TO WS-TRANSFER-FOUND-SW.                         10120000
            IF SQLCODE = +0                                             10130000
               SET WS-TRANSFER-FOUND TO TRUE                            10140000
            ELSE                                                        10150000
            IF SQLCODE = +100                                           10160000
               SET WS-TRANSFER-NOT-FOUND TO TRUE                        10170000
            ELSE                                                        10180000
               SET WS-TRANSFER-FOUND-ERR TO TRUE.                       10190000
       EJECT                                                            10200000
092500 0300-SEARCH-VINITRNF.                                            10210000
      *----------------------------------------------------------------*10220000
      *   CHECK VINITRNF TO SEE IF THE TFR HAS ALREADY BEEN REJECTED   *10230000
      *   BEFORE THE NEXT BATCH CYCLE                                  *10240000
      *----------------------------------------------------------------*10250000
092600      EXEC SQL                                                    10260000
092700          SELECT TRANS_TYPE_CD                                    10270000
                      , NSCC_PEND_CD                                    10280000
10/31                 , CMNT_TXT                                        10290000
092700          INTO  :WS-INIT-TRANS-TYPE-CD                            10300000
                     ,:WS-VINITRNF-NSCC-PEND-CD                         10310000
                     ,:WS-VINITRNF-CMNT                                 10320000
ET0003          FROM ACTITRF                                            10330000
                WHERE (CLIENT_NBR = :SV-CLIENT-NBR)                     10340000
ET0006**          AND (TRNFR_TYPE_CD IN                                 10350000
ET0006**                    ('RCR','FRV','PTR','CRD','RCL','MFC'))      10360000
ET0006            AND (TRNFR_TYPE_CD IN                                 10370000
LRM017              ('RCR','FRV','PTR','PTF','CRD','RCL','MFC','PTD'))  10380000
                  AND (RCV_NBR = :WS-RCV-NBR)                           10390000
                  AND (DLVR_NBR = :WS-DLVR-NBR)                         10400000
                  AND (ACCT_RCV_NBR = :WS-ACCT-RCV-NBR)                 10410000
                  AND (ACCT_DLVR_NBR = :WS-ACCT-DLVR-NBR)               10420000
ET0003            AND (ACAT_CONTROL_NBR = :WS-ACAT-CONTROL-NBR)         10430000
            END-EXEC.                                                   10440000
093300*                                                                 10450000
093400      EVALUATE SQLCODE                                            10460000
093500          WHEN +0                                                 10470000
                     SET VINITRNF-FOUND TO TRUE                         10480000
                     SET ACAT05IO-VINITRNF-FOUND TO TRUE                10490000
                     PERFORM 0400-CHECK-TRANS-TYPE                      10500000
093800          WHEN +100                                               10510000
                     SET VINITRNF-NOT-FOUND TO TRUE                     10520000
                     SET ACAT05IO-VINITRNF-NOT-FOUND TO TRUE            10530000
094000          WHEN OTHER                                              10540000
                     SET VINITRNF-NOT-FOUND TO TRUE                     10550000
                     SET ACAT05IO-VINITRNF-NOT-FOUND TO TRUE            10560000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     10570000
                     PERFORM 9500-RETURN-DB2-ERROR                      10580000
094200      END-EVALUATE.                                               10590000
094300*                                                                 10600000
094400 0300-EXIT.                                                       10610000
094500     EXIT.                                                        10620000
      /                                                                 10630000
       0400-CHECK-TRANS-TYPE.                                           10640000
092700      IF WS-INIT-TRANS-TYPE-CD = 'R'                              10650000
               MOVE 'THIS TRANSFER HAS BEEN REJECTED' TO                10660000
                    WS-RETURN-MSG                                       10670000
            END-IF.                                                     10680000
                                                                        10690000
092700      IF WS-VINITRNF-NSCC-PEND-CD = 'Y'                           10700000
               MOVE 'NSCC ACKNOWLEDGEMENT PENDING, DO NOT UPDATE'       10710000
                TO  WS-RETURN-MSG                                       10720000
            END-IF.                                                     10730000
                                                                        10740000
10/31       IF WS-VINITRNF-CMNT > SPACE                                 10750000
               MOVE WS-VINITRNF-CMNT TO ACAT05IO-VINITRNF-CMNT          10760000
            END-IF.                                                     10770000
                                                                        10780000
094400 0400-EXIT.                                                       10790000
094500     EXIT.                                                        10800000
      /                                                                 10810000
       0500-MOVE-DATA.                                                  10820000
           INITIALIZE ACAT05IO-DA, ACAT05IO-DC.                         10830000
           MOVE LOW-VALUES TO ACAT05IO-TS-EXCEPTIONS.                   10840000
      *                                                                 10850000
           MOVE WS-CLIENT-NBR         TO  ACAT05IO-CLIENT-NBR.          10860000
           MOVE WS-ACAT-CONTROL-NBR   TO  ACAT05IO-ACAT-CONTROL-NBR.    10870000
           MOVE WS-BRANCH-CD          TO  ACAT05IO-BRANCH-CD.           10880000
           MOVE WS-RR-CD              TO  ACAT05IO-RR-CD.               10890000
           MOVE WS-ACCT-CD            TO  ACAT05IO-ACCT-CD.             10900000
           MOVE WS-TFR-TYPE           TO  ACAT05IO-TFR-TYPE.            10910000
           MOVE WS-STTS-CD            TO  ACAT05IO-STTS-CD.             10920000
01/12      MOVE WS-DAYS               TO  ACAT05IO-DAYS.                10930000
           MOVE WS-RCV-NBR            TO  ACAT05IO-RCV-NBR.             10940000
           MOVE WS-DLVR-NBR           TO  ACAT05IO-DLVR-NBR.            10950000
           MOVE WS-ACCT-DLVR-NBR      TO  ACAT05IO-ACCT-DLVR-NBR.       10960000
           MOVE WS-ACCT-RCV-NBR       TO  ACAT05IO-ACCT-RCV-NBR.        10970000
           MOVE WS-RCV-CUST-NM        TO  ACAT05IO-RCV-CUST-NM.         10980000
           MOVE WS-RCV-SS-PRIM-NBR    TO  ACAT05IO-RCV-SS-PRIM-NBR.     10990000
           MOVE WS-RCV-SS-SCNDY-NBR   TO ACAT05IO-RCV-SS-SCNDY-NBR.     11000000
ET0002     MOVE WS-VTRNFR-CMNT        TO ACAT05IO-VTRNFR-CMNT.          11010000
           MOVE WS-RCV-ACCT-TYPE-CD   TO ACAT05IO-RCV-ACCT-TYPE-CD.     11020000
           MOVE WS-INIT-TRANS-TYPE-CD TO ACAT05IO-INIT-TRANS-TYPE-CD.   11030000
           MOVE WS-VINITRNF-NSCC-PEND-CD TO                             11040000
                                   ACAT05IO-VINITRNF-NSCC-PEND-CD.      11050000
           MOVE WS-VTRNFR-NSCC-PEND-CD TO                               11060000
                                   ACAT05IO-VTRNFR-NSCC-PEND-CD.        11070000
           MOVE WS-STTLM-DT           TO  ACAT05IO-STTLM-DT.            11080000
           MOVE WS-ALERT-IND          TO  ACAT05IO-ALERT-IND.           11090000
           MOVE WS-RSCD01             TO  ACAT05IO-RSCD01               11100000
           MOVE WS-RSCD02             TO  ACAT05IO-RSCD02               11110000
           MOVE WS-RSCD05             TO  ACAT05IO-RSCD05               11120000
01/12      MOVE SV-BAL01              TO  ACAT05IO-BAL01.               11130000
LRM019     IF SV-BAL01 = ZERO                                           11131000
LRM019        EXEC SQL                                                  11131100
LRM019           SELECT STTLM_RSN_CD                                    11131200
LRM019               INTO  :DCLVASSET.STTLM-RSN-CD                      11131300
LRM019             FROM VASSET                                          11131400
LRM019             WHERE (CLIENT_NBR = :SV-CLIENT-NBR)                  11131500
LRM019               AND (ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR)         11131600
LRM019               AND ASSET_RQST_QTY_CD = 'F'                        11131700
LRM019               AND (STTLM_LCTN_CD = '40')                         11131800
LRM019               AND (CSH_MGN_SHRT_CD = 'C')                        11131900
LRM019        END-EXEC                                                  11132000
LRM019        EVALUATE SQLCODE                                          11132100
LRM019           WHEN +0                                                11132200
LRM019           WHEN -811                                              11132300
LRM019               MOVE 'F'    TO ACAT05IO-BAL01-FULL-RQST            11132400
LRM019               IF STTLM-RSN-CD OF DCLVASSET = 'CRED'              11132500
LRM019                  MOVE 'C' TO ACAT05IO-BAL01-FULL-DB-CR           11132600
LRM019               ELSE                                               11132700
LRM019                  MOVE 'D' TO ACAT05IO-BAL01-FULL-DB-CR           11132800
LRM019               END-IF                                             11132900
LRM019           WHEN +100                                              11133000
LRM019               MOVE ' '    TO ACAT05IO-BAL01-FULL-RQST            11133100
LRM019                              ACAT05IO-BAL01-FULL-DB-CR           11133200
LRM019           WHEN OTHER                                             11133300
LRM019              MOVE 'ERROR IN TOTAL OF CASH BALANCE (ACAT05DC)'    11133400
LRM019              TO  WS-RETURN-MSG                                   11133500
LRM019               PERFORM 9000-WRITE-TO-CICS-LOG                     11133600
LRM019               PERFORM 9500-RETURN-DB2-ERROR                      11133700
LRM019        END-EVALUATE                                              11133800
LRM019     END-IF.                                                      11133900
01/12      MOVE SV-BAL02              TO  ACAT05IO-BAL02.               11140000
LRM019     IF SV-BAL02 = ZERO                                           11141000
LRM019        EXEC SQL                                                  11142000
LRM019           SELECT STTLM_RSN_CD                                    11143000
LRM019               INTO  :DCLVASSET.STTLM-RSN-CD                      11144000
LRM019             FROM VASSET                                          11145000
LRM019             WHERE (CLIENT_NBR = :SV-CLIENT-NBR)                  11146000
LRM019               AND (ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR)         11147000
LRM019               AND ASSET_RQST_QTY_CD = 'F'                        11148000
LRM019               AND (STTLM_LCTN_CD = '40')                         11149000
LRM019               AND (CSH_MGN_SHRT_CD = 'M')                        11149100
LRM019        END-EXEC                                                  11149200
LRM019        EVALUATE SQLCODE                                          11149300
LRM019           WHEN +0                                                11149400
LRM019           WHEN -811                                              11149500
LRM019               MOVE 'F'    TO ACAT05IO-BAL02-FULL-RQST            11149600
LRM019               IF STTLM-RSN-CD OF DCLVASSET = 'CRED'              11149700
LRM019                  MOVE 'C' TO ACAT05IO-BAL02-FULL-DB-CR           11149800
LRM019               ELSE                                               11149900
LRM019                  MOVE 'D' TO ACAT05IO-BAL02-FULL-DB-CR           11150000
LRM019               END-IF                                             11150100
LRM019           WHEN +100                                              11150200
LRM019               MOVE ' '    TO ACAT05IO-BAL02-FULL-RQST            11150300
LRM019                              ACAT05IO-BAL02-FULL-DB-CR           11150400
LRM019           WHEN OTHER                                             11150500
LRM019              MOVE 'ERROR IN TOTAL OF CASH BALANCE (ACAT05DC)'    11150600
LRM019              TO  WS-RETURN-MSG                                   11150700
LRM019               PERFORM 9000-WRITE-TO-CICS-LOG                     11150800
LRM019               PERFORM 9500-RETURN-DB2-ERROR                      11150900
LRM019        END-EVALUATE                                              11151000
LRM019     END-IF.                                                      11151100
01/12      MOVE SV-BAL05              TO  ACAT05IO-BAL05.               11152000
LRM019     IF SV-BAL05 = ZERO                                           11153000
LRM019        EXEC SQL                                                  11154000
LRM019           SELECT STTLM_RSN_CD                                    11155000
LRM019               INTO  :DCLVASSET.STTLM-RSN-CD                      11156000
LRM019             FROM VASSET                                          11157000
LRM019             WHERE (CLIENT_NBR = :SV-CLIENT-NBR)                  11158000
LRM019               AND (ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR)         11159000
LRM019               AND ASSET_RQST_QTY_CD = 'F'                        11159100
LRM019               AND (STTLM_LCTN_CD = '40')                         11159200
LRM019               AND (CSH_MGN_SHRT_CD = 'S')                        11159300
LRM019        END-EXEC                                                  11159400
LRM019        EVALUATE SQLCODE                                          11159500
LRM019           WHEN +0                                                11159600
LRM019           WHEN -811                                              11159700
LRM019               MOVE 'F'    TO ACAT05IO-BAL05-FULL-RQST            11159800
LRM019               IF STTLM-RSN-CD OF DCLVASSET = 'CRED'              11159900
LRM019                  MOVE 'C' TO ACAT05IO-BAL05-FULL-DB-CR           11160000
LRM019               ELSE                                               11160100
LRM019                  MOVE 'D' TO ACAT05IO-BAL05-FULL-DB-CR           11160200
LRM019               END-IF                                             11160300
LRM019           WHEN +100                                              11160400
LRM019               MOVE ' '    TO ACAT05IO-BAL05-FULL-RQST            11160500
LRM019                              ACAT05IO-BAL05-FULL-DB-CR           11160600
LRM019           WHEN OTHER                                             11160700
LRM019              MOVE 'ERROR IN TOTAL OF CASH BALANCE (ACAT05DC)'    11160800
LRM019              TO  WS-RETURN-MSG                                   11160900
LRM019               PERFORM 9000-WRITE-TO-CICS-LOG                     11161000
LRM019               PERFORM 9500-RETURN-DB2-ERROR                      11161100
LRM019        END-EVALUATE                                              11161200
LRM019     END-IF.                                                      11161300
           MOVE WS-RETURN-MSG         TO  ACAT05IO-RETURN-MSG.          11162000
           MOVE WS-ACAT05DA-EXCEPTIONS TO ACAT05IO-TS-EXCEPTIONS.       11170000
                                                                        11180000
       0500-EXIT.                                                       11190000
           EXIT.                                                        11200000
      /                                                                 11210000
      ****************************                                      11220000
       0600-SRCH-ASSET.                                                 11230000
                                                                        11240000
           INITIALIZE CASH-BALANCE-WORK-AREA.                           11250000
           INITIALIZE WS-COUNT.                                         11260000
                                                                        11270000
           EXEC SQL                                                     11280000
                SELECT COUNT(*)                                         11290000
                INTO : WS-COUNT                                         11300000
                FROM VASSET                                             11310000
                     WHERE (CLIENT_NBR  = :SV-CLIENT-NBR)               11320000
                       AND (ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR)       11330000
           END-EXEC.                                                    11340000
                                                                        11350000
           IF WS-COUNT = +0                                             11360000
              SET ACAT05IO-VASSET-NOT-FOUND TO TRUE                     11370000
              INITIALIZE ACAT05IO-DC                                    11380000
              MOVE 'NO ASSET FOR THIS CLIENT (ACAT05DA)'                11390000
                   TO WS-RETURN-MSG                                     11400000
           ELSE                                                         11410000
              SET ACAT05IO-VASSET-FOUND TO TRUE                         11420000
              MOVE WS-COUNT      TO  ACAT05IO-VASSET-COUNT              11430000
                                     ACAT05IO-VASSET-COUNT-SV           11440000
              PERFORM 0610C-SUM1C   THRU 0610C-EXIT                     11450000
              PERFORM 0610D-SUM1D   THRU 0610D-EXIT                     11460000
              PERFORM 0615-CALCULATE-BAL01 THRU 0615-EXIT               11470000
              PERFORM 0620C-SUM2C   THRU 0620C-EXIT                     11480000
              PERFORM 0620D-SUM2D   THRU 0620D-EXIT                     11490000
              PERFORM 0625-CALCULATE-BAL02 THRU 0625-EXIT               11500000
              PERFORM 0630C-SUM5C   THRU 0630C-EXIT                     11510000
              PERFORM 0630D-SUM5D   THRU 0630D-EXIT                     11520000
              PERFORM 0635-CALCULATE-BAL05 THRU 0635-EXIT               11530000
           END-IF.                                                      11540000
      /                                                                 11550000
       0610C-SUM1C.                                                     11560000
092600      EXEC SQL                                                    11570000
                 OPEN SUM1C_CSR                                         11580000
            END-EXEC.                                                   11590000
            IF SQLCODE NOT = +0                                         11600000
               MOVE 'CAN NOT OPEN CURSOR SUM1C_CSR' TO WS-RETURN-MSG    11610000
            END-IF.                                                     11620000
                                                                        11630000
            EXEC SQL                                                    11640000
                 FETCH SUM1C_CSR                                        11650000
                 INTO :WS-BAL01                                         11660000
            END-EXEC.                                                   11670000
                                                                        11680000
093400      EVALUATE SQLCODE                                            11690000
093500          WHEN +0                                                 11700000
                     MOVE WS-BAL01 TO SV-BAL01C                         11710000
093800          WHEN -305                                               11720000
                    MOVE +0        TO SV-BAL01C                         11730000
094000          WHEN OTHER                                              11740000
                    MOVE 'ERROR IN TOTAL OF CASH BALANCE (ACAT05DC)'    11750000
                    TO  WS-RETURN-MSG                                   11760000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     11770000
                     PERFORM 9500-RETURN-DB2-ERROR                      11780000
094200      END-EVALUATE.                                               11790000
            EXEC SQL                                                    11800000
                 CLOSE  SUM1C_CSR                                       11810000
            END-EXEC.                                                   11820000
                                                                        11830000
       0610C-EXIT.                                                      11842000
            EXIT.                                                       11850000
      /                                                                 11860000
       0610D-SUM1D.                                                     11870000
092600      EXEC SQL                                                    11880000
                 OPEN SUM1D_CSR                                         11890000
            END-EXEC.                                                   11900000
            IF SQLCODE NOT = +0                                         11910000
               MOVE 'CAN NOT OPEN CURSOR SUM1D_CSR' TO WS-RETURN-MSG    11920000
            END-IF.                                                     11930000
                                                                        11940000
            EXEC SQL                                                    11950000
                 FETCH SUM1D_CSR                                        11960000
                 INTO :WS-BAL01                                         11970000
            END-EXEC.                                                   11980000
                                                                        11990000
093400      EVALUATE SQLCODE                                            12000000
093500          WHEN +0                                                 12010000
                     MOVE WS-BAL01 TO SV-BAL01D                         12020000
093800          WHEN -305                                               12030000
                    MOVE +0        TO SV-BAL01D                         12040000
094000          WHEN OTHER                                              12050000
                    MOVE 'ERROR IN TOTAL OF CASH BALANCE (ACAT05DC)'    12060000
                    TO  WS-RETURN-MSG                                   12070000
                    PERFORM 9000-WRITE-TO-CICS-LOG                      12080000
                    PERFORM 9500-RETURN-DB2-ERROR                       12090000
094200      END-EVALUATE.                                               12100000
            EXEC SQL                                                    12110000
                 CLOSE  SUM1C_CSR                                       12120000
            END-EXEC.                                                   12130000
                                                                        12140000
       0610D-EXIT.                                                      12150000
            EXIT.                                                       12160000
      /                                                                 12170000
       0615-CALCULATE-BAL01.                                            12180000
                                                                        12190000
           IF SV-BAL01C = +0  AND                                       12200000
              SV-BAL01D = +0                                            12210000
              MOVE +0   TO SV-BAL01                                     12220000
           ELSE                                                         12230000
              SUBTRACT SV-BAL01C FROM SV-BAL01D GIVING SV-BAL01         12240000
              IF SV-BAL01 < ZERO                                        12250000
                 MOVE 'CRED' TO SV-BAL01-STTLM-RSN-CD                   12260000
              ELSE                                                      12270000
                 MOVE 'DEB ' TO SV-BAL01-STTLM-RSN-CD                   12280000
              END-IF                                                    12290000
           END-IF.                                                      12300000
      ** GET TRNFR-RSN-CD                                               12310000
           IF SV-BAL01-STTLM-RSN-CD = 'CRED'                            12320000
              EXEC SQL                                                  12330000
                   SELECT                                               12340000
                         TRNFR_TYPE_RSN_CD                              12350000
                   INTO :WS-RSCD01                                      12360000
                   FROM VASSET                                          12370000
                   WHERE (CLIENT_NBR = :SV-CLIENT-NBR)                  12380000
                   AND (ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR)           12390000
                   AND (STTLM_RSN_CD = 'CRED')                          12400000
                   AND (STTLM_LCTN_CD = '40')                           12410000
                   AND (CSH_MGN_SHRT_CD = 'C')                          12420000
              END-EXEC                                                  12430000
093400        EVALUATE SQLCODE                                          12440000
093500             WHEN +0                                              12450000
                        GO TO 0615-EXIT                                 12460000
                   WHEN +100                                            12470000
                        GO TO 0615-EXIT                                 12480000
                   WHEN -811                                            12490000
                        GO TO 0615-EXIT                                 12500000
094000             WHEN OTHER                                           12510000
                        MOVE SPACE TO ACAT05IO-VASSET-SW                12520000
                        PERFORM 9000-WRITE-TO-CICS-LOG                  12530000
                        PERFORM 9500-RETURN-DB2-ERROR                   12540000
094200        END-EVALUATE                                              12550000
           END-IF.                                                      12560000
                                                                        12570000
           IF SV-BAL01-STTLM-RSN-CD = 'DEB '                            12580000
              EXEC SQL                                                  12590000
                   SELECT                                               12600000
                         TRNFR_TYPE_RSN_CD                              12610000
                   INTO :WS-RSCD01                                      12620000
                   FROM VASSET                                          12630000
                   WHERE (CLIENT_NBR = :SV-CLIENT-NBR)                  12640000
                   AND (ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR)           12650000
                   AND (STTLM_RSN_CD = 'DEB ')                          12660000
                   AND (STTLM_LCTN_CD = '40')                           12670000
                   AND (CSH_MGN_SHRT_CD = 'C')                          12680000
              END-EXEC                                                  12690000
093400        EVALUATE SQLCODE                                          12700000
093500             WHEN +0                                              12710000
                        GO TO 0615-EXIT                                 12720000
                   WHEN +100                                            12730000
                        GO TO 0615-EXIT                                 12740000
                   WHEN -811                                            12750000
                        GO TO 0615-EXIT                                 12760000
094000             WHEN OTHER                                           12770000
                        MOVE SPACE TO ACAT05IO-VASSET-SW                12780000
                        PERFORM 9000-WRITE-TO-CICS-LOG                  12790000
                        PERFORM 9500-RETURN-DB2-ERROR                   12800000
094200        END-EVALUATE                                              12810000
           END-IF.                                                      12820000
                                                                        12830000
       0615-EXIT.                                                       12840000
           EXIT.                                                        12850000
      /                                                                 12860000
       0620C-SUM2C.                                                     12870000
                                                                        12880000
092600      EXEC SQL                                                    12890000
                 OPEN SUM2C_CSR                                         12900000
            END-EXEC.                                                   12910000
            IF SQLCODE NOT = +0                                         12920000
               MOVE 'CAN NOT OPEN CURSOR SUM2C_CSR' TO WS-RETURN-MSG    12930000
            END-IF.                                                     12940000
                                                                        12950000
            EXEC SQL                                                    12960000
                 FETCH SUM2C_CSR                                        12970000
                 INTO :WS-BAL02                                         12980000
            END-EXEC.                                                   12990000
                                                                        13000000
093400      EVALUATE SQLCODE                                            13010000
093500          WHEN +0                                                 13020000
                     MOVE WS-BAL02 TO SV-BAL02C                         13030000
093800          WHEN -305                                               13040000
                    MOVE +0        TO SV-BAL02C                         13050000
094000          WHEN OTHER                                              13060000
                    MOVE 'ERROR IN TOTAL OF MARGIN BALANCE(ACAT05DC)'   13070000
                    TO  WS-RETURN-MSG                                   13080000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     13090000
                     PERFORM 9500-RETURN-DB2-ERROR                      13100000
094200      END-EVALUATE.                                               13110000
                                                                        13120000
            EXEC SQL                                                    13130000
                 CLOSE  SUM2C_CSR                                       13140000
            END-EXEC.                                                   13150000
                                                                        13160000
       0620C-EXIT.                                                      13170000
            EXIT.                                                       13180000
      /                                                                 13190000
       0620D-SUM2D.                                                     13200000
                                                                        13210000
092600      EXEC SQL                                                    13220000
                 OPEN SUM2D_CSR                                         13230000
            END-EXEC.                                                   13240000
            IF SQLCODE NOT = +0                                         13250000
               MOVE 'CAN NOT OPEN CURSOR SUM2D_CSR' TO WS-RETURN-MSG    13260000
            END-IF.                                                     13270000
                                                                        13280000
            EXEC SQL                                                    13290000
                 FETCH SUM2D_CSR                                        13300000
                 INTO :WS-BAL02                                         13310000
            END-EXEC.                                                   13320000
                                                                        13330000
093400      EVALUATE SQLCODE                                            13340000
093500          WHEN +0                                                 13350000
                     MOVE WS-BAL02 TO SV-BAL02D                         13360000
093800          WHEN -305                                               13370000
                    MOVE +0        TO SV-BAL02D                         13380000
094000          WHEN OTHER                                              13390000
                    MOVE 'ERROR IN TOTAL OF MARGIN BALANCE(ACAT05DC)'   13400000
                    TO  WS-RETURN-MSG                                   13410000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     13420000
                     PERFORM 9500-RETURN-DB2-ERROR                      13430000
094200      END-EVALUATE.                                               13440000
                                                                        13450000
            EXEC SQL                                                    13460000
                 CLOSE  SUM2D_CSR                                       13470000
            END-EXEC.                                                   13480000
                                                                        13490000
       0620D-EXIT.                                                      13500000
            EXIT.                                                       13510000
      /                                                                 13520000
       0625-CALCULATE-BAL02.                                            13530000
                                                                        13540000
           IF SV-BAL02C = +0  AND                                       13550000
              SV-BAL02D = +0                                            13560000
              MOVE +0   TO SV-BAL02                                     13570000
           ELSE                                                         13580000
              SUBTRACT SV-BAL02C FROM SV-BAL02D GIVING SV-BAL02         13590000
              IF SV-BAL02 < ZERO                                        13600000
                 MOVE 'CRED' TO SV-BAL02-STTLM-RSN-CD                   13610000
              ELSE                                                      13620000
                 MOVE 'DEB ' TO SV-BAL02-STTLM-RSN-CD                   13630000
              END-IF                                                    13640000
           END-IF.                                                      13650000
      ** GET TRNFR-RSN-CD                                               13660000
           IF SV-BAL02-STTLM-RSN-CD = 'CRED'                            13670000
              EXEC SQL                                                  13680000
                   SELECT                                               13690000
                         TRNFR_TYPE_RSN_CD                              13700000
                   INTO :WS-RSCD02                                      13710000
                   FROM VASSET                                          13720000
                   WHERE (CLIENT_NBR = :SV-CLIENT-NBR)                  13730000
                   AND (ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR)           13740000
                   AND (STTLM_RSN_CD = 'CRED')                          13750000
                   AND (STTLM_LCTN_CD = '40')                           13760000
                   AND (CSH_MGN_SHRT_CD = 'M')                          13770000
              END-EXEC                                                  13780000
093400        EVALUATE SQLCODE                                          13790000
093500             WHEN +0                                              13800000
                        GO TO 0625-EXIT                                 13810000
                   WHEN +100                                            13820000
                        GO TO 0625-EXIT                                 13830000
                   WHEN -811                                            13840000
                        GO TO 0625-EXIT                                 13850000
094000             WHEN OTHER                                           13860000
                        MOVE SPACE TO ACAT05IO-VASSET-SW                13870000
                        PERFORM 9000-WRITE-TO-CICS-LOG                  13880000
                        PERFORM 9500-RETURN-DB2-ERROR                   13890000
094200        END-EVALUATE                                              13900000
           END-IF.                                                      13910000
                                                                        13920000
           IF SV-BAL02-STTLM-RSN-CD = 'DEB '                            13930000
              EXEC SQL                                                  13940000
                   SELECT                                               13950000
                         TRNFR_TYPE_RSN_CD                              13960000
                   INTO :WS-RSCD02                                      13970000
                   FROM VASSET                                          13980000
                   WHERE (CLIENT_NBR = :SV-CLIENT-NBR)                  13990000
                   AND (ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR)           14000000
                   AND (STTLM_RSN_CD = 'DEB ')                          14010000
                   AND (STTLM_LCTN_CD = '40')                           14020000
                   AND (CSH_MGN_SHRT_CD = 'M')                          14030000
              END-EXEC                                                  14040000
093400        EVALUATE SQLCODE                                          14050000
093500             WHEN +0                                              14060000
                        GO TO 0625-EXIT                                 14070000
                   WHEN +100                                            14080000
                        GO TO 0625-EXIT                                 14090000
                   WHEN -811                                            14100000
                        GO TO 0625-EXIT                                 14110000
094000             WHEN OTHER                                           14120000
                        MOVE SPACE TO ACAT05IO-VASSET-SW                14130000
                        PERFORM 9000-WRITE-TO-CICS-LOG                  14140000
                        PERFORM 9500-RETURN-DB2-ERROR                   14150000
094200        END-EVALUATE                                              14160000
           END-IF.                                                      14170000
                                                                        14180000
       0625-EXIT.                                                       14190000
           EXIT.                                                        14200000
      /                                                                 14210000
       0630C-SUM5C.                                                     14220000
                                                                        14230000
092600      EXEC SQL                                                    14240000
                 OPEN SUM5C_CSR                                         14250000
            END-EXEC.                                                   14260000
            IF SQLCODE NOT = +0                                         14270000
               MOVE 'CAN NOT OPEN CURSOR SUM5C_CSR' TO WS-RETURN-MSG    14280000
            END-IF.                                                     14290000
                                                                        14300000
            EXEC SQL                                                    14310000
                 FETCH SUM5C_CSR                                        14320000
                 INTO :WS-BAL05                                         14330000
            END-EXEC.                                                   14340000
                                                                        14350000
093400      EVALUATE SQLCODE                                            14360000
093500          WHEN +0                                                 14370000
                     MOVE WS-BAL05 TO SV-BAL05C                         14380000
093800          WHEN -305                                               14390000
                    MOVE +0        TO SV-BAL05C                         14400000
094000          WHEN OTHER                                              14410000
                    MOVE 'ERROR IN TOTAL OF SHORT BALANCE(ACAT05DC)'    14420000
                    TO  WS-RETURN-MSG                                   14430000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     14440000
                     PERFORM 9500-RETURN-DB2-ERROR                      14450000
094200      END-EVALUATE.                                               14460000
                                                                        14470000
            EXEC SQL                                                    14480000
                 CLOSE  SUM5C_CSR                                       14490000
            END-EXEC.                                                   14500000
                                                                        14510000
       0630C-EXIT.                                                      14520000
           EXIT.                                                        14530000
      /                                                                 14540000
       0630D-SUM5D.                                                     14550000
                                                                        14560000
092600      EXEC SQL                                                    14570000
                 OPEN SUM5D_CSR                                         14580000
            END-EXEC.                                                   14590000
            IF SQLCODE NOT = +0                                         14600000
               MOVE 'CAN NOT OPEN CURSOR SUM5D_CSR' TO WS-RETURN-MSG    14610000
            END-IF.                                                     14620000
                                                                        14630000
            EXEC SQL                                                    14640000
                 FETCH SUM5D_CSR                                        14650000
                 INTO :WS-BAL05                                         14660000
            END-EXEC.                                                   14670000
                                                                        14680000
093400      EVALUATE SQLCODE                                            14690000
093500          WHEN +0                                                 14700000
                     MOVE WS-BAL05 TO SV-BAL05D                         14710000
093800          WHEN -305                                               14720000
                    MOVE +0        TO SV-BAL05D                         14730000
094000          WHEN OTHER                                              14740000
                    MOVE 'ERROR IN TOTAL OF SHORT BALANCE(ACAT05DC)'    14750000
                    TO  WS-RETURN-MSG                                   14760000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     14770000
                     PERFORM 9500-RETURN-DB2-ERROR                      14780000
094200      END-EVALUATE.                                               14790000
                                                                        14800000
            EXEC SQL                                                    14810000
                 CLOSE  SUM5D_CSR                                       14820000
            END-EXEC.                                                   14830000
                                                                        14840000
       0630D-EXIT.                                                      14850000
           EXIT.                                                        14860000
      /                                                                 14870000
       0635-CALCULATE-BAL05.                                            14880000
                                                                        14890000
           IF SV-BAL05C = +0  AND                                       14900000
              SV-BAL05D = +0                                            14910000
              MOVE +0   TO SV-BAL05                                     14920000
           ELSE                                                         14930000
              SUBTRACT SV-BAL05C FROM SV-BAL05D GIVING SV-BAL05         14940000
              IF SV-BAL05 < ZERO                                        14950000
                 MOVE 'CRED' TO SV-BAL05-STTLM-RSN-CD                   14960000
              ELSE                                                      14970000
                 MOVE 'DEB ' TO SV-BAL05-STTLM-RSN-CD                   14980000
              END-IF                                                    14990000
           END-IF.                                                      15000000
      ** GET TRNFR-RSN-CD                                               15010000
           IF SV-BAL05-STTLM-RSN-CD = 'CRED'                            15020000
              EXEC SQL                                                  15030000
                   SELECT                                               15040000
                         TRNFR_TYPE_RSN_CD                              15050000
                   INTO :WS-RSCD05                                      15060000
                   FROM VASSET                                          15070000
                   WHERE (CLIENT_NBR = :SV-CLIENT-NBR)                  15080000
                   AND (ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR)           15090000
                   AND (STTLM_RSN_CD = 'CRED')                          15100000
                   AND (STTLM_LCTN_CD = '40')                           15110000
                   AND (CSH_MGN_SHRT_CD = 'S')                          15120000
              END-EXEC                                                  15130000
093400        EVALUATE SQLCODE                                          15140000
093500             WHEN +0                                              15150000
                        GO TO 0635-EXIT                                 15160000
                   WHEN +100                                            15170000
                        GO TO 0635-EXIT                                 15180000
                   WHEN -811                                            15190000
                        GO TO 0635-EXIT                                 15200000
094000             WHEN OTHER                                           15210000
                        MOVE SPACE TO ACAT05IO-VASSET-SW                15220000
                        PERFORM 9000-WRITE-TO-CICS-LOG                  15230000
                        PERFORM 9500-RETURN-DB2-ERROR                   15240000
094200        END-EVALUATE                                              15250000
           END-IF.                                                      15260000
                                                                        15270000
           IF SV-BAL05-STTLM-RSN-CD = 'DEB '                            15280000
              EXEC SQL                                                  15290000
                   SELECT                                               15300000
                         TRNFR_TYPE_RSN_CD                              15310000
                   INTO :WS-RSCD05                                      15320000
                   FROM VASSET                                          15330000
                   WHERE (CLIENT_NBR = :SV-CLIENT-NBR)                  15340000
                   AND (ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR)           15350000
                   AND (STTLM_RSN_CD = 'DEB ')                          15360000
                   AND (STTLM_LCTN_CD = '40')                           15370000
                   AND (CSH_MGN_SHRT_CD = 'S')                          15380000
              END-EXEC                                                  15390000
093400        EVALUATE SQLCODE                                          15400000
093500             WHEN +0                                              15410000
                        GO TO 0635-EXIT                                 15420000
                   WHEN +100                                            15430000
                        GO TO 0635-EXIT                                 15440000
                   WHEN -811                                            15450000
                        GO TO 0635-EXIT                                 15460000
094000             WHEN OTHER                                           15470000
                        MOVE SPACE TO ACAT05IO-VASSET-SW                15480000
                        PERFORM 9000-WRITE-TO-CICS-LOG                  15490000
                        PERFORM 9500-RETURN-DB2-ERROR                   15500000
094200        END-EVALUATE                                              15510000
           END-IF.                                                      15520000
                                                                        15530000
       0635-EXIT.                                                       15540000
           EXIT.                                                        15550000
      /                                                                 15560000
       0650-RETRIEVE-CURRENT-VTRNFR.                                    15570000
                                                                        15580000
           EXEC SQL                                                     15590000
                SELECT                                                  15600000
                      CLIENT_NBR,                                       15610000
                      ACAT_CONTROL_NBR,                                 15620000
                      SBMTG_PRTCP_NBR,                                  15630000
                      SBMT_PRT_NR_STS_CD,                               15640000
                      CONTROL_NBR_STS_CD,                               15650000
                      DLVR_NBR,                                         15660000
                      DLVR_NBR_STTS_CD,                                 15670000
                      ACCT_DLVR_NBR,                                    15680000
                      ACCT_DLVR_STTS_CD,                                15690000
                      RCV_NBR,                                          15700000
                      RCV_NBR_STTS_CD,                                  15710000
                      ACCT_RCV_NBR,                                     15720000
                      ACCT_RCV_STTS_CD,                                 15730000
                      TRNFR_TYPE_CD,                                    15740000
                      TRNFR_TYPE_STTS_CD,                               15750000
                      TRANS_TYPE_CD,                                    15760000
                      TRANS_TYPE_STTS_CD,                               15770000
                      RCV_CUST_NM,                                      15780000
                      RCV_CUST_NM_STS_CD,                               15790000
                      RCV_SS_PRIM_NBR,                                  15800000
                      RCV_SS_PRIM_STS_CD,                               15810000
                      RCV_SS_SCNDY_NBR,                                 15820000
                      RCV_SS_SCDY_STS_CD,                               15830000
                      RCV_ACCT_TYPE_CD,                                 15840000
                      RCV_ACT_TYP_STS_CD,                               15850000
                      RCV_OCC_BRKR_NBR,                                 15860000
                      RCV_OCC_STTS_CD,                                  15870000
                      RCV_CRSPN_NBR,                                    15880000
                      RCV_CRSPN_STTS_CD,                                15890000
                      ACAT_CNTL_ASTD_NBR,                               15900000
                      CNTL_ASTD_STTS_CD,                                15910000
                      CMNT_TXT,                                         15920000
                      CMNT_STTS_CD,                                     15930000
                      PRCS_DT,                                          15940000
                      STTS_CD,                                          15950000
                      STTLM_TM_CD,                                      15960000
                      VAL_FREE_CD,                                      15970000
                      TRANS_RFRN_ID_CD,                                 15980000
                      TRANS_RFRN_STTS_CD,                               15990000
                      DB_CR_CD,                                         16000000
                      DSTBN_SIDE_CD,                                    16010000
                      SYS_ACT_CD,                                       16020000
                      SYS_RJCT_RSN_CD,                                  16030000
                      TRNFR_TYPE_RJC1_CD,                               16040000
                      TRNFR_TYPE_RJC2_CD,                               16050000
                      TRNFR_TYPE_RJCT_CD,                               16060000
                      TRN_TYP_RJC_STS_CD,                               16070000
                      PHSCL_SEQ_NBR,                                    16080000
                      PHSCL_SEQ_STTS_CD,                                16090000
                      LGCL_SEQ_NBR,                                     16100000
                      LGCL_SEQ_NR_STS_CD,                               16110000
                      RR_CD,                                            16120000
                      BRANCH_CD,                                        16130000
                      DVDND_NAA_CD,                                     16140000
                      SELL_INSTN_NAA_CD,                                16150000
                      CASH_SWEEP_NAA_CD,                                16160000
                      PRTCP_CONTRA_CD,                                  16170000
                      ACM_HOLDER_NAA_CD,                                16180000
                      ACCT_ACTIVITY_IND,                                16190000
                      ACCT_ORDERS_IND,                                  16200000
                      ACCT_RJCT_RSBM_IND,                               16210000
                      ACCT_DB_BAL_T1_IND,                               16220000
                      ACCT_MRGN_DB_IND,                                 16230000
                      ACCT_SHRT_PSTN_IND,                               16240000
                      ACCT_SEC_RSTRD_IND,                               16250000
                      ACCT_AST_EXCS_IND,                                16260000
                      ACCT_OPTN_PSTN_IND,                               16270000
                      ACCT_LTD_PRTNR_IND,                               16280000
                      ACCT_TIN_MSMTH_IND,                               16290000
                      ACCT_DPLCT_TRN_IND,                               16300000
                      ACCT_CUST_70_IND,                                 16310000
                      ACCT_QULFD_PLN_IND,                               16320000
                      ACCT_MNGD_IND,                                    16330000
                      ACCT_PRVT_RNG_IND,                                16340000
                      ACCT_BRKR_TIF_IND,                                16350000
                      NSCC_NON_ADP_IND,                                 16360000
                      CYCLE_CD,                                         16370000
                      DAYS_STTS_QTY,                                    16380000
                      STTLM_DT,                                         16390000
                      ACCT_NA_UPDT_IND,                                 16400000
                      ACCT_TRNFR_FEE_AMT,                               16410000
                      ACCT_IRA_TRMNT_AMT,                               16420000
                      ACCT_IRA_MAINT_AMT,                               16430000
                      ACCT_DLRV_PRGR_IND,                               16440000
                      ACCT_CD,                                          16450000
                      STTLM_ASCTD_DT,                                   16460000
                      STTLM_ASCTD_STS_CD,                               16470000
                      RCRD_LNGTH_STTS_CD,                               16480000
                      RCRD_STTS_CD,                                     16490000
                      NSCC_PEND_CD,                                     16500000
                      NSCC_ACK_IND,                                     16510000
                      CICS_TERM_ID_CD,                                  16520000
                      PRGM_NM,                                          16530000
                      CRT_TMSTP,                                        16540000
                      UPDT_TMSTP,                                       16550000
                      ACCT_EQUITY_AMT                                   16560000
                INTO                                                    16570000
                   :DCLVTRNFR.CLIENT-NBR                                16580000
                  ,:DCLVTRNFR.ACAT-CONTROL-NBR                          16590000
                  ,:DCLVTRNFR.SBMTG-PRTCP-NBR                           16600000
                  ,:DCLVTRNFR.SBMT-PRT-NR-STS-CD                        16610000
                  ,:DCLVTRNFR.CONTROL-NBR-STS-CD                        16620000
                  ,:DCLVTRNFR.DLVR-NBR                                  16630000
                  ,:DCLVTRNFR.DLVR-NBR-STTS-CD                          16640000
                  ,:DCLVTRNFR.ACCT-DLVR-NBR                             16650000
                  ,:DCLVTRNFR.ACCT-DLVR-STTS-CD                         16660000
                  ,:DCLVTRNFR.RCV-NBR                                   16670000
                  ,:DCLVTRNFR.RCV-NBR-STTS-CD                           16680000
                  ,:DCLVTRNFR.ACCT-RCV-NBR                              16690000
                  ,:DCLVTRNFR.ACCT-RCV-STTS-CD                          16700000
                  ,:DCLVTRNFR.TRNFR-TYPE-CD                             16710000
                  ,:DCLVTRNFR.TRNFR-TYPE-STTS-CD                        16720000
                  ,:DCLVTRNFR.TRANS-TYPE-CD                             16730000
                  ,:DCLVTRNFR.TRANS-TYPE-STTS-CD                        16740000
                  ,:DCLVTRNFR.RCV-CUST-NM                               16750000
                  ,:DCLVTRNFR.RCV-CUST-NM-STS-CD                        16760000
                  ,:DCLVTRNFR.RCV-SS-PRIM-NBR                           16770000
                  ,:DCLVTRNFR.RCV-SS-PRIM-STS-CD                        16780000
                  ,:DCLVTRNFR.RCV-SS-SCNDY-NBR                          16790000
                  ,:DCLVTRNFR.RCV-SS-SCDY-STS-CD                        16800000
                  ,:DCLVTRNFR.RCV-ACCT-TYPE-CD                          16810000
                  ,:DCLVTRNFR.RCV-ACT-TYP-STS-CD                        16820000
                  ,:DCLVTRNFR.RCV-OCC-BRKR-NBR                          16830000
                  ,:DCLVTRNFR.RCV-OCC-STTS-CD                           16840000
                  ,:DCLVTRNFR.RCV-CRSPN-NBR                             16850000
                  ,:DCLVTRNFR.RCV-CRSPN-STTS-CD                         16860000
                  ,:DCLVTRNFR.ACAT-CNTL-ASTD-NBR                        16870000
                  ,:DCLVTRNFR.CNTL-ASTD-STTS-CD                         16880000
                  ,:DCLVTRNFR.CMNT-TXT                                  16890000
                  ,:DCLVTRNFR.CMNT-STTS-CD                              16900000
                  ,:DCLVTRNFR.PRCS-DT                                   16910000
                  ,:DCLVTRNFR.STTS-CD                                   16920000
                  ,:DCLVTRNFR.STTLM-TM-CD                               16930000
                  ,:DCLVTRNFR.VAL-FREE-CD                               16940000
                  ,:DCLVTRNFR.TRANS-RFRN-ID-CD                          16950000
                  ,:DCLVTRNFR.TRANS-RFRN-STTS-CD                        16960000
                  ,:DCLVTRNFR.DB-CR-CD                                  16970000
                  ,:DCLVTRNFR.DSTBN-SIDE-CD                             16980000
                  ,:DCLVTRNFR.SYS-ACT-CD                                16990000
                  ,:DCLVTRNFR.SYS-RJCT-RSN-CD                           17000000
                  ,:DCLVTRNFR.TRNFR-TYPE-RJC1-CD                        17010000
                  ,:DCLVTRNFR.TRNFR-TYPE-RJC2-CD                        17020000
                  ,:DCLVTRNFR.TRNFR-TYPE-RJCT-CD                        17030000
                  ,:DCLVTRNFR.TRN-TYP-RJC-STS-CD                        17040000
                  ,:DCLVTRNFR.PHSCL-SEQ-NBR                             17050000
                  ,:DCLVTRNFR.PHSCL-SEQ-STTS-CD                         17060000
                  ,:DCLVTRNFR.LGCL-SEQ-NBR                              17070000
                  ,:DCLVTRNFR.LGCL-SEQ-NR-STS-CD                        17080000
                  ,:DCLVTRNFR.RR-CD                                     17090000
                  ,:DCLVTRNFR.BRANCH-CD                                 17100000
                  ,:DCLVTRNFR.DVDND-NAA-CD                              17110000
                  ,:DCLVTRNFR.SELL-INSTN-NAA-CD                         17120000
                  ,:DCLVTRNFR.CASH-SWEEP-NAA-CD                         17130000
                  ,:DCLVTRNFR.PRTCP-CONTRA-CD                           17140000
                  ,:DCLVTRNFR.ACM-HOLDER-NAA-CD                         17150000
                  ,:DCLVTRNFR.ACCT-ACTIVITY-IND                         17160000
                  ,:DCLVTRNFR.ACCT-ORDERS-IND                           17170000
                  ,:DCLVTRNFR.ACCT-RJCT-RSBM-IND                        17180000
                  ,:DCLVTRNFR.ACCT-DB-BAL-T1-IND                        17190000
                  ,:DCLVTRNFR.ACCT-MRGN-DB-IND                          17200000
                  ,:DCLVTRNFR.ACCT-SHRT-PSTN-IND                        17210000
                  ,:DCLVTRNFR.ACCT-SEC-RSTRD-IND                        17220000
                  ,:DCLVTRNFR.ACCT-AST-EXCS-IND                         17230000
                  ,:DCLVTRNFR.ACCT-OPTN-PSTN-IND                        17240000
                  ,:DCLVTRNFR.ACCT-LTD-PRTNR-IND                        17250000
                  ,:DCLVTRNFR.ACCT-TIN-MSMTH-IND                        17260000
                  ,:DCLVTRNFR.ACCT-DPLCT-TRN-IND                        17270000
                  ,:DCLVTRNFR.ACCT-CUST-70-IND                          17280000
                  ,:DCLVTRNFR.ACCT-QULFD-PLN-IND                        17290000
                  ,:DCLVTRNFR.ACCT-MNGD-IND                             17300000
                  ,:DCLVTRNFR.ACCT-PRVT-RNG-IND                         17310000
                  ,:DCLVTRNFR.ACCT-BRKR-TIF-IND                         17320000
                  ,:DCLVTRNFR.NSCC-NON-ADP-IND                          17330000
                  ,:DCLVTRNFR.CYCLE-CD                                  17340000
                  ,:DCLVTRNFR.DAYS-STTS-QTY                             17350000
                  ,:DCLVTRNFR.STTLM-DT                                  17360000
                  ,:DCLVTRNFR.ACCT-NA-UPDT-IND                          17370000
                  ,:DCLVTRNFR.ACCT-TRNFR-FEE-AMT                        17380000
                  ,:DCLVTRNFR.ACCT-IRA-TRMNT-AMT                        17390000
                  ,:DCLVTRNFR.ACCT-IRA-MAINT-AMT                        17400000
                  ,:DCLVTRNFR.ACCT-DLRV-PRGR-IND                        17410000
                  ,:DCLVTRNFR.ACCT-CD                                   17420000
                  ,:DCLVTRNFR.STTLM-ASCTD-DT                            17430000
                  ,:DCLVTRNFR.STTLM-ASCTD-STS-CD                        17440000
                  ,:DCLVTRNFR.RCRD-LNGTH-STTS-CD                        17450000
                  ,:DCLVTRNFR.RCRD-STTS-CD                              17460000
                  ,:DCLVTRNFR.NSCC-PEND-CD                              17470000
                  ,:DCLVTRNFR.NSCC-ACK-IND                              17480000
                  ,:DCLVTRNFR.CICS-TERM-ID-CD                           17490000
                  ,:DCLVTRNFR.PRGM-NM                                   17500000
                  ,:DCLVTRNFR.CRT-TMSTP                                 17510000
                  ,:DCLVTRNFR.UPDT-TMSTP                                17520000
                  ,:DCLVTRNFR.ACCT-EQUITY-AMT                           17530000
                FROM  VTRNFR                                            17540000
                WHERE CLIENT_NBR = :SV-CLIENT-NBR           AND         17550000
                      ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR  AND         17560000
                      TRNFR_TYPE_CD = :ACAT05IO-TFR-TYPE    AND         17570000
                      STTS_CD    = :ACAT05IO-STTS-CD                    17580000
           END-EXEC.                                                    17590000
                                                                        17600000
093400     EVALUATE SQLCODE                                             17610000
093500          WHEN +0                                                 17620000
                     SET CURRENT-VTRNFR-FOUND TO TRUE                   17630000
                WHEN +100                                               17640000
                     SET VTRNFR-NOT-FOUND TO TRUE                       17650000
                     SET CURRENT-VTRNFR-NOT-FOUND TO TRUE               17660000
                     MOVE '2ND RETRIEVE TFR NOT FOUND' TO WS-RETURN-MSG 17670000
094000          WHEN OTHER                                              17680000
                     MOVE SPACE TO ACAT05IO-VINITRNF-SW                 17690000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     17700000
                     PERFORM 9500-RETURN-DB2-ERROR                      17710000
094200     END-EVALUATE.                                                17720000
                                                                        17730000
       0660-MOVE-VTRNFR.                                                17740000
      *                                                                 17750000
           MOVE CLIENT-NBR         OF DCLVTRNFR     TO                  17760000
ET0003          CLIENT-NBR         OF DCLACTITRF.                       17770000
           MOVE DLVR-NBR           OF DCLVTRNFR     TO                  17780000
ET0003          DLVR-NBR           OF DCLACTITRF.                       17790000
           MOVE ACCT-DLVR-NBR      OF DCLVTRNFR     TO                  17800000
ET0003          ACCT-DLVR-NBR      OF DCLACTITRF.                       17810000
           MOVE RCV-NBR OF DCLVTRNFR        TO                          17820000
ET0003          RCV-NBR OF DCLACTITRF.                                  17830000
           MOVE ACCT-RCV-NBR OF DCLVTRNFR   TO                          17840000
ET0003          ACCT-RCV-NBR OF DCLACTITRF.                             17850000
           MOVE RCV-NBR-STTS-CD OF DCLVTRNFR TO                         17860000
ET0003          RCV-NBR-STTS-CD OF DCLACTITRF.                          17870000
           MOVE DLVR-NBR-STTS-CD OF DCLVTRNFR TO                        17880000
ET0003          DLVR-NBR-STTS-CD OF DCLACTITRF.                         17890000
           MOVE ACCT-RCV-STTS-CD OF DCLVTRNFR TO                        17900000
ET0003          ACCT-RCV-STTS-CD OF DCLACTITRF.                         17910000
           MOVE ACCT-DLVR-STTS-CD OF DCLVTRNFR   TO                     17920000
ET0003          ACCT-DLVR-STTS-CD OF DCLACTITRF.                        17930000
           MOVE SBMTG-PRTCP-NBR   OF DCLVTRNFR   TO                     17940000
ET0003          SBMTG-PRTCP-NBR   OF DCLACTITRF.                        17950000
           MOVE SBMT-PRT-NR-STS-CD OF DCLVTRNFR  TO                     17960000
ET0003          SBMT-PRT-NR-STS-CD OF DCLACTITRF.                       17970000
           MOVE ACAT-CONTROL-NBR   OF DCLVTRNFR  TO                     17980000
ET0003          ACAT-CONTROL-NBR   OF DCLACTITRF.                       17990000
           MOVE CONTROL-NBR-STS-CD OF DCLVTRNFR TO                      18000000
ET0003**        TRNFR-TYPE-STTS-CD OF DCLVINITAST.                      18010000
ET0003          CONTROL-NBR-STS-CD OF DCLACTITRF.                       18020000
           MOVE TRANS-TYPE-STTS-CD OF DCLVTRNFR  TO                     18030000
ET0003          TRANS-TYPE-STTS-CD OF DCLACTITRF.                       18040000
           MOVE RCV-CUST-NM        OF DCLVTRNFR  TO                     18050000
ET0003          RCV-CUST-NM        OF DCLACTITRF.                       18060000
           MOVE RCV-CUST-NM-STS-CD OF DCLVTRNFR  TO                     18070000
ET0003          RCV-CUST-NM-STS-CD OF DCLACTITRF.                       18080000
           MOVE RCV-SS-PRIM-NBR    OF DCLVTRNFR  TO                     18090000
ET0003          RCV-SS-PRIM-NBR    OF DCLACTITRF.                       18100000
           MOVE RCV-SS-PRIM-STS-CD OF DCLVTRNFR  TO                     18110000
ET0003          RCV-SS-PRIM-STS-CD OF DCLACTITRF.                       18120000
           MOVE RCV-SS-SCNDY-NBR   OF DCLVTRNFR  TO                     18130000
ET0003          RCV-SS-SCNDY-NBR   OF DCLACTITRF.                       18140000
           MOVE RCV-SS-SCDY-STS-CD OF DCLVTRNFR  TO                     18150000
ET0003          RCV-SS-SCDY-STS-CD OF DCLACTITRF.                       18160000
           MOVE RCV-ACCT-TYPE-CD   OF DCLVTRNFR  TO                     18170000
ET0003          RCV-ACCT-TYPE-CD   OF DCLACTITRF.                       18180000
           MOVE RCV-ACT-TYP-STS-CD OF DCLVTRNFR  TO                     18190000
ET0003          RCV-ACT-TYP-STS-CD OF DCLACTITRF.                       18200000
           MOVE RCV-OCC-BRKR-NBR   OF DCLVTRNFR  TO                     18210000
ET0003          RCV-OCC-BRKR-NBR   OF DCLACTITRF.                       18220000
           MOVE RCV-OCC-STTS-CD    OF DCLVTRNFR  TO                     18230000
ET0003          RCV-OCC-STTS-CD    OF DCLACTITRF.                       18240000
           MOVE RCV-CRSPN-NBR      OF DCLVTRNFR  TO                     18250000
ET0003          RCV-CRSPN-NBR      OF DCLACTITRF.                       18260000
           MOVE RCV-CRSPN-STTS-CD  OF DCLVTRNFR  TO                     18270000
ET0003          RCV-CRSPN-STTS-CD  OF DCLACTITRF.                       18280000
           MOVE ACAT-CNTL-ASTD-NBR OF DCLVTRNFR  TO                     18290000
ET0003          ACAT-CNTL-ASTD-NBR OF DCLACTITRF.                       18300000
           MOVE CNTL-ASTD-STTS-CD  OF DCLVTRNFR  TO                     18310000
ET0003          CNTL-ASTD-STTS-CD  OF DCLACTITRF.                       18320000
           MOVE CMNT-STTS-CD       OF DCLVTRNFR  TO                     18330000
ET0003          CMNT-STTS-CD       OF DCLACTITRF.                       18340000
ET0003     MOVE '100' TO    STTS-CD  OF DCLACTITRF.                     18350000
           MOVE DSTBN-SIDE-CD      OF DCLVTRNFR  TO                     18360000
ET0003          DSTBN-SIDE-CD      OF DCLACTITRF.                       18370000
           MOVE SYS-ACT-CD         OF DCLVTRNFR  TO                     18380000
ET0003          SYS-ACT-CD         OF DCLACTITRF.                       18390000
           MOVE SYS-RJCT-RSN-CD    OF DCLVTRNFR  TO                     18400000
ET0003          SYS-RJCT-RSN-CD    OF DCLACTITRF.                       18410000
           MOVE TRNFR-TYPE-RJC1-CD OF DCLVTRNFR  TO                     18420000
ET0003          TRNFR-TYPE-RJC1-CD OF DCLACTITRF.                       18430000
           MOVE TRNFR-TYPE-RJC2-CD OF DCLVTRNFR  TO                     18440000
ET0003          TRNFR-TYPE-RJC2-CD OF DCLACTITRF.                       18450000
           MOVE TRN-TYP-RJC-STS-CD OF DCLVTRNFR  TO                     18460000
ET0003          TRN-TYP-RJC-STS-CD OF DCLACTITRF.                       18470000
           MOVE PHSCL-SEQ-NBR      OF DCLVTRNFR  TO                     18480000
ET0003          PHSCL-SEQ-NBR      OF DCLACTITRF.                       18490000
           MOVE PHSCL-SEQ-STTS-CD  OF DCLVTRNFR  TO                     18500000
ET0003          PHSCL-SEQ-STTS-CD  OF DCLACTITRF.                       18510000
           MOVE LGCL-SEQ-NBR       OF DCLVTRNFR  TO                     18520000
ET0003          LGCL-SEQ-NBR       OF DCLACTITRF.                       18530000
           MOVE LGCL-SEQ-NR-STS-CD OF DCLVTRNFR  TO                     18540000
ET0003          LGCL-SEQ-NR-STS-CD OF DCLACTITRF.                       18550000
           MOVE PRTCP-CONTRA-CD    OF DCLVTRNFR  TO                     18560000
ET0003          PRTCP-CONTRA-CD    OF DCLACTITRF.                       18570000
           MOVE CYCLE-CD           OF DCLVTRNFR  TO                     18580000
ET0003          CYCLE-CD           OF DCLACTITRF.                       18590000
           MOVE DAYS-STTS-QTY      OF DCLVTRNFR  TO                     18600000
ET0003          DAYS-STTS-QTY      OF DCLACTITRF.                       18610000
           MOVE TRANS-RFRN-ID-CD   OF DCLVTRNFR  TO                     18620000
ET0003          TRANS-RFRN-ID-CD   OF DCLACTITRF.                       18630000
           MOVE TRANS-RFRN-STTS-CD OF DCLVTRNFR  TO                     18640000
ET0003          TRANS-RFRN-STTS-CD OF DCLACTITRF.                       18650000
           MOVE DB-CR-CD           OF DCLVTRNFR  TO                     18660000
ET0003          DB-CR-CD           OF DCLACTITRF.                       18670000
           MOVE STTLM-ASCTD-STS-CD OF DCLVTRNFR  TO                     18680000
ET0003          STTLM-ASCTD-STS-CD OF DCLACTITRF.                       18690000
           MOVE RCRD-LNGTH-STTS-CD OF DCLVTRNFR  TO                     18700000
ET0003          RCRD-LNGTH-STTS-CD OF DCLACTITRF.                       18710000
           MOVE RCRD-STTS-CD       OF DCLVTRNFR  TO                     18720000
ET0003          RCRD-STTS-CD       OF DCLACTITRF.                       18730000
ET0003     MOVE SPACE  TO  NSCC-PEND-CD OF DCLACTITRF.                  18740000
           MOVE NSCC-ACK-IND       OF DCLVTRNFR  TO                     18750000
ET0003          NSCC-ACK-IND       OF DCLACTITRF.                       18760000
           MOVE RR-CD              OF DCLVTRNFR  TO                     18770000
ET0003          RR-CD              OF DCLACTITRF.                       18780000
      *                                                                 18790000
      /                                                                 18800000
       0670-RETRIEVE-FOR-PENDING.                                       18810000
      *                                                                 18820000
           EXEC SQL                                                     18830000
                SELECT                                                  18840000
                       CLIENT_NBR                                       18850000
                     , ACAT_CONTROL_NBR                                 18860000
                     , BRANCH_CD                                        18870000
                     , RR_CD                                            18880000
                     , ACCT_CD                                          18890000
                     , TRNFR_TYPE_CD                                    18900000
                     , STTS_CD                                          18910000
01/12                , DAYS_STTS_QTY                                    18920000
                     , RCV_NBR                                          18930000
                     , DLVR_NBR                                         18940000
                     , ACCT_DLVR_NBR                                    18950000
                     , ACCT_RCV_NBR                                     18960000
                     , RCV_CUST_NM                                      18970000
                     , RCV_SS_PRIM_NBR                                  18980000
                     , RCV_SS_SCNDY_NBR                                 18990000
                     , RCV_ACCT_TYPE_CD                                 19000000
                     , STTLM_DT                                         19010000
                     , CMNT_TXT                                         19020000
                     , DSTBN_SIDE_CD                                    19030000
                     , NSCC_PEND_CD                                     19040000
                     , ACCT_ACTIVITY_IND                                19050000
                     , ACCT_ORDERS_IND                                  19060000
                     , ACCT_RJCT_RSBM_IND                               19070000
                     , ACCT_DB_BAL_T1_IND                               19080000
                     , ACCT_MRGN_DB_IND                                 19090000
                     , ACCT_SHRT_PSTN_IND                               19100000
                     , ACCT_SEC_RSTRD_IND                               19110000
                     , ACCT_AST_EXCS_IND                                19120000
                     , ACCT_OPTN_PSTN_IND                               19130000
                     , ACCT_LTD_PRTNR_IND                               19140000
                     , ACCT_TIN_MSMTH_IND                               19150000
                     , ACCT_DPLCT_TRN_IND                               19160000
                     , ACCT_CUST_70_IND                                 19170000
                     , ACCT_QULFD_PLN_IND                               19180000
                     , ACCT_MNGD_IND                                    19190000
                     , ACCT_PRVT_RNG_IND                                19200000
                     , ACCT_BRKR_TIF_IND                                19210000
                     , NSCC_NON_ADP_IND                                 19220000
ET0007               , ACAT_CNTL_ASTD_NBR                               19230000
ET0007               , FRV_MFC_CMPLT_IND                                19240000
ET0009               , ACCT_FRZN_IND                                    19250000
LRM012               , STTLM_TM_CD                                      19260000
LRM013               , GIFT_IND                                         19270000
DJ0001               , AUCTION_RT_IND                                   19271000
LRM018               , PENNY_STK_IND                                    19272000
                INTO                                                    19280000
                       :WS-CLIENT-NBR                                   19290000
                      ,:WS-ACAT-CONTROL-NBR                             19300000
                      ,:WS-BRANCH-CD                                    19310000
                      ,:WS-RR-CD                                        19320000
                      ,:WS-ACCT-CD                                      19330000
                      ,:WS-TFR-TYPE                                     19340000
                      ,:WS-STTS-CD                                      19350000
01/12                 ,:WS-DAYS                                         19360000
                      ,:WS-RCV-NBR                                      19370000
                      ,:WS-DLVR-NBR                                     19380000
                      ,:WS-ACCT-DLVR-NBR                                19390000
                      ,:WS-ACCT-RCV-NBR                                 19400000
                      ,:WS-RCV-CUST-NM                                  19410000
                      ,:WS-RCV-SS-PRIM-NBR                              19420000
                      ,:WS-RCV-SS-SCNDY-NBR                             19430000
                      ,:WS-RCV-ACCT-TYPE-CD                             19440000
                      ,:WS-STTLM-DT                                     19450000
                      ,:WS-VTRNFR-CMNT                                  19460000
                      ,:WS-DSTBN-SIDE-CD                                19470000
                      ,:WS-VTRNFR-NSCC-PEND-CD                          19480000
                      ,:WS-ACCT-ACTIVITY-IND                            19490000
                      ,:WS-ACCT-ORDERS-IND                              19500000
                      ,:WS-ACCT-RJCT-RSBM-IND                           19510000
                      ,:WS-ACCT-DB-BAL-T1-IND                           19520000
                      ,:WS-ACCT-MRGN-DB-IND                             19530000
                      ,:WS-ACCT-SHRT-PSTN-IND                           19540000
                      ,:WS-ACCT-SEC-RSTRD-IND                           19550000
                      ,:WS-ACCT-AST-EXCS-IND                            19560000
                      ,:WS-ACCT-OPTN-PSTN-IND                           19570000
                      ,:WS-ACCT-LTD-PRTNR-IND                           19580000
                      ,:WS-ACCT-TIN-MSMTH-IND                           19590000
                      ,:WS-ACCT-DPLCT-TRN-IND                           19600000
                      ,:WS-ACCT-CUST-70-IND                             19610000
                      ,:WS-ACCT-QULFD-PLN-IND                           19620000
                      ,:WS-ACCT-MNGD-IND                                19630000
                      ,:WS-ACCT-PRVT-RNG-IND                            19640000
                      ,:WS-ACCT-BRKR-TIF-IND                            19650000
                      ,:WS-NSCC-NON-ADP-IND                             19660000
ET0007                ,:WS-ACAT-CNTL-ASTD-NBR                           19670000
ET0007                ,:WS-FRV-MFC-CMPLT-IND                            19680000
ET0009                ,:WS-ACCT-FRZN-IND                                19690000
LRM012                ,:WS-STTLM-TM-CD                                  19700000
LRM013                ,:WS-GIFT-IND                                     19710000
DJ0001                ,:WS-AUCTION-RATE-IND                             19711000
LRM018                ,:WS-SUB-PENNY-PRICE-IND                          19712000
                FROM  VTRNFR                                            19720000
                WHERE CLIENT_NBR = :SV-CLIENT-NBR           AND         19730000
                      ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR              19740000
093200      END-EXEC.                                                   19750000
      *                                                                 19760000
093400     EVALUATE SQLCODE                                             19770000
093500          WHEN +0                                                 19780000
                     SET ACAT05IO-VTRNFR-FOUND TO TRUE                  19790000
                     MOVE WS-BRANCH-CD  TO SV-BRANCH-CD                 19800000
                     MOVE WS-ACCT-CD    TO SV-ACCT-CD                   19810000
                     MOVE WS-RR-CD      TO SV-RR-CD                     19820000
                     IF WS-VTRNFR-CMNT > SPACES                         19830000
                        MOVE 'Y'               TO WS-ACCT-COMMENTS-IND  19840000
                     ELSE                                               19850000
                        MOVE SPACE             TO WS-ACCT-COMMENTS-IND  19860000
                     END-IF                                             19870000
ET0007               IF  (WS-TFR-TYPE = 'MFC' OR 'FRV')                 19880000
ET0007               AND (WS-STTS-CD = '200' OR '300' OR '310')         19890000
ET0007                  PERFORM 1500-TRNFR-MFC-FRV-DUPE-CHECK           19900000
ET0007                     THRU 1500-EXIT                               19910000
ET0007               END-IF                                             19920000
                     PERFORM 0300-SEARCH-VINITRNF                       19930000
                WHEN +100                                               19940000
                     SET ACAT05IO-VTRNFR-NOT-FOUND TO TRUE              19950000
                     MOVE 'THIS PENDING TRANSFER IS NOT FOUND' TO       19960000
                     WS-RETURN-MSG                                      19970000
094000          WHEN OTHER                                              19980000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     19990000
                     PERFORM 9500-RETURN-DB2-ERROR                      20000000
094200     END-EVALUATE.                                                20010000
                                                                        20020000
           IF ACAT05IO-VTRNFR-FOUND                                     20030000
              PERFORM 0600-SRCH-ASSET                                   20040000
              MOVE SPACE TO ACAT05IO-FIRST-TIME-SW                      20050000
           END-IF.                                                      20060000
      /                                                                 20070000
       0700-ISRT-VINITRNF.                                              20080000
                                                                        20090000
           MOVE SPACE TO WS-CURRENT-VTRNFR-SW.                          20100000
                                                                        20110000
           PERFORM 0650-RETRIEVE-CURRENT-VTRNFR.                        20120000
           IF CURRENT-VTRNFR-FOUND                                      20130000
              CONTINUE                                                  20140000
           ELSE                                                         20150000
              EXEC CICS RETURN END-EXEC                                 20160000
           END-IF.                                                      20170000
      *                                                                 20180000
           EXEC SQL                                                     20190000
                SET :WS-TIMESTAMP = CURRENT TIMESTAMP                   20200000
           END-EXEC.                                                    20210000
                                                                        20220000
ET0003**   INITIALIZE DCLVINITRNF.                                      20230000
ET0003     INITIALIZE DCLACTITRF.                                       20240000
      *                                                                 20250000
           PERFORM 0660-MOVE-VTRNFR.                                    20260000
ET0003     MOVE WS-TIMESTAMP TO  UPDT-TMSTP OF DCLACTITRF               20270000
ET0003                            CRT-TMSTP OF DCLACTITRF.              20280000
                                                                        20290000
ET0003     MOVE WS-TIMESTAMP(1 : 10) TO PRCS-DT OF DCLACTITRF,          20300000
ET0003                                  STTLM-ASCTD-DT OF DCLACTITRF,   20310000
                                        WS-PRCS-DT,                     20320000
                                        WS-STTLM-ASCTD-DT.              20330000
                                                                        20340000
            IF ACAT05IO-M5REJ = 'S' OR                                  20350000
               ACAT05IO-M5REJC = 'S'                                    20360000
               MOVE 'R' TO WS-TRANS-TYPE-CD                             20370000
ET0001      ELSE                                                        20380000
ET0001      IF ACAT05IO-M5ACCEL = 'S'                                   20390000
ET0001         MOVE 'X' TO WS-TRANS-TYPE-CD                             20400000
            END-IF.                                                     20410000
                                                                        20420000
           MOVE TRNFR-TYPE-CD OF DCLVTRNFR   TO                         20430000
ET0003          TRNFR-TYPE-CD OF DCLACTITRF.                            20440000
                                                                        20450000
           IF ACAT05IO-M5REJ = 'S'    OR                                20460000
              ACAT05IO-M5REJC = 'S'                                     20470000
     ******   EVALUATE  TRNFR-TYPE-CD OF DCLVTRNFR                      20480000
              EVALUATE  ACAT05IO-TFR-TYPE                               20490000
                  WHEN 'RCR' MOVE '22' TO WS-TRNFR-TYPE-RJCT-CD         20500000
ET0002**          WHEN 'PTR' MOVE '23' TO WS-TRNFR-TYPE-RJCT-CD         20510000
ET0002            WHEN 'PTR' MOVE '21' TO WS-TRNFR-TYPE-RJCT-CD         20520000
                  WHEN 'PTD' MOVE '23' TO WS-TRNFR-TYPE-RJCT-CD         20530000
                  WHEN 'FRV' MOVE '24' TO WS-TRNFR-TYPE-RJCT-CD         20540000
                  WHEN 'RCL' MOVE '25' TO WS-TRNFR-TYPE-RJCT-CD         20550000
                  WHEN 'CRD' MOVE '26' TO WS-TRNFR-TYPE-RJCT-CD         20560000
                  WHEN 'MFC' MOVE '27' TO WS-TRNFR-TYPE-RJCT-CD         20570000
              END-EVALUATE                                              20580000
ET0001     ELSE                                                         20590000
ET0001     IF ACAT05IO-M5ACCEL = 'S'                                    20600000
ET0001        MOVE '00' TO WS-TRNFR-TYPE-RJCT-CD                        20610000
           END-IF.                                                      20620000
                                                                        20630000
ET0003     MOVE WS-TRANS-TYPE-CD TO TRANS-TYPE-CD OF DCLACTITRF,        20640000
                                    ACAT05IO-INIT-TRANS-TYPE-CD.        20650000
           MOVE WS-TRNFR-TYPE-RJCT-CD                                   20660000
ET0003                           TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF,   20670000
                                    ACAT05IO-TRNFR-TYPE-RJCT-CD.        20680000
                                                                        20690000
           IF ACAT05IO-VINITRNF-CMNT > SPACES                           20700000
              MOVE ACAT05IO-VINITRNF-CMNT TO                            20710000
ET0003             CMNT-TXT OF DCLACTITRF                               20720000
           END-IF.                                                      20730000
ET0009     IF ACAT05IO-FREEZ-TYPE > SPACE                               20740000
ET0009        MOVE 'H'                 TO NSCC-PEND-CD OF DCLACTITRF    20750000
ET0009                                    ACAT05IO-VINITRNF-NSCC-PEND-CD20760000
ET0009        MOVE 'R'                 TO TRANS-TYPE-CD OF DCLACTITRF   20770000
ET0009                                    ACAT05IO-INIT-TRANS-TYPE-CD   20780000
ET0009        MOVE 'ACCOUNT IS FROZEN' TO CMNT-TXT OF DCLACTITRF        20790000
ET0009                                    ACAT05IO-VINITRNF-CMNT        20800000
ET0009     END-IF.                                                      20810000
                                                                        20820000
ET0003     MOVE ACAT05IO-SBMT-BRKR TO SBMTG-PRTCP-NBR OF DCLACTITRF.    20830000
                                                                        20840000
ET0003     MOVE +001  TO  PHSCL-SEQ-NBR OF DCLACTITRF                   20850000
ET0003                    LGCL-SEQ-NBR  OF DCLACTITRF.                  20860000
      *                                                                 20870000
ET0003     MOVE EIBTRMID TO CICS-TERM-ID-CD OF DCLACTITRF.              20880000
ET0003     MOVE 'ACAT05DA'  TO  PRGM-NM OF DCLACTITRF.                  20890000
ET0008     MOVE WS-ACAT-SIGN-ON-ID TO CICS-SGNON-ID OF DCLACTITRF.      20900000
ET0010     MOVE ACAT05IO-USER-NAME TO TPSCRT-USR-NM OF DCLACTITRF.      20910000
ET0010     MOVE ACAT05IO-USER-ID   TO TPSCRT-USR-ID OF DCLACTITRF.      20920000
ET0010     MOVE ACAT05IO-NET-NAME  TO CICS-NET-NM   OF DCLACTITRF.      20930000
                                                                        20940000
                                                                        20950000
      *                                                                 20960000
           EXEC SQL                                                     20970000
ET0003         INSERT INTO ACTITRF                                      20980000
                 ( CLIENT_NBR                                           20990000
                 , DLVR_NBR                                             21000000
                 , ACCT_DLVR_NBR                                        21010000
                 , RCV_NBR                                              21020000
                 , ACCT_RCV_NBR                                         21030000
                 , TRNFR_TYPE_CD                                        21040000
                 , RCV_NBR_STTS_CD                                      21050000
                 , DLVR_NBR_STTS_CD                                     21060000
                 , ACCT_RCV_STTS_CD                                     21070000
                 , ACCT_DLVR_STTS_CD                                    21080000
                 , SBMTG_PRTCP_NBR                                      21090000
                 , SBMT_PRT_NR_STS_CD                                   21100000
                 , ACAT_CONTROL_NBR                                     21110000
                 , CONTROL_NBR_STS_CD                                   21120000
                 , TRNFR_TYPE_STTS_CD                                   21130000
                 , TRANS_TYPE_CD                                        21140000
                 , TRANS_TYPE_STTS_CD                                   21150000
                 , RCV_CUST_NM                                          21160000
                 , RCV_CUST_NM_STS_CD                                   21170000
                 , RCV_SS_PRIM_NBR                                      21180000
                 , RCV_SS_PRIM_STS_CD                                   21190000
                 , RCV_SS_SCNDY_NBR                                     21200000
                 , RCV_SS_SCDY_STS_CD                                   21210000
                 , RCV_ACCT_TYPE_CD                                     21220000
                 , RCV_ACT_TYP_STS_CD                                   21230000
                 , RCV_OCC_BRKR_NBR                                     21240000
                 , RCV_OCC_STTS_CD                                      21250000
                 , RCV_CRSPN_NBR                                        21260000
                 , RCV_CRSPN_STTS_CD                                    21270000
                 , ACAT_CNTL_ASTD_NBR                                   21280000
                 , CNTL_ASTD_STTS_CD                                    21290000
                 , CMNT_TXT                                             21300000
                 , CMNT_STTS_CD                                         21310000
                 , PRCS_DT                                              21320000
                 , STTS_CD                                              21330000
                 , DSTBN_SIDE_CD                                        21340000
                 , SYS_ACT_CD                                           21350000
                 , SYS_RJCT_RSN_CD                                      21360000
                 , TRNFR_TYPE_RJCT_CD                                   21370000
                 , TRNFR_TYPE_RJC1_CD                                   21380000
                 , TRNFR_TYPE_RJC2_CD                                   21390000
                 , TRN_TYP_RJC_STS_CD                                   21400000
                 , PHSCL_SEQ_NBR                                        21410000
                 , PHSCL_SEQ_STTS_CD                                    21420000
                 , LGCL_SEQ_NBR                                         21430000
                 , LGCL_SEQ_NR_STS_CD                                   21440000
                 , PRTCP_CONTRA_CD                                      21450000
                 , CYCLE_CD                                             21460000
                 , DAYS_STTS_QTY                                        21470000
                 , TRANS_RFRN_ID_CD                                     21480000
                 , TRANS_RFRN_STTS_CD                                   21490000
                 , DB_CR_CD                                             21500000
                 , STTLM_ASCTD_DT                                       21510000
                 , STTLM_ASCTD_STS_CD                                   21520000
                 , RCRD_LNGTH_STTS_CD                                   21530000
                 , RCRD_STTS_CD                                         21540000
                 , NSCC_PEND_CD                                         21550000
                 , NSCC_ACK_IND                                         21560000
                 , UPDT_TMSTP                                           21570000
                 , CRT_TMSTP                                            21580000
                 , CICS_TERM_ID_CD                                      21590000
                 , PRGM_NM                                              21600000
                 , RR_CD                                                21610000
ET0008           , CICS_SGNON_ID                                        21620000
ET0010           , TPSCRT_USR_NM                                        21630000
ET0010           , TPSCRT_USR_ID                                        21640000
ET0010           , CICS_NET_NM                                          21650000
ET0010             )                                                    21660000
                 VALUES                                                 21670000
ET0003             (:DCLACTITRF.CLIENT-NBR                              21680000
ET0003             ,:DCLACTITRF.DLVR-NBR                                21690000
ET0003             ,:DCLACTITRF.ACCT-DLVR-NBR                           21700000
ET0003             ,:DCLACTITRF.RCV-NBR                                 21710000
ET0003             ,:DCLACTITRF.ACCT-RCV-NBR                            21720000
ET0003             ,:DCLACTITRF.TRNFR-TYPE-CD                           21730000
ET0003             ,:DCLACTITRF.RCV-NBR-STTS-CD                         21740000
ET0003             ,:DCLACTITRF.DLVR-NBR-STTS-CD                        21750000
ET0003             ,:DCLACTITRF.ACCT-RCV-STTS-CD                        21760000
ET0003             ,:DCLACTITRF.ACCT-DLVR-STTS-CD                       21770000
ET0003             ,:DCLACTITRF.SBMTG-PRTCP-NBR                         21780000
ET0003             ,:DCLACTITRF.SBMT-PRT-NR-STS-CD                      21790000
ET0003             ,:DCLACTITRF.ACAT-CONTROL-NBR                        21800000
ET0003             ,:DCLACTITRF.CONTROL-NBR-STS-CD                      21810000
ET0003             ,:DCLACTITRF.TRNFR-TYPE-STTS-CD                      21820000
ET0003             ,:DCLACTITRF.TRANS-TYPE-CD                           21830000
ET0003             ,:DCLACTITRF.TRANS-TYPE-STTS-CD                      21840000
ET0003             ,:DCLACTITRF.RCV-CUST-NM                             21850000
ET0003             ,:DCLACTITRF.RCV-CUST-NM-STS-CD                      21860000
ET0003             ,:DCLACTITRF.RCV-SS-PRIM-NBR                         21870000
ET0003             ,:DCLACTITRF.RCV-SS-PRIM-STS-CD                      21880000
ET0003             ,:DCLACTITRF.RCV-SS-SCNDY-NBR                        21890000
ET0003             ,:DCLACTITRF.RCV-SS-SCDY-STS-CD                      21900000
ET0003             ,:DCLACTITRF.RCV-ACCT-TYPE-CD                        21910000
ET0003             ,:DCLACTITRF.RCV-ACT-TYP-STS-CD                      21920000
ET0003             ,:DCLACTITRF.RCV-OCC-BRKR-NBR                        21930000
ET0003             ,:DCLACTITRF.RCV-OCC-STTS-CD                         21940000
ET0003             ,:DCLACTITRF.RCV-CRSPN-NBR                           21950000
ET0003             ,:DCLACTITRF.RCV-CRSPN-STTS-CD                       21960000
ET0003             ,:DCLACTITRF.ACAT-CNTL-ASTD-NBR                      21970000
ET0003             ,:DCLACTITRF.CNTL-ASTD-STTS-CD                       21980000
ET0003             ,:DCLACTITRF.CMNT-TXT                                21990000
ET0003             ,:DCLACTITRF.CMNT-STTS-CD                            22000000
ET0003             ,:DCLACTITRF.PRCS-DT                                 22010000
ET0003             ,:DCLACTITRF.STTS-CD                                 22020000
ET0003             ,:DCLACTITRF.DSTBN-SIDE-CD                           22030000
ET0003             ,:DCLACTITRF.SYS-ACT-CD                              22040000
ET0003             ,:DCLACTITRF.SYS-RJCT-RSN-CD                         22050000
ET0003             ,:DCLACTITRF.TRNFR-TYPE-RJCT-CD                      22060000
ET0003             ,:DCLACTITRF.TRNFR-TYPE-RJC1-CD                      22070000
ET0003             ,:DCLACTITRF.TRNFR-TYPE-RJC2-CD                      22080000
ET0003             ,:DCLACTITRF.TRN-TYP-RJC-STS-CD                      22090000
ET0003             ,:DCLACTITRF.PHSCL-SEQ-NBR                           22100000
ET0003             ,:DCLACTITRF.PHSCL-SEQ-STTS-CD                       22110000
ET0003             ,:DCLACTITRF.LGCL-SEQ-NBR                            22120000
ET0003             ,:DCLACTITRF.LGCL-SEQ-NR-STS-CD                      22130000
ET0003             ,:DCLACTITRF.PRTCP-CONTRA-CD                         22140000
ET0003             ,:DCLACTITRF.CYCLE-CD                                22150000
ET0003             ,:DCLACTITRF.DAYS-STTS-QTY                           22160000
ET0003             ,:DCLACTITRF.TRANS-RFRN-ID-CD                        22170000
ET0003             ,:DCLACTITRF.TRANS-RFRN-STTS-CD                      22180000
ET0003             ,:DCLACTITRF.DB-CR-CD                                22190000
ET0003             ,:DCLACTITRF.STTLM-ASCTD-DT                          22200000
ET0003             ,:DCLACTITRF.STTLM-ASCTD-STS-CD                      22210000
ET0003             ,:DCLACTITRF.RCRD-LNGTH-STTS-CD                      22220000
ET0003             ,:DCLACTITRF.RCRD-STTS-CD                            22230000
ET0003             ,:DCLACTITRF.NSCC-PEND-CD                            22240000
LRM016             ,' '                                                 22250000
                   , CURRENT TIMESTAMP                                  22260000
                   , CURRENT TIMESTAMP                                  22270000
ET0003             ,:DCLACTITRF.CICS-TERM-ID-CD                         22280000
ET0003             ,:DCLACTITRF.PRGM-NM                                 22290000
ET0003             ,:DCLACTITRF.RR-CD                                   22300000
ET0008             ,:WS-ACAT-SIGN-ON-ID                                 22310000
ET0010             ,:DCLACTITRF.TPSCRT-USR-NM                           22320000
ET0010             ,:DCLACTITRF.TPSCRT-USR-ID                           22330000
ET0010             ,:DCLACTITRF.CICS-NET-NM                             22340000
ET0010              )                                                   22350000
093200     END-EXEC.                                                    22360000
                                                                        22370000
093400     EVALUATE SQLCODE                                             22380000
093500          WHEN +0                                                 22390000
093600               SET ACAT05IO-VINITRNF-INSERTED TO TRUE             22400000
093500          WHEN -803                                               22410000
093600*              SET ACAT05IO-VINITRNF-INSERTED TO TRUE             22420000
                     PERFORM 0750-UPDATE-VINITRNF                       22430000
094000          WHEN OTHER                                              22440000
                     MOVE SPACE TO ACAT05IO-VINITRNF-SW                 22450000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     22460000
                     PERFORM 9500-RETURN-DB2-ERROR                      22470000
094200     END-EVALUATE.                                                22480000
      /                                                                 22490000
       0750-UPDATE-VINITRNF.                                            22500000
      *                                                                 22510000
           MOVE SPACE TO WS-CURRENT-VTRNFR-SW.                          22520000
           IF ACAT05IO-VINITRNF-CMNT(1 : 1) = LOW-VALUES                22530000
ET0003        MOVE SPACES TO CMNT-TXT OF DCLACTITRF                     22540000
           ELSE                                                         22550000
ET0003        MOVE ACAT05IO-VINITRNF-CMNT TO CMNT-TXT OF DCLACTITRF     22560000
           END-IF.                                                      22570000
      *                                                                 22580000
           EXEC SQL                                                     22590000
ET0003        UPDATE ACTITRF                                            22600000
ET0001**        SET  TRANS_TYPE_CD = 'R'                                22610000
ET0001          SET  TRANS_TYPE_CD = :WS-TRANS-TYPE-CD                  22620000
                    ,TRNFR_TYPE_RJCT_CD = :WS-TRNFR-TYPE-RJCT-CD        22630000
ET0003              ,CMNT_TXT = :DCLACTITRF.CMNT-TXT                    22640000
                    ,PRCS_DT = :WS-PRCS-DT                              22650000
                    ,STTLM_ASCTD_DT = :WS-STTLM-ASCTD-DT                22660000
ET0005              ,NSCC_PEND_CD = ' '                                 22670000
                    ,UPDT_TMSTP = CURRENT TIMESTAMP                     22680000
                    ,PRGM_NM = 'ACAT05DA'                               22690000
ET0008              ,CICS_SGNON_ID = :WS-ACAT-SIGN-ON-ID                22700000
LRM015              ,NSCC_ACK_IND      =  ' '                           22710000
                WHERE CLIENT_NBR = :SV-CLIENT-NBR             AND       22720000
ET0003                ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CONTROL-NBR    22730000
ET0003                                                        AND       22740000
                      RCV_NBR = :ACAT05IO-RCV-NBR             AND       22750000
                      DLVR_NBR = :ACAT05IO-DLVR-NBR           AND       22760000
                      ACCT_DLVR_NBR = :ACAT05IO-ACCT-DLVR-NBR AND       22770000
                      ACCT_RCV_NBR = :ACAT05IO-ACCT-RCV-NBR   AND       22780000
                      TRNFR_TYPE_CD = :ACAT05IO-TFR-TYPE      AND       22790000
                      RR_CD = :ACAT05IO-RR-CD                           22800000
ET0011**              STTS_CD  = :ACAT05IO-STTS-CD                      22810000
           END-EXEC.                                                    22820000
                                                                        22830000
093400     EVALUATE SQLCODE                                             22840000
093500          WHEN +0                                                 22850000
093600               SET ACAT05IO-VINITRNF-UPDATED TO TRUE              22860000
ET0011               MOVE SPACE TO ACAT05IO-VINITRNF-NSCC-PEND-CD       22870000
ET0005**             MOVE ' *** A INITIAL TIF IS UPDATED ***(0750-UPDT)'22880000
ET0005**             TO WS-RETURN-MSG                                   22890000
094000          WHEN OTHER                                              22900000
                     MOVE SPACE TO ACAT05IO-VINITRNF-SW                 22910000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     22920000
                     PERFORM 9500-RETURN-DB2-ERROR                      22930000
094200     END-EVALUATE.                                                22940000
      *                                                                 22950000
      /                                                                 22960000
       0800-DLTE-VINITRNF.                                              22970000
      *                                                                 22980000
           MOVE SPACE TO WS-CURRENT-VTRNFR-SW.                          22990000
                                                                        23000000
           PERFORM 0650-RETRIEVE-CURRENT-VTRNFR.                        23010000
           IF CURRENT-VTRNFR-FOUND                                      23020000
              MOVE TRNFR-TYPE-CD OF DCLVTRNFR TO WS-TFR-TYPE            23030000
              MOVE RCV-NBR OF DCLVTRNFR       TO WS-RCV-NBR             23040000
              MOVE DLVR-NBR OF DCLVTRNFR      TO WS-DLVR-NBR            23050000
              MOVE ACCT-DLVR-NBR OF DCLVTRNFR TO WS-ACCT-DLVR-NBR       23060000
              MOVE ACCT-RCV-NBR OF DCLVTRNFR  TO WS-ACCT-RCV-NBR        23070000
           ELSE                                                         23080000
              EXEC CICS RETURN END-EXEC                                 23090000
           END-IF.                                                      23100000
      *                                                                 23110000
           EXEC SQL                                                     23120000
              DELETE                                                    23130000
ET0003         FROM ACTITRF                                             23140000
ET0003**        WHERE (CLIENT_NBR = :SV-CLIENT-NBR                      23150000
ET0003**         AND  TRNFR_TYPE_CD = :WS-TFR-TYPE                      23160000
ET0003**         AND  RCV_NBR = :WS-RCV-NBR                             23170000
ET0003**         AND  DLVR_NBR = :WS-DLVR-NBR                           23180000
ET0003**         AND  ACCT_DLVR_NBR = :WS-ACCT-DLVR-NBR                 23190000
ET0003**         AND  ACCT_RCV_NBR =  :WS-ACCT-RCV-NBR)                 23200000
ET0003**     OR                                                         23210000
ET0003          WHERE                                                   23220000
                     (CLIENT_NBR = :SV-CLIENT-NBR                       23230000
                 AND  ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR              23240000
                 AND  TRNFR_TYPE_CD = :WS-TFR-TYPE                      23250000
                 AND  RCV_NBR = :WS-RCV-NBR                             23260000
                 AND  DLVR_NBR = :WS-DLVR-NBR                           23270000
                 AND  ACCT_DLVR_NBR = :WS-ACCT-DLVR-NBR                 23280000
                 AND  ACCT_RCV_NBR =  :WS-ACCT-RCV-NBR)                 23290000
           END-EXEC.                                                    23300000
                                                                        23310000
093400     EVALUATE SQLCODE                                             23320000
093500          WHEN +0                                                 23330000
093600               SET ACAT05IO-VINITRNF-DELETED TO TRUE              23340000
                     MOVE SPACE TO  ACAT05IO-INIT-TRANS-TYPE-CD         23350000
                                    ACAT05IO-VINITRNF-CMNT              23360000
093500          WHEN +100                                               23370000
093600               SET ACAT05IO-VINITRNF-NOT-FOUND TO TRUE            23380000
ET0003               MOVE '  FAIL TO DELETE ACTITRF (ACAT05DA)'         23390000
                      TO  WS-RETURN-MSG                                 23400000
094000          WHEN OTHER                                              23410000
                     MOVE SPACE TO ACAT05IO-VINITRNF-SW                 23420000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     23430000
                     PERFORM 9500-RETURN-DB2-ERROR                      23440000
094200     END-EVALUATE.                                                23450000
                                                                        23460000
      /                                                                 23470000
       0900-UPDT-VTRNFR.                                                23480000
           IF ACAT05IO-M5ACCPT = 'S'                                    23490000
              EXEC SQL                                                  23500000
                   UPDATE VTRNFR                                        23510000
                     SET NSCC_PEND_CD = 'A'                             23520000
LRM014                  ,ACCT_DLRV_PRGR_IND = 'A'                       23530000
                        ,UPDT_TMSTP = CURRENT TIMESTAMP                 23540000
                        ,PRGM_NM = 'ACAT05DA'                           23550000
                   WHERE CLIENT_NBR = :SV-CLIENT-NBR AND                23560000
                         ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR           23570000
                END-EXEC                                                23580000
093400          EVALUATE SQLCODE                                        23590000
093500            WHEN +0                                               23600000
                       SET ACAT05IO-VTRNFR-UPDATED TO TRUE              23610000
                       MOVE 'A' TO ACAT05IO-VTRNFR-NSCC-PEND-CD         23620000
LRM020                 PERFORM 0910-INSERT-VTRNFRAU                     23621000
                  WHEN +100                                             23630000
                       SET ACAT05IO-VTRNFR-NOT-FOUND TO TRUE            23640000
                       SET CURRENT-VTRNFR-NOT-FOUND TO TRUE             23650000
                       MOVE ' FAIL TO UPDATE VTRNFR (ACCEPT)'           23660000
                                                     TO WS-RETURN-MSG   23670000
094000            WHEN OTHER                                            23680000
                       MOVE SPACE TO ACAT05IO-VTRNFR-SW                 23690000
                       PERFORM 9000-WRITE-TO-CICS-LOG                   23700000
                       PERFORM 9500-RETURN-DB2-ERROR                    23710000
094200          END-EVALUATE                                            23720000
              ELSE                                                      23730000
                 IF ACAT05IO-M5ACCPT = SPACE                            23740000
                   EXEC SQL                                             23750000
                        UPDATE VTRNFR                                   23760000
                          SET NSCC_PEND_CD = ' '                        23770000
LRM014                       ,ACCT_DLRV_PRGR_IND = ' '                  23780000
                             ,UPDT_TMSTP = CURRENT TIMESTAMP            23790000
                             ,PRGM_NM = 'ACAT05DA'                      23800000
                        WHERE CLIENT_NBR = :SV-CLIENT-NBR AND           23810000
                              ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR      23820000
                     END-EXEC                                           23830000
093400               EVALUATE SQLCODE                                   23840000
093500                WHEN +0                                           23850000
                           SET ACAT05IO-VTRNFR-UPDATED TO TRUE          23860000
                           MOVE ' ' TO ACAT05IO-VTRNFR-NSCC-PEND-CD     23870000
LRM020                     PERFORM 0912-DELETE-VTRNFRAU                 23871000
                      WHEN +100                                         23880000
                           SET ACAT05IO-VTRNFR-NOT-FOUND TO TRUE        23890000
                           SET CURRENT-VTRNFR-NOT-FOUND TO TRUE         23900000
                           MOVE ' FAIL TO UPDATE VTRNFR (UNACCEPT)'     23910000
                                                       TO WS-RETURN-MSG 23920000
094000                WHEN OTHER                                        23930000
                           MOVE SPACE TO ACAT05IO-VTRNFR-SW             23940000
                           PERFORM 9000-WRITE-TO-CICS-LOG               23950000
                           PERFORM 9500-RETURN-DB2-ERROR                23960000
094200               END-EVALUATE                                       23970000
                 END-IF                                                 23980000
              END-IF.                                                   23990000
                                                                        24000000
       0900-EXIT.                                                       24010000
           EXIT.                                                        24020000
LRM020 0910-INSERT-VTRNFRAU.                                            24021000
           EXEC SQL                                                     24022000
                SET :WS-TIMESTAMP = CURRENT TIMESTAMP                   24023000
           END-EXEC.                                                    24024000
           MOVE SPACES TO DCLVTRNFRAU.                                  24025000
           MOVE ACAT05IO-CLIENT-NBR TO CLIENT-NBR OF DCLVTRNFRAU        24026002
           MOVE ACAT05IO-ACAT-CONTROL-NBR TO ACAT-CONTROL-NBR           24027002
                                                OF DCLVTRNFRAU          24028000
           MOVE WS-TIMESTAMP TO AUD-CRT-TMSTP OF DCLVTRNFRAU            24029000
                                UPDT-TMSTP    OF DCLVTRNFRAU            24029100
                                CRT-TMSTP     OF DCLVTRNFRAU            24029200
LRM020****  "A" MEANS ACCEPTED TO CAT761A.                              24029300
           MOVE 'A' TO  TRANS-TYPE-CD         OF DCLVTRNFRAU            24029400
           MOVE ACAT05IO-RCV-CUST-NM TO RCV-CUST-NM OF DCLVTRNFRAU      24029502
           MOVE ACAT05IO-VTRNFR-CMNT TO CMNT-TXT OF DCLVTRNFRAU         24029602
           MOVE ACAT05IO-RR-CD       TO CMNT-TXT OF DCLVTRNFRAU(70:3)   24029702
           MOVE ACAT05IO-ACAT-SIGN-ON-ID                                24029804
                                     TO CMNT-TXT OF DCLVTRNFRAU(73:4)   24029904
           MOVE ACAT05IO-USER-NAME   TO CMNT-TXT OF DCLVTRNFRAU(77:20)  24030004
           MOVE ACAT05IO-USER-ID     TO CMNT-TXT OF DCLVTRNFRAU(97:8)   24030104
           MOVE ACAT05IO-NET-NAME    TO CMNT-TXT OF DCLVTRNFRAU(105:8)  24030204
           MOVE ACAT05IO-TFR-TYPE    TO CMNT-TXT OF DCLVTRNFRAU(113:3)  24030304
           MOVE ZEROS TO DAYS-STTS-QTY              OF DCLVTRNFRAU      24030404
           MOVE '0001-01-01' TO STTLM-DT            OF DCLVTRNFRAU      24030504
                                PRCS-DT             OF DCLVTRNFRAU      24030604
                                STTLM-ASCTD-DT      OF DCLVTRNFRAU      24030704
           MOVE ACAT05IO-BRANCH-CD  TO BRANCH-CD    OF DCLVTRNFRAU      24030804
           MOVE ACAT05IO-ACCT-CD    TO ACCT-CD      OF DCLVTRNFRAU      24030904
                       MOVE 'A' TO ACAT05IO-VTRNFR-NSCC-PEND-CD         24031004
           MOVE 'A'                TO TRANS-TYPE-CD OF DCLVTRNFRAU      24031104
           MOVE ACAT05IO-ACCT-DLVR-NBR TO ACCT-DLVR-NBR                 24031204
                                                OF DCLVTRNFRAU          24031304
           MOVE ACAT05IO-ACCT-RCV-NBR  TO ACCT-RCV-NBR                  24031404
                                                OF DCLVTRNFRAU          24031504
           MOVE EIBTRMID TO CICS-TERM-ID-CD     OF DCLVTRNFRAU          24031604
           MOVE 'ACAT05DA' TO PRGM-NM           OF DCLVTRNFRAU          24031704
           EXEC SQL                                                     24031804
             INSERT INTO VTRNFRAU                                       24031904
              ( CLIENT_NBR                                              24032004
               ,ACAT_CONTROL_NBR                                        24032104
               ,AUD_CRT_TMSTP                                           24032204
               ,TRANS_TYPE_CD                                           24032304
               ,RCV_CUST_NM                                             24032404
               ,RCV_SS_PRIM_NBR                                         24032504
               ,RCV_SS_SCNDY_NBR                                        24032604
               ,RCV_ACCT_TYPE_CD                                        24032704
               ,RCV_OCC_BRKR_NBR                                        24032804
               ,RCV_CRSPN_NBR                                           24032904
               ,ACAT_CNTL_ASTD_NBR                                      24033004
               ,STTLM_ASCTD_DT                                          24033104
               ,PRTCP_CONTRA_CD                                         24033204
               ,CMNT_TXT                                                24033304
               ,NSCC_NON_ADP_IND                                        24033404
               ,CYCLE_CD                                                24033504
               ,DAYS_STTS_QTY                                           24033604
               ,STTLM_DT                                                24033704
               ,PRCS_DT                                                 24033804
               ,STTS_CD                                                 24033904
               ,SYS_RJCT_RSN_CD                                         24034004
               ,TRNFR_TYPE_RJC1_CD                                      24034104
               ,ACCT_CD                                                 24034204
               ,ACCT_DLVR_NBR                                           24034304
               ,ACCT_RCV_NBR                                            24034404
               ,BRANCH_CD                                               24034504
               ,CICS_TERM_ID_CD                                         24034604
               ,PRGM_NM                                                 24034704
               ,UPDT_TMSTP                                              24034804
               ,CRT_TMSTP )                                             24034904
                 VALUES                                                 24035004
                   (:DCLVTRNFRAU.CLIENT-NBR                             24035104
                   ,:DCLVTRNFRAU.ACAT-CONTROL-NBR                       24035204
                   ,:DCLVTRNFRAU.AUD-CRT-TMSTP                          24035304
                   ,:DCLVTRNFRAU.TRANS-TYPE-CD                          24035404
                   ,:DCLVTRNFRAU.RCV-CUST-NM                            24035504
                   ,:DCLVTRNFRAU.RCV-SS-PRIM-NBR                        24035604
                   ,:DCLVTRNFRAU.RCV-SS-SCNDY-NBR                       24035704
                   ,:DCLVTRNFRAU.RCV-ACCT-TYPE-CD                       24035804
                   ,:DCLVTRNFRAU.RCV-OCC-BRKR-NBR                       24035904
                   ,:DCLVTRNFRAU.RCV-CRSPN-NBR                          24036004
                   ,:DCLVTRNFRAU.ACAT-CNTL-ASTD-NBR                     24036104
                   ,:DCLVTRNFRAU.STTLM-ASCTD-DT                         24036204
                   ,:DCLVTRNFRAU.PRTCP-CONTRA-CD                        24036304
                   ,:DCLVTRNFRAU.CMNT-TXT                               24036404
                   ,:DCLVTRNFRAU.NSCC-NON-ADP-IND                       24036504
                   ,:DCLVTRNFRAU.CYCLE-CD                               24036604
                   ,:DCLVTRNFRAU.DAYS-STTS-QTY                          24036704
                   ,:DCLVTRNFRAU.STTLM-DT                               24036804
                   ,:DCLVTRNFRAU.PRCS-DT                                24036904
                   ,:DCLVTRNFRAU.STTS-CD                                24037004
                   ,:DCLVTRNFRAU.SYS-RJCT-RSN-CD                        24037104
                   ,:DCLVTRNFRAU.TRNFR-TYPE-RJC1-CD                     24037204
                   ,:DCLVTRNFRAU.ACCT-CD                                24037304
                   ,:DCLVTRNFRAU.ACCT-DLVR-NBR                          24037404
                   ,:DCLVTRNFRAU.ACCT-RCV-NBR                           24037504
                   ,:DCLVTRNFRAU.BRANCH-CD                              24037604
                   ,:DCLVTRNFRAU.CICS-TERM-ID-CD                        24037704
                   ,:DCLVTRNFRAU.PRGM-NM                                24037804
                   ,:DCLVTRNFRAU.UPDT-TMSTP                             24037904
                   ,:DCLVTRNFRAU.CRT-TMSTP)                             24038004
             END-EXEC.                                                  24038104
             MOVE +0 TO SQLCODE.                                        24038204
      *                                                                 24038304
LRM020 0912-DELETE-VTRNFRAU.                                            24038404
           MOVE ACAT05IO-CLIENT-NBR TO CLIENT-NBR OF DCLVTRNFRAU        24038504
           MOVE ACAT05IO-ACAT-CONTROL-NBR TO ACAT-CONTROL-NBR           24038604
                                                OF DCLVTRNFRAU          24038704
           EXEC SQL                                                     24038804
             DELETE FROM VTRNFRAU                                       24038904
                WHERE                                                   24039004
                     CLIENT_NBR       = :DCLVTRNFRAU.CLIENT-NBR         24039104
                 AND ACAT_CONTROL_NBR = :DCLVTRNFRAU.ACAT-CONTROL-NBR   24039204
                 AND TRANS_TYPE_CD    = 'A'                             24039304
             END-EXEC.                                                  24039404
             MOVE +0 TO SQLCODE.                                        24039504
ET0009*                                                                 24039604
ET0009*----------------------------------------------------------------*24040000
ET0009* UPDATE ACCT-FRZN-IND OF VTRNFR.                                 24050000
ET0009* ACCOUNT FREEZE IS FOUND BY ONLINE PROGRAM.                      24060000
ET0009* 1. ACCT-FRZN_CODE = 'O' MEANS ACCT FREEZE IS FOUND BY ONLINE PRG24070000
ET0009* 2. ACCT-FRZN_CODE = 'Y' MEANS ACCT FREEZE IS FOUND BY BATCH PRG 24080000
ET0009*----------------------------------------------------------------*24090000
ET0009 0940-UPDATE-ACCT-FRZN-IND.                                       24100000
           EXEC SQL                                                     24110000
                SET :WS-TIMESTAMP = CURRENT TIMESTAMP                   24120000
           END-EXEC.                                                    24130000
                                                                        24140000
           EXEC SQL                                                     24150000
              UPDATE VTRNFR                                             24160000
                 SET  ACCT_FRZN_IND = 'O'                               24170000
                     ,UPDT_TMSTP = :WS-TIMESTAMP                        24180000
                     ,PRGM_NM = 'ACAT05DA'                              24190000
                 WHERE                                                  24200000
                      CLIENT_NBR = :SV-CLIENT-NBR                       24210000
                      AND ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR          24220000
           END-EXEC.                                                    24230000
                                                                        24240000
           EVALUATE SQLCODE                                             24250000
               WHEN +0                                                  24260000
                    CONTINUE                                            24270000
               WHEN +100                                                24280000
                    MOVE 'VTRNFR TABLE NOT FOUND - FAIL TO UPDATE ACCT-F24290000
      -                  'RZN-IND OF VTRNFR'                            24300000
                      TO  WS-RETURN-MSG                                 24310000
               WHEN OTHER                                               24320000
                    MOVE SPACE TO ACAT05IO-VTRNFR-SW                    24330000
                    PERFORM 9000-WRITE-TO-CICS-LOG                      24340000
                    PERFORM 9500-RETURN-DB2-ERROR                       24350000
           END-EVALUATE.                                                24360000
ET0009 EJECT                                                            24370000
ET0004 1000-UPDT-VASSET.                                                24380000
           MOVE EIBTRMID TO WS-TRMID.                                   24390000
           EXEC SQL                                                     24400000
             UPDATE VASSET                                              24410000
               SET                                                      24420000
                  CAGE_TAG_NBR = :ACAT05IO-CAGE-TAG                     24430000
                 ,CICS_TERM_ID_CD = :WS-TRMID                           24440000
                 ,UPDT_TMSTP = CURRENT TIMESTAMP                        24450000
                 ,PRGM_NM = 'ACAT05DA'                                  24460000
               WHERE                                                    24470000
                  CLIENT_NBR = :SV-CLIENT-NBR                           24480000
                  AND ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR              24490000
                  AND ASSET_SEQ_NBR = :SV-ASSET-SEQ-NBR                 24500000
           END-EXEC.                                                    24510000
                                                                        24520000
           EVALUATE SQLCODE                                             24530000
               WHEN +0                                                  24540000
                    SET ACAT05IO-VASSET-UPDATED TO TRUE                 24550000
               WHEN +100                                                24560000
                    SET ACAT05IO-VASSET-NOT-FOUND TO TRUE               24570000
                    MOVE 'FAIL TO UPDATE VASSET CAGE TAG'               24580000
                      TO WS-RETURN-MSG                                  24590000
               WHEN OTHER                                               24600000
                    MOVE SPACE TO ACAT05IO-VASSET-SW                    24610000
                    PERFORM 9000-WRITE-TO-CICS-LOG                      24620000
                    PERFORM 9500-RETURN-DB2-ERROR                       24630000
           END-EVALUATE.                                                24640000
      /                                                                 24650000
ET0009*                                                                 24660000
ET0009*---------------------------------------------------------------* 24670000
ET0009*  SEARCH FROZEN CASH AND ASSET                                   24680000
ET0009*   (1) IF 'CASH OUT' IS FROZEN, SEARCH DEBIT  AMOUNT  TO FREEZE  24690000
ET0009*   (2) IF 'CASH IN'  IS FROZEN, SEARCH CREDIT AMOUNT  TO FREEZE  24700000
ET0009*   (3) IF 'SEC OUT'  IS FROZEN, SEARCH SHORT POSITION TO FREEZE  24710000
ET0009*   (4) IF 'SEC IN'   IS FROZEN, SEARCH LONG  POSITION TO FREEZE  24720000
ET0009*---------------------------------------------------------------* 24730000
ET0009 1100-SRCH-FRZN-ASSET.                                            24740000
                                                                        24750000
           MOVE SV-ACAT-CNTL-NBR TO WS-ACAT-CNTRL.                      24760000
           PERFORM 1710-OPEN-ASSET-CSR.                                 24770000
                                                                        24780000
           MOVE SPACE TO ACAT05IO-FREEZ-ASSET-FND-SW.                   24790000
           MOVE SPACE TO WS-EXIT-LOOP-SW.                               24800000
                                                                        24810000
           PERFORM UNTIL WS-EXIT-LOOP                                   24820000
              PERFORM 1720-FETCH-ASSET-CSR                              24830000
              IF SQLCODE = +0                                           24840000
                 IF STTLM-LCTN-CD OF DCLVASSET = '40'                   24850000
                    PERFORM 1110-CHECK-CASH-FREEZ                       24860000
                       THRU 1110-EXIT                                   24870000
                 ELSE                                                   24880000
                    PERFORM 1120-CHECK-SEC-FREEZ                        24890000
                       THRU 1120-EXIT                                   24900000
                 END-IF                                                 24910000
                 IF ACAT05IO-FREEZ-CASH-FOUND                           24920000
                 OR ACAT05IO-FREEZ-SEC-FOUND                            24930000
                    SET WS-EXIT-LOOP TO TRUE                            24940000
                 END-IF                                                 24950000
              ELSE                                                      24960000
              IF SQLCODE = +100                                         24970000
                 SET WS-EXIT-LOOP TO TRUE                               24980000
              ELSE                                                      24990000
                 SET WS-EXIT-LOOP TO TRUE                               25000000
                 PERFORM 9000-WRITE-TO-CICS-LOG                         25010000
                 PERFORM 1730-CLOSE-ASSET-CSR                           25020000
                 PERFORM 9500-RETURN-DB2-ERROR                          25030000
              END-IF END-IF                                             25040000
           END-PERFORM.                                                 25050000
                                                                        25060000
           PERFORM 1730-CLOSE-ASSET-CSR.                                25070000
ET0009*                                                                 25080000
ET0009*---------------------------------------------------------------* 25090000
ET0009*  CHECK CASH FREEZE.                                             25100000
ET0009*    (1)  IF FREEZ-CASH-OUT = 'Y', FIND DEBIT AMOUNT TO FREEZE    25110000
ET0009*    (2)  IF FREEZ-CASH-IN = 'Y', FIND CREDIT AMOUNT TO FREEZE    25120000
ET0009*---------------------------------------------------------------* 25130000
       1110-CHECK-CASH-FREEZ.                                           25140000
           IF ACAT05IO-FREEZ-CASH-OUT = 'Y'                             25150000
              IF STTLM-RSN-CD OF DCLVASSET = 'DEB '                     25160000
                 SET ACAT05IO-FREEZ-CASH-FOUND TO TRUE                  25170000
              END-IF                                                    25180000
           END-IF.                                                      25190000
                                                                        25200000
           IF ACAT05IO-FREEZ-CASH-IN = 'Y'                              25210000
              IF STTLM-RSN-CD OF DCLVASSET = 'CRED'                     25220000
                 SET ACAT05IO-FREEZ-CASH-FOUND TO TRUE                  25230000
              END-IF                                                    25240000
           END-IF.                                                      25250000
                                                                        25260000
       1110-EXIT.     EXIT.                                             25270000
ET0009*                                                                 25280000
ET0009*---------------------------------------------------------------* 25290000
ET0009*   CHECK SECURITY FREEZE.                                        25300000
ET0009*     (1)  IF FREEZ-SEC-OUT, FIND SHORT POSTION TO FREEZE.        25310000
ET0009*     (2)  IF FREEZ-SEC-IN , FIND LONG  POSTION TO FREEZE.        25320000
ET0009*---------------------------------------------------------------* 25330000
       1120-CHECK-SEC-FREEZ.                                            25340000
           IF STTLM-LCTN-CD OF DCLVASSET = '45'                         25350000
              GO TO 1120-EXIT                                           25360000
           END-IF.                                                      25370000
                                                                        25380000
           IF ACAT05IO-FREEZ-SEC-OUT = 'Y'                              25390000
              IF PSTN-CD OF DCLVASSET = 'S'                             25400000
                 SET ACAT05IO-FREEZ-SEC-FOUND TO TRUE                   25410000
              END-IF                                                    25420000
           END-IF.                                                      25430000
                                                                        25440000
           IF ACAT05IO-FREEZ-SEC-IN = 'Y'                               25450000
              IF PSTN-CD OF DCLVASSET = 'L'                             25460000
                 SET ACAT05IO-FREEZ-SEC-FOUND TO TRUE                   25470000
              END-IF                                                    25480000
           END-IF.                                                      25490000
                                                                        25500000
       1120-EXIT.   EXIT.                                               25510000
ET0007*                                                                 25520000
ET0007*---------------------------------------------------------------* 25530000
ET0007*     IS THERE A DUPLICATE MFC OR FRV TRANSFER?                 * 25540000
ET0007*---------------------------------------------------------------* 25550000
ET0007 1500-TRNFR-MFC-FRV-DUPE-CHECK.                                   25560000
           MOVE SPACE TO ACAT05IO-MFC-FRV-DUPE-IND.                     25570000
                                                                        25580000
           IF WS-FRV-MFC-CMPLT-IND > SPACE                              25590000
              MOVE 'Y' TO ACAT05IO-MFC-FRV-DUPE-IND                     25600000
              GO TO 1500-EXIT                                           25610000
           END-IF.                                                      25620000
                                                                        25630000
           MOVE WS-ACAT-CONTROL-NBR   TO WS-ACAT-CNTRL.                 25640000
           MOVE WS-ACCT-RCV-NBR (1:8)  TO WS-RCV-BR-AC.                 25650000
           MOVE ALL '%'                TO WS-RCV-BR-AC-MASK.            25660000
           MOVE WS-RCV-BR-AC-WITH-MASK TO WS-RCV-BR-AC-NBR.             25670000
                                                                        25680000
           PERFORM 1520-GET-ASSET-AND-SAVE.                             25690000
                                                                        25700000
           EXEC SQL                                                     25710000
               OPEN TRNFR_CSR                                           25720000
           END-EXEC.                                                    25730000
                                                                        25740000
           MOVE SPACE TO WS-TRANSFER-FOUND-SW                           25750000
                         WS-DUPE-FOUND-SW.                              25760000
           PERFORM UNTIL ACAT05IO-MFC-FRV-DUPE-IND = 'Y'                25770000
                      OR WS-TRANSFER-NOT-FOUND                          25780000
              PERFORM 1510-FETCH-TRNFR-CSR                              25790000
              IF WS-TRANSFER-FOUND                                      25800000
                 IF ACAT-CONTROL-NBR OF DCLVTRNFR = WS-ACAT-CONTROL-NBR 25810000
                    CONTINUE                                            25820000
                 ELSE                                                   25830000
                    MOVE ACAT-CONTROL-NBR OF DCLVTRNFR TO WS-ACAT-CNTRL 25840000
                    PERFORM 1600-ASSET-MFC-FRV-DUPE-CHECK               25850000
                    IF WS-DUPE-FOUND                                    25860000
                       MOVE 'Y' TO ACAT05IO-MFC-FRV-DUPE-IND            25870000
                    END-IF                                              25880000
                 END-IF                                                 25890000
              END-IF                                                    25900000
           END-PERFORM.                                                 25910000
                                                                        25920000
           EXEC SQL                                                     25930000
               CLOSE TRNFR_CSR                                          25940000
           END-EXEC.                                                    25950000
       1500-EXIT.     EXIT.                                             25960000
       EJECT                                                            25970000
ET0007*                                                                 25980000
ET0007*---------------------------------------------------------------* 25990000
ET0007*    FETCH TRANSFER CURSOR FOR DUPE MFC/FRV TRANSFER SEARCH     * 26000000
ET0007*---------------------------------------------------------------* 26010000
ET0007 1510-FETCH-TRNFR-CSR.                                            26020000
           EXEC SQL                                                     26030000
               FETCH                                                    26040000
                    TRNFR_CSR                                           26050000
                INTO                                                    26060000
                    :DCLVTRNFR.CLIENT-NBR                               26070000
                   ,:DCLVTRNFR.BRANCH-CD                                26080000
                   ,:DCLVTRNFR.ACCT-CD                                  26090000
                   ,:DCLVTRNFR.RR-CD                                    26100000
                   ,:DCLVTRNFR.ACAT-CONTROL-NBR                         26110000
                   ,:DCLVTRNFR.TRNFR-TYPE-CD                            26120000
                   ,:DCLVTRNFR.STTS-CD                                  26130000
                   ,:DCLVTRNFR.DAYS-STTS-QTY                            26140000
                   ,:DCLVTRNFR.RCV-NBR                                  26150000
                   ,:DCLVTRNFR.DLVR-NBR                                 26160000
                   ,:DCLVTRNFR.ACCT-DLVR-NBR                            26170000
                   ,:DCLVTRNFR.ACCT-RCV-NBR                             26180000
                   ,:DCLVTRNFR.RCV-CUST-NM                              26190000
                   ,:DCLVTRNFR.RCV-SS-PRIM-NBR                          26200000
                   ,:DCLVTRNFR.RCV-SS-SCNDY-NBR                         26210000
                   ,:DCLVTRNFR.RCV-ACCT-TYPE-CD                         26220000
                   ,:DCLVTRNFR.DSTBN-SIDE-CD                            26230000
                   ,:DCLVTRNFR.NSCC-PEND-CD                             26240000
                   ,:DCLVTRNFR.FRV-MFC-CMPLT-IND                        26250000
ET0009             ,:DCLVTRNFR.ACCT-FRZN-IND                            26260000
            END-EXEC.                                                   26270000
                                                                        26280000
            IF SQLCODE = +0                                             26290000
               SET WS-TRANSFER-FOUND TO TRUE                            26300000
            ELSE                                                        26310000
            IF SQLCODE = +100                                           26320000
               SET WS-TRANSFER-NOT-FOUND TO TRUE                        26330000
            ELSE                                                        26340000
               SET WS-TRANSFER-NOT-FOUND TO TRUE                        26350000
               PERFORM 9000-WRITE-TO-CICS-LOG                           26360000
               PERFORM 9500-RETURN-DB2-ERROR                            26370000
            END-IF.                                                     26380000
       EJECT                                                            26390000
ET0007*                                                                 26400000
ET0007*---------------------------------------------------------------* 26410000
ET0007*          GET ASSET AND SAVE IN WORKING STORAGE TABLE          * 26420000
ET0007*---------------------------------------------------------------* 26430000
       1520-GET-ASSET-AND-SAVE.                                         26440000
           PERFORM 1710-OPEN-ASSET-CSR.                                 26450000
                                                                        26460000
           MOVE 0  TO SUB-AST.                                          26470000
           MOVE SPACE TO WS-EXIT-LOOP-SW                                26480000
                         WS-ASSET-TBL-AREA.                             26490000
           PERFORM UNTIL WS-EXIT-LOOP                                   26500000
              PERFORM 1720-FETCH-ASSET-CSR                              26510000
              IF SQLCODE = +0                                           26520000
                 IF STTLM-LCTN-CD OF DCLVASSET = '10' OR '15' OR        26530000
                                                 '20' OR '25' OR '50'   26540000
                     ADD 1 TO SUB-AST                                   26550000
                     IF SUB-AST > MAX-TBL-CNT                           26560000
                        SET WS-EXIT-LOOP TO TRUE                        26570000
                     ELSE                                               26580000
                        MOVE ISIN-SEC-ISSUE-CD OF DCLVASSET             26590000
                          TO WS-ASSET-TBL (SUB-AST)                     26600000
                     END-IF                                             26610000
                 END-IF                                                 26620000
              ELSE                                                      26630000
              IF SQLCODE = +100                                         26640000
                 SET WS-EXIT-LOOP TO TRUE                               26650000
              ELSE                                                      26660000
                 SET WS-EXIT-LOOP TO TRUE                               26670000
                 PERFORM 9000-WRITE-TO-CICS-LOG                         26680000
                 PERFORM 1730-CLOSE-ASSET-CSR                           26690000
                 PERFORM 9500-RETURN-DB2-ERROR                          26700000
              END-IF END-IF                                             26710000
           END-PERFORM.                                                 26720000
                                                                        26730000
           PERFORM 1730-CLOSE-ASSET-CSR.                                26740000
ET0007*                                                                 26750000
ET0007*---------------------------------------------------------------* 26760000
ET0007*          DUPLICATE ASSET FOUND IN MFC OR FRV TRANSFER?        * 26770000
ET0007*---------------------------------------------------------------* 26780000
ET0007 1600-ASSET-MFC-FRV-DUPE-CHECK.                                   26790000
           MOVE SPACE TO WS-EXIT-LOOP-SW.                               26800000
                                                                        26810000
           PERFORM 1710-OPEN-ASSET-CSR.                                 26820000
           IF SQLCODE = +100                                            26830000
              SET WS-EXIT-LOOP TO TRUE                                  26840000
           END-IF.                                                      26850000
                                                                        26860000
           PERFORM UNTIL WS-EXIT-LOOP                                   26870000
              PERFORM 1720-FETCH-ASSET-CSR                              26880000
              IF SQLCODE = +0                                           26890000
                 IF STTLM-LCTN-CD OF DCLVASSET = '10' OR '15' OR        26900000
                                                 '20' OR '25' OR '50'   26910000
                    IF WS-ASSET-TBL (SUB-AST) > SPACE                   26920000
                       PERFORM 1610-COMPARE-ASSETS                      26930000
                       IF WS-DUPE-FOUND                                 26940000
                          SET WS-EXIT-LOOP  TO TRUE                     26950000
                       END-IF                                           26960000
                    END-IF                                              26970000
                 END-IF                                                 26980000
              ELSE                                                      26990000
              IF SQLCODE = +100                                         27000000
                 SET WS-EXIT-LOOP TO TRUE                               27010000
              ELSE                                                      27020000
                 SET WS-EXIT-LOOP TO TRUE                               27030000
                 PERFORM 9000-WRITE-TO-CICS-LOG                         27040000
                 PERFORM 1730-CLOSE-ASSET-CSR                           27050000
                 PERFORM 9500-RETURN-DB2-ERROR                          27060000
              END-IF END-IF                                             27070000
           END-PERFORM.                                                 27080000
                                                                        27090000
           PERFORM 1730-CLOSE-ASSET-CSR.                                27100000
ET0007*                                                                 27110000
ET0007*---------------------------------------------------------------* 27120000
ET0007*       COMPARE ASSETS TO CHECK IF MATCH                        * 27130000
ET0007*---------------------------------------------------------------* 27140000
ET0007 1610-COMPARE-ASSETS.                                             27150000
           MOVE 0 TO SUB-AST.                                           27160000
           PERFORM UNTIL SUB-AST > MAX-TBL-CNT OR WS-DUPE-FOUND         27170000
              ADD 1 TO SUB-AST                                          27180000
              IF WS-ASSET-TBL (SUB-AST) = SPACE                         27190000
                 COMPUTE SUB-AST = MAX-TBL-CNT + 1                      27200000
              ELSE                                                      27210000
              IF WS-ASSET-TBL (SUB-AST) = ISIN-SEC-ISSUE-CD OF DCLVASSET27220000
                 SET WS-DUPE-FOUND TO TRUE                              27230000
              END-IF                                                    27240000
              END-IF                                                    27250000
           END-PERFORM.                                                 27260000
       EJECT                                                            27270000
ET0007*                                                                 27280000
ET0007*---------------------------------------------------------------* 27290000
ET0007*       OPEN ASSET-CSR CURSOR TABLE                             * 27300000
ET0007*---------------------------------------------------------------* 27310000
ET0007 1710-OPEN-ASSET-CSR.                                             27320000
            EXEC SQL                                                    27330000
                OPEN ASSET_CSR                                          27340000
            END-EXEC.                                                   27350000
                                                                        27360000
            IF SQLCODE = 0 OR +100                                      27370000
               CONTINUE                                                 27380000
            ELSE                                                        27390000
               PERFORM 9000-WRITE-TO-CICS-LOG                           27400000
               PERFORM 9500-RETURN-DB2-ERROR                            27410000
            END-IF.                                                     27420000
ET0007*                                                                 27430000
ET0007*---------------------------------------------------------------* 27440000
ET0007*    FETCH ASSET CURSOR FOR DUPE MFC/FRV ASSET SEARCH           * 27450000
ET0007*---------------------------------------------------------------* 27460000
ET0007 1720-FETCH-ASSET-CSR.                                            27470000
           EXEC SQL                                                     27480000
               FETCH                                                    27490000
                   ASSET_CSR                                            27500000
                INTO                                                    27510000
                   :DCLVASSET.CLIENT-NBR                                27520000
                  ,:DCLVASSET.ACAT-CONTROL-NBR                          27530000
                  ,:DCLVASSET.ASSET-SEQ-NBR                             27540000
                  ,:DCLVASSET.SBMTG-PRTCP-NBR                           27550000
                  ,:DCLVASSET.TRANS-TYPE-CD                             27560000
                  ,:DCLVASSET.ASSET-PRC-CTGY-CD                         27570000
                  ,:DCLVASSET.STTLM-LCTN-CD                             27580000
                  ,:DCLVASSET.STTLM-RSN-CD                              27590000
                  ,:DCLVASSET.ISIN-CNTRY-CD                             27600000
                  ,:DCLVASSET.ISIN-SEC-ISSUE-CD                         27610000
                  ,:DCLVASSET.ISIN-SEC-CDG-CD                           27620000
                  ,:DCLVASSET.ASSET-QTY                                 27630000
                  ,:DCLVASSET.ASSET-PCT                                 27640000
                  ,:DCLVASSET.PSTN-CD                                   27650000
                  ,:DCLVASSET.ISO-CRNCY-CD                              27660000
                  ,:DCLVASSET.ASSET-AMT                                 27670000
                  ,:DCLVASSET.CSH-MGN-SHRT-CD                           27680000
                  ,:DCLVASSET.WHI-CD                                    27690000
                  ,:DCLVASSET.TRNFR-TYPE-RSN-CD                         27700000
                  ,:DCLVASSET.NSCC-PEND-CD                              27710000
                  ,:DCLVASSET.FAIL-SENT-CAGE-IND                        27720000
                  ,:DCLVASSET.FAIL-OPEN-CAGE-IND                        27730000
                  ,:DCLVASSET.SECURITY-ADP-NBR                          27740000
                  ,:DCLVASSET.RCL-SENT-NSCC-IND                         27750000
                  ,:DCLVASSET.FRV-SENT-NSCC-IND                         27760000
                  ,:DCLVASSET.TRNFR-TYPE-CD                             27770000
           END-EXEC.                                                    27780000
ET0007*                                                                 27790000
ET0007*---------------------------------------------------------------* 27800000
ET0007*      CLOSE ASSET-CSR CURSOR TABLE                             * 27810000
ET0007*---------------------------------------------------------------* 27820000
ET0007 1730-CLOSE-ASSET-CSR.                                            27830000
           EXEC SQL                                                     27840000
               CLOSE ASSET_CSR                                          27850000
           END-EXEC.                                                    27860000
       EJECT                                                            27870000
       ABENDED.                                                         27880000
     ***   EXEC CICS ASSIGN ABCODE(WS-ABCODE) END-EXEC.                 27890000
     ***   MOVE WS-ABEND-MESSAGE TO BHST-MESSAGE.                       27900000
     ***   MOVE '9999' TO BHST-RETURN-CODE.                             27910000
     ***                                                                27920000
           EXEC CICS RETURN END-EXEC.                                   27930000
                                                                        27940000
      *==============================                                   27950000
       9000-WRITE-TO-CICS-LOG.                                          27960000
      *==============================                                   27970000
     ***   MOVE SQLCODE TO BHST-SQLCODE.                                27980000
           IF SQLCODE = -803                                            27990000
               CONTINUE                                                 28000000
           ELSE                                                         28010000
               MOVE SPACES             TO WS-ERRL-DATA                  28020000
               SET WRITE-ERROR-TO-LOG  TO TRUE                          28030000
               MOVE 'ACA5'             TO CALLING-TRAN-ID               28040000
               MOVE 'ACAT05DA'         TO CALLING-PROGRAM-ID            28050000
               MOVE SQLCA              TO SQLCA-AREA                    28060000
               EXEC CICS LINK PROGRAM ('FPDB2LOG')                      28070000
                     COMMAREA (WS-ERRL-DATA)                            28080000
                     LENGTH (LENGTH OF WS-ERRL-DATA)                    28090000
                     NOHANDLE                                           28100000
               END-EXEC                                                 28110000
           END-IF.                                                      28120000
     ***   EXEC CICS RETURN END-EXEC.                                   28130000
                                                                        28140000
       9500-RETURN-DB2-ERROR.                                           28150000
           EXEC CICS SYNCPOINT ROLLBACK END-EXEC.                       28160000
           SET ACAT05IO-DB2-ERROR TO TRUE                               28170000
           MOVE SQLCAID TO ACAT05IO-SQLCAID                             28180000
           MOVE SQLCODE TO ACAT05IO-SQLCODE                             28190000
           MOVE SQLERRM TO ACAT05IO-SQLERRM                             28200000
           EXEC CICS RETURN END-EXEC.                                   28210000
      ************************** BOTTOM OF DATA ************************28220000
      *           AND (ACCT_ACTIVITY_IND = 'Y'  OR                      28230000
      *                ACCT_ORDERS_IND   = 'Y'  OR                      28240000
      *                ACCT_RJCT_RSBM_IND = 'Y' OR                      28250000
      *                ACCT_DB_BAL_T1_IND = 'Y' OR                      28260000
      *                ACCT_MRGN_DB_IND  = 'Y'  OR                      28270000
      *                ACCT_SHRT_PSTN_IND = 'Y' OR                      28280000
      *                ACCT_SEC_RSTRD_IND = 'Y' OR                      28290000
      *                ACCT_AST_EXCS_IND = 'Y'  OR                      28300000
      *                ACCT_OPTN_PSTN_IND = 'Y' OR                      28310000
      *                ACCT_LTD_PRTNR_IND = 'Y' OR                      28320000
      *                ACCT_TIN_MSMTH_IND = 'Y' OR                      28330000
      *                ACCT_DPLCT_TRN_IND = 'Y' OR                      28340000
      *                ACCT_CUST_70_IND  = 'Y'  OR                      28350000
      *                ACCT_QULFD_PLN_IND = 'Y' OR                      28360000
      *                ACCT_MNGD_IND     = 'Y'  OR                      28370000
      *                ACCT_PRVT_RNG_IND = 'Y'  OR                      28380000
      *                ACCT_BRKR_TIF_IND = 'Y'  OR                      28390000
      *                NSCC_NON_ADP_IND  = 'Y' )                        28400000
                                                                        28410000
