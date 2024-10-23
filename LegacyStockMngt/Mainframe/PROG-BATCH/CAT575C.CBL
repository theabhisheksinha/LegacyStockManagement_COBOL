000001* PDX    - CAT575C  C0353648 04/14/14 11:46:50 TBLAMUR            00001000
000001* LRM006 SSR 100417 DST/SCHWAB NEW COL FOR MF AGENT                       
000001* PDX    - CAT575C  C0336625 06/26/13 12:34:46 TBLAMUR            00001000
000001* LRM005 SSR 85742 DST/SCHWAB SUPER OMNI FUNDS, HOLD MF AGENT IN          
000001*   STTS COL TO USE IN CAT501 TO PASS ON F/R.                             
000001* PDX    - CAT575C  C0222024 09/07/05 09:10:15 TBLAMUR            00001000
000001* LRM004 SSR 00039440 - FUL RCVR BUILT INTRA-DAY (HOLD),                  
000001*  UPDATE IT TO SUBMIT AT 11PM CAT875 RUN PARM=ED.                        
000001* PDX    - CAT575C  C0214363 01/14/05 08:39:14 TBLAMUR            00001000
000001* LRM003 SSR 00039556 - BUILD F/R NON FULL RCVR INTRA-DAY (HOLD),         
000001*  AND UPDATE IT TO SUBMIT AT 3PM.                                        
000001* PDX    - CAT575C  C0158444 05/07/01 11:33:15 TBLAMUR            00001000
000001* PDX    - CAT575C  C0152145 02/21/01 04:20:13 TBLAMUR            00001000
000001* PDX    - CAT575C  C0150927 12/08/00 14:07:34 TBLAMUR            00001000
000001* PDX    - CAT575C  C0119343 12/14/98 14:33:27 TBTARYB            00001000
000001* PDX    - CAT575C  C0117593 11/13/98 11:15:54 TBTARYB            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    CAT575C.                                                  
                                                                                
       DATE-WRITTEN.  OCTOBER 98.                                               
      ******************************************************************        
      *                          REMARKS                               *        
      ******************************************************************        
      * THIS PROGRAM IS THE SECOND OF THE THREE PROGRAMS THAT ARE      *        
      * INTENDED TO CREATE FUND/SERV RECORD IN VFNDRGST TABLE.  THIS   *        
      * PROGRAM READS REQUESTS FOR FR CREATION FROM FR-REQUEST FILE    *        
      ******************************************************************        
                                                                                
           EJECT                                                                
      ******************************************************************        
       ENVIRONMENT DIVISION.                                                    
      ******************************************************************        
                                                                                
       INPUT-OUTPUT SECTION.                                                    
                                                                                
       FILE-CONTROL.                                                            
                                                                                
           SELECT FR-FILE           ASSIGN  TO  FRFILE.                         
                                                                                
      ******************************************************************        
       DATA DIVISION.                                                           
      ******************************************************************        
                                                                                
       FILE SECTION.                                                            
                                                                                
       FD  FR-FILE                                                              
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS                                             
           LABEL RECORDS ARE STANDARD                                           
           RECORD CONTAINS 750 CHARACTERS.                                      
                                                                                
        01  FR-REC                          PIC  X(750).                        
                                                                                
           EJECT                                                                
      ******************************************************************        
       WORKING-STORAGE SECTION.                                                 
      ******************************************************************        
                                                                                
       77  ABEND-CODE                 COMP  PIC S9(04)  VALUE +9999.            
       77  EOF-FR-FILE-SW                   PIC  X(01).                         
           88  EOF-FR-FILE                              VALUE 'Y'.              
           88  NOT-EOF-FR-FILE                          VALUE 'N'.              
       77  WS-DATE-TIME                     PIC  X(26).                         
       77  S1                               PIC  9(02).                         
       77  WS-NA-LINE-NBR             COMP  PIC S9(04).                         
       77  WS-CUST-NA-LINE-TXT              PIC  X(35).                         
       77  INPUT-CNTR                       PIC  9(09)  VALUE ZEROES.           
       77  INSERTED-FR                      PIC  9(09)  VALUE ZEROES.           
       77  UPDATED-FR                       PIC  9(09)  VALUE ZEROES.           
       77  INSERTED-NA                      PIC  9(09)  VALUE ZEROES.           
           COPY STUBCPY.                                                        
       01  DSNTIAR                          PIC  X(08)  VALUE 'DSNTIAR'.        
       01  WS-DB2-MESSAGE-AREA.                                                 
           05  WS-DB2-MSG-LEN         COMP  PIC S9(04)  VALUE +960.             
           05  WS-ERROR-MSG                 PIC  X(80)  OCCURS 12 TIMES         
               INDEXED BY WS-ERROR-INDEX.                                       
       01  WS-ERR-LINE-LEN            COMP  PIC S9(09)  VALUE +80.              
                                                                                
                                                                                
           EJECT                                                                
           COPY CATFR.                                                          
                                                                                
           EXEC SQL                                                             
              INCLUDE VFNDRGST                                                  
           END-EXEC.                                                            
                                                                                
           EXEC SQL                                                             
              INCLUDE VFNDNA                                                    
           END-EXEC.                                                            
                                                                                
           EXEC SQL                                                             
              INCLUDE SQLCA                                                     
           END-EXEC.                                                            
                                                                                
      ******************************************************************        
       LINKAGE SECTION.                                                         
      ******************************************************************        
                                                                                
LRM003 01  PARM-AREA.                                                           
LRM003     05  PARM-LENGTH                  PIC S9(04)  COMP.                   
LRM003     05  LS-PARM-RUN-INDICATOR        PIC  X(02).                         
LRM003         88  PARM-INTRA-DAY-RUN                  VALUE 'ID'.              
LRM003         88  PARM-3PM-RUN                        VALUE 'DY'.              
LRM004         88  PARM-11PM-RUN                       VALUE 'ED'.              
           EJECT                                                                
      ******************************************************************        
       PROCEDURE DIVISION USING PARM-AREA.                                      
      ******************************************************************        
                                                                                
           COPY MSGCOBO.                                                        
                                                                                
           PERFORM INITIAL-ROUTINE.                                             
                                                                                
           PERFORM PROCESS-ROUTINE                                              
              UNTIL EOF-FR-FILE.                                                
                                                                                
                                                                                
           PERFORM EOJ-ROUTINE.                                                 
                                                                                
           GOBACK.                                                              
                                                                                
           EJECT                                                                
      *****************                                                         
       PROCESS-ROUTINE.                                                         
      *****************                                                         
                                                                                
           PERFORM INSERT-FNDRGST.                                              
                                                                                
           IF SQLCODE = -803                                                    
LRM003        IF (PARM-3PM-RUN                                                  
LRM004        OR PARM-11PM-RUN)                                                 
LRM003           PERFORM UPDATE-VFNDRGST                                        
LRM003        ELSE                                                              
                 PERFORM DELETE-VFNDRGST                                        
                 PERFORM INSERT-FNDRGST                                         
           END-IF.                                                              
                                                                                
           READ FR-FILE                   INTO  FR-RECORD                       
              AT END SET EOF-FR-FILE        TO  TRUE                            
           END-READ.                                                            
                                                                                
           IF NOT EOF-FR-FILE                                                   
              ADD 1                         TO  INPUT-CNTR                      
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ****************                                                          
       INSERT-FNDRGST.                                                          
      ****************                                                          
                                                                                
           INITIALIZE DCLVFNDRGST.                                              
LRM***** THE FOLLOWING 1 LINE ADDED TO CARRY THE 2ND BYTE OF THE                
LRM***** W8 COUNTRY OVRD IN THE STTS FIELD. THIS IS BECAUSE THE DB2             
LRM***** FIELD IS DEFINED WRONG AS ONLY ONE BYTE.                               
           MOVE FR-W8-OVRD-CNTRY-CD-BYTE2   TO  W8-ORD-CTRY-STS-CD.             
                                                                                
LRM003     IF PARM-INTRA-DAY-RUN                                                
LRM004*****AND FR-TRNFR-TYPE-CD NOT = 'FUL'                                     
LRM003        MOVE 'H' TO NSCC-PEND-CD OF DCLVFNDRGST                           
LRM003     END-IF.                                                              
                                                                                
LRM005     IF FR-MF-SCHWAB = 'S'                                                
LRM005         MOVE 'S' TO FUND-ACCT-STTS-CD OF DCLVFNDRGST                     
LRM006         MOVE '1' TO FND-AGNT-CD OF DCLVFNDRGST                           
LRM005     ELSE                                                                 
LRM005         MOVE SPACES TO FUND-ACCT-STTS-CD OF DCLVFNDRGST                  
LRM005     END-IF.                                                              
                                                                                
           EXEC SQL                                                             
              INSERT INTO VFNDRGST                                              
                 ( CLIENT_NBR                                                   
                  ,ACAT_CONTROL_NBR                                             
                  ,ASSET_SEQ_NBR                                                
                  ,SBMTG_PRTCP_NBR                                              
                  ,SBMT_PRT_NR_STS_CD                                           
                  ,CONTROL_NBR_STS_CD                                           
                  ,AST_SEQ_NBR_STS_CD                                           
                  ,SYS_ACT_CD                                                   
                  ,SYS_RJCT_RSN_CD                                              
                  ,MF_TRANS_TYPE_CD                                             
                  ,MF_TRAN_TYP_STS_CD                                           
                  ,RCRD_STTS_CD                                                 
                  ,NRA_TAX_PCT                                                  
                  ,NRA_TAX_PCT_CD                                               
                  ,DSBMT_ACCRL_CD                                               
                  ,DSBMT_ACCRL_STS_CD                                           
                  ,DSBMT_FRCTN_CSH_CD                                           
                  ,DSBMT_FRCTN_STS_CD                                           
                  ,BK_PHSCL_SHR_CD                                              
                  ,BK_PHSC_SHR_STS_CD                                           
                  ,FRCTN_CD                                                     
                  ,FRCTN_STTS_CD                                                
                  ,DLRVY_CD                                                     
                  ,TPA_NBR                                                      
                  ,TPA_NBR_STTS_CD                                              
                  ,CUST_NM                                                      
                  ,CUST_NM_STTS_CD                                              
                  ,FUND_ACCT_CD                                                 
                  ,FUND_ACCT_STTS_CD                                            
                  ,BRKR_EXCTG_NBR                                               
                  ,BRKR_EXCTG_STTS_CD                                           
                  ,DSBMT_RSDL_CD                                                
                  ,DSBMT_RSDL_STS_CD                                            
                  ,NTWRK_CNTL_CD                                                
                  ,NTWRK_CNTL_STTS_CD                                           
                  ,DVDND_CD                                                     
                  ,DVDND_STTS_CD                                                
                  ,FNBR                                                         
                  ,FND_ACT_NBR_STS_CD                                           
                  ,LTCG_CD                                                      
                  ,SS_TIN_CD                                                    
                  ,STCG_CD                                                      
                  ,WTHLD_CD                                                     
                  ,WTHLD_STTS_CD                                                
                  ,PYBL_INFO_CD                                                 
                  ,PYBL_INFO_STTS_CD                                            
                  ,ZIP5_CD                                                      
                  ,ZIP5_STTS_CD                                                 
                  ,ZIP4_CD                                                      
                  ,ZIP4_STTS_CD                                                 
                  ,SOC_CD                                                       
                  ,SOC_STTS_CD                                                  
                  ,NAV_ACCT_IND                                                 
                  ,NAV_ACCT_STTS_CD                                             
                  ,MRGN_ACCT_IND                                                
                  ,MRGN_ACCT_STTS_CD                                            
                  ,CHCK_WRTNG_IND                                               
                  ,CHCK_WRTNG_STTS_CD                                           
                  ,SL_ST_CD                                                     
                  ,SL_ST_STTS_CD                                                
                  ,CNTRY_ORGN_CD                                                
                  ,CNTRY_ORGN_STTS_CD                                           
                  ,ACCT_RR_NM                                                   
                  ,ACCT_RR_NM_STTS_CD                                           
                  ,ACCT_RR_CD                                                   
                  ,ACCT_RR_STTS_CD                                              
                  ,BRCH_NBR                                                     
                  ,BRCH_NBR_STTS_CD                                             
                  ,PYBL_QTY                                                     
                  ,PYBL_QTY_STTS_CD                                             
                  ,MEMO_TXT                                                     
                  ,MEMO_STTS_CD                                                 
                  ,ACH_IND                                                      
                  ,ACH_STTS_CD                                                  
                  ,PAC_IND                                                      
                  ,PAC_STTS_CD                                                  
                  ,SWP_IND                                                      
                  ,SWP_STTS_CD                                                  
                  ,ROA_LOI_AMT                                                  
                  ,ROA_LOI_STTS_CD                                              
                  ,LOI_DT                                                       
                  ,LOI_STTS_CD                                                  
                  ,TRD_RLTD_IND                                                 
                  ,TRD_RLTD_STTS_CD                                             
                  ,ACCT_RLTD_NBR                                                
                  ,ACCT_RLTD_STTS_CD                                            
                  ,ACCT_RLTD_CD                                                 
                  ,ACCT_RLT_IN_STS_CD                                           
                  ,SWP_PAC_EFFCT_DT                                             
                  ,SWP_PAC_DT_STTS_CD                                           
                  ,CDSC_PYMNT_CD                                                
                  ,CDSC_PYMNT_STTS_CD                                           
                  ,DSBMT_OPTN_CD                                                
                  ,DSBMT_OPTN_STTS_CD                                           
                  ,DSBMT_AMT                                                    
                  ,DSBMT_AMT_STTS_CD                                            
                  ,PYMNT_JAN_IND                                                
                  ,PYMNT_FEB_IND                                                
                  ,PYMNT_MAR_IND                                                
                  ,PYMNT_APR_IND                                                
                  ,PYMNT_MAY_IND                                                
                  ,PYMNT_JUN_IND                                                
                  ,PYMNT_JUL_IND                                                
                  ,PYMNT_AUG_IND                                                
                  ,PYMNT_SEP_IND                                                
                  ,PYMNT_OCT_IND                                                
                  ,PYMNT_NOV_IND                                                
                  ,PYMNT_DEC_IND                                                
                  ,PYMNT_MO_STTS_CD                                             
                  ,PYMNT_DT_CD                                                  
                  ,PYMNT_DT_STTS_CD                                             
                  ,RTRMT_TAX_CD                                                 
                  ,RTRMT_TAX_STTS_CD                                            
                  ,SHRHR_BNK_ACCT_NBR                                           
                  ,SHR_BNK_ACT_STS_CD                                           
                  ,SHRHR_BNK_TYPE_CD                                            
                  ,SHR_BNK_TYP_STS_CD                                           
                  ,CHCK_FRST_DT                                                 
                  ,CHCK_FRS_DT_STS_CD                                           
                  ,ABA_ROUTING_NBR                                              
                  ,ABA_ROTNG_STTS_CD                                            
                  ,COST_BSS_CD                                                  
                  ,COST_BS_OPT_STS_CD                                           
                  ,RCRD_LNGTH_STTS_CD                                           
                  ,SS_TIN_NBR                                                   
                  ,LGCL_SEQ_NR_STS_CD                                           
                  ,TRANS_TYPE_STTS_CD                                           
                  ,TRNFR_TYPE_CD                                                
                  ,TRNFR_TYPE_STTS_CD                                           
                  ,RCV_NBR_STTS_CD                                              
                  ,DLVR_NBR_STS_CD                                              
                  ,ISIN_CNTRY_CD                                                
                  ,ISIN_CNTRY_STTS_CD                                           
                  ,ISIN_SEC_ISSUE_CD                                            
                  ,ISIN_SEC_IS_STS_CD                                           
                  ,ISIN_SEC_CDG_CD                                              
                  ,ISIN_SEC_CD_STS_CD                                           
                  ,PI_DLRVY_CD                                                  
                  ,PI_DLVRY_STTS_CD                                             
                  ,AST_PRC_CTG_STS_CD                                           
                  ,SS_TIN_STTS_CD                                               
                  ,SS_TIN_NBR_STTS_CD                                           
                  ,CUST_NM_LN_STTS_CD                                           
                  ,NM_END_LN_QTY                                                
                  ,NM_END_LN_STTS_CD                                            
                  ,PHSCL_SEQ_STTS_CD                                            
                  ,DSTBN_SIDE_CD                                                
                  ,PRCS_DT                                                      
                  ,ACTION_TYPE_CD                                               
                  ,FND_SERV_CNTL_NBR                                            
                  ,CUST_FUND_NM                                                 
                  ,CERT_NBR                                                     
                  ,ASSET_QTY                                                    
                  ,ASSET_ORGNL_QTY                                              
                  ,ISO_CRNCY_CD                                                 
                  ,ASSET_AMT                                                    
                  ,DB_CR_CD                                                     
                  ,ASSET_DESC_TXT                                               
                  ,CERT_DT                                                      
                  ,STTLM_ASCTD_DT                                               
                  ,STTLM_DT                                                     
                  ,RJCT_CD                                                      
                  ,NSCC_NON_ADP_IND                                             
                  ,NSCC_PEND_CD                                                 
                  ,NSCC_ACK_IND                                                 
                  ,CICS_TERM_ID_CD                                              
                  ,PRGM_NM                                                      
                  ,CRT_TMSTP                                                    
                  ,UPDT_TMSTP                                                   
                  ,SECURITY_ADP_NBR                                             
                  ,DLVR_NBR                                                     
                  ,ROA_LOI_CD                                                   
                  ,FUND_BK_CD                                                   
                  ,W8_WTHLD_CD                                                  
                  ,W8_CERT_DT                                                   
                  ,W8_EXPTN_DT                                                  
                  ,W8_OVRD_NRA_SPC_RT                                           
                  ,W8_QULFD_INTRM_IND                                           
                  ,W8_OVRD_CNTRY_CD                                             
                  ,W8_WTHLD_STTS_CD                                             
                  ,W8_CERT_DT_STTS_CD                                           
                  ,W8_EXPTN_DT_STS_CD                                           
                  ,W8_SPCL_RT_STTS_CD                                           
                  ,W8_QLFD_INT_STS_CD                                           
                  ,W8_ORD_CTRY_STS_CD                                           
LRM006            ,FND_AGNT_CD)                                                 
              VALUES                                                            
                 ( :FR-CLIENT-NBR                                               
                  ,:FR-ACAT-CONTROL-NBR                                         
                  ,:FR-ASSET-SEQ-NBR                                            
                  ,:FR-SBMTG-PRTCP-NBR                                          
                  ,:DCLVFNDRGST.SBMT-PRT-NR-STS-CD                              
                  ,:DCLVFNDRGST.CONTROL-NBR-STS-CD                              
                  ,:DCLVFNDRGST.AST-SEQ-NBR-STS-CD                              
                  ,:DCLVFNDRGST.SYS-ACT-CD                                      
                  ,:FR-SYS-RJCT-RSN-CD                                          
                  ,:FR-MF-TRANS-TYPE-CD                                         
                  ,:DCLVFNDRGST.MF-TRAN-TYP-STS-CD                              
                  ,:DCLVFNDRGST.RCRD-STTS-CD                                    
                  ,:FR-NRA-TAX-PCT                                              
                  ,:DCLVFNDRGST.NRA-TAX-PCT-CD                                  
                  ,:FR-DSBMT-ACCRL-CD                                           
                  ,:DCLVFNDRGST.DSBMT-ACCRL-STS-CD                              
                  ,:FR-DSBMT-FRCTN-CSH-CD                                       
                  ,:DCLVFNDRGST.DSBMT-FRCTN-STS-CD                              
                  ,:FR-BK-PHSCL-SHR-CD                                          
                  ,:DCLVFNDRGST.BK-PHSC-SHR-STS-CD                              
                  ,:FR-FRCTN-CD                                                 
                  ,:DCLVFNDRGST.FRCTN-STTS-CD                                   
                  ,:FR-DLRVY-CD                                                 
                  ,:DCLVFNDRGST.TPA-NBR                                         
                  ,:DCLVFNDRGST.TPA-NBR-STTS-CD                                 
                  ,:FR-CUST-NM                                                  
                  ,:DCLVFNDRGST.CUST-NM-STTS-CD                                 
                  ,:FR-FUND-ACCT-CD                                             
                  ,:DCLVFNDRGST.FUND-ACCT-STTS-CD                               
                  ,:FR-BRKR-EXCTG-NBR                                           
                  ,:DCLVFNDRGST.BRKR-EXCTG-STTS-CD                              
                  ,:FR-DSBMT-RSDL-CD                                            
                  ,:DCLVFNDRGST.DSBMT-RSDL-STS-CD                               
                  ,:FR-NTWRK-CNTL-CD                                            
                  ,:DCLVFNDRGST.NTWRK-CNTL-STTS-CD                              
                  ,:FR-DVDND-CD                                                 
                  ,:DCLVFNDRGST.DVDND-STTS-CD                                   
                  ,:FR-FNBR                                                     
                  ,:DCLVFNDRGST.FND-ACT-NBR-STS-CD                              
                  ,:FR-LTCG-CD                                                  
                  ,:FR-SS-TIN-CD                                                
                  ,:FR-STCG-CD                                                  
                  ,:FR-WTHLD-CD                                                 
                  ,:DCLVFNDRGST.WTHLD-STTS-CD                                   
                  ,:FR-PYBL-INFO-CD                                             
                  ,:DCLVFNDRGST.PYBL-INFO-STTS-CD                               
                  ,:FR-ZIP5-CD                                                  
                  ,:DCLVFNDRGST.ZIP5-STTS-CD                                    
                  ,:FR-ZIP4-CD                                                  
                  ,:DCLVFNDRGST.ZIP4-STTS-CD                                    
                  ,:FR-SOC-CD                                                   
                  ,:DCLVFNDRGST.SOC-STTS-CD                                     
                  ,:FR-NAV-ACCT-IND                                             
                  ,:DCLVFNDRGST.NAV-ACCT-STTS-CD                                
                  ,:FR-MRGN-ACCT-IND                                            
                  ,:DCLVFNDRGST.MRGN-ACCT-STTS-CD                               
                  ,:FR-CHCK-WRTNG-IND                                           
                  ,:DCLVFNDRGST.CHCK-WRTNG-STTS-CD                              
                  ,:FR-SL-ST-CD                                                 
                  ,:DCLVFNDRGST.SL-ST-STTS-CD                                   
                  ,:FR-CNTRY-ORGN-CD                                            
                  ,:DCLVFNDRGST.CNTRY-ORGN-STTS-CD                              
                  ,:FR-ACCT-RR-NM                                               
                  ,:DCLVFNDRGST.ACCT-RR-NM-STTS-CD                              
                  ,:FR-ACCT-RR-CD                                               
                  ,:DCLVFNDRGST.ACCT-RR-STTS-CD                                 
                  ,:FR-BRCH-NBR                                                 
                  ,:DCLVFNDRGST.BRCH-NBR-STTS-CD                                
                  ,:DCLVFNDRGST.PYBL-QTY                                        
                  ,:DCLVFNDRGST.PYBL-QTY-STTS-CD                                
                  ,:DCLVFNDRGST.MEMO-TXT                                        
                  ,:DCLVFNDRGST.MEMO-STTS-CD                                    
                  ,:FR-ACH-IND                                                  
                  ,:DCLVFNDRGST.ACH-STTS-CD                                     
                  ,:FR-PAC-IND                                                  
                  ,:DCLVFNDRGST.PAC-STTS-CD                                     
                  ,:FR-SWP-IND                                                  
                  ,:DCLVFNDRGST.SWP-STTS-CD                                     
                  ,:DCLVFNDRGST.ROA-LOI-AMT                                     
                  ,:DCLVFNDRGST.ROA-LOI-STTS-CD                                 
                  ,:FR-LOI-DT                                                   
                  ,:DCLVFNDRGST.LOI-STTS-CD                                     
                  ,:FR-TRD-RLTD-IND                                             
                  ,:DCLVFNDRGST.TRD-RLTD-STTS-CD                                
                  ,:FR-ACCT-RLTD-NBR                                            
                  ,:DCLVFNDRGST.ACCT-RLTD-STTS-CD                               
                  ,:FR-ACCT-RLTD-CD                                             
                  ,:DCLVFNDRGST.ACCT-RLT-IN-STS-CD                              
                  ,:FR-SWP-PAC-EFFCT-DT                                         
                  ,:DCLVFNDRGST.SWP-PAC-DT-STTS-CD                              
                  ,:DCLVFNDRGST.CDSC-PYMNT-CD                                   
                  ,:DCLVFNDRGST.CDSC-PYMNT-STTS-CD                              
                  ,:FR-DSBMT-OPTN-CD                                            
                  ,:DCLVFNDRGST.DSBMT-OPTN-STTS-CD                              
                  ,:FR-DSBMT-AMT                                                
                  ,:DCLVFNDRGST.DSBMT-AMT-STTS-CD                               
                  ,:DCLVFNDRGST.PYMNT-JAN-IND                                   
                  ,:DCLVFNDRGST.PYMNT-FEB-IND                                   
                  ,:DCLVFNDRGST.PYMNT-MAR-IND                                   
                  ,:DCLVFNDRGST.PYMNT-APR-IND                                   
                  ,:DCLVFNDRGST.PYMNT-MAY-IND                                   
                  ,:DCLVFNDRGST.PYMNT-JUN-IND                                   
                  ,:DCLVFNDRGST.PYMNT-JUL-IND                                   
                  ,:DCLVFNDRGST.PYMNT-AUG-IND                                   
                  ,:DCLVFNDRGST.PYMNT-SEP-IND                                   
                  ,:DCLVFNDRGST.PYMNT-OCT-IND                                   
                  ,:DCLVFNDRGST.PYMNT-NOV-IND                                   
                  ,:DCLVFNDRGST.PYMNT-DEC-IND                                   
                  ,:DCLVFNDRGST.PYMNT-MO-STTS-CD                                
                  ,:DCLVFNDRGST.PYMNT-DT-CD                                     
                  ,:DCLVFNDRGST.PYMNT-DT-STTS-CD                                
                  ,:DCLVFNDRGST.RTRMT-TAX-CD                                    
                  ,:DCLVFNDRGST.RTRMT-TAX-STTS-CD                               
                  ,:DCLVFNDRGST.SHRHR-BNK-ACCT-NBR                              
                  ,:DCLVFNDRGST.SHR-BNK-ACT-STS-CD                              
                  ,:DCLVFNDRGST.SHRHR-BNK-TYPE-CD                               
                  ,:DCLVFNDRGST.SHR-BNK-TYP-STS-CD                              
                  ,:FR-CHCK-FRST-DT                                             
                  ,:DCLVFNDRGST.CHCK-FRS-DT-STS-CD                              
                  ,:DCLVFNDRGST.ABA-ROUTING-NBR                                 
                  ,:DCLVFNDRGST.ABA-ROTNG-STTS-CD                               
                  ,:DCLVFNDRGST.COST-BSS-CD                                     
                  ,:DCLVFNDRGST.COST-BS-OPT-STS-CD                              
                  ,:DCLVFNDRGST.RCRD-LNGTH-STTS-CD                              
                  ,:FR-SS-TIN-NBR                                               
                  ,:DCLVFNDRGST.LGCL-SEQ-NR-STS-CD                              
                  ,:DCLVFNDRGST.TRANS-TYPE-STTS-CD                              
                  ,:FR-TRNFR-TYPE-CD                                            
                  ,:DCLVFNDRGST.TRNFR-TYPE-STTS-CD                              
                  ,:DCLVFNDRGST.RCV-NBR-STTS-CD                                 
                  ,:DCLVFNDRGST.DLVR-NBR-STS-CD                                 
                  ,:FR-ISIN-CNTRY-CD                                            
                  ,:DCLVFNDRGST.ISIN-CNTRY-STTS-CD                              
                  ,:FR-ISIN-SEC-ISSUE-CD                                        
                  ,:DCLVFNDRGST.ISIN-SEC-IS-STS-CD                              
                  ,:FR-ISIN-SEC-CDG-CD                                          
                  ,:DCLVFNDRGST.ISIN-SEC-CD-STS-CD                              
                  ,:FR-PI-DLRVY-CD                                              
                  ,:DCLVFNDRGST.PI-DLVRY-STTS-CD                                
                  ,:DCLVFNDRGST.AST-PRC-CTG-STS-CD                              
                  ,:DCLVFNDRGST.SS-TIN-STTS-CD                                  
                  ,:DCLVFNDRGST.SS-TIN-NBR-STTS-CD                              
                  ,:DCLVFNDRGST.CUST-NM-LN-STTS-CD                              
                  ,:FR-NM-END-LN-QTY                                            
                  ,:DCLVFNDRGST.NM-END-LN-STTS-CD                               
                  ,:DCLVFNDRGST.PHSCL-SEQ-STTS-CD                               
                  ,'R'                                                          
                  ,:FR-PRCS-DT                                                  
                  ,:DCLVFNDRGST.ACTION-TYPE-CD                                  
                  ,:DCLVFNDRGST.FND-SERV-CNTL-NBR                               
                  ,:DCLVFNDRGST.CUST-FUND-NM                                    
                  ,:DCLVFNDRGST.CERT-NBR                                        
                  ,:FR-ASSET-QTY                                                
                  ,:DCLVFNDRGST.ASSET-ORGNL-QTY                                 
                  ,:FR-ISO-CRNCY-CD                                             
                  ,:FR-ASSET-AMT                                                
                  ,:DCLVFNDRGST.DB-CR-CD                                        
                  ,:FR-ASSET-DESC-TXT                                           
                  ,:FR-CERT-DT                                                  
                  ,:FR-STTLM-ASCTD-DT                                           
                  ,:FR-STTLM-DT                                                 
                  ,:DCLVFNDRGST.RJCT-CD                                         
                  ,:FR-NSCC-NON-ADP-IND                                         
                  ,:DCLVFNDRGST.NSCC-PEND-CD                                    
                  ,:DCLVFNDRGST.NSCC-ACK-IND                                    
                  ,:DCLVFNDRGST.CICS-TERM-ID-CD                                 
                  ,'CAT575C '                                                   
                  ,:WS-DATE-TIME                                                
                  ,:WS-DATE-TIME                                                
                  ,:FR-SECURITY-ADP-NBR                                         
                  ,:FR-DLVR-NBR                                                 
                  ,:DCLVFNDRGST.ROA-LOI-CD                                      
                  ,:FR-FUND-BK-CD                                               
                  ,:FR-W8-WTHLD-CD                                              
                  ,:FR-W8-CERT-DT                                               
                  ,:FR-W8-EXPTN-DT                                              
                  ,:FR-W8-OVRD-NRA-SPC-RT                                       
                  ,:FR-W8-QULFD-INTRM-IND                                       
                  ,:FR-W8-OVRD-CNTRY-CD                                         
                  ,:DCLVFNDRGST.W8-WTHLD-STTS-CD                                
                  ,:DCLVFNDRGST.W8-CERT-DT-STTS-CD                              
                  ,:DCLVFNDRGST.W8-EXPTN-DT-STS-CD                              
                  ,:DCLVFNDRGST.W8-SPCL-RT-STTS-CD                              
                  ,:DCLVFNDRGST.W8-QLFD-INT-STS-CD                              
                  ,:DCLVFNDRGST.W8-ORD-CTRY-STS-CD                              
LRM006            ,:DCLVFNDRGST.FND-AGNT-CD)                                    
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                 ADD 1                      TO  INSERTED-FR                     
                 MOVE 0                     TO  WS-NA-LINE-NBR                  
                 PERFORM VARYING S1 FROM 1 BY 1 UNTIL S1 > 6                    
                    IF FR-NA-LINE (S1) > SPACES                                 
                       PERFORM INSERT-VFNDNA                                    
                    END-IF                                                      
                 END-PERFORM                                                    
              WHEN -803                                                         
                 CONTINUE                                                       
              WHEN OTHER                                                        
                 PERFORM DB2-ERROR-ROUTINE                                      
                 DISPLAY '*************************************'                
                 DISPLAY '* BAD INSERT INTO VFNDRGST TABLE    *'                
                 DISPLAY '* ACAT-CONTROL-NBR = ' FR-ACAT-CONTROL-NBR            
                         ' *'                                                   
                 DISPLAY '*************************************'                
                 PERFORM ABEND-ROUTINE                                          
           END-EVALUATE.                                                        
                                                                                
LRM003 UPDATE-VFNDRGST.                                                         
LRM003     EXEC SQL                                                             
LRM003        UPDATE VFNDRGST                                                   
LRM003           SET NSCC_PEND_CD = ' '                                         
LRM003              ,PRGM_NM = 'CAT575C '                                       
LRM003              ,UPDT_TMSTP = :WS-DATE-TIME                                 
LRM003        WHERE                                                             
LRM003            CLIENT_NBR        = :FR-CLIENT-NBR                            
LRM003        AND ACAT_CONTROL_NBR  = :FR-ACAT-CONTROL-NBR                      
LRM003        AND ASSET_SEQ_NBR     = :FR-ASSET-SEQ-NBR                         
LRM003        AND NOT NSCC_PEND_CD = 'Y'                                        
LRM006        AND NOT NSCC_PEND_CD = 'A'                                        
LRM003     END-EXEC.                                                            
LRM003                                                                          
LRM003     EVALUATE SQLCODE                                                     
LRM003        WHEN +0                                                           
LRM003           DISPLAY 'UPDATED F/R TO SUBMIT ' FR-CLIENT-NBR                 
LRM003              ' ' FR-ACAT-CONTROL-NBR ' ' FR-ASSET-SEQ-NBR                
LRM003              ' ' FR-TRNFR-TYPE-CD                                        
LRM003           ADD 1                      TO  UPDATED-FR                      
LRM003        WHEN -803                                                         
LRM003           CONTINUE                                                       
LRM003        WHEN +100                                                         
LRM003           DISPLAY 'INTRA DAY F/R MISSING ' FR-CLIENT-NBR                 
LRM003              ' ' FR-ACAT-CONTROL-NBR ' ' FR-ASSET-SEQ-NBR                
LRM003              ' ' FR-TRNFR-TYPE-CD                                        
LRM003           PERFORM DELETE-VFNDRGST                                        
LRM003           PERFORM INSERT-FNDRGST                                         
LRM003        WHEN OTHER                                                        
LRM003           PERFORM DB2-ERROR-ROUTINE                                      
LRM003           DISPLAY '*************************************'                
LRM003           DISPLAY '* BAD UPDATE OF VFNDRGST TABLE      *'                
LRM003           DISPLAY '* ACAT-CONTROL-NBR = ' FR-ACAT-CONTROL-NBR            
LRM003                   '*'                                                    
LRM003           DISPLAY '*************************************'                
LRM003           PERFORM ABEND-ROUTINE                                          
LRM003     END-EVALUATE.                                                        
LRM003     EJECT                                                                
      ***************                                                           
       INSERT-VFNDNA.                                                           
      ***************                                                           
                                                                                
           INITIALIZE DCLVFNDNA.                                                
           ADD 1                            TO  WS-NA-LINE-NBR.                 
           MOVE FR-NA-LINE (S1)             TO  WS-CUST-NA-LINE-TXT.            
                                                                                
           EXEC SQL                                                             
              INSERT INTO VFNDNA                                                
                 ( CLIENT_NBR                                                   
                  ,ACAT_CONTROL_NBR                                             
                  ,ASSET_SEQ_NBR                                                
                  ,NA_LINE_NBR                                                  
                  ,CUST_NA_LINE_TXT                                             
                  ,CUST_NA_STTS_CD                                              
                  ,CRT_TMSTP                                                    
                  ,UPDT_TMSTP                                                   
                  ,CICS_TERM_ID_CD                                              
                  ,PRGM_NM)                                                     
              VALUES                                                            
                 ( :FR-CLIENT-NBR                                               
                  ,:FR-ACAT-CONTROL-NBR                                         
                  ,:FR-ASSET-SEQ-NBR                                            
                  ,:WS-NA-LINE-NBR                                              
                  ,:WS-CUST-NA-LINE-TXT                                         
                  ,:DCLVFNDNA.CUST-NA-STTS-CD                                   
                  , CURRENT TIMESTAMP                                           
                  , CURRENT TIMESTAMP                                           
                  ,:DCLVFNDNA.CICS-TERM-ID-CD                                   
                  ,'CAT575C ')                                                  
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              PERFORM DB2-ERROR-ROUTINE                                         
              DISPLAY '********************************'                        
              DISPLAY '* BAD INSERT INTO VFNDNA TABLE *'                        
              DISPLAY '********************************'                        
              PERFORM ABEND-ROUTINE                                             
           ELSE                                                                 
              ADD 1                         TO  INSERTED-NA                     
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *****************                                                         
       DELETE-VFNDRGST.                                                         
      *****************                                                         
                                                                                
           EXEC SQL                                                             
              DELETE FROM VFNDRGST                                              
              WHERE  CLIENT_NBR       = :FR-CLIENT-NBR        AND               
                     ACAT_CONTROL_NBR = :FR-ACAT-CONTROL-NBR  AND               
                     ASSET_SEQ_NBR    = :FR-ASSET-SEQ-NBR                       
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = +0 OR +100                                              
              CONTINUE                                                          
           ELSE                                                                 
              PERFORM DB2-ERROR-ROUTINE                                         
              DISPLAY '****************************'                            
              DISPLAY '* BAD DELETE FORM VFDNRGST *'                            
              DISPLAY '****************************'                            
              PERFORM ABEND-ROUTINE                                             
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *****************                                                         
       INITIAL-ROUTINE.                                                         
      *****************                                                         
                                                                                
LRM003     IF PARM-LENGTH  > ZERO                                               
LRM003        DISPLAY 'CAT575C PARM ' LS-PARM-RUN-INDICATOR                     
LRM003     END-IF.                                                              
                                                                                
           OPEN INPUT  FR-FILE.                                                 
                                                                                
           EXEC SQL                                                             
              SET :WS-DATE-TIME = CURRENT TIMESTAMP                             
           END-EXEC.                                                            
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY '*************************************************'.         
           DISPLAY '* CURRENT TIMESTAMP: ' WS-DATE-TIME ' *'.                   
           DISPLAY '*************************************************'.         
                                                                                
           MOVE 'N'                         TO  EOF-FR-FILE-SW.                 
                                                                                
           READ FR-FILE                   INTO  FR-HEADER                       
              AT END SET EOF-FR-FILE        TO  TRUE                            
           END-READ.                                                            
                                                                                
           IF EOF-FR-FILE                                                       
              DISPLAY '***'                                                     
              DISPLAY 'FR-FILE HAS NO RECORDS - AT LEAST A HEADER RECORD        
      -               ' SHOULD BE PRESENT'                                      
              DISPLAY 'CHECK CAT575B RUN!!!'                                    
              PERFORM ABEND-ROUTINE                                             
           ELSE                                                                 
              IF FR-DATE-LIT NOT = 'DATE='                                      
                 DISPLAY '****************************************'             
                 DISPLAY '* FR-FILE IS MISSING THE HEADER RECORD *'             
                 DISPLAY '****************************************'             
                 ADD 1                      TO  INPUT-CNTR                      
              END-IF                                                            
           END-IF.                                                              
                                                                                
           READ FR-FILE                   INTO  FR-RECORD                       
              AT END SET EOF-FR-FILE        TO  TRUE                            
           END-READ.                                                            
                                                                                
           IF EOF-FR-FILE                                                       
              DISPLAY '***********************************'                     
              DISPLAY '* NO FUND/SERV ACTIVITY FOR TODAY *'                     
              DISPLAY '***********************************'                     
           ELSE                                                                 
              ADD 1                         TO  INPUT-CNTR                      
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *******************                                                       
       DB2-ERROR-ROUTINE.                                                       
      *******************                                                       
                                                                                
           CALL DSNTIAR               USING  SQLCA                              
                                             WS-DB2-MESSAGE-AREA                
                                             WS-ERR-LINE-LEN.                   
                                                                                
           DISPLAY ' '                                                          
                                                                                
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                           
              UNTIL WS-ERROR-INDEX GREATER THAN 12                              
                 IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES                      
                    DISPLAY '*** ' WS-ERROR-MSG (WS-ERROR-INDEX)                
                 END-IF                                                         
           END-PERFORM.                                                         
                                                                                
           EJECT                                                                
      ***************                                                           
       ABEND-ROUTINE.                                                           
      ***************                                                           
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY '************************'.                                  
           DISPLAY '* PROGRAM IS ABENDING! *'.                                  
           DISPLAY '************************'.                                  
           CALL ABEND                    USING  ABEND-CODE.                     
                                                                                
           EJECT                                                                
      *************                                                             
       EOJ-ROUTINE.                                                             
      *************                                                             
                                                                                
           CLOSE FR-FILE.                                                       
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY '                    TOTALS FOR CAT575C'.                    
           DISPLAY '                    ------------------'.                    
           DISPLAY 'FR RECORDS READ FROM INPUT:  ' INPUT-CNTR.                  
           DISPLAY 'FR RECORDS INSERTED INTO DB: ' INSERTED-FR.                 
           DISPLAY 'FR RECORDS UPDATED TO SUBMIT ' UPDATED-FR.                  
           DISPLAY 'INSERTED NA RECORDS:         ' INSERTED-NA.                 
           DISPLAY ' '.                                                         
           DISPLAY '*************************************'.                     
           DISPLAY '* CAT575C: COMPLETION IS SUCCESSFUL *'.                     
           DISPLAY '*************************************'.                     
                                                                                
