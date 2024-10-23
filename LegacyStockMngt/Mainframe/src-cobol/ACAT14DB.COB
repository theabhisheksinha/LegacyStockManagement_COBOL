000001* PDX    - ACAT14DB C0360817 12/16/14 10:19:29 TBLAMUR            00001000
000001* PDX    - ACAT14DB C0275063 01/09/09 11:17:59 TBLAMUR            00001000
000001* PDX    - ACAT14DB C0233602 04/10/06 14:11:47 TBLAMUR            00001000
000001* PDX    - ACAT14DB C0215192 01/21/05 11:02:41 TBEDTAK            00001000
000001* PDX    - ACAT14DB C0149052 10/24/00 13:02:18 TBLAMUR            00001000
000001* PDX    - ACAT14DB C0142755 08/28/00 10:51:30 TBDOJUN            00001000
000001* PDX    - ACAT14DB C0122848 03/11/99 17:52:12 TBEDTAK            00001000
000001* PDX    - ACAT14DB C0120330 01/14/99 16:01:23 TBEDTAK            00001000
000001* PDX    - ACAT14DB C0119329 12/23/98 16:18:45 TBEDTAK            00001000
000001* PDX    - ACAT14DB C0117817 12/08/98 11:37:31 TBEDTAK            00001000
000001* PDX    - ACAT14DB C0109165 10/27/98 16:06:55 TBEDTAK            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    ACAT14DB.                                                 
       AUTHOR.  E.TAKAESU.                                                      
      *REMARKS.                                                                 
      *****************************************************************         
      *       DB2 I/O PROGRAM FOR A DELIVERER RESIDUAL CREDIT         *         
      *****************************************************************         
DJ0001* 08/28/00 DJ0001 SSR# R52580 UPDATE AMOUNT AND QUANTITY FIELDS           
ET0001* JAN.2005 DB2 INITIAL TABLE KEY CHANGE WITH NEW TABLE NAME               
LRM003* SSR 40661 RETAIN USER ID OF INITIATOR.                                  
LRM005* SSR 60245 SELECT WITHHELD INDICATOR                                     
LRM047* SSR 99150 CONTRA CUSIP SUBMIT WARNING                                   
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
           03  WS-PASSED-DLVR-NBR              PIC X(04).                       
           03  WS-PASSED-DLVR-ACCT             PIC X(20).                       
           03  WS-PASSED-RCV-NBR               PIC X(04).                       
           03  WS-PASSED-RCV-ACCT              PIC X(20).                       
           03  WS-PASSED-BR-MASK               PIC X(05).                       
           03  WS-PASSED-RR                    PIC X(03).                       
           03  WS-PASSED-REASON                PIC X(02).                       
           03  WS-PASSED-CMNTS                 PIC X(120).                      
           03  WS-PASSED-NSCC-PEND             PIC X(01).                       
           03  WS-PASSED-CNTRY                 PIC X(02).                       
           03  WS-PASSED-SEC                   PIC X(09).                       
           03  WS-PASSED-SEC-CDG               PIC X(01).                       
           03  WS-PASSED-STTL-LOC              PIC X(02).                       
           03  WS-PASSED-CS-MG-SH              PIC X(01).                       
           03  WS-PASSED-TERMID                PIC X(04).                       
           03  WS-PASSED-ACAT                  PIC X(14).                       
DJ0001     02  WS-PASSED-AMT                   USAGE COMP-2.                    
DJ0001     02  WS-PASSED-QTY                   USAGE COMP-2.                    
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *    INITIAL TRANSFER REQUEST TABLE                              *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
ET0001**      INCLUDE VINITRNF                                                  
ET0001        INCLUDE ACTITRF                                                   
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *    INITIAL ASSET TABLE                                         *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
ET0001**      INCLUDE VINITAST                                                  
ET0001        INCLUDE ACTIAST                                                   
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *     ACTIVE TRANSFER TABLE                                      *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              INCLUDE VTRNFR                                                    
           END-EXEC.                                                            
       EJECT                                                                    
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
      *         INITIAL TRANSFER DECLARE CURSOR STATEMENT              *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  TFRCSR  CURSOR FOR                                       
                  SELECT                                                        
                     CLIENT_NBR                                                 
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
                  FROM                                                          
ET0001               ACTITRF                                                    
                  WHERE                                                         
                     CLIENT_NBR              = :WS-PASSED-CLT                   
                     AND  (ACCT_DLVR_NBR    >= :WS-PASSED-DLVR-ACCT)            
                     AND  RR_CD           LIKE :WS-PASSED-RR                    
                     AND  RCV_NBR         LIKE :WS-PASSED-RCV-NBR               
                     AND  TRNFR_TYPE_CD      = 'RCR'                            
                     AND  (NOT NSCC_PEND_CD  = 'Y')                             
                     AND  DSTBN_SIDE_CD      = 'D'                              
                  ORDER BY                                                      
                     ACCT_DLVR_NBR                                              
                    ,RCV_NBR                                                    
                    ,ACCT_RCV_NBR                                               
           END-EXEC.                                                            
           EJECT                                                                
      *                                                                         
      *----------------------------------------------------------------*        
      *   INIT TRANSFER DECLARE CURSOR STATMENT IN DESCENDING ORDER    *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  TFRCSRD  CURSOR FOR                                      
                  SELECT                                                        
                     CLIENT_NBR                                                 
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
                  FROM                                                          
ET0001               ACTITRF                                                    
                  WHERE                                                         
                     CLIENT_NBR              = :WS-PASSED-CLT                   
                     AND  (ACCT_DLVR_NBR    >= :WS-PASSED-DLVR-ACCT)            
                     AND  RR_CD           LIKE :WS-PASSED-RR                    
                     AND  RCV_NBR         LIKE :WS-PASSED-RCV-NBR               
                     AND  TRNFR_TYPE_CD      = 'RCR'                            
                     AND  (NOT NSCC_PEND_CD  = 'Y')                             
                     AND  DSTBN_SIDE_CD      = 'D'                              
                  ORDER BY                                                      
                     ACCT_DLVR_NBR  DESC                                        
                    ,RCV_NBR        DESC                                        
                    ,ACCT_RCV_NBR   DESC                                        
           END-EXEC.                                                            
           EJECT                                                                
      *                                                                         
      *----------------------------------------------------------------*        
      *         INITIAL ASSET DECLARE CURSOR STATEMENT                 *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  ASTCRSR CURSOR FOR                                       
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
                  FROM                                                          
ET0001               ACTIAST                                                    
                  WHERE                                                         
                     CLIENT_NBR         = :WS-PASSED-CLT                        
                     AND  ACCT_DLVR_NBR = :WS-PASSED-DLVR-ACCT                  
                     AND  RCV_NBR       = :WS-PASSED-RCV-NBR                    
                     AND  ACCT_RCV_NBR  = :WS-PASSED-RCV-ACCT                   
                     AND  TRNFR_TYPE_CD = 'RCR'                                 
                  ORDER BY                                                      
                     ISIN_SEC_ISSUE_CD                                          
                    ,STTLM_LCTN_CD                                              
                    ,CSH_MGN_SHRT_CD                                            
           END-EXEC.                                                            
           EJECT                                                                
      *                                                                         
      *----------------------------------------------------------------*        
      *          ACTIVE ASSET DECLARE CURSOR STATEMENT                 *        
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
                     CLIENT_NBR            = :WS-PASSED-CLT                     
                     AND  ACAT_CONTROL_NBR = :WS-PASSED-ACAT                    
                  ORDER BY                                                      
                     ASSET_SEQ_NBR                                              
           END-EXEC.                                                            
      *                                                                         
       LINKAGE SECTION.                                                         
       01  DFHCOMMAREA.                                                         
       COPY ACAT14IO.                                                           
       EJECT                                                                    
      *                                                                         
       PROCEDURE DIVISION.                                                      
           MOVE ACAT14-PASS-FLDS TO WS-PASSED-DATA-AREA.                        
           EXEC SQL                                                             
              SET :WS-TIMESTAMP = CURRENT TIMESTAMP                             
           END-EXEC.                                                            
      *                                                                         
           EVALUATE TRUE                                                        
              WHEN ACAT14-OPN-TFRCSR                                            
                   PERFORM OPEN-TFR-CURSOR                                      
              WHEN ACAT14-FET-TFRCSR                                            
                   PERFORM FETCH-TFR-CURSOR                                     
              WHEN ACAT14-CLO-TFRCSR                                            
                   PERFORM CLOSE-TFR-CURSOR                                     
              WHEN ACAT14-OPN-TFRCSR-D                                          
                   PERFORM OPEN-TFR-CURSOR-D                                    
              WHEN ACAT14-FET-TFRCSR-D                                          
                   PERFORM FETCH-TFR-CURSOR-D                                   
              WHEN ACAT14-CLO-TFRCSR-D                                          
                   PERFORM CLOSE-TFR-CURSOR-D                                   
              WHEN ACAT14-OPN-ASTCRSR                                           
                   PERFORM OPEN-AST-CURSOR                                      
              WHEN ACAT14-FET-ASTCRSR                                           
                   PERFORM FETCH-AST-CURSOR                                     
              WHEN ACAT14-CLO-ASTCRSR                                           
                   PERFORM CLOSE-AST-CURSOR                                     
              WHEN ACAT14-UPD-TFRINI                                            
                   PERFORM UPDATE-INITIAL-TFR                                   
              WHEN ACAT14-UPD-ASTINI                                            
                   PERFORM UPDATE-INITIAL-ASSET                                 
              WHEN ACAT14-UPD-ASTSUB                                            
                   PERFORM UPDATE-INITIAL-ASSET                                 
              WHEN ACAT14-GET-TFRINI                                            
                   PERFORM GET-INITIAL-TRANSFER                                 
              WHEN ACAT14-CNT-ASTINI                                            
                   PERFORM COUNT-INITIAL-ASSET                                  
DJ0001        WHEN ACAT14-CNT-ASTINI-NONZERO                                    
DJ0001             PERFORM COUNT-INITIAL-ASSET-NONZERO                          
              WHEN ACAT14-GET-TRANSFER                                          
                   PERFORM GET-ACTIVE-TRANSFER                                  
              WHEN ACAT14-OPN-ASSET                                             
                   PERFORM OPEN-ACTIVE-ASSET-TBL                                
              WHEN ACAT14-FET-ASSET                                             
                   PERFORM FETCH-ACTIVE-ASSET-TBL                               
              WHEN ACAT14-CLO-ASSET                                             
                   PERFORM CLOSE-ACTIVE-ASSET-TBL                               
           END-EVALUATE.                                                        
                                                                                
           EXEC CICS RETURN                                                     
           END-EXEC.                                                            
       EJECT                                                                    
                                                                                
      *                                                                         
      *--------------------------------------------------------------*          
      *          OPEN INITIAL TRANSFER CURSOR TABLE                  *          
      *--------------------------------------------------------------*          
       OPEN-TFR-CURSOR.                                                         
           EXEC SQL                                                             
              OPEN TFRCSR                                                       
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT14-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT14-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT14-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          FETCH INITIAL TRANSFER TABLE                        *          
      *--------------------------------------------------------------*          
       FETCH-TFR-CURSOR.                                                        
           EXEC SQL                                                             
              FETCH                                                             
                  TFRCSR                                                        
              INTO                                                              
ET0001           :DCLACTITRF.CLIENT-NBR                                         
ET0001          ,:DCLACTITRF.DLVR-NBR                                           
ET0001          ,:DCLACTITRF.ACCT-DLVR-NBR                                      
ET0001          ,:DCLACTITRF.RCV-NBR                                            
ET0001          ,:DCLACTITRF.ACCT-RCV-NBR                                       
ET0001          ,:DCLACTITRF.TRNFR-TYPE-CD                                      
ET0001          ,:DCLACTITRF.RCV-NBR-STTS-CD                                    
ET0001          ,:DCLACTITRF.DLVR-NBR-STTS-CD                                   
ET0001          ,:DCLACTITRF.ACCT-RCV-STTS-CD                                   
ET0001          ,:DCLACTITRF.ACCT-DLVR-STTS-CD                                  
ET0001          ,:DCLACTITRF.SBMTG-PRTCP-NBR                                    
ET0001          ,:DCLACTITRF.SBMT-PRT-NR-STS-CD                                 
ET0001          ,:DCLACTITRF.ACAT-CONTROL-NBR                                   
ET0001          ,:DCLACTITRF.CONTROL-NBR-STS-CD                                 
ET0001          ,:DCLACTITRF.TRNFR-TYPE-STTS-CD                                 
ET0001          ,:DCLACTITRF.TRANS-TYPE-CD                                      
ET0001          ,:DCLACTITRF.TRANS-TYPE-STTS-CD                                 
ET0001          ,:DCLACTITRF.RCV-CUST-NM                                        
ET0001          ,:DCLACTITRF.RCV-CUST-NM-STS-CD                                 
ET0001          ,:DCLACTITRF.RCV-SS-PRIM-NBR                                    
ET0001          ,:DCLACTITRF.RCV-SS-PRIM-STS-CD                                 
ET0001          ,:DCLACTITRF.RCV-SS-SCNDY-NBR                                   
ET0001          ,:DCLACTITRF.RCV-SS-SCDY-STS-CD                                 
ET0001          ,:DCLACTITRF.RCV-ACCT-TYPE-CD                                   
ET0001          ,:DCLACTITRF.RCV-ACT-TYP-STS-CD                                 
ET0001          ,:DCLACTITRF.RCV-OCC-BRKR-NBR                                   
ET0001          ,:DCLACTITRF.RCV-OCC-STTS-CD                                    
ET0001          ,:DCLACTITRF.RCV-CRSPN-NBR                                      
ET0001          ,:DCLACTITRF.RCV-CRSPN-STTS-CD                                  
ET0001          ,:DCLACTITRF.ACAT-CNTL-ASTD-NBR                                 
ET0001          ,:DCLACTITRF.CNTL-ASTD-STTS-CD                                  
ET0001          ,:DCLACTITRF.CMNT-TXT                                           
ET0001          ,:DCLACTITRF.CMNT-STTS-CD                                       
ET0001          ,:DCLACTITRF.PRCS-DT                                            
ET0001          ,:DCLACTITRF.STTS-CD                                            
ET0001          ,:DCLACTITRF.DSTBN-SIDE-CD                                      
ET0001          ,:DCLACTITRF.SYS-ACT-CD                                         
ET0001          ,:DCLACTITRF.SYS-RJCT-RSN-CD                                    
ET0001          ,:DCLACTITRF.TRNFR-TYPE-RJCT-CD                                 
ET0001          ,:DCLACTITRF.TRNFR-TYPE-RJC1-CD                                 
ET0001          ,:DCLACTITRF.TRNFR-TYPE-RJC2-CD                                 
ET0001          ,:DCLACTITRF.TRN-TYP-RJC-STS-CD                                 
ET0001          ,:DCLACTITRF.PHSCL-SEQ-NBR                                      
ET0001          ,:DCLACTITRF.PHSCL-SEQ-STTS-CD                                  
ET0001          ,:DCLACTITRF.LGCL-SEQ-NBR                                       
ET0001          ,:DCLACTITRF.LGCL-SEQ-NR-STS-CD                                 
ET0001          ,:DCLACTITRF.PRTCP-CONTRA-CD                                    
ET0001          ,:DCLACTITRF.CYCLE-CD                                           
ET0001          ,:DCLACTITRF.DAYS-STTS-QTY                                      
ET0001          ,:DCLACTITRF.TRANS-RFRN-ID-CD                                   
ET0001          ,:DCLACTITRF.TRANS-RFRN-STTS-CD                                 
ET0001          ,:DCLACTITRF.DB-CR-CD                                           
ET0001          ,:DCLACTITRF.STTLM-ASCTD-DT                                     
ET0001          ,:DCLACTITRF.STTLM-ASCTD-STS-CD                                 
ET0001          ,:DCLACTITRF.RCRD-LNGTH-STTS-CD                                 
ET0001          ,:DCLACTITRF.RCRD-STTS-CD                                       
ET0001          ,:DCLACTITRF.NSCC-PEND-CD                                       
ET0001          ,:DCLACTITRF.NSCC-ACK-IND                                       
ET0001          ,:DCLACTITRF.UPDT-TMSTP                                         
ET0001          ,:DCLACTITRF.CRT-TMSTP                                          
ET0001          ,:DCLACTITRF.CICS-TERM-ID-CD                                    
ET0001          ,:DCLACTITRF.PRGM-NM                                            
ET0001          ,:DCLACTITRF.RR-CD                                              
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT14-NORMAL  TO TRUE                                        
              PERFORM SETUP-TRANSFER-COMMAREA                                   
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT14-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT14-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT14-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *         CLOSE INITIAL TRANSFER CURSOR TABLE                  *          
      *--------------------------------------------------------------*          
       CLOSE-TFR-CURSOR.                                                        
           EXEC SQL                                                             
              CLOSE TFRCSR                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT14-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT14-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT14-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *      OPEN INIT TRANSFER CURSOR IN DESCENDING ORDER           *          
      *--------------------------------------------------------------*          
       OPEN-TFR-CURSOR-D.                                                       
           EXEC SQL                                                             
              OPEN TFRCSRD                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT14-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT14-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT14-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
                                                                                
      *                                                                         
      *--------------------------------------------------------------*          
      *     FETCH INIT TRANSFER CURSOR IN DESCENDING ORDER           *          
      *--------------------------------------------------------------*          
       FETCH-TFR-CURSOR-D.                                                      
           EXEC SQL                                                             
              FETCH                                                             
                  TFRCSRD                                                       
              INTO                                                              
ET0001           :DCLACTITRF.CLIENT-NBR                                         
ET0001          ,:DCLACTITRF.DLVR-NBR                                           
ET0001          ,:DCLACTITRF.ACCT-DLVR-NBR                                      
ET0001          ,:DCLACTITRF.RCV-NBR                                            
ET0001          ,:DCLACTITRF.ACCT-RCV-NBR                                       
ET0001          ,:DCLACTITRF.TRNFR-TYPE-CD                                      
ET0001          ,:DCLACTITRF.RCV-NBR-STTS-CD                                    
ET0001          ,:DCLACTITRF.DLVR-NBR-STTS-CD                                   
ET0001          ,:DCLACTITRF.ACCT-RCV-STTS-CD                                   
ET0001          ,:DCLACTITRF.ACCT-DLVR-STTS-CD                                  
ET0001          ,:DCLACTITRF.SBMTG-PRTCP-NBR                                    
ET0001          ,:DCLACTITRF.SBMT-PRT-NR-STS-CD                                 
ET0001          ,:DCLACTITRF.ACAT-CONTROL-NBR                                   
ET0001          ,:DCLACTITRF.CONTROL-NBR-STS-CD                                 
ET0001          ,:DCLACTITRF.TRNFR-TYPE-STTS-CD                                 
ET0001          ,:DCLACTITRF.TRANS-TYPE-CD                                      
ET0001          ,:DCLACTITRF.TRANS-TYPE-STTS-CD                                 
ET0001          ,:DCLACTITRF.RCV-CUST-NM                                        
ET0001          ,:DCLACTITRF.RCV-CUST-NM-STS-CD                                 
ET0001          ,:DCLACTITRF.RCV-SS-PRIM-NBR                                    
ET0001          ,:DCLACTITRF.RCV-SS-PRIM-STS-CD                                 
ET0001          ,:DCLACTITRF.RCV-SS-SCNDY-NBR                                   
ET0001          ,:DCLACTITRF.RCV-SS-SCDY-STS-CD                                 
ET0001          ,:DCLACTITRF.RCV-ACCT-TYPE-CD                                   
ET0001          ,:DCLACTITRF.RCV-ACT-TYP-STS-CD                                 
ET0001          ,:DCLACTITRF.RCV-OCC-BRKR-NBR                                   
ET0001          ,:DCLACTITRF.RCV-OCC-STTS-CD                                    
ET0001          ,:DCLACTITRF.RCV-CRSPN-NBR                                      
ET0001          ,:DCLACTITRF.RCV-CRSPN-STTS-CD                                  
ET0001          ,:DCLACTITRF.ACAT-CNTL-ASTD-NBR                                 
ET0001          ,:DCLACTITRF.CNTL-ASTD-STTS-CD                                  
ET0001          ,:DCLACTITRF.CMNT-TXT                                           
ET0001          ,:DCLACTITRF.CMNT-STTS-CD                                       
ET0001          ,:DCLACTITRF.PRCS-DT                                            
ET0001          ,:DCLACTITRF.STTS-CD                                            
ET0001          ,:DCLACTITRF.DSTBN-SIDE-CD                                      
ET0001          ,:DCLACTITRF.SYS-ACT-CD                                         
ET0001          ,:DCLACTITRF.SYS-RJCT-RSN-CD                                    
ET0001          ,:DCLACTITRF.TRNFR-TYPE-RJCT-CD                                 
ET0001          ,:DCLACTITRF.TRNFR-TYPE-RJC1-CD                                 
ET0001          ,:DCLACTITRF.TRNFR-TYPE-RJC2-CD                                 
ET0001          ,:DCLACTITRF.TRN-TYP-RJC-STS-CD                                 
ET0001          ,:DCLACTITRF.PHSCL-SEQ-NBR                                      
ET0001          ,:DCLACTITRF.PHSCL-SEQ-STTS-CD                                  
ET0001          ,:DCLACTITRF.LGCL-SEQ-NBR                                       
ET0001          ,:DCLACTITRF.LGCL-SEQ-NR-STS-CD                                 
ET0001          ,:DCLACTITRF.PRTCP-CONTRA-CD                                    
ET0001          ,:DCLACTITRF.CYCLE-CD                                           
ET0001          ,:DCLACTITRF.DAYS-STTS-QTY                                      
ET0001          ,:DCLACTITRF.TRANS-RFRN-ID-CD                                   
ET0001          ,:DCLACTITRF.TRANS-RFRN-STTS-CD                                 
ET0001          ,:DCLACTITRF.DB-CR-CD                                           
ET0001          ,:DCLACTITRF.STTLM-ASCTD-DT                                     
ET0001          ,:DCLACTITRF.STTLM-ASCTD-STS-CD                                 
ET0001          ,:DCLACTITRF.RCRD-LNGTH-STTS-CD                                 
ET0001          ,:DCLACTITRF.RCRD-STTS-CD                                       
ET0001          ,:DCLACTITRF.NSCC-PEND-CD                                       
ET0001          ,:DCLACTITRF.NSCC-ACK-IND                                       
ET0001          ,:DCLACTITRF.UPDT-TMSTP                                         
ET0001          ,:DCLACTITRF.CRT-TMSTP                                          
ET0001          ,:DCLACTITRF.CICS-TERM-ID-CD                                    
ET0001          ,:DCLACTITRF.PRGM-NM                                            
ET0001          ,:DCLACTITRF.RR-CD                                              
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT14-NORMAL  TO TRUE                                        
              PERFORM SETUP-TRANSFER-COMMAREA                                   
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT14-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT14-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT14-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
                                                                                
      *                                                                         
      *--------------------------------------------------------------*          
      *     CLOSE INIT TRANSFER CURSOR IN DESCENDING ORDER           *          
      *--------------------------------------------------------------*          
       CLOSE-TFR-CURSOR-D.                                                      
           EXEC SQL                                                             
              CLOSE TFRCSRD                                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT14-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT14-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT14-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *      SETUP INITIAL TRANSFER TBL FIELDS OF ACAT14-COMMAREA    *          
      *--------------------------------------------------------------*          
       SETUP-TRANSFER-COMMAREA.                                                 
           INITIALIZE ACAT14-TRANSFER.                                          
ET0001     MOVE CLIENT-NBR       OF DCLACTITRF                                  
             TO ACAT14-TFR-CLT.                                                 
ET0001     MOVE DLVR-NBR         OF DCLACTITRF                                  
             TO ACAT14-TFR-DLVR-NBR.                                            
ET0001     MOVE ACCT-DLVR-NBR    OF DCLACTITRF                                  
             TO ACAT14-TFR-DLVR-ACCT.                                           
ET0001     MOVE RCV-NBR          OF DCLACTITRF                                  
             TO ACAT14-TFR-RCV-NBR.                                             
ET0001     MOVE ACCT-RCV-NBR     OF DCLACTITRF                                  
             TO ACAT14-TFR-RCV-ACCT.                                            
ET0001     MOVE STTS-CD          OF DCLACTITRF                                  
             TO ACAT14-TFR-STTS.                                                
ET0001     MOVE RCV-ACCT-TYPE-CD OF DCLACTITRF                                  
             TO ACAT14-TFR-ACCT-TYPE.                                           
ET0001     MOVE RCV-CUST-NM      OF DCLACTITRF                                  
             TO ACAT14-TFR-NAME.                                                
ET0001     MOVE RCV-SS-PRIM-NBR  OF DCLACTITRF                                  
             TO ACAT14-TFR-SS1.                                                 
ET0001     MOVE RCV-SS-SCNDY-NBR OF DCLACTITRF                                  
             TO ACAT14-TFR-SS2.                                                 
ET0001     MOVE RR-CD            OF DCLACTITRF                                  
             TO ACAT14-TFR-RR.                                                  
ET0001     MOVE TRNFR-TYPE-CD    OF DCLACTITRF                                  
             TO ACAT14-TFR-TYPE.                                                
ET0001     MOVE CMNT-TXT         OF DCLACTITRF                                  
             TO ACAT14-TFR-CMNTS.                                               
ET0001     MOVE TRANS-TYPE-CD    OF DCLACTITRF                                  
             TO ACAT14-TFR-TRANS-TYPE.                                          
ET0001     MOVE NSCC-PEND-CD     OF DCLACTITRF                                  
             TO ACAT14-TFR-NSCC-PEND.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          OPEN INITIAL ASSET CURSOR TABLE                     *          
      *--------------------------------------------------------------*          
       OPEN-AST-CURSOR.                                                         
           EXEC SQL                                                             
              OPEN ASTCRSR                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT14-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT14-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT14-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          FETCH INITIAL ASSET TABLE                           *          
      *--------------------------------------------------------------*          
       FETCH-AST-CURSOR.                                                        
           EXEC SQL                                                             
              FETCH                                                             
                  ASTCRSR                                                       
              INTO                                                              
ET0001           :DCLACTIAST.CLIENT-NBR                                         
ET0001          ,:DCLACTIAST.DLVR-NBR                                           
ET0001          ,:DCLACTIAST.ACCT-DLVR-NBR                                      
ET0001          ,:DCLACTIAST.RCV-NBR                                            
ET0001          ,:DCLACTIAST.ACCT-RCV-NBR                                       
ET0001          ,:DCLACTIAST.ISIN-CNTRY-CD                                      
ET0001          ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                                  
ET0001          ,:DCLACTIAST.ISIN-SEC-CDG-CD                                    
ET0001          ,:DCLACTIAST.STTLM-LCTN-CD                                      
ET0001          ,:DCLACTIAST.CSH-MGN-SHRT-CD                                    
ET0001          ,:DCLACTIAST.CSH-MRG-SHT-STS-CD                                 
ET0001          ,:DCLACTIAST.STTLM-LCTN-STTS-CD                                 
ET0001          ,:DCLACTIAST.ISIN-CNTRY-STTS-CD                                 
ET0001          ,:DCLACTIAST.SBMTG-PRTCP-NBR                                    
ET0001          ,:DCLACTIAST.SBMT-PRT-NR-STS-CD                                 
ET0001          ,:DCLACTIAST.ACAT-CONTROL-NBR                                   
ET0001          ,:DCLACTIAST.CONTROL-NBR-STS-CD                                 
ET0001          ,:DCLACTIAST.ASSET-SEQ-NBR                                      
ET0001          ,:DCLACTIAST.AST-SEQ-NBR-STS-CD                                 
ET0001          ,:DCLACTIAST.TRANS-TYPE-CD                                      
ET0001          ,:DCLACTIAST.TRANS-TYPE-STTS-CD                                 
ET0001          ,:DCLACTIAST.PHSCL-SEQ-NBR                                      
ET0001          ,:DCLACTIAST.PHSCL-SEQ-STTS-CD                                  
ET0001          ,:DCLACTIAST.LGCL-SEQ-NBR                                       
ET0001          ,:DCLACTIAST.LGCL-SEQ-NR-STS-CD                                 
ET0001          ,:DCLACTIAST.ASSET-PRC-CTGY-CD                                  
ET0001          ,:DCLACTIAST.AST-PRC-CTG-STS-CD                                 
ET0001          ,:DCLACTIAST.STTLM-RSN-CD                                       
ET0001          ,:DCLACTIAST.STTLM-RSN-STTS-CD                                  
ET0001          ,:DCLACTIAST.ASSET-DESC-TXT                                     
ET0001          ,:DCLACTIAST.ASSET-DESC-STTS-CD                                 
ET0001          ,:DCLACTIAST.ASSET-RQST-QTY-CD                                  
ET0001          ,:DCLACTIAST.ASSET-RQST-STS-CD                                  
ET0001          ,:DCLACTIAST.AST-RQST-TRANS-CD                                  
ET0001          ,:DCLACTIAST.AST-RQ-TRAN-STS-CD                                 
ET0001          ,:DCLACTIAST.ASSET-QTY                                          
ET0001          ,:DCLACTIAST.ASSET-QTY-STTS-CD                                  
ET0001          ,:DCLACTIAST.ASSET-PCT                                          
ET0001          ,:DCLACTIAST.ASSET-PCT-STTS-CD                                  
ET0001          ,:DCLACTIAST.PSTN-CD                                            
ET0001          ,:DCLACTIAST.PSTN-CD-STTS-CD                                    
ET0001          ,:DCLACTIAST.ISO-CRNCY-CD                                       
ET0001          ,:DCLACTIAST.ISO-CRNCY-STTS-CD                                  
ET0001          ,:DCLACTIAST.ASSET-AMT                                          
ET0001          ,:DCLACTIAST.ASSET-AMT-STTS-CD                                  
ET0001          ,:DCLACTIAST.BEARER-BOND-CD                                     
ET0001          ,:DCLACTIAST.BEARER-BND-STTS-CD                                 
ET0001          ,:DCLACTIAST.WHI-CD                                             
ET0001          ,:DCLACTIAST.WHI-STTS-CD                                        
ET0001          ,:DCLACTIAST.TRNFR-TYPE-RSN-CD                                  
ET0001          ,:DCLACTIAST.TRN-TYP-RSN-STS-CD                                 
ET0001          ,:DCLACTIAST.MBS-SERIAL-NBR                                     
ET0001          ,:DCLACTIAST.MBS-SERIAL-STTS-CD                                 
ET0001          ,:DCLACTIAST.ASSET-CMNT-TXT                                     
ET0001          ,:DCLACTIAST.ASSET-CMNT-STTS-CD                                 
ET0001          ,:DCLACTIAST.NSCC-WTHLD-CD                                      
ET0001          ,:DCLACTIAST.TRANS-RFRN-ID-CD                                   
ET0001          ,:DCLACTIAST.TRANS-RFRN-STTS-CD                                 
ET0001          ,:DCLACTIAST.ISIN-SEC-IS-STS-CD                                 
ET0001          ,:DCLACTIAST.ISIN-SEC-CD-STS-CD                                 
ET0001          ,:DCLACTIAST.OPTN-CTGY-CD                                       
ET0001          ,:DCLACTIAST.OPTN-CTGY-STTS-CD                                  
ET0001          ,:DCLACTIAST.RCRD-LNGTH-STTS-CD                                 
ET0001          ,:DCLACTIAST.RCRD-STTS-CD                                       
ET0001          ,:DCLACTIAST.NSCC-PEND-CD                                       
ET0001          ,:DCLACTIAST.NSCC-ACK-IND                                       
ET0001          ,:DCLACTIAST.PRGM-NM                                            
ET0001          ,:DCLACTIAST.CICS-TERM-ID-CD                                    
ET0001          ,:DCLACTIAST.UPDT-TMSTP                                         
ET0001          ,:DCLACTIAST.CRT-TMSTP                                          
ET0001          ,:DCLACTIAST.SECURITY-ADP-NBR                                   
ET0001          ,:DCLACTIAST.TRNFR-TYPE-CD                                      
ET0001          ,:DCLACTIAST.TRNFR-TYPE-STTS-CD                                 
ET0001          ,:DCLACTIAST.RCV-NBR-STTS-CD                                    
ET0001          ,:DCLACTIAST.DLVR-NBR-STTS-CD                                   
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT14-NORMAL  TO TRUE                                        
              PERFORM SETUP-ASSET-COMMAREA                                      
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT14-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT14-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT14-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *         SETUP ASSET COMMAREA PASSING DATA                    *          
      *--------------------------------------------------------------*          
       SETUP-ASSET-COMMAREA.                                                    
           INITIALIZE ACAT14-ASSET.                                             
ET0001     MOVE CLIENT-NBR          OF DCLACTIAST                               
             TO ACAT14-AST-CLT.                                                 
ET0001     MOVE ASSET-PRC-CTGY-CD   OF DCLACTIAST                               
             TO ACAT14-AST-CTGRY.                                               
ET0001     MOVE STTLM-LCTN-CD       OF DCLACTIAST                               
             TO ACAT14-AST-STTL-LOC.                                            
ET0001     MOVE CSH-MGN-SHRT-CD     OF DCLACTIAST                               
             TO ACAT14-AST-CS-MG-SH.                                            
ET0001     MOVE ISIN-SEC-ISSUE-CD   OF DCLACTIAST                               
             TO ACAT14-AST-SEC.                                                 
ET0001     MOVE PSTN-CD             OF DCLACTIAST                               
             TO ACAT14-AST-PSTN-CD.                                             
ET0001     MOVE ASSET-QTY           OF DCLACTIAST                               
             TO ACAT14-AST-QTY.                                                 
ET0001     MOVE ASSET-AMT           OF DCLACTIAST                               
             TO ACAT14-AST-AMT.                                                 
ET0001     MOVE ASSET-DESC-TXT      OF DCLACTIAST                               
             TO ACAT14-AST-DESC.                                                
ET0001     MOVE ASSET-CMNT-TXT      OF DCLACTIAST                               
             TO ACAT14-AST-CMNTS.                                               
ET0001     MOVE TRNFR-TYPE-RSN-CD   OF DCLACTIAST                               
             TO ACAT14-AST-REASON.                                              
ET0001     MOVE TRNFR-TYPE-CD       OF DCLACTIAST                               
             TO ACAT14-AST-TRNFR-TYPE.                                          
ET0001     MOVE ISIN-CNTRY-CD       OF DCLACTIAST                               
             TO ACAT14-AST-CNTRY.                                               
ET0001     MOVE ISIN-SEC-CDG-CD     OF DCLACTIAST                               
             TO ACAT14-AST-SEC-CDG.                                             
ET0001     MOVE STTLM-RSN-CD        OF DCLACTIAST                               
             TO ACAT14-AST-STTLM-RSN.                                           
ET0001     MOVE SECURITY-ADP-NBR    OF DCLACTIAST                               
             TO ACAT14-AST-ADP-SECNO.                                           
LRM005     MOVE NSCC-WTHLD-CD       OF DCLACTIAST                               
LRM005       TO ACAT14-NSCC-WTHLD-CD.                                           
LRM007     MOVE WHI-STTS-CD         OF DCLACTIAST                               
LRM007       TO ACAT14-WHI-STTS-CD.                                             
      *                                                                         
      *--------------------------------------------------------------*          
      *         CLOSE INITIAL ASSET CURSOR TABLE                     *          
      *--------------------------------------------------------------*          
       CLOSE-AST-CURSOR.                                                        
           EXEC SQL                                                             
              CLOSE ASTCRSR                                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT14-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT14-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT14-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *              UPDATE INITIAL TRANSFER                         *          
      *--------------------------------------------------------------*          
       UPDATE-INITIAL-TFR.                                                      
           EXEC SQL                                                             
ET0001       UPDATE ACTITRF                                                     
                SET NSCC_PEND_CD = :ACAT14-PASS-NSCC-PEND                       
                   ,CMNT_TXT = :ACAT14-PASS-CMNTS                               
                   ,UPDT_TMSTP = :WS-TIMESTAMP                                  
                   ,CICS_TERM_ID_CD = :ACAT14-PASS-TERMID                       
                   ,PRGM_NM = 'ACAT14DB'                                        
LRM003             ,CICS_SGNON_ID   = :ACAT14-SNON-ID                           
LRM003             ,CICS_NET_NM     = :ACAT14-NETNAME                           
LRM003             ,TPSCRT_USR_ID   = :ACAT14-USER-ID                           
LRM003             ,TPSCRT_USR_NM   = :ACAT14-USER-NAME                         
              WHERE CLIENT_NBR      = :ACAT14-PASS-CLT                          
                  AND DLVR_NBR      = :ACAT14-PASS-DLVR-NBR                     
                  AND ACCT_DLVR_NBR = :ACAT14-PASS-DLVR-ACCT                    
                  AND RCV_NBR       = :ACAT14-PASS-RCV-NBR                      
                  AND ACCT_RCV_NBR  = :ACAT14-PASS-RCV-ACCT                     
                  AND TRNFR_TYPE_CD = 'RCR'                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT14-NORMAL  TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT14-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              PERFORM 9000-ROLLBACK                                             
              SET ACAT14-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT14-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *         OVERRIDE THE REASON CODE                             *          
      *--------------------------------------------------------------*          
       UPDATE-INITIAL-ASSET.                                                    
      *                                                                         
DJ0001     IF  ACAT14-AST-STTL-LOC = '40'                                       
DJ0001         IF ACAT14-PASS-AMT  = 0                                          
DJ0001            PERFORM UPDATE-INITIAL-ASSET-WITHHOLD                         
DJ0001         ELSE                                                             
DJ0001            PERFORM UPDATE-INITIAL-ASSET-REGULAR                          
DJ0001         END-IF                                                           
DJ0001     ELSE                                                                 
DJ0001         IF ACAT14-PASS-QTY  = 0                                          
DJ0001            PERFORM UPDATE-INITIAL-ASSET-WITHHOLD                         
DJ0001         ELSE                                                             
DJ0001            PERFORM UPDATE-INITIAL-ASSET-REGULAR                          
DJ0001         END-IF                                                           
DJ0001     END-IF.                                                              
      *                                                                         
DJ0001*--------------------------------------------------------------*          
DJ0001*    UPDATE ASSET AS PASSED FROM ACAT14RC.                     *          
DJ0001*    BALANCE OR QUANTITY MUST NOT BE ZERO.                     *          
DJ0001*--------------------------------------------------------------*          
DJ0001 UPDATE-INITIAL-ASSET-REGULAR.                                            
      *                                                                         
           IF ACAT14-UPD-ASTSUB                                                 
             EXEC SQL                                                           
ET0001       UPDATE ACTIAST                                                     
                SET NSCC_PEND_CD        = :ACAT14-PASS-NSCC-PEND                
LRM005             ,NSCC_WTHLD_CD       = :ACAT14-PASS-WTHLD-CD                 
                   ,TRNFR_TYPE_RSN_CD   = :ACAT14-PASS-REASON                   
                   ,UPDT_TMSTP          = :WS-TIMESTAMP                         
                   ,CICS_TERM_ID_CD     = :ACAT14-PASS-TERMID                   
                   ,PRGM_NM             = 'ACAT14DB'                            
              WHERE CLIENT_NBR          = :ACAT14-PASS-CLT                      
                  AND DLVR_NBR          = :ACAT14-PASS-DLVR-NBR                 
                  AND ACCT_DLVR_NBR     = :ACAT14-PASS-DLVR-ACCT                
                  AND RCV_NBR           = :ACAT14-PASS-RCV-NBR                  
                  AND ACCT_RCV_NBR      = :ACAT14-PASS-RCV-ACCT                 
                  AND ISIN_CNTRY_CD     = :ACAT14-PASS-CNTRY                    
                  AND ISIN_SEC_ISSUE_CD = :ACAT14-PASS-SEC                      
                  AND ISIN_SEC_CDG_CD   = :ACAT14-PASS-SEC-CDG                  
                  AND STTLM_LCTN_CD     = :ACAT14-PASS-STTL-LOC                 
                  AND CSH_MGN_SHRT_CD   = :ACAT14-PASS-CS-MG-SH                 
ET0001            AND TRNFR_TYPE_CD     = 'RCR'                                 
             END-EXEC                                                           
           ELSE                                                                 
             EXEC SQL                                                           
ET0001       UPDATE ACTIAST                                                     
                SET NSCC_PEND_CD        = :ACAT14-PASS-NSCC-PEND                
LRM005             ,NSCC_WTHLD_CD       = :ACAT14-PASS-WTHLD-CD                 
                   ,TRNFR_TYPE_RSN_CD   = :ACAT14-PASS-REASON                   
DJ0001             ,ASSET_AMT           = :ACAT14-PASS-AMT                      
DJ0001             ,ASSET_QTY           = :ACAT14-PASS-QTY                      
                   ,UPDT_TMSTP          = :WS-TIMESTAMP                         
                   ,CICS_TERM_ID_CD     = :ACAT14-PASS-TERMID                   
                   ,PRGM_NM             = 'ACAT14DB'                            
              WHERE CLIENT_NBR          = :ACAT14-PASS-CLT                      
                  AND DLVR_NBR          = :ACAT14-PASS-DLVR-NBR                 
                  AND ACCT_DLVR_NBR     = :ACAT14-PASS-DLVR-ACCT                
                  AND RCV_NBR           = :ACAT14-PASS-RCV-NBR                  
                  AND ACCT_RCV_NBR      = :ACAT14-PASS-RCV-ACCT                 
                  AND ISIN_CNTRY_CD     = :ACAT14-PASS-CNTRY                    
                  AND ISIN_SEC_ISSUE_CD = :ACAT14-PASS-SEC                      
                  AND ISIN_SEC_CDG_CD   = :ACAT14-PASS-SEC-CDG                  
                  AND STTLM_LCTN_CD     = :ACAT14-PASS-STTL-LOC                 
                  AND CSH_MGN_SHRT_CD   = :ACAT14-PASS-CS-MG-SH                 
ET0001            AND TRNFR_TYPE_CD     = 'RCR'                                 
             END-EXEC.                                                          
           IF SQLCODE = 0                                                       
              SET ACAT14-NORMAL  TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT14-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              PERFORM 9000-ROLLBACK                                             
              SET ACAT14-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT14-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
      *                                                                         
DJ0001*--------------------------------------------------------------*          
DJ0001*    IF CASH BALANCE IS ZERO, OR SECURITY QUANTITY IS ZERO,    *          
DJ0001*    WITHHOLD THE ASSET.  DO NOT SUBMIT.                       *          
DJ0001*    SET PEND CODE TO 'H'.                                     *          
DJ0001*--------------------------------------------------------------*          
DJ0001 UPDATE-INITIAL-ASSET-WITHHOLD.                                           
           IF ACAT14-UPD-ASTSUB                                                 
DJ0001       EXEC SQL                                                           
ET0001       UPDATE ACTIAST                                                     
DJ0001          SET NSCC_PEND_CD        = 'H'                                   
DJ0001             ,TRNFR_TYPE_RSN_CD   = :ACAT14-PASS-REASON                   
LRM005             ,NSCC_WTHLD_CD       = :ACAT14-PASS-WTHLD-CD                 
DJ0001             ,UPDT_TMSTP          = :WS-TIMESTAMP                         
DJ0001             ,CICS_TERM_ID_CD     = :ACAT14-PASS-TERMID                   
DJ0001             ,PRGM_NM             = 'ACAT14DB'                            
DJ0001        WHERE CLIENT_NBR          = :ACAT14-PASS-CLT                      
DJ0001            AND DLVR_NBR          = :ACAT14-PASS-DLVR-NBR                 
DJ0001            AND ACCT_DLVR_NBR     = :ACAT14-PASS-DLVR-ACCT                
DJ0001            AND RCV_NBR           = :ACAT14-PASS-RCV-NBR                  
DJ0001            AND ACCT_RCV_NBR      = :ACAT14-PASS-RCV-ACCT                 
DJ0001            AND ISIN_CNTRY_CD     = :ACAT14-PASS-CNTRY                    
DJ0001            AND ISIN_SEC_ISSUE_CD = :ACAT14-PASS-SEC                      
DJ0001            AND ISIN_SEC_CDG_CD   = :ACAT14-PASS-SEC-CDG                  
DJ0001            AND STTLM_LCTN_CD     = :ACAT14-PASS-STTL-LOC                 
DJ0001            AND CSH_MGN_SHRT_CD   = :ACAT14-PASS-CS-MG-SH                 
ET0001            AND TRNFR_TYPE_CD     = 'RCR'                                 
DJ0001       END-EXEC                                                           
           ELSE                                                                 
DJ0001       EXEC SQL                                                           
ET0001       UPDATE ACTIAST                                                     
DJ0001          SET NSCC_PEND_CD        = 'H'                                   
LRM005             ,NSCC_WTHLD_CD       = :ACAT14-PASS-WTHLD-CD                 
DJ0001             ,TRNFR_TYPE_RSN_CD   = :ACAT14-PASS-REASON                   
DJ0001             ,ASSET_AMT           = :ACAT14-PASS-AMT                      
DJ0001             ,ASSET_QTY           = :ACAT14-PASS-QTY                      
DJ0001             ,UPDT_TMSTP          = :WS-TIMESTAMP                         
DJ0001             ,CICS_TERM_ID_CD     = :ACAT14-PASS-TERMID                   
DJ0001             ,PRGM_NM             = 'ACAT14DB'                            
DJ0001        WHERE CLIENT_NBR          = :ACAT14-PASS-CLT                      
DJ0001            AND DLVR_NBR          = :ACAT14-PASS-DLVR-NBR                 
DJ0001            AND ACCT_DLVR_NBR     = :ACAT14-PASS-DLVR-ACCT                
DJ0001            AND RCV_NBR           = :ACAT14-PASS-RCV-NBR                  
DJ0001            AND ACCT_RCV_NBR      = :ACAT14-PASS-RCV-ACCT                 
DJ0001            AND ISIN_CNTRY_CD     = :ACAT14-PASS-CNTRY                    
DJ0001            AND ISIN_SEC_ISSUE_CD = :ACAT14-PASS-SEC                      
DJ0001            AND ISIN_SEC_CDG_CD   = :ACAT14-PASS-SEC-CDG                  
DJ0001            AND STTLM_LCTN_CD     = :ACAT14-PASS-STTL-LOC                 
DJ0001            AND CSH_MGN_SHRT_CD   = :ACAT14-PASS-CS-MG-SH                 
ET0001            AND TRNFR_TYPE_CD     = 'RCR'                                 
DJ0001       END-EXEC.                                                          
DJ0001     IF SQLCODE = 0                                                       
DJ0001        SET ACAT14-NORMAL  TO TRUE                                        
DJ0001     ELSE                                                                 
DJ0001        IF SQLCODE = +100                                                 
DJ0001           SET ACAT14-NOT-FOUND TO TRUE                                   
DJ0001        ELSE                                                              
DJ0001           PERFORM 9000-ROLLBACK                                          
DJ0001           SET ACAT14-ERROR  TO TRUE                                      
DJ0001           MOVE SQLCODE  TO ACAT14-SQLCODE                                
DJ0001           PERFORM 9999-DB2-ERROR                                         
DJ0001        END-IF                                                            
DJ0001     END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  BEFORE UPDATING, CHECK IF INITIAL TFR IS UPDATED/DELETED    *          
      *--------------------------------------------------------------*          
       GET-INITIAL-TRANSFER.                                                    
ET0001**   INITIALIZE DCLVINITRNF.                                              
ET0001     INITIALIZE DCLACTITRF.                                               
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
ET0001              :DCLACTITRF.CLIENT-NBR                                      
ET0001             ,:DCLACTITRF.DLVR-NBR                                        
ET0001             ,:DCLACTITRF.ACCT-DLVR-NBR                                   
ET0001             ,:DCLACTITRF.RCV-NBR                                         
ET0001             ,:DCLACTITRF.ACCT-RCV-NBR                                    
ET0001             ,:DCLACTITRF.TRNFR-TYPE-CD                                   
ET0001             ,:DCLACTITRF.SBMTG-PRTCP-NBR                                 
ET0001             ,:DCLACTITRF.ACAT-CONTROL-NBR                                
ET0001             ,:DCLACTITRF.TRANS-TYPE-CD                                   
ET0001             ,:DCLACTITRF.RCV-CUST-NM                                     
ET0001             ,:DCLACTITRF.RCV-SS-PRIM-NBR                                 
ET0001             ,:DCLACTITRF.RCV-SS-SCNDY-NBR                                
ET0001             ,:DCLACTITRF.RCV-ACCT-TYPE-CD                                
ET0001             ,:DCLACTITRF.RCV-OCC-BRKR-NBR                                
ET0001             ,:DCLACTITRF.RCV-CRSPN-NBR                                   
ET0001             ,:DCLACTITRF.ACAT-CNTL-ASTD-NBR                              
ET0001             ,:DCLACTITRF.CMNT-TXT                                        
ET0001             ,:DCLACTITRF.PRCS-DT                                         
ET0001             ,:DCLACTITRF.STTS-CD                                         
ET0001             ,:DCLACTITRF.DSTBN-SIDE-CD                                   
ET0001             ,:DCLACTITRF.SYS-ACT-CD                                      
ET0001             ,:DCLACTITRF.SYS-RJCT-RSN-CD                                 
ET0001             ,:DCLACTITRF.TRNFR-TYPE-RJCT-CD                              
ET0001             ,:DCLACTITRF.TRNFR-TYPE-RJC1-CD                              
ET0001             ,:DCLACTITRF.TRNFR-TYPE-RJC2-CD                              
ET0001             ,:DCLACTITRF.PHSCL-SEQ-NBR                                   
ET0001             ,:DCLACTITRF.LGCL-SEQ-NBR                                    
ET0001             ,:DCLACTITRF.PRTCP-CONTRA-CD                                 
ET0001             ,:DCLACTITRF.CYCLE-CD                                        
ET0001             ,:DCLACTITRF.DAYS-STTS-QTY                                   
ET0001             ,:DCLACTITRF.TRANS-RFRN-ID-CD                                
ET0001             ,:DCLACTITRF.DB-CR-CD                                        
ET0001             ,:DCLACTITRF.STTLM-ASCTD-DT                                  
ET0001             ,:DCLACTITRF.NSCC-PEND-CD                                    
ET0001             ,:DCLACTITRF.NSCC-ACK-IND                                    
ET0001             ,:DCLACTITRF.UPDT-TMSTP                                      
ET0001             ,:DCLACTITRF.CRT-TMSTP                                       
ET0001             ,:DCLACTITRF.CICS-TERM-ID-CD                                 
ET0001             ,:DCLACTITRF.PRGM-NM                                         
ET0001             ,:DCLACTITRF.RR-CD                                           
                 FROM                                                           
ET0001              ACTITRF                                                     
                WHERE                                                           
                    CLIENT_NBR        = :ACAT14-PASS-CLT                        
                    AND ACCT_DLVR_NBR = :ACAT14-PASS-DLVR-ACCT                  
                    AND RCV_NBR       = :ACAT14-PASS-RCV-NBR                    
                    AND ACCT_RCV_NBR  = :ACAT14-PASS-RCV-ACCT                   
                    AND TRNFR_TYPE_CD = 'RCR'                                   
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT14-NORMAL  TO TRUE                                        
ET0001        MOVE NSCC-PEND-CD OF DCLACTITRF                                   
                TO ACAT14-NSCC-PEND-CD                                          
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT14-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT14-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT14-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  BEFORE DECLARING ASSET CURSOR TABLE, CHECK IF ANY ASSET     *          
      *  ROWS EXIST                                                  *          
      *--------------------------------------------------------------*          
       COUNT-INITIAL-ASSET.                                                     
           MOVE 0 TO WS-ROW-COUNT.                                              
           EXEC SQL                                                             
               SELECT                                                           
                    COUNT(*)                                                    
                 INTO                                                           
                    :WS-ROW-COUNT                                               
                 FROM                                                           
ET0001              ACTIAST                                                     
                 WHERE CLIENT_NBR      = :ACAT14-PASS-CLT                       
                    AND  ACCT_DLVR_NBR = :ACAT14-PASS-DLVR-ACCT                 
                    AND  RCV_NBR       = :WS-PASSED-RCV-NBR                     
                    AND  ACCT_RCV_NBR  = :WS-PASSED-RCV-ACCT                    
ET0001              AND  TRNFR_TYPE_CD = 'RCR'                                  
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              IF WS-ROW-COUNT > 0                                               
                 SET ACAT14-FOUND  TO TRUE                                      
              ELSE                                                              
                 SET ACAT14-NOT-FOUND TO TRUE                                   
              END-IF                                                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT14-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT14-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT14-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
      *                                                                         
DJ0001*--------------------------------------------------------------*          
DJ0001*  BEFORE SUBMITTING TRANSFER,                                 *          
DJ0001*  CHECK IF ANY ASSET ROWS EXIST WITH NONZERO AMOUNT           *          
DJ0001*--------------------------------------------------------------*          
DJ0001 COUNT-INITIAL-ASSET-NONZERO.                                             
DJ0001     MOVE 0 TO WS-ROW-COUNT.                                              
DJ0001     EXEC SQL                                                             
DJ0001         SELECT                                                           
DJ0001              COUNT(*)                                                    
DJ0001           INTO                                                           
DJ0001              :WS-ROW-COUNT                                               
DJ0001           FROM                                                           
ET0001              ACTIAST                                                     
DJ0001           WHERE CLIENT_NBR      = :ACAT14-PASS-CLT                       
DJ0001              AND  ACCT_DLVR_NBR = :ACAT14-PASS-DLVR-ACCT                 
DJ0001              AND  RCV_NBR       = :ACAT14-PASS-RCV-NBR                   
DJ0001              AND  ACCT_RCV_NBR  = :ACAT14-PASS-RCV-ACCT                  
ET0001              AND  TRNFR_TYPE_CD = 'RCR'                                  
DJ0001              AND (NOT ASSET_AMT = 0)                                     
LRM005              AND NOT NSCC_WTHLD_CD = 'W'                                 
DJ0001     END-EXEC.                                                            
DJ0001     IF SQLCODE = 0                                                       
DJ0001        IF WS-ROW-COUNT > 0                                               
DJ0001           SET ACAT14-FOUND  TO TRUE                                      
DJ0001        ELSE                                                              
DJ0001           SET ACAT14-NOT-FOUND TO TRUE                                   
DJ0001        END-IF                                                            
DJ0001     ELSE                                                                 
DJ0001        IF SQLCODE = +100                                                 
DJ0001           SET ACAT14-NOT-FOUND TO TRUE                                   
DJ0001        ELSE                                                              
DJ0001           SET ACAT14-ERROR  TO TRUE                                      
DJ0001           MOVE SQLCODE  TO ACAT14-SQLCODE                                
DJ0001           PERFORM 9999-DB2-ERROR                                         
DJ0001        END-IF                                                            
DJ0001     END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          READ ACTIVE TRANSFER TABLE                          *          
      *--------------------------------------------------------------*          
       GET-ACTIVE-TRANSFER.                                                     
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
                    CLIENT_NBR            = :WS-PASSED-CLT                      
                    AND  ACAT_CONTROL_NBR = :WS-PASSED-ACAT                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT14-NORMAL  TO TRUE                                        
              PERFORM SETUP-ACTIVE-TRNFR-COMMAREA                               
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT14-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT14-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT14-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *       SETUP ACTIVE TRANSFER TBL FIELDS OF ACAT14-COMMAREA    *          
      *--------------------------------------------------------------*          
       SETUP-ACTIVE-TRNFR-COMMAREA.                                             
           INITIALIZE ACAT14-TRANSFER.                                          
           MOVE CLIENT-NBR       OF DCLVTRNFR                                   
             TO ACAT14-TFR-CLT.                                                 
           MOVE DLVR-NBR         OF DCLVTRNFR                                   
             TO ACAT14-TFR-DLVR-NBR.                                            
           MOVE ACCT-DLVR-NBR    OF DCLVTRNFR                                   
             TO ACAT14-TFR-DLVR-ACCT.                                           
           MOVE RCV-NBR          OF DCLVTRNFR                                   
             TO ACAT14-TFR-RCV-NBR.                                             
           MOVE ACCT-RCV-NBR     OF DCLVTRNFR                                   
             TO ACAT14-TFR-RCV-ACCT.                                            
           MOVE STTS-CD          OF DCLVTRNFR                                   
             TO ACAT14-TFR-STTS.                                                
           MOVE RCV-ACCT-TYPE-CD OF DCLVTRNFR                                   
             TO ACAT14-TFR-ACCT-TYPE.                                           
           MOVE RCV-CUST-NM      OF DCLVTRNFR                                   
             TO ACAT14-TFR-NAME.                                                
           MOVE RCV-SS-PRIM-NBR  OF DCLVTRNFR                                   
             TO ACAT14-TFR-SS1.                                                 
           MOVE RCV-SS-SCNDY-NBR OF DCLVTRNFR                                   
             TO ACAT14-TFR-SS2.                                                 
           MOVE RR-CD            OF DCLVTRNFR                                   
             TO ACAT14-TFR-RR.                                                  
           MOVE TRNFR-TYPE-CD    OF DCLVTRNFR                                   
             TO ACAT14-TFR-TYPE.                                                
           MOVE CMNT-TXT         OF DCLVTRNFR                                   
             TO ACAT14-TFR-CMNTS.                                               
           MOVE TRANS-TYPE-CD    OF DCLVTRNFR                                   
             TO ACAT14-TFR-TRANS-TYPE.                                          
           MOVE NSCC-PEND-CD     OF DCLVTRNFR                                   
             TO ACAT14-TFR-NSCC-PEND.                                           
           MOVE ACAT-CONTROL-NBR OF DCLVTRNFR                                   
             TO ACAT14-TFR-ACAT.                                                
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *        OPEN ACTIVE ASSET DECLARE CURSOR TABLE                *          
      *--------------------------------------------------------------*          
       OPEN-ACTIVE-ASSET-TBL.                                                   
           EXEC SQL                                                             
              OPEN ASSETCSR                                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT14-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT14-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT14-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *       FETCH ACTIVE ASSET DECLARE CURSOR TABLE                *          
      *--------------------------------------------------------------*          
       FETCH-ACTIVE-ASSET-TBL.                                                  
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
              SET ACAT14-NORMAL  TO TRUE                                        
              PERFORM SETUP-ACTIVE-ASSET-COMMAREA                               
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT14-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT14-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT14-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *       SETUP ASSET TABLE FIELDS OF COMMAREA                   *          
      *--------------------------------------------------------------*          
       SETUP-ACTIVE-ASSET-COMMAREA.                                             
           INITIALIZE ACAT14-ASSET.                                             
           MOVE CLIENT-NBR        OF DCLVASSET                                  
             TO ACAT14-AST-CLT.                                                 
           MOVE ASSET-PRC-CTGY-CD OF DCLVASSET                                  
             TO ACAT14-AST-CTGRY.                                               
           MOVE STTLM-LCTN-CD     OF DCLVASSET                                  
             TO ACAT14-AST-STTL-LOC.                                            
           MOVE CSH-MGN-SHRT-CD   OF DCLVASSET                                  
             TO ACAT14-AST-CS-MG-SH.                                            
           MOVE PSTN-CD           OF DCLVASSET                                  
             TO ACAT14-AST-PSTN-CD.                                             
           MOVE ISIN-SEC-ISSUE-CD OF DCLVASSET                                  
             TO ACAT14-AST-SEC.                                                 
           MOVE ASSET-QTY         OF DCLVASSET                                  
             TO ACAT14-AST-QTY.                                                 
           MOVE ASSET-AMT         OF DCLVASSET                                  
             TO ACAT14-AST-AMT.                                                 
           MOVE ASSET-DESC-TXT    OF DCLVASSET                                  
             TO ACAT14-AST-DESC.                                                
           MOVE ASSET-CMNT-TXT    OF DCLVASSET                                  
             TO ACAT14-AST-CMNTS.                                               
           MOVE TRNFR-TYPE-RSN-CD OF DCLVASSET                                  
             TO ACAT14-AST-REASON.                                              
           MOVE TRNFR-TYPE-CD     OF DCLVASSET                                  
             TO ACAT14-AST-TRNFR-TYPE.                                          
           MOVE ISIN-CNTRY-CD     OF DCLVASSET                                  
             TO ACAT14-AST-CNTRY.                                               
           MOVE ISIN-SEC-CDG-CD   OF DCLVASSET                                  
             TO ACAT14-AST-SEC-CDG.                                             
           MOVE STTLM-RSN-CD      OF DCLVASSET                                  
             TO ACAT14-AST-STTLM-RSN.                                           
           MOVE SECURITY-ADP-NBR  OF DCLVASSET                                  
             TO ACAT14-AST-ADP-SECNO.                                           
      *                                                                         
      *--------------------------------------------------------------*          
      *       CLOSE ACTIVE ASSET DECLARE CURSOR TABLE                *          
      *--------------------------------------------------------------*          
       CLOSE-ACTIVE-ASSET-TBL.                                                  
           EXEC SQL                                                             
              CLOSE ASSETCSR                                                    
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT14-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT14-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT14-SQLCODE                                   
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
           MOVE 'ACAT14DB' TO CALLING-PROGRAM-ID.                               
           MOVE SQLCA      TO SQLCA-AREA.                                       
           EXEC CICS LINK PROGRAM('FPDB2LOG')                                   
                COMMAREA(WS-ERR-DATA)                                           
                LENGTH(LENGTH OF WS-ERR-DATA)                                   
                NOHANDLE                                                        
           END-EXEC.                                                            
       EJECT                                                                    
                                                                                
       HANG-CICS.                                                               
           GOBACK.                                                              
