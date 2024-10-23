       PROCESS ADV,QUOTE,AWO,NOCOMPILE(E),DATA(31),DYNAM,FLAG(I,W)              
       PROCESS LIB,NOMAP,NUMPROC(PFD),OPTIMIZE,RENT,RESIDENT,NOSEQ              
       PROCESS NOSSRANGE,NOVBREF,NOXREF,ZWB                                     
000001* PDX    - CATGACT  C0179556 09/03/02 16:16:16 TBMADAI            00001000
000001* PDX    - CATGACT  C0179488 09/03/02 15:18:15 TBMADAI            00001000
       $DEBUG=OFF                                                               
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID. CATGACT.                                                     
      ***************************************                           00061229
      *  M O D I F I C A T I O N S   L O G  *                           00061329
      ***************************************                           00061429
      *  VER    DATE    PGR  DESCRIPTION                                00061529
      *  ===  ========  ===  ========================================== 00062029
      *  002  05/19/00  SV   Validate CACT-T500-TRANS-CODE.                     
      *                      Set return code to 08 for any errors.              
      *---------------------------------------------------------------          
      *  001  12/06/99  SV   Original Code.                                     
      ****************************************************************          
       ENVIRONMENT DIVISION.                                            00220004
                                                                        00270004
       INPUT-OUTPUT SECTION.                                            00280004
       FILE-CONTROL.                                                    00290004
           SELECT CACT-INP-FILE  ASSIGN TO CACTIN                       00820011
                                 FILE STATUS IS WS-CACT-INP-FILE-STTS.  00830012
                                                                                
       DATA DIVISION.                                                           
       FILE SECTION.                                                    01130004
       FD  CACT-INP-FILE                                                03230010
           BLOCK CONTAINS 0 RECORDS.                                    03260004
      *                                                                 00300011
      *  ACTIVITY FILE                                                  00310011
      *                                                                 00320011
       01  CACT-INP-REC            PIC X(80).                                   
                                                                                
       WORKING-STORAGE SECTION.                                                 
                                                                                
       01  WS-WORK-AREA.                                                        
           05  WS-CONSTANTS.                                                    
               10  WS-SUCC-CONST               PIC 9(4) COMP VALUE 0.           
               10  WS-WARN-CONST               PIC 9(4) COMP VALUE 4.           
002            10  WS-ERR-CONST                PIC 9(4) COMP VALUE 8.           
               10  WS-FATAL-CONST              PIC 9(4) COMP VALUE 16.          
           05  WS-FILE-STTS-GRP.                                        04333011
               10  WS-CACT-INP-FILE-STTS       PIC XX.                          
                   88  CACT-INP-SUCC           VALUE "00".                      
                   88  CACT-INP-EOF            VALUE "10".                      
           05  WS-NUMERIC-GRP.                                                  
               10  WS-CACT-CUR-CNT             PIC 9(4) COMP.                   
               10  WS-CACT-MAX-CNT             PIC 9(4) COMP.                   
           05  WS-DISP-GRP.                                                     
               10  WS-DISP-AMT                 PIC ZZZ9.                        
           05  WS-INDICATORS.                                                   
               10  WS-FIRST-TIME-IND           PIC X VALUE "Y".                 
                   88  FIRST-TIME              VALUE "Y".                       
                   88  NOT-FIRST-TIME          VALUE "N".                       
               10  WS-WARN-OCCURRED-IND        PIC X.                           
                   88  WARN-OCCURRED           VALUE "Y".                       
                   88  NO-WARN-OCCURRED        VALUE "N".                       
002            10  WS-ERR-OCCURRED-IND         PIC X.                           
002                88  ERR-OCCURRED            VALUE "Y".                       
002                88  NO-ERR-OCCURRED         VALUE "N".                       
002        05  T-T500-TRANS-CODE               PIC X(03).                       
           REPLACE ==:TAG:== BY ==T==.                                          
           COPY TT500TYP.                                                       
           REPLACE OFF.                                                         
                                                                                
       01  WS-CACT-TBL.                                                         
           03  WS-CACT-TBL-ENTRY OCCURS 100 INDEXED BY CACT-TBL-IDX.            
           COPY CATGACT.                                                        
                                                                                
       LINKAGE SECTION.                                                         
                                                                                
       01  LK-FIELDS.                                                           
           05  LK-SIS-153-ACT-TYPE-DESC        PIC X(11).                       
           05  LK-SIS-153-DBCR-IND             PIC X(01).                       
           05  LK-T500-TRANS-CODE              PIC X(03).                       
                                                                                
       PROCEDURE DIVISION USING LK-FIELDS.                                      
                                                                                
           IF FIRST-TIME                                                        
                                                                                
               PERFORM 1000-INIT                                                
                  THRU 1000-EXIT                                                
                                                                                
           END-IF                                                               
                                                                                
           PERFORM 2000-CATG-ACT                                                
              THRU 2000-EXIT                                                    
                                                                                
           IF WARN-OCCURRED                                                     
               MOVE WS-WARN-CONST TO RETURN-CODE                                
           END-IF                                                               
                                                                                
002        IF ERR-OCCURRED                                                      
002            MOVE WS-ERR-CONST TO RETURN-CODE                                 
002        END-IF                                                               
                                                                                
           GOBACK.                                                              
                                                                                
      ***************                                                           
       1000-INIT.                                                               
      ***************                                                           
                                                                                
           SET NOT-FIRST-TIME TO TRUE                                           
           SET NO-WARN-OCCURRED TO TRUE                                         
002        SET NO-ERR-OCCURRED TO TRUE                                          
           INITIALIZE WS-NUMERIC-GRP                                            
                                                                                
           OPEN INPUT CACT-INP-FILE                                             
           IF NOT CACT-INP-SUCC                                                 
               DISPLAY "FATAL: CATGACT"                                         
               DISPLAY "Opening Activity Input File Failed."                    
               DISPLAY "File Status = " WS-CACT-INP-FILE-STTS                   
               MOVE WS-FATAL-CONST TO RETURN-CODE                               
               GOBACK                                                           
           END-IF                                                               
                                                                        04541010
           COMPUTE WS-CACT-MAX-CNT =                                            
                         LENGTH OF  WS-CACT-TBL /                               
                         LENGTH OF  WS-CACT-TBL-ENTRY                           
                                                                        04880010
           PERFORM WITH TEST AFTER                                              
                   UNTIL CACT-INP-REC (1:1) NOT = "*"                           
                                                                                
               READ CACT-INP-FILE                                               
                                                                                
               EVALUATE TRUE                                                    
               WHEN CACT-INP-SUCC                                               
                   CONTINUE                                                     
               WHEN CACT-INP-EOF                                                
                   DISPLAY "FATAL: CATGACT"                                     
                   DISPLAY "Activity file is empty."                            
                   DISPLAY "File Status = " WS-CACT-INP-FILE-STTS               
                   MOVE WS-FATAL-CONST TO RETURN-CODE                           
                   GOBACK                                                       
               WHEN OTHER                                                       
                   DISPLAY "FATAL: CATGACT"                                     
                   DISPLAY "Reading Activity Input File Failed."                
                   DISPLAY "File Status = " WS-CACT-INP-FILE-STTS               
                   MOVE WS-FATAL-CONST TO RETURN-CODE                           
                   GOBACK                                                       
               END-EVALUATE                                                     
           END-PERFORM                                                          
                                                                                
           PERFORM UNTIL CACT-INP-EOF OR                                        
                         WS-CACT-CUR-CNT = WS-CACT-MAX-CNT                      
                                                                                
               ADD 1 TO WS-CACT-CUR-CNT                                         
               MOVE CACT-INP-REC TO WS-CACT-TBL-ENTRY                           
                                   (WS-CACT-CUR-CNT)                            
               READ CACT-INP-FILE                                               
               IF NOT (CACT-INP-SUCC OR CACT-INP-EOF)                           
                   DISPLAY "FATAL: CATGACT"                                     
                   DISPLAY "Reading Activity Input File Failed."                
                   DISPLAY "File Status = " WS-CACT-INP-FILE-STTS               
                   MOVE WS-FATAL-CONST TO RETURN-CODE                           
                   GOBACK                                                       
               END-IF                                                           
           END-PERFORM                                                          
                                                                                
           IF CACT-INP-SUCC AND                                                 
              WS-CACT-CUR-CNT = WS-CACT-MAX-CNT                                 
                                                                                
               DISPLAY "FATAL: CATGACT"                                         
               DISPLAY "Activity table overflow."                               
               MOVE WS-CACT-CUR-CNT TO WS-DISP-AMT                              
               DISPLAY "   WS-CACT-CUR-CNT = " WS-DISP-AMT                      
               MOVE WS-CACT-MAX-CNT TO WS-DISP-AMT                              
               DISPLAY "   WS-CACT-MAX-CNT = " WS-DISP-AMT                      
               MOVE WS-FATAL-CONST TO RETURN-CODE                               
               GOBACK                                                           
           ELSE                                                                 
               DISPLAY "INFO: CATGACT"                                          
               MOVE WS-CACT-CUR-CNT TO WS-DISP-AMT                              
               DISPLAY "Activity table entries = " WS-DISP-AMT                  
               DISPLAY SPACE                                                    
           END-IF.                                                              
                                                                                
       1000-EXIT.                                                               
           EXIT.                                                                
                                                                                
      ***************                                                           
       2000-CATG-ACT.                                                           
      ***************                                                           
                                                                                
           MOVE WS-SUCC-CONST TO RETURN-CODE                                    
           SET NO-WARN-OCCURRED TO TRUE                                         
002        SET NO-ERR-OCCURRED TO TRUE                                          
           INITIALIZE LK-T500-TRANS-CODE                                        
                                                                                
           SET CACT-TBL-IDX TO 1                                                
           SEARCH WS-CACT-TBL-ENTRY                                             
               AT END                                                           
002   *DEL         DISPLAY "WARNING: CATGACT"                                   
002                DISPLAY "ERROR: CATGACT"                                     
                   DISPLAY "No match found on Activity Table for "              
                   DISPLAY "Description " LK-SIS-153-ACT-TYPE-DESC              
                           " " LK-SIS-153-DBCR-IND                              
                   DISPLAY SPACE                                                
002   *DEL         SET WARN-OCCURRED TO TRUE                                    
002                SET ERR-OCCURRED TO TRUE                                     
               WHEN ( CACT-SIS-153-ACT-TYPE-DESC (CACT-TBL-IDX)                 
                      = LK-SIS-153-ACT-TYPE-DESC )                              
                AND ((CACT-SIS-153-DBCR-IND (CACT-TBL-IDX)                      
                      = LK-SIS-153-DBCR-IND ) OR                                
                     (CACT-SIS-153-DBCR-IND (CACT-TBL-IDX) = "N"))              
                                                                                
002   *BGN MOD 002                                                              
                   MOVE CACT-T500-TRANS-CODE (CACT-TBL-IDX)                     
                                 TO T-T500-TRANS-CODE                           
                   IF NOT T-T500-VALID-TRANS-CODE                               
                       DISPLAY "ERROR: CATGACT"                                 
                       DISPLAY "Invalid TRANS-CODE " T-T500-TRANS-CODE          
                               " found on Activity Table."                      
                       DISPLAY SPACE                                            
                       SET ERR-OCCURRED TO TRUE                                 
                   END-IF                                                       
002   *END MOD 002                                                              
                   MOVE CACT-T500-TRANS-CODE (CACT-TBL-IDX)                     
                                 TO LK-T500-TRANS-CODE                          
           END-SEARCH.                                                          
                                                                                
       2000-EXIT.                                                               
           EXIT.                                                                
