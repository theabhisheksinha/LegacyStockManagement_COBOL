000001* PDX    - CATEXTR  C0367472 06/09/15 11:31:13 TBLAMUR            00001000
LRM016* SSR 103577 NEW COL SENT-BNWTRAN-IND VFNDRGST.                           
000001* PDX    - CATEXTR  C0361186 01/07/15 15:27:27 TBLAMUR            00001000
LRM015* SSR 103323 NEW COL PAPER STATEMENT FEE ON VTRNFR AND HSTY.              
000001* PDX    - CATEXTR  C0353648 04/07/14 07:38:33 TBLAMUR            00001000
LRM014* SSR 100417 FUND AGENT CODE ON FR.                                       
000001* PDX    - CATEXTR  C0339180 04/09/13 08:10:07 TBLAMUR            00001000
LRM013* SSR 90340 SAVE ORIG DELIVERY QTY                                        
000001* PDX    - CATEXTR  C0329036 09/07/12 08:36:24 TBLAMUR            00001000
LRM012* SSR 84763 80728 NEW COL FOR DELIVERING NON U$ POSITIONS.                
000001* PDX    - CATEXTR  C0317345 10/26/11 09:48:38 TBLAMUR            00001000
LRM011* SSR 79096 80728 NEW COLS FOR PENDING DIVIDEND AND NTWLVL4 FUND.         
000001* PDX    - CATEXTR  C0296621 06/21/10 14:46:27 TBLAMUR            00001000
LRM010* SSR 71810 NEW COLS FOR FOREIGN FEES                             00001000
000001* PDX    - CATEXTR  C0296134 05/07/10 12:24:26 TBLAMUR            00001000
LRM009* SSR 65158 NEW COLS FOR MFRS OFFSHORE CHANGE                     00001000
000001* PDX    - CATEXTR  C0287774 11/03/09 09:46:20 TBLAMUR            00001000
LRM008* SSR 65670 NEW COLS FOR SUB-PENNY PRICE AND EXPANDED OPT STRIKE. 00001000
000001* PDX    - CATEXTR  C0276888 04/06/09 10:48:17 TBDOJUN            00001000
DJ0002* SSR 61684 NEW COL FOR AUCTION RATE SECURITY                     00001000
000001* PDX    - CATEXTR  C0266770 06/25/08 10:56:24 TBLAMUR            00001000
DJ0001* SSR 0055171 NEW TABLE ACTRBSC (PARENT=VACTRBHY)                 00001000
000001* PDX    - CATEXTR  C0259499 01/15/08 09:32:54 TBLAMUR            00001000
LRM007* SSR 0047237 NEW COLS VRSTSEC,VRSTBRKR                                   
000001* PDX    - CATEXTR  C0253977 09/07/07 12:00:30 TBLAMUR            00001000
LRM006* SSR 0054091 NEW COL FOR CONVERSION ACCOUNT                              
000001* PDX    - CATEXTR  C0246152 03/13/07 16:15:20 TBLAMUR            00001000
LRM005* SSR 0047213 NEW COLS VRSDACC,VRSDSEC                                    
000001* PDX    - CATEXTR  C0240752 10/23/06 15:18:51 TBLAMUR            00001000
LRM004* SSR 0049202 NEW COLS GIFT IND, ALT BRANCH, ONLINE FLAGS                 
000001* PDX    - CATEXTR  C0233532 04/10/06 09:20:59 TBLAMUR            00001000
LRM003* SSR 0040661 NEW COLS FOR ONLINE USER REPORT AND FREEZE IND              
000001* PDX    - CATEXTR  C0226392 10/10/05 07:47:08 TBLAMUR            00001000
000001* PDX    - CATEXTR  C0222440 07/12/05 11:16:49 TBLAMUR            00001000
LRM002* SSR 0029849 RETAIN 866 SECURITY NBR AND AMOUNT                          
000001* PDX    - CATEXTR  C0218155 03/14/05 08:18:20 TBLAMUR            00001000
LRM001*        - REMOVE OLD VINIT TABLES                                00001000
000001* PDX    - CATEXTR  C0213444 01/13/05 08:38:53 TBLAMUR            00001000
LRM001*        - ADD NEW TABLES ACTITRF,ACTIAST,ACTIMF,ACTIOPN          00001000
000001* PDX    - CATEXTR  C0214771 12/15/04 09:01:06 TBLAMUR            00001000
000001* PDX    - CATEXTR  C0210469 11/18/04 16:24:51 TBLAMUR            00001000
000001* PDX    - CATEXTR  C0179727 10/01/02 11:45:29 TBLAMUR            00001000
000001* PDX    - CATEXTR  C0160782 07/24/01 14:14:15 TBLAMUR            00001000
000001* PDX    - CATEXTR  C0150927 12/20/00 10:07:57 TBLAMUR            00001000
000001* PDX    - CATEXTR  C0136590 01/14/00 10:31:06 TBLAMUR            00001000
000001* PDX    - CATEXTR  C0125684 05/12/99 07:59:37 TBLAMUR            00001000
000001* PDX    - CATEXTR  C0124318 04/09/99 13:52:11 TBLAMUR            00001000
000001* PDX    - CATEXTR  C0121814 02/17/99 07:43:17 TBLAMUR            00001000
000001* PDX    - CATEXTR  C0121210 02/04/99 10:21:30 TBLAMUR            00001000
000001* PDX    - CATEXTR  C0120573 01/20/99 11:16:22 TBLAMUR            00001000
000001* PDX    - CATEXTR  C0119411 12/30/98 11:49:15 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CATEXTR.                                                    
       AUTHOR.      LARRY MUREY.                                                
       DATE-WRITTEN.  NOV 1998.                                                 
      **REMARKS.                                                                
      *****************************************************************         
      *                                                                         
      *PROGRAM DESCRIPTION:                                                     
      *     EXTRACT ALL OR SELECTED ROWS FROM ACATS DB2 TABLES.                 
      *     PROCESSING IS SEPERATED BY INITIAL / ACTIVE TABLES.                 
      *     ALL ASSETS ROWS (BY DEFAULT) WILL BE EXTRACTED FOR THEIR            
      *     RESPECTIVE TRANSFERS (TIFS).                                        
      *---------------------------------------------------------------*         
      *    CHANGE HISTORY:                                            *         
      *                                                               *         
      *      DATE    PGMR    SSR            CHANGE                    *         
      *      ----    ----    ---            ------                    *         
      *    11/18/98   LRM  XXXXXX   PROGRAM CREATED.                  *         
      *                                                               *         
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
           VALUE 'CATEXTR WORKING STORAGE STARTS HERE'.                         
                                                                                
       01  W-SINGLE-CLIENT-IND       PIC X(01) VALUE SPACES.            CAT515  
           88 SINGLE-CLIENT          VALUE 'S'.                                 
                                                                                
       01  WS-PARM-AREA.                                                        
           05  WS-LENGTH         PIC S9(4)    COMP.                             
           05  WS-CLIENT-NBR                  PIC X(04) VALUE '%%%%'.           
           05  FILLER                 PIC X.                                    
           05  WS-ACTITRF        PIC X(01).                                     
               88  WS-ACTITRF-ALL          VALUE 'A'.                           
               88  WS-ACTITRF-SELECT       VALUE 'Y'.                           
           05  FILLER                 PIC X.                                    
           05  WS-ACTITRF-KEY.                                                  
               07  WS-ACTITRF-FR-RCV-NBR           PIC X(04).                   
               07  FILLER                          PIC X.                       
               07  WS-ACTITRF-FR-ACCT-RCV-NBR      PIC X(20).                   
               07  FILLER                          PIC X.                       
               07  WS-ACTITRF-TO-RCV-NBR           PIC X(04).                   
               07  FILLER                          PIC X.                       
               07  WS-ACTITRF-TO-ACCT-RCV-NBR      PIC X(20).                   
           05  FILLER                 PIC X.                                    
           05  WS-VTRNFR              PIC X(01).                                
               88  WS-VTRNFR-ALL                VALUE 'A'.                      
               88  WS-VTRNF-SELECT              VALUE 'Y'.                      
           05  FILLER                 PIC X.                                    
           05  WS-VTRNFR-KEY.                                                   
               07  WS-VTRNFR-FR-CNTL-NBR       PIC X(14).                       
               07  FILLER                      PIC X.                           
               07  WS-VTRNFR-TO-CNTL-NBR       PIC X(14).                       
           05  FILLER                 PIC X.                                    
           05  WS-VTRNHSTY            PIC X(01).                                
               88  WS-VTRNHSTY-ALL              VALUE 'A'.                      
               88  WS-VTRNHSTY-SELECT           VALUE 'Y'.                      
                                                                                
       01  ABEND                         PIC X(008) VALUE 'ILBOABN0'.           
******** SINCE THE PARM CAN'T EXCEED 100 BYTES, USE THE VTRNFR CNTL             
******** PARMS ABOVE FOR THE HISTORY DATABASE.                                  
       01  WS-VTRNHSTY-WORKAREA.                                                
           05  WS-VTRNHSTY-KEY.                                                 
               07  WS-VTRNHSTY-FR-CNTL-NBR     PIC X(14).                       
               07  FILLER                      PIC X.                           
               07  WS-VTRNHSTY-TO-CNTL-NBR     PIC X(14).                       
                                                                                
       01 WORKAREA.                                                             
           05  WS-ACTITRF-COUNT       PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-ACTIAST-COUNT       PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-ACTIMF-COUNT        PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-ACTIOPN-COUNT       PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VTRNFR-COUNT        PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VASSET-COUNT        PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VMF-COUNT           PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VFNDRGST-COUNT      PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VFNDSRVS-COUNT      PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VFNDPYBL-COUNT      PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VFNDPYNA-COUNT      PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VFNDNA-COUNT        PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VOPTN-COUNT         PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VTRNHSTY-COUNT      PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VASTHSTY-COUNT      PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VMFHSTY-COUNT       PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VOPTHSTY-COUNT      PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VRSTBRKR-COUNT      PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VRSTSEC-COUNT       PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VRSDSEC-COUNT       PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VRSDACC-COUNT       PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VPRTCPPF-COUNT      PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VALERT-COUNT        PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VRSDBLK-COUNT       PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VACTRBHY-COUNT      PIC S9(9) COMP-3 VALUE ZEROS.             
DJ0001     05  WS-ACTRBSC-COUNT       PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-ASSET-SUFFIX.                                                 
               10  FILLER             PIC X(4) VALUE 'QTY'.                     
               10  WS-ASSET-QTY       PIC S9(12)V9(5) COMP-3.                   
               10  FILLER             PIC X(4) VALUE 'AMT'.                     
               10  WS-ASSET-AMT       PIC S9(15)V9(2) COMP-3.                   
               10  FILLER             PIC X(4) VALUE 'PCT'.                     
               10  WS-ASSET-PCT       PIC S9(12)V9(5) COMP-3.                   
           05  WS-TIMESTAMP           PIC X(26).                                
           EJECT                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT_INIT_TRANSFER TABLE                                      
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE ACTITRF                                                  
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT_INIT_ASSET TABLE                                         
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE ACTIAST                                                  
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT_INIT_MF TABLE                                            
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE ACTIMF                                                   
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT_INIT_OPTN TABLE                                          
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE ACTIOPN                                                  
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT ACTIVE TRANSFER TABLE                                    
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VTRNFR                                                   
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT ACTIVE ASSET TABLE                                       
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VASSET                                                   
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT ACTIVE MF TABLE                                          
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VMF                                                      
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT FUND REGISTRATION TABLE                                  
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VFNDRGST                                                 
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT FUND SERV TABLE                                          
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VFNDSRVS                                                 
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT FUND PAYABLE                                             
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VFNDPYBL                                                 
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT FUND PAYABLE NA                                          
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VFNDPYNA                                                 
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT FUND NA                                                  
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VFNDNA                                                   
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT ACTIVE OPTN TABLE                                        
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VOPTN                                                    
           END-EXEC.                                                            
                                                                                
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
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT RESTRICTED BRKR TABLE                                    
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VRSTBRKR                                                 
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT RESTRICTED SECR TABLE                                    
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VRSTSEC                                                  
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT RESTRICTED SECR TABLE                                    
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VRSDSEC                                                  
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT RESTRICTED ACCT TABLE                                    
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VRSDACC                                                  
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT PARTICIPANT PROFILE TABLE                                
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VPRTCPPF                                                 
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT ALERT MESSSAGE TABLE                                     
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VALERT                                                   
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT RESCIND BLOCK TABLE                                      
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VRSDBLK                                                  
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT RESCIND BLOCK HISTORY TABLE                              
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VACTRBHY                                                 
           END-EXEC.                                                            
                                                                                
DJ0001*--------------------------------------------------------------           
DJ0001*DCLGEN FOR ACAT ASSET DELIVERY RULE TABLE    PARENT = VACTRBHY           
DJ0001*--------------------------------------------------------------           
DJ0001     EXEC SQL                                                             
DJ0001         INCLUDE ACTRBSC                                                  
DJ0001     END-EXEC.                                                            
                                                                                
      *DECLARE CURSOR TO OBTAIN ACTIVE TI RECORDS                               
           EXEC SQL                                                             
              DECLARE VTRNFR_CRSR CURSOR FOR                                    
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
                   ,ALERT_IND                                                   
                   ,ACCT_RB_SEC_IND                                             
                   ,ACCT_CLT_RSCND_IND                                          
                   ,ACCT_LGL_BLK_IND                                            
                   ,FRV_MFC_CMPLT_IND                                           
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
LRM009             ,GEO_CD                                                      
LRM010             ,FOREIGN_FEE_IND                                             
LRM010             ,FOREIGN_FEE_AMT                                             
LRM011             ,PEND_DVDND_DB_AMT                                           
LRM011             ,NTWRK_LVL4_FND_IND                                          
LRM015             ,PAPER_FEE_AMT                                               
                 FROM VTRNFR                                                    
                 WHERE CLIENT_NBR LIKE :WS-CLIENT-NBR                           
                 AND ACAT_CONTROL_NBR >= :WS-VTRNFR-FR-CNTL-NBR                 
                 AND ACAT_CONTROL_NBR <= :WS-VTRNFR-TO-CNTL-NBR                 
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
                                                                                
      * DECLARE CURSOR TO OBTAIN ALL AT RECORDS FOR THIS CONTROL NBR            
           EXEC SQL                                                             
              DECLARE VASSET_CRSR CURSOR FOR                                    
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
                    ,RESTRICTED_IND                                             
                    ,CAGE_TAG_NBR                                               
LRM002              ,SCRTY_866_NBR                                              
LRM002              ,ASSET_866_QTY                                              
DJ0002              ,AUCTION_RT_IND                                             
LRM010              ,FOREIGN_FEE_IND                                            
LRM012              ,CRNCY_CD                                                   
LRM013              ,MEMO_ORG_RVRSL_QTY                                         
                 FROM VASSET                                                    
                 WHERE CLIENT_NBR   = :DCLVTRNFR.CLIENT-NBR                     
                  AND  ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CONTROL-NBR           
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
                                                                                
      * DECLARE CURSOR TO OBTAIN ALL MF RECORDS FOR THIS CONTROL NBR            
           EXEC SQL                                                             
              DECLARE VMF_CRSR CURSOR FOR                                       
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
                    ,FCST_ACCT_RCVR_NBR                                         
                    ,FCST_RCVR_STTS_CD                                          
                 FROM VMF                                                       
                 WHERE CLIENT_NBR   = :DCLVTRNFR.CLIENT-NBR                     
                  AND  ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CONTROL-NBR           
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
                                                                                
      * DECLARE CURSOR TO OBTAIN ALL FUND REGISTRATION RECORDS FOR              
      * FOR THE SELECTED CLIENT                                                 
           EXEC SQL                                                             
              DECLARE VFNDRGST_CRSR CURSOR FOR                                  
                 SELECT                                                         
                     CLIENT_NBR                                                 
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
LRM014              ,FND_AGNT_CD                                                
LRM016              ,SENT_BNWTRAN_IND                                           
                 FROM VFNDRGST                                                  
                 WHERE CLIENT_NBR LIKE :WS-CLIENT-NBR                           
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
                                                                                
      * DECLARE CURSOR TO OBTAIN ALL FUND SERV RECORDS FOR                      
      * FOR THE SELECTED CLIENT                                                 
           EXEC SQL                                                             
              DECLARE VFNDSRVS_CRSR CURSOR FOR                                  
                 SELECT                                                         
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,ASSET_SEQ_NBR                                              
                    ,ACCT_TYPE_CD                                               
                    ,ACTION_TYPE_CD                                             
                    ,PRCS_DT                                                    
                    ,DSTBN_SIDE_CD                                              
                    ,FNBR                                                       
                    ,NTWRK_CNTL_CD                                              
                    ,PI_DLRVY_CD                                                
                    ,FND_SERV_CNTL_NBR                                          
                    ,RCV_ACCT_TYPE_CD                                           
                    ,RCV_CUST_NM                                                
                    ,CERT_NBR                                                   
                    ,ASSET_QTY                                                  
                    ,ASSET_ORGNL_QTY                                            
                    ,ISO_CRNCY_CD                                               
                    ,ASSET_AMT                                                  
                    ,DB_CR_CD                                                   
                    ,ISIN_CNTRY_CD                                              
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,ISIN_SEC_CDG_CD                                            
                    ,ASSET_DESC_TXT                                             
                    ,CERT_DT                                                    
                    ,STTLM_ORGNL_DT                                             
                    ,STTLM_DT                                                   
                    ,RJCT_CD                                                    
                    ,DSBMT_ACCRL_CD                                             
                    ,DSBMT_FRCTN_CSH_CD                                         
                    ,DSBMT_RSDL_CD                                              
                    ,DVDND_CD                                                   
                    ,CUST_NM                                                    
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,SECURITY_ADP_NBR                                           
                 FROM VFNDSRVS                                                  
                 WHERE CLIENT_NBR LIKE :WS-CLIENT-NBR                           
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
                                                                                
      * DECLARE CURSOR TO OBTAIN ALL FUND PAYABLE RECORDS FOR                   
      * FOR THE SELECTED CLIENT                                                 
           EXEC SQL                                                             
              DECLARE VFNDPYBL_CRSR CURSOR FOR                                  
                 SELECT                                                         
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,ASSET_SEQ_NBR                                              
                    ,PYBL_NBR                                                   
                    ,ACCT_NBR                                                   
                    ,ACCT_NBR_STTS_CD                                           
                    ,ZIP5_CD                                                    
                    ,ZIP5_STTS_CD                                               
                    ,ZIP4_CD                                                    
                    ,ZIP4_STTS_CD                                               
                    ,ADDRS_DVDND_IND                                            
                    ,ADDRS_SYSWL_IND                                            
                    ,ADDRS_ATMDF_IND                                            
                    ,CRSS_FND_RNVST_IND                                         
                    ,ALTNT_PYBL_IND                                             
                    ,ADDRS_OPTN_STTS_CD                                         
                    ,ACCT_PYBL_CD                                               
                    ,ACCT_PYBL_STTS_CD                                          
                    ,ISIN_CNTRY_CD                                              
                    ,ISIN_CNTRY_STTS_CD                                         
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,ISIN_SEC_IS_STS_CD                                         
                    ,ISIN_SEC_CDG_CD                                            
                    ,ISIN_SEC_CD_STS_CD                                         
                    ,PYBL_ALTNT_CD                                              
                    ,PYBL_ALTNT_STTS_CD                                         
                    ,PYBL_ALTNT_RSN_TXT                                         
                    ,PYBL_ALT_RS_STS_CD                                         
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,SECURITY_ADP_NBR                                           
                    ,NA_END_LINE_IND                                            
                    ,NA_END_IND_STTS_CD                                         
                 FROM VFNDPYBL                                                  
                 WHERE CLIENT_NBR LIKE :WS-CLIENT-NBR                           
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
                                                                                
      * DECLARE CURSOR TO OBTAIN ALL FUND PAYABLE NA RECORDS FOR                
      * FOR THE SELECTED CLIENT                                                 
           EXEC SQL                                                             
              DECLARE VFNDPYNA_CRSR CURSOR FOR                                  
                 SELECT                                                         
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,ASSET_SEQ_NBR                                              
                    ,PYBL_NBR                                                   
                    ,NA_LINE_NBR                                                
                    ,PYBL_NA_LINE_TXT                                           
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,PYBL_NA_LN_STTS_CD                                         
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                 FROM VFNDPYNA                                                  
                 WHERE CLIENT_NBR LIKE :WS-CLIENT-NBR                           
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
                                                                                
      * DECLARE CURSOR TO OBTAIN ALL FUND NA RECORDS FOR                        
      * FOR THE SELECTED CLIENT                                                 
           EXEC SQL                                                             
              DECLARE VFNDNA_CRSR CURSOR FOR                                    
                 SELECT                                                         
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,ASSET_SEQ_NBR                                              
                    ,NA_LINE_NBR                                                
                    ,CUST_NA_LINE_TXT                                           
                    ,CUST_NA_STTS_CD                                            
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                 FROM VFNDNA                                                    
                 WHERE CLIENT_NBR LIKE :WS-CLIENT-NBR                           
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
                                                                                
      * DECLARE CURSOR TO OBTAIN ALL OPN RECORDS FOR THIS CONTROL NBR           
           EXEC SQL                                                             
              DECLARE VOPTN_CRSR CURSOR FOR                                     
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
                    ,STPRC_DEC_FRCN_IND                                         
LRM008              ,STPRC_INTEGER2_AMT                                         
                 FROM VOPTN                                                     
                 WHERE CLIENT_NBR   = :DCLVTRNFR.CLIENT-NBR                     
                  AND  ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CONTROL-NBR           
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
                                                                                
      *DECLARE CURSOR TO OBTAIN HISTORY TI RECORDS                              
           EXEC SQL                                                             
              DECLARE VTRNHSTY_CRSR CURSOR FOR                                  
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
LRM009             ,GEO_CD                                                      
LRM010             ,FOREIGN_FEE_IND                                             
LRM010             ,FOREIGN_FEE_AMT                                             
LRM011             ,PEND_DVDND_DB_AMT                                           
LRM011             ,NTWRK_LVL4_FND_IND                                          
LRM015             ,PAPER_FEE_AMT                                               
                 FROM VTRNHSTY                                                  
                 WHERE CLIENT_NBR LIKE :WS-CLIENT-NBR                           
                 AND ACAT_CONTROL_NBR >= :WS-VTRNHSTY-FR-CNTL-NBR               
                 AND ACAT_CONTROL_NBR <= :WS-VTRNHSTY-TO-CNTL-NBR               
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
LRM010              ,FOREIGN_FEE_IND                                            
LRM012              ,CRNCY_CD                                                   
LRM013              ,MEMO_ORG_RVRSL_QTY                                         
                 FROM VASTHSTY                                                  
                 WHERE CLIENT_NBR   = :DCLVTRNHSTY.CLIENT-NBR                   
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
                 WHERE CLIENT_NBR   = :DCLVTRNHSTY.CLIENT-NBR                   
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
                 WHERE CLIENT_NBR   = :DCLVTRNHSTY.CLIENT-NBR                   
                  AND  ACAT_CONTROL_NBR = :DCLVTRNHSTY.ACAT-CONTROL-NBR         
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
                                                                                
                                                                                
      * DECLARE CURSOR TO OBTAIN ALL INITIAL TI RECORDS                         
           EXEC SQL                                                             
              DECLARE ACTITRF_CRSR CURSOR FOR                                   
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
                    ,CICS_SGNON_ID                                              
LRM003              ,CICS_NET_NM                                                
LRM003              ,TPSCRT_USR_ID                                              
LRM003              ,TPSCRT_USR_NM                                              
LRM004              ,GIFT_IND                                                   
LRM011              ,PEND_DVDND_DB_AMT                                          
                 FROM ACTITRF                                                   
                 WHERE CLIENT_NBR  LIKE  :WS-CLIENT-NBR                         
                   AND RCV_NBR      >= :WS-ACTITRF-FR-RCV-NBR                   
                   AND ACCT_RCV_NBR >= :WS-ACTITRF-FR-ACCT-RCV-NBR              
                   AND RCV_NBR      <= :WS-ACTITRF-TO-RCV-NBR                   
                   AND ACCT_RCV_NBR <= :WS-ACTITRF-TO-ACCT-RCV-NBR              
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
                                                                                
      * DECLARE CURSOR TO OBTAIN ALL AT RECORDS FROM NEW TABLE                  
           EXEC SQL                                                             
              DECLARE ACTIAST_CRSR CURSOR FOR                                   
                 SELECT                                                         
                     CLIENT_NBR                                                 
                    ,DLVR_NBR                                                   
                    ,ACCT_DLVR_NBR                                              
                    ,RCV_NBR                                                    
                    ,ACCT_RCV_NBR                                               
                    ,TRNFR_TYPE_CD                                              
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
                    ,TRNFR_TYPE_STTS_CD                                         
                    ,RCV_NBR_STTS_CD                                            
                    ,DLVR_NBR_STTS_CD                                           
                    ,CAGE_TAG_NBR                                               
LRM002              ,SCRTY_866_NBR                                              
LRM002              ,ASSET_866_QTY                                              
                    ,CICS_SGNON_ID                                              
LRM003              ,CICS_NET_NM                                                
LRM003              ,TPSCRT_USR_ID                                              
LRM003              ,TPSCRT_USR_NM                                              
LRM010             ,FOREIGN_FEE_IND                                             
LRM012             ,CRNCY_CD                                                    
                 FROM ACTIAST                                                   
                 WHERE CLIENT_NBR  LIKE  :WS-CLIENT-NBR                         
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
      * DECLARE CURSOR TO OBTAIN ALL MF RECORDS FOR NEW INITIAL TABLE           
           EXEC SQL                                                             
              DECLARE ACTIMF_CRSR CURSOR FOR                                    
                 SELECT                                                         
                     CLIENT_NBR                                                 
                    ,DLVR_NBR                                                   
                    ,ACCT_DLVR_NBR                                              
                    ,RCV_NBR                                                    
                    ,ACCT_RCV_NBR                                               
                    ,TRNFR_TYPE_CD                                              
                    ,ISIN_CNTRY_CD                                              
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,ISIN_SEC_CDG_CD                                            
                    ,STTLM_LCTN_CD                                              
                    ,CSH_MGN_SHRT_CD                                            
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
                    ,SECURITY_ADP_NBR                                           
                    ,FCST_ACCT_RCVR_NBR                                         
LRM001              ,ACAT_CONTROL_NBR                                           
LRM001              ,ASSET_SEQ_NBR                                              
LRM014              ,FND_AGNT_CD                                                
                 FROM ACTIMF                                                    
                 WHERE CLIENT_NBR  LIKE  :WS-CLIENT-NBR                         
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
      * DECLARE CURSOR TO OBTAIN ALL OPN RECORDS FOR NEW INITIAL TBL            
           EXEC SQL                                                             
              DECLARE ACTIOPN_CRSR CURSOR FOR                                   
                 SELECT                                                         
                     CLIENT_NBR                                                 
                    ,DLVR_NBR                                                   
                    ,ACCT_DLVR_NBR                                              
                    ,RCV_NBR                                                    
                    ,ACCT_RCV_NBR                                               
                    ,TRNFR_TYPE_CD                                              
                    ,ISIN_CNTRY_CD                                              
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,ISIN_SEC_CDG_CD                                            
                    ,STTLM_LCTN_CD                                              
                    ,CSH_MGN_SHRT_CD                                            
                    ,BS_CD                                                      
                    ,BS_STTS_CD                                                 
                    ,PTCL_CD                                                    
                    ,PTCL_STTS_CD                                               
                    ,OPTN_OPN_CLSD_CD                                           
                    ,OPT_OPN_CLS_TST_CD                                         
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
                    ,OPTN_CMNT_CD                                               
                    ,OPTN_EXPTN_DT_CD                                           
                    ,OPT_OCC_DLV_STS_CD                                         
                    ,NSCC_ACK_IND                                               
                    ,NSCC_PEND_CD                                               
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,SECURITY_ADP_NBR                                           
LRM001              ,ACAT_CONTROL_NBR                                           
LRM001              ,ASSET_SEQ_NBR                                              
LRM008              ,STPRC_INTEGER2_AMT                                         
                 FROM ACTIOPN                                                   
                 WHERE CLIENT_NBR  LIKE  :WS-CLIENT-NBR                         
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
                                                                                
      * DECLARE CURSOR TO OBTAIN ALL RST BRKR RECORDS FOR THIS CLIENT           
           EXEC SQL                                                             
              DECLARE VRSTBRKR_CRSR CURSOR FOR                                  
                 SELECT                                                         
                     CLIENT_NBR                                                 
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,BRKR_CONTRA_NBR                                            
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,SECURITY_ADP_NBR                                           
LRM007              ,EXPTN_DT                                                   
LRM007              ,COMMENT_TXT                                                
LRM007              ,CICS_SGNON_ID                                              
LRM007              ,TPSCRT_USR_NM                                              
LRM007              ,TPSCRT_USR_ID                                              
LRM007              ,CICS_NET_NM                                                
                 FROM VRSTBRKR                                                  
                 WHERE CLIENT_NBR  LIKE  :WS-CLIENT-NBR                         
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
                                                                                
      * DECLARE CURSOR TO OBTAIN ALL RST SECR RECORDS FOR THIS CLIENT           
           EXEC SQL                                                             
              DECLARE VRSTSEC_CRSR CURSOR FOR                                   
                 SELECT                                                         
                     CLIENT_NBR                                                 
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,TRNFR_MEMO_IND                                             
                    ,TRNFR_BRKR_TYPE_CD                                         
                    ,RSTRD_MSG_TXT                                              
                    ,PRGM_NM                                                    
                    ,CICS_TERM_ID_CD                                            
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,SECURITY_ADP_NBR                                           
LRM007              ,EXPTN_DT                                                   
LRM007              ,COMMENT_TXT                                                
LRM007              ,CICS_SGNON_ID                                              
LRM007              ,TPSCRT_USR_NM                                              
LRM007              ,TPSCRT_USR_ID                                              
LRM007              ,CICS_NET_NM                                                
                 FROM VRSTSEC                                                   
                 WHERE CLIENT_NBR  LIKE  :WS-CLIENT-NBR                         
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
                                                                                
      * DECLARE CURSOR TO OBTAIN ALL RSD SECR RECORDS FOR THIS CLIENT           
           EXEC SQL                                                             
              DECLARE VRSDSEC_CRSR CURSOR FOR                                   
                 SELECT                                                         
                     CLIENT_NBR                                                 
                    ,ACCT_CD                                                    
                    ,BRANCH_CD                                                  
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,SECURITY_ADP_NBR                                           
                    ,PRGM_NM                                                    
                    ,CICS_TERM_ID_CD                                            
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
LRM005              ,EXPTN_DT                                                   
LRM005              ,COMMENT_TXT                                                
LRM005              ,CICS_SGNON_ID                                              
LRM005              ,TPSCRT_USR_NM                                              
LRM005              ,TPSCRT_USR_ID                                              
LRM005              ,CICS_NET_NM                                                
                 FROM VRSDSEC                                                   
                 WHERE CLIENT_NBR  LIKE  :WS-CLIENT-NBR                         
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
                                                                                
      * DECLARE CURSOR TO OBTAIN ALL RST ACCT RECORDS FOR THIS CLIENT           
           EXEC SQL                                                             
              DECLARE VRSDACC_CRSR CURSOR FOR                                   
                 SELECT                                                         
                     CLIENT_NBR                                                 
                    ,ACCT_CD                                                    
                    ,BRANCH_CD                                                  
                    ,BRANCH_ORGNL_CD                                            
                    ,ACCT_ORGNL_CD                                              
                    ,RR_CD                                                      
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
LRM005              ,EXPTN_DT                                                   
LRM005              ,COMMENT_TXT                                                
LRM005              ,CICS_SGNON_ID                                              
LRM005              ,TPSCRT_USR_NM                                              
LRM005              ,TPSCRT_USR_ID                                              
LRM005              ,CICS_NET_NM                                                
                 FROM VRSDACC                                                   
                 WHERE CLIENT_NBR  LIKE  :WS-CLIENT-NBR                         
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
                                                                                
      * DECLARE CURSOR TO OBTAIN ALL PARTICIPANT PROFILE ROWS                   
           EXEC SQL                                                             
              DECLARE VPRTCPPF_CRSR CURSOR FOR                                  
                 SELECT                                                         
                     PRTCP_NBR                                                  
                    ,BRKR_TIF_IND                                               
                    ,PRTCP_TYPE_CD                                              
                    ,PRTCP_NM                                                   
                    ,FUND_SRV_ELGBL_IND                                         
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                 FROM VPRTCPPF                                                  
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
                                                                                
      * DECLARE CURSOR TO OBTAIN ALL ALERT ROWS                                 
           EXEC SQL                                                             
              DECLARE VALERT_CRSR CURSOR FOR                                    
                 SELECT                                                         
                    CLIENT_NBR                                                  
                   ,BRANCH_CD                                                   
                   ,ACCT_CD                                                     
                   ,ACCT_MSG_TXT                                                
                   ,RR_CD                                                       
                   ,CRT_TMSTP                                                   
                   ,UPDT_TMSTP                                                  
                   ,CICS_TERM_ID_CD                                             
                   ,PRGM_NM                                                     
                 FROM VALERT                                                    
                 WHERE CLIENT_NBR LIKE :WS-CLIENT-NBR                           
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
                                                                                
      * DECLARE CURSOR TO OBTAIN ALL RESCIND BLOCK ROWS                         
           EXEC SQL                                                             
              DECLARE VRSDBLK_CRSR CURSOR FOR                                   
                 SELECT                                                         
                    CLIENT_NBR                                                  
                   ,BRANCH_CD                                                   
                   ,ACCT_CD                                                     
                   ,BLOCK_CD                                                    
                   ,CMNT_TXT                                                    
                   ,PRGM_NM                                                     
                   ,RCV_NBR                                                     
                   ,DLVR_NBR                                                    
                   ,CICS_TERM_ID_CD                                             
                   ,CRT_TMSTP                                                   
                   ,UPDT_TMSTP                                                  
                   ,ISIN_SEC_ISSUE_CD                                           
                   ,SECURITY_ADP_NBR                                            
                   ,EXPIRE_DT                                                   
                   ,ACTION_CD                                                   
                   ,CICS_SNON_ID                                                
                 FROM VRSDBLK                                                   
                 WHERE CLIENT_NBR LIKE :WS-CLIENT-NBR                           
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
                                                                                
      * DECLARE CURSOR TO OBTAIN ALL RESCIND BLOCK HISTORY ROWS                 
           EXEC SQL                                                             
              DECLARE VACTRBHY_CRSR CURSOR FOR                                  
                 SELECT                                                         
                    CLIENT_NBR                                                  
                   ,BRANCH_CD                                                   
                   ,ACCT_CD                                                     
                   ,BLOCK_CD                                                    
                   ,CMNT_TXT                                                    
                   ,PRGM_NM                                                     
                   ,RCV_NBR                                                     
                   ,DLVR_NBR                                                    
                   ,CICS_TERM_ID_CD                                             
                   ,CRT_TMSTP                                                   
                   ,UPDT_TMSTP                                                  
                   ,ISIN_SEC_ISSUE_CD                                           
                   ,HSTRY_SEQ_NBR                                               
                   ,SECURITY_ADP_NBR                                            
                   ,EXPIRE_DT                                                   
                   ,ACTION_CD                                                   
                   ,CICS_SNON_ID                                                
                 FROM VACTRBHY                                                  
                 WHERE CLIENT_NBR LIKE :WS-CLIENT-NBR                           
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
                                                                                
DJ0001* DECLARE CURSOR TO OBTAIN ASSET DELIVERY RULE                            
DJ0001     EXEC SQL                                                             
DJ0001        DECLARE ACTRBSC_CRSR CURSOR FOR                                   
DJ0001           SELECT                                                         
DJ0001               CLIENT_NBR                                                 
DJ0001              ,BRANCH_CD                                                  
DJ0001              ,ACCT_CD                                                    
DJ0001              ,BLOCK_CD                                                   
DJ0001              ,RCV_NBR                                                    
DJ0001              ,ISIN_SEC_ISSUE_CD                                          
DJ0001              ,HSTRY_SEQ_NBR                                              
DJ0001              ,SECURITY_ADP_NBR                                           
DJ0001              ,CRT_TMSTP                                                  
DJ0001              ,UPDT_TMSTP                                                 
DJ0001              ,CICS_TERM_ID_CD                                            
DJ0001              ,PRGM_NM                                                    
DJ0001              ,TPSCRT_USR_NM                                              
DJ0001              ,TPSCRT_USR_ID                                              
DJ0001              ,CICS_NET_NM                                                
DJ0001              ,CICS_SNON_ID                                               
DJ0001              ,ACTION_CD                                                  
DJ0001           FROM ACTRBSC                                                   
DJ0001           WHERE CLIENT_NBR LIKE :WS-CLIENT-NBR                           
DJ0001           FOR READ ONLY WITH UR                                          
DJ0001     END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      * INCLUDE FOR DB2 COMMUNICATIONS AREA.                                    
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE SQLCA                                                    
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
                                                                                
       01  WORK-AREA.                                                           
           05  PROGRAM-NAME            PIC X(08) VALUE 'CATEXTR '.              
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
                                                                                
           SKIP3                                                                
       LINKAGE SECTION.                                                         
           SKIP1                                                                
       01  PARM-AREA.                                                           
           05  PARM-LENGTH            PIC S9(4)    COMP.                        
           05  PARM-CLIENT            PIC X(04).                                
           05  FILLER                 PIC X.                                    
           05  PARM-ACTITRF           PIC X(01).                                
               88  PARM-ACTITRF-ALL             VALUE 'A'.                      
               88  PARM-ACTITRF-SELECT          VALUE 'Y'.                      
           05  FILLER                 PIC X.                                    
           05  PARM-ACTITRF-KEY.                                                
               07  PARM-ACTITRF-FR-RCV-NBR         PIC X(04).                   
               07  FILLER                          PIC X.                       
               07  PARM-ACTITRF-FR-ACCT-RCV-NBR    PIC X(20).                   
               07  FILLER                          PIC X.                       
               07  PARM-ACTITRF-TO-RCV-NBR         PIC X(04).                   
               07  FILLER                          PIC X.                       
               07  PARM-ACTITRF-TO-ACCT-RCV-NBR    PIC X(20).                   
           05  FILLER                 PIC X.                                    
           05  PARM-VTRNFR            PIC X(01).                                
               88  PARM-VTRNFR-ALL              VALUE 'A'.                      
               88  PARM-VTRNFR-SELECT           VALUE 'Y'.                      
           05  FILLER                 PIC X.                                    
           05  PARM-VTRNFR-KEY.                                                 
               07  PARM-VTRNFR-FR-CNTL-NBR     PIC X(14).                       
               07  FILLER                      PIC X.                           
               07  PARM-VTRNFR-TO-CNTL-NBR     PIC X(14).                       
           05  FILLER                 PIC X.                                    
           05  PARM-VTRNHSTY          PIC X(01).                                
               88  PARM-VTRNHSTY-ALL            VALUE 'A'.                      
               88  PARM-VTRNHSTY-SELECT         VALUE 'Y'.                      
                                                                                
           EJECT                                                                
       PROCEDURE DIVISION             USING  PARM-AREA.                         
                                                                                
           COPY MSGCOBO.                                                        
                                                                                
           IF PARM-LENGTH NOT GREATER ZEROS                                     
              DISPLAY 'CATEXTR: NO PARM RECIEVED - PROCESSING BYPASSED'         
              GOBACK                                                            
           END-IF.                                                              
           MOVE PARM-AREA TO WS-PARM-AREA.                                      
           DISPLAY 'PARM LENGTH ' PARM-LENGTH                                   
           DISPLAY 'PARM = ' WS-PARM-AREA.                                      
                                                                                
           IF PARM-CLIENT NUMERIC                                               
              DISPLAY 'USING SINGLE CLIENT PARM OVERRIDE ' PARM-CLIENT          
              SET SINGLE-CLIENT TO TRUE                                         
LRM011        MOVE PARM-CLIENT TO WS-CLIENT-NBR                                 
           ELSE                                                                 
              DISPLAY 'USING SELECTION FOR ALL CLIENTS'                         
               MOVE ALL '%' TO WS-CLIENT-NBR                                    
           END-IF.                                                              
                                                                                
           IF PARM-ACTITRF-ALL                                                  
           OR PARM-ACTITRF-SELECT                                               
           OR PARM-VTRNFR-ALL                                                   
           OR PARM-VTRNFR-SELECT                                                
           OR PARM-VTRNHSTY-ALL                                                 
           OR PARM-VTRNHSTY-SELECT                                              
              CONTINUE                                                          
           ELSE                                                                 
              DISPLAY 'CATEXTR: NO TABLES REQUESTED PROCESSING BYPASSED'        
              GOBACK                                                            
           END-IF.                                                              
                                                                                
           OPEN OUTPUT EXTRACT-FILE.                                            
           EXEC SQL                                                             
               SET :WS-TIMESTAMP = CURRENT TIMESTAMP                            
           END-EXEC.                                                            
           MOVE 'DATE    '  TO RECORD-SEG-ID                                    
           MOVE WS-TIMESTAMP TO RECORD-DETAIL                                   
           WRITE EXTRACT-RECORD.                                                
                                                                                
           IF PARM-ACTITRF-ALL                                                  
           OR PARM-ACTITRF-SELECT                                               
              DISPLAY 'STARTING 1110-EXTRACT-ACTITRF-RTN'                       
              PERFORM 1110-EXTRACT-ACTITRF-RTN                                  
              PERFORM 1210-FETCH-ACTIAST-RECORDS                                
              PERFORM 1310-FETCH-ACTIMF-RECORDS                                 
              PERFORM 1410-FETCH-ACTIOPN-RECORDS                                
           END-IF.                                                              
                                                                                
           IF PARM-VTRNFR-ALL                                                   
           OR PARM-VTRNFR-SELECT                                                
              DISPLAY 'STARTING 1500-EXTRACT-VTRNFR-RTN'                        
              PERFORM 1500-EXTRACT-VTRNFR-RTN                                   
              PERFORM 1900-FETCH-VFNDRGST-RECORDS                               
              PERFORM 1950-FETCH-VFNDSRVS-RECORDS                               
              PERFORM 1975-FETCH-VFNDPYBL-RECORDS                               
              PERFORM 1980-FETCH-VFNDPYNA-RECORDS                               
              PERFORM 1985-FETCH-VFNDNA-RECORDS                                 
           END-IF.                                                              
                                                                                
           IF PARM-VTRNHSTY-ALL                                                 
           OR PARM-VTRNHSTY-SELECT                                              
              PERFORM 2000-EXTRACT-VTRNHSTY-RTN.                                
                                                                                
           PERFORM 3000-FETCH-VRSTSEC-RECORDS.                                  
           PERFORM 3100-FETCH-VRSTBRKR-RECORDS.                                 
           PERFORM 3200-FETCH-VRSDACC-RECORDS.                                  
           PERFORM 3300-FETCH-VRSDSEC-RECORDS.                                  
           PERFORM 4000-FETCH-VPRTCPPF-RECORDS.                                 
           PERFORM 4500-FETCH-VALERT-RECORDS.                                   
           PERFORM 4600-FETCH-VRSDBLK-RECORDS.                                  
           PERFORM 4700-FETCH-VACTRBHY-RECORDS.                                 
DJ0001     PERFORM 4800-FETCH-ACTRBSC-RECORDS.                                  
                                                                                
           CLOSE EXTRACT-FILE.                                                  
                                                                                
           DISPLAY 'RECORDS WRITTEN:'.                                          
           DISPLAY 'ACTITRF  = ' WS-ACTITRF-COUNT                               
           DISPLAY 'ACTIAST  = ' WS-ACTIAST-COUNT                               
           DISPLAY 'ACTIMF   = ' WS-ACTIMF-COUNT                                
           DISPLAY 'ACTIOPN  = ' WS-ACTIOPN-COUNT                               
           DISPLAY 'VTRNFR   = ' WS-VTRNFR-COUNT                                
           DISPLAY 'VASSET   = ' WS-VASSET-COUNT                                
           DISPLAY 'VMF      = ' WS-VMF-COUNT                                   
           DISPLAY 'VFNDRGST = ' WS-VFNDRGST-COUNT                              
           DISPLAY 'VFNDSRVS = ' WS-VFNDSRVS-COUNT                              
           DISPLAY 'VFNDPYBL = ' WS-VFNDPYBL-COUNT                              
           DISPLAY 'VFNDPYNA = ' WS-VFNDPYNA-COUNT                              
           DISPLAY 'VFNDNA   = ' WS-VFNDNA-COUNT                                
           DISPLAY 'VOPTN    = ' WS-VOPTN-COUNT                                 
           DISPLAY 'VTRNHSTY = ' WS-VTRNHSTY-COUNT                              
           DISPLAY 'VASTHSTY = ' WS-VASTHSTY-COUNT                              
           DISPLAY 'VMFHSTY  = ' WS-VMFHSTY-COUNT                               
           DISPLAY 'VOPTHSTY = ' WS-VOPTHSTY-COUNT                              
           DISPLAY 'VRSTBRKR = ' WS-VRSTBRKR-COUNT                              
DJ0002     DISPLAY 'VRSTSEC  = ' WS-VRSTSEC-COUNT                               
           DISPLAY 'VRSDSEC  = ' WS-VRSDSEC-COUNT                               
           DISPLAY 'VRSDACC  = ' WS-VRSDACC-COUNT                               
           DISPLAY 'VPRTCPPF = ' WS-VPRTCPPF-COUNT                              
           DISPLAY 'VALERT   = ' WS-VALERT-COUNT                                
           DISPLAY 'VRSDBLK  = ' WS-VRSDBLK-COUNT                               
           DISPLAY 'VACTRBHY = ' WS-VACTRBHY-COUNT                              
DJ0001     DISPLAY 'ACTRBSC  = ' WS-ACTRBSC-COUNT                               
                                                                                
           GOBACK.                                                              
           EJECT                                                                
                                                                                
       1110-EXTRACT-ACTITRF-RTN.                                                
                                                                                
           IF WS-ACTITRF-ALL                                                    
              MOVE LOW-VALUES  TO WS-ACTITRF-FR-RCV-NBR                         
                                  WS-ACTITRF-FR-ACCT-RCV-NBR                    
              MOVE HIGH-VALUES TO WS-ACTITRF-TO-RCV-NBR                         
                                  WS-ACTITRF-TO-ACCT-RCV-NBR                    
           END-IF.                                                              
                                                                                
           EXEC SQL OPEN ACTITRF_CRSR END-EXEC                                  
           IF SQLCODE NOT = +0                                                  
              MOVE 1110 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF.                                                              
           PERFORM UNTIL SQLCODE NOT = +0                                       
              EXEC SQL                                                          
                 FETCH ACTITRF_CRSR                                             
                    INTO                                                        
                    :DCLACTITRF.CLIENT-NBR                                      
                   ,:DCLACTITRF.DLVR-NBR                                        
                   ,:DCLACTITRF.ACCT-DLVR-NBR                                   
                   ,:DCLACTITRF.RCV-NBR                                         
                   ,:DCLACTITRF.ACCT-RCV-NBR                                    
                   ,:DCLACTITRF.TRNFR-TYPE-CD                                   
                   ,:DCLACTITRF.RCV-NBR-STTS-CD                                 
                   ,:DCLACTITRF.DLVR-NBR-STTS-CD                                
                   ,:DCLACTITRF.ACCT-RCV-STTS-CD                                
                   ,:DCLACTITRF.ACCT-DLVR-STTS-CD                               
                   ,:DCLACTITRF.SBMTG-PRTCP-NBR                                 
                   ,:DCLACTITRF.SBMT-PRT-NR-STS-CD                              
                   ,:DCLACTITRF.ACAT-CONTROL-NBR                                
                   ,:DCLACTITRF.CONTROL-NBR-STS-CD                              
                   ,:DCLACTITRF.TRNFR-TYPE-STTS-CD                              
                   ,:DCLACTITRF.TRANS-TYPE-CD                                   
                   ,:DCLACTITRF.TRANS-TYPE-STTS-CD                              
                   ,:DCLACTITRF.RCV-CUST-NM                                     
                   ,:DCLACTITRF.RCV-CUST-NM-STS-CD                              
                   ,:DCLACTITRF.RCV-SS-PRIM-NBR                                 
                   ,:DCLACTITRF.RCV-SS-PRIM-STS-CD                              
                   ,:DCLACTITRF.RCV-SS-SCNDY-NBR                                
                   ,:DCLACTITRF.RCV-SS-SCDY-STS-CD                              
                   ,:DCLACTITRF.RCV-ACCT-TYPE-CD                                
                   ,:DCLACTITRF.RCV-ACT-TYP-STS-CD                              
                   ,:DCLACTITRF.RCV-OCC-BRKR-NBR                                
                   ,:DCLACTITRF.RCV-OCC-STTS-CD                                 
                   ,:DCLACTITRF.RCV-CRSPN-NBR                                   
                   ,:DCLACTITRF.RCV-CRSPN-STTS-CD                               
                   ,:DCLACTITRF.ACAT-CNTL-ASTD-NBR                              
                   ,:DCLACTITRF.CNTL-ASTD-STTS-CD                               
                   ,:DCLACTITRF.CMNT-TXT                                        
                   ,:DCLACTITRF.CMNT-STTS-CD                                    
                   ,:DCLACTITRF.PRCS-DT                                         
                   ,:DCLACTITRF.STTS-CD                                         
                   ,:DCLACTITRF.DSTBN-SIDE-CD                                   
                   ,:DCLACTITRF.SYS-ACT-CD                                      
                   ,:DCLACTITRF.SYS-RJCT-RSN-CD                                 
                   ,:DCLACTITRF.TRNFR-TYPE-RJCT-CD                              
                   ,:DCLACTITRF.TRNFR-TYPE-RJC1-CD                              
                   ,:DCLACTITRF.TRNFR-TYPE-RJC2-CD                              
                   ,:DCLACTITRF.TRN-TYP-RJC-STS-CD                              
                   ,:DCLACTITRF.PHSCL-SEQ-NBR                                   
                   ,:DCLACTITRF.PHSCL-SEQ-STTS-CD                               
                   ,:DCLACTITRF.LGCL-SEQ-NBR                                    
                   ,:DCLACTITRF.LGCL-SEQ-NR-STS-CD                              
                   ,:DCLACTITRF.PRTCP-CONTRA-CD                                 
                   ,:DCLACTITRF.CYCLE-CD                                        
                   ,:DCLACTITRF.DAYS-STTS-QTY                                   
                   ,:DCLACTITRF.TRANS-RFRN-ID-CD                                
                   ,:DCLACTITRF.TRANS-RFRN-STTS-CD                              
                   ,:DCLACTITRF.DB-CR-CD                                        
                   ,:DCLACTITRF.STTLM-ASCTD-DT                                  
                   ,:DCLACTITRF.STTLM-ASCTD-STS-CD                              
                   ,:DCLACTITRF.RCRD-LNGTH-STTS-CD                              
                   ,:DCLACTITRF.RCRD-STTS-CD                                    
                   ,:DCLACTITRF.NSCC-PEND-CD                                    
                   ,:DCLACTITRF.NSCC-ACK-IND                                    
                   ,:DCLACTITRF.UPDT-TMSTP                                      
                   ,:DCLACTITRF.CRT-TMSTP                                       
                   ,:DCLACTITRF.CICS-TERM-ID-CD                                 
                   ,:DCLACTITRF.PRGM-NM                                         
                   ,:DCLACTITRF.RR-CD                                           
                   ,:DCLACTITRF.CICS-SGNON-ID                                   
LRM003             ,:DCLACTITRF.CICS-NET-NM                                     
LRM003             ,:DCLACTITRF.TPSCRT-USR-ID                                   
LRM003             ,:DCLACTITRF.TPSCRT-USR-NM                                   
LRM004             ,:DCLACTITRF.GIFT-IND                                        
LRM011             ,:DCLACTITRF.PEND-DVDND-DB-AMT                               
              END-EXEC                                                          
                                                                                
              EVALUATE SQLCODE                                                  
                 WHEN +100                                                      
                    CONTINUE                                                    
                 WHEN +0                                                        
                    MOVE 'ACTITRF'   TO RECORD-SEG-ID                           
                    MOVE DCLACTITRF  TO RECORD-DETAIL                           
                    WRITE EXTRACT-RECORD                                        
                    ADD 1 TO WS-ACTITRF-COUNT                                   
                 WHEN OTHER                                                     
                    MOVE 1111 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           IF SQLCODE NOT = +100                                                
              MOVE 1112 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           EXEC SQL                                                             
              CLOSE ACTITRF_CRSR                                                
           END-EXEC                                                             
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 1113 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           ELSE                                                                 
              MOVE +0                       TO  SQLCODE                         
           END-IF.                                                              
                                                                                
       1210-FETCH-ACTIAST-RECORDS.                                              
                                                                                
             EXEC SQL                                                           
                OPEN ACTIAST_CRSR                                               
             END-EXEC                                                           
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 1210 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
                 EXEC SQL                                                       
                    FETCH ACTIAST_CRSR                                          
                      INTO                                                      
                   :DCLACTIAST.CLIENT-NBR                                       
                  ,:DCLACTIAST.DLVR-NBR                                         
                  ,:DCLACTIAST.ACCT-DLVR-NBR                                    
                  ,:DCLACTIAST.RCV-NBR                                          
                  ,:DCLACTIAST.ACCT-RCV-NBR                                     
                  ,:DCLACTIAST.TRNFR-TYPE-CD                                    
                  ,:DCLACTIAST.ISIN-CNTRY-CD                                    
                  ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                                
                  ,:DCLACTIAST.ISIN-SEC-CDG-CD                                  
                  ,:DCLACTIAST.STTLM-LCTN-CD                                    
                  ,:DCLACTIAST.CSH-MGN-SHRT-CD                                  
                  ,:DCLACTIAST.CSH-MRG-SHT-STS-CD                               
                  ,:DCLACTIAST.STTLM-LCTN-STTS-CD                               
                  ,:DCLACTIAST.ISIN-CNTRY-STTS-CD                               
                  ,:DCLACTIAST.SBMTG-PRTCP-NBR                                  
                  ,:DCLACTIAST.SBMT-PRT-NR-STS-CD                               
                  ,:DCLACTIAST.ACAT-CONTROL-NBR                                 
                  ,:DCLACTIAST.CONTROL-NBR-STS-CD                               
                  ,:DCLACTIAST.ASSET-SEQ-NBR                                    
                  ,:DCLACTIAST.AST-SEQ-NBR-STS-CD                               
                  ,:DCLACTIAST.TRANS-TYPE-CD                                    
                  ,:DCLACTIAST.TRANS-TYPE-STTS-CD                               
                  ,:DCLACTIAST.PHSCL-SEQ-NBR                                    
                  ,:DCLACTIAST.PHSCL-SEQ-STTS-CD                                
                  ,:DCLACTIAST.LGCL-SEQ-NBR                                     
                  ,:DCLACTIAST.LGCL-SEQ-NR-STS-CD                               
                  ,:DCLACTIAST.ASSET-PRC-CTGY-CD                                
                  ,:DCLACTIAST.AST-PRC-CTG-STS-CD                               
                  ,:DCLACTIAST.STTLM-RSN-CD                                     
                  ,:DCLACTIAST.STTLM-RSN-STTS-CD                                
                  ,:DCLACTIAST.ASSET-DESC-TXT                                   
                  ,:DCLACTIAST.ASSET-DESC-STTS-CD                               
                  ,:DCLACTIAST.ASSET-RQST-QTY-CD                                
                  ,:DCLACTIAST.ASSET-RQST-STS-CD                                
                  ,:DCLACTIAST.AST-RQST-TRANS-CD                                
                  ,:DCLACTIAST.AST-RQ-TRAN-STS-CD                               
                  ,:DCLACTIAST.ASSET-QTY                                        
                  ,:DCLACTIAST.ASSET-QTY-STTS-CD                                
                  ,:DCLACTIAST.ASSET-PCT                                        
                  ,:DCLACTIAST.ASSET-PCT-STTS-CD                                
                  ,:DCLACTIAST.PSTN-CD                                          
                  ,:DCLACTIAST.PSTN-CD-STTS-CD                                  
                  ,:DCLACTIAST.ISO-CRNCY-CD                                     
                  ,:DCLACTIAST.ISO-CRNCY-STTS-CD                                
                  ,:DCLACTIAST.ASSET-AMT                                        
                  ,:DCLACTIAST.ASSET-AMT-STTS-CD                                
                  ,:DCLACTIAST.BEARER-BOND-CD                                   
                  ,:DCLACTIAST.BEARER-BND-STTS-CD                               
                  ,:DCLACTIAST.WHI-CD                                           
                  ,:DCLACTIAST.WHI-STTS-CD                                      
                  ,:DCLACTIAST.TRNFR-TYPE-RSN-CD                                
                  ,:DCLACTIAST.TRN-TYP-RSN-STS-CD                               
                  ,:DCLACTIAST.MBS-SERIAL-NBR                                   
                  ,:DCLACTIAST.MBS-SERIAL-STTS-CD                               
                  ,:DCLACTIAST.ASSET-CMNT-TXT                                   
                  ,:DCLACTIAST.ASSET-CMNT-STTS-CD                               
                  ,:DCLACTIAST.NSCC-WTHLD-CD                                    
                  ,:DCLACTIAST.TRANS-RFRN-ID-CD                                 
                  ,:DCLACTIAST.TRANS-RFRN-STTS-CD                               
                  ,:DCLACTIAST.ISIN-SEC-IS-STS-CD                               
                  ,:DCLACTIAST.ISIN-SEC-CD-STS-CD                               
                  ,:DCLACTIAST.OPTN-CTGY-CD                                     
                  ,:DCLACTIAST.OPTN-CTGY-STTS-CD                                
                  ,:DCLACTIAST.RCRD-LNGTH-STTS-CD                               
                  ,:DCLACTIAST.RCRD-STTS-CD                                     
                  ,:DCLACTIAST.NSCC-PEND-CD                                     
                  ,:DCLACTIAST.NSCC-ACK-IND                                     
                  ,:DCLACTIAST.PRGM-NM                                          
                  ,:DCLACTIAST.CICS-TERM-ID-CD                                  
                  ,:DCLACTIAST.UPDT-TMSTP                                       
                  ,:DCLACTIAST.CRT-TMSTP                                        
                  ,:DCLACTIAST.SECURITY-ADP-NBR                                 
                  ,:DCLACTIAST.TRNFR-TYPE-STTS-CD                               
                  ,:DCLACTIAST.RCV-NBR-STTS-CD                                  
                  ,:DCLACTIAST.DLVR-NBR-STTS-CD                                 
                  ,:DCLACTIAST.CAGE-TAG-NBR                                     
LRM002            ,:DCLACTIAST.SCRTY-866-NBR                                    
LRM002            ,:DCLACTIAST.ASSET-866-QTY                                    
                  ,:DCLACTIAST.CICS-SGNON-ID                                    
LRM003            ,:DCLACTIAST.CICS-NET-NM                                      
LRM003            ,:DCLACTIAST.TPSCRT-USR-ID                                    
LRM003            ,:DCLACTIAST.TPSCRT-USR-NM                                    
LRM010            ,:DCLACTIAST.FOREIGN-FEE-IND                                  
LRM012            ,:DCLACTIAST.CRNCY-CD                                         
                 END-EXEC                                                       
                                                                                
              EVALUATE SQLCODE                                                  
                 WHEN +100                                                      
                   CONTINUE                                                     
                 WHEN +0                                                        
                    MOVE 'ACTIAST'   TO RECORD-SEG-ID                           
                    MOVE DCLACTIAST TO RECORD-DETAIL                            
                    MOVE ASSET-QTY OF DCLACTIAST TO WS-ASSET-QTY                
                    MOVE ASSET-AMT OF DCLACTIAST TO WS-ASSET-AMT                
                    MOVE ASSET-PCT OF DCLACTIAST TO WS-ASSET-PCT                
LRM012              MOVE WS-ASSET-SUFFIX TO RECORD-DETAIL(700 : 39)             
                    WRITE EXTRACT-RECORD                                        
                    ADD 1 TO WS-ACTIAST-COUNT                                   
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           IF SQLCODE NOT = +100                                                
              MOVE 1211 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           EXEC SQL                                                             
              CLOSE ACTIAST_CRSR                                                
           END-EXEC                                                             
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 1212 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
       1310-FETCH-ACTIMF-RECORDS.                                               
                                                                                
             EXEC SQL                                                           
                OPEN ACTIMF_CRSR                                                
             END-EXEC                                                           
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 1310 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
                 EXEC SQL                                                       
                    FETCH ACTIMF_CRSR                                           
                      INTO                                                      
                   :DCLACTIMF.CLIENT-NBR                                        
                  ,:DCLACTIMF.DLVR-NBR                                          
                  ,:DCLACTIMF.ACCT-DLVR-NBR                                     
                  ,:DCLACTIMF.RCV-NBR                                           
                  ,:DCLACTIMF.ACCT-RCV-NBR                                      
                  ,:DCLACTIMF.TRNFR-TYPE-CD                                     
                  ,:DCLACTIMF.ISIN-CNTRY-CD                                     
                  ,:DCLACTIMF.ISIN-SEC-ISSUE-CD                                 
                  ,:DCLACTIMF.ISIN-SEC-CDG-CD                                   
                  ,:DCLACTIMF.STTLM-LCTN-CD                                     
                  ,:DCLACTIMF.CSH-MGN-SHRT-CD                                   
                  ,:DCLACTIMF.BK-PHSCL-SHR-CD                                   
                  ,:DCLACTIMF.BK-PHSC-SHR-STS-CD                                
                  ,:DCLACTIMF.NTWRK-CNTL-CD                                     
                  ,:DCLACTIMF.NTWRK-CNTL-STTS-CD                                
                  ,:DCLACTIMF.ACCT-TYPE-CD                                      
                  ,:DCLACTIMF.ACCT-TYPE-STTS-CD                                 
                  ,:DCLACTIMF.DVDND-CD                                          
                  ,:DCLACTIMF.DVDND-STTS-CD                                     
                  ,:DCLACTIMF.DVDND-PAYEE-CD                                    
                  ,:DCLACTIMF.DVDND-PYE-STTS-CD                                 
                  ,:DCLACTIMF.LTCG-CD                                           
                  ,:DCLACTIMF.BRKR-EXCTG-NBR                                    
                  ,:DCLACTIMF.BRKR-EXCTG-STTS-CD                                
                  ,:DCLACTIMF.STCG-CD                                           
                  ,:DCLACTIMF.MF-FULL-PRTL-CD                                   
                  ,:DCLACTIMF.MF-FUL-PRTL-STS-CD                                
                  ,:DCLACTIMF.RGSTN-CD                                          
                  ,:DCLACTIMF.FNBR                                              
                  ,:DCLACTIMF.FND-ACT-NBR-STS-CD                                
                  ,:DCLACTIMF.DSTBN-SIDE-CD                                     
                  ,:DCLACTIMF.PRCS-DT                                           
                  ,:DCLACTIMF.CRT-TMSTP                                         
                  ,:DCLACTIMF.UPDT-TMSTP                                        
                  ,:DCLACTIMF.CICS-TERM-ID-CD                                   
                  ,:DCLACTIMF.PRGM-NM                                           
                  ,:DCLACTIMF.SECURITY-ADP-NBR                                  
                  ,:DCLACTIMF.FCST-ACCT-RCVR-NBR                                
LRM001            ,:DCLACTIMF.ACAT-CONTROL-NBR                                  
LRM001            ,:DCLACTIMF.ASSET-SEQ-NBR                                     
LRM014            ,:DCLACTIMF.FND-AGNT-CD                                       
                 END-EXEC                                                       
                                                                                
              EVALUATE SQLCODE                                                  
                 WHEN +100                                                      
                   CONTINUE                                                     
                 WHEN +0                                                        
                    MOVE 'ACTIMF'   TO RECORD-SEG-ID                            
                    MOVE DCLACTIMF TO RECORD-DETAIL                             
                    WRITE EXTRACT-RECORD                                        
                    ADD 1 TO WS-ACTIMF-COUNT                                    
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           IF SQLCODE NOT = +100                                                
              MOVE 1311 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           EXEC SQL                                                             
              CLOSE ACTIMF_CRSR                                                 
           END-EXEC                                                             
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 1312 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
       1410-FETCH-ACTIOPN-RECORDS.                                              
                                                                                
             EXEC SQL                                                           
                OPEN ACTIOPN_CRSR                                               
             END-EXEC                                                           
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 1410 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
                 EXEC SQL                                                       
                    FETCH ACTIOPN_CRSR                                          
                      INTO                                                      
                   :DCLACTIOPN.CLIENT-NBR                                       
                  ,:DCLACTIOPN.DLVR-NBR                                         
                  ,:DCLACTIOPN.ACCT-DLVR-NBR                                    
                  ,:DCLACTIOPN.RCV-NBR                                          
                  ,:DCLACTIOPN.ACCT-RCV-NBR                                     
                  ,:DCLACTIOPN.TRNFR-TYPE-CD                                    
                  ,:DCLACTIOPN.ISIN-CNTRY-CD                                    
                  ,:DCLACTIOPN.ISIN-SEC-ISSUE-CD                                
                  ,:DCLACTIOPN.ISIN-SEC-CDG-CD                                  
                  ,:DCLACTIOPN.STTLM-LCTN-CD                                    
                  ,:DCLACTIOPN.CSH-MGN-SHRT-CD                                  
                  ,:DCLACTIOPN.BS-CD                                            
                  ,:DCLACTIOPN.BS-STTS-CD                                       
                  ,:DCLACTIOPN.PTCL-CD                                          
                  ,:DCLACTIOPN.PTCL-STTS-CD                                     
                  ,:DCLACTIOPN.OPTN-OPN-CLSD-CD                                 
                  ,:DCLACTIOPN.OPT-OPN-CLS-TST-CD                               
                  ,:DCLACTIOPN.SYM-CD                                           
                  ,:DCLACTIOPN.SYM-STTS-CD                                      
                  ,:DCLACTIOPN.EXPTN-DT                                         
                  ,:DCLACTIOPN.STPRC-INTEGER-AMT                                
                  ,:DCLACTIOPN.STPRC-INTR-STTS-CD                               
                  ,:DCLACTIOPN.STPRC-FRCTN-AMT                                  
                  ,:DCLACTIOPN.STPRC-FRCT-STTS-CD                               
                  ,:DCLACTIOPN.DLVR-OCC-NBR                                     
                  ,:DCLACTIOPN.OPTN-ACCT-TYPE-CD                                
                  ,:DCLACTIOPN.OPT-ACT-TYP-STS-CD                               
                  ,:DCLACTIOPN.ACCT-SUB-CD                                      
                  ,:DCLACTIOPN.ACCT-SUB-STTS-CD                                 
                  ,:DCLACTIOPN.OPTN-CMNT-TXT                                    
                  ,:DCLACTIOPN.OPTN-CMNT-CD                                     
                  ,:DCLACTIOPN.OPTN-EXPTN-DT-CD                                 
                  ,:DCLACTIOPN.OPT-OCC-DLV-STS-CD                               
                  ,:DCLACTIOPN.NSCC-ACK-IND                                     
                  ,:DCLACTIOPN.NSCC-PEND-CD                                     
                  ,:DCLACTIOPN.CRT-TMSTP                                        
                  ,:DCLACTIOPN.UPDT-TMSTP                                       
                  ,:DCLACTIOPN.CICS-TERM-ID-CD                                  
                  ,:DCLACTIOPN.PRGM-NM                                          
                  ,:DCLACTIOPN.SECURITY-ADP-NBR                                 
LRM001            ,:DCLACTIOPN.ACAT-CONTROL-NBR                                 
LRM001            ,:DCLACTIOPN.ASSET-SEQ-NBR                                    
LRM008            ,:DCLACTIOPN.STPRC-INTEGER2-AMT                               
                 END-EXEC                                                       
                                                                                
              EVALUATE SQLCODE                                                  
                 WHEN +100                                                      
                   CONTINUE                                                     
                 WHEN +0                                                        
                    MOVE 'ACTIOPN' TO RECORD-SEG-ID                             
                    MOVE DCLACTIOPN TO RECORD-DETAIL                            
                    ADD 1 TO WS-ACTIOPN-COUNT                                   
                    WRITE EXTRACT-RECORD                                        
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           IF SQLCODE NOT = +100                                                
              MOVE 1411 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           EXEC SQL                                                             
              CLOSE ACTIOPN_CRSR                                                
           END-EXEC                                                             
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 1412 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
                                                                                
           EJECT                                                                
       1500-EXTRACT-VTRNFR-RTN.                                                 
           IF WS-VTRNFR-ALL                                                     
              MOVE LOW-VALUES  TO WS-VTRNFR-FR-CNTL-NBR                         
              MOVE HIGH-VALUES TO WS-VTRNFR-TO-CNTL-NBR                         
           END-IF.                                                              
                                                                                
           EXEC SQL OPEN VTRNFR_CRSR END-EXEC                                   
           IF SQLCODE NOT = +0                                                  
              MOVE 1500 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
              EXEC SQL                                                          
                 FETCH VTRNFR_CRSR                                              
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
                     ,:DCLVTRNFR.ACCT-TRNFR-FEE-AMT                     -3.     
                     ,:DCLVTRNFR.ACCT-IRA-TRMNT-AMT                     -3.     
                     ,:DCLVTRNFR.ACCT-IRA-MAINT-AMT                     -3.     
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
                     ,:DCLVTRNFR.ACCT-RB-SEC-IND                                
                     ,:DCLVTRNFR.ACCT-CLT-RSCND-IND                             
                     ,:DCLVTRNFR.ACCT-LGL-BLK-IND                               
                     ,:DCLVTRNFR.FRV-MFC-CMPLT-IND                              
LRM003               ,:DCLVTRNFR.ACCT-FRZN-IND                                  
LRM004               ,:DCLVTRNFR.BRANCH-ALTNT-CD                                
LRM004               ,:DCLVTRNFR.GIFT-IND                                       
LRM004               ,:DCLVTRNFR.RSTR-TRD-90-DY-IND                             
LRM004               ,:DCLVTRNFR.REG-T-IND                                      
LRM004               ,:DCLVTRNFR.ADOPT-AGRMT-IND                                
LRM004               ,:DCLVTRNFR.RR-ORGNL-CD                                    
LRM006               ,:DCLVTRNFR.CVRSN-ACCT-NBR                                 
DJ0002               ,:DCLVTRNFR.AUCTION-RT-IND                                 
LRM008               ,:DCLVTRNFR.PENNY-STK-IND                                  
LRM009               ,:DCLVTRNFR.GEO-CD                                         
LRM010               ,:DCLVTRNFR.FOREIGN-FEE-IND                                
LRM010               ,:DCLVTRNFR.FOREIGN-FEE-AMT                                
LRM011               ,:DCLVTRNFR.PEND-DVDND-DB-AMT                              
LRM011               ,:DCLVTRNFR.NTWRK-LVL4-FND-IND                             
LRM015               ,:DCLVTRNFR.PAPER-FEE-AMT                                  
              END-EXEC                                                          
              EVALUATE SQLCODE                                                  
                 WHEN +100                                                      
                    CONTINUE                                                    
                 WHEN +0                                                        
                    MOVE 'VTRNFR'  TO RECORD-SEG-ID                             
                    MOVE DCLVTRNFR TO RECORD-DETAIL                             
                    WRITE EXTRACT-RECORD                                        
                    ADD 1 TO WS-VTRNFR-COUNT                                    
                    PERFORM 1600-FETCH-AT-RECORDS                               
                    PERFORM 1700-FETCH-MF-RECORDS                               
                    PERFORM 1800-FETCH-OPN-RECORDS                              
                 WHEN OTHER                                                     
                    MOVE 1510 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           IF SQLCODE NOT = +100                                                
              MOVE 1520 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           EXEC SQL                                                             
              CLOSE VTRNFR_CRSR                                                 
           END-EXEC                                                             
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 1530 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           ELSE                                                                 
              MOVE +0                       TO  SQLCODE                         
           END-IF.                                                              
                                                                                
      ******************                                                        
       1600-FETCH-AT-RECORDS.                                                   
      ******************                                                        
                                                                                
             EXEC SQL                                                           
                OPEN VASSET_CRSR                                                
             END-EXEC                                                           
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 1600 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
                 EXEC SQL                                                       
                    FETCH VASSET_CRSR                                           
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
                  ,:DCLVASSET.RESTRICTED-IND                                    
                  ,:DCLVASSET.CAGE-TAG-NBR                                      
LRM002            ,:DCLVASSET.SCRTY-866-NBR                                     
LRM002            ,:DCLVASSET.ASSET-866-QTY                                     
DJ0002            ,:DCLVASSET.AUCTION-RT-IND                                    
LRM010            ,:DCLVASSET.FOREIGN-FEE-IND                                   
LRM012            ,:DCLVASSET.CRNCY-CD                                          
LRM013            ,:DCLVASSET.MEMO-ORG-RVRSL-QTY                                
                 END-EXEC                                                       
                                                                                
              EVALUATE SQLCODE                                                  
                 WHEN +100                                                      
                   CONTINUE                                                     
                 WHEN +0                                                        
                    MOVE 'VASSET'  TO RECORD-SEG-ID                             
                    MOVE DCLVASSET TO RECORD-DETAIL                             
                    MOVE ASSET-QTY OF DCLVASSET TO WS-ASSET-QTY                 
                    MOVE ASSET-AMT OF DCLVASSET TO WS-ASSET-AMT                 
                    MOVE ASSET-PCT OF DCLVASSET TO WS-ASSET-PCT                 
LRM012              MOVE WS-ASSET-SUFFIX TO RECORD-DETAIL(700 : 39)             
                    WRITE EXTRACT-RECORD                                        
                    ADD 1 TO WS-VASSET-COUNT                                    
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           IF SQLCODE NOT = +100                                                
              MOVE 1610 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           EXEC SQL                                                             
              CLOSE VASSET_CRSR                                                 
           END-EXEC                                                             
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 1620 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
       1700-FETCH-MF-RECORDS.                                                   
                                                                                
             EXEC SQL                                                           
                OPEN VMF_CRSR                                                   
             END-EXEC                                                           
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 1700 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
                 EXEC SQL                                                       
                    FETCH VMF_CRSR                                              
                      INTO                                                      
                   :DCLVMF.CLIENT-NBR                                           
                  ,:DCLVMF.ACAT-CONTROL-NBR                                     
                  ,:DCLVMF.ASSET-SEQ-NBR                                        
                  ,:DCLVMF.BK-PHSCL-SHR-CD                                      
                  ,:DCLVMF.BK-PHSC-SHR-STS-CD                                   
                  ,:DCLVMF.NTWRK-CNTL-CD                                        
                  ,:DCLVMF.NTWRK-CNTL-STTS-CD                                   
                  ,:DCLVMF.ACCT-TYPE-CD                                         
                  ,:DCLVMF.ACCT-TYPE-STTS-CD                                    
                  ,:DCLVMF.DVDND-CD                                             
                  ,:DCLVMF.DVDND-STTS-CD                                        
                  ,:DCLVMF.DVDND-PAYEE-CD                                       
                  ,:DCLVMF.DVDND-PYE-STTS-CD                                    
                  ,:DCLVMF.LTCG-CD                                              
                  ,:DCLVMF.BRKR-EXCTG-NBR                                       
                  ,:DCLVMF.BRKR-EXCTG-STTS-CD                                   
                  ,:DCLVMF.STCG-CD                                              
                  ,:DCLVMF.MF-FULL-PRTL-CD                                      
                  ,:DCLVMF.MF-FUL-PRTL-STS-CD                                   
                  ,:DCLVMF.RGSTN-CD                                             
                  ,:DCLVMF.FNBR                                                 
                  ,:DCLVMF.FND-ACT-NBR-STS-CD                                   
                  ,:DCLVMF.DSTBN-SIDE-CD                                        
                  ,:DCLVMF.PRCS-DT                                              
                  ,:DCLVMF.CRT-TMSTP                                            
                  ,:DCLVMF.UPDT-TMSTP                                           
                  ,:DCLVMF.CICS-TERM-ID-CD                                      
                  ,:DCLVMF.PRGM-NM                                              
                  ,:DCLVMF.FCST-ACCT-RCVR-NBR                                   
                  ,:DCLVMF.FCST-RCVR-STTS-CD                                    
                 END-EXEC                                                       
                                                                                
              EVALUATE SQLCODE                                                  
                 WHEN +100                                                      
                   CONTINUE                                                     
                 WHEN +0                                                        
                    MOVE 'VMF'     TO RECORD-SEG-ID                             
                    MOVE DCLVMF    TO RECORD-DETAIL                             
                    WRITE EXTRACT-RECORD                                        
                    ADD 1 TO WS-VMF-COUNT                                       
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           IF SQLCODE NOT = +100                                                
              MOVE 1710 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           EXEC SQL                                                             
              CLOSE VMF_CRSR                                                    
           END-EXEC                                                             
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 1720 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
       1800-FETCH-OPN-RECORDS.                                                  
                                                                                
             EXEC SQL                                                           
                OPEN VOPTN_CRSR                                                 
             END-EXEC                                                           
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 1800 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
                 EXEC SQL                                                       
                    FETCH VOPTN_CRSR                                            
                      INTO                                                      
                   :DCLVOPTN.CLIENT-NBR                                         
                  ,:DCLVOPTN.ACAT-CONTROL-NBR                                   
                  ,:DCLVOPTN.ASSET-SEQ-NBR                                      
                  ,:DCLVOPTN.BS-CD                                              
                  ,:DCLVOPTN.BS-STTS-CD                                         
                  ,:DCLVOPTN.PTCL-CD                                            
                  ,:DCLVOPTN.PTCL-STTS-CD                                       
                  ,:DCLVOPTN.OPTN-OPN-CLSD-CD                                   
                  ,:DCLVOPTN.OPT-OPN-CLS-STS-CD                                 
                  ,:DCLVOPTN.SYM-CD                                             
                  ,:DCLVOPTN.SYM-STTS-CD                                        
                  ,:DCLVOPTN.EXPTN-DT                                           
                  ,:DCLVOPTN.STPRC-INTEGER-AMT                                  
                  ,:DCLVOPTN.STPRC-INTR-STTS-CD                                 
                  ,:DCLVOPTN.STPRC-FRCTN-AMT                                    
                  ,:DCLVOPTN.STPRC-FRCT-STTS-CD                                 
                  ,:DCLVOPTN.DLVR-OCC-NBR                                       
                  ,:DCLVOPTN.OPTN-ACCT-TYPE-CD                                  
                  ,:DCLVOPTN.OPT-ACT-TYP-STS-CD                                 
                  ,:DCLVOPTN.ACCT-SUB-CD                                        
                  ,:DCLVOPTN.ACCT-SUB-STTS-CD                                   
                  ,:DCLVOPTN.OPTN-CMNT-TXT                                      
                  ,:DCLVOPTN.OPTN-CMNT-STTS-CD                                  
                  ,:DCLVOPTN.OPTN-EXPTN-DT-CD                                   
                  ,:DCLVOPTN.OPT-OCC-DLV-STS-CD                                 
                  ,:DCLVOPTN.ACCT-TYPE-MSMT-IND                                 
                  ,:DCLVOPTN.CRT-TMSTP                                          
                  ,:DCLVOPTN.UPDT-TMSTP                                         
                  ,:DCLVOPTN.PRGM-NM                                            
                  ,:DCLVOPTN.CICS-TERM-ID-CD                                    
                  ,:DCLVOPTN.STPRC-DEC-FRCN-IND                                 
LRM008            ,:DCLVOPTN.STPRC-INTEGER2-AMT                                 
                 END-EXEC                                                       
                                                                                
              EVALUATE SQLCODE                                                  
                 WHEN +100                                                      
                   CONTINUE                                                     
                 WHEN +0                                                        
                    MOVE 'VOPTN '  TO RECORD-SEG-ID                             
                    MOVE DCLVOPTN  TO RECORD-DETAIL                             
                    WRITE EXTRACT-RECORD                                        
                    ADD 1 TO WS-VOPTN-COUNT                                     
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           IF SQLCODE NOT = +100                                                
              MOVE 1810 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           EXEC SQL                                                             
              CLOSE VOPTN_CRSR                                                  
           END-EXEC                                                             
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 1820 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
       1900-FETCH-VFNDRGST-RECORDS.                                             
                                                                                
             EXEC SQL                                                           
                OPEN VFNDRGST_CRSR                                              
             END-EXEC                                                           
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 1900 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
                 EXEC SQL                                                       
                    FETCH VFNDRGST_CRSR                                         
                      INTO                                                      
                   :DCLVFNDRGST.CLIENT-NBR                                      
                  ,:DCLVFNDRGST.ACAT-CONTROL-NBR                                
                  ,:DCLVFNDRGST.ASSET-SEQ-NBR                                   
                  ,:DCLVFNDRGST.SBMTG-PRTCP-NBR                                 
                  ,:DCLVFNDRGST.SBMT-PRT-NR-STS-CD                              
                  ,:DCLVFNDRGST.CONTROL-NBR-STS-CD                              
                  ,:DCLVFNDRGST.AST-SEQ-NBR-STS-CD                              
                  ,:DCLVFNDRGST.SYS-ACT-CD                                      
                  ,:DCLVFNDRGST.SYS-RJCT-RSN-CD                                 
                  ,:DCLVFNDRGST.MF-TRANS-TYPE-CD                                
                  ,:DCLVFNDRGST.MF-TRAN-TYP-STS-CD                              
                  ,:DCLVFNDRGST.RCRD-STTS-CD                                    
                  ,:DCLVFNDRGST.NRA-TAX-PCT                                     
                  ,:DCLVFNDRGST.NRA-TAX-PCT-CD                                  
                  ,:DCLVFNDRGST.DSBMT-ACCRL-CD                                  
                  ,:DCLVFNDRGST.DSBMT-ACCRL-STS-CD                              
                  ,:DCLVFNDRGST.DSBMT-FRCTN-CSH-CD                              
                  ,:DCLVFNDRGST.DSBMT-FRCTN-STS-CD                              
                  ,:DCLVFNDRGST.BK-PHSCL-SHR-CD                                 
                  ,:DCLVFNDRGST.BK-PHSC-SHR-STS-CD                              
                  ,:DCLVFNDRGST.FRCTN-CD                                        
                  ,:DCLVFNDRGST.FRCTN-STTS-CD                                   
                  ,:DCLVFNDRGST.DLRVY-CD                                        
                  ,:DCLVFNDRGST.TPA-NBR                                         
                  ,:DCLVFNDRGST.TPA-NBR-STTS-CD                                 
                  ,:DCLVFNDRGST.CUST-NM                                         
                  ,:DCLVFNDRGST.CUST-NM-STTS-CD                                 
                  ,:DCLVFNDRGST.FUND-ACCT-CD                                    
                  ,:DCLVFNDRGST.FUND-ACCT-STTS-CD                               
                  ,:DCLVFNDRGST.BRKR-EXCTG-NBR                                  
                  ,:DCLVFNDRGST.BRKR-EXCTG-STTS-CD                              
                  ,:DCLVFNDRGST.DSBMT-RSDL-CD                                   
                  ,:DCLVFNDRGST.DSBMT-RSDL-STS-CD                               
                  ,:DCLVFNDRGST.NTWRK-CNTL-CD                                   
                  ,:DCLVFNDRGST.NTWRK-CNTL-STTS-CD                              
                  ,:DCLVFNDRGST.DVDND-CD                                        
                  ,:DCLVFNDRGST.DVDND-STTS-CD                                   
                  ,:DCLVFNDRGST.FNBR                                            
                  ,:DCLVFNDRGST.FND-ACT-NBR-STS-CD                              
                  ,:DCLVFNDRGST.LTCG-CD                                         
                  ,:DCLVFNDRGST.SS-TIN-CD                                       
                  ,:DCLVFNDRGST.STCG-CD                                         
                  ,:DCLVFNDRGST.WTHLD-CD                                        
                  ,:DCLVFNDRGST.WTHLD-STTS-CD                                   
                  ,:DCLVFNDRGST.PYBL-INFO-CD                                    
                  ,:DCLVFNDRGST.PYBL-INFO-STTS-CD                               
                  ,:DCLVFNDRGST.ZIP5-CD                                         
                  ,:DCLVFNDRGST.ZIP5-STTS-CD                                    
                  ,:DCLVFNDRGST.ZIP4-CD                                         
                  ,:DCLVFNDRGST.ZIP4-STTS-CD                                    
                  ,:DCLVFNDRGST.SOC-CD                                          
                  ,:DCLVFNDRGST.SOC-STTS-CD                                     
                  ,:DCLVFNDRGST.NAV-ACCT-IND                                    
                  ,:DCLVFNDRGST.NAV-ACCT-STTS-CD                                
                  ,:DCLVFNDRGST.MRGN-ACCT-IND                                   
                  ,:DCLVFNDRGST.MRGN-ACCT-STTS-CD                               
                  ,:DCLVFNDRGST.CHCK-WRTNG-IND                                  
                  ,:DCLVFNDRGST.CHCK-WRTNG-STTS-CD                              
                  ,:DCLVFNDRGST.SL-ST-CD                                        
                  ,:DCLVFNDRGST.SL-ST-STTS-CD                                   
                  ,:DCLVFNDRGST.CNTRY-ORGN-CD                                   
                  ,:DCLVFNDRGST.CNTRY-ORGN-STTS-CD                              
                  ,:DCLVFNDRGST.ACCT-RR-NM                                      
                  ,:DCLVFNDRGST.ACCT-RR-NM-STTS-CD                              
                  ,:DCLVFNDRGST.ACCT-RR-CD                                      
                  ,:DCLVFNDRGST.ACCT-RR-STTS-CD                                 
                  ,:DCLVFNDRGST.BRCH-NBR                                        
                  ,:DCLVFNDRGST.BRCH-NBR-STTS-CD                                
                  ,:DCLVFNDRGST.PYBL-QTY                                        
                  ,:DCLVFNDRGST.PYBL-QTY-STTS-CD                                
                  ,:DCLVFNDRGST.MEMO-TXT                                        
                  ,:DCLVFNDRGST.MEMO-STTS-CD                                    
                  ,:DCLVFNDRGST.ACH-IND                                         
                  ,:DCLVFNDRGST.ACH-STTS-CD                                     
                  ,:DCLVFNDRGST.PAC-IND                                         
                  ,:DCLVFNDRGST.PAC-STTS-CD                                     
                  ,:DCLVFNDRGST.SWP-IND                                         
                  ,:DCLVFNDRGST.SWP-STTS-CD                                     
                  ,:DCLVFNDRGST.ROA-LOI-AMT                                     
                  ,:DCLVFNDRGST.ROA-LOI-STTS-CD                                 
                  ,:DCLVFNDRGST.LOI-DT                                          
                  ,:DCLVFNDRGST.LOI-STTS-CD                                     
                  ,:DCLVFNDRGST.TRD-RLTD-IND                                    
                  ,:DCLVFNDRGST.TRD-RLTD-STTS-CD                                
                  ,:DCLVFNDRGST.ACCT-RLTD-NBR                                   
                  ,:DCLVFNDRGST.ACCT-RLTD-STTS-CD                               
                  ,:DCLVFNDRGST.ACCT-RLTD-CD                                    
                  ,:DCLVFNDRGST.ACCT-RLT-IN-STS-CD                              
                  ,:DCLVFNDRGST.SWP-PAC-EFFCT-DT                                
                  ,:DCLVFNDRGST.SWP-PAC-DT-STTS-CD                              
                  ,:DCLVFNDRGST.CDSC-PYMNT-CD                                   
                  ,:DCLVFNDRGST.CDSC-PYMNT-STTS-CD                              
                  ,:DCLVFNDRGST.DSBMT-OPTN-CD                                   
                  ,:DCLVFNDRGST.DSBMT-OPTN-STTS-CD                              
                  ,:DCLVFNDRGST.DSBMT-AMT                                       
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
                  ,:DCLVFNDRGST.CHCK-FRST-DT                                    
                  ,:DCLVFNDRGST.CHCK-FRS-DT-STS-CD                              
                  ,:DCLVFNDRGST.ABA-ROUTING-NBR                                 
                  ,:DCLVFNDRGST.ABA-ROTNG-STTS-CD                               
                  ,:DCLVFNDRGST.COST-BSS-CD                                     
                  ,:DCLVFNDRGST.COST-BS-OPT-STS-CD                              
                  ,:DCLVFNDRGST.RCRD-LNGTH-STTS-CD                              
                  ,:DCLVFNDRGST.SS-TIN-NBR                                      
                  ,:DCLVFNDRGST.LGCL-SEQ-NR-STS-CD                              
                  ,:DCLVFNDRGST.TRANS-TYPE-STTS-CD                              
                  ,:DCLVFNDRGST.TRNFR-TYPE-CD                                   
                  ,:DCLVFNDRGST.TRNFR-TYPE-STTS-CD                              
                  ,:DCLVFNDRGST.RCV-NBR-STTS-CD                                 
                  ,:DCLVFNDRGST.DLVR-NBR-STS-CD                                 
                  ,:DCLVFNDRGST.ISIN-CNTRY-CD                                   
                  ,:DCLVFNDRGST.ISIN-CNTRY-STTS-CD                              
                  ,:DCLVFNDRGST.ISIN-SEC-ISSUE-CD                               
                  ,:DCLVFNDRGST.ISIN-SEC-IS-STS-CD                              
                  ,:DCLVFNDRGST.ISIN-SEC-CDG-CD                                 
                  ,:DCLVFNDRGST.ISIN-SEC-CD-STS-CD                              
                  ,:DCLVFNDRGST.PI-DLRVY-CD                                     
                  ,:DCLVFNDRGST.PI-DLVRY-STTS-CD                                
                  ,:DCLVFNDRGST.AST-PRC-CTG-STS-CD                              
                  ,:DCLVFNDRGST.SS-TIN-STTS-CD                                  
                  ,:DCLVFNDRGST.SS-TIN-NBR-STTS-CD                              
                  ,:DCLVFNDRGST.CUST-NM-LN-STTS-CD                              
                  ,:DCLVFNDRGST.NM-END-LN-QTY                                   
                  ,:DCLVFNDRGST.NM-END-LN-STTS-CD                               
                  ,:DCLVFNDRGST.PHSCL-SEQ-STTS-CD                               
                  ,:DCLVFNDRGST.DSTBN-SIDE-CD                                   
                  ,:DCLVFNDRGST.PRCS-DT                                         
                  ,:DCLVFNDRGST.ACTION-TYPE-CD                                  
                  ,:DCLVFNDRGST.FND-SERV-CNTL-NBR                               
                  ,:DCLVFNDRGST.CUST-FUND-NM                                    
                  ,:DCLVFNDRGST.CERT-NBR                                        
                  ,:DCLVFNDRGST.ASSET-QTY                                       
                  ,:DCLVFNDRGST.ASSET-ORGNL-QTY                                 
                  ,:DCLVFNDRGST.ISO-CRNCY-CD                                    
                  ,:DCLVFNDRGST.ASSET-AMT                                       
                  ,:DCLVFNDRGST.DB-CR-CD                                        
                  ,:DCLVFNDRGST.ASSET-DESC-TXT                                  
                  ,:DCLVFNDRGST.CERT-DT                                         
                  ,:DCLVFNDRGST.STTLM-ASCTD-DT                                  
                  ,:DCLVFNDRGST.STTLM-DT                                        
                  ,:DCLVFNDRGST.RJCT-CD                                         
                  ,:DCLVFNDRGST.NSCC-NON-ADP-IND                                
                  ,:DCLVFNDRGST.NSCC-PEND-CD                                    
                  ,:DCLVFNDRGST.NSCC-ACK-IND                                    
                  ,:DCLVFNDRGST.CICS-TERM-ID-CD                                 
                  ,:DCLVFNDRGST.PRGM-NM                                         
                  ,:DCLVFNDRGST.CRT-TMSTP                                       
                  ,:DCLVFNDRGST.UPDT-TMSTP                                      
                  ,:DCLVFNDRGST.SECURITY-ADP-NBR                                
                  ,:DCLVFNDRGST.DLVR-NBR                                        
                  ,:DCLVFNDRGST.ROA-LOI-CD                                      
                  ,:DCLVFNDRGST.FUND-BK-CD                                      
                  ,:DCLVFNDRGST.W8-WTHLD-CD                                     
                  ,:DCLVFNDRGST.W8-CERT-DT                                      
                  ,:DCLVFNDRGST.W8-EXPTN-DT                                     
                  ,:DCLVFNDRGST.W8-OVRD-NRA-SPC-RT                              
                  ,:DCLVFNDRGST.W8-QULFD-INTRM-IND                              
                  ,:DCLVFNDRGST.W8-OVRD-CNTRY-CD                                
                  ,:DCLVFNDRGST.W8-WTHLD-STTS-CD                                
                  ,:DCLVFNDRGST.W8-CERT-DT-STTS-CD                              
                  ,:DCLVFNDRGST.W8-EXPTN-DT-STS-CD                              
                  ,:DCLVFNDRGST.W8-SPCL-RT-STTS-CD                              
                  ,:DCLVFNDRGST.W8-QLFD-INT-STS-CD                              
                  ,:DCLVFNDRGST.W8-ORD-CTRY-STS-CD                              
LRM014            ,:DCLVFNDRGST.FND-AGNT-CD                                     
LRM016            ,:DCLVFNDRGST.SENT-BNWTRAN-IND                                
                 END-EXEC                                                       
                                                                                
              EVALUATE SQLCODE                                                  
                 WHEN +100                                                      
                   CONTINUE                                                     
                 WHEN +0                                                        
                    MOVE 'VFNDRGST' TO RECORD-SEG-ID                            
                    MOVE DCLVFNDRGST TO RECORD-DETAIL                           
                    WRITE EXTRACT-RECORD                                        
                    ADD 1 TO WS-VFNDRGST-COUNT                                  
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           IF SQLCODE NOT = +100                                                
              MOVE 1910 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           EXEC SQL                                                             
              CLOSE VFNDRGST_CRSR                                               
           END-EXEC                                                             
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 1920 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
       1950-FETCH-VFNDSRVS-RECORDS.                                             
                                                                                
             EXEC SQL                                                           
                OPEN VFNDSRVS_CRSR                                              
             END-EXEC                                                           
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 1950 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
                 EXEC SQL                                                       
                    FETCH VFNDSRVS_CRSR                                         
                      INTO                                                      
                   :DCLVFNDSRVS.CLIENT-NBR                                      
                  ,:DCLVFNDSRVS.ACAT-CONTROL-NBR                                
                  ,:DCLVFNDSRVS.ASSET-SEQ-NBR                                   
                  ,:DCLVFNDSRVS.ACCT-TYPE-CD                                    
                  ,:DCLVFNDSRVS.ACTION-TYPE-CD                                  
                  ,:DCLVFNDSRVS.PRCS-DT                                         
                  ,:DCLVFNDSRVS.DSTBN-SIDE-CD                                   
                  ,:DCLVFNDSRVS.FNBR                                            
                  ,:DCLVFNDSRVS.NTWRK-CNTL-CD                                   
                  ,:DCLVFNDSRVS.PI-DLRVY-CD                                     
                  ,:DCLVFNDSRVS.FND-SERV-CNTL-NBR                               
                  ,:DCLVFNDSRVS.RCV-ACCT-TYPE-CD                                
                  ,:DCLVFNDSRVS.RCV-CUST-NM                                     
                  ,:DCLVFNDSRVS.CERT-NBR                                        
                  ,:DCLVFNDSRVS.ASSET-QTY                                       
                  ,:DCLVFNDSRVS.ASSET-ORGNL-QTY                                 
                  ,:DCLVFNDSRVS.ISO-CRNCY-CD                                    
                  ,:DCLVFNDSRVS.ASSET-AMT                                       
                  ,:DCLVFNDSRVS.DB-CR-CD                                        
                  ,:DCLVFNDSRVS.ISIN-CNTRY-CD                                   
                  ,:DCLVFNDSRVS.ISIN-SEC-ISSUE-CD                               
                  ,:DCLVFNDSRVS.ISIN-SEC-CDG-CD                                 
                  ,:DCLVFNDSRVS.ASSET-DESC-TXT                                  
                  ,:DCLVFNDSRVS.CERT-DT                                         
                  ,:DCLVFNDSRVS.STTLM-ORGNL-DT                                  
                  ,:DCLVFNDSRVS.STTLM-DT                                        
                  ,:DCLVFNDSRVS.RJCT-CD                                         
                  ,:DCLVFNDSRVS.DSBMT-ACCRL-CD                                  
                  ,:DCLVFNDSRVS.DSBMT-FRCTN-CSH-CD                              
                  ,:DCLVFNDSRVS.DSBMT-RSDL-CD                                   
                  ,:DCLVFNDSRVS.DVDND-CD                                        
                  ,:DCLVFNDSRVS.CUST-NM                                         
                  ,:DCLVFNDSRVS.CICS-TERM-ID-CD                                 
                  ,:DCLVFNDSRVS.PRGM-NM                                         
                  ,:DCLVFNDSRVS.CRT-TMSTP                                       
                  ,:DCLVFNDSRVS.UPDT-TMSTP                                      
                  ,:DCLVFNDSRVS.SECURITY-ADP-NBR                                
                 END-EXEC                                                       
                                                                                
              EVALUATE SQLCODE                                                  
                 WHEN +100                                                      
                   CONTINUE                                                     
                 WHEN +0                                                        
                    MOVE 'VFNDSRVS' TO RECORD-SEG-ID                            
                    MOVE DCLVFNDSRVS TO RECORD-DETAIL                           
                    WRITE EXTRACT-RECORD                                        
                    ADD 1 TO WS-VFNDSRVS-COUNT                                  
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           IF SQLCODE NOT = +100                                                
              MOVE 1960 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           EXEC SQL                                                             
              CLOSE VFNDSRVS_CRSR                                               
           END-EXEC                                                             
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 1970 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
                                                                                
       1975-FETCH-VFNDPYBL-RECORDS.                                             
                                                                                
             EXEC SQL                                                           
                OPEN VFNDPYBL_CRSR                                              
             END-EXEC                                                           
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 1975 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
                 EXEC SQL                                                       
                    FETCH VFNDPYBL_CRSR                                         
                      INTO                                                      
                   :DCLVFNDPYBL.CLIENT-NBR                                      
                  ,:DCLVFNDPYBL.ACAT-CONTROL-NBR                                
                  ,:DCLVFNDPYBL.ASSET-SEQ-NBR                                   
                  ,:DCLVFNDPYBL.PYBL-NBR                                        
                  ,:DCLVFNDPYBL.ACCT-NBR                                        
                  ,:DCLVFNDPYBL.ACCT-NBR-STTS-CD                                
                  ,:DCLVFNDPYBL.ZIP5-CD                                         
                  ,:DCLVFNDPYBL.ZIP5-STTS-CD                                    
                  ,:DCLVFNDPYBL.ZIP4-CD                                         
                  ,:DCLVFNDPYBL.ZIP4-STTS-CD                                    
                  ,:DCLVFNDPYBL.ADDRS-DVDND-IND                                 
                  ,:DCLVFNDPYBL.ADDRS-SYSWL-IND                                 
                  ,:DCLVFNDPYBL.ADDRS-ATMDF-IND                                 
                  ,:DCLVFNDPYBL.CRSS-FND-RNVST-IND                              
                  ,:DCLVFNDPYBL.ALTNT-PYBL-IND                                  
                  ,:DCLVFNDPYBL.ADDRS-OPTN-STTS-CD                              
                  ,:DCLVFNDPYBL.ACCT-PYBL-CD                                    
                  ,:DCLVFNDPYBL.ACCT-PYBL-STTS-CD                               
                  ,:DCLVFNDPYBL.ISIN-CNTRY-CD                                   
                  ,:DCLVFNDPYBL.ISIN-CNTRY-STTS-CD                              
                  ,:DCLVFNDPYBL.ISIN-SEC-ISSUE-CD                               
                  ,:DCLVFNDPYBL.ISIN-SEC-IS-STS-CD                              
                  ,:DCLVFNDPYBL.ISIN-SEC-CDG-CD                                 
                  ,:DCLVFNDPYBL.ISIN-SEC-CD-STS-CD                              
                  ,:DCLVFNDPYBL.PYBL-ALTNT-CD                                   
                  ,:DCLVFNDPYBL.PYBL-ALTNT-STTS-CD                              
                  ,:DCLVFNDPYBL.PYBL-ALTNT-RSN-TXT                              
                  ,:DCLVFNDPYBL.PYBL-ALT-RS-STS-CD                              
                  ,:DCLVFNDPYBL.CRT-TMSTP                                       
                  ,:DCLVFNDPYBL.UPDT-TMSTP                                      
                  ,:DCLVFNDPYBL.CICS-TERM-ID-CD                                 
                  ,:DCLVFNDPYBL.PRGM-NM                                         
                  ,:DCLVFNDPYBL.SECURITY-ADP-NBR                                
                  ,:DCLVFNDPYBL.NA-END-LINE-IND                                 
                  ,:DCLVFNDPYBL.NA-END-IND-STTS-CD                              
                 END-EXEC                                                       
                                                                                
              EVALUATE SQLCODE                                                  
                 WHEN +100                                                      
                   CONTINUE                                                     
                 WHEN +0                                                        
                    MOVE 'VFNDPYBL' TO RECORD-SEG-ID                            
                    MOVE DCLVFNDPYBL TO RECORD-DETAIL                           
                    WRITE EXTRACT-RECORD                                        
                    ADD 1 TO WS-VFNDPYBL-COUNT                                  
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           IF SQLCODE NOT = +100                                                
              MOVE 1977 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           EXEC SQL                                                             
              CLOSE VFNDPYBL_CRSR                                               
           END-EXEC                                                             
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 1978 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
       1980-FETCH-VFNDPYNA-RECORDS.                                             
                                                                                
             EXEC SQL                                                           
                OPEN VFNDPYNA_CRSR                                              
             END-EXEC                                                           
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 1980 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
                 EXEC SQL                                                       
                    FETCH VFNDPYNA_CRSR                                         
                      INTO                                                      
                   :DCLVFNDPYNA.CLIENT-NBR                                      
                  ,:DCLVFNDPYNA.ACAT-CONTROL-NBR                                
                  ,:DCLVFNDPYNA.ASSET-SEQ-NBR                                   
                  ,:DCLVFNDPYNA.PYBL-NBR                                        
                  ,:DCLVFNDPYNA.NA-LINE-NBR                                     
                  ,:DCLVFNDPYNA.PYBL-NA-LINE-TXT                                
                  ,:DCLVFNDPYNA.CRT-TMSTP                                       
                  ,:DCLVFNDPYNA.UPDT-TMSTP                                      
                  ,:DCLVFNDPYNA.PYBL-NA-LN-STTS-CD                              
                  ,:DCLVFNDPYNA.CICS-TERM-ID-CD                                 
                  ,:DCLVFNDPYNA.PRGM-NM                                         
                 END-EXEC                                                       
                                                                                
              EVALUATE SQLCODE                                                  
                 WHEN +100                                                      
                   CONTINUE                                                     
                 WHEN +0                                                        
                    MOVE 'VFNDPYNA' TO RECORD-SEG-ID                            
                    MOVE DCLVFNDPYNA TO RECORD-DETAIL                           
                    WRITE EXTRACT-RECORD                                        
                    ADD 1 TO WS-VFNDPYNA-COUNT                                  
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           IF SQLCODE NOT = +100                                                
              MOVE 1982 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           EXEC SQL                                                             
              CLOSE VFNDPYNA_CRSR                                               
           END-EXEC                                                             
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 1983 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
       1985-FETCH-VFNDNA-RECORDS.                                               
                                                                                
             EXEC SQL                                                           
                OPEN VFNDNA_CRSR                                                
             END-EXEC                                                           
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 1985 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
                 EXEC SQL                                                       
                    FETCH VFNDNA_CRSR                                           
                      INTO                                                      
                   :DCLVFNDNA.CLIENT-NBR                                        
                  ,:DCLVFNDNA.ACAT-CONTROL-NBR                                  
                  ,:DCLVFNDNA.ASSET-SEQ-NBR                                     
                  ,:DCLVFNDNA.NA-LINE-NBR                                       
                  ,:DCLVFNDNA.CUST-NA-LINE-TXT                                  
                  ,:DCLVFNDNA.CUST-NA-STTS-CD                                   
                  ,:DCLVFNDNA.CRT-TMSTP                                         
                  ,:DCLVFNDNA.UPDT-TMSTP                                        
                  ,:DCLVFNDNA.CICS-TERM-ID-CD                                   
                  ,:DCLVFNDNA.PRGM-NM                                           
                 END-EXEC                                                       
                                                                                
              EVALUATE SQLCODE                                                  
                 WHEN +100                                                      
                   CONTINUE                                                     
                 WHEN +0                                                        
                    MOVE 'VFNDNA' TO RECORD-SEG-ID                              
                    MOVE DCLVFNDNA TO RECORD-DETAIL                             
                    WRITE EXTRACT-RECORD                                        
                    ADD 1 TO WS-VFNDNA-COUNT                                    
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           IF SQLCODE NOT = +100                                                
              MOVE 1986 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           EXEC SQL                                                             
              CLOSE VFNDNA_CRSR                                                 
           END-EXEC                                                             
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 1988 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
           EJECT                                                                
       2000-EXTRACT-VTRNHSTY-RTN.                                               
           IF WS-VTRNHSTY-ALL                                                   
              MOVE LOW-VALUES  TO WS-VTRNHSTY-FR-CNTL-NBR                       
              MOVE HIGH-VALUES TO WS-VTRNHSTY-TO-CNTL-NBR                       
           ELSE                                                                 
              MOVE PARM-VTRNFR-FR-CNTL-NBR  TO WS-VTRNHSTY-FR-CNTL-NBR          
              MOVE PARM-VTRNFR-TO-CNTL-NBR  TO WS-VTRNHSTY-TO-CNTL-NBR          
           END-IF.                                                              
                                                                                
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
LRM009               ,:DCLVTRNHSTY.GEO-CD                                       
LRM010               ,:DCLVTRNHSTY.FOREIGN-FEE-IND                              
LRM010               ,:DCLVTRNHSTY.FOREIGN-FEE-AMT                              
LRM011               ,:DCLVTRNHSTY.PEND-DVDND-DB-AMT                            
LRM011               ,:DCLVTRNHSTY.NTWRK-LVL4-FND-IND                           
LRM015               ,:DCLVTRNHSTY.PAPER-FEE-AMT                                
              END-EXEC                                                          
                                                                                
              EVALUATE SQLCODE                                                  
                 WHEN +100                                                      
                    CONTINUE                                                    
                 WHEN +0                                                        
                    MOVE 'VTRNHSTY' TO RECORD-SEG-ID                            
                    MOVE DCLVTRNHSTY TO RECORD-DETAIL                           
                    WRITE EXTRACT-RECORD                                        
                    ADD 1 TO WS-VTRNHSTY-COUNT                                  
                    PERFORM 2100-FETCH-VASTHSTY-RECORDS                         
                    PERFORM 2200-FETCH-VMFHSTY-RECORDS                          
                    PERFORM 2300-FETCH-VOPTHSTY-RECORDS                         
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
LRM010            ,:DCLVASTHSTY.FOREIGN-FEE-IND                                 
LRM012            ,:DCLVASTHSTY.CRNCY-CD                                        
LRM013            ,:DCLVASTHSTY.MEMO-ORG-RVRSL-QTY                              
                 END-EXEC                                                       
                                                                                
              EVALUATE SQLCODE                                                  
                 WHEN +100                                                      
                   CONTINUE                                                     
                 WHEN +0                                                        
                    MOVE 'VASTHSTY' TO RECORD-SEG-ID                            
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
                                                                                
       3000-FETCH-VRSTSEC-RECORDS.                                              
                                                                                
             EXEC SQL                                                           
                OPEN VRSTSEC_CRSR                                               
             END-EXEC                                                           
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 3000 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
                 EXEC SQL                                                       
                    FETCH VRSTSEC_CRSR                                          
                      INTO                                                      
                   :DCLVRSTSEC.CLIENT-NBR                                       
                  ,:DCLVRSTSEC.ISIN-SEC-ISSUE-CD                                
                  ,:DCLVRSTSEC.TRNFR-MEMO-IND                                   
                  ,:DCLVRSTSEC.TRNFR-BRKR-TYPE-CD                               
                  ,:DCLVRSTSEC.RSTRD-MSG-TXT                                    
                  ,:DCLVRSTSEC.PRGM-NM                                          
                  ,:DCLVRSTSEC.CICS-TERM-ID-CD                                  
                  ,:DCLVRSTSEC.CRT-TMSTP                                        
                  ,:DCLVRSTSEC.UPDT-TMSTP                                       
                  ,:DCLVRSTSEC.SECURITY-ADP-NBR                                 
LRM007            ,:DCLVRSTSEC.EXPTN-DT                                         
LRM007            ,:DCLVRSTSEC.COMMENT-TXT                                      
LRM007            ,:DCLVRSTSEC.CICS-SGNON-ID                                    
LRM007            ,:DCLVRSTSEC.TPSCRT-USR-NM                                    
LRM007            ,:DCLVRSTSEC.TPSCRT-USR-ID                                    
LRM007            ,:DCLVRSTSEC.CICS-NET-NM                                      
                 END-EXEC                                                       
                                                                                
              EVALUATE SQLCODE                                                  
                 WHEN +100                                                      
                   CONTINUE                                                     
                 WHEN +0                                                        
                    MOVE 'VRSTSEC ' TO RECORD-SEG-ID                            
                    MOVE DCLVRSTSEC TO RECORD-DETAIL                            
                    WRITE EXTRACT-RECORD                                        
                    ADD 1 TO WS-VRSTSEC-COUNT                                   
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           IF SQLCODE NOT = +100                                                
              MOVE 3010 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           EXEC SQL                                                             
              CLOSE VRSTSEC_CRSR                                                
           END-EXEC                                                             
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 3020 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
       3100-FETCH-VRSTBRKR-RECORDS.                                             
                                                                                
             EXEC SQL                                                           
                OPEN VRSTBRKR_CRSR                                              
             END-EXEC                                                           
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 3100 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
                 EXEC SQL                                                       
                    FETCH VRSTBRKR_CRSR                                         
                      INTO                                                      
                   :DCLVRSTBRKR.CLIENT-NBR                                      
                  ,:DCLVRSTBRKR.ISIN-SEC-ISSUE-CD                               
                  ,:DCLVRSTBRKR.BRKR-CONTRA-NBR                                 
                  ,:DCLVRSTBRKR.CRT-TMSTP                                       
                  ,:DCLVRSTBRKR.UPDT-TMSTP                                      
                  ,:DCLVRSTBRKR.CICS-TERM-ID-CD                                 
                  ,:DCLVRSTBRKR.PRGM-NM                                         
                  ,:DCLVRSTBRKR.SECURITY-ADP-NBR                                
LRM007            ,:DCLVRSTBRKR.EXPTN-DT                                        
LRM007            ,:DCLVRSTBRKR.COMMENT-TXT                                     
LRM007            ,:DCLVRSTBRKR.CICS-SGNON-ID                                   
LRM007            ,:DCLVRSTBRKR.TPSCRT-USR-NM                                   
LRM007            ,:DCLVRSTBRKR.TPSCRT-USR-ID                                   
LRM007            ,:DCLVRSTBRKR.CICS-NET-NM                                     
                 END-EXEC                                                       
                                                                                
              EVALUATE SQLCODE                                                  
                 WHEN +100                                                      
                   CONTINUE                                                     
                 WHEN +0                                                        
                    MOVE 'VRSTBRKR ' TO RECORD-SEG-ID                           
                    MOVE DCLVRSTBRKR TO RECORD-DETAIL                           
                    WRITE EXTRACT-RECORD                                        
                    ADD 1 TO WS-VRSTBRKR-COUNT                                  
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           IF SQLCODE NOT = +100                                                
              MOVE 3110 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           EXEC SQL                                                             
              CLOSE VRSTBRKR_CRSR                                               
           END-EXEC                                                             
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 3120 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
       3200-FETCH-VRSDACC-RECORDS.                                              
                                                                                
             EXEC SQL                                                           
                OPEN VRSDACC_CRSR                                               
             END-EXEC                                                           
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 3200 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
                 EXEC SQL                                                       
                    FETCH VRSDACC_CRSR                                          
                      INTO                                                      
                   :DCLVRSDACC.CLIENT-NBR                                       
                  ,:DCLVRSDACC.ACCT-CD                                          
                  ,:DCLVRSDACC.BRANCH-CD                                        
                  ,:DCLVRSDACC.BRANCH-ORGNL-CD                                  
                  ,:DCLVRSDACC.ACCT-ORGNL-CD                                    
                  ,:DCLVRSDACC.RR-CD                                            
                  ,:DCLVRSDACC.CRT-TMSTP                                        
                  ,:DCLVRSDACC.UPDT-TMSTP                                       
                  ,:DCLVRSDACC.CICS-TERM-ID-CD                                  
                  ,:DCLVRSDACC.PRGM-NM                                          
LRM005            ,:DCLVRSDACC.EXPTN-DT                                         
LRM005            ,:DCLVRSDACC.COMMENT-TXT                                      
LRM005            ,:DCLVRSDACC.CICS-SGNON-ID                                    
LRM005            ,:DCLVRSDACC.TPSCRT-USR-NM                                    
LRM005            ,:DCLVRSDACC.TPSCRT-USR-ID                                    
LRM005            ,:DCLVRSDACC.CICS-NET-NM                                      
                 END-EXEC                                                       
                                                                                
              EVALUATE SQLCODE                                                  
                 WHEN +100                                                      
                   CONTINUE                                                     
                 WHEN +0                                                        
                    MOVE 'VRSDACC ' TO RECORD-SEG-ID                            
                    MOVE DCLVRSDACC TO RECORD-DETAIL                            
                    WRITE EXTRACT-RECORD                                        
                    ADD 1 TO WS-VRSDACC-COUNT                                   
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           IF SQLCODE NOT = +100                                                
              MOVE 3210 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           EXEC SQL                                                             
              CLOSE VRSDACC_CRSR                                                
           END-EXEC                                                             
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 3220 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
       3300-FETCH-VRSDSEC-RECORDS.                                              
                                                                                
             EXEC SQL                                                           
                OPEN VRSDSEC_CRSR                                               
             END-EXEC                                                           
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 3300 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
                 EXEC SQL                                                       
                    FETCH VRSDSEC_CRSR                                          
                      INTO                                                      
                   :DCLVRSDSEC.CLIENT-NBR                                       
                  ,:DCLVRSDSEC.ACCT-CD                                          
                  ,:DCLVRSDSEC.BRANCH-CD                                        
                  ,:DCLVRSDSEC.ISIN-SEC-ISSUE-CD                                
                  ,:DCLVRSDSEC.SECURITY-ADP-NBR                                 
                  ,:DCLVRSDSEC.PRGM-NM                                          
                  ,:DCLVRSDSEC.CICS-TERM-ID-CD                                  
                  ,:DCLVRSDSEC.CRT-TMSTP                                        
                  ,:DCLVRSDSEC.UPDT-TMSTP                                       
LRM005            ,:DCLVRSDSEC.EXPTN-DT                                         
LRM005            ,:DCLVRSDSEC.COMMENT-TXT                                      
LRM005            ,:DCLVRSDSEC.CICS-SGNON-ID                                    
LRM005            ,:DCLVRSDSEC.TPSCRT-USR-NM                                    
LRM005            ,:DCLVRSDSEC.TPSCRT-USR-ID                                    
LRM005            ,:DCLVRSDSEC.CICS-NET-NM                                      
                 END-EXEC                                                       
                                                                                
              EVALUATE SQLCODE                                                  
                 WHEN +100                                                      
                   CONTINUE                                                     
                 WHEN +0                                                        
                    MOVE 'VRSDSEC ' TO RECORD-SEG-ID                            
                    MOVE DCLVRSDSEC TO RECORD-DETAIL                            
                    WRITE EXTRACT-RECORD                                        
                    ADD 1 TO WS-VRSDSEC-COUNT                                   
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           IF SQLCODE NOT = +100                                                
              MOVE 3310 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           EXEC SQL                                                             
              CLOSE VRSDSEC_CRSR                                                
           END-EXEC                                                             
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 3320 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
           EJECT                                                                
       4000-FETCH-VPRTCPPF-RECORDS.                                             
                                                                                
             EXEC SQL                                                           
                OPEN VPRTCPPF_CRSR                                              
             END-EXEC                                                           
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 4000 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
                 EXEC SQL                                                       
                    FETCH VPRTCPPF_CRSR                                         
                      INTO                                                      
                    :DCLVPRTCPPF.PRTCP-NBR                                      
                   ,:DCLVPRTCPPF.BRKR-TIF-IND                                   
                   ,:DCLVPRTCPPF.PRTCP-TYPE-CD                                  
                   ,:DCLVPRTCPPF.PRTCP-NM                                       
                   ,:DCLVPRTCPPF.FUND-SRV-ELGBL-IND                             
                   ,:DCLVPRTCPPF.CRT-TMSTP                                      
                   ,:DCLVPRTCPPF.UPDT-TMSTP                                     
                   ,:DCLVPRTCPPF.CICS-TERM-ID-CD                                
                   ,:DCLVPRTCPPF.PRGM-NM                                        
                 END-EXEC                                                       
                                                                                
              EVALUATE SQLCODE                                                  
                 WHEN +100                                                      
                   CONTINUE                                                     
                 WHEN +0                                                        
                    MOVE 'VPRTCPPF' TO RECORD-SEG-ID                            
                    MOVE DCLVPRTCPPF TO RECORD-DETAIL                           
                    WRITE EXTRACT-RECORD                                        
                    ADD 1 TO WS-VPRTCPPF-COUNT                                  
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           IF SQLCODE NOT = +100                                                
              MOVE 4010 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           EXEC SQL                                                             
              CLOSE VPRTCPPF_CRSR                                               
           END-EXEC                                                             
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 4020 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
           EJECT                                                                
       4500-FETCH-VALERT-RECORDS.                                               
                                                                                
             EXEC SQL                                                           
                OPEN VALERT_CRSR                                                
             END-EXEC                                                           
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 4500 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
                 EXEC SQL                                                       
                    FETCH VALERT_CRSR                                           
                      INTO                                                      
                    :DCLVALERT.CLIENT-NBR                                       
                   ,:DCLVALERT.BRANCH-CD                                        
                   ,:DCLVALERT.ACCT-CD                                          
                   ,:DCLVALERT.ACCT-MSG-TXT                                     
                   ,:DCLVALERT.RR-CD                                            
                   ,:DCLVALERT.CRT-TMSTP                                        
                   ,:DCLVALERT.UPDT-TMSTP                                       
                   ,:DCLVALERT.CICS-TERM-ID-CD                                  
                   ,:DCLVALERT.PRGM-NM                                          
                 END-EXEC                                                       
                                                                                
              EVALUATE SQLCODE                                                  
                 WHEN +100                                                      
                   CONTINUE                                                     
                 WHEN +0                                                        
                    MOVE 'VALERT' TO RECORD-SEG-ID                              
                    MOVE DCLVALERT TO RECORD-DETAIL                             
                    WRITE EXTRACT-RECORD                                        
                    ADD 1 TO WS-VALERT-COUNT                                    
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           IF SQLCODE NOT = +100                                                
              MOVE 4510 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           EXEC SQL                                                             
              CLOSE VALERT_CRSR                                                 
           END-EXEC                                                             
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 4520 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
           EJECT                                                                
       4600-FETCH-VRSDBLK-RECORDS.                                              
                                                                                
             EXEC SQL                                                           
                OPEN VRSDBLK_CRSR                                               
             END-EXEC                                                           
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 4600 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
                 EXEC SQL                                                       
                    FETCH VRSDBLK_CRSR                                          
                      INTO                                                      
                    :DCLVRSDBLK.CLIENT-NBR                                      
                   ,:DCLVRSDBLK.BRANCH-CD                                       
                   ,:DCLVRSDBLK.ACCT-CD                                         
                   ,:DCLVRSDBLK.BLOCK-CD                                        
                   ,:DCLVRSDBLK.CMNT-TXT                                        
                   ,:DCLVRSDBLK.PRGM-NM                                         
                   ,:DCLVRSDBLK.RCV-NBR                                         
                   ,:DCLVRSDBLK.DLVR-NBR                                        
                   ,:DCLVRSDBLK.CICS-TERM-ID-CD                                 
                   ,:DCLVRSDBLK.CRT-TMSTP                                       
                   ,:DCLVRSDBLK.UPDT-TMSTP                                      
                   ,:DCLVRSDBLK.ISIN-SEC-ISSUE-CD                               
                   ,:DCLVRSDBLK.SECURITY-ADP-NBR                                
                   ,:DCLVRSDBLK.EXPIRE-DT                                       
                   ,:DCLVRSDBLK.ACTION-CD                                       
                   ,:DCLVRSDBLK.CICS-SNON-ID                                    
                 END-EXEC                                                       
                                                                                
              EVALUATE SQLCODE                                                  
                 WHEN +100                                                      
                   CONTINUE                                                     
                 WHEN +0                                                        
                    MOVE 'VRSDBLK' TO RECORD-SEG-ID                             
                    MOVE DCLVRSDBLK TO RECORD-DETAIL                            
                    WRITE EXTRACT-RECORD                                        
                    ADD 1 TO WS-VRSDBLK-COUNT                                   
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           IF SQLCODE NOT = +100                                                
              MOVE 4610 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           EXEC SQL                                                             
              CLOSE VRSDBLK_CRSR                                                
           END-EXEC                                                             
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 4620 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
           EJECT                                                                
       4700-FETCH-VACTRBHY-RECORDS.                                             
                                                                                
             EXEC SQL                                                           
                OPEN VACTRBHY_CRSR                                              
             END-EXEC                                                           
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 4700 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
                 EXEC SQL                                                       
                    FETCH VACTRBHY_CRSR                                         
                      INTO                                                      
                    :DCLVACTRBHY.CLIENT-NBR                                     
                   ,:DCLVACTRBHY.BRANCH-CD                                      
                   ,:DCLVACTRBHY.ACCT-CD                                        
                   ,:DCLVACTRBHY.BLOCK-CD                                       
                   ,:DCLVACTRBHY.CMNT-TXT                                       
                   ,:DCLVACTRBHY.PRGM-NM                                        
                   ,:DCLVACTRBHY.RCV-NBR                                        
                   ,:DCLVACTRBHY.DLVR-NBR                                       
                   ,:DCLVACTRBHY.CICS-TERM-ID-CD                                
                   ,:DCLVACTRBHY.CRT-TMSTP                                      
                   ,:DCLVACTRBHY.UPDT-TMSTP                                     
                   ,:DCLVACTRBHY.ISIN-SEC-ISSUE-CD                              
                   ,:DCLVACTRBHY.HSTRY-SEQ-NBR                                  
                   ,:DCLVACTRBHY.SECURITY-ADP-NBR                               
                   ,:DCLVACTRBHY.EXPIRE-DT                                      
                   ,:DCLVACTRBHY.ACTION-CD                                      
                   ,:DCLVACTRBHY.CICS-SNON-ID                                   
                 END-EXEC                                                       
                                                                                
              EVALUATE SQLCODE                                                  
                 WHEN +100                                                      
                   CONTINUE                                                     
                 WHEN +0                                                        
                    MOVE 'VACTRBHY'  TO RECORD-SEG-ID                           
                    MOVE DCLVACTRBHY TO RECORD-DETAIL                           
                    WRITE EXTRACT-RECORD                                        
                    ADD 1 TO WS-VACTRBHY-COUNT                                  
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           IF SQLCODE NOT = +100                                                
              MOVE 4710 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF                                                               
                                                                                
           EXEC SQL                                                             
              CLOSE VACTRBHY_CRSR                                               
           END-EXEC                                                             
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 4720 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF.                                                              
           EJECT                                                                
DJ0001 4800-FETCH-ACTRBSC-RECORDS.                                              
DJ0001                                                                          
DJ0001       EXEC SQL                                                           
DJ0001          OPEN ACTRBSC_CRSR                                               
DJ0001       END-EXEC                                                           
DJ0001                                                                          
DJ0001     IF SQLCODE NOT = +0                                                  
DJ0001        MOVE 4800 TO ABORT-CODE                                           
DJ0001        PERFORM SQL-ERROR-ROUTINE                                         
DJ0001     END-IF                                                               
DJ0001                                                                          
DJ0001     PERFORM UNTIL SQLCODE NOT = +0                                       
DJ0001           EXEC SQL                                                       
DJ0001              FETCH ACTRBSC_CRSR                                          
DJ0001                INTO                                                      
DJ0001              :DCLACTRBSC.CLIENT-NBR                                      
DJ0001             ,:DCLACTRBSC.BRANCH-CD                                       
DJ0001             ,:DCLACTRBSC.ACCT-CD                                         
DJ0001             ,:DCLACTRBSC.BLOCK-CD                                        
DJ0001             ,:DCLACTRBSC.RCV-NBR                                         
DJ0001             ,:DCLACTRBSC.ISIN-SEC-ISSUE-CD                               
DJ0001             ,:DCLACTRBSC.HSTRY-SEQ-NBR                                   
DJ0001             ,:DCLACTRBSC.SECURITY-ADP-NBR                                
DJ0001             ,:DCLACTRBSC.CRT-TMSTP                                       
DJ0001             ,:DCLACTRBSC.UPDT-TMSTP                                      
DJ0001             ,:DCLACTRBSC.CICS-TERM-ID-CD                                 
DJ0001             ,:DCLACTRBSC.PRGM-NM                                         
DJ0001             ,:DCLACTRBSC.TPSCRT-USR-NM                                   
DJ0001             ,:DCLACTRBSC.TPSCRT-USR-ID                                   
DJ0001             ,:DCLACTRBSC.CICS-NET-NM                                     
DJ0001             ,:DCLACTRBSC.CICS-SNON-ID                                    
DJ0001             ,:DCLACTRBSC.ACTION-CD                                       
DJ0001           END-EXEC                                                       
DJ0001                                                                          
DJ0001        EVALUATE SQLCODE                                                  
DJ0001           WHEN +100                                                      
DJ0001             CONTINUE                                                     
DJ0001           WHEN +0                                                        
DJ0001              MOVE 'ACTRBSC'  TO RECORD-SEG-ID                            
DJ0001              MOVE DCLACTRBSC TO RECORD-DETAIL                            
DJ0001              WRITE EXTRACT-RECORD                                        
DJ0001              ADD 1 TO WS-ACTRBSC-COUNT                                   
DJ0001        END-EVALUATE                                                      
DJ0001     END-PERFORM.                                                         
DJ0001                                                                          
DJ0001     IF SQLCODE NOT = +100                                                
DJ0001        MOVE 4810 TO ABORT-CODE                                           
DJ0001        PERFORM SQL-ERROR-ROUTINE                                         
DJ0001     END-IF                                                               
DJ0001                                                                          
DJ0001     EXEC SQL                                                             
DJ0001        CLOSE ACTRBSC_CRSR                                                
DJ0001     END-EXEC                                                             
DJ0001                                                                          
DJ0001     IF SQLCODE NOT = +0                                                  
DJ0001        MOVE 4820 TO ABORT-CODE                                           
DJ0001        PERFORM SQL-ERROR-ROUTINE                                         
DJ0001     END-IF.                                                              
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
CHRIS1     DISPLAY 'CATEXTR DB2 PROBLEM'.                                       
CHRIS1     DISPLAY 'SQL CODE = ' SQLCODE.                                       
CHRIS1     DISPLAY 'SQLQA = ' SQLCA.                                            
CHRIS1     DISPLAY 'PROGRAM ABORTED'.                                           
                                                                                
           EXEC SQL  ROLLBACK  END-EXEC.                                        
                                                                                
           PERFORM 9999-ABEND.                                                  
       9999-ABEND.                                                              
           CALL  ABEND  USING ABORT-CODE.                                       
