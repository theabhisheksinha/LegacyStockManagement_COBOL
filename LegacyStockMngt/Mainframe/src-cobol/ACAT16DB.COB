000001* PDX    - ACAT16DB C0120330 01/27/99 14:51:04 TBEDTAK            00001000
000001* PDX    - ACAT16DB C0117777 12/09/98 11:16:55 TBEDTAK            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    ACAT16DB.                                                 
       AUTHOR.  E.TAKAESU.                                                      
      *REMARKS.                                                                 
      *****************************************************************         
      *    DB2 I/O FOR OUTGOING TRANSFERS REJECTED BY SYSTEM          *         
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
           03  WS-PASSED-TRNFR1                PIC X(03).                       
           03  WS-PASSED-TRNFR2                PIC X(03).                       
           03  WS-PASSED-RR                    PIC X(03).                       
       01  WS-ERR-DATA.                                                         
           03  WS-REQUEST-TYPE                 PIC X(01).                       
               88  WS-WRITE-ERROR-TO-LOG           VALUE 'Y'.                   
           03  CALLING-TRAN-ID                 PIC X(04).                       
           03  CALLING-PROGRAM-ID              PIC X(08).                       
           03  SQLCA-AREA                      PIC X(136).                      
      *                                                                         
       EJECT                                                                    
           EXEC SQL                                                             
              INCLUDE VINITRNF                                                  
           END-EXEC.                                                            
       EJECT                                                                    
           EXEC SQL                                                             
              INCLUDE SQLCA                                                     
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------*                
      *      DECALARE TRANSFER CURSOR TBL STATMENT             *                
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE  TFRCSR   CURSOR FOR                                      
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,DLVR_NBR                                                   
                    ,ACCT_DLVR_NBR                                              
                    ,ACAT_CONTROL_NBR                                           
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
                  FROM                                                          
                     VTRNFR                                                     
                  WHERE   CLIENT_NBR = :WS-PASSED-CLT                           
                     AND  RCV_NBR LIKE :WS-PASSED-BRKR                          
                     AND (TRNFR_TYPE_CD LIKE :WS-PASSED-TRNFR1  OR              
                          TRNFR_TYPE_CD LIKE :WS-PASSED-TRNFR2)                 
                     AND  NOT (ACCT_DLVR_NBR < :WS-PASSED-DLVR-ACCT)            
                     AND  RR_CD LIKE :WS-PASSED-RR                              
                     AND  DSTBN_SIDE_CD = 'D'                                   
                     AND  (TRNFR_TYPE_RJCT_CD BETWEEN '01' AND '09')            
                     AND  STTS_CD IN ('140', '600')                             
                  ORDER BY                                                      
                     CLIENT_NBR                                                 
                    ,DLVR_NBR                                                   
                    ,ACCT_DLVR_NBR                                              
                    ,RCV_NBR                                                    
                    ,ACCT_RCV_NBR                                               
                    ,ACAT_CONTROL_NBR                                           
           END-EXEC.                                                            
           EJECT                                                                
      *                                                                         
      *--------------------------------------------------------*                
      *  DECLARE INIT TFR CURSOR STATEMENT IN DESCENDING ORDER *                
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE  TFRCSRD  CURSOR FOR                                      
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,DLVR_NBR                                                   
                    ,ACCT_DLVR_NBR                                              
                    ,ACAT_CONTROL_NBR                                           
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
                  FROM                                                          
                     VTRNFR                                                     
                  WHERE   CLIENT_NBR = :WS-PASSED-CLT                           
                     AND  RCV_NBR LIKE :WS-PASSED-BRKR                          
                     AND (TRNFR_TYPE_CD LIKE :WS-PASSED-TRNFR1  OR              
                          TRNFR_TYPE_CD LIKE :WS-PASSED-TRNFR2)                 
                     AND  NOT (ACCT_DLVR_NBR < :WS-PASSED-DLVR-ACCT)            
                     AND  RR_CD LIKE :WS-PASSED-RR                              
                     AND  DSTBN_SIDE_CD = 'D'                                   
                     AND  (TRNFR_TYPE_RJCT_CD BETWEEN '01' AND '09')            
                     AND  STTS_CD IN ('140', '600')                             
                  ORDER BY                                                      
                     CLIENT_NBR       DESC                                      
                    ,DLVR_NBR         DESC                                      
                    ,ACCT_DLVR_NBR    DESC                                      
                    ,RCV_NBR          DESC                                      
                    ,ACCT_RCV_NBR     DESC                                      
                    ,ACAT_CONTROL_NBR DESC                                      
           END-EXEC.                                                            
           EJECT                                                                
      *                                                                         
       LINKAGE SECTION.                                                         
       01  DFHCOMMAREA.                                                         
       COPY ACAT16IO.                                                           
       EJECT                                                                    
      *                                                                         
       PROCEDURE DIVISION.                                                      
           MOVE ACAT16IO-PASS-FLDS                                              
             TO WS-PASSED-SRCH-FLDS.                                            
      *                                                                         
           EVALUATE TRUE                                                        
              WHEN ACAT16IO-O-TFRCSR                                            
                   PERFORM OPEN-TFRCSR                                          
              WHEN ACAT16IO-F-TFRCSR                                            
                   PERFORM FETCH-TFRCSR                                         
              WHEN ACAT16IO-C-TFRCSR                                            
                   PERFORM CLOSE-TFRCSR                                         
              WHEN ACAT16IO-O-TFRCSRD                                           
                   PERFORM OPEN-TFRCSR-DESCEND                                  
              WHEN ACAT16IO-F-TFRCSRD                                           
                   PERFORM FETCH-TFRCSR-DESCEND                                 
              WHEN ACAT16IO-C-TFRCSRD                                           
                   PERFORM CLOSE-TFRCSR-DESCEND                                 
           END-EVALUATE.                                                        
                                                                                
           EXEC CICS RETURN                                                     
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *           OPEN TRANSFER CURSOR STATMENT                      *          
      *--------------------------------------------------------------*          
       OPEN-TFRCSR.                                                             
           EXEC SQL                                                             
              OPEN TFRCSR                                                       
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT16IO-NORMAL TO TRUE                                       
           ELSE                                                                 
              SET ACAT16IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT16IO-SQLCODE                                 
              PERFORM 9999-DB2-ERROR.                                           
      *                                                                         
      *--------------------------------------------------------------*          
      *          FETCH TRANSFER CURSOR                               *          
      *--------------------------------------------------------------*          
       FETCH-TFRCSR.                                                            
           EXEC SQL                                                             
              FETCH                                                             
                  TFRCSR                                                        
              INTO                                                              
                  :CLIENT-NBR                                                   
                 ,:DLVR-NBR                                                     
                 ,:ACCT-DLVR-NBR                                                
                 ,:ACAT-CONTROL-NBR                                             
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
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT16IO-NORMAL  TO TRUE                                      
              PERFORM SET-ACAT16IO-RET-FLDS                                     
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT16IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
              SET ACAT16IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT16IO-SQLCODE                                 
              PERFORM 9999-DB2-ERROR.                                           
      *                                                                         
      *--------------------------------------------------------------*          
      *          CLOSE TRANSFER CURSOR                               *          
      *--------------------------------------------------------------*          
       CLOSE-TFRCSR.                                                            
           EXEC SQL                                                             
              CLOSE TFRCSR                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT16IO-NORMAL TO TRUE                                       
           ELSE                                                                 
              SET ACAT16IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT16IO-SQLCODE                                 
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *     OPEN TRANSFER CURSOR STATMENT IN DESCENDING ORDER        *          
      *--------------------------------------------------------------*          
       OPEN-TFRCSR-DESCEND.                                                     
           EXEC SQL                                                             
              OPEN TFRCSRD                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT16IO-NORMAL TO TRUE                                       
           ELSE                                                                 
              SET ACAT16IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT16IO-SQLCODE                                 
              PERFORM 9999-DB2-ERROR.                                           
      *                                                                         
      *--------------------------------------------------------------*          
      *    FETCH TRANSFER CURSOR STATMENT IN DESCENDING ORDER        *          
      *--------------------------------------------------------------*          
       FETCH-TFRCSR-DESCEND.                                                    
           EXEC SQL                                                             
              FETCH                                                             
                  TFRCSRD                                                       
              INTO                                                              
                  :CLIENT-NBR                                                   
                 ,:DLVR-NBR                                                     
                 ,:ACCT-DLVR-NBR                                                
                 ,:ACAT-CONTROL-NBR                                             
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
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT16IO-NORMAL  TO TRUE                                      
              PERFORM SET-ACAT16IO-RET-FLDS                                     
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT16IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
              SET ACAT16IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT16IO-SQLCODE                                 
              PERFORM 9999-DB2-ERROR.                                           
      *                                                                         
      *--------------------------------------------------------------*          
      *    CLOSE TRANSFER CURSOR STATMENT IN DESCENDING ORDER        *          
      *--------------------------------------------------------------*          
       CLOSE-TFRCSR-DESCEND.                                                    
           EXEC SQL                                                             
              CLOSE TFRCSRD                                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT16IO-NORMAL TO TRUE                                       
           ELSE                                                                 
              SET ACAT16IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT16IO-SQLCODE                                 
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          SETUP ACAT16IO RETURN FIELDS                        *          
      *--------------------------------------------------------------*          
       SET-ACAT16IO-RET-FLDS.                                                   
           MOVE CLIENT-NBR         TO ACAT16IO-CLT-NBR.                         
           MOVE DLVR-NBR           TO ACAT16IO-DLVR-NBR.                        
           MOVE ACCT-DLVR-NBR      TO ACAT16IO-DLVR-ACCT.                       
           MOVE ACAT-CONTROL-NBR   TO ACAT16IO-ACAT-NBR.                        
           MOVE TRNFR-TYPE-CD      TO ACAT16IO-TRNFR.                           
           MOVE RCV-NBR            TO ACAT16IO-RCV-NBR.                         
           MOVE ACCT-RCV-NBR       TO ACAT16IO-RCV-ACCT.                        
           MOVE RCV-CUST-NM        TO ACAT16IO-CUST-NM.                         
           MOVE RCV-SS-PRIM-NBR    TO ACAT16IO-SSN1.                            
           MOVE RCV-SS-SCNDY-NBR   TO ACAT16IO-SSN2.                            
           MOVE RCV-ACCT-TYPE-CD   TO ACAT16IO-ACCT-TYPE.                       
           MOVE CMNT-TXT           TO ACAT16IO-CMNT.                            
           MOVE TRNFR-TYPE-RJCT-CD TO ACAT16IO-RJCT-CD.                         
           MOVE RR-CD              TO ACAT16IO-RR.                              
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          WRITE DB2 ERROR LOG                                 *          
      *--------------------------------------------------------------*          
       9999-DB2-ERROR.                                                          
           MOVE SPACE      TO WS-ERR-DATA.                                      
           SET WS-WRITE-ERROR-TO-LOG TO TRUE.                                   
           MOVE EIBTRNID   TO CALLING-TRAN-ID.                                  
           MOVE 'ACAT16DB' TO CALLING-PROGRAM-ID.                               
           MOVE SQLCA      TO SQLCA-AREA.                                       
           EXEC CICS LINK PROGRAM('FPDB2LOG')                                   
                COMMAREA(WS-ERR-DATA)                                           
                LENGTH(LENGTH OF WS-ERR-DATA)                                   
                NOHANDLE                                                        
           END-EXEC.                                                            
       EJECT                                                                    
                                                                                
       HANG-CICS.                                                               
           GOBACK.                                                              
