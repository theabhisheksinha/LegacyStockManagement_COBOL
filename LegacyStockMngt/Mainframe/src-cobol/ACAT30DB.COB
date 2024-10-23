000001* PDX    - ACAT30DB C0126743 06/10/99 09:37:40 TBEDTAK            00001000
000001* PDX    - ACAT30DB C0119329 12/17/98 15:42:06 TBEDTAK            00001000
000001* PDX    - ACAT30DB C0109165 09/14/98 17:21:08 TBEDTAK            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    ACAT30DB.                                                 
       AUTHOR.  E.TAKAESU.                                                      
      *REMARKS.                                                                 
      *****************************************************************         
      *       DB2 I/O PROGRAM FOR PROCESSING ALERT MESSAGES           *         
      *****************************************************************         
       ENVIRONMENT DIVISION.                                                    
       DATA DIVISION.                                                           
       WORKING-STORAGE SECTION.                                                 
       COPY PDXIDCOB.                                                           
      *                                                                         
       01  WS-WORK-AREA.                                                        
           03  WS-TIMESTAMP                    PIC X(26).                       
           03  WS-ROW-COUNT                    PIC S9(9) COMP-3.                
       01  WS-ERR-DATA.                                                         
           03  WS-REQUEST-TYPE                 PIC X(01).                       
               88  WS-WRITE-ERROR-TO-LOG           VALUE 'Y'.                   
           03  CALLING-TRAN-ID                 PIC X(04).                       
           03  CALLING-PROGRAM-ID              PIC X(08).                       
           03  SQLCA-AREA                      PIC X(136).                      
       01  WS-PASSED-DATA-AREA.                                                 
           03  WS-PASSED-CLT                PIC X(04).                          
           03  WS-PASSED-BRANCH             PIC X(03).                          
           03  WS-PASSED-ACCT               PIC X(05).                          
           03  WS-PASSED-RR                 PIC X(03).                          
           03  WS-PASSED-MSG.                                                   
               05  WS-PASSED-MSG-LEN        PIC S9(4) COMP.                     
               05  WS-PASSED-MSG-TXT        PIC X(640).                         
           03  WS-PASSED-ALERT-IND          PIC X(01).                          
           03  WS-PASSED-TERMID             PIC X(04).                          
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *        ALERT MESSAGE TABLE                                     *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              INCLUDE VALERT                                                    
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *        ACTIVE TRANSFER TABLE                                   *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              INCLUDE VTRNFR                                                    
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *    SQL COMMUNICATION AREA                                      *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              INCLUDE SQLCA                                                     
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *         ALERT MESSAGE CURSOR TABLE STATEMENT                   *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  ALTCSR  CURSOR FOR                                       
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,BRANCH_CD                                                  
                    ,ACCT_CD                                                    
                    ,ACCT_MSG_TXT                                               
                    ,RR_CD                                                      
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                  FROM                                                          
                     VALERT                                                     
                  WHERE                                                         
                     CLIENT_NBR = :WS-PASSED-CLT                                
                     AND  NOT (BRANCH_CD < :WS-PASSED-BRANCH)                   
                     AND  NOT (ACCT_CD < :WS-PASSED-ACCT)                       
                     AND  RR_CD LIKE :WS-PASSED-RR                              
                  ORDER BY                                                      
                     CLIENT_NBR                                                 
                    ,BRANCH_CD                                                  
                    ,ACCT_CD                                                    
                    ,RR_CD                                                      
           END-EXEC.                                                            
           EJECT                                                                
      *                                                                         
      *----------------------------------------------------------------*        
      *   ALERT MESSAGE CURSOR TABLE STATEMENT IN DESCENDING ORDER     *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  ALTCSRD  CURSOR FOR                                      
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,BRANCH_CD                                                  
                    ,ACCT_CD                                                    
                    ,ACCT_MSG_TXT                                               
                    ,RR_CD                                                      
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                  FROM                                                          
                     VALERT                                                     
                  WHERE                                                         
                     CLIENT_NBR = :WS-PASSED-CLT                                
                     AND  NOT (BRANCH_CD < :WS-PASSED-BRANCH)                   
                     AND  NOT (ACCT_CD < :WS-PASSED-ACCT)                       
                     AND  RR_CD LIKE :WS-PASSED-RR                              
                  ORDER BY                                                      
                     CLIENT_NBR DESC                                            
                    ,BRANCH_CD  DESC                                            
                    ,ACCT_CD    DESC                                            
                    ,RR_CD      DESC                                            
           END-EXEC.                                                            
           EJECT                                                                
      *                                                                         
      *----------------------------------------------------------------*        
      *         LINKAGE SECTION STARTS HERE                            *        
      *----------------------------------------------------------------*        
       LINKAGE SECTION.                                                         
       01  DFHCOMMAREA.                                                         
       COPY ACAT30IO.                                                           
       EJECT                                                                    
      *                                                                         
       PROCEDURE DIVISION.                                                      
           MOVE ACAT30-PASS-FLDS TO WS-PASSED-DATA-AREA.                        
           EXEC SQL                                                             
              SET :WS-TIMESTAMP = CURRENT TIMESTAMP                             
           END-EXEC.                                                            
      *                                                                         
           EVALUATE TRUE                                                        
              WHEN ACAT30-OPN-ALTCSR                                            
                   PERFORM OPEN-ALT-CURSOR                                      
              WHEN ACAT30-FET-ALTCSR                                            
                   PERFORM FETCH-ALT-CURSOR                                     
              WHEN ACAT30-CLO-ALTCSR                                            
                   PERFORM CLOSE-ALT-CURSOR                                     
              WHEN ACAT30-OPN-ALTCSRD                                           
                   PERFORM OPEN-ALT-CURSOR-D                                    
              WHEN ACAT30-FET-ALTCSRD                                           
                   PERFORM FETCH-ALT-CURSOR-D                                   
              WHEN ACAT30-CLO-ALTCSRD                                           
                   PERFORM CLOSE-ALT-CURSOR-D                                   
              WHEN ACAT30-INS-ALERT                                             
                   PERFORM INSERT-ALERT                                         
              WHEN ACAT30-UPD-ALERT                                             
                   PERFORM UPDATE-ALERT                                         
              WHEN ACAT30-DEL-ALERT                                             
                   PERFORM DELETE-ALERT                                         
              WHEN ACAT30-CNT-ALERT                                             
                   PERFORM COUNT-ALERT                                          
              WHEN ACAT30-CNT-TRNFR                                             
                   PERFORM COUNT-TRANSFER                                       
              WHEN ACAT30-UPD-TRNFR                                             
                   PERFORM UPDATE-TRANSFER                                      
           END-EVALUATE.                                                        
                                                                                
           EXEC CICS RETURN                                                     
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          OPEN ALERT CURSOR TABLE                             *          
      *--------------------------------------------------------------*          
       OPEN-ALT-CURSOR.                                                         
           EXEC SQL                                                             
              OPEN ALTCSR                                                       
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT30-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT30-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT30-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          FETCH ALERT CURSORT TABLE                           *          
      *--------------------------------------------------------------*          
       FETCH-ALT-CURSOR.                                                        
           EXEC SQL                                                             
              FETCH                                                             
                  ALTCSR                                                        
              INTO                                                              
                  :DCLVALERT.CLIENT-NBR                                         
                 ,:DCLVALERT.BRANCH-CD                                          
                 ,:DCLVALERT.ACCT-CD                                            
                 ,:DCLVALERT.ACCT-MSG-TXT                                       
                 ,:DCLVALERT.RR-CD                                              
                 ,:DCLVALERT.CRT-TMSTP                                          
                 ,:DCLVALERT.UPDT-TMSTP                                         
                 ,:DCLVALERT.CICS-TERM-ID-CD                                    
                 ,:DCLVALERT.PRGM-NM                                            
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT30-NORMAL  TO TRUE                                        
              PERFORM SETUP-ALERT-COMMAREA                                      
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT30-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT30-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT30-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *         CLOSE ALERT CURSOR TABLE                             *          
      *--------------------------------------------------------------*          
       CLOSE-ALT-CURSOR.                                                        
           EXEC SQL                                                             
              CLOSE ALTCSR                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT30-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT30-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT30-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *      OPEN ALERT CURSOR TBL IN DESCENDING ORDER               *          
      *--------------------------------------------------------------*          
       OPEN-ALT-CURSOR-D.                                                       
           EXEC SQL                                                             
              OPEN ALTCSRD                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT30-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT30-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT30-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *     FETCH ALERT CURSOR TBL IN DESCENDING ORDER               *          
      *--------------------------------------------------------------*          
       FETCH-ALT-CURSOR-D.                                                      
           EXEC SQL                                                             
              FETCH                                                             
                  ALTCSRD                                                       
              INTO                                                              
                 :DCLVALERT.CLIENT-NBR                                          
                ,:DCLVALERT.BRANCH-CD                                           
                ,:DCLVALERT.ACCT-CD                                             
                ,:DCLVALERT.ACCT-MSG-TXT                                        
                ,:DCLVALERT.RR-CD                                               
                ,:DCLVALERT.CRT-TMSTP                                           
                ,:DCLVALERT.UPDT-TMSTP                                          
                ,:DCLVALERT.CICS-TERM-ID-CD                                     
                ,:DCLVALERT.PRGM-NM                                             
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT30-NORMAL  TO TRUE                                        
              PERFORM SETUP-ALERT-COMMAREA                                      
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT30-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT30-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT30-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *     CLOSE ALERT CURSOR TBL IN DESCENDING ORDER               *          
      *--------------------------------------------------------------*          
       CLOSE-ALT-CURSOR-D.                                                      
           EXEC SQL                                                             
              CLOSE ALTCSRD                                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT30-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT30-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT30-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *      SETUP ALERT TABLE FIELDS IN COMMAREA                    *          
      *--------------------------------------------------------------*          
       SETUP-ALERT-COMMAREA.                                                    
           INITIALIZE ACAT30-ALERT-ROW.                                         
           MOVE CLIENT-NBR   OF DCLVALERT TO ACAT30-ALT-CLT.                    
           MOVE BRANCH-CD    OF DCLVALERT TO ACAT30-ALT-BRANCH.                 
           MOVE ACCT-CD      OF DCLVALERT TO ACAT30-ALT-ACCT.                   
           MOVE RR-CD        OF DCLVALERT TO ACAT30-ALT-RR.                     
           MOVE ACCT-MSG-TXT OF DCLVALERT TO ACAT30-ALT-MSG.                    
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *            ADD MEASSAGE ACCOUNT                              *          
      *--------------------------------------------------------------*          
       INSERT-ALERT.                                                            
           INITIALIZE DCLVALERT.                                                
           MOVE ACAT30-PASS-MSG-LEN TO ACCT-MSG-TXT-LEN.                        
           MOVE ACAT30-PASS-MSG-TXT TO ACCT-MSG-TXT-TEXT.                       
           EXEC SQL                                                             
              INSERT INTO VALERT                                                
                 ( CLIENT_NBR                                                   
                  ,BRANCH_CD                                                    
                  ,ACCT_CD                                                      
                  ,ACCT_MSG_TXT                                                 
                  ,RR_CD                                                        
                  ,CRT_TMSTP                                                    
                  ,UPDT_TMSTP                                                   
                  ,CICS_TERM_ID_CD                                              
                  ,PRGM_NM )                                                    
              VALUES                                                            
                 ( :ACAT30-PASS-CLT                                             
                  ,:ACAT30-PASS-BRANCH                                          
                  ,:ACAT30-PASS-ACCT                                            
                  ,:ACCT-MSG-TXT                                                
                  ,:ACAT30-PASS-RR                                              
                  ,:WS-TIMESTAMP                                                
                  ,:WS-TIMESTAMP                                                
                  ,:ACAT30-PASS-TERMID                                          
                  ,'ACAT30DB' )                                                 
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT30-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT30-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT30-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          UPDATE ALERT MESSAGE                                *          
      *--------------------------------------------------------------*          
       UPDATE-ALERT.                                                            
           MOVE ACAT30-PASS-MSG-LEN TO ACCT-MSG-TXT-LEN.                        
           MOVE ACAT30-PASS-MSG-TXT TO ACCT-MSG-TXT-TEXT.                       
           EXEC SQL                                                             
             UPDATE VALERT                                                      
                SET ACCT_MSG_TXT = :ACCT-MSG-TXT                                
                   ,UPDT_TMSTP = :WS-TIMESTAMP                                  
                   ,CICS_TERM_ID_CD = :ACAT30-PASS-TERMID                       
                   ,PRGM_NM = 'ACAT30DB'                                        
              WHERE CLIENT_NBR = :ACAT30-PASS-CLT                               
                  AND  BRANCH_CD = :ACAT30-PASS-BRANCH                          
                  AND  ACCT_CD = :ACAT30-PASS-ACCT                              
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT30-NORMAL  TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT30-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              PERFORM 9000-ROLLBACK                                             
              SET ACAT30-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT30-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *         DELETE THE ALERT MESSAGE TABLE ROW                   *          
      *--------------------------------------------------------------*          
       DELETE-ALERT.                                                            
           EXEC SQL DELETE                                                      
               FROM VALERT                                                      
              WHERE CLIENT_NBR = :ACAT30-PASS-CLT                               
                  AND  BRANCH_CD = :ACAT30-PASS-BRANCH                          
                  AND  ACCT_CD = :ACAT30-PASS-ACCT                              
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT30-NORMAL  TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT30-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              PERFORM 9000-ROLLBACK                                             
              SET ACAT30-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT30-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *      CHECK IF THE REQUESTED ACCOUNT EXIST                    *          
      *--------------------------------------------------------------*          
       COUNT-ALERT.                                                             
           EXEC SQL                                                             
               SELECT                                                           
                    COUNT(*)                                                    
                 INTO                                                           
                    :WS-ROW-COUNT                                               
                 FROM                                                           
                    VALERT                                                      
                 WHERE CLIENT_NBR = :ACAT30-PASS-CLT                            
                    AND  BRANCH_CD = :ACAT30-PASS-BRANCH                        
                    AND  ACCT_CD = :ACAT30-PASS-ACCT                            
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              IF WS-ROW-COUNT > 0                                               
                 SET ACAT30-FOUND  TO TRUE                                      
              ELSE                                                              
                 SET ACAT30-NOT-FOUND TO TRUE                                   
              END-IF                                                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT30-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT30-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT30-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *      CHECK IF THE ACCOUNT IN TRANSFER TABLE EXSITS           *          
      *--------------------------------------------------------------*          
       COUNT-TRANSFER.                                                          
           EXEC SQL                                                             
               SELECT                                                           
                    COUNT(*)                                                    
                 INTO                                                           
                    :WS-ROW-COUNT                                               
                 FROM                                                           
                    VTRNFR                                                      
                 WHERE CLIENT_NBR = :ACAT30-PASS-CLT                            
                    AND  BRANCH_CD = :ACAT30-PASS-BRANCH                        
                    AND  ACCT_CD = :ACAT30-PASS-ACCT                            
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              IF WS-ROW-COUNT > 0                                               
                 SET ACAT30-FOUND  TO TRUE                                      
              ELSE                                                              
                 SET ACAT30-NOT-FOUND TO TRUE                                   
              END-IF                                                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT30-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT30-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT30-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *     UPDATE ALERT INDICATOR AT TRNASFER TABLE                 *          
      *--------------------------------------------------------------*          
       UPDATE-TRANSFER.                                                         
           EXEC SQL                                                             
             UPDATE VTRNFR                                                      
                SET ALERT_IND = :ACAT30-PASS-ALERT-IND                          
                   ,UPDT_TMSTP = :WS-TIMESTAMP                                  
                   ,CICS_TERM_ID_CD = :ACAT30-PASS-TERMID                       
                   ,PRGM_NM = 'ACAT30DB'                                        
              WHERE CLIENT_NBR = :ACAT30-PASS-CLT                               
                    AND  BRANCH_CD = :ACAT30-PASS-BRANCH                        
                    AND  ACCT_CD = :ACAT30-PASS-ACCT                            
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT30-NORMAL  TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT30-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT30-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT30-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *--------------------------------------------------------------*          
      *          ROLLBAKCK                                           *          
      *--------------------------------------------------------------*          
       9000-ROLLBACK.                                                           
           EXEC CICS                                                            
              SYNCPOINT                                                         
              ROLLBACK                                                          
           END-EXEC.                                                            
      *                                                                         
      *--------------------------------------------------------------*          
      *          WRITE DB2 ERROR LOG                                 *          
      *--------------------------------------------------------------*          
       9999-DB2-ERROR.                                                          
           MOVE SPACE      TO WS-ERR-DATA.                                      
           SET WS-WRITE-ERROR-TO-LOG TO TRUE.                                   
           MOVE EIBTRNID   TO CALLING-TRAN-ID.                                  
           MOVE 'ACAT30DB' TO CALLING-PROGRAM-ID.                               
           MOVE SQLCA      TO SQLCA-AREA.                                       
           EXEC CICS LINK PROGRAM('FPDB2LOG')                                   
                COMMAREA(WS-ERR-DATA)                                           
                LENGTH(LENGTH OF WS-ERR-DATA)                                   
                NOHANDLE                                                        
           END-EXEC.                                                            
       EJECT                                                                    
                                                                                
       HANG-CICS.                                                               
           GOBACK.                                                              
