000001* PDX    - CAT521   C0349888 12/31/13 14:31:51 TBLAMUR            00001000
LRM008* SSR 92896 IGNORE MEMO SL=45 AND "W" WITHHELD ASSETS ON FULL             
LRM008*    DELIVERY, WHEN COUNTING DELIVERABLE ASSETS, TO CAUSE REJECT          
LRM008*    THESE ARE THE ONLY TYPES FOUND.                                      
000001* PDX    - CAT521   C0324918 04/03/12 13:21:45 TBLAMUR            00001000
LRM007* SSR 83069 REMOVE QA LOGIC FOR NSCC PROCESSING TODAY MINUS 1.            
000001* PDX    - CAT521   C0309827 03/28/11 08:54:27 TBLAMUR            00001000
LRM006* SSR 76820 DONT REJECT PTR DELIVERY IF ASSETS ALREADY SUBMITTED.         
LRM006* PTR ASSETS SENT TO CL 63 ON CYCLE 1 DID NOT GET TO DTCC UNTIL           
LRM006* CYCLE 2, ASSETS PEND=Y NOT COUNTED, WE BUILT REJECT ON CYCLE 2.         
000001* PDX    - CAT521   C0304402 11/22/10 13:16:55 TBLAMUR            00001000
LRM005* SSR 73420 ALSO CHECK PTR DELIVERY ON CYCLE 2.                           
000001* PDX    - CAT521   C0294375 04/09/10 10:39:22 TBEDTAK            00001000
ET0001* SSR 66264 ENHANCE AUTOSUBMIT LOGIC ON FULL TRNFR STAT 110(RQA).         
000001* PDX    - CAT521   C0271185 10/02/08 07:47:11 TBLAMUR            00001000
LRM004* TASK TO CORRECT AUTO REJECT CREATION ON FUL WHEN ASSETS                 
      * WERE ALREADY MARKED AS SUBMIT.                                          
000001* PDX    - CAT521   C0266342 08/11/08 15:23:37 TBDOJUN            00001000
      * DJ0002 SSR 55644 CREATE REJECT IF FUL TRANSFER IS FLAT.         00001000
      * DJ0002 IF THERE IS ONE DEBIT BALANCE OR NO ASSETS, REJECT.      00001000
000001* PDX    - CAT521   C0260091 07/07/08 16:39:57 TBDOJUN            00001000
      * DJ0001 SSR 55766 BYPASS ASCENDIS(NSCC_ACK_IND='A') CLIENTS      00001000
000001* PDX    - CAT521   C0257990 12/07/07 14:18:06 TBLAMUR            00001000
LRM003* TASK 55596 CORRECT SBMT BRKR ON TI FOR AUTO REJECT CREATION             
000001* PDX    - CAT521   C0256091 10/25/07 10:13:11 TBLAMUR            00001000
LRM002* TASK 54932 COPY AUTO REJECT OF PTR DELIVERY FROM CAT811                 
000001* PDX    - CAT521   C0255036 10/02/07 10:58:43 TBLAMUR            00001000
LRM001* SSR 51567 CONTINUED, DONT SUBMIT CYCLE 1 STATUS 110 CHANGES             
LRM001* ON THE SAME DAY THE TIF CHANGE OCCURED.                                 
000001* PDX    - CAT521   C0249658 08/23/07 10:15:41 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT521.                                                     
      *****************************************************************         
      * THIS PROGRAM CONTAINS DB2.                                    *         
      *****************************************************************         
      * CAT521 - SUBMIT ASSETS ON CYCLE 1 FOR SIAC SHORTEN CYCLES.    *         
      *                                                               *         
      * FOR TRANSFER IN THESE STATUS, SUBMIT ASSETS FOR 'FUL' ONLY,   *         
      * WHEN THE CYCLE 1 SIAC TRANSACTION FILE COMES IN.              *         
      *                                                               *         
      * FUL STATUS:                                                   *         
      *            100 (REQUEST)                                      *         
      *            110 (REQUEST ADJUST)                               *         
LRM001*                ONLY SUBMIT WHEN CHANGE DID NOT OCCUR TODAY.   *         
      *            120 (REQUEST-ADJUST-PAST)                          *         
      *            130 (REQUEST-PAST)                                 *         
      *                                                               *         
      * WHEN DAYS-IN-STATUS = B1#434516 DAYS,                         *         
      * SUBMIT (MOVE BLANK TO NSCC-PEND-CD) THE ASSETS.               *         
      *                                                               *         
      * INPUT  -                                                      *         
      *        - EXTRACTED NSCC FILE BQQQ.CAT511.ACATTRNS             *         
      *          (GET CYCLE NUMBER FROM THIS FILE)                    *         
      *        - B1                                                   *         
      * OUTPUT -                                                      *         
      *        - DB2 DATABASE                                         *         
      *---------------------------------------------------------------*         
LRM002* THIS PROGRAM IS SUBMITTING PTR DELVERY ASSETS ON TH2 2ND DAY  *         
LRM002* FUL AUTO-FULFILL PTR CLIENTS, B1 434714 > 1.                  *         
      *                                                               *         
LRM002* AS COPIED FROM CAT811:                                        *         
      * AUTO REJECT PTRS ON NEXT DAY WHEN NO ASSETS EXIST ON ACTIAST  *         
      *  FOR AUTO FULFILL CLIENTS ONLY, B1 434714 > 1.                *         
LRM002* (NOTE ASOF 10/22/07 REGULATORY CHANGE, MAX SETTING 434714=1). *         
      *  WHEN REJECT ALREADY EXISTS ON ACTITRF, UPDATE IT TO SUBMIT.  *         
      *                                                               *         
      *                                                               *         
      * SELECT PTR TRANSFER DELIVERY REQUESTS ON ACTIVE DB2 TABLE,    *         
      * WHERE STATUS = 500(MEMO REQUEST).  SEE PTR_CURSOR             *         
      *                                                               *         
      * IF DAYS-IN-STATUS = B1#434714 DAYS, MOVE ' ' TO NSCC-PEND-CD. *         
      *                                                               *         
      * INPUT  -                                                      *         
      *        - VTRNFR - ACATS ACTIVE TRANFER DB2 TABLE              *         
      *        - B1                                                   *         
      * OUTPUT -                                                      *         
      *        - DB2 DATABASE                                         *         
      *****************************************************************         
      * 07/13/07 DJ    NEW PROGRAM                                    *         
      *****************************************************************         
      /                                                                         
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT INFILE           ASSIGN       TO INFILE                       
                                   FILE STATUS  IS INFILE-FILE-STATUS.          
      /                                                                         
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
       FD  INFILE                                                               
           RECORDING MODE IS V                                                  
           RECORD IS VARYING IN SIZE FROM 1 TO 3326 CHARACTERS                  
              DEPENDING ON W-REC-LEN-IN                                         
           BLOCK CONTAINS 0 RECORDS.                                            
                                                                                
           COPY NSCCMEXT REPLACING ==:NSCCMEXT:== BY ==INFILE==.                
      /                                                                         
       WORKING-STORAGE SECTION.                                                 
           COPY PDXIDCOB.                                                       
                                                                                
       01  W-FIELDS.                                                            
           05  W-PGM-NAME                PIC  X(008) VALUE 'CAT521'.            
           05  W-ROUTINE-1               PIC  X(032) VALUE ' '.                 
           05  W-FIRST-TIME-SW           PIC  X(001) VALUE '0'.                 
               88 NOT-FIRST-TIME                     VALUE '1'.                 
           05  END-OF-INPUT-SW           PIC  X(001) VALUE '0'.                 
               88 END-OF-INPUT                       VALUE '1'.                 
           05  INFILE-FILE-STATUS        PIC  X(002).                           
               88 INFILE-OKAY            VALUE '00' THRU '09', '97'.            
               88 INFILE-END-OF-FILE     VALUE '10'.                            
               88 INFILE-EMPTY-MISSING   VALUE '35'.                            
           05  INFILE-DATE-SW            PIC  X(001) VALUE ' '.                 
               88 INFILE-DATE-FOUND                  VALUE 'Y'.                 
           05  FILLER                    PIC  X(008) VALUE 'RECLENIN'.          
           05  W-REC-LEN-IN              PIC  9(005) VALUE 0.                   
           05  FILLER                    PIC  X(008) VALUE 'RECLENOT'.          
           05  W-REC-LEN-OUT             PIC  9(005) VALUE 0.                   
           05  FILLER                    PIC  X(008) VALUE 'INPUTCNT'.          
           05  W-INFILE-CNT              PIC  9(009) COMP-3 VALUE 0.            
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
080207     05  WS-BPD-TYPE-OF-DAY-CODE   PIC X.                                 
080207         88  WS-BPD-TRADE-DAY-ONLY          VALUE '1'.                    
080207     05  DAY-SUB                  PIC  S9(04) COMP.                       
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'WORKFLDS'.           
                                                                                
       01  WORK-FIELDS.                                                         
           05  FILLER                    PIC  X(008) VALUE 'W-CYCLE='.          
           05  W-SAVE-CYCLE-NBR          PIC  X(002) VALUE '00'.                
           05  W-TRANSFER-FND-SW         PIC  X(001) VALUE ' '.                 
               88 W-TRANSFER-FOUND                   VALUE 'Y'.                 
           05  W-ACTITRF-FND-SW          PIC  X(001) VALUE ' '.                 
               88 W-ACTITRF-FOUND                    VALUE 'Y'.                 
           05  W-FUL-FETCH-CNT           PIC  9(009) COMP-3 VALUE 0.            
           05  W-PTR-FETCH-CNT           PIC  9(009) COMP-3 VALUE 0.            
           05  W-FUL-SUBMIT-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-PTR-SUBMIT-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-FUL-ASSET-CNT           PIC  9(009) VALUE 0.                   
           05  W-PTR-ASSET-CNT           PIC  9(009) VALUE 0.                   
LRM002     05  W-ACTITRF-UPD-CNT         PIC  9(009) COMP-3 VALUE 0.            
LRM002     05  W-ACTITRF-ADD-CNT         PIC  9(009) COMP-3 VALUE 0.            
LRM002     05  W-ACTITRF-DEL-CNT         PIC  9(009) COMP-3 VALUE 0.            
LRM002     05  W-VTRNFR-UPD-CNT          PIC  9(009) COMP-3 VALUE 0.            
LRM002     05  W-VTRNFR-NOT-UPD-CNT      PIC  9(009) COMP-3 VALUE 0.            
LRM002     05  W-ACTIAST-ROW-CNT         PIC S9(4) COMP VALUE +0.               
           05  W-CURRENT-CLIENT          PIC  X(004).                           
           05  W-CURRENT-CLIENT-N REDEFINES                                     
               W-CURRENT-CLIENT          PIC  9(004).                           
           05  W-CURRENT-BROKER          PIC  X(004).                           
           05  W-CURRENT-STREAM          PIC  X(001).                           
           05  W-BH-ACAT-SUBMIT-ASSETS   PIC  X(001).                           
           05  W-BH-ACAT-SUBMIT-ASSETS-N REDEFINES                              
               W-BH-ACAT-SUBMIT-ASSETS   PIC  9(001).                           
           05  W-BH-DAYS-STTS-QTY        PIC S9(004) USAGE COMP.                
           05  W-BH-ACAT-SUBMIT-PTR      PIC  X(001).                           
           05  W-BH-ACAT-SUBMIT-PTR-N    REDEFINES                              
               W-BH-ACAT-SUBMIT-PTR      PIC  9(001).                           
           05  W-BH-DAYS-STTS-QTY-PTR    PIC S9(004) USAGE COMP.                
           05  W-BH-NSCC-PEND-CD         PIC  X(001) VALUE ' '.                 
                                                                                
       01  W-FETCH-AREA.                                                        
           05  WF-CLIENT-NBR             PIC  X(004).                           
           05  WF-ACAT-CONTROL-NBR       PIC  X(014).                           
           05  WF-DLVR-NBR               PIC  X(004).                           
           05  WF-ACCT-DLVR-NBR          PIC  X(020).                           
           05  WF-RCV-NBR                PIC  X(004).                           
           05  WF-ACCT-RCV-NBR           PIC  X(020).                           
           05  WF-TRNFR-TYPE-CD          PIC  X(003).                           
           05  WF-TRANS-TYPE-CD          PIC  X(001).                           
           05  WF-PRCS-DT                PIC  X(010).                           
           05  WF-STTS-CD                PIC  X(003).                           
           05  WF-NSCC-PEND-CD           PIC  X(001).                           
           05  WF-BRANCH-ACCT            PIC  X(008).                           
           05  FILLER REDEFINES WF-BRANCH-ACCT.                                 
               07  WF-BRANCH-CD          PIC  X(003).                           
               07  WF-ACCT-CD            PIC  X(005).                           
      /                                                                         
       01  FILLER                        PIC  X(008) VALUE 'B1-TABLE'.          
       01  B1-TABLE-AREA.                                                       
           03  B1-TABLE OCCURS 500 TIMES.                                       
               05  B1-ADP-CL-NO          PIC  9(004).                           
               05  B1-CLI-NAME           PIC  X(030).                           
               05  B1-BKR-CLR-NO         PIC  X(004).                           
               05  B1-STREAM             PIC  X(001).                           
               05  B1-STATUS             PIC  X(001).                           
               05  B1-ACAT-STATUS        PIC  X(001).                           
               05  B1-SUBMIT-ASSETS      PIC  X(001).                           
               05  B1-SUBMIT-ASSETS-PTR  PIC  X(001).                           
       01  B1-WORK-FIELEDS.                                                     
           03  B1-TBL-CNT                PIC  9(003) VALUE 0.                   
           03  B1-SUB                    PIC  9(003) VALUE 0.                   
           03  B1-STREAM-CNT             PIC  9(003) VALUE 0.                   
      /                                                                         
      ******************************************************************        
      * NSCC EXTRACT FILE                                              *        
      ******************************************************************        
       01  FILLER PIC X(016) VALUE 'CURRENT-RECORD='.                           
       01  FILLER                        PIC X(008) VALUE 'W-NSCC'.             
           COPY NSCCMEXT REPLACING ==:NSCCMEXT:==  BY ==W-NSCC==.               
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
      ******************************************************************        
      * TRANSFER ACTIVE TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'VTRNFR'.             
           EXEC SQL INCLUDE VTRNFR       END-EXEC.                              
      /                                                                         
      ******************************************************************        
      * TRANSFER INIT   TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'ACTITRF'.            
           EXEC SQL INCLUDE ACTITRF      END-EXEC.                              
      /                                                                         
      ******************************************************************        
      * ASSET    INIT   TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'ACTIAST'.            
           EXEC SQL INCLUDE ACTIAST      END-EXEC.                              
      /                                                                         
      ******************************************************************        
      * DECLARE CURSOR FOR ACTIVE TRANSFER TABLE                       *        
      * TO GET ALL FULL DELIVER TRANSFERS IN REQ OR REQ-ADJ STATUS     *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'FUL-CSR'.            
           EXEC SQL                                                             
                DECLARE FUL_CURSOR CURSOR WITH HOLD FOR                         
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
                        TRNFR_TYPE_CD = 'FUL'                AND                
                       (STTS_CD IN ('100', '110', '120', '130')) AND            
                       (TRANS_TYPE_CD      <> 'R')           AND                
                       (ACCT_DPLCT_TRN_IND <> 'Y')                              
DJ0001             AND (NOT NSCC_ACK_IND = 'A')                                 
                                                                                
DJ0002          FOR UPDATE OF                                                   
DJ0002                  CICS_TERM_ID_CD                                         
DJ0002                 ,UPDT_TMSTP                                              
DJ0002                 ,PRGM_NM                                                 
DJ0002                 ,TRNFR_TYPE_RJC2_CD                                      
           END-EXEC.                                                            
      /                                                                         
      ******************************************************************        
      * DECLARE CURSOR FOR ACTIVE TRANSFER TABLE                       *        
      * TO GET ALL PTR  DELIVER TRANSFERS IN REQ STATUS                *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'PTR-CSR'.            
           EXEC SQL                                                             
                DECLARE PTR_CURSOR CURSOR WITH HOLD FOR                         
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
DJ0001             AND (NOT NSCC_ACK_IND = 'A')                                 
                                                                                
LRM002          FOR UPDATE OF                                                   
LRM002                  CICS_TERM_ID_CD                                         
LRM002                 ,UPDT_TMSTP                                              
LRM002                 ,PRGM_NM                                                 
LRM002                 ,TRNFR_TYPE_RJC2_CD                                      
           END-EXEC.                                                            
      /                                                                         
      ******************************************************************        
      * DB2 COMMAREA                                                   *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'SQLCA   '.           
           EXEC SQL INCLUDE SQLCA        END-EXEC.                              
                                                                                
      ******************************************************************        
      * DB2 ERROR MESSAGE AREA                                         *        
      ******************************************************************        
       01  W-DB2-MESSAGE-AREA.                                                  
           05  W-DB2-MSG-LEN             PIC S9(004) COMP VALUE +960.           
           05  W-DB2-ERROR-MSG           PIC  X(080) OCCURS 12 TIMES            
                   INDEXED BY W-DB2-IDX.                                        
       01  W-DB2-MESSAGE-LEN             PIC S9(009) COMP VALUE +80.            
                                                                                
       01  W-DB2-WORKAREA.                                                      
           05  ROLLBACK-SQLCA            PIC  X(122).                           
           05  ROLLBACK-RETURN           PIC S9(009) COMP.                      
               88  ROLLBACK-OK                VALUE +0.                         
               88  ROLLBACK-AB                VALUE -999 THRU -1                
                                                      +1 THRU +999.             
           05  COMMIT-SQLCA              PIC  X(122).                           
           05  COMMIT-RETURN             PIC S9(009) COMP.                      
               88  COMMIT-OK                  VALUE +0.                         
               88  COMMIT-AB                  VALUE -999 THRU -1                
                                                      +1 THRU +999.             
           05  W-COMMIT-CNT              PIC  9(009) VALUE 0.                   
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(011) VALUE 0.                   
           05  W-DB2-TABLE-NAME          PIC  X(008).                           
           05  W-DB2-ACTION              PIC  X(008).                           
           05  W-DB2-SQLCODE             PIC  ---9.                             
           05  W-TFR-SQLCODE             PIC S9(009) COMP-4.                    
           05  W-SQLERRD-3               PIC S9(009).                           
           05  W-SQL-UPDATE-COUNT        PIC  9(009) VALUE 0.                   
       01  FILLER                        PIC  X(008) VALUE 'TIMESTMP'.          
       01  W-CURRENT-TIMESTAMP           PIC  X(026).                           
      /                                                                         
      ***===> COBOL LE                                                          
       01  W-ABEND-AREA.                                                        
           05  ABEND-CODE                PIC S9(004) COMP SYNC.                 
       01  CALL-MODULES.                                                        
           05  DSNTIAR                   PIC  X(008) VALUE 'DSNTIAR '.          
       01  FILLER                        PIC  X(008) VALUE 'STUBCPY '.          
           COPY STUBCPY.                                                        
      ***<=== COBOL LE                                                          
                                                                                
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
               88  L-SUBMIT-ASSETS                   VALUE '2'.                 
                                                                                
       PROCEDURE DIVISION USING L-JCL-PARMS.                                    
      *                         ===========                                     
           DISPLAY 'CAT521 - SUBMIT ASSETS IF CYCLE = 1 '                       
                   'AND ACAT-DAYS >= B1-DAYS '                                  
           DISPLAY ' '.                                                         
           COPY MSGCOBO.                                                        
           DISPLAY ' '.                                                         
                                                                                
           PERFORM 1000-INIT           THRU 1000-EXIT.                          
                                                                                
ET0001**   IF INFILE-HDR-CYCLE-NBR = '01'                                       
ET0001     IF INFILE-HDR-CYCLE-NBR = '01' OR '02' OR '03'                       
           OR L-SUBMIT-ASSETS                                                   
              PERFORM 2000-PROCESS-INPUT THRU 2000-EXIT                         
           END-IF.                                                              
                                                                                
           PERFORM 9000-CLOSE-ROUTINE THRU 9000-EXIT.                           
                                                                                
           GOBACK.                                                              
      /                                                                         
       1000-INIT SECTION.                                                       
           MOVE '1000-INIT                     ' TO W-ROUTINE-1.                
                                                                                
           EXEC SQL                                                             
               SET :W-CURRENT-TIMESTAMP = CURRENT TIMESTAMP                     
           END-EXEC                                                             
                                                                                
           IF  SQLCODE = +0                                                     
               DISPLAY ' '                                                      
               DISPLAY 'CAT521: W-CURRENT-TIMESTAMP = '                         
                                                    W-CURRENT-TIMESTAMP         
               DISPLAY ' '                                                      
           ELSE                                                                 
               DISPLAY 'CAT521: W-CURRENT-TIMESTAMP NOT SET'                    
               MOVE SQLCODE      TO W-DB2-SQLCODE                               
               DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                               
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                           
           END-IF.                                                              
                                                                                
           DISPLAY 'CAT521: L-STREAM         = '                                
                            L-STREAM                                            
           DISPLAY 'CAT521: L-BYP-DATECHK-SW = '                                
                            L-BYP-DATECHK-SW                                    
           ' (1=BYPASS DATE CHECK)'                                             
           DISPLAY 'CAT521: L-BYP-FILECHK-SW = '                                
                            L-BYP-FILECHK-SW                                    
           ' (1=BYPASS FILE CHECK. BYPASS EMPTY FILE,DB2 ABENDS.)'              
           ' (2=SUBMIT ASSETS DURING THIS CYCLE.)'                              
           IF  L-BYP-DATECHK                                                    
               DISPLAY 'CAT521: DATE CHECK WILL BE BYPASSED'                    
           ELSE                                                                 
               DISPLAY 'CAT521: DATE CHECK WILL BE PERFORMED'                   
           END-IF.                                                              
           IF  L-BYP-FILECHK                                                    
               DISPLAY 'CAT521: FILE CHECK WILL BE BYPASSED'                    
           ELSE                                                                 
               DISPLAY 'CAT521: FILE CHECK WILL BE PERFORMED'                   
           END-IF.                                                              
           IF  L-BYP-FILECHK                                                    
               DISPLAY 'CAT521: L-BYP-FILECHK-SW = '                            
                                L-BYP-FILECHK-SW                                
                              ' (1=FORCE SUBMIT ASSETS.)'                       
           END-IF                                                               
                                                                                
           MOVE 'CAT521'                  TO BPDATES-CALLING-PGM.               
           SET  LNKDATZ-REQUEST           TO TRUE.                              
           CALL BPDATES USING BPDATES-PARAMETERS.                               
           MOVE BPD-PROC-DATE(3:2)        TO LD-PROC-DATE-YY.                   
           MOVE BPD-PROC-DATE(5:2)        TO LD-PROC-DATE-MM.                   
           MOVE BPD-PROC-DATE(7:2)        TO LD-PROC-DATE-DD.                   
           MOVE BPD-PROC-DATE(1:4)        TO W-PROC-DT-YEAR.                    
           MOVE BPD-PROC-DATE(5:2)        TO W-PROC-DT-MM.                      
           MOVE BPD-PROC-DATE(7:2)        TO W-PROC-DT-DD.                      
           DISPLAY ' '.                                                         
           DISPLAY 'CAT521:       BPD-PROC-DATE =' BPD-PROC-DATE                
                                '  LD-PROC-DATE =' LD-PROC-DATE                 
           DISPLAY 'CAT521: BPD-PRIOR-PROC-DATE =' BPD-PRIOR-PROC-DATE          
           DISPLAY 'CAT521:         W-PROC-DT   =' W-PROC-DT                    
           DISPLAY 'CAT521: BPD-JULIAN-PROC-DATE=' BPD-JULIAN-PROC-DATE         
                                                                                
080207     MOVE  BPD-TYPE-OF-DAY-CODE    TO WS-BPD-TYPE-OF-DAY-CODE             
080207     DISPLAY 'BPDATES TYPE OF DAY ' WS-BPD-TYPE-OF-DAY-CODE               
080207     IF WS-BPD-TRADE-DAY-ONLY                                             
080207        DISPLAY 'BANK HOLIDAY / TRADE DAY ONLY'                           
080207     ELSE                                                                 
080207        DISPLAY 'NON BANK HOLIDAY'                                        
080207     END-IF                                                               
                                                                                
           OPEN INPUT INFILE.                                                   
           DISPLAY 'CAT521: INFILE   OPENED FOR INPUT.  STATUS = '              
                                               INFILE-FILE-STATUS.              
                                                                                
           IF  INFILE-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT521: ERROR OPENING INFILE'                           
               DISPLAY 'CAT521: OPEN STATUS = ' INFILE-FILE-STATUS              
               DISPLAY 'CAT521: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           PERFORM 1200-CHECK-HDR-REC  THRU 1200-EXIT.                          
                                                                                
           DISPLAY 'CAT521: W-SAVE-CYCLE-NBR = '                                
                            W-SAVE-CYCLE-NBR                                    
           IF  W-SAVE-CYCLE-NBR = '01'                                          
               DISPLAY 'CAT521: W-SAVE-CYCLE-NBR = 01.'                         
                      ' ASSETS WILL BE SUBMITTED'                               
           ELSE                                                                 
              IF  L-BYP-FILECHK                                                 
                  DISPLAY 'CAT521: L-BYP-FILECHK-SW = 1.'                       
                         ' ASSETS WILL BE SUBMITTED'                            
              ELSE                                                              
                  DISPLAY 'CAT521: W-SAVE-CYCLE-NBR NOT = 01 '                  
                       '(' W-SAVE-CYCLE-NBR ').'                                
                         ' ASSETS WILL NOT BE SUBMITTED'                        
              END-IF                                                            
           END-IF.                                                              
                                                                                
           PERFORM 1500-LOAD-B1          THRU 1500-EXIT.                        
           DISPLAY ' '.                                                         
                                                                                
       1000-EXIT. EXIT.                                                         
      /                                                                         
      ******************************************************************        
      *  READ THE HDR REC  TO GET THE TIMESTAMP                                 
      *  FOR THE LAST TIME WE TRANSMITTED TO NSCC                               
      ******************************************************************        
       1200-CHECK-HDR-REC  SECTION.                                             
           MOVE '1200-CHECK-HDR-REC            ' TO W-ROUTINE-1.                
                                                                                
           PERFORM 1300-READ-INPUT THRU 1300-EXIT                               
                                                                                
           IF  END-OF-INPUT                                                     
               DISPLAY 'CAT521: END OF INPUT REACHED. FILE IS EMPTY'            
               IF  L-BYP-FILECHK                                                
                   DISPLAY 'CAT521: BYPASSING FILE CHECK PER JCLPARM'           
                   GO TO 1200-EXIT                                              
               ELSE                                                             
                   DISPLAY 'CAT521: U3003 - ABENDING ON EMPTY FILE'             
                   MOVE +3003    TO ABEND-CODE                                  
                   CALL ABEND USING ABEND-CODE                                  
               END-IF                                                           
           END-IF.                                                              
           IF  INFILE-HDR-RECORD                                                
               MOVE INFILE-HDR-CYCLE-NBR TO W-SAVE-CYCLE-NBR                    
               DISPLAY 'CAT521: INFILE-HDR-CYCLE-NBR = '                        
                                INFILE-HDR-CYCLE-NBR                            
               SET INFILE-DATE-FOUND TO TRUE                                    
               DISPLAY 'CAT521: INFILE  DATE = '                                
                                              INFILE-HDR-PROC-DATE              
                             ', UPDT BY PGM=' INFILE-HDR-PGM-NAME               
                                     ' DATE=' INFILE-HDR-SYS-DATE               
                                     ' TIME=' INFILE-HDR-SYS-TIME               
               IF  INFILE-HDR-PROC-DATE = LD-PROC-DATE                          
                   DISPLAY 'CAT521: INFILE  DATE = PROC DATE. OKAY'             
               ELSE                                                             
                   DISPLAY 'CAT521: INFILE  DATE NOT = PROC DATE'               
                   IF L-BYP-DATECHK                                             
                   DISPLAY 'CAT521: BYPASSING DATE CHECK PER JCLPARM'           
                   ELSE                                                         
                      DISPLAY 'CAT521: U3004 - ABENDING ON BAD DATE'            
                      MOVE +3004    TO ABEND-CODE                               
                      CALL ABEND USING ABEND-CODE                               
                   END-IF                                                       
               END-IF                                                           
           ELSE                                                                 
               DISPLAY 'CAT521: INFILE  DATE RECORD MISSING'                    
                   IF L-BYP-DATECHK                                             
                   DISPLAY 'CAT521: BYPASSING DATE CHECK PER JCLPARM'           
                   ELSE                                                         
                      DISPLAY 'CAT521: U3005 - ABENDING ON BAD DATE'            
                      MOVE +3005    TO ABEND-CODE                               
                      CALL ABEND USING ABEND-CODE                               
                   END-IF                                                       
           END-IF.                                                              
                                                                                
           DISPLAY ' '.                                                         
                                                                                
       1200-EXIT. EXIT.                                                         
      /                                                                         
      ******************************************************************        
      *  READ THE NSCC FILE AND MOVE TO WORKING-STORAGE.                        
      ******************************************************************        
       1300-READ-INPUT SECTION.                                                 
           MOVE '1300-READ-INPUT            ' TO W-ROUTINE-1.                   
                                                                                
           IF  END-OF-INPUT                                                     
               DISPLAY 'CAT521: WARNING - READING AFTER EOF'                    
               GO 1300-EXIT                                                     
           END-IF.                                                              
                                                                                
           READ INFILE                                                          
                AT END                                                          
                   MOVE '1'              TO END-OF-INPUT-SW                     
                   DISPLAY 'CAT521: END OF INPUT REACHED'                       
                            '.  INPUT-CNT = ' W-INFILE-CNT                      
                   GO TO 1300-EXIT                                              
           END-READ.                                                            
                                                                                
           ADD  1                        TO W-INFILE-CNT.                       
                                                                                
           IF  INFILE-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT521: ERROR READING INFILE'                           
               DISPLAY 'CAT521: READ STATUS = ' INFILE-FILE-STATUS              
                            '.  INPUT-CNT = ' W-INFILE-CNT                      
               DISPLAY 'CAT521: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           MOVE SPACES                   TO W-NSCC-RECORD.                      
           MOVE W-REC-LEN-IN             TO W-REC-LEN-OUT.                      
                                                                                
           MOVE INFILE-RECORD   (1 : W-REC-LEN-IN) TO                           
                W-NSCC-RECORD   (1 : W-REC-LEN-IN).                             
                                                                                
           IF  INFILE-HDR-RECORD                                                
               DISPLAY 'CAT521: INFILE-HDR-REC = '                              
                                                 INFILE-HDR-REC (1:120)         
               GO TO 1300-EXIT                                                  
           ELSE                                                                 
               IF  INFILE-TRL-RECORD                                            
                   DISPLAY 'CAT521: INFILE-TRL-REC = '                          
                                                 INFILE-TRL-REC (1:120)         
                   GO TO 1300-READ-INPUT                                        
               END-IF                                                           
           END-IF.                                                              
                                                                                
       1300-EXIT. EXIT.                                                         
      /                                                                         
       1500-LOAD-B1 SECTION.                                                    
           DISPLAY 'CAT521: 1500-LOAD-B1'.                                      
                                                                                
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
                   IF  BH-ACAT-SUBMIT-ASSETS NOT NUMERIC                        
                       MOVE '0' TO BH-ACAT-SUBMIT-ASSETS                        
                   END-IF                                                       
                   MOVE  BH-ACAT-SUBMIT-ASSETS                                  
                                       TO B1-SUBMIT-ASSETS(B1-TBL-CNT)          
                   IF  BH-ACAT-SUBMIT-ASSETS-PTR NOT NUMERIC                    
                       MOVE '0' TO BH-ACAT-SUBMIT-ASSETS-PTR                    
                   END-IF                                                       
                   MOVE  BH-ACAT-SUBMIT-ASSETS-PTR                              
                                   TO B1-SUBMIT-ASSETS-PTR(B1-TBL-CNT)          
                   IF  B1-STREAM (B1-TBL-CNT) = L-STREAM                        
                       DISPLAY     'CNT=' B1-TBL-CNT                            
                                    ' CLT ' B1-ADP-CL-NO  (B1-TBL-CNT)          
                                        ' ' B1-CLI-NAME   (B1-TBL-CNT)          
                                    ' BKR ' B1-BKR-CLR-NO (B1-TBL-CNT)          
                                    ' STR ' B1-STREAM     (B1-TBL-CNT)          
                                    ' STA ' B1-STATUS     (B1-TBL-CNT)          
                                   ' ACAT ' B1-ACAT-STATUS(B1-TBL-CNT)          
                           ' FUL-SUBMIT ' B1-SUBMIT-ASSETS(B1-TBL-CNT)          
                       ' PTR-SUBMIT ' B1-SUBMIT-ASSETS-PTR(B1-TBL-CNT)          
                       ADD 1 TO B1-STREAM-CNT                                   
                   END-IF                                                       
             END-IF                                                             
                                                                                
           END-PERFORM.                                                         
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY  'B1-STREAM-CNT= ' B1-STREAM-CNT                             
                    ' # OF CLIENTS FOR THIS STREAM'                             
                    ' THAT ARE ACATS CLIENTS'.                                  
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
                  IF B1-SUBMIT-ASSETS(B1-SUB) = '0'                             
                     DISPLAY  'CLT=' W-CURRENT-CLIENT                           
                          ' BROKER=' W-CURRENT-BROKER                           
                          ' BYPASSED FUL BECAUSE'                               
                          ' BH-ACAT-SUBMIT-ASSETS(434516) = 0'                  
                  ELSE                                                          
                     PERFORM 3000-FETCH-FUL THRU 3000-EXIT                      
                  END-IF                                                        
                  IF B1-SUBMIT-ASSETS-PTR(B1-SUB) = '0'                         
                     DISPLAY  'CLT=' W-CURRENT-CLIENT                           
                          ' BROKER=' W-CURRENT-BROKER                           
                          ' BYPASSED PTR BECAUSE'                               
                          ' BH-ACAT-SUBMIT-ASSETS-PTR(434714) = 0'              
                  ELSE                                                          
LRM005            IF INFILE-HDR-CYCLE-NBR = '01' OR '02'                        
                     PERFORM 4000-FETCH-PTR THRU 4000-EXIT                      
ET0001            END-IF                                                        
                  END-IF                                                        
              END-IF                                                            
                                                                                
           END-PERFORM.                                                         
                                                                                
       2000-EXIT. EXIT.                                                         
      /                                                                         
      ******************************************************************        
      *  IF FULL TRANSFER REQUEST, AND WE ARE THE DELIVERER,                    
      *     LOAD ASSETS                                                         
      ******************************************************************        
       3000-FETCH-FUL SECTION.                                                  
           MOVE '3000-FETCH-FUL        ' TO W-ROUTINE-1.                        
           MOVE B1-SUBMIT-ASSETS(B1-SUB)                                        
                                      TO W-BH-ACAT-SUBMIT-ASSETS.               
           MOVE W-BH-ACAT-SUBMIT-ASSETS-N TO W-BH-DAYS-STTS-QTY.                
                                                                                
           EXEC SQL OPEN FUL_CURSOR END-EXEC                                    
                                                                                
           MOVE SQLCODE      TO W-DB2-SQLCODE                                   
           MOVE SQLCODE      TO W-TFR-SQLCODE                                   
           IF SQLCODE NOT = +0                                                  
              DISPLAY 'CLT=' W-CURRENT-CLIENT                                   
                     ' FUL CURSOR OPEN ERROR '                                  
                            'SQLCODE = ' W-DB2-SQLCODE                          
           END-IF                                                               
                                                                                
           PERFORM UNTIL W-TFR-SQLCODE NOT = +0                                 
                                                                                
              ADD 1 TO W-FUL-FETCH-CNT                                          
                                                                                
              EXEC SQL                                                          
                   FETCH FUL_CURSOR                                             
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
                   ,:DCLVTRNFR.ACCT-RB-SEC-IND                                  
              END-EXEC                                                          
                                                                                
              MOVE SQLCODE      TO W-DB2-SQLCODE                                
              MOVE SQLCODE      TO W-TFR-SQLCODE                                
              EVALUATE SQLCODE                                                  
                  WHEN +0                                                       
                       PERFORM 3500-LOAD     THRU 3500-EXIT                     
                  WHEN +100                                                     
                       DISPLAY 'CLT=' W-CURRENT-CLIENT                          
                              ' FUL CURSOR FETCH NOT FOUND '                    
                              ' SQLCODE = ' W-DB2-SQLCODE                       
                  WHEN OTHER                                                    
                       DISPLAY 'CLT=' W-CURRENT-CLIENT                          
                              ' FUL CURSOR FETCH ERROR '                        
                              ' SQLCODE = ' W-DB2-SQLCODE                       
                       PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   
              END-EVALUATE                                                      
                                                                                
           END-PERFORM                                                          
                                                                                
           EXEC SQL                                                             
                CLOSE FUL_CURSOR                                                
           END-EXEC                                                             
                                                                                
           MOVE SQLCODE      TO W-DB2-SQLCODE                                   
           MOVE SQLCODE      TO W-TFR-SQLCODE                                   
           IF  SQLCODE NOT = +0                                                 
                       DISPLAY 'CLT=' W-CURRENT-CLIENT                          
                      ' FUL CURSOR CLOSE ERROR '                                
                      ' SQLCODE = ' W-DB2-SQLCODE                               
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                           
           END-IF.                                                              
                                                                                
       3000-EXIT. EXIT.                                                         
      /                                                                         
      ******************************************************************        
      *  GET FUL                                                                
      ******************************************************************        
       3500-LOAD                SECTION.                                        
           MOVE '3500-LOAD            ' TO W-ROUTINE-1.                         
                                                                                
      ***CHECK JULIAN DATE.  IT HAS TO BE YESTERDAYS DATE.                      
      ***DO NOT PROCESS TODAYS TRANSFERS. ALSO, QA IS ONE DAY BEHIND.           
           IF (ACAT-CONTROL-NBR OF DCLVTRNFR(1:7) =                             
                                                 BPD-JULIAN-PROC-DATE)          
**********    DISPLAY 'CLT=' CLIENT-NBR       OF DCLVTRNFR                      
**********               ' ' TRNFR-TYPE-CD    OF DCLVTRNFR                      
**********           ' CTL=' ACAT-CONTROL-NBR OF DCLVTRNFR                      
**********           ' SKIPPED BECAUSE JULIAN DATE'                             
**********         '(' ACAT-CONTROL-NBR OF DCLVTRNFR(1:7) ')'                   
**********         ' = BPD-JULIAN-PROC-DATE'                                    
**********         '(' BPD-JULIAN-PROC-DATE ')'                                 
              GO TO 3500-EXIT                                                   
           END-IF                                                               
                                                                                
LRM001***DO NOT PROCESS TODAYS CHANGED TRANSFERS.                               
ET0001     IF INFILE-HDR-CYCLE-NBR = '01'                                       
LRM001     AND STTS-CD OF DCLVTRNFR = '110'                                     
LRM001     AND PRGM-NM OF DCLVTRNFR = 'CAT519'                                  
LRM001     AND UPDT-TMSTP OF DCLVTRNFR(1:10) = W-PROC-DT                        
ET0001     AND (STTLM-TM-CD OF DCLVTRNFR NOT = 'L')                             
LRM001        DISPLAY 'CLT=' CLIENT-NBR       OF DCLVTRNFR                      
LRM001                   ' ' TRNFR-TYPE-CD    OF DCLVTRNFR                      
LRM001               ' CTL=' ACAT-CONTROL-NBR OF DCLVTRNFR                      
LRM001               ' SKIPPED BECAUSE TIF CHANGE TODAY'                        
LRM001        GO TO 3500-EXIT                                                   
LRM001     END-IF                                                               
                                                                                
ET0001     IF (INFILE-HDR-CYCLE-NBR = '02' OR '03')                             
ET0001        IF  STTS-CD OF DCLVTRNFR = '110'                                  
ET0001        AND STTLM-TM-CD OF DCLVTRNFR = 'L'                                
ET0001            CONTINUE                                                      
ET0001        ELSE                                                              
ET0001            DISPLAY 'CLT=' CLIENT-NBR       OF DCLVTRNFR                  
ET0001                       ' ' TRNFR-TYPE-CD    OF DCLVTRNFR                  
ET0001                   ' CTL=' ACAT-CONTROL-NBR OF DCLVTRNFR                  
ET0001                   ' SKIPPED BECAUSE NOT NEEDED'                          
ET0001            GO TO 3500-EXIT                                               
ET0001        END-IF                                                            
ET0001     END-IF                                                               
                                                                                
           MOVE CLIENT-NBR        OF DCLVTRNFR                                  
                                             TO  WF-CLIENT-NBR                  
           MOVE ACAT-CONTROL-NBR  OF DCLVTRNFR                                  
                                             TO  WF-ACAT-CONTROL-NBR            
           MOVE DLVR-NBR          OF DCLVTRNFR                                  
                                             TO  WF-DLVR-NBR                    
           MOVE ACCT-DLVR-NBR     OF DCLVTRNFR                                  
                                             TO  WF-ACCT-DLVR-NBR               
           MOVE RCV-NBR           OF DCLVTRNFR                                  
                                             TO  WF-RCV-NBR                     
           MOVE ACCT-RCV-NBR      OF DCLVTRNFR                                  
                                             TO  WF-ACCT-RCV-NBR                
           MOVE TRNFR-TYPE-CD     OF DCLVTRNFR                                  
                                             TO  WF-TRNFR-TYPE-CD               
           MOVE TRANS-TYPE-CD     OF DCLVTRNFR                                  
                                             TO  WF-TRANS-TYPE-CD               
           MOVE PRCS-DT           OF DCLVTRNFR                                  
                                             TO  WF-PRCS-DT                     
           MOVE STTS-CD           OF DCLVTRNFR                                  
                                             TO  WF-STTS-CD                     
           MOVE NSCC-PEND-CD      OF DCLVTRNFR                                  
                                             TO  WF-NSCC-PEND-CD                
           MOVE WF-ACCT-DLVR-NBR(1:8)    TO WF-BRANCH-ACCT                      
                                                                                
      ***BYPASS REJECTED TRANSFERS                                              
           PERFORM 7000-SELECT-ACTITRF THRU 7000-EXIT                           
           IF  W-ACTITRF-FND-SW = 'Y'                                           
              DISPLAY 'CLT=' CLIENT-NBR OF DCLVTRNFR                            
                         ' ' TRNFR-TYPE-CD    OF DCLVTRNFR                      
                     ' CTL=' ACAT-CONTROL-NBR OF DCLVTRNFR                      
                       ' ACTITRF FOUND '                                        
                       ' RJCT=' TRNFR-TYPE-RJCT-CD OF DCLACTITRF                
                       ' PEND=' NSCC-PEND-CD       OF DCLACTITRF                
                       ' PRGM=' PRGM-NM            OF DCLACTITRF                
                       ' UPDT=' UPDT-TMSTP         OF DCLACTITRF                
                       ' BYPASS REJ'                                            
               IF  TRNFR-TYPE-RJCT-CD OF DCLACTITRF = '  ' OR '00'              
                   CONTINUE                                                     
               ELSE                                                             
                   GO TO 3500-EXIT                                              
               END-IF                                                           
           END-IF.                                                              
                                                                                
           IF  DAYS-STTS-QTY OF DCLVTRNFR >= W-BH-DAYS-STTS-QTY                 
                   DISPLAY 'CLT=' WF-CLIENT-NBR                                 
                              ' ' WF-TRNFR-TYPE-CD                              
                          ' CTL=' WF-ACAT-CONTROL-NBR                           
                          ' ACC=' WF-BRANCH-CD ' ' WF-ACCT-CD                   
                          ' SUBMIT.'                                            
                          ' DAYS(' DAYS-STTS-QTY OF DCLVTRNFR ')'               
                          '>=B1(' W-BH-DAYS-STTS-QTY ') '                       
                          ' STA=' WF-STTS-CD                                    
                          ' PD=' WF-PRCS-DT                                     
                   ADD 1 TO W-FUL-SUBMIT-CNT                                    
                   MOVE ' ' TO W-BH-NSCC-PEND-CD                                
                   PERFORM 6000-SUBMIT-ASSETS THRU 6000-EXIT                    
                   ADD W-SQL-UPDATE-COUNT TO W-FUL-ASSET-CNT                    
                   IF  W-SQL-UPDATE-COUNT > 0                                   
                       PERFORM 8100-SQL-COMMIT THRU 8100-EXIT                   
                   ELSE                                                         
LRM004                PERFORM 6100-COUNT-ASSETS THRU 6100-EXIT                  
LRM004                IF W-ACTIAST-ROW-CNT > 0                                  
LRM004                   DISPLAY 'ACTIAST FUL ALREADY MARKED TO SUBMIT '        
LRM004                     '/ FOUND ' W-ACTIAST-ROW-CNT                         
LRM004                ELSE                                                      
DJ0002                   PERFORM 6700-UPDATE-VTRNFR-FUL THRU 6700-EXIT          
DJ0002                   DISPLAY '   NO ASSETS FOUND. ACCOUNT FLAT.'            
DJ0002                             ' BUILD REJECT.'                             
DJ0002                   PERFORM 6900-INSERT-ACTITRF THRU 6900-EXIT             
                   END-IF                                                       
           END-IF.                                                              
                                                                                
       3500-EXIT. EXIT.                                                         
      /                                                                         
      ******************************************************************        
      *  IF PTR  TRANSFER REQUEST, AND WE ARE THE DELIVERER,                    
      *     LOAD ASSETS                                                         
      ******************************************************************        
       4000-FETCH-PTR SECTION.                                                  
           MOVE '4000-FETCH-PTR        ' TO W-ROUTINE-1.                        
           MOVE B1-SUBMIT-ASSETS-PTR(B1-SUB)                                    
                                       TO W-BH-ACAT-SUBMIT-PTR.                 
           MOVE W-BH-ACAT-SUBMIT-PTR-N TO W-BH-DAYS-STTS-QTY-PTR.               
                                                                                
           EXEC SQL OPEN PTR_CURSOR END-EXEC                                    
                                                                                
           MOVE SQLCODE      TO W-DB2-SQLCODE                                   
           MOVE SQLCODE      TO W-TFR-SQLCODE                                   
           IF SQLCODE NOT = +0                                                  
              DISPLAY 'CLT= ' W-CURRENT-CLIENT                                  
                     ' PTR CURSOR OPEN ERROR '                                  
                            'SQLCODE = ' W-DB2-SQLCODE                          
           END-IF                                                               
                                                                                
           PERFORM UNTIL W-TFR-SQLCODE NOT = +0                                 
                                                                                
              ADD 1 TO W-PTR-FETCH-CNT                                          
                                                                                
              EXEC SQL                                                          
                   FETCH PTR_CURSOR                                             
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
                   ,:DCLVTRNFR.ACCT-RB-SEC-IND                                  
              END-EXEC                                                          
                                                                                
              MOVE SQLCODE      TO W-DB2-SQLCODE                                
              MOVE SQLCODE      TO W-TFR-SQLCODE                                
              EVALUATE SQLCODE                                                  
                  WHEN +0                                                       
                       PERFORM 4500-LOAD     THRU 4500-EXIT                     
LRM002                 MOVE +0 TO W-TFR-SQLCODE                                 
                  WHEN +100                                                     
                       DISPLAY 'CLT=' W-CURRENT-CLIENT                          
                              ' PTR CURSOR FETCH NOT FOUND '                    
                              ' SQLCODE = ' W-DB2-SQLCODE                       
                  WHEN OTHER                                                    
                       DISPLAY 'CLT=' W-CURRENT-CLIENT                          
                              ' PTR CURSOR FETCH ERROR '                        
                              ' SQLCODE = ' W-DB2-SQLCODE                       
                       PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   
              END-EVALUATE                                                      
                                                                                
           END-PERFORM                                                          
                                                                                
           EXEC SQL                                                             
                CLOSE PTR_CURSOR                                                
           END-EXEC                                                             
                                                                                
           MOVE SQLCODE      TO W-DB2-SQLCODE                                   
           MOVE SQLCODE      TO W-TFR-SQLCODE                                   
           IF  SQLCODE NOT = +0                                                 
                       DISPLAY 'CLT= ' W-CURRENT-CLIENT                         
                      ' PTR CURSOR CLOSE ERROR '                                
                      ' SQLCODE = ' W-DB2-SQLCODE                               
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                           
           END-IF.                                                              
                                                                                
       4000-EXIT. EXIT.                                                         
      /                                                                         
      ******************************************************************        
      *  GET PTR                                                                
      ******************************************************************        
       4500-LOAD                SECTION.                                        
           MOVE '4500-LOAD            ' TO W-ROUTINE-1.                         
                                                                                
      ***CHECK JULIAN DATE.  IT HAS TO BE YESTERDAYS DATE.                      
      ***DO NOT PROCESS TODAYS TRANSFERS. ALSO, QA IS ONE DAY BEHIND.           
      ***THIS PROGRAM RUNS WITH QA DATELIB WHICH IS ONE DAY BEHIND.             
LRM007***  IF (L-STREAM = 'Q' AND                                               
LRM007***      ACAT-CONTROL-NBR OF DCLVTRNFR(1:7) =                             
LRM007***                                        BPD-JULIAN-PROC-DATE)          
LRM007***     DISPLAY 'CLT=' CLIENT-NBR OF DCLVTRNFR                            
LRM007***                ' ' TRNFR-TYPE-CD    OF DCLVTRNFR                      
LRM007***            ' CTL=' ACAT-CONTROL-NBR OF DCLVTRNFR                      
LRM007***                ' SKIPPED BECAUSE JULIAN DATE'                         
LRM007***             '(' ACAT-CONTROL-NBR OF DCLVTRNFR(1:7) ')'                
LRM007***             ' = BPD-JULIAN-PROC-DATE'                                 
LRM007***             '(' BPD-JULIAN-PROC-DATE ')'                              
LRM007***     GO TO 4500-EXIT                                                   
LRM007***  END-IF                                                               
LRM007***  IF (L-STREAM NOT = 'Q' AND                                           
LRM007     IF  ACAT-CONTROL-NBR OF DCLVTRNFR(1:7) =                             
080207                                           BPD-JULIAN-PROC-DATE           
              DISPLAY 'CLT=' CLIENT-NBR OF DCLVTRNFR                            
                         ' ' TRNFR-TYPE-CD    OF DCLVTRNFR                      
                     ' CTL=' ACAT-CONTROL-NBR OF DCLVTRNFR                      
                         ' SKIPPED BECAUSE JULIAN DATE'                         
                      '(' ACAT-CONTROL-NBR OF DCLVTRNFR(1:7) ')'                
                      ' = BPD-JULIAN-PROC-DATE'                                 
                      '(' BPD-JULIAN-PROC-DATE ')'                              
              GO TO 4500-EXIT                                                   
           END-IF                                                               
                                                                                
           MOVE CLIENT-NBR        OF DCLVTRNFR                                  
                                             TO  WF-CLIENT-NBR                  
           MOVE ACAT-CONTROL-NBR  OF DCLVTRNFR                                  
                                             TO  WF-ACAT-CONTROL-NBR            
           MOVE DLVR-NBR          OF DCLVTRNFR                                  
                                             TO  WF-DLVR-NBR                    
           MOVE ACCT-DLVR-NBR     OF DCLVTRNFR                                  
                                             TO  WF-ACCT-DLVR-NBR               
           MOVE RCV-NBR           OF DCLVTRNFR                                  
                                             TO  WF-RCV-NBR                     
           MOVE ACCT-RCV-NBR      OF DCLVTRNFR                                  
                                             TO  WF-ACCT-RCV-NBR                
           MOVE TRNFR-TYPE-CD     OF DCLVTRNFR                                  
                                             TO  WF-TRNFR-TYPE-CD               
           MOVE TRANS-TYPE-CD     OF DCLVTRNFR                                  
                                             TO  WF-TRANS-TYPE-CD               
           MOVE PRCS-DT           OF DCLVTRNFR                                  
                                             TO  WF-PRCS-DT                     
           MOVE STTS-CD           OF DCLVTRNFR                                  
                                             TO  WF-STTS-CD                     
           MOVE NSCC-PEND-CD      OF DCLVTRNFR                                  
                                             TO  WF-NSCC-PEND-CD                
           MOVE WF-ACCT-DLVR-NBR(1:8)    TO WF-BRANCH-ACCT                      
                                                                                
      ***BYPASS REJECTED TRANSFERS                                              
           PERFORM 7000-SELECT-ACTITRF THRU 7000-EXIT                           
           IF  W-ACTITRF-FND-SW = 'Y'                                           
              DISPLAY 'CLT=' CLIENT-NBR OF DCLVTRNFR                            
                         ' ' TRNFR-TYPE-CD    OF DCLVTRNFR                      
                     ' CTL=' ACAT-CONTROL-NBR OF DCLVTRNFR                      
                       ' ACTITRF FOUND '                                        
                       ' RJCT=' TRNFR-TYPE-RJCT-CD OF DCLACTITRF                
                       ' PEND=' NSCC-PEND-CD       OF DCLACTITRF                
                       ' PRGM=' PRGM-NM            OF DCLACTITRF                
                       ' UPDT=' UPDT-TMSTP         OF DCLACTITRF                
                       ' BYPASS REJ'                                            
               IF  TRNFR-TYPE-RJCT-CD OF DCLACTITRF = '  ' OR '00'              
LRM002*************CONTINUE                                                     
LRM002             PERFORM 7100-DELETE-ACTITRF THRU 7100-EXIT                   
               ELSE                                                             
LRM002             IF NSCC-PEND-CD OF DCLACTITRF = 'H'                          
LRM002                 PERFORM 7200-SUBMIT-REJECT-RTN THRU 7200-EXIT            
LRM002             END-IF                                                       
                   GO TO 4500-EXIT                                              
               END-IF                                                           
           END-IF.                                                              
                                                                                
           IF DAYS-STTS-QTY OF DCLVTRNFR >= W-BH-DAYS-STTS-QTY-PTR              
                   DISPLAY 'CLT=' WF-CLIENT-NBR                                 
                              ' ' WF-TRNFR-TYPE-CD                              
                          ' CTL=' WF-ACAT-CONTROL-NBR                           
                          ' ACC=' WF-BRANCH-CD ' ' WF-ACCT-CD                   
                          ' SUBMIT.'                                            
                          ' DAYS(' DAYS-STTS-QTY OF DCLVTRNFR ')'               
                          '>=B1(' W-BH-DAYS-STTS-QTY-PTR ') '                   
                          ' STA=' WF-STTS-CD                                    
                          ' PD='  WF-PRCS-DT                                    
                   ADD 1 TO W-PTR-SUBMIT-CNT                                    
                   MOVE ' ' TO W-BH-NSCC-PEND-CD                                
                   PERFORM 6000-SUBMIT-ASSETS THRU 6000-EXIT                    
                   ADD W-SQL-UPDATE-COUNT TO W-PTR-ASSET-CNT                    
                   IF  W-SQL-UPDATE-COUNT > 0                                   
                       PERFORM 8100-SQL-COMMIT THRU 8100-EXIT                   
                   ELSE                                                         
LRM002                 PERFORM 6100-COUNT-ASSETS THRU 6100-EXIT                 
LRM002                 IF W-ACTIAST-ROW-CNT > 0                                 
LRM002                    DISPLAY 'ACTIAST ALREADY MARKED TO SUBMIT '           
LRM002                      '/ FOUND ' W-ACTIAST-ROW-CNT                        
LRM002                 ELSE                                                     
LRM002                    MOVE 'L' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR           
LRM002                    PERFORM 6800-UPDATE-VTRNFR   THRU 6800-EXIT           
LRM002                    DISPLAY '   NO ASSETS FOUND BUILD REJECT'             
LRM002                    PERFORM 6900-INSERT-ACTITRF THRU 6900-EXIT            
LRM002                END-IF                                                    
                   END-IF                                                       
           END-IF.                                                              
                                                                                
       4500-EXIT. EXIT.                                                         
      /                                                                         
       6000-SUBMIT-ASSETS         SECTION.                                      
      *****************************************************************         
      *  IF DAYS = B1 DAYS, CHANGE NSCC-PEND TO ' ' TO SUBMIT.                  
      *  DO NOT SUBMIT WITHHELD ASSETS.                                         
      *****************************************************************         
           MOVE '6000-SUBMIT-ASSETS      ' TO W-ROUTINE-1.                      
                                                                                
           EXEC SQL                                                             
             UPDATE ACTIAST                                                     
                SET                                                             
                     NSCC_PEND_CD        = :W-BH-NSCC-PEND-CD                   
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  ACAT_CONTROL_NBR  = :WF-ACAT-CONTROL-NBR                 
                  AND  NSCC_WTHLD_CD     = ' '                                  
                  AND  NSCC_PEND_CD      = 'H'                                  
           END-EXEC.                                                            
                                                                                
           MOVE 'ACTIAST    '            TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
           MOVE SQLERRD(3)          TO W-SQLERRD-3                              
           MOVE W-SQLERRD-3         TO W-SQL-UPDATE-COUNT                       
                                                                                
           IF  SQLCODE  =  +0                                                   
                   DISPLAY 'CLT=' WF-CLIENT-NBR                                 
                              ' ' WF-TRNFR-TYPE-CD                              
                          ' CTL=' WF-ACAT-CONTROL-NBR                           
                          ' ACC=' WF-BRANCH-CD ' ' WF-ACCT-CD                   
                   ' ACTIAST UPDATED WITH PEND="' W-BH-NSCC-PEND-CD             
                   '". COUNT=' W-SQL-UPDATE-COUNT                               
           ELSE                                                                 
                   DISPLAY 'CLT=' WF-CLIENT-NBR                                 
                              ' ' WF-TRNFR-TYPE-CD                              
                          ' CTL=' WF-ACAT-CONTROL-NBR                           
                          ' ACC=' WF-BRANCH-CD ' ' WF-ACCT-CD                   
                         ' ACTIAST NSCC-PEND-CD NOT UPDATED'                    
                                ' SQLCODE = ' W-DB2-SQLCODE                     
               IF  SQLCODE  =  +100                                             
                   CONTINUE                                                     
               ELSE                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT521: ERROR UPDATING A ROW IN ACTIAST'            
                         ' (ACAT-INIT-ASSET TABLE)'                             
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
           END-IF.                                                              
                                                                                
       6000-EXIT. EXIT.                                                         
      /                                                                         
LRM002 6100-COUNT-ASSETS  SECTION.                                              
           MOVE 0 TO W-ACTIAST-ROW-CNT                                          
           EXEC SQL                                                             
             SELECT COUNT(*)                                                    
               INTO :W-ACTIAST-ROW-CNT                                          
               FROM ACTIAST                                                     
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  ACAT_CONTROL_NBR  = :WF-ACAT-CONTROL-NBR                 
LRM006            AND  NSCC_PEND_CD     IN (' ', 'Y')                           
LRM008            AND  NOT STTLM_LCTN_CD  = '45'                                
LRM008            AND  NOT NSCC_WTHLD_CD  = 'W'                                 
           END-EXEC.                                                            
                                                                                
       6100-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  FOR FUL TRANSFERS THAT ARE REJECTED                                    
      *  SET FLAGS IN VTRNFR: SET THE FLAT INDICATOR OF "L"                     
      *  UPDATE VTRNFR                                                          
      *****************************************************************         
DJ0002 6700-UPDATE-VTRNFR-FUL      SECTION.                                     
DJ0002     MOVE '6700-UPDATE-VTRNFR-FUL        ' TO W-ROUTINE-1.                
DJ0002                                                                          
DJ0002     MOVE 'L'                  TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR         
DJ0002     MOVE W-PGM-NAME           TO PRGM-NM            OF DCLVTRNFR         
DJ0002     MOVE ' '                  TO CICS-TERM-ID-CD    OF DCLVTRNFR         
DJ0002     MOVE W-CURRENT-TIMESTAMP  TO UPDT-TMSTP         OF DCLVTRNFR         
DJ0002                                                                          
DJ0002     EXEC SQL                                                             
DJ0002       UPDATE VTRNFR                                                      
DJ0002          SET                                                             
DJ0002             CICS_TERM_ID_CD     = :DCLVTRNFR.CICS-TERM-ID-CD             
DJ0002            ,UPDT_TMSTP          = :DCLVTRNFR.UPDT-TMSTP                  
DJ0002            ,PRGM_NM             = :DCLVTRNFR.PRGM-NM                     
DJ0002            ,TRNFR_TYPE_RJC2_CD  = :DCLVTRNFR.TRNFR-TYPE-RJC2-CD          
DJ0002          WHERE  CURRENT OF FUL_CURSOR                                    
DJ0002     END-EXEC.                                                            
DJ0002                                                                          
DJ0002     MOVE 'VTRNFR  '               TO W-DB2-TABLE-NAME                    
DJ0002     MOVE 'UPDATE'                 TO W-DB2-ACTION                        
DJ0002     MOVE SQLCODE                  TO W-DB2-SQLCODE                       
DJ0002                                                                          
DJ0002     IF  SQLCODE  =  +0                                                   
DJ0002         ADD 1 TO W-VTRNFR-UPD-CNT                                        
DJ0002     ELSE                                                                 
DJ0002         ADD 1 TO W-VTRNFR-NOT-UPD-CNT                                    
DJ0002         DISPLAY 'FUL VTRNFR NOT UPDATED.'                                
DJ0002                          ' SQLCODE = ' W-DB2-SQLCODE                     
DJ0002         DISPLAY '    VTRNFR PRIMARY KEY:'                                
DJ0002                   ' CLT=' WF-CLIENT-NBR                                  
DJ0002                   ' CTL=' WF-ACAT-CONTROL-NBR                            
DJ0002         IF  SQLCODE  =  +100                                             
DJ0002*************DISPLAY '#1 BYPASSING VTRNFR UPDATE NOT FOUND.'              
DJ0002             CONTINUE                                                     
DJ0002         ELSE                                                             
DJ0002             DISPLAY ' '                                                  
DJ0002             DISPLAY 'FUL ERROR UPDATING A ROW IN VTRNFR'                 
DJ0002                   ' (ACAT-TRNFR      TABLE)'                             
DJ0002             PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
DJ0002             PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
DJ0002         END-IF                                                           
DJ0002     END-IF.                                                              
DJ0002                                                                          
DJ0002 6700-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  FOR PTR TRANSFERS THAT ARE REJECTED                                    
      *  SET FLAGS IN VTRNFR                                                    
      *  UPDATE VTRNFR                                                          
      *****************************************************************         
LRM002 6800-UPDATE-VTRNFR          SECTION.                                     
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
                WHERE  CURRENT OF PTR_CURSOR                                    
           END-EXEC.                                                            
                                                                                
           MOVE 'VTRNFR  '               TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VTRNFR-UPD-CNT                                        
           ELSE                                                                 
               ADD 1 TO W-VTRNFR-NOT-UPD-CNT                                    
               DISPLAY '   VTRNFR NOT UPDATED.'                                 
                                ' SQLCODE = ' W-DB2-SQLCODE                     
               DISPLAY '   VTRNFR PRIMARY KEY:'                                 
                         ' CLT=' WF-CLIENT-NBR                                  
                         ' CTL=' WF-ACAT-CONTROL-NBR                            
               IF  SQLCODE  =  +100                                             
      *************DISPLAY '   BYPASSING VTRNFR UPDATE NOT FOUND.'              
                   CONTINUE                                                     
               ELSE                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT521: ERROR UPDATING A ROW IN VTRNFR'             
                         ' (ACAT-TRNFR      TABLE)'                             
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
               END-IF                                                           
           END-IF.                                                              
                                                                                
       6800-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  FOR TRANSFER THAT IS TO BE REJECTED                                    
      *  ADD THE NEW ROW TO THE INIT-TABLE                                      
      *****************************************************************         
LRM002 6900-INSERT-ACTITRF    SECTION.                                          
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
LRM003     MOVE B1-BKR-CLR-NO (B1-SUB)                                          
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
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTITRF-ADD-CNT                                       
               DISPLAY '   ACTITRF ADDED.'                                      
              ' TRANS-TYPE-CD=' TRANS-TYPE-CD OF DCLACTITRF                     
              ' TRNFR-TYPE-RJCT-CD=' TRNFR-TYPE-RJCT-CD OF DCLACTITRF           
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
               DISPLAY 'CAT521 ERROR INSERTING A ROW INTO ACTITRF'              
                    ' (ACAT-TRNFR TABLE)'                                       
               DISPLAY 'CAT521: DCLACTITRF  ='                                  
                    '(' DCLACTITRF ')'                                          
               PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                          
               PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                          
           END-IF.                                                              
                                                                                
                                                                                
       6900-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  CHECK INIT TRANSFER TABLE TO SEE IF TRANSFER WAS REJECTED              
      *****************************************************************         
       7000-SELECT-ACTITRF SECTION.                                             
           MOVE '7000-SELECT-ACTITRF          ' TO W-ROUTINE-1.                 
                                                                                
           MOVE ' '   TO W-ACTITRF-FND-SW                                       
           INITIALIZE DCLACTITRF                                                
                                                                                
           EXEC SQL SELECT                                                      
                   TRANS_TYPE_CD                                                
                  ,TRNFR_TYPE_RJCT_CD                                           
                  ,UPDT_TMSTP                                                   
                  ,PRGM_NM                                                      
                  ,NSCC_PEND_CD                                                 
               INTO                                                             
                   :DCLACTITRF.TRANS-TYPE-CD                                    
                  ,:DCLACTITRF.TRNFR-TYPE-RJCT-CD                               
                  ,:DCLACTITRF.UPDT-TMSTP                                       
                  ,:DCLACTITRF.PRGM-NM                                          
                  ,:DCLACTITRF.NSCC-PEND-CD                                     
                                                                                
               FROM  ACTITRF                                                    
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  ACAT_CONTROL_NBR  = :WF-ACAT-CONTROL-NBR                 
                  AND  RCV_NBR           = :WF-RCV-NBR                          
                  AND  DLVR_NBR          = :WF-DLVR-NBR                         
                  AND  ACCT_RCV_NBR      = :WF-ACCT-RCV-NBR                     
                  AND  ACCT_DLVR_NBR     = :WF-ACCT-DLVR-NBR                    
                  AND  TRNFR_TYPE_CD     = :WF-TRNFR-TYPE-CD                    
           END-EXEC                                                             
                                                                                
           MOVE 'ACTITRF'                TO W-DB2-TABLE-NAME                    
           MOVE 'SELECT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           IF  SQLCODE  =  +0                                                   
               MOVE 'Y'   TO W-ACTITRF-FND-SW                                   
           ELSE                                                                 
              IF  SQLCODE  =  +100                                              
                  MOVE 'N'   TO W-ACTITRF-FND-SW                                
              ELSE                                                              
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT521: ERROR SELECTING A ROW IN ACTITRF'           
                         ' (ACAT-TRNFR      TABLE)'                             
                   DISPLAY 'CAT521: DCLACTITRF  ='                              
                           '(' DCLACTITRF ')'                                   
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
              END-IF                                                            
           END-IF.                                                              
                                                                                
       7000-EXIT. EXIT.                                                         
      /                                                                         
LRM002 7100-DELETE-ACTITRF  SECTION.                                            
           MOVE '7100-DELETE-ACTITRF     ' TO W-ROUTINE-1.                      
           EXEC SQL                                                             
             DELETE FROM ACTITRF                                                
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  ACAT_CONTROL_NBR  = :WF-ACAT-CONTROL-NBR                 
           END-EXEC.                                                            
                                                                                
           MOVE 'ACTITRF    '            TO W-DB2-TABLE-NAME                    
           MOVE 'DELETE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
           MOVE SQLERRD(3)          TO W-SQLERRD-3                              
           MOVE W-SQLERRD-3         TO W-SQL-UPDATE-COUNT                       
                                                                                
           IF  SQLCODE  =  +0                                                   
                   ADD 1 TO W-ACTITRF-DEL-CNT                                   
                   DISPLAY 'CLT=' WF-CLIENT-NBR                                 
                          ' CTL=' WF-ACAT-CONTROL-NBR                           
                   ' ACTITRF DELETED'                                           
           ELSE                                                                 
                   DISPLAY  'CLT=' WF-CLIENT-NBR                                
                          ' CTL=' WF-ACAT-CONTROL-NBR                           
                         ' ACTITRF NSCC-PEND-CD NOT DELETED'                    
                                ' SQLCODE = ' W-DB2-SQLCODE                     
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT521: ERROR DELETING A ROW IN ACTITRF'            
                         ' (ACAT-INIT-TRANSFER TABLE)'                          
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
           END-IF.                                                              
       7100-EXIT. EXIT.                                                         
      /                                                                         
LRM002 7200-SUBMIT-REJECT-RTN   SECTION.                                        
      *****************************************************************         
      *  IF DAYS = B1 DAYS, CHANGE NSCC-PEND TO ' ' TO SUBMIT.                  
      *****************************************************************         
           MOVE '7200-SUBMIT-REJECT      ' TO W-ROUTINE-1.                      
                                                                                
           EXEC SQL                                                             
             UPDATE ACTITRF                                                     
                SET                                                             
                     NSCC_PEND_CD        = ' '                                  
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  ACAT_CONTROL_NBR  = :WF-ACAT-CONTROL-NBR                 
           END-EXEC.                                                            
                                                                                
           MOVE 'ACTITRF    '            TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
           MOVE SQLERRD(3)          TO W-SQLERRD-3                              
           MOVE W-SQLERRD-3         TO W-SQL-UPDATE-COUNT                       
                                                                                
           IF  SQLCODE  =  +0                                                   
                   ADD 1 TO W-ACTITRF-UPD-CNT                                   
                   DISPLAY 'CLT=' WF-CLIENT-NBR                                 
                          ' CTL=' WF-ACAT-CONTROL-NBR                           
                   ' ACTITRF UPDATED WITH PEND=SPACE'                           
                      'COUNT ' W-SQL-UPDATE-COUNT                               
           ELSE                                                                 
                   DISPLAY  'CLT=' WF-CLIENT-NBR                                
                          ' CTL=' WF-ACAT-CONTROL-NBR                           
                         ' ACTITRF NSCC-PEND-CD NOT UPDATED'                    
                                ' SQLCODE = ' W-DB2-SQLCODE                     
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT521: ERROR UPDATING A ROW IN ACTITRF'            
                         ' (ACAT-INIT-ASSET TABLE)'                             
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
           END-IF.                                                              
                                                                                
       7200-EXIT. EXIT.                                                         
      /                                                                         
       8100-SQL-COMMIT     SECTION.                                             
                                                                                
           EXEC SQL COMMIT END-EXEC                                             
                                                                                
           MOVE SQLCA   TO COMMIT-SQLCA                                         
           MOVE SQLCODE TO COMMIT-RETURN                                        
                                                                                
           IF  COMMIT-AB                                                        
               DISPLAY 'CAT521: '                                               
                  'SQL COMMIT FAILED. COMMIT-RETURN= '                          
                   COMMIT-RETURN                                                
                   DISPLAY 'CLT=' WF-CLIENT-NBR                                 
                              ' ' WF-TRNFR-TYPE-CD                              
                          ' CTL=' WF-ACAT-CONTROL-NBR                           
                          ' ACC=' WF-BRANCH-CD ' ' WF-ACCT-CD                   
                          ' COMMIT FAILED'                                      
           ELSE                                                                 
               ADD 1 TO W-COMMIT-CNT                                            
           END-IF.                                                              
                                                                                
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
                                                                                
           DISPLAY 'CAT521: U3999 - ABENDING ON BAD DB2 STATUS'                 
           DISPLAY 'CAT521: PROGRAM ENDED ABNORMALLY'                           
           MOVE +3999    TO ABEND-CODE                                          
           CALL ABEND USING ABEND-CODE.                                         
                                                                                
       8500-EXIT. EXIT.                                                         
      /                                                                         
       8700-SQL-ROLLBACK   SECTION.                                             
           DISPLAY '8700-SQL-ROLLBACK'                                          
                                                                                
           EXEC SQL ROLLBACK WORK END-EXEC                                      
                                                                                
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
       9000-CLOSE-ROUTINE SECTION.                                              
           MOVE '9000-CLOSE-ROUTINE            ' TO W-ROUTINE-1.                
           DISPLAY ' '                                                          
           CLOSE INFILE                                                         
           DISPLAY 'CAT521: INFILE   CLOSED. STATUS = '                         
                                             INFILE-FILE-STATUS.                
           DISPLAY 'CAT521: W-FUL-FETCH-CNT  = ' W-FUL-FETCH-CNT                
           DISPLAY 'CAT521: W-FUL-SUBMIT-CNT = ' W-FUL-SUBMIT-CNT               
           DISPLAY 'CAT521: W-FUL-ASSET-CNT  = ' W-FUL-ASSET-CNT                
           DISPLAY 'CAT521: W-PTR-FETCH-CNT  = ' W-PTR-FETCH-CNT                
           DISPLAY 'CAT521: W-PTR-SUBMIT-CNT = ' W-PTR-SUBMIT-CNT               
           DISPLAY 'CAT521: W-PTR-ASSET-CNT  = ' W-PTR-ASSET-CNT                
LRM002     DISPLAY 'CAT521: ACTITRF-DEL-CNT  = ' W-ACTITRF-DEL-CNT              
LRM002     DISPLAY 'CAT521: ACTITRF-ADD-CNT  = ' W-ACTITRF-ADD-CNT              
LRM002     DISPLAY 'CAT521: ACTITRF-UPD-CNT  = ' W-ACTITRF-UPD-CNT              
LRM002     DISPLAY 'CAT521: VTRNFR-UPD-CNT   = ' W-VTRNFR-UPD-CNT               
LRM002                    ' VTRNFR-NOT-UPD-CNT = '                              
LRM002                                           W-VTRNFR-NOT-UPD-CNT           
           DISPLAY 'CAT521: PROGRAM ENDED SUCCESSFULLY'.                        
       9000-EXIT. EXIT.                                                         
      *################################################################         
