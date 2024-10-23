000001* PDX    - CATMMDB  C0346697 12/04/13 14:24:17 TBLAMUR            00001000
      * SSR 96477 IDENTIFY BANK DEPOSITORY FINDS.                               
       IDENTIFICATION DIVISION.                                         CATMMF  
       PROGRAM-ID.    CATMMDB.                                          CATMMF  
       AUTHOR.      LARRY MUREY.                                        CATMMF  
       DATE-WRITTEN.  OCT 2013.                                         CATMMF  
      *DATE-COMPILED.                                                   CATMMF  
      *REMARKS.  MAINTAIN BANK DEPOSITORY FUND SECURITIES ON DB2        CATMMF  
       EJECT                                                                    
       ENVIRONMENT DIVISION.                                            CATMMF  
       INPUT-OUTPUT SECTION.                                            CATMMF  
                                                                        CATMMF  
       FILE-CONTROL.                                                    CATMMF  
           SELECT  I-BDF-FILE           ASSIGN  TO  UT-S-BDFFL.         CATMMF  
       DATA DIVISION.                                                   CATMMF  
       FILE SECTION.                                                    CATMMF  
                                                                        CATMMF  
LRM004 FD  I-BDF-FILE                                                   CATMMF  
LRM004     LABEL RECORDS ARE STANDARD                                   CATMMF  
LRM004     BLOCK CONTAINS 0 RECORDS.                                    CATMMF  
LRM004 01  I-BDF-RECORD.                                                CATMMF  
LRM004     05  I-BDF-CLIENT         PIC X(04).                                  
LRM004     05  I-BDF-SECURITY       PIC X(07).                                  
LRM004     05  FILLER               PIC X(19).                                  
           EJECT                                                        CATMMF  
      *                                                                 CATMMF  
       WORKING-STORAGE SECTION.                                         CATMMF  
           SKIP2                                                        CATMMF  
       77  FILLER                   PIC X(34)          VALUE            CATMMF  
           'CATMMDB START OF WORKING STORAGE'.                          CATMMF  
       77  WS-SEQUENCE              PIC 9(4).                           CATMMF  
       77  ABEND-CODE               PIC S9(4) COMP SYNC  VALUE ZERO.    CATMMF  
       77  MMF-REC-CNT              PIC 9(06) VALUE ZERO.               CATMMF  
       77  WS-SUB                   PIC S9(4) COMP VALUE ZERO.          CATMMF  
       01  WS-BDF-EOF-SW            PIC X(1) VALUE 'N'.                         
           88  BDF-EOF                       VALUE 'Y'.                         
                                                                        CATMMF  
       01  W-ABEND-SQLCODE                  PIC +++++9.                 CATMMF  
       01  W-TABLE-ID                       PIC X(08)  VALUE SPACES.    CATMMF  
       01  W-FUNCTION                       PIC X(30)  VALUE SPACES.    CATMMF  
                                                                        CATMMF  
       01  WS-SAVE-AREA.                                                CATMMF  
           03  WS-CLIENT-NBR                PIC X(04).                  CATMMF  
       01  WS-BDF-SECURITY-TABLE.                                               
           03  WS-SEC-SUB                   PIC 9(02).                  CATMMF  
           03  WS-SEC-ENTRY OCCURS 17 TIMES PIC X(07).                          
      *                                                                 CATMMF  
      ******************************************************************        
      * INITIAL ASSET TABLE                                            *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'VRSTSEC '.           
           EXEC SQL INCLUDE VRSTSEC      END-EXEC.                              
                                                                                
      * DECLARE CURSOR TO OBTAIN ALL BANK DEPOSIT MONEY MARKET FUND ROWS        
      * THESE HAVE M FOLLOWED BY CLIENT NUMBER                                  
           EXEC SQL                                                             
              DECLARE NSCC_AT1_CRSR CURSOR WITH HOLD FOR                        
                 SELECT                                                         
                    CLIENT_NBR                                                  
                 FROM VRSTSEC                                                   
                 WHERE CLIENT_NBR LIKE 'M%'                                     
           END-EXEC.                                                            
      ******************************************************************        
      * DB2 COMMAREA                                                   *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'SQLCA   '.           
           EXEC SQL INCLUDE SQLCA        END-EXEC.                              
                                                                                
      ******************************************************************        
      * DB2 ERROR MESSAGE AREA                                         *        
      ******************************************************************        
       01  W-DB2-MESSAGE-AREA.                                                  
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.            
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES             
                   INDEXED BY W-DB2-IDX.                                        
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.             
                                                                                
       01  W-DB2-WORKAREA.                                                      
           05  ROLLBACK-SQLCA            PIC  X(122).                           
           05  ROLLBACK-RETURN           PIC S9(009) COMP.                      
               88  ROLLBACK-OK                VALUE +0.                         
               88  ROLLBACK-AB                VALUE -999 THRU -1                
                                                    +1   THRU +999.             
           05  COMMIT-SQLCA              PIC  X(122).                           
           05  COMMIT-RETURN             PIC S9(009) COMP.                      
               88  COMMIT-OK                  VALUE +0.                         
               88  COMMIT-AB                  VALUE -999 THRU -1                
                                                    +1   THRU +999.             
           05  W-COMMIT-CNT              PIC  9(009) COMP-3 VALUE 0.            
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(009) COMP-3 VALUE 0.            
           05  W-DB2-TABLE-NAME          PIC  X(008).                           
           05  W-DB2-ACTION              PIC  X(008).                           
           05  W-DB2-SQLCODE             PIC  ---9.                             
           05  W-AST-SQLCODE             PIC S9(9) COMP-4.                      
           05  W-SQLERRD-3               PIC  9(9).                             
           05  W-SQL-DELETE-COUNT        PIC  --------9.                        
                                                                                
       01  FILLER                        PIC  X(008) VALUE 'TIMESTMP'.          
       01  WS-TIMESTAMP                  PIC X(26).                             
                                                                                
       01  CALL-MODULES.                                                        
           05  DSNTIAR                   PIC  X(08) VALUE 'DSNTIAR '.           
           COPY STUBCPY.                                                        
                                                                                
           EJECT                                                        CATMMF  
      *                                                                 CATMMF  
       PROCEDURE DIVISION.                                              CATMMF  
           DISPLAY 'CATMMDB - '                                         CATMMF  
               'MAINTAIN BANK DEPOSITORY FUND SECURITIES ON DB2'        CATMMF  
           DISPLAY ' '.                                                 CATMMF  
           COPY MSGCOBO.                                                CATMMF  
           DISPLAY ' '.                                                 CATMMF  
                                                                        CATMMF  
           OPEN  INPUT I-BDF-FILE.                                      CATMMF  
                                                                                
           PERFORM 1000-CLEAR-BDF-ROWS-RTN.                             CATMMF  
                                                                                
           INITIALIZE DCLVRSTSEC.                                               
           MOVE SPACES TO WS-BDF-SECURITY-TABLE.                                
           MOVE ZERO TO WS-SEC-SUB.                                             
           PERFORM 2000-MAIN-RTN                                        CATMMF  
              UNTIL BDF-EOF.                                            CATMMF  
                                                                                
           CLOSE  I-BDF-FILE.                                           CATMMF  
                                                                        CATMMF  
           DISPLAY '** TOTAL MMF REC WRITTEN = ' MMF-REC-CNT.           CATMMF  
           MOVE  ZERO  TO  RETURN-CODE.                                 CATMMF  
                                                                        CATMMF  
           DISPLAY ' '.                                                 CATMMF  
           DISPLAY 'CATMMDB - COMPLETED SUCCESFULLY'.                   CATMMF  
           GOBACK.                                                      CATMMF  
           EJECT                                                        CATMMF  
                                                                        CATMMF  
        1000-CLEAR-BDF-ROWS-RTN.                                        CATMMF  
           EXEC SQL                                                             
              OPEN NSCC_AT1_CRSR                                                
           END-EXEC                                                             
                                                                                
           IF SQLCODE NOT = +0                                                  
              DISPLAY '** CATMMDB ABENDED: SQL AT1 CURSOR OPEN - CLT='  CAT755  
                      CLIENT-NBR OF DCLVRSTSEC                          CAT755  
              MOVE SQLCODE TO W-DB2-SQLCODE                                     
              DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                                
              PERFORM 8500-SQL-ERROR                                    CAT755  
           END-IF                                                               
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
              EXEC SQL                                                          
                 FETCH NSCC_AT1_CRSR                                            
                    INTO                                                        
                    :DCLVRSTSEC.CLIENT-NBR                                      
              END-EXEC                                                          
              IF SQLCODE = +0                                                   
                 DISPLAY 'FETCHED ' CLIENT-NBR OF DCLVRSTSEC                    
                 PERFORM 1100-DELETE-VRSTSEC-ROW                                
                 MOVE +0 TO SQLCODE                                             
              ELSE                                                              
              IF SQLCODE = +100                                                 
                  CONTINUE                                                      
              ELSE                                                              
                 DISPLAY '** CATMMDB ABENDED: SQL AT1 FETCH '           CAT755  
                 PERFORM 8500-SQL-ERROR                                 CAT755  
                 MOVE SQLCODE TO W-DB2-SQLCODE                                  
                 DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                             
              END-IF END-IF                                                     
           END-PERFORM.                                                         
                                                                                
           EXEC SQL                                                             
              CLOSE NSCC_AT1_CRSR                                               
           END-EXEC                                                             
                                                                                
           IF SQLCODE NOT = +0                                                  
              DISPLAY '** CATMMDB ABENDED: SQL AT1 CURSOR CLOSE - CLT=' CAT755  
                      CLIENT-NBR OF DCLVRSTSEC                          CAT755  
              MOVE SQLCODE TO W-DB2-SQLCODE                                     
              DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                                
              PERFORM 8500-SQL-ERROR                                    CAT755  
           END-IF.                                                              
                                                                        CATMMF  
       1100-DELETE-VRSTSEC-ROW.                                                 
           EXEC SQL DELETE                                                      
               FROM  VRSTSEC                                                    
              WHERE  CLIENT_NBR        = :DCLVRSTSEC.CLIENT-NBR                 
           END-EXEC.                                                            
           IF SQLCODE NOT = +0                                                  
              DISPLAY '** CATMMDB ABENDED: SQL VRSTSEC DELETE - CLT='   CAT755  
                      CLIENT-NBR OF DCLVRSTSEC                          CAT755  
              MOVE SQLCODE TO W-DB2-SQLCODE                                     
              DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                                
              PERFORM 8500-SQL-ERROR                                    CAT755  
           END-IF.                                                              
           DISPLAY 'DELETED DBF ROW ' CLIENT-NBR OF DCLVRSTSEC.                 
                                                                                
       EJECT                                                            CATMMF  
      *                                                                 CATMMF  
       2000-MAIN-RTN.                                                   CATMMF  
                                                                        CATMMF  
           READ I-BDF-FILE                                              CATMMF  
              AT END                                                            
                SET BDF-EOF TO TRUE                                             
                MOVE '9999' TO I-BDF-CLIENT                                     
           END-READ.                                                            
                                                                                
           MOVE 'M'               TO WS-CLIENT-NBR(1:1).                CAT755  
           MOVE I-BDF-CLIENT(2:3) TO WS-CLIENT-NBR(2:3).                CAT755  
           IF CLIENT-NBR OF DCLVRSTSEC > SPACES                                 
              IF CLIENT-NBR OF DCLVRSTSEC NOT = WS-CLIENT-NBR                   
                 PERFORM 3000-INSERT-VRSTSEC                                    
                 INITIALIZE DCLVRSTSEC                                          
                 MOVE SPACES TO WS-BDF-SECURITY-TABLE                           
                 MOVE ZERO TO WS-SEC-SUB                                        
              END-IF                                                            
           END-IF.                                                              
           MOVE WS-CLIENT-NBR TO CLIENT-NBR OF DCLVRSTSEC               CAT755  
           ADD 1 TO WS-SEC-SUB.                                                 
           MOVE I-BDF-SECURITY TO WS-SEC-ENTRY(WS-SEC-SUB).                     
           MOVE 'CATMMDB'      TO PRGM-NM OF DCLVRSTSEC.                        
                                                                                
      *                                                                 CAT755  
       3000-INSERT-VRSTSEC.                                             CAT755  
           EXEC SQL                                                     CAT755  
               SET :WS-TIMESTAMP = CURRENT TIMESTAMP                    CAT755  
           END-EXEC.                                                    CAT755  
                                                                        CAT755  
           MOVE WS-BDF-SECURITY-TABLE TO COMMENT-TXT OF DCLVRSTSEC              
           MOVE WS-TIMESTAMP TO UPDT-TMSTP OF DCLVRSTSEC                CAT755  
                                CRT-TMSTP  OF DCLVRSTSEC                        
           MOVE '0001-01-01'  TO EXPTN-DT OF DCLVRSTSEC                         
           EXEC SQL                                                     CAT755  
              INSERT INTO VRSTSEC                                       CAT755  
                 (                                                      CAT755  
                  CLIENT_NBR                                            CAT755  
                 ,ISIN_SEC_ISSUE_CD                                     CAT755  
                 ,TRNFR_MEMO_IND                                        CAT755  
                 ,TRNFR_BRKR_TYPE_CD                                    CAT755  
                 ,RSTRD_MSG_TXT                                         CAT755  
                 ,PRGM_NM                                               CAT755  
                 ,CICS_TERM_ID_CD                                       CAT755  
                 ,CRT_TMSTP                                             CAT755  
                 ,UPDT_TMSTP                                            CAT755  
                 ,SECURITY_ADP_NBR                                      CAT755  
                 ,EXPTN_DT                                              CAT755  
                 ,COMMENT_TXT                                           CAT755  
                 ,CICS_SGNON_ID                                                 
                 ,TPSCRT_USR_NM                                                 
                 ,TPSCRT_USR_ID                                                 
                 ,CICS_NET_NM                                                   
                  )                                                             
               VALUES                                                   CAT755  
                    (                                                   CAT755  
                   :DCLVRSTSEC.CLIENT-NBR                               CAT755  
                  ,:DCLVRSTSEC.ISIN-SEC-ISSUE-CD                        CAT755  
                  ,:DCLVRSTSEC.TRNFR-MEMO-IND                           CAT755  
                  ,:DCLVRSTSEC.TRNFR-BRKR-TYPE-CD                       CAT755  
                  ,:DCLVRSTSEC.RSTRD-MSG-TXT                            CAT755  
                  ,:DCLVRSTSEC.PRGM-NM                                  CAT755  
                  ,:DCLVRSTSEC.CICS-TERM-ID-CD                          CAT755  
                  ,:DCLVRSTSEC.CRT-TMSTP                                CAT755  
                  ,:DCLVRSTSEC.UPDT-TMSTP                               CAT755  
                  ,:DCLVRSTSEC.SECURITY-ADP-NBR                         CAT755  
                  ,:DCLVRSTSEC.EXPTN-DT                                 CAT755  
                  ,:DCLVRSTSEC.COMMENT-TXT                              CAT755  
                  ,:DCLVRSTSEC.CICS-SGNON-ID                            CAT755  
                  ,:DCLVRSTSEC.TPSCRT-USR-NM                            CAT755  
                  ,:DCLVRSTSEC.TPSCRT-USR-ID                            CAT755  
                  ,:DCLVRSTSEC.CICS-NET-NM                                      
                    )                                                           
           END-EXEC.                                                    CAT755  
                                                                                
           IF SQLCODE = 0                                               CAT755  
              DISPLAY 'ADDED BDF ROW ' CLIENT-NBR OF DCLVRSTSEC         CAT755  
                 ' ' WS-BDF-SECURITY-TABLE                                      
           ELSE                                                         CAT755  
              DISPLAY '** CATMMDB ABENDED: SQL INSERT ERROR - CLT='     CAT755  
                      WS-CLIENT-NBR                                     CAT755  
              MOVE SQLCODE TO W-DB2-SQLCODE                                     
              DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                                
              PERFORM 8500-SQL-ERROR                                    CAT755  
           END-IF.                                                      CAT755  
     *                                                                  CAT755  
       8500-SQL-ERROR.                                                  CAT755  
           DISPLAY ' '                                                  CAT755  
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                  CAT755  
                                    W-DB2-MESSAGE-LEN.                  CAT755  
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                        CAT755  
             UNTIL W-DB2-IDX GREATER THAN 12                            CAT755  
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES              CAT755  
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)               CAT755  
                   END-IF                                               CAT755  
           END-PERFORM.                                                 CAT755  
           DISPLAY ' '                                                  CAT755  
                                                                        CAT755  
           PERFORM 8700-SQL-ROLLBACK.                                   CAT755  
                                                                        CAT755  
           DISPLAY 'CATMMDB: U3999 - ABENDING ON BAD DB2 STATUS'        CAT755  
           DISPLAY 'CATMMDB: PROGRAM ENDED ABNORMALLY'                  CAT755  
           MOVE +3999    TO ABEND-CODE                                  CAT755  
           CALL ABEND USING ABEND-CODE.                                 CAT755  
      *                                                                 CAT755  
       8700-SQL-ROLLBACK.                                               CAT755  
           EXEC SQL ROLLBACK WORK                                       CAT755  
           END-EXEC                                                     CAT755  
                                                                        CAT755  
           MOVE SQLCA   TO ROLLBACK-SQLCA                               CAT755  
           MOVE SQLCODE TO ROLLBACK-RETURN                              CAT755  
                                                                        CAT755  
           IF ROLLBACK-AB                                               CAT755  
               DISPLAY                                                  CAT755  
                   'AUTO ROLLBACK FAILED. ROLLBACK-RETURN = '           CAT755  
                   ROLLBACK-RETURN                                      CAT755  
           ELSE                                                         CAT755  
               DISPLAY                                                  CAT755  
                   'AUTO ROLLBACK SUCCESSFUL. ROLLBACK-RETURN = '       CAT755  
                   ROLLBACK-RETURN                                      CAT755  
           END-IF.                                                      CAT755  
      *#################################################################CAT755  
