000001* PDX    - ACAT25DB C0210492 10/05/04 13:27:30 TBLAMUR            00001000
ET0001* SSR 0034535 CAGE TAG NUMBER FROM ORIGINAL FAIL                  00001000
000001* PDX    - ACAT25DB C0133622 01/14/00 11:53:31 TBLAMUR            00001000
000001* PDX    - ACAT25DB C0131728 09/27/99 09:57:27 TBLAMUR            00001000
000001* PDX    - ACAT25DB C0125633 06/16/99 15:34:39 TBEDTAK            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    ACAT25DB.                                                 
       AUTHOR.  E.TAKAESU.                                                      
      *REMARKS.                                                                 
      *****************************************************************         
      *     DB2 I/O PROGRAM FOR A TRANSFER ASSET INQUIRY PROGRAM      *         
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
           03  WS-PASSED-ACAT                  PIC X(14).                       
           03  WS-PASSED-ACAT-2                PIC X(14).                       
           03  WS-PASSED-BR-2                  PIC X(03).                       
           03  WS-PASSED-AC-2                  PIC X(05).                       
           03  WS-PASSED-TO-BR                 PIC X(03).                       
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
      *           ACTIVE ASSET TABLE                                   *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              INCLUDE VASSET                                                    
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *           HISTORY TRANSFER TABLE                               *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              INCLUDE VTRNHSTY                                                  
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *           HISTORY ASSET TABLE                                  *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              INCLUDE VASTHSTY                                                  
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
      *  PENDING TRNFR TABLE DECLARE CURSOR STATEMENT IN SEQUENCE      *        
      *  ORDER BY SEARCH ENGINE BRANCH ACCT ACAT#.                     *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  TRNFR_ENGIN_CSR CURSOR FOR                               
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,SBMTG_PRTCP_NBR                                            
                    ,SBMT_PRT_NR_STS_CD                                         
                    ,CONTROL_NBR_STS_CD                                         
                    ,DLVR_NBR                                                   
                    ,DLVR_NBR_STTS_CD                                           
                    ,ACCT_DLVR_NBR                                              
                    ,ACCT_DLVR_STTS_CD                                          
                    ,RCV_NBR                                                    
                    ,RCV_NBR_STTS_CD                                            
                    ,ACCT_RCV_NBR                                               
                    ,ACCT_RCV_STTS_CD                                           
                    ,TRNFR_TYPE_CD                                              
                    ,TRNFR_TYPE_STTS_CD                                         
                    ,TRANS_TYPE_CD                                              
                    ,TRANS_TYPE_STTS_CD                                         
                    ,RCV_CUST_NM                                                
                    ,RCV_CUST_NM_STS_CD                                         
                    ,RCV_SS_PRIM_NBR                                            
                    ,RCV_SS_PRIM_STS_CD                                         
                    ,RCV_SS_SCNDY_NBR                                           
                    ,RCV_SS_SCDY_STS_CD                                         
                    ,RCV_ACCT_TYPE_CD                                           
                    ,RCV_ACT_TYP_STS_CD                                         
                    ,RCV_OCC_BRKR_NBR                                           
                    ,RCV_OCC_STTS_CD                                            
                    ,RCV_CRSPN_NBR                                              
                    ,RCV_CRSPN_STTS_CD                                          
                    ,ACAT_CNTL_ASTD_NBR                                         
                    ,CNTL_ASTD_STTS_CD                                          
                    ,CMNT_TXT                                                   
                    ,CMNT_STTS_CD                                               
                    ,PRCS_DT                                                    
                    ,STTS_CD                                                    
                    ,STTLM_TM_CD                                                
                    ,VAL_FREE_CD                                                
                    ,TRANS_RFRN_ID_CD                                           
                    ,TRANS_RFRN_STTS_CD                                         
                    ,DB_CR_CD                                                   
                    ,DSTBN_SIDE_CD                                              
                    ,SYS_ACT_CD                                                 
                    ,SYS_RJCT_RSN_CD                                            
                    ,TRNFR_TYPE_RJC1_CD                                         
                    ,TRNFR_TYPE_RJC2_CD                                         
                    ,TRNFR_TYPE_RJCT_CD                                         
                    ,TRN_TYP_RJC_STS_CD                                         
                    ,PHSCL_SEQ_NBR                                              
                    ,PHSCL_SEQ_STTS_CD                                          
                    ,LGCL_SEQ_NBR                                               
                    ,LGCL_SEQ_NR_STS_CD                                         
                    ,RR_CD                                                      
                    ,BRANCH_CD                                                  
                    ,DVDND_NAA_CD                                               
                    ,SELL_INSTN_NAA_CD                                          
                    ,CASH_SWEEP_NAA_CD                                          
                    ,PRTCP_CONTRA_CD                                            
                    ,ACM_HOLDER_NAA_CD                                          
                    ,ACCT_ACTIVITY_IND                                          
                    ,ACCT_ORDERS_IND                                            
                    ,ACCT_RJCT_RSBM_IND                                         
                    ,ACCT_DB_BAL_T1_IND                                         
                    ,ACCT_MRGN_DB_IND                                           
                    ,ACCT_SHRT_PSTN_IND                                         
                    ,ACCT_SEC_RSTRD_IND                                         
                    ,ACCT_AST_EXCS_IND                                          
                    ,ACCT_OPTN_PSTN_IND                                         
                    ,ACCT_LTD_PRTNR_IND                                         
                    ,ACCT_TIN_MSMTH_IND                                         
                    ,ACCT_DPLCT_TRN_IND                                         
                    ,ACCT_CUST_70_IND                                           
                    ,ACCT_QULFD_PLN_IND                                         
                    ,ACCT_MNGD_IND                                              
                    ,ACCT_PRVT_RNG_IND                                          
                    ,ACCT_BRKR_TIF_IND                                          
                    ,NSCC_NON_ADP_IND                                           
                    ,CYCLE_CD                                                   
                    ,DAYS_STTS_QTY                                              
                    ,STTLM_DT                                                   
                    ,ACCT_NA_UPDT_IND                                           
                    ,ACCT_TRNFR_FEE_AMT                                         
                    ,ACCT_IRA_TRMNT_AMT                                         
                    ,ACCT_IRA_MAINT_AMT                                         
                    ,ACCT_DLRV_PRGR_IND                                         
                    ,ACCT_CD                                                    
                    ,STTLM_ASCTD_DT                                             
                    ,STTLM_ASCTD_STS_CD                                         
                    ,RCRD_LNGTH_STTS_CD                                         
                    ,RCRD_STTS_CD                                               
                    ,NSCC_PEND_CD                                               
                    ,NSCC_ACK_IND                                               
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,ACCT_EQUITY_AMT                                            
                    ,ALERT_IND                                                  
                  FROM                                                          
                     VTRNFR                                                     
                  WHERE                                                         
                     CLIENT_NBR = :WS-PASSED-CLT                                
                     AND NOT (BRANCH_CD < :WS-PASSED-BR)                        
                     AND     (BRANCH_CD < :WS-PASSED-TO-BR)                     
                     AND NOT (ACCT_CD < :WS-PASSED-AC)                          
                     AND RR_CD LIKE :WS-PASSED-RR                               
                     AND TRNFR_TYPE_CD LIKE :WS-PASSED-TFR                      
                     AND DSTBN_SIDE_CD LIKE :WS-PASSED-RD                       
                     AND DLVR_NBR LIKE :WS-PASSED-CBRKR-DEL                     
                     AND RCV_NBR LIKE :WS-PASSED-CBRKR-REC                      
                     AND (STTS_CD BETWEEN                                       
                         :WS-PASSED-STAT-FR AND :WS-PASSED-STAT-TO)             
                     AND NOT (STTS_CD  = '140')                                 
                     AND (STTLM_DT   BETWEEN                                    
                          :WS-PASSED-SD-FR AND :WS-PASSED-SD-TO)                
                  ORDER BY                                                      
                     CLIENT_NBR                                                 
                    ,BRANCH_CD                                                  
                    ,ACCT_CD                                                    
                    ,ACAT_CONTROL_NBR                                           
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *  PENDING TRNFR TABLE DECLARE CURSOR STATEMENT IN SEQUENCE      *        
      *  ORDER BY SEARCH ENGINE BRANCH ACCT ACAT# (VERSION 2)          *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  TRNFR_ENGIN_CSR2 CURSOR FOR                              
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,SBMTG_PRTCP_NBR                                            
                    ,SBMT_PRT_NR_STS_CD                                         
                    ,CONTROL_NBR_STS_CD                                         
                    ,DLVR_NBR                                                   
                    ,DLVR_NBR_STTS_CD                                           
                    ,ACCT_DLVR_NBR                                              
                    ,ACCT_DLVR_STTS_CD                                          
                    ,RCV_NBR                                                    
                    ,RCV_NBR_STTS_CD                                            
                    ,ACCT_RCV_NBR                                               
                    ,ACCT_RCV_STTS_CD                                           
                    ,TRNFR_TYPE_CD                                              
                    ,TRNFR_TYPE_STTS_CD                                         
                    ,TRANS_TYPE_CD                                              
                    ,TRANS_TYPE_STTS_CD                                         
                    ,RCV_CUST_NM                                                
                    ,RCV_CUST_NM_STS_CD                                         
                    ,RCV_SS_PRIM_NBR                                            
                    ,RCV_SS_PRIM_STS_CD                                         
                    ,RCV_SS_SCNDY_NBR                                           
                    ,RCV_SS_SCDY_STS_CD                                         
                    ,RCV_ACCT_TYPE_CD                                           
                    ,RCV_ACT_TYP_STS_CD                                         
                    ,RCV_OCC_BRKR_NBR                                           
                    ,RCV_OCC_STTS_CD                                            
                    ,RCV_CRSPN_NBR                                              
                    ,RCV_CRSPN_STTS_CD                                          
                    ,ACAT_CNTL_ASTD_NBR                                         
                    ,CNTL_ASTD_STTS_CD                                          
                    ,CMNT_TXT                                                   
                    ,CMNT_STTS_CD                                               
                    ,PRCS_DT                                                    
                    ,STTS_CD                                                    
                    ,STTLM_TM_CD                                                
                    ,VAL_FREE_CD                                                
                    ,TRANS_RFRN_ID_CD                                           
                    ,TRANS_RFRN_STTS_CD                                         
                    ,DB_CR_CD                                                   
                    ,DSTBN_SIDE_CD                                              
                    ,SYS_ACT_CD                                                 
                    ,SYS_RJCT_RSN_CD                                            
                    ,TRNFR_TYPE_RJC1_CD                                         
                    ,TRNFR_TYPE_RJC2_CD                                         
                    ,TRNFR_TYPE_RJCT_CD                                         
                    ,TRN_TYP_RJC_STS_CD                                         
                    ,PHSCL_SEQ_NBR                                              
                    ,PHSCL_SEQ_STTS_CD                                          
                    ,LGCL_SEQ_NBR                                               
                    ,LGCL_SEQ_NR_STS_CD                                         
                    ,RR_CD                                                      
                    ,BRANCH_CD                                                  
                    ,DVDND_NAA_CD                                               
                    ,SELL_INSTN_NAA_CD                                          
                    ,CASH_SWEEP_NAA_CD                                          
                    ,PRTCP_CONTRA_CD                                            
                    ,ACM_HOLDER_NAA_CD                                          
                    ,ACCT_ACTIVITY_IND                                          
                    ,ACCT_ORDERS_IND                                            
                    ,ACCT_RJCT_RSBM_IND                                         
                    ,ACCT_DB_BAL_T1_IND                                         
                    ,ACCT_MRGN_DB_IND                                           
                    ,ACCT_SHRT_PSTN_IND                                         
                    ,ACCT_SEC_RSTRD_IND                                         
                    ,ACCT_AST_EXCS_IND                                          
                    ,ACCT_OPTN_PSTN_IND                                         
                    ,ACCT_LTD_PRTNR_IND                                         
                    ,ACCT_TIN_MSMTH_IND                                         
                    ,ACCT_DPLCT_TRN_IND                                         
                    ,ACCT_CUST_70_IND                                           
                    ,ACCT_QULFD_PLN_IND                                         
                    ,ACCT_MNGD_IND                                              
                    ,ACCT_PRVT_RNG_IND                                          
                    ,ACCT_BRKR_TIF_IND                                          
                    ,NSCC_NON_ADP_IND                                           
                    ,CYCLE_CD                                                   
                    ,DAYS_STTS_QTY                                              
                    ,STTLM_DT                                                   
                    ,ACCT_NA_UPDT_IND                                           
                    ,ACCT_TRNFR_FEE_AMT                                         
                    ,ACCT_IRA_TRMNT_AMT                                         
                    ,ACCT_IRA_MAINT_AMT                                         
                    ,ACCT_DLRV_PRGR_IND                                         
                    ,ACCT_CD                                                    
                    ,STTLM_ASCTD_DT                                             
                    ,STTLM_ASCTD_STS_CD                                         
                    ,RCRD_LNGTH_STTS_CD                                         
                    ,RCRD_STTS_CD                                               
                    ,NSCC_PEND_CD                                               
                    ,NSCC_ACK_IND                                               
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,ACCT_EQUITY_AMT                                            
                    ,ALERT_IND                                                  
                  FROM                                                          
                     VTRNFR                                                     
                  WHERE                                                         
                     CLIENT_NBR = :WS-PASSED-CLT                                
                     AND ((BRANCH_CD || ACCT_CD || ACAT_CONTROL_NBR)            
                          >   (:WS-PASSED-BR || :WS-PASSED-AC ||                
                               :WS-PASSED-ACAT))                                
                     AND     (BRANCH_CD < :WS-PASSED-TO-BR)                     
                     AND RR_CD LIKE :WS-PASSED-RR                               
                     AND TRNFR_TYPE_CD LIKE :WS-PASSED-TFR                      
                     AND DSTBN_SIDE_CD LIKE :WS-PASSED-RD                       
                     AND DLVR_NBR LIKE :WS-PASSED-CBRKR-DEL                     
                     AND RCV_NBR LIKE :WS-PASSED-CBRKR-REC                      
                     AND (STTS_CD BETWEEN                                       
                         :WS-PASSED-STAT-FR AND :WS-PASSED-STAT-TO)             
                     AND NOT (STTS_CD  = '140')                                 
                     AND (STTLM_DT   BETWEEN                                    
                          :WS-PASSED-SD-FR AND :WS-PASSED-SD-TO)                
                  ORDER BY                                                      
                     CLIENT_NBR                                                 
                    ,BRANCH_CD                                                  
                    ,ACCT_CD                                                    
                    ,ACAT_CONTROL_NBR                                           
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *  PENDING TRANSFER TABLE DECLARE CURSOR STATEMENT IN DESCENDING *        
      *  SEQUENCE ORDER BY BRANCH ACCT ACAT#.                          *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  TRNFR_ENGIN_CSR_D CURSOR FOR                             
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,SBMTG_PRTCP_NBR                                            
                    ,SBMT_PRT_NR_STS_CD                                         
                    ,CONTROL_NBR_STS_CD                                         
                    ,DLVR_NBR                                                   
                    ,DLVR_NBR_STTS_CD                                           
                    ,ACCT_DLVR_NBR                                              
                    ,ACCT_DLVR_STTS_CD                                          
                    ,RCV_NBR                                                    
                    ,RCV_NBR_STTS_CD                                            
                    ,ACCT_RCV_NBR                                               
                    ,ACCT_RCV_STTS_CD                                           
                    ,TRNFR_TYPE_CD                                              
                    ,TRNFR_TYPE_STTS_CD                                         
                    ,TRANS_TYPE_CD                                              
                    ,TRANS_TYPE_STTS_CD                                         
                    ,RCV_CUST_NM                                                
                    ,RCV_CUST_NM_STS_CD                                         
                    ,RCV_SS_PRIM_NBR                                            
                    ,RCV_SS_PRIM_STS_CD                                         
                    ,RCV_SS_SCNDY_NBR                                           
                    ,RCV_SS_SCDY_STS_CD                                         
                    ,RCV_ACCT_TYPE_CD                                           
                    ,RCV_ACT_TYP_STS_CD                                         
                    ,RCV_OCC_BRKR_NBR                                           
                    ,RCV_OCC_STTS_CD                                            
                    ,RCV_CRSPN_NBR                                              
                    ,RCV_CRSPN_STTS_CD                                          
                    ,ACAT_CNTL_ASTD_NBR                                         
                    ,CNTL_ASTD_STTS_CD                                          
                    ,CMNT_TXT                                                   
                    ,CMNT_STTS_CD                                               
                    ,PRCS_DT                                                    
                    ,STTS_CD                                                    
                    ,STTLM_TM_CD                                                
                    ,VAL_FREE_CD                                                
                    ,TRANS_RFRN_ID_CD                                           
                    ,TRANS_RFRN_STTS_CD                                         
                    ,DB_CR_CD                                                   
                    ,DSTBN_SIDE_CD                                              
                    ,SYS_ACT_CD                                                 
                    ,SYS_RJCT_RSN_CD                                            
                    ,TRNFR_TYPE_RJC1_CD                                         
                    ,TRNFR_TYPE_RJC2_CD                                         
                    ,TRNFR_TYPE_RJCT_CD                                         
                    ,TRN_TYP_RJC_STS_CD                                         
                    ,PHSCL_SEQ_NBR                                              
                    ,PHSCL_SEQ_STTS_CD                                          
                    ,LGCL_SEQ_NBR                                               
                    ,LGCL_SEQ_NR_STS_CD                                         
                    ,RR_CD                                                      
                    ,BRANCH_CD                                                  
                    ,DVDND_NAA_CD                                               
                    ,SELL_INSTN_NAA_CD                                          
                    ,CASH_SWEEP_NAA_CD                                          
                    ,PRTCP_CONTRA_CD                                            
                    ,ACM_HOLDER_NAA_CD                                          
                    ,ACCT_ACTIVITY_IND                                          
                    ,ACCT_ORDERS_IND                                            
                    ,ACCT_RJCT_RSBM_IND                                         
                    ,ACCT_DB_BAL_T1_IND                                         
                    ,ACCT_MRGN_DB_IND                                           
                    ,ACCT_SHRT_PSTN_IND                                         
                    ,ACCT_SEC_RSTRD_IND                                         
                    ,ACCT_AST_EXCS_IND                                          
                    ,ACCT_OPTN_PSTN_IND                                         
                    ,ACCT_LTD_PRTNR_IND                                         
                    ,ACCT_TIN_MSMTH_IND                                         
                    ,ACCT_DPLCT_TRN_IND                                         
                    ,ACCT_CUST_70_IND                                           
                    ,ACCT_QULFD_PLN_IND                                         
                    ,ACCT_MNGD_IND                                              
                    ,ACCT_PRVT_RNG_IND                                          
                    ,ACCT_BRKR_TIF_IND                                          
                    ,NSCC_NON_ADP_IND                                           
                    ,CYCLE_CD                                                   
                    ,DAYS_STTS_QTY                                              
                    ,STTLM_DT                                                   
                    ,ACCT_NA_UPDT_IND                                           
                    ,ACCT_TRNFR_FEE_AMT                                         
                    ,ACCT_IRA_TRMNT_AMT                                         
                    ,ACCT_IRA_MAINT_AMT                                         
                    ,ACCT_DLRV_PRGR_IND                                         
                    ,ACCT_CD                                                    
                    ,STTLM_ASCTD_DT                                             
                    ,STTLM_ASCTD_STS_CD                                         
                    ,RCRD_LNGTH_STTS_CD                                         
                    ,RCRD_STTS_CD                                               
                    ,NSCC_PEND_CD                                               
                    ,NSCC_ACK_IND                                               
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,ACCT_EQUITY_AMT                                            
                    ,ALERT_IND                                                  
                  FROM                                                          
                     VTRNFR                                                     
                  WHERE                                                         
                     CLIENT_NBR = :WS-PASSED-CLT                                
                     AND NOT (BRANCH_CD < :WS-PASSED-BR)                        
                     AND NOT (ACCT_CD < :WS-PASSED-AC)                          
                     AND ((BRANCH_CD || ACCT_CD || ACAT_CONTROL_NBR)            
                          < (:WS-PASSED-BR-2 || :WS-PASSED-AC-2 ||              
                             :WS-PASSED-ACAT-2))                                
                     AND RR_CD LIKE :WS-PASSED-RR                               
                     AND TRNFR_TYPE_CD LIKE :WS-PASSED-TFR                      
                     AND DSTBN_SIDE_CD LIKE :WS-PASSED-RD                       
                     AND DLVR_NBR LIKE :WS-PASSED-CBRKR-DEL                     
                     AND RCV_NBR LIKE :WS-PASSED-CBRKR-REC                      
                     AND (STTS_CD BETWEEN                                       
                         :WS-PASSED-STAT-FR AND :WS-PASSED-STAT-TO)             
                     AND NOT (STTS_CD  = '140')                                 
                     AND (STTLM_DT   BETWEEN                                    
                          :WS-PASSED-SD-FR AND :WS-PASSED-SD-TO)                
                  ORDER BY                                                      
                     CLIENT_NBR        DESC                                     
                    ,BRANCH_CD         DESC                                     
                    ,ACCT_CD           DESC                                     
                    ,ACAT_CONTROL_NBR  DESC                                     
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *   PENDING TRNFR TABLE DECLARE CURSOR STATEMENT SORTED BY ACAT  *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  TRNFR_ACAT_CSR  CURSOR FOR                               
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,SBMTG_PRTCP_NBR                                            
                    ,SBMT_PRT_NR_STS_CD                                         
                    ,CONTROL_NBR_STS_CD                                         
                    ,DLVR_NBR                                                   
                    ,DLVR_NBR_STTS_CD                                           
                    ,ACCT_DLVR_NBR                                              
                    ,ACCT_DLVR_STTS_CD                                          
                    ,RCV_NBR                                                    
                    ,RCV_NBR_STTS_CD                                            
                    ,ACCT_RCV_NBR                                               
                    ,ACCT_RCV_STTS_CD                                           
                    ,TRNFR_TYPE_CD                                              
                    ,TRNFR_TYPE_STTS_CD                                         
                    ,TRANS_TYPE_CD                                              
                    ,TRANS_TYPE_STTS_CD                                         
                    ,RCV_CUST_NM                                                
                    ,RCV_CUST_NM_STS_CD                                         
                    ,RCV_SS_PRIM_NBR                                            
                    ,RCV_SS_PRIM_STS_CD                                         
                    ,RCV_SS_SCNDY_NBR                                           
                    ,RCV_SS_SCDY_STS_CD                                         
                    ,RCV_ACCT_TYPE_CD                                           
                    ,RCV_ACT_TYP_STS_CD                                         
                    ,RCV_OCC_BRKR_NBR                                           
                    ,RCV_OCC_STTS_CD                                            
                    ,RCV_CRSPN_NBR                                              
                    ,RCV_CRSPN_STTS_CD                                          
                    ,ACAT_CNTL_ASTD_NBR                                         
                    ,CNTL_ASTD_STTS_CD                                          
                    ,CMNT_TXT                                                   
                    ,CMNT_STTS_CD                                               
                    ,PRCS_DT                                                    
                    ,STTS_CD                                                    
                    ,STTLM_TM_CD                                                
                    ,VAL_FREE_CD                                                
                    ,TRANS_RFRN_ID_CD                                           
                    ,TRANS_RFRN_STTS_CD                                         
                    ,DB_CR_CD                                                   
                    ,DSTBN_SIDE_CD                                              
                    ,SYS_ACT_CD                                                 
                    ,SYS_RJCT_RSN_CD                                            
                    ,TRNFR_TYPE_RJC1_CD                                         
                    ,TRNFR_TYPE_RJC2_CD                                         
                    ,TRNFR_TYPE_RJCT_CD                                         
                    ,TRN_TYP_RJC_STS_CD                                         
                    ,PHSCL_SEQ_NBR                                              
                    ,PHSCL_SEQ_STTS_CD                                          
                    ,LGCL_SEQ_NBR                                               
                    ,LGCL_SEQ_NR_STS_CD                                         
                    ,RR_CD                                                      
                    ,BRANCH_CD                                                  
                    ,DVDND_NAA_CD                                               
                    ,SELL_INSTN_NAA_CD                                          
                    ,CASH_SWEEP_NAA_CD                                          
                    ,PRTCP_CONTRA_CD                                            
                    ,ACM_HOLDER_NAA_CD                                          
                    ,ACCT_ACTIVITY_IND                                          
                    ,ACCT_ORDERS_IND                                            
                    ,ACCT_RJCT_RSBM_IND                                         
                    ,ACCT_DB_BAL_T1_IND                                         
                    ,ACCT_MRGN_DB_IND                                           
                    ,ACCT_SHRT_PSTN_IND                                         
                    ,ACCT_SEC_RSTRD_IND                                         
                    ,ACCT_AST_EXCS_IND                                          
                    ,ACCT_OPTN_PSTN_IND                                         
                    ,ACCT_LTD_PRTNR_IND                                         
                    ,ACCT_TIN_MSMTH_IND                                         
                    ,ACCT_DPLCT_TRN_IND                                         
                    ,ACCT_CUST_70_IND                                           
                    ,ACCT_QULFD_PLN_IND                                         
                    ,ACCT_MNGD_IND                                              
                    ,ACCT_PRVT_RNG_IND                                          
                    ,ACCT_BRKR_TIF_IND                                          
                    ,NSCC_NON_ADP_IND                                           
                    ,CYCLE_CD                                                   
                    ,DAYS_STTS_QTY                                              
                    ,STTLM_DT                                                   
                    ,ACCT_NA_UPDT_IND                                           
                    ,ACCT_TRNFR_FEE_AMT                                         
                    ,ACCT_IRA_TRMNT_AMT                                         
                    ,ACCT_IRA_MAINT_AMT                                         
                    ,ACCT_DLRV_PRGR_IND                                         
                    ,ACCT_CD                                                    
                    ,STTLM_ASCTD_DT                                             
                    ,STTLM_ASCTD_STS_CD                                         
                    ,RCRD_LNGTH_STTS_CD                                         
                    ,RCRD_STTS_CD                                               
                    ,NSCC_PEND_CD                                               
                    ,NSCC_ACK_IND                                               
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,ACCT_EQUITY_AMT                                            
                    ,ALERT_IND                                                  
                  FROM                                                          
                     VTRNFR                                                     
                  WHERE                                                         
                     CLIENT_NBR = :WS-PASSED-CLT                                
                     AND NOT (ACAT_CONTROL_NBR < :WS-PASSED-ACAT)               
                     AND NOT (STTS_CD  = '140')                                 
                  ORDER BY                                                      
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
      *                                                                         
      *----------------------------------------------------------------*        
      *   PENDING TRNFR TABLE DECLARE CURSOR STATEMENT IN SEQUENCE     *        
      *   ORDER BY ACAT# (VERSION 2)                                   *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  TRNFR_ACAT_CSR2  CURSOR FOR                              
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,SBMTG_PRTCP_NBR                                            
                    ,SBMT_PRT_NR_STS_CD                                         
                    ,CONTROL_NBR_STS_CD                                         
                    ,DLVR_NBR                                                   
                    ,DLVR_NBR_STTS_CD                                           
                    ,ACCT_DLVR_NBR                                              
                    ,ACCT_DLVR_STTS_CD                                          
                    ,RCV_NBR                                                    
                    ,RCV_NBR_STTS_CD                                            
                    ,ACCT_RCV_NBR                                               
                    ,ACCT_RCV_STTS_CD                                           
                    ,TRNFR_TYPE_CD                                              
                    ,TRNFR_TYPE_STTS_CD                                         
                    ,TRANS_TYPE_CD                                              
                    ,TRANS_TYPE_STTS_CD                                         
                    ,RCV_CUST_NM                                                
                    ,RCV_CUST_NM_STS_CD                                         
                    ,RCV_SS_PRIM_NBR                                            
                    ,RCV_SS_PRIM_STS_CD                                         
                    ,RCV_SS_SCNDY_NBR                                           
                    ,RCV_SS_SCDY_STS_CD                                         
                    ,RCV_ACCT_TYPE_CD                                           
                    ,RCV_ACT_TYP_STS_CD                                         
                    ,RCV_OCC_BRKR_NBR                                           
                    ,RCV_OCC_STTS_CD                                            
                    ,RCV_CRSPN_NBR                                              
                    ,RCV_CRSPN_STTS_CD                                          
                    ,ACAT_CNTL_ASTD_NBR                                         
                    ,CNTL_ASTD_STTS_CD                                          
                    ,CMNT_TXT                                                   
                    ,CMNT_STTS_CD                                               
                    ,PRCS_DT                                                    
                    ,STTS_CD                                                    
                    ,STTLM_TM_CD                                                
                    ,VAL_FREE_CD                                                
                    ,TRANS_RFRN_ID_CD                                           
                    ,TRANS_RFRN_STTS_CD                                         
                    ,DB_CR_CD                                                   
                    ,DSTBN_SIDE_CD                                              
                    ,SYS_ACT_CD                                                 
                    ,SYS_RJCT_RSN_CD                                            
                    ,TRNFR_TYPE_RJC1_CD                                         
                    ,TRNFR_TYPE_RJC2_CD                                         
                    ,TRNFR_TYPE_RJCT_CD                                         
                    ,TRN_TYP_RJC_STS_CD                                         
                    ,PHSCL_SEQ_NBR                                              
                    ,PHSCL_SEQ_STTS_CD                                          
                    ,LGCL_SEQ_NBR                                               
                    ,LGCL_SEQ_NR_STS_CD                                         
                    ,RR_CD                                                      
                    ,BRANCH_CD                                                  
                    ,DVDND_NAA_CD                                               
                    ,SELL_INSTN_NAA_CD                                          
                    ,CASH_SWEEP_NAA_CD                                          
                    ,PRTCP_CONTRA_CD                                            
                    ,ACM_HOLDER_NAA_CD                                          
                    ,ACCT_ACTIVITY_IND                                          
                    ,ACCT_ORDERS_IND                                            
                    ,ACCT_RJCT_RSBM_IND                                         
                    ,ACCT_DB_BAL_T1_IND                                         
                    ,ACCT_MRGN_DB_IND                                           
                    ,ACCT_SHRT_PSTN_IND                                         
                    ,ACCT_SEC_RSTRD_IND                                         
                    ,ACCT_AST_EXCS_IND                                          
                    ,ACCT_OPTN_PSTN_IND                                         
                    ,ACCT_LTD_PRTNR_IND                                         
                    ,ACCT_TIN_MSMTH_IND                                         
                    ,ACCT_DPLCT_TRN_IND                                         
                    ,ACCT_CUST_70_IND                                           
                    ,ACCT_QULFD_PLN_IND                                         
                    ,ACCT_MNGD_IND                                              
                    ,ACCT_PRVT_RNG_IND                                          
                    ,ACCT_BRKR_TIF_IND                                          
                    ,NSCC_NON_ADP_IND                                           
                    ,CYCLE_CD                                                   
                    ,DAYS_STTS_QTY                                              
                    ,STTLM_DT                                                   
                    ,ACCT_NA_UPDT_IND                                           
                    ,ACCT_TRNFR_FEE_AMT                                         
                    ,ACCT_IRA_TRMNT_AMT                                         
                    ,ACCT_IRA_MAINT_AMT                                         
                    ,ACCT_DLRV_PRGR_IND                                         
                    ,ACCT_CD                                                    
                    ,STTLM_ASCTD_DT                                             
                    ,STTLM_ASCTD_STS_CD                                         
                    ,RCRD_LNGTH_STTS_CD                                         
                    ,RCRD_STTS_CD                                               
                    ,NSCC_PEND_CD                                               
                    ,NSCC_ACK_IND                                               
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,ACCT_EQUITY_AMT                                            
                    ,ALERT_IND                                                  
                  FROM                                                          
                     VTRNFR                                                     
                  WHERE                                                         
                     CLIENT_NBR = :WS-PASSED-CLT                                
                     AND  ACAT_CONTROL_NBR > :WS-PASSED-ACAT                    
                     AND NOT (STTS_CD  = '140')                                 
                  ORDER BY                                                      
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *   PENDING TRNFR TABLE DECLARE CURSOR STATEMENT IN DESCENDING   *        
      *   SEQUENCE ORDER BY ACAT#.                                     *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  TRNFR_ACAT_CSR_D  CURSOR FOR                             
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,SBMTG_PRTCP_NBR                                            
                    ,SBMT_PRT_NR_STS_CD                                         
                    ,CONTROL_NBR_STS_CD                                         
                    ,DLVR_NBR                                                   
                    ,DLVR_NBR_STTS_CD                                           
                    ,ACCT_DLVR_NBR                                              
                    ,ACCT_DLVR_STTS_CD                                          
                    ,RCV_NBR                                                    
                    ,RCV_NBR_STTS_CD                                            
                    ,ACCT_RCV_NBR                                               
                    ,ACCT_RCV_STTS_CD                                           
                    ,TRNFR_TYPE_CD                                              
                    ,TRNFR_TYPE_STTS_CD                                         
                    ,TRANS_TYPE_CD                                              
                    ,TRANS_TYPE_STTS_CD                                         
                    ,RCV_CUST_NM                                                
                    ,RCV_CUST_NM_STS_CD                                         
                    ,RCV_SS_PRIM_NBR                                            
                    ,RCV_SS_PRIM_STS_CD                                         
                    ,RCV_SS_SCNDY_NBR                                           
                    ,RCV_SS_SCDY_STS_CD                                         
                    ,RCV_ACCT_TYPE_CD                                           
                    ,RCV_ACT_TYP_STS_CD                                         
                    ,RCV_OCC_BRKR_NBR                                           
                    ,RCV_OCC_STTS_CD                                            
                    ,RCV_CRSPN_NBR                                              
                    ,RCV_CRSPN_STTS_CD                                          
                    ,ACAT_CNTL_ASTD_NBR                                         
                    ,CNTL_ASTD_STTS_CD                                          
                    ,CMNT_TXT                                                   
                    ,CMNT_STTS_CD                                               
                    ,PRCS_DT                                                    
                    ,STTS_CD                                                    
                    ,STTLM_TM_CD                                                
                    ,VAL_FREE_CD                                                
                    ,TRANS_RFRN_ID_CD                                           
                    ,TRANS_RFRN_STTS_CD                                         
                    ,DB_CR_CD                                                   
                    ,DSTBN_SIDE_CD                                              
                    ,SYS_ACT_CD                                                 
                    ,SYS_RJCT_RSN_CD                                            
                    ,TRNFR_TYPE_RJC1_CD                                         
                    ,TRNFR_TYPE_RJC2_CD                                         
                    ,TRNFR_TYPE_RJCT_CD                                         
                    ,TRN_TYP_RJC_STS_CD                                         
                    ,PHSCL_SEQ_NBR                                              
                    ,PHSCL_SEQ_STTS_CD                                          
                    ,LGCL_SEQ_NBR                                               
                    ,LGCL_SEQ_NR_STS_CD                                         
                    ,RR_CD                                                      
                    ,BRANCH_CD                                                  
                    ,DVDND_NAA_CD                                               
                    ,SELL_INSTN_NAA_CD                                          
                    ,CASH_SWEEP_NAA_CD                                          
                    ,PRTCP_CONTRA_CD                                            
                    ,ACM_HOLDER_NAA_CD                                          
                    ,ACCT_ACTIVITY_IND                                          
                    ,ACCT_ORDERS_IND                                            
                    ,ACCT_RJCT_RSBM_IND                                         
                    ,ACCT_DB_BAL_T1_IND                                         
                    ,ACCT_MRGN_DB_IND                                           
                    ,ACCT_SHRT_PSTN_IND                                         
                    ,ACCT_SEC_RSTRD_IND                                         
                    ,ACCT_AST_EXCS_IND                                          
                    ,ACCT_OPTN_PSTN_IND                                         
                    ,ACCT_LTD_PRTNR_IND                                         
                    ,ACCT_TIN_MSMTH_IND                                         
                    ,ACCT_DPLCT_TRN_IND                                         
                    ,ACCT_CUST_70_IND                                           
                    ,ACCT_QULFD_PLN_IND                                         
                    ,ACCT_MNGD_IND                                              
                    ,ACCT_PRVT_RNG_IND                                          
                    ,ACCT_BRKR_TIF_IND                                          
                    ,NSCC_NON_ADP_IND                                           
                    ,CYCLE_CD                                                   
                    ,DAYS_STTS_QTY                                              
                    ,STTLM_DT                                                   
                    ,ACCT_NA_UPDT_IND                                           
                    ,ACCT_TRNFR_FEE_AMT                                         
                    ,ACCT_IRA_TRMNT_AMT                                         
                    ,ACCT_IRA_MAINT_AMT                                         
                    ,ACCT_DLRV_PRGR_IND                                         
                    ,ACCT_CD                                                    
                    ,STTLM_ASCTD_DT                                             
                    ,STTLM_ASCTD_STS_CD                                         
                    ,RCRD_LNGTH_STTS_CD                                         
                    ,RCRD_STTS_CD                                               
                    ,NSCC_PEND_CD                                               
                    ,NSCC_ACK_IND                                               
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,ACCT_EQUITY_AMT                                            
                    ,ALERT_IND                                                  
                  FROM                                                          
                     VTRNFR                                                     
                  WHERE                                                         
                     CLIENT_NBR = :WS-PASSED-CLT                                
                     AND NOT (ACAT_CONTROL_NBR < :WS-PASSED-ACAT)               
                     AND     (ACAT_CONTROL_NBR < :WS-PASSED-ACAT-2)             
                     AND NOT (STTS_CD  = '140')                                 
                  ORDER BY                                                      
                     CLIENT_NBR        DESC                                     
                    ,ACAT_CONTROL_NBR  DESC                                     
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *        ACTIVE ASSET TABLE DECLARE CURSOR STATEMENT             *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  ASSET_CSR  CURSOR FOR                                    
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,ASSET_SEQ_NBR                                              
                    ,CONTROL_NBR_STS_CD                                         
                    ,DLVR_NBR_STTS_CD                                           
                    ,RCV_NBR_STTS_CD                                            
                    ,SBMTG_PRTCP_NBR                                            
                    ,SBMT_PRT_NR_STS_CD                                         
                    ,AST_SEQ_NBR_STS_CD                                         
                    ,SYS_ACT_CD                                                 
                    ,SYS_RJCT_RSN_CD                                            
                    ,TRANS_TYPE_CD                                              
                    ,TRANS_TYPE_STTS_CD                                         
                    ,PHSCL_SEQ_NBR                                              
                    ,PHSCL_SEQ_STTS_CD                                          
                    ,LGCL_SEQ_NBR                                               
                    ,LGCL_SEQ_NR_STS_CD                                         
                    ,ASSET_PRC_CTGY_CD                                          
                    ,AST_PRC_CTG_STS_CD                                         
                    ,STTLM_LCTN_CD                                              
                    ,STTLM_LCTN_STTS_CD                                         
                    ,STTLM_RSN_CD                                               
                    ,STTLM_RSN_STTS_CD                                          
                    ,ISIN_CNTRY_CD                                              
                    ,ISIN_CNTRY_STTS_CD                                         
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,ISIN_SEC_IS_STS_CD                                         
                    ,ISIN_SEC_CDG_CD                                            
                    ,ISIN_SEC_CD_STS_CD                                         
                    ,ASSET_DESC_TXT                                             
                    ,ASSET_DESC_STTS_CD                                         
                    ,ASSET_RQST_QTY_CD                                          
                    ,ASSET_RQST_STS_CD                                          
                    ,AST_RQST_TRANS_CD                                          
                    ,AST_RQ_TRAN_STS_CD                                         
                    ,ASSET_QTY                                                  
                    ,ASSET_QTY_STTS_CD                                          
                    ,ASSET_PCT                                                  
                    ,ASSET_PCT_STTS_CD                                          
                    ,PSTN_CD                                                    
                    ,PSTN_CD_STTS_CD                                            
                    ,ISO_CRNCY_CD                                               
                    ,ISO_CRNCY_STTS_CD                                          
                    ,ASSET_AMT                                                  
                    ,ASSET_AMT_STTS_CD                                          
                    ,BEARER_BOND_CD                                             
                    ,BEARER_BND_STTS_CD                                         
                    ,CSH_MGN_SHRT_CD                                            
                    ,CSH_MRG_SHT_STS_CD                                         
                    ,WHI_CD                                                     
                    ,WHI_STTS_CD                                                
                    ,TRNFR_TYPE_RSN_CD                                          
                    ,TRN_TYP_RSN_STS_CD                                         
                    ,MBS_SERIAL_NBR                                             
                    ,MBS_SERIAL_STTS_CD                                         
                    ,ASSET_CMNT_TXT                                             
                    ,ASSET_CMNT_STTS_CD                                         
                    ,NSCC_ACK_IND                                               
                    ,NSCC_PEND_CD                                               
                    ,FAIL_SENT_CAGE_IND                                         
                    ,FAIL_OPEN_CAGE_IND                                         
                    ,NSCC_NON_ADP_IND                                           
                    ,TRANS_RFRN_ID_CD                                           
                    ,TRANS_RFRN_STTS_CD                                         
                    ,OPTN_CTGY_CD                                               
                    ,OPTN_CTGY_STTS_CD                                          
                    ,RCRD_LNGTH_STTS_CD                                         
                    ,RCRD_STTS_CD                                               
                    ,ISIN_SEC_EXCPT_IND                                         
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,SECURITY_ADP_NBR                                           
                    ,RCL_SENT_NSCC_IND                                          
                    ,FRV_SENT_NSCC_IND                                          
                    ,TRNFR_TYPE_CD                                              
                    ,TRNFR_TYPE_STTS_CD                                         
ET0001              ,RESTRICTED_IND                                             
ET0001              ,CAGE_TAG_NBR                                               
                  FROM                                                          
                     VASSET                                                     
                  WHERE                                                         
                     CLIENT_NBR = :WS-PASSED-CLT                                
                     AND ACAT_CONTROL_NBR = :WS-PASSED-ACAT                     
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *  HISTORY TRNFR TABLE DECLARE CURSOR STATEMENT IN ASCENDING     *        
      *  SEQUENCE ORDER BY BRANCH ACCT ACAT#.                          *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE HTRNFR_ENGIN_CSR CURSOR FOR                               
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,SBMTG_PRTCP_NBR                                            
                    ,SBMT_PRT_NR_STS_CD                                         
                    ,CONTROL_NBR_STS_CD                                         
                    ,DLVR_NBR                                                   
                    ,DLVR_NBR_STTS_CD                                           
                    ,ACCT_DLVR_NBR                                              
                    ,ACCT_DLVR_STTS_CD                                          
                    ,RCV_NBR                                                    
                    ,RCV_NBR_STTS_CD                                            
                    ,ACCT_RCV_NBR                                               
                    ,ACCT_RCV_STTS_CD                                           
                    ,TRNFR_TYPE_CD                                              
                    ,TRNFR_TYPE_STTS_CD                                         
                    ,TRANS_TYPE_CD                                              
                    ,TRANS_TYPE_STTS_CD                                         
                    ,RCV_CUST_NM                                                
                    ,RCV_CUST_NM_STS_CD                                         
                    ,RCV_SS_PRIM_NBR                                            
                    ,RCV_SS_PRIM_STS_CD                                         
                    ,RCV_SS_SCNDY_NBR                                           
                    ,RCV_SS_SCDY_STS_CD                                         
                    ,RCV_ACCT_TYPE_CD                                           
                    ,RCV_ACT_TYP_STS_CD                                         
                    ,RCV_OCC_BRKR_NBR                                           
                    ,RCV_OCC_STTS_CD                                            
                    ,RCV_CRSPN_NBR                                              
                    ,RCV_CRSPN_STTS_CD                                          
                    ,ACAT_CNTL_ASTD_NBR                                         
                    ,CNTL_ASTD_STTS_CD                                          
                    ,CMNT_TXT                                                   
                    ,CMNT_STTS_CD                                               
                    ,PRCS_DT                                                    
                    ,STTS_CD                                                    
                    ,STTLM_TM_CD                                                
                    ,VAL_FREE_CD                                                
                    ,TRANS_RFRN_ID_CD                                           
                    ,TRANS_RFRN_STTS_CD                                         
                    ,DB_CR_CD                                                   
                    ,DSTBN_SIDE_CD                                              
                    ,SYS_ACT_CD                                                 
                    ,SYS_RJCT_RSN_CD                                            
                    ,TRNFR_TYPE_RJC1_CD                                         
                    ,TRNFR_TYPE_RJC2_CD                                         
                    ,TRNFR_TYPE_RJCT_CD                                         
                    ,TRN_TYP_RJC_STS_CD                                         
                    ,PHSCL_SEQ_NBR                                              
                    ,PHSCL_SEQ_STTS_CD                                          
                    ,LGCL_SEQ_NBR                                               
                    ,LGCL_SEQ_NR_STS_CD                                         
                    ,RR_CD                                                      
                    ,BRANCH_CD                                                  
                    ,DVDND_NAA_CD                                               
                    ,SELL_INSTN_NAA_CD                                          
                    ,CASH_SWEEP_NAA_CD                                          
                    ,PRTCP_CONTRA_CD                                            
                    ,ACM_HOLDER_NAA_CD                                          
                    ,ACCT_ACTIVITY_IND                                          
                    ,ACCT_ORDERS_IND                                            
                    ,ACCT_RJCT_RSBM_IND                                         
                    ,ACCT_DB_BAL_T1_IND                                         
                    ,ACCT_MRGN_DB_IND                                           
                    ,ACCT_SHRT_PSTN_IND                                         
                    ,ACCT_SEC_RSTRD_IND                                         
                    ,ACCT_AST_EXCS_IND                                          
                    ,ACCT_OPTN_PSTN_IND                                         
                    ,ACCT_LTD_PRTNR_IND                                         
                    ,ACCT_TIN_MSMTH_IND                                         
                    ,ACCT_DPLCT_TRN_IND                                         
                    ,ACCT_CUST_70_IND                                           
                    ,ACCT_QULFD_PLN_IND                                         
                    ,ACCT_MNGD_IND                                              
                    ,ACCT_PRVT_RNG_IND                                          
                    ,ACCT_BRKR_TIF_IND                                          
                    ,NSCC_NON_ADP_IND                                           
                    ,CYCLE_CD                                                   
                    ,DAYS_STTS_QTY                                              
                    ,STTLM_DT                                                   
                    ,ACCT_NA_UPDT_IND                                           
                    ,ACCT_TRNFR_FEE_AMT                                         
                    ,ACCT_IRA_TRMNT_AMT                                         
                    ,ACCT_IRA_MAINT_AMT                                         
                    ,ACCT_DLRV_PRGR_IND                                         
                    ,ACCT_CD                                                    
                    ,STTLM_ASCTD_DT                                             
                    ,STTLM_ASCTD_STS_CD                                         
                    ,RCRD_LNGTH_STTS_CD                                         
                    ,RCRD_STTS_CD                                               
                    ,NSCC_PEND_CD                                               
                    ,NSCC_ACK_IND                                               
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,ACCT_EQUITY_AMT                                            
                  FROM                                                          
                     VTRNHSTY                                                   
                  WHERE                                                         
                     CLIENT_NBR = :WS-PASSED-CLT                                
                     AND NOT (BRANCH_CD < :WS-PASSED-BR)                        
                     AND     (BRANCH_CD < :WS-PASSED-TO-BR)                     
                     AND NOT (ACCT_CD < :WS-PASSED-AC)                          
                     AND RR_CD LIKE :WS-PASSED-RR                               
                     AND TRNFR_TYPE_CD LIKE :WS-PASSED-TFR                      
                     AND DSTBN_SIDE_CD LIKE :WS-PASSED-RD                       
                     AND DLVR_NBR LIKE :WS-PASSED-CBRKR-DEL                     
                     AND RCV_NBR LIKE :WS-PASSED-CBRKR-REC                      
                     AND (STTS_CD    BETWEEN                                    
                         :WS-PASSED-STAT-FR AND :WS-PASSED-STAT-TO)             
                     AND (STTLM_DT   BETWEEN                                    
                          :WS-PASSED-SD-FR AND :WS-PASSED-SD-TO)                
                  ORDER BY                                                      
                     CLIENT_NBR                                                 
                    ,BRANCH_CD                                                  
                    ,ACCT_CD                                                    
                    ,ACAT_CONTROL_NBR                                           
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *  HISTORY TRNFR TABLE DECLARE CURSOR STATEMENT IN ASCENDING     *        
      *  SEQUENCE ORDER BY BRANCH ACCT ACAT#. (VERSION 2)              *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE HTRNFR_ENGIN_CSR2 CURSOR FOR                              
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,SBMTG_PRTCP_NBR                                            
                    ,SBMT_PRT_NR_STS_CD                                         
                    ,CONTROL_NBR_STS_CD                                         
                    ,DLVR_NBR                                                   
                    ,DLVR_NBR_STTS_CD                                           
                    ,ACCT_DLVR_NBR                                              
                    ,ACCT_DLVR_STTS_CD                                          
                    ,RCV_NBR                                                    
                    ,RCV_NBR_STTS_CD                                            
                    ,ACCT_RCV_NBR                                               
                    ,ACCT_RCV_STTS_CD                                           
                    ,TRNFR_TYPE_CD                                              
                    ,TRNFR_TYPE_STTS_CD                                         
                    ,TRANS_TYPE_CD                                              
                    ,TRANS_TYPE_STTS_CD                                         
                    ,RCV_CUST_NM                                                
                    ,RCV_CUST_NM_STS_CD                                         
                    ,RCV_SS_PRIM_NBR                                            
                    ,RCV_SS_PRIM_STS_CD                                         
                    ,RCV_SS_SCNDY_NBR                                           
                    ,RCV_SS_SCDY_STS_CD                                         
                    ,RCV_ACCT_TYPE_CD                                           
                    ,RCV_ACT_TYP_STS_CD                                         
                    ,RCV_OCC_BRKR_NBR                                           
                    ,RCV_OCC_STTS_CD                                            
                    ,RCV_CRSPN_NBR                                              
                    ,RCV_CRSPN_STTS_CD                                          
                    ,ACAT_CNTL_ASTD_NBR                                         
                    ,CNTL_ASTD_STTS_CD                                          
                    ,CMNT_TXT                                                   
                    ,CMNT_STTS_CD                                               
                    ,PRCS_DT                                                    
                    ,STTS_CD                                                    
                    ,STTLM_TM_CD                                                
                    ,VAL_FREE_CD                                                
                    ,TRANS_RFRN_ID_CD                                           
                    ,TRANS_RFRN_STTS_CD                                         
                    ,DB_CR_CD                                                   
                    ,DSTBN_SIDE_CD                                              
                    ,SYS_ACT_CD                                                 
                    ,SYS_RJCT_RSN_CD                                            
                    ,TRNFR_TYPE_RJC1_CD                                         
                    ,TRNFR_TYPE_RJC2_CD                                         
                    ,TRNFR_TYPE_RJCT_CD                                         
                    ,TRN_TYP_RJC_STS_CD                                         
                    ,PHSCL_SEQ_NBR                                              
                    ,PHSCL_SEQ_STTS_CD                                          
                    ,LGCL_SEQ_NBR                                               
                    ,LGCL_SEQ_NR_STS_CD                                         
                    ,RR_CD                                                      
                    ,BRANCH_CD                                                  
                    ,DVDND_NAA_CD                                               
                    ,SELL_INSTN_NAA_CD                                          
                    ,CASH_SWEEP_NAA_CD                                          
                    ,PRTCP_CONTRA_CD                                            
                    ,ACM_HOLDER_NAA_CD                                          
                    ,ACCT_ACTIVITY_IND                                          
                    ,ACCT_ORDERS_IND                                            
                    ,ACCT_RJCT_RSBM_IND                                         
                    ,ACCT_DB_BAL_T1_IND                                         
                    ,ACCT_MRGN_DB_IND                                           
                    ,ACCT_SHRT_PSTN_IND                                         
                    ,ACCT_SEC_RSTRD_IND                                         
                    ,ACCT_AST_EXCS_IND                                          
                    ,ACCT_OPTN_PSTN_IND                                         
                    ,ACCT_LTD_PRTNR_IND                                         
                    ,ACCT_TIN_MSMTH_IND                                         
                    ,ACCT_DPLCT_TRN_IND                                         
                    ,ACCT_CUST_70_IND                                           
                    ,ACCT_QULFD_PLN_IND                                         
                    ,ACCT_MNGD_IND                                              
                    ,ACCT_PRVT_RNG_IND                                          
                    ,ACCT_BRKR_TIF_IND                                          
                    ,NSCC_NON_ADP_IND                                           
                    ,CYCLE_CD                                                   
                    ,DAYS_STTS_QTY                                              
                    ,STTLM_DT                                                   
                    ,ACCT_NA_UPDT_IND                                           
                    ,ACCT_TRNFR_FEE_AMT                                         
                    ,ACCT_IRA_TRMNT_AMT                                         
                    ,ACCT_IRA_MAINT_AMT                                         
                    ,ACCT_DLRV_PRGR_IND                                         
                    ,ACCT_CD                                                    
                    ,STTLM_ASCTD_DT                                             
                    ,STTLM_ASCTD_STS_CD                                         
                    ,RCRD_LNGTH_STTS_CD                                         
                    ,RCRD_STTS_CD                                               
                    ,NSCC_PEND_CD                                               
                    ,NSCC_ACK_IND                                               
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,ACCT_EQUITY_AMT                                            
                  FROM                                                          
                     VTRNHSTY                                                   
                  WHERE                                                         
                     CLIENT_NBR = :WS-PASSED-CLT                                
                     AND ((BRANCH_CD || ACCT_CD || ACAT_CONTROL_NBR)            
                         >   (:WS-PASSED-BR || :WS-PASSED-AC ||                 
                              :WS-PASSED-ACAT))                                 
                     AND     (BRANCH_CD < :WS-PASSED-TO-BR)                     
                     AND RR_CD LIKE :WS-PASSED-RR                               
                     AND TRNFR_TYPE_CD LIKE :WS-PASSED-TFR                      
                     AND DSTBN_SIDE_CD LIKE :WS-PASSED-RD                       
                     AND DLVR_NBR LIKE :WS-PASSED-CBRKR-DEL                     
                     AND RCV_NBR LIKE :WS-PASSED-CBRKR-REC                      
                     AND (STTS_CD    BETWEEN                                    
                         :WS-PASSED-STAT-FR AND :WS-PASSED-STAT-TO)             
                     AND (STTLM_DT   BETWEEN                                    
                          :WS-PASSED-SD-FR AND :WS-PASSED-SD-TO)                
                  ORDER BY                                                      
                     CLIENT_NBR                                                 
                    ,BRANCH_CD                                                  
                    ,ACCT_CD                                                    
                    ,ACAT_CONTROL_NBR                                           
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *  HISTORY TRNFR TABLE DECLARE CURSOR STATEMENT IN DESCENDING    *        
      *  SEQUENCE ORDER BY BRANCH ACCT ACAT#.                          *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE HTRNFR_ENGIN_CSR_D CURSOR FOR                             
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,SBMTG_PRTCP_NBR                                            
                    ,SBMT_PRT_NR_STS_CD                                         
                    ,CONTROL_NBR_STS_CD                                         
                    ,DLVR_NBR                                                   
                    ,DLVR_NBR_STTS_CD                                           
                    ,ACCT_DLVR_NBR                                              
                    ,ACCT_DLVR_STTS_CD                                          
                    ,RCV_NBR                                                    
                    ,RCV_NBR_STTS_CD                                            
                    ,ACCT_RCV_NBR                                               
                    ,ACCT_RCV_STTS_CD                                           
                    ,TRNFR_TYPE_CD                                              
                    ,TRNFR_TYPE_STTS_CD                                         
                    ,TRANS_TYPE_CD                                              
                    ,TRANS_TYPE_STTS_CD                                         
                    ,RCV_CUST_NM                                                
                    ,RCV_CUST_NM_STS_CD                                         
                    ,RCV_SS_PRIM_NBR                                            
                    ,RCV_SS_PRIM_STS_CD                                         
                    ,RCV_SS_SCNDY_NBR                                           
                    ,RCV_SS_SCDY_STS_CD                                         
                    ,RCV_ACCT_TYPE_CD                                           
                    ,RCV_ACT_TYP_STS_CD                                         
                    ,RCV_OCC_BRKR_NBR                                           
                    ,RCV_OCC_STTS_CD                                            
                    ,RCV_CRSPN_NBR                                              
                    ,RCV_CRSPN_STTS_CD                                          
                    ,ACAT_CNTL_ASTD_NBR                                         
                    ,CNTL_ASTD_STTS_CD                                          
                    ,CMNT_TXT                                                   
                    ,CMNT_STTS_CD                                               
                    ,PRCS_DT                                                    
                    ,STTS_CD                                                    
                    ,STTLM_TM_CD                                                
                    ,VAL_FREE_CD                                                
                    ,TRANS_RFRN_ID_CD                                           
                    ,TRANS_RFRN_STTS_CD                                         
                    ,DB_CR_CD                                                   
                    ,DSTBN_SIDE_CD                                              
                    ,SYS_ACT_CD                                                 
                    ,SYS_RJCT_RSN_CD                                            
                    ,TRNFR_TYPE_RJC1_CD                                         
                    ,TRNFR_TYPE_RJC2_CD                                         
                    ,TRNFR_TYPE_RJCT_CD                                         
                    ,TRN_TYP_RJC_STS_CD                                         
                    ,PHSCL_SEQ_NBR                                              
                    ,PHSCL_SEQ_STTS_CD                                          
                    ,LGCL_SEQ_NBR                                               
                    ,LGCL_SEQ_NR_STS_CD                                         
                    ,RR_CD                                                      
                    ,BRANCH_CD                                                  
                    ,DVDND_NAA_CD                                               
                    ,SELL_INSTN_NAA_CD                                          
                    ,CASH_SWEEP_NAA_CD                                          
                    ,PRTCP_CONTRA_CD                                            
                    ,ACM_HOLDER_NAA_CD                                          
                    ,ACCT_ACTIVITY_IND                                          
                    ,ACCT_ORDERS_IND                                            
                    ,ACCT_RJCT_RSBM_IND                                         
                    ,ACCT_DB_BAL_T1_IND                                         
                    ,ACCT_MRGN_DB_IND                                           
                    ,ACCT_SHRT_PSTN_IND                                         
                    ,ACCT_SEC_RSTRD_IND                                         
                    ,ACCT_AST_EXCS_IND                                          
                    ,ACCT_OPTN_PSTN_IND                                         
                    ,ACCT_LTD_PRTNR_IND                                         
                    ,ACCT_TIN_MSMTH_IND                                         
                    ,ACCT_DPLCT_TRN_IND                                         
                    ,ACCT_CUST_70_IND                                           
                    ,ACCT_QULFD_PLN_IND                                         
                    ,ACCT_MNGD_IND                                              
                    ,ACCT_PRVT_RNG_IND                                          
                    ,ACCT_BRKR_TIF_IND                                          
                    ,NSCC_NON_ADP_IND                                           
                    ,CYCLE_CD                                                   
                    ,DAYS_STTS_QTY                                              
                    ,STTLM_DT                                                   
                    ,ACCT_NA_UPDT_IND                                           
                    ,ACCT_TRNFR_FEE_AMT                                         
                    ,ACCT_IRA_TRMNT_AMT                                         
                    ,ACCT_IRA_MAINT_AMT                                         
                    ,ACCT_DLRV_PRGR_IND                                         
                    ,ACCT_CD                                                    
                    ,STTLM_ASCTD_DT                                             
                    ,STTLM_ASCTD_STS_CD                                         
                    ,RCRD_LNGTH_STTS_CD                                         
                    ,RCRD_STTS_CD                                               
                    ,NSCC_PEND_CD                                               
                    ,NSCC_ACK_IND                                               
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,ACCT_EQUITY_AMT                                            
                  FROM                                                          
                     VTRNHSTY                                                   
                  WHERE                                                         
                     CLIENT_NBR = :WS-PASSED-CLT                                
                     AND NOT (BRANCH_CD < :WS-PASSED-BR)                        
                     AND NOT (ACCT_CD < :WS-PASSED-AC)                          
                     AND  ((BRANCH_CD || ACCT_CD || ACAT_CONTROL_NBR)           
                        <  (:WS-PASSED-BR-2 || :WS-PASSED-AC-2 ||               
                            :WS-PASSED-ACAT-2))                                 
                     AND RR_CD LIKE :WS-PASSED-RR                               
                     AND TRNFR_TYPE_CD LIKE :WS-PASSED-TFR                      
                     AND DSTBN_SIDE_CD LIKE :WS-PASSED-RD                       
                     AND DLVR_NBR LIKE :WS-PASSED-CBRKR-DEL                     
                     AND RCV_NBR LIKE :WS-PASSED-CBRKR-REC                      
                     AND (STTS_CD BETWEEN                                       
                         :WS-PASSED-STAT-FR AND :WS-PASSED-STAT-TO)             
                     AND (STTLM_DT   BETWEEN                                    
                          :WS-PASSED-SD-FR AND :WS-PASSED-SD-TO)                
                  ORDER BY                                                      
                     CLIENT_NBR       DESC                                      
                    ,BRANCH_CD        DESC                                      
                    ,ACCT_CD          DESC                                      
                    ,ACAT_CONTROL_NBR DESC                                      
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *   HISTORY TRNFR TABLE DECLARE CURSOR STATEMENT IN ASCENDING    *        
      *   SEQUENCE ORDER BY ACAT#.                                     *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE HTRNFR_ACAT_CSR  CURSOR FOR                               
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,SBMTG_PRTCP_NBR                                            
                    ,SBMT_PRT_NR_STS_CD                                         
                    ,CONTROL_NBR_STS_CD                                         
                    ,DLVR_NBR                                                   
                    ,DLVR_NBR_STTS_CD                                           
                    ,ACCT_DLVR_NBR                                              
                    ,ACCT_DLVR_STTS_CD                                          
                    ,RCV_NBR                                                    
                    ,RCV_NBR_STTS_CD                                            
                    ,ACCT_RCV_NBR                                               
                    ,ACCT_RCV_STTS_CD                                           
                    ,TRNFR_TYPE_CD                                              
                    ,TRNFR_TYPE_STTS_CD                                         
                    ,TRANS_TYPE_CD                                              
                    ,TRANS_TYPE_STTS_CD                                         
                    ,RCV_CUST_NM                                                
                    ,RCV_CUST_NM_STS_CD                                         
                    ,RCV_SS_PRIM_NBR                                            
                    ,RCV_SS_PRIM_STS_CD                                         
                    ,RCV_SS_SCNDY_NBR                                           
                    ,RCV_SS_SCDY_STS_CD                                         
                    ,RCV_ACCT_TYPE_CD                                           
                    ,RCV_ACT_TYP_STS_CD                                         
                    ,RCV_OCC_BRKR_NBR                                           
                    ,RCV_OCC_STTS_CD                                            
                    ,RCV_CRSPN_NBR                                              
                    ,RCV_CRSPN_STTS_CD                                          
                    ,ACAT_CNTL_ASTD_NBR                                         
                    ,CNTL_ASTD_STTS_CD                                          
                    ,CMNT_TXT                                                   
                    ,CMNT_STTS_CD                                               
                    ,PRCS_DT                                                    
                    ,STTS_CD                                                    
                    ,STTLM_TM_CD                                                
                    ,VAL_FREE_CD                                                
                    ,TRANS_RFRN_ID_CD                                           
                    ,TRANS_RFRN_STTS_CD                                         
                    ,DB_CR_CD                                                   
                    ,DSTBN_SIDE_CD                                              
                    ,SYS_ACT_CD                                                 
                    ,SYS_RJCT_RSN_CD                                            
                    ,TRNFR_TYPE_RJC1_CD                                         
                    ,TRNFR_TYPE_RJC2_CD                                         
                    ,TRNFR_TYPE_RJCT_CD                                         
                    ,TRN_TYP_RJC_STS_CD                                         
                    ,PHSCL_SEQ_NBR                                              
                    ,PHSCL_SEQ_STTS_CD                                          
                    ,LGCL_SEQ_NBR                                               
                    ,LGCL_SEQ_NR_STS_CD                                         
                    ,RR_CD                                                      
                    ,BRANCH_CD                                                  
                    ,DVDND_NAA_CD                                               
                    ,SELL_INSTN_NAA_CD                                          
                    ,CASH_SWEEP_NAA_CD                                          
                    ,PRTCP_CONTRA_CD                                            
                    ,ACM_HOLDER_NAA_CD                                          
                    ,ACCT_ACTIVITY_IND                                          
                    ,ACCT_ORDERS_IND                                            
                    ,ACCT_RJCT_RSBM_IND                                         
                    ,ACCT_DB_BAL_T1_IND                                         
                    ,ACCT_MRGN_DB_IND                                           
                    ,ACCT_SHRT_PSTN_IND                                         
                    ,ACCT_SEC_RSTRD_IND                                         
                    ,ACCT_AST_EXCS_IND                                          
                    ,ACCT_OPTN_PSTN_IND                                         
                    ,ACCT_LTD_PRTNR_IND                                         
                    ,ACCT_TIN_MSMTH_IND                                         
                    ,ACCT_DPLCT_TRN_IND                                         
                    ,ACCT_CUST_70_IND                                           
                    ,ACCT_QULFD_PLN_IND                                         
                    ,ACCT_MNGD_IND                                              
                    ,ACCT_PRVT_RNG_IND                                          
                    ,ACCT_BRKR_TIF_IND                                          
                    ,NSCC_NON_ADP_IND                                           
                    ,CYCLE_CD                                                   
                    ,DAYS_STTS_QTY                                              
                    ,STTLM_DT                                                   
                    ,ACCT_NA_UPDT_IND                                           
                    ,ACCT_TRNFR_FEE_AMT                                         
                    ,ACCT_IRA_TRMNT_AMT                                         
                    ,ACCT_IRA_MAINT_AMT                                         
                    ,ACCT_DLRV_PRGR_IND                                         
                    ,ACCT_CD                                                    
                    ,STTLM_ASCTD_DT                                             
                    ,STTLM_ASCTD_STS_CD                                         
                    ,RCRD_LNGTH_STTS_CD                                         
                    ,RCRD_STTS_CD                                               
                    ,NSCC_PEND_CD                                               
                    ,NSCC_ACK_IND                                               
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,ACCT_EQUITY_AMT                                            
                  FROM                                                          
                     VTRNHSTY                                                   
                  WHERE                                                         
                     CLIENT_NBR = :WS-PASSED-CLT                                
                     AND NOT (ACAT_CONTROL_NBR < :WS-PASSED-ACAT)               
                  ORDER BY                                                      
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *   HISTORY TRNFR TABLE DECLARE CURSOR STATEMENT IN ASCENDING    *        
      *   SEQUENCE ORDER BY ACAT#. (VERSION 2)                         *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE HTRNFR_ACAT_CSR2  CURSOR FOR                              
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,SBMTG_PRTCP_NBR                                            
                    ,SBMT_PRT_NR_STS_CD                                         
                    ,CONTROL_NBR_STS_CD                                         
                    ,DLVR_NBR                                                   
                    ,DLVR_NBR_STTS_CD                                           
                    ,ACCT_DLVR_NBR                                              
                    ,ACCT_DLVR_STTS_CD                                          
                    ,RCV_NBR                                                    
                    ,RCV_NBR_STTS_CD                                            
                    ,ACCT_RCV_NBR                                               
                    ,ACCT_RCV_STTS_CD                                           
                    ,TRNFR_TYPE_CD                                              
                    ,TRNFR_TYPE_STTS_CD                                         
                    ,TRANS_TYPE_CD                                              
                    ,TRANS_TYPE_STTS_CD                                         
                    ,RCV_CUST_NM                                                
                    ,RCV_CUST_NM_STS_CD                                         
                    ,RCV_SS_PRIM_NBR                                            
                    ,RCV_SS_PRIM_STS_CD                                         
                    ,RCV_SS_SCNDY_NBR                                           
                    ,RCV_SS_SCDY_STS_CD                                         
                    ,RCV_ACCT_TYPE_CD                                           
                    ,RCV_ACT_TYP_STS_CD                                         
                    ,RCV_OCC_BRKR_NBR                                           
                    ,RCV_OCC_STTS_CD                                            
                    ,RCV_CRSPN_NBR                                              
                    ,RCV_CRSPN_STTS_CD                                          
                    ,ACAT_CNTL_ASTD_NBR                                         
                    ,CNTL_ASTD_STTS_CD                                          
                    ,CMNT_TXT                                                   
                    ,CMNT_STTS_CD                                               
                    ,PRCS_DT                                                    
                    ,STTS_CD                                                    
                    ,STTLM_TM_CD                                                
                    ,VAL_FREE_CD                                                
                    ,TRANS_RFRN_ID_CD                                           
                    ,TRANS_RFRN_STTS_CD                                         
                    ,DB_CR_CD                                                   
                    ,DSTBN_SIDE_CD                                              
                    ,SYS_ACT_CD                                                 
                    ,SYS_RJCT_RSN_CD                                            
                    ,TRNFR_TYPE_RJC1_CD                                         
                    ,TRNFR_TYPE_RJC2_CD                                         
                    ,TRNFR_TYPE_RJCT_CD                                         
                    ,TRN_TYP_RJC_STS_CD                                         
                    ,PHSCL_SEQ_NBR                                              
                    ,PHSCL_SEQ_STTS_CD                                          
                    ,LGCL_SEQ_NBR                                               
                    ,LGCL_SEQ_NR_STS_CD                                         
                    ,RR_CD                                                      
                    ,BRANCH_CD                                                  
                    ,DVDND_NAA_CD                                               
                    ,SELL_INSTN_NAA_CD                                          
                    ,CASH_SWEEP_NAA_CD                                          
                    ,PRTCP_CONTRA_CD                                            
                    ,ACM_HOLDER_NAA_CD                                          
                    ,ACCT_ACTIVITY_IND                                          
                    ,ACCT_ORDERS_IND                                            
                    ,ACCT_RJCT_RSBM_IND                                         
                    ,ACCT_DB_BAL_T1_IND                                         
                    ,ACCT_MRGN_DB_IND                                           
                    ,ACCT_SHRT_PSTN_IND                                         
                    ,ACCT_SEC_RSTRD_IND                                         
                    ,ACCT_AST_EXCS_IND                                          
                    ,ACCT_OPTN_PSTN_IND                                         
                    ,ACCT_LTD_PRTNR_IND                                         
                    ,ACCT_TIN_MSMTH_IND                                         
                    ,ACCT_DPLCT_TRN_IND                                         
                    ,ACCT_CUST_70_IND                                           
                    ,ACCT_QULFD_PLN_IND                                         
                    ,ACCT_MNGD_IND                                              
                    ,ACCT_PRVT_RNG_IND                                          
                    ,ACCT_BRKR_TIF_IND                                          
                    ,NSCC_NON_ADP_IND                                           
                    ,CYCLE_CD                                                   
                    ,DAYS_STTS_QTY                                              
                    ,STTLM_DT                                                   
                    ,ACCT_NA_UPDT_IND                                           
                    ,ACCT_TRNFR_FEE_AMT                                         
                    ,ACCT_IRA_TRMNT_AMT                                         
                    ,ACCT_IRA_MAINT_AMT                                         
                    ,ACCT_DLRV_PRGR_IND                                         
                    ,ACCT_CD                                                    
                    ,STTLM_ASCTD_DT                                             
                    ,STTLM_ASCTD_STS_CD                                         
                    ,RCRD_LNGTH_STTS_CD                                         
                    ,RCRD_STTS_CD                                               
                    ,NSCC_PEND_CD                                               
                    ,NSCC_ACK_IND                                               
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,ACCT_EQUITY_AMT                                            
                  FROM                                                          
                     VTRNHSTY                                                   
                  WHERE                                                         
                     CLIENT_NBR = :WS-PASSED-CLT                                
                     AND ACAT_CONTROL_NBR > :WS-PASSED-ACAT                     
                  ORDER BY                                                      
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *   HISTORY TRNFR TABLE DECLARE CURSOR STATEMENT IN DESCENDING   *        
      *   SEQUENCE ORDER BY ACAT#.                                     *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE HTRNFR_ACAT_CSR_D  CURSOR FOR                             
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,SBMTG_PRTCP_NBR                                            
                    ,SBMT_PRT_NR_STS_CD                                         
                    ,CONTROL_NBR_STS_CD                                         
                    ,DLVR_NBR                                                   
                    ,DLVR_NBR_STTS_CD                                           
                    ,ACCT_DLVR_NBR                                              
                    ,ACCT_DLVR_STTS_CD                                          
                    ,RCV_NBR                                                    
                    ,RCV_NBR_STTS_CD                                            
                    ,ACCT_RCV_NBR                                               
                    ,ACCT_RCV_STTS_CD                                           
                    ,TRNFR_TYPE_CD                                              
                    ,TRNFR_TYPE_STTS_CD                                         
                    ,TRANS_TYPE_CD                                              
                    ,TRANS_TYPE_STTS_CD                                         
                    ,RCV_CUST_NM                                                
                    ,RCV_CUST_NM_STS_CD                                         
                    ,RCV_SS_PRIM_NBR                                            
                    ,RCV_SS_PRIM_STS_CD                                         
                    ,RCV_SS_SCNDY_NBR                                           
                    ,RCV_SS_SCDY_STS_CD                                         
                    ,RCV_ACCT_TYPE_CD                                           
                    ,RCV_ACT_TYP_STS_CD                                         
                    ,RCV_OCC_BRKR_NBR                                           
                    ,RCV_OCC_STTS_CD                                            
                    ,RCV_CRSPN_NBR                                              
                    ,RCV_CRSPN_STTS_CD                                          
                    ,ACAT_CNTL_ASTD_NBR                                         
                    ,CNTL_ASTD_STTS_CD                                          
                    ,CMNT_TXT                                                   
                    ,CMNT_STTS_CD                                               
                    ,PRCS_DT                                                    
                    ,STTS_CD                                                    
                    ,STTLM_TM_CD                                                
                    ,VAL_FREE_CD                                                
                    ,TRANS_RFRN_ID_CD                                           
                    ,TRANS_RFRN_STTS_CD                                         
                    ,DB_CR_CD                                                   
                    ,DSTBN_SIDE_CD                                              
                    ,SYS_ACT_CD                                                 
                    ,SYS_RJCT_RSN_CD                                            
                    ,TRNFR_TYPE_RJC1_CD                                         
                    ,TRNFR_TYPE_RJC2_CD                                         
                    ,TRNFR_TYPE_RJCT_CD                                         
                    ,TRN_TYP_RJC_STS_CD                                         
                    ,PHSCL_SEQ_NBR                                              
                    ,PHSCL_SEQ_STTS_CD                                          
                    ,LGCL_SEQ_NBR                                               
                    ,LGCL_SEQ_NR_STS_CD                                         
                    ,RR_CD                                                      
                    ,BRANCH_CD                                                  
                    ,DVDND_NAA_CD                                               
                    ,SELL_INSTN_NAA_CD                                          
                    ,CASH_SWEEP_NAA_CD                                          
                    ,PRTCP_CONTRA_CD                                            
                    ,ACM_HOLDER_NAA_CD                                          
                    ,ACCT_ACTIVITY_IND                                          
                    ,ACCT_ORDERS_IND                                            
                    ,ACCT_RJCT_RSBM_IND                                         
                    ,ACCT_DB_BAL_T1_IND                                         
                    ,ACCT_MRGN_DB_IND                                           
                    ,ACCT_SHRT_PSTN_IND                                         
                    ,ACCT_SEC_RSTRD_IND                                         
                    ,ACCT_AST_EXCS_IND                                          
                    ,ACCT_OPTN_PSTN_IND                                         
                    ,ACCT_LTD_PRTNR_IND                                         
                    ,ACCT_TIN_MSMTH_IND                                         
                    ,ACCT_DPLCT_TRN_IND                                         
                    ,ACCT_CUST_70_IND                                           
                    ,ACCT_QULFD_PLN_IND                                         
                    ,ACCT_MNGD_IND                                              
                    ,ACCT_PRVT_RNG_IND                                          
                    ,ACCT_BRKR_TIF_IND                                          
                    ,NSCC_NON_ADP_IND                                           
                    ,CYCLE_CD                                                   
                    ,DAYS_STTS_QTY                                              
                    ,STTLM_DT                                                   
                    ,ACCT_NA_UPDT_IND                                           
                    ,ACCT_TRNFR_FEE_AMT                                         
                    ,ACCT_IRA_TRMNT_AMT                                         
                    ,ACCT_IRA_MAINT_AMT                                         
                    ,ACCT_DLRV_PRGR_IND                                         
                    ,ACCT_CD                                                    
                    ,STTLM_ASCTD_DT                                             
                    ,STTLM_ASCTD_STS_CD                                         
                    ,RCRD_LNGTH_STTS_CD                                         
                    ,RCRD_STTS_CD                                               
                    ,NSCC_PEND_CD                                               
                    ,NSCC_ACK_IND                                               
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,ACCT_EQUITY_AMT                                            
                  FROM                                                          
                     VTRNHSTY                                                   
                  WHERE                                                         
                     CLIENT_NBR = :WS-PASSED-CLT                                
                     AND NOT (ACAT_CONTROL_NBR < :WS-PASSED-ACAT)               
                     AND     (ACAT_CONTROL_NBR < :WS-PASSED-ACAT-2)             
                  ORDER BY                                                      
                     CLIENT_NBR       DESC                                      
                    ,ACAT_CONTROL_NBR DESC                                      
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *                                                                         
      *----------------------------------------------------------------*        
      *       HISTORY ASSET TABLE DECLARE CURSOR STATEMENT             *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  HASSET_CSR CURSOR FOR                                    
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,ASSET_SEQ_NBR                                              
                    ,CONTROL_NBR_STS_CD                                         
                    ,DLVR_NBR_STTS_CD                                           
                    ,RCV_NBR_STTS_CD                                            
                    ,SBMTG_PRTCP_NBR                                            
                    ,SBMT_PRT_NR_STS_CD                                         
                    ,AST_SEQ_NBR_STS_CD                                         
                    ,SYS_ACT_CD                                                 
                    ,SYS_RJCT_RSN_CD                                            
                    ,TRANS_TYPE_CD                                              
                    ,TRANS_TYPE_STTS_CD                                         
                    ,PHSCL_SEQ_NBR                                              
                    ,PHSCL_SEQ_STTS_CD                                          
                    ,LGCL_SEQ_NBR                                               
                    ,LGCL_SEQ_NR_STS_CD                                         
                    ,ASSET_PRC_CTGY_CD                                          
                    ,AST_PRC_CTG_STS_CD                                         
                    ,STTLM_LCTN_CD                                              
                    ,STTLM_LCTN_STTS_CD                                         
                    ,STTLM_RSN_CD                                               
                    ,STTLM_RSN_STTS_CD                                          
                    ,ISIN_CNTRY_CD                                              
                    ,ISIN_CNTRY_STTS_CD                                         
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,ISIN_SEC_IS_STS_CD                                         
                    ,ISIN_SEC_CDG_CD                                            
                    ,ISIN_SEC_CD_STS_CD                                         
                    ,ASSET_DESC_TXT                                             
                    ,ASSET_DESC_STTS_CD                                         
                    ,ASSET_RQST_QTY_CD                                          
                    ,ASSET_RQST_STS_CD                                          
                    ,AST_RQST_TRANS_CD                                          
                    ,AST_RQ_TRAN_STS_CD                                         
                    ,ASSET_QTY                                                  
                    ,ASSET_QTY_STTS_CD                                          
                    ,ASSET_PCT                                                  
                    ,ASSET_PCT_STTS_CD                                          
                    ,PSTN_CD                                                    
                    ,PSTN_CD_STTS_CD                                            
                    ,ISO_CRNCY_CD                                               
                    ,ISO_CRNCY_STTS_CD                                          
                    ,ASSET_AMT                                                  
                    ,ASSET_AMT_STTS_CD                                          
                    ,BEARER_BOND_CD                                             
                    ,BEARER_BND_STTS_CD                                         
                    ,CSH_MGN_SHRT_CD                                            
                    ,CSH_MRG_SHT_STS_CD                                         
                    ,WHI_CD                                                     
                    ,WHI_STTS_CD                                                
                    ,TRNFR_TYPE_RSN_CD                                          
                    ,TRN_TYP_RSN_STS_CD                                         
                    ,MBS_SERIAL_NBR                                             
                    ,MBS_SERIAL_STTS_CD                                         
                    ,ASSET_CMNT_TXT                                             
                    ,ASSET_CMNT_STTS_CD                                         
                    ,NSCC_ACK_IND                                               
                    ,NSCC_PEND_CD                                               
                    ,FAIL_SENT_CAGE_IND                                         
                    ,FAIL_OPEN_CAGE_IND                                         
                    ,NSCC_NON_ADP_IND                                           
                    ,TRANS_RFRN_ID_CD                                           
                    ,TRANS_RFRN_STTS_CD                                         
                    ,OPTN_CTGY_CD                                               
                    ,OPTN_CTGY_STTS_CD                                          
                    ,RCRD_LNGTH_STTS_CD                                         
                    ,RCRD_STTS_CD                                               
                    ,ISIN_SEC_EXCPT_IND                                         
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,SECURITY_ADP_NBR                                           
                    ,RCL_SENT_NSCC_IND                                          
                    ,FRV_SENT_NSCC_IND                                          
                    ,TRNFR_TYPE_CD                                              
ET0001              ,CAGE_TAG_NBR                                               
                  FROM                                                          
                     VASTHSTY                                                   
                  WHERE                                                         
                     CLIENT_NBR = :WS-PASSED-CLT                                
                     AND ACAT_CONTROL_NBR = :WS-PASSED-ACAT                     
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
       EJECT                                                                    
                                                                                
       LINKAGE SECTION.                                                         
       01  DFHCOMMAREA.                                                         
       COPY ACAT25IO.                                                           
       EJECT                                                                    
      *                                                                         
       PROCEDURE DIVISION.                                                      
           MOVE ACAT25-PASS-FLDS TO WS-PASSED-DATA-AREA.                        
           EXEC SQL                                                             
              SET :WS-TIMESTAMP = CURRENT TIMESTAMP                             
           END-EXEC.                                                            
      *                                                                         
           EVALUATE TRUE                                                        
              WHEN ACAT25-GET-TRNFR                                             
                   PERFORM 0100-GET-TRNFR-TBL                                   
                                                                                
              WHEN ACAT25-OPN-TRN-ENGIN-CSR                                     
                   PERFORM 0200-OPEN-TRNFR-ENGIN-CSR                            
              WHEN ACAT25-FET-TRN-ENGIN-CSR                                     
                   PERFORM 0300-FETCH-TRNFR-ENGIN-CSR                           
              WHEN ACAT25-CLO-TRN-ENGIN-CSR                                     
                   PERFORM 0400-CLOSE-TRNFR-ENGIN-CSR                           
              WHEN ACAT25-OPN-TRN-ACAT-CSR                                      
                   PERFORM 0500-OPEN-TRNFR-ACAT-CSR                             
              WHEN ACAT25-FET-TRN-ACAT-CSR                                      
                   PERFORM 0600-FETCH-TRNFR-ACAT-CSR                            
              WHEN ACAT25-CLO-TRN-ACAT-CSR                                      
                   PERFORM 0700-CLOSE-TRNFR-ACAT-CSR                            
                                                                                
              WHEN ACAT25-OPN-ASSET-CSR                                         
                   PERFORM 0800-OPEN-ASSET-CURSOR                               
              WHEN ACAT25-FET-ASSET-CSR                                         
                   PERFORM 0900-FETCH-ASSET-CURSOR                              
              WHEN ACAT25-CLO-ASSET-CSR                                         
                   PERFORM 1000-CLOSE-ASSET-CURSOR                              
                                                                                
              WHEN ACAT25-GET-HST-TRNFR                                         
                   PERFORM 1100-GET-HST-TRNFR                                   
                                                                                
              WHEN ACAT25-OPN-HTRN-ENGIN-CSR                                    
                   PERFORM 1200-OPEN-HTRNFR-ENGIN-CSR                           
              WHEN ACAT25-FET-HTRN-ENGIN-CSR                                    
                   PERFORM 1300-FETCH-HTRNFR-ENGIN-CSR                          
              WHEN ACAT25-CLO-HTRN-ENGIN-CSR                                    
                   PERFORM 1400-CLOSE-HTRNFR-ENGIN-CSR                          
              WHEN ACAT25-OPN-HTRN-ACAT-CSR                                     
                   PERFORM 1500-OPEN-HTRNFR-ACAT-CSR                            
              WHEN ACAT25-FET-HTRN-ACAT-CSR                                     
                   PERFORM 1600-FETCH-HTRNFR-ACAT-CSR                           
              WHEN ACAT25-CLO-HTRN-ACAT-CSR                                     
                   PERFORM 1700-CLOSE-HTRNFR-ACAT-CSR                           
                                                                                
              WHEN ACAT25-OPN-HST-ASSET-CSR                                     
                   PERFORM 1800-OPEN-HST-ASSET-CSR                              
              WHEN ACAT25-FET-HST-ASSET-CSR                                     
                   PERFORM 1900-FETCH-HST-ASSET-CSR                             
              WHEN ACAT25-CLO-HST-ASSET-CSR                                     
                   PERFORM 2000-CLOSE-HST-ASSET-CSR                             
                                                                                
              WHEN ACAT25-OPN-TRN-ENGIN-CSR-D                                   
                   PERFORM 2100-OPEN-TRNFR-ENGIN-CSR-D                          
              WHEN ACAT25-FET-TRN-ENGIN-CSR-D                                   
                   PERFORM 2200-FETCH-TRNFR-ENGIN-CSR-D                         
              WHEN ACAT25-CLO-TRN-ENGIN-CSR-D                                   
                   PERFORM 2300-CLOSE-TRNFR-ENGIN-CSR-D                         
              WHEN ACAT25-OPN-TRN-ACAT-CSR-D                                    
                   PERFORM 2400-OPEN-TRNFR-ACAT-CSR-D                           
              WHEN ACAT25-FET-TRN-ACAT-CSR-D                                    
                   PERFORM 2500-FETCH-TRNFR-ACAT-CSR-D                          
              WHEN ACAT25-CLO-TRN-ACAT-CSR-D                                    
                   PERFORM 2600-CLOSE-TRNFR-ACAT-CSR-D                          
                                                                                
              WHEN ACAT25-OPN-HTRN-ENGIN-CSR-D                                  
                   PERFORM 2700-OPEN-HTRNFR-ENGIN-CSR-D                         
              WHEN ACAT25-FET-HTRN-ENGIN-CSR-D                                  
                   PERFORM 2800-FETCH-HTRNFR-ENGIN-CSR-D                        
              WHEN ACAT25-CLO-HTRN-ENGIN-CSR-D                                  
                   PERFORM 2900-CLOSE-HTRNFR-ENGIN-CSR-D                        
              WHEN ACAT25-OPN-HTRN-ACAT-CSR-D                                   
                   PERFORM 3000-OPEN-HTRNFR-ACAT-CSR-D                          
              WHEN ACAT25-FET-HTRN-ACAT-CSR-D                                   
                   PERFORM 3100-FETCH-HTRNFR-ACAT-CSR-D                         
              WHEN ACAT25-CLO-HTRN-ACAT-CSR-D                                   
                   PERFORM 3200-CLOSE-HTRNFR-ACAT-CSR-D                         
                                                                                
              WHEN ACAT25-OPN-TRN-ENGIN-CSR2                                    
                   PERFORM 3300-OPEN-TRNFR-ENGIN-CSR2                           
              WHEN ACAT25-FET-TRN-ENGIN-CSR2                                    
                   PERFORM 3400-FETCH-TRNFR-ENGIN-CSR2                          
              WHEN ACAT25-CLO-TRN-ENGIN-CSR2                                    
                   PERFORM 3500-CLOSE-TRNFR-ENGIN-CSR2                          
              WHEN ACAT25-OPN-TRN-ACAT-CSR2                                     
                   PERFORM 3600-OPEN-TRNFR-ACAT-CSR2                            
              WHEN ACAT25-FET-TRN-ACAT-CSR2                                     
                   PERFORM 3700-FETCH-TRNFR-ACAT-CSR2                           
              WHEN ACAT25-CLO-TRN-ACAT-CSR2                                     
                   PERFORM 3800-CLOSE-TRNFR-ACAT-CSR2                           
                                                                                
              WHEN ACAT25-OPN-HTRN-ENGIN-CSR2                                   
                   PERFORM 3900-OPEN-HTRNFR-ENGIN-CSR2                          
              WHEN ACAT25-FET-HTRN-ENGIN-CSR2                                   
                   PERFORM 4000-FETCH-HTRNFR-ENGIN-CSR2                         
              WHEN ACAT25-CLO-HTRN-ENGIN-CSR2                                   
                   PERFORM 4100-CLOSE-HTRNFR-ENGIN-CSR2                         
              WHEN ACAT25-OPN-HTRN-ACAT-CSR2                                    
                   PERFORM 4200-OPEN-HTRNFR-ACAT-CSR2                           
              WHEN ACAT25-FET-HTRN-ACAT-CSR2                                    
                   PERFORM 4300-FETCH-HTRNFR-ACAT-CSR2                          
              WHEN ACAT25-CLO-HTRN-ACAT-CSR2                                    
                   PERFORM 4400-CLOSE-HTRNFR-ACAT-CSR2                          
           END-EVALUATE.                                                        
                                                                                
           EXEC CICS RETURN                                                     
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          GET ACTIVE TRANSFER                                 *          
      *--------------------------------------------------------------*          
       0100-GET-TRNFR-TBL.                                                      
           INITIALIZE DCLVTRNFR.                                                
           EXEC SQL                                                             
              SELECT                                                            
                  CLIENT_NBR                                                    
                 ,ACAT_CONTROL_NBR                                              
                 ,SBMTG_PRTCP_NBR                                               
                 ,SBMT_PRT_NR_STS_CD                                            
                 ,CONTROL_NBR_STS_CD                                            
                 ,DLVR_NBR                                                      
                 ,DLVR_NBR_STTS_CD                                              
                 ,ACCT_DLVR_NBR                                                 
                 ,ACCT_DLVR_STTS_CD                                             
                 ,RCV_NBR                                                       
                 ,RCV_NBR_STTS_CD                                               
                 ,ACCT_RCV_NBR                                                  
                 ,ACCT_RCV_STTS_CD                                              
                 ,TRNFR_TYPE_CD                                                 
                 ,TRNFR_TYPE_STTS_CD                                            
                 ,TRANS_TYPE_CD                                                 
                 ,TRANS_TYPE_STTS_CD                                            
                 ,RCV_CUST_NM                                                   
                 ,RCV_CUST_NM_STS_CD                                            
                 ,RCV_SS_PRIM_NBR                                               
                 ,RCV_SS_PRIM_STS_CD                                            
                 ,RCV_SS_SCNDY_NBR                                              
                 ,RCV_SS_SCDY_STS_CD                                            
                 ,RCV_ACCT_TYPE_CD                                              
                 ,RCV_ACT_TYP_STS_CD                                            
                 ,RCV_OCC_BRKR_NBR                                              
                 ,RCV_OCC_STTS_CD                                               
                 ,RCV_CRSPN_NBR                                                 
                 ,RCV_CRSPN_STTS_CD                                             
                 ,ACAT_CNTL_ASTD_NBR                                            
                 ,CNTL_ASTD_STTS_CD                                             
                 ,CMNT_TXT                                                      
                 ,CMNT_STTS_CD                                                  
                 ,PRCS_DT                                                       
                 ,STTS_CD                                                       
                 ,STTLM_TM_CD                                                   
                 ,VAL_FREE_CD                                                   
                 ,TRANS_RFRN_ID_CD                                              
                 ,TRANS_RFRN_STTS_CD                                            
                 ,DB_CR_CD                                                      
                 ,DSTBN_SIDE_CD                                                 
                 ,SYS_ACT_CD                                                    
                 ,SYS_RJCT_RSN_CD                                               
                 ,TRNFR_TYPE_RJC1_CD                                            
                 ,TRNFR_TYPE_RJC2_CD                                            
                 ,TRNFR_TYPE_RJCT_CD                                            
                 ,TRN_TYP_RJC_STS_CD                                            
                 ,PHSCL_SEQ_NBR                                                 
                 ,PHSCL_SEQ_STTS_CD                                             
                 ,LGCL_SEQ_NBR                                                  
                 ,LGCL_SEQ_NR_STS_CD                                            
                 ,RR_CD                                                         
                 ,BRANCH_CD                                                     
                 ,DVDND_NAA_CD                                                  
                 ,SELL_INSTN_NAA_CD                                             
                 ,CASH_SWEEP_NAA_CD                                             
                 ,PRTCP_CONTRA_CD                                               
                 ,ACM_HOLDER_NAA_CD                                             
                 ,ACCT_ACTIVITY_IND                                             
                 ,ACCT_ORDERS_IND                                               
                 ,ACCT_RJCT_RSBM_IND                                            
                 ,ACCT_DB_BAL_T1_IND                                            
                 ,ACCT_MRGN_DB_IND                                              
                 ,ACCT_SHRT_PSTN_IND                                            
                 ,ACCT_SEC_RSTRD_IND                                            
                 ,ACCT_AST_EXCS_IND                                             
                 ,ACCT_OPTN_PSTN_IND                                            
                 ,ACCT_LTD_PRTNR_IND                                            
                 ,ACCT_TIN_MSMTH_IND                                            
                 ,ACCT_DPLCT_TRN_IND                                            
                 ,ACCT_CUST_70_IND                                              
                 ,ACCT_QULFD_PLN_IND                                            
                 ,ACCT_MNGD_IND                                                 
                 ,ACCT_PRVT_RNG_IND                                             
                 ,ACCT_BRKR_TIF_IND                                             
                 ,NSCC_NON_ADP_IND                                              
                 ,CYCLE_CD                                                      
                 ,DAYS_STTS_QTY                                                 
                 ,STTLM_DT                                                      
                 ,ACCT_NA_UPDT_IND                                              
                 ,ACCT_TRNFR_FEE_AMT                                            
                 ,ACCT_IRA_TRMNT_AMT                                            
                 ,ACCT_IRA_MAINT_AMT                                            
                 ,ACCT_DLRV_PRGR_IND                                            
                 ,ACCT_CD                                                       
                 ,STTLM_ASCTD_DT                                                
                 ,STTLM_ASCTD_STS_CD                                            
                 ,RCRD_LNGTH_STTS_CD                                            
                 ,RCRD_STTS_CD                                                  
                 ,NSCC_PEND_CD                                                  
                 ,NSCC_ACK_IND                                                  
                 ,CICS_TERM_ID_CD                                               
                 ,PRGM_NM                                                       
                 ,CRT_TMSTP                                                     
                 ,UPDT_TMSTP                                                    
                 ,ACCT_EQUITY_AMT                                               
                 ,ALERT_IND                                                     
              INTO                                                              
                  :DCLVTRNFR.CLIENT-NBR                                         
                 ,:DCLVTRNFR.ACAT-CONTROL-NBR                                   
                 ,:DCLVTRNFR.SBMTG-PRTCP-NBR                                    
                 ,:DCLVTRNFR.SBMT-PRT-NR-STS-CD                                 
                 ,:DCLVTRNFR.CONTROL-NBR-STS-CD                                 
                 ,:DCLVTRNFR.DLVR-NBR                                           
                 ,:DCLVTRNFR.DLVR-NBR-STTS-CD                                   
                 ,:DCLVTRNFR.ACCT-DLVR-NBR                                      
                 ,:DCLVTRNFR.ACCT-DLVR-STTS-CD                                  
                 ,:DCLVTRNFR.RCV-NBR                                            
                 ,:DCLVTRNFR.RCV-NBR-STTS-CD                                    
                 ,:DCLVTRNFR.ACCT-RCV-NBR                                       
                 ,:DCLVTRNFR.ACCT-RCV-STTS-CD                                   
                 ,:DCLVTRNFR.TRNFR-TYPE-CD                                      
                 ,:DCLVTRNFR.TRNFR-TYPE-STTS-CD                                 
                 ,:DCLVTRNFR.TRANS-TYPE-CD                                      
                 ,:DCLVTRNFR.TRANS-TYPE-STTS-CD                                 
                 ,:DCLVTRNFR.RCV-CUST-NM                                        
                 ,:DCLVTRNFR.RCV-CUST-NM-STS-CD                                 
                 ,:DCLVTRNFR.RCV-SS-PRIM-NBR                                    
                 ,:DCLVTRNFR.RCV-SS-PRIM-STS-CD                                 
                 ,:DCLVTRNFR.RCV-SS-SCNDY-NBR                                   
                 ,:DCLVTRNFR.RCV-SS-SCDY-STS-CD                                 
                 ,:DCLVTRNFR.RCV-ACCT-TYPE-CD                                   
                 ,:DCLVTRNFR.RCV-ACT-TYP-STS-CD                                 
                 ,:DCLVTRNFR.RCV-OCC-BRKR-NBR                                   
                 ,:DCLVTRNFR.RCV-OCC-STTS-CD                                    
                 ,:DCLVTRNFR.RCV-CRSPN-NBR                                      
                 ,:DCLVTRNFR.RCV-CRSPN-STTS-CD                                  
                 ,:DCLVTRNFR.ACAT-CNTL-ASTD-NBR                                 
                 ,:DCLVTRNFR.CNTL-ASTD-STTS-CD                                  
                 ,:DCLVTRNFR.CMNT-TXT                                           
                 ,:DCLVTRNFR.CMNT-STTS-CD                                       
                 ,:DCLVTRNFR.PRCS-DT                                            
                 ,:DCLVTRNFR.STTS-CD                                            
                 ,:DCLVTRNFR.STTLM-TM-CD                                        
                 ,:DCLVTRNFR.VAL-FREE-CD                                        
                 ,:DCLVTRNFR.TRANS-RFRN-ID-CD                                   
                 ,:DCLVTRNFR.TRANS-RFRN-STTS-CD                                 
                 ,:DCLVTRNFR.DB-CR-CD                                           
                 ,:DCLVTRNFR.DSTBN-SIDE-CD                                      
                 ,:DCLVTRNFR.SYS-ACT-CD                                         
                 ,:DCLVTRNFR.SYS-RJCT-RSN-CD                                    
                 ,:DCLVTRNFR.TRNFR-TYPE-RJC1-CD                                 
                 ,:DCLVTRNFR.TRNFR-TYPE-RJC2-CD                                 
                 ,:DCLVTRNFR.TRNFR-TYPE-RJCT-CD                                 
                 ,:DCLVTRNFR.TRN-TYP-RJC-STS-CD                                 
                 ,:DCLVTRNFR.PHSCL-SEQ-NBR                                      
                 ,:DCLVTRNFR.PHSCL-SEQ-STTS-CD                                  
                 ,:DCLVTRNFR.LGCL-SEQ-NBR                                       
                 ,:DCLVTRNFR.LGCL-SEQ-NR-STS-CD                                 
                 ,:DCLVTRNFR.RR-CD                                              
                 ,:DCLVTRNFR.BRANCH-CD                                          
                 ,:DCLVTRNFR.DVDND-NAA-CD                                       
                 ,:DCLVTRNFR.SELL-INSTN-NAA-CD                                  
                 ,:DCLVTRNFR.CASH-SWEEP-NAA-CD                                  
                 ,:DCLVTRNFR.PRTCP-CONTRA-CD                                    
                 ,:DCLVTRNFR.ACM-HOLDER-NAA-CD                                  
                 ,:DCLVTRNFR.ACCT-ACTIVITY-IND                                  
                 ,:DCLVTRNFR.ACCT-ORDERS-IND                                    
                 ,:DCLVTRNFR.ACCT-RJCT-RSBM-IND                                 
                 ,:DCLVTRNFR.ACCT-DB-BAL-T1-IND                                 
                 ,:DCLVTRNFR.ACCT-MRGN-DB-IND                                   
                 ,:DCLVTRNFR.ACCT-SHRT-PSTN-IND                                 
                 ,:DCLVTRNFR.ACCT-SEC-RSTRD-IND                                 
                 ,:DCLVTRNFR.ACCT-AST-EXCS-IND                                  
                 ,:DCLVTRNFR.ACCT-OPTN-PSTN-IND                                 
                 ,:DCLVTRNFR.ACCT-LTD-PRTNR-IND                                 
                 ,:DCLVTRNFR.ACCT-TIN-MSMTH-IND                                 
                 ,:DCLVTRNFR.ACCT-DPLCT-TRN-IND                                 
                 ,:DCLVTRNFR.ACCT-CUST-70-IND                                   
                 ,:DCLVTRNFR.ACCT-QULFD-PLN-IND                                 
                 ,:DCLVTRNFR.ACCT-MNGD-IND                                      
                 ,:DCLVTRNFR.ACCT-PRVT-RNG-IND                                  
                 ,:DCLVTRNFR.ACCT-BRKR-TIF-IND                                  
                 ,:DCLVTRNFR.NSCC-NON-ADP-IND                                   
                 ,:DCLVTRNFR.CYCLE-CD                                           
                 ,:DCLVTRNFR.DAYS-STTS-QTY                                      
                 ,:DCLVTRNFR.STTLM-DT                                           
                 ,:DCLVTRNFR.ACCT-NA-UPDT-IND                                   
                 ,:DCLVTRNFR.ACCT-TRNFR-FEE-AMT                                 
                 ,:DCLVTRNFR.ACCT-IRA-TRMNT-AMT                                 
                 ,:DCLVTRNFR.ACCT-IRA-MAINT-AMT                                 
                 ,:DCLVTRNFR.ACCT-DLRV-PRGR-IND                                 
                 ,:DCLVTRNFR.ACCT-CD                                            
                 ,:DCLVTRNFR.STTLM-ASCTD-DT                                     
                 ,:DCLVTRNFR.STTLM-ASCTD-STS-CD                                 
                 ,:DCLVTRNFR.RCRD-LNGTH-STTS-CD                                 
                 ,:DCLVTRNFR.RCRD-STTS-CD                                       
                 ,:DCLVTRNFR.NSCC-PEND-CD                                       
                 ,:DCLVTRNFR.NSCC-ACK-IND                                       
                 ,:DCLVTRNFR.CICS-TERM-ID-CD                                    
                 ,:DCLVTRNFR.PRGM-NM                                            
                 ,:DCLVTRNFR.CRT-TMSTP                                          
                 ,:DCLVTRNFR.UPDT-TMSTP                                         
                 ,:DCLVTRNFR.ACCT-EQUITY-AMT                                    
                 ,:DCLVTRNFR.ALERT-IND                                          
              FROM                                                              
                 VTRNFR                                                         
             WHERE                                                              
                 CLIENT_NBR = :ACAT25-PASS-CLT                                  
                 AND  ACAT_CONTROL_NBR = :ACAT25-PASS-ACAT                      
             WITH UR                                                            
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
              PERFORM 0110-SETUP-TRNFR-RET-DATA                                 
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT25IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          SETUP ACTIVE TRANSFER RETURN DATA                   *          
      *--------------------------------------------------------------*          
       0110-SETUP-TRNFR-RET-DATA.                                               
           INITIALIZE  ACAT25-TFR-RET-DATA.                                     
           MOVE CLIENT-NBR       OF DCLVTRNFR TO ACAT25-TFR-CLT.                
           MOVE ACAT-CONTROL-NBR OF DCLVTRNFR TO ACAT25-TFR-ACAT.               
           MOVE DLVR-NBR         OF DCLVTRNFR TO ACAT25-TFR-DLVR-NBR.           
           MOVE ACCT-DLVR-NBR    OF DCLVTRNFR TO ACAT25-TFR-DLVR-ACCT.          
           MOVE RCV-NBR          OF DCLVTRNFR TO ACAT25-TFR-RCV-NBR.            
           MOVE ACCT-RCV-NBR     OF DCLVTRNFR TO ACAT25-TFR-RCV-ACCT.           
           MOVE TRNFR-TYPE-CD    OF DCLVTRNFR TO ACAT25-TFR-TFR-TYPE.           
           MOVE TRANS-TYPE-CD    OF DCLVTRNFR TO ACAT25-TFR-TRANS-TYPE.         
           MOVE RCV-CUST-NM      OF DCLVTRNFR TO ACAT25-TFR-NAME.               
           MOVE RCV-ACCT-TYPE-CD OF DCLVTRNFR TO ACAT25-TFR-ACCT-TYPE.          
           MOVE CMNT-TXT         OF DCLVTRNFR TO ACAT25-TFR-CMNT.               
           MOVE STTS-CD          OF DCLVTRNFR TO ACAT25-TFR-STTS.               
           MOVE DSTBN-SIDE-CD    OF DCLVTRNFR TO ACAT25-TFR-DSTBN.              
           MOVE RR-CD            OF DCLVTRNFR TO ACAT25-TFR-RR.                 
           MOVE BRANCH-CD        OF DCLVTRNFR TO ACAT25-TFR-BRANCH.             
           MOVE DAYS-STTS-QTY    OF DCLVTRNFR TO ACAT25-TFR-DAYS-STTS.          
           MOVE STTLM-DT         OF DCLVTRNFR TO ACAT25-TFR-STTLM-DT.           
           MOVE ACCT-CD          OF DCLVTRNFR TO ACAT25-TFR-ACCOUNT.            
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  OPEN PENDIG TRANSFER CUSRSOR TBL (IN ORDER BY SRCH ENGINE)  *          
      *--------------------------------------------------------------*          
       0200-OPEN-TRNFR-ENGIN-CSR.                                               
           IF WS-PASSED-TO-BR < '100'                                           
              MOVE '100' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '150'                                           
              MOVE '150' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '200'                                           
              MOVE '200' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '250'                                           
              MOVE '250' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '300'                                           
              MOVE '300' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '350'                                           
              MOVE '350' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '400'                                           
              MOVE '400' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '450'                                           
              MOVE '450' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '500'                                           
              MOVE '500' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '550'                                           
              MOVE '550' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '600'                                           
              MOVE '600' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '650'                                           
              MOVE '650' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '700'                                           
              MOVE '700' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '750'                                           
              MOVE '750' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '800'                                           
              MOVE '800' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '850'                                           
              MOVE '850' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '900'                                           
              MOVE '900' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
              MOVE HIGH-VALUES TO WS-PASSED-TO-BR                               
           END-IF.                                                              
           MOVE WS-PASSED-TO-BR TO ACAT25-PASS-TO-BR.                           
           EXEC SQL                                                             
              OPEN TRNFR_ENGIN_CSR                                              
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
           ELSE                                                                 
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  FETCH PENDIG TRANSFER CUSRSOR TBL (IN ORDER BY SRCH ENGINE) *          
      *--------------------------------------------------------------*          
       0300-FETCH-TRNFR-ENGIN-CSR.                                              
           EXEC SQL                                                             
              FETCH                                                             
                  TRNFR_ENGIN_CSR                                               
              INTO                                                              
                  :DCLVTRNFR.CLIENT-NBR                                         
                 ,:DCLVTRNFR.ACAT-CONTROL-NBR                                   
                 ,:DCLVTRNFR.SBMTG-PRTCP-NBR                                    
                 ,:DCLVTRNFR.SBMT-PRT-NR-STS-CD                                 
                 ,:DCLVTRNFR.CONTROL-NBR-STS-CD                                 
                 ,:DCLVTRNFR.DLVR-NBR                                           
                 ,:DCLVTRNFR.DLVR-NBR-STTS-CD                                   
                 ,:DCLVTRNFR.ACCT-DLVR-NBR                                      
                 ,:DCLVTRNFR.ACCT-DLVR-STTS-CD                                  
                 ,:DCLVTRNFR.RCV-NBR                                            
                 ,:DCLVTRNFR.RCV-NBR-STTS-CD                                    
                 ,:DCLVTRNFR.ACCT-RCV-NBR                                       
                 ,:DCLVTRNFR.ACCT-RCV-STTS-CD                                   
                 ,:DCLVTRNFR.TRNFR-TYPE-CD                                      
                 ,:DCLVTRNFR.TRNFR-TYPE-STTS-CD                                 
                 ,:DCLVTRNFR.TRANS-TYPE-CD                                      
                 ,:DCLVTRNFR.TRANS-TYPE-STTS-CD                                 
                 ,:DCLVTRNFR.RCV-CUST-NM                                        
                 ,:DCLVTRNFR.RCV-CUST-NM-STS-CD                                 
                 ,:DCLVTRNFR.RCV-SS-PRIM-NBR                                    
                 ,:DCLVTRNFR.RCV-SS-PRIM-STS-CD                                 
                 ,:DCLVTRNFR.RCV-SS-SCNDY-NBR                                   
                 ,:DCLVTRNFR.RCV-SS-SCDY-STS-CD                                 
                 ,:DCLVTRNFR.RCV-ACCT-TYPE-CD                                   
                 ,:DCLVTRNFR.RCV-ACT-TYP-STS-CD                                 
                 ,:DCLVTRNFR.RCV-OCC-BRKR-NBR                                   
                 ,:DCLVTRNFR.RCV-OCC-STTS-CD                                    
                 ,:DCLVTRNFR.RCV-CRSPN-NBR                                      
                 ,:DCLVTRNFR.RCV-CRSPN-STTS-CD                                  
                 ,:DCLVTRNFR.ACAT-CNTL-ASTD-NBR                                 
                 ,:DCLVTRNFR.CNTL-ASTD-STTS-CD                                  
                 ,:DCLVTRNFR.CMNT-TXT                                           
                 ,:DCLVTRNFR.CMNT-STTS-CD                                       
                 ,:DCLVTRNFR.PRCS-DT                                            
                 ,:DCLVTRNFR.STTS-CD                                            
                 ,:DCLVTRNFR.STTLM-TM-CD                                        
                 ,:DCLVTRNFR.VAL-FREE-CD                                        
                 ,:DCLVTRNFR.TRANS-RFRN-ID-CD                                   
                 ,:DCLVTRNFR.TRANS-RFRN-STTS-CD                                 
                 ,:DCLVTRNFR.DB-CR-CD                                           
                 ,:DCLVTRNFR.DSTBN-SIDE-CD                                      
                 ,:DCLVTRNFR.SYS-ACT-CD                                         
                 ,:DCLVTRNFR.SYS-RJCT-RSN-CD                                    
                 ,:DCLVTRNFR.TRNFR-TYPE-RJC1-CD                                 
                 ,:DCLVTRNFR.TRNFR-TYPE-RJC2-CD                                 
                 ,:DCLVTRNFR.TRNFR-TYPE-RJCT-CD                                 
                 ,:DCLVTRNFR.TRN-TYP-RJC-STS-CD                                 
                 ,:DCLVTRNFR.PHSCL-SEQ-NBR                                      
                 ,:DCLVTRNFR.PHSCL-SEQ-STTS-CD                                  
                 ,:DCLVTRNFR.LGCL-SEQ-NBR                                       
                 ,:DCLVTRNFR.LGCL-SEQ-NR-STS-CD                                 
                 ,:DCLVTRNFR.RR-CD                                              
                 ,:DCLVTRNFR.BRANCH-CD                                          
                 ,:DCLVTRNFR.DVDND-NAA-CD                                       
                 ,:DCLVTRNFR.SELL-INSTN-NAA-CD                                  
                 ,:DCLVTRNFR.CASH-SWEEP-NAA-CD                                  
                 ,:DCLVTRNFR.PRTCP-CONTRA-CD                                    
                 ,:DCLVTRNFR.ACM-HOLDER-NAA-CD                                  
                 ,:DCLVTRNFR.ACCT-ACTIVITY-IND                                  
                 ,:DCLVTRNFR.ACCT-ORDERS-IND                                    
                 ,:DCLVTRNFR.ACCT-RJCT-RSBM-IND                                 
                 ,:DCLVTRNFR.ACCT-DB-BAL-T1-IND                                 
                 ,:DCLVTRNFR.ACCT-MRGN-DB-IND                                   
                 ,:DCLVTRNFR.ACCT-SHRT-PSTN-IND                                 
                 ,:DCLVTRNFR.ACCT-SEC-RSTRD-IND                                 
                 ,:DCLVTRNFR.ACCT-AST-EXCS-IND                                  
                 ,:DCLVTRNFR.ACCT-OPTN-PSTN-IND                                 
                 ,:DCLVTRNFR.ACCT-LTD-PRTNR-IND                                 
                 ,:DCLVTRNFR.ACCT-TIN-MSMTH-IND                                 
                 ,:DCLVTRNFR.ACCT-DPLCT-TRN-IND                                 
                 ,:DCLVTRNFR.ACCT-CUST-70-IND                                   
                 ,:DCLVTRNFR.ACCT-QULFD-PLN-IND                                 
                 ,:DCLVTRNFR.ACCT-MNGD-IND                                      
                 ,:DCLVTRNFR.ACCT-PRVT-RNG-IND                                  
                 ,:DCLVTRNFR.ACCT-BRKR-TIF-IND                                  
                 ,:DCLVTRNFR.NSCC-NON-ADP-IND                                   
                 ,:DCLVTRNFR.CYCLE-CD                                           
                 ,:DCLVTRNFR.DAYS-STTS-QTY                                      
                 ,:DCLVTRNFR.STTLM-DT                                           
                 ,:DCLVTRNFR.ACCT-NA-UPDT-IND                                   
                 ,:DCLVTRNFR.ACCT-TRNFR-FEE-AMT                                 
                 ,:DCLVTRNFR.ACCT-IRA-TRMNT-AMT                                 
                 ,:DCLVTRNFR.ACCT-IRA-MAINT-AMT                                 
                 ,:DCLVTRNFR.ACCT-DLRV-PRGR-IND                                 
                 ,:DCLVTRNFR.ACCT-CD                                            
                 ,:DCLVTRNFR.STTLM-ASCTD-DT                                     
                 ,:DCLVTRNFR.STTLM-ASCTD-STS-CD                                 
                 ,:DCLVTRNFR.RCRD-LNGTH-STTS-CD                                 
                 ,:DCLVTRNFR.RCRD-STTS-CD                                       
                 ,:DCLVTRNFR.NSCC-PEND-CD                                       
                 ,:DCLVTRNFR.NSCC-ACK-IND                                       
                 ,:DCLVTRNFR.CICS-TERM-ID-CD                                    
                 ,:DCLVTRNFR.PRGM-NM                                            
                 ,:DCLVTRNFR.CRT-TMSTP                                          
                 ,:DCLVTRNFR.UPDT-TMSTP                                         
                 ,:DCLVTRNFR.ACCT-EQUITY-AMT                                    
                 ,:DCLVTRNFR.ALERT-IND                                          
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
              PERFORM 0110-SETUP-TRNFR-RET-DATA                                 
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              IF WS-PASSED-TO-BR NOT = HIGH-VALUES                              
                 PERFORM 0400-CLOSE-TRNFR-ENGIN-CSR                             
                 MOVE WS-PASSED-TO-BR TO WS-PASSED-BR                           
                 PERFORM 0200-OPEN-TRNFR-ENGIN-CSR                              
                 GO TO 0300-FETCH-TRNFR-ENGIN-CSR                               
              END-IF                                                            
              SET ACAT25IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
              PERFORM 0400-CLOSE-TRNFR-ENGIN-CSR                                
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *   CLOSE PENDIG TRANSFER CUSRSOR TBL (IN ORDER BY SRCH ENGINE)*          
      *--------------------------------------------------------------*          
       0400-CLOSE-TRNFR-ENGIN-CSR.                                              
           EXEC SQL                                                             
              CLOSE TRNFR_ENGIN_CSR                                             
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
           ELSE                                                                 
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *    OPEN PENDIG TRANSFER CUSRSOR TBL (IN ORDER BY ACAT#)      *          
      *--------------------------------------------------------------*          
       0500-OPEN-TRNFR-ACAT-CSR.                                                
           EXEC SQL                                                             
              OPEN TRNFR_ACAT_CSR                                               
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
           ELSE                                                                 
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *   FETCH PENDIG TRANSFER CUSRSOR TBL (IN ORDER BY ACAT#)      *          
      *--------------------------------------------------------------*          
       0600-FETCH-TRNFR-ACAT-CSR.                                               
           EXEC SQL                                                             
              FETCH                                                             
                  TRNFR_ACAT_CSR                                                
              INTO                                                              
                  :DCLVTRNFR.CLIENT-NBR                                         
                 ,:DCLVTRNFR.ACAT-CONTROL-NBR                                   
                 ,:DCLVTRNFR.SBMTG-PRTCP-NBR                                    
                 ,:DCLVTRNFR.SBMT-PRT-NR-STS-CD                                 
                 ,:DCLVTRNFR.CONTROL-NBR-STS-CD                                 
                 ,:DCLVTRNFR.DLVR-NBR                                           
                 ,:DCLVTRNFR.DLVR-NBR-STTS-CD                                   
                 ,:DCLVTRNFR.ACCT-DLVR-NBR                                      
                 ,:DCLVTRNFR.ACCT-DLVR-STTS-CD                                  
                 ,:DCLVTRNFR.RCV-NBR                                            
                 ,:DCLVTRNFR.RCV-NBR-STTS-CD                                    
                 ,:DCLVTRNFR.ACCT-RCV-NBR                                       
                 ,:DCLVTRNFR.ACCT-RCV-STTS-CD                                   
                 ,:DCLVTRNFR.TRNFR-TYPE-CD                                      
                 ,:DCLVTRNFR.TRNFR-TYPE-STTS-CD                                 
                 ,:DCLVTRNFR.TRANS-TYPE-CD                                      
                 ,:DCLVTRNFR.TRANS-TYPE-STTS-CD                                 
                 ,:DCLVTRNFR.RCV-CUST-NM                                        
                 ,:DCLVTRNFR.RCV-CUST-NM-STS-CD                                 
                 ,:DCLVTRNFR.RCV-SS-PRIM-NBR                                    
                 ,:DCLVTRNFR.RCV-SS-PRIM-STS-CD                                 
                 ,:DCLVTRNFR.RCV-SS-SCNDY-NBR                                   
                 ,:DCLVTRNFR.RCV-SS-SCDY-STS-CD                                 
                 ,:DCLVTRNFR.RCV-ACCT-TYPE-CD                                   
                 ,:DCLVTRNFR.RCV-ACT-TYP-STS-CD                                 
                 ,:DCLVTRNFR.RCV-OCC-BRKR-NBR                                   
                 ,:DCLVTRNFR.RCV-OCC-STTS-CD                                    
                 ,:DCLVTRNFR.RCV-CRSPN-NBR                                      
                 ,:DCLVTRNFR.RCV-CRSPN-STTS-CD                                  
                 ,:DCLVTRNFR.ACAT-CNTL-ASTD-NBR                                 
                 ,:DCLVTRNFR.CNTL-ASTD-STTS-CD                                  
                 ,:DCLVTRNFR.CMNT-TXT                                           
                 ,:DCLVTRNFR.CMNT-STTS-CD                                       
                 ,:DCLVTRNFR.PRCS-DT                                            
                 ,:DCLVTRNFR.STTS-CD                                            
                 ,:DCLVTRNFR.STTLM-TM-CD                                        
                 ,:DCLVTRNFR.VAL-FREE-CD                                        
                 ,:DCLVTRNFR.TRANS-RFRN-ID-CD                                   
                 ,:DCLVTRNFR.TRANS-RFRN-STTS-CD                                 
                 ,:DCLVTRNFR.DB-CR-CD                                           
                 ,:DCLVTRNFR.DSTBN-SIDE-CD                                      
                 ,:DCLVTRNFR.SYS-ACT-CD                                         
                 ,:DCLVTRNFR.SYS-RJCT-RSN-CD                                    
                 ,:DCLVTRNFR.TRNFR-TYPE-RJC1-CD                                 
                 ,:DCLVTRNFR.TRNFR-TYPE-RJC2-CD                                 
                 ,:DCLVTRNFR.TRNFR-TYPE-RJCT-CD                                 
                 ,:DCLVTRNFR.TRN-TYP-RJC-STS-CD                                 
                 ,:DCLVTRNFR.PHSCL-SEQ-NBR                                      
                 ,:DCLVTRNFR.PHSCL-SEQ-STTS-CD                                  
                 ,:DCLVTRNFR.LGCL-SEQ-NBR                                       
                 ,:DCLVTRNFR.LGCL-SEQ-NR-STS-CD                                 
                 ,:DCLVTRNFR.RR-CD                                              
                 ,:DCLVTRNFR.BRANCH-CD                                          
                 ,:DCLVTRNFR.DVDND-NAA-CD                                       
                 ,:DCLVTRNFR.SELL-INSTN-NAA-CD                                  
                 ,:DCLVTRNFR.CASH-SWEEP-NAA-CD                                  
                 ,:DCLVTRNFR.PRTCP-CONTRA-CD                                    
                 ,:DCLVTRNFR.ACM-HOLDER-NAA-CD                                  
                 ,:DCLVTRNFR.ACCT-ACTIVITY-IND                                  
                 ,:DCLVTRNFR.ACCT-ORDERS-IND                                    
                 ,:DCLVTRNFR.ACCT-RJCT-RSBM-IND                                 
                 ,:DCLVTRNFR.ACCT-DB-BAL-T1-IND                                 
                 ,:DCLVTRNFR.ACCT-MRGN-DB-IND                                   
                 ,:DCLVTRNFR.ACCT-SHRT-PSTN-IND                                 
                 ,:DCLVTRNFR.ACCT-SEC-RSTRD-IND                                 
                 ,:DCLVTRNFR.ACCT-AST-EXCS-IND                                  
                 ,:DCLVTRNFR.ACCT-OPTN-PSTN-IND                                 
                 ,:DCLVTRNFR.ACCT-LTD-PRTNR-IND                                 
                 ,:DCLVTRNFR.ACCT-TIN-MSMTH-IND                                 
                 ,:DCLVTRNFR.ACCT-DPLCT-TRN-IND                                 
                 ,:DCLVTRNFR.ACCT-CUST-70-IND                                   
                 ,:DCLVTRNFR.ACCT-QULFD-PLN-IND                                 
                 ,:DCLVTRNFR.ACCT-MNGD-IND                                      
                 ,:DCLVTRNFR.ACCT-PRVT-RNG-IND                                  
                 ,:DCLVTRNFR.ACCT-BRKR-TIF-IND                                  
                 ,:DCLVTRNFR.NSCC-NON-ADP-IND                                   
                 ,:DCLVTRNFR.CYCLE-CD                                           
                 ,:DCLVTRNFR.DAYS-STTS-QTY                                      
                 ,:DCLVTRNFR.STTLM-DT                                           
                 ,:DCLVTRNFR.ACCT-NA-UPDT-IND                                   
                 ,:DCLVTRNFR.ACCT-TRNFR-FEE-AMT                                 
                 ,:DCLVTRNFR.ACCT-IRA-TRMNT-AMT                                 
                 ,:DCLVTRNFR.ACCT-IRA-MAINT-AMT                                 
                 ,:DCLVTRNFR.ACCT-DLRV-PRGR-IND                                 
                 ,:DCLVTRNFR.ACCT-CD                                            
                 ,:DCLVTRNFR.STTLM-ASCTD-DT                                     
                 ,:DCLVTRNFR.STTLM-ASCTD-STS-CD                                 
                 ,:DCLVTRNFR.RCRD-LNGTH-STTS-CD                                 
                 ,:DCLVTRNFR.RCRD-STTS-CD                                       
                 ,:DCLVTRNFR.NSCC-PEND-CD                                       
                 ,:DCLVTRNFR.NSCC-ACK-IND                                       
                 ,:DCLVTRNFR.CICS-TERM-ID-CD                                    
                 ,:DCLVTRNFR.PRGM-NM                                            
                 ,:DCLVTRNFR.CRT-TMSTP                                          
                 ,:DCLVTRNFR.UPDT-TMSTP                                         
                 ,:DCLVTRNFR.ACCT-EQUITY-AMT                                    
                 ,:DCLVTRNFR.ALERT-IND                                          
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
              PERFORM 0110-SETUP-TRNFR-RET-DATA                                 
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT25IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
              PERFORM 0700-CLOSE-TRNFR-ACAT-CSR                                 
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *   CLOSE PENDIG TRANSFER CUSRSOR TBL (IN ORDER BY ACAT#)      *          
      *--------------------------------------------------------------*          
       0700-CLOSE-TRNFR-ACAT-CSR.                                               
           EXEC SQL                                                             
              CLOSE TRNFR_ACAT_CSR                                              
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
           ELSE                                                                 
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          OPEN ACTIVE ASSET CURSOR TABLE                      *          
      *--------------------------------------------------------------*          
       0800-OPEN-ASSET-CURSOR.                                                  
           EXEC SQL                                                             
              OPEN ASSET_CSR                                                    
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
           ELSE                                                                 
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *         FETCH ACTIVE ASSET CURSOR TABLE                      *          
      *--------------------------------------------------------------*          
       0900-FETCH-ASSET-CURSOR.                                                 
           EXEC SQL                                                             
              FETCH                                                             
                  ASSET_CSR                                                     
              INTO                                                              
                  :DCLVASSET.CLIENT-NBR                                         
                 ,:DCLVASSET.ACAT-CONTROL-NBR                                   
                 ,:DCLVASSET.ASSET-SEQ-NBR                                      
                 ,:DCLVASSET.CONTROL-NBR-STS-CD                                 
                 ,:DCLVASSET.DLVR-NBR-STTS-CD                                   
                 ,:DCLVASSET.RCV-NBR-STTS-CD                                    
                 ,:DCLVASSET.SBMTG-PRTCP-NBR                                    
                 ,:DCLVASSET.SBMT-PRT-NR-STS-CD                                 
                 ,:DCLVASSET.AST-SEQ-NBR-STS-CD                                 
                 ,:DCLVASSET.SYS-ACT-CD                                         
                 ,:DCLVASSET.SYS-RJCT-RSN-CD                                    
                 ,:DCLVASSET.TRANS-TYPE-CD                                      
                 ,:DCLVASSET.TRANS-TYPE-STTS-CD                                 
                 ,:DCLVASSET.PHSCL-SEQ-NBR                                      
                 ,:DCLVASSET.PHSCL-SEQ-STTS-CD                                  
                 ,:DCLVASSET.LGCL-SEQ-NBR                                       
                 ,:DCLVASSET.LGCL-SEQ-NR-STS-CD                                 
                 ,:DCLVASSET.ASSET-PRC-CTGY-CD                                  
                 ,:DCLVASSET.AST-PRC-CTG-STS-CD                                 
                 ,:DCLVASSET.STTLM-LCTN-CD                                      
                 ,:DCLVASSET.STTLM-LCTN-STTS-CD                                 
                 ,:DCLVASSET.STTLM-RSN-CD                                       
                 ,:DCLVASSET.STTLM-RSN-STTS-CD                                  
                 ,:DCLVASSET.ISIN-CNTRY-CD                                      
                 ,:DCLVASSET.ISIN-CNTRY-STTS-CD                                 
                 ,:DCLVASSET.ISIN-SEC-ISSUE-CD                                  
                 ,:DCLVASSET.ISIN-SEC-IS-STS-CD                                 
                 ,:DCLVASSET.ISIN-SEC-CDG-CD                                    
                 ,:DCLVASSET.ISIN-SEC-CD-STS-CD                                 
                 ,:DCLVASSET.ASSET-DESC-TXT                                     
                 ,:DCLVASSET.ASSET-DESC-STTS-CD                                 
                 ,:DCLVASSET.ASSET-RQST-QTY-CD                                  
                 ,:DCLVASSET.ASSET-RQST-STS-CD                                  
                 ,:DCLVASSET.AST-RQST-TRANS-CD                                  
                 ,:DCLVASSET.AST-RQ-TRAN-STS-CD                                 
                 ,:DCLVASSET.ASSET-QTY                                          
                 ,:DCLVASSET.ASSET-QTY-STTS-CD                                  
                 ,:DCLVASSET.ASSET-PCT                                          
                 ,:DCLVASSET.ASSET-PCT-STTS-CD                                  
                 ,:DCLVASSET.PSTN-CD                                            
                 ,:DCLVASSET.PSTN-CD-STTS-CD                                    
                 ,:DCLVASSET.ISO-CRNCY-CD                                       
                 ,:DCLVASSET.ISO-CRNCY-STTS-CD                                  
                 ,:DCLVASSET.ASSET-AMT                                          
                 ,:DCLVASSET.ASSET-AMT-STTS-CD                                  
                 ,:DCLVASSET.BEARER-BOND-CD                                     
                 ,:DCLVASSET.BEARER-BND-STTS-CD                                 
                 ,:DCLVASSET.CSH-MGN-SHRT-CD                                    
                 ,:DCLVASSET.CSH-MRG-SHT-STS-CD                                 
                 ,:DCLVASSET.WHI-CD                                             
                 ,:DCLVASSET.WHI-STTS-CD                                        
                 ,:DCLVASSET.TRNFR-TYPE-RSN-CD                                  
                 ,:DCLVASSET.TRN-TYP-RSN-STS-CD                                 
                 ,:DCLVASSET.MBS-SERIAL-NBR                                     
                 ,:DCLVASSET.MBS-SERIAL-STTS-CD                                 
                 ,:DCLVASSET.ASSET-CMNT-TXT                                     
                 ,:DCLVASSET.ASSET-CMNT-STTS-CD                                 
                 ,:DCLVASSET.NSCC-ACK-IND                                       
                 ,:DCLVASSET.NSCC-PEND-CD                                       
                 ,:DCLVASSET.FAIL-SENT-CAGE-IND                                 
                 ,:DCLVASSET.FAIL-OPEN-CAGE-IND                                 
                 ,:DCLVASSET.NSCC-NON-ADP-IND                                   
                 ,:DCLVASSET.TRANS-RFRN-ID-CD                                   
                 ,:DCLVASSET.TRANS-RFRN-STTS-CD                                 
                 ,:DCLVASSET.OPTN-CTGY-CD                                       
                 ,:DCLVASSET.OPTN-CTGY-STTS-CD                                  
                 ,:DCLVASSET.RCRD-LNGTH-STTS-CD                                 
                 ,:DCLVASSET.RCRD-STTS-CD                                       
                 ,:DCLVASSET.ISIN-SEC-EXCPT-IND                                 
                 ,:DCLVASSET.CRT-TMSTP                                          
                 ,:DCLVASSET.UPDT-TMSTP                                         
                 ,:DCLVASSET.CICS-TERM-ID-CD                                    
                 ,:DCLVASSET.PRGM-NM                                            
                 ,:DCLVASSET.SECURITY-ADP-NBR                                   
                 ,:DCLVASSET.RCL-SENT-NSCC-IND                                  
                 ,:DCLVASSET.FRV-SENT-NSCC-IND                                  
                 ,:DCLVASSET.TRNFR-TYPE-CD                                      
                 ,:DCLVASSET.TRNFR-TYPE-STTS-CD                                 
ET0001           ,:DCLVASSET.RESTRICTED-IND                                     
ET0001           ,:DCLVASSET.CAGE-TAG-NBR                                       
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
              PERFORM 0910-SETUP-ASSET-RET-DATA                                 
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT25IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
              PERFORM 1000-CLOSE-ASSET-CURSOR                                   
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *         SETUP ASSET RETURN DATA                              *          
      *--------------------------------------------------------------*          
       0910-SETUP-ASSET-RET-DATA.                                               
           INITIALIZE ACAT25-ASSET-RET-DATA.                                    
           MOVE CLIENT-NBR        OF DCLVASSET TO ACAT25-AST-CLT.               
           MOVE ACAT-CONTROL-NBR  OF DCLVASSET TO ACAT25-AST-ACAT.              
           MOVE ASSET-SEQ-NBR     OF DCLVASSET TO ACAT25-AST-SEQ-NBR.           
           MOVE ASSET-PRC-CTGY-CD OF DCLVASSET TO ACAT25-AST-PRC-CTGY.          
           MOVE STTLM-LCTN-CD     OF DCLVASSET TO ACAT25-AST-STTLM-LCTN.        
           MOVE STTLM-RSN-CD      OF DCLVASSET TO ACAT25-AST-STTLM-RSN.         
           MOVE ISIN-SEC-ISSUE-CD OF DCLVASSET TO ACAT25-AST-SECURITY.          
           MOVE ASSET-DESC-TXT    OF DCLVASSET TO ACAT25-AST-DESCRIPT.          
           MOVE ASSET-QTY         OF DCLVASSET TO ACAT25-AST-ASSET-QTY.         
           MOVE ASSET-AMT         OF DCLVASSET TO ACAT25-AST-ASSET-AMT.         
           MOVE PSTN-CD           OF DCLVASSET TO ACAT25-AST-PSTN-CD.           
           MOVE CSH-MGN-SHRT-CD   OF DCLVASSET TO ACAT25-AST-CS-MG-SH.          
           MOVE WHI-CD            OF DCLVASSET TO ACAT25-AST-WHI-CD.            
           MOVE ASSET-CMNT-TXT    OF DCLVASSET TO ACAT25-AST-COMMENT.           
           MOVE OPTN-CTGY-CD      OF DCLVASSET TO ACAT25-AST-OPTN-CTGY.         
           MOVE SECURITY-ADP-NBR  OF DCLVASSET TO ACAT25-AST-ADP-NBR.           
           MOVE TRNFR-TYPE-CD     OF DCLVASSET TO ACAT25-AST-TRNFR-TYPE.        
ET0001     MOVE CAGE-TAG-NBR      OF DCLVASSET TO ACAT25-AST-CAGE-TAG.          
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          CLOSE ACTIVE ASSET CURSOR TABLE                     *          
      *--------------------------------------------------------------*          
       1000-CLOSE-ASSET-CURSOR.                                                 
           EXEC SQL                                                             
              CLOSE ASSET_CSR                                                   
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
           ELSE                                                                 
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          GET HISTORY TRANSFER                                *          
      *--------------------------------------------------------------*          
       1100-GET-HST-TRNFR.                                                      
           INITIALIZE DCLVTRNHSTY.                                              
           EXEC SQL                                                             
              SELECT                                                            
                  CLIENT_NBR                                                    
                 ,ACAT_CONTROL_NBR                                              
                 ,SBMTG_PRTCP_NBR                                               
                 ,SBMT_PRT_NR_STS_CD                                            
                 ,CONTROL_NBR_STS_CD                                            
                 ,DLVR_NBR                                                      
                 ,DLVR_NBR_STTS_CD                                              
                 ,ACCT_DLVR_NBR                                                 
                 ,ACCT_DLVR_STTS_CD                                             
                 ,RCV_NBR                                                       
                 ,RCV_NBR_STTS_CD                                               
                 ,ACCT_RCV_NBR                                                  
                 ,ACCT_RCV_STTS_CD                                              
                 ,TRNFR_TYPE_CD                                                 
                 ,TRNFR_TYPE_STTS_CD                                            
                 ,TRANS_TYPE_CD                                                 
                 ,TRANS_TYPE_STTS_CD                                            
                 ,RCV_CUST_NM                                                   
                 ,RCV_CUST_NM_STS_CD                                            
                 ,RCV_SS_PRIM_NBR                                               
                 ,RCV_SS_PRIM_STS_CD                                            
                 ,RCV_SS_SCNDY_NBR                                              
                 ,RCV_SS_SCDY_STS_CD                                            
                 ,RCV_ACCT_TYPE_CD                                              
                 ,RCV_ACT_TYP_STS_CD                                            
                 ,RCV_OCC_BRKR_NBR                                              
                 ,RCV_OCC_STTS_CD                                               
                 ,RCV_CRSPN_NBR                                                 
                 ,RCV_CRSPN_STTS_CD                                             
                 ,ACAT_CNTL_ASTD_NBR                                            
                 ,CNTL_ASTD_STTS_CD                                             
                 ,CMNT_TXT                                                      
                 ,CMNT_STTS_CD                                                  
                 ,PRCS_DT                                                       
                 ,STTS_CD                                                       
                 ,STTLM_TM_CD                                                   
                 ,VAL_FREE_CD                                                   
                 ,TRANS_RFRN_ID_CD                                              
                 ,TRANS_RFRN_STTS_CD                                            
                 ,DB_CR_CD                                                      
                 ,DSTBN_SIDE_CD                                                 
                 ,SYS_ACT_CD                                                    
                 ,SYS_RJCT_RSN_CD                                               
                 ,TRNFR_TYPE_RJC1_CD                                            
                 ,TRNFR_TYPE_RJC2_CD                                            
                 ,TRNFR_TYPE_RJCT_CD                                            
                 ,TRN_TYP_RJC_STS_CD                                            
                 ,PHSCL_SEQ_NBR                                                 
                 ,PHSCL_SEQ_STTS_CD                                             
                 ,LGCL_SEQ_NBR                                                  
                 ,LGCL_SEQ_NR_STS_CD                                            
                 ,RR_CD                                                         
                 ,BRANCH_CD                                                     
                 ,DVDND_NAA_CD                                                  
                 ,SELL_INSTN_NAA_CD                                             
                 ,CASH_SWEEP_NAA_CD                                             
                 ,PRTCP_CONTRA_CD                                               
                 ,ACM_HOLDER_NAA_CD                                             
                 ,ACCT_ACTIVITY_IND                                             
                 ,ACCT_ORDERS_IND                                               
                 ,ACCT_RJCT_RSBM_IND                                            
                 ,ACCT_DB_BAL_T1_IND                                            
                 ,ACCT_MRGN_DB_IND                                              
                 ,ACCT_SHRT_PSTN_IND                                            
                 ,ACCT_SEC_RSTRD_IND                                            
                 ,ACCT_AST_EXCS_IND                                             
                 ,ACCT_OPTN_PSTN_IND                                            
                 ,ACCT_LTD_PRTNR_IND                                            
                 ,ACCT_TIN_MSMTH_IND                                            
                 ,ACCT_DPLCT_TRN_IND                                            
                 ,ACCT_CUST_70_IND                                              
                 ,ACCT_QULFD_PLN_IND                                            
                 ,ACCT_MNGD_IND                                                 
                 ,ACCT_PRVT_RNG_IND                                             
                 ,ACCT_BRKR_TIF_IND                                             
                 ,NSCC_NON_ADP_IND                                              
                 ,CYCLE_CD                                                      
                 ,DAYS_STTS_QTY                                                 
                 ,STTLM_DT                                                      
                 ,ACCT_NA_UPDT_IND                                              
                 ,ACCT_TRNFR_FEE_AMT                                            
                 ,ACCT_IRA_TRMNT_AMT                                            
                 ,ACCT_IRA_MAINT_AMT                                            
                 ,ACCT_DLRV_PRGR_IND                                            
                 ,ACCT_CD                                                       
                 ,STTLM_ASCTD_DT                                                
                 ,STTLM_ASCTD_STS_CD                                            
                 ,RCRD_LNGTH_STTS_CD                                            
                 ,RCRD_STTS_CD                                                  
                 ,NSCC_PEND_CD                                                  
                 ,NSCC_ACK_IND                                                  
                 ,CICS_TERM_ID_CD                                               
                 ,PRGM_NM                                                       
                 ,CRT_TMSTP                                                     
                 ,UPDT_TMSTP                                                    
                 ,ACCT_EQUITY_AMT                                               
              INTO                                                              
                  :DCLVTRNHSTY.CLIENT-NBR                                       
                 ,:DCLVTRNHSTY.ACAT-CONTROL-NBR                                 
                 ,:DCLVTRNHSTY.SBMTG-PRTCP-NBR                                  
                 ,:DCLVTRNHSTY.SBMT-PRT-NR-STS-CD                               
                 ,:DCLVTRNHSTY.CONTROL-NBR-STS-CD                               
                 ,:DCLVTRNHSTY.DLVR-NBR                                         
                 ,:DCLVTRNHSTY.DLVR-NBR-STTS-CD                                 
                 ,:DCLVTRNHSTY.ACCT-DLVR-NBR                                    
                 ,:DCLVTRNHSTY.ACCT-DLVR-STTS-CD                                
                 ,:DCLVTRNHSTY.RCV-NBR                                          
                 ,:DCLVTRNHSTY.RCV-NBR-STTS-CD                                  
                 ,:DCLVTRNHSTY.ACCT-RCV-NBR                                     
                 ,:DCLVTRNHSTY.ACCT-RCV-STTS-CD                                 
                 ,:DCLVTRNHSTY.TRNFR-TYPE-CD                                    
                 ,:DCLVTRNHSTY.TRNFR-TYPE-STTS-CD                               
                 ,:DCLVTRNHSTY.TRANS-TYPE-CD                                    
                 ,:DCLVTRNHSTY.TRANS-TYPE-STTS-CD                               
                 ,:DCLVTRNHSTY.RCV-CUST-NM                                      
                 ,:DCLVTRNHSTY.RCV-CUST-NM-STS-CD                               
                 ,:DCLVTRNHSTY.RCV-SS-PRIM-NBR                                  
                 ,:DCLVTRNHSTY.RCV-SS-PRIM-STS-CD                               
                 ,:DCLVTRNHSTY.RCV-SS-SCNDY-NBR                                 
                 ,:DCLVTRNHSTY.RCV-SS-SCDY-STS-CD                               
                 ,:DCLVTRNHSTY.RCV-ACCT-TYPE-CD                                 
                 ,:DCLVTRNHSTY.RCV-ACT-TYP-STS-CD                               
                 ,:DCLVTRNHSTY.RCV-OCC-BRKR-NBR                                 
                 ,:DCLVTRNHSTY.RCV-OCC-STTS-CD                                  
                 ,:DCLVTRNHSTY.RCV-CRSPN-NBR                                    
                 ,:DCLVTRNHSTY.RCV-CRSPN-STTS-CD                                
                 ,:DCLVTRNHSTY.ACAT-CNTL-ASTD-NBR                               
                 ,:DCLVTRNHSTY.CNTL-ASTD-STTS-CD                                
                 ,:DCLVTRNHSTY.CMNT-TXT                                         
                 ,:DCLVTRNHSTY.CMNT-STTS-CD                                     
                 ,:DCLVTRNHSTY.PRCS-DT                                          
                 ,:DCLVTRNHSTY.STTS-CD                                          
                 ,:DCLVTRNHSTY.STTLM-TM-CD                                      
                 ,:DCLVTRNHSTY.VAL-FREE-CD                                      
                 ,:DCLVTRNHSTY.TRANS-RFRN-ID-CD                                 
                 ,:DCLVTRNHSTY.TRANS-RFRN-STTS-CD                               
                 ,:DCLVTRNHSTY.DB-CR-CD                                         
                 ,:DCLVTRNHSTY.DSTBN-SIDE-CD                                    
                 ,:DCLVTRNHSTY.SYS-ACT-CD                                       
                 ,:DCLVTRNHSTY.SYS-RJCT-RSN-CD                                  
                 ,:DCLVTRNHSTY.TRNFR-TYPE-RJC1-CD                               
                 ,:DCLVTRNHSTY.TRNFR-TYPE-RJC2-CD                               
                 ,:DCLVTRNHSTY.TRNFR-TYPE-RJCT-CD                               
                 ,:DCLVTRNHSTY.TRN-TYP-RJC-STS-CD                               
                 ,:DCLVTRNHSTY.PHSCL-SEQ-NBR                                    
                 ,:DCLVTRNHSTY.PHSCL-SEQ-STTS-CD                                
                 ,:DCLVTRNHSTY.LGCL-SEQ-NBR                                     
                 ,:DCLVTRNHSTY.LGCL-SEQ-NR-STS-CD                               
                 ,:DCLVTRNHSTY.RR-CD                                            
                 ,:DCLVTRNHSTY.BRANCH-CD                                        
                 ,:DCLVTRNHSTY.DVDND-NAA-CD                                     
                 ,:DCLVTRNHSTY.SELL-INSTN-NAA-CD                                
                 ,:DCLVTRNHSTY.CASH-SWEEP-NAA-CD                                
                 ,:DCLVTRNHSTY.PRTCP-CONTRA-CD                                  
                 ,:DCLVTRNHSTY.ACM-HOLDER-NAA-CD                                
                 ,:DCLVTRNHSTY.ACCT-ACTIVITY-IND                                
                 ,:DCLVTRNHSTY.ACCT-ORDERS-IND                                  
                 ,:DCLVTRNHSTY.ACCT-RJCT-RSBM-IND                               
                 ,:DCLVTRNHSTY.ACCT-DB-BAL-T1-IND                               
                 ,:DCLVTRNHSTY.ACCT-MRGN-DB-IND                                 
                 ,:DCLVTRNHSTY.ACCT-SHRT-PSTN-IND                               
                 ,:DCLVTRNHSTY.ACCT-SEC-RSTRD-IND                               
                 ,:DCLVTRNHSTY.ACCT-AST-EXCS-IND                                
                 ,:DCLVTRNHSTY.ACCT-OPTN-PSTN-IND                               
                 ,:DCLVTRNHSTY.ACCT-LTD-PRTNR-IND                               
                 ,:DCLVTRNHSTY.ACCT-TIN-MSMTH-IND                               
                 ,:DCLVTRNHSTY.ACCT-DPLCT-TRN-IND                               
                 ,:DCLVTRNHSTY.ACCT-CUST-70-IND                                 
                 ,:DCLVTRNHSTY.ACCT-QULFD-PLN-IND                               
                 ,:DCLVTRNHSTY.ACCT-MNGD-IND                                    
                 ,:DCLVTRNHSTY.ACCT-PRVT-RNG-IND                                
                 ,:DCLVTRNHSTY.ACCT-BRKR-TIF-IND                                
                 ,:DCLVTRNHSTY.NSCC-NON-ADP-IND                                 
                 ,:DCLVTRNHSTY.CYCLE-CD                                         
                 ,:DCLVTRNHSTY.DAYS-STTS-QTY                                    
                 ,:DCLVTRNHSTY.STTLM-DT                                         
                 ,:DCLVTRNHSTY.ACCT-NA-UPDT-IND                                 
                 ,:DCLVTRNHSTY.ACCT-TRNFR-FEE-AMT                               
                 ,:DCLVTRNHSTY.ACCT-IRA-TRMNT-AMT                               
                 ,:DCLVTRNHSTY.ACCT-IRA-MAINT-AMT                               
                 ,:DCLVTRNHSTY.ACCT-DLRV-PRGR-IND                               
                 ,:DCLVTRNHSTY.ACCT-CD                                          
                 ,:DCLVTRNHSTY.STTLM-ASCTD-DT                                   
                 ,:DCLVTRNHSTY.STTLM-ASCTD-STS-CD                               
                 ,:DCLVTRNHSTY.RCRD-LNGTH-STTS-CD                               
                 ,:DCLVTRNHSTY.RCRD-STTS-CD                                     
                 ,:DCLVTRNHSTY.NSCC-PEND-CD                                     
                 ,:DCLVTRNHSTY.NSCC-ACK-IND                                     
                 ,:DCLVTRNHSTY.CICS-TERM-ID-CD                                  
                 ,:DCLVTRNHSTY.PRGM-NM                                          
                 ,:DCLVTRNHSTY.CRT-TMSTP                                        
                 ,:DCLVTRNHSTY.UPDT-TMSTP                                       
                 ,:DCLVTRNHSTY.ACCT-EQUITY-AMT                                  
              FROM                                                              
                 VTRNHSTY                                                       
             WHERE                                                              
                 CLIENT_NBR = :ACAT25-PASS-CLT                                  
                 AND  ACAT_CONTROL_NBR = :ACAT25-PASS-ACAT                      
             WITH UR                                                            
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
              PERFORM 1110-SETUP-HIST-TRNFR-RET-DATA                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT25IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          SETUP HISTORY TRANSFER RETURN DATA                  *          
      *--------------------------------------------------------------*          
       1110-SETUP-HIST-TRNFR-RET-DATA.                                          
           INITIALIZE  ACAT25-TFR-RET-DATA.                                     
           MOVE CLIENT-NBR                      OF DCLVTRNHSTY                  
             TO ACAT25-TFR-CLT.                                                 
           MOVE ACAT-CONTROL-NBR                OF DCLVTRNHSTY                  
             TO ACAT25-TFR-ACAT.                                                
           MOVE DLVR-NBR                        OF DCLVTRNHSTY                  
             TO ACAT25-TFR-DLVR-NBR.                                            
           MOVE ACCT-DLVR-NBR                   OF DCLVTRNHSTY                  
             TO ACAT25-TFR-DLVR-ACCT.                                           
           MOVE RCV-NBR                         OF DCLVTRNHSTY                  
             TO ACAT25-TFR-RCV-NBR.                                             
           MOVE ACCT-RCV-NBR                    OF DCLVTRNHSTY                  
             TO ACAT25-TFR-RCV-ACCT.                                            
           MOVE TRNFR-TYPE-CD                   OF DCLVTRNHSTY                  
             TO ACAT25-TFR-TFR-TYPE.                                            
           MOVE TRANS-TYPE-CD                   OF DCLVTRNHSTY                  
             TO ACAT25-TFR-TRANS-TYPE.                                          
           MOVE RCV-CUST-NM                     OF DCLVTRNHSTY                  
             TO ACAT25-TFR-NAME.                                                
           MOVE RCV-ACCT-TYPE-CD                OF DCLVTRNHSTY                  
             TO ACAT25-TFR-ACCT-TYPE.                                           
           MOVE CMNT-TXT                        OF DCLVTRNHSTY                  
             TO ACAT25-TFR-CMNT.                                                
           MOVE STTS-CD                         OF DCLVTRNHSTY                  
             TO ACAT25-TFR-STTS.                                                
           MOVE DSTBN-SIDE-CD                   OF DCLVTRNHSTY                  
             TO ACAT25-TFR-DSTBN.                                               
           MOVE RR-CD                           OF DCLVTRNHSTY                  
             TO ACAT25-TFR-RR.                                                  
           MOVE BRANCH-CD                       OF DCLVTRNHSTY                  
             TO ACAT25-TFR-BRANCH.                                              
           MOVE DAYS-STTS-QTY                   OF DCLVTRNHSTY                  
             TO ACAT25-TFR-DAYS-STTS.                                           
           MOVE STTLM-DT                        OF DCLVTRNHSTY                  
             TO ACAT25-TFR-STTLM-DT.                                            
           MOVE ACCT-CD                         OF DCLVTRNHSTY                  
             TO ACAT25-TFR-ACCOUNT.                                             
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  OPEN HISTORY TRANSFER CUSRSOR TBL (IN ORDER BY SRCH ENGINE) *          
      *--------------------------------------------------------------*          
       1200-OPEN-HTRNFR-ENGIN-CSR.                                              
           IF WS-PASSED-TO-BR < '100'                                           
              MOVE '100' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '150'                                           
              MOVE '150' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '200'                                           
              MOVE '200' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '250'                                           
              MOVE '250' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '300'                                           
              MOVE '300' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '350'                                           
              MOVE '350' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '400'                                           
              MOVE '400' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '450'                                           
              MOVE '450' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '500'                                           
              MOVE '500' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '550'                                           
              MOVE '550' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '600'                                           
              MOVE '600' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '650'                                           
              MOVE '650' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '700'                                           
              MOVE '700' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '750'                                           
              MOVE '750' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '800'                                           
              MOVE '800' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '850'                                           
              MOVE '850' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '900'                                           
              MOVE '900' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
              MOVE HIGH-VALUES TO WS-PASSED-TO-BR                               
           END-IF.                                                              
           MOVE WS-PASSED-TO-BR TO ACAT25-PASS-TO-BR.                           
           EXEC SQL                                                             
              OPEN HTRNFR_ENGIN_CSR                                             
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
           ELSE                                                                 
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      * FETCH HISTORY TRANSFER CUSRSOR TBL (IN ORDER BY SRCH ENGINE) *          
      *--------------------------------------------------------------*          
       1300-FETCH-HTRNFR-ENGIN-CSR.                                             
           EXEC SQL                                                             
              FETCH                                                             
                  HTRNFR_ENGIN_CSR                                              
              INTO                                                              
                  :DCLVTRNHSTY.CLIENT-NBR                                       
                 ,:DCLVTRNHSTY.ACAT-CONTROL-NBR                                 
                 ,:DCLVTRNHSTY.SBMTG-PRTCP-NBR                                  
                 ,:DCLVTRNHSTY.SBMT-PRT-NR-STS-CD                               
                 ,:DCLVTRNHSTY.CONTROL-NBR-STS-CD                               
                 ,:DCLVTRNHSTY.DLVR-NBR                                         
                 ,:DCLVTRNHSTY.DLVR-NBR-STTS-CD                                 
                 ,:DCLVTRNHSTY.ACCT-DLVR-NBR                                    
                 ,:DCLVTRNHSTY.ACCT-DLVR-STTS-CD                                
                 ,:DCLVTRNHSTY.RCV-NBR                                          
                 ,:DCLVTRNHSTY.RCV-NBR-STTS-CD                                  
                 ,:DCLVTRNHSTY.ACCT-RCV-NBR                                     
                 ,:DCLVTRNHSTY.ACCT-RCV-STTS-CD                                 
                 ,:DCLVTRNHSTY.TRNFR-TYPE-CD                                    
                 ,:DCLVTRNHSTY.TRNFR-TYPE-STTS-CD                               
                 ,:DCLVTRNHSTY.TRANS-TYPE-CD                                    
                 ,:DCLVTRNHSTY.TRANS-TYPE-STTS-CD                               
                 ,:DCLVTRNHSTY.RCV-CUST-NM                                      
                 ,:DCLVTRNHSTY.RCV-CUST-NM-STS-CD                               
                 ,:DCLVTRNHSTY.RCV-SS-PRIM-NBR                                  
                 ,:DCLVTRNHSTY.RCV-SS-PRIM-STS-CD                               
                 ,:DCLVTRNHSTY.RCV-SS-SCNDY-NBR                                 
                 ,:DCLVTRNHSTY.RCV-SS-SCDY-STS-CD                               
                 ,:DCLVTRNHSTY.RCV-ACCT-TYPE-CD                                 
                 ,:DCLVTRNHSTY.RCV-ACT-TYP-STS-CD                               
                 ,:DCLVTRNHSTY.RCV-OCC-BRKR-NBR                                 
                 ,:DCLVTRNHSTY.RCV-OCC-STTS-CD                                  
                 ,:DCLVTRNHSTY.RCV-CRSPN-NBR                                    
                 ,:DCLVTRNHSTY.RCV-CRSPN-STTS-CD                                
                 ,:DCLVTRNHSTY.ACAT-CNTL-ASTD-NBR                               
                 ,:DCLVTRNHSTY.CNTL-ASTD-STTS-CD                                
                 ,:DCLVTRNHSTY.CMNT-TXT                                         
                 ,:DCLVTRNHSTY.CMNT-STTS-CD                                     
                 ,:DCLVTRNHSTY.PRCS-DT                                          
                 ,:DCLVTRNHSTY.STTS-CD                                          
                 ,:DCLVTRNHSTY.STTLM-TM-CD                                      
                 ,:DCLVTRNHSTY.VAL-FREE-CD                                      
                 ,:DCLVTRNHSTY.TRANS-RFRN-ID-CD                                 
                 ,:DCLVTRNHSTY.TRANS-RFRN-STTS-CD                               
                 ,:DCLVTRNHSTY.DB-CR-CD                                         
                 ,:DCLVTRNHSTY.DSTBN-SIDE-CD                                    
                 ,:DCLVTRNHSTY.SYS-ACT-CD                                       
                 ,:DCLVTRNHSTY.SYS-RJCT-RSN-CD                                  
                 ,:DCLVTRNHSTY.TRNFR-TYPE-RJC1-CD                               
                 ,:DCLVTRNHSTY.TRNFR-TYPE-RJC2-CD                               
                 ,:DCLVTRNHSTY.TRNFR-TYPE-RJCT-CD                               
                 ,:DCLVTRNHSTY.TRN-TYP-RJC-STS-CD                               
                 ,:DCLVTRNHSTY.PHSCL-SEQ-NBR                                    
                 ,:DCLVTRNHSTY.PHSCL-SEQ-STTS-CD                                
                 ,:DCLVTRNHSTY.LGCL-SEQ-NBR                                     
                 ,:DCLVTRNHSTY.LGCL-SEQ-NR-STS-CD                               
                 ,:DCLVTRNHSTY.RR-CD                                            
                 ,:DCLVTRNHSTY.BRANCH-CD                                        
                 ,:DCLVTRNHSTY.DVDND-NAA-CD                                     
                 ,:DCLVTRNHSTY.SELL-INSTN-NAA-CD                                
                 ,:DCLVTRNHSTY.CASH-SWEEP-NAA-CD                                
                 ,:DCLVTRNHSTY.PRTCP-CONTRA-CD                                  
                 ,:DCLVTRNHSTY.ACM-HOLDER-NAA-CD                                
                 ,:DCLVTRNHSTY.ACCT-ACTIVITY-IND                                
                 ,:DCLVTRNHSTY.ACCT-ORDERS-IND                                  
                 ,:DCLVTRNHSTY.ACCT-RJCT-RSBM-IND                               
                 ,:DCLVTRNHSTY.ACCT-DB-BAL-T1-IND                               
                 ,:DCLVTRNHSTY.ACCT-MRGN-DB-IND                                 
                 ,:DCLVTRNHSTY.ACCT-SHRT-PSTN-IND                               
                 ,:DCLVTRNHSTY.ACCT-SEC-RSTRD-IND                               
                 ,:DCLVTRNHSTY.ACCT-AST-EXCS-IND                                
                 ,:DCLVTRNHSTY.ACCT-OPTN-PSTN-IND                               
                 ,:DCLVTRNHSTY.ACCT-LTD-PRTNR-IND                               
                 ,:DCLVTRNHSTY.ACCT-TIN-MSMTH-IND                               
                 ,:DCLVTRNHSTY.ACCT-DPLCT-TRN-IND                               
                 ,:DCLVTRNHSTY.ACCT-CUST-70-IND                                 
                 ,:DCLVTRNHSTY.ACCT-QULFD-PLN-IND                               
                 ,:DCLVTRNHSTY.ACCT-MNGD-IND                                    
                 ,:DCLVTRNHSTY.ACCT-PRVT-RNG-IND                                
                 ,:DCLVTRNHSTY.ACCT-BRKR-TIF-IND                                
                 ,:DCLVTRNHSTY.NSCC-NON-ADP-IND                                 
                 ,:DCLVTRNHSTY.CYCLE-CD                                         
                 ,:DCLVTRNHSTY.DAYS-STTS-QTY                                    
                 ,:DCLVTRNHSTY.STTLM-DT                                         
                 ,:DCLVTRNHSTY.ACCT-NA-UPDT-IND                                 
                 ,:DCLVTRNHSTY.ACCT-TRNFR-FEE-AMT                               
                 ,:DCLVTRNHSTY.ACCT-IRA-TRMNT-AMT                               
                 ,:DCLVTRNHSTY.ACCT-IRA-MAINT-AMT                               
                 ,:DCLVTRNHSTY.ACCT-DLRV-PRGR-IND                               
                 ,:DCLVTRNHSTY.ACCT-CD                                          
                 ,:DCLVTRNHSTY.STTLM-ASCTD-DT                                   
                 ,:DCLVTRNHSTY.STTLM-ASCTD-STS-CD                               
                 ,:DCLVTRNHSTY.RCRD-LNGTH-STTS-CD                               
                 ,:DCLVTRNHSTY.RCRD-STTS-CD                                     
                 ,:DCLVTRNHSTY.NSCC-PEND-CD                                     
                 ,:DCLVTRNHSTY.NSCC-ACK-IND                                     
                 ,:DCLVTRNHSTY.CICS-TERM-ID-CD                                  
                 ,:DCLVTRNHSTY.PRGM-NM                                          
                 ,:DCLVTRNHSTY.CRT-TMSTP                                        
                 ,:DCLVTRNHSTY.UPDT-TMSTP                                       
                 ,:DCLVTRNHSTY.ACCT-EQUITY-AMT                                  
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
              PERFORM 1110-SETUP-HIST-TRNFR-RET-DATA                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              IF WS-PASSED-TO-BR NOT = HIGH-VALUES                              
                 PERFORM 1400-CLOSE-HTRNFR-ENGIN-CSR                            
                 MOVE WS-PASSED-TO-BR TO WS-PASSED-BR                           
                 PERFORM 1200-OPEN-HTRNFR-ENGIN-CSR                             
                 GO TO 1300-FETCH-HTRNFR-ENGIN-CSR                              
              END-IF                                                            
              SET ACAT25IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
              PERFORM 1400-CLOSE-HTRNFR-ENGIN-CSR                               
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  CLOSE HISTORY TRANSFER CUSRSOR TBL (IN ORDER BY SRCH ENGINE)*          
      *--------------------------------------------------------------*          
       1400-CLOSE-HTRNFR-ENGIN-CSR.                                             
           EXEC SQL                                                             
              CLOSE HTRNFR_ENGIN_CSR                                            
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
           ELSE                                                                 
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *   OPEN HISTORY TRANSFER CUSRSOR TBL (IN ORDER BY ACAT#)      *          
      *--------------------------------------------------------------*          
       1500-OPEN-HTRNFR-ACAT-CSR.                                               
           EXEC SQL                                                             
              OPEN HTRNFR_ACAT_CSR                                              
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
           ELSE                                                                 
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  FETCH HISTORY TRANSFER CUSRSOR TBL (IN ORDER BY ACAT#)      *          
      *--------------------------------------------------------------*          
       1600-FETCH-HTRNFR-ACAT-CSR.                                              
           EXEC SQL                                                             
              FETCH                                                             
                  HTRNFR_ACAT_CSR                                               
              INTO                                                              
                  :DCLVTRNHSTY.CLIENT-NBR                                       
                 ,:DCLVTRNHSTY.ACAT-CONTROL-NBR                                 
                 ,:DCLVTRNHSTY.SBMTG-PRTCP-NBR                                  
                 ,:DCLVTRNHSTY.SBMT-PRT-NR-STS-CD                               
                 ,:DCLVTRNHSTY.CONTROL-NBR-STS-CD                               
                 ,:DCLVTRNHSTY.DLVR-NBR                                         
                 ,:DCLVTRNHSTY.DLVR-NBR-STTS-CD                                 
                 ,:DCLVTRNHSTY.ACCT-DLVR-NBR                                    
                 ,:DCLVTRNHSTY.ACCT-DLVR-STTS-CD                                
                 ,:DCLVTRNHSTY.RCV-NBR                                          
                 ,:DCLVTRNHSTY.RCV-NBR-STTS-CD                                  
                 ,:DCLVTRNHSTY.ACCT-RCV-NBR                                     
                 ,:DCLVTRNHSTY.ACCT-RCV-STTS-CD                                 
                 ,:DCLVTRNHSTY.TRNFR-TYPE-CD                                    
                 ,:DCLVTRNHSTY.TRNFR-TYPE-STTS-CD                               
                 ,:DCLVTRNHSTY.TRANS-TYPE-CD                                    
                 ,:DCLVTRNHSTY.TRANS-TYPE-STTS-CD                               
                 ,:DCLVTRNHSTY.RCV-CUST-NM                                      
                 ,:DCLVTRNHSTY.RCV-CUST-NM-STS-CD                               
                 ,:DCLVTRNHSTY.RCV-SS-PRIM-NBR                                  
                 ,:DCLVTRNHSTY.RCV-SS-PRIM-STS-CD                               
                 ,:DCLVTRNHSTY.RCV-SS-SCNDY-NBR                                 
                 ,:DCLVTRNHSTY.RCV-SS-SCDY-STS-CD                               
                 ,:DCLVTRNHSTY.RCV-ACCT-TYPE-CD                                 
                 ,:DCLVTRNHSTY.RCV-ACT-TYP-STS-CD                               
                 ,:DCLVTRNHSTY.RCV-OCC-BRKR-NBR                                 
                 ,:DCLVTRNHSTY.RCV-OCC-STTS-CD                                  
                 ,:DCLVTRNHSTY.RCV-CRSPN-NBR                                    
                 ,:DCLVTRNHSTY.RCV-CRSPN-STTS-CD                                
                 ,:DCLVTRNHSTY.ACAT-CNTL-ASTD-NBR                               
                 ,:DCLVTRNHSTY.CNTL-ASTD-STTS-CD                                
                 ,:DCLVTRNHSTY.CMNT-TXT                                         
                 ,:DCLVTRNHSTY.CMNT-STTS-CD                                     
                 ,:DCLVTRNHSTY.PRCS-DT                                          
                 ,:DCLVTRNHSTY.STTS-CD                                          
                 ,:DCLVTRNHSTY.STTLM-TM-CD                                      
                 ,:DCLVTRNHSTY.VAL-FREE-CD                                      
                 ,:DCLVTRNHSTY.TRANS-RFRN-ID-CD                                 
                 ,:DCLVTRNHSTY.TRANS-RFRN-STTS-CD                               
                 ,:DCLVTRNHSTY.DB-CR-CD                                         
                 ,:DCLVTRNHSTY.DSTBN-SIDE-CD                                    
                 ,:DCLVTRNHSTY.SYS-ACT-CD                                       
                 ,:DCLVTRNHSTY.SYS-RJCT-RSN-CD                                  
                 ,:DCLVTRNHSTY.TRNFR-TYPE-RJC1-CD                               
                 ,:DCLVTRNHSTY.TRNFR-TYPE-RJC2-CD                               
                 ,:DCLVTRNHSTY.TRNFR-TYPE-RJCT-CD                               
                 ,:DCLVTRNHSTY.TRN-TYP-RJC-STS-CD                               
                 ,:DCLVTRNHSTY.PHSCL-SEQ-NBR                                    
                 ,:DCLVTRNHSTY.PHSCL-SEQ-STTS-CD                                
                 ,:DCLVTRNHSTY.LGCL-SEQ-NBR                                     
                 ,:DCLVTRNHSTY.LGCL-SEQ-NR-STS-CD                               
                 ,:DCLVTRNHSTY.RR-CD                                            
                 ,:DCLVTRNHSTY.BRANCH-CD                                        
                 ,:DCLVTRNHSTY.DVDND-NAA-CD                                     
                 ,:DCLVTRNHSTY.SELL-INSTN-NAA-CD                                
                 ,:DCLVTRNHSTY.CASH-SWEEP-NAA-CD                                
                 ,:DCLVTRNHSTY.PRTCP-CONTRA-CD                                  
                 ,:DCLVTRNHSTY.ACM-HOLDER-NAA-CD                                
                 ,:DCLVTRNHSTY.ACCT-ACTIVITY-IND                                
                 ,:DCLVTRNHSTY.ACCT-ORDERS-IND                                  
                 ,:DCLVTRNHSTY.ACCT-RJCT-RSBM-IND                               
                 ,:DCLVTRNHSTY.ACCT-DB-BAL-T1-IND                               
                 ,:DCLVTRNHSTY.ACCT-MRGN-DB-IND                                 
                 ,:DCLVTRNHSTY.ACCT-SHRT-PSTN-IND                               
                 ,:DCLVTRNHSTY.ACCT-SEC-RSTRD-IND                               
                 ,:DCLVTRNHSTY.ACCT-AST-EXCS-IND                                
                 ,:DCLVTRNHSTY.ACCT-OPTN-PSTN-IND                               
                 ,:DCLVTRNHSTY.ACCT-LTD-PRTNR-IND                               
                 ,:DCLVTRNHSTY.ACCT-TIN-MSMTH-IND                               
                 ,:DCLVTRNHSTY.ACCT-DPLCT-TRN-IND                               
                 ,:DCLVTRNHSTY.ACCT-CUST-70-IND                                 
                 ,:DCLVTRNHSTY.ACCT-QULFD-PLN-IND                               
                 ,:DCLVTRNHSTY.ACCT-MNGD-IND                                    
                 ,:DCLVTRNHSTY.ACCT-PRVT-RNG-IND                                
                 ,:DCLVTRNHSTY.ACCT-BRKR-TIF-IND                                
                 ,:DCLVTRNHSTY.NSCC-NON-ADP-IND                                 
                 ,:DCLVTRNHSTY.CYCLE-CD                                         
                 ,:DCLVTRNHSTY.DAYS-STTS-QTY                                    
                 ,:DCLVTRNHSTY.STTLM-DT                                         
                 ,:DCLVTRNHSTY.ACCT-NA-UPDT-IND                                 
                 ,:DCLVTRNHSTY.ACCT-TRNFR-FEE-AMT                               
                 ,:DCLVTRNHSTY.ACCT-IRA-TRMNT-AMT                               
                 ,:DCLVTRNHSTY.ACCT-IRA-MAINT-AMT                               
                 ,:DCLVTRNHSTY.ACCT-DLRV-PRGR-IND                               
                 ,:DCLVTRNHSTY.ACCT-CD                                          
                 ,:DCLVTRNHSTY.STTLM-ASCTD-DT                                   
                 ,:DCLVTRNHSTY.STTLM-ASCTD-STS-CD                               
                 ,:DCLVTRNHSTY.RCRD-LNGTH-STTS-CD                               
                 ,:DCLVTRNHSTY.RCRD-STTS-CD                                     
                 ,:DCLVTRNHSTY.NSCC-PEND-CD                                     
                 ,:DCLVTRNHSTY.NSCC-ACK-IND                                     
                 ,:DCLVTRNHSTY.CICS-TERM-ID-CD                                  
                 ,:DCLVTRNHSTY.PRGM-NM                                          
                 ,:DCLVTRNHSTY.CRT-TMSTP                                        
                 ,:DCLVTRNHSTY.UPDT-TMSTP                                       
                 ,:DCLVTRNHSTY.ACCT-EQUITY-AMT                                  
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
              PERFORM 1110-SETUP-HIST-TRNFR-RET-DATA                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT25IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
              PERFORM 1700-CLOSE-HTRNFR-ACAT-CSR                                
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  CLOSE HISTORY TRANSFER CUSRSOR TBL (IN ORDER BY ACAT#)      *          
      *--------------------------------------------------------------*          
       1700-CLOSE-HTRNFR-ACAT-CSR.                                              
           EXEC SQL                                                             
              CLOSE HTRNFR_ACAT_CSR                                             
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
           ELSE                                                                 
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          OPEN HISTORY ASSET CURSOR TABLE                     *          
      *--------------------------------------------------------------*          
       1800-OPEN-HST-ASSET-CSR.                                                 
           EXEC SQL                                                             
              OPEN HASSET_CSR                                                   
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
           ELSE                                                                 
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *         FETCH HISTORY ASSET CURSOR TABLE                     *          
      *--------------------------------------------------------------*          
       1900-FETCH-HST-ASSET-CSR.                                                
           EXEC SQL                                                             
              FETCH                                                             
                  HASSET_CSR                                                    
              INTO                                                              
                  :DCLVASTHSTY.CLIENT-NBR                                       
                 ,:DCLVASTHSTY.ACAT-CONTROL-NBR                                 
                 ,:DCLVASTHSTY.ASSET-SEQ-NBR                                    
                 ,:DCLVASTHSTY.CONTROL-NBR-STS-CD                               
                 ,:DCLVASTHSTY.DLVR-NBR-STTS-CD                                 
                 ,:DCLVASTHSTY.RCV-NBR-STTS-CD                                  
                 ,:DCLVASTHSTY.SBMTG-PRTCP-NBR                                  
                 ,:DCLVASTHSTY.SBMT-PRT-NR-STS-CD                               
                 ,:DCLVASTHSTY.AST-SEQ-NBR-STS-CD                               
                 ,:DCLVASTHSTY.SYS-ACT-CD                                       
                 ,:DCLVASTHSTY.SYS-RJCT-RSN-CD                                  
                 ,:DCLVASTHSTY.TRANS-TYPE-CD                                    
                 ,:DCLVASTHSTY.TRANS-TYPE-STTS-CD                               
                 ,:DCLVASTHSTY.PHSCL-SEQ-NBR                                    
                 ,:DCLVASTHSTY.PHSCL-SEQ-STTS-CD                                
                 ,:DCLVASTHSTY.LGCL-SEQ-NBR                                     
                 ,:DCLVASTHSTY.LGCL-SEQ-NR-STS-CD                               
                 ,:DCLVASTHSTY.ASSET-PRC-CTGY-CD                                
                 ,:DCLVASTHSTY.AST-PRC-CTG-STS-CD                               
                 ,:DCLVASTHSTY.STTLM-LCTN-CD                                    
                 ,:DCLVASTHSTY.STTLM-LCTN-STTS-CD                               
                 ,:DCLVASTHSTY.STTLM-RSN-CD                                     
                 ,:DCLVASTHSTY.STTLM-RSN-STTS-CD                                
                 ,:DCLVASTHSTY.ISIN-CNTRY-CD                                    
                 ,:DCLVASTHSTY.ISIN-CNTRY-STTS-CD                               
                 ,:DCLVASTHSTY.ISIN-SEC-ISSUE-CD                                
                 ,:DCLVASTHSTY.ISIN-SEC-IS-STS-CD                               
                 ,:DCLVASTHSTY.ISIN-SEC-CDG-CD                                  
                 ,:DCLVASTHSTY.ISIN-SEC-CD-STS-CD                               
                 ,:DCLVASTHSTY.ASSET-DESC-TXT                                   
                 ,:DCLVASTHSTY.ASSET-DESC-STTS-CD                               
                 ,:DCLVASTHSTY.ASSET-RQST-QTY-CD                                
                 ,:DCLVASTHSTY.ASSET-RQST-STS-CD                                
                 ,:DCLVASTHSTY.AST-RQST-TRANS-CD                                
                 ,:DCLVASTHSTY.AST-RQ-TRAN-STS-CD                               
                 ,:DCLVASTHSTY.ASSET-QTY                                        
                 ,:DCLVASTHSTY.ASSET-QTY-STTS-CD                                
                 ,:DCLVASTHSTY.ASSET-PCT                                        
                 ,:DCLVASTHSTY.ASSET-PCT-STTS-CD                                
                 ,:DCLVASTHSTY.PSTN-CD                                          
                 ,:DCLVASTHSTY.PSTN-CD-STTS-CD                                  
                 ,:DCLVASTHSTY.ISO-CRNCY-CD                                     
                 ,:DCLVASTHSTY.ISO-CRNCY-STTS-CD                                
                 ,:DCLVASTHSTY.ASSET-AMT                                        
                 ,:DCLVASTHSTY.ASSET-AMT-STTS-CD                                
                 ,:DCLVASTHSTY.BEARER-BOND-CD                                   
                 ,:DCLVASTHSTY.BEARER-BND-STTS-CD                               
                 ,:DCLVASTHSTY.CSH-MGN-SHRT-CD                                  
                 ,:DCLVASTHSTY.CSH-MRG-SHT-STS-CD                               
                 ,:DCLVASTHSTY.WHI-CD                                           
                 ,:DCLVASTHSTY.WHI-STTS-CD                                      
                 ,:DCLVASTHSTY.TRNFR-TYPE-RSN-CD                                
                 ,:DCLVASTHSTY.TRN-TYP-RSN-STS-CD                               
                 ,:DCLVASTHSTY.MBS-SERIAL-NBR                                   
                 ,:DCLVASTHSTY.MBS-SERIAL-STTS-CD                               
                 ,:DCLVASTHSTY.ASSET-CMNT-TXT                                   
                 ,:DCLVASTHSTY.ASSET-CMNT-STTS-CD                               
                 ,:DCLVASTHSTY.NSCC-ACK-IND                                     
                 ,:DCLVASTHSTY.NSCC-PEND-CD                                     
                 ,:DCLVASTHSTY.FAIL-SENT-CAGE-IND                               
                 ,:DCLVASTHSTY.FAIL-OPEN-CAGE-IND                               
                 ,:DCLVASTHSTY.NSCC-NON-ADP-IND                                 
                 ,:DCLVASTHSTY.TRANS-RFRN-ID-CD                                 
                 ,:DCLVASTHSTY.TRANS-RFRN-STTS-CD                               
                 ,:DCLVASTHSTY.OPTN-CTGY-CD                                     
                 ,:DCLVASTHSTY.OPTN-CTGY-STTS-CD                                
                 ,:DCLVASTHSTY.RCRD-LNGTH-STTS-CD                               
                 ,:DCLVASTHSTY.RCRD-STTS-CD                                     
                 ,:DCLVASTHSTY.ISIN-SEC-EXCPT-IND                               
                 ,:DCLVASTHSTY.CRT-TMSTP                                        
                 ,:DCLVASTHSTY.UPDT-TMSTP                                       
                 ,:DCLVASTHSTY.CICS-TERM-ID-CD                                  
                 ,:DCLVASTHSTY.PRGM-NM                                          
                 ,:DCLVASTHSTY.SECURITY-ADP-NBR                                 
                 ,:DCLVASTHSTY.RCL-SENT-NSCC-IND                                
                 ,:DCLVASTHSTY.FRV-SENT-NSCC-IND                                
                 ,:DCLVASTHSTY.TRNFR-TYPE-CD                                    
ET0001           ,:DCLVASTHSTY.CAGE-TAG-NBR                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
              PERFORM 1910-SETUP-HASSET-RET-DATA                                
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT25IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
              PERFORM 2000-CLOSE-HST-ASSET-CSR                                  
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *         SETUP HSITORY ASSET RETURN DATA                      *          
      *--------------------------------------------------------------*          
       1910-SETUP-HASSET-RET-DATA.                                              
           INITIALIZE ACAT25-ASSET-RET-DATA.                                    
           MOVE CLIENT-NBR                 OF DCLVASTHSTY                       
             TO ACAT25-AST-CLT.                                                 
           MOVE ACAT-CONTROL-NBR           OF DCLVASTHSTY                       
             TO ACAT25-AST-ACAT.                                                
           MOVE ASSET-SEQ-NBR              OF DCLVASTHSTY                       
             TO ACAT25-AST-SEQ-NBR.                                             
           MOVE ASSET-PRC-CTGY-CD          OF DCLVASTHSTY                       
             TO ACAT25-AST-PRC-CTGY.                                            
           MOVE STTLM-LCTN-CD              OF DCLVASTHSTY                       
             TO ACAT25-AST-STTLM-LCTN.                                          
           MOVE STTLM-RSN-CD               OF DCLVASTHSTY                       
             TO ACAT25-AST-STTLM-RSN.                                           
           MOVE ISIN-SEC-ISSUE-CD          OF DCLVASTHSTY                       
             TO ACAT25-AST-SECURITY.                                            
           MOVE ASSET-DESC-TXT             OF DCLVASTHSTY                       
             TO ACAT25-AST-DESCRIPT.                                            
           MOVE ASSET-QTY                  OF DCLVASTHSTY                       
             TO ACAT25-AST-ASSET-QTY.                                           
           MOVE ASSET-AMT                  OF DCLVASTHSTY                       
             TO ACAT25-AST-ASSET-AMT.                                           
           MOVE PSTN-CD                    OF DCLVASTHSTY                       
             TO ACAT25-AST-PSTN-CD.                                             
           MOVE CSH-MGN-SHRT-CD            OF DCLVASTHSTY                       
             TO ACAT25-AST-CS-MG-SH.                                            
           MOVE WHI-CD                     OF DCLVASTHSTY                       
             TO ACAT25-AST-WHI-CD.                                              
           MOVE ASSET-CMNT-TXT             OF DCLVASTHSTY                       
             TO ACAT25-AST-COMMENT.                                             
           MOVE OPTN-CTGY-CD               OF DCLVASTHSTY                       
             TO ACAT25-AST-OPTN-CTGY.                                           
           MOVE SECURITY-ADP-NBR           OF DCLVASTHSTY                       
             TO ACAT25-AST-ADP-NBR.                                             
           MOVE TRNFR-TYPE-CD              OF DCLVASTHSTY                       
             TO ACAT25-AST-TRNFR-TYPE.                                          
ET0001     MOVE CAGE-TAG-NBR               OF DCLVASTHSTY                       
ET0001       TO ACAT25-AST-CAGE-TAG.                                            
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *         CLOSE HISTORY ASSET CURSOR TABLE                     *          
      *--------------------------------------------------------------*          
       2000-CLOSE-HST-ASSET-CSR.                                                
           EXEC SQL                                                             
              CLOSE HASSET_CSR                                                  
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
           ELSE                                                                 
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  OPEN PENDIG TRANSFER CUSRSOR TBL IN SEQUENCE ORDER BY       *          
      *  BRANCH ACCT ACAT#.                                          *          
      *--------------------------------------------------------------*          
       2100-OPEN-TRNFR-ENGIN-CSR-D.                                             
           EXEC SQL                                                             
              OPEN TRNFR_ENGIN_CSR_D                                            
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
           ELSE                                                                 
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  FETCH PENDIG TRANSFER CUSRSOR TBL IN SEQUENCE ORDER BY      *          
      *  BRANCH ACCT ACAT#.                                          *          
      *--------------------------------------------------------------*          
       2200-FETCH-TRNFR-ENGIN-CSR-D.                                            
           EXEC SQL                                                             
              FETCH                                                             
                  TRNFR_ENGIN_CSR_D                                             
              INTO                                                              
                  :DCLVTRNFR.CLIENT-NBR                                         
                 ,:DCLVTRNFR.ACAT-CONTROL-NBR                                   
                 ,:DCLVTRNFR.SBMTG-PRTCP-NBR                                    
                 ,:DCLVTRNFR.SBMT-PRT-NR-STS-CD                                 
                 ,:DCLVTRNFR.CONTROL-NBR-STS-CD                                 
                 ,:DCLVTRNFR.DLVR-NBR                                           
                 ,:DCLVTRNFR.DLVR-NBR-STTS-CD                                   
                 ,:DCLVTRNFR.ACCT-DLVR-NBR                                      
                 ,:DCLVTRNFR.ACCT-DLVR-STTS-CD                                  
                 ,:DCLVTRNFR.RCV-NBR                                            
                 ,:DCLVTRNFR.RCV-NBR-STTS-CD                                    
                 ,:DCLVTRNFR.ACCT-RCV-NBR                                       
                 ,:DCLVTRNFR.ACCT-RCV-STTS-CD                                   
                 ,:DCLVTRNFR.TRNFR-TYPE-CD                                      
                 ,:DCLVTRNFR.TRNFR-TYPE-STTS-CD                                 
                 ,:DCLVTRNFR.TRANS-TYPE-CD                                      
                 ,:DCLVTRNFR.TRANS-TYPE-STTS-CD                                 
                 ,:DCLVTRNFR.RCV-CUST-NM                                        
                 ,:DCLVTRNFR.RCV-CUST-NM-STS-CD                                 
                 ,:DCLVTRNFR.RCV-SS-PRIM-NBR                                    
                 ,:DCLVTRNFR.RCV-SS-PRIM-STS-CD                                 
                 ,:DCLVTRNFR.RCV-SS-SCNDY-NBR                                   
                 ,:DCLVTRNFR.RCV-SS-SCDY-STS-CD                                 
                 ,:DCLVTRNFR.RCV-ACCT-TYPE-CD                                   
                 ,:DCLVTRNFR.RCV-ACT-TYP-STS-CD                                 
                 ,:DCLVTRNFR.RCV-OCC-BRKR-NBR                                   
                 ,:DCLVTRNFR.RCV-OCC-STTS-CD                                    
                 ,:DCLVTRNFR.RCV-CRSPN-NBR                                      
                 ,:DCLVTRNFR.RCV-CRSPN-STTS-CD                                  
                 ,:DCLVTRNFR.ACAT-CNTL-ASTD-NBR                                 
                 ,:DCLVTRNFR.CNTL-ASTD-STTS-CD                                  
                 ,:DCLVTRNFR.CMNT-TXT                                           
                 ,:DCLVTRNFR.CMNT-STTS-CD                                       
                 ,:DCLVTRNFR.PRCS-DT                                            
                 ,:DCLVTRNFR.STTS-CD                                            
                 ,:DCLVTRNFR.STTLM-TM-CD                                        
                 ,:DCLVTRNFR.VAL-FREE-CD                                        
                 ,:DCLVTRNFR.TRANS-RFRN-ID-CD                                   
                 ,:DCLVTRNFR.TRANS-RFRN-STTS-CD                                 
                 ,:DCLVTRNFR.DB-CR-CD                                           
                 ,:DCLVTRNFR.DSTBN-SIDE-CD                                      
                 ,:DCLVTRNFR.SYS-ACT-CD                                         
                 ,:DCLVTRNFR.SYS-RJCT-RSN-CD                                    
                 ,:DCLVTRNFR.TRNFR-TYPE-RJC1-CD                                 
                 ,:DCLVTRNFR.TRNFR-TYPE-RJC2-CD                                 
                 ,:DCLVTRNFR.TRNFR-TYPE-RJCT-CD                                 
                 ,:DCLVTRNFR.TRN-TYP-RJC-STS-CD                                 
                 ,:DCLVTRNFR.PHSCL-SEQ-NBR                                      
                 ,:DCLVTRNFR.PHSCL-SEQ-STTS-CD                                  
                 ,:DCLVTRNFR.LGCL-SEQ-NBR                                       
                 ,:DCLVTRNFR.LGCL-SEQ-NR-STS-CD                                 
                 ,:DCLVTRNFR.RR-CD                                              
                 ,:DCLVTRNFR.BRANCH-CD                                          
                 ,:DCLVTRNFR.DVDND-NAA-CD                                       
                 ,:DCLVTRNFR.SELL-INSTN-NAA-CD                                  
                 ,:DCLVTRNFR.CASH-SWEEP-NAA-CD                                  
                 ,:DCLVTRNFR.PRTCP-CONTRA-CD                                    
                 ,:DCLVTRNFR.ACM-HOLDER-NAA-CD                                  
                 ,:DCLVTRNFR.ACCT-ACTIVITY-IND                                  
                 ,:DCLVTRNFR.ACCT-ORDERS-IND                                    
                 ,:DCLVTRNFR.ACCT-RJCT-RSBM-IND                                 
                 ,:DCLVTRNFR.ACCT-DB-BAL-T1-IND                                 
                 ,:DCLVTRNFR.ACCT-MRGN-DB-IND                                   
                 ,:DCLVTRNFR.ACCT-SHRT-PSTN-IND                                 
                 ,:DCLVTRNFR.ACCT-SEC-RSTRD-IND                                 
                 ,:DCLVTRNFR.ACCT-AST-EXCS-IND                                  
                 ,:DCLVTRNFR.ACCT-OPTN-PSTN-IND                                 
                 ,:DCLVTRNFR.ACCT-LTD-PRTNR-IND                                 
                 ,:DCLVTRNFR.ACCT-TIN-MSMTH-IND                                 
                 ,:DCLVTRNFR.ACCT-DPLCT-TRN-IND                                 
                 ,:DCLVTRNFR.ACCT-CUST-70-IND                                   
                 ,:DCLVTRNFR.ACCT-QULFD-PLN-IND                                 
                 ,:DCLVTRNFR.ACCT-MNGD-IND                                      
                 ,:DCLVTRNFR.ACCT-PRVT-RNG-IND                                  
                 ,:DCLVTRNFR.ACCT-BRKR-TIF-IND                                  
                 ,:DCLVTRNFR.NSCC-NON-ADP-IND                                   
                 ,:DCLVTRNFR.CYCLE-CD                                           
                 ,:DCLVTRNFR.DAYS-STTS-QTY                                      
                 ,:DCLVTRNFR.STTLM-DT                                           
                 ,:DCLVTRNFR.ACCT-NA-UPDT-IND                                   
                 ,:DCLVTRNFR.ACCT-TRNFR-FEE-AMT                                 
                 ,:DCLVTRNFR.ACCT-IRA-TRMNT-AMT                                 
                 ,:DCLVTRNFR.ACCT-IRA-MAINT-AMT                                 
                 ,:DCLVTRNFR.ACCT-DLRV-PRGR-IND                                 
                 ,:DCLVTRNFR.ACCT-CD                                            
                 ,:DCLVTRNFR.STTLM-ASCTD-DT                                     
                 ,:DCLVTRNFR.STTLM-ASCTD-STS-CD                                 
                 ,:DCLVTRNFR.RCRD-LNGTH-STTS-CD                                 
                 ,:DCLVTRNFR.RCRD-STTS-CD                                       
                 ,:DCLVTRNFR.NSCC-PEND-CD                                       
                 ,:DCLVTRNFR.NSCC-ACK-IND                                       
                 ,:DCLVTRNFR.CICS-TERM-ID-CD                                    
                 ,:DCLVTRNFR.PRGM-NM                                            
                 ,:DCLVTRNFR.CRT-TMSTP                                          
                 ,:DCLVTRNFR.UPDT-TMSTP                                         
                 ,:DCLVTRNFR.ACCT-EQUITY-AMT                                    
                 ,:DCLVTRNFR.ALERT-IND                                          
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
              PERFORM 0110-SETUP-TRNFR-RET-DATA                                 
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT25IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
              PERFORM 2300-CLOSE-TRNFR-ENGIN-CSR-D                              
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  CLOSE PENDIG TRANSFER CUSRSOR TBL IN SEQUENCE ORDER BY      *          
      *  BRANCH ACCT ACAT#.                                          *          
      *--------------------------------------------------------------*          
       2300-CLOSE-TRNFR-ENGIN-CSR-D.                                            
           EXEC SQL                                                             
              CLOSE TRNFR_ENGIN_CSR_D                                           
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
           ELSE                                                                 
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      * OPEN PENDIG TRANSFER CUSRSOR TBL IN SEQUENCE ORDER BY ACAT#  *          
      *--------------------------------------------------------------*          
       2400-OPEN-TRNFR-ACAT-CSR-D.                                              
           EXEC SQL                                                             
              OPEN TRNFR_ACAT_CSR_D                                             
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
           ELSE                                                                 
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      * FETCH PENDIG TRANSFER CUSRSOR TBL IN SEQUENCE ORDER BY ACAT# *          
      *--------------------------------------------------------------*          
       2500-FETCH-TRNFR-ACAT-CSR-D.                                             
           EXEC SQL                                                             
              FETCH                                                             
                  TRNFR_ACAT_CSR_D                                              
              INTO                                                              
                  :DCLVTRNFR.CLIENT-NBR                                         
                 ,:DCLVTRNFR.ACAT-CONTROL-NBR                                   
                 ,:DCLVTRNFR.SBMTG-PRTCP-NBR                                    
                 ,:DCLVTRNFR.SBMT-PRT-NR-STS-CD                                 
                 ,:DCLVTRNFR.CONTROL-NBR-STS-CD                                 
                 ,:DCLVTRNFR.DLVR-NBR                                           
                 ,:DCLVTRNFR.DLVR-NBR-STTS-CD                                   
                 ,:DCLVTRNFR.ACCT-DLVR-NBR                                      
                 ,:DCLVTRNFR.ACCT-DLVR-STTS-CD                                  
                 ,:DCLVTRNFR.RCV-NBR                                            
                 ,:DCLVTRNFR.RCV-NBR-STTS-CD                                    
                 ,:DCLVTRNFR.ACCT-RCV-NBR                                       
                 ,:DCLVTRNFR.ACCT-RCV-STTS-CD                                   
                 ,:DCLVTRNFR.TRNFR-TYPE-CD                                      
                 ,:DCLVTRNFR.TRNFR-TYPE-STTS-CD                                 
                 ,:DCLVTRNFR.TRANS-TYPE-CD                                      
                 ,:DCLVTRNFR.TRANS-TYPE-STTS-CD                                 
                 ,:DCLVTRNFR.RCV-CUST-NM                                        
                 ,:DCLVTRNFR.RCV-CUST-NM-STS-CD                                 
                 ,:DCLVTRNFR.RCV-SS-PRIM-NBR                                    
                 ,:DCLVTRNFR.RCV-SS-PRIM-STS-CD                                 
                 ,:DCLVTRNFR.RCV-SS-SCNDY-NBR                                   
                 ,:DCLVTRNFR.RCV-SS-SCDY-STS-CD                                 
                 ,:DCLVTRNFR.RCV-ACCT-TYPE-CD                                   
                 ,:DCLVTRNFR.RCV-ACT-TYP-STS-CD                                 
                 ,:DCLVTRNFR.RCV-OCC-BRKR-NBR                                   
                 ,:DCLVTRNFR.RCV-OCC-STTS-CD                                    
                 ,:DCLVTRNFR.RCV-CRSPN-NBR                                      
                 ,:DCLVTRNFR.RCV-CRSPN-STTS-CD                                  
                 ,:DCLVTRNFR.ACAT-CNTL-ASTD-NBR                                 
                 ,:DCLVTRNFR.CNTL-ASTD-STTS-CD                                  
                 ,:DCLVTRNFR.CMNT-TXT                                           
                 ,:DCLVTRNFR.CMNT-STTS-CD                                       
                 ,:DCLVTRNFR.PRCS-DT                                            
                 ,:DCLVTRNFR.STTS-CD                                            
                 ,:DCLVTRNFR.STTLM-TM-CD                                        
                 ,:DCLVTRNFR.VAL-FREE-CD                                        
                 ,:DCLVTRNFR.TRANS-RFRN-ID-CD                                   
                 ,:DCLVTRNFR.TRANS-RFRN-STTS-CD                                 
                 ,:DCLVTRNFR.DB-CR-CD                                           
                 ,:DCLVTRNFR.DSTBN-SIDE-CD                                      
                 ,:DCLVTRNFR.SYS-ACT-CD                                         
                 ,:DCLVTRNFR.SYS-RJCT-RSN-CD                                    
                 ,:DCLVTRNFR.TRNFR-TYPE-RJC1-CD                                 
                 ,:DCLVTRNFR.TRNFR-TYPE-RJC2-CD                                 
                 ,:DCLVTRNFR.TRNFR-TYPE-RJCT-CD                                 
                 ,:DCLVTRNFR.TRN-TYP-RJC-STS-CD                                 
                 ,:DCLVTRNFR.PHSCL-SEQ-NBR                                      
                 ,:DCLVTRNFR.PHSCL-SEQ-STTS-CD                                  
                 ,:DCLVTRNFR.LGCL-SEQ-NBR                                       
                 ,:DCLVTRNFR.LGCL-SEQ-NR-STS-CD                                 
                 ,:DCLVTRNFR.RR-CD                                              
                 ,:DCLVTRNFR.BRANCH-CD                                          
                 ,:DCLVTRNFR.DVDND-NAA-CD                                       
                 ,:DCLVTRNFR.SELL-INSTN-NAA-CD                                  
                 ,:DCLVTRNFR.CASH-SWEEP-NAA-CD                                  
                 ,:DCLVTRNFR.PRTCP-CONTRA-CD                                    
                 ,:DCLVTRNFR.ACM-HOLDER-NAA-CD                                  
                 ,:DCLVTRNFR.ACCT-ACTIVITY-IND                                  
                 ,:DCLVTRNFR.ACCT-ORDERS-IND                                    
                 ,:DCLVTRNFR.ACCT-RJCT-RSBM-IND                                 
                 ,:DCLVTRNFR.ACCT-DB-BAL-T1-IND                                 
                 ,:DCLVTRNFR.ACCT-MRGN-DB-IND                                   
                 ,:DCLVTRNFR.ACCT-SHRT-PSTN-IND                                 
                 ,:DCLVTRNFR.ACCT-SEC-RSTRD-IND                                 
                 ,:DCLVTRNFR.ACCT-AST-EXCS-IND                                  
                 ,:DCLVTRNFR.ACCT-OPTN-PSTN-IND                                 
                 ,:DCLVTRNFR.ACCT-LTD-PRTNR-IND                                 
                 ,:DCLVTRNFR.ACCT-TIN-MSMTH-IND                                 
                 ,:DCLVTRNFR.ACCT-DPLCT-TRN-IND                                 
                 ,:DCLVTRNFR.ACCT-CUST-70-IND                                   
                 ,:DCLVTRNFR.ACCT-QULFD-PLN-IND                                 
                 ,:DCLVTRNFR.ACCT-MNGD-IND                                      
                 ,:DCLVTRNFR.ACCT-PRVT-RNG-IND                                  
                 ,:DCLVTRNFR.ACCT-BRKR-TIF-IND                                  
                 ,:DCLVTRNFR.NSCC-NON-ADP-IND                                   
                 ,:DCLVTRNFR.CYCLE-CD                                           
                 ,:DCLVTRNFR.DAYS-STTS-QTY                                      
                 ,:DCLVTRNFR.STTLM-DT                                           
                 ,:DCLVTRNFR.ACCT-NA-UPDT-IND                                   
                 ,:DCLVTRNFR.ACCT-TRNFR-FEE-AMT                                 
                 ,:DCLVTRNFR.ACCT-IRA-TRMNT-AMT                                 
                 ,:DCLVTRNFR.ACCT-IRA-MAINT-AMT                                 
                 ,:DCLVTRNFR.ACCT-DLRV-PRGR-IND                                 
                 ,:DCLVTRNFR.ACCT-CD                                            
                 ,:DCLVTRNFR.STTLM-ASCTD-DT                                     
                 ,:DCLVTRNFR.STTLM-ASCTD-STS-CD                                 
                 ,:DCLVTRNFR.RCRD-LNGTH-STTS-CD                                 
                 ,:DCLVTRNFR.RCRD-STTS-CD                                       
                 ,:DCLVTRNFR.NSCC-PEND-CD                                       
                 ,:DCLVTRNFR.NSCC-ACK-IND                                       
                 ,:DCLVTRNFR.CICS-TERM-ID-CD                                    
                 ,:DCLVTRNFR.PRGM-NM                                            
                 ,:DCLVTRNFR.CRT-TMSTP                                          
                 ,:DCLVTRNFR.UPDT-TMSTP                                         
                 ,:DCLVTRNFR.ACCT-EQUITY-AMT                                    
                 ,:DCLVTRNFR.ALERT-IND                                          
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
              PERFORM 0110-SETUP-TRNFR-RET-DATA                                 
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT25IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
              PERFORM 2600-CLOSE-TRNFR-ACAT-CSR-D                               
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      * CLOSE PENDIG TRANSFER CUSRSOR TBL IN SEQUENCE ORDER BY ACAT# *          
      *--------------------------------------------------------------*          
       2600-CLOSE-TRNFR-ACAT-CSR-D.                                             
           EXEC SQL                                                             
              CLOSE TRNFR_ACAT_CSR_D                                            
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
           ELSE                                                                 
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  OPEN HISTORY TRANSFER CUSRSOR TBL IN SEQUENCE ORDER BY      *          
      *  BRANCH ACCT ACAT#.                                          *          
      *--------------------------------------------------------------*          
       2700-OPEN-HTRNFR-ENGIN-CSR-D.                                            
           EXEC SQL                                                             
              OPEN HTRNFR_ENGIN_CSR_D                                           
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
           ELSE                                                                 
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      * FETCH HISTORY TRANSFER CUSRSOR TBL IN SEQUENCE ORDER BY      *          
      * BRANCH ACCT ACAT#                                            *          
      *--------------------------------------------------------------*          
       2800-FETCH-HTRNFR-ENGIN-CSR-D.                                           
           EXEC SQL                                                             
              FETCH                                                             
                  HTRNFR_ENGIN_CSR_D                                            
              INTO                                                              
                  :DCLVTRNHSTY.CLIENT-NBR                                       
                 ,:DCLVTRNHSTY.ACAT-CONTROL-NBR                                 
                 ,:DCLVTRNHSTY.SBMTG-PRTCP-NBR                                  
                 ,:DCLVTRNHSTY.SBMT-PRT-NR-STS-CD                               
                 ,:DCLVTRNHSTY.CONTROL-NBR-STS-CD                               
                 ,:DCLVTRNHSTY.DLVR-NBR                                         
                 ,:DCLVTRNHSTY.DLVR-NBR-STTS-CD                                 
                 ,:DCLVTRNHSTY.ACCT-DLVR-NBR                                    
                 ,:DCLVTRNHSTY.ACCT-DLVR-STTS-CD                                
                 ,:DCLVTRNHSTY.RCV-NBR                                          
                 ,:DCLVTRNHSTY.RCV-NBR-STTS-CD                                  
                 ,:DCLVTRNHSTY.ACCT-RCV-NBR                                     
                 ,:DCLVTRNHSTY.ACCT-RCV-STTS-CD                                 
                 ,:DCLVTRNHSTY.TRNFR-TYPE-CD                                    
                 ,:DCLVTRNHSTY.TRNFR-TYPE-STTS-CD                               
                 ,:DCLVTRNHSTY.TRANS-TYPE-CD                                    
                 ,:DCLVTRNHSTY.TRANS-TYPE-STTS-CD                               
                 ,:DCLVTRNHSTY.RCV-CUST-NM                                      
                 ,:DCLVTRNHSTY.RCV-CUST-NM-STS-CD                               
                 ,:DCLVTRNHSTY.RCV-SS-PRIM-NBR                                  
                 ,:DCLVTRNHSTY.RCV-SS-PRIM-STS-CD                               
                 ,:DCLVTRNHSTY.RCV-SS-SCNDY-NBR                                 
                 ,:DCLVTRNHSTY.RCV-SS-SCDY-STS-CD                               
                 ,:DCLVTRNHSTY.RCV-ACCT-TYPE-CD                                 
                 ,:DCLVTRNHSTY.RCV-ACT-TYP-STS-CD                               
                 ,:DCLVTRNHSTY.RCV-OCC-BRKR-NBR                                 
                 ,:DCLVTRNHSTY.RCV-OCC-STTS-CD                                  
                 ,:DCLVTRNHSTY.RCV-CRSPN-NBR                                    
                 ,:DCLVTRNHSTY.RCV-CRSPN-STTS-CD                                
                 ,:DCLVTRNHSTY.ACAT-CNTL-ASTD-NBR                               
                 ,:DCLVTRNHSTY.CNTL-ASTD-STTS-CD                                
                 ,:DCLVTRNHSTY.CMNT-TXT                                         
                 ,:DCLVTRNHSTY.CMNT-STTS-CD                                     
                 ,:DCLVTRNHSTY.PRCS-DT                                          
                 ,:DCLVTRNHSTY.STTS-CD                                          
                 ,:DCLVTRNHSTY.STTLM-TM-CD                                      
                 ,:DCLVTRNHSTY.VAL-FREE-CD                                      
                 ,:DCLVTRNHSTY.TRANS-RFRN-ID-CD                                 
                 ,:DCLVTRNHSTY.TRANS-RFRN-STTS-CD                               
                 ,:DCLVTRNHSTY.DB-CR-CD                                         
                 ,:DCLVTRNHSTY.DSTBN-SIDE-CD                                    
                 ,:DCLVTRNHSTY.SYS-ACT-CD                                       
                 ,:DCLVTRNHSTY.SYS-RJCT-RSN-CD                                  
                 ,:DCLVTRNHSTY.TRNFR-TYPE-RJC1-CD                               
                 ,:DCLVTRNHSTY.TRNFR-TYPE-RJC2-CD                               
                 ,:DCLVTRNHSTY.TRNFR-TYPE-RJCT-CD                               
                 ,:DCLVTRNHSTY.TRN-TYP-RJC-STS-CD                               
                 ,:DCLVTRNHSTY.PHSCL-SEQ-NBR                                    
                 ,:DCLVTRNHSTY.PHSCL-SEQ-STTS-CD                                
                 ,:DCLVTRNHSTY.LGCL-SEQ-NBR                                     
                 ,:DCLVTRNHSTY.LGCL-SEQ-NR-STS-CD                               
                 ,:DCLVTRNHSTY.RR-CD                                            
                 ,:DCLVTRNHSTY.BRANCH-CD                                        
                 ,:DCLVTRNHSTY.DVDND-NAA-CD                                     
                 ,:DCLVTRNHSTY.SELL-INSTN-NAA-CD                                
                 ,:DCLVTRNHSTY.CASH-SWEEP-NAA-CD                                
                 ,:DCLVTRNHSTY.PRTCP-CONTRA-CD                                  
                 ,:DCLVTRNHSTY.ACM-HOLDER-NAA-CD                                
                 ,:DCLVTRNHSTY.ACCT-ACTIVITY-IND                                
                 ,:DCLVTRNHSTY.ACCT-ORDERS-IND                                  
                 ,:DCLVTRNHSTY.ACCT-RJCT-RSBM-IND                               
                 ,:DCLVTRNHSTY.ACCT-DB-BAL-T1-IND                               
                 ,:DCLVTRNHSTY.ACCT-MRGN-DB-IND                                 
                 ,:DCLVTRNHSTY.ACCT-SHRT-PSTN-IND                               
                 ,:DCLVTRNHSTY.ACCT-SEC-RSTRD-IND                               
                 ,:DCLVTRNHSTY.ACCT-AST-EXCS-IND                                
                 ,:DCLVTRNHSTY.ACCT-OPTN-PSTN-IND                               
                 ,:DCLVTRNHSTY.ACCT-LTD-PRTNR-IND                               
                 ,:DCLVTRNHSTY.ACCT-TIN-MSMTH-IND                               
                 ,:DCLVTRNHSTY.ACCT-DPLCT-TRN-IND                               
                 ,:DCLVTRNHSTY.ACCT-CUST-70-IND                                 
                 ,:DCLVTRNHSTY.ACCT-QULFD-PLN-IND                               
                 ,:DCLVTRNHSTY.ACCT-MNGD-IND                                    
                 ,:DCLVTRNHSTY.ACCT-PRVT-RNG-IND                                
                 ,:DCLVTRNHSTY.ACCT-BRKR-TIF-IND                                
                 ,:DCLVTRNHSTY.NSCC-NON-ADP-IND                                 
                 ,:DCLVTRNHSTY.CYCLE-CD                                         
                 ,:DCLVTRNHSTY.DAYS-STTS-QTY                                    
                 ,:DCLVTRNHSTY.STTLM-DT                                         
                 ,:DCLVTRNHSTY.ACCT-NA-UPDT-IND                                 
                 ,:DCLVTRNHSTY.ACCT-TRNFR-FEE-AMT                               
                 ,:DCLVTRNHSTY.ACCT-IRA-TRMNT-AMT                               
                 ,:DCLVTRNHSTY.ACCT-IRA-MAINT-AMT                               
                 ,:DCLVTRNHSTY.ACCT-DLRV-PRGR-IND                               
                 ,:DCLVTRNHSTY.ACCT-CD                                          
                 ,:DCLVTRNHSTY.STTLM-ASCTD-DT                                   
                 ,:DCLVTRNHSTY.STTLM-ASCTD-STS-CD                               
                 ,:DCLVTRNHSTY.RCRD-LNGTH-STTS-CD                               
                 ,:DCLVTRNHSTY.RCRD-STTS-CD                                     
                 ,:DCLVTRNHSTY.NSCC-PEND-CD                                     
                 ,:DCLVTRNHSTY.NSCC-ACK-IND                                     
                 ,:DCLVTRNHSTY.CICS-TERM-ID-CD                                  
                 ,:DCLVTRNHSTY.PRGM-NM                                          
                 ,:DCLVTRNHSTY.CRT-TMSTP                                        
                 ,:DCLVTRNHSTY.UPDT-TMSTP                                       
                 ,:DCLVTRNHSTY.ACCT-EQUITY-AMT                                  
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
              PERFORM 1110-SETUP-HIST-TRNFR-RET-DATA                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT25IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
              PERFORM 2900-CLOSE-HTRNFR-ENGIN-CSR-D                             
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      * CLOSE HISTORY TRANSFER CUSRSOR TBL IN SEQUENCE ORDER BY      *          
      * BRANCH ACCT ACAT#                                            *          
      *--------------------------------------------------------------*          
       2900-CLOSE-HTRNFR-ENGIN-CSR-D.                                           
           EXEC SQL                                                             
              CLOSE HTRNFR_ENGIN_CSR_D                                          
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
           ELSE                                                                 
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *   OPEN HISTORY TRNFR CURSOR TBL IN DESCENDING SEQUENCE ORDER *          
      *   BY ACAT#                                                   *          
      *--------------------------------------------------------------*          
       3000-OPEN-HTRNFR-ACAT-CSR-D.                                             
           EXEC SQL                                                             
              OPEN HTRNFR_ACAT_CSR_D                                            
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
           ELSE                                                                 
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  FETCH HISTORY TRANSFER CUSRSOR TABEL IN DESCENDING SEQUENCE *          
      *  ORDER BY ACAT#                                              *          
      *--------------------------------------------------------------*          
       3100-FETCH-HTRNFR-ACAT-CSR-D.                                            
           EXEC SQL                                                             
              FETCH                                                             
                  HTRNFR_ACAT_CSR_D                                             
              INTO                                                              
                  :DCLVTRNHSTY.CLIENT-NBR                                       
                 ,:DCLVTRNHSTY.ACAT-CONTROL-NBR                                 
                 ,:DCLVTRNHSTY.SBMTG-PRTCP-NBR                                  
                 ,:DCLVTRNHSTY.SBMT-PRT-NR-STS-CD                               
                 ,:DCLVTRNHSTY.CONTROL-NBR-STS-CD                               
                 ,:DCLVTRNHSTY.DLVR-NBR                                         
                 ,:DCLVTRNHSTY.DLVR-NBR-STTS-CD                                 
                 ,:DCLVTRNHSTY.ACCT-DLVR-NBR                                    
                 ,:DCLVTRNHSTY.ACCT-DLVR-STTS-CD                                
                 ,:DCLVTRNHSTY.RCV-NBR                                          
                 ,:DCLVTRNHSTY.RCV-NBR-STTS-CD                                  
                 ,:DCLVTRNHSTY.ACCT-RCV-NBR                                     
                 ,:DCLVTRNHSTY.ACCT-RCV-STTS-CD                                 
                 ,:DCLVTRNHSTY.TRNFR-TYPE-CD                                    
                 ,:DCLVTRNHSTY.TRNFR-TYPE-STTS-CD                               
                 ,:DCLVTRNHSTY.TRANS-TYPE-CD                                    
                 ,:DCLVTRNHSTY.TRANS-TYPE-STTS-CD                               
                 ,:DCLVTRNHSTY.RCV-CUST-NM                                      
                 ,:DCLVTRNHSTY.RCV-CUST-NM-STS-CD                               
                 ,:DCLVTRNHSTY.RCV-SS-PRIM-NBR                                  
                 ,:DCLVTRNHSTY.RCV-SS-PRIM-STS-CD                               
                 ,:DCLVTRNHSTY.RCV-SS-SCNDY-NBR                                 
                 ,:DCLVTRNHSTY.RCV-SS-SCDY-STS-CD                               
                 ,:DCLVTRNHSTY.RCV-ACCT-TYPE-CD                                 
                 ,:DCLVTRNHSTY.RCV-ACT-TYP-STS-CD                               
                 ,:DCLVTRNHSTY.RCV-OCC-BRKR-NBR                                 
                 ,:DCLVTRNHSTY.RCV-OCC-STTS-CD                                  
                 ,:DCLVTRNHSTY.RCV-CRSPN-NBR                                    
                 ,:DCLVTRNHSTY.RCV-CRSPN-STTS-CD                                
                 ,:DCLVTRNHSTY.ACAT-CNTL-ASTD-NBR                               
                 ,:DCLVTRNHSTY.CNTL-ASTD-STTS-CD                                
                 ,:DCLVTRNHSTY.CMNT-TXT                                         
                 ,:DCLVTRNHSTY.CMNT-STTS-CD                                     
                 ,:DCLVTRNHSTY.PRCS-DT                                          
                 ,:DCLVTRNHSTY.STTS-CD                                          
                 ,:DCLVTRNHSTY.STTLM-TM-CD                                      
                 ,:DCLVTRNHSTY.VAL-FREE-CD                                      
                 ,:DCLVTRNHSTY.TRANS-RFRN-ID-CD                                 
                 ,:DCLVTRNHSTY.TRANS-RFRN-STTS-CD                               
                 ,:DCLVTRNHSTY.DB-CR-CD                                         
                 ,:DCLVTRNHSTY.DSTBN-SIDE-CD                                    
                 ,:DCLVTRNHSTY.SYS-ACT-CD                                       
                 ,:DCLVTRNHSTY.SYS-RJCT-RSN-CD                                  
                 ,:DCLVTRNHSTY.TRNFR-TYPE-RJC1-CD                               
                 ,:DCLVTRNHSTY.TRNFR-TYPE-RJC2-CD                               
                 ,:DCLVTRNHSTY.TRNFR-TYPE-RJCT-CD                               
                 ,:DCLVTRNHSTY.TRN-TYP-RJC-STS-CD                               
                 ,:DCLVTRNHSTY.PHSCL-SEQ-NBR                                    
                 ,:DCLVTRNHSTY.PHSCL-SEQ-STTS-CD                                
                 ,:DCLVTRNHSTY.LGCL-SEQ-NBR                                     
                 ,:DCLVTRNHSTY.LGCL-SEQ-NR-STS-CD                               
                 ,:DCLVTRNHSTY.RR-CD                                            
                 ,:DCLVTRNHSTY.BRANCH-CD                                        
                 ,:DCLVTRNHSTY.DVDND-NAA-CD                                     
                 ,:DCLVTRNHSTY.SELL-INSTN-NAA-CD                                
                 ,:DCLVTRNHSTY.CASH-SWEEP-NAA-CD                                
                 ,:DCLVTRNHSTY.PRTCP-CONTRA-CD                                  
                 ,:DCLVTRNHSTY.ACM-HOLDER-NAA-CD                                
                 ,:DCLVTRNHSTY.ACCT-ACTIVITY-IND                                
                 ,:DCLVTRNHSTY.ACCT-ORDERS-IND                                  
                 ,:DCLVTRNHSTY.ACCT-RJCT-RSBM-IND                               
                 ,:DCLVTRNHSTY.ACCT-DB-BAL-T1-IND                               
                 ,:DCLVTRNHSTY.ACCT-MRGN-DB-IND                                 
                 ,:DCLVTRNHSTY.ACCT-SHRT-PSTN-IND                               
                 ,:DCLVTRNHSTY.ACCT-SEC-RSTRD-IND                               
                 ,:DCLVTRNHSTY.ACCT-AST-EXCS-IND                                
                 ,:DCLVTRNHSTY.ACCT-OPTN-PSTN-IND                               
                 ,:DCLVTRNHSTY.ACCT-LTD-PRTNR-IND                               
                 ,:DCLVTRNHSTY.ACCT-TIN-MSMTH-IND                               
                 ,:DCLVTRNHSTY.ACCT-DPLCT-TRN-IND                               
                 ,:DCLVTRNHSTY.ACCT-CUST-70-IND                                 
                 ,:DCLVTRNHSTY.ACCT-QULFD-PLN-IND                               
                 ,:DCLVTRNHSTY.ACCT-MNGD-IND                                    
                 ,:DCLVTRNHSTY.ACCT-PRVT-RNG-IND                                
                 ,:DCLVTRNHSTY.ACCT-BRKR-TIF-IND                                
                 ,:DCLVTRNHSTY.NSCC-NON-ADP-IND                                 
                 ,:DCLVTRNHSTY.CYCLE-CD                                         
                 ,:DCLVTRNHSTY.DAYS-STTS-QTY                                    
                 ,:DCLVTRNHSTY.STTLM-DT                                         
                 ,:DCLVTRNHSTY.ACCT-NA-UPDT-IND                                 
                 ,:DCLVTRNHSTY.ACCT-TRNFR-FEE-AMT                               
                 ,:DCLVTRNHSTY.ACCT-IRA-TRMNT-AMT                               
                 ,:DCLVTRNHSTY.ACCT-IRA-MAINT-AMT                               
                 ,:DCLVTRNHSTY.ACCT-DLRV-PRGR-IND                               
                 ,:DCLVTRNHSTY.ACCT-CD                                          
                 ,:DCLVTRNHSTY.STTLM-ASCTD-DT                                   
                 ,:DCLVTRNHSTY.STTLM-ASCTD-STS-CD                               
                 ,:DCLVTRNHSTY.RCRD-LNGTH-STTS-CD                               
                 ,:DCLVTRNHSTY.RCRD-STTS-CD                                     
                 ,:DCLVTRNHSTY.NSCC-PEND-CD                                     
                 ,:DCLVTRNHSTY.NSCC-ACK-IND                                     
                 ,:DCLVTRNHSTY.CICS-TERM-ID-CD                                  
                 ,:DCLVTRNHSTY.PRGM-NM                                          
                 ,:DCLVTRNHSTY.CRT-TMSTP                                        
                 ,:DCLVTRNHSTY.UPDT-TMSTP                                       
                 ,:DCLVTRNHSTY.ACCT-EQUITY-AMT                                  
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
              PERFORM 1110-SETUP-HIST-TRNFR-RET-DATA                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT25IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
              PERFORM 3200-CLOSE-HTRNFR-ACAT-CSR-D                              
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  CLOSE HISTORY TRANSFER CUSRSOR TBL IN DESCENDING SEQUENCE   *          
      *  ORDER BY ACAT#                                              *          
      *--------------------------------------------------------------*          
       3200-CLOSE-HTRNFR-ACAT-CSR-D.                                            
           EXEC SQL                                                             
              CLOSE HTRNFR_ACAT_CSR_D                                           
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
           ELSE                                                                 
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *   OPEN PENDING TRNFR CURSOR TBL IN ASCENDING SEQUENCE ORDER  *          
      *   BY BRANCH ACCT ACAT#. (VERSION 2)                          *          
      *--------------------------------------------------------------*          
       3300-OPEN-TRNFR-ENGIN-CSR2.                                              
           IF WS-PASSED-TO-BR < '100'                                           
              MOVE '100' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '150'                                           
              MOVE '150' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '200'                                           
              MOVE '200' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '250'                                           
              MOVE '250' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '300'                                           
              MOVE '300' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '350'                                           
              MOVE '350' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '400'                                           
              MOVE '400' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '450'                                           
              MOVE '450' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '500'                                           
              MOVE '500' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '550'                                           
              MOVE '550' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '600'                                           
              MOVE '600' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '650'                                           
              MOVE '650' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '700'                                           
              MOVE '700' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '750'                                           
              MOVE '750' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '800'                                           
              MOVE '800' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '850'                                           
              MOVE '850' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '900'                                           
              MOVE '900' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
              MOVE HIGH-VALUES TO WS-PASSED-TO-BR                               
           END-IF.                                                              
           MOVE WS-PASSED-TO-BR TO ACAT25-PASS-TO-BR.                           
           EXEC SQL                                                             
              OPEN TRNFR_ENGIN_CSR2                                             
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
           ELSE                                                                 
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  FETCH PENDING TRNFR CURSOR TBL IN ASCENDING SEQUENCE ORDER  *          
      *  BY BRANCH ACCT ACAT#. (VERSION 2)                           *          
      *--------------------------------------------------------------*          
       3400-FETCH-TRNFR-ENGIN-CSR2.                                             
           EXEC SQL                                                             
              FETCH                                                             
                  TRNFR_ENGIN_CSR2                                              
              INTO                                                              
                  :DCLVTRNFR.CLIENT-NBR                                         
                 ,:DCLVTRNFR.ACAT-CONTROL-NBR                                   
                 ,:DCLVTRNFR.SBMTG-PRTCP-NBR                                    
                 ,:DCLVTRNFR.SBMT-PRT-NR-STS-CD                                 
                 ,:DCLVTRNFR.CONTROL-NBR-STS-CD                                 
                 ,:DCLVTRNFR.DLVR-NBR                                           
                 ,:DCLVTRNFR.DLVR-NBR-STTS-CD                                   
                 ,:DCLVTRNFR.ACCT-DLVR-NBR                                      
                 ,:DCLVTRNFR.ACCT-DLVR-STTS-CD                                  
                 ,:DCLVTRNFR.RCV-NBR                                            
                 ,:DCLVTRNFR.RCV-NBR-STTS-CD                                    
                 ,:DCLVTRNFR.ACCT-RCV-NBR                                       
                 ,:DCLVTRNFR.ACCT-RCV-STTS-CD                                   
                 ,:DCLVTRNFR.TRNFR-TYPE-CD                                      
                 ,:DCLVTRNFR.TRNFR-TYPE-STTS-CD                                 
                 ,:DCLVTRNFR.TRANS-TYPE-CD                                      
                 ,:DCLVTRNFR.TRANS-TYPE-STTS-CD                                 
                 ,:DCLVTRNFR.RCV-CUST-NM                                        
                 ,:DCLVTRNFR.RCV-CUST-NM-STS-CD                                 
                 ,:DCLVTRNFR.RCV-SS-PRIM-NBR                                    
                 ,:DCLVTRNFR.RCV-SS-PRIM-STS-CD                                 
                 ,:DCLVTRNFR.RCV-SS-SCNDY-NBR                                   
                 ,:DCLVTRNFR.RCV-SS-SCDY-STS-CD                                 
                 ,:DCLVTRNFR.RCV-ACCT-TYPE-CD                                   
                 ,:DCLVTRNFR.RCV-ACT-TYP-STS-CD                                 
                 ,:DCLVTRNFR.RCV-OCC-BRKR-NBR                                   
                 ,:DCLVTRNFR.RCV-OCC-STTS-CD                                    
                 ,:DCLVTRNFR.RCV-CRSPN-NBR                                      
                 ,:DCLVTRNFR.RCV-CRSPN-STTS-CD                                  
                 ,:DCLVTRNFR.ACAT-CNTL-ASTD-NBR                                 
                 ,:DCLVTRNFR.CNTL-ASTD-STTS-CD                                  
                 ,:DCLVTRNFR.CMNT-TXT                                           
                 ,:DCLVTRNFR.CMNT-STTS-CD                                       
                 ,:DCLVTRNFR.PRCS-DT                                            
                 ,:DCLVTRNFR.STTS-CD                                            
                 ,:DCLVTRNFR.STTLM-TM-CD                                        
                 ,:DCLVTRNFR.VAL-FREE-CD                                        
                 ,:DCLVTRNFR.TRANS-RFRN-ID-CD                                   
                 ,:DCLVTRNFR.TRANS-RFRN-STTS-CD                                 
                 ,:DCLVTRNFR.DB-CR-CD                                           
                 ,:DCLVTRNFR.DSTBN-SIDE-CD                                      
                 ,:DCLVTRNFR.SYS-ACT-CD                                         
                 ,:DCLVTRNFR.SYS-RJCT-RSN-CD                                    
                 ,:DCLVTRNFR.TRNFR-TYPE-RJC1-CD                                 
                 ,:DCLVTRNFR.TRNFR-TYPE-RJC2-CD                                 
                 ,:DCLVTRNFR.TRNFR-TYPE-RJCT-CD                                 
                 ,:DCLVTRNFR.TRN-TYP-RJC-STS-CD                                 
                 ,:DCLVTRNFR.PHSCL-SEQ-NBR                                      
                 ,:DCLVTRNFR.PHSCL-SEQ-STTS-CD                                  
                 ,:DCLVTRNFR.LGCL-SEQ-NBR                                       
                 ,:DCLVTRNFR.LGCL-SEQ-NR-STS-CD                                 
                 ,:DCLVTRNFR.RR-CD                                              
                 ,:DCLVTRNFR.BRANCH-CD                                          
                 ,:DCLVTRNFR.DVDND-NAA-CD                                       
                 ,:DCLVTRNFR.SELL-INSTN-NAA-CD                                  
                 ,:DCLVTRNFR.CASH-SWEEP-NAA-CD                                  
                 ,:DCLVTRNFR.PRTCP-CONTRA-CD                                    
                 ,:DCLVTRNFR.ACM-HOLDER-NAA-CD                                  
                 ,:DCLVTRNFR.ACCT-ACTIVITY-IND                                  
                 ,:DCLVTRNFR.ACCT-ORDERS-IND                                    
                 ,:DCLVTRNFR.ACCT-RJCT-RSBM-IND                                 
                 ,:DCLVTRNFR.ACCT-DB-BAL-T1-IND                                 
                 ,:DCLVTRNFR.ACCT-MRGN-DB-IND                                   
                 ,:DCLVTRNFR.ACCT-SHRT-PSTN-IND                                 
                 ,:DCLVTRNFR.ACCT-SEC-RSTRD-IND                                 
                 ,:DCLVTRNFR.ACCT-AST-EXCS-IND                                  
                 ,:DCLVTRNFR.ACCT-OPTN-PSTN-IND                                 
                 ,:DCLVTRNFR.ACCT-LTD-PRTNR-IND                                 
                 ,:DCLVTRNFR.ACCT-TIN-MSMTH-IND                                 
                 ,:DCLVTRNFR.ACCT-DPLCT-TRN-IND                                 
                 ,:DCLVTRNFR.ACCT-CUST-70-IND                                   
                 ,:DCLVTRNFR.ACCT-QULFD-PLN-IND                                 
                 ,:DCLVTRNFR.ACCT-MNGD-IND                                      
                 ,:DCLVTRNFR.ACCT-PRVT-RNG-IND                                  
                 ,:DCLVTRNFR.ACCT-BRKR-TIF-IND                                  
                 ,:DCLVTRNFR.NSCC-NON-ADP-IND                                   
                 ,:DCLVTRNFR.CYCLE-CD                                           
                 ,:DCLVTRNFR.DAYS-STTS-QTY                                      
                 ,:DCLVTRNFR.STTLM-DT                                           
                 ,:DCLVTRNFR.ACCT-NA-UPDT-IND                                   
                 ,:DCLVTRNFR.ACCT-TRNFR-FEE-AMT                                 
                 ,:DCLVTRNFR.ACCT-IRA-TRMNT-AMT                                 
                 ,:DCLVTRNFR.ACCT-IRA-MAINT-AMT                                 
                 ,:DCLVTRNFR.ACCT-DLRV-PRGR-IND                                 
                 ,:DCLVTRNFR.ACCT-CD                                            
                 ,:DCLVTRNFR.STTLM-ASCTD-DT                                     
                 ,:DCLVTRNFR.STTLM-ASCTD-STS-CD                                 
                 ,:DCLVTRNFR.RCRD-LNGTH-STTS-CD                                 
                 ,:DCLVTRNFR.RCRD-STTS-CD                                       
                 ,:DCLVTRNFR.NSCC-PEND-CD                                       
                 ,:DCLVTRNFR.NSCC-ACK-IND                                       
                 ,:DCLVTRNFR.CICS-TERM-ID-CD                                    
                 ,:DCLVTRNFR.PRGM-NM                                            
                 ,:DCLVTRNFR.CRT-TMSTP                                          
                 ,:DCLVTRNFR.UPDT-TMSTP                                         
                 ,:DCLVTRNFR.ACCT-EQUITY-AMT                                    
                 ,:DCLVTRNFR.ALERT-IND                                          
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
              PERFORM 0110-SETUP-TRNFR-RET-DATA                                 
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              IF WS-PASSED-TO-BR NOT = HIGH-VALUES                              
                 PERFORM 3500-CLOSE-TRNFR-ENGIN-CSR2                            
                 MOVE WS-PASSED-TO-BR TO WS-PASSED-BR                           
                 PERFORM 3300-OPEN-TRNFR-ENGIN-CSR2                             
                 GO TO 3400-FETCH-TRNFR-ENGIN-CSR2                              
              END-IF                                                            
              SET ACAT25IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
              PERFORM 3500-CLOSE-TRNFR-ENGIN-CSR2                               
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  CLOSE PENDING TRNFR CURSOR TBL IN ASCENDING SEQUENCE ORDER  *          
      *  BY BRANCH ACCT ACAT#. (VERSION 2)                           *          
      *--------------------------------------------------------------*          
       3500-CLOSE-TRNFR-ENGIN-CSR2.                                             
           EXEC SQL                                                             
              CLOSE TRNFR_ENGIN_CSR2                                            
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
           ELSE                                                                 
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *--------------------------------------------------------------*          
      *   OPEN PENDING TRNFR CURSOR TBL IN ASCENDING SEQUENCE ORDER  *          
      *   BY ACAT# (VERSION 2)                                       *          
      *--------------------------------------------------------------*          
       3600-OPEN-TRNFR-ACAT-CSR2.                                               
           EXEC SQL                                                             
              OPEN TRNFR_ACAT_CSR2                                              
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
           ELSE                                                                 
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  FETCH PENDING TRNFR CURSOR TBL IN ASCENDING SEQUENCE ORDER  *          
      *  BY ACAT#. (VERSION2)                                        *          
      *--------------------------------------------------------------*          
       3700-FETCH-TRNFR-ACAT-CSR2.                                              
           EXEC SQL                                                             
              FETCH                                                             
                  TRNFR_ACAT_CSR2                                               
              INTO                                                              
                  :DCLVTRNFR.CLIENT-NBR                                         
                 ,:DCLVTRNFR.ACAT-CONTROL-NBR                                   
                 ,:DCLVTRNFR.SBMTG-PRTCP-NBR                                    
                 ,:DCLVTRNFR.SBMT-PRT-NR-STS-CD                                 
                 ,:DCLVTRNFR.CONTROL-NBR-STS-CD                                 
                 ,:DCLVTRNFR.DLVR-NBR                                           
                 ,:DCLVTRNFR.DLVR-NBR-STTS-CD                                   
                 ,:DCLVTRNFR.ACCT-DLVR-NBR                                      
                 ,:DCLVTRNFR.ACCT-DLVR-STTS-CD                                  
                 ,:DCLVTRNFR.RCV-NBR                                            
                 ,:DCLVTRNFR.RCV-NBR-STTS-CD                                    
                 ,:DCLVTRNFR.ACCT-RCV-NBR                                       
                 ,:DCLVTRNFR.ACCT-RCV-STTS-CD                                   
                 ,:DCLVTRNFR.TRNFR-TYPE-CD                                      
                 ,:DCLVTRNFR.TRNFR-TYPE-STTS-CD                                 
                 ,:DCLVTRNFR.TRANS-TYPE-CD                                      
                 ,:DCLVTRNFR.TRANS-TYPE-STTS-CD                                 
                 ,:DCLVTRNFR.RCV-CUST-NM                                        
                 ,:DCLVTRNFR.RCV-CUST-NM-STS-CD                                 
                 ,:DCLVTRNFR.RCV-SS-PRIM-NBR                                    
                 ,:DCLVTRNFR.RCV-SS-PRIM-STS-CD                                 
                 ,:DCLVTRNFR.RCV-SS-SCNDY-NBR                                   
                 ,:DCLVTRNFR.RCV-SS-SCDY-STS-CD                                 
                 ,:DCLVTRNFR.RCV-ACCT-TYPE-CD                                   
                 ,:DCLVTRNFR.RCV-ACT-TYP-STS-CD                                 
                 ,:DCLVTRNFR.RCV-OCC-BRKR-NBR                                   
                 ,:DCLVTRNFR.RCV-OCC-STTS-CD                                    
                 ,:DCLVTRNFR.RCV-CRSPN-NBR                                      
                 ,:DCLVTRNFR.RCV-CRSPN-STTS-CD                                  
                 ,:DCLVTRNFR.ACAT-CNTL-ASTD-NBR                                 
                 ,:DCLVTRNFR.CNTL-ASTD-STTS-CD                                  
                 ,:DCLVTRNFR.CMNT-TXT                                           
                 ,:DCLVTRNFR.CMNT-STTS-CD                                       
                 ,:DCLVTRNFR.PRCS-DT                                            
                 ,:DCLVTRNFR.STTS-CD                                            
                 ,:DCLVTRNFR.STTLM-TM-CD                                        
                 ,:DCLVTRNFR.VAL-FREE-CD                                        
                 ,:DCLVTRNFR.TRANS-RFRN-ID-CD                                   
                 ,:DCLVTRNFR.TRANS-RFRN-STTS-CD                                 
                 ,:DCLVTRNFR.DB-CR-CD                                           
                 ,:DCLVTRNFR.DSTBN-SIDE-CD                                      
                 ,:DCLVTRNFR.SYS-ACT-CD                                         
                 ,:DCLVTRNFR.SYS-RJCT-RSN-CD                                    
                 ,:DCLVTRNFR.TRNFR-TYPE-RJC1-CD                                 
                 ,:DCLVTRNFR.TRNFR-TYPE-RJC2-CD                                 
                 ,:DCLVTRNFR.TRNFR-TYPE-RJCT-CD                                 
                 ,:DCLVTRNFR.TRN-TYP-RJC-STS-CD                                 
                 ,:DCLVTRNFR.PHSCL-SEQ-NBR                                      
                 ,:DCLVTRNFR.PHSCL-SEQ-STTS-CD                                  
                 ,:DCLVTRNFR.LGCL-SEQ-NBR                                       
                 ,:DCLVTRNFR.LGCL-SEQ-NR-STS-CD                                 
                 ,:DCLVTRNFR.RR-CD                                              
                 ,:DCLVTRNFR.BRANCH-CD                                          
                 ,:DCLVTRNFR.DVDND-NAA-CD                                       
                 ,:DCLVTRNFR.SELL-INSTN-NAA-CD                                  
                 ,:DCLVTRNFR.CASH-SWEEP-NAA-CD                                  
                 ,:DCLVTRNFR.PRTCP-CONTRA-CD                                    
                 ,:DCLVTRNFR.ACM-HOLDER-NAA-CD                                  
                 ,:DCLVTRNFR.ACCT-ACTIVITY-IND                                  
                 ,:DCLVTRNFR.ACCT-ORDERS-IND                                    
                 ,:DCLVTRNFR.ACCT-RJCT-RSBM-IND                                 
                 ,:DCLVTRNFR.ACCT-DB-BAL-T1-IND                                 
                 ,:DCLVTRNFR.ACCT-MRGN-DB-IND                                   
                 ,:DCLVTRNFR.ACCT-SHRT-PSTN-IND                                 
                 ,:DCLVTRNFR.ACCT-SEC-RSTRD-IND                                 
                 ,:DCLVTRNFR.ACCT-AST-EXCS-IND                                  
                 ,:DCLVTRNFR.ACCT-OPTN-PSTN-IND                                 
                 ,:DCLVTRNFR.ACCT-LTD-PRTNR-IND                                 
                 ,:DCLVTRNFR.ACCT-TIN-MSMTH-IND                                 
                 ,:DCLVTRNFR.ACCT-DPLCT-TRN-IND                                 
                 ,:DCLVTRNFR.ACCT-CUST-70-IND                                   
                 ,:DCLVTRNFR.ACCT-QULFD-PLN-IND                                 
                 ,:DCLVTRNFR.ACCT-MNGD-IND                                      
                 ,:DCLVTRNFR.ACCT-PRVT-RNG-IND                                  
                 ,:DCLVTRNFR.ACCT-BRKR-TIF-IND                                  
                 ,:DCLVTRNFR.NSCC-NON-ADP-IND                                   
                 ,:DCLVTRNFR.CYCLE-CD                                           
                 ,:DCLVTRNFR.DAYS-STTS-QTY                                      
                 ,:DCLVTRNFR.STTLM-DT                                           
                 ,:DCLVTRNFR.ACCT-NA-UPDT-IND                                   
                 ,:DCLVTRNFR.ACCT-TRNFR-FEE-AMT                                 
                 ,:DCLVTRNFR.ACCT-IRA-TRMNT-AMT                                 
                 ,:DCLVTRNFR.ACCT-IRA-MAINT-AMT                                 
                 ,:DCLVTRNFR.ACCT-DLRV-PRGR-IND                                 
                 ,:DCLVTRNFR.ACCT-CD                                            
                 ,:DCLVTRNFR.STTLM-ASCTD-DT                                     
                 ,:DCLVTRNFR.STTLM-ASCTD-STS-CD                                 
                 ,:DCLVTRNFR.RCRD-LNGTH-STTS-CD                                 
                 ,:DCLVTRNFR.RCRD-STTS-CD                                       
                 ,:DCLVTRNFR.NSCC-PEND-CD                                       
                 ,:DCLVTRNFR.NSCC-ACK-IND                                       
                 ,:DCLVTRNFR.CICS-TERM-ID-CD                                    
                 ,:DCLVTRNFR.PRGM-NM                                            
                 ,:DCLVTRNFR.CRT-TMSTP                                          
                 ,:DCLVTRNFR.UPDT-TMSTP                                         
                 ,:DCLVTRNFR.ACCT-EQUITY-AMT                                    
                 ,:DCLVTRNFR.ALERT-IND                                          
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
              PERFORM 0110-SETUP-TRNFR-RET-DATA                                 
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT25IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
              PERFORM 3800-CLOSE-TRNFR-ACAT-CSR2                                
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  CLOSE PENDING TRNFR CURSOR TBL IN ASCENDING SEQUENCE ORDER  *          
      *  BY ACAT#. (VERSION 2)                                       *          
      *--------------------------------------------------------------*          
       3800-CLOSE-TRNFR-ACAT-CSR2.                                              
           EXEC SQL                                                             
              CLOSE TRNFR_ACAT_CSR2                                             
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
           ELSE                                                                 
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  CLOSE HISTORY TRNFR CURSOR TBL IN ASCENDING SEQUENCE ORDER  *          
      *  BY BRANCH ACCT ACAT#. (VERSION 2)                           *          
      *--------------------------------------------------------------*          
       3900-OPEN-HTRNFR-ENGIN-CSR2.                                             
           IF WS-PASSED-TO-BR < '100'                                           
              MOVE '100' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '150'                                           
              MOVE '150' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '200'                                           
              MOVE '200' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '250'                                           
              MOVE '250' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '300'                                           
              MOVE '300' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '350'                                           
              MOVE '350' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '400'                                           
              MOVE '400' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '450'                                           
              MOVE '450' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '500'                                           
              MOVE '500' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '550'                                           
              MOVE '550' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '600'                                           
              MOVE '600' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '650'                                           
              MOVE '650' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '700'                                           
              MOVE '700' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '750'                                           
              MOVE '750' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '800'                                           
              MOVE '800' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '850'                                           
              MOVE '850' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
           IF WS-PASSED-TO-BR < '900'                                           
              MOVE '900' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
              MOVE HIGH-VALUES TO WS-PASSED-TO-BR                               
           END-IF.                                                              
           MOVE WS-PASSED-TO-BR TO ACAT25-PASS-TO-BR.                           
           EXEC SQL                                                             
              OPEN HTRNFR_ENGIN_CSR2                                            
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
           ELSE                                                                 
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  FETCH HISTORY TRANSFER CUSRSOR TABEL IN ASCENDING SEQUENCE  *          
      *  ORDER BY BRANCH ACCT ACAT#. (VERSION 2)                     *          
      *--------------------------------------------------------------*          
       4000-FETCH-HTRNFR-ENGIN-CSR2.                                            
           EXEC SQL                                                             
              FETCH                                                             
                  HTRNFR_ENGIN_CSR2                                             
              INTO                                                              
                  :DCLVTRNHSTY.CLIENT-NBR                                       
                 ,:DCLVTRNHSTY.ACAT-CONTROL-NBR                                 
                 ,:DCLVTRNHSTY.SBMTG-PRTCP-NBR                                  
                 ,:DCLVTRNHSTY.SBMT-PRT-NR-STS-CD                               
                 ,:DCLVTRNHSTY.CONTROL-NBR-STS-CD                               
                 ,:DCLVTRNHSTY.DLVR-NBR                                         
                 ,:DCLVTRNHSTY.DLVR-NBR-STTS-CD                                 
                 ,:DCLVTRNHSTY.ACCT-DLVR-NBR                                    
                 ,:DCLVTRNHSTY.ACCT-DLVR-STTS-CD                                
                 ,:DCLVTRNHSTY.RCV-NBR                                          
                 ,:DCLVTRNHSTY.RCV-NBR-STTS-CD                                  
                 ,:DCLVTRNHSTY.ACCT-RCV-NBR                                     
                 ,:DCLVTRNHSTY.ACCT-RCV-STTS-CD                                 
                 ,:DCLVTRNHSTY.TRNFR-TYPE-CD                                    
                 ,:DCLVTRNHSTY.TRNFR-TYPE-STTS-CD                               
                 ,:DCLVTRNHSTY.TRANS-TYPE-CD                                    
                 ,:DCLVTRNHSTY.TRANS-TYPE-STTS-CD                               
                 ,:DCLVTRNHSTY.RCV-CUST-NM                                      
                 ,:DCLVTRNHSTY.RCV-CUST-NM-STS-CD                               
                 ,:DCLVTRNHSTY.RCV-SS-PRIM-NBR                                  
                 ,:DCLVTRNHSTY.RCV-SS-PRIM-STS-CD                               
                 ,:DCLVTRNHSTY.RCV-SS-SCNDY-NBR                                 
                 ,:DCLVTRNHSTY.RCV-SS-SCDY-STS-CD                               
                 ,:DCLVTRNHSTY.RCV-ACCT-TYPE-CD                                 
                 ,:DCLVTRNHSTY.RCV-ACT-TYP-STS-CD                               
                 ,:DCLVTRNHSTY.RCV-OCC-BRKR-NBR                                 
                 ,:DCLVTRNHSTY.RCV-OCC-STTS-CD                                  
                 ,:DCLVTRNHSTY.RCV-CRSPN-NBR                                    
                 ,:DCLVTRNHSTY.RCV-CRSPN-STTS-CD                                
                 ,:DCLVTRNHSTY.ACAT-CNTL-ASTD-NBR                               
                 ,:DCLVTRNHSTY.CNTL-ASTD-STTS-CD                                
                 ,:DCLVTRNHSTY.CMNT-TXT                                         
                 ,:DCLVTRNHSTY.CMNT-STTS-CD                                     
                 ,:DCLVTRNHSTY.PRCS-DT                                          
                 ,:DCLVTRNHSTY.STTS-CD                                          
                 ,:DCLVTRNHSTY.STTLM-TM-CD                                      
                 ,:DCLVTRNHSTY.VAL-FREE-CD                                      
                 ,:DCLVTRNHSTY.TRANS-RFRN-ID-CD                                 
                 ,:DCLVTRNHSTY.TRANS-RFRN-STTS-CD                               
                 ,:DCLVTRNHSTY.DB-CR-CD                                         
                 ,:DCLVTRNHSTY.DSTBN-SIDE-CD                                    
                 ,:DCLVTRNHSTY.SYS-ACT-CD                                       
                 ,:DCLVTRNHSTY.SYS-RJCT-RSN-CD                                  
                 ,:DCLVTRNHSTY.TRNFR-TYPE-RJC1-CD                               
                 ,:DCLVTRNHSTY.TRNFR-TYPE-RJC2-CD                               
                 ,:DCLVTRNHSTY.TRNFR-TYPE-RJCT-CD                               
                 ,:DCLVTRNHSTY.TRN-TYP-RJC-STS-CD                               
                 ,:DCLVTRNHSTY.PHSCL-SEQ-NBR                                    
                 ,:DCLVTRNHSTY.PHSCL-SEQ-STTS-CD                                
                 ,:DCLVTRNHSTY.LGCL-SEQ-NBR                                     
                 ,:DCLVTRNHSTY.LGCL-SEQ-NR-STS-CD                               
                 ,:DCLVTRNHSTY.RR-CD                                            
                 ,:DCLVTRNHSTY.BRANCH-CD                                        
                 ,:DCLVTRNHSTY.DVDND-NAA-CD                                     
                 ,:DCLVTRNHSTY.SELL-INSTN-NAA-CD                                
                 ,:DCLVTRNHSTY.CASH-SWEEP-NAA-CD                                
                 ,:DCLVTRNHSTY.PRTCP-CONTRA-CD                                  
                 ,:DCLVTRNHSTY.ACM-HOLDER-NAA-CD                                
                 ,:DCLVTRNHSTY.ACCT-ACTIVITY-IND                                
                 ,:DCLVTRNHSTY.ACCT-ORDERS-IND                                  
                 ,:DCLVTRNHSTY.ACCT-RJCT-RSBM-IND                               
                 ,:DCLVTRNHSTY.ACCT-DB-BAL-T1-IND                               
                 ,:DCLVTRNHSTY.ACCT-MRGN-DB-IND                                 
                 ,:DCLVTRNHSTY.ACCT-SHRT-PSTN-IND                               
                 ,:DCLVTRNHSTY.ACCT-SEC-RSTRD-IND                               
                 ,:DCLVTRNHSTY.ACCT-AST-EXCS-IND                                
                 ,:DCLVTRNHSTY.ACCT-OPTN-PSTN-IND                               
                 ,:DCLVTRNHSTY.ACCT-LTD-PRTNR-IND                               
                 ,:DCLVTRNHSTY.ACCT-TIN-MSMTH-IND                               
                 ,:DCLVTRNHSTY.ACCT-DPLCT-TRN-IND                               
                 ,:DCLVTRNHSTY.ACCT-CUST-70-IND                                 
                 ,:DCLVTRNHSTY.ACCT-QULFD-PLN-IND                               
                 ,:DCLVTRNHSTY.ACCT-MNGD-IND                                    
                 ,:DCLVTRNHSTY.ACCT-PRVT-RNG-IND                                
                 ,:DCLVTRNHSTY.ACCT-BRKR-TIF-IND                                
                 ,:DCLVTRNHSTY.NSCC-NON-ADP-IND                                 
                 ,:DCLVTRNHSTY.CYCLE-CD                                         
                 ,:DCLVTRNHSTY.DAYS-STTS-QTY                                    
                 ,:DCLVTRNHSTY.STTLM-DT                                         
                 ,:DCLVTRNHSTY.ACCT-NA-UPDT-IND                                 
                 ,:DCLVTRNHSTY.ACCT-TRNFR-FEE-AMT                               
                 ,:DCLVTRNHSTY.ACCT-IRA-TRMNT-AMT                               
                 ,:DCLVTRNHSTY.ACCT-IRA-MAINT-AMT                               
                 ,:DCLVTRNHSTY.ACCT-DLRV-PRGR-IND                               
                 ,:DCLVTRNHSTY.ACCT-CD                                          
                 ,:DCLVTRNHSTY.STTLM-ASCTD-DT                                   
                 ,:DCLVTRNHSTY.STTLM-ASCTD-STS-CD                               
                 ,:DCLVTRNHSTY.RCRD-LNGTH-STTS-CD                               
                 ,:DCLVTRNHSTY.RCRD-STTS-CD                                     
                 ,:DCLVTRNHSTY.NSCC-PEND-CD                                     
                 ,:DCLVTRNHSTY.NSCC-ACK-IND                                     
                 ,:DCLVTRNHSTY.CICS-TERM-ID-CD                                  
                 ,:DCLVTRNHSTY.PRGM-NM                                          
                 ,:DCLVTRNHSTY.CRT-TMSTP                                        
                 ,:DCLVTRNHSTY.UPDT-TMSTP                                       
                 ,:DCLVTRNHSTY.ACCT-EQUITY-AMT                                  
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
              PERFORM 1110-SETUP-HIST-TRNFR-RET-DATA                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              IF WS-PASSED-TO-BR NOT = HIGH-VALUES                              
                 PERFORM 4100-CLOSE-HTRNFR-ENGIN-CSR2                           
                 MOVE WS-PASSED-TO-BR TO WS-PASSED-BR                           
                 PERFORM 3900-OPEN-HTRNFR-ENGIN-CSR2                            
                 GO TO 4000-FETCH-HTRNFR-ENGIN-CSR2                             
              END-IF                                                            
              SET ACAT25IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
              PERFORM 4100-CLOSE-HTRNFR-ENGIN-CSR2                              
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  CLOSE HISTORY TRANSFER CUSRSOR TABEL IN ASCENDING SEQUENCE  *          
      *  ORDER BY BRANCH ACCT ACAT#. (VERSION 2)                     *          
      *--------------------------------------------------------------*          
       4100-CLOSE-HTRNFR-ENGIN-CSR2.                                            
           EXEC SQL                                                             
              CLOSE HTRNFR_ENGIN_CSR2                                           
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
           ELSE                                                                 
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  OPEN HISTORY TRNFR CURSOR TBL IN ASCENDING SEQUENCE ORDER   *          
      *  BY ACAT#. (VERSION 2)                                       *          
      *--------------------------------------------------------------*          
       4200-OPEN-HTRNFR-ACAT-CSR2.                                              
           EXEC SQL                                                             
              OPEN HTRNFR_ACAT_CSR2                                             
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
           ELSE                                                                 
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  FETCH HISTORY TRANSFER CUSRSOR TABEL IN ASCENDING SEQUENCE  *          
      *  ORDER BY ACAT#. (VERSION 2)                                 *          
      *--------------------------------------------------------------*          
       4300-FETCH-HTRNFR-ACAT-CSR2.                                             
           EXEC SQL                                                             
              FETCH                                                             
                  HTRNFR_ACAT_CSR2                                              
              INTO                                                              
                  :DCLVTRNHSTY.CLIENT-NBR                                       
                 ,:DCLVTRNHSTY.ACAT-CONTROL-NBR                                 
                 ,:DCLVTRNHSTY.SBMTG-PRTCP-NBR                                  
                 ,:DCLVTRNHSTY.SBMT-PRT-NR-STS-CD                               
                 ,:DCLVTRNHSTY.CONTROL-NBR-STS-CD                               
                 ,:DCLVTRNHSTY.DLVR-NBR                                         
                 ,:DCLVTRNHSTY.DLVR-NBR-STTS-CD                                 
                 ,:DCLVTRNHSTY.ACCT-DLVR-NBR                                    
                 ,:DCLVTRNHSTY.ACCT-DLVR-STTS-CD                                
                 ,:DCLVTRNHSTY.RCV-NBR                                          
                 ,:DCLVTRNHSTY.RCV-NBR-STTS-CD                                  
                 ,:DCLVTRNHSTY.ACCT-RCV-NBR                                     
                 ,:DCLVTRNHSTY.ACCT-RCV-STTS-CD                                 
                 ,:DCLVTRNHSTY.TRNFR-TYPE-CD                                    
                 ,:DCLVTRNHSTY.TRNFR-TYPE-STTS-CD                               
                 ,:DCLVTRNHSTY.TRANS-TYPE-CD                                    
                 ,:DCLVTRNHSTY.TRANS-TYPE-STTS-CD                               
                 ,:DCLVTRNHSTY.RCV-CUST-NM                                      
                 ,:DCLVTRNHSTY.RCV-CUST-NM-STS-CD                               
                 ,:DCLVTRNHSTY.RCV-SS-PRIM-NBR                                  
                 ,:DCLVTRNHSTY.RCV-SS-PRIM-STS-CD                               
                 ,:DCLVTRNHSTY.RCV-SS-SCNDY-NBR                                 
                 ,:DCLVTRNHSTY.RCV-SS-SCDY-STS-CD                               
                 ,:DCLVTRNHSTY.RCV-ACCT-TYPE-CD                                 
                 ,:DCLVTRNHSTY.RCV-ACT-TYP-STS-CD                               
                 ,:DCLVTRNHSTY.RCV-OCC-BRKR-NBR                                 
                 ,:DCLVTRNHSTY.RCV-OCC-STTS-CD                                  
                 ,:DCLVTRNHSTY.RCV-CRSPN-NBR                                    
                 ,:DCLVTRNHSTY.RCV-CRSPN-STTS-CD                                
                 ,:DCLVTRNHSTY.ACAT-CNTL-ASTD-NBR                               
                 ,:DCLVTRNHSTY.CNTL-ASTD-STTS-CD                                
                 ,:DCLVTRNHSTY.CMNT-TXT                                         
                 ,:DCLVTRNHSTY.CMNT-STTS-CD                                     
                 ,:DCLVTRNHSTY.PRCS-DT                                          
                 ,:DCLVTRNHSTY.STTS-CD                                          
                 ,:DCLVTRNHSTY.STTLM-TM-CD                                      
                 ,:DCLVTRNHSTY.VAL-FREE-CD                                      
                 ,:DCLVTRNHSTY.TRANS-RFRN-ID-CD                                 
                 ,:DCLVTRNHSTY.TRANS-RFRN-STTS-CD                               
                 ,:DCLVTRNHSTY.DB-CR-CD                                         
                 ,:DCLVTRNHSTY.DSTBN-SIDE-CD                                    
                 ,:DCLVTRNHSTY.SYS-ACT-CD                                       
                 ,:DCLVTRNHSTY.SYS-RJCT-RSN-CD                                  
                 ,:DCLVTRNHSTY.TRNFR-TYPE-RJC1-CD                               
                 ,:DCLVTRNHSTY.TRNFR-TYPE-RJC2-CD                               
                 ,:DCLVTRNHSTY.TRNFR-TYPE-RJCT-CD                               
                 ,:DCLVTRNHSTY.TRN-TYP-RJC-STS-CD                               
                 ,:DCLVTRNHSTY.PHSCL-SEQ-NBR                                    
                 ,:DCLVTRNHSTY.PHSCL-SEQ-STTS-CD                                
                 ,:DCLVTRNHSTY.LGCL-SEQ-NBR                                     
                 ,:DCLVTRNHSTY.LGCL-SEQ-NR-STS-CD                               
                 ,:DCLVTRNHSTY.RR-CD                                            
                 ,:DCLVTRNHSTY.BRANCH-CD                                        
                 ,:DCLVTRNHSTY.DVDND-NAA-CD                                     
                 ,:DCLVTRNHSTY.SELL-INSTN-NAA-CD                                
                 ,:DCLVTRNHSTY.CASH-SWEEP-NAA-CD                                
                 ,:DCLVTRNHSTY.PRTCP-CONTRA-CD                                  
                 ,:DCLVTRNHSTY.ACM-HOLDER-NAA-CD                                
                 ,:DCLVTRNHSTY.ACCT-ACTIVITY-IND                                
                 ,:DCLVTRNHSTY.ACCT-ORDERS-IND                                  
                 ,:DCLVTRNHSTY.ACCT-RJCT-RSBM-IND                               
                 ,:DCLVTRNHSTY.ACCT-DB-BAL-T1-IND                               
                 ,:DCLVTRNHSTY.ACCT-MRGN-DB-IND                                 
                 ,:DCLVTRNHSTY.ACCT-SHRT-PSTN-IND                               
                 ,:DCLVTRNHSTY.ACCT-SEC-RSTRD-IND                               
                 ,:DCLVTRNHSTY.ACCT-AST-EXCS-IND                                
                 ,:DCLVTRNHSTY.ACCT-OPTN-PSTN-IND                               
                 ,:DCLVTRNHSTY.ACCT-LTD-PRTNR-IND                               
                 ,:DCLVTRNHSTY.ACCT-TIN-MSMTH-IND                               
                 ,:DCLVTRNHSTY.ACCT-DPLCT-TRN-IND                               
                 ,:DCLVTRNHSTY.ACCT-CUST-70-IND                                 
                 ,:DCLVTRNHSTY.ACCT-QULFD-PLN-IND                               
                 ,:DCLVTRNHSTY.ACCT-MNGD-IND                                    
                 ,:DCLVTRNHSTY.ACCT-PRVT-RNG-IND                                
                 ,:DCLVTRNHSTY.ACCT-BRKR-TIF-IND                                
                 ,:DCLVTRNHSTY.NSCC-NON-ADP-IND                                 
                 ,:DCLVTRNHSTY.CYCLE-CD                                         
                 ,:DCLVTRNHSTY.DAYS-STTS-QTY                                    
                 ,:DCLVTRNHSTY.STTLM-DT                                         
                 ,:DCLVTRNHSTY.ACCT-NA-UPDT-IND                                 
                 ,:DCLVTRNHSTY.ACCT-TRNFR-FEE-AMT                               
                 ,:DCLVTRNHSTY.ACCT-IRA-TRMNT-AMT                               
                 ,:DCLVTRNHSTY.ACCT-IRA-MAINT-AMT                               
                 ,:DCLVTRNHSTY.ACCT-DLRV-PRGR-IND                               
                 ,:DCLVTRNHSTY.ACCT-CD                                          
                 ,:DCLVTRNHSTY.STTLM-ASCTD-DT                                   
                 ,:DCLVTRNHSTY.STTLM-ASCTD-STS-CD                               
                 ,:DCLVTRNHSTY.RCRD-LNGTH-STTS-CD                               
                 ,:DCLVTRNHSTY.RCRD-STTS-CD                                     
                 ,:DCLVTRNHSTY.NSCC-PEND-CD                                     
                 ,:DCLVTRNHSTY.NSCC-ACK-IND                                     
                 ,:DCLVTRNHSTY.CICS-TERM-ID-CD                                  
                 ,:DCLVTRNHSTY.PRGM-NM                                          
                 ,:DCLVTRNHSTY.CRT-TMSTP                                        
                 ,:DCLVTRNHSTY.UPDT-TMSTP                                       
                 ,:DCLVTRNHSTY.ACCT-EQUITY-AMT                                  
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
              PERFORM 1110-SETUP-HIST-TRNFR-RET-DATA                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT25IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
              PERFORM 4400-CLOSE-HTRNFR-ACAT-CSR2                               
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  CLOSE HISTORY TRANSFER CUSRSOR TABEL IN ASCENDING SEQUENCE  *          
      *  ORDER BY ACAT#. (VERSION 2)                                 *          
      *--------------------------------------------------------------*          
       4400-CLOSE-HTRNFR-ACAT-CSR2.                                             
           EXEC SQL                                                             
              CLOSE HTRNFR_ACAT_CSR2                                            
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT25IO-NORMAL  TO TRUE                                      
           ELSE                                                                 
              SET ACAT25IO-ERROR  TO TRUE                                       
              MOVE SQLCODE  TO ACAT25-SQLCODE                                   
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
           MOVE 'ACAT25DB' TO CALLING-PROGRAM-ID.                               
           MOVE SQLCA      TO SQLCA-AREA.                                       
           EXEC CICS LINK PROGRAM('FPDB2LOG')                                   
                COMMAREA(WS-ERR-DATA)                                           
                LENGTH(LENGTH OF WS-ERR-DATA)                                   
                NOHANDLE                                                        
           END-EXEC.                                                            
       EJECT                                                                    
                                                                                
       HANG-CICS.                                                               
           GOBACK.                                                              
