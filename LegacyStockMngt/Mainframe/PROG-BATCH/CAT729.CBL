000001* PDX    - CAT729   C0155513 03/12/01 07:54:45 TBDOJUN            00001000
000001* PDX    - CAT729   C0120353 01/12/99 10:40:25 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                         00002000
       PROGRAM-ID.   CAT729.                                            00003000
       ENVIRONMENT DIVISION.                                            00004000
       INPUT-OUTPUT SECTION.                                            00005000
       FILE-CONTROL.                                                            
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
                                                                                
       WORKING-STORAGE SECTION.                                         00070000
      *---------------------------------------------------------------* 00080000
       01 IN-DATABASE.                                                          
           05 ID-CLIENT-NBR               PIC X(4)         VALUE ZEROS.         
           05 ID-RCV-NBR                  PIC X(4)         VALUE ZEROS.         
           05 ID-ACCT-RCV-NBR             PIC X(20)        VALUE ZEROS.         
           05 ID-DLVR-NBR                 PIC X(4)         VALUE ZEROS.         
           05 ID-ACCT-DLVR-NBR            PIC X(20)        VALUE ZEROS.         
           05 ID-BRANCH-CD                PIC X(3)         VALUE ZEROS.         
           05 ID-ACCT-CD                  PIC X(5)         VALUE ZEROS.         
           05 ID-ACCT-ORDERS-IND          PIC X(1)         VALUE ' '.           
           05 ID-ACAT-CONTROL-NBR         PIC X(14)        VALUE ZEROS.         
           05 ID-STTS-CD                  PIC X(03)        VALUE ZEROS.         
           05 ID-STTLM-DT                 PIC X(12)        VALUE ZEROS.         
                                                                                
      *---------------------------------------------------------------* 00080000
       01 WORK-ORDER-REC.                                                       
           05 WOR-IN-ORDER-IND             PIC X(1)      VALUE ZEROS.           
           05 FILLER                       PIC X(2)      VALUE SPACES.          
           05 WOR-CLIENT-NBR               PIC X(3)      VALUE ZEROS.           
           05 WOR-CR-DR-IND                PIC X(1)      VALUE ZEROS.           
           05 FILLER                       PIC X(27)     VALUE SPACES.          
           05 WOR-BRANCH-CD                PIC X(3)      VALUE ZEROS.           
           05 WOR-ACCT-CD                  PIC X(5)      VALUE ZEROS.           
           05 FILLER                       PIC X(37)     VALUE SPACES.          
                                                                                
       01 TRNF-ID.                                                              
           05 ND-CLIENT-NBR                PIC X(4)      VALUE ZEROS.           
           05 ND-BRANCH-CD                 PIC X(3)      VALUE ZEROS.           
           05 ND-ACCT-CD                   PIC X(5)      VALUE ZEROS.           
                                                                                
       01 SAVE-TRNF-ID.                                                         
           05 FILLER                       PIC X(12)     VALUE ZEROS.           
                                                                                
       01 ORDER-ID.                                                             
           05 FILLER                       PIC X(1)      VALUE '0'.             
           05 NW-CLIENT-NBR                PIC X(3)      VALUE ZEROS.           
           05 NW-BRANCH-CD                 PIC X(3)      VALUE ZEROS.           
           05 NW-ACCT-CD                   PIC X(5)      VALUE ZEROS.           
                                                                                
      *--------------------------------------------------------------*  00230000
      *    COUNTERS                                                  *  00240000
      *--------------------------------------------------------------*  00240200
       01  WS-COUNTERS.                                                 00241000
           05  WS-ORDER-COUNTER         PIC  9(7)       VALUE ZEROS.            
           05  WS-COMMIT-COUNTER        PIC  9(7)       VALUE ZEROS.            
           05  WS-TRNF-COUNTER          PIC  9(7)       VALUE ZEROS.    00242000
           05  WS-MATCH-COUNTER         PIC  9(7)       VALUE ZEROS.            
           05  WS-UPDATE-COUNTER        PIC  9(7)       VALUE ZEROS.            
           05  WS-DUP-EQUAL             PIC  9(7)       VALUE ZEROS.            
           05  WS-DUP-LESSTHAN          PIC  9(7)       VALUE ZEROS.            
                                                                                
       01  SWITCHES.                                                            
           05 WS-EQUAL-SW              PIC X(01)         VALUE 'N'.             
           05 WS-LESSTHAN-SW           PIC X(01)         VALUE 'N'.             
                                                                                
      *---------------------------------------------------------------* 00320000
      * SQLCA ERROR MESSAGE WORK AREAS                                * 00330000
      *---------------------------------------------------------------* 00340000
                                                                        00350000
      *********   START OF ERROR ROUTINE WORK AREAS    ***************  00360000
       01  WS-ERRL-DATA.                                                00406000
           05  REQUEST-TYPE       PIC X(1).                             00407000
                 88 WRITE-ERROR-TO-LOG   VALUE 'W'.                             
           05  CALLING-TRAN-ID    PIC X(04).                            00408000
           05  CALLING-PROGRAM-ID PIC X(08).                            00408100
           05  SQLCA-AREA         PIC X(136).                           00408100
                                                                        00408200
       01  MS-MESSAGE.                                                  00406000
           05  MS-MESSAGE1        PIC X(120)     VALUE SPACES.          00407000
           05  MS-MESSAGE2        PIC X(120)     VALUE SPACES.          00408000
           05  MS-MESSAGE3        PIC X(120)     VALUE SPACES.          00408100
                                                                        00408200
       01  WS-MESSAGE.                                                  00408300
           05  WS-ERR-LEN         PIC S9(4) COMP VALUE +1200.           00408400
           05  WS-ERR-TXT         PIC X(120) OCCURS 10 TIMES.           00408500
                                                                        00409000
       01  WS-ERROR-MSG.                                                00409200
           05  FILLER             PIC X(70)      VALUE                  00409300
           '**DB2** MESSAGE COULD NOT BE TRANSLATED ERROR IN DSNTIAR'.  00409400
           05  WS-DSNTIAR-RC      PIC X(08).                            00409500
                                                                        00409600
       77  WS-SQL-SEQ-NUM         PIC 999         VALUE ZEROS.          00410000
       77  WS-LENGTH              PIC S9(09) COMP VALUE +240.           00411000
                                                                                
      *--------------------------------------------------------------*  00260000
      * COPY IN THE SQLCA AREA - THE COMMON COMMUNICATIONS AREA      *  00270000
      *--------------------------------------------------------------*  00280000
           EXEC SQL INCLUDE SQLCA END-EXEC.                             00290000
           EJECT                                                        00290100
                                                                                
      *--------------------------------------------------------------*  00301000
      * COPY THE ACAT TRANSFER RECORD DESCRIPTION                    *          
      *--------------------------------------------------------------*  00303000
           EXEC SQL INCLUDE                                                     
           VTRNFR END-EXEC.                                             00304000
           EJECT                                                        00305000
                                                                                
      *---------------------------------------------------------------* 00600000
      * SQL DECLARATION FOR INTFACE  - INTERFACE RECORD FOR CAGE/TRF  * 00610000
      *---------------------------------------------------------------* 00620000
                                                                        00680000
           EXEC SQL DECLARE ACATINITTRF CURSOR WITH HOLD FOR            00681000
                SELECT CLIENT_NBR, RCV_NBR, DLVR_NBR, ACCT_DLVR_NBR,    00682000
                   ACCT_RCV_NBR, BRANCH_CD, ACCT_CD, ACCT_ORDERS_IND,   00682000
                   ACAT_CONTROL_NBR, STTS_CD, STTLM_DT                          
                FROM VTRNFR                                             00683000
                WHERE                                                           
                          TRNFR_TYPE_CD = 'RCR'                                 
                END-EXEC.                                               00684000
                                                                        00450000
           EJECT                                                        00685000
                                                                                
      *********   END OF ERROR ROUTINE WORK AREAS    ***************    00420000
                                                                                
       01 END-OF-FILES                     PIC X(1) VALUE 'N'.                  
           88 EOF-FLAG                     VALUE 'Y'.                           
      /                                                                 00685000
      ***--->COBOL LE                                                           
       01  W-ABEND-AREA.                                                        
           03  ABEND-CODE                PIC S9(04) COMP SYNC.                  
                                                                                
           COPY STUBCPY.                                                        
           03  DSNTIAR                   PIC X(008) VALUE 'DSNTIAR'.            
      ***<---COBOL LE                                                           
                                                                                
      /                                                                 00685000
       LINKAGE SECTION.                                                         
       01  PARM-AREA.                                                           
           10  PARM-LENGTH         PIC S9(4) COMP.                              
           10  PARM-DATA-LIT       PIC X(7).                                    
           10  FILLER              PIC X.                                       
           10 PARM-ROLLBACK        PIC X.                                       
               88 ROLLBACK-YES     VALUE 'Y'.                                   
               88 ROLLBACK-NO      VALUE 'N'.                                   
                                                                                
       PROCEDURE DIVISION USING PARM-AREA.                                      
                                                                                
           MOVE 10 TO WS-SQL-SEQ-NUM.                                   00972000
           EXEC SQL OPEN ACATINITTRF END-EXEC.                                  
           IF SQLCODE EQUAL ZERO                                        00971000
              NEXT SENTENCE                                                     
           ELSE                                                         00971200
              PERFORM 0600-ERRRTN.                                      00972000
                                                                                
           PERFORM 100-FETCH-TRANSFER                                           
              THRU 100-FETCH-EXIT.                                              
                                                                                
           GO TO 800-CLOSE-CURSOR.                                      00990000
                                                                                
       100-FETCH-TRANSFER.                                                      
                                                                                
           MOVE 50 TO WS-SQL-SEQ-NUM.                                   00972000
           EXEC SQL FETCH ACATINITTRF                                   00920000
            INTO :ID-CLIENT-NBR,                                                
                 :ID-RCV-NBR,                                           00408000
                 :ID-DLVR-NBR,                                          00408000
                 :ID-ACCT-DLVR-NBR,                                             
                 :ID-ACCT-RCV-NBR,                                      00408000
                 :ID-BRANCH-CD,                                                 
                 :ID-ACCT-CD,                                                   
                 :ID-ACCT-ORDERS-IND,                                           
                 :ID-ACAT-CONTROL-NBR,                                          
                 :ID-STTS-CD,                                                   
                 :ID-STTLM-DT                                                   
           END-EXEC.                                                    00970000
                                                                                
           IF SQLCODE EQUAL ZERO                                        00971000
              ADD 1 TO WS-TRNF-COUNTER                                          
           ELSE                                                         00971200
              IF SQLCODE EQUAL 100                                      00971400
                 DISPLAY 'SQLCODE IN FETCH = 100 '                              
                 MOVE 'Y' TO END-OF-FILES                                       
                 GO TO 100-FETCH-EXIT                                   00971500
              ELSE                                                      00971600
                       PERFORM 0600-ERRRTN                              00972000
           END-IF.                                                              
                                                                                
           IF ID-ACAT-CONTROL-NBR (5 : 3) > '400'                               
            AND ID-ACAT-CONTROL-NBR (5 : 3) < '411'                             
                 CONTINUE                                                       
           ELSE                                                                 
            GO TO 100-FETCH-TRANSFER.                                           
                                                                                
           MOVE 30 TO WS-SQL-SEQ-NUM.                                           
           EXEC SQL                                                             
           UPDATE VTRNFR                                                        
               SET STTS_CD = '310'                                              
                  ,STTLM_DT = '1999-01-12'                                      
               WHERE ACAT_CONTROL_NBR = :ID-ACAT-CONTROL-NBR                    
               AND CLIENT_NBR = :ID-CLIENT-NBR                                  
           END-EXEC.                                                            
           IF SQLCODE EQUAL ZERO                                                
               ADD 1 TO WS-UPDATE-COUNTER                                       
               ADD 1 TO WS-COMMIT-COUNTER                                       
           ELSE IF SQLCODE EQUAL 100                                            
               DISPLAY 'NOT FOUND'                                              
               DISPLAY 'CLIENT NUMBER: ' ID-CLIENT-NBR ' ACAT NUMBER: '         
                        ID-ACAT-CONTROL-NBR                                     
           ELSE                                                                 
               PERFORM 0600-ERRRTN.                                             
      *                                                                         
      *  ROLLBACK-NO                                                            
      *                                                                         
           IF WS-COMMIT-COUNTER > 100 AND ROLLBACK-NO                           
              DISPLAY 'COMMITT'                                                 
              MOVE 0 TO WS-COMMIT-COUNTER                                       
              EXEC SQL  COMMIT  END-EXEC.                                       
           GO TO 100-FETCH-TRANSFER.                                            
       100-FETCH-EXIT. EXIT.                                            00971500
                                                                                
       0600-ERRRTN.                                                             
           CALL  DSNTIAR  USING SQLCA-AREA                                      
                                WS-MESSAGE                                      
                                WS-LENGTH.                                      
           IF RETURN-CODE = 0                                                   
              MOVE WS-ERR-TXT(1) TO MS-MESSAGE1                                 
              MOVE WS-ERR-TXT(2) TO MS-MESSAGE2                                 
              DISPLAY 'ERROR-MSG = ' MS-MESSAGE1 MS-MESSAGE2                    
           ELSE                                                                 
              DISPLAY 'ERROR MSG = ' WS-ERROR-MSG.                              
           DISPLAY 'SQL SEQ NUM = '  WS-SQL-SEQ-NUM.                            
           EXEC SQL ROLLBACK END-EXEC.                                          
           MOVE 2222 TO ABEND-CODE.                                             
           CALL  ABEND  USING ABEND-CODE.                                       
       0600-ERRRTN-EXIT.                                                        
           EXIT.                                                                
                                                                                
       800-CLOSE-CURSOR.                                                00990000
           DISPLAY 'TOTAL TRANSFERS READ ' WS-TRNF-COUNTER.                     
           DISPLAY 'TOTAL TRANSFERS UPDATED ' WS-UPDATE-COUNTER.                
                                                                                
           MOVE 20 TO WS-SQL-SEQ-NUM.                                   00972000
            EXEC SQL CLOSE ACATINITTRF END-EXEC.                                
           IF SQLCODE EQUAL ZERO                                        00971000
              NEXT SENTENCE                                                     
           ELSE                                                         00971200
              PERFORM 0600-ERRRTN.                                      00972000
                                                                        00990000
           GOBACK.                                                      00990000
