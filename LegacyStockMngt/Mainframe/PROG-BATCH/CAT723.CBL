000001* PDX    - CAT723   C0295620 06/07/10 09:44:38 TBLAMUR            00001000
      * LRM002 SSR 62889 WITHHOLD MATURING OR CALLED BONDS; QUALIFY             
      *  CLIENT NUMBER > 0000 TO NOT DELETE AUDIT ROWS "W###'                   
000001* PDX    - CAT723   C0218852 04/21/05 15:46:49 TBLAMUR            00001000
      * LRM001 SSR 0039561 INGORE XX IN CONTROL NUMBER FIELD.                   
000001* PDX    - CAT723   C0214955 01/11/05 15:45:30 TBEDTAK            00001000
      * ET0001 DB2 INITIAL TABLE KEY CHANGE WITH NEW TABLE NAME         CAT723  
000001* PDX    - CAT723   C0151178 12/18/00 08:44:38 TBDOJUN            00001000
      * DJ0001 COBOL LE                                                 CAT723  
000001* PDX    - CAT723   C0124804 04/21/99 13:30:14 TBLAMUR            CAT723  
000001* PDX    - CAT723   C0123183 03/17/99 16:08:15 TBLAMUR            CAT723  
       IDENTIFICATION DIVISION.                                         CAT723  
       PROGRAM-ID.  CAT723.                                             CAT723  
       AUTHOR.      LARRY MUREY.                                        CAT723  
       DATE-WRITTEN.  MARCH 1999.                                       CAT723  
                                                                        CAT723  
      *---------------------------------------------------------------- CAT723  
      * THE PURPOSE OF THIS PROGRAM IS TO DELETE ALL INITIAL TRANSFERS  CAT723  
      * AND INITIAL ASSETS FROM THE ACATS DB2 DATABASE WHICH HAVE AN    CAT723  
      * ACAT_CONTROL_NBR > SPACES AND NOT CORRESPONDING ROW ON THE      CAT723  
      * ACTIVE TABLE.                                                   CAT723  
LRM   * ADDED FUNCTION TO DROP ASSETS WITHHELD FROM INITIAL ASSET TBL;  CAT723  
      * CLIENT ONLY WANTS TO SEE THESE ONLINE ON DAY 1.                 CAT723  
      *---------------------------------------------------------------- CAT723  
           EJECT                                                        CAT723  
      ***************************************************************** CAT723  
       ENVIRONMENT DIVISION.                                            CAT723  
      ***************************************************************** CAT723  
       INPUT-OUTPUT SECTION.                                            CAT723  
       FILE-CONTROL.                                                    CAT723  
                                                                        CAT723  
      ***************************************************************** CAT723  
       DATA DIVISION.                                                   CAT723  
      ***************************************************************** CAT723  
                                                                        CAT723  
           EJECT                                                        CAT723  
      ******************************************************************CAT723  
       WORKING-STORAGE SECTION.                                         CAT723  
      ******************************************************************CAT723  
                                                                        CAT723  
DJ0001     COPY PDXIDCOB.                                               CAT723  
                                                                        CAT723  
      /                                                                 CAT723  
DJ0001***===> COBOL LE                                                  CAT723  
DJ0001 01  W-ABEND-AREA.                                                CAT723  
DJ0001     05  ABEND-CODE                PIC S9(04) COMP SYNC.          CAT723  
DJ0001 01  CALL-MODULES.                                                CAT723  
DJ0001     05  DSNTIAR                   PIC  X(08) VALUE 'DSNTIAR '.   CAT723  
DJ0001 01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.   CAT723  
DJ0001     COPY STUBCPY.                                                CAT723  
DJ0001***<=== COBOL LE                                                  CAT723  
      /                                                                 CAT723  
                                                                        CAT723  
       77  WS-TOTAL-TI-REC-CNTR  COMP-3  PIC 9(09)  VALUE ZEROES.       CAT723  
       77  WS-ACTIVE-TI-FOUND    COMP-3  PIC 9(09)  VALUE ZEROES.       CAT723  
       77  WS-TI-DELETES         COMP-3  PIC 9(09)  VALUE ZEROES.       CAT723  
                                                                        CAT723  
       77  WS-TOTAL-AT-REC-CNTR  COMP-3  PIC 9(09)  VALUE ZEROES.       CAT723  
       77  WS-ACTIVE-AT-FOUND    COMP-3  PIC 9(09)  VALUE ZEROES.       CAT723  
       77  WS-AT-DELETES         COMP-3  PIC 9(09)  VALUE ZEROES.       CAT723  
                                                                        CAT723  
       77  WS-TBLE-PROCESS-IND           PIC X      VALUE SPACES.       CAT723  
           88  PROCESS-VINITRNF                     VALUE 'T'.          CAT723  
           88  PROCESS-VINITAST                     VALUE 'A'.          CAT723  
                                                                        CAT723  
       01  WS-DB2-MESSAGE-AREA.                                         CAT723  
           05  WS-DB2-MSG-LEN            PIC S9(04) COMP VALUE +960.    CAT723  
           05  WS-ERROR-MSG              PIC X(80)  OCCURS 12 TIMES     CAT723  
               INDEXED BY WS-ERROR-INDEX.                               CAT723  
       01  WS-ERR-LINE-LEN               PIC S9(09) COMP VALUE +80.     CAT723  
                                                                        CAT723  
           EJECT                                                        CAT723  
      *DB2 COMMUNICATION AREA                                           CAT723  
           EXEC SQL                                                     CAT723  
              INCLUDE SQLCA                                             CAT723  
           END-EXEC.                                                    CAT723  
                                                                        CAT723  
           EJECT                                                        CAT723  
           EXEC SQL                                                     CAT723  
              INCLUDE VTRNFR                                            CAT723  
           END-EXEC.                                                    CAT723  
                                                                        CAT723  
           EXEC SQL                                                     CAT723  
ET0001**      INCLUDE VINITRNF                                          CAT723  
ET0001        INCLUDE ACTITRF                                           CAT723  
           END-EXEC.                                                    CAT723  
                                                                        CAT723  
           EXEC SQL                                                     CAT723  
ET0001**      INCLUDE VINITAST                                          CAT723  
ET0001        INCLUDE ACTIAST                                           CAT723  
           END-EXEC.                                                    CAT723  
                                                                        CAT723  
      *DECLARE CURSOR TO OBTAIN ALL TI RECORDS WHICH HAVE AN ACAT       CAT723  
      * CONTROL NUMBER                                                  CAT723  
           EXEC SQL                                                     CAT723  
              DECLARE NSCC_TI_CRSR CURSOR FOR                           CAT723  
                 SELECT                                                 CAT723  
                    CLIENT_NBR,                                         CAT723  
                    ACAT_CONTROL_NBR,                                   CAT723  
                    UPDT_TMSTP,                                         CAT723  
                    PRGM_NM                                             CAT723  
ET0001**         FROM VINITRNF                                          CAT723  
ET0001           FROM ACTITRF                                           CAT723  
                 WHERE   ACAT_CONTROL_NBR >  ' '                        CAT723  
LRM001           AND NOT SUBSTR(ACAT_CONTROL_NBR,1,2) = 'XX'            CAT723  
           END-EXEC.                                                    CAT723  
                                                                        CAT723  
      *DECLARE CURSOR TO OBTAIN ALL AT RECORDS WHICH HAVE AN ACAT       CAT723  
      * CONTROL NUMBER                                                  CAT723  
           EXEC SQL                                                     CAT723  
              DECLARE NSCC_AT_CRSR CURSOR FOR                           CAT723  
                 SELECT                                                 CAT723  
                    CLIENT_NBR,                                         CAT723  
                    ACAT_CONTROL_NBR,                                   CAT723  
                    UPDT_TMSTP,                                         CAT723  
                    PRGM_NM                                             CAT723  
ET0001**         FROM VINITAST                                          CAT723  
ET0001           FROM ACTIAST                                           CAT723  
LRM002           WHERE   CLIENT_NBR > '0000'                                    
                 AND     ACAT_CONTROL_NBR >  ' '                        CAT723  
LRM001           AND NOT SUBSTR(ACAT_CONTROL_NBR,1,2) = 'XX'            CAT723  
           END-EXEC.                                                    CAT723  
                                                                        CAT723  
                                                                        CAT723  
           EJECT                                                        CAT723  
       PROCEDURE DIVISION.                                              CAT723  
           DISPLAY 'CAT723 - DELETE OLD INITIAL TIF AND ASSETS DB ROWS'.CAT723  
           DISPLAY ' '.                                                 CAT723  
           COPY MSGCOBO.                                                CAT723  
                                                                        CAT723  
           PERFORM 2000-INITIAL-TRANSFERS-RTN.                          CAT723  
           PERFORM 3000-INITIAL-ASSETS-RTN.                             CAT723  
                                                                        CAT723  
           PERFORM ENDJOB-ROUTINE.                                      CAT723  
                                                                        CAT723  
           GOBACK.                                                      CAT723  
                                                                        CAT723  
           EJECT                                                        CAT723  
       2000-INITIAL-TRANSFERS-RTN.                                      CAT723  
                                                                        CAT723  
           SET PROCESS-VINITRNF TO TRUE.                                CAT723  
           EXEC SQL OPEN NSCC_TI_CRSR END-EXEC                          CAT723  
           IF SQLCODE NOT = +0                                          CAT723  
              MOVE 2400 TO ABEND-CODE                                   CAT723  
              PERFORM SQL-ERROR-ROUTINE                                 CAT723  
           END-IF.                                                      CAT723  
                                                                        CAT723  
           PERFORM UNTIL SQLCODE NOT = +0                               CAT723  
              EXEC SQL                                                  CAT723  
                 FETCH NSCC_TI_CRSR                                     CAT723  
                    INTO                                                CAT723  
                     :DCLVTRNFR.CLIENT-NBR                              CAT723  
                    ,:DCLVTRNFR.ACAT-CONTROL-NBR                        CAT723  
                    ,:DCLVTRNFR.UPDT-TMSTP                              CAT723  
                    ,:DCLVTRNFR.PRGM-NM                                 CAT723  
              END-EXEC                                                  CAT723  
                                                                        CAT723  
              EVALUATE SQLCODE                                          CAT723  
                 WHEN +100                                              CAT723  
                    CONTINUE                                            CAT723  
                 WHEN +0                                                CAT723  
                    ADD 1 TO WS-TOTAL-TI-REC-CNTR                       CAT723  
                    PERFORM 4000-LOOKUP-ACTIVE-ROW-RTN                  CAT723  
                 WHEN OTHER                                             CAT723  
                    MOVE 2500 TO ABEND-CODE                             CAT723  
                    PERFORM SQL-ERROR-ROUTINE                           CAT723  
              END-EVALUATE                                              CAT723  
           END-PERFORM.                                                 CAT723  
                                                                        CAT723  
           IF SQLCODE NOT = +100                                        CAT723  
              MOVE 2800 TO ABEND-CODE                                   CAT723  
              PERFORM SQL-ERROR-ROUTINE                                 CAT723  
           END-IF                                                       CAT723  
                                                                        CAT723  
           EXEC SQL                                                     CAT723  
              CLOSE NSCC_TI_CRSR                                        CAT723  
           END-EXEC                                                     CAT723  
                                                                        CAT723  
           IF SQLCODE NOT = +0                                          CAT723  
              MOVE 2900 TO ABEND-CODE                                   CAT723  
              PERFORM SQL-ERROR-ROUTINE                                 CAT723  
           ELSE                                                         CAT723  
              MOVE +0                       TO  SQLCODE                 CAT723  
           END-IF.                                                      CAT723  
                                                                        CAT723  
           EJECT                                                        CAT723  
       3000-INITIAL-ASSETS-RTN.                                         CAT723  
           SET PROCESS-VINITAST TO TRUE.                                CAT723  
           EXEC SQL OPEN NSCC_AT_CRSR END-EXEC                          CAT723  
           IF SQLCODE NOT = +0                                          CAT723  
              MOVE 3400 TO ABEND-CODE                                   CAT723  
              PERFORM SQL-ERROR-ROUTINE                                 CAT723  
           END-IF.                                                      CAT723  
                                                                        CAT723  
           PERFORM UNTIL SQLCODE NOT = +0                               CAT723  
              EXEC SQL                                                  CAT723  
                 FETCH NSCC_AT_CRSR                                     CAT723  
                    INTO                                                CAT723  
                     :DCLVTRNFR.CLIENT-NBR                              CAT723  
                    ,:DCLVTRNFR.ACAT-CONTROL-NBR                        CAT723  
                    ,:DCLVTRNFR.UPDT-TMSTP                              CAT723  
                    ,:DCLVTRNFR.PRGM-NM                                 CAT723  
              END-EXEC                                                  CAT723  
                                                                        CAT723  
              EVALUATE SQLCODE                                          CAT723  
                 WHEN +100                                              CAT723  
                    CONTINUE                                            CAT723  
                 WHEN +0                                                CAT723  
                    ADD 1 TO WS-TOTAL-AT-REC-CNTR                       CAT723  
                    PERFORM 4000-LOOKUP-ACTIVE-ROW-RTN                  CAT723  
                 WHEN OTHER                                             CAT723  
                    MOVE 3500 TO ABEND-CODE                             CAT723  
                    PERFORM SQL-ERROR-ROUTINE                           CAT723  
              END-EVALUATE                                              CAT723  
           END-PERFORM.                                                 CAT723  
                                                                        CAT723  
           IF SQLCODE NOT = +100                                        CAT723  
              MOVE 3800 TO ABEND-CODE                                   CAT723  
              PERFORM SQL-ERROR-ROUTINE                                 CAT723  
           END-IF                                                       CAT723  
                                                                        CAT723  
           EXEC SQL                                                     CAT723  
              CLOSE NSCC_AT_CRSR                                        CAT723  
           END-EXEC                                                     CAT723  
                                                                        CAT723  
           IF SQLCODE NOT = +0                                          CAT723  
              MOVE 3900 TO ABEND-CODE                                   CAT723  
              PERFORM SQL-ERROR-ROUTINE                                 CAT723  
           ELSE                                                         CAT723  
              MOVE +0                       TO  SQLCODE                 CAT723  
           END-IF.                                                      CAT723  
                                                                        CAT723  
           EXEC SQL                                                     CAT723  
              DELETE                                                    CAT723  
ET0001**          FROM VINITAST                                         CAT723  
ET0001            FROM ACTIAST                                          CAT723  
LRM002           WHERE  CLIENT_NBR > '0000'                             CAT723  
                 AND     NSCC_WTHLD_CD = 'W'                            CAT723  
           END-EXEC.                                                    CAT723  
                                                                        CAT723  
           EVALUATE SQLCODE                                             CAT723  
               WHEN +100                                                CAT723  
                    DISPLAY 'NO ASSETS WITHHELD DELETED'                CAT723  
                 WHEN +0                                                CAT723  
ET0001**            DISPLAY 'ASSETS WITHHELD DELETED FROM VINITAST'     CAT723  
ET0001              DISPLAY 'ASSETS WITHHELD DELETED FROM ACTIAST'      CAT723  
                 WHEN OTHER                                             CAT723  
                    MOVE 3900 TO ABEND-CODE                             CAT723  
                    PERFORM SQL-ERROR-ROUTINE                           CAT723  
           END-EVALUATE.                                                CAT723  
           EJECT                                                        CAT723  
       4000-LOOKUP-ACTIVE-ROW-RTN.                                      CAT723  
           EXEC SQL SELECT                                              CAT723  
                STTS_CD                                                 CAT723  
              INTO                                                      CAT723  
               :DCLVTRNFR.STTS-CD                                       CAT723  
             FROM VTRNFR                                                CAT723  
                WHERE (CLIENT_NBR                                       CAT723  
                              = :DCLVTRNFR.CLIENT-NBR                   CAT723  
                  AND ACAT_CONTROL_NBR                                  CAT723  
                              = :DCLVTRNFR.ACAT-CONTROL-NBR)            CAT723  
            END-EXEC.                                                   CAT723  
            EVALUATE SQLCODE                                            CAT723  
                 WHEN +100                                              CAT723  
                    PERFORM 5000-DELETE-INIT-RECORD-RTN                 CAT723  
                 WHEN +0                                                CAT723  
                    IF PROCESS-VINITRNF                                 CAT723  
                       ADD 1 TO WS-ACTIVE-TI-FOUND                      CAT723  
                    ELSE                                                CAT723  
                       ADD 1 TO WS-ACTIVE-AT-FOUND                      CAT723  
                    END-IF                                              CAT723  
                 WHEN OTHER                                             CAT723  
                    MOVE 4000 TO ABEND-CODE                             CAT723  
                    PERFORM SQL-ERROR-ROUTINE                           CAT723  
           END-EVALUATE.                                                CAT723  
           MOVE +0 TO SQLCODE.                                          CAT723  
                                                                        CAT723  
           EJECT                                                        CAT723  
       5000-DELETE-INIT-RECORD-RTN.                                     CAT723  
           IF PROCESS-VINITRNF                                          CAT723  
ET0001**      DISPLAY 'DEL VINITRNF '                                   CAT723  
ET0001        DISPLAY 'DEL ACTITRF  '                                   CAT723  
TEST                 CLIENT-NBR OF DCLVTRNFR                            CAT723  
TEST             ' ' ACAT-CONTROL-NBR OF DCLVTRNFR                      CAT723  
TEST             ' ' PRGM-NM    OF DCLVTRNFR                            CAT723  
TEST             ' ' UPDT-TMSTP OF DCLVTRNFR (1 : 10)                   CAT723  
              EXEC SQL                                                  CAT723  
ET0001**         DELETE FROM VINITRNF                                   CAT723  
ET0001           DELETE FROM ACTITRF                                    CAT723  
              WHERE                                                     CAT723  
                 (CLIENT_NBR    =                                       CAT723  
                     :DCLVTRNFR.CLIENT-NBR   AND                        CAT723  
                  ACAT_CONTROL_NBR      =                               CAT723  
                     :DCLVTRNFR.ACAT-CONTROL-NBR                        CAT723  
                 )                                                      CAT723  
              END-EXEC                                                  CAT723  
           ELSE                                                         CAT723  
ET0001**      DISPLAY 'DEL VINITAST '                                   CAT723  
ET0001        DISPLAY 'DEL ACTIAST  '                                   CAT723  
TEST                 CLIENT-NBR OF DCLVTRNFR                            CAT723  
TEST             ' ' ACAT-CONTROL-NBR OF DCLVTRNFR                      CAT723  
TEST             ' ' PRGM-NM    OF DCLVTRNFR                            CAT723  
TEST             ' ' UPDT-TMSTP OF DCLVTRNFR (1 : 10)                   CAT723  
              EXEC SQL                                                  CAT723  
ET0001**         DELETE FROM VINITAST                                   CAT723  
ET0001           DELETE FROM ACTIAST                                    CAT723  
              WHERE                                                     CAT723  
                 (CLIENT_NBR    =                                       CAT723  
                     :DCLVTRNFR.CLIENT-NBR   AND                        CAT723  
                  ACAT_CONTROL_NBR      =                               CAT723  
                     :DCLVTRNFR.ACAT-CONTROL-NBR                        CAT723  
                 )                                                      CAT723  
              END-EXEC                                                  CAT723  
           END-IF.                                                      CAT723  
                                                                        CAT723  
           EVALUATE SQLCODE                                             CAT723  
                 WHEN +100                                              CAT723  
                    DISPLAY 'ILLOGICAL DELETE - RECORD NOT FOUND'       CAT723  
                 WHEN +0                                                CAT723  
                    IF PROCESS-VINITRNF                                 CAT723  
                       ADD SQLERRD(3) TO WS-TI-DELETES                  CAT723  
                    ELSE                                                CAT723  
                       ADD SQLERRD(3) TO WS-AT-DELETES                  CAT723  
                    END-IF                                              CAT723  
                    CONTINUE                                            CAT723  
                 WHEN OTHER                                             CAT723  
                    MOVE 5000 TO ABEND-CODE                             CAT723  
                    PERFORM SQL-ERROR-ROUTINE                           CAT723  
           END-EVALUATE.                                                CAT723  
           MOVE +0 TO SQLCODE.                                          CAT723  
                                                                        CAT723  
           EJECT                                                        CAT723  
       SQL-ERROR-ROUTINE.                                               CAT723  
           DISPLAY 'CAT723 SQL PROBLEM - SQLCODE = ' SQLCODE.           CAT723  
           CALL DSNTIAR               USING  SQLCA                      CAT723  
                                             WS-DB2-MESSAGE-AREA        CAT723  
                                             WS-ERR-LINE-LEN            CAT723  
                                                                        CAT723  
           DISPLAY ' '                                                  CAT723  
                                                                        CAT723  
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                   CAT723  
              UNTIL WS-ERROR-INDEX GREATER THAN 12                      CAT723  
                 IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES              CAT723  
                    DISPLAY '*** ' WS-ERROR-MSG (WS-ERROR-INDEX)        CAT723  
                 END-IF                                                 CAT723  
           END-PERFORM                                                  CAT723  
                                                                        CAT723  
           DISPLAY ' '                                                  CAT723  
           DISPLAY '*** PROGRAM IS ABENDING'                            CAT723  
           DISPLAY ' '                                                  CAT723  
                                                                        CAT723  
           EXEC SQL  ROLLBACK  END-EXEC                                 CAT723  
           CALL ABEND      USING ABEND-CODE                             CAT723  
           .                                                            CAT723  
                                                                        CAT723  
           EJECT                                                        CAT723  
       ENDJOB-ROUTINE.                                                  CAT723  
                                                                        CAT723  
           DISPLAY ' '                                                  CAT723  
           DISPLAY '   DB2 INPUT TOTALS'                                CAT723  
           DISPLAY '   -----------------'                               CAT723  
           DISPLAY 'NUMBER OF TI RECORDS: ' WS-TOTAL-TI-REC-CNTR        CAT723  
           DISPLAY 'NUMBER OF TI ACTIVE:  ' WS-ACTIVE-TI-FOUND.         CAT723  
           DISPLAY 'NUMBER OF TI DELETED: ' WS-TI-DELETES.              CAT723  
           DISPLAY ' '                                                  CAT723  
           DISPLAY 'NUMBER OF AT RECORDS: ' WS-TOTAL-AT-REC-CNTR        CAT723  
           DISPLAY 'NUMBER OF AT ACTIVE:  ' WS-ACTIVE-AT-FOUND.         CAT723  
           DISPLAY 'NUMBER OF AT DELETED: ' WS-AT-DELETES.              CAT723  
                                                                        CAT723  
           DISPLAY ' '                                                  CAT723  
           DISPLAY '*************************'                          CAT723  
           DISPLAY '* END OF CAT723 PROGRAM *'                          CAT723  
           DISPLAY '*************************'                          CAT723  
           DISPLAY ' '.                                                 CAT723  
