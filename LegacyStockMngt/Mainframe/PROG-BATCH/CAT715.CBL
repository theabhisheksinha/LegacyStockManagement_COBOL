000001* PDX    - CAT715   C0210469 09/30/04 16:40:06 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                         CAT714  
       PROGRAM-ID.  CAT715.                                             CAT714  
      *REMARK.                                                          CAT714  
      *  ACATS SSR 0034535 CAGE TAG ON FRV AND MFC.                     CAT714  
      *  THIS PROGRAM EXTRACTS DELIVERY SIDE CAGE TAGS FROM VASTHSTY TO CAT714  
      *  BUILD AN INDEX FOR ALL ASSETS HAVING A CAGE TAG NUMBER.  THIS  CAT714  
      *  FILE WILL BE SORTED AND USED BY ONLINE L,Z SCREENS FOR LOOKUP. CAT714  
      *                                                                 CAT714  
      ******************************************************************CAT714  
      * 09/29/05 LRM  - NEW PROGRAM                                     CAT714  
      ******************************************************************CAT714  
       ENVIRONMENT DIVISION.                                            CAT714  
       INPUT-OUTPUT SECTION.                                            CAT714  
       FILE-CONTROL.                                                    CAT714  
           SELECT CAGE-TAG-INDEX                ASSIGN  TO  CAGETAG.            
       DATA DIVISION.                                                   CAT714  
       FILE SECTION.                                                            
                                                                                
       FD  CAGE-TAG-INDEX                                                       
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
       01  CAGE-TAG-RECORD               PIC X(50).                             
      ******************************************************************CAT714  
       WORKING-STORAGE SECTION.                                         CAT714  
      ******************************************************************CAT714  
           COPY PDXIDCOB.                                               CAT714  
      /                                                                 CAT714  
      ***===> COBOL LE                                                  CAT714  
       01  W-ABEND-AREA.                                                CAT714  
           05  ABEND-CODE                PIC S9(04) COMP SYNC.          CAT714  
       01  CALL-MODULES.                                                CAT714  
           05  DSNTIAR                   PIC  X(08) VALUE 'DSNTIAR '.   CAT714  
       01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.   CAT714  
           COPY STUBCPY.                                                CAT714  
      ***<=== COBOL LE                                                  CAT714  
      /                                                                 CAT714  
           COPY ACATCGIX.                                                       
       01  WS-VTRNHSTY-ROWS-READ        PIC 9(09) COMP-3 VALUE ZERO.            
       01  WS-RECS-WRITTEN              PIC 9(09) COMP-3 VALUE ZERO.            
      /                                                                 CAT714  
      ******************************************************************CAT714  
      * DB2 COMMAREA                                                   *CAT714  
      ******************************************************************CAT714  
       01  FILLER                        PIC X(008) VALUE 'SQLCA   '.   CAT714  
           EXEC SQL INCLUDE SQLCA        END-EXEC.                      CAT714  
                                                                        CAT714  
      ******************************************************************CAT714  
      * DB2 ERROR MESSAGE AREA                                         *CAT714  
      ******************************************************************CAT714  
       01  W-DB2-MESSAGE-AREA.                                          CAT714  
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.    CAT714  
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES     CAT714  
                   INDEXED BY W-DB2-IDX.                                CAT714  
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.     CAT714  
                                                                        CAT714  
       01  W-DB2-WORKAREA.                                                      
           05  ROLLBACK-SQLCA            PIC  X(122).                           
           05  ROLLBACK-RETURN           PIC S9(009) COMP.                      
               88  ROLLBACK-OK                VALUE +0.                         
               88  ROLLBACK-AB                VALUE -999 THRU -1                
                                                    +1   THRU +999.             
           05  W-DB2-TABLE-NAME          PIC  X(008).                           
           05  W-DB2-ACTION              PIC  X(008).                           
           05  W-DB2-SQLCODE             PIC ---9.                              
           05  W-TFR-SQLCODE             PIC S9(9) COMP-4.                      
           05  W-AST-SQLCODE             PIC S9(9) COMP-4.                      
           05  W-SQLERRD-3                   PIC  S9(9).                        
           05  W-SQL-DELETE-COUNT            PIC  --------9.                    
      ******************************************************************CAT714  
      * TRANSFER HISTORY TABLE                                         *CAT714  
      ******************************************************************CAT714  
       01  FILLER                        PIC X(008) VALUE 'VTRNHSTY'.   CAT714  
           EXEC SQL INCLUDE VTRNHSTY     END-EXEC.                      CAT714  
      ******************************************************************CAT714  
      * ASSET    HISTORY TABLE                                         *CAT714  
      ******************************************************************CAT714  
       01  FILLER                        PIC X(008) VALUE 'VASTHSTY'.   CAT714  
           EXEC SQL INCLUDE VASTHSTY     END-EXEC.                      CAT714  
      ******************************************************************CAT714  
      * DECLARE CURSOR FOR TRANSFER HISTORY TABLE FOR ALL DLVY TIFS    *CAT714  
      ******************************************************************CAT714  
       01  FILLER                PIC X(016) VALUE 'VTRNHSTYCURSOR'.     CAT714  
           EXEC SQL                                                     CAT714  
                DECLARE VTRNHSTY_CURSOR CURSOR FOR                      CAT714  
                SELECT                                                  CAT714  
                    CLIENT_NBR                                          CAT714  
                   ,ACAT_CONTROL_NBR                                    CAT714  
                                                                                
                FROM    VTRNHSTY                                        CAT714  
                WHERE DSTBN_SIDE_CD   = 'D'                                     
                AND  STTS_CD    =   '310'                               CAT714  
                FOR READ ONLY WITH UR                                           
           END-EXEC.                                                    CAT714  
      /                                                                 CAT714  
      ******************************************************************CAT714  
      * DECLARE CURSOR FOR HISTORY ASSET TABLE WHICH CONTAIN CAGE TAGS *CAT714  
      ******************************************************************CAT714  
       01  FILLER                PIC X(016) VALUE 'VASTHSTYCURSOR'.     CAT714  
           EXEC SQL                                                     CAT714  
                DECLARE VASTHSTY_CURSOR CURSOR FOR                      CAT714  
                SELECT                                                  CAT714  
                    CLIENT_NBR                                          CAT714  
                   ,CAGE_TAG_NBR                                        CAT714  
                   ,ACAT_CONTROL_NBR                                    CAT714  
                   ,ASSET_SEQ_NBR                                               
                FROM    VASTHSTY                                        CAT714  
                                                                        CAT714  
                WHERE CLIENT_NBR       = :DCLVTRNHSTY.CLIENT-NBR                
                 AND  ACAT_CONTROL_NBR = :DCLVTRNHSTY.ACAT-CONTROL-NBR  CAT714  
                 AND  CAGE_TAG_NBR  > '         '                       CAT714  
                FOR READ ONLY WITH UR                                           
           END-EXEC.                                                    CAT714  
                                                                                
                                                                                
       01  FILLER                        PIC X(008) VALUE 'CP2WS   '.   CAT714  
       01  W-HDR-TRL-LEN                 PIC 9(005) VALUE 120.                  
           COPY CP2WS.                                                          
       01  FILLER                        PIC X(008) VALUE 'END-O-WS'.   CAT714  
      /                                                                 CAT714  
      ***************************************************************** CAT714  
       PROCEDURE DIVISION.                                              CAT714  
      ***************************************************************** CAT714  
       0000-MAIN.                                                       CAT714  
           DISPLAY 'CAT715 - ASSET HISTORY CAGE TAG EXTRACT'.           CAT714  
           DISPLAY ' '.                                                 CAT714  
           COPY MSGCOBO.                                                CAT714  
           DISPLAY ' '.                                                 CAT714  
           PERFORM 1000-INITIAL-RTN.                                    CAT714  
           PERFORM 2000-SELECT-VTRNHSTY THRU 2000-EXIT                  CAT714  
                                                                        CAT714  
           PERFORM 9000-CLOSE-ROUTINE  THRU 9000-EXIT.                  CAT714  
                                                                        CAT714  
           GOBACK.                                                      CAT714  
                                                                        CAT714  
       1000-INITIAL-RTN.                                                CAT714  
           OPEN OUTPUT CAGE-TAG-INDEX.                                          
           MOVE ' '                 TO CAGE-TAG-RECORD.                         
           MOVE 'H'                 TO CP2-REQUEST-CODE.                        
           MOVE 'CAT715'            TO CP2-PROGRAM-ID.                          
           MOVE 999                 TO CP2-CLIENT-NUMBER.                       
                                                                                
           CALL P2HDTR           USING CP2-AREA                                 
                                       CAGE-TAG-INDEX.                          
           MOVE CP2-RETURN-RECORD    TO  CAGE-TAG-RECORD.                       
           DISPLAY 'CAT715: OUTFILE-HDR = '  CAGE-TAG-RECORD.                   
           WRITE CAGE-TAG-RECORD.                                               
      /                                                                 CAT714  
       2000-SELECT-VTRNHSTY.                                            CAT714  
           EXEC SQL OPEN VTRNHSTY_CURSOR END-EXEC                       CAT714  
                                                                        CAT714  
           MOVE SQLCODE      TO W-DB2-SQLCODE                           CAT714  
           MOVE SQLCODE      TO W-TFR-SQLCODE                           CAT714  
           IF SQLCODE = +0                                              CAT714  
              DISPLAY 'VTRNHSTY_CURSOR OPENED'                          CAT714  
           ELSE                                                         CAT714  
           IF SQLCODE = +100                                            CAT714  
              DISPLAY 'VTRNHSTY_CURSOR EMPTY '                          CAT714  
           ELSE                                                         CAT714  
              DISPLAY 'VTRNHSTY_CURSOR OPEN ERROR '                     CAT714  
                            'SQLCODE = ' W-DB2-SQLCODE                  CAT714  
              PERFORM  8500-SQL-ERROR THRU 8500-EXIT                    CAT714  
           END-IF.                                                      CAT714  
                                                                        CAT714  
           PERFORM UNTIL W-TFR-SQLCODE NOT = +0                         CAT714  
                                                                        CAT714  
              EXEC SQL                                                  CAT714  
                   FETCH VTRNHSTY_CURSOR                                CAT714  
               INTO                                                     CAT714  
                    :DCLVTRNHSTY.CLIENT-NBR                             CAT714  
                   ,:DCLVTRNHSTY.ACAT-CONTROL-NBR                       CAT714  
              END-EXEC                                                  CAT714  
                                                                        CAT714  
              MOVE SQLCODE      TO W-DB2-SQLCODE                        CAT714  
              MOVE SQLCODE      TO W-TFR-SQLCODE                        CAT714  
              EVALUATE SQLCODE                                          CAT714  
                  WHEN +0                                               CAT714  
                     ADD 1 TO WS-VTRNHSTY-ROWS-READ                             
                     PERFORM 4000-SELECT-ASSETS THRU 4000-EXIT          CAT714  
                     MOVE 0 TO W-TFR-SQLCODE                                    
                  WHEN +100                                             CAT714  
                     CONTINUE                                           CAT714  
                  WHEN OTHER                                            CAT714  
                     DISPLAY 'VTRNHSTY_CURSOR FETCH ERROR '             CAT714  
                             'SQLCODE = ' W-DB2-SQLCODE                 CAT714  
                     PERFORM  8500-SQL-ERROR THRU 8500-EXIT             CAT714  
              END-EVALUATE                                              CAT714  
                                                                        CAT714  
           END-PERFORM                                                  CAT714  
                                                                        CAT714  
           EXEC SQL                                                     CAT714  
                CLOSE VTRNHSTY_CURSOR                                   CAT714  
           END-EXEC                                                     CAT714  
                                                                        CAT714  
           MOVE SQLCODE      TO W-DB2-SQLCODE                           CAT714  
           MOVE SQLCODE      TO W-TFR-SQLCODE                           CAT714  
           IF  SQLCODE = +0                                             CAT714  
              DISPLAY 'VTRNHSTY_CURSOR CLOSED'                          CAT714  
           ELSE                                                         CAT714  
               DISPLAY ' VTRNHSTY_CURSOR CLOSE ERROR '                  CAT714  
                       ' SQLCODE = ' W-DB2-SQLCODE                      CAT714  
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   CAT714  
           END-IF.                                                      CAT714  
                                                                        CAT714  
       2000-EXIT. EXIT.                                                 CAT714  
      /                                                                 CAT714  
       4000-SELECT-ASSETS.                                              CAT714  
           EXEC SQL OPEN VASTHSTY_CURSOR END-EXEC                       CAT714  
                                                                        CAT714  
           MOVE SQLCODE      TO W-DB2-SQLCODE                           CAT714  
           MOVE SQLCODE      TO W-TFR-SQLCODE                           CAT714  
           IF SQLCODE = +0                                              CAT714  
              CONTINUE                                                  CAT714  
           ELSE                                                         CAT714  
           IF SQLCODE = +100                                            CAT714  
              CONTINUE                                                  CAT714  
           ELSE                                                         CAT714  
              DISPLAY 'VASTHSTY_CURSOR OPEN ERROR '                     CAT714  
                            'SQLCODE = ' W-DB2-SQLCODE                  CAT714  
              PERFORM  8500-SQL-ERROR THRU 8500-EXIT                    CAT714  
           END-IF.                                                      CAT714  
                                                                        CAT714  
           PERFORM UNTIL W-TFR-SQLCODE NOT = +0                         CAT714  
                                                                        CAT714  
              EXEC SQL                                                  CAT714  
                   FETCH VASTHSTY_CURSOR                                CAT714  
               INTO                                                     CAT714  
                    :ACAT-CAGE-TAG-CLIENT-NBR                           CAT714  
                   ,:ACAT-CAGE-TAG-NBR                                  CAT714  
                   ,:ACAT-CAGE-CONTROL-NBR                              CAT714  
                   ,:ACAT-CAGE-ASSET-SEQ-NBR                            CAT714  
              END-EXEC                                                  CAT714  
                                                                        CAT714  
              MOVE SQLCODE      TO W-DB2-SQLCODE                        CAT714  
              MOVE SQLCODE      TO W-TFR-SQLCODE                        CAT714  
              EVALUATE SQLCODE                                          CAT714  
                  WHEN +0                                               CAT714  
                     WRITE CAGE-TAG-RECORD FROM ACAT-CAGE-TAG-INDEX-REC CAT714  
                     ADD 1 TO WS-RECS-WRITTEN                                   
                  WHEN +100                                             CAT714  
                     CONTINUE                                           CAT714  
                  WHEN OTHER                                            CAT714  
                     DISPLAY 'VASTHSTY_CURSOR FETCH ERROR '             CAT714  
                             'SQLCODE = ' W-DB2-SQLCODE                 CAT714  
                     PERFORM  8500-SQL-ERROR THRU 8500-EXIT             CAT714  
              END-EVALUATE                                              CAT714  
                                                                        CAT714  
           END-PERFORM                                                  CAT714  
                                                                        CAT714  
           EXEC SQL                                                     CAT714  
                CLOSE VASTHSTY_CURSOR                                   CAT714  
           END-EXEC                                                     CAT714  
                                                                        CAT714  
           MOVE SQLCODE      TO W-DB2-SQLCODE                           CAT714  
           MOVE SQLCODE      TO W-TFR-SQLCODE                           CAT714  
           IF  SQLCODE = +0                                             CAT714  
               CONTINUE                                                 CAT714  
           ELSE                                                         CAT714  
               DISPLAY ' VASTHSTY_CURSOR CLOSE ERROR '                  CAT714  
                       ' SQLCODE = ' W-DB2-SQLCODE                      CAT714  
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   CAT714  
           END-IF.                                                      CAT714  
                                                                        CAT714  
       4000-EXIT. EXIT.                                                 CAT714  
                                                                        CAT714  
      /                                                                 CAT714  
       8500-SQL-ERROR.                                                  CAT714  
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                  CAT714  
                                    W-DB2-MESSAGE-LEN.                  CAT714  
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                        CAT714  
             UNTIL W-DB2-IDX GREATER THAN 12                            CAT714  
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES              CAT714  
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)               CAT714  
                   END-IF                                               CAT714  
           END-PERFORM.                                                 CAT714  
           DISPLAY ' '                                                  CAT714  
                                                                        CAT714  
           DISPLAY 'CAT715: U3999 - ABENDING ON BAD DB2 STATUS'         CAT714  
           DISPLAY 'CAT715: PROGRAM ENDED ABNORMALLY'                   CAT714  
           MOVE +3999    TO ABEND-CODE                                  CAT714  
           CALL ABEND USING ABEND-CODE.                                 CAT714  
                                                                        CAT714  
       8500-EXIT. EXIT.                                                 CAT714  
      /                                                                 CAT714  
       9000-CLOSE-ROUTINE.                                              CAT714  
           DISPLAY 'VTRNHSTY ROWS READ      ' WS-VTRNHSTY-ROWS-READ.            
           DISPLAY 'CAGE INDEX RECS WRITTEN ' WS-RECS-WRITTEN.                  
           CLOSE CAGE-TAG-INDEX.                                                
                                                                        CAT714  
       9000-EXIT. EXIT.                                                 CAT714  
