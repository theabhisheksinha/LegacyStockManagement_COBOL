000001* PDX    - CAT612   C0237874 10/24/06 15:02:33 TBLAMUR            00001000
      * LRM001 - SSR 45063 ONGOING. RR UPD ISSUE WITH MULTI RECORDS     00001000
      *          ALSO REPL RR-CD ON ACTITRF (IF REJ ROW EXISTS).        00001000
000001* PDX    - CAT612   C0236781 07/27/06 08:57:28 TBLAMUR            00001000
000001* PDX    - CAT612   C0230019 05/12/06 12:03:43 TBEDTAK            00001000
      * ET0001 - SSR 45063 UPDATE RR# OF VTRNFR BASED ON ALT-BRANCH# &  00001000
      * ET0001   RR# TABLE/FILE (S*.***.CBT610.ACATAB).                 00001000
000001* PDX    - CAT612   C0157686 04/20/01 14:04:05 TBLAMUR            00001000
000001* PDX    - CAT612   C0124379 05/04/99 16:28:15 TBEDTAK            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID. CAT612.                                                      
      *                                                                         
       DATE-WRITTEN. APRIL 1999.                                                
      *****************************************************************         
      *REMARKS.                                                       *         
      *                                                               *         
      *  CAT612     - UPDATES DB2 TABLE AFTER NAME & ADDRESS FILE WAS *         
      *               UPDATED BY A PROGRAM 'CAT610' WHICH CREATES AND *         
      *               PASSES A DB2 SAVE KEY FILE FOR 'CAT612' TO      *         
      *               UPDATE THE TABLE.                               *         
      *                                                               *         
      *****************************************************************         
           EJECT                                                                
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
                                                                                
       FILE-CONTROL.                                                            
                                                                                
           SELECT  DB-SAVE-FILE        ASSIGN  TO  UT-S-DBSAVE.                 
                                                                                
       DATA DIVISION.                                                           
                                                                                
       FILE SECTION.                                                            
                                                                                
       FD  DB-SAVE-FILE                                                         
           LABEL RECORDS STANDARD                                               
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
       01  DB-SAVE-RECORD.                                                      
           03  DB-SAVE-CLT-NBR          PIC X(04).                              
           03  DB-SAVE-ACAT-NBR         PIC X(14).                              
           03  DB-SAVE-NA-UPDT-IND      PIC X(01).                              
           03  DB-SAVE-BRANCH           PIC X(03).                              
           03  DB-SAVE-ACCT             PIC X(05).                              
ET0001**   03  FILLER                   PIC X(03).                              
ET0001     03  DB-RR-NBR                PIC X(03).                              
                                                                                
       EJECT                                                                    
                                                                                
       WORKING-STORAGE  SECTION.                                                
      *                                                                         
       77  PGM-NAME                         PIC X(06)  VALUE 'CAT612'.          
                                                                                
       77  ACAT-PROC-DATE                   PIC X(06)  VALUE ' '.               
                                                                                
       77  ABEND-CODE-2000      COMP        PIC S9(4)  VALUE +2000.             
       77  ABEND-CODE-2020      COMP        PIC S9(4)  VALUE +2020.             
       77  ABEND-CODE-2024      COMP        PIC S9(4)  VALUE +2024.             
       77  ABEND-CODE-2028      COMP        PIC S9(4)  VALUE +2028.             
       77  ABEND-CODE-3000      COMP        PIC S9(4)  VALUE +3000.             
       77  ABEND-CODE-3030      COMP        PIC S9(4)  VALUE +3030.             
                                                                                
       77  MSGNO                            PIC 9(3)    VALUE 0.                
           COPY STUBCPY.                                                        
                                                                                
       01  WK-AREA.                                                             
           03  WK-UPDT-IND              PIC X(01).                              
           03  WK-TIMESTAMP             PIC X(26).                              
           03  WK-DBSAVE-IN-CNT         PIC 9(07) COMP-3  VALUE ZERO.           
           03  WK-UPDT-CNT              PIC 9(07) COMP-3  VALUE ZERO.           
           03  WK-UPDT-SKIP-CNT         PIC 9(07) COMP-3  VALUE ZERO.           
           03  WK-NOT-FOUND-CNT         PIC 9(07) COMP-3  VALUE ZERO.           
           03  WK-COMMIT-CNT            PIC 9(05) COMP-3  VALUE ZERO.           
           03  WK-LOOP-CNT              PIC 9(05) COMP-3  VALUE ZERO.           
           03  SAVE-FL-EOF-SW           PIC X(01) VALUE SPACE.                  
               88  SAVE-FL-EOF                    VALUE 'Y'.                    
           03  WK-TRNFR-UPDATED-SW      PIC X(01) VALUE SPACE.                  
               88  WK-TRNFR-UPDATED               VALUE 'Y'.                    
                                                                                
       01  WK-DATE-AREA.                                                CAT520  
           03  PROC-DATE.                                                       
               05  PD-CC                PIC X(2).                               
               05  PD-YY                PIC X(2).                               
               05  PD-MM                PIC X(2).                               
               05  PD-DD                PIC X(2).                               
           03  PROC-DATE-N                                                      
               REDEFINES PROC-DATE      PIC 9(8).                               
       EJECT                                                                    
           COPY BPDATESC.                                                       
       EJECT                                                                    
                                                                                
      ******************************************************************CAT520  
      * DB2 ERROR MESSAGE AREA                                         *CAT520  
      ******************************************************************CAT520  
       01  DSNTIAR                       PIC X(008) VALUE 'DSNTIAR'.    CAT520  
       01  W-DB2-MESSAGE-AREA.                                          CAT520  
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.    CAT520  
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES     CAT520  
                   INDEXED BY W-DB2-IDX.                                CAT520  
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.     CAT520  
                                                                        CAT520  
       01  W-DB2-WORKAREA.                                              CAT520  
           05  ROLLBACK-SQLCA            PIC X(122).                    CAT520  
           05  ROLLBACK-RETURN           PIC S9(9) COMP.                CAT520  
               88  ROLLBACK-OK               VALUE +0.                  CAT520  
               88  ROLLBACK-AB               VALUE -999 THRU -1         CAT520  
                                                   +1   THRU +999.      CAT520  
           05  COMMIT-SQLCA              PIC X(122).                    CAT520  
           05  COMMIT-RETURN             PIC S9(9) COMP.                CAT520  
               88  COMMIT-OK                 VALUE +0.                  CAT520  
               88  COMMIT-AB                 VALUE -999 THRU -1         CAT520  
                                                   +1   THRU +999.      CAT520  
           05  W-COMMIT-CTR              PIC 9(9) COMP-3                CAT520  
                                             VALUE 0.                   CAT520  
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(011) VALUE 0.           CAT520  
                                                                                
       01  W-DB2-ERR-MSG-OUT.                                           CAT520  
           05  FILLER                   PIC X(04) VALUE '**  '.         CAT520  
           05  W-ERR-MSG-OUT            PIC X(50).                      CAT520  
           05  FILLER                   PIC X(12) VALUE '=> SQLCODE: '. CAT520  
           05  W-SQLCODE-OUT            PIC -999.                       CAT520  
       EJECT                                                                    
      ******************************************************************CAT520  
      *    DB2 COMMUNICATION AREA                                      *CAT520  
      ******************************************************************CAT520  
           EXEC SQL                                                             
              INCLUDE SQLCA                                                     
           END-EXEC.                                                            
       EJECT                                                                    
      ******************************************************************CAT520  
      *     ACTIVE TRANSFER DB2 TABLE                                  *CAT520  
      ******************************************************************CAT520  
           EXEC SQL                                                             
              INCLUDE VTRNFR                                                    
           END-EXEC.                                                            
      ******************************************************************CAT520  
      *     INITIAL TRANSFER DB2 TABLE                                 *CAT520  
      ******************************************************************CAT520  
           EXEC SQL                                                             
              INCLUDE ACTITRF                                                   
           END-EXEC.                                                            
       EJECT                                                                    
      ***************************************************************           
       LINKAGE SECTION.                                                         
      ***************************************************************           
       01  PARM-AREA.                                                           
           05  PARM-LENGTH                  PIC S9(4) COMP SYNC.                
               88  PARM-LENGTH-VALID                    VALUE +1.               
           05  PARM-INFO.                                                       
               10  PARM-STREAM              PIC X.                              
                   88  PARM-STREAM-VALID                VALUES ARE              
                       'A' THRU 'Z' '0' THRU '9'.                               
       EJECT                                                                    
      ***************************************************************           
       PROCEDURE DIVISION USING PARM-AREA.                                      
      ***************************************************************           
           COPY MSGCOBO.                                                        
           DISPLAY ' '.                                                         
           DISPLAY '*** ' PGM-NAME ' BEGINNING INITIAL ROUTINE ***'.            
                                                                                
           IF PARM-LENGTH-VALID                                                 
              CONTINUE                                                          
           ELSE                                                                 
              DISPLAY 'INVALID PARM LENGTH, LENGTH MUST BE 1 CHAR '             
              DISPLAY 'PARM ENTERED - ' PARM-INFO                               
              DISPLAY 'PROGRAM CAT612 ABENDED '                                 
              CALL ABEND          USING ABEND-CODE-2000.                        
                                                                                
           IF PARM-STREAM-VALID                                                 
              CONTINUE                                                          
           ELSE                                                                 
              DISPLAY 'PARM INVALID, MUST BE 1 CHAR ALPHANUMERIC'               
              DISPLAY 'PARM ENTERED - ' PARM-INFO                               
              DISPLAY 'PROGRAM CAT612 ABENDED '                                 
              CALL ABEND          USING ABEND-CODE-2000.                        
                                                                                
           MOVE  PGM-NAME                TO BPDATES-CALLING-PGM.                
           MOVE  'C'                     TO BPDATES-REQ-TYPE.                   
           CALL   BPDATES             USING BPDATES-PARAMETERS.                 
                                                                                
           MOVE  BPD-PROC-DATE           TO  PROC-DATE.                         
                                                                                
           DISPLAY 'PROCESS DATE = ' BPD-PROC-DATE.                             
                                                                                
           OPEN INPUT  DB-SAVE-FILE.                                            
                                                                                
           PERFORM PROCESS-RTN                                                  
              THRU PROCESS-RTN-EXIT                                             
                   UNTIL SAVE-FL-EOF.                                           
                                                                                
           CLOSE DB-SAVE-FILE.                                                  
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY '***********************************************'.           
           DISPLAY '* DBSAVE RECS READ:       '   WK-DBSAVE-IN-CNT.             
           DISPLAY '* TRANSFER RECS UPDATED:  '   WK-UPDT-CNT.                  
           DISPLAY '* RECORD UPDATE SKIPPED:  '   WK-UPDT-SKIP-CNT.             
           DISPLAY '* RECORD NOT FOUND:       '   WK-NOT-FOUND-CNT.             
           DISPLAY '***********************************************'.           
           DISPLAY ' '.                                                         
           DISPLAY '*** CAT612 ENDED SUCCESSFULLY ***'.                         
                                                                                
           GOBACK.                                                              
       EJECT                                                                    
      *                                                                         
      *------------------------------------------------------------*            
      *    PROCESS ROUTINE                                                      
      *------------------------------------------------------------*            
       PROCESS-RTN.                                                             
                                                                                
           READ DB-SAVE-FILE                                                    
                AT END       SET SAVE-FL-EOF TO TRUE                            
                             GO TO PROCESS-RTN-EXIT.                            
                                                                                
           MOVE DB-SAVE-CLT-NBR  TO CLIENT-NBR OF DCLVTRNFR.                    
           MOVE DB-SAVE-ACAT-NBR TO ACAT-CONTROL-NBR OF DCLVTRNFR.              
           ADD  1     TO WK-DBSAVE-IN-CNT.                                      
                                                                                
           EXEC SQL                                                             
              SELECT  CLIENT_NBR                                                
                     ,ACAT_CONTROL_NBR                                          
                     ,ACCT_NA_UPDT_IND                                          
                INTO :DCLVTRNFR.CLIENT-NBR                                      
                    ,:DCLVTRNFR.ACAT-CONTROL-NBR                                
                    ,:DCLVTRNFR.ACCT-NA-UPDT-IND                                
                FROM VTRNFR                                                     
               WHERE CLIENT_NBR = :DCLVTRNFR.CLIENT-NBR                         
                 AND ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CONTROL-NBR             
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              CONTINUE                                                          
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              ADD +1 TO WK-NOT-FOUND-CNT                                        
              DISPLAY 'DB REC NOT FND: CLT=' CLIENT-NBR OF DCLVTRNFR            
                      ' ACAT-CNTL=' ACAT-CONTROL-NBR  OF DCLVTRNFR              
              GO TO PROCESS-RTN-EXIT                                            
           ELSE                                                                 
              PERFORM  SQL-ERROR-RTN                                    CAT520  
              MOVE 'DB2 ACAT-TRNFR "SELECT INTO" ERROR'                         
                TO W-ERR-MSG-OUT                                                
              MOVE SQLCODE TO W-SQLCODE-OUT                                     
              DISPLAY ' '                                                       
              DISPLAY W-DB2-ERR-MSG-OUT                                 CAT520  
              DISPLAY '** PROGRAM CAT612 ABENDED '                              
              CALL ABEND      USING ABEND-CODE-3000                             
           END-IF.                                                              
                                                                                
           IF ACCT-NA-UPDT-IND = DB-SAVE-NA-UPDT-IND                            
              ADD +1 TO WK-UPDT-SKIP-CNT                                        
              DISPLAY 'UPDATE SKIPPED: CLT=' CLIENT-NBR OF DCLVTRNFR            
                      ' ACAT-CNTL=' ACAT-CONTROL-NBR OF DCLVTRNFR               
                      ' NA-UPDT-IND=' ACCT-NA-UPDT-IND                          
              GO TO PROCESS-RTN-EXIT                                            
           END-IF.                                                              
                                                                                
           MOVE    SPACE                TO    WK-TRNFR-UPDATED-SW.              
ET0001**   PERFORM UPDATE-TRNFR-TBL     UNTIL WK-TRNFR-UPDATED.                 
                                                                                
ET0001     IF DB-SAVE-NA-UPDT-IND = 'R'                                         
ET0001        PERFORM UPDATE-TRNFR-RR-NBR                                       
ET0001            UNTIL WK-TRNFR-UPDATED                                        
ET0001     ELSE                                                                 
ET0001        PERFORM UPDATE-TRNFR-TBL                                          
ET0001            UNTIL WK-TRNFR-UPDATED                                        
ET0001     END-IF.                                                              
                                                                                
           ADD  +1   TO  WK-UPDT-CNT  WK-COMMIT-CNT.                            
           IF WK-COMMIT-CNT > 9                                                 
              EXEC SQL                                                          
                   COMMIT                                                       
              END-EXEC                                                          
              MOVE 0      TO WK-COMMIT-CNT                                      
           END-IF.                                                              
                                                                                
       PROCESS-RTN-EXIT.                                   EXIT.                
       EJECT                                                                    
      *                                                                         
      *------------------------------------------------------------*            
      *      UPDATE TRANSFER TABLE                                              
      *------------------------------------------------------------*            
       UPDATE-TRNFR-TBL.                                                        
           EXEC SQL                                                             
              SET :WK-TIMESTAMP = CURRENT TIMESTAMP                             
           END-EXEC.                                                            
                                                                                
           MOVE DB-SAVE-NA-UPDT-IND TO ACCT-NA-UPDT-IND OF DCLVTRNFR.           
           EXEC SQL                                                             
             UPDATE VTRNFR                                                      
                SET ACCT_NA_UPDT_IND = :DCLVTRNFR.ACCT-NA-UPDT-IND              
                   ,UPDT_TMSTP = :WK-TIMESTAMP                                  
                   ,PRGM_NM = 'CAT612'                                          
              WHERE CLIENT_NBR = :DCLVTRNFR.CLIENT-NBR                          
                AND ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CONTROL-NBR              
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = -911                                                    
              IF WK-LOOP-CNT < +10                                      CAT520  
                 ADD +1 TO WK-LOOP-CNT                                  CAT520  
                 CONTINUE                                               CAT520  
              ELSE                                                      CAT520  
                 PERFORM  SQL-ERROR-RTN                                 CAT520  
                 MOVE 'DB2 ACAT-TRNFR UPDATE CONTENTION ERROR'                  
                   TO W-ERR-MSG-OUT                                             
                 MOVE SQLCODE TO W-SQLCODE-OUT                                  
                 DISPLAY ' '                                                    
                 DISPLAY W-DB2-ERR-MSG-OUT                              CAT520  
                 DISPLAY '** PROGRAM CAT612 ABENDED '                           
                 CALL ABEND      USING ABEND-CODE-3000                          
              END-IF                                                    CAT520  
           ELSE                                                         CAT520  
           IF SQLCODE NOT = 0                                                   
              PERFORM  SQL-ERROR-RTN                                    CAT520  
              MOVE 'DB2 ACAT-TRNFR TABLE UPDATE ERROR'                          
                TO W-ERR-MSG-OUT                                                
              MOVE SQLCODE TO W-SQLCODE-OUT                                     
              DISPLAY ' '                                                       
              DISPLAY W-DB2-ERR-MSG-OUT                                 CAT520  
              DISPLAY '** PROGRAM CAT612 ABENDED '                              
              CALL ABEND      USING ABEND-CODE-3000                             
           ELSE                                                                 
              MOVE 0 TO WK-LOOP-CNT                                     CAT520  
              SET WK-TRNFR-UPDATED TO TRUE                                      
           END-IF.                                                              
       EJECT                                                                    
ET0001*                                                                         
ET0001*------------------------------------------------------------*            
ET0001*      UPDATE RR# OF VTRNFR AND ACTITRF TABLES                            
ET0001*------------------------------------------------------------*            
ET0001 UPDATE-TRNFR-RR-NBR.                                                     
           EXEC SQL                                                             
              SET :WK-TIMESTAMP = CURRENT TIMESTAMP                             
           END-EXEC.                                                            
                                                                                
LRM001     MOVE DB-RR-NBR TO RR-CD OF DCLVTRNFR.                                
                                                                                
           EXEC SQL                                                             
             UPDATE VTRNFR                                                      
LRM001          SET RR_CD = :DCLVTRNFR.RR-CD                                    
                   ,UPDT_TMSTP = :WK-TIMESTAMP                                  
                   ,PRGM_NM = 'CAT612'                                          
              WHERE CLIENT_NBR = :DCLVTRNFR.CLIENT-NBR                          
                AND ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CONTROL-NBR              
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = -911                                                    
              IF WK-LOOP-CNT < +10                                      CAT520  
                 ADD +1 TO WK-LOOP-CNT                                  CAT520  
                 CONTINUE                                               CAT520  
              ELSE                                                      CAT520  
                 PERFORM  SQL-ERROR-RTN                                 CAT520  
                 MOVE 'DB2 ACAT-TRNFR-RR# UPDATE CONTENTION ERROR'              
                   TO W-ERR-MSG-OUT                                             
                 MOVE SQLCODE TO W-SQLCODE-OUT                                  
                 DISPLAY ' '                                                    
                 DISPLAY W-DB2-ERR-MSG-OUT                              CAT520  
                 DISPLAY '** PROGRAM CAT612 ABENDED '                           
                 CALL ABEND      USING ABEND-CODE-3000                          
              END-IF                                                    CAT520  
           ELSE                                                         CAT520  
           IF SQLCODE NOT = 0                                                   
              PERFORM  SQL-ERROR-RTN                                    CAT520  
              MOVE 'RR# ON DB2 ACAT-TRNFR TABLE UPDATE ERROR'                   
                TO W-ERR-MSG-OUT                                                
              MOVE SQLCODE TO W-SQLCODE-OUT                                     
              DISPLAY ' '                                                       
              DISPLAY W-DB2-ERR-MSG-OUT                                 CAT520  
              DISPLAY '** PROGRAM CAT612 ABENDED '                              
              CALL ABEND      USING ABEND-CODE-3000                             
           ELSE                                                                 
              MOVE 0 TO WK-LOOP-CNT                                     CAT520  
              SET WK-TRNFR-UPDATED TO TRUE                                      
           END-IF.                                                              
                                                                                
           IF SQLCODE = 0                                                       
             EXEC SQL                                                           
             UPDATE ACTITRF                                                     
LRM001          SET RR_CD = :DCLVTRNFR.RR-CD                                    
                   ,UPDT_TMSTP = :WK-TIMESTAMP                                  
                   ,PRGM_NM = 'CAT612'                                          
              WHERE CLIENT_NBR = :DCLVTRNFR.CLIENT-NBR                          
                AND ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CONTROL-NBR              
             END-EXEC                                                           
             IF SQLCODE NOT = 0 AND +100                                        
                PERFORM  SQL-ERROR-RTN                                  CAT520  
                MOVE 'RR# ON DB2 ACAT-INIT-TRNFR TABLE UPDATE ERROR'            
                  TO W-ERR-MSG-OUT                                              
                MOVE SQLCODE TO W-SQLCODE-OUT                                   
                DISPLAY ' '                                                     
                DISPLAY W-DB2-ERR-MSG-OUT                               CAT520  
                DISPLAY '** PROGRAM CAT612 ABENDED '                            
                CALL ABEND      USING ABEND-CODE-3030                           
             END-IF                                                             
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *------------------------------------------------------------*            
      *      DB2 ERROR ROUTINE                                                  
      *------------------------------------------------------------*            
       SQL-ERROR-RTN.                                                   CAT520  
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                  CAT520  
                                    W-DB2-MESSAGE-LEN.                  CAT520  
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                        CAT520  
             UNTIL W-DB2-IDX GREATER THAN 12                            CAT520  
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES              CAT520  
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)               CAT520  
                   END-IF                                               CAT520  
           END-PERFORM.                                                 CAT520  
