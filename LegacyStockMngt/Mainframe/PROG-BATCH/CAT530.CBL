000001* PDX    - CAT530   C0149951 02/08/01 16:33:02 TBTIKUO            00001000
000001* PDX    - CAT530   C0121755 02/17/99 19:47:08 TBTIKUO            00001000
       IDENTIFICATION DIVISION.                                         CAT530  
       PROGRAM-ID.    CAT530.                                           CAT530  
      ***************************************************************** CAT530  
      * THIS PROGRAM CONTAINS DB2.                                    * CAT530  
      ***************************************************************** CAT530  
      *    ACATS - ASSET ERROR REVIEW    REPORT                         CAT530  
      *                                                                 CAT530  
      *    SORT                                                         CAT530  
      *                                                                 CAT530  
      *    USE B1 TO GET CLIENT NAME                                    CAT530  
      *                                                                 CAT530  
      *    INPUT   :                                                    CAT530  
      *            1) ACATS TRANSFER TABLE   I/P - DB2 DATABASE         CAT530  
      *            2) ACATS ASSET TABLE      I/P - DB2 DATABASE         CAT530  
      *    OUTPUT  :                                                    CAT530  
      *            1) BZZZ.CAT530.RVEPI        O/P - REPORT             CAT530  
      *                                                                 CAT530  
      *---------------------------------------------------------------* CAT530  
      * 02/12/99 TK  - NEW ACATS PROGRAM                              * CAT530  
      *---------------------------------------------------------------* CAT530  
      * 11/13/00 TK  - COBO LE (TCK001)                               * CAT530  
      *---------------------------------------------------------------* CAT530  
      /                                                                 CAT530  
       ENVIRONMENT DIVISION.                                            CAT530  
       INPUT-OUTPUT SECTION.                                            CAT530  
       FILE-CONTROL.                                                    CAT530  
                                                                        CAT530  
           SELECT REPT-FILE              ASSIGN TO UT-S-REPORT          CAT530  
                                         FILE STATUS IS REPT-STAT.      CAT530  
           SELECT SORT-FILE              ASSIGN TO  UT-S-SORTWK01.      CAT530  
                                                                        CAT530  
       DATA DIVISION.                                                   CAT530  
       FILE SECTION.                                                    CAT530  
       FD  REPT-FILE                                                    CAT530  
           RECORDING MODE IS F.                                         CAT530  
                                                                        CAT530  
       01  REPT-REC.                                                    CAT530  
           03 REPT-LINE             PIC  X(133).                        CAT530  
           03 REPT-CLT              PIC S9(003) COMP-3.                 CAT530  
           03 REPT-FIL              PIC  X(008).                        CAT530  
                                                                        CAT530  
       SD  SORT-FILE.                                                   CAT530  
                                                                        CAT530  
       01  SORT-RECORD.                                                 CAT530  
           03 SORT-KEY              PIC  X(028).                        CAT530  
           03 SORT-BODY             PIC  X(372).                        CAT530  
      /                                                                 CAT530  
       WORKING-STORAGE SECTION.                                         CAT530  
       COPY PDXIDCOB.                                                   CAT530  
                                                                        CAT530  
       01  W-FIELDS.                                                    CAT530  
           05  W-ROUTINE-1               PIC  X(32) VALUE ' '.          CAT530  
           05  W-FIRST-TIME-SW           PIC  X(01) VALUE '0'.          CAT530  
               88 NOT-FIRST-TIME                    VALUE '1'.          CAT530  
           05  INFILE-STAT               PIC  X(02) VALUE '00'.         CAT530  
               88  INFILE-OKAY           VALUE '00' THRU '09', '97'.    CAT530  
               88  INFILE-END-OF-FILE    VALUE '10'.                    CAT530  
               88  INFILE-DUPE-REC       VALUE '22'.                    CAT530  
               88  INFILE-NOTFND         VALUE '23'.                    CAT530  
               88  INFILE-EMPTY          VALUE '35'.                    CAT530  
           05  INFILE-DATE-SW            PIC  X(01) VALUE '0'.          CAT530  
               88 INFILE-DATE-FOUND                 VALUE '1'.          CAT530  
           05  END-OF-INFILE-SW          PIC  X(01) VALUE '0'.          CAT530  
               88 END-OF-INFILE                     VALUE '1'.          CAT530  
           05  END-OF-SORT-SW            PIC  X(01) VALUE '0'.          CAT530  
               88 END-OF-SORT                       VALUE '1'.          CAT530  
           05  REPT-STAT                 PIC  X(02) VALUE '00'.         CAT530  
               88 REPT-OKAY                         VALUE '00'.         CAT530  
           05  W-INFILE-CNT              PIC  9(11) VALUE 0.            CAT530  
           05  W-DETAIL-CNT              PIC  9(11) VALUE 0.            CAT530  
           05  W-RELEASE-CNT             PIC  9(11) VALUE 0.            CAT530  
           05  W-RETURN-CNT              PIC  9(11) VALUE 0.            CAT530  
           05  W-PAGE-CNT                PIC  9(11) VALUE 0.            CAT530  
           05  W-LINE-CNT                PIC  9(11) VALUE 60.           CAT530  
           05  W-LOAD-CNT                PIC  9(11) VALUE 60.           CAT530  
           05  DUMP-SW                   PIC  X(01) VALUE 'D'.          CAT530  
TCK001*    05  ABEND-CD                  PIC  9(09) COMP SYNC VALUE 0.  CAT530  
TCK001     05  ABEND-CD                  PIC S9(04) COMP SYNC VALUE 0.  CAT530  
           05  LD-PROC-DATE.                                            CAT530  
               10 LD-PROC-DATE-MM        PIC  X(02).                    CAT530  
               10 LD-PROC-DATE-DD        PIC  X(02).                    CAT530  
               10 LD-PROC-DATE-YY        PIC  X(02).                    CAT530  
           05  W-PROC-DATE.                                             CAT530  
               10 W-PROC-DATE-CC         PIC  X(02).                    CAT530  
               10 W-PROC-DATE-YY         PIC  X(02).                    CAT530  
               10 W-PROC-DATE-MM         PIC  X(02).                    CAT530  
               10 W-PROC-DATE-DD         PIC  X(02).                    CAT530  
           05  W-PROC-DATE-N REDEFINES                                  CAT530  
               W-PROC-DATE               PIC  9(008).                   CAT530  
           05  W-SYS-DATE                PIC  9(006) VALUE 0.           CAT530  
           05  FILLER  REDEFINES                                        CAT530  
               W-SYS-DATE.                                              CAT530  
               10  W-SYS-YY              PIC  X(002).                   CAT530  
               10  W-SYS-MM              PIC  X(002).                   CAT530  
               10  W-SYS-DD              PIC  X(002).                   CAT530  
           05  W-SYS-TIME                PIC  9(008) VALUE 0.           CAT530  
           05  FILLER  REDEFINES                                        CAT530  
               W-SYS-TIME.                                              CAT530  
               10  W-SYS-HH              PIC  X(002).                   CAT530  
               10  W-SYS-MN              PIC  X(002).                   CAT530  
               10  W-SYS-SS              PIC  X(002).                   CAT530  
               10  W-SYS-MS              PIC  X(002).                   CAT530  
           05  W-REPT-CLT                PIC  9(03) VALUE 0.            CAT530  
           05  W-REPT-LINE               PIC  X(133).                   CAT530  
           05  W-CLT-CNT                 PIC  9(11) VALUE 0.            CAT530  
       01  W-PREV-AREA.                                                 CAT530  
           05  W-PREV-CLIENT-NBR         PIC X(0004).                   CAT530  
           05  W-PREV-CONTROL-NBR        PIC X(0014).                   CAT530  
           05  W-PREV-RCV-NBR            PIC X(0004).                   CAT530  
           05  W-PREV-RCV-ACCT           PIC X(0020).                   CAT530  
                                                                        CAT530  
       01  W-FETCH-AREA.                                                CAT530  
           05  WF-CLIENT-NBR          PIC X(4).                         CAT530  
           05  WF-ACAT-CONTROL-NBR    PIC X(14).                        CAT530  
           05  WF-SBMTG-PRTCP-NBR     PIC X(4).                         CAT530  
           05  WF-DLVR-NBR            PIC X(4).                         CAT530  
           05  WF-ACCT-DLVR-NBR       PIC X(20).                        CAT530  
           05  WF-RCV-NBR             PIC X(4).                         CAT530  
           05  WF-ACCT-RCV-NBR        PIC X(20).                        CAT530  
           05  WF-TRNFR-TYPE-CD       PIC X(3).                         CAT530  
           05  WF-TRANS-TYPE-CD       PIC X(1).                         CAT530  
           05  WF-PRCS-DT             PIC X(10).                        CAT530  
           05  WF-STTS-CD             PIC X(3).                         CAT530  
           05  WF-NSCC-PEND-CD        PIC X(1).                         CAT530  
           05  WF-TRANS-RFRN-ID-CD    PIC X(20).                        CAT530  
           05  WF-DSTBN-SIDE-CD       PIC X(1).                         CAT530  
                                                                        CAT530  
       01  W-CURRENT-FIELDS.                                            CAT530  
           05  W-CURR-CLIENT             PIC X(004).                    CAT530  
           05  W-CURR-CLIENT-N REDEFINES                                CAT530  
               W-CURR-CLIENT             PIC 9(004).                    CAT530  
           05  W-CURR-BROKER             PIC X(004).                    CAT530  
           05  W-CURR-STREAM             PIC X(001).                    CAT530  
           05  W-CURR-CTL-NBR            PIC X(014).                    CAT530  
           05  W-CURR-SEQ-NBR            PIC S9(4) USAGE COMP.          CAT530  
           05  W-CURR-ISIN-CNTRY-CD      PIC X(2).                      CAT530  
           05  W-CURR-ISIN-SEC-ISSUE-CD  PIC X(9).                      CAT530  
           05  W-CURR-ISIN-SEC-CDG-CD    PIC X(1).                      CAT530  
           05  W-CURR-STTLM-LCTN-CD      PIC X(2).                      CAT530  
           05  W-CURR-CSH-MGN-SHRT-CD    PIC X(1).                      CAT530  
      /                                                                 CAT530  
       01  FILLER                        PIC X(008) VALUE 'W-SORT'.     CAT530  
                                                                        CAT530  
       01  W-SORT-RECORD.                                               CAT530  
        03  W-SORT-REC.                                                 CAT530  
         05  W-SORT-KEY.                                                CAT530  
           10  W-SORT-CLIENT-NBR               PIC X(0004).             CAT530  
           10  W-SORT-CLIENT-NBR-N REDEFINES                            CAT530  
               W-SORT-CLIENT-NBR               PIC 9(0004).             CAT530  
           10  W-SORT-ACAT-CONTROL-NBR         PIC X(0014).             CAT530  
           10  W-SORT-ISIN-SEC-ISSUE-CD        PIC X(0009).             CAT530  
           10  W-SORT-CSH-MGN-SHRT-CD          PIC X(0001).             CAT530  
         05  W-SORT-DATA.                                               CAT530  
           10  W-SORT-PSTN-CD                  PIC X(0001).             CAT530  
               88  W-SORT-LONG                 VALUE 'L'.               CAT530  
               88  W-SORT-SHORT                VALUE 'S'.               CAT530  
           10  W-SORT-QTY                      PIC 9(12)V9(5).          CAT530  
           10  W-SORT-AMT                      PIC 9(12)V9(5).          CAT530  
           10  W-SORT-ASSET-PRC-CTGY-CD        PIC X(0004).             CAT530  
           10  W-SORT-STTLM-LCTN-CD            PIC X(0002).             CAT530  
           10  W-SORT-STTLM-RSN-CD             PIC X(0004).             CAT530  
           10  W-SORT-RCV-NBR                  PIC X(0004).             CAT530  
           10  W-SORT-ASSET-DESC-TXT.                                   CAT530  
               15  W-SORT-DESC1                PIC X(0030).             CAT530  
               15  W-SORT-DESC2                PIC X(0030).             CAT530  
               15  W-SORT-DESC3                PIC X(0030).             CAT530  
               15  W-SORT-DESC4                PIC X(0030).             CAT530  
               15  W-SORT-DESC5                PIC X(0020).             CAT530  
           10  W-SORT-SYS-RJCT-RSN-CD          PIC X(0002).                     
           10  FILLER                          PIC X(0181).             CAT530  
                                                                        CAT530  
      /                                                                 CAT530  
       01  FILLER                        PIC X(008) VALUE 'B1-TABLE'.   CAT530  
       01  B1-TABLE-AREA.                                               CAT530  
           03  B1-TABLE OCCURS 500 TIMES.                               CAT530  
               05  B1-CLT-NBR               PIC 9(04).                  CAT530  
               05  B1-CLT-NAME              PIC X(30).                  CAT530  
               05  B1-BKR-CLR-NO            PIC X(04).                  CAT530  
               05  B1-STREAM                PIC X(01).                  CAT530  
               05  B1-STATUS                PIC X(01).                  CAT530  
               05  B1-ACAT-STATUS           PIC X(01).                  CAT530  
               05  B1-PRINT                 PIC X(01).                  CAT530  
       01  B1-WORK-FIELEDS.                                             CAT530  
           03  B1-TBL-CNT                   PIC 9(03) VALUE 0.          CAT530  
           03  B1-SUB                       PIC 9(03) VALUE 0.          CAT530  
           03  B1-ACTIVE-CNT                PIC 9(03) VALUE 0.          CAT530  
           03  B1-PRT-SUB                   PIC 9(04) VALUE 0.          CAT530  
      /                                                                 CAT530  
      ******************************************************************CAT530  
      * B1 HEADER                                                      *CAT530  
      ******************************************************************CAT530  
       01  FILLER                        PIC X(08) VALUE 'BHINFO  '.    CAT530  
           COPY BHINFO.                                                 CAT530  
      /                                                                 CAT530  
      ******************************************************************CAT530  
      * B1 ACAT SECTION                                                *CAT530  
      ******************************************************************CAT530  
       01  FILLER                        PIC X(08) VALUE 'BHACAT  '.    CAT530  
           COPY BHACAT.                                                 CAT530  
      /                                                                 CAT530  
      ******************************************************************CAT530  
      * B1 BTS2 SECTION - OLD ACATS B1                                 *CAT530  
      ******************************************************************CAT530  
       01  FILLER                        PIC X(08) VALUE 'BHBTS2  '.    CAT530  
           COPY BHBTS2.                                                 CAT530  
      /                                                                 CAT530  
      ******************************************************************CAT530  
      * BPDATE COMMAREA                                                *CAT530  
      ******************************************************************CAT530  
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.   CAT530  
           COPY BPDATESC.                                               CAT530  
      /                                                                 CAT530  
      ******************************************************************CAT530  
      * TRANSFER ACTIVE TABLE                                          *CAT530  
      ******************************************************************CAT530  
       01  FILLER                        PIC X(008) VALUE 'VTRNFR  '.   CAT530  
           EXEC SQL INCLUDE VTRNFR       END-EXEC.                      CAT530  
                                                                        CAT530  
      ******************************************************************CAT530  
      * ASSET  ACTIVE   TABLE                                          *CAT530  
      ******************************************************************CAT530  
       01  FILLER                        PIC X(008) VALUE 'VASSET  '.   CAT530  
           EXEC SQL INCLUDE VASSET       END-EXEC.                      CAT530  
                                                                        CAT530  
      ******************************************************************CAT530  
      * OPTION  ACTIVE  TABLE                                          *CAT530  
      ******************************************************************CAT530  
       01  FILLER                        PIC X(008) VALUE 'VOPTN   '.   CAT530  
           EXEC SQL INCLUDE VOPTN        END-EXEC.                      CAT530  
                                                                        CAT530  
      ******************************************************************CAT530  
      * DB2 COMMAREA                                                   *CAT530  
      ******************************************************************CAT530  
       01  FILLER                        PIC X(008) VALUE 'SQLCA   '.   CAT530  
           EXEC SQL INCLUDE SQLCA        END-EXEC.                      CAT530  
                                                                        CAT530  
      ******************************************************************CAT530  
      * DB2 ERROR MESSAGE AREA                                         *CAT530  
      ******************************************************************CAT530  
       01  DSNTIAR                       PIC X(008) VALUE 'DSNTIAR'.    CAT530  
       01  W-DB2-MESSAGE-AREA.                                          CAT530  
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.    CAT530  
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES     CAT530  
                   INDEXED BY W-DB2-IDX.                                CAT530  
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.     CAT530  
                                                                        CAT530  
       01  W-DB2-WORKAREA.                                              CAT530  
           05  ROLLBACK-SQLCA            PIC  X(122).                   CAT530  
           05  ROLLBACK-RETURN           PIC S9(009) COMP.              CAT530  
               88  ROLLBACK-OK                VALUE +0.                 CAT530  
               88  ROLLBACK-AB                VALUE -999 THRU -1        CAT530  
                                                    +1   THRU +999.     CAT530  
           05  COMMIT-SQLCA              PIC  X(122).                   CAT530  
           05  COMMIT-RETURN             PIC S9(009) COMP.              CAT530  
               88  COMMIT-OK                  VALUE +0.                 CAT530  
               88  COMMIT-AB                  VALUE -999 THRU -1        CAT530  
                                                    +1   THRU +999.     CAT530  
           05  W-COMMIT-CTR              PIC  9(009) COMP-3             CAT530  
                                              VALUE 0.                  CAT530  
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(011) VALUE 0.           CAT530  
           05  W-DB2-TABLE-NAME          PIC  X(008).                   CAT530  
           05  W-DB2-ACTION              PIC  X(008).                   CAT530  
           05  W-DB2-SQLCODE             PIC ---9.                      CAT530  
           05  W-TFR-SQLCODE             PIC S9(9) COMP-4.              CAT530  
                                                                        CAT530  
       01  FILLER                        PIC  X(008) VALUE 'TIMESTMP'.  CAT530  
       01  W-CURRENT-TIMESTAMP           PIC  X(026).                   CAT530  
      /                                                                 CAT530  
      ******************************************************************CAT530  
      * DECLARE CURSOR FOR TRANSFER        TABLE                       *CAT530  
      ******************************************************************CAT530  
       01  FILLER                        PIC X(008) VALUE 'TI_CSR '.    CAT530  
           EXEC SQL                                                     CAT530  
                DECLARE TI_CSR   CURSOR WITH HOLD FOR                   CAT530  
                SELECT                                                  CAT530  
                    CLIENT_NBR                                          CAT530  
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
                FROM    VTRNFR                                          CAT530  
                WHERE   CLIENT_NBR  = :W-CURR-CLIENT       AND          CAT530  
                        DSTBN_SIDE_CD = 'D'                AND                  
                        STTS_CD     = '220'                             CAT530  
                ORDER BY CLIENT_NBR                                     CAT530  
                        ,ACAT_CONTROL_NBR                               CAT530  
                        ,BRANCH_CD                                              
                        ,ACCT_CD                                                
           END-EXEC.                                                    CAT530  
      /                                                                         
      ******************************************************************CAT530  
      * DECLARE CURSOR FOR ACTIVE ASSET    TABLE                       *CAT530  
      ******************************************************************CAT530  
       01  FILLER                        PIC X(008) VALUE 'AT_CSR '.    CAT530  
           EXEC SQL                                                     CAT530  
                DECLARE AT_CSR   CURSOR WITH HOLD FOR                   CAT530  
                SELECT                                                  CAT530  
                     CLIENT_NBR                                                 
                   , ACAT_CONTROL_NBR                                           
                   , ASSET_SEQ_NBR                                              
                   , CONTROL_NBR_STS_CD                                         
                   , DLVR_NBR_STTS_CD                                           
                   , RCV_NBR_STTS_CD                                            
                   , SBMTG_PRTCP_NBR                                            
                   , SBMT_PRT_NR_STS_CD                                         
                   , AST_SEQ_NBR_STS_CD                                         
                   , SYS_ACT_CD                                                 
                   , SYS_RJCT_RSN_CD                                            
                   , TRANS_TYPE_CD                                              
                   , TRANS_TYPE_STTS_CD                                         
                   , PHSCL_SEQ_NBR                                              
                   , PHSCL_SEQ_STTS_CD                                          
                   , LGCL_SEQ_NBR                                               
                   , LGCL_SEQ_NR_STS_CD                                         
                   , ASSET_PRC_CTGY_CD                                          
                   , AST_PRC_CTG_STS_CD                                         
                   , STTLM_LCTN_CD                                              
                   , STTLM_LCTN_STTS_CD                                         
                   , STTLM_RSN_CD                                               
                   , STTLM_RSN_STTS_CD                                          
                   , ISIN_CNTRY_CD                                              
                   , ISIN_CNTRY_STTS_CD                                         
                   , ISIN_SEC_ISSUE_CD                                          
                   , ISIN_SEC_IS_STS_CD                                         
                   , ISIN_SEC_CDG_CD                                            
                   , ISIN_SEC_CD_STS_CD                                         
                   , ASSET_DESC_TXT                                             
                   , ASSET_DESC_STTS_CD                                         
                   , ASSET_RQST_QTY_CD                                          
                   , ASSET_RQST_STS_CD                                          
                   , AST_RQST_TRANS_CD                                          
                   , AST_RQ_TRAN_STS_CD                                         
                   , ASSET_QTY                                                  
                   , ASSET_QTY_STTS_CD                                          
                   , ASSET_PCT                                                  
                   , ASSET_PCT_STTS_CD                                          
                   , PSTN_CD                                                    
                   , PSTN_CD_STTS_CD                                            
                   , ISO_CRNCY_CD                                               
                   , ISO_CRNCY_STTS_CD                                          
                   , ASSET_AMT                                                  
                   , ASSET_AMT_STTS_CD                                          
                   , BEARER_BOND_CD                                             
                   , BEARER_BND_STTS_CD                                         
                   , CSH_MGN_SHRT_CD                                            
                   , CSH_MRG_SHT_STS_CD                                         
                   , WHI_CD                                                     
                   , WHI_STTS_CD                                                
                   , TRNFR_TYPE_RSN_CD                                          
                   , TRN_TYP_RSN_STS_CD                                         
                   , MBS_SERIAL_NBR                                             
                   , MBS_SERIAL_STTS_CD                                         
                   , ASSET_CMNT_TXT                                             
                   , ASSET_CMNT_STTS_CD                                         
                   , NSCC_ACK_IND                                               
                   , NSCC_PEND_CD                                               
                   , FAIL_SENT_CAGE_IND                                         
                   , FAIL_OPEN_CAGE_IND                                         
                   , NSCC_NON_ADP_IND                                           
                   , TRANS_RFRN_ID_CD                                           
                   , TRANS_RFRN_STTS_CD                                         
                   , OPTN_CTGY_CD                                               
                   , OPTN_CTGY_STTS_CD                                          
                   , RCRD_LNGTH_STTS_CD                                         
                   , RCRD_STTS_CD                                               
                   , ISIN_SEC_EXCPT_IND                                         
                   , CRT_TMSTP                                                  
                   , UPDT_TMSTP                                                 
                   , CICS_TERM_ID_CD                                            
                   , PRGM_NM                                                    
                   , SECURITY_ADP_NBR                                           
                   , RCL_SENT_NSCC_IND                                          
                   , FRV_SENT_NSCC_IND                                          
                   , TRNFR_TYPE_CD                                              
                   , TRNFR_TYPE_STTS_CD                                         
                FROM    VASSET                                          CAT530  
                WHERE   CLIENT_NBR    = :W-CURR-CLIENT         AND      CAT530  
                        ACAT_CONTROL_NBR = :W-CURR-CTL-NBR     AND              
                        SYS_RJCT_RSN_CD > '  '                          CAT530  
                ORDER BY CLIENT_NBR                                     CAT530  
                        ,ACAT_CONTROL_NBR                               CAT530  
                        ,ISIN_SEC_ISSUE_CD                              CAT530  
                        ,ASSET_SEQ_NBR                                          
           END-EXEC.                                                    CAT530  
      /                                                                 CAT530  
       01  W-HDR1-REC.                                                  CAT530  
           05  FILLER                       PIC  X(01) VALUE '1'.       CAT530  
           05  FILLER                       PIC  X(08) VALUE            CAT530  
               'CAT530 -'.                                              CAT530  
           05  W-HDR1-CLT                   PIC  Z999.                  CAT530  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT530  
           05  W-HDR1-CLT-NAME              PIC  X(30) VALUE ' '.       CAT530  
           05  FILLER                       PIC  X(04) VALUE ' '.       CAT530  
           05  FILLER                       PIC  X(42) VALUE            CAT530  
               'AUTOMATED CUSTOMER ACCOUNT TRANSFER SYSTEM'.            CAT530  
           05  FILLER                       PIC  X(12) VALUE ' '.       CAT530  
           05  FILLER                       PIC  X(13) VALUE            CAT530  
               'PROCESS DATE '.                                         CAT530  
           05  W-HDR1-MM                    PIC  X(02).                 CAT530  
           05  W-HDR1-S1                    PIC  X(01) VALUE '/'.       CAT530  
           05  W-HDR1-DD                    PIC  X(02).                 CAT530  
           05  W-HDR1-S2                    PIC  X(01) VALUE '/'.       CAT530  
           05  W-HDR1-YY                    PIC  X(02).                 CAT530  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT530  
           05  FILLER                       PIC  X(05) VALUE            CAT530  
               'PAGE '.                                                 CAT530  
           05  W-HDR1-PAGE                  PIC  ZZZ9.                  CAT530  
                                                                        CAT530  
       01  W-HDR2-REC.                                                  CAT530  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT530  
           05  FILLER                       PIC  X(08) VALUE            CAT530  
      *****    'BROKER  '.                                              CAT530  
               '        '.                                              CAT530  
           05  W-HDR2-BKR                   PIC  X(04).                 CAT530  
           05  FILLER                       PIC  X(45) VALUE ' '.       CAT530  
           05  FILLER                       PIC  X(42) VALUE            CAT530  
               'ASSET REVIEW ERROR REPORT'.                             CAT530  
           05  FILLER                       PIC  X(06) VALUE ' '.       CAT530  
           05  FILLER                       PIC  X(09) VALUE            CAT530  
               'RUN TIME '.                                             CAT530  
           05  W-HDR2-MM                    PIC  X(02).                 CAT530  
           05  W-HDR2-S1                    PIC  X(01) VALUE '/'.       CAT530  
           05  W-HDR2-DD                    PIC  X(02).                 CAT530  
           05  W-HDR2-S2                    PIC  X(01) VALUE '/'.       CAT530  
           05  W-HDR2-YY                    PIC  X(02).                 CAT530  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT530  
           05  W-HDR2-HH                    PIC  X(02).                 CAT530  
           05  W-HDR2-CC                    PIC  X(01) VALUE ':'.       CAT530  
           05  W-HDR2-MN                    PIC  X(02).                 CAT530  
           05  FILLER                       PIC  X(04) VALUE ' '.       CAT530  
                                                                        CAT530  
       01  W-HDR3-REC.                                                  CAT530  
           05  FILLER                       PIC  X(01) VALUE '0'.       CAT530  
           05  FILLER                       PIC  X(18) VALUE            CAT530  
               'ACCOUNT NO. '.                                          CAT530  
           05  W-HDR3-BR                    PIC  X(003) VALUE ' '.      CAT530  
           05  FILLER                       PIC  X(001) VALUE '-'.      CAT530  
           05  W-HDR3-ACCT                  PIC  X(005) VALUE ' '.      CAT530  
           05  FILLER                       PIC  X(105) VALUE ' '.      CAT530  
                                                                        CAT530  
       01  W-HDR6-REC.                                                  CAT530  
           05  FILLER                       PIC  X(01) VALUE '0'.       CAT530  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT530  
           05  FILLER                       PIC  X(14) VALUE            CAT530  
               'CONTROL NO    '.                                        CAT530  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT530  
           05  FILLER                       PIC  X(07) VALUE            CAT530  
               'RCV-BRK'.                                               CAT530  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT530  
           05  FILLER                       PIC  X(12) VALUE            CAT530  
               '   CUSIP'.                                              CAT530  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT530  
           05  FILLER                       PIC  X(30) VALUE            CAT530  
               '         DESCRIPTION'.                                  CAT530  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT530  
           05  FILLER                       PIC  X(03) VALUE            CAT530  
               'L/S'.                                                   CAT530  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT530  
           05  FILLER                       PIC  X(20) VALUE            CAT530  
               '       QUANTITY'.                                       CAT530  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT530  
           05  FILLER                       PIC  X(20) VALUE            CAT530  
               '           AMOUNT'.                                     CAT530  
           05  FILLER                       PIC  X(18) VALUE ' '.       CAT530  
                                                                        CAT530  
       01  W-DTL1-REC.                                                  CAT530  
           05  FILLER                       PIC  X(01) VALUE '0'.       CAT530  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT530  
           05  W-DTL1-CONTROL-NBR           PIC  X(14) VALUE ' '.       CAT530  
           05  FILLER                       PIC  X(03) VALUE ' '.       CAT530  
           05  W-DTL1-RCV-NBR               PIC  X(04).                 CAT530  
           05  FILLER                       PIC  X(04) VALUE ' '.       CAT530  
           05  W-DTL1-CUSIP                 PIC  X(12).                 CAT530  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT530  
           05  W-DTL1-DESC1                 PIC  X(30).                 CAT530  
           05  FILLER                       PIC  X(03) VALUE ' '.       CAT530  
           05  W-DTL1-LONG-SHORT            PIC  X(01) VALUE ' '.       CAT530  
           05  FILLER                       PIC  X(03) VALUE ' '.       CAT530  
           05  W-DTL1-QTY                   PIC  ZZZ,ZZZ,ZZZ,ZZZ.9999.  CAT530  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT530  
           05  W-DTL1-AMT                   PIC  ZZZZZ,ZZZ,ZZZ,ZZZ.99.  CAT530  
           05  FILLER                       PIC  X(18) VALUE ' '.       CAT530  
                                                                        CAT530  
       01  W-DTL2-REC.                                                  CAT530  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT530  
           05  FILLER                       PIC  X(50) VALUE ' '.       CAT530  
           05  W-DTL2-DESC2                 PIC  X(30).                 CAT530  
           05  FILLER                       PIC  X(52) VALUE ' '.       CAT530  
                                                                                
       01  W-DTL3-REC.                                                  CAT530  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT530  
           05  FILLER        PIC X(22)  VALUE                                   
              '**********************'.                                         
           05  FILLER        PIC X(27)  VALUE                                   
              ' SYSTEM REJECT REASON ===> '.                                    
           05  W-DTL3-MSG    PIC X(60).                                         
           05  FILLER        PIC X(22)  VALUE                                   
              '**********************'.                                         
                                                                        CAT530  
       01  W-DTLX-REC.                                                  CAT530  
           05  FILLER                       PIC  X(01) VALUE '0'.       CAT530  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT530  
           05  FILLER                       PIC  X(40) VALUE            CAT530  
           'NO ASSETS REVIEW ERROR IN THIS CYCLE'.                      CAT530  
           05  FILLER                       PIC  X(90) VALUE ' '.       CAT530  
                                                                        CAT530  
       01  W-SYS-RJCT-RSN-CD-AREA.                                              
           05  W-SYS-RJCT-RSN-TABLE-ENTRY.                                      
               10 W-RSN-01               PIC X(52)  VALUE                       
                 '01 - INVALID FIELD'.                                          
               10 W-RSN-02               PIC X(52)  VALUE                       
                 '02 - MISSED CUTOFF'.                                          
               10 W-RSN-03               PIC X(52)  VALUE                       
                 '03 - ASSOCIATED RECORD NOT PRESENT'.                          
               10 W-RSN-04               PIC X(52)  VALUE                       
                 '04 - PHYSICAL RECORDS OUT OF SEQUENCE'.                       
               10 W-RSN-05               PIC X(52)  VALUE                       
                 '05 - INVALID PHYSICAL SEQUENCE NUMBER'.                       
               10 W-RSN-06               PIC X(52)  VALUE                       
                 '06 - LOGICAL RECORDS OUT OF SEQUENCE'.                        
               10 W-RSN-07               PIC X(52)  VALUE                       
                 '07 - INVALID LOGICAL SEQUENCE NUMBER'.                        
               10 W-RSN-08               PIC X(52)  VALUE                       
                 '08 - INVALID LENGTH RECORD'.                                  
               10 W-RSN-09               PIC X(52)  VALUE                       
                 '09 - INVALID RECORD CONTENTS'.                                
               10 W-RSN-10               PIC X(52)  VALUE                       
                 '10 - INVALID ADD TRANSACTION - RECORD EXIST'.                 
               10 W-RSN-11               PIC X(52)  VALUE                       
                 '11 - INVALID CHG TRANSACTION - RECORD DOES NOT EXIST'.        
               10 W-RSN-12               PIC X(52)  VALUE                       
                 '12 - INVALID DEL TRANSACTION - RECORD DOES NOT EXIST'.        
               10 W-RSN-13               PIC X(52)  VALUE                       
                 '13 - REQUESTED ACTION INVALID DUE TO TRANSFER STATUS'.        
               10 W-RSN-14               PIC X(52)  VALUE                       
                 '14 - TRANSACTION INVALID FOR CONTRA PARTICIPANT'.             
               10 W-RSN-15               PIC X(52)  VALUE                       
                 '15 - TRANSACTION INVALID FOR SUBMITTING PARTICIPANT'.         
               10 W-RSN-16               PIC X(52)  VALUE                       
                 '16 - INVALID PARTICIPANT'.                                    
           05  W-RJCT-RSN-TABLE REDEFINES  W-SYS-RJCT-RSN-TABLE-ENTRY.          
               10  W-RJCT-MSG           PIC X(52) OCCURS 16 TIMES.              
       01  W-RJCT-SUB                    PIC 9(02)  VALUE 0.                    
       01  FILLER                        PIC X(008) VALUE 'END-O-WS'.   CAT530  
      /                                                                 CAT530  
TCK001 COPY STUBCPY.                                                            
      /                                                                 CAT530  
      ***************************************************************** CAT530  
      *    LINKAGE SECTION                                            * CAT530  
      ***************************************************************** CAT530  
      *LINKAGE SECTION.                                                 CAT530  
      *01  L-JCL-PARMS.                                                 CAT530  
      *    05  PARMLENGTH                PIC S9(004) COMP SYNC.         CAT530  
      *    05  L-STREAM                  PIC  X(001).                   CAT530  
      *    05  L-BYP-DATECHK-SW          PIC  X(001).                   CAT530  
      *        88  L-BYP-DATECHK                     VALUE '1'.         CAT530  
      *    05  L-BYP-FILECHK-SW          PIC  X(001).                   CAT530  
      *        88  L-BYP-FILECHK                     VALUE '1'.         CAT530  
      *                                                                 CAT530  
      *PROCEDURE DIVISION USING L-JCL-PARMS.                            CAT530  
      *                         ===========                             CAT530  
       PROCEDURE DIVISION.                                              CAT530  
       0000-MAIN SECTION.                                               CAT530  
                                                                        CAT530  
           DISPLAY 'CAT530 - ACATS ASSET ERROR REPORT'.                 CAT530  
           DISPLAY ' '.                                                 CAT530  
           COPY MSGCOBO.                                                CAT530  
           DISPLAY ' '.                                                 CAT530  
                                                                        CAT530  
           PERFORM 1000-INIT          THRU 1000-EXIT.                   CAT530  
                                                                        CAT530  
           SORT SORT-FILE ON ASCENDING SORT-KEY                         CAT530  
                INPUT  PROCEDURE IS 2000-SORT-INPUT  THRU 2000-EXIT     CAT530  
                OUTPUT PROCEDURE IS 5000-SORT-OUTPUT THRU 5000-EXIT.    CAT530  
                                                                        CAT530  
           PERFORM 9000-CLOSE-ROUTINE THRU 9000-EXIT.                   CAT530  
                                                                        CAT530  
       0000-FINI.                                                       CAT530  
                                                                        CAT530  
           GOBACK.                                                      CAT530  
      /                                                                 CAT530  
       1000-INIT SECTION.                                               CAT530  
                                                                        CAT530  
TCK001***  CALL 'SPIEEXIT'.                                             CAT530  
                                                                        CAT530  
      *    DISPLAY 'CAT530: L-STREAM         = '                        CAT530  
      *                     L-STREAM.                                   CAT530  
      *    DISPLAY 'CAT530: L-BYP-DATECHK-SW = '                        CAT530  
      *                     L-BYP-DATECHK-SW.                           CAT530  
      *    DISPLAY 'CAT530: L-BYP-FILECHK-SW = '                        CAT530  
      *                     L-BYP-FILECHK-SW.                           CAT530  
      *    IF  L-BYP-DATECHK                                            CAT530  
      *        DISPLAY 'CAT530: DATE CHECK WILL BE BYPASSED'            CAT530  
      *    ELSE                                                         CAT530  
      *        DISPLAY 'CAT530: DATE CHECK WILL BE PERFORMED'           CAT530  
      *    END-IF.                                                      CAT530  
      *    IF  L-BYP-FILECHK                                            CAT530  
      *        DISPLAY 'CAT530: FILE CHECK WILL BE BYPASSED'            CAT530  
      *    ELSE                                                         CAT530  
      *        DISPLAY 'CAT530: FILE CHECK WILL BE PERFORMED'           CAT530  
      *    END-IF.                                                      CAT530  
                                                                        CAT530  
           MOVE 'CAT530'                 TO BPDATES-CALLING-PGM.        CAT530  
           SET  LNKDATZ-REQUEST          TO TRUE.                       CAT530  
TCK001*    CALL 'BPDATES' USING BPDATES-PARAMETERS.                     CAT530  
TCK001     CALL  BPDATES  USING BPDATES-PARAMETERS.                     CAT530  
           MOVE BPD-PROC-DATE            TO W-PROC-DATE.                CAT530  
           MOVE BPD-PROC-DATE(3:2)       TO LD-PROC-DATE-YY.            CAT530  
           MOVE BPD-PROC-DATE(5:2)       TO LD-PROC-DATE-MM.            CAT530  
           MOVE BPD-PROC-DATE(7:2)       TO LD-PROC-DATE-DD.            CAT530  
                                                                        CAT530  
           DISPLAY 'CAT530: PROC-DATE= ' BPD-PROC-DATE                  CAT530  
                      '  LD-PROC-DATE= ' LD-PROC-DATE.                  CAT530  
                                                                        CAT530  
           ACCEPT W-SYS-DATE             FROM DATE.                     CAT530  
           ACCEPT W-SYS-TIME             FROM TIME.                     CAT530  
                                                                        CAT530  
           EXEC SQL                                                     CAT530  
               SET :W-CURRENT-TIMESTAMP = CURRENT TIMESTAMP             CAT530  
           END-EXEC                                                     CAT530  
                                                                        CAT530  
           IF  SQLCODE = +0                                             CAT530  
               DISPLAY ' '                                              CAT530  
               DISPLAY 'CAT530: W-CURRENT-TIMESTAMP = '                 CAT530  
                                                    W-CURRENT-TIMESTAMP CAT530  
               DISPLAY ' '                                              CAT530  
           ELSE                                                         CAT530  
               DISPLAY 'CAT530: W-CURRENT-TIMESTAMP NOT SET'            CAT530  
               MOVE SQLCODE      TO W-DB2-SQLCODE                       CAT530  
               DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                       CAT530  
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   CAT530  
           END-IF.                                                      CAT530  
                                                                        CAT530  
           MOVE '000'                  TO BH-BROKER-NUMBER              CAT530  
                                                                        CAT530  
           OPEN OUTPUT REPT-FILE.                                       CAT530  
           DISPLAY 'CAT530: REPORT   OPENED FOR OUTPUT '                CAT530  
                       ' FILE STATUS = ' REPT-STAT.                     CAT530  
                                                                        CAT530  
           IF  REPT-OKAY                                                CAT530  
               CONTINUE                                                 CAT530  
           ELSE                                                         CAT530  
               MOVE 3003                  TO  ABEND-CD                  CAT530  
               DISPLAY ' '                                              CAT530  
               DISPLAY 'CAT530: U3003 - DD REPORT OPEN ERR, '           CAT530  
                       ' FILE STATUS = ' REPT-STAT                      CAT530  
TCK001*        CALL 'ABEND' USING ABEND-CD DUMP-SW                      CAT530  
TCK001         CALL  ABEND  USING ABEND-CD DUMP-SW                      CAT530  
           END-IF.                                                      CAT530  
                                                                        CAT530  
           PERFORM 1500-LOAD-B1 THRU 1500-EXIT.                         CAT530  
                                                                        CAT530  
           DISPLAY ' '.                                                 CAT530  
                                                                        CAT530  
       1000-EXIT. EXIT.                                                 CAT530  
      /                                                                 CAT530  
       1500-LOAD-B1 SECTION.                                            CAT530  
           DISPLAY 'CAT530: 1500-LOAD-B1'.                              CAT530  
                                                                        CAT530  
           MOVE SPACES                   TO  B1-TABLE-AREA.             CAT530  
           MOVE 0                        TO  B1-TBL-CNT.                CAT530  
                                                                        CAT530  
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500        CAT530  
                                                                        CAT530  
             MOVE  ' '                   TO  BH-BROKER-HEADER-INFO      CAT530  
                                             BH-ACAT-INFO               CAT530  
             MOVE  B1-SUB                TO  BH-BROKER-NUMBER-N         CAT530  
             MOVE  '015'                 TO  BH-LOGICAL-RECORD-CODE     CAT530  
             MOVE  '434500'              TO  BH-B2-INFO-ID              CAT530  
TCK001*      CALL  'GETB1V'            USING BH-BROKER-HEADER-INFO      CAT530  
TCK001       CALL   GETB1V             USING BH-BROKER-HEADER-INFO      CAT530  
                                             BH-ACAT-INFO               CAT530  
             ADD 1 TO B1-TBL-CNT                                        CAT530  
             IF   BH-BROKER-ACTIVE                                      CAT530  
                   MOVE  BH-BROKER-NUMBER-N                             CAT530  
                                         TO B1-CLT-NBR (B1-TBL-CNT)     CAT530  
                   MOVE  BH-BROKER-NAME                                 CAT530  
                                         TO B1-CLT-NAME (B1-TBL-CNT)    CAT530  
                   MOVE  BH-BROKER-OLD-CLEARING-HOUSE (2:4)             CAT530  
                                         TO B1-BKR-CLR-NO (B1-TBL-CNT)  CAT530  
                   MOVE  BH-BROKER-STATUS                               CAT530  
                                         TO B1-STATUS     (B1-TBL-CNT)  CAT530  
               IF  BH-ACAT-ACTIVE                                       CAT530  
                   ADD 1 TO B1-ACTIVE-CNT                               CAT530  
                   MOVE  BH-ACAT-STATUS                                 CAT530  
                                         TO B1-ACAT-STATUS(B1-TBL-CNT)  CAT530  
                       DISPLAY      ' CLT ' B1-CLT-NBR    (B1-TBL-CNT)  CAT530  
                                        ' ' B1-CLT-NAME   (B1-TBL-CNT)  CAT530  
                                    ' BKR ' B1-BKR-CLR-NO (B1-TBL-CNT)  CAT530  
   *****************************    ' STR ' B1-STREAM     (B1-TBL-CNT)  CAT530  
                                    ' STA ' B1-STATUS     (B1-TBL-CNT)  CAT530  
                                   ' ACAT ' B1-ACAT-STATUS(B1-TBL-CNT)  CAT530  
               ELSE                                                     CAT530  
                   MOVE ' '              TO B1-ACAT-STATUS(B1-TBL-CNT)  CAT530  
               END-IF                                                   CAT530  
             END-IF                                                     CAT530  
                                                                        CAT530  
           END-PERFORM.                                                 CAT530  
                                                                        CAT530  
           DISPLAY ' '.                                                 CAT530  
                                                                        CAT530  
           DISPLAY  'B1 ACTIVE COUNT = ' B1-ACTIVE-CNT.                 CAT530  
           DISPLAY ' '.                                                 CAT530  
       1500-EXIT. EXIT.                                                 CAT530  
      /                                                                 CAT530  
      ******************************************************************CAT530  
      *  GET CLIENT FOR THIS STREAM, AND FETCH TRANSFERS                CAT530  
      ******************************************************************CAT530  
       2000-SORT-INPUT SECTION.                                         CAT530  
           MOVE '2000-SORT-INPUT         ' TO W-ROUTINE-1.              CAT530  
                                                                        CAT530  
           PERFORM VARYING B1-SUB FROM 1 BY 1                           CAT530  
              UNTIL B1-SUB > 500                                        CAT530  
                                                                        CAT530  
              IF  B1-STATUS      (B1-SUB) = 'A'                         CAT530  
              AND B1-ACAT-STATUS (B1-SUB) = 'A'                         CAT530  
              AND B1-BKR-CLR-NO  (B1-SUB) > ' '                         CAT530  
                  MOVE B1-CLT-NBR    (B1-SUB) TO W-CURR-CLIENT-N        CAT530  
                  MOVE B1-BKR-CLR-NO (B1-SUB) TO W-CURR-BROKER          CAT530  
      ********    MOVE B1-STREAM     (B1-SUB) TO W-CURR-STREAM          CAT530  
                  PERFORM 2500-GETB1         THRU 2500-EXIT             CAT530  
                  PERFORM 3000-FETCH-TRANFER THRU 3000-EXIT             CAT530  
              END-IF                                                    CAT530  
                                                                        CAT530  
           END-PERFORM.                                                 CAT530  
                                                                        CAT530  
       2000-EXIT. EXIT.                                                 CAT530  
      /                                                                 CAT530  
       2500-GETB1          SECTION.                                     CAT530  
                                                                        CAT530  
           MOVE ' '                        TO BH-BROKER-HEADER-INFO     CAT530  
                                              BH-ACAT-INFO              CAT530  
                                              BH-BTS2-INFO              CAT530  
      *****                                   BH-MF-INFO                CAT530  
                                                                        CAT530  
           MOVE W-CURR-CLIENT-N            TO BH-BROKER-NUMBER-N        CAT530  
           MOVE '015'                      TO BH-LOGICAL-RECORD-CODE    CAT530  
           MOVE '434500'                   TO BH-B2-INFO-ID             CAT530  
TCK001*    CALL 'GETB1V'                USING BH-BROKER-HEADER-INFO,    CAT530  
TCK001     CALL  GETB1V                 USING BH-BROKER-HEADER-INFO,    CAT530  
                                              BH-ACAT-INFO              CAT530  
           END-CALL.                                                    CAT530  
                                                                        CAT530  
      ***  MOVE '511000'                   TO BH-B2-INFO-ID             CAT530  
      ***  CALL 'GETB1V'                USING BH-BROKER-HEADER-INFO,    CAT530  
      ***                                     BH-BTS2-INFO              CAT530  
      ***  END-CALL.                                                    CAT530  
                                                                        CAT530  
      ***  MOVE '537000'                   TO BH-B2-INFO-ID             CAT530  
      ***  CALL 'GETB1V'                USING BH-BROKER-HEADER-INFO,    CAT530  
      ***                                     BH-MF-INFO                CAT530  
      ***  END-CALL.                                                    CAT530  
                                                                        CAT530  
           DISPLAY ' '                                                  CAT530  
                   'CAT530: NEW-CLIENT = ' BH-BROKER-NUMBER             CAT530  
                                       ' ' BH-BROKER-NAME               CAT530  
                               ' BRK-NO= ' BH-BROKER-OLD-CLEARING-HOUSE.CAT530  
                                                                        CAT530  
       2500-EXIT. EXIT.                                                 CAT530  
      /                                                                 CAT530  
      ******************************************************************CAT530  
      *  IF FULL TRANSFER REQUEST, AND WE ARE THE DELIVERER,            CAT530  
      *     LOAD ASSETS                                                 CAT530  
      ******************************************************************CAT530  
       3000-FETCH-TRANFER SECTION.                                      CAT530  
           MOVE '3000-FETCH-TRANSFER        ' TO W-ROUTINE-1.           CAT530  
                                                                        CAT530  
           EXEC SQL OPEN TI_CSR END-EXEC                                CAT530  
                                                                        CAT530  
           IF SQLCODE NOT = +0                                          CAT530  
              MOVE SQLCODE      TO W-DB2-SQLCODE                        CAT530  
              MOVE SQLCODE      TO W-TFR-SQLCODE                                
              DISPLAY 'TI_CSR  CURSOR OPEN ERROR '                      CAT530  
                            'SQLCODE = ' W-DB2-SQLCODE                  CAT530  
           END-IF                                                       CAT530  
                                                                        CAT530  
           PERFORM UNTIL W-TFR-SQLCODE NOT = +0                         CAT530  
              EXEC SQL                                                  CAT530  
                   FETCH TI_CSR                                         CAT530  
               INTO                                                     CAT530  
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
              END-EXEC                                                  CAT530  
                                                                        CAT530  
              MOVE SQLCODE      TO W-DB2-SQLCODE                        CAT530  
              MOVE SQLCODE      TO W-TFR-SQLCODE                                
              EVALUATE SQLCODE                                          CAT530  
                  WHEN +0                                               CAT530  
                       ADD 1 TO W-INFILE-CNT                            CAT530  
                       MOVE ACAT-CONTROL-NBR OF DCLVTRNFR TO                    
                                                 W-CURR-CTL-NBR                 
                       DISPLAY '### FETCHED TIF = '                             
                       DISPLAY ' '  BRANCH-CD OF DCLVTRNFR,                     
                       DISPLAY ' '  ACCT-CD OF DCLVTRNFR,                       
                       DISPLAY ' ' W-CURR-CTL-NBR                               
                       PERFORM 3500-FETCH-ASSET THRU 3500-EXIT          CAT530  
                  WHEN +100                                             CAT530  
                       DISPLAY 'INP=' W-INFILE-CNT                      CAT530  
                              ' CLT=' WF-CLIENT-NBR                     CAT530  
                              ' TI_CSR  CURSOR FETCH NOT FOUND '        CAT530  
                              ' SQLCODE=' W-DB2-SQLCODE                 CAT530  
                  WHEN OTHER                                            CAT530  
                       DISPLAY 'INP=' W-INFILE-CNT                      CAT530  
                              ' CLT=' WF-CLIENT-NBR                     CAT530  
                              ' TI_CSR  CURSOR FETCH ERROR '            CAT530  
                              ' SQLCODE=' W-DB2-SQLCODE                 CAT530  
                       PERFORM  8500-SQL-ERROR THRU 8500-EXIT           CAT530  
              END-EVALUATE                                              CAT530  
           END-PERFORM.                                                 CAT530  
                                                                        CAT530  
           EXEC SQL                                                     CAT530  
                CLOSE TI_CSR                                            CAT530  
           END-EXEC                                                     CAT530  
                                                                        CAT530  
           MOVE SQLCODE         TO W-DB2-SQLCODE                        CAT530  
           MOVE SQLCODE         TO W-TFR-SQLCODE                                
                                                                        CAT530  
           IF  SQLCODE NOT = +0                                         CAT530  
               MOVE SQLCODE      TO W-DB2-SQLCODE                       CAT530  
               DISPLAY 'INP=' W-INFILE-CNT                              CAT530  
                              ' CLT=' WF-CLIENT-NBR                     CAT530  
                              ' TF_CSR CURSOR CLOSE ERROR '             CAT530  
                              ' SQLCODE=' W-DB2-SQLCODE                 CAT530  
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   CAT530  
           END-IF.                                                      CAT530  
                                                                        CAT530  
       3000-EXIT. EXIT.                                                 CAT530  
      /                                                                 CAT530  
       3500-FETCH-ASSET.                                                CAT530  
                                                                                
           MOVE '3500-FETCH-ASSET           ' TO W-ROUTINE-1.           CAT530  
                                                                        CAT530  
           EXEC SQL OPEN AT_CSR END-EXEC                                CAT530  
                                                                        CAT530  
           IF SQLCODE NOT = +0                                          CAT530  
              MOVE SQLCODE      TO W-DB2-SQLCODE                        CAT530  
              DISPLAY 'AT_CSR  CURSOR OPEN ERROR '                      CAT530  
                            'SQLCODE = ' W-DB2-SQLCODE                  CAT530  
           END-IF                                                       CAT530  
                                                                        CAT530  
           PERFORM UNTIL SQLCODE NOT = +0                               CAT530  
              EXEC SQL                                                  CAT530  
                   FETCH AT_CSR                                         CAT530  
               INTO                                                     CAT530  
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
              END-EXEC                                                          
                                                                        CAT530  
              MOVE SQLCODE      TO W-DB2-SQLCODE                        CAT530  
              EVALUATE SQLCODE                                          CAT530  
                  WHEN +0                                               CAT530  
                       ADD 1 TO W-DETAIL-CNT                            CAT530  
                       PERFORM 4000-LOAD THRU 4000-EXIT                 CAT530  
                  WHEN +100                                             CAT530  
                       DISPLAY 'INP=' W-DETAIL-CNT                      CAT530  
                              ' CLT=' WF-CLIENT-NBR                     CAT530  
                              ' AT_CSR  CURSOR FETCH NOT FOUND '        CAT530  
                              ' SQLCODE=' W-DB2-SQLCODE                 CAT530  
                  WHEN OTHER                                            CAT530  
                       DISPLAY 'INP=' W-DETAIL-CNT                      CAT530  
                              ' CLT=' WF-CLIENT-NBR                     CAT530  
                              ' AT_CSR  CURSOR FETCH ERROR '            CAT530  
                              ' SQLCODE=' W-DB2-SQLCODE                 CAT530  
                       PERFORM  8500-SQL-ERROR THRU 8500-EXIT           CAT530  
              END-EVALUATE                                              CAT530  
           END-PERFORM.                                                         
                                                                        CAT530  
           EXEC SQL                                                     CAT530  
                CLOSE AT_CSR                                            CAT530  
           END-EXEC                                                     CAT530  
                                                                        CAT530  
           IF  SQLCODE NOT = +0                                         CAT530  
               MOVE SQLCODE      TO W-DB2-SQLCODE                       CAT530  
               DISPLAY 'INP=' W-DETAIL-CNT                              CAT530  
                              ' CLT=' WF-CLIENT-NBR                     CAT530  
                              ' AT_CSR CURSOR CLOSE ERROR '             CAT530  
                              ' SQLCODE=' W-DB2-SQLCODE                 CAT530  
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   CAT530  
           END-IF.                                                      CAT530  
                                                                        CAT530  
       3500-EXIT. EXIT.                                                 CAT530  
      /                                                                 CAT530  
       4000-LOAD                SECTION.                                CAT530  
           MOVE '4000-LOAD          ' TO W-ROUTINE-1.                   CAT530  
                                                                        CAT530  
           ADD 1 TO W-LOAD-CNT.                                         CAT530  
                                                                        CAT530  
           MOVE SPACES            TO W-SORT-RECORD                      CAT530  
           MOVE CLIENT-NBR        OF DCLVASSET                          CAT530  
                                  TO W-SORT-CLIENT-NBR                  CAT530  
           MOVE ACAT-CONTROL-NBR  OF DCLVASSET                          CAT530  
                                  TO W-SORT-ACAT-CONTROL-NBR            CAT530  
           MOVE RCV-NBR           OF DCLVTRNFR                          CAT530  
                                  TO W-SORT-RCV-NBR                     CAT530  
           MOVE CSH-MGN-SHRT-CD OF DCLVASSET                            CAT530  
                                  TO W-SORT-CSH-MGN-SHRT-CD             CAT530  
                                                                        CAT530  
           MOVE STTLM-LCTN-CD     OF DCLVASSET                          CAT530  
                                  TO W-SORT-STTLM-LCTN-CD               CAT530  
           MOVE STTLM-RSN-CD      OF DCLVASSET                          CAT530  
                                  TO W-SORT-STTLM-RSN-CD                CAT530  
           MOVE PSTN-CD           OF DCLVASSET                          CAT530  
                                  TO W-SORT-PSTN-CD                     CAT530  
                                                                        CAT530  
           MOVE ASSET-AMT         OF DCLVASSET                          CAT530  
                                  TO W-SORT-AMT                         CAT530  
           MOVE ASSET-QTY         OF DCLVASSET                          CAT530  
                                  TO W-SORT-QTY                         CAT530  
           MOVE ASSET-PRC-CTGY-CD OF DCLVASSET                          CAT530  
                                  TO W-SORT-ASSET-PRC-CTGY-CD           CAT530  
           MOVE ISIN-SEC-ISSUE-CD OF DCLVASSET                          CAT530  
                                  TO W-SORT-ISIN-SEC-ISSUE-CD           CAT530  
                                                                        CAT530  
           MOVE ASSET-DESC-TXT    OF DCLVASSET                          CAT530  
                                  TO W-SORT-ASSET-DESC-TXT              CAT530  
                                                                        CAT530  
           MOVE SYS-RJCT-RSN-CD   OF DCLVASSET                                  
                                  TO W-SORT-SYS-RJCT-RSN-CD                     
                                                                                
           MOVE W-SORT-RECORD     TO SORT-RECORD.                       CAT530  
                                                                        CAT530  
           RELEASE SORT-RECORD.                                         CAT530  
           ADD  1             TO W-RELEASE-CNT.                         CAT530  
                                                                        CAT530  
       4000-EXIT.                                                       CAT530  
           EXIT.                                                        CAT530  
      /                                                                 CAT530  
       5000-SORT-OUTPUT SECTION.                                        CAT530  
                                                                        CAT530  
           DISPLAY 'CAT530: PERFORMING 5000-SORT-OUTPUT'.               CAT530  
                                                                        CAT530  
           PERFORM 5500-RETURN-SORT THRU 5500-EXIT.                     CAT530  
                                                                        CAT530  
           PERFORM UNTIL END-OF-SORT                                    CAT530  
                                                                        CAT530  
               IF  B1-PRT-SUB   < W-SORT-CLIENT-NBR-N                   CAT530  
                   PERFORM 6000-CLT-BREAK     THRU 6000-EXIT            CAT530  
               END-IF                                                   CAT530  
                                                                        CAT530  
               PERFORM 7000-WRITE-REPORT  THRU 7000-EXIT                CAT530  
               PERFORM 5500-RETURN-SORT   THRU 5500-EXIT                CAT530  
                                                                        CAT530  
           END-PERFORM.                                                 CAT530  
                                                                        CAT530  
           PERFORM 6000-CLT-BREAK     THRU 6000-EXIT.                   CAT530  
                                                                        CAT530  
       5000-EXIT.                                                       CAT530  
           EXIT.                                                        CAT530  
      /                                                                 CAT530  
       5500-RETURN-SORT SECTION.                                        CAT530  
                                                                        CAT530  
           RETURN SORT-FILE                                             CAT530  
               AT END                                                   CAT530  
                     MOVE 999 TO W-SORT-CLIENT-NBR-N                    CAT530  
                     MOVE '1'              TO END-OF-SORT-SW            CAT530  
                     DISPLAY 'CAT530: SORT-EOF '                        CAT530  
                                   ' RET=' W-RETURN-CNT                 CAT530  
                     GO TO 5500-EXIT.                                   CAT530  
                                                                        CAT530  
           ADD  1                        TO W-RETURN-CNT.               CAT530  
           MOVE SORT-RECORD              TO W-SORT-RECORD.              CAT530  
                                                                        CAT530  
       5500-EXIT.                                                       CAT530  
           EXIT.                                                        CAT530  
      /                                                                 CAT530  
       6000-CLT-BREAK SECTION.                                          CAT530  
           DISPLAY '6000-CLT-BREAK'                                     CAT530  
               ' SORT-CLIENT-NBR= ' W-SORT-CLIENT-NBR                   CAT530  
               ' B1-PRT-SUB= ' B1-PRT-SUB.                              CAT530  
                                                                        CAT530  
       6000-LOOP.                                                       CAT530  
                                                                        CAT530  
           IF  B1-PRT-SUB   < W-SORT-CLIENT-NBR-N                       CAT530  
      ******   IF   B1-STREAM      (B1-PRT-SUB) = L-STREAM              CAT530  
               IF   B1-ACAT-STATUS (B1-PRT-SUB) = 'A'                   CAT530  
                 IF B1-PRINT       (B1-PRT-SUB) NOT = '1'               CAT530  
                    PERFORM 7100-WRITE-NO-ACT THRU 7100-EXIT            CAT530  
                 END-IF                                                 CAT530  
               END-IF                                                   CAT530  
           ELSE                                                         CAT530  
               GO TO 6000-EXIT                                          CAT530  
           END-IF.                                                      CAT530  
                                                                        CAT530  
           IF  B1-PRT-SUB < 500                                         CAT530  
               ADD 1 TO B1-PRT-SUB                                      CAT530  
               MOVE 0                    TO W-PAGE-CNT                  CAT530  
               MOVE 60                   TO W-LINE-CNT                  CAT530  
               MOVE 0                    TO W-CLT-CNT                   CAT530  
               GO TO 6000-LOOP                                          CAT530  
           END-IF.                                                      CAT530  
                                                                        CAT530  
       6000-EXIT. EXIT.                                                 CAT530  
      /                                                                 CAT530  
       7000-WRITE-REPORT SECTION.                                       CAT530  
                                                                        CAT530  
           MOVE '1' TO B1-PRINT (B1-PRT-SUB)                            CAT530  
                                                                        CAT530  
           IF  (W-SORT-CLIENT-NBR       NOT = W-PREV-CLIENT-NBR)        CAT530  
                MOVE 60 TO W-LINE-CNT                                   CAT530  
           END-IF                                                       CAT530  
                                                                        CAT530  
           MOVE W-SORT-CLIENT-NBR          TO W-PREV-CLIENT-NBR         CAT530  
           MOVE W-SORT-ACAT-CONTROL-NBR    TO W-PREV-CONTROL-NBR        CAT530  
                                                                        CAT530  
           INITIALIZE W-DTL1-REC                                        CAT530  
                      W-DTL2-REC                                        CAT530  
                      W-DTL3-REC.                                               
           MOVE W-SORT-ACAT-CONTROL-NBR     TO W-DTL1-CONTROL-NBR       CAT530  
           MOVE W-SORT-RCV-NBR              TO W-DTL1-RCV-NBR           CAT530  
           MOVE W-SORT-ISIN-SEC-ISSUE-CD    TO W-DTL1-CUSIP             CAT530  
           MOVE W-SORT-DESC1                TO W-DTL1-DESC1             CAT530  
           MOVE W-SORT-PSTN-CD              TO W-DTL1-LONG-SHORT        CAT530  
           MOVE W-SORT-QTY                  TO W-DTL1-QTY               CAT530  
           MOVE W-SORT-AMT                  TO W-DTL1-AMT               CAT530  
                                                                        CAT530  
           MOVE W-DTL1-REC               TO W-REPT-LINE.                CAT530  
           PERFORM 7700-WRITE-LINE THRU 7700-EXIT.                      CAT530  
           ADD 2                         TO W-LINE-CNT.                 CAT530  
                                                                        CAT530  
           IF  W-SORT-DESC2 > ' '                                       CAT530  
               MOVE W-SORT-DESC2         TO W-DTL2-DESC2                CAT530  
               MOVE W-DTL2-REC           TO W-REPT-LINE                 CAT530  
               PERFORM 7700-WRITE-LINE THRU 7700-EXIT                   CAT530  
               ADD 1                     TO W-LINE-CNT                  CAT530  
               IF  W-SORT-DESC3 > ' '                                   CAT530  
                   MOVE W-SORT-DESC3         TO W-DTL2-DESC2            CAT530  
                   MOVE W-DTL2-REC           TO W-REPT-LINE             CAT530  
                   PERFORM 7700-WRITE-LINE THRU 7700-EXIT               CAT530  
                   ADD 1                     TO W-LINE-CNT              CAT530  
               END-IF                                                   CAT530  
           END-IF                                                       CAT530  
                                                                        CAT530  
           MOVE W-SORT-SYS-RJCT-RSN-CD   TO W-RJCT-SUB.                         
           MOVE W-RJCT-MSG (W-RJCT-SUB)  TO W-DTL3-MSG.                         
           MOVE W-DTL3-REC               TO W-REPT-LINE.                CAT530  
           PERFORM 7700-WRITE-LINE THRU 7700-EXIT.                      CAT530  
           ADD 1                         TO W-LINE-CNT.                 CAT530  
                                                                                
           ADD  1                        TO W-CLT-CNT.                  CAT530  
                                                                        CAT530  
       7000-EXIT. EXIT.                                                 CAT530  
      /                                                                 CAT530  
       7100-WRITE-NO-ACT SECTION.                                       CAT530  
                                                                        CAT530  
           DISPLAY 'CAT530: '                                           CAT530  
                       B1-PRT-SUB                                       CAT530  
                   ' ' B1-CLT-NAME (B1-PRT-SUB)                         CAT530  
                   ' NO REJETED ASSETS TODAY'                           CAT530  
           MOVE B1-PRT-SUB               TO W-HDR1-CLT                  CAT530  
           MOVE B1-CLT-NAME (B1-PRT-SUB)                                CAT530  
                                         TO W-HDR1-CLT-NAME             CAT530  
                                                                        CAT530  
           ADD  1                        TO W-PAGE-CNT.                 CAT530  
           MOVE 3                        TO W-LINE-CNT.                 CAT530  
                                                                        CAT530  
           MOVE W-PAGE-CNT               TO W-HDR1-PAGE.                CAT530  
                                                                        CAT530  
           MOVE B1-PRT-SUB               TO W-HDR1-CLT.                 CAT530  
           MOVE B1-CLT-NAME (B1-PRT-SUB)                                CAT530  
                                         TO W-HDR1-CLT-NAME.            CAT530  
                                                                        CAT530  
           MOVE W-PROC-DATE-MM           TO W-HDR1-MM.                  CAT530  
           MOVE W-PROC-DATE-DD           TO W-HDR1-DD.                  CAT530  
           MOVE W-PROC-DATE-YY           TO W-HDR1-YY.                  CAT530  
                                                                        CAT530  
           MOVE W-HDR1-REC               TO REPT-LINE.                  CAT530  
           MOVE B1-PRT-SUB               TO REPT-CLT                    CAT530  
           MOVE LOW-VALUES               TO REPT-FIL.                   CAT530  
           WRITE REPT-REC.                                              CAT530  
                                                                        CAT530  
   ******  MOVE B1-BKR-CLR-NO (B1-PRT-SUB) TO W-HDR2-BKR.               CAT530  
           MOVE SPACES                   TO W-HDR2-BKR.                         
           MOVE W-SYS-MM                 TO W-HDR2-MM.                  CAT530  
           MOVE W-SYS-DD                 TO W-HDR2-DD.                  CAT530  
           MOVE W-SYS-YY                 TO W-HDR2-YY.                  CAT530  
           MOVE W-SYS-HH                 TO W-HDR2-HH.                  CAT530  
           MOVE W-SYS-MN                 TO W-HDR2-MN.                  CAT530  
                                                                        CAT530  
           MOVE W-HDR2-REC               TO REPT-LINE.                  CAT530  
           MOVE B1-PRT-SUB               TO REPT-CLT                    CAT530  
           MOVE LOW-VALUES               TO REPT-FIL.                   CAT530  
           WRITE REPT-REC.                                              CAT530  
                                                                        CAT530  
           MOVE W-DTLX-REC               TO REPT-LINE.                  CAT530  
           MOVE B1-PRT-SUB               TO REPT-CLT.                   CAT530  
           MOVE LOW-VALUES               TO REPT-FIL.                   CAT530  
           WRITE REPT-REC.                                              CAT530  
                                                                        CAT530  
       7100-EXIT. EXIT.                                                 CAT530  
      /                                                                 CAT530  
       7700-WRITE-LINE SECTION.                                         CAT530  
                                                                        CAT530  
           IF   W-LINE-CNT > 56                                         CAT530  
                PERFORM 7800-WRITE-HDR THRU 7800-EXIT.                  CAT530  
                                                                        CAT530  
           MOVE W-REPT-LINE              TO REPT-LINE.                  CAT530  
           MOVE B1-PRT-SUB               TO REPT-CLT.                   CAT530  
           MOVE LOW-VALUES               TO REPT-FIL.                   CAT530  
           WRITE REPT-REC.                                              CAT530  
                                                                        CAT530  
       7700-EXIT. EXIT.                                                 CAT530  
      /                                                                 CAT530  
       7800-WRITE-HDR    SECTION.                                       CAT530  
                                                                        CAT530  
           ADD  1                        TO W-PAGE-CNT.                 CAT530  
                                                                        CAT530  
           MOVE W-PAGE-CNT               TO W-HDR1-PAGE.                CAT530  
                                                                        CAT530  
           MOVE B1-PRT-SUB               TO W-HDR1-CLT.                 CAT530  
           MOVE B1-CLT-NAME (B1-PRT-SUB)                                CAT530  
                                         TO W-HDR1-CLT-NAME.            CAT530  
                                                                        CAT530  
           MOVE W-PROC-DATE-MM           TO W-HDR1-MM.                  CAT530  
           MOVE W-PROC-DATE-DD           TO W-HDR1-DD.                  CAT530  
           MOVE W-PROC-DATE-YY           TO W-HDR1-YY.                  CAT530  
                                                                        CAT530  
           MOVE W-HDR1-REC               TO REPT-LINE.                  CAT530  
           MOVE B1-PRT-SUB               TO REPT-CLT                    CAT530  
           MOVE LOW-VALUES               TO REPT-FIL.                   CAT530  
           WRITE REPT-REC.                                              CAT530  
                                                                        CAT530  
           MOVE B1-BKR-CLR-NO (B1-PRT-SUB) TO W-HDR2-BKR.               CAT530  
           MOVE W-SYS-MM                 TO W-HDR2-MM.                  CAT530  
           MOVE W-SYS-DD                 TO W-HDR2-DD.                  CAT530  
           MOVE W-SYS-YY                 TO W-HDR2-YY.                  CAT530  
           MOVE W-SYS-HH                 TO W-HDR2-HH.                  CAT530  
           MOVE W-SYS-MN                 TO W-HDR2-MN.                  CAT530  
                                                                        CAT530  
           MOVE W-HDR2-REC               TO REPT-LINE.                  CAT530  
           MOVE B1-PRT-SUB               TO REPT-CLT                    CAT530  
           MOVE LOW-VALUES               TO REPT-FIL.                   CAT530  
           WRITE REPT-REC.                                              CAT530  
                                                                        CAT530  
***********MOVE*W-HDR3-REC***************TO*REPT-LINE.******************CAT530  
***********MOVE*B1-PRT-SUB***************TO*REPT-CLT********************CAT530  
***********MOVE*LOW-VALUES***************TO*REPT-FIL.*******************CAT530  
***********WRITE*REPT-REC.**********************************************CAT530  
************************************************************************CAT530  
***********MOVE*W-HDR4-REC***************TO*REPT-LINE.******************CAT530  
***********MOVE*B1-PRT-SUB***************TO*REPT-CLT********************CAT530  
***********MOVE*LOW-VALUES***************TO*REPT-FIL.*******************CAT530  
***********WRITE*REPT-REC.**********************************************CAT530  
************************************************************************CAT530  
***********MOVE*W-HDR5-REC***************TO*REPT-LINE.******************CAT530  
***********MOVE*B1-PRT-SUB***************TO*REPT-CLT********************CAT530  
***********MOVE*LOW-VALUES***************TO*REPT-FIL.*******************CAT530  
***********WRITE*REPT-REC.**********************************************CAT530  
                                                                        CAT530  
           MOVE W-HDR6-REC               TO REPT-LINE.                  CAT530  
           MOVE B1-PRT-SUB               TO REPT-CLT                    CAT530  
           MOVE LOW-VALUES               TO REPT-FIL.                   CAT530  
           WRITE REPT-REC.                                              CAT530  
                                                                        CAT530  
           MOVE 7                        TO W-LINE-CNT.                 CAT530  
                                                                        CAT530  
       7800-EXIT. EXIT.                                                 CAT530  
      /                                                                 CAT530  
       8500-SQL-ERROR      SECTION.                                     CAT530  
           DISPLAY ' '                                                  CAT530  
           DISPLAY '8500-SQL-ERROR'                                     CAT530  
                  ' INFILE-CNT = ' W-INFILE-CNT                         CAT530  
           ' LAST-COMMIT-INFILE-CNT = ' W-LAST-COMMIT-INFILE-CNT        CAT530  
                                                                        CAT530  
           DISPLAY ' '                                                  CAT530  
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                  CAT530  
                                    W-DB2-MESSAGE-LEN.                  CAT530  
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                        CAT530  
             UNTIL W-DB2-IDX GREATER THAN 12                            CAT530  
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES              CAT530  
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)               CAT530  
                   END-IF                                               CAT530  
           END-PERFORM.                                                 CAT530  
           DISPLAY ' '                                                  CAT530  
                                                                        CAT530  
           DISPLAY 'CAT530: U3999 - ABENDING ON BAD DB2 STATUS'         CAT530  
           PERFORM 8900-DISPLAY-CNT THRU 8900-EXIT                      CAT530  
           DISPLAY 'CAT530: PROGRAM ENDED ABNORMALLY'                   CAT530  
           MOVE +3999 TO ABEND-CD                                       CAT530  
TCK001*    CALL 'ABEND' USING ABEND-CD DUMP-SW.                         CAT530  
TCK001     CALL  ABEND  USING ABEND-CD DUMP-SW.                         CAT530  
                                                                        CAT530  
       8500-EXIT. EXIT.                                                 CAT530  
      /                                                                 CAT530  
       8900-DISPLAY-CNT   SECTION.                                      CAT530  
           DISPLAY ' '                                                  CAT530  
           DISPLAY 'CAT530: INFILE  COUNT      = ' W-INFILE-CNT         CAT530  
                 ' (VTRNFR)'                                            CAT530  
           DISPLAY 'CAT530: DETAIL  COUNT      = ' W-DETAIL-CNT         CAT530  
                 ' (VASSET)'                                            CAT530  
           DISPLAY 'CAT530: W-LOAD-CNT         = ' W-LOAD-CNT           CAT530  
           .                                                            CAT530  
       8900-EXIT. EXIT.                                                 CAT530  
      /                                                                 CAT530  
       9000-CLOSE-ROUTINE SECTION.                                      CAT530  
                                                                        CAT530  
           CLOSE REPT-FILE.                                             CAT530  
           DISPLAY 'CAT530: REPORT   CLOSED. STATUS = '                 CAT530  
                                               REPT-STAT.               CAT530  
                                                                        CAT530  
           DISPLAY ' '.                                                 CAT530  
           DISPLAY 'CAT530: INFILE CNT = ' W-INFILE-CNT.                CAT530  
                                                                        CAT530  
           DISPLAY ' '.                                                 CAT530  
           DISPLAY 'CAT530: PROGRAM ENDED SUCCESSFULLY'.                CAT530  
                                                                        CAT530  
       9000-EXIT.                                                       CAT530  
           EXIT.                                                        CAT530  
      *################################################################ CAT530  
