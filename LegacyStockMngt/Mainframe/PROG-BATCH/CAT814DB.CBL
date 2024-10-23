000001* PDX    - CAT814DB C0214955 12/28/04 10:23:25 TBEDTAK            00001000
ET0001* SSR 0040633 DB2 INITIAL TABLE KEY CHANGE WITH NEW NAME                  
000001* PDX    - CAT814DB C0194849 08/25/03 10:28:31 TBLAMUR            00001000
000001* PDX    - CAT814DB C0182051 02/12/03 15:47:27 TBLAMUR            00001000
LRM002* SSR 0029711 MARGIN RETOOL CALL GETVBAL                                  
000001* PDX    - CAT814DB C0155513 03/12/01 07:55:36 TBDOJUN            00001000
000001* PDX    - CAT814DB C0127273 08/16/99 11:37:07 TBDOJUN            00001000
       IDENTIFICATION DIVISION.                                         CAT814DB
       PROGRAM-ID.  CAT814DB.                                           CAT814DB
      ***************************************************************** CAT814DB
      * THIS PROGRAM CONTAINS DB2.                                    * CAT814DB
      ***************************************************************** CAT814DB
      * CAT814DB - EXTRACT TRANSFERS FOR CONVENIENCE ACCOUNTS.        * CAT814DB
      *                                                               * CAT814DB
      * SELECT FULL TRANSFER DELIVERY REQUESTS ON ACTIVE DB2 TABLE,   * CAT814DB
      * WITH STATUS = 100(REQUEST) OR 110(REQUEST ADJUST).            * CAT814DB
      * ALSO SELECT TRANSFERS THAT ARE SETTLING TODAY, STATUS = 310.  * CAT814DB
      * SELECT ONLY CLIENTS WHO HAS THE CAMS B1 TURNED ON.            * CAT814DB
      * CHECK B1 TO SEE IF THE CLIENT IS A ACM CLIENT AND             * CAT814DB
      * B1#400316, BH-CAM-BANK,MASTER-FORMAT IS A 1,3, OR 8.          * CAT814DB
      *                                                               * CAT814DB
      * CHECK BANK MASTER TO SEE IF ACCOUNT IS AN ACM ACCOUNT. CHECK  * CAT814DB
      * FOR ANY OUTSTANDING AUTHORIZATION ON ITS DEBIT/CREDIT CARD.   * CAT814DB
      *                                                               * CAT814DB
      * IF THE ACCOUNT HAS OUTSTANDING AUTHORIZATION, THEN THE        * CAT814DB
      * BALANCE FILE WILL HAVE TO BE CHECKED TO SEE IF THERE IS       * CAT814DB
      * ENOUGH MONEY IN TYPE 4 TO COVER THE OUTSTANDING AMOUNT.       * CAT814DB
      *                                                               * CAT814DB
      * IF THERE IS NOT ENOUGH MONEY IN TYPE 4, THEN MONEY WILL HAVE  * CAT814DB
      * TO MOVED FROM THE OTHER TYPES. BOOKKEEPING RECORDS WILL HAVE  * CAT814DB
      * TO BE CREATED TO MOVE THE MONEY AROUND. THE ACATS DATABASE    * CAT814DB
      * WILL HAVE TO BE ADJUSTED ALSO.                                * CAT814DB
      *                                                               * CAT814DB
      * IF THERE IS TOO MUCH MONEY IN TYPE 4, THEN MOVE THE EXCESS    * CAT814DB
      * MONEY INTO TYPE 1.                                            * CAT814DB
      *                                                               * CAT814DB
      *                                                               * CAT814DB
      * INPUT  -                                                      * CAT814DB
      *        - VTRNFR   ACATS ACTIVE TRANFER DB2 TABLE              * CAT814DB
      *        - BNKMASTI ACM BANK MASTER                             * CAT814DB
      *        - BALANCE FILE     - SP.PPP.OMG36.BALNCAL (ALPHABRANCH)* CAT814DB
      * OUTPUT -                                                      * CAT814DB
      *        - ACATBNK EXTRACT FILE TO FEED CAT814                  * CAT814DB
      *                                                               * CAT814DB
      *                                                               * CAT814DB
      ***************************************************************** CAT814DB
      * 07/12/99 DJ    NEW PROGRAM                                    * CAT814DB
      *                                                               * CAT814DB
      ***************************************************************** CAT814DB
      /                                                                 CAT814DB
       ENVIRONMENT DIVISION.                                            CAT814DB
       INPUT-OUTPUT SECTION.                                            CAT814DB
       FILE-CONTROL.                                                    CAT814DB
                                                                        CAT814DB
           SELECT ACATBNK          ASSIGN      TO ACATBNK               CAT814DB
                                   FILE STATUS IS ACATBNK-FILE-STATUS.  CAT814DB
      /                                                                 CAT814DB
       DATA DIVISION.                                                   CAT814DB
       FILE SECTION.                                                    CAT814DB
       FD  ACATBNK                                                      CAT814DB
           RECORDING MODE IS F                                          CAT814DB
           BLOCK CONTAINS 0 RECORDS.                                    CAT814DB
           COPY ACATBNK REPLACING ==:ACATBNK:== BY ==ACATBNK==.         CAT814DB
      /                                                                 CAT814DB
       WORKING-STORAGE SECTION.                                         CAT814DB
           COPY PDXIDCOB.                                               CAT814DB
                                                                        CAT814DB
       01  W-FIELDS.                                                    CAT814DB
           05  W-PGM-NAME                PIC  X(008) VALUE 'CAT814DB'.  CAT814DB
           05  W-ROUTINE-1               PIC  X(032) VALUE ' '.         CAT814DB
           05  ACATBNK-FILE-STATUS       PIC  X(002).                   CAT814DB
               88 ACATBNK-OKAY           VALUE '00' THRU '09', '97'.    CAT814DB
               88 ACATBNK-END-OF-FILE    VALUE '10'.                    CAT814DB
               88 ACATBNK-EMPTY-MISSING VALUE '35'.                     CAT814DB
           05  BALNC-FILE-STATUS         PIC X(002).                    CAT814DB
               88 BALNC-OKAY             VALUE '00' THRU '09', '97'.    CAT814DB
               88 BALNC-END-OF-FILE      VALUE '10'.                    CAT814DB
               88 BALNC-NOT-FOUND        VALUE '23'.                    CAT814DB
               88 BALNC-EMPTY-MISSING    VALUE '35'.                    CAT814DB
           05  ABEND-CD                  PIC  9(009) COMP SYNC VALUE 0. CAT814DB
           05  DUMP-SW                   PIC  X(001) VALUE 'D'.         CAT814DB
           05  W-SYS-DATE                PIC  9(006) VALUE 0.           CAT814DB
           05  FILLER  REDEFINES                                        CAT814DB
               W-SYS-DATE.                                              CAT814DB
               10  W-UPD-DATE            PIC  X(006).                   CAT814DB
           05  W-SYS-TIME                PIC  9(008) VALUE 0.           CAT814DB
           05  FILLER  REDEFINES                                        CAT814DB
               W-SYS-TIME.                                              CAT814DB
               10  W-UPD-TIME            PIC  X(006).                   CAT814DB
               10  W-UPD-TIME-MS         PIC  X(002).                   CAT814DB
           05  LD-PROC-DATE.                                            CAT814DB
               10 LD-PROC-DATE-MM        PIC  X(002).                   CAT814DB
               10 LD-PROC-DATE-DD        PIC  X(002).                   CAT814DB
               10 LD-PROC-DATE-YY        PIC  X(002).                   CAT814DB
                                                                        CAT814DB
           05  W-PROC-DT                 PIC  X(010).                   CAT814DB
           05  FILLER REDEFINES W-PROC-DT.                              CAT814DB
               10 W-PROC-DT-YEAR         PIC  X(004).                   CAT814DB
               10 W-PROC-DT-D1           PIC  X(001).                   CAT814DB
               10 W-PROC-DT-MM           PIC  X(002).                   CAT814DB
               10 W-PROC-DT-D2           PIC  X(001).                   CAT814DB
               10 W-PROC-DT-DD           PIC  X(002).                   CAT814DB
                                                                        CAT814DB
           05  FILLER                    PIC  X(008) VALUE 'INPUTCNT'.  CAT814DB
           05  W-INFILE-CNT              PIC  9(009) VALUE 0.           CAT814DB
           05  FILLER REDEFINES W-INFILE-CNT.                           CAT814DB
               10  W-INFILE-CNT-8            PIC  X(008).               CAT814DB
               10  W-INFILE-CNT-1            PIC  X(001).               CAT814DB
           05  FILLER                    PIC  X(008) VALUE 'OUTPUTCT'.  CAT814DB
           05  W-OUTFILE-CNT             PIC  9(009) VALUE 0.           CAT814DB
           05  FILLER                    PIC  X(008) VALUE 'ACATBNK'.   CAT814DB
           05  W-ACATBNK-CNT             PIC  9(009) VALUE 0.           CAT814DB
           05  FILLER                    PIC  X(008) VALUE 'LOAD-CNT'.  CAT814DB
           05  W-LOAD-CNT                PIC  9(009) VALUE 0.           CAT814DB
           05  W-REQ-DAY-1-CNT           PIC  9(009) VALUE 0.           CAT814DB
           05  W-SETTLE-CLOSE-CNT        PIC  9(009) VALUE 0.           CAT814DB
           05  W-TRANSFER-FND-SW         PIC  X(001) VALUE ' '.         CAT814DB
               88 W-TRANSFER-FOUND                   VALUE 'Y'.         CAT814DB
           05  W-VINITRNF-FND-SW         PIC  X(001) VALUE ' '.         CAT814DB
               88 W-VINITRNF-FOUND                   VALUE 'Y'.         CAT814DB
           05  W-BAL-CNT                 PIC  9(009) VALUE 0.           CAT814DB
           05  BAL-IDX                   PIC  9(4) COMP.                CAT814DB
           05  W-BAL-FND-SW              PIC  X(001) VALUE ' '.         CAT814DB
               88 W-BAL-FOUND                        VALUE 'Y'.         CAT814DB
           05  W-BAL-FND-CNT               PIC  9(09) VALUE 0.          CAT814DB
           05  W-BAL-NOT-FND-CNT           PIC  9(09) VALUE 0.          CAT814DB
      /                                                                 CAT814DB
       01  W-FETCH-AREA.                                                CAT814DB
           05  WF-CLIENT-NBR          PIC X(4).                         CAT814DB
           05  WF-ACAT-CONTROL-NBR    PIC X(14).                        CAT814DB
           05  WF-SBMTG-PRTCP-NBR     PIC X(4).                         CAT814DB
           05  WF-DLVR-NBR            PIC X(4).                         CAT814DB
           05  WF-ACCT-DLVR-NBR       PIC X(20).                        CAT814DB
           05  WF-RCV-NBR             PIC X(4).                         CAT814DB
           05  WF-ACCT-RCV-NBR        PIC X(20).                        CAT814DB
           05  WF-TRNFR-TYPE-CD       PIC X(3).                         CAT814DB
           05  WF-TRANS-TYPE-CD       PIC X(1).                         CAT814DB
           05  WF-PRCS-DT             PIC X(10).                        CAT814DB
           05  WF-STTS-CD             PIC X(3).                         CAT814DB
           05  WF-NSCC-PEND-CD        PIC X(1).                         CAT814DB
           05  WF-TRANS-RFRN-ID-CD    PIC X(20).                        CAT814DB
           05  WF-DSTBN-SIDE-CD       PIC X(1).                         CAT814DB
           05  WF-ACCT-EQUITY-AMT     USAGE COMP-2.                     CAT814DB
                                                                        CAT814DB
       01  WF-AREA.                                                     CAT814DB
           05  W-CURRENT-CLIENT          PIC X(004).                    CAT814DB
           05  W-CURRENT-CLIENT-N REDEFINES                             CAT814DB
               W-CURRENT-CLIENT          PIC 9(004).                    CAT814DB
           05  W-CURRENT-BROKER          PIC X(004).                    CAT814DB
           05  W-CURRENT-STREAM          PIC X(001).                    CAT814DB
                                                                        CAT814DB
       01  W-VINITRNF-SELECT-FIELDS.                                    CAT814DB
           05 W-VINITRNF-ACAT-CONTROL-NO    PIC  X(014).                CAT814DB
           05 W-VINITRNF-NSCC-PEND-CD       PIC  X(001).                CAT814DB
           05 W-VINITRNF-PRCS-DT            PIC  X(010).                CAT814DB
           05 W-VINITRNF-PRGM-NM            PIC  X(008).                CAT814DB
           05 W-VINITRNF-UPDT-TMSTP         PIC  X(026).                CAT814DB
           05 W-VINITRNF-TRNFR-TYPE-RJCT-CD PIC  X(001).                CAT814DB
                                                                        CAT814DB
       01  GETVBAL                          PIC X(08) VALUE 'ZGETVBAL'.         
           COPY GETVBALC REPLACING ==:GETVBAL:== BY ==GETVBAL==.                
           COPY CUSBALRE REPLACING ==:BAL:==     BY ==BAL==.                    
           COPY ACBALALP.                                                       
           COPY BVHEADER.                                                       
           COPY BVTRILER.                                                       
                                                                        CAT814DB
       01  W-WORK-FIELDS.                                               CAT814DB
           05 W-BRN-ACCT.                                               CAT814DB
              10  W-BR.                                                 CAT814DB
                  15  W-BR-X                PIC X(03).                  CAT814DB
              10  W-BR-N REDEFINES W-BR     PIC 9(03).                  CAT814DB
              10  W-ACCT.                                               CAT814DB
                  15  W-ACCT-X              PIC X(05).                  CAT814DB
              10  W-ACCT-N REDEFINES W-ACCT PIC 9(05).                  CAT814DB
           05  W-ACCT-TYPE.                                             CAT814DB
               10  W-FILLER                 PIC X.                      CAT814DB
               10  W-TYPE                   PIC 9.                      CAT814DB
                                                                        CAT814DB
       01  FILLER                        PIC X(008) VALUE 'GETBNKM:'.   CAT814DB
       01  W-GETBNKM-FIELDS.                                            CAT814DB
           05  ACM-ACCT-PROCESS-IND        PIC  X(01) VALUE 'N'.        CAT814DB
               88  ACM-ACCT-PROCESS                   VALUE 'Y'.        CAT814DB
           05  PENDING-AUTH-AMOUNT         PIC S9(15)V99 VALUE +0.      CAT814DB
               88  PENDING-AUTH-ZERO                     VALUE +0.      CAT814DB
           05  W-GETBNKM-CNT               PIC  9(09) VALUE 0.          CAT814DB
           05  W-GETBNKM-FND-CNT           PIC  9(09) VALUE 0.          CAT814DB
           05  W-GETBNKM-NOT-FND-CNT       PIC  9(09) VALUE 0.          CAT814DB
           05  W-VALID-CNT                 PIC  9(09) VALUE 0.          CAT814DB
           05  W-NOT-VALID-CNT             PIC  9(09) VALUE 0.          CAT814DB
           05  W-AMT-NOT-ZERO-CNT          PIC  9(09) VALUE 0.          CAT814DB
           05  W-AMT-IS-ZERO-CNT           PIC  9(09) VALUE 0.          CAT814DB
           05  W-PROCESS-THIS-ACCT-IND     PIC  X(01) VALUE 'N'.        CAT814DB
               88  PROCESS-THIS-ACCT                  VALUE 'Y'.        CAT814DB
           05  W-BNK-CHECKING-STATUS       PIC X.                       CAT814DB
               88 W-BNK-CHK-STATUS-OPEN        VALUE  'O'.              CAT814DB
               88 W-BNK-CHK-STATUS-CLOSED      VALUE  'C'.              CAT814DB
               88 W-BNK-CHK-STATUS-REIN        VALUE  'R'.              CAT814DB
               88 W-BNK-CHK-STATUS-OPEN-REIN   VALUES 'O' 'R'.          CAT814DB
               88 W-BNK-ACAT-IN-PROGRESS       VALUE  'A'.              CAT814DB
           05  W-BNK-DEBIT-CARD-STATUS     PIC X.                       CAT814DB
               88 W-BNK-DBC-STATUS-OPEN        VALUE  'O'.              CAT814DB
               88 W-BNK-DBC-STATUS-CLOSED      VALUE  'C'.              CAT814DB
               88 W-BNK-DBC-STATUS-REIN        VALUE  'R'.              CAT814DB
               88 W-BNK-DBC-STATUS-OPEN-REIN   VALUES 'O' 'R'.          CAT814DB
      /                                                                 CAT814DB
       01  W-BAL-FIELDS.                                                CAT814DB
           05  W-BAL-KEY.                                               CAT814DB
             07  W-BAL-KEY-A.                                           CAT814DB
               10  W-BAL-CLT                PIC 9(05)     COMP-3.       CAT814DB
               10  W-BAL-BR                 PIC X(03).                  CAT814DB
               10  W-BAL-ACCT               PIC X(05).                  CAT814DB
               10  W-BAL-REC-TYPE           PIC X(02).                  CAT814DB
             07  W-BAL-KEY-B.                                           CAT814DB
               10  W-BAL-CUR                PIC X(06).                  CAT814DB
             07  W-BAL-KEY-C                PIC X(01).                  CAT814DB
           05  W-BAL-TYPE1                  PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-BAL-TYPE2                  PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-BAL-TYPE3                  PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-BAL-TYPE4                  PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-BAL-TYPE5                  PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-BAL-TYPE6                  PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-BAL-TYPE7                  PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-BAL-TYPE8                  PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-BAL-TYPE9                  PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-BAL-TYPE1-DISPLAY          PIC 999999999.99-.          CAT814DB
           05  W-BAL-TYPE2-DISPLAY          PIC 999999999.99-.          CAT814DB
           05  W-BAL-TYPE3-DISPLAY          PIC 999999999.99-.          CAT814DB
           05  W-BAL-TYPE4-DISPLAY          PIC 999999999.99-.          CAT814DB
           05  W-BAL-TYPE5-DISPLAY          PIC 999999999.99-.          CAT814DB
           05  W-BAL-TYPE6-DISPLAY          PIC 999999999.99-.          CAT814DB
           05  W-BAL-TYPE7-DISPLAY          PIC 999999999.99-.          CAT814DB
           05  W-BAL-TYPE8-DISPLAY          PIC 999999999.99-.          CAT814DB
           05  W-BAL-TYPE9-DISPLAY          PIC 999999999.99-.          CAT814DB
      /                                                                 CAT814DB
      ******************************************************************CAT814DB
      * W-CALC-FIELDS - THE SIGN IS REVERSE                            *CAT814DB
      ******************************************************************CAT814DB
       01  W-CALC-FIELDS.                                               CAT814DB
           05  W-PEND-AMT                   PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-AMT-TYP1                   PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-AMT-TYP2                   PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-AMT-TYP3                   PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-AMT-TYP4                   PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-AMT-TYP5                   PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-AMT-TYP6                   PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-AMT-TYP7                   PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-AMT-TYP8                   PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-AMT-TYP9                   PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-REMOVE-FROM-TYP1           PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-REMOVE-FROM-TYP2           PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-REMOVE-FROM-TYP3           PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-REMOVE-FROM-TYP4           PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-REMOVE-FROM-TYP5           PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-REMOVE-FROM-TYP6           PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-REMOVE-FROM-TYP7           PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-REMOVE-FROM-TYP8           PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-REMOVE-FROM-TYP9           PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-TYP1-ADD-TO-TYP4           PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-TYP2-ADD-TO-TYP4           PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-TYP3-ADD-TO-TYP4           PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-TYP4-ADD-TO-TYP1           PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-TYP5-ADD-TO-TYP4           PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-TYP6-ADD-TO-TYP4           PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-TYP7-ADD-TO-TYP4           PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-TYP8-ADD-TO-TYP4           PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-TYP9-ADD-TO-TYP4           PIC S9(15)V99 VALUE 0.      CAT814DB
           05  W-TYP1-IND                   PIC  X(01)    VALUE ' '.    CAT814DB
               88  W-TYP1-HAS-ADJUSTMENTS                 VALUE 'Y'.    CAT814DB
           05  W-TYP2-IND                   PIC  X(01)    VALUE ' '.    CAT814DB
               88  W-TYP2-HAS-ADJUSTMENTS                 VALUE 'Y'.    CAT814DB
           05  W-TYP3-IND                   PIC  X(01)    VALUE ' '.    CAT814DB
               88  W-TYP3-HAS-ADJUSTMENTS                 VALUE 'Y'.    CAT814DB
           05  W-TYP4-IND                   PIC  X(01)    VALUE ' '.    CAT814DB
               88  W-TYP4-HAS-ADJUSTMENTS                 VALUE 'Y'.    CAT814DB
           05  W-TYP5-IND                   PIC  X(01)    VALUE ' '.    CAT814DB
               88  W-TYP5-HAS-ADJUSTMENTS                 VALUE 'Y'.    CAT814DB
           05  W-TYP6-IND                   PIC  X(01)    VALUE ' '.    CAT814DB
               88  W-TYP6-HAS-ADJUSTMENTS                 VALUE 'Y'.    CAT814DB
           05  W-TYP7-IND                   PIC  X(01)    VALUE ' '.    CAT814DB
               88  W-TYP7-HAS-ADJUSTMENTS                 VALUE 'Y'.    CAT814DB
           05  W-TYP8-IND                   PIC  X(01)    VALUE ' '.    CAT814DB
               88  W-TYP8-HAS-ADJUSTMENTS                 VALUE 'Y'.    CAT814DB
           05  W-TYP9-IND                   PIC  X(01)    VALUE ' '.    CAT814DB
               88  W-TYP9-HAS-ADJUSTMENTS                 VALUE 'Y'.    CAT814DB
           05  W-AMT-DISPLAY                PIC 999999999.99-.          CAT814DB
           05  W-AMT-DISPLAY-2              PIC 999999999.99-.          CAT814DB
      /                                                                 CAT814DB
       01  FILLER                        PIC X(008) VALUE 'GETBNKMC'.   CAT814DB
           COPY GETBNKMC.                                               CAT814DB
      /                                                                 CAT814DB
       01  FILLER                        PIC X(008) VALUE 'BNKMAST '.   CAT814DB
           COPY BNKMAST.                                                CAT814DB
      /                                                                 CAT814DB
      ******************************************************************CAT814DB
      * P2HDRTRL COMMAREA - USED TO CREATE HEADER AND TRAILER RECORDS  *CAT814DB
      ******************************************************************CAT814DB
       01  FILLER                        PIC X(008) VALUE 'CP2WS   '.   CAT814DB
       01  W-HDR-TRL-LEN                 PIC 9(005) VALUE 120.          CAT814DB
                                                                        CAT814DB
           COPY CP2WS.                                                  CAT814DB
      /                                                                 CAT814DB
       01  FILLER                        PIC X(008) VALUE 'W-TAB   '.   CAT814DB
       01  W-TAB-AREA.                                                  CAT814DB
           05  W-TAB OCCURS 100 TIMES.                                  CAT814DB
               10 W-TAB-STREAM-CD            PIC X(001).                CAT814DB
               10 W-TAB-CLIENT-NBR           PIC X(004).                CAT814DB
               10 W-TAB-BRK-NBR              PIC X(004).                CAT814DB
               10 W-TAB-HDR-SW               PIC X(001).                CAT814DB
               10 W-TAB-HDR-DATE             PIC X(008).                CAT814DB
               10 W-TAB-HDR-CYCLE            PIC X(004).                CAT814DB
               10 W-TAB-TRL-SW               PIC X(001).                CAT814DB
               10 W-TAB-TRL-DATE             PIC X(008).                CAT814DB
               10 W-TAB-TRL-CYCLE            PIC X(004).                CAT814DB
               10 W-TAB-ITEM-CNT             PIC 9(009).                CAT814DB
               10 W-TAB-TOT-CNT              PIC 9(009).                CAT814DB
                                                                        CAT814DB
       01  FILLER                        PIC X(008) VALUE 'B1-TABLE'.   CAT814DB
       01  B1-TABLE-AREA.                                               CAT814DB
           03  B1-TABLE OCCURS 500 TIMES.                               CAT814DB
               05  B1-ADP-CL-NO              PIC 9(04).                 CAT814DB
               05  B1-CLI-NAME               PIC X(30).                 CAT814DB
               05  B1-BKR-CLR-NO             PIC X(04).                 CAT814DB
               05  B1-STREAM                 PIC X(01).                 CAT814DB
               05  B1-STATUS                 PIC X(01).                 CAT814DB
               05  B1-ACAT-STATUS            PIC X(01).                 CAT814DB
               05  B1-ACAT-CONVENIENCE-ACT   PIC X(01).                 CAT814DB
               05  B1-CAM-STATUS             PIC X(01).                 CAT814DB
               05  B1-CAM-BANK-MASTER-FORMAT PIC 9(03) COMP-3.          CAT814DB
       01  B1-WORK-FIELEDS.                                             CAT814DB
           03  B1-TBL-CNT                   PIC 9(03) VALUE 0.          CAT814DB
           03  B1-SUB                       PIC 9(03) VALUE 0.          CAT814DB
           03  B1-STREAM-CNT                PIC 9(03) VALUE 0.          CAT814DB
      /                                                                 CAT814DB
      ******************************************************************CAT814DB
      * B1 HEADER                                                      *CAT814DB
      ******************************************************************CAT814DB
       01  FILLER                        PIC X(08) VALUE 'BHINFO  '.    CAT814DB
           COPY BHINFO.                                                 CAT814DB
      /                                                                 CAT814DB
      ******************************************************************CAT814DB
      * B1 ACAT SECTION                                                *CAT814DB
      ******************************************************************CAT814DB
       01  FILLER                        PIC X(08) VALUE 'BHACAT  '.    CAT814DB
           COPY BHACAT.                                                 CAT814DB
      /                                                                 CAT814DB
      ******************************************************************CAT814DB
      * B1 CAMS SECTION                                                *CAT814DB
      ******************************************************************CAT814DB
        01  FILLER                      PIC X(16) VALUE 'BHCAMS-REC'.   CAT814DB
            COPY BHCAMS.                                                CAT814DB
      /                                                                 CAT814DB
      ******************************************************************CAT814DB
      * BPDATE COMMAREA                                                *CAT814DB
      ******************************************************************CAT814DB
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.   CAT814DB
                                                                        CAT814DB
           COPY BPDATESC.                                               CAT814DB
      /                                                                 CAT814DB
      ******************************************************************CAT814DB
      * TRANSFER ACTIVE TABLE                                          *CAT814DB
      ******************************************************************CAT814DB
       01  FILLER                        PIC X(008) VALUE 'VTRNFR'.     CAT814DB
           EXEC SQL INCLUDE VTRNFR       END-EXEC.                      CAT814DB
                                                                        CAT814DB
      ******************************************************************CAT814DB
      * TRANSFER INIT   TABLE                                          *CAT814DB
      ******************************************************************CAT814DB
ET0001*01  FILLER                        PIC X(008) VALUE 'VINITRNF'.   CAT814DB
ET0001*    EXEC SQL INCLUDE VINITRNF     END-EXEC.                      CAT814DB
ET0001 01  FILLER                        PIC X(008) VALUE 'ACTITRF '.   CAT814DB
ET0001     EXEC SQL INCLUDE ACTITRF      END-EXEC.                      CAT814DB
                                                                        CAT814DB
      ******************************************************************CAT814DB
      * DB2 COMMAREA                                                   *CAT814DB
      ******************************************************************CAT814DB
       01  FILLER                        PIC X(008) VALUE 'SQLCA   '.   CAT814DB
           EXEC SQL INCLUDE SQLCA        END-EXEC.                      CAT814DB
                                                                        CAT814DB
      ******************************************************************CAT814DB
      * DB2 ERROR MESSAGE AREA                                         *CAT814DB
      ******************************************************************CAT814DB
       01  W-DB2-MESSAGE-AREA.                                          CAT814DB
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.    CAT814DB
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES     CAT814DB
                   INDEXED BY W-DB2-IDX.                                CAT814DB
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.     CAT814DB
                                                                        CAT814DB
       01  W-DB2-WORKAREA.                                              CAT814DB
           05  ROLLBACK-SQLCA            PIC  X(122).                   CAT814DB
           05  ROLLBACK-RETURN           PIC S9(009) COMP.              CAT814DB
               88  ROLLBACK-OK                VALUE +0.                 CAT814DB
               88  ROLLBACK-AB                VALUE -999 THRU -1        CAT814DB
                                                    +1   THRU +999.     CAT814DB
           05  COMMIT-SQLCA              PIC  X(122).                   CAT814DB
           05  COMMIT-RETURN             PIC S9(009) COMP.              CAT814DB
               88  COMMIT-OK                  VALUE +0.                 CAT814DB
               88  COMMIT-AB                  VALUE -999 THRU -1        CAT814DB
                                                    +1   THRU +999.     CAT814DB
           05  W-COMMIT-CTR              PIC  9(009) COMP-3             CAT814DB
                                              VALUE 0.                  CAT814DB
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(011) VALUE 0.           CAT814DB
           05  W-DB2-TABLE-NAME          PIC  X(008).                   CAT814DB
           05  W-DB2-ACTION              PIC  X(008).                   CAT814DB
           05  W-DB2-SQLCODE             PIC ---9.                      CAT814DB
           05  W-TFR-SQLCODE             PIC S9(9) COMP-4.              CAT814DB
           05  W-SQLERRD-3                   PIC  S9(9).                CAT814DB
                                                                        CAT814DB
       01  FILLER                        PIC  X(008) VALUE 'TIMESTMP'.  CAT814DB
       01  W-CURRENT-TIMESTAMP           PIC  X(026).                   CAT814DB
      /                                                                 CAT814DB
      ******************************************************************CAT814DB
      * DECLARE CURSOR FOR ACTIVE TRANSFER TABLE                       *CAT814DB
      * TO GET ALL FULL DELIVER TRANSFERS IN REQ OR REQ-ADJ STATUS     *CAT814DB
      ******************************************************************CAT814DB
       01  FILLER                        PIC X(008) VALUE 'CURSOR'.     CAT814DB
           EXEC SQL                                                     CAT814DB
                DECLARE VTRNFR_CURSOR CURSOR WITH HOLD FOR              CAT814DB
                SELECT                                                  CAT814DB
                    CLIENT_NBR                                          CAT814DB
                   ,ACAT_CONTROL_NBR                                    CAT814DB
                   ,SBMTG_PRTCP_NBR                                     CAT814DB
                   ,SBMT_PRT_NR_STS_CD                                  CAT814DB
                   ,CONTROL_NBR_STS_CD                                  CAT814DB
                   ,DLVR_NBR                                            CAT814DB
                   ,DLVR_NBR_STTS_CD                                    CAT814DB
                   ,ACCT_DLVR_NBR                                       CAT814DB
                   ,ACCT_DLVR_STTS_CD                                   CAT814DB
                   ,RCV_NBR                                             CAT814DB
                   ,RCV_NBR_STTS_CD                                     CAT814DB
                   ,ACCT_RCV_NBR                                        CAT814DB
                   ,ACCT_RCV_STTS_CD                                    CAT814DB
                   ,TRNFR_TYPE_CD                                       CAT814DB
                   ,TRNFR_TYPE_STTS_CD                                  CAT814DB
                   ,TRANS_TYPE_CD                                       CAT814DB
                   ,TRANS_TYPE_STTS_CD                                  CAT814DB
                   ,RCV_CUST_NM                                         CAT814DB
                   ,RCV_CUST_NM_STS_CD                                  CAT814DB
                   ,RCV_SS_PRIM_NBR                                     CAT814DB
                   ,RCV_SS_PRIM_STS_CD                                  CAT814DB
                   ,RCV_SS_SCNDY_NBR                                    CAT814DB
                   ,RCV_SS_SCDY_STS_CD                                  CAT814DB
                   ,RCV_ACCT_TYPE_CD                                    CAT814DB
                   ,RCV_ACT_TYP_STS_CD                                  CAT814DB
                   ,RCV_OCC_BRKR_NBR                                    CAT814DB
                   ,RCV_OCC_STTS_CD                                     CAT814DB
                   ,RCV_CRSPN_NBR                                       CAT814DB
                   ,RCV_CRSPN_STTS_CD                                   CAT814DB
                   ,ACAT_CNTL_ASTD_NBR                                  CAT814DB
                   ,CNTL_ASTD_STTS_CD                                   CAT814DB
                   ,CMNT_TXT                                            CAT814DB
                   ,CMNT_STTS_CD                                        CAT814DB
                   ,PRCS_DT                                             CAT814DB
                   ,STTS_CD                                             CAT814DB
                   ,STTLM_TM_CD                                         CAT814DB
                   ,VAL_FREE_CD                                         CAT814DB
                   ,TRANS_RFRN_ID_CD                                    CAT814DB
                   ,TRANS_RFRN_STTS_CD                                  CAT814DB
                   ,DB_CR_CD                                            CAT814DB
                   ,DSTBN_SIDE_CD                                       CAT814DB
                   ,SYS_ACT_CD                                          CAT814DB
                   ,SYS_RJCT_RSN_CD                                     CAT814DB
                   ,TRNFR_TYPE_RJC1_CD                                  CAT814DB
                   ,TRNFR_TYPE_RJC2_CD                                  CAT814DB
                   ,TRNFR_TYPE_RJCT_CD                                  CAT814DB
                   ,TRN_TYP_RJC_STS_CD                                  CAT814DB
                   ,PHSCL_SEQ_NBR                                       CAT814DB
                   ,PHSCL_SEQ_STTS_CD                                   CAT814DB
                   ,LGCL_SEQ_NBR                                        CAT814DB
                   ,LGCL_SEQ_NR_STS_CD                                  CAT814DB
                   ,RR_CD                                               CAT814DB
                   ,BRANCH_CD                                           CAT814DB
                   ,DVDND_NAA_CD                                        CAT814DB
                   ,SELL_INSTN_NAA_CD                                   CAT814DB
                   ,CASH_SWEEP_NAA_CD                                   CAT814DB
                   ,PRTCP_CONTRA_CD                                     CAT814DB
                   ,ACM_HOLDER_NAA_CD                                   CAT814DB
                   ,ACCT_ACTIVITY_IND                                   CAT814DB
                   ,ACCT_ORDERS_IND                                     CAT814DB
                   ,ACCT_RJCT_RSBM_IND                                  CAT814DB
                   ,ACCT_DB_BAL_T1_IND                                  CAT814DB
                   ,ACCT_MRGN_DB_IND                                    CAT814DB
                   ,ACCT_SHRT_PSTN_IND                                  CAT814DB
                   ,ACCT_SEC_RSTRD_IND                                  CAT814DB
                   ,ACCT_AST_EXCS_IND                                   CAT814DB
                   ,ACCT_OPTN_PSTN_IND                                  CAT814DB
                   ,ACCT_LTD_PRTNR_IND                                  CAT814DB
                   ,ACCT_TIN_MSMTH_IND                                  CAT814DB
                   ,ACCT_DPLCT_TRN_IND                                  CAT814DB
                   ,ACCT_CUST_70_IND                                    CAT814DB
                   ,ACCT_QULFD_PLN_IND                                  CAT814DB
                   ,ACCT_MNGD_IND                                       CAT814DB
                   ,ACCT_PRVT_RNG_IND                                   CAT814DB
                   ,ACCT_BRKR_TIF_IND                                   CAT814DB
                   ,NSCC_NON_ADP_IND                                    CAT814DB
                   ,CYCLE_CD                                            CAT814DB
                   ,DAYS_STTS_QTY                                       CAT814DB
                   ,STTLM_DT                                            CAT814DB
                   ,ACCT_NA_UPDT_IND                                    CAT814DB
                   ,ACCT_TRNFR_FEE_AMT                                  CAT814DB
                   ,ACCT_IRA_TRMNT_AMT                                  CAT814DB
                   ,ACCT_IRA_MAINT_AMT                                  CAT814DB
                   ,ACCT_DLRV_PRGR_IND                                  CAT814DB
                   ,ACCT_CD                                             CAT814DB
                   ,STTLM_ASCTD_DT                                      CAT814DB
                   ,STTLM_ASCTD_STS_CD                                  CAT814DB
                   ,RCRD_LNGTH_STTS_CD                                  CAT814DB
                   ,RCRD_STTS_CD                                        CAT814DB
                   ,NSCC_PEND_CD                                        CAT814DB
                   ,NSCC_ACK_IND                                        CAT814DB
                   ,CICS_TERM_ID_CD                                     CAT814DB
                   ,PRGM_NM                                             CAT814DB
                   ,CRT_TMSTP                                           CAT814DB
                   ,UPDT_TMSTP                                          CAT814DB
                   ,ACCT_EQUITY_AMT                                     CAT814DB
                   ,ALERT_IND                                           CAT814DB
                FROM    VTRNFR                                          CAT814DB
                                                                        CAT814DB
                WHERE   CLIENT_NBR    = :W-CURRENT-CLIENT    AND        CAT814DB
                        DLVR_NBR      = :W-CURRENT-BROKER    AND        CAT814DB
                        TRNFR_TYPE_CD = 'FUL'                AND        CAT814DB
                                                                        CAT814DB
                      ((STTS_CD IN ('100', '110')            AND        CAT814DB
                        DAYS_STTS_QTY      =   1             AND        CAT814DB
                        TRANS_TYPE_CD      <> 'R'            AND        CAT814DB
                        ACCT_DPLCT_TRN_IND <> 'Y')                      CAT814DB
                   OR                                                   CAT814DB
                       (STTS_CD IN ('310')                   AND        CAT814DB
                        TRANS_TYPE_CD      <> 'R'            AND        CAT814DB
                        ACCT_DPLCT_TRN_IND <> 'Y'))                     CAT814DB
                                                                        CAT814DB
                ORDER BY                                                CAT814DB
                        CLIENT_NBR       ASC                            CAT814DB
                       ,BRANCH_CD        ASC                            CAT814DB
                       ,ACCT_CD          ASC                            CAT814DB
                       ,ACAT_CONTROL_NBR ASC                            CAT814DB
                                                                        CAT814DB
           END-EXEC.                                                    CAT814DB
************************STTLM_DT           >  :W-PROC-DT     AND        CAT814DB
      /                                                                 CAT814DB
      ***--->COBOL LE                                                   CAT814DB
       01  W-ABEND-AREA.                                                CAT814DB
           03  ABEND-CODE                PIC S9(04) COMP SYNC.          CAT814DB
                                                                        CAT814DB
           COPY STUBCPY.                                                CAT814DB
           03  DSNTIAR                   PIC X(008) VALUE 'DSNTIAR'.    CAT814DB
           03  GETBNKM                   PIC X(008) VALUE 'GETBNKM'.    CAT814DB
      ***<---COBOL LE                                                   CAT814DB
                                                                        CAT814DB
       01  FILLER                        PIC  X(008) VALUE 'END-O-WS'.  CAT814DB
      /                                                                 CAT814DB
      ***************************************************************** CAT814DB
      *    LINKAGE SECTION                                            * CAT814DB
      ***************************************************************** CAT814DB
       LINKAGE SECTION.                                                 CAT814DB
       01  L-JCL-PARMS.                                                 CAT814DB
           05  PARMLENGTH                PIC S9(004) COMP SYNC.         CAT814DB
           05  L-STREAM                  PIC  X(001).                   CAT814DB
               88  L-ALL-STREAM                      VALUE 'Z'.         CAT814DB
           05  L-BYP-DATECHK-SW          PIC  X(001).                   CAT814DB
               88  L-BYP-DATECHK                     VALUE '1'.         CAT814DB
           05  L-BYP-FILECHK-SW          PIC  X(001).                   CAT814DB
               88  L-BYP-FILECHK                     VALUE '1'.         CAT814DB
           05  L-GETBNKM-DATE-CHECK      PIC  X(001).                   CAT814DB
               88 L-GETBNKM-CURRENT-DATE             VALUE  '1'.        CAT814DB
               88 L-GETBNKM-PREVIOUS-DATE            VALUE  '2'.        CAT814DB
               88 L-GETBNKM-DETERMINE-DATE           VALUE  '3'.        CAT814DB
           05  L-TEST                    PIC  X(001).                   CAT814DB
               88  L-TEST-MODE                       VALUE 'Y'.         CAT814DB
                                                                        CAT814DB
       PROCEDURE DIVISION USING L-JCL-PARMS.                            CAT814DB
      *                         ===========                             CAT814DB
       0000-MAIN SECTION.                                               CAT814DB
           DISPLAY 'CAT814DB - CONVENIENCE ACCOUNTS PROCESSING'         CAT814DB
           DISPLAY '         - EXTRACT FULL TRANSFER DELIVERS '         CAT814DB
                              'REQUEST-DAY-1 AND AT SETTLEMENT DATE '   CAT814DB
           DISPLAY '           CHECK BANK MASTER AND BALANCE FILE'      CAT814DB
           DISPLAY '           CLIENT MUST BE A CAMS CLIENT AND '       CAT814DB
                              'CAMS MASTER FORMAT = (1 OR 3 OR 8). '.   CAT814DB
           DISPLAY '           B1# 434586 MUST BE ON'.                  CAT814DB
           DISPLAY '           CREATE ACATBNK FILE TO PASS TO CAT814'.  CAT814DB
           DISPLAY ' '.                                                 CAT814DB
           COPY MSGCOBO.                                                CAT814DB
           DISPLAY ' '.                                                 CAT814DB
                                                                        CAT814DB
           PERFORM 1000-INIT           THRU 1000-EXIT.                  CAT814DB
                                                                        CAT814DB
           PERFORM 2000-PROCESS-INPUT THRU 2000-EXIT                    CAT814DB
                                                                        CAT814DB
           PERFORM 9000-CLOSE-ROUTINE  THRU 9000-EXIT.                  CAT814DB
                                                                        CAT814DB
           GOBACK.                                                      CAT814DB
      /                                                                 CAT814DB
       1000-INIT SECTION.                                               CAT814DB
           MOVE '1000-INIT                     ' TO W-ROUTINE-1.        CAT814DB
                                                                        CAT814DB
           EXEC SQL                                                     CAT814DB
               SET :W-CURRENT-TIMESTAMP = CURRENT TIMESTAMP             CAT814DB
           END-EXEC                                                     CAT814DB
                                                                        CAT814DB
           MOVE SQLCODE      TO W-DB2-SQLCODE                           CAT814DB
           IF  SQLCODE = +0                                             CAT814DB
               DISPLAY ' '                                              CAT814DB
               DISPLAY 'CAT814DB: W-CURRENT-TIMESTAMP = '               CAT814DB
                                                    W-CURRENT-TIMESTAMP CAT814DB
                       '  SQLCODE = ' W-DB2-SQLCODE                     CAT814DB
               DISPLAY ' '                                              CAT814DB
           ELSE                                                         CAT814DB
               DISPLAY 'CAT814DB: W-CURRENT-TIMESTAMP NOT SET'          CAT814DB
               DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                       CAT814DB
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   CAT814DB
           END-IF.                                                      CAT814DB
                                                                        CAT814DB
           ACCEPT W-SYS-DATE              FROM DATE.                    CAT814DB
           ACCEPT W-SYS-TIME              FROM TIME.                    CAT814DB
           DISPLAY 'CAT814DB: SYS-DATE ' W-SYS-DATE                     CAT814DB
                          ' SYS-TIME ' W-SYS-TIME.                      CAT814DB
                                                                        CAT814DB
           DISPLAY 'CAT814DB: L-STREAM             = '                  CAT814DB
                              L-STREAM                                  CAT814DB
           DISPLAY 'CAT814DB: L-BYP-DATECHK-SW     = '                  CAT814DB
                              L-BYP-DATECHK-SW                          CAT814DB
           ' (BYP1=1=BYPASS DATE CHECK)'                                CAT814DB
           DISPLAY 'CAT814DB: L-BYP-FILECHK-SW     = '                  CAT814DB
                              L-BYP-FILECHK-SW                          CAT814DB
           ' (BYP2=1=BYPASS FILE CHECK. BYPASS EMPTY FILE,DB2 ABENDS.)' CAT814DB
           DISPLAY 'CAT814DB: L-GETBNKM-DATE-CHECK = '                  CAT814DB
                              L-GETBNKM-DATE-CHECK                      CAT814DB
           DISPLAY '                                  '                 CAT814DB
                   ' (GETBNKM=1 -GETBNKM-CURRENT-DATE  )'               CAT814DB
           DISPLAY '                                  '                 CAT814DB
                   ' (GETBNKM=2 -GETBNKM-PREVIOUS-DATE )'               CAT814DB
           DISPLAY '                                  '                 CAT814DB
                   ' (GETBNKM=3 -GETBNKM-DETERMINE-DATE- DEFAULT)'      CAT814DB
           DISPLAY 'CAT814DB: L-TEST               = '                  CAT814DB
                              L-TEST                                    CAT814DB
           ' (TEST=Y=TEST MODE - USE TEST DATA)'                        CAT814DB
           IF  L-BYP-DATECHK                                            CAT814DB
               DISPLAY 'CAT814DB: DATE CHECK WILL BE BYPASSED'          CAT814DB
           ELSE                                                         CAT814DB
               DISPLAY 'CAT814DB: DATE CHECK WILL BE PERFORMED'         CAT814DB
           END-IF.                                                      CAT814DB
           IF  L-BYP-FILECHK                                            CAT814DB
               DISPLAY 'CAT814DB: FILE CHECK WILL BE BYPASSED'          CAT814DB
           ELSE                                                         CAT814DB
               DISPLAY 'CAT814DB: FILE CHECK WILL BE PERFORMED'         CAT814DB
           END-IF.                                                      CAT814DB
                                                                        CAT814DB
           MOVE 'CAT814DB'                TO BPDATES-CALLING-PGM.       CAT814DB
           SET  LNKDATZ-REQUEST           TO TRUE.                      CAT814DB
           CALL  BPDATES  USING BPDATES-PARAMETERS.                     CAT814DB
           MOVE BPD-PROC-DATE(3:2)        TO LD-PROC-DATE-YY.           CAT814DB
           MOVE BPD-PROC-DATE(5:2)        TO LD-PROC-DATE-MM.           CAT814DB
           MOVE BPD-PROC-DATE(7:2)        TO LD-PROC-DATE-DD.           CAT814DB
           MOVE BPD-PROC-DATE(1:4)        TO W-PROC-DT-YEAR.            CAT814DB
           MOVE '-'                       TO W-PROC-DT-D1               CAT814DB
           MOVE BPD-PROC-DATE(5:2)        TO W-PROC-DT-MM.              CAT814DB
           MOVE '-'                       TO W-PROC-DT-D2               CAT814DB
           MOVE BPD-PROC-DATE(7:2)        TO W-PROC-DT-DD.              CAT814DB
                                                                        CAT814DB
           DISPLAY ' '.                                                 CAT814DB
           DISPLAY 'CAT814DB:       BPD-PROC-DATE= ' BPD-PROC-DATE      CAT814DB
                                '  LD-PROC-DATE= ' LD-PROC-DATE.        CAT814DB
           DISPLAY 'CAT814DB: BPD-PRIOR-PROC-DATE= ' BPD-PRIOR-PROC-DATECAT814DB
           DISPLAY 'CAT814DB:         W-PROC-DT  = ' W-PROC-DT          CAT814DB
           DISPLAY ' '.                                                 CAT814DB
                                                                        CAT814DB
      *--OPEN THE BANK MASTER FILE                                      CAT814DB
           MOVE  '1'                   TO  GETBNKM-REQUEST.             CAT814DB
           PERFORM 6000-GETBNKM THRU 6000-EXIT.                         CAT814DB
           DISPLAY ' '.                                                 CAT814DB
           DISPLAY 'CAT814DB: BANK MASTER OPENED'                       CAT814DB
                                                                        CAT814DB
      *    OPEN INPUT  BALNC.                                           CAT814DB
           MOVE 'O'    TO GETVBAL-FILE                                          
           MOVE 'O'    TO GETVBAL-FUNC                                          
           PERFORM CALL-GETVBAL                                                 
           DISPLAY 'CAT814DB: BALNC    OPENED FOR INPUT.  STATUS = '    CAT814DB
                                              BALNC-FILE-STATUS         CAT814DB
                                                                        CAT814DB
           IF  BALNC-OKAY                                               CAT814DB
               CONTINUE                                                 CAT814DB
           ELSE                                                         CAT814DB
               DISPLAY 'CAT814DB: ERROR OPENING BALNC'                  CAT814DB
               DISPLAY 'CAT814DB: OPEN STATUS = ' BALNC-FILE-STATUS     CAT814DB
               DISPLAY 'CAT814DB: U3001 - ABENDING ON BAD FILE STATUS'  CAT814DB
               MOVE +3001 TO ABEND-CD                                   CAT814DB
               CALL  ABEND  USING ABEND-CD                              CAT814DB
           END-IF.                                                      CAT814DB
                                                                        CAT814DB
           OPEN OUTPUT ACATBNK.                                         CAT814DB
           DISPLAY 'CAT814DB: ACATBNK  OPENED FOR OUTPUT. STATUS = '    CAT814DB
                                               ACATBNK-FILE-STATUS.     CAT814DB
                                                                        CAT814DB
           IF  ACATBNK-OKAY                                             CAT814DB
               CONTINUE                                                 CAT814DB
           ELSE                                                         CAT814DB
               DISPLAY 'CAT814DB: ERROR OPENING ACATBNK'                CAT814DB
               DISPLAY 'CAT814DB: OPEN STATUS = ' ACATBNK-FILE-STATUS   CAT814DB
                            '.  OUTPUT-CNT = ' W-ACATBNK-CNT            CAT814DB
               DISPLAY 'CAT814DB: U3001 - ABENDING ON BAD FILE STATUS'  CAT814DB
               MOVE +3001 TO ABEND-CD                                   CAT814DB
               CALL  ABEND  USING ABEND-CD                              CAT814DB
           END-IF.                                                      CAT814DB
                                                                        CAT814DB
           MOVE ' '                      TO ACATBNK-HDR-REC             CAT814DB
           MOVE 'H'                      TO CP2-REQUEST-CODE.           CAT814DB
           MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.             CAT814DB
           MOVE 999                      TO CP2-CLIENT-NUMBER.          CAT814DB
                                                                        CAT814DB
           CALL  P2HDTR               USING CP2-AREA                    CAT814DB
                                            ACATBNK.                    CAT814DB
                                                                        CAT814DB
           MOVE CP2-RETURN-RECORD        TO ACATBNK-HDR-REC             CAT814DB
           DISPLAY 'CAT814DB: ACATBNK  HEADER= ' ACATBNK-HDR-REC (1:90) CAT814DB
                                                                        CAT814DB
           WRITE ACATBNK-RECORD.                                        CAT814DB
           ADD 1 TO W-OUTFILE-CNT                                       CAT814DB
           DISPLAY 'CAT814DB: ACATBNK  HEADER WRITTEN.    STATUS = '    CAT814DB
                                               ACATBNK-FILE-STATUS.     CAT814DB
                                                                        CAT814DB
           MOVE '000'                  TO BH-BROKER-NUMBER              CAT814DB
           PERFORM 1500-LOAD-B1          THRU 1500-EXIT.                CAT814DB
                                                                        CAT814DB
           DISPLAY ' '.                                                 CAT814DB
                                                                        CAT814DB
       1000-EXIT. EXIT.                                                 CAT814DB
      /                                                                 CAT814DB
       1500-LOAD-B1 SECTION.                                            CAT814DB
           DISPLAY 'CAT814DB: 1500-LOAD-B1'.                            CAT814DB
                                                                        CAT814DB
           MOVE SPACES                   TO  B1-TABLE-AREA.             CAT814DB
           MOVE 0                        TO  B1-TBL-CNT.                CAT814DB
                                                                        CAT814DB
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500        CAT814DB
                                                                        CAT814DB
             MOVE  ' '                   TO  BH-BROKER-HEADER-INFO      CAT814DB
                                             BH-ACAT-INFO               CAT814DB
             MOVE  B1-SUB                TO  BH-BROKER-NUMBER-N         CAT814DB
             MOVE  '015'                 TO  BH-LOGICAL-RECORD-CODE     CAT814DB
             MOVE  '434500'              TO  BH-B2-INFO-ID              CAT814DB
             CALL   GETB1V             USING BH-BROKER-HEADER-INFO      CAT814DB
                                             BH-ACAT-INFO               CAT814DB
             MOVE  '400000'              TO  BH-B2-INFO-ID-AREA         CAT814DB
             CALL   GETB1V            USING  BH-BROKER-HEADER-INFO      CAT814DB
                                             BH-CAM-INFO                CAT814DB
                                                                        CAT814DB
             IF   BH-BROKER-ACTIVE                                      CAT814DB
             AND  BH-ACAT-ACTIVE                                        CAT814DB
                   ADD 1 TO B1-TBL-CNT                                  CAT814DB
                   MOVE  BH-BROKER-NUMBER-N                             CAT814DB
                                         TO B1-ADP-CL-NO  (B1-TBL-CNT)  CAT814DB
                   MOVE  BH-BROKER-NAME                                 CAT814DB
                                         TO B1-CLI-NAME   (B1-TBL-CNT)  CAT814DB
                   MOVE  BH-BROKER-OLD-CLEARING-HOUSE (2:4)             CAT814DB
                                         TO B1-BKR-CLR-NO (B1-TBL-CNT)  CAT814DB
                   IF  BH-BROKER-MINI-MAXI-SUBGROUP > ' '               CAT814DB
                       MOVE BH-BROKER-MINI-MAXI-SUBGROUP                CAT814DB
                                         TO B1-STREAM     (B1-TBL-CNT)  CAT814DB
                   ELSE                                                 CAT814DB
                       MOVE BH-BROKER-MINI-MAXI-INDICATOR               CAT814DB
                                         TO B1-STREAM     (B1-TBL-CNT)  CAT814DB
                   END-IF                                               CAT814DB
                   MOVE  BH-BROKER-STATUS                               CAT814DB
                                         TO B1-STATUS     (B1-TBL-CNT)  CAT814DB
                   MOVE  BH-ACAT-STATUS                                 CAT814DB
                                         TO B1-ACAT-STATUS(B1-TBL-CNT)  CAT814DB
                   MOVE  BH-ACAT-CONVENIENCE-ACT-CLIENT                 CAT814DB
                              TO B1-ACAT-CONVENIENCE-ACT  (B1-TBL-CNT)  CAT814DB
                   MOVE  BH-CAM-STATUS                                  CAT814DB
                                         TO B1-CAM-STATUS (B1-TBL-CNT)  CAT814DB
                   IF  BH-CAM-BANK-MASTER-FORMAT NUMERIC                CAT814DB
                       MOVE  BH-CAM-BANK-MASTER-FORMAT                  CAT814DB
                              TO B1-CAM-BANK-MASTER-FORMAT(B1-TBL-CNT)  CAT814DB
                   ELSE                                                 CAT814DB
                       MOVE 0 TO B1-CAM-BANK-MASTER-FORMAT(B1-TBL-CNT)  CAT814DB
                   END-IF                                               CAT814DB
                   IF  B1-STREAM (B1-TBL-CNT) = L-STREAM                CAT814DB
                       DISPLAY     'CNT=' B1-TBL-CNT                    CAT814DB
                                    ' CLT ' B1-ADP-CL-NO  (B1-TBL-CNT)  CAT814DB
                                        ' ' B1-CLI-NAME   (B1-TBL-CNT)  CAT814DB
                                    ' BKR ' B1-BKR-CLR-NO (B1-TBL-CNT)  CAT814DB
                                    ' STR ' B1-STREAM     (B1-TBL-CNT)  CAT814DB
                                    ' STA ' B1-STATUS     (B1-TBL-CNT)  CAT814DB
                                   ' ACAT ' B1-ACAT-STATUS(B1-TBL-CNT)  CAT814DB
                           ' CNV ' B1-ACAT-CONVENIENCE-ACT(B1-TBL-CNT)  CAT814DB
                                   ' CAMS ' B1-CAM-STATUS (B1-TBL-CNT)  CAT814DB
                         ' FMT ' B1-CAM-BANK-MASTER-FORMAT(B1-TBL-CNT)  CAT814DB
                       ADD 1 TO B1-STREAM-CNT                           CAT814DB
                   END-IF                                               CAT814DB
             END-IF                                                     CAT814DB
                                                                        CAT814DB
           END-PERFORM.                                                 CAT814DB
                                                                        CAT814DB
           DISPLAY ' '.                                                 CAT814DB
                                                                        CAT814DB
           DISPLAY  'B1-STREAM-CNT  = ' B1-STREAM-CNT                   CAT814DB
                    ' # OF CLIENTS FOR THIS STREAM'                     CAT814DB
           DISPLAY  'B1 TABLE COUNT = ' B1-TBL-CNT                      CAT814DB
                    ' # OF ADP CLIENTS THAT ARE ACATS CLIENTS'.         CAT814DB
           DISPLAY ' '.                                                 CAT814DB
       1500-EXIT. EXIT.                                                 CAT814DB
      /                                                                 CAT814DB
      ******************************************************************CAT814DB
      *  GET CLIENT FOR THIS STREAM, AND FETCH TRANSFERS                CAT814DB
      ******************************************************************CAT814DB
       2000-PROCESS-INPUT SECTION.                                      CAT814DB
           MOVE '2000-PROCESS-INPUT         ' TO W-ROUTINE-1.           CAT814DB
                                                                        CAT814DB
           PERFORM VARYING B1-SUB FROM 1 BY 1                           CAT814DB
             UNTIL B1-SUB > 500                                         CAT814DB
                                                                        CAT814DB
             IF  B1-STREAM      (B1-SUB) = L-STREAM                     CAT814DB
             AND B1-STATUS      (B1-SUB) = 'A'                          CAT814DB
             AND B1-ACAT-STATUS (B1-SUB) = 'A'                          CAT814DB
             AND B1-BKR-CLR-NO  (B1-SUB) > ' '                          CAT814DB
                 MOVE B1-ADP-CL-NO  (B1-SUB) TO W-CURRENT-CLIENT-N      CAT814DB
                 MOVE B1-BKR-CLR-NO (B1-SUB) TO W-CURRENT-BROKER        CAT814DB
                 MOVE B1-STREAM     (B1-SUB) TO W-CURRENT-STREAM        CAT814DB
                 PERFORM 2500-GETB1         THRU 2500-EXIT              CAT814DB
                 IF  B1-ACAT-CONVENIENCE-ACT(B1-SUB) = '1'              CAT814DB
                 AND B1-CAM-STATUS  (B1-SUB) = 'A'                      CAT814DB
                 AND (B1-CAM-BANK-MASTER-FORMAT(B1-SUB) = 1 OR 3 OR 8)  CAT814DB
                     DISPLAY 'B1 IS ON. PROCESS THIS CLIENT'            CAT814DB
                     PERFORM 3000-FETCH-TRANFER THRU 3000-EXIT          CAT814DB
                 ELSE                                                   CAT814DB
                     DISPLAY 'B1 NOT ON. BYPASS THIS CLIENT'            CAT814DB
                 END-IF                                                 CAT814DB
             END-IF                                                     CAT814DB
                                                                        CAT814DB
           END-PERFORM.                                                 CAT814DB
                                                                        CAT814DB
       2000-EXIT. EXIT.                                                 CAT814DB
      /                                                                 CAT814DB
       2500-GETB1          SECTION.                                     CAT814DB
                                                                        CAT814DB
           DISPLAY ' '                                                  CAT814DB
           DISPLAY 'NEW-CLIENT = ' B1-ADP-CL-NO  (B1-SUB)               CAT814DB
                               ' ' B1-CLI-NAME   (B1-SUB)               CAT814DB
                       ' BRK-NO= ' B1-BKR-CLR-NO (B1-SUB)               CAT814DB
           DISPLAY 'CAT814DB: BH-ACAT-STATUS                (434501) = 'CAT814DB
                              B1-ACAT-STATUS(B1-SUB)                    CAT814DB
           DISPLAY 'CAT814DB: BH-ACAT-CONVENIENCE-ACT-CLIENT(434586) = 'CAT814DB
                              B1-ACAT-CONVENIENCE-ACT(B1-SUB)           CAT814DB
           DISPLAY 'CAT814DB: BH-CAM-STATUS                 (400011) = 'CAT814DB
                              B1-CAM-STATUS (B1-SUB)                    CAT814DB
                                                                        CAT814DB
           IF  B1-CAM-BANK-MASTER-FORMAT(B1-SUB) = 001                  CAT814DB
           DISPLAY 'CAT814DB: BH-CAM-BANK-MASTER-FORMAT     (400316) = 'CAT814DB
                              B1-CAM-BANK-MASTER-FORMAT(B1-SUB)         CAT814DB
                            ' PNC-BANK-FORMAT'                          CAT814DB
           ELSE                                                         CAT814DB
           IF  B1-CAM-BANK-MASTER-FORMAT(B1-SUB) = 003                  CAT814DB
           DISPLAY 'CAT814DB: BH-CAM-BANK-MASTER-FORMAT     (400316) = 'CAT814DB
                              B1-CAM-BANK-MASTER-FORMAT(B1-SUB)         CAT814DB
                            ' REICH-AND-TANG'                           CAT814DB
           ELSE                                                         CAT814DB
           IF  B1-CAM-BANK-MASTER-FORMAT(B1-SUB) = 004                  CAT814DB
           DISPLAY 'CAT814DB: BH-CAM-BANK-MASTER-FORMAT     (400316) = 'CAT814DB
                              B1-CAM-BANK-MASTER-FORMAT(B1-SUB)         CAT814DB
                            ' BANK-ONE-FORMAT'                          CAT814DB
           ELSE                                                         CAT814DB
           IF  B1-CAM-BANK-MASTER-FORMAT(B1-SUB) = 005                  CAT814DB
           DISPLAY 'CAT814DB: BH-CAM-BANK-MASTER-FORMAT     (400316) = 'CAT814DB
                              B1-CAM-BANK-MASTER-FORMAT(B1-SUB)         CAT814DB
                            ' CIBC-FORMAT'                              CAT814DB
           ELSE                                                         CAT814DB
           IF  B1-CAM-BANK-MASTER-FORMAT(B1-SUB) = 006                  CAT814DB
           DISPLAY 'CAT814DB: BH-CAM-BANK-MASTER-FORMAT     (400316) = 'CAT814DB
                              B1-CAM-BANK-MASTER-FORMAT(B1-SUB)         CAT814DB
                            ' ALLIANCE-FORMAT'                          CAT814DB
           ELSE                                                         CAT814DB
           IF  B1-CAM-BANK-MASTER-FORMAT(B1-SUB) = 007                  CAT814DB
           DISPLAY 'CAT814DB: BH-CAM-BANK-MASTER-FORMAT     (400316) = 'CAT814DB
                              B1-CAM-BANK-MASTER-FORMAT(B1-SUB)         CAT814DB
                            ' TBC-FORMAT'                               CAT814DB
           ELSE                                                         CAT814DB
           IF  B1-CAM-BANK-MASTER-FORMAT(B1-SUB) = 008                  CAT814DB
           DISPLAY 'CAT814DB: BH-CAM-BANK-MASTER-FORMAT     (400316) = 'CAT814DB
                              B1-CAM-BANK-MASTER-FORMAT(B1-SUB)         CAT814DB
                            ' WNB-FORMAT'                               CAT814DB
           ELSE                                                         CAT814DB
           DISPLAY 'CAT814DB: BH-CAM-BANK-MASTER-FORMAT     (400316) = 'CAT814DB
                              B1-CAM-BANK-MASTER-FORMAT(B1-SUB)         CAT814DB
           END-IF.                                                      CAT814DB
                                                                        CAT814DB
       2500-EXIT. EXIT.                                                 CAT814DB
      /                                                                 CAT814DB
      ******************************************************************CAT814DB
      *  IF FULL TRANSFER REQUEST, AND WE ARE THE DELIVERER,            CAT814DB
      *     LOAD ASSETS                                                 CAT814DB
      ******************************************************************CAT814DB
       3000-FETCH-TRANFER SECTION.                                      CAT814DB
           MOVE '3000-FETCH-TRANSFER        ' TO W-ROUTINE-1.           CAT814DB
                                                                        CAT814DB
           DISPLAY 'CAT814DB: OPEN  CURSOR FOR'                         CAT814DB
                          ' W-CURRENT-CLIENT=' W-CURRENT-CLIENT.        CAT814DB
                                                                        CAT814DB
           EXEC SQL OPEN VTRNFR_CURSOR END-EXEC                         CAT814DB
                                                                        CAT814DB
           MOVE SQLCODE      TO W-DB2-SQLCODE                           CAT814DB
           MOVE SQLCODE      TO W-TFR-SQLCODE                           CAT814DB
           IF SQLCODE NOT = +0                                          CAT814DB
              DISPLAY 'VTRNFR CURSOR OPEN ERROR '                       CAT814DB
                            'SQLCODE = ' W-DB2-SQLCODE                  CAT814DB
           END-IF                                                       CAT814DB
                                                                        CAT814DB
           PERFORM UNTIL W-TFR-SQLCODE NOT = +0                         CAT814DB
                                                                        CAT814DB
              ADD 1 TO W-INFILE-CNT                                     CAT814DB
                                                                        CAT814DB
              EXEC SQL                                                  CAT814DB
                   FETCH VTRNFR_CURSOR                                  CAT814DB
               INTO                                                     CAT814DB
                    :DCLVTRNFR.CLIENT-NBR                               CAT814DB
                   ,:DCLVTRNFR.ACAT-CONTROL-NBR                         CAT814DB
                   ,:DCLVTRNFR.SBMTG-PRTCP-NBR                          CAT814DB
                   ,:DCLVTRNFR.SBMT-PRT-NR-STS-CD                       CAT814DB
                   ,:DCLVTRNFR.CONTROL-NBR-STS-CD                       CAT814DB
                   ,:DCLVTRNFR.DLVR-NBR                                 CAT814DB
                   ,:DCLVTRNFR.DLVR-NBR-STTS-CD                         CAT814DB
                   ,:DCLVTRNFR.ACCT-DLVR-NBR                            CAT814DB
                   ,:DCLVTRNFR.ACCT-DLVR-STTS-CD                        CAT814DB
                   ,:DCLVTRNFR.RCV-NBR                                  CAT814DB
                   ,:DCLVTRNFR.RCV-NBR-STTS-CD                          CAT814DB
                   ,:DCLVTRNFR.ACCT-RCV-NBR                             CAT814DB
                   ,:DCLVTRNFR.ACCT-RCV-STTS-CD                         CAT814DB
                   ,:DCLVTRNFR.TRNFR-TYPE-CD                            CAT814DB
                   ,:DCLVTRNFR.TRNFR-TYPE-STTS-CD                       CAT814DB
                   ,:DCLVTRNFR.TRANS-TYPE-CD                            CAT814DB
                   ,:DCLVTRNFR.TRANS-TYPE-STTS-CD                       CAT814DB
                   ,:DCLVTRNFR.RCV-CUST-NM                              CAT814DB
                   ,:DCLVTRNFR.RCV-CUST-NM-STS-CD                       CAT814DB
                   ,:DCLVTRNFR.RCV-SS-PRIM-NBR                          CAT814DB
                   ,:DCLVTRNFR.RCV-SS-PRIM-STS-CD                       CAT814DB
                   ,:DCLVTRNFR.RCV-SS-SCNDY-NBR                         CAT814DB
                   ,:DCLVTRNFR.RCV-SS-SCDY-STS-CD                       CAT814DB
                   ,:DCLVTRNFR.RCV-ACCT-TYPE-CD                         CAT814DB
                   ,:DCLVTRNFR.RCV-ACT-TYP-STS-CD                       CAT814DB
                   ,:DCLVTRNFR.RCV-OCC-BRKR-NBR                         CAT814DB
                   ,:DCLVTRNFR.RCV-OCC-STTS-CD                          CAT814DB
                   ,:DCLVTRNFR.RCV-CRSPN-NBR                            CAT814DB
                   ,:DCLVTRNFR.RCV-CRSPN-STTS-CD                        CAT814DB
                   ,:DCLVTRNFR.ACAT-CNTL-ASTD-NBR                       CAT814DB
                   ,:DCLVTRNFR.CNTL-ASTD-STTS-CD                        CAT814DB
                   ,:DCLVTRNFR.CMNT-TXT                                 CAT814DB
                   ,:DCLVTRNFR.CMNT-STTS-CD                             CAT814DB
                   ,:DCLVTRNFR.PRCS-DT                                  CAT814DB
                   ,:DCLVTRNFR.STTS-CD                                  CAT814DB
                   ,:DCLVTRNFR.STTLM-TM-CD                              CAT814DB
                   ,:DCLVTRNFR.VAL-FREE-CD                              CAT814DB
                   ,:DCLVTRNFR.TRANS-RFRN-ID-CD                         CAT814DB
                   ,:DCLVTRNFR.TRANS-RFRN-STTS-CD                       CAT814DB
                   ,:DCLVTRNFR.DB-CR-CD                                 CAT814DB
                   ,:DCLVTRNFR.DSTBN-SIDE-CD                            CAT814DB
                   ,:DCLVTRNFR.SYS-ACT-CD                               CAT814DB
                   ,:DCLVTRNFR.SYS-RJCT-RSN-CD                          CAT814DB
                   ,:DCLVTRNFR.TRNFR-TYPE-RJC1-CD                       CAT814DB
                   ,:DCLVTRNFR.TRNFR-TYPE-RJC2-CD                       CAT814DB
                   ,:DCLVTRNFR.TRNFR-TYPE-RJCT-CD                       CAT814DB
                   ,:DCLVTRNFR.TRN-TYP-RJC-STS-CD                       CAT814DB
                   ,:DCLVTRNFR.PHSCL-SEQ-NBR                            CAT814DB
                   ,:DCLVTRNFR.PHSCL-SEQ-STTS-CD                        CAT814DB
                   ,:DCLVTRNFR.LGCL-SEQ-NBR                             CAT814DB
                   ,:DCLVTRNFR.LGCL-SEQ-NR-STS-CD                       CAT814DB
                   ,:DCLVTRNFR.RR-CD                                    CAT814DB
                   ,:DCLVTRNFR.BRANCH-CD                                CAT814DB
                   ,:DCLVTRNFR.DVDND-NAA-CD                             CAT814DB
                   ,:DCLVTRNFR.SELL-INSTN-NAA-CD                        CAT814DB
                   ,:DCLVTRNFR.CASH-SWEEP-NAA-CD                        CAT814DB
                   ,:DCLVTRNFR.PRTCP-CONTRA-CD                          CAT814DB
                   ,:DCLVTRNFR.ACM-HOLDER-NAA-CD                        CAT814DB
                   ,:DCLVTRNFR.ACCT-ACTIVITY-IND                        CAT814DB
                   ,:DCLVTRNFR.ACCT-ORDERS-IND                          CAT814DB
                   ,:DCLVTRNFR.ACCT-RJCT-RSBM-IND                       CAT814DB
                   ,:DCLVTRNFR.ACCT-DB-BAL-T1-IND                       CAT814DB
                   ,:DCLVTRNFR.ACCT-MRGN-DB-IND                         CAT814DB
                   ,:DCLVTRNFR.ACCT-SHRT-PSTN-IND                       CAT814DB
                   ,:DCLVTRNFR.ACCT-SEC-RSTRD-IND                       CAT814DB
                   ,:DCLVTRNFR.ACCT-AST-EXCS-IND                        CAT814DB
                   ,:DCLVTRNFR.ACCT-OPTN-PSTN-IND                       CAT814DB
                   ,:DCLVTRNFR.ACCT-LTD-PRTNR-IND                       CAT814DB
                   ,:DCLVTRNFR.ACCT-TIN-MSMTH-IND                       CAT814DB
                   ,:DCLVTRNFR.ACCT-DPLCT-TRN-IND                       CAT814DB
                   ,:DCLVTRNFR.ACCT-CUST-70-IND                         CAT814DB
                   ,:DCLVTRNFR.ACCT-QULFD-PLN-IND                       CAT814DB
                   ,:DCLVTRNFR.ACCT-MNGD-IND                            CAT814DB
                   ,:DCLVTRNFR.ACCT-PRVT-RNG-IND                        CAT814DB
                   ,:DCLVTRNFR.ACCT-BRKR-TIF-IND                        CAT814DB
                   ,:DCLVTRNFR.NSCC-NON-ADP-IND                         CAT814DB
                   ,:DCLVTRNFR.CYCLE-CD                                 CAT814DB
                   ,:DCLVTRNFR.DAYS-STTS-QTY                            CAT814DB
                   ,:DCLVTRNFR.STTLM-DT                                 CAT814DB
                   ,:DCLVTRNFR.ACCT-NA-UPDT-IND                         CAT814DB
                   ,:DCLVTRNFR.ACCT-TRNFR-FEE-AMT                       CAT814DB
                   ,:DCLVTRNFR.ACCT-IRA-TRMNT-AMT                       CAT814DB
                   ,:DCLVTRNFR.ACCT-IRA-MAINT-AMT                       CAT814DB
                   ,:DCLVTRNFR.ACCT-DLRV-PRGR-IND                       CAT814DB
                   ,:DCLVTRNFR.ACCT-CD                                  CAT814DB
                   ,:DCLVTRNFR.STTLM-ASCTD-DT                           CAT814DB
                   ,:DCLVTRNFR.STTLM-ASCTD-STS-CD                       CAT814DB
                   ,:DCLVTRNFR.RCRD-LNGTH-STTS-CD                       CAT814DB
                   ,:DCLVTRNFR.RCRD-STTS-CD                             CAT814DB
                   ,:DCLVTRNFR.NSCC-PEND-CD                             CAT814DB
                   ,:DCLVTRNFR.NSCC-ACK-IND                             CAT814DB
                   ,:DCLVTRNFR.CICS-TERM-ID-CD                          CAT814DB
                   ,:DCLVTRNFR.PRGM-NM                                  CAT814DB
                   ,:DCLVTRNFR.CRT-TMSTP                                CAT814DB
                   ,:DCLVTRNFR.UPDT-TMSTP                               CAT814DB
                   ,:DCLVTRNFR.ACCT-EQUITY-AMT                          CAT814DB
                   ,:DCLVTRNFR.ALERT-IND                                CAT814DB
              END-EXEC                                                  CAT814DB
                                                                        CAT814DB
              MOVE SQLCODE      TO W-DB2-SQLCODE                        CAT814DB
              MOVE SQLCODE      TO W-TFR-SQLCODE                        CAT814DB
              EVALUATE SQLCODE                                          CAT814DB
                  WHEN +0                                               CAT814DB
                       PERFORM 4000-LOAD     THRU 4000-EXIT             CAT814DB
                  WHEN +100                                             CAT814DB
                       DISPLAY 'INP=' W-INFILE-CNT                      CAT814DB
                              ' VTRNFR CURSOR FETCH NOT FOUND '         CAT814DB
                              ' SQLCODE = ' W-DB2-SQLCODE               CAT814DB
                  WHEN OTHER                                            CAT814DB
                       DISPLAY 'INP=' W-INFILE-CNT                      CAT814DB
                              ' VTRNFR CURSOR FETCH ERROR '             CAT814DB
                              ' SQLCODE = ' W-DB2-SQLCODE               CAT814DB
                       PERFORM  8500-SQL-ERROR THRU 8500-EXIT           CAT814DB
              END-EVALUATE                                              CAT814DB
                                                                        CAT814DB
           END-PERFORM                                                  CAT814DB
                                                                        CAT814DB
           EXEC SQL                                                     CAT814DB
                CLOSE VTRNFR_CURSOR                                     CAT814DB
           END-EXEC                                                     CAT814DB
                                                                        CAT814DB
           MOVE SQLCODE      TO W-DB2-SQLCODE                           CAT814DB
           MOVE SQLCODE      TO W-TFR-SQLCODE                           CAT814DB
           IF  SQLCODE NOT = +0                                         CAT814DB
               DISPLAY 'INP= ' W-INFILE-CNT                             CAT814DB
                      ' VTRNFR CURSOR CLOSE ERROR '                     CAT814DB
                      ' SQLCODE = ' W-DB2-SQLCODE                       CAT814DB
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   CAT814DB
           END-IF.                                                      CAT814DB
           DISPLAY 'CAT814DB: CLOSE CURSOR FOR'                         CAT814DB
                          ' W-CURRENT-CLIENT=' W-CURRENT-CLIENT.        CAT814DB
                                                                        CAT814DB
       3000-EXIT. EXIT.                                                 CAT814DB
      /                                                                 CAT814DB
      ******************************************************************CAT814DB
      *  FOR FULL TRANSFER REQUEST TO DELIVER                           CAT814DB
      *  GET BALANCES AND POSITIONS AND LOAD TO THE INIT ASSET TABLES   CAT814DB
      *  FLAG ANY ERROR AND UPDATE THE TRANFER TABLE                    CAT814DB
      *  IF AUTO-REJECT, UPDATE/ADD TO THE INIT TRANSFER TABLE          CAT814DB
      ******************************************************************CAT814DB
       4000-LOAD                SECTION.                                CAT814DB
           MOVE '4000-LOAD            ' TO W-ROUTINE-1.                 CAT814DB
                                                                        CAT814DB
           IF  PRCS-DT OF DCLVTRNFR > W-PROC-DT                         CAT814DB
               GO TO 4000-EXIT                                          CAT814DB
           END-IF                                                       CAT814DB
                                                                        CAT814DB
           MOVE SPACES               TO ACATBNK-RECORD                  CAT814DB
           INITIALIZE                   ACATBNK-BALANCE-DATA            CAT814DB
                                                                        CAT814DB
           MOVE CLIENT-NBR        OF DCLVTRNFR                          CAT814DB
                                             TO  WF-CLIENT-NBR          CAT814DB
           MOVE ACAT-CONTROL-NBR  OF DCLVTRNFR                          CAT814DB
                                             TO  WF-ACAT-CONTROL-NBR    CAT814DB
           MOVE SBMTG-PRTCP-NBR   OF DCLVTRNFR                          CAT814DB
                                             TO  WF-SBMTG-PRTCP-NBR     CAT814DB
           MOVE DLVR-NBR          OF DCLVTRNFR                          CAT814DB
                                             TO  WF-DLVR-NBR            CAT814DB
           MOVE ACCT-DLVR-NBR     OF DCLVTRNFR                          CAT814DB
                                             TO  WF-ACCT-DLVR-NBR       CAT814DB
           MOVE RCV-NBR           OF DCLVTRNFR                          CAT814DB
                                             TO  WF-RCV-NBR             CAT814DB
           MOVE ACCT-RCV-NBR      OF DCLVTRNFR                          CAT814DB
                                             TO  WF-ACCT-RCV-NBR        CAT814DB
           MOVE TRNFR-TYPE-CD     OF DCLVTRNFR                          CAT814DB
                                             TO  WF-TRNFR-TYPE-CD       CAT814DB
           MOVE TRANS-TYPE-CD     OF DCLVTRNFR                          CAT814DB
                                             TO  WF-TRANS-TYPE-CD       CAT814DB
           MOVE PRCS-DT           OF DCLVTRNFR                          CAT814DB
                                             TO  WF-PRCS-DT             CAT814DB
           MOVE STTS-CD           OF DCLVTRNFR                          CAT814DB
                                             TO  WF-STTS-CD             CAT814DB
           MOVE NSCC-PEND-CD      OF DCLVTRNFR                          CAT814DB
                                             TO  WF-NSCC-PEND-CD        CAT814DB
                                                                        CAT814DB
           MOVE TRANS-RFRN-ID-CD  OF DCLVTRNFR                          CAT814DB
                                             TO  WF-TRANS-RFRN-ID-CD    CAT814DB
                                                                        CAT814DB
           MOVE DSTBN-SIDE-CD     OF DCLVTRNFR                          CAT814DB
                                             TO  WF-DSTBN-SIDE-CD       CAT814DB
           MOVE ACCT-EQUITY-AMT   OF DCLVTRNFR                          CAT814DB
                                             TO  WF-ACCT-EQUITY-AMT     CAT814DB
           MOVE BRANCH-CD          OF DCLVTRNFR                         CAT814DB
                                             TO  W-BR-X                 CAT814DB
           MOVE ACCT-CD            OF DCLVTRNFR                         CAT814DB
                                             TO  W-ACCT-X               CAT814DB
                                                                        CAT814DB
           IF  WF-CLIENT-NBR (2:3) = GETBNKM-CLIENT-X AND               CAT814DB
               W-BR-X              = GETBNKM-BRANCH   AND               CAT814DB
               W-ACCT-X            = GETBNKM-ACCT                       CAT814DB
               DISPLAY 'INP=' W-INFILE-CNT                              CAT814DB
                          ' ' WF-CLIENT-NBR                             CAT814DB
                          ' ' WF-ACAT-CONTROL-NBR                       CAT814DB
                          ' ' W-BR-X ' ' W-ACCT-X                       CAT814DB
                      ' STA=' WF-STTS-CD                                CAT814DB
                      ' DAY=' DAYS-STTS-QTY OF DCLVTRNFR                CAT814DB
                      ' SD='  STTLM-DT      OF DCLVTRNFR                CAT814DB
               DISPLAY '    '                                           CAT814DB
                       '          '                                     CAT814DB
                       'DUPLICATE KEY. BYPASS.'                         CAT814DB
               GO TO 4000-EXIT                                          CAT814DB
           END-IF.                                                      CAT814DB
                                                                        CAT814DB
      ***BYPASS REJECTED  TRANSFERS                                     CAT814DB
           PERFORM 5000-SELECT-VINITRNF THRU 5000-EXIT                  CAT814DB
           IF  W-VINITRNF-FND-SW = 'Y'                                  CAT814DB
               DISPLAY 'INP=' W-INFILE-CNT                              CAT814DB
                      ' ' WF-CLIENT-NBR                                 CAT814DB
                      ' ' WF-ACAT-CONTROL-NBR                           CAT814DB
                      ' ' W-BR-X ' ' W-ACCT-X                           CAT814DB
                      ' STA=' WF-STTS-CD                                CAT814DB
                      ' DAY=' DAYS-STTS-QTY OF DCLVTRNFR                CAT814DB
                      ' SD='  STTLM-DT      OF DCLVTRNFR                CAT814DB
ET0001**       DISPLAY '   VINITRNF FOUND '                             CAT814DB
ET0001         DISPLAY '   ACTITRF FOUND  '                             CAT814DB
ET0001                 ' RJCT=' TRNFR-TYPE-RJCT-CD OF DCLACTITRF        CAT814DB
ET0001                 ' PEND=' NSCC-PEND-CD       OF DCLACTITRF        CAT814DB
ET0001                 ' PRGM=' PRGM-NM            OF DCLACTITRF        CAT814DB
ET0001                 ' UPDT=' UPDT-TMSTP         OF DCLACTITRF        CAT814DB
                       ' BYPASSED REJECT'                               CAT814DB
ET0001         IF  TRNFR-TYPE-RJCT-CD OF DCLACTITRF  = '  ' OR '00'     CAT814DB
                   CONTINUE                                             CAT814DB
               ELSE                                                     CAT814DB
                   GO TO 4000-EXIT                                      CAT814DB
               END-IF                                                   CAT814DB
           END-IF.                                                      CAT814DB
                                                                        CAT814DB
           PERFORM 5100-CHECK-BANK-MASTER THRU 5100-EXIT.               CAT814DB
                                                                        CAT814DB
           MOVE PENDING-AUTH-AMOUNT TO W-AMT-DISPLAY                    CAT814DB
           IF  GETBNKM-RETURN-CODE = '0'                                CAT814DB
               DISPLAY 'INP=' W-INFILE-CNT                              CAT814DB
                          ' ' WF-CLIENT-NBR                             CAT814DB
                          ' ' WF-ACAT-CONTROL-NBR                       CAT814DB
                          ' ' W-BR-X ' ' W-ACCT-X                       CAT814DB
                      ' STA=' WF-STTS-CD                                CAT814DB
                      ' DAY=' DAYS-STTS-QTY OF DCLVTRNFR                CAT814DB
                      ' SD='  STTLM-DT      OF DCLVTRNFR                CAT814DB
               DISPLAY '    '                                           CAT814DB
                       '          '                                     CAT814DB
                       'GETBNKM-RETURN-CODE='                           CAT814DB
                        GETBNKM-RETURN-CODE                             CAT814DB
                      ' CHK=' W-BNK-CHECKING-STATUS                     CAT814DB
                      ' DBC=' W-BNK-DEBIT-CARD-STATUS                   CAT814DB
                      ' PROCESS=' W-PROCESS-THIS-ACCT-IND               CAT814DB
                      ' AMT=' W-AMT-DISPLAY                             CAT814DB
                      ' <==='                                           CAT814DB
           ELSE                                                         CAT814DB
               DISPLAY 'INP=' W-INFILE-CNT                              CAT814DB
                          ' ' WF-CLIENT-NBR                             CAT814DB
                          ' ' WF-ACAT-CONTROL-NBR                       CAT814DB
                          ' ' W-BR-X ' ' W-ACCT-X                       CAT814DB
                      ' STA=' WF-STTS-CD                                CAT814DB
                      ' DAY=' DAYS-STTS-QTY OF DCLVTRNFR                CAT814DB
                      ' SD='  STTLM-DT      OF DCLVTRNFR                CAT814DB
               DISPLAY '    '                                           CAT814DB
                       '          '                                     CAT814DB
                       'GETBNKM-RETURN-CODE='                           CAT814DB
                        GETBNKM-RETURN-CODE                             CAT814DB
                      ' CHK=' W-BNK-CHECKING-STATUS                     CAT814DB
                      ' DBC=' W-BNK-DEBIT-CARD-STATUS                   CAT814DB
                      ' PROCESS=' W-PROCESS-THIS-ACCT-IND               CAT814DB
           END-IF.                                                      CAT814DB
                                                                        CAT814DB
           IF  GETBNKM-RETURN-CODE = '0'                                CAT814DB
               CONTINUE                                                 CAT814DB
           ELSE                                                         CAT814DB
               GO TO 4000-EXIT                                          CAT814DB
           END-IF.                                                      CAT814DB
                                                                        CAT814DB
           ADD 1 TO W-LOAD-CNT.                                         CAT814DB
                                                                        CAT814DB
           PERFORM 5300-MOVE-TRANSFER-DATA THRU 5300-EXIT               CAT814DB
                                                                        CAT814DB
           PERFORM 5500-GET-BALANCES       THRU 5500-EXIT               CAT814DB
                                                                        CAT814DB
           IF  WF-STTS-CD < '200'                                       CAT814DB
               ADD 1 TO W-REQ-DAY-1-CNT                                 CAT814DB
               PERFORM 5700-DAY1-ADJUSTMENT THRU 5700-EXIT              CAT814DB
           ELSE                                                         CAT814DB
               ADD 1 TO W-SETTLE-CLOSE-CNT                              CAT814DB
               PERFORM 5900-STTL-ADJUSTMENT THRU 5900-EXIT              CAT814DB
           END-IF                                                       CAT814DB
                                                                        CAT814DB
           PERFORM 7100-WRITE-ACATBNK      THRU 7100-EXIT.              CAT814DB
                                                                        CAT814DB
       4000-COMMIT.                                                     CAT814DB
                                                                        CAT814DB
           ADD +1 TO W-COMMIT-CTR                                       CAT814DB
           IF  W-COMMIT-CTR > +4                                        CAT814DB
               PERFORM 8100-SQL-COMMIT THRU 8100-EXIT                   CAT814DB
               MOVE 0 TO W-COMMIT-CTR                                   CAT814DB
           END-IF.                                                      CAT814DB
                                                                        CAT814DB
       4000-EXIT. EXIT.                                                 CAT814DB
      /                                                                 CAT814DB
       5000-SELECT-VINITRNF SECTION.                                    CAT814DB
           MOVE '5000-SELECT-VINITRNF          ' TO W-ROUTINE-1.        CAT814DB
                                                                        CAT814DB
           MOVE ' '   TO W-VINITRNF-FND-SW                              CAT814DB
ET0001**   INITIALIZE DCLVINITRNF                                       CAT814DB
ET0001     INITIALIZE DCLACTITRF                                        CAT814DB
                                                                        CAT814DB
           EXEC SQL SELECT                                              CAT814DB
                   TRANS_TYPE_CD                                        CAT814DB
                  ,TRNFR_TYPE_RJCT_CD                                   CAT814DB
                  ,CICS_TERM_ID_CD                                      CAT814DB
                  ,UPDT_TMSTP                                           CAT814DB
                  ,PRGM_NM                                              CAT814DB
                  ,NSCC_PEND_CD                                         CAT814DB
               INTO                                                     CAT814DB
ET0001             :DCLACTITRF.TRANS-TYPE-CD                            CAT814DB
ET0001            ,:DCLACTITRF.TRNFR-TYPE-RJCT-CD                       CAT814DB
ET0001            ,:DCLACTITRF.CICS-TERM-ID-CD                          CAT814DB
ET0001            ,:DCLACTITRF.UPDT-TMSTP                               CAT814DB
ET0001            ,:DCLACTITRF.PRGM-NM                                  CAT814DB
ET0001            ,:DCLACTITRF.NSCC-PEND-CD                             CAT814DB
                                                                        CAT814DB
ET0001**       FROM  VINITRNF                                           CAT814DB
ET0001         FROM  ACTITRF                                            CAT814DB
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR               CAT814DB
                  AND  ACAT_CONTROL_NBR  = :WF-ACAT-CONTROL-NBR         CAT814DB
                  AND  RCV_NBR           = :WF-RCV-NBR                  CAT814DB
                  AND  DLVR_NBR          = :WF-DLVR-NBR                 CAT814DB
                  AND  ACCT_RCV_NBR      = :WF-ACCT-RCV-NBR             CAT814DB
                  AND  ACCT_DLVR_NBR     = :WF-ACCT-DLVR-NBR            CAT814DB
                  AND  TRNFR_TYPE_CD     = :WF-TRNFR-TYPE-CD            CAT814DB
           END-EXEC                                                     CAT814DB
                                                                        CAT814DB
ET0001**   MOVE 'VINITRNF'               TO W-DB2-TABLE-NAME            CAT814DB
ET0001     MOVE 'ACTITRF '               TO W-DB2-TABLE-NAME            CAT814DB
           MOVE 'SELECT'                 TO W-DB2-ACTION                CAT814DB
           MOVE SQLCODE                  TO W-DB2-SQLCODE               CAT814DB
                                                                        CAT814DB
           IF  SQLCODE  =  +0                                           CAT814DB
               MOVE 'Y'   TO W-VINITRNF-FND-SW                          CAT814DB
           ELSE                                                         CAT814DB
              IF  SQLCODE  =  +100                                      CAT814DB
                  MOVE 'N'   TO W-VINITRNF-FND-SW                       CAT814DB
              ELSE                                                      CAT814DB
                   DISPLAY ' '                                          CAT814DB
ET0001**           DISPLAY 'CAT814DB: ERROR SELECTING A ROW IN VINITRNF'CAT814DB
ET0001             DISPLAY 'CAT814DB: ERROR SELECTING A ROW IN ACTITRF 'CAT814DB
                         ' (ACAT-TRNFR      TABLE)'                     CAT814DB
ET0001             DISPLAY 'CAT814DB: DCLACTITRF  ='                    CAT814DB
ET0001                     '(' DCLACTITRF ')'                           CAT814DB
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT              CAT814DB
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT              CAT814DB
              END-IF                                                    CAT814DB
           END-IF.                                                      CAT814DB
                                                                        CAT814DB
       5000-EXIT. EXIT.                                                 CAT814DB
      /                                                                 CAT814DB
       5100-CHECK-BANK-MASTER SECTION.                                  CAT814DB
           MOVE '5100-CHECK-BANK-MASTER        ' TO W-ROUTINE-1.        CAT814DB
                                                                        CAT814DB
           MOVE  '2'                     TO GETBNKM-REQUEST             CAT814DB
           PERFORM 6000-GETBNKM THRU 6000-EXIT                          CAT814DB
           ADD 1 TO W-GETBNKM-CNT                                       CAT814DB
                                                                        CAT814DB
           IF  GETBNKM-RETURN-CODE = '0'                                CAT814DB
               ADD 1 TO W-GETBNKM-FND-CNT                               CAT814DB
           ELSE                                                         CAT814DB
               ADD 1 TO W-GETBNKM-NOT-FND-CNT                           CAT814DB
           END-IF.                                                      CAT814DB
                                                                        CAT814DB
           IF  GETBNKM-PNC-BANK-FORMAT                                  CAT814DB
               MOVE BNK-PNC-CHECKING-STATUS                             CAT814DB
                   TO W-BNK-CHECKING-STATUS                             CAT814DB
               MOVE BNK-PNC-DEBIT-CARD-STATUS                           CAT814DB
                   TO W-BNK-DEBIT-CARD-STATUS                           CAT814DB
               IF  BNK-PNC-PENDING-AUTH IS NUMERIC                      CAT814DB
                   MOVE BNK-PNC-PENDING-AUTH TO PENDING-AUTH-AMOUNT     CAT814DB
               END-IF                                                   CAT814DB
           END-IF                                                       CAT814DB
           IF  GETBNKM-WNB-FORMAT                                       CAT814DB
               MOVE BNK-WNB-CHECKING-STATUS                             CAT814DB
                   TO W-BNK-CHECKING-STATUS                             CAT814DB
               MOVE BNK-WNB-DEBIT-CARD-STATUS                           CAT814DB
                   TO W-BNK-DEBIT-CARD-STATUS                           CAT814DB
               IF  BNK-WNB-PENDING-AUTH IS NUMERIC                      CAT814DB
                   MOVE BNK-WNB-PENDING-AUTH TO PENDING-AUTH-AMOUNT     CAT814DB
               END-IF                                                   CAT814DB
           END-IF                                                       CAT814DB
           IF  GETBNKM-REICH-AND-TANG                                   CAT814DB
             IF  BNK-RAT-PENDING-AUTH IS NUMERIC                        CAT814DB
                 MOVE BNK-RAT-PENDING-AUTH    TO  PENDING-AUTH-AMOUNT   CAT814DB
             END-IF                                                     CAT814DB
           END-IF.                                                      CAT814DB
                                                                        CAT814DB
           IF (ACM-ACCT-PROCESS  AND  GETBNKM-REICH-AND-TANG)           CAT814DB
                                                                        CAT814DB
           OR (ACM-ACCT-PROCESS  AND  GETBNKM-PNC-BANK-FORMAT  AND      CAT814DB
              (BNK-PNC-CHK-STATUS-OPEN-REIN  OR                         CAT814DB
               BNK-PNC-DBC-STATUS-OPEN-REIN))                           CAT814DB
                                                                        CAT814DB
           OR (ACM-ACCT-PROCESS  AND  GETBNKM-WNB-FORMAT       AND      CAT814DB
              (BNK-WNB-CHK-STATUS-OPEN-REIN  OR                         CAT814DB
               BNK-WNB-DBC-STATUS-OPEN-REIN))                           CAT814DB
                                                                        CAT814DB
               MOVE 'Y'                  TO W-PROCESS-THIS-ACCT-IND     CAT814DB
               ADD 1 TO W-VALID-CNT                                     CAT814DB
                                                                        CAT814DB
           ELSE                                                         CAT814DB
               MOVE 'N'                  TO W-PROCESS-THIS-ACCT-IND     CAT814DB
               ADD 1 TO W-NOT-VALID-CNT                                 CAT814DB
           END-IF.                                                      CAT814DB
                                                                        CAT814DB
           MOVE W-PROCESS-THIS-ACCT-IND  TO ACATBNK-PROCESS-IND         CAT814DB
           MOVE GETBNKM-RETURN-CODE      TO ACATBNK-GETBNKM-RETURN-CODE CAT814DB
           MOVE PENDING-AUTH-AMOUNT      TO ACATBNK-PENDING-AMT         CAT814DB
           MOVE W-BNK-CHECKING-STATUS    TO ACATBNK-CHECKING-STATUS     CAT814DB
           MOVE W-BNK-DEBIT-CARD-STATUS  TO ACATBNK-DEBIT-CARD-STATUS   CAT814DB
           .                                                            CAT814DB
       5100-EXIT. EXIT.                                                 CAT814DB
      /                                                                 CAT814DB
       5300-MOVE-TRANSFER-DATA    SECTION.                              CAT814DB
           MOVE '5300-MOVE-TRANSFER-DATA          ' TO W-ROUTINE-1.     CAT814DB
                                                                        CAT814DB
           MOVE CLIENT-NBR           OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-KEY-CLIENT-NBR          CAT814DB
           MOVE BRANCH-CD            OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-KEY-BRANCH-CD           CAT814DB
           MOVE ACCT-CD              OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-KEY-ACCT-CD             CAT814DB
           MOVE ACAT-CONTROL-NBR     OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-KEY-ACAT-CONTROL-NBR    CAT814DB
                                                                        CAT814DB
           MOVE CLIENT-NBR           OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-CLIENT-NBR              CAT814DB
           MOVE ACAT-CONTROL-NBR     OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-ACAT-CONTROL-NBR        CAT814DB
           MOVE SBMTG-PRTCP-NBR      OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-SBMTG-PRTCP-NBR         CAT814DB
           MOVE DLVR-NBR             OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-DLVR-NBR                CAT814DB
           MOVE ACCT-DLVR-NBR        OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-ACCT-DLVR-NBR           CAT814DB
           MOVE RCV-NBR              OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-RCV-NBR                 CAT814DB
           MOVE ACCT-RCV-NBR         OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-ACCT-RCV-NBR            CAT814DB
           MOVE TRNFR-TYPE-CD        OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-TRNFR-TYPE-CD           CAT814DB
           MOVE TRANS-TYPE-CD        OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-TRANS-TYPE-CD           CAT814DB
           MOVE ACAT-CNTL-ASTD-NBR   OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-ACAT-CNTL-ASTD-NBR      CAT814DB
           MOVE PRCS-DT              OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-PRCS-DT                 CAT814DB
           MOVE STTS-CD              OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-STTS-CD                 CAT814DB
           MOVE TRANS-RFRN-ID-CD     OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-TRANS-RFRN-ID-CD        CAT814DB
           MOVE DB-CR-CD             OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-DB-CR-CD                CAT814DB
           MOVE DSTBN-SIDE-CD        OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-DSTBN-SIDE-CD           CAT814DB
           MOVE SYS-ACT-CD           OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-SYS-ACT-CD              CAT814DB
           MOVE SYS-RJCT-RSN-CD      OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-SYS-RJCT-RSN-CD         CAT814DB
           MOVE TRNFR-TYPE-RJC1-CD   OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-TRNFR-TYPE-RJC1-CD      CAT814DB
           MOVE TRNFR-TYPE-RJC2-CD   OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-TRNFR-TYPE-RJC2-CD      CAT814DB
           MOVE TRNFR-TYPE-RJCT-CD   OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-TRNFR-TYPE-RJCT-CD      CAT814DB
           MOVE BRANCH-CD            OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-BRANCH-CD               CAT814DB
           MOVE ACCT-CD              OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-ACCT-CD                 CAT814DB
           MOVE CYCLE-CD             OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-CYCLE-CD                CAT814DB
           MOVE DAYS-STTS-QTY        OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-DAYS-STTS-QTY           CAT814DB
           MOVE STTLM-DT             OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-STTLM-DT                CAT814DB
           MOVE STTLM-ASCTD-DT       OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-STTLM-ASCTD-DT          CAT814DB
           MOVE CICS-TERM-ID-CD      OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-CICS-TERM-ID-CD         CAT814DB
           MOVE PRGM-NM              OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-PRGM-NM                 CAT814DB
           MOVE CRT-TMSTP            OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-CRT-TMSTP               CAT814DB
           MOVE UPDT-TMSTP           OF DCLVTRNFR                       CAT814DB
                                     TO ACATBNK-UPDT-TMSTP              CAT814DB
           .                                                            CAT814DB
       5300-EXIT. EXIT.                                                 CAT814DB
      /                                                                 CAT814DB
       5500-GET-BALANCES   SECTION.                                     CAT814DB
      ***************************************************************** CAT814DB
      *  GET BALANCES                                                   CAT814DB
      *      TYPES 1, 3 = CASH                                          CAT814DB
      *      TYPES 2    = MARGIN                                        CAT814DB
      *      TYPES 5    = SHORT                                         CAT814DB
      *      SMA        = SMA                                           CAT814DB
      ***************************************************************** CAT814DB
           MOVE '5500-GET-BALANCES             ' TO W-ROUTINE-1.        CAT814DB
                                                                        CAT814DB
           MOVE ' '                TO W-BAL-FND-SW                      CAT814DB
           MOVE ZEROES             TO W-BAL-TYPE1                       CAT814DB
                                      W-BAL-TYPE2                       CAT814DB
                                      W-BAL-TYPE3                       CAT814DB
                                      W-BAL-TYPE4                       CAT814DB
                                      W-BAL-TYPE5                       CAT814DB
                                      W-BAL-TYPE6                       CAT814DB
                                      W-BAL-TYPE7                       CAT814DB
                                      W-BAL-TYPE8                       CAT814DB
                                      W-BAL-TYPE9                       CAT814DB
           MOVE SPACES                      TO W-BAL-KEY                CAT814DB
           MOVE W-CURRENT-CLIENT-N          TO W-BAL-CLT                CAT814DB
           MOVE W-BR                        TO W-BAL-BR                 CAT814DB
           MOVE W-ACCT                      TO W-BAL-ACCT               CAT814DB
           MOVE '28'                        TO W-BAL-REC-TYPE           CAT814DB
           MOVE '000000'                    TO W-BAL-CUR                CAT814DB
           MOVE W-BAL-KEY                   TO CMBL-KEY                 CAT814DB
*********  MOVE  LOW-VALUES                TO  GETVBAL-PARM.                    
           MOVE  'CAT814DB'                TO  GETVBAL-CALLING-PROGRAM.         
           MOVE  'O'  TO GETVBAL-FILE                                           
           MOVE  'R'  TO GETVBAL-FUNC                                           
           MOVE W-BAL-CLT                  TO  GETVBAL-OLD-CLIENT.              
           MOVE W-BAL-BR                   TO  GETVBAL-OLD-BRANCH.              
           MOVE W-BAL-ACCT                 TO  GETVBAL-OLD-ACCT.                
           MOVE ZEROES                     TO  GETVBAL-OLD-CUR-CODE.            
           SET GETVBAL-OLD-FILLER-SPACE    TO  TRUE.                            
           PERFORM CALL-GETVBAL                                                 
                                                                        CAT814DB
           IF BALNC-OKAY                                                CAT814DB
              CONTINUE                                                  CAT814DB
           ELSE                                                         CAT814DB
             IF BALNC-NOT-FOUND                                         CAT814DB
                GO TO 5500-EXIT                                         CAT814DB
             ELSE                                                       CAT814DB
                DISPLAY ' ** CAT814DB CALL GETVBAL PROBLEM'             CAT814DB
                        ' FILE-STATUS = ' BALNC-FILE-STATUS             CAT814DB
                DISPLAY 'W-BAL-KEY = ' W-BAL-CLT                        CAT814DB
                                   ' ' W-BAL-BR                         CAT814DB
                                   ' ' W-BAL-ACCT                       CAT814DB
                MOVE +3999 TO ABEND-CD                                  CAT814DB
                CALL  ABEND  USING ABEND-CD                             CAT814DB
             END-IF                                                     CAT814DB
           END-IF.                                                      CAT814DB
                                                                        CAT814DB
                                                                        CAT814DB
           IF BALNC-OKAY                                                CAT814DB
              CONTINUE                                                  CAT814DB
           ELSE                                                         CAT814DB
             IF BALNC-END-OF-FILE                                       CAT814DB
                GO TO 5500-CONTINUE                                     CAT814DB
             ELSE                                                       CAT814DB
                DISPLAY ' ** CAT814DB - CALL GETVBAL PROBLEM'           CAT814DB
                        ' FILE-STATUS = ' BALNC-FILE-STATUS             CAT814DB
                DISPLAY 'W-BAL-KEY = ' W-BAL-CLT                        CAT814DB
                                   ' ' W-BAL-BR                         CAT814DB
                                   ' ' W-BAL-ACCT                       CAT814DB
                                   ' ' W-BAL-REC-TYPE                   CAT814DB
                                   ' ' W-BAL-CUR                        CAT814DB
                MOVE +3999 TO ABEND-CD                                  CAT814DB
                CALL  ABEND  USING ABEND-CD                             CAT814DB
             END-IF                                                     CAT814DB
           END-IF.                                                      CAT814DB
                                                                        CAT814DB
           ADD 1 TO W-BAL-CNT                                           CAT814DB
                                                                        CAT814DB
                                                                        CAT814DB
           MOVE 'Y' TO W-BAL-FND-SW                                     CAT814DB
           ADD 1 TO W-BAL-FND-CNT                                       CAT814DB
                                                                        CAT814DB
           IF CMBL-ACTYP1-PRESENT = 1                                   CAT814DB
               MOVE CMBL1-TRADE-DATE-BAL-YSTDY (1) TO W-BAL-TYPE1       CAT814DB
           END-IF.                                                      CAT814DB
           IF CMBL-ACTYP2-PRESENT = 1                                   CAT814DB
               MOVE CMBL2-TRADE-DATE-BAL-YSTDY (1) TO W-BAL-TYPE2       CAT814DB
           END-IF.                                                      CAT814DB
           IF CMBL-ACTYP3-PRESENT = 1                                   CAT814DB
               MOVE CMBL3-TRADE-DATE-BAL-YSTDY (1) TO W-BAL-TYPE3       CAT814DB
           END-IF.                                                      CAT814DB
           IF CMBL-ACTYP4-PRESENT = 1                                   CAT814DB
               MOVE CMBL4-TRADE-DATE-BAL-YSTDY (1) TO W-BAL-TYPE4       CAT814DB
           END-IF.                                                      CAT814DB
           IF CMBL-ACTYP5-PRESENT = 1                                   CAT814DB
               MOVE CMBL5-TRADE-DATE-BAL-YSTDY (1) TO W-BAL-TYPE5       CAT814DB
           END-IF.                                                      CAT814DB
           IF CMBL-ACTYP6-PRESENT = 1                                   CAT814DB
               MOVE CMBL6-TRADE-DATE-BAL-YSTDY (1) TO W-BAL-TYPE6       CAT814DB
           END-IF.                                                      CAT814DB
           IF CMBL-ACTYP7-PRESENT = 1                                   CAT814DB
               MOVE CMBL7-TRADE-DATE-BAL-YSTDY (1) TO W-BAL-TYPE7       CAT814DB
           END-IF.                                                      CAT814DB
           IF CMBL-ACTYP8-PRESENT = 1                                   CAT814DB
               MOVE CMBL8-TRADE-DATE-BAL-YSTDY (1) TO W-BAL-TYPE8       CAT814DB
           END-IF.                                                      CAT814DB
           IF CMBL-ACTYP9-PRESENT = 1                                   CAT814DB
               MOVE CMBL9-TRADE-DATE-BAL-YSTDY (1) TO W-BAL-TYPE9       CAT814DB
           END-IF.                                                      CAT814DB
                                                                        CAT814DB
       5500-CONTINUE.                                                   CAT814DB
                                                                        CAT814DB
           MOVE  '1'            TO ACATBNK-BAL-TYP(1)                   CAT814DB
           MOVE  '2'            TO ACATBNK-BAL-TYP(2)                   CAT814DB
           MOVE  '3'            TO ACATBNK-BAL-TYP(3)                   CAT814DB
           MOVE  '4'            TO ACATBNK-BAL-TYP(4)                   CAT814DB
           MOVE  '5'            TO ACATBNK-BAL-TYP(5)                   CAT814DB
           MOVE  '6'            TO ACATBNK-BAL-TYP(6)                   CAT814DB
           MOVE  '7'            TO ACATBNK-BAL-TYP(7)                   CAT814DB
           MOVE  '8'            TO ACATBNK-BAL-TYP(8)                   CAT814DB
           MOVE  '9'            TO ACATBNK-BAL-TYP(9)                   CAT814DB
                                                                        CAT814DB
           MOVE  W-BAL-TYPE1    TO ACATBNK-BAL-AMT(1)                   CAT814DB
           MOVE  W-BAL-TYPE2    TO ACATBNK-BAL-AMT(2)                   CAT814DB
           MOVE  W-BAL-TYPE3    TO ACATBNK-BAL-AMT(3)                   CAT814DB
           MOVE  W-BAL-TYPE4    TO ACATBNK-BAL-AMT(4)                   CAT814DB
           MOVE  W-BAL-TYPE5    TO ACATBNK-BAL-AMT(5)                   CAT814DB
           MOVE  W-BAL-TYPE6    TO ACATBNK-BAL-AMT(6)                   CAT814DB
           MOVE  W-BAL-TYPE7    TO ACATBNK-BAL-AMT(7)                   CAT814DB
           MOVE  W-BAL-TYPE8    TO ACATBNK-BAL-AMT(8)                   CAT814DB
           MOVE  W-BAL-TYPE9    TO ACATBNK-BAL-AMT(9)                   CAT814DB
                                                                        CAT814DB
           MOVE W-BAL-TYPE1  TO W-BAL-TYPE1-DISPLAY                     CAT814DB
           MOVE W-BAL-TYPE2  TO W-BAL-TYPE2-DISPLAY                     CAT814DB
           MOVE W-BAL-TYPE3  TO W-BAL-TYPE3-DISPLAY                     CAT814DB
           MOVE W-BAL-TYPE4  TO W-BAL-TYPE4-DISPLAY                     CAT814DB
           MOVE W-BAL-TYPE5  TO W-BAL-TYPE5-DISPLAY                     CAT814DB
           MOVE W-BAL-TYPE6  TO W-BAL-TYPE6-DISPLAY                     CAT814DB
           MOVE W-BAL-TYPE7  TO W-BAL-TYPE7-DISPLAY                     CAT814DB
           MOVE W-BAL-TYPE8  TO W-BAL-TYPE8-DISPLAY                     CAT814DB
           MOVE W-BAL-TYPE9  TO W-BAL-TYPE9-DISPLAY                     CAT814DB
                                                                        CAT814DB
           DISPLAY          '   BAL ' W-BAL-CLT                         CAT814DB
                                  ' ' W-BAL-BR                          CAT814DB
                                  ' ' W-BAL-ACCT                        CAT814DB
                                  ' ' W-BAL-REC-TYPE                    CAT814DB
                                  ' ' W-BAL-CUR                         CAT814DB
           DISPLAY           '   T1=' W-BAL-TYPE1-DISPLAY               CAT814DB
                               ' T2=' W-BAL-TYPE2-DISPLAY               CAT814DB
                               ' T3=' W-BAL-TYPE3-DISPLAY               CAT814DB
                               ' T4=' W-BAL-TYPE4-DISPLAY               CAT814DB
           DISPLAY           '   T5=' W-BAL-TYPE5-DISPLAY               CAT814DB
                               ' T6=' W-BAL-TYPE6-DISPLAY               CAT814DB
                               ' T7=' W-BAL-TYPE7-DISPLAY               CAT814DB
                               ' T8=' W-BAL-TYPE8-DISPLAY               CAT814DB
           DISPLAY           '   T9=' W-BAL-TYPE9-DISPLAY               CAT814DB
           .                                                            CAT814DB
       5500-EXIT. EXIT.                                                 CAT814DB
      /                                                                 CAT814DB
       5700-DAY1-ADJUSTMENT SECTION.                                    CAT814DB
      ***************************************************************** CAT814DB
      *  MAKE SURE TYPE 4 BALANCE HAS JUST ENOUGH CASH IN IT TO COVER   CAT814DB
      *  PENDING AMOUNT(OUTSTANDING AUTHORIZATION).                     CAT814DB
      *  IF TYPE 4 HAS EXTRA CASH, MOVE THE EXTRA TO TYPE 1.            CAT814DB
      *  IF TYPE 4 DOES NOT HAVE ENOUGH CASH, CHECK THE OTHER TYPES,    CAT814DB
      *  AND MOVE OVER ENOUGH CASH TO COVER THE PENDING AMOUNT.         CAT814DB
      ***************************************************************** CAT814DB
           MOVE '5700-DAY1-ADJUSTMENT        ' TO W-ROUTINE-1.          CAT814DB
                                                                        CAT814DB
           INITIALIZE W-CALC-FIELDS                                     CAT814DB
      *                                                                 CAT814DB
      *--REVERSE THE SIGN                                               CAT814DB
      *                                                                 CAT814DB
           MULTIPLY ACATBNK-BAL-AMT (1) BY -1 GIVING W-AMT-TYP1         CAT814DB
           MULTIPLY ACATBNK-BAL-AMT (2) BY -1 GIVING W-AMT-TYP2         CAT814DB
           MULTIPLY ACATBNK-BAL-AMT (3) BY -1 GIVING W-AMT-TYP3         CAT814DB
           MULTIPLY ACATBNK-BAL-AMT (4) BY -1 GIVING W-AMT-TYP4         CAT814DB
           MULTIPLY ACATBNK-BAL-AMT (5) BY -1 GIVING W-AMT-TYP5         CAT814DB
           MULTIPLY ACATBNK-BAL-AMT (6) BY -1 GIVING W-AMT-TYP6         CAT814DB
           MULTIPLY ACATBNK-BAL-AMT (7) BY -1 GIVING W-AMT-TYP7         CAT814DB
           MULTIPLY ACATBNK-BAL-AMT (8) BY -1 GIVING W-AMT-TYP8         CAT814DB
           MULTIPLY ACATBNK-BAL-AMT (9) BY -1 GIVING W-AMT-TYP9         CAT814DB
                                                                        CAT814DB
           IF  ACATBNK-PENDING-AMT = 0                                  CAT814DB
               ADD 1 TO W-AMT-IS-ZERO-CNT                               CAT814DB
           ELSE                                                         CAT814DB
               ADD 1 TO W-AMT-NOT-ZERO-CNT                              CAT814DB
           END-IF                                                       CAT814DB
                                                                        CAT814DB
TEST=>     IF  L-TEST = 'Y' AND W-PROCESS-THIS-ACCT-IND = 'Y'           CAT814DB
TEST=>         IF  ACATBNK-PENDING-AMT = 0                              CAT814DB
TEST=>             IF  W-INFILE-CNT-1 = '1' OR '3' OR '5' OR '7' OR '9' CAT814DB
TEST=>                 MOVE +01000.00    TO ACATBNK-PENDING-AMT         CAT814DB
TEST=>             ELSE                                                 CAT814DB
TEST=>                 MOVE +02000.00    TO ACATBNK-PENDING-AMT         CAT814DB
TEST=>             END-IF                                               CAT814DB
TEST=>             MOVE ACATBNK-PENDING-AMT TO W-AMT-DISPLAY            CAT814DB
TEST=>             DISPLAY '   TEST-AMT=' W-AMT-DISPLAY                 CAT814DB
TEST=>         END-IF                                                   CAT814DB
TEST=>     END-IF                                                       CAT814DB
                                                                        CAT814DB
           MOVE ACATBNK-PENDING-AMT      TO W-PEND-AMT.                 CAT814DB
           IF  W-PEND-AMT = 0                                           CAT814DB
               MOVE W-PEND-AMT TO W-AMT-DISPLAY                         CAT814DB
               DISPLAY '   PEND=' W-AMT-DISPLAY ' (ZERO). BYPASSED.'    CAT814DB
               GO TO 5700-CONTINUE                                      CAT814DB
           END-IF                                                       CAT814DB
      *                                                                 CAT814DB
      *--CHECK TYPE4 FIRST                                              CAT814DB
      *                                                                 CAT814DB
      *-------(TYPE4 > 0 AND > PEND)                                    CAT814DB
           MOVE W-AMT-TYP4 TO W-AMT-DISPLAY-2                           CAT814DB
           MOVE W-PEND-AMT TO W-AMT-DISPLAY                             CAT814DB
           DISPLAY '   TYP4=' W-AMT-DISPLAY-2                           CAT814DB
                     ' PEND=' W-AMT-DISPLAY                             CAT814DB
           IF  W-AMT-TYP4 GREATER OR EQUAL W-PEND-AMT                   CAT814DB
               COMPUTE W-REMOVE-FROM-TYP4 = W-AMT-TYP4 - W-PEND-AMT     CAT814DB
               MOVE    W-REMOVE-FROM-TYP4 TO W-TYP4-ADD-TO-TYP1         CAT814DB
               MOVE 'Y' TO W-TYP4-IND                                   CAT814DB
               DISPLAY '     (TYPE4 > 0 AND > PEND)'                    CAT814DB
               GO  TO 5700-CONTINUE                                     CAT814DB
           ELSE                                                         CAT814DB
      *-------(TYPE4 > 0 AND < PEND)                                    CAT814DB
             IF  W-AMT-TYP4 GREATER THAN ZERO                           CAT814DB
                 COMPUTE W-PEND-AMT = W-PEND-AMT - W-AMT-TYP4           CAT814DB
                 DISPLAY '     (TYPE4 > 0 AND < PEND)'                  CAT814DB
             ELSE                                                       CAT814DB
      *-------(TYPE4 = 0)                                               CAT814DB
                 IF  W-AMT-TYP4 EQUAL ZERO                              CAT814DB
                     DISPLAY '     (TYPE4 = 0 AND < PEND)'              CAT814DB
                 ELSE                                                   CAT814DB
      *-------(TYPE4 < 0)                                               CAT814DB
                     COMPUTE W-PEND-AMT = W-PEND-AMT - W-AMT-TYP4       CAT814DB
                     DISPLAY '     (TYPE4 < 0 AND < PEND)'              CAT814DB
                 END-IF                                                 CAT814DB
             END-IF                                                     CAT814DB
           END-IF.                                                      CAT814DB
                                                                        CAT814DB
      *                                                                 CAT814DB
      *--CHECK TYPE 9 SECOND                                            CAT814DB
      *                                                                 CAT814DB
      *-------(TYPE9 > 0 AND > PEND)                                    CAT814DB
           MOVE W-AMT-TYP9 TO W-AMT-DISPLAY-2                           CAT814DB
           MOVE W-PEND-AMT TO W-AMT-DISPLAY                             CAT814DB
           DISPLAY '   TYP9=' W-AMT-DISPLAY-2                           CAT814DB
                     ' PEND=' W-AMT-DISPLAY                             CAT814DB
           IF  W-AMT-TYP9 GREATER OR EQUAL W-PEND-AMT                   CAT814DB
               MOVE W-PEND-AMT          TO W-REMOVE-FROM-TYP9           CAT814DB
               MOVE W-REMOVE-FROM-TYP9       TO W-TYP9-ADD-TO-TYP4      CAT814DB
               MOVE 'Y' TO W-TYP9-IND                                   CAT814DB
               DISPLAY '     (TYPE9 > 0 AND > PEND)'                    CAT814DB
               GO  TO 5700-CONTINUE                                     CAT814DB
           ELSE                                                         CAT814DB
      *-------(TYPE9 > 0 AND < PEND)                                    CAT814DB
             IF  W-AMT-TYP9 GREATER THAN ZERO                           CAT814DB
                 COMPUTE W-PEND-AMT = W-PEND-AMT - W-AMT-TYP9           CAT814DB
                 MOVE    W-AMT-TYP9            TO W-REMOVE-FROM-TYP9    CAT814DB
                 MOVE W-REMOVE-FROM-TYP9       TO W-TYP9-ADD-TO-TYP4    CAT814DB
                 MOVE 'Y' TO W-TYP9-IND                                 CAT814DB
                 DISPLAY '     (TYPE9 > 0 AND < PEND)'                  CAT814DB
             END-IF                                                     CAT814DB
           END-IF.                                                      CAT814DB
                                                                        CAT814DB
      *                                                                 CAT814DB
      *--CHECK TYPE 8 THIRD                                             CAT814DB
      *                                                                 CAT814DB
      *-------(TYPE8 > 0 AND > PEND)                                    CAT814DB
           MOVE W-AMT-TYP8 TO W-AMT-DISPLAY-2                           CAT814DB
           MOVE W-PEND-AMT TO W-AMT-DISPLAY                             CAT814DB
           DISPLAY '   TYP8=' W-AMT-DISPLAY-2                           CAT814DB
                     ' PEND=' W-AMT-DISPLAY                             CAT814DB
           IF  W-AMT-TYP8 GREATER OR EQUAL W-PEND-AMT                   CAT814DB
               MOVE W-PEND-AMT               TO W-REMOVE-FROM-TYP8      CAT814DB
               MOVE W-REMOVE-FROM-TYP8       TO W-TYP8-ADD-TO-TYP4      CAT814DB
               MOVE 'Y' TO W-TYP8-IND                                   CAT814DB
               DISPLAY '     (TYPE8 > 0 AND > PEND)'                    CAT814DB
               GO  TO 5700-CONTINUE                                     CAT814DB
           ELSE                                                         CAT814DB
      *-------(TYPE8 > 0 AND < PEND)                                    CAT814DB
             IF  W-AMT-TYP8 GREATER THAN ZERO                           CAT814DB
                 COMPUTE W-PEND-AMT = W-PEND-AMT - W-AMT-TYP8           CAT814DB
                 MOVE    W-AMT-TYP8            TO W-REMOVE-FROM-TYP8    CAT814DB
                 MOVE W-REMOVE-FROM-TYP8       TO W-TYP8-ADD-TO-TYP4    CAT814DB
                 MOVE 'Y' TO W-TYP8-IND                                 CAT814DB
                 DISPLAY '     (TYPE8 > 0 AND < PEND)'                  CAT814DB
             END-IF                                                     CAT814DB
           END-IF.                                                      CAT814DB
                                                                        CAT814DB
      *                                                                 CAT814DB
      *--CHECK TYPE 7 FOURTH                                            CAT814DB
      *                                                                 CAT814DB
      *-------(TYPE7 > 0 AND > PEND)                                    CAT814DB
           MOVE W-AMT-TYP7 TO W-AMT-DISPLAY-2                           CAT814DB
           MOVE W-PEND-AMT TO W-AMT-DISPLAY                             CAT814DB
           DISPLAY '   TYP7=' W-AMT-DISPLAY-2                           CAT814DB
                     ' PEND=' W-AMT-DISPLAY                             CAT814DB
           IF  W-AMT-TYP7 GREATER OR EQUAL W-PEND-AMT                   CAT814DB
               MOVE W-PEND-AMT               TO W-REMOVE-FROM-TYP7      CAT814DB
               MOVE W-REMOVE-FROM-TYP7       TO W-TYP7-ADD-TO-TYP4      CAT814DB
               MOVE 'Y' TO W-TYP7-IND                                   CAT814DB
               DISPLAY '     (TYPE7 > 0 AND > PEND)'                    CAT814DB
               GO  TO 5700-CONTINUE                                     CAT814DB
           ELSE                                                         CAT814DB
      *-------(TYPE7 > 0 AND < PEND)                                    CAT814DB
             IF  W-AMT-TYP7 GREATER THAN ZERO                           CAT814DB
                 COMPUTE W-PEND-AMT = W-PEND-AMT - W-AMT-TYP7           CAT814DB
                 MOVE    W-AMT-TYP7            TO W-REMOVE-FROM-TYP7    CAT814DB
                 MOVE W-REMOVE-FROM-TYP7       TO W-TYP7-ADD-TO-TYP4    CAT814DB
                 MOVE 'Y' TO W-TYP7-IND                                 CAT814DB
                 DISPLAY '     (TYPE7 > 0 AND < PEND)'                  CAT814DB
             END-IF                                                     CAT814DB
           END-IF.                                                      CAT814DB
                                                                        CAT814DB
      *                                                                 CAT814DB
      *--CHECK TYPE 6 FIFTH                                             CAT814DB
      *                                                                 CAT814DB
      *-------(TYPE6 > 0 AND > PEND)                                    CAT814DB
           MOVE W-AMT-TYP6 TO W-AMT-DISPLAY-2                           CAT814DB
           MOVE W-PEND-AMT TO W-AMT-DISPLAY                             CAT814DB
           DISPLAY '   TYP6=' W-AMT-DISPLAY-2                           CAT814DB
                     ' PEND=' W-AMT-DISPLAY                             CAT814DB
           IF  W-AMT-TYP6 GREATER OR EQUAL W-PEND-AMT                   CAT814DB
               MOVE W-PEND-AMT               TO W-REMOVE-FROM-TYP6      CAT814DB
               MOVE W-REMOVE-FROM-TYP6       TO W-TYP6-ADD-TO-TYP4      CAT814DB
               MOVE 'Y' TO W-TYP6-IND                                   CAT814DB
               DISPLAY '     (TYPE6 > 0 AND > PEND)'                    CAT814DB
               GO  TO 5700-CONTINUE                                     CAT814DB
           ELSE                                                         CAT814DB
      *-------(TYPE6 > 0 AND < PEND)                                    CAT814DB
             IF  W-AMT-TYP6 GREATER THAN ZERO                           CAT814DB
                 COMPUTE W-PEND-AMT = W-PEND-AMT - W-AMT-TYP6           CAT814DB
                 MOVE    W-AMT-TYP6            TO W-REMOVE-FROM-TYP6    CAT814DB
                 MOVE W-REMOVE-FROM-TYP6       TO W-TYP6-ADD-TO-TYP4    CAT814DB
                 MOVE 'Y' TO W-TYP6-IND                                 CAT814DB
                 DISPLAY '     (TYPE6 > 0 AND < PEND)'                  CAT814DB
             END-IF                                                     CAT814DB
           END-IF.                                                      CAT814DB
                                                                        CAT814DB
      *                                                                 CAT814DB
      *--CHECK TYPE 3 SIXTH                                             CAT814DB
      *                                                                 CAT814DB
      *-------(TYPE3 > 0 AND > PEND)                                    CAT814DB
           MOVE W-AMT-TYP3 TO W-AMT-DISPLAY-2                           CAT814DB
           MOVE W-PEND-AMT TO W-AMT-DISPLAY                             CAT814DB
           DISPLAY '   TYP3=' W-AMT-DISPLAY-2                           CAT814DB
                     ' PEND=' W-AMT-DISPLAY                             CAT814DB
           IF  W-AMT-TYP3 GREATER OR EQUAL W-PEND-AMT                   CAT814DB
               MOVE W-PEND-AMT               TO W-REMOVE-FROM-TYP3      CAT814DB
               MOVE W-REMOVE-FROM-TYP3       TO W-TYP3-ADD-TO-TYP4      CAT814DB
               MOVE 'Y' TO W-TYP3-IND                                   CAT814DB
               DISPLAY '     (TYPE3 > 0 AND > PEND)'                    CAT814DB
               GO  TO 5700-CONTINUE                                     CAT814DB
           ELSE                                                         CAT814DB
      *-------(TYPE3 > 0 AND < PEND)                                    CAT814DB
             IF  W-AMT-TYP3 GREATER THAN ZERO                           CAT814DB
                 COMPUTE W-PEND-AMT = W-PEND-AMT - W-AMT-TYP3           CAT814DB
                 MOVE    W-AMT-TYP3            TO W-REMOVE-FROM-TYP3    CAT814DB
                 MOVE W-REMOVE-FROM-TYP3       TO W-TYP3-ADD-TO-TYP4    CAT814DB
                 MOVE 'Y' TO W-TYP3-IND                                 CAT814DB
                 DISPLAY '     (TYPE3 > 0 AND < PEND)'                  CAT814DB
             END-IF                                                     CAT814DB
           END-IF.                                                      CAT814DB
                                                                        CAT814DB
      *                                                                 CAT814DB
      *--CHECK TYPE 2 SEVENTH                                           CAT814DB
      *                                                                 CAT814DB
      *-------(TYPE2 > 0 AND > PEND)                                    CAT814DB
           MOVE W-AMT-TYP2 TO W-AMT-DISPLAY-2                           CAT814DB
           MOVE W-PEND-AMT TO W-AMT-DISPLAY                             CAT814DB
           DISPLAY '   TYP2=' W-AMT-DISPLAY-2                           CAT814DB
                     ' PEND=' W-AMT-DISPLAY                             CAT814DB
           IF  W-AMT-TYP2 GREATER OR EQUAL W-PEND-AMT                   CAT814DB
               MOVE W-PEND-AMT               TO W-REMOVE-FROM-TYP2      CAT814DB
               MOVE W-REMOVE-FROM-TYP2       TO W-TYP2-ADD-TO-TYP4      CAT814DB
               MOVE 'Y' TO W-TYP2-IND                                   CAT814DB
               DISPLAY '     (TYPE2 > 0 AND > PEND)'                    CAT814DB
               GO  TO 5700-CONTINUE                                     CAT814DB
           ELSE                                                         CAT814DB
      *-------(TYPE2 > 0 AND < PEND)                                    CAT814DB
             IF  W-AMT-TYP2 GREATER THAN ZERO                           CAT814DB
                 COMPUTE W-PEND-AMT = W-PEND-AMT - W-AMT-TYP2           CAT814DB
                 MOVE    W-AMT-TYP2            TO W-REMOVE-FROM-TYP2    CAT814DB
                 MOVE W-REMOVE-FROM-TYP2       TO W-TYP2-ADD-TO-TYP4    CAT814DB
                 MOVE 'Y' TO W-TYP2-IND                                 CAT814DB
                 DISPLAY '     (TYPE2 > 0 AND < PEND)'                  CAT814DB
             END-IF                                                     CAT814DB
           END-IF.                                                      CAT814DB
                                                                        CAT814DB
      *                                                                 CAT814DB
      *--CHECK TYPE 1 EIGHTH AND LAST                                   CAT814DB
      *                                                                 CAT814DB
      *-------(TYPE1 >= PEND)                                           CAT814DB
           MOVE W-AMT-TYP1 TO W-AMT-DISPLAY-2                           CAT814DB
           MOVE W-PEND-AMT TO W-AMT-DISPLAY                             CAT814DB
           DISPLAY '   TYP1=' W-AMT-DISPLAY-2                           CAT814DB
                     ' PEND=' W-AMT-DISPLAY                             CAT814DB
           IF  W-AMT-TYP1 GREATER OR EQUAL W-PEND-AMT                   CAT814DB
               MOVE W-PEND-AMT               TO W-REMOVE-FROM-TYP1      CAT814DB
               MOVE W-PEND-AMT               TO W-TYP1-ADD-TO-TYP4      CAT814DB
               MOVE 'Y' TO W-TYP1-IND                                   CAT814DB
               DISPLAY '     (TYPE1 > 0 AND > PEND)'                    CAT814DB
               GO  TO 5700-CONTINUE                                     CAT814DB
           ELSE                                                         CAT814DB
      *-------(TYPE1 < PEND)                                            CAT814DB
             IF  W-AMT-TYP1 GREATER THAN ZERO                           CAT814DB
                 MOVE W-PEND-AMT               TO W-REMOVE-FROM-TYP1    CAT814DB
                 MOVE W-PEND-AMT               TO W-TYP1-ADD-TO-TYP4    CAT814DB
                 MOVE 'Y' TO W-TYP1-IND                                 CAT814DB
                 DISPLAY '     (TYPE1 > 0 AND < PEND)'                  CAT814DB
             ELSE                                                       CAT814DB
                 MOVE W-PEND-AMT               TO W-REMOVE-FROM-TYP1    CAT814DB
                 MOVE W-PEND-AMT               TO W-TYP1-ADD-TO-TYP4    CAT814DB
                 MOVE 'Y' TO W-TYP1-IND                                 CAT814DB
                 DISPLAY '     (TYPE1 <=0 AND < PEND)'                  CAT814DB
             END-IF                                                     CAT814DB
           END-IF.                                                      CAT814DB
                                                                        CAT814DB
       5700-CONTINUE.                                                   CAT814DB
                                                                        CAT814DB
           MOVE W-REMOVE-FROM-TYP1       TO ACATBNK-REMOVE (1)          CAT814DB
           MOVE W-REMOVE-FROM-TYP2       TO ACATBNK-REMOVE (2)          CAT814DB
           MOVE W-REMOVE-FROM-TYP3       TO ACATBNK-REMOVE (3)          CAT814DB
           MOVE W-REMOVE-FROM-TYP4       TO ACATBNK-REMOVE (4)          CAT814DB
           MOVE W-REMOVE-FROM-TYP5       TO ACATBNK-REMOVE (5)          CAT814DB
           MOVE W-REMOVE-FROM-TYP6       TO ACATBNK-REMOVE (6)          CAT814DB
           MOVE W-REMOVE-FROM-TYP7       TO ACATBNK-REMOVE (7)          CAT814DB
           MOVE W-REMOVE-FROM-TYP8       TO ACATBNK-REMOVE (8)          CAT814DB
           MOVE W-REMOVE-FROM-TYP9       TO ACATBNK-REMOVE (9)          CAT814DB
                                                                        CAT814DB
           MOVE W-TYP1-ADD-TO-TYP4       TO ACATBNK-ADD (1)             CAT814DB
           MOVE W-TYP2-ADD-TO-TYP4       TO ACATBNK-ADD (2)             CAT814DB
           MOVE W-TYP3-ADD-TO-TYP4       TO ACATBNK-ADD (3)             CAT814DB
           MOVE W-TYP4-ADD-TO-TYP1       TO ACATBNK-ADD (4)             CAT814DB
           MOVE W-TYP5-ADD-TO-TYP4       TO ACATBNK-ADD (5)             CAT814DB
           MOVE W-TYP6-ADD-TO-TYP4       TO ACATBNK-ADD (6)             CAT814DB
           MOVE W-TYP7-ADD-TO-TYP4       TO ACATBNK-ADD (7)             CAT814DB
           MOVE W-TYP8-ADD-TO-TYP4       TO ACATBNK-ADD (8)             CAT814DB
           MOVE W-TYP9-ADD-TO-TYP4       TO ACATBNK-ADD (9).            CAT814DB
                                                                        CAT814DB
       5700-EXIT. EXIT.                                                 CAT814DB
      /                                                                 CAT814DB
       5900-STTL-ADJUSTMENT SECTION.                                    CAT814DB
      ***************************************************************** CAT814DB
      *  ON SETTLEMENT DATE OR GREATER,                                 CAT814DB
      *  WHEN PENDING AMOUNT = ZERO, AND TYPE 4 > ZERO                  CAT814DB
      *  IF TYPE 4 > ZERO, MOVE TYPE 4 TO TYPE 1.                       CAT814DB
      ***************************************************************** CAT814DB
           MOVE '5900-STTL-ADJUSTMENT        ' TO W-ROUTINE-1.          CAT814DB
                                                                        CAT814DB
           INITIALIZE W-CALC-FIELDS                                     CAT814DB
                                                                        CAT814DB
TEST=>     IF  L-TEST = 'Y' AND W-PROCESS-THIS-ACCT-IND = 'Y'           CAT814DB
TEST=>         IF  W-INFILE-CNT-1 = '1' OR '3' OR '5' OR '7' OR '9'     CAT814DB
TEST=>             ADD  -1000            TO W-BAL-TYPE4                 CAT814DB
TEST=>                                      ACATBNK-BAL-AMT (4)         CAT814DB
TEST=>         ELSE                                                     CAT814DB
TEST=>             ADD  -2000            TO W-BAL-TYPE4                 CAT814DB
TEST=>                                      ACATBNK-BAL-AMT (4)         CAT814DB
TEST=>         END-IF                                                   CAT814DB
TEST=>         MOVE W-BAL-TYPE4      TO W-BAL-TYPE4-DISPLAY             CAT814DB
TEST=>         DISPLAY '   TEST-TYPE4=' W-BAL-TYPE4-DISPLAY             CAT814DB
TEST=>     END-IF                                                       CAT814DB
                                                                        CAT814DB
      *                                                                 CAT814DB
      *--REVERSE THE SIGN                                               CAT814DB
      *                                                                 CAT814DB
           MULTIPLY ACATBNK-BAL-AMT (1) BY -1 GIVING W-AMT-TYP1         CAT814DB
           MULTIPLY ACATBNK-BAL-AMT (2) BY -1 GIVING W-AMT-TYP2         CAT814DB
           MULTIPLY ACATBNK-BAL-AMT (3) BY -1 GIVING W-AMT-TYP3         CAT814DB
           MULTIPLY ACATBNK-BAL-AMT (4) BY -1 GIVING W-AMT-TYP4         CAT814DB
           MULTIPLY ACATBNK-BAL-AMT (5) BY -1 GIVING W-AMT-TYP5         CAT814DB
           MULTIPLY ACATBNK-BAL-AMT (6) BY -1 GIVING W-AMT-TYP6         CAT814DB
           MULTIPLY ACATBNK-BAL-AMT (7) BY -1 GIVING W-AMT-TYP7         CAT814DB
           MULTIPLY ACATBNK-BAL-AMT (8) BY -1 GIVING W-AMT-TYP8         CAT814DB
           MULTIPLY ACATBNK-BAL-AMT (9) BY -1 GIVING W-AMT-TYP9         CAT814DB
                                                                        CAT814DB
           IF  ACATBNK-PENDING-AMT = 0                                  CAT814DB
               ADD 1 TO W-AMT-IS-ZERO-CNT                               CAT814DB
           ELSE                                                         CAT814DB
               ADD 1 TO W-AMT-NOT-ZERO-CNT                              CAT814DB
           END-IF                                                       CAT814DB
                                                                        CAT814DB
           MOVE ACATBNK-PENDING-AMT      TO W-PEND-AMT.                 CAT814DB
                                                                        CAT814DB
           IF  W-PEND-AMT NOT = 0                                       CAT814DB
               MOVE W-PEND-AMT TO W-AMT-DISPLAY                         CAT814DB
               DISPLAY '   PEND=' W-AMT-DISPLAY ' (NOT ZERO). BYPASSED.'CAT814DB
               GO TO 5900-CONTINUE                                      CAT814DB
           END-IF                                                       CAT814DB
      *                                                                 CAT814DB
      *--CHECK TYPE4                                                    CAT814DB
      *                                                                 CAT814DB
      *-------(TYPE4 > 0 AND > PEND)                                    CAT814DB
           IF   W-PEND-AMT = 0                                          CAT814DB
                MOVE W-AMT-TYP4          TO W-AMT-DISPLAY-2             CAT814DB
                MOVE W-PEND-AMT          TO W-AMT-DISPLAY               CAT814DB
                DISPLAY '   TYP4=' W-AMT-DISPLAY-2                      CAT814DB
                          ' PEND=' W-AMT-DISPLAY                        CAT814DB
           END-IF.                                                      CAT814DB
                                                                        CAT814DB
           IF  W-AMT-TYP4 GREATER 0                                     CAT814DB
               MOVE    W-AMT-TYP4         TO W-REMOVE-FROM-TYP4         CAT814DB
               MOVE    W-AMT-TYP4         TO W-TYP4-ADD-TO-TYP1         CAT814DB
               MOVE 'Y' TO W-TYP4-IND                                   CAT814DB
               DISPLAY '     (TYPE4 > 0 AND PEND=0)'                    CAT814DB
           END-IF.                                                      CAT814DB
                                                                        CAT814DB
       5900-CONTINUE.                                                   CAT814DB
                                                                        CAT814DB
           MOVE W-REMOVE-FROM-TYP1       TO ACATBNK-REMOVE (1)          CAT814DB
           MOVE W-REMOVE-FROM-TYP2       TO ACATBNK-REMOVE (2)          CAT814DB
           MOVE W-REMOVE-FROM-TYP3       TO ACATBNK-REMOVE (3)          CAT814DB
           MOVE W-REMOVE-FROM-TYP4       TO ACATBNK-REMOVE (4)          CAT814DB
           MOVE W-REMOVE-FROM-TYP5       TO ACATBNK-REMOVE (5)          CAT814DB
           MOVE W-REMOVE-FROM-TYP6       TO ACATBNK-REMOVE (6)          CAT814DB
           MOVE W-REMOVE-FROM-TYP7       TO ACATBNK-REMOVE (7)          CAT814DB
           MOVE W-REMOVE-FROM-TYP8       TO ACATBNK-REMOVE (8)          CAT814DB
           MOVE W-REMOVE-FROM-TYP9       TO ACATBNK-REMOVE (9)          CAT814DB
                                                                        CAT814DB
           MOVE W-TYP1-ADD-TO-TYP4       TO ACATBNK-ADD (1)             CAT814DB
           MOVE W-TYP2-ADD-TO-TYP4       TO ACATBNK-ADD (2)             CAT814DB
           MOVE W-TYP3-ADD-TO-TYP4       TO ACATBNK-ADD (3)             CAT814DB
           MOVE W-TYP4-ADD-TO-TYP1       TO ACATBNK-ADD (4)             CAT814DB
           MOVE W-TYP5-ADD-TO-TYP4       TO ACATBNK-ADD (5)             CAT814DB
           MOVE W-TYP6-ADD-TO-TYP4       TO ACATBNK-ADD (6)             CAT814DB
           MOVE W-TYP7-ADD-TO-TYP4       TO ACATBNK-ADD (7)             CAT814DB
           MOVE W-TYP8-ADD-TO-TYP4       TO ACATBNK-ADD (8)             CAT814DB
           MOVE W-TYP9-ADD-TO-TYP4       TO ACATBNK-ADD (9).            CAT814DB
                                                                        CAT814DB
       5900-EXIT. EXIT.                                                 CAT814DB
      /                                                                 CAT814DB
       6000-GETBNKM SECTION.                                            CAT814DB
           MOVE '6000-GETBNKM                  ' TO W-ROUTINE-1.        CAT814DB
                                                                        CAT814DB
           MOVE ' '                      TO W-PROCESS-THIS-ACCT-IND     CAT814DB
           MOVE 'N'                      TO ACM-ACCT-PROCESS-IND.       CAT814DB
           MOVE +0                       TO PENDING-AUTH-AMOUNT.        CAT814DB
           MOVE ' '                      TO W-BNK-CHECKING-STATUS       CAT814DB
           MOVE ' '                      TO W-BNK-DEBIT-CARD-STATUS     CAT814DB
           MOVE ' '                      TO BNK-MAST-RECORD             CAT814DB
           MOVE ' '                      TO GETBNKM-RETURN-CODE         CAT814DB
                                                                        CAT814DB
           EVALUATE TRUE                                                CAT814DB
               WHEN GETBNKM-OPEN                                        CAT814DB
                 MOVE '2'                TO  GETBNKM-MODE               CAT814DB
                 MOVE ' '                TO  GETBNKM-LAST-RECORD-ACTION CAT814DB
                 MOVE '3'                TO  GETBNKM-DATE-CHECK         CAT814DB
                 IF  L-GETBNKM-DATE-CHECK = '1' OR '2' OR '3'           CAT814DB
                     MOVE L-GETBNKM-DATE-CHECK TO GETBNKM-DATE-CHECK    CAT814DB
                 END-IF                                                 CAT814DB
                 MOVE W-PGM-NAME         TO  GETBNKM-PROGRAM-NAME       CAT814DB
                 MOVE LOW-VALUES         TO  GETBNKM-MAST-KEY           CAT814DB
                 MOVE 0                  TO  GETBNKM-FORMAT-IDENTIFIER  CAT814DB
               WHEN GETBNKM-PROCESS                                     CAT814DB
                 MOVE WF-CLIENT-NBR (2:3) TO GETBNKM-CLIENT             CAT814DB
                 MOVE W-BR-X             TO  GETBNKM-BRANCH             CAT814DB
                 MOVE W-ACCT-X           TO  GETBNKM-ACCT               CAT814DB
                 MOVE B1-CAM-BANK-MASTER-FORMAT(B1-SUB)                 CAT814DB
                                         TO  GETBNKM-FORMAT-IDENTIFIER  CAT814DB
               WHEN GETBNKM-CLOSE                                       CAT814DB
                 MOVE HIGH-VALUES        TO  GETBNKM-MAST-KEY           CAT814DB
                 MOVE 0                  TO  GETBNKM-FORMAT-IDENTIFIER  CAT814DB
           END-EVALUATE.                                                CAT814DB
                                                                        CAT814DB
           CALL  GETBNKM              USING  GETBNKM-PARAMETERS         CAT814DB
                                             BNK-MAST-RECORD            CAT814DB
           END-CALL.                                                    CAT814DB
                                                                        CAT814DB
           EVALUATE TRUE                                                CAT814DB
               WHEN GETBNKM-OPEN                                        CAT814DB
                    IF  NOT  GETBNKM-ACTION-COMPLETE                    CAT814DB
                        DISPLAY 'GETBNKM OPEN FILE ERROR, STATUS = '    CAT814DB
                        GETBNKM-FILE-STATUS                             CAT814DB
                        DISPLAY 'CAT814DB: U3301 - ABENDING ON GETBNKM' CAT814DB
                        MOVE +3301 TO ABEND-CD                          CAT814DB
                        CALL  ABEND  USING ABEND-CD                     CAT814DB
                    END-IF                                              CAT814DB
               WHEN GETBNKM-PROCESS                                     CAT814DB
                    IF  GETBNKM-NOT-FOUND        OR                     CAT814DB
                        GETBNKM-EOF                                     CAT814DB
                        CONTINUE                                        CAT814DB
                    ELSE                                                CAT814DB
                      IF  GETBNKM-ACTION-COMPLETE                       CAT814DB
                          SET  ACM-ACCT-PROCESS   TO  TRUE              CAT814DB
                      ELSE                                              CAT814DB
                        DISPLAY 'GETBNKM PROCESS FILE ERROR, STATUS = ' CAT814DB
                        GETBNKM-FILE-STATUS                             CAT814DB
                        DISPLAY 'CAT814DB: U3302 - ABENDING ON GETBNKM' CAT814DB
                        MOVE +3302 TO ABEND-CD                          CAT814DB
                        CALL  ABEND  USING ABEND-CD                     CAT814DB
                      END-IF                                            CAT814DB
                    END-IF                                              CAT814DB
               WHEN GETBNKM-CLOSE                                       CAT814DB
                    IF  NOT  GETBNKM-ACTION-COMPLETE                    CAT814DB
                        DISPLAY 'GETBNKM CLOSE FILE ERROR, STATUS = '   CAT814DB
                        GETBNKM-FILE-STATUS                             CAT814DB
                        DISPLAY 'CAT814DB: U3303 - ABENDING ON GETBNKM' CAT814DB
                        MOVE +3303 TO ABEND-CD                          CAT814DB
                        CALL  ABEND  USING ABEND-CD                     CAT814DB
                    END-IF                                              CAT814DB
           END-EVALUATE.                                                CAT814DB
                                                                        CAT814DB
       6000-EXIT. EXIT.                                                 CAT814DB
      /                                                                 CAT814DB
       7100-WRITE-ACATBNK       SECTION.                                CAT814DB
           MOVE '7100-WRITE-ACATBNK               ' TO W-ROUTINE-1.     CAT814DB
                                                                        CAT814DB
           WRITE ACATBNK-RECORD.                                        CAT814DB
           ADD 1 TO W-OUTFILE-CNT                                       CAT814DB
           ADD 1 TO W-ACATBNK-CNT.                                      CAT814DB
                                                                        CAT814DB
       7100-EXIT. EXIT.                                                 CAT814DB
      /                                                                 CAT814DB
       8100-SQL-COMMIT     SECTION.                                     CAT814DB
                                                                        CAT814DB
           EXEC SQL COMMIT                                              CAT814DB
           END-EXEC                                                     CAT814DB
                                                                        CAT814DB
           MOVE SQLCA   TO COMMIT-SQLCA                                 CAT814DB
           MOVE SQLCODE TO COMMIT-RETURN                                CAT814DB
                                                                        CAT814DB
           IF  COMMIT-AB                                                CAT814DB
               DISPLAY 'CAT814DB: '                                     CAT814DB
                   'SQL COMMIT FAILED. COMMIT-RETURN= '                 CAT814DB
                    COMMIT-RETURN                                       CAT814DB
                  ' INFILE-CNT= '           W-INFILE-CNT                CAT814DB
                    ' PREV-CNT= '           W-LAST-COMMIT-INFILE-CNT    CAT814DB
           ELSE                                                         CAT814DB
               CONTINUE                                                 CAT814DB
           END-IF.                                                      CAT814DB
                                                                        CAT814DB
           MOVE W-INFILE-CNT             TO W-LAST-COMMIT-INFILE-CNT.   CAT814DB
                                                                        CAT814DB
       8100-EXIT. EXIT.                                                 CAT814DB
      /                                                                 CAT814DB
       8300-DISPLAY-KEY    SECTION.                                     CAT814DB
           DISPLAY '    KEY:'                                           CAT814DB
                                ' CLT=' WF-CLIENT-NBR                   CAT814DB
                                ' CTL=' WF-ACAT-CONTROL-NBR             CAT814DB
                                ' TFR=' WF-TRNFR-TYPE-CD                CAT814DB
                                ' TRN=' WF-TRANS-TYPE-CD                CAT814DB
           DISPLAY '   '                                                CAT814DB
                                ' DLV=' WF-DLVR-NBR                     CAT814DB
                             ' DLV-AC=' WF-ACCT-DLVR-NBR                CAT814DB
                                ' RCV=' WF-RCV-NBR                      CAT814DB
                             ' RCV-AC=' WF-ACCT-RCV-NBR                 CAT814DB
           .                                                            CAT814DB
       8300-EXIT. EXIT.                                                 CAT814DB
      /                                                                 CAT814DB
       8500-SQL-ERROR      SECTION.                                     CAT814DB
           DISPLAY ' '                                                  CAT814DB
           DISPLAY '8500-SQL-ERROR'                                     CAT814DB
                  ' INFILE-CNT = ' W-INFILE-CNT                         CAT814DB
           ' LAST-COMMIT-INFILE-CNT = ' W-LAST-COMMIT-INFILE-CNT        CAT814DB
                                                                        CAT814DB
           DISPLAY ' '                                                  CAT814DB
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                  CAT814DB
                                    W-DB2-MESSAGE-LEN.                  CAT814DB
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                        CAT814DB
             UNTIL W-DB2-IDX GREATER THAN 12                            CAT814DB
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES              CAT814DB
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)               CAT814DB
                   END-IF                                               CAT814DB
           END-PERFORM.                                                 CAT814DB
           DISPLAY ' '                                                  CAT814DB
                                                                        CAT814DB
           PERFORM 8700-SQL-ROLLBACK THRU 8700-EXIT                     CAT814DB
                                                                        CAT814DB
           DISPLAY 'CAT814DB: U3999 - ABENDING ON BAD DB2 STATUS'       CAT814DB
           PERFORM 8900-DISPLAY-CNT THRU 8900-EXIT                      CAT814DB
           DISPLAY 'CAT814DB: PROGRAM ENDED ABNORMALLY'                 CAT814DB
           MOVE +3999 TO ABEND-CD                                       CAT814DB
           CALL  ABEND  USING ABEND-CD.                                 CAT814DB
                                                                        CAT814DB
       8500-EXIT. EXIT.                                                 CAT814DB
      /                                                                 CAT814DB
       8700-SQL-ROLLBACK   SECTION.                                     CAT814DB
           DISPLAY '8700-SQL-ROLLBACK'                                  CAT814DB
                  ' INFILE-CNT = ' W-INFILE-CNT                         CAT814DB
                  ' LAST-COMMIT-INFILE-CNT = '                          CAT814DB
                                            W-LAST-COMMIT-INFILE-CNT    CAT814DB
                                                                        CAT814DB
           EXEC SQL ROLLBACK WORK                                       CAT814DB
           END-EXEC                                                     CAT814DB
                                                                        CAT814DB
           MOVE SQLCA   TO ROLLBACK-SQLCA                               CAT814DB
           MOVE SQLCODE TO ROLLBACK-RETURN                              CAT814DB
                                                                        CAT814DB
           IF ROLLBACK-AB                                               CAT814DB
               DISPLAY                                                  CAT814DB
                   'AUTO ROLLBACK FAILED. ROLLBACK-RETURN = '           CAT814DB
                   ROLLBACK-RETURN                                      CAT814DB
           ELSE                                                         CAT814DB
               DISPLAY                                                  CAT814DB
                   'AUTO ROLLBACK SUCCESSFUL. ROLLBACK-RETURN = '       CAT814DB
                   ROLLBACK-RETURN                                      CAT814DB
           END-IF.                                                      CAT814DB
                                                                        CAT814DB
       8700-EXIT. EXIT.                                                 CAT814DB
      /                                                                 CAT814DB
       8900-DISPLAY-CNT   SECTION.                                      CAT814DB
           DISPLAY ' '                                                  CAT814DB
           DISPLAY 'CAT814DB: INFILE  COUNT      = ' W-INFILE-CNT       CAT814DB
                 ' (TRANSFER RECORDS FROM DATABASE)'                    CAT814DB
           DISPLAY 'CAT814DB: GETBNKM-CNT        = '                    CAT814DB
                                                     W-GETBNKM-CNT      CAT814DB
           DISPLAY 'CAT814DB: GETBNKM-FND-CNT    = '                    CAT814DB
                                                     W-GETBNKM-FND-CNT  CAT814DB
           DISPLAY 'CAT814DB: GETBNKM-NOT-FND-CNT= '                    CAT814DB
                                                 W-GETBNKM-NOT-FND-CNT  CAT814DB
           DISPLAY 'CAT814DB: VALID-CNT          = ' W-VALID-CNT        CAT814DB
           DISPLAY 'CAT814DB: NOT-VALID-CNT      = ' W-NOT-VALID-CNT    CAT814DB
           DISPLAY 'CAT814DB: W-AMT-NOT-ZERO-CNT = ' W-AMT-NOT-ZERO-CNT CAT814DB
           DISPLAY 'CAT814DB: W-AMT-IS-ZERO-CNT  = ' W-AMT-IS-ZERO-CNT  CAT814DB
           DISPLAY 'CAT814DB: W-REQ-DAY-1-CNT    = ' W-REQ-DAY-1-CNT    CAT814DB
           DISPLAY 'CAT814DB: W-SETTLE-CLOSE-CNT = ' W-SETTLE-CLOSE-CNT CAT814DB
           DISPLAY 'CAT814DB: BAL-READ-CNT       = ' W-BAL-CNT          CAT814DB
           DISPLAY 'CAT814DB: W-BAL-FND-CNT      = ' W-BAL-FND-CNT      CAT814DB
           DISPLAY 'CAT814DB: W-BAL-NOT-FND-CNT  = ' W-BAL-NOT-FND-CNT  CAT814DB
           DISPLAY 'CAT814DB: ACATBNK FILE COUNT = ' W-OUTFILE-CNT      CAT814DB
                 ' (INCLUDES HEADER AND TRAILER)'                       CAT814DB
           DISPLAY 'CAT814DB: ACATBNK DETAIL CNT = ' W-ACATBNK-CNT      CAT814DB
                 ' (EXCLUDES HEADER AND TRAILER)'                       CAT814DB
           .                                                            CAT814DB
       8900-EXIT. EXIT.                                                 CAT814DB
      /                                                                 CAT814DB
       9000-CLOSE-ROUTINE SECTION.                                      CAT814DB
           MOVE '9000-CLOSE-ROUTINE            ' TO W-ROUTINE-1.        CAT814DB
                                                                        CAT814DB
           DISPLAY ' '.                                                 CAT814DB
           MOVE ' '                      TO ACATBNK-TRL-REC             CAT814DB
           MOVE 'T'                      TO CP2-REQUEST-CODE.           CAT814DB
           MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.             CAT814DB
           MOVE W-ACATBNK-CNT            TO CP2-RECORD-COUNT.           CAT814DB
           MOVE 999                      TO CP2-CLIENT-NUMBER.          CAT814DB
                                                                        CAT814DB
           CALL  P2HDTR               USING CP2-AREA                    CAT814DB
                                            ACATBNK.                    CAT814DB
                                                                        CAT814DB
           MOVE CP2-RETURN-RECORD        TO ACATBNK-TRL-REC             CAT814DB
           DISPLAY 'CAT814DB: ACATBNK  TRAILER= ' ACATBNK-TRL-REC (1:90)CAT814DB
                                                                        CAT814DB
           WRITE ACATBNK-RECORD.                                        CAT814DB
           ADD 1 TO W-OUTFILE-CNT                                       CAT814DB
           DISPLAY 'CAT814DB: ACATBNK  TRAILER WRITTEN. STATUS = '      CAT814DB
                                             ACATBNK-FILE-STATUS.       CAT814DB
                                                                        CAT814DB
      *--CLOSE THE BANK MASTER FILE                                     CAT814DB
           MOVE  '3'                   TO  GETBNKM-REQUEST.             CAT814DB
           PERFORM 6000-GETBNKM THRU 6000-EXIT.                         CAT814DB
           DISPLAY 'CAT814DB: BANK MASTER CLOSED'                       CAT814DB
      *    CLOSE BALNC                                                  CAT814DB
           MOVE 'C' TO GETVBAL-FUNC.                                            
           PERFORM CALL-GETVBAL.                                                
           DISPLAY 'CAT814DB: BALNC    CLOSED. STATUS = '               CAT814DB
                                             BALNC-FILE-STATUS.         CAT814DB
                                                                        CAT814DB
           CLOSE ACATBNK                                                CAT814DB
           DISPLAY 'CAT814DB: ACATBNK  CLOSED. STATUS = '               CAT814DB
                                             ACATBNK-FILE-STATUS.       CAT814DB
                                                                        CAT814DB
           PERFORM 8900-DISPLAY-CNT THRU 8900-EXIT                      CAT814DB
           DISPLAY 'CAT814DB: PROGRAM ENDED SUCCESSFULLY'.              CAT814DB
                                                                        CAT814DB
       9000-EXIT. EXIT.                                                 CAT814DB
                                                                                
       CALL-GETVBAL.                                                            
           CALL GETVBAL USING GETVBAL-PARM.                                     
           MOVE GETVBAL-FILE-STATUS TO BALNC-FILE-STATUS                        
           IF GETVBAL-FILE = 'N'                                                
              MOVE GETVBAL-NEW-RECORD TO BAL-REC                                
           ELSE                                                                 
              MOVE GETVBAL-OLD-RECORD TO CMBL-CUSTOMER-BALANCE-SEGMENT.         
      *################################################################ CAT814DB
