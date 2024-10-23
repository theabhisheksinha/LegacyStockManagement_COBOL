000001* PDX    - ACAT12DB C0352614 03/11/14 09:43:33 TBLAMUR            00001000
000001* LRM011 - SSR# 91504 CNS CHANGE TO NOT PASS CNS OR DTC ON A              
000001*   SETTLE LOC = 05 ASSET.                                                
000001* PDX    - ACAT12DB C0274611 12/18/08 12:27:25 TBLAMUR            00001000
000001* LRM010 - SSR# 55766 DO NOT COPY ACK-IND FROM HSTY TABLE                 
000001* PDX    - ACAT12DB C0233602 04/10/06 14:07:44 TBLAMUR            00001000
000001* LRM009 - SSR# 40661 RETAIN USER ID OF INITIATOR.                        
000001* PDX    - ACAT12DB C0230185 01/19/06 14:30:11 TBEDTAK            00001000
000001* ET0007 - SSR39684: ALLOW USERS TO SCROLL ALL NEWLY ENTERED RCLS.00001000
000001* PDX    - ACAT12DB C0223559 08/09/05 11:51:19 TBEDTAK            00001000
000001* ET0006 - SSR41374: INCLUDE 866 SECURITY NUMBER WHEN INITIATE RCL00001000
000001*          FOR IRA ACCT WHICH POSTS TO 866 SECURITY NUMBER.       00001000
000001* PDX    - ACAT12DB C0216719 04/22/05 13:59:59 TBEDTAK            00001000
000001* ET0005 - MOVE SPACE IN RJCT-CODE OF INIT TFR WHEN CREATING RCL  00001000
000001* ET0004 - ADD ADDITIONAL ASSET NOT IN HISTORY TABLE.             00001000
000001* ET0003 - ALLOW USER TO CREATE DUPLICATE ACCT RCLS IN INIT TABLE.00001000
000001* PDX    - ACAT12DB C0215192 01/04/05 14:12:11 TBEDTAK            00001000
000001* ET0002 - DB2 TABLE KEY CHANGE WITH NEW TABLE NAME               00001000
000001* PDX    - ACAT12DB C0211261 09/20/04 12:04:20 TBEDTAK            00001000
000001* PDX    - ACAT12DB C0205792 08/24/04 16:03:10 TBEDTAK            00001000
000001* ET0001 - ALLOW DELIVERER TO RECLAIM NON-STANDARD TRANSFERS      00001000
000001* PDX    - ACAT12DB C0205792 05/19/04 11:31:03 TBEDTAK            00001000
000001* PDX    - ACAT12DB C0122652 03/04/99 14:56:25 TBEDTAK            00001000
000001* PDX    - ACAT12DB C0120330 01/31/99 13:07:18 TBEDTAK            00001000
000001* PDX    - ACAT12DB C0119329 01/07/99 16:00:57 TBEDTAK            00001000
000001* PDX    - ACAT12DB C0117817 12/07/98 11:44:40 TBEDTAK            00001000
000001* PDX    - ACAT12DB C0109165 08/18/98 11:20:25 TBEDTAK            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    ACAT12DB.                                                 
       AUTHOR.  E.TAKAESU.                                                      
      *REMARKS.                                                                 
      *****************************************************************         
      *       DB2 I/O PROGRAM FOR DELIVERER TO INITIATE A RECLAIM     *         
      *****************************************************************         
       ENVIRONMENT DIVISION.                                                    
       DATA DIVISION.                                                           
       WORKING-STORAGE SECTION.                                                 
       COPY PDXIDCOB.                                                           
      *                                                                         
       01  WS-WORK-AREA.                                                        
           03  WS-TIMESTAMP                    PIC X(26).                       
           03  WS-RECLAIM-SENT-IND             PIC X(01).                       
           03  WS-ROW-COUNT                    PIC S9(9) COMP.                  
           03  WS-NSCC-PEND-CD                 PIC X(01).                       
           03  WS-EXIT-LOOP-SW                 PIC X(01).                       
               88  WS-EXIT-LOOP                    VALUE 'Y'.                   
           03  WS-CURRENT-DATE                 PIC X(10).                       
ET0006     03  WS-866-QTY                      USAGE COMP-2.                    
       01  WS-PASSED-DATA-AREA.                                                 
           03  WS-CLIENT                       PIC X(04).                       
           03  WS-DELIVER                      PIC X(04).                       
           03  WS-DELIVER-ACCT                 PIC X(20).                       
           03  WS-RECEIVER                     PIC X(04).                       
           03  WS-RECEIVER-ACCT                PIC X(20).                       
           03  WS-ACAT-NUMBER                  PIC X(14).                       
           03  WS-SBMT-CLT                     PIC X(04).                       
ET0001     03  WS-ACAT-ASTD-NBR                PIC X(14).                       
ET0001     03  WS-CSH-MGN-SHT                  PIC X(01).                       
ET0001     03  WS-STTLM-RSN-CD                 PIC X(04).                       
ET0003     03  WS-ADP-CONTROL                  PIC X(14).                       
ET0003     03  WS-TRANS-RFRN-ID                PIC X(20).                       
       01  WS-ERR-DATA.                                                         
           03  WS-REQUEST-TYPE                 PIC X(01).                       
               88  WS-WRITE-ERROR-TO-LOG           VALUE 'Y'.                   
           03  CALLING-TRAN-ID                 PIC X(04).                       
           03  CALLING-PROGRAM-ID              PIC X(08).                       
           03  SQLCA-AREA                      PIC X(136).                      
      *                                                                         
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *    INITIAL TRANSFER REQUEST TABLE                              *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
ET0002**      INCLUDE VINITRNF                                                  
ET0002        INCLUDE ACTITRF                                                   
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *    INITIAL ASSET TABLE                                         *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
ET0002**      INCLUDE VINITAST                                                  
ET0002        INCLUDE ACTIAST                                                   
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *    HISTORY TRANSFER TABLE                                      *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              INCLUDE VTRNHSTY                                                  
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *    HISTORY ASSET TABLE                                         *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              INCLUDE VASTHSTY                                                  
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *    ACTIVE  TRANSFER TABLE                                      *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              INCLUDE VTRNFR                                                    
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *    ACTIVE ASSET TABLE                                          *        
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
      *    ASSET HISTORY DECLARE CURSOR STATEMENT                      *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  ASTHSTCS CURSOR FOR                                      
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,ASSET_SEQ_NBR                                              
                    ,SBMTG_PRTCP_NBR                                            
                    ,SYS_ACT_CD                                                 
                    ,SYS_RJCT_RSN_CD                                            
                    ,TRANS_TYPE_CD                                              
                    ,PHSCL_SEQ_NBR                                              
                    ,LGCL_SEQ_NBR                                               
                    ,ASSET_PRC_CTGY_CD                                          
                    ,STTLM_LCTN_CD                                              
                    ,STTLM_RSN_CD                                               
                    ,ISIN_CNTRY_CD                                              
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,ISIN_SEC_CDG_CD                                            
                    ,ASSET_DESC_TXT                                             
                    ,ASSET_RQST_QTY_CD                                          
                    ,AST_RQST_TRANS_CD                                          
                    ,ASSET_QTY                                                  
                    ,ASSET_PCT                                                  
                    ,PSTN_CD                                                    
                    ,ISO_CRNCY_CD                                               
                    ,ASSET_AMT                                                  
                    ,BEARER_BOND_CD                                             
                    ,CSH_MGN_SHRT_CD                                            
                    ,WHI_CD                                                     
                    ,TRNFR_TYPE_RSN_CD                                          
                    ,MBS_SERIAL_NBR                                             
                    ,ASSET_CMNT_TXT                                             
                    ,NSCC_ACK_IND                                               
                    ,NSCC_PEND_CD                                               
                    ,FAIL_SENT_CAGE_IND                                         
                    ,FAIL_OPEN_CAGE_IND                                         
                    ,NSCC_NON_ADP_IND                                           
                    ,TRANS_RFRN_ID_CD                                           
                    ,OPTN_CTGY_CD                                               
                    ,ISIN_SEC_EXCPT_IND                                         
                    ,SECURITY_ADP_NBR                                           
                    ,RCL_SENT_NSCC_IND                                          
                    ,FRV_SENT_NSCC_IND                                          
                  FROM                                                          
                     VASTHSTY                                                   
                  WHERE                                                         
                     CLIENT_NBR = :WS-CLIENT  AND                               
                     ACAT_CONTROL_NBR = :WS-ACAT-NUMBER                         
           END-EXEC.                                                            
           EJECT                                                                
ET0001*                                                                         
ET0001*----------------------------------------------------------------*        
ET0001*    TRANSFER HISTORY DECLARE CURSOR STATEMENT                   *        
ET0001*----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  TRNHSTCS CURSOR FOR                                      
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
                     CLIENT_NBR = :WS-CLIENT                                    
                     AND  DLVR_NBR = :WS-DELIVER                                
                     AND  ACCT_DLVR_NBR LIKE :WS-DELIVER-ACCT                   
                     AND  TRNFR_TYPE_CD IN ('FUL','PTR','PTD','RCR')            
                     AND  DSTBN_SIDE_CD = 'D'                                   
                     AND  STTS_CD = '310'                                       
                  ORDER BY                                                      
                     ACAT_CONTROL_NBR                                           
           END-EXEC.                                                            
           EJECT                                                                
ET0001*                                                                         
ET0001*----------------------------------------------------------------*        
ET0001* TRANSFER HISTORY DECLARE CURSOR STATEMENT IN DESCENDING ORDER  *        
ET0001*----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  TRNHST_DES CURSOR FOR                                    
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
                     CLIENT_NBR = :WS-CLIENT                                    
                     AND  DLVR_NBR = :WS-DELIVER                                
                     AND  ACCT_DLVR_NBR LIKE :WS-DELIVER-ACCT                   
                     AND  TRNFR_TYPE_CD IN ('FUL','PTR','PTD','RCR')            
                     AND  DSTBN_SIDE_CD = 'D'                                   
                     AND  STTS_CD = '310'                                       
                  ORDER BY                                                      
                     ACAT_CONTROL_NBR  DESC                                     
           END-EXEC.                                                            
ET0007 EJECT                                                                    
ET0007*                                                                         
ET0007*----------------------------------------------------------------*        
ET0007*  INITIAL TRANSFER TABLE DECLARE CSR STTMNT FOR ALL RECLAIMS    *        
ET0007*----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  INITRN_CSR CURSOR FOR                                    
                 SELECT                                                         
                     CLIENT_NBR                                                 
                    ,RCV_NBR                                                    
                    ,DLVR_NBR                                                   
                    ,ACCT_DLVR_NBR                                              
                    ,ACCT_RCV_NBR                                               
                    ,ACAT_CONTROL_NBR                                           
                    ,TRNFR_TYPE_CD                                              
                    ,PHSCL_SEQ_NBR                                              
                    ,SBMTG_PRTCP_NBR                                            
                    ,PHSCL_SEQ_STTS_CD                                          
                    ,LGCL_SEQ_NBR                                               
                    ,TRANS_TYPE_CD                                              
                    ,LGCL_SEQ_NR_STS_CD                                         
                    ,RCV_CUST_NM                                                
                    ,TRANS_TYPE_STTS_CD                                         
                    ,CONTROL_NBR_STS_CD                                         
                    ,RCV_SS_PRIM_NBR                                            
                    ,TRNFR_TYPE_STTS_CD                                         
                    ,RCV_SS_SCNDY_NBR                                           
                    ,SBMT_PRT_NR_STS_CD                                         
                    ,RCV_ACCT_TYPE_CD                                           
                    ,RCV_NBR_STTS_CD                                            
                    ,NSCC_PEND_CD                                               
                    ,RCV_OCC_BRKR_NBR                                           
                    ,DLVR_NBR_STTS_CD                                           
                    ,RCV_CRSPN_NBR                                              
                    ,ACCT_RCV_STTS_CD                                           
                    ,ACAT_CNTL_ASTD_NBR                                         
                    ,ACCT_DLVR_STTS_CD                                          
                    ,CMNT_TXT                                                   
                    ,RCV_CUST_NM_STS_CD                                         
                    ,PRCS_DT                                                    
                    ,RCV_OCC_STTS_CD                                            
                    ,RCV_SS_PRIM_STS_CD                                         
                    ,STTS_CD                                                    
                    ,RCV_CRSPN_STTS_CD                                          
                    ,DSTBN_SIDE_CD                                              
                    ,TRNFR_TYPE_RJCT_CD                                         
                    ,SYS_ACT_CD                                                 
                    ,RCV_SS_SCDY_STS_CD                                         
                    ,SYS_RJCT_RSN_CD                                            
                    ,RCV_ACT_TYP_STS_CD                                         
                    ,TRNFR_TYPE_RJC2_CD                                         
                    ,CNTL_ASTD_STTS_CD                                          
                    ,TRN_TYP_RJC_STS_CD                                         
                    ,TRNFR_TYPE_RJC1_CD                                         
                    ,STTLM_ASCTD_STS_CD                                         
                    ,NSCC_ACK_IND                                               
                    ,PRTCP_CONTRA_CD                                            
                    ,TRANS_RFRN_STTS_CD                                         
                    ,CMNT_STTS_CD                                               
                    ,CICS_TERM_ID_CD                                            
                    ,CYCLE_CD                                                   
                    ,PRGM_NM                                                    
                    ,DAYS_STTS_QTY                                              
                    ,RCRD_LNGTH_STTS_CD                                         
                    ,CRT_TMSTP                                                  
                    ,RCRD_STTS_CD                                               
                    ,UPDT_TMSTP                                                 
                    ,DB_CR_CD                                                   
                    ,STTLM_ASCTD_DT                                             
                    ,TRANS_RFRN_ID_CD                                           
                    ,RR_CD                                                      
                 FROM                                                           
                    ACTITRF                                                     
                 WHERE                                                          
                    CLIENT_NBR = :WS-CLIENT                                     
                    AND TRNFR_TYPE_CD = 'RCL'                                   
                    AND DSTBN_SIDE_CD = 'D'                                     
                 ORDER BY                                                       
                    ACCT_DLVR_NBR                                               
                   ,ACCT_RCV_NBR                                                
                   ,ACAT_CONTROL_NBR                                            
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
ET0007*                                                                         
ET0007*----------------------------------------------------------------*        
ET0007* INITIAL TRNFR DECL CURSOR STTMNT FOR ALL RCLS IN DESCEND ORDER *        
ET0007*----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  INITRN_CSR_DESC CURSOR FOR                               
                 SELECT                                                         
                     CLIENT_NBR                                                 
                    ,RCV_NBR                                                    
                    ,DLVR_NBR                                                   
                    ,ACCT_DLVR_NBR                                              
                    ,ACCT_RCV_NBR                                               
                    ,ACAT_CONTROL_NBR                                           
                    ,TRNFR_TYPE_CD                                              
                    ,PHSCL_SEQ_NBR                                              
                    ,SBMTG_PRTCP_NBR                                            
                    ,PHSCL_SEQ_STTS_CD                                          
                    ,LGCL_SEQ_NBR                                               
                    ,TRANS_TYPE_CD                                              
                    ,LGCL_SEQ_NR_STS_CD                                         
                    ,RCV_CUST_NM                                                
                    ,TRANS_TYPE_STTS_CD                                         
                    ,CONTROL_NBR_STS_CD                                         
                    ,RCV_SS_PRIM_NBR                                            
                    ,TRNFR_TYPE_STTS_CD                                         
                    ,RCV_SS_SCNDY_NBR                                           
                    ,SBMT_PRT_NR_STS_CD                                         
                    ,RCV_ACCT_TYPE_CD                                           
                    ,RCV_NBR_STTS_CD                                            
                    ,NSCC_PEND_CD                                               
                    ,RCV_OCC_BRKR_NBR                                           
                    ,DLVR_NBR_STTS_CD                                           
                    ,RCV_CRSPN_NBR                                              
                    ,ACCT_RCV_STTS_CD                                           
                    ,ACAT_CNTL_ASTD_NBR                                         
                    ,ACCT_DLVR_STTS_CD                                          
                    ,CMNT_TXT                                                   
                    ,RCV_CUST_NM_STS_CD                                         
                    ,PRCS_DT                                                    
                    ,RCV_OCC_STTS_CD                                            
                    ,RCV_SS_PRIM_STS_CD                                         
                    ,STTS_CD                                                    
                    ,RCV_CRSPN_STTS_CD                                          
                    ,DSTBN_SIDE_CD                                              
                    ,TRNFR_TYPE_RJCT_CD                                         
                    ,SYS_ACT_CD                                                 
                    ,RCV_SS_SCDY_STS_CD                                         
                    ,SYS_RJCT_RSN_CD                                            
                    ,RCV_ACT_TYP_STS_CD                                         
                    ,TRNFR_TYPE_RJC2_CD                                         
                    ,CNTL_ASTD_STTS_CD                                          
                    ,TRN_TYP_RJC_STS_CD                                         
                    ,TRNFR_TYPE_RJC1_CD                                         
                    ,STTLM_ASCTD_STS_CD                                         
                    ,NSCC_ACK_IND                                               
                    ,PRTCP_CONTRA_CD                                            
                    ,TRANS_RFRN_STTS_CD                                         
                    ,CMNT_STTS_CD                                               
                    ,CICS_TERM_ID_CD                                            
                    ,CYCLE_CD                                                   
                    ,PRGM_NM                                                    
                    ,DAYS_STTS_QTY                                              
                    ,RCRD_LNGTH_STTS_CD                                         
                    ,CRT_TMSTP                                                  
                    ,RCRD_STTS_CD                                               
                    ,UPDT_TMSTP                                                 
                    ,DB_CR_CD                                                   
                    ,STTLM_ASCTD_DT                                             
                    ,TRANS_RFRN_ID_CD                                           
                    ,RR_CD                                                      
                 FROM                                                           
                    ACTITRF                                                     
                 WHERE                                                          
                    CLIENT_NBR = :WS-CLIENT                                     
                    AND TRNFR_TYPE_CD = 'RCL'                                   
                    AND DSTBN_SIDE_CD = 'D'                                     
                 ORDER BY                                                       
                    ACCT_DLVR_NBR     DESC                                      
                   ,ACCT_RCV_NBR      DESC                                      
                   ,ACAT_CONTROL_NBR  DESC                                      
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
           EJECT                                                                
ET0003*                                                                         
ET0003*----------------------------------------------------------------*        
ET0003*       INITIAL TRANSFER TABLE DECLARE CURSOR STATEMENT          *        
ET0003*----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  TRFINICS CURSOR FOR                                      
                 SELECT                                                         
                     CLIENT_NBR                                                 
                    ,RCV_NBR                                                    
                    ,DLVR_NBR                                                   
                    ,ACCT_DLVR_NBR                                              
                    ,ACCT_RCV_NBR                                               
                    ,ACAT_CONTROL_NBR                                           
                    ,TRNFR_TYPE_CD                                              
                    ,PHSCL_SEQ_NBR                                              
                    ,SBMTG_PRTCP_NBR                                            
                    ,PHSCL_SEQ_STTS_CD                                          
                    ,LGCL_SEQ_NBR                                               
                    ,TRANS_TYPE_CD                                              
                    ,LGCL_SEQ_NR_STS_CD                                         
                    ,RCV_CUST_NM                                                
                    ,TRANS_TYPE_STTS_CD                                         
                    ,CONTROL_NBR_STS_CD                                         
                    ,RCV_SS_PRIM_NBR                                            
                    ,TRNFR_TYPE_STTS_CD                                         
                    ,RCV_SS_SCNDY_NBR                                           
                    ,SBMT_PRT_NR_STS_CD                                         
                    ,RCV_ACCT_TYPE_CD                                           
                    ,RCV_NBR_STTS_CD                                            
                    ,NSCC_PEND_CD                                               
                    ,RCV_OCC_BRKR_NBR                                           
                    ,DLVR_NBR_STTS_CD                                           
                    ,RCV_CRSPN_NBR                                              
                    ,ACCT_RCV_STTS_CD                                           
                    ,ACAT_CNTL_ASTD_NBR                                         
                    ,ACCT_DLVR_STTS_CD                                          
                    ,CMNT_TXT                                                   
                    ,RCV_CUST_NM_STS_CD                                         
                    ,PRCS_DT                                                    
                    ,RCV_OCC_STTS_CD                                            
                    ,RCV_SS_PRIM_STS_CD                                         
                    ,STTS_CD                                                    
                    ,RCV_CRSPN_STTS_CD                                          
                    ,DSTBN_SIDE_CD                                              
                    ,TRNFR_TYPE_RJCT_CD                                         
                    ,SYS_ACT_CD                                                 
                    ,RCV_SS_SCDY_STS_CD                                         
                    ,SYS_RJCT_RSN_CD                                            
                    ,RCV_ACT_TYP_STS_CD                                         
                    ,TRNFR_TYPE_RJC2_CD                                         
                    ,CNTL_ASTD_STTS_CD                                          
                    ,TRN_TYP_RJC_STS_CD                                         
                    ,TRNFR_TYPE_RJC1_CD                                         
                    ,STTLM_ASCTD_STS_CD                                         
                    ,NSCC_ACK_IND                                               
                    ,PRTCP_CONTRA_CD                                            
                    ,TRANS_RFRN_STTS_CD                                         
                    ,CMNT_STTS_CD                                               
                    ,CICS_TERM_ID_CD                                            
                    ,CYCLE_CD                                                   
                    ,PRGM_NM                                                    
                    ,DAYS_STTS_QTY                                              
                    ,RCRD_LNGTH_STTS_CD                                         
                    ,CRT_TMSTP                                                  
                    ,RCRD_STTS_CD                                               
                    ,UPDT_TMSTP                                                 
                    ,DB_CR_CD                                                   
                    ,STTLM_ASCTD_DT                                             
                    ,TRANS_RFRN_ID_CD                                           
                    ,RR_CD                                                      
                 FROM                                                           
                    ACTITRF                                                     
                 WHERE                                                          
                    CLIENT_NBR = :WS-CLIENT                                     
                    AND ACCT_DLVR_NBR LIKE :WS-DELIVER-ACCT                     
                    AND TRNFR_TYPE_CD = 'RCL'                                   
                 ORDER BY                                                       
                    ACAT_CONTROL_NBR                                            
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
ET0003*                                                                         
ET0003*----------------------------------------------------------------*        
ET0003* INITIAL TRANSFER DECLARE CURSOR STATEMENT IN DESCENDING ORDER  *        
ET0003*----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  TRFINICS_DES CURSOR FOR                                  
                 SELECT                                                         
                     CLIENT_NBR                                                 
                    ,RCV_NBR                                                    
                    ,DLVR_NBR                                                   
                    ,ACCT_DLVR_NBR                                              
                    ,ACCT_RCV_NBR                                               
                    ,ACAT_CONTROL_NBR                                           
                    ,TRNFR_TYPE_CD                                              
                    ,PHSCL_SEQ_NBR                                              
                    ,SBMTG_PRTCP_NBR                                            
                    ,PHSCL_SEQ_STTS_CD                                          
                    ,LGCL_SEQ_NBR                                               
                    ,TRANS_TYPE_CD                                              
                    ,LGCL_SEQ_NR_STS_CD                                         
                    ,RCV_CUST_NM                                                
                    ,TRANS_TYPE_STTS_CD                                         
                    ,CONTROL_NBR_STS_CD                                         
                    ,RCV_SS_PRIM_NBR                                            
                    ,TRNFR_TYPE_STTS_CD                                         
                    ,RCV_SS_SCNDY_NBR                                           
                    ,SBMT_PRT_NR_STS_CD                                         
                    ,RCV_ACCT_TYPE_CD                                           
                    ,RCV_NBR_STTS_CD                                            
                    ,NSCC_PEND_CD                                               
                    ,RCV_OCC_BRKR_NBR                                           
                    ,DLVR_NBR_STTS_CD                                           
                    ,RCV_CRSPN_NBR                                              
                    ,ACCT_RCV_STTS_CD                                           
                    ,ACAT_CNTL_ASTD_NBR                                         
                    ,ACCT_DLVR_STTS_CD                                          
                    ,CMNT_TXT                                                   
                    ,RCV_CUST_NM_STS_CD                                         
                    ,PRCS_DT                                                    
                    ,RCV_OCC_STTS_CD                                            
                    ,RCV_SS_PRIM_STS_CD                                         
                    ,STTS_CD                                                    
                    ,RCV_CRSPN_STTS_CD                                          
                    ,DSTBN_SIDE_CD                                              
                    ,TRNFR_TYPE_RJCT_CD                                         
                    ,SYS_ACT_CD                                                 
                    ,RCV_SS_SCDY_STS_CD                                         
                    ,SYS_RJCT_RSN_CD                                            
                    ,RCV_ACT_TYP_STS_CD                                         
                    ,TRNFR_TYPE_RJC2_CD                                         
                    ,CNTL_ASTD_STTS_CD                                          
                    ,TRN_TYP_RJC_STS_CD                                         
                    ,TRNFR_TYPE_RJC1_CD                                         
                    ,STTLM_ASCTD_STS_CD                                         
                    ,NSCC_ACK_IND                                               
                    ,PRTCP_CONTRA_CD                                            
                    ,TRANS_RFRN_STTS_CD                                         
                    ,CMNT_STTS_CD                                               
                    ,CICS_TERM_ID_CD                                            
                    ,CYCLE_CD                                                   
                    ,PRGM_NM                                                    
                    ,DAYS_STTS_QTY                                              
                    ,RCRD_LNGTH_STTS_CD                                         
                    ,CRT_TMSTP                                                  
                    ,RCRD_STTS_CD                                               
                    ,UPDT_TMSTP                                                 
                    ,DB_CR_CD                                                   
                    ,STTLM_ASCTD_DT                                             
                    ,TRANS_RFRN_ID_CD                                           
                    ,RR_CD                                                      
                 FROM                                                           
                    ACTITRF                                                     
                 WHERE                                                          
                    CLIENT_NBR = :WS-CLIENT                                     
                    AND ACCT_DLVR_NBR LIKE :WS-DELIVER-ACCT                     
                    AND TRNFR_TYPE_CD = 'RCL'                                   
                 ORDER BY                                                       
                    ACAT_CONTROL_NBR  DESC                                      
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
      *                                                                         
      *----------------------------------------------------------------*        
      *         INITIAL ASSET DECLARE CURSOR STATEMENT                 *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  ASTINICS CURSOR FOR                                      
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,DLVR_NBR                                                   
                    ,ACCT_DLVR_NBR                                              
                    ,RCV_NBR                                                    
                    ,ACCT_RCV_NBR                                               
                    ,ISIN_CNTRY_CD                                              
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,ISIN_SEC_CDG_CD                                            
                    ,STTLM_LCTN_CD                                              
                    ,CSH_MGN_SHRT_CD                                            
                    ,SBMTG_PRTCP_NBR                                            
                    ,ACAT_CONTROL_NBR                                           
                    ,ASSET_SEQ_NBR                                              
                    ,TRANS_TYPE_CD                                              
                    ,PHSCL_SEQ_NBR                                              
                    ,LGCL_SEQ_NBR                                               
                    ,ASSET_PRC_CTGY_CD                                          
                    ,STTLM_RSN_CD                                               
                    ,ASSET_DESC_TXT                                             
                    ,ASSET_RQST_QTY_CD                                          
                    ,AST_RQST_TRANS_CD                                          
                    ,ASSET_QTY                                                  
                    ,ASSET_PCT                                                  
                    ,PSTN_CD                                                    
                    ,ISO_CRNCY_CD                                               
                    ,ASSET_AMT                                                  
                    ,BEARER_BOND_CD                                             
                    ,WHI_CD                                                     
                    ,TRNFR_TYPE_RSN_CD                                          
                    ,MBS_SERIAL_NBR                                             
                    ,ASSET_CMNT_TXT                                             
                    ,NSCC_WTHLD_CD                                              
                    ,TRANS_RFRN_ID_CD                                           
                    ,OPTN_CTGY_CD                                               
                    ,NSCC_PEND_CD                                               
                    ,NSCC_ACK_IND                                               
                    ,PRGM_NM                                                    
                    ,CICS_TERM_ID_CD                                            
                    ,UPDT_TMSTP                                                 
                    ,CRT_TMSTP                                                  
                    ,SECURITY_ADP_NBR                                           
                    ,TRNFR_TYPE_CD                                              
                  FROM                                                          
ET0002**             VINITAST                                                   
ET0002               ACTIAST                                                    
                  WHERE                                                         
                     CLIENT_NBR = :WS-CLIENT                                    
ET0003**             AND TRANS_RFRN_ID_CD = :WS-DELIVER-ACCT                    
ET0003               AND ACCT_DLVR_NBR LIKE :WS-DELIVER-ACCT                    
ET0003               AND ACAT_CONTROL_NBR = :WS-ACAT-NUMBER                     
                     AND TRNFR_TYPE_CD = 'RCL'                                  
           END-EXEC.                                                            
           EJECT                                                                
ET0001*                                                                         
ET0001*----------------------------------------------------------------*        
ET0001*         INITIAL ASSET DECLARE CURSOR STATEMENT #2              *        
ET0001*----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  ASTINICS2 CURSOR FOR                                     
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,DLVR_NBR                                                   
                    ,ACCT_DLVR_NBR                                              
                    ,RCV_NBR                                                    
                    ,ACCT_RCV_NBR                                               
                    ,TRNFR_TYPE_CD                                              
                  FROM                                                          
ET0002**             VINITAST                                                   
ET0002               ACTIAST                                                    
                  WHERE                                                         
                     CLIENT_NBR = :WS-CLIENT                                    
                     AND  DLVR_NBR = :WS-DELIVER                                
                     AND  ACCT_DLVR_NBR = :WS-DELIVER-ACCT                      
                     AND  RCV_NBR = :WS-RECEIVER                                
                     AND  ACCT_RCV_NBR = :WS-RECEIVER-ACCT                      
ET0002               AND  TRNFR_TYPE_CD = 'RCL'                                 
           END-EXEC.                                                            
           EJECT                                                                
      *                                                                         
      *----------------------------------------------------------------*        
      *     ACTIVE TRANSFER DECLARE CURSOR STATEMENT                   *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  TRNFRCSR CURSOR FOR                                      
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
                     VTRNFR                                                     
                  WHERE                                                         
                     CLIENT_NBR = :WS-CLIENT                                    
                     AND  DLVR_NBR = :WS-DELIVER                                
                     AND  ACCT_DLVR_NBR = :WS-DELIVER-ACCT                      
                     AND  RCV_NBR = :WS-RECEIVER                                
                     AND  ACCT_RCV_NBR = :WS-RECEIVER-ACCT                      
                     AND  TRNFR_TYPE_CD = 'RCL'                                 
                     AND  DSTBN_SIDE_CD = 'D'                                   
                     AND  NOT (STTS_CD IN ('140', '600'))                       
ET0001               AND  ACAT_CNTL_ASTD_NBR = :WS-ACAT-ASTD-NBR                
           END-EXEC.                                                            
           EJECT                                                                
      *                                                                         
      *----------------------------------------------------------------*        
      *     ACTIVE ASSET DECLARE CURSOR STATEMENT                      *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  ASSETCSR CURSOR FOR                                      
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
                  FROM                                                          
                     VASSET                                                     
                  WHERE                                                         
                     CLIENT_NBR = :WS-CLIENT                                    
                     AND  ACAT_CONTROL_NBR = :WS-ACAT-NUMBER                    
ET0001***            AND  STTLM_LCTN_CD IN ('00','05','20','25','40')           
           END-EXEC.                                                            
           EJECT                                                                
       LINKAGE SECTION.                                                         
       01  DFHCOMMAREA.                                                         
       COPY ACAT12IO.                                                           
       EJECT                                                                    
      *                                                                         
       PROCEDURE DIVISION.                                                      
           MOVE ACAT12-PASS-CLT      TO WS-CLIENT.                              
           MOVE ACAT12-PASS-DLVR-NBR TO WS-DELIVER.                             
           MOVE ACAT12-PASS-ACCT-DLV TO WS-DELIVER-ACCT.                        
           MOVE ACAT12-PASS-CON-BRKR TO WS-RECEIVER.                            
           MOVE ACAT12-PASS-CON-ACCT TO WS-RECEIVER-ACCT.                       
           MOVE ACAT12-PASS-ACAT     TO WS-ACAT-NUMBER.                         
           MOVE ACAT12-PASS-SBMT-CLT TO WS-SBMT-CLT.                            
ET0001     MOVE ACAT12-PASS-ACAT-ASTD-NBR TO WS-ACAT-ASTD-NBR.                  
ET0001     MOVE ACAT12-PASS-CSH-MGN-SHT   TO WS-CSH-MGN-SHT.                    
ET0001     MOVE ACAT12-PASS-STTLM-RSN-CD  TO WS-STTLM-RSN-CD.                   
ET0003     MOVE ACAT12-PASS-ADP-CONTROL   TO WS-ADP-CONTROL.                    
ET0003     MOVE ACAT12-PASS-TRANS-RFRN-ID TO WS-TRANS-RFRN-ID.                  
      *                                                                         
           EXEC SQL                                                             
              SET :WS-TIMESTAMP = CURRENT TIMESTAMP                             
           END-EXEC.                                                            
           MOVE WS-TIMESTAMP (1:10) TO WS-CURRENT-DATE.                         
      *                                                                         
           EVALUATE TRUE                                                        
              WHEN ACAT12-GET-TFRHST                                            
                   PERFORM 0100-GET-TFR-HIST                                    
              WHEN ACAT12-GET-TFRINI                                            
                   PERFORM 0200-GET-TFR-INIT                                    
              WHEN ACAT12-GET-ASTHST                                            
                   PERFORM 0300-GET-ASSET-HIST                                  
      *       WHEN ACAT12-GET-ASTINI                                            
      *            PERFORM 0400-GET-ASSET-INIT                                  
              WHEN ACAT12-OPN-ASTHST                                            
                   PERFORM 0500-OPEN-ASSET-HIST                                 
              WHEN ACAT12-FET-ASTHST                                            
                   PERFORM 0600-FETCH-ASSET-HIST                                
              WHEN ACAT12-CLO-ASTHST                                            
                   PERFORM 0700-CLOSE-ASSET-HIST                                
              WHEN ACAT12-OPN-ASTINI                                            
                   PERFORM 0800-OPEN-ASSET-INIT                                 
              WHEN ACAT12-FET-ASTINI                                            
                   PERFORM 0900-FETCH-ASSET-INIT                                
              WHEN ACAT12-CLO-ASTINI                                            
                   PERFORM 1000-CLOSE-ASSET-INIT                                
              WHEN ACAT12-INS-TFRINI                                            
                   PERFORM 1100-INSERT-TFR-INIT                                 
              WHEN ACAT12-INS-ASTINI                                            
ET0004             IF ACAT12-PASS-ADD-ASSET = SPACE                             
                      PERFORM 1200-INSERT-ASSET-INIT                            
ET0004             ELSE                                                         
ET0004                PERFORM 1210-INSERT-ADD-ASSET-INIT                        
ET0004             END-IF                                                       
              WHEN ACAT12-UPD-ASTHST                                            
                   PERFORM 1300-UPDATE-ASSET-HIST                               
              WHEN ACAT12-CNT-REJ-RCLM                                          
                   PERFORM 1400-COUNT-REJECTED-RECLAIM                          
              WHEN ACAT12-UPD-RESUB                                             
                   PERFORM 1500-UPDATE-TRFR-RESUB-IND                           
              WHEN ACAT12-DEL-RECLAIM                                           
                   PERFORM 1600-DELETE-RECLAIM                                  
              WHEN ACAT12-CNT-TFRINI                                            
                   PERFORM 1700-COUNT-INIT-TRANSFER                             
              WHEN ACAT12-CNT-ASTINI                                            
                   PERFORM 1800-COUNT-INIT-ASSET                                
              WHEN ACAT12-CNT-TFRHST                                            
                   PERFORM 1900-COUNT-HIST-TRANSFER                             
              WHEN ACAT12-OPN-TRANSFER                                          
                   PERFORM 2000-OPEN-TRNFR                                      
              WHEN ACAT12-FET-TRANSFER                                          
                   PERFORM 2100-FETCH-TRNFR                                     
              WHEN ACAT12-CLO-TRANSFER                                          
                   PERFORM 2200-CLOSE-TRNFR                                     
              WHEN ACAT12-OPN-ASSET                                             
                   PERFORM 2300-OPEN-ASSET                                      
              WHEN ACAT12-FET-ASSET                                             
                   PERFORM 2400-FETCH-ASSET                                     
              WHEN ACAT12-CLO-ASSET                                             
                   PERFORM 2500-CLOSE-ASSET                                     
              WHEN ACAT12-GET-TRANSFER                                          
                   PERFORM 2600-GET-TRNFR                                       
ET0001        WHEN ACAT12-OPN-ASTINI2                                           
ET0001             PERFORM 2810-OPEN-INIT-ASSET2                                
              WHEN ACAT12-FND-ASTINI                                            
ET0001**           PERFORM 2700-FIND-INIT-ASSET                                 
ET0001             PERFORM 2820-FIND-INIT-ASSET2                                
ET0001        WHEN ACAT12-CLO-ASTINI2                                           
ET0001             PERFORM 2830-CLOSE-INIT-ASSET2                               
ET0001        WHEN ACAT12-OPN-TFRHST                                            
ET0001             PERFORM 3000-OPEN-TRNFR-HIST                                 
ET0001        WHEN ACAT12-FET-TFRHST                                            
ET0001             PERFORM 3100-FETCH-TRNFR-HIST                                
ET0001        WHEN ACAT12-CLO-TFRHST                                            
ET0001             PERFORM 3200-CLOSE-TRNFR-HIST                                
ET0001        WHEN ACAT12-OPN-TFRHST-DESC                                       
ET0001             PERFORM 3300-OPEN-TRNFR-HIST-DESC                            
ET0001        WHEN ACAT12-FET-TFRHST-DESC                                       
ET0001             PERFORM 3400-FETCH-TRNFR-HIST-DESC                           
ET0001        WHEN ACAT12-CLO-TFRHST-DESC                                       
ET0001             PERFORM 3500-CLOSE-TRNFR-HIST-DESC                           
ET0001        WHEN ACAT12-INS-ASTINI-CASH                                       
ET0001             PERFORM 3600-INSERT-INIASSET-CASH                            
ET0003        WHEN ACAT12-OPN-TFRINI                                            
ET0003             PERFORM 3700-OPEN-TRNFR-INIT                                 
ET0003        WHEN ACAT12-FET-TFRINI                                            
ET0003             PERFORM 3800-FETCH-TRNFR-INIT                                
ET0003        WHEN ACAT12-CLO-TFRINI                                            
ET0003             PERFORM 3900-CLOSE-TRNFR-INIT                                
ET0003        WHEN ACAT12-OPN-TFRINI-DESC                                       
ET0003             PERFORM 4000-OPEN-TRNFR-INIT-DESC                            
ET0003        WHEN ACAT12-FET-TFRINI-DESC                                       
ET0003             PERFORM 4100-FETCH-TRNFR-INIT-DESC                           
ET0003        WHEN ACAT12-CLO-TFRINI-DESC                                       
ET0003             PERFORM 4200-CLOSE-TRNFR-INIT-DESC                           
ET0007        WHEN ACAT12-OPN-INITRN-RCL                                        
ET0007             PERFORM 4300-OPEN-ALL-INITRN                                 
ET0007        WHEN ACAT12-FET-INITRN-RCL                                        
ET0007             PERFORM 4400-FETCH-ALL-INITRN                                
ET0007        WHEN ACAT12-CLO-INITRN-RCL                                        
ET0007             PERFORM 4500-CLOSE-ALL-INITRN                                
ET0007        WHEN ACAT12-OPN-INITRN-RCL-D                                      
ET0007             PERFORM 4600-OPEN-ALL-INITRN-DESC                            
ET0007        WHEN ACAT12-FET-INITRN-RCL-D                                      
ET0007             PERFORM 4700-FETCH-ALL-INITRN-DESC                           
ET0007        WHEN ACAT12-CLO-INITRN-RCL-D                                      
ET0007             PERFORM 4800-CLOSE-ALL-INITRN-DESC                           
           END-EVALUATE.                                                        
                                                                                
           EXEC CICS RETURN                                                     
           END-EXEC.                                                            
       EJECT                                                                    
                                                                                
      *                                                                         
      *--------------------------------------------------------------*          
      *   GET A SETTLED CLOSED TRANSFER FROM TRANSFER HISTORY        *          
      *--------------------------------------------------------------*          
       0100-GET-TFR-HIST.                                                       
           INITIALIZE DCLVTRNHSTY.                                              
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
                   ,CMNT_TXT                                                    
                   ,PRCS_DT                                                     
                   ,STTS_CD                                                     
                   ,STTLM_TM_CD                                                 
                   ,VAL_FREE_CD                                                 
                   ,TRANS_RFRN_ID_CD                                            
                   ,DB_CR_CD                                                    
                   ,DSTBN_SIDE_CD                                               
                   ,SYS_ACT_CD                                                  
                   ,SYS_RJCT_RSN_CD                                             
                   ,TRNFR_TYPE_RJC1_CD                                          
                   ,TRNFR_TYPE_RJC2_CD                                          
                   ,TRNFR_TYPE_RJCT_CD                                          
                   ,PHSCL_SEQ_NBR                                               
                   ,LGCL_SEQ_NBR                                                
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
                   ,NSCC_PEND_CD                                                
                   ,NSCC_ACK_IND                                                
                   ,ACCT_EQUITY_AMT                                             
                 INTO                                                           
                    :DCLVTRNHSTY.CLIENT-NBR                                     
                   ,:DCLVTRNHSTY.ACAT-CONTROL-NBR                               
                   ,:DCLVTRNHSTY.SBMTG-PRTCP-NBR                                
                   ,:DCLVTRNHSTY.DLVR-NBR                                       
                   ,:DCLVTRNHSTY.ACCT-DLVR-NBR                                  
                   ,:DCLVTRNHSTY.RCV-NBR                                        
                   ,:DCLVTRNHSTY.ACCT-RCV-NBR                                   
                   ,:DCLVTRNHSTY.TRNFR-TYPE-CD                                  
                   ,:DCLVTRNHSTY.TRANS-TYPE-CD                                  
                   ,:DCLVTRNHSTY.RCV-CUST-NM                                    
                   ,:DCLVTRNHSTY.RCV-SS-PRIM-NBR                                
                   ,:DCLVTRNHSTY.RCV-SS-SCNDY-NBR                               
                   ,:DCLVTRNHSTY.RCV-ACCT-TYPE-CD                               
                   ,:DCLVTRNHSTY.RCV-OCC-BRKR-NBR                               
                   ,:DCLVTRNHSTY.RCV-CRSPN-NBR                                  
                   ,:DCLVTRNHSTY.ACAT-CNTL-ASTD-NBR                             
                   ,:DCLVTRNHSTY.CMNT-TXT                                       
                   ,:DCLVTRNHSTY.PRCS-DT                                        
                   ,:DCLVTRNHSTY.STTS-CD                                        
                   ,:DCLVTRNHSTY.STTLM-TM-CD                                    
                   ,:DCLVTRNHSTY.VAL-FREE-CD                                    
                   ,:DCLVTRNHSTY.TRANS-RFRN-ID-CD                               
                   ,:DCLVTRNHSTY.DB-CR-CD                                       
                   ,:DCLVTRNHSTY.DSTBN-SIDE-CD                                  
                   ,:DCLVTRNHSTY.SYS-ACT-CD                                     
                   ,:DCLVTRNHSTY.SYS-RJCT-RSN-CD                                
                   ,:DCLVTRNHSTY.TRNFR-TYPE-RJC1-CD                             
                   ,:DCLVTRNHSTY.TRNFR-TYPE-RJC2-CD                             
                   ,:DCLVTRNHSTY.TRNFR-TYPE-RJCT-CD                             
                   ,:DCLVTRNHSTY.PHSCL-SEQ-NBR                                  
                   ,:DCLVTRNHSTY.LGCL-SEQ-NBR                                   
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
                   ,:DCLVTRNHSTY.NSCC-PEND-CD                                   
                   ,:DCLVTRNHSTY.NSCC-ACK-IND                                   
                   ,:DCLVTRNHSTY.ACCT-EQUITY-AMT                                
                 FROM                                                           
                    VTRNHSTY                                                    
                WHERE                                                           
                    CLIENT_NBR = :ACAT12-PASS-CLT                               
ET0001              AND  ACAT_CONTROL_NBR = :ACAT12-PASS-ACAT                   
ET0001**            AND  DLVR_NBR = :ACAT12-PASS-DLVR-NBR                       
ET0001**            AND  ACCT_DLVR_NBR LIKE :ACAT12-PASS-ACCT-DLV               
ET0001**            AND  TRNFR_TYPE_CD = 'FUL'                                  
ET0001**            AND  DSTBN_SIDE_CD = 'D'                                    
ET0001**            AND  STTS_CD = '310'                                        
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
ET0001**      PERFORM 0110-SETUP-TFR-ACAT12-COMMAREA                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT12-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *       SETUP TRANSFER TABLE FIELDS OF AN ACAT12-COMMAREA      *          
      *--------------------------------------------------------------*          
       0110-SETUP-TFR-ACAT12-COMMAREA.                                          
           INITIALIZE ACAT12-TRANSFER.                                          
           MOVE CLIENT-NBR             OF DCLVTRNHSTY                           
             TO ACAT12-TFR-CLT.                                                 
           MOVE ACAT-CONTROL-NBR       OF DCLVTRNHSTY                           
             TO ACAT12-TFR-ACAT.                                                
           MOVE STTS-CD                OF DCLVTRNHSTY                           
             TO ACAT12-TFR-STTS.                                                
           MOVE RCV-ACCT-TYPE-CD       OF DCLVTRNHSTY                           
             TO ACAT12-TFR-ACCT-TYPE.                                           
           MOVE RCV-NBR                OF DCLVTRNHSTY                           
             TO ACAT12-TFR-RCV.                                                 
           MOVE ACCT-RCV-NBR           OF DCLVTRNHSTY                           
             TO ACAT12-TFR-RCV-ACCT.                                            
           MOVE DLVR-NBR               OF DCLVTRNHSTY                           
             TO ACAT12-TFR-DLVR.                                                
           MOVE ACCT-DLVR-NBR          OF DCLVTRNHSTY                           
             TO ACAT12-TFR-DLVR-ACCT.                                           
           MOVE STTLM-DT               OF DCLVTRNHSTY                           
             TO ACAT12-TFR-STTL-DT.                                             
           MOVE ACAT-CNTL-ASTD-NBR     OF DCLVTRNHSTY                           
             TO ACAT12-TFR-ACAT-ASTD.                                           
           MOVE RCV-CUST-NM            OF DCLVTRNHSTY                           
             TO ACAT12-TFR-NAME.                                                
           MOVE RCV-SS-PRIM-NBR        OF DCLVTRNHSTY                           
             TO ACAT12-TFR-SS1.                                                 
           MOVE RCV-SS-SCNDY-NBR       OF DCLVTRNHSTY                           
             TO ACAT12-TFR-SS2.                                                 
           MOVE RR-CD                  OF DCLVTRNHSTY                           
             TO ACAT12-TFR-RR.                                                  
           MOVE TRNFR-TYPE-CD          OF DCLVTRNHSTY                           
             TO ACAT12-TFR-TYPE.                                                
           MOVE TRANS-RFRN-ID-CD       OF DCLVTRNHSTY                           
             TO ACAT12-TFR-RFRN-ID.                                             
           MOVE CMNT-TXT               OF DCLVTRNHSTY                           
             TO ACAT12-TFR-CMNTS.                                               
           MOVE TRANS-TYPE-CD          OF DCLVTRNHSTY                           
             TO ACAT12-TFR-TRANS-TYPE.                                          
      *                                                                         
      *--------------------------------------------------------------*          
      *     GET A RECLAIMED INITIAL TRANSFER FROM INIT TRANSFER TBL  *          
ET0003*    --------------------------------------------------------  *          
ET0003*     BY ALLOWING USER TO CREATE DUPLICATE RECLAIM RECORDS,    *          
ET0003*     THIS ROUTINE WILL BE NO LONGER EXECUTED.                 *          
      *--------------------------------------------------------------*          
       0200-GET-TFR-INIT.                                                       
ET0002**   INITIALIZE DCLVINITRNF.                                              
ET0002     INITIALIZE DCLACTITRF.                                               
           EXEC SQL                                                             
               SELECT                                                           
                    CLIENT_NBR                                                  
                   ,DLVR_NBR                                                    
                   ,ACCT_DLVR_NBR                                               
                   ,RCV_NBR                                                     
                   ,ACCT_RCV_NBR                                                
                   ,TRNFR_TYPE_CD                                               
                   ,SBMTG_PRTCP_NBR                                             
                   ,ACAT_CONTROL_NBR                                            
                   ,TRANS_TYPE_CD                                               
                   ,RCV_CUST_NM                                                 
                   ,RCV_SS_PRIM_NBR                                             
                   ,RCV_SS_SCNDY_NBR                                            
                   ,RCV_ACCT_TYPE_CD                                            
                   ,RCV_OCC_BRKR_NBR                                            
                   ,RCV_CRSPN_NBR                                               
                   ,ACAT_CNTL_ASTD_NBR                                          
                   ,CMNT_TXT                                                    
                   ,PRCS_DT                                                     
                   ,STTS_CD                                                     
                   ,DSTBN_SIDE_CD                                               
                   ,SYS_ACT_CD                                                  
                   ,SYS_RJCT_RSN_CD                                             
                   ,TRNFR_TYPE_RJCT_CD                                          
                   ,TRNFR_TYPE_RJC1_CD                                          
                   ,TRNFR_TYPE_RJC2_CD                                          
                   ,PHSCL_SEQ_NBR                                               
                   ,LGCL_SEQ_NBR                                                
                   ,PRTCP_CONTRA_CD                                             
                   ,CYCLE_CD                                                    
                   ,DAYS_STTS_QTY                                               
                   ,TRANS_RFRN_ID_CD                                            
                   ,DB_CR_CD                                                    
                   ,STTLM_ASCTD_DT                                              
                   ,NSCC_PEND_CD                                                
                   ,NSCC_ACK_IND                                                
                   ,UPDT_TMSTP                                                  
                   ,CRT_TMSTP                                                   
                   ,CICS_TERM_ID_CD                                             
                   ,PRGM_NM                                                     
                   ,RR_CD                                                       
                 INTO                                                           
ET0002              :DCLACTITRF.CLIENT-NBR                                      
ET0002             ,:DCLACTITRF.DLVR-NBR                                        
ET0002             ,:DCLACTITRF.ACCT-DLVR-NBR                                   
ET0002             ,:DCLACTITRF.RCV-NBR                                         
ET0002             ,:DCLACTITRF.ACCT-RCV-NBR                                    
ET0002             ,:DCLACTITRF.TRNFR-TYPE-CD                                   
ET0002             ,:DCLACTITRF.SBMTG-PRTCP-NBR                                 
ET0002             ,:DCLACTITRF.ACAT-CONTROL-NBR                                
ET0002             ,:DCLACTITRF.TRANS-TYPE-CD                                   
ET0002             ,:DCLACTITRF.RCV-CUST-NM                                     
ET0002             ,:DCLACTITRF.RCV-SS-PRIM-NBR                                 
ET0002             ,:DCLACTITRF.RCV-SS-SCNDY-NBR                                
ET0002             ,:DCLACTITRF.RCV-ACCT-TYPE-CD                                
ET0002             ,:DCLACTITRF.RCV-OCC-BRKR-NBR                                
ET0002             ,:DCLACTITRF.RCV-CRSPN-NBR                                   
ET0002             ,:DCLACTITRF.ACAT-CNTL-ASTD-NBR                              
ET0002             ,:DCLACTITRF.CMNT-TXT                                        
ET0002             ,:DCLACTITRF.PRCS-DT                                         
ET0002             ,:DCLACTITRF.STTS-CD                                         
ET0002             ,:DCLACTITRF.DSTBN-SIDE-CD                                   
ET0002             ,:DCLACTITRF.SYS-ACT-CD                                      
ET0002             ,:DCLACTITRF.SYS-RJCT-RSN-CD                                 
ET0002             ,:DCLACTITRF.TRNFR-TYPE-RJCT-CD                              
ET0002             ,:DCLACTITRF.TRNFR-TYPE-RJC1-CD                              
ET0002             ,:DCLACTITRF.TRNFR-TYPE-RJC2-CD                              
ET0002             ,:DCLACTITRF.PHSCL-SEQ-NBR                                   
ET0002             ,:DCLACTITRF.LGCL-SEQ-NBR                                    
ET0002             ,:DCLACTITRF.PRTCP-CONTRA-CD                                 
ET0002             ,:DCLACTITRF.CYCLE-CD                                        
ET0002             ,:DCLACTITRF.DAYS-STTS-QTY                                   
ET0002             ,:DCLACTITRF.TRANS-RFRN-ID-CD                                
ET0002             ,:DCLACTITRF.DB-CR-CD                                        
ET0002             ,:DCLACTITRF.STTLM-ASCTD-DT                                  
ET0002             ,:DCLACTITRF.NSCC-PEND-CD                                    
ET0002             ,:DCLACTITRF.NSCC-ACK-IND                                    
ET0002             ,:DCLACTITRF.UPDT-TMSTP                                      
ET0002             ,:DCLACTITRF.CRT-TMSTP                                       
ET0002             ,:DCLACTITRF.CICS-TERM-ID-CD                                 
ET0002             ,:DCLACTITRF.PRGM-NM                                         
                   ,:DCLACTITRF.RR-CD                                           
                 FROM                                                           
ET0002              ACTITRF                                                     
                WHERE                                                           
                    CLIENT_NBR = :ACAT12-PASS-CLT                               
                    AND  DLVR_NBR = :ACAT12-PASS-DLVR-NBR                       
                    AND  ACCT_DLVR_NBR LIKE :ACAT12-PASS-ACCT-DLV               
                    AND  DSTBN_SIDE_CD = 'D'                                    
                    AND  TRNFR_TYPE_CD = 'RCL'                                  
ET0001**            AND  NSCC_PEND_CD = ' '                                     
ET0001              AND  NSCC_PEND_CD IN (' ','Y')                              
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
              PERFORM 0210-SETUP-INIT-TFR-COMMAREA                              
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT12-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
       0210-SETUP-INIT-TFR-COMMAREA.                                            
           INITIALIZE ACAT12-TRANSFER.                                          
ET0002     MOVE CLIENT-NBR             OF DCLACTITRF                            
             TO ACAT12-TFR-CLT.                                                 
ET0002     MOVE SBMTG-PRTCP-NBR        OF DCLACTITRF                            
             TO ACAT12-TFR-PRTCP-NBR.                                           
ET0002     MOVE STTS-CD                OF DCLACTITRF                            
             TO ACAT12-TFR-STTS.                                                
ET0002     MOVE RCV-ACCT-TYPE-CD       OF DCLACTITRF                            
             TO ACAT12-TFR-ACCT-TYPE.                                           
ET0002     MOVE RCV-NBR                OF DCLACTITRF                            
             TO ACAT12-TFR-RCV.                                                 
ET0002     MOVE ACCT-RCV-NBR           OF DCLACTITRF                            
             TO ACAT12-TFR-RCV-ACCT.                                            
ET0002     MOVE DLVR-NBR               OF DCLACTITRF                            
             TO ACAT12-TFR-DLVR.                                                
ET0002     MOVE ACCT-DLVR-NBR          OF DCLACTITRF                            
             TO ACAT12-TFR-DLVR-ACCT.                                           
           MOVE SPACE                                                           
             TO ACAT12-TFR-STTL-DT.                                             
ET0002     MOVE ACAT-CNTL-ASTD-NBR     OF DCLACTITRF                            
             TO ACAT12-TFR-ACAT-ASTD.                                           
ET0002     MOVE RCV-CUST-NM            OF DCLACTITRF                            
             TO ACAT12-TFR-NAME.                                                
ET0002     MOVE RCV-SS-PRIM-NBR        OF DCLACTITRF                            
             TO ACAT12-TFR-SS1.                                                 
ET0002     MOVE RCV-SS-SCNDY-NBR       OF DCLACTITRF                            
             TO ACAT12-TFR-SS2.                                                 
ET0003**   MOVE SPACE                                                           
ET0003     MOVE RR-CD                  OF DCLACTITRF                            
             TO ACAT12-TFR-RR.                                                  
ET0002     MOVE TRNFR-TYPE-CD          OF DCLACTITRF                            
             TO ACAT12-TFR-TYPE.                                                
ET0002     MOVE TRANS-RFRN-ID-CD       OF DCLACTITRF                            
             TO ACAT12-TFR-RFRN-ID.                                             
ET0002     MOVE CMNT-TXT               OF DCLACTITRF                            
             TO ACAT12-TFR-CMNTS.                                               
ET0002     MOVE TRANS-TYPE-CD          OF DCLACTITRF                            
             TO ACAT12-TFR-TRANS-TYPE.                                          
ET0002     MOVE NSCC-PEND-CD           OF DCLACTITRF                            
ET0001       TO ACAT12-TFR-NSCC-PEND.                                           
ET0003     MOVE ACAT-CONTROL-NBR       OF DCLACTITRF                            
ET0003       TO ACAT12-TFR-ACAT.                                                
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *   READ HISTORY ASSET WHICH WILL BE USED WHEN INITIAL ASSET   *          
      *   IS CREATED.                                                *          
      *--------------------------------------------------------------*          
       0300-GET-ASSET-HIST.                                                     
           INITIALIZE DCLVASTHSTY.                                              
           EXEC SQL                                                             
               SELECT                                                           
                    CLIENT_NBR                                                  
                   ,ACAT_CONTROL_NBR                                            
                   ,ASSET_SEQ_NBR                                               
                   ,SBMTG_PRTCP_NBR                                             
                   ,SYS_ACT_CD                                                  
                   ,SYS_RJCT_RSN_CD                                             
                   ,TRANS_TYPE_CD                                               
                   ,PHSCL_SEQ_NBR                                               
                   ,LGCL_SEQ_NBR                                                
                   ,ASSET_PRC_CTGY_CD                                           
                   ,STTLM_LCTN_CD                                               
                   ,STTLM_RSN_CD                                                
                   ,ISIN_CNTRY_CD                                               
                   ,ISIN_SEC_ISSUE_CD                                           
                   ,ISIN_SEC_CDG_CD                                             
                   ,ASSET_DESC_TXT                                              
                   ,ASSET_RQST_QTY_CD                                           
                   ,AST_RQST_TRANS_CD                                           
                   ,ASSET_QTY                                                   
                   ,ASSET_PCT                                                   
                   ,PSTN_CD                                                     
                   ,ISO_CRNCY_CD                                                
                   ,ASSET_AMT                                                   
                   ,BEARER_BOND_CD                                              
                   ,CSH_MGN_SHRT_CD                                             
                   ,WHI_CD                                                      
                   ,TRNFR_TYPE_RSN_CD                                           
                   ,MBS_SERIAL_NBR                                              
                   ,ASSET_CMNT_TXT                                              
                   ,NSCC_ACK_IND                                                
                   ,NSCC_PEND_CD                                                
                   ,FAIL_SENT_CAGE_IND                                          
                   ,FAIL_OPEN_CAGE_IND                                          
                   ,NSCC_NON_ADP_IND                                            
                   ,TRANS_RFRN_ID_CD                                            
                   ,OPTN_CTGY_CD                                                
                   ,ISIN_SEC_EXCPT_IND                                          
                   ,SECURITY_ADP_NBR                                            
                   ,RCL_SENT_NSCC_IND                                           
                   ,FRV_SENT_NSCC_IND                                           
ET0006             ,TRNFR_TYPE_CD                                               
ET0006             ,CAGE_TAG_NBR                                                
ET0006             ,ENTERED_TAG_NBR                                             
ET0006             ,NTWK_CNTL_CD                                                
ET0006             ,FUND_PROC_CD                                                
ET0006             ,FUND_RGSTN_STTS                                             
ET0006             ,SCRTY_866_NBR                                               
ET0006             ,ASSET_866_QTY                                               
                 INTO                                                           
                    :DCLVASTHSTY.CLIENT-NBR                                     
                   ,:DCLVASTHSTY.ACAT-CONTROL-NBR                               
                   ,:DCLVASTHSTY.ASSET-SEQ-NBR                                  
                   ,:DCLVASTHSTY.SBMTG-PRTCP-NBR                                
                   ,:DCLVASTHSTY.SYS-ACT-CD                                     
                   ,:DCLVASTHSTY.SYS-RJCT-RSN-CD                                
                   ,:DCLVASTHSTY.TRANS-TYPE-CD                                  
                   ,:DCLVASTHSTY.PHSCL-SEQ-NBR                                  
                   ,:DCLVASTHSTY.LGCL-SEQ-NBR                                   
                   ,:DCLVASTHSTY.ASSET-PRC-CTGY-CD                              
                   ,:DCLVASTHSTY.STTLM-LCTN-CD                                  
                   ,:DCLVASTHSTY.STTLM-RSN-CD                                   
                   ,:DCLVASTHSTY.ISIN-CNTRY-CD                                  
                   ,:DCLVASTHSTY.ISIN-SEC-ISSUE-CD                              
                   ,:DCLVASTHSTY.ISIN-SEC-CDG-CD                                
                   ,:DCLVASTHSTY.ASSET-DESC-TXT                                 
                   ,:DCLVASTHSTY.ASSET-RQST-QTY-CD                              
                   ,:DCLVASTHSTY.AST-RQST-TRANS-CD                              
                   ,:DCLVASTHSTY.ASSET-QTY                                      
                   ,:DCLVASTHSTY.ASSET-PCT                                      
                   ,:DCLVASTHSTY.PSTN-CD                                        
                   ,:DCLVASTHSTY.ISO-CRNCY-CD                                   
                   ,:DCLVASTHSTY.ASSET-AMT                                      
                   ,:DCLVASTHSTY.BEARER-BOND-CD                                 
                   ,:DCLVASTHSTY.CSH-MGN-SHRT-CD                                
                   ,:DCLVASTHSTY.WHI-CD                                         
                   ,:DCLVASTHSTY.TRNFR-TYPE-RSN-CD                              
                   ,:DCLVASTHSTY.MBS-SERIAL-NBR                                 
                   ,:DCLVASTHSTY.ASSET-CMNT-TXT                                 
                   ,:DCLVASTHSTY.NSCC-ACK-IND                                   
                   ,:DCLVASTHSTY.NSCC-PEND-CD                                   
                   ,:DCLVASTHSTY.FAIL-SENT-CAGE-IND                             
                   ,:DCLVASTHSTY.FAIL-OPEN-CAGE-IND                             
                   ,:DCLVASTHSTY.NSCC-NON-ADP-IND                               
                   ,:DCLVASTHSTY.TRANS-RFRN-ID-CD                               
                   ,:DCLVASTHSTY.OPTN-CTGY-CD                                   
                   ,:DCLVASTHSTY.ISIN-SEC-EXCPT-IND                             
                   ,:DCLVASTHSTY.SECURITY-ADP-NBR                               
                   ,:DCLVASTHSTY.RCL-SENT-NSCC-IND                              
                   ,:DCLVASTHSTY.FRV-SENT-NSCC-IND                              
ET0006             ,:DCLVASTHSTY.TRNFR-TYPE-CD                                  
ET0006             ,:DCLVASTHSTY.CAGE-TAG-NBR                                   
ET0006             ,:DCLVASTHSTY.ENTERED-TAG-NBR                                
ET0006             ,:DCLVASTHSTY.NTWK-CNTL-CD                                   
ET0006             ,:DCLVASTHSTY.FUND-PROC-CD                                   
ET0006             ,:DCLVASTHSTY.FUND-RGSTN-STTS                                
ET0006             ,:DCLVASTHSTY.SCRTY-866-NBR                                  
ET0006             ,:DCLVASTHSTY.ASSET-866-QTY                                  
                 FROM                                                           
                    VASTHSTY                                                    
                 WHERE                                                          
                    CLIENT_NBR = :ACAT12-PASS-CLT         AND                   
                    ACAT_CONTROL_NBR = :ACAT12-PASS-ACAT  AND                   
                    ASSET_SEQ_NBR = :ACAT12-PASS-SEQ-NBR                        
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
ET0006**      PERFORM 0110-SETUP-TFR-ACAT12-COMMAREA                            
LRM011        IF STTLM-LCTN-CD OF DCLVASTHSTY = '05'                            
LRM011        AND (STTLM-RSN-CD OF DCLVASTHSTY = 'DTC' OR 'CNS')                
LRM011           MOVE SPACES TO STTLM-RSN-CD OF DCLVASTHSTY                     
LRM011        END-IF                                                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT12-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          OPEN HISTORY ASSET CURSOR TABLE                     *          
      *--------------------------------------------------------------*          
       0500-OPEN-ASSET-HIST.                                                    
           EXEC SQL                                                             
              OPEN ASTHSTCS                                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          FETCH HISTORY ASSET CURSOR TABLE                    *          
      *--------------------------------------------------------------*          
       0600-FETCH-ASSET-HIST.                                                   
           EXEC SQL                                                             
              FETCH                                                             
                  ASTHSTCS                                                      
              INTO                                                              
                 :DCLVASTHSTY.CLIENT-NBR                                        
                ,:DCLVASTHSTY.ACAT-CONTROL-NBR                                  
                ,:DCLVASTHSTY.ASSET-SEQ-NBR                                     
                ,:DCLVASTHSTY.SBMTG-PRTCP-NBR                                   
                ,:DCLVASTHSTY.SYS-ACT-CD                                        
                ,:DCLVASTHSTY.SYS-RJCT-RSN-CD                                   
                ,:DCLVASTHSTY.TRANS-TYPE-CD                                     
                ,:DCLVASTHSTY.PHSCL-SEQ-NBR                                     
                ,:DCLVASTHSTY.LGCL-SEQ-NBR                                      
                ,:DCLVASTHSTY.ASSET-PRC-CTGY-CD                                 
                ,:DCLVASTHSTY.STTLM-LCTN-CD                                     
                ,:DCLVASTHSTY.STTLM-RSN-CD                                      
                ,:DCLVASTHSTY.ISIN-CNTRY-CD                                     
                ,:DCLVASTHSTY.ISIN-SEC-ISSUE-CD                                 
                ,:DCLVASTHSTY.ISIN-SEC-CDG-CD                                   
                ,:DCLVASTHSTY.ASSET-DESC-TXT                                    
                ,:DCLVASTHSTY.ASSET-RQST-QTY-CD                                 
                ,:DCLVASTHSTY.AST-RQST-TRANS-CD                                 
                ,:DCLVASTHSTY.ASSET-QTY                                         
                ,:DCLVASTHSTY.ASSET-PCT                                         
                ,:DCLVASTHSTY.PSTN-CD                                           
                ,:DCLVASTHSTY.ISO-CRNCY-CD                                      
                ,:DCLVASTHSTY.ASSET-AMT                                         
                ,:DCLVASTHSTY.BEARER-BOND-CD                                    
                ,:DCLVASTHSTY.CSH-MGN-SHRT-CD                                   
                ,:DCLVASTHSTY.WHI-CD                                            
                ,:DCLVASTHSTY.TRNFR-TYPE-RSN-CD                                 
                ,:DCLVASTHSTY.MBS-SERIAL-NBR                                    
                ,:DCLVASTHSTY.ASSET-CMNT-TXT                                    
                ,:DCLVASTHSTY.NSCC-ACK-IND                                      
                ,:DCLVASTHSTY.NSCC-PEND-CD                                      
                ,:DCLVASTHSTY.FAIL-SENT-CAGE-IND                                
                ,:DCLVASTHSTY.FAIL-OPEN-CAGE-IND                                
                ,:DCLVASTHSTY.NSCC-NON-ADP-IND                                  
                ,:DCLVASTHSTY.TRANS-RFRN-ID-CD                                  
                ,:DCLVASTHSTY.OPTN-CTGY-CD                                      
                ,:DCLVASTHSTY.ISIN-SEC-EXCPT-IND                                
                ,:DCLVASTHSTY.SECURITY-ADP-NBR                                  
                ,:DCLVASTHSTY.RCL-SENT-NSCC-IND                                 
                ,:DCLVASTHSTY.FRV-SENT-NSCC-IND                                 
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
              PERFORM 0610-SETUP-HIST-ASSET-COMMAREA                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT12-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *       SETUP HISTORY ASSET TABLE FIELDS OF ACAT12-COMMAREA    *          
      *--------------------------------------------------------------*          
       0610-SETUP-HIST-ASSET-COMMAREA.                                          
           INITIALIZE ACAT12-ASSET.                                             
           MOVE CLIENT-NBR        OF DCLVASTHSTY                                
             TO ACAT12-AST-ACAT.                                                
           MOVE ASSET-PRC-CTGY-CD OF DCLVASTHSTY                                
             TO ACAT12-AST-CTGRY.                                               
           MOVE STTLM-LCTN-CD     OF DCLVASTHSTY                                
             TO ACAT12-AST-STTL-LOC.                                            
           MOVE CSH-MGN-SHRT-CD   OF DCLVASTHSTY                                
             TO ACAT12-AST-CS-MG-SH.                                            
           MOVE ACAT-CONTROL-NBR  OF DCLVASTHSTY                                
             TO ACAT12-AST-ACAT.                                                
           MOVE PSTN-CD           OF DCLVASTHSTY                                
             TO ACAT12-AST-PSTN-CD.                                             
           MOVE ISIN-SEC-ISSUE-CD OF DCLVASTHSTY                                
             TO ACAT12-AST-SEC.                                                 
           MOVE ASSET-QTY         OF DCLVASTHSTY                                
             TO ACAT12-AST-QTY.                                                 
           MOVE ASSET-AMT         OF DCLVASTHSTY                                
             TO ACAT12-AST-AMT.                                                 
           MOVE ASSET-DESC-TXT    OF DCLVASTHSTY                                
             TO ACAT12-AST-DESC.                                                
           MOVE ASSET-CMNT-TXT    OF DCLVASTHSTY                                
             TO ACAT12-AST-CMNTS.                                               
           MOVE TRANS-RFRN-ID-CD  OF DCLVASTHSTY                                
             TO ACAT12-AST-RFRN-ID.                                             
           MOVE TRNFR-TYPE-RSN-CD OF DCLVASTHSTY                                
             TO ACAT12-AST-REASON.                                              
           MOVE TRANS-TYPE-CD     OF DCLVASTHSTY                                
             TO ACAT12-AST-TRANS-TYP.                                           
           MOVE RCL-SENT-NSCC-IND OF DCLVASTHSTY                                
             TO ACAT12-AST-RCL-SENT.                                            
           MOVE FRV-SENT-NSCC-IND OF DCLVASTHSTY                                
             TO ACAT12-AST-FRV-SENT.                                            
           MOVE ASSET-SEQ-NBR     OF DCLVASTHSTY                                
             TO ACAT12-AST-SEQ-NBR.                                             
LRM011     IF STTLM-LCTN-CD OF DCLVASTHSTY = '05'                               
LRM011     AND (STTLM-RSN-CD OF DCLVASTHSTY = 'DTC' OR 'CNS')                   
LRM011         MOVE SPACES TO STTLM-RSN-CD OF DCLVASTHSTY                       
LRM011     END-IF.                                                              
           MOVE STTLM-RSN-CD       OF DCLVASTHSTY                               
             TO ACAT12-AST-STTLM-RSN.                                           
      *                                                                         
      *--------------------------------------------------------------*          
      *          CLOSE HISTORY ASSET CURSOR TABLE                    *          
      *--------------------------------------------------------------*          
       0700-CLOSE-ASSET-HIST.                                                   
           EXEC SQL                                                             
              CLOSE ASTHSTCS                                                    
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
       0800-OPEN-ASSET-INIT.                                                    
           EXEC SQL                                                             
              OPEN ASTINICS                                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          FETCH INITIAL ASSET CURSOR TABLE                    *          
      *--------------------------------------------------------------*          
       0900-FETCH-ASSET-INIT.                                                   
           EXEC SQL                                                             
              FETCH                                                             
                  ASTINICS                                                      
              INTO                                                              
ET0002           :DCLACTIAST.CLIENT-NBR                                         
ET0002          ,:DCLACTIAST.DLVR-NBR                                           
ET0002          ,:DCLACTIAST.ACCT-DLVR-NBR                                      
ET0002          ,:DCLACTIAST.RCV-NBR                                            
ET0002          ,:DCLACTIAST.ACCT-RCV-NBR                                       
ET0002          ,:DCLACTIAST.ISIN-CNTRY-CD                                      
ET0002          ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                                  
ET0002          ,:DCLACTIAST.ISIN-SEC-CDG-CD                                    
ET0002          ,:DCLACTIAST.STTLM-LCTN-CD                                      
ET0002          ,:DCLACTIAST.CSH-MGN-SHRT-CD                                    
ET0002          ,:DCLACTIAST.SBMTG-PRTCP-NBR                                    
ET0002          ,:DCLACTIAST.ACAT-CONTROL-NBR                                   
ET0002          ,:DCLACTIAST.ASSET-SEQ-NBR                                      
ET0002          ,:DCLACTIAST.TRANS-TYPE-CD                                      
ET0002          ,:DCLACTIAST.PHSCL-SEQ-NBR                                      
ET0002          ,:DCLACTIAST.LGCL-SEQ-NBR                                       
ET0002          ,:DCLACTIAST.ASSET-PRC-CTGY-CD                                  
ET0002          ,:DCLACTIAST.STTLM-RSN-CD                                       
ET0002          ,:DCLACTIAST.ASSET-DESC-TXT                                     
ET0002          ,:DCLACTIAST.ASSET-RQST-QTY-CD                                  
ET0002          ,:DCLACTIAST.AST-RQST-TRANS-CD                                  
ET0002          ,:DCLACTIAST.ASSET-QTY                                          
ET0002          ,:DCLACTIAST.ASSET-PCT                                          
ET0002          ,:DCLACTIAST.PSTN-CD                                            
ET0002          ,:DCLACTIAST.ISO-CRNCY-CD                                       
ET0002          ,:DCLACTIAST.ASSET-AMT                                          
ET0002          ,:DCLACTIAST.BEARER-BOND-CD                                     
ET0002          ,:DCLACTIAST.WHI-CD                                             
ET0002          ,:DCLACTIAST.TRNFR-TYPE-RSN-CD                                  
ET0002          ,:DCLACTIAST.MBS-SERIAL-NBR                                     
ET0002          ,:DCLACTIAST.ASSET-CMNT-TXT                                     
ET0002          ,:DCLACTIAST.NSCC-WTHLD-CD                                      
ET0002          ,:DCLACTIAST.TRANS-RFRN-ID-CD                                   
ET0002          ,:DCLACTIAST.OPTN-CTGY-CD                                       
ET0002          ,:DCLACTIAST.NSCC-PEND-CD                                       
ET0002          ,:DCLACTIAST.NSCC-ACK-IND                                       
ET0002          ,:DCLACTIAST.PRGM-NM                                            
ET0002          ,:DCLACTIAST.CICS-TERM-ID-CD                                    
ET0002          ,:DCLACTIAST.UPDT-TMSTP                                         
ET0002          ,:DCLACTIAST.CRT-TMSTP                                          
ET0002          ,:DCLACTIAST.SECURITY-ADP-NBR                                   
ET0002          ,:DCLACTIAST.TRNFR-TYPE-CD                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
              PERFORM 0910-SETUP-INIT-ASSET-COMMAREA                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT12-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
       0910-SETUP-INIT-ASSET-COMMAREA.                                          
           INITIALIZE ACAT12-ASSET.                                             
ET0002     MOVE CLIENT-NBR          OF DCLACTIAST                               
             TO ACAT12-AST-CLT.                                                 
ET0002     MOVE ASSET-PRC-CTGY-CD   OF DCLACTIAST                               
             TO ACAT12-AST-CTGRY.                                               
ET0002     MOVE STTLM-LCTN-CD       OF DCLACTIAST                               
             TO ACAT12-AST-STTL-LOC.                                            
ET0002     MOVE CSH-MGN-SHRT-CD     OF DCLACTIAST                               
             TO ACAT12-AST-CS-MG-SH.                                            
ET0002     MOVE ACAT-CONTROL-NBR    OF DCLACTIAST                               
             TO ACAT12-AST-ACAT.                                                
ET0002     MOVE PSTN-CD             OF DCLACTIAST                               
             TO ACAT12-AST-PSTN-CD.                                             
ET0002     MOVE ISIN-SEC-ISSUE-CD   OF DCLACTIAST                               
             TO ACAT12-AST-SEC.                                                 
ET0002     MOVE ASSET-QTY           OF DCLACTIAST                               
             TO ACAT12-AST-QTY.                                                 
ET0002     MOVE ASSET-AMT           OF DCLACTIAST                               
             TO ACAT12-AST-AMT                                                  
ET0002     MOVE ASSET-DESC-TXT      OF DCLACTIAST                               
             TO ACAT12-AST-DESC.                                                
ET0002     MOVE ASSET-CMNT-TXT      OF DCLACTIAST                               
             TO ACAT12-AST-CMNTS.                                               
ET0002     MOVE TRANS-RFRN-ID-CD    OF DCLACTIAST                               
             TO ACAT12-AST-RFRN-ID.                                             
ET0002     MOVE TRNFR-TYPE-RSN-CD   OF DCLACTIAST                               
             TO ACAT12-AST-REASON.                                              
ET0002     MOVE TRANS-TYPE-CD       OF DCLACTIAST                               
             TO ACAT12-AST-TRANS-TYP.                                           
ET0002     MOVE ASSET-SEQ-NBR       OF DCLACTIAST                               
             TO ACAT12-AST-SEQ-NBR.                                             
ET0002     MOVE STTLM-RSN-CD        OF DCLACTIAST                               
             TO ACAT12-AST-STTLM-RSN.                                           
       EJECT                                                                    
       1000-CLOSE-ASSET-INIT.                                                   
           EXEC SQL                                                             
              CLOSE ASTINICS                                                    
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *      CREATE A RECLAIM INITIAL TRANSFER TABLE                 *          
      *--------------------------------------------------------------*          
       1100-INSERT-TFR-INIT.                                                    
           PERFORM 0100-GET-TFR-HIST.                                           
ET0002**   INITIALIZE DCLVINITRNF.                                              
ET0002     INITIALIZE DCLACTITRF.                                               
           EXEC SQL                                                             
ET0002        INSERT INTO ACTITRF                                               
                 ( CLIENT_NBR                                                   
                  ,DLVR_NBR                                                     
                  ,ACCT_DLVR_NBR                                                
                  ,RCV_NBR                                                      
                  ,ACCT_RCV_NBR                                                 
                  ,TRNFR_TYPE_CD                                                
                  ,RCV_NBR_STTS_CD                                              
                  ,DLVR_NBR_STTS_CD                                             
                  ,ACCT_RCV_STTS_CD                                             
                  ,ACCT_DLVR_STTS_CD                                            
                  ,SBMTG_PRTCP_NBR                                              
                  ,SBMT_PRT_NR_STS_CD                                           
                  ,ACAT_CONTROL_NBR                                             
                  ,CONTROL_NBR_STS_CD                                           
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
                  ,DSTBN_SIDE_CD                                                
                  ,SYS_ACT_CD                                                   
                  ,SYS_RJCT_RSN_CD                                              
                  ,TRNFR_TYPE_RJCT_CD                                           
                  ,TRNFR_TYPE_RJC1_CD                                           
                  ,TRNFR_TYPE_RJC2_CD                                           
                  ,TRN_TYP_RJC_STS_CD                                           
                  ,PHSCL_SEQ_NBR                                                
                  ,PHSCL_SEQ_STTS_CD                                            
                  ,LGCL_SEQ_NBR                                                 
                  ,LGCL_SEQ_NR_STS_CD                                           
                  ,PRTCP_CONTRA_CD                                              
                  ,CYCLE_CD                                                     
                  ,DAYS_STTS_QTY                                                
                  ,TRANS_RFRN_ID_CD                                             
                  ,TRANS_RFRN_STTS_CD                                           
                  ,DB_CR_CD                                                     
                  ,STTLM_ASCTD_DT                                               
                  ,STTLM_ASCTD_STS_CD                                           
                  ,RCRD_LNGTH_STTS_CD                                           
                  ,RCRD_STTS_CD                                                 
                  ,NSCC_PEND_CD                                                 
                  ,NSCC_ACK_IND                                                 
                  ,UPDT_TMSTP                                                   
                  ,CRT_TMSTP                                                    
                  ,CICS_TERM_ID_CD                                              
                  ,PRGM_NM                                                      
                  ,RR_CD                                                        
LRM009            ,CICS_SGNON_ID                                                
LRM009            ,CICS_NET_NM                                                  
LRM009            ,TPSCRT_USR_ID                                                
LRM009            ,TPSCRT_USR_NM )                                              
              VALUES                                                            
                 ( :DCLVTRNHSTY.CLIENT-NBR                                      
                  ,:DCLVTRNHSTY.DLVR-NBR                                        
                  ,:DCLVTRNHSTY.ACCT-DLVR-NBR                                   
                  ,:DCLVTRNHSTY.RCV-NBR                                         
                  ,:DCLVTRNHSTY.ACCT-RCV-NBR                                    
                  ,'RCL'                                                        
ET0002            ,:DCLACTITRF.RCV-NBR-STTS-CD                                  
ET0002            ,:DCLACTITRF.DLVR-NBR-STTS-CD                                 
ET0002            ,:DCLACTITRF.ACCT-RCV-STTS-CD                                 
ET0002            ,:DCLACTITRF.ACCT-DLVR-STTS-CD                                
                  ,:WS-SBMT-CLT                                                 
ET0002            ,:DCLACTITRF.SBMT-PRT-NR-STS-CD                               
ET0003            ,:WS-ADP-CONTROL                                              
ET0002            ,:DCLACTITRF.CONTROL-NBR-STS-CD                               
ET0002            ,:DCLACTITRF.TRNFR-TYPE-STTS-CD                               
                  ,'A'                                                          
ET0002            ,:DCLACTITRF.TRANS-TYPE-STTS-CD                               
                  ,:DCLVTRNHSTY.RCV-CUST-NM                                     
ET0002            ,:DCLACTITRF.RCV-CUST-NM-STS-CD                               
                  ,:DCLVTRNHSTY.RCV-SS-PRIM-NBR                                 
ET0002            ,:DCLACTITRF.RCV-SS-PRIM-STS-CD                               
                  ,:DCLVTRNHSTY.RCV-SS-SCNDY-NBR                                
ET0002            ,:DCLACTITRF.RCV-SS-SCDY-STS-CD                               
                  ,:DCLVTRNHSTY.RCV-ACCT-TYPE-CD                                
ET0002            ,:DCLACTITRF.RCV-ACT-TYP-STS-CD                               
                  ,:DCLVTRNHSTY.RCV-OCC-BRKR-NBR                                
ET0002            ,:DCLACTITRF.RCV-OCC-STTS-CD                                  
                  ,:DCLVTRNHSTY.RCV-CRSPN-NBR                                   
ET0002            ,:DCLACTITRF.RCV-CRSPN-STTS-CD                                
                  ,:DCLVTRNHSTY.ACAT-CONTROL-NBR                                
ET0002            ,:DCLACTITRF.CNTL-ASTD-STTS-CD                                
                  ,:ACAT12-PASS-CMNTS                                           
ET0002            ,:DCLACTITRF.CMNT-STTS-CD                                     
                  ,:WS-CURRENT-DATE                                             
ET0002            ,:DCLACTITRF.STTS-CD                                          
                  ,:DCLVTRNHSTY.DSTBN-SIDE-CD                                   
                  ,:DCLVTRNHSTY.SYS-ACT-CD                                      
                  ,:DCLVTRNHSTY.SYS-RJCT-RSN-CD                                 
ET0005            ,' '                                                          
ET0005            ,' '                                                          
ET0005            ,' '                                                          
ET0002            ,:DCLACTITRF.TRN-TYP-RJC-STS-CD                               
                  ,+1                                                           
ET0002            ,: DCLACTITRF.PHSCL-SEQ-STTS-CD                               
                  ,+1                                                           
ET0002            ,:DCLACTITRF.LGCL-SEQ-NR-STS-CD                               
                  ,:DCLVTRNHSTY.PRTCP-CONTRA-CD                                 
                  ,:DCLVTRNHSTY.CYCLE-CD                                        
                  ,:DCLVTRNHSTY.DAYS-STTS-QTY                                   
ET0003            ,:WS-TRANS-RFRN-ID                                            
ET0002            ,:DCLACTITRF.TRANS-RFRN-STTS-CD                               
                  ,:DCLVTRNHSTY.DB-CR-CD                                        
                  ,:DCLVTRNHSTY.STTLM-DT                                        
ET0002            ,:DCLACTITRF.STTLM-ASCTD-STS-CD                               
ET0002            ,:DCLACTITRF.RCRD-LNGTH-STTS-CD                               
ET0002            ,:DCLACTITRF.RCRD-STTS-CD                                     
ET0002            ,:DCLACTITRF.NSCC-PEND-CD                                     
LRM010            ,' '                                                          
                  ,:WS-TIMESTAMP                                                
                  ,:WS-TIMESTAMP                                                
                  ,:ACAT12-PASS-TERMID                                          
                  ,'ACAT12DB'                                                   
                  ,:DCLVTRNHSTY.RR-CD                                           
LRM009            ,:ACAT12-SNON-ID                                              
LRM009            ,:ACAT12-NETNAME                                              
LRM009            ,:ACAT12-USER-ID                                              
LRM009            ,:ACAT12-USER-NAME )                                          
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
ET0003     ELSE                                                                 
ET0003     IF SQLCODE = -803                                                    
ET0003        SET ACAT12-FOUND   TO TRUE                                        
           ELSE                                                                 
              PERFORM 9000-ROLLBACK                                             
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *      CREATE A RECLAIM INITIAL ASSET TABLE                    *          
      *--------------------------------------------------------------*          
       1200-INSERT-ASSET-INIT.                                                  
           PERFORM 0300-GET-ASSET-HIST.                                         
ET0006                                                                          
ET0006     IF ACAT12-PASS-QTY NOT = 0                                           
ET0006         IF ASSET-QTY OF DCLVASTHSTY = 0                                  
ET0006            MOVE ZEROES TO WS-866-QTY                                     
ET0006         ELSE                                                             
ET0006            COMPUTE WS-866-QTY                                            
ET0006               = ACAT12-PASS-QTY / ASSET-QTY OF DCLVASTHSTY               
ET0006                                 * ASSET-866-QTY OF DCLVASTHSTY           
ET0006         END-IF                                                           
ET0006     END-IF.                                                              
ET0006                                                                          
ET0002**   INITIALIZE DCLVINITAST.                                              
ET0002     INITIALIZE DCLACTIAST.                                               
           EXEC SQL                                                             
ET0002        INSERT INTO ACTIAST                                               
                  ( CLIENT_NBR                                                  
                   ,DLVR_NBR                                                    
                   ,ACCT_DLVR_NBR                                               
                   ,RCV_NBR                                                     
                   ,ACCT_RCV_NBR                                                
                   ,ISIN_CNTRY_CD                                               
                   ,ISIN_SEC_ISSUE_CD                                           
                   ,ISIN_SEC_CDG_CD                                             
                   ,STTLM_LCTN_CD                                               
                   ,CSH_MGN_SHRT_CD                                             
                   ,CSH_MRG_SHT_STS_CD                                          
                   ,STTLM_LCTN_STTS_CD                                          
                   ,ISIN_CNTRY_STTS_CD                                          
                   ,SBMTG_PRTCP_NBR                                             
                   ,SBMT_PRT_NR_STS_CD                                          
                   ,ACAT_CONTROL_NBR                                            
                   ,CONTROL_NBR_STS_CD                                          
                   ,ASSET_SEQ_NBR                                               
                   ,AST_SEQ_NBR_STS_CD                                          
                   ,TRANS_TYPE_CD                                               
                   ,TRANS_TYPE_STTS_CD                                          
                   ,PHSCL_SEQ_NBR                                               
                   ,PHSCL_SEQ_STTS_CD                                           
                   ,LGCL_SEQ_NBR                                                
                   ,LGCL_SEQ_NR_STS_CD                                          
                   ,ASSET_PRC_CTGY_CD                                           
                   ,AST_PRC_CTG_STS_CD                                          
                   ,STTLM_RSN_CD                                                
                   ,STTLM_RSN_STTS_CD                                           
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
                   ,WHI_CD                                                      
                   ,WHI_STTS_CD                                                 
                   ,TRNFR_TYPE_RSN_CD                                           
                   ,TRN_TYP_RSN_STS_CD                                          
                   ,MBS_SERIAL_NBR                                              
                   ,MBS_SERIAL_STTS_CD                                          
                   ,ASSET_CMNT_TXT                                              
                   ,ASSET_CMNT_STTS_CD                                          
                   ,NSCC_WTHLD_CD                                               
                   ,TRANS_RFRN_ID_CD                                            
                   ,TRANS_RFRN_STTS_CD                                          
                   ,ISIN_SEC_IS_STS_CD                                          
                   ,ISIN_SEC_CD_STS_CD                                          
                   ,OPTN_CTGY_CD                                                
                   ,OPTN_CTGY_STTS_CD                                           
                   ,RCRD_LNGTH_STTS_CD                                          
                   ,RCRD_STTS_CD                                                
                   ,NSCC_PEND_CD                                                
                   ,NSCC_ACK_IND                                                
                   ,PRGM_NM                                                     
                   ,CICS_TERM_ID_CD                                             
                   ,UPDT_TMSTP                                                  
                   ,CRT_TMSTP                                                   
                   ,SECURITY_ADP_NBR                                            
                   ,TRNFR_TYPE_CD                                               
                   ,TRNFR_TYPE_STTS_CD                                          
                   ,RCV_NBR_STTS_CD                                             
                   ,DLVR_NBR_STTS_CD                                            
ET0006             ,CAGE_TAG_NBR                                                
ET0006             ,SCRTY_866_NBR                                               
ET0006             ,ASSET_866_QTY )                                             
              VALUES                                                            
                  (:DCLVASTHSTY.CLIENT-NBR                                      
                  ,:ACAT12-PASS-DLVR-NBR                                        
                  ,:ACAT12-PASS-ACCT-DLV                                        
                  ,:ACAT12-PASS-CON-BRKR                                        
                  ,:ACAT12-PASS-CON-ACCT                                        
                  ,:DCLVASTHSTY.ISIN-CNTRY-CD                                   
                  ,:DCLVASTHSTY.ISIN-SEC-ISSUE-CD                               
                  ,:DCLVASTHSTY.ISIN-SEC-CDG-CD                                 
                  ,:DCLVASTHSTY.STTLM-LCTN-CD                                   
                  ,:DCLVASTHSTY.CSH-MGN-SHRT-CD                                 
ET0002            ,:DCLACTIAST.CSH-MRG-SHT-STS-CD                               
ET0002            ,:DCLACTIAST.STTLM-LCTN-STTS-CD                               
ET0002            ,:DCLACTIAST.ISIN-CNTRY-STTS-CD                               
                  ,:WS-SBMT-CLT                                                 
ET0002            ,:DCLACTIAST.SBMT-PRT-NR-STS-CD                               
ET0003            ,:WS-ADP-CONTROL                                              
ET0002            ,:DCLACTIAST.CONTROL-NBR-STS-CD                               
                  ,0                                                            
ET0002            ,:DCLACTIAST.AST-SEQ-NBR-STS-CD                               
                  ,'A'                                                          
ET0002            ,:DCLACTIAST.TRANS-TYPE-STTS-CD                               
                  ,+1                                                           
ET0002            ,:DCLACTIAST.PHSCL-SEQ-STTS-CD                                
                  ,+1                                                           
ET0002            ,:DCLACTIAST.LGCL-SEQ-NR-STS-CD                               
                  ,:DCLVASTHSTY.ASSET-PRC-CTGY-CD                               
ET0002            ,:DCLACTIAST.AST-PRC-CTG-STS-CD                               
ET0001            ,:ACAT12-PASS-STTLM-RSN-CD                                    
ET0002            ,:DCLACTIAST.STTLM-RSN-STTS-CD                                
ET0001            ,:ACAT12-PASS-ASSET-DESC                                      
ET0002            ,:DCLACTIAST.ASSET-DESC-STTS-CD                               
                  ,:DCLVASTHSTY.ASSET-RQST-QTY-CD                               
ET0002            ,:DCLACTIAST.ASSET-RQST-STS-CD                                
                  ,:DCLVASTHSTY.AST-RQST-TRANS-CD                               
ET0002            ,:DCLACTIAST.AST-RQ-TRAN-STS-CD                               
                  ,:ACAT12-PASS-QTY                                             
ET0002            ,:DCLACTIAST.ASSET-QTY-STTS-CD                                
                  ,:DCLVASTHSTY.ASSET-PCT                                       
ET0002            ,:DCLACTIAST.ASSET-PCT-STTS-CD                                
                  ,:DCLVASTHSTY.PSTN-CD                                         
ET0002            ,:DCLACTIAST.PSTN-CD-STTS-CD                                  
                  ,:DCLVASTHSTY.ISO-CRNCY-CD                                    
ET0002            ,:DCLACTIAST.ISO-CRNCY-STTS-CD                                
                  ,:ACAT12-PASS-AMT                                             
ET0002            ,:DCLACTIAST.ASSET-AMT-STTS-CD                                
                  ,:DCLVASTHSTY.BEARER-BOND-CD                                  
ET0002            ,:DCLACTIAST.BEARER-BND-STTS-CD                               
                  ,:DCLVASTHSTY.WHI-CD                                          
ET0002            ,:DCLACTIAST.WHI-STTS-CD                                      
                  ,:ACAT12-PASS-REASON                                          
ET0002            ,:DCLACTIAST.TRN-TYP-RSN-STS-CD                               
                  ,:DCLVASTHSTY.MBS-SERIAL-NBR                                  
ET0002            ,:DCLACTIAST.MBS-SERIAL-STTS-CD                               
                  ,:ACAT12-PASS-CMNTS                                           
ET0002            ,:DCLACTIAST.ASSET-CMNT-STTS-CD                               
ET0002            ,:DCLACTIAST.NSCC-WTHLD-CD                                    
ET0003            ,:WS-TRANS-RFRN-ID                                            
ET0002            ,:DCLACTIAST.TRANS-RFRN-STTS-CD                               
ET0002            ,:DCLACTIAST.ISIN-SEC-IS-STS-CD                               
ET0002            ,:DCLACTIAST.ISIN-SEC-CD-STS-CD                               
                  ,:DCLVASTHSTY.OPTN-CTGY-CD                                    
ET0002            ,:DCLACTIAST.OPTN-CTGY-STTS-CD                                
ET0002            ,:DCLACTIAST.RCRD-LNGTH-STTS-CD                               
ET0002            ,:DCLACTIAST.RCRD-STTS-CD                                     
ET0002            ,:DCLACTIAST.NSCC-PEND-CD                                     
LRM010            ,' '                                                          
                  ,'ACAT12DB'                                                   
                  ,:ACAT12-PASS-TERMID                                          
                  ,:WS-TIMESTAMP                                                
                  ,:WS-TIMESTAMP                                                
                  ,:DCLVASTHSTY.SECURITY-ADP-NBR                                
                  ,'RCL'                                                        
ET0002            ,:DCLACTIAST.TRNFR-TYPE-STTS-CD                               
ET0002            ,:DCLACTIAST.RCV-NBR-STTS-CD                                  
ET0002            ,:DCLACTIAST.DLVR-NBR-STTS-CD                                 
ET0006            ,:DCLVASTHSTY.CAGE-TAG-NBR                                    
ET0006            ,:DCLVASTHSTY.SCRTY-866-NBR                                   
ET0006            ,:WS-866-QTY)                                                 
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
              MOVE 'Y' TO WS-RECLAIM-SENT-IND                                   
12/21 *****   PERFORM 1300-UPDATE-ASSET-HIST                                    
           ELSE                                                                 
              PERFORM 9000-ROLLBACK                                             
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
ET0004*                                                                         
ET0004*--------------------------------------------------------------*          
ET0004*    CREATE INITIAL ASSET TABLE ROW WHERE USER REQUESTS TO     *          
ET0004*    ADD ADDITINAL ASSET NOT EXISTED IN HISTORY TABLE.         *          
ET0004*--------------------------------------------------------------*          
ET0004 1210-INSERT-ADD-ASSET-INIT.                                              
           INITIALIZE DCLACTIAST.                                               
           EXEC SQL                                                             
              INSERT INTO ACTIAST                                               
                  ( CLIENT_NBR                                                  
                   ,DLVR_NBR                                                    
                   ,RCV_NBR                                                     
                   ,ACCT_DLVR_NBR                                               
                   ,ACCT_RCV_NBR                                                
                   ,ISIN_CNTRY_CD                                               
                   ,ISIN_SEC_ISSUE_CD                                           
                   ,ISIN_SEC_CDG_CD                                             
                   ,STTLM_LCTN_CD                                               
                   ,CSH_MGN_SHRT_CD                                             
                   ,ACAT_CONTROL_NBR                                            
                   ,TRNFR_TYPE_CD                                               
                   ,ASSET_SEQ_NBR                                               
                   ,RCRD_STTS_CD                                                
                   ,RCRD_LNGTH_STTS_CD                                          
                   ,AST_SEQ_NBR_STS_CD                                          
                   ,OPTN_CTGY_STTS_CD                                           
                   ,SBMTG_PRTCP_NBR                                             
                   ,AST_PRC_CTG_STS_CD                                          
                   ,SBMT_PRT_NR_STS_CD                                          
                   ,PHSCL_SEQ_NBR                                               
                   ,CONTROL_NBR_STS_CD                                          
                   ,STTLM_LCTN_STTS_CD                                          
                   ,LGCL_SEQ_NBR                                                
                   ,ASSET_PRC_CTGY_CD                                           
                   ,STTLM_RSN_STTS_CD                                           
                   ,ISIN_CNTRY_STTS_CD                                          
                   ,ISIN_SEC_IS_STS_CD                                          
                   ,PHSCL_SEQ_STTS_CD                                           
                   ,STTLM_RSN_CD                                                
                   ,ISIN_SEC_CD_STS_CD                                          
                   ,LGCL_SEQ_NR_STS_CD                                          
                   ,ASSET_DESC_TXT                                              
                   ,ASSET_DESC_STTS_CD                                          
                   ,ASSET_RQST_QTY_CD                                           
                   ,ASSET_RQST_STS_CD                                           
                   ,AST_RQST_TRANS_CD                                           
                   ,AST_RQ_TRAN_STS_CD                                          
                   ,ASSET_QTY                                                   
                   ,ASSET_PCT                                                   
                   ,ASSET_QTY_STTS_CD                                           
                   ,PSTN_CD                                                     
                   ,ASSET_PCT_STTS_CD                                           
                   ,ISO_CRNCY_CD                                                
                   ,PSTN_CD_STTS_CD                                             
                   ,ASSET_AMT                                                   
                   ,ISO_CRNCY_STTS_CD                                           
                   ,ASSET_AMT_STTS_CD                                           
                   ,BEARER_BOND_CD                                              
                   ,BEARER_BND_STTS_CD                                          
                   ,WHI_CD                                                      
                   ,CSH_MRG_SHT_STS_CD                                          
                   ,TRNFR_TYPE_RSN_CD                                           
                   ,WHI_STTS_CD                                                 
                   ,TRN_TYP_RSN_STS_CD                                          
                   ,MBS_SERIAL_NBR                                              
                   ,MBS_SERIAL_STTS_CD                                          
                   ,ASSET_CMNT_TXT                                              
                   ,ASSET_CMNT_STTS_CD                                          
                   ,NSCC_ACK_IND                                                
                   ,NSCC_PEND_CD                                                
                   ,NSCC_WTHLD_CD                                               
                   ,CICS_TERM_ID_CD                                             
                   ,TRANS_RFRN_STTS_CD                                          
                   ,PRGM_NM                                                     
                   ,TRANS_RFRN_ID_CD                                            
                   ,CRT_TMSTP                                                   
                   ,UPDT_TMSTP                                                  
                   ,OPTN_CTGY_CD                                                
                   ,TRANS_TYPE_CD                                               
                   ,TRANS_TYPE_STTS_CD                                          
                   ,SECURITY_ADP_NBR                                            
                   ,TRNFR_TYPE_STTS_CD                                          
                   ,RCV_NBR_STTS_CD                                             
                   ,DLVR_NBR_STTS_CD                                            
                   ,CAGE_TAG_NBR                                                
ET0006             ,SCRTY_866_NBR                                               
ET0006             ,ASSET_866_QTY )                                             
              VALUES                                                            
                  (:ACAT12-PASS-CLT                                             
                  ,:ACAT12-PASS-DLVR-NBR                                        
                  ,:ACAT12-PASS-CON-BRKR                                        
                  ,:ACAT12-PASS-ACCT-DLV                                        
                  ,:ACAT12-PASS-CON-ACCT                                        
                  ,'US'                                                         
                  ,:ACAT12-PASS-SECURITY                                        
                  ,:DCLACTIAST.ISIN-SEC-CDG-CD                                  
                  ,:ACAT12-PASS-STTL-LOC                                        
                  ,:ACAT12-PASS-CSH-MGN-SHT                                     
                  ,:WS-ADP-CONTROL                                              
                  ,'RCL'                                                        
                  ,0                                                            
                  ,:DCLACTIAST.RCRD-STTS-CD                                     
                  ,:DCLACTIAST.RCRD-LNGTH-STTS-CD                               
                  ,:DCLACTIAST.AST-SEQ-NBR-STS-CD                               
                  ,:DCLACTIAST.OPTN-CTGY-STTS-CD                                
                  ,:WS-SBMT-CLT                                                 
                  ,:DCLACTIAST.AST-PRC-CTG-STS-CD                               
                  ,:DCLACTIAST.SBMT-PRT-NR-STS-CD                               
                  ,+1                                                           
                  ,:DCLACTIAST.CONTROL-NBR-STS-CD                               
                  ,:DCLACTIAST.STTLM-LCTN-STTS-CD                               
                  ,+1                                                           
                  ,:ACAT12-PASS-CATEGORY                                        
                  ,:DCLACTIAST.STTLM-RSN-STTS-CD                                
                  ,:DCLACTIAST.ISIN-CNTRY-STTS-CD                               
                  ,:DCLACTIAST.ISIN-SEC-IS-STS-CD                               
                  ,:DCLACTIAST.PHSCL-SEQ-STTS-CD                                
                  ,:DCLACTIAST.STTLM-RSN-CD                                     
                  ,:DCLACTIAST.ISIN-SEC-CD-STS-CD                               
                  ,:DCLACTIAST.LGCL-SEQ-NR-STS-CD                               
                  ,:ACAT12-PASS-ASSET-DESC                                      
                  ,:DCLACTIAST.ASSET-DESC-STTS-CD                               
                  ,:DCLACTIAST.ASSET-RQST-QTY-CD                                
                  ,:DCLACTIAST.ASSET-RQST-STS-CD                                
                  ,:DCLACTIAST.AST-RQST-TRANS-CD                                
                  ,:DCLACTIAST.AST-RQ-TRAN-STS-CD                               
                  ,:ACAT12-PASS-QTY                                             
                  ,:DCLACTIAST.ASSET-PCT                                        
                  ,:DCLACTIAST.ASSET-QTY-STTS-CD                                
                  ,:ACAT12-PASS-PSTN-CD                                         
                  ,:DCLACTIAST.ASSET-PCT-STTS-CD                                
                  ,:DCLACTIAST.ISO-CRNCY-CD                                     
                  ,:DCLACTIAST.PSTN-CD-STTS-CD                                  
                  ,:ACAT12-PASS-AMT                                             
                  ,:DCLACTIAST.ISO-CRNCY-STTS-CD                                
                  ,:DCLACTIAST.ASSET-AMT-STTS-CD                                
                  ,:DCLACTIAST.BEARER-BOND-CD                                   
                  ,:DCLACTIAST.BEARER-BND-STTS-CD                               
                  ,:DCLACTIAST.WHI-CD                                           
                  ,:DCLACTIAST.CSH-MRG-SHT-STS-CD                               
                  ,:ACAT12-PASS-REASON                                          
                  ,:DCLACTIAST.WHI-STTS-CD                                      
                  ,:DCLACTIAST.TRN-TYP-RSN-STS-CD                               
                  ,:DCLACTIAST.MBS-SERIAL-NBR                                   
                  ,:DCLACTIAST.MBS-SERIAL-STTS-CD                               
                  ,:ACAT12-PASS-CMNTS                                           
                  ,:DCLACTIAST.ASSET-CMNT-STTS-CD                               
LRM010            ,' '                                                          
                  ,:DCLACTIAST.NSCC-PEND-CD                                     
                  ,:DCLACTIAST.NSCC-WTHLD-CD                                    
                  ,:ACAT12-PASS-TERMID                                          
                  ,:DCLACTIAST.TRANS-RFRN-STTS-CD                               
                  ,'ACAT12DB'                                                   
                  ,:WS-TRANS-RFRN-ID                                            
                  ,:WS-TIMESTAMP                                                
                  ,:WS-TIMESTAMP                                                
                  ,'00'                                                         
                  ,'A'                                                          
                  ,:DCLACTIAST.TRANS-TYPE-STTS-CD                               
                  ,:ACAT12-PASS-ADP-NBR                                         
                  ,:DCLACTIAST.TRNFR-TYPE-STTS-CD                               
                  ,:DCLACTIAST.RCV-NBR-STTS-CD                                  
                  ,:DCLACTIAST.DLVR-NBR-STTS-CD                                 
                  ,:DCLACTIAST.CAGE-TAG-NBR                                     
ET0006            ,:DCLACTIAST.SCRTY-866-NBR                                    
ET0006            ,:DCLACTIAST.ASSET-866-QTY )                                  
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
           ELSE                                                                 
              PERFORM 9000-ROLLBACK                                             
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR                                            
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *     UPDATE RCL_SENT_NSCC_IND OF HISTORY ASSET TABLE          *          
      *     WHEN INITIAL TRANSFER IS CREATED OR DELETED.             *          
      *     **** 12/21/98 ****                                       *          
      *     * DO NOT UPDATE ASSET HISTORY.                           *          
      *     * INSTEAD, ACAT12IR PROGRAM READS ACTIVE ASSET TABLE AND *          
      *     * EXAMINE TO SEE IF ANY ASSETS HAVE BEEN RECLAIMED.      *          
      *--------------------------------------------------------------*          
       1300-UPDATE-ASSET-HIST.                                                  
           EXEC SQL                                                             
             UPDATE VASTHSTY                                                    
                SET RCL_SENT_NSCC_IND = :WS-RECLAIM-SENT-IND                    
                   ,CICS_TERM_ID_CD = :ACAT12-PASS-TERMID                       
                   ,UPDT_TMSTP = :WS-TIMESTAMP                                  
              WHERE CLIENT_NBR = :ACAT12-PASS-CLT        AND                    
                    ACAT_CONTROL_NBR = :ACAT12-PASS-ACAT AND                    
                    ASSET_SEQ_NBR = :ACAT12-PASS-SEQ-NBR                        
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT12-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              PERFORM 9000-ROLLBACK                                             
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *      IS THERE ANY REJECTED RECLAIMS?                         *          
      *--------------------------------------------------------------*          
       1400-COUNT-REJECTED-RECLAIM.                                             
           MOVE +0 TO WS-ROW-COUNT.                                             
           EXEC SQL                                                             
               SELECT                                                           
                    COUNT(*)                                                    
                 INTO                                                           
                    :WS-ROW-COUNT                                               
                 FROM                                                           
                    VTRNFR                                                      
                WHERE                                                           
                    CLIENT_NBR = :ACAT12-PASS-CLT                               
                    AND  RCV_NBR = :ACAT12-PASS-CON-BRKR                        
                    AND  ACCT_RCV_NBR = :ACAT12-PASS-CON-ACCT                   
                    AND  DLVR_NBR = :ACAT12-PASS-DLVR-NBR                       
                    AND  ACCT_DLVR_NBR = :ACAT12-PASS-ACCT-DLV                  
                    AND  TRNFR_TYPE_CD = 'RCL'                                  
                    AND  DSTBN_SIDE_CD = 'D'                                    
                    AND  STTS_CD = '600'                                        
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              IF WS-ROW-COUNT = 0                                               
                 SET ACAT12-NORMAL TO TRUE                                      
              END-IF                                                            
              IF WS-ROW-COUNT > 0                                               
                 SET ACAT12-FOUND TO TRUE                                       
              END-IF                                                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT12-NORMAL TO TRUE                                         
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  -  WHEN REJECTED RECLAIM WAS RESUBMITTED,                   *          
      *        MOVE 'Y' TO ACCT_RJCT_RSBM_IND.                       *          
      *  -  WHEN NEWLY CREATED RECLAIM WAS DELETED AND IF REJECTED   *          
      *     RECALIM EXIXTS,                                          *          
      *        MOVE SPACE TO ACCT_RJCT_RSBM_IND.                     *          
      *--------------------------------------------------------------*          
       1500-UPDATE-TRFR-RESUB-IND.                                              
           EXEC SQL                                                             
             UPDATE VTRNFR                                                      
                SET ACCT_RJCT_RSBM_IND = :ACAT12-PASS-RESUB-IND                 
                   ,CICS_TERM_ID_CD = :ACAT12-PASS-TERMID                       
                   ,UPDT_TMSTP = :WS-TIMESTAMP                                  
                   ,PRGM_NM = 'ACAT12DB'                                        
              WHERE                                                             
                   CLIENT_NBR = :ACAT12-PASS-CLT                                
                   AND  RCV_NBR = :ACAT12-PASS-CON-BRKR                         
                   AND  ACCT_RCV_NBR = :ACAT12-PASS-CON-ACCT                    
                   AND  DLVR_NBR = :ACAT12-PASS-DLVR-NBR                        
                   AND  ACCT_DLVR_NBR = :ACAT12-PASS-ACCT-DLV                   
                   AND  TRNFR_TYPE_CD = 'RCL'                                   
                   AND  DSTBN_SIDE_CD = 'D'                                     
                   AND  STTS_CD = '600'                                         
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT12-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              PERFORM 9000-ROLLBACK                                             
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *--------------------------------------------------------------*          
      *         DELETE RECLAIMED TRANSFER                            *          
      *--------------------------------------------------------------*          
       1600-DELETE-RECLAIM.                                                     
ET0003**<< NOT NECESSARY TO UPDATE INITIAL TRANSFER & ASSET TABLES >>           
ET0003**<< BEFORE THEY GET DELETED                                 >>           
ET0003**   MOVE 'H' TO WS-NSCC-PEND-CD.                                         
ET0003**   PERFORM 7000-UPDATE-TFR-NSCC-PEND.                                   
ET0003**   PERFORM 7100-UPDATE-ASSET-NSCC-PEND.                                 
                                                                                
           EXEC SQL DELETE                                                      
ET0002         FROM ACTITRF                                                     
              WHERE CLIENT_NBR = :ACAT12-PASS-CLT          AND                  
ET0003              ACAT_CONTROL_NBR  = :WS-ADP-CONTROL    AND                  
                    DLVR_NBR = :ACAT12-PASS-DLVR-NBR       AND                  
                    ACCT_DLVR_NBR = :ACAT12-PASS-ACCT-DLV  AND                  
                    RCV_NBR = :ACAT12-PASS-CON-BRKR        AND                  
                    ACCT_RCV_NBR = :ACAT12-PASS-CON-ACCT   AND                  
                    DSTBN_SIDE_CD = 'D'                    AND                  
                    TRNFR_TYPE_CD = 'RCL'                                       
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT12-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              PERFORM 9000-ROLLBACK                                             
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR                                            
              GO TO 1600-EXIT.                                                  
                                                                                
ET0002**<< WE DECIDED NOT TO UPDATE RCL-SENT-NSCC-IND FIELD OF ASSET >>         
ET0002**<< HISTORY TABLE.                                            >>         
ET0002**<< THE LOGIC IS COMMENTED OUT.                               >>         
ET0002**<< BESIDES THE FOLLOWING LOGIC IS INCORRECT.  ASSET-SEQ-NBR  >>         
ET0002**<< OF DCLACTIAST HAS A VALUE 0 WHEN IT IS CREATED.           >>         
ET0002**<< THEREFORE IT NEVER UPDATES A TABLE ROW.                   >>         
ET0002**                                                                        
ET0002**   PERFORM 0800-OPEN-ASSET-INIT.                                        
ET0002**   MOVE SPACE TO WS-EXIT-LOOP-SW.                                       
ET0002**   PERFORM UNTIL WS-EXIT-LOOP                                           
ET0002**      PERFORM 0900-FETCH-ASSET-INIT                                     
ET0002**      IF SQLCODE = 0                                                    
ET0002**         MOVE ASSET-SEQ-NBR OF DCLACTIAST                               
ET0002**           TO ACAT12-PASS-SEQ-NBR                                       
ET0002**         MOVE SPACE                                                     
ET0002**           TO WS-RECLAIM-SENT-IND                                       
ET0002**         PERFORM 1300-UPDATE-ASSET-HIST                                 
ET0002**      ELSE                                                              
ET0002**         SET WS-EXIT-LOOP TO TRUE                                       
ET0002**      END-IF                                                            
ET0002**   END-PERFORM.                                                         
ET0002**   PERFORM 1000-CLOSE-ASSET-INIT.                                       
                                                                                
           EXEC SQL DELETE                                                      
ET0002         FROM ACTIAST                                                     
              WHERE CLIENT_NBR = :ACAT12-PASS-CLT                               
ET0003              AND  ACAT_CONTROL_NBR = :ACAT12-PASS-ADP-CONTROL            
ET0003**            AND  TRANS_RFRN_ID_CD = :ACAT12-PASS-ACCT-DLV               
ET0003              AND  ACCT_DLVR_NBR    = :ACAT12-PASS-ACCT-DLV               
                    AND  TRNFR_TYPE_CD = 'RCL'                                  
                    AND  TRANS_TYPE_CD = 'A'                                    
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT12-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              PERFORM 9000-ROLLBACK                                             
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       1600-EXIT.                                       EXIT.                   
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *           CHECK IF ANY INITIAL TRANSFER ROWS EXIST           *          
      *--------------------------------------------------------------*          
       1700-COUNT-INIT-TRANSFER.                                                
           MOVE +0 TO WS-ROW-COUNT.                                             
           EXEC SQL                                                             
               SELECT                                                           
                    COUNT(*)                                                    
                 INTO                                                           
                    :WS-ROW-COUNT                                               
                 FROM                                                           
ET0002              ACTITRF                                                     
                WHERE                                                           
                    CLIENT_NBR = :ACAT12-PASS-CLT          AND                  
ET0003              ACAT_CONTROL_NBR = :WS-ADP-CONTROL     AND                  
                    ACCT_DLVR_NBR = :ACAT12-PASS-ACCT-DLV  AND                  
                    RCV_NBR = :ACAT12-PASS-CON-BRKR        AND                  
                    ACCT_RCV_NBR = :ACAT12-PASS-CON-ACCT   AND                  
                    DSTBN_SIDE_CD = 'D'                    AND                  
                    TRNFR_TYPE_CD = 'RCL'                                       
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              IF WS-ROW-COUNT = 0                                               
                 SET ACAT12-NORMAL TO TRUE                                      
              END-IF                                                            
              IF WS-ROW-COUNT > 0                                               
                 SET ACAT12-FOUND TO TRUE                                       
              END-IF                                                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT12-NORMAL TO TRUE                                         
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *    CHECK IF ANY 'RCL' ASSET EXISTS IN IINITIAL ASSET TABLE   *          
      *--------------------------------------------------------------*          
       1800-COUNT-INIT-ASSET.                                                   
           MOVE +0 TO WS-ROW-COUNT.                                             
           EXEC SQL                                                             
               SELECT                                                           
                    COUNT(*)                                                    
                 INTO                                                           
                    :WS-ROW-COUNT                                               
                 FROM                                                           
ET0002              ACTIAST                                                     
                WHERE                                                           
                    CLIENT_NBR = :ACAT12-PASS-CLT                               
ET0003**            AND  TRANS_RFRN_ID_CD = :ACAT12-PASS-ACCT-DLV               
ET0003              AND  ACCT_DLVR_NBR    = :ACAT12-PASS-ACCT-DLV               
ET0003              AND  ACAT_CONTROL_NBR = :ACAT12-PASS-ADP-CONTROL            
                    AND  TRNFR_TYPE_CD = 'RCL'                                  
                    AND  TRANS_TYPE_CD = 'A'                                    
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              IF WS-ROW-COUNT = 0                                               
                 SET ACAT12-NORMAL TO TRUE                                      
              END-IF                                                            
              IF WS-ROW-COUNT > 0                                               
                 SET ACAT12-FOUND TO TRUE                                       
              END-IF                                                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT12-NORMAL TO TRUE                                         
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *           CHECK IF ANY HISTORY TRANSFER EXISTS               *          
      *--------------------------------------------------------------*          
       1900-COUNT-HIST-TRANSFER.                                                
           MOVE +0 TO WS-ROW-COUNT.                                             
           EXEC SQL                                                             
               SELECT                                                           
                    COUNT(*)                                                    
                 INTO                                                           
                    :WS-ROW-COUNT                                               
                 FROM                                                           
                    VTRNHSTY                                                    
                WHERE                                                           
                    CLIENT_NBR = :ACAT12-PASS-CLT    AND                        
                    DLVR_NBR = :ACAT12-PASS-DLVR-NBR AND                        
ET0001**            TRNFR_TYPE_CD = 'FUL'            AND                        
ET0001              TRNFR_TYPE_CD IN ('FUL','PTR','PTD','RCR') AND              
                    DSTBN_SIDE_CD = 'D'              AND                        
                    STTS_CD = '310'                                             
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              IF WS-ROW-COUNT > 0                                               
                 SET ACAT12-NORMAL  TO TRUE                                     
              ELSE                                                              
                 SET ACAT12-FOUND TO TRUE                                       
              END-IF                                                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT12-NORMAL TO TRUE                                         
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          OPEN ACTIVE TRNFR CURSOR TABLE                      *          
      *--------------------------------------------------------------*          
       2000-OPEN-TRNFR.                                                         
           EXEC SQL                                                             
              OPEN TRNFRCSR                                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          FETCH ACTIVE TRNFR CURSOR TABLE                     *          
      *--------------------------------------------------------------*          
       2100-FETCH-TRNFR.                                                        
           EXEC SQL                                                             
              FETCH                                                             
                  TRNFRCSR                                                      
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
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
              PERFORM 2110-SETUP-TRNFR-COMMAREA                                 
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT12-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *       SETUP ASSET TABLE FIELDS OF COMMAREA                   *          
      *--------------------------------------------------------------*          
       2110-SETUP-TRNFR-COMMAREA.                                               
           INITIALIZE ACAT12-TRANSFER.                                          
           MOVE CLIENT-NBR             OF DCLVTRNFR                             
             TO ACAT12-TFR-CLT.                                                 
           MOVE ACAT-CONTROL-NBR       OF DCLVTRNFR                             
             TO ACAT12-TFR-ACAT.                                                
           MOVE STTS-CD                OF DCLVTRNFR                             
             TO ACAT12-TFR-STTS.                                                
           MOVE RCV-ACCT-TYPE-CD       OF DCLVTRNFR                             
             TO ACAT12-TFR-ACCT-TYPE.                                           
           MOVE RCV-NBR                OF DCLVTRNFR                             
             TO ACAT12-TFR-RCV.                                                 
           MOVE ACCT-RCV-NBR           OF DCLVTRNFR                             
             TO ACAT12-TFR-RCV-ACCT.                                            
           MOVE DLVR-NBR               OF DCLVTRNFR                             
             TO ACAT12-TFR-DLVR.                                                
           MOVE ACCT-DLVR-NBR          OF DCLVTRNFR                             
             TO ACAT12-TFR-DLVR-ACCT.                                           
           MOVE STTLM-DT               OF DCLVTRNFR                             
             TO ACAT12-TFR-STTL-DT.                                             
           MOVE ACAT-CNTL-ASTD-NBR     OF DCLVTRNFR                             
             TO ACAT12-TFR-ACAT-ASTD.                                           
           MOVE RCV-CUST-NM            OF DCLVTRNFR                             
             TO ACAT12-TFR-NAME.                                                
           MOVE RCV-SS-PRIM-NBR        OF DCLVTRNFR                             
             TO ACAT12-TFR-SS1.                                                 
           MOVE RCV-SS-SCNDY-NBR       OF DCLVTRNFR                             
             TO ACAT12-TFR-SS2.                                                 
           MOVE RR-CD                  OF DCLVTRNFR                             
             TO ACAT12-TFR-RR.                                                  
           MOVE TRNFR-TYPE-CD          OF DCLVTRNFR                             
             TO ACAT12-TFR-TYPE.                                                
           MOVE TRANS-RFRN-ID-CD       OF DCLVTRNFR                             
             TO ACAT12-TFR-RFRN-ID.                                             
           MOVE CMNT-TXT               OF DCLVTRNFR                             
             TO ACAT12-TFR-CMNTS.                                               
           MOVE TRANS-TYPE-CD          OF DCLVTRNFR                             
             TO ACAT12-TFR-TRANS-TYPE.                                          
      *                                                                         
      *--------------------------------------------------------------*          
      *          CLOSE ACTIVE TRNFR CURSOR TABLE                     *          
      *--------------------------------------------------------------*          
       2200-CLOSE-TRNFR.                                                        
           EXEC SQL                                                             
              CLOSE TRNFRCSR                                                    
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          OPEN ACTIVE ASSET CURSOR TABLE                      *          
      *--------------------------------------------------------------*          
       2300-OPEN-ASSET.                                                         
           EXEC SQL                                                             
              OPEN ASSETCSR                                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          FETCH ACTIVE ASSET CURSOR TABLE                     *          
      *--------------------------------------------------------------*          
       2400-FETCH-ASSET.                                                        
           EXEC SQL                                                             
              FETCH                                                             
                  ASSETCSR                                                      
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
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
              PERFORM 2410-SETUP-ASSET-COMMAREA                                 
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT12-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *       SETUP ASSET TABLE FIELDS OF COMMAREA                   *          
      *--------------------------------------------------------------*          
       2410-SETUP-ASSET-COMMAREA.                                               
           INITIALIZE ACAT12-ASSET.                                             
           MOVE CLIENT-NBR        OF DCLVASSET                                  
             TO ACAT12-AST-ACAT.                                                
           MOVE ASSET-PRC-CTGY-CD OF DCLVASSET                                  
             TO ACAT12-AST-CTGRY.                                               
           MOVE STTLM-LCTN-CD     OF DCLVASSET                                  
             TO ACAT12-AST-STTL-LOC.                                            
           MOVE CSH-MGN-SHRT-CD   OF DCLVASSET                                  
             TO ACAT12-AST-CS-MG-SH.                                            
           MOVE ACAT-CONTROL-NBR  OF DCLVASSET                                  
             TO ACAT12-AST-ACAT.                                                
           MOVE PSTN-CD           OF DCLVASSET                                  
             TO ACAT12-AST-PSTN-CD.                                             
           MOVE ISIN-SEC-ISSUE-CD OF DCLVASSET                                  
             TO ACAT12-AST-SEC.                                                 
           MOVE ASSET-QTY         OF DCLVASSET                                  
             TO ACAT12-AST-QTY.                                                 
           MOVE ASSET-AMT         OF DCLVASSET                                  
             TO ACAT12-AST-AMT.                                                 
           MOVE ASSET-DESC-TXT    OF DCLVASSET                                  
             TO ACAT12-AST-DESC.                                                
           MOVE ASSET-CMNT-TXT    OF DCLVASSET                                  
             TO ACAT12-AST-CMNTS.                                               
           MOVE TRANS-RFRN-ID-CD  OF DCLVASSET                                  
             TO ACAT12-AST-RFRN-ID.                                             
           MOVE TRNFR-TYPE-RSN-CD OF DCLVASSET                                  
             TO ACAT12-AST-REASON.                                              
           MOVE TRANS-TYPE-CD     OF DCLVASSET                                  
             TO ACAT12-AST-TRANS-TYP.                                           
           MOVE RCL-SENT-NSCC-IND OF DCLVASSET                                  
             TO ACAT12-AST-RCL-SENT.                                            
           MOVE FRV-SENT-NSCC-IND OF DCLVASSET                                  
             TO ACAT12-AST-FRV-SENT.                                            
           MOVE ASSET-SEQ-NBR     OF DCLVASSET                                  
             TO ACAT12-AST-SEQ-NBR.                                             
           MOVE STTLM-RSN-CD      OF DCLVASSET                                  
             TO ACAT12-AST-STTLM-RSN.                                           
      *                                                                         
      *--------------------------------------------------------------*          
      *          CLOSE ACTIVE ASSET CURSOR TABLE                     *          
      *--------------------------------------------------------------*          
       2500-CLOSE-ASSET.                                                        
           EXEC SQL                                                             
              CLOSE ASSETCSR                                                    
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          READ ACTIVE TRANSFER TABLE                          *          
      *--------------------------------------------------------------*          
       2600-GET-TRNFR.                                                          
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
                 FROM                                                           
                    VTRNFR                                                      
                WHERE                                                           
                    CLIENT_NBR = :ACAT12-PASS-CLT                               
                    AND  ACAT_CONTROL_NBR = :ACAT12-PASS-ACAT                   
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
              PERFORM 2110-SETUP-TRNFR-COMMAREA                                 
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT12-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *     IS THER ANY DUPLICATE ASSETS IN INITIAL ASSET TABLE      *          
      *--------------------------------------------------------------*          
ET0001*    2700-FIND-INIT-ASSET LOGIC IS                             *          
ET0001*             CHANGED TO 2820-FIND-INIT-ASSET2                 *          
ET0001*--------------------------------------------------------------*          
       2700-FIND-INIT-ASSET.                                                    
           MOVE +0 TO WS-ROW-COUNT.                                             
           EXEC SQL                                                             
               SELECT                                                           
                    COUNT(*)                                                    
                 INTO                                                           
                    :WS-ROW-COUNT                                               
                 FROM                                                           
ET0002              ACTIAST                                                     
                WHERE                                                           
                    CLIENT_NBR = :ACAT12-PASS-CLT                               
                    AND  DLVR_NBR = :ACAT12-PASS-DLVR-NBR                       
                    AND  ACCT_DLVR_NBR = :ACAT12-PASS-ACCT-DLV                  
                    AND  RCV_NBR = :ACAT12-PASS-CON-BRKR                        
                    AND  ACCT_RCV_NBR = :ACAT12-PASS-CON-ACCT                   
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              IF WS-ROW-COUNT = 0                                               
                 SET ACAT12-NORMAL TO TRUE                                      
              END-IF                                                            
              IF WS-ROW-COUNT > 0                                               
                 SET ACAT12-FOUND TO TRUE                                       
              END-IF                                                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT12-NORMAL TO TRUE                                         
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
ET0001 2810-OPEN-INIT-ASSET2.                                                   
ET0001*--------------------------------------------------------------*          
ET0001*     OPEN INITIAL ASSET CURSOR STATEMENT #2                   *          
ET0001*--------------------------------------------------------------*          
           EXEC SQL                                                             
              OPEN ASTINICS2                                                    
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
                                                                                
ET0001*                                                                         
ET0001*--------------------------------------------------------------*          
ET0001*     IS THER ANY DUPLICATE ASSETS IN INITIAL ASSET TABLE      *          
ET0001*     FETCH INITIAL ASSET CURSOR STATMENT #2                   *          
ET0001*--------------------------------------------------------------*          
ET0001 2820-FIND-INIT-ASSET2.                                                   
      **<< FETCH >>                                                             
           EXEC SQL                                                             
              FETCH                                                             
                  ASTINICS2                                                     
              INTO                                                              
ET0002           :DCLACTIAST.CLIENT-NBR                                         
ET0002          ,:DCLACTIAST.DLVR-NBR                                           
ET0002          ,:DCLACTIAST.ACCT-DLVR-NBR                                      
ET0002          ,:DCLACTIAST.RCV-NBR                                            
ET0002          ,:DCLACTIAST.ACCT-RCV-NBR                                       
ET0002          ,:DCLACTIAST.TRNFR-TYPE-CD                                      
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = 0                                                       
              SET ACAT12-FOUND   TO TRUE                                        
ET0002        MOVE TRNFR-TYPE-CD OF DCLACTIAST                                  
                TO ACAT12-AST-TRNFR-TYP                                         
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT12-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
                                                                                
ET0001 2830-CLOSE-INIT-ASSET2.                                                  
ET0001*--------------------------------------------------------------*          
ET0001*    CLOSE INITIAL ASSET CURSOR STATEMENT #2                   *          
ET0001*--------------------------------------------------------------*          
           EXEC SQL                                                             
              CLOSE ASTINICS2                                                   
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
ET0001*                                                                         
ET0001*--------------------------------------------------------------*          
ET0001*        OPEN TRANSFER HISTORY CURSOR TBL                      *          
ET0001*--------------------------------------------------------------*          
ET0001 3000-OPEN-TRNFR-HIST.                                                    
           EXEC SQL                                                             
              OPEN TRNHSTCS                                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
ET0001*                                                                         
ET0001*--------------------------------------------------------------*          
ET0001*       FETCH TRANSFER HISTORY CURSOR TBL                      *          
ET0001*--------------------------------------------------------------*          
ET0001 3100-FETCH-TRNFR-HIST.                                                   
           EXEC SQL                                                             
              FETCH                                                             
                  TRNHSTCS                                                      
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
              SET ACAT12-NORMAL  TO TRUE                                        
              PERFORM 0110-SETUP-TFR-ACAT12-COMMAREA                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT12-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
ET0001*                                                                         
ET0001*--------------------------------------------------------------*          
ET0001*       CLOSE TRANSFER HISTORY CURSOR TBL                      *          
ET0001*--------------------------------------------------------------*          
ET0001 3200-CLOSE-TRNFR-HIST.                                                   
           EXEC SQL                                                             
              CLOSE TRNHSTCS                                                    
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
ET0001*                                                                         
ET0001*--------------------------------------------------------------*          
ET0001*     OPEN TRANSFER HISTORY CURSOR TBL IN DESCENDING ORDER     *          
ET0001*--------------------------------------------------------------*          
ET0001 3300-OPEN-TRNFR-HIST-DESC.                                               
           EXEC SQL                                                             
              OPEN TRNHST_DES                                                   
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
                                                                                
ET0001*                                                                         
ET0001*--------------------------------------------------------------*          
ET0001*    FETCH TRANSFER HISTORY CURSOR TBL IN DESCENDING ORDER     *          
ET0001*--------------------------------------------------------------*          
ET0001 3400-FETCH-TRNFR-HIST-DESC.                                              
           EXEC SQL                                                             
              FETCH                                                             
                  TRNHST_DES                                                    
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
              SET ACAT12-NORMAL  TO TRUE                                        
              PERFORM 0110-SETUP-TFR-ACAT12-COMMAREA                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT12-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
                                                                                
ET0001*                                                                         
ET0001*--------------------------------------------------------------*          
ET0001*    CLOSE TRANSFER HISTORY CURSOR TBL IN DESCENDING ORDER     *          
ET0001*--------------------------------------------------------------*          
ET0001 3500-CLOSE-TRNFR-HIST-DESC.                                              
           EXEC SQL                                                             
              CLOSE TRNHST_DES                                                  
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
ET0001*                                                                         
ET0001*--------------------------------------------------------------*          
ET0001*  CREATE INIT ASSET TABLE WHEN ACCOUNT HAS NO MONEY AMOUNT.   *          
ET0001*  - CASH AMOUNT CAN BE RECLAIMED EVEN IF ACCT HAS NO CASH.    *          
ET0001*--------------------------------------------------------------*          
ET0001 3600-INSERT-INIASSET-CASH.                                               
ET0002     INITIALIZE DCLACTIAST.                                               
           EXEC SQL                                                             
ET0002        INSERT INTO ACTIAST                                               
                  ( CLIENT_NBR                                                  
                   ,DLVR_NBR                                                    
                   ,ACCT_DLVR_NBR                                               
                   ,RCV_NBR                                                     
                   ,ACCT_RCV_NBR                                                
                   ,ISIN_CNTRY_CD                                               
                   ,ISIN_SEC_ISSUE_CD                                           
                   ,ISIN_SEC_CDG_CD                                             
                   ,STTLM_LCTN_CD                                               
                   ,CSH_MGN_SHRT_CD                                             
                   ,CSH_MRG_SHT_STS_CD                                          
                   ,STTLM_LCTN_STTS_CD                                          
                   ,ISIN_CNTRY_STTS_CD                                          
                   ,SBMTG_PRTCP_NBR                                             
                   ,SBMT_PRT_NR_STS_CD                                          
                   ,ACAT_CONTROL_NBR                                            
                   ,CONTROL_NBR_STS_CD                                          
                   ,ASSET_SEQ_NBR                                               
                   ,AST_SEQ_NBR_STS_CD                                          
                   ,TRANS_TYPE_CD                                               
                   ,TRANS_TYPE_STTS_CD                                          
                   ,PHSCL_SEQ_NBR                                               
                   ,PHSCL_SEQ_STTS_CD                                           
                   ,LGCL_SEQ_NBR                                                
                   ,LGCL_SEQ_NR_STS_CD                                          
                   ,ASSET_PRC_CTGY_CD                                           
                   ,AST_PRC_CTG_STS_CD                                          
                   ,STTLM_RSN_CD                                                
                   ,STTLM_RSN_STTS_CD                                           
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
                   ,WHI_CD                                                      
                   ,WHI_STTS_CD                                                 
                   ,TRNFR_TYPE_RSN_CD                                           
                   ,TRN_TYP_RSN_STS_CD                                          
                   ,MBS_SERIAL_NBR                                              
                   ,MBS_SERIAL_STTS_CD                                          
                   ,ASSET_CMNT_TXT                                              
                   ,ASSET_CMNT_STTS_CD                                          
                   ,NSCC_WTHLD_CD                                               
                   ,TRANS_RFRN_ID_CD                                            
                   ,TRANS_RFRN_STTS_CD                                          
                   ,ISIN_SEC_IS_STS_CD                                          
                   ,ISIN_SEC_CD_STS_CD                                          
                   ,OPTN_CTGY_CD                                                
                   ,OPTN_CTGY_STTS_CD                                           
                   ,RCRD_LNGTH_STTS_CD                                          
                   ,RCRD_STTS_CD                                                
                   ,NSCC_PEND_CD                                                
                   ,NSCC_ACK_IND                                                
                   ,PRGM_NM                                                     
                   ,CICS_TERM_ID_CD                                             
                   ,UPDT_TMSTP                                                  
                   ,CRT_TMSTP                                                   
                   ,SECURITY_ADP_NBR                                            
                   ,TRNFR_TYPE_CD                                               
                   ,TRNFR_TYPE_STTS_CD                                          
                   ,RCV_NBR_STTS_CD                                             
                   ,DLVR_NBR_STTS_CD )                                          
              VALUES                                                            
                  (:ACAT12-PASS-CLT                                             
                  ,:ACAT12-PASS-DLVR-NBR                                        
                  ,:ACAT12-PASS-ACCT-DLV                                        
                  ,:ACAT12-PASS-CON-BRKR                                        
                  ,:ACAT12-PASS-CON-ACCT                                        
ET0002            ,:DCLACTIAST.ISIN-CNTRY-CD                                    
ET0002            ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                                
ET0002            ,:DCLACTIAST.ISIN-SEC-CDG-CD                                  
                  ,'40'                                                         
                  ,:ACAT12-PASS-CSH-MGN-SHT                                     
ET0002            ,:DCLACTIAST.CSH-MRG-SHT-STS-CD                               
ET0002            ,:DCLACTIAST.STTLM-LCTN-STTS-CD                               
ET0002            ,:DCLACTIAST.ISIN-CNTRY-STTS-CD                               
                  ,:WS-SBMT-CLT                                                 
ET0002            ,:DCLACTIAST.SBMT-PRT-NR-STS-CD                               
ET0003            ,:WS-ADP-CONTROL                                              
ET0002            ,:DCLACTIAST.CONTROL-NBR-STS-CD                               
ET0002            ,:DCLACTIAST.ASSET-SEQ-NBR                                    
ET0002            ,:DCLACTIAST.AST-SEQ-NBR-STS-CD                               
                  ,'A'                                                          
ET0002            ,:DCLACTIAST.TRANS-TYPE-STTS-CD                               
                  ,+1                                                           
ET0002            ,:DCLACTIAST.PHSCL-SEQ-STTS-CD                                
                  ,+1                                                           
ET0002            ,:DCLACTIAST.LGCL-SEQ-NR-STS-CD                               
ET0002            ,:DCLACTIAST.ASSET-PRC-CTGY-CD                                
ET0002            ,:DCLACTIAST.AST-PRC-CTG-STS-CD                               
                  ,:ACAT12-PASS-STTLM-RSN-CD                                    
ET0002            ,:DCLACTIAST.STTLM-RSN-STTS-CD                                
                  ,:ACAT12-PASS-ASSET-DESC                                      
ET0002            ,:DCLACTIAST.ASSET-DESC-STTS-CD                               
ET0002            ,:DCLACTIAST.ASSET-RQST-QTY-CD                                
ET0002            ,:DCLACTIAST.ASSET-RQST-STS-CD                                
ET0002            ,:DCLACTIAST.AST-RQST-TRANS-CD                                
ET0002            ,:DCLACTIAST.AST-RQ-TRAN-STS-CD                               
                  ,:ACAT12-PASS-QTY                                             
ET0002            ,:DCLACTIAST.ASSET-QTY-STTS-CD                                
ET0002            ,:DCLACTIAST.ASSET-PCT                                        
ET0002            ,:DCLACTIAST.ASSET-PCT-STTS-CD                                
ET0002            ,:DCLACTIAST.PSTN-CD                                          
ET0002            ,:DCLACTIAST.PSTN-CD-STTS-CD                                  
                  ,'USD'                                                        
ET0002            ,:DCLACTIAST.ISO-CRNCY-STTS-CD                                
                  ,:ACAT12-PASS-AMT                                             
ET0002            ,:DCLACTIAST.ASSET-AMT-STTS-CD                                
ET0002            ,:DCLACTIAST.BEARER-BOND-CD                                   
ET0002            ,:DCLACTIAST.BEARER-BND-STTS-CD                               
ET0002            ,:DCLACTIAST.WHI-CD                                           
ET0002            ,:DCLACTIAST.WHI-STTS-CD                                      
                  ,:ACAT12-PASS-REASON                                          
ET0002            ,:DCLACTIAST.TRN-TYP-RSN-STS-CD                               
ET0002            ,:DCLACTIAST.MBS-SERIAL-NBR                                   
ET0002            ,:DCLACTIAST.MBS-SERIAL-STTS-CD                               
                  ,:ACAT12-PASS-CMNTS                                           
ET0002            ,:DCLACTIAST.ASSET-CMNT-STTS-CD                               
ET0002            ,:DCLACTIAST.NSCC-WTHLD-CD                                    
ET0003            ,:WS-TRANS-RFRN-ID                                            
ET0002            ,:DCLACTIAST.TRANS-RFRN-STTS-CD                               
ET0002            ,:DCLACTIAST.ISIN-SEC-IS-STS-CD                               
ET0002            ,:DCLACTIAST.ISIN-SEC-CD-STS-CD                               
                  ,'00'                                                         
ET0002            ,:DCLACTIAST.OPTN-CTGY-STTS-CD                                
ET0002            ,:DCLACTIAST.RCRD-LNGTH-STTS-CD                               
ET0002            ,:DCLACTIAST.RCRD-STTS-CD                                     
ET0002            ,:DCLACTIAST.NSCC-PEND-CD                                     
LRM010            ,' '                                                          
                  ,'ACAT12DB'                                                   
                  ,:ACAT12-PASS-TERMID                                          
                  ,:WS-TIMESTAMP                                                
                  ,:WS-TIMESTAMP                                                
ET0002            ,:DCLACTIAST.SECURITY-ADP-NBR                                 
                  ,'RCL'                                                        
ET0002            ,:DCLACTIAST.TRNFR-TYPE-STTS-CD                               
ET0002            ,:DCLACTIAST.RCV-NBR-STTS-CD                                  
ET0002            ,:DCLACTIAST.DLVR-NBR-STTS-CD )                               
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
              MOVE 'Y' TO WS-RECLAIM-SENT-IND                                   
           ELSE                                                                 
              PERFORM 9000-ROLLBACK                                             
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
ET0003*                                                                         
ET0003*--------------------------------------------------------------*          
ET0003*            OPEN INITIAL TRANSFER CURSOR TBL                  *          
ET0003*--------------------------------------------------------------*          
ET0003 3700-OPEN-TRNFR-INIT.                                                    
           EXEC SQL                                                             
              OPEN TRFINICS                                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
ET0003*                                                                         
ET0003*--------------------------------------------------------------*          
ET0003*            FETCH INITIAL TRANSFER CURSOR TBL                 *          
ET0003*--------------------------------------------------------------*          
ET0003 3800-FETCH-TRNFR-INIT.                                                   
           EXEC SQL                                                             
              FETCH                                                             
                  TRFINICS                                                      
              INTO                                                              
                  :DCLACTITRF.CLIENT-NBR                                        
                 ,:DCLACTITRF.RCV-NBR                                           
                 ,:DCLACTITRF.DLVR-NBR                                          
                 ,:DCLACTITRF.ACCT-DLVR-NBR                                     
                 ,:DCLACTITRF.ACCT-RCV-NBR                                      
                 ,:DCLACTITRF.ACAT-CONTROL-NBR                                  
                 ,:DCLACTITRF.TRNFR-TYPE-CD                                     
                 ,:DCLACTITRF.PHSCL-SEQ-NBR                                     
                 ,:DCLACTITRF.SBMTG-PRTCP-NBR                                   
                 ,:DCLACTITRF.PHSCL-SEQ-STTS-CD                                 
                 ,:DCLACTITRF.LGCL-SEQ-NBR                                      
                 ,:DCLACTITRF.TRANS-TYPE-CD                                     
                 ,:DCLACTITRF.LGCL-SEQ-NR-STS-CD                                
                 ,:DCLACTITRF.RCV-CUST-NM                                       
                 ,:DCLACTITRF.TRANS-TYPE-STTS-CD                                
                 ,:DCLACTITRF.CONTROL-NBR-STS-CD                                
                 ,:DCLACTITRF.RCV-SS-PRIM-NBR                                   
                 ,:DCLACTITRF.TRNFR-TYPE-STTS-CD                                
                 ,:DCLACTITRF.RCV-SS-SCNDY-NBR                                  
                 ,:DCLACTITRF.SBMT-PRT-NR-STS-CD                                
                 ,:DCLACTITRF.RCV-ACCT-TYPE-CD                                  
                 ,:DCLACTITRF.RCV-NBR-STTS-CD                                   
                 ,:DCLACTITRF.NSCC-PEND-CD                                      
                 ,:DCLACTITRF.RCV-OCC-BRKR-NBR                                  
                 ,:DCLACTITRF.DLVR-NBR-STTS-CD                                  
                 ,:DCLACTITRF.RCV-CRSPN-NBR                                     
                 ,:DCLACTITRF.ACCT-RCV-STTS-CD                                  
                 ,:DCLACTITRF.ACAT-CNTL-ASTD-NBR                                
                 ,:DCLACTITRF.ACCT-DLVR-STTS-CD                                 
                 ,:DCLACTITRF.CMNT-TXT                                          
                 ,:DCLACTITRF.RCV-CUST-NM-STS-CD                                
                 ,:DCLACTITRF.PRCS-DT                                           
                 ,:DCLACTITRF.RCV-OCC-STTS-CD                                   
                 ,:DCLACTITRF.RCV-SS-PRIM-STS-CD                                
                 ,:DCLACTITRF.STTS-CD                                           
                 ,:DCLACTITRF.RCV-CRSPN-STTS-CD                                 
                 ,:DCLACTITRF.DSTBN-SIDE-CD                                     
                 ,:DCLACTITRF.TRNFR-TYPE-RJCT-CD                                
                 ,:DCLACTITRF.SYS-ACT-CD                                        
                 ,:DCLACTITRF.RCV-SS-SCDY-STS-CD                                
                 ,:DCLACTITRF.SYS-RJCT-RSN-CD                                   
                 ,:DCLACTITRF.RCV-ACT-TYP-STS-CD                                
                 ,:DCLACTITRF.TRNFR-TYPE-RJC2-CD                                
                 ,:DCLACTITRF.CNTL-ASTD-STTS-CD                                 
                 ,:DCLACTITRF.TRN-TYP-RJC-STS-CD                                
                 ,:DCLACTITRF.TRNFR-TYPE-RJC1-CD                                
                 ,:DCLACTITRF.STTLM-ASCTD-STS-CD                                
                 ,:DCLACTITRF.NSCC-ACK-IND                                      
                 ,:DCLACTITRF.PRTCP-CONTRA-CD                                   
                 ,:DCLACTITRF.TRANS-RFRN-STTS-CD                                
                 ,:DCLACTITRF.CMNT-STTS-CD                                      
                 ,:DCLACTITRF.CICS-TERM-ID-CD                                   
                 ,:DCLACTITRF.CYCLE-CD                                          
                 ,:DCLACTITRF.PRGM-NM                                           
                 ,:DCLACTITRF.DAYS-STTS-QTY                                     
                 ,:DCLACTITRF.RCRD-LNGTH-STTS-CD                                
                 ,:DCLACTITRF.CRT-TMSTP                                         
                 ,:DCLACTITRF.RCRD-STTS-CD                                      
                 ,:DCLACTITRF.UPDT-TMSTP                                        
                 ,:DCLACTITRF.DB-CR-CD                                          
                 ,:DCLACTITRF.STTLM-ASCTD-DT                                    
                 ,:DCLACTITRF.TRANS-RFRN-ID-CD                                  
                 ,:DCLACTITRF.RR-CD                                             
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
              PERFORM 0210-SETUP-INIT-TFR-COMMAREA                              
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT12-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
ET0003*                                                                         
ET0003*--------------------------------------------------------------*          
ET0003*             CLOSE INITIAL TRANSFER CURSOR TBL                *          
ET0003*--------------------------------------------------------------*          
ET0003 3900-CLOSE-TRNFR-INIT.                                                   
           EXEC SQL                                                             
              CLOSE TRFINICS                                                    
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
ET0003*                                                                         
ET0003*--------------------------------------------------------------*          
ET0003*    OPEN INITIAL TRANSFER CURSOR TBL IN DESCENDING ORDER      *          
ET0003*--------------------------------------------------------------*          
ET0003 4000-OPEN-TRNFR-INIT-DESC.                                               
           EXEC SQL                                                             
              OPEN TRFINICS_DES                                                 
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
ET0003*                                                                         
ET0003*--------------------------------------------------------------*          
ET0003*   FETCH INITIAL TRANSFER CURSOR TBL IN DESCENDING ORDER      *          
ET0003*--------------------------------------------------------------*          
ET0003 4100-FETCH-TRNFR-INIT-DESC.                                              
           EXEC SQL                                                             
              FETCH                                                             
                  TRFINICS_DES                                                  
              INTO                                                              
                  :DCLACTITRF.CLIENT-NBR                                        
                 ,:DCLACTITRF.RCV-NBR                                           
                 ,:DCLACTITRF.DLVR-NBR                                          
                 ,:DCLACTITRF.ACCT-DLVR-NBR                                     
                 ,:DCLACTITRF.ACCT-RCV-NBR                                      
                 ,:DCLACTITRF.ACAT-CONTROL-NBR                                  
                 ,:DCLACTITRF.TRNFR-TYPE-CD                                     
                 ,:DCLACTITRF.PHSCL-SEQ-NBR                                     
                 ,:DCLACTITRF.SBMTG-PRTCP-NBR                                   
                 ,:DCLACTITRF.PHSCL-SEQ-STTS-CD                                 
                 ,:DCLACTITRF.LGCL-SEQ-NBR                                      
                 ,:DCLACTITRF.TRANS-TYPE-CD                                     
                 ,:DCLACTITRF.LGCL-SEQ-NR-STS-CD                                
                 ,:DCLACTITRF.RCV-CUST-NM                                       
                 ,:DCLACTITRF.TRANS-TYPE-STTS-CD                                
                 ,:DCLACTITRF.CONTROL-NBR-STS-CD                                
                 ,:DCLACTITRF.RCV-SS-PRIM-NBR                                   
                 ,:DCLACTITRF.TRNFR-TYPE-STTS-CD                                
                 ,:DCLACTITRF.RCV-SS-SCNDY-NBR                                  
                 ,:DCLACTITRF.SBMT-PRT-NR-STS-CD                                
                 ,:DCLACTITRF.RCV-ACCT-TYPE-CD                                  
                 ,:DCLACTITRF.RCV-NBR-STTS-CD                                   
                 ,:DCLACTITRF.NSCC-PEND-CD                                      
                 ,:DCLACTITRF.RCV-OCC-BRKR-NBR                                  
                 ,:DCLACTITRF.DLVR-NBR-STTS-CD                                  
                 ,:DCLACTITRF.RCV-CRSPN-NBR                                     
                 ,:DCLACTITRF.ACCT-RCV-STTS-CD                                  
                 ,:DCLACTITRF.ACAT-CNTL-ASTD-NBR                                
                 ,:DCLACTITRF.ACCT-DLVR-STTS-CD                                 
                 ,:DCLACTITRF.CMNT-TXT                                          
                 ,:DCLACTITRF.RCV-CUST-NM-STS-CD                                
                 ,:DCLACTITRF.PRCS-DT                                           
                 ,:DCLACTITRF.RCV-OCC-STTS-CD                                   
                 ,:DCLACTITRF.RCV-SS-PRIM-STS-CD                                
                 ,:DCLACTITRF.STTS-CD                                           
                 ,:DCLACTITRF.RCV-CRSPN-STTS-CD                                 
                 ,:DCLACTITRF.DSTBN-SIDE-CD                                     
                 ,:DCLACTITRF.TRNFR-TYPE-RJCT-CD                                
                 ,:DCLACTITRF.SYS-ACT-CD                                        
                 ,:DCLACTITRF.RCV-SS-SCDY-STS-CD                                
                 ,:DCLACTITRF.SYS-RJCT-RSN-CD                                   
                 ,:DCLACTITRF.RCV-ACT-TYP-STS-CD                                
                 ,:DCLACTITRF.TRNFR-TYPE-RJC2-CD                                
                 ,:DCLACTITRF.CNTL-ASTD-STTS-CD                                 
                 ,:DCLACTITRF.TRN-TYP-RJC-STS-CD                                
                 ,:DCLACTITRF.TRNFR-TYPE-RJC1-CD                                
                 ,:DCLACTITRF.STTLM-ASCTD-STS-CD                                
                 ,:DCLACTITRF.NSCC-ACK-IND                                      
                 ,:DCLACTITRF.PRTCP-CONTRA-CD                                   
                 ,:DCLACTITRF.TRANS-RFRN-STTS-CD                                
                 ,:DCLACTITRF.CMNT-STTS-CD                                      
                 ,:DCLACTITRF.CICS-TERM-ID-CD                                   
                 ,:DCLACTITRF.CYCLE-CD                                          
                 ,:DCLACTITRF.PRGM-NM                                           
                 ,:DCLACTITRF.DAYS-STTS-QTY                                     
                 ,:DCLACTITRF.RCRD-LNGTH-STTS-CD                                
                 ,:DCLACTITRF.CRT-TMSTP                                         
                 ,:DCLACTITRF.RCRD-STTS-CD                                      
                 ,:DCLACTITRF.UPDT-TMSTP                                        
                 ,:DCLACTITRF.DB-CR-CD                                          
                 ,:DCLACTITRF.STTLM-ASCTD-DT                                    
                 ,:DCLACTITRF.TRANS-RFRN-ID-CD                                  
                 ,:DCLACTITRF.RR-CD                                             
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
              PERFORM 0210-SETUP-INIT-TFR-COMMAREA                              
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT12-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
ET0003*                                                                         
ET0003*--------------------------------------------------------------*          
ET0003*   CLOSE INITIAL TRANSFER CURSOR TBL IN DESCENDING ORDER      *          
ET0003*--------------------------------------------------------------*          
ET0003 4200-CLOSE-TRNFR-INIT-DESC.                                              
           EXEC SQL                                                             
              CLOSE TRFINICS_DES                                                
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
ET0007*                                                                         
ET0007*--------------------------------------------------------------*          
ET0007*   OPEN INITIAL TRANSFER CURSOR TBL FOR ALL RECLAIMS          *          
ET0007*--------------------------------------------------------------*          
ET0007 4300-OPEN-ALL-INITRN.                                                    
           EXEC SQL                                                             
              OPEN INITRN_CSR                                                   
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT12-ERROR     TO TRUE                                      
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR                                            
           END-IF.                                                              
       EJECT                                                                    
ET0007*                                                                         
ET0007*--------------------------------------------------------------*          
ET0007*  FETCH INITIAL TRANSFER CURSOR TBL FOR ALL RECLAIMS          *          
ET0007*--------------------------------------------------------------*          
ET0007 4400-FETCH-ALL-INITRN.                                                   
           EXEC SQL                                                             
              FETCH                                                             
                  INITRN_CSR                                                    
              INTO                                                              
                  :DCLACTITRF.CLIENT-NBR                                        
                 ,:DCLACTITRF.RCV-NBR                                           
                 ,:DCLACTITRF.DLVR-NBR                                          
                 ,:DCLACTITRF.ACCT-DLVR-NBR                                     
                 ,:DCLACTITRF.ACCT-RCV-NBR                                      
                 ,:DCLACTITRF.ACAT-CONTROL-NBR                                  
                 ,:DCLACTITRF.TRNFR-TYPE-CD                                     
                 ,:DCLACTITRF.PHSCL-SEQ-NBR                                     
                 ,:DCLACTITRF.SBMTG-PRTCP-NBR                                   
                 ,:DCLACTITRF.PHSCL-SEQ-STTS-CD                                 
                 ,:DCLACTITRF.LGCL-SEQ-NBR                                      
                 ,:DCLACTITRF.TRANS-TYPE-CD                                     
                 ,:DCLACTITRF.LGCL-SEQ-NR-STS-CD                                
                 ,:DCLACTITRF.RCV-CUST-NM                                       
                 ,:DCLACTITRF.TRANS-TYPE-STTS-CD                                
                 ,:DCLACTITRF.CONTROL-NBR-STS-CD                                
                 ,:DCLACTITRF.RCV-SS-PRIM-NBR                                   
                 ,:DCLACTITRF.TRNFR-TYPE-STTS-CD                                
                 ,:DCLACTITRF.RCV-SS-SCNDY-NBR                                  
                 ,:DCLACTITRF.SBMT-PRT-NR-STS-CD                                
                 ,:DCLACTITRF.RCV-ACCT-TYPE-CD                                  
                 ,:DCLACTITRF.RCV-NBR-STTS-CD                                   
                 ,:DCLACTITRF.NSCC-PEND-CD                                      
                 ,:DCLACTITRF.RCV-OCC-BRKR-NBR                                  
                 ,:DCLACTITRF.DLVR-NBR-STTS-CD                                  
                 ,:DCLACTITRF.RCV-CRSPN-NBR                                     
                 ,:DCLACTITRF.ACCT-RCV-STTS-CD                                  
                 ,:DCLACTITRF.ACAT-CNTL-ASTD-NBR                                
                 ,:DCLACTITRF.ACCT-DLVR-STTS-CD                                 
                 ,:DCLACTITRF.CMNT-TXT                                          
                 ,:DCLACTITRF.RCV-CUST-NM-STS-CD                                
                 ,:DCLACTITRF.PRCS-DT                                           
                 ,:DCLACTITRF.RCV-OCC-STTS-CD                                   
                 ,:DCLACTITRF.RCV-SS-PRIM-STS-CD                                
                 ,:DCLACTITRF.STTS-CD                                           
                 ,:DCLACTITRF.RCV-CRSPN-STTS-CD                                 
                 ,:DCLACTITRF.DSTBN-SIDE-CD                                     
                 ,:DCLACTITRF.TRNFR-TYPE-RJCT-CD                                
                 ,:DCLACTITRF.SYS-ACT-CD                                        
                 ,:DCLACTITRF.RCV-SS-SCDY-STS-CD                                
                 ,:DCLACTITRF.SYS-RJCT-RSN-CD                                   
                 ,:DCLACTITRF.RCV-ACT-TYP-STS-CD                                
                 ,:DCLACTITRF.TRNFR-TYPE-RJC2-CD                                
                 ,:DCLACTITRF.CNTL-ASTD-STTS-CD                                 
                 ,:DCLACTITRF.TRN-TYP-RJC-STS-CD                                
                 ,:DCLACTITRF.TRNFR-TYPE-RJC1-CD                                
                 ,:DCLACTITRF.STTLM-ASCTD-STS-CD                                
                 ,:DCLACTITRF.NSCC-ACK-IND                                      
                 ,:DCLACTITRF.PRTCP-CONTRA-CD                                   
                 ,:DCLACTITRF.TRANS-RFRN-STTS-CD                                
                 ,:DCLACTITRF.CMNT-STTS-CD                                      
                 ,:DCLACTITRF.CICS-TERM-ID-CD                                   
                 ,:DCLACTITRF.CYCLE-CD                                          
                 ,:DCLACTITRF.PRGM-NM                                           
                 ,:DCLACTITRF.DAYS-STTS-QTY                                     
                 ,:DCLACTITRF.RCRD-LNGTH-STTS-CD                                
                 ,:DCLACTITRF.CRT-TMSTP                                         
                 ,:DCLACTITRF.RCRD-STTS-CD                                      
                 ,:DCLACTITRF.UPDT-TMSTP                                        
                 ,:DCLACTITRF.DB-CR-CD                                          
                 ,:DCLACTITRF.STTLM-ASCTD-DT                                    
                 ,:DCLACTITRF.TRANS-RFRN-ID-CD                                  
                 ,:DCLACTITRF.RR-CD                                             
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
              PERFORM 0210-SETUP-INIT-TFR-COMMAREA                              
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT12-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
ET0007*                                                                         
ET0007*--------------------------------------------------------------*          
ET0007*  FETCH INITIAL TRANSFER CURSOR TBL FOR ALL RECLAIMS          *          
ET0007*--------------------------------------------------------------*          
ET0007 4500-CLOSE-ALL-INITRN.                                                   
           EXEC SQL                                                             
              CLOSE INITRN_CSR                                                  
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
ET0007*                                                                         
ET0007*--------------------------------------------------------------*          
ET0007*  OPEN INITIAL TRNFR CSR TBL FOR ALL RCLMS IN DESCENDING ORDR *          
ET0007*--------------------------------------------------------------*          
ET0007 4600-OPEN-ALL-INITRN-DESC.                                               
           EXEC SQL                                                             
              OPEN INITRN_CSR_DESC                                              
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT12-ERROR     TO TRUE                                      
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR                                            
           END-IF.                                                              
       EJECT                                                                    
ET0007*                                                                         
ET0007*--------------------------------------------------------------*          
ET0007* FETCH INITIAL TRNFR CSR TBL FOR ALL RCLMS IN DESCENDING ORDR *          
ET0007*--------------------------------------------------------------*          
ET0007 4700-FETCH-ALL-INITRN-DESC.                                              
           EXEC SQL                                                             
              FETCH                                                             
                  INITRN_CSR_DESC                                               
              INTO                                                              
                  :DCLACTITRF.CLIENT-NBR                                        
                 ,:DCLACTITRF.RCV-NBR                                           
                 ,:DCLACTITRF.DLVR-NBR                                          
                 ,:DCLACTITRF.ACCT-DLVR-NBR                                     
                 ,:DCLACTITRF.ACCT-RCV-NBR                                      
                 ,:DCLACTITRF.ACAT-CONTROL-NBR                                  
                 ,:DCLACTITRF.TRNFR-TYPE-CD                                     
                 ,:DCLACTITRF.PHSCL-SEQ-NBR                                     
                 ,:DCLACTITRF.SBMTG-PRTCP-NBR                                   
                 ,:DCLACTITRF.PHSCL-SEQ-STTS-CD                                 
                 ,:DCLACTITRF.LGCL-SEQ-NBR                                      
                 ,:DCLACTITRF.TRANS-TYPE-CD                                     
                 ,:DCLACTITRF.LGCL-SEQ-NR-STS-CD                                
                 ,:DCLACTITRF.RCV-CUST-NM                                       
                 ,:DCLACTITRF.TRANS-TYPE-STTS-CD                                
                 ,:DCLACTITRF.CONTROL-NBR-STS-CD                                
                 ,:DCLACTITRF.RCV-SS-PRIM-NBR                                   
                 ,:DCLACTITRF.TRNFR-TYPE-STTS-CD                                
                 ,:DCLACTITRF.RCV-SS-SCNDY-NBR                                  
                 ,:DCLACTITRF.SBMT-PRT-NR-STS-CD                                
                 ,:DCLACTITRF.RCV-ACCT-TYPE-CD                                  
                 ,:DCLACTITRF.RCV-NBR-STTS-CD                                   
                 ,:DCLACTITRF.NSCC-PEND-CD                                      
                 ,:DCLACTITRF.RCV-OCC-BRKR-NBR                                  
                 ,:DCLACTITRF.DLVR-NBR-STTS-CD                                  
                 ,:DCLACTITRF.RCV-CRSPN-NBR                                     
                 ,:DCLACTITRF.ACCT-RCV-STTS-CD                                  
                 ,:DCLACTITRF.ACAT-CNTL-ASTD-NBR                                
                 ,:DCLACTITRF.ACCT-DLVR-STTS-CD                                 
                 ,:DCLACTITRF.CMNT-TXT                                          
                 ,:DCLACTITRF.RCV-CUST-NM-STS-CD                                
                 ,:DCLACTITRF.PRCS-DT                                           
                 ,:DCLACTITRF.RCV-OCC-STTS-CD                                   
                 ,:DCLACTITRF.RCV-SS-PRIM-STS-CD                                
                 ,:DCLACTITRF.STTS-CD                                           
                 ,:DCLACTITRF.RCV-CRSPN-STTS-CD                                 
                 ,:DCLACTITRF.DSTBN-SIDE-CD                                     
                 ,:DCLACTITRF.TRNFR-TYPE-RJCT-CD                                
                 ,:DCLACTITRF.SYS-ACT-CD                                        
                 ,:DCLACTITRF.RCV-SS-SCDY-STS-CD                                
                 ,:DCLACTITRF.SYS-RJCT-RSN-CD                                   
                 ,:DCLACTITRF.RCV-ACT-TYP-STS-CD                                
                 ,:DCLACTITRF.TRNFR-TYPE-RJC2-CD                                
                 ,:DCLACTITRF.CNTL-ASTD-STTS-CD                                 
                 ,:DCLACTITRF.TRN-TYP-RJC-STS-CD                                
                 ,:DCLACTITRF.TRNFR-TYPE-RJC1-CD                                
                 ,:DCLACTITRF.STTLM-ASCTD-STS-CD                                
                 ,:DCLACTITRF.NSCC-ACK-IND                                      
                 ,:DCLACTITRF.PRTCP-CONTRA-CD                                   
                 ,:DCLACTITRF.TRANS-RFRN-STTS-CD                                
                 ,:DCLACTITRF.CMNT-STTS-CD                                      
                 ,:DCLACTITRF.CICS-TERM-ID-CD                                   
                 ,:DCLACTITRF.CYCLE-CD                                          
                 ,:DCLACTITRF.PRGM-NM                                           
                 ,:DCLACTITRF.DAYS-STTS-QTY                                     
                 ,:DCLACTITRF.RCRD-LNGTH-STTS-CD                                
                 ,:DCLACTITRF.CRT-TMSTP                                         
                 ,:DCLACTITRF.RCRD-STTS-CD                                      
                 ,:DCLACTITRF.UPDT-TMSTP                                        
                 ,:DCLACTITRF.DB-CR-CD                                          
                 ,:DCLACTITRF.STTLM-ASCTD-DT                                    
                 ,:DCLACTITRF.TRANS-RFRN-ID-CD                                  
                 ,:DCLACTITRF.RR-CD                                             
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
              PERFORM 0210-SETUP-INIT-TFR-COMMAREA                              
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT12-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
ET0007*                                                                         
ET0007*--------------------------------------------------------------*          
ET0007* CLOSE INITIAL TRNFR CSR TBL FOR ALL RCLMS IN DESCENDING ORDR *          
ET0007*--------------------------------------------------------------*          
ET0007 4800-CLOSE-ALL-INITRN-DESC.                                              
           EXEC SQL                                                             
              CLOSE INITRN_CSR_DESC                                             
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *     UPDATE INITIAL TRANSFE NSCC_PEND_IND                     *          
      *         SPACE = READY TO TRNASMIT                            *          
      *         'H'   = HOLD A TRANSMISSION                          *          
      *         'Y'   = ALREADY TRNASMITTED                          *          
      *--------------------------------------------------------------*          
       7000-UPDATE-TFR-NSCC-PEND.                                               
           EXEC SQL                                                             
ET0002       UPDATE ACTITRF                                                     
                SET NSCC_PEND_CD = :WS-NSCC-PEND-CD                             
              WHERE CLIENT_NBR = :ACAT12-PASS-CLT          AND                  
                    DLVR_NBR = :ACAT12-PASS-DLVR-NBR       AND                  
                    ACCT_DLVR_NBR = :ACAT12-PASS-ACCT-DLV  AND                  
                    RCV_NBR = :ACAT12-PASS-CON-BRKR        AND                  
                    ACCT_RCV_NBR = :ACAT12-PASS-CON-ACCT   AND                  
                    DSTBN_SIDE_CD = 'D'                    AND                  
                    TRNFR_TYPE_CD = 'RCL'                                       
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT12-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              PERFORM 9000-ROLLBACK                                             
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
      *                                                                         
      *--------------------------------------------------------------*          
      *     UPDATE INITIAL ASSET NSCC_PEND_IND                       *          
      *         SPACE = READY TO TRNASMIT                            *          
      *         'H'   = HOLD A TRANSMISSION                          *          
      *         'Y'   = ALREADY TRNASMITTED                          *          
      *--------------------------------------------------------------*          
       7100-UPDATE-ASSET-NSCC-PEND.                                             
           EXEC SQL                                                             
ET0002       UPDATE ACTIAST                                                     
                SET NSCC_PEND_CD = :WS-NSCC-PEND-CD                             
              WHERE CLIENT_NBR = :ACAT12-PASS-CLT             AND               
                    TRANS_RFRN_ID_CD = :ACAT12-PASS-ACCT-DLV  AND               
                    TRNFR_TYPE_CD = 'RCL'                     AND               
                    TRANS_TYPE_CD = 'A'                                         
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT12-NORMAL  TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT12-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              PERFORM 9000-ROLLBACK                                             
              SET ACAT12-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT12-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *--------------------------------------------------------------*          
      *          ROLLBAKCK                                           *          
      *--------------------------------------------------------------*          
       9000-ROLLBACK.                                                           
           EXEC CICS                                                            
              SYNCPOINT ROLLBACK                                                
           END-EXEC.                                                            
      *                                                                         
      *--------------------------------------------------------------*          
      *          WRITE DB2 ERROR LOG                                 *          
      *--------------------------------------------------------------*          
       9999-DB2-ERROR.                                                          
           MOVE SPACE      TO WS-ERR-DATA.                                      
           SET WS-WRITE-ERROR-TO-LOG TO TRUE.                                   
           MOVE EIBTRNID   TO CALLING-TRAN-ID.                                  
           MOVE 'ACAT12IR' TO CALLING-PROGRAM-ID.                               
           MOVE SQLCA      TO SQLCA-AREA.                                       
           EXEC CICS LINK PROGRAM('FPDB2LOG')                                   
                COMMAREA(WS-ERR-DATA)                                           
                LENGTH(LENGTH OF WS-ERR-DATA)                                   
                NOHANDLE                                                        
           END-EXEC.                                                            
       EJECT                                                                    
                                                                                
       HANG-CICS.                                                               
           GOBACK.                                                              
