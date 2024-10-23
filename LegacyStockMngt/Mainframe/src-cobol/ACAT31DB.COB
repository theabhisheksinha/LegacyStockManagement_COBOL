000001* PDX    - ACAT31DB C0278346 03/19/09 12:06:15 TBLAMUR            00001000
LRM003* SSR 61867 EXTRACT EXPIRATION DATE AND DATE ADDED IN SEC LOOKUP          
000001* PDX    - ACAT31DB C0258681 02/11/08 10:43:45 TBLAMUR            00001000
LRM002* SSR 47237 ADD OPTIONAL EXPIRATION DATE AND COMMENT TO MAP               
000001* PDX    - ACAT31DB C0126743 06/09/99 15:09:21 TBEDTAK            00001000
000001* PDX    - ACAT31DB C0120838 01/23/99 17:06:50 TBEDTAK            00001000
000001* PDX    - ACAT31DB C0120330 01/21/99 15:20:57 TBEDTAK            00001000
000001* PDX    - ACAT31DB C0109165 09/28/98 17:55:56 TBEDTAK            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    ACAT31DB.                                                 
       AUTHOR.  E.TAKAESU.                                                      
      *REMARKS.                                                                 
      *****************************************************************         
      *   DB2 I/O PROGRAM FOR PROCESSING ACATS RESTRITED SECURITIES   *         
      *****************************************************************         
       ENVIRONMENT DIVISION.                                                    
       DATA DIVISION.                                                           
       WORKING-STORAGE SECTION.                                                 
       COPY PDXIDCOB.                                                           
      *                                                                         
       01  WS-WORK-AREA.                                                        
           03  WS-TIMESTAMP                    PIC X(26).                       
           03  WS-ROW-COUNT                    PIC S9(9) COMP.                  
           03  WS-CLIENT                       PIC X(04).                       
           03  WS-SECURITY                     PIC X(09).                       
       01  WS-ERR-DATA.                                                         
           03  WS-REQUEST-TYPE                 PIC X(01).                       
               88  WS-WRITE-ERROR-TO-LOG           VALUE 'Y'.                   
           03  CALLING-TRAN-ID                 PIC X(04).                       
           03  CALLING-PROGRAM-ID              PIC X(08).                       
           03  SQLCA-AREA                      PIC X(136).                      
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *    RESTRICTED SECURITY TABLE                                   *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              INCLUDE VRSTSEC                                                   
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *    RESTRICTED BROKER TABLE                                     *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              INCLUDE VRSTBRKR                                                  
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *    PENDING TRANSFER ASSET TABLE                                *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              INCLUDE VASSET                                                    
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
      *    RESTRICTED SECURITY DECLARE CURSOR STATEMENT                *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  SECCSR CURSOR FOR                                        
                  SELECT                                                        
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
LRM002              ,EXPTN_DT                                                   
LRM002              ,COMMENT_TXT                                                
                  FROM                                                          
                     VRSTSEC                                                    
                  WHERE                                                         
                     CLIENT_NBR = :WS-CLIENT                                    
                  ORDER BY                                                      
                     CLIENT_NBR                                                 
                    ,ISIN_SEC_ISSUE_CD                                          
           END-EXEC.                                                            
           EJECT                                                                
      *                                                                         
      *----------------------------------------------------------------*        
      *    RESTRICTED SECURITY DECLARE CURSOR STATEMENT DESCEND        *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  SECCSRD CURSOR FOR                                       
                  SELECT                                                        
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
LRM002              ,EXPTN_DT                                                   
LRM002              ,COMMENT_TXT                                                
                  FROM                                                          
                     VRSTSEC                                                    
                  WHERE                                                         
                     CLIENT_NBR = :WS-CLIENT                                    
                  ORDER BY                                                      
                     CLIENT_NBR         DESC                                    
                    ,ISIN_SEC_ISSUE_CD  DESC                                    
           END-EXEC.                                                            
           EJECT                                                                
      *----------------------------------------------------------------*        
      *         RESTRICTED BROKER DECLARE CURSOR STATEMENT             *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  BKRCSR CURSOR FOR                                        
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,BRKR_CONTRA_NBR                                            
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,SECURITY_ADP_NBR                                           
LRM002              ,EXPTN_DT                                                   
LRM002              ,COMMENT_TXT                                                
                  FROM                                                          
                     VRSTBRKR                                                   
                  WHERE                                                         
                     CLIENT_NBR = :WS-CLIENT                                    
                     AND ISIN_SEC_ISSUE_CD = :WS-SECURITY                       
                  ORDER BY                                                      
                     CLIENT_NBR                                                 
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,BRKR_CONTRA_NBR                                            
           END-EXEC.                                                            
           EJECT                                                                
       LINKAGE SECTION.                                                         
       01  DFHCOMMAREA.                                                         
       COPY ACAT31IO.                                                           
       EJECT                                                                    
      *                                                                         
       PROCEDURE DIVISION.                                                      
           MOVE ACAT31-PASS-CLT      TO WS-CLIENT.                              
           MOVE ACAT31-PASS-SECURITY TO WS-SECURITY.                            
      *                                                                         
           EXEC SQL                                                             
              SET :WS-TIMESTAMP = CURRENT TIMESTAMP                             
           END-EXEC.                                                            
      *                                                                         
           EVALUATE TRUE                                                        
              WHEN ACAT31-OPN-SECCSR                                            
                   PERFORM 0100-OPEN-SECCSR-TBL                                 
              WHEN ACAT31-FET-SECCSR                                            
                   PERFORM 0200-FETCH-SECCSR-TBL                                
              WHEN ACAT31-CLO-SECCSR                                            
                   PERFORM 0300-CLOSE-SECCSR-TBL                                
              WHEN ACAT31-OPN-BKRCSR                                            
                   PERFORM 0400-OPEN-BKRCSR-TBL                                 
              WHEN ACAT31-FET-BKRCSR                                            
                   PERFORM 0500-FETCH-BKRCSR-TBL                                
              WHEN ACAT31-CLO-BKRCSR                                            
                   PERFORM 0600-CLOSE-BKRCSR-TBL                                
              WHEN ACAT31-UPD-SECURITY                                          
                   PERFORM 0700-UPDATE-SECURITY                                 
              WHEN ACAT31-INS-SECURITY                                          
                   PERFORM 0800-INSERT-SECURITY                                 
              WHEN ACAT31-INS-BROKER                                            
                   PERFORM 0900-INSERT-BROKER                                   
              WHEN ACAT31-DEL-SECURITY                                          
                   PERFORM 1000-DELETE-SECURITY                                 
              WHEN ACAT31-DEL-BROKER                                            
                   PERFORM 1100-DELETE-BROKER                                   
              WHEN ACAT31-FND-SECURITY                                          
                   PERFORM 1200-FIND-SECURITY                                   
              WHEN ACAT31-CNT-BROKER                                            
                   PERFORM 1300-COUNT-BROKER                                    
              WHEN ACAT31-OPN-SECCSRD                                           
                   PERFORM 1400-OPEN-SECCSR-DESCEND                             
              WHEN ACAT31-FET-SECCSRD                                           
                   PERFORM 1500-FETCH-SECCSR-DESCEND                            
              WHEN ACAT31-CLO-SECCSRD                                           
                   PERFORM 1600-CLOSE-SECCSR-DESCEND                            
              WHEN ACAT31-CNT-ASSET                                             
                   PERFORM 1700-COUNT-ASSETS                                    
              WHEN ACAT31-UPD-ASSET                                             
                   PERFORM 1800-UPDATE-ASSET                                    
           END-EVALUATE.                                                        
                                                                                
           EXEC CICS RETURN                                                     
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *           OPEN SECURITY CURSOR TABLE                         *          
      *--------------------------------------------------------------*          
       0100-OPEN-SECCSR-TBL.                                                    
           EXEC SQL                                                             
              OPEN SECCSR                                                       
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT31-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT31-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT31-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          FETCH RESTRICTED SECURITY TABLE                     *          
      *--------------------------------------------------------------*          
       0200-FETCH-SECCSR-TBL.                                                   
           EXEC SQL                                                             
              FETCH                                                             
                  SECCSR                                                        
              INTO                                                              
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
LRM002          ,:DCLVRSTSEC.EXPTN-DT                                           
LRM002          ,:DCLVRSTSEC.COMMENT-TXT                                        
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT31-NORMAL  TO TRUE                                        
              PERFORM 0210-SETUP-SECURITY-COMMAREA                              
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT31-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT31-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT31-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *    SETUP RESTRICTED SECURITY TBL FIELDS TO ACAT31-COMMAREA   *          
      *--------------------------------------------------------------*          
       0210-SETUP-SECURITY-COMMAREA.                                            
           INITIALIZE ACAT31-SEC-ROW.                                           
           MOVE CLIENT-NBR         OF DCLVRSTSEC                                
             TO ACAT31-SEC-CLT.                                                 
           MOVE ISIN-SEC-ISSUE-CD  OF DCLVRSTSEC                                
             TO ACAT31-SEC-SECURITY.                                            
           MOVE TRNFR-MEMO-IND     OF DCLVRSTSEC                                
             TO ACAT31-SEC-MEMO.                                                
           MOVE TRNFR-BRKR-TYPE-CD OF DCLVRSTSEC                                
             TO ACAT31-SEC-TYPE.                                                
           MOVE RSTRD-MSG-TXT      OF DCLVRSTSEC                                
             TO ACAT31-SEC-MSG.                                                 
           MOVE SECURITY-ADP-NBR   OF DCLVRSTSEC                                
             TO ACAT31-SEC-ADP-NBR.                                             
LRM002     MOVE EXPTN-DT  OF DCLVRSTSEC                                         
LRM002       TO ACAT31-SEC-EXPDT.                                               
LRM002     MOVE COMMENT-TXT  OF DCLVRSTSEC                                      
LRM002       TO ACAT31-SEC-COMMENT.                                             
LRM002     MOVE CRT-TMSTP    OF DCLVRSTSEC  (1 : 10)                            
LRM002       TO ACAT31-DATE-ADDED.                                              
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          CLOSE RESTRICTED SECURITY CUROSR TABLE              *          
      *--------------------------------------------------------------*          
       0300-CLOSE-SECCSR-TBL.                                                   
           EXEC SQL                                                             
              CLOSE SECCSR                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT31-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT31-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT31-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *           OPEN BROKER CURSOR TABLE                           *          
      *--------------------------------------------------------------*          
       0400-OPEN-BKRCSR-TBL.                                                    
           EXEC SQL                                                             
              OPEN BKRCSR                                                       
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT31-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT31-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT31-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          FETCH RESTRICTED BROKER TABLE                       *          
      *--------------------------------------------------------------*          
       0500-FETCH-BKRCSR-TBL.                                                   
           EXEC SQL                                                             
              FETCH                                                             
                  BKRCSR                                                        
              INTO                                                              
                 :DCLVRSTBRKR.CLIENT-NBR                                        
                ,:DCLVRSTBRKR.ISIN-SEC-ISSUE-CD                                 
                ,:DCLVRSTBRKR.BRKR-CONTRA-NBR                                   
                ,:DCLVRSTBRKR.CRT-TMSTP                                         
                ,:DCLVRSTBRKR.UPDT-TMSTP                                        
                ,:DCLVRSTBRKR.CICS-TERM-ID-CD                                   
                ,:DCLVRSTBRKR.PRGM-NM                                           
                ,:DCLVRSTBRKR.SECURITY-ADP-NBR                                  
LRM002          ,:DCLVRSTBRKR.EXPTN-DT                                          
LRM002          ,:DCLVRSTBRKR.COMMENT-TXT                                       
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT31-NORMAL  TO TRUE                                        
              PERFORM 0510-SETUP-BROKER-COMMAREA                                
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT31-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT31-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT31-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *    SETUP RESTRICTED BROKER TABLE FIELDS TO ACAT31-COMMAREA   *          
      *--------------------------------------------------------------*          
       0510-SETUP-BROKER-COMMAREA.                                              
           INITIALIZE ACAT31-BKR-ROW.                                           
           MOVE CLIENT-NBR        OF DCLVRSTBRKR                                
             TO  ACAT31-BKR-CLT.                                                
           MOVE ISIN-SEC-ISSUE-CD OF DCLVRSTBRKR                                
             TO  ACAT31-BKR-SECURITY.                                           
           MOVE BRKR-CONTRA-NBR   OF DCLVRSTBRKR                                
             TO  ACAT31-BKR-BROKER.                                             
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          CLOSE RESTRICTED BROKER CURSOR TABLE                *          
      *--------------------------------------------------------------*          
       0600-CLOSE-BKRCSR-TBL.                                                   
           EXEC SQL                                                             
              CLOSE BKRCSR                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT31-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT31-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT31-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *     MODIFY RESTRICTED SECURITY TABLE                         *          
      *--------------------------------------------------------------*          
       0700-UPDATE-SECURITY.                                                    
           EXEC SQL                                                             
             UPDATE VRSTSEC                                                     
                SET TRNFR_MEMO_IND = :ACAT31-PASS-MEMO                          
                   ,TRNFR_BRKR_TYPE_CD = :ACAT31-PASS-TYPE                      
                   ,RSTRD_MSG_TXT = :ACAT31-PASS-MSG                            
                   ,PRGM_NM = 'ACAT31DB'                                        
                   ,CICS_TERM_ID_CD = :ACAT31-PASS-TERMID                       
                   ,UPDT_TMSTP = :WS-TIMESTAMP                                  
LRM002             ,EXPTN_DT    =   :ACAT31-PASS-EXPDT                          
LRM002             ,COMMENT_TXT =   :ACAT31-PASS-COMMENT                        
LRM002             ,CICS_SGNON_ID = :ACAT31-SIGN-ON-ID                          
LRM002             ,TPSCRT_USR_NM = :ACAT31-USER-NAME                           
LRM002             ,TPSCRT_USR_ID = :ACAT31-USER-ID                             
LRM002             ,CICS_NET_NM   = :ACAT31-NET-NAME                            
              WHERE CLIENT_NBR = :ACAT31-PASS-CLT    AND                        
                    ISIN_SEC_ISSUE_CD = :ACAT31-PASS-SECURITY                   
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT31-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT31-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT31-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *      CREATE A RESTRICTED SECURITY TABLE                      *          
      *--------------------------------------------------------------*          
       0800-INSERT-SECURITY.                                                    
           INITIALIZE DCLVRSTSEC.                                               
           EXEC SQL                                                             
              INSERT INTO VRSTSEC                                               
                 ( CLIENT_NBR                                                   
                  ,ISIN_SEC_ISSUE_CD                                            
                  ,TRNFR_MEMO_IND                                               
                  ,TRNFR_BRKR_TYPE_CD                                           
                  ,RSTRD_MSG_TXT                                                
                  ,PRGM_NM                                                      
                  ,CICS_TERM_ID_CD                                              
                  ,CRT_TMSTP                                                    
                  ,UPDT_TMSTP                                                   
                  ,SECURITY_ADP_NBR                                             
LRM002            ,EXPTN_DT                                                     
LRM002            ,COMMENT_TXT                                                  
LRM002            ,CICS_SGNON_ID                                                
LRM002            ,TPSCRT_USR_NM                                                
LRM002            ,TPSCRT_USR_ID                                                
LRM002            ,CICS_NET_NM   )                                              
                                                                                
              VALUES                                                            
                 ( :ACAT31-PASS-CLT                                             
                  ,:ACAT31-PASS-SECURITY                                        
                  ,:ACAT31-PASS-MEMO                                            
                  ,:ACAT31-PASS-TYPE                                            
                  ,:ACAT31-PASS-MSG                                             
                  ,'ACAT31DB'                                                   
                  ,:ACAT31-PASS-TERMID                                          
                  ,:WS-TIMESTAMP                                                
                  ,:WS-TIMESTAMP                                                
                  ,:ACAT31-PASS-ADP-NBR                                         
LRM002            ,:ACAT31-PASS-EXPDT                                           
LRM002            ,:ACAT31-PASS-COMMENT                                         
LRM002            ,:ACAT31-SIGN-ON-ID                                           
LRM002            ,:ACAT31-USER-NAME                                            
LRM002            ,:ACAT31-USER-ID                                              
LRM002            ,:ACAT31-NET-NAME  )                                          
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT31-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT31-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT31-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *      CREATE A RESTRICTED BROKER TABLE                        *          
      *--------------------------------------------------------------*          
       0900-INSERT-BROKER.                                                      
           INITIALIZE DCLVRSTBRKR.                                              
           EXEC SQL                                                             
              INSERT INTO VRSTBRKR                                              
                 ( CLIENT_NBR                                                   
                  ,ISIN_SEC_ISSUE_CD                                            
                  ,BRKR_CONTRA_NBR                                              
                  ,CRT_TMSTP                                                    
                  ,UPDT_TMSTP                                                   
                  ,CICS_TERM_ID_CD                                              
                  ,PRGM_NM                                                      
                  ,SECURITY_ADP_NBR                                             
LRM002            ,EXPTN_DT                                                     
LRM002            ,COMMENT_TXT                                                  
LRM002            ,CICS_SGNON_ID                                                
LRM002            ,TPSCRT_USR_NM                                                
LRM002            ,TPSCRT_USR_ID                                                
LRM002            ,CICS_NET_NM  )                                               
              VALUES                                                            
                 ( :ACAT31-PASS-CLT                                             
                  ,:ACAT31-PASS-SECURITY                                        
                  ,:ACAT31-PASS-BROKER                                          
                  ,:WS-TIMESTAMP                                                
                  ,:WS-TIMESTAMP                                                
                  ,:ACAT31-PASS-TERMID                                          
                  ,'ACAT31DB'                                                   
                  ,:ACAT31-PASS-ADP-NBR                                         
LRM002            ,:ACAT31-PASS-EXPDT                                           
LRM002            ,:ACAT31-PASS-COMMENT                                         
LRM002            ,:ACAT31-SIGN-ON-ID                                           
LRM002            ,:ACAT31-USER-NAME                                            
LRM002            ,:ACAT31-USER-ID                                              
LRM002            ,:ACAT31-NET-NAME       )                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT31-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT31-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT31-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *         DELETE A RESTRICTED SECURITY ROW                     *          
      *--------------------------------------------------------------*          
       1000-DELETE-SECURITY.                                                    
           EXEC SQL DELETE                                                      
               FROM VRSTSEC                                                     
              WHERE CLIENT_NBR = :ACAT31-PASS-CLT          AND                  
                    ISIN_SEC_ISSUE_CD = :ACAT31-PASS-SECURITY                   
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT31-NORMAL  TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT31-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT31-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT31-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *      DELETE RESTRICTED BRKER ROWS                            *          
      *--------------------------------------------------------------*          
       1100-DELETE-BROKER.                                                      
           EXEC SQL DELETE                                                      
               FROM VRSTBRKR                                                    
              WHERE CLIENT_NBR = :ACAT31-PASS-CLT                               
               AND  ISIN_SEC_ISSUE_CD = :ACAT31-PASS-SECURITY                   
               AND  SECURITY_ADP_NBR = :ACAT31-PASS-ADP-NBR                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT31-NORMAL  TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT31-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT31-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT31-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *     CHECK IF A SECURITY EXISTS                               *          
      *--------------------------------------------------------------*          
       1200-FIND-SECURITY.                                                      
           EXEC SQL                                                             
               SELECT                                                           
                    CLIENT_NBR                                                  
                   ,ISIN_SEC_ISSUE_CD                                           
                   ,TRNFR_MEMO_IND                                              
                   ,TRNFR_BRKR_TYPE_CD                                          
                   ,RSTRD_MSG_TXT                                               
                   ,SECURITY_ADP_NBR                                            
LRM003             ,CRT_TMSTP                                                   
LRM003             ,EXPTN_DT                                                    
LRM003             ,COMMENT_TXT                                                 
                 INTO                                                           
                    :ACAT31-SEC-CLT                                             
                   ,:ACAT31-SEC-SECURITY                                        
                   ,:ACAT31-SEC-MEMO                                            
                   ,:ACAT31-SEC-TYPE                                            
                   ,:ACAT31-SEC-MSG                                             
                   ,:ACAT31-SEC-ADP-NBR                                         
LRM003             ,:DCLVRSTSEC.CRT-TMSTP                                       
LRM003             ,:ACAT31-SEC-EXPDT                                           
LRM003             ,:ACAT31-SEC-COMMENT                                         
                 FROM                                                           
                    VRSTSEC                                                     
                WHERE                                                           
                    CLIENT_NBR = :ACAT31-PASS-CLT          AND                  
                    ISIN_SEC_ISSUE_CD = :ACAT31-PASS-SECURITY                   
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT31-FOUND   TO TRUE                                        
LRM003        MOVE CRT-TMSTP    OF DCLVRSTSEC  (1 : 10)                         
LRM003           TO ACAT31-DATE-ADDED                                           
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT31-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT31-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT31-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *           CHECK IF ANY BROKER ROWS EXIST                     *          
      *--------------------------------------------------------------*          
       1300-COUNT-BROKER.                                                       
           EXEC SQL                                                             
               SELECT                                                           
                    COUNT(*)                                                    
                 INTO                                                           
                    :WS-ROW-COUNT                                               
                 FROM                                                           
                    VRSTBRKR                                                    
                WHERE                                                           
                    CLIENT_NBR = :ACAT31-PASS-CLT          AND                  
                    ISIN_SEC_ISSUE_CD = :ACAT31-PASS-SECURITY                   
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              IF WS-ROW-COUNT > 0                                               
                 SET ACAT31-FOUND TO TRUE                                       
              ELSE                                                              
                 SET ACAT31-NOT-FOUND TO TRUE                                   
              END-IF                                                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT31-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT31-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT31-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *        OPEN SECURITY CURSOR TABLE IN DESCENDING ORDER        *          
      *--------------------------------------------------------------*          
       1400-OPEN-SECCSR-DESCEND.                                                
           EXEC SQL                                                             
              OPEN SECCSRD                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT31-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT31-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT31-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
      *                                                                         
      *--------------------------------------------------------------*          
      *       FETCH SECURITY CURSOR TABLE IN DESCENDING ORDER        *          
      *--------------------------------------------------------------*          
       1500-FETCH-SECCSR-DESCEND.                                               
           EXEC SQL                                                             
              FETCH                                                             
                  SECCSRD                                                       
              INTO                                                              
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
LRM002          ,:DCLVRSTSEC.EXPTN-DT                                           
LRM002          ,:DCLVRSTSEC.COMMENT-TXT                                        
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT31-NORMAL  TO TRUE                                        
              PERFORM 0210-SETUP-SECURITY-COMMAREA                              
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT31-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT31-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT31-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
      *                                                                         
      *--------------------------------------------------------------*          
      *       CLOSE SECURITY CURSOR TABLE IN DESCENDING ORDER        *          
      *--------------------------------------------------------------*          
       1600-CLOSE-SECCSR-DESCEND.                                               
           EXEC SQL                                                             
              CLOSE SECCSRD                                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT31-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT31-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT31-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *           CHECK IF ANY ASSETS EXIST                          *          
      *--------------------------------------------------------------*          
       1700-COUNT-ASSETS.                                                       
           EXEC SQL                                                             
               SELECT                                                           
                    COUNT(*)                                                    
                 INTO                                                           
                    :WS-ROW-COUNT                                               
                 FROM                                                           
                    VASSET                                                      
                WHERE                                                           
                    CLIENT_NBR = :ACAT31-PASS-CLT          AND                  
                    ISIN_SEC_ISSUE_CD = :ACAT31-PASS-SECURITY                   
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              IF WS-ROW-COUNT > 0                                               
                 SET ACAT31-FOUND TO TRUE                                       
              ELSE                                                              
                 SET ACAT31-NOT-FOUND TO TRUE                                   
              END-IF                                                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT31-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT31-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT31-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      * UPDATE ASSET TABLE                                           *          
      *   - SET RESTRICTED INDICATOR TO 'Y' WHEN RESTRICTED SECURITY *          
      *     IS ADDED                                                 *          
      *   - SET RESTRICTED INDICATOR TO 'N' WHEN RESTRICTED SECURITY *          
      *     IS DELETED                                               *          
      *--------------------------------------------------------------*          
       1800-UPDATE-ASSET.                                                       
           EXEC SQL                                                             
             UPDATE VASSET                                                      
                SET RESTRICTED_IND = :ACAT31-PASS-RESTRICTED-IND                
                   ,PRGM_NM = 'ACAT31DB'                                        
                   ,CICS_TERM_ID_CD = :ACAT31-PASS-TERMID                       
                   ,UPDT_TMSTP = :WS-TIMESTAMP                                  
              WHERE CLIENT_NBR = :ACAT31-PASS-CLT    AND                        
                    ISIN_SEC_ISSUE_CD = :ACAT31-PASS-SECURITY                   
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT31-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT31-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT31-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
      *                                                                         
      *--------------------------------------------------------------*          
      *          WRITE DB2 ERROR LOG                                 *          
      *--------------------------------------------------------------*          
       9999-DB2-ERROR.                                                          
           MOVE SPACE      TO WS-ERR-DATA.                                      
           SET WS-WRITE-ERROR-TO-LOG TO TRUE.                                   
           MOVE EIBTRNID   TO CALLING-TRAN-ID.                                  
           MOVE 'ACAT31RS' TO CALLING-PROGRAM-ID.                               
           MOVE SQLCA      TO SQLCA-AREA.                                       
           EXEC CICS LINK PROGRAM('FPDB2LOG')                                   
                COMMAREA(WS-ERR-DATA)                                           
                LENGTH(LENGTH OF WS-ERR-DATA)                                   
                NOHANDLE                                                        
           END-EXEC.                                                            
       EJECT                                                                    
                                                                                
       HANG-CICS.                                                               
           GOBACK.                                                              
