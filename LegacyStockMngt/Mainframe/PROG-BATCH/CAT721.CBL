000001* PDX    - CAT721   C0214955 12/23/04 11:02:54 TBEDTAK            00001000
      * ET0001 DB2 INITIAL TABLE KEY CHANGE WITH NEW TABLE NAME         CAT721  
000001* PDX    - CAT721   C0151178 12/18/00 08:43:33 TBDOJUN            00001000
      * DJ0001 COBOL LE                                                 CAT721  
000001* PDX    - CAT721   C0121105 01/30/99 17:36:16 TBYOHON            CAT721  
000001* PDX    - CAT721   C0119784 12/29/98 10:43:34 TBLAMUR            CAT721  
000001* PDX    - CAT721   C0117772 12/26/98 16:43:08 TBYOHON            CAT721  
000001* PDX    - CAT721   C0115343 11/11/98 10:32:22 TVFRSAB            CAT721  
000001* PDX    - CAT721   C0117772 11/10/98 14:29:34 TVFRSAB            CAT721  
000001* PDX    - CAT721   C0113972 11/09/98 09:47:20 TBLISTU            CAT721  
000001* PDX    - TEMPPGM  C0113972 11/09/98 09:09:30 TBLISTU            CAT721  
000001* PDX    - TEMPPROG C0114003 10/29/98 10:57:17 TBDHBAT            CAT721  
       IDENTIFICATION DIVISION.                                         CAT721  
       PROGRAM-ID.   CAT721.                                            CAT721  
       AUTHOR.       DHEERAJ AND LISA.                                  CAT721  
       DATE-WRITTEN. NOV 9, 1998.                                       CAT721  
       DATE-COMPILED.                                                   CAT721  
      *REMARKS.      THIS PROGRAM WILL SEARCH THE INITIAL TRANSFER      CAT721  
      *              RECORDS FOR RESIDUAL CREDIT AND ERASE              CAT721  
      *              CORRESPONDING INITIAL ASSET RECORDS.               CAT721  
       ENVIRONMENT DIVISION.                                            CAT721  
       INPUT-OUTPUT SECTION.                                            CAT721  
       FILE-CONTROL.                                                    CAT721  
                                                                        CAT721  
       DATA DIVISION.                                                   CAT721  
       FILE SECTION.                                                    CAT721  
                                                                        CAT721  
       WORKING-STORAGE SECTION.                                         CAT721  
                                                                        CAT721  
DJ0001     COPY PDXIDCOB.                                               CAT721  
                                                                        CAT721  
      /                                                                 CAT721  
DJ0001***===> COBOL LE                                                  CAT721  
DJ0001 01  W-ABEND-AREA.                                                CAT721  
DJ0001     05  ABEND-CODE                PIC S9(04) COMP SYNC.          CAT721  
DJ0001 01  CALL-MODULES.                                                CAT721  
DJ0001     05  DSNTIAR                   PIC  X(08) VALUE 'DSNTIAR '.   CAT721  
DJ0001 01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.   CAT721  
DJ0001     COPY STUBCPY.                                                CAT721  
DJ0001***<=== COBOL LE                                                  CAT721  
      /                                                                 CAT721  
       01 VARIABLES.                                                    CAT721  
           05 VAR-CLIENT-NBR               PIC X(4)         VALUE ZEROS.CAT721  
           05 VAR-RCV-NBR                  PIC X(4)         VALUE ZEROS.CAT721  
           05 VAR-ACCT-RCV-NBR             PIC X(20)        VALUE ZEROS.CAT721  
           05 VAR-DLVR-NBR                 PIC X(4)         VALUE ZEROS.CAT721  
           05 VAR-ACCT-DLVR-NBR            PIC X(20)        VALUE ZEROS.CAT721  
           05 VAR-TRANS-RFRN-ID-CD         PIC X(20)        VALUE ZEROS.CAT721  
           05 VAR-ACAT-CONTROL-NBR         PIC X(14)        VALUE ZEROS.CAT721  
                                                                        CAT721  
      *---------------------------------------------------------------* CAT721  
       01  WS-END-OF-PROCESS           PIC X.                           CAT721  
           88 END-OF-PROCESS           VALUE 'E'.                       CAT721  
           88 IN-PROCESS               VALUE ' '.                       CAT721  
       01  WS-HOLD-AREA.                                                CAT721  
           05 WS-STREAM-ID             PIC X            VALUE SPACES.   CAT721  
           05 WS-CLIENT-NBR            PIC X(4)         VALUE SPACES.   CAT721  
           05 WS-DATE.                                                  CAT721  
              10 WS-DATE-YY            PIC 99.                          CAT721  
              10 WS-DATE-MM            PIC 99.                          CAT721  
              10 WS-DATE-DD            PIC 99.                          CAT721  
           05 WA-SQLCODE               PIC -999         VALUE ZEROS.    CAT721  
           05 WA-SQLCABC               PIC -9999        VALUE ZEROS.    CAT721  
           05 WA-SQLERRML              PIC -9999        VALUE ZEROS.    CAT721  
      *--------------------------------------------------------------*  CAT721  
      *    COUNTERS                                                  *  CAT721  
      *--------------------------------------------------------------*  CAT721  
       01  WS-COUNTERS.                                                 CAT721  
           05  WS-TIF-DELETE-CTR        PIC  9(5)       VALUE ZEROS.    CAT721  
           05  WS-AST-DELETE-CTR        PIC  9(5)       VALUE ZEROS.    CAT721  
           05  WS-A-COMMIT-CTR          PIC  9(5)       VALUE ZEROS.    CAT721  
           05  WS-FETCH-CTR             PIC  9(5)       VALUE ZEROS.    CAT721  
                                                                        CAT721  
                                                                        CAT721  
      *--------------------------------------------------------------*  CAT721  
      * COPY IN THE SQLCA AREA - THE COMMON COMMUNICATIONS AREA      *  CAT721  
      *--------------------------------------------------------------*  CAT721  
           EXEC SQL INCLUDE SQLCA END-EXEC.                             CAT721  
           EJECT                                                        CAT721  
                                                                        CAT721  
      *--------------------------------------------------------------*  CAT721  
      * COPY THE INITIAL TRANSFER RECORD DESCRIPTION                 *  CAT721  
      *--------------------------------------------------------------*  CAT721  
           EXEC SQL INCLUDE                                             CAT721  
ET0001*    VINITRNF END-EXEC.                                           CAT721  
ET0001     ACTITRF  END-EXEC.                                           CAT721  
           EJECT                                                        CAT721  
                                                                        CAT721  
      *--------------------------------------------------------------*  CAT721  
      * COPY THE INITIAL ASSET RECORD DESCRIPTION                    *  CAT721  
      *--------------------------------------------------------------*  CAT721  
           EXEC SQL INCLUDE                                             CAT721  
ET0001*    VINITAST END-EXEC.                                           CAT721  
ET0001     ACTIAST  END-EXEC.                                           CAT721  
           EJECT                                                        CAT721  
                                                                        CAT721  
      *---------------------------------------------------------------* CAT721  
      * SQLCA ERROR MESSAGE WORK AREAS                                * CAT721  
      *---------------------------------------------------------------* CAT721  
                                                                        CAT721  
    ***********   START OF ERROR ROUTINE WORK AREAS    ***************  CAT721  
       01  WS-ERRL-DATA.                                                CAT721  
           05  REQUEST-TYPE       PIC X(01).                            CAT721  
                 88 WRITE-ERROR-TO-LOG           VALUE 'W'.             CAT721  
           05  CALLING-TRAN-ID    PIC X(04).                            CAT721  
           05  CALLING-PROGRAM-ID PIC X(08).                            CAT721  
           05  SQLCA-AREA         PIC X(136).                           CAT721  
                                                                        CAT721  
       01  MS-MESSAGE.                                                  CAT721  
           05  MS-MESSAGE1        PIC X(120)     VALUE SPACES.          CAT721  
           05  MS-MESSAGE2        PIC X(120)     VALUE SPACES.          CAT721  
           05  MS-MESSAGE3        PIC X(120)     VALUE SPACES.          CAT721  
                                                                        CAT721  
       01  WS-MESSAGE.                                                  CAT721  
           05  WS-ERR-LEN         PIC S9(4) COMP VALUE +1200.           CAT721  
           05  WS-ERR-TXT         PIC X(120) OCCURS 10 TIMES.           CAT721  
                                                                        CAT721  
       01  WS-ERROR-MSG.                                                CAT721  
           05  FILLER             PIC X(70)      VALUE                  CAT721  
           '**DB2** MESSAGE COULD NOT BE TRANSLATED ERROR IN DSNTIAR'.  CAT721  
           05  WS-DSNTIAR-RC      PIC X(08).                            CAT721  
                                                                        CAT721  
       77  WS-SQL-SEQ-NUM         PIC 999         VALUE ZEROS.          CAT721  
       77  WS-LENGTH              PIC S9(09) COMP VALUE +240.           CAT721  
    ***********   END OF ERROR ROUTINE WORK AREAS    ***************    CAT721  
                                                                        CAT721  
      *---------------------------------------------------------------* CAT721  
      * SQL DECLARATION FOR INTFACE  - INTERFACE RECORD FOR CAGE/TRF  * CAT721  
      *---------------------------------------------------------------* CAT721  
                                                                        CAT721  
           EXEC SQL DECLARE INITTRFCUR CURSOR WITH HOLD FOR             CAT721  
                SELECT CLIENT_NBR, RCV_NBR, DLVR_NBR,                   CAT721  
                   ACCT_DLVR_NBR, ACCT_RCV_NBR, TRANS_RFRN_ID_CD,       CAT721  
                   ACAT_CONTROL_NBR                                     CAT721  
ET0001*         FROM VINITRNF                                           CAT721  
ET0001          FROM ACTITRF                                            CAT721  
                WHERE TRNFR_TYPE_CD = 'RCR'                             CAT721  
                   OR TRANS_TYPE_CD = 'X'                               CAT721  
                ORDER BY CLIENT_NBR, DLVR_NBR, RCV_NBR,                 CAT721  
                    ACCT_DLVR_NBR, ACCT_RCV_NBR, TRANS_RFRN_ID_CD       CAT721  
                END-EXEC.                                               CAT721  
                                                                        CAT721  
           EJECT                                                        CAT721  
                                                                        CAT721  
       LINKAGE SECTION.                                                 CAT721  
       01  PARM-AREA.                                                   CAT721  
           10  PARM-LENGTH         PIC S9(4) COMP.                      CAT721  
           10  PARM-DATA-LIT       PIC X(7).                            CAT721  
           10  FILLER              PIC X.                               CAT721  
           10 PARM-ROLLBACK        PIC X.                               CAT721  
               88 ROLLBACK-YES     VALUE 'Y'.                           CAT721  
               88 ROLLBACK-NO      VALUE 'N'.                           CAT721  
                                                                        CAT721  
                                                                        CAT721  
       PROCEDURE DIVISION USING PARM-AREA.                              CAT721  
       0010-MAIN-LINE.                                                  CAT721  
           DISPLAY 'CAT721 - DELETE RCR FROM INIT TABLES'.              CAT721  
           DISPLAY ' '.                                                 CAT721  
                                                                        CAT721  
           COPY MSGCOBO.                                                CAT721  
                                                                        CAT721  
      *                                                                 CAT721  
      * VALIDATE THE PARM FIELDS PASSED                                 CAT721  
      *                                                                 CAT721  
            IF PARM-ROLLBACK EQUAL 'Y'                                  CAT721  
               OR PARM-ROLLBACK EQUAL 'N'                               CAT721  
               NEXT SENTENCE                                            CAT721  
            ELSE                                                        CAT721  
               DISPLAY 'INVALID SYSTEM PARM PASSED'                     CAT721  
               DISPLAY 'PARM DATA = ' PARM-ROLLBACK                     CAT721  
               DISPLAY 'ABENDING PROGRAM CAT721'                        CAT721  
               MOVE 2001     TO ABEND-CODE                              CAT721  
               CALL ABEND USING ABEND-CODE                              CAT721  
               GOBACK.                                                  CAT721  
      *                                                                 CAT721  
      *  INITIALIZATIONS                                                CAT721  
      *                                                                 CAT721  
                                                                        CAT721  
            PERFORM 0020-MAIN-LOGIC THRU                                CAT721  
                0020-MAIN-LOGIC-EXIT.                                   CAT721  
            DISPLAY 'TOTAL INITIAL TIF RECORDS FETCHED = '              CAT721  
                                                    WS-FETCH-CTR        CAT721  
            DISPLAY 'TOTAL INITIAL TIF RECORDS DELETED = '              CAT721  
                                                    WS-TIF-DELETE-CTR   CAT721  
            DISPLAY 'TOTAL INITIAL AST RECORDS DELETED = '              CAT721  
                                                    WS-AST-DELETE-CTR   CAT721  
            GOBACK.                                                     CAT721  
                                                                        CAT721  
      **************************************************************    CAT721  
      ***         PERFORM ROUTINES                               ***    CAT721  
      **************************************************************    CAT721  
                                                                        CAT721  
                                                                        CAT721  
       0020-MAIN-LOGIC.                                                 CAT721  
           DISPLAY                                                      CAT721  
           ' 0020-MAIN-LOGIC'                                           CAT721  
            SET IN-PROCESS TO TRUE                                      CAT721  
                                                                        CAT721  
            PERFORM 0040-OPEN-CURSOR THRU                               CAT721  
                    0040-OPEN-CURSOR-EXIT.                              CAT721  
      *                                                                 CAT721  
      *  EXTRACT SELECTION PROCESSING                                   CAT721  
      *                                                                 CAT721  
            PERFORM 0220-FETCH THRU                                     CAT721  
                    0220-FETCH-EXIT                                     CAT721  
              UNTIL END-OF-PROCESS.                                     CAT721  
      *                                                                 CAT721  
      *  END OF JOB PROCESSING                                          CAT721  
      *                                                                 CAT721  
            PERFORM 0080-CLOSE-CURSOR THRU                              CAT721  
                    0080-CLOSE-CURSOR-EXIT.                             CAT721  
      *                                                                 CAT721  
      *  ROLLING-BACK                                                   CAT721  
      *                                                                 CAT721  
           IF  ROLLBACK-YES                                             CAT721  
               EXEC SQL ROLLBACK                                        CAT721  
           END-EXEC.                                                    CAT721  
       0020-MAIN-LOGIC-EXIT.                                            CAT721  
           EXIT.                                                        CAT721  
                                                                        CAT721  
       0040-OPEN-CURSOR.                                                CAT721  
      *                                                                 CAT721  
      * OPEN CURSOR TO RETRIEVE THE INTERFACE RECORDS  (ROWS)           CAT721  
      *                                                                 CAT721  
           MOVE 10 TO WS-SQL-SEQ-NUM.                                   CAT721  
           EXEC SQL OPEN INITTRFCUR END-EXEC.                           CAT721  
           IF  SQLCODE EQUAL ZERO                                       CAT721  
               NEXT SENTENCE                                            CAT721  
           ELSE                                                         CAT721  
               PERFORM 0600-ERRRTN                                      CAT721  
           END-IF.                                                      CAT721  
       0040-OPEN-CURSOR-EXIT.                                           CAT721  
           EXIT.                                                        CAT721  
                                                                        CAT721  
       0080-CLOSE-CURSOR.                                               CAT721  
      *                                                                 CAT721  
      *  CLOSE THE CURSOR (SAME AS CLOSING FILE)                        CAT721  
      *                                                                 CAT721  
           MOVE 20 TO WS-SQL-SEQ-NUM.                                   CAT721  
           EXEC SQL CLOSE INITTRFCUR END-EXEC.                          CAT721  
           IF  SQLCODE EQUAL ZERO                                       CAT721  
               NEXT SENTENCE                                            CAT721  
           ELSE                                                         CAT721  
               PERFORM 0600-ERRRTN                                      CAT721  
           END-IF.                                                      CAT721  
       0080-CLOSE-CURSOR-EXIT.                                          CAT721  
           EXIT.                                                        CAT721  
                                                                        CAT721  
       0220-FETCH.                                                      CAT721  
           MOVE 50 TO WS-SQL-SEQ-NUM.                                   CAT721  
           EXEC SQL FETCH INITTRFCUR                                    CAT721  
            INTO :VAR-CLIENT-NBR,                                       CAT721  
                 :VAR-RCV-NBR,                                          CAT721  
                 :VAR-DLVR-NBR,                                         CAT721  
                 :VAR-ACCT-DLVR-NBR,                                    CAT721  
                 :VAR-ACCT-RCV-NBR,                                     CAT721  
                 :VAR-TRANS-RFRN-ID-CD,                                 CAT721  
                 :VAR-ACAT-CONTROL-NBR                                  CAT721  
           END-EXEC.                                                    CAT721  
      *                                                                 CAT721  
      *  CHECK IF THE INITIAL TRANSFER WAS RETRIEVED SUCCESSFULLY       CAT721  
      *                                                                 CAT721  
           IF  SQLCODE EQUAL ZERO                                       CAT721  
               CONTINUE                                                 CAT721  
           ELSE                                                         CAT721  
               IF  SQLCODE EQUAL 100                                    CAT721  
                   SET END-OF-PROCESS TO TRUE                           CAT721  
                   GO TO 0220-FETCH-EXIT                                CAT721  
               ELSE                                                     CAT721  
                   PERFORM 0600-ERRRTN                                  CAT721  
               END-IF                                                   CAT721  
           END-IF.                                                      CAT721  
           ADD 1 TO WS-FETCH-CTR.                                       CAT721  
                                                                        CAT721  
      * DELETE ALL CORRESPONDING RECORDS FROM THE INITIAL               CAT721  
      * ASSETS RECORD                                                   CAT721  
                                                                        CAT721  
           MOVE 10 TO WS-SQL-SEQ-NUM.                                   CAT721  
           EXEC SQL                                                     CAT721  
ET0001**   DELETE FROM VINITAST                                         CAT721  
ET0001     DELETE FROM ACTIAST                                          CAT721  
           WHERE CLIENT_NBR = :VAR-CLIENT-NBR                           CAT721  
             AND RCV_NBR = :VAR-RCV-NBR                                 CAT721  
             AND DLVR_NBR = :VAR-DLVR-NBR                               CAT721  
             AND ACCT_DLVR_NBR = :VAR-ACCT-DLVR-NBR                     CAT721  
             AND ACCT_RCV_NBR = :VAR-ACCT-RCV-NBR                       CAT721  
             AND TRANS_RFRN_ID_CD = :VAR-TRANS-RFRN-ID-CD               CAT721  
           END-EXEC.                                                    CAT721  
           IF  SQLCODE EQUAL ZERO                                       CAT721  
               ADD 1 TO WS-AST-DELETE-CTR                               CAT721  
               ADD 1 TO WS-A-COMMIT-CTR                                 CAT721  
           ELSE                                                         CAT721  
               IF  SQLCODE EQUAL 100                                    CAT721  
                   CONTINUE                                             CAT721  
               ELSE                                                     CAT721  
                   PERFORM 0600-ERRRTN                                  CAT721  
               END-IF                                                   CAT721  
           END-IF.                                                      CAT721  
      *                                                                 CAT721  
           EXEC SQL                                                     CAT721  
ET0001**   DELETE FROM VINITRNF                                         CAT721  
ET0001     DELETE FROM ACTITRF                                          CAT721  
           WHERE CLIENT_NBR = :VAR-CLIENT-NBR                           CAT721  
             AND RCV_NBR = :VAR-RCV-NBR                                 CAT721  
             AND DLVR_NBR = :VAR-DLVR-NBR                               CAT721  
             AND ACCT_DLVR_NBR = :VAR-ACCT-DLVR-NBR                     CAT721  
             AND ACCT_RCV_NBR = :VAR-ACCT-RCV-NBR                       CAT721  
             AND TRANS_RFRN_ID_CD = :VAR-TRANS-RFRN-ID-CD               CAT721  
             AND ACAT_CONTROL_NBR = :VAR-ACAT-CONTROL-NBR               CAT721  
           END-EXEC.                                                    CAT721  
           IF  SQLCODE EQUAL ZERO                                       CAT721  
               ADD 1 TO WS-TIF-DELETE-CTR                               CAT721  
               ADD 1 TO WS-A-COMMIT-CTR                                 CAT721  
           ELSE                                                         CAT721  
               IF  SQLCODE EQUAL 100                                    CAT721  
                   CONTINUE                                             CAT721  
               ELSE                                                     CAT721  
                   PERFORM 0600-ERRRTN                                  CAT721  
               END-IF                                                   CAT721  
           END-IF.                                                      CAT721  
      *                                                                 CAT721  
      *  ROLLBACK-NO                                                    CAT721  
      *                                                                 CAT721  
           IF WS-A-COMMIT-CTR > 100 AND ROLLBACK-NO                     CAT721  
              MOVE 0 TO WS-A-COMMIT-CTR                                 CAT721  
              EXEC SQL  COMMIT  END-EXEC.                               CAT721  
                                                                        CAT721  
       0220-FETCH-EXIT.                                                 CAT721  
           EXIT.                                                        CAT721  
                                                                        CAT721  
                                                                        CAT721  
       0600-ERRRTN.                                                     CAT721  
      *                                                                 CAT721  
      *    GENERAL ERROR ROUTINE                                        CAT721  
      *                                                                 CAT721  
           CALL DSNTIAR USING SQLCA                                     CAT721  
                                WS-MESSAGE                              CAT721  
                                WS-LENGTH.                              CAT721  
           IF RETURN-CODE = 0                                           CAT721  
              MOVE WS-ERR-TXT(1) TO MS-MESSAGE1                         CAT721  
              MOVE WS-ERR-TXT(2) TO MS-MESSAGE2                         CAT721  
              DISPLAY 'ERROR-MSG = ' MS-MESSAGE1 MS-MESSAGE2            CAT721  
           ELSE                                                         CAT721  
              DISPLAY 'ERROR MSG = ' WS-ERROR-MSG.                      CAT721  
           DISPLAY 'SQL SEQ NUM = '  WS-SQL-SEQ-NUM.                    CAT721  
           EXEC SQL ROLLBACK END-EXEC.                                  CAT721  
           MOVE 3999     TO ABEND-CODE.                                 CAT721  
           CALL ABEND USING ABEND-CODE.                                 CAT721  
       0600-ERRRTN-EXIT.                                                CAT721  
           EXIT.                                                        CAT721  
                                                                        CAT721  
