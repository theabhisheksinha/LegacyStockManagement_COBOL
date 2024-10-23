000001* PDX    - CAT505   C0267765 09/08/08 08:49:32 TBDOJUN            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT505.                                                     
      *****************************************************************         
      * CAT505 - READ SIAC.CONFIRM.CADP*.S36667 ACAT CONFIRM FILE     *         
      *          TO SEE IF TRANSACTION FROM CAT500                    *         
      *          SENT TO SIAC WERE PROCESSED ON TIME                  *         
      *                                                               *         
      * THERE IS NO "J" STREAM.  THEY SEND THEIR OWN FILES TO SIAC.   *         
      *                                                               *         
      * IF CYCLE 1, TRANSFERS SHOULD BE PROCESS BEFORE  8 AM.         *         
      * IF CYCLE 2, TRANSFERS SHOULD BE PROCESS BEFORE 10 AM.         *         
      * IF CYCLE 3, TRANSFERS SHOULD BE PROCESS BEFORE 12 PM.         *         
      * IF CYCLE 4, TRANSFERS SHOULD BE PROCESS BEFORE  2 PM.         *         
      * IF CYCLE 5, TRANSFERS SHOULD BE PROCESS BEFORE  4 PM.         *         
      *                                                               *         
      * SET RETURN CODE IF THERE IS AN EXCEPTION.                     *         
      * ALLOW RETURN CODE 00 TO 10 TO SEND DIFFERENT MESSAGES.        *         
      *                                                               *         
      * INPUT  - SIAC.CONFIRM.CADP*.S36667 CONFIRM FILE               *         
      * QA     - SIAC.CONFIRM.CADPQ.S46667 CONFIRM FILE               *         
      *          DSORG  RECFM  LRECL  BLKSZ                           *         
      *          --------------------------                           *         
      *           PS    FBA      133  27930                           *         
      *                                                               *         
      * OUTPUT - SET RETURN CODE FOR NEXT JOB STEP TO                 *         
      *          SEND WTO MESSAGE.                                    *         
      *                                                               *         
      * EXAMPLE:                                                      *         
      * BISG.JCLLIB(CAT5050A)                                         *         
      * //WTOONLY EXEC ADRDSSU,PARM='TYPRUN=NORUN',COND=(8,NE,CAT505) *         
      * //SYSPRINT DD SYSOUT=*                                        *         
      * //SYSUDUMP DD SYSOUT=Y                                        *         
      * //SYSIN DD *                                                  *         
      *  WTO 'ACAT BAAA.CAT500.NSCCIN FILE WAS RECEIVED LATE AT SIAC' *         
      *                                                               *         
      *****************************************************************         
      * 07/17/08 DJ     NEW PROGRAM                                   *         
      *****************************************************************         
      /                                                                         
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT INFILE           ASSIGN       TO INFILE                       
                                   FILE STATUS  IS INFILE-STAT.                 
      /                                                                         
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
       FD  INFILE                                                               
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
                                                                                
       01  INFILE-RECORD              PIC X(133).                               
                                                                                
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
           DISPLAY 'CAT505 - PROCESS ACAT CONFIRM FILE'                         
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
                                                                                
           DISPLAY 'CAT505: L-STREAM = ' L-STREAM                               
           ACCEPT W-SYS-DATE FROM DATE.                                         
           ACCEPT W-SYS-TIME FROM TIME.                                         
           DISPLAY 'CAT505: SYS-DATE = ' W-SYS-DATE                             
                          ' SYS-TIME = ' W-SYS-TIME.                            
           MOVE W-SYS-DATE(1:2)        TO WS-SYS-DATE-YY.                       
           MOVE W-SYS-DATE(3:2)        TO WS-SYS-DATE-MM.                       
           MOVE W-SYS-DATE(5:2)        TO WS-SYS-DATE-DD.                       
           DISPLAY 'CAT505: WS-SYS-DATE = ' WS-SYS-DATE                         
                                                                                
           MOVE 'CAT505'                  TO BPDATES-CALLING-PGM.               
           SET  LNKDATZ-REQUEST           TO TRUE.                              
           CALL BPDATES USING BPDATES-PARAMETERS.                               
           DISPLAY 'CAT505: BPD-PROC-DATE = ' BPD-PROC-DATE                     
                                                                                
           OPEN INPUT INFILE.                                                   
           DISPLAY 'CAT505: INFILE OPENED. STATUS = ' INFILE-STAT.              
           IF  INFILE-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT505: ERROR OPENING INFILE'                           
               DISPLAY 'CAT505: OPEN STATUS = ' INFILE-STAT                     
               DISPLAY 'CAT505: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001    TO ABEND-CODE                                      
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
                   DISPLAY 'CAT505: END OF INPUT REACHED'                       
                           ' W-INPUT-CNT = ' W-INPUT-CNT                        
                   GO TO 3000-EXIT                                              
           END-READ.                                                            
                                                                                
           IF  INFILE-OKAY                                                      
               ADD 1 TO W-INPUT-CNT                                             
           ELSE                                                                 
               DISPLAY 'CAT505: ERROR READING INFILE'                           
               DISPLAY 'CAT505: READ STATUS = ' INFILE-STAT                     
               DISPLAY 'CAT505: U3007 - ABENDING ON BAD FILE STATUS'            
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
           END-IF                                                               
                                                                                
           EVALUATE W-CONF-7-CYCLE-NO                                           
               WHEN '1' IF W-CONF-2-RUN-TIME(1:2) > '08'                        
                        DISPLAY 'CYCLE 1 FILE MISSED CUT-OFF AT SIAC'           
                           MOVE 1 TO RETURN-CODE                                
                        DISPLAY 'RUN-TIME ' W-CONF-2-RUN-TIME                   
                        DISPLAY 'RUN-TIME ' W-CONF-2-RUN-TIME                   
                        ' > 08:00:00 FOR CYCLE 1. NOT OKAY. <========='         
                        ELSE                                                    
                        IF W-CONF-2-RUN-TIME(1:2) < '07'                        
                        DISPLAY 'CYCLE 1 CONFIRM FILE MISSING'                  
                           MOVE 6 TO RETURN-CODE                                
                        DISPLAY 'RUN-TIME ' W-CONF-2-RUN-TIME                   
                        ' < 07:00:00 FOR CYCLE 1. NOT OKAY. <========='         
                        ELSE                                                    
                        DISPLAY 'RUN-TIME ' W-CONF-2-RUN-TIME                   
                                   ' < 08:00:00 FOR CYCLE 1. OKAY'              
                        END-IF                                                  
                        END-IF                                                  
               WHEN '2' IF W-CONF-2-RUN-TIME(1:2) > '10'                        
                        DISPLAY 'CYCLE 2 FILE MISSED CUT-OFF AT SIAC'           
                           MOVE 2 TO RETURN-CODE                                
                        DISPLAY 'RUN-TIME ' W-CONF-2-RUN-TIME                   
                        ' > 10:00:00 FOR CYCLE 2. NOT OKAY. <========='         
                        ELSE                                                    
                        IF W-CONF-2-RUN-TIME(1:2) < '09'                        
                        DISPLAY 'CYCLE 2 CONFIRM FILE MISSING'                  
                           MOVE 7 TO RETURN-CODE                                
                        DISPLAY 'RUN-TIME ' W-CONF-2-RUN-TIME                   
                        ' < 09:00:00 FOR CYCLE 2. NOT OKAY. <========='         
                        ELSE                                                    
                        DISPLAY 'RUN-TIME ' W-CONF-2-RUN-TIME                   
                                   ' < 10:00:00 FOR CYCLE 2. OKAY'              
                        END-IF                                                  
                        END-IF                                                  
               WHEN '3' IF W-CONF-2-RUN-TIME(1:2) > '12'                        
                        DISPLAY 'CYCLE 3 FILE MISSED CUT-OFF AT SIAC'           
                           MOVE 3 TO RETURN-CODE                                
                        DISPLAY 'RUN-TIME ' W-CONF-2-RUN-TIME                   
                        ' > 12:00:00 FOR CYCLE 3. NOT OKAY. <========='         
                        ELSE                                                    
                        IF W-CONF-2-RUN-TIME(1:2) < '11'                        
                        DISPLAY 'CYCLE 3 CONFIRM FILE MISSING'                  
                           MOVE 8 TO RETURN-CODE                                
                        DISPLAY 'RUN-TIME ' W-CONF-2-RUN-TIME                   
                        ' < 11:00:00 FOR CYCLE 3. NOT OKAY. <========='         
                        ELSE                                                    
                        DISPLAY 'RUN-TIME ' W-CONF-2-RUN-TIME                   
                                   ' < 12:00:00 FOR CYCLE 3. OKAY'              
                        END-IF                                                  
                        END-IF                                                  
               WHEN '4' IF W-CONF-2-RUN-TIME(1:2) > '14'                        
                        DISPLAY 'CYCLE 4 FILE MISSED CUT-OFF AT SIAC'           
                           MOVE 4 TO RETURN-CODE                                
                        DISPLAY 'RUN-TIME ' W-CONF-2-RUN-TIME                   
                        ' > 14:00:00 FOR CYCLE 4. NOT OKAY. <========='         
                        ELSE                                                    
                        IF W-CONF-2-RUN-TIME(1:2) < '13'                        
                        DISPLAY 'CYCLE 4 CONFIRM FILE MISSING'                  
                           MOVE 9 TO RETURN-CODE                                
                        DISPLAY 'RUN-TIME ' W-CONF-2-RUN-TIME                   
                        ' < 13:00:00 FOR CYCLE 4. NOT OKAY. <========='         
                        ELSE                                                    
                        DISPLAY 'RUN-TIME ' W-CONF-2-RUN-TIME                   
                                   ' < 14:00:00 FOR CYCLE 4. OKAY'              
                        END-IF                                                  
                        END-IF                                                  
               WHEN '5' IF W-CONF-2-RUN-TIME(1:2) > '16'                        
                        DISPLAY 'CYCLE 5 FILE MISSED CUT-OFF AT SIAC'           
                           MOVE 5 TO RETURN-CODE                                
                        DISPLAY 'RUN-TIME ' W-CONF-2-RUN-TIME                   
                        ' > 16:00:00 FOR CYCLE 5. NOT OKAY. <========='         
                        ELSE                                                    
                        IF W-CONF-2-RUN-TIME(1:2) < '15'                        
                        DISPLAY 'CYCLE 5 CONFIRM FILE MISSING'                  
                           MOVE 10 TO RETURN-CODE                               
                        DISPLAY 'RUN-TIME ' W-CONF-2-RUN-TIME                   
                        ' < 15:00:00 FOR CYCLE 5. NOT OKAY. <========='         
                        ELSE                                                    
                        DISPLAY 'RUN-TIME ' W-CONF-2-RUN-TIME                   
                                   ' < 16:00:00 FOR CYCLE 5. OKAY'              
                        END-IF                                                  
                        END-IF                                                  
               WHEN OTHER                                                       
                        DISPLAY '???? CYCLE   =' W-CONF-7-CYCLE-NO              
                        ' <========='                                           
                        DISPLAY '???? RUN-TIME=' W-CONF-2-RUN-TIME              
                        ' <========='                                           
           END-EVALUATE.                                                        
                                                                                
       4000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       9000-CLOSE-ROUTINE SECTION.                                              
                                                                                
           DISPLAY ' '.                                                         
           CLOSE INFILE                                                         
           DISPLAY 'CAT505: INFILE CLOSED. STATUS = ' INFILE-STAT.              
           DISPLAY ' '.                                                         
           DISPLAY 'CAT505: RETURN CODE = ' RETURN-CODE                         
           DISPLAY 'CAT505: PROGRAM ENDED SUCCESSFULLY'.                        
                                                                                
       9000-EXIT.                                                               
           EXIT.                                                                
      *################################################################         
