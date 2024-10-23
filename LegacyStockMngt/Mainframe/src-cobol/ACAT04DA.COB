000001* PDX    - ACAT04DA C0308881 03/07/11 08:58:52 TBLAMUR            00001000
000001* LRM012 SSR 75920 CORRECT REJECT LOOKUP WHEN DUPE TRANSFERS      00001101
000001*    EXIST FOR THIS BRANCH/ACCOUNT.                               00001200
000001* PDX    - ACAT04DA C0302589 10/21/10 14:48:40 TBLAMUR            00001300
000001* LRM011 SSR 70666 CREATE AUDIT ROW IN VTRNFRAU FOR CLIENT        00001400
000001*    ACCEPT.  THIS WILL BE REPORTED IN CAT761.                    00001500
000001* PDX    - ACAT04DA C0287777 11/03/09 15:58:48 TBLAMUR            00001600
000001* LRM010 SSR 65670 SUB PENNY PRICE MSG.                           00001700
000001* PDX    - ACAT04DA C0285316 08/28/09 11:17:16 TBLAMUR            00001800
000001* LRM009 SSR 64317 ADD NET DEBIT BAL AS AN EXCEPTION              00001900
000001* PDX    - ACAT04DA C0277094 04/06/09 10:55:30 TBDOJUN            00002000
000001* DJ0001 SSR 61684 AUCTION RATE SECURITY MSG.                     00002100
000001* LRM008 WIPE ACK_IND TO CAUSE ASCENDIS CLIENT UPD TO GO TO NSCC. 00002200
000001* PDX    - ACAT04DA C0263391 05/27/08 09:06:24 TBLAMUR            00003000
000001* LRM007 SSR 55766 ASCENDIS INTERFACE. WIPE ACK_IND ON UPDATE.    00004000
000001* PDX    - ACAT04DA C0245632 03/01/07 11:08:38 TBLAMUR            00005000
      * LRM006 SSR 49202 CONTINUED, RECOMPILE DUE TO ACAT05IO COPY CHG. 00006000
000001* PDX    - ACAT04DA C0240732 12/14/06 08:20:15 TBLAMUR            00007000
      * LRM006 SSR 49202 ADD REGT AND 90 DAY RESTRICTION EXCP POPUP MSG 00008000
000001* PDX    - ACAT04DA C0238544 08/24/06 10:55:15 TBLAMUR            00009000
      * LRM005 SSR 45145 ADD REJECT TOO LATE WARNING                    00010000
000001* PDX    - ACAT04DA C0231507 07/07/06 14:00:53 TBEDTAK            00020000
      * ET0003 SSR 40661 - RETAIN USER ID OF INITIATOR.                 00030000
      * ET0002 SSR 45744 - BLOCK ENTRY BASED ON ACCOUNT FREEZE.         00040000
000001* PDX    - ACAT04DA C0215192 12/29/04 13:54:08 TBEDTAK            00050000
      * ET0001 SSR 40042 - DB2 TBL KEY CHANGE WITH NEW TBL NAME         00060000
000001* PDX    - ACAT04DA C0182233 02/14/03 11:56:03 TBLAMUR            00070000
000001* PDX    - ACAT04DA C0158587 06/25/01 16:16:45 TBDOJUN            00080000
000001* PDX    - ACAT04DA C0126743 06/07/99 09:03:56 TBTIKUO            00090000
000001* PDX    - ACAT04DA C0123136 04/07/99 08:56:53 TBTIKUO            00100000
000001* PDX    - ACAT04DA C0121426 02/06/99 14:22:22 TBEDTAK            00110000
000001* PDX    - ACAT04DA C0120812 02/04/99 18:54:32 TBEDTAK            00120000
000001* PDX    - ACAT04DA C0121190 02/04/99 17:30:52 TBTIKUO            00130000
000001* PDX    - ACAT04DA C0120812 01/25/99 16:48:32 TBTIKUO            00140000
000001* PDX    - ACAT04DA C0119861 01/20/99 10:32:09 TBTIKUO            00150000
000001* PDX    - ACAT04DA C0119290 01/07/99 15:43:18 TBTIKUO            00160000
000001* PDX    - ACAT04DA C0117770 11/16/98 15:47:57 TBTIKUO            00170000
000001* PDX    - ACAT04DA C0112193 11/13/98 16:17:23 TBLAMUR            00180000
      *                                                                 00190000
       IDENTIFICATION DIVISION.                                         00200000
       PROGRAM-ID.    ACAT04DA.                                         00210000
       AUTHOR.        TINA KUO.                                         00220000
       DATE-WRITTEN.                                                    00230000
       DATE-COMPILED.                                                   00240000
      *---------------------------------------------------------------* 00250000
      *                                                               * 00260000
      *   THIS IS THE ACATS I/O MODULE CALLED BY ACAT04RS,            * 00270000
      *   IT HANDLES DB2 FUNCTIONS OF TABLE ACAT_TRNF, ACAT_INIT_TRNF * 00280000
      *                                                               * 00290000
      *---------------------------------------------------------------* 00300000
      * 11/13/98 -- ADD LOGIC TO PERFORM SEARCH ENGINE FUNCTION       * 00310000
      * 11/06/02 -- REMOVE SELECT VTRNFR INTO GROUP ITEM              * 00320000
      ***************************************************************** 00330000
       ENVIRONMENT DIVISION.                                            00340000
                                                                        00350000
       DATA DIVISION.                                                   00360000
                                                                        00370000
       WORKING-STORAGE SECTION.                                         00380000
       COPY PDXIDCOB.                                                   00390000
       01  FILLER                          PIC X(60)                    00400000
           VALUE 'ACAT04DA WORKING STORAGE BEGINS HERE'.                00410000
      *                                                                 00420000
092700*77  TWA-SIZE                         PIC S9(4) COMP.             00430000
092700 77  WS-CICS-RESPONSE                 PIC S9(8) COMP   VALUE +0.  00440000
092700 77  WS-COUNT                         PIC S9(9) COMP   VALUE +0.  00450000
092700 77  WS-ISRT-RETRY-COUNT              PIC S9(9) COMP   VALUE +0.  00460000
092700 77  WS-UPDT-RETRY-COUNT              PIC S9(9) COMP   VALUE +0.  00470000
092700 77  WS-EIBCALEN                      PIC S9(8) COMP.             00480000
092700 77  WS-PHSCL-SEQ-NBR                 PIC S9(4) COMP   VALUE +1.  00490000
       01  WS-ACAT04DA-WORK-AREA.                                       00500000
           05  WS-FIRST-TIME-SW             PIC X(01) VALUE SPACE.      00510000
               88 FIRST-TIME                         VALUE 'Y'.         00520000
           05  WS-VTRNFR-AREA.                                          00530000
               10 SEARCH-VTRNFR-SW          PIC X(01) VALUE SPACE.      00540000
                  88 SEARCH-VTRNFR                   VALUE 'Y'.         00550000
               10 FOUND-VTRNFR-SW           PIC X(01) VALUE SPACE.      00560000
                  88  VTRNFR-FOUND                   VALUE 'Y'.         00570000
                  88  VTRNFR-NOT-FOUND               VALUE 'N'.         00580000
           05  WS-VINITRNF-AREA.                                        00590000
               10 SEARCH-VINITRNF-SW        PIC X(01) VALUE SPACE.      00600000
                  88 SEARCH-VINITRNF                 VALUE 'Y'.         00610000
               10 FOUND-VINITRNF-SW         PIC X(01) VALUE SPACE.      00620000
                  88  VINITRNF-FOUND                 VALUE 'Y'.         00630000
                  88  VINITRNF-NOT-FOUND             VALUE 'N'.         00640000
           05  WS-CURRENT-VTRNFR-SW            PIC X.                   00650000
               88  CURRENT-VTRNFR-FOUND           VALUE 'Y'.            00660000
               88  CURRENT-VTRNFR-NOT-FOUND       VALUE 'N'.            00670000
12/31      05  CASH-BALANCE-WORK-AREA.                                  00680000
01/05          10  WS-BAL                   USAGE COMP-2.               00690000
               10  SV-BAL01                 PIC S9(15)V9(2) COMP-3.     00700000
               10  SV-BAL02                 PIC S9(15)V9(2) COMP-3.     00710000
               10  SV-BAL05                 PIC S9(15)V9(2) COMP-3.     00720000
               10  SV-SMA                   PIC S9(15)V9(2) COMP-3.     00730000
               10  SV-BAL01C                PIC S9(15)V9(2) COMP-3.     00740000
               10  SV-BAL01D                PIC S9(15)V9(2) COMP-3.     00750000
               10  SV-BAL02C                PIC S9(15)V9(2) COMP-3.     00760000
               10  SV-BAL02D                PIC S9(15)V9(2) COMP-3.     00770000
               10  SV-BAL05C                PIC S9(15)V9(2) COMP-3.     00780000
               10  SV-BAL05D                PIC S9(15)V9(2) COMP-3.     00790000
12/31          10  SV-BAL01-STTLM-RSN-CD    PIC X(04)   VALUE SPACES.   00800000
12/31          10  SV-BAL02-STTLM-RSN-CD    PIC X(04)   VALUE SPACES.   00810000
12/31          10  SV-BAL05-STTLM-RSN-CD    PIC X(04)   VALUE SPACES.   00820000
01/05          10  WS-STTLM-LCTN-CD         PIC X(02)   VALUE SPACES.   00830000
01/05          10  WS-CSH-MGN-SHRT-CD       PIC X(01)   VALUE SPACES.   00840000
01/05          10  WS-PSTN-CD               PIC X(01)   VALUE SPACES.   00850000
           05  WS-TRANS-TYPE-CD             PIC X(01).                  00860000
           05  WS-TRNFR-RJCT-CD             PIC X(02).                  00870000
           05  WS-TIMESTAMP                 PIC X(26).                  00880000
      **   05  WS-VINITRNF-CMNT             PIC X(120).                 00890000
      ******************************************************************00900000
           05  TSQ-WORK-AREA.                                           00910000
               10  TSQ-NAME.                                            00920000
                   15  TERM-ID             PIC X(04).                   00930000
                   15  TRAN-ID             PIC X(04).                   00940000
               10  ITEM-NUM                PIC S9(04)  COMP VALUE +0.   00950000
               10  MAX-ITEM-NUM            PIC S9(04)  COMP VALUE +0.   00960000
      ******************************************************************00970000
       01  WS-IO-AREA.                                                  00980000
           05  WS-SAVE-KEY.                                             00990000
               10  SV-CLIENT-NBR            PIC X(04).                  01000000
               10  SV-ACAT-CNTL-NBR         PIC X(14).                  01010000
               10  SV-BRANCH-CD             PIC X(03).                  01020000
               10  SV-ACCT-CD               PIC X(05).                  01030000
               10  SV-RR-CD                 PIC X(03).                  01040000
               10  SV-BRKR                  PIC X(04).                  01050000
               10  SV-TFR                   PIC X(03).                  01060000
               10  SV-RD                    PIC X(01).                  01070000
               10  SV-STCD                  PIC X(03).                  01080000
               10  SV-SV                    PIC X(06).                  01090000
               10  SV-ASSET-SEQ-NBR         PIC S9(4) COMP.             01100000
ET0002     05  WS-ACCT-FREEZ-PROCESS        PIC X(01).                  01110000
ET0002     05  WS-ACCT-FREEZ-TYPE           PIC X(01).                  01120000
ET0003     05  WS-SNON-ID                   PIC X(04).                  01130000
ET0003     05  WS-USER-NAME                 PIC X(20).                  01140000
ET0003     05  WS-USER-ID                   PIC X(08).                  01150000
ET0003     05  WS-NET-NAME                  PIC X(08).                  01160000
           05  WS-ACAT04DA-IO.                                          01170000
               10 WS-SCREEN-IND                 PIC X(01).              01180000
               10 WS-CLIENT-NBR                 PIC X(04).              01190000
               10 WS-ACAT-CONTROL-NBR           PIC X(14).              01200000
               10 WS-BRANCH-CD                  PIC X(03).              01210000
               10 WS-ACCT-CD                    PIC X(05).              01220000
               10 WS-RR-CD                      PIC X(03).              01230000
               10 WS-TFR-TYPE                   PIC X(03).              01240000
               10 WS-STTS-CD                    PIC X(03).              01250000
01/08          10 WS-DAYS                       PIC S9(04) COMP.        01260000
               10 WS-RCV-NBR                    PIC X(04).              01270000
               10 WS-DLVR-NBR                   PIC X(04).              01280000
               10 WS-ACCT-DLVR-NBR              PIC X(20).              01290000
               10 WS-ACCT-RCV-NBR               PIC X(20).              01300000
               10 WS-RCV-CUST-NM                PIC X(60).              01310000
               10 WS-RCV-SS-PRIM-NBR            PIC X(09).              01320000
               10 WS-RCV-SS-SCNDY-NBR           PIC X(09).              01330000
               10 WS-RCV-ACCT-TYPE-CD           PIC X(02).              01340000
               10 WS-INIT-TRANS-TYPE-CD         PIC X(01).              01350000
               10 WS-VINITRNF-NSCC-PEND-CD      PIC X(01).              01360000
               10 WS-VTRNFR-NSCC-PEND-CD        PIC X(01).              01370000
               10 WS-STTLM-RSN-CD               PIC X(01).              01380000
               10 WS-STTLM-DT                   PIC X(10).              01390000
               10 WS-DSTBN-SIDE-CD              PIC X(01).              01400000
               10 WS-VTRNFR-CMNT                PIC X(120).             01410000
06/04          10 WS-ALERT-IND                  PIC X(1).               01420000
01/05          10 WS-BAL01                      PIC S9(15)V9(2) COMP-3. 01430000
               10 WS-BAL01-STTLM-RSN-CD         PIC X(04).              01440000
01/05          10 WS-BAL02                      PIC S9(15)V9(2) COMP-3. 01450000
12/31          10 WS-BAL02-STTLM-RSN-CD         PIC X(04).              01460000
01/05          10 WS-BAL05                      PIC S9(15)V9(2) COMP-3. 01470000
12/31          10 WS-BAL05-STTLM-RSN-CD         PIC X(04).              01480000
01/05          10 WS-SMA                        PIC S9(15)V9(2) COMP-3. 01490000
               10 WS-RETURN-MSG                 PIC X(70).              01500000
           05  WS-ACAT04DA-EXCEPTIONS.                                  01510000
               10 FILLER                           PIC X(1).            01520000
               10 WS-TS-EXCEPTIONS.                                     01530000
                  15 WS-ACCT-ACTIVITY-IND          PIC X(1).            01540000
                  15 WS-ACCT-ORDERS-IND            PIC X(1).            01550000
                  15 WS-ACCT-RJCT-RSBM-IND         PIC X(1).            01560000
                  15 WS-ACCT-DB-BAL-T1-IND         PIC X(1).            01570000
                  15 WS-ACCT-MRGN-DB-IND           PIC X(1).            01580000
                  15 WS-ACCT-SHRT-PSTN-IND         PIC X(1).            01590000
                  15 WS-ACCT-SEC-RSTRD-IND         PIC X(1).            01600000
                  15 WS-ACCT-AST-EXCS-IND          PIC X(1).            01610000
                  15 WS-ACCT-OPTN-PSTN-IND         PIC X(1).            01620000
                  15 WS-ACCT-LTD-PRTNR-IND         PIC X(1).            01630000
                  15 WS-ACCT-TIN-MSMTH-IND         PIC X(1).            01640000
                  15 WS-ACCT-DPLCT-TRN-IND         PIC X(1).            01650000
                  15 WS-ACCT-CUST-70-IND           PIC X(1).            01660000
                  15 WS-ACCT-QULFD-PLN-IND         PIC X(1).            01670000
                  15 WS-ACCT-MNGD-IND              PIC X(1).            01680000
                  15 WS-ACCT-PRVT-RNG-IND          PIC X(1).            01690000
                  15 WS-ACCT-BRKR-TIF-IND          PIC X(1).            01700000
                  15 WS-NSCC-NON-ADP-IND           PIC X(1).            01710000
                  15 WS-ACCT-COMMENTS-IND          PIC X(1).            01720000
ET0002            15 WS-ACCT-FRZN-IND              PIC X(1).            01730000
LRM005            15 WS-STTLM-TM-CD                PIC X(1).            01740000
LRM006            15 WS-RSTR-TRD-90-DY-IND         PIC X(1).            01750000
LRM006            15 WS-REG-T-IND                  PIC X(1).            01760000
DJ0001            15 WS-AUCTION-RATE-IND           PIC X(1).            01770000
LRM010            15 WS-SUB-PENNY-PRICE-IND        PIC X(1).            01780000
           05 WS-ACAT04DA-INPUT.                                        01790000
              10 WS-M4NEXT                         PIC X(01).           01800000
              10 WS-M4ACCPT                        PIC X(01).           01810000
              10 WS-M4ACCEL                        PIC X(01).           01820000
              10 WS-M4REJ                          PIC X(01).           01830000
              10 WS-M4REJC                         PIC X(01).           01840000
              10 WS-VINITRNF-CMNT                  PIC X(120).          01850000
           05 WS-TRLM-INPUT.                                            01860000
              10 WS-MBR                            PIC X(03).           01870000
              10 WS-MAC                            PIC X(05).           01880000
              10 WS-MRR                            PIC X(03).           01890000
              10 WS-MCBRKR                         PIC X(04).           01900000
              10 WS-MTFR                           PIC X(03).           01910000
              10 WS-MRD                            PIC X(01).           01920000
              10 WS-MSTAT                          PIC X(03).           01930000
              10 WS-MSD                            PIC X(06).           01940000
      ******************************************************************01950000
       01  WS-ABEND-MESSAGE.                                            01960000
           05  FILLER                      PIC X(24) VALUE              01970000
             'ACAT04DA ABENDED ====> '.                                 01980000
           05  WS-ABCODE                   PIC X(04) VALUE SPACES.      01990000
                                                                        02000000
       01  WS-ERRL-DATA.                                                02010000
           05  REQUEST-TYPE                PIC X(01).                   02020000
               88  WRITE-ERROR-TO-LOG          VALUE 'W'.               02030000
           05  CALLING-TRAN-ID             PIC X(04).                   02040000
           05  CALLING-PROGRAM-ID          PIC X(08).                   02050000
           05  SQLCA-AREA                  PIC X(136).                  02060000
       01  WS-WORK-AREA.                                                02070000
           05  WS-SEC-DESC                 PIC X(30).                   02080000
           05  SUB                         PIC S9(04) COMP.             02090000
TCK        05  WS-FETCH-SW                 PIC X(01)  VALUE ' '.        02100000
TCK            88  CONTINUE-FETCH          VALUE 'Y'.                   02110000
TCK            88  STOP-FETCH              VALUE 'N'.                   02120000
TCK        05  WS-SHOW-DATA                PIC X(01).                   02130000
               88  SHOW-CURRENT-DATA       VALUE '1'.                   02140000
               88  SHOW-PREVIOUS-DATA      VALUE '2'.                   02150000
      /                                                                 02160000
       COPY ACATSRCH.                                                   02170000
       EJECT                                                            02180000
       COPY SECLINKC.                                                   02190000
       EJECT                                                            02200000
           EXEC SQL                                                     02210000
                INCLUDE SQLCA                                           02220000
           END-EXEC                                                     02230000
      /                                                                 02240000
      *====>  ACAT TRANSFER TABLE                                       02250000
014700     EXEC SQL                                                     02260000
PC             INCLUDE VTRNFR                                           02270000
014900     END-EXEC.                                                    02280000
      /                                                                 02290000
LRM011*====>  ACAT TRANSFER AUDIT TABLE                                 02300000
LRM011     EXEC SQL                                                     02310000
LRM011         INCLUDE VTRNFRAU                                         02320000
LRM011     END-EXEC.                                                    02330000
015000/                                                                 02340000
      *====>  ACAT INITIAL TRANSFER TABLE                               02350000
014700     EXEC SQL                                                     02360000
ET0001**       INCLUDE VINITRNF                                         02370000
ET0001         INCLUDE ACTITRF                                          02380000
014900     END-EXEC.                                                    02390000
015000/                                                                 02400000
      *====>  ACAT ASSET  TABLE                                         02410000
014700     EXEC SQL                                                     02420000
PC             INCLUDE VASSET                                           02430000
014900     END-EXEC.                                                    02440000
015000/                                                                 02450000
      *====> DECLARE CURSOR (FWD_CSR) <===========*                     02460000
                                                                        02470000
014700     EXEC SQL                                                     02480000
PC             DECLARE FWD_CSR  CURSOR FOR                              02490000
092700         SELECT                                                   02500000
                     CLIENT_NBR                                         02510000
                   , ACAT_CONTROL_NBR                                   02520000
                   , BRANCH_CD                                          02530000
                   , RR_CD                                              02540000
                   , ACCT_CD                                            02550000
                   , TRNFR_TYPE_CD                                      02560000
                   , STTS_CD                                            02570000
                   , DAYS_STTS_QTY                                      02580000
                   , RCV_NBR                                            02590000
                   , DLVR_NBR                                           02600000
                   , ACCT_DLVR_NBR                                      02610000
                   , ACCT_RCV_NBR                                       02620000
                   , RCV_CUST_NM                                        02630000
                   , RCV_SS_PRIM_NBR                                    02640000
                   , RCV_SS_SCNDY_NBR                                   02650000
                   , RCV_ACCT_TYPE_CD                                   02660000
                   , STTLM_DT                                           02670000
                   , DSTBN_SIDE_CD                                      02680000
                   , CMNT_TXT                                           02690000
                   , NSCC_PEND_CD                                       02700000
                   , ACCT_ACTIVITY_IND                                  02710000
                   , ACCT_ORDERS_IND                                    02720000
                   , ACCT_RJCT_RSBM_IND                                 02730000
                   , ACCT_DB_BAL_T1_IND                                 02740000
                   , ACCT_MRGN_DB_IND                                   02750000
                   , ACCT_SHRT_PSTN_IND                                 02760000
                   , ACCT_SEC_RSTRD_IND                                 02770000
                   , ACCT_AST_EXCS_IND                                  02780000
                   , ACCT_OPTN_PSTN_IND                                 02790000
                   , ACCT_LTD_PRTNR_IND                                 02800000
                   , ACCT_TIN_MSMTH_IND                                 02810000
                   , ACCT_DPLCT_TRN_IND                                 02820000
                   , ACCT_CUST_70_IND                                   02830000
                   , ACCT_QULFD_PLN_IND                                 02840000
                   , ACCT_MNGD_IND                                      02850000
                   , ACCT_PRVT_RNG_IND                                  02860000
                   , ACCT_BRKR_TIF_IND                                  02870000
                   , NSCC_NON_ADP_IND                                   02880000
06/04              , ALERT_IND                                          02890000
ET0002             , ACCT_FRZN_IND                                      02900000
LRM005             , STTLM_TM_CD                                        02910000
LRM006             , RSTR_TRD_90_DY_IND                                 02920000
LRM006             , REG_T_IND                                          02930000
DJ0001             , AUCTION_RT_IND                                     02940000
LRM010             , PENNY_STK_IND                                      02950000
                                                                        02960000
092900                FROM VTRNFR                                       02970000
093000                WHERE                                             02980000
093000                     CLIENT_NBR = :SV-CLIENT-NBR   AND            02990000
                           TRNFR_TYPE_CD = 'FUL'         AND            03000000
                           DSTBN_SIDE_CD = 'R'           AND            03010000
01/20                      NOT NSCC_PEND_CD = 'A'        AND            03020000
                           STTS_CD IN ('200', '210', '220', '230') AND  03030000
                           (ACCT_ACTIVITY_IND = 'Y'  OR                 03040000
                            ACCT_ORDERS_IND    = 'Y' OR                 03050000
                            ACCT_RJCT_RSBM_IND = 'Y' OR                 03060000
                            ACCT_DB_BAL_T1_IND = 'Y' OR                 03070000
LRM009                      ACCT_DB_BAL_T1_IND = '2' OR                 03071000
                            ACCT_MRGN_DB_IND   = 'Y' OR                 03072000
                            ACCT_SHRT_PSTN_IND = 'Y' OR                 03073000
                            ACCT_SEC_RSTRD_IND = 'Y' OR                 03074000
                            ACCT_AST_EXCS_IND =  'Y' OR                 03075000
                            ACCT_OPTN_PSTN_IND = 'Y' OR                 03076000
                            ACCT_LTD_PRTNR_IND = 'Y' OR                 03077000
                            ACCT_TIN_MSMTH_IND = 'Y' OR                 03078000
                            ACCT_DPLCT_TRN_IND = 'Y' OR                 03079000
                            ACCT_CUST_70_IND   = 'Y' OR                 03080000
                            ACCT_QULFD_PLN_IND = 'Y' OR                 03090000
                            ACCT_MNGD_IND      = 'Y' OR                 03100000
                            ACCT_PRVT_RNG_IND  = 'Y' OR                 03110000
                            ACCT_BRKR_TIF_IND  = 'Y' OR                 03120000
ET0002                     (ACCT_FRZN_IND IN ('Y','O')) OR              03130000
                            NSCC_NON_ADP_IND   = 'Y' OR                 03140000
LRM006                      RSTR_TRD_90_DY_IND = 'Y' OR                 03150000
LRM006                      REG_T_IND = 'Y'          OR                 03160000
DJ0001                      AUCTION_RT_IND = 'Y'     OR                 03170000
LRM010                      PENNY_STK_IND = 'Y')                        03180000
                      AND                                               03190000
                           ((BRANCH_CD > :SV-BRANCH-CD      OR          03200000
                            (BRANCH_CD = :SV-BRANCH-CD AND              03210000
                             ACCT_CD > :SV-ACCT-CD)         OR          03220000
                            (BRANCH_CD = :SV-BRANCH-CD AND              03230000
                             ACCT_CD = :SV-ACCT-CD     AND              03240000
                             ACAT_CONTROL_NBR > :SV-ACAT-CNTL-NBR))     03250000
                                                               AND      03260000
                            RR_CD    LIKE :SV-RR-CD            AND      03270000
                            DLVR_NBR LIKE :SV-BRKR             AND      03280000
                            STTS_CD  LIKE :SV-STCD )                    03290000
                      ORDER BY  BRANCH_CD, ACCT_CD, ACAT_CONTROL_NBR    03300000
014900     END-EXEC.                                                    03310000
      ***             ORDER BY  BRANCH_CD, ACCT_CD, RR_CD, DLVR_NBR,    03320000
      ***                       STTS_CD, ACAT_CONTROL_NBR               03330000
015000/                                                                 03340000
      *====> DECLARE CURSOR (BWD_CSR) <===========*                     03350000
                                                                        03360000
014700     EXEC SQL                                                     03370000
PC             DECLARE BWD_CSR  CURSOR FOR                              03380000
092700         SELECT                                                   03390000
                     CLIENT_NBR                                         03400000
                   , ACAT_CONTROL_NBR                                   03410000
                   , BRANCH_CD                                          03420000
                   , RR_CD                                              03430000
                   , ACCT_CD                                            03440000
                   , TRNFR_TYPE_CD                                      03450000
                   , STTS_CD                                            03460000
                   , DAYS_STTS_QTY                                      03470000
                   , RCV_NBR                                            03480000
                   , DLVR_NBR                                           03490000
                   , ACCT_DLVR_NBR                                      03500000
                   , ACCT_RCV_NBR                                       03510000
                   , RCV_CUST_NM                                        03520000
                   , RCV_SS_PRIM_NBR                                    03530000
                   , RCV_SS_SCNDY_NBR                                   03540000
                   , RCV_ACCT_TYPE_CD                                   03550000
                   , STTLM_DT                                           03560000
                   , DSTBN_SIDE_CD                                      03570000
                   , CMNT_TXT                                           03580000
                   , NSCC_PEND_CD                                       03590000
                   , ACCT_ACTIVITY_IND                                  03600000
                   , ACCT_ORDERS_IND                                    03610000
                   , ACCT_RJCT_RSBM_IND                                 03620000
                   , ACCT_DB_BAL_T1_IND                                 03630000
                   , ACCT_MRGN_DB_IND                                   03640000
                   , ACCT_SHRT_PSTN_IND                                 03650000
                   , ACCT_SEC_RSTRD_IND                                 03660000
                   , ACCT_AST_EXCS_IND                                  03670000
                   , ACCT_OPTN_PSTN_IND                                 03680000
                   , ACCT_LTD_PRTNR_IND                                 03690000
                   , ACCT_TIN_MSMTH_IND                                 03700000
                   , ACCT_DPLCT_TRN_IND                                 03710000
                   , ACCT_CUST_70_IND                                   03720000
                   , ACCT_QULFD_PLN_IND                                 03730000
                   , ACCT_MNGD_IND                                      03740000
                   , ACCT_PRVT_RNG_IND                                  03750000
                   , ACCT_BRKR_TIF_IND                                  03760000
                   , NSCC_NON_ADP_IND                                   03770000
06/04              , ALERT_IND                                          03780000
ET0002             , ACCT_FRZN_IND                                      03790000
LRM005             , STTLM_TM_CD                                        03800000
LRM006             , RSTR_TRD_90_DY_IND                                 03810000
LRM006             , REG_T_IND                                          03820000
DJ0001             , AUCTION_RT_IND                                     03830000
LRM010             , PENNY_STK_IND                                      03840000
092900                FROM VTRNFR                                       03850000
093000                WHERE (CLIENT_NBR = :SV-CLIENT-NBR)               03860000
                        AND (TRNFR_TYPE_CD = 'FUL')                     03870000
                        AND (DSTBN_SIDE_CD = 'R')                       03880000
01/20                   AND (NOT NSCC_PEND_CD = 'A')                    03890000
                        AND (STTS_CD IN ('200', '210', '220', '230'))   03900000
                        AND (ACCT_ACTIVITY_IND = 'Y'  OR                03910000
                             ACCT_ORDERS_IND    = 'Y' OR                03920000
                             ACCT_RJCT_RSBM_IND = 'Y' OR                03930000
                             ACCT_DB_BAL_T1_IND = 'Y' OR                03940000
LRM009                       ACCT_DB_BAL_T1_IND = '2' OR                03950000
                             ACCT_MRGN_DB_IND   = 'Y' OR                03960000
                             ACCT_SHRT_PSTN_IND = 'Y' OR                03970000
                             ACCT_SEC_RSTRD_IND = 'Y' OR                03980000
                             ACCT_AST_EXCS_IND =  'Y' OR                03990000
                             ACCT_OPTN_PSTN_IND = 'Y' OR                04000000
                             ACCT_LTD_PRTNR_IND = 'Y' OR                04010000
                             ACCT_TIN_MSMTH_IND = 'Y' OR                04020000
                             ACCT_DPLCT_TRN_IND = 'Y' OR                04030000
                             ACCT_CUST_70_IND   = 'Y' OR                04040000
                             ACCT_QULFD_PLN_IND = 'Y' OR                04050000
                             ACCT_MNGD_IND      = 'Y' OR                04060000
                             ACCT_PRVT_RNG_IND  = 'Y' OR                04070000
                             ACCT_BRKR_TIF_IND  = 'Y' OR                04080000
ET0002                      (ACCT_FRZN_IND IN ('Y', 'O')) OR            04090000
                             NSCC_NON_ADP_IND   = 'Y' OR                04100000
LRM006                       RSTR_TRD_90_DY_IND = 'Y' OR                04110000
LRM006                       REG_T_IND = 'Y'          OR                04120000
DJ0001                       AUCTION_RT_IND = 'Y'     OR                04130000
LRM010                       PENNY_STK_IND  = 'Y')                      04140000
                      AND                                               04150000
                           ((BRANCH_CD < :SV-BRANCH-CD      OR          04160000
                            (BRANCH_CD = :SV-BRANCH-CD AND              04170000
                             ACCT_CD < :SV-ACCT-CD)         OR          04180000
                            (BRANCH_CD = :SV-BRANCH-CD AND              04190000
                             ACCT_CD = :SV-ACCT-CD     AND              04200000
                             ACAT_CONTROL_NBR < :SV-ACAT-CNTL-NBR))     04210000
                                                               AND      04220000
                            RR_CD    LIKE :SV-RR-CD            AND      04230000
                            DLVR_NBR LIKE :SV-BRKR             AND      04240000
                            STTS_CD  LIKE :SV-STCD )                    04250000
                      ORDER BY BRANCH_CD DESC, ACCT_CD DESC,            04260000
                               ACAT_CONTROL_NBR DESC                    04270000
014900     END-EXEC.                                                    04280000
015000/                                                                 04290000
      *                                                                 04300000
      **==========> DECLARE SUM1C_CSR CURSOR <===================       04310000
      *                                                                 04320000
            EXEC SQL                                                    04330000
                DECLARE SUM1C_CSR CURSOR FOR                            04340000
                   SELECT  SUM(ASSET_AMT)                               04350000
092900             FROM VASSET                                          04360000
093000             WHERE (CLIENT_NBR = :SV-CLIENT-NBR)                  04370000
                     AND (ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR)         04380000
                     AND (ISIN_SEC_ISSUE_CD = '         ')              04390000
                     AND (STTLM_LCTN_CD = '40')                         04400000
                     AND (STTLM_RSN_CD = 'CRED')                        04410000
                     AND (CSH_MGN_SHRT_CD = 'C')                        04420000
093200      END-EXEC.                                                   04430000
                                                                        04440000
      **==========> DECLARE SUM1D_CSR CURSOR <===================       04450000
                                                                        04460000
            EXEC SQL                                                    04470000
                DECLARE SUM1D_CSR CURSOR FOR                            04480000
                   SELECT  SUM(ASSET_AMT)                               04490000
092900             FROM VASSET                                          04500000
093000             WHERE (CLIENT_NBR = :SV-CLIENT-NBR)                  04510000
                     AND (ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR)         04520000
                     AND (ISIN_SEC_ISSUE_CD = '         ')              04530000
                     AND (STTLM_LCTN_CD = '40')                         04540000
                     AND (STTLM_RSN_CD = 'DEB ')                        04550000
                     AND (CSH_MGN_SHRT_CD = 'C')                        04560000
093200      END-EXEC.                                                   04570000
                                                                        04580000
      **==========> DECLARE SUM2C_CSR CURSOR <===================       04590000
                                                                        04600000
            EXEC SQL                                                    04610000
                DECLARE SUM2C_CSR CURSOR FOR                            04620000
092700             SELECT SUM(ASSET_AMT)                                04630000
092900             FROM VASSET                                          04640000
093000             WHERE (CLIENT_NBR = :SV-CLIENT-NBR)                  04650000
                     AND (ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR)         04660000
                     AND (ISIN_SEC_ISSUE_CD = '         ')              04670000
                     AND (STTLM_LCTN_CD = '40')                         04680000
                     AND (STTLM_RSN_CD = 'CRED')                        04690000
                     AND (CSH_MGN_SHRT_CD = 'M')                        04700000
093200      END-EXEC.                                                   04710000
                                                                        04720000
      **==========> DECLARE SUM2D_CSR CURSOR <===================       04730000
                                                                        04740000
            EXEC SQL                                                    04750000
                DECLARE SUM2D_CSR CURSOR FOR                            04760000
092700             SELECT SUM(ASSET_AMT)                                04770000
092900             FROM VASSET                                          04780000
093000             WHERE (CLIENT_NBR = :SV-CLIENT-NBR)                  04790000
                     AND (ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR)         04800000
                     AND (ISIN_SEC_ISSUE_CD = '         ')              04810000
                     AND (STTLM_LCTN_CD = '40')                         04820000
                     AND (STTLM_RSN_CD = 'DEB ')                        04830000
                     AND (CSH_MGN_SHRT_CD = 'M')                        04840000
093200      END-EXEC.                                                   04850000
                                                                        04860000
      **==========> DECLARE SUM5C_CSR CURSOR <===================       04870000
                                                                        04880000
            EXEC SQL                                                    04890000
                 DECLARE SUM5C_CSR CURSOR FOR                           04900000
092700             SELECT SUM(ASSET_AMT)                                04910000
092900             FROM VASSET                                          04920000
093000             WHERE (CLIENT_NBR = :SV-CLIENT-NBR)                  04930000
                     AND (ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR)         04940000
                     AND (ISIN_SEC_ISSUE_CD = '         ')              04950000
                     AND (STTLM_LCTN_CD = '40')                         04960000
                     AND (STTLM_RSN_CD = 'CRED')                        04970000
                     AND (CSH_MGN_SHRT_CD = 'S')                        04980000
093200      END-EXEC.                                                   04990000
                                                                        05000000
      **==========> DECLARE SUM5D_CSR CURSOR <===================       05010000
                                                                        05020000
            EXEC SQL                                                    05030000
                 DECLARE SUM5D_CSR CURSOR FOR                           05040000
092700             SELECT SUM(ASSET_AMT)                                05050000
092900             FROM VASSET                                          05060000
093000             WHERE (CLIENT_NBR = :SV-CLIENT-NBR)                  05070000
                     AND (ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR)         05080000
                     AND (ISIN_SEC_ISSUE_CD = '         ')              05090000
                     AND (STTLM_LCTN_CD = '40')                         05100000
                     AND (STTLM_RSN_CD = 'DEB ')                        05110000
                     AND (CSH_MGN_SHRT_CD = 'S')                        05120000
093200      END-EXEC.                                                   05130000
                                                                        05140000
      **==========> DECLARE SMA_CSR CURSOR <===================         05150000
      *                                                                 05160000
             EXEC SQL                                                   05170000
                 DECLARE SMA_CSR CURSOR FOR                             05180000
092700              SELECT SUM(ASSET_AMT)                               05190000
092900              FROM VASSET                                         05200000
093000              WHERE (CLIENT_NBR = :SV-CLIENT-NBR)                 05210000
                     AND (ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR)         05220000
                     AND (ISIN_SEC_ISSUE_CD = '         ')              05230000
                     AND (STTLM_LCTN_CD = '45')                         05240000
                     AND (STTLM_RSN_CD = 'SMA ')                        05250000
093200      END-EXEC.                                                   05260000
093200/                                                                 05270000
      *                                                                 05280000
      **********************************************************        05290000
      *****      L I N K A G E  S E C T I O N              *****        05300000
      **********************************************************        05310000
       LINKAGE SECTION.                                                 05320000
                                                                        05330000
       01  DFHCOMMAREA.                                                 05340000
      *01  ACAT04IO-COMM-AREA.                                          05350000
           COPY ACAT04IO.                                               05360000
      ************************ BOTTOM OF DATA **************************05370000
      /                                                                 05380000
      **********************************************************        05390000
      *****   P R O C E D U R E   D I V I S I O N           *****       05400000
      **********************************************************        05410000
       PROCEDURE DIVISION.                                              05420000
                                                                        05430000
           MOVE EIBCALEN TO WS-EIBCALEN.                                05440000
                                                                        05450000
           IF WS-EIBCALEN > +0                                          05460000
              PERFORM 0000-MAIN-RTN                                     05470000
           ELSE                                                         05480000
              EXEC CICS RETURN END-EXEC                                 05490000
           END-IF.                                                      05500000
                                                                        05510000
      *                                                                 05520000
       0000-MAIN-RTN.                                                   05530000
      ****                                                              05540000
           MOVE ACAT04IO-SAVE-KEYS    TO  WS-SAVE-KEY.                  05550000
           IF ACAT04IO-FIRST-TIME                                       05560000
              PERFORM                                                   05570000
092600             EXEC SQL                                             05580000
092700                 SELECT COUNT(*)                                  05590000
                       INTO : WS-COUNT                                  05600000
092900                 FROM VTRNFR                                      05610000
093000             WHERE (CLIENT_NBR  = :SV-CLIENT-NBR)                 05620000
                     AND (TRNFR_TYPE_CD = 'FUL')                        05630000
                     AND (DSTBN_SIDE_CD = 'R')                          05640000
                     AND (STTS_CD IN ('200', '210', '220', '230'))      05650000
               END-EXEC                                                 05660000
                                                                        05670000
              IF WS-COUNT = +0                                          05680000
                  SET ACAT04IO-VTRNFR-NOT-FOUND TO TRUE                 05690000
                  MOVE 'NO TRANSFER FOR THIS CLIENT (ACAT04DA)'         05700000
                       TO ACAT04IO-RETURN-MSG                           05710000
                  EXEC CICS RETURN END-EXEC                             05720000
              ELSE                                                      05730000
                  SET ACAT04IO-VTRNFR-FOUND TO TRUE                     05740000
                  MOVE WS-COUNT TO ACAT04IO-VTRNFR-COUNT                05750000
                  INITIALIZE WS-COUNT                                   05760000
              END-IF                                                    05770000
           END-PERFORM.                                                 05780000
                                                                        05790000
           MOVE SPACE TO WS-FIRST-TIME-SW.                              05800000
      *                                                                 05810000
           IF ACAT04IO-ISRT-VINITRNF                                    05820000
              PERFORM 0700-ISRT-VINITRNF  THRU 0700-EXIT                05830000
           ELSE                                                         05840000
             IF ACAT04IO-DLTE-VINITRNF                                  05850000
                PERFORM 0800-DLTE-VINITRNF                              05860000
             ELSE                                                       05870000
                 IF ACAT04IO-UPDT-VTRNFR                                05880000
                    PERFORM 0900-UPDT-VTRNFR                            05890000
                 ELSE                                                   05900000
                    IF ACAT04IO-SRCH-VTRNFR                             05910000
                       IF SV-ACAT-CNTL-NBR = LOW-VALUES OR SPACES       05920000
                          MOVE 'F' TO ACAT04IO-SEARCH-VTRNFR            05930000
                       END-IF                                           05940000
ET0002              ELSE                                                05950000
ET0002                 IF ACAT04IO-UPDT-FRZN-IND                        05960000
ET0002                    PERFORM 0940-UPDATE-ACCT-FRZN-IND             05970000
ET0002                 END-IF                                           05980000
                    END-IF                                              05990000
                 END-IF                                                 06000000
             END-IF                                                     06010000
           END-IF.                                                      06020000
      *                                                                 06030000
           IF ACAT04IO-SRCH-VTRNFR                                      06040000
              IF ACAT04IO-SRCH-VTRNFR-FWD                               06050000
                   PERFORM 0100-FETCH-VTRNFR-FWD THRU 0100-EXIT         06060000
              ELSE                                                      06070000
                  IF ACAT04IO-SRCH-VTRNFR-BWD                           06080000
                     PERFORM 0200-FETCH-VTRNFR-BWD THRU 0200-EXIT       06090000
                  ELSE                                                  06100000
                     IF ACAT04IO-SRCH-VTRNFR-PND                        06110000
                        PERFORM 0670-RETRIEVE-FOR-PENDING               06120000
                     END-IF                                             06130000
                  END-IF                                                06140000
              END-IF                                                    06150000
           END-IF.                                                      06160000
                                                                        06170000
                                                                        06180000
           IF ACAT04IO-SRCH-VTRNFR    AND                               06190000
              ACAT04IO-VTRNFR-FOUND                                     06200000
              IF SHOW-CURRENT-DATA                                      06210000
                 MOVE WS-SAVE-KEY TO ACAT04IO-SAVE-KEYS                 06220000
                 PERFORM 0500-MOVE-DATA                                 06230000
              ELSE                                                      06240000
                 MOVE WS-RETURN-MSG TO ACAT04IO-RETURN-MSG              06250000
              END-IF                                                    06260000
           ELSE                                                         06270000
              MOVE WS-RETURN-MSG TO ACAT04IO-RETURN-MSG                 06280000
           END-IF.                                                      06290000
                                                                        06300000
           EXEC CICS RETURN END-EXEC.                                   06310000
      /                                                                 06320000
       0050-SETUP-SRCH-KEYS.                                            06330000
      *                                                                 06340000
11/09 **** SET UP KEYS FOR SEARCH ENGINE =============>                 06350000
BEG==>     IF ACAT04IO-MBR = SPACE OR LOW-VALUE                         06360000
              IF ACAT04IO-SV-BRANCH-CD = SPACE OR LOW-VALUE             06370000
                 MOVE ALL '%' TO SV-BRANCH-CD, SV-ACCT-CD               06380000
              ELSE                                                      06390000
                 CONTINUE                                               06400000
              END-IF                                                    06410000
           END-IF.                                                      06420000
                                                                        06430000
           IF ACAT04IO-MAC = SPACE OR LOW-VALUE                         06440000
              IF ACAT04IO-SV-ACCT-CD = SPACE OR LOW-VALUE               06450000
                 MOVE ALL '%' TO SV-ACCT-CD                             06460000
              END-IF                                                    06470000
           END-IF.                                                      06480000
                                                                        06490000
           IF ACAT04IO-MRR  = SPACE OR LOW-VALUE                        06500000
              MOVE ALL '%' TO SV-RR-CD                                  06510000
           ELSE                                                         06520000
              MOVE ACAT04IO-MRR  TO  SV-RR-CD                           06530000
           END-IF.                                                      06540000
                                                                        06550000
           IF ACAT04IO-SV-ACAT-CNTL-NBR = SPACE OR LOW-VALUE            06560000
              MOVE ALL '%'  TO SV-ACAT-CNTL-NBR                         06570000
           END-IF.                                                      06580000
                                                                        06590000
           IF ACAT04IO-MCBRKR = SPACE OR LOW-VALUE                      06600000
              MOVE ALL '%' TO SV-BRKR                                   06610000
           ELSE                                                         06620000
              MOVE ACAT04IO-MCBRKR  TO  SV-BRKR                         06630000
           END-IF.                                                      06640000
                                                                        06650000
           IF ACAT04IO-MSTAT  = SPACE OR LOW-VALUE                      06660000
              MOVE ALL '%' TO SV-STCD                                   06670000
           ELSE                                                         06680000
              EVALUATE ACAT04IO-MSTAT                                   06690000
                 WHEN 'REQ'     MOVE  '100' TO SV-STCD                  06700000
                 WHEN 'RQA'     MOVE  '110' TO SV-STCD                  06710000
                 WHEN 'RQP'     MOVE  '130' TO SV-STCD                  06720000
                 WHEN 'RQR'     MOVE  '140' TO SV-STCD                  06730000
                 WHEN 'REV'     MOVE  '200' TO SV-STCD                  06740000
                 WHEN 'RVA'     MOVE  '210' TO SV-STCD                  06750000
                 WHEN 'RVE'     MOVE  '220' TO SV-STCD                  06760000
                 WHEN 'RVX'     MOVE  '230' TO SV-STCD                  06770000
                 WHEN 'STP'     MOVE  '300' TO SV-STCD                  06780000
                 WHEN 'STC'     MOVE  '310' TO SV-STCD                  06790000
                 WHEN 'CLP'     MOVE  '400' TO SV-STCD                  06800000
                 WHEN 'PUR'     MOVE  '500' TO SV-STCD                  06810000
                 WHEN 'MPP'     MOVE  '510' TO SV-STCD                  06820000
                 WHEN 'REJ'     MOVE  '600' TO SV-STCD                  06830000
                 WHEN  OTHER    MOVE  ALL '%' TO SV-STCD                06840000
              END-EVALUATE                                              06850000
           END-IF.                                                      06860000
                                                                        06870000
END=>*****                                                              06880000
       0050-EXIT.                                                       06890000
           EXIT.                                                        06900000
      /                                                                 06910000
       0100-FETCH-VTRNFR-FWD.                                           06920000
      *----------------------------------------------------------------*06930000
      *   FORWARD FETCH ROWS  FROM VTRNFR (ACAT_TRNFR) TABLE           *06940000
      *----------------------------------------------------------------*06950000
                                                                        06960000
           PERFORM 0050-SETUP-SRCH-KEYS THRU 0050-EXIT.                 06970000
                                                                        06980000
           EXEC SQL                                                     06990000
               OPEN FWD_CSR                                             07000000
           END-EXEC.                                                    07010000
                                                                        07020000
           SET CONTINUE-FETCH TO TRUE.                                  07030000
           SET SHOW-CURRENT-DATA TO TRUE.                               07040000
                                                                        07050000
           PERFORM UNTIL STOP-FETCH                                     07060000
              PERFORM 0105-FETCH-VTRNFR-NEXT THRU 0105-EXIT             07070000
              IF VTRNFR-FOUND                                           07080000
TCK              IF ACAT04IO-MBR > SPACES                               07090000
                    IF WS-BRANCH-CD = ACAT04IO-MBR                      07100000
                       CONTINUE                                         07110000
                    ELSE                                                07120000
                       SET STOP-FETCH            TO TRUE                07130000
                       SET SHOW-PREVIOUS-DATA    TO TRUE                07140000
03/23                  SET ACAT04IO-VTRNFR-LAST  TO TRUE                07150000
03/23                  SET VTRNFR-NOT-FOUND      TO TRUE                07160000
03/23                  SET ACAT04IO-VTRNFR-NOT-FOUND TO TRUE            07170000
TCK                    MOVE ' NO MORE TIF UNDER THIS BRANCH'            07180000
TCK                    TO WS-RETURN-MSG                                 07190000
TCK                 END-IF                                              07200000
                 END-IF                                                 07210000
                 IF STOP-FETCH                                          07220000
                    CONTINUE                                            07230000
                 ELSE                                                   07240000
                    PERFORM 0150-BR-AE-SECURITY THRU 0150-EXIT          07250000
                    IF SRCH-SIGNON-SECR-CHECK-PASS                      07260000
                       SET STOP-FETCH            TO TRUE                07270000
                       MOVE WS-CLIENT-NBR        TO SV-CLIENT-NBR       07280000
                       MOVE WS-ACAT-CONTROL-NBR  TO SV-ACAT-CNTL-NBR    07290000
                       IF WS-VTRNFR-CMNT > SPACES                       07300000
                          MOVE 'Y'               TO WS-ACCT-COMMENTS-IND07310000
                       ELSE                                             07320000
                          MOVE SPACE             TO WS-ACCT-COMMENTS-IND07330000
                       END-IF                                           07340000
                    END-IF                                              07350000
                 END-IF                                                 07360000
              ELSE                                                      07370000
                 SET STOP-FETCH               TO TRUE                   07380000
                 IF ACAT04IO-CLIENT-NBR > SPACES                        07390000
                    SET ACAT04IO-VTRNFR-LAST TO TRUE                    07400000
                    MOVE 'NO MORE TIF UNDER THIS SELECTION' TO          07410000
                      WS-RETURN-MSG                                     07420000
                 ELSE                                                   07430000
                    MOVE 'NO TIF UNDER THIS SELECTION' TO               07440000
                      WS-RETURN-MSG                                     07450000
                 END-IF                                                 07460000
              END-IF                                                    07470000
           END-PERFORM.                                                 07480000
                                                                        07490000
           EXEC SQL                                                     07500000
               CLOSE FWD_CSR                                            07510000
           END-EXEC.                                                    07520000
                                                                        07530000
           IF ACAT04IO-VTRNFR-FOUND                                     07540000
              IF SHOW-CURRENT-DATA                                      07550000
                 PERFORM 0300-SEARCH-VINITRNF THRU 0300-EXIT            07560000
                 PERFORM 0600-SRCH-ASSET THRU 0600-EXIT                 07570000
              END-IF                                                    07580000
           END-IF.                                                      07590000
           MOVE SPACE TO WS-FETCH-SW.                                   07600000
           MOVE SPACE TO ACAT04IO-FIRST-TIME-SW.                        07610000
                                                                        07620000
094400 0100-EXIT.                                                       07630000
094500     EXIT.                                                        07640000
      /                                                                 07650000
       0105-FETCH-VTRNFR-NEXT.                                          07660000
092600      EXEC SQL                                                    07670000
092700           FETCH  FWD_CSR                                         07680000
                  INTO                                                  07690000
                       :WS-CLIENT-NBR                                   07700000
                      ,:WS-ACAT-CONTROL-NBR                             07710000
                      ,:WS-BRANCH-CD                                    07720000
                      ,:WS-RR-CD                                        07730000
                      ,:WS-ACCT-CD                                      07740000
                      ,:WS-TFR-TYPE                                     07750000
                      ,:WS-STTS-CD                                      07760000
                      ,:WS-DAYS                                         07770000
                      ,:WS-RCV-NBR                                      07780000
                      ,:WS-DLVR-NBR                                     07790000
                      ,:WS-ACCT-DLVR-NBR                                07800000
                      ,:WS-ACCT-RCV-NBR                                 07810000
                      ,:WS-RCV-CUST-NM                                  07820000
                      ,:WS-RCV-SS-PRIM-NBR                              07830000
                      ,:WS-RCV-SS-SCNDY-NBR                             07840000
                      ,:WS-RCV-ACCT-TYPE-CD                             07850000
                      ,:WS-STTLM-DT                                     07860000
                      ,:WS-DSTBN-SIDE-CD                                07870000
                      ,:WS-VTRNFR-CMNT                                  07880000
                      ,:WS-VTRNFR-NSCC-PEND-CD                          07890000
                      ,:WS-ACCT-ACTIVITY-IND                            07900000
                      ,:WS-ACCT-ORDERS-IND                              07910000
                      ,:WS-ACCT-RJCT-RSBM-IND                           07920000
                      ,:WS-ACCT-DB-BAL-T1-IND                           07930000
                      ,:WS-ACCT-MRGN-DB-IND                             07940000
                      ,:WS-ACCT-SHRT-PSTN-IND                           07950000
                      ,:WS-ACCT-SEC-RSTRD-IND                           07960000
                      ,:WS-ACCT-AST-EXCS-IND                            07970000
                      ,:WS-ACCT-OPTN-PSTN-IND                           07980000
                      ,:WS-ACCT-LTD-PRTNR-IND                           07990000
                      ,:WS-ACCT-TIN-MSMTH-IND                           08000000
                      ,:WS-ACCT-DPLCT-TRN-IND                           08010000
                      ,:WS-ACCT-CUST-70-IND                             08020000
                      ,:WS-ACCT-QULFD-PLN-IND                           08030000
                      ,:WS-ACCT-MNGD-IND                                08040000
                      ,:WS-ACCT-PRVT-RNG-IND                            08050000
                      ,:WS-ACCT-BRKR-TIF-IND                            08060000
                      ,:WS-NSCC-NON-ADP-IND                             08070000
06/04                 ,:WS-ALERT-IND                                    08080000
ET0002                ,:WS-ACCT-FRZN-IND                                08090000
LRM005                ,:WS-STTLM-TM-CD                                  08100000
LRM006                ,:WS-RSTR-TRD-90-DY-IND                           08110000
LRM006                ,:WS-REG-T-IND                                    08120000
DJ0001                ,:WS-AUCTION-RATE-IND                             08130000
LRM010                ,:WS-SUB-PENNY-PRICE-IND                          08140000
093200      END-EXEC.                                                   08150000
093300*                                                                 08160000
093400      EVALUATE SQLCODE                                            08170000
093500          WHEN +0                                                 08180000
                     SET VTRNFR-FOUND TO TRUE                           08190000
                     SET ACAT04IO-VTRNFR-FOUND TO TRUE                  08200000
093800          WHEN +100                                               08210000
                     SET VTRNFR-NOT-FOUND TO TRUE                       08220000
                     SET ACAT04IO-VTRNFR-NOT-FOUND TO TRUE              08230000
094000          WHEN OTHER                                              08240000
                     SET VTRNFR-NOT-FOUND TO TRUE                       08250000
                     SET ACAT04IO-VTRNFR-NOT-FOUND TO TRUE              08260000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     08270000
                     PERFORM 9500-RETURN-DB2-ERROR                      08280000
094200      END-EVALUATE.                                               08290000
                                                                        08300000
094400 0105-EXIT.                                                       08310000
094500     EXIT.                                                        08320000
092500/                                                                 08330000
       0150-BR-AE-SECURITY.                                             08340000
           INITIALIZE ACAT-SRCH-COMM-AREA.                              08350000
           SET SECURITY-LOOKUP TO TRUE.                                 08360000
           MOVE WS-BRANCH-CD   TO SRCH-INP-BRANCH.                      08370000
           MOVE WS-RR-CD       TO SRCH-INP-RR.                          08380000
           EXEC CICS LINK                                               08390000
                     PROGRAM('ACATSRCH')                                08400000
                     COMMAREA(ACAT-SRCH-COMM-AREA)                      08410000
                     LENGTH(LENGTH OF ACAT-SRCH-COMM-AREA)              08420000
           END-EXEC.                                                    08430000
                                                                        08440000
094400 0150-EXIT.                                                       08450000
094500     EXIT.                                                        08460000
092500/                                                                 08470000
       0200-FETCH-VTRNFR-BWD.                                           08480000
      *----------------------------------------------------------------*08490000
      *   BACKWARD FETCH ROWS FROM VTRNFR (ACAT_TRNFR) TABLE           *08500000
      *----------------------------------------------------------------*08510000
                                                                        08520000
           PERFORM 0050-SETUP-SRCH-KEYS THRU 0050-EXIT.                 08530000
                                                                        08540000
           EXEC SQL                                                     08550000
               OPEN BWD_CSR                                             08560000
           END-EXEC.                                                    08570000
                                                                        08580000
           SET CONTINUE-FETCH       TO TRUE.                            08590000
           SET SHOW-CURRENT-DATA    TO TRUE.                            08600000
                                                                        08610000
           PERFORM UNTIL STOP-FETCH                                     08620000
              PERFORM 0205-FETCH-VTRNFR-PREV THRU 0205-EXIT             08630000
              IF VTRNFR-FOUND                                           08640000
TCK              IF ACAT04IO-MBR > SPACES                               08650000
                    IF WS-BRANCH-CD = ACAT04IO-MBR                      08660000
                       CONTINUE                                         08670000
                    ELSE                                                08680000
                       SET STOP-FETCH            TO TRUE                08690000
                       SET SHOW-PREVIOUS-DATA    TO TRUE                08700000
                       SET ACAT04IO-VTRNFR-FIRST TO TRUE                08710000
03/23                  SET VTRNFR-NOT-FOUND      TO TRUE                08720000
                       SET ACAT04IO-VTRNFR-NOT-FOUND TO TRUE            08730000
TCK                    MOVE ' NO MORE TIF UNDER THIS BRANCH'            08740000
TCK                    TO WS-RETURN-MSG                                 08750000
TCK                 END-IF                                              08760000
                 END-IF                                                 08770000
                 IF STOP-FETCH                                          08780000
                    CONTINUE                                            08790000
                 ELSE                                                   08800000
                    PERFORM 0150-BR-AE-SECURITY THRU 0150-EXIT          08810000
                    IF SRCH-SIGNON-SECR-CHECK-PASS                      08820000
                       SET STOP-FETCH            TO TRUE                08830000
                       MOVE WS-CLIENT-NBR        TO SV-CLIENT-NBR       08840000
                       MOVE WS-ACAT-CONTROL-NBR  TO SV-ACAT-CNTL-NBR    08850000
                       IF WS-VTRNFR-CMNT > SPACES                       08860000
                          MOVE 'Y'               TO WS-ACCT-COMMENTS-IND08870000
                       ELSE                                             08880000
                          MOVE SPACE             TO WS-ACCT-COMMENTS-IND08890000
                       END-IF                                           08900000
                    END-IF                                              08910000
                 END-IF                                                 08920000
              ELSE                                                      08930000
                 SET STOP-FETCH                   TO TRUE               08940000
                 IF ACAT04IO-CLIENT-NBR > SPACES                        08950000
                    SET ACAT04IO-VTRNFR-FIRST     TO TRUE               08960000
                    MOVE 'FIRST TIF UNDER THIS SELECTION' TO            08970000
                      WS-RETURN-MSG                                     08980000
                 ELSE                                                   08990000
                    SET ACAT04IO-VTRNFR-NOT-FOUND TO TRUE               09000000
                    MOVE 'NO TIF UNDER THIS SELECTION' TO               09010000
                      WS-RETURN-MSG                                     09020000
                 END-IF                                                 09030000
              END-IF                                                    09040000
           END-PERFORM.                                                 09050000
                                                                        09060000
           EXEC SQL                                                     09070000
               CLOSE BWD_CSR                                            09080000
           END-EXEC.                                                    09090000
                                                                        09100000
           IF ACAT04IO-VTRNFR-FOUND                                     09110000
              PERFORM 0300-SEARCH-VINITRNF  THRU 0300-EXIT              09120000
              PERFORM 0600-SRCH-ASSET THRU 0600-EXIT                    09130000
              MOVE SPACE TO ACAT04IO-FIRST-TIME-SW                      09140000
           END-IF.                                                      09150000
                                                                        09160000
094400 0200-EXIT.                                                       09170000
094500     EXIT.                                                        09180000
092500/                                                                 09190000
       0205-FETCH-VTRNFR-PREV.                                          09200000
092600      EXEC SQL                                                    09210000
092700           FETCH  BWD_CSR                                         09220000
                  INTO                                                  09230000
                       :WS-CLIENT-NBR                                   09240000
                      ,:WS-ACAT-CONTROL-NBR                             09250000
                      ,:WS-BRANCH-CD                                    09260000
                      ,:WS-RR-CD                                        09270000
                      ,:WS-ACCT-CD                                      09280000
                      ,:WS-TFR-TYPE                                     09290000
                      ,:WS-STTS-CD                                      09300000
                      ,:WS-DAYS                                         09310000
                      ,:WS-RCV-NBR                                      09320000
                      ,:WS-DLVR-NBR                                     09330000
                      ,:WS-ACCT-DLVR-NBR                                09340000
                      ,:WS-ACCT-RCV-NBR                                 09350000
                      ,:WS-RCV-CUST-NM                                  09360000
                      ,:WS-RCV-SS-PRIM-NBR                              09370000
                      ,:WS-RCV-SS-SCNDY-NBR                             09380000
                      ,:WS-RCV-ACCT-TYPE-CD                             09390000
                      ,:WS-STTLM-DT                                     09400000
                      ,:WS-DSTBN-SIDE-CD                                09410000
                      ,:WS-VTRNFR-CMNT                                  09420000
                      ,:WS-VTRNFR-NSCC-PEND-CD                          09430000
                      ,:WS-ACCT-ACTIVITY-IND                            09440000
                      ,:WS-ACCT-ORDERS-IND                              09450000
                      ,:WS-ACCT-RJCT-RSBM-IND                           09460000
                      ,:WS-ACCT-DB-BAL-T1-IND                           09470000
                      ,:WS-ACCT-MRGN-DB-IND                             09480000
                      ,:WS-ACCT-SHRT-PSTN-IND                           09490000
                      ,:WS-ACCT-SEC-RSTRD-IND                           09500000
                      ,:WS-ACCT-AST-EXCS-IND                            09510000
                      ,:WS-ACCT-OPTN-PSTN-IND                           09520000
                      ,:WS-ACCT-LTD-PRTNR-IND                           09530000
                      ,:WS-ACCT-TIN-MSMTH-IND                           09540000
                      ,:WS-ACCT-DPLCT-TRN-IND                           09550000
                      ,:WS-ACCT-CUST-70-IND                             09560000
                      ,:WS-ACCT-QULFD-PLN-IND                           09570000
                      ,:WS-ACCT-MNGD-IND                                09580000
                      ,:WS-ACCT-PRVT-RNG-IND                            09590000
                      ,:WS-ACCT-BRKR-TIF-IND                            09600000
                      ,:WS-NSCC-NON-ADP-IND                             09610000
06/04                 ,:WS-ALERT-IND                                    09620000
ET0002                ,:WS-ACCT-FRZN-IND                                09630000
LRM005                ,:WS-STTLM-TM-CD                                  09640000
LRM006                ,:WS-RSTR-TRD-90-DY-IND                           09650000
LRM006                ,:WS-REG-T-IND                                    09660000
DJ0001                ,:WS-SUB-PENNY-PRICE-IND                          09670000
093200      END-EXEC.                                                   09680000
093300*                                                                 09690000
093400      EVALUATE SQLCODE                                            09700000
093500          WHEN +0                                                 09710000
                     SET VTRNFR-FOUND TO TRUE                           09720000
                     SET ACAT04IO-VTRNFR-FOUND TO TRUE                  09730000
093800          WHEN +100                                               09740000
                     SET VTRNFR-NOT-FOUND TO TRUE                       09750000
                     SET ACAT04IO-VTRNFR-NOT-FOUND TO TRUE              09760000
094000          WHEN OTHER                                              09770000
                     SET VTRNFR-NOT-FOUND TO TRUE                       09780000
                     SET ACAT04IO-VTRNFR-NOT-FOUND TO TRUE              09790000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     09800000
                     PERFORM 9500-RETURN-DB2-ERROR                      09810000
094200      END-EVALUATE.                                               09820000
                                                                        09830000
094400 0205-EXIT.                                                       09840000
094500     EXIT.                                                        09850000
092500/                                                                 09860000
092500 0300-SEARCH-VINITRNF.                                            09870000
      *----------------------------------------------------------------*09880000
ET0001*   CHECK ACTITRF TO SEE IF THE TFR HAS ALREADY BEEN ACCELERATED *09890000
      *   OR REJECTED BEFORE THE NEXT BATCH CYCLE                      *09900000
      *----------------------------------------------------------------*09910000
092600      EXEC SQL                                                    09920000
092700           SELECT TRANS_TYPE_CD                                   09930000
                      , NSCC_PEND_CD                                    09940000
                      , CMNT_TXT                                        09950000
092700           INTO  :WS-INIT-TRANS-TYPE-CD                           09960000
                      ,:WS-VINITRNF-NSCC-PEND-CD                        09970000
                      ,:WS-VINITRNF-CMNT                                09980000
ET0001**         FROM VINITRNF                                          09990000
ET0001           FROM ACTITRF                                           10000000
093000             WHERE (CLIENT_NBR = :SV-CLIENT-NBR)                  10010000
LRM012               AND (ACAT_CONTROL_NBR = :WS-ACAT-CONTROL-NBR)      10020000
093200      END-EXEC.                                                   10030000
LRM012***            AND (TRNFR_TYPE_CD = 'FUL')                        10040000
LRM012***            AND (RCV_NBR = :WS-RCV-NBR)                        10050000
LRM012***            AND (DLVR_NBR = :WS-DLVR-NBR)                      10060000
LRM012***            AND (ACCT_RCV_NBR = :WS-ACCT-RCV-NBR)              10070000
LRM012***            AND (ACCT_DLVR_NBR = :WS-ACCT-DLVR-NBR)            10071000
093300*                                                                 10072000
093400      EVALUATE SQLCODE                                            10073000
093500          WHEN +0                                                 10074000
                     SET VINITRNF-FOUND TO TRUE                         10075000
                     SET ACAT04IO-VINITRNF-FOUND TO TRUE                10076000
                     PERFORM 0400-CHECK-TRANS-TYPE                      10077000
093800          WHEN +100                                               10078000
                     SET VINITRNF-NOT-FOUND TO TRUE                     10079000
                     SET ACAT04IO-VINITRNF-NOT-FOUND TO TRUE            10080000
094000          WHEN OTHER                                              10090000
                     SET VINITRNF-NOT-FOUND TO TRUE                     10100000
                     SET ACAT04IO-VINITRNF-NOT-FOUND TO TRUE            10110000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     10120000
                     PERFORM 9500-RETURN-DB2-ERROR                      10130000
094200      END-EVALUATE.                                               10140000
                                                                        10150000
094300*                                                                 10160000
094400 0300-EXIT.                                                       10170000
094500     EXIT.                                                        10180000
      /                                                                 10190000
       0400-CHECK-TRANS-TYPE.                                           10200000
092700      IF WS-INIT-TRANS-TYPE-CD = 'R'                              10210000
ET0002**       MOVE 'THIS TRANSFER HAS BEEN REJECTED' TO                10220000
ET0002**            WS-RETURN-MSG                                       10230000
ET0002         IF WS-VINITRNF-NSCC-PEND-CD = 'H'                        10240000
ET0002            MOVE 'TRANSFER FLAGGED TO BE REJECTED ON HOLD'        10250000
ET0002              TO  WS-RETURN-MSG                                   10260000
ET0002         ELSE                                                     10270000
ET0002            MOVE 'TRANSFER FLAGGED TO BE REJECTED'                10280000
ET0002              TO  WS-RETURN-MSG                                   10290000
ET0002         END-IF                                                   10300000
            ELSE                                                        10310000
               IF WS-INIT-TRANS-TYPE-CD = 'X'                           10320000
                  MOVE 'THIS TRANSFER HAS BEEN ACCELERATED' TO          10330000
                    WS-RETURN-MSG                                       10340000
               END-IF                                                   10350000
            END-IF.                                                     10360000
                                                                        10370000
092700      IF WS-VINITRNF-NSCC-PEND-CD = 'Y'                           10380000
               MOVE 'NSCC ACKNOWLEDGEMENT PENDING, DO NOT UPDATE'       10390000
                TO  WS-RETURN-MSG                                       10400000
            END-IF.                                                     10410000
                                                                        10420000
            IF WS-VINITRNF-CMNT > SPACE                                 10430000
               MOVE WS-VINITRNF-CMNT TO ACAT04IO-VINITRNF-CMNT          10440000
            END-IF.                                                     10450000
                                                                        10460000
094400 0400-EXIT.                                                       10470000
094500     EXIT.                                                        10480000
      /                                                                 10490000
       0500-MOVE-DATA.                                                  10500000
           INITIALIZE ACAT04IO-DA, ACAT04IO-DC.                         10510000
           MOVE LOW-VALUES TO ACAT04IO-TS-EXCEPTIONS.                   10520000
      *                                                                 10530000
           MOVE WS-CLIENT-NBR          TO  ACAT04IO-CLIENT-NBR.         10540000
           MOVE WS-ACAT-CONTROL-NBR    TO  ACAT04IO-ACAT-CONTROL-NBR.   10550000
           MOVE WS-BRANCH-CD           TO  ACAT04IO-BRANCH-CD.          10560000
           MOVE WS-RR-CD               TO  ACAT04IO-RR-CD.              10570000
           MOVE WS-ACCT-CD             TO  ACAT04IO-ACCT-CD.            10580000
           MOVE WS-TFR-TYPE            TO  ACAT04IO-TFR-TYPE.           10590000
           MOVE WS-STTS-CD             TO  ACAT04IO-STTS-CD.            10600000
           MOVE WS-DAYS                TO  ACAT04IO-DAYS.               10610000
           MOVE WS-RCV-NBR             TO  ACAT04IO-RCV-NBR.            10620000
           MOVE WS-DLVR-NBR            TO  ACAT04IO-DLVR-NBR.           10630000
           MOVE WS-ACCT-DLVR-NBR       TO  ACAT04IO-ACCT-DLVR-NBR.      10640000
           MOVE WS-ACCT-RCV-NBR        TO  ACAT04IO-ACCT-RCV-NBR.       10650000
           MOVE WS-RCV-CUST-NM         TO  ACAT04IO-RCV-CUST-NM.        10660000
           MOVE WS-RCV-SS-PRIM-NBR     TO  ACAT04IO-RCV-SS-PRIM-NBR.    10670000
           MOVE WS-RCV-SS-SCNDY-NBR    TO  ACAT04IO-RCV-SS-SCNDY-NBR.   10680000
           MOVE WS-RCV-ACCT-TYPE-CD    TO  ACAT04IO-RCV-ACCT-TYPE-CD.   10690000
           MOVE WS-INIT-TRANS-TYPE-CD  TO  ACAT04IO-INIT-TRANS-TYPE-CD. 10700000
           MOVE WS-VINITRNF-NSCC-PEND-CD TO                             10710000
                                         ACAT04IO-VINITRNF-NSCC-PEND-CD.10720000
           MOVE WS-VTRNFR-NSCC-PEND-CD TO  ACAT04IO-VTRNFR-NSCC-PEND-CD.10730000
           MOVE WS-STTLM-DT            TO  ACAT04IO-STTLM-DT.           10740000
           MOVE WS-VTRNFR-CMNT         TO  ACAT04IO-VTRNFR-CMNT.        10750000
06/04      MOVE WS-ALERT-IND           TO  ACAT04IO-ALERT-IND.          10760000
      *    MOVE WS-BAL01               TO  ACAT04IO-BAL01.              10770000
           MOVE SV-BAL01               TO  ACAT04IO-BAL01.              10780000
      *    MOVE WS-BAL02               TO  ACAT04IO-BAL02.              10790000
           MOVE SV-BAL02               TO  ACAT04IO-BAL02.              10800000
      *    MOVE WS-BAL05               TO  ACAT04IO-BAL05.              10810000
           MOVE SV-BAL05               TO  ACAT04IO-BAL05.              10820000
           MOVE SV-SMA                 TO  ACAT04IO-SMA.                10830000
           MOVE WS-RETURN-MSG          TO  ACAT04IO-RETURN-MSG.         10840000
           MOVE WS-ACAT04DA-EXCEPTIONS TO  ACAT04IO-TS-EXCEPTIONS.      10850000
                                                                        10860000
       0500-EXIT.                                                       10870000
           EXIT.                                                        10880000
      /                                                                 10890000
       0600-SRCH-ASSET.                                                 10900000
                                                                        10910000
           INITIALIZE CASH-BALANCE-WORK-AREA.                           10920000
           EXEC SQL                                                     10930000
                SELECT COUNT(*)                                         10940000
                INTO : WS-COUNT                                         10950000
                FROM VASSET                                             10960000
                     WHERE (CLIENT_NBR  = :SV-CLIENT-NBR)               10970000
                       AND (ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR)       10980000
           END-EXEC.                                                    10990000
                                                                        11000000
           IF WS-COUNT = +0                                             11010000
              SET ACAT04IO-VASSET-NOT-FOUND TO TRUE                     11020000
              INITIALIZE ACAT04IO-DC                                    11030000
              MOVE 'NO ASSET FOR THIS CLIENT (ACAT04DC)'                11040000
                   TO WS-RETURN-MSG                                     11050000
           ELSE                                                         11060000
              SET ACAT04IO-VASSET-FOUND TO TRUE                         11070000
              MOVE WS-COUNT      TO  ACAT04IO-VASSET-COUNT              11080000
                                     ACAT04IO-VASSET-COUNT-SV           11090000
              PERFORM 0610C-SUM1C THRU 0610C-EXIT                       11100000
              PERFORM 0610D-SUM1D THRU 0610D-EXIT                       11110000
              PERFORM 0615-CALCULATE-BAL01 THRU 0615-EXIT               11120000
              PERFORM 0620C-SUM2C THRU 0620C-EXIT                       11130000
              PERFORM 0620D-SUM2D THRU 0620D-EXIT                       11140000
              PERFORM 0625-CALCULATE-BAL02 THRU 0625-EXIT               11150000
              PERFORM 0630C-SUM5C THRU 0630C-EXIT                       11160000
              PERFORM 0630D-SUM5D THRU 0630D-EXIT                       11170000
              PERFORM 0635-CALCULATE-BAL05 THRU 0635-EXIT               11180000
              PERFORM 0640-SUM-SMA THRU 0640-EXIT                       11190000
           END-IF.                                                      11200000
                                                                        11210000
       0600-EXIT.                                                       11220000
           EXIT.                                                        11230000
      /                                                                 11240000
       0610C-SUM1C.                                                     11250000
                                                                        11260000
092600      EXEC SQL                                                    11270000
                 OPEN SUM1C_CSR                                         11280000
            END-EXEC.                                                   11290000
            IF SQLCODE NOT = +0                                         11300000
               MOVE 'CAN NOT OPEN CURSOR SUM1C_CSR' TO WS-RETURN-MSG    11310000
               PERFORM 9000-WRITE-TO-CICS-LOG                           11320000
               PERFORM 9500-RETURN-DB2-ERROR                            11330000
            END-IF.                                                     11340000
                                                                        11350000
            EXEC SQL                                                    11360000
                 FETCH SUM1C_CSR                                        11370000
                 INTO :WS-BAL                                           11380000
            END-EXEC.                                                   11390000
                                                                        11400000
093400      EVALUATE SQLCODE                                            11410000
093500          WHEN +0                                                 11420000
                     MOVE WS-BAL  TO SV-BAL01C                          11430000
093800          WHEN -305                                               11440000
                     MOVE +0      TO SV-BAL01C                          11450000
094000          WHEN OTHER                                              11460000
                    MOVE                                                11470000
                    'ERROR IN FETCH CASH BALANCE SUM1C_CSR(ACAT04DA)'   11480000
                     TO  WS-RETURN-MSG                                  11490000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     11500000
                     PERFORM 9500-RETURN-DB2-ERROR                      11510000
094200     END-EVALUATE.                                                11520000
                                                                        11530000
           EXEC SQL                                                     11540000
                CLOSE  SUM1C_CSR                                        11550000
           END-EXEC.                                                    11560000
                                                                        11570000
       0610C-EXIT.                                                      11580000
           EXIT.                                                        11590000
      /                                                                 11600000
       0610D-SUM1D.                                                     11610000
                                                                        11620000
092600      EXEC SQL                                                    11630000
                 OPEN SUM1D_CSR                                         11640000
            END-EXEC.                                                   11650000
            IF SQLCODE NOT = +0                                         11660000
               MOVE 'CAN NOT OPEN CURSOR SUM1D_CSR' TO WS-RETURN-MSG    11670000
               PERFORM 9000-WRITE-TO-CICS-LOG                           11680000
               PERFORM 9500-RETURN-DB2-ERROR                            11690000
            END-IF.                                                     11700000
                                                                        11710000
            EXEC SQL                                                    11720000
                 FETCH SUM1D_CSR                                        11730000
                 INTO :WS-BAL                                           11740000
            END-EXEC.                                                   11750000
                                                                        11760000
093400      EVALUATE SQLCODE                                            11770000
093500          WHEN +0                                                 11780000
                     MOVE WS-BAL  TO SV-BAL01D                          11790000
093800          WHEN -305                                               11800000
                     MOVE +0      TO SV-BAL01D                          11810000
094000          WHEN OTHER                                              11820000
                    MOVE                                                11830000
                    'ERROR IN FETCH CASH BALANCE SUM1D_CSR(ACAT04DA)'   11840000
                    TO  WS-RETURN-MSG                                   11850000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     11860000
                     PERFORM 9500-RETURN-DB2-ERROR                      11870000
094200     END-EVALUATE.                                                11880000
                                                                        11890000
           EXEC SQL                                                     11900000
                CLOSE  SUM1D_CSR                                        11910000
           END-EXEC.                                                    11920000
                                                                        11930000
       0610D-EXIT.                                                      11940000
           EXIT.                                                        11950000
      /                                                                 11960000
01/05  0615-CALCULATE-BAL01.                                            11970000
            IF SV-BAL01C = +0  AND                                      11980000
               SV-BAL01D = +0                                           11990000
               MOVE +0   TO SV-BAL01                                    12000000
            ELSE                                                        12010000
               SUBTRACT SV-BAL01C FROM SV-BAL01D GIVING SV-BAL01        12020000
               IF SV-BAL01 < ZERO                                       12030000
                  MOVE 'CRED' TO SV-BAL01-STTLM-RSN-CD                  12040000
               ELSE                                                     12050000
                  MOVE 'DEB ' TO SV-BAL01-STTLM-RSN-CD                  12060000
               END-IF                                                   12070000
            END-IF.                                                     12080000
                                                                        12090000
       0615-EXIT.                                                       12100000
           EXIT.                                                        12110000
      /                                                                 12120000
       0620C-SUM2C.                                                     12130000
                                                                        12140000
092600      EXEC SQL                                                    12150000
                 OPEN SUM2C_CSR                                         12160000
            END-EXEC.                                                   12170000
            IF SQLCODE NOT = +0                                         12180000
               MOVE 'CAN NOT OPEN CURSOR SUM2C_CSR' TO WS-RETURN-MSG    12190000
               PERFORM 9000-WRITE-TO-CICS-LOG                           12200000
               PERFORM 9500-RETURN-DB2-ERROR                            12210000
            END-IF.                                                     12220000
                                                                        12230000
            EXEC SQL                                                    12240000
                 FETCH SUM2C_CSR                                        12250000
                 INTO :WS-BAL                                           12260000
            END-EXEC.                                                   12270000
                                                                        12280000
093400      EVALUATE SQLCODE                                            12290000
093500          WHEN +0                                                 12300000
                     MOVE WS-BAL  TO SV-BAL02C                          12310000
093800          WHEN -305                                               12320000
                     MOVE +0      TO SV-BAL02C                          12330000
094000          WHEN OTHER                                              12340000
                    MOVE                                                12350000
                    'ERROR IN FETCH CASH BALANCE SUM2C_CSR(ACAT04DA)'   12360000
                     TO  WS-RETURN-MSG                                  12370000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     12380000
                     PERFORM 9500-RETURN-DB2-ERROR                      12390000
094200     END-EVALUATE.                                                12400000
                                                                        12410000
           EXEC SQL                                                     12420000
                CLOSE  SUM2C_CSR                                        12430000
           END-EXEC.                                                    12440000
                                                                        12450000
       0620C-EXIT.                                                      12460000
           EXIT.                                                        12470000
      /                                                                 12480000
       0620D-SUM2D.                                                     12490000
                                                                        12500000
092600      EXEC SQL                                                    12510000
                 OPEN SUM2D_CSR                                         12520000
            END-EXEC.                                                   12530000
            IF SQLCODE NOT = +0                                         12540000
               MOVE 'CAN NOT OPEN CURSOR SUM2D_CSR' TO WS-RETURN-MSG    12550000
               PERFORM 9000-WRITE-TO-CICS-LOG                           12560000
               PERFORM 9500-RETURN-DB2-ERROR                            12570000
            END-IF.                                                     12580000
                                                                        12590000
            EXEC SQL                                                    12600000
                 FETCH SUM2D_CSR                                        12610000
                 INTO :WS-BAL                                           12620000
            END-EXEC.                                                   12630000
                                                                        12640000
093400      EVALUATE SQLCODE                                            12650000
093500          WHEN +0                                                 12660000
                     MOVE WS-BAL  TO SV-BAL02D                          12670000
093800          WHEN -305                                               12680000
                     MOVE +0      TO SV-BAL02D                          12690000
094000          WHEN OTHER                                              12700000
                    MOVE                                                12710000
                    'ERROR IN FETCH CASH BALANCE SUM2D_CSR(ACAT04DA)'   12720000
                    TO  WS-RETURN-MSG                                   12730000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     12740000
                     PERFORM 9500-RETURN-DB2-ERROR                      12750000
094200     END-EVALUATE.                                                12760000
                                                                        12770000
           EXEC SQL                                                     12780000
                CLOSE  SUM2D_CSR                                        12790000
           END-EXEC.                                                    12800000
                                                                        12810000
       0620D-EXIT.                                                      12820000
      /                                                                 12830000
01/05  0625-CALCULATE-BAL02.                                            12840000
            IF SV-BAL02C = +0  AND                                      12850000
               SV-BAL02D = +0                                           12860000
               MOVE +0   TO SV-BAL02                                    12870000
            ELSE                                                        12880000
               SUBTRACT SV-BAL02C FROM SV-BAL02D GIVING SV-BAL02        12890000
               IF SV-BAL02 < ZERO                                       12900000
                  MOVE 'CRED' TO SV-BAL02-STTLM-RSN-CD                  12910000
               ELSE                                                     12920000
                  MOVE 'DEB ' TO SV-BAL02-STTLM-RSN-CD                  12930000
               END-IF                                                   12940000
            END-IF.                                                     12950000
                                                                        12960000
       0625-EXIT.                                                       12970000
           EXIT.                                                        12980000
      /                                                                 12990000
       0630C-SUM5C.                                                     13000000
                                                                        13010000
092600      EXEC SQL                                                    13020000
                 OPEN SUM5C_CSR                                         13030000
            END-EXEC.                                                   13040000
            IF SQLCODE NOT = +0                                         13050000
               MOVE 'CAN NOT OPEN CURSOR SUM5C_CSR' TO WS-RETURN-MSG    13060000
               PERFORM 9000-WRITE-TO-CICS-LOG                           13070000
               PERFORM 9500-RETURN-DB2-ERROR                            13080000
            END-IF.                                                     13090000
                                                                        13100000
            EXEC SQL                                                    13110000
                 FETCH SUM5C_CSR                                        13120000
                 INTO :WS-BAL                                           13130000
            END-EXEC.                                                   13140000
                                                                        13150000
093400      EVALUATE SQLCODE                                            13160000
093500          WHEN +0                                                 13170000
                     MOVE WS-BAL  TO SV-BAL05C                          13180000
093800          WHEN -305                                               13190000
                     MOVE +0      TO SV-BAL05C                          13200000
094000          WHEN OTHER                                              13210000
                    MOVE                                                13220000
                    'ERROR IN FETCH CASH BALANCE SUM5C_CSR(ACAT04DA)'   13230000
                     TO  WS-RETURN-MSG                                  13240000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     13250000
                     PERFORM 9500-RETURN-DB2-ERROR                      13260000
094200     END-EVALUATE.                                                13270000
                                                                        13280000
           EXEC SQL                                                     13290000
                CLOSE  SUM5C_CSR                                        13300000
           END-EXEC.                                                    13310000
                                                                        13320000
       0630C-EXIT.                                                      13330000
           EXIT.                                                        13340000
      /                                                                 13350000
       0630D-SUM5D.                                                     13360000
                                                                        13370000
092600      EXEC SQL                                                    13380000
                 OPEN SUM5D_CSR                                         13390000
            END-EXEC.                                                   13400000
            IF SQLCODE NOT = +0                                         13410000
               MOVE 'CAN NOT OPEN CURSOR SUM5D_CSR' TO WS-RETURN-MSG    13420000
               PERFORM 9000-WRITE-TO-CICS-LOG                           13430000
               PERFORM 9500-RETURN-DB2-ERROR                            13440000
            END-IF.                                                     13450000
                                                                        13460000
            EXEC SQL                                                    13470000
                 FETCH SUM5D_CSR                                        13480000
                 INTO :WS-BAL                                           13490000
            END-EXEC.                                                   13500000
                                                                        13510000
093400      EVALUATE SQLCODE                                            13520000
093500          WHEN +0                                                 13530000
                     MOVE WS-BAL  TO SV-BAL05D                          13540000
093800          WHEN -305                                               13550000
                     MOVE +0      TO SV-BAL05D                          13560000
094000          WHEN OTHER                                              13570000
                    MOVE                                                13580000
                    'ERROR IN FETCH CASH BALANCE SUM5D_CSR(ACAT04DA)'   13590000
                    TO  WS-RETURN-MSG                                   13600000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     13610000
                     PERFORM 9500-RETURN-DB2-ERROR                      13620000
094200     END-EVALUATE.                                                13630000
                                                                        13640000
           EXEC SQL                                                     13650000
                CLOSE  SUM5D_CSR                                        13660000
           END-EXEC.                                                    13670000
                                                                        13680000
       0630D-EXIT.                                                      13690000
      /                                                                 13700000
01/05  0635-CALCULATE-BAL05.                                            13710000
            IF SV-BAL05C = +0  AND                                      13720000
               SV-BAL05D = +0                                           13730000
               MOVE +0   TO SV-BAL05                                    13740000
            ELSE                                                        13750000
               SUBTRACT SV-BAL05C FROM SV-BAL05D GIVING SV-BAL05        13760000
               IF SV-BAL05 < ZERO                                       13770000
                  MOVE 'CRED' TO SV-BAL05-STTLM-RSN-CD                  13780000
               ELSE                                                     13790000
                  MOVE 'DEB ' TO SV-BAL05-STTLM-RSN-CD                  13800000
               END-IF                                                   13810000
            END-IF.                                                     13820000
                                                                        13830000
       0635-EXIT.                                                       13840000
           EXIT.                                                        13850000
      /                                                                 13860000
       0640-SUM-SMA.                                                    13870000
                                                                        13880000
092600      EXEC SQL                                                    13890000
                 OPEN SMA_CSR                                           13900000
            END-EXEC.                                                   13910000
            IF SQLCODE NOT = +0                                         13920000
               MOVE 'CAN NOT OPEN CURSOR SMA_CSR' TO WS-RETURN-MSG      13930000
               PERFORM 9000-WRITE-TO-CICS-LOG                           13940000
               PERFORM 9500-RETURN-DB2-ERROR                            13950000
            END-IF.                                                     13960000
                                                                        13970000
            EXEC SQL                                                    13980000
                 FETCH SMA_CSR                                          13990000
                 INTO :WS-SMA                                           14000000
            END-EXEC.                                                   14010000
                                                                        14020000
093400      EVALUATE SQLCODE                                            14030000
093500          WHEN +0                                                 14040000
                     MOVE WS-SMA  TO SV-SMA                             14050000
093800          WHEN -305                                               14060000
                     MOVE +0      TO SV-SMA                             14070000
094000          WHEN OTHER                                              14080000
                    MOVE 'ERROR IN TOTAL OF SMA AMOUNT (ACAT04DA)'      14090000
                    TO  WS-RETURN-MSG                                   14100000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     14110000
                     PERFORM 9500-RETURN-DB2-ERROR                      14120000
094200     END-EVALUATE.                                                14130000
                                                                        14140000
           EXEC SQL                                                     14150000
                CLOSE  SMA_CSR                                          14160000
           END-EXEC.                                                    14170000
                                                                        14180000
       0640-EXIT.                                                       14190000
           EXIT.                                                        14200000
      /                                                                 14210000
       0650-RETRIEVE-CURRENT-VTRNFR.                                    14220000
                                                                        14230000
           EXEC SQL                                                     14240000
                SELECT                                                  14250000
                      CLIENT_NBR,                                       14260000
                      ACAT_CONTROL_NBR,                                 14270000
                      SBMTG_PRTCP_NBR,                                  14280000
                      SBMT_PRT_NR_STS_CD,                               14290000
                      CONTROL_NBR_STS_CD,                               14300000
                      DLVR_NBR,                                         14310000
                      DLVR_NBR_STTS_CD,                                 14320000
                      ACCT_DLVR_NBR,                                    14330000
                      ACCT_DLVR_STTS_CD,                                14340000
                      RCV_NBR,                                          14350000
                      RCV_NBR_STTS_CD,                                  14360000
                      ACCT_RCV_NBR,                                     14370000
                      ACCT_RCV_STTS_CD,                                 14380000
                      TRNFR_TYPE_CD,                                    14390000
                      TRNFR_TYPE_STTS_CD,                               14400000
                      TRANS_TYPE_CD,                                    14410000
                      TRANS_TYPE_STTS_CD,                               14420000
                      RCV_CUST_NM,                                      14430000
                      RCV_CUST_NM_STS_CD,                               14440000
                      RCV_SS_PRIM_NBR,                                  14450000
                      RCV_SS_PRIM_STS_CD,                               14460000
                      RCV_SS_SCNDY_NBR,                                 14470000
                      RCV_SS_SCDY_STS_CD,                               14480000
                      RCV_ACCT_TYPE_CD,                                 14490000
                      RCV_ACT_TYP_STS_CD,                               14500000
                      RCV_OCC_BRKR_NBR,                                 14510000
                      RCV_OCC_STTS_CD,                                  14520000
                      RCV_CRSPN_NBR,                                    14530000
                      RCV_CRSPN_STTS_CD,                                14540000
                      ACAT_CNTL_ASTD_NBR,                               14550000
                      CNTL_ASTD_STTS_CD,                                14560000
                      CMNT_TXT,                                         14570000
                      CMNT_STTS_CD,                                     14580000
                      PRCS_DT,                                          14590000
                      STTS_CD,                                          14600000
                      STTLM_TM_CD,                                      14610000
                      VAL_FREE_CD,                                      14620000
                      TRANS_RFRN_ID_CD,                                 14630000
                      TRANS_RFRN_STTS_CD,                               14640000
                      DB_CR_CD,                                         14650000
                      DSTBN_SIDE_CD,                                    14660000
                      SYS_ACT_CD,                                       14670000
                      SYS_RJCT_RSN_CD,                                  14680000
                      TRNFR_TYPE_RJC1_CD,                               14690000
                      TRNFR_TYPE_RJC2_CD,                               14700000
                      TRNFR_TYPE_RJCT_CD,                               14710000
                      TRN_TYP_RJC_STS_CD,                               14720000
                      PHSCL_SEQ_NBR,                                    14730000
                      PHSCL_SEQ_STTS_CD,                                14740000
                      LGCL_SEQ_NBR,                                     14750000
                      LGCL_SEQ_NR_STS_CD,                               14760000
                      RR_CD,                                            14770000
                      BRANCH_CD,                                        14780000
                      DVDND_NAA_CD,                                     14790000
                      SELL_INSTN_NAA_CD,                                14800000
                      CASH_SWEEP_NAA_CD,                                14810000
                      PRTCP_CONTRA_CD,                                  14820000
                      ACM_HOLDER_NAA_CD,                                14830000
                      ACCT_ACTIVITY_IND,                                14840000
                      ACCT_ORDERS_IND,                                  14850000
                      ACCT_RJCT_RSBM_IND,                               14860000
                      ACCT_DB_BAL_T1_IND,                               14870000
                      ACCT_MRGN_DB_IND,                                 14880000
                      ACCT_SHRT_PSTN_IND,                               14890000
                      ACCT_SEC_RSTRD_IND,                               14900000
                      ACCT_AST_EXCS_IND,                                14910000
                      ACCT_OPTN_PSTN_IND,                               14920000
                      ACCT_LTD_PRTNR_IND,                               14930000
                      ACCT_TIN_MSMTH_IND,                               14940000
                      ACCT_DPLCT_TRN_IND,                               14950000
                      ACCT_CUST_70_IND,                                 14960000
                      ACCT_QULFD_PLN_IND,                               14970000
                      ACCT_MNGD_IND,                                    14980000
                      ACCT_PRVT_RNG_IND,                                14990000
                      ACCT_BRKR_TIF_IND,                                15000000
                      NSCC_NON_ADP_IND,                                 15010000
                      CYCLE_CD,                                         15020000
                      DAYS_STTS_QTY,                                    15030000
                      STTLM_DT,                                         15040000
                      ACCT_NA_UPDT_IND,                                 15050000
                      ACCT_TRNFR_FEE_AMT,                               15060000
                      ACCT_IRA_TRMNT_AMT,                               15070000
                      ACCT_IRA_MAINT_AMT,                               15080000
                      ACCT_DLRV_PRGR_IND,                               15090000
                      ACCT_CD,                                          15100000
                      STTLM_ASCTD_DT,                                   15110000
                      STTLM_ASCTD_STS_CD,                               15120000
                      RCRD_LNGTH_STTS_CD,                               15130000
                      RCRD_STTS_CD,                                     15140000
                      NSCC_PEND_CD,                                     15150000
                      NSCC_ACK_IND,                                     15160000
                      CICS_TERM_ID_CD,                                  15170000
                      PRGM_NM,                                          15180000
                      CRT_TMSTP,                                        15190000
                      UPDT_TMSTP,                                       15200000
                      ACCT_EQUITY_AMT,                                  15210000
06/04                 ALERT_IND,                                        15220000
ET0002                ACCT_FRZN_IND,                                    15230000
LRM005                STTLM_TM_CD,                                      15240000
DJ0001                AUCTION_RT_IND,                                   15250000
LRM010                PENNY_STK_IND                                     15260000
                INTO  :DCLVTRNFR.CLIENT-NBR                             15270000
                     ,:DCLVTRNFR.ACAT-CONTROL-NBR                       15280000
                     ,:DCLVTRNFR.SBMTG-PRTCP-NBR                        15290000
                     ,:DCLVTRNFR.SBMT-PRT-NR-STS-CD                     15300000
                     ,:DCLVTRNFR.CONTROL-NBR-STS-CD                     15310000
                     ,:DCLVTRNFR.DLVR-NBR                               15320000
                     ,:DCLVTRNFR.DLVR-NBR-STTS-CD                       15330000
                     ,:DCLVTRNFR.ACCT-DLVR-NBR                          15340000
                     ,:DCLVTRNFR.ACCT-DLVR-STTS-CD                      15350000
                     ,:DCLVTRNFR.RCV-NBR                                15360000
                     ,:DCLVTRNFR.RCV-NBR-STTS-CD                        15370000
                     ,:DCLVTRNFR.ACCT-RCV-NBR                           15380000
                     ,:DCLVTRNFR.ACCT-RCV-STTS-CD                       15390000
                     ,:DCLVTRNFR.TRNFR-TYPE-CD                          15400000
                     ,:DCLVTRNFR.TRNFR-TYPE-STTS-CD                     15410000
                     ,:DCLVTRNFR.TRANS-TYPE-CD                          15420000
                     ,:DCLVTRNFR.TRANS-TYPE-STTS-CD                     15430000
                     ,:DCLVTRNFR.RCV-CUST-NM                            15440000
                     ,:DCLVTRNFR.RCV-CUST-NM-STS-CD                     15450000
                     ,:DCLVTRNFR.RCV-SS-PRIM-NBR                        15460000
                     ,:DCLVTRNFR.RCV-SS-PRIM-STS-CD                     15470000
                     ,:DCLVTRNFR.RCV-SS-SCNDY-NBR                       15480000
                     ,:DCLVTRNFR.RCV-SS-SCDY-STS-CD                     15490000
                     ,:DCLVTRNFR.RCV-ACCT-TYPE-CD                       15500000
                     ,:DCLVTRNFR.RCV-ACT-TYP-STS-CD                     15510000
                     ,:DCLVTRNFR.RCV-OCC-BRKR-NBR                       15520000
                     ,:DCLVTRNFR.RCV-OCC-STTS-CD                        15530000
                     ,:DCLVTRNFR.RCV-CRSPN-NBR                          15540000
                     ,:DCLVTRNFR.RCV-CRSPN-STTS-CD                      15550000
                     ,:DCLVTRNFR.ACAT-CNTL-ASTD-NBR                     15560000
                     ,:DCLVTRNFR.CNTL-ASTD-STTS-CD                      15570000
                     ,:DCLVTRNFR.CMNT-TXT                               15580000
                     ,:DCLVTRNFR.CMNT-STTS-CD                           15590000
                     ,:DCLVTRNFR.PRCS-DT                                15600000
                     ,:DCLVTRNFR.STTS-CD                                15610000
                     ,:DCLVTRNFR.STTLM-TM-CD                            15620000
                     ,:DCLVTRNFR.VAL-FREE-CD                            15630000
                     ,:DCLVTRNFR.TRANS-RFRN-ID-CD                       15640000
                     ,:DCLVTRNFR.TRANS-RFRN-STTS-CD                     15650000
                     ,:DCLVTRNFR.DB-CR-CD                               15660000
                     ,:DCLVTRNFR.DSTBN-SIDE-CD                          15670000
                     ,:DCLVTRNFR.SYS-ACT-CD                             15680000
                     ,:DCLVTRNFR.SYS-RJCT-RSN-CD                        15690000
                     ,:DCLVTRNFR.TRNFR-TYPE-RJC1-CD                     15700000
                     ,:DCLVTRNFR.TRNFR-TYPE-RJC2-CD                     15710000
                     ,:DCLVTRNFR.TRNFR-TYPE-RJCT-CD                     15720000
                     ,:DCLVTRNFR.TRN-TYP-RJC-STS-CD                     15730000
                     ,:DCLVTRNFR.PHSCL-SEQ-NBR                          15740000
                     ,:DCLVTRNFR.PHSCL-SEQ-STTS-CD                      15750000
                     ,:DCLVTRNFR.LGCL-SEQ-NBR                           15760000
                     ,:DCLVTRNFR.LGCL-SEQ-NR-STS-CD                     15770000
                     ,:DCLVTRNFR.RR-CD                                  15780000
                     ,:DCLVTRNFR.BRANCH-CD                              15790000
                     ,:DCLVTRNFR.DVDND-NAA-CD                           15800000
                     ,:DCLVTRNFR.SELL-INSTN-NAA-CD                      15810000
                     ,:DCLVTRNFR.CASH-SWEEP-NAA-CD                      15820000
                     ,:DCLVTRNFR.PRTCP-CONTRA-CD                        15830000
                     ,:DCLVTRNFR.ACM-HOLDER-NAA-CD                      15840000
                     ,:DCLVTRNFR.ACCT-ACTIVITY-IND                      15850000
                     ,:DCLVTRNFR.ACCT-ORDERS-IND                        15860000
                     ,:DCLVTRNFR.ACCT-RJCT-RSBM-IND                     15870000
                     ,:DCLVTRNFR.ACCT-DB-BAL-T1-IND                     15880000
                     ,:DCLVTRNFR.ACCT-MRGN-DB-IND                       15890000
                     ,:DCLVTRNFR.ACCT-SHRT-PSTN-IND                     15900000
                     ,:DCLVTRNFR.ACCT-SEC-RSTRD-IND                     15910000
                     ,:DCLVTRNFR.ACCT-AST-EXCS-IND                      15920000
                     ,:DCLVTRNFR.ACCT-OPTN-PSTN-IND                     15930000
                     ,:DCLVTRNFR.ACCT-LTD-PRTNR-IND                     15940000
                     ,:DCLVTRNFR.ACCT-TIN-MSMTH-IND                     15950000
                     ,:DCLVTRNFR.ACCT-DPLCT-TRN-IND                     15960000
                     ,:DCLVTRNFR.ACCT-CUST-70-IND                       15970000
                     ,:DCLVTRNFR.ACCT-QULFD-PLN-IND                     15980000
                     ,:DCLVTRNFR.ACCT-MNGD-IND                          15990000
                     ,:DCLVTRNFR.ACCT-PRVT-RNG-IND                      16000000
                     ,:DCLVTRNFR.ACCT-BRKR-TIF-IND                      16010000
                     ,:DCLVTRNFR.NSCC-NON-ADP-IND                       16020000
                     ,:DCLVTRNFR.CYCLE-CD                               16030000
                     ,:DCLVTRNFR.DAYS-STTS-QTY                          16040000
                     ,:DCLVTRNFR.STTLM-DT                               16050000
                     ,:DCLVTRNFR.ACCT-NA-UPDT-IND                       16060000
                     ,:DCLVTRNFR.ACCT-TRNFR-FEE-AMT                     16070000
                     ,:DCLVTRNFR.ACCT-IRA-TRMNT-AMT                     16080000
                     ,:DCLVTRNFR.ACCT-IRA-MAINT-AMT                     16090000
                     ,:DCLVTRNFR.ACCT-DLRV-PRGR-IND                     16100000
                     ,:DCLVTRNFR.ACCT-CD                                16110000
                     ,:DCLVTRNFR.STTLM-ASCTD-DT                         16120000
                     ,:DCLVTRNFR.STTLM-ASCTD-STS-CD                     16130000
                     ,:DCLVTRNFR.RCRD-LNGTH-STTS-CD                     16140000
                     ,:DCLVTRNFR.RCRD-STTS-CD                           16150000
                     ,:DCLVTRNFR.NSCC-PEND-CD                           16160000
                     ,:DCLVTRNFR.NSCC-ACK-IND                           16170000
                     ,:DCLVTRNFR.CICS-TERM-ID-CD                        16180000
                     ,:DCLVTRNFR.PRGM-NM                                16190000
                     ,:DCLVTRNFR.CRT-TMSTP                              16200000
                     ,:DCLVTRNFR.UPDT-TMSTP                             16210000
                     ,:DCLVTRNFR.ACCT-EQUITY-AMT                        16220000
06/04                ,:DCLVTRNFR.ALERT-IND                              16230000
ET0002               ,:DCLVTRNFR.ACCT-FRZN-IND                          16240000
LRM005               ,:DCLVTRNFR.STTLM-TM-CD                            16250000
DJ0001               ,:DCLVTRNFR.AUCTION-RT-IND                         16260000
LRM010               ,:DCLVTRNFR.PENNY-STK-IND                          16270000
                FROM  VTRNFR                                            16280000
                WHERE CLIENT_NBR = :SV-CLIENT-NBR           AND         16290000
                      ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR              16300000
           END-EXEC.                                                    16310000
                                                                        16320000
093400     EVALUATE SQLCODE                                             16330000
093500          WHEN +0                                                 16340000
                     SET CURRENT-VTRNFR-FOUND TO TRUE                   16350000
                WHEN +100                                               16360000
                     SET VTRNFR-NOT-FOUND TO TRUE                       16370000
                     SET CURRENT-VTRNFR-NOT-FOUND TO TRUE               16380000
      *              MOVE '2ND RETRIEVE TFR NOT FOUND' TO WS-RETURN-MSG 16390000
094000          WHEN OTHER                                              16400000
                     MOVE SPACE TO ACAT04IO-VINITRNF-SW                 16410000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     16420000
                     PERFORM 9500-RETURN-DB2-ERROR                      16430000
094200     END-EVALUATE.                                                16440000
                                                                        16450000
       0660-MOVE-VTRNFR.                                                16460000
      *                                                                 16470000
           MOVE CLIENT-NBR         OF DCLVTRNFR     TO                  16480000
ET0001          CLIENT-NBR         OF DCLACTITRF.                       16490000
           MOVE DLVR-NBR           OF DCLVTRNFR     TO                  16500000
ET0001          DLVR-NBR           OF DCLACTITRF.                       16510000
           MOVE ACCT-DLVR-NBR      OF DCLVTRNFR     TO                  16520000
ET0001          ACCT-DLVR-NBR      OF DCLACTITRF.                       16530000
      *                                                                 16540000
           MOVE RCV-NBR OF DCLVTRNFR        TO                          16550000
ET0001          RCV-NBR OF DCLACTITRF.                                  16560000
           MOVE ACCT-RCV-NBR OF DCLVTRNFR   TO                          16570000
ET0001          ACCT-RCV-NBR OF DCLACTITRF.                             16580000
           MOVE RCV-NBR-STTS-CD OF DCLVTRNFR TO                         16590000
ET0001          RCV-NBR-STTS-CD OF DCLACTITRF.                          16600000
           MOVE DLVR-NBR-STTS-CD OF DCLVTRNFR TO                        16610000
ET0001          DLVR-NBR-STTS-CD OF DCLACTITRF.                         16620000
           MOVE ACCT-RCV-STTS-CD OF DCLVTRNFR TO                        16630000
ET0001          ACCT-RCV-STTS-CD OF DCLACTITRF.                         16640000
           MOVE ACCT-DLVR-STTS-CD OF DCLVTRNFR   TO                     16650000
ET0001          ACCT-DLVR-STTS-CD OF DCLACTITRF.                        16660000
           MOVE SBMTG-PRTCP-NBR   OF DCLVTRNFR   TO                     16670000
ET0001          SBMTG-PRTCP-NBR   OF DCLACTITRF.                        16680000
           MOVE SBMT-PRT-NR-STS-CD OF DCLVTRNFR  TO                     16690000
ET0001          SBMT-PRT-NR-STS-CD OF DCLACTITRF.                       16700000
           MOVE ACAT-CONTROL-NBR   OF DCLVTRNFR  TO                     16710000
ET0001          ACAT-CONTROL-NBR   OF DCLACTITRF.                       16720000
           MOVE CONTROL-NBR-STS-CD OF DCLVTRNFR TO                      16730000
ET0001          TRNFR-TYPE-STTS-CD OF DCLACTITRF.                       16740000
           MOVE TRANS-TYPE-STTS-CD OF DCLVTRNFR  TO                     16750000
ET0001          TRANS-TYPE-STTS-CD OF DCLACTITRF.                       16760000
           MOVE RCV-CUST-NM        OF DCLVTRNFR  TO                     16770000
ET0001          RCV-CUST-NM        OF DCLACTITRF.                       16780000
           MOVE RCV-CUST-NM-STS-CD OF DCLVTRNFR  TO                     16790000
ET0001          RCV-CUST-NM-STS-CD OF DCLACTITRF.                       16800000
           MOVE RCV-SS-PRIM-NBR    OF DCLVTRNFR  TO                     16810000
ET0001          RCV-SS-PRIM-NBR    OF DCLACTITRF.                       16820000
           MOVE RCV-SS-PRIM-STS-CD OF DCLVTRNFR  TO                     16830000
ET0001          RCV-SS-PRIM-STS-CD OF DCLACTITRF.                       16840000
           MOVE RCV-SS-SCNDY-NBR   OF DCLVTRNFR  TO                     16850000
ET0001          RCV-SS-SCNDY-NBR   OF DCLACTITRF.                       16860000
           MOVE RCV-SS-SCDY-STS-CD OF DCLVTRNFR  TO                     16870000
ET0001          RCV-SS-SCDY-STS-CD OF DCLACTITRF.                       16880000
           MOVE RCV-ACCT-TYPE-CD   OF DCLVTRNFR  TO                     16890000
ET0001          RCV-ACCT-TYPE-CD   OF DCLACTITRF.                       16900000
           MOVE RCV-ACT-TYP-STS-CD OF DCLVTRNFR  TO                     16910000
ET0001          RCV-ACT-TYP-STS-CD OF DCLACTITRF.                       16920000
           MOVE RCV-OCC-BRKR-NBR   OF DCLVTRNFR  TO                     16930000
ET0001          RCV-OCC-BRKR-NBR   OF DCLACTITRF.                       16940000
           MOVE RCV-OCC-STTS-CD    OF DCLVTRNFR  TO                     16950000
ET0001          RCV-OCC-STTS-CD    OF DCLACTITRF.                       16960000
           MOVE RCV-CRSPN-NBR      OF DCLVTRNFR  TO                     16970000
ET0001          RCV-CRSPN-NBR      OF DCLACTITRF.                       16980000
           MOVE RCV-CRSPN-STTS-CD  OF DCLVTRNFR  TO                     16990000
ET0001          RCV-CRSPN-STTS-CD  OF DCLACTITRF.                       17000000
           MOVE ACAT-CNTL-ASTD-NBR OF DCLVTRNFR  TO                     17010000
ET0001          ACAT-CNTL-ASTD-NBR OF DCLACTITRF.                       17020000
           MOVE CNTL-ASTD-STTS-CD  OF DCLVTRNFR  TO                     17030000
ET0001          CNTL-ASTD-STTS-CD  OF DCLACTITRF.                       17040000
           MOVE CMNT-STTS-CD       OF DCLVTRNFR  TO                     17050000
ET0001          CMNT-STTS-CD       OF DCLACTITRF.                       17060000
           MOVE STTS-CD            OF DCLVTRNFR  TO                     17070000
ET0001          STTS-CD            OF DCLACTITRF.                       17080000
           MOVE DSTBN-SIDE-CD      OF DCLVTRNFR  TO                     17090000
ET0001          DSTBN-SIDE-CD      OF DCLACTITRF.                       17100000
           MOVE SYS-ACT-CD         OF DCLVTRNFR  TO                     17110000
ET0001          SYS-ACT-CD         OF DCLACTITRF.                       17120000
           MOVE SYS-RJCT-RSN-CD    OF DCLVTRNFR  TO                     17130000
ET0001          SYS-RJCT-RSN-CD    OF DCLACTITRF.                       17140000
           MOVE TRNFR-TYPE-RJC1-CD OF DCLVTRNFR  TO                     17150000
ET0001          TRNFR-TYPE-RJC1-CD OF DCLACTITRF.                       17160000
           MOVE TRNFR-TYPE-RJC2-CD OF DCLVTRNFR  TO                     17170000
ET0001          TRNFR-TYPE-RJC2-CD OF DCLACTITRF.                       17180000
           MOVE TRN-TYP-RJC-STS-CD OF DCLVTRNFR  TO                     17190000
ET0001          TRN-TYP-RJC-STS-CD OF DCLACTITRF.                       17200000
           MOVE PHSCL-SEQ-NBR      OF DCLVTRNFR  TO                     17210000
ET0001          PHSCL-SEQ-NBR      OF DCLACTITRF.                       17220000
           MOVE PHSCL-SEQ-STTS-CD  OF DCLVTRNFR  TO                     17230000
ET0001          PHSCL-SEQ-STTS-CD  OF DCLACTITRF.                       17240000
           MOVE LGCL-SEQ-NBR       OF DCLVTRNFR  TO                     17250000
ET0001          LGCL-SEQ-NBR       OF DCLACTITRF.                       17260000
           MOVE LGCL-SEQ-NR-STS-CD OF DCLVTRNFR  TO                     17270000
ET0001          LGCL-SEQ-NR-STS-CD OF DCLACTITRF.                       17280000
           MOVE PRTCP-CONTRA-CD    OF DCLVTRNFR  TO                     17290000
ET0001          PRTCP-CONTRA-CD    OF DCLACTITRF.                       17300000
           MOVE CYCLE-CD           OF DCLVTRNFR  TO                     17310000
ET0001          CYCLE-CD           OF DCLACTITRF.                       17320000
     ***   MOVE DAYS-STTS-QTY      OF DCLVTRNFR  TO                     17330000
ET0001     MOVE +0  TO  DAYS-STTS-QTY OF DCLACTITRF.                    17340000
           MOVE TRANS-RFRN-ID-CD   OF DCLVTRNFR  TO                     17350000
ET0001          TRANS-RFRN-ID-CD   OF DCLACTITRF.                       17360000
           MOVE TRANS-RFRN-STTS-CD OF DCLVTRNFR  TO                     17370000
ET0001          TRANS-RFRN-STTS-CD OF DCLACTITRF.                       17380000
           MOVE DB-CR-CD           OF DCLVTRNFR  TO                     17390000
ET0001          DB-CR-CD           OF DCLACTITRF.                       17400000
           MOVE STTLM-ASCTD-STS-CD OF DCLVTRNFR  TO                     17410000
ET0001          STTLM-ASCTD-STS-CD OF DCLACTITRF.                       17420000
           MOVE RCRD-LNGTH-STTS-CD OF DCLVTRNFR  TO                     17430000
ET0001          RCRD-LNGTH-STTS-CD OF DCLACTITRF.                       17440000
           MOVE RCRD-STTS-CD       OF DCLVTRNFR  TO                     17450000
ET0001          RCRD-STTS-CD       OF DCLACTITRF.                       17460000
ET0001     MOVE SPACE  TO   NSCC-PEND-CD  OF DCLACTITRF.                17470000
LRM007     MOVE SPACE  TO                                               17480000
LRM007*****MOVE NSCC-ACK-IND       OF DCLVTRNFR  TO                     17490000
ET0001          NSCC-ACK-IND       OF DCLACTITRF.                       17500000
      *                                                                 17510000
      /                                                                 17520000
       0670-RETRIEVE-FOR-PENDING.                                       17530000
      *                                                                 17540000
           EXEC SQL                                                     17550000
                SELECT                                                  17560000
                       CLIENT_NBR                                       17570000
                     , ACAT_CONTROL_NBR                                 17580000
                     , BRANCH_CD                                        17590000
                     , RR_CD                                            17600000
                     , ACCT_CD                                          17610000
                     , TRNFR_TYPE_CD                                    17620000
                     , STTS_CD                                          17630000
                     , DAYS_STTS_QTY                                    17640000
                     , RCV_NBR                                          17650000
                     , DLVR_NBR                                         17660000
                     , ACCT_DLVR_NBR                                    17670000
                     , ACCT_RCV_NBR                                     17680000
                     , RCV_CUST_NM                                      17690000
                     , RCV_SS_PRIM_NBR                                  17700000
                     , RCV_SS_SCNDY_NBR                                 17710000
                     , RCV_ACCT_TYPE_CD                                 17720000
                     , STTLM_DT                                         17730000
                     , DSTBN_SIDE_CD                                    17740000
                     , CMNT_TXT                                         17750000
                     , NSCC_PEND_CD                                     17760000
                     , ACCT_ACTIVITY_IND                                17770000
                     , ACCT_ORDERS_IND                                  17780000
                     , ACCT_RJCT_RSBM_IND                               17790000
                     , ACCT_DB_BAL_T1_IND                               17800000
                     , ACCT_MRGN_DB_IND                                 17810000
                     , ACCT_SHRT_PSTN_IND                               17820000
                     , ACCT_SEC_RSTRD_IND                               17830000
                     , ACCT_AST_EXCS_IND                                17840000
                     , ACCT_OPTN_PSTN_IND                               17850000
                     , ACCT_LTD_PRTNR_IND                               17860000
                     , ACCT_TIN_MSMTH_IND                               17870000
                     , ACCT_DPLCT_TRN_IND                               17880000
                     , ACCT_CUST_70_IND                                 17890000
                     , ACCT_QULFD_PLN_IND                               17900000
                     , ACCT_MNGD_IND                                    17910000
                     , ACCT_PRVT_RNG_IND                                17920000
                     , ACCT_BRKR_TIF_IND                                17930000
                     , NSCC_NON_ADP_IND                                 17940000
06/04                , ALERT_IND                                        17950000
ET0002               , ACCT_FRZN_IND                                    17960000
LRM005               , STTLM_TM_CD                                      17970000
LRM006               , RSTR_TRD_90_DY_IND                               17980000
LRM006               , REG_T_IND                                        17990000
DJ0001               , AUCTION_RT_IND                                   18000000
LRM010               , PENNY_STK_IND                                    18010000
                INTO                                                    18020000
                       :WS-CLIENT-NBR                                   18030000
                      ,:WS-ACAT-CONTROL-NBR                             18040000
                      ,:WS-BRANCH-CD                                    18050000
                      ,:WS-RR-CD                                        18060000
                      ,:WS-ACCT-CD                                      18070000
                      ,:WS-TFR-TYPE                                     18080000
                      ,:WS-STTS-CD                                      18090000
                      ,:WS-DAYS                                         18100000
                      ,:WS-RCV-NBR                                      18110000
                      ,:WS-DLVR-NBR                                     18120000
                      ,:WS-ACCT-DLVR-NBR                                18130000
                      ,:WS-ACCT-RCV-NBR                                 18140000
                      ,:WS-RCV-CUST-NM                                  18150000
                      ,:WS-RCV-SS-PRIM-NBR                              18160000
                      ,:WS-RCV-SS-SCNDY-NBR                             18170000
                      ,:WS-RCV-ACCT-TYPE-CD                             18180000
                      ,:WS-STTLM-DT                                     18190000
                      ,:WS-DSTBN-SIDE-CD                                18200000
                      ,:WS-VTRNFR-CMNT                                  18210000
                      ,:WS-VTRNFR-NSCC-PEND-CD                          18220000
                      ,:WS-ACCT-ACTIVITY-IND                            18230000
                      ,:WS-ACCT-ORDERS-IND                              18240000
                      ,:WS-ACCT-RJCT-RSBM-IND                           18250000
                      ,:WS-ACCT-DB-BAL-T1-IND                           18260000
                      ,:WS-ACCT-MRGN-DB-IND                             18270000
                      ,:WS-ACCT-SHRT-PSTN-IND                           18280000
                      ,:WS-ACCT-SEC-RSTRD-IND                           18290000
                      ,:WS-ACCT-AST-EXCS-IND                            18300000
                      ,:WS-ACCT-OPTN-PSTN-IND                           18310000
                      ,:WS-ACCT-LTD-PRTNR-IND                           18320000
                      ,:WS-ACCT-TIN-MSMTH-IND                           18330000
                      ,:WS-ACCT-DPLCT-TRN-IND                           18340000
                      ,:WS-ACCT-CUST-70-IND                             18350000
                      ,:WS-ACCT-QULFD-PLN-IND                           18360000
                      ,:WS-ACCT-MNGD-IND                                18370000
                      ,:WS-ACCT-PRVT-RNG-IND                            18380000
                      ,:WS-ACCT-BRKR-TIF-IND                            18390000
                      ,:WS-NSCC-NON-ADP-IND                             18400000
06/04                 ,:WS-ALERT-IND                                    18410000
ET0002                ,:WS-ACCT-FRZN-IND                                18420000
LRM005                ,:WS-STTLM-TM-CD                                  18430000
LRM006                ,:WS-RSTR-TRD-90-DY-IND                           18440000
LRM006                ,:WS-REG-T-IND                                    18450000
DJ0001                ,:WS-AUCTION-RATE-IND                             18460000
LRM010                ,:WS-SUB-PENNY-PRICE-IND                          18470000
                FROM  VTRNFR                                            18480000
                WHERE CLIENT_NBR = :SV-CLIENT-NBR           AND         18490000
                      ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR              18500000
093200      END-EXEC.                                                   18510000
      *                                                                 18520000
093400     EVALUATE SQLCODE                                             18530000
093500          WHEN +0                                                 18540000
                     SET ACAT04IO-VTRNFR-FOUND TO TRUE                  18550000
                     SET SHOW-CURRENT-DATA TO TRUE                      18560000
                     MOVE WS-BRANCH-CD  TO SV-BRANCH-CD                 18570000
                     MOVE WS-ACCT-CD    TO SV-ACCT-CD                   18580000
                     MOVE WS-RR-CD      TO SV-RR-CD                     18590000
                     PERFORM 0300-SEARCH-VINITRNF THRU 0300-EXIT        18600000
                WHEN +100                                               18610000
                     SET ACAT04IO-VTRNFR-NOT-FOUND TO TRUE              18620000
                     MOVE 'THIS PENDING TRANSFER IS NOT FOUND' TO       18630000
                     WS-RETURN-MSG                                      18640000
094000          WHEN OTHER                                              18650000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     18660000
                     PERFORM 9500-RETURN-DB2-ERROR                      18670000
094200     END-EVALUATE.                                                18680000
                                                                        18690000
           IF ACAT04IO-VTRNFR-FOUND                                     18700000
              PERFORM 0600-SRCH-ASSET                                   18710000
              MOVE SPACE TO ACAT04IO-FIRST-TIME-SW                      18720000
           END-IF.                                                      18730000
094300*                                                                 18740000
      /                                                                 18750000
       0700-ISRT-VINITRNF.                                              18760000
                                                                        18770000
           MOVE SPACE TO WS-CURRENT-VTRNFR-SW.                          18780000
                                                                        18790000
02/03      MOVE ACAT04IO-RCV-NBR TO WS-RCV-NBR.                         18800000
           MOVE ACAT04IO-DLVR-NBR TO WS-DLVR-NBR.                       18810000
           MOVE ACAT04IO-ACCT-RCV-NBR TO WS-ACCT-RCV-NBR.               18820000
02/03      MOVE ACAT04IO-ACCT-DLVR-NBR TO WS-ACCT-DLVR-NBR.             18830000
02/03      PERFORM 0300-SEARCH-VINITRNF.                                18840000
02/03      IF ACAT04IO-VINITRNF-FOUND                                   18850000
              MOVE WS-INIT-TRANS-TYPE-CD TO  ACAT04IO-INIT-TRANS-TYPE-CD18860000
              IF WS-INIT-TRANS-TYPE-CD = 'R'                            18870000
                 MOVE 'REJECTION OF THIS TIF WAS SUBMITTED ' TO         18880000
                       WS-RETURN-MSG                                    18890000
               ELSE                                                     18900000
                  IF WS-INIT-TRANS-TYPE-CD = 'X'                        18910000
                     MOVE 'ACCELERATION OF THIS TIF WAS SUBMITTED' TO   18920000
                       WS-RETURN-MSG                                    18930000
                  END-IF                                                18940000
               END-IF                                                   18950000
            END-IF.                                                     18960000
                                                                        18970000
02/03      IF ACAT04IO-VINITRNF-FOUND   AND                             18980000
092700        WS-VINITRNF-NSCC-PEND-CD = 'Y'                            18990000
              MOVE WS-VINITRNF-NSCC-PEND-CD TO                          19000000
                   ACAT04IO-VINITRNF-NSCC-PEND-CD                       19010000
              MOVE 'NSCC ACKNOWLEDGEMENT PENDING, DO NOT UPDATE'        19020000
                TO  WS-RETURN-MSG                                       19030000
           END-IF.                                                      19040000
                                                                        19050000
02/03      IF ACAT04IO-VINITRNF-FOUND   AND                             19060000
              WS-VINITRNF-CMNT > SPACE                                  19070000
              MOVE WS-VINITRNF-CMNT TO ACAT04IO-VINITRNF-CMNT           19080000
           END-IF.                                                      19090000
                                                                        19100000
02/03      IF ACAT04IO-VINITRNF-FOUND                                   19110000
              GO TO 0700-EXIT                                           19120000
           ELSE                                                         19130000
              PERFORM 0650-RETRIEVE-CURRENT-VTRNFR                      19140000
           END-IF.                                                      19150000
                                                                        19160000
           IF CURRENT-VTRNFR-FOUND                                      19170000
              CONTINUE                                                  19180000
           ELSE                                                         19190000
              EXEC CICS RETURN END-EXEC                                 19200000
           END-IF.                                                      19210000
      *                                                                 19220000
           EXEC SQL                                                     19230000
                SET :WS-TIMESTAMP = CURRENT TIMESTAMP                   19240000
           END-EXEC.                                                    19250000
                                                                        19260000
ET0001**   INITIALIZE DCLVINITRNF.                                      19270000
ET0001     INITIALIZE DCLACTITRF.                                       19280000
      *                                                                 19290000
           PERFORM 0660-MOVE-VTRNFR.                                    19300000
ET0001     MOVE WS-TIMESTAMP TO  UPDT-TMSTP OF DCLACTITRF               19310000
ET0001                            CRT-TMSTP OF DCLACTITRF.              19320000
                                                                        19330000
ET0001     MOVE WS-TIMESTAMP(1 : 10) TO PRCS-DT OF DCLACTITRF           19340000
ET0001                           STTLM-ASCTD-DT OF DCLACTITRF.          19350000
                                                                        19360000
           IF ACAT04IO-M4ACCEL = 'S'                                    19370000
               MOVE 'X'  TO  WS-TRANS-TYPE-CD                           19380000
               MOVE '00' TO  WS-TRNFR-RJCT-CD                           19390000
           ELSE                                                         19400000
               IF ACAT04IO-M4REJ = 'S'   OR                             19410000
                  ACAT04IO-M4REJC = 'S'                                 19420000
                  MOVE 'R' TO WS-TRANS-TYPE-CD                          19430000
                  MOVE '21' TO WS-TRNFR-RJCT-CD                         19440000
               END-IF                                                   19450000
           END-IF.                                                      19460000
                                                                        19470000
ET0001     MOVE WS-TRANS-TYPE-CD TO TRANS-TYPE-CD OF DCLACTITRF,        19480000
                                    ACAT04IO-INIT-TRANS-TYPE-CD.        19490000
ET0001     MOVE WS-TRNFR-RJCT-CD TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF.   19500000
                                                                        19510000
           IF ACAT04IO-VINITRNF-CMNT > SPACES                           19520000
              MOVE ACAT04IO-VINITRNF-CMNT TO                            19530000
ET0001             CMNT-TXT OF DCLACTITRF                               19540000
           ELSE                                                         19550000
              MOVE CMNT-TXT OF DCLVTRNFR TO                             19560000
ET0001             CMNT-TXT OF DCLACTITRF                               19570000
           END-IF.                                                      19580000
                                                                        19590000
ET0002     IF ACAT04IO-ACCT-FREEZ-PROCESS = 'Y'                         19600000
ET0002        MOVE 'H'   TO NSCC-PEND-CD          OF DCLACTITRF         19610000
ET0002        MOVE '21'  TO TRNFR-TYPE-RJCT-CD    OF DCLACTITRF         19620000
ET0002        MOVE 'R'   TO TRANS-TYPE-CD         OF DCLACTITRF         19630000
ET0002                      ACAT04IO-INIT-TRANS-TYPE-CD                 19640000
ET0002        MOVE 'ACCOUNT IS FROZEN'                                  19650000
ET0002                   TO CMNT-TXT              OF DCLACTITRF         19660000
ET0002                      ACAT04IO-VINITRNF-CMNT                      19670000
ET0002     END-IF.                                                      19680000
ET0003     MOVE ACAT04IO-SIGN-ON-ID  TO CICS-SGNON-ID OF DCLACTITRF.    19690000
ET0003     MOVE ACAT04IO-USER-NAME   TO TPSCRT-USR-NM OF DCLACTITRF.    19700000
ET0003     MOVE ACAT04IO-USER-ID     TO TPSCRT-USR-ID OF DCLACTITRF.    19710000
ET0003     MOVE ACAT04IO-NET-NAME    TO CICS-NET-NM   OF DCLACTITRF.    19720000
                                                                        19730000
ET0001     MOVE 'FUL'  TO  TRNFR-TYPE-CD OF DCLACTITRF.                 19740000
ET0001     MOVE ACAT04IO-RCV-NBR     TO SBMTG-PRTCP-NBR OF DCLACTITRF.  19750000
ET0001     MOVE EIBTRMID TO CICS-TERM-ID-CD OF DCLACTITRF.              19760000
ET0001     MOVE 'ACAT04DA'  TO  PRGM-NM OF DCLACTITRF.                  19770000
      *                                                                 19780000
           EXEC SQL                                                     19790000
ET0001         INSERT INTO ACTITRF                                      19800000
                 ( CLIENT_NBR                                           19810000
                 , DLVR_NBR                                             19820000
                 , ACCT_DLVR_NBR                                        19830000
                 , RCV_NBR                                              19840000
                 , ACCT_RCV_NBR                                         19850000
                 , TRNFR_TYPE_CD                                        19860000
                 , RCV_NBR_STTS_CD                                      19870000
                 , DLVR_NBR_STTS_CD                                     19880000
                 , ACCT_RCV_STTS_CD                                     19890000
                 , ACCT_DLVR_STTS_CD                                    19900000
                 , SBMTG_PRTCP_NBR                                      19910000
                 , SBMT_PRT_NR_STS_CD                                   19920000
                 , ACAT_CONTROL_NBR                                     19930000
                 , CONTROL_NBR_STS_CD                                   19940000
                 , TRNFR_TYPE_STTS_CD                                   19950000
                 , TRANS_TYPE_CD                                        19960000
                 , TRANS_TYPE_STTS_CD                                   19970000
                 , RCV_CUST_NM                                          19980000
                 , RCV_CUST_NM_STS_CD                                   19990000
                 , RCV_SS_PRIM_NBR                                      20000000
                 , RCV_SS_PRIM_STS_CD                                   20010000
                 , RCV_SS_SCNDY_NBR                                     20020000
                 , RCV_SS_SCDY_STS_CD                                   20030000
                 , RCV_ACCT_TYPE_CD                                     20040000
                 , RCV_ACT_TYP_STS_CD                                   20050000
                 , RCV_OCC_BRKR_NBR                                     20060000
                 , RCV_OCC_STTS_CD                                      20070000
                 , RCV_CRSPN_NBR                                        20080000
                 , RCV_CRSPN_STTS_CD                                    20090000
                 , ACAT_CNTL_ASTD_NBR                                   20100000
                 , CNTL_ASTD_STTS_CD                                    20110000
                 , CMNT_TXT                                             20120000
                 , CMNT_STTS_CD                                         20130000
                 , PRCS_DT                                              20140000
                 , STTS_CD                                              20150000
                 , DSTBN_SIDE_CD                                        20160000
                 , SYS_ACT_CD                                           20170000
                 , SYS_RJCT_RSN_CD                                      20180000
                 , TRNFR_TYPE_RJCT_CD                                   20190000
                 , TRNFR_TYPE_RJC1_CD                                   20200000
                 , TRNFR_TYPE_RJC2_CD                                   20210000
                 , TRN_TYP_RJC_STS_CD                                   20220000
                 , PHSCL_SEQ_NBR                                        20230000
                 , PHSCL_SEQ_STTS_CD                                    20240000
                 , LGCL_SEQ_NBR                                         20250000
                 , LGCL_SEQ_NR_STS_CD                                   20260000
                 , PRTCP_CONTRA_CD                                      20270000
                 , CYCLE_CD                                             20280000
                 , DAYS_STTS_QTY                                        20290000
                 , TRANS_RFRN_ID_CD                                     20300000
                 , TRANS_RFRN_STTS_CD                                   20310000
                 , DB_CR_CD                                             20320000
                 , STTLM_ASCTD_DT                                       20330000
                 , STTLM_ASCTD_STS_CD                                   20340000
                 , RCRD_LNGTH_STTS_CD                                   20350000
                 , RCRD_STTS_CD                                         20360000
                 , NSCC_PEND_CD                                         20370000
                 , NSCC_ACK_IND                                         20380000
                 , UPDT_TMSTP                                           20390000
                 , CRT_TMSTP                                            20400000
                 , CICS_TERM_ID_CD                                      20410000
                 , PRGM_NM                                              20420000
                 , RR_CD                                                20430000
ET0003           , CICS_SGNON_ID                                        20440000
ET0003           , TPSCRT_USR_NM                                        20450000
ET0003           , TPSCRT_USR_ID                                        20460000
ET0003           , CICS_NET_NM                                          20470000
ET0003            )                                                     20480000
                 VALUES                                                 20490000
ET0001             (:DCLACTITRF.CLIENT-NBR                              20500000
ET0001             ,:DCLACTITRF.DLVR-NBR                                20510000
ET0001             ,:DCLACTITRF.ACCT-DLVR-NBR                           20520000
ET0001             ,:DCLACTITRF.RCV-NBR                                 20530000
ET0001             ,:DCLACTITRF.ACCT-RCV-NBR                            20540000
ET0001             ,:DCLACTITRF.TRNFR-TYPE-CD                           20550000
ET0001             ,:DCLACTITRF.RCV-NBR-STTS-CD                         20560000
ET0001             ,:DCLACTITRF.DLVR-NBR-STTS-CD                        20570000
ET0001             ,:DCLACTITRF.ACCT-RCV-STTS-CD                        20580000
ET0001             ,:DCLACTITRF.ACCT-DLVR-STTS-CD                       20590000
ET0001             ,:DCLACTITRF.SBMTG-PRTCP-NBR                         20600000
ET0001             ,:DCLACTITRF.SBMT-PRT-NR-STS-CD                      20610000
ET0001             ,:DCLACTITRF.ACAT-CONTROL-NBR                        20620000
ET0001             ,:DCLACTITRF.CONTROL-NBR-STS-CD                      20630000
ET0001             ,:DCLACTITRF.TRNFR-TYPE-STTS-CD                      20640000
ET0001             ,:DCLACTITRF.TRANS-TYPE-CD                           20650000
ET0001             ,:DCLACTITRF.TRANS-TYPE-STTS-CD                      20660000
ET0001             ,:DCLACTITRF.RCV-CUST-NM                             20670000
ET0001             ,:DCLACTITRF.RCV-CUST-NM-STS-CD                      20680000
ET0001             ,:DCLACTITRF.RCV-SS-PRIM-NBR                         20690000
ET0001             ,:DCLACTITRF.RCV-SS-PRIM-STS-CD                      20700000
ET0001             ,:DCLACTITRF.RCV-SS-SCNDY-NBR                        20710000
ET0001             ,:DCLACTITRF.RCV-SS-SCDY-STS-CD                      20720000
ET0001             ,:DCLACTITRF.RCV-ACCT-TYPE-CD                        20730000
ET0001             ,:DCLACTITRF.RCV-ACT-TYP-STS-CD                      20740000
ET0001             ,:DCLACTITRF.RCV-OCC-BRKR-NBR                        20750000
ET0001             ,:DCLACTITRF.RCV-OCC-STTS-CD                         20760000
ET0001             ,:DCLACTITRF.RCV-CRSPN-NBR                           20770000
ET0001             ,:DCLACTITRF.RCV-CRSPN-STTS-CD                       20780000
ET0001             ,:DCLACTITRF.ACAT-CNTL-ASTD-NBR                      20790000
ET0001             ,:DCLACTITRF.CNTL-ASTD-STTS-CD                       20800000
ET0001             ,:DCLACTITRF.CMNT-TXT                                20810000
ET0001             ,:DCLACTITRF.CMNT-STTS-CD                            20820000
ET0001             ,:DCLACTITRF.PRCS-DT                                 20830000
ET0001             ,:DCLACTITRF.STTS-CD                                 20840000
ET0001             ,:DCLACTITRF.DSTBN-SIDE-CD                           20850000
ET0001             ,:DCLACTITRF.SYS-ACT-CD                              20860000
ET0001             ,:DCLACTITRF.SYS-RJCT-RSN-CD                         20870000
ET0001             ,:DCLACTITRF.TRNFR-TYPE-RJCT-CD                      20880000
ET0001             ,:DCLACTITRF.TRNFR-TYPE-RJC1-CD                      20890000
ET0001             ,:DCLACTITRF.TRNFR-TYPE-RJC2-CD                      20900000
ET0001             ,:DCLACTITRF.TRN-TYP-RJC-STS-CD                      20910000
ET0001             ,:DCLACTITRF.PHSCL-SEQ-NBR                           20920000
ET0001             ,:DCLACTITRF.PHSCL-SEQ-STTS-CD                       20930000
ET0001             ,:DCLACTITRF.LGCL-SEQ-NBR                            20940000
ET0001             ,:DCLACTITRF.LGCL-SEQ-NR-STS-CD                      20950000
ET0001             ,:DCLACTITRF.PRTCP-CONTRA-CD                         20960000
ET0001             ,:DCLACTITRF.CYCLE-CD                                20970000
ET0001             ,:DCLACTITRF.DAYS-STTS-QTY                           20980000
ET0001             ,:DCLACTITRF.TRANS-RFRN-ID-CD                        20990000
ET0001             ,:DCLACTITRF.TRANS-RFRN-STTS-CD                      21000000
ET0001             ,:DCLACTITRF.DB-CR-CD                                21010000
ET0001             ,:DCLACTITRF.STTLM-ASCTD-DT                          21020000
ET0001             ,:DCLACTITRF.STTLM-ASCTD-STS-CD                      21030000
ET0001             ,:DCLACTITRF.RCRD-LNGTH-STTS-CD                      21040000
ET0001             ,:DCLACTITRF.RCRD-STTS-CD                            21050000
ET0001             ,:DCLACTITRF.NSCC-PEND-CD                            21060000
LRM008             ,' '                                                 21070000
                   , CURRENT TIMESTAMP                                  21080000
                   , CURRENT TIMESTAMP                                  21090000
ET0001             ,:DCLACTITRF.CICS-TERM-ID-CD                         21100000
ET0001             ,:DCLACTITRF.PRGM-NM                                 21110000
ET0001             ,:DCLACTITRF.RR-CD                                   21120000
ET0003             ,:DCLACTITRF.CICS-SGNON-ID                           21130000
ET0003             ,:DCLACTITRF.TPSCRT-USR-NM                           21140000
ET0003             ,:DCLACTITRF.TPSCRT-USR-ID                           21150000
ET0003             ,:DCLACTITRF.CICS-NET-NM                             21160000
ET0003               )                                                  21170000
093200     END-EXEC.                                                    21180000
                                                                        21190000
093400     EVALUATE SQLCODE                                             21200000
093500          WHEN +0                                                 21210000
093600               SET ACAT04IO-VINITRNF-INSERTED TO TRUE             21220000
                     MOVE WS-TRANS-TYPE-CD TO                           21230000
                          ACAT04IO-INIT-TRANS-TYPE-CD                   21240000
02/03           WHEN -803                                               21250000
                     MOVE 'DUPLICATE TIF CHANGES, TRY LATER'            21260000
                     TO WS-RETURN-MSG                                   21270000
      *********      PERFORM 0750-UPDT-VINITRNF THRU 0750-EXIT          21280000
02/03           WHEN -911                                               21290000
                     IF WS-ISRT-RETRY-COUNT < +11                       21300000
                        ADD +1 TO WS-ISRT-RETRY-COUNT                   21310000
                        GO TO 0700-ISRT-VINITRNF                        21320000
                     ELSE                                               21330000
                        MOVE                                            21340000
ET0001                  ' !!! DATA BASE IS BUSY, TRY LATER (ACTITRF)'   21350000
                        TO WS-RETURN-MSG                                21360000
                     END-IF                                             21370000
094000          WHEN OTHER                                              21380000
                     MOVE SPACE TO ACAT04IO-VINITRNF-SW                 21390000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     21400000
                     PERFORM 9500-RETURN-DB2-ERROR                      21410000
094200     END-EVALUATE.                                                21420000
                                                                        21430000
       0700-EXIT.                                                       21440000
           EXIT.                                                        21450000
      /                                                                 21460000
02/03  0750-UPDT-VINITRNF.                                              21470000
                                                                        21480000
           IF ACAT04IO-M4ACCEL = 'S'                                    21490000
               MOVE 'X'  TO  WS-TRANS-TYPE-CD                           21500000
               MOVE '00' TO  WS-TRNFR-RJCT-CD                           21510000
           ELSE                                                         21520000
               IF ACAT04IO-M4REJ = 'S'   OR                             21530000
                  ACAT04IO-M4REJC = 'S'                                 21540000
                  MOVE 'R' TO WS-TRANS-TYPE-CD                          21550000
                  MOVE '21' TO WS-TRNFR-RJCT-CD                         21560000
               END-IF                                                   21570000
           END-IF.                                                      21580000
                                                                        21590000
           MOVE WS-TRANS-TYPE-CD TO ACAT04IO-INIT-TRANS-TYPE-CD.        21600000
                                                                        21610000
           IF ACAT04IO-VINITRNF-CMNT > SPACES                           21620000
              MOVE ACAT04IO-VINITRNF-CMNT TO  WS-VINITRNF-CMNT          21630000
           END-IF.                                                      21640000
      *                                                                 21650000
           EXEC SQL                                                     21660000
ET0001          UPDATE ACTITRF                                          21670000
                  SET TRANS_TYPE_CD = :WS-TRANS-TYPE-CD                 21680000
                     ,TRNFR_TYPE_RJCT_CD = :WS-TRNFR-RJCT-CD            21690000
                     ,CMNT_TXT = :WS-VINITRNF-CMNT                      21700000
                     ,UPDT_TMSTP = CURRENT TIMESTAMP                    21710000
                     ,PRGM_NM = 'ACAT04DA'                              21720000
LRM007               ,NSCC_ACK_IND      =  ' '                          21730000
093000             WHERE (CLIENT_NBR = :SV-CLIENT-NBR)                  21740000
                     AND (TRNFR_TYPE_CD = 'FUL')                        21750000
                     AND (RCV_NBR = :WS-RCV-NBR)                        21760000
                     AND (DLVR_NBR = :WS-DLVR-NBR)                      21770000
                     AND (ACCT_RCV_NBR = :WS-ACCT-RCV-NBR)              21780000
                     AND (ACCT_DLVR_NBR = :WS-ACCT-DLVR-NBR)            21790000
093200      END-EXEC.                                                   21800000
093300*                                                                 21810000
093400      EVALUATE SQLCODE                                            21820000
093500          WHEN +0                                                 21830000
                     SET ACAT04IO-VINITRNF-UPDATED TO TRUE              21840000
093800          WHEN +100                                               21850000
                     SET VINITRNF-NOT-FOUND TO TRUE                     21860000
                     SET ACAT04IO-VINITRNF-NOT-FOUND TO TRUE            21870000
094000          WHEN OTHER                                              21880000
                     SET VINITRNF-NOT-FOUND TO TRUE                     21890000
                     SET ACAT04IO-VINITRNF-NOT-FOUND TO TRUE            21900000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     21910000
                     PERFORM 9500-RETURN-DB2-ERROR                      21920000
094200      END-EVALUATE.                                               21930000
094300*                                                                 21940000
       0750-EXIT.                                                       21950000
02/03      EXIT.                                                        21960000
      /                                                                 21970000
       0800-DLTE-VINITRNF.                                              21980000
      *                                                                 21990000
           MOVE SPACE TO WS-CURRENT-VTRNFR-SW.                          22000000
                                                                        22010000
           PERFORM 0650-RETRIEVE-CURRENT-VTRNFR.                        22020000
           IF CURRENT-VTRNFR-FOUND                                      22030000
              MOVE RCV-NBR OF DCLVTRNFR       TO WS-RCV-NBR             22040000
              MOVE DLVR-NBR OF DCLVTRNFR      TO WS-DLVR-NBR            22050000
              MOVE ACCT-DLVR-NBR OF DCLVTRNFR TO WS-ACCT-DLVR-NBR       22060000
              MOVE ACCT-RCV-NBR OF DCLVTRNFR  TO WS-ACCT-RCV-NBR        22070000
           ELSE                                                         22080000
              EXEC CICS RETURN END-EXEC                                 22090000
           END-IF.                                                      22100000
      *                                                                 22110000
           EXEC SQL                                                     22120000
                DELETE                                                  22130000
ET0001           FROM ACTITRF                                           22140000
ET0001**           WHERE (CLIENT_NBR = :SV-CLIENT-NBR                   22150000
ET0001**             AND  TRNFR_TYPE_CD = 'FUL'                         22160000
ET0001**             AND  RCV_NBR = :WS-RCV-NBR                         22170000
ET0001**             AND  DLVR_NBR = :WS-DLVR-NBR                       22180000
ET0001**             AND  ACCT_DLVR_NBR = :WS-ACCT-DLVR-NBR             22190000
ET0001**             AND  ACCT_RCV_NBR =  :WS-ACCT-RCV-NBR)             22200000
ET0001**         OR                                                     22210000
ET0001             WHERE                                                22220000
093000                   (CLIENT_NBR = :SV-CLIENT-NBR                   22230000
                     AND  ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR          22240000
                     AND  TRNFR_TYPE_CD = 'FUL'                         22250000
                     AND  RCV_NBR = :WS-RCV-NBR                         22260000
                     AND  DLVR_NBR = :WS-DLVR-NBR                       22270000
                     AND  ACCT_DLVR_NBR = :WS-ACCT-DLVR-NBR             22280000
                     AND  ACCT_RCV_NBR =  :WS-ACCT-RCV-NBR)             22290000
           END-EXEC.                                                    22300000
                                                                        22310000
093400     EVALUATE SQLCODE                                             22320000
093500          WHEN +0                                                 22330000
093600               SET ACAT04IO-VINITRNF-DELETED TO TRUE              22340000
                     MOVE SPACE TO ACAT04IO-INIT-TRANS-TYPE-CD          22350000
                                   ACAT04IO-VINITRNF-CMNT               22360000
093500          WHEN +100                                               22370000
093600               SET ACAT04IO-VINITRNF-NOT-FOUND TO TRUE            22380000
094000          WHEN OTHER                                              22390000
                     MOVE SPACE TO ACAT04IO-VINITRNF-SW                 22400000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     22410000
                     PERFORM 9500-RETURN-DB2-ERROR                      22420000
094200     END-EVALUATE.                                                22430000
                                                                        22440000
       0800-EXIT.                                                       22450000
           EXIT.                                                        22460000
      /                                                                 22470000
       0900-UPDT-VTRNFR.                                                22480000
           IF ACAT04IO-M4ACCPT = 'S'                                    22490000
              EXEC SQL                                                  22500000
                   UPDATE VTRNFR                                        22510000
                     SET NSCC_PEND_CD = 'A'                             22520000
                        ,UPDT_TMSTP = CURRENT TIMESTAMP                 22530000
                        ,PRGM_NM = 'ACAT04DA'                           22540000
                   WHERE CLIENT_NBR = :SV-CLIENT-NBR AND                22550000
                         ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR           22560000
                END-EXEC                                                22570000
093400          EVALUATE SQLCODE                                        22580000
093500            WHEN +0                                               22590000
                       SET ACAT04IO-VTRNFR-UPDATED TO TRUE              22600000
                       MOVE 'A' TO ACAT04IO-VTRNFR-NSCC-PEND-CD         22610000
LRM011                 PERFORM 0910-INSERT-VTRNFRAU                     22620000
                  WHEN +100                                             22630000
                       SET ACAT04IO-VTRNFR-NOT-FOUND TO TRUE            22640000
                       SET CURRENT-VTRNFR-NOT-FOUND TO TRUE             22650000
                       MOVE ' FAIL TO UPDATE VTRNFR (ACCEPT)'           22660000
                                                     TO WS-RETURN-MSG   22670000
02/03           WHEN -911                                               22680000
                     IF WS-UPDT-RETRY-COUNT < +11                       22690000
                        ADD +1 TO WS-UPDT-RETRY-COUNT                   22700000
                        GO TO  0900-UPDT-VTRNFR                         22710000
                     ELSE                                               22720000
                        MOVE                                            22730000
                        ' !!! DATA BASE IS BUSY, TRY LATER (VTRNFR)'    22740000
                     TO WS-RETURN-MSG                                   22750000
                     END-IF                                             22760000
094000            WHEN OTHER                                            22770000
                       MOVE SPACE TO ACAT04IO-VTRNFR-SW                 22780000
                       PERFORM 9000-WRITE-TO-CICS-LOG                   22790000
                       PERFORM 9500-RETURN-DB2-ERROR                    22800000
094200          END-EVALUATE                                            22810000
              ELSE                                                      22820000
                 IF ACAT04IO-M4ACCPT = SPACE                            22830000
                   EXEC SQL                                             22840000
                        UPDATE VTRNFR                                   22850000
                          SET NSCC_PEND_CD = ' '                        22860000
                             ,UPDT_TMSTP = CURRENT TIMESTAMP            22870000
                             ,PRGM_NM = 'ACAT04DA'                      22880000
                        WHERE CLIENT_NBR = :SV-CLIENT-NBR AND           22890000
                              ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR      22900000
                     END-EXEC                                           22910000
093400               EVALUATE SQLCODE                                   22920000
093500                WHEN +0                                           22930000
                           SET ACAT04IO-VTRNFR-UPDATED TO TRUE          22940000
                           MOVE ' ' TO ACAT04IO-VTRNFR-NSCC-PEND-CD     22950000
LRM011                     PERFORM 0912-DELETE-VTRNFRAU                 22951000
                      WHEN +100                                         22952000
                           SET ACAT04IO-VTRNFR-NOT-FOUND TO TRUE        22953000
                           SET CURRENT-VTRNFR-NOT-FOUND TO TRUE         22954000
                           MOVE ' FAIL TO UPDATE VTRNFR (UNACCEPT)'     22955000
                                                       TO WS-RETURN-MSG 22956000
094000                WHEN OTHER                                        22957000
                           MOVE SPACE TO ACAT04IO-VTRNFR-SW             22958000
                           PERFORM 9000-WRITE-TO-CICS-LOG               22959000
                           PERFORM 9500-RETURN-DB2-ERROR                22960000
094200               END-EVALUATE                                       22970000
                 END-IF                                                 22980000
              END-IF.                                                   22990000
                                                                        23000000
       0900-EXIT.                                                       23010000
           EXIT.                                                        23020000
      *                                                                 23030000
LRM011 0910-INSERT-VTRNFRAU.                                            23040000
           EXEC SQL                                                     23050000
                SET :WS-TIMESTAMP = CURRENT TIMESTAMP                   23060000
           END-EXEC.                                                    23070000
           MOVE SPACES TO DCLVTRNFRAU.                                  23080000
           MOVE ACAT04IO-CLIENT-NBR TO CLIENT-NBR OF DCLVTRNFRAU        23090000
           MOVE ACAT04IO-ACAT-CONTROL-NBR TO ACAT-CONTROL-NBR           23100000
                                                OF DCLVTRNFRAU          23110000
           MOVE WS-TIMESTAMP TO AUD-CRT-TMSTP OF DCLVTRNFRAU            23111000
                                UPDT-TMSTP    OF DCLVTRNFRAU            23111100
                                CRT-TMSTP     OF DCLVTRNFRAU            23111200
LRM011****  "A" MEANS ACCEPTED TO CAT761A.                              23111300
           MOVE 'A' TO  TRANS-TYPE-CD         OF DCLVTRNFRAU            23111400
           MOVE ACAT04IO-RCV-CUST-NM TO RCV-CUST-NM OF DCLVTRNFRAU      23111500
           MOVE ACAT04IO-VTRNFR-CMNT TO CMNT-TXT OF DCLVTRNFRAU         23111600
           MOVE ACAT04IO-RR-CD       TO CMNT-TXT OF DCLVTRNFRAU(70:3)   23111700
           MOVE ACAT04IO-SIGN-ON-ID  TO CMNT-TXT OF DCLVTRNFRAU(73:4)   23111800
           MOVE ACAT04IO-USER-NAME   TO CMNT-TXT OF DCLVTRNFRAU(77:20)  23111900
           MOVE ACAT04IO-USER-ID     TO CMNT-TXT OF DCLVTRNFRAU(97:8)   23112000
           MOVE ACAT04IO-NET-NAME    TO CMNT-TXT OF DCLVTRNFRAU(105:8)  23113000
           MOVE ACAT04IO-TFR-TYPE    TO CMNT-TXT OF DCLVTRNFRAU(113:3)  23113100
           MOVE ZEROS TO DAYS-STTS-QTY              OF DCLVTRNFRAU      23113200
           MOVE '0001-01-01' TO STTLM-DT            OF DCLVTRNFRAU      23113300
                                PRCS-DT             OF DCLVTRNFRAU      23113400
                                STTLM-ASCTD-DT      OF DCLVTRNFRAU      23113500
           MOVE ACAT04IO-BRANCH-CD  TO BRANCH-CD    OF DCLVTRNFRAU      23113600
           MOVE ACAT04IO-ACCT-CD    TO ACCT-CD      OF DCLVTRNFRAU      23113700
                       MOVE 'A' TO ACAT04IO-VTRNFR-NSCC-PEND-CD         23113800
           MOVE 'A'                TO TRANS-TYPE-CD OF DCLVTRNFRAU      23113900
           MOVE ACAT04IO-ACCT-DLVR-NBR TO ACCT-DLVR-NBR                 23114000
                                                OF DCLVTRNFRAU          23114100
           MOVE ACAT04IO-ACCT-RCV-NBR  TO ACCT-RCV-NBR                  23114200
                                                OF DCLVTRNFRAU          23114300
           MOVE EIBTRMID TO CICS-TERM-ID-CD     OF DCLVTRNFRAU          23114400
           MOVE 'ACAT04DA' TO PRGM-NM           OF DCLVTRNFRAU          23114500
           EXEC SQL                                                     23114600
             INSERT INTO VTRNFRAU                                       23114700
              ( CLIENT_NBR                                              23114800
               ,ACAT_CONTROL_NBR                                        23114900
               ,AUD_CRT_TMSTP                                           23115000
               ,TRANS_TYPE_CD                                           23115100
               ,RCV_CUST_NM                                             23115200
               ,RCV_SS_PRIM_NBR                                         23115300
               ,RCV_SS_SCNDY_NBR                                        23115400
               ,RCV_ACCT_TYPE_CD                                        23115500
               ,RCV_OCC_BRKR_NBR                                        23115600
               ,RCV_CRSPN_NBR                                           23115700
               ,ACAT_CNTL_ASTD_NBR                                      23115800
               ,STTLM_ASCTD_DT                                          23115900
               ,PRTCP_CONTRA_CD                                         23116000
               ,CMNT_TXT                                                23116100
               ,NSCC_NON_ADP_IND                                        23116200
               ,CYCLE_CD                                                23116300
               ,DAYS_STTS_QTY                                           23116400
               ,STTLM_DT                                                23116500
               ,PRCS_DT                                                 23116600
               ,STTS_CD                                                 23116700
               ,SYS_RJCT_RSN_CD                                         23116800
               ,TRNFR_TYPE_RJC1_CD                                      23116900
               ,ACCT_CD                                                 23117000
               ,ACCT_DLVR_NBR                                           23117100
               ,ACCT_RCV_NBR                                            23117200
               ,BRANCH_CD                                               23117300
               ,CICS_TERM_ID_CD                                         23117400
               ,PRGM_NM                                                 23117500
               ,UPDT_TMSTP                                              23117600
               ,CRT_TMSTP )                                             23117700
                 VALUES                                                 23117800
                   (:DCLVTRNFRAU.CLIENT-NBR                             23117900
                   ,:DCLVTRNFRAU.ACAT-CONTROL-NBR                       23118000
                   ,:DCLVTRNFRAU.AUD-CRT-TMSTP                          23118100
                   ,:DCLVTRNFRAU.TRANS-TYPE-CD                          23118200
                   ,:DCLVTRNFRAU.RCV-CUST-NM                            23118300
                   ,:DCLVTRNFRAU.RCV-SS-PRIM-NBR                        23118400
                   ,:DCLVTRNFRAU.RCV-SS-SCNDY-NBR                       23118500
                   ,:DCLVTRNFRAU.RCV-ACCT-TYPE-CD                       23118600
                   ,:DCLVTRNFRAU.RCV-OCC-BRKR-NBR                       23118700
                   ,:DCLVTRNFRAU.RCV-CRSPN-NBR                          23118800
                   ,:DCLVTRNFRAU.ACAT-CNTL-ASTD-NBR                     23118900
                   ,:DCLVTRNFRAU.STTLM-ASCTD-DT                         23119000
                   ,:DCLVTRNFRAU.PRTCP-CONTRA-CD                        23119100
                   ,:DCLVTRNFRAU.CMNT-TXT                               23119200
                   ,:DCLVTRNFRAU.NSCC-NON-ADP-IND                       23119300
                   ,:DCLVTRNFRAU.CYCLE-CD                               23119400
                   ,:DCLVTRNFRAU.DAYS-STTS-QTY                          23119500
                   ,:DCLVTRNFRAU.STTLM-DT                               23119600
                   ,:DCLVTRNFRAU.PRCS-DT                                23119700
                   ,:DCLVTRNFRAU.STTS-CD                                23119800
                   ,:DCLVTRNFRAU.SYS-RJCT-RSN-CD                        23119900
                   ,:DCLVTRNFRAU.TRNFR-TYPE-RJC1-CD                     23120000
                   ,:DCLVTRNFRAU.ACCT-CD                                23120100
                   ,:DCLVTRNFRAU.ACCT-DLVR-NBR                          23120200
                   ,:DCLVTRNFRAU.ACCT-RCV-NBR                           23120300
                   ,:DCLVTRNFRAU.BRANCH-CD                              23120400
                   ,:DCLVTRNFRAU.CICS-TERM-ID-CD                        23120500
                   ,:DCLVTRNFRAU.PRGM-NM                                23120600
                   ,:DCLVTRNFRAU.UPDT-TMSTP                             23120700
                   ,:DCLVTRNFRAU.CRT-TMSTP)                             23120800
             END-EXEC.                                                  23120900
             MOVE +0 TO SQLCODE.                                        23121000
      *                                                                 23121100
LRM011 0912-DELETE-VTRNFRAU.                                            23121200
           MOVE ACAT04IO-CLIENT-NBR TO CLIENT-NBR OF DCLVTRNFRAU        23121300
           MOVE ACAT04IO-ACAT-CONTROL-NBR TO ACAT-CONTROL-NBR           23121400
                                                OF DCLVTRNFRAU          23121500
           EXEC SQL                                                     23121600
             DELETE FROM VTRNFRAU                                       23121700
                WHERE                                                   23121800
                     CLIENT_NBR       = :DCLVTRNFRAU.CLIENT-NBR         23121900
                 AND ACAT_CONTROL_NBR = :DCLVTRNFRAU.ACAT-CONTROL-NBR   23122000
                 AND TRANS_TYPE_CD    = 'A'                             23123000
             END-EXEC.                                                  23124000
             MOVE +0 TO SQLCODE.                                        23125000
ET0002*                                                                 23126000
ET0002*----------------------------------------------------------------*23127000
ET0002* UPDATE ACCT-FRZN-IND OF VTRNFR.                                 23128000
ET0002* ACCOUNT FREEZE IS FOUND BY ONLINE PROGRAM.                      23129000
ET0002* 1. ACCT-FRZN_CODE = 'O' MEANS ACCT FREEZE IS FOUND BY ONLINE PRG23130000
ET0002* 2. ACCT-FRZN_CODE = 'Y' MEANS ACCT FREEZE IS FOUND BY BATCH PRG 23140000
ET0002*----------------------------------------------------------------*23150000
ET0002 0940-UPDATE-ACCT-FRZN-IND.                                       23160000
           EXEC SQL                                                     23170000
                SET :WS-TIMESTAMP = CURRENT TIMESTAMP                   23180000
           END-EXEC.                                                    23190000
                                                                        23200000
           EXEC SQL                                                     23210000
              UPDATE VTRNFR                                             23220000
                 SET  ACCT_FRZN_IND = 'O'                               23230000
                     ,UPDT_TMSTP = :WS-TIMESTAMP                        23240000
                     ,PRGM_NM = 'ACAT04DA'                              23250000
                 WHERE                                                  23260000
                      CLIENT_NBR = :SV-CLIENT-NBR                       23270000
                      AND ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR          23280000
           END-EXEC.                                                    23290000
                                                                        23300000
           EVALUATE SQLCODE                                             23310000
               WHEN +0                                                  23320000
                    CONTINUE                                            23330000
               WHEN +100                                                23340000
                    MOVE 'VTRNFR TABLE NOT FOUND - FAIL TO UPDATE ACCT-F23350000
      -                  'RZN-IND OF VTRNFR'                            23360000
                      TO  WS-RETURN-MSG                                 23370000
               WHEN OTHER                                               23380000
                    MOVE SPACE TO ACAT04IO-VTRNFR-SW                    23390000
                    PERFORM 9000-WRITE-TO-CICS-LOG                      23400000
                    PERFORM 9500-RETURN-DB2-ERROR                       23410000
           END-EVALUATE.                                                23420000
       EJECT                                                            23430000
       ABENDED.                                                         23440000
     ***   EXEC CICS ASSIGN ABCODE(WS-ABCODE) END-EXEC.                 23450000
     ***   MOVE WS-ABEND-MESSAGE TO BHST-MESSAGE.                       23460000
     ***   MOVE '9999' TO BHST-RETURN-CODE.                             23470000
     ***                                                                23480000
           EXEC CICS RETURN END-EXEC.                                   23490000
                                                                        23500000
      *==============================                                   23510000
       9000-WRITE-TO-CICS-LOG.                                          23520000
      *==============================                                   23530000
     ***   MOVE SQLCODE TO BHST-SQLCODE.                                23540000
           IF SQLCODE = -803                                            23550000
               CONTINUE                                                 23560000
           ELSE                                                         23570000
               MOVE SPACES             TO WS-ERRL-DATA                  23580000
               SET WRITE-ERROR-TO-LOG  TO TRUE                          23590000
               MOVE 'ACT4'             TO CALLING-TRAN-ID               23600000
               MOVE 'ACAT04DA'         TO CALLING-PROGRAM-ID            23610000
               MOVE SQLCA              TO SQLCA-AREA                    23620000
               EXEC CICS LINK PROGRAM ('FPDB2LOG')                      23630000
                     COMMAREA (WS-ERRL-DATA)                            23640000
                     LENGTH (LENGTH OF WS-ERRL-DATA)                    23650000
                     NOHANDLE                                           23660000
               END-EXEC                                                 23670000
           END-IF.                                                      23680000
     ***   EXEC CICS RETURN END-EXEC.                                   23690000
                                                                        23700000
       9500-RETURN-DB2-ERROR.                                           23710000
           EXEC CICS SYNCPOINT ROLLBACK END-EXEC.                       23720000
           SET ACAT04IO-DB2-ERROR TO TRUE                               23730000
           MOVE SQLCAID TO ACAT04IO-SQLCAID                             23740000
           MOVE SQLCODE TO ACAT04IO-SQLCODE                             23750000
           MOVE SQLERRM TO ACAT04IO-SQLERRM                             23760000
           EXEC CICS RETURN END-EXEC.                                   23770000
      ************************** BOTTOM OF DATA ************************23780000
094600*---------------------------------------------------------------* 23790000
                                                                        23800000
