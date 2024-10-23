000001* PDX    - CAT821   C0361186 01/21/15 09:05:45 TBLAMUR            00001000
LRM004* SSR 103323 PASS PAPER STATEMENT FEE TO ASCENDIS                         
000001* PDX    - CAT821   C0334118 07/11/13 09:31:51 TBLAMUR            00001000
LRM003* SSR 86909 CORRECT MISSING IRA FEE ON ASCENDIS MATCH FILE.               
000001* PDX    - CAT821   C0319859 01/28/12 12:16:06 TBLAMUR            00001000
000001* PDX    - CAT821   C0317345 11/11/11 09:37:46 TBLAMUR            00001000
LRM002* SSR 79096 EXTRACT PENDING DIVIDEND DEBIT AND SECURITY NUMBER.           
000001* PDX    - CAT821   C0296621 08/24/10 10:08:22 TBLAMUR            00001000
LRM001* SSR 71810 EXTRACT FOREIGN FEE EXTRACT BY SECURITY NUMBER.               
000001* PDX    - CAT821   C0260091 07/23/08 08:40:32 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT821.                                                     
                                                                                
      *--------------------------------------------------------------*          
      *  THE PURPOSE OF THIS PROGRAM IS TO CREATE MATH FILES FOR                
      *  SSR 55766 ASCENDIS(WORKFLOW).                                          
      *  CONTAINING FEES, TYPE3-1 BAL, FRACT LIQ, MMF AS CASH.                  
      *  EXTRACT FOR PTR,PTD,FUL ONLY.                                          
      *  SEE CAT820DB FOR OLMI INTEREST ADJUSTMENTS WHICH WILL BE               
      *  MERGED IN AT NIGHT ONLY.                                               
      *                                                                         
      *  ACENDIS B1 NOT USED, CREATE FILE ANYWAY FOR MAINFRAME RESEARCH         
      *                                                                         
      *--------------------------------------------------------------*          
                                                                                
       ENVIRONMENT DIVISION.                                                    
                                                                                
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT TFRS-I-FILE              ASSIGN TFRSFLI.                      
           SELECT CASH-ADJUSTMENT-FILE     ASSIGN CASHADJ.                      
                                                                                
           SELECT MATH-FILE                ASSIGN CATMATH.                      
                                                                                
                                                                                
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
       FD  TFRS-I-FILE                                                          
           RECORDING MODE IS F                                                  
           LABEL RECORDS ARE STANDARD                                           
           BLOCK CONTAINS 0 RECORDS.                                            
       COPY ACATDLVF REPLACING ==:FMT:== BY ==TFRS==.                           
                                                                                
       FD  CASH-ADJUSTMENT-FILE                                                 
           RECORDING MODE IS F                                                  
           LABEL RECORDS STANDARD                                               
           BLOCK CONTAINS 0 RECORDS.                                            
       COPY ACATCSHA REPLACING ==:FMT:== BY ==CASH==.                           
                                                                                
       FD  MATH-FILE                                                            
           RECORDING MODE IS F                                                  
           LABEL RECORDS STANDARD                                               
           BLOCK CONTAINS 0 RECORDS.                                            
       COPY CATMATH REPLACING ==:CATMATH:== BY ==CATMATH==.                     
                                                                                
      ****************************************************************          
           EJECT                                                                
       WORKING-STORAGE SECTION.                                                 
                                                                                
           COPY STUBCPY.                                                        
       01  WORK-FIELDS.                                                         
           05  PGM-NME                 PIC X(6)  VALUE 'CAT821'.                
           05  WS-SAVE-CLIENT          PIC 9(3)  VALUE ZERO.                    
           05  ABORT-CODE              PIC S9(4) COMP SYNC VALUE 99.            
           05  WS-CYCLE-DATA           PIC X(08)        VALUE ' '.              
                                                                                
       01  COUNTERS COMP-3.                                                     
           02  JOB-COUNTERS.                                                    
               05  TFRS-DTL-RECS               PIC 9(7) VALUE ZERO.             
               05  CSHA-DTL-RECS               PIC 9(7) VALUE ZERO.             
               05  MATH-RECS-WRTN              PIC 9(11) VALUE ZERO.            
                                                                                
           EJECT                                                                
       01  SWITCHES.                                                            
           05  TFRS-FILE-EOF-SW              PIC X VALUE ' '.                   
               88  TFRS-END-OF-FILE                VALUE 'Y'.                   
           05  CSHA-FILE-EOF-SW              PIC X VALUE ' '.                   
               88  CSHA-END-OF-FILE                VALUE 'Y'.                   
                                                                                
       COPY CP2WS.                                                              
                                                                                
       EJECT                                                                    
      *  B1-INFO                                                                
       COPY BHINFO.                                                             
                                                                                
       COPY BHACAT.                                                             
       EJECT                                                                    
      ****************************************************************          
      *    TIME/DATE FIELDS                                          *          
      ****************************************************************          
       COPY BPDATESC.                                                           
       01  DATE-FIELDS.                                                         
           05  PROC-DATE.                                                       
               10  PD-CC        PIC XX.                                         
               10  PD-YY        PIC XX.                                         
               10  PD-MM        PIC XX.                                         
               10  PD-DD        PIC XX.                                         
           05  PRIOR-PROC-DATE.                                                 
               10  PPD-CC       PIC XX.                                         
               10  PPD-YY       PIC XX.                                         
               10  PPD-MM       PIC XX.                                         
               10  PPD-DD       PIC XX.                                         
           05  WORK-DATE-MMDDYY.                                                
               10  WK-MM        PIC XX.                                         
               10  WK-DD        PIC XX.                                         
               10  WK-YY        PIC XX.                                         
           05  PRIOR-WORK-DATE-MMDDYY.                                          
               10  PWK-MM        PIC XX.                                        
               10  PWK-DD        PIC XX.                                        
               10  PWK-YY        PIC XX.                                        
                                                                                
       01  W-DATE                  PIC 9(06).                                   
       01  W-DATE-X REDEFINES W-DATE                                            
                                   PIC X(06).                                   
       01  W-TIME                  PIC 9(08).                                   
       01  W-TIME-X REDEFINES W-TIME                                            
                                   PIC X(08).                                   
       EJECT                                                                    
       LINKAGE SECTION.                                                         
       01  PARM-DATA.                                                           
           05  PARM-LENGTH              PIC S9(4)  COMP.                        
           05  PARM-INFO.                                                       
               10  PARM-STREAM              PIC X.                              
                   88  PARM-STREAM-VALID           VALUES ARE                   
                   'A' THRU 'Z' '0' THRU '9'.                                   
               10  PARM-RUN-MODE            PIC X(2).                           
                   88  PARM-INTRA-DAY              VALUE 'ID'.                  
           EJECT                                                                
                                                                                
       PROCEDURE DIVISION USING PARM-DATA.                                      
           COPY MSGCOBO.                                                        
                                                                                
           DISPLAY 'CAT821 - FORMAT MATH ADJUSTMENTS FILE FOR ASCENDIS'         
           DISPLAY '     CONTAINING FEES, MMF AS CASH'                          
           DISPLAY '     TYPE3 MOVES, FRACTIONAL LIQUIDATIONS'                  
           DISPLAY ' '.                                                         
                                                                                
           PERFORM 0100-DATE-PARM-RTN THRU                                      
                   0100-DATE-PARM-RTN-EXIT.                                     
           PERFORM 0200-FILE-INIT THRU                                          
                   0200-FILE-INIT-EXIT.                                         
                                                                                
           PERFORM 0400-PROCESS-TFRS-FILE                                       
                            THRU  0400-PROCESS-TFRS-FILE-EXIT                   
               UNTIL TFRS-FILE-EOF-SW = 'Y'.                                    
                                                                                
           PERFORM 0600-PROCESS-CSHA-FILE                                       
                            THRU  0600-PROCESS-CSHA-FILE-EXIT                   
               UNTIL CSHA-FILE-EOF-SW = 'Y'.                                    
                                                                                
           PERFORM 1800-END-OF-JOB-ROUTINE                                      
                                                                                
           GOBACK.                                                              
           EJECT                                                                
                                                                                
       0100-DATE-PARM-RTN.                                                      
                                                                                
           MOVE  PGM-NME         TO  BPDATES-CALLING-PGM.                       
           MOVE  'C'             TO  BPDATES-REQ-TYPE.                          
           CALL   BPDATES   USING  BPDATES-PARAMETERS.                          
                                                                                
           MOVE BPD-PROC-DATE        TO  PROC-DATE.                             
           MOVE BPD-PRIOR-PROC-DATE  TO  PRIOR-PROC-DATE.                       
                                                                                
           MOVE PD-MM            TO  WK-MM.                                     
           MOVE PD-DD            TO  WK-DD.                                     
           MOVE PD-YY            TO  WK-YY.                                     
                                                                                
           MOVE PPD-MM           TO  PWK-MM.                                    
           MOVE PPD-DD           TO  PWK-DD.                                    
           MOVE PPD-YY           TO  PWK-YY.                                    
                                                                                
           DISPLAY 'PROCESS DATE = '  PROC-DATE.                                
           DISPLAY 'PRIOR PROCESS DATE = '  PRIOR-PROC-DATE.                    
                                                                                
           ACCEPT W-DATE         FROM DATE.                                     
           ACCEPT W-TIME         FROM TIME.                                     
                                                                                
           DISPLAY 'PARM-LENGTH = ' PARM-LENGTH                                 
           DISPLAY 'PARM-STREAM = ' PARM-STREAM                                 
           DISPLAY 'PARM-RUN-MODE = ' PARM-RUN-MODE.                            
                                                                                
      * CHECK PARM                                                              
           IF PARM-LENGTH > 0                                                   
             CONTINUE                                                           
           ELSE                                                                 
             DISPLAY 'PARM MISSING, MUST BE AT LEAST 1 CHAR '                   
             DISPLAY 'PARM ENTERED - ' PARM-INFO                                
             DISPLAY 'PROGRAM CAT821 ABENDED '                                  
             MOVE +2000  TO  ABORT-CODE                                         
             PERFORM ABEND-RTN.                                                 
                                                                                
           IF PARM-STREAM-VALID                                                 
             CONTINUE                                                           
           ELSE                                                                 
             DISPLAY 'PARM 1ST CHAR IS JOB STREAM IS INVALID'                   
             DISPLAY 'PARM ENTERED - ' PARM-INFO                                
             DISPLAY 'PROGRAM CAT821 ABENDED '                                  
             MOVE +2000  TO  ABORT-CODE                                         
             PERFORM ABEND-RTN.                                                 
                                                                                
       0100-DATE-PARM-RTN-EXIT. EXIT.                                           
           EJECT                                                                
       0200-FILE-INIT.                                                          
                                                                                
           OPEN INPUT TFRS-I-FILE                                               
           OPEN INPUT CASH-ADJUSTMENT-FILE                                      
           OPEN OUTPUT MATH-FILE                                                
                                                                                
           READ TFRS-I-FILE                                                     
             AT END                                                             
                 MOVE 'Y' TO  TFRS-FILE-EOF-SW.                                 
                                                                                
           IF NOT TFRS-HDR-REC                                                  
              DISPLAY 'TRFS FILE HEADER NOT FOUND'                              
                  DISPLAY 'JOB ENDING'                                          
              MOVE +4004 TO ABORT-CODE                                          
              PERFORM ABEND-RTN                                                 
           ELSE                                                                 
                DISPLAY 'TFRS FILE (TFRSFLI) DATE = '                           
                         TFRS-HDR-PROC-DATE                                     
                MOVE TFRS-HDR-CYCLE-DATA TO WS-CYCLE-DATA                       
                DISPLAY 'TFRS FILE (TFRSFLI) HDR  = '                           
                         TFRS-HDR-CYCLE-DATA                                    
           END-IF.                                                              
                                                                                
      * WRITE DATE HEADER RECORD IN P2 FORMAT TO MATH FILE.                     
           MOVE SPACES   TO  CATMATH-RECORD.                                    
           MOVE 'DATE='  TO  CATMATH-RECORD.                                    
           MOVE WORK-DATE-MMDDYY TO CATMATH-RECORD (6:6).                       
           MOVE 'H'                    TO CP2-REQUEST-CODE                      
           MOVE 'CAT821'               TO CP2-PROGRAM-ID                        
           MOVE 999                    TO CP2-CLIENT-NUMBER                     
           CALL P2HDTR              USING CP2-AREA MATH-FILE                    
           MOVE CP2-RETURN-RECORD      TO CATMATH-RECORD.                       
           MOVE WS-CYCLE-DATA TO CATMATH-RECORD(55:8)                           
           DISPLAY 'CATMATH-HDR = ' CATMATH-RECORD                              
           WRITE CATMATH-RECORD.                                                
                                                                                
       0200-FILE-INIT-EXIT.  EXIT.                                              
                                                                                
       0300-READ-B1-RTN.                                                        
           MOVE '015'     TO BH-LOGICAL-RECORD-CODE.                            
           MOVE '434500'  TO BH-B2-INFO-ID.                                     
           CALL  GETB1V  USING BH-BROKER-HEADER-INFO,                           
                              BH-ACAT-INFO                                      
           END-CALL.                                                            
           IF BH-ACAT-ACTIVE                                                    
             DISPLAY 'CLIENT : ' TFRS-ADP-CL-NO-X                               
                   ' BHACAT READ OK '                                           
           ELSE                                                                 
             DISPLAY 'CLIENT TO ACAT NOT ACTIVE '                               
                TFRS-ADP-CL-NO-X                                                
             MOVE '0' TO BH-ACAT-FRACT-ON-CNS-ELIG-SEC                          
                         BH-ACAT-TYPE-3-BALANCES                                
           END-IF.                                                              
                                                                                
       0300-READ-B1-EXIT. EXIT.                                                 
           EJECT                                                                
       0400-PROCESS-TFRS-FILE.                                                  
                                                                                
           PERFORM 0500-READ-TFRS-RTN                                           
                    THRU 0500-EXIT.                                             
                                                                                
           IF TFRS-FILE-EOF-SW = 'Y'                                            
              GO TO 0400-PROCESS-TFRS-FILE-EXIT.                                
                                                                                
           IF TFRS-TRNFR-TYPE-CD = 'PTR' OR 'PTD' OR 'FUL'                      
              CONTINUE                                                          
           ELSE                                                                 
              GO TO 0400-PROCESS-TFRS-FILE-EXIT.                                
                                                                                
      *****************************************************************         
      * RECORD TYPE DESCRIPTONS:                                                
      *  A - ACCOUNT LEVEL CARRIES FRACTIONAL QTY LIQUIDATION BY                
      *      ADP SECURITY                                                       
      *  B - BALANCE ADJUSTMENTS (ONE PER TIF) FOR FULL DELIVERIES,             
      *      HAS TYPE3 TO TYPE1 SEPERATE, THESE DRIVE THE FEE CREATION          
      *  M - SAME LAYOUT AS "A" CONTAINING MMF DELIVERED AS CASH                
      *****************************************************************         
                                                                                
           IF TFRS-ADP-CL-NO-X NOT = BH-BROKER-NUMBER                           
              MOVE TFRS-ADP-CL-NO TO BH-BROKER-NUMBER-N                         
              PERFORM 0300-READ-B1-RTN                                          
                 THRU 0300-READ-B1-EXIT                                         
           END-IF.                                                              
                                                                                
           MOVE SPACES TO CATMATH-RECORD                                        
           MOVE '0'                     TO CATMATH-CLIENT-NBR(1 : 1)            
           MOVE TFRS-ADP-CL-NO-X        TO CATMATH-CLIENT-NBR(2 : 3)            
           MOVE TFRS-CONTROL-NBR        TO CATMATH-ACATS-CNTL-NBR               
           MOVE TFRS-DLVR-ACCT          TO CATMATH-BRANCH                       
           MOVE TFRS-DLVR-ACCT(4 : 5)   TO CATMATH-ACCOUNT                      
           IF TFRS-CASH                                                         
              MOVE '1'                  TO CATMATH-ACCOUNT-TYPE-FROM            
                                           CATMATH-ACCOUNT-TYPE-TO              
           ELSE                                                                 
           IF TFRS-MARGIN                                                       
              MOVE '2'                  TO CATMATH-ACCOUNT-TYPE-FROM            
                                           CATMATH-ACCOUNT-TYPE-TO              
           END-IF.                                                              
                                                                                
           IF TFRS-ASSET-RECORD                                                 
           AND TFRS-FRAC-QTY NOT = ZERO                                         
               SET CATMATH-FRACTIONAL-QTY TO TRUE                               
               MOVE TFRS-ADP-SECURITY   TO CATMATH-ADP-NBR                      
               MOVE TFRS-FRAC-MARKET-VALUE TO CATMATH-BALANCE                   
               IF TFRS-LONG                                                     
                  SET CATMATH-BALANCE-CREDIT TO TRUE                            
                  SET CATMATH-QUANTITY-LONG TO TRUE                             
               ELSE                                                             
                  SET CATMATH-BALANCE-DEBIT TO TRUE                             
                  SET CATMATH-QUANTITY-SHORT TO TRUE                            
               END-IF                                                           
               SET CATMATH-BALANCE-APPLIED-YES TO TRUE                          
               MOVE TFRS-FRAC-QTY       TO CATMATH-QUANTITY                     
               IF (PARM-INTRA-DAY                                               
               AND TFRS-TRNFR-TYPE-CD = 'FUL')                                  
               OR BH-ACAT-FRACT-ON-CNS-ELIG-SEC NOT = '1'                       
               OR BH-ACAT-LIQUID-FRAC-BATCH NOT > SPACES                        
               OR BH-ACAT-LIQUID-FRAC-ENTRY NOT > SPACES                        
                  SET CATMATH-BALANCE-NOT-APPLIED TO TRUE                       
               ELSE                                                             
                  SET CATMATH-BALANCE-APPLIED-YES TO TRUE                       
               END-IF                                                           
               WRITE CATMATH-RECORD                                             
               ADD 1 TO MATH-RECS-WRTN                                          
           ELSE                                                                 
           IF TFRS-MMF-AS-CASH-RECORD                                           
               SET CATMATH-MMF-AS-CASH  TO TRUE                                 
               MOVE TFRS-ADP-SECURITY   TO CATMATH-ADP-NBR                      
               MOVE TFRS-MARKET-VALUE   TO CATMATH-BALANCE                      
               SET CATMATH-BALANCE-CREDIT TO TRUE                               
               SET CATMATH-BALANCE-APPLIED-YES TO TRUE                          
               MOVE ZEROS               TO CATMATH-QUANTITY                     
               MOVE SPACES              TO CATMATH-QUANTITY-SIGN                
               WRITE CATMATH-RECORD                                             
               ADD 1 TO MATH-RECS-WRTN                                          
           ELSE                                                                 
           IF TFRS-BALANCE-RECORD                                               
              IF TFRS-TYPE3-BALANCE NOT = 0.00                                  
                 SET CATMATH-TYPE3-MOVE  TO TRUE                                
                 MOVE TFRS-TYPE3-BALANCE TO CATMATH-BALANCE                     
                 IF TFRS-TYPE3-BALANCE < ZERO                                   
                    SET CATMATH-BALANCE-CREDIT TO TRUE                          
                 ELSE                                                           
                    SET CATMATH-BALANCE-DEBIT  TO TRUE                          
                 END-IF                                                         
                 IF BH-ACAT-TYPE-3-BALANCES = '1'                               
                 AND BH-ACAT-TYPE3-BATCH-CODE > SPACES                          
                 AND BH-ACAT-TYPE3-ENTRY-CODE > SPACES                          
                    SET CATMATH-BALANCE-APPLIED-YES TO TRUE                     
                 ELSE                                                           
                    SET CATMATH-BALANCE-NOT-APPLIED TO TRUE                     
                 END-IF                                                         
                 MOVE ZEROS               TO CATMATH-QUANTITY                   
                 MOVE SPACES              TO CATMATH-QUANTITY-SIGN              
                 WRITE CATMATH-RECORD                                           
                 ADD 1 TO MATH-RECS-WRTN                                        
              END-IF                                                            
LRM002     ELSE                                                                 
LRM002     IF TFRS-ASSET-PEND-DVND                                              
LRM002        IF TFRS-ASSET-DVDND-AMT NOT = 0.00                                
LRM002           SET CATMATH-PENDING-SHORT-DVND TO TRUE                         
LRM002           MOVE TFRS-ASSET-DVDND-AMT TO CATMATH-BALANCE                   
LRM002           IF TFRS-ASSET-DVDND-AMT < ZERO                                 
LRM002              SET CATMATH-BALANCE-CREDIT TO TRUE                          
LRM002           ELSE                                                           
LRM002              SET CATMATH-BALANCE-DEBIT  TO TRUE                          
LRM002           END-IF                                                         
LRM002           MOVE TFRS-ADP-SECURITY   TO CATMATH-ADP-NBR                    
LRM002           SET CATMATH-BALANCE-APPLIED-YES TO TRUE                        
LRM002           MOVE ZEROS               TO CATMATH-QUANTITY                   
LRM002           MOVE SPACES              TO CATMATH-QUANTITY-SIGN              
LRM002           WRITE CATMATH-RECORD                                           
LRM002           ADD 1 TO MATH-RECS-WRTN                                        
LRM002        END-IF                                                            
           END-IF.                                                              
                                                                                
           GO TO 0400-PROCESS-TFRS-FILE.                                        
                                                                                
       0400-PROCESS-TFRS-FILE-EXIT. EXIT.                                       
                                                                                
       EJECT                                                                    
                                                                                
       0500-READ-TFRS-RTN.                                                      
           READ TFRS-I-FILE                                                     
             AT END                                                             
                  DISPLAY 'TFRS FILE AT END'                                    
                  MOVE HIGH-VALUES TO TFRS-DETAIL-KEY                           
                  MOVE 'Y' TO TFRS-FILE-EOF-SW                                  
             NOT AT END                                                         
                  ADD 1 TO TFRS-DTL-RECS                                        
           END-READ.                                                            
                                                                                
           IF TFRS-FILE-EOF-SW NOT = 'Y'                                        
           AND TFRS-HDR-REC                                                     
               DISPLAY 'FOUND HEADER ON TFRS.'                                  
                       ' REC-CNT ' TFRS-TRL-REC-CNT                             
               GO TO 0500-READ-TFRS-RTN                                         
           END-IF.                                                              
                                                                                
           IF TFRS-FILE-EOF-SW NOT = 'Y'                                        
           AND TFRS-TRL-REC                                                     
               DISPLAY 'FOUND TRAILER ON TFRS.'                                 
                       ' REC-CNT ' TFRS-TRL-REC-CNT                             
               GO TO 0500-READ-TFRS-RTN                                         
           END-IF.                                                              
       0500-EXIT. EXIT.                                                         
                                                                                
           EJECT                                                                
       0600-PROCESS-CSHA-FILE.                                                  
                                                                                
           PERFORM 0700-READ-CSHA-RTN                                           
                    THRU 0700-EXIT.                                             
                                                                                
           IF CSHA-FILE-EOF-SW = 'Y'                                            
              GO TO 0600-PROCESS-CSHA-FILE-EXIT.                                
                                                                                
           IF CASH-TRNFR-TYPE-CD = 'PTR' OR 'PTD' OR 'FUL'                      
              CONTINUE                                                          
           ELSE                                                                 
              GO TO 0600-PROCESS-CSHA-FILE-EXIT.                                
                                                                                
           MOVE SPACES TO CATMATH-RECORD                                        
           MOVE '0'                     TO CATMATH-CLIENT-NBR(1 : 1)            
           MOVE CASH-ADP-CL-NO-X        TO CATMATH-CLIENT-NBR(2 : 3)            
           MOVE CASH-CONTROL-NBR        TO CATMATH-ACATS-CNTL-NBR               
           MOVE CASH-DLVR-ACCT          TO CATMATH-BRANCH                       
           MOVE CASH-DLVR-ACCT(4 : 5)   TO CATMATH-ACCOUNT                      
           MOVE '1'                     TO CATMATH-ACCOUNT-TYPE-FROM            
                                           CATMATH-ACCOUNT-TYPE-TO              
LRM001     IF CASH-FRGN-FEE-RECORD                                              
LRM001        SET CATMATH-FEE-FOREIGN-ASSET TO TRUE                             
LRM001        MOVE CASH-FRGN-FEE-ADP-NBR  TO CATMATH-ADP-NBR                    
LRM001        MOVE CASH-FRGN-FEE-AMT      TO CATMATH-BALANCE                    
LRM001        SET CATMATH-BALANCE-DEBIT TO TRUE                                 
LRM001        SET CATMATH-BALANCE-APPLIED-YES TO TRUE                           
LRM001        MOVE ZEROS                  TO CATMATH-QUANTITY                   
LRM001        MOVE SPACES                 TO CATMATH-QUANTITY-SIGN              
LRM001        WRITE CATMATH-RECORD                                              
LRM001        ADD 1 TO MATH-RECS-WRTN                                           
LRM001        GO TO 0600-PROCESS-CSHA-FILE-EXIT                                 
LRM001     END-IF.                                                              
LRM002     IF CASH-PEND-DVDN-RECORD                                             
LRM002        SET CATMATH-PENDING-SHORT-DVND TO TRUE                            
LRM002        MOVE CASH-FRGN-FEE-ADP-NBR  TO CATMATH-ADP-NBR                    
LRM002        MOVE CASH-PEND-DIVIDEND-DB  TO CATMATH-BALANCE                    
LRM002        SET CATMATH-BALANCE-DEBIT TO TRUE                                 
LRM002        SET CATMATH-BALANCE-APPLIED-YES TO TRUE                           
LRM002        MOVE ZEROS                  TO CATMATH-QUANTITY                   
LRM002        MOVE SPACES                 TO CATMATH-QUANTITY-SIGN              
LRM002        WRITE CATMATH-RECORD                                              
LRM002        ADD 1 TO MATH-RECS-WRTN                                           
LRM002        GO TO 0600-PROCESS-CSHA-FILE-EXIT                                 
LRM002     END-IF.                                                              
           IF CASH-TRNFR-FEE-AMT NOT = 0.00                                     
              SET CATMATH-FEE-TRANSFER TO TRUE                                  
              MOVE CASH-TRNFR-FEE-AMT     TO CATMATH-BALANCE                    
              SET CATMATH-BALANCE-DEBIT TO TRUE                                 
              SET CATMATH-BALANCE-APPLIED-YES TO TRUE                           
              MOVE ZEROS                  TO CATMATH-QUANTITY                   
              MOVE SPACES                 TO CATMATH-QUANTITY-SIGN              
              WRITE CATMATH-RECORD                                              
              ADD 1 TO MATH-RECS-WRTN                                           
           END-IF.                                                              
                                                                                
           IF CASH-IRA-TRMNT-AMT NOT = 0.00                                     
LRM003        MOVE SPACES TO CATMATH-RECORD                                     
LRM003        MOVE '0'                     TO CATMATH-CLIENT-NBR(1 : 1)         
LRM003        MOVE CASH-ADP-CL-NO-X        TO CATMATH-CLIENT-NBR(2 : 3)         
LRM003        MOVE CASH-CONTROL-NBR        TO CATMATH-ACATS-CNTL-NBR            
LRM003        MOVE CASH-DLVR-ACCT          TO CATMATH-BRANCH                    
LRM003        MOVE CASH-DLVR-ACCT(4 : 5)   TO CATMATH-ACCOUNT                   
LRM003        MOVE '1'                     TO CATMATH-ACCOUNT-TYPE-FROM         
LRM003                                        CATMATH-ACCOUNT-TYPE-TO           
              SET CATMATH-FEE-IRA-TERMINATION TO TRUE                           
              MOVE CASH-IRA-TRMNT-AMT     TO CATMATH-BALANCE                    
              SET CATMATH-BALANCE-DEBIT TO TRUE                                 
              SET CATMATH-BALANCE-APPLIED-YES TO TRUE                           
              MOVE ZEROS                  TO CATMATH-QUANTITY                   
              MOVE SPACES                 TO CATMATH-QUANTITY-SIGN              
              WRITE CATMATH-RECORD                                              
              ADD 1 TO MATH-RECS-WRTN                                           
           END-IF.                                                              
                                                                                
           IF CASH-IRA-MAINT-AMT NOT = 0.00                                     
LRM003        MOVE SPACES TO CATMATH-RECORD                                     
LRM003        MOVE '0'                     TO CATMATH-CLIENT-NBR(1 : 1)         
LRM003        MOVE CASH-ADP-CL-NO-X        TO CATMATH-CLIENT-NBR(2 : 3)         
LRM003        MOVE CASH-CONTROL-NBR        TO CATMATH-ACATS-CNTL-NBR            
LRM003        MOVE CASH-DLVR-ACCT          TO CATMATH-BRANCH                    
LRM003        MOVE CASH-DLVR-ACCT(4 : 5)   TO CATMATH-ACCOUNT                   
LRM003        MOVE '1'                     TO CATMATH-ACCOUNT-TYPE-FROM         
LRM003                                        CATMATH-ACCOUNT-TYPE-TO           
              SET CATMATH-FEE-IRA-MAINT  TO TRUE                                
              MOVE CASH-IRA-MAINT-AMT     TO CATMATH-BALANCE                    
              SET CATMATH-BALANCE-DEBIT TO TRUE                                 
              SET CATMATH-BALANCE-APPLIED-YES TO TRUE                           
              MOVE ZEROS                  TO CATMATH-QUANTITY                   
              MOVE SPACES                 TO CATMATH-QUANTITY-SIGN              
              WRITE CATMATH-RECORD                                              
              ADD 1 TO MATH-RECS-WRTN                                           
           END-IF.                                                              
                                                                                
LRM004     IF CASH-PAPER-STMNT-FEE-AMT NOT = 0.00                               
LRM004        MOVE SPACES TO CATMATH-RECORD                                     
LRM004        MOVE '0'                     TO CATMATH-CLIENT-NBR(1 : 1)         
LRM004        MOVE CASH-ADP-CL-NO-X        TO CATMATH-CLIENT-NBR(2 : 3)         
LRM004        MOVE CASH-CONTROL-NBR        TO CATMATH-ACATS-CNTL-NBR            
LRM004        MOVE CASH-DLVR-ACCT          TO CATMATH-BRANCH                    
LRM004        MOVE CASH-DLVR-ACCT(4 : 5)   TO CATMATH-ACCOUNT                   
LRM004        MOVE '1'                     TO CATMATH-ACCOUNT-TYPE-FROM         
LRM004                                        CATMATH-ACCOUNT-TYPE-TO           
LRM004        SET CATMATH-FEE-PAPER-STATEMENT TO TRUE                           
LRM004        MOVE CASH-PAPER-STMNT-FEE-AMT TO CATMATH-BALANCE                  
LRM004        SET CATMATH-BALANCE-DEBIT TO TRUE                                 
LRM004        SET CATMATH-BALANCE-APPLIED-YES TO TRUE                           
LRM004        MOVE ZEROS                  TO CATMATH-QUANTITY                   
LRM004        MOVE SPACES                 TO CATMATH-QUANTITY-SIGN              
LRM004        WRITE CATMATH-RECORD                                              
LRM004        ADD 1 TO MATH-RECS-WRTN                                           
LRM004     END-IF.                                                              
                                                                                
           GO TO 0600-PROCESS-CSHA-FILE.                                        
       0600-PROCESS-CSHA-FILE-EXIT. EXIT.                                       
                                                                                
       0700-READ-CSHA-RTN.                                                      
           READ CASH-ADJUSTMENT-FILE                                            
             AT END                                                             
                 MOVE 'Y' TO  CSHA-FILE-EOF-SW                                  
             NOT AT END                                                         
                 ADD 1 TO CSHA-DTL-RECS                                         
           END-READ.                                                            
           IF CSHA-FILE-EOF-SW NOT = 'Y'                                        
           AND CASH-DETAIL-KEY(1 : 4) = 'DATE'                                  
              GO TO 0700-READ-CSHA-RTN                                          
           END-IF.                                                              
       0700-EXIT. EXIT.                                                         
                                                                                
           EJECT                                                                
       1800-END-OF-JOB-ROUTINE.                                                 
                                                                                
           MOVE 'REC-CNT='     TO  CATMATH-RECORD.                              
           MOVE MATH-RECS-WRTN TO  CATMATH-RECORD (9:11).                       
           WRITE CATMATH-RECORD.                                                
                                                                                
           CLOSE TFRS-I-FILE                                                    
                 CASH-ADJUSTMENT-FILE                                           
                 MATH-FILE.                                                     
                                                                                
           DISPLAY 'TFRS ADJUST RECS READ    ' TFRS-DTL-RECS.                   
           DISPLAY 'CSHA BALANCE RECS READ   ' CSHA-DTL-RECS.                   
           DISPLAY 'MATH ADJUSTMENTS WRITTEN ' MATH-RECS-WRTN.                  
                                                                                
       ABEND-RTN.                                                               
           CALL  ABEND  USING ABORT-CODE.                                       
                                                                                
