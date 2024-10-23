000001* PDX    - CAT680   C0157686 04/20/01 14:04:43 TBLAMUR            00001000
000001* PDX    - CAT680   C0119783 12/28/98 11:19:31 TBLAMUR            00001000
000001* PDX    - CAT680   C0117772 12/26/98 15:21:37 TBYOHON            00001000
       IDENTIFICATION DIVISION.                                         CAT24   
       PROGRAM-ID. CAT680.                                              CAT24   
      *                                                                 CAT24   
       DATE-WRITTEN. NOV 1998.                                          CAT24   
      *---------------------------------------------------------------* CAT24   
      *REMARKS.                                                       * CAT24   
      *                                                               * CAT24   
      *  THIS PROGRAM - CREATES SCRATCH PAD ENTRIES FILE FOR THE      * CAT24   
      *                 SPAD SYSTEM. THE PRIMARY INPUT IS THE DB2     * CAT24   
      *                 ACTIVE TIFS.  ADDITIONAL INPUTS ARE THE       * CAT24   
      *                 B1 CARDS FOR ACCOUNT SELECTION AND THE CMT07  * CAT24   
      *                 BROKER FILE WHICH CONTAINS THE BROKER NAME.   * CAT24   
      *  PROGRAM MODELLED FROM CAT24 FOR ACATS REWRITE.               * CAT24   
      *                                                               * CAT24   
      *               - THE OUTPUT FILE IS IN CLIENT, BRANCH AND      * CAT24   
      *                 ACCOUNT NUMBER SEQUENCE.                      * CAT24   
      *                                                               * CAT24   
C05762*  105762 - PRODUCE 9348 SCRATCH PAD WITH 30 DAY EXPIRATION     * CAT24   
      *---------------------------------------------------------------* CAT24   
           EJECT                                                        CAT24   
       ENVIRONMENT DIVISION.                                            CAT24   
       INPUT-OUTPUT SECTION.                                            CAT24   
                                                                        CAT24   
       FILE-CONTROL.                                                    CAT24   
                                                                        CAT24   
           SELECT  BROKER-FILE         ASSIGN  TO  BRKRFL               CAT24   
                                 ORGANIZATION  IS  INDEXED              CAT24   
                                       ACCESS  IS  DYNAMIC              CAT24   
                                   RECORD KEY  IS  BROKER-KEY           CAT24   
                                  FILE STATUS  IS  BROKER-FILE-STATUS.  CAT24   
                                                                        CAT24   
           SELECT  ACAT-SPAD-FILE      ASSIGN  TO  UT-S-SPADFL.         CAT24   
                                                                        CAT24   
           SELECT  SORT-FILE           ASSIGN  TO  SORTWK01.            CAT24   
                                                                        CAT24   
           EJECT                                                        CAT24   
       DATA DIVISION.                                                   CAT24   
                                                                        CAT24   
       FILE SECTION.                                                    CAT24   
                                                                        CAT24   
       FD  BROKER-FILE.                                                 CAT24   
                                                                        CAT24   
       01  BROKER-REC.                                                  CAT24   
           05  BROKER-KEY.                                              CAT24   
               10  BROKER-EXCHANGE     PIC X.                           CAT24   
               10  BROKER-BADGE        PIC X(4).                        CAT24   
               10  FILLER              PIC X(6).                        CAT24   
           05  FILLER                  PIC X(12).                       CAT24   
           05  BROKER-NAME             PIC X(33).                       CAT24   
           05  FILLER                  PIC X(24).                       CAT24   
                                                                        CAT24   
       FD  ACAT-SPAD-FILE                                               CAT24   
           LABEL RECORDS STANDARD                                       CAT24   
           RECORDING MODE IS V                                          CAT24   
           RECORD IS VARYING                                            CAT24   
           BLOCK CONTAINS 0 RECORDS.                                    CAT24   
       01  ACAT-SPAD-REC-1             PIC X(25).                       CAT24   
       01  ACAT-SPAD-REC-2             PIC X(88).                       CAT24   
       01  ACAT-SPAD-REC-3             PIC X(31).                       CAT24   
                                                                        CAT24   
       SD  SORT-FILE.                                                   CAT24   
       01  SORT-REC.                                                    CAT24   
           05  S-CLI                   PIC 9(03)  COMP-3.               CAT24   
           05  S-BR-ACCT               PIC X(10).                       CAT24   
           05  S-CODE                  PIC 9(03)  COMP-3.               CAT24   
           05  S-EXP-DTE               PIC X(06).                       CAT24   
           05  FILLER                  PIC X(68).                       CAT24   
           EJECT                                                        CAT24   
      ***************************************************************** CAT24   
       WORKING-STORAGE  SECTION.                                        CAT24   
      ***************************************************************** CAT24   
       77  PGM-NAME                         PIC X(06)  VALUE 'CAT680'.  CAT24   
                                                                        CAT24   
       77  ACAT-PROC-DATE                   PIC X(06)  VALUE ' '.       CAT24   
                                                                        CAT24   
       77  WS-DATE                          PIC 9(06)  VALUE 0.         CAT24   
                                                                        CAT24   
       77  ABEND-CODE-2000      COMP        PIC S9(4)  VALUE +2000.     CAT24   
       77  ABEND-CODE-2020      COMP        PIC S9(4)  VALUE +2020.     CAT24   
       77  ABEND-CODE-2024      COMP        PIC S9(4)  VALUE +2024.     CAT24   
       77  ABEND-CODE-2028      COMP        PIC S9(4)  VALUE +2028.     CAT24   
                                                                        CAT24   
       77  ABEND-CODE-4004      COMP        PIC S9(4)  VALUE +4004.     CAT24   
       77  ABEND-CODE-4008      COMP        PIC S9(4)  VALUE +4008.     CAT24   
       77  ABEND-CODE-4012      COMP        PIC S9(4)  VALUE +4012.     CAT24   
       77  ABEND-CODE-4016      COMP        PIC S9(4)  VALUE +4016.     CAT24   
       77  ABEND-CODE-4020      COMP        PIC S9(4)  VALUE +4020.     CAT24   
       77  ABEND-CODE-4024      COMP        PIC S9(4)  VALUE +4024.     CAT24   
       77  ABEND-CODE-4028      COMP        PIC S9(4)  VALUE +4028.     CAT24   
                                                                        CAT24   
       77  ABEND-CODE-8000      COMP        PIC S9(4)  VALUE +8000.     CAT24   
                                                                        CAT24   
       77  BROKER-FILE-STATUS                 PIC X(02).                CAT24   
           88  BRKR-FILE-OK                            VALUE '00'.      CAT24   
           88  BRKR-OPEN-OK                            VALUE '00' '97'. CAT24   
           88  BRKR-ENDFILE                            VALUE '10'.      CAT24   
                                                                        CAT24   
       77  ACAT-RECS-CLIENT      COMP       PIC S9(9)  VALUE +0.        CAT24   
       77  ACAT-RECS-TOTAL       COMP       PIC S9(9)  VALUE +0.        CAT24   
                                                                        CAT24   
       77  B1-SUB                           PIC 9(4)    VALUE 0.        CAT24   
       77  B1-TBL-CNT                       PIC 9(4)    VALUE 0.        CAT24   
       77  MSGNO                            PIC 9(3)    VALUE 0.        CAT24   
                                                                        CAT24   
                                                                        CAT24   
       77  ACAT-TYPE-WRITE                  PIC X(01)  VALUE ' '.       CAT24   
           88  WRITE-HDR                               VALUE 'H'.       CAT24   
           88  WRITE-DATA                              VALUE 'D'.       CAT24   
           88  WRITE-TRLR                              VALUE 'T'.       CAT24   
                                                                        CAT24   
       77  B1-TABLE-SEARCH                  PIC X(01)  VALUE ' '.       CAT24   
           88  B1-ENTRY-FOUND                          VALUE 'Y'.       CAT24   
           88  B1-ENTRY-NOT-FOUND                      VALUE 'N'.       CAT24   
                                                                        CAT24   
       77  ACAT-FIRST-TIME-SW               PIC X(01)  VALUE 'Y'.       CAT24   
           88  ACAT-FIRST-TIME                         VALUE 'Y'.       CAT24   
                                                                        CAT24   
       77  ACAT-FIRST-WRITE-SW              PIC X(01)  VALUE 'Y'.       CAT24   
           88  ACAT-FIRST-WRITE                        VALUE 'Y'.       CAT24   
                                                                        CAT24   
       77  ACAT-EOF-SW                      PIC X(01)  VALUE ' '.       CAT24   
           88  ACAT-EOF                                VALUE 'Y'.       CAT24   
           COPY STUBCPY.                                                CAT24   
       01  FILLER                        PIC X(08) VALUE 'DB2AREA '.    CAT710  
       01  DB2-ABEND-WORK-AREA.                                         CAT710  
           03  DB2-ABEND-CODE                PIC S9(04) COMP.           CAT710  
           03  WS-NSCC-PEND-IND              PIC X(01)  VALUE SPACES.   CAT710  
           03  DSNTIAR                       PIC X(08)  VALUE 'DSNTIAR'.CAT710  
           03  WS-DB2-MESSAGE-AREA.                                     CAT710  
               05  WS-DB2-MSG-LEN            PIC S9(04) COMP VALUE +960.CAT710  
               05  WS-ERROR-MSG              PIC X(80)  OCCURS 12 TIMES CAT710  
                   INDEXED BY WS-ERROR-INDEX.                           CAT710  
           03  WS-ERR-LINE-LEN               PIC S9(09) COMP VALUE +80. CAT710  
                                                                        CAT710  
       01  CONTRA-BROKER                PIC X(04) VALUE ' '.            CAT24   
                                                                        CAT24   
       01  WS-COUNTERS.                                                 CAT24   
           05  ACAT-ACPT-RECS           PIC 9(7)   COMP-3  VALUE ZERO.  CAT24   
           05  ACAT-SPAD-RECS           PIC 9(7)   COMP-3  VALUE ZERO.  CAT24   
           05  ACAT-SPAD-HDRS           PIC 9(7)   COMP-3  VALUE ZERO.  CAT24   
           05  ACAT-SPAD-TRLRS          PIC 9(7)   COMP-3  VALUE ZERO.  CAT24   
                                                                        CAT24   
       01  DATE-MSG.                                                    CAT24   
           03  FILLER              PIC X(38)       VALUE                CAT24   
           'BAD RETURN CODE FROM DTSEARCH         '.                    CAT24   
           03  FILLER              PIC X(22)       VALUE                CAT24   
           'DTSEARCH RETURN CDE - '.                                    CAT24   
           03  DMSG-CDE            PIC 999.                             CAT24   
                                                                                
           COPY BPDATESC.                                               CAT24   
           EJECT                                                        CAT24   
           COPY BHINFO.                                                 CAT24   
           EJECT                                                        CAT24   
           COPY BHACAT.                                                 CAT24   
                                                                        CAT24   
           EJECT                                                        CAT24   
       01  ACAT-SPAD-HDR.                                               CAT24   
           05  FILLER                  PIC X(18) VALUE LOW-VALUES.      CAT24   
           05  FILLER                  PIC X(05) VALUE 'DATE='.         CAT24   
           05  SPAD-HDR-DATE           PIC X(08).                       CAT24   
                                                                        CAT24   
       01  ACAT-SPAD-REC.                                               CAT24   
       COPY SPADEXP3.                                                   CAT24   
           EJECT                                                        CAT24   
       01  SPAD-HDR.                                                    CAT24   
           05  SPH-KEY                 PIC X(12).                       CAT24   
           05  FILLER                  PIC X(11) VALUE LOW-VALUES.      CAT24   
           05  FILLER                  PIC X(2)  VALUE X'001C'.         CAT24   
                                                                        CAT24   
       01  SPAD-TRLR.                                                   CAT24   
           05  SPT-KEY                 PIC X(12).                       CAT24   
           05  FILLER                  PIC X(4)  VALUE 'GNRL'.          CAT24   
           05  FILLER                  PIC X(7)  VALUE LOW-VALUES.      CAT24   
           05  FILLER                  PIC X     VALUE X'01'.           CAT24   
           05  FILLER                  PIC X(4)  VALUE 'MRGN'.          CAT24   
           05  FILLER                  PIC X(2)  VALUE X'000C'.         CAT24   
           05  FILLER                  PIC X     VALUE LOW-VALUE.       CAT24   
                                                                        CAT24   
       01  SPAD-MESSAGE-WORKAREA.                                       CAT24   
           05  SPAD-FROM-MSG.                                           CAT24   
               10  FILLER              PIC X(9) VALUE 'TOA FROM '.      CAT24   
               10  SFM-CONTRA-BKR      PIC X(4).                        CAT24   
               10  FILLER              PIC X    VALUE  SPACES.          CAT24   
               10  SFM-BKR-NAME        PIC X(20).                       CAT24   
               10  FILLER              PIC X    VALUE  SPACES.          CAT24   
               10  SFM-CONTRA-ACCT     PIC X(15).                       CAT24   
           05  SPAD-TO-MSG.                                             CAT24   
               10  FILLER              PIC X(7) VALUE 'TOA TO '.        CAT24   
               10  STM-CONTRA-BKR      PIC X(4).                        CAT24   
               10  FILLER              PIC X    VALUE  SPACES.          CAT24   
               10  STM-BKR-NAME        PIC X(20).                       CAT24   
               10  FILLER              PIC X    VALUE  SPACES.          CAT24   
               10  STM-CONTRA-ACCT     PIC X(15).                       CAT24   
           05  SPAD-STATUS-MSG.                                         CAT24   
               10  FILLER              PIC X(11) VALUE 'TOA STATUS '.   CAT24   
               10  FILLER              PIC X(5)  VALUE 'ACAT '.         CAT24   
               10  SSM-CNTL-NO         PIC X(10).                       CAT24   
               10  FILLER              PIC X     VALUE SPACES.          CAT24   
               10  SSM-STATUS          PIC X(8).                        CAT24   
               10  FILLER              PIC X     VALUE SPACES.          CAT24   
               10  SSM-STATUS-DAYS     PIC ZZZ.                         CAT24   
           05  SPAD-RESIDUAL-STATUS-MSG.                                CAT24   
               10  FILLER              PIC X(4)  VALUE 'TOA '.          CAT24   
               10  SRSM-TYPE           PIC X(4).                        CAT24   
               10  FILLER              PIC X     VALUE SPACES.          CAT24   
               10  SRSM-CONTRA-BRKR    PIC X(4).                        CAT24   
               10  FILLER              PIC X(01) VALUE ' '.             CAT24   
               10  SRSM-TRNFR-TYPE     PIC X(04) VALUE ' '.             CAT24   
               10  FILLER              PIC X(05) VALUE 'ACAT '.         CAT24   
               10  SRSM-CNTL-NO        PIC X(10).                       CAT24   
               10  FILLER              PIC X     VALUE SPACES.          CAT24   
               10  SRSM-STATUS         PIC X(8).                        CAT24   
               10  FILLER              PIC X     VALUE SPACES.          CAT24   
               10  SRSM-STATUS-DAYS    PIC ZZ.                          CAT24   
           05  SPAD-REJECT-MSG.                                         CAT24   
               10  FILLER              PIC X(11) VALUE 'TOA REJECT '.   CAT24   
               10  SRM-REJECT-CODE     PIC X(2).                        CAT24   
               10  FILLER              PIC X(6)  VALUE ' ACAT '.        CAT24   
               10  SRM-CNTL-NO         PIC X(10).                       CAT24   
               10  FILLER              PIC X     VALUE SPACES.          CAT24   
               10  SRM-REJECT-EXPL     PIC X(22).                       CAT24   
                                                                        CAT24   
       01  SPAD-ACCOUNT-WORKAREA.                                       CAT24   
           05  SPAD-WORK-ACCOUNT.                                       CAT24   
               10  SPAD-WK-BR          PIC X(3).                        CAT24   
               10  FILLER              PIC X      VALUE '-'.            CAT24   
               10  SPAD-WK-ACCT        PIC X(5).                        CAT24   
               10  FILLER              PIC X      VALUE SPACE.          CAT24   
                                                                        CAT24   
       01  SAVE-KEY                    PIC X(20).                       CAT24   
                                                                        CAT24   
       01  PREV-KEY                    PIC X(12).                       CAT24   
                                                                        CAT24   
       01  BRKR-NAME                   PIC X(20)  VALUE SPACES.         CAT24   
                                                                        CAT24   
       01  PROC-DATE.                                                   CAT24   
           05  PD-CC                   PIC X(2).                        CAT24   
           05  PD-YY                   PIC X(2).                        CAT24   
           05  PD-MM                   PIC X(2).                        CAT24   
           05  PD-DD                   PIC X(2).                        CAT24   
                                                                        CAT24   
       01  PROC-DATE-N  REDEFINES PROC-DATE  PIC 9(8).                  CAT24   
                                                                        CAT24   
       01  NEXT-PROC-DATE.                                              CAT24   
           05  NPD-CC                  PIC X(2).                        CAT24   
           05  NPD-YY                  PIC X(2).                        CAT24   
           05  NPD-MM                  PIC X(2).                        CAT24   
           05  NPD-DD                  PIC X(2).                        CAT24   
                                                                        CAT24   
       01  NEXT-PROC-DATE-N REDEFINES NEXT-PROC-DATE   PIC 9(8).        CAT24   
                                                                        CAT24   
       01  PROC-DATE-PLUS-18MTHS.                                       CAT24   
           05  PD18-CC                 PIC X(2).                        CAT24   
           05  PD18-YY                 PIC X(2).                        CAT24   
           05  PD18-MM                 PIC X(2).                        CAT24   
           05  PD18-DD                 PIC X(2).                        CAT24   
                                                                        CAT24   
       01  PROC-DATE-PLUS-18MTHS-N REDEFINES PROC-DATE-PLUS-18MTHS      CAT24   
                                       PIC 9(8).                        CAT24   
C05762                                                                  CAT24   
C05762 01  PROC-DATE-PLUS-30DAYS.                                       CAT24   
C05762     05  PD30-CC                 PIC X(2).                        CAT24   
C05762     05  PD30-YY                 PIC X(2).                        CAT24   
C05762     05  PD30-MM                 PIC X(2).                        CAT24   
C05762     05  PD30-DD                 PIC X(2).                        CAT24   
C05762                                                                  CAT24   
C05762 01  PROC-DATE-PLUS-30DAYS-N REDEFINES PROC-DATE-PLUS-30DAYS      CAT24   
C05762                                 PIC 9(8).                        CAT24   
                                                                        CAT24   
       01  WORK-DATE.                                                   CAT24   
           05  WK-CC                   PIC 9(2).                        CAT24   
           05  WK-YY                   PIC 9(2).                        CAT24   
           05  WK-MM                   PIC 9(2).                        CAT24   
           05  WK-DD                   PIC 9(2).                        CAT24   
                                                                        CAT24   
       01  BR-ACCT-TEST-AREA.                                           CAT24   
           05  BR-ACCT-IN              PIC X(15).                       CAT24   
           05  FILLER REDEFINES BR-ACCT-IN.                             CAT24   
               10  B-CHAR OCCURS 15 TIMES                               CAT24   
                                       PIC X.                           CAT24   
           05  BR-ACCT-CNV             PIC X(8).                        CAT24   
           05  FILLER REDEFINES BR-ACCT-CNV.                            CAT24   
               10  C-CHAR OCCURS 8 TIMES                                CAT24   
                                       PIC X.                           CAT24   
           EJECT                                                        CAT24   
       01  B1-TABLE-AREA.                                               CAT24   
           03  B1-TABLE OCCURS 500 TIMES.                               CAT24   
               05  B1-ADP-CL-NO             PIC 9(03).                  CAT24   
               05  B1-ADP-CL-NO-X REDEFINES B1-ADP-CL-NO PIC XXX.       CAT24   
               05  B1-BKR-CLR-NO            PIC X(04).                  CAT24   
               05  B1-CLI-NAME              PIC X(30).                  CAT24   
               05  B1-SPAD-IND              PIC X.                      CAT24   
                                                                        CAT24   
       01  B1-WORK-TABLE-AREA.                                          CAT24   
           03  B1-WRK-TABLE.                                            CAT24   
               05  B1-WRK-ADP-CL-NO         PIC 9(03) VALUE 0.          CAT24   
               05  B1-WRK-ADP-CL-NO-X  REDEFINES B1-WRK-ADP-CL-NO       CAT24   
                                            PIC XXX.                            
               05  B1-WRK-BKR-CLR-NO        PIC X(04).                  CAT24   
               05  B1-WRK-NAME              PIC X(30).                  CAT24   
               05  B1-WRK-SPAD-IND          PIC X.                      CAT24   
                                                                        CAT24   
           EJECT                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT ACTIVE TRANSFER TABLE                                    
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VTRNFR                                                   
           END-EXEC.                                                            
                                                                                
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
                 FROM VTRNFR                                                    
                 ORDER BY CLIENT_NBR, ACAT_CONTROL_NBR                          
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      * INCLUDE FOR DB2 COMMUNICATIONS AREA.                                    
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE SQLCA                                                    
           END-EXEC.                                                            
                                                                                
           EJECT                                                        CAT24   
      ***************************************************************** CAT24   
       LINKAGE SECTION.                                                 CAT24   
      ***************************************************************** CAT24   
       01  PARM-AREA.                                                   CAT24   
           05  PARM-LENGTH                  PIC S9(4) COMP SYNC.        CAT24   
           05  PARM-INFO.                                               CAT24   
               10  PARM-STREAM              PIC X.                      CAT24   
                   88  PARM-STREAM-VALID                VALUES ARE      CAT24   
                       'A' THRU 'Z' '0' THRU '9'.                       CAT24   
                                                                        CAT24   
       PROCEDURE DIVISION USING PARM-AREA.                              CAT24   
                                                                        CAT24   
           COPY MSGCOBO.                                                CAT24   
                                                                        CAT24   
           DISPLAY '*** CREATE ACATS SPAD MESSAGE EXTRACT ***'.                 
           DISPLAY '*** ' PGM-NAME ' BEGINNING INITIAL ROUTINE ***'.    CAT24   
                                                                        CAT24   
           PERFORM  100-HOUSEKEEPING THRU                               CAT24   
                    100-HOUSEKEEPING-EXIT.                              CAT24   
                                                                        CAT24   
           PERFORM  200-INIT-B1-LOOP THRU                               CAT24   
                    200-INIT-B1-LOOP-EXIT.                              CAT24   
                                                                        CAT24   
           SORT  SORT-FILE                                              CAT24   
                     ASCENDING KEY  S-CLI                               CAT24   
                                    S-BR-ACCT                           CAT24   
                                    S-CODE                              CAT24   
                                    S-EXP-DTE                           CAT24   
                     INPUT PROCEDURE  300-SORTIN-ROUTINE THRU           CAT24   
                                      300-SORTIN-ROUTINE-EXIT           CAT24   
                    OUTPUT PROCEDURE  600-SORTOUT-ROUTINE THRU          CAT24   
                                      600-SORTOUT-ROUTINE-EXIT.         CAT24   
                                                                        CAT24   
           IF  SORT-RETURN  NOT =  ZERO                                 CAT24   
                   DISPLAY  'INTERNAL SORT FAILED, SORT RC = '          CAT24   
                             SORT-RETURN                                CAT24   
                   CALL ABEND             USING ABEND-CODE-8000         CAT24   
           END-IF.                                                      CAT24   
                                                                        CAT24   
           PERFORM  900-ENDJOB-ROUTINE                                  CAT24   
              THRU  900-ENDJOB-ROUTINE-EXIT.                            CAT24   
                                                                        CAT24   
           GOBACK.                                                      CAT24   
                                                                        CAT24   
           EJECT                                                        CAT24   
      ******************                                                CAT24   
       100-HOUSEKEEPING.                                                CAT24   
                                                                        CAT24   
           IF PARM-LENGTH  > 0                                          CAT24   
             CONTINUE                                                   CAT24   
           ELSE                                                         CAT24   
             DISPLAY 'PARM LENGTH IS INVALID, LENGTH MUST BE 1 CHAR '   CAT24   
             DISPLAY 'PARM ENTERED - ' PARM-INFO                        CAT24   
             DISPLAY 'PROGRAM CAT680 ABENDED '                          CAT24   
             CALL ABEND          USING ABEND-CODE-2000.                 CAT24   
                                                                        CAT24   
           IF PARM-STREAM-VALID                                         CAT24   
             CONTINUE                                                   CAT24   
           ELSE                                                         CAT24   
             DISPLAY 'PARM INVALID, MUST BE 1 CHAR ALPHANUMERIC'        CAT24   
             DISPLAY 'PARM ENTERED - ' PARM-INFO                        CAT24   
             DISPLAY 'PROGRAM CAT680 ABENDED '                          CAT24   
             CALL ABEND          USING ABEND-CODE-2000.                 CAT24   
                                                                        CAT24   
                                                                        CAT24   
           MOVE  PGM-NAME                TO BPDATES-CALLING-PGM.        CAT24   
           MOVE  'C'                     TO BPDATES-REQ-TYPE.           CAT24   
           CALL    BPDATES            USING BPDATES-PARAMETERS.         CAT24   
                                                                        CAT24   
           MOVE  BPD-PROC-DATE           TO  PROC-DATE                  CAT24   
                                             SPAD-HDR-DATE.             CAT24   
                                                                        CAT24   
           DISPLAY 'PROCESS DATE = ' BPD-PROC-DATE.                     CAT24   
                                                                        CAT24   
      * GET NEXT PROCESSING DATE                                        CAT24   
                                                                        CAT24   
           MOVE  PGM-NAME             TO  BPDATES-CALLING-PGM.          CAT24   
           MOVE  BPD-PROC-DATE        TO  BPDATES-BASE-DATE.            CAT24   
           MOVE  'D'                  TO  BPDATES-REQ-TYPE.             CAT24   
           MOVE  'P'                  TO  BPDATES-DTSEARCH-IND.         CAT24   
           MOVE  'T'                  TO  BPDATES-DTSEARCH-TYPE.        CAT24   
           MOVE  SPACES               TO  BPDATES-CALENDAR-TYPE.        CAT24   
           MOVE  1                    TO  BPDATES-DTSEARCH-DISP.        CAT24   
                                                                        CAT24   
           CALL   BPDATES             USING  BPDATES-PARAMETERS.        CAT24   
                                                                        CAT24   
           IF BPD-VALID-RETURN                                          CAT24   
              MOVE BPD-DT-CALDATE        TO  NEXT-PROC-DATE             CAT24   
              DISPLAY 'NEXT PROC DATE - ' NEXT-PROC-DATE                CAT24   
           ELSE                                                         CAT24   
              MOVE BPDATES-RETURN-CODE TO DMSG-CDE                      CAT24   
              DISPLAY DATE-MSG                                          CAT24   
C05762        CALL ABEND          USING ABEND-CODE-2020                 CAT24   
C05762     END-IF.                                                      CAT24   
                                                                        CAT24   
      * GET PROCESSING DATE 18 MONTHS FROM NOW                          CAT24   
                                                                        CAT24   
           MOVE  PROC-DATE            TO  WORK-DATE.                    CAT24   
           ADD 1 TO WK-YY.                                              CAT24   
           IF WK-YY = ZERO                                              CAT24   
             MOVE 20 TO WK-CC.                                          CAT24   
           ADD 6 TO WK-MM.                                              CAT24   
           IF WK-MM > 12                                                CAT24   
             SUBTRACT 12 FROM WK-MM                                     CAT24   
             ADD 1 TO WK-YY                                             CAT24   
             IF WK-YY = ZERO                                            CAT24   
               MOVE 20 TO WK-CC                                         CAT24   
             END-IF                                                     CAT24   
           END-IF.                                                      CAT24   
           MOVE 01 TO WK-DD.                                            CAT24   
                                                                        CAT24   
           MOVE WORK-DATE  TO  PROC-DATE-PLUS-18MTHS                    CAT24   
           DISPLAY 'PROC DATE PLUS 18 MTHS - ' PROC-DATE-PLUS-18MTHS    CAT24   
C05762                                                                  CAT24   
C05762                                                                  CAT24   
C05762* GET EXPIRATION DATE FOR 9348 REC AT LEAST 30 DAYS AHEAD         CAT24   
C05762                                                                  CAT24   
C05762     MOVE  'D'                     TO  BPDATES-REQ-TYPE.          CAT24   
C05762     MOVE  'US'                    TO  BPDATES-CALENDAR-TYPE.     CAT24   
C05762     MOVE  PROC-DATE               TO  BPDATES-BASE-DATE.         CAT24   
C05762     MOVE  'P'                     TO  BPDATES-DTSEARCH-IND.      CAT24   
C05762     MOVE  'C'                     TO  BPDATES-DTSEARCH-TYPE.     CAT24   
C05762     MOVE  30                      TO  BPDATES-DTSEARCH-DISP.     CAT24   
C05762     CALL   BPDATES             USING  BPDATES-PARAMETERS.        CAT24   
C05762                                                                  CAT24   
C05762     IF NOT BPD-VALID-RETURN                                      CAT24   
C05762        MOVE BPDATES-RETURN-CODE TO DMSG-CDE                      CAT24   
C05762        DISPLAY DATE-MSG                                          CAT24   
C05762        CALL ABEND          USING ABEND-CODE-2020                 CAT24   
C05762     END-IF.                                                      CAT24   
C05762                                                                  CAT24   
C05762     MOVE BPD-DT-CALDATE TO  PROC-DATE-PLUS-30DAYS                CAT24   
C05762     DISPLAY 'PROC DATE PLUS 30 DAYS - ' PROC-DATE-PLUS-30DAYS    CAT24   
                                                                        CAT24   
           OPEN INPUT BROKER-FILE.                                      CAT24   
                                                                        CAT24   
           OPEN OUTPUT ACAT-SPAD-FILE.                                  CAT24   
                                                                        CAT24   
           IF BRKR-FILE-OK                                              CAT24   
             CONTINUE                                                   CAT24   
           ELSE                                                         CAT24   
             DISPLAY  'BROKER FILE OPEN ERROR, STATUS = '               CAT24   
                         BROKER-FILE-STATUS                             CAT24   
                                                                        CAT24   
             CALL ABEND          USING ABEND-CODE-2020.                 CAT24   
                                                                        CAT24   
           WRITE ACAT-SPAD-REC-3 FROM ACAT-SPAD-HDR.                    CAT24   
                                                                        CAT24   
           MOVE LOW-VALUES       TO  SPAD-MESG-REC.                     CAT24   
           MOVE ZERO             TO  SPM-APPL-NO.                       CAT24   
           MOVE SPACES           TO  SPM-TERMINAL-ID.                   CAT24   
           MOVE PROC-DATE-N      TO  SPM-DATE-ENTERED.                  CAT24   
                                                                        CAT24   
       100-HOUSEKEEPING-EXIT. EXIT.                                     CAT24   
           EJECT                                                        CAT24   
      ***************                                                   CAT24   
       200-INIT-B1-LOOP.                                                CAT24   
      ***************                                                   CAT24   
                                                                        CAT24   
           DISPLAY ' '.                                                 CAT24   
           DISPLAY  'B1 TABLE VALUES'.                                  CAT24   
           MOVE 0                      TO  B1-TBL-CNT.                  CAT24   
           ADD  1                      TO  B1-SUB.                      CAT24   
           PERFORM  UNTIL  B1-SUB  >  500                               CAT24   
                                                                        CAT24   
             MOVE  ' '                    TO  BH-BROKER-HEADER-INFO     CAT24   
             MOVE  B1-SUB                 TO  BH-BROKER-NUMBER-N        CAT24   
             MOVE  '010'                  TO  BH-LOGICAL-RECORD-CODE    CAT24   
             MOVE  ' '                    TO  BH-B2-INFO-ID             CAT24   
             CALL   GETB1V              USING BH-BROKER-HEADER-INFO     CAT24   
             END-CALL                                                   CAT24   
                                                                        CAT24   
             IF  BH-BROKER-ACTIVE                                       CAT24   
                                                                        CAT24   
               IF  BH-BROKER-MINI-MAXI-SUBGROUP  >  SPACES              CAT24   
                   MOVE  BH-BROKER-MINI-MAXI-SUBGROUP  TO               CAT24   
                         BH-BROKER-MINI-MAXI-INDICATOR                  CAT24   
               END-IF                                                   CAT24   
                                                                        CAT24   
               IF  PARM-STREAM  =  BH-BROKER-MINI-MAXI-INDICATOR        CAT24   
                   MOVE  B1-SUB              TO  BH-BROKER-NUMBER-N     CAT24   
                   MOVE  '015'               TO  BH-LOGICAL-RECORD-CODE CAT24   
                   MOVE  '434500'            TO  BH-B2-INFO-ID          CAT24   
                   CALL   GETB1V           USING BH-BROKER-HEADER-INFO, CAT24   
                                                 BH-ACAT-INFO           CAT24   
                   END-CALL                                             CAT24   
                   IF  BH-ACAT-ACTIVE                                   CAT24   
                   AND BH-ACAT-SERVICE-STATUS = '1'                             
                       ADD 1         TO B1-TBL-CNT                              
                       MOVE  B1-SUB            TO                       CAT24   
                             B1-ADP-CL-NO               (B1-TBL-CNT)    CAT24   
                       MOVE BH-BROKER-NAME     TO                       CAT24   
                             B1-CLI-NAME                (B1-TBL-CNT)    CAT24   
                       MOVE  BH-BROKER-OLD-CLEARING-HOUSE (2:4)  TO     CAT24   
                             B1-BKR-CLR-NO              (B1-TBL-CNT)    CAT24   
                                                                        CAT24   
                       MOVE  BH-ACAT-STATUS-SPAD-MESSAGES   TO          CAT24   
                             B1-SPAD-IND                (B1-TBL-CNT)    CAT24   
                   END-IF                                               CAT24   
               END-IF                                                   CAT24   
             END-IF                                                             
             ADD  1                      TO  B1-SUB                     CAT24   
           END-PERFORM.                                                 CAT24   
           DISPLAY ' '.                                                 CAT24   
       200-INIT-B1-LOOP-EXIT.   EXIT.                                   CAT24   
           EJECT                                                        CAT24   
      *****************                                                 CAT24   
       300-SORTIN-ROUTINE.                                              CAT24   
      *****************                                                 CAT24   
                                                                        CAT24   
           DISPLAY '*** ' PGM-NAME ' BEGINNING SORTINP ROUTINE ***'.    CAT24   
           MOVE 1   TO B1-SUB.                                          CAT24   
           EXEC SQL                                                             
                OPEN VTRNFR_CRSR                                                
           END-EXEC.                                                            
                                                                                
           PERFORM UNTIL ACAT-EOF                                       CAT24   
             EXEC SQL                                                   CAT24   
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
             END-EXEC                                                           
             EVALUATE SQLCODE                                                   
                WHEN +0                                                         
                  PERFORM 320-PROCESS-ACAT                                      
                         THRU 320-EXIT                                          
                WHEN +100                                                       
                  SET ACAT-EOF TO TRUE                                          
                WHEN OTHER                                                      
                  PERFORM SQL-ERROR-ROUTINE                                     
             END-EVALUATE                                                       
           END-PERFORM.                                                         
                                                                                
           EXEC SQL                                                             
              CLOSE VTRNFR_CRSR                                                 
           END-EXEC.                                                            
                                                                        CAT24   
       300-SORTIN-ROUTINE-EXIT.  EXIT.                                  CAT24   
                                                                        CAT24   
       320-PROCESS-ACAT.                                                CAT24   
                                                                        CAT24   
           IF  B1-WRK-ADP-CL-NO-X      NOT =                                    
                       CLIENT-NBR OF DCLVTRNFR (2 : 3)                          
             MOVE 'N'  TO B1-TABLE-SEARCH                                       
             PERFORM VARYING B1-SUB  FROM 1 BY 1                                
                   UNTIL B1-SUB  > B1-TBL-CNT                                   
               IF  B1-ADP-CL-NO-X (B1-SUB) =                                    
                         CLIENT-NBR OF DCLVTRNFR (2 : 3)                        
                 AND (B1-SPAD-IND (B1-SUB) = '1' OR '2')                        
                   MOVE B1-TABLE (B1-SUB) TO B1-WRK-TABLE                       
                   MOVE B1-TBL-CNT   TO B1-SUB                                  
                   MOVE 'Y' TO B1-TABLE-SEARCH                                  
               END-IF                                                           
             END-PERFORM                                                        
           END-IF.                                                              
                                                                                
           IF B1-ENTRY-NOT-FOUND                                                
               GO TO 320-EXIT.                                                  
                                                                                
           MOVE LOW-VALUES           TO  BROKER-KEY.                    CAT24   
           MOVE 'O'                  TO  BROKER-EXCHANGE.               CAT24   
           IF DSTBN-SIDE-CD OF DCLVTRNFR = 'R'                                  
              MOVE DLVR-NBR OF DCLVTRNFR TO CONTRA-BROKER                       
           ELSE                                                                 
              MOVE RCV-NBR OF DCLVTRNFR  TO CONTRA-BROKER                       
           END-IF.                                                              
           MOVE CONTRA-BROKER     TO BROKER-BADGE.                              
           START BROKER-FILE                                            CAT24   
                KEY IS NOT < BROKER-KEY.                                CAT24   
                                                                        CAT24   
           IF NOT BRKR-FILE-OK                                          CAT24   
C03575       MOVE 'OTHER BROKER' TO BRKR-NAME                           CAT24   
           ELSE                                                         CAT24   
            READ BROKER-FILE NEXT                                       CAT24   
            IF    BRKR-FILE-OK                                          CAT24   
              AND BROKER-EXCHANGE = 'O'                                 CAT24   
              AND BROKER-BADGE    = CONTRA-BROKER                       CAT24   
                 MOVE BROKER-NAME    TO BRKR-NAME                       CAT24   
            ELSE                                                                
C03575         MOVE 'OTHER BROKER' TO BRKR-NAME                         CAT24   
            END-IF                                                      CAT24   
           END-IF.                                                      CAT24   
                                                                        CAT24   
           MOVE ZERO              TO  SPM-APPL-NO.                      CAT24   
           MOVE B1-WRK-ADP-CL-NO  TO  SPM-CLT-ID.                       CAT24   
           MOVE BRANCH-CD OF DCLVTRNFR  TO  SPAD-WK-BR.                 CAT24   
           MOVE ACCT-CD OF DCLVTRNFR    TO  SPAD-WK-ACCT.               CAT24   
           MOVE SPAD-WORK-ACCOUNT TO SPM-USER-KEY.                      CAT24   
                                                                        CAT24   
           IF      SYS-RJCT-RSN-CD OF DCLVTRNFR NOT = SPACES            CAT24   
             OR    TRNFR-TYPE-RJCT-CD OF DCLVTRNFR NOT = SPACES         CAT24   
             PERFORM 560-ACAT-ERR-PROC                                  CAT24   
             GO TO 320-EXIT.                                                    
                                                                        CAT24   
           IF TRNFR-TYPE-CD OF DCLVTRNFR NOT = 'FUL'                    CAT24   
             PERFORM 555-ACAT-RES-CRED                                  CAT24   
             GO TO 320-EXIT.                                                    
                                                                        CAT24   
      * TO AND FROM MESSAGES GENERATED FOR NEW 1 (1ST DAY ON FILE)      CAT24   
      * TWO RECORDS ARE GENERATED (FROM IS RECEIVE) (TO IS DELIVER)     CAT24   
           IF     STTS-CD OF DCLVTRNFR = '100' OR '110'                 CAT24   
             AND  DAYS-STTS-QTY OF DCLVTRNFR = +1                       CAT24   
              MOVE PROC-DATE-PLUS-18MTHS-N TO  SPM-EXP-DATE-CCYYMMDD    CAT24   
              IF DSTBN-SIDE-CD OF DCLVTRNFR = 'R'                       CAT24   
DJ0001         IF B1-WRK-SPAD-IND = '1'                                 CAT24   
C05762          MOVE  PROC-DATE-PLUS-30DAYS-N TO SPM-EXP-DATE-CCYYMMDD  CAT24   
                MOVE '9348 '               TO  SPM-MESG                 CAT24   
                PERFORM 575-RELEASE-REC THRU                            CAT24   
                        575-RELEASE-REC-EXIT                            CAT24   
DJ0001         END-IF                                                   CAT24   
C05762          MOVE PROC-DATE-PLUS-18MTHS-N TO  SPM-EXP-DATE-CCYYMMDD  CAT24   
                MOVE CONTRA-BROKER         TO  SFM-CONTRA-BKR           CAT24   
                MOVE BRKR-NAME             TO  SFM-BKR-NAME             CAT24   
                MOVE ACCT-DLVR-NBR OF DCLVTRNFR                         CAT24   
                                           TO  SFM-CONTRA-ACCT          CAT24   
                MOVE SPAD-FROM-MSG         TO  SPM-MESG                 CAT24   
                MOVE 1                     TO  SPM-APPL-NO              CAT24   
              ELSE                                                      CAT24   
DJ0001         IF B1-WRK-SPAD-IND = '1'                                 CAT24   
                MOVE '9340 '               TO  SPM-MESG                 CAT24   
                PERFORM 575-RELEASE-REC THRU                            CAT24   
                        575-RELEASE-REC-EXIT                            CAT24   
DJ0001         END-IF                                                   CAT24   
                MOVE CONTRA-BROKER         TO  STM-CONTRA-BKR           CAT24   
                MOVE BRKR-NAME             TO  STM-BKR-NAME             CAT24   
                MOVE ACCT-DLVR-NBR OF DCLVTRNFR                         CAT24   
                                           TO  STM-CONTRA-ACCT          CAT24   
                MOVE SPAD-TO-MSG           TO  SPM-MESG                 CAT24   
                MOVE 1                     TO  SPM-APPL-NO              CAT24   
              END-IF                                                    CAT24   
             MOVE PROC-DATE-PLUS-18MTHS-N TO  SPM-EXP-DATE-CCYYMMDD     CAT24   
             PERFORM 575-RELEASE-REC THRU                               CAT24   
                     575-RELEASE-REC-EXIT                               CAT24   
             MOVE ZERO                  TO  SPM-APPL-NO                 CAT24   
             MOVE NEXT-PROC-DATE-N      TO  SPM-EXP-DATE-CCYYMMDD       CAT24   
             MOVE ACAT-CONTROL-NBR OF DCLVTRNFR (5 : 10)                CAT24   
                                        TO  SSM-CNTL-NO                 CAT24   
             MOVE 'REQ'                 TO  SSM-STATUS                  CAT24   
             IF STTS-CD OF DCLVTRNFR = '110'                                    
               MOVE 'REQ ADJ'           TO SSM-STATUS                           
             END-IF                                                             
             MOVE 1                     TO  SSM-STATUS-DAYS             CAT24   
             MOVE SPAD-STATUS-MSG       TO  SPM-MESG                    CAT24   
             PERFORM 575-RELEASE-REC THRU                               CAT24   
                     575-RELEASE-REC-EXIT                               CAT24   
             GO TO 320-EXIT.                                            CAT24   
                                                                        CAT24   
      * NOT NEW CREATE MESSAGE RECORD INDICATING CURRENT STATUS         CAT24   
           EVALUATE STTS-CD OF DCLVTRNFR                                CAT24   
            WHEN '100'                                                  CAT24   
             MOVE 'REQ'       TO   SSM-STATUS                           CAT24   
            WHEN '110'                                                  CAT24   
             MOVE 'REQ ADJ'   TO   SSM-STATUS                           CAT24   
            WHEN '120'                                                  CAT24   
             MOVE 'REQP ADJ'   TO   SSM-STATUS                          CAT24   
            WHEN '130'                                                  CAT24   
             MOVE 'REQ PAST'   TO   SSM-STATUS                          CAT24   
            WHEN '140'                                                  CAT24   
             MOVE 'REQ REJ'   TO   SSM-STATUS                           CAT24   
            WHEN '200'                                                  CAT24   
             MOVE 'REV     '   TO   SSM-STATUS                          CAT24   
            WHEN '210'                                                  CAT24   
             MOVE 'REV ADJ'   TO   SSM-STATUS                           CAT24   
            WHEN '220'                                                  CAT24   
             MOVE 'REV ERR'   TO   SSM-STATUS                           CAT24   
            WHEN '230'                                                  CAT24   
             MOVE 'REV XLE'   TO   SSM-STATUS                           CAT24   
            WHEN '300'                                                  CAT24   
             MOVE 'STL PREP'  TO   SSM-STATUS                           CAT24   
            WHEN '310'                                                  CAT24   
             MOVE 'STL CLOS'  TO   SSM-STATUS                           CAT24   
            WHEN '400'                                                  CAT24   
             MOVE 'CLS PUR'  TO   SSM-STATUS                            CAT24   
            WHEN '510'                                                  CAT24   
             MOVE 'MEM PUR'  TO   SSM-STATUS                            CAT24   
            WHEN '600'                                                  CAT24   
             MOVE 'REJECT '  TO   SSM-STATUS                            CAT24   
           END-EVALUATE.                                                CAT24   
                                                                        CAT24   
           IF STTS-CD OF DCLVTRNFR = '310' OR '400'                     CAT24   
             MOVE PROC-DATE-PLUS-18MTHS-N  TO  SPM-EXP-DATE-CCYYMMDD    CAT24   
             MOVE ZERO                   TO  SSM-STATUS-DAYS            CAT24   
           ELSE                                                         CAT24   
             MOVE DAYS-STTS-QTY OF DCLVTRNFR TO SSM-STATUS-DAYS         CAT24   
             MOVE NEXT-PROC-DATE-N       TO  SPM-EXP-DATE-CCYYMMDD.     CAT24   
                                                                        CAT24   
           MOVE ACAT-CONTROL-NBR OF DCLVTRNFR (5 : 10)                  CAT24   
                                         TO  SSM-CNTL-NO.               CAT24   
                                                                        CAT24   
           MOVE SPAD-STATUS-MSG          TO  SPM-MESG.                  CAT24   
           PERFORM 575-RELEASE-REC THRU                                 CAT24   
                   575-RELEASE-REC-EXIT.                                CAT24   
       320-EXIT.                                                        CAT24   
           EXIT.                                                        CAT24   
                                                                                
           EJECT                                                        CAT24   
       555-ACAT-RES-CRED.                                               CAT24   
                                                                        CAT24   
           IF DSTBN-SIDE-CD OF DCLVTRNFR = 'R'                          CAT24   
             MOVE 'FROM'      TO   SRSM-TYPE                            CAT24   
           ELSE                                                         CAT24   
             MOVE 'TO  '      TO   SRSM-TYPE.                           CAT24   
                                                                        CAT24   
           MOVE CONTRA-BROKER        TO  SRSM-CONTRA-BRKR.              CAT24   
           MOVE ACAT-CONTROL-NBR OF DCLVTRNFR (5 : 10)                  CAT24   
                                     TO  SRSM-CNTL-NO.                  CAT24   
                                                                        CAT24   
           MOVE DAYS-STTS-QTY OF DCLVTRNFR TO SRSM-STATUS-DAYS          CAT24   
           IF STTS-CD OF DCLVTRNFR < '300'                              CAT24   
             MOVE 'NEW'       TO   SRSM-STATUS                          CAT24   
           ELSE                                                         CAT24   
           IF STTS-CD OF DCLVTRNFR < '400'                              CAT24   
             MOVE 'SETTLE'    TO   SRSM-STATUS                          CAT24   
           ELSE                                                         CAT24   
             MOVE ZERO                    TO  SRSM-STATUS-DAYS          CAT24   
             MOVE 'CLOSED'    TO  SRSM-STATUS.                          CAT24   
                                                                        CAT24   
      * EXPIRATION DATE IS NEXT DAY                                     CAT24   
           MOVE NEXT-PROC-DATE-N          TO  SPM-EXP-DATE-CCYYMMDD.    CAT24   
                                                                        CAT24   
           MOVE TRNFR-TYPE-CD OF DCLVTRNFR TO SRSM-TRNFR-TYPE.          CAT24   
                                                                        CAT24   
           MOVE SPAD-RESIDUAL-STATUS-MSG  TO  SPM-MESG.                 CAT24   
           PERFORM 575-RELEASE-REC THRU                                 CAT24   
                   575-RELEASE-REC-EXIT.                                CAT24   
                                                                        CAT24   
           EJECT                                                        CAT24   
       560-ACAT-ERR-PROC.                                               CAT24   
                                                                        CAT24   
           IF      TRNFR-TYPE-RJCT-CD OF DCLVTRNFR NOT = SPACES         CAT24   
             MOVE  TRNFR-TYPE-RJCT-CD OF DCLVTRNFR                      CAT24   
                                      TO  SRM-REJECT-CODE               CAT24   
           ELSE                                                         CAT24   
             MOVE SYS-RJCT-RSN-CD OF DCLVTRNFR                          CAT24   
                                      TO  SRM-REJECT-CODE.              CAT24   
           MOVE ACAT-CONTROL-NBR OF DCLVTRNFR (5 : 10)                  CAT24   
                                   TO  SRM-CNTL-NO.                     CAT24   
           EVALUATE  SYS-RJCT-RSN-CD OF DCLVTRNFR                       CAT24   
             WHEN   '01'                                                CAT24   
               MOVE 'INVALID FIELD        '      TO  SRM-REJECT-EXPL    CAT24   
             WHEN   '02'                                                CAT24   
               MOVE 'MISSED CUTOFF        '      TO  SRM-REJECT-EXPL    CAT24   
             WHEN   '03'                                                CAT24   
               MOVE 'MISSING ASSOCIATED AT'      TO  SRM-REJECT-EXPL    CAT24   
             WHEN   '04'                                                CAT24   
               MOVE 'OUT OF SEQUENCE      '      TO  SRM-REJECT-EXPL    CAT24   
             WHEN   '05'                                                CAT24   
               MOVE 'INVALID PHYSICAL SEQ '      TO  SRM-REJECT-EXPL    CAT24   
             WHEN   '06'                                                CAT24   
               MOVE 'LOGICAL OUT OF SEQ   '      TO  SRM-REJECT-EXPL    CAT24   
             WHEN   '07'                                                CAT24   
               MOVE 'INVALID LOGICAL SEQ  '      TO  SRM-REJECT-EXPL    CAT24   
             WHEN   '08'                                                CAT24   
               MOVE 'INVALID LENGTH       '      TO  SRM-REJECT-EXPL    CAT24   
             WHEN   '09'                                                CAT24   
               MOVE 'INVALID RECORD CONT. '      TO  SRM-REJECT-EXPL    CAT24   
             WHEN   '10'                                                CAT24   
               MOVE 'INVALID ADD          '      TO  SRM-REJECT-EXPL    CAT24   
             WHEN   '11'                                                CAT24   
               MOVE 'INVALID CHANGE       '      TO  SRM-REJECT-EXPL    CAT24   
             WHEN   '12'                                                CAT24   
               MOVE 'INVALID DELETE       '      TO  SRM-REJECT-EXPL    CAT24   
             WHEN   '13'                                                CAT24   
               MOVE 'INVALID ACTION       '      TO  SRM-REJECT-EXPL    CAT24   
             WHEN   '14'                                                CAT24   
               MOVE 'INVALID FOR CONTRA   '      TO  SRM-REJECT-EXPL    CAT24   
             WHEN   '15'                                                CAT24   
               MOVE 'INVALID TRANSACTION  '      TO  SRM-REJECT-EXPL    CAT24   
             WHEN   '16'                                                CAT24   
               MOVE 'INVALID PARTICIPANT  '      TO  SRM-REJECT-EXPL    CAT24   
           END-EVALUATE.                                                        
                                                                                
           EVALUATE TRNFR-TYPE-RJCT-CD OF DCLVTRNFR                     CAT24   
             WHEN   '01'                                                CAT24   
               MOVE 'SS ID MISMATCH       '      TO  SRM-REJECT-EXPL    CAT24   
             WHEN   '02'                                                CAT24   
               MOVE 'ACCT TITLE MISMATCH  '      TO  SRM-REJECT-EXPL    CAT24   
             WHEN   '03'                                                CAT24   
               MOVE 'DOCUMENT NEEDED'            TO  SRM-REJECT-EXPL    CAT24   
             WHEN   '04'                                                CAT24   
               MOVE 'ACCT FLAT'                  TO  SRM-REJECT-EXPL    CAT24   
             WHEN   '05'                                                CAT24   
               MOVE 'INVALID ACCT'               TO  SRM-REJECT-EXPL    CAT24   
             WHEN   '06'                                                CAT24   
               MOVE 'DUPLICATE'                  TO  SRM-REJECT-EXPL    CAT24   
             WHEN   '07'                                                CAT24   
               MOVE 'ACCT IN DIST OR XFER'       TO  SRM-REJECT-EXPL    CAT24   
             WHEN   '08'                                                CAT24   
               MOVE 'CLIENT RESCINDED'           TO  SRM-REJECT-EXPL    CAT24   
             WHEN   '09'                                                CAT24   
               MOVE 'MISSING AUTH SIG'           TO  SRM-REJECT-EXPL    CAT24   
             WHEN   '21'                                                CAT24   
               MOVE 'VIOLATES CRED POLICY'       TO  SRM-REJECT-EXPL    CAT24   
             WHEN   '22'                                                CAT24   
               MOVE 'UNRECOGNIZED RCR'           TO  SRM-REJECT-EXPL    CAT24   
             WHEN   '23'                                                CAT24   
               MOVE 'UNRECOGNIZED PTD'           TO  SRM-REJECT-EXPL    CAT24   
             WHEN   '24'                                                CAT24   
               MOVE 'UNRECOGNIZED FRV'           TO  SRM-REJECT-EXPL    CAT24   
             WHEN   '25'                                                CAT24   
               MOVE 'UNRECOGNIZED RCL'           TO  SRM-REJECT-EXPL    CAT24   
             WHEN   '26'                                                CAT24   
               MOVE 'UNRECOGNIZED CRD'           TO  SRM-REJECT-EXPL    CAT24   
           END-EVALUATE.                                                CAT24   
           MOVE SPAD-REJECT-MSG                TO  SPM-MESG.            CAT24   
           MOVE PROC-DATE-PLUS-18MTHS-N     TO  SPM-EXP-DATE-CCYYMMDD.  CAT24   
           PERFORM 575-RELEASE-REC THRU                                 CAT24   
                   575-RELEASE-REC-EXIT.                                CAT24   
                                                                        CAT24   
                                                                        CAT24   
       575-RELEASE-REC.                                                 CAT24   
                                                                        CAT24   
           RELEASE SORT-REC FROM ACAT-SPAD-REC.                         CAT24   
           ADD 1 TO ACAT-ACPT-RECS.                                     CAT24   
       575-RELEASE-REC-EXIT.  EXIT.                                     CAT24   
      *****************                                                 CAT24   
       600-SORTOUT-ROUTINE  SECTION.                                    CAT24   
      *****************                                                 CAT24   
                                                                        CAT24   
           DISPLAY '*** ' PGM-NAME ' BEGINNING SORTOUT ROUTINE ***'.    CAT24   
                                                                        CAT24   
           IF ACAT-ACPT-RECS = ZERO                                     CAT24   
             GO TO 600-SORTOUT-ROUTINE-EXIT.                            CAT24   
                                                                        CAT24   
       610-NEXT-REC.                                                    CAT24   
                                                                        CAT24   
           RETURN SORT-FILE INTO ACAT-SPAD-REC                          CAT24   
             AT END GO TO 600-SORTOUT-ROUTINE-EXIT.                     CAT24   
                                                                        CAT24   
           IF SPM-APPL-NO = 1                                           CAT24   
             MOVE ZERO TO SPM-APPL-NO.                                  CAT24   
                                                                        CAT24   
           IF ACAT-FIRST-TIME                                           CAT24   
             MOVE 'N'             TO ACAT-FIRST-TIME-SW                 CAT24   
             MOVE ACAT-SPAD-REC (1:20) TO SAVE-KEY                      CAT24   
             MOVE 001                  TO MSGNO                         CAT24   
             MOVE MSGNO                TO SPM-MESG-NO                   CAT24   
             PERFORM 700-OUTPUT THRU                                    CAT24   
                     700-OUTPUT-EXIT                                    CAT24   
             GO TO 610-NEXT-REC.                                        CAT24   
                                                                        CAT24   
           IF ACAT-SPAD-REC (1:20) = SAVE-KEY                           CAT24   
             ADD   1         TO  MSGNO                                  CAT24   
             MOVE  MSGNO     TO  SPM-MESG-NO                            CAT24   
             PERFORM 700-OUTPUT THRU                                    CAT24   
                     700-OUTPUT-EXIT                                    CAT24   
             GO TO 610-NEXT-REC.                                        CAT24   
                                                                        CAT24   
           MOVE ACAT-SPAD-REC (1:20) TO SAVE-KEY.                       CAT24   
           MOVE 001                  TO MSGNO.                          CAT24   
           MOVE MSGNO                TO SPM-MESG-NO.                    CAT24   
           PERFORM 700-OUTPUT THRU                                      CAT24   
                   700-OUTPUT-EXIT.                                     CAT24   
           GO TO 610-NEXT-REC.                                          CAT24   
                                                                        CAT24   
       600-SORTOUT-ROUTINE-EXIT.  EXIT.                                 CAT24   
                                                                        CAT24   
       700-OUTPUT.                                                      CAT24   
                                                                        CAT24   
           IF ACAT-FIRST-WRITE                                          CAT24   
             MOVE 'N'              TO  ACAT-FIRST-WRITE-SW              CAT24   
             MOVE SPAD-REC (1:12)  TO  PREV-KEY                         CAT24   
                                       SPH-KEY                          CAT24   
             MOVE 'H'              TO  ACAT-TYPE-WRITE                  CAT24   
             PERFORM 750-WRITE-MESSAGE THRU                             CAT24   
                     750-WRITE-MESSAGE-EXIT                             CAT24   
             MOVE 'D'              TO  ACAT-TYPE-WRITE                  CAT24   
             PERFORM 750-WRITE-MESSAGE THRU                             CAT24   
                     750-WRITE-MESSAGE-EXIT                             CAT24   
             GO TO 700-OUTPUT-EXIT.                                     CAT24   
                                                                        CAT24   
           IF SPAD-REC (1:12) = PREV-KEY                                CAT24   
             MOVE 'D'              TO  ACAT-TYPE-WRITE                  CAT24   
             PERFORM 750-WRITE-MESSAGE THRU                             CAT24   
                     750-WRITE-MESSAGE-EXIT                             CAT24   
             GO TO 700-OUTPUT-EXIT.                                     CAT24   
                                                                        CAT24   
      * KEY (CLIENT, BRANCH AND ACCOUNT) HAS CHANGED                    CAT24   
                                                                        CAT24   
           MOVE PREV-KEY TO SPT-KEY.                                    CAT24   
           MOVE 'T'                TO  ACAT-TYPE-WRITE.                 CAT24   
           PERFORM 750-WRITE-MESSAGE THRU                               CAT24   
                   750-WRITE-MESSAGE-EXIT.                              CAT24   
           MOVE SPAD-REC (1:12)  TO  PREV-KEY                           CAT24   
                                     SPH-KEY.                           CAT24   
           MOVE 'H'              TO  ACAT-TYPE-WRITE.                   CAT24   
           PERFORM 750-WRITE-MESSAGE THRU                               CAT24   
                   750-WRITE-MESSAGE-EXIT.                              CAT24   
           MOVE 'D'              TO  ACAT-TYPE-WRITE.                   CAT24   
           PERFORM 750-WRITE-MESSAGE THRU                               CAT24   
                   750-WRITE-MESSAGE-EXIT.                              CAT24   
                                                                        CAT24   
       700-OUTPUT-EXIT. EXIT.                                           CAT24   
                                                                        CAT24   
       750-WRITE-MESSAGE.                                               CAT24   
                                                                        CAT24   
           IF WRITE-HDR                                                 CAT24   
             WRITE ACAT-SPAD-REC-1 FROM SPAD-HDR                        CAT24   
             ADD 1  TO  ACAT-SPAD-HDRS                                  CAT24   
             GO TO 750-WRITE-MESSAGE-EXIT.                              CAT24   
                                                                        CAT24   
           IF WRITE-DATA                                                CAT24   
             WRITE ACAT-SPAD-REC-2 FROM ACAT-SPAD-REC                   CAT24   
             ADD 1  TO  ACAT-SPAD-RECS                                  CAT24   
             GO TO 750-WRITE-MESSAGE-EXIT.                              CAT24   
                                                                        CAT24   
           IF WRITE-TRLR                                                CAT24   
             ADD 1  TO  ACAT-SPAD-TRLRS                                 CAT24   
             WRITE ACAT-SPAD-REC-3 FROM SPAD-TRLR.                      CAT24   
                                                                        CAT24   
       750-WRITE-MESSAGE-EXIT. EXIT.                                    CAT24   
                                                                        CAT24   
       900-ENDJOB-ROUTINE.                                              CAT24   
                                                                        CAT24   
           IF ACAT-ACPT-RECS = ZERO                                     CAT24   
             GO TO 925-DISPLAY-TOTALS.                                  CAT24   
                                                                        CAT24   
           MOVE PREV-KEY TO SPT-KEY.                                    CAT24   
           MOVE 'T'                TO  ACAT-TYPE-WRITE.                 CAT24   
           PERFORM 750-WRITE-MESSAGE THRU                               CAT24   
                   750-WRITE-MESSAGE-EXIT.                              CAT24   
                                                                        CAT24   
       925-DISPLAY-TOTALS.                                              CAT24   
           DISPLAY 'ACAT RCDS ACCEPTED        '     ACAT-ACPT-RECS.     CAT24   
           DISPLAY 'ACAT SPAD HDRS WRTN       '     ACAT-SPAD-HDRS.     CAT24   
           DISPLAY 'ACAT SPAD MSG RECS WRTN   '     ACAT-SPAD-RECS.     CAT24   
           DISPLAY 'ACAT SPAD TRLRS WRTN      '     ACAT-SPAD-TRLRS.    CAT24   
                                                                        CAT24   
           CLOSE ACAT-SPAD-FILE                                         CAT24   
                 BROKER-FILE.                                           CAT24   
                                                                        CAT24   
           IF BRKR-FILE-OK                                              CAT24   
             NEXT SENTENCE                                              CAT24   
           ELSE                                                         CAT24   
             DISPLAY 'BROKER FILE CLOSE ERROR, STATUS = '               CAT24   
              BROKER-FILE-STATUS.                                       CAT24   
                                                                        CAT24   
       900-ENDJOB-ROUTINE-EXIT. EXIT.                                   CAT24   
                                                                                
       SQL-ERROR-ROUTINE.                                                       
                                                                        CAT710  
           CALL DSNTIAR               USING  SQLCA                      CAT710  
                                             WS-DB2-MESSAGE-AREA        CAT710  
                                             WS-ERR-LINE-LEN            CAT710  
                                                                        CAT710  
           DISPLAY ' '                                                  CAT710  
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                   CAT710  
              UNTIL WS-ERROR-INDEX GREATER THAN 12                      CAT710  
                 IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES              CAT710  
                    DISPLAY '*** ' WS-ERROR-MSG (WS-ERROR-INDEX)        CAT710  
                 END-IF                                                 CAT710  
           END-PERFORM                                                  CAT710  
           DISPLAY ' '                                                  CAT710  
           DISPLAY ' *** CAT680 ABENDED ****'                           CAT710  
           DISPLAY ' ACAT-CONTROL-NBR = ' ACAT-CONTROL-NBR OF DCLVTRNFR CAT710  
           DISPLAY ' '                                                  CAT710  
           CALL ABEND      USING DB2-ABEND-CODE.                        CAT710  
                                                                        CAT710  
