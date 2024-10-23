000001* PDX    - CAT670   C0334118 07/11/13 13:49:40 TBLAMUR            00001000
LRM004* SSR 86909 DUPE FEE PROBLEM FIX - READ SORTED INTRA-DAY FEE FILE         
LRM004*   TO DROP RECORDS FROM LAST NIGHT'S WRAP FILE CAT820.RET, WHEN          
LRM004*   THE CLIENT/CNTL NBR IS FOUND.                                         
000001* PDX    - CAT670   C0321761 01/24/12 13:18:00 TBLAMUR            00001000
LRM003* SSR 79558 CLIENT 10 JOURNAL TYPE1 TO TYPE4, NEW REC TYPE.               
LRM003*   VERIFY THE ASSET IS STILL ON ACAT IN TYPE1, BEFORE BOOKING.           
000001* PDX    - CAT670   C0302248 10/04/10 15:06:10 TBLAMUR            00001000
LRM002* SSR 72170 DUPLICATE TRANSFER FEE CORRECTION, DROP WRAP                  
LRM002*   RECORDS WHEN TRANSFER STATUS IS REJECTED.                     00001000
LRM001* SSR 71810 ACAT FOREIGN ASSET FEES. EXPANDED WRAP FILE TO                
LRM001*  640 BYTES. VERIFY DELIVERY ASSET NOT DELETED FROM TRANSFER             
LRM001*  BY VIA LOOKUP ON VASSET (WE ADDED ADP NUMBER AND TYPE TO               
LRM001*  RET FILE FOR THIS PURPOSE).                                            
000001* PDX    - CAT670   C0158538 05/08/01 11:57:46 TBLAMUR            00001000
000001* PDX    - CAT670   C0155949 03/16/01 12:07:09 TBLAMUR            00001000
000001* PDX    - CAT670   C0121138 01/31/99 16:14:34 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT670.                                                     
       AUTHOR.      LARRY MUREY.                                                
       DATE-WRITTEN.  JAN 1999.                                                 
                                                                                
      *----------------------------------------------------------------         
      * THE PURPOSE OF THIS PROGRAM IS TO CREATE BOOKING FILES FROM             
      * THE WRAP AROUND REPOSITORY OF P2 RECORDS OUT OF CAT820.                 
      * THESE ARE TYPE3 BALANCE MOVEMENT, FEES AND FRACTIONAL QTY               
      * RECORDS WHICH WERE HELD UNTIL SETTLEMENT DATE = PROCESS DATE.           
      * THE CLIENT/CONTROL # IS USED TO OBTAIN THE TIF SETTLE DATE FROM         
      * DB2. WHEN EQUAL, WRITE THESE RECORDS ON THE P2 OR TACT FILES AS         
      * NEEDED. WHEN ACTIVE TIF NOT FOUND, DROP THIS DATA. OTHERWISE            
      * RETAIN THIS RECORD.                                                     
      *----------------------------------------------------------------         
           EJECT                                                                
      *****************************************************************         
       ENVIRONMENT DIVISION.                                                    
      *****************************************************************         
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT P2WRAP-FILE                ASSIGN  TO  P2WRAPI.               
LRM004     SELECT INTRA-DAY-FEE-IN           ASSIGN  TO  IDFEE.                 
           SELECT RETAIN-FILE                ASSIGN  TO  P2WRAPO.               
           SELECT P2BKPG-FILE                ASSIGN  TO  P2OUT.                 
TBD*****   SELECT TACTOUT-FILE               ASSIGN  TO  TACT.                  
                                                                                
                                                                                
      *****************************************************************         
       DATA DIVISION.                                                           
      *****************************************************************         
                                                                                
       FILE SECTION.                                                            
                                                                                
       FD  P2WRAP-FILE                                                          
           RECORDING MODE IS V                                                  
           LABEL RECORDS STANDARD                                               
           BLOCK CONTAINS 0 RECORDS.                                            
LRM001 01  WRAP-P2-REC                  PIC X(640).                             
       01  WRAP-TACT-REC.                                                       
           05  FILLER                   PIC X(26).                              
           05  WRAP-TACT-DETAIL         PIC X(400).                             
       01  WRAP-HDR-REC                 PIC X(50).                              
       01  WRAP-RECORD-FIELDS.                                                  
           05  WRAP-CLIENT             PIC X(03).                               
           05  WRAP-BRANCH             PIC X(03).                               
           05  WRAP-ACCOUNT            PIC X(05).                               
           05  WRAP-CONTROL-NBR        PIC X(14).                               
LRM001     05  WRAP-P2-REC-TYPE        PIC X(05).                               
LRM001         88  WRAP-P2-FRGN-FEE                  VALUE 'FRGN '.             
LRM003         88  WRAP-P2-TYPE4-JRNL                VALUE 'TYPE4'.             
LRM001     05  WRAP-P2-ADP-NBR         PIC X(07).                               
LRM001     05  WRAP-P2-ACCOUNT-TYPE    PIC X(01).                               
           05  WRAP-RECORD-TYPE        PIC X.                                   
               88  WRAP-P2-RCR       VALUE 'R'.                                 
               88  WRAP-P2-RECORD    VALUE 'B'.                                 
               88  WRAP-TACT-RECORD  VALUE 'T'.                                 
           05  WRAP-P2-COUNT           PIC 9.                                   
           05  WRAP-P2-ENTRY OCCURS 5 TIMES                                     
                                       PIC X(120).                              
       FD  RETAIN-FILE                                                          
           RECORDING MODE IS V                                                  
           LABEL RECORDS STANDARD                                               
           BLOCK CONTAINS 0 RECORDS.                                            
LRM001 01  RET-P2-REC                  PIC X(640).                              
       01  RET-TACT-REC                PIC X(426).                              
       01  RET-HDR-REC                 PIC X(11).                               
                                                                                
LRM004 FD  INTRA-DAY-FEE-IN                                                     
LRM004     RECORDING MODE IS V                                                  
LRM004     LABEL RECORDS STANDARD                                               
LRM004     BLOCK CONTAINS 0 RECORDS.                                            
LRM004 01  INT-P2-REC                  PIC X(640).                              
LRM004 01  INT-P2-KEY.                                                          
           05  INT-CLIENT              PIC X(03).                               
           05  INT-BRANCH              PIC X(03).                               
           05  INT-ACCOUNT             PIC X(05).                               
           05  INT-CONTROL-NBR         PIC X(14).                               
LRM004 01  INT-TACT-REC                PIC X(426).                              
LRM004 01  INT-HDR-REC                 PIC X(11).                               
                                                                                
       FD  P2BKPG-FILE                                                          
           RECORDING MODE IS F                                                  
           LABEL RECORDS STANDARD                                               
           BLOCK CONTAINS 0 RECORDS                                             
           RECORD CONTAINS 120 CHARACTERS.                                      
       01  P2BKPG-RECORD               PIC X(120).                              
                                                                                
           EJECT                                                                
      ******************************************************************        
       WORKING-STORAGE SECTION.                                                 
      ******************************************************************        
                                                                                
       77  ABEND-CODE              COMP  PIC S9(4)   VALUE +9999.               
                                                                                
       77  ACAT-PROC-DATE                   PIC X(08)  VALUE ' '.               
                                                                                
       77  WS-TACT-DDNAME             PIC X(08) VALUE 'TACT  '.                 
       77  WS-RECORDS-READ       COMP-3  PIC  9(09)  VALUE ZEROES.              
       77  WS-RECORDS-DROPPED    COMP-3  PIC  9(09)  VALUE ZEROES.              
       77  WS-SETTLE-TODAY       COMP-3  PIC  9(09)  VALUE ZEROES.              
       77  WS-RECORDS-RETAINED   COMP-3  PIC  9(09)  VALUE ZEROES.              
       77  WS-CLIENT             PIC X(04).                                     
       77  WS-CONTROL-NBR        PIC X(14).                                     
LRM001 77  WS-ADP-NBR            PIC X(07).                                     
LRM001 77  WS-ASSET-TYPE         PIC X(01).                                     
LRM001 77  WS-POSITION-FOUND-SW    PIC X(01).                                   
LRM001     88  WS-POSITION-NOT-FOUND          VALUE 'N'.                        
LRM001     88  WS-POSITION-FOUND              VALUE 'Y'.                        
       77  SUB                   COMP-3  PIC S9(03)  VALUE ZEROES.              
       77  P2-RECS-WRTN          PIC 9(11) VALUE ZERO.                          
LRM004 77  INTRA-DAY-FEE-EOF-SW  PIC X     VALUE 'N'.                           
LRM004     88  INTRA-DAY-FEE-EOF           VALUE 'Y'.                           
                                                                                
       01  DATE-WORK-AREA.                                                      
           03  WORK-DATE-MMDDYY            PIC X(6).                            
           03  WS-ACAT-STTLM-DATE          PIC X(10).                           
                                                                                
           COPY STUBCPY.                                                        
           EJECT                                                                
           COPY TACTIOC REPLACING ==:TACTIO:== BY ==TACTIO==.                   
                                                                                
002705     COPY RECTACT  REPLACING ==:CI:== BY ==T2==.                  00200000
                                                                                
           EJECT                                                                
           COPY BPDATESC.                                                       
                                                                                
           SKIP3                                                                
           COPY RECDATZC.                                                       
                                                                                
       01  DSNTIAR                       PIC X(08)  VALUE 'DSNTIAR'.            
       01  WS-DB2-MESSAGE-AREA.                                                 
           05  WS-DB2-MSG-LEN            PIC S9(04) COMP VALUE +960.            
           05  WS-ERROR-MSG              PIC X(80)  OCCURS 12 TIMES             
               INDEXED BY WS-ERROR-INDEX.                                       
       01  WS-ERR-LINE-LEN               PIC S9(09) COMP VALUE +80.             
                                                                                
           EJECT                                                                
      *DB2 COMMUNICATION AREA                                                   
           EXEC SQL                                                             
              INCLUDE SQLCA                                                     
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
           EXEC SQL                                                             
              INCLUDE VTRNFR                                                    
           END-EXEC.                                                            
                                                                                
LRM001     EXEC SQL                                                             
LRM001        INCLUDE VASSET                                                    
LRM001     END-EXEC.                                                            
                                                                                
           EJECT                                                                
       PROCEDURE DIVISION.                                                      
                                                                                
           COPY MSGCOBO.                                                        
                                                                                
           PERFORM INITIAL-ROUTINE.                                             
           PERFORM PROCESS-ROUTINE                                              
              THRU PROCESS-ROUTINE-EXIT.                                        
           PERFORM ENDJOB-ROUTINE.                                              
                                                                                
           GOBACK.                                                              
                                                                                
           EJECT                                                                
       PROCESS-ROUTINE.                                                         
           READ P2WRAP-FILE                                                     
              AT END GO TO PROCESS-ROUTINE-EXIT.                                
                                                                                
           ADD 1 TO WS-RECORDS-READ.                                            
           MOVE '0'              TO WS-CLIENT.                                  
           MOVE WRAP-CLIENT      TO WS-CLIENT(2 : 3).                           
           MOVE WRAP-CONTROL-NBR TO WS-CONTROL-NBR.                             
                                                                                
           EXEC SQL                                                             
              SELECT                                                            
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,STTLM_DT                                                   
LRM002              ,STTS_CD                                                    
                 INTO                                                           
                     :DCLVTRNFR.CLIENT-NBR                                      
                    ,:DCLVTRNFR.ACAT-CONTROL-NBR                                
                    ,:DCLVTRNFR.STTLM-DT                                        
LRM002              ,:DCLVTRNFR.STTS-CD                                         
                 FROM VTRNFR                                                    
                 WHERE (CLIENT_NBR =                                            
                            :WS-CLIENT                                          
                   AND ACAT_CONTROL_NBR =                                       
                            :WS-CONTROL-NBR)                                    
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
                 WHEN +100                                                      
                    ADD 1 TO WS-RECORDS-DROPPED                                 
                 WHEN +0                                                        
                    PERFORM CHECK-SETTLE-DATE-RTN                               
                 WHEN OTHER                                                     
                    MOVE 2500 TO ABEND-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
           GO TO PROCESS-ROUTINE.                                               
                                                                                
       PROCESS-ROUTINE-EXIT. EXIT.                                              
                                                                                
       CHECK-SETTLE-DATE-RTN.                                                   
           IF STTLM-DT OF DCLVTRNFR = WS-ACAT-STTLM-DATE                        
              ADD 1 TO WS-SETTLE-TODAY                                          
LRM001        IF WRAP-P2-FRGN-FEE                                               
LRM003        OR WRAP-P2-TYPE4-JRNL                                             
LRM001           SET WS-POSITION-NOT-FOUND TO TRUE                              
LRM001           PERFORM LOOKUP-ASSET-RTN                                       
LRM001           IF WS-POSITION-FOUND                                           
LRM001              PERFORM CREATE-TIF-RTN                                      
LRM001           END-IF                                                         
LRM001        ELSE                                                              
              PERFORM CREATE-TIF-RTN                                            
           ELSE                                                                 
LRM002     IF STTS-CD OF DCLVTRNFR = '140' OR '600'                             
LRM002        ADD 1 TO WS-RECORDS-DROPPED                                       
LRM002     ELSE                                                                 
              IF WRAP-P2-RECORD                                                 
LRM004           PERFORM                                                        
LRM004              UNTIL INTRA-DAY-FEE-EOF                                     
LRM004                OR INT-CLIENT > WRAP-CLIENT                               
LRM004                OR (INT-CLIENT = WRAP-CLIENT                              
LRM004                 AND INT-CONTROL-NBR NOT < WRAP-CONTROL-NBR)              
LRM004              READ INTRA-DAY-FEE-IN                                       
LRM004                AT END SET INTRA-DAY-FEE-EOF TO TRUE                      
LRM004              END-READ                                                    
LRM004           END-PERFORM                                                    
LRM004           IF NOT INTRA-DAY-FEE-EOF                                       
LRM004           AND INT-CLIENT = WRAP-CLIENT                                   
LRM004           AND INT-CONTROL-NBR = WRAP-CONTROL-NBR                         
LRM004              ADD 1 TO WS-RECORDS-DROPPED                                 
LRM004              DISPLAY 'DROPPED FEE REC ' WRAP-CLIENT                      
LRM004                 ' ' WRAP-CONTROL-NBR ' ON MATCH TO INTRA-DAY FEE'        
LRM004           ELSE                                                           
                    WRITE RET-P2-REC FROM WRAP-P2-REC                           
                    ADD 1 TO WS-RECORDS-RETAINED                                
LRM004           END-IF                                                         
              ELSE                                                              
              IF WRAP-TACT-RECORD                                               
                 WRITE RET-TACT-REC FROM WRAP-TACT-REC                          
                 ADD 1 TO WS-RECORDS-RETAINED                                   
           END-IF.                                                              
                                                                                
LRM001 LOOKUP-ASSET-RTN.                                                        
LRM001     MOVE WRAP-P2-ADP-NBR      TO WS-ADP-NBR                              
LRM001     MOVE WRAP-P2-ACCOUNT-TYPE TO WS-ASSET-TYPE                           
LRM003     IF WRAP-P2-TYPE4-JRNL                                                
LRM003        EXEC SQL                                                          
LRM003        SELECT                                                            
LRM003           CLIENT_NBR                                                     
LRM003           INTO                                                           
LRM003               :DCLVASSET.CLIENT-NBR                                      
LRM003           FROM VASSET                                                    
LRM003           WHERE (CLIENT_NBR =                                            
LRM003                      :WS-CLIENT                                          
LRM003             AND ACAT_CONTROL_NBR =                                       
LRM003                      :WS-CONTROL-NBR                                     
LRM003             AND SECURITY_ADP_NBR =                                       
LRM003                      :WS-ADP-NBR                                         
LRM003             AND CSH_MGN_SHRT_CD  =                                       
LRM003                      :WS-ASSET-TYPE                                      
LRM003             AND STTLM_LCTN_CD = '50')                                    
LRM003        END-EXEC                                                          
LRM003     ELSE                                                                 
LRM001        EXEC SQL                                                          
LRM001        SELECT                                                            
LRM001           CLIENT_NBR                                                     
LRM001           INTO                                                           
LRM001               :DCLVASSET.CLIENT-NBR                                      
LRM001           FROM VASSET                                                    
LRM001           WHERE (CLIENT_NBR =                                            
LRM001                      :WS-CLIENT                                          
LRM001             AND ACAT_CONTROL_NBR =                                       
LRM001                      :WS-CONTROL-NBR                                     
LRM001             AND SECURITY_ADP_NBR =                                       
LRM001                      :WS-ADP-NBR                                         
LRM001             AND CSH_MGN_SHRT_CD  =                                       
LRM001                      :WS-ASSET-TYPE                                      
LRM001             AND NOT STTLM_LCTN_CD = '45')                                
LRM001        END-EXEC                                                          
LRM003     END-IF.                                                              
LRM001                                                                          
LRM001     EVALUATE SQLCODE                                                     
LRM001           WHEN +100                                                      
LRM001              ADD 1 TO WS-RECORDS-DROPPED                                 
LRM003              IF WRAP-P2-TYPE4-JRNL                                       
LRM003                 DISPLAY 'TYPE1-4 JOURNAL DROPPED '                       
LRM003                     WS-CLIENT ' ' WS-CONTROL-NBR ' '                     
LRM003                     WS-ADP-NBR ' ' WS-ASSET-TYPE                         
LRM003              ELSE                                                        
LRM001                 DISPLAY 'FOREIGN FEE RECORD DROPPED '                    
LRM001                     WS-CLIENT ' ' WS-CONTROL-NBR ' '                     
LRM001                     WS-ADP-NBR ' ' WS-ASSET-TYPE                         
LRM003              END-IF                                                      
LRM001           WHEN +0                                                        
LRM001           WHEN -811                                                      
LRM001              SET WS-POSITION-FOUND TO TRUE                               
LRM001           WHEN OTHER                                                     
LRM001              MOVE 2700 TO ABEND-CODE                                     
LRM001              PERFORM SQL-ERROR-ROUTINE                                   
LRM001     END-EVALUATE.                                                        
                                                                                
       CREATE-TIF-RTN.                                                          
           IF WRAP-P2-RECORD                                                    
              PERFORM VARYING SUB FROM 1 BY 1                                   
                 UNTIL SUB GREATER WRAP-P2-COUNT                                
                   WRITE P2BKPG-RECORD  FROM WRAP-P2-ENTRY(SUB)                 
                   END-WRITE                                                    
                   ADD 1 TO P2-RECS-WRTN                                        
              END-PERFORM                                                       
           ELSE                                                                 
           IF WRAP-TACT-RECORD                                                  
              PERFORM 0950-CREATE-TACT-RECORD                                   
           END-IF.                                                              
                                                                                
       0950-CREATE-TACT-RECORD.                                                 
                                                                                
           MOVE WRAP-TACT-DETAIL TO TACT-RECORD.                                
                                                                                
           MOVE 'CAT820'         TO    TACTIO-CALLING-PGM-NAME.                 
           MOVE WS-TACT-DDNAME   TO    TACTIO-DDNAME.                           
           MOVE 'O'              TO    TACTIO-FILE-TYPE.                        
           MOVE 'Y'              TO    TACTIO-OUTPUT-TRUNCATION.                
           MOVE 'W'              TO    TACTIO-FUNCTION-CODE.                    
           SET TACTIO-VAR TO TRUE.                                              
           CALL  TACTIO          USING TACTIO-PARAMETERS                        
                                       TACT-RECORD.                             
           EJECT                                                                
      *******************                                                       
       SQL-ERROR-ROUTINE.                                                       
      *******************                                                       
                                                                                
           DISPLAY 'SQLCODE IS ' SQLCODE.                                       
                                                                                
           CALL DSNTIAR               USING  SQLCA                              
                                             WS-DB2-MESSAGE-AREA                
                                             WS-ERR-LINE-LEN                    
                                                                                
           DISPLAY ' '                                                          
                                                                                
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                           
              UNTIL WS-ERROR-INDEX GREATER THAN 12                              
                 IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES                      
                    DISPLAY '*** ' WS-ERROR-MSG (WS-ERROR-INDEX)                
                 END-IF                                                         
           END-PERFORM                                                          
                                                                                
           DISPLAY ' '                                                          
           DISPLAY '*** PROGRAM IS ABENDING'                                    
           DISPLAY ' '                                                          
                                                                                
           EXEC SQL  ROLLBACK  END-EXEC                                         
           CALL ABEND USING ABEND-CODE                                          
                                                                                
           .                                                                    
                                                                                
           EJECT                                                                
      *****************                                                         
       INITIAL-ROUTINE.                                                         
      *****************                                                         
                                                                                
           MOVE  'CAT670'                     TO BPDATES-CALLING-PGM.           
           MOVE  'C'                          TO BPDATES-REQ-TYPE.              
                                                                                
           CALL    BPDATES            USING BPDATES-PARAMETERS.                 
           MOVE BPD-PROC-DATE TO  ACAT-PROC-DATE                                
                                                                                
           MOVE ACAT-PROC-DATE(1 : 4) TO  WS-ACAT-STTLM-DATE(1 : 4).            
           MOVE ACAT-PROC-DATE(3 : 2) TO  WORK-DATE-MMDDYY(5 : 2).              
           MOVE '-'                   TO  WS-ACAT-STTLM-DATE(5 : 1)             
                                          WS-ACAT-STTLM-DATE(8 : 1)             
           MOVE ACAT-PROC-DATE(5 : 2) TO  WS-ACAT-STTLM-DATE(6 : 2)             
                                          WORK-DATE-MMDDYY(1 : 2).              
           MOVE ACAT-PROC-DATE(7 : 2) TO  WS-ACAT-STTLM-DATE(9 : 2)             
                                          WORK-DATE-MMDDYY(3 : 2).              
                                                                                
           DISPLAY 'PROCESS DATE ' WS-ACAT-STTLM-DATE.                          
                                                                                
           OPEN INPUT P2WRAP-FILE.                                              
LRM004     OPEN INPUT INTRA-DAY-FEE-IN                                          
           OPEN OUTPUT RETAIN-FILE.                                             
           OPEN OUTPUT P2BKPG-FILE.                                             
           MOVE SPACES   TO  P2BKPG-RECORD.                                     
           MOVE 'DATE='  TO  P2BKPG-RECORD.                                     
           MOVE WORK-DATE-MMDDYY TO P2BKPG-RECORD (6:6).                        
           WRITE P2BKPG-RECORD.                                                 
           PERFORM 0250-OPEN-TACT.                                              
                                                                                
       0250-OPEN-TACT.                                                          
           MOVE 'CAT670 '       TO    TACTIO-CALLING-PGM-NAME.                  
           MOVE WS-TACT-DDNAME  TO    TACTIO-DDNAME.                            
           MOVE 'O'             TO    TACTIO-FUNCTION-CODE.                     
           MOVE 'V'             TO    TACTIO-FILE-TYPE.                         
           MOVE 'Y'             TO    TACTIO-OUTPUT-TRUNCATION.                 
           MOVE 'V'             TO    TACTIO-FILE-FORMAT.                       
           CALL  TACTIO         USING TACTIO-PARAMETERS                         
                                      TACT-RECORD.                              
                                                                                
           MOVE 'H'             TO    TACTIO-FUNCTION-CODE.                     
           MOVE 'O'             TO    TACTIO-FILE-TYPE.                         
           CALL  TACTIO         USING TACTIO-PARAMETERS                         
                                      TACT-RECORD.                              
           EJECT                                                                
      ****************                                                          
       ENDJOB-ROUTINE.                                                          
      ****************                                                          
                                                                                
           MOVE 'REC-CNT='   TO  P2BKPG-RECORD.                                 
           MOVE P2-RECS-WRTN TO  P2BKPG-RECORD (9:11).                          
           WRITE P2BKPG-RECORD.                                                 
                                                                                
           CLOSE  P2WRAP-FILE.                                                  
           CLOSE  RETAIN-FILE.                                                  
           CLOSE  P2BKPG-FILE.                                                  
LRM004     CLOSE INTRA-DAY-FEE-IN                                               
           PERFORM 3000-CLOSE-TACT.                                             
                                                                                
           DISPLAY ' '                                                          
           DISPLAY '   DB2 INPUT TOTALS'                                        
           DISPLAY '   -----------------'                                       
           DISPLAY 'WRAP RECORDS READ   : ' WS-RECORDS-READ.                    
           DISPLAY 'WRAP RECORDS DROPPED: ' WS-RECORDS-DROPPED.                 
           DISPLAY 'WRAP RECORDS RETAIN : ' WS-RECORDS-RETAINED.                
           DISPLAY 'RECORDS SETTLE TODAY: ' WS-SETTLE-TODAY.                    
                                                                                
           DISPLAY ' '                                                          
           DISPLAY '***************************'                                
           DISPLAY '* END OF CAT670 PROGRAM *'                                  
           DISPLAY '***************************'                                
           DISPLAY ' '.                                                         
                                                                                
       3000-CLOSE-TACT.                                                         
           MOVE 'BPU30'         TO    TACTIO-CALLING-PGM-NAME.                  
                                                                                
           MOVE WS-TACT-DDNAME  TO    TACTIO-DDNAME.                            
           MOVE 'O'             TO    TACTIO-FILE-TYPE.                         
           MOVE 'T'             TO    TACTIO-FUNCTION-CODE.                     
           CALL  TACTIO         USING TACTIO-PARAMETERS                         
                                      TACT-RECORD.                              
                                                                                
           MOVE 'C'             TO    TACTIO-FUNCTION-CODE.                     
           CALL  TACTIO         USING TACTIO-PARAMETERS                         
                                      TACT-RECORD.                              
                                                                                
