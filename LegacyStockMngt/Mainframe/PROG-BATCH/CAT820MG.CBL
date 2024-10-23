000001* PDX    - CAT820MG C0302248 10/05/10 09:36:28 TBLAMUR            00001000
000001* LRM002 - SSR 72170 DUPILCATE FEES.  CHANGED TO DB2 PROGRAM              
000001*    TO SELECT ACAT STATUS FROM VTRNFR, DROP FROM RETAIN FILE             
000001*    WHEN REJECTED STATUS 140, 600.                                       
000001* PDX    - CAT820MG C0296621 08/20/10 14:25:10 TBLAMUR            00001000
000001* LRM001 - SSR 71810 FOREIGN ASSET FEE EXPANND RETENTION FILE.            
000001* PDX    - CAT820MG C0151264 12/11/00 13:34:48 TBTIKUO            00001000
000001* PDX    - CAT820MG C0124738 04/21/99 08:17:02 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT820MG.                                                   
                                                                                
      *-------------------------------------------------------------*           
      *  THE PURPOSE OF THIS PROGRAM IS TO DROP FEES FROM THE                   
      *    CAT820.RET (RETAINED FEES) WHEN THE CLIENT/CONTROL # IS              
      *    FOUND ON THE CURRENT DAY'S FEE FILE.                                 
      *-------------------------------------------------------------*           
                                                                                
       ENVIRONMENT DIVISION.                                                    
                                                                                
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT TFRS-FEE-FILE         ASSIGN TFRSFLI.                         
           SELECT RETAIN-FILE-IN        ASSIGN FEEOLD.                          
           SELECT RETAIN-FILE-OUT       ASSIGN FEENEW.                          
                                                                                
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
                                                                                
       FD  TFRS-FEE-FILE                                                        
           RECORDING MODE IS F                                                  
           LABEL RECORDS STANDARD                                               
           BLOCK CONTAINS 0 RECORDS.                                            
       COPY ACATDLVF REPLACING ==:FMT:== BY ==TFRS==.                           
                                                                                
       FD  RETAIN-FILE-IN                                                       
           RECORDING MODE IS V                                                  
           LABEL RECORDS STANDARD                                               
           BLOCK CONTAINS 0 RECORDS.                                            
       01  RET-COMMON-REC.                                                      
           05  RET-COM-CLIENT          PIC X(03).                               
           05  RET-COM-BRANCH          PIC X(03).                               
           05  RET-COM-ACCOUNT         PIC X(05).                               
           05  RET-COM-CONTROL         PIC X(14).                               
LRM007     05  RET-P2-REC-TYPE         PIC X(05).                               
LRM007         88  RET-P2-FRGN-FEE                  VALUE 'FRGN '.              
LRM007     05  RET-P2-ADP-NBR          PIC X(07).                               
LRM007     05  RET-P2-ACCOUNT-TYPE     PIC X(01).                               
           05  RET-COM-TYPE            PIC X(01).                               
LRM007 01  RET-P2-REC                  PIC X(640).                              
       01  RET-TACT-REC                PIC X(426).                              
                                                                                
       FD  RETAIN-FILE-OUT                                                      
           RECORDING MODE IS V                                                  
           LABEL RECORDS STANDARD                                               
           BLOCK CONTAINS 0 RECORDS.                                            
LRM007 01  RET-P2-REC-OUT              PIC X(640).                              
       01  RET-TACT-REC-OUT            PIC X(426).                              
                                                                                
      ****************************************************************          
           EJECT                                                                
       WORKING-STORAGE SECTION.                                                 
       77  FILLER                      PIC X(31) VALUE                          
           '*** CAT82MG WORKING STORAGE ***'.                                   
                                                                                
      *ABORT CODES                                                              
       01  WS-ABORT-CODES.                                                      
TCK001     05  ABORT-CODE              PIC S9(4) COMP SYNC VALUE 99.            
TCK001***  05  DUMP-SW                 PIC X VALUE 'D'.                         
       01  COUNTERS COMP-3.                                                     
           02  JOB-COUNTERS.                                                    
               05  RET-RECS-READ               PIC 9(7) VALUE ZERO.             
               05  TFRS-RECS-READ              PIC 9(7) VALUE ZERO.             
               05  RET-RECS-DROPPED            PIC 9(7) VALUE ZERO.             
               05  RET-RECS-WRITTEN            PIC 9(7) VALUE ZERO.             
                                                                                
           EJECT                                                                
       01  SWITCHES.                                                            
           05  TFRS-FILE-EOF-SW             PIC X VALUE ' '.                    
               88  TFRS-END-OF-FILE               VALUE 'Y'.                    
           05  RET-FILE-EOF-SW              PIC X VALUE ' '.                    
               88  RET-END-OF-FILE                VALUE 'Y'.                    
                                                                                
           EJECT                                                                
                                                                                
       01  TFRS-CLIENT-ACAT        PIC X(17)  VALUE SPACES.                     
       01  RETAIN-CLIENT-ACAT      PIC X(17)  VALUE SPACES.                     
       01  WS-CLIENT               PIC X(04).                                   
       01  WS-CONTROL-NBR          PIC X(14).                                   
       01  W-DB2-SQLCODE           PIC ---9.                                    
                                                                                
TCK001     COPY STUBCPY.                                                        
                                                                                
       01  DSNTIAR                       PIC X(08)  VALUE 'DSNTIAR'.            
       01  WS-DB2-MESSAGE-AREA.                                                 
           05  WS-DB2-MSG-LEN            PIC S9(04) COMP VALUE +960.            
           05  WS-ERROR-MSG              PIC X(80)  OCCURS 12 TIMES             
               INDEXED BY WS-ERROR-INDEX.                                       
       01  WS-ERR-LINE-LEN               PIC S9(09) COMP VALUE +80.             
                                                                                
      *DB2 COMMUNICATION AREA                                                   
           EXEC SQL                                                             
              INCLUDE SQLCA                                                     
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
           EXEC SQL                                                             
              INCLUDE VTRNFR                                                    
           END-EXEC.                                                            
                                                                                
           EJECT                                                        02620000
                                                                                
       PROCEDURE DIVISION.                                                      
           COPY MSGCOBO.                                                        
                                                                                
           PERFORM 0200-FILE-INIT THRU                                          
                   0200-FILE-INIT-EXIT.                                         
                                                                                
           PERFORM 0400-MERGE-FEE-FILES                                         
                            THRU  0400-EXIT                                     
               UNTIL TFRS-FILE-EOF-SW = 'Y'                                     
                 AND RET-FILE-EOF-SW = 'Y'.                                     
                                                                                
           DISPLAY 'RETAIN RECORDS READ    ' RET-RECS-READ                      
           DISPLAY 'CUR FEE RECORDS READ   ' TFRS-RECS-READ                     
           DISPLAY 'RETAIN RECORDS DROPPED ' RET-RECS-DROPPED                   
           DISPLAY 'RETAIN RECORDS WRITTEN ' RET-RECS-WRITTEN                   
                                                                                
           CLOSE TFRS-FEE-FILE.                                                 
           CLOSE RETAIN-FILE-IN.                                                
           CLOSE RETAIN-FILE-OUT.                                               
                                                                                
           GOBACK.                                                              
           EJECT                                                                
       0200-FILE-INIT.                                                          
                                                                                
           OPEN INPUT TFRS-FEE-FILE.                                            
           OPEN INPUT RETAIN-FILE-IN.                                           
           OPEN OUTPUT RETAIN-FILE-OUT.                                         
                                                                                
           PERFORM 0500-READ-TFRS-FEE.                                          
           PERFORM 0600-READ-RETAIN-FILE                                        
              THRU 0600-READ-EXIT.                                              
                                                                                
       0200-FILE-INIT-EXIT.  EXIT.                                              
                                                                                
           EJECT                                                                
       0400-MERGE-FEE-FILES.                                                    
                                                                                
    ***** WHEN NO MATCHING TFRS FEE, WRITE OUT RETAIN RECORDS.                  
           PERFORM UNTIL RET-FILE-EOF-SW = 'Y'                                  
                   OR RETAIN-CLIENT-ACAT NOT < TFRS-CLIENT-ACAT                 
             IF RET-COM-TYPE = 'B'                                              
               MOVE RET-P2-REC TO RET-P2-REC-OUT                                
               WRITE RET-P2-REC-OUT                                             
             ELSE                                                               
               MOVE RET-TACT-REC TO RET-TACT-REC-OUT                            
               WRITE RET-TACT-REC-OUT                                           
             END-IF                                                             
             ADD 1 TO RET-RECS-WRITTEN                                          
             PERFORM 0600-READ-RETAIN-FILE                                      
                THRU 0600-READ-EXIT                                             
           END-PERFORM.                                                         
                                                                                
    ***** WHEN MATCHING TFRS FEE, SKIP THE RETAIN RECORDS.                      
           PERFORM UNTIL RET-FILE-EOF-SW = 'Y'                                  
                   OR RETAIN-CLIENT-ACAT NOT = TFRS-CLIENT-ACAT                 
TEST         DISPLAY 'DROPPING ' RETAIN-CLIENT-ACAT                             
             ADD 1 TO RET-RECS-DROPPED                                          
             PERFORM 0600-READ-RETAIN-FILE                                      
                THRU 0600-READ-EXIT                                             
           END-PERFORM.                                                         
                                                                                
    ***** WHEN NO MATCHING RETAIN FEE, READ FORWARD THRU TFRS RECORDS.          
           PERFORM UNTIL TFRS-FILE-EOF-SW = 'Y'                                 
                   OR TFRS-CLIENT-ACAT NOT < RETAIN-CLIENT-ACAT                 
             PERFORM 0500-READ-TFRS-FEE                                         
           END-PERFORM.                                                         
                                                                                
       0400-EXIT. EXIT.                                                         
                                                                                
       EJECT                                                            02620000
                                                                                
       0500-READ-TFRS-FEE.                                                      
           READ TFRS-FEE-FILE                                                   
             AT END                                                             
                  DISPLAY 'TFRS FEE AT END'                                     
                  MOVE 'Y' TO TFRS-FILE-EOF-SW                                  
                  MOVE HIGH-VALUES TO TFRS-CLIENT-ACAT                          
             NOT AT END                                                         
                  ADD 1 TO TFRS-RECS-READ                                       
                  MOVE TFRS-ADP-CL-NO-X TO TFRS-CLIENT-ACAT(1 : 3)              
                  MOVE TFRS-CONTROL-NBR TO TFRS-CLIENT-ACAT(4 : 14)             
           END-READ.                                                            
                                                                                
       0600-READ-RETAIN-FILE.                                                   
           READ RETAIN-FILE-IN                                                  
             AT END                                                             
                  DISPLAY 'RETAIN FILE AT END'                                  
                  MOVE 'Y' TO RET-FILE-EOF-SW                                   
                  MOVE HIGH-VALUES TO RETAIN-CLIENT-ACAT                        
                  GO TO 0600-READ-EXIT                                          
           END-READ.                                                            
                                                                                
           ADD 1 TO RET-RECS-READ                                               
LRM002     MOVE '0'             TO WS-CLIENT(1 : 1)                             
           MOVE RET-COM-CLIENT  TO RETAIN-CLIENT-ACAT(1 : 3)                    
LRM002                             WS-CLIENT(2 : 3)                             
           MOVE RET-COM-CONTROL TO RETAIN-CLIENT-ACAT(4 : 14)                   
LRM002                             WS-CONTROL-NBR                               
LRM002     EXEC SQL                                                             
LRM002        SELECT                                                            
LRM002              STTS_CD                                                     
LRM002           INTO                                                           
LRM002              :DCLVTRNFR.STTS-CD                                          
LRM002           FROM VTRNFR                                                    
LRM002           WHERE (CLIENT_NBR =                                            
LRM002                      :WS-CLIENT                                          
LRM002             AND ACAT_CONTROL_NBR =                                       
LRM002                      :WS-CONTROL-NBR)                                    
LRM002            WITH UR                                                       
LRM002     END-EXEC.                                                            
LRM002                                                                          
LRM002     EVALUATE SQLCODE                                                     
LRM002           WHEN +100                                                      
LRM002              DISPLAY 'DROPPING ' RETAIN-CLIENT-ACAT ' ' STTS-CD          
LRM002              ADD 1 TO RET-RECS-DROPPED                                   
LRM002              GO TO 0600-READ-RETAIN-FILE                                 
LRM002           WHEN +0                                                        
LRM002              IF STTS-CD = '140' OR '600'                                 
LRM002                DISPLAY 'DROPPING ' RETAIN-CLIENT-ACAT ' ' STTS-CD        
LRM002                ADD 1 TO RET-RECS-DROPPED                                 
LRM002                GO TO 0600-READ-RETAIN-FILE                               
LRM002              END-IF                                                      
LRM002           WHEN OTHER                                                     
LRM002              MOVE 2500 TO ABORT-CODE                                     
LRM002              PERFORM SQL-ERROR-ROUTINE                                   
LRM002     END-EVALUATE.                                                        
LRM002                                                                          
LRM002 0600-READ-EXIT. EXIT.                                                    
                                                                                
      *******************                                                       
       SQL-ERROR-ROUTINE.                                                       
      *******************                                                       
                                                                                
           MOVE SQLCODE TO  W-DB2-SQLCODE                                       
           DISPLAY 'SQLCODE IS ' W-DB2-SQLCODE                                  
                                                                                
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
                                                                                
           MOVE 600 TO  ABORT-CODE                                              
           PERFORM ABEND-RTN                                                    
                                                                                
           .                                                                    
       ABEND-RTN.                                                               
TCK001     CALL  ABEND  USING ABORT-CODE.                                       
                                                                                
