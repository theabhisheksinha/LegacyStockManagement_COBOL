000001* PDX    - ACAT07DB C0205792 07/06/04 14:18:11 TBEDTAK            00001000
000001* ET0001 - DISPLAY REJECTED "PTR".                                00001000
000001* PDX    - ACAT07DB C0120330 01/27/99 16:34:31 TBEDTAK            00001000
000001* PDX    - ACAT07DB C0119329 12/15/98 17:50:16 TBEDTAK            00001000
000001* PDX    - ACAT07DB C0117777 12/01/98 11:41:40 TBEDTAK            00001000
000001* PDX    - ACAT07DB C0109165 06/12/98 10:11:29 TBEDTAK            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    ACAT07DB.                                                 
       AUTHOR.  E.TAKAESU.                                                      
      *REMARKS.                                                                 
      *****************************************************************         
      *       DB2 I/O FOR INCOMMING TRANSFERS REJECTED BY SYSTEM      *         
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
           03  WS-PASSED-ACCT-RCV              PIC X(20).                       
           03  WS-PASSED-BRKR                  PIC X(04).                       
           03  WS-PASSED-RR                    PIC X(03).                       
           03  WS-PASSED-ACAT                  PIC X(14).                       
ET0001     03  WS-PASSED-TRNFR1                PIC X(03).                       
ET0001     03  WS-PASSED-TRNFR2                PIC X(03).                       
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
      *     ACTIVE TRANSFER CURSOR DECLARE STATEMENT           *                
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE  TFRCSR  CURSOR FOR                                       
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,RCV_NBR                                                    
                    ,ACCT_RCV_NBR                                               
                    ,DLVR_NBR                                                   
                    ,ACCT_DLVR_NBR                                              
                    ,RCV_CUST_NM                                                
                    ,RCV_SS_PRIM_NBR                                            
                    ,RCV_SS_SCNDY_NBR                                           
                    ,RCV_ACCT_TYPE_CD                                           
                    ,CMNT_TXT                                                   
                    ,SYS_RJCT_RSN_CD                                            
                    ,TRNFR_TYPE_RJCT_CD                                         
                    ,TRNFR_TYPE_RJC1_CD                                         
                    ,RR_CD                                                      
                    ,BRANCH_CD                                                  
                    ,ACCT_RJCT_RSBM_IND                                         
ET0001              ,TRNFR_TYPE_CD                                              
                    ,ACCT_CD                                                    
                  FROM                                                          
                     VTRNFR                                                     
                  WHERE                                                         
                     CLIENT_NBR = :WS-PASSED-CLT                                
                     AND  NOT (ACCT_RCV_NBR < :WS-PASSED-ACCT-RCV)              
                     AND  RR_CD LIKE :WS-PASSED-RR                              
                     AND  DLVR_NBR LIKE :WS-PASSED-BRKR                         
                     AND  DSTBN_SIDE_CD = 'R'                                   
ET0001**             AND  TRNFR_TYPE_CD = 'FUL'                                 
ET0001               AND (TRNFR_TYPE_CD LIKE :WS-PASSED-TRNFR1  OR              
ET0001                    TRNFR_TYPE_CD LIKE :WS-PASSED-TRNFR2)                 
                     AND  STTS_CD IN ('140', '600')                             
                     AND  ((SYS_RJCT_RSN_CD > '00' ) OR                         
                          (TRNFR_TYPE_RJCT_CD BETWEEN '21' AND '26'))           
                  ORDER BY                                                      
                     CLIENT_NBR                                                 
                    ,ACCT_RCV_NBR                                               
                    ,DLVR_NBR                                                   
                    ,ACAT_CONTROL_NBR                                           
           END-EXEC.                                                            
           EJECT                                                                
      *                                                                         
      *--------------------------------------------------------*                
      *  ACTIVE TFR CURSOR DECLARE STATEMENT IN DESCEND ORDER  *                
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE  TFRCSRD  CURSOR FOR                                      
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,RCV_NBR                                                    
                    ,ACCT_RCV_NBR                                               
                    ,DLVR_NBR                                                   
                    ,ACCT_DLVR_NBR                                              
                    ,RCV_CUST_NM                                                
                    ,RCV_SS_PRIM_NBR                                            
                    ,RCV_SS_SCNDY_NBR                                           
                    ,RCV_ACCT_TYPE_CD                                           
                    ,CMNT_TXT                                                   
                    ,SYS_RJCT_RSN_CD                                            
                    ,TRNFR_TYPE_RJCT_CD                                         
                    ,TRNFR_TYPE_RJC1_CD                                         
                    ,RR_CD                                                      
                    ,BRANCH_CD                                                  
                    ,ACCT_RJCT_RSBM_IND                                         
ET0001              ,TRNFR_TYPE_CD                                              
                    ,ACCT_CD                                                    
                  FROM                                                          
                     VTRNFR                                                     
                  WHERE                                                         
                     CLIENT_NBR = :WS-PASSED-CLT                                
                     AND  NOT (ACCT_RCV_NBR < :WS-PASSED-ACCT-RCV)              
                     AND  RR_CD LIKE :WS-PASSED-RR                              
                     AND  DLVR_NBR LIKE :WS-PASSED-BRKR                         
                     AND  DSTBN_SIDE_CD = 'R'                                   
ET0001**             AND  TRNFR_TYPE_CD = 'FUL'                                 
ET0001               AND (TRNFR_TYPE_CD LIKE :WS-PASSED-TRNFR1  OR              
ET0001                    TRNFR_TYPE_CD LIKE :WS-PASSED-TRNFR2)                 
                     AND  STTS_CD IN ('140', '600')                             
                     AND  ((SYS_RJCT_RSN_CD > '00' ) OR                         
                          (TRNFR_TYPE_RJCT_CD BETWEEN '21' AND '26'))           
                  ORDER BY                                                      
                     CLIENT_NBR       DESC                                      
                    ,ACCT_RCV_NBR     DESC                                      
                    ,DLVR_NBR         DESC                                      
                    ,ACAT_CONTROL_NBR DESC                                      
           END-EXEC.                                                            
           EJECT                                                                
      *                                                                         
       LINKAGE SECTION.                                                         
       01  DFHCOMMAREA.                                                         
       COPY ACAT07IO.                                                           
       EJECT                                                                    
      *                                                                         
       PROCEDURE DIVISION.                                                      
           MOVE ACAT07IO-PASS-FLDS                                              
             TO WS-PASSED-SRCH-FLDS.                                            
      *                                                                         
           EVALUATE TRUE                                                        
              WHEN ACAT07IO-O-TFRCSR                                            
                   PERFORM OPEN-TFRCSR                                          
              WHEN ACAT07IO-F-TFRCSR                                            
                   PERFORM FETCH-TFRCSR                                         
              WHEN ACAT07IO-C-TFRCSR                                            
                   PERFORM CLOSE-TFRCSR                                         
              WHEN ACAT07IO-O-TFRCSRD                                           
                   PERFORM OPEN-TFRCSRD                                         
              WHEN ACAT07IO-F-TFRCSRD                                           
                   PERFORM FETCH-TFRCSRD                                        
              WHEN ACAT07IO-C-TFRCSRD                                           
                   PERFORM CLOSE-TFRCSRD                                        
              WHEN ACAT07IO-GET-TRNFR                                           
                 PERFORM GET-RESUBMIT-IND                                       
           END-EVALUATE.                                                        
                                                                                
           EXEC CICS RETURN                                                     
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          OPEN TRANSFER CURSOR TABLE                          *          
      *--------------------------------------------------------------*          
       OPEN-TFRCSR.                                                             
           EXEC SQL                                                             
              OPEN TFRCSR                                                       
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT07IO-NORMAL TO TRUE                                       
           ELSE                                                                 
              SET ACAT07IO-ERROR     TO TRUE                                    
              MOVE SQLCODE  TO ACAT07IO-SQLCODE                                 
              PERFORM 9999-DB2-ERROR.                                           
      *                                                                         
      *--------------------------------------------------------------*          
      *         FETCH TRANSFER CURSOR TABLE                          *          
      *--------------------------------------------------------------*          
       FETCH-TFRCSR.                                                            
           EXEC SQL                                                             
              FETCH                                                             
                  TFRCSR                                                        
              INTO                                                              
                  :CLIENT-NBR                                                   
                 ,:ACAT-CONTROL-NBR                                             
                 ,:RCV-NBR                                                      
                 ,:ACCT-RCV-NBR                                                 
                 ,:DLVR-NBR                                                     
                 ,:ACCT-DLVR-NBR                                                
                 ,:RCV-CUST-NM                                                  
                 ,:RCV-SS-PRIM-NBR                                              
                 ,:RCV-SS-SCNDY-NBR                                             
                 ,:RCV-ACCT-TYPE-CD                                             
                 ,:CMNT-TXT                                                     
                 ,:SYS-RJCT-RSN-CD                                              
                 ,:TRNFR-TYPE-RJCT-CD                                           
                 ,:TRNFR-TYPE-RJC1-CD                                           
                 ,:RR-CD                                                        
                 ,:BRANCH-CD                                                    
                 ,:ACCT-RJCT-RSBM-IND                                           
ET0001           ,:TRNFR-TYPE-CD                                                
                 ,:ACCT-CD                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT07IO-NORMAL  TO TRUE                                      
              PERFORM SET-ACAT07IO-RET-FLDS                                     
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT07IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
              SET ACAT07IO-ERROR     TO TRUE                                    
              MOVE SQLCODE  TO ACAT07IO-SQLCODE                                 
              PERFORM 9999-DB2-ERROR.                                           
      *                                                                         
      *--------------------------------------------------------------*          
      *         CLOSE TRANSFER CURSOR TABLE                          *          
      *--------------------------------------------------------------*          
       CLOSE-TFRCSR.                                                            
           EXEC SQL                                                             
              CLOSE TFRCSR                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT07IO-NORMAL TO TRUE                                       
           ELSE                                                                 
              SET ACAT07IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT07IO-SQLCODE                                 
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          OPEN TRANSFER TABLE IN DESCENDING ORDER             *          
      *--------------------------------------------------------------*          
       OPEN-TFRCSRD.                                                            
           EXEC SQL                                                             
              OPEN TFRCSRD                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT07IO-NORMAL TO TRUE                                       
           ELSE                                                                 
              SET ACAT07IO-ERROR     TO TRUE                                    
              MOVE SQLCODE  TO ACAT07IO-SQLCODE                                 
              PERFORM 9999-DB2-ERROR.                                           
      *                                                                         
      *--------------------------------------------------------------*          
      *         FETCH TRANSFER TABLE IN DESCENDING ORDER             *          
      *--------------------------------------------------------------*          
       FETCH-TFRCSRD.                                                           
           EXEC SQL                                                             
              FETCH                                                             
                  TFRCSRD                                                       
              INTO                                                              
                  :CLIENT-NBR                                                   
                 ,:ACAT-CONTROL-NBR                                             
                 ,:RCV-NBR                                                      
                 ,:ACCT-RCV-NBR                                                 
                 ,:DLVR-NBR                                                     
                 ,:ACCT-DLVR-NBR                                                
                 ,:RCV-CUST-NM                                                  
                 ,:RCV-SS-PRIM-NBR                                              
                 ,:RCV-SS-SCNDY-NBR                                             
                 ,:RCV-ACCT-TYPE-CD                                             
                 ,:CMNT-TXT                                                     
                 ,:SYS-RJCT-RSN-CD                                              
                 ,:TRNFR-TYPE-RJCT-CD                                           
                 ,:TRNFR-TYPE-RJC1-CD                                           
                 ,:RR-CD                                                        
                 ,:BRANCH-CD                                                    
                 ,:ACCT-RJCT-RSBM-IND                                           
ET0001           ,:TRNFR-TYPE-CD                                                
                 ,:ACCT-CD                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT07IO-NORMAL  TO TRUE                                      
              PERFORM SET-ACAT07IO-RET-FLDS                                     
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT07IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
              SET ACAT07IO-ERROR     TO TRUE                                    
              MOVE SQLCODE  TO ACAT07IO-SQLCODE                                 
              PERFORM 9999-DB2-ERROR.                                           
      *                                                                         
      *--------------------------------------------------------------*          
      *         CLOSE TRANSFER TABLE IN DESCENDING ORDER             *          
      *--------------------------------------------------------------*          
       CLOSE-TFRCSRD.                                                           
           EXEC SQL                                                             
              CLOSE TFRCSRD                                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT07IO-NORMAL TO TRUE                                       
           ELSE                                                                 
              SET ACAT07IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT07IO-SQLCODE                                 
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          SETUP ACAT07IO RETURN FIELDS                        *          
      *--------------------------------------------------------------*          
       SET-ACAT07IO-RET-FLDS.                                                   
           MOVE CLIENT-NBR         TO ACAT07IO-CLT-NBR.                         
           MOVE ACAT-CONTROL-NBR   TO ACAT07IO-ACAT-NBR.                        
           MOVE RCV-NBR            TO ACAT07IO-RCV-NBR.                         
           MOVE ACCT-RCV-NBR       TO ACAT07IO-RCV-ACCT.                        
           MOVE DLVR-NBR           TO ACAT07IO-DLVR-NBR.                        
           MOVE ACCT-DLVR-NBR      TO ACAT07IO-DLVR-ACCT.                       
           MOVE RCV-CUST-NM        TO ACAT07IO-CUST-NM.                         
           MOVE RCV-SS-PRIM-NBR    TO ACAT07IO-SSN1.                            
           MOVE RCV-SS-SCNDY-NBR   TO ACAT07IO-SSN2.                            
           MOVE RCV-ACCT-TYPE-CD   TO ACAT07IO-ACCT-TYPE.                       
           MOVE CMNT-TXT           TO ACAT07IO-CMNT.                            
           MOVE SYS-RJCT-RSN-CD    TO ACAT07IO-SYS-RJCT-CD.                     
           MOVE TRNFR-TYPE-RJCT-CD TO ACAT07IO-RJCT-CD.                         
           MOVE RR-CD              TO ACAT07IO-RR.                              
           MOVE BRANCH-CD          TO ACAT07IO-BRANCH.                          
           MOVE ACCT-RJCT-RSBM-IND TO ACAT07IO-RSBM-IND.                        
ET0001     MOVE TRNFR-TYPE-CD      TO ACAT07IO-TRNFR-TYPE.                      
           MOVE ACCT-CD            TO ACAT07IO-ACCT.                            
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *    READ ACTIVE TRANSFER AND GET REJECT-RESUBMIT-IND          *          
      *--------------------------------------------------------------*          
       GET-RESUBMIT-IND.                                                        
           EXEC SQL                                                             
              SELECT                                                            
                  ACCT_RJCT_RSBM_IND                                            
               INTO                                                             
                  :ACAT07IO-RSBM-IND                                            
               FROM                                                             
                  VTRNFR                                                        
               WHERE                                                            
                  CLIENT_NBR = :WS-PASSED-CLT                                   
                  AND  ACAT_CONTROL_NBR = :WS-PASSED-ACAT                       
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT07IO-NORMAL TO TRUE                                       
           ELSE                                                                 
           IF SQLCODE = 100                                                     
              SET ACAT07IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
              SET ACAT07IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT07IO-SQLCODE                                 
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
           MOVE 'ACAT07DB' TO CALLING-PROGRAM-ID.                               
           MOVE SQLCA      TO SQLCA-AREA.                                       
           EXEC CICS LINK PROGRAM('FPDB2LOG')                                   
                COMMAREA(WS-ERR-DATA)                                           
                LENGTH(LENGTH OF WS-ERR-DATA)                                   
                NOHANDLE                                                        
           END-EXEC.                                                            
       EJECT                                                                    
                                                                                
       HANG-CICS.                                                               
           GOBACK.                                                              
