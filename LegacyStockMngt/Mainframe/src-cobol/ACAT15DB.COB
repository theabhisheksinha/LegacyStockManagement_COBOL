000001* PDX    - ACAT15DB C0212918 10/29/04 14:54:39 TBEDTAK            00001000
000001* ET0001 - SSR 39701 - INCLUDE MFC'S REJECT CODE 27, AND PTR REJ. 00001000
000001* PDX    - ACAT15DB C0120330 01/26/99 11:03:13 TBEDTAK            00001000
000001* PDX    - ACAT15DB C0119329 12/30/98 10:48:08 TBEDTAK            00001000
000001* PDX    - ACAT15DB C0117777 12/09/98 11:01:51 TBEDTAK            00001000
000001* PDX    - ACAT15DB C0109165 07/24/98 17:02:02 TBEDTAK            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    ACAT15DB.                                                 
       AUTHOR.  E.TAKAESU.                                                      
      *REMARKS.                                                                 
      *****************************************************************         
      *    DB2 I/O FOR OUTGOING TRANSFERS REJECTED BY CONTRA BROKER   *         
      *****************************************************************         
       ENVIRONMENT DIVISION.                                                    
       DATA DIVISION.                                                           
       WORKING-STORAGE SECTION.                                                 
       COPY PDXIDCOB.                                                           
      *                                                                         
       01  WS-WORK-AREA.                                                        
           03  WS-INIT-TFR-ROW-CNT             PIC S9(9) COMP VALUE 0.          
           03  WS-NAME.                                                         
               05  WS-NAME1                    PIC X(30).                       
               05  WS-NAME2                    PIC X(30).                       
           03  WS-COMMENT-TXT.                                                  
               05  WS-COMMENT-TXT1             PIC X(60).                       
               05  WS-COMMENT-TXT2             PIC X(60).                       
       01  WS-PASSED-SRCH-FLDS.                                                 
           03  WS-PASSED-CLT                   PIC X(04).                       
           03  WS-PASSED-DLVR-ACCT             PIC X(20).                       
           03  WS-PASSED-BRKR                  PIC X(04).                       
           03  WS-PASSED-TRNFR                 PIC X(03).                       
           03  WS-PASSED-RR                    PIC X(03).                       
           03  WS-PASSED-ACAT                  PIC X(14).                       
       01  WS-ERR-DATA.                                                         
           03  WS-REQUEST-TYPE                 PIC X(01).                       
               88  WS-WRITE-ERROR-TO-LOG           VALUE 'Y'.                   
           03  CALLING-TRAN-ID                 PIC X(04).                       
           03  CALLING-PROGRAM-ID              PIC X(08).                       
           03  SQLCA-AREA                      PIC X(136).                      
      *                                                                         
       EJECT                                                                    
           EXEC SQL                                                             
              INCLUDE VTRNFR                                                    
           END-EXEC.                                                            
       EJECT                                                                    
           EXEC SQL                                                             
              INCLUDE SQLCA                                                     
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------*                
      *     DECLARE TRNASFER CURSOR STATEMENT                  *                
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE  TFRCSR  CURSOR FOR                                       
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,DLVR_NBR                                                   
                    ,ACCT_DLVR_NBR                                              
                    ,TRNFR_TYPE_CD                                              
                    ,RCV_NBR                                                    
                    ,ACCT_RCV_NBR                                               
                    ,RCV_CUST_NM                                                
                    ,RCV_SS_PRIM_NBR                                            
                    ,RCV_SS_SCNDY_NBR                                           
                    ,RCV_ACCT_TYPE_CD                                           
                    ,CMNT_TXT                                                   
                    ,TRNFR_TYPE_RJCT_CD                                         
                    ,SYS_RJCT_RSN_CD                                            
                    ,TRNFR_TYPE_RJC1_CD                                         
                    ,RR_CD                                                      
                    ,BRANCH_CD                                                  
                    ,ACCT_RJCT_RSBM_IND                                         
                    ,ACCT_CD                                                    
                  FROM                                                          
                     VTRNFR                                                     
                  WHERE                                                         
                     CLIENT_NBR = :WS-PASSED-CLT                                
                     AND NOT (ACCT_DLVR_NBR < :WS-PASSED-DLVR-ACCT)             
                     AND RCV_NBR LIKE :WS-PASSED-BRKR                           
ET0001**             AND (TRNFR_TYPE_CD LIKE :WS-PASSED-TRNFR  AND              
ET0001**                   NOT (TRNFR_TYPE_CD = 'PTR'))                         
ET0001               AND TRNFR_TYPE_CD LIKE :WS-PASSED-TRNFR                    
                     AND RR_CD LIKE :WS-PASSED-RR                               
                     AND DSTBN_SIDE_CD = 'D'                                    
ET0001**             AND (TRNFR_TYPE_RJCT_CD BETWEEN '21' AND '26')             
ET0001               AND (TRNFR_TYPE_RJCT_CD BETWEEN '21' AND '27')             
                     AND STTS_CD IN ('140', '600')                              
                  ORDER BY                                                      
                     CLIENT_NBR                                                 
                    ,ACCT_DLVR_NBR                                              
                    ,RCV_NBR                                                    
                    ,ACAT_CONTROL_NBR                                           
           END-EXEC.                                                            
           EJECT                                                                
      *                                                                         
      *--------------------------------------------------------*                
      *  DECLARE TRANSFER CURSOR STATMENT IN DESCENDING ORDER  *                
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE  TFRCSRD  CURSOR FOR                                      
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,DLVR_NBR                                                   
                    ,ACCT_DLVR_NBR                                              
                    ,TRNFR_TYPE_CD                                              
                    ,RCV_NBR                                                    
                    ,ACCT_RCV_NBR                                               
                    ,RCV_CUST_NM                                                
                    ,RCV_SS_PRIM_NBR                                            
                    ,RCV_SS_SCNDY_NBR                                           
                    ,RCV_ACCT_TYPE_CD                                           
                    ,CMNT_TXT                                                   
                    ,TRNFR_TYPE_RJCT_CD                                         
                    ,SYS_RJCT_RSN_CD                                            
                    ,TRNFR_TYPE_RJC1_CD                                         
                    ,RR_CD                                                      
                    ,BRANCH_CD                                                  
                    ,ACCT_RJCT_RSBM_IND                                         
                    ,ACCT_CD                                                    
                  FROM                                                          
                     VTRNFR                                                     
                  WHERE                                                         
                     CLIENT_NBR = :WS-PASSED-CLT                                
                     AND NOT (ACCT_DLVR_NBR < :WS-PASSED-DLVR-ACCT)             
                     AND RCV_NBR LIKE :WS-PASSED-BRKR                           
ET0001**             AND (TRNFR_TYPE_CD LIKE :WS-PASSED-TRNFR  AND              
ET0001**                   NOT (TRNFR_TYPE_CD = 'PTR'))                         
ET0001               AND TRNFR_TYPE_CD LIKE :WS-PASSED-TRNFR                    
                     AND RR_CD LIKE :WS-PASSED-RR                               
                     AND DSTBN_SIDE_CD = 'D'                                    
ET0001**             AND (TRNFR_TYPE_RJCT_CD BETWEEN '21' AND '26')             
ET0001               AND (TRNFR_TYPE_RJCT_CD BETWEEN '21' AND '27')             
                     AND STTS_CD IN ('140', '600')                              
                  ORDER BY                                                      
                     CLIENT_NBR       DESC                                      
                    ,ACCT_DLVR_NBR    DESC                                      
                    ,RCV_NBR          DESC                                      
                    ,ACAT_CONTROL_NBR DESC                                      
           END-EXEC.                                                            
           EJECT                                                                
      *                                                                         
       LINKAGE SECTION.                                                         
       01  DFHCOMMAREA.                                                         
       COPY ACAT15IO.                                                           
       EJECT                                                                    
      *                                                                         
       PROCEDURE DIVISION.                                                      
           MOVE ACAT15IO-PASS-FLDS                                              
             TO WS-PASSED-SRCH-FLDS.                                            
      *                                                                         
           EVALUATE TRUE                                                        
              WHEN ACAT15IO-O-TFRCSR                                            
                   PERFORM OPEN-TFRCSR                                          
              WHEN ACAT15IO-F-TFRCSR                                            
                   PERFORM FETCH-TFRCSR                                         
              WHEN ACAT15IO-C-TFRCSR                                            
                   PERFORM CLOSE-TFRCSR                                         
              WHEN ACAT15IO-O-TFRCSRD                                           
                   PERFORM OPEN-TFRCSRD                                         
              WHEN ACAT15IO-F-TFRCSRD                                           
                   PERFORM FETCH-TFRCSRD                                        
              WHEN ACAT15IO-C-TFRCSRD                                           
                   PERFORM CLOSE-TFRCSRD                                        
              WHEN ACAT15IO-GET-TRNFR                                           
                   PERFORM GET-ACTIVE-TRANSFER                                  
           END-EVALUATE.                                                        
                                                                                
           EXEC CICS RETURN                                                     
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *       OPEN TRANSFER DECLARE CURSOR TABLE                     *          
      *--------------------------------------------------------------*          
       OPEN-TFRCSR.                                                             
           EXEC SQL                                                             
              OPEN TFRCSR                                                       
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT15IO-NORMAL TO TRUE                                       
           ELSE                                                                 
              SET ACAT15IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT15IO-SQLCODE                                 
              PERFORM 9999-DB2-ERROR.                                           
      *                                                                         
      *--------------------------------------------------------------*          
      *       FETCH TRANSFER DECLARE CURSOR TABLE                    *          
      *--------------------------------------------------------------*          
       FETCH-TFRCSR.                                                            
           EXEC SQL                                                             
              FETCH                                                             
                  TFRCSR                                                        
              INTO                                                              
                  :CLIENT-NBR                                                   
                 ,:ACAT-CONTROL-NBR                                             
                 ,:DLVR-NBR                                                     
                 ,:ACCT-DLVR-NBR                                                
                 ,:TRNFR-TYPE-CD                                                
                 ,:RCV-NBR                                                      
                 ,:ACCT-RCV-NBR                                                 
                 ,:RCV-CUST-NM                                                  
                 ,:RCV-SS-PRIM-NBR                                              
                 ,:RCV-SS-SCNDY-NBR                                             
                 ,:RCV-ACCT-TYPE-CD                                             
                 ,:CMNT-TXT                                                     
                 ,:TRNFR-TYPE-RJCT-CD                                           
                 ,:SYS-RJCT-RSN-CD                                              
                 ,:TRNFR-TYPE-RJC1-CD                                           
                 ,:RR-CD                                                        
                 ,:BRANCH-CD                                                    
                 ,:ACCT-RJCT-RSBM-IND                                           
                 ,:ACCT-CD                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT15IO-NORMAL  TO TRUE                                      
              PERFORM SET-ACAT15IO-RET-FLDS                                     
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT15IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
              SET ACAT15IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT15IO-SQLCODE                                 
              PERFORM 9999-DB2-ERROR.                                           
      *                                                                         
      *--------------------------------------------------------------*          
      *       CLOSE TRANSFER DECLARE CURSOR TABLE                    *          
      *--------------------------------------------------------------*          
       CLOSE-TFRCSR.                                                            
           EXEC SQL                                                             
              CLOSE TFRCSR                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT15IO-NORMAL TO TRUE                                       
           ELSE                                                                 
              SET ACAT15IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT15IO-SQLCODE                                 
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *    OPEN TRANSFER DECLARE CURSOR TABLE IN DESCENDING ORDER    *          
      *--------------------------------------------------------------*          
       OPEN-TFRCSRD.                                                            
           EXEC SQL                                                             
              OPEN TFRCSRD                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT15IO-NORMAL TO TRUE                                       
           ELSE                                                                 
              SET ACAT15IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT15IO-SQLCODE                                 
              PERFORM 9999-DB2-ERROR.                                           
      *                                                                         
      *--------------------------------------------------------------*          
      *   FETCH TRANSFER DECLARE CURSOR TABLE IN DESCENDING ORDER    *          
      *--------------------------------------------------------------*          
       FETCH-TFRCSRD.                                                           
           EXEC SQL                                                             
              FETCH                                                             
                  TFRCSRD                                                       
              INTO                                                              
                  :CLIENT-NBR                                                   
                 ,:ACAT-CONTROL-NBR                                             
                 ,:DLVR-NBR                                                     
                 ,:ACCT-DLVR-NBR                                                
                 ,:TRNFR-TYPE-CD                                                
                 ,:RCV-NBR                                                      
                 ,:ACCT-RCV-NBR                                                 
                 ,:RCV-CUST-NM                                                  
                 ,:RCV-SS-PRIM-NBR                                              
                 ,:RCV-SS-SCNDY-NBR                                             
                 ,:RCV-ACCT-TYPE-CD                                             
                 ,:CMNT-TXT                                                     
                 ,:TRNFR-TYPE-RJCT-CD                                           
                 ,:SYS-RJCT-RSN-CD                                              
                 ,:TRNFR-TYPE-RJC1-CD                                           
                 ,:RR-CD                                                        
                 ,:BRANCH-CD                                                    
                 ,:ACCT-RJCT-RSBM-IND                                           
                 ,:ACCT-CD                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT15IO-NORMAL  TO TRUE                                      
              PERFORM SET-ACAT15IO-RET-FLDS                                     
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT15IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
              SET ACAT15IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT15IO-SQLCODE                                 
              PERFORM 9999-DB2-ERROR.                                           
      *                                                                         
      *--------------------------------------------------------------*          
      *   CLOSE TRANSFER DECLARE CURSOR TABLE IN DESCENDING ORDER    *          
      *--------------------------------------------------------------*          
       CLOSE-TFRCSRD.                                                           
           EXEC SQL                                                             
              CLOSE TFRCSRD                                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT15IO-NORMAL TO TRUE                                       
           ELSE                                                                 
              SET ACAT15IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT15IO-SQLCODE                                 
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          SETUP ACAT15IO RETURN FIELDS                        *          
      *--------------------------------------------------------------*          
       SET-ACAT15IO-RET-FLDS.                                                   
           MOVE CLIENT-NBR         TO ACAT15IO-CLT-NBR.                         
           MOVE ACAT-CONTROL-NBR   TO ACAT15IO-ACAT-NBR.                        
           MOVE DLVR-NBR           TO ACAT15IO-DLVR-NBR.                        
           MOVE ACCT-DLVR-NBR      TO ACAT15IO-DLVR-ACCT.                       
           MOVE TRNFR-TYPE-CD      TO ACAT15IO-TRNFR.                           
           MOVE RCV-NBR            TO ACAT15IO-RCV-NBR.                         
           MOVE ACCT-RCV-NBR       TO ACAT15IO-RCV-ACCT.                        
           MOVE RCV-CUST-NM        TO ACAT15IO-CUST-NM.                         
           MOVE RCV-SS-PRIM-NBR    TO ACAT15IO-SSN1.                            
           MOVE RCV-SS-SCNDY-NBR   TO ACAT15IO-SSN2.                            
           MOVE RCV-ACCT-TYPE-CD   TO ACAT15IO-ACCT-TYPE.                       
           MOVE CMNT-TXT           TO ACAT15IO-CMNT.                            
           MOVE TRNFR-TYPE-RJCT-CD TO ACAT15IO-RJCT-CD.                         
           MOVE RR-CD              TO ACAT15IO-RR.                              
           MOVE BRANCH-CD          TO ACAT15IO-BRANCH.                          
           MOVE ACCT-RJCT-RSBM-IND TO ACAT15IO-RSBM-IND.                        
           MOVE ACCT-CD            TO ACAT15IO-ACCT.                            
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *    READ ACTIVE TRANSFER AND GET REJECT-RESUBMIT-IND          *          
      *--------------------------------------------------------------*          
       GET-ACTIVE-TRANSFER.                                                     
           EXEC SQL                                                             
              SELECT                                                            
                  ACCT_RJCT_RSBM_IND                                            
               INTO                                                             
                  :ACAT15IO-RSBM-IND                                            
               FROM                                                             
                  VTRNFR                                                        
               WHERE                                                            
                  CLIENT_NBR = :WS-PASSED-CLT                                   
                  AND  ACAT_CONTROL_NBR = :WS-PASSED-ACAT                       
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT15IO-NORMAL TO TRUE                                       
           ELSE                                                                 
           IF SQLCODE = 100                                                     
              SET ACAT15IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
              SET ACAT15IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT15IO-SQLCODE                                 
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
           MOVE 'ACAT15DB' TO CALLING-PROGRAM-ID.                               
           MOVE SQLCA      TO SQLCA-AREA.                                       
           EXEC CICS LINK PROGRAM('FPDB2LOG')                                   
                COMMAREA(WS-ERR-DATA)                                           
                LENGTH(LENGTH OF WS-ERR-DATA)                                   
                NOHANDLE                                                        
           END-EXEC.                                                            
       EJECT                                                                    
                                                                                
       HANG-CICS.                                                               
           GOBACK.                                                              
