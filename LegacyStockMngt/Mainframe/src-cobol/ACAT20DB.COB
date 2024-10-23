000001* PDX    - ACAT20DB C0121426 02/07/99 16:38:54 TBEDTAK            00001000
000001* PDX    - ACAT20DB C0117817 12/03/98 15:02:48 TBEDTAK            00001000
000001* PDX    - ACAT20DB C0114558 10/23/98 10:27:59 TBEDTAK            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    ACAT20DB.                                                 
       AUTHOR.  E.TAKAESU.                                                      
      *REMARKS.                                                                 
      *****************************************************************         
      *      DB2 I/O PROGRAM FOR AN OPEN ORDER INQUIRY PROGRAM        *         
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
           03  WS-PASSED-CLT                   PIC X(04).                       
           03  WS-PASSED-BR                    PIC X(03).                       
           03  WS-PASSED-AC                    PIC X(05).                       
           03  WS-PASSED-RR                    PIC X(03).                       
           03  WS-PASSED-TFR                   PIC X(03).                       
           03  WS-PASSED-RD                    PIC X(01).                       
           03  WS-PASSED-CBRKR                 PIC X(04).                       
           03  WS-PASSED-STAT-FR               PIC X(03).                       
           03  WS-PASSED-STAT-TO               PIC X(03).                       
           03  WS-PASSED-TERMID                PIC X(04).                       
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *           ACTIVE TRANSFER TABLE                                *        
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
      *         ACTIVE TRANSFER TABLE DECLARE CURSOR STATEMENT         *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  TFRCSR  CURSOR FOR                                       
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,SBMTG_PRTCP_NBR                                            
                    ,DLVR_NBR                                                   
                    ,ACCT_DLVR_NBR                                              
                    ,RCV_NBR                                                    
                    ,ACCT_RCV_NBR                                               
                    ,TRNFR_TYPE_CD                                              
                    ,TRANS_TYPE_CD                                              
                    ,RCV_CUST_NM                                                
                    ,RCV_SS_PRIM_NBR                                            
                    ,RCV_SS_SCNDY_NBR                                           
                    ,RCV_ACCT_TYPE_CD                                           
                    ,RCV_OCC_BRKR_NBR                                           
                    ,RCV_CRSPN_NBR                                              
                    ,ACAT_CNTL_ASTD_NBR                                         
                    ,PRCS_DT                                                    
                    ,STTS_CD                                                    
                    ,STTLM_TM_CD                                                
                    ,DSTBN_SIDE_CD                                              
                    ,RR_CD                                                      
                    ,BRANCH_CD                                                  
                    ,PRTCP_CONTRA_CD                                            
                    ,ACCT_ACTIVITY_IND                                          
                    ,ACCT_ORDERS_IND                                            
                    ,CYCLE_CD                                                   
                    ,DAYS_STTS_QTY                                              
                    ,STTLM_DT                                                   
                    ,ACCT_CD                                                    
                    ,STTLM_ASCTD_DT                                             
                    ,RCRD_STTS_CD                                               
                    ,NSCC_PEND_CD                                               
                    ,NSCC_ACK_IND                                               
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                  FROM                                                          
                     VTRNFR                                                     
                  WHERE                                                         
                     CLIENT_NBR = :WS-PASSED-CLT                                
                     AND NOT (BRANCH_CD < :WS-PASSED-BR)                        
                     AND NOT (ACCT_CD < :WS-PASSED-AC)                          
                     AND RR_CD LIKE :WS-PASSED-RR                               
                     AND TRNFR_TYPE_CD LIKE :WS-PASSED-TFR                      
                     AND RCV_NBR LIKE :WS-PASSED-CBRKR                          
                     AND (STTS_CD   BETWEEN                                     
                          :WS-PASSED-STAT-FR AND :WS-PASSED-STAT-TO)            
                     AND NOT (STTS_CD = '140')                                  
                     AND DSTBN_SIDE_CD = 'D'                                    
                     AND ACCT_ORDERS_IND = 'Y'                                  
                  ORDER BY                                                      
                     CLIENT_NBR                                                 
                    ,BRANCH_CD                                                  
                    ,ACCT_CD                                                    
                    ,ACAT_CONTROL_NBR                                           
           END-EXEC.                                                            
           EJECT                                                                
      *                                                                         
      *----------------------------------------------------------------*        
      *  TRANSFER TABLE DECLARE CURSOR STATEMENT IN DESCENDING ORDER   *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  TFRCSRD CURSOR FOR                                       
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,SBMTG_PRTCP_NBR                                            
                    ,DLVR_NBR                                                   
                    ,ACCT_DLVR_NBR                                              
                    ,RCV_NBR                                                    
                    ,ACCT_RCV_NBR                                               
                    ,TRNFR_TYPE_CD                                              
                    ,TRANS_TYPE_CD                                              
                    ,RCV_CUST_NM                                                
                    ,RCV_SS_PRIM_NBR                                            
                    ,RCV_SS_SCNDY_NBR                                           
                    ,RCV_ACCT_TYPE_CD                                           
                    ,RCV_OCC_BRKR_NBR                                           
                    ,RCV_CRSPN_NBR                                              
                    ,ACAT_CNTL_ASTD_NBR                                         
                    ,PRCS_DT                                                    
                    ,STTS_CD                                                    
                    ,STTLM_TM_CD                                                
                    ,DSTBN_SIDE_CD                                              
                    ,RR_CD                                                      
                    ,BRANCH_CD                                                  
                    ,PRTCP_CONTRA_CD                                            
                    ,ACCT_ACTIVITY_IND                                          
                    ,ACCT_ORDERS_IND                                            
                    ,CYCLE_CD                                                   
                    ,DAYS_STTS_QTY                                              
                    ,STTLM_DT                                                   
                    ,ACCT_CD                                                    
                    ,STTLM_ASCTD_DT                                             
                    ,RCRD_STTS_CD                                               
                    ,NSCC_PEND_CD                                               
                    ,NSCC_ACK_IND                                               
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                  FROM                                                          
                     VTRNFR                                                     
                  WHERE                                                         
                     CLIENT_NBR = :WS-PASSED-CLT                                
                     AND NOT (BRANCH_CD < :WS-PASSED-BR)                        
                     AND NOT (ACCT_CD < :WS-PASSED-AC)                          
                     AND RR_CD LIKE :WS-PASSED-RR                               
                     AND TRNFR_TYPE_CD LIKE :WS-PASSED-TFR                      
                     AND RCV_NBR LIKE :WS-PASSED-CBRKR                          
                     AND (STTS_CD   BETWEEN                                     
                          :WS-PASSED-STAT-FR AND :WS-PASSED-STAT-TO)            
                     AND NOT (STTS_CD = '140')                                  
                     AND DSTBN_SIDE_CD = 'D'                                    
                     AND ACCT_ORDERS_IND = 'Y'                                  
                  ORDER BY                                                      
                     CLIENT_NBR       DESC                                      
                    ,BRANCH_CD        DESC                                      
                    ,ACCT_CD          DESC                                      
                    ,ACAT_CONTROL_NBR DESC                                      
           END-EXEC.                                                            
           EJECT                                                                
       LINKAGE SECTION.                                                         
       01  DFHCOMMAREA.                                                         
       COPY ACAT20IO.                                                           
       EJECT                                                                    
      *                                                                         
       PROCEDURE DIVISION.                                                      
           MOVE ACAT20-PASS-FLDS TO WS-PASSED-DATA-AREA.                        
           EXEC SQL                                                             
              SET :WS-TIMESTAMP = CURRENT TIMESTAMP                             
           END-EXEC.                                                            
      *                                                                         
           EVALUATE TRUE                                                        
              WHEN ACAT20-OPN-TFRCSR                                            
                   PERFORM OPEN-TFR-CURSOR                                      
              WHEN ACAT20-FET-TFRCSR                                            
                   PERFORM FETCH-TFR-CURSOR                                     
              WHEN ACAT20-CLO-TFRCSR                                            
                   PERFORM CLOSE-TFR-CURSOR                                     
              WHEN ACAT20-OPN-TFRCSR-D                                          
                   PERFORM OPEN-TFR-CURSOR-D                                    
              WHEN ACAT20-FET-TFRCSR-D                                          
                   PERFORM FETCH-TFR-CURSOR-D                                   
              WHEN ACAT20-CLO-TFRCSR-D                                          
                   PERFORM CLOSE-TFR-CURSOR-D                                   
           END-EVALUATE.                                                        
                                                                                
           EXEC CICS RETURN                                                     
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          OPEN ACTIVE TRANSFER CURSOR TABLE                   *          
      *--------------------------------------------------------------*          
       OPEN-TFR-CURSOR.                                                         
           EXEC SQL                                                             
              OPEN TFRCSR                                                       
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT20-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT20-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT20-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *         FETCH ACTIVE TRANSFER CURSOR TABLE                   *          
      *--------------------------------------------------------------*          
       FETCH-TFR-CURSOR.                                                        
           EXEC SQL                                                             
              FETCH                                                             
                  TFRCSR                                                        
              INTO                                                              
                 :CLIENT-NBR                                                    
                ,:ACAT-CONTROL-NBR                                              
                ,:SBMTG-PRTCP-NBR                                               
                ,:DLVR-NBR                                                      
                ,:ACCT-DLVR-NBR                                                 
                ,:RCV-NBR                                                       
                ,:ACCT-RCV-NBR                                                  
                ,:TRNFR-TYPE-CD                                                 
                ,:TRANS-TYPE-CD                                                 
                ,:RCV-CUST-NM                                                   
                ,:RCV-SS-PRIM-NBR                                               
                ,:RCV-SS-SCNDY-NBR                                              
                ,:RCV-ACCT-TYPE-CD                                              
                ,:RCV-OCC-BRKR-NBR                                              
                ,:RCV-CRSPN-NBR                                                 
                ,:ACAT-CNTL-ASTD-NBR                                            
                ,:PRCS-DT                                                       
                ,:STTS-CD                                                       
                ,:STTLM-TM-CD                                                   
                ,:DSTBN-SIDE-CD                                                 
                ,:RR-CD                                                         
                ,:BRANCH-CD                                                     
                ,:PRTCP-CONTRA-CD                                               
                ,:ACCT-ACTIVITY-IND                                             
                ,:ACCT-ORDERS-IND                                               
                ,:CYCLE-CD                                                      
                ,:DAYS-STTS-QTY                                                 
                ,:STTLM-DT                                                      
                ,:ACCT-CD                                                       
                ,:STTLM-ASCTD-DT                                                
                ,:RCRD-STTS-CD                                                  
                ,:NSCC-PEND-CD                                                  
                ,:NSCC-ACK-IND                                                  
                ,:CRT-TMSTP                                                     
                ,:UPDT-TMSTP                                                    
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT20-NORMAL  TO TRUE                                        
              PERFORM SETUP-TRANSFER-COMMAREA                                   
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT20-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT20-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT20-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *         SETUP COMMAREA TRANSFER RETURN DATA                  *          
      *--------------------------------------------------------------*          
       SETUP-TRANSFER-COMMAREA.                                                 
           MOVE CLIENT-NBR        TO ACAT20-TFR-CLT.                            
           MOVE ACAT-CONTROL-NBR  TO ACAT20-TFR-ACAT.                           
           MOVE DLVR-NBR          TO ACAT20-TFR-DLVR-NBR.                       
           MOVE ACCT-DLVR-NBR     TO ACAT20-TFR-DLVR-ACCT.                      
           MOVE RCV-NBR           TO ACAT20-TFR-RCV-NBR.                        
           MOVE ACCT-RCV-NBR      TO ACAT20-TFR-RCV-ACCT.                       
           MOVE TRNFR-TYPE-CD     TO ACAT20-TFR-TFR-TYPE.                       
           MOVE TRANS-TYPE-CD     TO ACAT20-TFR-TRANS-TYPE.                     
           MOVE RCV-CUST-NM       TO ACAT20-TFR-NAME.                           
           MOVE RCV-ACCT-TYPE-CD  TO ACAT20-TFR-ACCT-TYPE.                      
           MOVE STTS-CD           TO ACAT20-TFR-STTS.                           
           MOVE DSTBN-SIDE-CD     TO ACAT20-TFR-DSTBN.                          
           MOVE RR-CD             TO ACAT20-TFR-RR.                             
           MOVE BRANCH-CD         TO ACAT20-TFR-BRANCH.                         
           MOVE DAYS-STTS-QTY     TO ACAT20-TFR-DAYS-STTS.                      
           MOVE STTLM-DT          TO ACAT20-TFR-STTLM-DT.                       
           MOVE ACCT-CD           TO ACAT20-TFR-ACCOUNT.                        
           MOVE STTLM-ASCTD-DT    TO ACAT20-TFR-STTL-ASCTD.                     
           MOVE CRT-TMSTP         TO ACAT20-TFR-TMSTP.                          
      *                                                                         
      *--------------------------------------------------------------*          
      *         CLOSE ACTIVE TRANSFER CURSOR TABLE                   *          
      *--------------------------------------------------------------*          
       CLOSE-TFR-CURSOR.                                                        
           EXEC SQL                                                             
              CLOSE TFRCSR                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT20-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT20-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT20-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *      OPEN ACTIVE TRANSFER CURSOR TABLE IN DESCENDING ORDER   *          
      *--------------------------------------------------------------*          
       OPEN-TFR-CURSOR-D.                                                       
           EXEC SQL                                                             
              OPEN TFRCSRD                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT20-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT20-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT20-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *     FETCH ACTIVE TRANSFER CURSOR TABLE IN DESCENDING ORDER   *          
      *--------------------------------------------------------------*          
       FETCH-TFR-CURSOR-D.                                                      
           EXEC SQL                                                             
              FETCH                                                             
                  TFRCSRD                                                       
              INTO                                                              
                 :CLIENT-NBR                                                    
                ,:ACAT-CONTROL-NBR                                              
                ,:SBMTG-PRTCP-NBR                                               
                ,:DLVR-NBR                                                      
                ,:ACCT-DLVR-NBR                                                 
                ,:RCV-NBR                                                       
                ,:ACCT-RCV-NBR                                                  
                ,:TRNFR-TYPE-CD                                                 
                ,:TRANS-TYPE-CD                                                 
                ,:RCV-CUST-NM                                                   
                ,:RCV-SS-PRIM-NBR                                               
                ,:RCV-SS-SCNDY-NBR                                              
                ,:RCV-ACCT-TYPE-CD                                              
                ,:RCV-OCC-BRKR-NBR                                              
                ,:RCV-CRSPN-NBR                                                 
                ,:ACAT-CNTL-ASTD-NBR                                            
                ,:PRCS-DT                                                       
                ,:STTS-CD                                                       
                ,:STTLM-TM-CD                                                   
                ,:DSTBN-SIDE-CD                                                 
                ,:RR-CD                                                         
                ,:BRANCH-CD                                                     
                ,:PRTCP-CONTRA-CD                                               
                ,:ACCT-ACTIVITY-IND                                             
                ,:ACCT-ORDERS-IND                                               
                ,:CYCLE-CD                                                      
                ,:DAYS-STTS-QTY                                                 
                ,:STTLM-DT                                                      
                ,:ACCT-CD                                                       
                ,:STTLM-ASCTD-DT                                                
                ,:RCRD-STTS-CD                                                  
                ,:NSCC-PEND-CD                                                  
                ,:NSCC-ACK-IND                                                  
                ,:CRT-TMSTP                                                     
                ,:UPDT-TMSTP                                                    
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT20-NORMAL  TO TRUE                                        
              PERFORM SETUP-TRANSFER-COMMAREA                                   
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT20-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT20-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT20-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *     CLOSE ACTIVE TRANSFER CURSOR TABLE IN DESCENDING ORDER   *          
      *--------------------------------------------------------------*          
       CLOSE-TFR-CURSOR-D.                                                      
           EXEC SQL                                                             
              CLOSE TFRCSRD                                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT20-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT20-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT20-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          ROLLBAKCK                                           *          
      *--------------------------------------------------------------*          
       9000-ROLLBACK.                                                           
           EXEC SQL                                                             
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
           MOVE 'ACAT20DB' TO CALLING-PROGRAM-ID.                               
           MOVE SQLCA      TO SQLCA-AREA.                                       
           EXEC CICS LINK PROGRAM('FPDB2LOG')                                   
                COMMAREA(WS-ERR-DATA)                                           
                LENGTH(LENGTH OF WS-ERR-DATA)                                   
                NOHANDLE                                                        
           END-EXEC.                                                            
       EJECT                                                                    
                                                                                
       HANG-CICS.                                                               
           GOBACK.                                                              
