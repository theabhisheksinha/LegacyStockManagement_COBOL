000001* PDX    - CAT756   C0346920 06/24/14 14:55:13 TBLAMUR            00001000
LRM005* SSR 99626 ADDITIONAL CHANGE TO POPULATE FRV FIELDS.                     
000001* PDX    - CAT756   C0352964 03/19/14 10:46:24 TBLAMUR            00001000
LRM004* SSR 99626 ADD FRV REASON DESCRIPTION ON WACAT024.                       
000001* PDX    - CAT756   C0263663 04/14/08 16:28:12 TBLAMUR            00001000
LRM003* SSR 57230 REMOVE WACAT026 WIRE (MOVED TO CAT610).                       
000001* PDX    - CAT756   C0262054 03/07/08 11:11:51 TBLAMUR            00001000
LRM002* SSR 43644 PASS ACAT STTLM-DT ON WACAT020 WIRE.                          
000001* PDX    - CAT756   C0248821 06/13/07 09:06:21 TBLAMUR            00001000
LRM001* SSR 52182 ADD ORG ALTBR AND  ACCT NBR TO WIRES FIXED PORTION.           
000001* PDX    - CAT756   C0240170 12/20/06 11:41:15 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                         CAT756  
       PROGRAM-ID. CAT756.                                              CAT756  
      *                                                                 CAT756  
       DATE-WRITTEN. OCTOBER 2006.                                      CAT756  
      *---------------------------------------------------------------* CAT756  
      *REMARKS.                                                       * CAT756  
      *                                                               * CAT756  
      *  CAT756   CREATE ACAT WIRES AFTER EOD UPDATE CAT710.          * CAT756  
      *           CAT756 READS ACTIVE TABLES VTRNFR AND VASSET        * CAT756  
      *           TO PRODUCE WIRES WACAT020, 21,22,24,25,26.          * CAT756  
      *           OUTPUT WIRE MESSAGE FIE IS FEED INTO BDFWORI.       * CAT756  
      *---------------------------------------------------------------* CAT756  
           EJECT                                                        CAT756  
       ENVIRONMENT DIVISION.                                            CAT756  
       INPUT-OUTPUT SECTION.                                            CAT756  
                                                                        CAT756  
       FILE-CONTROL.                                                    CAT756  
                                                                        CAT756  
           SELECT  AUTOWIRE-FILE       ASSIGN  TO  UT-S-WIRES.          CAT756  
                                                                        CAT756  
                                                                        CAT756  
           EJECT                                                        CAT756  
       DATA DIVISION.                                                   CAT756  
                                                                        CAT756  
       FILE SECTION.                                                    CAT756  
                                                                        CAT756  
       FD  AUTOWIRE-FILE                                                CAT756  
           LABEL RECORDS STANDARD                                       CAT756  
           RECORDING MODE IS F                                          CAT756  
           BLOCK CONTAINS 0 RECORDS                                     CAT756  
           RECORD CONTAINS 700 CHARACTERS.                              CAT756  
       01  AUTOWIRE-REC                PIC X(700).                      CAT756  
                                                                        CAT756  
           EJECT                                                        CAT756  
      ***************************************************************** CAT756  
       WORKING-STORAGE  SECTION.                                        CAT756  
      ***************************************************************** CAT756  
       77  PGM-NAME                         PIC X(08)  VALUE 'CAT756'.  CAT756  
                                                                        CAT756  
       77  ABEND-CODE            COMP       PIC S9(4)  VALUE +1000.     CAT756  
       77  ACAT-RECS-TOTAL       COMP       PIC S9(9)  VALUE +0.        CAT756  
                                                                        CAT756  
       77  B1-SUB                           PIC 9(4)    VALUE 0.        CAT756  
       77  WS-CLIENT-NBR                    PIC X(4)    VALUE '0000'.   CAT756  
       77  B1-TBL-CNT                       PIC 9(4)    VALUE 0.        CAT756  
       77  WK-TIMESTAMP                     PIC X(26).                  CAT756  
       77  B1-REQ-AUTO-WIRES-PROC           PIC X(01)  VALUE '0'.       CAT756  
       77  WS-SQLCODE                       PIC Z(8)9-.                         
                                                                        CAT756  
       77  ACAT-EOF-SW                      PIC X(01)  VALUE ' '.       CAT756  
           88  ACAT-EOF                                VALUE 'Y'.       CAT756  
       77  END-OF-ASSET-SW                  PIC X(01)  VALUE ' '.               
           88  END-OF-ASSET                            VALUE 'Y'.               
       77  VTRNFR-CURSOR-SW                 PIC X(01)  VALUE ' '.               
           88  TFRCRSR-READONLY                        VALUE 'R'.       CAT756  
           88  TFRCRSR-UPDATE                          VALUE 'U'.       CAT756  
                                                                        CAT756  
       01  WORK-DATE-AREA.                                              CAT756  
           05  WDA-CC                   PIC X(2).                       CAT756  
           05  WDA-YY                   PIC X(2).                       CAT756  
           05  WDA-MM                   PIC X(2).                       CAT756  
           05  WDA-DD                   PIC X(2).                       CAT756  
           05  WK-TODAY-JULIAN-DT.                                      CAT756  
               07  WK-TODAY-JUL-YEAR    PIC X(04).                      CAT756  
               07  WK-TODAY-JUL-DAYS    PIC X(03).                      CAT756  
                                                                        CAT756  
       01  WORK-EDIT-TIMESTAMP-AREA.                                    CAT756  
           05  WK-CRT-TMSTP-CCYYMMDD.                                   CAT756  
               07  WK-CRT-TMSTP-CC      PIC X(02).                      CAT756  
               07  WK-CRT-TMSTP-YY      PIC X(02).                      CAT756  
               07  WK-CRT-TMSTP-MM      PIC X(02).                      CAT756  
               07  WK-CRT-TMSTP-DD      PIC X(02).                      CAT756  
           05  WK-UPD-TMSTP.                                            CAT756  
               07  WK-UPD-TMSTP-CC      PIC X(02).                      CAT756  
               07  WK-UPD-TMSTP-YY      PIC X(02).                      CAT756  
               07  WK-UPD-TMSTP-MM      PIC X(02).                      CAT756  
               07  WK-UPD-TMSTP-DD      PIC X(02).                      CAT756  
                                                                        CAT756  
       01  WK-AREA.                                                     CAT756  
           05  WK-DAYS-STTS-QTY         PIC 9(7).                       CAT756  
           05  WK-ACAT-CNTRL-NBR        PIC X(14).                      CAT756  
           05  WK-ACAT-CNTRL-NBR-R   REDEFINES WK-ACAT-CNTRL-NBR.       CAT756  
               07  WK-ACAT-CNTRL-JUL-DT PIC X(07).                      CAT756  
               07  WK-ACAT-CNTRL-SEQ    PIC X(07).                      CAT756  
                                                                        CAT756  
       01  WS-MEMO-MSG                  PIC X(56) VALUE                 CAT756  
           'INCOMING ACAT SETTLEMENT & NON-TRANSFERABLE NOTIFICATION'.          
                                                                                
       01  WS-FRGN-CURR-MSG             PIC X(36) VALUE                 CAT756  
           'INCOMING ACAT WITTH FOREIGN CURRENCY'.                              
                                                                                
       01  WS-COUNTERS.                                                 CAT756  
           05  ACAT-DTL-RECS            PIC 9(11) VALUE 0.              CAT756  
           05  NA-FILE-FND-CNT          PIC 9(11) VALUE 0.              CAT756  
                                                                        CAT756  
      ******************************************************************CAT756  
      * DB2 ERROR MESSAGE AREA                                         *CAT756  
      ******************************************************************CAT756  
           COPY STUBCPY.                                                CAT756  
       01  DSNTIAR                       PIC X(008) VALUE 'DSNTIAR'.    CAT756  
       01  W-DB2-MESSAGE-AREA.                                          CAT756  
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.    CAT756  
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES     CAT756  
                   INDEXED BY W-DB2-IDX.                                CAT756  
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.     CAT756  
                                                                        CAT756  
       01  W-DB2-ERR-MSG-OUT.                                           CAT756  
           05  FILLER                   PIC X(04) VALUE '**  '.         CAT756  
           05  W-ERR-MSG-OUT            PIC X(50).                      CAT756  
           05  FILLER                   PIC X(12) VALUE '=> SQLCODE: '. CAT756  
           05  W-SQLCODE-OUT            PIC -999.                       CAT756  
           EJECT                                                        CAT756  
           EXEC SQL                                                     CAT756  
              INCLUDE SQLCA                                             CAT756  
           END-EXEC.                                                    CAT756  
           EJECT                                                        CAT756  
           EXEC SQL                                                     CAT756  
              INCLUDE VTRNFR                                            CAT756  
           END-EXEC.                                                    CAT756  
           EXEC SQL                                                     CAT756  
              INCLUDE VASSET                                            CAT756  
           END-EXEC.                                                    CAT756  
           EXEC SQL                                                     CAT756  
              INCLUDE VPRTCPPF                                          CAT756  
           END-EXEC.                                                    CAT756  
           EJECT                                                        CAT756  
      *----------------------------------------------------------------         
      * ACTIVE TRANSFER (READ ONLY) FOR FULL RECEIVES AND                       
      * RECLAIMS COMING BACK IN.                                                
      *----------------------------------------------------------------         
           EXEC SQL                                                     CAT756  
             DECLARE  TFRCRSR  CURSOR FOR                               CAT756  
               SELECT                                                   CAT756  
                   CLIENT_NBR                                           CAT756  
                  ,ACAT_CONTROL_NBR                                     CAT756  
                  ,SBMTG_PRTCP_NBR                                      CAT756  
                  ,DLVR_NBR                                             CAT756  
                  ,ACCT_DLVR_NBR                                        CAT756  
                  ,RCV_NBR                                              CAT756  
                  ,ACCT_RCV_NBR                                         CAT756  
                  ,TRNFR_TYPE_CD                                        CAT756  
                  ,TRANS_TYPE_CD                                        CAT756  
                  ,RCV_CUST_NM                                          CAT756  
                  ,RCV_ACCT_TYPE_CD                                     CAT756  
                  ,RCV_OCC_BRKR_NBR                                     CAT756  
                  ,RCV_CRSPN_NBR                                        CAT756  
                  ,ACAT_CNTL_ASTD_NBR                                   CAT756  
                  ,CMNT_TXT                                             CAT756  
                  ,PRCS_DT                                              CAT756  
                  ,STTS_CD                                              CAT756  
                  ,STTLM_TM_CD                                          CAT756  
                  ,DSTBN_SIDE_CD                                        CAT756  
                  ,RR_CD                                                CAT756  
                  ,BRANCH_CD                                            CAT756  
                  ,DAYS_STTS_QTY                                        CAT756  
                  ,STTLM_DT                                             CAT756  
                  ,ACCT_CD                                              CAT756  
                  ,CRT_TMSTP                                            CAT756  
                  ,UPDT_TMSTP                                           CAT756  
                  ,BRANCH_ALTNT_CD                                              
                  ,RR_ORGNL_CD                                                  
               FROM                                                     CAT756  
                   VTRNFR                                               CAT756  
               WHERE                                                    CAT756  
                  (CLIENT_NBR = :WS-CLIENT-NBR                          CAT756  
                   AND TRNFR_TYPE_CD = 'RCL'                            CAT756  
                   AND DSTBN_SIDE_CD = 'D'                              CAT756  
                   AND STTS_CD IN ('200', '300', '310'))                CAT756  
               OR (CLIENT_NBR = :WS-CLIENT-NBR                          CAT756  
                   AND TRNFR_TYPE_CD = 'FUL'                            CAT756  
                   AND DSTBN_SIDE_CD = 'R'                              CAT756  
                   AND STTS_CD IN ('300', '310'))                       CAT756  
               ORDER BY                                                 CAT756  
                   BRANCH_CD                                            CAT756  
                  ,ACCT_CD                                              CAT756  
               FOR READ ONLY WITH UR                                            
           END-EXEC.                                                    CAT756  
                                                                                
           SKIP3                                                                
      *----------------------------------------------------------------         
      * ACTIVE TRANSFER (UPDATE) RCL AND FRV WHICH WERE ACCEPTED                
      * ON THE E SCREEN IN REVIEW, OR NOT ACCEPTED AND SETTLING.                
      *----------------------------------------------------------------         
           EXEC SQL                                                     CAT756  
             DECLARE  TFRCRSR_UPDATE CURSOR WITH HOLD FOR               CAT756  
               SELECT                                                   CAT756  
                   CLIENT_NBR                                           CAT756  
                  ,ACAT_CONTROL_NBR                                     CAT756  
                  ,SBMTG_PRTCP_NBR                                      CAT756  
                  ,DLVR_NBR                                             CAT756  
                  ,ACCT_DLVR_NBR                                        CAT756  
                  ,RCV_NBR                                              CAT756  
                  ,ACCT_RCV_NBR                                         CAT756  
                  ,TRNFR_TYPE_CD                                        CAT756  
                  ,TRANS_TYPE_CD                                        CAT756  
                  ,RCV_CUST_NM                                          CAT756  
                  ,RCV_ACCT_TYPE_CD                                     CAT756  
                  ,RCV_OCC_BRKR_NBR                                     CAT756  
                  ,RCV_CRSPN_NBR                                        CAT756  
                  ,ACAT_CNTL_ASTD_NBR                                   CAT756  
                  ,CMNT_TXT                                             CAT756  
                  ,PRCS_DT                                              CAT756  
                  ,STTS_CD                                              CAT756  
                  ,STTLM_TM_CD                                          CAT756  
                  ,DSTBN_SIDE_CD                                        CAT756  
                  ,RR_CD                                                CAT756  
                  ,BRANCH_CD                                            CAT756  
                  ,DAYS_STTS_QTY                                        CAT756  
                  ,STTLM_DT                                             CAT756  
                  ,ACCT_CD                                              CAT756  
                  ,CRT_TMSTP                                            CAT756  
                  ,UPDT_TMSTP                                           CAT756  
                  ,BRANCH_ALTNT_CD                                              
                  ,RR_ORGNL_CD                                                  
               FROM                                                     CAT756  
                   VTRNFR                                               CAT756  
               WHERE                                                    CAT756  
                  (CLIENT_NBR = :WS-CLIENT-NBR                          CAT756  
                   AND TRNFR_TYPE_CD = 'FRV'                            CAT756  
                   AND DSTBN_SIDE_CD = 'R'                              CAT756  
                   AND ((ACCT_DLRV_PRGR_IND = 'A'                               
                    AND STTS_CD =  '200')                               CAT756  
                   OR  (NOT ACCT_DLRV_PRGR_IND = 'C'                            
                    AND STTS_CD IN ('300', '310')))                     CAT756  
                   )                                                            
               ORDER BY                                                 CAT756  
                   BRANCH_CD                                            CAT756  
                  ,ACCT_CD                                              CAT756  
           END-EXEC.                                                    CAT756  
LRM003****         AND TRNFR_TYPE_CD IN ('RCL', 'FRV')                          
                                                                                
           EJECT                                                        CAT756  
      *----------------------------------------------------------------*        
      * CUSROR FOR WACAT021 FROM VASSET, UNDELIVERABLE ASSETS          *        
      * ON SPECIFIED ACAT TRANSFER                                     *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
                DECLARE VASSET_W021_CSR CURSOR FOR                              
                SELECT                                                          
                     ASSET_SEQ_NBR                                              
                    ,CSH_MGN_SHRT_CD                                            
                    ,STTLM_LCTN_CD                                              
                    ,PSTN_CD                                                    
                    ,ASSET_AMT                                                  
                    ,ASSET_QTY                                                  
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,SECURITY_ADP_NBR                                           
                    ,TRNFR_TYPE_CD                                              
                    ,TRNFR_TYPE_RSN_CD                                          
                    ,ASSET_DESC_TXT                                             
                FROM VASSET                                                     
                WHERE                                                           
                     CLIENT_NBR       = :DCLVTRNFR.CLIENT-NBR                   
                 AND ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CONTROL-NBR             
                 AND STTLM_LCTN_CD   IN ('30', '45')                            
                 AND ISIN_SEC_ISSUE_CD > '         '                            
                 AND NOT STTLM_RSN_CD = 'SMA'                                   
                ORDER BY ASSET_SEQ_NBR                                          
               FOR READ ONLY WITH UR                                            
           END-EXEC.                                                            
                                                                        CAT756  
      *----------------------------------------------------------------*        
      * CUSROR FOR WACAT022 FROM VASSET, FOREIGN CURRENCY ASSETS       *        
      * ON SPECIFIED ACAT TRANSFER                                     *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
                DECLARE VASSET_W022_CSR CURSOR FOR                              
                SELECT                                                          
                     ASSET_SEQ_NBR                                              
                    ,CSH_MGN_SHRT_CD                                            
                    ,STTLM_LCTN_CD                                              
                    ,PSTN_CD                                                    
                    ,ASSET_AMT                                                  
                    ,ASSET_QTY                                                  
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,SECURITY_ADP_NBR                                           
                    ,TRNFR_TYPE_CD                                              
                    ,TRNFR_TYPE_RSN_CD                                          
                    ,ASSET_DESC_TXT                                             
                FROM VASSET                                                     
                WHERE                                                           
                     CLIENT_NBR       = :DCLVTRNFR.CLIENT-NBR                   
                 AND ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CONTROL-NBR             
                 AND STTLM_RSN_CD     = 'FCUR'                                  
                ORDER BY ASSET_SEQ_NBR                                          
               FOR READ ONLY WITH UR                                            
           END-EXEC.                                                            
                                                                        CAT756  
      *----------------------------------------------------------------*        
      * CUSROR FOR WACAT025,26 FROM VASSET, FOR ALL ASSETS             *        
      * ON SPECIFIED ACAT TRANSFER                                     *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
                DECLARE VASSET_CSR CURSOR FOR                                   
                SELECT                                                          
                     ASSET_SEQ_NBR                                              
                    ,CSH_MGN_SHRT_CD                                            
                    ,STTLM_LCTN_CD                                              
                    ,PSTN_CD                                                    
                    ,ASSET_AMT                                                  
                    ,ASSET_QTY                                                  
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,SECURITY_ADP_NBR                                           
                    ,TRNFR_TYPE_CD                                              
                    ,TRNFR_TYPE_RSN_CD                                          
                    ,ASSET_DESC_TXT                                             
                FROM VASSET                                                     
                WHERE                                                           
                     CLIENT_NBR       = :DCLVTRNFR.CLIENT-NBR                   
                 AND ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CONTROL-NBR             
                ORDER BY ASSET_SEQ_NBR                                          
               FOR READ ONLY WITH UR                                            
           END-EXEC.                                                            
                                                                        CAT756  
           EJECT                                                        CAT756  
           COPY BPDATESC.                                               CAT756  
           EJECT                                                        CAT756  
           COPY BHINFO.                                                 CAT756  
           EJECT                                                        CAT756  
           COPY BHACAT.                                                 CAT756  
           EJECT                                                        CAT756  
           COPY BHREQ.                                                  CAT756  
                                                                        CAT756  
           EJECT                                                        CAT756  
      * NAME AND ADDRESS FILE AREAS                                     CAT756  
       COPY GETNACOB.                                                   CAT756  
       01  GETNA-SEGMENT-INCLUDES.                                      CAT756  
       COPY NASEGHDR.                                                   CAT756  
       COPY NASEGPPA.                                                   CAT756  
       COPY NNASGPPN.                                                   CAT756  
       COPY NASEGEND.                                                   CAT756  
           EJECT                                                        CAT756  
       01  WS-AUTOWIRE-HDR.                                             CAT756  
           05 WS-AUTOWIRE-HDR-LIT      PIC X(05) VALUE 'DATE='.         CAT756  
           05 WS-AUTOWIRE-DATE         PIC X(06).                       CAT756  
                                                                        CAT756  
       01  WS-AUTOWIRE-TRLR.                                            CAT756  
           05 WS-AUTOWIRE-TRLR-LIT     PIC X(08) VALUE 'REC-CNT='.      CAT756  
           05 WS-AUTOWIRE-REC-CNT      PIC 9(11) VALUE 0.               CAT756  
                                                                        CAT756  
       COPY  ESWWIRES.                                                  CAT756  
       COPY  CATWIRE  REPLACING ==:WIRE:== BY ==WIRE==.                 CAT756  
           EJECT                                                        CAT756  
       01  PROC-DATE.                                                   CAT756  
           05  PD-CC                   PIC X(2).                        CAT756  
           05  PD-YY                   PIC X(2).                        CAT756  
           05  PD-MM                   PIC X(2).                        CAT756  
           05  PD-DD                   PIC X(2).                        CAT756  
                                                                        CAT756  
       01  PROC-DATE-N  REDEFINES PROC-DATE  PIC 9(8).                  CAT756  
                                                                        CAT756  
       01  PROC-DATE-EDITED.                                            CAT756  
           05  PD-EDITED-CC            PIC X(02).                       CAT756  
           05  PD-EDITED-YY            PIC X(02).                       CAT756  
           05  FILLER                  PIC X(01) VALUE '-'.             CAT756  
           05  PD-EDITED-MM            PIC X(02).                       CAT756  
           05  FILLER                  PIC X(01) VALUE '-'.             CAT756  
           05  PD-EDITED-DD            PIC X(02).                       CAT756  
                                                                                
       01  NEXT-PROC-DATE-EDITED.                                       CAT756  
           05  NEXT-PD-EDITED-CC       PIC X(02).                       CAT756  
           05  NEXT-PD-EDITED-YY       PIC X(02).                       CAT756  
           05  FILLER                  PIC X(01) VALUE '-'.             CAT756  
           05  NEXT-PD-EDITED-MM       PIC X(02).                       CAT756  
           05  FILLER                  PIC X(01) VALUE '-'.             CAT756  
           05  NEXT-PD-EDITED-DD       PIC X(02).                       CAT756  
                                                                        CAT756  
       01  NEXT2-PROC-DATE-EDITED.                                      CAT756  
           05  NEXT2-PD-EDITED-CC      PIC X(02).                       CAT756  
           05  NEXT2-PD-EDITED-YY      PIC X(02).                       CAT756  
           05  FILLER                  PIC X(01) VALUE '-'.             CAT756  
           05  NEXT2-PD-EDITED-MM      PIC X(02).                       CAT756  
           05  FILLER                  PIC X(01) VALUE '-'.             CAT756  
           05  NEXT2-PD-EDITED-DD      PIC X(02).                       CAT756  
                                                                        CAT756  
       01  EDIT-CURRENT-DATE.                                           CAT756  
           05  EDIT-CUR-MM             PIC X(2).                        CAT756  
           05  EDIT-CUR-DD             PIC X(2).                        CAT756  
           05  EDIT-CUR-YY             PIC X(2).                        CAT756  
                                                                        CAT756  
       01  TODAYS-DATE.                                                 CAT756  
           05  TODAYS-CC               PIC X(2).                        CAT756  
           05  TODAYS-YYMMDD           PIC X(6).                        CAT756  
                                                                        CAT756  
       01  CURRENT-TIME.                                                        
           05  CUR-HR                  PIC X(2).                                
           05  CUR-MN                  PIC X(2).                                
           05  CUR-SS                  PIC X(2).                                
           05  CUR-HS                  PIC X(2).                                
                                                                                
       01  SETTLE-DATE.                                                 CAT756  
           05  SETTLE-CCYY             PIC X(4).                        CAT756  
           05  SETTLE-MM               PIC X(2).                        CAT756  
           05  SETTLE-DD               PIC X(2).                        CAT756  
                                                                        CAT756  
       01  BR-ACCT-TEST-AREA.                                           CAT756  
           05  BR-ACCT-IN              PIC X(15).                       CAT756  
           05  FILLER REDEFINES BR-ACCT-IN.                             CAT756  
               10  B-CHAR OCCURS 15 TIMES                               CAT756  
                                       PIC X.                           CAT756  
           05  BR-ACCT-CNV             PIC X(8).                        CAT756  
           05  FILLER REDEFINES BR-ACCT-CNV.                            CAT756  
               10  C-CHAR OCCURS 8 TIMES                                CAT756  
                                       PIC X.                           CAT756  
           SKIP3                                                        CAT756  
       LINKAGE SECTION.                                                         
       01  PARM-AREA.                                                           
           05  PARM-LENGTH                  PIC S9(4) COMP SYNC.                
           05  PARM-INFO.                                                       
               10  PARM-STREAM              PIC X.                              
                   88  PARM-STREAM-VALID                VALUES ARE              
                       'A' THRU 'Z' '0' THRU '9'.                               
                                                                                
           EJECT                                                                
       PROCEDURE DIVISION USING PARM-AREA.                                      
           DISPLAY 'CAT756 - CREATE AUTO WIRES FROM ACAT EOD POSNS'.    CAT756  
           DISPLAY ' '.                                                 CAT756  
           COPY MSGCOBO.                                                CAT756  
           DISPLAY ' '.                                                 CAT756  
                                                                        CAT756  
           PERFORM  100-HOUSEKEEPING THRU                               CAT756  
                    100-HOUSEKEEPING-EXIT.                              CAT756  
                                                                        CAT756  
           PERFORM  200-INIT-B1-LOOP THRU                               CAT756  
                    200-INIT-B1-LOOP-EXIT.                              CAT756  
                                                                        CAT756  
           PERFORM  1900-ENDJOB-ROUTINE                                 CAT756  
              THRU  1900-ENDJOB-ROUTINE-EXIT.                           CAT756  
                                                                        CAT756  
           GOBACK.                                                      CAT756  
                                                                        CAT756  
           EJECT                                                        CAT756  
      ******************                                                CAT756  
       100-HOUSEKEEPING.                                                CAT756  
      ******************                                                CAT756  
                                                                        CAT756  
           IF PARM-LENGTH NOT GREATER ZERO                                      
               DISPLAY 'PARM NOT RECEIVED - CAT610 ABENDED'                     
               MOVE 2000 TO ABEND-CODE                                          
               CALL ABEND          USING ABEND-CODE.                            
                                                                                
           DISPLAY 'PARM-STREAM    = ' PARM-STREAM                              
                                                                        CAT756  
           MOVE  PGM-NAME                TO BPDATES-CALLING-PGM.        CAT756  
           MOVE  'C'                     TO BPDATES-REQ-TYPE.           CAT756  
           CALL   BPDATES             USING BPDATES-PARAMETERS.         CAT756  
                                                                        CAT756  
           MOVE  BPD-PROC-DATE           TO  PROC-DATE.                 CAT756  
                                                                        CAT756  
           DISPLAY 'PROCESS DATE   = ' BPD-PROC-DATE.                   CAT756  
                                                                        CAT756  
           MOVE PD-CC   TO  PD-EDITED-CC.                               CAT756  
           MOVE PD-YY   TO  PD-EDITED-YY.                               CAT756  
           MOVE PD-MM   TO  PD-EDITED-MM.                               CAT756  
           MOVE PD-DD   TO  PD-EDITED-DD.                               CAT756  
                                                                        CAT756  
           MOVE BPD-PROC-PLUS-ONE-SD (1 : 2) TO NEXT-PD-EDITED-CC.              
           MOVE BPD-PROC-PLUS-ONE-SD (3 : 2) TO NEXT-PD-EDITED-YY.              
           MOVE BPD-PROC-PLUS-ONE-SD (5 : 2) TO NEXT-PD-EDITED-MM.              
           MOVE BPD-PROC-PLUS-ONE-SD (7 : 2) TO NEXT-PD-EDITED-DD.              
                                                                                
           MOVE BPD-PROC-PLUS-TWO-SD (1 : 2) TO NEXT2-PD-EDITED-CC.             
           MOVE BPD-PROC-PLUS-TWO-SD (3 : 2) TO NEXT2-PD-EDITED-YY.             
           MOVE BPD-PROC-PLUS-TWO-SD (5 : 2) TO NEXT2-PD-EDITED-MM.             
           MOVE BPD-PROC-PLUS-TWO-SD (7 : 2) TO NEXT2-PD-EDITED-DD.             
                                                                                
           DISPLAY 'TOMORROW EDITED DATE    ' NEXT-PROC-DATE-EDITED             
           DISPLAY 'TOMORROW +1 EDITED DATE ' NEXT2-PROC-DATE-EDITED            
           MOVE BPD-JULIAN-PROC-DATE  TO WK-TODAY-JULIAN-DT.            CAT756  
                                                                        CAT756  
           OPEN OUTPUT AUTOWIRE-FILE                                    CAT756  
                                                                        CAT756  
           ACCEPT CURRENT-TIME FROM TIME.                                       
                                                                        CAT756  
           MOVE PD-MM        TO WS-AUTOWIRE-DATE (1 : 2).               CAT756  
           MOVE PD-DD        TO WS-AUTOWIRE-DATE (3 : 2).               CAT756  
           MOVE PD-YY        TO WS-AUTOWIRE-DATE (5 : 2).               CAT756  
           WRITE AUTOWIRE-REC  FROM WS-AUTOWIRE-HDR.                    CAT756  
           MOVE SPACES TO ESWWIRE-MSG WIRE-ACAT-RECORD.                 CAT756  
       100-HOUSEKEEPING-EXIT. EXIT.                                     CAT756  
           EJECT                                                        CAT756  
      ***************                                                   CAT756  
       200-INIT-B1-LOOP.                                                CAT756  
      ***************                                                   CAT756  
                                                                        CAT756  
           DISPLAY ' '.                                                 CAT756  
           DISPLAY  'B1 TABLE VALUES'.                                  CAT756  
           MOVE 0                      TO  B1-TBL-CNT.                  CAT756  
           ADD  1                      TO  B1-SUB.                      CAT756  
           PERFORM  UNTIL  B1-SUB  >  500                               CAT756  
                                                                        CAT756  
             MOVE  ' '                    TO  BH-BROKER-HEADER-INFO     CAT756  
             MOVE  B1-SUB                 TO  BH-BROKER-NUMBER-N        CAT756  
             MOVE  '010'                  TO  BH-LOGICAL-RECORD-CODE    CAT756  
             MOVE  ' '                    TO  BH-B2-INFO-ID             CAT756  
             CALL   GETB1V              USING BH-BROKER-HEADER-INFO     CAT756  
             END-CALL                                                   CAT756  
                                                                        CAT756  
             IF  BH-BROKER-ACTIVE                                       CAT756  
                                                                                
               IF  PARM-STREAM  =  BH-BROKER-MINI-MAXI-INDICATOR                
                 MOVE  ' '                 TO  BH-ACAT-INFO             CAT756  
                 MOVE  B1-SUB              TO  BH-BROKER-NUMBER-N       CAT756  
                 MOVE  '015'               TO  BH-LOGICAL-RECORD-CODE   CAT756  
                 MOVE  '434500'            TO  BH-B2-INFO-ID            CAT756  
                 CALL   GETB1V           USING BH-BROKER-HEADER-INFO,   CAT756  
                                               BH-ACAT-INFO             CAT756  
                 END-CALL                                               CAT756  
                                                                        CAT756  
                 MOVE  ' '                 TO  BH-B2-INFO-ID            CAT756  
                 MOVE  B1-SUB              TO  BH-BROKER-NUMBER-N       CAT756  
                 MOVE  '114'               TO  BH-LOGICAL-RECORD-CODE   CAT756  
                 CALL   GETB1V           USING BH-BROKER-HEADER-INFO,   CAT756  
                                               BH-REQ-INFO              CAT756  
                 END-CALL                                               CAT756  
                 IF BH-BROKER-ACTIVE                                    CAT756  
                 AND BH-REQ-ACTIVE                                      CAT756  
                 AND BH-ACAT-ACTIVE                                     CAT756  
                      MOVE BH-REQ-AUTO-WIRES-PROC TO                    CAT756  
                              B1-REQ-AUTO-WIRES-PROC                    CAT756  
                 ELSE                                                   CAT756  
                      MOVE '0'  TO  B1-REQ-AUTO-WIRES-PROC              CAT756  
                 END-IF                                                 CAT756  
      ***** FORCE OFF WIRES CREATION WHEN ACATS B1 434696 SAYS NO:      CAT756  
                 IF BH-ACAT-ACTIVE                                      CAT756  
                 AND BH-ACAT-DO-NOT-CRT-AUTO-WIRES = '1'                CAT756  
                 AND B1-REQ-AUTO-WIRES-PROC = '1'                       CAT756  
                     MOVE '0'  TO  B1-REQ-AUTO-WIRES-PROC               CAT756  
                     DISPLAY BH-BROKER-NUMBER-N                         CAT756  
                            ' B1 434696=1 TURNS OFF 32960 AUTO WIRES'   CAT756  
                 END-IF                                                 CAT756  
                 DISPLAY BH-BROKER-NUMBER-N                             CAT756  
                  ' B1-REQ-AUTO-WIRES-PROC W/OVRD'                      CAT756  
                  '(032960) = ' B1-REQ-AUTO-WIRES-PROC                  CAT756  
                 IF B1-REQ-AUTO-WIRES-PROC = '1'                        CAT756  
                    MOVE B1-SUB TO WS-CLIENT-NBR                                
                    SET TFRCRSR-READONLY TO TRUE                        CAT756  
                    PERFORM 410-OPEN-TFR-CURSOR-TBL                     CAT756  
                    IF SQLCODE = +0                                             
                       MOVE 'N' TO ACAT-EOF-SW                                  
                       PERFORM 400-PROCESS-ACAT-TFR-TBL THRU 400-EXIT   CAT756  
                          UNTIL ACAT-EOF                                        
                       PERFORM 430-CLOSE-TFR-CURSOR-TBL                 CAT756  
                    END-IF                                              CAT756  
                 END-IF                                                 CAT756  
               END-IF                                                   CAT756  
             END-IF                                                     CAT756  
             ADD  1                      TO  B1-SUB                     CAT756  
           END-PERFORM.                                                 CAT756  
       200-INIT-B1-LOOP-EXIT.   EXIT.                                   CAT756  
           EJECT                                                        CAT756  
      *                                                                 CAT756  
                                                                        CAT756  
       EJECT                                                            CAT756  
       400-PROCESS-ACAT-TFR-TBL.                                        CAT756  
           PERFORM 420-FETCH-TFR-CURSOR-TBL.                            CAT756  
           IF SQLCODE = 0                                               CAT756  
              CONTINUE                                                  CAT756  
           ELSE                                                         CAT756  
           IF SQLCODE = +100                                            CAT756  
              IF NOT TFRCRSR-UPDATE                                     CAT756  
                 PERFORM 430-CLOSE-TFR-CURSOR-TBL                       CAT756  
                 SET TFRCRSR-UPDATE TO TRUE                             CAT756  
                 PERFORM 410-OPEN-TFR-CURSOR-TBL                        CAT756  
                 GO TO 400-PROCESS-ACAT-TFR-TBL                         CAT756  
              ELSE                                                              
                 SET ACAT-EOF TO TRUE                                   CAT756  
                 GO TO 400-EXIT                                         CAT756  
           ELSE                                                         CAT756  
              PERFORM  8000-SQL-ERROR THRU 8000-EXIT                    CAT756  
              MOVE 'DB2 CURSOR STATEMENT FETCH ERROR' TO W-ERR-MSG-OUT  CAT756  
              MOVE SQLCODE TO W-SQLCODE-OUT                             CAT756  
              DISPLAY ' '                                               CAT756  
              DISPLAY W-DB2-ERR-MSG-OUT                                 CAT756  
              DISPLAY '** PROGRAM CAT756 BAD FETCH / ABENDED '          CAT756  
              MOVE 4000 TO ABEND-CODE                                           
              CALL ABEND USING ABEND-CODE.                              CAT756  
                                                                        CAT756  
           MOVE CRT-TMSTP  OF DCLVTRNFR (1:2) TO WK-CRT-TMSTP-CC.       CAT756  
           MOVE CRT-TMSTP  OF DCLVTRNFR (3:2) TO WK-CRT-TMSTP-YY.       CAT756  
           MOVE CRT-TMSTP  OF DCLVTRNFR (6:2) TO WK-CRT-TMSTP-MM.       CAT756  
           MOVE CRT-TMSTP  OF DCLVTRNFR (9:2) TO WK-CRT-TMSTP-DD.       CAT756  
           MOVE UPDT-TMSTP OF DCLVTRNFR (1:2) TO WK-UPD-TMSTP-CC.       CAT756  
           MOVE UPDT-TMSTP OF DCLVTRNFR (3:2) TO WK-UPD-TMSTP-YY.       CAT756  
           MOVE UPDT-TMSTP OF DCLVTRNFR (6:2) TO WK-UPD-TMSTP-MM.       CAT756  
           MOVE UPDT-TMSTP OF DCLVTRNFR (9:2) TO WK-UPD-TMSTP-DD.       CAT756  
                                                                        CAT756  
      * GET NAME AND ADDRESS RECORD FOR THIS ACCOUNT                    CAT756  
           INITIALIZE  GETNA-PARAMETERS.                                CAT756  
           MOVE  'R'                        TO  GETNA-REQ-FUNC.         CAT756  
           MOVE  'R'                        TO  GETNA-REQ-FILE.         CAT756  
           MOVE  'R'                        TO  GETNA-REQ-FUNC2.        CAT756  
           MOVE  'N'                        TO  GETNA-REQ-YEAREND.      CAT756  
           MOVE  'CAT756'                   TO  GETNA-PGM-NAME.         CAT756  
           MOVE  BH-BROKER-NUMBER           TO  GETNA-KEY-CLIENT        CAT756  
           MOVE  '00'                       TO  GETNA-KEY-BRANCH1-2     CAT756  
           MOVE  BRANCH-CD                  TO  GETNA-KEY-BRANCH3-5     CAT756  
           MOVE  '00000'                    TO  GETNA-KEY-ACCOUNT1-5    CAT756  
           MOVE  ACCT-CD                    TO  GETNA-KEY-ACCOUNT6-10   CAT756  
           CALL   GETNA               USING GETNA-PARAMETERS            CAT756  
                                            GETNA-SEGMENT-INCLUDES      CAT756  
           END-CALL                                                     CAT756  
           IF GETNA-RETURN-FOUND                                        CAT756  
              ADD 1 TO NA-FILE-FND-CNT                                  CAT756  
              PERFORM 0500-AUTO-WIRES-RTN THRU 0500-EXIT                CAT756  
           ELSE                                                                 
              DISPLAY 'SKIP WIRE N/A NOTFND '  BH-BROKER-NUMBER                 
                  ' ' BRANCH-CD '-'  ACCT-CD                                    
           END-IF.                                                      CAT756  
                                                                        CAT756  
       400-EXIT.                     EXIT.                              CAT756  
      *                                                                 CAT756  
       EJECT                                                            CAT756  
      *                                                                 CAT756  
      *----------------------------------------------------------------*CAT756  
      *           FETCH ACTIVE TRANSFER CURSOR TABLE                   *CAT756  
      *----------------------------------------------------------------*CAT756  
       410-OPEN-TFR-CURSOR-TBL.                                         CAT756  
           IF TFRCRSR-READONLY                                                  
              EXEC SQL                                                  CAT756  
                 OPEN TFRCRSR                                           CAT756  
              END-EXEC                                                  CAT756  
           ELSE                                                                 
              EXEC SQL                                                  CAT756  
                 OPEN TFRCRSR_UPDATE                                    CAT756  
              END-EXEC                                                  CAT756  
           END-IF.                                                              
                                                                                
           IF SQLCODE = 0                                               CAT756  
              CONTINUE                                                  CAT756  
           ELSE                                                         CAT756  
              PERFORM  8000-SQL-ERROR THRU 8000-EXIT                    CAT756  
              MOVE 'DB2 CURSOR STATEMENT OPEN ERROR' TO W-ERR-MSG-OUT   CAT756  
              MOVE SQLCODE TO W-SQLCODE-OUT                             CAT756  
              DISPLAY ' '                                               CAT756  
              DISPLAY W-DB2-ERR-MSG-OUT                                 CAT756  
              DISPLAY '** PROGRAM CAT756 CURSOR TFRCRSR OPEN ABEND'     CAT756  
              MOVE 4100 TO ABEND-CODE                                           
              CALL ABEND USING ABEND-CODE.                              CAT756  
                                                                        CAT756  
      *                                                                 CAT756  
      *----------------------------------------------------------------*CAT756  
      *           FETCH ACTIVE TRANSFER CURSOR TABLE                   *CAT756  
      *----------------------------------------------------------------*CAT756  
       420-FETCH-TFR-CURSOR-TBL.                                        CAT756  
           IF TFRCRSR-READONLY                                                  
              EXEC SQL                                                  CAT756  
              FETCH                                                     CAT756  
                 TFRCRSR                                                CAT756  
              INTO                                                      CAT756  
                :DCLVTRNFR.CLIENT-NBR                                   CAT756  
               ,:DCLVTRNFR.ACAT-CONTROL-NBR                             CAT756  
               ,:DCLVTRNFR.SBMTG-PRTCP-NBR                              CAT756  
               ,:DCLVTRNFR.DLVR-NBR                                     CAT756  
               ,:DCLVTRNFR.ACCT-DLVR-NBR                                CAT756  
               ,:DCLVTRNFR.RCV-NBR                                      CAT756  
               ,:DCLVTRNFR.ACCT-RCV-NBR                                 CAT756  
               ,:DCLVTRNFR.TRNFR-TYPE-CD                                CAT756  
               ,:DCLVTRNFR.TRANS-TYPE-CD                                CAT756  
               ,:RCV-CUST-NM                                            CAT756  
               ,:RCV-ACCT-TYPE-CD                                       CAT756  
               ,:RCV-OCC-BRKR-NBR                                       CAT756  
               ,:RCV-CRSPN-NBR                                          CAT756  
               ,:ACAT-CNTL-ASTD-NBR                                     CAT756  
               ,:DCLVTRNFR.CMNT-TXT                                     CAT756  
               ,:DCLVTRNFR.PRCS-DT                                      CAT756  
               ,:STTS-CD                                                CAT756  
               ,:STTLM-TM-CD                                            CAT756  
               ,:DSTBN-SIDE-CD                                          CAT756  
               ,:RR-CD                                                  CAT756  
               ,:BRANCH-CD                                              CAT756  
               ,:DAYS-STTS-QTY                                          CAT756  
               ,:STTLM-DT                                               CAT756  
               ,:DCLVTRNFR.ACCT-CD                                      CAT756  
               ,:DCLVTRNFR.CRT-TMSTP                                    CAT756  
               ,:DCLVTRNFR.UPDT-TMSTP                                   CAT756  
               ,:BRANCH-ALTNT-CD                                                
               ,:RR-ORGNL-CD                                                    
              END-EXEC                                                  CAT756  
           ELSE                                                                 
              EXEC SQL                                                  CAT756  
              FETCH                                                     CAT756  
                 TFRCRSR_UPDATE                                         CAT756  
              INTO                                                      CAT756  
                :DCLVTRNFR.CLIENT-NBR                                   CAT756  
               ,:DCLVTRNFR.ACAT-CONTROL-NBR                             CAT756  
               ,:DCLVTRNFR.SBMTG-PRTCP-NBR                              CAT756  
               ,:DCLVTRNFR.DLVR-NBR                                     CAT756  
               ,:DCLVTRNFR.ACCT-DLVR-NBR                                CAT756  
               ,:DCLVTRNFR.RCV-NBR                                      CAT756  
               ,:DCLVTRNFR.ACCT-RCV-NBR                                 CAT756  
               ,:DCLVTRNFR.TRNFR-TYPE-CD                                CAT756  
               ,:DCLVTRNFR.TRANS-TYPE-CD                                CAT756  
               ,:RCV-CUST-NM                                            CAT756  
               ,:RCV-ACCT-TYPE-CD                                       CAT756  
               ,:RCV-OCC-BRKR-NBR                                       CAT756  
               ,:RCV-CRSPN-NBR                                          CAT756  
               ,:ACAT-CNTL-ASTD-NBR                                     CAT756  
               ,:DCLVTRNFR.CMNT-TXT                                     CAT756  
               ,:DCLVTRNFR.PRCS-DT                                      CAT756  
               ,:STTS-CD                                                CAT756  
               ,:STTLM-TM-CD                                            CAT756  
               ,:DSTBN-SIDE-CD                                          CAT756  
               ,:RR-CD                                                  CAT756  
               ,:BRANCH-CD                                              CAT756  
               ,:DAYS-STTS-QTY                                          CAT756  
               ,:STTLM-DT                                               CAT756  
               ,:DCLVTRNFR.ACCT-CD                                      CAT756  
               ,:DCLVTRNFR.CRT-TMSTP                                    CAT756  
               ,:DCLVTRNFR.UPDT-TMSTP                                   CAT756  
               ,:BRANCH-ALTNT-CD                                                
               ,:RR-ORGNL-CD                                                    
           END-EXEC.                                                    CAT756  
      *                                                                 CAT756  
      *----------------------------------------------------------------*CAT756  
      *           CLOSE ACTIVE TRANSFER CURSOR TABLE                   *CAT756  
      *----------------------------------------------------------------*CAT756  
       430-CLOSE-TFR-CURSOR-TBL.                                        CAT756  
           IF TFRCRSR-READONLY                                                  
              EXEC SQL                                                  CAT756  
                 CLOSE TFRCRSR                                          CAT756  
              END-EXEC                                                  CAT756  
           ELSE                                                                 
              EXEC SQL                                                  CAT756  
                 CLOSE TFRCRSR_UPDATE                                   CAT756  
              END-EXEC                                                  CAT756  
           END-IF.                                                              
       EJECT                                                            CAT756  
                                                                        CAT756  
       0500-AUTO-WIRES-RTN.                                             CAT756  
           IF STTLM-DT = NEXT-PROC-DATE-EDITED                          CAT756  
           AND (TRNFR-TYPE-CD OF DCLVTRNFR = 'FUL')                     CAT756  
              PERFORM 0620-CREATE-WACAT020-WIRE-RTN                             
           END-IF.                                                              
                                                                                
           IF STTLM-DT = NEXT2-PROC-DATE-EDITED                         CAT756  
           AND (TRNFR-TYPE-CD OF DCLVTRNFR = 'FUL')                     CAT756  
              PERFORM 0621-LOOKUP-WACAT021-WIRE-RTN                             
           END-IF.                                                              
                                                                                
           IF STTLM-DT = NEXT2-PROC-DATE-EDITED                         CAT756  
           AND (TRNFR-TYPE-CD OF DCLVTRNFR = 'FUL')                     CAT756  
              PERFORM 0622-LOOKUP-WACAT022-WIRE-RTN                             
           END-IF.                                                              
                                                                                
           IF TFRCRSR-UPDATE                                            CAT756  
           AND TRNFR-TYPE-CD OF DCLVTRNFR = 'FRV'                       CAT756  
              MOVE 'WACAT024' TO ESWWIRE-MSG-SCON                       CAT756  
              MOVE 'INCOMING ACAT FAIL REVERSAL' TO                     CAT756  
                                   ESWWIRE-MSG-SUBJECT                  CAT756  
              MOVE SPACES TO WIRE-ACAT-RECORD                           CAT756  
              PERFORM 0624-LOOKUP-ALL-ASSETS-RTN                                
              PERFORM 0510-UPDATE-TIF                                           
           END-IF.                                                              
                                                                                
           IF TRNFR-TYPE-CD OF DCLVTRNFR = 'RCL'                        CAT756  
           AND WK-CRT-TMSTP-CCYYMMDD = BPD-PRIOR-PROC-DATE              CAT756  
           AND DSTBN-SIDE-CD = 'D'                                      CAT756  
              MOVE 'WACAT025' TO ESWWIRE-MSG-SCON                       CAT756  
              MOVE 'OUTGOING ACAT RECLAIM' TO                           CAT756  
                                   ESWWIRE-MSG-SUBJECT                  CAT756  
              MOVE SPACES TO WIRE-ACAT-RECORD                           CAT756  
              PERFORM 0624-LOOKUP-ALL-ASSETS-RTN                                
           END-IF.                                                              
                                                                                
LRM003**** IF TFRCRSR-UPDATE                                            CAT756  
LRM003**** AND TRNFR-TYPE-CD OF DCLVTRNFR = 'RCL'                       CAT756  
LRM003****    MOVE 'WACAT026' TO ESWWIRE-MSG-SCON                       CAT756  
LRM003****    MOVE 'INCOMING ACAT RECLAIM' TO                           CAT756  
LRM003****                         ESWWIRE-MSG-SUBJECT                  CAT756  
LRM003****    MOVE SPACES TO WIRE-ACAT-RECORD                           CAT756  
LRM003****    PERFORM 0624-LOOKUP-ALL-ASSETS-RTN                                
LRM003****    PERFORM 0510-UPDATE-TIF                                           
LRM003**** END-IF.                                                              
       0500-EXIT. EXIT.                                                 CAT756  
                                                                                
       0510-UPDATE-TIF.                                                         
           EXEC SQL                                                             
              UPDATE VTRNFR                                                     
              SET ACCT_DLRV_PRGR_IND = 'C'                                      
              WHERE CLIENT_NBR       = :DCLVTRNFR.CLIENT-NBR                    
                AND ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CONTROL-NBR              
           END-EXEC                                                             
                                                                                
           IF SQLCODE NOT = +0                                                  
              DISPLAY '**** ABEND UPDATE VTRNFR **** '                          
              DISPLAY ' CLIENT_NBR = ' CLIENT-NBR OF DCLVTRNFR                  
                      ' CONTROL NBR '  ACAT-CONTROL-NBR OF DCLVTRNFR            
              MOVE SQLCODE TO WS-SQLCODE                                        
              DISPLAY 'DB2 STATUS ' WS-SQLCODE                                  
              PERFORM  8000-SQL-ERROR THRU 8000-EXIT                    CAT756  
              MOVE SQLCODE TO W-SQLCODE-OUT                             CAT756  
              MOVE 5010 TO ABEND-CODE                                           
              CALL ABEND USING ABEND-CODE                               CAT756  
           END-IF.                                                              
                                                                                
       EJECT                                                                    
       0620-CREATE-WACAT020-WIRE-RTN.                                           
           MOVE 'WACAT020' TO ESWWIRE-MSG-SCON                          CAT756  
           MOVE 'INCOMING ACAT SETTLEMENT NOTIFICATION' TO              CAT756  
                                ESWWIRE-MSG-SUBJECT                     CAT756  
           MOVE SPACES TO WIRE-ACAT-RECORD                              CAT756  
LRM002     IF STTLM-DT = '0001-01-01'                                           
LRM002        MOVE ' '                   TO WIRE-ACAT-SETTL-DATE                
LRM002     ELSE                                                                 
LRM002        MOVE STTLM-DT(1 : 4)       TO WIRE-ACAT-SETTL-DATE(1 : 4)         
LRM002        MOVE STTLM-DT(6 : 2)       TO WIRE-ACAT-SETTL-DATE(5 : 2)         
LRM002        MOVE STTLM-DT(9 : 2)       TO WIRE-ACAT-SETTL-DATE(7 : 2)         
LRM002     END-IF.                                                              
           PERFORM 0752-AUTO-WIRE-CREATION.                             CAT756  
                                                                        CAT756  
           SKIP3                                                        CAT756  
       0621-LOOKUP-WACAT021-WIRE-RTN.                                           
      *----------------------------------------------------------------*        
      * ONLY ONE MESSAGE IS CREATED FOR A TIF HAVING FOREIGN CURRENCY           
      * ASSET REGARDLESS OF HOW MANY EXIST.  THE ASSET DETAILS FROM             
      * THE FIRST FOREIGN ASSET READ ARE MOVED TO WIRE MESSAGE FOR              
      * RESEARCH PURPOSES, AS THIS DETAIL IS NOT REQUIRED AT THIS TIME.         
      *----------------------------------------------------------------*        
           DISPLAY 'LOOKING FOR MEMOS -'                                        
                      ' CLIENT_NBR = ' CLIENT-NBR OF DCLVTRNFR                  
                      ' CONTROL NBR '  ACAT-CONTROL-NBR OF DCLVTRNFR            
           EXEC SQL                                                             
                OPEN VASSET_W021_CSR                                            
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              DISPLAY 'VASSET_W021_CSR OPEN ERROR ' SQLCODE                     
           ELSE                                                                 
              MOVE ' '     TO  END-OF-ASSET-SW                                  
              PERFORM UNTIL END-OF-ASSET                                        
                EXEC SQL                                                        
                   FETCH VASSET_W021_CSR                                        
                   INTO                                                         
                   :DCLVASSET.ASSET-SEQ-NBR                                     
                  ,:DCLVASSET.CSH-MGN-SHRT-CD                                   
                  ,:DCLVASSET.STTLM-LCTN-CD                                     
                  ,:DCLVASSET.PSTN-CD                                           
                  ,:DCLVASSET.ASSET-AMT                                         
                  ,:DCLVASSET.ASSET-QTY                                         
                  ,:DCLVASSET.ISIN-SEC-ISSUE-CD                                 
                  ,:DCLVASSET.SECURITY-ADP-NBR                                  
                  ,:DCLVASSET.TRNFR-TYPE-CD                                     
                  ,:DCLVASSET.TRNFR-TYPE-RSN-CD                                 
                  ,:DCLVASSET.ASSET-DESC-TXT                                    
                END-EXEC                                                        
                EVALUATE SQLCODE                                                
                    WHEN +0                                                     
                           DISPLAY ' FOUND MEMO ASSET-'                         
                      ' CLIENT_NBR = ' CLIENT-NBR OF DCLVTRNFR                  
                      ' CONTROL NBR '  ACAT-CONTROL-NBR OF DCLVTRNFR            
                           MOVE 'WACAT021'  TO ESWWIRE-MSG-SCON         CAT756  
                           MOVE WS-MEMO-MSG TO ESWWIRE-MSG-SUBJECT      CAT756  
                           MOVE SPACES TO WIRE-ACAT-RECORD              CAT756  
                           PERFORM 0700-MOVE-ASSET-FIELDS                       
                           PERFORM 0752-AUTO-WIRE-CREATION              CAT756  
                    WHEN  +100                                                  
                           SET END-OF-ASSET TO TRUE                             
                    WHEN OTHER                                                  
                      DISPLAY 'VASSET_W021_CSR FETCH ERROR ' SQLCODE            
                      PERFORM  8000-SQL-ERROR THRU 8000-EXIT            CAT756  
                      MOVE 0622 TO ABEND-CODE                                   
                      CALL ABEND USING ABEND-CODE                       CAT756  
                END-EVALUATE                                                    
              END-PERFORM                                                       
              EXEC SQL                                                          
                    CLOSE VASSET_W021_CSR                                       
              END-EXEC                                                          
           END-IF.                                                              
                                                                                
       0622-LOOKUP-WACAT022-WIRE-RTN.                                           
      *----------------------------------------------------------------*        
      * ONLY ONE MESSAGE IS CREATED FOR A TIF HAVING FOREIGN CURRENCY           
      * ASSET REGARDLESS OF HOW MANY EXIST.  THE ASSET DETAILS FROM             
      * THE FIRST FOREIGN ASSET READ ARE MOVED TO WIRE MESSAGE FOR              
      * RESEARCH PURPOSES, AS THIS DETAIL IS NOT REQUIRED AT THIS TIME.         
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
                OPEN VASSET_W022_CSR                                            
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              DISPLAY 'VASSET_W022_CSR OPEN ERROR ' SQLCODE                     
           ELSE                                                                 
              MOVE ' '     TO  END-OF-ASSET-SW                                  
                EXEC SQL                                                        
                   FETCH VASSET_W022_CSR                                        
                   INTO                                                         
                   :DCLVASSET.ASSET-SEQ-NBR                                     
                  ,:DCLVASSET.CSH-MGN-SHRT-CD                                   
                  ,:DCLVASSET.STTLM-LCTN-CD                                     
                  ,:DCLVASSET.PSTN-CD                                           
                  ,:DCLVASSET.ASSET-AMT                                         
                  ,:DCLVASSET.ASSET-QTY                                         
                  ,:DCLVASSET.ISIN-SEC-ISSUE-CD                                 
                  ,:DCLVASSET.SECURITY-ADP-NBR                                  
                  ,:DCLVASSET.TRNFR-TYPE-CD                                     
                  ,:DCLVASSET.TRNFR-TYPE-RSN-CD                                 
                  ,:DCLVASSET.ASSET-DESC-TXT                                    
                END-EXEC                                                        
                EVALUATE SQLCODE                                                
                    WHEN +0                                                     
                           MOVE 'WACAT022'  TO ESWWIRE-MSG-SCON         CAT756  
                           MOVE WS-FRGN-CURR-MSG TO ESWWIRE-MSG-SUBJECT CAT756  
                           MOVE SPACES TO WIRE-ACAT-RECORD              CAT756  
                           PERFORM 0700-MOVE-ASSET-FIELDS                       
                           PERFORM 0752-AUTO-WIRE-CREATION              CAT756  
                    WHEN  +100                                                  
                           SET END-OF-ASSET TO TRUE                             
                    WHEN OTHER                                                  
                      DISPLAY 'VASSET_W022_CSR FETCH ERROR ' SQLCODE            
                      PERFORM  8000-SQL-ERROR THRU 8000-EXIT            CAT756  
                      MOVE 0622 TO ABEND-CODE                                   
                      CALL ABEND USING ABEND-CODE                       CAT756  
                END-EVALUATE                                                    
                EXEC SQL                                                        
                    CLOSE VASSET_W022_CSR                                       
                END-EXEC                                                        
           END-IF.                                                              
                                                                                
       0624-LOOKUP-ALL-ASSETS-RTN.                                              
      *----------------------------------------------------------------*        
      * ONLY ONE MESSAGE IS CREATED FOR A TIF HAVING FOREIGN CURRENCY           
      * ASSET REGARDLESS OF HOW MANY EXIST.  THE ASSET DETAILS FROM             
      * THE FIRST FOREIGN ASSET READ ARE MOVED TO WIRE MESSAGE FOR              
      * RESEARCH PURPOSES, AS THIS DETAIL IS NOT REQUIRED AT THIS TIME.         
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
                OPEN VASSET_CSR                                                 
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              DISPLAY 'VASSET_CSR OPEN ERROR ' SQLCODE                          
           ELSE                                                                 
              MOVE ' '     TO  END-OF-ASSET-SW                                  
              PERFORM UNTIL END-OF-ASSET                                        
                EXEC SQL                                                        
                   FETCH VASSET_CSR                                             
                   INTO                                                         
                   :DCLVASSET.ASSET-SEQ-NBR                                     
                  ,:DCLVASSET.CSH-MGN-SHRT-CD                                   
                  ,:DCLVASSET.STTLM-LCTN-CD                                     
                  ,:DCLVASSET.PSTN-CD                                           
                  ,:DCLVASSET.ASSET-AMT                                         
                  ,:DCLVASSET.ASSET-QTY                                         
                  ,:DCLVASSET.ISIN-SEC-ISSUE-CD                                 
                  ,:DCLVASSET.SECURITY-ADP-NBR                                  
                  ,:DCLVASSET.TRNFR-TYPE-CD                                     
                  ,:DCLVASSET.TRNFR-TYPE-RSN-CD                                 
                  ,:DCLVASSET.ASSET-DESC-TXT                                    
                END-EXEC                                                        
                EVALUATE SQLCODE                                                
                    WHEN +0                                                     
                           MOVE SPACES TO WIRE-ACAT-RECORD              CAT756  
                           PERFORM 0700-MOVE-ASSET-FIELDS                       
                           PERFORM 0752-AUTO-WIRE-CREATION              CAT756  
                    WHEN  +100                                                  
                           SET END-OF-ASSET TO TRUE                             
                    WHEN OTHER                                                  
                      DISPLAY 'VASSET_CSR FETCH ERROR ' SQLCODE                 
                      PERFORM  8000-SQL-ERROR THRU 8000-EXIT            CAT756  
                      MOVE 0624 TO ABEND-CODE                                   
                      CALL ABEND USING ABEND-CODE                       CAT756  
                END-EVALUATE                                                    
              END-PERFORM                                                       
              EXEC SQL                                                          
                  CLOSE VASSET_CSR                                              
              END-EXEC                                                          
           END-IF.                                                              
                                                                                
       EJECT                                                                    
       0700-MOVE-ASSET-FIELDS.                                                  
           IF STTLM-DT = '0001-01-01'                                           
              MOVE ' '                   TO WIRE-ACAT-SETTL-DATE                
           ELSE                                                                 
              MOVE STTLM-DT(1 : 4)       TO WIRE-ACAT-SETTL-DATE(1 : 4)         
              MOVE STTLM-DT(6 : 2)       TO WIRE-ACAT-SETTL-DATE(5 : 2)         
              MOVE STTLM-DT(9 : 2)       TO WIRE-ACAT-SETTL-DATE(7 : 2)         
           END-IF.                                                              
                                                                                
           MOVE CSH-MGN-SHRT-CD          OF DCLVASSET                           
                                         TO WIRE-ACAT-CASH-MGN-IND              
           IF  STTLM-LCTN-CD OF DCLVASSET = '40'                                
               MOVE 'C'                  TO WIRE-ACAT-QTY-CASH-IND              
           ELSE                                                                 
               MOVE 'E'                  TO WIRE-ACAT-QTY-CASH-IND              
           END-IF                                                               
           MOVE PSTN-CD                  OF DCLVASSET                           
                                         TO WIRE-ACAT-LONG-SHT-IND              
           MOVE ASSET-AMT                OF DCLVASSET                           
                                         TO WIRE-ACAT-AMOUNT                    
           MOVE ASSET-QTY                OF DCLVASSET                           
                                         TO WIRE-ACAT-QUANTITY                  
           MOVE ISIN-SEC-ISSUE-CD        OF DCLVASSET                           
                                         TO WIRE-ACAT-NSCC-SEC-ID               
           MOVE SECURITY-ADP-NBR         OF DCLVASSET                           
                                         TO WIRE-ACAT-ADP-SEC-NBR               
           IF  TRNFR-TYPE-CD OF DCLVASSET = 'RCL'                               
               MOVE 'Y'                  TO WIRE-ACAT-RCL-REASON-IND            
               EVALUATE TRNFR-TYPE-RSN-CD OF DCLVASSET                          
                   WHEN '60' MOVE 'CLIENT RESCINDED'                            
                                         TO WIRE-ACAT-RCL-REASON                
                   WHEN '61' MOVE 'DUPLICATE DELIVERY'                          
                                         TO WIRE-ACAT-RCL-REASON                
                   WHEN '62' MOVE                                               
                        'DELIVERED ASSET THAT DID NOT BELONG TO CLIENT'         
                                         TO WIRE-ACAT-RCL-REASON                
                   WHEN '63' MOVE 'OVER DELIVERY'                               
                                         TO WIRE-ACAT-RCL-REASON                
                   WHEN '64' MOVE 'FEES WERE NOT WITHHELD'                      
                                         TO WIRE-ACAT-RCL-REASON                
                   WHEN '65' MOVE 'MISCELLANEOUS'                               
                                         TO WIRE-ACAT-RCL-REASON                
               END-EVALUATE                                                     
           ELSE                                                                 
LRM004     IF  TRNFR-TYPE-CD OF DCLVASSET = 'FRV'                               
LRM004         MOVE 'Y'                  TO WIRE-ACAT-FRV-REASON-IND            
LRM004         EVALUATE TRNFR-TYPE-RSN-CD OF DCLVASSET                          
LRM004             WHEN '40' MOVE 'POSITION WAS LIQUIDATED'                     
LRM004                                   TO WIRE-ACAT-FRV-REASON                
LRM004             WHEN '41' MOVE 'POSITION IN REORGANIZATION'                  
LRM004                                   TO WIRE-ACAT-FRV-REASON                
LRM004             WHEN '42' MOVE 'POSITION MATURED OR EXPIRED'                 
LRM004                                   TO WIRE-ACAT-FRV-REASON                
LRM004             WHEN '43' MOVE 'NO BROKER/DEALER AGREEMENT'                  
LRM004                                   TO WIRE-ACAT-FRV-REASON                
LRM004             WHEN '44' MOVE 'FRACTIONAL SHARE QUANTITY'                   
LRM004                                   TO WIRE-ACAT-FRV-REASON                
LRM004             WHEN '45' MOVE 'NON-DELIVERABLE DENOMINATIONS'               
LRM004                                   TO WIRE-ACAT-FRV-REASON                
LRM004             WHEN '46' MOVE 'POSITION IS NON-DELIVERABLE'                 
LRM004                                   TO WIRE-ACAT-FRV-REASON                
LRM004             WHEN '47' MOVE 'MISCELLANEOUS'                               
LRM004                                   TO WIRE-ACAT-FRV-REASON                
LRM004         END-EVALUATE                                                     
LRM004     ELSE                                                                 
               MOVE ' '                  TO WIRE-ACAT-RCL-REASON-IND            
                                            WIRE-ACAT-RCL-REASON                
           END-IF                                                               
           MOVE ASSET-DESC-TXT           OF DCLVASSET                           
                                         TO WIRE-ACAT-SEC-DESC-1.               
                                                                                
       0700-EXIT. EXIT.                                                         
       EJECT                                                                    
       0752-AUTO-WIRE-CREATION.                                         CAT756  
           MOVE BH-BROKER-NUMBER TO ESWWIRE-MSG-CLIENT.                 CAT756  
           MOVE BRANCH-CD    TO ESWWIRE-MSG-RECIPIENT-BR                CAT756  
                                WIRE-ACAT-BRANCH                        CAT756  
      * WAITING ON ORIG RR CODE ON DB2 VTRNFR                           CAT756  
           MOVE RR-ORGNL-CD  TO ESWWIRE-MSG-RECIPIENT-RR                CAT756  
                                WIRE-ACAT-RR                            CAT756  
           MOVE 'ACATS'      TO ESWWIRE-MSG-SENDER                      CAT756  
           MOVE 'CAT756'     TO ESWWIRE-MSG-PGM-SOURCE                  CAT756  
           MOVE PROC-DATE    TO ESWWIRE-MSG-TIMESTAMP(1 : 8).           CAT756  
           MOVE CURRENT-TIME TO ESWWIRE-MSG-TIMESTAMP(9 : 6).           CAT756  
                                                                        CAT756  
           MOVE ACCT-CD TO  WIRE-ACAT-ACCOUNT                           CAT756  
LRM001                          ESWWIRE-MSG-ACCOUNT-NUM                         
           MOVE ACAT-CONTROL-NBR OF DCLVTRNFR TO WIRE-ACAT-CONTROL-NBR  CAT756  
           MOVE BRANCH-ALTNT-CD  TO   WIRE-ACAT-ALT-BRANCH              CAT756  
LRM001                          ESWWIRE-MSG-ALTBR                               
           IF  NOT NNAPPN-SEGMENT-MISSING                               CAT756  
              MOVE NNAPPN-SHORT-NAME-P TO WIRE-ACAT-SHORT-NAME          CAT756  
           ELSE                                                         CAT756  
              MOVE SPACES              TO WIRE-ACAT-SHORT-NAME          CAT756  
           END-IF.                                                      CAT756  
           MOVE RCV-CUST-NM      TO WIRE-ACAT-TITLE                     CAT756  
           IF BRANCH-ALTNT-CD (1 : 1) = '2'                             CAT756  
              MOVE 'DAIN CORRESPONDENT SVCS' TO WIRE-ACAT-CONTACT-NAME  CAT756  
              MOVE '(866) 506-8587'          TO WIRE-ACAT-CONTACT-PHONE CAT756  
           ELSE                                                         CAT756  
              MOVE 'ACCOUNT TRANSFER DEPARTMENT' TO                     CAT756  
                                                WIRE-ACAT-CONTACT-NAME  CAT756  
              MOVE '(612) 607-8229'          TO WIRE-ACAT-CONTACT-PHONE CAT756  
           END-IF.                                                      CAT756  
           MOVE TRNFR-TYPE-CD OF DCLVTRNFR  TO WIRE-ACAT-TRNFR-TYPE     CAT756  
           MOVE STTS-CD          TO WIRE-ACAT-STATUS-CD                 CAT756  
           IF DSTBN-SIDE-CD = 'R'                                       CAT756  
              MOVE DLVR-NBR      TO WIRE-ACAT-CONTRA-BRK-NBR            CAT756  
              MOVE ACCT-DLVR-NBR TO WIRE-ACAT-CONTRA-ACCOUNT            CAT756  
           ELSE                                                         CAT756  
              MOVE RCV-NBR       TO WIRE-ACAT-CONTRA-BRK-NBR            CAT756  
              MOVE ACCT-RCV-NBR  TO WIRE-ACAT-CONTRA-ACCOUNT            CAT756  
           END-IF.                                                      CAT756  
           PERFORM 0754-GET-CONTRA-NAME                                         
                                                                        CAT756  
           MOVE 500              TO ESWWIRE-MSG-LENGTH                  CAT756  
           WRITE AUTOWIRE-REC  FROM ESWWIRE-MSG.                        CAT756  
           ADD 1 TO WS-AUTOWIRE-REC-CNT.                                CAT756  
                                                                        CAT756  
       0754-GET-CONTRA-NAME.                                                    
           EXEC SQL SELECT                                                      
                    PRTCP_NM INTO :PRTCP-NM                                     
               FROM VPRTCPPF                                                    
              WHERE PRTCP_NBR = :WIRE-ACAT-CONTRA-BRK-NBR                       
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = +0                                                      
               MOVE PRTCP-NM  TO WIRE-ACAT-CONTRA-FIRM                          
           END-IF.                                                              
       EJECT                                                            CAT756  
       1900-ENDJOB-ROUTINE.                                             CAT756  
                                                                        CAT756  
           DISPLAY ' '                                                  CAT756  
           DISPLAY 'CAT756: END OF JOB ROUTINE'                         CAT756  
           DISPLAY 'NA FILE FND CNT           ' NA-FILE-FND-CNT.        CAT756  
           DISPLAY 'WIRE DETAIL CNT           ' WS-AUTOWIRE-REC-CNT.    CAT756  
                                                                        CAT756  
           WRITE AUTOWIRE-REC  FROM WS-AUTOWIRE-TRLR.                   CAT756  
           CLOSE AUTOWIRE-FILE.                                         CAT756  
                                                                        CAT756  
       1900-ENDJOB-ROUTINE-EXIT. EXIT.                                  CAT756  
       EJECT                                                            CAT756  
                                                                        CAT756  
       8000-SQL-ERROR.                                                  CAT756  
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                  CAT756  
                                    W-DB2-MESSAGE-LEN.                  CAT756  
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                        CAT756  
             UNTIL W-DB2-IDX GREATER THAN 12                            CAT756  
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES              CAT756  
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)               CAT756  
                   END-IF                                               CAT756  
           END-PERFORM.                                                 CAT756  
                                                                        CAT756  
       8000-EXIT. EXIT.                                                 CAT756  
