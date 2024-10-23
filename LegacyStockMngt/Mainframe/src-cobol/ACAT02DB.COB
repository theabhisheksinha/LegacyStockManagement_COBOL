000001* PDX    - ACAT02DB C0290767 01/29/10 11:32:45 TBEDTAK            00001002
000001* ET0002 - GET STTLM-TM-CD FROM VTRNFR FOR LATE TO RESUBMIT IND   00001101
000001* PDX    - ACAT02DB C0267683 07/29/08 09:51:39 TBLAMUR            00001200
000001* LRM009* SSR# 57275 CORRECT -803 RESUBMIT AFTER ALREADY ADDED    00001300
000001* PDX    - ACAT02DB C0263391 04/02/08 13:52:40 TBLAMUR            00001400
000001* LRM004* SSR# 55766 ASCENDIS INTERFACE. WIPE ACK_IND ON UPDATE.  00001500
000001* PDX    - ACAT02DB C0231507 04/10/06 14:46:50 TBLAMUR            00001600
000001* LRM003 SSR 40661 RETAIN USER ID OF INITIATOR.                   00001700
000001* PDX    - ACAT02DB C0229579 01/09/06 14:16:18 TBEDTAK            00001800
000001* ET0001 - SSR 28458 DB2 ERROR -803 (INSERT DUPLICATE) - SET UP   00001900
000001* ET0001   ACCT-RJCR-RSBM-IND PROPERLY WHEN REJECTED TRANSFER WAS 00002000
000001* ET0001   RESUBMITTED OR RESUBMITTED REJECTED TRNFR WAS DELETED. 00002100
000001* PDX    - ACAT02DB C0227932 11/29/05 09:45:38 TBLAMUR            00002200
000001* SSR# 42405 RECOMPILE ONLY DUE TO COBE.                          00002300
000001* PDX    - ACAT02DB C0215192 02/04/05 07:50:33 TBLAMUR            00002400
000001* LRM001 - SSR# 40042 USE NEW INITIAL TABLES / PHASE II.          00002500
000001* PDX    - ACAT02DB C0209298 08/09/04 11:23:12 TBDOJUN            00002600
000001* DJ0001 - SSR# 38232 ADD ACAT02IO-DUPE-DSTBN-SIDE-CD             00020000
000001* DJ0001 - LOOK UP NON-FUL TRANSFER FOR MRGR ACAT BANNER          00030000
000001* PDX    - ACAT02DB C0174050 04/30/02 10:08:04 TBLAMUR            00040000
000001* PDX    - ACAT02DB C0122261 03/19/99 12:12:52 TBLAMUR            00050000
000001* PDX    - ACAT02DB C0122538 03/03/99 08:22:17 TBLAMUR            00060000
000001* PDX    - ACAT02DB C0120327 01/31/99 18:02:42 TBLAMUR            00070000
000001* PDX    - ACAT02DB C0119769 01/04/99 15:50:49 TBLAMUR            00080000
000001* PDX    - ACAT02DB C0109165 09/03/98 11:24:45 TBLAMUR            00090000
       IDENTIFICATION DIVISION.                                         00100000
       PROGRAM-ID.    ACAT02DB.                                         00110000
       AUTHOR.        LARRY MUREY.                                      00120000
       DATE-WRITTEN.                                                    00130000
       DATE-COMPILED.                                                   00140000
      *---------------------------------------------------------------* 00150000
      *   THIS IS THE ACATS I/O MODULE FOR DB/2 DATABASE ACCESS.      * 00160000
      *---------------------------------------------------------------* 00170000
       ENVIRONMENT DIVISION.                                            00180000
                                                                        00190000
       DATA DIVISION.                                                   00200000
                                                                        00210000
       WORKING-STORAGE SECTION.                                         00220000
       COPY PDXIDCOB.                                                   00230000
       01  FILLER                          PIC X(60)                    00240000
           VALUE 'ACAT02DB WORKING STORAGE BEGINS HERE'.                00250000
       77  WS-ACATSRCH                    PIC X(08) VALUE 'ACATSRCH'.   00260000
                                                                        00270000
           SKIP3                                                        00280000
       01  WS-ABEND-MESSAGE.                                            00290000
           05  FILLER                      PIC X(24) VALUE              00300000
             'ACAT02DB DETECTED ABEND'.                                 00310000
           05  WS-ABCODE                   PIC X(04) VALUE 'XXXX'.      00320000
                                                                        00330000
       01  WS-ERRL-DATA.                                                00340000
           05  REQUEST-TYPE                PIC X(01).                   00350000
               88  WRITE-ERROR-TO-LOG          VALUE 'W'.               00360000
           05  CALLING-TRAN-ID             PIC X(04).                   00370000
           05  CALLING-PROGRAM-ID          PIC X(08).                   00380000
           05  SQLCA-AREA                  PIC X(136).                  00390000
       01  WS-WORK-AREA.                                                00400000
           05  WS-TIMESTAMP                PIC X(26).                   00410000
           05  WS-BRANCH                   PIC X(3)  VALUE SPACES.      00420000
           05  WS-EIBCALEN                 PIC S9(8) COMP.              00430000
           05  WS-ACAT02IO-ACCOUNT         PIC X(05) VALUE SPACES.      00440000
ET0001     05  WS-ACCT-RJCT-RSBM-IND       PIC X(01).                   00441000
ET0001     05  WS-RJCT-RSBM-FOUND          PIC X(01).                   00442000
ET0001     05  WS-ACAT-CONTROL-NBR         PIC X(14).                   00443000
           05  WS-EIBTRNID                 PIC X(04) VALUE SPACES.      00450000
                                                                        00460000
       01  WS-COMMAREA.                                                 00470000
           COPY ACAT02IO.                                               00480000
                                                                        00490000
           EJECT                                                        00500000
       COPY ACATSRCH.                                                   00510000
           EJECT                                                        00520000
           EXEC SQL                                                     00530000
           INCLUDE SQLCA                                                00540000
           END-EXEC                                                     00550000
      *DCLGEN FOR INITIAL ACAT TRANSFER                                 00560000
014700     EXEC SQL                                                     00570000
               INCLUDE ACTITRF                                          00580000
014900     END-EXEC.                                                    00590000
015000*                                                                 00600000
      *DCLGEN FOR ACTIVE ACAT TRANSFER                                  00610000
           EXEC SQL                                                     00620000
               INCLUDE VTRNFR                                           00630000
           END-EXEC.                                                    00640000
015000*                                                                 00650000
      *DCLGEN FOR HISORY ACAT TRANSFER                                  00660000
           EXEC SQL                                                     00670000
               INCLUDE VTRNHSTY                                         00680000
           END-EXEC.                                                    00690000
015000*                                                                 00700000
      *--------------------------------------------------------*        00710000
      *   TFR CURSRA: FOR THE SPECIFIED CLIENT/BRANCH/ACCOUNT  *        00720000
      *--------------------------------------------------------*        00730000
           EXEC SQL                                                     00740000
              DECLARE TFRCSRA CURSOR FOR                                00750000
                  SELECT                                                00760000
                   DLVR_NBR                                             00770000
                  ,ACCT_DLVR_NBR                                        00780000
                  ,ACCT_RCV_NBR                                         00790000
                  ,RCV_ACCT_TYPE_CD                                     00800000
                  ,ACAT_CONTROL_NBR                                     00810000
                  ,TRANS_TYPE_CD                                        00820000
                  ,RCV_CUST_NM                                          00830000
                  ,RCV_SS_PRIM_NBR                                      00840000
                  ,RCV_SS_SCNDY_NBR                                     00850000
                  ,CMNT_TXT                                             00860000
                  ,NSCC_PEND_CD                                         00870000
                  ,NSCC_ACK_IND                                         00880000
                  ,STTS_CD                                              00890000
                  ,RR_CD                                                00900000
                  ,UPDT_TMSTP                                           00910000
                   FROM ACTITRF                                         00920000
                  WHERE  CLIENT_NBR                                     00930000
                              = :ACAT02IO-CLIENT-NBR                    00940000
                     AND RCV_NBR                                        00950000
                              = :ACAT02IO-RCV-NBR                       00960000
                     AND TRNFR_TYPE_CD                                  00970000
                              = 'FUL'                                   00980000
                     AND DSTBN_SIDE_CD                                  00990000
                              = 'R'                                     01000000
                     AND (ACCT_RCV_NBR                                  01010000
                              > :ACAT02IO-RCV-ACCT                      01020000
                     OR  (ACCT_RCV_NBR                                  01030000
                              = :ACAT02IO-RCV-ACCT                      01040000
                       AND DLVR_NBR                                     01050000
                              > :ACAT02IO-DLVR-NBR)                     01060000
                     OR  (ACCT_RCV_NBR                                  01070000
                              = :ACAT02IO-RCV-ACCT                      01080000
                       AND DLVR_NBR                                     01090000
                              = :ACAT02IO-DLVR-NBR                      01100000
                       AND ACCT_DLVR_NBR                                01110000
                              > :ACAT02IO-DLVR-ACCT))                   01120000
                  ORDER BY                                              01130000
                    ACCT_RCV_NBR                                        01140000
                   ,DLVR_NBR                                            01150000
                   ,ACCT_DLVR_NBR                                       01160000
LRM001             ,ACAT_CONTROL_NBR                                    01161000
           END-EXEC.                                                    01170000
**********           AND ACCT_RCV_NBR                                   01180000
**********                    = :ACAT02IO-RCV-ACCT                      01190000
           EJECT                                                        01200000
      *---------------------------------------------------------*       01210000
      *   TFR CURSR1: FOR PREV SPECIFIED CLIENT/BRANCH/ACCOUNT  *       01220000
      *---------------------------------------------------------*       01230000
           EXEC SQL                                                     01240000
              DECLARE TFRCSR1 CURSOR FOR                                01250000
                  SELECT                                                01260000
                   DLVR_NBR                                             01270000
                  ,ACCT_DLVR_NBR                                        01280000
                  ,ACCT_RCV_NBR                                         01290000
                  ,RCV_ACCT_TYPE_CD                                     01300000
                  ,ACAT_CONTROL_NBR                                     01310000
                  ,TRANS_TYPE_CD                                        01320000
                  ,RCV_CUST_NM                                          01330000
                  ,RCV_SS_PRIM_NBR                                      01340000
                  ,RCV_SS_SCNDY_NBR                                     01350000
                  ,CMNT_TXT                                             01360000
                  ,NSCC_PEND_CD                                         01370000
                  ,NSCC_ACK_IND                                         01380000
                  ,STTS_CD                                              01390000
                  ,RR_CD                                                01400000
                  ,UPDT_TMSTP                                           01410000
                   FROM ACTITRF                                         01420000
                  WHERE  CLIENT_NBR                                     01430000
                              = :ACAT02IO-CLIENT-NBR                    01440000
                     AND RCV_NBR                                        01450000
                              = :ACAT02IO-RCV-NBR                       01460000
                     AND TRNFR_TYPE_CD                                  01470000
                              = 'FUL'                                   01480000
                     AND DSTBN_SIDE_CD                                  01490000
                              = 'R'                                     01500000
                     AND (ACCT_RCV_NBR                                  01510000
                              < :ACAT02IO-RCV-ACCT                      01520000
                     OR  (ACCT_RCV_NBR                                  01530000
                              = :ACAT02IO-RCV-ACCT                      01540000
                       AND DLVR_NBR                                     01550000
                              < :ACAT02IO-DLVR-NBR)                     01560000
                     OR  (ACCT_RCV_NBR                                  01570000
                              = :ACAT02IO-RCV-ACCT                      01580000
                       AND DLVR_NBR                                     01590000
                              = :ACAT02IO-DLVR-NBR                      01600000
                       AND ACCT_DLVR_NBR                                01610000
                              < :ACAT02IO-DLVR-ACCT))                   01620000
                  ORDER BY                                              01630000
                    ACCT_RCV_NBR  DESC                                  01640000
                   ,DLVR_NBR      DESC                                  01650000
                   ,ACCT_DLVR_NBR   DESC                                01660000
LRM001             ,ACAT_CONTROL_NBR                                    01661000
           END-EXEC.                                                    01670000
*********            AND ACCT_RCV_NBR                                   01680000
*********                     = :ACAT02IO-RCV-ACCT                      01690000
           EJECT                                                        01700000
      *--------------------------------------------------------*        01710000
      *   TFR CURSRB: FOR THE SPECIFIED CLIENT/BRANCH          *        01720000
      *--------------------------------------------------------*        01730000
           EXEC SQL                                                     01740000
              DECLARE  TFRCSRB CURSOR FOR                               01750000
                  SELECT                                                01760000
                   ACCT_RCV_NBR                                         01770000
                  ,DLVR_NBR                                             01780000
                  ,ACCT_DLVR_NBR                                        01790000
                  ,RCV_ACCT_TYPE_CD                                     01800000
                  ,ACAT_CONTROL_NBR                                     01810000
                  ,TRANS_TYPE_CD                                        01820000
                  ,RCV_CUST_NM                                          01830000
                  ,RCV_SS_PRIM_NBR                                      01840000
                  ,RCV_SS_SCNDY_NBR                                     01850000
                  ,CMNT_TXT                                             01860000
                  ,NSCC_PEND_CD                                         01870000
                  ,NSCC_ACK_IND                                         01880000
                  ,STTS_CD                                              01890000
                  ,RR_CD                                                01900000
                  ,UPDT_TMSTP                                           01910000
                   FROM ACTITRF                                         01920000
                  WHERE  CLIENT_NBR                                     01930000
                              = :ACAT02IO-CLIENT-NBR                    01940000
                     AND RCV_NBR                                        01950000
                              = :ACAT02IO-RCV-NBR                       01960000
                     AND SUBSTR(ACCT_RCV_NBR,1,3)                       01970000
                              = :WS-BRANCH                              01980000
                     AND TRNFR_TYPE_CD                                  01990000
                              = 'FUL'                                   02000000
                     AND DSTBN_SIDE_CD                                  02010000
                              = 'R'                                     02020000
                     AND ((SUBSTR(ACCT_RCV_NBR,4,5)                     02030000
                              = :WS-ACAT02IO-ACCOUNT                    02040000
                     AND DLVR_NBR                                       02050000
                              = :ACAT02IO-DLVR-NBR                      02060000
                     AND ACCT_DLVR_NBR                                  02070000
                              > :ACAT02IO-DLVR-ACCT)                    02080000
                     OR  (SUBSTR(ACCT_RCV_NBR,4,5)                      02090000
                              = :WS-ACAT02IO-ACCOUNT                    02100000
                     AND  DLVR_NBR                                      02110000
                              > :ACAT02IO-DLVR-NBR)                     02120000
                     OR  (SUBSTR(ACCT_RCV_NBR,4,5)                      02130000
                              > :WS-ACAT02IO-ACCOUNT))                  02140000
                  ORDER BY                                              02150000
                    ACCT_RCV_NBR                                        02160000
                   ,DLVR_NBR                                            02170000
                   ,ACCT_DLVR_NBR                                       02180000
LRM001             ,ACAT_CONTROL_NBR                                    02181000
           END-EXEC.                                                    02190000
      *--------------------------------------------------------*        02200000
      *   TFR CURSRC: FOR THE SPECIFIED CLIENT                 *        02210000
      *--------------------------------------------------------*        02220000
           EXEC SQL                                                     02230000
              DECLARE  TFRCSRC CURSOR FOR                               02240000
                  SELECT                                                02250000
                   ACCT_RCV_NBR                                         02260000
                  ,DLVR_NBR                                             02270000
                  ,ACCT_DLVR_NBR                                        02280000
                  ,RCV_ACCT_TYPE_CD                                     02290000
                  ,ACAT_CONTROL_NBR                                     02300000
                  ,TRANS_TYPE_CD                                        02310000
                  ,RCV_CUST_NM                                          02320000
                  ,RCV_SS_PRIM_NBR                                      02330000
                  ,RCV_SS_SCNDY_NBR                                     02340000
                  ,CMNT_TXT                                             02350000
                  ,NSCC_PEND_CD                                         02360000
                  ,NSCC_ACK_IND                                         02370000
                  ,STTS_CD                                              02380000
                  ,RR_CD                                                02390000
                  ,UPDT_TMSTP                                           02400000
                   FROM ACTITRF                                         02410000
                  WHERE  CLIENT_NBR                                     02420000
                              = :ACAT02IO-CLIENT-NBR                    02430000
                     AND TRNFR_TYPE_CD                                  02440000
                              = 'FUL'                                   02450000
                     AND DSTBN_SIDE_CD                                  02460000
                              = 'R'                                     02470000
                     AND ((ACCT_RCV_NBR                                 02480000
                              = :ACAT02IO-RCV-ACCT                      02490000
                     AND DLVR_NBR                                       02500000
                              = :ACAT02IO-DLVR-NBR                      02510000
                     AND ACCT_DLVR_NBR                                  02520000
                              > :ACAT02IO-DLVR-ACCT)                    02530000
                     OR  (ACCT_RCV_NBR                                  02540000
                              = :ACAT02IO-RCV-ACCT                      02550000
                     AND DLVR_NBR                                       02560000
                              > :ACAT02IO-DLVR-NBR)                     02570000
                     OR  (ACCT_RCV_NBR                                  02580000
                              > :ACAT02IO-RCV-ACCT))                    02590000
                  ORDER BY                                              02600000
                    ACCT_RCV_NBR                                        02610000
                   ,DLVR_NBR                                            02620000
                   ,ACCT_DLVR_NBR                                       02630000
LRM001             ,ACAT_CONTROL_NBR                                    02631000
           END-EXEC.                                                    02640000
      *--------------------------------------------------------*        02650000
      *   ACTIVE TRANSFER CURSOR                               *        02660000
      *   USED TO VERIFY THAT NO ACTIVE TRANSFERS EXIST WHERE  *        02670000
      *   THIS ACCOUNT WAS REQUESTED TO BE DELIVERED.          *        02680000
      *   MULTIPLE RECEIVES INTO THIS ACCOUNT ARE OK...        *        02690000
      *--------------------------------------------------------*        02700000
           EXEC SQL                                                     02710000
              DECLARE  VTRNFR_CRSR CURSOR FOR                           02720000
                  SELECT                                                02730000
                   CLIENT_NBR                                           02740000
                  ,ACCT_DLVR_NBR                                        02750000
                  ,ACAT_CONTROL_NBR                                     02760000
                  ,TRNFR_TYPE_CD                                        02770000
                  ,STTS_CD                                              02780000
DJ0001            ,DSTBN_SIDE_CD                                        02790000
                   FROM VTRNFR                                          02800000
                  WHERE (CLIENT_NBR                                     02810000
                              = :ACAT02IO-CLIENT-NBR                    02820000
                     AND BRANCH_CD                                      02830000
                              = :ACAT02IO-RCV-BRANCH                    02840000
                     AND ACCT_CD                                        02850000
                              = :ACAT02IO-RCV-ACCOUNT                   02860000
                     AND DSTBN_SIDE_CD                                  02870000
                              = 'D'                                     02880000
                     AND NOT STTS_CD                                    02890000
                              = '140'                                   02900000
                     AND NOT STTS_CD                                    02910000
                              = '600')                                  02920000
           END-EXEC.                                                    02930000
      *--------------------------------------------------------*        02940000
      *   ACTIVE TRANSFER CURSOR FOR FULL DELERIES ONLY        *        02950000
      *   USED TO VERIFY THAT NO ACTIVE TRANSFERS EXIST WHERE  *        02960000
      *   THIS ACCOUNT WAS REQUESTED TO BE DELIVERED.          *        02970000
      *--------------------------------------------------------*        02980000
           EXEC SQL                                                     02990000
              DECLARE  VTRNFR_DLVR CURSOR FOR                           03000000
                  SELECT                                                03010000
                   CLIENT_NBR                                           03020000
                  ,ACCT_DLVR_NBR                                        03030000
                  ,ACAT_CONTROL_NBR                                     03040000
                  ,TRNFR_TYPE_CD                                        03050000
                  ,STTS_CD                                              03060000
DJ0001            ,DSTBN_SIDE_CD                                        03070000
                   FROM VTRNFR                                          03080000
                  WHERE (CLIENT_NBR                                     03090000
                              = :ACAT02IO-CLIENT-NBR                    03100000
                     AND BRANCH_CD                                      03110000
                              = :ACAT02IO-DLVR-BRANCH                   03120000
                     AND ACCT_CD                                        03130000
                              = :ACAT02IO-DLVR-ACCOUNT                  03140000
                     AND DSTBN_SIDE_CD                                  03150000
                              = 'D'                                     03160000
                     AND TRNFR_TYPE_CD                                  03170000
                              = 'FUL'                                   03180000
                     AND NOT STTS_CD                                    03190000
                              = '140'                                   03200000
                     AND NOT STTS_CD                                    03210000
                              = '600')                                  03220000
                 FOR READ ONLY WITH UR                                  03230000
           END-EXEC.                                                    03240000
DJ0001*--------------------------------------------------------*        03250000
DJ0001*   ACTIVE TRANSFER CURSOR FOR NON-FUL DELIVERIES ONLY   *        03260000
DJ0001*   USED TO VERIFY THAT NO ACTIVE TRANSFERS EXIST WHERE  *        03270000
DJ0001*   THIS ACCOUNT WAS REQUESTED TO BE DELIVERED.          *        03280000
DJ0001*--------------------------------------------------------*        03290000
DJ0001     EXEC SQL                                                     03300000
DJ0001        DECLARE  VTRNFR_DLVR2 CURSOR FOR                          03310000
DJ0001            SELECT                                                03320000
DJ0001             CLIENT_NBR                                           03330000
DJ0001            ,ACCT_DLVR_NBR                                        03340000
DJ0001            ,ACAT_CONTROL_NBR                                     03350000
DJ0001            ,TRNFR_TYPE_CD                                        03360000
DJ0001            ,STTS_CD                                              03370000
DJ0001            ,DSTBN_SIDE_CD                                        03380000
DJ0001             FROM VTRNFR                                          03390000
DJ0001            WHERE (CLIENT_NBR                                     03400000
DJ0001                        = :ACAT02IO-CLIENT-NBR                    03410000
DJ0001               AND BRANCH_CD                                      03420000
DJ0001                        = :ACAT02IO-DLVR-BRANCH                   03430000
DJ0001               AND ACCT_CD                                        03440000
DJ0001                        = :ACAT02IO-DLVR-ACCOUNT                  03450000
DJ0001               AND NOT TRNFR_TYPE_CD                              03460000
DJ0001                        = 'FUL'                                   03470000
DJ0001               AND NOT STTS_CD                                    03480000
DJ0001                        = '140'                                   03490000
DJ0001               AND NOT STTS_CD                                    03500000
DJ0001                        = '600')                                  03510000
DJ0001           FOR READ ONLY WITH UR                                  03520000
DJ0001     END-EXEC.                                                    03530000
      *--------------------------------------------------------*        03540000
      *   HISTORY TRANSFER CURSOR                              *        03550000
      *   USED TO VERIFY THAT THIS ACCOUNT WAS NOT PREVIOUSLY  *        03560000
      *   REQUESTED TO BE FUL DELIVERED.                       *        03570000
      *--------------------------------------------------------*        03580000
           EXEC SQL                                                     03590000
              DECLARE  VTRNHSTY_CRSR CURSOR FOR                         03600000
                  SELECT                                                03610000
                   CLIENT_NBR                                           03620000
                  ,ACCT_DLVR_NBR                                        03630000
                  ,ACAT_CONTROL_NBR                                     03640000
                  ,TRNFR_TYPE_CD                                        03650000
                  ,STTS_CD                                              03660000
DJ0001            ,DSTBN_SIDE_CD                                        03670000
                   FROM VTRNHSTY                                        03680000
                  WHERE (CLIENT_NBR                                     03690000
                              = :ACAT02IO-CLIENT-NBR                    03700000
                     AND BRANCH_CD                                      03710000
                              = :ACAT02IO-RCV-BRANCH                    03720000
                     AND ACCT_CD                                        03730000
                              = :ACAT02IO-RCV-ACCOUNT                   03740000
                     AND TRNFR_TYPE_CD                                  03750000
                              = 'FUL'                                   03760000
                     AND DSTBN_SIDE_CD                                  03770000
                              = 'D'                                     03780000
                     AND NOT STTS_CD                                    03790000
                              = '600')                                  03800000
           END-EXEC.                                                    03810000
      *--------------------------------------------------------*        03820000
      *   ACTIVE TRANSFER CURSOR2                              *        03830000
      *   USED TO FIND FIRST ACTIVE TRANSFER FOR THE GIVEN     *        03840000
      *   RECEIVER ACCOUNT AND SAME CONTRA BROKER AND ACCOUNT. *        03850000
      *   IT IS POSSIBLE THRU BATCH TO HAVE DUPLICATE FULL     *        03860000
      *   TRANSFERS ON THE ACTIVE TABLE; ONE SHOULD BE FLAGGED.*        03870000
      *--------------------------------------------------------*        03880000
           EXEC SQL                                                     03890000
              DECLARE  VTRNFR_CRSR2 CURSOR FOR                          03900000
                SELECT                                                  03910000
                   ACAT_CONTROL_NBR                                     03920000
                  ,ACCT_RCV_NBR                                         03930000
                  ,DLVR_NBR                                             03940000
                  ,ACCT_DLVR_NBR                                        03950000
                  ,RCV_ACCT_TYPE_CD                                     03960000
                  ,RCV_CUST_NM                                          03970000
                  ,RCV_SS_PRIM_NBR                                      03980000
                  ,RCV_SS_SCNDY_NBR                                     03990000
                  ,CMNT_TXT                                             04000000
                  ,STTS_CD                                              04010000
                  ,RR_CD                                                04020000
                   FROM VTRNFR                                          04030000
                  WHERE (CLIENT_NBR                                     04040000
                              = :ACAT02IO-CLIENT-NBR                    04050000
                     AND DLVR_NBR                                       04060000
                              = :ACAT02IO-DLVR-NBR                      04070000
                     AND ACCT_DLVR_NBR                                  04080000
                              = :ACAT02IO-DLVR-ACCT                     04090000
                     AND RCV_NBR                                        04100000
                              = :ACAT02IO-RCV-NBR                       04110000
                     AND BRANCH_CD                                      04120000
                              = :ACAT02IO-RCV-BRANCH                    04130000
                     AND ACCT_CD                                        04140000
                              = :ACAT02IO-RCV-ACCOUNT                   04150000
                     AND DSTBN_SIDE_CD                                  04160000
                              = 'R'                                     04170000
                     AND TRNFR_TYPE_CD                                  04180000
                              = 'FUL')                                  04190000
            END-EXEC                                                    04200000
           EJECT                                                        04210000
      **********************************************************        04220000
      *****      L I N K A G E  S E C T I O N              *****        04230000
      **********************************************************        04240000
       LINKAGE SECTION.                                                 04250000
                                                                        04260000
       01  DFHCOMMAREA.                                                 04270000
           05  FILLER             PIC X(500).                           04280000
                                                                        04290000
       EJECT                                                            04300000
      **********************************************************        04310000
      *****   P R O C E D U R E   D I V I S I O N           *****       04320000
      **********************************************************        04330000
       PROCEDURE DIVISION.                                              04340000
      *--------------------------------------------------------------*  04350000
      * SAVE COMMAREA LENGTH SO THAT PRIOR TO RETURN, WILL PREVENT   *  04360000
      * ALTERING STORAGE BEYOND THAT WHICH WAS SENT.                 *  04370000
      *--------------------------------------------------------------*  04380000
           MOVE EIBCALEN TO WS-EIBCALEN.                                04390000
           IF EIBCALEN > ZERO                                           04400000
              MOVE DFHCOMMAREA TO WS-COMMAREA                           04410000
           ELSE                                                         04420000
              EXEC CICS RETURN END-EXEC                                 04430000
           END-IF.                                                      04440000
                                                                        04450000
           IF ACAT02IO-IT-READ                                          04460000
               PERFORM 0100-GET-ACTITRF THRU 0100-EXIT                  04470000
           ELSE                                                         04480000
           IF ACAT02IO-IT-READ-NEXTA                                    04490000
               PERFORM 0050-OPEN-CURSORA                                04500000
               PERFORM 0075-READ-NEXTA                                  04510000
               PERFORM 0080-CLOSE-TFRCSRA                               04520000
           ELSE                                                         04530000
DLVY       IF ACAT02IO-IT-READ-ACTIVE                                   04540000
               PERFORM 0190-LOOKUP-ACTIVE-DLVR                          04550000
                  THRU 0190-EXIT                                        04560000
           ELSE                                                         04570000
           IF ACAT02IO-IT-READ-PREVA                                    04580000
               PERFORM 0050-OPEN-CURSOR1                                04590000
               PERFORM 0075-READ-PREV1                                  04600000
               PERFORM 0080-CLOSE-TFRCSR1                               04610000
           ELSE                                                         04620000
           IF ACAT02IO-IT-GET-ACTIVE                                    04630000
               PERFORM 0150-READ-ACTIVE-ACAT-DIRECT                     04640000
           ELSE                                                         04650000
           IF ACAT02IO-IT-GET-HISTORY                                   04660000
               PERFORM 0160-READ-HISTORY-ACAT-DIRECT                    04670000
           ELSE                                                         04680000
              EXEC SQL                                                  04690000
                  SET :WS-TIMESTAMP = CURRENT TIMESTAMP                 04700000
              END-EXEC                                                  04710000
              IF ACAT02IO-IT-ISRT                                       04720000
                  PERFORM 0200-ISRT-ACTITRF                             04730000
              ELSE                                                      04740000
              IF ACAT02IO-IT-UPD                                        04750000
                 PERFORM 0300-UPDATE-ACTITRF THRU 0300-EXIT             04760000
              ELSE                                                      04770000
              IF ACAT02IO-IT-DEL                                        04780000
                 PERFORM 0400-DELETE-ACTITRF                            04790000
           END-IF.                                                      04800000
                                                                        04810000
           MOVE WS-COMMAREA TO DFHCOMMAREA(1 : WS-EIBCALEN).            04820000
           EXEC CICS RETURN END-EXEC.                                   04830000
                                                                        04840000
       0050-OPEN-CURSORA.                                               04850000
      *--------------------------------------------------------------*  04860000
      *     SEARCH ENGINE WITH CLIENT/BRANCH/ACCOUNT                 *  04870000
      *--------------------------------------------------------------*  04880000
           MOVE ACAT02IO-RCV-ACCT(4 : 5) TO WS-ACAT02IO-ACCOUNT.        04890000
           EXEC SQL                                                     04900000
              OPEN TFRCSRA                                              04910000
           END-EXEC.                                                    04920000
           IF SQLCODE = 0                                               04930000
              SET ACAT02IO-GOOD-RESP TO TRUE                            04940000
           ELSE                                                         04950000
    *******   MOVE '** TFRCSRA OPEN ERROR **'                           04960000
              PERFORM 9000-WRITE-TO-CICS-LOG                            04970000
              PERFORM 9500-RETURN-DB2-ERROR                             04980000
           END-IF.                                                      04990000
                                                                        05000000
       0050-OPEN-CURSOR1.                                               05010000
      *--------------------------------------------------------------*  05020000
      *     SEARCH ENGINE WITH CLIENT/BRANCH/ACCOUNT                 *  05030000
      *--------------------------------------------------------------*  05040000
           EXEC SQL                                                     05050000
              OPEN TFRCSR1                                              05060000
           END-EXEC.                                                    05070000
           IF SQLCODE = 0                                               05080000
              SET ACAT02IO-GOOD-RESP TO TRUE                            05090000
           ELSE                                                         05100000
    *******   MOVE '** TFRCSR1 OPEN ERROR **'                           05110000
              PERFORM 9000-WRITE-TO-CICS-LOG                            05120000
              PERFORM 9500-RETURN-DB2-ERROR                             05130000
           END-IF.                                                      05140000
                                                                        05150000
       0050-OPEN-CURSORB.                                               05160000
      *--------------------------------------------------------------*  05170000
      *     SEARCH ENGINE WITH CLIENT/BRANCH ONLY                    *  05180000
      *--------------------------------------------------------------*  05190000
           MOVE ACAT02IO-RCV-ACCT(1 : 3) TO WS-BRANCH.                  05200000
           MOVE ACAT02IO-RCV-ACCT(4 : 5) TO WS-ACAT02IO-ACCOUNT.        05210000
           EXEC SQL                                                     05220000
              OPEN TFRCSRB                                              05230000
           END-EXEC.                                                    05240000
           IF SQLCODE = 0                                               05250000
              SET ACAT02IO-GOOD-RESP TO TRUE                            05260000
           ELSE                                                         05270000
    *******   MOVE '** TFRCSRA OPEN ERROR **'                           05280000
              PERFORM 9000-WRITE-TO-CICS-LOG                            05290000
              PERFORM 9500-RETURN-DB2-ERROR                             05300000
           END-IF.                                                      05310000
                                                                        05320000
       0050-OPEN-CURSORC.                                               05330000
      *--------------------------------------------------------------*  05340000
      *     SEARCH ENGINE WITH CLIENT ONLY.                          *  05350000
      *--------------------------------------------------------------*  05360000
           EXEC SQL                                                     05370000
              OPEN TFRCSRC                                              05380000
           END-EXEC.                                                    05390000
           IF SQLCODE = 0                                               05400000
              SET ACAT02IO-GOOD-RESP TO TRUE                            05410000
           ELSE                                                         05420000
    *******   MOVE '** TFRCSRA OPEN ERROR **'                           05430000
              PERFORM 9000-WRITE-TO-CICS-LOG                            05440000
              PERFORM 9500-RETURN-DB2-ERROR                             05450000
           END-IF.                                                      05460000
       0050-OPEN-VTRNFR.                                                05470000
      *--------------------------------------------------------------*  05480000
      *     OPEN CURSOR FOR ACTIVE TRANSFER LOOKUP.                  *  05490000
      *--------------------------------------------------------------*  05500000
           EXEC SQL                                                     05510000
              OPEN VTRNFR_CRSR                                          05520000
           END-EXEC.                                                    05530000
           IF SQLCODE = 0                                               05540000
              CONTINUE                                                  05550000
           ELSE                                                         05560000
    *******   MOVE '** VTRNFR OPEN ERROR **'                            05570000
              PERFORM 9000-WRITE-TO-CICS-LOG                            05580000
              PERFORM 9500-RETURN-DB2-ERROR                             05590000
           END-IF.                                                      05600000
       0050-OPEN-VTRNFR2.                                               05610000
      *--------------------------------------------------------------*  05620000
      *     OPEN CURSOR FOR ACTIVE TRANSFER DUPLICATE LOOKUP.        *  05630000
      *--------------------------------------------------------------*  05640000
           EXEC SQL                                                     05650000
              OPEN VTRNFR_CRSR2                                         05660000
           END-EXEC.                                                    05670000
           IF SQLCODE = 0                                               05680000
              CONTINUE                                                  05690000
           ELSE                                                         05700000
    *******   MOVE '** VTRNFR OPEN ERROR **'                            05710000
              PERFORM 9000-WRITE-TO-CICS-LOG                            05720000
              PERFORM 9500-RETURN-DB2-ERROR                             05730000
           END-IF.                                                      05740000
       0050-OPEN-VTRNHSTY.                                              05750000
      *--------------------------------------------------------------*  05760000
      *     OPEN CURSOR FOR TRANSFER HISTORY LOOKUP.                 *  05770000
      *--------------------------------------------------------------*  05780000
           EXEC SQL                                                     05790000
              OPEN VTRNHSTY_CRSR                                        05800000
           END-EXEC.                                                    05810000
           IF SQLCODE = 0                                               05820000
              CONTINUE                                                  05830000
           ELSE                                                         05840000
    *******   MOVE '** VTRNHSTY OPEN ERROR **'                          05850000
              PERFORM 9000-WRITE-TO-CICS-LOG                            05860000
              PERFORM 9500-RETURN-DB2-ERROR                             05870000
           END-IF.                                                      05880000
       EJECT                                                            05890000
                                                                        05900000
       0075-READ-NEXTA.                                                 05910000
           EXEC SQL                                                     05920000
              FETCH                                                     05930000
                  TFRCSRA                                               05940000
                   INTO                                                 05950000
                    :ACAT02IO-DLVR-NBR                                  05960000
                   ,:ACAT02IO-DLVR-ACCT                                 05970000
                   ,:ACAT02IO-RCV-ACCT                                  05980000
                   ,:ACAT02IO-RCV-ACCT-TYPE-CD                          05990000
                   ,:ACAT02IO-CONTROL-NBR                               06000000
                   ,:ACAT02IO-TRANS-TYPE-CD                             06010000
                   ,:ACAT02IO-RCV-CUST-NM                               06020000
                   ,:ACAT02IO-RCV-SS-PRIM-NBR                           06030000
                   ,:ACAT02IO-RCV-SS-SCNDY-NBR                          06040000
                   ,:ACAT02IO-CMNT-TXT                                  06050000
                   ,:ACAT02IO-NSCC-PEND-CD                              06060000
                   ,:ACAT02IO-NSCC-ACK-IND                              06070000
                   ,:ACAT02IO-STTS-CD                                   06080000
                   ,:ACAT02IO-RR-CD                                     06090000
                   ,:ACAT02IO-UPDT-TMSTP                                06100000
           END-EXEC.                                                    06110000
           IF SQLCODE = 0                                               06120000
              MOVE ACAT02IO-RR-CD TO SRCH-INP-RR                        06130000
              MOVE ACAT02IO-RCV-ACCT(1 : 3) TO SRCH-INP-BRANCH          06140000
              PERFORM 0075-SIGNON-SECR-CHECK-RTN                        06150000
              IF SRCH-SIGNON-SECR-CHECK-FAIL                            06160000
                 GO TO 0075-READ-NEXTA                                  06170000
              END-IF                                                    06180000
              SET ACAT02IO-FOUND TO TRUE                                06190000
           ELSE                                                         06200000
           IF SQLCODE = +100                                            06210000
              SET ACAT02IO-NOT-FOUND TO TRUE                            06220000
           ELSE                                                         06230000
    ******    MOVE '** ACAT02DB - TFRCSRA FETCH ERR  **     '           06240000
              PERFORM 9000-WRITE-TO-CICS-LOG                            06250000
              PERFORM 9500-RETURN-DB2-ERROR                             06260000
           END-IF.                                                      06270000
                                                                        06280000
       SKIP3                                                            06290000
       0075-READ-PREV1.                                                 06300000
           EXEC SQL                                                     06310000
              FETCH                                                     06320000
                  TFRCSR1                                               06330000
                   INTO                                                 06340000
                    :ACAT02IO-DLVR-NBR                                  06350000
                   ,:ACAT02IO-DLVR-ACCT                                 06360000
                   ,:ACAT02IO-RCV-ACCT                                  06370000
                   ,:ACAT02IO-RCV-ACCT-TYPE-CD                          06380000
                   ,:ACAT02IO-CONTROL-NBR                               06390000
                   ,:ACAT02IO-TRANS-TYPE-CD                             06400000
                   ,:ACAT02IO-RCV-CUST-NM                               06410000
                   ,:ACAT02IO-RCV-SS-PRIM-NBR                           06420000
                   ,:ACAT02IO-RCV-SS-SCNDY-NBR                          06430000
                   ,:ACAT02IO-CMNT-TXT                                  06440000
                   ,:ACAT02IO-NSCC-PEND-CD                              06450000
                   ,:ACAT02IO-NSCC-ACK-IND                              06460000
                   ,:ACAT02IO-STTS-CD                                   06470000
                   ,:ACAT02IO-RR-CD                                     06480000
                   ,:ACAT02IO-UPDT-TMSTP                                06490000
           END-EXEC.                                                    06500000
           IF SQLCODE = 0                                               06510000
              MOVE ACAT02IO-RR-CD TO SRCH-INP-RR                        06520000
              MOVE ACAT02IO-RCV-ACCT(1 : 3) TO SRCH-INP-BRANCH          06530000
              PERFORM 0075-SIGNON-SECR-CHECK-RTN                        06540000
              IF SRCH-SIGNON-SECR-CHECK-FAIL                            06550000
                 GO TO 0075-READ-PREV1                                  06560000
              END-IF                                                    06570000
              SET ACAT02IO-FOUND TO TRUE                                06580000
           ELSE                                                         06590000
           IF SQLCODE = +100                                            06600000
              SET ACAT02IO-NOT-FOUND TO TRUE                            06610000
           ELSE                                                         06620000
    ******    MOVE '** ACAT02DB - TFRCSR1 FETCH ERR  **     '           06630000
              PERFORM 9000-WRITE-TO-CICS-LOG                            06640000
              PERFORM 9500-RETURN-DB2-ERROR                             06650000
           END-IF.                                                      06660000
                                                                        06670000
       0075-SIGNON-SECR-CHECK-RTN.                                      06680000
           IF ACAT02IO-SUPER-SIGN-ON                                    06690000
              SET SRCH-SIGNON-SECR-CHECK-PASS TO TRUE                   06700000
           ELSE                                                         06710000
              SET SECURITY-LOOKUP TO TRUE                               06720000
              EXEC CICS LINK PROGRAM (WS-ACATSRCH)                      06730000
                  COMMAREA(ACAT-SRCH-COMM-AREA)                         06740000
                  LENGTH(LENGTH OF ACAT-SRCH-COMM-AREA)                 06750000
              END-EXEC                                                  06760000
           END-IF.                                                      06770000
       SKIP3                                                            06780000
       0080-CLOSE-TFRCSRA.                                              06790000
           EXEC SQL                                                     06800000
              CLOSE TFRCSRA                                             06810000
           END-EXEC.                                                    06820000
       0080-CLOSE-TFRCSR1.                                              06830000
           EXEC SQL                                                     06840000
              CLOSE TFRCSR1                                             06850000
           END-EXEC.                                                    06860000
       0080-CLOSE-TFRCSRB.                                              06870000
           EXEC SQL                                                     06880000
              CLOSE TFRCSRB                                             06890000
           END-EXEC.                                                    06900000
       0080-CLOSE-TFRCSRC.                                              06910000
           EXEC SQL                                                     06920000
              CLOSE TFRCSRC                                             06930000
           END-EXEC.                                                    06940000
       0080-CLOSE-VTRNFR.                                               06950000
           EXEC SQL                                                     06960000
              CLOSE VTRNFR_CRSR                                         06970000
           END-EXEC.                                                    06980000
       0080-CLOSE-VTRNFR2.                                              06990000
           EXEC SQL                                                     07000000
              CLOSE VTRNFR_CRSR2                                        07010000
           END-EXEC.                                                    07020000
       0080-CLOSE-VTRNHSTY.                                             07030000
           EXEC SQL                                                     07040000
              CLOSE VTRNHSTY_CRSR                                       07050000
           END-EXEC.                                                    07060000
       EJECT                                                            07070000
       0100-GET-ACTITRF.                                                07080000
     ******* FIRST ASSURE THAT A PTR RECORD DON'T EXIST FOR THESE KEYS. 07090000
           EXEC SQL SELECT                                              07100000
                   STTS_CD                                              07110000
LRM009            ,RCV_CUST_NM                                          07110100
LRM009            ,RCV_SS_PRIM_NBR                                      07110200
LRM009            ,RCV_SS_SCNDY_NBR                                     07110300
LRM009            ,CMNT_TXT                                             07110400
LRM009            ,NSCC_PEND_CD                                         07110500
LRM009            ,NSCC_ACK_IND                                         07110600
LRM009            ,ACAT_CONTROL_NBR                                     07111000
                 INTO                                                   07120000
                   :ACAT02IO-STTS-CD                                    07130000
LRM009            ,:ACAT02IO-RCV-CUST-NM                                07132000
LRM009            ,:ACAT02IO-RCV-SS-PRIM-NBR                            07133000
LRM009            ,:ACAT02IO-RCV-SS-SCNDY-NBR                           07134000
LRM009            ,:ACAT02IO-CMNT-TXT                                   07135000
LRM009            ,:ACAT02IO-NSCC-PEND-CD                               07136000
LRM009            ,:ACAT02IO-NSCC-ACK-IND                               07137000
LRM009            ,:ACAT02IO-CONTROL-NBR                                07138000
                 FROM ACTITRF                                           07140000
                  WHERE (CLIENT_NBR                                     07150000
                              = :ACAT02IO-CLIENT-NBR                    07160000
                     AND DLVR_NBR                                       07170000
                              = :ACAT02IO-DLVR-NBR                      07180000
                     AND ACCT_DLVR_NBR                                  07190000
                              = :ACAT02IO-DLVR-ACCT                     07200000
                     AND RCV_NBR                                        07210000
                              = :ACAT02IO-RCV-NBR                       07220000
                     AND ACCT_RCV_NBR                                   07230000
                              = :ACAT02IO-RCV-ACCT                      07240000
                     AND TRNFR_TYPE_CD                                  07250000
                              = 'PTR')                                  07260000
093200      END-EXEC.                                                   07270000
093300*                                                                 07280000
093400      EVALUATE SQLCODE                                            07290000
093800          WHEN +0                                                 07300000
                     SET ACAT02IO-PTR-FOUND TO TRUE                     07310000
                     GO TO 0100-EXIT                                    07320000
093800          WHEN +100                                               07330000
                     CONTINUE                                           07340000
094000          WHEN OTHER                                              07350000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     07360000
                     PERFORM 9500-RETURN-DB2-ERROR                      07370000
094200      END-EVALUATE.                                               07380000
                                                                        07390000
           EXEC SQL SELECT                                              07400000
                   RCV_ACCT_TYPE_CD                                     07410000
                  ,ACAT_CONTROL_NBR                                     07420000
                  ,TRANS_TYPE_CD                                        07430000
                  ,RCV_CUST_NM                                          07440000
                  ,RCV_SS_PRIM_NBR                                      07450000
                  ,RCV_SS_SCNDY_NBR                                     07460000
                  ,CMNT_TXT                                             07470000
                  ,NSCC_PEND_CD                                         07480000
                  ,NSCC_ACK_IND                                         07490000
                  ,STTS_CD                                              07500000
                  ,RR_CD                                                07510000
                  ,UPDT_TMSTP                                           07520000
                 INTO                                                   07530000
                   :ACAT02IO-RCV-ACCT-TYPE-CD                           07540000
                  ,:ACAT02IO-CONTROL-NBR                                07550000
                  ,:ACAT02IO-TRANS-TYPE-CD                              07560000
                  ,:ACAT02IO-RCV-CUST-NM                                07570000
                  ,:ACAT02IO-RCV-SS-PRIM-NBR                            07580000
                  ,:ACAT02IO-RCV-SS-SCNDY-NBR                           07590000
                  ,:ACAT02IO-CMNT-TXT                                   07600000
                  ,:ACAT02IO-NSCC-PEND-CD                               07610000
                  ,:ACAT02IO-NSCC-ACK-IND                               07620000
                  ,:ACAT02IO-STTS-CD                                    07630000
                  ,:ACAT02IO-RR-CD                                      07640000
                  ,:ACAT02IO-UPDT-TMSTP                                 07650000
                 FROM ACTITRF                                           07660000
                  WHERE (CLIENT_NBR                                     07670000
                              = :ACAT02IO-CLIENT-NBR                    07680000
                     AND DLVR_NBR                                       07690000
                              = :ACAT02IO-DLVR-NBR                      07700000
                     AND ACCT_DLVR_NBR                                  07710000
                              = :ACAT02IO-DLVR-ACCT                     07720000
                     AND RCV_NBR                                        07730000
                              = :ACAT02IO-RCV-NBR                       07740000
                     AND ACCT_RCV_NBR                                   07750000
                              = :ACAT02IO-RCV-ACCT                      07760000
                     AND TRNFR_TYPE_CD                                  07770000
                              = 'FUL'                                   07780000
                     AND DSTBN_SIDE_CD                                  07790000
                              = 'R')                                    07800000
093200      END-EXEC.                                                   07810000
093300*                                                                 07820000
093400      EVALUATE SQLCODE                                            07830000
093800          WHEN +0                                                 07840000
                     SET ACAT02IO-FOUND TO TRUE                         07850000
093800          WHEN +100                                               07860000
*********            SET ACAT02IO-NOT-FOUND TO TRUE                     07870000
                     PERFORM 0120-READ-ACTIVE-ACAT                      07880000
094000          WHEN OTHER                                              07890000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     07900000
                     PERFORM 9500-RETURN-DB2-ERROR                      07910000
094200      END-EVALUATE.                                               07920000
            IF ACAT02IO-NOT-FOUND                                       07930000
               PERFORM 0180-VERIFY-NON-DUPLICATE-RTN                    07940000
                  THRU 0180-EXIT.                                       07950000
094300*                                                                 07960000
094400 0100-EXIT.                                                       07970000
094500     EXIT.                                                        07980000
                                                                        07990000
           EJECT                                                        08000000
       0120-READ-ACTIVE-ACAT.                                           08010000
LRM****** FOR GIVEN FULL, RCV, RCV-ACCT, DLVR, DLVR-ACCT FIELDS.        08020000
LRM******  WITHOUT QUALIFING ON RECIEVER ONLY, WE CAN HAVE MULT         08030000
LRM******  DELIVERER REQUESTS FROM NSCC WITH FUL - SOMEONE SHOULD REJECT08040000
LRM******  THESE.                                                       08050000
           PERFORM 0050-OPEN-VTRNFR2.                                   08060000
           EXEC SQL FETCH                                               08070000
                  VTRNFR_CRSR2                                          08080000
                   INTO                                                 08090000
                    :ACAT02IO-CONTROL-NBR                               08100000
                   ,:ACAT02IO-RCV-ACCT                                  08110000
                   ,:ACAT02IO-DLVR-NBR                                  08120000
                   ,:ACAT02IO-DLVR-ACCT                                 08130000
                   ,:ACAT02IO-RCV-ACCT-TYPE-CD                          08140000
                   ,:ACAT02IO-RCV-CUST-NM                               08150000
                   ,:ACAT02IO-RCV-SS-PRIM-NBR                           08160000
                   ,:ACAT02IO-RCV-SS-SCNDY-NBR                          08170000
                   ,:ACAT02IO-CMNT-TXT                                  08180000
                   ,:ACAT02IO-STTS-CD                                   08190000
                   ,:ACAT02IO-RR-CD                                     08200000
            END-EXEC                                                    08210000
093400      EVALUATE SQLCODE                                            08220000
093800          WHEN +0                                                 08230000
                     SET ACAT02IO-ACTIVE-FOUND TO TRUE                  08240000
                     MOVE 'H' TO ACAT02IO-NSCC-PEND-CD                  08250000
093800          WHEN +100                                               08260000
                     SET ACAT02IO-NOT-FOUND TO TRUE                     08270000
094000          WHEN OTHER                                              08280000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     08290000
                     PERFORM 9500-RETURN-DB2-ERROR                      08300000
094200      END-EVALUATE.                                               08310000
           PERFORM 0080-CLOSE-VTRNFR2.                                  08320000
094300*                                                                 08330000
           EJECT                                                        08340000
       0150-READ-ACTIVE-ACAT-DIRECT.                                    08350000
            EXEC SQL SELECT                                             08360000
                   ACCT_RCV_NBR                                         08370000
                  ,DLVR_NBR                                             08380000
                  ,ACCT_DLVR_NBR                                        08390000
                  ,RCV_ACCT_TYPE_CD                                     08400000
                  ,RCV_CUST_NM                                          08410000
                  ,RCV_SS_PRIM_NBR                                      08420000
                  ,RCV_SS_SCNDY_NBR                                     08430000
                  ,CMNT_TXT                                             08440000
                  ,STTS_CD                                              08450000
ET0002            ,STTLM_TM_CD                                          08451000
                  ,RR_CD                                                08460000
                  ,TRNFR_TYPE_RJCT_CD                                   08470000
                   INTO                                                 08480000
                    :ACAT02IO-RCV-ACCT                                  08490000
                   ,:ACAT02IO-DLVR-NBR                                  08500000
                   ,:ACAT02IO-DLVR-ACCT                                 08510000
                   ,:ACAT02IO-RCV-ACCT-TYPE-CD                          08520000
                   ,:ACAT02IO-RCV-CUST-NM                               08530000
                   ,:ACAT02IO-RCV-SS-PRIM-NBR                           08540000
                   ,:ACAT02IO-RCV-SS-SCNDY-NBR                          08550000
                   ,:ACAT02IO-CMNT-TXT                                  08560000
                   ,:ACAT02IO-STTS-CD                                   08570000
ET0002             ,:ACAT02IO-STTLM-TM-CD                               08571000
                   ,:ACAT02IO-RR-CD                                     08580000
                   ,:ACAT02IO-TRNFR-TYPE-RJCT-CD                        08590000
                   FROM VTRNFR                                          08600000
                  WHERE (CLIENT_NBR                                     08610000
                              = :ACAT02IO-CLIENT-NBR                    08620000
                     AND ACAT_CONTROL_NBR                               08630000
                              = :ACAT02IO-CONTROL-NBR)                  08640000
            END-EXEC                                                    08650000
093400      EVALUATE SQLCODE                                            08660000
093800          WHEN +0                                                 08670000
                     SET ACAT02IO-ACTIVE-FOUND TO TRUE                  08680000
                     MOVE 'H' TO ACAT02IO-NSCC-PEND-CD                  08690000
093800          WHEN +100                                               08700000
                     SET ACAT02IO-NOT-FOUND TO TRUE                     08710000
094000          WHEN OTHER                                              08720000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     08730000
                     PERFORM 9500-RETURN-DB2-ERROR                      08740000
094200      END-EVALUATE.                                               08750000
            IF ACAT02IO-NOT-FOUND                                       08760000
               PERFORM 0180-VERIFY-NON-DUPLICATE-RTN                    08770000
                  THRU 0180-EXIT.                                       08780000
094300*                                                                 08790000
        0160-READ-HISTORY-ACAT-DIRECT.                                  08800000
            EXEC SQL SELECT                                             08810000
                   ACCT_RCV_NBR                                         08820000
                  ,DLVR_NBR                                             08830000
                  ,ACCT_DLVR_NBR                                        08840000
                  ,RCV_ACCT_TYPE_CD                                     08850000
                  ,RCV_CUST_NM                                          08860000
                  ,RCV_SS_PRIM_NBR                                      08870000
                  ,RCV_SS_SCNDY_NBR                                     08880000
                  ,CMNT_TXT                                             08890000
                  ,STTS_CD                                              08900000
ET0001            ,TRNFR_TYPE_RJCT_CD                                   08901000
                   INTO                                                 08910000
                    :ACAT02IO-RCV-ACCT                                  08920000
                   ,:ACAT02IO-DLVR-NBR                                  08930000
                   ,:ACAT02IO-DLVR-ACCT                                 08940000
                   ,:ACAT02IO-RCV-ACCT-TYPE-CD                          08950000
                   ,:ACAT02IO-RCV-CUST-NM                               08960000
                   ,:ACAT02IO-RCV-SS-PRIM-NBR                           08970000
                   ,:ACAT02IO-RCV-SS-SCNDY-NBR                          08980000
                   ,:ACAT02IO-CMNT-TXT                                  08990000
                   ,:ACAT02IO-STTS-CD                                   09000000
ET0001             ,:ACAT02IO-TRNFR-TYPE-RJCT-CD                        09001000
                   FROM VTRNHSTY                                        09010000
                  WHERE (CLIENT_NBR                                     09020000
                              = :ACAT02IO-CLIENT-NBR                    09030000
                     AND ACAT_CONTROL_NBR                               09040000
                              = :ACAT02IO-CONTROL-NBR)                  09050000
            END-EXEC                                                    09060000
093400      EVALUATE SQLCODE                                            09070000
093800          WHEN +0                                                 09080000
                     SET ACAT02IO-HISTORY-FOUND TO TRUE                 09090000
                     MOVE 'H' TO ACAT02IO-NSCC-PEND-CD                  09100000
093800          WHEN +100                                               09110000
                     SET ACAT02IO-NOT-FOUND TO TRUE                     09120000
094000          WHEN OTHER                                              09130000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     09140000
                     PERFORM 9500-RETURN-DB2-ERROR                      09150000
094200      END-EVALUATE.                                               09160000
094300*                                                                 09170000
       0180-VERIFY-NON-DUPLICATE-RTN.                                   09180000
           PERFORM 0050-OPEN-VTRNFR.                                    09190000
           EXEC SQL                                                     09200000
              FETCH                                                     09210000
                  VTRNFR_CRSR                                           09220000
                   INTO                                                 09230000
                    :ACAT02IO-DUPE-CLIENT                               09240000
                   ,:DCLVTRNFR.ACCT-DLVR-NBR                            09250000
                   ,:ACAT02IO-DUPE-CONTROL-NBR                          09260000
                   ,:ACAT02IO-DUPE-TRNFR-TYPE                           09270000
                   ,:ACAT02IO-DUPE-STATUS-CD                            09280000
DJ0001             ,:ACAT02IO-DUPE-DSTBN-SIDE-CD                        09290000
           END-EXEC.                                                    09300000
093400     EVALUATE SQLCODE                                             09310000
093500          WHEN +0                                                 09320000
093600               SET ACAT02IO-OTHER-ACTIVE TO TRUE                  09330000
                     GO TO 0180-EXIT                                    09340000
093500          WHEN +100                                               09350000
093600               CONTINUE                                           09360000
094000          WHEN OTHER                                              09370000
                     SET ACAT02IO-DB2-ERROR TO TRUE                     09380000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     09390000
                     PERFORM 9500-RETURN-DB2-ERROR                      09400000
094200     END-EVALUATE.                                                09410000
           PERFORM 0080-CLOSE-VTRNFR.                                   09420000
                                                                        09430000
           PERFORM 0050-OPEN-VTRNHSTY.                                  09440000
           EXEC SQL                                                     09450000
              FETCH                                                     09460000
                  VTRNHSTY_CRSR                                         09470000
                   INTO                                                 09480000
                    :ACAT02IO-DUPE-CLIENT                               09490000
                   ,:DCLVTRNHSTY.ACCT-DLVR-NBR                          09500000
                   ,:ACAT02IO-DUPE-CONTROL-NBR                          09510000
                   ,:ACAT02IO-DUPE-TRNFR-TYPE                           09520000
                   ,:ACAT02IO-DUPE-STATUS-CD                            09530000
DJ0001             ,:ACAT02IO-DUPE-DSTBN-SIDE-CD                        09540000
           END-EXEC.                                                    09550000
093400     EVALUATE SQLCODE                                             09560000
093500          WHEN +0                                                 09570000
093600               SET ACAT02IO-FUL-HISTORY TO TRUE                   09580000
                     GO TO 0180-EXIT                                    09590000
093500          WHEN +100                                               09600000
093600               CONTINUE                                           09610000
094000          WHEN OTHER                                              09620000
                     SET ACAT02IO-DB2-ERROR TO TRUE                     09630000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     09640000
                     PERFORM 9500-RETURN-DB2-ERROR                      09650000
094200     END-EVALUATE.                                                09660000
           PERFORM 0080-CLOSE-VTRNHSTY.                                 09670000
       0180-EXIT. EXIT.                                                 09680000
                                                                        09690000
       0190-LOOKUP-ACTIVE-DLVR.                                         09700000
LRM****    MOVE EIBTRNID TO WS-EIBTRNID.                                09710000
LRM****    MOVE 'ACAX'   TO EIBTRNID.                                   09720000
           EXEC SQL                                                     09730000
              OPEN VTRNFR_DLVR                                          09740000
           END-EXEC.                                                    09750000
           IF SQLCODE = 0                                               09760000
              CONTINUE                                                  09770000
           ELSE                                                         09780000
              SET ACAT02IO-DB2-ERROR TO TRUE                            09790000
LRM*****      MOVE WS-EIBTRNID TO EIBTRNID                              09800000
              GO TO 0190-EXIT.                                          09810000
                                                                        09820000
           EXEC SQL                                                     09830000
              FETCH                                                     09840000
                  VTRNFR_DLVR                                           09850000
                   INTO                                                 09860000
                    :ACAT02IO-DUPE-CLIENT                               09870000
                   ,:DCLVTRNFR.ACCT-DLVR-NBR                            09880000
                   ,:ACAT02IO-DUPE-CONTROL-NBR                          09890000
                   ,:ACAT02IO-DUPE-TRNFR-TYPE                           09900000
                   ,:ACAT02IO-DUPE-STATUS-CD                            09910000
DJ0001             ,:ACAT02IO-DUPE-DSTBN-SIDE-CD                        09920000
           END-EXEC.                                                    09930000
           IF SQLCODE = 0                                               09940000
              SET ACAT02IO-FOUND TO TRUE                                09950000
           ELSE                                                         09960000
           IF SQLCODE = +100                                            09970000
DJ0001********SET ACAT02IO-NOT-FOUND TO TRUE                            09980000
DJ0001        PERFORM 0192-LOOKUP-ACTV-DLVR-NON-FUL                     09990000
DJ0001           THRU 0192-EXIT                                         10000000
           ELSE                                                         10010000
              SET ACAT02IO-DB2-ERROR TO TRUE                            10020000
           END-IF.                                                      10030000
           IF SQLCODE = 0 OR +100                                       10040000
              EXEC SQL                                                  10050000
                 CLOSE VTRNFR_DLVR                                      10060000
              END-EXEC.                                                 10070000
                                                                        10080000
LRM*****   MOVE WS-EIBTRNID TO EIBTRNID.                                10090000
       0190-EXIT. EXIT.                                                 10100000
                                                                        10110000
                                                                        10120000
DJ0001 0192-LOOKUP-ACTV-DLVR-NON-FUL.                                   10130000
DJ0001     EXEC SQL                                                     10140000
DJ0001        OPEN VTRNFR_DLVR2                                         10150000
DJ0001     END-EXEC.                                                    10160000
DJ0001     IF SQLCODE = 0                                               10170000
DJ0001        CONTINUE                                                  10180000
DJ0001     ELSE                                                         10190000
DJ0001        SET ACAT02IO-DB2-ERROR TO TRUE                            10200000
DJ0001        GO TO 0192-EXIT.                                          10210000
DJ0001                                                                  10220000
DJ0001     EXEC SQL                                                     10230000
DJ0001        FETCH                                                     10240000
DJ0001            VTRNFR_DLVR2                                          10250000
DJ0001             INTO                                                 10260000
DJ0001              :ACAT02IO-DUPE-CLIENT                               10270000
DJ0001             ,:DCLVTRNFR.ACCT-DLVR-NBR                            10280000
DJ0001             ,:ACAT02IO-DUPE-CONTROL-NBR                          10290000
DJ0001             ,:ACAT02IO-DUPE-TRNFR-TYPE                           10300000
DJ0001             ,:ACAT02IO-DUPE-STATUS-CD                            10310000
DJ0001             ,:ACAT02IO-DUPE-DSTBN-SIDE-CD                        10320000
DJ0001     END-EXEC.                                                    10330000
DJ0001     IF SQLCODE = 0                                               10340000
DJ0001        SET ACAT02IO-FOUND TO TRUE                                10350000
DJ0001     ELSE                                                         10360000
DJ0001     IF SQLCODE = +100                                            10370000
DJ0001        SET ACAT02IO-NOT-FOUND TO TRUE                            10380000
DJ0001     ELSE                                                         10390000
DJ0001        SET ACAT02IO-DB2-ERROR TO TRUE                            10400000
DJ0001     END-IF.                                                      10410000
DJ0001     IF SQLCODE = 0 OR +100                                       10420000
DJ0001        EXEC SQL                                                  10430000
DJ0001           CLOSE VTRNFR_DLVR2                                     10440000
DJ0001        END-EXEC.                                                 10450000
DJ0001                                                                  10460000
DJ0001 0192-EXIT. EXIT.                                                 10470000
                                                                        10480000
           EJECT                                                        10490000
       0200-ISRT-ACTITRF.                                               10500000
           INITIALIZE DCLACTITRF.                                       10510000
           MOVE WS-TIMESTAMP TO  UPDT-TMSTP OF DCLACTITRF               10520000
                                  CRT-TMSTP OF DCLACTITRF               10530000
                                  ACAT02IO-UPDT-TMSTP.                  10540000
           MOVE '0001-01-01' TO    PRCS-DT OF DCLACTITRF                10550000
                                   STTLM-ASCTD-DT OF DCLACTITRF.        10560000
           MOVE ZERO TO PHSCL-SEQ-NBR OF DCLACTITRF                     10570000
                        LGCL-SEQ-NBR  OF DCLACTITRF.                    10580000
           MOVE EIBTRMID TO CICS-TERM-ID-CD OF DCLACTITRF.              10590000
           IF ACAT02IO-TRANS-TYPE-CD = 'C'                              10600000
              MOVE ACAT02IO-CONTROL-NBR TO                              10610000
                                   ACAT-CONTROL-NBR OF DCLACTITRF       10620000
           END-IF.                                                      10630000
           EXEC SQL                                                     10640000
               INSERT INTO ACTITRF                                      10650000
                 (                                                      10660000
                   CLIENT_NBR                                           10670000
                  ,DLVR_NBR                                             10680000
                  ,ACCT_DLVR_NBR                                        10690000
                  ,RCV_NBR                                              10700000
                  ,ACCT_RCV_NBR                                         10710000
                  ,TRNFR_TYPE_CD                                        10720000
                  ,RCV_NBR_STTS_CD                                      10730000
                  ,DLVR_NBR_STTS_CD                                     10740000
                  ,ACCT_RCV_STTS_CD                                     10750000
                  ,ACCT_DLVR_STTS_CD                                    10760000
                  ,SBMTG_PRTCP_NBR                                      10770000
                  ,SBMT_PRT_NR_STS_CD                                   10780000
                  ,ACAT_CONTROL_NBR                                     10790000
                  ,CONTROL_NBR_STS_CD                                   10800000
                  ,TRNFR_TYPE_STTS_CD                                   10810000
                  ,TRANS_TYPE_CD                                        10820000
                  ,TRANS_TYPE_STTS_CD                                   10830000
                  ,RCV_CUST_NM                                          10840000
                  ,RCV_CUST_NM_STS_CD                                   10850000
                  ,RCV_SS_PRIM_NBR                                      10860000
                  ,RCV_SS_PRIM_STS_CD                                   10870000
                  ,RCV_SS_SCNDY_NBR                                     10880000
                  ,RCV_SS_SCDY_STS_CD                                   10890000
                  ,RCV_ACCT_TYPE_CD                                     10900000
                  ,RCV_ACT_TYP_STS_CD                                   10910000
                  ,RCV_OCC_BRKR_NBR                                     10920000
                  ,RCV_OCC_STTS_CD                                      10930000
                  ,RCV_CRSPN_NBR                                        10940000
                  ,RCV_CRSPN_STTS_CD                                    10950000
                  ,ACAT_CNTL_ASTD_NBR                                   10960000
                  ,CNTL_ASTD_STTS_CD                                    10970000
                  ,CMNT_TXT                                             10980000
                  ,CMNT_STTS_CD                                         10990000
                  ,PRCS_DT                                              11000000
                  ,STTS_CD                                              11010000
                  ,DSTBN_SIDE_CD                                        11020000
                  ,SYS_ACT_CD                                           11030000
                  ,SYS_RJCT_RSN_CD                                      11040000
                  ,TRNFR_TYPE_RJCT_CD                                   11050000
                  ,TRNFR_TYPE_RJC1_CD                                   11060000
                  ,TRNFR_TYPE_RJC2_CD                                   11070000
                  ,TRN_TYP_RJC_STS_CD                                   11080000
                  ,PHSCL_SEQ_NBR                                        11090000
                  ,PHSCL_SEQ_STTS_CD                                    11100000
                  ,LGCL_SEQ_NBR                                         11110000
                  ,LGCL_SEQ_NR_STS_CD                                   11120000
                  ,PRTCP_CONTRA_CD                                      11130000
                  ,CYCLE_CD                                             11140000
                  ,DAYS_STTS_QTY                                        11150000
                  ,TRANS_RFRN_ID_CD                                     11160000
                  ,TRANS_RFRN_STTS_CD                                   11170000
                  ,DB_CR_CD                                             11180000
                  ,STTLM_ASCTD_DT                                       11190000
                  ,STTLM_ASCTD_STS_CD                                   11200000
                  ,RCRD_LNGTH_STTS_CD                                   11210000
                  ,RCRD_STTS_CD                                         11220000
                  ,NSCC_PEND_CD                                         11230000
                  ,NSCC_ACK_IND                                         11240000
                  ,UPDT_TMSTP                                           11250000
                  ,CRT_TMSTP                                            11260000
                  ,CICS_TERM_ID_CD                                      11270000
                  ,PRGM_NM                                              11280000
                  ,RR_CD                                                11290000
LRM003            ,CICS_SGNON_ID                                        11291000
LRM003            ,CICS_NET_NM                                          11291100
LRM003            ,TPSCRT_USR_ID                                        11292000
LRM003            ,TPSCRT_USR_NM                                        11294000
                 )                                                      11300000
                 VALUES                                                 11310000
                 (                                                      11320000
                    :ACAT02IO-CLIENT-NBR                                11330000
                   ,:ACAT02IO-DLVR-NBR                                  11340000
                   ,:ACAT02IO-DLVR-ACCT                                 11350000
                   ,:ACAT02IO-RCV-NBR                                   11360000
                   ,:ACAT02IO-RCV-ACCT                                  11370000
                   ,'FUL'                                               11380000
                   ,:DCLACTITRF.RCV-NBR-STTS-CD                         11390000
                   ,:DCLACTITRF.DLVR-NBR-STTS-CD                        11400000
                   ,:DCLACTITRF.ACCT-RCV-STTS-CD                        11410000
                   ,:DCLACTITRF.ACCT-DLVR-STTS-CD                       11420000
                   ,:ACAT02IO-RCV-NBR                                   11430000
                   ,:DCLACTITRF.SBMT-PRT-NR-STS-CD                      11440000
                   ,:DCLACTITRF.ACAT-CONTROL-NBR                        11450000
                   ,:DCLACTITRF.CONTROL-NBR-STS-CD                      11460000
                   ,:DCLACTITRF.TRNFR-TYPE-STTS-CD                      11470000
                   ,:ACAT02IO-TRANS-TYPE-CD                             11480000
                   ,:DCLACTITRF.TRANS-TYPE-STTS-CD                      11490000
                   ,:ACAT02IO-RCV-CUST-NM                               11500000
                   ,:DCLACTITRF.RCV-CUST-NM-STS-CD                      11510000
                   ,:ACAT02IO-RCV-SS-PRIM-NBR                           11520000
                   ,:DCLACTITRF.RCV-SS-PRIM-STS-CD                      11530000
                   ,:ACAT02IO-RCV-SS-SCNDY-NBR                          11540000
                   ,:DCLACTITRF.RCV-SS-SCDY-STS-CD                      11550000
                   ,:ACAT02IO-RCV-ACCT-TYPE-CD                          11560000
                   ,:DCLACTITRF.RCV-ACT-TYP-STS-CD                      11570000
                   ,:ACAT02IO-RCV-OCC-BRKR-NBR                          11580000
                   ,:DCLACTITRF.RCV-OCC-STTS-CD                         11590000
                   ,:DCLACTITRF.RCV-CRSPN-NBR                           11600000
                   ,:DCLACTITRF.RCV-CRSPN-STTS-CD                       11610000
                   ,:DCLACTITRF.ACAT-CNTL-ASTD-NBR                      11620000
                   ,:DCLACTITRF.CNTL-ASTD-STTS-CD                       11630000
                   ,:ACAT02IO-CMNT-TXT                                  11640000
                   ,:DCLACTITRF.CMNT-STTS-CD                            11650000
                   ,:DCLACTITRF.PRCS-DT                                 11660000
                   ,:DCLACTITRF.STTS-CD                                 11670000
                   ,'R'                                                 11680000
                   ,:DCLACTITRF.SYS-ACT-CD                              11690000
                   ,:DCLACTITRF.SYS-RJCT-RSN-CD                         11700000
                   ,:DCLACTITRF.TRNFR-TYPE-RJCT-CD                      11710000
                   ,:DCLACTITRF.TRNFR-TYPE-RJC1-CD                      11720000
                   ,:DCLACTITRF.TRNFR-TYPE-RJC2-CD                      11730000
                   ,:DCLACTITRF.TRN-TYP-RJC-STS-CD                      11740000
                   ,:DCLACTITRF.PHSCL-SEQ-NBR                           11750000
                   ,:DCLACTITRF.PHSCL-SEQ-STTS-CD                       11760000
                   ,:DCLACTITRF.LGCL-SEQ-NBR                            11770000
                   ,:DCLACTITRF.LGCL-SEQ-NR-STS-CD                      11780000
                   ,:DCLACTITRF.PRTCP-CONTRA-CD                         11790000
                   ,:DCLACTITRF.CYCLE-CD                                11800000
                   ,:DCLACTITRF.DAYS-STTS-QTY                           11810000
                   ,:ACAT02IO-RCV-ACCT                                  11820000
                   ,:DCLACTITRF.TRANS-RFRN-STTS-CD                      11830000
                   ,:DCLACTITRF.DB-CR-CD                                11840000
                   ,:DCLACTITRF.STTLM-ASCTD-DT                          11850000
                   ,:DCLACTITRF.STTLM-ASCTD-STS-CD                      11860000
                   ,:DCLACTITRF.RCRD-LNGTH-STTS-CD                      11870000
                   ,:DCLACTITRF.RCRD-STTS-CD                            11880000
                   ,:ACAT02IO-NSCC-PEND-CD                              11890000
                   ,:DCLACTITRF.NSCC-ACK-IND                            11900000
                   ,:DCLACTITRF.UPDT-TMSTP                              11910000
                   ,:DCLACTITRF.CRT-TMSTP                               11920000
                   ,:DCLACTITRF.CICS-TERM-ID-CD                         11930000
                   ,'ACAT02DB'                                          11940000
                   ,:ACAT02IO-RR-CD                                     11950000
LRM003             ,:ACAT02IO-SNON-ID                                   11951000
LRM003             ,:ACAT02IO-NETNAME                                   11951100
LRM003             ,:ACAT02IO-USER-ID                                   11952000
LRM003             ,:ACAT02IO-USER-NAME                                 11953000
                 )                                                      11960000
093200     END-EXEC.                                                    11970000
                                                                        11980000
093400     EVALUATE SQLCODE                                             11990000
093500          WHEN +0                                                 12000000
093600               SET ACAT02IO-GOOD-RESP TO TRUE                     12010000
094000          WHEN OTHER                                              12020000
                     SET ACAT02IO-DB2-ERROR TO TRUE                     12030000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     12040000
                     PERFORM 9500-RETURN-DB2-ERROR                      12050000
094200     END-EVALUATE.                                                12060000
                                                                        12070000
                                                                        12080000
           IF ACAT02IO-HIST-DELETE-IND = 'Y'                            12090000
              EXEC SQL                                                  12100000
                 DELETE FROM VTRNHSTY                                   12110000
                    WHERE (CLIENT_NBR                                   12120000
                              = :ACAT02IO-CLIENT-NBR                    12130000
                     AND ACCT_DLVR_NBR                                  12140000
                              = :ACAT02IO-RCV-ACCT                      12150000
                     AND TRNFR_TYPE_CD                                  12160000
                              = 'FUL'                                   12170000
                     AND DSTBN_SIDE_CD                                  12180000
                              = 'D'                                     12190000
                     AND NOT STTS_CD                                    12200000
                              = '600')                                  12210000
              END-EXEC                                                  12220000
              EVALUATE SQLCODE                                          12230000
                WHEN +0                                                 12240000
                     SET ACAT02IO-GOOD-RESP TO TRUE                     12250000
                WHEN +100                                               12260000
                     SET ACAT02IO-GOOD-RESP TO TRUE                     12270000
                WHEN OTHER                                              12280000
                     SET ACAT02IO-DB2-ERROR TO TRUE                     12290000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     12300000
                     PERFORM 9500-RETURN-DB2-ERROR                      12310000
              END-EVALUATE                                              12320000
           END-IF.                                                      12330000
                                                                        12340000
           IF ACAT02IO-CONTROL-NBR > SPACES                             12350000
           AND ACAT02IO-ACCT-RJCT-RSBM-IND > SPACES                     12360000
              PERFORM 0320-UPDATE-ACTIVE-RECORD                         12370000
ET0001           THRU 0320-EXIT                                         12371000
           END-IF.                                                      12380000
           EJECT                                                        12390000
       0300-UPDATE-ACTITRF.                                             12400000
           PERFORM 0310-CHECK-TMSTP-AND-NSCC-RTN.                       12410000
           IF ACAT02IO-UPDT-TMSTP-NG                                    12420000
           OR ACAT02IO-NSCC-PEND-NG                                     12430000
           OR ACAT02IO-NOT-FOUND                                        12440000
              GO TO 0300-EXIT.                                          12450000
                                                                        12460000
           MOVE WS-TIMESTAMP TO  UPDT-TMSTP OF DCLACTITRF               12470000
                                 ACAT02IO-UPDT-TMSTP.                   12480000
           MOVE EIBTRMID TO CICS-TERM-ID-CD OF DCLACTITRF.              12490000
   ******* PRIMARY KEY CHANGE / INSERT AND DELETE...                    12500000
           IF ACAT02IO-ORIG-DLVR-NBR  NOT = ACAT02IO-DLVR-NBR           12510000
           OR ACAT02IO-ORIG-DLVR-ACCT NOT = ACAT02IO-DLVR-ACCT          12520000
               PERFORM 0350-KEY-CHANGE-RTN                              12530000
           ELSE                                                         12540000
             EXEC SQL                                                   12550000
               UPDATE ACTITRF                                           12560000
                 SET                                                    12570000
                   RCV_SS_PRIM_NBR   =                                  12580000
                    :ACAT02IO-RCV-SS-PRIM-NBR                           12590000
                  ,RCV_SS_SCNDY_NBR  =                                  12600000
                    :ACAT02IO-RCV-SS-SCNDY-NBR                          12610000
                  ,RCV_ACCT_TYPE_CD  =                                  12620000
                    :ACAT02IO-RCV-ACCT-TYPE-CD                          12630000
                  ,RCV_CUST_NM       =                                  12640000
                    :ACAT02IO-RCV-CUST-NM                               12650000
                  ,CMNT_TXT          =                                  12660000
                    :ACAT02IO-CMNT-TXT                                  12670000
                  ,NSCC_PEND_CD      =                                  12680000
                    :ACAT02IO-NSCC-PEND-CD                              12690000
                  ,UPDT_TMSTP        =                                  12700000
                    :DCLACTITRF.UPDT-TMSTP                              12710000
                  ,CICS_TERM_ID_CD   =                                  12720000
                    :DCLACTITRF.CICS-TERM-ID-CD                         12730000
                  ,PRGM_NM           =                                  12740000
                    'ACAT02DB'                                          12750000
                  ,RR_CD             =                                  12760000
                    :ACAT02IO-RR-CD                                     12770000
LRM004            ,NSCC_ACK_IND      =  ' '                             12771000
              WHERE                                                     12780000
                  (CLIENT_NBR    =                                      12790000
                    :ACAT02IO-CLIENT-NBR   AND                          12800000
                   DLVR_NBR      =                                      12810000
                    :ACAT02IO-ORIG-DLVR-NBR     AND                     12820000
                   ACCT_DLVR_NBR =                                      12830000
                    :ACAT02IO-ORIG-DLVR-ACCT    AND                     12840000
                   RCV_NBR       =                                      12850000
                    :ACAT02IO-RCV-NBR      AND                          12860000
                   ACCT_RCV_NBR  =                                      12870000
                    :ACAT02IO-RCV-ACCT     AND                          12880000
                   TRNFR_TYPE_CD =                                      12890000
                    'FUL'                                               12900000
                 )                                                      12910000
              END-EXEC                                                  12920000
                                                                        12930000
              EVALUATE SQLCODE                                          12940000
                 WHEN +0                                                12950000
                     SET ACAT02IO-GOOD-RESP TO TRUE                     12960000
                 WHEN OTHER                                             12970000
                     SET ACAT02IO-DB2-ERROR TO TRUE                     12980000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     12990000
                     PERFORM 9500-RETURN-DB2-ERROR                      13000000
              END-EVALUATE.                                             13010000
                                                                        13020000
           MOVE WS-TIMESTAMP TO  UPDT-TMSTP OF DCLVTRNFR.               13030000
           MOVE EIBTRMID TO CICS-TERM-ID-CD OF DCLVTRNFR.               13040000
           IF ACAT02IO-CONTROL-NBR > SPACES                             13050000
              PERFORM 0320-UPDATE-ACTIVE-RECORD                         13060000
ET0001           THRU 0320-EXIT                                         13061000
           END-IF.                                                      13070000
        0300-EXIT. EXIT.                                                13080000
                                                                        13090000
        0310-CHECK-TMSTP-AND-NSCC-RTN.                                  13100000
      *---------------------------------------------------------------  13110000
      *  READ THE EXISTING TIF TO OBTAIN NSCC-PEND-IND AND UPDATE       13120000
      *  TIMESTAMP TO SEE IF SOMEONE ELSE CAUSED AN UPDATE WHILE THIS   13130000
      *  USER WAS LOOKING AT THIS RECORD ON THIER SCREEN.               13140000
      *---------------------------------------------------------------  13150000
           EXEC SQL SELECT                                              13160000
                   NSCC_PEND_CD                                         13170000
                  ,UPDT_TMSTP                                           13180000
                 INTO                                                   13190000
                   :DCLACTITRF.NSCC-PEND-CD                             13200000
                  ,:DCLACTITRF.UPDT-TMSTP                               13210000
                 FROM ACTITRF                                           13220000
                  WHERE (CLIENT_NBR                                     13230000
                              = :ACAT02IO-CLIENT-NBR                    13240000
                     AND DLVR_NBR                                       13250000
                              = :ACAT02IO-DLVR-NBR                      13260000
                     AND ACCT_DLVR_NBR                                  13270000
                              = :ACAT02IO-DLVR-ACCT                     13280000
                     AND RCV_NBR                                        13290000
                              = :ACAT02IO-RCV-NBR                       13300000
                     AND ACCT_RCV_NBR                                   13310000
                              = :ACAT02IO-RCV-ACCT                      13320000
                     AND TRNFR_TYPE_CD                                  13330000
                              = 'FUL')                                  13340000
093200      END-EXEC.                                                   13350000
093300*                                                                 13360000
093400      EVALUATE SQLCODE                                            13370000
093800          WHEN +0                                                 13380000
                     SET ACAT02IO-FOUND TO TRUE                         13390000
                     IF NSCC-PEND-CD OF DCLACTITRF = 'Y'                13400000
                        SET ACAT02IO-NSCC-PEND-NG TO TRUE               13410000
                     ELSE                                               13420000
                     IF UPDT-TMSTP OF DCLACTITRF NOT =                  13430000
                                 ACAT02IO-UPDT-TMSTP                    13440000
                        SET ACAT02IO-UPDT-TMSTP-NG TO TRUE              13450000
                     END-IF END-IF                                      13460000
093800          WHEN +100                                               13470000
                     SET ACAT02IO-NOT-FOUND TO TRUE                     13480000
094000          WHEN OTHER                                              13490000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     13500000
                     PERFORM 9500-RETURN-DB2-ERROR                      13510000
094200      END-EVALUATE.                                               13520000
                                                                        13530000
        0320-UPDATE-ACTIVE-RECORD.                                      13540000
ET0001     MOVE ACAT02IO-CONTROL-NBR TO WS-ACAT-CONTROL-NBR.            13550100
ET0001     PERFORM 0500-GET-ACTIVE-RJCT-RSBM-IND.                       13550200
ET0001                                                                  13550300
ET0001     IF WS-RJCT-RSBM-FOUND = 'Y'                                  13550400
ET0001        IF WS-ACCT-RJCT-RSBM-IND = 'Y'                            13550500
ET0001           GO TO 0320-EXIT                                        13550600
ET0001        ELSE                                                      13550700
ET0001           CONTINUE                                               13550800
ET0001        END-IF                                                    13550900
ET0001     ELSE                                                         13551000
ET0001        PERFORM 0330-UPDATE-HISTORY                               13551100
ET0001           THRU 0330-EXIT                                         13551200
ET0001     END-IF.                                                      13552000
                                                                        13555000
           MOVE WS-TIMESTAMP TO  UPDT-TMSTP OF DCLVTRNFR.               13556000
           EXEC SQL                                                     13560000
               UPDATE VTRNFR                                            13570000
                 SET                                                    13580000
                   ACCT_RJCT_RSBM_IND =                                 13590000
                    :ACAT02IO-ACCT-RJCT-RSBM-IND                        13600000
                  ,UPDT_TMSTP        =                                  13610000
                    :DCLVTRNFR.UPDT-TMSTP                               13620000
                  ,CICS_TERM_ID_CD   =                                  13630000
                    :DCLVTRNFR.CICS-TERM-ID-CD                          13640000
                  ,PRGM_NM           =                                  13650000
                    'ACAT02DB'                                          13660000
                  WHERE (CLIENT_NBR                                     13670000
                              = :ACAT02IO-CLIENT-NBR                    13680000
                     AND ACAT_CONTROL_NBR                               13690000
                              = :ACAT02IO-CONTROL-NBR)                  13700000
           END-EXEC.                                                    13710000
           EVALUATE SQLCODE                                             13720000
                WHEN +0                                                 13730000
                     SET ACAT02IO-GOOD-RESP TO TRUE                     13740000
                WHEN +100                                               13750000
ET0001**             PERFORM 0330-UPDATE-HISTORY                        13760000
ET0001               SET ACAT02IO-GOOD-RESP TO TRUE                     13760100
                WHEN OTHER                                              13770000
                     SET ACAT02IO-DB2-ERROR TO TRUE                     13780000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     13790000
                     PERFORM 9500-RETURN-DB2-ERROR                      13800000
           END-EVALUATE.                                                13810000
ET0001 0320-EXIT.  EXIT.                                                13811000
                                                                        13820000
       0330-UPDATE-HISTORY.                                             13830000
ET0001     PERFORM 0510-GET-HISTRY-RJCT-RSBM-IND.                       13831100
ET0001                                                                  13832000
ET0001     IF WS-RJCT-RSBM-FOUND = 'Y'                                  13833000
ET0001        IF WS-ACCT-RJCT-RSBM-IND = 'Y'                            13834000
ET0001           GO TO 0330-EXIT                                        13835000
ET0001        ELSE                                                      13836000
ET0001           CONTINUE                                               13837000
ET0001        END-IF                                                    13838000
ET0001     ELSE                                                         13839000
ET0001        SET ACAT02IO-GOOD-RESP TO TRUE                            13839100
ET0001        GO TO 0330-EXIT                                           13839200
ET0001     END-IF.                                                      13839300
                                                                        13839400
ET0001     MOVE EIBTRMID     TO CICS-TERM-ID-CD OF DCLVTRNHSTY.         13839500
           MOVE WS-TIMESTAMP TO  UPDT-TMSTP OF DCLVTRNHSTY.             13840000
           EXEC SQL                                                     13850000
               UPDATE VTRNHSTY                                          13860000
                 SET                                                    13870000
                   ACCT_RJCT_RSBM_IND =                                 13880000
                    :ACAT02IO-ACCT-RJCT-RSBM-IND                        13890000
                  ,UPDT_TMSTP        =                                  13900000
ET0001**            :DCLVTRNFR.UPDT-TMSTP                               13910000
ET0001              :DCLVTRNHSTY.UPDT-TMSTP                             13911000
                  ,CICS_TERM_ID_CD   =                                  13920000
ET0001**            :DCLVTRNFR.CICS-TERM-ID-CD                          13930000
ET0001              :DCLVTRNHSTY.CICS-TERM-ID-CD                        13931000
                  ,PRGM_NM           =                                  13940000
                    'ACAT02DB'                                          13950000
                  WHERE (CLIENT_NBR                                     13960000
                              = :ACAT02IO-CLIENT-NBR                    13970000
                     AND ACAT_CONTROL_NBR                               13980000
                              = :ACAT02IO-CONTROL-NBR)                  13990000
           END-EXEC.                                                    14000000
           EVALUATE SQLCODE                                             14010000
                WHEN +0                                                 14020000
                     SET ACAT02IO-GOOD-RESP TO TRUE                     14030000
                WHEN +100                                               14040000
                     SET ACAT02IO-GOOD-RESP TO TRUE                     14050000
                WHEN OTHER                                              14060000
                     SET ACAT02IO-DB2-ERROR TO TRUE                     14070000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     14080000
                     PERFORM 9500-RETURN-DB2-ERROR                      14090000
           END-EVALUATE.                                                14100000
ET0001 0330-EXIT.        EXIT.                                          14101000
                                                                        14110000
       0350-KEY-CHANGE-RTN.                                             14120000
           PERFORM 0200-ISRT-ACTITRF.                                   14130000
                                                                        14140000
           IF SQLCODE NOT = 0                                           14150000
              PERFORM 9000-WRITE-TO-CICS-LOG                            14160000
              PERFORM 9500-RETURN-DB2-ERROR                             14170000
           END-IF.                                                      14180000
                                                                        14190000
           PERFORM 0400-DELETE-ACTITRF.                                 14200000
                                                                        14210000
           SKIP3                                                        14220000
       0400-DELETE-ACTITRF.                                             14230000
ET0001     EXEC SQL                                                     14231000
ET0001         SELECT                                                   14232000
ET0001            ACAT_CONTROL_NBR                                      14233000
ET0001         INTO                                                     14234000
ET0001            :WS-ACAT-CONTROL-NBR                                  14235000
ET0001         FROM                                                     14236000
ET0001            ACTITRF                                               14237000
ET0001         WHERE                                                    14238000
ET0001            (CLIENT_NBR    =                                      14239200
ET0001              :ACAT02IO-CLIENT-NBR   AND                          14239300
ET0001             DLVR_NBR      =                                      14239400
ET0001              :ACAT02IO-ORIG-DLVR-NBR     AND                     14239500
ET0001             ACCT_DLVR_NBR =                                      14239600
ET0001              :ACAT02IO-ORIG-DLVR-ACCT    AND                     14239700
ET0001             RCV_NBR       =                                      14239800
ET0001              :ACAT02IO-RCV-NBR      AND                          14239900
ET0001             ACCT_RCV_NBR  =                                      14240000
ET0001              :ACAT02IO-RCV-ACCT     AND                          14240100
ET0001             TRNFR_TYPE_CD =                                      14240200
ET0001              'FUL'                                               14240300
ET0001             )                                                    14240400
ET0001     END-EXEC.                                                    14240500
                                                                        14241800
           EXEC SQL                                                     14242000
               DELETE FROM ACTITRF                                      14250000
              WHERE                                                     14260000
                  (CLIENT_NBR    =                                      14270000
                    :ACAT02IO-CLIENT-NBR   AND                          14280000
                   DLVR_NBR      =                                      14290000
                    :ACAT02IO-ORIG-DLVR-NBR     AND                     14300000
                   ACCT_DLVR_NBR =                                      14310000
                    :ACAT02IO-ORIG-DLVR-ACCT    AND                     14320000
                   RCV_NBR       =                                      14330000
                    :ACAT02IO-RCV-NBR      AND                          14340000
                   ACCT_RCV_NBR  =                                      14350000
                    :ACAT02IO-RCV-ACCT     AND                          14360000
                   TRNFR_TYPE_CD =                                      14370000
                    'FUL'                                               14380000
                 )                                                      14390000
093200     END-EXEC.                                                    14400000
                                                                        14410000
093400     EVALUATE SQLCODE                                             14420000
093500          WHEN +0                                                 14430000
093600               SET ACAT02IO-GOOD-RESP TO TRUE                     14440000
ET0001               IF WS-ACAT-CONTROL-NBR > SPACES                    14442000
ET0001                  PERFORM 0450-UPDATE-ACTIVE-RJCT-RSBM            14443100
ET0001                     THRU 0450-EXIT                               14443200
ET0001               END-IF                                             14444000
094000          WHEN OTHER                                              14450000
                     SET ACAT02IO-DB2-ERROR TO TRUE                     14460000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     14470000
                     PERFORM 9500-RETURN-DB2-ERROR                      14480000
094200     END-EVALUATE.                                                14490000
           EJECT                                                        14500000
ET0001*                                                                 14501000
ET0001*----------------------------------------------------------------*14501100
ET0001* UPON DELETING INTIAL TRANSFER TABLE,                           *14501200
ET0001* IF ACCT_RJCT_RSBM_IND OF ACTIVE TRANSFER IS 'Y', RESET IT TO   *14501400
ET0001* SPACE.                                                         *14501500
ET0001*----------------------------------------------------------------*14501600
ET0001 0450-UPDATE-ACTIVE-RJCT-RSBM.                                    14502000
           PERFORM 0500-GET-ACTIVE-RJCT-RSBM-IND.                       14502300
                                                                        14502400
           IF WS-RJCT-RSBM-FOUND = 'Y'                                  14502500
              IF WS-ACCT-RJCT-RSBM-IND = 'Y'                            14502600
                 CONTINUE                                               14510100
              ELSE                                                      14510200
                 GO TO 0450-EXIT                                        14510300
              END-IF                                                    14510400
           ELSE                                                         14510500
              PERFORM 0460-UPDATE-HISTRY-RJCT-RSBM                      14510800
                 THRU 0460-EXIT                                         14510900
           END-IF.                                                      14511000
                                                                        14511100
           MOVE WS-TIMESTAMP TO  UPDT-TMSTP OF DCLVTRNFR.               14511200
           EXEC SQL                                                     14511300
               UPDATE VTRNFR                                            14511400
                 SET                                                    14511500
                   ACCT_RJCT_RSBM_IND = ' '                             14511600
                  ,UPDT_TMSTP        =                                  14511700
                    :DCLVTRNFR.UPDT-TMSTP                               14511800
                  ,CICS_TERM_ID_CD   =                                  14511900
                    :DCLVTRNFR.CICS-TERM-ID-CD                          14512000
                  ,PRGM_NM           =                                  14512100
                    'ACAT02DB'                                          14512200
                  WHERE (CLIENT_NBR                                     14512300
                              = :ACAT02IO-CLIENT-NBR                    14512400
                     AND ACAT_CONTROL_NBR                               14512500
                              = :WS-ACAT-CONTROL-NBR)                   14512600
           END-EXEC.                                                    14512700
                                                                        14512800
           EVALUATE SQLCODE                                             14512900
                WHEN +0                                                 14513000
                     SET ACAT02IO-GOOD-RESP TO TRUE                     14513100
                WHEN +100                                               14513200
                     SET ACAT02IO-GOOD-RESP TO TRUE                     14513300
                WHEN OTHER                                              14513500
                     SET ACAT02IO-DB2-ERROR TO TRUE                     14513600
                     PERFORM 9000-WRITE-TO-CICS-LOG                     14513700
                     PERFORM 9500-RETURN-DB2-ERROR                      14513800
           END-EVALUATE.                                                14513900
ET0001 0450-EXIT.   EXIT.                                               14514000
ET0001*                                                                 14514100
ET0001*----------------------------------------------------------------*14514200
ET0001* UPON DELETING INTIAL TRANSFER TABLE,                           *14514300
ET0001* IF ACCT_RJCT_RSBM_IND OF HISTORY TRANSFER IS 'Y', RESET IT     *14514400
ET0001* TO SPACE.                                                      *14514500
ET0001*----------------------------------------------------------------*14514600
ET0001 0460-UPDATE-HISTRY-RJCT-RSBM.                                    14514700
           PERFORM 0510-GET-HISTRY-RJCT-RSBM-IND.                       14514800
                                                                        14514900
           IF WS-RJCT-RSBM-FOUND = 'Y'                                  14515000
              IF WS-ACCT-RJCT-RSBM-IND = 'Y'                            14515100
                 CONTINUE                                               14515200
              ELSE                                                      14515300
                 GO TO 0460-EXIT                                        14515400
              END-IF                                                    14515500
           ELSE                                                         14515600
              SET ACAT02IO-GOOD-RESP TO TRUE                            14515700
              GO TO 0460-EXIT                                           14515800
           END-IF.                                                      14516000
                                                                        14516100
           MOVE WS-TIMESTAMP TO  UPDT-TMSTP OF DCLVTRNFR.               14516200
           EXEC SQL                                                     14516300
               UPDATE VTRNHSTY                                          14516400
                 SET                                                    14516500
                   ACCT_RJCT_RSBM_IND = ' '                             14516600
                  ,UPDT_TMSTP        =                                  14516700
                    :DCLVTRNFR.UPDT-TMSTP                               14516800
                  ,CICS_TERM_ID_CD   =                                  14516900
                    :DCLVTRNFR.CICS-TERM-ID-CD                          14517000
                  ,PRGM_NM           =                                  14517100
                    'ACAT02DB'                                          14517200
                  WHERE (CLIENT_NBR                                     14517300
                              = :ACAT02IO-CLIENT-NBR                    14517400
                     AND ACAT_CONTROL_NBR                               14517500
                              = :WS-ACAT-CONTROL-NBR)                   14517600
           END-EXEC.                                                    14517700
                                                                        14517800
           EVALUATE SQLCODE                                             14517900
                WHEN +0                                                 14518000
                     SET ACAT02IO-GOOD-RESP TO TRUE                     14518100
                WHEN +100                                               14518200
                     SET ACAT02IO-GOOD-RESP TO TRUE                     14518300
                WHEN OTHER                                              14518400
                     SET ACAT02IO-DB2-ERROR TO TRUE                     14518500
                     PERFORM 9000-WRITE-TO-CICS-LOG                     14518600
                     PERFORM 9500-RETURN-DB2-ERROR                      14518700
           END-EVALUATE.                                                14518800
ET0001 0460-EXIT.   EXIT.                                               14518900
ET0001 EJECT                                                            14519000
ET0001*                                                                 14519100
ET0001*----------------------------------------------------------------*14519200
ET0001*     GET ACTIVE TRANSFER ACCT_RJCT_RSBM_IND                     *14519300
ET0001*----------------------------------------------------------------*14519400
ET0001 0500-GET-ACTIVE-RJCT-RSBM-IND.                                   14519500
           EXEC SQL                                                     14519600
               SELECT                                                   14519700
                  ACCT_RJCT_RSBM_IND                                    14519800
               INTO                                                     14519900
                  :WS-ACCT-RJCT-RSBM-IND                                14520000
               FROM                                                     14520100
                  VTRNFR                                                14520200
               WHERE                                                    14520300
                  CLIENT_NBR = :ACAT02IO-CLIENT-NBR                     14520400
                  AND ACAT_CONTROL_NBR = :WS-ACAT-CONTROL-NBR           14520500
           END-EXEC.                                                    14520600
                                                                        14520700
           EVALUATE SQLCODE                                             14520800
               WHEN +0                                                  14520900
                    MOVE 'Y' TO  WS-RJCT-RSBM-FOUND                     14521000
               WHEN +100                                                14521100
                    MOVE ' ' TO  WS-RJCT-RSBM-FOUND                     14521200
               WHEN OTHER                                               14521300
                    PERFORM 9000-WRITE-TO-CICS-LOG                      14521400
                    PERFORM 9500-RETURN-DB2-ERROR                       14521500
           END-EVALUATE.                                                14521600
ET0001*                                                                 14521700
ET0001*----------------------------------------------------------------*14521800
ET0001*     GET HISTORY TRANSFER ACCT_RJCT_RSBM_IND                    *14521900
ET0001*----------------------------------------------------------------*14522000
ET0001 0510-GET-HISTRY-RJCT-RSBM-IND.                                   14522100
           EXEC SQL                                                     14522200
               SELECT                                                   14522300
                  ACCT_RJCT_RSBM_IND                                    14522400
               INTO                                                     14522500
                  :WS-ACCT-RJCT-RSBM-IND                                14522600
               FROM                                                     14522700
                  VTRNHSTY                                              14522800
               WHERE                                                    14522900
                  CLIENT_NBR = :ACAT02IO-CLIENT-NBR                     14523000
                  AND ACAT_CONTROL_NBR = :WS-ACAT-CONTROL-NBR           14523200
           END-EXEC.                                                    14523300
                                                                        14523400
           EVALUATE SQLCODE                                             14523500
               WHEN +0                                                  14523600
                    MOVE 'Y' TO  WS-RJCT-RSBM-FOUND                     14523700
               WHEN +100                                                14523800
                    MOVE ' ' TO  WS-RJCT-RSBM-FOUND                     14523900
               WHEN OTHER                                               14524000
                    PERFORM 9000-WRITE-TO-CICS-LOG                      14524100
                    PERFORM 9500-RETURN-DB2-ERROR                       14524200
           END-EVALUATE.                                                14524300
ET0001 EJECT                                                            14524400
       ABENDED.                                                         14524500
     ***   EXEC CICS ASSIGN ABCODE(WS-ABCODE) END-EXEC.                 14525000
     ***   MOVE WS-ABEND-MESSAGE TO BHST-MESSAGE.                       14530000
     ***   MOVE '9999' TO BHST-RETURN-CODE.                             14540000
           MOVE WS-COMMAREA TO DFHCOMMAREA(1 : WS-EIBCALEN).            14550000
           EXEC CICS RETURN END-EXEC.                                   14560000
      *==============================                                   14570000
                                                                        14580000
       9000-WRITE-TO-CICS-LOG.                                          14590000
      *==============================                                   14600000
     ***   MOVE SQLCODE TO BHST-SQLCODE.                                14610000
           IF SQLCODE = -803                                            14620000
               CONTINUE                                                 14630000
           ELSE                                                         14640000
               MOVE SPACES             TO WS-ERRL-DATA                  14650000
               SET WRITE-ERROR-TO-LOG  TO TRUE                          14660000
               MOVE EIBTRNID           TO CALLING-TRAN-ID               14670000
               MOVE 'ACAT02DB'         TO CALLING-PROGRAM-ID            14680000
               MOVE SQLCA              TO SQLCA-AREA                    14690000
               EXEC CICS LINK PROGRAM ('FPDB2LOG')                      14700000
                     COMMAREA (WS-ERRL-DATA)                            14710000
                     LENGTH (LENGTH OF WS-ERRL-DATA) NOHANDLE           14720000
               END-EXEC                                                 14730000
           END-IF.                                                      14740000
                                                                        14750000
       9500-RETURN-DB2-ERROR.                                           14760000
           EXEC CICS SYNCPOINT ROLLBACK END-EXEC.                       14770000
           SET ACAT02IO-DB2-ERROR TO TRUE                               14780000
           MOVE SQLCAID TO ACAT02IO-SQLCAID                             14790000
           MOVE SQLCODE TO ACAT02IO-SQLCODE                             14800000
           MOVE SQLERRM TO ACAT02IO-SQLERRM                             14810000
           MOVE WS-COMMAREA TO DFHCOMMAREA(1 : WS-EIBCALEN).            14820000
           EXEC CICS RETURN END-EXEC.                                   14830000
