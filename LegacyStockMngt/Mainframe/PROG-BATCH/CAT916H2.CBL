000001* PDX    - CAT916H2 C0153598 01/30/01 09:34:13 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID. CAT916H2.                                                    
      *                                                                         
       DATE-WRITTEN. JAN 2001.                                                  
      *---------------------------------------------------------------*         
      *REMARKS.                                                       *         
      *                                                               *         
      *  MODEL FROM CAT916H2.                                                   
      *  CHANGE TO BE DRIVEN OFF HISTORY DB, CLIENT 12 ONLY.          *         
           EJECT                                                                
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
                                                                                
       FILE-CONTROL.                                                            
                                                                                
      **   SELECT  ACAT-FILE           ASSIGN  TO  UT-S-ACATFL.                 
                                                                                
           SELECT  NA-UPDATE-FILE      ASSIGN  TO  UT-S-NAUPDTE.                
                                                                                
           SELECT  DB-SAVE-FILE        ASSIGN  TO  UT-S-DBSAVE.                 
                                                                                
           SELECT  MGN-INT-FILE        ASSIGN  TO  UT-S-MGNINT.                 
                                                                                
           SELECT  PAYMENT-FILE        ASSIGN  TO  UT-S-PPMNT.                  
                                                                                
           SELECT  REPORT-FILE         ASSIGN  TO  UT-S-REPORT.                 
                                                                                
           SELECT  REPORT-FILE-2       ASSIGN  TO  UT-S-REPORT2.                
                                                                                
           SELECT  TEMP-FILE           ASSIGN  TO  UT-S-TEMP.                   
                                                                                
           SELECT  SORT-FILE           ASSIGN  TO  SORTWK01.                    
                                                                                
           SELECT  SORT-FILE-2         ASSIGN  TO  SORTWK01.                    
                                                                                
           EJECT                                                                
       DATA DIVISION.                                                           
                                                                                
       FILE SECTION.                                                            
                                                                                
      *FD  ACAT-FILE                                                            
      *    RECORDING MODE F                                                     
      *    BLOCK CONTAINS 0 RECORDS                                             
      *    LABEL RECORDS ARE STANDARD                                           
      *    RECORD CONTAINS 133 CHARACTERS.                                      
      *                                                                         
      *01  ACAT-REC-IN.                                                         
      *    05  ACAT-REC-IN-TYPE        PIC X.                                   
      *    05  ACAT-REC-IN-SEQ         PIC X(7).                                
      *    05  FILLER                  PIC X(125).                              
                                                                                
       FD  NA-UPDATE-FILE                                                       
           LABEL RECORDS STANDARD                                               
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
       01  NA-UPDATE-REC               PIC X(255).                              
                                                                                
       FD  DB-SAVE-FILE                                                         
           LABEL RECORDS STANDARD                                               
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
       01  DB-SAVE-RECORD              PIC X(30).                               
                                                                                
       FD  MGN-INT-FILE                                                         
           LABEL RECORDS STANDARD                                               
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
       01  MGN-INT-REC                 PIC X(30).                               
                                                                                
       FD  PAYMENT-FILE                                                         
           LABEL RECORDS STANDARD                                               
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
       01  PAYMENT-REC                 PIC X(80).                               
                                                                                
       FD  REPORT-FILE                                                          
           LABEL RECORDS STANDARD                                               
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS                                             
           RECORD CONTAINS 143 CHARACTERS.                                      
       01  REPORT-REC                  PIC X(143).                              
                                                                                
       FD  REPORT-FILE-2                                                        
           LABEL RECORDS STANDARD                                               
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS                                             
           RECORD CONTAINS 143 CHARACTERS.                                      
       01  REPORT-REC-2                PIC X(143).                              
                                                                                
       FD  TEMP-FILE                                                            
           LABEL RECORDS STANDARD                                               
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS                                             
           RECORD CONTAINS 80 CHARACTERS.                                       
       01  TEMP-RECORD                 PIC X(80).                               
                                                                                
       SD  SORT-FILE.                                                           
       01  SORT-REC.                                                            
           05  S-CLIENT                PIC X(3).                                
           05  S-CONTROLLER            PIC 9(3).                                
           05  S-BRANCH                PIC X(3).                                
           05  S-ACCOUNT               PIC X(5).                                
           05  S-CLIENT-NAME           PIC X(30).                               
           05  S-ACCT-TITLE            PIC X(90).                               
           05  S-DATA-OPENED           PIC X(8).                                
           05  FILLER                  PIC X(8).                                
                                                                                
       SD  SORT-FILE-2.                                                         
       01  SORT-REC-2.                                                          
           05  S-CLIENT-2              PIC X(3).                                
           05  S-BRANCH-2              PIC X(3).                                
           05  S-ACCOUNT-2             PIC X(5).                                
           05  S-CLIENT-NAME-2         PIC X(30).                               
           05  S-DIV-CODE-2            PIC X(1).                                
           05  S-SELL-CODE-2           PIC X(2).                                
C05759     05  S-CASH-SWEEP-2          PIC X(1).                                
           05  S-REJ-IND-2             PIC X(1).                                
C05759     05                          PIC X(34).                               
           EJECT                                                                
      *****************************************************************         
       WORKING-STORAGE  SECTION.                                                
      *****************************************************************         
       77  PGM-NAME                         PIC X(08) VALUE 'CAT916H2'.         
                                                                                
       77  ACAT-PROC-DATE                   PIC X(06)  VALUE ' '.               
                                                                                
       77  WS-DATE                          PIC 9(06)  VALUE 0.                 
                                                                                
       77  ABEND-CODE-2000      COMP        PIC S9(4)  VALUE +2000.             
       77  ABEND-CODE-2020      COMP        PIC S9(4)  VALUE +2020.             
       77  ABEND-CODE-2024      COMP        PIC S9(4)  VALUE +2024.             
       77  ABEND-CODE-2028      COMP        PIC S9(4)  VALUE +2028.             
                                                                                
       77  ABEND-CODE-4004      COMP        PIC S9(4)  VALUE +4004.             
       77  ABEND-CODE-4008      COMP        PIC S9(4)  VALUE +4008.             
       77  ABEND-CODE-4012      COMP        PIC S9(4)  VALUE +4012.             
       77  ABEND-CODE-4016      COMP        PIC S9(4)  VALUE +4016.             
       77  ABEND-CODE-4020      COMP        PIC S9(4)  VALUE +4020.             
       77  ABEND-CODE-4024      COMP        PIC S9(4)  VALUE +4024.             
       77  ABEND-CODE-4028      COMP        PIC S9(4)  VALUE +4028.             
                                                                                
       77  ABEND-CODE-5000      COMP        PIC S9(4)  VALUE +5000.             
       77  ABEND-CODE-5010      COMP        PIC S9(4)  VALUE +5010.             
       77  ABEND-CODE-5020      COMP        PIC S9(4)  VALUE +5020.             
       77  ABEND-CODE-5100      COMP        PIC S9(4)  VALUE +5020.             
                                                                                
       77  ABEND-CODE-8000      COMP        PIC S9(4)  VALUE +8000.             
                                                                                
       77  REPORT-2-BREAK-SW                PIC X(01) VALUE ' '.                
                                                                                
       77  ACAT-RECS-CLIENT      COMP       PIC S9(9)  VALUE +0.                
       77  ACAT-RECS-TOTAL       COMP       PIC S9(9)  VALUE +0.                
                                                                                
       77  B1-SUB                           PIC 9(4)    VALUE 0.                
       77  WS-CLIENT-NBR                    PIC X(4)    VALUE '0000'.           
       77  B1-TBL-CNT                       PIC 9(4)    VALUE 0.                
       77  B1-SUB1                          PIC 9(4)    VALUE 0.                
       77  B1-SUB1-SVE                      PIC 9(4)    VALUE 0.                
       77  B1-SUB2                          PIC 9(4)    VALUE 0.                
       77  B3-SUB                           PIC 9(4)    VALUE 0.                
       77  B4-SUB                           PIC 9(4)    VALUE 0.                
       77  T-SUB1                           PIC 9(4)    VALUE 0.                
       77  T-SUB2                           PIC 9(4)    VALUE 0.                
       77  LINECNT                          PIC 9(4)    VALUE 99.               
       77  PAGECNT                          PIC 9(4)    VALUE 0.                
       77  LINECNT-2                        PIC 9(4)    VALUE 99.               
       77  PAGECNT-2                        PIC 9(4)    VALUE 0.                
       77  WORK-DATE-OPEN                   PIC 9(8)   VALUE 0.                 
       77  MSGNO                            PIC 9(3)    VALUE 0.                
       77  UPD-SEQ                          PIC 99      VALUE 0.                
       77  ROW-CNT                          PIC S9(8)   VALUE 0.                
       77  DUPE-ACCOUNTS-FOUND              PIC S9(8)   VALUE 0.                
       77  MGN-INT-REC-CNT                  PIC S9(8)   VALUE 0.                
       77  PMNT-REC-CNT                     PIC S9(8)   VALUE 0.                
       77  WK-TIMESTAMP                     PIC X(26).                          
                                                                                
       77  ACAT-1ST-RECORD-SWITCH           PIC X(01)  VALUE ' '.               
           88  ACAT-1ST-RECORD-FOUND                   VALUE 'Y'.               
           88  ACAT-1ST-RECORD-NOT-FOUND               VALUE 'N'.               
                                                                                
       77  ACAT-2ND-RECORD-SWITCH           PIC X(01)  VALUE ' '.               
           88  ACAT-2ND-RECORD-FOUND                   VALUE 'Y'.               
           88  ACAT-2ND-RECORD-NOT-FOUND               VALUE 'N'.               
                                                                                
       77  ACAT-3RD-RECORD-SWITCH           PIC X(01)  VALUE ' '.               
           88  ACAT-3RD-RECORD-FOUND                   VALUE 'Y'.               
           88  ACAT-3RD-RECORD-NOT-FOUND               VALUE 'N'.               
                                                                                
       77  ACAT-TYPE-WRITE                  PIC X(01)  VALUE ' '.               
           88  WRITE-HDR                               VALUE 'H'.               
           88  WRITE-DATA                              VALUE 'D'.               
           88  WRITE-TRLR                              VALUE 'T'.               
                                                                                
       77  CURRENT-ACAT-REC-TYPE            PIC X(01)  VALUE ' '.               
           88  ACAT-HEADER-REC                         VALUE 'H'.               
           88  ACAT-TRAILER-REC                        VALUE 'T'.               
           88  ACAT-DATA-RECS                          VALUE 'D'.               
                                                                                
       77  B1-TABLE-SEARCH-STATUS           PIC X(01)  VALUE ' '.               
           88  B1-ENTRY-FOUND                          VALUE 'Y'.               
           88  B1-ENTRY-NOT-FOUND                      VALUE 'N'.               
                                                                                
       77  B1-TABLE-SEARCH-SWITCH           PIC X(01)  VALUE ' '.               
           88  B1-SEARCH-END                           VALUE 'Y'.               
                                                                                
       77  B1-RANGE-SEARCH-STATUS           PIC X(01)  VALUE ' '.               
           88  B1-RANGE-FOUND                          VALUE 'Y'.               
           88  B1-RANGE-NOT-FOUND                      VALUE 'N'.               
                                                                                
       77  B1-RANGE-SEARCH-SWITCH           PIC X(01)  VALUE ' '.               
           88  B1-RANGE-SEARCH-END                     VALUE 'Y'.               
                                                                                
       77  ACAT-FIRST-TIME-SW               PIC X(01)  VALUE 'Y'.               
           88  ACAT-FIRST-TIME                         VALUE 'Y'.               
                                                                                
       77  ACAT-FIRST-WRITE-SW              PIC X(01)  VALUE 'Y'.               
           88  ACAT-FIRST-WRITE                        VALUE 'Y'.               
                                                                                
       77  ACAT-HDR-SW                      PIC X(01)  VALUE ' '.               
           88  ACAT-HDR                                VALUE 'Y'.               
                                                                                
       77  ACAT-EOF-SW                      PIC X(01)  VALUE ' '.               
           88  ACAT-EOF                                VALUE 'Y'.               
                                                                                
       77  ACAT-BYPASS-SW                   PIC X(01)  VALUE ' '.               
           88  ACAT-BYPASS                             VALUE 'Y'.               
                                                                                
       77  ADR-ACCT-TEST                    PIC X(02)  VALUE '  '.              
           88  ADR-IRA                                 VALUE '03' '04'          
                                                             '05'.              
       77  ACAT-DELIVER-SW                  PIC X      VALUE 'Y'.               
           88  ACAT-FIRST-DELIVER                      VALUE 'Y'.               
                                                                                
       77  ACAT-CLI-TOT-SW                  PIC X      VALUE ' '.               
           88  ACAT-CLIENT-TOTAL                       VALUE 'Y'.               
                                                                                
       77  WK-TFR-EOF-SW                    PIC X      VALUE ' '.               
           88  WK-TFR-EOF                              VALUE 'Y'.               
                                                                                
       77  WK-CLNT-DEL-REC-IND              PIC X      VALUE ' '.               
           88  WK-CLNT-IS-DELIVERER                    VALUE 'D'.               
           88  WK-CLNT-IS-RECEIVER                     VALUE 'R'.               
                                                                                
       77  WK-ACAT-TFR-UPDATED-SW           PIC X      VALUE ' '.               
       77  WK-DB2-TBL-UPDT-SW               PIC X      VALUE ' '.               
           88  WK-DB2-TBL-UPDT-TO-Y                    VALUE 'Y'.               
           88  WK-DB2-TBL-UPDT-TO-N                    VALUE 'N'.               
       77  WK-TRNFR-SETTLED-SW              PIC X      VALUE ' '.               
           88  WK-TRNFR-SETTLED                        VALUE 'Y'.               
           88  WK-TRNFR-NOT-SETTLED                    VALUE 'N'.               
                                                                                
       01  SPIE-KEY                     PIC S9(08) COMP    VALUE +133.          
       01  SPIE-GRP                     PIC X(04)          VALUE 'ACAT'.        
                                                                                
       01  WORK-DATE-AREA.                                                      
           05  WDA-CC                   PIC X(2).                               
           05  WDA-YY                   PIC X(2).                               
           05  WDA-MM                   PIC X(2).                               
           05  WDA-DD                   PIC X(2).                               
                                                                                
       01  WORK-EDIT-TIMESTAMP-AREA.                                    CAT520  
           05  WK-CRT-TMSTP.                                            CAT520  
               07  WK-CRT-TMSTP-CC      PIC X(02).                      CAT520  
               07  WK-CRT-TMSTP-YY      PIC X(02).                      CAT520  
               07  WK-CRT-TMSTP-MM      PIC X(02).                      CAT520  
               07  WK-CRT-TMSTP-DD      PIC X(02).                      CAT520  
           05  WK-UPD-TMSTP.                                            CAT520  
               07  WK-UPD-TMSTP-CC      PIC X(02).                      CAT520  
               07  WK-UPD-TMSTP-YY      PIC X(02).                      CAT520  
               07  WK-UPD-TMSTP-MM      PIC X(02).                      CAT520  
               07  WK-UPD-TMSTP-DD      PIC X(02).                      CAT520  
                                                                                
       01  WK-AREA.                                                             
           05  WK-DAYS-SUBMIT-ASSETS    PIC X(01).                              
           05  WK-DAYS-SUBMIT-ASSETS-N REDEFINES WK-DAYS-SUBMIT-ASSETS          
                                        PIC 9(01).                              
           05  WK-DAYS-STTS-QTY         PIC 9(7).                               
           05  WK-CLT-NBR               PIC X(04).                              
           05  WK-ACAT-CNTRL-NBR        PIC X(14).                              
           05  WK-CURR-KEY.                                                     
               07  WK-CURR-CLT-NBR      PIC X(4).                               
               07  WK-CURR-BRCH-CD      PIC X(3).                               
               07  WK-CURR-ACCT-CD      PIC X(5).                               
           05  WK-PREV-KEY.                                                     
               07  WK-PREV-CLT-NBR      PIC X(4).                               
               07  WK-PREV-BRCH-CD      PIC X(3).                               
               07  WK-PREV-ACCT-CD      PIC X(5).                               
                                                                                
       01  WS-COUNTERS.                                                         
           05  ACAT-HDRS-READ           PIC 9(7)   COMP-3  VALUE ZERO.          
           05  ACAT-TRLR-READ           PIC 9(7)   COMP-3  VALUE ZERO.          
           05  ACAT-BYP-RECS            PIC 9(7)   COMP-3  VALUE ZERO.          
           05  ACAT-REJ-RECS            PIC 9(7)   COMP-3  VALUE ZERO.          
           05  ACAT-DTL-RECS            PIC 9(7)   COMP-3  VALUE ZERO.          
           05  ACAT-ACPT-RECS           PIC 9(7)   COMP-3  VALUE ZERO.          
           05  ACAT-BATCH-COUNT         PIC 9(7)   COMP-3  VALUE ZERO.          
           05  NA-UPDATE-RECS           PIC 9(7)   COMP-3  VALUE ZERO.          
           05  PPMNT-REC-CNT            PIC 9(7)   COMP-3  VALUE ZERO.          
           05  MGNINT-REC-CNT           PIC 9(7)   COMP-3  VALUE ZERO.          
           05  DBSAVE-REC-CNT           PIC 9(7)   COMP-3  VALUE ZERO.          
                                                                                
      ******************************************************************CAT520  
      * DB2 ERROR MESSAGE AREA                                         *CAT520  
      ******************************************************************CAT520  
       01  DSNTIAR                       PIC X(008) VALUE 'DSNTIAR'.    CAT520  
           COPY STUBCPY.                                                        
       01  W-DB2-MESSAGE-AREA.                                          CAT520  
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.    CAT520  
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES     CAT520  
                   INDEXED BY W-DB2-IDX.                                CAT520  
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.     CAT520  
                                                                        CAT520  
       01  W-DB2-WORKAREA.                                              CAT520  
           05  ROLLBACK-SQLCA            PIC X(122).                    CAT520  
           05  ROLLBACK-RETURN           PIC S9(9) COMP.                CAT520  
               88  ROLLBACK-OK               VALUE +0.                  CAT520  
               88  ROLLBACK-AB               VALUE -999 THRU -1         CAT520  
                                                   +1   THRU +999.      CAT520  
           05  COMMIT-SQLCA              PIC X(122).                    CAT520  
           05  COMMIT-RETURN             PIC S9(9) COMP.                CAT520  
               88  COMMIT-OK                 VALUE +0.                  CAT520  
               88  COMMIT-AB                 VALUE -999 THRU -1         CAT520  
                                                   +1   THRU +999.      CAT520  
           05  W-COMMIT-CTR              PIC 9(9) COMP-3                CAT520  
                                             VALUE 0.                   CAT520  
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(011) VALUE 0.           CAT520  
                                                                                
       01  W-DB2-ERR-MSG-OUT.                                           CAT520  
           05  FILLER                   PIC X(04) VALUE '**  '.         CAT520  
           05  W-ERR-MSG-OUT            PIC X(50).                      CAT520  
           05  FILLER                   PIC X(12) VALUE '=> SQLCODE: '. CAT520  
           05  W-SQLCODE-OUT            PIC -999.                       CAT520  
           EJECT                                                                
      *01  ACAT-REC-WS                  PIC X(12)  VALUE 'ACAT-REC-WS'.         
      *COPY SIAC103.                                                            
           EXEC SQL                                                             
              INCLUDE SQLCA                                                     
           END-EXEC.                                                            
           EJECT                                                                
           EXEC SQL                                                             
              INCLUDE VTRNHSTY                                                  
           END-EXEC.                                                            
           EJECT                                                                
           EXEC SQL                                                             
             DECLARE  TFRCRSR  CURSOR FOR                                       
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
                   CLIENT_NBR = :WS-CLIENT-NBR                                  
               ORDER BY                                                         
                   DSTBN_SIDE_CD                                                
                  ,BRANCH_CD                                                    
                  ,ACCT_CD                                                      
           END-EXEC.                                                            
           EJECT                                                                
                                                                                
           COPY BPDATESC.                                                       
           EJECT                                                                
           COPY BHINFO.                                                         
           EJECT                                                                
           COPY BHICS.                                                          
           EJECT                                                                
           COPY BHBTS2.                                                         
           EJECT                                                                
           COPY BHNA2.                                                          
           EJECT                                                                
           COPY BHACAT.                                                         
           EJECT                                                                
           COPY BHMISC2.                                                        
                                                                                
           EJECT                                                                
      * NAME AND ADDRESS FILE AREAS                                             
       COPY GETNACOB.                                                           
       01  GETNA-SEGMENT-INCLUDES.                                              
       COPY NASEGHDR.                                                           
       COPY NASEGPPA.                                                           
       COPY NASEGPPB.                                                           
       COPY NNASGRPC.                                                           
       COPY NASEGEND.                                                           
           EJECT                                                                
      * NAME AND ADDRESS UPDATE AREAS                                           
       COPY NAUPDHDR.                                                           
       COPY NAUPDTLR.                                                           
       COPY NAUP10A0.                                                           
       COPY NAUP10A1.                                                           
       COPY NAUP10I0.                                                           
           EJECT                                                                
      * DATABASE UPDATE KEY SAVE WORK AREA                                      
       01  DB-SAVE-WORK-REC.                                                    
           03  DB-SAVE-CLT-NBR            PIC X(04).                            
           03  DB-SAVE-ACAT-NBR           PIC X(14).                            
           03  DB-SAVE-NA-UPDATE-IND      PIC X(01).                            
           03  DB-SAVE-BRANCH             PIC X(03).                            
           03  DB-SAVE-ACCT               PIC X(05).                            
           03  FILLER                     PIC X(03).                            
       EJECT                                                                    
      * MARGIN INTEREST REQUEST FILE UPDATE AREA                                
       COPY OLMIBKRQ  REPLACING ==:OLMIBKRQ:== BY ==MGNINT==.                   
           EJECT                                                                
      * PERIODIC PAYMENT FILE UPDATE AREA                                       
       COPY ACATPPS   REPLACING ==:ACATPPS:== BY ==PMNT==.                      
           EJECT                                                                
      * REPORT AREA                                                             
       01  HDR1.                                                                
           05  FILLER                  PIC X       VALUE SPACES.                
           05  FILLER                  PIC X(10)   VALUE ' CAT916H2 '.          
           05  H1-CLIENT               PIC X(3).                                
           05  FILLER                  PIC X      VALUE '-'.                    
           05  H1-CLIENT-NAME          PIC X(30).                               
           05  FILLER                  PIC X(2)   VALUE SPACES.                 
           05  FILLER                  PIC X(75)  VALUE                         
               'AUTOMATED CUSTOMER ACCOUNT TRANSFER SYSTEM'.                    
           05  FILLER                  PIC X(5)   VALUE 'PAGE '.                
           05  H1-PGENO                PIC ZZ9.                                 
                                                                                
       01  HDR2.                                                                
           05  FILLER                  PIC X(50) VALUE SPACES.                  
           05  FILLER                  PIC X(64) VALUE                          
               'PREMIER ACCOUNT TRANSFERS REPORT '.                             
           05  FILLER                  PIC X(5)  VALUE 'DATE '.                 
           05  H2-PROC-DATE.                                                    
               10  H2-MM               PIC X(2).                                
               10  FILLER              PIC X     VALUE '/'.                     
               10  H2-DD               PIC X(2).                                
               10  FILLER              PIC X     VALUE '/'.                     
               10  H2-YY               PIC X(2).                                
                                                                                
       01  HDR3.                                                                
           05  FILLER                  PIC X(55)  VALUE                         
               '       ACCOUNT           ACCOUNT TITLE '.                       
           05  FILLER                  PIC X(27)  VALUE                         
               'DATE OPENED '.                                                  
                                                                                
       01  DETAIL-LINE-1.                                                       
           05  FILLER                  PIC X(6)  VALUE SPACES.                  
           05  DL1-BRANCH              PIC X(3).                                
           05  DL1-DASH                PIC X     VALUE '-'.                     
           05  DL1-ACCOUNT             PIC X(5).                                
           05  FILLER                  PIC X(4)  VALUE SPACES.                  
           05  DL1-ACCT-TITLE          PIC X(30).                               
           05  FILLER                  PIC X(8)  VALUE SPACES.                  
           05  DL1-DATE-OPENED.                                                 
               10  DL1-DO-MM           PIC X(2).                                
               10  DL1-SL1             PIC X     VALUE '/'.                     
               10  DL1-DO-DD           PIC X(2).                                
               10  DL1-SL2             PIC X     VALUE '/'.                     
               10  DL1-DO-YY           PIC X(2).                                
                                                                                
       01  HDR1-2.                                                              
           05                          PIC X       VALUE SPACES.                
           05                          PIC X(10)   VALUE ' CAT916H2 '.          
           05  H1-CLIENT-2             PIC X(3).                                
           05                          PIC X      VALUE '-'.                    
           05  H1-CLIENT-NAME-2        PIC X(30).                               
           05                          PIC X(2)   VALUE SPACES.                 
           05                          PIC X(75)  VALUE                         
               'AUTOMATED CUSTOMER ACCOUNT TRANSFER SYSTEM'.                    
           05                          PIC X(5)   VALUE 'PAGE '.                
           05  H1-PGENO-2              PIC ZZ9.                                 
                                                                                
       01  HDR2-2.                                                              
           05                          PIC X(50) VALUE SPACES.                  
           05                          PIC X(64) VALUE                          
               '    NAME & ADDRESS UPDATE REPORT '.                             
           05                          PIC X(5)  VALUE 'DATE '.                 
           05  H2-PROC-DATE-2.                                                  
               10  H2-MM-2             PIC X(2).                                
               10                      PIC X     VALUE '/'.                     
               10  H2-DD-2             PIC X(2).                                
               10                      PIC X     VALUE '/'.                     
               10  H2-YY-2             PIC X(2).                                
                                                                                
       01  HDR3-2.                                                              
           05  PIC X(10) VALUE ' '.                                             
           05                          PIC X(52)  VALUE                         
               '       ACCOUNT       DIV CODE      SELL CODE'.                  
C05759     05                          PIC X(52)  VALUE                         
C05759         'CASH SWEEP     REJECTED    '.                                   
                                                                                
       01  DETAIL-LINE-2.                                                       
           05                          PIC X(16)  VALUE SPACES.                 
           05  DL2-BRANCH              PIC X(3).                                
           05  DL2-DASH                PIC X     VALUE '-'.                     
           05  DL2-ACCOUNT             PIC X(5).                                
           05                          PIC X(8)  VALUE SPACES.                  
           05  DL2-DIV-CODE            PIC X(1).                                
           05                          PIC X(15)  VALUE SPACES.                 
           05  DL2-SELL-CODE           PIC X(2).                                
           05                          PIC X(15)  VALUE SPACES.                 
C05759     05  DL2-CASH-SWEEP          PIC X(1).                                
C05759     05                          PIC X(15)  VALUE SPACES.                 
           05  DL2-REJ-IND             PIC X(1).                                
                                                                                
       01  MSG-LINE                    PIC X(133).                              
                                                                                
       01  NO-ACTV-LINE.                                                        
           05  FILLER                  PIC X(40)  VALUE SPACES.                 
           05  NAL-MSG                 PIC X(90).                               
                                                                                
       01  PRINTAREA.                                                           
           05  PRINTSPACE.                                                      
               10  CC                  PIC X.                                   
               10  PRINT-AREA          PIC X(132).                              
           05  TRACSPACE.                                                       
               10  TRAC-CLI            PIC 9(3) COMP-3.                         
               10  TRAC-CNTL           PIC 9(3) COMP-3.                         
               10  FILLER              PIC X(6) VALUE SPACES.                   
                                                                                
           EJECT                                                                
      *                                                                         
      *  REPORT DATA AREA                                                       
      *                                                                         
       01  ACAT-DATA-REC.                                                       
C11582*    05  ADR-CLIENT              PIC X(3).                                
C11582     05  ADR-CLIENT              PIC 9(3).                                
           05  ADR-CONTROLLER          PIC 9(3).                                
           05  ADR-BRANCH              PIC X(3).                                
           05  ADR-ACCOUNT             PIC X(5).                                
           05  ADR-CLIENT-NAME         PIC X(30).                               
           05  ADR-ACCT-TITLE          PIC X(90).                               
           05  ADR-DATE-OPENED         PIC X(8).                                
           05  FILLER                  PIC X(8).                                
                                                                                
       01  TEMP-DATA-REC.                                                       
C11582*    05  TEMP-CLIENT                PIC X(3).                             
C11582     05  TEMP-CLIENT                PIC 9(3).                             
           05  TEMP-BRANCH                PIC X(3).                             
           05  TEMP-ACCOUNT               PIC X(5).                             
           05  TEMP-CLIENT-NAME           PIC X(30).                            
           05  TEMP-DIV-CODE              PIC X(1).                             
           05  TEMP-SELL-CODE             PIC X(2).                             
C05759     05  TEMP-CASH-SWEEP            PIC X(1).                             
           05  TEMP-REJ-IND               PIC X(1).                             
C05759     05                             PIC X(34).                            
                                                                                
       01  PROC-DATE.                                                           
           05  PD-CC                   PIC X(2).                                
           05  PD-YY                   PIC X(2).                                
           05  PD-MM                   PIC X(2).                                
           05  PD-DD                   PIC X(2).                                
                                                                                
       01  PROC-DATE-N  REDEFINES PROC-DATE  PIC 9(8).                          
                                                                                
       01  CURRENT-DATE.                                                        
           05  CUR-YY                  PIC X(2).                                
           05  CUR-MM                  PIC X(2).                                
           05  CUR-DD                  PIC X(2).                                
                                                                                
       01  CURRENT-TIME.                                                        
           05  CUR-HR                  PIC X(2).                                
           05  CUR-MN                  PIC X(2).                                
           05  CUR-SS                  PIC X(2).                                
           05  CUR-HS                  PIC X(2).                                
                                                                                
       01  WORK-DATE.                                                           
           05  WK-CC                   PIC 9(2).                                
           05  WK-YY                   PIC 9(2).                                
           05  WK-MM                   PIC 9(2).                                
           05  WK-DD                   PIC 9(2).                                
                                                                                
       01  EDIT-CURRENT-DATE.                                                   
           05  EDIT-CUR-MM             PIC X(2).                                
           05  EDIT-CUR-DD             PIC X(2).                                
           05  EDIT-CUR-YY             PIC X(2).                                
                                                                                
       01  TODAYS-DATE.                                                         
           05  TODAYS-CC               PIC X(2).                                
           05  TODAYS-YYMMDD           PIC X(6).                                
                                                                                
       01  SETTLE-DATE.                                                         
           05  SETTLE-CCYY             PIC X(4).                                
           05  SETTLE-MM               PIC X(2).                                
           05  SETTLE-DD               PIC X(2).                                
                                                                                
       01  BR-ACCT-TEST-AREA.                                                   
           05  BR-ACCT-IN              PIC X(15).                               
           05  FILLER REDEFINES BR-ACCT-IN.                                     
               10  B-CHAR OCCURS 15 TIMES                                       
                                       PIC X.                                   
           05  BR-ACCT-CNV             PIC X(8).                                
           05  FILLER REDEFINES BR-ACCT-CNV.                                    
               10  C-CHAR OCCURS 8 TIMES                                        
                                       PIC X.                                   
           EJECT                                                                
       01  B1-TABLE-AREA.                                                       
           03  B1-TABLE OCCURS 500 TIMES.                                       
               05  B1-ADP-CL-NO             PIC 9(03).                          
               05  B1-BKR-CLR-NO            PIC X(04).                          
               05  B1-CLI-NAME              PIC X(30).                          
               05  B1-NA-UPD-DELV           PIC X.                              
               05  B1-NA-UPD-RECV           PIC X.                              
               05  B1-NA-UPD-PREMIER        PIC X.                              
               05  B1-NA-UPD-BNK-AUTO       PIC X.                              
               05  B1-SUBMIT-ASSETS         PIC X.                              
               05  B1-CL-HIT                PIC X.                              
               05  B1-PERIODIC-PAYMENT      PIC X.                              
               05  B1-MARGIN-INT            PIC X.                              
                                                                                
       01  B1-WRK-TABLE-AREA.                                                   
           03  B1-WRK-TABLE.                                                    
               05  B1-WRK-ADP-CL-NO         PIC 9(03).                          
               05  B1-WRK-BKR-CLR-NO        PIC X(04).                          
               05  B1-WRK-CLI-NAME          PIC X(30).                          
               05  B1-WRK-NA-UPD-DELV       PIC X.                              
               05  B1-WRK-NA-UPD-RECV       PIC X.                              
               05  B1-WRK-NA-UPD-PREMIER    PIC X.                              
               05  B1-WRK-NA-UPD-BNK-AUTO   PIC X.                              
               05  B1-WRK-SUBMIT-ASSETS     PIC 9.                              
               05  B1-WRK-CL-HIT            PIC X.                              
               05  B1-WRK-PERIODIC-PAYMENT  PIC X.                              
               05  B1-WRK-MARGIN-INT        PIC X.                              
                                                                                
           EJECT                                                                
      *****************************************************************         
       LINKAGE SECTION.                                                         
      *****************************************************************         
       01  PARM-AREA.                                                           
           05  PARM-LENGTH                  PIC S9(4) COMP SYNC.                
               88  PARM-LENGTH-VALID                    VALUE +2.               
           05  PARM-INFO.                                                       
               10  PARM-STREAM              PIC X.                              
                   88  PARM-STREAM-VALID                VALUES ARE              
                       'A' THRU 'Z' '0' THRU '9'.                               
               10  PARM-ABEND               PIC X.                              
                   88  NO-ABEND                         VALUE 'N'.              
                   88  YES-ABEND                        VALUE 'Y'.              
                                                                                
           EJECT                                                                
       PROCEDURE DIVISION USING PARM-AREA.                                      
       MAINLINE SECTION.                                                        
           COPY MSGCOBO.                                                        
                                                                                
      **   CALL 'SPIEEXIT'                    USING ACAT-FIRST-RECORD           
      **                                            SPIE-KEY                    
      **                                            SPIE-GRP                    
      **   END-CALL.                                                            
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY '*** ' PGM-NAME ' BEGINNING INITIAL ROUTINE ***'.            
                                                                                
           PERFORM  100-HOUSEKEEPING THRU                                       
                    100-HOUSEKEEPING-EXIT.                                      
                                                                                
           PERFORM  200-INIT-B1-LOOP THRU                                       
                    200-INIT-B1-LOOP-EXIT.                                      
                                                                                
           SORT  SORT-FILE                                                      
                 ASCENDING KEY  S-CLIENT                                        
                                S-CONTROLLER                                    
                                S-BRANCH                                        
                                S-ACCOUNT                                       
                  INPUT PROCEDURE  300-PROCESS-ACAT-FILE THRU                   
                                   300-EXIT                                     
                 OUTPUT PROCEDURE  1400-PREMIER-REPORT THRU                     
                                   1400-PREMIER-REPORT-EXIT.                    
                                                                                
           IF SORT-RETURN NOT = ZERO                                            
             DISPLAY 'FIRST INTERNAL SORT FAILED, SORT RC = '                   
                     SORT-RETURN                                                
                     CALL ABEND      USING ABEND-CODE-8000.                     
                                                                                
           CLOSE TEMP-FILE.                                                     
                                                                                
           SORT  SORT-FILE-2                                                    
                 ASCENDING KEY  S-CLIENT-2                                      
                                S-REJ-IND-2                                     
                                S-BRANCH-2                                      
                                S-ACCOUNT-2                                     
                            USING  TEMP-FILE                                    
                 OUTPUT PROCEDURE  1500-NAUPDT-REPORT THRU                      
                                   1500-NAUPDT-REPORT-EXIT.                     
                                                                                
           IF SORT-RETURN NOT = ZERO                                            
             DISPLAY 'SECOND INTERNAL SORT FAILED, SORT RC = '                  
                     SORT-RETURN                                                
                     CALL ABEND      USING ABEND-CODE-8000.                     
                                                                                
           PERFORM  1900-ENDJOB-ROUTINE                                         
              THRU  1900-ENDJOB-ROUTINE-EXIT.                                   
                                                                                
           GOBACK.                                                              
                                                                                
           EJECT                                                                
      ******************                                                        
       100-HOUSEKEEPING.                                                        
      ******************                                                        
                                                                                
                                                                                
           IF PARM-LENGTH-VALID                                                 
             CONTINUE                                                           
           ELSE                                                                 
             DISPLAY 'PARM LENGTH IS INVALID, LENGTH MUST BE 2 CHARS '          
             DISPLAY 'PARM ENTERED - ' PARM-INFO                                
             DISPLAY 'PROGRAM CAT916H2 ABENDED '                                
             CALL ABEND          USING ABEND-CODE-2000.                         
                                                                                
           IF PARM-STREAM-VALID                                                 
             CONTINUE                                                           
           ELSE                                                                 
             DISPLAY 'PARM INVALID, MUST BE 1 CHAR ALPHANUMERIC'                
             DISPLAY 'PARM ENTERED - ' PARM-INFO                                
             DISPLAY 'PROGRAM CAT916H2 ABENDED '                                
             CALL ABEND          USING ABEND-CODE-2000.                         
                                                                                
           IF PARM-ABEND = 'N' OR 'Y'                                           
             CONTINUE                                                           
           ELSE                                                                 
             DISPLAY 'PARM-ABEND INVALID MUST BE 1 CHAR N OR Y'                 
             DISPLAY 'PARM ENTERED - ' PARM-INFO                                
             DISPLAY 'PROGRAM CAT916H2 ABENDED '                                
             CALL ABEND          USING ABEND-CODE-2000.                         
                                                                                
           MOVE  PGM-NAME                TO BPDATES-CALLING-PGM.                
           MOVE  'C'                     TO BPDATES-REQ-TYPE.                   
C11582     CALL   BPDATES             USING BPDATES-PARAMETERS.                 
                                                                                
           MOVE  BPD-PROC-DATE           TO  PROC-DATE.                         
                                                                                
           DISPLAY 'PROCESS DATE = ' BPD-PROC-DATE.                             
                                                                                
                                                                                
           OPEN OUTPUT NA-UPDATE-FILE                                           
                       DB-SAVE-FILE                                             
                       MGN-INT-FILE                                             
                       PAYMENT-FILE                                             
                       TEMP-FILE                                                
                       REPORT-FILE-2                                            
                       REPORT-FILE.                                             
                                                                                
           ACCEPT CURRENT-DATE FROM DATE.                                       
           MOVE CURRENT-DATE TO TODAYS-YYMMDD.                                  
           IF CUR-YY > '80' AND  <= '99'                                        
              MOVE '19' TO TODAYS-CC                                            
           ELSE                                                                 
              MOVE '20' TO TODAYS-CC.                                           
                                                                                
           ACCEPT CURRENT-TIME FROM TIME.                                       
                                                                                
           INITIALIZE B1-TABLE-AREA.                                            
                                                                                
      * SETUP NAME ADDRESS UPDATE HEADER RECORD                                 
                                                                                
           MOVE PD-YY      TO  NAUP-H-PROC-YY                                   
                               NAUP-T-PROC-YY                                   
                               H2-YY  H2-YY-2.                                  
           MOVE PD-MM      TO  NAUP-H-PROC-MM                                   
                               NAUP-T-PROC-MM                                   
                               H2-MM  H2-MM-2.                                  
           MOVE PD-DD      TO  NAUP-H-PROC-DD                                   
                               NAUP-T-PROC-DD                                   
                               H2-DD  H2-DD-2.                                  
                                                                                
           MOVE CUR-YY     TO  NAUP-H-SYS-YY                                    
                               NAUP-T-SYS-YY                                    
                               EDIT-CUR-YY.                                     
           MOVE CUR-MM     TO  NAUP-H-SYS-MM                                    
                               NAUP-T-SYS-MM                                    
                               EDIT-CUR-MM.                                     
           MOVE CUR-DD     TO  NAUP-H-SYS-DD                                    
                               NAUP-T-SYS-DD                                    
                               EDIT-CUR-DD.                                     
                                                                                
           MOVE CUR-HR     TO  NAUP-H-SYS-HH                                    
                               NAUP-T-SYS-HH.                                   
           MOVE CUR-MN     TO  NAUP-H-SYS-MN                                    
                               NAUP-T-SYS-MN.                                   
           MOVE CUR-SS     TO  NAUP-H-SYS-SS                                    
                               NAUP-T-SYS-SS.                                   
                                                                                
           MOVE SPACES     TO  NAUP-H-DATA-SET-NAME.                            
           MOVE 'CAT916H2' TO  NAUP-H-PROGRAM-IO                                
                               NAUP-T-PROGRAM-IO.                               
           MOVE 999        TO  NAUP-H-CLIENT-NUM                                
                               NAUP-T-CLIENT-NUM.                               
                                                                                
           WRITE NA-UPDATE-REC FROM NAUPDHDR-REC.                               
                                                                                
       100-HOUSEKEEPING-EXIT. EXIT.                                             
           EJECT                                                                
      ***************                                                           
       200-INIT-B1-LOOP.                                                        
      ***************                                                           
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY  'B1 TABLE VALUES'.                                          
           MOVE 0                      TO  B1-TBL-CNT.                          
           ADD  1                      TO  B1-SUB.                              
           PERFORM  UNTIL  B1-SUB  >  500                                       
                                                                                
             MOVE  ' '                    TO  BH-BROKER-HEADER-INFO             
             MOVE  B1-SUB                 TO  BH-BROKER-NUMBER-N                
             MOVE  '010'                  TO  BH-LOGICAL-RECORD-CODE            
             MOVE  ' '                    TO  BH-B2-INFO-ID                     
             CALL   GETB1V              USING BH-BROKER-HEADER-INFO             
             END-CALL                                                           
                                                                                
             IF  BH-BROKER-ACTIVE                                               
                                                                                
               IF  PARM-STREAM  =  BH-BROKER-MINI-MAXI-INDICATOR                
                   MOVE  ' '                 TO  BH-ICS-INFO                    
                   MOVE  B1-SUB              TO  BH-BROKER-NUMBER-N             
                   MOVE  '015'               TO  BH-LOGICAL-RECORD-CODE         
                   MOVE  '501000'            TO  BH-B2-INFO-ID                  
                   CALL   GETB1V           USING BH-BROKER-HEADER-INFO,         
                                                 BH-ICS-INFO                    
                   END-CALL                                                     
                                                                                
                   MOVE  ' '                 TO  BH-BTS2-INFO                   
                   MOVE  B1-SUB              TO  BH-BROKER-NUMBER-N             
                   MOVE  '015'               TO  BH-LOGICAL-RECORD-CODE         
                   MOVE  '434500'            TO  BH-B2-INFO-ID                  
                   CALL   GETB1V           USING BH-BROKER-HEADER-INFO,         
                                                 BH-ACAT-INFO                   
                   END-CALL                                                     
                                                                                
                  IF  BH-ACAT-ACTIVE                                            
                                                                                
                   MOVE  ' '                 TO  BH-BTS2-INFO                   
                   MOVE  B1-SUB              TO  BH-BROKER-NUMBER-N             
                   MOVE  '015'               TO  BH-LOGICAL-RECORD-CODE         
                   MOVE  '511000'            TO  BH-B2-INFO-ID                  
                   CALL   GETB1V           USING BH-BROKER-HEADER-INFO,         
                                                 BH-BTS2-INFO                   
                   END-CALL                                                     
                                                                                
                   IF  BH-ACAT-SERVICE-STATUS > '0'                             
                   AND   B1-SUB = 12                                            
                   AND (BH-ACAT-NA-UPD-ENTRY-DELIVERS  NOT = '0' OR             
                        BH-ACAT-NA-UPD-ENTRY-RECEIVES  NOT = '0' OR             
                        (BH-ACAT-SUBMIT-ASSETS = '1' OR '2' OR '3'))            
                       ADD 1       TO B1-TBL-CNT                                
                       MOVE  B1-SUB                              TO             
                             B1-ADP-CL-NO               (B1-TBL-CNT)            
                       MOVE  BH-BROKER-NAME                      TO             
                             B1-CLI-NAME                (B1-TBL-CNT)            
                       MOVE  BH-BROKER-OLD-CLEARING-HOUSE (2:4)  TO             
                             B1-BKR-CLR-NO              (B1-TBL-CNT)            
                             BH-BROKER-OLD-CLEARING-HOUSE (2:4)                 
                                                                                
                   MOVE  ' '                 TO  BH-NA2-INFO                    
                   MOVE  B1-SUB              TO  BH-BROKER-NUMBER-N             
                   MOVE  '015'               TO  BH-LOGICAL-RECORD-CODE         
                   MOVE  '581000'            TO  BH-B2-INFO-ID                  
                   CALL   GETB1V           USING BH-BROKER-HEADER-INFO,         
                                                 BH-NA2-INFO                    
                   END-CALL                                                     
                                                                                
                   MOVE  BH-ACAT-NA-UPD-ENTRY-DELIVERS       TO                 
                             B1-NA-UPD-DELV             (B1-TBL-CNT)            
                   MOVE  BH-ACAT-NA-UPD-ENTRY-RECEIVES       TO                 
                             B1-NA-UPD-RECV             (B1-TBL-CNT)            
                   MOVE  BH-ACAT-SUBMIT-ASSETS               TO                 
                             B1-SUBMIT-ASSETS           (B1-TBL-CNT)            
                   MOVE BH-ACAT-PERIODIC-PAYMENT            TO                  
                             B1-PERIODIC-PAYMENT        (B1-TBL-CNT)            
      **           MOVE '0'   TO B1-MARGIN-INT      (B1-TBL-CNT)                
                                                                                
                   IF BH-NA2-ACTIVE                                             
                       MOVE  BH-NA2-BANK-SCREEN-AUTO-FLIP        TO             
                             B1-NA-UPD-BNK-AUTO         (B1-TBL-CNT)            
                   END-IF                                                       
                                                                                
                   MOVE  B1-SUB              TO  BH-BROKER-NUMBER-N             
                   MOVE  '017'               TO  BH-LOGICAL-RECORD-CODE         
                   CALL   GETB1V           USING BH-BROKER-HEADER-INFO,         
                                                 BH-MISC-INFO-2                 
                   END-CALL                                                     
                   IF BH-MI-ACTIVE                                              
                      MOVE BH-MI-BOOK-INT-BASED-ON-ACAT       TO                
                           B1-MARGIN-INT              (B1-TBL-CNT)              
                   END-IF                                                       
                   DISPLAY  B1-TABLE (B1-TBL-CNT)                               
                  END-IF                                                        
                 END-IF                                                         
               END-IF                                                           
             END-IF                                                             
             ADD  1                      TO  B1-SUB                             
           END-PERFORM.                                                         
           DISPLAY ' '.                                                         
           IF  B1-TBL-CNT =  0                                                  
               DISPLAY  'ZERO STREAM CLIENTS ARE B1-ACAT CLIENTS'               
               DISPLAY  'INPUT ACAT FILE WILL BE BYPASSED'                      
           END-IF.                                                              
                                                                                
           DISPLAY  'B1 TABLE COUNT - ' B1-TBL-CNT.                             
       200-INIT-B1-LOOP-EXIT.   EXIT.                                           
           EJECT                                                                
      *                                                                         
                                                                                
      *****************                                                         
       300-PROCESS-ACAT-FILE  SECTION.                                          
      *****************                                                         
                                                                                
           DISPLAY '*** ' PGM-NAME ' BEGINNING SORTINP ROUTINE ***'.            
                                                                                
           PERFORM  1010-MRGN-INT-HEADER-RTN.                                   
           PERFORM  1110-PAYMENT-HEADER-RTN.                                    
                                                                                
           PERFORM VARYING B1-SUB1 FROM 1 BY 1                                  
                     UNTIL B1-SUB1 GREATER B1-TBL-CNT                           
              PERFORM 500-SET-B1-TABLE                                          
              DISPLAY 'B1-WRK-TABLE - ' B1-WRK-TABLE                            
              MOVE WS-CLIENT-NBR TO CLIENT-NBR                                  
              PERFORM 410-OPEN-TFR-CURSOR-TBL                                   
              MOVE SPACE TO WK-TFR-EOF-SW                                       
              PERFORM 400-PROCESS-ACAT-TFR-TBL THRU 400-EXIT                    
                      UNTIL WK-TFR-EOF                                          
              PERFORM 430-CLOSE-TFR-CURSOR-TBL                                  
              IF SQLCODE = 0                                                    
                   CONTINUE                                                     
              ELSE                                                              
                   PERFORM  8000-SQL-ERROR THRU 8000-EXIT                    CAT
                   MOVE 'DB2 CURSOR STATEMENT CLOSE ERROR' TO           OUT     
                                W-ERR-MSG-OUT                                   
                   MOVE SQLCODE TO W-SQLCODE-OUT                                
                   DISPLAY ' '                                                  
                   DISPLAY W-DB2-ERR-MSG-OUT                                 CAT
                   DISPLAY '** PROGRAM CAT916H2 ABENDED '                       
                   CALL ABEND      USING ABEND-CODE-5020                        
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           PERFORM 1020-MRGN-INT-TRLR-RTN.                                      
      * DETERMINE IF REPORT RECORDS CREATED FOR CLIENTS                         
                                                                                
           PERFORM 575-B1-NOT-RPTING THRU                                       
                   575-B1-NOT-RPTING-EXIT                                       
                     VARYING B4-SUB FROM 1 BY 1                                 
                      UNTIL B4-SUB > B1-TBL-CNT.                                
                                                                                
       300-EXIT.                    EXIT.                                       
       EJECT                                                                    
                                                                                
       400-PROCESS-ACAT-TFR-TBL.                                                
           PERFORM 420-FETCH-TFR-CURSOR-TBL.                                    
           IF SQLCODE = 0                                                       
              CONTINUE                                                          
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET WK-TFR-EOF TO TRUE                                            
              GO TO 400-EXIT                                                    
           ELSE                                                                 
              PERFORM  8000-SQL-ERROR THRU 8000-EXIT                    CAT520  
              MOVE 'DB2 CURSOR STATEMENT FETCH ERROR' TO W-ERR-MSG-OUT          
              MOVE SQLCODE TO W-SQLCODE-OUT                                     
              DISPLAY ' '                                                       
              DISPLAY W-DB2-ERR-MSG-OUT                                 CAT520  
              DISPLAY '** PROGRAM CAT916H2 ABENDED '                            
              CALL ABEND      USING ABEND-CODE-5010.                            
                                                                                
           MOVE CLIENT-NBR       TO WK-CURR-CLT-NBR.                            
           MOVE BRANCH-CD        TO WK-CURR-BRCH-CD.                            
           MOVE ACCT-CD          TO WK-CURR-ACCT-CD.                            
           MOVE CLIENT-NBR       TO WK-CLT-NBR.                                 
           MOVE ACAT-CONTROL-NBR TO WK-ACAT-CNTRL-NBR.                          
           IF WK-CURR-KEY = WK-PREV-KEY                                         
              ADD 1 TO DUPE-ACCOUNTS-FOUND                                      
              GO TO 400-EXIT.                                                   
                                                                                
           MOVE WK-CURR-KEY TO WK-PREV-KEY.                                     
                                                                                
           MOVE CRT-TMSTP  (1:2) TO WK-CRT-TMSTP-CC.                            
           MOVE CRT-TMSTP  (3:2) TO WK-CRT-TMSTP-YY.                            
           MOVE CRT-TMSTP  (6:2) TO WK-CRT-TMSTP-MM.                            
           MOVE CRT-TMSTP  (9:2) TO WK-CRT-TMSTP-DD.                            
           MOVE UPDT-TMSTP (1:2) TO WK-UPD-TMSTP-CC.                            
           MOVE UPDT-TMSTP (3:2) TO WK-UPD-TMSTP-YY.                            
           MOVE UPDT-TMSTP (6:2) TO WK-UPD-TMSTP-MM.                            
           MOVE UPDT-TMSTP (9:2) TO WK-UPD-TMSTP-DD.                            
                                                                                
      * GET NAME AND ADDRESS RECORD FOR THIS ACCOUNT                            
                                                                                
           INITIALIZE  GETNA-PARAMETERS.                                        
           MOVE  'R'                        TO  GETNA-REQ-FUNC.                 
           MOVE  'R'                        TO  GETNA-REQ-FILE.                 
           MOVE  'R'                        TO  GETNA-REQ-FUNC2.                
           MOVE  'N'                        TO  GETNA-REQ-YEAREND.              
           MOVE  'CAT916H2'                 TO  GETNA-PGM-NAME.                 
           MOVE  B1-WRK-ADP-CL-NO           TO  GETNA-KEY-CLIENT.               
           MOVE  '00'                       TO  GETNA-KEY-BRANCH1-2.            
           MOVE  BRANCH-CD                  TO  GETNA-KEY-BRANCH3-5.            
           MOVE  '00000'                    TO  GETNA-KEY-ACCOUNT1-5.           
           MOVE  ACCT-CD                    TO  GETNA-KEY-ACCOUNT6-10.          
           CALL   GETNA                   USING GETNA-PARAMETERS                
                                                GETNA-SEGMENT-INCLUDES          
           END-CALL.                                                            
                                                                                
           MOVE SPACE TO WK-DB2-TBL-UPDT-SW.                                    
           MOVE B1-WRK-SUBMIT-ASSETS TO WK-DAYS-SUBMIT-ASSETS.                  
           MOVE DAYS-STTS-QTY TO WK-DAYS-STTS-QTY.                              
                                                                                
      * DETERMINE IF THE CLIENT IS DELIVERER OR RECEIVER                        
           IF B1-WRK-BKR-CLR-NO = DLVR-NBR                                      
              SET WK-CLNT-IS-DELIVERER TO TRUE                                  
           ELSE                                                                 
           IF B1-WRK-BKR-CLR-NO = RCV-NBR                                       
              SET WK-CLNT-IS-RECEIVER  TO TRUE.                                 
                                                                                
           PERFORM 401-ADJUST-REQ-DAY1                                          
                                                                                
      * DELIVERER B1 CARD 434589 = 1, MAKE N&A UPDATE FOR ACCTS DLVR            
           IF DSTBN-SIDE-CD = 'D'        AND                                    
              TRNFR-TYPE-CD = 'FUL'      AND                                    
              ACCT-NA-UPDT-IND NOT = 'Y' AND                                    
              B1-WRK-NA-UPD-DELV = '1'                                          
                    PERFORM 600-DELIVER-UPDTE THRU                              
                            600-DELIVER-UPDTE-EXIT                              
                    PERFORM 450-SAVE-UPDATE-TO-Y-IND.                           
                                                                                
       400-EXIT.                     EXIT.                                      
      *                                                                         
      *                                                                         
       401-ADJUST-REQ-DAY1.                                                     
           IF STTS-CD = '100'                                                   
              IF DAYS-STTS-QTY = 1                                              
                 IF WK-CRT-TMSTP = TODAYS-DATE                                  
                    CONTINUE                                                    
                 ELSE                                                           
                    ADD 1 DAYS-STTS-QTY GIVING WK-DAYS-STTS-QTY.                
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *            OPEN ACTIVE TRANSFER CURSOR TABLE                   *        
      *----------------------------------------------------------------*        
       410-OPEN-TFR-CURSOR-TBL.                                                 
           EXEC SQL                                                             
              OPEN TFRCRSR                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              CONTINUE                                                          
           ELSE                                                                 
              PERFORM  8000-SQL-ERROR THRU 8000-EXIT                    CAT520  
              MOVE 'DB2 CURSOR STATEMENT OPEN ERROR' TO W-ERR-MSG-OUT           
              MOVE SQLCODE TO W-SQLCODE-OUT                                     
              DISPLAY ' '                                                       
              DISPLAY W-DB2-ERR-MSG-OUT                                 CAT520  
              DISPLAY '** PROGRAM CAT916H2 ABENDED '                            
              CALL ABEND      USING ABEND-CODE-5000.                            
                                                                                
      *                                                                         
      *----------------------------------------------------------------*        
      *           FETCH ACTIVE TRANSFER CURSOR TABLE                   *        
      *----------------------------------------------------------------*        
       420-FETCH-TFR-CURSOR-TBL.                                                
           EXEC SQL                                                             
              FETCH                                                             
                 TFRCRSR                                                        
              INTO                                                              
                :DCLVTRNHSTY.CLIENT-NBR                                         
               ,:ACAT-CONTROL-NBR                                               
               ,:SBMTG-PRTCP-NBR                                                
               ,:SBMT-PRT-NR-STS-CD                                             
               ,:CONTROL-NBR-STS-CD                                             
               ,:DLVR-NBR                                                       
               ,:DLVR-NBR-STTS-CD                                               
               ,:ACCT-DLVR-NBR                                                  
               ,:ACCT-DLVR-STTS-CD                                              
               ,:RCV-NBR                                                        
               ,:RCV-NBR-STTS-CD                                                
               ,:ACCT-RCV-NBR                                                   
               ,:ACCT-RCV-STTS-CD                                               
               ,:TRNFR-TYPE-CD                                                  
               ,:TRNFR-TYPE-STTS-CD                                             
               ,:TRANS-TYPE-CD                                                  
               ,:TRANS-TYPE-STTS-CD                                             
               ,:RCV-CUST-NM                                                    
               ,:RCV-CUST-NM-STS-CD                                             
               ,:RCV-SS-PRIM-NBR                                                
               ,:RCV-SS-PRIM-STS-CD                                             
               ,:RCV-SS-SCNDY-NBR                                               
               ,:RCV-SS-SCDY-STS-CD                                             
               ,:RCV-ACCT-TYPE-CD                                               
               ,:RCV-ACT-TYP-STS-CD                                             
               ,:RCV-OCC-BRKR-NBR                                               
               ,:RCV-OCC-STTS-CD                                                
               ,:RCV-CRSPN-NBR                                                  
               ,:RCV-CRSPN-STTS-CD                                              
               ,:ACAT-CNTL-ASTD-NBR                                             
               ,:CNTL-ASTD-STTS-CD                                              
               ,:CMNT-TXT                                                       
               ,:CMNT-STTS-CD                                                   
               ,:PRCS-DT                                                        
               ,:STTS-CD                                                        
               ,:STTLM-TM-CD                                                    
               ,:VAL-FREE-CD                                                    
               ,:TRANS-RFRN-ID-CD                                               
               ,:TRANS-RFRN-STTS-CD                                             
               ,:DB-CR-CD                                                       
               ,:DSTBN-SIDE-CD                                                  
               ,:SYS-ACT-CD                                                     
               ,:SYS-RJCT-RSN-CD                                                
               ,:TRNFR-TYPE-RJC1-CD                                             
               ,:TRNFR-TYPE-RJC2-CD                                             
               ,:TRNFR-TYPE-RJCT-CD                                             
               ,:TRN-TYP-RJC-STS-CD                                             
               ,:PHSCL-SEQ-NBR                                                  
               ,:PHSCL-SEQ-STTS-CD                                              
               ,:LGCL-SEQ-NBR                                                   
               ,:LGCL-SEQ-NR-STS-CD                                             
               ,:RR-CD                                                          
               ,:BRANCH-CD                                                      
               ,:DVDND-NAA-CD                                                   
               ,:SELL-INSTN-NAA-CD                                              
               ,:CASH-SWEEP-NAA-CD                                              
               ,:PRTCP-CONTRA-CD                                                
               ,:ACM-HOLDER-NAA-CD                                              
               ,:ACCT-ACTIVITY-IND                                              
               ,:ACCT-ORDERS-IND                                                
               ,:ACCT-RJCT-RSBM-IND                                             
               ,:ACCT-DB-BAL-T1-IND                                             
               ,:ACCT-MRGN-DB-IND                                               
               ,:ACCT-SHRT-PSTN-IND                                             
               ,:ACCT-SEC-RSTRD-IND                                             
               ,:ACCT-AST-EXCS-IND                                              
               ,:ACCT-OPTN-PSTN-IND                                             
               ,:ACCT-LTD-PRTNR-IND                                             
               ,:ACCT-TIN-MSMTH-IND                                             
               ,:ACCT-DPLCT-TRN-IND                                             
               ,:ACCT-CUST-70-IND                                               
               ,:ACCT-QULFD-PLN-IND                                             
               ,:ACCT-MNGD-IND                                                  
               ,:ACCT-PRVT-RNG-IND                                              
               ,:ACCT-BRKR-TIF-IND                                              
               ,:NSCC-NON-ADP-IND                                               
               ,:CYCLE-CD                                                       
               ,:DAYS-STTS-QTY                                                  
               ,:STTLM-DT                                                       
               ,:ACCT-NA-UPDT-IND                                               
               ,:ACCT-TRNFR-FEE-AMT                                             
               ,:ACCT-IRA-TRMNT-AMT                                             
               ,:ACCT-IRA-MAINT-AMT                                             
               ,:ACCT-DLRV-PRGR-IND                                             
               ,:ACCT-CD                                                        
               ,:STTLM-ASCTD-DT                                                 
               ,:STTLM-ASCTD-STS-CD                                             
               ,:RCRD-LNGTH-STTS-CD                                             
               ,:RCRD-STTS-CD                                                   
               ,:NSCC-PEND-CD                                                   
               ,:NSCC-ACK-IND                                                   
               ,:CICS-TERM-ID-CD                                                
               ,:PRGM-NM                                                        
               ,:CRT-TMSTP                                                      
               ,:UPDT-TMSTP                                                     
               ,:ACCT-EQUITY-AMT                                                
           END-EXEC.                                                            
      *                                                                         
      *----------------------------------------------------------------*        
      *           CLOSE ACTIVE TRANSFER CURSOR TABLE                   *        
      *----------------------------------------------------------------*        
       430-CLOSE-TFR-CURSOR-TBL.                                                
           EXEC SQL                                                             
              CLOSE TFRCRSR                                                     
           END-EXEC.                                                            
       EJECT                                                                    
                                                                                
      *                                                                         
      *----------------------------------------------------------------*        
      *  FOR NA UPDATE, SAVE DB2 KEY TO SET ACCT_NA_UPDT_IND TO 'Y'.   *        
      *  NOTE: DB2 UPDATE IS DONE AT CAT612 UPDATE PROGRAM.            *        
      *----------------------------------------------------------------*        
       450-SAVE-UPDATE-TO-Y-IND.                                                
           EXEC SQL                                                             
              SELECT  ACCT_NA_UPDT_IND                                          
                INTO :ACCT-NA-UPDT-IND                                          
                FROM VTRNHSTY                                                   
               WHERE CLIENT_NBR = :WK-CLT-NBR  AND                              
                     ACAT_CONTROL_NBR = :WK-ACAT-CNTRL-NBR                      
           END-EXEC.                                                            
           IF ACCT-NA-UPDT-IND = 'Y'                                            
              CONTINUE                                                          
           ELSE                                                                 
              MOVE SPACE TO DB-SAVE-WORK-REC                                    
              MOVE WK-CLT-NBR         TO DB-SAVE-CLT-NBR                        
              MOVE WK-ACAT-CNTRL-NBR  TO DB-SAVE-ACAT-NBR                       
              MOVE WK-CURR-BRCH-CD    TO DB-SAVE-BRANCH                         
              MOVE WK-CURR-ACCT-CD    TO DB-SAVE-ACCT                           
              MOVE 'Y'                TO DB-SAVE-NA-UPDATE-IND                  
              SET  WK-DB2-TBL-UPDT-TO-Y TO TRUE                                 
              WRITE DB-SAVE-RECORD FROM DB-SAVE-WORK-REC                        
              ADD 1 TO DBSAVE-REC-CNT.                                          
      *                                                                         
      *----------------------------------------------------------------*        
      *  FOR NA UPDATE REVERSAL, SAVE DB2 KEY TO SET ACCT_NA_UPDT_IND  *        
      *  TO 'N'.                                                       *        
      *  NOTE: DB2 UPDATE IS DONE AT CAT612 UPDATE PROGRAM.            *        
      *----------------------------------------------------------------*        
       460-SAVE-UPDATE-TO-N-IND.                                                
           EXEC SQL                                                             
              SELECT  ACCT_NA_UPDT_IND                                          
                INTO :ACCT-NA-UPDT-IND                                          
                FROM VTRNHSTY                                                   
               WHERE CLIENT_NBR = :WK-CLT-NBR  AND                              
                     ACAT_CONTROL_NBR = :WK-ACAT-CNTRL-NBR                      
           END-EXEC.                                                            
           IF ACCT-NA-UPDT-IND = 'N'                                            
              CONTINUE                                                          
           ELSE                                                                 
              MOVE SPACE TO DB-SAVE-WORK-REC                                    
              MOVE WK-CLT-NBR         TO DB-SAVE-CLT-NBR                        
              MOVE WK-ACAT-CNTRL-NBR  TO DB-SAVE-ACAT-NBR                       
              MOVE WK-CURR-BRCH-CD    TO DB-SAVE-BRANCH                         
              MOVE WK-CURR-ACCT-CD    TO DB-SAVE-ACCT                           
              MOVE 'N'                TO DB-SAVE-NA-UPDATE-IND                  
              SET  WK-DB2-TBL-UPDT-TO-N TO TRUE                                 
              WRITE DB-SAVE-RECORD FROM DB-SAVE-WORK-REC                        
              ADD 1 TO DBSAVE-REC-CNT.                                          
       EJECT                                                                    
                                                                                
       500-SET-B1-TABLE.                                                        
           MOVE '0'                    TO WS-CLIENT-NBR                         
           MOVE B1-ADP-CL-NO (B1-SUB1) TO WS-CLIENT-NBR (2:3)                   
           DISPLAY 'ACAT-BROKER-CLR-NO - ' B1-BKR-CLR-NO (B1-SUB1)              
           MOVE B1-TABLE (B1-SUB1) TO B1-WRK-TABLE                              
           MOVE B1-SUB1  TO  B1-SUB1-SVE                                        
           MOVE 'Y'  TO  B1-TABLE-SEARCH-STATUS                                 
           MOVE 'Y'  TO  B1-TABLE-SEARCH-SWITCH.                                
       EJECT                                                                    
                                                                                
       575-B1-NOT-RPTING.                                                       
                                                                                
           IF B1-CL-HIT (B4-SUB) NOT = 'Y'                                      
             INITIALIZE ACAT-DATA-REC                                           
             MOVE B1-ADP-CL-NO (B4-SUB) TO ADR-CLIENT                           
             MOVE B1-CLI-NAME  (B4-SUB) TO ADR-CLIENT-NAME                      
             MOVE ZERO                  TO ADR-CONTROLLER                       
             MOVE LOW-VALUES            TO ADR-BRANCH                           
                                           ADR-ACCOUNT                          
             RELEASE SORT-REC FROM ACAT-DATA-REC.                               
                                                                                
       575-B1-NOT-RPTING-EXIT.  EXIT.                                           
           EJECT                                                                
                                                                                
       600-DELIVER-UPDTE.                                                       
                                                                                
           MOVE SPACES  TO  NAUP-1000A00-REC.                                   
           MOVE SPACES  TO  NAUP-1000I00-REC.                                   
                                                                                
           MOVE '10'                TO  NAUP-10A0-RECORD-ID.                    
           MOVE '00'                TO  NAUP-10A0-RECORD-ID2.                   
           MOVE 'X'                 TO  NAUP-10A0-CHECK-DIGIT.                  
           MOVE ZERO                TO  NAUP-10A0-ACCT-TYPE.                    
           MOVE '3'                 TO  NAUP-10A0-ACTION-CD.                    
           MOVE 'A'                 TO  NAUP-10A0-TRID-CODE.                    
           MOVE 'A'                 TO  NAUP-10A0-SEG-ID.                       
           MOVE 00                  TO  NAUP-10A0-SEG-UPDT-SEQ.                 
                                                                                
           MOVE B1-WRK-ADP-CL-NO    TO  NAUP-10A0-CL                            
                                        NAUP-10I0-CL.                           
           MOVE BRANCH-CD           TO  NAUP-10A0-BR                            
                                        NAUP-10I0-BR.                           
           MOVE ACCT-CD             TO  NAUP-10A0-ACCT                          
                                        NAUP-10I0-ACCT.                         
                                                                                
           MOVE  'D'    TO  NAUPA0-ACAT-CODE.                                   
           MOVE  '07'   TO  NAUPA0-SELL-CODE.                                   
           MOVE  '0'    TO  NAUPA0-AUTO-FUND-XFER2.                             
           MOVE NAUP-1000A00-REC  TO  NA-UPDATE-REC.                            
           PERFORM 900-WRITE-NA-UPDATE THRU                                     
                   900-WRITE-NA-UPDATE-EXIT.                                    
                                                                                
           MOVE '10'                TO  NAUP-10I0-RECORD-ID.                    
           MOVE '00'                TO  NAUP-10I0-RECORD-ID2.                   
           MOVE 'X'                 TO  NAUP-10I0-CHECK-DIGIT.                  
           MOVE ZERO                TO  NAUP-10I0-ACCT-TYPE.                    
           MOVE 00                  TO  NAUP-10I0-SEG-UPDT-SEQ.                 
           MOVE '3'                 TO  NAUP-10I0-ACTION-CD.                    
           MOVE 'A'                 TO  NAUP-10I0-TRID-CODE.                    
           MOVE 'I'                 TO  NAUP-10I0-SEG-ID.                       
                                                                                
           MOVE  '2'    TO  NAUPI0-DIVIDEND-PAY-CD.                             
           MOVE 'Y'     TO  NAUPI0-NMB-CASH-ACCT                                
                            NAUPI0-NMB-MRGN-ACCT.                               
      **** MOVE ACAT-CONTRA-BRK-NUM  TO  NAUPI0-ACAT-DELIV-BROKER-NO.           
      **   IF WK-CLNT-IS-DELIVERER                                              
      **      MOVE RCV-NBR        TO  NAUPI0-ACAT-DELIV-BROKER-NO               
      **   ELSE                                                                 
      **   IF WK-CLNT-IS-RECEIVER                                               
      **      MOVE DLVR-NBR       TO  NAUPI0-ACAT-DELIV-BROKER-NO               
      **   END-IF.                                                              
           IF DSTBN-SIDE-CD = 'D'                                               
              MOVE RCV-NBR        TO  NAUPI0-ACAT-DELIV-BROKER-NO               
           ELSE                                                                 
           IF DSTBN-SIDE-CD = 'R'                                               
              MOVE DLVR-NBR       TO  NAUPI0-ACAT-DELIV-BROKER-NO               
           END-IF.                                                              
           MOVE NAUP-1000I00-REC  TO  NA-UPDATE-REC.                            
           PERFORM 900-WRITE-NA-UPDATE THRU                                     
                   900-WRITE-NA-UPDATE-EXIT.                                    
                                                                                
           MOVE SPACES  TO  TEMP-DATA-REC.                                      
           MOVE B1-WRK-ADP-CL-NO    TO  TEMP-CLIENT.                            
           MOVE BRANCH-CD           TO  TEMP-BRANCH.                            
           MOVE ACCT-CD             TO  TEMP-ACCOUNT.                           
           MOVE B1-WRK-CLI-NAME     TO  TEMP-CLIENT-NAME.                       
           MOVE NAPPA-DIV-CODE      TO  TEMP-DIV-CODE.                          
           MOVE NAPPA-SELL-CODE     TO  TEMP-SELL-CODE.                         
           MOVE NAPPA-FUND-TRNSFR   TO  TEMP-CASH-SWEEP.                        
           MOVE ' '                 TO  TEMP-REJ-IND.                           
           WRITE  TEMP-RECORD     FROM  TEMP-DATA-REC.                          
       600-DELIVER-UPDTE-EXIT.   EXIT.                                          
       EJECT                                                                    
                                                                                
       625-DELIVER-REVERSAL.                                                    
                                                                                
           DISPLAY 'WE SHOULD BE IN 625-'                                       
           MOVE SPACES  TO  NAUP-1000A00-REC.                                   
           MOVE SPACES  TO  NAUP-1000I00-REC.                                   
                                                                                
           MOVE '10'                TO  NAUP-10A0-RECORD-ID.                    
           MOVE '00'                TO  NAUP-10A0-RECORD-ID2.                   
           MOVE 'X'                 TO  NAUP-10A0-CHECK-DIGIT.                  
           MOVE ZERO                TO  NAUP-10A0-ACCT-TYPE.                    
           MOVE '3'                 TO  NAUP-10A0-ACTION-CD.                    
           MOVE 'A'                 TO  NAUP-10A0-TRID-CODE.                    
           MOVE 'A'                 TO  NAUP-10A0-SEG-ID.                       
           MOVE 00                  TO  NAUP-10A0-SEG-UPDT-SEQ.                 
                                                                                
           MOVE B1-WRK-ADP-CL-NO    TO  NAUP-10A0-CL                            
                                        NAUP-10I0-CL.                           
           MOVE BRANCH-CD           TO  NAUP-10A0-BR                            
                                        NAUP-10I0-BR.                           
           MOVE ACCT-CD             TO  NAUP-10A0-ACCT                          
                                        NAUP-10I0-ACCT.                         
                                                                                
           MOVE  '-'    TO  NAUPA0-ACAT-CODE.                                   
           MOVE NAUP-1000A00-REC  TO  NA-UPDATE-REC.                            
           PERFORM 900-WRITE-NA-UPDATE THRU                                     
                   900-WRITE-NA-UPDATE-EXIT.                                    
                                                                                
           MOVE '10'                TO  NAUP-10I0-RECORD-ID.                    
           MOVE '00'                TO  NAUP-10I0-RECORD-ID2.                   
           MOVE 'X'                 TO  NAUP-10I0-CHECK-DIGIT.                  
           MOVE ZERO                TO  NAUP-10I0-ACCT-TYPE.                    
           MOVE 00                  TO  NAUP-10I0-SEG-UPDT-SEQ.                 
           MOVE '3'                 TO  NAUP-10I0-ACTION-CD.                    
           MOVE 'A'                 TO  NAUP-10I0-TRID-CODE.                    
           MOVE 'I'                 TO  NAUP-10I0-SEG-ID.                       
                                                                                
           MOVE '-'     TO  NAUPI0-NMB-CASH-ACCT                                
                            NAUPI0-NMB-MRGN-ACCT.                               
           MOVE '----'            TO  NAUPI0-ACAT-DELIV-BROKER-NO.              
           MOVE NAUP-1000I00-REC  TO  NA-UPDATE-REC.                            
           PERFORM 900-WRITE-NA-UPDATE THRU                                     
                   900-WRITE-NA-UPDATE-EXIT.                                    
                                                                                
           MOVE SPACES  TO  TEMP-DATA-REC.                                      
           MOVE B1-WRK-ADP-CL-NO    TO  TEMP-CLIENT.                            
           MOVE BRANCH-CD           TO  TEMP-BRANCH.                            
           MOVE ACCT-CD             TO  TEMP-ACCOUNT.                           
           MOVE B1-WRK-CLI-NAME     TO  TEMP-CLIENT-NAME.                       
           MOVE ' '                 TO  TEMP-DIV-CODE.                          
           MOVE ' '                 TO  TEMP-SELL-CODE.                         
           MOVE ' '                 TO  TEMP-CASH-SWEEP.                        
           MOVE 'Y'                 TO  TEMP-REJ-IND.                           
           WRITE  TEMP-RECORD     FROM  TEMP-DATA-REC.                          
       625-DELIVER-REVERSAL-EXIT.   EXIT.                                       
       EJECT                                                                    
                                                                                
       650-PREMIER-UPDTE.                                                       
                                                                                
           IF  GETNA-RETURN-FOUND     AND                                       
               NOT  NAPPA-SEGMENT-MISSING                                       
             CONTINUE                                                           
           ELSE                                                                 
             GO TO 650-PREMIER-UPDTE-EXIT.                                      
                                                                                
      * DETERMINE IF PREMIERE ACCOUNT                                           
                                                                                
           IF NAPPA-CASH-MNGMNT = 'A' OR 'P' OR 'M'                             
             CONTINUE                                                           
           ELSE                                                                 
             GO TO 650-PREMIER-UPDTE-EXIT.                                      
                                                                                
      * PREMIERE ACCOUNT PROCESSING                                             
                                                                                
           MOVE SPACES  TO  NAUP-1000A00-REC.                                   
           MOVE SPACES  TO  NAUP-1000A01-REC.                                   
                                                                                
           MOVE '10'                TO  NAUP-10A0-RECORD-ID.                    
           MOVE '00'                TO  NAUP-10A0-RECORD-ID2.                   
           MOVE 'X'                 TO  NAUP-10A0-CHECK-DIGIT.                  
           MOVE ZERO                TO  NAUP-10A0-ACCT-TYPE.                    
           MOVE '3'                 TO  NAUP-10A0-ACTION-CD.                    
           MOVE 'A'                 TO  NAUP-10A0-TRID-CODE.                    
           MOVE 'A'                 TO  NAUP-10A0-SEG-ID.                       
           MOVE 00                  TO  NAUP-10A0-SEG-UPDT-SEQ.                 
                                                                                
           MOVE B1-WRK-ADP-CL-NO    TO  NAUP-10A0-CL                            
                                        NAUP-10A1-CL.                           
           MOVE BRANCH-CD           TO  NAUP-10A0-BR                            
                                        NAUP-10A1-BR.                           
           MOVE ACCT-CD             TO  NAUP-10A0-ACCT                          
                                        NAUP-10A1-ACCT.                         
                                                                                
           MOVE  '-'    TO  NAUPA0-AUTO-CASH-MNGMNT2.                           
           MOVE  '--'   TO  NAUPA0-99FUNDS-SLOT.                                
                                                                                
           MOVE NAUP-1000A00-REC  TO  NA-UPDATE-REC.                            
           PERFORM 900-WRITE-NA-UPDATE THRU                                     
                   900-WRITE-NA-UPDATE-EXIT.                                    
                                                                                
           MOVE '10'                TO  NAUP-10A1-RECORD-ID.                    
           MOVE '00'                TO  NAUP-10A1-RECORD-ID2.                   
           MOVE 'X'                 TO  NAUP-10A1-CHECK-DIGIT.                  
           MOVE ZERO                TO  NAUP-10A1-ACCT-TYPE.                    
           MOVE '3'                 TO  NAUP-10A1-ACTION-CD.                    
           MOVE 'A'                 TO  NAUP-10A1-TRID-CODE.                    
           MOVE 'A'                 TO  NAUP-10A1-SEG-ID.                       
           MOVE 01                  TO  NAUP-10A1-SEG-UPDT-SEQ.                 
                                                                                
           MOVE '03'    TO  NAUPA1-ACM-CANCEL-CODE.                             
                                                                                
           MOVE NAUP-1000A01-REC  TO  NA-UPDATE-REC.                            
           PERFORM 900-WRITE-NA-UPDATE THRU                                     
                   900-WRITE-NA-UPDATE-EXIT.                                    
                                                                                
           PERFORM 800-FORMAT-REPORT-REC THRU                                   
                   800-FORMAT-REPORT-REC-EXIT.                                  
                                                                                
       650-PREMIER-UPDTE-EXIT.  EXIT.                                           
      *                                                                         
      *                                                                         
       651-PREMIER-REPORT-ONLY.                                                 
           IF  GETNA-RETURN-FOUND     AND                                       
               NOT  NAPPA-SEGMENT-MISSING                                       
             CONTINUE                                                           
           ELSE                                                                 
             GO TO 651-EXIT.                                                    
                                                                                
           IF NAPPA-CASH-MNGMNT = 'A' OR 'P' OR 'M'                             
                 PERFORM 800-FORMAT-REPORT-REC                                  
                 THRU    800-FORMAT-REPORT-REC-EXIT                             
           END-IF.                                                              
                                                                                
       651-EXIT.       EXIT.                                                    
       EJECT                                                                    
                                                                                
       700-RECEIVER-UPDTE.                                                      
                                                                                
           MOVE SPACES  TO  NAUP-1000A00-REC.                                   
           MOVE SPACES  TO  NAUP-1000I00-REC.                                   
                                                                                
           MOVE '10'                TO  NAUP-10A0-RECORD-ID.                    
           MOVE '00'                TO  NAUP-10A0-RECORD-ID2.                   
           MOVE 'X'                 TO  NAUP-10A0-CHECK-DIGIT.                  
           MOVE ZERO                TO  NAUP-10A0-ACCT-TYPE.                    
           MOVE '3'                 TO  NAUP-10A0-ACTION-CD.                    
           MOVE 'A'                 TO  NAUP-10A0-TRID-CODE.                    
           MOVE 'A'                 TO  NAUP-10A0-SEG-ID.                       
           MOVE 00                TO  NAUP-10A0-SEG-UPDT-SEQ.                   
                                                                                
           MOVE B1-WRK-ADP-CL-NO    TO  NAUP-10A0-CL                            
                                        NAUP-10I0-CL.                           
           MOVE BRANCH-CD           TO  NAUP-10A0-BR                            
                                        NAUP-10I0-BR.                           
           MOVE ACCT-CD             TO  NAUP-10A0-ACCT                          
                                        NAUP-10I0-ACCT.                         
                                                                                
           MOVE  'R'    TO  NAUPA0-ACAT-CODE.                                   
           MOVE NAUP-1000A00-REC  TO  NA-UPDATE-REC                             
           PERFORM 900-WRITE-NA-UPDATE THRU                                     
                   900-WRITE-NA-UPDATE-EXIT                                     
                                                                                
           MOVE '10'                TO  NAUP-10I0-RECORD-ID.                    
           MOVE '00'                TO  NAUP-10I0-RECORD-ID2.                   
           MOVE 'X'                 TO  NAUP-10I0-CHECK-DIGIT.                  
           MOVE ZERO                TO  NAUP-10I0-ACCT-TYPE.                    
           MOVE 00                  TO  NAUP-10I0-SEG-UPDT-SEQ.                 
           MOVE '3'                 TO  NAUP-10I0-ACTION-CD.                    
           MOVE 'A'                 TO  NAUP-10I0-TRID-CODE.                    
           MOVE 'I'                 TO  NAUP-10I0-SEG-ID.                       
                                                                                
      **** MOVE ACAT-CONTRA-BRK-NUM  TO  NAUPI0-ACAT-RECV-BROKER-NO.            
      **   IF WK-CLNT-IS-DELIVERER                                              
      **      MOVE RCV-NBR        TO  NAUPI0-ACAT-RECV-BROKER-NO                
      **   ELSE                                                                 
      **   IF WK-CLNT-IS-RECEIVER                                               
      **      MOVE DLVR-NBR       TO  NAUPI0-ACAT-RECV-BROKER-NO.               
           IF DSTBN-SIDE-CD = 'D'                                               
              MOVE RCV-NBR        TO  NAUPI0-ACAT-RECV-BROKER-NO                
           ELSE                                                                 
           IF DSTBN-SIDE-CD = 'R'                                               
              MOVE DLVR-NBR       TO  NAUPI0-ACAT-RECV-BROKER-NO.               
           MOVE NAUP-1000I00-REC  TO  NA-UPDATE-REC.                            
           PERFORM 900-WRITE-NA-UPDATE THRU                                     
                   900-WRITE-NA-UPDATE-EXIT.                                    
       700-RECEIVER-UPDTE-EXIT.  EXIT.                                          
       EJECT                                                                    
                                                                                
       725-RECEIVER-REVERSAL.                                                   
                                                                                
           MOVE SPACES  TO  NAUP-1000A00-REC.                                   
           MOVE SPACES  TO  NAUP-1000I00-REC.                                   
                                                                                
           MOVE '10'                TO  NAUP-10A0-RECORD-ID.                    
           MOVE '00'                TO  NAUP-10A0-RECORD-ID2.                   
           MOVE 'X'                 TO  NAUP-10A0-CHECK-DIGIT.                  
           MOVE ZERO                TO  NAUP-10A0-ACCT-TYPE.                    
           MOVE '3'                 TO  NAUP-10A0-ACTION-CD.                    
           MOVE 'A'                 TO  NAUP-10A0-TRID-CODE.                    
           MOVE 'A'                 TO  NAUP-10A0-SEG-ID.                       
           MOVE 00                  TO  NAUP-10A0-SEG-UPDT-SEQ.                 
                                                                                
           MOVE B1-WRK-ADP-CL-NO    TO  NAUP-10A0-CL                            
                                        NAUP-10I0-CL.                           
           MOVE BRANCH-CD           TO  NAUP-10A0-BR                            
                                        NAUP-10I0-BR.                           
           MOVE ACCT-CD             TO  NAUP-10A0-ACCT                          
                                        NAUP-10I0-ACCT.                         
                                                                                
           MOVE  '-'    TO  NAUPA0-ACAT-CODE.                                   
           MOVE NAUP-1000A00-REC  TO  NA-UPDATE-REC                             
           PERFORM 900-WRITE-NA-UPDATE THRU                                     
                   900-WRITE-NA-UPDATE-EXIT                                     
                                                                                
           MOVE '10'                TO  NAUP-10I0-RECORD-ID.                    
           MOVE '00'                TO  NAUP-10I0-RECORD-ID2.                   
           MOVE 'X'                 TO  NAUP-10I0-CHECK-DIGIT.                  
           MOVE ZERO                TO  NAUP-10I0-ACCT-TYPE.                    
           MOVE 00                  TO  NAUP-10I0-SEG-UPDT-SEQ.                 
           MOVE '3'                 TO  NAUP-10I0-ACTION-CD.                    
           MOVE 'A'                 TO  NAUP-10I0-TRID-CODE.                    
           MOVE 'I'                 TO  NAUP-10I0-SEG-ID.                       
                                                                                
           MOVE '----'            TO  NAUPI0-ACAT-RECV-BROKER-NO.               
           MOVE NAUP-1000I00-REC  TO  NA-UPDATE-REC.                            
           PERFORM 900-WRITE-NA-UPDATE THRU                                     
                   900-WRITE-NA-UPDATE-EXIT.                                    
       725-RECEIVER-REVERSAL-EXIT.  EXIT.                                       
       EJECT                                                                    
                                                                                
       800-FORMAT-REPORT-REC.                                                   
                                                                                
           MOVE 'Y'                 TO  B1-CL-HIT (B1-SUB1-SVE).                
           MOVE B1-WRK-ADP-CL-NO    TO  ADR-CLIENT.                             
           MOVE ZERO                TO  ADR-CONTROLLER.                         
           MOVE BRANCH-CD           TO  ADR-BRANCH.                             
           MOVE ACCT-CD             TO  ADR-ACCOUNT.                            
           MOVE B1-WRK-CLI-NAME     TO  ADR-CLIENT-NAME.                        
           IF  GETNA-RETURN-FOUND     AND                                       
               NOT  NAPPB-SEGMENT-MISSING                                       
              MOVE NAPPB-NA-LINE1-30 (1)  TO  ADR-ACCT-TITLE                    
              MOVE NAPPB-NA-LINE1-30 (2)  TO  ADR-ACCT-TITLE (31:30)            
              MOVE NAPPB-NA-LINE1-30 (3)  TO  ADR-ACCT-TITLE (61:30)            
           ELSE                                                                 
              MOVE '* NOT FOUND ON N\A MASTER *'  TO ADR-ACCT-TITLE.            
                                                                                
           IF  GETNA-RETURN-FOUND     AND                                       
               NOT  NNARPC-SEGMENT-MISSING                                      
             MOVE NNARPC-DATE-CARD-OPENED TO WORK-DATE-OPEN                     
             MOVE WORK-DATE-OPEN          TO  ADR-DATE-OPENED                   
           ELSE                                                                 
             MOVE '00000000'              TO  ADR-DATE-OPENED.                  
                                                                                
           RELEASE SORT-REC FROM ACAT-DATA-REC.                                 
                                                                                
       800-FORMAT-REPORT-REC-EXIT.  EXIT.                                       
       EJECT                                                                    
                                                                                
       900-WRITE-NA-UPDATE.                                                     
                                                                                
           WRITE NA-UPDATE-REC.                                                 
           ADD  1  TO  NA-UPDATE-RECS.                                          
                                                                                
       900-WRITE-NA-UPDATE-EXIT.  EXIT.                                         
       EJECT                                                                    
                                                                                
       1000-MRGN-INTEREST-FILE-RTN.                                             
           MOVE SPACE            TO MGNINT-REC.                                 
           MOVE CLIENT-NBR (2:3) TO MGNINT-CLT-X.                               
           MOVE ZEROES           TO MGNINT-CURR-N.                              
           MOVE BRANCH-CD        TO MGNINT-BR-X.                                
           MOVE ACCT-CD          TO MGNINT-ACCT-X.                              
           MOVE 'CAT916H2'       TO MGNINT-SRC-PGM.                             
           IF WK-TRNFR-SETTLED                                                  
              MOVE 0  TO MGNINT-NUM-OF-DAYS                                     
           ELSE                                                                 
           IF B1-WRK-SUBMIT-ASSETS = '1'                                        
              MOVE 6  TO MGNINT-NUM-OF-DAYS                                     
           ELSE                                                                 
           IF B1-WRK-SUBMIT-ASSETS = '2'                                        
              MOVE 7  TO MGNINT-NUM-OF-DAYS                                     
           ELSE                                                                 
           IF B1-WRK-SUBMIT-ASSETS = '3'                                        
              MOVE 8  TO MGNINT-NUM-OF-DAYS                                     
           END-IF.                                                              
           WRITE MGN-INT-REC FROM MGNINT-REC.                                   
           ADD  1  TO  MGN-INT-REC-CNT                                          
                       MGNINT-REC-CNT.                                          
                                                                                
       1010-MRGN-INT-HEADER-RTN.                                                
           MOVE SPACE             TO MGNINT-REC.                                
           MOVE LOW-VALUE         TO MGNINT-KEY.                                
           MOVE EDIT-CURRENT-DATE TO MGNINT-FH-MDY-X.                           
           MOVE 'CAT916H2'        TO MGNINT-FH-SRC-PGM.                         
           WRITE MGN-INT-REC FROM MGNINT-REC.                                   
                                                                                
       1020-MRGN-INT-TRLR-RTN.                                                  
           MOVE SPACE            TO MGNINT-REC.                                 
           MOVE HIGH-VALUE       TO MGNINT-KEY.                                 
           MOVE MGN-INT-REC-CNT  TO MGNINT-FT-CNT.                              
           MOVE 'CAT916H2'       TO MGNINT-FT-SRC-PGM.                          
           WRITE MGN-INT-REC FROM MGNINT-REC.                                   
       EJECT                                                                    
                                                                                
       1100-PAYMENT-DETAIL-RTN.                                                 
           MOVE SPACE            TO PMNT-RECORD.                                
           MOVE CLIENT-NBR (2:3) TO PMNT-CLIENT-NBR.                            
           MOVE BRANCH-CD        TO PMNT-BRANCH-NBR.                            
           MOVE ACCT-CD          TO PMNT-ACCOUNT-NBR.                           
           WRITE PAYMENT-REC  FROM PMNT-RECORD.                                 
           ADD 1 TO PPMNT-REC-CNT.                                              
                                                                                
       1110-PAYMENT-HEADER-RTN.                                                 
           MOVE SPACE     TO PMNT-RECORD.                                       
           SET PMNT-HDR-DATE-LITERAL TO TRUE.                                   
           MOVE PROC-DATE TO PMNT-HDR-PROC-DATE.                                
           WRITE PAYMENT-REC  FROM PMNT-RECORD.                                 
                                                                                
                                                                                
       1400-PREMIER-REPORT SECTION.                                             
                                                                                
           DISPLAY '*********** START OF SORTOUT ROUTINE ***********'.          
C11582     MOVE ZERO TO TRAC-CLI.                                               
                                                                                
       1410-NEXT-REC.                                                           
           RETURN SORT-FILE INTO ACAT-DATA-REC                                  
             AT END GO TO 1400-PREMIER-REPORT-EXIT.                             
                                                                                
C11582*    DISPLAY 'REC= ' ACAT-DATA-REC.                                       
                                                                                
C11582     IF ADR-CLIENT NOT = TRAC-CLI                                         
C11582       MOVE 0 TO PAGECNT                                                  
C11582       PERFORM 1450-HEADERS THRU                                          
C11582               1450-HEADERS-EXIT.                                         
                                                                                
           IF LINECNT > 55                                                      
             PERFORM 1450-HEADERS THRU                                          
                     1450-HEADERS-EXIT.                                         
                                                                                
           IF ADR-BRANCH  =  LOW-VALUES                                         
             MOVE '**** NO PREMIER ACCOUNT TRANSFERS ****' TO NAL-MSG           
             MOVE NO-ACTV-LINE         TO PRINT-AREA                            
             MOVE '0'                  TO CC                                    
             PERFORM 1425-PRINT-LINE THRU                                       
                     1425-PRINT-LINE-EXIT                                       
             GO TO 1410-NEXT-REC.                                               
                                                                                
           MOVE SPACES                 TO DETAIL-LINE-1.                        
           MOVE ADR-BRANCH             TO DL1-BRANCH.                           
           MOVE '-'                    TO DL1-DASH.                             
           MOVE ADR-ACCOUNT            TO DL1-ACCOUNT.                          
           MOVE ADR-ACCT-TITLE (1:30)  TO DL1-ACCT-TITLE.                       
      **   MOVE ADR-DATE-OPENED        TO WORK-DATE-AREA.                       
      **   MOVE WDA-YY                 TO DL1-DO-YY.                            
      **   MOVE WDA-MM                 TO DL1-DO-MM.                            
      **   MOVE WDA-DD                 TO DL1-DO-DD.                            
      **   MOVE '/'                    TO DL1-SL1                               
      **                                  DL1-SL2.                              
           IF ADR-DATE-OPENED > '00000000'                                      
              MOVE ADR-DATE-OPENED     TO WORK-DATE-AREA                        
              MOVE WDA-YY              TO DL1-DO-YY                             
              MOVE WDA-MM              TO DL1-DO-MM                             
              MOVE WDA-DD              TO DL1-DO-DD                             
              MOVE '/'                 TO DL1-SL1                               
                                       DL1-SL2.                                 
           MOVE DETAIL-LINE-1          TO PRINT-AREA.                           
           MOVE '0'                    TO CC.                                   
                                                                                
           PERFORM 1425-PRINT-LINE THRU                                         
                   1425-PRINT-LINE-EXIT.                                        
                                                                                
           MOVE SPACES                 TO DETAIL-LINE-1.                        
           MOVE ADR-ACCT-TITLE (31:30) TO DL1-ACCT-TITLE.                       
           MOVE DETAIL-LINE-1          TO PRINT-AREA.                           
           MOVE ' '                    TO CC.                                   
                                                                                
           PERFORM 1425-PRINT-LINE THRU                                         
                   1425-PRINT-LINE-EXIT.                                        
                                                                                
           MOVE SPACES                 TO DETAIL-LINE-1.                        
           MOVE ADR-ACCT-TITLE (61:30) TO DL1-ACCT-TITLE.                       
           MOVE DETAIL-LINE-1          TO PRINT-AREA.                           
           MOVE ' '                    TO CC.                                   
                                                                                
           PERFORM 1425-PRINT-LINE THRU                                         
                   1425-PRINT-LINE-EXIT.                                        
                                                                                
           GO TO 1410-NEXT-REC.                                                 
                                                                                
       1400-PREMIER-REPORT-EXIT.  EXIT.                                         
                                                                                
       1425-PRINT-LINE.                                                         
                                                                                
           WRITE REPORT-REC FROM PRINTAREA.                                     
           IF CC = '1'                                                          
             MOVE 3 TO LINECNT.                                                 
           IF CC = '-'                                                          
             ADD 3 TO LINECNT.                                                  
           IF CC = '0'                                                          
             ADD 2 TO LINECNT.                                                  
           IF CC = ' '                                                          
             ADD 1 TO LINECNT.                                                  
                                                                                
       1425-PRINT-LINE-EXIT.  EXIT.                                             
                                                                                
       1450-HEADERS.                                                            
                                                                                
           MOVE ADR-CLIENT             TO  TRAC-CLI.                            
           MOVE ADR-CONTROLLER         TO  TRAC-CNTL.                           
                                                                                
           ADD  1                      TO  PAGECNT.                             
           MOVE ADR-CLIENT             TO  H1-CLIENT                            
           MOVE ADR-CLIENT-NAME        TO  H1-CLIENT-NAME.                      
           MOVE PAGECNT                TO  H1-PGENO.                            
           MOVE HDR1                   TO  PRINT-AREA.                          
           MOVE '1'                    TO  CC.                                  
           PERFORM 1425-PRINT-LINE THRU                                         
                   1425-PRINT-LINE-EXIT.                                        
                                                                                
           MOVE HDR2                   TO  PRINT-AREA.                          
           MOVE ' '                    TO  CC.                                  
           PERFORM 1425-PRINT-LINE THRU                                         
                   1425-PRINT-LINE-EXIT.                                        
                                                                                
           MOVE HDR3                   TO  PRINT-AREA.                          
           MOVE ' '                    TO  CC.                                  
           PERFORM 1425-PRINT-LINE THRU                                         
                   1425-PRINT-LINE-EXIT.                                        
                                                                                
           MOVE 5                       TO  LINECNT.                            
                                                                                
       1450-HEADERS-EXIT.  EXIT.                                                
           EJECT                                                                
       1500-NAUPDT-REPORT SECTION.                                              
                                                                                
C11582     DISPLAY '*********** START OF SORTOUT ROUTINE 2 *********'.          
C11582     MOVE ZERO TO TRAC-CLI.                                               
           MOVE ' ' TO REPORT-2-BREAK-SW.                                       
                                                                                
       1510-NEXT-REC.                                                           
           RETURN SORT-FILE-2 INTO TEMP-DATA-REC                                
             AT END GO TO 1500-NAUPDT-REPORT-EXIT.                              
                                                                                
C11582     IF TEMP-CLIENT NOT = TRAC-CLI                                        
C11582        MOVE ZERO TO PAGECNT-2                                            
C11582        PERFORM 1550-HEADERS THRU                                         
C11582                1550-HEADERS-EXIT.                                        
                                                                                
           IF TEMP-REJ-IND > ' '                                                
             IF REPORT-2-BREAK-SW = ' '                                         
                PERFORM 1550-HEADERS THRU                                       
                        1550-HEADERS-EXIT                                       
                MOVE 'Y' TO REPORT-2-BREAK-SW                                   
             END-IF                                                             
           END-IF.                                                              
                                                                                
C11582*    DISPLAY 'REC2= ' TEMP-DATA-REC.                                      
                                                                                
           IF LINECNT-2 > 55                                                    
             PERFORM 1550-HEADERS THRU                                          
                     1550-HEADERS-EXIT.                                         
                                                                                
           IF TEMP-BRANCH  =  LOW-VALUES                                        
             MOVE '** NO DELIVERER N&A UPDATES TODAY **' TO NAL-MSG             
             MOVE NO-ACTV-LINE         TO PRINT-AREA                            
             MOVE '0'                  TO CC                                    
             PERFORM 1525-PRINT-LINE THRU                                       
                     1525-PRINT-LINE-EXIT                                       
             GO TO 1510-NEXT-REC.                                               
                                                                                
           MOVE SPACES                 TO DETAIL-LINE-2.                        
           MOVE TEMP-BRANCH            TO DL2-BRANCH.                           
           MOVE '-'                    TO DL2-DASH.                             
           MOVE TEMP-ACCOUNT           TO DL2-ACCOUNT.                          
           MOVE TEMP-DIV-CODE          TO DL2-DIV-CODE.                         
           MOVE TEMP-SELL-CODE         TO DL2-SELL-CODE.                        
           MOVE TEMP-REJ-IND           TO DL2-REJ-IND.                          
C05759     MOVE TEMP-CASH-SWEEP        TO DL2-CASH-SWEEP.                       
           MOVE DETAIL-LINE-2          TO PRINT-AREA.                           
           MOVE '0'                    TO CC.                                   
                                                                                
           PERFORM 1525-PRINT-LINE THRU                                         
                   1525-PRINT-LINE-EXIT.                                        
                                                                                
           GO TO 1510-NEXT-REC.                                                 
                                                                                
       1500-NAUPDT-REPORT-EXIT.  EXIT.                                          
                                                                                
       1525-PRINT-LINE.                                                         
                                                                                
           WRITE REPORT-REC-2 FROM PRINTAREA.                                   
           IF CC = '1'                                                          
             MOVE 3 TO LINECNT-2.                                               
           IF CC = '-'                                                          
             ADD 3 TO LINECNT-2.                                                
           IF CC = '0'                                                          
             ADD 2 TO LINECNT-2.                                                
           IF CC = ' '                                                          
             ADD 1 TO LINECNT-2.                                                
                                                                                
       1525-PRINT-LINE-EXIT.  EXIT.                                             
                                                                                
       1550-HEADERS.                                                            
                                                                                
           MOVE TEMP-CLIENT            TO  TRAC-CLI.                            
           MOVE ZEROS                  TO  TRAC-CNTL.                           
                                                                                
           ADD  1                      TO  PAGECNT-2.                           
           MOVE TEMP-CLIENT            TO  H1-CLIENT-2.                         
           MOVE TEMP-CLIENT-NAME       TO  H1-CLIENT-NAME-2.                    
           MOVE PAGECNT-2              TO  H1-PGENO-2.                          
           MOVE HDR1-2                 TO  PRINT-AREA.                          
           MOVE '1'                    TO  CC.                                  
           PERFORM 1525-PRINT-LINE THRU                                         
                   1525-PRINT-LINE-EXIT.                                        
                                                                                
           MOVE HDR2-2                 TO  PRINT-AREA.                          
           MOVE ' '                    TO  CC.                                  
           PERFORM 1525-PRINT-LINE THRU                                         
                   1525-PRINT-LINE-EXIT.                                        
                                                                                
           MOVE HDR3-2                 TO  PRINT-AREA.                          
           MOVE ' '                    TO  CC.                                  
           PERFORM 1525-PRINT-LINE THRU                                         
                   1525-PRINT-LINE-EXIT.                                        
                                                                                
           MOVE 5                       TO  LINECNT-2.                          
                                                                                
       1550-HEADERS-EXIT.  EXIT.                                                
      /                                                                         
       1900-ENDJOB-ROUTINE  SECTION.                                            
                                                                                
      **   DISPLAY 'ACAT HEADERS READ         '     ACAT-HDRS-READ.             
      **   DISPLAY 'ACAT TRAILERS READ        '     ACAT-TRLR-READ.             
      **   DISPLAY 'ACAT DETAIL RCDS READ     '     ACAT-DTL-RECS.              
      **   DISPLAY 'ACAT RCDS BYPASSED        '     ACAT-BYP-RECS.              
      **   DISPLAY 'ACAT RCDS REJECTED        '     ACAT-REJ-RECS.              
      **   DISPLAY 'ACAT RCDS ACCEPTED        '     ACAT-ACPT-RECS.             
           DISPLAY 'NA UPDATE RECS WRTN       '     NA-UPDATE-RECS.             
           DISPLAY 'NA DUPE KEYS BYPASSED     '     DUPE-ACCOUNTS-FOUND.        
           DISPLAY 'DB2 KEY SAVE RECS WRTN    '     DBSAVE-REC-CNT.             
           DISPLAY 'PERIODIC PMNT RECS WRTN   '     PPMNT-REC-CNT.              
           DISPLAY 'MRGN INT REQ RECS WRTN    '     MGNINT-REC-CNT.             
                                                                                
      * WRITE NA UPDATE TRAILER RECORD                                          
           MOVE NA-UPDATE-RECS  TO  NAUP-T-REC-COUNT.                           
           WRITE NA-UPDATE-REC  FROM  NAUPDTLR-REC.                             
                                                                                
           CLOSE NA-UPDATE-FILE                                                 
                 MGN-INT-FILE                                                   
                 PAYMENT-FILE                                                   
                 REPORT-FILE-2                                                  
                 REPORT-FILE.                                                   
                                                                                
       1900-ENDJOB-ROUTINE-EXIT. EXIT.                                          
       EJECT                                                                    
                                                                                
       8000-SQL-ERROR.                                                  CAT520  
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                  CAT520  
                                    W-DB2-MESSAGE-LEN.                  CAT520  
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                        CAT520  
             UNTIL W-DB2-IDX GREATER THAN 12                            CAT520  
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES              CAT520  
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)               CAT520  
                   END-IF                                               CAT520  
           END-PERFORM.                                                 CAT520  
                                                                        CAT520  
       8000-EXIT. EXIT.                                                 CAT520  
