000001* PDX    - CAT811   C0249658 08/20/07 09:05:20 TBLAMUR            00001000
LRM006* SSR DO NOT SUBMIT ASSETS ON DAY = 1, THIS WILL BE DONE IN               
LRM006* CAT521 AFTER CYCLE 1 RUNS.                                              
000001* PDX    - CAT811   C0219023 06/01/05 14:59:47 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT811.                                                     
      *****************************************************************         
      * THIS PROGRAM CONTAINS DB2.                                    *         
      *****************************************************************         
      * CAT811 MARK PTR ASSETS TO SUBMIT BASED ON B1 SUBMIT DAYS.     *         
      * AUTO REJECT PTRS ON 3RD DAY WHEN NO ASSETS EXIST ON ACTIAST   *         
      *  FOR AUTO FULFILL CLIENTS ONLY, B1 434714 > 0.                *         
      *  WHEN REJECT ALREADY EXISTS ON ACTITRF, UPDATE IT TO SUBMIT.  *         
      *                                                               *         
      * SELECT PTR TRANSFER DELIVERY REQUESTS ON ACTIVE DB2 TABLE,    *         
      * WHERE STATUS = 500(MEMO REQUEST)                              *         
      *                                                               *         
      * IF DAYS-IN-STATUS = B1#434714 DAYS, MOVE ' ' TO NSCC-PEND-CD. *         
      *                                                               *         
      * INPUT  -                                                      *         
      *        - VTRNFR - ACATS ACTIVE TRANFER DB2 TABLE              *         
      *        - B1                                                   *         
      * OUTPUT -                                                      *         
      *        - DB2 DATABASE                                         *         
      *                                                               *         
      *****************************************************************         
      * 03/30/05 LRM   NEW PROGRAM / COPY FROM CAT810.                *         
      *                                                               *         
      *****************************************************************         
      /                                                                         
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
                                                                                
       WORKING-STORAGE SECTION.                                                 
           COPY PDXIDCOB.                                                       
                                                                                
       01  W-FIELDS.                                                            
           05  W-PGM-NAME                PIC  X(008) VALUE 'CAT811'.            
           05  W-ROUTINE-1               PIC  X(032) VALUE ' '.                 
           05  W-FIRST-TIME-SW           PIC  X(001) VALUE '0'.                 
               88 NOT-FIRST-TIME                     VALUE '1'.                 
           05  NTW-NSCCSRC-ACCT-FLAG        PIC  X(01)  VALUE SPACES.           
               88  NTW-NSCCSRC-ACCT                     VALUE 'Y'.              
               88  NTW-NOT-NSCCSRC-ACCT                 VALUE 'N'.              
           05  END-OF-INPUT-SW           PIC  X(001) VALUE '0'.                 
               88 END-OF-INPUT                       VALUE '1'.                 
           05  INFILE-DATE-SW            PIC  X(001) VALUE ' '.                 
               88 INFILE-DATE-FOUND                  VALUE 'Y'.                 
           05  W-SYS-DATE                PIC  9(006) VALUE 0.                   
           05  FILLER  REDEFINES                                                
               W-SYS-DATE.                                                      
               10  W-UPD-DATE            PIC  X(006).                           
           05  W-SYS-TIME                PIC  9(008) VALUE 0.                   
           05  FILLER  REDEFINES                                                
               W-SYS-TIME.                                                      
               10  W-UPD-TIME            PIC  X(006).                           
               10  W-UPD-TIME-MS         PIC  X(002).                           
           05  LD-PROC-DATE.                                                    
               10 LD-PROC-DATE-MM        PIC  X(002).                           
               10 LD-PROC-DATE-DD        PIC  X(002).                           
               10 LD-PROC-DATE-YY        PIC  X(002).                           
           05  W-PROC-DT.                                                       
               10 W-PROC-DT-YEAR         PIC  X(004).                           
               10 W-PROC-DT-D1           PIC  X(001) VALUE '-'.                 
               10 W-PROC-DT-MM           PIC  X(002).                           
               10 W-PROC-DT-D2           PIC  X(001) VALUE '-'.                 
               10 W-PROC-DT-DD           PIC  X(002).                           
           05  W-EXP-OPT-ACT             PIC  X(001) VALUE '0'.                 
           05  W-NUM-TO-EXP              PIC  9(003) VALUE 000.                 
           05  W-TODAY-DATE              PIC  9(008) VALUE 0.                   
           05  W-OPT-EXP-DATE            PIC  9(008) VALUE 0.                   
           05  W-HDR-TRL-SW              PIC  X(001) VALUE 'T'.                 
               88 HDR-FOUND                          VALUE 'H'.                 
               88 TRL-FOUND                          VALUE 'T'.                 
           05  FILLER                    PIC  X(008) VALUE 'RECLENIN'.          
           05  W-REC-LEN-IN              PIC  9(005) VALUE 0.                   
           05  FILLER                    PIC  X(008) VALUE 'RECLENOT'.          
           05  W-REC-LEN-OUT             PIC  9(005) VALUE 0.                   
           05  FILLER                    PIC  X(008) VALUE 'INPUTCNT'.          
           05  W-INFILE-CNT              PIC  9(009) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'UNMATCHC'.          
           05  W-UNMATCH-CNT             PIC  9(009) COMP-3 VALUE 0.            
           05  W-ATF-CNT                 PIC  9(009) COMP-3 VALUE 0.            
           05  W-SQL-CNT                 PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIAST-ADD-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIAST-NOT-ADD-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIAST-UPD-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIAST-NOT-UPD-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIAST-DEL-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIAST-NOT-DEL-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-VTRNFR-UPD-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-VTRNFR-NOT-UPD-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTITRF-DEL-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTITRF-NOT-DEL-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTITRF-ADD-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTITRF-NOT-ADD-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTITRF-UPD-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTITRF-NOT-UPD-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-REJECT-SWITCHES.                                               
               07  W-REJ-MARGIN-DEBIT    PIC  X(001) VALUE ' '.                 
               07  W-REJ-ASSET-VALUE     PIC  X(001) VALUE ' '.                 
               07  W-REJ-TOTL-ACT-VAL    PIC  X(001) VALUE ' '.                 
               07  W-REJ-NTS             PIC  X(001) VALUE ' '.                 
               07  W-REJ-FLAT            PIC  X(001) VALUE ' '.                 
               07  W-REJ-LP              PIC  X(001) VALUE ' '.                 
               07  W-REJ-PRIV            PIC  X(001) VALUE ' '.                 
               07  W-EXP-OPT-POSN        PIC  X(001) VALUE ' '.                 
           05  W-REJECT-AUTO-SW          PIC  X(001) VALUE ' '.                 
           05  W-FLAT-CNT                PIC  9(009) COMP-3 VALUE 0.            
           05  W-TRANSFER-FND-SW         PIC  X(001) VALUE ' '.                 
               88 W-TRANSFER-FOUND                   VALUE 'Y'.                 
           05  W-ACTITRF-FND-SW          PIC  X(001) VALUE ' '.                 
               88 W-ACTITRF-FOUND                    VALUE 'Y'.                 
           05  W-SUB1                    PIC  9(03) COMP-3 VALUE 0.             
           05  W-LOAD-ONLY-CNT           PIC  9(009) COMP-3 VALUE 0.            
           05  W-AUTO-SUBMIT-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-LOAD-AND-SUBMIT-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-REMOVE-FRACTION-CNT     PIC  9(009) COMP-3 VALUE 0.            
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'WORKFLDS'.           
       01  W-WORK-FIELDS.                                                       
           05  W-DATE.                                                          
               07  W-DATE-YEAR.                                                 
                   09  W-DATE-CC         PIC X(2) VALUE ' '.                    
                   09  W-DATE-YY         PIC X(2) VALUE ' '.                    
               07  FILLER                PIC X(1) VALUE '-'.                    
               07  W-DATE-MM             PIC X(2) VALUE ' '.                    
               07  FILLER                PIC X(1) VALUE '-'.                    
               07  W-DATE-DD             PIC X(2) VALUE ' '.                    
           05  W-ASSET-SEQ-NBR           PIC S9(004) COMP.                      
           05  W-AT-ASSET-SEQ-NBR        PIC S9(004) COMP.                      
           05  W-COMMA-PTR               PIC  9(002) VALUE 0.                   
           05  W-QTY-PTR                 PIC  9(002) VALUE 0.                   
           05  W-INT-PTR                 PIC  9(002) VALUE 0.                   
           05  W-DEC-PTR                 PIC  9(002) VALUE 0.                   
           05  W-COMMA-FND-SW            PIC  X(001) VALUE ' '.                 
           05  W-BH-ACAT-SUBMIT-ASSETS   PIC X(01).                             
           05  W-BH-ACAT-SUBMIT-ASSETS-N REDEFINES                              
               W-BH-ACAT-SUBMIT-ASSETS   PIC 9(01).                             
           05  W-BH-DAYS-STTS-QTY        PIC S9(4) USAGE COMP.                  
           05  W-BH-NSCC-PEND-CD         PIC X(01).                             
                                                                                
      ** SAVE IMPORTANT FIELDS HERE SO THE LOGIC CAN BE GENERIC.                
       01  W-FETCH-AREA.                                                        
           05  WF-CLIENT-NBR          PIC X(4).                                 
           05  WF-ACAT-CONTROL-NBR    PIC X(14).                                
           05  WF-SBMTG-PRTCP-NBR     PIC X(4).                                 
           05  WF-DLVR-NBR            PIC X(4).                                 
           05  WF-ACCT-DLVR-NBR       PIC X(20).                                
           05  WF-RCV-NBR             PIC X(4).                                 
           05  WF-ACCT-RCV-NBR        PIC X(20).                                
           05  WF-TRNFR-TYPE-CD       PIC X(3).                                 
           05  WF-TRANS-TYPE-CD       PIC X(1).                                 
           05  WF-PRCS-DT             PIC X(10).                                
           05  WF-STTS-CD             PIC X(3).                                 
           05  WF-NSCC-PEND-CD        PIC X(1).                                 
           05  WF-TRANS-RFRN-ID-CD    PIC X(20).                                
           05  WF-DSTBN-SIDE-CD       PIC X(1).                                 
           05  WF-ACCT-EQUITY-AMT     USAGE COMP-2.                             
                                                                                
       01  WF-AREA.                                                             
           05  W-CURRENT-CLIENT          PIC X(004).                            
           05  W-CURRENT-CLIENT-N REDEFINES                                     
               W-CURRENT-CLIENT          PIC 9(004).                            
           05  W-CURRENT-BROKER          PIC X(004).                            
           05  W-CURRENT-STREAM          PIC X(001).                            
           05  WF-ISIN-CNTRY-CD        PIC X(2).                                
           05  WF-ISIN-SEC-ISSUE-CD    PIC X(9).                                
           05  WF-ISIN-SEC-CDG-CD      PIC X(1).                                
           05  WF-STTLM-LCTN-CD        PIC X(2).                                
           05  WF-CSH-MGN-SHRT-CD      PIC X(1).                                
                                                                                
       01  W-ACTITRF-SELECT-FIELDS.                                             
           05 W-ACTITRF-ACAT-CONTROL-NO     PIC  X(014).                        
           05 W-ACTITRF-NSCC-PEND-CD        PIC  X(001).                        
           05 W-ACTITRF-PRCS-DT             PIC  X(010).                        
           05 W-ACTITRF-PRGM-NM             PIC  X(008).                        
           05 W-ACTITRF-UPDT-TMSTP          PIC  X(026).                        
           05 W-ACTITRF-TRNFR-TYPE-RJCT-CD PIC   X(001).                        
                                                                                
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'B1-TABLE'.           
       01  B1-TABLE-AREA.                                                       
           03  B1-TABLE OCCURS 500 TIMES.                                       
               05  B1-ADP-CL-NO             PIC 9(04).                          
               05  B1-CLI-NAME              PIC X(30).                          
               05  B1-BKR-CLR-NO            PIC X(04).                          
               05  B1-STREAM                PIC X(01).                          
               05  B1-STATUS                PIC X(01).                          
               05  B1-ACAT-STATUS           PIC X(01).                          
       01  B1-WORK-FIELEDS.                                                     
           03  B1-TBL-CNT                   PIC 9(03) VALUE 0.                  
           03  B1-SUB                       PIC 9(03) VALUE 0.                  
           03  B1-STREAM-CNT                PIC 9(03) VALUE 0.                  
                                                                                
      /                                                                         
      ******************************************************************        
      * B1 HEADER                                                      *        
      ******************************************************************        
       01  FILLER                        PIC X(08) VALUE 'BHINFO  '.            
           COPY BHINFO.                                                         
      /                                                                         
      ******************************************************************        
      * B1 ACAT SECTION                                                *        
      ******************************************************************        
       01  FILLER                        PIC X(08) VALUE 'BHACAT  '.            
           COPY BHACAT.                                                         
      /                                                                         
      ******************************************************************        
      * BPDATE COMMAREA                                                *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.           
                                                                                
           COPY BPDATESC.                                                       
      /                                                                         
      ***--->COBOL LE                                                           
       01  W-ABEND-AREA.                                                        
           03  ABEND-CODE                PIC S9(04) COMP SYNC.                  
                                                                                
           COPY STUBCPY.                                                        
           03  CKDIGIT                   PIC X(008) VALUE 'CKDIGIT'.            
           03  DSNTIAR                   PIC X(008) VALUE 'DSNTIAR'.            
LRM002     03  BNWNTWIO                  PIC X(008) VALUE 'BNWNTWIO'.           
      ***<---COBOL LE                                                           
      /                                                                         
      ******************************************************************        
      * ASSET    INIT   TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'ACTIAST'.            
           EXEC SQL INCLUDE ACTIAST      END-EXEC.                              
                                                                                
      ******************************************************************        
      * TRANSFER ACTIVE TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'VTRNFR'.             
           EXEC SQL INCLUDE VTRNFR       END-EXEC.                              
                                                                                
      ******************************************************************        
      * TRANSFER INIT   TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'ACTITRF'.            
           EXEC SQL INCLUDE ACTITRF      END-EXEC.                              
                                                                                
      ******************************************************************        
      * DB2 COMMAREA                                                   *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'SQLCA   '.           
           EXEC SQL INCLUDE SQLCA        END-EXEC.                              
      ******************************************************************        
      * DB2 ERROR MESSAGE AREA                                         *        
      ******************************************************************        
       01  W-DB2-MESSAGE-AREA.                                                  
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.            
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES             
                   INDEXED BY W-DB2-IDX.                                        
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.             
                                                                                
       01  W-DB2-WORKAREA.                                                      
           05  ROLLBACK-SQLCA            PIC  X(122).                           
           05  ROLLBACK-RETURN           PIC S9(009) COMP.                      
               88  ROLLBACK-OK                VALUE +0.                         
               88  ROLLBACK-AB                VALUE -999 THRU -1                
                                                    +1   THRU +999.             
           05  COMMIT-SQLCA              PIC  X(122).                           
           05  COMMIT-RETURN             PIC S9(009) COMP.                      
               88  COMMIT-OK                  VALUE +0.                         
               88  COMMIT-AB                  VALUE -999 THRU -1                
                                                    +1   THRU +999.             
           05  W-COMMIT-CNT              PIC  9(009) VALUE 0.                   
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(011) VALUE 0.                   
           05  W-DB2-TABLE-NAME          PIC  X(008).                           
           05  W-DB2-ACTION              PIC  X(008).                           
           05  W-DB2-SQLCODE             PIC ---9.                              
           05  W-TFR-SQLCODE             PIC S9(9) COMP-4.                      
           05  W-SQLERRD-3                   PIC  S9(9).                        
           05  W-SQL-UPDATE-COUNT            PIC  999999999.                    
           05  W-AST-SUBMIT-COUNT            PIC  9(009) VALUE 0.               
                                                                                
       01  FILLER                        PIC  X(008) VALUE 'TIMESTMP'.          
       01  W-CURRENT-TIMESTAMP           PIC  X(026).                           
      /                                                                         
      ******************************************************************        
      * DECLARE CURSOR FOR ACTIVE TRANSFER TABLE                       *        
      * TO GET ALL PTR DELIVER TRANSFERS IN MEMO 500 STATUS            *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'CURSOR'.             
           EXEC SQL                                                             
                DECLARE VTRNFR_CURSOR CURSOR WITH HOLD FOR                      
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
                FROM    VTRNFR                                                  
                                                                                
                WHERE   CLIENT_NBR    = :W-CURRENT-CLIENT    AND                
                        DLVR_NBR      = :W-CURRENT-BROKER    AND                
                        TRNFR_TYPE_CD = 'PTR'                AND                
                        STTS_CD = '500'                                         
                                                                                
                FOR UPDATE OF                                                   
                        CICS_TERM_ID_CD                                         
                       ,UPDT_TMSTP                                              
                       ,PRGM_NM                                                 
                       ,TRNFR_TYPE_RJC2_CD                                      
                                                                                
           END-EXEC.                                                            
                                                                                
       01  FILLER                        PIC  X(008) VALUE 'END-O-WS'.          
      /                                                                         
      *****************************************************************         
      *    LINKAGE SECTION                                            *         
      *****************************************************************         
       LINKAGE SECTION.                                                         
       01  L-JCL-PARMS.                                                         
           05  PARMLENGTH                PIC S9(004) COMP SYNC.                 
           05  L-STREAM                  PIC  X(001).                           
               88  L-ALL-STREAM                      VALUE 'Z'.                 
           05  L-BYP-DATECHK-SW          PIC  X(001).                           
               88  L-BYP-DATECHK                     VALUE '1'.                 
           05  L-BYP-FILECHK-SW          PIC  X(001).                           
               88  L-BYP-FILECHK                     VALUE '1'.                 
           05  L-RERUN-SW                PIC  X(001).                           
               88  L-RERUN                           VALUE '1'.                 
           05  L-TEST-SW                 PIC  X(001).                           
               88  L-TEST                            VALUE '1'.                 
                                                                                
       PROCEDURE DIVISION USING L-JCL-PARMS.                                    
      *                         ===========                                     
       0000-MAIN SECTION.                                                       
           DISPLAY 'CAT811 SUBMIT PTR ASSETS OR REJECT ON LAST DAY'.            
           DISPLAY '         UPDATE INIT ASSET, OPTION, MF TABLES'.             
           DISPLAY '         UPDATE TRANSFER ROW FOR EXCEPTIONS'.               
           DISPLAY ' '.                                                         
           COPY MSGCOBO.                                                        
           DISPLAY ' '.                                                         
                                                                                
           PERFORM 1000-INIT           THRU 1000-EXIT.                          
                                                                                
           PERFORM 2000-PROCESS-INPUT THRU 2000-EXIT                            
                                                                                
           PERFORM 9000-CLOSE-ROUTINE  THRU 9000-EXIT.                          
                                                                                
           GOBACK.                                                              
      /                                                                         
       1000-INIT SECTION.                                                       
           MOVE '1000-INIT                     ' TO W-ROUTINE-1.                
                                                                                
           EXEC SQL                                                             
               SET :W-CURRENT-TIMESTAMP = CURRENT TIMESTAMP                     
           END-EXEC                                                             
                                                                                
           IF  SQLCODE = +0                                                     
               DISPLAY ' '                                                      
               DISPLAY 'CAT811: W-CURRENT-TIMESTAMP = '                         
                                                    W-CURRENT-TIMESTAMP         
               DISPLAY ' '                                                      
           ELSE                                                                 
               DISPLAY 'CAT811: W-CURRENT-TIMESTAMP NOT SET'                    
               MOVE SQLCODE      TO W-DB2-SQLCODE                               
               DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                               
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                           
           END-IF.                                                              
                                                                                
           ACCEPT W-SYS-DATE              FROM DATE.                            
           ACCEPT W-SYS-TIME              FROM TIME.                            
           DISPLAY 'CAT811: SYS-DATE ' W-SYS-DATE                               
                          ' SYS-TIME ' W-SYS-TIME.                              
                                                                                
           DISPLAY 'CAT811: L-STREAM         = '                                
                            L-STREAM                                            
           DISPLAY 'CAT811: L-BYP-DATECHK-SW = '                                
                            L-BYP-DATECHK-SW                                    
           ' (1=BYPASS DATE CHECK)'                                             
           DISPLAY 'CAT811: L-BYP-FILECHK-SW = '                                
                            L-BYP-FILECHK-SW                                    
           ' (1=BYPASS FILE CHECK. BYPASS EMPTY FILE,DB2 ABENDS.)'              
           DISPLAY 'CAT811: L-RERUN-SW       = '                                
                            L-RERUN-SW                                          
           ' (1=THIS IS A RERUN. ALLOW DUPES AND NOTFNDS.)'                     
           DISPLAY 'CAT811: L-TEST-SW        = '                                
                            L-TEST-SW                                           
           ' (1=THIS IS A TEST. PROC-DATE WILL BE COMPARED.)'                   
           IF  L-BYP-DATECHK                                                    
               DISPLAY 'CAT811: DATE CHECK WILL BE BYPASSED'                    
           ELSE                                                                 
               DISPLAY 'CAT811: DATE CHECK WILL BE PERFORMED'                   
           END-IF.                                                              
           IF  L-BYP-FILECHK                                                    
               DISPLAY 'CAT811: FILE CHECK WILL BE BYPASSED'                    
           ELSE                                                                 
               DISPLAY 'CAT811: FILE CHECK WILL BE PERFORMED'                   
           END-IF.                                                              
           IF  L-RERUN                                                          
               DISPLAY ' '                                                      
               DISPLAY '*--------------------------------------------*'         
               DISPLAY 'CAT811: THIS IS A RERUN.'                               
               DISPLAY '*--------------------------------------------*'         
               DISPLAY ' '                                                      
           END-IF.                                                              
           IF  L-TEST                                                           
               DISPLAY ' '                                                      
               DISPLAY '*--------------------------------------------*'         
               DISPLAY 'CAT811: THIS IS A TEST.'                                
               DISPLAY '*--------------------------------------------*'         
               DISPLAY ' '                                                      
           END-IF.                                                              
                                                                                
           MOVE 'CAT811'                  TO BPDATES-CALLING-PGM.               
           SET  LNKDATZ-REQUEST           TO TRUE.                              
           CALL BPDATES USING BPDATES-PARAMETERS.                               
           MOVE BPD-PROC-DATE(3:2)        TO LD-PROC-DATE-YY.                   
           MOVE BPD-PROC-DATE(5:2)        TO LD-PROC-DATE-MM.                   
           MOVE BPD-PROC-DATE(7:2)        TO LD-PROC-DATE-DD.                   
           MOVE BPD-PROC-DATE(1:4)        TO W-PROC-DT-YEAR.                    
           MOVE BPD-PROC-DATE(5:2)        TO W-PROC-DT-MM.                      
           MOVE BPD-PROC-DATE(7:2)        TO W-PROC-DT-DD.                      
           MOVE BPD-PROC-DATE             TO W-TODAY-DATE.                      
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY 'CAT811:       BPD-PROC-DATE= ' BPD-PROC-DATE                
                                '  LD-PROC-DATE= ' LD-PROC-DATE.                
           DISPLAY 'CAT811: BPD-PRIOR-PROC-DATE= ' BPD-PRIOR-PROC-DATE.         
           DISPLAY 'CAT811:         W-PROC-DT  = ' W-PROC-DT                    
           DISPLAY ' '.                                                         
                                                                                
           MOVE '000'                  TO BH-BROKER-NUMBER.                     
           PERFORM 1500-LOAD-B1          THRU 1500-EXIT.                        
                                                                                
       1000-EXIT. EXIT.                                                         
      /                                                                         
       1500-LOAD-B1 SECTION.                                                    
           DISPLAY 'CAT811: 1500-LOAD-B1'.                                      
                                                                                
           MOVE SPACES                   TO  B1-TABLE-AREA.                     
           MOVE 0                        TO  B1-TBL-CNT.                        
                                                                                
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500                
                                                                                
             MOVE  ' '                   TO  BH-BROKER-HEADER-INFO              
                                             BH-ACAT-INFO                       
             MOVE  B1-SUB                TO  BH-BROKER-NUMBER-N                 
             MOVE  '015'                 TO  BH-LOGICAL-RECORD-CODE             
             MOVE  '434500'              TO  BH-B2-INFO-ID                      
             CALL  GETB1V              USING BH-BROKER-HEADER-INFO              
                                             BH-ACAT-INFO                       
             IF   BH-BROKER-ACTIVE                                              
             AND  BH-ACAT-ACTIVE                                                
                   ADD 1 TO B1-TBL-CNT                                          
                   MOVE  BH-BROKER-NUMBER-N                                     
                                         TO B1-ADP-CL-NO  (B1-TBL-CNT)          
                   MOVE  BH-BROKER-NAME                                         
                                         TO B1-CLI-NAME   (B1-TBL-CNT)          
                   MOVE  BH-BROKER-OLD-CLEARING-HOUSE (2:4)                     
                                         TO B1-BKR-CLR-NO (B1-TBL-CNT)          
                   IF  BH-BROKER-MINI-MAXI-SUBGROUP > ' '                       
                       MOVE BH-BROKER-MINI-MAXI-SUBGROUP                        
                                         TO B1-STREAM     (B1-TBL-CNT)          
                   ELSE                                                         
                       MOVE BH-BROKER-MINI-MAXI-INDICATOR                       
                                         TO B1-STREAM     (B1-TBL-CNT)          
                   END-IF                                                       
                   MOVE  BH-BROKER-STATUS                                       
                                         TO B1-STATUS     (B1-TBL-CNT)          
                   MOVE  BH-ACAT-STATUS                                         
                                         TO B1-ACAT-STATUS(B1-TBL-CNT)          
                   IF  B1-STREAM (B1-TBL-CNT) = L-STREAM                        
                       DISPLAY     'CNT=' B1-TBL-CNT                            
                                    ' CLT ' B1-ADP-CL-NO  (B1-TBL-CNT)          
                                        ' ' B1-CLI-NAME   (B1-TBL-CNT)          
                                    ' BKR ' B1-BKR-CLR-NO (B1-TBL-CNT)          
                                    ' STR ' B1-STREAM     (B1-TBL-CNT)          
                                    ' STA ' B1-STATUS     (B1-TBL-CNT)          
                                   ' ACAT ' B1-ACAT-STATUS(B1-TBL-CNT)          
                       ADD 1 TO B1-STREAM-CNT                                   
                   END-IF                                                       
             END-IF                                                             
                                                                                
           END-PERFORM.                                                         
                                                                                
           DISPLAY ' '.                                                         
                                                                                
           DISPLAY  'B1-STREAM-CNT  = ' B1-STREAM-CNT                           
                    ' # OF CLIENTS FOR THIS STREAM'                             
           DISPLAY  'B1 TABLE COUNT = ' B1-TBL-CNT                              
                    ' # OF ADP CLIENTS THAT ARE ACATS CLIENTS'.                 
           DISPLAY ' '.                                                         
       1500-EXIT. EXIT.                                                         
      /                                                                         
      ******************************************************************        
      *  GET CLIENT FOR THIS STREAM, AND FETCH TRANSFERS                        
      ******************************************************************        
       2000-PROCESS-INPUT SECTION.                                              
           MOVE '2000-PROCESS-INPUT         ' TO W-ROUTINE-1.                   
                                                                                
           PERFORM VARYING B1-SUB FROM 1 BY 1                                   
              UNTIL B1-SUB > 500                                                
                                                                                
              IF  B1-STREAM      (B1-SUB) = L-STREAM                            
              AND B1-STATUS      (B1-SUB) = 'A'                                 
              AND B1-ACAT-STATUS (B1-SUB) = 'A'                                 
              AND B1-BKR-CLR-NO  (B1-SUB) > ' '                                 
                  MOVE B1-ADP-CL-NO  (B1-SUB) TO W-CURRENT-CLIENT-N             
                  MOVE B1-BKR-CLR-NO (B1-SUB) TO W-CURRENT-BROKER               
                  MOVE B1-STREAM     (B1-SUB) TO W-CURRENT-STREAM               
                  PERFORM 2500-GETB1         THRU 2500-EXIT                     
                  IF BH-ACAT-SUBMIT-ASSETS-PTR > '0'                            
                     PERFORM 3000-FETCH-TRANFER THRU 3000-EXIT                  
                  ELSE                                                          
                     DISPLAY 'BYPASS CLIENT ' W-CURRENT-CLIENT-N                
                             ' DUE TO B1 434714 OFF'                            
                  END-IF                                                        
              END-IF                                                            
                                                                                
           END-PERFORM.                                                         
                                                                                
       2000-EXIT. EXIT.                                                         
      /                                                                         
       2500-GETB1          SECTION.                                             
                                                                                
           MOVE ' '                        TO BH-BROKER-HEADER-INFO             
                                              BH-ACAT-INFO                      
                                                                                
           MOVE W-CURRENT-CLIENT (2:3)     TO BH-BROKER-NUMBER                  
           MOVE '015'                      TO BH-LOGICAL-RECORD-CODE            
           MOVE '434500'                   TO BH-B2-INFO-ID                     
           CALL GETB1V                  USING BH-BROKER-HEADER-INFO,            
                                              BH-ACAT-INFO                      
           END-CALL.                                                            
                                                                                
           DISPLAY ' '                                                          
           DISPLAY 'NEW-CLIENT = ' BH-BROKER-NUMBER                             
                                       ' ' BH-BROKER-NAME                       
                               ' BRK-NO= ' BH-BROKER-OLD-CLEARING-HOUSE         
           DISPLAY 'CAT811: BH-ACAT-STATUS            (434501) = '              
                              BH-ACAT-STATUS                                    
           DISPLAY 'CAT811: BH-ACAT-SUBMIT-ASSETS-PTR (434714) = '              
                              BH-ACAT-SUBMIT-ASSETS-PTR                         
                                                                                
           IF  BH-ACAT-SUBMIT-ASSETS-PTR NOT NUMERIC                            
               MOVE '0' TO BH-ACAT-SUBMIT-ASSETS-PTR                            
           END-IF.                                                              
           MOVE BH-ACAT-SUBMIT-ASSETS-PTR TO W-BH-ACAT-SUBMIT-ASSETS            
           MOVE W-BH-ACAT-SUBMIT-ASSETS-N TO W-BH-DAYS-STTS-QTY.                
       2500-EXIT. EXIT.                                                         
      /                                                                         
      ******************************************************************        
      *  IF PTR TRANSFER REQUEST, AND WE ARE THE DELIVERER                      
      ******************************************************************        
       3000-FETCH-TRANFER SECTION.                                              
           MOVE '3000-FETCH-TRANSFER        ' TO W-ROUTINE-1.                   
                                                                                
           EXEC SQL OPEN VTRNFR_CURSOR END-EXEC                                 
                                                                                
           MOVE SQLCODE      TO W-DB2-SQLCODE                                   
           MOVE SQLCODE      TO W-TFR-SQLCODE                                   
           IF SQLCODE NOT = +0                                                  
              DISPLAY 'VTRNFR CURSOR OPEN ERROR '                               
                            'SQLCODE = ' W-DB2-SQLCODE                          
           END-IF                                                               
                                                                                
           PERFORM UNTIL W-TFR-SQLCODE NOT = +0                                 
                                                                                
              ADD 1 TO W-INFILE-CNT                                             
                                                                                
              EXEC SQL                                                          
                   FETCH VTRNFR_CURSOR                                          
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
LRM005             ,:DCLVTRNFR.ACCT-RB-SEC-IND                                  
              END-EXEC                                                          
                                                                                
              MOVE SQLCODE      TO W-DB2-SQLCODE                                
              MOVE SQLCODE      TO W-TFR-SQLCODE                                
              EVALUATE SQLCODE                                                  
                  WHEN +0                                                       
                       PERFORM 4000-PROCESS  THRU 4000-EXIT                     
                  WHEN +100                                                     
                       DISPLAY 'INP=' W-INFILE-CNT                              
                              ' VTRNFR CURSOR FETCH NOT FOUND '                 
                              ' SQLCODE = ' W-DB2-SQLCODE                       
                  WHEN OTHER                                                    
                       DISPLAY 'INP=' W-INFILE-CNT                              
                              ' VTRNFR CURSOR FETCH ERROR '                     
                              ' SQLCODE = ' W-DB2-SQLCODE                       
                       PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   
              END-EVALUATE                                                      
                                                                                
           END-PERFORM                                                          
                                                                                
           EXEC SQL                                                             
                CLOSE VTRNFR_CURSOR                                             
           END-EXEC                                                             
                                                                                
           MOVE SQLCODE      TO W-DB2-SQLCODE                                   
           MOVE SQLCODE      TO W-TFR-SQLCODE                                   
           IF  SQLCODE NOT = +0                                                 
               DISPLAY 'INP= ' W-INFILE-CNT                                     
                      ' VTRNFR CURSOR CLOSE ERROR '                             
                      ' SQLCODE = ' W-DB2-SQLCODE                               
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                           
           END-IF.                                                              
                                                                                
       3000-EXIT. EXIT.                                                         
      /                                                                         
      ******************************************************************        
      *  FOR PTR TRANSFER REQUEST TO DELIVER                                    
      *  IF SUBMIT DAYS = DAYS IN STATUS:                                       
      *     SEE IF ONE OR MORE ASSETS RESIDE ON ACTIAST                         
      *     IF ANY ASSET ON HOLD, UPDATE TO SUBMIT                              
      *     OTHERWISE, NO ASSETS FOUND, WAIT.                                   
      *  IF DAYS IN STATUS = 2 (LAST DAY TO RESPOND IS TOMORROW):               
      *     (THIS IS DONE ONLY WHEN B1 434714 > 0)                              
      *     SEE IF ONE OR MORE ASSETS RESIDE ON ACTIAST                         
      *     IF ANY ASSET ON HOLD, UPDATE TO SUBMIT                              
      *     OTHERWISE BUILD REJECT ON ACTITRF ELIGABLE TO SUBMIT.               
      ******************************************************************        
       4000-PROCESS             SECTION.                                        
           MOVE '4000-PROCESS      ' TO W-ROUTINE-1.                            
           DISPLAY ' FETCHED ' CLIENT-NBR OF DCLVTRNFR                          
                   ' '         ACAT-CONTROL-NBR OF DCLVTRNFR                    
                                                                                
      *****IF  L-TEST                                                           
      *****02/02/99 DO NOT PROCESS NEXT DAY'S TRANSFERS IF RUNNING LATE.        
               IF  PRCS-DT OF DCLVTRNFR > W-PROC-DT                             
TEST               DISPLAY 'SKIP BECAUSE OD PROCESS DATE'                       
                   GO TO 4000-EXIT                                              
               END-IF                                                           
      *****END-IF                                                               
                                                                                
           MOVE ' ' TO W-REJECT-AUTO-SW                                         
           MOVE ' ' TO W-REJECT-SWITCHES                                        
                                                                                
           MOVE CLIENT-NBR        OF DCLVTRNFR                                  
                                             TO  WF-CLIENT-NBR                  
           MOVE ACAT-CONTROL-NBR  OF DCLVTRNFR                                  
                                             TO  WF-ACAT-CONTROL-NBR            
                                                                                
      ***BYPASS REJECTED  TRANSFERS                                             
           PERFORM 6920-SELECT-ACTITRF THRU 6920-EXIT                           
           IF  W-ACTITRF-FND-SW = 'Y'                                           
               DISPLAY '   ACTITRF FOUND '                                      
                       ' RJCT=' TRNFR-TYPE-RJCT-CD OF DCLACTITRF                
                       ' PEND=' NSCC-PEND-CD       OF DCLACTITRF                
                       ' PRGM=' PRGM-NM            OF DCLACTITRF                
                       ' UPDT=' UPDT-TMSTP         OF DCLACTITRF                
                       ' BYPASSED REJECT'                                       
               IF  TRNFR-TYPE-RJCT-CD OF DCLACTITRF = '  ' OR '00'              
                   CONTINUE                                                     
               ELSE                                                             
               IF  NSCC-PEND-CD       OF DCLACTITRF = ' '                       
                   GO TO 4000-EXIT                                              
               END-IF                                                           
           END-IF.                                                              
                                                                                
      ***WHEN DAYS-IN-STATUS > 0, ASSETS SHOULD ALREADY BE LOADED               
      ***WHEN DAYS-IN-STATUS = B1-DAYS, SET NSCC-PEND TO ' ' TO SUBMIT          
      ***  OR DAYS-IN-STATUS = 2 (LAST DAY) SET TO SUBMIT                       
LRM006*****IF  W-BH-DAYS-STTS-QTY > 0                                           
LRM006     IF  W-BH-DAYS-STTS-QTY > 1                                           
           AND (DAYS-STTS-QTY OF DCLVTRNFR >= W-BH-DAYS-STTS-QTY                
             OR DAYS-STTS-QTY OF DCLVTRNFR = 2)                                 
               DISPLAY 'INP=' W-INFILE-CNT                                      
                      ' CLT=' WF-CLIENT-NBR                                     
                      ' CTL=' WF-ACAT-CONTROL-NBR                               
                      ' ACC=' WF-ACCT-DLVR-NBR                                  
                      ' SUBMIT.'                                                
                      ' DAYS(' DAYS-STTS-QTY OF DCLVTRNFR ')'                   
                      '>=B1(' W-BH-DAYS-STTS-QTY ') '                           
                      ' STA=' WF-STTS-CD                                        
                      ' PD=' WF-PRCS-DT                                         
               MOVE ' '    TO W-BH-NSCC-PEND-CD                                 
               PERFORM 6650-SUBMIT-ASSETS THRU 6650-EXIT                        
               ADD W-SQL-UPDATE-COUNT TO W-AST-SUBMIT-COUNT                     
               IF  W-SQL-UPDATE-COUNT > 0                                       
                   GO TO 4000-COMMIT                                            
               ELSE                                                             
                   DISPLAY 'NO ASSETS FOUND'                                    
               END-IF                                                           
           END-IF.                                                              
                                                                                
      ***WHEN DAYS-IN-STATUS = 2, BUILD REJECT                                  
           IF  W-BH-DAYS-STTS-QTY > 0                                           
           AND DAYS-STTS-QTY OF DCLVTRNFR = 2                                   
              MOVE 'L' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                       
              PERFORM 6800-UPDATE-VTRNFR   THRU 6800-EXIT                       
              PERFORM 6900-INSERT-ACTITRF THRU 6900-EXIT                        
           END-IF.                                                              
                                                                                
       4000-COMMIT.                                                             
                                                                                
           PERFORM 8100-SQL-COMMIT THRU 8100-EXIT.                              
                                                                                
       4000-EXIT. EXIT.                                                         
      /                                                                         
       6650-SUBMIT-ASSETS         SECTION.                                      
      *****************************************************************         
      *  IF DAYS = B1 DAYS, CHANGE NSCC-PEND TO ' ' TO SUBMIT.                  
      *  DO NOT SUBMIT WITHHELD ASSETS.                                         
      *****************************************************************         
           MOVE '6650-SUBMIT-ASSETS      ' TO W-ROUTINE-1.                      
                                                                                
           EXEC SQL                                                             
             UPDATE ACTIAST                                                     
                SET                                                             
                     NSCC_PEND_CD        = :W-BH-NSCC-PEND-CD                   
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  ACAT_CONTROL_NBR  = :WF-ACAT-CONTROL-NBR                 
                  AND  NSCC_WTHLD_CD     = ' '                                  
           END-EXEC.                                                            
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
                                                                                
           MOVE 'ACTIAST    '            TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
           MOVE SQLERRD(3)          TO W-SQLERRD-3                              
           MOVE W-SQLERRD-3         TO W-SQL-UPDATE-COUNT                       
                                                                                
           IF  SQLCODE  =  +0                                                   
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                          ' CLT=' WF-CLIENT-NBR                                 
                          ' CTL=' WF-ACAT-CONTROL-NBR                           
                          ' ACC=' WF-ACCT-DLVR-NBR                              
                     ' ACTIAST UPDATED WITH PEND=' W-BH-NSCC-PEND-CD            
                     ' COUNT=' W-SQL-UPDATE-COUNT                               
           ELSE                                                                 
               DISPLAY '   ACTIAST NSCC-PEND-CD NOT UPDATED'                    
                                ' SQLCODE = ' W-DB2-SQLCODE                     
               IF  SQLCODE  =  +100                                             
      *************DISPLAY '   BYPASSING INIT ASSETS NOT FOUND.'                
                   CONTINUE                                                     
               ELSE                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT811: ERROR UPDATING A ROW IN ACTIAST'            
                         ' (ACAT-INIT-ASSET TABLE)'                             
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
           END-IF.                                                              
                                                                                
       6650-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  FOR TRANSFER THAT ARE REJECTED                                         
      *  SET FLAGS IN VTRNFR                                                    
      *  UPDATE VTRNFR                                                          
      *****************************************************************         
       6800-UPDATE-VTRNFR          SECTION.                                     
           MOVE '6800-UPDATE-VTRNFR            ' TO W-ROUTINE-1.                
                                                                                
           MOVE W-PGM-NAME             TO PRGM-NM          OF DCLVTRNFR         
           MOVE ' '                    TO CICS-TERM-ID-CD  OF DCLVTRNFR         
           MOVE W-CURRENT-TIMESTAMP    TO UPDT-TMSTP       OF DCLVTRNFR         
                                                                                
           EXEC SQL                                                             
             UPDATE VTRNFR                                                      
                SET                                                             
                   CICS_TERM_ID_CD     = :DCLVTRNFR.CICS-TERM-ID-CD             
                  ,UPDT_TMSTP          = :DCLVTRNFR.UPDT-TMSTP                  
                  ,PRGM_NM             = :DCLVTRNFR.PRGM-NM                     
                  ,TRNFR_TYPE_RJC2_CD  = :DCLVTRNFR.TRNFR-TYPE-RJC2-CD          
                WHERE  CURRENT OF VTRNFR_CURSOR                                 
           END-EXEC.                                                            
                                                                                
           MOVE 'VTRNFR  '               TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VTRNFR-UPD-CNT                                        
           ELSE                                                                 
               ADD 1 TO W-VTRNFR-NOT-UPD-CNT                                    
               DISPLAY '   VTRNFR NOT UPDATED.'                                 
                                ' SQLCODE = ' W-DB2-SQLCODE                     
               DISPLAY '   VTRNFR PRIMARY KEY:'                                 
                         ' CLT=' WF-CLIENT-NBR                                  
                         ' CTL=' WF-ACAT-CONTROL-NBR                            
                       ' EQTY= ' WF-ACCT-EQUITY-AMT                             
               IF  L-RERUN                                                      
               AND SQLCODE  =  +100                                             
      *************DISPLAY '   BYPASSING VTRNFR UPDATE NOT FOUND.'              
                   CONTINUE                                                     
               ELSE                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT811: ERROR UPDATING A ROW IN VTRNFR'             
                         ' (ACAT-TRNFR      TABLE)'                             
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
               END-IF                                                           
           END-IF.                                                              
                                                                                
       6800-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  FOR TRANSFER THAT ARE REJECTED                                         
      *  ADD THE NEW ROW TO THE INIT-TABLE                                      
      *****************************************************************         
       6900-INSERT-ACTITRF SECTION.                                             
           MOVE '6900-INSERT-ACTITRF         ' TO W-ROUTINE-1.                  
                                                                                
           MOVE CLIENT-NBR         OF DCLVTRNFR                                 
                                   TO CLIENT-NBR         OF DCLACTITRF          
           MOVE DSTBN-SIDE-CD      OF DCLVTRNFR                                 
                                   TO DSTBN-SIDE-CD      OF DCLACTITRF          
           MOVE ACAT-CONTROL-NBR   OF DCLVTRNFR                                 
                                   TO ACAT-CONTROL-NBR   OF DCLACTITRF          
           MOVE PRCS-DT            OF DCLVTRNFR                                 
                                   TO PRCS-DT            OF DCLACTITRF          
           MOVE CYCLE-CD           OF DCLVTRNFR                                 
                                   TO CYCLE-CD           OF DCLACTITRF          
           MOVE SYS-ACT-CD         OF DCLVTRNFR                                 
                                   TO SYS-ACT-CD         OF DCLACTITRF          
           MOVE SYS-RJCT-RSN-CD    OF DCLVTRNFR                                 
                                   TO SYS-RJCT-RSN-CD    OF DCLACTITRF          
           MOVE STTS-CD            OF DCLVTRNFR                                 
                                   TO STTS-CD            OF DCLACTITRF          
           MOVE DAYS-STTS-QTY      OF DCLVTRNFR                                 
                                   TO DAYS-STTS-QTY      OF DCLACTITRF          
           MOVE RCRD-STTS-CD       OF DCLVTRNFR                                 
                                   TO RCRD-STTS-CD       OF DCLACTITRF          
           MOVE RCRD-LNGTH-STTS-CD OF DCLVTRNFR                                 
                                   TO RCRD-LNGTH-STTS-CD OF DCLACTITRF          
           MOVE PHSCL-SEQ-STTS-CD  OF DCLVTRNFR                                 
                                   TO PHSCL-SEQ-STTS-CD  OF DCLACTITRF          
           MOVE LGCL-SEQ-NR-STS-CD OF DCLVTRNFR                                 
                                   TO LGCL-SEQ-NR-STS-CD OF DCLACTITRF          
           MOVE TRANS-TYPE-STTS-CD OF DCLVTRNFR                                 
                                   TO TRANS-TYPE-STTS-CD OF DCLACTITRF          
           MOVE CONTROL-NBR-STS-CD OF DCLVTRNFR                                 
                                   TO CONTROL-NBR-STS-CD OF DCLACTITRF          
           MOVE TRNFR-TYPE-STTS-CD OF DCLVTRNFR                                 
                                   TO TRNFR-TYPE-STTS-CD OF DCLACTITRF          
           MOVE SBMT-PRT-NR-STS-CD OF DCLVTRNFR                                 
                                   TO SBMT-PRT-NR-STS-CD OF DCLACTITRF          
           MOVE RCV-NBR-STTS-CD    OF DCLVTRNFR                                 
                                   TO RCV-NBR-STTS-CD    OF DCLACTITRF          
           MOVE DLVR-NBR-STTS-CD   OF DCLVTRNFR                                 
                                   TO DLVR-NBR-STTS-CD   OF DCLACTITRF          
           MOVE ACCT-RCV-STTS-CD   OF DCLVTRNFR                                 
                                   TO ACCT-RCV-STTS-CD   OF DCLACTITRF          
           MOVE RCV-CUST-NM-STS-CD OF DCLVTRNFR                                 
                                   TO RCV-CUST-NM-STS-CD OF DCLACTITRF          
           MOVE RCV-SS-PRIM-STS-CD OF DCLVTRNFR                                 
                                   TO RCV-SS-PRIM-STS-CD OF DCLACTITRF          
           MOVE RCV-SS-SCDY-STS-CD OF DCLVTRNFR                                 
                                   TO RCV-SS-SCDY-STS-CD OF DCLACTITRF          
           MOVE RCV-ACT-TYP-STS-CD OF DCLVTRNFR                                 
                                   TO RCV-ACT-TYP-STS-CD OF DCLACTITRF          
           MOVE RCV-OCC-STTS-CD    OF DCLVTRNFR                                 
                                   TO RCV-OCC-STTS-CD    OF DCLACTITRF          
           MOVE RCV-CRSPN-STTS-CD  OF DCLVTRNFR                                 
                                   TO RCV-CRSPN-STTS-CD  OF DCLACTITRF          
           MOVE ACCT-DLVR-STTS-CD  OF DCLVTRNFR                                 
                                   TO ACCT-DLVR-STTS-CD  OF DCLACTITRF          
           MOVE TRN-TYP-RJC-STS-CD OF DCLVTRNFR                                 
                                   TO TRN-TYP-RJC-STS-CD OF DCLACTITRF          
           MOVE CNTL-ASTD-STTS-CD  OF DCLVTRNFR                                 
                                   TO CNTL-ASTD-STTS-CD  OF DCLACTITRF          
           MOVE STTLM-ASCTD-STS-CD OF DCLVTRNFR                                 
                                   TO STTLM-ASCTD-STS-CD OF DCLACTITRF          
           MOVE TRANS-RFRN-STTS-CD OF DCLVTRNFR                                 
                                   TO TRANS-RFRN-STTS-CD OF DCLACTITRF          
           MOVE CMNT-STTS-CD       OF DCLVTRNFR                                 
                                   TO CMNT-STTS-CD       OF DCLACTITRF          
           MOVE PHSCL-SEQ-NBR      OF DCLVTRNFR                                 
                                   TO PHSCL-SEQ-NBR      OF DCLACTITRF          
           MOVE LGCL-SEQ-NBR       OF DCLVTRNFR                                 
                                   TO LGCL-SEQ-NBR       OF DCLACTITRF          
           MOVE TRANS-TYPE-CD      OF DCLVTRNFR                                 
                                   TO TRANS-TYPE-CD      OF DCLACTITRF          
           MOVE TRNFR-TYPE-CD      OF DCLVTRNFR                                 
                                   TO TRNFR-TYPE-CD      OF DCLACTITRF          
      *****MOVE SBMTG-PRTCP-NBR    OF DCLVTRNFR                                 
           MOVE BH-BROKER-OLD-CLEARING-HOUSE (2:4)                              
                                   TO SBMTG-PRTCP-NBR    OF DCLACTITRF          
           MOVE RCV-NBR            OF DCLVTRNFR                                 
                                   TO RCV-NBR            OF DCLACTITRF          
           MOVE DLVR-NBR           OF DCLVTRNFR                                 
                                   TO DLVR-NBR           OF DCLACTITRF          
           MOVE ACCT-RCV-NBR       OF DCLVTRNFR                                 
                                   TO ACCT-RCV-NBR       OF DCLACTITRF          
           MOVE RCV-CUST-NM        OF DCLVTRNFR                                 
                                   TO RCV-CUST-NM        OF DCLACTITRF          
           MOVE RCV-SS-PRIM-NBR    OF DCLVTRNFR                                 
                                   TO RCV-SS-PRIM-NBR    OF DCLACTITRF          
           MOVE RCV-SS-SCNDY-NBR   OF DCLVTRNFR                                 
                                   TO RCV-SS-SCNDY-NBR   OF DCLACTITRF          
           MOVE RCV-ACCT-TYPE-CD   OF DCLVTRNFR                                 
                                   TO RCV-ACCT-TYPE-CD   OF DCLACTITRF          
           MOVE RCV-OCC-BRKR-NBR   OF DCLVTRNFR                                 
                                   TO RCV-OCC-BRKR-NBR   OF DCLACTITRF          
           MOVE RCV-CRSPN-NBR      OF DCLVTRNFR                                 
                                   TO RCV-CRSPN-NBR      OF DCLACTITRF          
           MOVE PRTCP-CONTRA-CD    OF DCLVTRNFR                                 
                                   TO PRTCP-CONTRA-CD    OF DCLACTITRF          
           MOVE ACCT-DLVR-NBR      OF DCLVTRNFR                                 
                                   TO ACCT-DLVR-NBR      OF DCLACTITRF          
           MOVE TRNFR-TYPE-RJCT-CD OF DCLVTRNFR                                 
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
           MOVE ACAT-CNTL-ASTD-NBR OF DCLVTRNFR                                 
                                   TO ACAT-CNTL-ASTD-NBR OF DCLACTITRF          
           MOVE STTLM-ASCTD-DT     OF DCLVTRNFR                                 
                                   TO STTLM-ASCTD-DT     OF DCLACTITRF          
           MOVE TRANS-RFRN-ID-CD   OF DCLVTRNFR                                 
                                   TO TRANS-RFRN-ID-CD   OF DCLACTITRF          
           MOVE ' '                                                             
                                   TO CMNT-TXT           OF DCLACTITRF          
           MOVE CICS-TERM-ID-CD    OF DCLVTRNFR                                 
                                   TO CICS-TERM-ID-CD    OF DCLACTITRF          
           MOVE CRT-TMSTP          OF DCLVTRNFR                                 
                                   TO CRT-TMSTP          OF DCLACTITRF          
           MOVE DB-CR-CD           OF DCLVTRNFR                                 
                                   TO DB-CR-CD           OF DCLACTITRF          
           MOVE NSCC-ACK-IND       OF DCLVTRNFR                                 
                                   TO NSCC-ACK-IND       OF DCLACTITRF          
                                                                                
           MOVE ' '                TO NSCC-PEND-CD       OF DCLACTITRF          
                                                                                
           MOVE PRGM-NM            OF DCLVTRNFR                                 
                                   TO PRGM-NM            OF DCLACTITRF          
           MOVE RR-CD              OF DCLVTRNFR                                 
                                   TO RR-CD              OF DCLACTITRF          
           MOVE TRNFR-TYPE-RJC1-CD OF DCLVTRNFR                                 
                                   TO TRNFR-TYPE-RJC1-CD OF DCLACTITRF          
           MOVE TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                                 
                                   TO TRNFR-TYPE-RJC2-CD OF DCLACTITRF          
           MOVE UPDT-TMSTP         OF DCLVTRNFR                                 
                                   TO UPDT-TMSTP         OF DCLACTITRF          
                                                                                
           MOVE '04'               TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
           MOVE 'R'                TO TRANS-TYPE-CD      OF DCLACTITRF          
                                                                                
           EXEC SQL                                                             
               INSERT INTO ACTITRF                                              
                 (                                                              
                   CLIENT_NBR                                                   
                  ,DSTBN_SIDE_CD                                                
                  ,ACAT_CONTROL_NBR                                             
                  ,PRCS_DT                                                      
                  ,CYCLE_CD                                                     
                  ,SYS_ACT_CD                                                   
                  ,SYS_RJCT_RSN_CD                                              
                  ,STTS_CD                                                      
                  ,DAYS_STTS_QTY                                                
                  ,RCRD_STTS_CD                                                 
                  ,RCRD_LNGTH_STTS_CD                                           
                  ,PHSCL_SEQ_STTS_CD                                            
                  ,LGCL_SEQ_NR_STS_CD                                           
                  ,TRANS_TYPE_STTS_CD                                           
                  ,CONTROL_NBR_STS_CD                                           
                  ,TRNFR_TYPE_STTS_CD                                           
                  ,SBMT_PRT_NR_STS_CD                                           
                  ,RCV_NBR_STTS_CD                                              
                  ,DLVR_NBR_STTS_CD                                             
                  ,ACCT_RCV_STTS_CD                                             
                  ,RCV_CUST_NM_STS_CD                                           
                  ,RCV_SS_PRIM_STS_CD                                           
                  ,RCV_SS_SCDY_STS_CD                                           
                  ,RCV_ACT_TYP_STS_CD                                           
                  ,RCV_OCC_STTS_CD                                              
                  ,RCV_CRSPN_STTS_CD                                            
                  ,ACCT_DLVR_STTS_CD                                            
                  ,TRN_TYP_RJC_STS_CD                                           
                  ,CNTL_ASTD_STTS_CD                                            
                  ,STTLM_ASCTD_STS_CD                                           
                  ,TRANS_RFRN_STTS_CD                                           
                  ,CMNT_STTS_CD                                                 
                  ,PHSCL_SEQ_NBR                                                
                  ,LGCL_SEQ_NBR                                                 
                  ,TRANS_TYPE_CD                                                
                  ,TRNFR_TYPE_CD                                                
                  ,SBMTG_PRTCP_NBR                                              
                  ,RCV_NBR                                                      
                  ,DLVR_NBR                                                     
                  ,ACCT_RCV_NBR                                                 
                  ,RCV_CUST_NM                                                  
                  ,RCV_SS_PRIM_NBR                                              
                  ,RCV_SS_SCNDY_NBR                                             
                  ,RCV_ACCT_TYPE_CD                                             
                  ,RCV_OCC_BRKR_NBR                                             
                  ,RCV_CRSPN_NBR                                                
                  ,PRTCP_CONTRA_CD                                              
                  ,ACCT_DLVR_NBR                                                
                  ,TRNFR_TYPE_RJCT_CD                                           
                  ,ACAT_CNTL_ASTD_NBR                                           
                  ,STTLM_ASCTD_DT                                               
                  ,TRANS_RFRN_ID_CD                                             
                  ,CMNT_TXT                                                     
                  ,CICS_TERM_ID_CD                                              
                  ,CRT_TMSTP                                                    
                  ,DB_CR_CD                                                     
                  ,NSCC_ACK_IND                                                 
                  ,NSCC_PEND_CD                                                 
                  ,PRGM_NM                                                      
                  ,RR_CD                                                        
                  ,TRNFR_TYPE_RJC1_CD                                           
                  ,TRNFR_TYPE_RJC2_CD                                           
                  ,UPDT_TMSTP                                                   
                 )                                                              
                 VALUES                                                         
                 (                                                              
                   :DCLACTITRF.CLIENT-NBR                                       
                  ,:DCLACTITRF.DSTBN-SIDE-CD                                    
                  ,:DCLACTITRF.ACAT-CONTROL-NBR                                 
                  ,:DCLACTITRF.PRCS-DT                                          
                  ,:DCLACTITRF.CYCLE-CD                                         
                  ,:DCLACTITRF.SYS-ACT-CD                                       
                  ,:DCLACTITRF.SYS-RJCT-RSN-CD                                  
                  ,:DCLACTITRF.STTS-CD                                          
                  ,:DCLACTITRF.DAYS-STTS-QTY                                    
                  ,:DCLACTITRF.RCRD-STTS-CD                                     
                  ,:DCLACTITRF.RCRD-LNGTH-STTS-CD                               
                  ,:DCLACTITRF.PHSCL-SEQ-STTS-CD                                
                  ,:DCLACTITRF.LGCL-SEQ-NR-STS-CD                               
                  ,:DCLACTITRF.TRANS-TYPE-STTS-CD                               
                  ,:DCLACTITRF.CONTROL-NBR-STS-CD                               
                  ,:DCLACTITRF.TRNFR-TYPE-STTS-CD                               
                  ,:DCLACTITRF.SBMT-PRT-NR-STS-CD                               
                  ,:DCLACTITRF.RCV-NBR-STTS-CD                                  
                  ,:DCLACTITRF.DLVR-NBR-STTS-CD                                 
                  ,:DCLACTITRF.ACCT-RCV-STTS-CD                                 
                  ,:DCLACTITRF.RCV-CUST-NM-STS-CD                               
                  ,:DCLACTITRF.RCV-SS-PRIM-STS-CD                               
                  ,:DCLACTITRF.RCV-SS-SCDY-STS-CD                               
                  ,:DCLACTITRF.RCV-ACT-TYP-STS-CD                               
                  ,:DCLACTITRF.RCV-OCC-STTS-CD                                  
                  ,:DCLACTITRF.RCV-CRSPN-STTS-CD                                
                  ,:DCLACTITRF.ACCT-DLVR-STTS-CD                                
                  ,:DCLACTITRF.TRN-TYP-RJC-STS-CD                               
                  ,:DCLACTITRF.CNTL-ASTD-STTS-CD                                
                  ,:DCLACTITRF.STTLM-ASCTD-STS-CD                               
                  ,:DCLACTITRF.TRANS-RFRN-STTS-CD                               
                  ,:DCLACTITRF.CMNT-STTS-CD                                     
                  ,:DCLACTITRF.PHSCL-SEQ-NBR                                    
                  ,:DCLACTITRF.LGCL-SEQ-NBR                                     
                  ,:DCLACTITRF.TRANS-TYPE-CD                                    
                  ,:DCLACTITRF.TRNFR-TYPE-CD                                    
                  ,:DCLACTITRF.SBMTG-PRTCP-NBR                                  
                  ,:DCLACTITRF.RCV-NBR                                          
                  ,:DCLACTITRF.DLVR-NBR                                         
                  ,:DCLACTITRF.ACCT-RCV-NBR                                     
                  ,:DCLACTITRF.RCV-CUST-NM                                      
                  ,:DCLACTITRF.RCV-SS-PRIM-NBR                                  
                  ,:DCLACTITRF.RCV-SS-SCNDY-NBR                                 
                  ,:DCLACTITRF.RCV-ACCT-TYPE-CD                                 
                  ,:DCLACTITRF.RCV-OCC-BRKR-NBR                                 
                  ,:DCLACTITRF.RCV-CRSPN-NBR                                    
                  ,:DCLACTITRF.PRTCP-CONTRA-CD                                  
                  ,:DCLACTITRF.ACCT-DLVR-NBR                                    
                  ,:DCLACTITRF.TRNFR-TYPE-RJCT-CD                               
                  ,:DCLACTITRF.ACAT-CNTL-ASTD-NBR                               
                  ,:DCLACTITRF.STTLM-ASCTD-DT                                   
                  ,:DCLACTITRF.TRANS-RFRN-ID-CD                                 
                  ,:DCLACTITRF.CMNT-TXT                                         
                  ,:DCLACTITRF.CICS-TERM-ID-CD                                  
                  ,:DCLACTITRF.CRT-TMSTP                                        
                  ,:DCLACTITRF.DB-CR-CD                                         
                  ,:DCLACTITRF.NSCC-ACK-IND                                     
                  ,:DCLACTITRF.NSCC-PEND-CD                                     
                  ,:DCLACTITRF.PRGM-NM                                          
                  ,:DCLACTITRF.RR-CD                                            
                  ,:DCLACTITRF.TRNFR-TYPE-RJC1-CD                               
                  ,:DCLACTITRF.TRNFR-TYPE-RJC2-CD                               
                  ,:DCLACTITRF.UPDT-TMSTP                                       
                 )                                                              
           END-EXEC.                                                            
                                                                                
           MOVE 'ACTITRF'                TO W-DB2-TABLE-NAME                    
           MOVE 'INSERT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTITRF-ADD-CNT                                       
               DISPLAY '   ACTITRF ADDED.'                                      
              ' TRANS-TYPE-CD=' TRANS-TYPE-CD OF DCLACTITRF                     
              ' TRNFR-TYPE-RJCT-CD=' TRNFR-TYPE-RJCT-CD OF DCLACTITRF           
           ELSE                                                                 
               ADD 1 TO W-ACTITRF-NOT-ADD-CNT                                   
               IF  SQLCODE  =  -803                                             
                   PERFORM 6910-UPDATE-ACTITRF     THRU 6910-EXIT               
               ELSE                                                             
                   DISPLAY '   ACTITRF NOT ADDED.'                              
                               ' SQLCODE = ' W-DB2-SQLCODE                      
                   DISPLAY '   '                                                
                          'ACTITRF PRIMARY KEY:'                                
                              ' CLT=' WF-CLIENT-NBR                             
                              ' TFR=' WF-TRNFR-TYPE-CD                          
                   DISPLAY '    DLV=' WF-DLVR-NBR                               
                           ' DLV-AC=' WF-ACCT-DLVR-NBR                          
                              ' RCV=' WF-RCV-NBR                                
                           ' RCV-AC=' WF-ACCT-RCV-NBR                           
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT811 ERROR INSERTING A ROW INTO ACTITRF'          
                        ' (ACAT-TRNFR TABLE)'                                   
                   DISPLAY 'CAT811: DCLACTITRF  ='                              
                        '(' DCLACTITRF ')'                                      
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
               END-IF                                                           
           END-IF.                                                              
                                                                                
       6900-EXIT. EXIT.                                                         
                                                                                
       6910-UPDATE-ACTITRF SECTION.                                             
           MOVE '6910-UPDATE-ACTITRF       ' TO W-ROUTINE-1.                    
                                                                                
           EXEC SQL SELECT                                                      
                      NSCC_PEND_CD                                              
                     ,PRCS_DT                                                   
                     ,PRGM_NM                                                   
                     ,UPDT_TMSTP                                                
                     ,TRNFR_TYPE_RJCT_CD                                        
               INTO  :W-ACTITRF-NSCC-PEND-CD                                    
                    ,:W-ACTITRF-PRCS-DT                                         
                    ,:W-ACTITRF-PRGM-NM                                         
                    ,:W-ACTITRF-UPDT-TMSTP                                      
                    ,:W-ACTITRF-TRNFR-TYPE-RJCT-CD                              
               FROM  ACTITRF                                                    
              WHERE  CLIENT_NBR        = :DCLVTRNFR.CLIENT-NBR                  
                  AND ACAT_CONTROL_NBR = :WF-ACAT-CONTROL-NBR                   
           END-EXEC                                                             
                                                                                
           DISPLAY '   ACTITRF FOUND    :'                                      
                         ' CLT=' CLIENT-NBR OF DCLVTRNFR                        
                         ' CTL=' WF-ACAT-CONTROL-NBR                            
                                ' RJCT=' W-ACTITRF-TRNFR-TYPE-RJCT-CD           
                                ' PEND=' W-ACTITRF-NSCC-PEND-CD                 
                                ' PRCS=' W-ACTITRF-PRCS-DT                      
                                ' PRGM=' W-ACTITRF-PRGM-NM                      
                                 ' UPDT=' W-ACTITRF-UPDT-TMSTP                  
                                                                                
           MOVE '04'            TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF             
           MOVE 'R'                TO TRANS-TYPE-CD   OF DCLACTITRF             
           MOVE ' '                TO CICS-TERM-ID-CD OF DCLACTITRF             
           MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP     OF DCLACTITRF             
           MOVE W-PGM-NAME          TO PRGM-NM        OF DCLACTITRF             
           MOVE ' '                 TO NSCC-PEND-CD   OF DCLACTITRF             
                                                                                
           EXEC SQL                                                             
             UPDATE ACTITRF                                                     
                SET                                                             
                   TRANS_TYPE_CD       = :DCLACTITRF.TRANS-TYPE-CD              
                  ,TRNFR_TYPE_RJCT_CD  = :DCLACTITRF.TRNFR-TYPE-RJCT-CD         
                  ,CICS_TERM_ID_CD     = :DCLACTITRF.CICS-TERM-ID-CD            
                  ,UPDT_TMSTP          = :DCLACTITRF.UPDT-TMSTP                 
                  ,PRGM_NM             = :DCLACTITRF.PRGM-NM                    
                  ,NSCC_PEND_CD        = :DCLACTITRF.NSCC-PEND-CD               
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND ACAT_CONTROL_NBR = :WF-ACAT-CONTROL-NBR                   
           END-EXEC.                                                            
                                                                                
           MOVE 'ACTITRF'                TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTITRF-UPD-CNT                                       
               DISPLAY '   ACTITRF UPDATED'                                     
           ELSE                                                                 
               ADD 1 TO W-ACTITRF-NOT-UPD-CNT                                   
               DISPLAY '   ACTITRF NOT UPDATED '                                
                         ' SQLCODE = ' W-DB2-SQLCODE                            
               DISPLAY '   '                                                    
                      'ACTITRF PRIMARY KEY:'                                    
                          ' CLT=' WF-CLIENT-NBR                                 
                          ' TFR=' WF-TRNFR-TYPE-CD                              
               DISPLAY '    DLV=' WF-DLVR-NBR                                   
                       ' DLV-AC=' WF-ACCT-DLVR-NBR                              
                          ' RCV=' WF-RCV-NBR                                    
                       ' RCV-AC=' WF-ACCT-RCV-NBR                               
               DISPLAY '   '                                                    
                      'ACTITRF  UPDATE KEY:'                                    
                          ' CLT=' WF-CLIENT-NBR                                 
                          ' TFR=' WF-TRNFR-TYPE-CD                              
               DISPLAY '    DLV=' WF-DLVR-NBR                                   
                       ' DLV-AC=' WF-ACCT-DLVR-NBR                              
                          ' RCV=' WF-RCV-NBR                                    
                       ' RCV-AC=' WF-ACCT-RCV-NBR                               
             IF  SQLCODE  =  +100                                               
                   DISPLAY '   ACTITRF UPDATE NOT FOUND.'                       
             END-IF                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT811: ERROR UPDATING A ROW IN ACTITRF'            
                         ' (ACAT-TRNFR      TABLE)'                             
                   DISPLAY 'CAT811: DCLACTITRF  ='                              
                           '(' DCLACTITRF ')'                                   
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
           END-IF.                                                              
                                                                                
       6910-EXIT. EXIT.                                                         
      /                                                                         
       6920-SELECT-ACTITRF SECTION.                                             
           MOVE '6920-SELECT-ACTITRF          ' TO W-ROUTINE-1.                 
                                                                                
           MOVE ' '   TO W-ACTITRF-FND-SW                                       
           INITIALIZE DCLACTITRF                                                
                                                                                
           EXEC SQL SELECT                                                      
                   TRANS_TYPE_CD                                                
                  ,TRNFR_TYPE_RJCT_CD                                           
                  ,CICS_TERM_ID_CD                                              
                  ,UPDT_TMSTP                                                   
                  ,PRGM_NM                                                      
                  ,NSCC_PEND_CD                                                 
               INTO                                                             
                   :DCLACTITRF.TRANS-TYPE-CD                                    
                  ,:DCLACTITRF.TRNFR-TYPE-RJCT-CD                               
                  ,:DCLACTITRF.CICS-TERM-ID-CD                                  
                  ,:DCLACTITRF.UPDT-TMSTP                                       
                  ,:DCLACTITRF.PRGM-NM                                          
                  ,:DCLACTITRF.NSCC-PEND-CD                                     
                                                                                
               FROM  ACTITRF                                                    
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  ACAT_CONTROL_NBR  = :WF-ACAT-CONTROL-NBR                 
           END-EXEC                                                             
                                                                                
           MOVE 'ACTITRF'                TO W-DB2-TABLE-NAME                    
           MOVE 'SELECT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
                                                                                
           IF  SQLCODE  =  +0                                                   
               MOVE 'Y'   TO W-ACTITRF-FND-SW                                   
           ELSE                                                                 
              IF  SQLCODE  =  +100                                              
                  MOVE 'N'   TO W-ACTITRF-FND-SW                                
              ELSE                                                              
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT811: ERROR SELECTING A ROW IN ACTITRF'           
                         ' (ACAT-TRNFR      TABLE)'                             
                   DISPLAY 'CAT811: DCLACTITRF  ='                              
                           '(' DCLACTITRF ')'                                   
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
              END-IF                                                            
           END-IF.                                                              
                                                                                
       6920-EXIT. EXIT.                                                         
      /                                                                         
       8100-SQL-COMMIT     SECTION.                                             
                                                                                
           EXEC SQL COMMIT                                                      
           END-EXEC                                                             
                                                                                
           MOVE SQLCA   TO COMMIT-SQLCA                                         
           MOVE SQLCODE TO COMMIT-RETURN                                        
                                                                                
           IF  COMMIT-AB                                                        
               DISPLAY 'CAT811: '                                               
                   'SQL COMMIT FAILED. COMMIT-RETURN= '                         
                    COMMIT-RETURN                                               
                  ' INFILE-CNT= '           W-INFILE-CNT                        
                    ' PREV-CNT= '           W-LAST-COMMIT-INFILE-CNT            
           ELSE                                                                 
               ADD 1 TO W-COMMIT-CNT                                            
           END-IF.                                                              
                                                                                
           MOVE W-INFILE-CNT             TO W-LAST-COMMIT-INFILE-CNT.           
                                                                                
       8100-EXIT. EXIT.                                                         
      /                                                                         
       8300-DISPLAY-KEY    SECTION.                                             
           DISPLAY '    KEY:'                                                   
                                ' CLT=' WF-CLIENT-NBR                           
                                ' CTL=' WF-ACAT-CONTROL-NBR                     
                                ' TFR=' WF-TRNFR-TYPE-CD                        
                                ' TRN=' WF-TRANS-TYPE-CD                        
           DISPLAY '   '                                                        
                                ' DLV=' WF-DLVR-NBR                             
                             ' DLV-AC=' WF-ACCT-DLVR-NBR                        
                                ' RCV=' WF-RCV-NBR                              
                             ' RCV-AC=' WF-ACCT-RCV-NBR                         
           DISPLAY '   '                                                        
                         ' SEC-CC=' ISIN-CNTRY-CD     OF DCLACTIAST             
                         ' SEC-NO=' ISIN-SEC-ISSUE-CD OF DCLACTIAST             
                         ' SEC-CD=' ISIN-SEC-CDG-CD   OF DCLACTIAST             
                         ' STL-LC=' STTLM-LCTN-CD     OF DCLACTIAST             
                            ' CMS=' CSH-MGN-SHRT-CD   OF DCLACTIAST             
           .                                                                    
       8300-EXIT. EXIT.                                                         
      /                                                                         
       8500-SQL-ERROR      SECTION.                                             
           DISPLAY ' '                                                          
           DISPLAY '8500-SQL-ERROR'                                             
                  ' INFILE-CNT = ' W-INFILE-CNT                                 
           ' LAST-COMMIT-INFILE-CNT = ' W-LAST-COMMIT-INFILE-CNT                
                                                                                
           DISPLAY ' '                                                          
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                          
                                    W-DB2-MESSAGE-LEN.                          
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                                
             UNTIL W-DB2-IDX GREATER THAN 12                                    
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES                      
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)                       
                   END-IF                                                       
           END-PERFORM.                                                         
           DISPLAY ' '                                                          
                                                                                
           PERFORM 8700-SQL-ROLLBACK THRU 8700-EXIT                             
                                                                                
           DISPLAY 'CAT811: U3999 - ABENDING ON BAD DB2 STATUS'                 
           PERFORM 8900-DISPLAY-CNT THRU 8900-EXIT                              
           DISPLAY 'CAT811: PROGRAM ENDED ABNORMALLY'                           
           MOVE +3999    TO ABEND-CODE                                          
           CALL ABEND USING ABEND-CODE.                                         
                                                                                
       8500-EXIT. EXIT.                                                         
      /                                                                         
       8700-SQL-ROLLBACK   SECTION.                                             
           DISPLAY '8700-SQL-ROLLBACK'                                          
                  ' INFILE-CNT = ' W-INFILE-CNT                                 
                  ' LAST-COMMIT-INFILE-CNT = '                                  
                                            W-LAST-COMMIT-INFILE-CNT            
                                                                                
           EXEC SQL ROLLBACK WORK                                               
           END-EXEC                                                             
                                                                                
           MOVE SQLCA   TO ROLLBACK-SQLCA                                       
           MOVE SQLCODE TO ROLLBACK-RETURN                                      
                                                                                
           IF ROLLBACK-AB                                                       
               DISPLAY                                                          
                   'AUTO ROLLBACK FAILED. ROLLBACK-RETURN = '                   
                   ROLLBACK-RETURN                                              
           ELSE                                                                 
               DISPLAY                                                          
                   'AUTO ROLLBACK SUCCESSFUL. ROLLBACK-RETURN = '               
                   ROLLBACK-RETURN                                              
           END-IF.                                                              
                                                                                
       8700-EXIT. EXIT.                                                         
      /                                                                         
       8900-DISPLAY-CNT   SECTION.                                              
           DISPLAY ' '                                                          
           DISPLAY 'CAT811: SQL-CNT            = ' W-SQL-CNT                    
           DISPLAY 'CAT811: W-COMMIT-CNT       = ' W-COMMIT-CNT                 
           DISPLAY 'CAT811: ACTIAST-UPD-CNT   = ' W-ACTIAST-UPD-CNT             
                          ' ACTIAST-NOT-UPD-CNT = '                             
                                                  W-ACTIAST-NOT-UPD-CNT         
           DISPLAY 'CAT811: ACTITRF-ADD-CNT   = ' W-ACTITRF-ADD-CNT             
                          ' ACTITRF-NOT-ADD-CNT = '                             
                                                 W-ACTITRF-NOT-ADD-CNT          
           DISPLAY 'CAT811: ACTITRF-UPD-CNT   = ' W-ACTITRF-UPD-CNT             
                          ' ACTITRF-NOT-UPD-CNT = '                             
                                                 W-ACTITRF-NOT-UPD-CNT          
           DISPLAY 'CAT811: VTRNFR-UPD-CNT     = ' W-VTRNFR-UPD-CNT             
                          ' VTRNFR-NOT-UPD-CNT   = '                            
                                                 W-VTRNFR-NOT-UPD-CNT           
           DISPLAY ' '                                                          
           DISPLAY 'CAT811: W-AST-SUBMIT-COUNT = ' W-AST-SUBMIT-COUNT           
           DISPLAY ' '                                                          
           .                                                                    
                                                                                
       8900-EXIT. EXIT.                                                         
      /                                                                         
       9000-CLOSE-ROUTINE SECTION.                                              
           MOVE '9000-CLOSE-ROUTINE            ' TO W-ROUTINE-1.                
                                                                                
           PERFORM 8900-DISPLAY-CNT THRU 8900-EXIT                              
           DISPLAY 'CAT811: PROGRAM ENDED SUCCESSFULLY'.                        
                                                                                
       9000-EXIT. EXIT.                                                         
