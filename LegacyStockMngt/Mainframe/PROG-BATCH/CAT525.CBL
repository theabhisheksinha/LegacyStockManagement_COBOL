000001* PDX    - CAT525   C0350899 01/27/14 11:48:30 TBLAMUR            00001000
      * LRM008 SSR 99427 PASS EFAA ON CLIENT 313 CNVSN                  00001000
000001* PDX    - CAT525   C0336448 01/18/13 15:24:20 TBLAMUR            00001000
      * LRM007 SSR 89052 PASS DELETED FUND ASSETS FROM STTL LOC 50      00001000
      *   ON EXCEPTION FILE, IN ADDITION TO 10.                                 
000001* PDX    - CAT525   C0328075 07/05/12 10:13:04 TBLAMUR            00001000
      * LRM006 SSR 83475 ADD SPAD EXCEPTION AND CHANGE CATEXCP RECORD   00001000
      *   TO BE ONE EXCEPTION PER RECORD, NOT MULTI.                            
000001* PDX    - CAT525   C0317345 11/15/11 11:33:43 TBLAMUR            00001000
      * LRM005 SSR 80728 NETWORK LEVEL 4 EXCEPTION.                     00001000
000001* PDX    - CAT525   C0291396 02/16/10 08:22:55 TBLAMUR            00001000
      * LRM004 SSR 69400 CLEARING NBR CONVERSION IND                    00001000
000001* PDX    - CAT525   C0276888 04/06/09 10:50:41 TBDOJUN            00001000
      * DJ0003 SSR 61684 AUCTION RATE SECURITY                          00001000
000001* PDX    - CAT525   C0275090 01/06/09 13:40:58 TBDOJUN            00001000
      * DJ0002 TASK#624920 FIX SPECIAL ACCOUNT, AND GIFT INDICATOR      00001000
000001* PDX    - CAT525   C0270214 10/16/08 16:19:37 TBDOJUN            00001000
      * DJ0001 ADD 'WITH UR' TO THE SQL STATEMENTS. REMOVE ASCENDIS B1. 00001000
000001* PDX    - CAT525   C0260091 09/03/08 10:46:04 TBDOJUN            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT525.                                                     
      *****************************************************************         
      * THIS PROGRAM CONTAINS DB2.                                    *         
      *****************************************************************         
      * CAT525 - ASCENDIS(WORKFLOW) EXCEPTION FILE                    *         
      *                                                               *         
      *   1. GET CYCLE NUMBER FROM ACATTRNS FILE                      *         
      *   2. GET ASCENDIS CLIENT FROM B1                              *         
      *   3. FOR ASCENDIS CLIENT,                                     *         
      *      GET TRANSFERS THAT CAME IN THIS CYCLE,                   *         
      *      EXTRACT THE EXCEPTION CODES FROM VTRNFR                  *         
      *          FOR FUL DELIVERIES WITH STATUS 100 OR 110            *         
      *          FOR FUL RECEIVES   WITH STATUS 200 OR 210            *         
      *          FOR PTR DELIVERIES WITH STATUS 500                   *         
      *          FOR PTR RECEIVES   WITH STATUS 200                   *         
      *          FOR PTD RECEIVES   WITH STATUS 200                   *         
      *      GET CHANGE RECORD FROM ACTITRF FOR INTERNAL TRANSFERS    *         
      *      GET MUTUAL FUND AUTO DELETE ASSET FROM ACTIAST           *         
      *                                                               *         
      * FOR CAT810 NIGHTLY RUN, CYCLE-NBR = '00'. NO INPUT FILE.      *         
      *      AT NIGHT, GIVE THEM ALL STATUSES FOR 'FUL'.              *         
      *      BYPASS DATECHECK AND FILECHECK. DUMMY INPUT FILE.        *         
      *                                                               *         
      * INPUT  -                                                      *         
      *        - BQQQ.CAT511.ACATTRNS FOR CYCLE NUMBER                *         
      *        - B1                                                   *         
      *        - VTRNFR                                               *         
      *        - ACTITRF                                              *         
      *        - ACTIAST                                              *         
      * OUTPUT -                                                      *         
      *        - BQQQ.CAT525.EXCP      LRECL = 120                    *         
      *                                                               *         
      *****************************************************************         
      * 03/20/08 DJ SSR#55766 NEW PROGRAM                             *         
      *****************************************************************         
      /                                                                         
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT INFILE           ASSIGN       TO INFILE                       
                                   FILE STATUS  IS INFILE-FILE-STATUS.          
                                                                                
           SELECT CATEXCP          ASSIGN      TO CATEXCP                       
                                   FILE STATUS IS CATEXCP-STATUS.               
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
       FD  CATEXCP                                                              
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
                                                                                
           COPY CATEXCP REPLACING ==:CATEXCP:== BY ==CATEXCP==.                 
      /                                                                         
       WORKING-STORAGE SECTION.                                                 
           COPY PDXIDCOB.                                                       
                                                                                
       01  W-FIELDS.                                                            
           05  W-PGM-NAME                PIC  X(008) VALUE 'CAT525'.            
           05  W-ROUTINE-1               PIC  X(032) VALUE ' '.                 
           05  END-OF-INPUT-SW           PIC  X(001) VALUE '0'.                 
               88 END-OF-INPUT                       VALUE '1'.                 
           05  INFILE-FILE-STATUS        PIC  X(002).                           
               88 INFILE-OKAY            VALUE '00' THRU '09', '97'.            
               88 INFILE-END-OF-FILE     VALUE '10'.                            
               88 INFILE-EMPTY-MISSING VALUE '35'.                              
           05  CATEXCP-STATUS            PIC  X(002).                           
               88 CATEXCP-OKAY           VALUE '00' THRU '09', '97'.            
               88 CATEXCP-END-OF-FILE    VALUE '10'.                            
               88 CATEXCP-EMPTY-MISSING VALUE '35'.                             
           05  LD-PROC-DATE.                                                    
               10 LD-PROC-DATE-MM        PIC  X(002).                           
               10 LD-PROC-DATE-DD        PIC  X(002).                           
               10 LD-PROC-DATE-YY        PIC  X(002).                           
           05  W-CYCLE-NBR               PIC  X(002) VALUE '00'.                
           05  W-INFILE-CNT              PIC  9(008) VALUE 0.                   
           05  W-VTRNFR-CNT              PIC  9(008) VALUE 0.                   
           05  W-ACTITRF-CNT             PIC  9(008) VALUE 0.                   
           05  W-ACTIAST-CNT             PIC  9(008) VALUE 0.                   
           05  W-AC-CHG-CNT              PIC  9(008) VALUE 0.                   
           05  W-MF-DEL-CNT              PIC  9(008) VALUE 0.                   
           05  W-CATEXCP-CNT             PIC  9(009) VALUE 0.                   
           05  W-REC-LEN-IN              PIC  9(005) VALUE 0.                   
           05  W-ACTITRF-FND-SW          PIC  X(001) VALUE ' '.                 
               88 W-ACTITRF-FOUND                    VALUE 'Y'.                 
LRM006     05  W-ORIGINAL-ACCT-IND       PIC  X(001) VALUE ' '.                 
LRM006         88 W-ORIGINAL-ACCT-OK                 VALUE ' '.                 
LRM006         88 W-ORIGINAL-ACCT-FLAT               VALUE 'F'.                 
           05  W-PRCS-DT.                                                       
               07  W-PRCS-DT-CC         PIC X(02).                              
               07  W-PRCS-DT-YY         PIC X(02).                              
               07  FILLER               PIC X(01) VALUE '-'.                    
               07  W-PRCS-DT-MM         PIC X(02).                              
               07  FILLER               PIC X(01) VALUE '-'.                    
               07  W-PRCS-DT-DD         PIC X(02).                              
      /                                                                         
       01  W-FETCH-AREA.                                                        
           05  WF-CLIENT-NBR          PIC X(4).                                 
           05  WF-ACAT-CONTROL-NBR    PIC X(14).                                
                                                                                
       01  W-CURRENT-AREA.                                                      
           05  W-CURRENT-CLIENT          PIC X(004).                            
           05  W-CURRENT-CLIENT-N REDEFINES                                     
               W-CURRENT-CLIENT          PIC 9(004).                            
           05  W-CURRENT-BROKER          PIC X(004).                            
           05  W-CURRENT-STREAM          PIC X(001).                            
                                                                                
       01  FILLER                        PIC X(008) VALUE 'B1-TABLE'.           
       01  B1-TABLE-AREA.                                                       
           03  B1-TABLE OCCURS 500 TIMES.                                       
               05  B1-CLT-NO                PIC 9(04).                          
               05  B1-CLT-NAME              PIC X(30).                          
               05  B1-BROKER-NO             PIC X(04).                          
               05  B1-STREAM                PIC X(01).                          
               05  B1-STATUS                PIC X(01).                          
               05  B1-ACAT-STATUS           PIC X(01).                          
               05  B1-ACAT-ASCENDIS-USER    PIC X(01).                          
               05  B1-ACCT-FREEZE-PROC      PIC X(01).                          
       01  B1-WORK-FIELEDS.                                                     
           03  B1-TBL-CNT                   PIC 9(03) VALUE 0.                  
           03  B1-SUB                       PIC 9(03) VALUE 0.                  
           03  B1-STREAM-CNT                PIC 9(03) VALUE 0.                  
      /                                                                         
           COPY CATEXCP REPLACING ==:CATEXCP:== BY ==W-CATEXCP==.               
      /                                                                         
      ******************************************************************        
      * NSCC EXTRACT FILE                                              *        
      ******************************************************************        
       01  FILLER PIC X(016) VALUE 'CURRENT-RECORD='.                           
       01  FILLER                        PIC X(008) VALUE 'W-NSCC'.             
           COPY NSCCMEXT REPLACING ==:NSCCMEXT:==  BY ==W-NSCC==.               
      /                                                                         
      ******************************************************************        
      * P2 HEADER/TRAILER                                              *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'CP2WS   '.           
       01  W-HDR-TRL-LEN                 PIC 9(005) VALUE 120.                  
           COPY CP2WS.                                                          
      /                                                                         
      ******************************************************************        
      * FACZ1B   COMMAREA - ACCOUNT FREEZE                             *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE  'FACZ1CA'.           
       01  FACZ1B                        PIC X(008) VALUE  'FACZ1B'.            
       01  W-FAC-AREA.                                                          
           10  W-FAC-CASH-IN-IND          PIC  X(01).                           
            88 W-FAC-CASH-IN-FRZ-YES                 VALUE 'Y'.                 
            88 W-FAC-CASH-IN-FRZ-NOT                 VALUE 'N'.                 
           10  W-FAC-CASH-OUT-IND         PIC  X(01).                           
            88 W-FAC-CASH-OUT-FRZ-YES                VALUE 'Y'.                 
            88 W-FAC-CASH-OUT-FRZ-NOT                VALUE 'N'.                 
           10  W-FAC-SEC-IN-IND           PIC  X(01).                           
            88 W-FAC-SEC-IN-FRZ-YES                  VALUE 'Y'.                 
            88 W-FAC-SEC-IN-FRZ-NOT                  VALUE 'N'.                 
           10  W-FAC-SEC-OUT-IND          PIC  X(01).                           
            88 W-FAC-SEC-OUT-FRZ-YES                 VALUE 'Y'.                 
            88 W-FAC-SEC-OUT-FRZ-NOT                 VALUE 'N'.                 
                                                                                
           COPY FACZ1CA REPLACING ==:P:== BY ==F-==.                            
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
      * B1 REQ  SECTION                                                *        
      ******************************************************************        
       01  FILLER                        PIC X(08) VALUE 'BHREQ   '.            
           COPY BHREQ.                                                          
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
       01  FILLER                        PIC X(008) VALUE 'CURSOR'.             
           EXEC SQL DECLARE VTRNFR_CURSOR CURSOR WITH HOLD FOR                  
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
DJ0002             ,ALERT_IND                                                   
DJ0002             ,ACCT_RB_SEC_IND                                             
DJ0002             ,ACCT_CLT_RSCND_IND                                          
DJ0002             ,ACCT_LGL_BLK_IND                                            
DJ0002             ,FRV_MFC_CMPLT_IND                                           
DJ0002             ,ACCT_FRZN_IND                                               
DJ0002             ,BRANCH_ALTNT_CD                                             
DJ0002             ,GIFT_IND                                                    
DJ0002             ,RSTR_TRD_90_DY_IND                                          
DJ0002             ,REG_T_IND                                                   
DJ0002             ,ADOPT_AGRMT_IND                                             
DJ0002             ,RR_ORGNL_CD                                                 
DJ0002             ,CVRSN_ACCT_NBR                                              
DJ0003             ,AUCTION_RT_IND                                              
LRM005             ,NTWRK_LVL4_FND_IND                                          
                FROM  VTRNFR                                                    
                WHERE CLIENT_NBR = :W-CURRENT-CLIENT                            
                ORDER BY                                                        
                      DSTBN_SIDE_CD                                             
                     ,BRANCH_CD                                                 
                     ,ACCT_CD                                                   
                     ,STTS_CD                                                   
DJ0001          FOR READ ONLY WITH UR                                           
           END-EXEC.                                                            
      /                                                                         
      ******************************************************************        
      * DECLARE CURSOR FOR INIT ASSET TABLE TO FIND MF DELETE          *        
      ******************************************************************        
       01  FILLER                PIC X(016) VALUE 'ACTIAST-CURSOR'.             
           EXEC SQL DECLARE ACTIAST_CURSOR CURSOR FOR                           
                SELECT                                                          
                       CLIENT_NBR                                               
                      ,DLVR_NBR                                                 
                      ,ACCT_DLVR_NBR                                            
                      ,ACAT_CONTROL_NBR                                         
                      ,ASSET_SEQ_NBR                                            
                      ,CSH_MGN_SHRT_CD                                          
                      ,SECURITY_ADP_NBR                                         
                      ,STTLM_LCTN_CD                                            
                      ,TRANS_TYPE_CD                                            
                      ,PRGM_NM                                                  
                FROM   ACTIAST                                                  
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  ACAT_CONTROL_NBR  = :WF-ACAT-CONTROL-NBR                 
                  AND  TRANS_TYPE_CD     = 'D'                                  
                  AND (STTLM_LCTN_CD     = '10'                                 
LRM007             OR (STTLM_LCTN_CD     = '50'                                 
LRM007              AND ASSET_PRC_CTGY_CD IN ('MFNM', 'MFMM')))                 
DJ0001          FOR READ ONLY WITH UR                                           
           END-EXEC.                                                            
      /                                                                         
      ******************************************************************        
      * DB2 COMMAREA                                                   *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'SQLCA   '.           
           EXEC SQL INCLUDE SQLCA        END-EXEC.                              
                                                                                
      ******************************************************************        
      * DB2 ERROR MSG AREA                                             *        
      ******************************************************************        
       01  W-DB2-MSG-AREA.                                                      
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.            
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES             
                   INDEXED BY W-DB2-IDX.                                        
                                                                                
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
           05  W-COMMIT-CNT              PIC  9(009) COMP-3 VALUE 0.            
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(011) COMP-3 VALUE 0.            
           05  W-DB2-TABLE-NAME          PIC  X(008).                           
           05  W-DB2-ACTION              PIC  X(008).                           
           05  W-DB2-SQLCODE             PIC ---9.                              
           05  W-SQLERRD-3               PIC S9(9).                             
           05  W-SQL-DELETE-COUNT        PIC  9(9).                             
           05  W-TFR-SQLCODE             PIC S9(9) COMP-4.                      
           05  W-AST-SQLCODE             PIC S9(9) COMP-4.                      
                                                                                
       01  FILLER                        PIC  X(008) VALUE 'TIMESTMP'.          
       01  W-CURRENT-TIMESTAMP           PIC  X(026).                           
      /                                                                         
      ***===> COBOL LE                                                          
       01  W-ABEND-AREA.                                                        
           05  ABEND-CODE                PIC S9(04) COMP SYNC.                  
       01  CALL-MODULES.                                                        
           05  DSNTIAR                   PIC  X(08) VALUE 'DSNTIAR '.           
       01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.           
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
                                                                                
       PROCEDURE DIVISION USING L-JCL-PARMS.                                    
      *                         ===========                                     
           DISPLAY 'CAT525 - ASCENDIS(WORKFLOW) EXCEPTION FILE'.                
           DISPLAY ' '.                                                         
           COPY MSGCOBO.                                                        
           DISPLAY ' '.                                                         
                                                                                
           PERFORM 1000-INIT          THRU 1000-EXIT                            
                                                                                
           PERFORM 2000-PROCESS-INPUT THRU 2000-EXIT                            
                                                                                
           PERFORM 9000-CLOSE-ROUTINE THRU 9000-EXIT                            
                                                                                
           GOBACK.                                                              
      /                                                                         
       1000-INIT.                                                               
           MOVE '1000-INIT                     ' TO W-ROUTINE-1.                
                                                                                
           EXEC SQL SET :W-CURRENT-TIMESTAMP = CURRENT TIMESTAMP                
           END-EXEC                                                             
                                                                                
           IF  SQLCODE = +0                                                     
               DISPLAY ' '                                                      
               DISPLAY 'CAT525: W-CURRENT-TIMESTAMP = '                         
                                                    W-CURRENT-TIMESTAMP         
               DISPLAY ' '                                                      
           ELSE                                                                 
               DISPLAY 'CAT525: W-CURRENT-TIMESTAMP NOT SET'                    
               MOVE SQLCODE      TO W-DB2-SQLCODE                               
               DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                               
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                           
           END-IF.                                                              
                                                                                
           DISPLAY 'CAT525: L-STREAM         = '                                
                            L-STREAM                                            
           DISPLAY 'CAT525: L-BYP-DATECHK-SW = '                                
                            L-BYP-DATECHK-SW                                    
           ' (1=BYPASS DATE CHECK)'                                             
           DISPLAY 'CAT525: L-BYP-FILECHK-SW = '                                
                            L-BYP-FILECHK-SW                                    
           ' (1=BYPASS FILE CHECK. BYPASS EMPTY FILE,DB2 ABENDS.)'              
                                                                                
           IF  L-BYP-DATECHK                                                    
               DISPLAY 'CAT525: DATE CHECK WILL BE BYPASSED'                    
           ELSE                                                                 
               DISPLAY 'CAT525: DATE CHECK WILL BE PERFORMED'                   
           END-IF.                                                              
           IF  L-BYP-FILECHK                                                    
               DISPLAY 'CAT525: FILE CHECK WILL BE BYPASSED'                    
           ELSE                                                                 
               DISPLAY 'CAT525: FILE CHECK WILL BE PERFORMED'                   
           END-IF.                                                              
                                                                                
           MOVE 'CAT525'                  TO BPDATES-CALLING-PGM.               
           SET  LNKDATZ-REQUEST           TO TRUE.                              
           CALL BPDATES USING BPDATES-PARAMETERS.                               
           MOVE BPD-PROC-DATE(3:2)        TO LD-PROC-DATE-YY.                   
           MOVE BPD-PROC-DATE(5:2)        TO LD-PROC-DATE-MM.                   
           MOVE BPD-PROC-DATE(7:2)        TO LD-PROC-DATE-DD.                   
                                                                                
           MOVE BPD-PROC-DATE(1:2)         TO W-PRCS-DT-CC.                     
           MOVE BPD-PROC-DATE(3:2)         TO W-PRCS-DT-YY.                     
           MOVE BPD-PROC-DATE(5:2)         TO W-PRCS-DT-MM.                     
           MOVE BPD-PROC-DATE(7:2)         TO W-PRCS-DT-DD.                     
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY 'CAT525:       BPD-PROC-DATE= ' BPD-PROC-DATE                
                                '  LD-PROC-DATE= ' LD-PROC-DATE                 
           DISPLAY 'CAT525: BPD-PRIOR-PROC-DATE= ' BPD-PRIOR-PROC-DATE          
           DISPLAY 'CAT525:           W-PRCS-DT= ' W-PRCS-DT                    
           DISPLAY ' '.                                                         
                                                                                
           MOVE '000'                  TO BH-BROKER-NUMBER                      
                                                                                
           OPEN INPUT INFILE.                                                   
           DISPLAY 'CAT525: INFILE   OPENED FOR INPUT.  STATUS = '              
                                               INFILE-FILE-STATUS.              
           IF  INFILE-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT525: ERROR OPENING INFILE'                           
               DISPLAY 'CAT525: OPEN STATUS = ' INFILE-FILE-STATUS              
               DISPLAY 'CAT525: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           PERFORM 1200-CHECK-HDR-REC  THRU 1200-EXIT.                          
                                                                                
           OPEN OUTPUT CATEXCP.                                                 
           DISPLAY 'CAT525: CATEXCP OPENED FOR OUTPUT. STATUS = '               
                                                CATEXCP-STATUS.                 
           IF  CATEXCP-OKAY                                                     
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT525: ERROR OPENING CATEXCP'                          
               DISPLAY 'CAT525: OPEN STATUS = ' CATEXCP-STATUS                  
                            '.  OUTPUT-CNT = ' W-CATEXCP-CNT                    
               DISPLAY 'CAT525: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001 TO ABEND-CODE                                         
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           DISPLAY 'CAT525: W-CYCLE-NBR = ' W-CYCLE-NBR                         
                                                                                
           MOVE ' '                      TO CATEXCP-HEADER-RECORD               
           MOVE 'H'                      TO CP2-REQUEST-CODE.                   
           MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.                     
           MOVE 999                      TO CP2-CLIENT-NUMBER.                  
           CALL P2HDTR                USING CP2-AREA                            
                                            CATEXCP.                            
           MOVE CP2-RETURN-RECORD        TO CATEXCP-HEADER-RECORD               
           SET CATEXCP-HDR-CYCLE-LITERAL TO TRUE                                
           MOVE LD-PROC-DATE             TO CATEXCP-HDR-PROC-DATE               
           MOVE W-CYCLE-NBR              TO CATEXCP-HDR-CYCLE-NO                
           DISPLAY 'CAT525: CATEXCP-HDR= '  CATEXCP-HEADER-RECORD               
           WRITE CATEXCP-RECORD.                                                
           DISPLAY 'CAT525: CATEXCP HEADER WRITTEN.    STATUS = '               
                                               CATEXCP-STATUS.                  
                                                                                
           PERFORM 1500-LOAD-B1          THRU 1500-EXIT.                        
           DISPLAY ' '.                                                         
                                                                                
       1000-EXIT. EXIT.                                                         
      /                                                                         
      ******************************************************************        
      *  READ THE HDR REC  TO GET THE TIMESTAMP                                 
      *  FOR THE LAST TIME WE TRANSMITTED TO NSCC                               
      ******************************************************************        
       1200-CHECK-HDR-REC.                                                      
           MOVE '1200-CHECK-HDR-REC            ' TO W-ROUTINE-1.                
                                                                                
           PERFORM 1800-READ-INPUT THRU 1800-EXIT                               
                                                                                
           IF  END-OF-INPUT                                                     
               DISPLAY 'CAT525: END OF INPUT REACHED'                           
               IF  L-BYP-FILECHK                                                
                   DISPLAY 'CAT525: BYPASSING FILE CHECK PER JCLPARM'           
                   GO TO 1200-EXIT                                              
               ELSE                                                             
                   DISPLAY 'CAT525: U3003 - ABENDING ON EMPTY FILE'             
                   MOVE +3003    TO ABEND-CODE                                  
                   CALL ABEND USING ABEND-CODE                                  
               END-IF                                                           
           END-IF.                                                              
           IF  INFILE-HDR-RECORD                                                
               DISPLAY 'CAT525: INFILE  DATE = '                                
                                              INFILE-HDR-PROC-DATE              
                             ', UPDT BY PGM=' INFILE-HDR-PGM-NAME               
                                     ' DATE=' INFILE-HDR-SYS-DATE               
                                     ' TIME=' INFILE-HDR-SYS-TIME               
               IF  INFILE-HDR-PROC-DATE = LD-PROC-DATE                          
                   DISPLAY 'CAT525: INFILE  DATE = PROC DATE. OKAY'             
               ELSE                                                             
                   DISPLAY 'CAT525: INFILE  DATE NOT = PROC DATE'               
                   IF L-BYP-DATECHK                                             
                   DISPLAY 'CAT525: BYPASSING DATE CHECK PER JCLPARM'           
                   ELSE                                                         
                      DISPLAY 'CAT525: U3004 - ABENDING ON BAD DATE'            
                      MOVE +3004    TO ABEND-CODE                               
                      CALL ABEND USING ABEND-CODE                               
                   END-IF                                                       
               END-IF                                                           
               MOVE INFILE-HDR-CYCLE-NBR      TO W-CYCLE-NBR                    
           ELSE                                                                 
               DISPLAY 'CAT525: INFILE  DATE RECORD MISSING'                    
                   IF L-BYP-DATECHK                                             
                   DISPLAY 'CAT525: BYPASSING DATE CHECK PER JCLPARM'           
                   ELSE                                                         
                      DISPLAY 'CAT525: U3005 - ABENDING ON BAD DATE'            
                      MOVE +3005    TO ABEND-CODE                               
                      CALL ABEND USING ABEND-CODE                               
                   END-IF                                                       
           END-IF.                                                              
                                                                                
           DISPLAY ' '.                                                         
                                                                                
       1200-EXIT. EXIT.                                                         
      /                                                                         
       1500-LOAD-B1.                                                            
           DISPLAY 'CAT525: 1500-LOAD-B1'.                                      
                                                                                
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
                                                                                
             MOVE ' '                    TO  BH-B2-INFO-ID                      
             MOVE '114'                  TO  BH-LOGICAL-RECORD-CODE             
             CALL GETB1V               USING BH-BROKER-HEADER-INFO              
                                             BH-REQ-INFO                        
                                                                                
             IF   BH-BROKER-ACTIVE                                              
             AND  BH-ACAT-ACTIVE                                                
                   ADD 1 TO B1-TBL-CNT                                          
                   MOVE  BH-BROKER-NUMBER-N                                     
                                         TO B1-CLT-NO     (B1-TBL-CNT)          
                   MOVE  BH-BROKER-NAME                                         
                                         TO B1-CLT-NAME   (B1-TBL-CNT)          
                   MOVE  BH-BROKER-OLD-CLEARING-HOUSE (2:4)                     
                                         TO B1-BROKER-NO  (B1-TBL-CNT)          
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
                   MOVE  BH-ACAT-ASCENDIS-USER                                  
                                  TO B1-ACAT-ASCENDIS-USER(B1-TBL-CNT)          
                   MOVE  BH-REQ-ACCT-FREEZE-PROC                                
                                  TO B1-ACCT-FREEZE-PROC  (B1-TBL-CNT)          
                   IF  B1-STREAM (B1-TBL-CNT) = L-STREAM                        
                       DISPLAY     'CNT=' B1-TBL-CNT                            
                                    ' CLT ' B1-CLT-NO     (B1-TBL-CNT)          
                                        ' ' B1-CLT-NAME   (B1-TBL-CNT)          
                                    ' BKR ' B1-BROKER-NO  (B1-TBL-CNT)          
                                    ' STR ' B1-STREAM     (B1-TBL-CNT)          
                                    ' STA ' B1-STATUS     (B1-TBL-CNT)          
                                   ' ACAT ' B1-ACAT-STATUS(B1-TBL-CNT)          
                        ' ASCENDIS ' B1-ACAT-ASCENDIS-USER(B1-TBL-CNT)          
                          ' FREEZE ' B1-ACCT-FREEZE-PROC  (B1-TBL-CNT)          
                       ADD 1 TO B1-STREAM-CNT                                   
                   END-IF                                                       
             END-IF                                                             
                                                                                
           END-PERFORM.                                                         
                                                                                
           DISPLAY ' '.                                                         
                                                                                
           DISPLAY  'B1-STREAM-CNT  = ' B1-STREAM-CNT                           
                    ' # OF CLIENTS FOR THIS STREAM'                             
           DISPLAY  'B1 TABLE COUNT = ' B1-TBL-CNT                              
                    ' # OF CLIENTS THAT ARE ACATS CLIENTS'.                     
           DISPLAY ' '.                                                         
                                                                                
       1500-EXIT. EXIT.                                                         
      /                                                                         
      ******************************************************************        
      *  READ THE NSCC FILE AND MOVE TO WORKING-STORAGE.                        
      ******************************************************************        
       1800-READ-INPUT.                                                         
           MOVE '1800-READ-INPUT            ' TO W-ROUTINE-1.                   
                                                                                
           READ INFILE                                                          
                AT END                                                          
                   MOVE '1'              TO END-OF-INPUT-SW                     
                   DISPLAY 'CAT525: END OF INPUT REACHED'                       
                            '.  INPUT-CNT = ' W-INFILE-CNT                      
                   GO TO 1800-EXIT                                              
           END-READ.                                                            
                                                                                
           ADD  1                        TO W-INFILE-CNT.                       
                                                                                
           IF  INFILE-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT525: ERROR READING INFILE'                           
               DISPLAY 'CAT525: READ STATUS = ' INFILE-FILE-STATUS              
                            '.  INPUT-CNT = ' W-INFILE-CNT                      
               DISPLAY 'CAT525: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           MOVE SPACES                   TO W-NSCC-RECORD.                      
                                                                                
           MOVE INFILE-RECORD   (1 : W-REC-LEN-IN) TO                           
                W-NSCC-RECORD   (1 : W-REC-LEN-IN).                             
                                                                                
           IF  INFILE-HDR-RECORD                                                
               DISPLAY 'CAT525: INFILE-HDR-REC = '                              
                                                 INFILE-HDR-REC (1:120)         
               GO TO 1800-EXIT                                                  
           ELSE                                                                 
               IF  INFILE-TRL-RECORD                                            
                   DISPLAY 'CAT525: INFILE-TRL-REC = '                          
                                                 INFILE-TRL-REC (1:120)         
                   GO TO 1800-READ-INPUT                                        
               END-IF                                                           
           END-IF.                                                              
                                                                                
       1800-EXIT. EXIT.                                                         
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
              AND B1-BROKER-NO   (B1-SUB) > ' '                                 
                  MOVE B1-CLT-NO     (B1-SUB) TO W-CURRENT-CLIENT-N             
                  MOVE B1-BROKER-NO  (B1-SUB) TO W-CURRENT-BROKER               
                  MOVE B1-STREAM     (B1-SUB) TO W-CURRENT-STREAM               
                  DISPLAY     'PROCESSING '                                     
                                     'CLT ' B1-CLT-NO  (B1-SUB)                 
                                        ' ' B1-CLT-NAME(B1-SUB)                 
                  PERFORM 3000-FETCH-TRANFER THRU 3000-EXIT                     
              END-IF                                                            
                                                                                
           END-PERFORM.                                                         
                                                                                
       2000-EXIT. EXIT.                                                         
      /                                                                         
       3000-FETCH-TRANFER SECTION.                                              
           MOVE '3000-FETCH-TRANSFER        ' TO W-ROUTINE-1.                   
                                                                                
      *    FETCH VTRNFR FOR THIS CYCLE NUMBER AND TODAYS DATE                   
                                                                                
           EXEC SQL OPEN VTRNFR_CURSOR END-EXEC                                 
                                                                                
           MOVE SQLCODE      TO W-DB2-SQLCODE                                   
           MOVE SQLCODE      TO W-TFR-SQLCODE                                   
           IF SQLCODE NOT = +0                                                  
              DISPLAY 'VTRNFR CURSOR OPEN ERROR '                               
                            'SQLCODE = ' W-DB2-SQLCODE                          
           END-IF                                                               
                                                                                
           PERFORM UNTIL W-TFR-SQLCODE NOT = +0                                 
                                                                                
              ADD 1 TO W-VTRNFR-CNT                                             
                                                                                
              EXEC SQL FETCH VTRNFR_CURSOR                                      
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
DJ0002             ,:DCLVTRNFR.ALERT-IND                                        
                   ,:DCLVTRNFR.ACCT-RB-SEC-IND                                  
DJ0002             ,:DCLVTRNFR.ACCT-CLT-RSCND-IND                               
DJ0002             ,:DCLVTRNFR.ACCT-LGL-BLK-IND                                 
DJ0002             ,:DCLVTRNFR.FRV-MFC-CMPLT-IND                                
DJ0002             ,:DCLVTRNFR.ACCT-FRZN-IND                                    
DJ0002             ,:DCLVTRNFR.BRANCH-ALTNT-CD                                  
DJ0002             ,:DCLVTRNFR.GIFT-IND                                         
DJ0002             ,:DCLVTRNFR.RSTR-TRD-90-DY-IND                               
DJ0002             ,:DCLVTRNFR.REG-T-IND                                        
DJ0002             ,:DCLVTRNFR.ADOPT-AGRMT-IND                                  
DJ0002             ,:DCLVTRNFR.RR-ORGNL-CD                                      
DJ0002             ,:DCLVTRNFR.CVRSN-ACCT-NBR                                   
DJ0003             ,:DCLVTRNFR.AUCTION-RT-IND                                   
LRM005             ,:DCLVTRNFR.NTWRK-LVL4-FND-IND                               
              END-EXEC                                                          
                                                                                
              MOVE SQLCODE      TO W-DB2-SQLCODE                                
              MOVE SQLCODE      TO W-TFR-SQLCODE                                
              EVALUATE SQLCODE                                                  
                  WHEN +0                                                       
                       PERFORM 4000-LOAD     THRU 4000-EXIT                     
                  WHEN +100                                                     
                       DISPLAY 'INP=' W-VTRNFR-CNT                              
                              ' VTRNFR CURSOR FETCH NOT FOUND '                 
                              ' SQLCODE = ' W-DB2-SQLCODE                       
                  WHEN OTHER                                                    
                       DISPLAY 'INP=' W-VTRNFR-CNT                              
                              ' VTRNFR CURSOR FETCH ERROR '                     
                              ' SQLCODE = ' W-DB2-SQLCODE                       
                       PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   
              END-EVALUATE                                                      
                                                                                
           END-PERFORM                                                          
                                                                                
           EXEC SQL CLOSE VTRNFR_CURSOR END-EXEC                                
                                                                                
           MOVE SQLCODE      TO W-DB2-SQLCODE                                   
           MOVE SQLCODE      TO W-TFR-SQLCODE                                   
           IF  SQLCODE NOT = +0                                                 
               DISPLAY 'INP= ' W-VTRNFR-CNT                                     
                      ' VTRNFR CURSOR CLOSE ERROR '                             
                      ' SQLCODE = ' W-DB2-SQLCODE                               
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                           
           END-IF.                                                              
       3000-EXIT. EXIT.                                                         
      /                                                                         
       4000-LOAD.                                                               
           MOVE '4000-LOAD                         ' TO W-ROUTINE-1.            
      *    FETCH VTRNFR FOR THIS CYCLE NUMBER AND TODAYS DATE                   
      *    FUL STATUS = 100, 110 WE ARE DELIVERER                               
      *    FUL STATUS = 200, 210 WE ARE RECEIVER                                
      *    PTR STATUS = 500      WE ARE DELIVERER                               
      *    PTR STATUS = 200      WE ARE RECEIVER                                
      *    PTD STATUS = 200      WE ARE RECEIVER                                
      *                                                                         
      *    FETCH ACTIAST FOR THIS CYCLE NUMBER AND TODAYS DATE                  
      *    FOR MUTUAL FUND AUTO DELETE                                          
                                                                                
           MOVE CLIENT-NBR       OF DCLVTRNFR TO WF-CLIENT-NBR                  
           MOVE ACAT-CONTROL-NBR OF DCLVTRNFR TO WF-ACAT-CONTROL-NBR            
                                                                                
      * FOR CAT810 NIGHTLY RUN, CYCLE-NBR = '00'. NO INPUT FILE                 
      * GIVE THEM ALL STATUSES FOR 'FUL'                                        
DJ0001     IF  W-CYCLE-NBR = '00'                                               
DJ0001     AND (PRCS-DT            OF DCLVTRNFR = W-PRCS-DT)                    
DJ0001     AND (TRNFR-TYPE-CD OF DCLVTRNFR = 'FUL' OR 'PTR' OR 'PTD')           
DJ0001         DISPLAY  WF-CLIENT-NBR                                           
DJ0001             ' '  WF-ACAT-CONTROL-NBR                                     
DJ0001             ' '  PRCS-DT       OF DCLVTRNFR                              
DJ0001             ' '  DLVR-NBR      OF DCLVTRNFR                              
DJ0001             ' '  TRNFR-TYPE-CD OF DCLVTRNFR                              
DJ0001             ' '  STTS-CD       OF DCLVTRNFR                              
DJ0001             ' '  PRGM-NM       OF DCLVTRNFR                              
DJ0001             ' '  UPDT-TMSTP    OF DCLVTRNFR                              
DJ0001             ' '  CYCLE-CD      OF DCLVTRNFR                              
DJ0001         PERFORM 5000-WRITE-CATEXCP THRU 5000-EXIT                        
DJ0001     END-IF.                                                              
                                                                                
DJ0001     IF  (W-CYCLE-NBR NOT = '00' AND                                      
                CYCLE-CD OF DCLVTRNFR = W-CYCLE-NBR)                            
           AND (PRCS-DT            OF DCLVTRNFR = W-PRCS-DT)                    
           AND (DLVR-NBR           OF DCLVTRNFR = W-CURRENT-BROKER)             
           AND (TRNFR-TYPE-CD      OF DCLVTRNFR = 'FUL')                        
           AND (STTS-CD       OF DCLVTRNFR = '100' OR '110')                    
               DISPLAY  WF-CLIENT-NBR                                           
                   ' '  WF-ACAT-CONTROL-NBR                                     
                   ' '  PRCS-DT       OF DCLVTRNFR                              
                   ' '  DLVR-NBR      OF DCLVTRNFR                              
                   ' '  TRNFR-TYPE-CD OF DCLVTRNFR                              
                   ' '  STTS-CD       OF DCLVTRNFR                              
                   ' '  PRGM-NM       OF DCLVTRNFR                              
                   ' '  UPDT-TMSTP    OF DCLVTRNFR                              
DJ0001             ' '  CYCLE-CD      OF DCLVTRNFR                              
               PERFORM 5000-WRITE-CATEXCP THRU 5000-EXIT                        
           END-IF.                                                              
                                                                                
           IF  (W-CYCLE-NBR NOT = '00' AND                                      
                CYCLE-CD OF DCLVTRNFR = W-CYCLE-NBR)                            
           AND  PRCS-DT       OF DCLVTRNFR = W-PRCS-DT                          
           AND  RCV-NBR       OF DCLVTRNFR = W-CURRENT-BROKER                   
           AND  TRNFR-TYPE-CD OF DCLVTRNFR = 'FUL'                              
           AND (STTS-CD       OF DCLVTRNFR = '200' OR '210')                    
               DISPLAY  WF-CLIENT-NBR                                           
                   ' '  WF-ACAT-CONTROL-NBR                                     
                   ' '  PRCS-DT       OF DCLVTRNFR                              
                   ' '  DLVR-NBR      OF DCLVTRNFR                              
                   ' '  TRNFR-TYPE-CD OF DCLVTRNFR                              
                   ' '  STTS-CD       OF DCLVTRNFR                              
                   ' '  PRGM-NM       OF DCLVTRNFR                              
                   ' '  UPDT-TMSTP    OF DCLVTRNFR                              
DJ0001             ' '  CYCLE-CD      OF DCLVTRNFR                              
               PERFORM 5000-WRITE-CATEXCP THRU 5000-EXIT                        
               PERFORM 6000-CHECK-ACTIAST THRU 6000-EXIT                        
           END-IF.                                                              
                                                                                
           IF  (W-CYCLE-NBR NOT = '00' AND                                      
                CYCLE-CD OF DCLVTRNFR = W-CYCLE-NBR)                            
           AND  PRCS-DT       OF DCLVTRNFR = W-PRCS-DT                          
           AND  DLVR-NBR      OF DCLVTRNFR = W-CURRENT-BROKER                   
           AND  TRNFR-TYPE-CD OF DCLVTRNFR = 'PTR'                              
           AND (STTS-CD       OF DCLVTRNFR = '500')                             
               DISPLAY  WF-CLIENT-NBR                                           
                   ' '  WF-ACAT-CONTROL-NBR                                     
                   ' '  PRCS-DT       OF DCLVTRNFR                              
                   ' '  DLVR-NBR      OF DCLVTRNFR                              
                   ' '  TRNFR-TYPE-CD OF DCLVTRNFR                              
                   ' '  STTS-CD       OF DCLVTRNFR                              
                   ' '  PRGM-NM       OF DCLVTRNFR                              
                   ' '  UPDT-TMSTP    OF DCLVTRNFR                              
DJ0001             ' '  CYCLE-CD      OF DCLVTRNFR                              
               PERFORM 5000-WRITE-CATEXCP THRU 5000-EXIT                        
           END-IF.                                                              
                                                                                
           IF  (W-CYCLE-NBR NOT = '00' AND                                      
                CYCLE-CD OF DCLVTRNFR = W-CYCLE-NBR)                            
           AND  PRCS-DT       OF DCLVTRNFR = W-PRCS-DT                          
           AND  RCV-NBR       OF DCLVTRNFR = W-CURRENT-BROKER                   
           AND (TRNFR-TYPE-CD OF DCLVTRNFR = 'PTD' OR 'PTR')                    
           AND (STTS-CD       OF DCLVTRNFR = '200')                             
               DISPLAY  WF-CLIENT-NBR                                           
                   ' '  WF-ACAT-CONTROL-NBR                                     
                   ' '  PRCS-DT       OF DCLVTRNFR                              
                   ' '  DLVR-NBR      OF DCLVTRNFR                              
                   ' '  TRNFR-TYPE-CD OF DCLVTRNFR                              
                   ' '  STTS-CD       OF DCLVTRNFR                              
                   ' '  PRGM-NM       OF DCLVTRNFR                              
                   ' '  UPDT-TMSTP    OF DCLVTRNFR                              
DJ0001             ' '  CYCLE-CD      OF DCLVTRNFR                              
               PERFORM 5000-WRITE-CATEXCP THRU 5000-EXIT                        
           END-IF.                                                              
                                                                                
       4000-EXIT. EXIT.                                                         
      /                                                                         
       5000-WRITE-CATEXCP.                                                      
           MOVE '5000-WRITE-CATEXCP               ' TO W-ROUTINE-1.             
                                                                                
           MOVE SPACES                   TO W-CATEXCP-RECORD                    
           MOVE 'T'                      TO W-CATEXCP-REC-TYPE                  
           MOVE CLIENT-NBR         OF DCLVTRNFR                                 
                                         TO W-CATEXCP-CLIENT-NBR                
           MOVE ACAT-CONTROL-NBR   OF DCLVTRNFR                                 
                                         TO W-CATEXCP-ACAT-CONTROL-NBR          
           MOVE BRANCH-CD          OF DCLVTRNFR                                 
                                         TO W-CATEXCP-BRANCH-CD                 
           MOVE ACCT-CD            OF DCLVTRNFR                                 
                                         TO W-CATEXCP-ACCT-CD                   
                                                                                
      *****CAT513: MOVE 'Y' TO NSCC-NON-ADP-IND OF DCLVTRNFR                    
      *****'ACCOUNT NOT ON N/A'                                                 
           IF NSCC-NON-ADP-IND   OF DCLVTRNFR  = 'Y'                            
              MOVE SPACES TO W-CATEXCP-DATA                                     
              SET W-CATEXCP-NSCC-NON-ADP TO TRUE                                
              WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                        
              ADD 1 TO W-CATEXCP-CNT.                                           
                                                                                
                                                                                
      *****IF ORIG ACCT FLAT, LOOK FOR INTERNAL TRANSFER NEW ACCOUNT            
      *****   CATEXCP-ORIGINAL-ACCT-FLAT                                        
      *****   CATEXCP-ALT-ACCT-CD                                               
      *****   CATEXCP-ALT-BRANCH-CD                                             
LRM006     SET W-ORIGINAL-ACCT-OK TO TRUE                                       
           IF  TRNFR-TYPE-RJC2-CD OF DCLVTRNFR = 'F'                            
               MOVE SPACES TO CATEXCP-DATA                                      
               PERFORM 5100-CHECK-ACTITRF THRU 5100-EXIT                        
               IF W-CATEXCP-ORIGINAL-ACCT-FLAT                                  
                   SET W-CATEXCP-ORIGINAL-ACCT-FLAT TO TRUE                     
LRM006             SET W-ORIGINAL-ACCT-FLAT TO TRUE                             
                   WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                   
                   ADD 1 TO W-CATEXCP-CNT                                       
           END-IF.                                                              
                                                                                
      *****CAT513: GIFT INDICATOR FROM NSCC FILE                                
      *****'GIFT INDICATED'                                                     
           IF  GIFT-IND OF DCLVTRNFR = '1'                                      
               MOVE SPACES TO W-CATEXCP-DATA                                    
               SET W-CATEXCP-GIFT TO TRUE                                       
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
      *****CAT513: MOVE 'Y' TO ACCT-RB-SEC-IND OF DCLVTRNFR                     
      *****CAT518/9: MOVE 'Y' TO ACCT-RB-SEC-IND OF DCLVTRNFR                   
      *****'ACCOUNT HAS RESTRICTED SECURITY ON BLOCK FILE'                      
           IF  ACCT-RB-SEC-IND OF DCLVTRNFR = 'Y'                               
               MOVE SPACES TO W-CATEXCP-DATA                                    
               SET W-CATEXCP-RESTRICTED-SEC TO TRUE                             
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
      *****CAT513: MOVE 'Y' TO ACCT-CLT-RSCND-IND OF DCLVTRNFR                  
      *****'CLIENT RESCIND ON BLOCK FILE'                                       
           IF  ACCT-CLT-RSCND-IND OF DCLVTRNFR = 'Y'                            
               MOVE SPACES TO W-CATEXCP-DATA                                    
               SET W-CATEXCP-CLIENT-RESCIND TO TRUE                             
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
      *****CAT513: MOVE 'Y' TO ACCT-LGL-BLK-IND OF DCLVTRNFR                    
      *****'LEGAL FREEZE ON BLOCK FILE'                                         
           IF  ACCT-LGL-BLK-IND OF DCLVTRNFR = 'Y'                              
               MOVE SPACES TO W-CATEXCP-DATA                                    
               SET W-CATEXCP-LEGAL-BLOCK TO TRUE                                
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
      *****CAT513: MOVE 'Y' TO ACCT-TIN-MSMTH-IND OF DCLVTRNFR                  
      *****'TAX ID MISMATCH'                                                    
           IF  ACCT-TIN-MSMTH-IND OF DCLVTRNFR = 'Y'                            
               MOVE SPACES TO W-CATEXCP-DATA                                    
               SET W-CATEXCP-TIN-MISMATCH TO TRUE                               
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
      *****CAT513: MOVE 'Y' TO ACCT-DPLCT-TRN-IND OF DCLVTRNFR                  
      *****'DUPLICATE TIF'                                                      
           IF  ACCT-DPLCT-TRN-IND OF DCLVTRNFR = 'Y'                            
               MOVE SPACES TO W-CATEXCP-DATA                                    
               SET W-CATEXCP-DUPLICATE-TIF TO TRUE                              
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
      *****CAT513: MOVE 'N' TO ADOPT-AGRMT-IND OF DCLVTRNFR                     
?     *****'ADOPTION AGREEMENT MISSING'                                         
           IF  ADOPT-AGRMT-IND OF DCLVTRNFR = 'Y'                               
               MOVE SPACES TO W-CATEXCP-DATA                                    
               SET W-CATEXCP-ADOPT-AGRMT TO TRUE                                
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
      *****CAT513: MOVE 'Y' TO ACCT-BRKR-TIF-IND OF DCLVTRNFR                   
      *****'BROKER REQUIRES PAPERWORK AS PART OF TRANSFER'                      
           IF  ACCT-BRKR-TIF-IND OF DCLVTRNFR = 'Y'                             
               MOVE SPACES TO W-CATEXCP-DATA                                    
               SET W-CATEXCP-ACCT-BRKR-TIF TO TRUE                              
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
      *****CAT513: MOVE 'Y' TO CMNT-STTS-CD OF DCLVTRNFR                        
      *****'ACCOUNT HAS COMMENTS'                                               
           IF  CMNT-STTS-CD OF DCLVTRNFR = 'Y'                                  
               MOVE SPACES TO W-CATEXCP-DATA                                    
               SET W-CATEXCP-COMMENTS TO TRUE                                   
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
      *****CAT513: MOVE '3' TO RCV-ACT-TYP-STS-CD OF DCLVTRNFR                  
      *****'CUSTOMER TYPE MISMATCH'                                             
           IF  RCV-ACT-TYP-STS-CD OF DCLVTRNFR = '3'                            
               MOVE SPACES TO W-CATEXCP-DATA                                    
               SET W-CATEXCP-CUST-TYP-MSMTH TO TRUE                             
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
      *****CAT513: MOVE 'Y' TO ACCT-CUST-70-IND OF DCLVTRNFR                    
      *****'ACCOUNT HAS CUSTOMER OVER 70.5 YEARS OF AGE'                        
           IF  ACCT-CUST-70-IND OF DCLVTRNFR = 'Y'                              
               MOVE SPACES TO W-CATEXCP-DATA                                    
               SET W-CATEXCP-ACCT-CUST-70 TO TRUE                               
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
      *****CAT513: MOVE 'Y' TO ACCT-QULFD-PLN-IND OF DCLVTRNFR                  
      *****'ACCOUNT HAS QUALIFIED PLAN'                                         
           IF  ACCT-QULFD-PLN-IND OF DCLVTRNFR = 'Y'                            
               MOVE SPACES TO W-CATEXCP-DATA                                    
               SET W-CATEXCP-QUALIFIED-PLAN TO TRUE                             
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
      *****CAT513: MOVE 'SP' TO TRNFR-TYPE-RJC1-CD OF DCLVTRNFR                 
      *****'SPECIAL ACCOUNT'                                                    
DJ0002     IF  TRNFR-TYPE-RJC1-CD OF DCLVTRNFR = 'SP'                           
               MOVE SPACES TO W-CATEXCP-DATA                                    
               SET W-CATEXCP-SPECIAL-ACCT TO TRUE                               
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
      *****'ACCOUNT HAS MANAGED ASSETS'                                         
           IF  ACCT-MNGD-IND OF DCLVTRNFR = 'Y'                                 
               MOVE SPACES TO W-CATEXCP-DATA                                    
               SET W-CATEXCP-MANAGED-ASSETS TO TRUE                             
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
      *****'TIF REJECTED AND RESUBITTED'                                        
           IF  ACCT-RJCT-RSBM-IND OF DCLVTRNFR = 'Y'                            
               MOVE SPACES TO W-CATEXCP-DATA                                    
               SET W-CATEXCP-ACCT-RJCT-RSBM TO TRUE                             
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
      *****CAT872: MOVE 'Y'  TO  ID-ACCT-ACTIVITY-IND                           
      *****'ACCOUNT HAS ACTIVITY'                                               
           IF  ACCT-ACTIVITY-IND OF DCLVTRNFR = 'Y'                             
               MOVE SPACES TO W-CATEXCP-DATA                                    
               SET W-CATEXCP-ACCT-ACTIVITY TO TRUE                              
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
      *****CAT515: MOVE 'Y' TO ACCT-MRGN-DB-IND OF DCLVTRNFR                    
      *****CAT518/9: MOVE 'Y' TO ACCT-MRGN-DB-IND OF DCLVTRNFR                  
      *****'ACCOUNT HAS MARGIN DEBIT'                                           
           IF  ACCT-MRGN-DB-IND OF DCLVTRNFR = 'Y'                              
               MOVE SPACES TO W-CATEXCP-DATA                                    
               SET W-CATEXCP-ACCT-MRGN-DB TO TRUE                               
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
      *****CAT515: MOVE 'Y' TO ACCT-AST-EXCS-IND OF DCLVTRNFR                   
      *****CAT518/9: MOVE 'Y' TO ACCT-AST-EXCS-IND OF DCLVTRNFR                 
      *****'ACCOUNT HAS ASSET IN EXCESS OF SPECIFIED LIMIT'                     
           IF  ACCT-AST-EXCS-IND OF DCLVTRNFR = 'Y'                             
               MOVE SPACES TO W-CATEXCP-DATA                                    
               SET W-CATEXCP-ACCT-AST-EXCS TO TRUE                              
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
      *****CAT515: MOVE 'Y' TO ACCT-DB-BAL-T1-IND OF DCLVTRNFR                  
      *****CAT518/9: MOVE 'Y' TO ACCT-DB-BAL-T1-IND OF DCLVTRNFR                
      *****'ACCOUNT HAS DEBIT BALANCE TYPE 1 (CASH)'                            
           IF  ACCT-DB-BAL-T1-IND OF DCLVTRNFR = 'Y'                            
               MOVE SPACES TO W-CATEXCP-DATA                                    
               SET W-CATEXCP-ACCT-DB-BAL-T1 TO TRUE                             
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
      *****CAT515: MOVE 'Y' TO ACCT-SHRT-PSTN-IND OF DCLVTRNFR                  
      *****CAT518/9: MOVE 'Y' TO ACCT-SHRT-PSTN-IND OF DCLVTRNFR                
      *****'ACCOUNT HAS SHORT POSITION'                                         
           IF  ACCT-SHRT-PSTN-IND OF DCLVTRNFR = 'Y'                            
               MOVE SPACES TO W-CATEXCP-DATA                                    
               SET W-CATEXCP-ACCT-SHRT-PSTN TO TRUE                             
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
      *****CAT515: MOVE 'Y' TO ACCT-SEC-RSTRD-IND OF DCLVTRNFR                  
      *****CAT518/9: MOVE 'Y' TO ACCT-SEC-RSTRD-IND OF DCLVTRNFR                
      *****'ACCOUNT HAS RESTRICTED SECURITIES'                                  
           IF  ACCT-SEC-RSTRD-IND OF DCLVTRNFR = 'Y'                            
               MOVE SPACES TO W-CATEXCP-DATA                                    
               SET W-CATEXCP-ACCT-SEC-RSTRD TO TRUE                             
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
      *****CAT515: MOVE 'Y' TO ACCT-LTD-PRTNR-IND OF DCLVTRNFR                  
      *****CAT518/9: MOVE 'Y' TO ACCT-LTD-PRTNR-IND OF DCLVTRNFR                
      *****'ACCOUNT HAS POSITION IN A LIMITED PARTNERSHIP'                      
           IF  ACCT-LTD-PRTNR-IND OF DCLVTRNFR = 'Y'                            
               MOVE SPACES TO W-CATEXCP-DATA                                    
               SET W-CATEXCP-ACCT-LTD-PRTNR TO TRUE                             
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
      *****CAT515:   MOVE 'Y' TO ACCT-OPTN-PSTN-IND OF DCLVTRNFR                
      *****CAT518/9: MOVE 'Y' TO ACCT-OPTN-PSTN-IND OF DCLVTRNFR                
      *****'ACCOUNT HAS POSITION IN OPTION'                                     
           IF  ACCT-OPTN-PSTN-IND OF DCLVTRNFR = 'Y'                            
               MOVE SPACES TO W-CATEXCP-DATA                                    
               SET W-CATEXCP-ACCT-OPTN-PSTN TO TRUE                             
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
      *****CAT518/9: MOVE 'X' TO ACCT-OPTN-PSTN-IND OF DCLVTRNFR                
      *****'ACCOUNT HAS EXPIRING OPTIONS'                                       
           IF  ACCT-OPTN-PSTN-IND OF DCLVTRNFR = 'X'                            
               MOVE SPACES TO W-CATEXCP-DATA                                    
               SET W-CATEXCP-EXPIRING-OPTN TO TRUE                              
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
      *****CAT518/9: MOVE 'Y' TO ACCT-ORDERS-IND OF DCLVTRNFR                   
      *****'ACCOUNT HAS OPEN ORDER(S)'                                          
           IF  ACCT-ORDERS-IND OF DCLVTRNFR = 'Y'                               
               MOVE SPACES TO W-CATEXCP-DATA                                    
               SET W-CATEXCP-OPEN-ORDERS TO TRUE                                
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
      *****CAT518/9: MOVE 'Y' TO ACCT-PRVT-RNG-IND OF DCLVTRNFR                 
      *****'ACCOUNT HAS PRIVATE RANGE SECURITIES'                               
           IF  ACCT-PRVT-RNG-IND OF DCLVTRNFR = 'Y'                             
               MOVE SPACES TO W-CATEXCP-DATA                                    
               SET W-CATEXCP-PRIVATE-RANGE TO TRUE                              
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
      *****CAT515: MOVE 'Y' TO REG-T-IND OF DCLVTRNFR                           
      *****'REG T CALL'                                                         
           IF  REG-T-IND OF DCLVTRNFR = 'Y'                                     
               MOVE SPACES TO W-CATEXCP-DATA                                    
               SET W-CATEXCP-REGT TO TRUE                                       
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
      *****CAT515: MOVE 'Y' TO RSTR-TRD-90-DY-IND OF DCLVTRNFR                  
      *****'90 DAY TRADE RESTRICTION'                                           
           IF  RSTR-TRD-90-DY-IND OF DCLVTRNFR = 'Y'                            
               MOVE SPACES TO W-CATEXCP-DATA                                    
               SET W-CATEXCP-90DR TO TRUE                                       
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
      *****PASS CLIENT 313 CONVERSIO ACCOUNT CHANGE ON EFAA RECORD              
LRM008     IF CLIENT-NBR OF DCLVTRNFR = '0313'                                  
LRM008     AND CVRSN-ACCT-NBR OF DCLVTRNFR (1:8) > SPACES                       
LRM008     AND CVRSN-ACCT-NBR OF DCLVTRNFR (1:11) NOT = 'CONV REJECT'           
LRM008     AND TRNFR-TYPE-CD      OF DCLVTRNFR = 'FUL'                          
LRM008     AND DSTBN-SIDE-CD      OF DCLVTRNFR = 'D'                            
LRM008         MOVE CVRSN-ACCT-NBR OF DCLVTRNFR                                 
LRM008                        TO  W-CATEXCP-BRN-ACCT                            
LRM008         MOVE ACCT-DLVR-NBR OF DCLVTRNFR (1:8)                            
LRM008                        TO  W-CATEXCP-ALT-BRN-ACCT                        
LRM008         SET W-CATEXCP-ORIGINAL-ACCT-FLAT TO TRUE                 CATEXCP 
LRM008         WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
LRM008         ADD 1 TO W-CATEXCP-CNT                                           
LRM008     ELSE                                                                 
      *****CAT518/9: MOVE 'F' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                
      *****'ACCOUNT IS FLAT'  AND NOT AN INTERNAL TRANSFER                      
           IF  TRNFR-TYPE-RJC2-CD OF DCLVTRNFR = 'F'                            
LRM006     AND NOT W-ORIGINAL-ACCT-FLAT                                         
               MOVE SPACES TO W-CATEXCP-DATA                                    
               SET W-CATEXCP-ACCT-FLAT TO TRUE                                  
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
DJ0001*****IF PTR IS FLAT (AFXX(H),AFNN(I),AFXN(L),AFEE(Z)) MOVE Y              
DJ0001     IF TRNFR-TYPE-CD OF DCLVTRNFR = 'PTR'                                
             MOVE SPACES TO W-CATEXCP-DATA                                      
DJ0001       EVALUATE TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                           
DJ0001         WHEN 'H'   SET W-CATEXCP-ACCT-FLAT TO TRUE                       
                          WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD            
                          ADD 1 TO W-CATEXCP-CNT                                
DJ0001         WHEN 'I'   SET W-CATEXCP-ACCT-FLAT TO TRUE                       
                          WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD            
                          ADD 1 TO W-CATEXCP-CNT                                
DJ0001         WHEN 'L'   SET W-CATEXCP-ACCT-FLAT TO TRUE                       
                          WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD            
                          ADD 1 TO W-CATEXCP-CNT                                
DJ0001         WHEN 'Z'   SET W-CATEXCP-ACCT-FLAT TO TRUE                       
                          WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD            
                          ADD 1 TO W-CATEXCP-CNT                                
DJ0001       END-EVALUATE                                                       
DJ0001     END-IF                                                               
                                                                                
      *****CAT518: MOVE 'F' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                  
      *****                                                                     
      *****'ALL ASSETS FULFILLED, NO CASH WAS FULFILLED'                        
      *****MOVE 'A' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                          
      *****                                                                     
      *****'ALL ASSETS FULFILLED, CASH PARTIALLY FULFILLED'                     
      *****MOVE 'B' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                          
      *****                                                                     
      *****'ASSETS PARTIALLY FULFILLED'                                         
      *****MOVE 'C' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                          
      *****                                                                     
      *****'ASSETS PARTIALLY FULFILLED, NO CASH WAS FULFILLED'                  
      *****MOVE 'D' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                          
      *****                                                                     
      *****'ASSETS PARTIALLY FULFILLED, ALL CASH FULFILLED'                     
      *****MOVE 'E' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                          
      *****                                                                     
      *****'ASSETS PARTIALLY FULFILLED, CASH PARTIALLY FULFILLED'               
      *****MOVE 'G' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                          
      *****                                                                     
      *****'NONE OF ASSETS FULFILLED'                                           
      *****MOVE 'H' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                          
      *****                                                                     
      *****'NONE OF ASSETS FULFILLED, NO CASH WAS FULFILLED'                    
      *****MOVE 'I' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                          
      *****                                                                     
      *****'NONE OF ASSETS FULFILLED, ALL CASH FULFILLED'                       
      *****MOVE 'J' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                          
      *****                                                                     
      *****'NONE OF ASSETS FULFILLED, CASH PARTIALLY FULFILED'                  
      *****MOVE 'K' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                          
      *****                                                                     
      *****'NO CASH WAS FULFILLED'                                              
      *****MOVE 'L' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                          
      *****                                                                     
      *****'CASH PARTIALLY FULFILLED'                                           
      *****MOVE 'M' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                          
      *****                                                                     
      *****'NONE OF THE ASSETS EXIST OR ARE ELIGIBLE TO DELIVER'                
      *****MOVE 'Z' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                          
      *****                                                                     
           IF TRNFR-TYPE-CD OF DCLVTRNFR = 'PTR'                                
             MOVE SPACES TO W-CATEXCP-DATA                                      
             SET W-CATEXCP-PARTIAL-FULFILL TO TRUE                              
             EVALUATE TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                           
               WHEN 'A'   SET W-CATEXCP-PTR-AFFN TO TRUE                        
                          WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD            
                          ADD 1 TO W-CATEXCP-CNT                                
               WHEN 'B'   SET W-CATEXCP-PTR-AFFP TO TRUE                        
                          WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD            
                          ADD 1 TO W-CATEXCP-CNT                                
               WHEN 'C'   SET W-CATEXCP-PTR-AFPX TO TRUE                        
                          WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD            
                          ADD 1 TO W-CATEXCP-CNT                                
               WHEN 'D'   SET W-CATEXCP-PTR-AFPN TO TRUE                        
                          WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD            
                          ADD 1 TO W-CATEXCP-CNT                                
               WHEN 'E'   SET W-CATEXCP-PTR-AFPF TO TRUE                        
                          WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD            
                          ADD 1 TO W-CATEXCP-CNT                                
               WHEN 'G'   SET W-CATEXCP-PTR-AFPP TO TRUE                        
                          WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD            
                          ADD 1 TO W-CATEXCP-CNT                                
               WHEN 'H'   SET W-CATEXCP-PTR-AFXX TO TRUE                        
                          WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD            
                          ADD 1 TO W-CATEXCP-CNT                                
               WHEN 'I'   SET W-CATEXCP-PTR-AFNN TO TRUE                        
                          WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD            
                          ADD 1 TO W-CATEXCP-CNT                                
               WHEN 'J'   SET W-CATEXCP-PTR-AFNF TO TRUE                        
                          WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD            
                          ADD 1 TO W-CATEXCP-CNT                                
               WHEN 'K'   SET W-CATEXCP-PTR-AFNP TO TRUE                        
                          WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD            
                          ADD 1 TO W-CATEXCP-CNT                                
               WHEN 'L'   SET W-CATEXCP-PTR-AFXN TO TRUE                        
                          WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD            
                          ADD 1 TO W-CATEXCP-CNT                                
               WHEN 'M'   SET W-CATEXCP-PTR-AFXP TO TRUE                        
                          WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD            
                          ADD 1 TO W-CATEXCP-CNT                                
               WHEN 'Z'   SET W-CATEXCP-PTR-AFEE TO TRUE                        
                          WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD            
                          ADD 1 TO W-CATEXCP-CNT                                
             END-EVALUATE                                                       
           END-IF.                                                              
                                                                                
           IF  B1-ACCT-FREEZE-PROC (B1-SUB) = '1'                               
               MOVE SPACES TO W-CATEXCP-DATA                                    
               PERFORM 5200-CHECK-ACCT-FREEZE THRU 5200-EXIT                    
               IF W-FAC-CASH-IN-IND = 'Y'                                       
                  SET W-CATEXCP-FRZ-CSH-IN-YES TO TRUE                          
                  WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                    
                  ADD 1 TO W-CATEXCP-CNT                                        
               END-IF                                                           
               IF W-FAC-CASH-OUT-IND = 'Y'                                      
                  SET W-CATEXCP-FRZ-CSH-OUT-YES TO TRUE                         
                  WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                    
                  ADD 1 TO W-CATEXCP-CNT                                        
               END-IF                                                           
               IF W-FAC-SEC-IN-IND  = 'Y'                                       
                  SET W-CATEXCP-FRZ-SEC-IN-YES TO TRUE                          
                  WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                    
                  ADD 1 TO W-CATEXCP-CNT                                        
               END-IF                                                           
               IF W-FAC-SEC-OUT-IND = 'Y'                                       
                  SET W-CATEXCP-FRZ-SEC-OUT-YES TO TRUE                         
                  WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                    
                  ADD 1 TO W-CATEXCP-CNT                                        
               END-IF                                                           
           END-IF.                                                              
                                                                                
      *****CAT513: MOVE 'Y' TO ACCT-FRZN-IND OF DCLVTRNFR                       
      *****'ACCOUNT FREEZE FOUND BY BATCH'                                      
           IF  ACCT-FRZN-IND OF DCLVTRNFR = 'Y'                                 
               MOVE SPACES TO W-CATEXCP-DATA                                    
               SET W-CATEXCP-ACCT-FRZN-YES TO TRUE                              
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
      *****CAT820DB: MOVE 'D' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                
DJ0001***** FOR FUL ONLY. 'ACCOUNT IS FLAT AS A RESULT OF FEE'                  
DJ0001     IF  TRNFR-TYPE-CD OF DCLVTRNFR = 'FUL'                               
DJ0001     AND TRNFR-TYPE-RJC2-CD OF DCLVTRNFR = 'D'                            
               MOVE SPACES TO W-CATEXCP-DATA                                    
               SET W-CATEXCP-ACCT-FLAT-FEE TO TRUE                              
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
DJ0001*****CAT518/CAT519/CAT810 'MEMO ONLY - RESTRICTED ASSET' FLAT             
DJ0001*****MOVE 'N' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                          
DJ0001     IF  TRNFR-TYPE-RJC2-CD OF DCLVTRNFR = 'N'                            
               MOVE SPACES TO W-CATEXCP-DATA                                    
DJ0001         SET W-CATEXCP-ACCT-FLAT-MEMO TO TRUE                             
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
DJ0003*****CAT515: MOVE 'Y' TO AUCTION-RT-IND OF DCLVTRNFR                      
DJ0003*****'AUCTION RATE SECURITY'                                              
DJ0003     IF  AUCTION-RT-IND OF DCLVTRNFR = 'Y'                                
               MOVE SPACES TO W-CATEXCP-DATA                                    
DJ0003         SET W-CATEXCP-AUCTION-RT TO TRUE                                 
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
LRM004     IF CVRSN-ACCT-NBR OF DCLVTRNFR (1:11) = 'CONV REJECT'                
               MOVE SPACES TO W-CATEXCP-DATA                                    
LRM004         SET W-CATEXCP-CONV-ACCT-YES TO TRUE                      CATEXCP 
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
LRM005     IF NTWRK-LVL4-FND-IND OF DCLVTRNFR = 'Y'                             
               MOVE SPACES TO W-CATEXCP-DATA                                    
LRM005         SET W-CATEXCP-NTW-LVL4-YES TO TRUE                               
               WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                       
               ADD 1 TO W-CATEXCP-CNT.                                          
                                                                                
       5000-EXIT. EXIT.                                                         
      /                                                                         
       5100-CHECK-ACTITRF.                                                      
      *   IF ORIGINAL ACCOUNT IS FLAT,                                          
      *   LOOK FOR A CHANGE RECORD FOR THE DELIVERER ACCOUNT NUMBER             
      *   FOR AN INTERNAL TRANSFER OR RBC DAIN CONVERSION                       
      *   CHECK FOR INTERNAL ACCT TRANFER IN ACTITRF                            
      *   IF FOUND, POPULATE RECORD WITH IT                                     
                                                                                
           MOVE ' '   TO W-ACTITRF-FND-SW                                       
           INITIALIZE DCLACTITRF                                                
                                                                                
           EXEC SQL SELECT                                                      
                   ACCT_DLVR_NBR                                                
                  ,TRANS_TYPE_CD                                                
                  ,UPDT_TMSTP                                                   
                  ,PRCS_DT                                                      
                  ,PRGM_NM                                                      
                  ,ACCT_DLVR_STTS_CD                                            
               INTO                                                             
                   :DCLACTITRF.ACCT-DLVR-NBR                                    
                  ,:DCLACTITRF.TRANS-TYPE-CD                                    
                  ,:DCLACTITRF.UPDT-TMSTP                                       
                  ,:DCLACTITRF.PRCS-DT                                          
                  ,:DCLACTITRF.PRGM-NM                                          
                  ,:DCLACTITRF.ACCT-DLVR-STTS-CD                                
               FROM  ACTITRF                                                    
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  ACAT_CONTROL_NBR  = :WF-ACAT-CONTROL-NBR                 
                  AND  TRANS_TYPE_CD     = 'C'                                  
DJ0001            WITH UR                                                       
           END-EXEC                                                             
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTITRF-CNT                                           
               MOVE 'Y'   TO W-ACTITRF-FND-SW                                   
               MOVE PRCS-DT OF DCLACTITRF(1:2) TO W-PRCS-DT-CC                  
               MOVE PRCS-DT OF DCLACTITRF(3:2) TO W-PRCS-DT-YY                  
               MOVE PRCS-DT OF DCLACTITRF(6:2) TO W-PRCS-DT-MM                  
               MOVE PRCS-DT OF DCLACTITRF(9:2) TO W-PRCS-DT-DD                  
               IF (PRGM-NM  OF DCLACTITRF = 'CAT519' OR 'CAT810')               
               AND PRCS-DT  OF DCLACTITRF = W-PRCS-DT                           
***************AND ACCT-DLVR-STTS-CD OF DCLACTITRF = '1'                        
LRM006******       MOVE 'Y'             TO CATEXCP-ORIGINAL-ACCT-FLAT           
                   SET W-CATEXCP-ORIGINAL-ACCT-FLAT TO TRUE                     
                   MOVE ACCT-DLVR-NBR OF DCLACTITRF                             
                                        TO W-CATEXCP-ALT-BRN-ACCT               
                   ADD 1 TO W-AC-CHG-CNT                                        
                   DISPLAY '     '                                              
                       PRGM-NM       OF DCLACTITRF                              
                   ' ' TRANS-TYPE-CD OF DCLACTITRF                              
                   ' ' PRCS-DT       OF DCLACTITRF                              
                   ' NEW ACCT ' ACCT-DLVR-NBR OF DCLACTITRF                     
                   ' OLD ACCT ' ACCT-DLVR-NBR OF DCLVTRNFR                      
                   DISPLAY '     ACCOUNT NUMBER CHANGE RECORD FOUND'            
               END-IF                                                           
           ELSE                                                                 
              IF  SQLCODE  =  +100                                              
                  MOVE 'N'   TO W-ACTITRF-FND-SW                                
              ELSE                                                              
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT525: ERROR SELECTING A ROW IN ACTITRF'           
                         ' (ACAT-TRNFR      TABLE)'                             
                   DISPLAY 'CAT525: DCLACTITRF  ='                              
                           '(' DCLACTITRF ')'                                   
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
              END-IF                                                            
           END-IF.                                                              
                                                                                
       5100-EXIT. EXIT.                                                         
      /                                                                         
       5200-CHECK-ACCT-FREEZE.                                                  
                                                                                
           MOVE ' '                      TO F-COMMAREA-FACZ1CA                  
           MOVE 'CAT525'                 TO F-CA-I-CALLER-PGM-ID                
           MOVE W-CATEXCP-CLIENT-NBR     TO F-CA-I-CLIENT4                      
           MOVE W-CATEXCP-BRANCH-CD      TO F-CA-I-BRANCH                       
           MOVE W-CATEXCP-ACCT-CD        TO F-CA-I-ACCT                         
           SET  F-CA-I-IND-REQUESTS-INIT TO TRUE                                
           SET  F-CA-I-CASH-IN-REQ-YES   TO TRUE                                
           SET  F-CA-I-SEC-IN-REQ-YES    TO TRUE                                
           CALL FACZ1B USING F-COMMAREA-FACZ1CA                                 
           MOVE F-CA-A-CASH-IN-IND       TO W-FAC-CASH-IN-IND                   
           MOVE F-CA-A-SEC-IN-IND        TO W-FAC-SEC-IN-IND                    
                                                                                
           MOVE ' '                      TO F-COMMAREA-FACZ1CA                  
           MOVE 'CAT525'                 TO F-CA-I-CALLER-PGM-ID                
           MOVE W-CATEXCP-CLIENT-NBR     TO F-CA-I-CLIENT4                      
           MOVE W-CATEXCP-BRANCH-CD      TO F-CA-I-BRANCH                       
           MOVE W-CATEXCP-ACCT-CD        TO F-CA-I-ACCT                         
           SET  F-CA-I-IND-REQUESTS-INIT TO TRUE                                
           SET  F-CA-I-CASH-OUT-REQ-YES  TO TRUE                                
           SET  F-CA-I-SEC-OUT-REQ-YES   TO TRUE                                
           CALL FACZ1B USING F-COMMAREA-FACZ1CA                                 
           MOVE F-CA-A-CASH-OUT-IND      TO W-FAC-CASH-OUT-IND                  
           MOVE F-CA-A-SEC-OUT-IND       TO W-FAC-SEC-OUT-IND.                  
                                                                                
       5200-EXIT. EXIT.                                                         
      /                                                                         
       6000-CHECK-ACTIAST.                                                      
      *   LOOK FOR MUTUAL FUND AUTO DELETE ON ACTIAST                           
      *   CREATE EXCEPTION RECORD FOR IT                                        
                                                                                
           EXEC SQL OPEN ACTIAST_CURSOR END-EXEC                                
           MOVE SQLCODE      TO W-DB2-SQLCODE                                   
           MOVE SQLCODE      TO W-AST-SQLCODE                                   
           PERFORM UNTIL W-AST-SQLCODE NOT = +0                                 
              ADD 1 TO W-ACTIAST-CNT                                            
              EXEC SQL FETCH ACTIAST_CURSOR                                     
               INTO                                                             
                   :DCLACTIAST.CLIENT-NBR                                       
                  ,:DCLACTIAST.DLVR-NBR                                         
                  ,:DCLACTIAST.ACCT-DLVR-NBR                                    
                  ,:DCLACTIAST.ACAT-CONTROL-NBR                                 
                  ,:DCLACTIAST.ASSET-SEQ-NBR                                    
                  ,:DCLACTIAST.CSH-MGN-SHRT-CD                                  
                  ,:DCLACTIAST.SECURITY-ADP-NBR                                 
                  ,:DCLACTIAST.STTLM-LCTN-CD                                    
                  ,:DCLACTIAST.TRANS-TYPE-CD                                    
                  ,:DCLACTIAST.PRGM-NM                                          
              END-EXEC                                                          
              MOVE SQLCODE      TO W-DB2-SQLCODE                                
              MOVE SQLCODE      TO W-AST-SQLCODE                                
              EVALUATE SQLCODE                                                  
                  WHEN +0                                                       
                       ADD 1 TO W-MF-DEL-CNT                                    
                       PERFORM 6100-FORMAT-MF-DELETE THRU 6100-EXIT             
                  WHEN +100                                                     
                       CONTINUE                                                 
                       DISPLAY 'INP=' W-ACTIAST-CNT                             
                              ' ACTIAST CURSOR FETCH NOT FOUND '                
                              ' SQLCODE = ' W-DB2-SQLCODE                       
                  WHEN OTHER                                                    
                       DISPLAY 'INP=' W-ACTIAST-CNT                             
                              ' ACTIAST CURSOR FETCH ERROR '                    
                              ' SQLCODE = ' W-DB2-SQLCODE                       
                       PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   
              END-EVALUATE                                                      
           END-PERFORM                                                          
                                                                                
           EXEC SQL CLOSE ACTIAST_CURSOR END-EXEC.                              
                                                                                
       6000-EXIT. EXIT.                                                         
      /                                                                         
       6100-FORMAT-MF-DELETE.                                                   
           MOVE '6100-FORMAT-MF-DELETE            ' TO W-ROUTINE-1.             
                                                                                
           MOVE SPACES                   TO W-CATEXCP-RECORD                    
           MOVE 'A'                      TO W-CATEXCP-REC-TYPE                  
           MOVE CLIENT-NBR         OF DCLVTRNFR                                 
                                         TO W-CATEXCP-CLIENT-NBR                
           MOVE ACAT-CONTROL-NBR   OF DCLVTRNFR                                 
                                         TO W-CATEXCP-ACAT-CONTROL-NBR          
           MOVE BRANCH-CD          OF DCLVTRNFR                                 
                                         TO W-CATEXCP-BRANCH-CD                 
           MOVE ACCT-CD            OF DCLVTRNFR                                 
                                         TO W-CATEXCP-ACCT-CD                   
           MOVE ASSET-SEQ-NBR      OF DCLACTIAST                                
                                         TO W-CATEXCP-ASSET-SEQ-NBR             
LRM006*****MOVE SECURITY-ADP-NBR   OF DCLACTIAST                                
LRM006*****                              TO W-CATEXCP-ASSET-ADP-NBR             
           SET W-CATEXCP-ASSET-MF-DELETE TO TRUE.                               
                                                                                
           DISPLAY '    MF-DELETE '                                             
                   W-CATEXCP-CLIENT-NBR                                         
               ' ' W-CATEXCP-ACAT-CONTROL-NBR                                   
               ' ' W-CATEXCP-BRANCH-CD                                          
               ' ' W-CATEXCP-ACCT-CD                                            
               ' ' W-CATEXCP-ASSET-SEQ-NBR                                      
LRM006*******  ' ' W-CATEXCP-ASSET-ADP-NBR                                      
               ' ' W-CATEXCP-ASSET-EXCP-RSN-CD                                  
                                                                                
           WRITE CATEXCP-RECORD FROM W-CATEXCP-RECORD                           
           ADD 1 TO W-CATEXCP-CNT.                                              
                                                                                
       6100-EXIT. EXIT.                                                         
      /                                                                         
       8500-SQL-ERROR.                                                          
           DISPLAY ' '                                                          
           CALL DSNTIAR         USING SQLCA W-DB2-MSG-AREA                      
                                            W-DB2-MSG-LEN.                      
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                                
             UNTIL W-DB2-IDX GREATER THAN 12                                    
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES                      
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)                       
                   END-IF                                                       
           END-PERFORM.                                                         
           DISPLAY ' '                                                          
           DISPLAY 'CAT525: U3999 - ABENDING ON BAD DB2 STATUS'                 
           DISPLAY 'CAT525: PROGRAM ENDED ABNORMALLY'                           
           MOVE +3999    TO ABEND-CODE                                          
           CALL ABEND USING ABEND-CODE.                                         
       8500-EXIT. EXIT.                                                         
      /                                                                         
       9000-CLOSE-ROUTINE.                                                      
           MOVE '9000-CLOSE-ROUTINE            ' TO W-ROUTINE-1.                
           DISPLAY ' '.                                                         
           MOVE ' '                      TO CATEXCP-TRAILER-RECORD              
           MOVE 'T'                      TO CP2-REQUEST-CODE.                   
           MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.                     
           MOVE W-CATEXCP-CNT            TO CP2-RECORD-COUNT.                   
           MOVE 999                      TO CP2-CLIENT-NUMBER.                  
           CALL P2HDTR                USING CP2-AREA                            
                                            CATEXCP.                            
           MOVE CP2-RETURN-RECORD        TO CATEXCP-TRAILER-RECORD              
           SET CATEXCP-TRL-CYCLE-LITERAL TO TRUE                                
           MOVE LD-PROC-DATE             TO CATEXCP-TRL-PROC-DATE               
           MOVE W-CYCLE-NBR              TO CATEXCP-TRL-CYCLE-NO                
           DISPLAY 'CAT525: CATEXCP-TRL= '  CATEXCP-TRAILER-RECORD              
                                                                                
           WRITE CATEXCP-RECORD.                                                
           DISPLAY 'CAT525: CATEXCP TRAILER WRITTEN. STATUS = '                 
                                             CATEXCP-STATUS.                    
           CLOSE CATEXCP                                                        
           DISPLAY 'CAT525: CATEXCP CLOSED. STATUS = '                          
                                             CATEXCP-STATUS.                    
           CLOSE INFILE                                                         
           DISPLAY 'CAT525: INFILE  CLOSED. STATUS = '                          
                                             INFILE-FILE-STATUS.                
           DISPLAY 'CAT525: W-VTRNFR-CNT  = ' W-VTRNFR-CNT                      
           DISPLAY 'CAT525: W-ACTITRF-CNT = ' W-ACTITRF-CNT                     
           DISPLAY 'CAT525: W-ACTIAST-CNT = ' W-ACTIAST-CNT                     
           DISPLAY 'CAT525: W-AC-CHG-CNT  = ' W-AC-CHG-CNT                      
           DISPLAY 'CAT525: W-MF-DEL-CNT  = ' W-MF-DEL-CNT                      
           DISPLAY 'CAT525: PROGRAM ENDED SUCCESSFULLY'.                        
       9000-EXIT. EXIT.                                                         
      *################################################################         
