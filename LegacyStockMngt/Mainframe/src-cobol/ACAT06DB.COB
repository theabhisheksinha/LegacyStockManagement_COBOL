000001* PDX    - ACAT06DB C0272581 11/04/08 13:34:56 TBLAMUR            00001000
000001* LRM001 - SSR 61164 DISPLAY REJECTED "PTF".                      00001000
000001* PDX    - ACAT06DB C0205792 07/06/04 14:16:51 TBEDTAK            00001000
000001* ET0001 - DISPLAY REJECTED "PTR".                                00001000
000001* PDX    - ACAT06DB C0127264 06/21/99 10:56:00 TBEDTAK            00001000
000001* PDX    - ACAT06DB C0119329 12/15/98 12:06:43 TBEDTAK            00001000
000001* PDX    - ACAT06DB C0117777 12/09/98 14:21:01 TBEDTAK            00001000
000001* PDX    - ACAT06DB C0109165 10/30/98 14:02:00 TBEDTAK            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    ACAT06DB.                                                 
       AUTHOR.  E.TAKAESU.                                                      
      *REMARKS.                                                                 
      *****************************************************************         
      *   DB2 I/O FOR INCOMMING TRANSFERS REJECTED BY CONTRA BROKER   *         
      *****************************************************************         
       ENVIRONMENT DIVISION.                                                    
       DATA DIVISION.                                                           
       WORKING-STORAGE SECTION.                                                 
       COPY PDXIDCOB.                                                           
      *                                                                         
       01  WS-WORK-AREA.                                                        
           03  WS-NAME.                                                         
               05  WS-NAME1                    PIC X(30).                       
               05  WS-NAME2                    PIC X(30).                       
           03  WS-COMMENT-TXT.                                                  
               05  WS-COMMENT-TXT1             PIC X(60).                       
               05  WS-COMMENT-TXT2             PIC X(60).                       
       01  WS-PASSED-SRCH-FLDS.                                                 
           03  WS-PASSED-CLT                   PIC X(04).                       
           03  WS-PASSED-BRKR                  PIC X(04).                       
           03  WS-PASSED-ACCT-RCV              PIC X(20).                       
           03  WS-PASSED-RR                    PIC X(03).                       
           03  WS-PASSED-ACAT                  PIC X(14).                       
ET0001     03  WS-PASSED-TRNFR1                PIC X(03).                       
ET0001     03  WS-PASSED-TRNFR2                PIC X(03).                       
LRM001     03  WS-PASSED-TRNFR3                PIC X(03).                       
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
      *  ACTIVE TRANSFER DECLARE CURSOR STATEMENT              *                
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE  TFRCSR  CURSOR FOR                                       
                  SELECT                                                        
                     CLIENT_NBR,                                                
                     ACAT_CONTROL_NBR,                                          
                     RCV_NBR,                                                   
                     DLVR_NBR,                                                  
                     ACCT_DLVR_NBR,                                             
                     ACCT_RCV_NBR,                                              
                     RCV_CUST_NM,                                               
                     RCV_SS_PRIM_NBR,                                           
                     RCV_SS_SCNDY_NBR,                                          
                     RCV_ACCT_TYPE_CD,                                          
                     CMNT_TXT,                                                  
                     TRNFR_TYPE_RJC1_CD,                                        
                     TRNFR_TYPE_RJCT_CD,                                        
                     RR_CD,                                                     
                     BRANCH_CD,                                                 
                     ACCT_RJCT_RSBM_IND,                                        
ET0001               TRNFR_TYPE_CD,                                             
                     ACCT_CD                                                    
                  FROM                                                          
                     VTRNFR                                                     
                  WHERE                                                         
                     CLIENT_NBR = :WS-PASSED-CLT                                
                     AND  DLVR_NBR LIKE :WS-PASSED-BRKR                         
                     AND  NOT (ACCT_RCV_NBR < :WS-PASSED-ACCT-RCV)              
                     AND  RR_CD LIKE :WS-PASSED-RR                              
                     AND  DSTBN_SIDE_CD = 'R'                                   
ET0001**             AND  TRNFR_TYPE_CD = 'FUL'                                 
ET0001               AND (TRNFR_TYPE_CD LIKE :WS-PASSED-TRNFR1  OR              
ET0001                    TRNFR_TYPE_CD LIKE :WS-PASSED-TRNFR2  OR              
LRM003                    TRNFR_TYPE_CD LIKE :WS-PASSED-TRNFR3)                 
                     AND  STTS_CD IN ('140', '600')                             
                     AND  (TRNFR_TYPE_RJCT_CD BETWEEN '01' AND '09')            
                  ORDER BY                                                      
                     CLIENT_NBR                                                 
                    ,ACCT_RCV_NBR                                               
                    ,DLVR_NBR                                                   
                    ,ACAT_CONTROL_NBR                                           
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------*                
      * ACTIVE TFR DECLARE CURSOR STATEMENT IN DESCENDING ORDR *                
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE  TFRCSRD  CURSOR FOR                                      
                  SELECT                                                        
                     CLIENT_NBR,                                                
                     ACAT_CONTROL_NBR,                                          
                     RCV_NBR,                                                   
                     DLVR_NBR,                                                  
                     ACCT_DLVR_NBR,                                             
                     ACCT_RCV_NBR,                                              
                     RCV_CUST_NM,                                               
                     RCV_SS_PRIM_NBR,                                           
                     RCV_SS_SCNDY_NBR,                                          
                     RCV_ACCT_TYPE_CD,                                          
                     CMNT_TXT,                                                  
                     TRNFR_TYPE_RJC1_CD,                                        
                     TRNFR_TYPE_RJCT_CD,                                        
                     RR_CD,                                                     
                     BRANCH_CD,                                                 
                     ACCT_RJCT_RSBM_IND,                                        
ET0001               TRNFR_TYPE_CD,                                             
                     ACCT_CD                                                    
                  FROM                                                          
                     VTRNFR                                                     
                  WHERE                                                         
                     CLIENT_NBR = :WS-PASSED-CLT                                
                     AND  DLVR_NBR LIKE :WS-PASSED-BRKR                         
                     AND  NOT (ACCT_RCV_NBR < :WS-PASSED-ACCT-RCV)              
                     AND  RR_CD LIKE :WS-PASSED-RR                              
                     AND  DSTBN_SIDE_CD = 'R'                                   
ET0001**             AND  TRNFR_TYPE_CD = 'FUL'                                 
ET0001               AND (TRNFR_TYPE_CD LIKE :WS-PASSED-TRNFR1  OR              
ET0001                    TRNFR_TYPE_CD LIKE :WS-PASSED-TRNFR2  OR              
LRM001                    TRNFR_TYPE_CD LIKE :WS-PASSED-TRNFR3)                 
                     AND  STTS_CD IN ('140', '600')                             
                     AND  (TRNFR_TYPE_RJCT_CD BETWEEN '01' AND '09')            
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
       COPY ACAT06IO.                                                           
       EJECT                                                                    
      *                                                                         
       PROCEDURE DIVISION.                                                      
           IF ACAT06IO-IO-SW = SPACE                                            
              SET ACAT06IO-ERROR     TO TRUE                                    
              MOVE +999  TO ACAT06IO-SQLCODE                                    
              EXEC CICS RETURN                                                  
              END-EXEC.                                                         
      *                                                                         
           MOVE ACAT06IO-PASS-FLDS                                              
             TO WS-PASSED-SRCH-FLDS.                                            
      *                                                                         
           EVALUATE TRUE                                                        
              WHEN ACAT06IO-O-TFRCSR                                            
                 PERFORM OPEN-TFRCSR                                            
              WHEN ACAT06IO-F-TFRCSR                                            
                 PERFORM FETCH-TFRCSR                                           
              WHEN ACAT06IO-C-TFRCSR                                            
                 PERFORM CLOSE-TFRCSR                                           
              WHEN ACAT06IO-O-TFRCSRD                                           
                 PERFORM OPEN-TFRCSRD                                           
              WHEN ACAT06IO-F-TFRCSRD                                           
                 PERFORM FETCH-TFRCSRD                                          
              WHEN ACAT06IO-C-TFRCSRD                                           
                 PERFORM CLOSE-TFRCSRD                                          
              WHEN ACAT06IO-GET-TRNFR                                           
                 PERFORM GET-RESUBMIT-IND                                       
           END-EVALUATE.                                                        
                                                                                
           EXEC CICS RETURN                                                     
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *      OPEN TRANSFER CUROSR                                    *          
      *--------------------------------------------------------------*          
       OPEN-TFRCSR.                                                             
           EXEC SQL                                                             
              OPEN TFRCSR                                                       
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT06IO-NORMAL TO TRUE                                       
           ELSE                                                                 
              SET ACAT06IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT06IO-SQLCODE                                 
              PERFORM 9999-DB2-ERROR.                                           
      *                                                                         
      *--------------------------------------------------------------*          
      *      FETCH TRANSFER CUROSR                                   *          
      *--------------------------------------------------------------*          
       FETCH-TFRCSR.                                                            
           EXEC SQL                                                             
              FETCH                                                             
                  TFRCSR                                                        
              INTO                                                              
                  :CLIENT-NBR,                                                  
                  :ACAT-CONTROL-NBR,                                            
                  :RCV-NBR,                                                     
                  :DLVR-NBR,                                                    
                  :ACCT-DLVR-NBR,                                               
                  :ACCT-RCV-NBR,                                                
                  :RCV-CUST-NM,                                                 
                  :RCV-SS-PRIM-NBR,                                             
                  :RCV-SS-SCNDY-NBR,                                            
                  :RCV-ACCT-TYPE-CD,                                            
                  :CMNT-TXT,                                                    
                  :TRNFR-TYPE-RJC1-CD,                                          
                  :TRNFR-TYPE-RJCT-CD,                                          
                  :RR-CD,                                                       
                  :BRANCH-CD,                                                   
                  :ACCT-RJCT-RSBM-IND,                                          
ET0001            :TRNFR-TYPE-CD,                                               
                  :ACCT-CD                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT06IO-NORMAL  TO TRUE                                      
              PERFORM SET-ACAT06IO-RET-FLDS                                     
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT06IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
              SET ACAT06IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT06IO-SQLCODE                                 
              PERFORM 9999-DB2-ERROR.                                           
      *                                                                         
      *--------------------------------------------------------------*          
      *      CLOSE TRANSFER CUROSR                                   *          
      *--------------------------------------------------------------*          
       CLOSE-TFRCSR.                                                            
           EXEC SQL                                                             
              CLOSE TFRCSR                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT06IO-NORMAL TO TRUE                                       
           ELSE                                                                 
              SET ACAT06IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT06IO-SQLCODE                                 
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *      OPEN TRANSFER CUROSR IN DESCENDING ORDER                *          
      *--------------------------------------------------------------*          
       OPEN-TFRCSRD.                                                            
           EXEC SQL                                                             
              OPEN TFRCSRD                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT06IO-NORMAL TO TRUE                                       
           ELSE                                                                 
              SET ACAT06IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT06IO-SQLCODE                                 
              PERFORM 9999-DB2-ERROR.                                           
      *                                                                         
      *--------------------------------------------------------------*          
      *      FETCH TRANSFER CUROSR IN DESCENDING ORDER               *          
      *--------------------------------------------------------------*          
       FETCH-TFRCSRD.                                                           
           EXEC SQL                                                             
              FETCH                                                             
                  TFRCSRD                                                       
              INTO                                                              
                  :CLIENT-NBR,                                                  
                  :ACAT-CONTROL-NBR,                                            
                  :RCV-NBR,                                                     
                  :DLVR-NBR,                                                    
                  :ACCT-DLVR-NBR,                                               
                  :ACCT-RCV-NBR,                                                
                  :RCV-CUST-NM,                                                 
                  :RCV-SS-PRIM-NBR,                                             
                  :RCV-SS-SCNDY-NBR,                                            
                  :RCV-ACCT-TYPE-CD,                                            
                  :CMNT-TXT,                                                    
                  :TRNFR-TYPE-RJC1-CD,                                          
                  :TRNFR-TYPE-RJCT-CD,                                          
                  :RR-CD,                                                       
                  :BRANCH-CD,                                                   
                  :ACCT-RJCT-RSBM-IND,                                          
ET0001            :TRNFR-TYPE-CD,                                               
                  :ACCT-CD                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT06IO-NORMAL  TO TRUE                                      
              PERFORM SET-ACAT06IO-RET-FLDS                                     
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT06IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
              SET ACAT06IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT06IO-SQLCODE                                 
              PERFORM 9999-DB2-ERROR.                                           
      *                                                                         
      *--------------------------------------------------------------*          
      *      CLOSE TRANSFER CUROSR IN DESCENDING ORDER               *          
      *--------------------------------------------------------------*          
       CLOSE-TFRCSRD.                                                           
           EXEC SQL                                                             
              CLOSE TFRCSRD                                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT06IO-NORMAL TO TRUE                                       
           ELSE                                                                 
              SET ACAT06IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT06IO-SQLCODE                                 
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          SETUP ACAT06IO RETURN FIELDS                        *          
      *--------------------------------------------------------------*          
       SET-ACAT06IO-RET-FLDS.                                                   
           MOVE CLIENT-NBR         TO ACAT06IO-CLT-NBR.                         
           MOVE ACAT-CONTROL-NBR   TO ACAT06IO-ACAT-NBR.                        
           MOVE RCV-NBR            TO ACAT06IO-RCV-NBR.                         
           MOVE DLVR-NBR           TO ACAT06IO-DLVR-NBR.                        
           MOVE ACCT-DLVR-NBR      TO ACAT06IO-DLVR-ACCT.                       
           MOVE ACCT-RCV-NBR       TO ACAT06IO-RCV-ACCT.                        
           MOVE RCV-CUST-NM        TO ACAT06IO-CUST-NM.                         
           MOVE RCV-SS-PRIM-NBR    TO ACAT06IO-SSN1.                            
           MOVE RCV-SS-SCNDY-NBR   TO ACAT06IO-SSN2.                            
           MOVE RCV-ACCT-TYPE-CD   TO ACAT06IO-ACCT-TYPE.                       
           MOVE CMNT-TXT           TO ACAT06IO-CMNT.                            
           IF TRNFR-TYPE-RJC1-CD > '00'                                         
              MOVE TRNFR-TYPE-RJC1-CD TO ACAT06IO-RJCT-CD                       
           ELSE                                                                 
              MOVE TRNFR-TYPE-RJCT-CD TO ACAT06IO-RJCT-CD.                      
           MOVE RR-CD              TO ACAT06IO-RR.                              
           MOVE BRANCH-CD          TO ACAT06IO-BRANCH.                          
           MOVE ACCT-RJCT-RSBM-IND TO ACAT06IO-RSBM-IND.                        
           MOVE ACCT-CD            TO ACAT06IO-ACCT.                            
ET0001     MOVE TRNFR-TYPE-CD      TO ACAT06IO-TRNFR-TYPE.                      
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
                  :ACAT06IO-RSBM-IND                                            
               FROM                                                             
                  VTRNFR                                                        
               WHERE                                                            
                  CLIENT_NBR = :WS-PASSED-CLT                                   
                  AND  ACAT_CONTROL_NBR = :WS-PASSED-ACAT                       
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT06IO-NORMAL TO TRUE                                       
           ELSE                                                                 
           IF SQLCODE = 100                                                     
              SET ACAT06IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
              SET ACAT06IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT06IO-SQLCODE                                 
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
           MOVE 'ACAT06JC' TO CALLING-PROGRAM-ID.                               
           MOVE SQLCA      TO SQLCA-AREA.                                       
           EXEC CICS LINK PROGRAM('FPDB2LOG')                                   
                COMMAREA(WS-ERR-DATA)                                           
                LENGTH(LENGTH OF WS-ERR-DATA)                                   
                NOHANDLE                                                        
           END-EXEC.                                                            
       EJECT                                                                    
                                                                                
       HANG-CICS.                                                               
           GOBACK.                                                              
