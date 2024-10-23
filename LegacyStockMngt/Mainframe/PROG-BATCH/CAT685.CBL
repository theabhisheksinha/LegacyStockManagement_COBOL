000001* PDX    - CAT685   C0348882 12/06/13 06:48:10 TBCHKOP            00001000
CSG001* SSR 91356 MOVE SPACES TO BPDATES-CALENDAR-TYPE.                         
000001* PDX    - CAT685   C0272055 10/22/08 15:01:58 TBLAMUR            00001000
LRM002* SSR 60125 RECOMPILE FOR EXPANSION TO ACATPEND                           
000001* PDX    - CAT685   C0226844 11/11/05 08:33:40 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    CAT685.                                                   
       DATE-WRITTEN.  OCTOBER 2005.                                             
                                                                                
      *****************************************************************         
      *                         REMARKS                               *         
      *****************************************************************         
      *  THIS PROGRAM READS CAT650 BOOKING FILE AND CREATES RESCIND   *         
      *  BLOCK TYPE=F ROWS FOR SETTLED FRV RECEIVER SIDE ASSETS, TO   *         
      *  PREVENT THESE ASSETS FROM BEING SWEPT BACK OUT ON AM RCR.    *         
      *  THIS LOGIC WAS REMOVED FROM CAT874, BECAUSE OF TIMING ISSUE, *         
      *  AS THE BLOCK WAS CREATED AFTER THE RCR, AND THE ASSET SWEPT  *         
      *  ON THE SETTLEMENT NIGHT.                                     *         
      *****************************************************************         
                                                                                
           EJECT                                                                
      *****************************************************************         
       ENVIRONMENT DIVISION.                                                    
      *****************************************************************         
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
LRM001     SELECT PEND-FILE                     ASSIGN  TO  IPEND.              
                                                                                
      *****************************************************************         
       DATA DIVISION.                                                           
      *****************************************************************         
                                                                                
       FILE SECTION.                                                            
                                                                                
                                                                                
LRM001 FD  PEND-FILE                                                            
LRM001     RECORDING MODE V                                                     
LRM001     BLOCK CONTAINS 0 RECORDS.                                            
LRM001                                                                          
LRM001     COPY ACATPEND  REPLACING ==:FMT:== BY ==PEND==.                      
                                                                                
           EJECT                                                                
      ******************************************************************        
       WORKING-STORAGE SECTION.                                                 
      ******************************************************************        
                                                                                
       01  ABEND-CODE               COMP    PIC S9(04)  VALUE +9999.            
       01  WS-TMSTMP                        PIC  X(26)  VALUE SPACES.           
       01  WS-CLIENT-NBR                    PIC  X(03)  VALUE SPACES.           
       01  WS-CUSIP                         PIC  X(09)  VALUE SPACES.           
                                                                                
       01  FILLER                           PIC  X(12)  VALUE                   
           'SWITCHES'.                                                          
                                                                                
       01  FILLER.                                                              
LRM001     05  EOF-PEND-SW                  PIC  X(01)  VALUE 'N'.              
LRM001         88  EOF-PEND                             VALUE 'Y'.              
LRM001     05  RESCIND-BLOCK-SW             PIC  X(01)  VALUE 'N'.              
LRM001         88  CREATE-RESCIND-BLOCK                 VALUE 'Y'.              
LRM001         88  BYPASS-RESCIND-BLOCK                 VALUE 'N'.              
                                                                                
       01  FILLER                           PIC  X(12)  VALUE                   
           'COUNTERS'.                                                          
                                                                                
       01  FILLER.                                                              
LRM001     05  PEND-RECS-READ        COMP-3 PIC  9(09)  VALUE ZERO.             
LRM001     05  CAGE-VRSDBLK-INSERTED COMP-3 PIC  9(09)  VALUE ZERO.             
                                                                                
       01  FILLER                           PIC  X(12)  VALUE                   
           'DATES'.                                                             
                                                                                
       01  FILLER.                                                              
           05  BP-DATE.                                                         
               10  BP-DATE-CC               PIC  X(02).                         
               10  BP-DATE-YY               PIC  X(02).                         
               10  BP-DATE-MM               PIC  X(02).                         
               10  BP-DATE-DD               PIC  X(02).                         
                                                                                
           05  WS-STTLM-DATE                PIC  9(08).                         
                                                                                
LRM001     05  PROC-DATE-PLUS-180DAYS.                                          
LRM001         10  PD180-CC              PIC X(2).                              
LRM001         10  PD180-YY              PIC X(2).                              
LRM001         10  PD180-MM              PIC X(2).                              
LRM001         10  PD180-DD              PIC X(2).                              
LRM001     05  W-DB2-PD180-DATE          PIC X(10).                             
LRM001     05  FILLER REDEFINES W-DB2-PD180-DATE.                               
LRM001         07  W-DB2-PD180-YEAR.                                            
LRM001             09  W-DB2-PD180-CC    PIC X(2).                              
LRM001             09  W-DB2-PD180-YY    PIC X(2).                              
LRM001         07  W-DB2-PD180-S1        PIC X(1).                              
LRM001         07  W-DB2-PD180-MM        PIC X(2).                              
LRM001         07  W-DB2-PD180-S2        PIC X(1).                              
LRM001         07  W-DB2-PD180-DD        PIC X(2).                              
                                                                                
       01  DB-CRSR-AREA.                                                        
           05  DB-CLIENT-NBR                PIC  X(04).                         
           05  DB-RCV-NBR                   PIC  X(04).                         
           05  DB-DLVR-NBR                  PIC  X(04).                         
           05  DB-ACAT-CONTROL-NBR          PIC  X(14).                         
           05  DB-ASSET-SEQ-NBR             PIC S9(04)  COMP.                   
           05  DB-ISIN-SEC-ISSUE-CD         PIC  X(9).                          
           05  DB-STTLM-DT                  PIC  X(10).                         
           05  DB-DSTBN-SIDE-CD             PIC  X(01).                         
                                                                                
       01  DB-WORK-AREA.                                                        
LRM001     05  DB-BRANCH-CD                 PIC  X(03).                         
LRM001     05  DB-ACCT-CD                   PIC  X(05).                         
LRM001     05  DB-ADP-NO                    PIC  X(07).                         
LRM001     05  DB-CUSIP                     PIC  X(09).                         
LRM001     05  DB-COMMENT                   PIC X(120) VALUE                    
LRM001         'FAIL REVERSAL   '.                                              
LRM001     05  FILLER REDEFINES DB-COMMENT.                                     
LRM001         07  FILLER                   PIC  X(16).                         
LRM001         07  DB-COMMENT-CAGE-MSG      PIC  X(13).                         
LRM001             88  DB-COMMENT-CAGE-TAG  VALUE 'CAGE TAG NBR:'.              
LRM001         07  DB-COMMENT-CAGE-TAG-NO   PIC  X(11).                         
LRM001         07  FILLER                   PIC  X(80).                         
                                                                                
LRM001 01  DB2-COMMIT-AREA.                                                     
LRM001     05  WS-COMMIT-CTR             PIC S9(4)  COMP  VALUE ZERO.           
LRM001     05  WS-COMMIT-TOT-CTR         PIC S9(4)  COMP  VALUE ZERO.           
                                                                                
       01  WS-DB2-MESSAGE-AREA.                                                 
           05  WS-DB2-MSG-LEN       COMP    PIC S9(04)  VALUE +960.             
           05  WS-ERROR-MSG                 PIC  X(80)  OCCURS 12 TIMES         
               INDEXED BY WS-ERROR-INDEX.                                       
       01  WS-ERR-LINE-LEN                  PIC S9(09) COMP VALUE +80.          
                                                                                
           EJECT                                                                
           COPY BPDATESC.                                                       
                                                                                
      *DB2 COMMUNICATION AREA                                                   
           EJECT                                                                
           EXEC SQL                                                             
              INCLUDE SQLCA                                                     
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
LRM001     EXEC SQL                                                             
LRM001        INCLUDE VRSDBLK                                                   
LRM001     END-EXEC.                                                            
                                                                                
      /                                                                         
      ***--->COBOL LE                                                           
       01  W-ABEND-AREA.                                                        
           03  ABEND-CD                  PIC S9(04) COMP SYNC.                  
                                                                                
           COPY STUBCPY.                                                        
           03  DSNTIAR                   PIC X(008) VALUE 'DSNTIAR'.            
      ***<---COBOL LE                                                           
           EJECT                                                                
      *****************************************************************         
       PROCEDURE DIVISION.                                                      
      *****************************************************************         
                                                                                
           COPY MSGCOBO.                                                        
                                                                                
           PERFORM INITIAL-ROUTINE.                                             
                                                                                
                                                                                
LRM001     PERFORM PROCESS-PEND-FILE THRU PROCESS-PEND-EXIT                     
LRM001        UNTIL EOF-PEND.                                                   
                                                                                
           PERFORM ENDJOB-ROUTINE.                                              
                                                                                
           GOBACK.                                                              
                                                                                
           EJECT                                                                
LRM001     EJECT                                                                
LRM001 PROCESS-PEND-FILE.                                                       
LRM001*--------------------------------------------------------------           
LRM001* THIS ROUTINE READS THRU THE BOOKING FILE FOR SETTLED FRV(S)             
LRM001* INITIATED BY OUR CLIENT (THE DSTBN IS BACKWARDS), TO CREATE             
LRM001* RESCIND BLOCK "F" FAIL REVERSALS.                                       
LRM001*--------------------------------------------------------------           
LRM001     IF PEND-HEADER-ID                                                    
LRM001       SET BYPASS-RESCIND-BLOCK TO TRUE                                   
LRM001     END-IF.                                                              
LRM001                                                                          
LRM001     IF PEND-TI-RECORD-ID                                                 
LRM001       IF  PEND-TRNFR-TYPE = 'FRV'                                        
LRM001       AND PEND-DSTBN-SIDE-CD = 'R'                                       
LRM001       AND PEND-SETTL-DATE = BP-DATE                                      
LRM001         SET CREATE-RESCIND-BLOCK TO TRUE                                 
LRM001         MOVE '0'                     TO DB-CLIENT-NBR(1 : 1)             
LRM001         MOVE PEND-TI-ADP-CL-NO-X     TO DB-CLIENT-NBR(2 : 3)             
LRM001         MOVE PEND-TI-CUST-ACCOUNT(1 : 3) TO DB-BRANCH-CD                 
LRM001         MOVE PEND-TI-CUST-ACCOUNT(4 : 5) TO DB-ACCT-CD                   
LRM001         MOVE PEND-TI-BROKER-CLEAR-NO     TO DB-DLVR-NBR                  
LRM001         MOVE PEND-CONTRA-BRK-NUM         TO DB-RCV-NBR                   
LRM001       ELSE                                                               
LRM001         SET BYPASS-RESCIND-BLOCK TO TRUE                                 
LRM001       END-IF                                                             
LRM001     END-IF.                                                              
LRM001                                                                          
LRM001     IF PEND-AT-RECORD-ID                                                 
LRM001     AND CREATE-RESCIND-BLOCK                                             
LRM001        MOVE PEND-CUSIP-NUM              TO DB-CUSIP                      
LRM001        MOVE PEND-ADP-SEC-NO             TO DB-ADP-NO                     
LRM001        IF PEND-CAGE-TAG > SPACES                                         
LRM001           SET DB-COMMENT-CAGE-TAG TO TRUE                                
LRM001           MOVE PEND-CAGE-TAG TO DB-COMMENT-CAGE-TAG-NO                   
LRM001        ELSE                                                              
LRM001           MOVE SPACES        TO DB-COMMENT-CAGE-MSG                      
LRM001                                 DB-COMMENT-CAGE-TAG-NO                   
LRM001        END-IF                                                            
LRM001        PERFORM CREATE-RESCIND-BLOCK-FRV                                  
LRM001     END-IF.                                                              
LRM001                                                                          
LRM001     READ PEND-FILE                                                       
LRM001       AT END                                                             
LRM001          SET EOF-PEND TO TRUE                                            
LRM001       NOT AT END                                                         
LRM001          ADD +1 TO PEND-RECS-READ                                        
LRM001     END-READ.                                                            
LRM001                                                                          
LRM001 PROCESS-PEND-EXIT. EXIT.                                                 
LRM001                                                                          
LRM001 CREATE-RESCIND-BLOCK-FRV.                                                
LRM001     EXEC SQL                                                             
LRM001         INSERT INTO VRSDBLK                                              
LRM001            ( CLIENT_NBR                                                  
LRM001             ,BRANCH_CD                                                   
LRM001             ,ACCT_CD                                                     
LRM001             ,BLOCK_CD                                                    
LRM001             ,CMNT_TXT                                                    
LRM001             ,PRGM_NM                                                     
LRM001             ,RCV_NBR                                                     
LRM001             ,DLVR_NBR                                                    
LRM001             ,CICS_TERM_ID_CD                                             
LRM001             ,CRT_TMSTP                                                   
LRM001             ,UPDT_TMSTP                                                  
LRM001             ,ISIN_SEC_ISSUE_CD                                           
LRM001             ,SECURITY_ADP_NBR                                            
LRM001             ,EXPIRE_DT                                                   
LRM001             ,ACTION_CD                                                   
LRM001             ,CICS_SNON_ID )                                              
LRM001         VALUES                                                           
LRM001             ( :DB-CLIENT-NBR                                             
LRM001              ,:DB-BRANCH-CD                                              
LRM001              ,:DB-ACCT-CD                                                
LRM001              ,'F'                                                        
LRM001              ,:DB-COMMENT                                                
LRM001              ,'CAT685  '                                                 
LRM001              ,:DB-RCV-NBR                                                
LRM001              ,:DB-DLVR-NBR                                               
LRM001              ,'    '                                                     
LRM001              ,:WS-TMSTMP                                                 
LRM001              ,:WS-TMSTMP                                                 
LRM001              ,:DB-CUSIP                                                  
LRM001              ,:DB-ADP-NO                                                 
LRM001              ,:W-DB2-PD180-DATE                                          
LRM001              ,' '                                                        
LRM001              ,'    ' )                                                   
LRM001     END-EXEC.                                                            
LRM001     EVALUATE SQLCODE                                                     
LRM001        WHEN +0                                                           
LRM001           ADD  +1  TO  WS-COMMIT-CTR                                     
LRM001                        CAGE-VRSDBLK-INSERTED                             
LRM001        WHEN -803                                                         
LRM001           CONTINUE                                                       
LRM001        WHEN OTHER                                                        
LRM001           DISPLAY 'PROBLEM WITH VRSDBLK INSERT '                         
LRM001           DISPLAY 'SQLCODE = ' SQLCODE                                   
LRM001           PERFORM DB2-ERROR-ROUTINE                                      
LRM001           DISPLAY '************************'                             
LRM001           DISPLAY '* PROGRAM IS ABENDING! *'                             
LRM001           DISPLAY '************************'                             
LRM001           MOVE +1500    TO ABEND-CODE                                    
LRM001           CALL ABEND        USING  ABEND-CODE                            
LRM001     END-EVALUATE.                                                        
LRM001     EJECT                                                                
LRM001 DB2-COMMIT.                                                              
LRM001     EXEC SQL                                                             
LRM001          COMMIT                                                          
LRM001     END-EXEC.                                                            
LRM001     IF SQLCODE NOT = +0                                                  
LRM001        DISPLAY '=========================='                              
LRM001        DISPLAY '**** ABEND AT COMMIT  ****'                              
LRM001        DISPLAY '=========================='                              
LRM001        DISPLAY 'SQLCODE = ' SQLCODE                                      
LRM001        PERFORM DB2-ERROR-ROUTINE                                         
LRM001        MOVE +2000    TO ABEND-CODE                                       
LRM001        CALL ABEND        USING  ABEND-CODE                               
LRM001     END-IF.                                                              
           EJECT                                                                
      *******************                                                       
       DB2-ERROR-ROUTINE.                                                       
      *******************                                                       
                                                                                
           CALL DSNTIAR                  USING  SQLCA                           
                                                WS-DB2-MESSAGE-AREA             
                                                WS-ERR-LINE-LEN.                
                                                                                
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                           
              UNTIL WS-ERROR-INDEX GREATER THAN 12                              
                 IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES                      
                    DISPLAY '*** ' WS-ERROR-MSG (WS-ERROR-INDEX)                
                 END-IF                                                         
           END-PERFORM.                                                         
                                                                                
           EXEC SQL                                                             
              ROLLBACK                                                          
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      *****************                                                         
       INITIAL-ROUTINE.                                                         
      *****************                                                         
                                                                                
LRM001     OPEN INPUT   PEND-FILE.                                              
LRM001     READ PEND-FILE                                                       
LRM001       AT END                                                             
LRM001          SET EOF-PEND TO TRUE                                            
LRM001       NOT AT END                                                         
LRM001          ADD +1 TO PEND-RECS-READ                                        
LRM001     END-READ.                                                            
                                                                                
           INITIALIZE BPDATES-PARAMETERS.                                       
           MOVE 'CAT685'                   TO  BPDATES-CALLING-PGM.             
           MOVE 'C'                        TO  BPDATES-REQ-TYPE.                
CSG001* MOVE SPACES TO BPDATES-CALENDAR-TYPE TO ALLOW BPDATES TO USE            
CSG001* THE DEFAULT CALENDAR.                                                   
CSG001*    MOVE 'US'                       TO  BPDATES-CALENDAR-TYPE.           
CSG001     MOVE '  '                       TO  BPDATES-CALENDAR-TYPE.           
           CALL  BPDATES                USING  BPDATES-PARAMETERS.              
                                                                                
           IF NOT BPD-VALID-RETURN                                              
              DISPLAY '**************************************'                  
              DISPLAY '* CALL TO BPDATES ROUTINE HAS FAILED *'                  
              DISPLAY '* BPD-RETURN-CODE = ' BPDATES-RETURN-CODE                
                      '               *'                                        
              DISPLAY '* PROGRAM IS ABENDING!               *'                  
              DISPLAY '**************************************'                  
LRM001        MOVE +3200    TO ABEND-CODE                                       
              CALL ABEND                USING  ABEND-CODE                       
           END-IF.                                                              
                                                                                
           MOVE BPD-PROC-DATE              TO  BP-DATE.                         
                                                                                
                                                                                
LRM001     MOVE  'D'                     TO  BPDATES-REQ-TYPE.                  
CSG001*    MOVE  'US'                    TO  BPDATES-CALENDAR-TYPE.             
CSG001     MOVE  '  '                    TO  BPDATES-CALENDAR-TYPE.             
LRM001     MOVE  BPD-PROC-DATE           TO  BPDATES-BASE-DATE.                 
LRM001     MOVE  'P'                     TO  BPDATES-DTSEARCH-IND.              
LRM001     MOVE  'C'                     TO  BPDATES-DTSEARCH-TYPE.             
LRM001     MOVE  180                     TO  BPDATES-DTSEARCH-DISP.             
LRM001     CALL BPDATES               USING  BPDATES-PARAMETERS.                
LRM001                                                                          
LRM001     IF  NOT BPD-VALID-RETURN                                             
LRM001         DISPLAY 'CALL ZBPDATES FOR PROC-DATE PLUS 180 ABENDING'          
LRM001         DISPLAY 'ZBPDATES RETURN CODE = '                                
LRM001              BPDATES-RETURN-CODE ' ABENDING '                            
LRM001         DISPLAY 'BASE DATE ' BPDATES-BASE-DATE                           
LRM001                 ' DISPLACEMENT '  BPDATES-DTSEARCH-DISP                  
LRM001         MOVE +3250    TO ABEND-CODE                                      
LRM001         CALL ABEND USING ABEND-CODE                                      
LRM001     END-IF                                                               
                                                                                
           MOVE BPD-DT-CALDATE TO  PROC-DATE-PLUS-180DAYS                       
           MOVE PD180-CC TO W-DB2-PD180-CC                                      
           MOVE PD180-YY TO W-DB2-PD180-YY                                      
           MOVE '-'      TO W-DB2-PD180-S1                                      
           MOVE PD180-MM TO W-DB2-PD180-MM                                      
           MOVE '-'      TO W-DB2-PD180-S2                                      
           MOVE PD180-DD TO W-DB2-PD180-DD                                      
           DISPLAY 'PROC DATE PLUS 180 DAYS = ' PROC-DATE-PLUS-180DAYS          
           DISPLAY 'W-DB2-PD180-DATE         = ' W-DB2-PD180-DATE.              
                                                                                
           EXEC SQL                                                             
               SET :WS-TMSTMP = CURRENT TIMESTAMP                               
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              PERFORM DB2-ERROR-ROUTINE                                         
LRM001        DISPLAY 'DB2 TIMESTAMP PROBLEM - SQLCODE ' SQLCODE                
LRM001        MOVE +3400    TO ABEND-CODE                                       
LRM001        CALL ABEND        USING  ABEND-CODE                               
           END-IF.                                                              
                                                                                
           DISPLAY '**********************************************'.            
           DISPLAY '* CURRENT DATE AND TIME: ' WS-TMSTMP (1:19) ' *'            
           DISPLAY '**********************************************'.            
                                                                                
           EJECT                                                                
      ****************                                                          
       ENDJOB-ROUTINE.                                                          
      ****************                                                          
                                                                                
LRM001     CLOSE  PEND-FILE.                                                    
                                                                                
LRM001     DISPLAY 'PEND FILE RECS READ      ' PEND-RECS-READ                   
LRM001     DISPLAY 'RESCIND BLOCK ROWS ISRT  ' CAGE-VRSDBLK-INSERTED            
           DISPLAY '********************************************'.              
           DISPLAY '* PROGRAM CAT685 IS COMPLETED SUCCESSFULLY *'.              
           DISPLAY '********************************************'.              
           DISPLAY ' '.                                                         
