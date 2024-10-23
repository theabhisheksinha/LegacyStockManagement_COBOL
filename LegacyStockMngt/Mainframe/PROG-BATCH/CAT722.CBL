000001* PDX    - CAT722   C0280390 05/29/09 14:23:41 TBLAMUR            00001000
000001* LRM001 SSR 63084 USE MFNM,MFMM FOR MUTUAL FUND AUTO DELETE              
000001* RATHER THAN SELLE LOC = 10 TO MARK                                      
000001* PDX    - CAT722   C0214955 12/28/04 14:02:06 TBEDTAK            00001000
      * ET0001 SSR#40042 DB2 KEY CHANGE WITH NEW TABLE NAME             CAT722  
000001* PDX    - CAT722   C0211125 12/13/04 13:51:33 TBDOJUN            00001000
000001* DJ0003 SSR#29649 MUTUAL FUND AUTO DELETE. NEW B1#434689.        CAT722  
000001*          IF BH-ACAT-MF-AUTO-DELETE(434689) = '1',               CAT722  
000001*          RELEASE INIT ASSETS FOR MF DELETES BEFORE PURGE        CAT722  
000001* PDX    - CAT722   C0151178 12/18/00 08:44:05 TBDOJUN            CAT722  
      * DJ0001 COBOL LE                                                 CAT722  
000001* PDX    - CAT722   C0122736 03/11/99 19:01:28 TBDOJUN            CAT722  
000001* PDX    - CAT722   C0122065 02/20/99 19:56:23 TBDOJUN            CAT722  
       IDENTIFICATION DIVISION.                                         CAT722  
       PROGRAM-ID.   CAT722.                                            CAT722  
       DATE-COMPILED.                                                   CAT722  
      *REMARKS.      THIS PROGRAM WILL SEARCH THE TRANSFER RECORDS      CAT722  
      *              FOR FULL TRANSFERS AND STATUS CODES GREATER        CAT722  
      *              200  AND ERASE CORRESPONDING INITIAL               CAT722  
      *              ASSET RECORDS WITH PEND-CD OF 'H'                  CAT722  
       ENVIRONMENT DIVISION.                                            CAT722  
       INPUT-OUTPUT SECTION.                                            CAT722  
       FILE-CONTROL.                                                    CAT722  
                                                                        CAT722  
       DATA DIVISION.                                                   CAT722  
       FILE SECTION.                                                    CAT722  
                                                                        CAT722  
       WORKING-STORAGE SECTION.                                         CAT722  
                                                                        CAT722  
DJ0001     COPY PDXIDCOB.                                               CAT722  
                                                                        CAT722  
DJ0001***===> COBOL LE                                                  CAT722  
DJ0001 01  W-ABEND-AREA.                                                CAT722  
DJ0001     05  ABEND-CODE                PIC S9(04) COMP SYNC.          CAT722  
DJ0001 01  CALL-MODULES.                                                CAT722  
DJ0001     05  DSNTIAR                   PIC  X(08) VALUE 'DSNTIAR '.   CAT722  
DJ0001 01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.   CAT722  
DJ0001     COPY STUBCPY.                                                CAT722  
DJ0001***<=== COBOL LE                                                  CAT722  
      /                                                                 CAT722  
      *---------------------------------------------------------------* CAT722  
       01 VARIABLES.                                                    CAT722  
           05 WS-SQL-SEQ-NUM           PIC 999         VALUE ZEROS.     CAT722  
           05 VAR-CLIENT-NBR               PIC X(4)         VALUE ZEROS.CAT722  
           05 VAR-ACAT-CONTROL-NBR         PIC X(14)        VALUE ZEROS.CAT722  
           05 VAR-RCV-NBR                  PIC X(4)         VALUE ZEROS.CAT722  
           05 VAR-ACCT-RCV-NBR             PIC X(20)        VALUE ZEROS.CAT722  
           05 VAR-DLVR-NBR                 PIC X(4)         VALUE ZEROS.CAT722  
           05 VAR-ACCT-DLVR-NBR            PIC X(20)        VALUE ZEROS.CAT722  
           05 VAR-DAYS-STTS-QTY        PIC S9(4) USAGE COMP VALUE 0.    CAT722  
           05 VAR-STTS-CD              PIC X(3)             VALUE ' '.  CAT722  
                                                                        CAT722  
      *---------------------------------------------------------------* CAT722  
       01  WS-END-OF-PROCESS           PIC X.                           CAT722  
           88 END-OF-PROCESS           VALUE 'E'.                       CAT722  
           88 IN-PROCESS               VALUE ' '.                       CAT722  
      *--------------------------------------------------------------*  CAT722  
      *    COUNTERS                                                  *  CAT722  
      *--------------------------------------------------------------*  CAT722  
       01  WS-COUNTERS.                                                 CAT722  
           05  WS-ACAT-COUNTER          PIC  9(7) COMP-3 VALUE 0.       CAT722  
           05  WS-A-COMMIT-COUNTER      PIC  9(7) COMP-3 VALUE 0.       CAT722  
           05  W-FETCH-CNT              PIC  9(7) COMP-3 VALUE 0.       CAT722  
           05  W-VINITAST-DELETE-CNT    PIC  9(7) COMP-3 VALUE 0.       CAT722  
                                                                        CAT722  
DJ    *--------------------------------------------------------------*  CAT722  
       01  FILLER                        PIC  X(008) VALUE 'TIMESTMP'.  CAT722  
       01  W-CURRENT-TMSTMP              PIC  X(026).                   CAT722  
       01  W-CURRENT-TIMESTAMP REDEFINES                                CAT722  
           W-CURRENT-TMSTMP              PIC  X(026).                   CAT722  
       01  W-COMPARE-TIMESTAMP-X.                                       CAT722  
           05  W-COMPARE-YEAR            PIC  X(004) VALUE '0001'.      CAT722  
           05  FILLER                    PIC  X(001) VALUE '-'.         CAT722  
           05  W-COMPARE-MM              PIC  X(002) VALUE '01'.        CAT722  
           05  FILLER                    PIC  X(001) VALUE '-'.         CAT722  
           05  W-COMPARE-DD              PIC  X(002) VALUE '01'.        CAT722  
           05  FILLER                    PIC  X(001) VALUE '-'.         CAT722  
           05  W-COMPARE-HH              PIC  X(002) VALUE '00'.        CAT722  
           05  FILLER                    PIC  X(001) VALUE '.'.         CAT722  
           05  W-COMPARE-MN              PIC  X(002) VALUE '00'.        CAT722  
           05  FILLER                    PIC  X(001) VALUE '.'.         CAT722  
           05  W-COMPARE-SS              PIC  X(002) VALUE '00'.        CAT722  
           05  FILLER                    PIC  X(001) VALUE '.'.         CAT722  
           05  W-COMPARE-MS              PIC  X(006) VALUE '000000'.    CAT722  
       01  W-COMPARE-TIMESTAMP REDEFINES                                CAT722  
           W-COMPARE-TIMESTAMP-X         PIC  X(026).                   CAT722  
                                                                        CAT722  
      ******************************************************************CAT722  
      * DB2 ERROR MESSAGE AREA                                         *CAT722  
      ******************************************************************CAT722  
       01  W-DB2-MESSAGE-AREA.                                          CAT722  
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.    CAT722  
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES     CAT722  
                   INDEXED BY W-DB2-IDX.                                CAT722  
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.     CAT722  
                                                                        CAT722  
       01  W-DB2-WORKAREA.                                              CAT722  
           05  ROLLBACK-SQLCA            PIC  X(122).                   CAT722  
           05  ROLLBACK-RETURN           PIC S9(009) COMP.              CAT722  
               88  ROLLBACK-OK                VALUE +0.                 CAT722  
               88  ROLLBACK-AB                VALUE -999 THRU -1        CAT722  
                                                    +1   THRU +999.     CAT722  
           05  COMMIT-SQLCA              PIC  X(122).                   CAT722  
           05  COMMIT-RETURN             PIC S9(009) COMP.              CAT722  
               88  COMMIT-OK                  VALUE +0.                 CAT722  
               88  COMMIT-AB                  VALUE -999 THRU -1        CAT722  
                                                    +1   THRU +999.     CAT722  
           05  W-DB2-TABLE-NAME          PIC  X(008).                   CAT722  
           05  W-DB2-ACTION              PIC  X(008).                   CAT722  
           05  W-SQLERRD-3                   PIC  S9(9).                CAT722  
           05  W-SQL-DELETE-COUNT            PIC  999999999.            CAT722  
           05  W-SQL-UPDATE-COUNT            PIC  999999999.            CAT722  
           05  W-DB2-SQLCODE                 PIC  ---9.                 CAT722  
           05  W-TFR-SQLCODE                 PIC  S9(9) COMP-4.         CAT722  
                                                                        CAT722  
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.   CAT722  
           COPY BPDATESC.                                               CAT722  
      /                                                                 CAT722  
DJ0003 01  FILLER                        PIC X(08) VALUE 'BHINFO  '.    CAT722  
DJ0003     COPY BHINFO.                                                 CAT722  
      /                                                                 CAT722  
DJ0003 01  FILLER                        PIC X(08) VALUE 'BHACAT  '.    CAT722  
DJ0003     COPY BHACAT.                                                 CAT722  
      /                                                                 CAT722  
DJ0003 01  FILLER                        PIC X(008) VALUE 'B1-TABLE'.   CAT722  
DJ0003 01  B1-WORK-FIELEDS.                                             CAT722  
DJ0003     03  B1-TBL-CNT                   PIC 9(03) COMP-3 VALUE 0.   CAT722  
DJ0003     03  B1-SUB                       PIC 9(03) COMP-3 VALUE 0.   CAT722  
DJ0003     03  B1-CLIENT-NO                 PIC X(04) VALUE '0000'.     CAT722  
DJ0003     03  B1-BROKER-NO                 PIC X(04) VALUE '0000'.     CAT722  
DJ0003 01  B1-TABLE-AREA.                                               CAT722  
DJ0003     03  B1-TABLE OCCURS 500 TIMES.                               CAT722  
DJ0003         05  B1-ADP-CL-NO             PIC 9(04).                  CAT722  
DJ0003         05  B1-CLI-NAME              PIC X(30).                  CAT722  
DJ0003         05  B1-BKR-CLR-NO            PIC X(04).                  CAT722  
DJ0003         05  B1-STREAM                PIC X(01).                  CAT722  
DJ0003         05  B1-STATUS                PIC X(01).                  CAT722  
DJ0003         05  B1-ACAT-STATUS           PIC X(01).                  CAT722  
DJ0003         05  B1-ACAT-MF-AUTO-DELETE   PIC X(01).                  CAT722  
      /                                                                 CAT722  
      *--------------------------------------------------------------*  CAT722  
      * COPY IN THE SQLCA AREA - THE COMMON COMMUNICATIONS AREA      *  CAT722  
      *--------------------------------------------------------------*  CAT722  
           EXEC SQL INCLUDE SQLCA END-EXEC.                             CAT722  
           EJECT                                                        CAT722  
                                                                        CAT722  
      *--------------------------------------------------------------*  CAT722  
      * COPY THE ACAT TRANSFER RECORD DESCRIPTION                    *  CAT722  
      *--------------------------------------------------------------*  CAT722  
           EXEC SQL INCLUDE                                             CAT722  
           VTRNFR END-EXEC.                                             CAT722  
           EJECT                                                        CAT722  
                                                                        CAT722  
      *--------------------------------------------------------------*  CAT722  
      * COPY THE INITIAL ASSET RECORD DESCRIPTION                    *  CAT722  
      *--------------------------------------------------------------*  CAT722  
           EXEC SQL INCLUDE                                             CAT722  
ET0001     ACTIAST END-EXEC.                                            CAT722  
ET0001**   VINITAST END-EXEC.                                           CAT722  
           EJECT                                                        CAT722  
                                                                        CAT722  
      *--------------------------------------------------------------*  CAT722  
      * COPY THE INITIAL TRANSFER TABLE                              *  CAT722  
      *--------------------------------------------------------------*  CAT722  
           EXEC SQL INCLUDE                                             CAT722  
ET0001     ACTITRF END-EXEC.                                            CAT722  
ET0001**   VINITRNF END-EXEC.                                           CAT722  
           EJECT                                                        CAT722  
      *--------------------------------------------------------------*  CAT722  
      * DECLARE CURSOR                                               *  CAT722  
      *---------------------------------------------------------------* CAT722  
           EXEC SQL DECLARE ACATTRF CURSOR WITH HOLD FOR                CAT722  
                SELECT CLIENT_NBR,                                      CAT722  
                       ACAT_CONTROL_NBR,                                CAT722  
                       RCV_NBR,                                         CAT722  
                       ACCT_RCV_NBR,                                    CAT722  
                       DLVR_NBR,                                        CAT722  
                       ACCT_DLVR_NBR,                                   CAT722  
                       DAYS_STTS_QTY,                                   CAT722  
                       STTS_CD                                          CAT722  
                FROM VTRNFR                                             CAT722  
                WHERE TRNFR_TYPE_CD = 'FUL'                             CAT722  
                      AND (STTS_CD  > '199')                            CAT722  
                ORDER BY CLIENT_NBR,                                    CAT722  
                         ACAT_CONTROL_NBR                               CAT722  
                END-EXEC.                                               CAT722  
                                                                        CAT722  
           EJECT                                                        CAT722  
                                                                        CAT722  
       LINKAGE SECTION.                                                 CAT722  
       01  PARM-AREA.                                                   CAT722  
           10  PARM-LENGTH         PIC S9(4) COMP.                      CAT722  
           10  PARM-DATA-LIT       PIC X(7).                            CAT722  
           10  FILLER              PIC X.                               CAT722  
           10 PARM-ROLLBACK        PIC X.                               CAT722  
               88 ROLLBACK-YES     VALUE 'Y'.                           CAT722  
               88 ROLLBACK-NO      VALUE 'N'.                           CAT722  
                                                                        CAT722  
                                                                        CAT722  
       PROCEDURE DIVISION USING PARM-AREA.                              CAT722  
       0000-MAIN-LINE SECTION.                                          CAT722  
           DISPLAY 'CAT722 - PURGE INIT ASSETS FOR STATUS >= 200'       CAT722  
                            ' WHERE NSCC-PEND-CD = H'.                  CAT722  
           DISPLAY '       - RELEASE MUTUAL FUND AUTO DELETE    '.      CAT722  
           DISPLAY ' '.                                                 CAT722  
                                                                        CAT722  
           COPY MSGCOBO.                                                CAT722  
                                                                        CAT722  
      *                                                                 CAT722  
      * VALIDATE THE PARM FIELDS PASSED                                 CAT722  
      *                                                                 CAT722  
            DISPLAY 'PARM-ROLLBACK  = ' PARM-ROLLBACK                   CAT722  
            IF PARM-ROLLBACK EQUAL 'Y'                                  CAT722  
               OR PARM-ROLLBACK EQUAL 'N'                               CAT722  
               NEXT SENTENCE                                            CAT722  
            ELSE                                                        CAT722  
               DISPLAY 'INVALID SYSTEM PARM PASSED FOR ROLLBACK'        CAT722  
               DISPLAY 'PARM DATA = ' PARM-ROLLBACK                     CAT722  
                       '  VALID VALUES SHOULD BE Y OR N'                CAT722  
               DISPLAY 'ABENDING PROGRAM CAT722. FIX AND RERUN'         CAT722  
               MOVE 2001     TO ABEND-CODE                              CAT722  
               CALL ABEND USING ABEND-CODE                              CAT722  
               GOBACK.                                                  CAT722  
      *                                                                 CAT722  
      *  INITIALIZATIONS                                                CAT722  
      *                                                                 CAT722  
                                                                        CAT722  
DJ          PERFORM 1000-INIT THRU 1000-EXIT.                           CAT722  
                                                                        CAT722  
DJ0003      PERFORM 2000-MF-AUTO-DELETE THRU 2000-EXIT.                 CAT722  
                                                                        CAT722  
            PERFORM 3000-PURGE-LOGIC THRU                               CAT722  
                    3000-PURGE-LOGIC-EXIT.                              CAT722  
            DISPLAY 'TOTAL TRANSFER FETCHED = ' W-FETCH-CNT.            CAT722  
ET0001**    DISPLAY 'TOTAL VINITAST DELETED = ' W-VINITAST-DELETE-CNT.  CAT722  
ET0001      DISPLAY 'TOTAL ACTIAST DELETED  = ' W-VINITAST-DELETE-CNT.  CAT722  
                                                                        CAT722  
            DISPLAY 'CAT722 - ENDED SUCCESSFULLY.'                      CAT722  
            GOBACK.                                                     CAT722  
                                                                        CAT722  
      **************************************************************    CAT722  
      ***         PERFORM ROUTINES                               ***    CAT722  
      **************************************************************    CAT722  
                                                                        CAT722  
       1000-INIT SECTION.                                               CAT722  
           DISPLAY 'CAT722: 1000-INIT   '.                              CAT722  
                                                                        CAT722  
           EXEC SQL                                                     CAT722  
               SET :W-CURRENT-TIMESTAMP = CURRENT TIMESTAMP             CAT722  
           END-EXEC                                                     CAT722  
                                                                        CAT722  
           IF  SQLCODE = +0                                             CAT722  
               DISPLAY ' '                                              CAT722  
               DISPLAY 'CAT722: W-CURRENT-TIMESTAMP = '                 CAT722  
                                                    W-CURRENT-TIMESTAMP CAT722  
               DISPLAY ' '                                              CAT722  
           ELSE                                                         CAT722  
               DISPLAY 'CAT722: W-CURRENT-TIMESTAMP NOT SET'            CAT722  
               DISPLAY 'SQLCODE = ' SQLCODE                             CAT722  
               PERFORM 8500-SQL-ERROR THRU 8500-EXIT                    CAT722  
           END-IF.                                                      CAT722  
                                                                        CAT722  
           MOVE 'CAT722'                  TO BPDATES-CALLING-PGM.       CAT722  
           SET  LNKDATZ-REQUEST           TO TRUE.                      CAT722  
           CALL BPDATES USING BPDATES-PARAMETERS.                       CAT722  
                                                                        CAT722  
           DISPLAY ' '.                                                 CAT722  
           DISPLAY 'CAT722: BPD-PROC-DATE= ' BPD-PROC-DATE              CAT722  
                          ' BPD-PRIOR-PROC-DATE= ' BPD-PRIOR-PROC-DATE. CAT722  
           DISPLAY ' '.                                                 CAT722  
                                                                        CAT722  
           MOVE BPD-PRIOR-PROC-DATE(1:4) TO W-COMPARE-YEAR.             CAT722  
           MOVE BPD-PRIOR-PROC-DATE(5:2) TO W-COMPARE-MM.               CAT722  
           MOVE BPD-PRIOR-PROC-DATE(7:2) TO W-COMPARE-DD.               CAT722  
           DISPLAY 'CAT722: W-COMPARE-TIMESTAMP = ' W-COMPARE-TIMESTAMP CAT722  
           DISPLAY ' '.                                                 CAT722  
           PERFORM 1500-LOAD-B1        THRU 1500-EXIT.                  CAT722  
                                                                        CAT722  
       1000-EXIT.                                                       CAT722  
           EXIT.                                                        CAT722  
      /                                                                 CAT722  
       1500-LOAD-B1 SECTION.                                            CAT722  
           DISPLAY 'CAT722: 1500-LOAD-B1'.                              CAT722  
                                                                        CAT722  
           MOVE SPACES                   TO  B1-TABLE-AREA.             CAT722  
           MOVE 0                        TO  B1-TBL-CNT.                CAT722  
                                                                        CAT722  
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500        CAT722  
                                                                        CAT722  
             MOVE  ' '                   TO  BH-BROKER-HEADER-INFO      CAT722  
                                             BH-ACAT-INFO               CAT722  
             MOVE  B1-SUB                TO  BH-BROKER-NUMBER-N         CAT722  
             MOVE  '015'                 TO  BH-LOGICAL-RECORD-CODE     CAT722  
             MOVE  '434500'              TO  BH-B2-INFO-ID              CAT722  
             CALL  GETB1V              USING BH-BROKER-HEADER-INFO      CAT722  
                                             BH-ACAT-INFO               CAT722  
             IF   BH-BROKER-ACTIVE                                      CAT722  
              AND BH-ACAT-ACTIVE                                        CAT722  
                   ADD 1 TO B1-TBL-CNT                                  CAT722  
                   MOVE  BH-BROKER-NUMBER-N                             CAT722  
                                         TO B1-ADP-CL-NO  (B1-TBL-CNT)  CAT722  
                   MOVE  BH-BROKER-NAME                                 CAT722  
                                         TO B1-CLI-NAME   (B1-TBL-CNT)  CAT722  
                   MOVE  BH-BROKER-OLD-CLEARING-HOUSE (2:4)             CAT722  
                                         TO B1-BKR-CLR-NO (B1-TBL-CNT)  CAT722  
                   IF  BH-BROKER-MINI-MAXI-SUBGROUP > ' '               CAT722  
                       MOVE BH-BROKER-MINI-MAXI-SUBGROUP                CAT722  
                                         TO B1-STREAM     (B1-TBL-CNT)  CAT722  
                   ELSE                                                 CAT722  
                      MOVE BH-BROKER-MINI-MAXI-INDICATOR                CAT722  
                                         TO B1-STREAM     (B1-TBL-CNT)  CAT722  
                   END-IF                                               CAT722  
                   MOVE  BH-BROKER-STATUS                               CAT722  
                                         TO B1-STATUS     (B1-TBL-CNT)  CAT722  
                   MOVE  BH-ACAT-STATUS                                 CAT722  
                                         TO B1-ACAT-STATUS(B1-TBL-CNT)  CAT722  
                   MOVE  BH-ACAT-MF-AUTO-DELETE                         CAT722  
                                 TO B1-ACAT-MF-AUTO-DELETE(B1-TBL-CNT)  CAT722  
                       DISPLAY     'CNT=' B1-TBL-CNT                    CAT722  
                                    ' CLT ' B1-ADP-CL-NO  (B1-TBL-CNT)  CAT722  
                                        ' ' B1-CLI-NAME   (B1-TBL-CNT)  CAT722  
                                    ' BKR ' B1-BKR-CLR-NO (B1-TBL-CNT)  CAT722  
                                    ' STR ' B1-STREAM     (B1-TBL-CNT)  CAT722  
                    ' MF-AUTO-DEL ' B1-ACAT-MF-AUTO-DELETE(B1-TBL-CNT)  CAT722  
             END-IF                                                     CAT722  
                                                                        CAT722  
           END-PERFORM.                                                 CAT722  
                                                                        CAT722  
           DISPLAY ' '.                                                 CAT722  
                                                                        CAT722  
           DISPLAY  'B1 TABLE COUNT = ' B1-TBL-CNT.                     CAT722  
           DISPLAY ' '.                                                 CAT722  
       1500-EXIT. EXIT.                                                 CAT722  
                                                                        CAT722  
                                                                        CAT722  
DJ0003 2000-MF-AUTO-DELETE SECTION.                                     CAT722  
DJ0003     DISPLAY 'CAT722: 2000-MF-AUTO-DELETE'.                       CAT722  
DJ0003                                                                  CAT722  
DJ0003     PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500        CAT722  
DJ0003                                                                  CAT722  
DJ0003       IF  B1-ACAT-MF-AUTO-DELETE(B1-SUB) = '1'                   CAT722  
DJ0003           MOVE B1-ADP-CL-NO  (B1-SUB) TO B1-CLIENT-NO            CAT722  
DJ0003           MOVE B1-BKR-CLR-NO (B1-SUB) TO B1-BROKER-NO            CAT722  
DJ0003           PERFORM 2100-MF-AUTO-RELEASE THRU 2100-EXIT            CAT722  
DJ0003       END-IF                                                     CAT722  
DJ0003                                                                  CAT722  
DJ0003     END-PERFORM.                                                 CAT722  
DJ0003                                                                  CAT722  
DJ0003 2000-EXIT. EXIT.                                                 CAT722  
                                                                        CAT722  
                                                                        CAT722  
DJ0003 2100-MF-AUTO-RELEASE SECTION.                                    CAT722  
DJ0003                                                                  CAT722  
DJ0003     EXEC SQL                                                     CAT722  
ET0001**     UPDATE VINITAST                                            CAT722  
ET0001       UPDATE ACTIAST                                             CAT722  
DJ0003          SET NSCC_PEND_CD  = ' '                                 CAT722  
DJ0003             ,PRGM_NM       = 'CAT722'                            CAT722  
DJ0003             ,UPDT_TMSTP    = :W-CURRENT-TMSTMP                   CAT722  
DJ0003        WHERE CLIENT_NBR    = :B1-CLIENT-NO                       CAT722  
DJ0003          AND RCV_NBR       = :B1-BROKER-NO                       CAT722  
DJ0003          AND PRGM_NM       = 'CAT515'                            CAT722  
DJ0003          AND TRNFR_TYPE_CD = 'FUL'                               CAT722  
LRM001          AND (ASSET_PRC_CTGY_CD IN ('MFMM', 'MFNM'))                     
DJ0003          AND TRANS_TYPE_CD = 'D'                                 CAT722  
DJ0003          AND NSCC_PEND_CD  = 'H'                                 CAT722  
DJ0003     END-EXEC.                                                    CAT722  
DJ0003**********AND STTLM_LCTN_CD = '10'                                CAT722  
DJ0003                                                                  CAT722  
DJ0003     MOVE SQLERRD(3)          TO W-SQLERRD-3                      CAT722  
DJ0003     MOVE W-SQLERRD-3         TO W-SQL-UPDATE-COUNT               CAT722  
DJ0003                                                                  CAT722  
DJ0003     IF SQLCODE EQUAL ZERO                                        CAT722  
DJ0003        DISPLAY '2100: CLT=' B1-CLIENT-NO                         CAT722  
DJ0003                     ' BKR=' B1-BROKER-NO                         CAT722  
ET0001**              ' VINITAST MF-AUTO-DELETE RELEASED'               CAT722  
ET0001                ' ACTIAST MF-AUTO-DELETE RELEASED'                CAT722  
DJ0003          ' CNT=' W-SQL-UPDATE-COUNT                              CAT722  
DJ0003     ELSE                                                         CAT722  
DJ0003         IF SQLCODE EQUAL 100                                     CAT722  
DJ0003            DISPLAY '2100: CLT=' B1-CLIENT-NO                     CAT722  
DJ0003                     ' BKR=' B1-BROKER-NO                         CAT722  
ET0001**                  ' VINITAST MF-AUTO-DELETE NOT FOUND'          CAT722  
ET0001                    ' ACTIAST MF-AUTO-DELETE NOT FOUND'           CAT722  
DJ0003            GO TO 2100-EXIT                                       CAT722  
DJ0003         ELSE                                                     CAT722  
DJ0003            DISPLAY '2100: CLT=' B1-CLIENT-NO                     CAT722  
DJ0003                     ' BKR=' B1-BROKER-NO                         CAT722  
ET0001**                  ' VINITAST MF-AUTO-DELETE SQL ERROR'          CAT722  
ET0001                    ' ACTIAST MF-AUTO-DELETE SQL ERROR'           CAT722  
DJ0003             PERFORM 8500-SQL-ERROR THRU 8500-EXIT                CAT722  
DJ0003         END-IF                                                   CAT722  
DJ0003     END-IF.                                                      CAT722  
DJ0003                                                                  CAT722  
DJ0003 2100-EXIT. EXIT.                                                 CAT722  
                                                                        CAT722  
                                                                        CAT722  
       3000-PURGE-LOGIC SECTION.                                        CAT722  
           DISPLAY 'CAT722: 3000-PURGE-LOGIC '.                         CAT722  
            SET IN-PROCESS TO TRUE                                      CAT722  
                                                                        CAT722  
            PERFORM 3100-OPEN-CURSOR THRU                               CAT722  
                    3100-OPEN-CURSOR-EXIT.                              CAT722  
      *                                                                 CAT722  
      *  EXTRACT SELECTION PROCESSING                                   CAT722  
      *                                                                 CAT722  
            PERFORM 3200-FETCH THRU                                     CAT722  
                    3200-FETCH-EXIT                                     CAT722  
              UNTIL END-OF-PROCESS.                                     CAT722  
      *                                                                 CAT722  
      *  END OF JOB PROCESSING                                          CAT722  
      *                                                                 CAT722  
            PERFORM 3300-CLOSE-CURSOR THRU                              CAT722  
                    3300-CLOSE-CURSOR-EXIT.                             CAT722  
      *                                                                 CAT722  
      *  ROLLING-BACK                                                   CAT722  
      *                                                                 CAT722  
           IF ROLLBACK-YES                                              CAT722  
               DISPLAY '3000: ROLLING BACK'                             CAT722  
               EXEC SQL ROLLBACK                                        CAT722  
           END-EXEC.                                                    CAT722  
       3000-PURGE-LOGIC-EXIT.                                           CAT722  
           EXIT.                                                        CAT722  
                                                                        CAT722  
       3100-OPEN-CURSOR SECTION.                                        CAT722  
           DISPLAY 'CAT722: 3100-OPEN-CURSOR '.                         CAT722  
      *                                                                 CAT722  
      * OPEN CURSOR TO RETRIEVE THE INTERFACE RECORDS  (ROWS)           CAT722  
      *                                                                 CAT722  
           MOVE 10 TO WS-SQL-SEQ-NUM.                                   CAT722  
            EXEC SQL OPEN ACATTRF END-EXEC.                             CAT722  
           IF SQLCODE EQUAL ZERO                                        CAT722  
              NEXT SENTENCE                                             CAT722  
           ELSE                                                         CAT722  
               PERFORM 8500-SQL-ERROR THRU 8500-EXIT                    CAT722  
           END-IF.                                                      CAT722  
       3100-OPEN-CURSOR-EXIT.                                           CAT722  
           EXIT.                                                        CAT722  
                                                                        CAT722  
       3200-FETCH SECTION.                                              CAT722  
           MOVE 50 TO WS-SQL-SEQ-NUM.                                   CAT722  
           EXEC SQL FETCH ACATTRF                                       CAT722  
            INTO :VAR-CLIENT-NBR,                                       CAT722  
                 :VAR-ACAT-CONTROL-NBR,                                 CAT722  
                 :VAR-RCV-NBR,                                          CAT722  
                 :VAR-ACCT-RCV-NBR,                                     CAT722  
                 :VAR-DLVR-NBR,                                         CAT722  
                 :VAR-ACCT-DLVR-NBR,                                    CAT722  
                 :VAR-DAYS-STTS-QTY,                                    CAT722  
                 :VAR-STTS-CD                                           CAT722  
           END-EXEC.                                                    CAT722  
      *                                                                 CAT722  
      *  CHECK IF THE ACAT TRANSFER WAS RETRIEVED SUCCESSFULLY          CAT722  
      *                                                                 CAT722  
           IF SQLCODE EQUAL ZERO                                        CAT722  
              CONTINUE                                                  CAT722  
           ELSE                                                         CAT722  
              IF SQLCODE EQUAL 100                                      CAT722  
                 DISPLAY '3200: FETCH NOT FOUND '                       CAT722  
                 SET END-OF-PROCESS TO TRUE                             CAT722  
                 GO TO 3200-FETCH-EXIT                                  CAT722  
              ELSE                                                      CAT722  
                 DISPLAY '3200: FETCH SQL ERROR '                       CAT722  
                 PERFORM 8500-SQL-ERROR THRU 8500-EXIT                  CAT722  
              END-IF                                                    CAT722  
           END-IF.                                                      CAT722  
                                                                        CAT722  
           ADD 1 TO W-FETCH-CNT                                         CAT722  
                                                                        CAT722  
      * DELETE ALL INIT ASSET RECORDS                                   CAT722  
      * INITIALIZE FILE FOR NEXT DAY PROCESSING                         CAT722  
      *                                                                 CAT722  
           MOVE 60 TO WS-SQL-SEQ-NUM.                                   CAT722  
                                                                        CAT722  
           EXEC SQL                                                     CAT722  
ET0001**   DELETE FROM VINITAST                                         CAT722  
ET0001     DELETE FROM ACTIAST                                          CAT722  
           WHERE CLIENT_NBR       = :VAR-CLIENT-NBR                     CAT722  
             AND ACAT_CONTROL_NBR = :VAR-ACAT-CONTROL-NBR               CAT722  
             AND NSCC_PEND_CD     = 'H'                                 CAT722  
DJ0003       AND (NOT TRANS_TYPE_CD = 'D')                              CAT722  
           END-EXEC.                                                    CAT722  
                                                                        CAT722  
           MOVE SQLERRD(3)          TO W-SQLERRD-3                      CAT722  
           MOVE W-SQLERRD-3         TO W-SQL-DELETE-COUNT               CAT722  
           IF SQLCODE EQUAL ZERO                                        CAT722  
ET0001**      DISPLAY ' 3200: VINITAST DELETED'                         CAT722  
ET0001        DISPLAY ' 3200: ACTIAST DELETED'                          CAT722  
                      ' CLT=' VAR-CLIENT-NBR,                           CAT722  
                      ' CTL=' VAR-ACAT-CONTROL-NBR,                     CAT722  
                      ' STA=' VAR-STTS-CD                               CAT722  
                      ' DAY=' VAR-DAYS-STTS-QTY                         CAT722  
                      ' CNT=' W-SQL-DELETE-COUNT                        CAT722  
              ADD 1 TO WS-ACAT-COUNTER                                  CAT722  
              ADD 1 TO WS-A-COMMIT-COUNTER                              CAT722  
              ADD W-SQL-DELETE-COUNT TO W-VINITAST-DELETE-CNT           CAT722  
           ELSE                                                         CAT722  
               IF SQLCODE EQUAL 100                                     CAT722  
                  GO TO 3200-FETCH-EXIT                                 CAT722  
               ELSE                                                     CAT722  
                   PERFORM 8500-SQL-ERROR THRU 8500-EXIT                CAT722  
               END-IF                                                   CAT722  
           END-IF                                                       CAT722  
      *                                                                 CAT722  
      *  ROLLBACK-NO                                                    CAT722  
      *                                                                 CAT722  
           IF WS-A-COMMIT-COUNTER > 100 AND ROLLBACK-NO                 CAT722  
              DISPLAY '3200: COMMIT'                                    CAT722  
              MOVE 0 TO WS-A-COMMIT-COUNTER                             CAT722  
              EXEC SQL  COMMIT  END-EXEC.                               CAT722  
                                                                        CAT722  
       3200-FETCH-EXIT.                                                 CAT722  
           EXIT.                                                        CAT722  
                                                                        CAT722  
       3300-CLOSE-CURSOR SECTION.                                       CAT722  
           DISPLAY 'CAT722: 3300-CLOSE-CURSOR '.                        CAT722  
      *                                                                 CAT722  
      *  CLOSE THE CURSOR (SAME AS CLOSING FILE)                        CAT722  
      *                                                                 CAT722  
           MOVE 20 TO WS-SQL-SEQ-NUM.                                   CAT722  
            EXEC SQL CLOSE ACATTRF END-EXEC.                            CAT722  
           IF SQLCODE EQUAL ZERO                                        CAT722  
              NEXT SENTENCE                                             CAT722  
           ELSE                                                         CAT722  
               PERFORM 8500-SQL-ERROR THRU 8500-EXIT                    CAT722  
           END-IF.                                                      CAT722  
       3300-CLOSE-CURSOR-EXIT.                                          CAT722  
           EXIT.                                                        CAT722  
                                                                        CAT722  
      /                                                                 CAT722  
       8500-SQL-ERROR      SECTION.                                     CAT722  
           DISPLAY 'CAT722: 8500-SQL-ERROR    '.                        CAT722  
                                                                        CAT722  
           DISPLAY ' '                                                  CAT722  
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                  CAT722  
                                    W-DB2-MESSAGE-LEN.                  CAT722  
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                        CAT722  
             UNTIL W-DB2-IDX GREATER THAN 12                            CAT722  
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES              CAT722  
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)               CAT722  
                   END-IF                                               CAT722  
           END-PERFORM.                                                 CAT722  
           DISPLAY ' '                                                  CAT722  
                                                                        CAT722  
           PERFORM 8700-SQL-ROLLBACK THRU 8700-EXIT                     CAT722  
                                                                        CAT722  
           DISPLAY 'CAT722: U3999 - ABENDING ON BAD DB2 STATUS'         CAT722  
           DISPLAY 'CAT722: PROGRAM ENDED ABNORMALLY'                   CAT722  
           MOVE +3999    TO ABEND-CODE                                  CAT722  
           CALL ABEND USING ABEND-CODE.                                 CAT722  
                                                                        CAT722  
       8500-EXIT. EXIT.                                                 CAT722  
      /                                                                 CAT722  
       8700-SQL-ROLLBACK   SECTION.                                     CAT722  
           DISPLAY 'CAT722: 8700-SQL-ROLLBACK '.                        CAT722  
                                                                        CAT722  
           EXEC SQL ROLLBACK WORK                                       CAT722  
           END-EXEC                                                     CAT722  
                                                                        CAT722  
           MOVE SQLCA   TO ROLLBACK-SQLCA                               CAT722  
           MOVE SQLCODE TO ROLLBACK-RETURN                              CAT722  
                                                                        CAT722  
           IF ROLLBACK-AB                                               CAT722  
               DISPLAY                                                  CAT722  
                   'AUTO ROLLBACK FAILED. ROLLBACK-RETURN = '           CAT722  
                   ROLLBACK-RETURN                                      CAT722  
           ELSE                                                         CAT722  
               DISPLAY                                                  CAT722  
                   'AUTO ROLLBACK SUCCESSFUL. ROLLBACK-RETURN = '       CAT722  
                   ROLLBACK-RETURN                                      CAT722  
           END-IF.                                                      CAT722  
                                                                        CAT722  
       8700-EXIT. EXIT.                                                 CAT722  
      *#################################################################CAT722  
