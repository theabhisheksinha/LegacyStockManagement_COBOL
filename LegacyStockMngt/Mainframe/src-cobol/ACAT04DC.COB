000001* PDX    - ACAT04DC C0287777 11/03/09 10:25:39 TBLAMUR            00001000
000001* LRM009 SSR 65670 SUB PENNY PRICE MSG RECOMPILE                  00001101
000001* PDX    - ACAT04DC C0277094 04/06/09 10:55:58 TBDOJUN            00001200
000001* DJ0001 SSR 61684 AUCTION RATE SECURITY MSG RECOMPILE            00020000
000001* LRM008 WIPE ACK_IND TO CAUSE ASCENDIS CLIENT UPD TO GO TO NSCC. 00021000
000001* PDX    - ACAT04DC C0263391 04/03/08 13:40:23 TBLAMUR            00030000
000001* LRM007 SSR# 55766 ASCENDIS INTERFACE. WIPE ACK_IND ON UPDATE.   00040000
000001* PDX    - ACAT04DC C0245632 03/01/07 11:20:24 TBLAMUR            00050000
      * LRM006 SSR 49202 OBTAIN STTLE LOC RSN FOR REGT,90DR DISPLAY.    00060000
000001* PDX    - ACAT04DC C0240732 11/09/06 10:33:22 TBLAMUR            00070000
000001* PDX    - ACAT04DC C0238544 08/24/06 11:02:06 TBLAMUR            00080000
      * LRM005 SSR 45145 RECOMPILE ONLY DUE TO COPYBOOK 04IO CHANGE     00090000
000001* PDX    - ACAT04DC C0231507 07/07/06 16:04:49 TBEDTAK            00100000
      * ET0005 40661 RETAIN USER ID OF INITIATOR.                       00110000
      * ET0004 45744 ACCT FREEZE. RECOMPILE ONLY DUE TO COPY MEMBER CHG.00120000
000001* PDX    - ACAT04DC C0215192 12/29/04 13:58:15 TBEDTAK            00130000
      * ET0003 SSR# 40042  DB2 TABLE KEY CHANGE WITH NEW TBL NAME       00140000
000001* PDX    - ACAT04DC C0214674 12/22/04 14:54:30 TBEDTAK            00150000
      * ET0002 SSR# 40633  ANNUITY RECEIVER ADJUSTMENTS(DELETES)        00160000
000001* PDX    - ACAT04DC C0211347 12/21/04 16:14:16 TBEDTAK            00170000
      * ET0001 SSR# 29649  MUTUAL FUND AUTO DELETE BY BATCH             00180000
000001* PDX    - ACAT04DC C0158587 07/18/01 14:25:47 TBDOJUN            00190000
      * DJ0002 SSR# R3848800 MUTUAL FUND RECEIVER ADJUSTMENTS(DELETES)  00200000
      *        ADD LOGIC TO READ AND UPDATE VINITAST                    00210000
      * PDX    - ACAT04DC C0130065 09/23/99 11:00:12 TBLAMUR            00220000
      * PDX    - ACAT04DC C0126743 06/04/99 10:43:36 TBTIKUO            00230000
      * PDX    - ACAT04DC C0121426 02/06/99 14:23:02 TBEDTAK            00240000
      * PDX    - ACAT04DC C0120812 02/04/99 18:55:20 TBEDTAK            00250000
      * PDX    - ACAT04DC C0119861 01/20/99 10:11:18 TBTIKUO            00260000
      * PDX    - ACAT04DC C0119290 01/05/99 17:20:50 TBTIKUO            00270000
      * PDX    - ACAT04DC C0112193 11/13/98 16:40:34 TBLAMUR            00280000
       IDENTIFICATION DIVISION.                                         00290000
       PROGRAM-ID.    ACAT04DC.                                         00300000
       AUTHOR.        TINA KUO.                                         00310000
       DATE-WRITTEN.                                                    00320000
       DATE-COMPILED.                                                   00330000
      *---------------------------------------------------------------* 00340000
      *                                                               * 00350000
      *   THIS IS THE ACATS I/O MODULE CALLED BY ACAT04RS,            * 00360000
      *   IT HANDLES DB2 FUNCTIONS OF TABLE ACAT_ASSET.               * 00370000
DJ0002*   AND IT SELECTS/UPDATES/DELETES THE VINITAST TABLE.          * 00380000
      *                                                               * 00390000
      *---------------------------------------------------------------* 00400000
       ENVIRONMENT DIVISION.                                            00410000
                                                                        00420000
       DATA DIVISION.                                                   00430000
                                                                        00440000
       WORKING-STORAGE SECTION.                                         00450000
       COPY PDXIDCOB.                                                   00460000
       01  FILLER                          PIC X(60)                    00470000
           VALUE 'ACAT04DC WORKING STORAGE BEGINS HERE'.                00480000
                                                                        00490000
       01  WS-ACAT04DC-WORK-AREA.                                       00500000
           05  WS-COUNT                         PIC S9(9) COMP.         00510000
ET0001     05  WS-ROW-COUNT                     PIC S9(9) COMP.         00520000
           05  WS-RETURN-MSG                    PIC X(70) VALUE SPACE.  00530000
           05  WS-TIMESTAMP                     PIC X(26).              00540000
ET0001     05  WS-CICS-TERMID                   PIC X(04).              00550000
           05  WS-SAVE-KEYS.                                            00560000
               10 SV-CLIENT-NBR                 PIC X(04).              00570000
               10 SV-ACAT-CNTL-NBR              PIC X(14).              00580000
               10 SV-ASSET-SEQ-NBR              PIC S9(4) COMP.         00590000
           05  WS-FETCHED-ROW.                                          00600000
               10 WS-CLIENT-NBR                 PIC X(04).              00610000
               10 WS-ACAT-CNTL-NBR              PIC X(14).              00620000
               10 WS-ASSET-SEQ-NBR              PIC S9(4) COMP.         00630000
           05  WS-ASSET-AREA.                                           00640000
               10 WS-SEC-NBR                    PIC X(12).              00650000
               10 WS-TRANS-TYPE-CD              PIC X(01).              00660000
               10 WS-CSH-MGN-SHRT-CD            PIC X(01).              00670000
               10 WS-PSTN-CD                    PIC X(01).              00680000
               10 WS-OPTN-CTGY-CD               PIC X(02).              00690000
               10 WS-OPT-BS-CD                  PIC X(01).              00700000
                  88  WS-OPT-BUY                VALUE 'B'.              00710000
                  88  WS-OPT-SELL               VALUE 'S'.              00720000
               10 WS-WHEN-ISSUED                PIC X(01).              00730000
               10 WS-STTLM-LCTN-CD              PIC X(02).              00740000
               10 WS-TRNFR-TYPE-RSN-CD          PIC X(02).              00750000
               10 WS-ASSET-QTY                  PIC S9(13)V9(4) COMP-3. 00760000
               10 WS-ASSET-AMT                  PIC S9(15)V99 COMP-3.   00770000
               10 WS-ASSET-DESC                 PIC X(140).             00780000
               10 WS-ASSET-CMNT                 PIC X(120).             00790000
               10 WS-OPTN-CMNT-TXT              PIC X(16).              00800000
               10 WS-RESTRICTED-IND             PIC X(01).              00810000
DJ0002         10 WS-ASSET-PRC-CTGY-CD          PIC X(04).              00820000
ET0001         10 WS-NEXT-ASSET-SW              PIC X(01).              00830000
ET0001            88 WS-FIRST-TIME-ASSET                   VALUE '1'.   00840000
ET0001            88 WS-NEXT-ASSET                         VALUE 'N'.   00850000
ET0001            88 WS-PREV-ASSET                         VALUE 'P'.   00860000
ET0001            88 WS-FIRST-ASSET                        VALUE 'F'.   00870000
ET0001            88 WS-LAST-ASSET                         VALUE 'L'.   00880000
LRM006         10 WS-STTLM-RSN-CD               PIC X(04).              00890000
                                                                        00900000
       01  WS-ERRL-DATA.                                                00910000
           05  REQUEST-TYPE                     PIC X(01).              00920000
               88  WRITE-ERROR-TO-LOG               VALUE 'W'.          00930000
           05  CALLING-TRAN-ID                  PIC X(04).              00940000
           05  CALLING-PROGRAM-ID               PIC X(08).              00950000
           05  SQLCA-AREA                       PIC X(136).             00960000
      /                                                                 00970000
           EXEC SQL                                                     00980000
                INCLUDE SQLCA                                           00990000
           END-EXEC                                                     01000000
      /                                                                 01010000
      *====>  ACAT ASSET TABLE                                          01020000
           EXEC SQL                                                     01030000
               INCLUDE VASSET                                           01040000
           END-EXEC.                                                    01050000
      /                                                                 01060000
           EXEC SQL                                                     01070000
               INCLUDE VOPTN                                            01080000
           END-EXEC.                                                    01090000
      /                                                                 01100000
      *----------------------------------------------------------------*01110000
      *          FORWARD SEARCH VASSET ==> FWD_VAST                    *01120000
      *----------------------------------------------------------------*01130000
           EXEC SQL                                                     01140000
                DECLARE FWD_VAST   CURSOR FOR                           01150000
                SELECT                                                  01160000
                       CLIENT_NBR                                       01170000
                     , ACAT_CONTROL_NBR                                 01180000
                     , ASSET_SEQ_NBR                                    01190000
                     , ISIN_SEC_ISSUE_CD                                01200000
                     , TRANS_TYPE_CD                                    01210000
                     , CSH_MGN_SHRT_CD                                  01220000
                     , PSTN_CD                                          01230000
                     , OPTN_CTGY_CD                                     01240000
                     , WHI_CD                                           01250000
                     , STTLM_LCTN_CD                                    01260000
                     , TRNFR_TYPE_RSN_CD                                01270000
                     , ASSET_QTY                                        01280000
                     , ASSET_AMT                                        01290000
                     , ASSET_DESC_TXT                                   01300000
                     , ASSET_CMNT_TXT                                   01310000
                     , RESTRICTED_IND                                   01320000
DJ0002               , ASSET_PRC_CTGY_CD                                01330000
LRM006               , STTLM_RSN_CD                                     01340000
                FROM VASSET                                             01350000
                   WHERE (CLIENT_NBR       = :SV-CLIENT-NBR)            01360000
                    AND  (ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR)         01370000
                    AND  (ASSET_SEQ_NBR    > :SV-ASSET-SEQ-NBR)         01380000
                    AND  NOT STTLM_LCTN_CD = '40'                       01390000
                    AND  NOT (STTLM_LCTN_CD = '45'  AND                 01400000
                              STTLM_RSN_CD = 'SMA')                     01410000
                   ORDER BY CLIENT_NBR, ACAT_CONTROL_NBR, ASSET_SEQ_NBR 01420000
                                                                        01430000
           END-EXEC.                                                    01440000
      /                                                                 01450000
      *----------------------------------------------------------------*01460000
      *         BACKWARD SEARCH VASSET ==> BWD_VAST                    *01470000
      *----------------------------------------------------------------*01480000
           EXEC SQL                                                     01490000
                DECLARE BWD_VAST   CURSOR FOR                           01500000
                SELECT                                                  01510000
                       CLIENT_NBR                                       01520000
                     , ACAT_CONTROL_NBR                                 01530000
                     , ASSET_SEQ_NBR                                    01540000
                     , ISIN_SEC_ISSUE_CD                                01550000
                     , TRANS_TYPE_CD                                    01560000
                     , CSH_MGN_SHRT_CD                                  01570000
                     , PSTN_CD                                          01580000
                     , OPTN_CTGY_CD                                     01590000
                     , WHI_CD                                           01600000
                     , STTLM_LCTN_CD                                    01610000
                     , TRNFR_TYPE_RSN_CD                                01620000
                     , ASSET_QTY                                        01630000
                     , ASSET_AMT                                        01640000
                     , ASSET_DESC_TXT                                   01650000
                     , ASSET_CMNT_TXT                                   01660000
                     , RESTRICTED_IND                                   01670000
DJ0002               , ASSET_PRC_CTGY_CD                                01680000
LRM006               , STTLM_RSN_CD                                     01690000
                FROM VASSET                                             01700000
                   WHERE (CLIENT_NBR       = :SV-CLIENT-NBR)            01710000
                    AND  (ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR)         01720000
                    AND  (ASSET_SEQ_NBR    < :SV-ASSET-SEQ-NBR)         01730000
                    AND  NOT STTLM_LCTN_CD = '40'                       01740000
                    AND  NOT (STTLM_LCTN_CD = '45'  AND                 01750000
                              STTLM_RSN_CD = 'SMA')                     01760000
                     ORDER BY CLIENT_NBR,                               01770000
                              ACAT_CONTROL_NBR  DESC,                   01780000
                              ASSET_SEQ_NBR   DESC                      01790000
           END-EXEC.                                                    01800000
      /                                                                 01810000
      *----------------------------------------------------------------*01820000
      *   ACAT INIT ASSET TABLE                                        *01830000
      *----------------------------------------------------------------*01840000
           EXEC SQL                                                     01850000
ET0003**       INCLUDE VINITAST                                         01860000
ET0003         INCLUDE ACTIAST                                          01870000
           END-EXEC.                                                    01880000
      /                                                                 01890000
      *---------------------------------------------------------------- 01900000
       LINKAGE SECTION.                                                 01910000
      *---------------------------------------------------------------- 01920000
                                                                        01930000
       01  DFHCOMMAREA.                                                 01940000
      *01**ACAT04IO-COMM-AREA.                                          01950000
           COPY ACAT04IO.                                               01960000
      /                                                                 01970000
      *---------------------------------------------------------------- 01980000
       PROCEDURE DIVISION.                                              01990000
      *---------------------------------------------------------------- 02000000
                                                                        02010000
           IF EIBCALEN > +0                                             02020000
              CONTINUE                                                  02030000
           ELSE                                                         02040000
              EXEC CICS RETURN END-EXEC                                 02050000
           END-IF.                                                      02060000
                                                                        02070000
ET0001     EXEC SQL                                                     02080000
ET0001        SET :WS-TIMESTAMP = CURRENT TIMESTAMP                     02090000
ET0001     END-EXEC.                                                    02100000
                                                                        02110000
           MOVE ACAT04IO-SV-CLIENT-NBR    TO SV-CLIENT-NBR.             02120000
           MOVE ACAT04IO-SV-ACAT-CNTL-NBR TO SV-ACAT-CNTL-NBR.          02130000
           MOVE ACAT04IO-SV-ASSET-SEQ-NBR TO SV-ASSET-SEQ-NBR.          02140000
           MOVE ACAT04IO-VASSET-COUNT     TO WS-COUNT.                  02150000
                                                                        02160000
           PERFORM 0410-PROCESS-MF-DELETES                              02170000
                                                                        02180000
           IF ACAT04IO-SRCH-VASSET-FWD                                  02190000
              PERFORM 0100-SRCH-VASSET-FWD                              02200000
           ELSE                                                         02210000
              IF ACAT04IO-SRCH-VASSET-BWD                               02220000
                 PERFORM 0200-SRCH-VASSET-BWD                           02230000
              END-IF                                                    02240000
           END-IF.                                                      02250000
                                                                        02260000
           MOVE SV-ASSET-SEQ-NBR  TO  ACAT04IO-SV-ASSET-SEQ-NBR.        02270000
           MOVE WS-COUNT          TO  ACAT04IO-VASSET-COUNT.            02280000
                                                                        02290000
           EXEC CICS RETURN END-EXEC.                                   02300000
      /                                                                 02310000
      *---------------------------------------------------------------- 02320000
       0100-SRCH-VASSET-FWD.                                            02330000
      *---------------------------------------------------------------- 02340000
                                                                        02350000
           PERFORM 0110-OPEN-FWD-CURSOR.                                02360000
           PERFORM 0120-FETCH-FWD-CURSOR.                               02370000
                                                                        02380000
       0110-OPEN-FWD-CURSOR.                                            02390000
                                                                        02400000
           EXEC SQL                                                     02410000
                OPEN FWD_VAST                                           02420000
           END-EXEC.                                                    02430000
                                                                        02440000
       0120-FETCH-FWD-CURSOR.                                           02450000
                                                                        02460000
           EXEC SQL                                                     02470000
                FETCH  FWD_VAST                                         02480000
                INTO                                                    02490000
                    :WS-CLIENT-NBR                                      02500000
                   ,:WS-ACAT-CNTL-NBR                                   02510000
                   ,:WS-ASSET-SEQ-NBR                                   02520000
                   ,:WS-SEC-NBR                                         02530000
                   ,:WS-TRANS-TYPE-CD                                   02540000
                   ,:WS-CSH-MGN-SHRT-CD                                 02550000
                   ,:WS-PSTN-CD                                         02560000
                   ,:WS-OPTN-CTGY-CD                                    02570000
                   ,:WS-WHEN-ISSUED                                     02580000
                   ,:WS-STTLM-LCTN-CD                                   02590000
                   ,:WS-TRNFR-TYPE-RSN-CD                               02600000
                   ,:WS-ASSET-QTY                                       02610000
                   ,:WS-ASSET-AMT                                       02620000
                   ,:WS-ASSET-DESC                                      02630000
                   ,:WS-ASSET-CMNT                                      02640000
                   ,:WS-RESTRICTED-IND                                  02650000
DJ0002             ,:WS-ASSET-PRC-CTGY-CD                               02660000
LRM006             ,:WS-STTLM-RSN-CD                                    02670000
           END-EXEC.                                                    02680000
                                                                        02690000
            EVALUATE SQLCODE                                            02700000
                WHEN +0                                                 02710000
                     SET ACAT04IO-VASSET-FOUND TO TRUE                  02720000
                     IF ACAT04IO-SV-ASSET-SEQ-NBR > +0                  02730000
                        MOVE 'NEXT ASSET DISPLAYED'                     02740000
                           TO ACAT04IO-RETURN-MSG                       02750000
ET0001                  SET WS-NEXT-ASSET   TO TRUE                     02760000
ET0001               ELSE                                               02770000
ET0001                  SET WS-FIRST-TIME-ASSET TO TRUE                 02780000
                     END-IF                                             02790000
                     MOVE LOW-VALUE        TO ACAT04IO-DC               02800000
                     MOVE WS-ASSET-AREA    TO ACAT04IO-DC               02810000
                     MOVE WS-ASSET-SEQ-NBR TO SV-ASSET-SEQ-NBR          02820000
                                            ACAT04IO-SV-ASSET-SEQ-NBR   02830000
                WHEN +100                                               02840000
                     SET ACAT04IO-VASSET-NOT-FOUND TO TRUE              02850000
                     IF ACAT04IO-SV-ASSET-SEQ-NBR > +0                  02860000
                        SET ACAT04IO-VASSET-LAST TO TRUE                02870000
                        MOVE 'LAST ASSET POSITION UNDER THIS TIF '      02880000
                        TO ACAT04IO-RETURN-MSG                          02890000
ET0001                  SET  WS-LAST-ASSET   TO TRUE                    02900000
                     ELSE                                               02910000
                        SET ACAT04IO-VASSET-FIRST TO TRUE               02920000
                        MOVE 'NO ASSET POSITIONS UNDER THIS TIF'        02930000
                        TO ACAT04IO-RETURN-MSG                          02940000
                     END-IF                                             02950000
                     PERFORM 0130-CLOSE-FWD-CURSOR                      02960000
                WHEN OTHER                                              02970000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     02980000
                     PERFORM 9500-RETURN-DB2-ERROR                      02990000
            END-EVALUATE.                                               03000000
                                                                        03010000
           IF WS-OPTN-CTGY-CD > '00'                                    03020000
              PERFORM 0300-GET-VOPTN THRU 0300-EXIT                     03030000
           ELSE                                                         03040000
ET0002        IF (WS-STTLM-LCTN-CD = '60' OR '65')                      03050000
ET0002           PERFORM 0400-GET-VINITAST THRU 0400-EXIT               03060000
ET0002        ELSE                                                      03070000
DJ0002        IF (WS-ASSET-PRC-CTGY-CD = 'MFNM' OR 'MFMM')              03080000
DJ0002           PERFORM 0400-GET-VINITAST THRU 0400-EXIT               03090000
ET0003           IF NSCC-PEND-CD OF DCLACTIAST = 'H'                    03100000
ET0001              IF WS-FIRST-TIME-ASSET                              03110000
ET0001                 MOVE 'DELETE RECORD ON THIS ASSET TO BE SENT ON C03120000
ET0001-                     'YCLE 1'                                    03130000
ET0001                   TO  ACAT04IO-RETURN-MSG                        03140000
ET0001              END-IF                                              03150000
ET0001              IF WS-NEXT-ASSET                                    03160000
ET0001                 MOVE 'NEXT ASSET DISPLAYED  (DELETE RECORD TO BE 03170000
ET0001-                     'SENT ON CYCLE 1)'                          03180000
ET0001                   TO  ACAT04IO-RETURN-MSG                        03190000
ET0001              END-IF                                              03200000
ET0001              IF WS-LAST-ASSET                                    03210000
ET0001                 MOVE 'LAST ASSET POSITION UNDER THIS TIF (DELETE 03220000
ET0001-                     'TO BE SENT ON CYCLE1)'                     03230000
ET0001                   TO  ACAT04IO-RETURN-MSG                        03240000
ET0001              END-IF                                              03250000
ET0001           END-IF                                                 03260000
DJ0002        END-IF                                                    03270000
ET0002        END-IF                                                    03280000
           END-IF.                                                      03290000
                                                                        03300000
       0130-CLOSE-FWD-CURSOR.                                           03310000
                                                                        03320000
           EXEC SQL                                                     03330000
                CLOSE FWD_VAST                                          03340000
           END-EXEC.                                                    03350000
      /                                                                 03360000
      *---------------------------------------------------------------- 03370000
       0200-SRCH-VASSET-BWD.                                            03380000
      *---------------------------------------------------------------- 03390000
                                                                        03400000
           PERFORM 0210-OPEN-BWD-CURSOR.                                03410000
           PERFORM 0220-FETCH-BWD-CURSOR.                               03420000
                                                                        03430000
       0210-OPEN-BWD-CURSOR.                                            03440000
                                                                        03450000
           EXEC SQL                                                     03460000
                OPEN BWD_VAST                                           03470000
           END-EXEC.                                                    03480000
                                                                        03490000
       0220-FETCH-BWD-CURSOR.                                           03500000
                                                                        03510000
           EXEC SQL                                                     03520000
                FETCH  BWD_VAST                                         03530000
                INTO                                                    03540000
                    :WS-CLIENT-NBR                                      03550000
                   ,:WS-ACAT-CNTL-NBR                                   03560000
                   ,:WS-ASSET-SEQ-NBR                                   03570000
                   ,:WS-SEC-NBR                                         03580000
                   ,:WS-TRANS-TYPE-CD                                   03590000
                   ,:WS-CSH-MGN-SHRT-CD                                 03600000
                   ,:WS-PSTN-CD                                         03610000
                   ,:WS-OPTN-CTGY-CD                                    03620000
                   ,:WS-WHEN-ISSUED                                     03630000
                   ,:WS-STTLM-LCTN-CD                                   03640000
                   ,:WS-TRNFR-TYPE-RSN-CD                               03650000
                   ,:WS-ASSET-QTY                                       03660000
                   ,:WS-ASSET-AMT                                       03670000
                   ,:WS-ASSET-DESC                                      03680000
                   ,:WS-ASSET-CMNT                                      03690000
                   ,:WS-RESTRICTED-IND                                  03700000
DJ0002             ,:WS-ASSET-PRC-CTGY-CD                               03710000
LRM006             ,:WS-STTLM-RSN-CD                                    03720000
           END-EXEC.                                                    03730000
                                                                        03740000
            EVALUATE SQLCODE                                            03750000
                WHEN +0                                                 03760000
                     SET ACAT04IO-VASSET-FOUND TO TRUE                  03770000
                     MOVE 'PREV ASSET DISPLAYED'                        03780000
                        TO ACAT04IO-RETURN-MSG                          03790000
ET0001               SET  WS-PREV-ASSET    TO TRUE                      03800000
                     MOVE LOW-VALUE        TO ACAT04IO-DC               03810000
                     MOVE WS-ASSET-AREA    TO ACAT04IO-DC               03820000
                     MOVE WS-ASSET-SEQ-NBR TO SV-ASSET-SEQ-NBR          03830000
                                            ACAT04IO-SV-ASSET-SEQ-NBR   03840000
                WHEN +100                                               03850000
                     SET ACAT04IO-VASSET-NOT-FOUND TO TRUE              03860000
                     IF ACAT04IO-SV-ASSET-SEQ-NBR > +0                  03870000
                        SET ACAT04IO-VASSET-FIRST TO TRUE               03880000
                        MOVE 'FIRST ASSET POSITION UNDER THIS TIF '     03890000
                        TO ACAT04IO-RETURN-MSG                          03900000
ET0001                  SET  WS-FIRST-ASSET   TO TRUE                   03910000
                     ELSE                                               03920000
                        SET ACAT04IO-VASSET-LAST TO TRUE                03930000
                        MOVE 'NO ASSET POSITION UNDER THIS TIF'         03940000
                        TO ACAT04IO-RETURN-MSG                          03950000
                     END-IF                                             03960000
                     PERFORM 0230-CLOSE-BWD-CURSOR                      03970000
                WHEN OTHER                                              03980000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     03990000
                     PERFORM 9500-RETURN-DB2-ERROR                      04000000
            END-EVALUATE.                                               04010000
                                                                        04020000
           IF WS-OPTN-CTGY-CD > '00'                                    04030000
              PERFORM 0300-GET-VOPTN THRU 0300-EXIT                     04040000
           ELSE                                                         04050000
ET0002        IF (WS-STTLM-LCTN-CD = '60' OR '65')                      04060000
ET0002           PERFORM 0400-GET-VINITAST THRU 0400-EXIT               04070000
ET0002        ELSE                                                      04080000
DJ0002        IF (WS-ASSET-PRC-CTGY-CD = 'MFNM' OR 'MFMM')              04090000
DJ0002           PERFORM 0400-GET-VINITAST THRU 0400-EXIT               04100000
ET0003           IF NSCC-PEND-CD OF DCLACTIAST = 'H'                    04110000
ET0001              IF WS-PREV-ASSET                                    04120000
ET0001                 MOVE 'PREV ASSET DISPLAYED  (DELETE RECORD TO BE 04130000
ET0001-                     'SENT ON CYCLE 1)'                          04140000
ET0001                   TO  ACAT04IO-RETURN-MSG                        04150000
ET0001              END-IF                                              04160000
ET0001              IF WS-FIRST-ASSET                                   04170000
ET0001                 MOVE 'FIRST ASSET POSITION UNDER THIS TIF (DELETE04180000
ET0001-                     ' TO BE SENT ON CYCLE 1)'                   04190000
ET0001                   TO  ACAT04IO-RETURN-MSG                        04200000
ET0001              END-IF                                              04210000
ET0001           END-IF                                                 04220000
ET0002        END-IF                                                    04230000
DJ0002        END-IF                                                    04240000
           END-IF.                                                      04250000
                                                                        04260000
       0230-CLOSE-BWD-CURSOR.                                           04270000
                                                                        04280000
           EXEC SQL                                                     04290000
                CLOSE BWD_VAST                                          04300000
           END-EXEC.                                                    04310000
      /                                                                 04320000
      *---------------------------------------------------------------- 04330000
       0300-GET-VOPTN.                                                  04340000
      *---------------------------------------------------------------- 04350000
                                                                        04360000
           EXEC SQL                                                     04370000
                SELECT BS_CD                                            04380000
                      ,OPTN_CMNT_TXT                                    04390000
                INTO   :WS-OPT-BS-CD                                    04400000
                      ,:WS-OPTN-CMNT-TXT                                04410000
                FROM VOPTN                                              04420000
                WHERE (CLIENT_NBR      = :SV-CLIENT-NBR                 04430000
                 AND  ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR              04440000
                 AND  ASSET_SEQ_NBR    = :SV-ASSET-SEQ-NBR)             04450000
           END-EXEC.                                                    04460000
                                                                        04470000
           EVALUATE SQLCODE                                             04480000
                WHEN +0                                                 04490000
                     SET ACAT04IO-VOPTN-FOUND   TO TRUE                 04500000
                     MOVE WS-OPT-BS-CD TO ACAT04IO-OPT-BS-CD            04510000
                     MOVE WS-OPTN-CMNT-TXT TO ACAT04IO-OPTN-CMNT-TXT    04520000
                WHEN +100                                               04530000
                     SET ACAT04IO-VOPTN-NOT-FOUND TO TRUE               04540000
                     MOVE ' OPTION INFO NOT FOUND (VOPTN)'              04550000
                        TO WS-RETURN-MSG                                04560000
                WHEN OTHER                                              04570000
                     MOVE SPACE TO ACAT04IO-VOPTN-SW                    04580000
                     PERFORM 9000-WRITE-TO-CICS-LOG                     04590000
                     PERFORM 9500-RETURN-DB2-ERROR                      04600000
           END-EVALUATE.                                                04610000
                                                                        04620000
       0300-EXIT.                                                       04630000
           EXIT.                                                        04640000
      /                                                                 04650000
DJ0002*---------------------------------------------------------------- 04660000
DJ0002 0400-GET-VINITAST.                                               04670000
DJ0002*---------------------------------------------------------------- 04680000
DJ0002*****IF MUTUAL FUND, CHECK IF ASSET IS ON INIT TABLE *******      04690000
ET0002*----IF MUTUAL FUND OR ANNUITY, CHECK IF ASSET IS ON INIT TABLE   04700000
DJ0002*----IF FOUND ON INIT TABLE, RETURN THE TRANSACTION TYPE CODE     04710000
DJ0002*----THE TRANSACTION TYPE CODE SHOULD ONLY BE 'D' FOR DELETE.     04720000
DJ0002                                                                  04730000
DJ0002     EXEC SQL                                                     04740000
DJ0002          SELECT TRANS_TYPE_CD                                    04750000
ET0001                ,NSCC_PEND_CD                                     04760000
ET0003            INTO :DCLACTIAST.TRANS-TYPE-CD                        04770000
ET0003                ,:DCLACTIAST.NSCC-PEND-CD                         04780000
ET0003            FROM  ACTIAST                                         04790000
DJ0002           WHERE  CLIENT_NBR       = :SV-CLIENT-NBR               04800000
DJ0002             AND  ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR            04810000
DJ0002             AND  ASSET_SEQ_NBR    = :SV-ASSET-SEQ-NBR            04820000
DJ0002        END-EXEC.                                                 04830000
DJ0002                                                                  04840000
DJ0002     EVALUATE SQLCODE                                             04850000
DJ0002         WHEN +0                                                  04860000
ET0003              MOVE TRANS-TYPE-CD OF DCLACTIAST                    04870000
DJ0002                                 TO ACAT04IO-VINITAST-TRANS-TYPE  04880000
DJ0002         WHEN +100                                                04890000
DJ0002              SET ACAT04IO-VINITAST-NOT-FOUND TO TRUE             04900000
DJ0002              MOVE ' '           TO ACAT04IO-VINITAST-TRANS-TYPE  04910000
DJ0002         WHEN OTHER                                               04920000
DJ0002              MOVE SPACE TO ACAT04IO-VINITAST-SW                  04930000
DJ0002              PERFORM 9000-WRITE-TO-CICS-LOG                      04940000
DJ0002              PERFORM 9500-RETURN-DB2-ERROR                       04950000
DJ0002     END-EVALUATE.                                                04960000
DJ0002                                                                  04970000
DJ0002 0400-EXIT.                                                       04980000
DJ0002     EXIT.                                                        04990000
DJ0002/                                                                 05000000
DJ0002*---------------------------------------------------------------- 05010000
DJ0002 0410-PROCESS-MF-DELETES.                                         05020000
DJ0002*---------------------------------------------------------------- 05030000
DJ0002*----IF ACAT04IO-VINITAST-TRANS-TYPE = ' '                        05040000
ET0003*----   DELETE ROW FROM ACTIAST.                                  05050000
DJ0002*----IF ACAT04IO-VINITAST-TRANS-TYPE = 'D'                        05060000
DJ0002*----   CREATE A VINITAST-RECORD TO SEND TO SIAC TO DELETE ASSET. 05070000
DJ0002                                                                  05080000
DJ0002     IF  ACAT04IO-DLTE-VINITAST                                   05090000
DJ0002         PERFORM 0420-REMOVE-MF-DELETE                            05100000
DJ0002     ELSE                                                         05110000
DJ0002         IF  ACAT04IO-ISRT-VINITAST                               05120000
DJ0002             PERFORM 0430-CREATE-MF-DELETE                        05130000
DJ0002         END-IF                                                   05140000
DJ0002     END-IF.                                                      05150000
DJ0002                                                                  05160000
DJ0002 0410-EXIT.                                                       05170000
DJ0002     EXIT.                                                        05180000
DJ0002                                                                  05190000
DJ0002*---------------------------------------------------------------- 05200000
DJ0002 0420-REMOVE-MF-DELETE.                                           05210000
DJ0002*---------------------------------------------------------------- 05220000
DJ0002                                                                  05230000
DJ0002     PERFORM 0440-DELETE-VINITAST                                 05240000
DJ0002     EXEC CICS RETURN END-EXEC.                                   05250000
DJ0002                                                                  05260000
DJ0002 0420-EXIT.                                                       05270000
DJ0002     EXIT.                                                        05280000
DJ0002                                                                  05290000
DJ0002*---------------------------------------------------------------- 05300000
DJ0002 0430-CREATE-MF-DELETE.                                           05310000
DJ0002*---------------------------------------------------------------- 05320000
ET0001     PERFORM 0432-UPDATE-AUTO-DELETE-ASSETS                       05330000
ET0001        THRU 0432-EXIT.                                           05340000
ET0001                                                                  05350000
ET0003**   INITIALIZE DCLVINITAST.                                      05360000
ET0003     INITIALIZE DCLACTIAST.                                       05370000
DJ0002     PERFORM 0440-DELETE-VINITAST                                 05380000
DJ0002     PERFORM 0450-GET-VASSET                                      05390000
DJ0002     PERFORM 0460-MOVE-FROM-VASSET                                05400000
DJ0002                                                                  05410000
DJ0002     MOVE ACAT04IO-ACCT-DLVR-NBR                                  05420000
ET0003                             TO ACCT-DLVR-NBR      OF DCLACTIAST  05430000
DJ0002     MOVE ACAT04IO-ACCT-RCV-NBR                                   05440000
ET0003                             TO ACCT-RCV-NBR       OF DCLACTIAST  05450000
DJ0002     MOVE ACAT04IO-RCV-NBR                                        05460000
ET0003                             TO RCV-NBR            OF DCLACTIAST  05470000
ET0003                                SBMTG-PRTCP-NBR    OF DCLACTIAST  05480000
DJ0002     MOVE ACAT04IO-DLVR-NBR                                       05490000
ET0003                             TO DLVR-NBR           OF DCLACTIAST  05500000
DJ0002                                                                  05510000
ET0003     MOVE 'D'                TO TRANS-TYPE-CD      OF DCLACTIAST  05520000
ET0003     MOVE 'ACAT04DC'         TO PRGM-NM            OF DCLACTIAST  05530000
ET0003     MOVE EIBTRMID           TO CICS-TERM-ID-CD    OF DCLACTIAST  05540000
DJ0002                                                                  05550000
DJ0002     EXEC SQL SET :WS-TIMESTAMP = CURRENT TIMESTAMP END-EXEC      05560000
DJ0002                                                                  05570000
ET0003     MOVE WS-TIMESTAMP       TO UPDT-TMSTP         OF DCLACTIAST  05580000
ET0003                                CRT-TMSTP          OF DCLACTIAST  05590000
ET0005                                                                  05600000
ET0005     MOVE ACAT04IO-SIGN-ON-ID  TO CICS-SGNON-ID OF DCLACTIAST.    05610000
ET0005     MOVE ACAT04IO-USER-NAME   TO TPSCRT-USR-NM OF DCLACTIAST.    05620000
ET0005     MOVE ACAT04IO-USER-ID     TO TPSCRT-USR-ID OF DCLACTIAST.    05630000
ET0005     MOVE ACAT04IO-NET-NAME    TO CICS-NET-NM   OF DCLACTIAST.    05640000
DJ0002                                                                  05650000
DJ0002     PERFORM 0470-INSERT-VINITAST                                 05660000
DJ0002     EXEC CICS RETURN END-EXEC.                                   05670000
DJ0002                                                                  05680000
DJ0002 0430-EXIT.                                                       05690000
DJ0002     EXIT.                                                        05700000
DJ0002/                                                                 05710000
ET0001*                                                                 05720000
ET0001*---------------------------------------------------------------* 05730000
ET0001* FIND OTHER ASSETS IN INIT ASSET TBL WHERE NSCC_PEND_CD = 'H'. * 05740000
ET0001*                                                               * 05750000
ET0001* NSCC_PEND_CD = 'H' MEANS THAT ASSET WILL BE HELD UNTIL NEXT   * 05760000
ET0001* CYCLE 1 THEN AUTOMATICALLY DELETED AT CYCLE 1.                * 05770000
ET0001* BATCH PROGRAM CREATES MUTUAL FUND AUTMATIC DELETE RECORDS     * 05780000
ET0001* WITH 'H' IN PEND CODE FIELD WHEN CERTAIN CONDITIONS ARE MET.  * 05790000
ET0001*                                                               * 05800000
ET0001* IF USER ENTERS 'D' TO ACTION CODE, MOVE SPACE TO NSCC_PEND_CD * 05810000
ET0001* TO DELETE AN ASSET AT NEXT CYCLE.  IF OTHER ASSETS ARE FOUND  * 05820000
ET0001* WHERE NSCC_PEND_CD = 'H', THEN OVERRIDE THE FIELD WITH SPACE  * 05830000
ET0001* TO BE ALSO DELETED AT NEXT CYCLE, NOT TO BE HELD TIL CYCLE 1. * 05840000
ET0001*---------------------------------------------------------------* 05850000
ET0001 0432-UPDATE-AUTO-DELETE-ASSETS.                                  05860000
           MOVE +0 TO WS-ROW-COUNT.                                     05870000
           EXEC SQL                                                     05880000
               SELECT                                                   05890000
                    COUNT(*)                                            05900000
                 INTO                                                   05910000
                    :WS-ROW-COUNT                                       05920000
                 FROM                                                   05930000
ET0003              ACTIAST                                             05940000
                WHERE                                                   05950000
                    CLIENT_NBR = :SV-CLIENT-NBR                         05960000
                    AND  ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR           05970000
                    AND  NSCC_PEND_CD = 'H'                             05980000
                    AND  TRANS_TYPE_CD = 'D'                            05990000
           END-EXEC.                                                    06000000
                                                                        06010000
           IF WS-ROW-COUNT > 0                                          06020000
               MOVE EIBTRMID  TO WS-CICS-TERMID                         06030000
                                                                        06040000
               EXEC SQL                                                 06050000
ET0003           UPDATE ACTIAST                                         06060000
                    SET                                                 06070000
                      NSCC_PEND_CD = ' '                                06080000
                     ,PRGM_NM = 'ACAT04DC'                              06090000
                     ,CICS_TERM_ID_CD = :WS-CICS-TERMID                 06100000
                     ,UPDT_TMSTP = :WS-TIMESTAMP                        06110000
ET0005               ,CICS_SGNON_ID = :ACAT04IO-SIGN-ON-ID              06120000
ET0005               ,TPSCRT_USR_NM = :ACAT04IO-USER-NAME               06130000
ET0005               ,TPSCRT_USR_ID = :ACAT04IO-USER-ID                 06140000
ET0005               ,CICS_NET_NM = :ACAT04IO-NET-NAME                  06150000
LRM007               ,NSCC_ACK_IND      =  ' '                          06160000
                  WHERE                                                 06170000
                     CLIENT_NBR = :SV-CLIENT-NBR                        06180000
                     AND  ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR          06190000
                     AND  NSCC_PEND_CD = 'H'                            06200000
                     AND  TRANS_TYPE_CD = 'D'                           06210000
               END-EXEC                                                 06220000
                                                                        06230000
               IF SQLCODE = 0                                           06240000
                  CONTINUE                                              06250000
               ELSE                                                     06260000
                  MOVE SPACE TO ACAT04IO-VINITAST-SW                    06270000
                  PERFORM 9000-WRITE-TO-CICS-LOG                        06280000
                  PERFORM 9500-RETURN-DB2-ERROR                         06290000
               END-IF                                                   06300000
           END-IF.                                                      06310000
                                                                        06320000
ET0001 0432-EXIT.     EXIT.                                             06330000
ET0001/                                                                 06340000
DJ0002*---------------------------------------------------------------- 06350000
DJ0002 0440-DELETE-VINITAST.                                            06360000
DJ0002*---------------------------------------------------------------- 06370000
DJ0002                                                                  06380000
DJ0002     EXEC SQL                                                     06390000
DJ0002          DELETE                                                  06400000
ET0003          FROM ACTIAST                                            06410000
DJ0002           WHERE  CLIENT_NBR       = :SV-CLIENT-NBR               06420000
DJ0002             AND  ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR            06430000
DJ0002             AND  ASSET_SEQ_NBR    = :SV-ASSET-SEQ-NBR            06440000
DJ0002        END-EXEC.                                                 06450000
DJ0002                                                                  06460000
DJ0002     EVALUATE SQLCODE                                             06470000
DJ0002          WHEN +0                                                 06480000
DJ0002               SET ACAT04IO-VINITAST-DELETED TO TRUE              06490000
DJ0002          WHEN +100                                               06500000
DJ0002               SET ACAT04IO-VINITAST-NOT-FOUND TO TRUE            06510000
DJ0002          WHEN OTHER                                              06520000
DJ0002               MOVE SPACE TO ACAT04IO-VINITAST-SW                 06530000
DJ0002               PERFORM 9000-WRITE-TO-CICS-LOG                     06540000
DJ0002               PERFORM 9500-RETURN-DB2-ERROR                      06550000
DJ0002     END-EVALUATE.                                                06560000
DJ0002                                                                  06570000
DJ0002 0440-EXIT.                                                       06580000
DJ0002     EXIT.                                                        06590000
DJ0002/                                                                 06600000
DJ0002 0450-GET-VASSET.                                                 06610000
DJ0002                                                                  06620000
DJ0002     EXEC SQL                                                     06630000
DJ0002          SELECT                                                  06640000
DJ0002                 CLIENT_NBR                                       06650000
DJ0002               , ACAT_CONTROL_NBR                                 06660000
DJ0002               , ASSET_SEQ_NBR                                    06670000
DJ0002               , CONTROL_NBR_STS_CD                               06680000
DJ0002               , DLVR_NBR_STTS_CD                                 06690000
DJ0002               , RCV_NBR_STTS_CD                                  06700000
DJ0002               , SBMTG_PRTCP_NBR                                  06710000
DJ0002               , SBMT_PRT_NR_STS_CD                               06720000
DJ0002               , AST_SEQ_NBR_STS_CD                               06730000
DJ0002               , SYS_ACT_CD                                       06740000
DJ0002               , SYS_RJCT_RSN_CD                                  06750000
DJ0002               , TRANS_TYPE_CD                                    06760000
DJ0002               , TRANS_TYPE_STTS_CD                               06770000
DJ0002               , PHSCL_SEQ_NBR                                    06780000
DJ0002               , PHSCL_SEQ_STTS_CD                                06790000
DJ0002               , LGCL_SEQ_NBR                                     06800000
DJ0002               , LGCL_SEQ_NR_STS_CD                               06810000
DJ0002               , ASSET_PRC_CTGY_CD                                06820000
DJ0002               , AST_PRC_CTG_STS_CD                               06830000
DJ0002               , STTLM_LCTN_CD                                    06840000
DJ0002               , STTLM_LCTN_STTS_CD                               06850000
DJ0002               , STTLM_RSN_CD                                     06860000
DJ0002               , STTLM_RSN_STTS_CD                                06870000
DJ0002               , ISIN_CNTRY_CD                                    06880000
DJ0002               , ISIN_CNTRY_STTS_CD                               06890000
DJ0002               , ISIN_SEC_ISSUE_CD                                06900000
DJ0002               , ISIN_SEC_IS_STS_CD                               06910000
DJ0002               , ISIN_SEC_CDG_CD                                  06920000
DJ0002               , ISIN_SEC_CD_STS_CD                               06930000
DJ0002               , ASSET_DESC_TXT                                   06940000
DJ0002               , ASSET_DESC_STTS_CD                               06950000
DJ0002               , ASSET_RQST_QTY_CD                                06960000
DJ0002               , ASSET_RQST_STS_CD                                06970000
DJ0002               , AST_RQST_TRANS_CD                                06980000
DJ0002               , AST_RQ_TRAN_STS_CD                               06990000
DJ0002               , ASSET_QTY                                        07000000
DJ0002               , ASSET_QTY_STTS_CD                                07010000
DJ0002               , ASSET_PCT                                        07020000
DJ0002               , ASSET_PCT_STTS_CD                                07030000
DJ0002               , PSTN_CD                                          07040000
DJ0002               , PSTN_CD_STTS_CD                                  07050000
DJ0002               , ISO_CRNCY_CD                                     07060000
DJ0002               , ISO_CRNCY_STTS_CD                                07070000
DJ0002               , ASSET_AMT                                        07080000
DJ0002               , ASSET_AMT_STTS_CD                                07090000
DJ0002               , BEARER_BOND_CD                                   07100000
DJ0002               , BEARER_BND_STTS_CD                               07110000
DJ0002               , CSH_MGN_SHRT_CD                                  07120000
DJ0002               , CSH_MRG_SHT_STS_CD                               07130000
DJ0002               , WHI_CD                                           07140000
DJ0002               , WHI_STTS_CD                                      07150000
DJ0002               , TRNFR_TYPE_RSN_CD                                07160000
DJ0002               , TRN_TYP_RSN_STS_CD                               07170000
DJ0002               , MBS_SERIAL_NBR                                   07180000
DJ0002               , MBS_SERIAL_STTS_CD                               07190000
DJ0002               , ASSET_CMNT_TXT                                   07200000
DJ0002               , ASSET_CMNT_STTS_CD                               07210000
DJ0002               , NSCC_ACK_IND                                     07220000
DJ0002               , NSCC_PEND_CD                                     07230000
DJ0002               , FAIL_SENT_CAGE_IND                               07240000
DJ0002               , FAIL_OPEN_CAGE_IND                               07250000
DJ0002               , NSCC_NON_ADP_IND                                 07260000
DJ0002               , TRANS_RFRN_ID_CD                                 07270000
DJ0002               , TRANS_RFRN_STTS_CD                               07280000
DJ0002               , OPTN_CTGY_CD                                     07290000
DJ0002               , OPTN_CTGY_STTS_CD                                07300000
DJ0002               , RCRD_LNGTH_STTS_CD                               07310000
DJ0002               , RCRD_STTS_CD                                     07320000
DJ0002               , ISIN_SEC_EXCPT_IND                               07330000
DJ0002               , CRT_TMSTP                                        07340000
DJ0002               , UPDT_TMSTP                                       07350000
DJ0002               , CICS_TERM_ID_CD                                  07360000
DJ0002               , PRGM_NM                                          07370000
DJ0002               , SECURITY_ADP_NBR                                 07380000
DJ0002               , RCL_SENT_NSCC_IND                                07390000
DJ0002               , FRV_SENT_NSCC_IND                                07400000
DJ0002               , TRNFR_TYPE_CD                                    07410000
DJ0002           INTO                                                   07420000
DJ0002                :DCLVASSET.CLIENT-NBR                             07430000
DJ0002               ,:DCLVASSET.ACAT-CONTROL-NBR                       07440000
DJ0002               ,:DCLVASSET.ASSET-SEQ-NBR                          07450000
DJ0002               ,:DCLVASSET.CONTROL-NBR-STS-CD                     07460000
DJ0002               ,:DCLVASSET.DLVR-NBR-STTS-CD                       07470000
DJ0002               ,:DCLVASSET.RCV-NBR-STTS-CD                        07480000
DJ0002               ,:DCLVASSET.SBMTG-PRTCP-NBR                        07490000
DJ0002               ,:DCLVASSET.SBMT-PRT-NR-STS-CD                     07500000
DJ0002               ,:DCLVASSET.AST-SEQ-NBR-STS-CD                     07510000
DJ0002               ,:DCLVASSET.SYS-ACT-CD                             07520000
DJ0002               ,:DCLVASSET.SYS-RJCT-RSN-CD                        07530000
DJ0002               ,:DCLVASSET.TRANS-TYPE-CD                          07540000
DJ0002               ,:DCLVASSET.TRANS-TYPE-STTS-CD                     07550000
DJ0002               ,:DCLVASSET.PHSCL-SEQ-NBR                          07560000
DJ0002               ,:DCLVASSET.PHSCL-SEQ-STTS-CD                      07570000
DJ0002               ,:DCLVASSET.LGCL-SEQ-NBR                           07580000
DJ0002               ,:DCLVASSET.LGCL-SEQ-NR-STS-CD                     07590000
DJ0002               ,:DCLVASSET.ASSET-PRC-CTGY-CD                      07600000
DJ0002               ,:DCLVASSET.AST-PRC-CTG-STS-CD                     07610000
DJ0002               ,:DCLVASSET.STTLM-LCTN-CD                          07620000
DJ0002               ,:DCLVASSET.STTLM-LCTN-STTS-CD                     07630000
DJ0002               ,:DCLVASSET.STTLM-RSN-CD                           07640000
DJ0002               ,:DCLVASSET.STTLM-RSN-STTS-CD                      07650000
DJ0002               ,:DCLVASSET.ISIN-CNTRY-CD                          07660000
DJ0002               ,:DCLVASSET.ISIN-CNTRY-STTS-CD                     07670000
DJ0002               ,:DCLVASSET.ISIN-SEC-ISSUE-CD                      07680000
DJ0002               ,:DCLVASSET.ISIN-SEC-IS-STS-CD                     07690000
DJ0002               ,:DCLVASSET.ISIN-SEC-CDG-CD                        07700000
DJ0002               ,:DCLVASSET.ISIN-SEC-CD-STS-CD                     07710000
DJ0002               ,:DCLVASSET.ASSET-DESC-TXT                         07720000
DJ0002               ,:DCLVASSET.ASSET-DESC-STTS-CD                     07730000
DJ0002               ,:DCLVASSET.ASSET-RQST-QTY-CD                      07740000
DJ0002               ,:DCLVASSET.ASSET-RQST-STS-CD                      07750000
DJ0002               ,:DCLVASSET.AST-RQST-TRANS-CD                      07760000
DJ0002               ,:DCLVASSET.AST-RQ-TRAN-STS-CD                     07770000
DJ0002               ,:DCLVASSET.ASSET-QTY                              07780000
DJ0002               ,:DCLVASSET.ASSET-QTY-STTS-CD                      07790000
DJ0002               ,:DCLVASSET.ASSET-PCT                              07800000
DJ0002               ,:DCLVASSET.ASSET-PCT-STTS-CD                      07810000
DJ0002               ,:DCLVASSET.PSTN-CD                                07820000
DJ0002               ,:DCLVASSET.PSTN-CD-STTS-CD                        07830000
DJ0002               ,:DCLVASSET.ISO-CRNCY-CD                           07840000
DJ0002               ,:DCLVASSET.ISO-CRNCY-STTS-CD                      07850000
DJ0002               ,:DCLVASSET.ASSET-AMT                              07860000
DJ0002               ,:DCLVASSET.ASSET-AMT-STTS-CD                      07870000
DJ0002               ,:DCLVASSET.BEARER-BOND-CD                         07880000
DJ0002               ,:DCLVASSET.BEARER-BND-STTS-CD                     07890000
DJ0002               ,:DCLVASSET.CSH-MGN-SHRT-CD                        07900000
DJ0002               ,:DCLVASSET.CSH-MRG-SHT-STS-CD                     07910000
DJ0002               ,:DCLVASSET.WHI-CD                                 07920000
DJ0002               ,:DCLVASSET.WHI-STTS-CD                            07930000
DJ0002               ,:DCLVASSET.TRNFR-TYPE-RSN-CD                      07940000
DJ0002               ,:DCLVASSET.TRN-TYP-RSN-STS-CD                     07950000
DJ0002               ,:DCLVASSET.MBS-SERIAL-NBR                         07960000
DJ0002               ,:DCLVASSET.MBS-SERIAL-STTS-CD                     07970000
DJ0002               ,:DCLVASSET.ASSET-CMNT-TXT                         07980000
DJ0002               ,:DCLVASSET.ASSET-CMNT-STTS-CD                     07990000
DJ0002               ,:DCLVASSET.NSCC-ACK-IND                           08000000
DJ0002               ,:DCLVASSET.NSCC-PEND-CD                           08010000
DJ0002               ,:DCLVASSET.FAIL-SENT-CAGE-IND                     08020000
DJ0002               ,:DCLVASSET.FAIL-OPEN-CAGE-IND                     08030000
DJ0002               ,:DCLVASSET.NSCC-NON-ADP-IND                       08040000
DJ0002               ,:DCLVASSET.TRANS-RFRN-ID-CD                       08050000
DJ0002               ,:DCLVASSET.TRANS-RFRN-STTS-CD                     08060000
DJ0002               ,:DCLVASSET.OPTN-CTGY-CD                           08070000
DJ0002               ,:DCLVASSET.OPTN-CTGY-STTS-CD                      08080000
DJ0002               ,:DCLVASSET.RCRD-LNGTH-STTS-CD                     08090000
DJ0002               ,:DCLVASSET.RCRD-STTS-CD                           08100000
DJ0002               ,:DCLVASSET.ISIN-SEC-EXCPT-IND                     08110000
DJ0002               ,:DCLVASSET.CRT-TMSTP                              08120000
DJ0002               ,:DCLVASSET.UPDT-TMSTP                             08130000
DJ0002               ,:DCLVASSET.CICS-TERM-ID-CD                        08140000
DJ0002               ,:DCLVASSET.PRGM-NM                                08150000
DJ0002               ,:DCLVASSET.SECURITY-ADP-NBR                       08160000
DJ0002               ,:DCLVASSET.RCL-SENT-NSCC-IND                      08170000
DJ0002               ,:DCLVASSET.FRV-SENT-NSCC-IND                      08180000
DJ0002               ,:DCLVASSET.TRNFR-TYPE-CD                          08190000
DJ0002               FROM VASSET                                        08200000
DJ0002             WHERE (CLIENT_NBR       = :SV-CLIENT-NBR)            08210000
DJ0002              AND  (ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR)         08220000
DJ0002              AND  (ASSET_SEQ_NBR    = :SV-ASSET-SEQ-NBR)         08230000
DJ0002      END-EXEC.                                                   08240000
DJ0002                                                                  08250000
DJ0002      EVALUATE SQLCODE                                            08260000
DJ0002          WHEN +0                                                 08270000
DJ0002               SET ACAT04IO-VASSET-FOUND TO TRUE                  08280000
DJ0002          WHEN +100                                               08290000
DJ0002               SET ACAT04IO-VASSET-NOT-FOUND TO TRUE              08300000
DJ0002          WHEN OTHER                                              08310000
DJ0002               PERFORM 9000-WRITE-TO-CICS-LOG                     08320000
DJ0002               PERFORM 9500-RETURN-DB2-ERROR                      08330000
DJ0002      END-EVALUATE.                                               08340000
DJ0002                                                                  08350000
DJ0002 0450-EXIT.                                                       08360000
DJ0002     EXIT.                                                        08370000
DJ0002/                                                                 08380000
DJ0002 0460-MOVE-FROM-VASSET.                                           08390000
DJ0002                                                                  08400000
DJ0002     MOVE CLIENT-NBR        OF DCLVASSET                          08410000
ET0003                            TO CLIENT-NBR        OF DCLACTIAST    08420000
DJ0002     MOVE ACAT-CONTROL-NBR  OF DCLVASSET                          08430000
ET0003                            TO ACAT-CONTROL-NBR  OF DCLACTIAST    08440000
DJ0002     MOVE ASSET-SEQ-NBR     OF DCLVASSET                          08450000
ET0003                            TO ASSET-SEQ-NBR     OF DCLACTIAST    08460000
DJ0002     MOVE SBMTG-PRTCP-NBR   OF DCLVASSET                          08470000
ET0003                            TO SBMTG-PRTCP-NBR   OF DCLACTIAST    08480000
DJ0002     MOVE ASSET-PRC-CTGY-CD OF DCLVASSET                          08490000
ET0003                            TO ASSET-PRC-CTGY-CD OF DCLACTIAST    08500000
DJ0002     MOVE STTLM-LCTN-CD     OF DCLVASSET                          08510000
ET0003                            TO STTLM-LCTN-CD     OF DCLACTIAST    08520000
DJ0002     MOVE STTLM-RSN-CD      OF DCLVASSET                          08530000
ET0003                            TO STTLM-RSN-CD      OF DCLACTIAST    08540000
DJ0002     MOVE ISIN-CNTRY-CD     OF DCLVASSET                          08550000
ET0003                            TO ISIN-CNTRY-CD     OF DCLACTIAST    08560000
DJ0002     MOVE ISIN-SEC-ISSUE-CD OF DCLVASSET                          08570000
ET0003                            TO ISIN-SEC-ISSUE-CD OF DCLACTIAST    08580000
DJ0002     MOVE ISIN-SEC-CDG-CD   OF DCLVASSET                          08590000
ET0003                            TO ISIN-SEC-CDG-CD   OF DCLACTIAST    08600000
DJ0002     MOVE ASSET-DESC-TXT    OF DCLVASSET                          08610000
ET0003                            TO ASSET-DESC-TXT    OF DCLACTIAST    08620000
DJ0002     MOVE ASSET-RQST-QTY-CD OF DCLVASSET                          08630000
ET0003                            TO ASSET-RQST-QTY-CD OF DCLACTIAST    08640000
DJ0002     MOVE AST-RQST-TRANS-CD OF DCLVASSET                          08650000
ET0003                            TO AST-RQST-TRANS-CD OF DCLACTIAST    08660000
DJ0002     MOVE ASSET-QTY         OF DCLVASSET                          08670000
ET0003                            TO ASSET-QTY         OF DCLACTIAST    08680000
DJ0002     MOVE ASSET-PCT         OF DCLVASSET                          08690000
ET0003                            TO ASSET-PCT         OF DCLACTIAST    08700000
DJ0002     MOVE PSTN-CD           OF DCLVASSET                          08710000
ET0003                            TO PSTN-CD           OF DCLACTIAST    08720000
DJ0002     MOVE ISO-CRNCY-CD      OF DCLVASSET                          08730000
ET0003                            TO ISO-CRNCY-CD      OF DCLACTIAST    08740000
DJ0002     MOVE ASSET-AMT         OF DCLVASSET                          08750000
ET0003                            TO ASSET-AMT         OF DCLACTIAST    08760000
DJ0002     MOVE BEARER-BOND-CD    OF DCLVASSET                          08770000
ET0003                            TO BEARER-BOND-CD    OF DCLACTIAST    08780000
DJ0002     MOVE CSH-MGN-SHRT-CD   OF DCLVASSET                          08790000
ET0003                            TO CSH-MGN-SHRT-CD   OF DCLACTIAST    08800000
DJ0002     MOVE WHI-CD            OF DCLVASSET                          08810000
ET0003                            TO WHI-CD            OF DCLACTIAST    08820000
DJ0002     MOVE TRNFR-TYPE-RSN-CD OF DCLVASSET                          08830000
ET0003                            TO TRNFR-TYPE-RSN-CD OF DCLACTIAST    08840000
DJ0002     MOVE MBS-SERIAL-NBR    OF DCLVASSET                          08850000
ET0003                            TO MBS-SERIAL-NBR    OF DCLACTIAST    08860000
DJ0002     MOVE ASSET-CMNT-TXT    OF DCLVASSET                          08870000
ET0003                            TO ASSET-CMNT-TXT    OF DCLACTIAST    08880000
DJ0002     MOVE NSCC-ACK-IND      OF DCLVASSET                          08890000
ET0003                            TO NSCC-ACK-IND      OF DCLACTIAST    08900000
DJ0002     MOVE NSCC-PEND-CD      OF DCLVASSET                          08910000
ET0003                            TO NSCC-PEND-CD      OF DCLACTIAST    08920000
DJ0002     MOVE TRANS-RFRN-ID-CD  OF DCLVASSET                          08930000
ET0003                            TO TRANS-RFRN-ID-CD  OF DCLACTIAST    08940000
DJ0002     MOVE OPTN-CTGY-CD      OF DCLVASSET                          08950000
ET0003                            TO OPTN-CTGY-CD      OF DCLACTIAST    08960000
DJ0002     MOVE SECURITY-ADP-NBR  OF DCLVASSET                          08970000
ET0003                            TO SECURITY-ADP-NBR  OF DCLACTIAST    08980000
DJ0002     MOVE TRNFR-TYPE-CD     OF DCLVASSET                          08990000
ET0003                            TO TRNFR-TYPE-CD     OF DCLACTIAST.   09000000
DJ0002                                                                  09010000
DJ0002 0460-EXIT.                                                       09020000
DJ0002     EXIT.                                                        09030000
DJ0002/                                                                 09040000
DJ0002 0470-INSERT-VINITAST.                                            09050000
DJ0002                                                                  09060000
DJ0002     EXEC SQL                                                     09070000
ET0003          INSERT INTO ACTIAST                                     09080000
DJ0002          ( CLIENT_NBR                                            09090000
DJ0002          , DLVR_NBR                                              09100000
DJ0002          , ACCT_DLVR_NBR                                         09110000
DJ0002          , RCV_NBR                                               09120000
DJ0002          , ACCT_RCV_NBR                                          09130000
DJ0002          , ISIN_CNTRY_CD                                         09140000
DJ0002          , ISIN_SEC_ISSUE_CD                                     09150000
DJ0002          , ISIN_SEC_CDG_CD                                       09160000
DJ0002          , STTLM_LCTN_CD                                         09170000
DJ0002          , CSH_MGN_SHRT_CD                                       09180000
DJ0002          , CSH_MRG_SHT_STS_CD                                    09190000
DJ0002          , STTLM_LCTN_STTS_CD                                    09200000
DJ0002          , ISIN_CNTRY_STTS_CD                                    09210000
DJ0002          , SBMTG_PRTCP_NBR                                       09220000
DJ0002          , SBMT_PRT_NR_STS_CD                                    09230000
DJ0002          , ACAT_CONTROL_NBR                                      09240000
DJ0002          , CONTROL_NBR_STS_CD                                    09250000
DJ0002          , ASSET_SEQ_NBR                                         09260000
DJ0002          , AST_SEQ_NBR_STS_CD                                    09270000
DJ0002          , TRANS_TYPE_CD                                         09280000
DJ0002          , TRANS_TYPE_STTS_CD                                    09290000
DJ0002          , PHSCL_SEQ_NBR                                         09300000
DJ0002          , PHSCL_SEQ_STTS_CD                                     09310000
DJ0002          , LGCL_SEQ_NBR                                          09320000
DJ0002          , LGCL_SEQ_NR_STS_CD                                    09330000
DJ0002          , ASSET_PRC_CTGY_CD                                     09340000
DJ0002          , AST_PRC_CTG_STS_CD                                    09350000
DJ0002          , STTLM_RSN_CD                                          09360000
DJ0002          , STTLM_RSN_STTS_CD                                     09370000
DJ0002          , ASSET_DESC_TXT                                        09380000
DJ0002          , ASSET_DESC_STTS_CD                                    09390000
DJ0002          , ASSET_RQST_QTY_CD                                     09400000
DJ0002          , ASSET_RQST_STS_CD                                     09410000
DJ0002          , AST_RQST_TRANS_CD                                     09420000
DJ0002          , AST_RQ_TRAN_STS_CD                                    09430000
DJ0002          , ASSET_QTY                                             09440000
DJ0002          , ASSET_QTY_STTS_CD                                     09450000
DJ0002          , ASSET_PCT                                             09460000
DJ0002          , ASSET_PCT_STTS_CD                                     09470000
DJ0002          , PSTN_CD                                               09480000
DJ0002          , PSTN_CD_STTS_CD                                       09490000
DJ0002          , ISO_CRNCY_CD                                          09500000
DJ0002          , ISO_CRNCY_STTS_CD                                     09510000
DJ0002          , ASSET_AMT                                             09520000
DJ0002          , ASSET_AMT_STTS_CD                                     09530000
DJ0002          , BEARER_BOND_CD                                        09540000
DJ0002          , BEARER_BND_STTS_CD                                    09550000
DJ0002          , WHI_CD                                                09560000
DJ0002          , WHI_STTS_CD                                           09570000
DJ0002          , TRNFR_TYPE_RSN_CD                                     09580000
DJ0002          , TRN_TYP_RSN_STS_CD                                    09590000
DJ0002          , MBS_SERIAL_NBR                                        09600000
DJ0002          , MBS_SERIAL_STTS_CD                                    09610000
DJ0002          , ASSET_CMNT_TXT                                        09620000
DJ0002          , ASSET_CMNT_STTS_CD                                    09630000
DJ0002          , NSCC_WTHLD_CD                                         09640000
DJ0002          , TRANS_RFRN_ID_CD                                      09650000
DJ0002          , TRANS_RFRN_STTS_CD                                    09660000
DJ0002          , ISIN_SEC_IS_STS_CD                                    09670000
DJ0002          , ISIN_SEC_CD_STS_CD                                    09680000
DJ0002          , OPTN_CTGY_CD                                          09690000
DJ0002          , OPTN_CTGY_STTS_CD                                     09700000
DJ0002          , RCRD_LNGTH_STTS_CD                                    09710000
DJ0002          , RCRD_STTS_CD                                          09720000
DJ0002          , NSCC_PEND_CD                                          09730000
DJ0002          , NSCC_ACK_IND                                          09740000
DJ0002          , PRGM_NM                                               09750000
DJ0002          , CICS_TERM_ID_CD                                       09760000
DJ0002          , UPDT_TMSTP                                            09770000
DJ0002          , CRT_TMSTP                                             09780000
DJ0002          , SECURITY_ADP_NBR                                      09790000
DJ0002          , TRNFR_TYPE_CD                                         09800000
DJ0002          , TRNFR_TYPE_STTS_CD                                    09810000
DJ0002          , RCV_NBR_STTS_CD                                       09820000
DJ0002          , DLVR_NBR_STTS_CD                                      09830000
ET0005          , CICS_SGNON_ID                                         09840000
ET0005          , TPSCRT_USR_NM                                         09850000
ET0005          , TPSCRT_USR_ID                                         09860000
ET0005          , CICS_NET_NM                                           09870000
ET0005            )                                                     09880000
DJ0002            VALUES                                                09890000
ET0003          (: DCLACTIAST.CLIENT-NBR                                09900000
ET0003          ,: DCLACTIAST.DLVR-NBR                                  09910000
ET0003          ,: DCLACTIAST.ACCT-DLVR-NBR                             09920000
ET0003          ,: DCLACTIAST.RCV-NBR                                   09930000
ET0003          ,: DCLACTIAST.ACCT-RCV-NBR                              09940000
ET0003          ,: DCLACTIAST.ISIN-CNTRY-CD                             09950000
ET0003          ,: DCLACTIAST.ISIN-SEC-ISSUE-CD                         09960000
ET0003          ,: DCLACTIAST.ISIN-SEC-CDG-CD                           09970000
ET0003          ,: DCLACTIAST.STTLM-LCTN-CD                             09980000
ET0003          ,: DCLACTIAST.CSH-MGN-SHRT-CD                           09990000
ET0003          ,: DCLACTIAST.CSH-MRG-SHT-STS-CD                        10000000
ET0003          ,: DCLACTIAST.STTLM-LCTN-STTS-CD                        10010000
ET0003          ,: DCLACTIAST.ISIN-CNTRY-STTS-CD                        10020000
ET0003          ,: DCLACTIAST.SBMTG-PRTCP-NBR                           10030000
ET0003          ,: DCLACTIAST.SBMT-PRT-NR-STS-CD                        10040000
ET0003          ,: DCLACTIAST.ACAT-CONTROL-NBR                          10050000
ET0003          ,: DCLACTIAST.CONTROL-NBR-STS-CD                        10060000
ET0003          ,: DCLACTIAST.ASSET-SEQ-NBR                             10070000
ET0003          ,: DCLACTIAST.AST-SEQ-NBR-STS-CD                        10080000
ET0003          ,: DCLACTIAST.TRANS-TYPE-CD                             10090000
ET0003          ,: DCLACTIAST.TRANS-TYPE-STTS-CD                        10100000
ET0003          ,: DCLACTIAST.PHSCL-SEQ-NBR                             10110000
ET0003          ,: DCLACTIAST.PHSCL-SEQ-STTS-CD                         10120000
ET0003          ,: DCLACTIAST.LGCL-SEQ-NBR                              10130000
ET0003          ,: DCLACTIAST.LGCL-SEQ-NR-STS-CD                        10140000
ET0003          ,: DCLACTIAST.ASSET-PRC-CTGY-CD                         10150000
ET0003          ,: DCLACTIAST.AST-PRC-CTG-STS-CD                        10160000
ET0003          ,: DCLACTIAST.STTLM-RSN-CD                              10170000
ET0003          ,: DCLACTIAST.STTLM-RSN-STTS-CD                         10180000
ET0003          ,: DCLACTIAST.ASSET-DESC-TXT                            10190000
ET0003          ,: DCLACTIAST.ASSET-DESC-STTS-CD                        10200000
ET0003          ,: DCLACTIAST.ASSET-RQST-QTY-CD                         10210000
ET0003          ,: DCLACTIAST.ASSET-RQST-STS-CD                         10220000
ET0003          ,: DCLACTIAST.AST-RQST-TRANS-CD                         10230000
ET0003          ,: DCLACTIAST.AST-RQ-TRAN-STS-CD                        10240000
ET0003          ,: DCLACTIAST.ASSET-QTY                                 10250000
ET0003          ,: DCLACTIAST.ASSET-QTY-STTS-CD                         10260000
ET0003          ,: DCLACTIAST.ASSET-PCT                                 10270000
ET0003          ,: DCLACTIAST.ASSET-PCT-STTS-CD                         10280000
ET0003          ,: DCLACTIAST.PSTN-CD                                   10290000
ET0003          ,: DCLACTIAST.PSTN-CD-STTS-CD                           10300000
ET0003          ,: DCLACTIAST.ISO-CRNCY-CD                              10310000
ET0003          ,: DCLACTIAST.ISO-CRNCY-STTS-CD                         10320000
ET0003          ,: DCLACTIAST.ASSET-AMT                                 10330000
ET0003          ,: DCLACTIAST.ASSET-AMT-STTS-CD                         10340000
ET0003          ,: DCLACTIAST.BEARER-BOND-CD                            10350000
ET0003          ,: DCLACTIAST.BEARER-BND-STTS-CD                        10360000
ET0003          ,: DCLACTIAST.WHI-CD                                    10370000
ET0003          ,: DCLACTIAST.WHI-STTS-CD                               10380000
ET0003          ,: DCLACTIAST.TRNFR-TYPE-RSN-CD                         10390000
ET0003          ,: DCLACTIAST.TRN-TYP-RSN-STS-CD                        10400000
ET0003          ,: DCLACTIAST.MBS-SERIAL-NBR                            10410000
ET0003          ,: DCLACTIAST.MBS-SERIAL-STTS-CD                        10420000
ET0003          ,: DCLACTIAST.ASSET-CMNT-TXT                            10430000
ET0003          ,: DCLACTIAST.ASSET-CMNT-STTS-CD                        10440000
ET0003          ,: DCLACTIAST.NSCC-WTHLD-CD                             10450000
ET0003          ,: DCLACTIAST.TRANS-RFRN-ID-CD                          10460000
ET0003          ,: DCLACTIAST.TRANS-RFRN-STTS-CD                        10470000
ET0003          ,: DCLACTIAST.ISIN-SEC-IS-STS-CD                        10480000
ET0003          ,: DCLACTIAST.ISIN-SEC-CD-STS-CD                        10490000
ET0003          ,: DCLACTIAST.OPTN-CTGY-CD                              10500000
ET0003          ,: DCLACTIAST.OPTN-CTGY-STTS-CD                         10510000
ET0003          ,: DCLACTIAST.RCRD-LNGTH-STTS-CD                        10520000
ET0003          ,: DCLACTIAST.RCRD-STTS-CD                              10530000
ET0003          ,: DCLACTIAST.NSCC-PEND-CD                              10540000
LRM008          ,' '                                                    10550000
ET0003          ,: DCLACTIAST.PRGM-NM                                   10560000
ET0003          ,: DCLACTIAST.CICS-TERM-ID-CD                           10570000
ET0003          ,: DCLACTIAST.UPDT-TMSTP                                10580000
ET0003          ,: DCLACTIAST.CRT-TMSTP                                 10590000
ET0003          ,: DCLACTIAST.SECURITY-ADP-NBR                          10600000
ET0003          ,: DCLACTIAST.TRNFR-TYPE-CD                             10610000
ET0003          ,: DCLACTIAST.TRNFR-TYPE-STTS-CD                        10620000
ET0003          ,: DCLACTIAST.RCV-NBR-STTS-CD                           10630000
ET0003          ,: DCLACTIAST.DLVR-NBR-STTS-CD                          10640000
ET0005          ,: DCLACTIAST.CICS-SGNON-ID                             10650000
ET0005          ,: DCLACTIAST.TPSCRT-USR-NM                             10660000
ET0005          ,: DCLACTIAST.TPSCRT-USR-ID                             10670000
ET0005          ,: DCLACTIAST.CICS-NET-NM                               10680000
ET0005           )                                                      10690000
DJ0002     END-EXEC.                                                    10700000
DJ0002                                                                  10710000
DJ0002     EVALUATE SQLCODE                                             10720000
DJ0002          WHEN +0                                                 10730000
DJ0002               SET ACAT04IO-VINITAST-INSERTED TO TRUE             10740000
DJ0002          WHEN -803                                               10750000
DJ0002               SET ACAT04IO-VINITAST-FOUND TO TRUE                10760000
DJ0002          WHEN OTHER                                              10770000
DJ0002               MOVE SPACES TO ACAT04IO-VINITAST-SW                10780000
DJ0002               PERFORM 9000-WRITE-TO-CICS-LOG                     10790000
DJ0002               PERFORM 9500-RETURN-DB2-ERROR                      10800000
DJ0002     END-EVALUATE.                                                10810000
DJ0002                                                                  10820000
DJ0002 0470-EXIT.                                                       10830000
DJ0002     EXIT.                                                        10840000
      /                                                                 10850000
      *---------------------------------------------------------------- 10860000
       9000-WRITE-TO-CICS-LOG.                                          10870000
      *---------------------------------------------------------------- 10880000
           IF SQLCODE = -803                                            10890000
               CONTINUE                                                 10900000
           ELSE                                                         10910000
               MOVE SPACES             TO WS-ERRL-DATA                  10920000
               SET WRITE-ERROR-TO-LOG  TO TRUE                          10930000
               MOVE EIBTRNID           TO CALLING-TRAN-ID               10940000
               MOVE 'ACAT04DC'         TO CALLING-PROGRAM-ID            10950000
               MOVE SQLCA              TO SQLCA-AREA                    10960000
               EXEC CICS LINK PROGRAM ('FPDB2LOG')                      10970000
                     COMMAREA (WS-ERRL-DATA)                            10980000
                     LENGTH (LENGTH OF WS-ERRL-DATA)                    10990000
                     NOHANDLE                                           11000000
               END-EXEC                                                 11010000
           END-IF.                                                      11020000
                                                                        11030000
      *---------------------------------------------------------------- 11040000
       9500-RETURN-DB2-ERROR.                                           11050000
      *---------------------------------------------------------------- 11060000
           EXEC CICS SYNCPOINT ROLLBACK END-EXEC.                       11070000
           SET ACAT04IO-DB2-ERROR TO TRUE.                              11080000
           MOVE SQLCAID TO ACAT04IO-SQLCAID.                            11090000
           MOVE SQLCODE TO ACAT04IO-SQLCODE.                            11100000
           MOVE SQLERRM TO ACAT04IO-SQLERRM.                            11110000
           EXEC CICS RETURN END-EXEC.                                   11120000
      *---------------------------------------------------------------* 11130000
      *    END OF ACAT04DC                                            * 11140000
      *###############################################################* 11150000
