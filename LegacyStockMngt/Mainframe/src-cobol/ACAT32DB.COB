000001* PDX    - ACAT32DB C0246057 04/09/07 10:54:13 TBLAMUR            00001000
LRM002* SSR 47213 ADD OPTIONAL EXPIRATION DATE AND COMMENT TO MAP               
000001* PDX    - ACAT32DB C0123136 03/22/99 15:24:54 TBEDTAK            00001000
000001* PDX    - ACAT32DB C0109165 10/29/98 15:34:19 TBEDTAK            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    ACAT32DB.                                                 
       AUTHOR.  E.TAKAESU.                                                      
      *REMARKS.                                                                 
      *****************************************************************         
      *   DB2 I/O PROGRAM FOR PROCESSING RESIDURAL CREDIT EXCLUSIONS  *         
      *****************************************************************         
       ENVIRONMENT DIVISION.                                                    
       DATA DIVISION.                                                           
       WORKING-STORAGE SECTION.                                                 
       COPY PDXIDCOB.                                                           
      *                                                                         
       01  WS-WORK-AREA.                                                        
           03  WS-TIMESTAMP                    PIC X(26).                       
           03  WS-ROW-COUNT                    PIC S9(9) COMP.                  
       01  WS-SRCH-FLDS.                                                        
           05  WS-SRCH-CLT                     PIC X(04).                       
           05  WS-SRCH-BRANCH                  PIC X(03).                       
           05  WS-SRCH-ACCT                    PIC X(05).                       
           05  WS-SRCH-RR                      PIC X(03).                       
       01  WS-SEC-PASS-FLDS.                                                    
           05  WS-PASS-CLT                     PIC X(04).                       
           05  WS-PASS-BR                      PIC X(03).                       
           05  WS-PASS-AC                      PIC X(05).                       
       01  WS-ERR-DATA.                                                         
           03  WS-REQUEST-TYPE                 PIC X(01).                       
               88  WS-WRITE-ERROR-TO-LOG           VALUE 'Y'.                   
           03  CALLING-TRAN-ID                 PIC X(04).                       
           03  CALLING-PROGRAM-ID              PIC X(08).                       
           03  SQLCA-AREA                      PIC X(136).                      
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *       RESIDUAL CREDIT EXCLUDE ACCT TABLE                       *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              INCLUDE VRSDACC                                                   
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *       RESIDUAL CREDIT EXCLUDE SECURITY TABLE                   *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              INCLUDE VRSDSEC                                                   
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
      *   RESIDUAL CREDIT EXCLUDE ACCT DECLARE CURSOR TBL IN ASCENDING *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  ACTCSR  CURSOR FOR                                       
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,ACCT_CD                                                    
                    ,BRANCH_CD                                                  
                    ,BRANCH_ORGNL_CD                                            
                    ,ACCT_ORGNL_CD                                              
                    ,RR_CD                                                      
LRM002              ,EXPTN_DT                                                   
LRM002              ,COMMENT_TXT                                                
                  FROM                                                          
                     VRSDACC                                                    
                  WHERE                                                         
                     CLIENT_NBR = :WS-SRCH-CLT                                  
                     AND NOT (BRANCH_CD < :WS-SRCH-BRANCH)                      
                     AND NOT (ACCT_CD < :WS-SRCH-ACCT)                          
                     AND RR_CD LIKE :WS-SRCH-RR                                 
                  ORDER BY                                                      
                     CLIENT_NBR                                                 
                    ,BRANCH_CD                                                  
                    ,ACCT_CD                                                    
           END-EXEC.                                                            
           EJECT                                                                
      *                                                                         
      *----------------------------------------------------------------*        
      *   RESIDUAL CREDIT EXCLUDE ACCT DECLARE CURSOR TBL IN DESCENDING*        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  ACTCSRD CURSOR FOR                                       
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,ACCT_CD                                                    
                    ,BRANCH_CD                                                  
                    ,BRANCH_ORGNL_CD                                            
                    ,ACCT_ORGNL_CD                                              
                    ,RR_CD                                                      
LRM002              ,EXPTN_DT                                                   
LRM002              ,COMMENT_TXT                                                
                  FROM                                                          
                     VRSDACC                                                    
                  WHERE                                                         
                     CLIENT_NBR = :WS-SRCH-CLT                                  
                     AND NOT (BRANCH_CD < :WS-SRCH-BRANCH)                      
                     AND NOT (ACCT_CD < :WS-SRCH-ACCT)                          
                     AND RR_CD LIKE :WS-SRCH-RR                                 
                  ORDER BY                                                      
                     CLIENT_NBR DESC                                            
                    ,BRANCH_CD  DESC                                            
                    ,ACCT_CD    DESC                                            
           END-EXEC.                                                            
           EJECT                                                                
      *                                                                         
      *----------------------------------------------------------------*        
      *     DECLARE RESIDUAL CREDIT EXCLUDE SECURITY CURSOR TABLE      *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  SECCSR  CURSOR FOR                                       
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,BRANCH_CD                                                  
                    ,ACCT_CD                                                    
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,SECURITY_ADP_NBR                                           
LRM002              ,EXPTN_DT                                                   
LRM002              ,COMMENT_TXT                                                
                  FROM                                                          
                     VRSDSEC                                                    
                  WHERE                                                         
                     CLIENT_NBR = :WS-PASS-CLT                                  
                     AND BRANCH_CD = :WS-PASS-BR                                
                     AND ACCT_CD = :WS-PASS-AC                                  
                  ORDER BY                                                      
                     ISIN_SEC_ISSUE_CD                                          
           END-EXEC.                                                            
           EJECT                                                                
      *                                                                         
      *----------------------------------------------------------------*        
      *     DECLARE RESIDUAL CREDIT EXCLUDE SECURITY CURSOR DESCENDING *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  SECCSRD CURSOR FOR                                       
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,BRANCH_CD                                                  
                    ,ACCT_CD                                                    
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,SECURITY_ADP_NBR                                           
LRM002              ,EXPTN_DT                                                   
LRM002              ,COMMENT_TXT                                                
                  FROM                                                          
                     VRSDSEC                                                    
                  WHERE                                                         
                     CLIENT_NBR = :WS-PASS-CLT                                  
                     AND BRANCH_CD = :WS-PASS-BR                                
                     AND ACCT_CD = :WS-PASS-AC                                  
                  ORDER BY                                                      
                     ISIN_SEC_ISSUE_CD DESC                                     
           END-EXEC.                                                            
           EJECT                                                                
       LINKAGE SECTION.                                                         
       01  DFHCOMMAREA.                                                         
       COPY ACAT32IO.                                                           
       EJECT                                                                    
      *                                                                         
       PROCEDURE DIVISION.                                                      
           MOVE ACAT32-PASS-SRCH-FLDS  TO WS-SRCH-FLDS.                         
           MOVE ACAT32-PASS-CLT        TO WS-PASS-CLT.                          
           MOVE ACAT32-PASS-BR         TO WS-PASS-BR.                           
           MOVE ACAT32-PASS-AC         TO WS-PASS-AC.                           
      *                                                                         
           EXEC SQL                                                             
              SET :WS-TIMESTAMP = CURRENT TIMESTAMP                             
           END-EXEC.                                                            
      *                                                                         
           EVALUATE TRUE                                                        
              WHEN ACAT32-OPN-ACTCSR                                            
                   PERFORM OPEN-ACCT-CURSOR                                     
              WHEN ACAT32-FET-ACTCSR                                            
                   PERFORM FETCH-ACCT-CURSOR                                    
              WHEN ACAT32-CLO-ACTCSR                                            
                   PERFORM CLOSE-ACCT-CURSOR                                    
              WHEN ACAT32-OPN-ACTCSR-D                                          
                   PERFORM OPEN-ACCT-CURSOR-D                                   
              WHEN ACAT32-FET-ACTCSR-D                                          
                   PERFORM FETCH-ACCT-CURSOR-D                                  
              WHEN ACAT32-CLO-ACTCSR-D                                          
                   PERFORM CLOSE-ACCT-CURSOR-D                                  
              WHEN ACAT32-OPN-SECCSR                                            
                   PERFORM OPEN-SEC-CURSOR                                      
              WHEN ACAT32-FET-SECCSR                                            
                   PERFORM FETCH-SEC-CURSOR                                     
              WHEN ACAT32-CLO-SECCSR                                            
                   PERFORM CLOSE-SEC-CURSOR                                     
              WHEN ACAT32-OPN-SECCSR-D                                          
                   PERFORM OPEN-SEC-CURSOR-D                                    
              WHEN ACAT32-FET-SECCSR-D                                          
                   PERFORM FETCH-SEC-CURSOR-D                                   
              WHEN ACAT32-CLO-SECCSR-D                                          
                   PERFORM CLOSE-SEC-CURSOR-D                                   
              WHEN ACAT32-INS-ACCT                                              
                   PERFORM INSERT-ACCOUNT                                       
              WHEN ACAT32-INS-SEC                                               
                   PERFORM INSERT-SECURITY                                      
              WHEN ACAT32-DEL-ACCT                                              
                   PERFORM DELETE-ACCOUNT                                       
              WHEN ACAT32-DEL-SEC                                               
                   PERFORM DELETE-SECURITY                                      
              WHEN ACAT32-FND-ACCT                                              
                   PERFORM FIND-ACCOUNT                                         
              WHEN ACAT32-FND-SEC                                               
                   PERFORM FIND-SECURITY                                        
LRM002        WHEN ACAT32-UPD-SEC                                               
LRM002             PERFORM UPDATE-SECURITY                                      
LRM002        WHEN ACAT32-UPD-ACCT                                              
LRM002             PERFORM UPDATE-ACCOUNT                                       
           END-EVALUATE.                                                        
                                                                                
           EXEC CICS RETURN                                                     
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *   OPEN DECLARE CURSOR TBL OF RESIDUAL CREDIT EXCLUDED ACCT   *          
      *--------------------------------------------------------------*          
       OPEN-ACCT-CURSOR.                                                        
           EXEC SQL                                                             
              OPEN ACTCSR                                                       
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT32-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT32-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT32-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  FETCH DECLARE CURSOR TBL OF RESIDUAL CREDIT EXCLUDED ACCT   *          
      *--------------------------------------------------------------*          
       FETCH-ACCT-CURSOR.                                                       
           EXEC SQL                                                             
              FETCH                                                             
                  ACTCSR                                                        
              INTO                                                              
                 :ACAT32-ACT-CLT                                                
                ,:ACAT32-ACT-ACCT                                               
                ,:ACAT32-ACT-BRANCH                                             
                ,:BRANCH-ORGNL-CD                                               
                ,:ACCT-ORGNL-CD                                                 
                ,:ACAT32-ACT-RR                                                 
LRM002          ,:ACAT32-ACT-EXPDT                                              
LRM002          ,:ACAT32-ACT-COMMENT                                            
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT32-NORMAL  TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT32-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT32-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT32-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  CLOSE DECLARE CURSOR TBL OF RESIDUAL CREDIT EXCLUDED ACCT   *          
      *--------------------------------------------------------------*          
       CLOSE-ACCT-CURSOR.                                                       
           EXEC SQL                                                             
              CLOSE ACTCSR                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT32-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT32-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT32-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *   OPEN DECLARE CURSOR TBL OF ACCT IN DESCENDING ORDER        *          
      *--------------------------------------------------------------*          
       OPEN-ACCT-CURSOR-D.                                                      
           EXEC SQL                                                             
              OPEN ACTCSRD                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT32-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT32-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT32-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  FETCH DECLARE CURSOR TBL OF ACCT IN DESCENDING ORDER        *          
      *--------------------------------------------------------------*          
       FETCH-ACCT-CURSOR-D.                                                     
           EXEC SQL                                                             
              FETCH                                                             
                  ACTCSRD                                                       
              INTO                                                              
                 :ACAT32-ACT-CLT                                                
                ,:ACAT32-ACT-ACCT                                               
                ,:ACAT32-ACT-BRANCH                                             
                ,:BRANCH-ORGNL-CD                                               
                ,:ACCT-ORGNL-CD                                                 
                ,:ACAT32-ACT-RR                                                 
LRM002          ,:ACAT32-ACT-EXPDT                                              
LRM002          ,:ACAT32-ACT-COMMENT                                            
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT32-NORMAL  TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT32-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT32-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT32-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  CLOSE DECLARE CURSOR TBL OF EXCLUDED ACCT IN DESCENDING     *          
      *--------------------------------------------------------------*          
       CLOSE-ACCT-CURSOR-D.                                                     
           EXEC SQL                                                             
              CLOSE ACTCSRD                                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT32-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT32-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT32-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *   OPEN DECLARE CURSOR TBL OF RESIDUAL CREDIT EXCLUDED SEC    *          
      *--------------------------------------------------------------*          
       OPEN-SEC-CURSOR.                                                         
           EXEC SQL                                                             
              OPEN SECCSR                                                       
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT32-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT32-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT32-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  FETCH DECLARE CURSOR TBL OF RESIDUAL CREDIT EXCLUDED SEC    *          
      *--------------------------------------------------------------*          
       FETCH-SEC-CURSOR.                                                        
           EXEC SQL                                                             
              FETCH                                                             
                  SECCSR                                                        
              INTO                                                              
                 :ACAT32-SEC-CLT                                                
                ,:ACAT32-SEC-BRANCH                                             
                ,:ACAT32-SEC-ACCT                                               
                ,:ACAT32-SEC-SECURITY                                           
                ,:ACAT32-SEC-ADP-NBR                                            
LRM002          ,:ACAT32-SEC-EXPDT                                              
LRM002          ,:ACAT32-SEC-COMMENT                                            
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT32-NORMAL  TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT32-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT32-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT32-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  CLOSE DECLARE CURSOR TBL OF RESIDUAL CREDIT EXCLUDED SEC    *          
      *--------------------------------------------------------------*          
       CLOSE-SEC-CURSOR.                                                        
           EXEC SQL                                                             
              CLOSE SECCSR                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT32-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT32-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT32-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *   OPEN DECLARE CURSOR TBL OF EXCLUDED SECURITY IN DESCENDING *          
      *--------------------------------------------------------------*          
       OPEN-SEC-CURSOR-D.                                                       
           EXEC SQL                                                             
              OPEN SECCSRD                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT32-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT32-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT32-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  FETCH DECLARE CURSOR TBL OF EXCLUDED SECURITY IN DESCENDING *          
      *--------------------------------------------------------------*          
       FETCH-SEC-CURSOR-D.                                                      
           EXEC SQL                                                             
              FETCH                                                             
                  SECCSRD                                                       
              INTO                                                              
                 :ACAT32-SEC-CLT                                                
                ,:ACAT32-SEC-BRANCH                                             
                ,:ACAT32-SEC-ACCT                                               
                ,:ACAT32-SEC-SECURITY                                           
                ,:ACAT32-SEC-ADP-NBR                                            
LRM002          ,:ACAT32-SEC-EXPDT                                              
LRM002          ,:ACAT32-SEC-COMMENT                                            
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT32-NORMAL  TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT32-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT32-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT32-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  CLOSE DECLARE CURSOR TBL OF EXCLUDED SEC IN DESCENDING      *          
      *--------------------------------------------------------------*          
       CLOSE-SEC-CURSOR-D.                                                      
           EXEC SQL                                                             
              CLOSE SECCSRD                                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT32-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT32-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT32-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *           CREATE ACCOUNT                                     *          
      *--------------------------------------------------------------*          
       INSERT-ACCOUNT.                                                          
           INITIALIZE DCLVRSDACC.                                               
           EXEC SQL                                                             
              INSERT INTO VRSDACC                                               
                 ( CLIENT_NBR                                                   
                  ,ACCT_CD                                                      
                  ,BRANCH_CD                                                    
                  ,BRANCH_ORGNL_CD                                              
                  ,ACCT_ORGNL_CD                                                
                  ,RR_CD                                                        
                  ,CRT_TMSTP                                                    
                  ,UPDT_TMSTP                                                   
                  ,CICS_TERM_ID_CD                                              
LRM002            ,EXPTN_DT                                                     
LRM002            ,COMMENT_TXT                                                  
                  ,PRGM_NM )                                                    
              VALUES                                                            
                ( :ACAT32-PASS-CLT                                              
                 ,:ACAT32-PASS-AC                                               
                 ,:ACAT32-PASS-BR                                               
                 ,' '                                                           
                 ,' '                                                           
                 ,:ACAT32-PASS-RR                                               
                 ,:WS-TIMESTAMP                                                 
                 ,:WS-TIMESTAMP                                                 
                 ,:ACAT32-PASS-TERMID                                           
LRM002           ,:ACAT32-PASS-EXPDT                                            
LRM002           ,:ACAT32-PASS-COMMENT                                          
                 ,'ACAT32DB' )                                                  
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT32-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT32-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT32-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *           CREATE SECURITY                                    *          
      *--------------------------------------------------------------*          
       INSERT-SECURITY.                                                         
           INITIALIZE DCLVRSDSEC.                                               
           EXEC SQL                                                             
              INSERT INTO VRSDSEC                                               
                (  CLIENT_NBR                                                   
                  ,ACCT_CD                                                      
                  ,BRANCH_CD                                                    
                  ,ISIN_SEC_ISSUE_CD                                            
                  ,SECURITY_ADP_NBR                                             
                  ,PRGM_NM                                                      
                  ,CICS_TERM_ID_CD                                              
LRM002            ,EXPTN_DT                                                     
LRM002            ,COMMENT_TXT                                                  
                  ,CRT_TMSTP                                                    
                  ,UPDT_TMSTP )                                                 
              VALUES                                                            
                ( :ACAT32-PASS-CLT                                              
                 ,:ACAT32-PASS-AC                                               
                 ,:ACAT32-PASS-BR                                               
                 ,:ACAT32-PASS-SEC                                              
                 ,:ACAT32-PASS-ADP-NBR                                          
                 ,'ACAT32DB'                                                    
                 ,:ACAT32-PASS-TERMID                                           
LRM002           ,:ACAT32-PASS-EXPDT                                            
LRM002           ,:ACAT32-PASS-COMMENT                                          
                 ,:WS-TIMESTAMP                                                 
                 ,:WS-TIMESTAMP )                                               
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT32-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT32-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT32-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *         DELETE ACCOUNT                                       *          
      *--------------------------------------------------------------*          
       DELETE-ACCOUNT.                                                          
           EXEC SQL DELETE                                                      
               FROM VRSDACC                                                     
              WHERE  CLIENT_NBR = :ACAT32-PASS-CLT                              
                 AND ACCT_CD = :ACAT32-PASS-AC                                  
                 AND BRANCH_CD = :ACAT32-PASS-BR                                
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT32-NORMAL  TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT32-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT32-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT32-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *         DELETE SECURITY                                      *          
      *--------------------------------------------------------------*          
       DELETE-SECURITY.                                                         
           EXEC SQL DELETE                                                      
               FROM VRSDSEC                                                     
              WHERE  CLIENT_NBR = :ACAT32-PASS-CLT                              
                 AND ACCT_CD = :ACAT32-PASS-AC                                  
                 AND BRANCH_CD = :ACAT32-PASS-BR                                
                 AND ISIN_SEC_ISSUE_CD = :ACAT32-PASS-SEC                       
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT32-NORMAL  TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT32-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT32-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT32-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
LRM002 EJECT                                                                    
LRM002*                                                                         
LRM002*--------------------------------------------------------------*          
LRM002*         UPDATE ACCOUNT                                       *          
LRM002*--------------------------------------------------------------*          
LRM002 UPDATE-ACCOUNT.                                                          
LRM002     MOVE ACAT32-ACT-COMMENT TO COMMENT-TXT OF DCLVRSDACC                 
LRM002     MOVE ACAT32-ACT-EXPDT   TO EXPTN-DT    OF DCLVRSDACC                 
LRM002     EXEC SQL UPDATE VRSDACC                                              
LRM002         SET COMMENT_TXT = :DCLVRSDACC.COMMENT-TXT                        
LRM002            ,EXPTN_DT    = :DCLVRSDACC.EXPTN-DT                           
LRM002        WHERE  CLIENT_NBR = :ACAT32-PASS-CLT                              
LRM002           AND ACCT_CD = :ACAT32-PASS-AC                                  
LRM002           AND BRANCH_CD = :ACAT32-PASS-BR                                
LRM002     END-EXEC.                                                            
LRM002     IF SQLCODE = 0                                                       
LRM002        SET ACAT32-NORMAL  TO TRUE                                        
LRM002     ELSE                                                                 
LRM002     IF SQLCODE = +100                                                    
LRM002        SET ACAT32-NOT-FOUND TO TRUE                                      
LRM002     ELSE                                                                 
LRM002        SET ACAT32-ERROR  TO TRUE                                         
LRM002        MOVE SQLCODE  TO ACAT32-SQLCODE                                   
LRM002        PERFORM 9999-DB2-ERROR.                                           
LRM002 EJECT                                                                    
LRM002*                                                                         
LRM002*--------------------------------------------------------------*          
LRM002*         UPDATE SECURITY                                      *          
LRM002*--------------------------------------------------------------*          
LRM002 UPDATE-SECURITY.                                                         
LRM002     MOVE ACAT32-SEC-COMMENT TO COMMENT-TXT OF DCLVRSDSEC                 
LRM002     MOVE ACAT32-SEC-EXPDT   TO EXPTN-DT OF   DCLVRSDSEC                  
LRM002     EXEC SQL UPDATE VRSDSEC                                              
LRM002         SET COMMENT_TXT = :DCLVRSDSEC.COMMENT-TXT                        
LRM002            ,EXPTN_DT    = :DCLVRSDSEC.EXPTN-DT                           
LRM002        WHERE  CLIENT_NBR = :ACAT32-PASS-CLT                              
LRM002           AND ACCT_CD = :ACAT32-PASS-AC                                  
LRM002           AND BRANCH_CD = :ACAT32-PASS-BR                                
LRM002           AND ISIN_SEC_ISSUE_CD = :ACAT32-PASS-SEC                       
LRM002     END-EXEC.                                                            
LRM002     IF SQLCODE = 0                                                       
LRM002        SET ACAT32-NORMAL  TO TRUE                                        
LRM002     ELSE                                                                 
LRM002     IF SQLCODE = +100                                                    
LRM002        SET ACAT32-NOT-FOUND TO TRUE                                      
LRM002     ELSE                                                                 
LRM002        SET ACAT32-ERROR  TO TRUE                                         
LRM002        MOVE SQLCODE  TO ACAT32-SQLCODE                                   
LRM002        PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *           CHECK IF ANY ACCOUNT ROWS EXIST                    *          
      *--------------------------------------------------------------*          
       FIND-ACCOUNT.                                                            
           EXEC SQL                                                             
               SELECT                                                           
                    COUNT(*)                                                    
                 INTO                                                           
                    :WS-ROW-COUNT                                               
                 FROM                                                           
                    VRSDACC                                                     
                WHERE  CLIENT_NBR = :ACAT32-PASS-CLT                            
                   AND ACCT_CD = :ACAT32-PASS-AC                                
                   AND BRANCH_CD = :ACAT32-PASS-BR                              
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              IF WS-ROW-COUNT > 0                                               
                 SET ACAT32-FOUND TO TRUE                                       
              ELSE                                                              
                 SET ACAT32-NOT-FOUND TO TRUE                                   
              END-IF                                                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT32-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT32-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT32-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *           CHECK IF ANY SECURITY ROWS EXIST                   *          
      *--------------------------------------------------------------*          
       FIND-SECURITY.                                                           
           EXEC SQL                                                             
               SELECT                                                           
                    COUNT(*)                                                    
                 INTO                                                           
                    :WS-ROW-COUNT                                               
                 FROM                                                           
                    VRSDSEC                                                     
                WHERE  CLIENT_NBR = :ACAT32-PASS-CLT                            
                   AND ACCT_CD = :ACAT32-PASS-AC                                
                   AND BRANCH_CD = :ACAT32-PASS-BR                              
                   AND ISIN_SEC_ISSUE_CD = :ACAT32-PASS-SEC                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              IF WS-ROW-COUNT > 0                                               
                 SET ACAT32-FOUND TO TRUE                                       
              ELSE                                                              
                 SET ACAT32-NOT-FOUND TO TRUE                                   
              END-IF                                                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT32-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT32-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT32-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          WRITE DB2 ERROR LOG                                 *          
      *--------------------------------------------------------------*          
       9999-DB2-ERROR.                                                          
           MOVE SPACE      TO WS-ERR-DATA.                                      
           SET WS-WRITE-ERROR-TO-LOG TO TRUE.                                   
           MOVE EIBTRNID   TO CALLING-TRAN-ID.                                  
           MOVE 'ACAT32RS' TO CALLING-PROGRAM-ID.                               
           MOVE SQLCA      TO SQLCA-AREA.                                       
           EXEC CICS LINK PROGRAM('FPDB2LOG')                                   
                COMMAREA(WS-ERR-DATA)                                           
                LENGTH(LENGTH OF WS-ERR-DATA)                                   
                NOHANDLE                                                        
           END-EXEC.                                                            
       EJECT                                                                    
                                                                                
       HANG-CICS.                                                               
           GOBACK.                                                              
