000001* PDX    - CAT550   C0151178 12/18/00 08:39:04 TBDOJUN            00001000
      * DJ     COBOL LE                                                 CAT550  
000001* PDX    - CAT550   C0117779 11/20/98 14:00:40 TBDOJUN            CAT550  
000001* PDX    - CAT550   C0109316 11/02/98 10:39:21 TBDOJUN            CAT550  
       ID DIVISION.                                                     CAT550  
       PROGRAM-ID. CAT550.                                              CAT550  
       DATE-WRITTEN. JUNE 19, 1998.                                     CAT550  
      ****************************************************************  CAT550  
      * THIS IS A DB2 PROGRAM.  LIBTYPE = DB2SRC                     *  CAT550  
      ****************************************************************  CAT550  
      * CAT550 - UPDATE DB2 ACAT CLIENT PROFILE USING B1             *  CAT550  
      *                                                              *  CAT550  
      * INPUT    = B1                                                *  CAT550  
      * OUTPUT   = DB2 ACAT CLIENT PROFILE (VCLNTPRO)                *  CAT550  
      *                                                              *  CAT550  
      * IF CLIENT IS AN ACAT ACTIVE CLIENT,                          *  CAT550  
      *    UPDATE THE CLIENT PROFILE.                                *  CAT550  
      * IF CLIENT IS NOT ACTIVE,                                     *  CAT550  
      *    DELETE THE CLIENT PROFILE.                                *  CAT550  
      *                                                              *  CAT550  
      ****************************************************************  CAT550  
       ENVIRONMENT DIVISION.                                            CAT550  
       DATA DIVISION.                                                   CAT550  
       WORKING-STORAGE SECTION.                                         CAT550  
           COPY PDXIDCOB.                                               CAT550  
                                                                        CAT550  
       01  FILLER                       PIC X(08) VALUE 'WORKAREA'.     CAT550  
       01  W-WORK-FIELDS.                                               CAT550  
           05  W-SQL-SW                 PIC X(01) VALUE ' '.            CAT550  
               88  W-SQL-OKAY                     VALUE 'Y'.            CAT550  
               88  W-SQL-NOT-OKAY                 VALUE 'N'.            CAT550  
           05  LD-PROC-DATE.                                            CAT550  
               10 LD-PROC-DATE-MM        PIC  X(02).                    CAT550  
               10 LD-PROC-DATE-DD        PIC  X(02).                    CAT550  
               10 LD-PROC-DATE-YY        PIC  X(02).                    CAT550  
           05  LD-PRIOR-PROC-DATE.                                      CAT550  
               10 LD-PRIOR-PROC-DATE-MM  PIC  X(02).                    CAT550  
               10 LD-PRIOR-PROC-DATE-DD  PIC  X(02).                    CAT550  
               10 LD-PRIOR-PROC-DATE-YY  PIC  X(02).                    CAT550  
           05  W-SYS-DATE                PIC  9(006) VALUE 0.           CAT550  
           05  W-SYS-TIME                PIC  9(008) VALUE 0.           CAT550  
      /                                                                 CAT550  
       01  B1-TABLE-AREA.                                               CAT550  
           03  B1-TABLE OCCURS 500 TIMES.                               CAT550  
               05  B1-ADP-CL-NO             PIC 9(04).                  CAT550  
               05  B1-CLI-NAME              PIC X(30).                  CAT550  
               05  B1-BKR-CLR-NO            PIC X(04).                  CAT550  
               05  B1-STREAM                PIC X(01).                  CAT550  
               05  B1-STATUS                PIC X(01).                  CAT550  
               05  B1-ACAT-STATUS           PIC X(01).                  CAT550  
                                                                        CAT550  
       01  B1-WORK-TABLE-AREA.                                          CAT550  
           03  B1-WRK-TABLE.                                            CAT550  
               05  B1-WRK-ADP-CL-NO         PIC 9(04).                  CAT550  
               05  B1-WRK-NAME              PIC X(30).                  CAT550  
               05  B1-WRK-BKR-CLR-NO        PIC X(04).                  CAT550  
               05  B1-WRK-STREAM            PIC X(01).                  CAT550  
               05  B1-WRK-STATUS            PIC X(01).                  CAT550  
               05  B1-WRK-ACAT-STATUS       PIC X(01).                  CAT550  
                                                                        CAT550  
       01  B1-WORK-FIELEDS.                                             CAT550  
           03  B1-TBL-CNT                   PIC 9(03).                  CAT550  
           03  B1-SUB                       PIC 9(03).                  CAT550  
      /                                                                 CAT550  
       01  FILLER                        PIC X(008) VALUE 'TIMESTMP'.   CAT550  
       01  W-CURRENT-TMSTP               PIC X(026).                    CAT550  
                                                                        CAT550  
       01  FILLER                        PIC X(008) VALUE 'SQLCA   '.   CAT550  
           EXEC SQL INCLUDE SQLCA        END-EXEC.                      CAT550  
                                                                        CAT550  
       01  FILLER                        PIC X(008) VALUE 'VCLNTPRO'.   CAT550  
           EXEC SQL INCLUDE VCLNTPRO     END-EXEC.                      CAT550  
                                                                        CAT550  
       01  W-DB2-MESSAGE-AREA.                                          CAT550  
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.    CAT550  
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES     CAT550  
                   INDEXED BY W-DB2-IDX.                                CAT550  
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.     CAT550  
      /                                                                 CAT550  
       01  FILLER                        PIC X(008) VALUE 'BHINFO  '.   CAT550  
           COPY BHINFO.                                                 CAT550  
      /                                                                 CAT550  
       01  FILLER                        PIC X(008) VALUE 'BHACAT  '.   CAT550  
           COPY BHACAT.                                                 CAT550  
      /                                                                 CAT550  
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.   CAT550  
           COPY BPDATESC.                                               CAT550  
      /                                                                 CAT550  
DJ0002***===> COBOL LE                                                  CAT550  
DJ0002 01  W-ABEND-AREA.                                                CAT550  
DJ0002     05  ABEND-CODE                PIC S9(04) COMP SYNC.          CAT550  
DJ0002 01  CALL-MODULES.                                                CAT550  
DJ0002     05  DSNTIAR                   PIC  X(08) VALUE 'DSNTIAR '.   CAT550  
DJ0002 01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.   CAT550  
DJ0002     COPY STUBCPY.                                                CAT550  
DJ0002***<=== COBOL LE                                                  CAT550  
                                                                        CAT550  
       01  FILLER                        PIC X(008) VALUE 'END-O-WS'.   CAT550  
                                                                        CAT550  
       PROCEDURE DIVISION.                                              CAT550  
                                                                        CAT550  
       0000-MAIN SECTION.                                               CAT550  
           DISPLAY 'CAT550 - UPDATE DB2 ACATS CLIENT PROFILE USING B1'. CAT550  
           DISPLAY 'CAT550 - THIS PROGRAM HAS NO JCL PARMS       '.     CAT550  
           DISPLAY ' '.                                                 CAT550  
           COPY MSGCOBO.                                                CAT550  
           DISPLAY ' '.                                                 CAT550  
                                                                        CAT550  
           PERFORM 1000-INIT             THRU 1000-EXIT.                CAT550  
           PERFORM 1500-LOAD-B1          THRU 1500-EXIT.                CAT550  
           PERFORM 2000-PROCESS          THRU 2000-EXIT.                CAT550  
           PERFORM 9000-RETURN           THRU 9000-EXIT.                CAT550  
                                                                        CAT550  
           GOBACK.                                                      CAT550  
      /                                                                 CAT550  
       1000-INIT         SECTION.                                       CAT550  
                                                                        CAT550  
           DISPLAY ' '.                                                 CAT550  
           MOVE 'CAT550'                 TO BPDATES-CALLING-PGM.        CAT550  
           SET  LNKDATZ-REQUEST          TO TRUE.                       CAT550  
           CALL BPDATES USING BPDATES-PARAMETERS.                       CAT550  
           MOVE BPD-PROC-DATE(3:2)       TO LD-PROC-DATE-YY.            CAT550  
           MOVE BPD-PROC-DATE(5:2)       TO LD-PROC-DATE-MM.            CAT550  
           MOVE BPD-PROC-DATE(7:2)       TO LD-PROC-DATE-DD.            CAT550  
           MOVE BPD-PRIOR-PROC-DATE(3:2) TO LD-PRIOR-PROC-DATE-YY.      CAT550  
           MOVE BPD-PRIOR-PROC-DATE(5:2) TO LD-PRIOR-PROC-DATE-MM.      CAT550  
           MOVE BPD-PRIOR-PROC-DATE(7:2) TO LD-PRIOR-PROC-DATE-DD.      CAT550  
                                                                        CAT550  
           DISPLAY 'CAT550: PROC-DATE= ' BPD-PROC-DATE                  CAT550  
                      '  LD-PROC-DATE= ' LD-PROC-DATE.                  CAT550  
           DISPLAY 'CAT550: PRIOR-PROC-DATE= ' BPD-PRIOR-PROC-DATE      CAT550  
                      '  LD-PRIOR-PROC-DATE= ' LD-PRIOR-PROC-DATE.      CAT550  
           DISPLAY ' '.                                                 CAT550  
           MOVE ' ' TO B1-TABLE-AREA.                                   CAT550  
       1000-EXIT. EXIT.                                                 CAT550  
      /                                                                 CAT550  
       1500-LOAD-B1 SECTION.                                            CAT550  
           DISPLAY 'CAT550: 1500-LOAD-B1'.                              CAT550  
                                                                        CAT550  
           MOVE 0                        TO  B1-TBL-CNT.                CAT550  
                                                                        CAT550  
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500        CAT550  
                                                                        CAT550  
             MOVE  ' '                   TO  BH-BROKER-HEADER-INFO      CAT550  
                                             BH-ACAT-INFO               CAT550  
             MOVE  B1-SUB                TO  BH-BROKER-NUMBER-N         CAT550  
             MOVE  '015'                 TO  BH-LOGICAL-RECORD-CODE     CAT550  
             MOVE  '434500'              TO  BH-B2-INFO-ID              CAT550  
             CALL  GETB1V              USING BH-BROKER-HEADER-INFO      CAT550  
                                             BH-ACAT-INFO               CAT550  
             IF  (BH-BROKER-ACTIVE OR BH-BROKER-INACTIVE)               CAT550  
                   ADD 1 TO B1-TBL-CNT                                  CAT550  
                   MOVE  BH-BROKER-NUMBER-N                             CAT550  
                                         TO B1-ADP-CL-NO  (B1-TBL-CNT)  CAT550  
                   MOVE  BH-BROKER-NAME                                 CAT550  
                                         TO B1-CLI-NAME   (B1-TBL-CNT)  CAT550  
                   MOVE  BH-BROKER-OLD-CLEARING-HOUSE (2:4)             CAT550  
                                         TO B1-BKR-CLR-NO (B1-TBL-CNT)  CAT550  
                   IF  BH-BROKER-MINI-MAXI-SUBGROUP > ' '               CAT550  
                       MOVE BH-BROKER-MINI-MAXI-SUBGROUP                CAT550  
                                         TO B1-STREAM     (B1-TBL-CNT)  CAT550  
                   ELSE                                                 CAT550  
                      MOVE BH-BROKER-MINI-MAXI-INDICATOR                CAT550  
                                         TO B1-STREAM     (B1-TBL-CNT)  CAT550  
                   END-IF                                               CAT550  
                   MOVE  BH-BROKER-STATUS                               CAT550  
                                         TO B1-STATUS     (B1-TBL-CNT)  CAT550  
                   MOVE  BH-ACAT-STATUS                                 CAT550  
                                         TO B1-ACAT-STATUS(B1-TBL-CNT)  CAT550  
                       DISPLAY     'CNT=' B1-TBL-CNT                    CAT550  
                                    ' CLT ' B1-ADP-CL-NO  (B1-TBL-CNT)  CAT550  
                                        ' ' B1-CLI-NAME   (B1-TBL-CNT)  CAT550  
                                    ' BKR ' B1-BKR-CLR-NO (B1-TBL-CNT)  CAT550  
                                    ' STR ' B1-STREAM     (B1-TBL-CNT)  CAT550  
                                    ' STA ' B1-STATUS     (B1-TBL-CNT)  CAT550  
                                   ' ACAT ' B1-ACAT-STATUS(B1-TBL-CNT)  CAT550  
             END-IF                                                     CAT550  
                                                                        CAT550  
           END-PERFORM.                                                 CAT550  
                                                                        CAT550  
           DISPLAY ' '.                                                 CAT550  
           IF  B1-TBL-CNT =  0                                          CAT550  
               DISPLAY  'ZERO STREAM CLIENTS ARE B1-ACAT CLIENTS'       CAT550  
               DISPLAY  'INPUT ACAT FILE WILL BE BYPASSED'              CAT550  
           END-IF.                                                      CAT550  
                                                                        CAT550  
           DISPLAY  'B1 TABLE COUNT - ' B1-TBL-CNT.                     CAT550  
           DISPLAY ' '.                                                 CAT550  
       1500-EXIT. EXIT.                                                 CAT550  
      /                                                                 CAT550  
       2000-PROCESS      SECTION.                                       CAT550  
                                                                        CAT550  
           PERFORM VARYING B1-SUB FROM 1 BY 1                           CAT550  
                   UNTIL B1-SUB > B1-TBL-CNT                            CAT550  
                   IF  B1-STATUS      (B1-SUB) = 'A'                    CAT550  
                   AND B1-ACAT-STATUS (B1-SUB) = 'A'                    CAT550  
                   AND B1-BKR-CLR-NO  (B1-SUB) > ' '                    CAT550  
                       PERFORM 4000-UPDATE THRU 4000-EXIT               CAT550  
                   ELSE                                                 CAT550  
                       PERFORM 6000-DELETE THRU 6000-EXIT               CAT550  
                   END-IF                                               CAT550  
           END-PERFORM.                                                 CAT550  
                                                                        CAT550  
       2000-EXIT. EXIT.                                                 CAT550  
      /                                                                 CAT550  
       4000-UPDATE       SECTION.                                       CAT550  
                                                                        CAT550  
           MOVE B1-ADP-CL-NO  (B1-SUB) TO CLIENT-NBR.                   CAT550  
           MOVE B1-STREAM     (B1-SUB) TO STREAM-CD.                    CAT550  
           MOVE B1-BKR-CLR-NO (B1-SUB) TO BROKER-CLR-NBR.               CAT550  
                                                                        CAT550  
           EXEC SQL                                                     CAT550  
                   UPDATE VCLNTPRO                                      CAT550  
                   SET    STREAM_CD      = :STREAM-CD                   CAT550  
                         ,BROKER_CLR_NBR = :BROKER-CLR-NBR              CAT550  
                   WHERE  CLIENT_NBR     = :CLIENT-NBR                  CAT550  
           END-EXEC.                                                    CAT550  
                                                                        CAT550  
           IF  SQLCODE  =  +0                                           CAT550  
               DISPLAY 'UPDATED CLT ' CLIENT-NBR                        CAT550  
                           ' ' B1-CLI-NAME(B1-SUB)                      CAT550  
                       ' BRK=' B1-BKR-CLR-NO(B1-SUB)                    CAT550  
                       ' STA=' B1-STATUS(B1-SUB)                        CAT550  
                      ' ACAT=' B1-ACAT-STATUS(B1-SUB)                   CAT550  
           ELSE                                                         CAT550  
               DISPLAY '        CLT ' CLIENT-NBR                        CAT550  
                           ' ' B1-CLI-NAME(B1-SUB)                      CAT550  
                       ' BRK=' B1-BKR-CLR-NO(B1-SUB)                    CAT550  
                       ' STA=' B1-STATUS(B1-SUB)                        CAT550  
                      ' ACAT=' B1-ACAT-STATUS(B1-SUB)                   CAT550  
                 ' NOT UPDATED'                                         CAT550  
               IF  SQLCODE  =  +100                                     CAT550  
                   PERFORM  5000-ADD       THRU 5000-EXIT               CAT550  
               ELSE                                                     CAT550  
                   PERFORM  8000-SQL-ERROR THRU 8000-EXIT               CAT550  
               END-IF                                                   CAT550  
           END-IF.                                                      CAT550  
                                                                        CAT550  
       4000-EXIT. EXIT.                                                 CAT550  
      /                                                                 CAT550  
       5000-ADD          SECTION.                                       CAT550  
                                                                        CAT550  
           MOVE B1-ADP-CL-NO (B1-SUB)  TO CLIENT-NBR.                   CAT550  
           MOVE 0                      TO RCV-STD-TRNFR-QTY             CAT550  
           MOVE 0                      TO RCV-NSTD-TRNFR-QTY            CAT550  
           MOVE 0                      TO RCV-RJCT-BRKR-QTY             CAT550  
           MOVE 0                      TO RCV-RJCT-SYS-QTY              CAT550  
           MOVE 0                      TO DLVR-STD-TRNFR-QTY            CAT550  
           MOVE 0                      TO DLVR-NSTD-TRNR-QTY            CAT550  
           MOVE 0                      TO DLVR-RJCT-BRKR-QTY            CAT550  
           MOVE 0                      TO DLVR-RJCT-SYS-QTY             CAT550  
           MOVE ' '                    TO CICS-TERM-ID-CD               CAT550  
           MOVE ' '                    TO PRGM-NM                       CAT550  
           MOVE B1-STREAM     (B1-SUB) TO STREAM-CD.                    CAT550  
           MOVE B1-BKR-CLR-NO (B1-SUB) TO BROKER-CLR-NBR.               CAT550  
                                                                        CAT550  
           EXEC SQL                                                     CAT550  
                   INSERT INTO  VCLNTPRO                                CAT550  
                          (CLIENT_NBR                                   CAT550  
                          ,RCV_STD_TRNFR_QTY                            CAT550  
                          ,RCV_NSTD_TRNFR_QTY                           CAT550  
                          ,RCV_RJCT_BRKR_QTY                            CAT550  
                          ,RCV_RJCT_SYS_QTY                             CAT550  
                          ,DLVR_STD_TRNFR_QTY                           CAT550  
                          ,DLVR_NSTD_TRNR_QTY                           CAT550  
                          ,DLVR_RJCT_BRKR_QTY                           CAT550  
                          ,DLVR_RJCT_SYS_QTY                            CAT550  
                          ,UPDT_TMSTP                                   CAT550  
                          ,CRT_TMSTP                                    CAT550  
                          ,CICS_TERM_ID_CD                              CAT550  
                          ,PRGM_NM                                      CAT550  
                          ,STREAM_CD                                    CAT550  
                          ,BROKER_CLR_NBR)                              CAT550  
                   VALUES (:CLIENT-NBR                                  CAT550  
                          ,:RCV-STD-TRNFR-QTY                           CAT550  
                          ,:RCV-NSTD-TRNFR-QTY                          CAT550  
                          ,:RCV-RJCT-BRKR-QTY                           CAT550  
                          ,:RCV-RJCT-SYS-QTY                            CAT550  
                          ,:DLVR-STD-TRNFR-QTY                          CAT550  
                          ,:DLVR-NSTD-TRNR-QTY                          CAT550  
                          ,:DLVR-RJCT-BRKR-QTY                          CAT550  
                          ,:DLVR-RJCT-SYS-QTY                           CAT550  
                          ,CURRENT TIMESTAMP                            CAT550  
                          ,CURRENT TIMESTAMP                            CAT550  
                          ,:CICS-TERM-ID-CD                             CAT550  
                          ,:PRGM-NM                                     CAT550  
                          ,:STREAM-CD                                   CAT550  
                          ,:BROKER-CLR-NBR)                             CAT550  
           END-EXEC.                                                    CAT550  
                                                                        CAT550  
           IF  SQLCODE  =  +0                                           CAT550  
               DISPLAY 'ADDED   CLT ' CLIENT-NBR                        CAT550  
                           ' ' B1-CLI-NAME(B1-SUB)                      CAT550  
                       ' BRK=' B1-BKR-CLR-NO(B1-SUB)                    CAT550  
                       ' STA=' B1-STATUS(B1-SUB)                        CAT550  
                      ' ACAT=' B1-ACAT-STATUS(B1-SUB)                   CAT550  
           ELSE                                                         CAT550  
               DISPLAY '        CLT ' CLIENT-NBR                        CAT550  
                           ' ' B1-CLI-NAME(B1-SUB)                      CAT550  
                       ' BRK=' B1-BKR-CLR-NO(B1-SUB)                    CAT550  
                       ' STA=' B1-STATUS(B1-SUB)                        CAT550  
                      ' ACAT=' B1-ACAT-STATUS(B1-SUB)                   CAT550  
                 ' NOT ADDED'                                           CAT550  
               IF  SQLCODE  =  +100                                     CAT550  
                   CONTINUE                                             CAT550  
               ELSE                                                     CAT550  
                   PERFORM  8000-SQL-ERROR THRU 8000-EXIT               CAT550  
               END-IF                                                   CAT550  
           END-IF.                                                      CAT550  
                                                                        CAT550  
       5000-EXIT. EXIT.                                                 CAT550  
      /                                                                 CAT550  
       6000-DELETE       SECTION.                                       CAT550  
                                                                        CAT550  
           MOVE B1-ADP-CL-NO (B1-SUB) TO CLIENT-NBR.                    CAT550  
                                                                        CAT550  
           EXEC SQL                                                     CAT550  
                   DELETE FROM VCLNTPRO                                 CAT550  
                   WHERE  CLIENT_NBR     = :CLIENT-NBR                  CAT550  
           END-EXEC.                                                    CAT550  
                                                                        CAT550  
           IF  SQLCODE  =  +0                                           CAT550  
               DISPLAY 'DELETED CLT ' CLIENT-NBR                        CAT550  
                           ' ' B1-CLI-NAME(B1-SUB)                      CAT550  
                       ' BRK=' B1-BKR-CLR-NO(B1-SUB)                    CAT550  
                       ' STA=' B1-STATUS(B1-SUB)                        CAT550  
                      ' ACAT=' B1-ACAT-STATUS(B1-SUB)                   CAT550  
           ELSE                                                         CAT550  
               DISPLAY '        CLT ' CLIENT-NBR                        CAT550  
                           ' ' B1-CLI-NAME(B1-SUB)                      CAT550  
                       ' BRK=' B1-BKR-CLR-NO(B1-SUB)                    CAT550  
                       ' STA=' B1-STATUS(B1-SUB)                        CAT550  
                      ' ACAT=' B1-ACAT-STATUS(B1-SUB)                   CAT550  
                 ' NOT DELETED'                                         CAT550  
               IF  SQLCODE  =  +100                                     CAT550  
                   CONTINUE                                             CAT550  
               ELSE                                                     CAT550  
                   PERFORM  8000-SQL-ERROR THRU 8000-EXIT               CAT550  
               END-IF                                                   CAT550  
           END-IF.                                                      CAT550  
                                                                        CAT550  
       6000-EXIT. EXIT.                                                 CAT550  
      /                                                                 CAT550  
       8000-SQL-ERROR SECTION.                                          CAT550  
                                                                        CAT550  
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                  CAT550  
                                    W-DB2-MESSAGE-LEN.                  CAT550  
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                        CAT550  
             UNTIL W-DB2-IDX GREATER THAN 12                            CAT550  
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES              CAT550  
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)               CAT550  
                   END-IF                                               CAT550  
           END-PERFORM.                                                 CAT550  
                                                                        CAT550  
       8000-EXIT. EXIT.                                                 CAT550  
      /                                                                 CAT550  
       9000-RETURN SECTION.                                             CAT550  
                                                                        CAT550  
           DISPLAY ' '.                                                 CAT550  
                                                                        CAT550  
           DISPLAY 'CAT550: PROGRAM ENDED SUCCESSFULLY'.                CAT550  
                                                                        CAT550  
       9000-EXIT. EXIT.                                                 CAT550  
      ***************************************************************** CAT550  
      *    END OF CAT550                                              * CAT550  
      ***************************************************************** CAT550  
