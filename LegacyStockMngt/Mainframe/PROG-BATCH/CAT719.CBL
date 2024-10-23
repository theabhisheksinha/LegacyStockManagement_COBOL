000001* PDX    - CAT719   C0260091 02/20/08 11:02:22 TBLAMUR            00001000
      * LRM001 - SSR# 55766 ASCENDIS CLIENT/SKIP ACTIAST DELETE BASED   CAT719  
      *        - ON B1S 434735,736 NO FULL REFRESH                              
000001* PDX    - CAT719   C0214955 12/28/04 10:30:13 TBEDTAK            00001000
      * ET0001 - SSR# 40042  DB2 KEY CHANGE WITH NEW TABLE NAME         CAT719  
000001* PDX    - CAT719   C0201405 03/12/04 15:34:06 TBDOJUN            00001000
      * DJ0002 - SSR# 0036896 ADD COMMIT TO REDUCE LOCK ESCALATIONS     CAT719  
000001* PDX    - CAT719   C0151178 12/18/00 08:42:58 TBDOJUN            00001000
      * DJ0001 COBOL LE                                                 CAT719  
000001* PDX    - CAT719   C0124189 04/14/99 23:04:44 TBDOJUN            CAT719  
000001* PDX    - CAT719   C0122194 02/23/99 16:55:51 TBDOJUN            CAT719  
000001* PDX    - CAT719   C0121087 01/31/99 10:40:18 TBDOJUN            CAT719  
000001* PDX    - CAT719   C0118608 12/08/98 13:55:22 TBDOJUN            CAT719  
000001* 12/03/98 DJ       DELETE INIT TRANFERS WHERE PEND=Y             CAT719  
000001*                   AND UPT-TMSTP < PRIOR PROC DATE               CAT719  
000001* PDX    - CAT719   C0115343 11/11/98 10:39:17 TVFRSAB            CAT719  
000001* PDX    - TEMPPROG C0114003 10/22/98 17:08:56 TVFRSAB            CAT719  
       IDENTIFICATION DIVISION.                                         CAT719  
       PROGRAM-ID.   CAT719.                                            CAT719  
       AUTHOR.       DHEERAJ AND LISA.                                  CAT719  
       DATE-WRITTEN. OCT 19, 1998.                                      CAT719  
       DATE-COMPILED.                                                   CAT719  
      *REMARKS.      THIS PROGRAM WILL SEARCH THE TRANSFER RECORDS      CAT719  
      *              FOR FULL TRANSFERS AND STATUS CODES BETWEEN        CAT719  
      *              100 AND 130 AND ERASE CORRESPONDING INITIAL        CAT719  
      *              ASSET RECORDS.                                     CAT719  
       ENVIRONMENT DIVISION.                                            CAT719  
       INPUT-OUTPUT SECTION.                                            CAT719  
       FILE-CONTROL.                                                    CAT719  
                                                                        CAT719  
       DATA DIVISION.                                                   CAT719  
       FILE SECTION.                                                    CAT719  
                                                                        CAT719  
       WORKING-STORAGE SECTION.                                         CAT719  
                                                                        CAT719  
DJ0001     COPY PDXIDCOB.                                               CAT719  
                                                                        CAT719  
      /                                                                 CAT719  
DJ0001***===> COBOL LE                                                  CAT719  
DJ0001 01  W-ABEND-AREA.                                                CAT719  
DJ0001     05  ABEND-CODE                PIC S9(04) COMP SYNC.          CAT719  
DJ0001 01  CALL-MODULES.                                                CAT719  
DJ0001     05  DSNTIAR                   PIC  X(08) VALUE 'DSNTIAR '.   CAT719  
DJ0001 01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.   CAT719  
DJ0001     COPY STUBCPY.                                                CAT719  
DJ0001***<=== COBOL LE                                                  CAT719  
      /                                                                 CAT719  
      *---------------------------------------------------------------* CAT719  
       01 VARIABLES.                                                    CAT719  
           05 VAR-CLIENT-NBR               PIC X(4)         VALUE ZEROS.CAT719  
LRM001     05 VAR-CLIENT-NBR-9 REDEFINES VAR-CLIENT-NBR                 CAT719  
LRM001                                     PIC 9(4).                            
           05 VAR-ACAT-CONTROL-NBR         PIC X(14)        VALUE ZEROS.CAT719  
           05 VAR-RCV-NBR                  PIC X(4)         VALUE ZEROS.CAT719  
           05 VAR-ACCT-RCV-NBR             PIC X(20)        VALUE ZEROS.CAT719  
           05 VAR-DLVR-NBR                 PIC X(4)         VALUE ZEROS.CAT719  
           05 VAR-ACCT-DLVR-NBR            PIC X(20)        VALUE ZEROS.CAT719  
           05 VAR-DAYS-STTS-QTY        PIC S9(4) USAGE COMP VALUE 0.    CAT719  
           05 VAR-STTS-CD              PIC X(3)             VALUE ' '.  CAT719  
                                                                        CAT719  
      *---------------------------------------------------------------* CAT719  
       01  WS-END-OF-PROCESS           PIC X.                           CAT719  
           88 END-OF-PROCESS           VALUE 'E'.                       CAT719  
           88 IN-PROCESS               VALUE ' '.                       CAT719  
       01  WS-HOLD-AREA.                                                CAT719  
           05 WS-STREAM-ID             PIC X            VALUE SPACES.   CAT719  
           05 WS-CLIENT-NBR            PIC X(4)         VALUE SPACES.   CAT719  
LRM001     05 WS-PREV-CLIENT-NBR       PIC X(4)         VALUE SPACES.   CAT719  
           05 WS-DATE.                                                  CAT719  
              10 WS-DATE-YY            PIC 99.                          CAT719  
              10 WS-DATE-MM            PIC 99.                          CAT719  
              10 WS-DATE-DD            PIC 99.                          CAT719  
           05 WA-SQLCODE               PIC -999         VALUE ZEROS.    CAT719  
           05 WA-SQLCABC               PIC -9999        VALUE ZEROS.    CAT719  
           05 WA-SQLERRML              PIC -9999        VALUE ZEROS.    CAT719  
      *--------------------------------------------------------------*  CAT719  
      *    COUNTERS                                                  *  CAT719  
      *--------------------------------------------------------------*  CAT719  
       01  WS-COUNTERS.                                                 CAT719  
           05  WS-ACAT-COUNTER          PIC  9(5)       VALUE ZEROS.    CAT719  
           05  WS-A-COUNTER             PIC  9(5)       VALUE ZEROS.    CAT719  
           05  NUMBER-OF-ATTEMPTS       PIC  9(5)       VALUE ZEROS.    CAT719  
                                                                        CAT719  
                                                                        CAT719  
DJ    *--------------------------------------------------------------*  CAT719  
       01  FILLER                        PIC  X(008) VALUE 'TIMESTMP'.  CAT719  
       01  W-CURRENT-TIMESTAMP           PIC  X(026).                   CAT719  
       01  W-COMPARE-TIMESTAMP-X.                                       CAT719  
           05  W-COMPARE-YEAR            PIC  X(004) VALUE '0001'.      CAT719  
           05  FILLER                    PIC  X(001) VALUE '-'.         CAT719  
           05  W-COMPARE-MM              PIC  X(002) VALUE '01'.        CAT719  
           05  FILLER                    PIC  X(001) VALUE '-'.         CAT719  
           05  W-COMPARE-DD              PIC  X(002) VALUE '01'.        CAT719  
           05  FILLER                    PIC  X(001) VALUE '-'.         CAT719  
           05  W-COMPARE-HH              PIC  X(002) VALUE '00'.        CAT719  
           05  FILLER                    PIC  X(001) VALUE '.'.         CAT719  
           05  W-COMPARE-MN              PIC  X(002) VALUE '00'.        CAT719  
           05  FILLER                    PIC  X(001) VALUE '.'.         CAT719  
           05  W-COMPARE-SS              PIC  X(002) VALUE '00'.        CAT719  
           05  FILLER                    PIC  X(001) VALUE '.'.         CAT719  
           05  W-COMPARE-MS              PIC  X(006) VALUE '000000'.    CAT719  
       01  W-COMPARE-TIMESTAMP REDEFINES                                CAT719  
           W-COMPARE-TIMESTAMP-X         PIC  X(026).                   CAT719  
                                                                        CAT719  
      /                                                                 CAT719  
      ******************************************************************CAT719  
      * DB2 ERROR MESSAGE AREA                                         *CAT719  
      ******************************************************************CAT719  
       01  W-DB2-MESSAGE-AREA.                                          CAT719  
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.    CAT719  
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES     CAT719  
                   INDEXED BY W-DB2-IDX.                                CAT719  
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.     CAT719  
                                                                        CAT719  
       01  W-DB2-WORKAREA.                                              CAT719  
           05  ROLLBACK-SQLCA            PIC  X(122).                   CAT719  
           05  ROLLBACK-RETURN           PIC S9(009) COMP.              CAT719  
               88  ROLLBACK-OK                VALUE +0.                 CAT719  
               88  ROLLBACK-AB                VALUE -999 THRU -1        CAT719  
                                                    +1   THRU +999.     CAT719  
           05  COMMIT-SQLCA              PIC  X(122).                   CAT719  
           05  COMMIT-RETURN             PIC S9(009) COMP.              CAT719  
               88  COMMIT-OK                  VALUE +0.                 CAT719  
               88  COMMIT-AB                  VALUE -999 THRU -1        CAT719  
                                                    +1   THRU +999.     CAT719  
           05  W-COMMIT-CTR              PIC  9(009) COMP-3             CAT719  
                                              VALUE 0.                  CAT719  
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(009) VALUE 0.           CAT719  
           05  W-DB2-TABLE-NAME          PIC  X(008).                   CAT719  
           05  W-DB2-ACTION              PIC  X(008).                   CAT719  
           05  W-SQLERRD-3                   PIC  S9(9).                CAT719  
           05  W-SQL-DELETE-COUNT            PIC  999999999.            CAT719  
           05  W-DB2-SQLCODE                 PIC  ---9.                 CAT719  
           05  W-TFR-SQLCODE                 PIC  S9(9) COMP-4.         CAT719  
                                                                        CAT719  
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.   CAT719  
           COPY BPDATESC.                                               CAT719  
                                                                        CAT719  
      *--------------------------------------------------------------*  CAT719  
      * COPY IN THE SQLCA AREA - THE COMMON COMMUNICATIONS AREA      *  CAT719  
      *--------------------------------------------------------------*  CAT719  
           EXEC SQL INCLUDE SQLCA END-EXEC.                             CAT719  
           EJECT                                                        CAT719  
                                                                        CAT719  
      *--------------------------------------------------------------*  CAT719  
      * COPY THE ACAT TRANSFER RECORD DESCRIPTION                    *  CAT719  
      *--------------------------------------------------------------*  CAT719  
           EXEC SQL INCLUDE                                             CAT719  
           VTRNFR END-EXEC.                                             CAT719  
           EJECT                                                        CAT719  
                                                                        CAT719  
      *--------------------------------------------------------------*  CAT719  
      * COPY THE INITIAL ASSET RECORD DESCRIPTION                    *  CAT719  
      *--------------------------------------------------------------*  CAT719  
           EXEC SQL INCLUDE                                             CAT719  
ET0001**   VINITAST END-EXEC.                                           CAT719  
ET0001     ACTIAST  END-EXEC.                                           CAT719  
           EJECT                                                        CAT719  
                                                                        CAT719  
      *--------------------------------------------------------------*  CAT719  
      * COPY THE INITIAL TRANSFER TABLE                              *  CAT719  
      *--------------------------------------------------------------*  CAT719  
           EXEC SQL INCLUDE                                             CAT719  
ET0001**   VINITRNF END-EXEC.                                           CAT719  
ET0001     ACTITRF  END-EXEC.                                           CAT719  
           EJECT                                                        CAT719  
                                                                        CAT719  
      *---------------------------------------------------------------* CAT719  
      * SQLCA ERROR MESSAGE WORK AREAS                                * CAT719  
      *---------------------------------------------------------------* CAT719  
                                                                        CAT719  
    ***********   START OF ERROR ROUTINE WORK AREAS    ***************  CAT719  
       01  WS-ERRL-DATA.                                                CAT719  
           05  REQUEST-TYPE       PIC X(01).                            CAT719  
                 88 WRITE-ERROR-TO-LOG           VALUE 'W'.             CAT719  
           05  CALLING-TRAN-ID    PIC X(04).                            CAT719  
           05  CALLING-PROGRAM-ID PIC X(08).                            CAT719  
           05  SQLCA-AREA         PIC X(136).                           CAT719  
                                                                        CAT719  
       01  MS-MESSAGE.                                                  CAT719  
           05  MS-MESSAGE1        PIC X(120)     VALUE SPACES.          CAT719  
           05  MS-MESSAGE2        PIC X(120)     VALUE SPACES.          CAT719  
           05  MS-MESSAGE3        PIC X(120)     VALUE SPACES.          CAT719  
                                                                        CAT719  
       01  WS-MESSAGE.                                                  CAT719  
           05  WS-ERR-LEN         PIC S9(4) COMP VALUE +1200.           CAT719  
           05  WS-ERR-TXT         PIC X(120) OCCURS 10 TIMES.           CAT719  
                                                                        CAT719  
       01  WS-ERROR-MSG.                                                CAT719  
           05  FILLER             PIC X(70)      VALUE                  CAT719  
           '**DB2** MESSAGE COULD NOT BE TRANSLATED ERROR IN DSNTIAR'.  CAT719  
           05  WS-DSNTIAR-RC      PIC X(08).                            CAT719  
                                                                        CAT719  
       77  WS-SQL-SEQ-NUM         PIC 999         VALUE ZEROS.          CAT719  
       77  WS-LENGTH              PIC S9(09) COMP VALUE +240.           CAT719  
                                                                        CAT719  
    ***********   END OF ERROR ROUTINE WORK AREAS    ***************    CAT719  
                                                                        CAT719  
      *---------------------------------------------------------------* CAT719  
      * SQL DECLARATION FOR INTFACE  - INTERFACE RECORD FOR CAGE/TRF  * CAT719  
      *---------------------------------------------------------------* CAT719  
                                                                        CAT719  
           EXEC SQL DECLARE ACATTRF CURSOR WITH HOLD FOR                CAT719  
                SELECT CLIENT_NBR,                                      CAT719  
                       ACAT_CONTROL_NBR,                                CAT719  
                       RCV_NBR,                                         CAT719  
                       ACCT_RCV_NBR,                                    CAT719  
                       DLVR_NBR,                                        CAT719  
                       ACCT_DLVR_NBR,                                   CAT719  
                       DAYS_STTS_QTY,                                   CAT719  
                       STTS_CD                                          CAT719  
                FROM VTRNFR                                             CAT719  
                WHERE TRNFR_TYPE_CD = 'FUL'                             CAT719  
                      AND (STTS_CD = '100' OR STTS_CD = '110')          CAT719  
                      AND (DAYS_STTS_QTY = 1)                           CAT719  
                ORDER BY                                                CAT719  
                        CLIENT_NBR                                      CAT719  
                       ,ACAT_CONTROL_NBR                                CAT719  
           END-EXEC.                                                    CAT719  
           EJECT                                                        CAT719  
                                                                        CAT719  
      *---------------------------------------------------------------* CAT719  
      * SQL DECLARATION FOR REJECTS IN STATUS 140 OR 600              * CAT719  
      *---------------------------------------------------------------* CAT719  
                                                                        CAT719  
           EXEC SQL DECLARE ACAT-REJECTS CURSOR WITH HOLD FOR           CAT719  
                SELECT CLIENT_NBR,                                      CAT719  
                       ACAT_CONTROL_NBR,                                CAT719  
                       RCV_NBR,                                         CAT719  
                       ACCT_RCV_NBR,                                    CAT719  
                       DLVR_NBR,                                        CAT719  
                       ACCT_DLVR_NBR,                                   CAT719  
                       DAYS_STTS_QTY,                                   CAT719  
                       STTS_CD                                          CAT719  
                FROM VTRNFR                                             CAT719  
                WHERE TRNFR_TYPE_CD = 'FUL'                             CAT719  
                      AND (STTS_CD = '140' OR                           CAT719  
                           STTS_CD = '600')                             CAT719  
                ORDER BY                                                CAT719  
                        CLIENT_NBR                                      CAT719  
                       ,ACAT_CONTROL_NBR                                CAT719  
           END-EXEC.                                                    CAT719  
      /                                                                         
       01  FILLER                        PIC X(08) VALUE 'BHINFO=='.            
           COPY BHINFO.                                                         
                                                                                
       01  FILLER                        PIC X(08) VALUE 'BHACAT=='.            
           COPY BHACAT.                                                         
           EJECT                                                        CAT719  
      /                                                                 CAT719  
       LINKAGE SECTION.                                                 CAT719  
       01  PARM-AREA.                                                   CAT719  
           10  PARM-LENGTH         PIC S9(4) COMP.                      CAT719  
           10  PARM-DATA-LIT       PIC X(7).                            CAT719  
           10  FILLER              PIC X.                               CAT719  
           10 PARM-ROLLBACK        PIC X.                               CAT719  
               88 ROLLBACK-YES     VALUE 'Y'.                           CAT719  
               88 ROLLBACK-NO      VALUE 'N'.                           CAT719  
                                                                        CAT719  
                                                                        CAT719  
       PROCEDURE DIVISION USING PARM-AREA.                              CAT719  
       0010-MAIN-LINE SECTION.                                          CAT719  
           DISPLAY 'CAT719 - PURGE INIT ASSETS FOR REQUEST STATUS '     CAT719  
                            'TRANFERS IN DAY 1 ONLY'.                   CAT719  
           DISPLAY '         PURGE INIT TRANFERS AND ASSETS'            CAT719  
                            ' WHERE NSCC-PEND-CD = Y'.                  CAT719  
           DISPLAY '         PURGE REJECTED INIT ASSETS'                CAT719  
           DISPLAY ' '.                                                 CAT719  
                                                                        CAT719  
           COPY MSGCOBO.                                                CAT719  
           DISPLAY                                                      CAT719  
           ' 0010-MAIN-LINE'                                            CAT719  
      *                                                                 CAT719  
      * VALIDATE THE PARM FIELDS PASSED                                 CAT719  
      *                                                                 CAT719  
            DISPLAY 'PARM-ROLLBACK  = ' PARM-ROLLBACK                   CAT719  
            IF PARM-ROLLBACK EQUAL 'Y'                                  CAT719  
               OR PARM-ROLLBACK EQUAL 'N'                               CAT719  
               NEXT SENTENCE                                            CAT719  
            ELSE                                                        CAT719  
               DISPLAY 'INVALID SYSTEM PARM PASSED'                     CAT719  
               DISPLAY 'PARM DATA = ' PARM-ROLLBACK                     CAT719  
               DISPLAY 'ABENDING PROGRAM CAT719'                        CAT719  
               MOVE 2001     TO ABEND-CODE                              CAT719  
               CALL ABEND USING ABEND-CODE                              CAT719  
               GOBACK.                                                  CAT719  
      *                                                                 CAT719  
      *  INITIALIZATIONS                                                CAT719  
      *                                                                 CAT719  
                                                                        CAT719  
DJ          PERFORM 0010-GET-TIMESTAMP THRU 0010-EXIT.                  CAT719  
                                                                        CAT719  
                                                                        CAT719  
DJ0002      DISPLAY 'PERFORM 0020-MAIN-LOGIC'                           CAT719  
            PERFORM 0020-MAIN-LOGIC THRU                                CAT719  
                    0020-MAIN-LOGIC-EXIT.                               CAT719  
            DISPLAY 'TOTAL ACATS RECORDS = '   WS-A-COUNTER.            CAT719  
            DISPLAY 'TOTAL INIT ASSET   RECORDS DELETED = '             CAT719  
               WS-ACAT-COUNTER                                          CAT719  
                                                                        CAT719  
DJ0002      DISPLAY 'PERFORM 0400-DELETE-REJECTS'                       CAT719  
DJ          PERFORM 0400-DELETE-REJECTS   THRU 0400-EXIT.               CAT719  
                                                                        CAT719  
DJ0002      DISPLAY 'PERFORM 0500-DELETE-OLD-STUFF'                     CAT719  
DJ          PERFORM 0500-DELETE-OLD-STUFF THRU 0500-EXIT.               CAT719  
                                                                        CAT719  
            DISPLAY 'CAT719 - ENDED SUCCESSFULLY.'                      CAT719  
            GOBACK.                                                     CAT719  
                                                                        CAT719  
      **************************************************************    CAT719  
      ***         PERFORM ROUTINES                               ***    CAT719  
      **************************************************************    CAT719  
                                                                        CAT719  
       0010-GET-TIMESTAMP SECTION.                                      CAT719  
                                                                        CAT719  
           EXEC SQL                                                     CAT719  
               SET :W-CURRENT-TIMESTAMP = CURRENT TIMESTAMP             CAT719  
           END-EXEC                                                     CAT719  
                                                                        CAT719  
           IF  SQLCODE = +0                                             CAT719  
               DISPLAY ' '                                              CAT719  
               DISPLAY 'CAT719: W-CURRENT-TIMESTAMP = '                 CAT719  
                                                    W-CURRENT-TIMESTAMP CAT719  
               DISPLAY ' '                                              CAT719  
           ELSE                                                         CAT719  
               DISPLAY 'CAT719: W-CURRENT-TIMESTAMP NOT SET'            CAT719  
               DISPLAY 'SQLCODE = ' SQLCODE                             CAT719  
               PERFORM 8500-SQL-ERROR THRU 8500-EXIT                    CAT719  
           END-IF.                                                      CAT719  
                                                                        CAT719  
           MOVE 'CAT719'                  TO BPDATES-CALLING-PGM.       CAT719  
           SET  LNKDATZ-REQUEST           TO TRUE.                      CAT719  
           CALL BPDATES USING BPDATES-PARAMETERS.                       CAT719  
                                                                        CAT719  
           DISPLAY ' '.                                                 CAT719  
           DISPLAY 'CAT719: BPD-PROC-DATE= ' BPD-PROC-DATE              CAT719  
                          ' BPD-PRIOR-PROC-DATE= ' BPD-PRIOR-PROC-DATE. CAT719  
           DISPLAY ' '.                                                 CAT719  
                                                                        CAT719  
           MOVE BPD-PRIOR-PROC-DATE(1:4) TO W-COMPARE-YEAR.             CAT719  
           MOVE BPD-PRIOR-PROC-DATE(5:2) TO W-COMPARE-MM.               CAT719  
           MOVE BPD-PRIOR-PROC-DATE(7:2) TO W-COMPARE-DD.               CAT719  
           DISPLAY 'CAT719: W-COMPARE-TIMESTAMP = ' W-COMPARE-TIMESTAMP CAT719  
           DISPLAY ' '.                                                 CAT719  
                                                                        CAT719  
       0010-EXIT.                                                       CAT719  
           EXIT.                                                        CAT719  
                                                                        CAT719  
                                                                        CAT719  
       0020-MAIN-LOGIC SECTION.                                         CAT719  
           DISPLAY  ' 0020-MAIN-LOGIC'                                  CAT719  
            SET IN-PROCESS TO TRUE                                      CAT719  
                                                                        CAT719  
            PERFORM 0040-OPEN-CURSOR THRU                               CAT719  
                    0040-OPEN-CURSOR-EXIT.                              CAT719  
      *                                                                 CAT719  
      *  EXTRACT SELECTION PROCESSING                                   CAT719  
      *                                                                 CAT719  
            PERFORM 0220-FETCH THRU                                     CAT719  
                    0220-FETCH-EXIT                                     CAT719  
              UNTIL END-OF-PROCESS.                                     CAT719  
      *                                                                 CAT719  
      *  END OF JOB PROCESSING                                          CAT719  
      *                                                                 CAT719  
            PERFORM 0080-CLOSE-CURSOR THRU                              CAT719  
                    0080-CLOSE-CURSOR-EXIT.                             CAT719  
      *                                                                 CAT719  
      *  ROLLING-BACK                                                   CAT719  
      *                                                                 CAT719  
           IF ROLLBACK-YES                                              CAT719  
               DISPLAY 'ROLLING BACK'                                   CAT719  
               EXEC SQL ROLLBACK                                        CAT719  
           END-EXEC.                                                    CAT719  
       0020-MAIN-LOGIC-EXIT.                                            CAT719  
           EXIT.                                                        CAT719  
                                                                        CAT719  
       0040-OPEN-CURSOR SECTION.                                        CAT719  
           DISPLAY                                                      CAT719  
           ' 0040-OPEN-CURSOR '                                         CAT719  
      *                                                                 CAT719  
      * OPEN CURSOR TO RETRIEVE THE INTERFACE RECORDS  (ROWS)           CAT719  
      *                                                                 CAT719  
           MOVE 10 TO WS-SQL-SEQ-NUM.                                   CAT719  
            EXEC SQL OPEN ACATTRF END-EXEC.                             CAT719  
           IF SQLCODE EQUAL ZERO                                        CAT719  
              NEXT SENTENCE                                             CAT719  
           ELSE                                                         CAT719  
               PERFORM 8500-SQL-ERROR THRU 8500-EXIT                    CAT719  
           END-IF.                                                      CAT719  
       0040-OPEN-CURSOR-EXIT.                                           CAT719  
           EXIT.                                                        CAT719  
                                                                        CAT719  
       0080-CLOSE-CURSOR SECTION.                                       CAT719  
           DISPLAY                                                      CAT719  
           ' 0080-CLOSE-CURSOR '                                        CAT719  
      *                                                                 CAT719  
      *  CLOSE THE CURSOR (SAME AS CLOSING FILE)                        CAT719  
      *                                                                 CAT719  
           MOVE 20 TO WS-SQL-SEQ-NUM.                                   CAT719  
            EXEC SQL CLOSE ACATTRF END-EXEC.                            CAT719  
           IF SQLCODE EQUAL ZERO                                        CAT719  
              NEXT SENTENCE                                             CAT719  
           ELSE                                                         CAT719  
               PERFORM 8500-SQL-ERROR THRU 8500-EXIT                    CAT719  
           END-IF.                                                      CAT719  
       0080-CLOSE-CURSOR-EXIT.                                          CAT719  
           EXIT.                                                        CAT719  
                                                                        CAT719  
       0220-FETCH SECTION.                                              CAT719  
           MOVE 50 TO WS-SQL-SEQ-NUM.                                   CAT719  
           EXEC SQL FETCH ACATTRF                                       CAT719  
            INTO :VAR-CLIENT-NBR,                                       CAT719  
                 :VAR-ACAT-CONTROL-NBR,                                 CAT719  
                 :VAR-RCV-NBR,                                          CAT719  
                 :VAR-ACCT-RCV-NBR,                                     CAT719  
                 :VAR-DLVR-NBR,                                         CAT719  
                 :VAR-ACCT-DLVR-NBR,                                    CAT719  
                 :VAR-DAYS-STTS-QTY,                                    CAT719  
                 :VAR-STTS-CD                                           CAT719  
           END-EXEC.                                                    CAT719  
      *                                                                 CAT719  
      *  CHECK IF THE ACAT TRANSFER WAS RETRIEVED SUCCESSFULLY          CAT719  
      *                                                                 CAT719  
           IF SQLCODE EQUAL ZERO                                        CAT719  
              CONTINUE                                                  CAT719  
           ELSE                                                         CAT719  
              IF SQLCODE EQUAL 100                                      CAT719  
                 DISPLAY 'SQLCODE IN FETCH = 100 '                      CAT719  
                 SET END-OF-PROCESS TO TRUE                             CAT719  
                 GO TO 0220-FETCH-EXIT                                  CAT719  
              ELSE                                                      CAT719  
                 PERFORM 8500-SQL-ERROR THRU 8500-EXIT                  CAT719  
              END-IF                                                    CAT719  
           END-IF.                                                      CAT719  
           ADD 1 TO WS-A-COUNTER                                        CAT719  
                                                                        CAT719  
LRM001     IF VAR-CLIENT-NBR NOT = WS-PREV-CLIENT-NBR                           
LRM001        MOVE VAR-CLIENT-NBR  TO WS-PREV-CLIENT-NBR                        
LRM001        MOVE  ' '                   TO  BH-BROKER-HEADER-INFO             
LRM001                                        BH-ACAT-INFO                      
LRM001        MOVE VAR-CLIENT-NBR-9       TO  BH-BROKER-NUMBER-N                
LRM001        MOVE  '015'                 TO  BH-LOGICAL-RECORD-CODE            
LRM001        MOVE  '434500'              TO  BH-B2-INFO-ID                     
LRM001        CALL  GETB1V              USING BH-BROKER-HEADER-INFO             
LRM001                                        BH-ACAT-INFO                      
LRM001     END-IF.                                                              
LRM001                                                                          
LRM001     IF BH-BROKER-ACTIVE                                                  
LRM001     AND BH-ACAT-ASCENDIS-USER = '1'                                      
LRM001     AND BH-ACAT-ASCENDIS-REFRESH = '0'                                   
LRM001        DISPLAY '0220-ASCENDIS:'                                  CAT719  
LRM001                ' CLT=' VAR-CLIENT-NBR,                           CAT719  
LRM001                ' CTL=' VAR-ACAT-CONTROL-NBR,                     CAT719  
LRM001                ' STA=' VAR-STTS-CD                               CAT719  
LRM001                ' SKIP DELETE / NON REFRESH CLIENT'                       
LRM001        GO TO 0220-FETCH-EXIT                                     CAT719  
LRM001     END-IF.                                                              
                                                                                
      * DELETE ALL ADJUSTMENT RECORDS                                   CAT719  
      * INITIALIZE FILE FOR NEXT DAY PROCESSING                         CAT719  
      *                                                                 CAT719  
           MOVE 10 TO WS-SQL-SEQ-NUM.                                   CAT719  
                                                                        CAT719  
           EXEC SQL                                                     CAT719  
ET0001**   DELETE FROM VINITAST                                         CAT719  
ET0001     DELETE FROM ACTIAST                                          CAT719  
           WHERE CLIENT_NBR       = :VAR-CLIENT-NBR                     CAT719  
             AND ACAT_CONTROL_NBR = :VAR-ACAT-CONTROL-NBR               CAT719  
           END-EXEC.                                                    CAT719  
                                                                        CAT719  
           MOVE SQLERRD(3)          TO W-SQLERRD-3                      CAT719  
           MOVE W-SQLERRD-3         TO W-SQL-DELETE-COUNT               CAT719  
           IF SQLCODE EQUAL ZERO                                        CAT719  
              DISPLAY '0220:'                                           CAT719  
                      ' CLT=' VAR-CLIENT-NBR,                           CAT719  
                      ' CTL=' VAR-ACAT-CONTROL-NBR,                     CAT719  
                      ' STA=' VAR-STTS-CD                               CAT719  
                      ' DAY=' VAR-DAYS-STTS-QTY                         CAT719  
ET0001**              ' VINITAST DEL'                                   CAT719  
ET0001                ' ACTIAST DEL'                                    CAT719  
                      ' CNT=' W-SQL-DELETE-COUNT                        CAT719  
           END-IF                                                       CAT719  
                                                                        CAT719  
           IF SQLCODE EQUAL ZERO                                        CAT719  
              ADD 1 TO WS-ACAT-COUNTER                                  CAT719  
              ADD 1 TO W-COMMIT-CTR                                     CAT719  
           ELSE                                                         CAT719  
               IF SQLCODE EQUAL 100                                     CAT719  
                  GO TO 0220-FETCH-EXIT                                 CAT719  
               ELSE                                                     CAT719  
                   PERFORM 8500-SQL-ERROR THRU 8500-EXIT                CAT719  
               END-IF                                                   CAT719  
           END-IF                                                       CAT719  
      *                                                                 CAT719  
      *  ROLLBACK-NO                                                    CAT719  
      *                                                                 CAT719  
           IF W-COMMIT-CTR > 10         AND ROLLBACK-NO                 CAT719  
              MOVE 0 TO W-COMMIT-CTR                                    CAT719  
              EXEC SQL COMMIT END-EXEC.                                 CAT719  
                                                                        CAT719  
       0220-FETCH-EXIT.                                                 CAT719  
           EXIT.                                                        CAT719  
                                                                        CAT719  
       0400-DELETE-REJECTS   SECTION.                                   CAT719  
           DISPLAY '0400-DELETE-REJECTS FROM INIT ASSET TABLE'          CAT719  
           EXEC SQL OPEN ACAT-REJECTS END-EXEC                          CAT719  
                                                                        CAT719  
           MOVE SQLCODE      TO W-TFR-SQLCODE                           CAT719  
           MOVE SQLCODE      TO W-DB2-SQLCODE                           CAT719  
           IF SQLCODE = +0                                              CAT719  
              DISPLAY '0400: ACAT-REJECTS CURSOR OPENED'                CAT719  
           ELSE                                                         CAT719  
              DISPLAY '0400: ACAT-REJECTS CURSOR OPEN ERROR '           CAT719  
                            'SQLCODE = ' W-DB2-SQLCODE                  CAT719  
           END-IF                                                       CAT719  
                                                                        CAT719  
           PERFORM UNTIL W-TFR-SQLCODE NOT = +0                         CAT719  
                                                                        CAT719  
             EXEC SQL FETCH ACAT-REJECTS                                CAT719  
                INTO :VAR-CLIENT-NBR,                                   CAT719  
                     :VAR-ACAT-CONTROL-NBR,                             CAT719  
                     :VAR-RCV-NBR,                                      CAT719  
                     :VAR-ACCT-RCV-NBR,                                 CAT719  
                     :VAR-DLVR-NBR,                                     CAT719  
                     :VAR-ACCT-DLVR-NBR,                                CAT719  
                     :VAR-DAYS-STTS-QTY,                                CAT719  
                     :VAR-STTS-CD                                       CAT719  
             END-EXEC                                                   CAT719  
                                                                        CAT719  
              MOVE SQLCODE      TO W-DB2-SQLCODE                        CAT719  
              MOVE SQLCODE      TO W-TFR-SQLCODE                        CAT719  
              EVALUATE SQLCODE                                          CAT719  
                  WHEN +0                                               CAT719  
                    DISPLAY '0450:'                                     CAT719  
                      ' CLT=' VAR-CLIENT-NBR,                           CAT719  
                      ' CTL=' VAR-ACAT-CONTROL-NBR,                     CAT719  
                      ' STA=' VAR-STTS-CD                               CAT719  
                      ' DAY=' VAR-DAYS-STTS-QTY                         CAT719  
                       PERFORM 0450-DELETE-VINITAST THRU 0450-EXIT      CAT719  
                  WHEN +100                                             CAT719  
                       DISPLAY '0400:'                                  CAT719  
                              ' ACAT-REJECTS FETCH NOT FOUND '          CAT719  
                              ' SQLCODE = ' W-DB2-SQLCODE               CAT719  
                  WHEN OTHER                                            CAT719  
                       DISPLAY '0400:'                                  CAT719  
                              ' ACAT-REJECTS FETCH ERROR '              CAT719  
                              ' SQLCODE = ' W-DB2-SQLCODE               CAT719  
                   PERFORM 8500-SQL-ERROR THRU 8500-EXIT                CAT719  
              END-EVALUATE                                              CAT719  
                                                                        CAT719  
           END-PERFORM                                                  CAT719  
                                                                        CAT719  
           EXEC SQL                                                     CAT719  
                CLOSE ACAT-REJECTS                                      CAT719  
           END-EXEC                                                     CAT719  
                                                                        CAT719  
           MOVE SQLCODE      TO W-DB2-SQLCODE                           CAT719  
           MOVE SQLCODE      TO W-TFR-SQLCODE                           CAT719  
           IF  SQLCODE = +0                                             CAT719  
              DISPLAY '0400: ACAT-REJECTS CLOSED'                       CAT719  
           ELSE                                                         CAT719  
               DISPLAY '0400:'                                          CAT719  
                      ' ACAT-REJECTS CLOSE ERROR '                      CAT719  
                      ' SQLCODE = ' W-DB2-SQLCODE                       CAT719  
                   PERFORM 8500-SQL-ERROR THRU 8500-EXIT                CAT719  
           END-IF.                                                      CAT719  
                                                                        CAT719  
       0400-EXIT. EXIT.                                                 CAT719  
      /                                                                 CAT719  
       0450-DELETE-VINITAST SECTION.                                    CAT719  
                                                                        CAT719  
ET0001**   EXEC SQL DELETE FROM VINITAST                                CAT719  
ET0001     EXEC SQL DELETE FROM ACTIAST                                 CAT719  
                WHERE  CLIENT_NBR       = :VAR-CLIENT-NBR               CAT719  
                  AND  ACAT_CONTROL_NBR = :VAR-ACAT-CONTROL-NBR         CAT719  
           END-EXEC.                                                    CAT719  
                                                                        CAT719  
           MOVE SQLERRD(3)          TO W-SQLERRD-3                      CAT719  
           MOVE W-SQLERRD-3         TO W-SQL-DELETE-COUNT               CAT719  
                                                                        CAT719  
           IF  SQLCODE = +0                                             CAT719  
                    DISPLAY '0450:'                                     CAT719  
                      ' CLT=' VAR-CLIENT-NBR,                           CAT719  
                      ' CTL=' VAR-ACAT-CONTROL-NBR,                     CAT719  
                      ' STA=' VAR-STTS-CD                               CAT719  
                      ' DAY=' VAR-DAYS-STTS-QTY                         CAT719  
ET0001**              ' VINITAST DEL'                                   CAT719  
ET0001                ' ACTIAST DEL'                                    CAT719  
                      ' CNT=' W-SQL-DELETE-COUNT                        CAT719  
DJ0002         ADD 1 TO WS-ACAT-COUNTER                                 CAT719  
DJ0002         ADD 1 TO W-COMMIT-CTR                                    CAT719  
           ELSE                                                         CAT719  
               IF SQLCODE = +100                                        CAT719  
                  CONTINUE                                              CAT719  
               ELSE                                                     CAT719  
               DISPLAY '0450:'                                          CAT719  
                     ' CLT=' VAR-CLIENT-NBR,                            CAT719  
                     ' CTL=' VAR-ACAT-CONTROL-NBR,                      CAT719  
ET0001**             ' VINITAST DELETE ERROR'                           CAT719  
ET0001               ' ACTIAST DELETE ERROR'                            CAT719  
                  MOVE SQLCODE      TO W-DB2-SQLCODE                    CAT719  
                  DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                    CAT719  
                   PERFORM 8500-SQL-ERROR THRU 8500-EXIT                CAT719  
               END-IF                                                   CAT719  
           END-IF.                                                      CAT719  
                                                                        CAT719  
DJ0002     IF W-COMMIT-CTR > 10         AND ROLLBACK-NO                 CAT719  
DJ0002        MOVE 0 TO W-COMMIT-CTR                                    CAT719  
DJ0002        EXEC SQL COMMIT END-EXEC.                                 CAT719  
                                                                        CAT719  
       0450-EXIT.                                                       CAT719  
           EXIT.                                                        CAT719  
                                                                        CAT719  
       0500-DELETE-OLD-STUFF SECTION.                                   CAT719  
           DISPLAY '0500-DELETE-OLD-STUFF -'                            CAT719  
                   ' WHERE NSCC-PEND-CD = Y '                           CAT719  
                                                                        CAT719  
           EXEC SQL                                                     CAT719  
ET0001**        DELETE FROM VINITRNF                                    CAT719  
ET0001          DELETE FROM ACTITRF                                     CAT719  
                WHERE NSCC_PEND_CD = 'Y'                                CAT719  
           END-EXEC.                                                    CAT719  
                                                                        CAT719  
           MOVE SQLERRD(3)          TO W-SQLERRD-3                      CAT719  
           MOVE W-SQLERRD-3         TO W-SQL-DELETE-COUNT               CAT719  
           IF SQLCODE EQUAL ZERO                                        CAT719  
ET0001**      DISPLAY '0500: VINITRNF DELETE WHERE PEND=Y'              CAT719  
ET0001        DISPLAY '0500: ACTITRF DELETE WHERE PEND=Y'               CAT719  
                      ' CNT=' W-SQL-DELETE-COUNT                        CAT719  
DJ0002         ADD 1 TO WS-ACAT-COUNTER                                 CAT719  
DJ0002         ADD 1 TO W-COMMIT-CTR                                    CAT719  
           ELSE                                                         CAT719  
              IF SQLCODE EQUAL 100                                      CAT719  
ET0001**         DISPLAY 'VINITRNF DELETE NOT FOUND'                    CAT719  
ET0001           DISPLAY 'ACTITRF DELETE NOT FOUND'                     CAT719  
              ELSE                                                      CAT719  
                 PERFORM 8500-SQL-ERROR THRU 8500-EXIT                  CAT719  
              END-IF                                                    CAT719  
           END-IF.                                                      CAT719  
                                                                        CAT719  
DJ0002     IF W-COMMIT-CTR > 10         AND ROLLBACK-NO                 CAT719  
DJ0002        MOVE 0 TO W-COMMIT-CTR                                    CAT719  
DJ0002        EXEC SQL COMMIT END-EXEC.                                 CAT719  
                                                                        CAT719  
           EXEC SQL                                                     CAT719  
ET0001**        DELETE FROM VINITAST                                    CAT719  
ET0001          DELETE FROM ACTIAST                                     CAT719  
                WHERE NSCC_PEND_CD = 'Y'                                CAT719  
           END-EXEC.                                                    CAT719  
                                                                        CAT719  
           MOVE SQLERRD(3)          TO W-SQLERRD-3                      CAT719  
           MOVE W-SQLERRD-3         TO W-SQL-DELETE-COUNT               CAT719  
           IF SQLCODE EQUAL ZERO                                        CAT719  
ET0001**      DISPLAY '0500: VINITAST DELETE WHERE PEND=Y'              CAT719  
ET0001        DISPLAY '0500: ACTIAST DELETE WHERE PEND=Y'               CAT719  
                      ' CNT=' W-SQL-DELETE-COUNT                        CAT719  
DJ0002         ADD 1 TO WS-ACAT-COUNTER                                 CAT719  
DJ0002         ADD 1 TO W-COMMIT-CTR                                    CAT719  
           ELSE                                                         CAT719  
              IF SQLCODE EQUAL 100                                      CAT719  
ET0001**         DISPLAY 'VINITAST DELETE NOT FOUND'                    CAT719  
ET0001           DISPLAY 'ACTIAST DELETE NOT FOUND'                     CAT719  
              ELSE                                                      CAT719  
                 PERFORM 8500-SQL-ERROR THRU 8500-EXIT                  CAT719  
              END-IF                                                    CAT719  
           END-IF.                                                      CAT719  
                                                                        CAT719  
DJ0002     IF W-COMMIT-CTR > 10         AND ROLLBACK-NO                 CAT719  
DJ0002        MOVE 0 TO W-COMMIT-CTR                                    CAT719  
DJ0002        EXEC SQL COMMIT END-EXEC.                                 CAT719  
                                                                        CAT719  
       0500-EXIT.                                                       CAT719  
           EXIT.                                                        CAT719  
      /                                                                 CAT719  
       8500-SQL-ERROR      SECTION.                                     CAT719  
           DISPLAY ' '                                                  CAT719  
           DISPLAY '8500-SQL-ERROR'                                     CAT719  
                                                                        CAT719  
           DISPLAY ' '                                                  CAT719  
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                  CAT719  
                                    W-DB2-MESSAGE-LEN.                  CAT719  
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                        CAT719  
             UNTIL W-DB2-IDX GREATER THAN 12                            CAT719  
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES              CAT719  
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)               CAT719  
                   END-IF                                               CAT719  
           END-PERFORM.                                                 CAT719  
           DISPLAY ' '                                                  CAT719  
                                                                        CAT719  
           PERFORM 8700-SQL-ROLLBACK THRU 8700-EXIT                     CAT719  
                                                                        CAT719  
           DISPLAY 'CAT719: U3999 - ABENDING ON BAD DB2 STATUS'         CAT719  
           DISPLAY 'CAT719: PROGRAM ENDED ABNORMALLY'                   CAT719  
           MOVE +3999    TO ABEND-CODE                                  CAT719  
           CALL ABEND USING ABEND-CODE.                                 CAT719  
                                                                        CAT719  
       8500-EXIT. EXIT.                                                 CAT719  
      /                                                                 CAT719  
       8700-SQL-ROLLBACK   SECTION.                                     CAT719  
           DISPLAY '8700-SQL-ROLLBACK'                                  CAT719  
                                                                        CAT719  
           EXEC SQL ROLLBACK WORK                                       CAT719  
           END-EXEC                                                     CAT719  
                                                                        CAT719  
           MOVE SQLCA   TO ROLLBACK-SQLCA                               CAT719  
           MOVE SQLCODE TO ROLLBACK-RETURN                              CAT719  
                                                                        CAT719  
           IF ROLLBACK-AB                                               CAT719  
               DISPLAY                                                  CAT719  
                   'AUTO ROLLBACK FAILED. ROLLBACK-RETURN = '           CAT719  
                   ROLLBACK-RETURN                                      CAT719  
           ELSE                                                         CAT719  
               DISPLAY                                                  CAT719  
                   'AUTO ROLLBACK SUCCESSFUL. ROLLBACK-RETURN = '       CAT719  
                   ROLLBACK-RETURN                                      CAT719  
           END-IF.                                                      CAT719  
                                                                        CAT719  
       8700-EXIT. EXIT.                                                 CAT719  
      *#################################################################CAT719  
