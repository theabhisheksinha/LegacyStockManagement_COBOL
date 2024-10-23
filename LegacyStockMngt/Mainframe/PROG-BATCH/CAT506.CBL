000001* PDX    - CAT506   C0271319 10/06/08 09:43:15 TBDOJUN            00001000
000001* DJ0001 SSR#60943 FIX S0C7. BYPASS COMMAS                        00001000
000001* PDX    - CAT506   C0267765 09/08/08 08:49:58 TBDOJUN            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT506.                                                     
      *****************************************************************         
      * CAT506 - COMPARE NUMBER OF TRANSACTIONS CONFIRMED BY SIAC     *         
      *          VERSUS NUMBER OF TRANSACTIONS SUBMITTED THAT WERE    *         
      *          RETURN BY SIAC.                                      *         
      *                                                               *         
      * THERE IS NO "J" STREAM.  THEY SEND THEIR OWN FILES TO SIAC.   *         
      * ALLOW RETURN CODE 00 TO 05 TO SEND DIFFERENT MESSAGES.        *         
      *                                                               *         
      * INCONF - SIAC.CONFIRM.CADP*.S36667 CONFIRM FILE               *         
      * QA     - SIAC.CONFIRM.CADPQ.S46667 CONFIRM FILE               *         
      * INTRAN - B***.CAT511.ACATTRNS                                 *         
      *****************************************************************         
      * 07/21/08 DJXXXX SSR# 56718 NEW PROGRAM                        *         
      *****************************************************************         
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT INCONF           ASSIGN       TO INCONF                       
                                   FILE STATUS  IS INCONF-STAT.                 
                                                                                
           SELECT INTRAN           ASSIGN       TO INTRAN                       
                                   FILE STATUS  IS INTRAN-STAT.                 
      /                                                                         
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
       FD  INCONF                                                               
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
                                                                                
       01  INCONF-RECORD              PIC X(133).                               
                                                                                
       FD  INTRAN                                                               
           RECORDING MODE IS V                                                  
           RECORD IS VARYING IN SIZE FROM 1 TO 3326 CHARACTERS                  
                     DEPENDING ON W-REC-LEN-IN                                  
           BLOCK CONTAINS 0 RECORDS.                                            
                                                                                
           COPY NSCCMEXT REPLACING ==:NSCCMEXT:== BY ==INTRAN==.                
                                                                                
      /                                                                         
       WORKING-STORAGE SECTION.                                                 
       COPY PDXIDCOB.                                                           
                                                                                
       01  W-FIELDS.                                                            
           05  W-PROGRAM-NAME            PIC  X(008) VALUE 'CAT506'.            
           05  W-ROUTINE-1               PIC  X(032) VALUE ' '.                 
           05  ABEND-CODE                PIC S9(004) COMP SYNC.                 
           05  DUMP-SW                   PIC  X(001) VALUE ' '.                 
           05  END-OF-INCONF-SW          PIC  X(001) VALUE '0'.                 
               88 END-OF-INCONF                      VALUE '1'.                 
           05  INCONF-STAT               PIC  X(002).                           
               88 INCONF-OKAY            VALUE '00' THRU '09', '97'.            
               88 INCONF-END-OF-FILE     VALUE '10'.                            
               88 INCONF-EMPTY-MISSING VALUE '35'.                              
           05  END-OF-INTRAN-SW          PIC  X(001) VALUE '0'.                 
               88 END-OF-INTRAN                      VALUE '1'.                 
           05  INTRAN-STAT               PIC  X(002).                           
               88 INTRAN-OKAY            VALUE '00' THRU '09', '97'.            
               88 INTRAN-END-OF-FILE     VALUE '10'.                            
               88 INTRAN-EMPTY-MISSING VALUE '35'.                              
           05  W-REC-LEN-IN              PIC  9(005) COMP-3 VALUE 0.            
           05  W-INCONF-CNT              PIC  9(010) VALUE 0.                   
           05  W-INTRAN-CNT              PIC  9(010) VALUE 0.                   
DJ0001     05  W-ACATTRAN-CNT-X.                                                
DJ0001         07  W-ACATTRAN-CNT        PIC  9(010) VALUE 0.                   
                                                                                
DJ0001     05  W-SUB                     PIC  9(003) COMP-3 VALUE 0.            
           05  W-DET-IDX                 PIC  9(003) COMP-3 VALUE 0.            
DJ0001     05  W-DET-CNT-X.                                                     
               07  W-DET-BYTE            PIC X OCCURS 10 TIMES.                 
                                                                                
       01  FILLER                        PIC X(008) VALUE 'W-HDR   '.           
       01  W-TRAN-HDR-REC.                                                      
           05  W-TRAN-HDR-P2.                                                   
              10  W-TRAN-HDR-LIT                PIC X(0005).                    
                  88  W-TRAN-HDR-RECORD         VALUE 'DATE='.                  
              10  W-TRAN-HDR-PROC-DATE          PIC X(0006).                    
              10  W-TRAN-HDR-SYS-DATE           PIC X(0006).                    
              10  W-TRAN-HDR-SYS-TIME           PIC X(0006).                    
              10  FILLER                            PIC X(0003).                
              10  W-TRAN-HDR-DATASET-NAME       PIC X(0017).                    
              10  W-TRAN-HDR-PGM-NAME           PIC X(0008).                    
              10  W-TRAN-HDR-CLT-NO             PIC X(0003).                    
           05  W-TRAN-HDR-DATA.                                                 
              10  W-TRAN-HDR-CYCLE-NBR          PIC 9(0002).                    
              10  W-TRAN-HDR-TIMESTAMP          PIC X(0026).                    
              10  FILLER                            PIC X(0038).                
                                                                                
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
DJ0001     05  W-CONF-5-DETAIL-CNT.                                             
DJ0001         07  W-CONF-DET-BYTE       PIC X OCCURS 10 TIMES.                 
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
       01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.           
           COPY STUBCPY.                                                        
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.           
           COPY BPDATESC.                                                       
       01  FILLER                        PIC  X(008) VALUE 'END-O-WS'.          
      /                                                                         
      *****************************************************************         
      *    LINKAGE SECTION                                            *         
      *****************************************************************         
       LINKAGE SECTION.                                                         
       01  L-JCL-PARMS.                                                         
           05  PARMLENGTH                PIC S9(004) COMP SYNC.                 
           05  L-STREAM                  PIC  X(001).                           
               88  L-ALL-STREAM          VALUE 'Z'.                             
               88  L-Q-STREAM            VALUE 'Q'.                             
                                                                                
       PROCEDURE DIVISION USING L-JCL-PARMS.                                    
      *                         ===========                                     
                                                                                
           DISPLAY 'CAT506 - COMPARE SIAC RECORDS SENT AND RECEIVED'            
           DISPLAY ' '.                                                         
           COPY MSGCOBO.                                                        
           DISPLAY ' '.                                                         
                                                                                
           PERFORM 1000-INIT           THRU 1000-EXIT.                          
           PERFORM 2000-CHECK-CONFIRM  THRU 2000-EXIT.                          
           PERFORM 4000-EDIT           THRU 4000-EXIT.                          
           PERFORM 5000-TALLY-TRANS    THRU 5000-EXIT.                          
           PERFORM 7000-EDIT           THRU 7000-EXIT.                          
           PERFORM 9000-EOJ            THRU 9000-EXIT.                          
                                                                                
           GOBACK.                                                              
      /                                                                         
       1000-INIT.                                                               
           MOVE '1000-INIT                     ' TO W-ROUTINE-1.                
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY 'CAT506: L-STREAM      = '                                   
                            L-STREAM                                            
                                                                                
           MOVE 'CAT506'                  TO BPDATES-CALLING-PGM.               
           SET  LNKDATZ-REQUEST           TO TRUE.                              
           CALL BPDATES USING BPDATES-PARAMETERS.                               
           DISPLAY 'CAT506: BPD-PROC-DATE = ' BPD-PROC-DATE                     
           DISPLAY ' '.                                                         
                                                                                
           OPEN INPUT INCONF.                                                   
           DISPLAY 'CAT506: INCONF  OPENED FOR INPUT.  STATUS = '               
                                               INCONF-STAT.                     
           IF  INCONF-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT506: ERROR OPENING INCONF'                           
               DISPLAY 'CAT506: OPEN STATUS = ' INCONF-STAT                     
               DISPLAY 'CAT506: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3002    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           OPEN INPUT INTRAN.                                                   
           DISPLAY 'CAT506: INTRAN  OPENED FOR INPUT.  STATUS = '               
                                               INTRAN-STAT.                     
           IF  INTRAN-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT506: ERROR OPENING INTRAN'                           
               DISPLAY 'CAT506: OPEN STATUS = ' INTRAN-STAT                     
               DISPLAY 'CAT506: U3002 - ABENDING ON BAD FILE STATUS'            
               MOVE +3002    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           DISPLAY ' '.                                                         
                                                                                
       1000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       2000-CHECK-CONFIRM.                                                      
                                                                                
           PERFORM 3000-READ-INPUT THRU 3000-EXIT                               
                                                                                
           IF  END-OF-INCONF                                                    
               GO TO 2000-EXIT                                                  
           END-IF.                                                              
                                                                                
           EVALUATE W-INCONF-CNT                                                
               WHEN 1   MOVE INCONF-RECORD TO W-CONF-1                          
                        DISPLAY 'CONFIRM FILE : '                               
                        DISPLAY                                                 
                        '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'             
                        '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'             
                        DISPLAY W-CONF-1(2:120)                                 
               WHEN 2   MOVE INCONF-RECORD TO W-CONF-2                          
                        DISPLAY W-CONF-2(2:130)                                 
               WHEN 3   MOVE INCONF-RECORD TO W-CONF-3                          
                        DISPLAY W-CONF-3(2:80)                                  
               WHEN 4   MOVE INCONF-RECORD TO W-CONF-4                          
                        DISPLAY W-CONF-4(2:80)                                  
               WHEN 5   MOVE INCONF-RECORD TO W-CONF-5                          
                        DISPLAY W-CONF-5(2:80)                                  
               WHEN 6   MOVE INCONF-RECORD TO W-CONF-6                          
                        DISPLAY W-CONF-6(2:80)                                  
               WHEN 7   MOVE INCONF-RECORD TO W-CONF-7                          
                        DISPLAY W-CONF-7(2:80)                                  
               WHEN 8   MOVE INCONF-RECORD TO W-CONF-8                          
                        DISPLAY W-CONF-8(2:80)                                  
               WHEN 9   MOVE INCONF-RECORD TO W-CONF-9                          
                        DISPLAY W-CONF-9(2:80)                                  
                        DISPLAY                                                 
                        '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'             
                        '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'             
           END-EVALUATE.                                                        
                                                                                
           GO TO 2000-CHECK-CONFIRM.                                            
                                                                                
       2000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       3000-READ-INPUT.                                                         
                                                                                
           IF  END-OF-INCONF                                                    
               GO 3000-EXIT                                                     
           END-IF.                                                              
                                                                                
           READ INCONF                                                          
                AT END                                                          
                   MOVE '1'              TO END-OF-INCONF-SW                    
                   DISPLAY 'CAT505: END OF INCONF REACHED'                      
                           ' W-INCONF-CNT = ' W-INCONF-CNT                      
                   GO TO 3000-EXIT                                              
           END-READ.                                                            
                                                                                
           IF  INCONF-OKAY                                                      
               ADD 1 TO W-INCONF-CNT                                            
           ELSE                                                                 
               DISPLAY 'CAT505: ERROR READING INCONF'                           
               DISPLAY 'CAT505: READ STATUS = ' INCONF-STAT                     
               DISPLAY 'CAT505: U3007 - ABENDING ON BAD FILE STATUS'            
               MOVE +3007 TO ABEND-CODE                                         
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
       3000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       4000-EDIT.                                                               
           MOVE '4000-EDIT                   ' TO W-ROUTINE-1.                  
                                                                                
           DISPLAY 'CAT506: INCONF STREAM IND    = '                            
                            W-CONF-7-STREAM-IND                                 
           DISPLAY 'CAT506: INCONF CYCLE NO      = '                            
                            W-CONF-7-CYCLE-NO                                   
                                                                                
DJ0001     MOVE ZEROES TO W-DET-CNT-X                                           
DJ0001     MOVE 10 TO W-SUB W-DET-IDX.                                          
DJ0001                                                                          
DJ0001     PERFORM VARYING W-SUB FROM W-SUB BY -1 UNTIL W-SUB = 0               
DJ0001       IF W-CONF-DET-BYTE(W-SUB) IS NUMERIC                               
DJ0001          MOVE W-CONF-DET-BYTE(W-SUB) TO W-DET-BYTE(W-DET-IDX)            
DJ0001          SUBTRACT 1 FROM W-DET-IDX                                       
DJ0001       END-IF                                                             
DJ0001     END-PERFORM                                                          
                                                                                
           DISPLAY 'CAT506: INCONF DETAIL CNT    = '  W-DET-CNT-X.              
           DISPLAY ' '.                                                         
                                                                                
       4000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       5000-TALLY-TRANS.                                                        
           MOVE '5000-TALLY-TRANS            ' TO W-ROUTINE-1.                  
                                                                                
           PERFORM 6000-READ-INPUT THRU 6000-EXIT                               
                                                                                
           IF  END-OF-INTRAN                                                    
               GO TO 5000-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF  INTRAN-HDR-RECORD                                                
               DISPLAY 'CAT506: INTRAN HEADER RECORD: '                         
                                INTRAN-HDR-REC(1:090)                           
               MOVE INTRAN-HDR-REC TO W-TRAN-HDR-REC                            
               GO TO 5000-TALLY-TRANS                                           
           END-IF.                                                              
                                                                                
       5000-FINI.                                                               
                                                                                
      *** COUNT THE NUMBER RECORDS SUBMITTED BY PARTICIPANT                     
           IF  INTRAN-KEY-REC-TYPE = '10' OR '20' OR '30'                       
               IF  INTRAN-S-SUBMIT-BY-THIS-BRKR                                 
                   ADD 1 TO W-ACATTRAN-CNT                                      
               END-IF                                                           
           END-IF.                                                              
                                                                                
           GO TO 5000-TALLY-TRANS.                                              
                                                                                
       5000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       6000-READ-INPUT.                                                         
           MOVE '6000-READ-INPUT             ' TO W-ROUTINE-1.                  
                                                                                
           IF  END-OF-INTRAN                                                    
               GO 6000-EXIT                                                     
           END-IF.                                                              
                                                                                
           READ INTRAN                                                          
                AT END                                                          
                   MOVE '1'              TO END-OF-INTRAN-SW                    
                   DISPLAY 'CAT506: END OF INTRAN REACHED'                      
                           ' W-INTRAN-CNT = ' W-INTRAN-CNT                      
                   GO TO 6000-EXIT                                              
           END-READ.                                                            
                                                                                
           IF  INTRAN-OKAY                                                      
               ADD 1 TO W-INTRAN-CNT                                            
           ELSE                                                                 
               DISPLAY 'CAT506: ERROR READING INTRAN'                           
               DISPLAY 'CAT506: READ STATUS = ' INTRAN-STAT                     
               DISPLAY 'CAT506: U3004 - ABENDING ON BAD FILE STATUS'            
               MOVE +3004    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
       6000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       7000-EDIT.                                                               
           MOVE '7000-EDIT                   ' TO W-ROUTINE-1.                  
                                                                                
           DISPLAY 'CAT506: INTRAN STREAM IND    = '                            
                            W-TRAN-HDR-REC(28:1)                                
           DISPLAY 'CAT506: INTRAN CYCLE NO      = '                            
                            W-TRAN-HDR-CYCLE-NBR(2:1)                           
           DISPLAY 'CAT506: INTRAN DETAIL CNT    = '                            
DJ0001                      W-ACATTRAN-CNT-X                                    
           DISPLAY ' '                                                          
                                                                                
DJ0001     IF W-ACATTRAN-CNT-X = W-DET-CNT-X                                    
                 DISPLAY 'SIAC RECORDS PROCESSED = SENT'                        
DJ0001           DISPLAY 'ACATTRAN COUNT(' W-ACATTRAN-CNT ')'                   
DJ0001               ' = CONFIRM DETAIL COUNT(' W-DET-CNT-X '). OKAY'           
           ELSE                                                                 
DJ0001        IF W-ACATTRAN-CNT-X > W-DET-CNT-X                                 
                 DISPLAY 'SIAC RECORDS PROCESSED > SENT'                        
DJ0001           DISPLAY 'ACATTRAN COUNT(' W-ACATTRAN-CNT-X ')'                 
DJ0001              ' > CONFIRM DETAIL COUNT(' W-DET-CNT-X '). NOT OKAY'        
              ELSE                                                              
                 DISPLAY 'SIAC RECORDS PROCESSED < SENT'                        
DJ0001           DISPLAY 'ACATTRAN COUNT(' W-ACATTRAN-CNT-X ')'                 
DJ0001              ' < CONFIRM DETAIL COUNT(' W-DET-CNT-X '). NOT OKAY'        
                    ' <========== WARNING !!!!'                                 
                 DISPLAY 'SETTING RETURN-CODE ' W-CONF-7-CYCLE-NO               
                         ' FOR WTO MESSAGE SENDING'                             
                 EVALUATE W-CONF-7-CYCLE-NO                                     
                     WHEN '1' MOVE 1 TO RETURN-CODE                             
                     WHEN '2' MOVE 2 TO RETURN-CODE                             
                     WHEN '3' MOVE 3 TO RETURN-CODE                             
                     WHEN '4' MOVE 4 TO RETURN-CODE                             
                     WHEN '5' MOVE 5 TO RETURN-CODE                             
                     WHEN OTHER                                                 
                              DISPLAY 'CYCLE NUMBER NOT 1 - 5'                  
                 END-EVALUATE                                                   
              END-IF                                                            
           END-IF.                                                              
                                                                                
       7000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       9000-EOJ.                                                                
           MOVE '9000-EOJ                    ' TO W-ROUTINE-1.                  
           DISPLAY ' '.                                                         
           CLOSE INCONF                                                         
           DISPLAY 'CAT506: INCONF   CLOSED. STATUS = ' INCONF-STAT.            
           CLOSE INTRAN                                                         
           DISPLAY 'CAT506: INTRAN   CLOSED. STATUS = ' INTRAN-STAT.            
           DISPLAY 'CAT506: INCONF   REC-CNT = ' W-INCONF-CNT                   
           DISPLAY 'CAT506: INTRAN   REC-CNT = ' W-INTRAN-CNT                   
DJ0001     DISPLAY 'CAT506: CONFIRM  DET-CNT = ' W-DET-CNT-X                    
                                            ' SENT TO SIAC'                     
DJ0001     DISPLAY 'CAT506: ACATTRAN DET-CNT = ' W-ACATTRAN-CNT-X               
                                            ' RETURN FROM SIAC'                 
           DISPLAY ' '.                                                         
           DISPLAY 'CAT506: RETURN CODE = ' RETURN-CODE                         
           DISPLAY 'CAT506: PROGRAM ENDED SUCCESSFULLY'.                        
                                                                                
       9000-EXIT.                                                               
           EXIT.                                                                
      *################################################################         
