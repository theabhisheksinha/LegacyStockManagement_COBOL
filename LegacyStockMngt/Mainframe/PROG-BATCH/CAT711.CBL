000001* PDX    - CAT711   C0307327 01/31/11 14:24:58 TBLAMUR            00001000
LRM002* SSR 70607 MARK FULL RECEIVE IN REV AS LAST DAY TO DELETE/REJECT         
LRM002* SSR 70607 MARK FULL RECEIVE IN REV-ADJ AS LAST DAY TO DELETE            
LRM002*           MARK FULL DLVR IN REV AS LAST DAY TO DELETE                   
000001* PDX    - CAT711   C0304091 11/15/10 16:21:47 TBLAMUR            00001000
000001* PDX    - CAT711   C0290882 01/19/10 09:54:07 TBEDTAK            00001000
ET0001* SSR 65991 SETUP REJECT LATE SUBMISSION FLAG ON FULL RECEIVER IN         
ET0001*           DAY 1 RECORD.                                                 
000001* PDX    - CAT711   C0249582 07/05/07 08:45:20 TBLAMUR            00001000
LRM001* SSR 51567 SHORTEN CYCLE.  REMOVE DAYS IN STATUS TEST FROM FULL          
LRM001*     AND PTR "MARK AS LATE" LOGIC, AS THESE IN REQUEST MODE              
LRM001*     MUST BE RESPONDED TO NO LATER THAN TOMORROW.                        
000001* PDX    - CAT711   C0238525 09/11/06 08:51:06 TBDOJUN            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT711.                                                     
      *REMARK.                                                                  
      *---------------------------------------------------------------          
      * CAT711 - SET REJECT CUTOFF FLAG ON ACTIVE TRANSFER TO                   
      *          INDICATE THIS IS THE LAST DAY TO REJECT THE TRANSFER.          
      *                                                                         
      * SSR#45145: CREATE ONLINE WARNING MESSAGE WHEN USERS ARE                 
      * ATTEMPTING TO REJECT AFTER THE NSCC CUTOFF TIME.                        
      * USE 'RERUN.EARLY'.                                                      
      *                                                                         
      * FULL DELIVERY IN REQUEST 100, DAYS IN STATUS = 03                       
      * FULL DELIVERY IN REQUEST ADJUST 110, TRY 03                             
      * FULL RECEIVE IN REVIEW 200, DAYS IN STATUS = 02                         
      * FULL RECEIVE IN REVIEW ADJUST 210, TRY DAYS = 02                        
ET0001* FULL RECEIVE IN REJECT STATUS 140, IN DAYS = 01                         
      * PTR  DELIVERY MEMO REQUEST 500, DAYS = 02                               
      * RCL (BY THE ORIGINAL DELIVERER DST-SIDE = R) REVIEW 200,                
      *      DAYS = 03                                                          
      *                                                                         
      *---------------------------------------------------------------          
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
       DATA DIVISION.                                                           
      ******************************************************************        
       WORKING-STORAGE SECTION.                                                 
      ******************************************************************        
           COPY PDXIDCOB.                                                       
       01  W-WORK-AREA.                                                         
           03  W-END-OF-TABLE            PIC  X(01) VALUE ' '.                  
               88 END-OF-TABLE                      VALUE 'Y'.                  
           03  W-CURRENT-TMSTMP          PIC  X(26) VALUE ' '.                  
           03  W-FETCH-COUNT             PIC  9(07) COMP-3 VALUE 0.             
           03  W-UPDATE-COUNT            PIC  9(07) COMP-3 VALUE 0.             
           03  W-COMMIT-COUNT            PIC  9(05) COMP-3 VALUE 0.             
       01  W-DATABASE-WORK-AREA.                                                
           03  W-CLIENT-NBR              PIC  X(04) VALUE LOW-VALUES.           
           03  W-ACAT-CNTL-NBR           PIC  X(14) VALUE LOW-VALUES.           
           03  W-DSTBN-SIDE-CD           PIC  X(01) VALUE LOW-VALUES.           
           03  W-TRNFR-TYPE-CD           PIC  X(03) VALUE LOW-VALUES.           
           03  W-STTS-CD                 PIC  X(03) VALUE LOW-VALUES.           
           03  W-DAYS-STTS-QTY           PIC S9(04) USAGE COMP.                 
      /                                                                         
      ******************************************************************        
      * ACTIVE TRANSFER DB2 TABLE                                      *        
      ******************************************************************        
           EXEC SQL INCLUDE VTRNFR END-EXEC.                                    
      /                                                                         
      ******************************************************************        
      * DB2 COMMAREA                                                   *        
      ******************************************************************        
       01  FILLER                        PIC  X(08) VALUE 'SQLCA   '.           
           EXEC SQL INCLUDE SQLCA        END-EXEC.                              
      /                                                                         
      ******************************************************************        
      * DB2 ERROR MESSAGE AREA                                         *        
      ******************************************************************        
       01  W-DB2-MESSAGE-AREA.                                                  
           05  DSNTIAR                   PIC  X(08) VALUE 'DSNTIAR '.           
           05  W-DB2-MESSAGE-LEN         PIC S9(09) COMP VALUE +80.             
           05  W-DB2-ERROR-MSG           PIC  X(80) OCCURS 12 TIMES             
                               INDEXED BY W-DB2-IDX.                            
      /                                                                         
      ******************************************************************        
      * COBOL LE AREA                                                  *        
      ******************************************************************        
       01  W-ABEND-AREA.                                                        
           05  ABEND-CODE                PIC S9(04) COMP SYNC.                  
       01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.           
           COPY STUBCPY.                                                        
      /                                                                         
      *****************************************************************         
       PROCEDURE DIVISION.                                                      
      *****************************************************************         
           DISPLAY 'CAT711 - SET REJECT CUTOFF FLAG ON VTRNFR'                  
           DISPLAY ' '.                                                         
           COPY MSGCOBO.                                                        
           DISPLAY ' '.                                                         
           PERFORM GET-TIMESTAMP THRU GET-TIMESTAMP-EXIT.                       
           PERFORM GET-ROW THRU GET-ROW-EXIT.                                   
           DISPLAY ' '.                                                         
           DISPLAY 'FETCHED COUNT= ' W-FETCH-COUNT.                             
           DISPLAY 'UPDATED COUNT= ' W-UPDATE-COUNT.                            
           DISPLAY 'CAT711 ENDED SUCCESSFULLY.'.                                
           GOBACK.                                                              
                                                                                
                                                                                
      *******************                                                       
       GET-TIMESTAMP.                                                           
      *******************                                                       
                                                                                
           EXEC SQL                                                             
               SET :W-CURRENT-TMSTMP    = CURRENT TIMESTAMP                     
           END-EXEC                                                             
                                                                                
           IF  SQLCODE = +0                                                     
               DISPLAY ' '                                                      
               DISPLAY 'CAT711: W-CURRENT-TIMESTAMP = '                         
                                                    W-CURRENT-TMSTMP            
               DISPLAY ' '                                                      
           ELSE                                                                 
               DISPLAY 'CAT711: W-CURRENT-TIMESTAMP NOT SET'                    
               DISPLAY 'SQLCODE = ' SQLCODE                                     
               PERFORM SQL-ERROR-ROUTINE                                        
           END-IF.                                                              
                                                                                
       GET-TIMESTAMP-EXIT. EXIT.                                                
                                                                                
      *******************                                                       
       GET-ROW.                                                                 
      *******************                                                       
                                                                                
      *DECLARE------------------------------------------->                      
           EXEC SQL DECLARE TABLE_CURSOR CURSOR WITH HOLD FOR                   
             SELECT                                                             
                   CLIENT_NBR                                                   
                  ,ACAT_CONTROL_NBR                                             
                  ,TRNFR_TYPE_CD                                                
                  ,DSTBN_SIDE_CD                                                
                  ,STTS_CD                                                      
                  ,DAYS_STTS_QTY                                                
             FROM VTRNFR                                                        
             WHERE                                                              
                  TRNFR_TYPE_CD IN ('FUL', 'PTR', 'RCL')                        
                  ORDER BY CLIENT_NBR, ACAT_CONTROL_NBR                         
           END-EXEC.                                                            
      *<-------------------------------------------------                       
                                                                                
           EXEC SQL OPEN TABLE_CURSOR END-EXEC.                                 
                                                                                
           PERFORM UNTIL END-OF-TABLE                                           
              EXEC SQL FETCH TABLE_CURSOR INTO                                  
                      :DCLVTRNFR.CLIENT-NBR                                     
                     ,:DCLVTRNFR.ACAT-CONTROL-NBR                               
                     ,:DCLVTRNFR.TRNFR-TYPE-CD                                  
                     ,:DCLVTRNFR.DSTBN-SIDE-CD                                  
                     ,:DCLVTRNFR.STTS-CD                                        
                     ,:DCLVTRNFR.DAYS-STTS-QTY                                  
              END-EXEC                                                          
              EVALUATE SQLCODE                                                  
              WHEN +0                                                           
                   ADD 1 TO W-FETCH-COUNT                                       
                   MOVE CLIENT-NBR       OF DCLVTRNFR                           
                                                   TO W-CLIENT-NBR              
                   MOVE ACAT-CONTROL-NBR OF DCLVTRNFR                           
                                                   TO W-ACAT-CNTL-NBR           
                   MOVE TRNFR-TYPE-CD OF DCLVTRNFR TO W-TRNFR-TYPE-CD           
                   MOVE DSTBN-SIDE-CD OF DCLVTRNFR TO W-DSTBN-SIDE-CD           
                   MOVE STTS-CD       OF DCLVTRNFR TO W-STTS-CD                 
                   MOVE DAYS-STTS-QTY OF DCLVTRNFR TO W-DAYS-STTS-QTY           
                   PERFORM PROCESS-ROW THRU PROCESS-ROW-EXIT                    
                   MOVE +0     TO SQLCODE                                       
              WHEN +100                                                         
                   SET END-OF-TABLE TO TRUE                                     
              WHEN OTHER                                                        
                   PERFORM SQL-ERROR-ROUTINE                                    
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           EXEC SQL CLOSE TABLE_CURSOR END-EXEC.                                
                                                                                
       GET-ROW-EXIT. EXIT.                                                      
                                                                                
      *******************                                                       
       PROCESS-ROW.                                                             
      *******************                                                       
                                                                                
           IF  W-TRNFR-TYPE-CD      = 'FUL'                                     
           AND W-DSTBN-SIDE-CD      = 'D'                                       
           AND W-STTS-CD            = '100'                                     
LRM001*****AND W-DAYS-STTS-QTY      =  03                                       
               PERFORM UPDATE-ROW THRU UPDATE-ROW-EXIT                          
           END-IF.                                                              
           IF  W-TRNFR-TYPE-CD      = 'FUL'                                     
           AND W-DSTBN-SIDE-CD      = 'D'                                       
           AND W-STTS-CD            = '110'                                     
LRM001*****AND W-DAYS-STTS-QTY      =  03                                       
               PERFORM UPDATE-ROW THRU UPDATE-ROW-EXIT                          
           END-IF.                                                              
           IF  W-TRNFR-TYPE-CD      = 'FUL'                                     
           AND W-DSTBN-SIDE-CD      = 'R'                                       
           AND W-STTS-CD            = '200'                                     
LRM002     AND W-DAYS-STTS-QTY      =  01                                       
               PERFORM UPDATE-ROW THRU UPDATE-ROW-EXIT                          
           END-IF.                                                              
LRM002     IF  W-TRNFR-TYPE-CD      = 'FUL'                                     
LRM002     AND W-DSTBN-SIDE-CD      = 'D'                                       
LRM002     AND W-STTS-CD            = '200'                                     
LRM002     AND W-DAYS-STTS-QTY      =  01                                       
LRM002         PERFORM UPDATE-ROW THRU UPDATE-ROW-EXIT                          
LRM002     END-IF.                                                              
           IF  W-TRNFR-TYPE-CD      = 'FUL'                                     
           AND W-DSTBN-SIDE-CD      = 'R'                                       
           AND W-STTS-CD            = '210'                                     
LRM002     AND W-DAYS-STTS-QTY      =  01                                       
               PERFORM UPDATE-ROW THRU UPDATE-ROW-EXIT                          
           END-IF.                                                              
ET0001     IF  W-TRNFR-TYPE-CD      = 'FUL'                                     
ET0001     AND W-DSTBN-SIDE-CD      = 'R'                                       
ET0001     AND W-STTS-CD            = '140'                                     
ET0001     AND W-DAYS-STTS-QTY      =  01                                       
ET0001         PERFORM UPDATE-ROW THRU UPDATE-ROW-EXIT                          
ET0001     END-IF.                                                              
           IF  W-TRNFR-TYPE-CD      = 'PTR'                                     
           AND W-DSTBN-SIDE-CD      = 'D'                                       
           AND W-STTS-CD            = '500'                                     
LRM001*****AND W-DAYS-STTS-QTY      =  02                                       
               PERFORM UPDATE-ROW THRU UPDATE-ROW-EXIT                          
           END-IF.                                                              
           IF  W-TRNFR-TYPE-CD      = 'RCL'                                     
           AND W-DSTBN-SIDE-CD      = 'R'                                       
           AND W-STTS-CD            = '200'                                     
           AND W-DAYS-STTS-QTY      =  03                                       
               PERFORM UPDATE-ROW THRU UPDATE-ROW-EXIT                          
           END-IF.                                                              
                                                                                
       PROCESS-ROW-EXIT. EXIT.                                                  
                                                                                
      *******************                                                       
       UPDATE-ROW.                                                              
      *******************                                                       
      * PUT A "L" IN STTLM_TM_CD TO INDICATE IT IS LAST DAY REJECT              
      *   OR LAST DAY TO UPDATE IN THE GIVEN ACAT STATUS.                       
                                                                                
           EXEC SQL                                                             
               UPDATE VTRNFR                                                    
                  SET STTLM_TM_CD      = 'L'                                    
                     ,PRGM_NM          = 'CAT711 '                              
                     ,UPDT_TMSTP       = :W-CURRENT-TMSTMP                      
                WHERE CLIENT_NBR       = :W-CLIENT-NBR                          
                  AND ACAT_CONTROL_NBR = :W-ACAT-CNTL-NBR                       
           END-EXEC                                                             
           ADD 1 TO W-COMMIT-COUNT                                              
           ADD 1 TO W-UPDATE-COUNT                                              
           DISPLAY  W-UPDATE-COUNT                                              
                  ' ROW UPDATED '                                               
                                  ' ' W-CLIENT-NBR                              
                                  ' ' W-ACAT-CNTL-NBR                           
                                  ' ' W-TRNFR-TYPE-CD                           
                                  ' ' W-DSTBN-SIDE-CD                           
                                  ' ' W-STTS-CD                                 
                                  ' ' W-DAYS-STTS-QTY                           
           IF  W-COMMIT-COUNT = 10                                              
               DISPLAY 'COMMIT'                                                 
               EXEC SQL COMMIT END-EXEC                                         
               MOVE 0 TO W-COMMIT-COUNT                                         
           END-IF                                                               
           MOVE +0  TO  SQLCODE.                                                
                                                                                
       UPDATE-ROW-EXIT. EXIT.                                                   
                                                                                
      *******************                                                       
       SQL-ERROR-ROUTINE.                                                       
      *******************                                                       
                                                                                
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                          
                                    W-DB2-MESSAGE-LEN.                          
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                                
             UNTIL W-DB2-IDX GREATER THAN 12                                    
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES                      
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)                       
                   END-IF                                                       
           END-PERFORM.                                                         
                                                                                
           DISPLAY ' '                                                          
           DISPLAY '*** CAT711 ABENDED +3999  *** '                             
           DISPLAY 'ACAT-CLIENT      = ' W-CLIENT-NBR.                          
           DISPLAY 'ACAT-CONTROL-NBR = ' W-ACAT-CNTL-NBR.                       
           DISPLAY 'FETCHED COUNT    = ' W-FETCH-COUNT.                         
           DISPLAY 'UPDATED COUNT    = ' W-UPDATE-COUNT.                        
           DISPLAY 'CAT711 IS ABENDING.'.                                       
           DISPLAY ' '.                                                         
                                                                                
           EXEC SQL ROLLBACK END-EXEC.                                          
           MOVE +3999    TO ABEND-CODE.                                         
           CALL ABEND USING ABEND-CODE.                                         
