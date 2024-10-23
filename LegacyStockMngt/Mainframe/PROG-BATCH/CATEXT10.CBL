000001* PDX    - CATEXT10 C0291396 06/22/10 16:22:48 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CATEXT10.                                                   
       AUTHOR.      LARRY MUREY.                                                
       DATE-WRITTEN.  JAN 2010.                                                 
      **REMARKS.                                                                
      *****************************************************************         
      *                                                                         
      *PROGRAM DESCRIPTION:                                                     
      *     SELECT ALL FULL DELIVERY SETTLED HISTORY TRANSFERS AND              
      *     ASSETS FOR CLIENT 10.  LOOKUP DELIVERY ACCOUNT TO SEE IF            
      *     IT WAS MOVED TO CLIENT 210 IN THE SPECIFIC BRANCHES AND             
      *     ACCOUNTS WITHIN BRANCH 250.  WRITE MATCHES TO ALONG WITH            
      *     HIS CHILDREN (VASTHSTY, VOPTHSTY AND VMFHSTY) IN CATEXTR            
      *     FORMAT, THAT THIS FILE MAY BY UPLOADED BY CATUPLDS                  
      *     TO PRODUCTION.                                                      
      *****************************************************************         
           EJECT                                                                
       ENVIRONMENT DIVISION.                                                    
       CONFIGURATION SECTION.                                                   
       SOURCE-COMPUTER.  IBM-370.                                               
       OBJECT-COMPUTER.  IBM-370.                                               
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT EXTRACT-FILE                  ASSIGN  TO  EXTR.               
                                                                                
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
                                                                                
       FD  EXTRACT-FILE                                                         
           RECORDING MODE IS V                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
       01  EXTRACT-RECORD.                                                      
           05  RECORD-SEG-ID        PIC X(08).                                  
           05  RECORD-DETAIL        PIC X(742).                                 
                                                                                
           EJECT                                                                
                                                                                
       WORKING-STORAGE SECTION.                                                 
       01  WS-NAME                          PIC X(40)                           
           VALUE 'CATEXT10 WORKING STORAGE STARTS HERE'.                        
                                                                                
       01  ABEND                         PIC X(008) VALUE 'ILBOABN0'.           
******** SINCE THE PARM CAN'T EXCEED 100 BYTES, USE THE VTRNFR CNTL             
******** PARMS ABOVE FOR THE HISTORY DATABASE.                                  
       01  WS-VTRNHSTY-WORKAREA.                                                
           05  WS-VTRNHSTY-KEY.                                                 
               07  WS-VTRNHSTY-FR-CNTL-NBR     PIC X(14).                       
               07  FILLER                      PIC X.                           
               07  WS-VTRNHSTY-TO-CNTL-NBR     PIC X(14).                       
                                                                                
       01 WORKAREA.                                                             
           05  WS-VTRNHSTY-COUNT      PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VTRNHSTY-FETCHED    PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-RECORDS-SKIPPED     PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VASTHSTY-COUNT      PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VMFHSTY-COUNT       PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VOPTHSTY-COUNT      PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-TIMESTAMP           PIC X(26).                                
                                                                                
NOTE*** SEE HAALDUN.LIB.MEM(PENSONBR)                                           
NOTE***                 264  2010/01/29  2010/06/08 14:17:07  HAALDUN           
           05  WS-BRANCH-TEST      PIC X(3).                            OMG15DF1
               88  WS-BRANCH-RIDGE  VALUES ARE                                  
            '012' '101' '265' '420' '492' '544' '635' '717' '846' '9YY'         
            '013' '102' '282' '421' '497' '547' '637' '726' '865' '903'         
            '014' '115' '289' '422' '509' '548' '646' '727' '868' '906'         
            '015' '134' '296' '423' '510' '552' '650' '738' '873' '907'         
            '016' '139' '299' '424' '511' '553' '656' '746' '874' '916'         
            '017' '141' '312' '425' '512' '555' '657' '751' '875' '917'         
            '018' '211' '354' '426' '513' '556' '658' '753' '883' '921'         
            '019' '216' '359' '427' '514' '563' '660' '756' '884' '925'         
            '020' '220' '364' '428' '525' '578' '682' '759' '885' '929'         
            '021' '223' '373' '429' '526' '588' '683' '814' '886' '930'         
            '022' '237' '381' '432' '535' '598' '684' '815' '887' '935'         
            '023' '253' '388' '441' '537' '600' '685' '817' '888' '939'         
            '024' '255' '395' '442' '538' '601' '686' '818' '889' '944'         
            '025' '256' '417' '443' '539' '608' '687' '839' '890' '951'         
                  '257' '418' '460' '540' '613' '688' '841' '896' '952'         
                  '258' '419' '465' '541' '625' '710' '843' '897' '953'         
                  '259'       '469' '542' '627' '711'       '898' '955'         
                  '260'       '488'             '714'       '899' '956'         
                                                '716'             '959'         
                                                                  '961'         
                                                                  '965'         
                                                                  '976'         
                                                                  '982'         
                                                                  '999'.        
                                                                                
           05  WS-ACCOUNT-B250-TEST    PIC X(5).                        OMG15DF1
               88   WS-ACCOUNT-B250-RIDGE  VALUES ARE                           
                            '11700' THRU '11799'                                
                            '24000' THRU '24099'                                
                            '28900' THRU '28999'                                
                            '29300' THRU '29399'                                
                            '29900' THRU '29999'                                
                            '30400' THRU '30499'                                
                            '30700' THRU '30799'                                
                            '31200' THRU '31299'                                
                            '31900' THRU '31999'                                
                            '33700' THRU '33799'                                
                            '33800' THRU '33899'                                
                            '35400' THRU '35499'                                
                            '35900' THRU '35999'                                
                            '36400' THRU '36499'                                
                            '38100' THRU '38199'                                
                            '39400' THRU '39499'                                
                            '39500' THRU '39599'                                
                            '39600' THRU '39699'                                
                            '41700' THRU '41799'                                
                            '42000' THRU '42099'                                
                            '42100' THRU '42199'                                
                            '42300' THRU '42399'                                
                            '42400' THRU '42499'                                
                            '42500' THRU '42599'                                
                            '42800' THRU '42899'                                
                            '43200' THRU '43299'                                
                            '43800' THRU '43899'                                
                            '44100' THRU '44199'                                
                            '44200' THRU '44299'                                
                            '44300' THRU '44399'                                
                            '46200' THRU '46299'                                
                            '46900' THRU '46999'                                
                            '47100' THRU '47199'                                
                            '48800' THRU '48899'                                
                            '49200' THRU '49299'                                
                            '50700' THRU '50799'                                
                            '50900' THRU '50999'                                
                            '51000' THRU '51099'                                
                            '51100' THRU '51199'                                
                            '53000' THRU '53099'                                
                            '53700' THRU '53799'                                
                            '53800' THRU '53899'                                
                            '53900' THRU '53999'                                
                            '54000' THRU '54099'                                
                            '54100' THRU '54199'                                
                            '54700' THRU '54799'                                
                            '54800' THRU '54899'                                
                            '55200' THRU '55299'                                
                            '55500' THRU '55599'                                
                            '55600' THRU '55699'                                
                            '56300' THRU '56399'                                
                            '58800' THRU '58899'                                
                            '62600' THRU '62699'                                
                            '63400' THRU '63499'                                
                            '65000' THRU '65099'                                
                            '65100' THRU '65199'                                
                            '65400' THRU '65499'                                
                            '65800' THRU '65899'                                
                            '68200' THRU '68299'                                
                            '71000' THRU '71099'                                
                            '71600' THRU '71699'                                
                            '72700' THRU '72799'                                
                            '81400' THRU '81499'                                
                            '87200' THRU '87299'                                
                            '87300' THRU '87399'                                
                            '87400' THRU '87499'                                
                            '87500' THRU '87599'                                
                            '87700' THRU '87799'                                
                            '88900' THRU '88999'                                
                            '89300' THRU '89399'                                
                            '89600' THRU '89699'                                
                            '90100' THRU '90199'                                
                            '90700' THRU '90799'                                
                            '91600' THRU '91699'                                
                            '91700' THRU '91799'                                
                            '92500' THRU '92599'                                
                            '92900' THRU '92999'                                
                            '93200' THRU '93299'                                
                            '93500' THRU '93599'                                
                            '93900' THRU '93999'                                
                            '94400' THRU '94499'                                
                            '95100' THRU '95199'                                
                            '95600' THRU '95699'                                
                            '95900' THRU '95999'                                
                            '96500' THRU '96599'                                
                            '97700' THRU '97799'                                
                            '98200' THRU '98299'.                               
           EJECT                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT HISTORY TRANSFER TABLE                                   
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VTRNHSTY                                                 
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT HISTORY ASSET TABLE                                      
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VASTHSTY                                                 
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT HISTORY MF TABLE                                         
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VMFHSTY                                                  
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT HISTORY OPTN TABLE                                       
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VOPTHSTY                                                 
           END-EXEC.                                                            
                                                                                
      *DECLARE CURSOR TO OBTAIN HISTORY TI RECORDS                              
           EXEC SQL                                                             
              DECLARE VTRNHSTY_CRSR CURSOR WITH HOLD FOR                        
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
                   ,ACCT_TRNFR_FEE_AMT                                  L,      
                   ,ACCT_IRA_TRMNT_AMT                                  L,      
                   ,ACCT_IRA_MAINT_AMT                                  L,      
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
LRM003             ,ACCT_FRZN_IND                                               
LRM004             ,BRANCH_ALTNT_CD                                             
LRM004             ,GIFT_IND                                                    
LRM004             ,RSTR_TRD_90_DY_IND                                          
LRM004             ,REG_T_IND                                                   
LRM004             ,ADOPT_AGRMT_IND                                             
LRM004             ,RR_ORGNL_CD                                                 
LRM006             ,CVRSN_ACCT_NBR                                              
DJ0002             ,AUCTION_RT_IND                                              
LRM008             ,PENNY_STK_IND                                               
                 FROM VTRNHSTY                                                  
                 WHERE CLIENT_NBR = '0010'                                      
                 AND TRNFR_TYPE_CD = 'FUL'                                      
                 AND DSTBN_SIDE_CD = 'D'                                        
                 AND STTS_CD = '310'                                            
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
                                                                                
      * DECLARE CURSOR TO OBTAIN ASSET HISTORY ROWS FOR THIS CNTL NBR           
           EXEC SQL                                                             
              DECLARE VASTHSTY_CRSR CURSOR FOR                                  
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
                    ,CAGE_TAG_NBR                                               
                    ,ENTERED_TAG_NBR                                            
                    ,NTWK_CNTL_CD                                               
                    ,FUND_PROC_CD                                               
                    ,FUND_RGSTN_STTS                                            
LRM002              ,SCRTY_866_NBR                                              
LRM002              ,ASSET_866_QTY                                              
DJ0002              ,AUCTION_RT_IND                                             
                 FROM VASTHSTY                                                  
                 WHERE CLIENT_NBR   = '0010'                                    
                  AND  ACAT_CONTROL_NBR = :DCLVTRNHSTY.ACAT-CONTROL-NBR         
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
                                                                                
                                                                                
      * DECLARE CURSOR TO OBTAIN ALL HISTORY MF RECS FOR THIS CNTL NBR          
           EXEC SQL                                                             
              DECLARE VMFHSTY_CRSR CURSOR FOR                                   
                 SELECT                                                         
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,ASSET_SEQ_NBR                                              
                    ,BK_PHSCL_SHR_CD                                            
                    ,BK_PHSC_SHR_STS_CD                                         
                    ,NTWRK_CNTL_CD                                              
                    ,NTWRK_CNTL_STTS_CD                                         
                    ,ACCT_TYPE_CD                                               
                    ,ACCT_TYPE_STTS_CD                                          
                    ,DVDND_CD                                                   
                    ,DVDND_STTS_CD                                              
                    ,DVDND_PAYEE_CD                                             
                    ,DVDND_PYE_STTS_CD                                          
                    ,LTCG_CD                                                    
                    ,BRKR_EXCTG_NBR                                             
                    ,BRKR_EXCTG_STTS_CD                                         
                    ,STCG_CD                                                    
                    ,MF_FULL_PRTL_CD                                            
                    ,MF_FUL_PRTL_STS_CD                                         
                    ,RGSTN_CD                                                   
                    ,FNBR                                                       
                    ,FND_ACT_NBR_STS_CD                                         
                    ,DSTBN_SIDE_CD                                              
                    ,PRCS_DT                                                    
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                 FROM VMFHSTY                                                   
                 WHERE CLIENT_NBR   = '0010'                                    
                  AND  ACAT_CONTROL_NBR = :DCLVTRNHSTY.ACAT-CONTROL-NBR         
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
                                                                                
                                                                                
      * DECLARE CURSOR TO OBTAIN ALL HISTORY OPN RECS FOR THIS CNTL NBR         
           EXEC SQL                                                             
              DECLARE VOPTHSTY_CRSR CURSOR FOR                                  
                 SELECT                                                         
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,ASSET_SEQ_NBR                                              
                    ,BS_CD                                                      
                    ,BS_STTS_CD                                                 
                    ,PTCL_CD                                                    
                    ,PTCL_STTS_CD                                               
                    ,OPTN_OPN_CLSD_CD                                           
                    ,OPT_OPN_CLS_STS_CD                                         
                    ,SYM_CD                                                     
                    ,SYM_STTS_CD                                                
                    ,EXPTN_DT                                                   
                    ,STPRC_INTEGER_AMT                                          
                    ,STPRC_INTR_STTS_CD                                         
                    ,STPRC_FRCTN_AMT                                            
                    ,STPRC_FRCT_STTS_CD                                         
                    ,DLVR_OCC_NBR                                               
                    ,OPTN_ACCT_TYPE_CD                                          
                    ,OPT_ACT_TYP_STS_CD                                         
                    ,ACCT_SUB_CD                                                
                    ,ACCT_SUB_STTS_CD                                           
                    ,OPTN_CMNT_TXT                                              
                    ,OPTN_CMNT_STTS_CD                                          
                    ,OPTN_EXPTN_DT_CD                                           
                    ,OPT_OCC_DLV_STS_CD                                         
                    ,ACCT_TYPE_MSMT_IND                                         
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,PRGM_NM                                                    
                    ,CICS_TERM_ID_CD                                            
LRM008              ,STPRC_INTEGER2_AMT                                         
                 FROM VOPTHSTY                                                  
                 WHERE CLIENT_NBR   = '0010'                                    
                  AND  ACAT_CONTROL_NBR = :DCLVTRNHSTY.ACAT-CONTROL-NBR         
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
                                                                                
                                                                                
      *--------------------------------------------------------------           
      * INCLUDE FOR DB2 COMMUNICATIONS AREA.                                    
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE SQLCA                                                    
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
                                                                                
       01  WORK-AREA.                                                           
           05  PROGRAM-NAME            PIC X(08) VALUE 'CATEXT10'.              
           05  WS-INDEX                PIC 9(04) COMP.                          
           EJECT                                                                
                                                                                
                                                                                
       01  WS-MISC.                                                             
           05  SUB1                         PIC 9(2)  VALUE ZERO.               
           05  ABORT-CODE     COMP SYNC     PIC S9(4) VALUE ZERO.               
CHRIS1                                                                          
CHRIS1 01  DSNTIAR                     PIC X(08) VALUE 'DSNTIAR'.               
CHRIS1 01  WS-DB2-MESSAGE-AREA.                                                 
CHRIS1      05  WS-DB2-MSG-LEN          PIC S9(04) COMP VALUE +960.             
CHRIS1      05  WS-ERROR-MSG            PIC X(80) OCCURS 12 TIMES               
CHRIS1              INDEXED BY WS-ERROR-INDEX.                                  
       01  WS-ERR-LINE-LEN             PIC S9(09) COMP VALUE +80.               
                                                                                
           EJECT                                                                
       PROCEDURE DIVISION.                                                      
                                                                                
           COPY MSGCOBO.                                                        
                                                                                
           OPEN OUTPUT EXTRACT-FILE.                                            
           EXEC SQL                                                             
               SET :WS-TIMESTAMP = CURRENT TIMESTAMP                            
           END-EXEC.                                                            
           MOVE 'DATE    '  TO RECORD-SEG-ID                                    
           MOVE WS-TIMESTAMP TO RECORD-DETAIL                                   
           WRITE EXTRACT-RECORD.                                                
                                                                                
           PERFORM 2000-EXTRACT-VTRNHSTY-RTN.                                   
                                                                                
           CLOSE EXTRACT-FILE.                                                  
                                                                                
           DISPLAY 'VTRNHSTY FETCHED ' WS-VTRNHSTY-FETCHED                      
           DISPLAY 'VTRNHSTY SKIPPED ' WS-RECORDS-SKIPPED                       
           DISPLAY 'RECORDS WRITTEN:'.                                          
           DISPLAY 'VTRNHSTY = ' WS-VTRNHSTY-COUNT                              
           DISPLAY 'VASTHSTY = ' WS-VASTHSTY-COUNT                              
           DISPLAY 'VMFHSTY  = ' WS-VMFHSTY-COUNT                               
           DISPLAY 'VOPTHSTY = ' WS-VOPTHSTY-COUNT                              
                                                                                
           GOBACK.                                                              
           EJECT                                                                
                                                                                
           EJECT                                                                
       2000-EXTRACT-VTRNHSTY-RTN.                                               
           EXEC SQL OPEN VTRNHSTY_CRSR END-EXEC                                 
           IF SQLCODE NOT = +0                                                  
              MOVE 2000 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
              EXEC SQL                                                          
                 FETCH VTRNHSTY_CRSR                                            
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
                     ,:DCLVTRNHSTY.ACCT-TRNFR-FEE-AMT                   -3.     
                     ,:DCLVTRNHSTY.ACCT-IRA-TRMNT-AMT                   -3.     
                     ,:DCLVTRNHSTY.ACCT-IRA-MAINT-AMT                   -3.     
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
LRM003               ,:DCLVTRNHSTY.ACCT-FRZN-IND                                
LRM004               ,:DCLVTRNHSTY.BRANCH-ALTNT-CD                              
LRM004               ,:DCLVTRNHSTY.GIFT-IND                                     
LRM004               ,:DCLVTRNHSTY.RSTR-TRD-90-DY-IND                           
LRM004               ,:DCLVTRNHSTY.REG-T-IND                                    
LRM004               ,:DCLVTRNHSTY.ADOPT-AGRMT-IND                              
LRM004               ,:DCLVTRNHSTY.RR-ORGNL-CD                                  
LRM006               ,:DCLVTRNHSTY.CVRSN-ACCT-NBR                               
DJ0002               ,:DCLVTRNHSTY.AUCTION-RT-IND                               
LRM008               ,:DCLVTRNHSTY.PENNY-STK-IND                                
              END-EXEC                                                          
                                                                                
              EVALUATE SQLCODE                                                  
                 WHEN +100                                                      
                    CONTINUE                                                    
                 WHEN +0                                                        
                    ADD 1 TO WS-VTRNHSTY-FETCHED                                
TEST                DISPLAY 'FETCHED ' ACAT-CONTROL-NBR OF DCLVTRNHSTY          
                    MOVE ACCT-DLVR-NBR OF DCLVTRNHSTY TO WS-BRANCH-TEST OMG15DF1
                    IF WS-BRANCH-RIDGE                                          
                       PERFORM 2050-UPD-VTRNHSTY-CONV-RTN                       
                       MOVE 'VTRNHSTY' TO RECORD-SEG-ID                         
                       MOVE '0210' TO CLIENT-NBR OF DCLVTRNHSTY                 
                       MOVE DCLVTRNHSTY TO RECORD-DETAIL                        
                       WRITE EXTRACT-RECORD                                     
                       ADD 1 TO WS-VTRNHSTY-COUNT                               
                       PERFORM 2100-FETCH-VASTHSTY-RECORDS                      
                       PERFORM 2200-FETCH-VMFHSTY-RECORDS                       
                       PERFORM 2300-FETCH-VOPTHSTY-RECORDS                      
                    ELSE                                                        
                    IF ACCT-DLVR-NBR OF DCLVTRNHSTY (1:3) = '250'       OMG15DF1
                       MOVE ACCT-DLVR-NBR OF DCLVTRNHSTY                OMG15DF1
                                         TO WS-ACCOUNT-B250-TEST        OMG15DF1
                       IF WS-ACCOUNT-B250-RIDGE                                 
                          PERFORM 2050-UPD-VTRNHSTY-CONV-RTN                    
                          MOVE 'VTRNHSTY' TO RECORD-SEG-ID                      
                          MOVE '0210' TO CLIENT-NBR OF DCLVTRNHSTY              
                          MOVE DCLVTRNHSTY TO RECORD-DETAIL                     
                          WRITE EXTRACT-RECORD                                  
                          ADD 1 TO WS-VTRNHSTY-COUNT                            
                          PERFORM 2100-FETCH-VASTHSTY-RECORDS                   
                          PERFORM 2200-FETCH-VMFHSTY-RECORDS                    
                          PERFORM 2300-FETCH-VOPTHSTY-RECORDS                   
                       ELSE                                                     
                          ADD 1 TO WS-RECORDS-SKIPPED                           
                    ELSE                                                        
                       ADD 1 TO WS-RECORDS-SKIPPED                              
                    END-IF                                                      
                    END-IF                                                      
                 WHEN OTHER                                                     
                    MOVE 2010 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           IF SQLCODE NOT = +100                                                
              MOVE 2020 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           EXEC SQL                                                             
              CLOSE VTRNHSTY_CRSR                                               
           END-EXEC                                                             
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 2030 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           ELSE                                                                 
              MOVE +0                       TO  SQLCODE                         
           END-IF.                                                              
                                                                                
       2050-UPD-VTRNHSTY-CONV-RTN.                                              
           MOVE 'CONVERSION' TO CVRSN-ACCT-NBR OF DCLVTRNHSTY.                  
           EXEC SQL                                                             
              UPDATE VTRNHSTY                                                   
              SET CVRSN_ACCT_NBR = :DCLVTRNHSTY.CVRSN-ACCT-NBR                  
                 WHERE CLIENT_NBR   = '0010'                                    
                  AND  ACAT_CONTROL_NBR = :DCLVTRNHSTY.ACAT-CONTROL-NBR         
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              DISPLAY '=========================='                              
              DISPLAY '**** ABEND AT UPDATE  ****'                              
              DISPLAY '=========================='                              
              MOVE 2050 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
           EXEC SQL                                                             
                COMMIT                                                          
           END-EXEC.                                                            
           IF SQLCODE NOT = +0                                                  
              DISPLAY '=========================='                              
              DISPLAY '**** ABEND AT COMMIT  ****'                              
              DISPLAY '=========================='                              
              MOVE 2055 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF.                                                              
      ******************                                                        
       2100-FETCH-VASTHSTY-RECORDS.                                             
      ******************                                                        
                                                                                
             EXEC SQL                                                           
                OPEN VASTHSTY_CRSR                                              
             END-EXEC                                                           
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 2100 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
                 EXEC SQL                                                       
                    FETCH VASTHSTY_CRSR                                         
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
                  ,:DCLVASTHSTY.CAGE-TAG-NBR                                    
                  ,:DCLVASTHSTY.ENTERED-TAG-NBR                                 
                  ,:DCLVASTHSTY.NTWK-CNTL-CD                                    
                  ,:DCLVASTHSTY.FUND-PROC-CD                                    
                  ,:DCLVASTHSTY.FUND-RGSTN-STTS                                 
LRM002            ,:DCLVASTHSTY.SCRTY-866-NBR                                   
LRM002            ,:DCLVASTHSTY.ASSET-866-QTY                                   
DJ0002            ,:DCLVASTHSTY.AUCTION-RT-IND                                  
                 END-EXEC                                                       
                                                                                
              EVALUATE SQLCODE                                                  
                 WHEN +100                                                      
                   CONTINUE                                                     
                 WHEN +0                                                        
                    MOVE 'VASTHSTY' TO RECORD-SEG-ID                            
                    MOVE '0210' TO CLIENT-NBR OF DCLVASTHSTY                    
                    MOVE DCLVASTHSTY TO RECORD-DETAIL                           
                    WRITE EXTRACT-RECORD                                        
                    ADD 1 TO WS-VASTHSTY-COUNT                                  
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           IF SQLCODE NOT = +100                                                
              MOVE 2110 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           EXEC SQL                                                             
              CLOSE VASTHSTY_CRSR                                               
           END-EXEC                                                             
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 2120 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
       2200-FETCH-VMFHSTY-RECORDS.                                              
                                                                                
             EXEC SQL                                                           
                OPEN VMFHSTY_CRSR                                               
             END-EXEC                                                           
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 2200 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
                 EXEC SQL                                                       
                    FETCH VMFHSTY_CRSR                                          
                      INTO                                                      
                   :DCLVMFHSTY.CLIENT-NBR                                       
                  ,:DCLVMFHSTY.ACAT-CONTROL-NBR                                 
                  ,:DCLVMFHSTY.ASSET-SEQ-NBR                                    
                  ,:DCLVMFHSTY.BK-PHSCL-SHR-CD                                  
                  ,:DCLVMFHSTY.BK-PHSC-SHR-STS-CD                               
                  ,:DCLVMFHSTY.NTWRK-CNTL-CD                                    
                  ,:DCLVMFHSTY.NTWRK-CNTL-STTS-CD                               
                  ,:DCLVMFHSTY.ACCT-TYPE-CD                                     
                  ,:DCLVMFHSTY.ACCT-TYPE-STTS-CD                                
                  ,:DCLVMFHSTY.DVDND-CD                                         
                  ,:DCLVMFHSTY.DVDND-STTS-CD                                    
                  ,:DCLVMFHSTY.DVDND-PAYEE-CD                                   
                  ,:DCLVMFHSTY.DVDND-PYE-STTS-CD                                
                  ,:DCLVMFHSTY.LTCG-CD                                          
                  ,:DCLVMFHSTY.BRKR-EXCTG-NBR                                   
                  ,:DCLVMFHSTY.BRKR-EXCTG-STTS-CD                               
                  ,:DCLVMFHSTY.STCG-CD                                          
                  ,:DCLVMFHSTY.MF-FULL-PRTL-CD                                  
                  ,:DCLVMFHSTY.MF-FUL-PRTL-STS-CD                               
                  ,:DCLVMFHSTY.RGSTN-CD                                         
                  ,:DCLVMFHSTY.FNBR                                             
                  ,:DCLVMFHSTY.FND-ACT-NBR-STS-CD                               
                  ,:DCLVMFHSTY.DSTBN-SIDE-CD                                    
                  ,:DCLVMFHSTY.PRCS-DT                                          
                  ,:DCLVMFHSTY.CRT-TMSTP                                        
                  ,:DCLVMFHSTY.UPDT-TMSTP                                       
                  ,:DCLVMFHSTY.CICS-TERM-ID-CD                                  
                  ,:DCLVMFHSTY.PRGM-NM                                          
                 END-EXEC                                                       
                                                                                
              EVALUATE SQLCODE                                                  
                 WHEN +100                                                      
                   CONTINUE                                                     
                 WHEN +0                                                        
                    MOVE 'VMFHSTY' TO RECORD-SEG-ID                             
                    MOVE '0210' TO CLIENT-NBR OF DCLVMFHSTY                     
                    MOVE DCLVMFHSTY TO RECORD-DETAIL                            
                    WRITE EXTRACT-RECORD                                        
                    ADD 1 TO WS-VMFHSTY-COUNT                                   
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           IF SQLCODE NOT = +100                                                
              MOVE 2210 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           EXEC SQL                                                             
              CLOSE VMFHSTY_CRSR                                                
           END-EXEC                                                             
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 2220 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
       2300-FETCH-VOPTHSTY-RECORDS.                                             
                                                                                
           EXEC SQL                                                             
              OPEN VOPTHSTY_CRSR                                                
           END-EXEC                                                             
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 2300 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
                 EXEC SQL                                                       
                    FETCH VOPTHSTY_CRSR                                         
                      INTO                                                      
                   :DCLVOPTHSTY.CLIENT-NBR                                      
                  ,:DCLVOPTHSTY.ACAT-CONTROL-NBR                                
                  ,:DCLVOPTHSTY.ASSET-SEQ-NBR                                   
                  ,:DCLVOPTHSTY.BS-CD                                           
                  ,:DCLVOPTHSTY.BS-STTS-CD                                      
                  ,:DCLVOPTHSTY.PTCL-CD                                         
                  ,:DCLVOPTHSTY.PTCL-STTS-CD                                    
                  ,:DCLVOPTHSTY.OPTN-OPN-CLSD-CD                                
                  ,:DCLVOPTHSTY.OPT-OPN-CLS-STS-CD                              
                  ,:DCLVOPTHSTY.SYM-CD                                          
                  ,:DCLVOPTHSTY.SYM-STTS-CD                                     
                  ,:DCLVOPTHSTY.EXPTN-DT                                        
                  ,:DCLVOPTHSTY.STPRC-INTEGER-AMT                               
                  ,:DCLVOPTHSTY.STPRC-INTR-STTS-CD                              
                  ,:DCLVOPTHSTY.STPRC-FRCTN-AMT                                 
                  ,:DCLVOPTHSTY.STPRC-FRCT-STTS-CD                              
                  ,:DCLVOPTHSTY.DLVR-OCC-NBR                                    
                  ,:DCLVOPTHSTY.OPTN-ACCT-TYPE-CD                               
                  ,:DCLVOPTHSTY.OPT-ACT-TYP-STS-CD                              
                  ,:DCLVOPTHSTY.ACCT-SUB-CD                                     
                  ,:DCLVOPTHSTY.ACCT-SUB-STTS-CD                                
                  ,:DCLVOPTHSTY.OPTN-CMNT-TXT                                   
                  ,:DCLVOPTHSTY.OPTN-CMNT-STTS-CD                               
                  ,:DCLVOPTHSTY.OPTN-EXPTN-DT-CD                                
                  ,:DCLVOPTHSTY.OPT-OCC-DLV-STS-CD                              
                  ,:DCLVOPTHSTY.ACCT-TYPE-MSMT-IND                              
                  ,:DCLVOPTHSTY.CRT-TMSTP                                       
                  ,:DCLVOPTHSTY.UPDT-TMSTP                                      
                  ,:DCLVOPTHSTY.PRGM-NM                                         
                  ,:DCLVOPTHSTY.CICS-TERM-ID-CD                                 
LRM008            ,:DCLVOPTHSTY.STPRC-INTEGER2-AMT                              
                 END-EXEC                                                       
                                                                                
              EVALUATE SQLCODE                                                  
                 WHEN +100                                                      
                   CONTINUE                                                     
                 WHEN +0                                                        
                    MOVE 'VOPTHSTY ' TO RECORD-SEG-ID                           
                    MOVE '0210' TO CLIENT-NBR OF DCLVOPTHSTY                    
                    MOVE DCLVOPTHSTY TO RECORD-DETAIL                           
                    WRITE EXTRACT-RECORD                                        
                    ADD 1 TO WS-VOPTHSTY-COUNT                                  
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           IF SQLCODE NOT = +100                                                
              MOVE 2310 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           EXEC SQL                                                             
              CLOSE VOPTHSTY_CRSR                                               
           END-EXEC                                                             
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 2320 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
           EJECT                                                                
                                                                                
      *============================                                             
       SQL-ERROR-ROUTINE.                                                       
      *============================                                             
CHRIS1                                                                          
CHRIS1     CALL DSNTIAR USING SQLCA WS-DB2-MESSAGE-AREA                         
CHRIS1                              WS-ERR-LINE-LEN.                            
CHRIS1     PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                           
CHRIS1       UNTIL WS-ERROR-INDEX GREATER THAN 12                               
CHRIS1             IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES                    
CHRIS1                DISPLAY WS-ERROR-MSG (WS-ERROR-INDEX)                     
CHRIS1             END-IF                                                       
CHRIS1     END-PERFORM.                                                         
CHRIS1                                                                          
CHRIS1     DISPLAY 'CATEXT10 DB2 PROBLEM'.                                      
CHRIS1     DISPLAY 'SQL CODE = ' SQLCODE.                                       
CHRIS1     DISPLAY 'SQLQA = ' SQLCA.                                            
CHRIS1     DISPLAY 'PROGRAM ABORTED'.                                           
                                                                                
           EXEC SQL  ROLLBACK  END-EXEC.                                        
                                                                                
           PERFORM 9999-ABEND.                                                  
       9999-ABEND.                                                              
           CALL  ABEND  USING ABORT-CODE.                                       
