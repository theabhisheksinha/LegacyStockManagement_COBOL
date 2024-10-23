000001* PDX    - ACAT13DB C0331385 09/20/12 10:58:55 TBLAMUR            00001000
000001* LRM015 SSR 85941 BLOCK FRV ENTRY IF ASSET ALREADY FRV-ED.               
000001* PDX    - ACAT13DB C0274611 12/18/08 13:39:57 TBLAMUR            00001000
000001* LRM013 - SSR# 55766 DO NOT COPY ACK-IND FROM HSTY TABLE                 
000001* PDX    - ACAT13DB C0250061 06/14/07 10:50:53 TBLAMUR            00001000
000001* LRM012 - SSR# 46214 ALLOW FRV ON A RCL DELIVERY.                        
000001* LRM012 - WHERE DSTBN-CD = R AND THE RCVR COLS ARE THE DLVY COLS.        
000001* PDX    - ACAT13DB C0233602 06/20/06 10:11:59 TBLAMUR            00001000
000001* LRM011 SSR 40661 RETAIN USER ID OF INITIATOR.                           
000001* PDX    - ACAT13DB C0230185 01/25/06 10:39:28 TBEDTAK            00001000
000001* ET0008 - SSR39684: USE PF7&8 TO SCROLL THRU NEWLY ENTERED FRVS. 00001000
000001* PDX    - ACAT13DB C0223559 08/09/05 11:52:38 TBEDTAK            00001000
000001* ET0007 - SSR42374: INCLUDE 866 SECURITY NUMBER WHEN INITIATE FRV00001000
000001*          FOR IRA ACCT WHICH POSTS TO 866 SECURITY NUMBER.       00001000
000001* PDX    - ACAT13DB C0222638 07/01/05 15:52:30 TBEDTAK            00001000
000001* ET0006 - SSR 43163 - DISPLAY ONLY ASSETS NOT INVOLVING WITH     00001000
000001*        - OTHER FRVS.                                            00001000
000001* PDX    - ACAT13DB C0216719 04/22/05 14:01:32 TBEDTAK            00001000
ET0005* ET0005 - MOVE SPACE TO RJCT-CODE OF INIT TRNFR WHEN CREATING FRV00001000
ET0004* ET0004 - ALLOW USER TO CREATE DUPLICATE ACCT FRVS IN INIT TABLE.00001000
000001* PDX    - ACAT13DB C0215192 01/04/05 15:41:40 TBEDTAK            00001000
ET0003* ET0003 - DB2 TABLE KEY CHANGE WITH NEW TABLE NAME.              00001000
000001* PDX    - ACAT13DB C0210492 10/18/04 14:04:48 TBEDTAK            00001000
ET0002* ET0002 - 0034535 CAGE TAG NUMBER FROM ORIGINAL FAIL             00001000
000001* PDX    - ACAT13DB C0205792 08/24/04 16:16:03 TBEDTAK            00001000
ET0001* ET0001 - ALLOW DELIVERER TO RECLAIM NON-STANDARD TRANSFERS      00001000
000001* PDX    - ACAT13DB C0122652 03/05/99 09:33:05 TBEDTAK            00001000
000001* PDX    - ACAT13DB C0120330 01/31/99 13:00:14 TBEDTAK            00001000
000001* PDX    - ACAT13DB C0119329 01/06/99 16:44:57 TBEDTAK            00001000
000001* PDX    - ACAT13DB C0117817 12/07/98 15:20:31 TBEDTAK            00001000
000001* PDX    - ACAT13DB C0109165 08/18/98 11:34:01 TBEDTAK            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    ACAT13DB.                                                 
       AUTHOR.  E.TAKAESU.                                                      
      *REMARKS.                                                                 
      *****************************************************************         
      *    DB2 I/O PROGRAM FOR DELIVERER TO INITIATE A FAIL REVERSAL  *         
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
       01  WS-PASSED-DATA-AREA.                                                 
           03  WS-CLIENT                       PIC X(04).                       
           03  WS-DELIVER                      PIC X(04).                       
           03  WS-DELIVER-ACCT                 PIC X(20).                       
           03  WS-RECEIVER                     PIC X(04).                       
           03  WS-RECEIVER-ACCT                PIC X(20).                       
           03  WS-ACAT-NUMBER                  PIC X(14).                       
           03  WS-SBMT-CLT                     PIC X(04).                       
ET0001     03  WS-ACAT-ASTD-NBR                PIC X(14).                       
ET0002     03  WS-CAGE-TAG                     PIC X(11).                       
ET0004     03  WS-ADP-CONTROL                  PIC X(14).                       
ET0004     03  WS-TRANS-RFRN-ID                PIC X(20).                       
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
ET0003**      INCLUDE VINITRNF                                                  
ET0003        INCLUDE ACTITRF                                                   
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *    INITIAL ASSET TABLE                                         *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
ET0003**      INCLUDE VINITAST                                                  
ET0003        INCLUDE ACTIAST                                                   
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
      *     ACTIVE TRANSFER TABLE                                      *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              INCLUDE VTRNFR                                                    
           END-EXEC.                                                            
      *                                                                         
      *----------------------------------------------------------------*        
      *     ACTIVE ASSET TABLE                                         *        
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
ET0002              ,CAGE_TAG_NBR                                               
                  FROM                                                          
                     VASTHSTY                                                   
                  WHERE                                                         
                     CLIENT_NBR = :WS-CLIENT  AND                               
                     ACAT_CONTROL_NBR = :WS-ACAT-NUMBER AND                     
LRM015               NOT FAIL_OPEN_CAGE_IND = 'R'                               
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
ET0004*                                                                         
ET0004*----------------------------------------------------------------*        
ET0004*         INITIAL TRANSFER DECLARE CURSOR STATEMENT              *        
ET0004*----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  TFRINI_CSR CURSOR FOR                                    
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
                     AND TRNFR_TYPE_CD = 'FRV'                                  
                  ORDER BY                                                      
                     ACAT_CONTROL_NBR                                           
                  FOR READ ONLY WITH UR                                         
           END-EXEC.                                                            
           EJECT                                                                
ET0004*                                                                         
ET0004*----------------------------------------------------------------*        
ET0004* INITIAL TRANSFER DECLARE CURSOR STATEMENT IN DESCENDING ORDER  *        
ET0004*----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  TFRINI_DESC CURSOR FOR                                   
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
                     AND TRNFR_TYPE_CD = 'FRV'                                  
                  ORDER BY                                                      
                     ACAT_CONTROL_NBR DESC                                      
                  FOR READ ONLY WITH UR                                         
           END-EXEC.                                                            
           EJECT                                                                
ET0008*                                                                         
ET0008*----------------------------------------------------------------*        
ET0008*  INITIAL TRANSFER TABLE DECLARE CSR STTMNT FOR ALL FAIL REVS.  *        
ET0008*----------------------------------------------------------------*        
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
                    AND TRNFR_TYPE_CD = 'FRV'                                   
                    AND DSTBN_SIDE_CD = 'D'                                     
                 ORDER BY                                                       
                    ACCT_DLVR_NBR                                               
                   ,ACCT_RCV_NBR                                                
                   ,ACAT_CONTROL_NBR                                            
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
       EJECT                                                                    
ET0008*                                                                         
ET0008*----------------------------------------------------------------*        
ET0008* INITIAL TRNFR DECL CURSOR STTMNT FOR ALL FRVS IN DESCEND ORDER *        
ET0008*----------------------------------------------------------------*        
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
                    AND TRNFR_TYPE_CD = 'FRV'                                   
                    AND DSTBN_SIDE_CD = 'D'                                     
                 ORDER BY                                                       
                    ACCT_DLVR_NBR     DESC                                      
                   ,ACCT_RCV_NBR      DESC                                      
                   ,ACAT_CONTROL_NBR  DESC                                      
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
       EJECT                                                                    
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
ET0002              ,CAGE_TAG_NBR                                               
                  FROM                                                          
ET0003               ACTIAST                                                    
                  WHERE                                                         
                     CLIENT_NBR = :WS-CLIENT                                    
ET0004**             AND  TRANS_RFRN_ID_CD = :WS-DELIVER-ACCT                   
ET0004               AND  ACCT_DLVR_NBR LIKE :WS-DELIVER-ACCT                   
ET0004               AND  ACAT_CONTROL_NBR = :WS-ADP-CONTROL                    
                     AND  TRNFR_TYPE_CD = 'FRV'                                 
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
ET0003               ACTIAST                                                    
                  WHERE                                                         
                     CLIENT_NBR = :WS-CLIENT                                    
                     AND  DLVR_NBR = :WS-DELIVER                                
                     AND  ACCT_DLVR_NBR = :WS-DELIVER-ACCT                      
                     AND  RCV_NBR = :WS-RECEIVER                                
                     AND  ACCT_RCV_NBR = :WS-RECEIVER-ACCT                      
ET0003               AND  TRNFR_TYPE_CD = 'FRV'                                 
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
                     AND  TRNFR_TYPE_CD = 'FRV'                                 
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
ET0002              ,CAGE_TAG_NBR                                               
                  FROM                                                          
                     VASSET                                                     
                  WHERE                                                         
                     CLIENT_NBR = :WS-CLIENT                                    
                     AND  ACAT_CONTROL_NBR = :WS-ACAT-NUMBER                    
                     AND  TRNFR_TYPE_CD = 'FRV'                                 
           END-EXEC.                                                            
           EJECT                                                                
ET0006*                                                                         
ET0006*----------------------------------------------------------------*        
ET0006*  INIT TRANSFER DECLARE CURSOR STMNT TO SRCH FRV ASSETS         *        
ET0006*----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  TFRINI2_CSR CURSOR FOR                                   
                  SELECT                                                        
                      CLIENT_NBR                                                
                     ,RCV_NBR                                                   
                     ,DLVR_NBR                                                  
                     ,ACCT_DLVR_NBR                                             
                     ,ACCT_RCV_NBR                                              
                     ,ACAT_CONTROL_NBR                                          
                     ,TRANS_RFRN_ID_CD                                          
                  FROM                                                          
                      ACTITRF                                                   
                  WHERE                                                         
                      CLIENT_NBR = :WS-CLIENT                                   
                      AND ACCT_DLVR_NBR   LIKE :WS-DELIVER-ACCT                 
                      AND ACAT_CNTL_ASTD_NBR = :WS-ACAT-NUMBER                  
                      AND TRNFR_TYPE_CD      = 'FRV'                            
                      AND DSTBN_SIDE_CD      = 'D'                              
                  ORDER BY                                                      
                      ACAT_CONTROL_NBR                                          
                  FOR READ ONLY WITH UR                                         
           END-EXEC.                                                            
           EJECT                                                                
ET0006*                                                                         
ET0006*----------------------------------------------------------------*        
ET0006*  INITIAL ASSET DECLARE CURSOR STMNT TO SRCH FRV ASSETS         *        
ET0006*----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  AST_INI3_CSR CURSOR FOR                                  
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,ACCT_DLVR_NBR                                              
                    ,ACCT_RCV_NBR                                               
                    ,ACAT_CONTROL_NBR                                           
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,CSH_MGN_SHRT_CD                                            
                    ,SECURITY_ADP_NBR                                           
                    ,TRANS_RFRN_ID_CD                                           
                  FROM                                                          
                     ACTIAST                                                    
                  WHERE                                                         
                     CLIENT_NBR = :WS-CLIENT                                    
                     AND  DLVR_NBR         = :WS-DELIVER                        
                     AND  RCV_NBR          = :WS-RECEIVER                       
                     AND  ACCT_DLVR_NBR LIKE :WS-DELIVER-ACCT                   
                     AND  ACCT_RCV_NBR     = :WS-RECEIVER-ACCT                  
                     AND  ACAT_CONTROL_NBR = :WS-ADP-CONTROL                    
                     AND  TRNFR_TYPE_CD    = 'FRV'                              
                     AND  TRANS_RFRN_ID_CD = :WS-TRANS-RFRN-ID                  
                  FOR READ ONLY WITH UR                                         
           END-EXEC.                                                            
ET0006*                                                                         
ET0006*----------------------------------------------------------------*        
ET0006*  ACTIVE TRANSFER DECLARE CURSOR STMNT TO SRCH FRV ASSETS       *        
ET0006*----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE TRNFR_CSR  CURSOR FOR                                     
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,ACAT_CNTL_ASTD_NBR                                         
                  FROM                                                          
                     VTRNFR                                                     
                  WHERE                                                         
                     CLIENT_NBR = :WS-CLIENT                                    
                     AND  ACCT_DLVR_NBR LIKE :WS-DELIVER-ACCT                   
                     AND  TRNFR_TYPE_CD = 'FRV'                                 
                     AND  NOT (STTS_CD IN ('140', '600'))                       
                     AND  ACAT_CNTL_ASTD_NBR = :WS-ACAT-NUMBER                  
                  FOR READ ONLY WITH UR                                         
           END-EXEC.                                                            
           EJECT                                                                
       LINKAGE SECTION.                                                         
       01  DFHCOMMAREA.                                                         
       COPY ACAT13IO.                                                           
       EJECT                                                                    
      *                                                                         
       PROCEDURE DIVISION.                                                      
           MOVE ACAT13-PASS-CLT      TO WS-CLIENT.                              
           MOVE ACAT13-PASS-DLVR-NBR TO WS-DELIVER.                             
           MOVE ACAT13-PASS-ACCT-DLV TO WS-DELIVER-ACCT.                        
           MOVE ACAT13-PASS-CON-BRKR TO WS-RECEIVER.                            
           MOVE ACAT13-PASS-CON-ACCT TO WS-RECEIVER-ACCT.                       
           MOVE ACAT13-PASS-ACAT     TO WS-ACAT-NUMBER.                         
           MOVE ACAT13-PASS-SBMT-CLT TO WS-SBMT-CLT.                            
ET0001     MOVE ACAT13-PASS-ACAT-ASTD-NBR TO WS-ACAT-ASTD-NBR.                  
ET0002     MOVE ACAT13-PASS-CAGE-TAG      TO WS-CAGE-TAG.                       
ET0004     MOVE ACAT13-PASS-ADP-CONTROL   TO WS-ADP-CONTROL.                    
ET0004     MOVE ACAT13-PASS-TRANS-RFRN-ID TO WS-TRANS-RFRN-ID.                  
      *                                                                         
      *                                                                         
           EXEC SQL                                                             
              SET :WS-TIMESTAMP = CURRENT TIMESTAMP                             
           END-EXEC.                                                            
           MOVE WS-TIMESTAMP (1:10) TO WS-CURRENT-DATE.                         
      *                                                                         
           EVALUATE TRUE                                                        
              WHEN ACAT13-GET-TFRHST                                            
                   PERFORM 0100-GET-TFR-HIST                                    
              WHEN ACAT13-GET-TFRINI                                            
                   PERFORM 0200-GET-TFR-INIT                                    
              WHEN ACAT13-GET-ASTHST                                            
                   PERFORM 0300-GET-ASSET-HIST                                  
      *       WHEN ACAT13-GET-ASTINI                                            
      *            PERFORM 0400-GET-ASSET-INIT                                  
              WHEN ACAT13-OPN-ASTHST                                            
                   PERFORM 0500-OPEN-ASSET-HIST                                 
              WHEN ACAT13-FET-ASTHST                                            
                   PERFORM 0600-FETCH-ASSET-HIST                                
              WHEN ACAT13-CLO-ASTHST                                            
                   PERFORM 0700-CLOSE-ASSET-HIST                                
              WHEN ACAT13-OPN-ASTINI                                            
                   PERFORM 0800-OPEN-ASSET-INIT                                 
              WHEN ACAT13-FET-ASTINI                                            
                   PERFORM 0900-FETCH-ASSET-INIT                                
              WHEN ACAT13-CLO-ASTINI                                            
                   PERFORM 1000-CLOSE-ASSET-INIT                                
              WHEN ACAT13-INS-TFRINI                                            
                   PERFORM 1100-INSERT-TFR-INIT                                 
              WHEN ACAT13-INS-ASTINI                                            
                   PERFORM 1200-INSERT-ASSET-INIT                               
              WHEN ACAT13-UPD-ASTHST                                            
                   PERFORM 1300-UPDATE-ASSET-HIST                               
              WHEN ACAT13-CNT-REJ-RCLM                                          
                   PERFORM 1400-COUNT-REJECTED-REVERSAL                         
              WHEN ACAT13-UPD-RESUB                                             
                   PERFORM 1500-UPDATE-RJCT-RESUB-IND                           
              WHEN ACAT13-DEL-RECLAIM                                           
                   PERFORM 1600-DELETE-RECLAIM                                  
              WHEN ACAT13-CNT-TFRINI                                            
                   PERFORM 1700-COUNT-INIT-TRANSFER                             
              WHEN ACAT13-CNT-ASTINI                                            
                   PERFORM 1800-COUNT-INIT-ASSET                                
              WHEN ACAT13-CNT-TFRHST                                            
                   PERFORM 1900-COUNT-HIST-TRANSFER                             
              WHEN ACAT13-OPN-TRANSFER                                          
                   PERFORM 2000-OPEN-TRNFR                                      
              WHEN ACAT13-FET-TRANSFER                                          
                   PERFORM 2100-FETCH-TRNFR                                     
              WHEN ACAT13-CLO-TRANSFER                                          
                   PERFORM 2200-CLOSE-TRNFR                                     
              WHEN ACAT13-OPN-ASSET                                             
                   PERFORM 2300-OPEN-ASSET                                      
              WHEN ACAT13-FET-ASSET                                             
                   PERFORM 2400-FETCH-ASSET                                     
              WHEN ACAT13-CLO-ASSET                                             
                   PERFORM 2500-CLOSE-ASSET                                     
              WHEN ACAT13-GET-TRANSFER                                          
                   PERFORM 2600-GET-TRNFR                                       
ET0001        WHEN ACAT13-OPN-ASTINI2                                           
ET0001             PERFORM 2710-OPEN-INIT-ASSET2                                
              WHEN ACAT13-FND-ASTINI                                            
ET0001**           PERFORM 2700-FIND-INIT-ASSET                                 
ET0001             PERFORM 2720-FIND-INIT-ASSET2                                
ET0001        WHEN ACAT13-CLO-ASTINI2                                           
ET0001             PERFORM 2730-CLOSE-INIT-ASSET2                               
ET0001        WHEN ACAT13-OPN-TFRHST                                            
ET0001             PERFORM 2800-OPEN-TRNFR-HIST                                 
ET0001        WHEN ACAT13-FET-TFRHST                                            
ET0001             PERFORM 2900-FETCH-TRNFR-HIST                                
ET0001        WHEN ACAT13-CLO-TFRHST                                            
ET0001             PERFORM 3000-CLOSE-TRNFR-HIST                                
ET0001        WHEN ACAT13-OPN-TFRHST-DESC                                       
ET0001             PERFORM 3100-OPEN-TRNFR-HIST-DESC                            
ET0001        WHEN ACAT13-FET-TFRHST-DESC                                       
ET0001             PERFORM 3200-FETCH-TRNFR-HIST-DESC                           
ET0001        WHEN ACAT13-CLO-TFRHST-DESC                                       
ET0001             PERFORM 3300-CLOSE-TRNFR-HIST-DESC                           
ET0004        WHEN ACAT13-OPN-TFRINI                                            
ET0004             PERFORM 3400-OPEN-TRNFR-INIT                                 
ET0004        WHEN ACAT13-FET-TFRINI                                            
ET0004             PERFORM 3500-FETCH-TRNFR-INIT                                
ET0004        WHEN ACAT13-CLO-TFRINI                                            
ET0004             PERFORM 3600-CLOSE-TRNFR-INIT                                
ET0004        WHEN ACAT13-OPN-TFRINI-DESC                                       
ET0004             PERFORM 3700-OPEN-TRNFR-INIT-DESC                            
ET0004        WHEN ACAT13-FET-TFRINI-DESC                                       
ET0004             PERFORM 3800-FETCH-TRNFR-INIT-DESC                           
ET0004        WHEN ACAT13-CLO-TFRINI-DESC                                       
ET0004             PERFORM 3900-CLOSE-TRNFR-INIT-DESC                           
ET0006        WHEN ACAT13-OPN-TFRINI2                                           
ET0006             PERFORM 4000-OPN-INIT-TRNFR-FOR-FRV                          
ET0006        WHEN ACAT13-FET-TFRINI2                                           
ET0006             PERFORM 4100-FET-INIT-TRNFR-FOR-FRV                          
ET0006        WHEN ACAT13-CLO-TFRINI2                                           
ET0006             PERFORM 4200-CLO-INIT-TRNFR-FOR-FRV                          
ET0006        WHEN ACAT13-OPN-ASTINI3                                           
ET0006             PERFORM 4300-OPN-INIT-ASSET-FOR-FRV                          
ET0006        WHEN ACAT13-FET-ASTINI3                                           
ET0006             PERFORM 4400-FET-INIT-ASSET-FOR-FRV                          
ET0006        WHEN ACAT13-CLO-ASTINI3                                           
ET0006             PERFORM 4500-CLO-INIT-ASSET-FOR-FRV                          
ET0006        WHEN ACAT13-OPN-TRNFR                                             
ET0006             PERFORM 4600-OPN-TRNFR-FOR-FRV-ASSETS                        
ET0006        WHEN ACAT13-FET-TRNFR                                             
ET0006             PERFORM 4700-FET-TRNFR-FOR-FRV-ASSETS                        
ET0006        WHEN ACAT13-CLO-TRNFR                                             
ET0006             PERFORM 4800-CLO-TRNFR-FOR-FRV-ASSETS                        
ET0008        WHEN ACAT13-OPN-INITRN-FRV                                        
ET0008             PERFORM 4900-OPEN-ALL-INITRN                                 
ET0008        WHEN ACAT13-FET-INITRN-FRV                                        
ET0008             PERFORM 5000-FETCH-ALL-INITRN                                
ET0008        WHEN ACAT13-CLO-INITRN-FRV                                        
ET0008             PERFORM 5100-CLOSE-ALL-INITRN                                
ET0008        WHEN ACAT13-OPN-INITRN-FRV-D                                      
ET0008             PERFORM 5200-OPEN-ALL-INITRN-DESC                            
ET0008        WHEN ACAT13-FET-INITRN-FRV-D                                      
ET0008             PERFORM 5300-FETCH-ALL-INITRN-DESC                           
ET0008        WHEN ACAT13-CLO-INITRN-FRV-D                                      
ET0008             PERFORM 5400-CLOSE-ALL-INITRN-DESC                           
           END-EVALUATE.                                                        
                                                                                
           EXEC CICS RETURN                                                     
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *   GET A SETTLED CLOSED FULL TRANSFER FROM TRANSFER HISTORY   *          
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
                    CLIENT_NBR = :ACAT13-PASS-CLT                               
                    AND  ACAT_CONTROL_NBR = :ACAT13-PASS-ACAT                   
ET0001**            AND  DLVR_NBR = :ACAT13-PASS-DLVR-NBR                       
ET0001**            AND  ACCT_DLVR_NBR LIKE :ACAT13-PASS-ACCT-DLV               
ET0001**            AND  TRNFR_TYPE_CD = 'FUL'                                  
ET0001**            AND  DSTBN_SIDE_CD = 'D'                                    
ET0001**            AND  STTS_CD = '310'                                        
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
              PERFORM 0110-SETUP-TFR-ACAT13-COMMAREA                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT13-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *       SETUP TRANSFER TABLE FIELDS OF AN ACAT13-COMMAREA      *          
      *--------------------------------------------------------------*          
       0110-SETUP-TFR-ACAT13-COMMAREA.                                          
           INITIALIZE ACAT13-TRANSFER.                                          
           MOVE CLIENT-NBR             OF DCLVTRNHSTY                           
             TO ACAT13-TFR-CLT.                                                 
           MOVE ACAT-CONTROL-NBR       OF DCLVTRNHSTY                           
             TO ACAT13-TFR-ACAT.                                                
           MOVE STTS-CD                OF DCLVTRNHSTY                           
             TO ACAT13-TFR-STTS.                                                
           MOVE RCV-ACCT-TYPE-CD       OF DCLVTRNHSTY                           
             TO ACAT13-TFR-ACCT-TYPE.                                           
LRM012* FLIP RCV/DLVR FIELDS GOING BACK TO MAPPING PROGRAM ON A RECLAIM         
LRM012* AS THESE ARE LOGICALLY REVERSED; NSCC'S RCL 'R' IS A DELIVERY.          
LRM012     IF DSTBN-SIDE-CD  OF DCLVTRNHSTY = 'R'                               
LRM012     AND TRNFR-TYPE-CD OF DCLVTRNHSTY = 'RCL'                             
LRM012        MOVE DLVR-NBR               OF DCLVTRNHSTY                        
LRM012          TO ACAT13-TFR-RCV                                               
LRM012        MOVE ACCT-DLVR-NBR          OF DCLVTRNHSTY                        
LRM012          TO ACAT13-TFR-RCV-ACCT                                          
LRM012        MOVE RCV-NBR                OF DCLVTRNHSTY                        
LRM012          TO ACAT13-TFR-DLVR                                              
LRM012        MOVE ACCT-RCV-NBR           OF DCLVTRNHSTY                        
LRM012          TO ACAT13-TFR-DLVR-ACCT                                         
LRM012     ELSE                                                                 
              MOVE RCV-NBR                OF DCLVTRNHSTY                        
                TO ACAT13-TFR-RCV                                               
              MOVE ACCT-RCV-NBR           OF DCLVTRNHSTY                        
                TO ACAT13-TFR-RCV-ACCT                                          
              MOVE DLVR-NBR               OF DCLVTRNHSTY                        
                TO ACAT13-TFR-DLVR                                              
              MOVE ACCT-DLVR-NBR          OF DCLVTRNHSTY                        
                TO ACAT13-TFR-DLVR-ACCT                                         
LRM012     END-IF.                                                              
           MOVE STTLM-DT               OF DCLVTRNHSTY                           
             TO ACAT13-TFR-STTL-DT.                                             
           MOVE ACAT-CNTL-ASTD-NBR     OF DCLVTRNHSTY                           
             TO ACAT13-TFR-ACAT-ASTD.                                           
           MOVE RCV-CUST-NM            OF DCLVTRNHSTY                           
             TO ACAT13-TFR-NAME.                                                
           MOVE RCV-SS-PRIM-NBR        OF DCLVTRNHSTY                           
             TO ACAT13-TFR-SS1.                                                 
           MOVE RCV-SS-SCNDY-NBR       OF DCLVTRNHSTY                           
             TO ACAT13-TFR-SS2.                                                 
           MOVE RR-CD                  OF DCLVTRNHSTY                           
             TO ACAT13-TFR-RR.                                                  
           MOVE TRNFR-TYPE-CD          OF DCLVTRNHSTY                           
             TO ACAT13-TFR-TYPE.                                                
           MOVE TRANS-RFRN-ID-CD       OF DCLVTRNHSTY                           
             TO ACAT13-TFR-RFRN-ID.                                             
           MOVE CMNT-TXT               OF DCLVTRNHSTY                           
             TO ACAT13-TFR-CMNTS.                                               
           MOVE TRANS-TYPE-CD          OF DCLVTRNHSTY                           
             TO ACAT13-TFR-TRANS-TYPE.                                          
      *                                                                         
      *--------------------------------------------------------------*          
      *  GET A FAIL REVERSAL INITIAL TRANSFER FROM INIT TRANSFER TBL *          
      *--------------------------------------------------------------*          
       0200-GET-TFR-INIT.                                                       
ET0003**   INITIALIZE DCLVINITRNF.                                              
ET0003     INITIALIZE DCLACTITRF.                                               
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
ET0003              :DCLACTITRF.CLIENT-NBR                                      
ET0003             ,:DCLACTITRF.DLVR-NBR                                        
ET0003             ,:DCLACTITRF.ACCT-DLVR-NBR                                   
ET0003             ,:DCLACTITRF.RCV-NBR                                         
ET0003             ,:DCLACTITRF.ACCT-RCV-NBR                                    
ET0003             ,:DCLACTITRF.TRNFR-TYPE-CD                                   
ET0003             ,:DCLACTITRF.SBMTG-PRTCP-NBR                                 
ET0003             ,:DCLACTITRF.ACAT-CONTROL-NBR                                
ET0003             ,:DCLACTITRF.TRANS-TYPE-CD                                   
ET0003             ,:DCLACTITRF.RCV-CUST-NM                                     
ET0003             ,:DCLACTITRF.RCV-SS-PRIM-NBR                                 
ET0003             ,:DCLACTITRF.RCV-SS-SCNDY-NBR                                
ET0003             ,:DCLACTITRF.RCV-ACCT-TYPE-CD                                
ET0003             ,:DCLACTITRF.RCV-OCC-BRKR-NBR                                
ET0003             ,:DCLACTITRF.RCV-CRSPN-NBR                                   
ET0003             ,:DCLACTITRF.ACAT-CNTL-ASTD-NBR                              
ET0003             ,:DCLACTITRF.CMNT-TXT                                        
ET0003             ,:DCLACTITRF.PRCS-DT                                         
ET0003             ,:DCLACTITRF.STTS-CD                                         
ET0003             ,:DCLACTITRF.DSTBN-SIDE-CD                                   
ET0003             ,:DCLACTITRF.SYS-ACT-CD                                      
ET0003             ,:DCLACTITRF.SYS-RJCT-RSN-CD                                 
ET0003             ,:DCLACTITRF.TRNFR-TYPE-RJCT-CD                              
ET0003             ,:DCLACTITRF.TRNFR-TYPE-RJC1-CD                              
ET0003             ,:DCLACTITRF.TRNFR-TYPE-RJC2-CD                              
ET0003             ,:DCLACTITRF.PHSCL-SEQ-NBR                                   
ET0003             ,:DCLACTITRF.LGCL-SEQ-NBR                                    
ET0003             ,:DCLACTITRF.PRTCP-CONTRA-CD                                 
ET0003             ,:DCLACTITRF.CYCLE-CD                                        
ET0003             ,:DCLACTITRF.DAYS-STTS-QTY                                   
ET0003             ,:DCLACTITRF.TRANS-RFRN-ID-CD                                
ET0003             ,:DCLACTITRF.DB-CR-CD                                        
ET0003             ,:DCLACTITRF.STTLM-ASCTD-DT                                  
ET0003             ,:DCLACTITRF.NSCC-PEND-CD                                    
ET0003             ,:DCLACTITRF.NSCC-ACK-IND                                    
ET0003             ,:DCLACTITRF.UPDT-TMSTP                                      
ET0003             ,:DCLACTITRF.CRT-TMSTP                                       
ET0003             ,:DCLACTITRF.CICS-TERM-ID-CD                                 
ET0003             ,:DCLACTITRF.PRGM-NM                                         
ET0003             ,:DCLACTITRF.RR-CD                                           
                 FROM                                                           
ET0003              ACTITRF                                                     
                WHERE                                                           
                    CLIENT_NBR = :ACAT13-PASS-CLT                               
                    AND  DLVR_NBR = :ACAT13-PASS-DLVR-NBR                       
                    AND  ACCT_DLVR_NBR LIKE :ACAT13-PASS-ACCT-DLV               
                    AND  TRNFR_TYPE_CD = 'FRV'                                  
                    AND  DSTBN_SIDE_CD = 'D'                                    
ET0001**            AND  NOT (NSCC_PEND_CD = 'Y')                               
ET0001              AND  NSCC_PEND_CD IN (' ','Y')                              
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
              PERFORM 0210-SETUP-INIT-TFR-COMMAREA                              
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT13-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
       0210-SETUP-INIT-TFR-COMMAREA.                                            
           INITIALIZE ACAT13-TRANSFER.                                          
ET0003     MOVE CLIENT-NBR             OF DCLACTITRF                            
             TO ACAT13-TFR-CLT.                                                 
ET0003     MOVE SBMTG-PRTCP-NBR        OF DCLACTITRF                            
             TO ACAT13-TFR-PRTCP-NBR.                                           
ET0003     MOVE STTS-CD                OF DCLACTITRF                            
             TO ACAT13-TFR-STTS.                                                
ET0003     MOVE RCV-ACCT-TYPE-CD       OF DCLACTITRF                            
             TO ACAT13-TFR-ACCT-TYPE.                                           
ET0003     MOVE RCV-NBR                OF DCLACTITRF                            
             TO ACAT13-TFR-RCV.                                                 
ET0003     MOVE ACCT-RCV-NBR           OF DCLACTITRF                            
             TO ACAT13-TFR-RCV-ACCT.                                            
ET0003     MOVE DLVR-NBR               OF DCLACTITRF                            
             TO ACAT13-TFR-DLVR.                                                
ET0003     MOVE ACCT-DLVR-NBR          OF DCLACTITRF                            
             TO ACAT13-TFR-DLVR-ACCT.                                           
           MOVE SPACE                                                           
             TO ACAT13-TFR-STTL-DT.                                             
ET0003     MOVE ACAT-CNTL-ASTD-NBR     OF DCLACTITRF                            
             TO ACAT13-TFR-ACAT-ASTD.                                           
ET0003     MOVE RCV-CUST-NM            OF DCLACTITRF                            
             TO ACAT13-TFR-NAME.                                                
ET0003     MOVE RCV-SS-PRIM-NBR        OF DCLACTITRF                            
             TO ACAT13-TFR-SS1.                                                 
ET0003     MOVE RCV-SS-SCNDY-NBR       OF DCLACTITRF                            
             TO ACAT13-TFR-SS2.                                                 
ET0004**   MOVE SPACE                                                           
ET0004     MOVE RR-CD                  OF DCLACTITRF                            
             TO ACAT13-TFR-RR.                                                  
ET0003     MOVE TRNFR-TYPE-CD          OF DCLACTITRF                            
             TO ACAT13-TFR-TYPE.                                                
ET0003     MOVE TRANS-RFRN-ID-CD       OF DCLACTITRF                            
             TO ACAT13-TFR-RFRN-ID.                                             
ET0003     MOVE CMNT-TXT               OF DCLACTITRF                            
             TO ACAT13-TFR-CMNTS.                                               
ET0003     MOVE TRANS-TYPE-CD          OF DCLACTITRF                            
             TO ACAT13-TFR-TRANS-TYPE.                                          
ET0003     MOVE NSCC-PEND-CD           OF DCLACTITRF                            
ET0001       TO ACAT13-TFR-NSCC-PEND.                                           
ET0004     MOVE ACAT-CONTROL-NBR       OF DCLACTITRF                            
ET0004       TO ACAT13-TFR-ACAT.                                                
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
ET0007             ,TRNFR_TYPE_CD                                               
ET0007             ,CAGE_TAG_NBR                                                
ET0007             ,ENTERED_TAG_NBR                                             
ET0007             ,NTWK_CNTL_CD                                                
ET0007             ,FUND_PROC_CD                                                
ET0007             ,FUND_RGSTN_STTS                                             
ET0007             ,SCRTY_866_NBR                                               
ET0007             ,ASSET_866_QTY                                               
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
ET0007             ,:DCLVASTHSTY.TRNFR-TYPE-CD                                  
ET0007             ,:DCLVASTHSTY.CAGE-TAG-NBR                                   
ET0007             ,:DCLVASTHSTY.ENTERED-TAG-NBR                                
ET0007             ,:DCLVASTHSTY.NTWK-CNTL-CD                                   
ET0007             ,:DCLVASTHSTY.FUND-PROC-CD                                   
ET0007             ,:DCLVASTHSTY.FUND-RGSTN-STTS                                
ET0007             ,:DCLVASTHSTY.SCRTY-866-NBR                                  
ET0007             ,:DCLVASTHSTY.ASSET-866-QTY                                  
                 FROM                                                           
                    VASTHSTY                                                    
                 WHERE                                                          
                    CLIENT_NBR = :ACAT13-PASS-CLT         AND                   
                    ACAT_CONTROL_NBR = :ACAT13-PASS-ACAT  AND                   
                    ASSET_SEQ_NBR = :ACAT13-PASS-SEQ-NBR                        
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
ET0007**      PERFORM 0110-SETUP-TFR-ACAT13-COMMAREA                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT13-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
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
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
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
ET0002          ,:DCLVASTHSTY.CAGE-TAG-NBR                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
              PERFORM 0610-SETUP-HIST-ASSET-COMMAREA                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT13-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *       SETUP HISTORY ASSET TABLE FIELDS OF ACAT13-COMMAREA    *          
      *--------------------------------------------------------------*          
       0610-SETUP-HIST-ASSET-COMMAREA.                                          
           INITIALIZE ACAT13-ASSET.                                             
           MOVE CLIENT-NBR        OF DCLVASTHSTY                                
             TO ACAT13-AST-ACAT.                                                
           MOVE ASSET-PRC-CTGY-CD OF DCLVASTHSTY                                
             TO ACAT13-AST-CTGRY.                                               
           MOVE STTLM-LCTN-CD     OF DCLVASTHSTY                                
             TO ACAT13-AST-STTL-LOC.                                            
           MOVE CSH-MGN-SHRT-CD   OF DCLVASTHSTY                                
             TO ACAT13-AST-CS-MG-SH.                                            
           MOVE ACAT-CONTROL-NBR  OF DCLVASTHSTY                                
             TO ACAT13-AST-ACAT.                                                
           MOVE ISIN-SEC-ISSUE-CD OF DCLVASTHSTY                                
             TO ACAT13-AST-SEC.                                                 
           MOVE ASSET-QTY         OF DCLVASTHSTY                                
             TO ACAT13-AST-QTY.                                                 
           MOVE ASSET-AMT         OF DCLVASTHSTY                                
             TO ACAT13-AST-AMT.                                                 
           MOVE ASSET-DESC-TXT    OF DCLVASTHSTY                                
             TO ACAT13-AST-DESC.                                                
           MOVE ASSET-CMNT-TXT    OF DCLVASTHSTY                                
             TO ACAT13-AST-CMNTS.                                               
           MOVE TRANS-RFRN-ID-CD  OF DCLVASTHSTY                                
             TO ACAT13-AST-RFRN-ID.                                             
           MOVE TRNFR-TYPE-RSN-CD OF DCLVASTHSTY                                
             TO ACAT13-AST-REASON.                                              
           MOVE TRANS-TYPE-CD     OF DCLVASTHSTY                                
             TO ACAT13-AST-TRANS-TYP.                                           
           MOVE FRV-SENT-NSCC-IND OF DCLVASTHSTY                                
             TO ACAT13-AST-FRV-SENT.                                            
           MOVE ASSET-SEQ-NBR     OF DCLVASTHSTY                                
             TO ACAT13-AST-SEQ-NBR.                                             
           MOVE PSTN-CD           OF DCLVASTHSTY                                
             TO ACAT13-AST-PSTN-CD.                                             
           MOVE FAIL-OPEN-CAGE-IND OF DCLVASTHSTY                               
             TO ACAT13-AST-FAIL-OPN-CAGE.                                       
           MOVE FAIL-SENT-CAGE-IND OF DCLVASTHSTY                               
             TO ACAT13-AST-FAIL-SNT-CAGE.                                       
ET0002     MOVE CAGE-TAG-NBR       OF DCLVASTHSTY                               
             TO ACAT13-AST-CAGE-TAG.                                            
ET0002     MOVE SECURITY-ADP-NBR   OF DCLVASTHSTY                               
ET0002       TO ACAT13-AST-ADP-NBR.                                             
      *                                                                         
      *--------------------------------------------------------------*          
      *          CLOSE HISTORY ASSET CURSOR TABLE                    *          
      *--------------------------------------------------------------*          
       0700-CLOSE-ASSET-HIST.                                                   
           EXEC SQL                                                             
              CLOSE ASTHSTCS                                                    
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
       0800-OPEN-ASSET-INIT.                                                    
           EXEC SQL                                                             
              OPEN ASTINICS                                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
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
ET0003           :DCLACTIAST.CLIENT-NBR                                         
ET0003          ,:DCLACTIAST.DLVR-NBR                                           
ET0003          ,:DCLACTIAST.ACCT-DLVR-NBR                                      
ET0003          ,:DCLACTIAST.RCV-NBR                                            
ET0003          ,:DCLACTIAST.ACCT-RCV-NBR                                       
ET0003          ,:DCLACTIAST.ISIN-CNTRY-CD                                      
ET0003          ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                                  
ET0003          ,:DCLACTIAST.ISIN-SEC-CDG-CD                                    
ET0003          ,:DCLACTIAST.STTLM-LCTN-CD                                      
ET0003          ,:DCLACTIAST.CSH-MGN-SHRT-CD                                    
ET0003          ,:DCLACTIAST.SBMTG-PRTCP-NBR                                    
ET0003          ,:DCLACTIAST.ACAT-CONTROL-NBR                                   
ET0003          ,:DCLACTIAST.ASSET-SEQ-NBR                                      
ET0003          ,:DCLACTIAST.TRANS-TYPE-CD                                      
ET0003          ,:DCLACTIAST.PHSCL-SEQ-NBR                                      
ET0003          ,:DCLACTIAST.LGCL-SEQ-NBR                                       
ET0003          ,:DCLACTIAST.ASSET-PRC-CTGY-CD                                  
ET0003          ,:DCLACTIAST.STTLM-RSN-CD                                       
ET0003          ,:DCLACTIAST.ASSET-DESC-TXT                                     
ET0003          ,:DCLACTIAST.ASSET-RQST-QTY-CD                                  
ET0003          ,:DCLACTIAST.AST-RQST-TRANS-CD                                  
ET0003          ,:DCLACTIAST.ASSET-QTY                                          
ET0003          ,:DCLACTIAST.ASSET-PCT                                          
ET0003          ,:DCLACTIAST.PSTN-CD                                            
ET0003          ,:DCLACTIAST.ISO-CRNCY-CD                                       
ET0003          ,:DCLACTIAST.ASSET-AMT                                          
ET0003          ,:DCLACTIAST.BEARER-BOND-CD                                     
ET0003          ,:DCLACTIAST.WHI-CD                                             
ET0003          ,:DCLACTIAST.TRNFR-TYPE-RSN-CD                                  
ET0003          ,:DCLACTIAST.MBS-SERIAL-NBR                                     
ET0003          ,:DCLACTIAST.ASSET-CMNT-TXT                                     
ET0003          ,:DCLACTIAST.NSCC-WTHLD-CD                                      
ET0003          ,:DCLACTIAST.TRANS-RFRN-ID-CD                                   
ET0003          ,:DCLACTIAST.OPTN-CTGY-CD                                       
ET0003          ,:DCLACTIAST.NSCC-PEND-CD                                       
ET0003          ,:DCLACTIAST.NSCC-ACK-IND                                       
ET0003          ,:DCLACTIAST.PRGM-NM                                            
ET0003          ,:DCLACTIAST.CICS-TERM-ID-CD                                    
ET0003          ,:DCLACTIAST.UPDT-TMSTP                                         
ET0003          ,:DCLACTIAST.CRT-TMSTP                                          
ET0003          ,:DCLACTIAST.SECURITY-ADP-NBR                                   
ET0003          ,:DCLACTIAST.TRNFR-TYPE-CD                                      
ET0003          ,:DCLACTIAST.CAGE-TAG-NBR                                       
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
              PERFORM 0910-SETUP-INIT-ASSET-COMMAREA                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT13-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
       0910-SETUP-INIT-ASSET-COMMAREA.                                          
           INITIALIZE ACAT13-ASSET.                                             
ET0003     MOVE CLIENT-NBR          OF DCLACTIAST                               
             TO ACAT13-AST-CLT.                                                 
ET0003     MOVE ASSET-PRC-CTGY-CD   OF DCLACTIAST                               
             TO ACAT13-AST-CTGRY.                                               
ET0003     MOVE STTLM-LCTN-CD       OF DCLACTIAST                               
             TO ACAT13-AST-STTL-LOC.                                            
ET0003     MOVE CSH-MGN-SHRT-CD     OF DCLACTIAST                               
             TO ACAT13-AST-CS-MG-SH.                                            
ET0003     MOVE ACAT-CONTROL-NBR    OF DCLACTIAST                               
             TO ACAT13-AST-ACAT.                                                
ET0003     MOVE ISIN-SEC-ISSUE-CD   OF DCLACTIAST                               
             TO ACAT13-AST-SEC.                                                 
ET0003     MOVE ASSET-QTY           OF DCLACTIAST                               
             TO ACAT13-AST-QTY.                                                 
ET0003     MOVE ASSET-AMT           OF DCLACTIAST                               
             TO ACAT13-AST-AMT                                                  
ET0003     MOVE ASSET-DESC-TXT      OF DCLACTIAST                               
             TO ACAT13-AST-DESC.                                                
ET0003     MOVE ASSET-CMNT-TXT      OF DCLACTIAST                               
             TO ACAT13-AST-CMNTS.                                               
ET0003     MOVE TRANS-RFRN-ID-CD    OF DCLACTIAST                               
             TO ACAT13-AST-RFRN-ID.                                             
ET0003     MOVE TRNFR-TYPE-RSN-CD   OF DCLACTIAST                               
             TO ACAT13-AST-REASON.                                              
ET0003     MOVE TRANS-TYPE-CD       OF DCLACTIAST                               
             TO ACAT13-AST-TRANS-TYP.                                           
ET0003     MOVE ASSET-SEQ-NBR       OF DCLACTIAST                               
             TO ACAT13-AST-SEQ-NBR.                                             
ET0003     MOVE PSTN-CD             OF DCLACTIAST                               
             TO ACAT13-AST-PSTN-CD.                                             
ET0003     MOVE CAGE-TAG-NBR        OF DCLACTIAST                               
ET0002       TO ACAT13-AST-CAGE-TAG.                                            
ET0003     MOVE SECURITY-ADP-NBR    OF DCLACTIAST                               
ET0002       TO ACAT13-AST-ADP-NBR.                                             
       EJECT                                                                    
       1000-CLOSE-ASSET-INIT.                                                   
           EXEC SQL                                                             
              CLOSE ASTINICS                                                    
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *      CREATE A REVERSAL INITIAL TRANSFER TABLE                *          
      *--------------------------------------------------------------*          
       1100-INSERT-TFR-INIT.                                                    
           PERFORM 0100-GET-TFR-HIST.                                           
ET0003**   INITIALIZE DCLVINITRNF.                                              
ET0003     INITIALIZE DCLACTITRF.                                               
           EXEC SQL                                                             
ET0003        INSERT INTO ACTITRF                                               
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
LRM011            ,CICS_SGNON_ID                                                
LRM011            ,CICS_NET_NM                                                  
LRM011            ,TPSCRT_USR_ID                                                
LRM011            ,TPSCRT_USR_NM  )                                             
              VALUES                                                            
                 ( :DCLVTRNHSTY.CLIENT-NBR                                      
LRM012            ,:ACAT13-PASS-DLVR-NBR                                        
LRM012            ,:ACAT13-PASS-ACCT-DLV                                        
LRM012            ,:ACAT13-PASS-CON-BRKR                                        
LRM012            ,:ACAT13-PASS-CON-ACCT                                        
                  ,'FRV'                                                        
ET0003            ,:DCLACTITRF.RCV-NBR-STTS-CD                                  
ET0003            ,:DCLACTITRF.DLVR-NBR-STTS-CD                                 
ET0003            ,:DCLACTITRF.ACCT-RCV-STTS-CD                                 
ET0003            ,:DCLACTITRF.ACCT-DLVR-STTS-CD                                
                  ,:ACAT13-PASS-SBMT-CLT                                        
ET0003            ,:DCLACTITRF.SBMT-PRT-NR-STS-CD                               
ET0004            ,:ACAT13-PASS-ADP-CONTROL                                     
ET0003            ,:DCLACTITRF.CONTROL-NBR-STS-CD                               
ET0003            ,:DCLACTITRF.TRNFR-TYPE-STTS-CD                               
                  ,'A'                                                          
ET0003            ,:DCLACTITRF.TRANS-TYPE-STTS-CD                               
                  ,:DCLVTRNHSTY.RCV-CUST-NM                                     
ET0003            ,:DCLACTITRF.RCV-CUST-NM-STS-CD                               
                  ,:DCLVTRNHSTY.RCV-SS-PRIM-NBR                                 
ET0003            ,:DCLACTITRF.RCV-SS-PRIM-STS-CD                               
                  ,:DCLVTRNHSTY.RCV-SS-SCNDY-NBR                                
ET0003            ,:DCLACTITRF.RCV-SS-SCDY-STS-CD                               
                  ,:DCLVTRNHSTY.RCV-ACCT-TYPE-CD                                
ET0003            ,:DCLACTITRF.RCV-ACT-TYP-STS-CD                               
                  ,:DCLVTRNHSTY.RCV-OCC-BRKR-NBR                                
ET0003            ,:DCLACTITRF.RCV-OCC-STTS-CD                                  
                  ,:DCLVTRNHSTY.RCV-CRSPN-NBR                                   
ET0003            ,:DCLACTITRF.RCV-CRSPN-STTS-CD                                
                  ,:DCLVTRNHSTY.ACAT-CONTROL-NBR                                
ET0003            ,:DCLACTITRF.CNTL-ASTD-STTS-CD                                
                  ,:ACAT13-PASS-CMNTS                                           
ET0003            ,:DCLACTITRF.CMNT-STTS-CD                                     
                  ,:WS-CURRENT-DATE                                             
ET0003            ,:DCLACTITRF.STTS-CD                                          
LRM012            ,'D'                                                          
                  ,:DCLVTRNHSTY.SYS-ACT-CD                                      
                  ,:DCLVTRNHSTY.SYS-RJCT-RSN-CD                                 
ET0005            ,' '                                                          
ET0005            ,' '                                                          
ET0005            ,' '                                                          
ET0003            ,:DCLACTITRF.TRN-TYP-RJC-STS-CD                               
                  ,+1                                                           
ET0003            ,:DCLACTITRF.PHSCL-SEQ-STTS-CD                                
                  ,+1                                                           
ET0003            ,:DCLACTITRF.LGCL-SEQ-NR-STS-CD                               
                  ,:DCLVTRNHSTY.PRTCP-CONTRA-CD                                 
                  ,:DCLVTRNHSTY.CYCLE-CD                                        
                  ,:DCLVTRNHSTY.DAYS-STTS-QTY                                   
ET0004            ,:ACAT13-PASS-TRANS-RFRN-ID                                   
ET0003            ,:DCLACTITRF.TRANS-RFRN-STTS-CD                               
                  ,:DCLVTRNHSTY.DB-CR-CD                                        
                  ,:DCLVTRNHSTY.STTLM-DT                                        
ET0003            ,:DCLACTITRF.STTLM-ASCTD-STS-CD                               
ET0003            ,:DCLACTITRF.RCRD-LNGTH-STTS-CD                               
ET0003            ,:DCLACTITRF.RCRD-STTS-CD                                     
ET0003            ,:DCLACTITRF.NSCC-PEND-CD                                     
LRM013            ,' '                                                          
                  ,:WS-TIMESTAMP                                                
                  ,:WS-TIMESTAMP                                                
                  ,:ACAT13-PASS-TERMID                                          
                  ,'ACAT13DB'                                                   
                  ,:DCLVTRNHSTY.RR-CD                                           
LRM011            ,:ACAT13-SNON-ID                                              
LRM011            ,:ACAT13-NETNAME                                              
LRM011            ,:ACAT13-USER-ID                                              
LRM011            ,:ACAT13-USER-NAME  )                                         
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
ET0004     ELSE                                                                 
ET0004     IF SQLCODE = -803                                                    
ET0004        SET ACAT13-FOUND   TO TRUE                                        
           ELSE                                                                 
              PERFORM 9000-ROLLBACK                                             
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *      CREATE A REVERSAL INITIAL ASSET TABLE                   *          
      *--------------------------------------------------------------*          
       1200-INSERT-ASSET-INIT.                                                  
           PERFORM 0300-GET-ASSET-HIST.                                         
ET0003**   INITIALIZE DCLVINITAST.                                              
ET0003     INITIALIZE DCLACTIAST.                                               
           EXEC SQL                                                             
ET0003        INSERT INTO ACTIAST                                               
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
ET0002             ,CAGE_TAG_NBR                                                
ET0007             ,SCRTY_866_NBR                                               
ET0007             ,ASSET_866_QTY )                                             
              VALUES                                                            
                  (:DCLVASTHSTY.CLIENT-NBR                                      
                  ,:ACAT13-PASS-DLVR-NBR                                        
                  ,:ACAT13-PASS-ACCT-DLV                                        
                  ,:ACAT13-PASS-CON-BRKR                                        
                  ,:ACAT13-PASS-CON-ACCT                                        
                  ,:DCLVASTHSTY.ISIN-CNTRY-CD                                   
                  ,:DCLVASTHSTY.ISIN-SEC-ISSUE-CD                               
                  ,:DCLVASTHSTY.ISIN-SEC-CDG-CD                                 
                  ,'50'                                                         
                  ,:DCLVASTHSTY.CSH-MGN-SHRT-CD                                 
ET0003            ,:DCLACTIAST.CSH-MRG-SHT-STS-CD                               
ET0003            ,:DCLACTIAST.STTLM-LCTN-STTS-CD                               
ET0003            ,:DCLACTIAST.ISIN-CNTRY-STTS-CD                               
                  ,:ACAT13-PASS-SBMT-CLT                                        
ET0003            ,:DCLACTIAST.SBMT-PRT-NR-STS-CD                               
ET0004            ,:ACAT13-PASS-ADP-CONTROL                                     
ET0003            ,:DCLACTIAST.CONTROL-NBR-STS-CD                               
                  ,:DCLVASTHSTY.ASSET-SEQ-NBR                                   
ET0003            ,:DCLACTIAST.AST-SEQ-NBR-STS-CD                               
                  ,'A'                                                          
ET0003            ,:DCLACTIAST.TRANS-TYPE-STTS-CD                               
                  ,+1                                                           
ET0003            ,:DCLACTIAST.PHSCL-SEQ-STTS-CD                                
                  ,+1                                                           
ET0003            ,:DCLACTIAST.LGCL-SEQ-NR-STS-CD                               
                  ,:DCLVASTHSTY.ASSET-PRC-CTGY-CD                               
ET0003            ,:DCLACTIAST.AST-PRC-CTG-STS-CD                               
                  ,'XSET'                                                       
ET0003            ,:DCLACTIAST.STTLM-RSN-STTS-CD                                
                  ,:DCLVASTHSTY.ASSET-DESC-TXT                                  
ET0003            ,:DCLACTIAST.ASSET-DESC-STTS-CD                               
                  ,:DCLVASTHSTY.ASSET-RQST-QTY-CD                               
ET0003            ,:DCLACTIAST.ASSET-RQST-STS-CD                                
                  ,:DCLVASTHSTY.AST-RQST-TRANS-CD                               
ET0003            ,:DCLACTIAST.AST-RQ-TRAN-STS-CD                               
                  ,:ACAT13-PASS-QTY                                             
ET0003            ,:DCLACTIAST.ASSET-QTY-STTS-CD                                
                  ,:DCLVASTHSTY.ASSET-PCT                                       
ET0003            ,:DCLACTIAST.ASSET-PCT-STTS-CD                                
                  ,:DCLVASTHSTY.PSTN-CD                                         
ET0003            ,:DCLACTIAST.PSTN-CD-STTS-CD                                  
                  ,:DCLVASTHSTY.ISO-CRNCY-CD                                    
ET0003            ,:DCLACTIAST.ISO-CRNCY-STTS-CD                                
                  ,:DCLVASTHSTY.ASSET-AMT                                       
ET0003            ,:DCLACTIAST.ASSET-AMT-STTS-CD                                
                  ,:DCLVASTHSTY.BEARER-BOND-CD                                  
ET0003            ,:DCLACTIAST.BEARER-BND-STTS-CD                               
                  ,:DCLVASTHSTY.WHI-CD                                          
ET0003            ,:DCLACTIAST.WHI-STTS-CD                                      
                  ,:ACAT13-PASS-REASON                                          
ET0003            ,:DCLACTIAST.TRN-TYP-RSN-STS-CD                               
                  ,:DCLVASTHSTY.MBS-SERIAL-NBR                                  
ET0003            ,:DCLACTIAST.MBS-SERIAL-STTS-CD                               
                  ,:ACAT13-PASS-CMNTS                                           
ET0003            ,:DCLACTIAST.ASSET-CMNT-STTS-CD                               
ET0003            ,:DCLACTIAST.NSCC-WTHLD-CD                                    
ET0004            ,:ACAT13-PASS-TRANS-RFRN-ID                                   
ET0003            ,:DCLACTIAST.TRANS-RFRN-STTS-CD                               
ET0003            ,:DCLACTIAST.ISIN-SEC-IS-STS-CD                               
ET0003            ,:DCLACTIAST.ISIN-SEC-CD-STS-CD                               
                  ,:DCLVASTHSTY.OPTN-CTGY-CD                                    
ET0003            ,:DCLACTIAST.OPTN-CTGY-STTS-CD                                
ET0003            ,:DCLACTIAST.RCRD-LNGTH-STTS-CD                               
ET0003            ,:DCLACTIAST.RCRD-STTS-CD                                     
ET0003            ,:DCLACTIAST.NSCC-PEND-CD                                     
LRM013            ,' '                                                          
                  ,'ACAT13DB'                                                   
                  ,:ACAT13-PASS-TERMID                                          
                  ,:WS-TIMESTAMP                                                
                  ,:WS-TIMESTAMP                                                
                  ,:DCLVASTHSTY.SECURITY-ADP-NBR                                
                  ,'FRV'                                                        
ET0003            ,:DCLACTIAST.TRNFR-TYPE-STTS-CD                               
ET0003            ,:DCLACTIAST.RCV-NBR-STTS-CD                                  
ET0003            ,:DCLACTIAST.DLVR-NBR-STTS-CD                                 
ET0002            ,:ACAT13-PASS-CAGE-TAG                                        
ET0007            ,:DCLVASTHSTY.SCRTY-866-NBR                                   
ET0007            ,:DCLVASTHSTY.ASSET-866-QTY )                                 
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
              MOVE 'Y' TO WS-RECLAIM-SENT-IND                                   
ET0002        PERFORM 1250-UPDATE-ASSET-HIST-TAG                                
12/22 ******  PERFORM 1300-UPDATE-ASSET-HIST                                    
           ELSE                                                                 
              PERFORM 9000-ROLLBACK                                             
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
ET0002*                                                                         
ET0002*--------------------------------------------------------------*          
ET0002*    WHENEVER FAIL REVERSL WAS INITIATED, UPDATE ENTERED-TAG-  *          
ET0002*    NBR FIELD.                                                *          
ET0002*--------------------------------------------------------------*          
ET0002 1250-UPDATE-ASSET-HIST-TAG.                                              
           EXEC SQL                                                             
             UPDATE VASTHSTY                                                    
                SET ENTERED_TAG_NBR = :ACAT13-PASS-CAGE-TAG                     
                   ,CICS_TERM_ID_CD = :ACAT13-PASS-TERMID                       
                   ,UPDT_TMSTP = :WS-TIMESTAMP                                  
                   ,PRGM_NM = 'ACAT13DB'                                        
              WHERE CLIENT_NBR = :ACAT13-PASS-CLT        AND                    
                    ACAT_CONTROL_NBR = :ACAT13-PASS-ACAT AND                    
                    ASSET_SEQ_NBR = :ACAT13-PASS-SEQ-NBR                        
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT13-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              PERFORM 9000-ROLLBACK                                             
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *     UPDATE FRV_SENT_NSCC_IND OF HISTORY ASSET TABLE          *          
      *     WHEN INITIAL TRANSFER IS CREATED OR DELETED.             *          
      *     **** 12/22/98 ****                                       *          
      *     * DO NOT UPDATE ASSET HISTORY.                           *          
      *     * INSTEAD, ACAT13IF PROGRAM READS ACTIVE ASSET TABLE AND *          
      *     * EXAMINE TO SEE IF ANY ASSETS HAVE BEEN REVERSED.       *          
      *--------------------------------------------------------------*          
       1300-UPDATE-ASSET-HIST.                                                  
           EXEC SQL                                                             
             UPDATE VASTHSTY                                                    
                SET FRV_SENT_NSCC_IND = :WS-RECLAIM-SENT-IND                    
                   ,CICS_TERM_ID_CD = :ACAT13-PASS-TERMID                       
                   ,UPDT_TMSTP = :WS-TIMESTAMP                                  
              WHERE CLIENT_NBR = :ACAT13-PASS-CLT        AND                    
                    ACAT_CONTROL_NBR = :ACAT13-PASS-ACAT AND                    
                    ASSET_SEQ_NBR = :ACAT13-PASS-SEQ-NBR                        
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT13-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              PERFORM 9000-ROLLBACK                                             
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *      IS THERE ANY REJECTED FAIL REVERSAL?                    *          
      *--------------------------------------------------------------*          
       1400-COUNT-REJECTED-REVERSAL.                                            
           MOVE +0 TO WS-ROW-COUNT.                                             
           EXEC SQL                                                             
               SELECT                                                           
                    COUNT(*)                                                    
                 INTO                                                           
                    :WS-ROW-COUNT                                               
                 FROM                                                           
                    VTRNFR                                                      
                WHERE                                                           
                    CLIENT_NBR = :ACAT13-PASS-CLT                               
                    AND  RCV_NBR = :ACAT13-PASS-CON-BRKR                        
                    AND  ACCT_RCV_NBR = :ACAT13-PASS-CON-ACCT                   
                    AND  DLVR_NBR = :ACAT13-PASS-DLVR-NBR                       
                    AND  ACCT_DLVR_NBR = :ACAT13-PASS-ACCT-DLV                  
                    AND  TRNFR_TYPE_CD = 'FRV'                                  
                    AND  DSTBN_SIDE_CD = 'D'                                    
                    AND  STTS_CD = '600'                                        
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              IF WS-ROW-COUNT = 0                                               
                 SET ACAT13-NORMAL TO TRUE                                      
              END-IF                                                            
              IF WS-ROW-COUNT > 0                                               
                 SET ACAT13-FOUND TO TRUE                                       
              END-IF                                                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT13-NORMAL TO TRUE                                         
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  -  WHEN REJECTED REVERSAL WAS RESUBMITTED                   *          
      *        MOVE 'Y' TO ACCT_RJCT_RSBM_IND.                       *          
      *  -  WHEN NEWLY CREATED REVERSAL WAS DELETED AND IF REJECTED  *          
      *     REVERSAL EXISTS                                          *          
      *        MOVE SPACE TO ACCT_RJCT_RSBM_IND.                     *          
      *--------------------------------------------------------------*          
       1500-UPDATE-RJCT-RESUB-IND.                                              
           EXEC SQL                                                             
             UPDATE VTRNFR                                                      
                SET ACCT_RJCT_RSBM_IND = :ACAT13-PASS-RESUB-IND                 
                   ,CICS_TERM_ID_CD = :ACAT13-PASS-TERMID                       
                   ,UPDT_TMSTP = :WS-TIMESTAMP                                  
                   ,PRGM_NM = 'ACAT13DB'                                        
              WHERE                                                             
                   CLIENT_NBR = :ACAT13-PASS-CLT                                
                   AND  RCV_NBR = :ACAT13-PASS-CON-BRKR                         
                   AND  ACCT_RCV_NBR = :ACAT13-PASS-CON-ACCT                    
                   AND  DLVR_NBR = :ACAT13-PASS-DLVR-NBR                        
                   AND  ACCT_DLVR_NBR = :ACAT13-PASS-ACCT-DLV                   
                   AND  TRNFR_TYPE_CD = 'FRV'                                   
                   AND  DSTBN_SIDE_CD = 'D'                                     
                   AND  STTS_CD = '600'                                         
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT13-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *         DELETE REVERSAL TRANSFER                             *          
      *--------------------------------------------------------------*          
       1600-DELETE-RECLAIM.                                                     
ET0004**<< NOT NECESSARY TO UPDATE INITIAL TRANSFER & ASSET TABLES >>           
ET0004**<< BEFORE THEY GET DELETED                                 >>           
ET0004**   MOVE 'H' TO WS-NSCC-PEND-CD.                                         
ET0004**   PERFORM 7000-UPDATE-TFR-NSCC-PEND.                                   
ET0004**   PERFORM 7100-UPDATE-ASSET-NSCC-PEND.                                 
                                                                                
           EXEC SQL DELETE                                                      
ET0003         FROM ACTITRF                                                     
              WHERE CLIENT_NBR = :ACAT13-PASS-CLT          AND                  
ET0004              ACAT_CONTROL_NBR = :WS-ADP-CONTROL     AND                  
                    DLVR_NBR = :ACAT13-PASS-DLVR-NBR       AND                  
                    ACCT_DLVR_NBR = :ACAT13-PASS-ACCT-DLV  AND                  
                    RCV_NBR = :ACAT13-PASS-CON-BRKR        AND                  
                    ACCT_RCV_NBR = :ACAT13-PASS-CON-ACCT   AND                  
                    DSTBN_SIDE_CD = 'D'                    AND                  
                    TRNFR_TYPE_CD = 'FRV'                                       
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT13-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              PERFORM 9000-ROLLBACK                                             
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR                                            
              GO TO 1600-EXIT.                                                  
                                                                                
ET0002**   PERFORM 0800-OPEN-ASSET-INIT.                                        
ET0002**   MOVE SPACE TO WS-EXIT-LOOP-SW.                                       
ET0002**   PERFORM UNTIL WS-EXIT-LOOP                                           
ET0002**      PERFORM 0900-FETCH-ASSET-INIT                                     
ET0002**      IF SQLCODE = 0                                                    
ET0002**         MOVE ASSET-SEQ-NBR OF DCLVINITAST                              
ET0002**           TO ACAT13-PASS-SEQ-NBR                                       
ET0002**         MOVE SPACE                                                     
ET0002**           TO WS-RECLAIM-SENT-IND                                       
ET0002**         PERFORM 1300-UPDATE-ASSET-HIST                                 
ET0002**      ELSE                                                              
ET0002**         SET WS-EXIT-LOOP TO TRUE                                       
ET0002**      END-IF                                                            
ET0002**   END-PERFORM.                                                         
ET0002**   PERFORM 1000-CLOSE-ASSET-INIT.                                       
                                                                                
           EXEC SQL DELETE                                                      
ET0003         FROM ACTIAST                                                     
              WHERE CLIENT_NBR = :ACAT13-PASS-CLT             AND               
ET0004              ACAT_CONTROL_NBR = :WS-ADP-CONTROL        AND               
ET0004**            TRANS_RFRN_ID_CD = :ACAT13-PASS-ACCT-DLV  AND               
ET0004              DLVR_NBR = :ACAT13-PASS-DLVR-NBR          AND               
ET0004              ACCT_DLVR_NBR    = :ACAT13-PASS-ACCT-DLV  AND               
                    TRNFR_TYPE_CD = 'FRV'                     AND               
                    TRANS_TYPE_CD = 'A'                                         
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT13-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              PERFORM 9000-ROLLBACK                                             
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
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
ET0003              ACTITRF                                                     
                WHERE                                                           
                    CLIENT_NBR = :ACAT13-PASS-CLT          AND                  
ET0004              ACAT_CONTROL_NBR = :WS-ADP-CONTROL     AND                  
                    ACCT_DLVR_NBR = :ACAT13-PASS-ACCT-DLV  AND                  
                    RCV_NBR = :ACAT13-PASS-CON-BRKR        AND                  
                    ACCT_RCV_NBR = :ACAT13-PASS-CON-ACCT   AND                  
                    DSTBN_SIDE_CD = 'D'                    AND                  
                    TRNFR_TYPE_CD = 'FRV'                                       
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              IF WS-ROW-COUNT = 0                                               
                 SET ACAT13-NORMAL TO TRUE                                      
              END-IF                                                            
              IF WS-ROW-COUNT > 0                                               
                 SET ACAT13-FOUND TO TRUE                                       
              END-IF                                                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT13-NORMAL TO TRUE                                         
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *           CHECK IF ANY INITIAL ASSET ROW EXISTS              *          
      *--------------------------------------------------------------*          
       1800-COUNT-INIT-ASSET.                                                   
           MOVE +0 TO WS-ROW-COUNT.                                             
           EXEC SQL                                                             
               SELECT                                                           
                    COUNT(*)                                                    
                 INTO                                                           
                    :WS-ROW-COUNT                                               
                 FROM                                                           
ET0003              ACTIAST                                                     
                WHERE                                                           
                    CLIENT_NBR = :ACAT13-PASS-CLT             AND               
ET0004              ACAT_CONTROL_NBR = :WS-ADP-CONTROL        AND               
ET0004**            TRANS_RFRN_ID_CD = :ACAT13-PASS-ACCT-DLV  AND               
ET0004              ACCT_DLVR_NBR    = :ACAT13-PASS-ACCT-DLV  AND               
                    TRNFR_TYPE_CD = 'FRV'                     AND               
                    TRANS_TYPE_CD = 'A'                                         
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              IF WS-ROW-COUNT = 0                                               
                 SET ACAT13-NORMAL TO TRUE                                      
              END-IF                                                            
              IF WS-ROW-COUNT > 0                                               
                 SET ACAT13-FOUND TO TRUE                                       
              END-IF                                                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT13-NORMAL TO TRUE                                         
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
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
                    CLIENT_NBR = :ACAT13-PASS-CLT    AND                        
                    DLVR_NBR = :ACAT13-PASS-DLVR-NBR AND                        
                    TRNFR_TYPE_CD = 'FUL'            AND                        
                    DSTBN_SIDE_CD = 'D'              AND                        
                    STTS_CD = '310'                                             
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              IF WS-ROW-COUNT > 0                                               
                 SET ACAT13-NORMAL  TO TRUE                                     
              ELSE                                                              
                 SET ACAT13-FOUND TO TRUE                                       
              END-IF                                                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT13-NORMAL TO TRUE                                         
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
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
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
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
              SET ACAT13-NORMAL  TO TRUE                                        
              PERFORM 2110-SETUP-TRNFR-COMMAREA                                 
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT13-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *       SETUP ASSET TABLE FIELDS OF COMMAREA                   *          
      *--------------------------------------------------------------*          
       2110-SETUP-TRNFR-COMMAREA.                                               
           INITIALIZE ACAT13-TRANSFER.                                          
           MOVE CLIENT-NBR             OF DCLVTRNFR                             
             TO ACAT13-TFR-CLT.                                                 
           MOVE ACAT-CONTROL-NBR       OF DCLVTRNFR                             
             TO ACAT13-TFR-ACAT.                                                
           MOVE STTS-CD                OF DCLVTRNFR                             
             TO ACAT13-TFR-STTS.                                                
           MOVE RCV-ACCT-TYPE-CD       OF DCLVTRNFR                             
             TO ACAT13-TFR-ACCT-TYPE.                                           
           MOVE RCV-NBR                OF DCLVTRNFR                             
             TO ACAT13-TFR-RCV.                                                 
           MOVE ACCT-RCV-NBR           OF DCLVTRNFR                             
             TO ACAT13-TFR-RCV-ACCT.                                            
           MOVE DLVR-NBR               OF DCLVTRNFR                             
             TO ACAT13-TFR-DLVR.                                                
           MOVE ACCT-DLVR-NBR          OF DCLVTRNFR                             
             TO ACAT13-TFR-DLVR-ACCT.                                           
           MOVE STTLM-DT               OF DCLVTRNFR                             
             TO ACAT13-TFR-STTL-DT.                                             
           MOVE ACAT-CNTL-ASTD-NBR     OF DCLVTRNFR                             
             TO ACAT13-TFR-ACAT-ASTD.                                           
           MOVE RCV-CUST-NM            OF DCLVTRNFR                             
             TO ACAT13-TFR-NAME.                                                
           MOVE RCV-SS-PRIM-NBR        OF DCLVTRNFR                             
             TO ACAT13-TFR-SS1.                                                 
           MOVE RCV-SS-SCNDY-NBR       OF DCLVTRNFR                             
             TO ACAT13-TFR-SS2.                                                 
           MOVE RR-CD                  OF DCLVTRNFR                             
             TO ACAT13-TFR-RR.                                                  
           MOVE TRNFR-TYPE-CD          OF DCLVTRNFR                             
             TO ACAT13-TFR-TYPE.                                                
           MOVE TRANS-RFRN-ID-CD       OF DCLVTRNFR                             
             TO ACAT13-TFR-RFRN-ID.                                             
           MOVE CMNT-TXT               OF DCLVTRNFR                             
             TO ACAT13-TFR-CMNTS.                                               
           MOVE TRANS-TYPE-CD          OF DCLVTRNFR                             
             TO ACAT13-TFR-TRANS-TYPE.                                          
      *                                                                         
      *--------------------------------------------------------------*          
      *          CLOSE ACTIVE TRNFR CURSOR TABLE                     *          
      *--------------------------------------------------------------*          
       2200-CLOSE-TRNFR.                                                        
           EXEC SQL                                                             
              CLOSE TRNFRCSR                                                    
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
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
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
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
ET0002          ,:DCLVASSET.CAGE-TAG-NBR                                        
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
              PERFORM 2410-SETUP-ASSET-COMMAREA                                 
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT13-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *       SETUP ASSET TABLE FIELDS OF COMMAREA                   *          
      *--------------------------------------------------------------*          
       2410-SETUP-ASSET-COMMAREA.                                               
           INITIALIZE ACAT13-ASSET.                                             
           MOVE CLIENT-NBR        OF DCLVASSET                                  
             TO ACAT13-AST-ACAT.                                                
           MOVE ASSET-PRC-CTGY-CD OF DCLVASSET                                  
             TO ACAT13-AST-CTGRY.                                               
           MOVE STTLM-LCTN-CD     OF DCLVASSET                                  
             TO ACAT13-AST-STTL-LOC.                                            
           MOVE CSH-MGN-SHRT-CD   OF DCLVASSET                                  
             TO ACAT13-AST-CS-MG-SH.                                            
           MOVE ACAT-CONTROL-NBR  OF DCLVASSET                                  
             TO ACAT13-AST-ACAT.                                                
           MOVE ISIN-SEC-ISSUE-CD OF DCLVASSET                                  
             TO ACAT13-AST-SEC.                                                 
           MOVE ASSET-QTY         OF DCLVASSET                                  
             TO ACAT13-AST-QTY.                                                 
           MOVE ASSET-AMT         OF DCLVASSET                                  
             TO ACAT13-AST-AMT.                                                 
           MOVE ASSET-DESC-TXT    OF DCLVASSET                                  
             TO ACAT13-AST-DESC.                                                
           MOVE ASSET-CMNT-TXT    OF DCLVASSET                                  
             TO ACAT13-AST-CMNTS.                                               
           MOVE TRANS-RFRN-ID-CD  OF DCLVASSET                                  
             TO ACAT13-AST-RFRN-ID.                                             
           MOVE TRNFR-TYPE-RSN-CD OF DCLVASSET                                  
             TO ACAT13-AST-REASON.                                              
           MOVE TRANS-TYPE-CD     OF DCLVASSET                                  
             TO ACAT13-AST-TRANS-TYP.                                           
           MOVE FRV-SENT-NSCC-IND OF DCLVASSET                                  
             TO ACAT13-AST-FRV-SENT.                                            
           MOVE ASSET-SEQ-NBR     OF DCLVASSET                                  
             TO ACAT13-AST-SEQ-NBR.                                             
           MOVE PSTN-CD           OF DCLVASSET                                  
             TO ACAT13-AST-PSTN-CD.                                             
           MOVE FAIL-OPEN-CAGE-IND OF DCLVASSET                                 
             TO ACAT13-AST-FAIL-OPN-CAGE.                                       
           MOVE FAIL-SENT-CAGE-IND OF DCLVASSET                                 
             TO ACAT13-AST-FAIL-SNT-CAGE.                                       
ET0002     MOVE CAGE-TAG-NBR       OF DCLVASSET                                 
ET0002       TO ACAT13-AST-CAGE-TAG.                                            
ET0002     MOVE SECURITY-ADP-NBR   OF DCLVASSET                                 
ET0002       TO ACAT13-AST-ADP-NBR.                                             
      *                                                                         
      *--------------------------------------------------------------*          
      *          CLOSE ACTIVE ASSET CURSOR TABLE                     *          
      *--------------------------------------------------------------*          
       2500-CLOSE-ASSET.                                                        
           EXEC SQL                                                             
              CLOSE ASSETCSR                                                    
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
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
                    CLIENT_NBR = :ACAT13-PASS-CLT                               
                    AND  ACAT_CONTROL_NBR = :ACAT13-PASS-ACAT                   
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
              PERFORM 2110-SETUP-TRNFR-COMMAREA                                 
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT13-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *     IS THER ANY DUPLICATE ASSETS IN INITIAL ASSET TABLE      *          
      *--------------------------------------------------------------*          
ET0001*     2700-FIND-INIT-ASSET LOGIC IS CHANGED                    *          
ET0001*            TO 2720-FIND-INIT-ASSET2                          *          
ET0001*--------------------------------------------------------------*          
       2700-FIND-INIT-ASSET.                                                    
           MOVE +0 TO WS-ROW-COUNT.                                             
           EXEC SQL                                                             
               SELECT                                                           
                    COUNT(*)                                                    
                 INTO                                                           
                    :WS-ROW-COUNT                                               
                 FROM                                                           
ET0003              ACTIAST                                                     
                WHERE                                                           
                    CLIENT_NBR = :ACAT13-PASS-CLT                               
                    AND  DLVR_NBR = :ACAT13-PASS-DLVR-NBR                       
                    AND  ACCT_DLVR_NBR = :ACAT13-PASS-ACCT-DLV                  
                    AND  RCV_NBR = :ACAT13-PASS-CON-BRKR                        
                    AND  ACCT_RCV_NBR = :ACAT13-PASS-CON-ACCT                   
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              IF WS-ROW-COUNT = 0                                               
                 SET ACAT13-NORMAL TO TRUE                                      
              END-IF                                                            
              IF WS-ROW-COUNT > 0                                               
                 SET ACAT13-FOUND TO TRUE                                       
              END-IF                                                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT13-NORMAL TO TRUE                                         
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
ET0001 2710-OPEN-INIT-ASSET2.                                                   
ET0001*--------------------------------------------------------------*          
ET0001*     OPEN INITIAL ASSET CURSOR STATEMENT #2                   *          
ET0001*--------------------------------------------------------------*          
           EXEC SQL                                                             
              OPEN ASTINICS2                                                    
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
                                                                                
ET0001*                                                                         
ET0001*--------------------------------------------------------------*          
ET0001*     IS THER ANY DUPLICATE ASSETS IN INITIAL ASSET TABLE?     *          
ET0001*     FETCH INITIAL ASSET CURSOR STATMENT #2                   *          
ET0001*--------------------------------------------------------------*          
ET0001 2720-FIND-INIT-ASSET2.                                                   
      **<< FETCH >>                                                             
           EXEC SQL                                                             
              FETCH                                                             
                  ASTINICS2                                                     
              INTO                                                              
ET0003           :DCLACTIAST.CLIENT-NBR                                         
ET0003          ,:DCLACTIAST.DLVR-NBR                                           
ET0003          ,:DCLACTIAST.ACCT-DLVR-NBR                                      
ET0003          ,:DCLACTIAST.RCV-NBR                                            
ET0003          ,:DCLACTIAST.ACCT-RCV-NBR                                       
ET0003          ,:DCLACTIAST.TRNFR-TYPE-CD                                      
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = 0                                                       
              SET ACAT13-FOUND   TO TRUE                                        
ET0003        MOVE TRNFR-TYPE-CD OF DCLACTIAST                                  
                TO ACAT13-AST-TRNFR-TYP                                         
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT13-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
                                                                                
ET0001 2730-CLOSE-INIT-ASSET2.                                                  
ET0001*--------------------------------------------------------------*          
ET0001*    CLOSE INITIAL ASSET CURSOR STATEMENT #2                   *          
ET0001*--------------------------------------------------------------*          
           EXEC SQL                                                             
              CLOSE ASTINICS2                                                   
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
ET0001*                                                                         
ET0001*--------------------------------------------------------------*          
ET0001*        OPEN TRANSFER HISTORY CURSOR TBL                      *          
ET0001*--------------------------------------------------------------*          
ET0001 2800-OPEN-TRNFR-HIST.                                                    
           EXEC SQL                                                             
              OPEN TRNHSTCS                                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
ET0001*                                                                         
ET0001*--------------------------------------------------------------*          
ET0001*       FETCH TRANSFER HISTORY CURSOR TBL                      *          
ET0001*--------------------------------------------------------------*          
ET0001 2900-FETCH-TRNFR-HIST.                                                   
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
              SET ACAT13-NORMAL  TO TRUE                                        
              PERFORM 0110-SETUP-TFR-ACAT13-COMMAREA                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT13-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
ET0001*                                                                         
ET0001*--------------------------------------------------------------*          
ET0001*       CLOSE TRANSFER HISTORY CURSOR TBL                      *          
ET0001*--------------------------------------------------------------*          
ET0001 3000-CLOSE-TRNFR-HIST.                                                   
           EXEC SQL                                                             
              CLOSE TRNHSTCS                                                    
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
ET0001*                                                                         
ET0001*--------------------------------------------------------------*          
ET0001*     OPEN TRANSFER HISTORY CURSOR TBL IN DESCENDING ORDER     *          
ET0001*--------------------------------------------------------------*          
ET0001 3100-OPEN-TRNFR-HIST-DESC.                                               
           EXEC SQL                                                             
              OPEN TRNHST_DES                                                   
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
                                                                                
ET0001*                                                                         
ET0001*--------------------------------------------------------------*          
ET0001*    FETCH TRANSFER HISTORY CURSOR TBL IN DESCENDING ORDER     *          
ET0001*--------------------------------------------------------------*          
ET0001 3200-FETCH-TRNFR-HIST-DESC.                                              
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
              SET ACAT13-NORMAL  TO TRUE                                        
              PERFORM 0110-SETUP-TFR-ACAT13-COMMAREA                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT13-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
                                                                                
ET0001*                                                                         
ET0001*--------------------------------------------------------------*          
ET0001*    CLOSE TRANSFER HISTORY CURSOR TBL IN DESCENDING ORDER     *          
ET0001*--------------------------------------------------------------*          
ET0001 3300-CLOSE-TRNFR-HIST-DESC.                                              
           EXEC SQL                                                             
              CLOSE TRNHST_DES                                                  
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
ET0004*                                                                         
ET0004*--------------------------------------------------------------*          
ET0004*    OPEN INITIAL TRANSFER CURSOR TBL                          *          
ET0004*--------------------------------------------------------------*          
ET0004 3400-OPEN-TRNFR-INIT.                                                    
           EXEC SQL                                                             
              OPEN TFRINI_CSR                                                   
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR                                            
           END-IF.                                                              
ET0004*                                                                         
ET0004*--------------------------------------------------------------*          
ET0004*   FETCH INITIAL TRANSFER CURSOR TBL                          *          
ET0004*--------------------------------------------------------------*          
ET0004 3500-FETCH-TRNFR-INIT.                                                   
           EXEC SQL                                                             
              FETCH                                                             
                  TFRINI_CSR                                                    
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
              SET ACAT13-NORMAL  TO TRUE                                        
              PERFORM 0210-SETUP-INIT-TFR-COMMAREA                              
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT13-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR                                            
           END-IF.                                                              
ET0004*                                                                         
ET0004*--------------------------------------------------------------*          
ET0004*   CLOSE INITIAL TRANSFER CURSOR TBL                          *          
ET0004*--------------------------------------------------------------*          
ET0004 3600-CLOSE-TRNFR-INIT.                                                   
           EXEC SQL                                                             
              CLOSE TFRINI_CSR                                                  
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR                                            
           END-IF.                                                              
ET0004*                                                                         
ET0004*--------------------------------------------------------------*          
ET0004*    OPEN INITIAL TRANSFER CURSOR TBL IN DESCENING ORDER       *          
ET0004*--------------------------------------------------------------*          
ET0004 3700-OPEN-TRNFR-INIT-DESC.                                               
           EXEC SQL                                                             
              OPEN TFRINI_DESC                                                  
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR                                            
           END-IF.                                                              
ET0004*                                                                         
ET0004*--------------------------------------------------------------*          
ET0004*   FETCH INITIAL TRANSFER CURSOR TBL IN DESCENING ORDER       *          
ET0004*--------------------------------------------------------------*          
ET0004 3800-FETCH-TRNFR-INIT-DESC.                                              
           EXEC SQL                                                             
              FETCH                                                             
                  TFRINI_DESC                                                   
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
              SET ACAT13-NORMAL  TO TRUE                                        
              PERFORM 0210-SETUP-INIT-TFR-COMMAREA                              
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT13-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR                                            
           END-IF.                                                              
ET0004*                                                                         
ET0004*--------------------------------------------------------------*          
ET0004*   CLOSE INITIAL TRANSFER CURSOR TBL IN DESCENING ORDER       *          
ET0004*--------------------------------------------------------------*          
ET0004 3900-CLOSE-TRNFR-INIT-DESC.                                              
           EXEC SQL                                                             
              CLOSE TFRINI_DESC                                                 
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR                                            
           END-IF.                                                              
ET0006*                                                                         
ET0006*--------------------------------------------------------------*          
ET0006*   OPEN INIT TRNFR CURSOR TO SEARCH FRV ASSETS                *          
ET0006*--------------------------------------------------------------*          
ET0006 4000-OPN-INIT-TRNFR-FOR-FRV.                                             
           EXEC SQL                                                             
              OPEN TFRINI2_CSR                                                  
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR                                            
           END-IF.                                                              
ET0006*                                                                         
ET0006*--------------------------------------------------------------*          
ET0006*  FETCH INIT TRNFR CURSOR TO SEARCH FRV ASSETS                *          
ET0006*--------------------------------------------------------------*          
ET0006 4100-FET-INIT-TRNFR-FOR-FRV.                                             
           EXEC SQL                                                             
              FETCH                                                             
                  TFRINI2_CSR                                                   
              INTO                                                              
                 :DCLACTITRF.CLIENT-NBR                                         
                ,:DCLACTITRF.RCV-NBR                                            
                ,:DCLACTITRF.DLVR-NBR                                           
                ,:DCLACTITRF.ACCT-DLVR-NBR                                      
                ,:DCLACTITRF.ACCT-RCV-NBR                                       
                ,:DCLACTITRF.ACAT-CONTROL-NBR                                   
                ,:DCLACTITRF.TRANS-RFRN-ID-CD                                   
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL TO TRUE                                         
              MOVE CLIENT-NBR    OF DCLACTITRF TO ACAT13-TFR-CLT                
              MOVE RCV-NBR       OF DCLACTITRF TO ACAT13-TFR-RCV                
              MOVE DLVR-NBR      OF DCLACTITRF TO ACAT13-TFR-DLVR               
              MOVE ACCT-DLVR-NBR OF DCLACTITRF TO ACAT13-TFR-DLVR-ACCT          
              MOVE ACCT-RCV-NBR  OF DCLACTITRF TO ACAT13-TFR-RCV-ACCT           
              MOVE ACAT-CONTROL-NBR OF DCLACTITRF TO ACAT13-TFR-ACAT            
              MOVE TRANS-RFRN-ID-CD OF DCLACTITRF TO ACAT13-TFR-RFRN-ID         
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT13-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR                                            
           END-IF.                                                              
ET0006*                                                                         
ET0006*--------------------------------------------------------------*          
ET0006*  CLOSE INIT TRNFR CURSOR TO SEARCH FRV ASSETS                *          
ET0006*--------------------------------------------------------------*          
ET0006 4200-CLO-INIT-TRNFR-FOR-FRV.                                             
           EXEC SQL                                                             
              CLOSE TFRINI2_CSR                                                 
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR                                            
           END-IF.                                                              
       EJECT                                                                    
ET0006*                                                                         
ET0006*--------------------------------------------------------------*          
ET0006*   OPEN INIT TRNFR CURSOR TABLE TO SEARCH FRV ASSETS          *          
ET0006*--------------------------------------------------------------*          
ET0006 4300-OPN-INIT-ASSET-FOR-FRV.                                             
           EXEC SQL                                                             
              OPEN AST_INI3_CSR                                                 
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR                                            
           END-IF.                                                              
       EJECT                                                                    
ET0006*                                                                         
ET0006*--------------------------------------------------------------*          
ET0006*  FETCH INIT TRNFR CURSOR TABLE TO SEARCH FRV ASSETS          *          
ET0006*--------------------------------------------------------------*          
ET0006 4400-FET-INIT-ASSET-FOR-FRV.                                             
           EXEC SQL                                                             
              FETCH                                                             
                  AST_INI3_CSR                                                  
              INTO                                                              
                 :DCLACTIAST.CLIENT-NBR                                         
                ,:DCLACTIAST.ACCT-DLVR-NBR                                      
                ,:DCLACTIAST.ACCT-RCV-NBR                                       
                ,:DCLACTIAST.ACAT-CONTROL-NBR                                   
                ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                                  
                ,:DCLACTIAST.CSH-MGN-SHRT-CD                                    
                ,:DCLACTIAST.SECURITY-ADP-NBR                                   
                ,:DCLACTIAST.TRANS-RFRN-ID-CD                                   
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
              MOVE ACAT-CONTROL-NBR    OF DCLACTIAST TO ACAT13-AST-ACAT         
              MOVE ISIN-SEC-ISSUE-CD   OF DCLACTIAST TO ACAT13-AST-SEC          
              MOVE CSH-MGN-SHRT-CD  OF DCLACTIAST TO ACAT13-AST-CS-MG-SH        
              MOVE SECURITY-ADP-NBR OF DCLACTIAST TO ACAT13-AST-ADP-NBR         
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT13-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR                                            
           END-IF.                                                              
       EJECT                                                                    
ET0006*                                                                         
ET0006*--------------------------------------------------------------*          
ET0006*  CLOSE INIT TRNFR CURSOR TABLE TO SEARCH FRV ASSETS          *          
ET0006*--------------------------------------------------------------*          
ET0006 4500-CLO-INIT-ASSET-FOR-FRV.                                             
           EXEC SQL                                                             
              CLOSE AST_INI3_CSR                                                
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR                                            
           END-IF.                                                              
       EJECT                                                                    
ET0006*                                                                         
ET0006*--------------------------------------------------------------*          
ET0006*   OPEN TRANSFER CURSOR TBL TO SEARCH FRV ASSETS              *          
ET0006*--------------------------------------------------------------*          
ET0006 4600-OPN-TRNFR-FOR-FRV-ASSETS.                                           
           EXEC SQL                                                             
              OPEN TRNFR_CSR                                                    
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR                                            
           END-IF.                                                              
ET0006*                                                                         
ET0006*--------------------------------------------------------------*          
ET0006*  FETCH TRANSFER CURSOR TBL TO SEARCH FRV ASSETS              *          
ET0006*--------------------------------------------------------------*          
ET0006 4700-FET-TRNFR-FOR-FRV-ASSETS.                                           
           EXEC SQL                                                             
              FETCH                                                             
                  TRNFR_CSR                                                     
              INTO                                                              
                 :DCLVTRNFR.CLIENT-NBR                                          
                ,:DCLVTRNFR.ACAT-CONTROL-NBR                                    
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
              MOVE CLIENT-NBR       OF DCLVTRNFR TO ACAT13-TFR-CLT              
              MOVE ACAT-CONTROL-NBR OF DCLVTRNFR TO ACAT13-TFR-ACAT             
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT13-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR                                            
           END-IF.                                                              
ET0006*                                                                         
ET0006*--------------------------------------------------------------*          
ET0006*  CLOSE TRANSFER CURSOR TBL TO SEARCH FRV ASSETS              *          
ET0006*--------------------------------------------------------------*          
ET0006 4800-CLO-TRNFR-FOR-FRV-ASSETS.                                           
           EXEC SQL                                                             
              CLOSE TRNFR_CSR                                                   
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR                                            
           END-IF.                                                              
       EJECT                                                                    
ET0008*                                                                         
ET0008*--------------------------------------------------------------*          
ET0008*   OPEN INITIAL TRANSFER CURSOR TBL FOR ALL FRVS              *          
ET0008*--------------------------------------------------------------*          
ET0008 4900-OPEN-ALL-INITRN.                                                    
           EXEC SQL                                                             
              OPEN INITRN_CSR                                                   
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT13-ERROR     TO TRUE                                      
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR                                            
           END-IF.                                                              
       EJECT                                                                    
ET0008*                                                                         
ET0008*--------------------------------------------------------------*          
ET0008*  FETCH INITIAL TRANSFER CURSOR TBL FOR ALL FRVS              *          
ET0008*--------------------------------------------------------------*          
ET0008 5000-FETCH-ALL-INITRN.                                                   
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
              SET ACAT13-NORMAL  TO TRUE                                        
              PERFORM 0210-SETUP-INIT-TFR-COMMAREA                              
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT13-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
ET0008*                                                                         
ET0008*--------------------------------------------------------------*          
ET0008*  CLOSE INITIAL TRANSFER CURSOR TBL FOR ALL FRVS              *          
ET0008*--------------------------------------------------------------*          
ET0008 5100-CLOSE-ALL-INITRN.                                                   
           EXEC SQL                                                             
              CLOSE INITRN_CSR                                                  
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
ET0008*                                                                         
ET0008*--------------------------------------------------------------*          
ET0008*   OPEN INITIAL TRANSFER CURSOR TBL FOR ALL FRVS IN DESC      *          
ET0008*--------------------------------------------------------------*          
ET0008 5200-OPEN-ALL-INITRN-DESC.                                               
           EXEC SQL                                                             
              OPEN INITRN_CSR_DESC                                              
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT13-ERROR     TO TRUE                                      
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR                                            
           END-IF.                                                              
       EJECT                                                                    
ET0008*                                                                         
ET0008*--------------------------------------------------------------*          
ET0008*  FETCH INITIAL TRANSFER CURSOR TBL FOR ALL FRVS IN DESC      *          
ET0008*--------------------------------------------------------------*          
ET0008 5300-FETCH-ALL-INITRN-DESC.                                              
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
              SET ACAT13-NORMAL  TO TRUE                                        
              PERFORM 0210-SETUP-INIT-TFR-COMMAREA                              
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT13-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
ET0008*                                                                         
ET0008*--------------------------------------------------------------*          
ET0008*  CLOSE INITIAL TRANSFER CURSOR TBL FOR ALL FRVS IN DESC      *          
ET0008*--------------------------------------------------------------*          
ET0008 5400-CLOSE-ALL-INITRN-DESC.                                              
           EXEC SQL                                                             
              CLOSE INITRN_CSR_DESC                                             
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *     UPDATE INITIAL TRANSFER NSCC_PEND_IND                    *          
      *         SPACE = READY TO GO TO NSCC                          *          
      *         'H'   = HOLD TO SEND TO NSCC                         *          
      *         'Y'   = SENT TO NSCC                                 *          
      *--------------------------------------------------------------*          
       7000-UPDATE-TFR-NSCC-PEND.                                               
           EXEC SQL                                                             
ET0003       UPDATE ACTITRF                                                     
                SET NSCC_PEND_CD = :WS-NSCC-PEND-CD                             
              WHERE CLIENT_NBR = :ACAT13-PASS-CLT          AND                  
                    DLVR_NBR = :ACAT13-PASS-DLVR-NBR       AND                  
                    ACCT_DLVR_NBR = :ACAT13-PASS-ACCT-DLV  AND                  
                    RCV_NBR = :ACAT13-PASS-CON-BRKR        AND                  
                    ACCT_RCV_NBR = :ACAT13-PASS-CON-ACCT   AND                  
                    DSTBN_SIDE_CD = 'D'                    AND                  
                    TRNFR_TYPE_CD = 'FRV'                                       
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT13-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
      *                                                                         
      *--------------------------------------------------------------*          
      *     UPDATE INITIAL ASSET NSCC_PEND_IND                       *          
      *         SPACE = READY TO GO TO NSCC                          *          
      *         'H'   = HOLD TO SEND TO NSCC                         *          
      *         'Y'   = SENT TO NSCC                                 *          
      *--------------------------------------------------------------*          
       7100-UPDATE-ASSET-NSCC-PEND.                                             
           EXEC SQL                                                             
ET0003       UPDATE ACTIAST                                                     
                SET NSCC_PEND_CD = :WS-NSCC-PEND-CD                             
              WHERE CLIENT_NBR = :ACAT13-PASS-CLT             AND               
ET0004**            TRANS_RFRN_ID_CD = :ACAT13-PASS-ACCT-DLV  AND               
ET0004              ACCT_DLVR_NBR    = :ACAT13-PASS-ACCT-DLV  AND               
                    TRNFR_TYPE_CD = 'FRV'                     AND               
                    TRANS_TYPE_CD = 'A'                                         
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT13-NORMAL  TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT13-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT13-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT13-SQLCODE                                   
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
           MOVE 'ACAT13DB' TO CALLING-PROGRAM-ID.                               
           MOVE SQLCA      TO SQLCA-AREA.                                       
           EXEC CICS LINK PROGRAM('FPDB2LOG')                                   
                COMMAREA(WS-ERR-DATA)                                           
                LENGTH(LENGTH OF WS-ERR-DATA)                                   
                NOHANDLE                                                        
           END-EXEC.                                                            
       EJECT                                                                    
                                                                                
       HANG-CICS.                                                               
           GOBACK.                                                              
