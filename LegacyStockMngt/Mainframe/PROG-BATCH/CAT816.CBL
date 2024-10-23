000001* PDX    - CAT816   C0252012 08/13/07 10:33:50 TBDOJUN            00001000
      * DJ0001 - SSR51272 REMOVE "ADP" FROM HEADING                     00001000
000001* PDX    - CAT816   C0228004 11/18/05 16:06:13 TBEDTAK            00001000
      * ET0003 - SSR25386 INCLUDE MEMO ITEMS (STTLM-LCTN-CD = '45').    00001000
000001* PDX    - CAT816   C0218852 03/23/05 14:53:29 TBEDTAK            00001000
      * ET0002 - SSR39561 ADD PTR WITHHELD ASSETS (PTR PHASE II)        00001000
000001* PDX    - CAT816   C0214955 12/28/04 10:25:19 TBEDTAK            00001000
      * ET0001 - SSR40042 DB2 INITIAL TBL KEY CHANGE WITH NEW TBL NAME  00001000
000001* PDX    - CAT816   C0155513 03/12/01 07:56:09 TBDOJUN            00001000
000001* PDX    - CAT816   C0121087 01/31/99 10:59:47 TBDOJUN            00001000
000001* PDX    - CAT816   C0120784 01/28/99 12:28:28 TBDOJUN            99/01/31
000001* PDX    - CAT816   C0119296 12/22/98 16:43:31 TBDOJUN            CAT816  
       IDENTIFICATION DIVISION.                                         CAT816  
       PROGRAM-ID.    CAT816.                                           CAT816  
      ***************************************************************** CAT816  
      * THIS PROGRAM CONTAINS DB2.                                    * CAT816  
      ***************************************************************** CAT816  
      *    ACATS - WITHHELD ASSET        REPORT                         CAT816  
      *                                                                 CAT816  
      *    SORT                                                         CAT816  
      *                                                                 CAT816  
      *    USE B1 TO GET CLIENT NAME                                    CAT816  
      *                                                                 CAT816  
      *    INPUT   :                                                    CAT816  
      *            1) ACATS INIT ASSET TABLE   I/P - DB2 DATABASE       CAT816  
      *    OUTPUT  :                                                    CAT816  
      *            1) BXXX.CAT816.WHDPI        O/P - REPORT             CAT816  
      *                                                                 CAT816  
      *---------------------------------------------------------------* CAT816  
      * 12/12/98 DJ  - NEW ACATS PROGRAM                              * CAT816  
      *---------------------------------------------------------------* CAT816  
      /                                                                 CAT816  
       ENVIRONMENT DIVISION.                                            CAT816  
       INPUT-OUTPUT SECTION.                                            CAT816  
       FILE-CONTROL.                                                    CAT816  
                                                                        CAT816  
           SELECT REPT-FILE              ASSIGN TO UT-S-REPORT          CAT816  
                                         FILE STATUS IS REPT-STAT.      CAT816  
                                                                        CAT816  
           SELECT SORT-FILE              ASSIGN TO  UT-S-SORTWK01.      CAT816  
      /                                                                 CAT816  
       DATA DIVISION.                                                   CAT816  
       FILE SECTION.                                                    CAT816  
       FD  REPT-FILE                                                    CAT816  
           RECORDING MODE IS F.                                         CAT816  
                                                                        CAT816  
       01  REPT-REC.                                                    CAT816  
           03 REPT-LINE             PIC  X(133).                        CAT816  
           03 REPT-CLT              PIC S9(003) COMP-3.                 CAT816  
           03 REPT-FIL              PIC  X(008).                        CAT816  
      /                                                                 CAT816  
       SD  SORT-FILE.                                                   CAT816  
                                                                        CAT816  
       01  SORT-RECORD.                                                 CAT816  
           03 SORT-KEY              PIC  X(028).                        CAT816  
           03 SORT-BODY             PIC  X(372).                        CAT816  
      /                                                                 CAT816  
       WORKING-STORAGE SECTION.                                         CAT816  
       COPY PDXIDCOB.                                                   CAT816  
                                                                        CAT816  
       01  W-FIELDS.                                                    CAT816  
           05  W-ROUTINE-1               PIC  X(32) VALUE ' '.          CAT816  
           05  W-FIRST-TIME-SW           PIC  X(01) VALUE '0'.          CAT816  
               88 NOT-FIRST-TIME                    VALUE '1'.          CAT816  
           05  INFILE-STAT               PIC  X(02) VALUE '00'.         CAT816  
               88  INFILE-OKAY           VALUE '00' THRU '09', '97'.    CAT816  
               88  INFILE-END-OF-FILE    VALUE '10'.                    CAT816  
               88  INFILE-DUPE-REC       VALUE '22'.                    CAT816  
               88  INFILE-NOTFND         VALUE '23'.                    CAT816  
               88  INFILE-EMPTY          VALUE '35'.                    CAT816  
           05  INFILE-DATE-SW            PIC  X(01) VALUE '0'.          CAT816  
               88 INFILE-DATE-FOUND                 VALUE '1'.          CAT816  
           05  END-OF-INFILE-SW          PIC  X(01) VALUE '0'.          CAT816  
               88 END-OF-INFILE                     VALUE '1'.          CAT816  
           05  END-OF-SORT-SW            PIC  X(01) VALUE '0'.          CAT816  
               88 END-OF-SORT                       VALUE '1'.          CAT816  
           05  REPT-STAT                 PIC  X(02) VALUE '00'.         CAT816  
               88 REPT-OKAY                         VALUE '00'.         CAT816  
           05  W-INFILE-CNT              PIC  9(11) VALUE 0.            CAT816  
           05  W-DETAIL-CNT              PIC  9(11) VALUE 0.            CAT816  
           05  W-RELEASE-CNT             PIC  9(11) VALUE 0.            CAT816  
           05  W-RETURN-CNT              PIC  9(11) VALUE 0.            CAT816  
           05  W-PAGE-CNT                PIC  9(11) VALUE 0.            CAT816  
           05  W-LINE-CNT                PIC  9(11) VALUE 60.           CAT816  
           05  W-LOAD-CNT                PIC  9(11) VALUE 60.           CAT816  
           05  LD-PROC-DATE.                                            CAT816  
               10 LD-PROC-DATE-MM        PIC  X(02).                    CAT816  
               10 LD-PROC-DATE-DD        PIC  X(02).                    CAT816  
               10 LD-PROC-DATE-YY        PIC  X(02).                    CAT816  
           05  W-PROC-DATE.                                             CAT816  
               10 W-PROC-DATE-CC         PIC  X(02).                    CAT816  
               10 W-PROC-DATE-YY         PIC  X(02).                    CAT816  
               10 W-PROC-DATE-MM         PIC  X(02).                    CAT816  
               10 W-PROC-DATE-DD         PIC  X(02).                    CAT816  
           05  W-PROC-DATE-N REDEFINES                                  CAT816  
               W-PROC-DATE               PIC  9(008).                   CAT816  
           05  W-SYS-DATE                PIC  9(006) VALUE 0.           CAT816  
           05  FILLER  REDEFINES                                        CAT816  
               W-SYS-DATE.                                              CAT816  
               10  W-SYS-YY              PIC  X(002).                   CAT816  
               10  W-SYS-MM              PIC  X(002).                   CAT816  
               10  W-SYS-DD              PIC  X(002).                   CAT816  
           05  W-SYS-TIME                PIC  9(008) VALUE 0.           CAT816  
           05  FILLER  REDEFINES                                        CAT816  
               W-SYS-TIME.                                              CAT816  
               10  W-SYS-HH              PIC  X(002).                   CAT816  
               10  W-SYS-MN              PIC  X(002).                   CAT816  
               10  W-SYS-SS              PIC  X(002).                   CAT816  
               10  W-SYS-MS              PIC  X(002).                   CAT816  
           05  W-REPT-CLT                PIC  9(03) VALUE 0.            CAT816  
           05  W-REPT-LINE               PIC  X(133).                   CAT816  
           05  W-CLT-CNT                 PIC  9(11) VALUE 0.            CAT816  
       01  W-PREV-AREA.                                                 CAT816  
           05  W-PREV-CLIENT-NBR         PIC X(0004).                   CAT816  
           05  W-PREV-CONTROL-NBR        PIC X(0014).                   CAT816  
           05  W-PREV-RCV-NBR            PIC X(0004).                   CAT816  
           05  W-PREV-RCV-ACCT           PIC X(0020).                   CAT816  
                                                                        CAT816  
       01  W-FETCH-AREA.                                                CAT816  
           05  WF-CLIENT-NBR          PIC X(4).                         CAT816  
           05  WF-ACAT-CONTROL-NBR    PIC X(14).                        CAT816  
           05  WF-SBMTG-PRTCP-NBR     PIC X(4).                         CAT816  
           05  WF-DLVR-NBR            PIC X(4).                         CAT816  
           05  WF-ACCT-DLVR-NBR       PIC X(20).                        CAT816  
           05  WF-RCV-NBR             PIC X(4).                         CAT816  
           05  WF-ACCT-RCV-NBR        PIC X(20).                        CAT816  
           05  WF-TRNFR-TYPE-CD       PIC X(3).                         CAT816  
           05  WF-TRANS-TYPE-CD       PIC X(1).                         CAT816  
           05  WF-PRCS-DT             PIC X(10).                        CAT816  
           05  WF-STTS-CD             PIC X(3).                         CAT816  
           05  WF-NSCC-PEND-CD        PIC X(1).                         CAT816  
           05  WF-TRANS-RFRN-ID-CD    PIC X(20).                        CAT816  
           05  WF-DSTBN-SIDE-CD       PIC X(1).                         CAT816  
                                                                        CAT816  
       01  W-CURRENT-FIELDS.                                            CAT816  
           05  W-CURR-CLIENT             PIC X(004).                    CAT816  
           05  W-CURR-CLIENT-N REDEFINES                                CAT816  
               W-CURR-CLIENT             PIC 9(004).                    CAT816  
           05  W-CURR-BROKER             PIC X(004).                    CAT816  
           05  W-CURR-STREAM             PIC X(001).                    CAT816  
           05  W-CURR-CTL-NBR            PIC X(014).                    CAT816  
           05  W-CURR-SEQ-NBR            PIC S9(4) USAGE COMP.          CAT816  
           05  W-CURR-ISIN-CNTRY-CD      PIC X(2).                      CAT816  
           05  W-CURR-ISIN-SEC-ISSUE-CD  PIC X(9).                      CAT816  
           05  W-CURR-ISIN-SEC-CDG-CD    PIC X(1).                      CAT816  
           05  W-CURR-STTLM-LCTN-CD      PIC X(2).                      CAT816  
           05  W-CURR-CSH-MGN-SHRT-CD    PIC X(1).                      CAT816  
                                                                        CAT816  
      /                                                                 CAT816  
       01  FILLER                        PIC X(008) VALUE 'W-SORT'.     CAT816  
                                                                        CAT816  
       01  W-SORT-RECORD.                                               CAT816  
        03  W-SORT-REC.                                                 CAT816  
         05  W-SORT-KEY.                                                CAT816  
           10  W-SORT-CLIENT-NBR               PIC X(0004).             CAT816  
           10  W-SORT-CLIENT-NBR-N REDEFINES                            CAT816  
               W-SORT-CLIENT-NBR               PIC 9(0004).             CAT816  
           10  W-SORT-ACAT-CONTROL-NBR         PIC X(0014).             CAT816  
           10  W-SORT-ISIN-SEC-ISSUE-CD        PIC X(0009).             CAT816  
           10  W-SORT-CSH-MGN-SHRT-CD          PIC X(0001).             CAT816  
         05  W-SORT-DATA.                                               CAT816  
           10  W-SORT-PSTN-CD                  PIC X(0001).             CAT816  
               88  W-SORT-LONG                 VALUE 'L'.               CAT816  
               88  W-SORT-SHORT                VALUE 'S'.               CAT816  
           10  W-SORT-QTY                      PIC 9(12)V9(5).          CAT816  
           10  W-SORT-AMT                      PIC 9(12)V9(5).          CAT816  
           10  W-SORT-ASSET-PRC-CTGY-CD        PIC X(0004).             CAT816  
           10  W-SORT-STTLM-LCTN-CD            PIC X(0002).             CAT816  
           10  W-SORT-STTLM-RSN-CD             PIC X(0004).             CAT816  
           10  W-SORT-SECURITY-ADP-NBR         PIC X(0007).             CAT816  
           10  W-SORT-RCV-NBR                  PIC X(0004).             CAT816  
           10  W-SORT-ASSET-DESC-TXT.                                   CAT816  
               15  W-SORT-DESC1                PIC X(0030).             CAT816  
               15  W-SORT-DESC2                PIC X(0030).             CAT816  
               15  W-SORT-DESC3                PIC X(0030).             CAT816  
               15  W-SORT-DESC4                PIC X(0030).             CAT816  
               15  W-SORT-DESC5                PIC X(0020).             CAT816  
ET0003     10  W-SORT-WITHHELD-CD              PIC X(0001).             CAT816  
ET0003**   10  FILLER                          PIC X(0176).             CAT816  
ET0003     10  FILLER                          PIC X(0175).             CAT816  
                                                                        CAT816  
      /                                                                 CAT816  
       01  FILLER                        PIC X(008) VALUE 'B1-TABLE'.   CAT816  
       01  B1-TABLE-AREA.                                               CAT816  
           03  B1-TABLE OCCURS 500 TIMES.                               CAT816  
               05  B1-CLT-NBR               PIC 9(04).                  CAT816  
               05  B1-CLT-NAME              PIC X(30).                  CAT816  
               05  B1-BKR-CLR-NO            PIC X(04).                  CAT816  
               05  B1-STREAM                PIC X(01).                  CAT816  
               05  B1-STATUS                PIC X(01).                  CAT816  
               05  B1-ACAT-STATUS           PIC X(01).                  CAT816  
               05  B1-PRINT                 PIC X(01).                  CAT816  
       01  B1-WORK-FIELEDS.                                             CAT816  
           03  B1-TBL-CNT                   PIC 9(03) VALUE 0.          CAT816  
           03  B1-SUB                       PIC 9(03) VALUE 0.          CAT816  
           03  B1-ACTIVE-CNT                PIC 9(03) VALUE 0.          CAT816  
           03  B1-PRT-SUB                   PIC 9(04) VALUE 0.          CAT816  
      /                                                                 CAT816  
      ******************************************************************CAT816  
      * B1 HEADER                                                      *CAT816  
      ******************************************************************CAT816  
       01  FILLER                        PIC X(08) VALUE 'BHINFO  '.    CAT816  
           COPY BHINFO.                                                 CAT816  
      /                                                                 CAT816  
      ******************************************************************CAT816  
      * B1 ACAT SECTION                                                *CAT816  
      ******************************************************************CAT816  
       01  FILLER                        PIC X(08) VALUE 'BHACAT  '.    CAT816  
           COPY BHACAT.                                                 CAT816  
      /                                                                 CAT816  
      ******************************************************************CAT816  
      * B1 BTS2 SECTION - OLD ACATS B1                                 *CAT816  
      ******************************************************************CAT816  
       01  FILLER                        PIC X(08) VALUE 'BHBTS2  '.    CAT816  
           COPY BHBTS2.                                                 CAT816  
      /                                                                 CAT816  
      ******************************************************************CAT816  
      * B1 MF   SECTION - MUTUAL FUNDS                                 *CAT816  
      ******************************************************************CAT816  
       01  FILLER                        PIC X(08) VALUE 'BHMF    '.    CAT816  
           COPY BHMF.                                                   CAT816  
      /                                                                 CAT816  
      ******************************************************************CAT816  
      * BPDATE COMMAREA                                                *CAT816  
      ******************************************************************CAT816  
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.   CAT816  
                                                                        CAT816  
           COPY BPDATESC.                                               CAT816  
      /                                                                 CAT816  
      ******************************************************************CAT816  
      * TRANSFER ACTIVE TABLE                                          *CAT816  
      ******************************************************************CAT816  
       01  FILLER                        PIC X(008) VALUE 'VTRNFR  '.   CAT816  
           EXEC SQL INCLUDE VTRNFR       END-EXEC.                      CAT816  
                                                                        CAT816  
      ******************************************************************CAT816  
      * ASSET    INIT   TABLE                                          *CAT816  
      ******************************************************************CAT816  
ET0001*01  FILLER                        PIC X(008) VALUE 'VINITAST'.   CAT816  
ET0001*    EXEC SQL INCLUDE VINITAST     END-EXEC.                      CAT816  
                                                                        CAT816  
ET0001 01  FILLER                        PIC X(008) VALUE 'ACTIAST '.   CAT816  
ET0001     EXEC SQL INCLUDE ACTIAST      END-EXEC.                      CAT816  
                                                                        CAT816  
      ******************************************************************CAT816  
      * MF       INIT   TABLE                                          *CAT816  
      ******************************************************************CAT816  
ET0001*01  FILLER                        PIC X(008) VALUE 'VINITMF '.   CAT816  
ET0001*    EXEC SQL INCLUDE VINITMF      END-EXEC.                      CAT816  
                                                                        CAT816  
ET0001 01  FILLER                        PIC X(008) VALUE 'ACTIMF  '.   CAT816  
ET0001     EXEC SQL INCLUDE ACTIMF       END-EXEC.                      CAT816  
                                                                        CAT816  
      ******************************************************************CAT816  
      * OPTION   INIT   TABLE                                          *CAT816  
      ******************************************************************CAT816  
ET0001*01  FILLER                        PIC X(008) VALUE 'VINITOPN'.   CAT816  
ET0001*    EXEC SQL INCLUDE VINITOPN     END-EXEC.                      CAT816  
                                                                        CAT816  
ET0001 01  FILLER                        PIC X(008) VALUE 'ACTIOPN '.   CAT816  
ET0001     EXEC SQL INCLUDE ACTIOPN      END-EXEC.                      CAT816  
                                                                        CAT816  
      ******************************************************************CAT816  
      * DB2 COMMAREA                                                   *CAT816  
      ******************************************************************CAT816  
       01  FILLER                        PIC X(008) VALUE 'SQLCA   '.   CAT816  
           EXEC SQL INCLUDE SQLCA        END-EXEC.                      CAT816  
                                                                        CAT816  
      ******************************************************************CAT816  
      * DB2 ERROR MESSAGE AREA                                         *CAT816  
      ******************************************************************CAT816  
       01  W-DB2-MESSAGE-AREA.                                          CAT816  
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.    CAT816  
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES     CAT816  
                   INDEXED BY W-DB2-IDX.                                CAT816  
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.     CAT816  
                                                                        CAT816  
       01  W-DB2-WORKAREA.                                              CAT816  
           05  ROLLBACK-SQLCA            PIC  X(122).                   CAT816  
           05  ROLLBACK-RETURN           PIC S9(009) COMP.              CAT816  
               88  ROLLBACK-OK                VALUE +0.                 CAT816  
               88  ROLLBACK-AB                VALUE -999 THRU -1        CAT816  
                                                    +1   THRU +999.     CAT816  
           05  COMMIT-SQLCA              PIC  X(122).                   CAT816  
           05  COMMIT-RETURN             PIC S9(009) COMP.              CAT816  
               88  COMMIT-OK                  VALUE +0.                 CAT816  
               88  COMMIT-AB                  VALUE -999 THRU -1        CAT816  
                                                    +1   THRU +999.     CAT816  
           05  W-COMMIT-CTR              PIC  9(009) COMP-3             CAT816  
                                              VALUE 0.                  CAT816  
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(011) VALUE 0.           CAT816  
           05  W-DB2-TABLE-NAME          PIC  X(008).                   CAT816  
           05  W-DB2-ACTION              PIC  X(008).                   CAT816  
           05  W-DB2-SQLCODE             PIC ---9.                      CAT816  
                                                                        CAT816  
       01  FILLER                        PIC  X(008) VALUE 'TIMESTMP'.  CAT816  
       01  W-CURRENT-TIMESTAMP           PIC  X(026).                   CAT816  
      /                                                                 CAT816  
      ******************************************************************CAT816  
      * DECLARE CURSOR FOR INIT ASSET      TABLE                       *CAT816  
      ******************************************************************CAT816  
       01  FILLER                        PIC X(008) VALUE 'CURSOR '.    CAT816  
           EXEC SQL                                                     CAT816  
                DECLARE VINITAST_CURSOR CURSOR WITH HOLD FOR            CAT816  
                SELECT                                                  CAT816  
                    CLIENT_NBR                                          CAT816  
                   ,DLVR_NBR                                            CAT816  
                   ,ACCT_DLVR_NBR                                       CAT816  
                   ,RCV_NBR                                             CAT816  
                   ,ACCT_RCV_NBR                                        CAT816  
                   ,ISIN_CNTRY_CD                                       CAT816  
                   ,ISIN_SEC_ISSUE_CD                                   CAT816  
                   ,ISIN_SEC_CDG_CD                                     CAT816  
                   ,STTLM_LCTN_CD                                       CAT816  
                   ,CSH_MGN_SHRT_CD                                     CAT816  
                   ,CSH_MRG_SHT_STS_CD                                  CAT816  
                   ,STTLM_LCTN_STTS_CD                                  CAT816  
                   ,ISIN_CNTRY_STTS_CD                                  CAT816  
                   ,SBMTG_PRTCP_NBR                                     CAT816  
                   ,SBMT_PRT_NR_STS_CD                                  CAT816  
                   ,ACAT_CONTROL_NBR                                    CAT816  
                   ,CONTROL_NBR_STS_CD                                  CAT816  
                   ,ASSET_SEQ_NBR                                       CAT816  
                   ,AST_SEQ_NBR_STS_CD                                  CAT816  
                   ,TRANS_TYPE_CD                                       CAT816  
                   ,TRANS_TYPE_STTS_CD                                  CAT816  
                   ,PHSCL_SEQ_NBR                                       CAT816  
                   ,PHSCL_SEQ_STTS_CD                                   CAT816  
                   ,LGCL_SEQ_NBR                                        CAT816  
                   ,LGCL_SEQ_NR_STS_CD                                  CAT816  
                   ,ASSET_PRC_CTGY_CD                                   CAT816  
                   ,AST_PRC_CTG_STS_CD                                  CAT816  
                   ,STTLM_RSN_CD                                        CAT816  
                   ,STTLM_RSN_STTS_CD                                   CAT816  
                   ,ASSET_DESC_TXT                                      CAT816  
                   ,ASSET_DESC_STTS_CD                                  CAT816  
                   ,ASSET_RQST_QTY_CD                                   CAT816  
                   ,ASSET_RQST_STS_CD                                   CAT816  
                   ,AST_RQST_TRANS_CD                                   CAT816  
                   ,AST_RQ_TRAN_STS_CD                                  CAT816  
                   ,ASSET_QTY                                           CAT816  
                   ,ASSET_QTY_STTS_CD                                   CAT816  
                   ,ASSET_PCT                                           CAT816  
                   ,ASSET_PCT_STTS_CD                                   CAT816  
                   ,PSTN_CD                                             CAT816  
                   ,PSTN_CD_STTS_CD                                     CAT816  
                   ,ISO_CRNCY_CD                                        CAT816  
                   ,ISO_CRNCY_STTS_CD                                   CAT816  
                   ,ASSET_AMT                                           CAT816  
                   ,ASSET_AMT_STTS_CD                                   CAT816  
                   ,BEARER_BOND_CD                                      CAT816  
                   ,BEARER_BND_STTS_CD                                  CAT816  
                   ,WHI_CD                                              CAT816  
                   ,WHI_STTS_CD                                         CAT816  
                   ,TRNFR_TYPE_RSN_CD                                   CAT816  
                   ,TRN_TYP_RSN_STS_CD                                  CAT816  
                   ,MBS_SERIAL_NBR                                      CAT816  
                   ,MBS_SERIAL_STTS_CD                                  CAT816  
                   ,ASSET_CMNT_TXT                                      CAT816  
                   ,ASSET_CMNT_STTS_CD                                  CAT816  
                   ,NSCC_WTHLD_CD                                       CAT816  
                   ,TRANS_RFRN_ID_CD                                    CAT816  
                   ,TRANS_RFRN_STTS_CD                                  CAT816  
                   ,ISIN_SEC_IS_STS_CD                                  CAT816  
                   ,ISIN_SEC_CD_STS_CD                                  CAT816  
                   ,OPTN_CTGY_CD                                        CAT816  
                   ,OPTN_CTGY_STTS_CD                                   CAT816  
                   ,RCRD_LNGTH_STTS_CD                                  CAT816  
                   ,RCRD_STTS_CD                                        CAT816  
                   ,NSCC_PEND_CD                                        CAT816  
                   ,NSCC_ACK_IND                                        CAT816  
                   ,PRGM_NM                                             CAT816  
                   ,CICS_TERM_ID_CD                                     CAT816  
                   ,UPDT_TMSTP                                          CAT816  
                   ,CRT_TMSTP                                           CAT816  
                   ,SECURITY_ADP_NBR                                    CAT816  
                   ,TRNFR_TYPE_CD                                       CAT816  
                   ,TRNFR_TYPE_STTS_CD                                  CAT816  
                   ,RCV_NBR_STTS_CD                                     CAT816  
                   ,DLVR_NBR_STTS_CD                                    CAT816  
ET0001**        FROM    VINITAST                                        CAT816  
ET0001          FROM    ACTIAST                                         CAT816  
                                                                        CAT816  
                WHERE   CLIENT_NBR    = :W-CURR-CLIENT       AND        CAT816  
                        DLVR_NBR      = :W-CURR-BROKER       AND        CAT816  
ET0003                   ((NSCC_WTHLD_CD = 'W')                         CAT816  
ET0003                            OR                                    CAT816  
ET0003                    ( NOT (NSCC_WTHLD_CD = 'W')   AND             CAT816  
ET0003                      NOT (STTLM_RSN_CD  = 'SMA') AND             CAT816  
ET0003                          (STTLM_LCTN_CD = '45')))     AND        CAT816  
                        TRANS_TYPE_CD = 'A'                  AND        CAT816  
ET0002**                TRNFR_TYPE_CD = 'FUL'                           CAT816  
ET0002                  TRNFR_TYPE_CD IN ('FUL', 'PTR')                 CAT816  
                                                                        CAT816  
                ORDER BY CLIENT_NBR                                     CAT816  
                        ,ACAT_CONTROL_NBR                               CAT816  
                        ,ISIN_SEC_ISSUE_CD                              CAT816  
           END-EXEC.                                                    CAT816  
                                                                        CAT816  
      /                                                                 CAT816  
       01  W-HDR1-REC.                                                  CAT816  
           05  FILLER                       PIC  X(01) VALUE '1'.       CAT816  
           05  FILLER                       PIC  X(08) VALUE            CAT816  
               'CAT816 -'.                                              CAT816  
           05  W-HDR1-CLT                   PIC  Z999.                  CAT816  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT816  
           05  W-HDR1-CLT-NAME              PIC  X(30) VALUE ' '.       CAT816  
           05  FILLER                       PIC  X(04) VALUE ' '.       CAT816  
           05  FILLER                       PIC  X(42) VALUE            CAT816  
               'AUTOMATED CUSTOMER ACCOUNT TRANSFER SYSTEM'.            CAT816  
           05  FILLER                       PIC  X(12) VALUE ' '.       CAT816  
           05  FILLER                       PIC  X(13) VALUE            CAT816  
               'PROCESS DATE '.                                         CAT816  
           05  W-HDR1-MM                    PIC  X(02).                 CAT816  
           05  W-HDR1-S1                    PIC  X(01) VALUE '/'.       CAT816  
           05  W-HDR1-DD                    PIC  X(02).                 CAT816  
           05  W-HDR1-S2                    PIC  X(01) VALUE '/'.       CAT816  
           05  W-HDR1-YY                    PIC  X(02).                 CAT816  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT816  
           05  FILLER                       PIC  X(05) VALUE            CAT816  
               'PAGE '.                                                 CAT816  
           05  W-HDR1-PAGE                  PIC  ZZZ9.                  CAT816  
                                                                        CAT816  
       01  W-HDR2-REC.                                                  CAT816  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT816  
           05  FILLER                       PIC  X(08) VALUE            CAT816  
               'BROKER  '.                                              CAT816  
           05  W-HDR2-BKR                   PIC  X(04).                 CAT816  
           05  FILLER                       PIC  X(45) VALUE ' '.       CAT816  
           05  FILLER                       PIC  X(42) VALUE            CAT816  
               'WITHHELD ASSET REPORT'.                                 CAT816  
           05  FILLER                       PIC  X(06) VALUE ' '.       CAT816  
           05  FILLER                       PIC  X(09) VALUE            CAT816  
               'RUN TIME '.                                             CAT816  
           05  W-HDR2-MM                    PIC  X(02).                 CAT816  
           05  W-HDR2-S1                    PIC  X(01) VALUE '/'.       CAT816  
           05  W-HDR2-DD                    PIC  X(02).                 CAT816  
           05  W-HDR2-S2                    PIC  X(01) VALUE '/'.       CAT816  
           05  W-HDR2-YY                    PIC  X(02).                 CAT816  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT816  
           05  W-HDR2-HH                    PIC  X(02).                 CAT816  
           05  W-HDR2-CC                    PIC  X(01) VALUE ':'.       CAT816  
           05  W-HDR2-MN                    PIC  X(02).                 CAT816  
           05  FILLER                       PIC  X(04) VALUE ' '.       CAT816  
                                                                        CAT816  
       01  W-HDR3-REC.                                                  CAT816  
           05  FILLER                       PIC  X(01) VALUE '0'.       CAT816  
           05  FILLER                       PIC  X(18) VALUE            CAT816  
               'ACCOUNT NO. '.                                          CAT816  
           05  W-HDR3-BR                    PIC  X(003) VALUE ' '.      CAT816  
           05  FILLER                       PIC  X(001) VALUE '-'.      CAT816  
           05  W-HDR3-ACCT                  PIC  X(005) VALUE ' '.      CAT816  
           05  FILLER                       PIC  X(105) VALUE ' '.      CAT816  
                                                                        CAT816  
       01  W-HDR4-REC.                                                  CAT816  
           05  FILLER PIC X(19) VALUE ' CONTRA BROKER NO. ' .           CAT816  
           05  W-HDR4-CONTRA-BROKER         PIC X(04) VALUE ' '.        CAT816  
           05  FILLER                       PIC X(13) VALUE ' '.        CAT816  
           05  FILLER PIC X(21) VALUE 'CONTRA ACCOUNT       '.          CAT816  
           05  W-HDR4-CONTRA-ACCOUNT        PIC X(20) VALUE ' '.        CAT816  
           05  FILLER                       PIC X(56) VALUE ' '.        CAT816  
                                                                        CAT816  
       01  W-HDR5-REC.                                                  CAT816  
           05  FILLER PIC X(19) VALUE ' ACATS CONTROL NO. '.            CAT816  
           05  W-HDR5-CONTROL-NBR           PIC X(14) VALUE ' '.        CAT816  
           05  FILLER                       PIC X(03) VALUE ' '.        CAT816  
           05  FILLER PIC X(21) VALUE 'ORIGINAL SETTLE DATE '.          CAT816  
           05  W-HDR5-SETTLE-DATE           PIC X(10) VALUE ' '.        CAT816  
           05  FILLER                       PIC X(66) VALUE ' '.        CAT816  
                                                                        CAT816  
       01  W-HDR6-REC.                                                  CAT816  
           05  FILLER                       PIC  X(01) VALUE '0'.       CAT816  
ET0003**   05  FILLER                       PIC  X(02) VALUE ' '.       CAT816  
           05  FILLER                       PIC  X(14) VALUE            CAT816  
               'CONTROL NO    '.                                        CAT816  
ET0003**   05  FILLER                       PIC  X(02) VALUE ' '.       CAT816  
ET0003     05  FILLER                       PIC  X(01) VALUE ' '.       CAT816  
           05  FILLER                       PIC  X(07) VALUE            CAT816  
               'RCV-BRK'.                                               CAT816  
ET0003**   05  FILLER                       PIC  X(02) VALUE ' '.       CAT816  
ET0003     05  FILLER                       PIC  X(01) VALUE ' '.       CAT816  
           05  FILLER                       PIC  X(07) VALUE            CAT816  
DJ0001         'SEC-NO'.                                                CAT816  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT816  
           05  FILLER                       PIC  X(12) VALUE            CAT816  
               '   CUSIP'.                                              CAT816  
ET0003     05  FILLER                       PIC  X(06) VALUE            CAT816  
ET0003         ' MEMO '.                                                CAT816  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT816  
           05  FILLER                       PIC  X(30) VALUE            CAT816  
               '         DESCRIPTION'.                                  CAT816  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT816  
           05  FILLER                       PIC  X(03) VALUE            CAT816  
               'L/S'.                                                   CAT816  
ET0003**   05  FILLER                       PIC  X(02) VALUE ' '.       CAT816  
ET0003**   05  FILLER                       PIC  X(20) VALUE            CAT816  
ET0003     05  FILLER                       PIC  X(18) VALUE            CAT816  
ET0003**       '       QUANTITY'.                                       CAT816  
ET0003         '     QUANTITY'.                                         CAT816  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT816  
           05  FILLER                       PIC  X(20) VALUE            CAT816  
               '           AMOUNT'.                                     CAT816  
           05  FILLER                       PIC  X(18) VALUE ' '.       CAT816  
                                                                        CAT816  
       01  W-DTL1-REC.                                                  CAT816  
           05  FILLER                       PIC  X(01) VALUE '0'.       CAT816  
ET0003**   05  FILLER                       PIC  X(02) VALUE ' '.       CAT816  
           05  W-DTL1-CONTROL-NBR           PIC  X(14) VALUE ' '.       CAT816  
ET0003**   05  FILLER                       PIC  X(03) VALUE ' '.       CAT816  
ET0003     05  FILLER                       PIC  X(02) VALUE ' '.       CAT816  
           05  W-DTL1-RCV-NBR               PIC  X(04).                 CAT816  
ET0003**   05  FILLER                       PIC  X(04) VALUE ' '.       CAT816  
ET0003     05  FILLER                       PIC  X(03) VALUE ' '.       CAT816  
DJ0001     05  W-DTL1-SEC-NO                PIC  X(07).                 CAT816  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT816  
           05  W-DTL1-CUSIP                 PIC  X(12).                 CAT816  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT816  
ET0003     05  W-DTL1-MEMO                  PIC  X(01).                 CAT816  
ET0003     05  FILLER                       PIC  X(05) VALUE ' '.       CAT816  
           05  W-DTL1-DESC1                 PIC  X(30).                 CAT816  
           05  FILLER                       PIC  X(03) VALUE ' '.       CAT816  
           05  W-DTL1-LONG-SHORT            PIC  X(01) VALUE ' '.       CAT816  
ET0003**   05  FILLER                       PIC  X(03) VALUE ' '.       CAT816  
ET0003     05  FILLER                       PIC  X(01) VALUE ' '.       CAT816  
           05  W-DTL1-QTY                   PIC  ZZZ,ZZZ,ZZZ,ZZZ.9999.  CAT816  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT816  
           05  W-DTL1-AMT                   PIC  ZZZZZ,ZZZ,ZZZ,ZZZ.99.  CAT816  
           05  FILLER                       PIC  X(18) VALUE ' '.       CAT816  
                                                                        CAT816  
       01  W-DTL2-REC.                                                  CAT816  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT816  
ET0003**   05  FILLER                       PIC  X(50) VALUE ' '.       CAT816  
ET0003     05  FILLER                       PIC  X(52) VALUE ' '.       CAT816  
           05  W-DTL2-DESC2                 PIC  X(30).                 CAT816  
           05  FILLER                       PIC  X(52) VALUE ' '.       CAT816  
                                                                        CAT816  
       01  W-DTLX-REC.                                                  CAT816  
           05  FILLER                       PIC  X(01) VALUE '0'.       CAT816  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT816  
           05  FILLER                       PIC  X(40) VALUE            CAT816  
           'NO WITHHELD ASSETS TODAY'.                                  CAT816  
           05  FILLER                       PIC  X(90) VALUE ' '.       CAT816  
                                                                        CAT816  
      /                                                                 CAT816  
      ***--->COBOL LE                                                   CAT816  
       01  W-ABEND-AREA.                                                CAT816  
           03  ABEND-CD                  PIC S9(04) COMP SYNC.          CAT816  
                                                                        CAT816  
           COPY STUBCPY.                                                CAT816  
           03  DSNTIAR                   PIC X(008) VALUE 'DSNTIAR'.    CAT816  
      ***<---COBOL LE                                                   CAT816  
                                                                        CAT816  
       01  FILLER                        PIC X(008) VALUE 'END-O-WS'.   CAT816  
      /                                                                 CAT816  
      ***************************************************************** CAT816  
      *    LINKAGE SECTION                                            * CAT816  
      ***************************************************************** CAT816  
       LINKAGE SECTION.                                                 CAT816  
       01  L-JCL-PARMS.                                                 CAT816  
           05  PARMLENGTH                PIC S9(004) COMP SYNC.         CAT816  
           05  L-STREAM                  PIC  X(001).                   CAT816  
           05  L-BYP-DATECHK-SW          PIC  X(001).                   CAT816  
               88  L-BYP-DATECHK                     VALUE '1'.         CAT816  
           05  L-BYP-FILECHK-SW          PIC  X(001).                   CAT816  
               88  L-BYP-FILECHK                     VALUE '1'.         CAT816  
                                                                        CAT816  
       PROCEDURE DIVISION USING L-JCL-PARMS.                            CAT816  
      *                         ===========                             CAT816  
       0000-MAIN SECTION.                                               CAT816  
                                                                        CAT816  
           DISPLAY 'CAT816 - ACATS RESIDUAL CREDIT REPORT'.             CAT816  
           DISPLAY ' '.                                                 CAT816  
           COPY MSGCOBO.                                                CAT816  
           DISPLAY ' '.                                                 CAT816  
                                                                        CAT816  
           PERFORM 1000-INIT          THRU 1000-EXIT.                   CAT816  
                                                                        CAT816  
           SORT SORT-FILE ON ASCENDING SORT-KEY                         CAT816  
                INPUT  PROCEDURE IS 2000-SORT-INPUT  THRU 2000-EXIT     CAT816  
                OUTPUT PROCEDURE IS 5000-SORT-OUTPUT THRU 5000-EXIT.    CAT816  
                                                                        CAT816  
           PERFORM 9000-CLOSE-ROUTINE THRU 9000-EXIT.                   CAT816  
                                                                        CAT816  
       0000-FINI.                                                       CAT816  
                                                                        CAT816  
           GOBACK.                                                      CAT816  
      /                                                                 CAT816  
       1000-INIT SECTION.                                               CAT816  
                                                                        CAT816  
           DISPLAY 'CAT816: L-STREAM         = '                        CAT816  
                            L-STREAM.                                   CAT816  
           DISPLAY 'CAT816: L-BYP-DATECHK-SW = '                        CAT816  
                            L-BYP-DATECHK-SW.                           CAT816  
           DISPLAY 'CAT816: L-BYP-FILECHK-SW = '                        CAT816  
                            L-BYP-FILECHK-SW.                           CAT816  
           IF  L-BYP-DATECHK                                            CAT816  
               DISPLAY 'CAT816: DATE CHECK WILL BE BYPASSED'            CAT816  
           ELSE                                                         CAT816  
               DISPLAY 'CAT816: DATE CHECK WILL BE PERFORMED'           CAT816  
           END-IF.                                                      CAT816  
           IF  L-BYP-FILECHK                                            CAT816  
               DISPLAY 'CAT816: FILE CHECK WILL BE BYPASSED'            CAT816  
           ELSE                                                         CAT816  
               DISPLAY 'CAT816: FILE CHECK WILL BE PERFORMED'           CAT816  
           END-IF.                                                      CAT816  
                                                                        CAT816  
           MOVE 'CAT816'                 TO BPDATES-CALLING-PGM.        CAT816  
           SET  LNKDATZ-REQUEST          TO TRUE.                       CAT816  
           CALL  BPDATES  USING BPDATES-PARAMETERS.                     CAT816  
           MOVE BPD-PROC-DATE            TO W-PROC-DATE.                CAT816  
           MOVE BPD-PROC-DATE(3:2)       TO LD-PROC-DATE-YY.            CAT816  
           MOVE BPD-PROC-DATE(5:2)       TO LD-PROC-DATE-MM.            CAT816  
           MOVE BPD-PROC-DATE(7:2)       TO LD-PROC-DATE-DD.            CAT816  
                                                                        CAT816  
           DISPLAY 'CAT816: PROC-DATE= ' BPD-PROC-DATE                  CAT816  
                      '  LD-PROC-DATE= ' LD-PROC-DATE.                  CAT816  
                                                                        CAT816  
           ACCEPT W-SYS-DATE             FROM DATE.                     CAT816  
           ACCEPT W-SYS-TIME             FROM TIME.                     CAT816  
                                                                        CAT816  
           EXEC SQL                                                     CAT816  
               SET :W-CURRENT-TIMESTAMP = CURRENT TIMESTAMP             CAT816  
           END-EXEC                                                     CAT816  
                                                                        CAT816  
           IF  SQLCODE = +0                                             CAT816  
               DISPLAY ' '                                              CAT816  
               DISPLAY 'CAT816: W-CURRENT-TIMESTAMP = '                 CAT816  
                                                    W-CURRENT-TIMESTAMP CAT816  
               DISPLAY ' '                                              CAT816  
           ELSE                                                         CAT816  
               DISPLAY 'CAT816: W-CURRENT-TIMESTAMP NOT SET'            CAT816  
               MOVE SQLCODE      TO W-DB2-SQLCODE                       CAT816  
               DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                       CAT816  
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   CAT816  
           END-IF.                                                      CAT816  
                                                                        CAT816  
           MOVE '000'                  TO BH-BROKER-NUMBER              CAT816  
                                                                        CAT816  
           OPEN OUTPUT REPT-FILE.                                       CAT816  
           DISPLAY 'CAT816: REPORT   OPENED FOR OUTPUT '                CAT816  
                       ' FILE STATUS = ' REPT-STAT.                     CAT816  
                                                                        CAT816  
           IF  REPT-OKAY                                                CAT816  
               CONTINUE                                                 CAT816  
           ELSE                                                         CAT816  
               MOVE 3003                  TO  ABEND-CD                  CAT816  
               DISPLAY ' '                                              CAT816  
               DISPLAY 'CAT816: U3003 - DD REPORT OPEN ERR, '           CAT816  
                       ' FILE STATUS = ' REPT-STAT                      CAT816  
               CALL  ABEND  USING ABEND-CD                              CAT816  
           END-IF.                                                      CAT816  
                                                                        CAT816  
           PERFORM 1500-LOAD-B1 THRU 1500-EXIT.                         CAT816  
                                                                        CAT816  
           DISPLAY ' '.                                                 CAT816  
                                                                        CAT816  
       1000-EXIT. EXIT.                                                 CAT816  
      /                                                                 CAT816  
       1500-LOAD-B1 SECTION.                                            CAT816  
           DISPLAY 'CAT816: 1500-LOAD-B1'.                              CAT816  
                                                                        CAT816  
           MOVE SPACES                   TO  B1-TABLE-AREA.             CAT816  
           MOVE 0                        TO  B1-TBL-CNT.                CAT816  
                                                                        CAT816  
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500        CAT816  
                                                                        CAT816  
             MOVE  ' '                   TO  BH-BROKER-HEADER-INFO      CAT816  
                                             BH-ACAT-INFO               CAT816  
             MOVE  B1-SUB                TO  BH-BROKER-NUMBER-N         CAT816  
             MOVE  '015'                 TO  BH-LOGICAL-RECORD-CODE     CAT816  
             MOVE  '434500'              TO  BH-B2-INFO-ID              CAT816  
             CALL   GETB1V             USING BH-BROKER-HEADER-INFO      CAT816  
                                             BH-ACAT-INFO               CAT816  
             ADD 1 TO B1-TBL-CNT                                        CAT816  
             IF   BH-BROKER-ACTIVE                                      CAT816  
                   MOVE  BH-BROKER-NUMBER-N                             CAT816  
                                         TO B1-CLT-NBR (B1-TBL-CNT)     CAT816  
                   MOVE  BH-BROKER-NAME                                 CAT816  
                                         TO B1-CLT-NAME (B1-TBL-CNT)    CAT816  
                   MOVE  BH-BROKER-OLD-CLEARING-HOUSE (2:4)             CAT816  
                                         TO B1-BKR-CLR-NO (B1-TBL-CNT)  CAT816  
                   IF  BH-BROKER-MINI-MAXI-SUBGROUP > ' '               CAT816  
                       MOVE BH-BROKER-MINI-MAXI-SUBGROUP                CAT816  
                                         TO B1-STREAM     (B1-TBL-CNT)  CAT816  
                   ELSE                                                 CAT816  
                       MOVE BH-BROKER-MINI-MAXI-INDICATOR               CAT816  
                                         TO B1-STREAM     (B1-TBL-CNT)  CAT816  
                   END-IF                                               CAT816  
                   MOVE  BH-BROKER-STATUS                               CAT816  
                                         TO B1-STATUS     (B1-TBL-CNT)  CAT816  
               IF  B1-STREAM (B1-TBL-CNT) = L-STREAM                    CAT816  
               AND BH-ACAT-ACTIVE                                       CAT816  
                   ADD 1 TO B1-ACTIVE-CNT                               CAT816  
                   MOVE  BH-ACAT-STATUS                                 CAT816  
                                         TO B1-ACAT-STATUS(B1-TBL-CNT)  CAT816  
                       DISPLAY      ' CLT ' B1-CLT-NBR    (B1-TBL-CNT)  CAT816  
                                        ' ' B1-CLT-NAME   (B1-TBL-CNT)  CAT816  
                                    ' BKR ' B1-BKR-CLR-NO (B1-TBL-CNT)  CAT816  
                                    ' STR ' B1-STREAM     (B1-TBL-CNT)  CAT816  
                                    ' STA ' B1-STATUS     (B1-TBL-CNT)  CAT816  
                                   ' ACAT ' B1-ACAT-STATUS(B1-TBL-CNT)  CAT816  
               ELSE                                                     CAT816  
                   MOVE ' '              TO B1-ACAT-STATUS(B1-TBL-CNT)  CAT816  
               END-IF                                                   CAT816  
             END-IF                                                     CAT816  
                                                                        CAT816  
           END-PERFORM.                                                 CAT816  
                                                                        CAT816  
           DISPLAY ' '.                                                 CAT816  
                                                                        CAT816  
           DISPLAY  'B1 ACTIVE COUNT = ' B1-ACTIVE-CNT.                 CAT816  
           DISPLAY ' '.                                                 CAT816  
       1500-EXIT. EXIT.                                                 CAT816  
      /                                                                 CAT816  
      ******************************************************************CAT816  
      *  GET CLIENT FOR THIS STREAM, AND FETCH TRANSFERS                CAT816  
      ******************************************************************CAT816  
       2000-SORT-INPUT SECTION.                                         CAT816  
           MOVE '2000-SORT-INPUT         ' TO W-ROUTINE-1.              CAT816  
                                                                        CAT816  
           PERFORM VARYING B1-SUB FROM 1 BY 1                           CAT816  
              UNTIL B1-SUB > 500                                        CAT816  
                                                                        CAT816  
              IF  B1-STREAM      (B1-SUB) = L-STREAM                    CAT816  
              AND B1-STATUS      (B1-SUB) = 'A'                         CAT816  
              AND B1-ACAT-STATUS (B1-SUB) = 'A'                         CAT816  
              AND B1-BKR-CLR-NO  (B1-SUB) > ' '                         CAT816  
                  MOVE B1-CLT-NBR    (B1-SUB) TO W-CURR-CLIENT-N        CAT816  
                  MOVE B1-BKR-CLR-NO (B1-SUB) TO W-CURR-BROKER          CAT816  
                  MOVE B1-STREAM     (B1-SUB) TO W-CURR-STREAM          CAT816  
                  PERFORM 2500-GETB1         THRU 2500-EXIT             CAT816  
                  PERFORM 3000-FETCH-TRANFER THRU 3000-EXIT             CAT816  
              END-IF                                                    CAT816  
                                                                        CAT816  
           END-PERFORM.                                                 CAT816  
                                                                        CAT816  
       2000-EXIT. EXIT.                                                 CAT816  
      /                                                                 CAT816  
       2500-GETB1          SECTION.                                     CAT816  
                                                                        CAT816  
           MOVE ' '                        TO BH-BROKER-HEADER-INFO     CAT816  
                                              BH-ACAT-INFO              CAT816  
                                              BH-BTS2-INFO              CAT816  
                                              BH-MF-INFO                CAT816  
                                                                        CAT816  
           MOVE W-CURR-CLIENT-N            TO BH-BROKER-NUMBER-N        CAT816  
           MOVE '015'                      TO BH-LOGICAL-RECORD-CODE    CAT816  
           MOVE '434500'                   TO BH-B2-INFO-ID             CAT816  
           CALL  GETB1V                 USING BH-BROKER-HEADER-INFO,    CAT816  
                                              BH-ACAT-INFO              CAT816  
           END-CALL.                                                    CAT816  
                                                                        CAT816  
           MOVE '511000'                   TO BH-B2-INFO-ID             CAT816  
           CALL  GETB1V                 USING BH-BROKER-HEADER-INFO,    CAT816  
                                              BH-BTS2-INFO              CAT816  
           END-CALL.                                                    CAT816  
                                                                        CAT816  
           MOVE '537000'                   TO BH-B2-INFO-ID             CAT816  
           CALL  GETB1V                 USING BH-BROKER-HEADER-INFO,    CAT816  
                                              BH-MF-INFO                CAT816  
           END-CALL.                                                    CAT816  
                                                                        CAT816  
           DISPLAY ' '                                                  CAT816  
           DISPLAY 'CAT816: STREAM= ' W-CURR-STREAM                     CAT816  
                          ' NEW-CLIENT = ' BH-BROKER-NUMBER             CAT816  
                                       ' ' BH-BROKER-NAME               CAT816  
                               ' BRK-NO= ' BH-BROKER-OLD-CLEARING-HOUSE.CAT816  
                                                                        CAT816  
       2500-EXIT. EXIT.                                                 CAT816  
      /                                                                 CAT816  
      ******************************************************************CAT816  
      *  IF FULL TRANSFER REQUEST, AND WE ARE THE DELIVERER,            CAT816  
      *     LOAD ASSETS                                                 CAT816  
      ******************************************************************CAT816  
       3000-FETCH-TRANFER SECTION.                                      CAT816  
           MOVE '3000-FETCH-TRANSFER        ' TO W-ROUTINE-1.           CAT816  
                                                                        CAT816  
           EXEC SQL OPEN VINITAST_CURSOR END-EXEC                       CAT816  
                                                                        CAT816  
           IF SQLCODE NOT = +0                                          CAT816  
              MOVE SQLCODE      TO W-DB2-SQLCODE                        CAT816  
ET0001**      DISPLAY 'VINITAST CURSOR OPEN ERROR '                     CAT816  
ET0001        DISPLAY 'ACTIAST CURSOR OPEN ERROR '                      CAT816  
                            'SQLCODE = ' W-DB2-SQLCODE                  CAT816  
           END-IF                                                       CAT816  
                                                                        CAT816  
           PERFORM UNTIL SQLCODE NOT = +0                               CAT816  
                                                                        CAT816  
                                                                        CAT816  
              EXEC SQL                                                  CAT816  
                   FETCH VINITAST_CURSOR                                CAT816  
               INTO                                                     CAT816  
ET0001              :DCLACTIAST.CLIENT-NBR                              CAT816  
ET0001             ,:DCLACTIAST.DLVR-NBR                                CAT816  
ET0001             ,:DCLACTIAST.ACCT-DLVR-NBR                           CAT816  
ET0001             ,:DCLACTIAST.RCV-NBR                                 CAT816  
ET0001             ,:DCLACTIAST.ACCT-RCV-NBR                            CAT816  
ET0001             ,:DCLACTIAST.ISIN-CNTRY-CD                           CAT816  
ET0001             ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                       CAT816  
ET0001             ,:DCLACTIAST.ISIN-SEC-CDG-CD                         CAT816  
ET0001             ,:DCLACTIAST.STTLM-LCTN-CD                           CAT816  
ET0001             ,:DCLACTIAST.CSH-MGN-SHRT-CD                         CAT816  
ET0001             ,:DCLACTIAST.CSH-MRG-SHT-STS-CD                      CAT816  
ET0001             ,:DCLACTIAST.STTLM-LCTN-STTS-CD                      CAT816  
ET0001             ,:DCLACTIAST.ISIN-CNTRY-STTS-CD                      CAT816  
ET0001             ,:DCLACTIAST.SBMTG-PRTCP-NBR                         CAT816  
ET0001             ,:DCLACTIAST.SBMT-PRT-NR-STS-CD                      CAT816  
ET0001             ,:DCLACTIAST.ACAT-CONTROL-NBR                        CAT816  
ET0001             ,:DCLACTIAST.CONTROL-NBR-STS-CD                      CAT816  
ET0001             ,:DCLACTIAST.ASSET-SEQ-NBR                           CAT816  
ET0001             ,:DCLACTIAST.AST-SEQ-NBR-STS-CD                      CAT816  
ET0001             ,:DCLACTIAST.TRANS-TYPE-CD                           CAT816  
ET0001             ,:DCLACTIAST.TRANS-TYPE-STTS-CD                      CAT816  
ET0001             ,:DCLACTIAST.PHSCL-SEQ-NBR                           CAT816  
ET0001             ,:DCLACTIAST.PHSCL-SEQ-STTS-CD                       CAT816  
ET0001             ,:DCLACTIAST.LGCL-SEQ-NBR                            CAT816  
ET0001             ,:DCLACTIAST.LGCL-SEQ-NR-STS-CD                      CAT816  
ET0001             ,:DCLACTIAST.ASSET-PRC-CTGY-CD                       CAT816  
ET0001             ,:DCLACTIAST.AST-PRC-CTG-STS-CD                      CAT816  
ET0001             ,:DCLACTIAST.STTLM-RSN-CD                            CAT816  
ET0001             ,:DCLACTIAST.STTLM-RSN-STTS-CD                       CAT816  
ET0001             ,:DCLACTIAST.ASSET-DESC-TXT                          CAT816  
ET0001             ,:DCLACTIAST.ASSET-DESC-STTS-CD                      CAT816  
ET0001             ,:DCLACTIAST.ASSET-RQST-QTY-CD                       CAT816  
ET0001             ,:DCLACTIAST.ASSET-RQST-STS-CD                       CAT816  
ET0001             ,:DCLACTIAST.AST-RQST-TRANS-CD                       CAT816  
ET0001             ,:DCLACTIAST.AST-RQ-TRAN-STS-CD                      CAT816  
ET0001             ,:DCLACTIAST.ASSET-QTY                               CAT816  
ET0001             ,:DCLACTIAST.ASSET-QTY-STTS-CD                       CAT816  
ET0001             ,:DCLACTIAST.ASSET-PCT                               CAT816  
ET0001             ,:DCLACTIAST.ASSET-PCT-STTS-CD                       CAT816  
ET0001             ,:DCLACTIAST.PSTN-CD                                 CAT816  
ET0001             ,:DCLACTIAST.PSTN-CD-STTS-CD                         CAT816  
ET0001             ,:DCLACTIAST.ISO-CRNCY-CD                            CAT816  
ET0001             ,:DCLACTIAST.ISO-CRNCY-STTS-CD                       CAT816  
ET0001             ,:DCLACTIAST.ASSET-AMT                               CAT816  
ET0001             ,:DCLACTIAST.ASSET-AMT-STTS-CD                       CAT816  
ET0001             ,:DCLACTIAST.BEARER-BOND-CD                          CAT816  
ET0001             ,:DCLACTIAST.BEARER-BND-STTS-CD                      CAT816  
ET0001             ,:DCLACTIAST.WHI-CD                                  CAT816  
ET0001             ,:DCLACTIAST.WHI-STTS-CD                             CAT816  
ET0001             ,:DCLACTIAST.TRNFR-TYPE-RSN-CD                       CAT816  
ET0001             ,:DCLACTIAST.TRN-TYP-RSN-STS-CD                      CAT816  
ET0001             ,:DCLACTIAST.MBS-SERIAL-NBR                          CAT816  
ET0001             ,:DCLACTIAST.MBS-SERIAL-STTS-CD                      CAT816  
ET0001             ,:DCLACTIAST.ASSET-CMNT-TXT                          CAT816  
ET0001             ,:DCLACTIAST.ASSET-CMNT-STTS-CD                      CAT816  
ET0001             ,:DCLACTIAST.NSCC-WTHLD-CD                           CAT816  
ET0001             ,:DCLACTIAST.TRANS-RFRN-ID-CD                        CAT816  
ET0001             ,:DCLACTIAST.TRANS-RFRN-STTS-CD                      CAT816  
ET0001             ,:DCLACTIAST.ISIN-SEC-IS-STS-CD                      CAT816  
ET0001             ,:DCLACTIAST.ISIN-SEC-CD-STS-CD                      CAT816  
ET0001             ,:DCLACTIAST.OPTN-CTGY-CD                            CAT816  
ET0001             ,:DCLACTIAST.OPTN-CTGY-STTS-CD                       CAT816  
ET0001             ,:DCLACTIAST.RCRD-LNGTH-STTS-CD                      CAT816  
ET0001             ,:DCLACTIAST.RCRD-STTS-CD                            CAT816  
ET0001             ,:DCLACTIAST.NSCC-PEND-CD                            CAT816  
ET0001             ,:DCLACTIAST.NSCC-ACK-IND                            CAT816  
ET0001             ,:DCLACTIAST.PRGM-NM                                 CAT816  
ET0001             ,:DCLACTIAST.CICS-TERM-ID-CD                         CAT816  
ET0001             ,:DCLACTIAST.UPDT-TMSTP                              CAT816  
ET0001             ,:DCLACTIAST.CRT-TMSTP                               CAT816  
ET0001             ,:DCLACTIAST.SECURITY-ADP-NBR                        CAT816  
ET0001             ,:DCLACTIAST.TRNFR-TYPE-CD                           CAT816  
ET0001             ,:DCLACTIAST.TRNFR-TYPE-STTS-CD                      CAT816  
ET0001             ,:DCLACTIAST.RCV-NBR-STTS-CD                         CAT816  
ET0001             ,:DCLACTIAST.DLVR-NBR-STTS-CD                        CAT816  
              END-EXEC                                                  CAT816  
                                                                        CAT816  
              MOVE SQLCODE      TO W-DB2-SQLCODE                        CAT816  
              EVALUATE SQLCODE                                          CAT816  
                  WHEN +0                                               CAT816  
                       ADD 1 TO W-INFILE-CNT                            CAT816  
                       PERFORM 4000-LOAD     THRU 4000-EXIT             CAT816  
                  WHEN +100                                             CAT816  
                       DISPLAY 'INP=' W-INFILE-CNT                      CAT816  
                              ' CLT=' WF-CLIENT-NBR                     CAT816  
ET0001                        ' ACTIAST CURSOR FETCH NOT FOUND '        CAT816  
                              ' SQLCODE=' W-DB2-SQLCODE                 CAT816  
                  WHEN OTHER                                            CAT816  
                       DISPLAY 'INP=' W-INFILE-CNT                      CAT816  
                              ' CLT=' WF-CLIENT-NBR                     CAT816  
ET0001                        ' ACTIAST CURSOR FETCH ERROR '            CAT816  
                              ' SQLCODE=' W-DB2-SQLCODE                 CAT816  
                       PERFORM  8500-SQL-ERROR THRU 8500-EXIT           CAT816  
              END-EVALUATE                                              CAT816  
                                                                        CAT816  
           END-PERFORM                                                  CAT816  
                                                                        CAT816  
           EXEC SQL                                                     CAT816  
                CLOSE VINITAST_CURSOR                                   CAT816  
           END-EXEC                                                     CAT816  
                                                                        CAT816  
           IF  SQLCODE NOT = +0                                         CAT816  
               MOVE SQLCODE      TO W-DB2-SQLCODE                       CAT816  
               DISPLAY 'INP=' W-INFILE-CNT                              CAT816  
                              ' CLT=' WF-CLIENT-NBR                     CAT816  
ET0001                        ' ACTIAST CURSOR CLOSE ERROR '            CAT816  
                              ' SQLCODE=' W-DB2-SQLCODE                 CAT816  
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   CAT816  
           END-IF.                                                      CAT816  
                                                                        CAT816  
       3000-EXIT. EXIT.                                                 CAT816  
      /                                                                 CAT816  
       4000-LOAD                SECTION.                                CAT816  
           MOVE '4000-LOAD            ' TO W-ROUTINE-1.                 CAT816  
                                                                        CAT816  
           ADD 1 TO W-LOAD-CNT.                                         CAT816  
                                                                        CAT816  
           MOVE SPACES            TO W-SORT-RECORD                      CAT816  
ET0001     MOVE CLIENT-NBR        OF DCLACTIAST                         CAT816  
                                  TO W-SORT-CLIENT-NBR                  CAT816  
ET0001     MOVE ACAT-CONTROL-NBR  OF DCLACTIAST                         CAT816  
                                  TO W-SORT-ACAT-CONTROL-NBR            CAT816  
ET0001     MOVE RCV-NBR           OF DCLACTIAST                         CAT816  
                                  TO W-SORT-RCV-NBR                     CAT816  
ET0001     MOVE CSH-MGN-SHRT-CD OF DCLACTIAST                           CAT816  
                                  TO W-SORT-CSH-MGN-SHRT-CD             CAT816  
                                                                        CAT816  
ET0001     MOVE STTLM-LCTN-CD     OF DCLACTIAST                         CAT816  
                                  TO W-SORT-STTLM-LCTN-CD               CAT816  
ET0001     MOVE STTLM-RSN-CD      OF DCLACTIAST                         CAT816  
                                  TO W-SORT-STTLM-RSN-CD                CAT816  
ET0001     MOVE PSTN-CD           OF DCLACTIAST                         CAT816  
                                  TO W-SORT-PSTN-CD                     CAT816  
                                                                        CAT816  
ET0001     MOVE ASSET-AMT         OF DCLACTIAST                         CAT816  
                                  TO W-SORT-AMT                         CAT816  
ET0001     MOVE ASSET-QTY         OF DCLACTIAST                         CAT816  
                                  TO W-SORT-QTY                         CAT816  
ET0001     MOVE ASSET-PRC-CTGY-CD OF DCLACTIAST                         CAT816  
                                  TO W-SORT-ASSET-PRC-CTGY-CD           CAT816  
ET0001     MOVE SECURITY-ADP-NBR  OF DCLACTIAST                         CAT816  
                                  TO W-SORT-SECURITY-ADP-NBR            CAT816  
ET0001     MOVE ISIN-SEC-ISSUE-CD OF DCLACTIAST                         CAT816  
                                  TO W-SORT-ISIN-SEC-ISSUE-CD           CAT816  
                                                                        CAT816  
ET0001     MOVE ASSET-DESC-TXT    OF DCLACTIAST                         CAT816  
                                  TO W-SORT-ASSET-DESC-TXT              CAT816  
                                                                        CAT816  
ET0003     MOVE NSCC-WTHLD-CD     OF DCLACTIAST                         CAT816  
ET0003                            TO W-SORT-WITHHELD-CD                 CAT816  
           MOVE W-SORT-RECORD            TO SORT-RECORD.                CAT816  
                                                                        CAT816  
           RELEASE SORT-RECORD                                          CAT816  
           ADD  1             TO W-RELEASE-CNT                          CAT816  
           .                                                            CAT816  
       4000-EXIT.                                                       CAT816  
           EXIT.                                                        CAT816  
      /                                                                 CAT816  
       5000-SORT-OUTPUT SECTION.                                        CAT816  
                                                                        CAT816  
           DISPLAY 'CAT816: PERFORMING 5000-SORT-OUTPUT'.               CAT816  
                                                                        CAT816  
           PERFORM 5500-RETURN-SORT THRU 5500-EXIT.                     CAT816  
                                                                        CAT816  
           PERFORM UNTIL END-OF-SORT                                    CAT816  
                                                                        CAT816  
               IF  B1-PRT-SUB   < W-SORT-CLIENT-NBR-N                   CAT816  
                   PERFORM 6000-CLT-BREAK     THRU 6000-EXIT            CAT816  
               END-IF                                                   CAT816  
                                                                        CAT816  
               PERFORM 7000-WRITE-REPORT  THRU 7000-EXIT                CAT816  
               PERFORM 5500-RETURN-SORT   THRU 5500-EXIT                CAT816  
                                                                        CAT816  
           END-PERFORM.                                                 CAT816  
                                                                        CAT816  
           PERFORM 6000-CLT-BREAK     THRU 6000-EXIT.                   CAT816  
                                                                        CAT816  
       5000-EXIT.                                                       CAT816  
           EXIT.                                                        CAT816  
      /                                                                 CAT816  
       5500-RETURN-SORT SECTION.                                        CAT816  
                                                                        CAT816  
           RETURN SORT-FILE                                             CAT816  
               AT END                                                   CAT816  
                     MOVE 999 TO W-SORT-CLIENT-NBR-N                    CAT816  
                     MOVE '1'              TO END-OF-SORT-SW            CAT816  
                     DISPLAY 'CAT816: SORT-EOF '                        CAT816  
                                   ' RET=' W-RETURN-CNT                 CAT816  
                     GO TO 5500-EXIT.                                   CAT816  
                                                                        CAT816  
           ADD  1                        TO W-RETURN-CNT.               CAT816  
           MOVE SORT-RECORD              TO W-SORT-RECORD.              CAT816  
                                                                        CAT816  
       5500-EXIT.                                                       CAT816  
           EXIT.                                                        CAT816  
      /                                                                 CAT816  
       6000-CLT-BREAK SECTION.                                          CAT816  
           DISPLAY '6000-CLT-BREAK'                                     CAT816  
               ' SORT-CLIENT-NBR= ' W-SORT-CLIENT-NBR                   CAT816  
               ' B1-PRT-SUB= ' B1-PRT-SUB.                              CAT816  
                                                                        CAT816  
       6000-LOOP.                                                       CAT816  
                                                                        CAT816  
           IF  B1-PRT-SUB   < W-SORT-CLIENT-NBR-N                       CAT816  
               IF   B1-STREAM      (B1-PRT-SUB) = L-STREAM              CAT816  
               AND  B1-ACAT-STATUS (B1-PRT-SUB) = 'A'                   CAT816  
                 IF B1-PRINT       (B1-PRT-SUB) NOT = '1'               CAT816  
                    PERFORM 7100-WRITE-NO-ACT THRU 7100-EXIT            CAT816  
                 END-IF                                                 CAT816  
               END-IF                                                   CAT816  
           ELSE                                                         CAT816  
               GO TO 6000-EXIT                                          CAT816  
           END-IF.                                                      CAT816  
                                                                        CAT816  
           IF  B1-PRT-SUB < 500                                         CAT816  
               ADD 1 TO B1-PRT-SUB                                      CAT816  
               MOVE 0                    TO W-PAGE-CNT                  CAT816  
               MOVE 60                   TO W-LINE-CNT                  CAT816  
               MOVE 0                    TO W-CLT-CNT                   CAT816  
               GO TO 6000-LOOP                                          CAT816  
           END-IF.                                                      CAT816  
                                                                        CAT816  
       6000-EXIT. EXIT.                                                 CAT816  
      /                                                                 CAT816  
       7000-WRITE-REPORT SECTION.                                       CAT816  
                                                                        CAT816  
           MOVE '1' TO B1-PRINT (B1-PRT-SUB)                            CAT816  
                                                                        CAT816  
           IF  (W-SORT-CLIENT-NBR       NOT = W-PREV-CLIENT-NBR)        CAT816  
                MOVE 60 TO W-LINE-CNT                                   CAT816  
           END-IF                                                       CAT816  
                                                                        CAT816  
           MOVE W-SORT-CLIENT-NBR          TO W-PREV-CLIENT-NBR         CAT816  
           MOVE W-SORT-ACAT-CONTROL-NBR    TO W-PREV-CONTROL-NBR        CAT816  
                                                                        CAT816  
           INITIALIZE W-DTL1-REC                                        CAT816  
                      W-DTL2-REC.                                       CAT816  
           MOVE W-SORT-ACAT-CONTROL-NBR     TO W-DTL1-CONTROL-NBR       CAT816  
           MOVE W-SORT-RCV-NBR              TO W-DTL1-RCV-NBR           CAT816  
DJ0001     MOVE W-SORT-SECURITY-ADP-NBR     TO W-DTL1-SEC-NO            CAT816  
           MOVE W-SORT-ISIN-SEC-ISSUE-CD    TO W-DTL1-CUSIP             CAT816  
           MOVE W-SORT-DESC1                TO W-DTL1-DESC1             CAT816  
           MOVE W-SORT-PSTN-CD              TO W-DTL1-LONG-SHORT        CAT816  
           MOVE W-SORT-QTY                  TO W-DTL1-QTY               CAT816  
           MOVE W-SORT-AMT                  TO W-DTL1-AMT               CAT816  
ET0003     IF  (W-SORT-WITHHELD-CD NOT = 'W')                           CAT816  
ET0003     AND (W-SORT-STTLM-LCTN-CD = '45')                            CAT816  
ET0003        MOVE 'Y'                      TO W-DTL1-MEMO              CAT816  
ET0003     END-IF.                                                      CAT816  
                                                                        CAT816  
           MOVE W-DTL1-REC               TO W-REPT-LINE.                CAT816  
           PERFORM 7700-WRITE-LINE THRU 7700-EXIT.                      CAT816  
           ADD 2                         TO W-LINE-CNT.                 CAT816  
                                                                        CAT816  
           IF  W-SORT-DESC2 > ' '                                       CAT816  
               MOVE W-SORT-DESC2         TO W-DTL2-DESC2                CAT816  
               MOVE W-DTL2-REC           TO W-REPT-LINE                 CAT816  
               PERFORM 7700-WRITE-LINE THRU 7700-EXIT                   CAT816  
               ADD 1                     TO W-LINE-CNT                  CAT816  
               IF  W-SORT-DESC3 > ' '                                   CAT816  
                   MOVE W-SORT-DESC3         TO W-DTL2-DESC2            CAT816  
                   MOVE W-DTL2-REC           TO W-REPT-LINE             CAT816  
                   PERFORM 7700-WRITE-LINE THRU 7700-EXIT               CAT816  
                   ADD 1                     TO W-LINE-CNT              CAT816  
               END-IF                                                   CAT816  
           END-IF                                                       CAT816  
                                                                        CAT816  
           ADD  1                        TO W-CLT-CNT.                  CAT816  
                                                                        CAT816  
       7000-EXIT. EXIT.                                                 CAT816  
      /                                                                 CAT816  
       7100-WRITE-NO-ACT SECTION.                                       CAT816  
                                                                        CAT816  
           DISPLAY 'CAT816: '                                           CAT816  
                       B1-PRT-SUB                                       CAT816  
                   ' ' B1-CLT-NAME (B1-PRT-SUB)                         CAT816  
                   ' NO WITHHELD ASSETS TODAY'                          CAT816  
           MOVE B1-PRT-SUB               TO W-HDR1-CLT                  CAT816  
           MOVE B1-CLT-NAME (B1-PRT-SUB)                                CAT816  
                                         TO W-HDR1-CLT-NAME             CAT816  
                                                                        CAT816  
           ADD  1                        TO W-PAGE-CNT.                 CAT816  
           MOVE 3                        TO W-LINE-CNT.                 CAT816  
                                                                        CAT816  
           MOVE W-PAGE-CNT               TO W-HDR1-PAGE.                CAT816  
                                                                        CAT816  
           MOVE B1-PRT-SUB               TO W-HDR1-CLT.                 CAT816  
           MOVE B1-CLT-NAME (B1-PRT-SUB)                                CAT816  
                                         TO W-HDR1-CLT-NAME.            CAT816  
                                                                        CAT816  
           MOVE W-PROC-DATE-MM           TO W-HDR1-MM.                  CAT816  
           MOVE W-PROC-DATE-DD           TO W-HDR1-DD.                  CAT816  
           MOVE W-PROC-DATE-YY           TO W-HDR1-YY.                  CAT816  
                                                                        CAT816  
           MOVE W-HDR1-REC               TO REPT-LINE.                  CAT816  
           MOVE B1-PRT-SUB               TO REPT-CLT                    CAT816  
           MOVE LOW-VALUES               TO REPT-FIL.                   CAT816  
           WRITE REPT-REC.                                              CAT816  
                                                                        CAT816  
           MOVE B1-BKR-CLR-NO (B1-PRT-SUB) TO W-HDR2-BKR.               CAT816  
           MOVE W-SYS-MM                 TO W-HDR2-MM.                  CAT816  
           MOVE W-SYS-DD                 TO W-HDR2-DD.                  CAT816  
           MOVE W-SYS-YY                 TO W-HDR2-YY.                  CAT816  
           MOVE W-SYS-HH                 TO W-HDR2-HH.                  CAT816  
           MOVE W-SYS-MN                 TO W-HDR2-MN.                  CAT816  
                                                                        CAT816  
           MOVE W-HDR2-REC               TO REPT-LINE.                  CAT816  
           MOVE B1-PRT-SUB               TO REPT-CLT                    CAT816  
           MOVE LOW-VALUES               TO REPT-FIL.                   CAT816  
           WRITE REPT-REC.                                              CAT816  
                                                                        CAT816  
           MOVE W-DTLX-REC               TO REPT-LINE.                  CAT816  
           MOVE B1-PRT-SUB               TO REPT-CLT.                   CAT816  
           MOVE LOW-VALUES               TO REPT-FIL.                   CAT816  
           WRITE REPT-REC.                                              CAT816  
                                                                        CAT816  
       7100-EXIT. EXIT.                                                 CAT816  
      /                                                                 CAT816  
       7700-WRITE-LINE SECTION.                                         CAT816  
                                                                        CAT816  
           IF   W-LINE-CNT > 56                                         CAT816  
                PERFORM 7800-WRITE-HDR THRU 7800-EXIT.                  CAT816  
                                                                        CAT816  
           MOVE W-REPT-LINE              TO REPT-LINE.                  CAT816  
           MOVE B1-PRT-SUB               TO REPT-CLT.                   CAT816  
           MOVE LOW-VALUES               TO REPT-FIL.                   CAT816  
           WRITE REPT-REC.                                              CAT816  
                                                                        CAT816  
       7700-EXIT. EXIT.                                                 CAT816  
      /                                                                 CAT816  
       7800-WRITE-HDR    SECTION.                                       CAT816  
                                                                        CAT816  
           ADD  1                        TO W-PAGE-CNT.                 CAT816  
                                                                        CAT816  
           MOVE W-PAGE-CNT               TO W-HDR1-PAGE.                CAT816  
                                                                        CAT816  
           MOVE B1-PRT-SUB               TO W-HDR1-CLT.                 CAT816  
           MOVE B1-CLT-NAME (B1-PRT-SUB)                                CAT816  
                                         TO W-HDR1-CLT-NAME.            CAT816  
                                                                        CAT816  
           MOVE W-PROC-DATE-MM           TO W-HDR1-MM.                  CAT816  
           MOVE W-PROC-DATE-DD           TO W-HDR1-DD.                  CAT816  
           MOVE W-PROC-DATE-YY           TO W-HDR1-YY.                  CAT816  
                                                                        CAT816  
           MOVE W-HDR1-REC               TO REPT-LINE.                  CAT816  
           MOVE B1-PRT-SUB               TO REPT-CLT                    CAT816  
           MOVE LOW-VALUES               TO REPT-FIL.                   CAT816  
           WRITE REPT-REC.                                              CAT816  
                                                                        CAT816  
           MOVE B1-BKR-CLR-NO (B1-PRT-SUB) TO W-HDR2-BKR.               CAT816  
           MOVE W-SYS-MM                 TO W-HDR2-MM.                  CAT816  
           MOVE W-SYS-DD                 TO W-HDR2-DD.                  CAT816  
           MOVE W-SYS-YY                 TO W-HDR2-YY.                  CAT816  
           MOVE W-SYS-HH                 TO W-HDR2-HH.                  CAT816  
           MOVE W-SYS-MN                 TO W-HDR2-MN.                  CAT816  
                                                                        CAT816  
           MOVE W-HDR2-REC               TO REPT-LINE.                  CAT816  
           MOVE B1-PRT-SUB               TO REPT-CLT                    CAT816  
           MOVE LOW-VALUES               TO REPT-FIL.                   CAT816  
           WRITE REPT-REC.                                              CAT816  
                                                                        CAT816  
***********MOVE*W-HDR3-REC***************TO*REPT-LINE.******************CAT816  
***********MOVE*B1-PRT-SUB***************TO*REPT-CLT********************CAT816  
***********MOVE*LOW-VALUES***************TO*REPT-FIL.*******************CAT816  
***********WRITE*REPT-REC.**********************************************CAT816  
************************************************************************CAT816  
***********MOVE*W-HDR4-REC***************TO*REPT-LINE.******************CAT816  
***********MOVE*B1-PRT-SUB***************TO*REPT-CLT********************CAT816  
***********MOVE*LOW-VALUES***************TO*REPT-FIL.*******************CAT816  
***********WRITE*REPT-REC.**********************************************CAT816  
************************************************************************CAT816  
***********MOVE*W-HDR5-REC***************TO*REPT-LINE.******************CAT816  
***********MOVE*B1-PRT-SUB***************TO*REPT-CLT********************CAT816  
***********MOVE*LOW-VALUES***************TO*REPT-FIL.*******************CAT816  
***********WRITE*REPT-REC.**********************************************CAT816  
                                                                        CAT816  
           MOVE W-HDR6-REC               TO REPT-LINE.                  CAT816  
           MOVE B1-PRT-SUB               TO REPT-CLT                    CAT816  
           MOVE LOW-VALUES               TO REPT-FIL.                   CAT816  
           WRITE REPT-REC.                                              CAT816  
                                                                        CAT816  
           MOVE 7                        TO W-LINE-CNT.                 CAT816  
                                                                        CAT816  
       7800-EXIT. EXIT.                                                 CAT816  
      /                                                                 CAT816  
       8500-SQL-ERROR      SECTION.                                     CAT816  
           DISPLAY ' '                                                  CAT816  
           DISPLAY '8500-SQL-ERROR'                                     CAT816  
                  ' INFILE-CNT = ' W-INFILE-CNT                         CAT816  
           ' LAST-COMMIT-INFILE-CNT = ' W-LAST-COMMIT-INFILE-CNT        CAT816  
                                                                        CAT816  
           DISPLAY ' '                                                  CAT816  
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                  CAT816  
                                    W-DB2-MESSAGE-LEN.                  CAT816  
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                        CAT816  
             UNTIL W-DB2-IDX GREATER THAN 12                            CAT816  
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES              CAT816  
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)               CAT816  
                   END-IF                                               CAT816  
           END-PERFORM.                                                 CAT816  
           DISPLAY ' '                                                  CAT816  
                                                                        CAT816  
           DISPLAY 'CAT816: U3999 - ABENDING ON BAD DB2 STATUS'         CAT816  
           PERFORM 8900-DISPLAY-CNT THRU 8900-EXIT                      CAT816  
           DISPLAY 'CAT816: PROGRAM ENDED ABNORMALLY'                   CAT816  
           MOVE +3999 TO ABEND-CD                                       CAT816  
           CALL  ABEND  USING ABEND-CD.                                 CAT816  
                                                                        CAT816  
       8500-EXIT. EXIT.                                                 CAT816  
      /                                                                 CAT816  
       8900-DISPLAY-CNT   SECTION.                                      CAT816  
           DISPLAY ' '                                                  CAT816  
           DISPLAY 'CAT816: INFILE  COUNT      = ' W-INFILE-CNT         CAT816  
                 ' (VTRNFR)'                                            CAT816  
           DISPLAY 'CAT816: DETAIL  COUNT      = ' W-DETAIL-CNT         CAT816  
                 ' (VASSET)'                                            CAT816  
           DISPLAY 'CAT816: W-LOAD-CNT         = ' W-LOAD-CNT           CAT816  
           .                                                            CAT816  
       8900-EXIT. EXIT.                                                 CAT816  
      /                                                                 CAT816  
       9000-CLOSE-ROUTINE SECTION.                                      CAT816  
                                                                        CAT816  
           CLOSE REPT-FILE.                                             CAT816  
           DISPLAY 'CAT816: REPORT   CLOSED. STATUS = '                 CAT816  
                                               REPT-STAT.               CAT816  
                                                                        CAT816  
           DISPLAY ' '.                                                 CAT816  
           DISPLAY 'CAT816: INFILE CNT = ' W-INFILE-CNT.                CAT816  
                                                                        CAT816  
           DISPLAY ' '.                                                 CAT816  
           DISPLAY 'CAT816: PROGRAM ENDED SUCCESSFULLY'.                CAT816  
                                                                        CAT816  
       9000-EXIT.                                                       CAT816  
           EXIT.                                                        CAT816  
      *################################################################ CAT816  
