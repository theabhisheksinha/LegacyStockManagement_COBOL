000001* PDX    - CAT718   C0348882 12/06/13 06:49:41 TBCHKOP            00001000
000001* CSG001 SSR 91356  MOVE SPACES TO BPDATES-CALENDAR-TYPE.         00001000
000001* PDX    - CAT718   C0272583 12/08/08 09:45:37 TBDOJUN            00001000
000001* DJ0002 SSR 61164 POSITION TRANSFER FUND(PTF)                    00001000
000001* PDX    - CAT718   C0259499 03/07/08 08:33:48 TBLAMUR            00001000
      * LRM004 SSR 47237 AGE OFF RESTRICTED SECURITY ITEMS              CAT718  
000001* PDX    - CAT718   C0246152 05/18/07 09:31:08 TBLAMUR            00001000
      * LRM003 SSR 47213 AGE OFF RESIDUAL CREDIT EXCLUSIONS             CAT718  
000001* PDX    - CAT718   C0225364 09/12/05 08:55:21 TBLAMUR            00001000
      * LRM002 USE TRADE DATE DISPLACEMENT NOT CALENDAR FOR PTR AGING   CAT718  
000001* PDX    - CAT718   C0214955 01/05/05 14:14:03 TBEDTAK            00001000
      * ET0001 DB2 INITIAL TBL KEY CHANGE WITH NEW TABLE NAME           CAT718  
000001* PDX    - CAT718   C0176107 06/06/02 13:44:30 TBLAMUR            00001000
000001* PDX    - CAT718   C0158537 08/20/01 10:24:18 TBLAMUR            00001000
      * LRM001 SSR# R3848800 PURGE VINITAST RCVR DELETE REQUESTS        CAT718  
000001* PDX    - CAT718   C0151178 12/18/00 08:42:23 TBDOJUN            00001000
      * DJ0001 SSR# R2262400 W8 FIELDS COPYBOOK RECOMPILE. COBOL LE     CAT718  
000001* PDX    - CAT718   C0141535 05/22/00 10:05:58 TBLAMUR            CAT718  
000001* PDX    - CAT718   C0125684 05/10/99 17:07:38 TBLAMUR            CAT718  
000001* PDX    - CAT718   C0121510 02/08/99 21:58:17 TBLAMUR            CAT718  
000001* PDX    - CAT718   C0115343 11/02/98 16:34:36 TVFRSAB            CAT718  
000001* PDX    - CAT718T  C0113972 11/02/98 16:23:22 TVFRSAB            CAT718  
000001* PDX    - CAT718   C0115343 09/09/98 16:03:28 TBTIKUO            CAT718  
       IDENTIFICATION DIVISION.                                         CAT718  
       PROGRAM-ID.  CAT718.                                             CAT718  
      *REMARK.                                                          CAT718  
      *  ACATS REDESIGN -                                               CAT718  
      *        THIS PROGRAM DOES ACAT DATABASE MAINTENACE -             CAT718  
      *        AGED PTR                                                 CAT718  
      *--------------------------------------------------------------   CAT718  
LRM   * 05/17/00 ADDED PURGE RTN FOR VINITRNF, VINITAST 30 DAYS.        CAT718  
      *          PURGE VFNDNA, VFNDRGST, VFNDSRVS 1 YEAR.               CAT718  
      *--------------------------------------------------------------   CAT718  
       AUTHOR.      DHEERAJ & LISA.                                     CAT718  
       DATE-WRITTEN.  OCT 1998.                                         CAT718  
       ENVIRONMENT DIVISION.                                            CAT718  
       INPUT-OUTPUT SECTION.                                            CAT718  
       FILE-CONTROL.                                                    CAT718  
       DATA DIVISION.                                                   CAT718  
      ******************************************************************CAT718  
       WORKING-STORAGE SECTION.                                         CAT718  
      ******************************************************************CAT718  
                                                                        CAT718  
DJ0001     COPY PDXIDCOB.                                               CAT718  
                                                                        CAT718  
       77  FILLER                      PIC X(06)   VALUE 'CAT718'.      CAT718  
       77  WS-COUNT                    PIC S9(9) COMP   VALUE +0.       CAT718  
       77  WS-VTRNFR-DELETE-COUNT      PIC S9(5) COMP-3 VALUE +0.       CAT718  
       77  WS-VFNDNA-DELETE-COUNT      PIC S9(5) COMP-3 VALUE +0.       CAT718  
       77  WS-VFNDRGST-DELETE-COUNT    PIC S9(5) COMP-3 VALUE +0.       CAT718  
       77  WS-VFNDSRVS-DELETE-COUNT    PIC S9(5) COMP-3 VALUE +0.       CAT718  
       77  WS-VINITRNF-DELETE-COUNT    PIC S9(5) COMP-3 VALUE +0.       CAT718  
       77  WS-VINITAST-DELETE-COUNT    PIC S9(5) COMP-3 VALUE +0.       CAT718  
LRM003 77  WS-VRSDSEC-DELETE-COUNT     PIC S9(5) COMP-3 VALUE +0.       CAT718  
LRM003 77  WS-VRSDACC-DELETE-COUNT     PIC S9(5) COMP-3 VALUE +0.       CAT718  
LRM004 77  WS-VRSTSEC-DELETE-COUNT     PIC S9(5) COMP-3 VALUE +0.       CAT718  
LRM004 77  WS-VRSTBRKR-DELETE-COUNT    PIC S9(5) COMP-3 VALUE +0.       CAT718  
       77  WS-LENGTH                   PIC S9(09) COMP VALUE +240.      CAT718  
                                                                        CAT718  
      /                                                                 CAT718  
DJ0001***===> COBOL LE                                                  CAT718  
DJ0001 01  W-ABEND-AREA.                                                CAT718  
DJ0001     05  ABEND-CODE                PIC S9(04) COMP SYNC.          CAT718  
DJ0001 01  CALL-MODULES.                                                CAT718  
DJ0001     05  DSNTIAR                   PIC  X(08) VALUE 'DSNTIAR '.   CAT718  
DJ0001 01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.   CAT718  
DJ0001     COPY STUBCPY.                                                CAT718  
DJ0001***<=== COBOL LE                                                  CAT718  
      /                                                                 CAT718  
       01  WS-COUNTERS.                                                 CAT718  
           05  WS-A-COMMIT-COUNTER     PIC  9(5)   VALUE ZEROS.         CAT718  
           05  WS-TOTAL-FETCH-COUNTER  PIC  9(5)   VALUE ZEROS.         CAT718  
                                                                        CAT718  
       01  WS-END-OF-FILE              PIC X       VALUE 'N'.           CAT718  
           88  END-EOF                 VALUE 'Y'.                       CAT718  
       01  WS-VFNDNA-EOF-SW            PIC X       VALUE 'N'.           CAT718  
           88  VFNDNA-EOF              VALUE 'Y'.                       CAT718  
       01  WS-VFNDRGST-EOF-SW          PIC X       VALUE 'N'.           CAT718  
           88  VFNDRGST-EOF            VALUE 'Y'.                       CAT718  
       01  WS-VFNDSRVS-EOF-SW          PIC X       VALUE 'N'.           CAT718  
           88  VFNDSRVS-EOF            VALUE 'Y'.                       CAT718  
       01  WS-VINITRNF-EOF-SW          PIC X       VALUE 'N'.           CAT718  
           88  VINITRNF-EOF            VALUE 'Y'.                       CAT718  
       01  WS-VINITAST-EOF-SW          PIC X       VALUE 'N'.           CAT718  
           88  VINITAST-EOF            VALUE 'Y'.                       CAT718  
LRM003 01  WS-VRSDSEC-EOF-SW           PIC X       VALUE 'N'.           CAT718  
LRM003     88  VRSDSEC-EOF             VALUE 'Y'.                       CAT718  
LRM003 01  WS-VRSDACC-EOF-SW           PIC X       VALUE 'N'.           CAT718  
LRM003     88  VRSDACC-EOF             VALUE 'Y'.                       CAT718  
LRM004 01  WS-VRSTSEC-EOF-SW           PIC X       VALUE 'N'.           CAT718  
LRM004     88  VRSTSEC-EOF             VALUE 'Y'.                       CAT718  
LRM004 01  WS-VRSTBRKR-EOF-SW          PIC X       VALUE 'N'.           CAT718  
LRM004     88  VRSTBRKR-EOF            VALUE 'Y'.                       CAT718  
                                                                        CAT718  
                                                                        CAT718  
       01  WS-CAT718-WORK-AREA.                                         CAT718  
TCK   ***                                                               CAT718  
           03  WS-SQL-SEQ-NUM          PIC Z99     VALUE ZEROS.         CAT718  
           03  WS-FIRST-TIME-SW        PIC X(1)    VALUE 'Y'.           CAT718  
               88  FIRST-TIME          VALUE 'Y'.                       CAT718  
           03  WK-CLIENT-NBR           PIC X(03)   VALUE LOW-VALUES.    CAT718  
           03  SV-CLIENT-NBR           PIC X(04)   VALUE LOW-VALUES.    CAT718  
           03  WS-CLIENT-NBR           PIC X(04)   VALUE LOW-VALUES.    CAT718  
           03  WS-ACAT-CONTROL-NBR     PIC X(14)   VALUE LOW-VALUES.    CAT718  
           03  WS-ACAT-PARTL-NN-DAY    PIC 9(02)   VALUE 0.             CAT718  
           03  WS-CRT-TIMESTAMP.                                        CAT718  
               05  WS-CRT-YYYY         PIC X(04).                       CAT718  
               05  FILLER              PIC X.                           CAT718  
               05  WS-CRT-MM           PIC X(02).                       CAT718  
               05  FILLER              PIC X.                           CAT718  
               05  WS-CRT-DD           PIC X(02).                       CAT718  
               05  FILLER              PIC X(16).                       CAT718  
           03  WS-CRT-DATE.                                             CAT718  
               05  WS-CRTD-YYYY        PIC X(04).                       CAT718  
               05  WS-CRTD-MM          PIC X(02).                       CAT718  
               05  WS-CRTD-DD          PIC X(02).                       CAT718  
           03  WS-AGED-FND-TMSTP       PIC X(26)  VALUE                 CAT718  
               '1990-12-31-01.01.01.000001'.                            CAT718  
           03  WS-AGED-INIT-TMSTP      PIC X(26)  VALUE                 CAT718  
               '1990-12-31-01.01.01.000001'.                            CAT718  
LRM003     03  WS-TODAY-EXP-CCYYMDD    PIC X(10).                       CAT718  
TCK   ***                                                               CAT718  
009918     03  WS-TODAY-MMDDCCYY.                                       CAT718  
               05  WS-TD-MM            PIC XX.                          CAT718  
               05  WS-TD-DD            PIC XX.                          CAT718  
               05  WS-TD-CC            PIC XX.                          CAT718  
               05  WS-TD-YY            PIC XX.                          CAT718  
009918     03  WS-TODAY-CCYYMMDD-AREA.                                  CAT718  
               05  WS-TODAY-CC         PIC XX.                          CAT718  
               05  WS-TODAY-YY         PIC XX.                          CAT718  
               05  WS-TODAY-MM         PIC XX.                          CAT718  
               05  WS-TODAY-DD         PIC XX.                          CAT718  
009918     03  WS-TODAY-CCYYMMDD REDEFINES                              CAT718  
               WS-TODAY-CCYYMMDD-AREA  PIC 9(08).                       CAT718  
009916     03  WS-ASOF-SAVE            PIC 9(08).                       CAT718  
009916     03  WS-BAL1-SAVE            PIC 9(08).                       CAT718  
009916     03  WS-ASOF-CCYYMMDD        PIC 9(08).                       CAT718  
009919     03  WS-ASOF-CCYYMMDD-AREA REDEFINES WS-ASOF-CCYYMMDD.        CAT718  
009920         05  WS-ASOF-CC          PIC X(02).                       CAT718  
009920         05  WS-ASOF-YY          PIC X(02).                       CAT718  
009920         05  WS-ASOF-MM          PIC X(02).                       CAT718  
009920         05  WS-ASOF-DD          PIC X(02).                       CAT718  
009918     03  WS-DATE-CCYYMMDD        PIC 9(08).                       CAT718  
009919     03  WS-DATE-CCYYMMDD-AREA REDEFINES WS-DATE-CCYYMMDD.        CAT718  
009920         05  WS-DATE-CCYYMMDD-CC           PIC X(02).             CAT718  
009930         05  WS-DATE-CCYYMMDD-YY           PIC X(02).             CAT718  
009940         05  WS-DATE-CCYYMMDD-MM           PIC X(02).             CAT718  
009950         05  WS-DATE-CCYYMMDD-DD           PIC X(02).             CAT718  
009918     03  WS-DATE-MMDDCCYY        PIC 9(08).                       CAT718  
009919     03  WS-DATE-MMDDCCYY-AREA REDEFINES WS-DATE-MMDDCCYY.        CAT718  
009920         05  WS-DATE-CCYYMMDD-MM           PIC X(02).             CAT718  
009930         05  WS-DATE-CCYYMMDD-DD           PIC X(02).             CAT718  
009940         05  WS-DATE-CCYYMMDD-CC           PIC X(02).             CAT718  
009950         05  WS-DATE-CCYYMMDD-YY           PIC X(02).             CAT718  
           03  WS-DATE-MMDDYY            PIC 9(06).                     CAT718  
           03  FILLER REDEFINES WS-DATE-MMDDYY.                         CAT718  
               05 WS-DATE-MMDDYY-MM      PIC X(02).                     CAT718  
               05 WS-DATE-MMDDYY-DD      PIC X(02).                     CAT718  
               05 WS-DATE-MMDDYY-YY      PIC X(02).                     CAT718  
           03  WS-NEXT-MMDDYY            PIC X(06).                     CAT718  
           03  WS-AGED-DATE-CCYYMMDD.                                   CAT718  
               05  WS-DATENEW-CALC-CC  PIC XX.                          CAT718  
               05  WS-DATENEW-CALC-YY  PIC XX.                          CAT718  
               05  WS-DATENEW-CALC-MM  PIC XX.                          CAT718  
               05  WS-DATENEW-CALC-DD  PIC XX.                          CAT718  
           03  WS-AGED-DATE-CCYYMMDD-NUM REDEFINES                      CAT718  
               WS-AGED-DATE-CCYYMMDD   PIC 9(08).                       CAT718  
           03  WS-AGED-FND-CCYYMMDD.                                    CAT718  
               05  WS-AGED-FND-CCYYMMDD-NUM  PIC 9(08).                 CAT718  
           03  WS-AGED-INIT-CCYYMMDD.                                   CAT718  
               05  WS-AGED-INIT-CCYYMMDD-NUM PIC 9(08).                 CAT718  
      *                                                                 CAT718  
       01  MS-MESSAGE.                                                  CAT718  
           05  MS-MESSAGE1        PIC X(120)     VALUE SPACES.          CAT718  
           05  MS-MESSAGE2        PIC X(120)     VALUE SPACES.          CAT718  
           05  MS-MESSAGE3        PIC X(120)     VALUE SPACES.          CAT718  
                                                                        CAT718  
       01  WS-MESSAGE.                                                  CAT718  
           05  WS-ERR-LEN         PIC S9(4) COMP VALUE +1200.           CAT718  
           05  WS-ERR-TXT         PIC X(120) OCCURS 10 TIMES.           CAT718  
                                                                        CAT718  
       01  WS-ERROR-MSG.                                                CAT718  
           05  FILLER             PIC X(70)      VALUE                  CAT718  
           '**DB2** MESSAGE COULD NOT BE TRANSLATED ERROR IN DSNTIAR'.  CAT718  
           05  WS-DSNTIAR-RC      PIC X(08).                            CAT718  
      /                                                                 CAT718  
      *DB2 COMMUNICATION AREA                                           CAT718  
           EXEC SQL                                                     CAT718  
              INCLUDE SQLCA                                             CAT718  
           END-EXEC.                                                    CAT718  
      /                                                                 CAT718  
           EXEC SQL                                                     CAT718  
              INCLUDE VFNDNA                                            CAT718  
           END-EXEC.                                                    CAT718  
      /                                                                 CAT718  
           EXEC SQL                                                     CAT718  
              INCLUDE VFNDRGST                                          CAT718  
           END-EXEC.                                                    CAT718  
      /                                                                 CAT718  
           EXEC SQL                                                     CAT718  
              INCLUDE VFNDSRVS                                          CAT718  
           END-EXEC.                                                    CAT718  
      /                                                                 CAT718  
           EXEC SQL                                                     CAT718  
ET0001        INCLUDE ACTITRF                                           CAT718  
           END-EXEC.                                                    CAT718  
      /                                                                 CAT718  
           EXEC SQL                                                     CAT718  
ET0001        INCLUDE ACTIAST                                           CAT718  
           END-EXEC.                                                    CAT718  
      /                                                                 CAT718  
           EXEC SQL                                                     CAT718  
              INCLUDE VTRNFR                                            CAT718  
           END-EXEC.                                                    CAT718  
      /                                                                 CAT718  
           EXEC SQL                                                     CAT718  
              INCLUDE VTRNHSTY                                          CAT718  
           END-EXEC.                                                    CAT718  
LRM003/                                                                 CAT718  
LRM003     EXEC SQL                                                     CAT718  
LRM003        INCLUDE VRSDACC                                           CAT718  
LRM003     END-EXEC.                                                    CAT718  
LRM003/                                                                 CAT718  
LRM003     EXEC SQL                                                     CAT718  
LRM003        INCLUDE VRSDSEC                                           CAT718  
LRM003     END-EXEC.                                                    CAT718  
LRM004/                                                                 CAT718  
LRM004     EXEC SQL                                                     CAT718  
LRM004        INCLUDE VRSTBRKR                                          CAT718  
LRM004     END-EXEC.                                                    CAT718  
LRM004/                                                                 CAT718  
LRM004     EXEC SQL                                                     CAT718  
LRM004        INCLUDE VRSTSEC                                           CAT718  
LRM004     END-EXEC.                                                    CAT718  
      /                                                                 CAT718  
           COPY BHINFO.                                                 CAT718  
      /                                                                 CAT718  
           COPY BHACAT.                                                 CAT718  
      /                                                                 CAT718  
           COPY RECDATZC.                                               CAT718  
      /                                                                 CAT718  
           COPY LKDTSRCH.                                               CAT718  
      /                                                                 CAT718  
           COPY BPDATESC.                                               CAT718  
      /                                                                 CAT718  
                                                                        CAT718  
      *** SELECT AGED ROWS FROM INITIAL TRANSFER TABLE ****             CAT718  
      *DECLARE CURSOR                                                   CAT718  
           EXEC SQL                                                     CAT718  
                DECLARE VFNDNA_CSR CURSOR    WITH HOLD FOR              CAT718  
                SELECT                                                  CAT718  
                    CLIENT_NBR                                          CAT718  
                   ,ACAT_CONTROL_NBR                                    CAT718  
                   ,ASSET_SEQ_NBR                                       CAT718  
                   ,NA_LINE_NBR                                         CAT718  
                   ,CRT_TMSTP                                           CAT718  
                FROM VFNDNA                                             CAT718  
                WHERE                                                   CAT718  
                     CRT_TMSTP < :WS-AGED-FND-TMSTP                     CAT718  
           END-EXEC.                                                    CAT718  
                                                                        CAT718  
      /                                                                 CAT718  
                                                                        CAT718  
      *** SELECT AGED ROWS FROM INITIAL TRANSFER TABLE ****             CAT718  
      *DECLARE CURSOR                                                   CAT718  
           EXEC SQL                                                     CAT718  
                DECLARE VFNDRGST_CSR CURSOR  WITH HOLD FOR              CAT718  
                SELECT                                                  CAT718  
                    CLIENT_NBR                                          CAT718  
                   ,ACAT_CONTROL_NBR                                    CAT718  
                   ,ASSET_SEQ_NBR                                       CAT718  
                   ,CRT_TMSTP                                           CAT718  
                FROM VFNDRGST                                           CAT718  
                WHERE                                                   CAT718  
                     CRT_TMSTP < :WS-AGED-FND-TMSTP                     CAT718  
           END-EXEC.                                                    CAT718  
                                                                        CAT718  
      /                                                                 CAT718  
                                                                        CAT718  
      *** SELECT AGED ROWS FROM INITIAL TRANSFER TABLE ****             CAT718  
      *DECLARE CURSOR                                                   CAT718  
           EXEC SQL                                                     CAT718  
                DECLARE VFNDSRVS_CSR CURSOR  WITH HOLD FOR              CAT718  
                SELECT                                                  CAT718  
                    CLIENT_NBR                                          CAT718  
                   ,ACAT_CONTROL_NBR                                    CAT718  
                   ,ASSET_SEQ_NBR                                       CAT718  
                   ,CRT_TMSTP                                           CAT718  
                FROM VFNDSRVS                                           CAT718  
                WHERE                                                   CAT718  
                     CRT_TMSTP < :WS-AGED-FND-TMSTP                     CAT718  
           END-EXEC.                                                    CAT718  
                                                                        CAT718  
      /                                                                 CAT718  
                                                                        CAT718  
      *** SELECT AGED ROWS FROM INITIAL TRANSFER TABLE ****             CAT718  
      *DECLARE CURSOR                                                   CAT718  
           EXEC SQL                                                     CAT718  
                DECLARE VINITRNF_CSR CURSOR  WITH HOLD FOR              CAT718  
                SELECT                                                  CAT718  
                    CLIENT_NBR                                          CAT718  
                   ,ACAT_CONTROL_NBR                                    CAT718  
                   ,DLVR_NBR                                            CAT718  
                   ,ACCT_DLVR_NBR                                       CAT718  
                   ,RCV_NBR                                             CAT718  
                   ,ACCT_RCV_NBR                                        CAT718  
                   ,TRNFR_TYPE_CD                                       CAT718  
                   ,CRT_TMSTP                                           CAT718  
ET0001**        FROM VINITRNF                                           CAT718  
ET0001          FROM ACTITRF                                            CAT718  
                WHERE                                                   CAT718  
                     CRT_TMSTP < :WS-AGED-INIT-TMSTP                    CAT718  
           END-EXEC.                                                    CAT718  
                                                                        CAT718  
      /                                                                 CAT718  
                                                                        CAT718  
      *** SELECT AGED ROWS FROM INITIAL ASSET TABLE ****                CAT718  
      *** OR RECEIVER DELETE REQUESTS WHICH WERE NOT PROCESSED                  
      *DECLARE CURSOR                                                   CAT718  
           EXEC SQL                                                     CAT718  
                DECLARE VINITAST_CSR CURSOR  WITH HOLD FOR              CAT718  
                SELECT                                                  CAT718  
                    CLIENT_NBR                                          CAT718  
                   ,ACAT_CONTROL_NBR                                    CAT718  
                   ,DLVR_NBR                                            CAT718  
                   ,ACCT_DLVR_NBR                                       CAT718  
                   ,RCV_NBR                                             CAT718  
                   ,ACCT_RCV_NBR                                        CAT718  
                   ,ISIN_CNTRY_CD                                       CAT718  
                   ,ISIN_SEC_ISSUE_CD                                   CAT718  
                   ,ISIN_SEC_CDG_CD                                     CAT718  
                   ,STTLM_LCTN_CD                                       CAT718  
                   ,CSH_MGN_SHRT_CD                                     CAT718  
ET0001             ,ASSET_SEQ_NBR                                       CAT718  
ET0001             ,TRNFR_TYPE_CD                                       CAT718  
                   ,CRT_TMSTP                                           CAT718  
                   ,TRANS_TYPE_CD                                               
                   ,PRGM_NM                                                     
ET0001**        FROM VINITAST                                           CAT718  
ET0001          FROM ACTIAST                                            CAT718  
                WHERE                                                   CAT718  
                     CRT_TMSTP < :WS-AGED-INIT-TMSTP                    CAT718  
                     OR (PRGM_NM LIKE 'ACAT04%%'                                
                        AND TRANS_TYPE_CD = 'D')                                
           END-EXEC.                                                    CAT718  
                                                                        CAT718  
      /                                                                 CAT718  
                                                                        CAT718  
      *** SELECT AGED PTR FROM ACTIVE TRANSFER TABLE ****               CAT718  
      *DECLARE CURSOR                                                   CAT718  
           EXEC SQL                                                     CAT718  
                DECLARE PTR_CSR CURSOR  WITH HOLD FOR                   CAT718  
                SELECT                                                  CAT718  
                    CLIENT_NBR                                          CAT718  
                   ,ACAT_CONTROL_NBR                                    CAT718  
                   ,SBMTG_PRTCP_NBR                                     CAT718  
                   ,SBMT_PRT_NR_STS_CD                                  CAT718  
                   ,CONTROL_NBR_STS_CD                                  CAT718  
                   ,DLVR_NBR                                            CAT718  
                   ,DLVR_NBR_STTS_CD                                    CAT718  
                   ,ACCT_DLVR_NBR                                       CAT718  
                   ,ACCT_DLVR_STTS_CD                                   CAT718  
                   ,RCV_NBR                                             CAT718  
                   ,RCV_NBR_STTS_CD                                     CAT718  
                   ,ACCT_RCV_NBR                                        CAT718  
                   ,ACCT_RCV_STTS_CD                                    CAT718  
                   ,TRNFR_TYPE_CD                                       CAT718  
                   ,TRNFR_TYPE_STTS_CD                                  CAT718  
                   ,TRANS_TYPE_CD                                       CAT718  
                   ,TRANS_TYPE_STTS_CD                                  CAT718  
                   ,RCV_CUST_NM                                         CAT718  
                   ,RCV_CUST_NM_STS_CD                                  CAT718  
                   ,RCV_SS_PRIM_NBR                                     CAT718  
                   ,RCV_SS_PRIM_STS_CD                                  CAT718  
                   ,RCV_SS_SCNDY_NBR                                    CAT718  
                   ,RCV_SS_SCDY_STS_CD                                  CAT718  
                   ,RCV_ACCT_TYPE_CD                                    CAT718  
                   ,RCV_ACT_TYP_STS_CD                                  CAT718  
                   ,RCV_OCC_BRKR_NBR                                    CAT718  
                   ,RCV_OCC_STTS_CD                                     CAT718  
                   ,RCV_CRSPN_NBR                                       CAT718  
                   ,RCV_CRSPN_STTS_CD                                   CAT718  
                   ,ACAT_CNTL_ASTD_NBR                                  CAT718  
                   ,CNTL_ASTD_STTS_CD                                   CAT718  
                   ,CMNT_TXT                                            CAT718  
                   ,CMNT_STTS_CD                                        CAT718  
                   ,PRCS_DT                                             CAT718  
                   ,STTS_CD                                             CAT718  
                   ,STTLM_TM_CD                                         CAT718  
                   ,VAL_FREE_CD                                         CAT718  
                   ,TRANS_RFRN_ID_CD                                    CAT718  
                   ,TRANS_RFRN_STTS_CD                                  CAT718  
                   ,DB_CR_CD                                            CAT718  
                   ,DSTBN_SIDE_CD                                       CAT718  
                   ,SYS_ACT_CD                                          CAT718  
                   ,SYS_RJCT_RSN_CD                                     CAT718  
                   ,TRNFR_TYPE_RJC1_CD                                  CAT718  
                   ,TRNFR_TYPE_RJC2_CD                                  CAT718  
                   ,TRNFR_TYPE_RJCT_CD                                  CAT718  
                   ,TRN_TYP_RJC_STS_CD                                  CAT718  
                   ,PHSCL_SEQ_NBR                                       CAT718  
                   ,PHSCL_SEQ_STTS_CD                                   CAT718  
                   ,LGCL_SEQ_NBR                                        CAT718  
                   ,LGCL_SEQ_NR_STS_CD                                  CAT718  
                   ,RR_CD                                               CAT718  
                   ,BRANCH_CD                                           CAT718  
                   ,DVDND_NAA_CD                                        CAT718  
                   ,SELL_INSTN_NAA_CD                                   CAT718  
                   ,CASH_SWEEP_NAA_CD                                   CAT718  
                   ,PRTCP_CONTRA_CD                                     CAT718  
                   ,ACM_HOLDER_NAA_CD                                   CAT718  
                   ,ACCT_ACTIVITY_IND                                   CAT718  
                   ,ACCT_ORDERS_IND                                     CAT718  
                   ,ACCT_RJCT_RSBM_IND                                  CAT718  
                   ,ACCT_DB_BAL_T1_IND                                  CAT718  
                   ,ACCT_MRGN_DB_IND                                    CAT718  
                   ,ACCT_SHRT_PSTN_IND                                  CAT718  
                   ,ACCT_SEC_RSTRD_IND                                  CAT718  
                   ,ACCT_AST_EXCS_IND                                   CAT718  
                   ,ACCT_OPTN_PSTN_IND                                  CAT718  
                   ,ACCT_LTD_PRTNR_IND                                  CAT718  
                   ,ACCT_TIN_MSMTH_IND                                  CAT718  
                   ,ACCT_DPLCT_TRN_IND                                  CAT718  
                   ,ACCT_CUST_70_IND                                    CAT718  
                   ,ACCT_QULFD_PLN_IND                                  CAT718  
                   ,ACCT_MNGD_IND                                       CAT718  
                   ,ACCT_PRVT_RNG_IND                                   CAT718  
                   ,ACCT_BRKR_TIF_IND                                   CAT718  
                   ,NSCC_NON_ADP_IND                                    CAT718  
                   ,CYCLE_CD                                            CAT718  
                   ,DAYS_STTS_QTY                                       CAT718  
                   ,STTLM_DT                                            CAT718  
                   ,ACCT_NA_UPDT_IND                                    CAT718  
                   ,ACCT_TRNFR_FEE_AMT                                  CAT718  
                   ,ACCT_IRA_TRMNT_AMT                                  CAT718  
                   ,ACCT_IRA_MAINT_AMT                                  CAT718  
                   ,ACCT_DLRV_PRGR_IND                                  CAT718  
                   ,ACCT_CD                                             CAT718  
                   ,STTLM_ASCTD_DT                                      CAT718  
                   ,STTLM_ASCTD_STS_CD                                  CAT718  
                   ,RCRD_LNGTH_STTS_CD                                  CAT718  
                   ,RCRD_STTS_CD                                        CAT718  
                   ,NSCC_PEND_CD                                        CAT718  
                   ,NSCC_ACK_IND                                        CAT718  
                   ,CICS_TERM_ID_CD                                     CAT718  
                   ,PRGM_NM                                             CAT718  
                   ,CRT_TMSTP                                           CAT718  
                   ,UPDT_TMSTP                                          CAT718  
                   ,ACCT_EQUITY_AMT                                     CAT718  
                FROM VTRNFR                                             CAT718  
                WHERE                                                   CAT718  
DJ0002               TRNFR_TYPE_CD IN ('PTR', 'PTF')                    CAT718  
                     ORDER BY CLIENT_NBR, ACAT_CONTROL_NBR              CAT718  
           END-EXEC.                                                    CAT718  
                                                                        CAT718  
LRM003/                                                                 CAT718  
LRM003                                                                  CAT718  
LRM003*** SELECT AGED RESIDUAL CREDIT EXCLUSIONS FROM VRSDSEC ****      CAT718  
LRM003*DECLARE CURSOR                                                   CAT718  
LRM003     EXEC SQL                                                     CAT718  
LRM003          DECLARE VRSDSEC_CSR CURSOR  WITH HOLD FOR               CAT718  
LRM003          SELECT                                                  CAT718  
LRM003              CLIENT_NBR                                          CAT718  
LRM003             ,BRANCH_CD                                                   
LRM003             ,ACCT_CD                                                     
LRM003             ,ISIN_SEC_ISSUE_CD                                           
LRM003             ,EXPTN_DT                                                    
LRM003          FROM VRSDSEC                                            CAT718  
LRM003          WHERE                                                   CAT718  
LRM003               EXPTN_DT  <= :WS-TODAY-EXP-CCYYMDD                 CAT718  
LRM003           AND NOT EXPTN_DT = '0001-01-01'                        CAT718  
LRM003     END-EXEC.                                                    CAT718  
LRM003                                                                  CAT718  
LRM003*** SELECT AGED RESIDUAL CREDIT EXCLUSIONS FROM VRSDACC ****      CAT718  
LRM003*DECLARE CURSOR                                                   CAT718  
LRM003     EXEC SQL                                                     CAT718  
LRM003          DECLARE VRSDACC_CSR CURSOR  WITH HOLD FOR               CAT718  
LRM003          SELECT                                                  CAT718  
LRM003              CLIENT_NBR                                          CAT718  
LRM003             ,BRANCH_CD                                                   
LRM003             ,ACCT_CD                                                     
LRM003             ,EXPTN_DT                                                    
LRM003          FROM VRSDACC                                            CAT718  
LRM003          WHERE                                                   CAT718  
LRM003               EXPTN_DT  <= :WS-TODAY-EXP-CCYYMDD                 CAT718  
LRM003           AND NOT EXPTN_DT = '0001-01-01'                        CAT718  
LRM003     END-EXEC.                                                    CAT718  
LRM003                                                                  CAT718  
LRM004/                                                                 CAT718  
LRM004                                                                  CAT718  
LRM004*** SELECT AGED RESTRICTED SECURITY DETAILS FROM VRSTSEC ****     CAT718  
LRM004*DECLARE CURSOR                                                   CAT718  
LRM004     EXEC SQL                                                     CAT718  
LRM004          DECLARE VRSTSEC_CSR CURSOR  WITH HOLD FOR               CAT718  
LRM004          SELECT                                                  CAT718  
LRM004              CLIENT_NBR                                          CAT718  
LRM004             ,ISIN_SEC_ISSUE_CD                                           
LRM004             ,EXPTN_DT                                                    
LRM004          FROM VRSTSEC                                            CAT718  
LRM004          WHERE                                                   CAT718  
LRM004               EXPTN_DT  <= :WS-TODAY-EXP-CCYYMDD                 CAT718  
LRM004           AND NOT EXPTN_DT = '0001-01-01'                        CAT718  
LRM004     END-EXEC.                                                    CAT718  
LRM004                                                                  CAT718  
      /                                                                         
       LINKAGE SECTION.                                                 CAT718  
       01  PARM-AREA.                                                   CAT718  
           10  PARM-LENGTH         PIC S9(4) COMP.                      CAT718  
           10  PARM-DATA-LIT       PIC X(7).                            CAT718  
           10  FILLER              PIC X.                               CAT718  
           10 PARM-ROLLBACK        PIC X.                               CAT718  
               88 ROLLBACK-YES     VALUE 'Y'.                           CAT718  
               88 ROLLBACK-NO      VALUE 'N'.                           CAT718  
                                                                        CAT718  
      ***************************************************************** CAT718  
       PROCEDURE DIVISION USING PARM-AREA.                              CAT718  
      ***************************************************************** CAT718  
DJ0002     DISPLAY 'CAT718 - DELETE AGED PTR AND PTF'.                  CAT718  
DJ0002     DISPLAY '         DELETE EXPIRED VRSTSEC AND VRSTBRKR'.      CAT718  
           DISPLAY '         DELETE 1 YEAR OLD FUND REGISTRATIONS'.     CAT718  
           DISPLAY ' '.                                                 CAT718  
                                                                        CAT718  
           COPY  MSGCOBO.                                               CAT718  
                                                                        CAT718  
           DISPLAY 'ROLLBACK = ' PARM-ROLLBACK.                         CAT718  
            IF PARM-ROLLBACK EQUAL 'Y'                                  CAT718  
               OR PARM-ROLLBACK EQUAL 'N'                               CAT718  
               NEXT SENTENCE                                            CAT718  
            ELSE                                                        CAT718  
               DISPLAY 'INVALID SYSTEM PARM PASSED'                     CAT718  
               DISPLAY 'PARM DATA = ' PARM-ROLLBACK                     CAT718  
               DISPLAY 'ABENDING PROGRAM CAT718'                        CAT718  
               MOVE 3001     TO ABEND-CODE                              CAT718  
               CALL ABEND USING ABEND-CODE                              CAT718  
               GOBACK.                                                  CAT718  
                                                                        CAT718  
           PERFORM GET-TODAYS-DATE.                                     CAT718  
           PERFORM SET-INITIAL-TMPSTP-AGED-DATE.                        CAT718  
           DISPLAY ' '                                                  CAT718  
           DISPLAY 'PERFORM GET-PTR THRU GET-PTR-EXIT'                  CAT718  
           PERFORM GET-PTR THRU GET-PTR-EXIT.                           CAT718  
           DISPLAY 'TOTAL FETCH = ' WS-TOTAL-FETCH-COUNTER              CAT718  
                 ' TOTAL PARTIAL TRANSFERS DELETED = '                  CAT718  
                   WS-VTRNFR-DELETE-COUNT                               CAT718  
                                                                        CAT718  
           DISPLAY ' '                                                  CAT718  
           DISPLAY 'PERFORM PROCESS-VFNDNA-RTN'                         CAT718  
           PERFORM PROCESS-VFNDNA-RTN.                                  CAT718  
           DISPLAY 'TOTAL VFNDNA   DELETES ' WS-VFNDNA-DELETE-COUNT.    CAT718  
           DISPLAY 'PERFORM PROCESS-VFNDRGST-RTN'                       CAT718  
           PERFORM PROCESS-VFNDRGST-RTN.                                CAT718  
           DISPLAY 'TOTAL VFNDRGST DELETES ' WS-VFNDRGST-DELETE-COUNT.  CAT718  
           DISPLAY 'PERFORM PROCESS-VFNDSRVS-RTN'                       CAT718  
           PERFORM PROCESS-VFNDSRVS-RTN.                                CAT718  
           DISPLAY 'TOTAL VFNDSRVS DELETES ' WS-VFNDSRVS-DELETE-COUNT.  CAT718  
           DISPLAY 'PERFORM PROCESS-VINITRNF-RTN'                       CAT718  
           PERFORM PROCESS-VINITRNF-RTN.                                CAT718  
ET0001**   DISPLAY 'TOTAL VINITRNF DELETES ' WS-VINITRNF-DELETE-COUNT.  CAT718  
ET0001     DISPLAY 'TOTAL ACTITRF DELETES  ' WS-VINITRNF-DELETE-COUNT.  CAT718  
           DISPLAY 'PERFORM PROCESS-VINITAST-RTN'                       CAT718  
           PERFORM PROCESS-VINITAST-RTN.                                CAT718  
ET0001**   DISPLAY 'TOTAL VINITAST DELETES ' WS-VINITAST-DELETE-COUNT.  CAT718  
ET0001     DISPLAY 'TOTAL ACTIAST DELETES  ' WS-VINITAST-DELETE-COUNT.  CAT718  
LRM003     PERFORM PROCESS-VRSDSEC-RTN.                                 CAT718  
LRM003     DISPLAY 'TOTAL VRSDSEC DELETES  ' WS-VRSDSEC-DELETE-COUNT.   CAT718  
LRM003     PERFORM PROCESS-VRSDACC-RTN.                                 CAT718  
LRM003     DISPLAY 'TOTAL VRSDACC DELETES  ' WS-VRSDACC-DELETE-COUNT.   CAT718  
LRM004     PERFORM PROCESS-VRSTSEC-RTN.                                 CAT718  
LRM004     DISPLAY 'TOTAL VRSTSEC DELETES  ' WS-VRSTSEC-DELETE-COUNT.   CAT718  
                                                                        CAT718  
           IF ROLLBACK-YES                                              CAT718  
                   DISPLAY 'ROLLING BACK'                               CAT718  
                   EXEC SQL ROLLBACK                                    CAT718  
               END-EXEC.                                                CAT718  
                                                                        CAT718  
           GOBACK.                                                      CAT718  
                                                                        CAT718  
       GET-TODAYS-DATE.                                                 CAT718  
CSG001* MOVE SPACES TO BPDATES-CALENDAR-TYPE TO ALLOW BPDATES TO USE            
CSG001* THE DEFAULT CALENDAR.                                                   
CSG001*    MOVE 'US'               TO  BPDATES-CALENDAR-TYPE.           CAT718  
CSG001     MOVE '  '               TO  BPDATES-CALENDAR-TYPE.           CAT718  
016570     CALL LNKDATZ    USING LINK-DATES-AREA                        CAT718  
                            BPDATES-CALENDAR-TYPE.                      CAT718  
016580     MOVE LD-PROC-DATE       TO WS-DATE-MMDDYY                    CAT718  
                                      WS-NEXT-MMDDYY.                   CAT718  
016590     PERFORM CONVERT-TO-CCYYMMDD.                                 CAT718  
016600     MOVE WS-DATE-CCYYMMDD    TO WS-TODAY-CCYYMMDD.               CAT718  
           DISPLAY 'TODAYS DATE:  ' WS-TODAY-CCYYMMDD.                  CAT718  
                                                                        CAT718  
*******                                                                 CAT718  
       GET-PTR.                                                         CAT718  
      *                                                                 CAT718  
           MOVE 20 TO WS-SQL-SEQ-NUM.                                   CAT718  
           EXEC SQL                                                     CAT718  
                OPEN PTR_CSR                                            CAT718  
           END-EXEC.                                                    CAT718  
              IF SQLCODE NOT EQUAL ZERO                                 CAT718  
                    PERFORM SQL-ERROR-ROUTINE.                          CAT718  
                                                                        CAT718  
           PERFORM FETCH-TRNF                                           CAT718  
              THRU FETCH-TRNF-EXIT                                      CAT718  
                 UNTIL END-EOF.                                         CAT718  
       GET-PTR-EXIT.                                                    CAT718  
           EXIT.                                                        CAT718  
                                                                        CAT718  
                                                                        CAT718  
       FETCH-TRNF.                                                      CAT718  
              EXEC SQL                                                  CAT718  
                   FETCH PTR_CSR                                        CAT718  
                   INTO                                                 CAT718  
                      :DCLVTRNFR.CLIENT-NBR                             CAT718  
                     ,:DCLVTRNFR.ACAT-CONTROL-NBR                       CAT718  
                     ,:DCLVTRNFR.SBMTG-PRTCP-NBR                        CAT718  
                     ,:DCLVTRNFR.SBMT-PRT-NR-STS-CD                     CAT718  
                     ,:DCLVTRNFR.CONTROL-NBR-STS-CD                     CAT718  
                     ,:DCLVTRNFR.DLVR-NBR                               CAT718  
                     ,:DCLVTRNFR.DLVR-NBR-STTS-CD                       CAT718  
                     ,:DCLVTRNFR.ACCT-DLVR-NBR                          CAT718  
                     ,:DCLVTRNFR.ACCT-DLVR-STTS-CD                      CAT718  
                     ,:DCLVTRNFR.RCV-NBR                                CAT718  
                     ,:DCLVTRNFR.RCV-NBR-STTS-CD                        CAT718  
                     ,:DCLVTRNFR.ACCT-RCV-NBR                           CAT718  
                     ,:DCLVTRNFR.ACCT-RCV-STTS-CD                       CAT718  
                     ,:DCLVTRNFR.TRNFR-TYPE-CD                          CAT718  
                     ,:DCLVTRNFR.TRNFR-TYPE-STTS-CD                     CAT718  
                     ,:DCLVTRNFR.TRANS-TYPE-CD                          CAT718  
                     ,:DCLVTRNFR.TRANS-TYPE-STTS-CD                     CAT718  
                     ,:DCLVTRNFR.RCV-CUST-NM                            CAT718  
                     ,:DCLVTRNFR.RCV-CUST-NM-STS-CD                     CAT718  
                     ,:DCLVTRNFR.RCV-SS-PRIM-NBR                        CAT718  
                     ,:DCLVTRNFR.RCV-SS-PRIM-STS-CD                     CAT718  
                     ,:DCLVTRNFR.RCV-SS-SCNDY-NBR                       CAT718  
                     ,:DCLVTRNFR.RCV-SS-SCDY-STS-CD                     CAT718  
                     ,:DCLVTRNFR.RCV-ACCT-TYPE-CD                       CAT718  
                     ,:DCLVTRNFR.RCV-ACT-TYP-STS-CD                     CAT718  
                     ,:DCLVTRNFR.RCV-OCC-BRKR-NBR                       CAT718  
                     ,:DCLVTRNFR.RCV-OCC-STTS-CD                        CAT718  
                     ,:DCLVTRNFR.RCV-CRSPN-NBR                          CAT718  
                     ,:DCLVTRNFR.RCV-CRSPN-STTS-CD                      CAT718  
                     ,:DCLVTRNFR.ACAT-CNTL-ASTD-NBR                     CAT718  
                     ,:DCLVTRNFR.CNTL-ASTD-STTS-CD                      CAT718  
                     ,:DCLVTRNFR.CMNT-TXT                               CAT718  
                     ,:DCLVTRNFR.CMNT-STTS-CD                           CAT718  
                     ,:DCLVTRNFR.PRCS-DT                                CAT718  
                     ,:DCLVTRNFR.STTS-CD                                CAT718  
                     ,:DCLVTRNFR.STTLM-TM-CD                            CAT718  
                     ,:DCLVTRNFR.VAL-FREE-CD                            CAT718  
                     ,:DCLVTRNFR.TRANS-RFRN-ID-CD                       CAT718  
                     ,:DCLVTRNFR.TRANS-RFRN-STTS-CD                     CAT718  
                     ,:DCLVTRNFR.DB-CR-CD                               CAT718  
                     ,:DCLVTRNFR.DSTBN-SIDE-CD                          CAT718  
                     ,:DCLVTRNFR.SYS-ACT-CD                             CAT718  
                     ,:DCLVTRNFR.SYS-RJCT-RSN-CD                        CAT718  
                     ,:DCLVTRNFR.TRNFR-TYPE-RJC1-CD                     CAT718  
                     ,:DCLVTRNFR.TRNFR-TYPE-RJC2-CD                     CAT718  
                     ,:DCLVTRNFR.TRNFR-TYPE-RJCT-CD                     CAT718  
                     ,:DCLVTRNFR.TRN-TYP-RJC-STS-CD                     CAT718  
                     ,:DCLVTRNFR.PHSCL-SEQ-NBR                          CAT718  
                     ,:DCLVTRNFR.PHSCL-SEQ-STTS-CD                      CAT718  
                     ,:DCLVTRNFR.LGCL-SEQ-NBR                           CAT718  
                     ,:DCLVTRNFR.LGCL-SEQ-NR-STS-CD                     CAT718  
                     ,:DCLVTRNFR.RR-CD                                  CAT718  
                     ,:DCLVTRNFR.BRANCH-CD                              CAT718  
                     ,:DCLVTRNFR.DVDND-NAA-CD                           CAT718  
                     ,:DCLVTRNFR.SELL-INSTN-NAA-CD                      CAT718  
                     ,:DCLVTRNFR.CASH-SWEEP-NAA-CD                      CAT718  
                     ,:DCLVTRNFR.PRTCP-CONTRA-CD                        CAT718  
                     ,:DCLVTRNFR.ACM-HOLDER-NAA-CD                      CAT718  
                     ,:DCLVTRNFR.ACCT-ACTIVITY-IND                      CAT718  
                     ,:DCLVTRNFR.ACCT-ORDERS-IND                        CAT718  
                     ,:DCLVTRNFR.ACCT-RJCT-RSBM-IND                     CAT718  
                     ,:DCLVTRNFR.ACCT-DB-BAL-T1-IND                     CAT718  
                     ,:DCLVTRNFR.ACCT-MRGN-DB-IND                       CAT718  
                     ,:DCLVTRNFR.ACCT-SHRT-PSTN-IND                     CAT718  
                     ,:DCLVTRNFR.ACCT-SEC-RSTRD-IND                     CAT718  
                     ,:DCLVTRNFR.ACCT-AST-EXCS-IND                      CAT718  
                     ,:DCLVTRNFR.ACCT-OPTN-PSTN-IND                     CAT718  
                     ,:DCLVTRNFR.ACCT-LTD-PRTNR-IND                     CAT718  
                     ,:DCLVTRNFR.ACCT-TIN-MSMTH-IND                     CAT718  
                     ,:DCLVTRNFR.ACCT-DPLCT-TRN-IND                     CAT718  
                     ,:DCLVTRNFR.ACCT-CUST-70-IND                       CAT718  
                     ,:DCLVTRNFR.ACCT-QULFD-PLN-IND                     CAT718  
                     ,:DCLVTRNFR.ACCT-MNGD-IND                          CAT718  
                     ,:DCLVTRNFR.ACCT-PRVT-RNG-IND                      CAT718  
                     ,:DCLVTRNFR.ACCT-BRKR-TIF-IND                      CAT718  
                     ,:DCLVTRNFR.NSCC-NON-ADP-IND                       CAT718  
                     ,:DCLVTRNFR.CYCLE-CD                               CAT718  
                     ,:DCLVTRNFR.DAYS-STTS-QTY                          CAT718  
                     ,:DCLVTRNFR.STTLM-DT                               CAT718  
                     ,:DCLVTRNFR.ACCT-NA-UPDT-IND                       CAT718  
                     ,:DCLVTRNFR.ACCT-TRNFR-FEE-AMT                     CAT718  
                     ,:DCLVTRNFR.ACCT-IRA-TRMNT-AMT                     CAT718  
                     ,:DCLVTRNFR.ACCT-IRA-MAINT-AMT                     CAT718  
                     ,:DCLVTRNFR.ACCT-DLRV-PRGR-IND                     CAT718  
                     ,:DCLVTRNFR.ACCT-CD                                CAT718  
                     ,:DCLVTRNFR.STTLM-ASCTD-DT                         CAT718  
                     ,:DCLVTRNFR.STTLM-ASCTD-STS-CD                     CAT718  
                     ,:DCLVTRNFR.RCRD-LNGTH-STTS-CD                     CAT718  
                     ,:DCLVTRNFR.RCRD-STTS-CD                           CAT718  
                     ,:DCLVTRNFR.NSCC-PEND-CD                           CAT718  
                     ,:DCLVTRNFR.NSCC-ACK-IND                           CAT718  
                     ,:DCLVTRNFR.CICS-TERM-ID-CD                        CAT718  
                     ,:DCLVTRNFR.PRGM-NM                                CAT718  
                     ,:DCLVTRNFR.CRT-TMSTP                              CAT718  
                     ,:DCLVTRNFR.UPDT-TMSTP                             CAT718  
                     ,:DCLVTRNFR.ACCT-EQUITY-AMT                        CAT718  
              END-EXEC                                                  CAT718  
              EVALUATE SQLCODE                                          CAT718  
                  WHEN +0                                               CAT718  
                    MOVE CLIENT-NBR OF DCLVTRNFR TO WS-CLIENT-NBR       CAT718  
                    MOVE CRT-TMSTP OF DCLVTRNFR TO WS-CRT-TIMESTAMP     CAT718  
                    MOVE WS-CRT-YYYY TO WS-CRTD-YYYY                    CAT718  
                    MOVE WS-CRT-MM   TO WS-CRTD-MM                      CAT718  
                    MOVE WS-CRT-DD   TO WS-CRTD-DD                      CAT718  
                    ADD 1 TO WS-TOTAL-FETCH-COUNTER                     CAT718  
********************DISPLAY*'CLIENT*NUMBER*=*'*CLIENT-NBR*OF*DCLVTRNFR**CAT718  
**************************'*CONTROL*NUMBER*=*'*ACAT-CONTROL-NBR*********CAT718  
***********************************************OF*DCLVTRNFR*************CAT718  
********************************'*CRT-DATE*=*'*WS-CRT-DATE**************CAT718  
                  WHEN  +100                                            CAT718  
                    EXEC SQL                                            CAT718  
                         CLOSE PTR_CSR                                  CAT718  
                    END-EXEC                                            CAT718  
                    MOVE 'Y' TO WS-END-OF-FILE                          CAT718  
                    DISPLAY 'END OF FETCH REACHED. SQLCODE = +100'      CAT718  
********************GO TO GET-PTR-EXIT                                  CAT718  
                    GO TO FETCH-TRNF-EXIT                               CAT718  
                  WHEN OTHER                                            CAT718  
                    DISPLAY 'FETCH ERROR'                               CAT718  
                    MOVE 30 TO WS-SQL-SEQ-NUM                           CAT718  
                    PERFORM SQL-ERROR-ROUTINE                           CAT718  
              END-EVALUATE                                              CAT718  
                                                                        CAT718  
           IF FIRST-TIME                                                CAT718  
              MOVE WS-CLIENT-NBR TO SV-CLIENT-NBR                       CAT718  
              MOVE SPACE         TO WS-FIRST-TIME-SW                    CAT718  
              PERFORM GET-B1-INFO                                       CAT718  
              PERFORM CALL-BPDATES                                      CAT718  
           ELSE                                                         CAT718  
              IF WS-CLIENT-NBR NOT = SV-CLIENT-NBR                      CAT718  
                 MOVE WS-CLIENT-NBR TO SV-CLIENT-NBR                    CAT718  
                 PERFORM GET-B1-INFO                                    CAT718  
                 PERFORM CALL-BPDATES                                   CAT718  
              END-IF                                                    CAT718  
           END-IF.                                                      CAT718  
                                                                        CAT718  
           IF WS-CRT-DATE <  WS-AGED-DATE-CCYYMMDD                      CAT718  
           AND STTS-CD OF DCLVTRNFR > '499'                             CAT718  
              DISPLAY 'CLIENT NBR = ' CLIENT-NBR OF DCLVTRNFR           CAT718  
                    ' CONTROL NBR = ' ACAT-CONTROL-NBR                  CAT718  
                                                 OF DCLVTRNFR           CAT718  
DJ0002              ' ' TRNFR-TYPE-CD OF DCLVTRNFR                      CAT718  
                       ' CRT-DATE = ' WS-CRT-DATE                       CAT718  
                       ' <  WS-AGED-DATE-CCYYMMDD. DELETE IT.'          CAT718  
              MOVE ACAT-CONTROL-NBR OF DCLVTRNFR TO WS-ACAT-CONTROL-NBR CAT718  
              PERFORM DELETE-VTRNFR                                     CAT718  
           END-IF.                                                      CAT718  
       FETCH-TRNF-EXIT.                                                 CAT718  
           EXIT.                                                        CAT718  
                                                                        CAT718  
      /                                                                 CAT718  
       CALL-BPDATES.                                                    CAT718  
           SET BPD-DISPLACEMENT-DATE-INFO TO TRUE.                      CAT718  
           MOVE WS-TODAY-CCYYMMDD TO BPDATES-BASE-DATE.                 CAT718  
           SET BPD-DISP-MINUS TO TRUE.                                  CAT718  
LRM002     SET BPD-DISP-TRADE-DATE TO TRUE.                             CAT718  
           MOVE WS-ACAT-PARTL-NN-DAY TO BPDATES-DTSEARCH-DISP.          CAT718  
           CALL BPDATES USING BPDATES-PARAMETERS.                       CAT718  
           IF NOT BPD-VALID-RETURN                                      CAT718  
              DISPLAY 'BPD BASE DATE   = ' BPDATES-BASE-DATE            CAT718  
              DISPLAY 'BPD RETURN CODE = ' BPDATES-RETURN-CODE          CAT718  
              DISPLAY 'BPD ERROR  CODE = ' BPDATES-ERROR-CODE           CAT718  
              DISPLAY 'BPD ERROR  MSG  = ' BPDATES-ERROR-MSG            CAT718  
              MOVE +3002 TO ABEND-CODE                                  CAT718  
              GO TO CALL-ABEND                                          CAT718  
           ELSE                                                         CAT718  
              MOVE BPD-DT-CALDATE TO WS-AGED-DATE-CCYYMMDD              CAT718  
           END-IF                                                       CAT718  
           DISPLAY 'CLIENT = ' WS-CLIENT-NBR                            CAT718  
                  ' AGED DATE = ' WS-AGED-DATE-CCYYMMDD.                CAT718  
                                                                        CAT718  
       SET-INITIAL-TMPSTP-AGED-DATE.                                    CAT718  
           SET BPD-DISPLACEMENT-DATE-INFO TO TRUE.                      CAT718  
           MOVE WS-TODAY-CCYYMMDD TO BPDATES-BASE-DATE.                 CAT718  
           SET BPD-DISP-MINUS TO TRUE.                                  CAT718  
           SET BPD-DISP-CALENDAR TO TRUE.                               CAT718  
           MOVE 30 TO BPDATES-DTSEARCH-DISP.                            CAT718  
           CALL BPDATES USING BPDATES-PARAMETERS.                       CAT718  
           IF NOT BPD-VALID-RETURN                                      CAT718  
              DISPLAY 'BPD BASE DATE   = ' BPDATES-BASE-DATE            CAT718  
              DISPLAY 'BPD RETURN CODE = ' BPDATES-RETURN-CODE          CAT718  
              DISPLAY 'BPD ERROR  CODE = ' BPDATES-ERROR-CODE           CAT718  
              DISPLAY 'BPD ERROR  MSG  = ' BPDATES-ERROR-MSG            CAT718  
              MOVE +3003 TO ABEND-CODE                                  CAT718  
              GO TO CALL-ABEND                                          CAT718  
           ELSE                                                         CAT718  
              MOVE BPD-DT-CALDATE TO WS-AGED-INIT-CCYYMMDD-NUM          CAT718  
              MOVE WS-AGED-INIT-CCYYMMDD(1 : 4) TO                      CAT718  
                      WS-AGED-INIT-TMSTP(1 : 4)                         CAT718  
              MOVE WS-AGED-INIT-CCYYMMDD(5 : 2) TO                      CAT718  
                      WS-AGED-INIT-TMSTP(6 : 2)                         CAT718  
              MOVE WS-AGED-INIT-CCYYMMDD(7 : 2) TO                      CAT718  
                      WS-AGED-INIT-TMSTP(9 : 2)                         CAT718  
           END-IF.                                                      CAT718  
           SUBTRACT 10000 FROM WS-TODAY-CCYYMMDD                        CAT718  
               GIVING  WS-AGED-FND-CCYYMMDD-NUM.                        CAT718  
           MOVE WS-AGED-FND-CCYYMMDD(1 : 4) TO                          CAT718  
                      WS-AGED-FND-TMSTP(1 : 4)                          CAT718  
           MOVE WS-AGED-FND-CCYYMMDD(5 : 2) TO                          CAT718  
                      WS-AGED-FND-TMSTP(6 : 2)                          CAT718  
           MOVE WS-AGED-FND-CCYYMMDD(7 : 2) TO                          CAT718  
                      WS-AGED-FND-TMSTP(9 : 2)                          CAT718  
           DISPLAY 'AGED FND  TMSTP = ' WS-AGED-FND-TMSTP.              CAT718  
           DISPLAY 'AGED INIT TMSTP = ' WS-AGED-INIT-TMSTP.             CAT718  
LRM003*** RES CR EXPIRE DATE IS COMPARED TO TODAY'S PROCESS DATE        CAT718  
LRM003     MOVE WS-DATE-CCYYMMDD  TO WS-TODAY-EXP-CCYYMDD               CAT718  
LRM003     MOVE '-'               TO WS-TODAY-EXP-CCYYMDD(5 : 1)        CAT718  
LRM003     MOVE WS-DATE-MMDDYY-MM TO WS-TODAY-EXP-CCYYMDD(6 : 2)        CAT718  
LRM003     MOVE '-'               TO WS-TODAY-EXP-CCYYMDD(8 : 1)        CAT718  
LRM003     MOVE WS-DATE-MMDDYY-DD TO WS-TODAY-EXP-CCYYMDD(9 : 2).       CAT718  
LRM003     DISPLAY 'TODAY DB2 EXPDT = ' WS-TODAY-EXP-CCYYMDD.                   
      /                                                                 CAT718  
       GET-B1-INFO.                                                     CAT718  
           MOVE WS-CLIENT-NBR (2 : 3) TO BH-BROKER-NUMBER.              CAT718  
           MOVE '015'       TO BH-LOGICAL-RECORD-CODE.                  CAT718  
           MOVE '434500'    TO BH-B2-INFO-ID.                           CAT718  
           CALL GETB1V   USING BH-BROKER-HEADER-INFO                    CAT718  
                               BH-ACAT-INFO.                            CAT718  
           IF BH-ACAT-ACTIVE                                            CAT718  
              MOVE BH-ACAT-DISPLAY-PARTL-TFR-REQ TO                     CAT718  
                   WS-ACAT-PARTL-NN-DAY                                 CAT718  
           ELSE                                                         CAT718  
              MOVE 10  TO WS-ACAT-PARTL-NN-DAY                          CAT718  
           END-IF                                                       CAT718  
           DISPLAY 'CLIENT = ' WS-CLIENT-NBR                            CAT718  
                   ' BH-ACAT-DISPLAY-PARTL-TFR-REQ = '                  CAT718  
                     BH-ACAT-DISPLAY-PARTL-TFR-REQ.                     CAT718  
      /                                                                 CAT718  
       DELETE-VTRNFR.                                                   CAT718  
           EXEC SQL                                                     CAT718  
                DELETE                                                  CAT718  
                FROM VTRNFR                                             CAT718  
                WHERE CLIENT_NBR = :WS-CLIENT-NBR                       CAT718  
                 AND  ACAT_CONTROL_NBR = :WS-ACAT-CONTROL-NBR           CAT718  
           END-EXEC.                                                    CAT718  
                                                                        CAT718  
           EVALUATE SQLCODE                                             CAT718  
                WHEN +0                                                 CAT718  
                     ADD +1   TO  WS-VTRNFR-DELETE-COUNT                CAT718  
                     ADD 1 TO WS-A-COMMIT-COUNTER                       CAT718  
                WHEN OTHER                                              CAT718  
                    MOVE 40 TO WS-SQL-SEQ-NUM                           CAT718  
                    PERFORM SQL-ERROR-ROUTINE                           CAT718  
           END-EVALUATE.                                                CAT718  
                                                                        CAT718  
           IF WS-A-COMMIT-COUNTER > 50 AND ROLLBACK-NO                  CAT718  
ET0001**       DISPLAY 'COMMITT'                                        CAT718  
               MOVE 0 TO WS-A-COMMIT-COUNTER                            CAT718  
               EXEC SQL  COMMIT  END-EXEC.                              CAT718  
      /                                                                 CAT718  
032340 CONVERT-TO-CCYYMMDD.                                             CAT718  
032350                                                                  CAT718  
032360     MOVE '19'              TO WS-DATE-CCYYMMDD-CC                CAT718  
                                     OF WS-DATE-CCYYMMDD-AREA.          CAT718  
032370     MOVE WS-DATE-MMDDYY-MM TO WS-DATE-CCYYMMDD-MM                CAT718  
                                     OF WS-DATE-CCYYMMDD-AREA.          CAT718  
032380     MOVE WS-DATE-MMDDYY-DD TO WS-DATE-CCYYMMDD-DD                CAT718  
                                     OF WS-DATE-CCYYMMDD-AREA.          CAT718  
032390     MOVE WS-DATE-MMDDYY-YY TO WS-DATE-CCYYMMDD-YY                CAT718  
                                     OF WS-DATE-CCYYMMDD-AREA.          CAT718  
032400     IF WS-DATE-MMDDYY-YY < '90'                                  CAT718  
032500        MOVE '20'           TO WS-DATE-CCYYMMDD-CC                CAT718  
                                     OF WS-DATE-CCYYMMDD-AREA.          CAT718  
032600                                                                  CAT718  
           EJECT                                                        CAT718  
       PROCESS-VFNDNA-RTN.                                              CAT718  
           EXEC SQL                                                     CAT718  
                OPEN VFNDNA_CSR                                         CAT718  
           END-EXEC.                                                    CAT718  
           IF SQLCODE NOT EQUAL ZERO                                    CAT718  
               PERFORM SQL-ERROR-ROUTINE.                               CAT718  
                                                                        CAT718  
           PERFORM FETCH-DELETE-VFNDNA                                  CAT718  
                 UNTIL VFNDNA-EOF.                                      CAT718  
                                                                        CAT718  
       FETCH-DELETE-VFNDNA.                                             CAT718  
           EXEC SQL                                                     CAT718  
                FETCH VFNDNA_CSR                                        CAT718  
                INTO                                                    CAT718  
                   :DCLVFNDNA.CLIENT-NBR                                CAT718  
                  ,:DCLVFNDNA.ACAT-CONTROL-NBR                          CAT718  
                  ,:DCLVFNDNA.ASSET-SEQ-NBR                             CAT718  
                  ,:DCLVFNDNA.NA-LINE-NBR                               CAT718  
                  ,:DCLVFNDNA.CRT-TMSTP                                 CAT718  
           END-EXEC.                                                    CAT718  
           EVALUATE SQLCODE                                             CAT718  
               WHEN +0                                                  CAT718  
                  PERFORM DELETE-VFNDNA-RTN                             CAT718  
               WHEN  +100                                               CAT718  
                 EXEC SQL                                               CAT718  
                      CLOSE VFNDNA_CSR                                  CAT718  
                 END-EXEC                                               CAT718  
                 SET VFNDNA-EOF TO TRUE                                 CAT718  
               WHEN OTHER                                               CAT718  
                 MOVE 50 TO WS-SQL-SEQ-NUM                              CAT718  
                 PERFORM SQL-ERROR-ROUTINE                              CAT718  
           END-EVALUATE.                                                CAT718  
       DELETE-VFNDNA-RTN.                                               CAT718  
           EXEC SQL                                                     CAT718  
             DELETE                                                     CAT718  
                FROM VFNDNA                                             CAT718  
                WHERE                                                   CAT718  
                     (CLIENT_NBR    =                                   CAT718  
                     :DCLVFNDNA.CLIENT-NBR     AND                      CAT718  
                      ACAT_CONTROL_NBR    =                             CAT718  
                     :DCLVFNDNA.ACAT-CONTROL-NBR AND                    CAT718  
                      ASSET_SEQ_NBR  =                                  CAT718  
                     :DCLVFNDNA.ASSET-SEQ-NBR AND                       CAT718  
                      NA_LINE_NBR    =                                  CAT718  
                     :DCLVFNDNA.NA-LINE-NBR                             CAT718  
                      )                                                 CAT718  
           END-EXEC.                                                    CAT718  
                                                                        CAT718  
           EVALUATE SQLCODE                                             CAT718  
                WHEN +0                                                 CAT718  
                     ADD +1   TO  WS-VFNDNA-DELETE-COUNT                CAT718  
                     ADD 1 TO WS-A-COMMIT-COUNTER                       CAT718  
                WHEN OTHER                                              CAT718  
                    MOVE 55 TO WS-SQL-SEQ-NUM                           CAT718  
                    PERFORM SQL-ERROR-ROUTINE                           CAT718  
           END-EVALUATE.                                                CAT718  
                                                                        CAT718  
           IF WS-A-COMMIT-COUNTER > 50 AND ROLLBACK-NO                  CAT718  
ET0001**       DISPLAY 'COMMITT'                                        CAT718  
               MOVE 0 TO WS-A-COMMIT-COUNTER                            CAT718  
               EXEC SQL  COMMIT  END-EXEC.                              CAT718  
                                                                        CAT718  
           EJECT                                                        CAT718  
       PROCESS-VFNDRGST-RTN.                                            CAT718  
           EXEC SQL                                                     CAT718  
                OPEN VFNDRGST_CSR                                       CAT718  
           END-EXEC.                                                    CAT718  
           IF SQLCODE NOT EQUAL ZERO                                    CAT718  
               PERFORM SQL-ERROR-ROUTINE.                               CAT718  
                                                                        CAT718  
           PERFORM FETCH-DELETE-VFNDRGST                                CAT718  
                 UNTIL VFNDRGST-EOF.                                    CAT718  
                                                                        CAT718  
       FETCH-DELETE-VFNDRGST.                                           CAT718  
           EXEC SQL                                                     CAT718  
                FETCH VFNDRGST_CSR                                      CAT718  
                INTO                                                    CAT718  
                   :DCLVFNDRGST.CLIENT-NBR                              CAT718  
                  ,:DCLVFNDRGST.ACAT-CONTROL-NBR                        CAT718  
                  ,:DCLVFNDRGST.ASSET-SEQ-NBR                           CAT718  
                  ,:DCLVFNDRGST.CRT-TMSTP                               CAT718  
           END-EXEC.                                                    CAT718  
           EVALUATE SQLCODE                                             CAT718  
               WHEN +0                                                  CAT718  
                  PERFORM DELETE-VFNDRGST-RTN                           CAT718  
               WHEN  +100                                               CAT718  
                 EXEC SQL                                               CAT718  
                      CLOSE VFNDRGST_CSR                                CAT718  
                 END-EXEC                                               CAT718  
                 SET VFNDRGST-EOF TO TRUE                               CAT718  
               WHEN OTHER                                               CAT718  
                 MOVE 60 TO WS-SQL-SEQ-NUM                              CAT718  
                 PERFORM SQL-ERROR-ROUTINE                              CAT718  
           END-EVALUATE.                                                CAT718  
       DELETE-VFNDRGST-RTN.                                             CAT718  
           EXEC SQL                                                     CAT718  
             DELETE                                                     CAT718  
                FROM VFNDRGST                                           CAT718  
                WHERE                                                   CAT718  
                    (CLIENT_NBR    =                                    CAT718  
                    :DCLVFNDRGST.CLIENT-NBR AND                         CAT718  
                     ACAT_CONTROL_NBR    =                              CAT718  
                    :DCLVFNDRGST.ACAT-CONTROL-NBR AND                   CAT718  
                     ASSET_SEQ_NBR  =                                   CAT718  
                    :DCLVFNDRGST.ASSET-SEQ-NBR                          CAT718  
                     )                                                  CAT718  
           END-EXEC.                                                    CAT718  
                                                                        CAT718  
           EVALUATE SQLCODE                                             CAT718  
                WHEN +0                                                 CAT718  
                     ADD +1   TO  WS-VFNDRGST-DELETE-COUNT              CAT718  
                     ADD 1 TO WS-A-COMMIT-COUNTER                       CAT718  
                WHEN OTHER                                              CAT718  
                    MOVE 65 TO WS-SQL-SEQ-NUM                           CAT718  
                    PERFORM SQL-ERROR-ROUTINE                           CAT718  
           END-EVALUATE.                                                CAT718  
                                                                        CAT718  
           IF WS-A-COMMIT-COUNTER > 50 AND ROLLBACK-NO                  CAT718  
ET0001**       DISPLAY 'COMMITT'                                        CAT718  
               MOVE 0 TO WS-A-COMMIT-COUNTER                            CAT718  
               EXEC SQL  COMMIT  END-EXEC.                              CAT718  
                                                                        CAT718  
           EJECT                                                        CAT718  
       PROCESS-VFNDSRVS-RTN.                                            CAT718  
           EXEC SQL                                                     CAT718  
                OPEN VFNDSRVS_CSR                                       CAT718  
           END-EXEC.                                                    CAT718  
           IF SQLCODE NOT EQUAL ZERO                                    CAT718  
               PERFORM SQL-ERROR-ROUTINE.                               CAT718  
                                                                        CAT718  
           PERFORM FETCH-DELETE-VFNDSRVS                                CAT718  
                 UNTIL VFNDSRVS-EOF.                                    CAT718  
                                                                        CAT718  
       FETCH-DELETE-VFNDSRVS.                                           CAT718  
           EXEC SQL                                                     CAT718  
                FETCH VFNDSRVS_CSR                                      CAT718  
                INTO                                                    CAT718  
                   :DCLVFNDSRVS.CLIENT-NBR                              CAT718  
                  ,:DCLVFNDSRVS.ACAT-CONTROL-NBR                        CAT718  
                  ,:DCLVFNDSRVS.ASSET-SEQ-NBR                           CAT718  
                  ,:DCLVFNDSRVS.CRT-TMSTP                               CAT718  
           END-EXEC.                                                    CAT718  
           EVALUATE SQLCODE                                             CAT718  
               WHEN +0                                                  CAT718  
                  PERFORM DELETE-VFNDSRVS-RTN                           CAT718  
               WHEN  +100                                               CAT718  
                 EXEC SQL                                               CAT718  
                      CLOSE VFNDSRVS_CSR                                CAT718  
                 END-EXEC                                               CAT718  
                 SET VFNDSRVS-EOF TO TRUE                               CAT718  
               WHEN OTHER                                               CAT718  
                 MOVE 70 TO WS-SQL-SEQ-NUM                              CAT718  
                 PERFORM SQL-ERROR-ROUTINE                              CAT718  
           END-EVALUATE.                                                CAT718  
       DELETE-VFNDSRVS-RTN.                                             CAT718  
           EXEC SQL                                                     CAT718  
             DELETE                                                     CAT718  
                FROM VFNDSRVS                                           CAT718  
                  WHERE                                                 CAT718  
                       (CLIENT_NBR    =                                 CAT718  
                       :DCLVFNDSRVS.CLIENT-NBR AND                      CAT718  
                        ACAT_CONTROL_NBR    =                           CAT718  
                       :DCLVFNDSRVS.ACAT-CONTROL-NBR AND                CAT718  
                        ASSET_SEQ_NBR  =                                CAT718  
                       :DCLVFNDSRVS.ASSET-SEQ-NBR                       CAT718  
                        )                                               CAT718  
           END-EXEC.                                                    CAT718  
                                                                        CAT718  
           EVALUATE SQLCODE                                             CAT718  
                WHEN +0                                                 CAT718  
                     ADD +1   TO  WS-VFNDSRVS-DELETE-COUNT              CAT718  
                     ADD 1 TO WS-A-COMMIT-COUNTER                       CAT718  
                WHEN OTHER                                              CAT718  
                    MOVE 75 TO WS-SQL-SEQ-NUM                           CAT718  
                    PERFORM SQL-ERROR-ROUTINE                           CAT718  
           END-EVALUATE.                                                CAT718  
                                                                        CAT718  
           IF WS-A-COMMIT-COUNTER > 50 AND ROLLBACK-NO                  CAT718  
ET0001**       DISPLAY 'COMMITT'                                        CAT718  
               MOVE 0 TO WS-A-COMMIT-COUNTER                            CAT718  
               EXEC SQL  COMMIT  END-EXEC.                              CAT718  
                                                                        CAT718  
           EJECT                                                        CAT718  
       PROCESS-VINITRNF-RTN.                                            CAT718  
           EXEC SQL                                                     CAT718  
                OPEN VINITRNF_CSR                                       CAT718  
           END-EXEC.                                                    CAT718  
           IF SQLCODE NOT EQUAL ZERO                                    CAT718  
               PERFORM SQL-ERROR-ROUTINE.                               CAT718  
                                                                        CAT718  
           PERFORM FETCH-DELETE-VINITRNF                                CAT718  
                 UNTIL VINITRNF-EOF.                                    CAT718  
                                                                        CAT718  
       FETCH-DELETE-VINITRNF.                                           CAT718  
           EXEC SQL                                                     CAT718  
                FETCH VINITRNF_CSR                                      CAT718  
                INTO                                                    CAT718  
ET0001             :DCLACTITRF.CLIENT-NBR                               CAT718  
ET0001            ,:DCLACTITRF.ACAT-CONTROL-NBR                         CAT718  
ET0001            ,:DCLACTITRF.DLVR-NBR                                 CAT718  
ET0001            ,:DCLACTITRF.ACCT-DLVR-NBR                            CAT718  
ET0001            ,:DCLACTITRF.RCV-NBR                                  CAT718  
ET0001            ,:DCLACTITRF.ACCT-RCV-NBR                             CAT718  
ET0001            ,:DCLACTITRF.TRNFR-TYPE-CD                            CAT718  
ET0001            ,:DCLACTITRF.CRT-TMSTP                                CAT718  
           END-EXEC.                                                    CAT718  
           EVALUATE SQLCODE                                             CAT718  
               WHEN +0                                                  CAT718  
                  PERFORM DELETE-VINITRNF-RTN                           CAT718  
               WHEN  +100                                               CAT718  
                 EXEC SQL                                               CAT718  
                      CLOSE VINITRNF_CSR                                CAT718  
                 END-EXEC                                               CAT718  
                 SET VINITRNF-EOF TO TRUE                               CAT718  
               WHEN OTHER                                               CAT718  
                 MOVE 80 TO WS-SQL-SEQ-NUM                              CAT718  
                 PERFORM SQL-ERROR-ROUTINE                              CAT718  
           END-EVALUATE.                                                CAT718  
       DELETE-VINITRNF-RTN.                                             CAT718  
           EXEC SQL                                                     CAT718  
             DELETE                                                     CAT718  
ET0001**        FROM VINITRNF                                           CAT718  
ET0001          FROM ACTITRF                                            CAT718  
                WHERE                                                   CAT718  
                     (CLIENT_NBR    =                                   CAT718  
ET0001               :DCLACTITRF.CLIENT-NBR    AND                      CAT718  
                      DLVR_NBR      =                                   CAT718  
ET0001               :DCLACTITRF.DLVR-NBR      AND                      CAT718  
                      ACCT_DLVR_NBR =                                   CAT718  
ET0001               :DCLACTITRF.ACCT-DLVR-NBR   AND                    CAT718  
                      RCV_NBR       =                                   CAT718  
ET0001               :DCLACTITRF.RCV-NBR         AND                    CAT718  
                      ACCT_RCV_NBR  =                                   CAT718  
ET0001               :DCLACTITRF.ACCT-RCV-NBR    AND                    CAT718  
                      TRNFR_TYPE_CD =                                   CAT718  
ET0001               :DCLACTITRF.TRNFR-TYPE-CD                          CAT718  
                      )                                                 CAT718  
           END-EXEC.                                                    CAT718  
                                                                        CAT718  
           EVALUATE SQLCODE                                             CAT718  
                WHEN +0                                                 CAT718  
                     ADD +1   TO  WS-VINITRNF-DELETE-COUNT              CAT718  
                     ADD 1 TO WS-A-COMMIT-COUNTER                       CAT718  
                WHEN OTHER                                              CAT718  
                    MOVE 85 TO WS-SQL-SEQ-NUM                           CAT718  
                    PERFORM SQL-ERROR-ROUTINE                           CAT718  
           END-EVALUATE.                                                CAT718  
                                                                        CAT718  
           IF WS-A-COMMIT-COUNTER > 50 AND ROLLBACK-NO                  CAT718  
ET0001**       DISPLAY 'COMMITT'                                        CAT718  
               MOVE 0 TO WS-A-COMMIT-COUNTER                            CAT718  
               EXEC SQL  COMMIT  END-EXEC.                              CAT718  
                                                                        CAT718  
           EJECT                                                        CAT718  
       PROCESS-VINITAST-RTN.                                            CAT718  
           EXEC SQL                                                     CAT718  
                OPEN VINITAST_CSR                                       CAT718  
           END-EXEC.                                                    CAT718  
           IF SQLCODE NOT EQUAL ZERO                                    CAT718  
               PERFORM SQL-ERROR-ROUTINE.                               CAT718  
                                                                        CAT718  
           PERFORM FETCH-DELETE-VINITAST                                CAT718  
                 UNTIL VINITAST-EOF.                                    CAT718  
                                                                        CAT718  
       FETCH-DELETE-VINITAST.                                           CAT718  
           EXEC SQL                                                     CAT718  
                FETCH VINITAST_CSR                                      CAT718  
                INTO                                                    CAT718  
ET0001             :DCLACTIAST.CLIENT-NBR                               CAT718  
ET0001            ,:DCLACTIAST.ACAT-CONTROL-NBR                         CAT718  
ET0001            ,:DCLACTIAST.DLVR-NBR                                 CAT718  
ET0001            ,:DCLACTIAST.ACCT-DLVR-NBR                            CAT718  
ET0001            ,:DCLACTIAST.RCV-NBR                                  CAT718  
ET0001            ,:DCLACTIAST.ACCT-RCV-NBR                             CAT718  
ET0001            ,:DCLACTIAST.ISIN-CNTRY-CD                            CAT718  
ET0001            ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                        CAT718  
ET0001            ,:DCLACTIAST.ISIN-SEC-CDG-CD                          CAT718  
ET0001            ,:DCLACTIAST.STTLM-LCTN-CD                            CAT718  
ET0001            ,:DCLACTIAST.CSH-MGN-SHRT-CD                          CAT718  
ET0001            ,:DCLACTIAST.ASSET-SEQ-NBR                            CAT718  
ET0001            ,:DCLACTIAST.TRNFR-TYPE-CD                            CAT718  
ET0001            ,:DCLACTIAST.CRT-TMSTP                                CAT718  
ET0001            ,:DCLACTIAST.TRANS-TYPE-CD                            CAT718  
ET0001            ,:DCLACTIAST.PRGM-NM                                  CAT718  
           END-EXEC.                                                    CAT718  
           EVALUATE SQLCODE                                             CAT718  
               WHEN +0                                                  CAT718  
                  PERFORM DELETE-VINITAST-RTN                           CAT718  
               WHEN  +100                                               CAT718  
                 EXEC SQL                                               CAT718  
                      CLOSE VINITAST_CSR                                CAT718  
                 END-EXEC                                               CAT718  
                 SET VINITAST-EOF TO TRUE                               CAT718  
               WHEN OTHER                                               CAT718  
                 MOVE 90 TO WS-SQL-SEQ-NUM                              CAT718  
                 PERFORM SQL-ERROR-ROUTINE                              CAT718  
           END-EVALUATE.                                                CAT718  
       DELETE-VINITAST-RTN.                                             CAT718  
           EXEC SQL                                                     CAT718  
             DELETE                                                     CAT718  
ET0001          FROM ACTIAST                                            CAT718  
                WHERE                                                   CAT718  
                     (CLIENT_NBR    =                                   CAT718  
ET0001               :DCLACTIAST.CLIENT-NBR    AND                      CAT718  
                      DLVR_NBR      =                                   CAT718  
ET0001               :DCLACTIAST.DLVR-NBR      AND                      CAT718  
                      ACCT_DLVR_NBR =                                   CAT718  
ET0001               :DCLACTIAST.ACCT-DLVR-NBR   AND                    CAT718  
                      RCV_NBR       =                                   CAT718  
ET0001               :DCLACTIAST.RCV-NBR         AND                    CAT718  
                      ACCT_RCV_NBR  =                                   CAT718  
ET0001               :DCLACTIAST.ACCT-RCV-NBR    AND                    CAT718  
                      ISIN_CNTRY_CD  =                                  CAT718  
ET0001               :DCLACTIAST.ISIN-CNTRY-CD    AND                   CAT718  
                      ISIN_SEC_ISSUE_CD =                               CAT718  
ET0001               :DCLACTIAST.ISIN-SEC-ISSUE-CD   AND                CAT718  
                      ISIN_SEC_CDG_CD   =                               CAT718  
ET0001               :DCLACTIAST.ISIN-SEC-CDG-CD   AND                  CAT718  
                      STTLM_LCTN_CD    =                                CAT718  
ET0001               :DCLACTIAST.STTLM-LCTN-CD     AND                  CAT718  
                      CSH_MGN_SHRT_CD  =                                CAT718  
ET0001               :DCLACTIAST.CSH-MGN-SHRT-CD   AND                  CAT718  
                      ACAT_CONTROL_NBR =                                CAT718  
ET0001               :DCLACTIAST.ACAT-CONTROL-NBR  AND                  CAT718  
                      TRNFR_TYPE_CD    =                                CAT718  
ET0001               :DCLACTIAST.TRNFR-TYPE-CD     AND                  CAT718  
                      ASSET_SEQ_NBR    =                                CAT718  
ET0001               :DCLACTIAST.ASSET-SEQ-NBR                          CAT718  
                      )                                                 CAT718  
           END-EXEC.                                                    CAT718  
                                                                        CAT718  
           EVALUATE SQLCODE                                             CAT718  
                WHEN +0                                                 CAT718  
                     ADD +1   TO  WS-VINITAST-DELETE-COUNT              CAT718  
                     ADD 1 TO WS-A-COMMIT-COUNTER                       CAT718  
ET0001               DISPLAY 'DEL ACTIAST  '                            CAT718  
ET0001                 CLIENT-NBR OF DCLACTIAST ' '                     CAT718  
ET0001                 DLVR-NBR OF DCLACTIAST    ' '                    CAT718  
ET0001                 ACCT-DLVR-NBR OF DCLACTIAST ' '                  CAT718  
ET0001                 RCV-NBR OF DCLACTIAST       ' '                  CAT718  
ET0001                 ACCT-RCV-NBR OF DCLACTIAST ' '                   CAT718  
DJ0002                 TRNFR-TYPE-CD OF DCLACTIAST ' '                  CAT718  
ET0001                 ACAT-CONTROL-NBR OF DCLACTIAST ' '               CAT718  
ET0001                 CRT-TMSTP OF DCLACTIAST                          CAT718  
                WHEN OTHER                                              CAT718  
                    MOVE 95 TO WS-SQL-SEQ-NUM                           CAT718  
                    PERFORM SQL-ERROR-ROUTINE                           CAT718  
           END-EVALUATE.                                                CAT718  
                                                                        CAT718  
           IF WS-A-COMMIT-COUNTER > 50 AND ROLLBACK-NO                  CAT718  
ET0001**       DISPLAY 'COMMITT'                                        CAT718  
               MOVE 0 TO WS-A-COMMIT-COUNTER                            CAT718  
               EXEC SQL  COMMIT  END-EXEC.                              CAT718  
                                                                        CAT718  
           EJECT                                                        CAT718  
LRM003 PROCESS-VRSDSEC-RTN.                                             CAT718  
LRM003     EXEC SQL                                                     CAT718  
LRM003          OPEN VRSDSEC_CSR                                        CAT718  
LRM003     END-EXEC.                                                    CAT718  
LRM003     IF SQLCODE NOT EQUAL ZERO                                    CAT718  
LRM003         PERFORM SQL-ERROR-ROUTINE.                               CAT718  
LRM003                                                                  CAT718  
LRM003     PERFORM FETCH-DELETE-VRSDSEC                                 CAT718  
LRM003           UNTIL VRSDSEC-EOF.                                     CAT718  
LRM003                                                                  CAT718  
LRM003 FETCH-DELETE-VRSDSEC.                                            CAT718  
LRM003     EXEC SQL                                                     CAT718  
LRM003          FETCH VRSDSEC_CSR                                       CAT718  
LRM003          INTO                                                    CAT718  
LRM003             :DCLVRSDSEC.CLIENT-NBR                               CAT718  
LRM003            ,:DCLVRSDSEC.BRANCH-CD                                CAT718  
LRM003            ,:DCLVRSDSEC.ACCT-CD                                  CAT718  
LRM003            ,:DCLVRSDSEC.ISIN-SEC-ISSUE-CD                        CAT718  
LRM003            ,:DCLVRSDSEC.EXPTN-DT                                 CAT718  
LRM003     END-EXEC.                                                    CAT718  
LRM003     EVALUATE SQLCODE                                             CAT718  
LRM003         WHEN +0                                                  CAT718  
LRM003            PERFORM DELETE-VRSDSEC-RTN                            CAT718  
LRM003         WHEN  +100                                               CAT718  
LRM003           EXEC SQL                                               CAT718  
LRM003                CLOSE VRSDSEC_CSR                                 CAT718  
LRM003           END-EXEC                                               CAT718  
LRM003           SET VRSDSEC-EOF TO TRUE                                CAT718  
LRM003         WHEN OTHER                                               CAT718  
LRM003           MOVE 100 TO WS-SQL-SEQ-NUM                             CAT718  
LRM003           PERFORM SQL-ERROR-ROUTINE                              CAT718  
LRM003     END-EVALUATE.                                                CAT718  
LRM003 DELETE-VRSDSEC-RTN.                                              CAT718  
LRM003     EXEC SQL                                                     CAT718  
LRM003       DELETE                                                     CAT718  
LRM003          FROM VRSDSEC                                            CAT718  
LRM003          WHERE                                                   CAT718  
LRM003               (CLIENT_NBR    =                                   CAT718  
LRM003               :DCLVRSDSEC.CLIENT-NBR    AND                      CAT718  
LRM003                ACCT_CD    =                                      CAT718  
LRM003               :DCLVRSDSEC.ACCT-CD  AND                           CAT718  
LRM003                BRANCH_CD  =                                      CAT718  
LRM003               :DCLVRSDSEC.BRANCH-CD AND                          CAT718  
LRM003               ISIN_SEC_ISSUE_CD  =                               CAT718  
LRM003               :DCLVRSDSEC.ISIN-SEC-ISSUE-CD                      CAT718  
LRM003                )                                                 CAT718  
LRM003     END-EXEC.                                                    CAT718  
LRM003                                                                  CAT718  
LRM003     EVALUATE SQLCODE                                             CAT718  
LRM003          WHEN +0                                                 CAT718  
LRM003               ADD +1   TO  WS-VRSDSEC-DELETE-COUNT               CAT718  
LRM003               ADD 1 TO WS-A-COMMIT-COUNTER                       CAT718  
LRM003               DISPLAY 'DEL VRSDSEC  '                            CAT718  
LRM003                 CLIENT-NBR OF DCLVRSDSEC ' '                     CAT718  
LRM003                 BRANCH-CD  OF DCLVRSDSEC ' '                     CAT718  
LRM003                 ACCT-CD    OF DCLVRSDSEC ' '                     CAT718  
LRM003                 ISIN-SEC-ISSUE-CD OF DCLVRSDSEC ' '              CAT718  
LRM003                 EXPTN-DT OF DCLVRSDSEC                           CAT718  
LRM003          WHEN OTHER                                              CAT718  
LRM003              MOVE 105 TO WS-SQL-SEQ-NUM                          CAT718  
LRM003              PERFORM SQL-ERROR-ROUTINE                           CAT718  
LRM003     END-EVALUATE.                                                CAT718  
LRM003                                                                  CAT718  
LRM003     IF WS-A-COMMIT-COUNTER > 50 AND ROLLBACK-NO                  CAT718  
LRM003         MOVE 0 TO WS-A-COMMIT-COUNTER                            CAT718  
LRM003         EXEC SQL  COMMIT  END-EXEC.                              CAT718  
LRM003                                                                  CAT718  
           EJECT                                                        CAT718  
LRM003 PROCESS-VRSDACC-RTN.                                             CAT718  
LRM003     EXEC SQL                                                     CAT718  
LRM003          OPEN VRSDACC_CSR                                        CAT718  
LRM003     END-EXEC.                                                    CAT718  
LRM003     IF SQLCODE NOT EQUAL ZERO                                    CAT718  
LRM003         PERFORM SQL-ERROR-ROUTINE.                               CAT718  
LRM003                                                                  CAT718  
LRM003     PERFORM FETCH-DELETE-VRSDACC                                 CAT718  
LRM003           UNTIL VRSDACC-EOF.                                     CAT718  
LRM003                                                                  CAT718  
LRM003 FETCH-DELETE-VRSDACC.                                            CAT718  
LRM003     EXEC SQL                                                     CAT718  
LRM003          FETCH VRSDACC_CSR                                       CAT718  
LRM003          INTO                                                    CAT718  
LRM003             :DCLVRSDACC.CLIENT-NBR                               CAT718  
LRM003            ,:DCLVRSDACC.BRANCH-CD                                CAT718  
LRM003            ,:DCLVRSDACC.ACCT-CD                                  CAT718  
LRM003            ,:DCLVRSDACC.EXPTN-DT                                 CAT718  
LRM003     END-EXEC.                                                    CAT718  
LRM003     EVALUATE SQLCODE                                             CAT718  
LRM003         WHEN +0                                                  CAT718  
LRM003            PERFORM DELETE-VRSDACC-RTN                            CAT718  
LRM003         WHEN  +100                                               CAT718  
LRM003           EXEC SQL                                               CAT718  
LRM003                CLOSE VRSDACC_CSR                                 CAT718  
LRM003           END-EXEC                                               CAT718  
LRM003           SET VRSDACC-EOF TO TRUE                                CAT718  
LRM003         WHEN OTHER                                               CAT718  
LRM003           MOVE 110 TO WS-SQL-SEQ-NUM                             CAT718  
LRM003           PERFORM SQL-ERROR-ROUTINE                              CAT718  
LRM003     END-EVALUATE.                                                CAT718  
LRM003 DELETE-VRSDACC-RTN.                                              CAT718  
LRM003     EXEC SQL                                                     CAT718  
LRM003       DELETE                                                     CAT718  
LRM003          FROM VRSDACC                                            CAT718  
LRM003          WHERE                                                   CAT718  
LRM003               (CLIENT_NBR    =                                   CAT718  
LRM003               :DCLVRSDACC.CLIENT-NBR    AND                      CAT718  
LRM003                ACCT_CD    =                                      CAT718  
LRM003               :DCLVRSDACC.ACCT-CD  AND                           CAT718  
LRM003                BRANCH_CD  =                                      CAT718  
LRM003               :DCLVRSDACC.BRANCH-CD                              CAT718  
LRM003                )                                                 CAT718  
LRM003     END-EXEC.                                                    CAT718  
LRM003                                                                  CAT718  
LRM003     EVALUATE SQLCODE                                             CAT718  
LRM003          WHEN +0                                                 CAT718  
LRM003               ADD +1   TO  WS-VRSDACC-DELETE-COUNT               CAT718  
LRM003               ADD 1 TO WS-A-COMMIT-COUNTER                       CAT718  
LRM003               DISPLAY 'DEL VRSDACC  '                            CAT718  
LRM003                 CLIENT-NBR OF DCLVRSDACC ' '                     CAT718  
LRM003                 BRANCH-CD  OF DCLVRSDACC ' '                     CAT718  
LRM003                 ACCT-CD    OF DCLVRSDACC ' '                     CAT718  
LRM003                 EXPTN-DT OF DCLVRSDACC                           CAT718  
LRM003          WHEN OTHER                                              CAT718  
LRM003              MOVE 115 TO WS-SQL-SEQ-NUM                          CAT718  
LRM003              PERFORM SQL-ERROR-ROUTINE                           CAT718  
LRM003     END-EVALUATE.                                                CAT718  
LRM003                                                                  CAT718  
LRM003     IF WS-A-COMMIT-COUNTER > 50 AND ROLLBACK-NO                  CAT718  
LRM003         MOVE 0 TO WS-A-COMMIT-COUNTER                            CAT718  
LRM003         EXEC SQL  COMMIT  END-EXEC.                              CAT718  
LRM003                                                                  CAT718  
           EJECT                                                        CAT718  
LRM004 PROCESS-VRSTSEC-RTN.                                             CAT718  
LRM004     EXEC SQL                                                     CAT718  
LRM004          OPEN VRSTSEC_CSR                                        CAT718  
LRM004     END-EXEC.                                                    CAT718  
LRM004     IF SQLCODE NOT EQUAL ZERO                                    CAT718  
LRM004         PERFORM SQL-ERROR-ROUTINE.                               CAT718  
LRM004                                                                  CAT718  
LRM004     PERFORM FETCH-DELETE-VRSTSEC                                 CAT718  
LRM004           UNTIL VRSTSEC-EOF.                                     CAT718  
LRM004                                                                  CAT718  
LRM004 FETCH-DELETE-VRSTSEC.                                            CAT718  
LRM004*---------------------------------------------------------------* CAT718  
LRM004* DELETING FROM VRSTSEC ALSO DELETES VRSTBRKR DUE TO PARENTAGE    CAT718  
LRM004*---------------------------------------------------------------* CAT718  
LRM004     EXEC SQL                                                     CAT718  
LRM004          FETCH VRSTSEC_CSR                                       CAT718  
LRM004          INTO                                                    CAT718  
LRM004             :DCLVRSTSEC.CLIENT-NBR                               CAT718  
LRM004            ,:DCLVRSTSEC.ISIN-SEC-ISSUE-CD                        CAT718  
LRM004            ,:DCLVRSTSEC.EXPTN-DT                                 CAT718  
LRM004     END-EXEC.                                                    CAT718  
LRM004     EVALUATE SQLCODE                                             CAT718  
LRM004         WHEN +0                                                  CAT718  
LRM004            PERFORM DELETE-VRSTSEC-RTN                            CAT718  
LRM004         WHEN  +100                                               CAT718  
LRM004           EXEC SQL                                               CAT718  
LRM004                CLOSE VRSTSEC_CSR                                 CAT718  
LRM004           END-EXEC                                               CAT718  
LRM004           SET VRSTSEC-EOF TO TRUE                                CAT718  
LRM004         WHEN OTHER                                               CAT718  
LRM004           MOVE 120 TO WS-SQL-SEQ-NUM                             CAT718  
LRM004           PERFORM SQL-ERROR-ROUTINE                              CAT718  
LRM004     END-EVALUATE.                                                CAT718  
LRM004 DELETE-VRSTSEC-RTN.                                              CAT718  
LRM004     EXEC SQL                                                     CAT718  
LRM004       DELETE                                                     CAT718  
LRM004          FROM VRSTSEC                                            CAT718  
LRM004          WHERE                                                   CAT718  
LRM004               (CLIENT_NBR    =                                   CAT718  
LRM004               :DCLVRSTSEC.CLIENT-NBR    AND                      CAT718  
LRM004               ISIN_SEC_ISSUE_CD  =                               CAT718  
LRM004               :DCLVRSTSEC.ISIN-SEC-ISSUE-CD                      CAT718  
LRM004                )                                                 CAT718  
LRM004     END-EXEC.                                                    CAT718  
LRM004                                                                  CAT718  
LRM004     EVALUATE SQLCODE                                             CAT718  
LRM004          WHEN +0                                                 CAT718  
LRM004               ADD +1   TO  WS-VRSTSEC-DELETE-COUNT               CAT718  
LRM004               ADD 1 TO WS-A-COMMIT-COUNTER                       CAT718  
LRM004               DISPLAY 'DEL VRSTSEC  '                            CAT718  
LRM004                 CLIENT-NBR OF DCLVRSTSEC ' '                     CAT718  
LRM004                 ISIN-SEC-ISSUE-CD OF DCLVRSTSEC ' '              CAT718  
LRM004                 EXPTN-DT OF DCLVRSTSEC                           CAT718  
LRM004          WHEN OTHER                                              CAT718  
LRM004              MOVE 125 TO WS-SQL-SEQ-NUM                          CAT718  
LRM004              PERFORM SQL-ERROR-ROUTINE                           CAT718  
LRM004     END-EVALUATE.                                                CAT718  
LRM004                                                                  CAT718  
LRM004     IF WS-A-COMMIT-COUNTER > 30 AND ROLLBACK-NO                  CAT718  
LRM004         MOVE 0 TO WS-A-COMMIT-COUNTER                            CAT718  
LRM004         EXEC SQL  COMMIT  END-EXEC.                              CAT718  
LRM004                                                                  CAT718  
           EJECT                                                        CAT718  
      *******************                                               CAT718  
       SQL-ERROR-ROUTINE.                                               CAT718  
      *******************                                               CAT718  
                                                                        CAT718  
           CALL DSNTIAR USING SQLCA                                     CAT718  
                                WS-MESSAGE                              CAT718  
                                WS-LENGTH.                              CAT718  
           IF RETURN-CODE = 0                                           CAT718  
              MOVE WS-ERR-TXT(1) TO MS-MESSAGE1                         CAT718  
              MOVE WS-ERR-TXT(2) TO MS-MESSAGE2                         CAT718  
              DISPLAY 'ERROR-MSG = ' MS-MESSAGE1 MS-MESSAGE2            CAT718  
           ELSE                                                         CAT718  
              DISPLAY 'ERROR MSG = ' WS-ERROR-MSG.                      CAT718  
           DISPLAY 'SQL SEQ NUM = '  WS-SQL-SEQ-NUM.                    CAT718  
           EXEC SQL ROLLBACK END-EXEC.                                  CAT718  
           MOVE 3999 TO ABEND-CODE.                                     CAT718  
           PERFORM CALL-ABEND.                                          CAT718  
                                                                        CAT718  
       CALL-ABEND.                                                      CAT718  
           CALL ABEND USING ABEND-CODE.                                 CAT718  
                                                                        CAT718  
