000001* PDX    - CAT900   C0278295 03/16/09 14:21:19 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT900.                                                     
       AUTHOR.      LARRY MUREY.                                                
       DATE-WRITTEN.  MAR 2009.                                                 
      **REMARKS.                                                                
      *****************************************************************         
      *                                                                         
      *PROGRAM DESCRIPTION:                                                     
      * COPY SOURCE FROM CATUPLD.  COVERT VRSTSEC AND VRSTBRKR TO USE           
      *     ADP-NO AS PRIMARY KEY, NOT CUSIP.                                   
      *                                                                         
      *     FIRST ISSUE DELETE OF TABLES, THEN READ THRU BACKUP FILE            
      *     AND LOOKUP ADP-NBRS ON MSD.                                         
      *****************************************************************         
           EJECT                                                                
       ENVIRONMENT DIVISION.                                                    
       CONFIGURATION SECTION.                                                   
       SOURCE-COMPUTER.  IBM-370.                                               
       OBJECT-COMPUTER.  IBM-370.                                               
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT EXTRACT-FILE                  ASSIGN  TO  EXTR.               
                                                                                
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
                                                                                
       FD  EXTRACT-FILE                                                         
           RECORDING MODE IS V                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
       01  EXTRACT-RECORD.                                                      
           05  RECORD-SEG-ID        PIC X(08).                                  
           05  RECORD-DETAIL        PIC X(742).                                 
                                                                                
           EJECT                                                                
                                                                                
       WORKING-STORAGE SECTION.                                                 
       01  WS-NAME                          PIC X(40)                           
           VALUE 'CAT900 WORKING STORAGE STARTS HERE'.                          
                                                                                
       01  WS-EOF-IND                PIC X(01) VALUE SPACES.            CAT515  
           88 EOF                    VALUE 'Y'.                                 
       01  WORKAREA.                                                            
           05  WS-CLIENT-NBR          PIC X(4).                                 
           05  WS-CLIENT-NBR9 REDEFINES WS-CLIENT-NBR PIC 9(4).                 
           05  WS-TMSTP               PIC X(26).                                
           05  WS-VRSTBRKR-COUNT      PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VRSTSEC-COUNT       PIC S9(9) COMP-3 VALUE ZEROS.             
                                                                                
           05  W-COMMIT-CTR              PIC S9(005) COMP-3             CAT519  
                                              VALUE 0.                  CAT519  
           05  WS-COMMITS-PERFORMED      PIC S9(005) COMP-3             CAT519  
                                              VALUE 0.                  CAT519  
                                                                                
           05  WS-VRSTBRKR-COUNT-REPL PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VRSTSEC-COUNT-REPL  PIC S9(9) COMP-3 VALUE ZEROS.             
                                                                                
           COPY GETMSDCE.                                               13870031
           COPY STUBCPY.                                                        
           EJECT                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT RESTRICTED BRKR TABLE                                    
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VRSTBRKR                                                 
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT RESTRICTED SECR TABLE                                    
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VRSTSEC                                                  
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      * INCLUDE FOR DB2 COMMUNICATIONS AREA.                                    
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE SQLCA                                                    
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
                                                                                
       01  WORK-AREA.                                                           
           05  PROGRAM-NAME            PIC X(08) VALUE 'CAT900 '.               
           05  WS-INDEX                PIC 9(04) COMP.                          
           EJECT                                                                
                                                                                
                                                                                
       01  WS-MISC.                                                             
           05  SUB1                         PIC 9(2)  VALUE ZERO.               
           05  ABORT-CODE     COMP SYNC     PIC S9(4) VALUE ZERO.               
           05  WS-TIMESTAMP                 PIC X(26).                          
CHRIS1                                                                          
CHRIS1 01  DSNTIAR                     PIC X(08) VALUE 'DSNTIAR'.               
CHRIS1 01  WS-DB2-MESSAGE-AREA.                                                 
CHRIS1      05  WS-DB2-MSG-LEN          PIC S9(04) COMP VALUE +960.             
CHRIS1      05  WS-ERROR-MSG            PIC X(80) OCCURS 12 TIMES               
CHRIS1              INDEXED BY WS-ERROR-INDEX.                                  
       01  WS-ERR-LINE-LEN             PIC S9(09) COMP VALUE +80.               
                                                                                
           EJECT                                                                
       PROCEDURE DIVISION.                                                      
                                                                                
           COPY MSGCOBO.                                                        
                                                                                
                                                                                
           OPEN INPUT EXTRACT-FILE.                                             
           PERFORM 0500-CLEAR-TABLES.                                           
           MOVE 'D'              TO GETMSD-DEVICE-IND                           
           MOVE 'R'              TO GETMSD-ACCESS-IND                           
           MOVE 'E'              TO GETMSD-FORMAT-IND                           
           PERFORM 1000-PROCESS-INPUT                                           
              THRU 1000-EXIT                                                    
                 UNTIL EOF.                                                     
                                                                                
           CLOSE EXTRACT-FILE.                                                  
                                                                                
           DISPLAY 'RECORDS INSERTED:'.                                         
           DISPLAY 'VRSTBRKR = ' WS-VRSTBRKR-COUNT                              
           DISPLAY 'VRSTSEC  = ' WS-VRSTSEC-COUNT                               
           DISPLAY ' '.                                                         
           DISPLAY 'RECORDS UPDATED:'.                                          
           DISPLAY 'VRSTBRKR = ' WS-VRSTBRKR-COUNT-REPL                         
           DISPLAY 'VRSTSEC  = ' WS-VRSTSEC-COUNT-REPL                          
           DISPLAY 'COMMITS  = ' WS-COMMITS-PERFORMED.                  CAT519  
                                                                                
           GOBACK.                                                              
                                                                                
           EJECT                                                                
       0500-CLEAR-TABLES.                                                       
           EXEC SQL                                                             
               DELETE FROM VRSTBRKR                                             
           WHERE CRT_TMSTP >                                                    
                     '0001-01-01-00.00.00.000001'                               
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
              WHEN +100                                                         
                 DISPLAY 'VRSTBRKR EMPTY'                                       
              WHEN OTHER                                                        
                    MOVE 0550 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
           EXEC SQL                                                             
               DELETE FROM VRSTSEC                                              
           WHERE CRT_TMSTP >                                                    
                     '0001-01-01-00.00.00.000001'                               
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
              WHEN +100                                                         
                 DISPLAY 'VRSTSEC EMPTY'                                        
              WHEN OTHER                                                        
                    MOVE 0580 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       1000-PROCESS-INPUT.                                                      
           READ EXTRACT-FILE                                                    
              AT END                                                            
                 SET EOF TO TRUE                                                
                 GO TO 1000-EXIT.                                               
                                                                                
           IF W-COMMIT-CTR > +30                                                
              PERFORM 8100-SQL-COMMIT                                   CAT519  
           END-IF.                                                              
                                                                                
           IF RECORD-SEG-ID = 'VRSTBRKR'                                        
              PERFORM 2500-CREATE-VRSTBRKR-RTN THRU 2500-EXIT                   
           ELSE                                                                 
           IF RECORD-SEG-ID = 'VRSTSEC '                                        
              PERFORM 2600-CREATE-VRSTSEC-RTN THRU 2600-EXIT                    
           ELSE                                                                 
              GO TO 1000-EXIT                                                   
           END-IF.                                                              
                                                                                
           ADD +1 TO W-COMMIT-CTR.                                              
                                                                                
       1000-EXIT. EXIT.                                                         
                                                                                
           EJECT                                                                
       2500-CREATE-VRSTBRKR-RTN.                                                
                                                                                
           MOVE RECORD-DETAIL TO DCLVRSTBRKR.                                   
           MOVE LOW-VALUES             TO GETMSD-SEARCH-KEY-AREA                
           MOVE CLIENT-NBR OF DCLVRSTBRKR TO WS-CLIENT-NBR.             45370031
           MOVE WS-CLIENT-NBR9           TO GETMSD-CLIENT-PL2           45370031
           MOVE '0'                    TO GETMSD-WI-CODE                        
           MOVE SECURITY-ADP-NBR OF DCLVRSTBRKR TO GETMSD-SEARCH-KEY    45380031
           PERFORM 3000-READ-MSD-RTN.                                           
           IF NOT GETMSD-RETURN-VALID                                           
              DISPLAY 'MSD NOT VALID FOR VRSTBRKR ' GETMSD-SEARCH-KEY           
                              ' ' ISIN-SEC-ISSUE-CD OF DCLVRSTBRKR              
              GO TO 2500-EXIT.                                                  
                                                                                
           MOVE MS-ADP-NO TO        ISIN-SEC-ISSUE-CD OF DCLVRSTBRKR    45380031
           EXEC SQL                                                             
               INSERT INTO VRSTBRKR                                             
                 (                                                              
                     CLIENT_NBR                                                 
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,BRKR_CONTRA_NBR                                            
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,SECURITY_ADP_NBR                                           
LRM008              ,EXPTN_DT                                                   
LRM008              ,COMMENT_TXT                                                
LRM008              ,CICS_SGNON_ID                                              
LRM008              ,TPSCRT_USR_NM                                              
LRM008              ,TPSCRT_USR_ID                                              
LRM008              ,CICS_NET_NM                                                
                 )                                                              
                  VALUES                                                        
                 (                                                              
                   :DCLVRSTBRKR.CLIENT-NBR                                      
                  ,:DCLVRSTBRKR.ISIN-SEC-ISSUE-CD                               
                  ,:DCLVRSTBRKR.BRKR-CONTRA-NBR                                 
                  ,:DCLVRSTBRKR.CRT-TMSTP                                       
                  ,:DCLVRSTBRKR.UPDT-TMSTP                                      
                  ,:DCLVRSTBRKR.CICS-TERM-ID-CD                                 
                  ,:DCLVRSTBRKR.PRGM-NM                                         
                  ,:DCLVRSTBRKR.SECURITY-ADP-NBR                                
LRM008            ,:DCLVRSTBRKR.EXPTN-DT                                        
LRM008            ,:DCLVRSTBRKR.COMMENT-TXT                                     
LRM008            ,:DCLVRSTBRKR.CICS-SGNON-ID                                   
LRM008            ,:DCLVRSTBRKR.TPSCRT-USR-NM                                   
LRM008            ,:DCLVRSTBRKR.TPSCRT-USR-ID                                   
LRM008            ,:DCLVRSTBRKR.CICS-NET-NM                                     
                 )                                                              
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN -803                                                         
                   PERFORM 2510-UPDATE-VRSTBRKR-RTN                             
                      THRU 2510-EXIT                                            
              WHEN +0                                                           
                 ADD 1 TO WS-VRSTBRKR-COUNT                                     
              WHEN OTHER                                                        
                    MOVE 2520 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
       2500-EXIT. EXIT.                                                         
                                                                                
       2510-UPDATE-VRSTBRKR-RTN.                                                
           DISPLAY 'DUPE VRSTBRKR ROW '                                         
                               CLIENT-NBR OF DCLVRSTBRKR                45370031
                           ' ' SECURITY-ADP-NBR OF DCLVRSTBRKR.         45380031
                                                                                
LRM**** READ PROIR UPDT TMSTP AND UPDATE IF THIS IS NEWER.                      
           EXEC SQL                                                             
               SELECT UPDT_TMSTP                                                
               INTO :WS-TMSTP                                                   
               FROM VRSTBRKR                                                    
              WHERE                                                             
                   (CLIENT_NBR    =                                             
                   :DCLVRSTBRKR.CLIENT-NBR AND                                  
                   ISIN_SEC_ISSUE_CD  =                                         
                   :DCLVRSTBRKR.ISIN-SEC-ISSUE-CD                               
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                 IF WS-TMSTP > UPDT-TMSTP OF DCLVRSTBRKR                        
                    DISPLAY 'SKIP UPDATE / OTHER IS NEWER '                     
                    GO TO 2510-EXIT                                             
                 END-IF                                                         
              WHEN OTHER                                                        
                    MOVE 2510 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
           EXEC SQL                                                             
               UPDATE VRSTBRKR                                                  
                 SET                                                            
                 CRT_TMSTP          = :DCLVRSTBRKR.CRT-TMSTP                    
                ,UPDT_TMSTP         = :DCLVRSTBRKR.UPDT-TMSTP                   
                ,CICS_TERM_ID_CD    = :DCLVRSTBRKR.CICS-TERM-ID-CD              
                ,PRGM_NM            = :DCLVRSTBRKR.PRGM-NM                      
                ,SECURITY_ADP_NBR   = :DCLVRSTBRKR.CLIENT-NBR                   
LRM008          ,EXPTN_DT           = :DCLVRSTBRKR.EXPTN-DT                     
LRM008          ,COMMENT_TXT        = :DCLVRSTBRKR.COMMENT-TXT                  
LRM008          ,CICS_SGNON_ID      = :DCLVRSTBRKR.CICS-SGNON-ID                
LRM008          ,TPSCRT_USR_NM      = :DCLVRSTBRKR.TPSCRT-USR-NM                
LRM008          ,TPSCRT_USR_ID      = :DCLVRSTBRKR.TPSCRT-USR-ID                
LRM008          ,CICS_NET_NM        = :DCLVRSTBRKR.CICS-NET-NM                  
              WHERE                                                             
                   (CLIENT_NBR    =                                             
                   :DCLVRSTBRKR.CLIENT-NBR AND                                  
                   ISIN_SEC_ISSUE_CD  =                                         
                   :DCLVRSTBRKR.ISIN-SEC-ISSUE-CD AND                           
                   BRKR_CONTRA_NBR    =                                         
                   :DCLVRSTBRKR.BRKR-CONTRA-NBR                                 
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                 ADD 1 TO WS-VRSTBRKR-COUNT-REPL                                
              WHEN OTHER                                                        
                    MOVE 2540 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
       2510-EXIT. EXIT.                                                         
                                                                                
       2600-CREATE-VRSTSEC-RTN.                                                 
                                                                                
           MOVE RECORD-DETAIL TO DCLVRSTSEC.                                    
           MOVE LOW-VALUES             TO GETMSD-SEARCH-KEY-AREA                
           MOVE CLIENT-NBR OF DCLVRSTSEC TO WS-CLIENT-NBR.              45370031
           MOVE WS-CLIENT-NBR9           TO GETMSD-CLIENT-PL2           45370031
           MOVE '0'                    TO GETMSD-WI-CODE                        
           MOVE SECURITY-ADP-NBR OF DCLVRSTSEC TO GETMSD-SEARCH-KEY     45380031
           PERFORM 3000-READ-MSD-RTN.                                           
           IF NOT GETMSD-RETURN-VALID                                           
              DISPLAY 'MSD NOT VALID FOR VRSTSEC ' GETMSD-SEARCH-KEY            
                              ' ' ISIN-SEC-ISSUE-CD OF DCLVRSTSEC               
              GO TO 2600-EXIT.                                                  
                                                                                
           MOVE MS-ADP-NO TO        ISIN-SEC-ISSUE-CD OF DCLVRSTSEC     45380031
           EXEC SQL                                                             
               INSERT INTO VRSTSEC                                              
                 (                                                              
                     CLIENT_NBR                                                 
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,TRNFR_MEMO_IND                                             
                    ,TRNFR_BRKR_TYPE_CD                                         
                    ,RSTRD_MSG_TXT                                              
                    ,PRGM_NM                                                    
                    ,CICS_TERM_ID_CD                                            
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,SECURITY_ADP_NBR                                           
LRM008              ,EXPTN_DT                                                   
LRM008              ,COMMENT_TXT                                                
LRM008              ,CICS_SGNON_ID                                              
LRM008              ,TPSCRT_USR_NM                                              
LRM008              ,TPSCRT_USR_ID                                              
LRM008              ,CICS_NET_NM                                                
                 )                                                              
                  VALUES                                                        
                 (                                                              
                   :DCLVRSTSEC.CLIENT-NBR                                       
                  ,:DCLVRSTSEC.ISIN-SEC-ISSUE-CD                                
                  ,:DCLVRSTSEC.TRNFR-MEMO-IND                                   
                  ,:DCLVRSTSEC.TRNFR-BRKR-TYPE-CD                               
                  ,:DCLVRSTSEC.RSTRD-MSG-TXT                                    
                  ,:DCLVRSTSEC.PRGM-NM                                          
                  ,:DCLVRSTSEC.CICS-TERM-ID-CD                                  
                  ,:DCLVRSTSEC.CRT-TMSTP                                        
                  ,:DCLVRSTSEC.UPDT-TMSTP                                       
                  ,:DCLVRSTSEC.SECURITY-ADP-NBR                                 
LRM008            ,:DCLVRSTSEC.EXPTN-DT                                         
LRM008            ,:DCLVRSTSEC.COMMENT-TXT                                      
LRM008            ,:DCLVRSTSEC.CICS-SGNON-ID                                    
LRM008            ,:DCLVRSTSEC.TPSCRT-USR-NM                                    
LRM008            ,:DCLVRSTSEC.TPSCRT-USR-ID                                    
LRM008            ,:DCLVRSTSEC.CICS-NET-NM                                      
                 )                                                              
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN -803                                                         
                   PERFORM 2610-UPDATE-VRSTSEC-RTN                              
                      THRU 2610-EXIT                                            
              WHEN +0                                                           
                 ADD 1 TO WS-VRSTSEC-COUNT                                      
              WHEN OTHER                                                        
                    MOVE 2620 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       2600-EXIT. EXIT.                                                         
                                                                                
       2610-UPDATE-VRSTSEC-RTN.                                                 
           DISPLAY 'DUPE VRSTSEC ROW '                                          
                               CLIENT-NBR OF DCLVRSTSEC                 45370031
                           ' ' SECURITY-ADP-NBR OF DCLVRSTSEC.          45380031
                                                                                
LRM**** READ PROIR UPDT TMSTP AND UPDATE IF THIS IS NEWER.                      
           EXEC SQL                                                             
               SELECT UPDT_TMSTP                                                
               INTO :WS-TMSTP                                                   
               FROM VRSTSEC                                                     
              WHERE                                                             
                   (CLIENT_NBR    =                                             
                   :DCLVRSTSEC.CLIENT-NBR AND                                   
                   ISIN_SEC_ISSUE_CD  =                                         
                   :DCLVRSTSEC.ISIN-SEC-ISSUE-CD                                
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                 IF WS-TMSTP > UPDT-TMSTP OF DCLVRSTSEC                         
                    DISPLAY 'SKIP UPDATE / OTHER IS NEWER '                     
                    GO TO 2610-EXIT                                             
                 END-IF                                                         
              WHEN OTHER                                                        
                    MOVE 2610 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
           EXEC SQL                                                             
               UPDATE VRSTSEC                                                   
                 SET                                                            
                 TRNFR_MEMO_IND     = :DCLVRSTSEC.TRNFR-MEMO-IND                
                ,TRNFR_BRKR_TYPE_CD = :DCLVRSTSEC.TRNFR-BRKR-TYPE-CD            
                ,RSTRD_MSG_TXT      = :DCLVRSTSEC.RSTRD-MSG-TXT                 
                ,PRGM_NM            = :DCLVRSTSEC.PRGM-NM                       
                ,CICS_TERM_ID_CD    = :DCLVRSTSEC.CICS-TERM-ID-CD               
                ,CRT_TMSTP          = :DCLVRSTSEC.CRT-TMSTP                     
                ,UPDT_TMSTP         = :DCLVRSTSEC.UPDT-TMSTP                    
                ,SECURITY_ADP_NBR   = :DCLVRSTSEC.SECURITY-ADP-NBR              
LRM008          ,EXPTN_DT           = :DCLVRSTSEC.EXPTN-DT                      
LRM008          ,COMMENT_TXT        = :DCLVRSTSEC.COMMENT-TXT                   
LRM008          ,CICS_SGNON_ID      = :DCLVRSTSEC.CICS-SGNON-ID                 
LRM008          ,TPSCRT_USR_NM      = :DCLVRSTSEC.TPSCRT-USR-NM                 
LRM008          ,TPSCRT_USR_ID      = :DCLVRSTSEC.TPSCRT-USR-ID                 
LRM008          ,CICS_NET_NM        = :DCLVRSTSEC.CICS-NET-NM                   
              WHERE                                                             
                   (CLIENT_NBR    =                                             
                   :DCLVRSTSEC.CLIENT-NBR AND                                   
                   ISIN_SEC_ISSUE_CD  =                                         
                   :DCLVRSTSEC.ISIN-SEC-ISSUE-CD                                
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                 ADD 1 TO WS-VRSTSEC-COUNT-REPL                                 
              WHEN OTHER                                                        
                    MOVE 2640 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       2610-EXIT. EXIT.                                                         
                                                                                
       3000-READ-MSD-RTN.                                                       
644200     CALL  GETMSDC  USING MASTER-SECURITY-RECORD                          
644300                                                                          
644400     IF  NOT GETMSD-RETURN-REC-NOT-FOUND                                  
644400     AND NOT GETMSD-RETURN-VALID                                          
644500         DISPLAY 'GETMSDC CALL ROUTINE FAILED, RC = '                     
644600                      GETMSD-RETURN-CODE                                  
               MOVE 3000 TO ABORT-CODE                                          
               PERFORM SQL-ERROR-ROUTINE                                        
644800     END-IF.                                                              
                                                                                
       8100-SQL-COMMIT.                                                 CAT519  
                                                                        CAT519  
           EXEC SQL COMMIT                                              CAT519  
           END-EXEC                                                     CAT519  
                                                                        CAT519  
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                 MOVE ZERO TO W-COMMIT-CTR                                      
                 ADD +1 TO WS-COMMITS-PERFORMED                                 
              WHEN OTHER                                                        
                    MOVE 8100 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
      *============================                                             
       SQL-ERROR-ROUTINE.                                                       
      *============================                                             
CHRIS1                                                                          
CHRIS1     CALL DSNTIAR USING SQLCA WS-DB2-MESSAGE-AREA                         
CHRIS1                              WS-ERR-LINE-LEN.                            
CHRIS1     PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                           
CHRIS1       UNTIL WS-ERROR-INDEX GREATER THAN 12                               
CHRIS1             IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES                    
CHRIS1                DISPLAY WS-ERROR-MSG (WS-ERROR-INDEX)                     
CHRIS1             END-IF                                                       
CHRIS1     END-PERFORM.                                                         
CHRIS1                                                                          
CHRIS1     DISPLAY 'CAT900 DB2 PROBLEM'.                                        
CHRIS1     DISPLAY 'SQL CODE = ' SQLCODE.                                       
CHRIS1     DISPLAY 'SQLQA = ' SQLCA.                                            
CHRIS1     DISPLAY 'PROGRAM ABORTED'.                                           
                                                                                
           EXEC SQL  ROLLBACK  END-EXEC.                                        
                                                                                
           PERFORM 9999-ABEND.                                                  
       9999-ABEND.                                                              
           CALL  ABEND  USING ABORT-CODE.                                       
