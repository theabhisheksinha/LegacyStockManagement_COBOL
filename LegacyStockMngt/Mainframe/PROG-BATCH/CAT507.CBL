000001* PDX    - CAT507   C0352701 03/17/14 10:31:18 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT507.                                                     
      *****************************************************************         
      * CAT507 - READ SIAC.CONFIRM.CADP*.S36708 CBRS CONFIRM FILE     *         
      *          TO SEE IF CAT784DB.NSCCFL  WAS                       *         
      *          SENT TO SIAC WERE PROCESSED ON TIME                  *         
      *                                                               *         
      * THERE ARE NO CYCLES, THIS IS ONCE PER DAY AND BEFORE 4PM.     *         
      *                                                               *         
      * SET RETURN CODE IF THERE IS AN EXCEPTION.                     *         
      * ALLOW RETURN CODE 00 TO 10 TO SEND DIFFERENT MESSAGES.        *         
      *                                                               *         
      * INPUT  - SIAC.CONFIRM.CADP*.S36708 CONFIRM FILE               *         
      * QA     - SIAC.CONFIRM.CADPQ.S46708 CONFIRM FILE               *         
      *          DSORG  RECFM  LRECL  BLKSZ                           *         
      *          --------------------------                           *         
      *           PS    FBA      133  27930                           *         
      *                                                               *         
      * OUTPUT - SET RETURN CODE FOR NEXT JOB STEP TO                 *         
      *          SEND WTO MESSAGE.                                    *         
      *                                                               *         
      *****************************************************************         
      * 03/12/14 LRM    NEW PROGRAM  - COPY CAT505 AND CHANGE.        *         
      *****************************************************************         
      /                                                                         
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT INFILE           ASSIGN       TO INFILE                       
                                   FILE STATUS  IS INFILE-STAT.                 
           SELECT OUTFILE          ASSIGN       TO OUTFILE                      
                                   FILE STATUS  IS OUTFILE-STAT.                
      /                                                                         
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
       FD  INFILE                                                               
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
                                                                                
       01  INFILE-RECORD              PIC X(133).                               
                                                                                
       FD  OUTFILE                                                              
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
                                                                                
       01  OUTFILE-RECORD              PIC X(80).                               
                                                                                
      /                                                                         
       WORKING-STORAGE SECTION.                                                 
       COPY PDXIDCOB.                                                           
                                                                                
       01  W-FIELDS.                                                            
           05  END-OF-INFILE-SW          PIC  X(001) VALUE '0'.                 
               88 END-OF-INFILE                      VALUE '1'.                 
           05  INFILE-STAT               PIC  X(002).                           
               88 INFILE-OKAY            VALUE '00' THRU '09', '97'.            
               88 INFILE-END-OF-FILE     VALUE '10'.                            
               88 INFILE-EMPTY-MISSING VALUE '35'.                              
           05  OUTFILE-STAT              PIC  X(002).                           
               88 OUTFILE-OKAY           VALUE '00'.                            
           05  WS-ACCEPTED-SW            PIC  X(001)  VALUE 'N'.                
               88 WS-ACCEPTED            VALUE 'Y'.                             
           05  W-SYS-DATE                PIC  9(006) VALUE 0.                   
           05  W-SYS-TIME                PIC  9(008) VALUE 0.                   
           05  WS-SYS-DATE.                                                     
               10 WS-SYS-DATE-MM         PIC  X(002).                           
               10 FILLER                 PIC  X(001) VALUE '/'.                 
               10 WS-SYS-DATE-DD         PIC  X(002).                           
               10 FILLER                 PIC  X(001) VALUE '/'.                 
               10 WS-SYS-DATE-YY         PIC  X(002).                           
           05  W-INPUT-CNT               PIC  9(007) VALUE 0.                   
                                                                                
       01  FILLER                        PIC X(008) VALUE 'W-CONF  '.           
       01  W-CONF-1                      PIC  X(133).                           
       01  FILLER REDEFINES W-CONF-1.                                           
           05  W-CONF-1-CC               PIC  X(001).                           
           05  W-CONF-1-PGM              PIC  X(008).                           
           05  W-CONF-1-FILLER1          PIC  X(002).                           
           05  W-CONF-1-RUN-DATE-LIT     PIC  X(009).                           
           05  W-CONF-1-RUN-DATE         PIC  X(008).                           
       01  W-CONF-2                      PIC  X(133).                           
       01  FILLER REDEFINES W-CONF-2.                                           
           05  W-CONF-2-CC               PIC  X(001).                           
           05  W-CONF-2-FILLER1          PIC  X(010).                           
           05  W-CONF-2-RUN-TIME-LIT     PIC  X(009).                           
           05  W-CONF-2-RUN-TIME         PIC  X(008).                           
       01  W-CONF-3                      PIC  X(133).                           
       01  W-CONF-4                      PIC  X(133).                           
       01  W-CONF-5                      PIC  X(133).                           
       01  FILLER REDEFINES W-CONF-5.                                           
           05  W-CONF-5-CC               PIC  X(001).                           
           05  W-CONF-5-FILLER1          PIC  X(004).                           
           05  W-CONF-5-DETAIL-LIT       PIC  X(024).                           
           05  W-CONF-5-DETAIL-CNT       PIC  X(010).                           
       01  W-CONF-6                      PIC  X(133).                           
       01  FILLER REDEFINES W-CONF-6.                                           
           05  W-CONF-6-CC               PIC  X(001).                           
           05  W-CONF-6-FILLER1          PIC  X(004).                           
           05  W-CONF-6-HEADER-LIT       PIC  X(024).                           
           05  W-CONF-6-HEADER-CNT       PIC  X(010).                           
       01  W-CONF-7                      PIC  X(133).                           
       01  FILLER REDEFINES W-CONF-7.                                           
           05  W-CONF-7-CC               PIC  X(001).                           
           05  W-CONF-7-FILLER1          PIC  X(004).                           
           05  W-CONF-7-HEADER           PIC  X(065).                           
           05  FILLER REDEFINES W-CONF-7-HEADER.                                
               07  FILLER                PIC  X(019).                           
               07  W-CONF-7-STREAM-IND   PIC  X(001).                           
               07  FILLER                PIC  X(042).                           
               07  W-CONF-7-CYCLE-NO     PIC  X(001).                           
               07  FILLER                PIC  X(002).                           
       01  W-CONF-8                      PIC  X(133).                           
       01  FILLER REDEFINES W-CONF-8.                                           
           05  W-CONF-8-CC               PIC  X(001).                           
           05  W-CONF-8-FILLER1          PIC  X(004).                           
           05  W-CONF-8-MESSAGE          PIC  X(010).                           
       01  W-CONF-9                      PIC  X(133).                           
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.           
                                                                                
           COPY BPDATESC.                                                       
      /                                                                         
DJ0002***===> COBOL LE                                                          
DJ0002 01  W-ABEND-AREA.                                                        
DJ0002     05  ABEND-CODE                PIC S9(04) COMP SYNC.                  
DJ0002 01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.           
DJ0002     COPY STUBCPY.                                                        
DJ0002***<=== COBOL LE                                                          
                                                                                
       01  FILLER                        PIC X(008) VALUE 'END-O-WS'.           
      /                                                                         
      *****************************************************************         
      *    LINKAGE SECTION                                            *         
      *****************************************************************         
       LINKAGE SECTION.                                                         
       01  L-JCL-PARMS.                                                         
           05  PARMLENGTH                PIC S9(004) COMP SYNC.                 
           05  L-STREAM                  PIC  X(001).                           
                                                                                
       PROCEDURE DIVISION USING L-JCL-PARMS.                                    
      *                         ===========                                     
       0000-MAIN SECTION.                                                       
           DISPLAY 'CAT507 - PROCESS CBRS CONFIRM FILE'                         
           DISPLAY '         INPUT=SIAC.CONFIRM.CADP*.S36667'                   
           DISPLAY '         SEND WTO MESSAGE IF CAT500 OUTPUT'                 
                           ' WERE NOT PROCESSED ON TIME'                        
           DISPLAY ' '.                                                         
           COPY MSGCOBO.                                                        
           DISPLAY ' '.                                                         
                                                                                
           PERFORM 1000-INIT           THRU 1000-EXIT.                          
           PERFORM 2000-PROCESS        THRU 2000-EXIT.                          
           PERFORM 4000-EDIT           THRU 4000-EXIT.                          
           PERFORM 9000-CLOSE-ROUTINE  THRU 9000-EXIT.                          
                                                                                
           GOBACK.                                                              
      /                                                                         
       1000-INIT SECTION.                                                       
                                                                                
           DISPLAY 'CAT507: L-STREAM = ' L-STREAM                               
           ACCEPT W-SYS-DATE FROM DATE.                                         
           ACCEPT W-SYS-TIME FROM TIME.                                         
           DISPLAY 'CAT507: SYS-DATE = ' W-SYS-DATE                             
                          ' SYS-TIME = ' W-SYS-TIME.                            
           MOVE W-SYS-DATE(1:2)        TO WS-SYS-DATE-YY.                       
           MOVE W-SYS-DATE(3:2)        TO WS-SYS-DATE-MM.                       
           MOVE W-SYS-DATE(5:2)        TO WS-SYS-DATE-DD.                       
           DISPLAY 'CAT507: WS-SYS-DATE = ' WS-SYS-DATE                         
                                                                                
           MOVE 'CAT507'                  TO BPDATES-CALLING-PGM.               
           SET  LNKDATZ-REQUEST           TO TRUE.                              
           CALL BPDATES USING BPDATES-PARAMETERS.                               
           DISPLAY 'CAT507: BPD-PROC-DATE = ' BPD-PROC-DATE                     
                                                                                
           OPEN INPUT INFILE.                                                   
           DISPLAY 'CAT507: INFILE OPENED. STATUS = ' INFILE-STAT.              
           IF  INFILE-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT507: ERROR OPENING INFILE'                           
               DISPLAY 'CAT507: OPEN STATUS = ' INFILE-STAT                     
               DISPLAY 'CAT507: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           OPEN OUTPUT OUTFILE.                                                 
           DISPLAY 'CAT507: OUTFILE OPENED. STATUS = ' OUTFILE-STAT.            
           IF  OUTFILE-OKAY                                                     
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT507: ERROR OPENING OUTFILE'                          
               DISPLAY 'CAT507: OPEN STATUS = ' OUTFILE-STAT                    
               DISPLAY 'CAT507: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3002    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           DISPLAY ' '.                                                         
                                                                                
       1000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       2000-PROCESS.                                                            
                                                                                
           PERFORM 3000-READ-INPUT THRU 3000-EXIT                               
                                                                                
           IF  END-OF-INFILE                                                    
               GO TO 2000-EXIT                                                  
           END-IF.                                                              
                                                                                
           EVALUATE W-INPUT-CNT                                                 
               WHEN 1   MOVE INFILE-RECORD TO W-CONF-1                          
                        DISPLAY 'INPUT FILE : '                                 
                        DISPLAY                                                 
                        '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'             
                        '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'             
                        DISPLAY W-CONF-1(2:120)                                 
               WHEN 2   MOVE INFILE-RECORD TO W-CONF-2                          
                        DISPLAY W-CONF-2(2:130)                                 
               WHEN 3   MOVE INFILE-RECORD TO W-CONF-3                          
                        DISPLAY W-CONF-3(2:80)                                  
               WHEN 4   MOVE INFILE-RECORD TO W-CONF-4                          
                        DISPLAY W-CONF-4(2:80)                                  
               WHEN 5   MOVE INFILE-RECORD TO W-CONF-5                          
                        DISPLAY W-CONF-5(2:80)                                  
               WHEN 6   MOVE INFILE-RECORD TO W-CONF-6                          
                        DISPLAY W-CONF-6(2:80)                                  
               WHEN 7   MOVE INFILE-RECORD TO W-CONF-7                          
                        DISPLAY W-CONF-7(2:80)                                  
               WHEN 8   MOVE INFILE-RECORD TO W-CONF-8                          
                        DISPLAY W-CONF-8(2:80)                                  
                        IF W-CONF-8-MESSAGE = 'ACCEPTED'                        
                           SET WS-ACCEPTED TO TRUE                              
                        END-IF                                                  
               WHEN 9   MOVE INFILE-RECORD TO W-CONF-9                          
                        DISPLAY W-CONF-9(2:80)                                  
                        DISPLAY                                                 
                        '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'             
                        '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'             
                        DISPLAY ' '                                             
           END-EVALUATE.                                                        
                                                                                
           GO TO 2000-PROCESS.                                                  
                                                                                
       2000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       3000-READ-INPUT.                                                         
                                                                                
           IF  END-OF-INFILE                                                    
               GO 3000-EXIT                                                     
           END-IF.                                                              
                                                                                
           READ INFILE                                                          
                AT END                                                          
                   MOVE '1'              TO END-OF-INFILE-SW                    
                   DISPLAY 'CAT507: END OF INPUT REACHED'                       
                           ' W-INPUT-CNT = ' W-INPUT-CNT                        
                   GO TO 3000-EXIT                                              
           END-READ.                                                            
                                                                                
           IF  INFILE-OKAY                                                      
               ADD 1 TO W-INPUT-CNT                                             
           ELSE                                                                 
               DISPLAY 'CAT507: ERROR READING INFILE'                           
               DISPLAY 'CAT507: READ STATUS = ' INFILE-STAT                     
               DISPLAY 'CAT507: U3007 - ABENDING ON BAD FILE STATUS'            
               MOVE +3007 TO ABEND-CODE                                         
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
       3000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       4000-EDIT          SECTION.                                              
                                                                                
           DISPLAY ' '                                                          
           DISPLAY 'THE STREAM INDICATOR ON THE FILE = '                        
                                                     W-CONF-7-STREAM-IND        
           DISPLAY 'THE CYCLE NUMBER ON THE FILE     = '                        
                                                     W-CONF-7-CYCLE-NO          
           DISPLAY 'THE RUN-DATE ON THE FILE         = '                        
                                                     W-CONF-1-RUN-DATE          
           DISPLAY 'THE RUN-TIME ON THE FILE         = '                        
                                                     W-CONF-2-RUN-TIME          
           IF  W-CONF-7-STREAM-IND = L-STREAM                                   
               DISPLAY 'THE STREAM INDICATOR ON THE FILE "'                     
                        W-CONF-7-STREAM-IND '" = THE JOB STREAM "'              
                               L-STREAM '"'                                     
           ELSE                                                                 
               DISPLAY 'THE STREAM INDICATOR ON THE FILE "'                     
                        W-CONF-7-STREAM-IND '" NOT = THE JOB STREAM "'          
                               L-STREAM '" <========='                          
           END-IF                                                               
           IF  W-CONF-1-RUN-DATE = WS-SYS-DATE                                  
               DISPLAY 'RUN-DATE ' W-CONF-1-RUN-DATE                            
                 ' = WS-SYS-DATE ' WS-SYS-DATE '. OKAY'                         
           ELSE                                                                 
               DISPLAY 'RUN-DATE ' W-CONF-1-RUN-DATE                            
             ' NOT = WS-SYS-DATE ' WS-SYS-DATE '. NOT OKAY. <========='         
             PERFORM 4100-WRITE-CONFIRM-MISSING-RTN                             
             MOVE 4 TO RETURN-CODE                                              
             GO TO 4000-EXIT                                                    
           END-IF                                                               
                                                                                
           IF W-CONF-2-RUN-TIME(1:2) >= '16'                                    
               DISPLAY 'DAILY  CBRS FILE MISSED CUT-OFF AT SIAC'                
               DISPLAY 'RUN-TIME ' W-CONF-2-RUN-TIME                            
                 ' > 16:00:00 FOR CYCLE 5. NOT OKAY. <========='                
               PERFORM 4200-WRITE-MISSED-CUTOFF-RTN                             
               MOVE 4 TO RETURN-CODE                                            
             GO TO 4000-EXIT                                                    
           ELSE                                                                 
               DISPLAY 'RUN-TIME ' W-CONF-2-RUN-TIME                            
                 ' < 16:00:00 FOR CBRS. OKAY'                                   
           END-IF.                                                              
                                                                                
           IF NOT WS-ACCEPTED                                                   
               DISPLAY 'DAILY CBRS FILE WAS NOT ACCEPTED '                      
               DISPLAY 'RUN-DATE ' W-CONF-1-RUN-DATE                            
               DISPLAY 'RUN-TIME ' W-CONF-2-RUN-TIME                            
               PERFORM 4300-WRITE-NOT-ACCEPTED-RTN                              
               MOVE 4 TO RETURN-CODE                                            
             GO TO 4000-EXIT                                                    
           END-IF.                                                              
                                                                                
       4000-EXIT.                                                               
           EXIT.                                                                
                                                                                
       4100-WRITE-CONFIRM-MISSING-RTN.                                          
           MOVE 'BROADRIDGE CBRS FEED WAS NOT PROCESSED FOR STREAM '            
              TO OUTFILE-RECORD                                                 
           MOVE L-STREAM TO OUTFILE-RECORD(51 : 1)                              
           WRITE OUTFILE-RECORD.                                                
           MOVE 'THE CBRS CONFIRM FILE SHOWS THE WRONG DATE '                   
              TO OUTFILE-RECORD                                                 
           MOVE W-CONF-1-RUN-DATE TO OUTFILE-RECORD(44 : 8)                     
           WRITE OUTFILE-RECORD.                                                
           MOVE 'RE: SIAC.CONFIRM.CADP*.S36708 ' TO OUTFILE-RECORD              
           WRITE OUTFILE-RECORD.                                                
           MOVE 'APPLICATION FEED B***.CAT784DB.NSCCFL'                         
                                                 TO OUTFILE-RECORD              
           WRITE OUTFILE-RECORD.                                                
                                                                                
       4200-WRITE-MISSED-CUTOFF-RTN.                                            
           MOVE 'BROADRIDGE CBRS FEED MISSED 4PM CUTOFF FOR STREAM '            
              TO OUTFILE-RECORD                                                 
           MOVE L-STREAM TO OUTFILE-RECORD(51 : 1)                              
           WRITE OUTFILE-RECORD.                                                
           MOVE 'THE CBRS CONFIRM FILE SHOWS PROCESS TIME '                     
              TO OUTFILE-RECORD                                                 
           MOVE W-CONF-2-RUN-TIME TO OUTFILE-RECORD(42 : 9)                     
           WRITE OUTFILE-RECORD.                                                
           MOVE 'RE: SIAC.CONFIRM.CADP*.S36708 ' TO OUTFILE-RECORD              
           WRITE OUTFILE-RECORD.                                                
           MOVE 'APPLICATION FEED B***.CAT784DB.NSCCFL'                         
                                                 TO OUTFILE-RECORD              
           WRITE OUTFILE-RECORD.                                                
                                                                                
       4300-WRITE-NOT-ACCEPTED-RTN.                                             
           MOVE 'BROADRIDGE CBRS FEED NOT ACCEPTED BY DTCC FOR STREAM '         
              TO OUTFILE-RECORD                                                 
           MOVE L-STREAM TO OUTFILE-RECORD(54 : 1)                              
           WRITE OUTFILE-RECORD.                                                
           MOVE 'THE CBRS CONFIRM FILE SHOWS '                                  
              TO OUTFILE-RECORD                                                 
           MOVE W-CONF-8-MESSAGE TO OUTFILE-RECORD(29 : 10)                     
           WRITE OUTFILE-RECORD.                                                
           MOVE 'RE: SIAC.CONFIRM.CADP*.S36708 ' TO OUTFILE-RECORD              
           WRITE OUTFILE-RECORD.                                                
           MOVE 'APPLICATION FEED B***.CAT784DB.NSCCFL'                         
                                                 TO OUTFILE-RECORD              
           WRITE OUTFILE-RECORD.                                                
                                                                                
      /                                                                         
       9000-CLOSE-ROUTINE SECTION.                                              
                                                                                
           DISPLAY ' '.                                                         
           CLOSE INFILE                                                         
           CLOSE OUTFILE                                                        
           DISPLAY 'CAT507: INFILE CLOSED. STATUS = ' INFILE-STAT.              
           DISPLAY ' '.                                                         
           DISPLAY 'CAT507: RETURN CODE = ' RETURN-CODE                         
           DISPLAY 'CAT507: PROGRAM ENDED SUCCESSFULLY'.                        
                                                                                
       9000-EXIT.                                                               
           EXIT.                                                                
      *################################################################         
