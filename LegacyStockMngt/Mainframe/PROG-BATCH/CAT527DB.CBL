000001* PDX    - CAT527DB C0311598 05/09/11 15:25:33 TBLAMUR            00001000
000001* LRM002 SSR 77445 CALL MSISINB WITH SUBMITTER ISIN FOR BETTER            
000001*   MATCH TO MSD.                                                         
000001* PDX    - CAT527DB C0274114 01/29/09 11:41:25 TBDOJUN            00001000
000001* DJ0001 SSR 60131 IF 12 DIGIT CUSIP NOT FND FOR BOND, USE 9.     00001000
000001* DJ0001 SSR 62537 USE PRNGFL FILE TO CHECK FOR PRIVATE RANGE     00001000
000001* PDX    - CAT527DB C0269669 09/16/08 10:33:44 TBLAMUR            00002000
       IDENTIFICATION DIVISION.                                         00020000
       PROGRAM-ID.  CAT527DB.                                           00030000
       AUTHOR.      LARRY MUREY.                                        00040000
       DATE-WRITTEN.  AUG 2008.                                         00050000
                                                                        00060000
      *---------------------------------------------------------------- 00070000
      * THE PURPOSE OF THIS PROGRAM IS TO EXTRACT PENDING ASSETS FROM   00080000
      * DB2 TABLES ACTIVE TRANSFERS AND ASSETS (VTRNFR AND VASSET).     00090000
      * THIS FILE WILL BE USED TO CREATE AN INTRA-DAY MSD MISMATCHED    00100000
      * REPORT WHICH THE CLIENTS WILL FORWARD TO THE MSD FOLKS TO HAVE  00110000
      * THE MSD DATABASE CHANGED.                                       00120000
      * THIS FILE CONTAINS ASSETS NOT MATCHED TO MSD, HAVING SPACES     00130000
      * IN SECURITY-ADP-NBR.  THE ACTIVE TRANSFER TABLE IS READ TO      00140000
      * ONLY REPORT RECEIVER SIDE ASSETS IN STATUS LESS THAN 300.       00150000
      * THESE FEEDS.                                                    00160000
      * THE PROCESS DATE MAY BE OVERRIDDEN BY PARM DATE YYMMDD FORMAT.  00170000
      * THIS IS A NON-UPDATING PROGRAM AND MAY BE RERUN.                00180000
      *---------------------------------------------------------------- 00190000
           EJECT                                                        00200000
      ***************************************************************** 00210000
       ENVIRONMENT DIVISION.                                            00220000
      ***************************************************************** 00230000
       INPUT-OUTPUT SECTION.                                            00240000
       FILE-CONTROL.                                                    00250000
                                                                        00260000
DJ0001     SELECT PRNGFL           ASSIGN       TO PRNGFL               00260000
DJ0001                             ACCESS          DYNAMIC              00260000
DJ0001                             ORGANIZATION    INDEXED              00260000
DJ0001                             RECORD KEY   IS PRNGKEY              00260000
DJ0001                             FILE STATUS  IS PRNGFL-STAT.         00260000
                                                                        00260000
           SELECT PENDING-FILE                  ASSIGN  TO  MSDEXCP.    00270035
                                                                        00280000
      ***************************************************************** 00290000
       DATA DIVISION.                                                   00300000
      ***************************************************************** 00310000
                                                                        00320000
       FILE SECTION.                                                    00330000
                                                                        00340000
DJ0001*** PRIVATE RANGE FILE                                            00340000
DJ0001 FD  PRNGFL.                                                      00340000
DJ0001     COPY PRNGRECC.                                               00340000
                                                                        00340000
       FD  PENDING-FILE                                                 00350000
           RECORDING MODE IS F                                          00360008
           BLOCK CONTAINS 0 RECORDS.                                    00370000
       COPY ACATMSDE  REPLACING ==:FMT:== BY ==PEND==.                  00380001
                                                                        00390000
           EJECT                                                        00400000
      ******************************************************************00410000
       WORKING-STORAGE SECTION.                                         00420000
      ******************************************************************00430000
                                                                        00440000
       77  ABEND-CODE              COMP  PIC S9(4)   VALUE +9999.       00450000
                                                                        00460000
       77  ACAT-PROC-DATE                   PIC X(08)  VALUE ' '.       00470000
                                                                        00480000
       77  WS-TOTAL-TI-REC-CNTR  COMP-3  PIC  9(09)  VALUE ZEROES.      00490000
       77  WS-TOTAL-AT-REC-CNTR  COMP-3  PIC  9(09)  VALUE ZEROES.      00500000
       77  WS-TOTAL-OP-REC-CNTR  COMP-3  PIC  9(09)  VALUE ZEROES.      00510000
       77  W-MSD-FND-CNT         COMP-3  PIC  9(09)  VALUE ZEROES.      00520019
       77  W-MSD-NOTFND-CNT      COMP-3  PIC  9(09)  VALUE ZEROES.      00530019
       77  PENDFILE-REC-CNTR     COMP-3  PIC  9(09)  VALUE ZEROES.      00540000
       77  W-CURRENT-TIMESTAMP           PIC  X(026).                   00550005
       77  W-DB2-SQLCODE             PIC ---9.                          00560010
                                                                        00570000
DJ0001 01  W-PRNGL-AREA.                                                00620000
DJ0001     05  PRNGFL-STAT               PIC X(002).                    00570000
DJ0001         88 VALID-PRNGFL-STAT      VALUE '00' '04' '10' '23'.     00570000
DJ0001         88 PRNGFL-OKAY            VALUE '00' THRU '09', '97'.    00570000
DJ0001         88 PRNGFL-END-OF-FILE     VALUE '10'.                    00570000
DJ0001         88 PRNGFL-NOT-FOUND       VALUE '23'.                    00570000
DJ0001         88 PRNGFL-EMPTY-MISSING   VALUE '35'.                    00570000
DJ0001     05  W-PRNGFL-SW               PIC  X(001) VALUE ' '.         00570000
DJ0001         88 W-PRNGFL-FOUND                     VALUE 'Y'.         00570000
           EJECT                                                        00590000
           COPY STUBCPY.                                                00580000
LRM002     03  MSISINB           PIC X(08) VALUE 'MSISINB '.                    
           EJECT                                                        00590000
           COPY BPDATESC.                                               00600000
                                                                        00610000
       01  DSNTIAR                       PIC X(08)  VALUE 'DSNTIAR'.    00620000
       01  GETXREF                       PIC  X(08) VALUE 'ZGETXREF'.   00630019
                                                                        00640019
       01  WS-DB2-MESSAGE-AREA.                                         00650000
           05  WS-DB2-MSG-LEN            PIC S9(04) COMP VALUE +960.    00660000
           05  WS-ERROR-MSG              PIC X(80)  OCCURS 12 TIMES     00670000
               INDEXED BY WS-ERROR-INDEX.                               00680000
       01  WS-ERR-LINE-LEN               PIC S9(09) COMP VALUE +80.     00690000
                                                                        00700000
       COPY ACATMSDE  REPLACING ==:FMT:== BY ==FMT==.                   00710001
           EJECT                                                        00720000
LRM002     COPY MSISINC.                                                        
           EJECT                                                        00720000
      *DB2 COMMUNICATION AREA                                           00730000
           EXEC SQL                                                     00740000
              INCLUDE SQLCA                                             00750000
           END-EXEC.                                                    00760000
                                                                        00770000
           EJECT                                                        00780000
           EXEC SQL                                                     00790000
              INCLUDE VTRNFR                                            00800000
           END-EXEC.                                                    00810000
                                                                        00820000
           EJECT                                                        00830000
           EXEC SQL                                                     00840000
              INCLUDE VASSET                                            00850000
           END-EXEC.                                                    00860000
                                                                        00870000
                                                                        00880000
      * DECLARE CURSOR TO OBTAIN AT RECORDS NON CASH,MEMO MISSING ADP-NO00890000
           EXEC SQL                                                     00900000
              DECLARE NSCC_AT1_CRSR CURSOR FOR                          00910000
                 SELECT                                                 00920000
                    ACAT_CONTROL_NBR,                                   00930000
                    ASSET_SEQ_NBR,                                      00940000
                    TRNFR_TYPE_CD,                                      00950016
                    SBMTG_PRTCP_NBR,                                    00960000
                    TRANS_RFRN_ID_CD,                                   00970000
                    ASSET_PRC_CTGY_CD,                                  00980000
                    STTLM_LCTN_CD,                                      00990000
                    STTLM_RSN_CD,                                       01000000
                    ISIN_CNTRY_CD,                                      01010000
                    ISIN_SEC_ISSUE_CD,                                  01020000
                    ISIN_SEC_CDG_CD,                                    01030000
                    ASSET_DESC_TXT,                                     01040000
                    ASSET_QTY,                                          01050000
                    PSTN_CD,                                            01060000
                    OPTN_CTGY_CD,                                       01070050
                    ISO_CRNCY_CD,                                       01080000
                    ASSET_AMT,                                          01090000
                    BEARER_BOND_CD,                                     01100000
                    CSH_MGN_SHRT_CD,                                    01110000
                    TRNFR_TYPE_RSN_CD,                                  01120000
                    CRT_TMSTP                                           01130044
                 FROM VASSET                                            01140000
                 WHERE CLIENT_NBR = :DCLVASSET.CLIENT-NBR               01150030
                  AND SECURITY_ADP_NBR = '       '                      01160030
                  AND NOT STTLM_LCTN_CD = '40'                          01170000
                  AND NOT STTLM_LCTN_CD = '45'                          01180000
                  AND NOT STTLM_LCTN_CD = '60'                          01190000
                  AND NOT STTLM_LCTN_CD = '65'                          01200000
                  AND NOT WHI_CD = 'W'                                  01210000
                 FOR READ ONLY WITH UR                                  01220000
           END-EXEC.                                                    01230000
                                                                        01240000
      ******************************************************************01250017
      * GETMSD COMMAREA                                                *01260017
      ******************************************************************01270017
       01  FILLER                        PIC X(08) VALUE 'GETMSDCE'.    01280017
           COPY GETMSDCE.                                               01290017
      /                                                                 01300017
       01  FILLER                        PIC X(08) VALUE 'GETXRFC '.    01310017
           COPY GETXRFC.                                                01320017
      /                                                                 01330017
       01  W-WORK-FIELDS.                                               01340017
           05  W-CLIENT-X                PIC  X(003).                   01350017
           05  W-CLIENT-NUM REDEFINES                                   01360017
               W-CLIENT-X                PIC  9(003).                   01370017
DJ0001     05  W-GETXRF-KEY-9            PIC  X(009).                   01350017
                                                                        01380000
      /                                                                 01390030
       01  FILLER                        PIC X(008) VALUE 'B1-TABLE'.   01400030
       01  B1-TABLE-AREA.                                               01410030
           03  B1-TABLE OCCURS 500 TIMES.                               01420030
               05  B1-ADP-CL-NO             PIC 9(04).                  01430030
               05  B1-STREAM                PIC X(01).                  01440030
       01  B1-WORK-FIELEDS.                                             01450030
           03  B1-TBL-CNT                   PIC 9(03) VALUE 0.          01460030
           03  B1-SUB                       PIC 9(03) VALUE 0.          01470030
      /                                                                 01480030
      ******************************************************************01490030
      * B1 HEADER                                                      *01500030
      ******************************************************************01510030
       01  FILLER                        PIC X(08) VALUE 'BHINFO  '.    01520030
           COPY BHINFO.                                                 01530030
      /                                                                 01540030
      ******************************************************************01550030
      * B1 ACAT SECTION                                                *01560030
      ******************************************************************01570030
       01  FILLER                        PIC X(08) VALUE 'BHACAT  '.    01580030
           COPY BHACAT.                                                 01590030
                                                                        01600030
      /                                                                 01610030
      ***************************************************************** 01620030
      *    LINKAGE SECTION                                            * 01630030
      ***************************************************************** 01640030
       LINKAGE SECTION.                                                 01650030
       01  L-JCL-PARMS.                                                 01660030
           05  PARMLENGTH                PIC S9(004) COMP SYNC.         01670030
           05  L-STREAM                  PIC  X(001).                   01680030
               88  L-ALL-STREAM                      VALUE 'Z'.         01690030
      /                                                                 01700030
      ***************************************************************** 01710000
       PROCEDURE DIVISION USING L-JCL-PARMS.                            01720030
      ***************************************************************** 01730000
           DISPLAY 'CAT527DB - EXTRACT MSD NOTFOUND ASSETS'.            01740037
           DISPLAY ' '.                                                 01750000
           COPY MSGCOBO.                                                01760000
                                                                        01770000
           PERFORM INITIAL-ROUTINE.                                     01780000
                                                                        01790000
           PERFORM 2000-PROCESS-ROUTINE.                                01800030
                                                                        01810000
           PERFORM ENDJOB-ROUTINE.                                      01820000
                                                                        01830000
           GOBACK.                                                      01840000
                                                                        01850000
           EJECT                                                        01860005
      *****************                                                 01870005
       INITIAL-ROUTINE.                                                 01880005
      *****************                                                 01890005
                                                                        01900005
DJ0001     OPEN INPUT PRNGFL.                                           01900005
DJ0001     DISPLAY 'CAT527DB: PRNGFL   OPENED FOR INPUT.  STATUS = '    01900005
DJ0001                                        PRNGFL-STAT               01900005
DJ0001     IF  PRNGFL-OKAY                                              01900005
DJ0001         CONTINUE                                                 01900005
DJ0001     ELSE                                                         01900005
DJ0001         DISPLAY 'CAT527DB: ERROR OPENING PRNGFL'                 01900005
DJ0001         DISPLAY 'CAT527DB: OPEN STATUS = ' PRNGFL-STAT           01900005
DJ0001         DISPLAY 'CAT527DB: U3001 - ABENDING ON BAD FILE STATUS'  01900005
DJ0001         MOVE +3001    TO ABEND-CODE                              01900005
DJ0001         CALL ABEND USING ABEND-CODE                              01900005
DJ0001     END-IF                                                       01900005
                                                                        01900005
           OPEN OUTPUT  PENDING-FILE                                    01910005
                                                                        01910160
           MOVE 'D'              TO GETMSD-DEVICE-IND                   01911060
           MOVE 'R'              TO GETMSD-ACCESS-IND                   01912060
           MOVE 'E'              TO GETMSD-FORMAT-IND                   01913060
           SET GETXRF-DEVICE-DISK        TO TRUE                        01914060
           SET GETXRF-ACCESS-RANDOM      TO TRUE                        01915060
           SET GETXRF-RETURN-VALID       TO TRUE                        01916060
                                                                        01920005
           MOVE  'CAT527DB'                   TO BPDATES-CALLING-PGM.   01930005
           MOVE  'C'                          TO BPDATES-REQ-TYPE.      01940005
                                                                        01950005
           CALL    BPDATES            USING BPDATES-PARAMETERS.         01960005
                                                                        01970005
           EXEC SQL                                                     01980005
               SET :W-CURRENT-TIMESTAMP = CURRENT TIMESTAMP             01990005
           END-EXEC                                                     02000005
                                                                        02010005
           IF  SQLCODE = +0                                             02020005
               DISPLAY ' '                                              02030005
               DISPLAY 'CAT527DB: W-CURRENT-TIMESTAMP = '               02040005
                                                    W-CURRENT-TIMESTAMP 02050005
               DISPLAY ' '                                              02060005
           ELSE                                                         02070005
               DISPLAY 'CAT527DB: W-CURRENT-TIMESTAMP NOT SET'          02080005
               MOVE SQLCODE      TO W-DB2-SQLCODE                       02090005
               DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                       02100005
               PERFORM  SQL-ERROR-ROUTINE                               02110010
           END-IF.                                                      02120005
                                                                        02130005
           DISPLAY 'CAT527DB: L-STREAM         = '                      02140030
                              L-STREAM                                  02150030
                                                                        02160030
           MOVE SPACES TO PEND-HEADER-RECORD.                           02170006
           SET PEND-HEADER-ID TO TRUE                                   02180006
           MOVE W-CURRENT-TIMESTAMP TO PEND-HEADER-CRT-TIMESTAMP        02190006
           WRITE PEND-HEADER-RECORD.                                    02200006
                                                                        02210030
           PERFORM 1500-LOAD-B1.                                        02220030
                                                                        02230030
      /                                                                 02240030
       1500-LOAD-B1.                                                    02250030
           DISPLAY 'CAT527DB: 1500-LOAD-B1'.                            02260037
                                                                        02270030
           MOVE SPACES                   TO  B1-TABLE-AREA.             02280030
           MOVE 0                        TO  B1-TBL-CNT.                02290030
                                                                        02300030
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500        02310030
                                                                        02320030
             MOVE  ' '                   TO  BH-BROKER-HEADER-INFO      02330030
                                             BH-ACAT-INFO               02340030
             MOVE  B1-SUB                TO  BH-BROKER-NUMBER-N         02350030
             MOVE  '015'                 TO  BH-LOGICAL-RECORD-CODE     02360030
             MOVE  '434500'              TO  BH-B2-INFO-ID              02370030
             CALL  GETB1V              USING BH-BROKER-HEADER-INFO,     02380038
                                             BH-ACAT-INFO               02390038
             IF   BH-BROKER-ACTIVE                                      02400030
             AND  BH-ACAT-ACTIVE                                        02410030
                   ADD 1 TO B1-TBL-CNT                                  02420030
                   MOVE  BH-BROKER-NUMBER-N                             02430030
                                         TO B1-ADP-CL-NO  (B1-TBL-CNT)  02440030
                   IF  BH-BROKER-MINI-MAXI-SUBGROUP > ' '               02450030
                       MOVE BH-BROKER-MINI-MAXI-SUBGROUP                02460030
                                         TO B1-STREAM     (B1-TBL-CNT)  02470030
                   ELSE                                                 02480030
                       MOVE BH-BROKER-MINI-MAXI-INDICATOR               02490030
                                         TO B1-STREAM     (B1-TBL-CNT)  02500030
                   END-IF                                               02510030
                   IF  B1-STREAM (B1-TBL-CNT) = L-STREAM                02520030
                       DISPLAY     'B1-TBL-CNT=' B1-TBL-CNT             02530058
                                    ' CLT ' B1-ADP-CL-NO  (B1-TBL-CNT)  02540030
                   END-IF                                               02550030
             END-IF                                                     02560030
           END-PERFORM.                                                 02570030
      /                                                                 02580030
       2000-PROCESS-ROUTINE.                                            02590030
                                                                        02600000
           PERFORM VARYING B1-SUB FROM 1 BY 1                           02610030
              UNTIL B1-SUB > 500                                        02620030
              IF  B1-STREAM      (B1-SUB) = L-STREAM                    02630030
                  MOVE B1-ADP-CL-NO  (B1-SUB) TO CLIENT-NBR OF DCLVASSET02640030
                  PERFORM 3000-FETCH-TRANFER                            02650030
              END-IF                                                    02660030
           END-PERFORM.                                                 02670030
                                                                        02680030
       3000-FETCH-TRANFER.                                              02690030
           DISPLAY 'OPENING CURSOR FOR ' CLIENT-NBR OF DCLVASSET        02691058
           EXEC SQL OPEN NSCC_AT1_CRSR END-EXEC                         02700000
           IF SQLCODE NOT = +0                                          02710000
              MOVE 2400 TO ABEND-CODE                                   02720000
              PERFORM SQL-ERROR-ROUTINE                                 02730000
           END-IF.                                                      02740000
                                                                        02750000
           PERFORM UNTIL SQLCODE NOT = +0                               02760000
              EXEC SQL                                                  02770006
                 FETCH NSCC_AT1_CRSR                                    02780000
                    INTO                                                02790000
                     :DCLVASSET.ACAT-CONTROL-NBR                        02800040
                    ,:DCLVASSET.ASSET-SEQ-NBR                           02810000
                    ,:DCLVASSET.TRNFR-TYPE-CD                           02820016
                    ,:DCLVASSET.SBMTG-PRTCP-NBR                         02830000
                    ,:DCLVASSET.TRANS-RFRN-ID-CD                        02840000
                    ,:DCLVASSET.ASSET-PRC-CTGY-CD                       02850000
                    ,:DCLVASSET.STTLM-LCTN-CD                           02860000
                    ,:DCLVASSET.STTLM-RSN-CD                            02870000
                    ,:DCLVASSET.ISIN-CNTRY-CD                           02880000
                    ,:DCLVASSET.ISIN-SEC-ISSUE-CD                       02890000
                    ,:DCLVASSET.ISIN-SEC-CDG-CD                         02900000
                    ,:DCLVASSET.ASSET-DESC-TXT                          02910000
                    ,:DCLVASSET.ASSET-QTY                               02920000
                    ,:DCLVASSET.PSTN-CD                                 02930000
                    ,:DCLVASSET.OPTN-CTGY-CD                            02940050
                    ,:DCLVASSET.ISO-CRNCY-CD                            02950000
                    ,:DCLVASSET.ASSET-AMT                               02960000
                    ,:DCLVASSET.BEARER-BOND-CD                          02970000
                    ,:DCLVASSET.CSH-MGN-SHRT-CD                         02980000
                    ,:DCLVASSET.TRNFR-TYPE-RSN-CD                       02990048
                    ,:DCLVASSET.CRT-TMSTP                               03000044
              END-EXEC                                                  03010006
                                                                        03020000
              EVALUATE SQLCODE                                          03030000
                 WHEN +100                                              03040000
                    CONTINUE                                            03050000
                 WHEN +0                                                03060000
                     ADD 1 TO WS-TOTAL-AT-REC-CNTR                      03070000
                     DISPLAY 'VASSET FETCHED '                          03071062
                          ACAT-CONTROL-NBR OF DCLVASSET                 03071162
                          ' '   ASSET-SEQ-NBR OF DCLVASSET              03072058
                          ' '   ISIN-CNTRY-CD     OF DCLVASSET          03072058
DJ0001                          ISIN-SEC-ISSUE-CD OF DCLVASSET          03072058
DJ0001                          ISIN-SEC-CDG-CD   OF DCLVASSET          03072058
                     PERFORM SELECT-VTRNFR-RTN                          03080000
                 WHEN OTHER                                             03090000
                    MOVE 2500 TO ABEND-CODE                             03100000
                    PERFORM SQL-ERROR-ROUTINE                           03110000
              END-EVALUATE                                              03120000
           END-PERFORM.                                                 03130000
                                                                        03140000
           IF SQLCODE NOT = +100                                        03150000
              MOVE 2800 TO ABEND-CODE                                   03160000
              PERFORM SQL-ERROR-ROUTINE                                 03170000
           END-IF                                                       03180000
                                                                        03190000
           EXEC SQL                                                     03200000
              CLOSE NSCC_AT1_CRSR                                       03210003
           END-EXEC                                                     03220000
                                                                        03230000
           IF SQLCODE NOT = +0                                          03240000
              MOVE 3200 TO ABEND-CODE                                   03250000
              PERFORM SQL-ERROR-ROUTINE                                 03260000
           ELSE                                                         03270000
              MOVE +0                       TO  SQLCODE                 03280000
           END-IF.                                                      03290000
                                                                        03300000
       SELECT-VTRNFR-RTN.                                               03310000
           EXEC SQL                                                     03320000
              SELECT                                                    03330000
                STTS_CD                                                 03340000
               ,DSTBN_SIDE_CD                                           03350000
               ,DLVR_NBR                                                03360000
               ,RCV_NBR                                                 03370000
               ,ACCT_RCV_NBR                                            03380000
               ,ACCT_DLVR_NBR                                           03390000
               ,BRANCH_CD                                               03400000
               ,ACCT_CD                                                 03410000
DJ0001         ,SBMTG_PRTCP_NBR                                         03410000
              INTO                                                      03420000
                :DCLVTRNFR.STTS-CD                                      03430003
               ,:DCLVTRNFR.DSTBN-SIDE-CD                                03440000
               ,:DCLVTRNFR.DLVR-NBR                                     03450000
               ,:DCLVTRNFR.RCV-NBR                                      03460000
               ,:DCLVTRNFR.ACCT-RCV-NBR                                 03470000
               ,:DCLVTRNFR.ACCT-DLVR-NBR                                03480000
               ,:DCLVTRNFR.BRANCH-CD                                    03490000
               ,:DCLVTRNFR.ACCT-CD                                      03500000
DJ0001         ,:DCLVTRNFR.SBMTG-PRTCP-NBR                              03500000
                 FROM VTRNFR                                            03510000
              WHERE  CLIENT_NBR       = :DCLVASSET.CLIENT-NBR           03520000
                AND  ACAT_CONTROL_NBR = :DCLVASSET.ACAT-CONTROL-NBR     03530000
              WITH UR                                                   03540000
           END-EXEC.                                                    03550000
                                                                        03560000
           EVALUATE SQLCODE                                             03570000
               WHEN +100                                                03580000
                   MOVE +0 TO SQLCODE                                   03590000
               WHEN +0                                                  03600000
                   ADD 1 TO WS-TOTAL-TI-REC-CNTR                        03601062
                   IF STTS-CD > '199'                                   03610014
                   AND STTS-CD < '300'                                  03620014
                   AND ((DSTBN-SIDE-CD = 'R'                            03630014
                   AND (TRNFR-TYPE-CD OF DCLVASSET =                    03640016
                                      'FUL' OR 'PTR' OR 'PTD' OR 'RCR'))03650014
                   OR  (DSTBN-SIDE-CD = 'D'                             03660014
                   AND (TRNFR-TYPE-CD OF DCLVASSET = 'RCL' OR 'FRV')))  03670016
                      PERFORM 6700-GETMSDC THRU 6700-EXIT               03680017
                      IF SECURITY-ADP-NBR OF DCLVASSET = ' '            03690019
                         PERFORM WRITE-DETAIL-RECORD-RTN                03700017
                      END-IF                                            03710017
                   ELSE                                                 03720062
                      DISPLAY 'BYPASS RPT / STTS =' STTS-CD OF DCLVTRNFR03721062
                   END-IF                                               03722062
           END-EVALUATE                                                 03730006
                                                                        03740000
           IF SQLCODE NOT = +0                                          03750000
              MOVE 3400 TO ABEND-CODE                                   03760000
              PERFORM SQL-ERROR-ROUTINE                                 03770000
           END-IF                                                       03780000
           .                                                            03790000
                                                                        03800000
      /                                                                 03810017
LRM****---------------------------------------------------------------  03820017
LRM****  THE FOLLOWING COPIED FROM CAT527DB TO MATCH MSD LOOKUP LOGIC   03830020
LRM****  (SLIGHT CHANGES TO USE DB2 FIELDS ONLY) TO SEE IF MSD HAS BEEN 03840020
LRM****  UPDATED INTRA-DAY TO CAUSE A FOUND ADP-NBR CONDITION. WHEN     03850020
LRM****  FOUND IT IS NO LONGER REPORTED, AS CAT710                      03860020
LRM****  (USING THE SAME LOOKUP LOGIC) WILL UPDATE THE VASSET TONIGHT.  03870020
LRM****---------------------------------------------------------------  03880020
       6700-GETMSDC.                                                    03890017
                                                                        03900017
           MOVE SPACES TO SECURITY-ADP-NBR OF DCLVASSET.                03910042
                                                                        03920042
           IF  ASSET-PRC-CTGY-CD =                                      03930017
              'CORP' OR 'MUNI' OR 'ZERO'                                03940017
               PERFORM 6800-BONDS      THRU 6800-EXIT                   03950017
               GO TO 6700-EXIT                                          03960017
           END-IF                                                       03970017
                                                                        03980017
           MOVE LOW-VALUES             TO GETMSD-SEARCH-KEY-AREA        03990017
           MOVE ISIN-SEC-ISSUE-CD      TO GETMSD-SEARCH-KEY             04000017
                                                                        04010017
           MOVE ALL ZERO               TO GETMSD-WI-CODE                04020017
           IF   WHI-CD = 'W'                                            04030017
                MOVE '1'               TO GETMSD-WI-CODE                04040017
           END-IF                                                       04050017
           MOVE CLIENT-NBR OF DCLVASSET (2:3) TO W-CLIENT-X             04060017
           MOVE W-CLIENT-NUM           TO GETMSD-CLIENT-PL2             04070017
DJ0001     PERFORM 6970-CALL-GETMSDC     THRU 6970-EXIT                 04090017
                                                                        04090017
DJ0001***--IF NOT FOUND BECAUSE OF PRIVATE RANGE, GO TO NOTFND.         04090017
DJ0001     IF W-PRNGFL-SW = 'Y'                                         04090017
DJ0001        SET FMT-PRIVATE-RANGE TO TRUE                             04090017
DJ0001     ELSE                                                         04090017
            IF GETMSD-RETURN-VALID                                      04100017
              ADD 1 TO W-MSD-FND-CNT                                    04120017
              MOVE MS-ADP-NO     TO SECURITY-ADP-NBR OF DCLVASSET       04130017
              DISPLAY 'MSD FND FROM CUSIP ' ISIN-SEC-ISSUE-CD           04131062
            ELSE                                                        04140017
               IF WHI-CD = 'W'                                          04150027
                  MOVE '0'               TO GETMSD-WI-CODE              04160027
DJ0001            PERFORM 6970-CALL-GETMSDC     THRU 6970-EXIT          04170027
                  IF GETMSD-RETURN-VALID                                04180027
                     ADD 1 TO W-MSD-FND-CNT                             04181062
                     MOVE MS-ADP-NO  TO SECURITY-ADP-NBR OF DCLVASSET   04190027
                     DISPLAY 'MSD FND FROM CUSIP ' ISIN-SEC-ISSUE-CD    04191062
                         ' IGNORING WHEN-ISSUED'                        04192062
                  ELSE                                                  04200027
                     PERFORM 6703-USE-ISIN-FOR-GETMSD THRU 6703-EXIT    04210027
                  END-IF                                                04220027
               ELSE                                                     04230027
                  PERFORM 6703-USE-ISIN-FOR-GETMSD THRU 6703-EXIT       04240027
               END-IF                                                   04250027
             END-IF                                                     04260017
DJ0001     END-IF.                                                      04090017
                                                                        04270017
       6700-EXIT. EXIT.                                                 04280017
      /                                                                 04290017
       6703-USE-ISIN-FOR-GETMSD.                                        04300027
      *WHEN CUSIP NOT FOUND, TRY ISIN NUMBER                            04310027
                                                                        04320027
           MOVE ISIN-CNTRY-CD          TO GETMSD-SEARCH-KEY(1:2)        04330027
           MOVE ISIN-SEC-ISSUE-CD      TO GETMSD-SEARCH-KEY(3:9)        04340027
           MOVE ISIN-SEC-CDG-CD        TO GETMSD-SEARCH-KEY(12:1)       04350027
DJ0001     PERFORM 6970-CALL-GETMSDC     THRU 6970-EXIT                 04170027
           IF  GETMSD-RETURN-VALID                                      04370027
               ADD 1 TO W-MSD-FND-CNT                                   04371062
               MOVE MS-ADP-NO  TO SECURITY-ADP-NBR OF DCLVASSET         04380062
               DISPLAY 'MSD FND FROM CNTRY/ISIN/CKDT '                  04381062
               DISPLAY ' 6703-USE-ISIN        '                         04390027
                      GETMSD-SEARCH-KEY ' FOUND ' MS-ADP-NO             04400062
           ELSE                                                         04430027
               DISPLAY  ' 6703-USE-ISIN        '                        04440027
                      GETMSD-SEARCH-KEY  ' NOTFOUND'                    04450062
             IF ASSET-DESC-TXT (114:15) = 'SUBMITTER ISIN:'             04460028
DJ0001       AND ASSET-DESC-TXT (138:1) > ' '                           04460028
DJ0001       AND ASSET-DESC-TXT (139:1) > ' '                           04460028
               PERFORM 6705-SUBMITTER-ISIN THRU 6705-EXIT               04470027
             ELSE                                                       04480027
               ADD 1 TO W-MSD-NOTFND-CNT                                04490027
               IF STTLM-RSN-CD = 'OPT '                                 04490165
                  SET FMT-MSD-NOT-FOUND TO TRUE                         04490266
               ELSE                                                     04490365
               IF ISIN-SEC-ISSUE-CD NOT > SPACES                        04491063
                  SET FMT-MSD-NOTHING-PROVIDED TO TRUE                  04492063
               ELSE                                                     04493063
               IF ISIN-CNTRY-CD > SPACES                                04500027
                  SET FMT-MSD-CUSIP12-NOTFND TO TRUE                    04510056
               ELSE                                                     04520027
                  SET FMT-MSD-CUSIP-NOTFND TO TRUE                      04530027
             END-IF END-IF END-IF                                       04540066
           END-IF.                                                      04550027
                                                                        04560027
       6703-EXIT. EXIT.                                                 04570027
      /                                                                 04580027
       6705-SUBMITTER-ISIN.                                             04590037
      * USE "SUBMITTER-ISIN:" IN THE ASSET DESCRIPTION FIELD            04600027
LRM002*---------------------------------------------------------------          
LRM002* FIRST CALL MSISINB WITH ISIN AND COUNTRY FOR MATCH.  IF FOUND           
LRM002* USE THE ADP NUMBER RETURNED, OTHER LOOKUP THE OLD WAY.                  
LRM002*---------------------------------------------------------------          
LRM002     MOVE 'G' TO MSISIN-ACTION                                            
LRM002     MOVE ASSET-DESC-TXT (129:12)  TO MSISIN-ISIN-NBR                     
LRM002     IF ISIN-CNTRY-CD > SPACES                                            
LRM002        MOVE ISIN-CNTRY-CD         TO MSISIN-COUNTRY                      
LRM002     ELSE                                                                 
LRM002        MOVE ASSET-DESC-TXT (129:2) TO MSISIN-COUNTRY                     
LRM002     END-IF.                                                              
LRM002     DISPLAY 'CALLING MSISINB WITH ' MSISIN-ISIN-NBR                      
LRM002                                 ' ' MSISIN-COUNTRY                       
LRM002     CALL MSISINB                                                         
LRM002         USING MSISIN-COMMAREA.                                           
LRM002     DISPLAY 'MSISIN RET-CODE ' MSISIN-RETURN-CODE                        
LRM002     IF MSISIN-RETURN-CODE  = SPACES                                      
LRM002        DISPLAY  'MSISIN-ADP-NO ' MSISIN-ADP-NO                           
LRM002        MOVE MSISIN-ADP-NO               TO GETMSD-SEARCH-KEY             
LRM002        PERFORM 6970-CALL-GETMSDC     THRU 6970-EXIT                      
LRM002        IF  GETMSD-RETURN-VALID                                           
LRM002          DISPLAY     ' 6705-SUBMITTER-MSISIN'                            
LRM002           '"' ASSET-DESC-TXT (114:27) '"' ' FOUND'                       
LRM002          ADD 1 TO W-MSD-FND-CNT                                          
LRM002          MOVE MS-ADP-NO  TO SECURITY-ADP-NBR OF DCLVASSET                
LRM002          GO TO 6705-EXIT                                                 
LRM002     END-IF.                                                              
                                                                        04610027
           MOVE ASSET-DESC-TXT (129:12) TO GETMSD-SEARCH-KEY            04620028
DJ0001     PERFORM 6970-CALL-GETMSDC     THRU 6970-EXIT                 04170027
           IF  GETMSD-RETURN-VALID                                      04640027
              ADD 1 TO W-MSD-FND-CNT                                    04641062
              MOVE MS-ADP-NO     TO SECURITY-ADP-NBR OF DCLVASSET       04642062
              DISPLAY     ' 6705-SUBMITTER-ISIN  '                      04650062
                '"' ASSET-DESC-TXT (114:27) '"' ' FOUND ' MS-ADP-NO     04660028
           ELSE                                                         04690027
             MOVE ' '                         TO GETMSD-SEARCH-KEY      04700027
             MOVE ASSET-DESC-TXT (131:09)                               04710028
                                              TO GETMSD-SEARCH-KEY(1:9) 04720027
DJ0001       PERFORM 6970-CALL-GETMSDC     THRU 6970-EXIT               04170027
             IF  GETMSD-RETURN-VALID                                    04740027
               ADD 1 TO W-MSD-FND-CNT                                   04741062
               MOVE MS-ADP-NO     TO SECURITY-ADP-NBR OF DCLVASSET      04742062
               DISPLAY     ' 6705-SUBMITTER-ISIN9 '                     04750028
                '"' ASSET-DESC-TXT (114:27) '"' ' FOUND ' MS-ADP-NO     04760028
             ELSE                                                       04790027
               DISPLAY     ' 6705-SUBMITTER-ISIN  '                     04800028
                '"' ASSET-DESC-TXT (114:27) '"' ' NOTFOUND'             04810062
               ADD 1 TO W-MSD-NOTFND-CNT                                04820027
               SET FMT-MSD-ISIN-NOTFND TO TRUE                          04830027
             END-IF                                                     04840027
           END-IF.                                                      04850027
                                                                        04860027
       6705-EXIT. EXIT.                                                 04870027
                                                                        04880027
      /                                                                 04890027
       6800-BONDS.                                                      04900027
                                                                        04910027
DJ0001     MOVE ISIN-SEC-ISSUE-CD    TO W-GETXRF-KEY-9                  04920052
DJ0001     MOVE '0'                  TO GETXRF-WI-CODE                  05430052
           IF  BEARER-BOND-CD  = 'B'                                    04930027
               PERFORM 6810-BEARER-BOND THRU 6810-EXIT                  04940027
           ELSE                                                         04950027
               IF  ASSET-PRC-CTGY-CD = 'MUNI'                           04960027
                   PERFORM 6820-MUNI-BOND THRU 6820-EXIT                04970027
               ELSE                                                     04980027
                   PERFORM 6830-REGISTERED-BOND THRU 6830-EXIT          04990027
               END-IF                                                   05000027
           END-IF                                                       05010027
                                                                        05020027
           IF  GETXRF-RETURN-VALID                                      05030027
           AND GETMSD-RETURN-VALID                                      05040027
              ADD 1 TO W-MSD-FND-CNT                                    05050027
              MOVE MS-ADP-NO     TO SECURITY-ADP-NBR OF DCLVASSET       05060027
           ELSE                                                         05070027
             IF ASSET-DESC-TXT (114:15) = 'SUBMITTER ISIN:'             05080054
DJ0001       AND ASSET-DESC-TXT (138:1) > ' '                           04460028
DJ0001       AND ASSET-DESC-TXT (139:1) > ' '                           04460028
DJ0001          MOVE ASSET-DESC-TXT (131:9) TO W-GETXRF-KEY-9           05090056
                IF  BEARER-BOND-CD  = 'B'                               05100054
                    PERFORM 6810-BEARER-BOND THRU 6810-EXIT             05110052
                ELSE                                                    05120052
                   IF  ASSET-PRC-CTGY-CD = 'MUNI'                       05130054
                       PERFORM 6820-MUNI-BOND THRU 6820-EXIT            05140052
                   ELSE                                                 05150052
                       PERFORM 6830-REGISTERED-BOND THRU 6830-EXIT      05160052
                   END-IF                                               05170052
                END-IF                                                  05180052
                IF  GETXRF-RETURN-VALID                                 05190052
                AND GETMSD-RETURN-VALID                                 05200052
                   ADD 1 TO W-MSD-FND-CNT                               05210052
                   MOVE MS-ADP-NO     TO SECURITY-ADP-NBR OF DCLVASSET  05220052
                ELSE                                                    05230052
DJ0001           IF W-GETXRF-KEY-9 > ' '                                05420052
DJ0001           AND W-GETXRF-KEY-9(8:1) > ' '                          05420052
DJ0001           AND W-GETXRF-KEY-9(9:1) > ' '                          05420052
DJ0001             MOVE W-GETXRF-KEY-9 TO GETMSD-SEARCH-KEY(1:9)        05420052
DJ0001             MOVE ' '            TO GETMSD-SEARCH-KEY(10:3)       04700027
DJ0001             DISPLAY 'TRY 9 DIGIT CUSIP:'                         04700027
DJ0001             ' ' CLIENT-NBR OF DCLVASSET                          04700027
DJ0001             ' ' ACAT-CONTROL-NBR OF DCLVASSET                    04700027
DJ0001             ' ' ASSET-SEQ-NBR OF DCLVASSET                       04700027
DJ0001             ' ' W-GETXRF-KEY-9                                   04700027
DJ0001             PERFORM 6970-CALL-GETMSDC     THRU 6970-EXIT         04170027
DJ0001             IF  GETMSD-RETURN-VALID                              04740027
DJ0001             DISPLAY 'TRY 9 DIGIT CUSIP: MSD FOUND'               04700027
DJ0001                 ADD 1 TO W-MSD-FND-CNT                           04741062
DJ0001                 MOVE MS-ADP-NO  TO SECURITY-ADP-NBR OF DCLVASSET 05220052
DJ0001                 MOVE 'Y'        TO GETXRF-RETURN-CODE            05220052
DJ0001             ELSE                                                 05230052
DJ0001             DISPLAY 'TRY 9 DIGIT CUSIP: MSD NOT FOUND'           04700027
                       ADD 1 TO W-MSD-NOTFND-CNT                        05240052
                       SET FMT-MSD-ISIN-NOTFND TO TRUE                  05250056
DJ0001             END-IF                                               05260052
DJ0001           ELSE                                                   05230052
DJ0001                 ADD 1 TO W-MSD-NOTFND-CNT                        05240052
DJ0001                 SET FMT-MSD-ISIN-NOTFND TO TRUE                  05250056
DJ0001           END-IF                                                 05420052
                END-IF                                                  05260052
              END-IF                                                    05270052
           END-IF.                                                      05280052
                                                                        05290052
           IF  GETXRF-RETURN-VALID                                      05300052
           AND GETMSD-RETURN-VALID                                      05310052
               ADD 1 TO W-MSD-FND-CNT                                   05320052
               MOVE MS-ADP-NO     TO SECURITY-ADP-NBR OF DCLVASSET      05330052
           ELSE                                                         05340052
               IF NOT FMT-MSD-ISIN-NOTFND                               05341056
                  ADD 1 TO W-MSD-NOTFND-CNT                             05350056
                  IF ISIN-SEC-ISSUE-CD NOT > SPACES                     05351063
                     SET FMT-MSD-NOTHING-PROVIDED TO TRUE               05352063
                  ELSE                                                  05353063
                     SET FMT-MSD-CUSIP-NOTFND TO TRUE                   05360063
               END-IF END-IF                                            05361063
           END-IF.                                                      05370052
       6800-EXIT. EXIT.                                                 05380052
                                                                        05390052
      /                                                                 05400052
       6810-BEARER-BOND.                                                05410052
                                                                        05420052
DJ0001     MOVE W-GETXRF-KEY-9       TO GETXRF-SEARCH-KEY (1:9)         05420052
                                                                        05440052
           MOVE '010'                TO GETXRF-SEARCH-KEY (10:3)        05450052
           PERFORM 6940-GETXREF THRU 6940-EXIT                          05460052
           IF GETXRF-RETURN-VALID                                       05470052
              GO TO 6810-EXIT                                           05480052
           END-IF.                                                      05490052
                                                                        05500052
           MOVE '020'                TO GETXRF-SEARCH-KEY (10:3)        05530052
           PERFORM 6940-GETXREF THRU 6940-EXIT                          05540052
           IF GETXRF-RETURN-VALID                                       05550052
              GO TO 6810-EXIT                                           05560052
           END-IF.                                                      05570052
                                                                        05580052
           MOVE '040'                TO GETXRF-SEARCH-KEY (10:3)        05610052
           PERFORM 6940-GETXREF THRU 6940-EXIT                          05620052
           IF GETXRF-RETURN-VALID                                       05630052
              GO TO 6810-EXIT                                           05640052
           END-IF.                                                      05650052
                                                                        05660052
           MOVE '050'                TO GETXRF-SEARCH-KEY (10:3)        05690052
           PERFORM 6940-GETXREF THRU 6940-EXIT                          05700052
           IF GETXRF-RETURN-VALID                                       05710052
              GO TO 6810-EXIT                                           05720052
           END-IF.                                                      05730052
                                                                        05740052
           MOVE '060'                TO GETXRF-SEARCH-KEY (10:3)        05770052
           PERFORM 6940-GETXREF THRU 6940-EXIT                          05780052
           IF GETXRF-RETURN-VALID                                       05790052
              GO TO 6810-EXIT                                           05800052
           END-IF.                                                      05810052
                                                                        05820052
           MOVE '000'                TO GETXRF-SEARCH-KEY (10:3)        05850052
           PERFORM 6940-GETXREF THRU 6940-EXIT                          05860052
           IF GETXRF-RETURN-VALID                                       05870052
              GO TO 6810-EXIT                                           05880052
           END-IF.                                                      05890052
                                                                        05900052
           MOVE '030'                TO GETXRF-SEARCH-KEY (10:3)        05930052
           PERFORM 6940-GETXREF THRU 6940-EXIT                          05940052
           IF GETXRF-RETURN-VALID                                       05950052
              GO TO 6810-EXIT                                           05960052
           END-IF.                                                      05970052
                                                                        05980052
       6810-EXIT. EXIT.                                                 05990052
      /                                                                 06000052
       6820-MUNI-BOND.                                                  06010052
                                                                        05440052
DJ0001     MOVE W-GETXRF-KEY-9       TO GETXRF-SEARCH-KEY (1:9)         05420052
                                                                        06020052
           MOVE '060'                TO GETXRF-SEARCH-KEY (10:3)        06050052
           PERFORM 6940-GETXREF THRU 6940-EXIT                          06060052
           IF GETXRF-RETURN-VALID                                       06070052
              GO TO 6820-EXIT                                           06080052
           END-IF.                                                      06090052
                                                                        06100052
           MOVE '040'                TO GETXRF-SEARCH-KEY (10:3)        06130052
           PERFORM 6940-GETXREF THRU 6940-EXIT                          06140052
           IF GETXRF-RETURN-VALID                                       06150052
              GO TO 6820-EXIT                                           06160052
           END-IF.                                                      06170052
                                                                        06180052
           MOVE '050'                TO GETXRF-SEARCH-KEY (10:3)        06210052
           PERFORM 6940-GETXREF THRU 6940-EXIT                          06220052
           IF GETXRF-RETURN-VALID                                       06230052
              GO TO 6820-EXIT                                           06240052
           END-IF.                                                      06250052
                                                                        06260052
           MOVE '010'                TO GETXRF-SEARCH-KEY (10:3)        06290052
           PERFORM 6940-GETXREF THRU 6940-EXIT                          06300052
           IF GETXRF-RETURN-VALID                                       06310052
              GO TO 6820-EXIT                                           06320052
           END-IF.                                                      06330052
                                                                        06340052
           MOVE '020'                TO GETXRF-SEARCH-KEY (10:3)        06370052
           PERFORM 6940-GETXREF THRU 6940-EXIT                          06380052
           IF GETXRF-RETURN-VALID                                       06390052
              GO TO 6820-EXIT                                           06400052
           END-IF.                                                      06410052
                                                                        06420052
           MOVE '030'                TO GETXRF-SEARCH-KEY (10:3)        06450052
           PERFORM 6940-GETXREF THRU 6940-EXIT                          06460052
           IF GETXRF-RETURN-VALID                                       06470052
              GO TO 6820-EXIT                                           06480052
           END-IF.                                                      06490052
                                                                        06500052
           MOVE '000'                TO GETXRF-SEARCH-KEY (10:3)        06530052
           PERFORM 6940-GETXREF THRU 6940-EXIT                          06540052
           IF GETXRF-RETURN-VALID                                       06550052
              GO TO 6820-EXIT                                           06560052
           END-IF.                                                      06570052
                                                                        06580052
       6820-EXIT. EXIT.                                                 06590052
      /                                                                 06600052
       6830-REGISTERED-BOND.                                            06610052
                                                                        05440052
DJ0001     MOVE W-GETXRF-KEY-9       TO GETXRF-SEARCH-KEY (1:9)         05420052
                                                                        06620052
           MOVE '060'                TO GETXRF-SEARCH-KEY (10:3)        06650052
           PERFORM 6940-GETXREF THRU 6940-EXIT                          06660052
           IF GETXRF-RETURN-VALID                                       06670052
              GO TO 6830-EXIT                                           06680052
           END-IF.                                                      06690052
                                                                        06700052
           MOVE '020'                TO GETXRF-SEARCH-KEY (10:3)        06730052
           PERFORM 6940-GETXREF THRU 6940-EXIT                          06740052
           IF GETXRF-RETURN-VALID                                       06750052
              GO TO 6830-EXIT                                           06760052
           END-IF.                                                      06770052
                                                                        06780052
           MOVE '040'                TO GETXRF-SEARCH-KEY (10:3)        06810052
           PERFORM 6940-GETXREF THRU 6940-EXIT                          06820052
           IF GETXRF-RETURN-VALID                                       06830052
              GO TO 6830-EXIT                                           06840052
           END-IF.                                                      06850052
                                                                        06860052
           MOVE '050'                TO GETXRF-SEARCH-KEY (10:3)        06890052
           PERFORM 6940-GETXREF THRU 6940-EXIT                          06900052
           IF GETXRF-RETURN-VALID                                       06910052
              GO TO 6830-EXIT                                           06920052
           END-IF.                                                      06930052
                                                                        06940052
           MOVE '010'                TO GETXRF-SEARCH-KEY (10:3)        06970052
           PERFORM 6940-GETXREF THRU 6940-EXIT                          06980052
           IF GETXRF-RETURN-VALID                                       06990052
              GO TO 6830-EXIT                                           07000052
           END-IF.                                                      07010052
                                                                        07020052
           MOVE '000'                TO GETXRF-SEARCH-KEY (10:3)        07050052
           PERFORM 6940-GETXREF THRU 6940-EXIT                          07060052
           IF GETXRF-RETURN-VALID                                       07070052
              GO TO 6830-EXIT                                           07080052
           END-IF.                                                      07090052
                                                                        07100052
           MOVE '030'                TO GETXRF-SEARCH-KEY (10:3)        07130052
           IF GETXRF-RETURN-VALID                                       07140052
              GO TO 6830-EXIT                                           07150052
           END-IF.                                                      07160052
                                                                        07170052
       6830-EXIT. EXIT.                                                 07180052
                                                                        07190052
       6940-GETXREF.                                                    07200052
                                                                        07210052
           MOVE ' '          TO GETMSD-RETURN-CODE                      07220052
           MOVE ' '          TO GETXRF-RETURN-CODE                      07230052
           CALL GETXREF   USING GETXRF-CALLING-INFO.                    07240052
           EVALUATE TRUE                                                07250052
               WHEN  GETXRF-RETURN-VALID                                07260052
                                                                        07270052
                   MOVE LOW-VALUES       TO GETMSD-SEARCH-KEY-AREA      07280052
                   MOVE MSXREF-ADP-NO    TO GETMSD-SEARCH-KEY           07290052
                   MOVE ALL ZERO         TO GETMSD-WI-CODE              07300052
                   MOVE CLIENT-NBR OF DCLVASSET (2:3) TO W-CLIENT-X     07310052
                   MOVE W-CLIENT-NUM     TO GETMSD-CLIENT-PL2           07320052
DJ0001             PERFORM 6970-CALL-GETMSDC     THRU 6970-EXIT         04170027
                   ADD 1 TO W-MSD-FND-CNT                               07331062
                   MOVE MS-ADP-NO     TO SECURITY-ADP-NBR OF DCLVASSET  07340052
                                                                        07350052
               WHEN  GETXRF-RETURN-EOF                                  07360052
                 OR  GETXRF-INVALID-SYMBOL-CUSIP                        07370052
                 OR  GETXRF-RETURN-REC-NOT-FOUND                        07380052
                 OR  GETXRF-REQ-KEY-SECURITY-NO                         07390052
                   CONTINUE                                             07400052
                                                                        07410052
               WHEN  GETXRF-RETURN-IO-ERROR                             07420052
                     DISPLAY ' CAT527DB: CALL ZGETXRF ERROR'            07430052
                             ' GETXRF-RETURN-CODE='                     07440052
                               GETXRF-RETURN-CODE                       07450052
                     MOVE +3701    TO ABEND-CODE                        07460052
                     CALL ABEND USING ABEND-CODE                        07470052
               WHEN  OTHER                                              07480052
                   CONTINUE                                             07490052
           END-EVALUATE.                                                07500052
                                                                        07510052
       6940-EXIT. EXIT.                                                 07520052
      /                                                                 07520052
DJ0001 6970-CALL-GETMSDC           SECTION.                             07510052
DJ0001                                                                  07510052
DJ0001     MOVE 'N'  TO W-PRNGFL-SW                                     07510052
DJ0001     CALL GETMSDC USING MASTER-SECURITY-RECORD                    07510052
DJ0001     IF  GETMSD-RETURN-VALID                                      07510052
DJ0001         IF  SBMTG-PRTCP-NBR OF DCLVTRNFR =                       07510052
DJ0001             RCV-NBR         OF DCLVTRNFR                         07510052
DJ0001             PERFORM 6975-CHECK-PRNGFL     THRU 6975-EXIT         07510052
DJ0001         END-IF                                                   07510052
DJ0001     END-IF.                                                      07510052
DJ0001                                                                  07510052
DJ0001 6970-EXIT. EXIT.                                                 07510052
      /                                                                 07520052
DJ0001 6975-CHECK-PRNGFL           SECTION.                             07510052
DJ0001***IF PRIVATE RANGE FOUND THAT BELONGS TO SOMEONE ELSE,           07510052
DJ0001***SET GETMSD-RETURN-REC-NOT-FOUND TO TRUE                        07510052
DJ0001                                                                  07510052
DJ0001     MOVE SPACES                      TO PRNGREC                  07510052
DJ0001     MOVE MS-ADP-NO                   TO PRNGKEY                  07510052
DJ0001                                                                  07510052
DJ0001     START PRNGFL KEY NOT < PRNGKEY                               07510052
DJ0001                                                                  07510052
DJ0001     IF PRNGFL-OKAY                                               07510052
DJ0001        CONTINUE                                                  07510052
DJ0001     ELSE                                                         07510052
DJ0001       IF PRNGFL-END-OF-FILE                                      07510052
DJ0001       OR PRNGFL-NOT-FOUND                                        07510052
DJ0001          GO TO 6975-EXIT                                         07510052
DJ0001       ELSE                                                       07510052
DJ0001          DISPLAY 'CAT527DB - PRNGFL FILE, START BROWSE ERROR'    07510052
DJ0001                  ' FILE-STATUS = ' PRNGFL-STAT                   07510052
DJ0001          DISPLAY 'W-PRNGFL-KEY = ' MS-ADP-NO                     07510052
DJ0001          MOVE +3105    TO ABEND-CODE                             07510052
DJ0001          CALL ABEND USING ABEND-CODE                             07510052
DJ0001       END-IF                                                     07510052
DJ0001     END-IF.                                                      07510052
DJ0001                                                                  07510052
DJ0001 6975-READ-PRNGFL-NEXT.                                           07510052
DJ0001                                                                  07510052
DJ0001     READ PRNGFL NEXT RECORD.                                     07510052
DJ0001                                                                  07510052
DJ0001     IF PRNGFL-OKAY                                               07510052
DJ0001        CONTINUE                                                  07510052
DJ0001     ELSE                                                         07510052
DJ0001       IF PRNGFL-END-OF-FILE                                      07510052
DJ0001          GO TO 6975-EXIT                                         07510052
DJ0001       ELSE                                                       07510052
DJ0001          DISPLAY 'CAT527DB - PRNGFL FILE, READ NEXT ERROR'       07510052
DJ0001                  ' FILE-STATUS = ' PRNGFL-STAT                   07510052
DJ0001          DISPLAY 'W-PRNGFL-KEY = ' PRNGKEY                       07510052
DJ0001          MOVE +3106    TO ABEND-CODE                             07510052
DJ0001          CALL ABEND USING ABEND-CODE                             07510052
DJ0001       END-IF                                                     07510052
DJ0001     END-IF.                                                      07510052
DJ0001                                                                  07510052
DJ0001     EVALUATE TRUE                                                07510052
DJ0001         WHEN ((MS-ADP-NO < PRSECLO)                              07510052
DJ0001                    OR                                            07510052
DJ0001              (PRCLNT = '000' OR '096'))                          07510052
DJ0001              MOVE 'N' TO W-PRNGFL-SW                             07510052
DJ0001         WHEN OTHER                                               07510052
DJ0001           IF   PRCLNT   = W-CLIENT-X                             07510052
DJ0001             OR PRACLNT1 = W-CLIENT-X                             07510052
DJ0001             OR PRACLNT2 = W-CLIENT-X                             07510052
DJ0001             OR PRACLNT3 = W-CLIENT-X                             07510052
DJ0001             OR PRACLNT4 = W-CLIENT-X                             07510052
DJ0001             OR PRACLNT5 = W-CLIENT-X                             07510052
DJ0001             OR PRACLNT6 = W-CLIENT-X                             07510052
DJ0001             OR PRACLNT7 = W-CLIENT-X                             07510052
DJ0001               CONTINUE                                           07510052
DJ0001           ELSE                                                   07510052
DJ0001             MOVE 'Y'  TO W-PRNGFL-SW                             07510052
DJ0001             SET GETMSD-RETURN-REC-NOT-FOUND TO TRUE              07510052
DJ0001             DISPLAY    W-CLIENT-X                                07510052
DJ0001                    ' ' ACAT-CONTROL-NBR OF DCLVASSET             07510052
DJ0001                    ' ' ASSET-SEQ-NBR    OF DCLVASSET             07510052
DJ0001                      ' PRNGFL FOUND: SEC:' MS-ADP-NO             07510052
DJ0001                      ' CLT:' PRCLNT ' DESC:' MS-DESC1            07510052
DJ0001             DISPLAY '    GETMSD-KEY:' GETMSD-SEARCH-KEY          07510052
DJ0001                      ' SEC:' MS-ADP-NO                           07510052
DJ0001                     ' PRIVATE RANGE BELONGS TO CLT '  PRCLNT     07510052
DJ0001                     '. FLAG AS MSD NOT FOUND'                    07510052
DJ0001           END-IF                                                 07510052
DJ0001     END-EVALUATE.                                                07510052
DJ0001                                                                  07510052
DJ0001 6975-EXIT. EXIT.                                                 07510052
           EJECT                                                        07530052
      *****************                                                 07540052
       WRITE-DETAIL-RECORD-RTN.                                         07550052
      *****************                                                 07560052
                                                                        07570052
           MOVE CLIENT-NBR OF DCLVASSET TO FMT-TI-ADP-CL-NO.            07580007
           IF DSTBN-SIDE-CD OF DCLVTRNFR = 'R'                          07590000
              MOVE DLVR-NBR OF DCLVTRNFR TO FMT-CONTRA-BRK-NUM          07600012
              MOVE ACCT-RCV-NBR OF DCLVTRNFR TO FMT-TI-CUST-ACCOUNT     07610007
              MOVE ACCT-DLVR-NBR OF DCLVTRNFR TO FMT-CONTRA-ACCOUNT     07620014
              SET  FMT-CLNT-IS-RECEIVER TO TRUE                         07630012
           ELSE                                                         07640000
              MOVE RCV-NBR OF DCLVTRNFR TO FMT-CONTRA-BRK-NUM           07650012
              MOVE ACCT-DLVR-NBR OF DCLVTRNFR TO FMT-TI-CUST-ACCOUNT    07660007
              MOVE ACCT-RCV-NBR OF DCLVTRNFR TO FMT-CONTRA-ACCOUNT      07670014
              SET  FMT-CLNT-IS-DELIVERER TO TRUE                        07680012
           END-IF.                                                      07690000
******** THE FOLLOWING 6 LINES ADDED TO FLIP RECEIVER/DELIVERER         07700000
******** ON EXTRACT FOR 'RCL' AND 'FRV' TRANSACTIONS ONLY.              07710000
******** THESE HAVE AN OPPOSITE MEANING.                                07720000
           IF (TRNFR-TYPE-CD OF DCLVASSET = 'RCL' OR 'FRV')             07730000
              IF FMT-CLNT-IS-DELIVERER                                  07740014
                 SET  FMT-CLNT-IS-RECEIVER TO TRUE                      07750012
              ELSE                                                      07760000
                 SET  FMT-CLNT-IS-DELIVERER TO TRUE                     07770012
           END-IF.                                                      07780000
           MOVE ACAT-CONTROL-NBR OF DCLVASSET TO FMT-TI-CONTROL-NUM.    07790007
           MOVE ASSET-SEQ-NBR OF DCLVASSET TO FMT-ASSET-SEQ-NO-9.       07800000
                                                                        07810000
                                                                        07820000
           MOVE ISIN-CNTRY-CD     OF DCLVASSET TO FMT-CNTRY-CD.         07830033
           MOVE ISIN-SEC-ISSUE-CD OF DCLVASSET TO FMT-CUSIP-NUM.        07840000
           MOVE ISIN-SEC-CDG-CD   OF DCLVASSET TO FMT-CKDGT.            07850033
           MOVE STTLM-LCTN-CD     OF DCLVASSET TO FMT-STTLM-LCTN-CD.    07860000
           MOVE STTLM-RSN-CD      OF DCLVASSET TO FMT-STTLM-RSN-CD.     07870000
           MOVE PSTN-CD           OF DCLVASSET TO FMT-PSTN-CD.          07880000
                                                                        07890000
           MOVE ASSET-DESC-TXT OF DCLVASSET TO FMT-SEC-DESC.            07900016
                                                                        07910000
           MOVE BEARER-BOND-CD TO FMT-SEC-TYPE.                         07920000
           MOVE ASSET-PRC-CTGY-CD TO FMT-PRC-CTGY-CD.                   07930000
           MOVE OPTN-CTGY-CD      TO FMT-OPTION-CATEGORY.               07940032
           MOVE ASSET-QTY OF DCLVASSET TO FMT-ASSET-QTY-DEC             07950007
           MOVE ASSET-AMT OF DCLVASSET TO FMT-ASSET-AMT-DEC             07960007
           MOVE TRNFR-TYPE-RSN-CD OF DCLVASSET TO FMT-TRNFR-TYPE-RSN-CD.07970000
           MOVE CRT-TMSTP OF DCLVASSET TO FMT-CRT-TMSTP.                07980044
                                                                        07990000
           WRITE PEND-RECORD  FROM  FMT-RECORD.                         08000012
           ADD 1    TO  PENDFILE-REC-CNTR.                              08010000
                                                                        08020000
           EJECT                                                        08030006
      *******************                                               08040012
       SQL-ERROR-ROUTINE.                                               08050012
      *******************                                               08060012
                                                                        08070006
           MOVE SQLCODE      TO W-DB2-SQLCODE                           08080010
           DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                           08090010
                                                                        08100006
           CALL DSNTIAR               USING  SQLCA                      08110006
                                             WS-DB2-MESSAGE-AREA        08120006
                                             WS-ERR-LINE-LEN            08130006
                                                                        08140006
           DISPLAY ' '                                                  08150006
                                                                        08160006
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                   08170006
                UNTIL WS-ERROR-INDEX GREATER THAN 12                    08180006
                   IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES            08190006
                      DISPLAY '*** ' WS-ERROR-MSG (WS-ERROR-INDEX)      08200006
                   END-IF                                               08210006
           END-PERFORM                                                  08220006
                                                                        08230006
           DISPLAY ' '                                                  08240006
           DISPLAY '*** PROGRAM IS ABENDING'                            08250006
           DISPLAY ' '                                                  08260006
                                                                        08270006
           EXEC SQL  ROLLBACK  END-EXEC                                 08280006
           CALL ABEND USING ABEND-CODE                                  08290006
           .                                                            08300006
                                                                        08310000
           EJECT                                                        08320000
      ****************                                                  08330000
       ENDJOB-ROUTINE.                                                  08340000
      ****************                                                  08350000
                                                                        08360000
           CLOSE  PENDING-FILE                                          08370000
                                                                        08380000
           DISPLAY ' '                                                  08390000
           DISPLAY '   DB2 INPUT TOTALS'                                08400000
           DISPLAY '   -----------------'                               08410000
           DISPLAY 'NUMBER OF TI RECORDS: ' WS-TOTAL-TI-REC-CNTR        08420000
           DISPLAY 'NUMBER OF AT RECORDS: ' WS-TOTAL-AT-REC-CNTR        08430000
           DISPLAY 'NUMBER OF MSD FOUND   ' W-MSD-FND-CNT               08440019
           DISPLAY 'NUMBER OF MSD NOTFND  ' W-MSD-NOTFND-CNT            08450019
           DISPLAY ' '                                                  08460000
           DISPLAY 'PEND FILE RECORDS   : ' PENDFILE-REC-CNTR           08470000
                                                                        08480000
           DISPLAY ' '                                                  08490000
           DISPLAY '***************************'                        08500000
           DISPLAY '* END OF CAT527DB PROGRAM *'                        08510000
           DISPLAY '***************************'                        08520000
           DISPLAY ' '.                                                 08530000
