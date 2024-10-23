000001* PDX    - ACAT05DC C0330171 09/26/12 13:58:35 TBLAMUR            00001000
000001* LRM020 SSR 85105 USE 12 ISIN FOR A FOREIGN ISIN (NON US).       00001100
000001* PDX    - ACAT05DC C0290669 01/12/10 13:23:56 TBLAMUR            00001200
000001* LRM019 SSR 65698 RECOMPILE ONLY DUE TO COPY ACAT05IO CHANGE.    00001300
000001* PDX    - ACAT05DC C0287777 11/03/09 10:37:40 TBLAMUR            00001400
000001* LRM006 SSR 65670 SUB PENNY PRICE MSG RECOMPILE                  00001500
000001* PDX    - ACAT05DC C0277094 04/06/09 10:57:01 TBDOJUN            00001600
000001* DJ0001 SSR 61684 AUCTION RATE SECURITY MSG RECOMPILE            00001700
000001* PDX    - ACAT05DC C0240732 11/09/06 08:18:08 TBLAMUR            00001800
000001* PDX    - ACAT05DC C0238544 08/25/06 09:09:57 TBLAMUR            00001900
LRM005* SSR 45145 RECOMPILE ONLY DUE TO COPYBOOK 05IO CHANGE            00002000
000001* PDX    - ACAT05DC C0231507 07/07/06 14:51:49 TBEDTAK            00003000
000001* PDX    - ACAT05DC C0225230 10/10/05 13:31:18 TBEDTAK            00004000
ET0002* SSR39800  IDENTIFY DUPE MFC/FRV TRNFR AND DISPLAY MSG.          00005000
LRM002* SSR43083  ADD PTR FULL ASSET REQUEST MESSAGE                    00006000
000001* PDX    - ACAT05DC C0222099 07/08/05 12:02:45 TBEDTAK            00007000
ET0001* 07/01/05 SSR 39848 DISPLAY CAGE TAG# AND ALLOW USER TO UPDATE.  00008000
ET0001* 07/01/05 ADD MISSING INCLUDE VOPTN STATMENT.                    00009000
000001* PDX    - ACAT05DC C0222099 06/20/05 10:25:42 TBEDTAK            00010000
000001* PDX    - ACAT05DC C0205792 05/28/04 15:42:00 TBEDTAK            00020000
000001* PDX    - ACAT05DC C0126743 06/07/99 15:53:13 TBEDTAK            00030000
000001* PDX    - ACAT05DC C0120336 01/22/99 15:18:25 TBTIKUO            00040000
000001* PDX    - ACAT05DC C0112193 11/13/98 16:42:11 TBLAMUR            00050000
       IDENTIFICATION DIVISION.                                         00060000
       PROGRAM-ID.    ACAT05DC.                                         00070000
       AUTHOR.        TINA KUO.                                         00080000
       DATE-WRITTEN.                                                    00090000
       DATE-COMPILED.                                                   00100000
      *---------------------------------------------------------------* 00110000
      *                                                               * 00120000
      *   THIS IS THE ACATS I/O MODULE CALLED BY ACAT05NR,            * 00130000
      *   IT HANDLES DB2 FUNCTIONS OF TABLE ACAT_ASSET.               * 00140000
      *                                                               * 00150000
      *---------------------------------------------------------------* 00160000
      ***************************************************************** 00170000
       ENVIRONMENT DIVISION.                                            00180000
                                                                        00190000
       DATA DIVISION.                                                   00200000
                                                                        00210000
       WORKING-STORAGE SECTION.                                         00220000
       COPY PDXIDCOB.                                                   00230000
       01  FILLER                          PIC X(60)                    00240000
           VALUE 'ACAT05DC WORKING STORAGE BEGINS HERE'.                00250000
                                                                        00260000
092700 77  WS-COUNT                         PIC S9(9) COMP.             00270000
       01  WS-ACAT05DC-WORK-AREA.                                       00280000
           05  WS-RETURN-MSG                PIC X(70)  VALUE SPACE.     00290000
           05  WS-FIRST-TIME-SW                 PIC X(01).              00300000
               88  FIRST-TIME                      VALUE 'Y'.           00310000
           05  WS-FUNCTION                      PIC X(02).              00320000
               88  WS-SRCH-VASSET                  VALUE 'RA'.          00330000
               88  WS-SRCH-VTRNFR                  VALUE 'RT'.          00340000
           05  WS-SRCH-ACTION.                                          00350000
               07  WS-SEARCH-VTRNFR             PIC X(01).              00360000
                   88 WS-SRCH-VTRNFR-FWD           VALUE 'F'.           00370000
                   88 WS-SRCH-VTRNFR-BWD           VALUE 'B'.           00380000
               07  WS-SEARCH-VASSET             PIC X(01).              00390000
                   88 WS-SRCH-VASSET-FWD           VALUE 'F'.           00400000
                   88 WS-SRCH-VASSET-BWD           VALUE 'B'.           00410000
               07  WS-PREV-VASSET-ACT           PIC X(01).              00420000
                   88 WS-PREV-VASSET-FWD           VALUE 'F'.           00430000
                   88 WS-PREV-VASSET-BWD           VALUE 'B'.           00440000
           05  WS-RETURN-CODES.                                         00450000
               07 WS-DB2-ERROR-SW           PIC X(01).                  00460000
                  88 WS-DB2-ERROR                          VALUE 'Y'.   00470000
               07 WS-VTRNFR-SW              PIC X(01).                  00480000
                  88 WS-VTRNFR-FOUND                       VALUE 'F'.   00490000
                  88 WS-VTRNFR-NOT-FOUND                   VALUE 'N'.   00500000
                  88 WS-VTRNFR-UPDATED                     VALUE 'U'.   00510000
                  88 WS-VTRNFR-INSERTED                    VALUE 'I'.   00520000
                  88 WS-VTRNFR-DELETED                     VALUE 'D'.   00530000
               07 WS-VINITRNF-SW            PIC X(01).                  00540000
                  88 WS-VINITRNF-FOUND                     VALUE 'F'.   00550000
                  88 WS-VINITRNF-NOT-FOUND                 VALUE 'N'.   00560000
                  88 WS-VINITRNF-UPDATED                   VALUE 'U'.   00570000
                  88 WS-VINITRNF-INSERTED                  VALUE 'I'.   00580000
                  88 WS-VINITRNF-DELETED                   VALUE 'D'.   00590000
               07 WS-VASSET-SW              PIC X(01).                  00600000
                  88 WS-VASSET-FOUND                       VALUE 'F'.   00610000
                  88 WS-VASSET-NOT-FOUND                   VALUE 'N'.   00620000
               07  WS-SQLCA.                                            00630000
                  10  WS-SQLCAID             PIC X(08).                 00640000
                  10  WS-SQLCODE             PIC S9(09) COMP-4.         00650000
                  10  WS-SQLERRM.                                       00660000
                      13  WS-SQLERRML        PIC S9(04) COMP.           00670000
                      13  WS-SQLERRMC        PIC X(70).                 00680000
ET0002     05  WS-MFC-FRV-DUPE-IND              PIC X(01).              00690000
           05  WS-ROW-COUNTS.                                           00700000
               10 WS-VTRNFR-COUNT               PIC S9(9) COMP.         00710000
               10 WS-VASSET-COUNT               PIC S9(9) COMP.         00720000
               10 WS-VASSET-COUNT-SV            PIC S9(9) COMP.         00730000
               10 WS-MAX-ASSET-SEQ-NBR          PIC S9(4) COMP.         00740000
           05  WS-SAVE-KEYS.                                            00750000
               10 SV-CLIENT-NBR                 PIC X(04).              00760000
               10 SV-ACAT-CNTL-NBR              PIC X(14).              00770000
               10 SV-BRANCH-CD                  PIC X(03).              00780000
               10 SV-ACCT-CD                    PIC X(05).              00790000
               10 SV-RR-CD                      PIC X(03).              00800000
               10 SV-ASSET-SEQ-NBR              PIC S9(4) COMP.         00810000
           05  WS-FETCHED-ROW.                                          00820000
               10 WS-CLIENT-NBR                 PIC X(04).              00830000
               10 WS-ACAT-CNTL-NBR              PIC X(14).              00840000
               10 WS-ASSET-SEQ-NBR              PIC S9(4) COMP.         00850000
           05  WS-ASSET-AREA.                                           00860000
               10 WS-SEC-NBR                    PIC X(12).              00870000
               10 WS-TRANS-TYPE-CD              PIC X(01).              00880000
               10 WS-CSH-MGN-SHRT-CD            PIC X(01).              00890000
               10 WS-PSTN-CD                    PIC X(01).              00900000
01/22          10 WS-OPTN-CTGY-CD               PIC X(02).              00910000
01/22          10 WS-OPT-BS-CD                  PIC X(01).              00920000
                  88  WS-OPT-BUY                VALUE 'B'.              00930000
                  88  WS-OPT-SELL               VALUE 'S'.              00940000
               10 WS-WHEN-ISSUED                PIC X(01).              00950000
               10 WS-STTLM-LOCATION             PIC X(02).              00960000
               10 WS-TRNFR-TYPE-RSN-CD          PIC X(02).              00970000
01/13          10 WS-ASSET-QTY                  PIC S9(13)V9(4) COMP-3. 00980000
01/13          10 WS-ASSET-AMT                  PIC S9(15)V9(2) COMP-3. 00990000
               10 WS-ASSET-DESC                 PIC X(140).             01000000
               10 WS-ASSET-CMNT                 PIC X(120).             01010000
               10 WS-SBMT-BRKR                  PIC X(04).              01020000
               10 WS-RESTRICTED-IND             PIC X(01).              01030000
ET0001         10 WS-CAGE-TAG                   PIC X(11).              01040000
LRM002         10 WS-ASSET-RQST-QTY-CD          PIC X(01).              01050000
      *                                                                 01060000
       01  WS-ABEND-MESSAGE.                                            01070000
           05  FILLER                      PIC X(24) VALUE              01080000
             'ACAT05DC ABENDED ====> '.                                 01090000
           05  WS-ABCODE                   PIC X(04) VALUE SPACES.      01100000
                                                                        01110000
       01  WS-ERRL-DATA.                                                01120000
           05  REQUEST-TYPE                PIC X(01).                   01130000
               88  WRITE-ERROR-TO-LOG          VALUE 'W'.               01140000
           05  CALLING-TRAN-ID             PIC X(04).                   01150000
           05  CALLING-PROGRAM-ID          PIC X(08).                   01160000
           05  SQLCA-AREA                  PIC X(136).                  01170000
      /                                                                 01180000
           EXEC SQL                                                     01190000
                INCLUDE SQLCA                                           01200000
           END-EXEC                                                     01210000
      /                                                                 01220000
      *====>  ACAT ASSET TABLE                                          01230000
014700     EXEC SQL                                                     01240000
PC             INCLUDE VASSET                                           01250000
014900     END-EXEC.                                                    01260000
015000/                                                                 01270000
ET0001     EXEC SQL                                                     01280000
ET0001         INCLUDE VOPTN                                            01290000
ET0001     END-EXEC.                                                    01300000
      /                                                                 01310000
      *----------------------------------------------------------------*01320000
      *          FORWARD SEARCH VASSET ==> FWD_VAST                    *01330000
      *----------------------------------------------------------------*01340000
           EXEC SQL                                                     01350000
                DECLARE FWD_VAST   CURSOR FOR                           01360000
                SELECT                                                  01370000
                       CLIENT_NBR                                       01380000
                     , ACAT_CONTROL_NBR                                 01390000
                     , ASSET_SEQ_NBR                                    01400000
                     , ISIN_SEC_ISSUE_CD                                01410000
                     , TRANS_TYPE_CD                                    01420000
                     , CSH_MGN_SHRT_CD                                  01430000
                     , PSTN_CD                                          01440000
01/22                , OPTN_CTGY_CD                                     01450000
                     , WHI_CD                                           01460000
                     , STTLM_LCTN_CD                                    01470000
                     , TRNFR_TYPE_RSN_CD                                01480000
                     , ASSET_QTY                                        01490000
                     , ASSET_AMT                                        01500000
                     , ASSET_DESC_TXT                                   01510000
                     , ASSET_CMNT_TXT                                   01520000
                     , RESTRICTED_IND                                   01530000
ET0001               , CAGE_TAG_NBR                                     01540000
LRM002               , ASSET_RQST_QTY_CD                                01550000
LRM020               , ISIN_CNTRY_CD                                    01560000
LRM020               , ISIN_SEC_CDG_CD                                  01570000
                FROM VASSET                                             01580000
093000             WHERE (CLIENT_NBR       = :SV-CLIENT-NBR)            01590000
                    AND  (ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR)         01600000
                    AND  (ASSET_SEQ_NBR    > :SV-ASSET-SEQ-NBR)         01610000
                    AND  NOT STTLM_LCTN_CD = '40'                       01620000
01/19               AND  NOT (STTLM_LCTN_CD = '45'  AND                 01630000
01/19                        STTLM_RSN_CD = 'SMA')                      01640000
                   ORDER BY CLIENT_NBR, ACAT_CONTROL_NBR, ASSET_SEQ_NBR 01650000
           END-EXEC.                                                    01660000
      *******       AND  NOT STTLM_LCTN_CD = '45'                       01670000
      /                                                                 01680000
      *----------------------------------------------------------------*01690000
      *         BACKWARD SEARCH VASSET ==> BWD_VAST                    *01700000
      *----------------------------------------------------------------*01710000
           EXEC SQL                                                     01720000
                DECLARE BWD_VAST   CURSOR FOR                           01730000
                SELECT                                                  01740000
                       CLIENT_NBR                                       01750000
                     , ACAT_CONTROL_NBR                                 01760000
                     , ASSET_SEQ_NBR                                    01770000
                     , ISIN_SEC_ISSUE_CD                                01780000
                     , TRANS_TYPE_CD                                    01790000
                     , CSH_MGN_SHRT_CD                                  01800000
                     , PSTN_CD                                          01810000
01/22                , OPTN_CTGY_CD                                     01820000
                     , WHI_CD                                           01830000
                     , STTLM_LCTN_CD                                    01840000
                     , TRNFR_TYPE_RSN_CD                                01850000
                     , ASSET_QTY                                        01860000
                     , ASSET_AMT                                        01870000
                     , ASSET_DESC_TXT                                   01880000
                     , ASSET_CMNT_TXT                                   01890000
                     , RESTRICTED_IND                                   01900000
ET0001               , CAGE_TAG_NBR                                     01910000
LRM002               , ASSET_RQST_QTY_CD                                01920000
LRM020               , ISIN_CNTRY_CD                                    01930000
LRM020               , ISIN_SEC_CDG_CD                                  01940000
                FROM VASSET                                             01950000
093000             WHERE (CLIENT_NBR       = :SV-CLIENT-NBR)            01960000
                    AND  (ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR)         01970000
                    AND  (ASSET_SEQ_NBR    < :SV-ASSET-SEQ-NBR)         01980000
                    AND  NOT STTLM_LCTN_CD = '40'                       01990000
01/19               AND  NOT (STTLM_LCTN_CD = '45'  AND                 02000000
01/19                        STTLM_RSN_CD = 'SMA')                      02010000
                     ORDER BY CLIENT_NBR,                               02020000
                              ACAT_CONTROL_NBR  DESC,                   02030000
                              ASSET_SEQ_NBR   DESC                      02040000
           END-EXEC.                                                    02050000
      *****         AND  NOT STTLM_LCTN_CD = '45'                       02060000
      /                                                                 02070000
      **********************************************************        02080000
      *****      L I N K A G E  S E C T I O N              *****        02090000
      **********************************************************        02100000
       LINKAGE SECTION.                                                 02110000
                                                                        02120000
       01  DFHCOMMAREA.                                                 02130000
      *01  ACAT05IO-COMM-AREA.                                          02140000
           COPY ACAT05IO.                                               02150000
      /                                                                 02160000
      **********************************************************        02170000
      *****   P R O C E D U R E   D I V I S I O N           *****       02180000
      **********************************************************        02190000
       PROCEDURE DIVISION.                                              02200000
                                                                        02210000
           IF EIBCALEN > +0                                             02220000
              CONTINUE                                                  02230000
           ELSE                                                         02240000
              EXEC CICS RETURN END-EXEC                                 02250000
           END-IF.                                                      02260000
      *                                                                 02270000
           MOVE ACAT05IO-SV-CLIENT-NBR    TO SV-CLIENT-NBR.             02280000
           MOVE ACAT05IO-SV-ACAT-CNTL-NBR TO SV-ACAT-CNTL-NBR.          02290000
           MOVE ACAT05IO-SV-ASSET-SEQ-NBR TO SV-ASSET-SEQ-NBR.          02300000
           MOVE ACAT05IO-VASSET-COUNT     TO  WS-COUNT.                 02310000
      *                                                                 02320000
           IF ACAT05IO-FIRST-TIME                                       02330000
              MOVE  ' '    TO  ACAT05IO-FIRST-TIME-SW                   02340000
           END-IF.                                                      02350000
                                                                        02360000
           IF ACAT05IO-SRCH-VASSET-FWD                                  02370000
              PERFORM 0100-SRCH-VASSET-FWD                              02380000
           ELSE                                                         02390000
              IF ACAT05IO-SRCH-VASSET-BWD                               02400000
                 PERFORM 0200-SRCH-VASSET-BWD                           02410000
              END-IF                                                    02420000
           END-IF.                                                      02430000
                                                                        02440000
           MOVE SV-ASSET-SEQ-NBR  TO  ACAT05IO-SV-ASSET-SEQ-NBR.        02450000
           MOVE WS-COUNT          TO  ACAT05IO-VASSET-COUNT.            02460000
                                                                        02470000
           EXEC CICS RETURN END-EXEC.                                   02480000
      /                                                                 02490000
       0100-SRCH-VASSET-FWD.                                            02500000
      *                                                                 02510000
           PERFORM 0110-OPEN-FWD-CURSOR.                                02520000
           PERFORM 0120-FETCH-FWD-CURSOR.                               02530000
      *    PERFORM 0130-CLOSE-FWD-CURSOR.                               02540000
                                                                        02550000
       0110-OPEN-FWD-CURSOR.                                            02560000
                                                                        02570000
           EXEC SQL                                                     02580000
                OPEN FWD_VAST                                           02590000
           END-EXEC.                                                    02600000
      *                                                                 02610000
       0120-FETCH-FWD-CURSOR.                                           02620000
                                                                        02630000
           EXEC SQL                                                     02640000
                FETCH  FWD_VAST                                         02650000
                INTO                                                    02660000
                    :WS-CLIENT-NBR                                      02670000
                   ,:WS-ACAT-CNTL-NBR                                   02680000
                   ,:WS-ASSET-SEQ-NBR                                   02690000
LRM020             ,:DCLVASSET.ISIN-SEC-ISSUE-CD                        02700000
                   ,:WS-TRANS-TYPE-CD                                   02710000
                   ,:WS-CSH-MGN-SHRT-CD                                 02720000
                   ,:WS-PSTN-CD                                         02730000
01/22              ,:WS-OPTN-CTGY-CD                                    02740000
                   ,:WS-WHEN-ISSUED                                     02750000
                   ,:WS-STTLM-LOCATION                                  02760000
                   ,:WS-TRNFR-TYPE-RSN-CD                               02770000
                   ,:WS-ASSET-QTY                                       02780000
                   ,:WS-ASSET-AMT                                       02790000
                   ,:WS-ASSET-DESC                                      02800000
                   ,:WS-ASSET-CMNT                                      02810000
                   ,:WS-RESTRICTED-IND                                  02820000
ET0001             ,:WS-CAGE-TAG                                        02830000
LRM002             ,:WS-ASSET-RQST-QTY-CD                               02840000
LRM020             ,:DCLVASSET.ISIN-CNTRY-CD                            02850000
LRM020             ,:DCLVASSET.ISIN-SEC-CDG-CD                          02860000
093200     END-EXEC.                                                    02870000
      *                                                                 02880000
093400      EVALUATE SQLCODE                                            02890000
093500          WHEN +0                                                 02900000
                     SET ACAT05IO-VASSET-FOUND TO TRUE                  02910000
                     MOVE LOW-VALUE        TO ACAT05IO-DC               02920000
LRM020               IF ISIN-CNTRY-CD OF DCLVASSET > SPACES             02930000
LRM020               AND ISIN-CNTRY-CD OF DCLVASSET NOT = 'US'          02940000
LRM020                  MOVE ISIN-CNTRY-CD OF DCLVASSET                 02950000
LRM020                                          TO WS-SEC-NBR(1:2)      02960000
LRM020                  MOVE ISIN-SEC-ISSUE-CD OF DCLVASSET             02970000
LRM020                                          TO WS-SEC-NBR(3:9)      02971000
LRM020                  MOVE ISIN-SEC-CDG-CD OF DCLVASSET               02972000
LRM020                                          TO WS-SEC-NBR(12:1)     02973000
LRM020               ELSE                                               02974000
LRM020                  MOVE ISIN-SEC-ISSUE-CD OF DCLVASSET             02975000
LRM020                                          TO WS-SEC-NBR           02976000
LRM020               END-IF                                             02977000
                     MOVE WS-ASSET-AREA    TO ACAT05IO-DC               02978000
                     MOVE WS-ASSET-SEQ-NBR TO SV-ASSET-SEQ-NBR          02979000
                                            ACAT05IO-SV-ASSET-SEQ-NBR   02980000
093800          WHEN +100                                               02990000
                     SET ACAT05IO-VASSET-NOT-FOUND TO TRUE              03000000
                     IF ACAT05IO-SV-ASSET-SEQ-NBR  > +0                 03010000
                        SET ACAT05IO-VASSET-LAST TO TRUE                03020000
                        MOVE 'LAST ASSET POSITION WITHIN THIS ACCOUNT'  03030000
                        TO ACAT05IO-RETURN-MSG                          03040000
                     ELSE                                               03050000
                        SET ACAT05IO-VASSET-NOT-FOUND TO TRUE           03060000
                        MOVE 'NO ASSET POSITION WITHIN THIS ACCOUNT'    03070000
                        TO ACAT05IO-RETURN-MSG                          03080000
                     END-IF                                             03090000
                     PERFORM 0130-CLOSE-FWD-CURSOR                      03100000
094000          WHEN OTHER                                              03110000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     03120000
                     PERFORM 9500-RETURN-DB2-ERROR                      03130000
094200      END-EVALUATE.                                               03140000
                                                                        03150000
01/22 ******** ADDED FOR OPTION *************                           03160000
01/22      IF WS-OPTN-CTGY-CD > '00'                                    03170000
              PERFORM 0400-GET-VOPTN THRU 0400-EXIT                     03180000
01/22      END-IF.                                                      03190000
      *************************************************************     03200000
                                                                        03210000
094400 0100-EXIT.                                                       03220000
094500     EXIT.                                                        03230000
      /                                                                 03240000
      *                                                                 03250000
       0130-CLOSE-FWD-CURSOR.                                           03260000
                                                                        03270000
           EXEC SQL                                                     03280000
                CLOSE FWD_VAST                                          03290000
           END-EXEC.                                                    03300000
                                                                        03310000
      /                                                                 03320000
       0200-SRCH-VASSET-BWD.                                            03330000
      *                                                                 03340000
           PERFORM 0210-OPEN-BWD-CURSOR.                                03350000
           PERFORM 0220-FETCH-BWD-CURSOR.                               03360000
      *                                                                 03370000
       0210-OPEN-BWD-CURSOR.                                            03380000
                                                                        03390000
           EXEC SQL                                                     03400000
                OPEN BWD_VAST                                           03410000
           END-EXEC.                                                    03420000
      *                                                                 03430000
       0220-FETCH-BWD-CURSOR.                                           03440000
                                                                        03450000
           EXEC SQL                                                     03460000
                FETCH  BWD_VAST                                         03470000
                INTO                                                    03480000
                    :WS-CLIENT-NBR                                      03490000
                   ,:WS-ACAT-CNTL-NBR                                   03500000
                   ,:WS-ASSET-SEQ-NBR                                   03510000
LRM020             ,:DCLVASSET.ISIN-SEC-ISSUE-CD                        03520000
                   ,:WS-TRANS-TYPE-CD                                   03530000
                   ,:WS-CSH-MGN-SHRT-CD                                 03540000
                   ,:WS-PSTN-CD                                         03550000
01/22              ,:WS-OPTN-CTGY-CD                                    03560000
                   ,:WS-WHEN-ISSUED                                     03570000
                   ,:WS-STTLM-LOCATION                                  03580000
                   ,:WS-TRNFR-TYPE-RSN-CD                               03590000
                   ,:WS-ASSET-QTY                                       03600000
                   ,:WS-ASSET-AMT                                       03610000
                   ,:WS-ASSET-DESC                                      03620000
                   ,:WS-ASSET-CMNT                                      03630000
                   ,:WS-RESTRICTED-IND                                  03640000
ET0001             ,:WS-CAGE-TAG                                        03650000
LRM002             ,:WS-ASSET-RQST-QTY-CD                               03660000
LRM020             ,:DCLVASSET.ISIN-CNTRY-CD                            03670000
LRM020             ,:DCLVASSET.ISIN-SEC-CDG-CD                          03680000
093200     END-EXEC.                                                    03690000
      *                                                                 03700000
093400      EVALUATE SQLCODE                                            03710000
093500          WHEN +0                                                 03720000
                     SET ACAT05IO-VASSET-FOUND TO TRUE                  03730000
                     MOVE LOW-VALUE        TO ACAT05IO-DC               03740000
LRM020               IF ISIN-CNTRY-CD OF DCLVASSET > SPACES             03741000
LRM020               AND ISIN-CNTRY-CD OF DCLVASSET NOT = 'US'          03742000
LRM020                  MOVE ISIN-CNTRY-CD OF DCLVASSET                 03743000
LRM020                                          TO WS-SEC-NBR(1:2)      03744000
LRM020                  MOVE ISIN-SEC-ISSUE-CD OF DCLVASSET             03745000
LRM020                                          TO WS-SEC-NBR(3:9)      03746000
LRM020                  MOVE ISIN-SEC-CDG-CD OF DCLVASSET               03747000
LRM020                                          TO WS-SEC-NBR(12:1)     03748000
LRM020               ELSE                                               03749000
LRM020                  MOVE ISIN-SEC-ISSUE-CD OF DCLVASSET             03749100
LRM020                                          TO WS-SEC-NBR           03749200
LRM020               END-IF                                             03749300
                     MOVE WS-ASSET-AREA    TO ACAT05IO-DC               03749400
                     MOVE WS-ASSET-SEQ-NBR TO SV-ASSET-SEQ-NBR          03749500
                                            ACAT05IO-SV-ASSET-SEQ-NBR   03749600
093800          WHEN +100                                               03749700
                     IF ACAT05IO-SV-ASSET-SEQ-NBR  > +0                 03749800
                        SET ACAT05IO-VASSET-FIRST TO TRUE               03749900
                        MOVE 'FIRST ASSET POSITION WITHIN THIS ACCOUNT' 03750000
                        TO ACAT05IO-RETURN-MSG                          03760000
                     ELSE                                               03770000
                        SET ACAT05IO-VASSET-NOT-FOUND TO TRUE           03780000
                        MOVE 'NO ASSET POSITION WITHIN THIS ACCOUNT'    03790000
                        TO ACAT05IO-RETURN-MSG                          03800000
                     END-IF                                             03810000
                     PERFORM 0230-CLOSE-BWD-CURSOR                      03820000
094000          WHEN OTHER                                              03830000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     03840000
                     PERFORM 9500-RETURN-DB2-ERROR                      03850000
094200      END-EVALUATE.                                               03860000
                                                                        03870000
01/22 ******** ADDED FOR OPTION *************                           03880000
01/22      IF WS-OPTN-CTGY-CD > '00'                                    03890000
              PERFORM 0400-GET-VOPTN THRU 0400-EXIT                     03900000
01/22      END-IF.                                                      03910000
                                                                        03920000
094400 0200-EXIT.                                                       03930000
094500     EXIT.                                                        03940000
      *                                                                 03950000
       0230-CLOSE-BWD-CURSOR.                                           03960000
                                                                        03970000
           EXEC SQL                                                     03980000
                CLOSE BWD_VAST                                          03990000
           END-EXEC.                                                    04000000
      /                                                                 04010000
       0300-MOVE-RSN-CD.                                                04020000
           IF WS-CSH-MGN-SHRT-CD = 'C'                                  04030000
              MOVE WS-TRNFR-TYPE-RSN-CD  TO  ACAT05IO-RSCD01            04040000
           ELSE                                                         04050000
              IF WS-CSH-MGN-SHRT-CD = 'M'                               04060000
                 MOVE WS-TRNFR-TYPE-RSN-CD TO ACAT05IO-RSCD02           04070000
              ELSE                                                      04080000
                 MOVE WS-TRNFR-TYPE-RSN-CD TO ACAT05IO-RSCD05           04090000
              END-IF                                                    04100000
           END-IF.                                                      04110000
                                                                        04120000
       0300-EXIT.                                                       04130000
           EXIT.                                                        04140000
      /                                                                 04150000
01/22  0400-GET-VOPTN.                                                  04160000
                                                                        04170000
           EXEC SQL                                                     04180000
                SELECT BS_CD                                            04190000
                INTO   :WS-OPT-BS-CD                                    04200000
                FROM VOPTN                                              04210000
                WHERE (CLIENT_NBR = :SV-CLIENT-NBR                      04220000
                 AND  ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR              04230000
                 AND  ASSET_SEQ_NBR = : SV-ASSET-SEQ-NBR)               04240000
           END-EXEC.                                                    04250000
                                                                        04260000
           EVALUATE SQLCODE                                             04270000
                WHEN +0                                                 04280000
                     SET ACAT05IO-VOPTN-FOUND   TO TRUE                 04290000
                     MOVE WS-OPT-BS-CD TO ACAT05IO-OPT-BS-CD            04300000
                WHEN +100                                               04310000
                     SET ACAT05IO-VOPTN-NOT-FOUND TO TRUE               04320000
                     MOVE ' OPTION INFO NOT FOUND (VOPTN)'              04330000
                        TO WS-RETURN-MSG                                04340000
                WHEN OTHER                                              04350000
                     MOVE SPACE TO ACAT05IO-VOPTN-SW                    04360000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     04370000
                     PERFORM 9500-RETURN-DB2-ERROR                      04380000
           END-EVALUATE.                                                04390000
       0400-EXIT.                                                       04400000
           EXIT.                                                        04410000
      /                                                                 04420000
     ***---------------------------------------------------------------*04430000
       ABENDED.                                                         04440000
     ***   EXEC CICS ASSIGN ABCODE(WS-ABCODE) END-EXEC.                 04450000
     ***   MOVE WS-ABEND-MESSAGE TO BHST-MESSAGE.                       04460000
     ***   MOVE '9999' TO BHST-RETURN-CODE.                             04470000
     **    EXEC CICS RETURN END-EXEC.                                   04480000
      *==============================                                   04490000
                                                                        04500000
       9000-WRITE-TO-CICS-LOG.                                          04510000
      *==============================                                   04520000
           IF SQLCODE = -803                                            04530000
               CONTINUE                                                 04540000
           ELSE                                                         04550000
               MOVE SPACES             TO WS-ERRL-DATA                  04560000
               SET WRITE-ERROR-TO-LOG  TO TRUE                          04570000
               MOVE EIBTRNID           TO CALLING-TRAN-ID               04580000
               MOVE 'ACAT05DC'         TO CALLING-PROGRAM-ID            04590000
               MOVE SQLCA              TO SQLCA-AREA                    04600000
               EXEC CICS LINK PROGRAM ('FPDB2LOG')                      04610000
                     COMMAREA (WS-ERRL-DATA)                            04620000
                     LENGTH (LENGTH OF WS-ERRL-DATA)                    04630000
                     NOHANDLE                                           04640000
               END-EXEC                                                 04650000
           END-IF.                                                      04660000
      *    EXEC CICS RETURN END-EXEC.                                   04670000
                                                                        04680000
       9500-RETURN-DB2-ERROR.                                           04690000
           EXEC CICS SYNCPOINT ROLLBACK END-EXEC.                       04700000
           SET ACAT05IO-DB2-ERROR TO TRUE.                              04710000
           MOVE SQLCAID TO ACAT05IO-SQLCAID.                            04720000
           MOVE SQLCODE TO ACAT05IO-SQLCODE.                            04730000
           MOVE SQLERRM TO ACAT05IO-SQLERRM.                            04740000
           EXEC CICS RETURN END-EXEC.                                   04750000
094600*---------------------------------------------------------------* 04760000
