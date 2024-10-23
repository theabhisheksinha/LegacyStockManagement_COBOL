000001* PDX    - ACAT34DB C0179244 10/08/02 11:12:54 TBEDTAK            00001000
       IDENTIFICATION DIVISION.                                         ACAT34DB
       PROGRAM-ID.    ACAT34DB.                                         ACAT34DB
       AUTHOR.  E.TAKAESU.                                              ACAT34DB
      *REMARKS.                                                         ACAT34DB
      ***************************************************************** ACAT34DB
      *   DB2 I/O PROGRAM FOR PROCESSING ACATS RESCIND/BLOCK ACCOUNT  * ACAT34DB
      ***************************************************************** ACAT34DB
      * DATABASE: VRSDBLK (RESCIND/BLOCK ACCOUNT)                     * ACAT34DB
      *           VACTRBHY (HISTORY RESCIND/BLOCK ACCOUNT)            * ACAT34DB
      ***************************************************************** ACAT34DB
       ENVIRONMENT DIVISION.                                            ACAT34DB
       DATA DIVISION.                                                   ACAT34DB
       WORKING-STORAGE SECTION.                                         ACAT34DB
       COPY PDXIDCOB.                                                   ACAT34DB
      *                                                                 ACAT34DB
       77  WS-ACATSRCH                      PIC X(08) VALUE 'ACATSRCH'. ACAT34DB
      *                                                                 ACAT34DB
       01  WS-WORK-AREA.                                                ACAT34DB
           03  WS-TIMESTAMP                 PIC X(26).                  ACAT34DB
           03  WS-ROW-COUNT                 PIC S9(9) COMP.             ACAT34DB
           03  WS-CLIENT                    PIC X(04).                  ACAT34DB
           03  WS-SECURITY                  PIC X(09).                  ACAT34DB
           03  WS-FINAL-FETCH-CSR-SW        PIC X(01) VALUE SPACE.      ACAT34DB
               88 WS-FINAL-FETCH-CSR                  VALUE 'Y'.        ACAT34DB
           03  WS-EIBCALEN                  COMP PIC S9(4).             ACAT34DB
       01  WS-ERR-DATA.                                                 ACAT34DB
           03  WS-REQUEST-TYPE              PIC X(01).                  ACAT34DB
               88  WS-WRITE-ERROR-TO-LOG              VALUE 'Y'.        ACAT34DB
           03  CALLING-TRAN-ID              PIC X(04).                  ACAT34DB
           03  CALLING-PROGRAM-ID           PIC X(08).                  ACAT34DB
           03  SQLCA-AREA                   PIC X(136).                 ACAT34DB
       EJECT                                                            ACAT34DB
       01  WS-COMMAREA.                                                 ACAT34DB
           COPY ACAT34IO.                                               ACAT34DB
       EJECT                                                            ACAT34DB
           COPY ACATSRCH.                                               ACAT34DB
       EJECT                                                            ACAT34DB
      *                                                                 ACAT34DB
      *----------------------------------------------------------------*ACAT34DB
      *            RESCIND/BLOCK FILE TABLE                            *ACAT34DB
      *----------------------------------------------------------------*ACAT34DB
           EXEC SQL                                                     ACAT34DB
              INCLUDE VRSDBLK                                           ACAT34DB
           END-EXEC.                                                    ACAT34DB
       EJECT                                                            ACAT34DB
      *                                                                 ACAT34DB
      *----------------------------------------------------------------*ACAT34DB
      *           HISTORY  RESCIND/BLOCK FILE TABLE                    *ACAT34DB
      *----------------------------------------------------------------*ACAT34DB
           EXEC SQL                                                     ACAT34DB
              INCLUDE VACTRBHY                                          ACAT34DB
           END-EXEC.                                                    ACAT34DB
       EJECT                                                            ACAT34DB
      *                                                                 ACAT34DB
      *----------------------------------------------------------------*ACAT34DB
      *    SQL COMMUNICATION AREA                                      *ACAT34DB
      *----------------------------------------------------------------*ACAT34DB
           EXEC SQL                                                     ACAT34DB
              INCLUDE SQLCA                                             ACAT34DB
           END-EXEC.                                                    ACAT34DB
       EJECT                                                            ACAT34DB
      *                                                                 ACAT34DB
      *----------------------------------------------------------------*ACAT34DB
      *    RESCIND FILE TABLE DECLARE CURSOR STATEMENT                 *ACAT34DB
      *----------------------------------------------------------------*ACAT34DB
           EXEC SQL                                                     ACAT34DB
              DECLARE  RSNDCSR CURSOR FOR                               ACAT34DB
                  SELECT                                                ACAT34DB
                     CLIENT_NBR                                         ACAT34DB
                    ,BRANCH_CD                                          ACAT34DB
                    ,ACCT_CD                                            ACAT34DB
                    ,BLOCK_CD                                           ACAT34DB
                    ,CMNT_TXT                                           ACAT34DB
                    ,PRGM_NM                                            ACAT34DB
                    ,RCV_NBR                                            ACAT34DB
                    ,DLVR_NBR                                           ACAT34DB
                    ,CICS_TERM_ID_CD                                    ACAT34DB
                    ,CRT_TMSTP                                          ACAT34DB
                    ,UPDT_TMSTP                                         ACAT34DB
                    ,ISIN_SEC_ISSUE_CD                                  ACAT34DB
                    ,SECURITY_ADP_NBR                                   ACAT34DB
                    ,EXPIRE_DT                                          ACAT34DB
                    ,ACTION_CD                                          ACAT34DB
                    ,CICS_SNON_ID                                       ACAT34DB
                  FROM                                                  ACAT34DB
                     VRSDBLK                                            ACAT34DB
                  WHERE                                                 ACAT34DB
                     CLIENT_NBR = :ACAT34-PASS-CLT                      ACAT34DB
                     AND (BRANCH_CD > :ACAT34-PASS-BR-FROM              ACAT34DB
                          OR (BRANCH_CD = :ACAT34-PASS-BR-FROM  AND     ACAT34DB
                              ACCT_CD >= :ACAT34-PASS-ACCT))            ACAT34DB
                     AND (ACTION_CD ^= 'D')                             ACAT34DB
                  ORDER BY                                              ACAT34DB
                     CLIENT_NBR                                         ACAT34DB
                    ,BRANCH_CD                                          ACAT34DB
                    ,ACCT_CD                                            ACAT34DB
                    ,BLOCK_CD                                           ACAT34DB
                    ,RCV_NBR                                            ACAT34DB
                    ,ISIN_SEC_ISSUE_CD                                  ACAT34DB
           END-EXEC.                                                    ACAT34DB
      *                                                                 ACAT34DB
      *----------------------------------------------------------------*ACAT34DB
      *    RESCIND ACCT DECLARE CURSOR STATEMENT IN DESCENDING ORDER   *ACAT34DB
      *----------------------------------------------------------------*ACAT34DB
           EXEC SQL                                                     ACAT34DB
              DECLARE  RSNDCSR_DESC CURSOR FOR                          ACAT34DB
                  SELECT                                                ACAT34DB
                     CLIENT_NBR                                         ACAT34DB
                    ,BRANCH_CD                                          ACAT34DB
                    ,ACCT_CD                                            ACAT34DB
                    ,BLOCK_CD                                           ACAT34DB
                    ,CMNT_TXT                                           ACAT34DB
                    ,PRGM_NM                                            ACAT34DB
                    ,RCV_NBR                                            ACAT34DB
                    ,DLVR_NBR                                           ACAT34DB
                    ,CICS_TERM_ID_CD                                    ACAT34DB
                    ,CRT_TMSTP                                          ACAT34DB
                    ,UPDT_TMSTP                                         ACAT34DB
                    ,ISIN_SEC_ISSUE_CD                                  ACAT34DB
                    ,SECURITY_ADP_NBR                                   ACAT34DB
                    ,EXPIRE_DT                                          ACAT34DB
                    ,ACTION_CD                                          ACAT34DB
                    ,CICS_SNON_ID                                       ACAT34DB
                  FROM                                                  ACAT34DB
                     VRSDBLK                                            ACAT34DB
                  WHERE                                                 ACAT34DB
                     CLIENT_NBR = :ACAT34-PASS-CLT                      ACAT34DB
                     AND (BRANCH_CD > :ACAT34-PASS-BR-FROM              ACAT34DB
                          OR (BRANCH_CD = :ACAT34-PASS-BR-FROM  AND     ACAT34DB
                              ACCT_CD >= :ACAT34-PASS-ACCT))            ACAT34DB
                     AND (ACTION_CD ^= 'D')                             ACAT34DB
                  ORDER BY                                              ACAT34DB
                     CLIENT_NBR         DESC                            ACAT34DB
                    ,BRANCH_CD          DESC                            ACAT34DB
                    ,ACCT_CD            DESC                            ACAT34DB
                    ,BLOCK_CD           DESC                            ACAT34DB
                    ,RCV_NBR            DESC                            ACAT34DB
                    ,ISIN_SEC_ISSUE_CD  DESC                            ACAT34DB
           END-EXEC.                                                    ACAT34DB
      *                                                                 ACAT34DB
      *----------------------------------------------------------------*ACAT34DB
      *    HISTORY RESCIND FILE TABLE DECLARE CURSOR STATEMENT         *ACAT34DB
      *----------------------------------------------------------------*ACAT34DB
           EXEC SQL                                                     ACAT34DB
              DECLARE  HSTRSD_CSR CURSOR FOR                            ACAT34DB
                  SELECT                                                ACAT34DB
                     CLIENT_NBR                                         ACAT34DB
                    ,BRANCH_CD                                          ACAT34DB
                    ,ACCT_CD                                            ACAT34DB
                    ,BLOCK_CD                                           ACAT34DB
                    ,CMNT_TXT                                           ACAT34DB
                    ,PRGM_NM                                            ACAT34DB
                    ,RCV_NBR                                            ACAT34DB
                    ,DLVR_NBR                                           ACAT34DB
                    ,CICS_TERM_ID_CD                                    ACAT34DB
                    ,CRT_TMSTP                                          ACAT34DB
                    ,UPDT_TMSTP                                         ACAT34DB
                    ,ISIN_SEC_ISSUE_CD                                  ACAT34DB
                    ,SECURITY_ADP_NBR                                   ACAT34DB
                    ,EXPIRE_DT                                          ACAT34DB
                    ,ACTION_CD                                          ACAT34DB
                    ,CICS_SNON_ID                                       ACAT34DB
                    ,HSTRY_SEQ_NBR                                      ACAT34DB
                  FROM                                                  ACAT34DB
                     VACTRBHY                                           ACAT34DB
                  WHERE                                                 ACAT34DB
                     CLIENT_NBR = :ACAT34-PASS-CLT                      ACAT34DB
                     AND ((BRANCH_CD > :ACAT34-PASS-BR-FROM             ACAT34DB
                              AND  BRANCH_CD < :ACAT34-PASS-BR-TO)      ACAT34DB
                          OR (BRANCH_CD = :ACAT34-PASS-BR-FROM AND      ACAT34DB
                              ACCT_CD >= :ACAT34-PASS-ACCT))            ACAT34DB
                  ORDER BY                                              ACAT34DB
                     CLIENT_NBR                                         ACAT34DB
                    ,BRANCH_CD                                          ACAT34DB
                    ,ACCT_CD                                            ACAT34DB
                    ,BLOCK_CD                                           ACAT34DB
                    ,RCV_NBR                                            ACAT34DB
                    ,ISIN_SEC_ISSUE_CD                                  ACAT34DB
                    ,HSTRY_SEQ_NBR                                      ACAT34DB
           END-EXEC.                                                    ACAT34DB
      *                                                                 ACAT34DB
      *----------------------------------------------------------------*ACAT34DB
      *    HISTORY RSND FILE TBL DECLARE CSR STATEMENT IN DESC ORDER   *ACAT34DB
      *----------------------------------------------------------------*ACAT34DB
           EXEC SQL                                                     ACAT34DB
              DECLARE  HSTRSD_DESC CURSOR FOR                           ACAT34DB
                  SELECT                                                ACAT34DB
                     CLIENT_NBR                                         ACAT34DB
                    ,BRANCH_CD                                          ACAT34DB
                    ,ACCT_CD                                            ACAT34DB
                    ,BLOCK_CD                                           ACAT34DB
                    ,CMNT_TXT                                           ACAT34DB
                    ,PRGM_NM                                            ACAT34DB
                    ,RCV_NBR                                            ACAT34DB
                    ,DLVR_NBR                                           ACAT34DB
                    ,CICS_TERM_ID_CD                                    ACAT34DB
                    ,CRT_TMSTP                                          ACAT34DB
                    ,UPDT_TMSTP                                         ACAT34DB
                    ,ISIN_SEC_ISSUE_CD                                  ACAT34DB
                    ,SECURITY_ADP_NBR                                   ACAT34DB
                    ,EXPIRE_DT                                          ACAT34DB
                    ,ACTION_CD                                          ACAT34DB
                    ,CICS_SNON_ID                                       ACAT34DB
                    ,HSTRY_SEQ_NBR                                      ACAT34DB
                  FROM                                                  ACAT34DB
                     VACTRBHY                                           ACAT34DB
                  WHERE                                                 ACAT34DB
                     CLIENT_NBR = :ACAT34-PASS-CLT                      ACAT34DB
                     AND ((BRANCH_CD > :ACAT34-FETCH-BR-FROM            ACAT34DB
                                   AND  BRANCH_CD < :ACAT34-PASS-BR-TO) ACAT34DB
                          OR (BRANCH_CD = :ACAT34-FETCH-BR-FROM AND     ACAT34DB
                              ACCT_CD >= :ACAT34-PASS-ACCT))            ACAT34DB
                  ORDER BY                                              ACAT34DB
                     CLIENT_NBR         DESC                            ACAT34DB
                    ,BRANCH_CD          DESC                            ACAT34DB
                    ,ACCT_CD            DESC                            ACAT34DB
                    ,BLOCK_CD           DESC                            ACAT34DB
                    ,RCV_NBR            DESC                            ACAT34DB
                    ,ISIN_SEC_ISSUE_CD  DESC                            ACAT34DB
                    ,HSTRY_SEQ_NBR      DESC                            ACAT34DB
           END-EXEC.                                                    ACAT34DB
      *                                                                 ACAT34DB
       LINKAGE SECTION.                                                 ACAT34DB
       01  DFHCOMMAREA.                                                 ACAT34DB
           05  FILLER            PIC X(500).                            ACAT34DB
       EJECT                                                            ACAT34DB
      *                                                                 ACAT34DB
       PROCEDURE DIVISION.                                              ACAT34DB
           MOVE ZEROES TO WS-ROW-COUNT.                                 ACAT34DB
           MOVE EIBCALEN TO WS-EIBCALEN.                                ACAT34DB
           MOVE SPACE TO ACAT34-RET-COLUMS.                             ACAT34DB
           IF EIBCALEN > ZERO                                           ACAT34DB
              MOVE DFHCOMMAREA TO WS-COMMAREA                           ACAT34DB
           ELSE                                                         ACAT34DB
              EXEC CICS RETURN END-EXEC                                 ACAT34DB
           END-IF.                                                      ACAT34DB
      *                                                                 ACAT34DB
           EXEC SQL                                                     ACAT34DB
              SET :WS-TIMESTAMP = CURRENT TIMESTAMP                     ACAT34DB
           END-EXEC.                                                    ACAT34DB
      *                                                                 ACAT34DB
           EVALUATE TRUE                                                ACAT34DB
              WHEN ACAT34-OPN-RSND-CSR                                  ACAT34DB
                   PERFORM 0100-OPEN-RESCIND-CSR                        ACAT34DB
              WHEN ACAT34-FET-RSND-CSR                                  ACAT34DB
                   PERFORM 0200-FETCH-RESCIND-CSR                       ACAT34DB
                       UNTIL SRCH-SIGNON-SECR-CHECK-PASS                ACAT34DB
                          OR ACAT34-NOT-FOUND                           ACAT34DB
                          OR ACAT34-ERROR                               ACAT34DB
              WHEN ACAT34-CLO-RSND-CSR                                  ACAT34DB
                   PERFORM 0300-CLOSE-RESCIND-CSR                       ACAT34DB
              WHEN ACAT34-OPN-RSND-CSR-DESC                             ACAT34DB
                   PERFORM 0400-OPEN-RSND-CSR-DESC                      ACAT34DB
              WHEN ACAT34-FET-RSND-CSR-DESC                             ACAT34DB
                   PERFORM 0500-FETCH-RSND-CSR-DESC                     ACAT34DB
                       UNTIL SRCH-SIGNON-SECR-CHECK-PASS                ACAT34DB
                          OR ACAT34-NOT-FOUND                           ACAT34DB
                          OR ACAT34-ERROR                               ACAT34DB
              WHEN ACAT34-CLO-RSND-CSR-DESC                             ACAT34DB
                   PERFORM 0600-CLOSE-RSND-CSR-DESC                     ACAT34DB
              WHEN ACAT34-INS-RSND-TBL                                  ACAT34DB
                   PERFORM 0700-ADD-RESCIND                             ACAT34DB
              WHEN ACAT34-UPD-RSND-TBL                                  ACAT34DB
                   PERFORM 0800-UPDATE-RESCIND                          ACAT34DB
              WHEN ACAT34-UPD-DELETED-RSND                              ACAT34DB
                   PERFORM 0900-UPDATE-DELETED-RESCIND                  ACAT34DB
              WHEN ACAT34-UPD-RSND-TO-DEL                               ACAT34DB
                   PERFORM 1000-UPDATE-RESCIND-TO-DEL                   ACAT34DB
              WHEN ACAT34-DEL-RSND-TBL                                  ACAT34DB
                   PERFORM 1100-DELETE-RESCIND                          ACAT34DB
              WHEN ACAT34-GET-RSND-TBL                                  ACAT34DB
                   PERFORM 1200-GET-RESCIND-TBL                         ACAT34DB
              WHEN ACAT34-FND-LEGAL-BLCKCD                              ACAT34DB
                   PERFORM 1300-FIND-LEGAL-BLCKCD                       ACAT34DB
              WHEN ACAT34-FND-RSND-BLCKCD                               ACAT34DB
                   PERFORM 1400-FIND-RESCIND-BLCKCD                     ACAT34DB
              WHEN ACAT34-FND-SEC-BLCKCD                                ACAT34DB
                   PERFORM 1500-FIND-SECURITY-BLCKCD                    ACAT34DB
              WHEN ACAT34-FND-ACTION-CD                                 ACAT34DB
                   PERFORM 1600-FIND-ACTION-CODE                        ACAT34DB
              WHEN ACAT34-OPN-HIST-CSR                                  ACAT34IO
                   PERFORM 1700-OPEN-HIST-CSR                           ACAT34DB
              WHEN ACAT34-FET-HIST-CSR                                  ACAT34IO
                   PERFORM 1800-FETCH-HIST-CSR                          ACAT34DB
                       UNTIL SRCH-SIGNON-SECR-CHECK-PASS                ACAT34DB
                          OR ACAT34-NOT-FOUND                           ACAT34DB
                          OR ACAT34-ERROR                               ACAT34DB
              WHEN ACAT34-CLO-HIST-CSR                                  ACAT34IO
                   PERFORM 1900-CLOSE-HIST-CSR                          ACAT34DB
              WHEN ACAT34-OPN-HIST-CSR-DESC                             ACAT34IO
                   PERFORM 2000-OPEN-HIST-CSR-DESC                      ACAT34DB
              WHEN ACAT34-FET-HIST-CSR-DESC                             ACAT34IO
                   PERFORM 2100-FETCH-HIST-CSR-DESC                     ACAT34DB
                       UNTIL SRCH-SIGNON-SECR-CHECK-PASS                ACAT34DB
                          OR ACAT34-NOT-FOUND                           ACAT34DB
                          OR ACAT34-ERROR                               ACAT34DB
              WHEN ACAT34-CLO-HIST-CSR-DESC                             ACAT34IO
                   PERFORM 2200-CLOSE-HIST-CSR-DESC                     ACAT34DB
              WHEN OTHER                                                ACAT34DB
                   CONTINUE                                             ACAT34DB
           END-EVALUATE.                                                ACAT34DB
                                                                        ACAT34DB
           MOVE WS-COMMAREA TO DFHCOMMAREA (1:WS-EIBCALEN).             ACAT34DB
           EXEC CICS RETURN                                             ACAT34DB
           END-EXEC.                                                    ACAT34DB
       EJECT                                                            ACAT34DB
      *                                                                 ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
      *         OPEN RESCIND/BLOCK CURSOR TABLE                      *  ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
       0100-OPEN-RESCIND-CSR.                                           ACAT34DB
           EXEC SQL                                                     ACAT34DB
              OPEN RSNDCSR                                              ACAT34DB
           END-EXEC.                                                    ACAT34DB
           IF SQLCODE = 0                                               ACAT34DB
              SET ACAT34-NORMAL  TO TRUE                                ACAT34DB
           ELSE                                                         ACAT34DB
              SET ACAT34-ERROR  TO TRUE                                 ACAT34DB
              MOVE SQLCODE  TO ACAT34-SQLCODE                           ACAT34DB
              PERFORM 9999-DB2-ERROR.                                   ACAT34DB
      *                                                                 ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
      *        FETCH RESCIND/BLOCK CURSOR TABLE                      *  ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
       0200-FETCH-RESCIND-CSR.                                          ACAT34DB
           EXEC SQL                                                     ACAT34DB
              FETCH                                                     ACAT34DB
                  RSNDCSR                                               ACAT34DB
              INTO                                                      ACAT34DB
                 :DCLVRSDBLK.CLIENT-NBR                                 ACAT34DB
                ,:DCLVRSDBLK.BRANCH-CD                                  ACAT34DB
                ,:DCLVRSDBLK.ACCT-CD                                    ACAT34DB
                ,:DCLVRSDBLK.BLOCK-CD                                   ACAT34DB
                ,:DCLVRSDBLK.CMNT-TXT                                   ACAT34DB
                ,:DCLVRSDBLK.PRGM-NM                                    ACAT34DB
                ,:DCLVRSDBLK.RCV-NBR                                    ACAT34DB
                ,:DCLVRSDBLK.DLVR-NBR                                   ACAT34DB
                ,:DCLVRSDBLK.CICS-TERM-ID-CD                            ACAT34DB
                ,:DCLVRSDBLK.CRT-TMSTP                                  ACAT34DB
                ,:DCLVRSDBLK.UPDT-TMSTP                                 ACAT34DB
                ,:DCLVRSDBLK.ISIN-SEC-ISSUE-CD                          ACAT34DB
                ,:DCLVRSDBLK.SECURITY-ADP-NBR                           ACAT34DB
                ,:DCLVRSDBLK.EXPIRE-DT                                  ACAT34DB
                ,:DCLVRSDBLK.ACTION-CD                                  ACAT34DB
                ,:DCLVRSDBLK.CICS-SNON-ID                               ACAT34DB
           END-EXEC.                                                    ACAT34DB
           IF SQLCODE = 0                                               ACAT34DB
              MOVE BRANCH-CD OF DCLVRSDBLK TO SRCH-INP-BRANCH           ACAT34DB
              PERFORM 5000-SECURITY-CHECK-BY-BRANCH                     ACAT34DB
              IF SRCH-SIGNON-SECR-CHECK-PASS                            ACAT34DB
                 SET ACAT34-NORMAL  TO TRUE                             ACAT34DB
                 PERFORM 4000-SETUP-RETURN-FIELDS                       ACAT34DB
              END-IF                                                    ACAT34DB
           ELSE                                                         ACAT34DB
           IF SQLCODE = +100                                            ACAT34DB
              SET ACAT34-NOT-FOUND TO TRUE                              ACAT34DB
           ELSE                                                         ACAT34DB
              SET ACAT34-ERROR  TO TRUE                                 ACAT34DB
              MOVE SQLCODE  TO ACAT34-SQLCODE                           ACAT34DB
              PERFORM 9999-DB2-ERROR.                                   ACAT34DB
       EJECT                                                            ACAT34DB
      *                                                                 ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
      *        CLOSE RESCIND/BLOCK CURSOR TABLE                      *  ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
       0300-CLOSE-RESCIND-CSR.                                          ACAT34DB
           EXEC SQL                                                     ACAT34DB
              CLOSE RSNDCSR                                             ACAT34DB
           END-EXEC.                                                    ACAT34DB
           IF SQLCODE = 0                                               ACAT34DB
              SET ACAT34-NORMAL  TO TRUE                                ACAT34DB
           ELSE                                                         ACAT34DB
              SET ACAT34-ERROR  TO TRUE                                 ACAT34DB
              MOVE SQLCODE  TO ACAT34-SQLCODE                           ACAT34DB
              PERFORM 9999-DB2-ERROR.                                   ACAT34DB
      *                                                                 ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
      *    OPEN RESCIND/BLOCK CURSOR TABLE IN DESCENDING ORDER       *  ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
       0400-OPEN-RSND-CSR-DESC.                                         ACAT34DB
           EXEC SQL                                                     ACAT34DB
              OPEN RSNDCSR_DESC                                         ACAT34DB
           END-EXEC.                                                    ACAT34DB
           IF SQLCODE = 0                                               ACAT34DB
              SET ACAT34-NORMAL  TO TRUE                                ACAT34DB
           ELSE                                                         ACAT34DB
              SET ACAT34-ERROR  TO TRUE                                 ACAT34DB
              MOVE SQLCODE  TO ACAT34-SQLCODE                           ACAT34DB
              PERFORM 9999-DB2-ERROR.                                   ACAT34DB
      *                                                                 ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
      *   FETCH RESCIND/BLOCK CURSOR TABLE IN DESCENDING ORDER       *  ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
       0500-FETCH-RSND-CSR-DESC.                                        ACAT34DB
           EXEC SQL                                                     ACAT34DB
              FETCH                                                     ACAT34DB
                  RSNDCSR_DESC                                          ACAT34DB
              INTO                                                      ACAT34DB
                 :DCLVRSDBLK.CLIENT-NBR                                 ACAT34DB
                ,:DCLVRSDBLK.BRANCH-CD                                  ACAT34DB
                ,:DCLVRSDBLK.ACCT-CD                                    ACAT34DB
                ,:DCLVRSDBLK.BLOCK-CD                                   ACAT34DB
                ,:DCLVRSDBLK.CMNT-TXT                                   ACAT34DB
                ,:DCLVRSDBLK.PRGM-NM                                    ACAT34DB
                ,:DCLVRSDBLK.RCV-NBR                                    ACAT34DB
                ,:DCLVRSDBLK.DLVR-NBR                                   ACAT34DB
                ,:DCLVRSDBLK.CICS-TERM-ID-CD                            ACAT34DB
                ,:DCLVRSDBLK.CRT-TMSTP                                  ACAT34DB
                ,:DCLVRSDBLK.UPDT-TMSTP                                 ACAT34DB
                ,:DCLVRSDBLK.ISIN-SEC-ISSUE-CD                          ACAT34DB
                ,:DCLVRSDBLK.SECURITY-ADP-NBR                           ACAT34DB
                ,:DCLVRSDBLK.EXPIRE-DT                                  ACAT34DB
                ,:DCLVRSDBLK.ACTION-CD                                  ACAT34DB
                ,:DCLVRSDBLK.CICS-SNON-ID                               ACAT34DB
           END-EXEC.                                                    ACAT34DB
           IF SQLCODE = 0                                               ACAT34DB
              MOVE BRANCH-CD OF DCLVRSDBLK TO SRCH-INP-BRANCH           ACAT34DB
              PERFORM 5000-SECURITY-CHECK-BY-BRANCH                     ACAT34DB
              IF SRCH-SIGNON-SECR-CHECK-PASS                            ACAT34DB
                 SET ACAT34-NORMAL  TO TRUE                             ACAT34DB
                 PERFORM 4000-SETUP-RETURN-FIELDS                       ACAT34DB
              END-IF                                                    ACAT34DB
           ELSE                                                         ACAT34DB
           IF SQLCODE = +100                                            ACAT34DB
              SET ACAT34-NOT-FOUND TO TRUE                              ACAT34DB
           ELSE                                                         ACAT34DB
              SET ACAT34-ERROR  TO TRUE                                 ACAT34DB
              MOVE SQLCODE  TO ACAT34-SQLCODE                           ACAT34DB
              PERFORM 9999-DB2-ERROR.                                   ACAT34DB
      *                                                                 ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
      *   CLOSE RESCIND/BLOCK CURSOR TABLE IN DESCENDING ORDER       *  ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
       0600-CLOSE-RSND-CSR-DESC.                                        ACAT34DB
           EXEC SQL                                                     ACAT34DB
              CLOSE RSNDCSR_DESC                                        ACAT34DB
           END-EXEC.                                                    ACAT34DB
           IF SQLCODE = 0                                               ACAT34DB
              SET ACAT34-NORMAL  TO TRUE                                ACAT34DB
           ELSE                                                         ACAT34DB
              SET ACAT34-ERROR  TO TRUE                                 ACAT34DB
              MOVE SQLCODE  TO ACAT34-SQLCODE                           ACAT34DB
              PERFORM 9999-DB2-ERROR.                                   ACAT34DB
      *                                                                 ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
      *      INSERT RESCIND/BLOCK FILE TABLE ROWS                    *  ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
       0700-ADD-RESCIND.                                                ACAT34DB
           MOVE SPACE TO DCLVRSDBLK.                                    ACAT34DB
           EXEC SQL                                                     ACAT34DB
              INSERT INTO VRSDBLK                                       ACAT34DB
                 ( CLIENT_NBR                                           ACAT34DB
                  ,BRANCH_CD                                            ACAT34DB
                  ,ACCT_CD                                              ACAT34DB
                  ,BLOCK_CD                                             ACAT34DB
                  ,CMNT_TXT                                             ACAT34DB
                  ,PRGM_NM                                              ACAT34DB
                  ,RCV_NBR                                              ACAT34DB
                  ,DLVR_NBR                                             ACAT34DB
                  ,CICS_TERM_ID_CD                                      ACAT34DB
                  ,CRT_TMSTP                                            ACAT34DB
                  ,UPDT_TMSTP                                           ACAT34DB
                  ,ISIN_SEC_ISSUE_CD                                    ACAT34DB
                  ,SECURITY_ADP_NBR                                     ACAT34DB
                  ,EXPIRE_DT                                            ACAT34DB
                  ,ACTION_CD                                            ACAT34DB
                  ,CICS_SNON_ID )                                       ACAT34DB
              VALUES                                                    ACAT34DB
                 ( :ACAT34-PASS-CLT                                     ACAT34DB
                  ,:ACAT34-PASS-BR                                      ACAT34DB
                  ,:ACAT34-PASS-ACCT                                    ACAT34DB
                  ,:ACAT34-PASS-BLCKCD                                  ACAT34DB
                  ,:ACAT34-PASS-CMNT                                    ACAT34DB
                  ,'ACAT34DB'                                           ACAT34DB
                  ,:ACAT34-PASS-RCV-NUM                                 ACAT34DB
                  ,:ACAT34-PASS-DLV-NUM                                 ACAT34DB
                  ,:ACAT34-PASS-TERMID                                  ACAT34DB
                  ,:WS-TIMESTAMP                                        ACAT34DB
                  ,:WS-TIMESTAMP                                        ACAT34DB
                  ,:ACAT34-PASS-SEC                                     ACAT34DB
                  ,:ACAT34-PASS-ADP-NBR                                 ACAT34DB
                  ,:ACAT34-PASS-EXP-DATE                                ACAT34DB
                  ,:ACAT34-PASS-ACT-CD                                  ACAT34DB
                  ,:ACAT34-PASS-SNON-ID )                               ACAT34DB
           END-EXEC.                                                    ACAT34DB
           IF SQLCODE = 0                                               ACAT34DB
              SET ACAT34-NORMAL  TO TRUE                                ACAT34DB
           ELSE                                                         ACAT34DB
              SET ACAT34-ERROR  TO TRUE                                 ACAT34DB
              MOVE SQLCODE  TO ACAT34-SQLCODE                           ACAT34DB
              PERFORM 9999-DB2-ERROR.                                   ACAT34DB
      *                                                                 ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
      *       UPDATE RESCIND/BLOCK FILE TABLE ROWS                   *  ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
       0800-UPDATE-RESCIND.                                             ACAT34DB
           EXEC SQL                                                     ACAT34DB
             UPDATE VRSDBLK                                             ACAT34DB
                SET CMNT_TXT          = :ACAT34-PASS-CMNT               ACAT34DB
                   ,CICS_TERM_ID_CD   = :ACAT34-PASS-TERMID             ACAT34DB
                   ,UPDT_TMSTP        = :WS-TIMESTAMP                   ACAT34DB
                   ,EXPIRE_DT         = :ACAT34-PASS-EXP-DATE           ACAT34DB
                   ,CICS_SNON_ID      = :ACAT34-PASS-SNON-ID            ACAT34DB
              WHERE CLIENT_NBR        = :ACAT34-PASS-CLT                ACAT34DB
                AND BRANCH_CD         = :ACAT34-PASS-BR                 ACAT34DB
                AND ACCT_CD           = :ACAT34-PASS-ACCT               ACAT34DB
                AND BLOCK_CD          = :ACAT34-PASS-BLCKCD             ACAT34DB
                AND RCV_NBR           = :ACAT34-PASS-RCV-NUM            ACAT34DB
                AND ISIN_SEC_ISSUE_CD = :ACAT34-PASS-SEC                ACAT34DB
           END-EXEC.                                                    ACAT34DB
           IF SQLCODE = 0                                               ACAT34DB
              SET ACAT34-NORMAL  TO TRUE                                ACAT34DB
           ELSE                                                         ACAT34DB
              SET ACAT34-ERROR  TO TRUE                                 ACAT34DB
              MOVE SQLCODE  TO ACAT34-SQLCODE                           ACAT34DB
              PERFORM 9999-DB2-ERROR.                                   ACAT34DB
       EJECT                                                            ACAT34DB
      *                                                                 ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
      * RESURRECT THE DELETED (ACTION_CD = D) ACCOUNT, AND UPDATE IT *  ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
       0900-UPDATE-DELETED-RESCIND.                                     ACAT34DB
           EXEC SQL                                                     ACAT34DB
             UPDATE VRSDBLK                                             ACAT34DB
                SET BRANCH_CD         = :ACAT34-PASS-BR                 ACAT34DB
                   ,ACCT_CD           = :ACAT34-PASS-ACCT               ACAT34DB
                   ,BLOCK_CD          = :ACAT34-PASS-BLCKCD             ACAT34DB
                   ,CMNT_TXT          = :ACAT34-PASS-CMNT               ACAT34DB
                   ,RCV_NBR           = :ACAT34-PASS-RCV-NUM            ACAT34DB
                   ,DLVR_NBR          = :ACAT34-PASS-DLV-NUM            ACAT34DB
                   ,CICS_TERM_ID_CD   = :ACAT34-PASS-TERMID             ACAT34DB
                   ,UPDT_TMSTP        = :WS-TIMESTAMP                   ACAT34DB
                   ,ISIN_SEC_ISSUE_CD = :ACAT34-PASS-SEC                ACAT34DB
                   ,SECURITY_ADP_NBR  = :ACAT34-PASS-ADP-NBR            ACAT34DB
                   ,EXPIRE_DT         = :ACAT34-PASS-EXP-DATE           ACAT34DB
                   ,ACTION_CD         = ' '                             ACAT34DB
                   ,CICS_SNON_ID      = :ACAT34-PASS-SNON-ID            ACAT34DB
              WHERE CLIENT_NBR        = :ACAT34-PASS-CLT                ACAT34DB
                AND BRANCH_CD         = :ACAT34-PASS-BR                 ACAT34DB
                AND ACCT_CD           = :ACAT34-PASS-ACCT               ACAT34DB
                AND BLOCK_CD          = :ACAT34-PASS-BLCKCD             ACAT34DB
                AND RCV_NBR           = :ACAT34-PASS-RCV-NUM            ACAT34DB
                AND ISIN_SEC_ISSUE_CD = :ACAT34-PASS-SEC                ACAT34DB
           END-EXEC.                                                    ACAT34DB
           IF SQLCODE = 0                                               ACAT34DB
              SET ACAT34-NORMAL  TO TRUE                                ACAT34DB
           ELSE                                                         ACAT34DB
              SET ACAT34-ERROR  TO TRUE                                 ACAT34DB
              MOVE SQLCODE  TO ACAT34-SQLCODE                           ACAT34DB
              PERFORM 9999-DB2-ERROR.                                   ACAT34DB
      *                                                                 ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
      *         UPDATE RESCIND TABLE WITH DELETION MARK              *  ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
       1000-UPDATE-RESCIND-TO-DEL.                                      ACAT34DB
           EXEC SQL                                                     ACAT34DB
             UPDATE VRSDBLK                                             ACAT34DB
                SET ACTION_CD    = :ACAT34-PASS-ACT-CD                  ACAT34DB
                   ,UPDT_TMSTP   = :WS-TIMESTAMP                        ACAT34DB
                   ,CICS_SNON_ID = :ACAT34-PASS-SNON-ID                 ACAT34DB
              WHERE CLIENT_NBR            = :ACAT34-PASS-CLT            ACAT34DB
                    AND BRANCH_CD         = :ACAT34-PASS-BR             ACAT34DB
                    AND ACCT_CD           = :ACAT34-PASS-ACCT           ACAT34DB
                    AND BLOCK_CD          = :ACAT34-PASS-BLCKCD         ACAT34DB
                    AND RCV_NBR           = :ACAT34-PASS-RCV-NUM        ACAT34DB
                    AND ISIN_SEC_ISSUE_CD = :ACAT34-PASS-SEC            ACAT34DB
           END-EXEC.                                                    ACAT34DB
           IF SQLCODE = 0                                               ACAT34DB
              SET ACAT34-NORMAL  TO TRUE                                ACAT34DB
           ELSE                                                         ACAT34DB
              SET ACAT34-ERROR  TO TRUE                                 ACAT34DB
              MOVE SQLCODE  TO ACAT34-SQLCODE                           ACAT34DB
              PERFORM 9999-DB2-ERROR.                                   ACAT34DB
      *                                                                 ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
      *       DELETE RESCIND/BLOCK FILE TABLE ROWS                   *  ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
       1100-DELETE-RESCIND.                                             ACAT34DB
           EXEC SQL DELETE                                              ACAT34DB
               FROM VRSDBLK                                             ACAT34DB
              WHERE CLIENT_NBR            = :ACAT34-PASS-CLT            ACAT34DB
                    AND BRANCH_CD         = :ACAT34-PASS-BR             ACAT34DB
                    AND ACCT_CD           = :ACAT34-PASS-ACCT           ACAT34DB
                    AND BLOCK_CD          = :ACAT34-PASS-BLCKCD         ACAT34DB
                    AND RCV_NBR           = :ACAT34-PASS-RCV-NUM        ACAT34DB
                    AND ISIN_SEC_ISSUE_CD = :ACAT34-PASS-SEC            ACAT34DB
           END-EXEC.                                                    ACAT34DB
           IF SQLCODE = 0                                               ACAT34DB
              SET ACAT34-NORMAL  TO TRUE                                ACAT34DB
           ELSE                                                         ACAT34DB
           IF SQLCODE = +100                                            ACAT34DB
              SET ACAT34-NOT-FOUND TO TRUE                              ACAT34DB
           ELSE                                                         ACAT34DB
              SET ACAT34-ERROR  TO TRUE                                 ACAT34DB
              MOVE SQLCODE  TO ACAT34-SQLCODE                           ACAT34DB
              PERFORM 9999-DB2-ERROR.                                   ACAT34DB
      *                                                                 ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
      *        CHECK DUPLICATE RESCIND/BLOCK ACCT                    *  ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
       1200-GET-RESCIND-TBL.                                            ACAT34DB
           EXEC SQL                                                     ACAT34DB
               SELECT                                                   ACAT34DB
                     CLIENT_NBR                                         ACAT34DB
                    ,BRANCH_CD                                          ACAT34DB
                    ,ACCT_CD                                            ACAT34DB
                    ,BLOCK_CD                                           ACAT34DB
                    ,CMNT_TXT                                           ACAT34DB
                    ,RCV_NBR                                            ACAT34DB
                    ,DLVR_NBR                                           ACAT34DB
                    ,CRT_TMSTP                                          ACAT34DB
                    ,UPDT_TMSTP                                         ACAT34DB
                    ,ISIN_SEC_ISSUE_CD                                  ACAT34DB
                    ,SECURITY_ADP_NBR                                   ACAT34DB
                    ,EXPIRE_DT                                          ACAT34DB
                    ,ACTION_CD                                          ACAT34DB
                    ,CICS_SNON_ID                                       ACAT34DB
                 INTO                                                   ACAT34DB
                    :ACAT34-CLIENT                                      ACAT34DB
                   ,:ACAT34-BRANCH                                      ACAT34DB
                   ,:ACAT34-ACCT                                        ACAT34DB
                   ,:ACAT34-BLCKCD                                      ACAT34DB
                   ,:ACAT34-CMNT                                        ACAT34DB
                   ,:ACAT34-RCV-NUM                                     ACAT34DB
                   ,:ACAT34-DLV-NUM                                     ACAT34DB
                   ,:ACAT34-CRT-TMSTP                                   ACAT34DB
                   ,:ACAT34-UPD-TMSTP                                   ACAT34DB
                   ,:ACAT34-ISIN-SEC                                    ACAT34DB
                   ,:ACAT34-ADP-SEC                                     ACAT34DB
                   ,:ACAT34-EXP-DATE                                    ACAT34DB
                   ,:ACAT34-ACTION-CD                                   ACAT34DB
                   ,:ACAT34-SNON-ID                                     ACAT34DB
                 FROM                                                   ACAT34DB
                    VRSDBLK                                             ACAT34DB
                WHERE                                                   ACAT34DB
                    CLIENT_NBR            = :ACAT34-PASS-CLT            ACAT34DB
                    AND BRANCH_CD         = :ACAT34-PASS-BR             ACAT34DB
                    AND ACCT_CD           = :ACAT34-PASS-ACCT           ACAT34DB
                    AND BLOCK_CD          = :ACAT34-PASS-BLCKCD         ACAT34DB
                    AND RCV_NBR           = :ACAT34-PASS-RCV-NUM        ACAT34DB
                    AND ISIN_SEC_ISSUE_CD = :ACAT34-PASS-SEC            ACAT34DB
                    AND (ACTION_CD ^= 'D')                              ACAT34DB
           END-EXEC.                                                    ACAT34DB
           IF SQLCODE = 0                                               ACAT34DB
              SET ACAT34-NORMAL TO TRUE                                 ACAT34DB
           ELSE                                                         ACAT34DB
           IF SQLCODE = +100                                            ACAT34DB
              SET ACAT34-NOT-FOUND TO TRUE                              ACAT34DB
           ELSE                                                         ACAT34DB
              SET ACAT34-ERROR  TO TRUE                                 ACAT34DB
              MOVE SQLCODE  TO ACAT34-SQLCODE                           ACAT34DB
              PERFORM 9999-DB2-ERROR.                                   ACAT34DB
       EJECT                                                            ACAT34DB
      *                                                                 ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
      *  CHECK IF SAME ACCOUNT WITH DIFFERENT BLOCK CODE "L" EXISTS  *  ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
       1300-FIND-LEGAL-BLCKCD.                                          ACAT34DB
           EXEC SQL                                                     ACAT34DB
               SELECT                                                   ACAT34DB
                    COUNT(*)                                            ACAT34DB
                 INTO                                                   ACAT34DB
                    :WS-ROW-COUNT                                       ACAT34DB
                 FROM                                                   ACAT34DB
                    VRSDBLK                                             ACAT34DB
                WHERE                                                   ACAT34DB
                    CLIENT_NBR      = :ACAT34-PASS-CLT                  ACAT34DB
                    AND BRANCH_CD   = :ACAT34-PASS-BR                   ACAT34DB
                    AND ACCT_CD     = :ACAT34-PASS-ACCT                 ACAT34DB
                    AND BLOCK_CD    = 'L'                               ACAT34DB
                    AND (ACTION_CD ^= 'D')                              ACAT34DB
           END-EXEC.                                                    ACAT34DB
           IF SQLCODE = 0                                               ACAT34DB
              IF WS-ROW-COUNT > 0                                       ACAT34DB
                 SET ACAT34-NORMAL TO TRUE                              ACAT34DB
              ELSE                                                      ACAT34DB
                 SET ACAT34-NOT-FOUND TO TRUE                           ACAT34DB
              END-IF                                                    ACAT34DB
           ELSE                                                         ACAT34DB
           IF SQLCODE = +100                                            ACAT34DB
              SET ACAT34-NOT-FOUND TO TRUE                              ACAT34DB
           ELSE                                                         ACAT34DB
              SET ACAT34-ERROR  TO TRUE                                 ACAT34DB
              MOVE SQLCODE  TO ACAT34-SQLCODE                           ACAT34DB
              PERFORM 9999-DB2-ERROR.                                   ACAT34DB
       EJECT                                                            ACAT34DB
      *                                                                 ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
      *  CHECK IF SAME ACCOUNT WITH DIFFERENT BLOCK CODE "R" EXISTS  *  ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
       1400-FIND-RESCIND-BLCKCD.                                        ACAT34DB
           EXEC SQL                                                     ACAT34DB
               SELECT                                                   ACAT34DB
                    COUNT(*)                                            ACAT34DB
                 INTO                                                   ACAT34DB
                    :WS-ROW-COUNT                                       ACAT34DB
                 FROM                                                   ACAT34DB
                    VRSDBLK                                             ACAT34DB
                WHERE                                                   ACAT34DB
                    CLIENT_NBR      = :ACAT34-PASS-CLT                  ACAT34DB
                    AND BRANCH_CD   = :ACAT34-PASS-BR                   ACAT34DB
                    AND ACCT_CD     = :ACAT34-PASS-ACCT                 ACAT34DB
                    AND BLOCK_CD    = 'R'                               ACAT34DB
                    AND (ACTION_CD ^= 'D')                              ACAT34DB
           END-EXEC.                                                    ACAT34DB
           IF SQLCODE = 0                                               ACAT34DB
              IF WS-ROW-COUNT > 0                                       ACAT34DB
                 SET ACAT34-NORMAL TO TRUE                              ACAT34DB
              ELSE                                                      ACAT34DB
                 SET ACAT34-NOT-FOUND TO TRUE                           ACAT34DB
              END-IF                                                    ACAT34DB
           ELSE                                                         ACAT34DB
           IF SQLCODE = +100                                            ACAT34DB
              SET ACAT34-NOT-FOUND TO TRUE                              ACAT34DB
           ELSE                                                         ACAT34DB
              SET ACAT34-ERROR  TO TRUE                                 ACAT34DB
              MOVE SQLCODE  TO ACAT34-SQLCODE                           ACAT34DB
              PERFORM 9999-DB2-ERROR.                                   ACAT34DB
      *                                                                 ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
      *  CHECK IF SAME ACCOUNT WITH DIFFERENT BLOCK CODE "S" EXISTS  *  ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
       1500-FIND-SECURITY-BLCKCD.                                       ACAT34DB
           EXEC SQL                                                     ACAT34DB
               SELECT                                                   ACAT34DB
                    COUNT(*)                                            ACAT34DB
                 INTO                                                   ACAT34DB
                    :WS-ROW-COUNT                                       ACAT34DB
                 FROM                                                   ACAT34DB
                    VRSDBLK                                             ACAT34DB
                WHERE                                                   ACAT34DB
                    CLIENT_NBR      = :ACAT34-PASS-CLT                  ACAT34DB
                    AND BRANCH_CD   = :ACAT34-PASS-BR                   ACAT34DB
                    AND ACCT_CD     = :ACAT34-PASS-ACCT                 ACAT34DB
                    AND BLOCK_CD    = 'S'                               ACAT34DB
                    AND (ACTION_CD ^= 'D')                              ACAT34DB
           END-EXEC.                                                    ACAT34DB
           IF SQLCODE = 0                                               ACAT34DB
              IF WS-ROW-COUNT > 0                                       ACAT34DB
                 SET ACAT34-NORMAL TO TRUE                              ACAT34DB
              ELSE                                                      ACAT34DB
                 SET ACAT34-NOT-FOUND TO TRUE                           ACAT34DB
              END-IF                                                    ACAT34DB
           ELSE                                                         ACAT34DB
           IF SQLCODE = +100                                            ACAT34DB
              SET ACAT34-NOT-FOUND TO TRUE                              ACAT34DB
           ELSE                                                         ACAT34DB
              SET ACAT34-ERROR  TO TRUE                                 ACAT34DB
              MOVE SQLCODE  TO ACAT34-SQLCODE                           ACAT34DB
              PERFORM 9999-DB2-ERROR.                                   ACAT34DB
       EJECT                                                            ACAT34DB
      *                                                                 ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
      *        FIND RESCIND ACCOUNT WITH ACTION_CD = 'D'             *  ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
       1600-FIND-ACTION-CODE.                                           ACAT34DB
           EXEC SQL                                                     ACAT34DB
               SELECT                                                   ACAT34DB
                     CLIENT_NBR                                         ACAT34DB
                    ,BRANCH_CD                                          ACAT34DB
                    ,ACCT_CD                                            ACAT34DB
                    ,BLOCK_CD                                           ACAT34DB
                    ,CMNT_TXT                                           ACAT34DB
                    ,RCV_NBR                                            ACAT34DB
                    ,DLVR_NBR                                           ACAT34DB
                    ,CRT_TMSTP                                          ACAT34DB
                    ,UPDT_TMSTP                                         ACAT34DB
                    ,ISIN_SEC_ISSUE_CD                                  ACAT34DB
                    ,SECURITY_ADP_NBR                                   ACAT34DB
                    ,EXPIRE_DT                                          ACAT34DB
                    ,ACTION_CD                                          ACAT34DB
                    ,CICS_SNON_ID                                       ACAT34DB
                 INTO                                                   ACAT34DB
                    :ACAT34-CLIENT                                      ACAT34DB
                   ,:ACAT34-BRANCH                                      ACAT34DB
                   ,:ACAT34-ACCT                                        ACAT34DB
                   ,:ACAT34-BLCKCD                                      ACAT34DB
                   ,:ACAT34-CMNT                                        ACAT34DB
                   ,:ACAT34-RCV-NUM                                     ACAT34DB
                   ,:ACAT34-DLV-NUM                                     ACAT34DB
                   ,:ACAT34-CRT-TMSTP                                   ACAT34DB
                   ,:ACAT34-UPD-TMSTP                                   ACAT34DB
                   ,:ACAT34-ISIN-SEC                                    ACAT34DB
                   ,:ACAT34-ADP-SEC                                     ACAT34DB
                   ,:ACAT34-EXP-DATE                                    ACAT34DB
                   ,:ACAT34-ACTION-CD                                   ACAT34DB
                   ,:ACAT34-SNON-ID                                     ACAT34DB
                 FROM                                                   ACAT34DB
                    VRSDBLK                                             ACAT34DB
                WHERE                                                   ACAT34DB
                    CLIENT_NBR            = :ACAT34-PASS-CLT            ACAT34DB
                    AND BRANCH_CD         = :ACAT34-PASS-BR             ACAT34DB
                    AND ACCT_CD           = :ACAT34-PASS-ACCT           ACAT34DB
                    AND BLOCK_CD          = :ACAT34-PASS-BLCKCD         ACAT34DB
                    AND RCV_NBR           = :ACAT34-PASS-RCV-NUM        ACAT34DB
                    AND ISIN_SEC_ISSUE_CD = :ACAT34-PASS-SEC            ACAT34DB
                    AND (ACTION_CD = 'D')                               ACAT34DB
           END-EXEC.                                                    ACAT34DB
           IF SQLCODE = 0                                               ACAT34DB
              SET ACAT34-NORMAL TO TRUE                                 ACAT34DB
           ELSE                                                         ACAT34DB
           IF SQLCODE = +100                                            ACAT34DB
              SET ACAT34-NOT-FOUND TO TRUE                              ACAT34DB
           ELSE                                                         ACAT34DB
              SET ACAT34-ERROR  TO TRUE                                 ACAT34DB
              MOVE SQLCODE  TO ACAT34-SQLCODE                           ACAT34DB
              PERFORM 9999-DB2-ERROR.                                   ACAT34DB
       EJECT                                                            ACAT34DB
      *                                                                 ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
      *         OPEN HISTORY RESCIND/BLOCK CURSOR TABLE                 ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
       1700-OPEN-HIST-CSR.                                              ACAT34DB
           IF ACAT34-PASS-BR-TO < '100'                                 ACAT34DB
              MOVE '100' TO ACAT34-PASS-BR-TO                           ACAT34DB
           ELSE                                                         ACAT34DB
           IF ACAT34-PASS-BR-TO < '200'                                 ACAT34DB
              MOVE '200' TO ACAT34-PASS-BR-TO                           ACAT34DB
           ELSE                                                         ACAT34DB
           IF ACAT34-PASS-BR-TO < '300'                                 ACAT34DB
              MOVE '300' TO ACAT34-PASS-BR-TO                           ACAT34DB
           ELSE                                                         ACAT34DB
           IF ACAT34-PASS-BR-TO < '400'                                 ACAT34DB
              MOVE '400' TO ACAT34-PASS-BR-TO                           ACAT34DB
           ELSE                                                         ACAT34DB
           IF ACAT34-PASS-BR-TO < '500'                                 ACAT34DB
              MOVE '500' TO ACAT34-PASS-BR-TO                           ACAT34DB
           ELSE                                                         ACAT34DB
           IF ACAT34-PASS-BR-TO < '600'                                 ACAT34DB
              MOVE '600' TO ACAT34-PASS-BR-TO                           ACAT34DB
           ELSE                                                         ACAT34DB
           IF ACAT34-PASS-BR-TO < '700'                                 ACAT34DB
              MOVE '700' TO ACAT34-PASS-BR-TO                           ACAT34DB
           ELSE                                                         ACAT34DB
           IF ACAT34-PASS-BR-TO < '800'                                 ACAT34DB
              MOVE '800' TO ACAT34-PASS-BR-TO                           ACAT34DB
           ELSE                                                         ACAT34DB
           IF ACAT34-PASS-BR-TO < '900'                                 ACAT34DB
              MOVE '900' TO ACAT34-PASS-BR-TO                           ACAT34DB
           ELSE                                                         ACAT34DB
              MOVE HIGH-VALUE TO ACAT34-PASS-BR-TO.                     ACAT34DB
                                                                        ACAT34DB
           EXEC SQL                                                     ACAT34DB
              OPEN HSTRSD_CSR                                           ACAT34DB
           END-EXEC.                                                    ACAT34DB
           IF SQLCODE = 0                                               ACAT34DB
              SET ACAT34-NORMAL  TO TRUE                                ACAT34DB
           ELSE                                                         ACAT34DB
              SET ACAT34-ERROR  TO TRUE                                 ACAT34DB
              MOVE SQLCODE  TO ACAT34-SQLCODE                           ACAT34DB
              PERFORM 9999-DB2-ERROR.                                   ACAT34DB
      *                                                                 ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
      *        FETCH HISTORY RESCIND/BLOCK CURSOR TABLE              *  ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
       1800-FETCH-HIST-CSR.                                             ACAT34DB
           EXEC SQL                                                     ACAT34DB
              FETCH                                                     ACAT34DB
                 HSTRSD_CSR                                             ACAT34DB
              INTO                                                      ACAT34DB
                 :DCLVACTRBHY.CLIENT-NBR                                ACAT34DB
                ,:DCLVACTRBHY.BRANCH-CD                                 ACAT34DB
                ,:DCLVACTRBHY.ACCT-CD                                   ACAT34DB
                ,:DCLVACTRBHY.BLOCK-CD                                  ACAT34DB
                ,:DCLVACTRBHY.CMNT-TXT                                  ACAT34DB
                ,:DCLVACTRBHY.PRGM-NM                                   ACAT34DB
                ,:DCLVACTRBHY.RCV-NBR                                   ACAT34DB
                ,:DCLVACTRBHY.DLVR-NBR                                  ACAT34DB
                ,:DCLVACTRBHY.CICS-TERM-ID-CD                           ACAT34DB
                ,:DCLVACTRBHY.CRT-TMSTP                                 ACAT34DB
                ,:DCLVACTRBHY.UPDT-TMSTP                                ACAT34DB
                ,:DCLVACTRBHY.ISIN-SEC-ISSUE-CD                         ACAT34DB
                ,:DCLVACTRBHY.SECURITY-ADP-NBR                          ACAT34DB
                ,:DCLVACTRBHY.EXPIRE-DT                                 ACAT34DB
                ,:DCLVACTRBHY.ACTION-CD                                 ACAT34DB
                ,:DCLVACTRBHY.CICS-SNON-ID                              ACAT34DB
                ,:DCLVACTRBHY.HSTRY-SEQ-NBR                             ACAT34DB
           END-EXEC.                                                    ACAT34DB
           IF SQLCODE = 0                                               ACAT34DB
              MOVE BRANCH-CD OF DCLVACTRBHY TO SRCH-INP-BRANCH          ACAT34DB
              PERFORM 5000-SECURITY-CHECK-BY-BRANCH                     ACAT34DB
              IF SRCH-SIGNON-SECR-CHECK-PASS                            ACAT34DB
                 SET ACAT34-NORMAL  TO TRUE                             ACAT34DB
                 PERFORM 4100-SETUP-HIST-RETURN-FIELDS                  ACAT34DB
              END-IF                                                    ACAT34DB
           ELSE                                                         ACAT34DB
           IF SQLCODE = +100                                            ACAT34DB
              IF ACAT34-PASS-BR-TO NOT = HIGH-VALUE                     ACAT34DB
                 PERFORM 1900-CLOSE-HIST-CSR                            ACAT34DB
                 MOVE ACAT34-PASS-BR-TO TO ACAT34-PASS-BR-FROM          ACAT34DB
                 PERFORM 1700-OPEN-HIST-CSR                             ACAT34DB
                 GO TO 1800-FETCH-HIST-CSR                              ACAT34DB
              END-IF                                                    ACAT34DB
              SET ACAT34-NOT-FOUND TO TRUE                              ACAT34DB
           ELSE                                                         ACAT34DB
              SET ACAT34-ERROR  TO TRUE                                 ACAT34DB
              MOVE SQLCODE  TO ACAT34-SQLCODE                           ACAT34DB
              PERFORM 9999-DB2-ERROR.                                   ACAT34DB
      *                                                                 ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
      *        CLOSE HISTORY RESCIND/BLOCK CURSOR TABLE                 ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
       1900-CLOSE-HIST-CSR.                                             ACAT34DB
           EXEC SQL                                                     ACAT34DB
              CLOSE HSTRSD_CSR                                          ACAT34DB
           END-EXEC.                                                    ACAT34DB
           IF SQLCODE = 0                                               ACAT34DB
              SET ACAT34-NORMAL  TO TRUE                                ACAT34DB
           ELSE                                                         ACAT34DB
              SET ACAT34-ERROR  TO TRUE                                 ACAT34DB
              MOVE SQLCODE  TO ACAT34-SQLCODE                           ACAT34DB
              PERFORM 9999-DB2-ERROR.                                   ACAT34DB
      *                                                                 ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
      *  OPEN DESCENDING ORDER HISTORY RESCIND/BLOCK CURSOR TABLE    *  ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
       2000-OPEN-HIST-CSR-DESC.                                         ACAT34DB
           IF ACAT34-PASS-BR-TO < '100'                                 ACAT34DB
              MOVE '100' TO ACAT34-PASS-BR-TO                           ACAT34DB
              IF  ACAT34-PASS-BR-FROM > SPACE                           ACAT34DB
              AND ACAT34-PASS-BR-FROM < '100'                           ACAT34DB
                  MOVE ACAT34-PASS-BR-FROM TO ACAT34-FETCH-BR-FROM      ACAT34DB
              ELSE                                                      ACAT34DB
                  MOVE SPACE TO ACAT34-FETCH-BR-FROM                    ACAT34DB
              END-IF                                                    ACAT34DB
           ELSE                                                         ACAT34DB
           IF ACAT34-PASS-BR-TO < '200'                                 ACAT34DB
              MOVE '200' TO ACAT34-PASS-BR-TO                           ACAT34DB
              IF  ACAT34-PASS-BR-FROM >= '100'                          ACAT34DB
              AND ACAT34-PASS-BR-FROM < '200'                           ACAT34DB
                  MOVE ACAT34-PASS-BR-FROM TO ACAT34-FETCH-BR-FROM      ACAT34DB
              ELSE                                                      ACAT34DB
                  MOVE '100' TO ACAT34-FETCH-BR-FROM                    ACAT34DB
              END-IF                                                    ACAT34DB
           ELSE                                                         ACAT34DB
           IF ACAT34-PASS-BR-TO < '300'                                 ACAT34DB
              MOVE '300' TO ACAT34-PASS-BR-TO                           ACAT34DB
              IF  ACAT34-PASS-BR-FROM >= '200'                          ACAT34DB
              AND ACAT34-PASS-BR-FROM < '300'                           ACAT34DB
                  MOVE ACAT34-PASS-BR-FROM TO ACAT34-FETCH-BR-FROM      ACAT34DB
              ELSE                                                      ACAT34DB
                  MOVE '200'  TO ACAT34-FETCH-BR-FROM                   ACAT34DB
              END-IF                                                    ACAT34DB
           ELSE                                                         ACAT34DB
           IF ACAT34-PASS-BR-TO < '400'                                 ACAT34DB
              MOVE '400' TO ACAT34-PASS-BR-TO                           ACAT34DB
              IF  ACAT34-PASS-BR-FROM >= '300'                          ACAT34DB
              AND ACAT34-PASS-BR-FROM < '400'                           ACAT34DB
                  MOVE ACAT34-PASS-BR-FROM TO ACAT34-FETCH-BR-FROM      ACAT34DB
              ELSE                                                      ACAT34DB
                  MOVE '300'  TO ACAT34-FETCH-BR-FROM                   ACAT34DB
              END-IF                                                    ACAT34DB
           ELSE                                                         ACAT34DB
           IF ACAT34-PASS-BR-TO < '500'                                 ACAT34DB
              MOVE '500' TO ACAT34-PASS-BR-TO                           ACAT34DB
              IF  ACAT34-PASS-BR-FROM >= '400'                          ACAT34DB
              AND ACAT34-PASS-BR-FROM < '500'                           ACAT34DB
                  MOVE ACAT34-PASS-BR-FROM TO ACAT34-FETCH-BR-FROM      ACAT34DB
              ELSE                                                      ACAT34DB
                  MOVE '400' TO ACAT34-FETCH-BR-FROM                    ACAT34DB
              END-IF                                                    ACAT34DB
           ELSE                                                         ACAT34DB
           IF ACAT34-PASS-BR-TO < '600'                                 ACAT34DB
              MOVE '600' TO ACAT34-PASS-BR-TO                           ACAT34DB
              IF  ACAT34-PASS-BR-FROM >= '500'                          ACAT34DB
              AND ACAT34-PASS-BR-FROM < '600'                           ACAT34DB
                  MOVE ACAT34-PASS-BR-FROM TO ACAT34-FETCH-BR-FROM      ACAT34DB
              ELSE                                                      ACAT34DB
                  MOVE '500' TO ACAT34-FETCH-BR-FROM                    ACAT34DB
              END-IF                                                    ACAT34DB
           ELSE                                                         ACAT34DB
           IF ACAT34-PASS-BR-TO < '700'                                 ACAT34DB
              MOVE '700' TO ACAT34-PASS-BR-TO                           ACAT34DB
              IF  ACAT34-PASS-BR-FROM >= '600'                          ACAT34DB
              AND ACAT34-PASS-BR-FROM < '700'                           ACAT34DB
                  MOVE ACAT34-PASS-BR-FROM TO ACAT34-FETCH-BR-FROM      ACAT34DB
              ELSE                                                      ACAT34DB
                  MOVE '600' TO ACAT34-FETCH-BR-FROM                    ACAT34DB
              END-IF                                                    ACAT34DB
           ELSE                                                         ACAT34DB
           IF ACAT34-PASS-BR-TO < '800'                                 ACAT34DB
              MOVE '800' TO ACAT34-PASS-BR-TO                           ACAT34DB
              IF  ACAT34-PASS-BR-FROM >= '700'                          ACAT34DB
              AND ACAT34-PASS-BR-FROM < '800'                           ACAT34DB
                  MOVE ACAT34-PASS-BR-FROM TO ACAT34-FETCH-BR-FROM      ACAT34DB
              ELSE                                                      ACAT34DB
                  MOVE '700' TO ACAT34-FETCH-BR-FROM                    ACAT34DB
              END-IF                                                    ACAT34DB
           ELSE                                                         ACAT34DB
           IF ACAT34-PASS-BR-TO < '900'                                 ACAT34DB
              MOVE '900' TO ACAT34-PASS-BR-TO                           ACAT34DB
              IF  ACAT34-PASS-BR-FROM >= '800'                          ACAT34DB
              AND ACAT34-PASS-BR-FROM < '900'                           ACAT34DB
                  MOVE ACAT34-PASS-BR-FROM TO ACAT34-FETCH-BR-FROM      ACAT34DB
              ELSE                                                      ACAT34DB
                  MOVE '800' TO ACAT34-FETCH-BR-FROM                    ACAT34DB
              END-IF                                                    ACAT34DB
           ELSE                                                         ACAT34DB
              MOVE HIGH-VALUE TO ACAT34-PASS-BR-TO                      ACAT34DB
              IF  ACAT34-PASS-BR-FROM >= '900'                          ACAT34DB
              AND ACAT34-PASS-BR-FROM < HIGH-VALUES                     ACAT34DB
                  MOVE ACAT34-PASS-BR-FROM TO ACAT34-FETCH-BR-FROM      ACAT34DB
              ELSE                                                      ACAT34DB
                  MOVE '900'  TO ACAT34-FETCH-BR-FROM                   ACAT34DB
              END-IF.                                                   ACAT34DB
                                                                        ACAT34DB
           EXEC SQL                                                     ACAT34DB
              OPEN HSTRSD_DESC                                          ACAT34DB
           END-EXEC.                                                    ACAT34DB
           IF SQLCODE = 0                                               ACAT34DB
              SET ACAT34-NORMAL  TO TRUE                                ACAT34DB
           ELSE                                                         ACAT34DB
              SET ACAT34-ERROR  TO TRUE                                 ACAT34DB
              MOVE SQLCODE  TO ACAT34-SQLCODE                           ACAT34DB
              PERFORM 9999-DB2-ERROR.                                   ACAT34DB
      *                                                                 ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
      * FETCH DESCENDING ORDER HISTORY RESCIND/BLOCK CURSOR TABLE    *  ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
       2100-FETCH-HIST-CSR-DESC.                                        ACAT34DB
           IF ACAT34-FETCH-BR-FROM = SPACE                              ACAT34DB
              SET WS-FINAL-FETCH-CSR TO TRUE                            ACAT34DB
           ELSE                                                         ACAT34DB
              IF ACAT34-FETCH-BR-FROM = ACAT34-PASS-BR-FROM             ACAT34DB
                 SET WS-FINAL-FETCH-CSR TO TRUE                         ACAT34DB
              END-IF                                                    ACAT34DB
           END-IF.                                                      ACAT34DB
                                                                        ACAT34DB
           EXEC SQL                                                     ACAT34DB
              FETCH                                                     ACAT34DB
                 HSTRSD_DESC                                            ACAT34DB
              INTO                                                      ACAT34DB
                 :DCLVACTRBHY.CLIENT-NBR                                ACAT34DB
                ,:DCLVACTRBHY.BRANCH-CD                                 ACAT34DB
                ,:DCLVACTRBHY.ACCT-CD                                   ACAT34DB
                ,:DCLVACTRBHY.BLOCK-CD                                  ACAT34DB
                ,:DCLVACTRBHY.CMNT-TXT                                  ACAT34DB
                ,:DCLVACTRBHY.PRGM-NM                                   ACAT34DB
                ,:DCLVACTRBHY.RCV-NBR                                   ACAT34DB
                ,:DCLVACTRBHY.DLVR-NBR                                  ACAT34DB
                ,:DCLVACTRBHY.CICS-TERM-ID-CD                           ACAT34DB
                ,:DCLVACTRBHY.CRT-TMSTP                                 ACAT34DB
                ,:DCLVACTRBHY.UPDT-TMSTP                                ACAT34DB
                ,:DCLVACTRBHY.ISIN-SEC-ISSUE-CD                         ACAT34DB
                ,:DCLVACTRBHY.SECURITY-ADP-NBR                          ACAT34DB
                ,:DCLVACTRBHY.EXPIRE-DT                                 ACAT34DB
                ,:DCLVACTRBHY.ACTION-CD                                 ACAT34DB
                ,:DCLVACTRBHY.CICS-SNON-ID                              ACAT34DB
                ,:DCLVACTRBHY.HSTRY-SEQ-NBR                             ACAT34DB
           END-EXEC.                                                    ACAT34DB
           IF SQLCODE = 0                                               ACAT34DB
              MOVE BRANCH-CD OF DCLVACTRBHY TO SRCH-INP-BRANCH          ACAT34DB
              PERFORM 5000-SECURITY-CHECK-BY-BRANCH                     ACAT34DB
              IF SRCH-SIGNON-SECR-CHECK-PASS                            ACAT34DB
                 SET ACAT34-NORMAL  TO TRUE                             ACAT34DB
                 PERFORM 4100-SETUP-HIST-RETURN-FIELDS                  ACAT34DB
              END-IF                                                    ACAT34DB
           ELSE                                                         ACAT34DB
           IF SQLCODE = +100                                            ACAT34DB
              IF NOT WS-FINAL-FETCH-CSR                                 ACAT34DB
                 PERFORM 2200-CLOSE-HIST-CSR-DESC                       ACAT34DB
                 PERFORM 2110-SETUP-NEXT-BR-TO                          ACAT34DB
                 PERFORM 2000-OPEN-HIST-CSR-DESC                        ACAT34DB
                 GO TO 2100-FETCH-HIST-CSR-DESC                         ACAT34DB
              END-IF                                                    ACAT34DB
              SET ACAT34-NOT-FOUND TO TRUE                              ACAT34DB
           ELSE                                                         ACAT34DB
              SET ACAT34-ERROR  TO TRUE                                 ACAT34DB
              MOVE SQLCODE  TO ACAT34-SQLCODE                           ACAT34DB
              PERFORM 9999-DB2-ERROR.                                   ACAT34DB
      *                                                                 ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
      *       SET UP NEXT BRANCH-TO VALUE                            *  ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
       2110-SETUP-NEXT-BR-TO.                                           ACAT34DB
           IF ACAT34-PASS-BR-TO = HIGH-VALUE                            ACAT34DB
              MOVE '899' TO ACAT34-PASS-BR-TO                           ACAT34DB
           ELSE                                                         ACAT34DB
           IF ACAT34-PASS-BR-TO = '900'                                 ACAT34DB
              MOVE '799' TO ACAT34-PASS-BR-TO                           ACAT34DB
           ELSE                                                         ACAT34DB
           IF ACAT34-PASS-BR-TO = '800'                                 ACAT34DB
              MOVE '699' TO ACAT34-PASS-BR-TO                           ACAT34DB
           ELSE                                                         ACAT34DB
           IF ACAT34-PASS-BR-TO = '700'                                 ACAT34DB
              MOVE '599' TO ACAT34-PASS-BR-TO                           ACAT34DB
           ELSE                                                         ACAT34DB
           IF ACAT34-PASS-BR-TO = '600'                                 ACAT34DB
              MOVE '499' TO ACAT34-PASS-BR-TO                           ACAT34DB
           ELSE                                                         ACAT34DB
           IF ACAT34-PASS-BR-TO = '500'                                 ACAT34DB
              MOVE '399' TO ACAT34-PASS-BR-TO                           ACAT34DB
           ELSE                                                         ACAT34DB
           IF ACAT34-PASS-BR-TO = '400'                                 ACAT34DB
              MOVE '299' TO ACAT34-PASS-BR-TO                           ACAT34DB
           ELSE                                                         ACAT34DB
           IF ACAT34-PASS-BR-TO = '300'                                 ACAT34DB
              MOVE '199' TO ACAT34-PASS-BR-TO                           ACAT34DB
           ELSE                                                         ACAT34DB
           IF ACAT34-PASS-BR-TO = '200'                                 ACAT34DB
              MOVE '099' TO ACAT34-PASS-BR-TO.                          ACAT34DB
      *                                                                 ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
      * CLOSE DESCENDING ORDER HISTORY RESCIND/BLOCK CURSOR TABLE    *  ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
       2200-CLOSE-HIST-CSR-DESC.                                        ACAT34DB
           EXEC SQL                                                     ACAT34DB
              CLOSE HSTRSD_DESC                                         ACAT34DB
           END-EXEC.                                                    ACAT34DB
           IF SQLCODE = 0                                               ACAT34DB
              SET ACAT34-NORMAL  TO TRUE                                ACAT34DB
           ELSE                                                         ACAT34DB
              SET ACAT34-ERROR  TO TRUE                                 ACAT34DB
              MOVE SQLCODE  TO ACAT34-SQLCODE                           ACAT34DB
              PERFORM 9999-DB2-ERROR.                                   ACAT34DB
       EJECT                                                            ACAT34DB
      *                                                                 ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
      *        SETUP RETURN FIELDS                                   *  ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
       4000-SETUP-RETURN-FIELDS.                                        ACAT34DB
           MOVE CLIENT-NBR            OF DCLVRSDBLK                     ACAT34DB
             TO ACAT34-CLIENT.                                          ACAT34DB
           MOVE BRANCH-CD             OF DCLVRSDBLK                     ACAT34DB
             TO ACAT34-BRANCH.                                          ACAT34DB
           MOVE ACCT-CD               OF DCLVRSDBLK                     ACAT34DB
             TO ACAT34-ACCT.                                            ACAT34DB
           MOVE BLOCK-CD              OF DCLVRSDBLK                     ACAT34DB
             TO ACAT34-BLCKCD.                                          ACAT34DB
           MOVE CMNT-TXT              OF DCLVRSDBLK                     ACAT34DB
             TO ACAT34-CMNT.                                            ACAT34DB
           MOVE DLVR-NBR              OF DCLVRSDBLK                     ACAT34DB
             TO ACAT34-DLV-NUM.                                         ACAT34DB
           MOVE RCV-NBR               OF DCLVRSDBLK                     ACAT34DB
             TO ACAT34-RCV-NUM.                                         ACAT34DB
           MOVE EXPIRE-DT             OF DCLVRSDBLK                     ACAT34DB
             TO ACAT34-EXP-DATE.                                        ACAT34DB
           MOVE CRT-TMSTP             OF DCLVRSDBLK                     ACAT34DB
             TO ACAT34-CRT-TMSTP.                                       ACAT34DB
           MOVE UPDT-TMSTP            OF DCLVRSDBLK                     ACAT34DB
             TO ACAT34-UPD-TMSTP.                                       ACAT34DB
           MOVE SECURITY-ADP-NBR      OF DCLVRSDBLK                     ACAT34DB
             TO ACAT34-ADP-SEC.                                         ACAT34DB
           MOVE ISIN-SEC-ISSUE-CD     OF DCLVRSDBLK                     ACAT34DB
             TO ACAT34-ISIN-SEC.                                        ACAT34DB
           MOVE ACTION-CD             OF DCLVRSDBLK                     ACAT34DB
             TO ACAT34-ACTION-CD.                                       ACAT34DB
           MOVE CICS-SNON-ID          OF DCLVRSDBLK                     ACAT34DB
             TO ACAT34-SNON-ID.                                         ACAT34DB
           MOVE ZERO                                                    ACAT34DB
             TO ACAT34-HIST-SEQ-NBR.                                    ACAT34DB
      *                                                                 ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
      *        SETUP RETURN FIELDS OF HISTORY TABLE                  *  ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
       4100-SETUP-HIST-RETURN-FIELDS.                                   ACAT34DB
           MOVE CLIENT-NBR            OF DCLVACTRBHY                    ACAT34DB
             TO ACAT34-CLIENT.                                          ACAT34DB
           MOVE BRANCH-CD             OF DCLVACTRBHY                    ACAT34DB
             TO ACAT34-BRANCH.                                          ACAT34DB
           MOVE ACCT-CD               OF DCLVACTRBHY                    ACAT34DB
             TO ACAT34-ACCT.                                            ACAT34DB
           MOVE BLOCK-CD              OF DCLVACTRBHY                    ACAT34DB
             TO ACAT34-BLCKCD.                                          ACAT34DB
           MOVE CMNT-TXT              OF DCLVACTRBHY                    ACAT34DB
             TO ACAT34-CMNT.                                            ACAT34DB
           MOVE DLVR-NBR              OF DCLVACTRBHY                    ACAT34DB
             TO ACAT34-DLV-NUM.                                         ACAT34DB
           MOVE RCV-NBR               OF DCLVACTRBHY                    ACAT34DB
             TO ACAT34-RCV-NUM.                                         ACAT34DB
           MOVE EXPIRE-DT             OF DCLVACTRBHY                    ACAT34DB
             TO ACAT34-EXP-DATE.                                        ACAT34DB
           MOVE CRT-TMSTP             OF DCLVACTRBHY                    ACAT34DB
             TO ACAT34-CRT-TMSTP.                                       ACAT34DB
           MOVE UPDT-TMSTP            OF DCLVACTRBHY                    ACAT34DB
             TO ACAT34-UPD-TMSTP.                                       ACAT34DB
           MOVE SECURITY-ADP-NBR      OF DCLVACTRBHY                    ACAT34DB
             TO ACAT34-ADP-SEC.                                         ACAT34DB
           MOVE ISIN-SEC-ISSUE-CD     OF DCLVACTRBHY                    ACAT34DB
             TO ACAT34-ISIN-SEC.                                        ACAT34DB
           MOVE ACTION-CD             OF DCLVACTRBHY                    ACAT34DB
             TO ACAT34-ACTION-CD.                                       ACAT34DB
           MOVE CICS-SNON-ID          OF DCLVACTRBHY                    ACAT34DB
             TO ACAT34-SNON-ID.                                         ACAT34DB
           MOVE HSTRY-SEQ-NBR         OF DCLVACTRBHY                    ACAT34DB
             TO ACAT34-HIST-SEQ-NBR.                                    ACAT34DB
       EJECT                                                            ACAT34DB
      *                                                                 ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
      *       USER ID BRANCH LEVEL SECURITY CHECK                    *  ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
       5000-SECURITY-CHECK-BY-BRANCH.                                   ACAT34DB
           IF ACAT34-PASS-SUPER-SNON                                    ACAT34DB
              SET SRCH-SIGNON-SECR-CHECK-PASS TO TRUE                   ACAT34DB
           ELSE                                                         ACAT34DB
              SET SECURITY-LOOKUP TO TRUE                               ACAT34DB
              EXEC CICS LINK PROGRAM (WS-ACATSRCH)                      ACAT34DB
                  COMMAREA(ACAT-SRCH-COMM-AREA)                         ACAT34DB
                  LENGTH(LENGTH OF ACAT-SRCH-COMM-AREA)                 ACAT34DB
              END-EXEC                                                  ACAT34DB
           END-IF.                                                      ACAT34DB
      *                                                                 ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
      *          WRITE DB2 ERROR LOG                                 *  ACAT34DB
      *--------------------------------------------------------------*  ACAT34DB
       9999-DB2-ERROR.                                                  ACAT34DB
           MOVE SPACE      TO WS-ERR-DATA.                              ACAT34DB
           SET WS-WRITE-ERROR-TO-LOG TO TRUE.                           ACAT34DB
           MOVE EIBTRNID   TO CALLING-TRAN-ID.                          ACAT34DB
           MOVE 'ACAT34RB' TO CALLING-PROGRAM-ID.                       ACAT34DB
           MOVE SQLCA      TO SQLCA-AREA.                               ACAT34DB
           EXEC CICS LINK PROGRAM('FPDB2LOG')                           ACAT34DB
                COMMAREA(WS-ERR-DATA)                                   ACAT34DB
                LENGTH(LENGTH OF WS-ERR-DATA)                           ACAT34DB
                NOHANDLE                                                ACAT34DB
           END-EXEC.                                                    ACAT34DB
       EJECT                                                            ACAT34DB
                                                                        ACAT34DB
       HANG-CICS.                                                       ACAT34DB
           GOBACK.                                                      ACAT34DB
