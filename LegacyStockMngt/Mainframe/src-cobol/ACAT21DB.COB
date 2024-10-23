000001* PDX    - ACAT21DB C0272581 11/03/08 16:30:14 TBLAMUR            00001000
000001* LRM004 - SSR 61164 DISPLAY PTF (NEW TRANSFER TYPE).                     
000001* PDX    - ACAT21DB C0225457 10/05/05 14:16:00 TBEDTAK            00001000
      * ET0003 - SSR 41811 MIP REDUCTION                                00001000
000001* PDX    - ACAT21DB C0218577 03/16/05 14:40:16 TBEDTAK            00001000
000001* PDX    - ACAT21DB C0215192 02/02/05 16:16:15 TBEDTAK            00001000
      * ET0002 - DISPLAY ALL STATUSES FOR NON-STANDARD TRANSFER         00001000
      * ET0001 - FIX BUG - ERROR IN BRANCH & ACCT SELECTION CRITERIA IN 00001000
      *          DB2 WHERE CLAUSE.                                      00001000
000001* PDX    - ACAT21DB C0117777 12/01/98 17:03:22 TBEDTAK            00001000
000001* PDX    - ACAT21DB C0109165 10/20/98 09:51:26 TBEDTAK            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    ACAT21DB.                                                 
       AUTHOR.  E.TAKAESU.                                                      
      *REMARKS.                                                                 
      *****************************************************************         
      *       DB2 I/O PROGRAM FOR A PENDIG TRANSFER INQUIRY PROGRAM   *         
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
           03  WS-PASSED-CBRKR-DEL             PIC X(04).                       
           03  WS-PASSED-CBRKR-REC             PIC X(04).                       
           03  WS-PASSED-STAT-FR               PIC X(03).                       
           03  WS-PASSED-STAT-TO               PIC X(03).                       
           03  WS-PASSED-SD-FR                 PIC X(10).                       
           03  WS-PASSED-SD-TO                 PIC X(10).                       
           03  WS-PASSED-TERMID                PIC X(04).                       
ET0003     03  WS-PASSED-ACAT-CNTRL            PIC X(14).                       
ET0003     03  WS-PASSED-TO-BR                 PIC X(03).                       
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
      *            TRANSFER TABLE DECLARE CURSOR STATEMENT             *        
ET0002*                                                                *        
ET0002*  (1) FOR FULL TRANSFER                                         *        
ET0002*      STATUS FROM '100' THRU '310' EXCEPT '140' ARE DISPLAYED   *        
ET0002*  (2) FOR NON-STANDARD TRANSFER                                 *        
ET0002*      ALL STATUSES ARE DISPLAYED                                *        
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
ET0001                (CLIENT_NBR = :WS-PASSED-CLT                              
ET0003**               AND ((BRANCH_CD = :WS-PASSED-BR  AND                     
ET0003**                     ACCT_CD  >= :WS-PASSED-AC)                         
ET0003**                              OR                                        
ET0003**                    (BRANCH_CD > :WS-PASSED-BR  AND                     
ET0003**                     ACCT_CD   > ' '))                                  
ET0003                 AND (BRANCH_CD >= :WS-PASSED-BR     AND                  
ET0003                      BRANCH_CD <  :WS-PASSED-TO-BR  AND                  
ET0003                      ACCT_CD   >= :WS-PASSED-AC)                         
                       AND RR_CD LIKE :WS-PASSED-RR                             
ET0002                 AND TRNFR_TYPE_CD LIKE :WS-PASSED-TFR                    
ET0002                 AND TRNFR_TYPE_CD = 'FUL'                                
                       AND DSTBN_SIDE_CD LIKE :WS-PASSED-RD                     
                       AND DLVR_NBR LIKE :WS-PASSED-CBRKR-DEL                   
                       AND RCV_NBR LIKE :WS-PASSED-CBRKR-REC                    
                       AND (STTS_CD BETWEEN                                     
                           :WS-PASSED-STAT-FR AND :WS-PASSED-STAT-TO)           
ET0002                 AND (STTS_CD IN                                          
ET0002                      ('100', '110', '120', '130', '200', '210',          
ET0002                       '220', '230', '240', '300', '310'))                
                       AND (STTLM_DT   BETWEEN                                  
                            :WS-PASSED-SD-FR AND :WS-PASSED-SD-TO))             
ET0002             OR                                                           
ET0002                (CLIENT_NBR = :WS-PASSED-CLT                              
ET0003**               AND ((BRANCH_CD = :WS-PASSED-BR  AND                     
ET0003**                     ACCT_CD  >= :WS-PASSED-AC)                         
ET0003**                              OR                                        
ET0003**                    (BRANCH_CD > :WS-PASSED-BR  AND                     
ET0003**                     ACCT_CD   > ' '))                                  
ET0003                 AND (BRANCH_CD >= :WS-PASSED-BR     AND                  
ET0003                      BRANCH_CD <  :WS-PASSED-TO-BR  AND                  
ET0003                      ACCT_CD   >= :WS-PASSED-AC)                         
ET0002                 AND RR_CD LIKE :WS-PASSED-RR                             
ET0002                 AND (TRNFR_TYPE_CD LIKE :WS-PASSED-TFR)                  
ET0002                 AND (TRNFR_TYPE_CD IN ('PTR', 'PTD', 'RCR',              
LRM004                          'PTF', 'MFC', 'RCL', 'FRV', '  '))              
ET0002                 AND DSTBN_SIDE_CD LIKE :WS-PASSED-RD                     
ET0002                 AND DLVR_NBR LIKE :WS-PASSED-CBRKR-DEL                   
ET0002                 AND RCV_NBR LIKE :WS-PASSED-CBRKR-REC                    
ET0002                 AND (STTS_CD BETWEEN                                     
ET0002                     :WS-PASSED-STAT-FR AND :WS-PASSED-STAT-TO)           
ET0002                 AND (STTLM_DT   BETWEEN                                  
ET0002                      :WS-PASSED-SD-FR AND :WS-PASSED-SD-TO))             
                  ORDER BY                                                      
                     CLIENT_NBR                                                 
                    ,BRANCH_CD                                                  
                    ,ACCT_CD                                                    
                    ,ACAT_CONTROL_NBR                                           
                  FOR READ ONLY WITH UR                                         
           END-EXEC.                                                            
           EJECT                                                                
       LINKAGE SECTION.                                                         
       01  DFHCOMMAREA.                                                         
       COPY ACAT21IO.                                                           
       EJECT                                                                    
      *                                                                         
       PROCEDURE DIVISION.                                                      
           MOVE ACAT21-PASS-FLDS TO WS-PASSED-DATA-AREA.                        
ET0002**   EXEC SQL                                                             
ET0002**      SET :WS-TIMESTAMP = CURRENT TIMESTAMP                             
ET0002**   END-EXEC.                                                            
      *                                                                         
           EVALUATE TRUE                                                        
              WHEN ACAT21-OPN-TFRCSR                                            
                   PERFORM OPEN-TFR-CURSOR                                      
              WHEN ACAT21-FET-TFRCSR                                            
                   PERFORM FETCH-TFR-CURSOR                                     
              WHEN ACAT21-CLO-TFRCSR                                            
                   PERFORM CLOSE-TFR-CURSOR                                     
ET0003        WHEN ACAT21-GET-TRNFR                                             
ET0003             PERFORM GET-TRANSFER                                         
           END-EVALUATE.                                                        
                                                                                
           EXEC CICS RETURN                                                     
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          OPEN ACTIVE TRANSFER CURSOR TABLE                   *          
      *--------------------------------------------------------------*          
       OPEN-TFR-CURSOR.                                                         
ET0003     IF WS-PASSED-TO-BR < '200'                                           
ET0003        MOVE '200' TO WS-PASSED-TO-BR                                     
ET0003     ELSE                                                                 
ET0003     IF WS-PASSED-TO-BR < '400'                                           
ET0003        MOVE '400' TO WS-PASSED-TO-BR                                     
ET0003     ELSE                                                                 
ET0003     IF WS-PASSED-TO-BR < '600'                                           
ET0003        MOVE '600' TO WS-PASSED-TO-BR                                     
ET0003     ELSE                                                                 
ET0003     IF WS-PASSED-TO-BR < '800'                                           
ET0003        MOVE '800' TO WS-PASSED-TO-BR                                     
ET0003     ELSE                                                                 
ET0003        MOVE HIGH-VALUES TO WS-PASSED-TO-BR                               
ET0003     END-IF.                                                              
ET0003     MOVE WS-PASSED-TO-BR TO ACAT21-PASS-TO-BR.                           
ET0003                                                                          
           EXEC SQL                                                             
              OPEN TFRCSR                                                       
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT21-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT21-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT21-SQLCODE                                   
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
              SET ACAT21-NORMAL  TO TRUE                                        
              PERFORM SETUP-TRANSFER-COMMAREA                                   
           ELSE                                                                 
           IF SQLCODE = +100                                                    
ET0003        IF WS-PASSED-TO-BR NOT = HIGH-VALUES                              
ET0003           PERFORM CLOSE-TFR-CURSOR                                       
ET0003           MOVE WS-PASSED-TO-BR TO WS-PASSED-BR                           
ET0003           PERFORM OPEN-TFR-CURSOR                                        
ET0003           GO TO FETCH-TFR-CURSOR                                         
ET0003        END-IF                                                            
              SET ACAT21-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT21-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT21-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *         SETUP COMMAREA TRANSFER RETURN DATA                  *          
      *--------------------------------------------------------------*          
       SETUP-TRANSFER-COMMAREA.                                                 
           MOVE CLIENT-NBR        TO ACAT21-TFR-CLT.                            
           MOVE ACAT-CONTROL-NBR  TO ACAT21-TFR-ACAT.                           
           MOVE DLVR-NBR          TO ACAT21-TFR-DLVR-NBR.                       
           MOVE ACCT-DLVR-NBR     TO ACAT21-TFR-DLVR-ACCT.                      
           MOVE RCV-NBR           TO ACAT21-TFR-RCV-NBR.                        
           MOVE ACCT-RCV-NBR      TO ACAT21-TFR-RCV-ACCT.                       
           MOVE TRNFR-TYPE-CD     TO ACAT21-TFR-TFR-TYPE.                       
           MOVE TRANS-TYPE-CD     TO ACAT21-TFR-TRANS-TYPE.                     
           MOVE RCV-CUST-NM       TO ACAT21-TFR-NAME.                           
           MOVE RCV-ACCT-TYPE-CD  TO ACAT21-TFR-ACCT-TYPE.                      
           MOVE STTS-CD           TO ACAT21-TFR-STTS.                           
           MOVE DSTBN-SIDE-CD     TO ACAT21-TFR-DSTBN.                          
           MOVE RR-CD             TO ACAT21-TFR-RR.                             
           MOVE BRANCH-CD         TO ACAT21-TFR-BRANCH.                         
           MOVE DAYS-STTS-QTY     TO ACAT21-TFR-DAYS-STTS.                      
           MOVE STTLM-DT          TO ACAT21-TFR-STTLM-DT.                       
           MOVE ACCT-CD           TO ACAT21-TFR-ACCOUNT.                        
           MOVE STTLM-ASCTD-DT    TO ACAT21-TFR-STTL-ASCTD.                     
           MOVE CRT-TMSTP         TO ACAT21-CRT-TMSTP.                          
      *                                                                         
      *--------------------------------------------------------------*          
      *         CLOSE ACTIVE TRANSFER CURSOR TABLE                   *          
      *--------------------------------------------------------------*          
       CLOSE-TFR-CURSOR.                                                        
           EXEC SQL                                                             
              CLOSE TFRCSR                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT21-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT21-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT21-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
ET0003*                                                                         
ET0003*--------------------------------------------------------------*          
ET0003*           DIRECT READ ON VTRNFR                              *          
ET0003*--------------------------------------------------------------*          
ET0003 GET-TRANSFER.                                                            
           EXEC SQL                                                             
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
              FROM                                                              
                  VTRNFR                                                        
              WHERE                                                             
                  CLIENT_NBR = :WS-PASSED-CLT                                   
                  AND ACAT_CONTROL_NBR = :WS-PASSED-ACAT-CNTRL                  
              WITH UR                                                           
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = 0                                                       
              SET ACAT21-NORMAL  TO TRUE                                        
              PERFORM SETUP-TRANSFER-COMMAREA                                   
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT21-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT21-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT21-SQLCODE                                   
              PERFORM 9999-DB2-ERROR                                            
           END-IF.                                                              
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
           MOVE 'ACAT21DB' TO CALLING-PROGRAM-ID.                               
           MOVE SQLCA      TO SQLCA-AREA.                                       
           EXEC CICS LINK PROGRAM('FPDB2LOG')                                   
                COMMAREA(WS-ERR-DATA)                                           
                LENGTH(LENGTH OF WS-ERR-DATA)                                   
                NOHANDLE                                                        
           END-EXEC.                                                            
       EJECT                                                                    
                                                                                
       HANG-CICS.                                                               
           GOBACK.                                                              
