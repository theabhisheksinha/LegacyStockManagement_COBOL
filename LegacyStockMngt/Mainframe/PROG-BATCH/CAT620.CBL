000001* PDX    - CAT620   C0361186 01/07/15 09:17:40 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT620.                                                     
      *REMARK.  SSR 103323.                                                     
      *---------------------------------------------------------------          
      * CAT620 - UPDATE ACAT IND TO Y ON PAPER FEE FILE WHEN ACAT               
      *  IS IN SETTLE PREP OR SETTLE CLOSE.  ALSO SPACE OUT THE                 
      *  ACAT CONTROL NUMBER ON THE FILE WHEN THE TRANSFER IS REJECTED          
      *  OR IN REQUEST STATUS, AS THE REFRESH PROCESS WILL REBUILD              
      *  WHATS NEEDED GOING FORWARD.                                            
      *                                                                         
      *  THE ACAT INTRA-DAY FILE (UPDATED IN 5 CYCLES) IS INPUT,                
      *  AND THE OUTPUT FILE IS PASSED TO THE FEE/ZIFP SYSTEM                   
      *  TO CAUSE THEM TO BOOK THE FEE.                                         
      *---------------------------------------------------------------          
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT PAPERFEE         ASSIGN       TO PAPERFEE                     
                                   ACCESS MODE  IS SEQUENTIAL                   
                                   ORGANIZATION IS INDEXED                      
                                   RECORD KEY   IS PAPER-FEE-DTL-KEY            
                                   FILE STATUS  IS PAPERFEE-STAT.               
           SELECT PAPERFEE-OUT     ASSIGN       TO PAPEROUT.                    
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
       FD  PAPERFEE.                                                            
           COPY IFPFUTAC REPLACING ==:IFPFUTAC:== BY ==PAPER-FEE==.             
       FD  PAPERFEE-OUT                                                         
           RECORDING MODE IS F                                                  
           LABEL RECORDS ARE STANDARD                                           
           BLOCK CONTAINS 0 RECORDS.                                            
           COPY IFPFUTAC REPLACING ==:IFPFUTAC:== BY ==PAPER-OUT==.             
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
           03  PAPER-FEE-RECS-READ       PIC  9(07) COMP-3 VALUE 0.             
           03  PAPER-IND-UPDATED         PIC  9(07) COMP-3 VALUE 0.             
           03  PAPER-FEE-ACAT-REJECTED   PIC  9(07) COMP-3 VALUE 0.             
           03  PAPER-FEE-ACAT-NOTFND     PIC  9(07) COMP-3 VALUE 0.             
       01  W-PAPERFEE-FIELDS.                                                   
           05  PAPERFEE-STAT             PIC X(002).                            
               88 VALID-PAPERFEE-STAT    VALUE '00' '04' '10' '23'.             
               88 PAPERFEE-OKAY          VALUE '00' THRU '09', '97'.            
               88 PAPERFEE-END-OF-FILE   VALUE '10'.                            
               88 PAPERFEE-NOT-FOUND     VALUE '23'.                            
               88 PAPERFEE-EMPTY-MISSING VALUE '35'.                            
           05  W-PAPERFEE-CNT            PIC  9(009) COMP-3 VALUE 0.            
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
           05  W-COMMIT-CTR              PIC  9(009) COMP-3                     
                                              VALUE 0.                          
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(011) VALUE 0.                   
           05  W-DB2-TABLE-NAME          PIC  X(008).                           
           05  W-DB2-ACTION              PIC  X(008).                           
           05  W-DB2-SQLCODE             PIC ---9.                              
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
           DISPLAY 'CAT620 - UPDATE ACAT FLAG ON VTRNFR'                        
           DISPLAY ' '.                                                         
           COPY MSGCOBO.                                                        
           DISPLAY ' '.                                                         
           OPEN INPUT PAPERFEE.                                                 
           DISPLAY 'CAT620: PAPERFEE   OPENED FOR INPUT.  STATUS = '            
                                              PAPERFEE-STAT                     
           IF  PAPERFEE-OKAY                                                    
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT620: ERROR OPENING PAPERFEE'                         
               DISPLAY 'CAT620: ERROR OPENING PAPERFEE'                         
               DISPLAY 'CAT620: OPEN STATUS = ' PAPERFEE-STAT                   
               DISPLAY 'CAT620: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +0111    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
           OPEN OUTPUT PAPERFEE-OUT.                                            
           PERFORM 1000-READ-PAPERFEE THRU 1000-EXIT                            
              UNTIL PAPERFEE-END-OF-FILE.                                       
           CLOSE PAPERFEE.                                                      
           CLOSE PAPERFEE-OUT.                                                  
           DISPLAY ' '.                                                         
           DISPLAY 'PAPER FEE RECS READ     ' PAPER-FEE-RECS-READ               
           DISPLAY 'PAPER FEE IND UPDATED   ' PAPER-IND-UPDATED                 
           DISPLAY 'ACAT STATUS UNFAVORABLE ' PAPER-FEE-ACAT-REJECTED           
           DISPLAY 'ACAT NOT FOUND          ' PAPER-FEE-ACAT-NOTFND             
           DISPLAY 'CAT620 ENDED SUCCESSFULLY.'.                                
           GOBACK.                                                              
                                                                                
      *******************                                                       
       1000-READ-PAPERFEE.                                                      
      *******************                                                       
           READ PAPERFEE.                                                       
           IF PAPERFEE-END-OF-FILE                                              
              GO TO 1000-EXIT.                                                  
                                                                                
           ADD 1 TO PAPER-FEE-RECS-READ.                                        
           IF  PAPERFEE-OKAY                                                    
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT620: ERROR READING PAPERFEE'                         
               DISPLAY 'CAT620: READ STATUS = ' PAPERFEE-STAT                   
               DISPLAY 'CAT620: U1002 - ABENDING ON BAD FILE STATUS'            
               MOVE +1002    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
           IF PAPER-FEE-HEADER                                                  
           OR PAPER-FEE-TRAILER                                                 
              CONTINUE                                                          
           ELSE                                                                 
           IF PAPER-FEE-ACAT-CNTL-NBR  > SPACES                                 
           AND PAPER-FEE-ACAT-IND = SPACES                                      
              PERFORM 2000-LOOKUP-ACAT-STATUS                                   
           END-IF.                                                              
           WRITE PAPER-OUT-RECORD FROM PAPER-FEE-RECORD.                        
       1000-EXIT. EXIT.                                                         
      *******************                                                       
       2000-LOOKUP-ACAT-STATUS.                                                 
      *******************                                                       
           MOVE PAPER-FEE-CLIENT-NBR    TO CLIENT-NBR.                          
           MOVE PAPER-FEE-ACAT-CNTL-NBR TO ACAT-CONTROL-NBR.                    
           EXEC SQL                                                             
             SELECT                                                             
                   STTS_CD                                                      
             INTO                                                               
                  :DCLVTRNFR.STTS-CD                                            
             FROM VTRNFR                                                        
             WHERE                                                              
               CLIENT_NBR = :CLIENT-NBR                                         
               AND ACAT_CONTROL_NBR = :ACAT-CONTROL-NBR                         
           END-EXEC.                                                            
                                                                                
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
           IF  SQLCODE  =  +0                                                   
              IF STTS-CD  >= '200' AND STTS-CD < '600'                          
              AND STTS-CD NOT = '400'                                           
                 MOVE 'Y' TO PAPER-FEE-ACAT-IND                                 
                 ADD 1 TO PAPER-IND-UPDATED                                     
                 DISPLAY PAPER-FEE-ACAT-CNTL-NBR ' ' STTS-CD                    
                         ' PAPER FEE IND SET ON'                                
              ELSE                                                              
                 DISPLAY PAPER-FEE-ACAT-CNTL-NBR ' ' STTS-CD                    
                         ' TRANSFER STTS BAD'                                   
                 MOVE SPACES TO PAPER-FEE-ACAT-CNTL-NBR                         
                 ADD 1 TO PAPER-FEE-ACAT-REJECTED                               
              END-IF                                                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              DISPLAY PAPER-FEE-ACAT-CNTL-NBR                                   
                         ' TRANSFER NOTFND'                                     
              MOVE SPACES TO PAPER-FEE-ACAT-CNTL-NBR                            
              ADD 1 TO PAPER-FEE-ACAT-NOTFND                                    
           ELSE                                                                 
              DISPLAY 'CAT820: ERROR SELECTING A ROW FROM VTRNFR'               
              DISPLAY 'CAT620: U2003 - ABENDING ON BAD DB2 STATUS'              
              MOVE SQLCODE                  TO W-DB2-SQLCODE                    
              DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                                
              DISPLAY 'CAT620: INPUT  REC ='                                    
                     '(' PAPER-FEE-RECORD ')'                                   
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
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
                                                                                
           EXEC SQL ROLLBACK END-EXEC.                                          
           MOVE +3999    TO ABEND-CODE.                                         
           CALL ABEND USING ABEND-CODE.                                         
