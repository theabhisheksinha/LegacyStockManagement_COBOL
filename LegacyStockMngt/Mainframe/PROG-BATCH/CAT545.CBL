000001* PDX    - CAT545   C0348882 12/06/13 06:47:05 TBCHKOP            00001000
      * CSG001 SSR 91356  MOVE SPACES TO BPDATES-CALENDAR-TYPE.         00010000
000001* PDX    - CAT545   C0260091 08/22/08 10:51:29 TBDOJUN            00001000
      * DJ0002 SSR 55766 ASCENDIS(WORKFLOW) MOVE NSCC-ACK-IND           00010000
      * DJ0002 BYPASS ASCENDIS(WORKFLOW) TRANSFERS. DO NOT REJECT THEM. 00010000
000001* PDX    - CAT545   C0236781 07/05/06 09:44:49 TBLAMUR            00010000
      * LRM004 ADDITIONAL CHANGE TO RECOGNIZE ONLINE FRZN REJECT        00020000
000001* PDX    - CAT545   C0235814 06/08/06 14:32:34 TBLAMUR            00030000
      * LRM003 SSR# 45744 SET DAIN ACCT FREEZE REJECTS ON HOLD          00040000
      * ON RECEIVER SIDE PTR,PTD TO SUBMIT (OUT ON CYCLE 5)             00050000
000001* PDX    - CAT545   C0219502 04/08/05 11:40:17 TBEDTAK            00060000
      *ET0002  - FIX BUG                                                00070000
000001* PDX    - CAT545   C0214955 12/27/04 15:38:06 TBEDTAK            00080000
      *ET0001 SSR# 40042  DB2 INITIAL TBL KEY CHANGE WITH NEW TBL NAME  00090000
000001* PDX    - CAT545   C0183884 12/13/02 09:14:08 TBLAMUR            00100000
      *LRM002 SSR# 00024796 WAIT TILL REV DAY 3 TO AUTO REJECT          00110000
000001* PDX    - CAT545   C0159384 07/12/01 10:34:41 TBLAMUR            00120000
      *DJ0001 SSR# R5246800 MUTUAL FUNDS CLEANUPS (MFC)                 00130000
      *       IF B1 434666 IS ON, AND MFC NOT ACCEPTED, REJECT IT.      00140000
000001* PDX    - CAT545   C0157686 04/20/01 14:02:37 TBLAMUR            00150000
000001* PDX    - CAT545   C0125684 05/10/99 16:45:52 TBLAMUR            00160000
000001* PDX    - CAT545   C0121105 01/29/99 17:29:56 TBYOHON            00170000
000001* PDX    - CAT545   C0119611 12/18/98 15:12:43 TBLAMUR            00180000
000001* PDX    - CAT545   C0118717 11/30/98 08:36:39 TBLAMUR            00190000
000001* PDX    - CAT545   C0115343 10/22/98 14:08:45 TBYOHON            00200000
       IDENTIFICATION DIVISION.                                         00210000
       PROGRAM-ID.  CAT545.                                             00220000
      *REMARK.                                                          00230000
      *  ACATS REDESIGN -                                               00240000
      *        THIS PROGRAM DOES ACAT DATABASE MAINTENACE -             00250000
      *        CREATE REJECT NO ACTION NON-STANDARD AS A RECEIVER.      00260000
      *        USER HAS TO "ACCEPT" THE TRANSFER ON THE ACAX SCREEN.    00260000
      * RCL RCR FRV PTD/CRD MFC                                         00270000
       ENVIRONMENT DIVISION.                                            00280000
       INPUT-OUTPUT SECTION.                                            00290000
       FILE-CONTROL.                                                    00300000
       DATA DIVISION.                                                   00310000
      ******************************************************************00320000
       WORKING-STORAGE SECTION.                                         00330000
      ******************************************************************00340000
DJ0001     COPY PDXIDCOB.                                               00350000
       77  FILLER                      PIC X(06) VALUE 'CAT545'.        00360000
       77  WS-END-OF-TRNFR             PIC X       VALUE ' '.           00370000
           88 END-OF-TRNFR             VALUE 'Y'.                       00380000
       77  WS-DLTE-COUNT               PIC S9(3) COMP-3 VALUE +0.       00390000
           COPY STUBCPY.                                                00400000
       01  WS-CURRENT-TMSTP            PIC X(26).                       00410000
       01  WS-CAT545-WORK-AREA.                                         00420000
           03  WS-FIRST-TIME-SW        PIC X(1)    VALUE 'Y'.           00430000
               88  FIRST-TIME          VALUE 'Y'.                       00440000
           03  SV-CLIENT-NBR           PIC X(04)   VALUE LOW-VALUES.    00450000
           03  WS-CLIENT-NBR           PIC X(04)   VALUE LOW-VALUES.    00460000
           03  WS-ACAT-CNTL-NBR        PIC X(14)   VALUE LOW-VALUES.    00470000
           03  WS-ACAT-PARTL-NN-DAY    PIC 9(02)   VALUE 0.             00480000
           03  WK-STTLM-DATE.                                           00490000
               05  STTLM-YYYY.                                          00500000
                   07 STTLM-CC         PIC X(02).                       00510000
                   07 STTLM-YY         PIC X(02).                       00520000
               05  FILLER              PIC X.                           00530000
               05  STTLM-MM            PIC X(02).                       00540000
               05  FILLER              PIC X.                           00550000
               05  STTLM-DD            PIC X(02).                       00560000
               05  FILLER              PIC X(16).                       00570000
           03  WS-STTLM-DATE.                                           00580000
               05  WS-STTLM-YYYY       PIC X(04).                       00590000
               05  WS-STTLM-MM         PIC X(02).                       00600000
               05  WS-STTLM-DD         PIC X(02).                       00610000
           03  WS-TODAY-CCYYMMDD-AREA.                                  00620000
               05  WS-TODAY-CC         PIC XX.                          00630000
               05  WS-TODAY-YY         PIC XX.                          00640000
               05  WS-TODAY-MM         PIC XX.                          00650000
               05  WS-TODAY-DD         PIC XX.                          00660000
           03  WS-TODAY-CCYYMMDD REDEFINES                              00670000
               WS-TODAY-CCYYMMDD-AREA  PIC 9(08).                       00680000
           03  WS-PROC-DAY             PIC X(10).                       00690000
           03  FILLER REDEFINES WS-PROC-DAY.                            00700000
               05  WS-PROC-YYYY.                                        00710000
                   07 WS-PROC-CC       PIC X(02).                       00720000
                   07 WS-PROC-YY       PIC X(02).                       00730000
               05  FILLER-1            PIC X.                           00740000
               05  WS-PROC-MM          PIC X(02).                       00750000
               05  FILLER-2            PIC X.                           00760000
               05  WS-PROC-DD          PIC X(02).                       00770000
           03  WS-DATE-CCYYMMDD        PIC 9(08).                       00780000
           03  WS-DATE-CCYYMMDD-AREA REDEFINES WS-DATE-CCYYMMDD.        00790000
               05  WS-DATE-CCYYMMDD-CC           PIC X(02).             00800000
               05  WS-DATE-CCYYMMDD-YY           PIC X(02).             00810000
               05  WS-DATE-CCYYMMDD-MM           PIC X(02).             00820000
               05  WS-DATE-CCYYMMDD-DD           PIC X(02).             00830000
           03  WS-DATE-MMDDCCYY        PIC 9(08).                       00840000
           03  WS-DATE-MMDDCCYY-AREA REDEFINES WS-DATE-MMDDCCYY.        00850000
               05  WS-DATE-MMDDCCYY-MM           PIC X(02).             00860000
               05  WS-DATE-MMDDCCYY-DD           PIC X(02).             00870000
               05  WS-DATE-MMDDCCYY-CC           PIC X(02).             00880000
               05  WS-DATE-MMDDCCYY-YY           PIC X(02).             00890000
           03  WS-DATE-MMDDYY          PIC 9(06).                       00900000
           03  FILLER REDEFINES WS-DATE-MMDDYY.                         00910000
               05  WS-DATE-MMDDYY-MM   PIC X(02).                       00920000
               05  WS-DATE-MMDDYY-DD   PIC X(02).                       00930000
               05  WS-DATE-MMDDYY-YY   PIC X(02).                       00940000
           03  WS-NEXT-MMDDYY          PIC 9(06).                       00950000
DJ0001     03  W-FRV-CNT                     PIC 9(6) VALUE 0.          00960000
DJ0001     03  W-RCR-CNT                     PIC 9(6) VALUE 0.          00970000
DJ0001     03  W-RCL-CNT                     PIC 9(6) VALUE 0.          00980000
DJ0001     03  W-CRD-CNT                     PIC 9(6) VALUE 0.          00990000
DJ0001     03  W-PTD-CNT                     PIC 9(6) VALUE 0.          01000000
DJ0001     03  W-MFC-CNT                     PIC 9(6) VALUE 0.          01010000
LRM003     03  WS-TRNFR-FETCH-COUNT    PIC 9(07) COMP-3  VALUE ZEROS.   01020000
LRM003     03  WS-TRNFR-UPDATED        PIC 9(07) COMP-3  VALUE ZEROS.   01030000
       01  DB2-WORK-AREA.                                               01040000
           03  WS-REJECT-ISRT-COUNT          PIC S9(5) COMP-3 VALUE +0. 01050000
           03  WS-COUNT                      PIC S9(9) COMP VALUE +0.   01060000
       01  DB2-ABEND-WORK-AREA.                                         01070000
           03  DB2-ABEND-CODE                PIC S9(04) COMP.           01080000
           03  WS-NSCC-PEND-IND              PIC X(01)  VALUE SPACES.   01090000
           03  DSNTIAR                       PIC X(08)  VALUE 'DSNTIAR'.01100000
           03  WS-DB2-MESSAGE-AREA.                                     01110000
               05  WS-DB2-MSG-LEN            PIC S9(04) COMP VALUE +960.01120000
               05  WS-ERROR-MSG              PIC X(80)  OCCURS 12 TIMES 01130000
                   INDEXED BY WS-ERROR-INDEX.                           01140000
           03  WS-ERR-LINE-LEN               PIC S9(09) COMP VALUE +80. 01150000
      *                                                                 01160000
           EXEC SQL                                                     01170000
              INCLUDE SQLCA                                             01180000
           END-EXEC.                                                    01190000
           EXEC SQL                                                     01200000
              INCLUDE VTRNFR                                            01210000
           END-EXEC.                                                    01220000
           EXEC SQL                                                     01230000
ET0001*       INCLUDE VINITRNF                                          01240000
ET0001        INCLUDE ACTITRF                                           01250000
           END-EXEC.                                                    01260000
           COPY BHINFO.                                                 01270000
           COPY BHACAT.                                                 01280000
           COPY BPDATESC.                                               01290000
           COPY RECDATZC.                                               01300000
      ***************************************************************** 01310000
       PROCEDURE DIVISION.                                              01320000
      ***************************************************************** 01330000
DJ0001     DISPLAY 'CAT545 - CREATE AUTO REJECT NO ACTION NON-STANDARD' 01340000
           DISPLAY ' '.                                                 01350000
           COPY MSGCOBO.                                                01360000
           DISPLAY ' '.                                                 01370000
           PERFORM GET-TODAYS-DATE.                                     01380000
           MOVE 0                     TO BH-BROKER-NUMBER.              01390000
           PERFORM GET-TIF THRU GET-TIF-EXIT.                           01400000
DJ0001     DISPLAY ' '                                                  01410000
DJ0001     DISPLAY 'W-FRV-CNT = ' W-FRV-CNT                             01420000
DJ0001     DISPLAY 'W-RCR-CNT = ' W-RCR-CNT                             01430000
DJ0001     DISPLAY 'W-RCL-CNT = ' W-RCL-CNT                             01440000
DJ0001     DISPLAY 'W-CRD-CNT = ' W-CRD-CNT                             01450000
DJ0001     DISPLAY 'W-PTD-CNT = ' W-PTD-CNT                             01460000
DJ0001     DISPLAY 'W-MFC-CNT = ' W-MFC-CNT                             01470000
DJ0001     DISPLAY ' '                                                  01480000
LRM003     DISPLAY 'BEGINNING ACCOUNT FREEZE REJECT PROCESS'.           01490000
LRM003     PERFORM GET-REJ-TIF THRU GET-REJ-TIF-EXIT.                   01500000
           GOBACK.                                                      01510000
                                                                        01520000
       GET-TODAYS-DATE.                                                 01530000
CSG001* MOVE SPACES TO BPDATES-CALENDAR-TYPE TO ALLOW BPDATES TO USE            
CSG001* THE DEFAULT CALENDAR.                                                   
CSG001*    MOVE 'US'               TO  BPDATES-CALENDAR-TYPE.           01540000
CSG001     MOVE '  '               TO  BPDATES-CALENDAR-TYPE.           01540000
           CALL  LNKDATZ    USING LINK-DATES-AREA                       01550000
                            BPDATES-CALENDAR-TYPE.                      01560000
           MOVE LD-PROC-DATE       TO WS-DATE-MMDDYY                    01570000
                                      WS-NEXT-MMDDYY.                   01580000
           PERFORM CONVERT-TO-CCYYMMDD.                                 01590000
                                                                        01600000
      *====> FORMAT WS-PROC-DAY (CCYY-MM-DD)                            01610000
           MOVE WS-DATE-CCYYMMDD-CC TO WS-PROC-CC.                      01620000
           MOVE WS-DATE-CCYYMMDD-YY TO WS-PROC-YY.                      01630000
           MOVE WS-DATE-CCYYMMDD-MM TO WS-PROC-MM.                      01640000
           MOVE WS-DATE-CCYYMMDD-DD TO WS-PROC-DD.                      01650000
           MOVE '-'                 TO FILLER-1,  FILLER-2.             01660000
           EXEC SQL                                                     01670000
            SET :WS-CURRENT-TMSTP = CURRENT TIMESTAMP                   01680000
           END-EXEC.                                                    01690000
DJ0001     EVALUATE SQLCODE                                             01700000
DJ0001          WHEN +0                                                 01710000
DJ0001               DISPLAY 'WS-CURRENT-TMSTP = ' WS-CURRENT-TMSTP     01720000
DJ0001          WHEN OTHER                                              01730000
DJ0001              PERFORM SQL-ERROR-ROUTINE                           01740000
DJ0001     END-EVALUATE.                                                01750000
                                                                        01760000
       GET-TIF.                                                         01770000
      *** SELECT NON-STANDARD TRANSFER NOT ACCEPTED BY THE CLIENT **    01780000
      ***                                                               01790000
      *--- DECLARE                                                      01800000
           EXEC SQL                                                     01810000
             DECLARE TIF_CSR CURSOR WITH HOLD FOR                       01820000
             SELECT                                                     01830000
                    CLIENT_NBR                                          01840000
                   ,ACAT_CONTROL_NBR                                    01850000
                   ,SBMTG_PRTCP_NBR                                     01860000
                   ,SBMT_PRT_NR_STS_CD                                  01870000
                   ,CONTROL_NBR_STS_CD                                  01880000
                   ,DLVR_NBR                                            01890000
                   ,DLVR_NBR_STTS_CD                                    01900000
                   ,ACCT_DLVR_NBR                                       01910000
                   ,ACCT_DLVR_STTS_CD                                   01920000
                   ,RCV_NBR                                             01930000
                   ,RCV_NBR_STTS_CD                                     01940000
                   ,ACCT_RCV_NBR                                        01950000
                   ,ACCT_RCV_STTS_CD                                    01960000
                   ,TRNFR_TYPE_CD                                       01970000
                   ,TRNFR_TYPE_STTS_CD                                  01980000
                   ,TRANS_TYPE_CD                                       01990000
                   ,TRANS_TYPE_STTS_CD                                  02000000
                   ,RCV_CUST_NM                                         02010000
                   ,RCV_CUST_NM_STS_CD                                  02020000
                   ,RCV_SS_PRIM_NBR                                     02030000
                   ,RCV_SS_PRIM_STS_CD                                  02040000
                   ,RCV_SS_SCNDY_NBR                                    02050000
                   ,RCV_SS_SCDY_STS_CD                                  02060000
                   ,RCV_ACCT_TYPE_CD                                    02070000
                   ,RCV_ACT_TYP_STS_CD                                  02080000
                   ,RCV_OCC_BRKR_NBR                                    02090000
                   ,RCV_OCC_STTS_CD                                     02100000
                   ,RCV_CRSPN_NBR                                       02110000
                   ,RCV_CRSPN_STTS_CD                                   02120000
                   ,ACAT_CNTL_ASTD_NBR                                  02130000
                   ,CNTL_ASTD_STTS_CD                                   02140000
                   ,CMNT_TXT                                            02150000
                   ,CMNT_STTS_CD                                        02160000
                   ,PRCS_DT                                             02170000
                   ,STTS_CD                                             02180000
                   ,STTLM_TM_CD                                         02190000
                   ,VAL_FREE_CD                                         02200000
                   ,TRANS_RFRN_ID_CD                                    02210000
                   ,TRANS_RFRN_STTS_CD                                  02220000
                   ,DB_CR_CD                                            02230000
                   ,DSTBN_SIDE_CD                                       02240000
                   ,SYS_ACT_CD                                          02250000
                   ,SYS_RJCT_RSN_CD                                     02260000
                   ,TRNFR_TYPE_RJC1_CD                                  02270000
                   ,TRNFR_TYPE_RJC2_CD                                  02280000
                   ,TRNFR_TYPE_RJCT_CD                                  02290000
                   ,TRN_TYP_RJC_STS_CD                                  02300000
                   ,PHSCL_SEQ_NBR                                       02310000
                   ,PHSCL_SEQ_STTS_CD                                   02320000
                   ,LGCL_SEQ_NBR                                        02330000
                   ,LGCL_SEQ_NR_STS_CD                                  02340000
                   ,RR_CD                                               02350000
                   ,BRANCH_CD                                           02360000
                   ,DVDND_NAA_CD                                        02370000
                   ,SELL_INSTN_NAA_CD                                   02380000
                   ,CASH_SWEEP_NAA_CD                                   02390000
                   ,PRTCP_CONTRA_CD                                     02400000
                   ,ACM_HOLDER_NAA_CD                                   02410000
                   ,ACCT_ACTIVITY_IND                                   02420000
                   ,ACCT_ORDERS_IND                                     02430000
                   ,ACCT_RJCT_RSBM_IND                                  02440000
                   ,ACCT_DB_BAL_T1_IND                                  02450000
                   ,ACCT_MRGN_DB_IND                                    02460000
                   ,ACCT_SHRT_PSTN_IND                                  02470000
                   ,ACCT_SEC_RSTRD_IND                                  02480000
                   ,ACCT_AST_EXCS_IND                                   02490000
                   ,ACCT_OPTN_PSTN_IND                                  02500000
                   ,ACCT_LTD_PRTNR_IND                                  02510000
                   ,ACCT_TIN_MSMTH_IND                                  02520000
                   ,ACCT_DPLCT_TRN_IND                                  02530000
                   ,ACCT_CUST_70_IND                                    02540000
                   ,ACCT_QULFD_PLN_IND                                  02550000
                   ,ACCT_MNGD_IND                                       02560000
                   ,ACCT_PRVT_RNG_IND                                   02570000
                   ,ACCT_BRKR_TIF_IND                                   02580000
                   ,NSCC_NON_ADP_IND                                    02590000
                   ,CYCLE_CD                                            02600000
                   ,DAYS_STTS_QTY                                       02610000
                   ,STTLM_DT                                            02620000
                   ,ACCT_NA_UPDT_IND                                    02630000
                   ,ACCT_TRNFR_FEE_AMT                                  02640000
                   ,ACCT_IRA_TRMNT_AMT                                  02650000
                   ,ACCT_IRA_MAINT_AMT                                  02660000
                   ,ACCT_DLRV_PRGR_IND                                  02670000
                   ,ACCT_CD                                             02680000
                   ,STTLM_ASCTD_DT                                      02690000
                   ,STTLM_ASCTD_STS_CD                                  02700000
                   ,RCRD_LNGTH_STTS_CD                                  02710000
                   ,RCRD_STTS_CD                                        02720000
                   ,NSCC_PEND_CD                                        02730000
                   ,NSCC_ACK_IND                                        02740000
                   ,CICS_TERM_ID_CD                                     02750000
                   ,PRGM_NM                                             02760000
                   ,CRT_TMSTP                                           02770000
                   ,UPDT_TMSTP                                          02780000
                   ,ACCT_EQUITY_AMT                                     02790000
                FROM VTRNFR                                             02800000
             WHERE                                                      02810000
DJ0001        (TRNFR_TYPE_CD IN                                         02820000
DJ0001                    ('RCR', 'FRV', 'CRD', 'PTD', 'MFC')           02830000
               AND DSTBN_SIDE_CD = 'R'                                  02840000
               AND NOT NSCC_PEND_CD  = 'A'                              02850000
DJ0002         AND (NOT NSCC_ACK_IND = 'A')                             02850000
               AND STTS_CD   < '300')                                   02860000
LRM002        OR (TRNFR_TYPE_CD = 'RCL'                                 02870000
LRM002         AND DSTBN_SIDE_CD = 'R'                                  02880000
LRM002         AND NOT NSCC_PEND_CD  = 'A'                              02890000
DJ0002         AND (NOT NSCC_ACK_IND = 'A')                             02850000
LRM002         AND STTS_CD   < '300'                                    02900000
LRM002         AND DAYS_STTS_QTY = 3)                                   02910000
                     ORDER BY CLIENT_NBR, ACAT_CONTROL_NBR              02920000
           END-EXEC.                                                    02930000
      *                                                                 02940000
      *----------------------->                                         02950000
           EXEC SQL                                                     02960000
                OPEN TIF_CSR                                            02970000
           END-EXEC.                                                    02980000
      *                                                                 02990000
           PERFORM UNTIL END-OF-TRNFR                                   03000000
              EXEC SQL                                                  03010000
                   FETCH TIF_CSR                                        03020000
                   INTO                                                 03030000
                      :DCLVTRNFR.CLIENT-NBR                             03040000
                     ,:DCLVTRNFR.ACAT-CONTROL-NBR                       03050000
                     ,:DCLVTRNFR.SBMTG-PRTCP-NBR                        03060000
                     ,:DCLVTRNFR.SBMT-PRT-NR-STS-CD                     03070000
                     ,:DCLVTRNFR.CONTROL-NBR-STS-CD                     03080000
                     ,:DCLVTRNFR.DLVR-NBR                               03090000
                     ,:DCLVTRNFR.DLVR-NBR-STTS-CD                       03100000
                     ,:DCLVTRNFR.ACCT-DLVR-NBR                          03110000
                     ,:DCLVTRNFR.ACCT-DLVR-STTS-CD                      03120000
                     ,:DCLVTRNFR.RCV-NBR                                03130000
                     ,:DCLVTRNFR.RCV-NBR-STTS-CD                        03140000
                     ,:DCLVTRNFR.ACCT-RCV-NBR                           03150000
                     ,:DCLVTRNFR.ACCT-RCV-STTS-CD                       03160000
                     ,:DCLVTRNFR.TRNFR-TYPE-CD                          03170000
                     ,:DCLVTRNFR.TRNFR-TYPE-STTS-CD                     03180000
                     ,:DCLVTRNFR.TRANS-TYPE-CD                          03190000
                     ,:DCLVTRNFR.TRANS-TYPE-STTS-CD                     03200000
                     ,:DCLVTRNFR.RCV-CUST-NM                            03210000
                     ,:DCLVTRNFR.RCV-CUST-NM-STS-CD                     03220000
                     ,:DCLVTRNFR.RCV-SS-PRIM-NBR                        03230000
                     ,:DCLVTRNFR.RCV-SS-PRIM-STS-CD                     03240000
                     ,:DCLVTRNFR.RCV-SS-SCNDY-NBR                       03250000
                     ,:DCLVTRNFR.RCV-SS-SCDY-STS-CD                     03260000
                     ,:DCLVTRNFR.RCV-ACCT-TYPE-CD                       03270000
                     ,:DCLVTRNFR.RCV-ACT-TYP-STS-CD                     03280000
                     ,:DCLVTRNFR.RCV-OCC-BRKR-NBR                       03290000
                     ,:DCLVTRNFR.RCV-OCC-STTS-CD                        03300000
                     ,:DCLVTRNFR.RCV-CRSPN-NBR                          03310000
                     ,:DCLVTRNFR.RCV-CRSPN-STTS-CD                      03320000
                     ,:DCLVTRNFR.ACAT-CNTL-ASTD-NBR                     03330000
                     ,:DCLVTRNFR.CNTL-ASTD-STTS-CD                      03340000
                     ,:DCLVTRNFR.CMNT-TXT                               03350000
                     ,:DCLVTRNFR.CMNT-STTS-CD                           03360000
                     ,:DCLVTRNFR.PRCS-DT                                03370000
                     ,:DCLVTRNFR.STTS-CD                                03380000
                     ,:DCLVTRNFR.STTLM-TM-CD                            03390000
                     ,:DCLVTRNFR.VAL-FREE-CD                            03400000
                     ,:DCLVTRNFR.TRANS-RFRN-ID-CD                       03410000
                     ,:DCLVTRNFR.TRANS-RFRN-STTS-CD                     03420000
                     ,:DCLVTRNFR.DB-CR-CD                               03430000
                     ,:DCLVTRNFR.DSTBN-SIDE-CD                          03440000
                     ,:DCLVTRNFR.SYS-ACT-CD                             03450000
                     ,:DCLVTRNFR.SYS-RJCT-RSN-CD                        03460000
                     ,:DCLVTRNFR.TRNFR-TYPE-RJC1-CD                     03470000
                     ,:DCLVTRNFR.TRNFR-TYPE-RJC2-CD                     03480000
                     ,:DCLVTRNFR.TRNFR-TYPE-RJCT-CD                     03490000
                     ,:DCLVTRNFR.TRN-TYP-RJC-STS-CD                     03500000
                     ,:DCLVTRNFR.PHSCL-SEQ-NBR                          03510000
                     ,:DCLVTRNFR.PHSCL-SEQ-STTS-CD                      03520000
                     ,:DCLVTRNFR.LGCL-SEQ-NBR                           03530000
                     ,:DCLVTRNFR.LGCL-SEQ-NR-STS-CD                     03540000
                     ,:DCLVTRNFR.RR-CD                                  03550000
                     ,:DCLVTRNFR.BRANCH-CD                              03560000
                     ,:DCLVTRNFR.DVDND-NAA-CD                           03570000
                     ,:DCLVTRNFR.SELL-INSTN-NAA-CD                      03580000
                     ,:DCLVTRNFR.CASH-SWEEP-NAA-CD                      03590000
                     ,:DCLVTRNFR.PRTCP-CONTRA-CD                        03600000
                     ,:DCLVTRNFR.ACM-HOLDER-NAA-CD                      03610000
                     ,:DCLVTRNFR.ACCT-ACTIVITY-IND                      03620000
                     ,:DCLVTRNFR.ACCT-ORDERS-IND                        03630000
                     ,:DCLVTRNFR.ACCT-RJCT-RSBM-IND                     03640000
                     ,:DCLVTRNFR.ACCT-DB-BAL-T1-IND                     03650000
                     ,:DCLVTRNFR.ACCT-MRGN-DB-IND                       03660000
                     ,:DCLVTRNFR.ACCT-SHRT-PSTN-IND                     03670000
                     ,:DCLVTRNFR.ACCT-SEC-RSTRD-IND                     03680000
                     ,:DCLVTRNFR.ACCT-AST-EXCS-IND                      03690000
                     ,:DCLVTRNFR.ACCT-OPTN-PSTN-IND                     03700000
                     ,:DCLVTRNFR.ACCT-LTD-PRTNR-IND                     03710000
                     ,:DCLVTRNFR.ACCT-TIN-MSMTH-IND                     03720000
                     ,:DCLVTRNFR.ACCT-DPLCT-TRN-IND                     03730000
                     ,:DCLVTRNFR.ACCT-CUST-70-IND                       03740000
                     ,:DCLVTRNFR.ACCT-QULFD-PLN-IND                     03750000
                     ,:DCLVTRNFR.ACCT-MNGD-IND                          03760000
                     ,:DCLVTRNFR.ACCT-PRVT-RNG-IND                      03770000
                     ,:DCLVTRNFR.ACCT-BRKR-TIF-IND                      03780000
                     ,:DCLVTRNFR.NSCC-NON-ADP-IND                       03790000
                     ,:DCLVTRNFR.CYCLE-CD                               03800000
                     ,:DCLVTRNFR.DAYS-STTS-QTY                          03810000
                     ,:DCLVTRNFR.STTLM-DT                               03820000
                     ,:DCLVTRNFR.ACCT-NA-UPDT-IND                       03830000
                     ,:DCLVTRNFR.ACCT-TRNFR-FEE-AMT                     03840000
                     ,:DCLVTRNFR.ACCT-IRA-TRMNT-AMT                     03850000
                     ,:DCLVTRNFR.ACCT-IRA-MAINT-AMT                     03860000
                     ,:DCLVTRNFR.ACCT-DLRV-PRGR-IND                     03870000
                     ,:DCLVTRNFR.ACCT-CD                                03880000
                     ,:DCLVTRNFR.STTLM-ASCTD-DT                         03890000
                     ,:DCLVTRNFR.STTLM-ASCTD-STS-CD                     03900000
                     ,:DCLVTRNFR.RCRD-LNGTH-STTS-CD                     03910000
                     ,:DCLVTRNFR.RCRD-STTS-CD                           03920000
                     ,:DCLVTRNFR.NSCC-PEND-CD                           03930000
                     ,:DCLVTRNFR.NSCC-ACK-IND                           03940000
                     ,:DCLVTRNFR.CICS-TERM-ID-CD                        03950000
                     ,:DCLVTRNFR.PRGM-NM                                03960000
                     ,:DCLVTRNFR.CRT-TMSTP                              03970000
                     ,:DCLVTRNFR.UPDT-TMSTP                             03980000
                     ,:DCLVTRNFR.ACCT-EQUITY-AMT                        03990000
              END-EXEC                                                  04000000
              EVALUATE SQLCODE                                          04010000
                  WHEN +0                                               04020000
                   IF WS-CLIENT-NBR NOT =                               04030000
                                CLIENT-NBR OF DCLVTRNFR                 04040000
                     MOVE CLIENT-NBR OF DCLVTRNFR TO WS-CLIENT-NBR      04050000
                     PERFORM GETB1-RTN                                  04060000
                   END-IF                                               04070000
                   PERFORM PROCESS-REJECT      THRU                     04080000
                                 PROCESS-REJECT-EXIT                    04090000
                   MOVE +0     TO SQLCODE                               04100000
                  WHEN  +100                                            04110000
                    SET END-OF-TRNFR TO TRUE                            04120000
                  WHEN OTHER                                            04130000
                    PERFORM SQL-ERROR-ROUTINE                           04140000
              END-EVALUATE                                              04150000
           END-PERFORM.                                                 04160000
           EXEC SQL                                                     04170000
                 CLOSE TIF_CSR                                          04180000
           END-EXEC.                                                    04190000
                                                                        04200000
       GET-TIF-EXIT.                                                    04210000
           EXIT.                                                        04220000
                                                                        04230000
       PROCESS-REJECT.                                                  04240000
           IF BH-ACAT-ACTIVE                                            04250000
             IF (BH-ACAT-AUTO-REJECT-FAIL-REVER = '1'                   04260000
                 AND TRNFR-TYPE-CD OF DCLVTRNFR = 'FRV')                04270000
             OR (BH-ACAT-AUTO-REJECT-RES-CREDIT = '1'                   04280000
                 AND TRNFR-TYPE-CD OF DCLVTRNFR = 'RCR')                04290000
             OR (BH-ACAT-AUTO-REJECT-RECLAIMS   = '1'                   04300000
                 AND TRNFR-TYPE-CD OF DCLVTRNFR = 'RCL')                04310000
             OR (BH-ACAT-AUTO-REJECT-CUST-REDEL = '1'                   04320000
                 AND (TRNFR-TYPE-CD OF DCLVTRNFR = 'CRD' OR 'PTD'))     04330000
DJ0001       OR (BH-ACAT-AUTO-REJECT-MFC        = '1'                   04340000
DJ0001           AND TRNFR-TYPE-CD OF DCLVTRNFR = 'MFC')                04350000
              PERFORM INSERT-VINITRNF.                                  04360000
                                                                        04370000
                                                                        04380000
           IF WS-REJECT-ISRT-COUNT = +10                                04390000
              EXEC SQL COMMIT END-EXEC                                  04400000
              MOVE +0   TO  WS-REJECT-ISRT-COUNT                        04410000
           END-IF.                                                      04420000
                                                                        04430000
       PROCESS-REJECT-EXIT.                                             04440000
           EXIT.                                                        04450000
                                                                        04460000
       INSERT-VINITRNF.                                                 04470000
                                                                        04480000
ET0001     INITIALIZE                 DCLACTITRF                        04500000
           MOVE CLIENT-NBR         OF DCLVTRNFR                         04510000
ET0001                             TO CLIENT-NBR         OF DCLACTITRF  04520000
           MOVE DSTBN-SIDE-CD      OF DCLVTRNFR                         04530000
ET0001                             TO DSTBN-SIDE-CD      OF DCLACTITRF  04540000
           MOVE ACAT-CONTROL-NBR   OF DCLVTRNFR                         04550000
ET0001                             TO ACAT-CONTROL-NBR   OF DCLACTITRF  04560000
                                      WS-ACAT-CNTL-NBR                  04570000
           MOVE PRCS-DT            OF DCLVTRNFR                         04580000
ET0001                             TO PRCS-DT            OF DCLACTITRF  04590000
           MOVE DAYS-STTS-QTY      OF DCLVTRNFR                         04600000
ET0001                             TO DAYS-STTS-QTY      OF DCLACTITRF  04610000
           MOVE PHSCL-SEQ-NBR      OF DCLVTRNFR                         04620000
ET0001                             TO PHSCL-SEQ-NBR      OF DCLACTITRF  04630000
           MOVE LGCL-SEQ-NBR       OF DCLVTRNFR                         04640000
ET0001                             TO LGCL-SEQ-NBR       OF DCLACTITRF  04650000
           MOVE TRNFR-TYPE-CD      OF DCLVTRNFR                         04660000
ET0001                             TO TRNFR-TYPE-CD      OF DCLACTITRF  04670000
LRM****** ON PARTIAL TRANSFERS, THE SUBMITTER IS ALWAYS THE RECIEVER    04680000
LRM******  MOVE SBMTG-PRTCP-NBR    OF DCLVTRNFR                         04690000
           MOVE RCV-NBR            OF DCLVTRNFR                         04700000
ET0001                             TO SBMTG-PRTCP-NBR    OF DCLACTITRF  04710000
           MOVE RCV-NBR            OF DCLVTRNFR                         04720000
ET0001                             TO RCV-NBR            OF DCLACTITRF  04730000
           MOVE DLVR-NBR           OF DCLVTRNFR                         04740000
ET0001                             TO DLVR-NBR           OF DCLACTITRF  04750000
           MOVE ACCT-RCV-NBR       OF DCLVTRNFR                         04760000
ET0001                             TO ACCT-RCV-NBR       OF DCLACTITRF  04770000
           MOVE RCV-CUST-NM        OF DCLVTRNFR                         04780000
ET0001                             TO RCV-CUST-NM        OF DCLACTITRF  04790000
           MOVE RCV-SS-PRIM-NBR    OF DCLVTRNFR                         04800000
ET0001                             TO RCV-SS-PRIM-NBR    OF DCLACTITRF  04810000
           MOVE RCV-SS-SCNDY-NBR   OF DCLVTRNFR                         04820000
ET0001                             TO RCV-SS-SCNDY-NBR   OF DCLACTITRF  04830000
           MOVE RCV-ACCT-TYPE-CD   OF DCLVTRNFR                         04840000
ET0001                             TO RCV-ACCT-TYPE-CD   OF DCLACTITRF  04850000
           MOVE RCV-OCC-BRKR-NBR   OF DCLVTRNFR                         04860000
ET0001                             TO RCV-OCC-BRKR-NBR   OF DCLACTITRF  04870000
           MOVE RCV-CRSPN-NBR      OF DCLVTRNFR                         04880000
ET0001                             TO RCV-CRSPN-NBR      OF DCLACTITRF  04890000
           MOVE PRTCP-CONTRA-CD    OF DCLVTRNFR                         04900000
ET0001                             TO PRTCP-CONTRA-CD    OF DCLACTITRF  04910000
           MOVE ACCT-DLVR-NBR      OF DCLVTRNFR                         04920000
ET0001                             TO ACCT-DLVR-NBR      OF DCLACTITRF  04930000
           MOVE TRNFR-TYPE-RJCT-CD OF DCLVTRNFR                         04940000
ET0001                             TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF  04950000
           MOVE ACAT-CNTL-ASTD-NBR OF DCLVTRNFR                         04960000
ET0001                             TO ACAT-CNTL-ASTD-NBR OF DCLACTITRF  04970000
           MOVE STTLM-ASCTD-DT     OF DCLVTRNFR                         04980000
ET0001                             TO STTLM-ASCTD-DT     OF DCLACTITRF  04990000
           MOVE TRANS-RFRN-ID-CD   OF DCLVTRNFR                         05000000
ET0001                             TO TRANS-RFRN-ID-CD   OF DCLACTITRF  05010000
           MOVE CRT-TMSTP          OF DCLVTRNFR                         05020000
ET0001                             TO CRT-TMSTP          OF DCLACTITRF  05030000
           MOVE WS-CURRENT-TMSTP                                        05040000
ET0001                             TO UPDT-TMSTP         OF DCLACTITRF  05050000
                                                                        05060000
DJ0002     MOVE NSCC-ACK-IND       OF DCLVTRNFR                         05110000
DJ0002                             TO NSCC-ACK-IND       OF DCLACTITRF  05120000
                                                                        05060000
ET0001     MOVE ' '                TO NSCC-PEND-CD       OF DCLACTITRF  05070000
                                                                        05080000
           MOVE 'CAT545'                                                05090000
ET0001                             TO PRGM-NM            OF DCLACTITRF  05100000
           MOVE RR-CD              OF DCLVTRNFR                         05110000
ET0001                             TO RR-CD              OF DCLACTITRF  05120000
           MOVE TRNFR-TYPE-RJC1-CD OF DCLVTRNFR                         05130000
ET0001                             TO TRNFR-TYPE-RJC1-CD OF DCLACTITRF  05140000
           MOVE TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                         05150000
ET0001                             TO TRNFR-TYPE-RJC2-CD OF DCLACTITRF  05160000
                                                                        05170000
           EVALUATE  TRNFR-TYPE-CD OF DCLVTRNFR                         05180000
             WHEN 'FRV'                                                 05190000
ET0001         MOVE '24'    TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF         05200000
DJ0001         ADD 1 TO W-FRV-CNT                                       05210000
             WHEN 'RCR'                                                 05220000
ET0001         MOVE '22'    TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF         05230000
DJ0001         ADD 1 TO W-RCR-CNT                                       05240000
             WHEN 'RCL'                                                 05250000
ET0001         MOVE '25'    TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF         05260000
DJ0001         ADD 1 TO W-RCL-CNT                                       05270000
             WHEN 'CRD'                                                 05280000
ET0001         MOVE '26'    TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF         05290000
DJ0001         ADD 1 TO W-CRD-CNT                                       05300000
             WHEN 'PTD'                                                 05310000
ET0001         MOVE '23'    TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF         05320000
DJ0001         ADD 1 TO W-PTD-CNT                                       05330000
DJ0001       WHEN 'MFC'                                                 05340000
ET0001         MOVE '27'    TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF         05350000
DJ0001         ADD 1 TO W-MFC-CNT                                       05360000
           END-EVALUATE.                                                05370000
                                                                        05380000
ET0001     MOVE 'R'                TO TRANS-TYPE-CD      OF DCLACTITRF  05390000
                                                                        05400000
           EXEC SQL                                                     05410000
ET0001         INSERT INTO ACTITRF                                      05420000
                 (                                                      05430000
                   CLIENT_NBR                                           05440000
                  ,DSTBN_SIDE_CD                                        05450000
                  ,ACAT_CONTROL_NBR                                     05460000
                  ,PRCS_DT                                              05470000
                  ,CYCLE_CD                                             05480000
                  ,SYS_ACT_CD                                           05490000
                  ,SYS_RJCT_RSN_CD                                      05500000
                  ,STTS_CD                                              05510000
                  ,DAYS_STTS_QTY                                        05520000
                  ,RCRD_STTS_CD                                         05530000
                  ,RCRD_LNGTH_STTS_CD                                   05540000
                  ,PHSCL_SEQ_STTS_CD                                    05550000
                  ,LGCL_SEQ_NR_STS_CD                                   05560000
                  ,TRANS_TYPE_STTS_CD                                   05570000
                  ,CONTROL_NBR_STS_CD                                   05580000
                  ,TRNFR_TYPE_STTS_CD                                   05590000
                  ,SBMT_PRT_NR_STS_CD                                   05600000
                  ,RCV_NBR_STTS_CD                                      05610000
                  ,DLVR_NBR_STTS_CD                                     05620000
                  ,ACCT_RCV_STTS_CD                                     05630000
                  ,RCV_CUST_NM_STS_CD                                   05640000
                  ,RCV_SS_PRIM_STS_CD                                   05650000
                  ,RCV_SS_SCDY_STS_CD                                   05660000
                  ,RCV_ACT_TYP_STS_CD                                   05670000
                  ,RCV_OCC_STTS_CD                                      05680000
                  ,RCV_CRSPN_STTS_CD                                    05690000
                  ,ACCT_DLVR_STTS_CD                                    05700000
                  ,TRN_TYP_RJC_STS_CD                                   05710000
                  ,CNTL_ASTD_STTS_CD                                    05720000
                  ,STTLM_ASCTD_STS_CD                                   05730000
                  ,TRANS_RFRN_STTS_CD                                   05740000
                  ,CMNT_STTS_CD                                         05750000
                  ,PHSCL_SEQ_NBR                                        05760000
                  ,LGCL_SEQ_NBR                                         05770000
                  ,TRANS_TYPE_CD                                        05780000
                  ,TRNFR_TYPE_CD                                        05790000
                  ,SBMTG_PRTCP_NBR                                      05800000
                  ,RCV_NBR                                              05810000
                  ,DLVR_NBR                                             05820000
                  ,ACCT_RCV_NBR                                         05830000
                  ,RCV_CUST_NM                                          05840000
                  ,RCV_SS_PRIM_NBR                                      05850000
                  ,RCV_SS_SCNDY_NBR                                     05860000
                  ,RCV_ACCT_TYPE_CD                                     05870000
                  ,RCV_OCC_BRKR_NBR                                     05880000
                  ,RCV_CRSPN_NBR                                        05890000
                  ,PRTCP_CONTRA_CD                                      05900000
                  ,ACCT_DLVR_NBR                                        05910000
                  ,TRNFR_TYPE_RJCT_CD                                   05920000
                  ,ACAT_CNTL_ASTD_NBR                                   05930000
                  ,STTLM_ASCTD_DT                                       05940000
                  ,TRANS_RFRN_ID_CD                                     05950000
                  ,CMNT_TXT                                             05960000
                  ,CICS_TERM_ID_CD                                      05970000
                  ,CRT_TMSTP                                            05980000
                  ,DB_CR_CD                                             05990000
                  ,NSCC_ACK_IND                                         06000000
                  ,NSCC_PEND_CD                                         06010000
                  ,PRGM_NM                                              06020000
                  ,RR_CD                                                06030000
                  ,TRNFR_TYPE_RJC1_CD                                   06040000
                  ,TRNFR_TYPE_RJC2_CD                                   06050000
                  ,UPDT_TMSTP                                           06060000
                 )                                                      06070000
                 VALUES                                                 06080000
                 (                                                      06090000
ET0001             :DCLACTITRF.CLIENT-NBR                               06100000
ET0001            ,:DCLACTITRF.DSTBN-SIDE-CD                            06110000
ET0001            ,:DCLACTITRF.ACAT-CONTROL-NBR                         06120000
ET0001            ,:DCLACTITRF.PRCS-DT                                  06130000
ET0001            ,:DCLACTITRF.CYCLE-CD                                 06140000
ET0001            ,:DCLACTITRF.SYS-ACT-CD                               06150000
ET0001            ,:DCLACTITRF.SYS-RJCT-RSN-CD                          06160000
ET0001            ,:DCLACTITRF.STTS-CD                                  06170000
ET0001            ,:DCLACTITRF.DAYS-STTS-QTY                            06180000
ET0001            ,:DCLACTITRF.RCRD-STTS-CD                             06190000
ET0001            ,:DCLACTITRF.RCRD-LNGTH-STTS-CD                       06200000
ET0001            ,:DCLACTITRF.PHSCL-SEQ-STTS-CD                        06210000
ET0001            ,:DCLACTITRF.LGCL-SEQ-NR-STS-CD                       06220000
ET0001            ,:DCLACTITRF.TRANS-TYPE-STTS-CD                       06230000
ET0001            ,:DCLACTITRF.CONTROL-NBR-STS-CD                       06240000
ET0001            ,:DCLACTITRF.TRNFR-TYPE-STTS-CD                       06250000
ET0001            ,:DCLACTITRF.SBMT-PRT-NR-STS-CD                       06260000
ET0001            ,:DCLACTITRF.RCV-NBR-STTS-CD                          06270000
ET0001            ,:DCLACTITRF.DLVR-NBR-STTS-CD                         06280000
ET0001            ,:DCLACTITRF.ACCT-RCV-STTS-CD                         06290000
ET0001            ,:DCLACTITRF.RCV-CUST-NM-STS-CD                       06300000
ET0001            ,:DCLACTITRF.RCV-SS-PRIM-STS-CD                       06310000
ET0001            ,:DCLACTITRF.RCV-SS-SCDY-STS-CD                       06320000
ET0001            ,:DCLACTITRF.RCV-ACT-TYP-STS-CD                       06330000
ET0001            ,:DCLACTITRF.RCV-OCC-STTS-CD                          06340000
ET0001            ,:DCLACTITRF.RCV-CRSPN-STTS-CD                        06350000
ET0001            ,:DCLACTITRF.ACCT-DLVR-STTS-CD                        06360000
ET0001            ,:DCLACTITRF.TRN-TYP-RJC-STS-CD                       06370000
ET0001            ,:DCLACTITRF.CNTL-ASTD-STTS-CD                        06380000
ET0001            ,:DCLACTITRF.STTLM-ASCTD-STS-CD                       06390000
ET0001            ,:DCLACTITRF.TRANS-RFRN-STTS-CD                       06400000
ET0001            ,:DCLACTITRF.CMNT-STTS-CD                             06410000
ET0001            ,:DCLACTITRF.PHSCL-SEQ-NBR                            06420000
ET0001            ,:DCLACTITRF.LGCL-SEQ-NBR                             06430000
ET0001            ,:DCLACTITRF.TRANS-TYPE-CD                            06440000
ET0001            ,:DCLACTITRF.TRNFR-TYPE-CD                            06450000
ET0001            ,:DCLACTITRF.SBMTG-PRTCP-NBR                          06460000
ET0001            ,:DCLACTITRF.RCV-NBR                                  06470000
ET0001            ,:DCLACTITRF.DLVR-NBR                                 06480000
ET0001            ,:DCLACTITRF.ACCT-RCV-NBR                             06490000
ET0001            ,:DCLACTITRF.RCV-CUST-NM                              06500000
ET0001            ,:DCLACTITRF.RCV-SS-PRIM-NBR                          06510000
ET0001            ,:DCLACTITRF.RCV-SS-SCNDY-NBR                         06520000
ET0001            ,:DCLACTITRF.RCV-ACCT-TYPE-CD                         06530000
ET0001            ,:DCLACTITRF.RCV-OCC-BRKR-NBR                         06540000
ET0001            ,:DCLACTITRF.RCV-CRSPN-NBR                            06550000
ET0001            ,:DCLACTITRF.PRTCP-CONTRA-CD                          06560000
ET0001            ,:DCLACTITRF.ACCT-DLVR-NBR                            06570000
ET0001            ,:DCLACTITRF.TRNFR-TYPE-RJCT-CD                       06580000
ET0001            ,:DCLACTITRF.ACAT-CNTL-ASTD-NBR                       06590000
ET0001            ,:DCLACTITRF.STTLM-ASCTD-DT                           06600000
ET0001            ,:DCLACTITRF.TRANS-RFRN-ID-CD                         06610000
ET0001            ,:DCLACTITRF.CMNT-TXT                                 06620000
ET0001            ,:DCLACTITRF.CICS-TERM-ID-CD                          06630000
ET0001            ,:DCLACTITRF.CRT-TMSTP                                06640000
ET0001            ,:DCLACTITRF.DB-CR-CD                                 06650000
ET0001            ,:DCLACTITRF.NSCC-ACK-IND                             06660000
ET0001            ,:DCLACTITRF.NSCC-PEND-CD                             06670000
ET0001            ,:DCLACTITRF.PRGM-NM                                  06680000
ET0001            ,:DCLACTITRF.RR-CD                                    06690000
ET0001            ,:DCLACTITRF.TRNFR-TYPE-RJC1-CD                       06700000
ET0001            ,:DCLACTITRF.TRNFR-TYPE-RJC2-CD                       06710000
ET0001            ,:DCLACTITRF.UPDT-TMSTP                               06720000
                 )                                                      06730000
           END-EXEC.                                                    06740000
                                                                        06750000
           EVALUATE SQLCODE                                             06760000
                WHEN +0                                                 06770000
                     ADD +1   TO  WS-REJECT-ISRT-COUNT                  06780000
ET0001*              DISPLAY 'CREATED VINITRNF '                        06790000
ET0001               DISPLAY 'CREATED ACTITRF '                         06800000
                             'CLIENT ' CLIENT-NBR OF DCLVTRNFR          06810000
                       ' CONTROL NBR ' ACAT-CONTROL-NBR  OF DCLVTRNFR   06820000
                WHEN -803                                               06830000
                    PERFORM  UPDATE-VINITRF                             06840000
                WHEN OTHER                                              06850000
                    PERFORM SQL-ERROR-ROUTINE                           06860000
           END-EVALUATE.                                                06870000
                                                                        06880000
       GETB1-RTN.                                                       06890000
           MOVE   WS-CLIENT-NBR (2 : 3) TO BH-BROKER-NUMBER.            06900000
           MOVE   '015'       TO BH-LOGICAL-RECORD-CODE.                06910000
           MOVE   '434500'    TO BH-B2-INFO-ID.                         06920000
           CALL    GETB1V  USING  BH-BROKER-HEADER-INFO                 06930000
                                  BH-ACAT-INFO.                         06940000
DJ0001     DISPLAY ' '.                                                 06950000
DJ0001     DISPLAY 'BH-BROKER-NUMBER               = '                  06960000
DJ0001              BH-BROKER-NUMBER ' ' BH-BROKER-NAME                 06970000
DJ0001     DISPLAY 'BH-ACAT-STATUS                 = '                  06980000
DJ0001              BH-ACAT-STATUS                                      06990000
DJ0001     DISPLAY 'BH-ACAT-AUTO-REJECT-FAIL-REVER = '                  07000000
DJ0001              BH-ACAT-AUTO-REJECT-FAIL-REVER                      07010000
DJ0001     DISPLAY 'BH-ACAT-AUTO-REJECT-RES-CREDIT = '                  07020000
DJ0001              BH-ACAT-AUTO-REJECT-RES-CREDIT                      07030000
DJ0001     DISPLAY 'BH-ACAT-AUTO-REJECT-RECLAIMS   = '                  07040000
DJ0001              BH-ACAT-AUTO-REJECT-RECLAIMS                        07050000
DJ0001     DISPLAY 'BH-ACAT-AUTO-REJECT-CUST-REDEL = '                  07060000
DJ0001              BH-ACAT-AUTO-REJECT-CUST-REDEL                      07070000
DJ0001     DISPLAY 'BH-ACAT-AUTO-REJECT-MFC        = '                  07080000
DJ0001              BH-ACAT-AUTO-REJECT-MFC                             07090000
DJ0001     DISPLAY ' '.                                                 07100000
       CONVERT-TO-CCYYMMDD.                                             07110000
                                                                        07120000
           MOVE '19'              TO WS-DATE-CCYYMMDD-CC                07130000
                                     OF WS-DATE-CCYYMMDD-AREA.          07140000
           MOVE WS-DATE-MMDDYY-MM TO WS-DATE-CCYYMMDD-MM                07150000
                                     OF WS-DATE-CCYYMMDD-AREA.          07160000
           MOVE WS-DATE-MMDDYY-DD TO WS-DATE-CCYYMMDD-DD                07170000
                                     OF WS-DATE-CCYYMMDD-AREA.          07180000
           MOVE WS-DATE-MMDDYY-YY TO WS-DATE-CCYYMMDD-YY                07190000
                                     OF WS-DATE-CCYYMMDD-AREA.          07200000
           IF WS-DATE-MMDDYY-YY < '90'                                  07210000
              MOVE '20'           TO WS-DATE-CCYYMMDD-CC                07220000
                                     OF WS-DATE-CCYYMMDD-AREA.          07230000
                                                                        07240000
       UPDATE-VINITRF.                                                  07250000
                                                                        07260000
           EXEC SQL SELECT                                              07270000
              CLIENT_NBR                                                07280000
              ,ACAT_CONTROL_NBR                                         07290000
              ,NSCC_PEND_CD                                             07300000
              ,TRNFR_TYPE_CD                                            07310000
            INTO                                                        07320000
ET0001          :DCLACTITRF.CLIENT-NBR                                  07330000
ET0001         ,:DCLACTITRF.ACAT-CONTROL-NBR                            07340000
ET0001         ,:DCLACTITRF.NSCC-PEND-CD                                07350000
ET0001         ,:DCLACTITRF.TRNFR-TYPE-CD                               07360000
ET0001     FROM ACTITRF                                                 07370000
           WHERE CLIENT_NBR       = :WS-CLIENT-NBR                      07380000
             AND ACAT_CONTROL_NBR = :WS-ACAT-CNTL-NBR                   07390000
           END-EXEC.                                                    07400000
                                                                        07410000
           IF SQLCODE EQUAL ZERO                                        07420000
ET0001       IF  NSCC-PEND-CD OF DCLACTITRF = 'H'                       07430000
ET0002**      AND TRNFR-TYPE-CD OF DCLACTITRF = 'R'                     07440000
ET0002        AND TRANS-TYPE-CD OF DCLACTITRF = 'R'                     07450000
              EXEC SQL                                                  07460000
ET0001         UPDATE ACTITRF                                           07470000
                  SET NSCC_PEND_CD   = ' '                              07480000
DJ0001               ,PRGM_NM        = 'CAT545 '                        07490000
                 WHERE CLIENT_NBR = :WS-CLIENT-NBR AND                  07500000
                      ACAT_CONTROL_NBR = :WS-ACAT-CNTL-NBR              07510000
              END-EXEC                                                  07520000
             END-IF                                                     07530000
           ELSE IF SQLCODE EQUAL 100                                    07540000
               DISPLAY 'NOT FOUND'                                      07550000
               DISPLAY 'TRK KEY ' WS-CLIENT-NBR ' '                     07560000
                        WS-ACAT-CNTL-NBR                                07570000
             ELSE                                                       07580000
ET0001          DISPLAY ' DUPLICATE ROWS IN ACTITRF'                    07590000
                DISPLAY ' CLIENT_NBR = ' WS-CLIENT-NBR,                 07600000
                DISPLAY ' ACAT_CONTROL_NBR = ' WS-ACAT-CNTL-NBR         07610000
                DISPLAY ' BYPASSED '                                    07620000
           END-IF.                                                      07630000
           MOVE +0  TO  SQLCODE.                                        07640000
                                                                        07650000
LRM003 GET-REJ-TIF.                                                     07660000
LRM003*** SELECT PTR PTD RECEIVER SIDE IN REVIEW WITH ACCT FREEZE ON    07670000
LRM003***                                                               07680000
LRM003*--- DECLARE                                                      07690000
LRM003     EXEC SQL                                                     07700000
LRM003       DECLARE TIF_FREEZE_CSR CURSOR WITH HOLD FOR                07710000
LRM003       SELECT                                                     07720000
LRM003              CLIENT_NBR                                          07730000
LRM003             ,ACAT_CONTROL_NBR                                    07740000
LRM003          FROM VTRNFR                                             07750000
LRM003       WHERE                                                      07760000
LRM003        (TRNFR_TYPE_CD IN                                         07770000
LRM003                    ('PTR', 'PTD')                                07780000
LRM003         AND ACCT_FRZN_IND IN ('O', 'Y')                          07790000
LRM003         AND DSTBN_SIDE_CD = 'R'                                  07800000
LRM003         AND STTS_CD   < '300')                                   07810000
LRM003               ORDER BY CLIENT_NBR, ACAT_CONTROL_NBR              07820000
LRM003     END-EXEC.                                                    07830000
LRM003*                                                                 07840000
LRM003*----------------------->                                         07850000
LRM003     EXEC SQL                                                     07860000
LRM003          OPEN TIF_FREEZE_CSR                                     07870000
LRM003     END-EXEC.                                                    07880000
LRM003*                                                                 07890000
LRM003     MOVE SPACES TO WS-END-OF-TRNFR.                              07900000
LRM003     PERFORM UNTIL END-OF-TRNFR                                   07910000
LRM003        EXEC SQL                                                  07920000
LRM003             FETCH TIF_FREEZE_CSR                                 07930000
LRM003             INTO                                                 07940000
LRM003                :DCLVTRNFR.CLIENT-NBR                             07950000
LRM003               ,:DCLVTRNFR.ACAT-CONTROL-NBR                       07960000
LRM003        END-EXEC                                                  07970000
LRM003        EVALUATE SQLCODE                                          07980000
LRM003            WHEN +0                                               07990000
LRM003             ADD 1 TO WS-TRNFR-FETCH-COUNT                        08000000
LRM003             MOVE CLIENT-NBR OF DCLVTRNFR TO WS-CLIENT-NBR        08010000
LRM003             MOVE ACAT-CONTROL-NBR OF DCLVTRNFR TO                08020000
LRM003                                             WS-ACAT-CNTL-NBR     08030000
LRM003             DISPLAY 'FETCHED ' WS-CLIENT-NBR ' '                 08040000
LRM003                   WS-ACAT-CNTL-NBR                               08050000
LRM003             PERFORM PROCESS-FREEZE-REJECT      THRU              08060000
LRM003                           PROCESS-FREEZE-REJECT-EXIT             08070000
LRM003             MOVE +0     TO SQLCODE                               08080000
LRM003            WHEN  +100                                            08090000
LRM003              SET END-OF-TRNFR TO TRUE                            08100000
LRM003            WHEN OTHER                                            08110000
LRM003              PERFORM SQL-ERROR-ROUTINE                           08120000
LRM003        END-EVALUATE                                              08130000
LRM003     END-PERFORM.                                                 08140000
LRM003     EXEC SQL                                                     08150000
LRM003           CLOSE TIF_FREEZE_CSR                                   08160000
LRM003     END-EXEC.                                                    08170000
LRM003                                                                  08180000
LRM003 GET-REJ-TIF-EXIT.                                                08190000
LRM003     EXIT.                                                        08200000
LRM003                                                                  08210000
LRM003 PROCESS-FREEZE-REJECT.                                           08220000
LRM003     EXEC SQL SELECT                                              08230000
LRM003        CLIENT_NBR                                                08240000
LRM003        ,ACAT_CONTROL_NBR                                         08250000
LRM003        ,NSCC_PEND_CD                                             08260000
LRM003      INTO                                                        08270000
LRM003          :DCLACTITRF.CLIENT-NBR                                  08280000
LRM003         ,:DCLACTITRF.ACAT-CONTROL-NBR                            08290000
LRM003         ,:DCLACTITRF.NSCC-PEND-CD                                08300000
LRM003     FROM ACTITRF                                                 08310000
LRM003     WHERE CLIENT_NBR       = :WS-CLIENT-NBR                      08320000
LRM003       AND ACAT_CONTROL_NBR = :WS-ACAT-CNTL-NBR                   08330000
LRM003       AND TRANS_TYPE_CD    = 'R'                                 08340000
LRM003     END-EXEC.                                                    08350000
LRM003                                                                  08360000
LRM003     IF SQLCODE EQUAL ZERO                                        08370000
LRM003       IF  NSCC-PEND-CD OF DCLACTITRF = 'H'                       08380000
LRM003        EXEC SQL                                                  08390000
LRM003         UPDATE ACTITRF                                           08400000
LRM003            SET NSCC_PEND_CD   = ' '                              08410000
LRM003               ,PRGM_NM        = 'CAT545 '                        08420000
LRM003           WHERE CLIENT_NBR = :WS-CLIENT-NBR AND                  08430000
LRM003                ACAT_CONTROL_NBR = :WS-ACAT-CNTL-NBR              08440000
LRM003        END-EXEC                                                  08450000
LRM003        DISPLAY 'ACCT FREEZE REJECT SET TO SUBMIT '               08460000
LRM003                    WS-CLIENT-NBR ' '  WS-ACAT-CNTL-NBR           08470000
LRM003        IF WS-REJECT-ISRT-COUNT = +10                             08480000
LRM003           EXEC SQL COMMIT END-EXEC                               08490000
LRM003           MOVE +0   TO  WS-REJECT-ISRT-COUNT                     08500000
LRM003        END-IF                                                    08510000
LRM003       END-IF                                                     08520000
LRM003     ELSE IF SQLCODE EQUAL 100                                    08530000
LRM003         DISPLAY 'FREEZE REJECT NOT FOUND'                        08540000
LRM003         DISPLAY 'TRK KEY ' WS-CLIENT-NBR ' '                     08550000
LRM003                  WS-ACAT-CNTL-NBR                                08560000
LRM003       ELSE                                                       08570000
LRM003          DISPLAY ' DUPLICATE ROWS IN ACTITRF FROM FREEZE'        08580000
LRM003          DISPLAY ' CLIENT_NBR = ' WS-CLIENT-NBR,                 08590000
LRM003          DISPLAY ' ACAT_CONTROL_NBR = ' WS-ACAT-CNTL-NBR         08600000
LRM003          DISPLAY ' BYPASSED '                                    08610000
LRM003     END-IF.                                                      08620000
LRM003     MOVE +0  TO  SQLCODE.                                        08630000
LRM003 PROCESS-FREEZE-REJECT-EXIT.                                      08640000
LRM003     EXIT.                                                        08650000
LRM003                                                                  08660000
      *******************                                               08670000
       SQL-ERROR-ROUTINE.                                               08680000
      *******************                                               08690000
                                                                        08700000
           CALL DSNTIAR               USING  SQLCA                      08710000
                                             WS-DB2-MESSAGE-AREA        08720000
                                             WS-ERR-LINE-LEN            08730000
                                                                        08740000
           DISPLAY ' '                                                  08750000
                                                                        08760000
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                   08770000
              UNTIL WS-ERROR-INDEX GREATER THAN 12                      08780000
                 IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES              08790000
                    DISPLAY '*** ' WS-ERROR-MSG (WS-ERROR-INDEX)        08800000
                 END-IF                                                 08810000
           END-PERFORM                                                  08820000
                                                                        08830000
           DISPLAY ' '                                                  08840000
           DISPLAY ' *** CAT545 ABENDED ****'                           08850000
           DISPLAY ' ACAT-CLIENT IS : ' WS-CLIENT-NBR.                  08860000
           DISPLAY ' ACAT-CONTROL-NBR = ' WS-ACAT-CNTL-NBR.             08870000
           DISPLAY ' '                                                  08880000
                                                                        08890000
           EXEC SQL  ROLLBACK  END-EXEC                                 08900000
           CALL ABEND      USING DB2-ABEND-CODE.                        08910000
                                                                        08920000
