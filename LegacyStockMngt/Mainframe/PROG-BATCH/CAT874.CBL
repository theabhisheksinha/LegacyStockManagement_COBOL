000001* PDX    - CAT874   C0348882 12/06/13 06:52:31 TBCHKOP            00001000
CSG001* SSR 91356 MOVE SPACES TO BPDATES-CALENDAR-TYPE.                         
000001* PDX    - CAT874   C0331331 09/20/12 10:27:52 TBLAMUR            00001000
LRM009* SSR 85841 QUALIFY HISTORY ASSET AS FAIL REVERSED UPDATE BY              
LRM009*    CAGE TAG NUMBER IF ONE IS PROVIDED.                                  
000001* PDX    - CAT874   C0278004 04/03/09 10:41:38 TBLAMUR            00001000
LRM008* SSR 64210 REMOVE RDMACT PROCESSING, AS CAGE-FAIL-SENT-IND IS            
LRM008*    NOT NEEDED IN ACATS, TO SAVE MIPS.                                   
000001* PDX    - CAT874   C0266889 12/04/08 15:36:09 TBLAMUR            00001000
000001* PDX    - CAT874   C0272055 10/22/08 15:03:50 TBLAMUR            00001000
LRM007* SSR 60125 RECOMPILE FOR EXPANSION TO ACATPEND                           
000001* PDX    - CAT874   C0247164 05/25/07 09:05:55 TBLAMUR            00001000
LRM006* 05/25/07 SSR 47211 CAGE FAIL SETUP ON OR AFTER ACAT S/D.                
LRM006*        - SAVE TAG NBR ON HISTORY ASSET.                                 
000001* PDX    - CAT874   C0226844 10/21/05 10:26:44 TBLAMUR            00001000
LRM005* SSR 0044447 DELETE RESCIND BLOCK CREATE LOGIC. MOVED TO CAT685          
000001* PDX    - CAT874   C0226392 10/10/05 09:02:38 TBLAMUR            00001000
LRM004* SSR 0039800 UPDATE FAIL OPEN CAGE TO N, WHEN MFC/FRV SETTLES,           
LRM004*   TO BE CONSIDERED IN CAT515 TO IDENTIFY AS PROBABLE DUPE,              
LRM004*   ACATPEND WILL CARRY ASTD CNTL NBR OF ORIGINAL TIF.                    
000001* PDX    - CAT874   C0222541 07/25/05 13:51:28 TBLAMUR            00001000
000001* PDX    - CAT874   C0222440 07/20/05 08:56:26 TBLAMUR            00001000
LRM002* SSR 0039849 UPDATE ROLLOVER SECR AND QTY ON 650.ROLLOVER                
000001* PDX    - CAT874   C0218155 03/09/05 09:55:14 TBLAMUR            00001000
000001* PDX    - CAT874   C0210469 11/22/04 09:57:07 TBLAMUR            00001000
LRM001* SSR 0034535 UPDATE CAGE TAG NBRS ECHOED BACK ON 650.T3RDFL              
000001* PDX    - CAT874   C0155513 03/12/01 07:57:54 TBDOJUN            00001000
000001* PDX    - CAT874   C0121406 02/09/99 17:01:11 TBTARYB            00001000
000001* PDX    - CAT874   C0120355 01/14/99 14:54:38 TBTARYB            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    CAT874.                                                   
       DATE-WRITTEN.  JANUARY 1999.                                             
                                                                                
      *****************************************************************         
      *                         REMARKS                               *         
      *****************************************************************         
      *  THIS PROGRAM IS TO APPLY CAGE TAGS TO VASSET OR VASETHSTY    *         
      *  FROM THE T3RDFL (CAGE FAIL SETUP FILE) ECHOED BACK FROM CAGE.*         
      *****************************************************************         
                                                                                
           EJECT                                                                
      *****************************************************************         
       ENVIRONMENT DIVISION.                                                    
      *****************************************************************         
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
LRM001     SELECT CAGE-T3RDFL                   ASSIGN  TO  T3RDFL.             
LRM001     SELECT PEND-FILE                     ASSIGN  TO  IPEND.              
LRM001     SELECT PEND-FUNDSERV-FILE            ASSIGN  TO  IFUND.              
LRM002     SELECT ROLLOVER-866-FILE             ASSIGN  TO  ROLL866.            
      *    SELECT REPORT-FILE                   ASSIGN  TO  RPTPI.              
                                                                                
      *****************************************************************         
       DATA DIVISION.                                                           
      *****************************************************************         
                                                                                
       FILE SECTION.                                                            
                                                                                
LRM001 FD  CAGE-T3RDFL                                                          
LRM001     RECORDING MODE F                                                     
LRM001     BLOCK CONTAINS 0 RECORDS                                             
LRM001     LABEL RECORDS ARE STANDARD                                           
LRM001     RECORD CONTAINS 200 CHARACTERS.                                      
LRM001                                                                          
LRM001 01  T3RDFL-RECORD               PIC X(200).                              
                                                                                
LRM001 FD  PEND-FILE                                                            
LRM001     RECORDING MODE V                                                     
LRM001     BLOCK CONTAINS 0 RECORDS.                                            
LRM001                                                                          
LRM001     COPY ACATPEND  REPLACING ==:FMT:== BY ==PEND==.                      
                                                                                
LRM001 FD  PEND-FUNDSERV-FILE                                                   
LRM001     RECORDING MODE V                                                     
LRM001     BLOCK CONTAINS 0 RECORDS.                                            
LRM001                                                                          
LRM001     COPY ACATPEND  REPLACING ==:FMT:== BY ==FUND==.                      
                                                                                
LRM001 FD  ROLLOVER-866-FILE                                                    
LRM001     RECORDING MODE F                                                     
LRM001     BLOCK CONTAINS 0 RECORDS.                                            
LRM001                                                                          
LRM001     COPY ACAT866   REPLACING ==:FMT:== BY ==FMT-ROLL==.                  
                                                                                
      *FD  REPORT-FILE                                                          
      *    RECORDING MODE IS F                                                  
      *    BLOCK CONTAINS 0 RECORDS                                             
      *    LABEL RECORDS ARE STANDARD                                           
      *    RECORD CONTAINS 143 CHARACTERS.                                      
      *                                                                         
      *01  REPORT-REC                       PIC  X(143).                        
                                                                                
           EJECT                                                                
      ******************************************************************        
       WORKING-STORAGE SECTION.                                                 
      ******************************************************************        
                                                                                
       01  ABEND-CODE               COMP    PIC S9(04)  VALUE +9999.            
       01  WS-TMSTMP                        PIC  X(26)  VALUE SPACES.           
       01  WS-CLIENT-NBR                    PIC  X(03)  VALUE SPACES.           
       01  WS-SPIN-CODE                     PIC  X(01)  VALUE SPACES.           
       01  WS-CUSIP                         PIC  X(09)  VALUE SPACES.           
                                                                                
       01  FILLER                           PIC  X(12)  VALUE                   
           'SWITCHES'.                                                          
                                                                                
       01  FILLER.                                                              
LRM001     05  EOF-T3RDFL-SW                PIC  X(01)  VALUE 'N'.              
LRM001         88  EOF-T3RDFL                           VALUE 'Y'.              
LRM001     05  EOF-PEND-SW                  PIC  X(01)  VALUE 'N'.              
LRM001         88  EOF-PEND                             VALUE 'Y'.              
LRM001     05  EOF-FUND-SW                  PIC  X(01)  VALUE 'N'.              
LRM001         88  EOF-FUND                             VALUE 'Y'.              
LRM001     05  EOF-ROLL-SW                  PIC  X(01)  VALUE 'N'.              
LRM001         88  EOF-ROLL                             VALUE 'Y'.              
LRM004     05  UPDATE-FAIL-OPEN-SW          PIC  X(01)  VALUE 'N'.              
LRM004         88  UPDATE-OPEN-FAIL                     VALUE 'Y'.              
LRM004         88  BYPASS-OPEN-FAIL-UPD                 VALUE 'N'.              
           05  STOP-SW                      PIC  X(01).                         
               88  STOP-OK                              VALUE 'Y'.              
               88  STOP-NOT-OK                          VALUE 'N'.              
                                                                                
       01  FILLER                           PIC  X(12)  VALUE                   
           'COUNTERS'.                                                          
                                                                                
       01  FILLER.                                                              
           05  INPUT-REC-CNTR       COMP-3  PIC  9(09)  VALUE ZERO.             
           05  DLVR-FAILS-CNTR      COMP-3  PIC  9(09)  VALUE ZERO.             
           05  RCVR-FAILS-CNTR      COMP-3  PIC  9(09)  VALUE ZERO.             
           05  WS-WACK-CNTR                 PIC  9(02)  VALUE ZERO.             
LRM001     05  CAGE-T3RDFL-RECS-READ COMP-3 PIC  9(09)  VALUE ZERO.             
LRM001     05  CAGE-TAG-VASTHSTY-UPD COMP-3 PIC  9(09)  VALUE ZERO.             
LRM001     05  CAGE-TAG-VASSET-UPD   COMP-3 PIC  9(09)  VALUE ZERO.             
LRM001     05  CAGE-T3RDFL-NOTFND    COMP-3 PIC  9(09)  VALUE ZERO.             
LRM001     05  PEND-RECS-READ        COMP-3 PIC  9(09)  VALUE ZERO.             
LRM001     05  CAGE-VRSDBLK-INSERTED COMP-3 PIC  9(09)  VALUE ZERO.             
LRM001     05  FUNDSERV-RECS-READ    COMP-3 PIC  9(09)  VALUE ZERO.             
LRM001     05  FUNDSERV-VASTHSTY-UPD COMP-3 PIC  9(09)  VALUE ZERO.             
LRM001     05  FUNDSERV-NOTFND       COMP-3 PIC  9(09)  VALUE ZERO.             
LRM002     05  ROLLOVER-RECS-READ    COMP-3 PIC  9(09)  VALUE ZERO.             
LRM002     05  ROLLOVER-VASTHSTY-UPD COMP-3 PIC  9(09)  VALUE ZERO.             
LRM002     05  ROLLOVER-NOTFND       COMP-3 PIC  9(09)  VALUE ZERO.             
LRM004     05  FAILCMPLT-VASTHSTY-UPD COMP-3 PIC 9(09)  VALUE ZERO.             
LRM004     05  FAILCMPLT-NOTFND      COMP-3 PIC  9(09)  VALUE ZERO.             
                                                                                
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
LRM009     05  DB-CAGE-TAG                  PIC  X(11).                         
                                                                                
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
LRM004     05  DB-CASH-MGN-IND              PIC  X.                             
                                                                                
LRM001 01  DB2-COMMIT-AREA.                                                     
LRM001     05  WS-COMMIT-CTR             PIC S9(4)  COMP  VALUE ZERO.           
LRM001     05  WS-COMMIT-TOT-CTR         PIC S9(4)  COMP  VALUE ZERO.           
                                                                                
       01  TRAC-RECORD.                                                         
           05  TRAC-DETAIL                  PIC  X(133).                        
           05  TRAC-CONTROL.                                                    
               10  TRAC-CLIENT      COMP-3  PIC  9(02)  VALUE ZEROES.           
               10  FILLER                   PIC  X(08)  VALUE SPACES.           
                                                                                
       01  WS-DB2-MESSAGE-AREA.                                                 
           05  WS-DB2-MSG-LEN       COMP    PIC S9(04)  VALUE +960.             
           05  WS-ERROR-MSG                 PIC  X(80)  OCCURS 12 TIMES         
               INDEXED BY WS-ERROR-INDEX.                                       
       01  WS-ERR-LINE-LEN                  PIC S9(09) COMP VALUE +80.          
                                                                                
           EJECT                                                                
LRM001     COPY ACATCG03 REPLACING ==:CAGE-03:== BY ==CAGE-03==.                
                                                                                
           EJECT                                                                
           COPY BPDATESC.                                                       
                                                                                
      *DB2 COMMUNICATION AREA                                                   
           EJECT                                                                
           EXEC SQL                                                             
              INCLUDE SQLCA                                                     
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
LRM001     EXEC SQL                                                             
LRM001        INCLUDE VASSET                                                    
LRM001     END-EXEC.                                                            
                                                                                
           EJECT                                                                
           EXEC SQL                                                             
              INCLUDE VTRNHSTY                                                  
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
           EXEC SQL                                                             
              INCLUDE VASTHSTY                                                  
           END-EXEC.                                                            
                                                                                
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
                                                                                
       LINKAGE SECTION.                                                         
       01  LINK-PARM.                                                           
           05 PARM-LENGTH   PIC S9(4) COMP.                                     
           05 PARM-PASSED   PIC X(06).                                          
              88  PARM-BYPASS-DATE VALUE 'BYPASS'.                              
      *****************************************************************         
       PROCEDURE DIVISION USING LINK-PARM.                                      
      *****************************************************************         
                                                                                
           COPY MSGCOBO.                                                        
                                                                                
           PERFORM INITIAL-ROUTINE.                                             
                                                                                
                                                                                
           SET STOP-NOT-OK                  TO  TRUE.                           
                                                                                
LRM001     PERFORM PROCESS-TR3RFL THRU PROCESS-T3RDFL-EXIT                      
LRM001        UNTIL EOF-T3RDFL.                                                 
                                                                                
LRM001     PERFORM PROCESS-PEND-FILE THRU PROCESS-PEND-EXIT                     
LRM001        UNTIL EOF-PEND.                                                   
                                                                                
LRM001     PERFORM PROCESS-FUNDSERV-FILE THRU PROCESS-FUNDSERV-EXIT             
LRM001        UNTIL EOF-FUND.                                                   
                                                                                
LRM002     PERFORM PROCESS-ROLLOVER-FILE THRU PROCESS-ROLLOVER-EXIT             
LRM002        UNTIL EOF-ROLL.                                                   
                                                                                
           PERFORM ENDJOB-ROUTINE.                                              
                                                                                
           GOBACK.                                                              
                                                                                
LRM001 PROCESS-TR3RFL.                                                          
LRM001*--------------------------------------------------------------           
LRM001* THIS ROUTINE READS THRU THE ECHOED BACK FILE TO POST THE CAGE           
LRM001* TAG NUMBERS ON THE ACAT ASSET, TO BE RETAINED FOR REFERENCE             
LRM001* ON FRV AND MFC LATER.                                                   
LRM001*--------------------------------------------------------------           
LRM001     READ CAGE-T3RDFL               INTO  CAGE-03-RECORD                  
LRM001        AT END  SET EOF-T3RDFL        TO  TRUE                            
LRM001     END-READ.                                                            
LRM001                                                                          
LRM001     IF EOF-T3RDFL                                                        
LRM001        GO TO PROCESS-T3RDFL-EXIT                                         
LRM001     END-IF.                                                              
LRM001                                                                          
LRM001     IF CAGE-03-HDR-DATE-LITERAL                                          
LRM001        DISPLAY 'FOUND CAGE DATE HEADER ' CAGE-03-HDR-PROC-DATE           
LRM001        GO TO PROCESS-TR3RFL                                              
LRM001     END-IF.                                                              
LRM001                                                                          
LRM001     ADD +1 TO CAGE-T3RDFL-RECS-READ.                                     
LRM001     IF WS-COMMIT-CTR > +10                                               
LRM001        PERFORM DB2-COMMIT                                                
LRM001        MOVE ZERO TO WS-COMMIT-CTR                                        
LRM001     END-IF.                                                              
LRM001                                                                          
LRM001     MOVE '0'                    TO DB-CLIENT-NBR(1 : 1).                 
LRM001     MOVE CAGE-03-ADP-CLIENT-NBR TO DB-CLIENT-NBR(2 : 3).                 
LRM001     MOVE CAGE-03-CONTROL-NBR    TO DB-ACAT-CONTROL-NBR.                  
LRM001     MOVE CAGE-03-ASSET-SEQ-NO   TO DB-ASSET-SEQ-NBR.                     
LRM001                                                                          
LRM003 PROCESS-T3RDFL-RETRY.                                                    
LRM001     EXEC SQL                                                             
LRM001        UPDATE VASSET                                                     
LRM001           SET CAGE_TAG_NBR = :CAGE-03-CAGE-TAG                           
LRM001           WHERE CLIENT_NBR       = :DB-CLIENT-NBR        AND             
LRM001                 ACAT_CONTROL_NBR = :DB-ACAT-CONTROL-NBR  AND             
LRM001                 ASSET_SEQ_NBR    = :DB-ASSET-SEQ-NBR                     
LRM001     END-EXEC.                                                            
LRM001                                                                          
LRM001     EVALUATE SQLCODE                                                     
LRM001        WHEN +0                                                           
LRM001           ADD  +1  TO  WS-COMMIT-CTR                                     
LRM001                        CAGE-TAG-VASSET-UPD                               
LRM001           GO TO PROCESS-T3RDFL-EXIT                                      
LRM001        WHEN +100                                                         
LRM006           CONTINUE                                                       
LRM001        WHEN -911                                                         
LRM001           MOVE 0                     TO  WS-WACK-CNTR                    
LRM001           PERFORM UNTIL SQLCODE = +0 OR                                  
LRM001              WS-WACK-CNTR > 10                                           
LRM001              EXEC SQL                                                    
LRM001                 UPDATE VASSET                                            
LRM001                 SET CAGE_TAG_NBR = :CAGE-03-CAGE-TAG                     
LRM001                 WHERE CLIENT_NBR       = :DB-CLIENT-NBR       AND        
LRM001                       ACAT_CONTROL_NBR = :DB-ACAT-CONTROL-NBR AND        
LRM001                       ASSET_SEQ_NBR    = :DB-ASSET-SEQ-NBR               
LRM001              END-EXEC                                                    
LRM001              ADD 1 TO WS-WACK-CNTR                                       
LRM001           END-PERFORM                                                    
LRM001           GO TO PROCESS-T3RDFL-EXIT                                      
LRM001        WHEN OTHER                                                        
LRM001           DISPLAY 'PROBLEM WITH VASSET UPDATE '                          
LRM001           DISPLAY 'SQLCODE = ' SQLCODE                                   
LRM001           PERFORM DB2-ERROR-ROUTINE                                      
LRM001           DISPLAY '************************'                             
LRM001           DISPLAY '* PROGRAM IS ABENDING! *'                             
LRM001           DISPLAY '************************'                             
LRM001           MOVE +1300    TO ABEND-CODE                                    
LRM001           CALL ABEND        USING  ABEND-CODE                            
LRM001     END-EVALUATE.                                                        
LRM001                                                                          
LRM001     EXEC SQL                                                             
LRM001        UPDATE VASTHSTY                                                   
LRM001           SET CAGE_TAG_NBR = :CAGE-03-CAGE-TAG                           
LRM001              ,PRGM_NM       = 'CAT874  '                                 
LRM001              ,UPDT_TMSTP    = :WS-TMSTMP                                 
LRM001           WHERE CLIENT_NBR       = :DB-CLIENT-NBR        AND             
LRM001                 ACAT_CONTROL_NBR = :DB-ACAT-CONTROL-NBR  AND             
LRM001                 ASSET_SEQ_NBR    = :DB-ASSET-SEQ-NBR                     
LRM001     END-EXEC.                                                            
LRM001                                                                          
LRM001     EVALUATE SQLCODE                                                     
LRM001        WHEN +0                                                           
LRM001           ADD  +1  TO  WS-COMMIT-CTR                                     
LRM001                        CAGE-TAG-VASTHSTY-UPD                             
LRM001           GO TO PROCESS-T3RDFL-EXIT                                      
LRM001        WHEN +100                                                         
LRM003           IF DB-CLIENT-NBR (1 : 1) = '0'                                 
LRM003              MOVE '1' TO DB-CLIENT-NBR (1 : 1)                           
LRM003              GO TO PROCESS-T3RDFL-RETRY                                  
LRM003           END-IF                                                         
LRM001        WHEN -911                                                         
LRM001           MOVE 0                     TO  WS-WACK-CNTR                    
LRM001           PERFORM UNTIL SQLCODE = +0 OR                                  
LRM001              WS-WACK-CNTR > 10                                           
LRM001              EXEC SQL                                                    
LRM001                 UPDATE VASTHSTY                                          
LRM001                 SET CAGE_TAG_NBR = :CAGE-03-CAGE-TAG                     
LRM001                   ,PRGM_NM       = 'CAT874  '                            
LRM001                   ,UPDT_TMSTP    = :WS-TMSTMP                            
LRM001                 WHERE CLIENT_NBR       = :DB-CLIENT-NBR       AND        
LRM001                       ACAT_CONTROL_NBR = :DB-ACAT-CONTROL-NBR AND        
LRM001                       ASSET_SEQ_NBR    = :DB-ASSET-SEQ-NBR               
LRM001              END-EXEC                                                    
LRM001              ADD 1 TO WS-WACK-CNTR                                       
LRM001           END-PERFORM                                                    
LRM001           GO TO PROCESS-T3RDFL-EXIT                                      
LRM001        WHEN OTHER                                                        
LRM001           DISPLAY 'PROBLEM WITH VASTHSTY UPDATE '                        
LRM001           DISPLAY 'SQLCODE = ' SQLCODE                                   
LRM001           PERFORM DB2-ERROR-ROUTINE                                      
LRM001           DISPLAY '************************'                             
LRM001           DISPLAY '* PROGRAM IS ABENDING! *'                             
LRM001           DISPLAY '************************'                             
LRM001           MOVE +1400    TO ABEND-CODE                                    
LRM001           CALL ABEND        USING  ABEND-CODE                            
LRM001     END-EVALUATE.                                                        
LRM001     DISPLAY 'CAGE TAG NOT MATCHED ' DB-CLIENT-NBR                        
LRM001                                 ' ' DB-ACAT-CONTROL-NBR                  
LRM001                                 ' ' DB-ASSET-SEQ-NBR.                    
LRM001     ADD 1 TO CAGE-T3RDFL-NOTFND.                                         
LRM001 PROCESS-T3RDFL-EXIT. EXIT.                                               
LRM001     EJECT                                                                
LRM001 PROCESS-PEND-FILE.                                                       
LRM001*--------------------------------------------------------------           
LRM001* THIS ROUTINE READS THRU THE BOOKING FILE FOR SETTLED FRV(S)             
LRM001* AND MFC(S) TO UPDATE THE OPEN FAIL INDICATOR ON VASTHSTY OF             
LRM001* THE ORIGINAL DELIVERY TIF.                                              
LRM001*--------------------------------------------------------------           
LRM001     IF PEND-HEADER-ID                                                    
LRM004       SET BYPASS-OPEN-FAIL-UPD TO TRUE                                   
LRM001     END-IF.                                                              
LRM001                                                                          
LRM004     IF PEND-TI-RECORD-ID                                                 
LRM004       IF (PEND-TRNFR-TYPE = 'FRV' OR 'MFC')                              
LRM004       AND PEND-DSTBN-SIDE-CD = 'R'                                       
LRM004       AND PEND-SETTL-DATE = BP-DATE                                      
LRM004       AND PEND-CNTL-ASTD-NBR > SPACES                                    
LRM004         SET UPDATE-OPEN-FAIL TO TRUE                                     
LRM004         MOVE '0'                     TO DB-CLIENT-NBR(1 : 1)             
LRM004         MOVE PEND-TI-ADP-CL-NO-X     TO DB-CLIENT-NBR(2 : 3)             
LRM004         MOVE PEND-CNTL-ASTD-NBR      TO DB-ACAT-CONTROL-NBR              
LRM004       ELSE                                                               
LRM004         SET BYPASS-OPEN-FAIL-UPD TO TRUE                                 
LRM004       END-IF                                                             
LRM004     END-IF.                                                              
LRM004                                                                          
LRM004     IF PEND-AT-RECORD-ID                                                 
LRM004     AND UPDATE-OPEN-FAIL                                                 
LRM004        MOVE PEND-CUSIP-NUM              TO DB-CUSIP                      
LRM004        MOVE PEND-ADP-SEC-NO             TO DB-ADP-NO                     
LRM004        MOVE PEND-CASH-MGN-IND           TO DB-CASH-MGN-IND               
LRM004        PERFORM UPDATE-OPEN-FAIL-IND                                      
LRM009           THRU UPDATE-OPEN-FAIL-EXIT                                     
LRM004     END-IF.                                                              
LRM004                                                                          
LRM001     READ PEND-FILE                                                       
LRM001       AT END                                                             
LRM001          SET EOF-PEND TO TRUE                                            
LRM001       NOT AT END                                                         
LRM001          ADD +1 TO PEND-RECS-READ                                        
LRM001     END-READ.                                                            
LRM001                                                                          
LRM001 PROCESS-PEND-EXIT. EXIT.                                                 
LRM001                                                                          
LRM001 PROCESS-FUNDSERV-FILE.                                                   
LRM001*--------------------------------------------------------------           
LRM001* THIS ROUTINE READS THRU THE BOOKING EXTRACT FILE CONTAINING             
LRM001* THE NETWORK-LEVEL, CURRENT F/R STATUS AND FUND-PROCESS-CODE,            
LRM001* TO BE RETAINED/UPDATED ON VASTHSTY.                                     
LRM001*--------------------------------------------------------------           
LRM001     IF NOT FUND-AT-RECORD-ID                                             
LRM001        GO TO PROCESS-FUNDSERV-SKIP                                       
LRM001     END-IF.                                                              
LRM001                                                                          
LRM001     MOVE '0'                     TO DB-CLIENT-NBR(1 : 1)                 
LRM001     MOVE FUND-AT-ADP-CL-NO-X     TO DB-CLIENT-NBR(2 : 3)                 
LRM001     MOVE FUND-AT-CONTROL-NUM     TO DB-ACAT-CONTROL-NBR                  
LRM001     MOVE FUND-ASSET-SEQ-NO-9     TO DB-ASSET-SEQ-NBR                     
LRM001     MOVE FUND-NTWRK-CNTL-CD      TO NTWK-CNTL-CD                         
LRM001     MOVE FUND-FUND-PROC-CD       TO FUND-PROC-CD                         
LRM001     MOVE FUND-ACTION-TYPE-CD     TO FUND-RGSTN-STTS                      
LRM001     EXEC SQL                                                             
LRM001        UPDATE VASTHSTY                                                   
LRM000           SET NTWK_CNTL_CD    = :DCLVASTHSTY.NTWK-CNTL-CD                
LRM001              ,FUND_PROC_CD    = :DCLVASTHSTY.FUND-PROC-CD                
LRM001              ,FUND_RGSTN_STTS = :DCLVASTHSTY.FUND-RGSTN-STTS             
LRM001              ,PRGM_NM       = 'CAT874  '                                 
LRM001              ,UPDT_TMSTP    = :WS-TMSTMP                                 
LRM001           WHERE CLIENT_NBR       = :DB-CLIENT-NBR        AND             
LRM001                 ACAT_CONTROL_NBR = :DB-ACAT-CONTROL-NBR  AND             
LRM001                 ASSET_SEQ_NBR    = :DB-ASSET-SEQ-NBR                     
LRM001     END-EXEC.                                                            
LRM001                                                                          
LRM001     EVALUATE SQLCODE                                                     
LRM001        WHEN +0                                                           
LRM001           ADD  +1  TO  WS-COMMIT-CTR                                     
LRM001                        FUNDSERV-VASTHSTY-UPD                             
LRM001        WHEN -911                                                         
LRM001           MOVE 0                     TO  WS-WACK-CNTR                    
LRM001           PERFORM UNTIL SQLCODE = +0 OR                                  
LRM001              WS-WACK-CNTR > 10                                           
LRM001              EXEC SQL                                                    
LRM001                 UPDATE VASTHSTY                                          
LRM001               SET NTWK_CNTL_CD   = :DCLVASTHSTY.NTWK-CNTL-CD             
LRM001                 ,FUND_PROC_CD    = :DCLVASTHSTY.FUND-PROC-CD             
LRM001                 ,FUND_RGSTN_STTS = :DCLVASTHSTY.FUND-RGSTN-STTS          
LRM001                 ,PRGM_NM       = 'CAT874  '                              
LRM001                 ,UPDT_TMSTP    = :WS-TMSTMP                              
LRM001                 WHERE CLIENT_NBR       = :DB-CLIENT-NBR       AND        
LRM001                       ACAT_CONTROL_NBR = :DB-ACAT-CONTROL-NBR AND        
LRM001                       ASSET_SEQ_NBR    = :DB-ASSET-SEQ-NBR               
LRM001              END-EXEC                                                    
LRM001              ADD 1 TO WS-WACK-CNTR                                       
LRM001           END-PERFORM                                                    
LRM001        WHEN +100                                                         
LRM001           DISPLAY 'FUNDSERV ASTHSTY NOTFND ' DB-CLIENT-NBR               
LRM001              ' ' DB-ACAT-CONTROL-NBR ' ' DB-ASSET-SEQ-NBR                
LRM001           ADD 1 TO FUNDSERV-NOTFND                                       
LRM001        WHEN OTHER                                                        
LRM001           PERFORM DB2-ERROR-ROUTINE                                      
LRM001           DISPLAY '************************'                             
LRM001           DISPLAY '* PROGRAM IS ABENDING! *'                             
LRM001           DISPLAY '************************'                             
LRM001           MOVE +1600    TO ABEND-CODE                                    
LRM001           CALL ABEND             USING  ABEND-CODE                       
LRM001     END-EVALUATE.                                                        
LRM001                                                                          
LRM001     IF WS-COMMIT-CTR > +10                                               
LRM001        PERFORM DB2-COMMIT                                                
LRM001        MOVE ZERO TO WS-COMMIT-CTR                                        
LRM001     END-IF.                                                              
LRM001                                                                          
LRM001 PROCESS-FUNDSERV-SKIP.                                                   
LRM001     READ PEND-FUNDSERV-FILE                                              
LRM001       AT END                                                             
LRM001          SET EOF-FUND TO TRUE                                            
LRM001       NOT AT END                                                         
LRM001          ADD +1 TO FUNDSERV-RECS-READ                                    
LRM001     END-READ.                                                            
LRM001                                                                          
LRM001 PROCESS-FUNDSERV-EXIT. EXIT.                                             
LRM001                                                                          
LRM001     EJECT                                                                
LRM004 UPDATE-OPEN-FAIL-IND.                                                    
LRM009     IF PEND-CAGE-TAG > SPACES                                            
LRM009       MOVE PEND-CAGE-TAG TO DB-CAGE-TAG                                  
LRM009       EXEC SQL                                                           
LRM009        UPDATE VASTHSTY                                                   
LRM009           SET FAIL_OPEN_CAGE_IND = 'R'                                   
LRM009              ,PRGM_NM       = 'CAT874  '                                 
LRM009              ,UPDT_TMSTP    = :WS-TMSTMP                                 
LRM009           WHERE CLIENT_NBR        = :DB-CLIENT-NBR        AND            
LRM009                 ACAT_CONTROL_NBR  = :DB-ACAT-CONTROL-NBR  AND            
LRM009                 CAGE_TAG_NBR      = :DB-CAGE-TAG                         
LRM009       END-EXEC                                                           
LRM009       EVALUATE SQLCODE                                                   
LRM009        WHEN +0                                                           
LRM009           ADD  +1  TO  WS-COMMIT-CTR                                     
LRM009                        FAILCMPLT-VASTHSTY-UPD                            
LRM009           DISPLAY 'ACATPEND UPDATE '                                     
LRM009               DB-CLIENT-NBR                                              
LRM009           ' ' DB-ACAT-CONTROL-NBR                                        
LRM009           ' ' DB-CAGE-TAG                                                
LRM009           GO TO UPDATE-OPEN-FAIL-CONT                                    
LRM009        WHEN +100                                                         
LRM009           DISPLAY 'FAILCMPLT UPD NOTFND ' DB-CLIENT-NBR                  
LRM009              ' ' DB-ACAT-CONTROL-NBR ' '                                 
LRM009              ' CAGE-TAG ' DB-CAGE-TAG                                    
LRM009        WHEN -911                                                         
LRM009           MOVE 0                     TO  WS-WACK-CNTR                    
LRM009           PERFORM UNTIL SQLCODE = +0 OR                                  
LRM009              WS-WACK-CNTR > 10                                           
LRM009              DISPLAY 'IN -911 PEND LOOP' WS-WACK-CNTR                    
LRM009              EXEC SQL                                                    
LRM009                 UPDATE VASTHSTY                                          
LRM009                 SET FAIL_OPEN_CAGE_IND = 'R'                             
LRM009                    ,PRGM_NM       = 'CAT874  '                           
LRM009                    ,UPDT_TMSTP    = :WS-TMSTMP                           
LRM009                 WHERE CLIENT_NBR       = :DB-CLIENT-NBR       AND        
LRM009                     ACAT_CONTROL_NBR   = :DB-ACAT-CONTROL-NBR AND        
LRM009                 CAGE_TAG_NBR      = :PEND-CAGE-TAG                       
LRM009              END-EXEC                                                    
LRM009              ADD 1 TO WS-WACK-CNTR                                       
LRM009           END-PERFORM                                                    
LRM009           GO TO UPDATE-OPEN-FAIL-CONT                                    
LRM009        WHEN OTHER                                                        
LRM009           PERFORM DB2-ERROR-ROUTINE                                      
LRM009           DISPLAY '************************'                             
LRM009           DISPLAY '* PROGRAM IS ABENDING! *'                             
LRM009           DISPLAY '************************'                             
LRM009           MOVE +1700    TO ABEND-CODE                                    
LRM009           CALL ABEND             USING  ABEND-CODE                       
LRM009       END-EVALUATE                                                       
LRM009     END-IF.                                                              
                                                                                
LRM004     EXEC SQL                                                             
LRM004        UPDATE VASTHSTY                                                   
LRM009           SET FAIL_OPEN_CAGE_IND = 'R'                                   
LRM004              ,PRGM_NM       = 'CAT874  '                                 
LRM004              ,UPDT_TMSTP    = :WS-TMSTMP                                 
LRM004           WHERE CLIENT_NBR        = :DB-CLIENT-NBR        AND            
LRM004                 ACAT_CONTROL_NBR  = :DB-ACAT-CONTROL-NBR  AND            
LRM004                 ISIN_SEC_ISSUE_CD = :DB-CUSIP             AND            
LRM004                 CSH_MGN_SHRT_CD   = :DB-CASH-MGN-IND                     
LRM004     END-EXEC.                                                            
LRM004                                                                          
LRM004     EVALUATE SQLCODE                                                     
LRM004        WHEN +0                                                           
LRM004           ADD  +1  TO  WS-COMMIT-CTR                                     
LRM004                        FAILCMPLT-VASTHSTY-UPD                            
TEST             DISPLAY 'ACATPEND UPDATE '                                     
TEST                 DB-CLIENT-NBR                                              
                 ' ' DB-ACAT-CONTROL-NBR                                        
                 ' ' DB-CUSIP                                                   
                 ' ' DB-CASH-MGN-IND                                            
LRM004        WHEN +100                                                         
LRM004           ADD  +1  TO  FAILCMPLT-NOTFND                                  
LRM004           DISPLAY 'FAILCMPLT UPD NOTFND ' DB-CLIENT-NBR                  
LRM004              ' ' DB-ACAT-CONTROL-NBR ' '                                 
LRM004              ' CUSIP ' DB-CUSIP                                          
LRM004              ' TYPE '  DB-CASH-MGN-IND                                   
LRM004        WHEN -911                                                         
LRM004           MOVE 0                     TO  WS-WACK-CNTR                    
LRM004           PERFORM UNTIL SQLCODE = +0 OR                                  
LRM004              WS-WACK-CNTR > 10                                           
LRM008              DISPLAY 'IN -911 PEND LOOP' WS-WACK-CNTR                    
LRM004              EXEC SQL                                                    
LRM004                 UPDATE VASTHSTY                                          
LRM009                 SET FAIL_OPEN_CAGE_IND = 'R'                             
LRM004                    ,PRGM_NM       = 'CAT874  '                           
LRM004                    ,UPDT_TMSTP    = :WS-TMSTMP                           
LRM004                 WHERE CLIENT_NBR       = :DB-CLIENT-NBR       AND        
LRM004                     ACAT_CONTROL_NBR   = :DB-ACAT-CONTROL-NBR AND        
LRM004                     ISIN_SEC_ISSUE_CD  = :DB-CUSIP            AND        
LRM004                     CSH_MGN_SHRT_CD    = :DB-CASH-MGN-IND                
LRM004              END-EXEC                                                    
LRM004              ADD 1 TO WS-WACK-CNTR                                       
LRM004           END-PERFORM                                                    
LRM004        WHEN OTHER                                                        
LRM004           PERFORM DB2-ERROR-ROUTINE                                      
LRM004           DISPLAY '************************'                             
LRM004           DISPLAY '* PROGRAM IS ABENDING! *'                             
LRM004           DISPLAY '************************'                             
LRM004           MOVE +1700    TO ABEND-CODE                                    
LRM004           CALL ABEND             USING  ABEND-CODE                       
LRM004     END-EVALUATE.                                                        
LRM004                                                                          
LRM009 UPDATE-OPEN-FAIL-CONT.                                                   
LRM004     IF WS-COMMIT-CTR > +10                                               
LRM004        PERFORM DB2-COMMIT                                                
LRM004        MOVE ZERO TO WS-COMMIT-CTR                                        
LRM004     END-IF.                                                              
LRM009 UPDATE-OPEN-FAIL-EXIT. EXIT.                                             
LRM004     EJECT                                                                
LRM002 PROCESS-ROLLOVER-FILE.                                                   
LRM002     IF FMT-ROLL-DETAIL-RECORD (1 : 4) = 'DATE'                           
LRM002        DISPLAY 'ROLLOVER FILE DATE '                                     
LRM002                    FMT-ROLL-DETAIL-RECORD (1 : 20)                       
LRM002        GO TO PROCESS-ROLLOVER-SKIP                                       
LRM002     END-IF.                                                              
LRM002     MOVE '0'                  TO DB-CLIENT-NBR.                          
LRM002     MOVE FMT-ROLL-ADP-CL-NO-X TO DB-CLIENT-NBR (2 : 3).                  
LRM002     MOVE FMT-ROLL-SECR-866-NBR TO SCRTY-866-NBR OF DCLVASTHSTY.          
LRM002     MOVE FMT-ROLL-SECR-866-QTY-9 TO ASSET-866-QTY OF DCLVASTHSTY.        
LRM002     MOVE FMT-ROLL-CONTROL-NBR  TO DB-ACAT-CONTROL-NBR                    
LRM002     MOVE FMT-ROLL-ASSET-SEQ-NBR TO DB-ASSET-SEQ-NBR                      
LRM002     EXEC SQL                                                             
LRM002        UPDATE VASTHSTY                                                   
LRM002           SET SCRTY_866_NBR = :DCLVASTHSTY.SCRTY-866-NBR                 
LRM002              ,ASSET_866_QTY = :DCLVASTHSTY.ASSET-866-QTY                 
LRM002              ,PRGM_NM       = 'CAT874  '                                 
LRM002              ,UPDT_TMSTP    = :WS-TMSTMP                                 
LRM002           WHERE CLIENT_NBR       = :DB-CLIENT-NBR        AND             
LRM002                 ACAT_CONTROL_NBR = :DB-ACAT-CONTROL-NBR  AND             
LRM002                 ASSET_SEQ_NBR    = :DB-ASSET-SEQ-NBR                     
LRM002     END-EXEC.                                                            
LRM002                                                                          
LRM002     EVALUATE SQLCODE                                                     
LRM002        WHEN +0                                                           
LRM002           ADD  +1  TO  WS-COMMIT-CTR                                     
LRM002                        ROLLOVER-VASTHSTY-UPD                             
LRM002        WHEN +100                                                         
LRM002           ADD  +1  TO  ROLLOVER-NOTFND                                   
LRM002           DISPLAY 'ROLLOVER UPD NOTFND ' DB-CLIENT-NBR                   
LRM002              ' ' DB-ACAT-CONTROL-NBR ' ' DB-ASSET-SEQ-NBR                
LRM002        WHEN -911                                                         
LRM002           MOVE 0                     TO  WS-WACK-CNTR                    
LRM002           PERFORM UNTIL SQLCODE = +0 OR                                  
LRM002              WS-WACK-CNTR > 10                                           
LRM002              EXEC SQL                                                    
LRM002                 UPDATE VASTHSTY                                          
LRM002                 SET SCRTY_866_NBR = :DCLVASTHSTY.SCRTY-866-NBR           
LRM002                    ,ASSET_866_QTY = :DCLVASTHSTY.ASSET-866-QTY           
LRM002                    ,PRGM_NM       = 'CAT874  '                           
LRM002                    ,UPDT_TMSTP    = :WS-TMSTMP                           
LRM002                 WHERE CLIENT_NBR       = :DB-CLIENT-NBR       AND        
LRM002                       ACAT_CONTROL_NBR = :DB-ACAT-CONTROL-NBR AND        
LRM002                       ASSET_SEQ_NBR    = :DB-ASSET-SEQ-NBR               
LRM002              END-EXEC                                                    
LRM002              ADD 1 TO WS-WACK-CNTR                                       
LRM002           END-PERFORM                                                    
LRM002        WHEN OTHER                                                        
LRM002           PERFORM DB2-ERROR-ROUTINE                                      
LRM002           DISPLAY '************************'                             
LRM002           DISPLAY '* PROGRAM IS ABENDING! *'                             
LRM002           DISPLAY '************************'                             
LRM002           MOVE +1800    TO ABEND-CODE                                    
LRM002           CALL ABEND             USING  ABEND-CODE                       
LRM002     END-EVALUATE.                                                        
LRM002                                                                          
LRM002     IF WS-COMMIT-CTR > +10                                               
LRM002        PERFORM DB2-COMMIT                                                
LRM002        MOVE ZERO TO WS-COMMIT-CTR                                        
LRM002     END-IF.                                                              
LRM002                                                                          
LRM002 PROCESS-ROLLOVER-SKIP.                                                   
LRM002     READ ROLLOVER-866-FILE                                               
LRM002       AT END                                                             
LRM002          SET EOF-ROLL TO TRUE                                            
LRM002       NOT AT END                                                         
LRM002          ADD +1 TO ROLLOVER-RECS-READ                                    
LRM002     END-READ.                                                            
LRM002                                                                          
LRM002 PROCESS-ROLLOVER-EXIT. EXIT.                                             
LRM002     EJECT                                                                
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
                                                                                
LRM001     OPEN INPUT   CAGE-T3RDFL.                                            
LRM001     OPEN INPUT   PEND-FILE.                                              
LRM001     READ PEND-FILE                                                       
LRM001       AT END                                                             
LRM001          SET EOF-PEND TO TRUE                                            
LRM001       NOT AT END                                                         
LRM001          ADD +1 TO PEND-RECS-READ                                        
LRM001     END-READ.                                                            
                                                                                
LRM001     OPEN INPUT   PEND-FUNDSERV-FILE.                                     
LRM001     READ PEND-FUNDSERV-FILE                                              
LRM001       AT END                                                             
LRM001          SET EOF-FUND TO TRUE                                            
LRM001       NOT AT END                                                         
LRM001          ADD +1 TO FUNDSERV-RECS-READ                                    
LRM001     END-READ.                                                            
                                                                                
LRM002     OPEN INPUT ROLLOVER-866-FILE.                                        
LRM002     READ ROLLOVER-866-FILE                                               
LRM002       AT END                                                             
LRM002          SET EOF-ROLL TO TRUE                                            
LRM002       NOT AT END                                                         
LRM002          IF FMT-ROLL-DETAIL-RECORD (1 : 4) NOT = 'DATE'                  
LRM002             ADD +1 TO ROLLOVER-RECS-READ                                 
LRM002          END-IF                                                          
LRM002     END-READ.                                                            
      *         OUTPUT  REPORT-FILE.                                            
                                                                                
           INITIALIZE BPDATES-PARAMETERS.                                       
           MOVE 'CAT874'                   TO  BPDATES-CALLING-PGM.             
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
                                                                                
LRM001     CLOSE  CAGE-T3RDFL.                                                  
LRM001     CLOSE  PEND-FILE.                                                    
LRM001     CLOSE  PEND-FUNDSERV-FILE.                                           
LRM002     CLOSE  ROLLOVER-866-FILE.                                            
      *           REPORT-FILE.                                                  
                                                                                
LRM001     DISPLAY 'CAGE TAG RECS READ       ' CAGE-T3RDFL-RECS-READ            
LRM001     DISPLAY 'TAGS UPDATED ON VASSET   ' CAGE-TAG-VASSET-UPD              
LRM001     DISPLAY 'TAGS UPDATED ON VASTHSTY ' CAGE-TAG-VASTHSTY-UPD            
LRM001     DISPLAY 'TAGS NOT UPDATED         ' CAGE-T3RDFL-NOTFND               
LRM001     DISPLAY 'FUNDSERV RECS READ       ' FUNDSERV-RECS-READ               
LRM001     DISPLAY 'FUNDSRV UPD ON VASTHSTY  ' FUNDSERV-VASTHSTY-UPD            
LRM001     DISPLAY 'FUNDSERV NOT UPDATED     ' FUNDSERV-NOTFND                  
           DISPLAY ' '.                                                         
LRM001     DISPLAY 'PEND FILE RECS READ      ' PEND-RECS-READ                   
LRM004     DISPLAY 'FAIL COMPLETED UPDATES   ' FAILCMPLT-VASTHSTY-UPD           
LRM004     DISPLAY 'FAIL COMPLD NOT FOUND    ' FAILCMPLT-NOTFND                 
           DISPLAY ' '.                                                         
LRM002     DISPLAY 'ROLLOVER RECS READ       ' ROLLOVER-RECS-READ               
LRM002     DISPLAY 'ROLLOVER UPDATES         ' ROLLOVER-VASTHSTY-UPD            
LRM002     DISPLAY 'ROLLOVER UPD NOT FOUND   ' ROLLOVER-NOTFND                  
           DISPLAY ' '.                                                         
           DISPLAY ' '.                                                         
           DISPLAY '********************************************'.              
           DISPLAY '* PROGRAM CAT874 IS COMPLETED SUCCESSFULLY *'.              
           DISPLAY '********************************************'.              
           DISPLAY ' '.                                                         
