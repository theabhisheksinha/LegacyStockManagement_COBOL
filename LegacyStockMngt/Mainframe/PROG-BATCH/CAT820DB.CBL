000001* PDX    - CAT820DB C0361186 12/26/14 09:37:47 TBLAMUR            00001000
LRM009* SSS 103323 PAPER STATEMENT FEE, UPDATE ON VTRNFR.                       
000001* PDX    - CAT820DB C0348502 01/13/14 08:07:31 TBLAMUR            00001000
LRM008* SSS 90715 CORRECT DB2 VTRNFR SELECT TO PREVENT INSERT BUG -180          
LRM008*  WHEN INSERTING REJECT FOR FLAT ON ACTITRF.                             
000001* PDX    - CAT820DB C0317345 10/26/11 12:09:03 TBLAMUR            00001000
LRM007* SSR 79096 80728 RECOMPILE ONLY DUE TO ACATDLVF ACATCSHA CHANGE          
000001* PDX    - CAT820DB C0296621 08/24/10 10:23:58 TBLAMUR            00001000
LRM006* SSR 71810 FOREIGN FEE - UPDATE NEW COL ON VTRNFR                CAT820DB
000001* PDX    - CAT820DB C0270214 10/20/08 13:21:57 TBLAMUR            00001000
000001* PDX    - CAT820DB C0269981 09/08/08 11:06:49 TBLAMUR            00001000
LRM005* TASK 60418 CORRECT OLMI ACTIAST INSERT.                         CAT820DB
000001* PDX    - CAT820DB C0266342 08/11/08 15:24:00 TBDOJUN            00001000
000001* DJ0001 SSR#55644 REJECT IF ACCT IS FLAT AS A RESULT OF FEES     CAT820DB
000001* DJ0001 SET FLAT INDICATOR "'D" FOR ACCT FLAT RESULT OF FEES     CAT820DB
000001* DJ0001 IF THERE IS ONE DEBIT BALANCE OR NO ASSETS, REJECT.      CAT820DB
000001* PDX    - CAT820DB C0260091 04/30/08 10:55:43 TBLAMUR            CAT820DB
LRM004* SSR 55766 ASCENDIS(WORKFLOW) EXTRACT OLMI DETAILS ON MATH FILE. CAT820DB
LRM004*        - CREATE ASSETS WITH ACK-IND = A FOR ASCENDIS CLINET.    CAT820DB
000001* PDX    - CAT820DB C0210131 05/06/05 16:27:01 TBLAMUR            CAT820DB
LRM002* SSR 39561 PHASE-II EXPECT PTR ADJUSTMENTS (HANDLE LIKE RCR)     CAT820DB
000001* PDX    - CAT820DB C0215263 03/02/05 09:59:17 TBLAMUR            CAT820DB
LRM001* SSR 40042 REPLACE DB2 INIT TBL WITH ACTI*** NEW KEY STRUCTURE.  CAT820DB
000001* PDX    - CAT820DB C0155408 03/07/01 12:53:01 TBLAMUR            CAT820DB
000001* PDX    - CAT820DB C0132423 10/08/99 11:01:00 TBLAMUR            CAT820DB
000001* PDX    - CAT820DB C0126230 07/28/99 08:45:41 TBLAMUR            CAT820DB
000001* PDX    - CAT820DB C0126027 05/17/99 15:57:17 TBLAMUR            CAT820DB
000001* PDX    - CAT820DB C0125133 05/17/99 13:02:22 TBLAMUR            CAT820DB
000001* PDX    - CAT820DB C0124738 04/29/99 14:14:17 TBLAMUR            CAT820DB
000001* PDX    - CAT820DB C0124942 04/24/99 18:42:57 TBDOJUN            CAT820DB
000001* PDX    - CAT820DB C0123087 04/12/99 07:46:25 TBLAMUR            CAT820DB
000001* PDX    - CAT820DB C0122134 02/22/99 14:25:57 TBLAMUR            CAT820DB
000001* PDX    - CAT820DB C0122063 02/20/99 16:50:16 TBLAMUR            CAT820DB
000001* PDX    - CAT820DB C0121216 02/10/99 17:57:32 TBLAMUR            CAT820DB
000001* PDX    - CAT820DB C0121209 02/03/99 21:44:30 TBLAMUR            CAT820DB
000001* PDX    - CAT820DB C0118497 12/08/98 13:51:30 TBLAMUR            CAT820DB
000001* PDX    - CAT820DB C0115132 11/12/98 17:21:01 TBLAMUR            CAT820DB
       IDENTIFICATION DIVISION.                                         CAT820DB
       PROGRAM-ID.  CAT820DB.                                           CAT820DB
                                                                        CAT820DB
      ***************************************************************** CAT820DB
      * THIS PROGRAM CONTAINS DB2.                                    * CAT820DB
      ***************************************************************** CAT820DB
      *-------------------------------------------------------------*   CAT820DB
      *  THE PURPOSE OF THIS PROGRAM IS TO UPDATE TRANSFER FEES FOR     CAT820DB
      *    ACTIVE TRANSFERS AND ADJUST CASH AMOUNT ON THE INITIAL ASSET.CAT820DB
      *    AN EXTRACT FILE FROM CAT820 PASSES THESE VALUES.             CAT820DB
      * 04/23/99 NEW FUNCTION ADDED TO PROCESS RCR RECORDS FROM CAT820. CAT820DB
      *    UPDATE CASH ONLY WHEN INITIAL TRANSFER RCR IS EXISTS.        CAT820DB
      * 05/13/99 READ OTHER ASSET TO OBTIAN NSCC PEND CODE FOR PARTIALS.CAT820DB
      *    ADD NEW FILE FROM MARGIN INTEREST TO ADJUST AMOUNTS.         CAT820DB
      *-------------------------------------------------------------*   CAT820DB
                                                                        CAT820DB
       ENVIRONMENT DIVISION.                                            CAT820DB
                                                                        CAT820DB
       INPUT-OUTPUT SECTION.                                            CAT820DB
       FILE-CONTROL.                                                    CAT820DB
                                                                        CAT820DB
           SELECT CASH-ADJUSTMENT-FILE      ASSIGN CASHADJ.             CAT820DB
           SELECT NON-ACAT-ADJUSTMENT-FILE  ASSIGN OTHADJ.              CAT820DB
LRM004     SELECT MATH-FILE                 ASSIGN CATMATH.             CAT820DB
                                                                        CAT820DB
       DATA DIVISION.                                                   CAT820DB
       FILE SECTION.                                                    CAT820DB
       FD  CASH-ADJUSTMENT-FILE                                         CAT820DB
           RECORDING MODE IS F                                          CAT820DB
           LABEL RECORDS STANDARD                                       CAT820DB
           BLOCK CONTAINS 0 RECORDS.                                    CAT820DB
       COPY ACATCSHA REPLACING ==:FMT:== BY ==FD==.                     CAT820DB
                                                                        CAT820DB
       FD  NON-ACAT-ADJUSTMENT-FILE                                     CAT820DB
           RECORDING MODE IS F                                          CAT820DB
           LABEL RECORDS STANDARD                                       CAT820DB
           BLOCK CONTAINS 0 RECORDS.                                    CAT820DB
       COPY ACATCSHB REPLACING ==:FMT:== BY ==OTH==.                    CAT820DB
LRM004 FD  MATH-FILE                                                    CAT820DB
LRM004     RECORDING MODE IS F                                          CAT820DB
LRM004     LABEL RECORDS STANDARD                                       CAT820DB
LRM004     BLOCK CONTAINS 0 RECORDS.                                    CAT820DB
LRM004 COPY CATMATH REPLACING ==:CATMATH:== BY ==CATMATH==.             CAT820DB
      ****************************************************************  CAT820DB
           EJECT                                                        CAT820DB
       WORKING-STORAGE SECTION.                                         CAT820DB
           COPY PDXIDCOB.                                               CAT820DB
                                                                        CAT820DB
       01  FILE-STATUS-FIELDS.                                          CAT820DB
           05  CASH-FILE-STATUS           PIC X    VALUE 'N'.           CAT820DB
               88  CASH-EOF                        VALUE 'Y'.           CAT820DB
           05  OTHER-ADJ-FILE-STATUS      PIC X    VALUE 'N'.           CAT820DB
               88  OTHER-ADJ-EOF                   VALUE 'Y'.           CAT820DB
                                                                        CAT820DB
       01  WORK-FIELDS.                                                 CAT820DB
           05  PGM-NME                 PIC X(8)  VALUE 'CAT820DB'.      CAT820DB
           05  WS-CLIENT-NBR           PIC X(04).                       CAT820DB
           05  WS-CURRENT-CASH         PIC S9(15)V99 COMP-3 VALUE ZERO. CAT820DB
           05  WS-TIMESTAMP            PIC X(26).                       CAT820DB
           05  W-VTRNFR-UPD-CNT        PIC 9(7) COMP-3 VALUE ZERO.      CAT820DB
           05  W-VTRNFR-NOT-UPD-CNT    PIC 9(7) COMP-3 VALUE ZERO.      CAT820DB
DJ0001     05  W-ACTITRF-ADD-CNT       PIC 9(7) COMP-3 VALUE ZERO.      CAT820DB
           05  W-ACTITRF-UPD-CNT       PIC 9(7) COMP-3 VALUE ZERO.      CAT820DB
           05  W-ACTIAST-ADD-CNT       PIC 9(7) COMP-3 VALUE ZERO.      CAT820DB
           05  W-ACTIAST-UPD-CNT       PIC 9(7) COMP-3 VALUE ZERO.      CAT820DB
           05  W-ACTIAST-DEL-CNT       PIC 9(7) COMP-3 VALUE ZERO.      CAT820DB
           05  FILLER                  PIC  X(008) VALUE 'INPUTCNT'.    CAT820DB
           05  W-INFILE-CNT            PIC  9(009) VALUE 0.             CAT820DB
LRM004     05  W-MATH-RECS-WRTN        PIC  9(009) VALUE 0.             CAT820DB
           05  ABEND-CD                PIC  9(004) COMP SYNC VALUE 0.   CAT820DB
           05  DUMP-SW                 PIC  X(001) VALUE 'D'.           CAT820DB
           05  CASH-NET-ADJUSTMENT     PIC S9(15)V99 COMP-3 VALUE +0.   CAT820DB
           05  WS-STTLM-LCTN-CD        PIC X(02)  VALUE SPACES.         CAT820DB
           05  WS-CSH-MGN-SHRT-CD      PIC X      VALUE SPACES.         CAT820DB
           05  WS-ACTITRF-FND-SW       PIC X      VALUE SPACES.         CAT820DB
               88 INITIAL-TRNFR-NOT-FOUND         VALUE 'N'.            CAT820DB
               88 INITIAL-TRNFR-FOUND             VALUE 'Y'.            CAT820DB
           05  WS-BRANCH-CD            PIC X(3).                        CAT820DB
           05  WS-ACCT-CD              PIC X(5).                        CAT820DB
DJ0001     05  WS-PREVIOUS-CASH        PIC S9(15)V99 COMP-3 VALUE ZERO. CAT820DB
DJ0001     05  W-PREVIOUS-DISPLAY      PIC ZZZZZZZ9.99-.                CAT820DB
DJ0001     05  W-ADJUST-DISPLAY        PIC ZZZZZ9.99-.                  CAT820DB
DJ0001     05  W-ASSET-AMT-DISPLAY     PIC ZZZZZZZ9.99-.                CAT820DB
DJ0001     05  W-ACTIAST-ROW-CNT       PIC S9(4) COMP VALUE +0.         CAT820DB
           COPY STUBCPY.                                                CAT820DB
                                                                        CAT820DB
           EJECT                                                        CAT820DB
       COPY ACATCSHA REPLACING ==:FMT:== BY ==CASH==.                   CAT820DB
           EJECT                                                        CAT820DB
       COPY BHINFO.                                                     CAT820DB
       EJECT                                                            CAT820DB
       COPY BHACAT.                                                     CAT820DB
       EJECT                                                            CAT820DB
      *---------------------------------------------------------------- CAT820DB
      *  DB2 DATABASE WORKAREA.                                         CAT820DB
      *---------------------------------------------------------------- CAT820DB
           EXEC SQL                                                     CAT820DB
           INCLUDE SQLCA                                                CAT820DB
           END-EXEC                                                     CAT820DB
                                                                        CAT820DB
      *---------------------------------------------------------------- CAT820DB
      * DB2 ERROR MESSAGE AREA                                         *CAT820DB
      *---------------------------------------------------------------- CAT820DB
       01  DSNTIAR                       PIC X(008) VALUE 'DSNTIAR'.    CAT820DB
       01  W-DB2-MESSAGE-AREA.                                          CAT820DB
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.    CAT820DB
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES     CAT820DB
                   INDEXED BY W-DB2-IDX.                                CAT820DB
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.     CAT820DB
                                                                        CAT820DB
       01  W-DB2-WORKAREA.                                              CAT820DB
           05  ROLLBACK-SQLCA            PIC  X(122).                   CAT820DB
           05  ROLLBACK-RETURN           PIC S9(009) COMP.              CAT820DB
               88  ROLLBACK-OK                VALUE +0.                 CAT820DB
               88  ROLLBACK-AB                VALUE -999 THRU -1        CAT820DB
                                                    +1   THRU +999.     CAT820DB
           05  COMMIT-SQLCA              PIC  X(122).                   CAT820DB
           05  COMMIT-RETURN             PIC S9(009) COMP.              CAT820DB
               88  COMMIT-OK                  VALUE +0.                 CAT820DB
               88  COMMIT-AB                  VALUE -999 THRU -1        CAT820DB
                                                    +1   THRU +999.     CAT820DB
           05  W-COMMIT-CTR              PIC  9(009) COMP-3             CAT820DB
                                              VALUE 0.                  CAT820DB
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(011) VALUE 0.           CAT820DB
           05  W-DB2-TABLE-NAME          PIC  X(008).                   CAT820DB
           05  W-DB2-ACTION              PIC  X(008).                   CAT820DB
           05  W-DB2-SQLCODE             PIC ---9.                      CAT820DB
                                                                        CAT820DB
      *DCLGEN FOR INITIAL ACAT TRANSFER                                 CAT820DB
           EXEC SQL                                                     CAT820DB
               INCLUDE ACTITRF                                          CAT820DB
           END-EXEC.                                                    CAT820DB
                                                                        CAT820DB
      *DCLGEN FOR INITIAL ACAT ASSET                                    CAT820DB
           EXEC SQL                                                     CAT820DB
               INCLUDE ACTIAST                                          CAT820DB
           END-EXEC.                                                    CAT820DB
                                                                        CAT820DB
      *DCLGEN FOR ACTIVE ACAT TRANSFER                                  CAT820DB
           EXEC SQL                                                     CAT820DB
               INCLUDE VTRNFR                                           CAT820DB
           END-EXEC.                                                    CAT820DB
                                                                        CAT820DB
                                                                        CAT820DB
      * DECLARE CURSOR TO OBTAIN ALL AT RECORDS FOR THIS CONTROL NBR    CAT820DB
           EXEC SQL                                                     CAT820DB
              DECLARE ACTIAST_CRSR CURSOR FOR                           CAT820DB
                 SELECT                                                 CAT820DB
                    NSCC_PEND_CD                                        CAT820DB
                 FROM ACTIAST                                           CAT820DB
              WHERE CLIENT_NBR  = :WS-CLIENT-NBR                        CAT820DB
               AND  ACAT_CONTROL_NBR = :CASH-CONTROL-NBR                CAT820DB
           END-EXEC.                                                    CAT820DB
                                                                        CAT820DB
      * DECLARE CURSOR TO OBTAIN ALL AT RECORDS FOR THIS TIF            CAT820DB
           EXEC SQL                                                     CAT820DB
              DECLARE ACTIAST_CRSR2 CURSOR FOR                          CAT820DB
                 SELECT                                                 CAT820DB
                    NSCC_PEND_CD                                        CAT820DB
                 FROM ACTIAST                                           CAT820DB
              WHERE CLIENT_NBR  = :WS-CLIENT-NBR                        CAT820DB
                AND DLVR_NBR     = :CASH-DLVR-NBR                       CAT820DB
                AND ACCT_DLVR_NBR  = :CASH-DLVR-ACCT                    CAT820DB
                AND RCV_NBR      = :CASH-RCV-NBR                        CAT820DB
                AND ACCT_RCV_NBR = :CASH-RCV-ACCT                       CAT820DB
                AND TRNFR_TYPE_CD = :CASH-TRNFR-TYPE-CD                 CAT820DB
LRM001          AND ACAT_CONTROL_NBR = '              '                 CAT820DB
           END-EXEC.                                                    CAT820DB
                                                                        CAT820DB
      * DECLARE CURSOR TO OBTAIN TRANSFER FOR THIS CLIENT-BR-AC         CAT820DB
           EXEC SQL                                                     CAT820DB
              DECLARE VTRNFR_CRSR CURSOR FOR                            CAT820DB
                 SELECT                                                 CAT820DB
                    DLVR_NBR                                            CAT820DB
                   ,ACCT_DLVR_NBR                                       CAT820DB
                   ,RCV_NBR                                             CAT820DB
                   ,ACCT_RCV_NBR                                        CAT820DB
                   ,TRNFR_TYPE_CD                                       CAT820DB
                   ,ACAT_CONTROL_NBR                                    CAT820DB
                 FROM VTRNFR                                            CAT820DB
              WHERE CLIENT_NBR  = :WS-CLIENT-NBR                        CAT820DB
                AND BRANCH_CD   = :WS-BRANCH-CD                         CAT820DB
                AND ACCT_CD     = :WS-ACCT-CD                           CAT820DB
           END-EXEC.                                                    CAT820DB
                                                                        CAT820DB
           SKIP3                                                        CAT820DB
       LINKAGE SECTION.                                                 CAT820DB
           SKIP1                                                        CAT820DB
       01  PARM-AREA.                                                   CAT820DB
           05  PARM-LENGTH            PIC S9(4)    COMP.                CAT820DB
           05  PARM-RESTART-IND       PIC X(03).                        CAT820DB
               88  PARM-RESTART          VALUE 'YES'.                   CAT820DB
                88 PARM-RESTART-OTHER    VALUE 'OTH'.                   CAT820DB
           05  FILLER                 PIC X.                            CAT820DB
           05  PARM-RESTART-KEY       PIC X(17).                        CAT820DB
DJ0001     05  FILLER                 PIC X.                            CAT820DB
DJ0001     05  PARM-RUN-MODE          PIC X(3).                         CAT820DB
DJ0001         88  PARM-INTRA-DAY              VALUE 'ID.'.             CAT820DB
DJ0001         88  PARM-NIGHT-RUN              VALUE LOW-VALUES.        CAT820DB
                                                                        CAT820DB
                                                                        CAT820DB
           EJECT                                                        CAT820DB
       PROCEDURE DIVISION  USING PARM-AREA.                             CAT820DB
           COPY MSGCOBO.                                                CAT820DB
                                                                        CAT820DB
           OPEN INPUT CASH-ADJUSTMENT-FILE.                             CAT820DB
           OPEN INPUT NON-ACAT-ADJUSTMENT-FILE.                         CAT820DB
LRM004     OPEN OUTPUT MATH-FILE.                                       CAT820DB
                                                                        CAT820DB
DJ0001     DISPLAY 'PARM-RUN-MODE = ' PARM-RUN-MODE                     CAT820DB
DJ0001           ' ("ID."=INTRA-DAY/"LOW-VALUES"=NIGHT-RUN) '           CAT820DB
                                                                        CAT820DB
           IF PARM-RESTART                                              CAT820DB
              DISPLAY 'PARM RESTART FOUND '                             CAT820DB
              DISPLAY 'PARM KEY X(17) = ' PARM-RESTART-KEY              CAT820DB
              PERFORM UNTIL CASH-EOF                                    CAT820DB
                     OR CASH-DETAIL-KEY(1 : 17) = PARM-RESTART-KEY      CAT820DB
                 READ CASH-ADJUSTMENT-FILE INTO CASH-DETAIL-RECORD      CAT820DB
                    AT END                                              CAT820DB
                     SET CASH-EOF TO TRUE                               CAT820DB
                 END-READ                                               CAT820DB
LRM004           IF NOT CASH-EOF                                        CAT820DB
LRM004           AND CASH-DETAIL-KEY(1 : 4) = 'DATE'                    CAT820DB
LRM004              MOVE CASH-DETAIL-RECORD TO CATMATH-HEADER-RECORD    CAT820DB
LRM004              MOVE 'CAT820DB' TO CATMATH-HDR-PGM-NAME             CAT820DB
LRM004              WRITE CATMATH-RECORD                                CAT820DB
LRM004           END-IF                                                 CAT820DB
              END-PERFORM                                               CAT820DB
              IF NOT CASH-EOF                                           CAT820DB
                 DISPLAY 'SUCCESSFULLY LOCATED PARM RESTART RECORD'     CAT820DB
              ELSE                                                      CAT820DB
                 DISPLAY 'RESTART REACHED EOF. RESART-KEY NOT FOUND'    CAT820DB
                 DISPLAY 'PROGARM CAT820DB ABENDS '                     CAT820DB
                 MOVE +1000 TO ABEND-CD                                 CAT820DB
                 CALL  ABEND  USING ABEND-CD                            CAT820DB
           END-IF.                                                      CAT820DB
                                                                        CAT820DB
           READ CASH-ADJUSTMENT-FILE INTO CASH-DETAIL-RECORD            CAT820DB
              AT END                                                    CAT820DB
                 SET CASH-EOF TO TRUE.                                  CAT820DB
                                                                        CAT820DB
LRM004     IF NOT CASH-EOF                                              CAT820DB
LRM004     AND CASH-DETAIL-KEY(1 : 4) = 'DATE'                          CAT820DB
LRM004        MOVE CASH-DETAIL-RECORD TO CATMATH-HEADER-RECORD          CAT820DB
LRM004        MOVE 'CAT820DB' TO CATMATH-HDR-PGM-NAME                   CAT820DB
LRM004        WRITE CATMATH-RECORD                                      CAT820DB
LRM004        PERFORM UNTIL CASH-EOF                                    CAT820DB
LRM004               OR CASH-DETAIL-KEY(1 : 4) NOT = 'DATE'             CAT820DB
LRM004           READ CASH-ADJUSTMENT-FILE INTO CASH-DETAIL-RECORD      CAT820DB
LRM004              AT END                                              CAT820DB
LRM004               SET CASH-EOF TO TRUE                               CAT820DB
LRM004           END-READ                                               CAT820DB
LRM004        END-PERFORM                                               CAT820DB
LRM004     END-IF.                                                      CAT820DB
                                                                        CAT820DB
           IF PARM-RESTART-OTHER                                        CAT820DB
              SET CASH-EOF TO TRUE                                      CAT820DB
              DISPLAY 'PARM RESTART FOUND '                             CAT820DB
              DISPLAY 'PARM KEY X(17) = ' PARM-RESTART-KEY              CAT820DB
              PERFORM UNTIL OTHER-ADJ-EOF                               CAT820DB
                     OR OTH-DETAIL-KEY(1 : 11) =                        CAT820DB
                                      PARM-RESTART-KEY(1 : 11)          CAT820DB
                 READ NON-ACAT-ADJUSTMENT-FILE                          CAT820DB
                     AT END                                             CAT820DB
                       SET OTHER-ADJ-EOF TO TRUE                        CAT820DB
                 END-READ                                               CAT820DB
              END-PERFORM                                               CAT820DB
              IF NOT OTHER-ADJ-EOF                                      CAT820DB
                 DISPLAY 'SUCCESSFULLY LOCATED PARM RESTART OTH RECORD' CAT820DB
              ELSE                                                      CAT820DB
                 DISPLAY 'RESTART REACHED EOF. RESART-KEY NOT FOUND'    CAT820DB
                 DISPLAY 'PROGARM CAT820DB ABENDS '                     CAT820DB
                 MOVE +1100 TO ABEND-CD                                 CAT820DB
                 CALL  ABEND  USING ABEND-CD                            CAT820DB
           END-IF.                                                      CAT820DB
                                                                        CAT820DB
           EXEC SQL                                                     CAT820DB
                  SET :WS-TIMESTAMP = CURRENT TIMESTAMP                 CAT820DB
           END-EXEC.                                                    CAT820DB
                                                                        CAT820DB
DJ0001     DISPLAY 'CURRENT TIMESTAMP = ' WS-TIMESTAMP                  CAT820DB
DJ0001     DISPLAY '0100-PROCESS-CASH-FILE'                             CAT820DB
           PERFORM 0100-PROCESS-CASH-FILE                               CAT820DB
                       THRU 0100-EXIT                                   CAT820DB
              UNTIL CASH-EOF.                                           CAT820DB
                                                                        CAT820DB
           READ NON-ACAT-ADJUSTMENT-FILE                                CAT820DB
              AT END                                                    CAT820DB
                 SET OTHER-ADJ-EOF TO TRUE.                             CAT820DB
                                                                        CAT820DB
DJ0001     DISPLAY '3000-PROCESS-OTHER-ADJ-FILE'                        CAT820DB
           PERFORM 3000-PROCESS-OTHER-ADJ-FILE                          CAT820DB
                       THRU 3000-EXIT                                   CAT820DB
              UNTIL OTHER-ADJ-EOF.                                      CAT820DB
                                                                        CAT820DB
           CLOSE CASH-ADJUSTMENT-FILE.                                  CAT820DB
           CLOSE NON-ACAT-ADJUSTMENT-FILE.                              CAT820DB
LRM004     CLOSE MATH-FILE.                                             CAT820DB
                                                                        CAT820DB
           DISPLAY 'ADJUSTMENT RECORDS READ '  W-INFILE-CNT             CAT820DB
           DISPLAY 'DB2 CASH ASSETS CREATED '  W-ACTIAST-ADD-CNT        CAT820DB
           DISPLAY 'DB2 CASH ASSETS UPDATED '  W-ACTIAST-UPD-CNT        CAT820DB
           DISPLAY 'DB2 CASH ASSETS DELETED '  W-ACTIAST-DEL-CNT.       CAT820DB
           DISPLAY 'DB2 VTRNFR      UPDATED '  W-VTRNFR-UPD-CNT.        CAT820DB
           DISPLAY 'DB2 VTRNFR  NOT UPDATED '  W-VTRNFR-NOT-UPD-CNT.    CAT820DB
DJ0001     DISPLAY 'DB2 ACTITRF     CREATED '  W-ACTITRF-ADD-CNT.       CAT820DB
DJ0001     DISPLAY 'DB2 ACTITRF     UPDATED '  W-ACTITRF-UPD-CNT.       CAT820DB
LRM004     DISPLAY 'OLMI MATH RECORDS WRTN  '  W-MATH-RECS-WRTN.        CAT820DB
                                                                        CAT820DB
           GOBACK.                                                      CAT820DB
                                                                        CAT820DB
           EJECT                                                        CAT820DB
       0100-PROCESS-CASH-FILE.                                          CAT820DB
                                                                        CAT820DB
           ADD  1                        TO W-INFILE-CNT.               CAT820DB
           MOVE '0'             TO  WS-CLIENT-NBR (1 : 1).              CAT820DB
           MOVE CASH-ADP-CL-NO  TO  WS-CLIENT-NBR (2 : 3).              CAT820DB
LRM006     IF CASH-FRGN-FEE-RECORD                                              
LRM006        GO TO 0100-CONTINUE                                               
LRM006     END-IF.                                                              
                                                                        CAT820DB
           IF CASH-TRNFR-TYPE-CD = 'RCR'                                CAT820DB
              PERFORM 0400-FIND-INITIAL-TRNFR                           CAT820DB
           END-IF.                                                      CAT820DB
                                                                        CAT820DB
           IF CASH-TRNFR-TYPE-CD = 'RCR'                                CAT820DB
           AND INITIAL-TRNFR-NOT-FOUND                                  CAT820DB
              CONTINUE                                                  CAT820DB
           ELSE                                                         CAT820DB
           IF CASH-NET-ADJUST-TYPE1 NOT = ZEROS                         CAT820DB
           OR CASH-NET-ADJUST-TYPE2 NOT = ZEROS                         CAT820DB
           OR CASH-NET-ADJUST-TYPE5 NOT = ZEROS                         CAT820DB
              PERFORM 0200-UPDATE-CASH-ASSET-RTN THRU 0200-EXIT         CAT820DB
           END-IF.                                                      CAT820DB
                                                                        CAT820DB
LRM****** THE FOLLOW CHANGE TO RESET FEES ON ACTIVE TRANSFER REGARDLESS CAT820DB
LRM****** OF VALUE; RELOAD OF ASSETS MAY HAVE CAUSED THESE TO BE ZERO.  CAT820DB
LRM****** FEES ONLY APPLY TO FULL DELIVERY TRANFERS.                    CAT820DB
*********  IF CASH-TRNFR-FEE-AMT NOT = ZEROS   **********               CAT820DB
*********  OR CASH-IRA-TRMNT-AMT NOT = ZEROS   **********               CAT820DB
*********  OR CASH-IRA-MAINT-AMT NOT = ZEROS   **********               CAT820DB
                                                                        CAT820DB
           IF CASH-TRNFR-TYPE-CD = 'FUL'                                CAT820DB
               PERFORM 0300-UPDATE-DB2-FEES-RTN                         CAT820DB
           END-IF.                                                      CAT820DB
                                                                        CAT820DB
           PERFORM 8000-CHK-COMMIT THRU 8000-EXIT.                      CAT820DB
                                                                        CAT820DB
DJ0001***AT NIGHT ONLY, CHECK FOR ACCT FLAT AS A RESULT OF FEES         CAT820DB
DJ0001***COUNT HOW MANY ASSETS THERE ARE.                               CAT820DB
DJ0001     IF  PARM-NIGHT-RUN                                           CAT820DB
LRM008     AND CASH-TRNFR-TYPE-CD NOT = 'RCR'                                   
DJ0001         PERFORM 4000-CHECK-FOR-ACCT-FLAT                         CAT820DB
DJ0001     END-IF.                                                      CAT820DB
                                                                        CAT820DB
LRM006 0100-CONTINUE.                                                           
           READ CASH-ADJUSTMENT-FILE INTO CASH-DETAIL-RECORD            CAT820DB
              AT END                                                    CAT820DB
                 SET CASH-EOF TO TRUE.                                  CAT820DB
                                                                        CAT820DB
       0100-EXIT. EXIT.                                                 CAT820DB
                                                                        CAT820DB
            EJECT                                                       CAT820DB
       0200-UPDATE-CASH-ASSET-RTN.                                      CAT820DB
LRM003     IF (CASH-TRNFR-TYPE-CD = 'FUL' OR 'PTR')                     CAT820DB
LRM001        MOVE CASH-CONTROL-NBR TO ACAT-CONTROL-NBR OF DCLACTIAST   CAT820DB
LRM001     ELSE                                                         CAT820DB
LRM001        MOVE SPACES           TO ACAT-CONTROL-NBR OF DCLACTIAST   CAT820DB
LRM001     END-IF.                                                      CAT820DB
           IF CASH-NET-ADJUST-TYPE1 = ZEROS                             CAT820DB
              GO TO 0205-READ-MARGIN-TYPE2.                             CAT820DB
                                                                        CAT820DB
      *** SEE IF A CASH ASSET EXITS FOR THIS TRANSFER.                  CAT820DB
      *** READ FOR TYPE 01 CASH.                                        CAT820DB
           EXEC SQL SELECT                                              CAT820DB
                   ASSET_AMT                                            CAT820DB
                  ,STTLM_RSN_CD                                         CAT820DB
                  ,CSH_MGN_SHRT_CD                                      CAT820DB
                 INTO                                                   CAT820DB
                   :DCLACTIAST.ASSET-AMT                                CAT820DB
                  ,:DCLACTIAST.STTLM-RSN-CD                             CAT820DB
                  ,:DCLACTIAST.CSH-MGN-SHRT-CD                          CAT820DB
                 FROM ACTIAST                                           CAT820DB
                  WHERE  CLIENT_NBR                                     CAT820DB
                              = :WS-CLIENT-NBR                          CAT820DB
                     AND DLVR_NBR                                       CAT820DB
                              = :CASH-DLVR-NBR                          CAT820DB
                     AND ACCT_DLVR_NBR                                  CAT820DB
                              = :CASH-DLVR-ACCT                         CAT820DB
                     AND RCV_NBR                                        CAT820DB
                              = :CASH-RCV-NBR                           CAT820DB
                     AND ACCT_RCV_NBR                                   CAT820DB
                              = :CASH-RCV-ACCT                          CAT820DB
                     AND ISIN_SEC_ISSUE_CD                              CAT820DB
                              = '         '                             CAT820DB
                     AND ISIN_CNTRY_CD                                  CAT820DB
                              = '  '                                    CAT820DB
                     AND STTLM_LCTN_CD                                  CAT820DB
                              = '40'                                    CAT820DB
                     AND CSH_MGN_SHRT_CD                                CAT820DB
                              = 'C'                                     CAT820DB
LRM001               AND ACAT_CONTROL_NBR                               CAT820DB
LRM001                        = :DCLACTIAST.ACAT-CONTROL-NBR            CAT820DB
093200      END-EXEC.                                                   CAT820DB
093300*                                                                 CAT820DB
           IF  SQLCODE = +0                                             CAT820DB
               MOVE CASH-NET-ADJUST-TYPE1 TO CASH-NET-ADJUSTMENT        CAT820DB
               PERFORM 0210-UPDATE-CASH-ASSET THRU 0210-EXIT            CAT820DB
           ELSE                                                         CAT820DB
           IF SQLCODE = +100                                            CAT820DB
               MOVE '40' TO WS-STTLM-LCTN-CD                            CAT820DB
               MOVE 'C'  TO WS-CSH-MGN-SHRT-CD                          CAT820DB
               MOVE CASH-NET-ADJUST-TYPE1 TO CASH-NET-ADJUSTMENT        CAT820DB
               PERFORM 0220-CREATE-CASH-ASSET                           CAT820DB
           ELSE                                                         CAT820DB
               DISPLAY 'CAT820: ERROR SELECTING A ROW FROM ACTIAST'     CAT820DB
                      ' (ACAT-ASSET TABLE)'                             CAT820DB
               DISPLAY 'SQLCODE = ' SQLCODE                             CAT820DB
               DISPLAY 'CAT820: INPUT  REC ='                           CAT820DB
                      '(' CASH-DETAIL-RECORD ')'                        CAT820DB
               DISPLAY 'CAT820DB: DCLACTIAST  ='                        CAT820DB
                      '(' DCLACTIAST ')'                                CAT820DB
               PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                  CAT820DB
           END-IF.                                                      CAT820DB
                                                                        CAT820DB
       0205-READ-MARGIN-TYPE2.                                          CAT820DB
           IF CASH-NET-ADJUST-TYPE2 = ZEROS                             CAT820DB
              GO TO 0207-READ-MARGIN-TYPE5.                             CAT820DB
                                                                        CAT820DB
      *** SEE IF MARGIN CASH ASSET EXITS FOR THIS TRANSFER.             CAT820DB
      *** IF SO, APPLY CASH TO THIS, OTHERWISE CREATE TYPE 2.           CAT820DB
      *** READ FOR TYPE 02 CASH                                         CAT820DB
           EXEC SQL SELECT                                              CAT820DB
                   ASSET_AMT                                            CAT820DB
                  ,STTLM_RSN_CD                                         CAT820DB
                  ,CSH_MGN_SHRT_CD                                      CAT820DB
                 INTO                                                   CAT820DB
                   :DCLACTIAST.ASSET-AMT                                CAT820DB
                  ,:DCLACTIAST.STTLM-RSN-CD                             CAT820DB
                  ,:DCLACTIAST.CSH-MGN-SHRT-CD                          CAT820DB
                 FROM ACTIAST                                           CAT820DB
                  WHERE  CLIENT_NBR                                     CAT820DB
                              = :WS-CLIENT-NBR                          CAT820DB
                     AND DLVR_NBR                                       CAT820DB
                              = :CASH-DLVR-NBR                          CAT820DB
                     AND ACCT_DLVR_NBR                                  CAT820DB
                              = :CASH-DLVR-ACCT                         CAT820DB
                     AND RCV_NBR                                        CAT820DB
                              = :CASH-RCV-NBR                           CAT820DB
                     AND ACCT_RCV_NBR                                   CAT820DB
                              = :CASH-RCV-ACCT                          CAT820DB
                     AND ISIN_SEC_ISSUE_CD                              CAT820DB
                              = '         '                             CAT820DB
                     AND ISIN_CNTRY_CD                                  CAT820DB
                              = '  '                                    CAT820DB
                     AND STTLM_LCTN_CD                                  CAT820DB
                              = '40'                                    CAT820DB
                     AND CSH_MGN_SHRT_CD                                CAT820DB
                              = 'M'                                     CAT820DB
LRM001               AND ACAT_CONTROL_NBR                               CAT820DB
LRM001                        = :DCLACTIAST.ACAT-CONTROL-NBR            CAT820DB
093200      END-EXEC.                                                   CAT820DB
093300*                                                                 CAT820DB
           IF  SQLCODE = +0                                             CAT820DB
               MOVE CASH-NET-ADJUST-TYPE2 TO CASH-NET-ADJUSTMENT        CAT820DB
               PERFORM 0210-UPDATE-CASH-ASSET THRU 0210-EXIT            CAT820DB
           ELSE                                                         CAT820DB
           IF SQLCODE = +100                                            CAT820DB
               MOVE '40' TO WS-STTLM-LCTN-CD                            CAT820DB
               MOVE 'M'  TO WS-CSH-MGN-SHRT-CD                          CAT820DB
               MOVE CASH-NET-ADJUST-TYPE2 TO CASH-NET-ADJUSTMENT        CAT820DB
               PERFORM 0220-CREATE-CASH-ASSET                           CAT820DB
           ELSE                                                         CAT820DB
               DISPLAY 'CAT820: ERROR SELECTING A ROW FROM ACTIAST'     CAT820DB
                      ' (ACAT-ASSET TABLE)'                             CAT820DB
               DISPLAY 'SQLCODE = ' SQLCODE                             CAT820DB
               DISPLAY 'CAT820: INPUT  REC ='                           CAT820DB
                      '(' CASH-DETAIL-RECORD ')'                        CAT820DB
               DISPLAY 'CAT820DB: DCLACTIAST  ='                        CAT820DB
                      '(' DCLACTIAST ')'                                CAT820DB
               PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                  CAT820DB
           END-IF.                                                      CAT820DB
                                                                        CAT820DB
       0207-READ-MARGIN-TYPE5.                                          CAT820DB
           IF CASH-NET-ADJUST-TYPE5 = ZEROS                             CAT820DB
              GO TO 0200-EXIT.                                          CAT820DB
                                                                        CAT820DB
      *** SEE IF TYPE5 CASH ASSET EXITS FOR THIS TRANSFER.              CAT820DB
      *** IF SO, APPLY CASH TO THIS, OTHERWISE CREATE TYPE 5.           CAT820DB
      *** READ FOR TYPE 05 CASH                                         CAT820DB
           EXEC SQL SELECT                                              CAT820DB
                   ASSET_AMT                                            CAT820DB
                  ,STTLM_RSN_CD                                         CAT820DB
                  ,CSH_MGN_SHRT_CD                                      CAT820DB
                 INTO                                                   CAT820DB
                   :DCLACTIAST.ASSET-AMT                                CAT820DB
                  ,:DCLACTIAST.STTLM-RSN-CD                             CAT820DB
                  ,:DCLACTIAST.CSH-MGN-SHRT-CD                          CAT820DB
                 FROM ACTIAST                                           CAT820DB
                  WHERE  CLIENT_NBR                                     CAT820DB
                              = :WS-CLIENT-NBR                          CAT820DB
                     AND DLVR_NBR                                       CAT820DB
                              = :CASH-DLVR-NBR                          CAT820DB
                     AND ACCT_DLVR_NBR                                  CAT820DB
                              = :CASH-DLVR-ACCT                         CAT820DB
                     AND RCV_NBR                                        CAT820DB
                              = :CASH-RCV-NBR                           CAT820DB
                     AND ACCT_RCV_NBR                                   CAT820DB
                              = :CASH-RCV-ACCT                          CAT820DB
                     AND ISIN_SEC_ISSUE_CD                              CAT820DB
                              = '         '                             CAT820DB
                     AND ISIN_CNTRY_CD                                  CAT820DB
                              = '  '                                    CAT820DB
                     AND STTLM_LCTN_CD                                  CAT820DB
                              = '40'                                    CAT820DB
                     AND CSH_MGN_SHRT_CD                                CAT820DB
                              = 'S'                                     CAT820DB
LRM001               AND ACAT_CONTROL_NBR                               CAT820DB
LRM001                        = :DCLACTIAST.ACAT-CONTROL-NBR            CAT820DB
093200      END-EXEC.                                                   CAT820DB
093300*                                                                 CAT820DB
           IF  SQLCODE = +0                                             CAT820DB
               MOVE CASH-NET-ADJUST-TYPE5 TO CASH-NET-ADJUSTMENT        CAT820DB
               PERFORM 0210-UPDATE-CASH-ASSET THRU 0210-EXIT            CAT820DB
           ELSE                                                         CAT820DB
           IF SQLCODE = +100                                            CAT820DB
               MOVE '40' TO WS-STTLM-LCTN-CD                            CAT820DB
               MOVE 'S'  TO WS-CSH-MGN-SHRT-CD                          CAT820DB
               MOVE CASH-NET-ADJUST-TYPE5 TO CASH-NET-ADJUSTMENT        CAT820DB
               PERFORM 0220-CREATE-CASH-ASSET                           CAT820DB
           ELSE                                                         CAT820DB
               DISPLAY 'CAT820: ERROR SELECTING A ROW FROM ACTIAST'     CAT820DB
                      ' (ACAT-ASSET TABLE)'                             CAT820DB
               DISPLAY 'SQLCODE = ' SQLCODE                             CAT820DB
               DISPLAY 'CAT820: INPUT  REC ='                           CAT820DB
                      '(' CASH-DETAIL-RECORD ')'                        CAT820DB
               DISPLAY 'CAT820DB: DCLACTIAST  ='                        CAT820DB
                      '(' DCLACTIAST ')'                                CAT820DB
               PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                  CAT820DB
           END-IF.                                                      CAT820DB
                                                                        CAT820DB
       0200-EXIT. EXIT.                                                 CAT820DB
            EJECT                                                       CAT820DB
       0210-UPDATE-CASH-ASSET.                                          CAT820DB
           IF STTLM-RSN-CD = 'CRED'                                     CAT820DB
              MULTIPLY ASSET-AMT BY -1 GIVING WS-CURRENT-CASH           CAT820DB
           ELSE                                                         CAT820DB
              MOVE ASSET-AMT TO WS-CURRENT-CASH                         CAT820DB
           END-IF.                                                      CAT820DB
                                                                        CAT820DB
DJ0001     MOVE WS-CURRENT-CASH TO WS-PREVIOUS-CASH.                    CAT820DB
           ADD CASH-NET-ADJUSTMENT TO WS-CURRENT-CASH.                  CAT820DB
                                                                        CAT820DB
           IF WS-CURRENT-CASH = ZEROS                                   CAT820DB
              PERFORM 0230-DELETE-CASH-ASSET                            CAT820DB
              GO TO 0210-EXIT                                           CAT820DB
           ELSE                                                         CAT820DB
           IF WS-CURRENT-CASH < ZEROS                                   CAT820DB
              MOVE 'CRED' TO STTLM-RSN-CD OF DCLACTIAST                 CAT820DB
              MULTIPLY WS-CURRENT-CASH BY -1 GIVING ASSET-AMT           CAT820DB
           ELSE                                                         CAT820DB
              MOVE 'DEB ' TO STTLM-RSN-CD OF DCLACTIAST                 CAT820DB
              MOVE WS-CURRENT-CASH TO ASSET-AMT                         CAT820DB
           END-IF.                                                      CAT820DB
                                                                        CAT820DB
           EXEC SQL                                                     CAT820DB
               UPDATE ACTIAST                                           CAT820DB
                 SET                                                    CAT820DB
                   ASSET_AMT     =  :ASSET-AMT                          CAT820DB
                  ,STTLM_RSN_CD  =  :STTLM-RSN-CD                       CAT820DB
                  ,PRGM_NM       =  'CAT820DB'                          CAT820DB
                WHERE (CLIENT_NBR                                       CAT820DB
                              = :WS-CLIENT-NBR                          CAT820DB
                     AND DLVR_NBR                                       CAT820DB
                              = :CASH-DLVR-NBR                          CAT820DB
                     AND ACCT_DLVR_NBR                                  CAT820DB
                              = :CASH-DLVR-ACCT                         CAT820DB
                     AND RCV_NBR                                        CAT820DB
                              = :CASH-RCV-NBR                           CAT820DB
                     AND ACCT_RCV_NBR                                   CAT820DB
                              = :CASH-RCV-ACCT                          CAT820DB
                     AND ISIN_SEC_ISSUE_CD                              CAT820DB
                              = '         '                             CAT820DB
                     AND STTLM_LCTN_CD                                  CAT820DB
                              = '40'                                    CAT820DB
                     AND CSH_MGN_SHRT_CD                                CAT820DB
                              = :DCLACTIAST.CSH-MGN-SHRT-CD             CAT820DB
LRM001               AND ACAT_CONTROL_NBR                               CAT820DB
LRM001                        = :DCLACTIAST.ACAT-CONTROL-NBR)           CAT820DB
093200     END-EXEC.                                                    CAT820DB
                                                                        CAT820DB
           IF  SQLCODE  = +0                                            CAT820DB
               ADD 1 TO W-ACTIAST-UPD-CNT                               CAT820DB
               ADD 1 TO W-COMMIT-CTR                                    CAT820DB
DJ0001         MOVE WS-PREVIOUS-CASH        TO W-PREVIOUS-DISPLAY       CAT820DB
DJ0001         MOVE CASH-NET-ADJUSTMENT     TO W-ADJUST-DISPLAY         CAT820DB
DJ0001         MOVE ASSET-AMT OF DCLACTIAST TO W-ASSET-AMT-DISPLAY      CAT820DB
TEST           DISPLAY  WS-CLIENT-NBR ' '  CASH-CONTROL-NBR             CAT820DB
DJ0001               ' ' CASH-TRNFR-TYPE-CD                             CAT820DB
TEST                 ' UPDATED CASH: '                                  CAT820DB
TEST                 ' CMS=' CSH-MGN-SHRT-CD OF DCLACTIAST              CAT820DB
TEST                 ' ' STTLM-RSN-CD OF DCLACTIAST                     CAT820DB
DJ0001               ' OLD ' W-PREVIOUS-DISPLAY                         CAT820DB
DJ0001               ' ADJ ' W-ADJUST-DISPLAY                           CAT820DB
DJ0001               ' NEW AMT ' W-ASSET-AMT-DISPLAY                    CAT820DB
DJ0001               ' ' STTLM-RSN-CD OF DCLACTIAST                     CAT820DB
           ELSE                                                         CAT820DB
               DISPLAY 'CAT820: ERROR UPDATING A ROW IN ACTIAST'        CAT820DB
                      ' (ACAT-ASSET TABLE)'                             CAT820DB
               DISPLAY 'SQLCODE = ' SQLCODE                             CAT820DB
               DISPLAY 'CAT820: INPUT  REC ='                           CAT820DB
                      '(' CASH-DETAIL-RECORD ')'                        CAT820DB
               DISPLAY 'CAT820DB: DCLACTIAST  ='                        CAT820DB
                      '(' DCLACTIAST ')'                                CAT820DB
               PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                  CAT820DB
           END-IF.                                                      CAT820DB
                                                                        CAT820DB
       0210-EXIT. EXIT.                                                 CAT820DB
           EJECT                                                        CAT820DB
       0220-CREATE-CASH-ASSET.                                          CAT820DB
                                                                        CAT820DB
           INITIALIZE DCLACTIAST.                                       CAT820DB
                                                                        CAT820DB
LRM003     IF (CASH-TRNFR-TYPE-CD = 'FUL' OR 'PTR')                     CAT820DB
              PERFORM 0250-FIND-NSCC-PEND-FUL                           CAT820DB
           ELSE                                                         CAT820DB
              PERFORM 0260-FIND-NSCC-PEND-OTHER                         CAT820DB
           END-IF.                                                      CAT820DB
                                                                        CAT820DB
           MOVE 'N' TO BEARER-BOND-CD OF DCLACTIAST                     CAT820DB
                       WHI-STTS-CD    OF DCLACTIAST.                    CAT820DB
           MOVE WS-TIMESTAMP TO  UPDT-TMSTP OF DCLACTIAST               CAT820DB
                                  CRT-TMSTP OF DCLACTIAST.              CAT820DB
           MOVE ZEROS TO ASSET-SEQ-NBR OF DCLACTIAST                    CAT820DB
                         PHSCL-SEQ-NBR OF DCLACTIAST                    CAT820DB
                         LGCL-SEQ-NBR OF DCLACTIAST.                    CAT820DB
           MOVE '00' TO OPTN-CTGY-CD OF DCLACTIAST.                     CAT820DB
           MOVE 'BATC'   TO CICS-TERM-ID-CD OF DCLACTIAST.              CAT820DB
                                                                        CAT820DB
           IF CASH-TRNFR-TYPE-CD = 'RCR'                                CAT820DB
              MOVE '10' TO TRNFR-TYPE-RSN-CD OF DCLACTIAST              CAT820DB
           ELSE                                                         CAT820DB
              MOVE 'P'  TO ASSET-RQST-QTY-CD OF DCLACTIAST              CAT820DB
              MOVE '3'  TO AST-RQST-TRANS-CD OF DCLACTIAST              CAT820DB
           END-IF.                                                      CAT820DB
                                                                        CAT820DB
      *** INSERT CASH                                                   CAT820DB
           IF CASH-NET-ADJUSTMENT LESS ZEROS                            CAT820DB
              MOVE 'CRED' TO STTLM-RSN-CD OF DCLACTIAST                 CAT820DB
              MULTIPLY CASH-NET-ADJUSTMENT BY -1 GIVING ASSET-AMT       CAT820DB
           ELSE                                                         CAT820DB
              MOVE 'DEB ' TO STTLM-RSN-CD OF DCLACTIAST                 CAT820DB
              MOVE CASH-NET-ADJUSTMENT TO ASSET-AMT                     CAT820DB
           END-IF.                                                      CAT820DB
                                                                        CAT820DB
LRM003     IF (CASH-TRNFR-TYPE-CD = 'FUL' OR 'PTR')                     CAT820DB
              MOVE CASH-CONTROL-NBR TO ACAT-CONTROL-NBR                 CAT820DB
                                 OF DCLACTIAST                          CAT820DB
           END-IF.                                                      CAT820DB
                                                                        CAT820DB
LRM004     IF WS-CLIENT-NBR(2:3) NOT = BH-ACAT-ENTRY-ID(1:3)            CAT820DB
LRM004        MOVE WS-CLIENT-NBR(2:3) TO BH-BROKER-NUMBER               CAT820DB
LRM004        MOVE '015'     TO BH-LOGICAL-RECORD-CODE                  CAT820DB
LRM004        MOVE '434500'  TO BH-B2-INFO-ID                           CAT820DB
LRM004        CALL  GETB1V  USING BH-BROKER-HEADER-INFO,                CAT820DB
LRM004                            BH-ACAT-INFO                          CAT820DB
DJ0001        DISPLAY 'GETB1 FOR CLT ' BH-BROKER-NUMBER                 CAT820DB
DJ0001                   ' ' BH-BROKER-NAME                             CAT820DB
DJ0001          ' ASCENDIS=' BH-ACAT-ASCENDIS-USER                      CAT820DB
LRM004     END-IF.                                                      CAT820DB
LRM004                                                                  CAT820DB
LRM004     MOVE ' ' TO NSCC-ACK-IND OF DCLACTIAST                       CAT820DB
LRM004     IF  BH-ACAT-ACTIVE                                           CAT820DB
LRM004       IF BH-ACAT-ASCENDIS-USER = '1'                             CAT820DB
LRM004          MOVE 'A' TO NSCC-ACK-IND OF DCLACTIAST                  CAT820DB
LRM004       ELSE                                                       CAT820DB
LRM004       IF BH-ACAT-ASCENDIS-USER = '2'                             CAT820DB
LRM004          MOVE 'P' TO NSCC-ACK-IND OF DCLACTIAST                  CAT820DB
LRM004     END-IF.                                                      CAT820DB
                                                                        CAT820DB
           EXEC SQL                                                     CAT820DB
              INSERT INTO ACTIAST                                       CAT820DB
                 (                                                      CAT820DB
                   CLIENT_NBR                                           CAT820DB
                  ,DLVR_NBR                                             CAT820DB
                  ,ACCT_DLVR_NBR                                        CAT820DB
                  ,RCV_NBR                                              CAT820DB
                  ,ACCT_RCV_NBR                                         CAT820DB
                  ,ISIN_CNTRY_CD                                        CAT820DB
                  ,ISIN_SEC_ISSUE_CD                                    CAT820DB
                  ,ISIN_SEC_CDG_CD                                      CAT820DB
                  ,STTLM_LCTN_CD                                        CAT820DB
                  ,CSH_MGN_SHRT_CD                                      CAT820DB
                  ,CSH_MRG_SHT_STS_CD                                   CAT820DB
                  ,STTLM_LCTN_STTS_CD                                   CAT820DB
                  ,ISIN_CNTRY_STTS_CD                                   CAT820DB
                  ,SBMTG_PRTCP_NBR                                      CAT820DB
                  ,SBMT_PRT_NR_STS_CD                                   CAT820DB
                  ,ACAT_CONTROL_NBR                                     CAT820DB
                  ,CONTROL_NBR_STS_CD                                   CAT820DB
                  ,ASSET_SEQ_NBR                                        CAT820DB
                  ,AST_SEQ_NBR_STS_CD                                   CAT820DB
                  ,TRANS_TYPE_CD                                        CAT820DB
                  ,TRANS_TYPE_STTS_CD                                   CAT820DB
                  ,PHSCL_SEQ_NBR                                        CAT820DB
                  ,PHSCL_SEQ_STTS_CD                                    CAT820DB
                  ,LGCL_SEQ_NBR                                         CAT820DB
                  ,LGCL_SEQ_NR_STS_CD                                   CAT820DB
                  ,ASSET_PRC_CTGY_CD                                    CAT820DB
                  ,AST_PRC_CTG_STS_CD                                   CAT820DB
                  ,STTLM_RSN_CD                                         CAT820DB
                  ,STTLM_RSN_STTS_CD                                    CAT820DB
                  ,ASSET_DESC_TXT                                       CAT820DB
                  ,ASSET_DESC_STTS_CD                                   CAT820DB
                  ,ASSET_RQST_QTY_CD                                    CAT820DB
                  ,ASSET_RQST_STS_CD                                    CAT820DB
                  ,AST_RQST_TRANS_CD                                    CAT820DB
                  ,AST_RQ_TRAN_STS_CD                                   CAT820DB
                  ,ASSET_QTY                                            CAT820DB
                  ,ASSET_QTY_STTS_CD                                    CAT820DB
                  ,ASSET_PCT                                            CAT820DB
                  ,ASSET_PCT_STTS_CD                                    CAT820DB
                  ,PSTN_CD                                              CAT820DB
                  ,PSTN_CD_STTS_CD                                      CAT820DB
                  ,ISO_CRNCY_CD                                         CAT820DB
                  ,ISO_CRNCY_STTS_CD                                    CAT820DB
                  ,ASSET_AMT                                            CAT820DB
                  ,ASSET_AMT_STTS_CD                                    CAT820DB
                  ,BEARER_BOND_CD                                       CAT820DB
                  ,BEARER_BND_STTS_CD                                   CAT820DB
                  ,WHI_CD                                               CAT820DB
                  ,WHI_STTS_CD                                          CAT820DB
                  ,TRNFR_TYPE_RSN_CD                                    CAT820DB
                  ,TRN_TYP_RSN_STS_CD                                   CAT820DB
                  ,MBS_SERIAL_NBR                                       CAT820DB
                  ,MBS_SERIAL_STTS_CD                                   CAT820DB
                  ,ASSET_CMNT_TXT                                       CAT820DB
                  ,ASSET_CMNT_STTS_CD                                   CAT820DB
                  ,NSCC_WTHLD_CD                                        CAT820DB
                  ,TRANS_RFRN_ID_CD                                     CAT820DB
                  ,TRANS_RFRN_STTS_CD                                   CAT820DB
                  ,ISIN_SEC_IS_STS_CD                                   CAT820DB
                  ,ISIN_SEC_CD_STS_CD                                   CAT820DB
                  ,OPTN_CTGY_CD                                         CAT820DB
                  ,OPTN_CTGY_STTS_CD                                    CAT820DB
                  ,RCRD_LNGTH_STTS_CD                                   CAT820DB
                  ,RCRD_STTS_CD                                         CAT820DB
                  ,NSCC_PEND_CD                                         CAT820DB
                  ,NSCC_ACK_IND                                         CAT820DB
                  ,PRGM_NM                                              CAT820DB
                  ,CICS_TERM_ID_CD                                      CAT820DB
                  ,UPDT_TMSTP                                           CAT820DB
                  ,CRT_TMSTP                                            CAT820DB
                  ,SECURITY_ADP_NBR                                     CAT820DB
                  ,TRNFR_TYPE_CD                                        CAT820DB
                  ,TRNFR_TYPE_STTS_CD                                   CAT820DB
                  ,RCV_NBR_STTS_CD                                      CAT820DB
                  ,DLVR_NBR_STTS_CD                                     CAT820DB
                 )                                                      CAT820DB
                 VALUES                                                 CAT820DB
                 (                                                      CAT820DB
                    :WS-CLIENT-NBR                                      CAT820DB
                   ,:CASH-DLVR-NBR                                      CAT820DB
                   ,:CASH-DLVR-ACCT                                     CAT820DB
                   ,:CASH-RCV-NBR                                       CAT820DB
                   ,:CASH-RCV-ACCT                                      CAT820DB
                   ,'  '                                                CAT820DB
                   ,'         '                                         CAT820DB
                   ,' '                                                 CAT820DB
                   ,:WS-STTLM-LCTN-CD                                   CAT820DB
                   ,:WS-CSH-MGN-SHRT-CD                                 CAT820DB
                   ,' '                                                 CAT820DB
                   ,:DCLACTIAST.STTLM-LCTN-STTS-CD                      CAT820DB
                   ,:DCLACTIAST.ISIN-CNTRY-STTS-CD                      CAT820DB
                   ,:CASH-DLVR-NBR                                      CAT820DB
                   ,:DCLACTIAST.SBMT-PRT-NR-STS-CD                      CAT820DB
                   ,:DCLACTIAST.ACAT-CONTROL-NBR                        CAT820DB
                   ,:DCLACTIAST.CONTROL-NBR-STS-CD                      CAT820DB
                   ,:DCLACTIAST.ASSET-SEQ-NBR                           CAT820DB
                   ,:DCLACTIAST.AST-SEQ-NBR-STS-CD                      CAT820DB
                   ,'A'                                                 CAT820DB
                   ,:DCLACTIAST.TRANS-TYPE-STTS-CD                      CAT820DB
                   ,:DCLACTIAST.PHSCL-SEQ-NBR                           CAT820DB
                   ,:DCLACTIAST.PHSCL-SEQ-STTS-CD                       CAT820DB
                   ,:DCLACTIAST.LGCL-SEQ-NBR                            CAT820DB
                   ,:DCLACTIAST.LGCL-SEQ-NR-STS-CD                      CAT820DB
                   ,:DCLACTIAST.ASSET-PRC-CTGY-CD                       CAT820DB
                   ,:DCLACTIAST.AST-PRC-CTG-STS-CD                      CAT820DB
                   ,:DCLACTIAST.STTLM-RSN-CD                            CAT820DB
                   ,:DCLACTIAST.STTLM-RSN-STTS-CD                       CAT820DB
                   ,:DCLACTIAST.ASSET-DESC-TXT                          CAT820DB
                   ,:DCLACTIAST.ASSET-DESC-STTS-CD                      CAT820DB
                   ,:DCLACTIAST.ASSET-RQST-QTY-CD                       CAT820DB
                   ,:DCLACTIAST.ASSET-RQST-STS-CD                       CAT820DB
                   ,:DCLACTIAST.AST-RQST-TRANS-CD                       CAT820DB
                   ,:DCLACTIAST.AST-RQ-TRAN-STS-CD                      CAT820DB
                   ,:DCLACTIAST.ASSET-QTY                               CAT820DB
                   ,:DCLACTIAST.ASSET-QTY-STTS-CD                       CAT820DB
                   ,:DCLACTIAST.ASSET-PCT                               CAT820DB
                   ,:DCLACTIAST.ASSET-PCT-STTS-CD                       CAT820DB
                   ,:DCLACTIAST.PSTN-CD                                 CAT820DB
                   ,:DCLACTIAST.PSTN-CD-STTS-CD                         CAT820DB
                   ,:DCLACTIAST.ISO-CRNCY-CD                            CAT820DB
                   ,:DCLACTIAST.ISO-CRNCY-STTS-CD                       CAT820DB
                   ,:DCLACTIAST.ASSET-AMT                               CAT820DB
                   ,:DCLACTIAST.ASSET-AMT-STTS-CD                       CAT820DB
                   ,:DCLACTIAST.BEARER-BOND-CD                          CAT820DB
                   ,:DCLACTIAST.BEARER-BND-STTS-CD                      CAT820DB
                   ,'N'                                                 CAT820DB
                   ,:DCLACTIAST.WHI-STTS-CD                             CAT820DB
                   ,:DCLACTIAST.TRNFR-TYPE-RSN-CD                       CAT820DB
                   ,:DCLACTIAST.TRN-TYP-RSN-STS-CD                      CAT820DB
                   ,:DCLACTIAST.MBS-SERIAL-NBR                          CAT820DB
                   ,:DCLACTIAST.MBS-SERIAL-STTS-CD                      CAT820DB
                   ,:DCLACTIAST.ASSET-CMNT-TXT                          CAT820DB
                   ,:DCLACTIAST.ASSET-CMNT-STTS-CD                      CAT820DB
                   ,:DCLACTIAST.NSCC-WTHLD-CD                           CAT820DB
                   ,:CASH-DLVR-ACCT                                     CAT820DB
                   ,:DCLACTIAST.TRANS-RFRN-STTS-CD                      CAT820DB
                   ,:DCLACTIAST.ISIN-SEC-IS-STS-CD                      CAT820DB
                   ,:DCLACTIAST.ISIN-SEC-CD-STS-CD                      CAT820DB
                   ,:DCLACTIAST.OPTN-CTGY-CD                            CAT820DB
                   ,:DCLACTIAST.OPTN-CTGY-STTS-CD                       CAT820DB
                   ,:DCLACTIAST.RCRD-LNGTH-STTS-CD                      CAT820DB
                   ,:DCLACTIAST.RCRD-STTS-CD                            CAT820DB
                   ,:DCLACTIAST.NSCC-PEND-CD                            CAT820DB
                   ,:DCLACTIAST.NSCC-ACK-IND                            CAT820DB
                   ,'CAT820DB'                                          CAT820DB
                   ,:DCLACTIAST.CICS-TERM-ID-CD                         CAT820DB
                   ,:DCLACTIAST.UPDT-TMSTP                              CAT820DB
                   ,:DCLACTIAST.CRT-TMSTP                               CAT820DB
                   ,:DCLACTIAST.SECURITY-ADP-NBR                        CAT820DB
                   ,:CASH-TRNFR-TYPE-CD                                 CAT820DB
                   ,:DCLACTIAST.TRNFR-TYPE-STTS-CD                      CAT820DB
                   ,:DCLACTIAST.RCV-NBR-STTS-CD                         CAT820DB
                   ,:DCLACTIAST.DLVR-NBR-STTS-CD                        CAT820DB
                 )                                                      CAT820DB
           END-EXEC.                                                    CAT820DB
                                                                        CAT820DB
           IF  SQLCODE  =  +0                                           CAT820DB
               ADD 1 TO W-ACTIAST-ADD-CNT                               CAT820DB
               ADD 1 TO W-COMMIT-CTR                                    CAT820DB
TEST           DISPLAY WS-CLIENT-NBR ' '  CASH-CONTROL-NBR              CAT820DB
DJ0001               ' ' CASH-TRNFR-TYPE-CD                             CAT820DB
TEST                 ' CREATED CASH ADJUSTMENT: '                       CAT820DB
TEST                 ' ' STTLM-RSN-CD OF DCLACTIAST                     CAT820DB
TEST                 ' ' CASH-NET-ADJUSTMENT                            CAT820DB
           ELSE                                                         CAT820DB
               DISPLAY '  '                                             CAT820DB
                                ' ACTIAST NOT ADDED.'                   CAT820DB
                                ' SQLCODE = ' SQLCODE                   CAT820DB
                   DISPLAY '   ACTIAST PRIMARY KEY:'                    CAT820DB
                            ' CLT=' CLIENT-NBR        OF DCLACTIAST     CAT820DB
                             ' CC=' ISIN-CNTRY-CD     OF DCLACTIAST     CAT820DB
                            ' SEC=' ISIN-SEC-ISSUE-CD OF DCLACTIAST     CAT820DB
                             ' CD=' ISIN-SEC-CDG-CD   OF DCLACTIAST     CAT820DB
                             ' SL=' STTLM-LCTN-CD     OF DCLACTIAST     CAT820DB
                            ' CMS=' CSH-MGN-SHRT-CD   OF DCLACTIAST     CAT820DB
                   DISPLAY '           '                                CAT820DB
                            ' DLV=' DLVR-NBR          OF DCLACTIAST     CAT820DB
                         ' DLV-AC=' ACCT-DLVR-NBR     OF DCLACTIAST     CAT820DB
                            ' RCV=' RCV-NBR           OF DCLACTIAST     CAT820DB
                         ' RCV-AC=' ACCT-RCV-NBR      OF DCLACTIAST     CAT820DB
                            ' TFR=' CASH-TRNFR-TYPE-CD                  CAT820DB
                   DISPLAY ' '                                          CAT820DB
                   DISPLAY 'CAT820: ERROR INSERTING A ROW INTO ACTIAST' CAT820DB
                         ' (ACAT-INIT-ASSET TABLE)'                     CAT820DB
                   DISPLAY 'CAT820: INPUT  REC ='                       CAT820DB
                        '(' CASH-DETAIL-RECORD ')'                      CAT820DB
                   DISPLAY 'CAT820DB: DCLACTIAST  ='                    CAT820DB
                        '(' DCLACTIAST ')'                              CAT820DB
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT              CAT820DB
           END-IF.                                                      CAT820DB
                                                                        CAT820DB
       0230-DELETE-CASH-ASSET.                                          CAT820DB
           EXEC SQL                                                     CAT820DB
               DELETE FROM ACTIAST                                      CAT820DB
                WHERE (CLIENT_NBR                                       CAT820DB
                              = :WS-CLIENT-NBR                          CAT820DB
                     AND DLVR_NBR                                       CAT820DB
                              = :CASH-DLVR-NBR                          CAT820DB
                     AND ACCT_DLVR_NBR                                  CAT820DB
                              = :CASH-DLVR-ACCT                         CAT820DB
                     AND RCV_NBR                                        CAT820DB
                              = :CASH-RCV-NBR                           CAT820DB
                     AND ACCT_RCV_NBR                                   CAT820DB
                              = :CASH-RCV-ACCT                          CAT820DB
                     AND ISIN_SEC_ISSUE_CD                              CAT820DB
                              = '         '                             CAT820DB
                     AND STTLM_LCTN_CD                                  CAT820DB
                              = '40'                                    CAT820DB
                     AND CSH_MGN_SHRT_CD                                CAT820DB
                              = :DCLACTIAST.CSH-MGN-SHRT-CD)            CAT820DB
093200     END-EXEC.                                                    CAT820DB
                                                                        CAT820DB
           IF SQLCODE  = +0                                             CAT820DB
DJ0001         DISPLAY 'DELETED CASH FOR '                              CAT820DB
DJ0001                  WS-CLIENT-NBR ' ' CASH-CONTROL-NBR              CAT820DB
DJ0001                ' CMS=' CSH-MGN-SHRT-CD OF DCLACTIAST             CAT820DB
DJ0001                    ' ' STTLM-RSN-CD OF DCLACTIAST                CAT820DB
DJ0001                      ' CASH IS ZERO'                             CAT820DB
               ADD 1 TO W-ACTIAST-DEL-CNT                               CAT820DB
               ADD 1 TO W-COMMIT-CTR                                    CAT820DB
           ELSE                                                         CAT820DB
               DISPLAY 'CAT820: ERROR DELETING A ROW IN ACTIAST'        CAT820DB
                      ' (ACAT-ASSET TABLE)'                             CAT820DB
               DISPLAY 'SQLCODE = ' SQLCODE                             CAT820DB
               DISPLAY 'CAT820: INPUT  REC ='                           CAT820DB
                      '(' CASH-DETAIL-RECORD ')'                        CAT820DB
               DISPLAY 'CAT820DB: DCLACTIAST  ='                        CAT820DB
                      '(' DCLACTIAST ')'                                CAT820DB
               PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                  CAT820DB
           END-IF.                                                      CAT820DB
                                                                        CAT820DB
       0250-FIND-NSCC-PEND-FUL.                                         CAT820DB
           EXEC SQL OPEN ACTIAST_CRSR END-EXEC                          CAT820DB
           IF SQLCODE NOT = +0                                          CAT820DB
              MOVE 2500 TO ABEND-CD                                     CAT820DB
              PERFORM 8500-SQL-ERROR THRU 8500-EXIT                     CAT820DB
           END-IF.                                                      CAT820DB
                                                                        CAT820DB
           EXEC SQL                                                     CAT820DB
               FETCH ACTIAST_CRSR                                       CAT820DB
                    INTO                                                CAT820DB
                   :DCLACTIAST.NSCC-PEND-CD                             CAT820DB
           END-EXEC.                                                    CAT820DB
                                                                        CAT820DB
           EVALUATE SQLCODE                                             CAT820DB
              WHEN +100                                                 CAT820DB
                 MOVE 'H' TO NSCC-PEND-CD OF DCLACTIAST                 CAT820DB
DJ0001           DISPLAY  WS-CLIENT-NBR ' ' CASH-CONTROL-NBR            CAT820DB
                        ' DEFAULT NSCC PEND TO H'                       CAT820DB
              WHEN +0                                                   CAT820DB
DJ0001           DISPLAY  WS-CLIENT-NBR ' ' CASH-CONTROL-NBR            CAT820DB
                        ' FOUND NSCC PEND SAMPLE OK = '                 CAT820DB
                          NSCC-PEND-CD OF DCLACTIAST                    CAT820DB
              WHEN OTHER                                                CAT820DB
                    MOVE 2510 TO ABEND-CD                               CAT820DB
                    PERFORM 8500-SQL-ERROR THRU 8500-EXIT               CAT820DB
           END-EVALUATE.                                                CAT820DB
                                                                        CAT820DB
           EXEC SQL                                                     CAT820DB
              CLOSE ACTIAST_CRSR                                        CAT820DB
           END-EXEC.                                                    CAT820DB
                                                                        CAT820DB
       0260-FIND-NSCC-PEND-OTHER.                                       CAT820DB
           EXEC SQL OPEN ACTIAST_CRSR2 END-EXEC                         CAT820DB
           IF SQLCODE NOT = +0                                          CAT820DB
              MOVE 2600 TO ABEND-CD                                     CAT820DB
              PERFORM 8500-SQL-ERROR THRU 8500-EXIT                     CAT820DB
           END-IF.                                                      CAT820DB
                                                                        CAT820DB
           EXEC SQL                                                     CAT820DB
               FETCH ACTIAST_CRSR2                                      CAT820DB
                    INTO                                                CAT820DB
                   :DCLACTIAST.NSCC-PEND-CD                             CAT820DB
           END-EXEC.                                                    CAT820DB
                                                                        CAT820DB
           EVALUATE SQLCODE                                             CAT820DB
              WHEN +100                                                 CAT820DB
                 MOVE 'H' TO NSCC-PEND-CD OF DCLACTIAST                 CAT820DB
                 DISPLAY 'DEFAULT NSCC PEND TO H'                       CAT820DB
              WHEN +0                                                   CAT820DB
                 DISPLAY 'FOUND NSCC PEND SAMPLE OK = '                 CAT820DB
                     NSCC-PEND-CD OF DCLACTIAST                         CAT820DB
              WHEN OTHER                                                CAT820DB
                    MOVE 2620 TO ABEND-CD                               CAT820DB
                    PERFORM 8500-SQL-ERROR THRU 8500-EXIT               CAT820DB
           END-EVALUATE.                                                CAT820DB
                                                                        CAT820DB
           EXEC SQL                                                     CAT820DB
              CLOSE ACTIAST_CRSR2                                       CAT820DB
           END-EXEC.                                                    CAT820DB
                                                                        CAT820DB
           EJECT                                                        CAT820DB
       0300-UPDATE-DB2-FEES-RTN.                                        CAT820DB
LRM006     IF CASH-FRGN-FEE-AMT-TOT NOT = ZERO                          CAT820DB
LRM006        MOVE 'Y' TO FOREIGN-FEE-IND OF DCLVTRNFR                          
LRM006     ELSE                                                                 
LRM006        MOVE ' ' TO FOREIGN-FEE-IND OF DCLVTRNFR                          
LRM006     END-IF.                                                              
           EXEC SQL UPDATE VTRNFR                                       CAT820DB
               SET                                                      CAT820DB
                   ACCT_TRNFR_FEE_AMT  =  :CASH-TRNFR-FEE-AMT           CAT820DB
                  ,ACCT_IRA_TRMNT_AMT  =  :CASH-IRA-TRMNT-AMT           CAT820DB
                  ,ACCT_IRA_MAINT_AMT  =  :CASH-IRA-MAINT-AMT           CAT820DB
LRM006            ,FOREIGN_FEE_AMT     =  :CASH-FRGN-FEE-AMT-TOT        CAT820DB
LRM006            ,FOREIGN_FEE_IND     =  :DCLVTRNFR.FOREIGN-FEE-IND            
LRM009            ,PAPER_FEE_AMT       =  :CASH-PAPER-STMNT-FEE-AMT             
                WHERE (CLIENT_NBR                                       CAT820DB
                              = :WS-CLIENT-NBR                          CAT820DB
                     AND ACAT_CONTROL_NBR                               CAT820DB
                              = :CASH-CONTROL-NBR)                      CAT820DB
           END-EXEC.                                                    CAT820DB
                                                                        CAT820DB
           IF  SQLCODE  =  +0                                           CAT820DB
               ADD 1 TO W-VTRNFR-UPD-CNT                                CAT820DB
               ADD 1 TO W-COMMIT-CTR                                    CAT820DB
                                                                        CAT820DB
           ELSE                                                         CAT820DB
               ADD 1 TO W-VTRNFR-NOT-UPD-CNT                            CAT820DB
               DISPLAY '   VTRNFR NOT UPDATED.'                         CAT820DB
                                ' SQLCODE = ' SQLCODE                   CAT820DB
               DISPLAY '   VTRNFR PRIMARY KEY:'                         CAT820DB
                         ' CLT=' WS-CLIENT-NBR                          CAT820DB
                         ' CTL=' CASH-CONTROL-NBR                       CAT820DB
               DISPLAY '   CASH-DETAIL-KEY: ' CASH-DETAIL-KEY           CAT820DB
               DISPLAY '   TFR=' CASH-TRNFR-TYPE-CD                     CAT820DB
                         ' TRNFR-FEE=' CASH-TRNFR-FEE-AMT               CAT820DB
                         ' IRA-TRMNT=' CASH-IRA-TRMNT-AMT               CAT820DB
                         ' IRA-MAINT=' CASH-IRA-MAINT-AMT               CAT820DB
LRM006                   ' FRGN FEE =' CASH-FRGN-FEE-AMT-TOT            CAT820DB
               IF  SQLCODE  =  +100                                     CAT820DB
                   CONTINUE                                             CAT820DB
               ELSE                                                     CAT820DB
                   DISPLAY ' '                                          CAT820DB
                   DISPLAY 'CAT820DB: ERROR UPDATING A ROW IN VTRNFR'   CAT820DB
                         ' (ACAT-ASSET TABLE)'                          CAT820DB
                   DISPLAY 'CAT820DB: INPUT  REC ='                     CAT820DB
                        '(' CASH-DETAIL-RECORD ')'                      CAT820DB
                   DISPLAY 'CAT820DB: DCLVTRNFR  ='                     CAT820DB
                        '(' DCLVTRNFR   ')'                             CAT820DB
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT              CAT820DB
               END-IF                                                   CAT820DB
           END-IF.                                                      CAT820DB
                                                                        CAT820DB
           EJECT                                                        CAT820DB
       0400-FIND-INITIAL-TRNFR.                                         CAT820DB
           EXEC SQL SELECT                                              CAT820DB
                   ACAT_CONTROL_NBR                                     CAT820DB
                 INTO                                                   CAT820DB
                   :DCLACTITRF.ACAT-CONTROL-NBR                         CAT820DB
                 FROM ACTITRF                                           CAT820DB
                  WHERE  CLIENT_NBR                                     CAT820DB
                              = :WS-CLIENT-NBR                          CAT820DB
                     AND DLVR_NBR                                       CAT820DB
                              = :CASH-DLVR-NBR                          CAT820DB
                     AND ACCT_DLVR_NBR                                  CAT820DB
                              = :CASH-DLVR-ACCT                         CAT820DB
                     AND RCV_NBR                                        CAT820DB
                              = :CASH-RCV-NBR                           CAT820DB
                     AND ACCT_RCV_NBR                                   CAT820DB
                              = :CASH-RCV-ACCT                          CAT820DB
                     AND TRNFR_TYPE_CD                                  CAT820DB
LRM002                        = :CASH-TRNFR-TYPE-CD                     CAT820DB
093200      END-EXEC.                                                   CAT820DB
093300*                                                                 CAT820DB
           IF  SQLCODE = +0                                             CAT820DB
               SET INITIAL-TRNFR-FOUND TO TRUE                          CAT820DB
LRM002         DISPLAY 'FOUND ' CASH-TRNFR-TYPE-CD ' ON INIT TRNFR '    CAT820DB
TEST                   ACAT-CONTROL-NBR OF DCLACTITRF                   CAT820DB
           ELSE                                                         CAT820DB
           IF SQLCODE = +100                                            CAT820DB
               SET INITIAL-TRNFR-NOT-FOUND TO TRUE                      CAT820DB
           ELSE                                                         CAT820DB
               DISPLAY 'CAT820: ERROR SELECTING A ROW FROM ACTITRF'     CAT820DB
               DISPLAY 'SQLCODE = ' SQLCODE                             CAT820DB
               DISPLAY 'CAT820DB: INPUT  REC ='                         CAT820DB
                      '(' CASH-DETAIL-RECORD ')'                        CAT820DB
               DISPLAY 'CAT820DB: DCLACTITRF  ='                        CAT820DB
                      '(' DCLACTITRF ')'                                CAT820DB
               PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                  CAT820DB
           END-IF.                                                      CAT820DB
           EJECT                                                        CAT820DB
       3000-PROCESS-OTHER-ADJ-FILE.                                     CAT820DB
******* USE CURSOR TO OBTAIN KEYS TO TIF; THERE SHOULD ONLY BE ONE TIF  CAT820DB
******* FOR THIS CLIENT-BRANCH-ACCOUNT ON THE ACTIVE TRANSFER TABLE.    CAT820DB
                                                                        CAT820DB
           MOVE '0'            TO  WS-CLIENT-NBR (1 : 1).               CAT820DB
           MOVE OTH-ADP-CL-NO  TO  WS-CLIENT-NBR (2 : 3).               CAT820DB
           MOVE OTH-BRANCH-ACCOUNT TO CASH-DLVR-ACCT.                   CAT820DB
           MOVE OTH-BRANCH-ACCOUNT(1 : 3) TO WS-BRANCH-CD.              CAT820DB
           MOVE OTH-BRANCH-ACCOUNT(4 : 5) TO WS-ACCT-CD.                CAT820DB
                                                                        CAT820DB
           EXEC SQL OPEN VTRNFR_CRSR END-EXEC                           CAT820DB
           IF SQLCODE NOT = +0                                          CAT820DB
              MOVE 3000 TO ABEND-CD                                     CAT820DB
              PERFORM 8500-SQL-ERROR THRU 8500-EXIT                     CAT820DB
           END-IF.                                                      CAT820DB
                                                                        CAT820DB
           EXEC SQL                                                     CAT820DB
               FETCH VTRNFR_CRSR                                        CAT820DB
                    INTO                                                CAT820DB
                   :DCLVTRNFR.DLVR-NBR                                  CAT820DB
                  ,:DCLVTRNFR.ACCT-DLVR-NBR                             CAT820DB
                  ,:DCLVTRNFR.RCV-NBR                                   CAT820DB
                  ,:DCLVTRNFR.ACCT-RCV-NBR                              CAT820DB
                  ,:DCLVTRNFR.TRNFR-TYPE-CD                             CAT820DB
                  ,:DCLVTRNFR.ACAT-CONTROL-NBR                          CAT820DB
           END-EXEC.                                                    CAT820DB
                                                                        CAT820DB
           EVALUATE SQLCODE                                             CAT820DB
              WHEN +100                                                 CAT820DB
                 DISPLAY 'ACTIVE TRANSFER MISSING FOR '                 CAT820DB
                     OTH-ADP-CL-NO ' '  OTH-BRANCH-ACCOUNT              CAT820DB
              WHEN +0                                                   CAT820DB
                 DISPLAY 'FOUND ACTIVE TRANSFER FOR '                   CAT820DB
                     OTH-ADP-CL-NO ' '  OTH-BRANCH-ACCOUNT              CAT820DB
                 INITIALIZE CASH-DETAIL-RECORD                          CAT820DB
                 MOVE WS-CLIENT-NBR(2 : 3)   TO CASH-ADP-CL-NO-X        CAT820DB
                 MOVE DLVR-NBR      OF DCLVTRNFR TO  CASH-DLVR-NBR      CAT820DB
                 MOVE ACCT-DLVR-NBR OF DCLVTRNFR TO  CASH-DLVR-ACCT     CAT820DB
                 MOVE RCV-NBR       OF DCLVTRNFR TO  CASH-RCV-NBR       CAT820DB
                 MOVE ACCT-RCV-NBR  OF DCLVTRNFR TO  CASH-RCV-ACCT      CAT820DB
                 MOVE 'FUL'                 TO CASH-TRNFR-TYPE-CD       CAT820DB
                 MOVE 'INT'                 TO CASH-TRNFR-TYPE-SOURCE   CAT820DB
                 MOVE OTH-ADJUST-TYPE1      TO CASH-NET-ADJUST-TYPE1    CAT820DB
                 MOVE OTH-ADJUST-TYPE2      TO CASH-NET-ADJUST-TYPE2    CAT820DB
LRM005           MOVE ACAT-CONTROL-NBR OF DCLVTRNFR TO                          
LRM005                                         CASH-CONTROL-NBR                 
                 PERFORM 0200-UPDATE-CASH-ASSET-RTN THRU 0200-EXIT      CAT820DB
                                                                        CAT820DB
LRM004           MOVE SPACES TO CATMATH-RECORD                          CAT820DB
LRM004           MOVE WS-CLIENT-NBR          TO CATMATH-CLIENT-NBR      CAT820DB
LRM004           MOVE ACAT-CONTROL-NBR OF DCLVTRNFR TO                  CAT820DB
LRM004                                         CATMATH-ACATS-CNTL-NBR   CAT820DB
LRM004           MOVE ACCT-DLVR-NBR OF DCLVTRNFR TO  CATMATH-BRANCH     CAT820DB
LRM004           MOVE ACCT-DLVR-NBR OF DCLVTRNFR (4 : 5)                CAT820DB
LRM004                                           TO  CATMATH-ACCOUNT    CAT820DB
LRM004           IF OTH-ADJUST-SOURCE = 'CAT814'                        CAT820DB
LRM004              SET CATMATH-CONVENIENCE-ACCOUNT TO TRUE             CAT820DB
LRM004           ELSE                                                   CAT820DB
LRM004              SET CATMATH-OLMI TO TRUE                            CAT820DB
LRM004           END-IF                                                 CAT820DB
LRM004           IF OTH-ADJUST-TYPE1 NOT = ZERO                         CAT820DB
LRM004              MOVE '1'             TO  CATMATH-ACCOUNT-TYPE-FROM  CAT820DB
LRM004                                       CATMATH-ACCOUNT-TYPE-TO    CAT820DB
LRM004              MOVE OTH-ADJUST-TYPE1 TO CATMATH-BALANCE            CAT820DB
LRM004              IF OTH-ADJUST-TYPE1 LESS 0.00                       CAT820DB
LRM004                 SET CATMATH-BALANCE-CREDIT TO TRUE               CAT820DB
LRM004              ELSE                                                CAT820DB
LRM004                 SET CATMATH-BALANCE-DEBIT TO TRUE                CAT820DB
LRM004              END-IF                                              CAT820DB
LRM004              SET CATMATH-BALANCE-APPLIED-YES TO TRUE             CAT820DB
LRM004              WRITE CATMATH-RECORD                                CAT820DB
LRM004              ADD 1 TO W-MATH-RECS-WRTN                           CAT820DB
LRM004           END-IF                                                 CAT820DB
LRM004           IF OTH-ADJUST-TYPE2 NOT = ZERO                         CAT820DB
LRM004              MOVE '2'             TO  CATMATH-ACCOUNT-TYPE-FROM  CAT820DB
LRM004                                       CATMATH-ACCOUNT-TYPE-TO    CAT820DB
LRM004              MOVE OTH-ADJUST-TYPE2 TO CATMATH-BALANCE            CAT820DB
LRM004              IF OTH-ADJUST-TYPE2 LESS 0.00                       CAT820DB
LRM004                 SET CATMATH-BALANCE-CREDIT TO TRUE               CAT820DB
LRM004              ELSE                                                CAT820DB
LRM004                 SET CATMATH-BALANCE-DEBIT TO TRUE                CAT820DB
LRM004              END-IF                                              CAT820DB
LRM004              SET CATMATH-BALANCE-APPLIED-YES TO TRUE             CAT820DB
LRM004              WRITE CATMATH-RECORD                                CAT820DB
LRM004              ADD 1 TO W-MATH-RECS-WRTN                           CAT820DB
LRM004           END-IF                                                 CAT820DB
                                                                        CAT820DB
              WHEN OTHER                                                CAT820DB
                    MOVE 3200 TO ABEND-CD                               CAT820DB
                    PERFORM 8500-SQL-ERROR THRU 8500-EXIT               CAT820DB
           END-EVALUATE.                                                CAT820DB
                                                                        CAT820DB
           EXEC SQL                                                     CAT820DB
              CLOSE VTRNFR_CRSR                                         CAT820DB
           END-EXEC.                                                    CAT820DB
                                                                        CAT820DB
           READ NON-ACAT-ADJUSTMENT-FILE                                CAT820DB
              AT END                                                    CAT820DB
                 SET OTHER-ADJ-EOF TO TRUE.                             CAT820DB
       3000-EXIT. EXIT.                                                 CAT820DB
           EJECT                                                        CAT820DB
DJ0001 4000-CHECK-FOR-ACCT-FLAT.                                        CAT820DB
DJ0001*** FOR FUL TRANSFERS, COUNT HOW MANY ASSETS ARE ON ACTIAST.      CAT820DB
DJ0001*** IF NONE, OR IF ONLY ONE(DEBIT CASH), CREATE REJECT FLAT       CAT820DB
DJ0001                                                                  CAT820DB
DJ0001     MOVE +0 TO W-ACTIAST-ROW-CNT                                 CAT820DB
DJ0001     EXEC SQL                                                     CAT820DB
DJ0001           SELECT COUNT(*)                                        CAT820DB
DJ0001             INTO :W-ACTIAST-ROW-CNT                              CAT820DB
DJ0001             FROM ACTIAST                                         CAT820DB
DJ0001        WHERE CLIENT_NBR        = :WS-CLIENT-NBR                  CAT820DB
DJ0001          AND ACAT_CONTROL_NBR  = :CASH-CONTROL-NBR               CAT820DB
DJ0001     END-EXEC.                                                    CAT820DB
DJ0001     IF SQLCODE  =  +0                                            CAT820DB
DJ0001        IF W-ACTIAST-ROW-CNT = 0                                  CAT820DB
DJ0001           DISPLAY '   4000: NO ASSETS FOUND. CREATE REJECT FLAT' CAT820DB
LRM008            ' ' WS-CLIENT-NBR ' ' CASH-CONTROL-NBR                        
DJ0001           PERFORM 4100-CREATE-REJECT-FLAT                        CAT820DB
DJ0001           PERFORM 4400-UPDATE-VTRNFR-FLAT                        CAT820DB
DJ0001        ELSE                                                      CAT820DB
DJ0001           IF W-ACTIAST-ROW-CNT = 1                               CAT820DB
DJ0001           AND STTLM-RSN-CD OF DCLACTIAST = 'DEB'                 CAT820DB
DJ0001           DISPLAY '   4000: ONLY DEBIT FOUND. CREATE REJECT FLAT'CAT820DB
DJ0001              PERFORM 4100-CREATE-REJECT-FLAT                     CAT820DB
DJ0001              PERFORM 4400-UPDATE-VTRNFR-FLAT                     CAT820DB
DJ0001           ELSE                                                   CAT820DB
DJ0001           DISPLAY '   4000: CASH WITH OTHER ASSETS'              CAT820DB
DJ0001              ' ACTIAST-ROW-CNT=' W-ACTIAST-ROW-CNT               CAT820DB
DJ0001           END-IF                                                 CAT820DB
DJ0001        END-IF                                                    CAT820DB
DJ0001     END-IF.                                                      CAT820DB
DJ0001 4000-EXIT. EXIT.                                                 CAT820DB
           EJECT                                                        CAT820DB
DJ0001 4100-CREATE-REJECT-FLAT.                                         CAT820DB
DJ0001*** UPDATE ACTITRF WITH REJECT                                    CAT820DB
DJ0001*** CREATE REJECT FLAT IF ACCT FLAT OR DEBIT CASH ONLY            CAT820DB
DJ0001*** SET FLAT INDICATOR "'D" FOR ACCT FLAT RESULT OF FEES          CAT820DB
DJ0001     MOVE 'R'                 TO TRANS-TYPE-CD      OF DCLACTITRF CAT820DB
DJ0001     MOVE '04'                TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF CAT820DB
DJ0001     MOVE 'D'                 TO TRNFR-TYPE-RJC2-CD OF DCLACTITRF CAT820DB
DJ0001     MOVE ' '                 TO CICS-TERM-ID-CD    OF DCLACTITRF CAT820DB
DJ0001     MOVE WS-TIMESTAMP        TO UPDT-TMSTP         OF DCLACTITRF CAT820DB
DJ0001     MOVE 'CAT820DB'          TO PRGM-NM            OF DCLACTITRF CAT820DB
DJ0001     MOVE ' '                 TO NSCC-PEND-CD       OF DCLACTITRF CAT820DB
DJ0001     EXEC SQL                                                     CAT820DB
DJ0001       UPDATE ACTITRF                                             CAT820DB
DJ0001          SET                                                     CAT820DB
DJ0001             TRANS_TYPE_CD       = :DCLACTITRF.TRANS-TYPE-CD      CAT820DB
DJ0001            ,TRNFR_TYPE_RJCT_CD  = :DCLACTITRF.TRNFR-TYPE-RJCT-CD CAT820DB
DJ0001            ,TRNFR_TYPE_RJC2_CD  = :DCLACTITRF.TRNFR-TYPE-RJC2-CD CAT820DB
DJ0001            ,CICS_TERM_ID_CD     = :DCLACTITRF.CICS-TERM-ID-CD    CAT820DB
DJ0001            ,UPDT_TMSTP          = :DCLACTITRF.UPDT-TMSTP         CAT820DB
DJ0001            ,PRGM_NM             = :DCLACTITRF.PRGM-NM            CAT820DB
DJ0001            ,NSCC_PEND_CD        = :DCLACTITRF.NSCC-PEND-CD       CAT820DB
DJ0001        WHERE CLIENT_NBR        = :WS-CLIENT-NBR                  CAT820DB
DJ0001          AND ACAT_CONTROL_NBR  = :CASH-CONTROL-NBR               CAT820DB
DJ0001     END-EXEC.                                                    CAT820DB
DJ0001     MOVE SQLCODE                  TO W-DB2-SQLCODE               CAT820DB
DJ0001     IF  SQLCODE  =  +0                                           CAT820DB
DJ0001         DISPLAY '4100: ACTITRF REJECT FLAT UPDATED'              CAT820DB
DJ0001          ADD 1 TO W-ACTITRF-UPD-CNT                              CAT820DB
DJ0001     ELSE                                                         CAT820DB
DJ0001         IF  SQLCODE  =  +100                                     CAT820DB
DJ0001             PERFORM 4200-SELECT-VTRNFR                           CAT820DB
DJ0001             PERFORM 4300-INSERT-ACTITRF                          CAT820DB
DJ0001         ELSE                                                     CAT820DB
DJ0001             DISPLAY '   4100: ACTITRF REJECT FLAT NOT UPDATED.'  CAT820DB
DJ0001             ' SQLCODE= ' W-DB2-SQLCODE                           CAT820DB
DJ0001             DISPLAY 'DCLACTITRF= 'DCLACTITRF                     CAT820DB
DJ0001         END-IF                                                   CAT820DB
DJ0001     END-IF.                                                      CAT820DB
DJ0001 4100-EXIT. EXIT.                                                 CAT820DB
DJ0001 4200-SELECT-VTRNFR.                                              CAT820DB
DJ0001*** IF THERE ARE NO EXISTING ACTITRF,CREATE ONE OUT OF VTRNFR     CAT820DB
DJ0001*** GET DATA FROM VTRNFR TO CREATE ACTITRF                        CAT820DB
DJ0001     INITIALIZE DCLVTRNFR                                         CAT820DB
DJ0001                                                                  CAT820DB
DJ0001     EXEC SQL SELECT                                              CAT820DB
DJ0001              CLIENT_NBR                                          CAT820DB
DJ0001             ,ACAT_CONTROL_NBR                                    CAT820DB
DJ0001             ,SBMTG_PRTCP_NBR                                     CAT820DB
DJ0001             ,SBMT_PRT_NR_STS_CD                                  CAT820DB
DJ0001             ,CONTROL_NBR_STS_CD                                  CAT820DB
DJ0001             ,DLVR_NBR                                            CAT820DB
DJ0001             ,DLVR_NBR_STTS_CD                                    CAT820DB
DJ0001             ,ACCT_DLVR_NBR                                       CAT820DB
DJ0001             ,ACCT_DLVR_STTS_CD                                   CAT820DB
DJ0001             ,RCV_NBR                                             CAT820DB
DJ0001             ,RCV_NBR_STTS_CD                                     CAT820DB
DJ0001             ,ACCT_RCV_NBR                                        CAT820DB
DJ0001             ,ACCT_RCV_STTS_CD                                    CAT820DB
DJ0001             ,TRNFR_TYPE_CD                                       CAT820DB
DJ0001             ,TRNFR_TYPE_STTS_CD                                  CAT820DB
DJ0001             ,TRANS_TYPE_CD                                       CAT820DB
DJ0001             ,TRANS_TYPE_STTS_CD                                  CAT820DB
DJ0001             ,RCV_CUST_NM                                         CAT820DB
DJ0001             ,RCV_CUST_NM_STS_CD                                  CAT820DB
DJ0001             ,RCV_SS_PRIM_NBR                                     CAT820DB
DJ0001             ,RCV_SS_PRIM_STS_CD                                  CAT820DB
DJ0001             ,RCV_SS_SCNDY_NBR                                    CAT820DB
DJ0001             ,RCV_SS_SCDY_STS_CD                                  CAT820DB
DJ0001             ,RCV_ACCT_TYPE_CD                                    CAT820DB
DJ0001             ,RCV_ACT_TYP_STS_CD                                  CAT820DB
DJ0001             ,RCV_OCC_BRKR_NBR                                    CAT820DB
DJ0001             ,RCV_OCC_STTS_CD                                     CAT820DB
DJ0001             ,RCV_CRSPN_NBR                                       CAT820DB
DJ0001             ,RCV_CRSPN_STTS_CD                                   CAT820DB
DJ0001             ,ACAT_CNTL_ASTD_NBR                                  CAT820DB
DJ0001             ,CNTL_ASTD_STTS_CD                                   CAT820DB
DJ0001             ,CMNT_TXT                                            CAT820DB
DJ0001             ,CMNT_STTS_CD                                        CAT820DB
DJ0001             ,PRCS_DT                                             CAT820DB
DJ0001             ,STTS_CD                                             CAT820DB
DJ0001             ,STTLM_TM_CD                                         CAT820DB
DJ0001             ,VAL_FREE_CD                                         CAT820DB
DJ0001             ,TRANS_RFRN_ID_CD                                    CAT820DB
DJ0001             ,TRANS_RFRN_STTS_CD                                  CAT820DB
DJ0001             ,DB_CR_CD                                            CAT820DB
DJ0001             ,DSTBN_SIDE_CD                                       CAT820DB
DJ0001             ,SYS_ACT_CD                                          CAT820DB
DJ0001             ,SYS_RJCT_RSN_CD                                     CAT820DB
DJ0001             ,TRNFR_TYPE_RJC1_CD                                  CAT820DB
DJ0001             ,TRNFR_TYPE_RJC2_CD                                  CAT820DB
DJ0001             ,TRNFR_TYPE_RJCT_CD                                  CAT820DB
DJ0001             ,TRN_TYP_RJC_STS_CD                                  CAT820DB
DJ0001             ,PHSCL_SEQ_NBR                                       CAT820DB
DJ0001             ,PHSCL_SEQ_STTS_CD                                   CAT820DB
DJ0001             ,LGCL_SEQ_NBR                                        CAT820DB
DJ0001             ,LGCL_SEQ_NR_STS_CD                                  CAT820DB
DJ0001             ,RR_CD                                               CAT820DB
DJ0001             ,BRANCH_CD                                           CAT820DB
DJ0001             ,DVDND_NAA_CD                                        CAT820DB
DJ0001             ,SELL_INSTN_NAA_CD                                   CAT820DB
DJ0001             ,CASH_SWEEP_NAA_CD                                   CAT820DB
DJ0001             ,PRTCP_CONTRA_CD                                     CAT820DB
DJ0001             ,ACM_HOLDER_NAA_CD                                   CAT820DB
DJ0001             ,ACCT_ACTIVITY_IND                                   CAT820DB
DJ0001             ,ACCT_ORDERS_IND                                     CAT820DB
DJ0001             ,ACCT_RJCT_RSBM_IND                                  CAT820DB
DJ0001             ,ACCT_DB_BAL_T1_IND                                  CAT820DB
DJ0001             ,ACCT_MRGN_DB_IND                                    CAT820DB
DJ0001             ,ACCT_SHRT_PSTN_IND                                  CAT820DB
DJ0001             ,ACCT_SEC_RSTRD_IND                                  CAT820DB
DJ0001             ,ACCT_AST_EXCS_IND                                   CAT820DB
DJ0001             ,ACCT_OPTN_PSTN_IND                                  CAT820DB
DJ0001             ,ACCT_LTD_PRTNR_IND                                  CAT820DB
DJ0001             ,ACCT_TIN_MSMTH_IND                                  CAT820DB
DJ0001             ,ACCT_DPLCT_TRN_IND                                  CAT820DB
DJ0001             ,ACCT_CUST_70_IND                                    CAT820DB
DJ0001             ,ACCT_QULFD_PLN_IND                                  CAT820DB
DJ0001             ,ACCT_MNGD_IND                                       CAT820DB
DJ0001             ,ACCT_PRVT_RNG_IND                                   CAT820DB
DJ0001             ,ACCT_BRKR_TIF_IND                                   CAT820DB
DJ0001             ,NSCC_NON_ADP_IND                                    CAT820DB
DJ0001             ,CYCLE_CD                                            CAT820DB
DJ0001             ,DAYS_STTS_QTY                                       CAT820DB
DJ0001             ,STTLM_DT                                            CAT820DB
DJ0001             ,ACCT_NA_UPDT_IND                                    CAT820DB
DJ0001             ,ACCT_TRNFR_FEE_AMT                                  CAT820DB
DJ0001             ,ACCT_IRA_TRMNT_AMT                                  CAT820DB
DJ0001             ,ACCT_IRA_MAINT_AMT                                  CAT820DB
LRM008             ,FOREIGN_FEE_AMT                                             
DJ0001             ,ACCT_DLRV_PRGR_IND                                  CAT820DB
DJ0001             ,ACCT_CD                                             CAT820DB
DJ0001             ,STTLM_ASCTD_DT                                      CAT820DB
DJ0001             ,STTLM_ASCTD_STS_CD                                  CAT820DB
DJ0001             ,RCRD_LNGTH_STTS_CD                                  CAT820DB
DJ0001             ,RCRD_STTS_CD                                        CAT820DB
DJ0001             ,NSCC_PEND_CD                                        CAT820DB
DJ0001             ,NSCC_ACK_IND                                        CAT820DB
DJ0001             ,CICS_TERM_ID_CD                                     CAT820DB
DJ0001             ,PRGM_NM                                             CAT820DB
DJ0001             ,CRT_TMSTP                                           CAT820DB
DJ0001             ,UPDT_TMSTP                                          CAT820DB
DJ0001             ,ACCT_EQUITY_AMT                                     CAT820DB
DJ0001             ,ALERT_IND                                           CAT820DB
DJ0001             ,ACCT_FRZN_IND                                       CAT820DB
DJ0001             ,CVRSN_ACCT_NBR                                      CAT820DB
DJ0001         INTO                                                     CAT820DB
DJ0001              :DCLVTRNFR.CLIENT-NBR                               CAT820DB
DJ0001             ,:DCLVTRNFR.ACAT-CONTROL-NBR                         CAT820DB
DJ0001             ,:DCLVTRNFR.SBMTG-PRTCP-NBR                          CAT820DB
DJ0001             ,:DCLVTRNFR.SBMT-PRT-NR-STS-CD                       CAT820DB
DJ0001             ,:DCLVTRNFR.CONTROL-NBR-STS-CD                       CAT820DB
DJ0001             ,:DCLVTRNFR.DLVR-NBR                                 CAT820DB
DJ0001             ,:DCLVTRNFR.DLVR-NBR-STTS-CD                         CAT820DB
DJ0001             ,:DCLVTRNFR.ACCT-DLVR-NBR                            CAT820DB
DJ0001             ,:DCLVTRNFR.ACCT-DLVR-STTS-CD                        CAT820DB
DJ0001             ,:DCLVTRNFR.RCV-NBR                                  CAT820DB
DJ0001             ,:DCLVTRNFR.RCV-NBR-STTS-CD                          CAT820DB
DJ0001             ,:DCLVTRNFR.ACCT-RCV-NBR                             CAT820DB
DJ0001             ,:DCLVTRNFR.ACCT-RCV-STTS-CD                         CAT820DB
DJ0001             ,:DCLVTRNFR.TRNFR-TYPE-CD                            CAT820DB
DJ0001             ,:DCLVTRNFR.TRNFR-TYPE-STTS-CD                       CAT820DB
DJ0001             ,:DCLVTRNFR.TRANS-TYPE-CD                            CAT820DB
DJ0001             ,:DCLVTRNFR.TRANS-TYPE-STTS-CD                       CAT820DB
DJ0001             ,:DCLVTRNFR.RCV-CUST-NM                              CAT820DB
DJ0001             ,:DCLVTRNFR.RCV-CUST-NM-STS-CD                       CAT820DB
DJ0001             ,:DCLVTRNFR.RCV-SS-PRIM-NBR                          CAT820DB
DJ0001             ,:DCLVTRNFR.RCV-SS-PRIM-STS-CD                       CAT820DB
DJ0001             ,:DCLVTRNFR.RCV-SS-SCNDY-NBR                         CAT820DB
DJ0001             ,:DCLVTRNFR.RCV-SS-SCDY-STS-CD                       CAT820DB
DJ0001             ,:DCLVTRNFR.RCV-ACCT-TYPE-CD                         CAT820DB
DJ0001             ,:DCLVTRNFR.RCV-ACT-TYP-STS-CD                       CAT820DB
DJ0001             ,:DCLVTRNFR.RCV-OCC-BRKR-NBR                         CAT820DB
DJ0001             ,:DCLVTRNFR.RCV-OCC-STTS-CD                          CAT820DB
DJ0001             ,:DCLVTRNFR.RCV-CRSPN-NBR                            CAT820DB
DJ0001             ,:DCLVTRNFR.RCV-CRSPN-STTS-CD                        CAT820DB
DJ0001             ,:DCLVTRNFR.ACAT-CNTL-ASTD-NBR                       CAT820DB
DJ0001             ,:DCLVTRNFR.CNTL-ASTD-STTS-CD                        CAT820DB
DJ0001             ,:DCLVTRNFR.CMNT-TXT                                 CAT820DB
DJ0001             ,:DCLVTRNFR.CMNT-STTS-CD                             CAT820DB
DJ0001             ,:DCLVTRNFR.PRCS-DT                                  CAT820DB
DJ0001             ,:DCLVTRNFR.STTS-CD                                  CAT820DB
DJ0001             ,:DCLVTRNFR.STTLM-TM-CD                              CAT820DB
DJ0001             ,:DCLVTRNFR.VAL-FREE-CD                              CAT820DB
DJ0001             ,:DCLVTRNFR.TRANS-RFRN-ID-CD                         CAT820DB
DJ0001             ,:DCLVTRNFR.TRANS-RFRN-STTS-CD                       CAT820DB
DJ0001             ,:DCLVTRNFR.DB-CR-CD                                 CAT820DB
DJ0001             ,:DCLVTRNFR.DSTBN-SIDE-CD                            CAT820DB
DJ0001             ,:DCLVTRNFR.SYS-ACT-CD                               CAT820DB
DJ0001             ,:DCLVTRNFR.SYS-RJCT-RSN-CD                          CAT820DB
DJ0001             ,:DCLVTRNFR.TRNFR-TYPE-RJC1-CD                       CAT820DB
DJ0001             ,:DCLVTRNFR.TRNFR-TYPE-RJC2-CD                       CAT820DB
DJ0001             ,:DCLVTRNFR.TRNFR-TYPE-RJCT-CD                       CAT820DB
DJ0001             ,:DCLVTRNFR.TRN-TYP-RJC-STS-CD                       CAT820DB
DJ0001             ,:DCLVTRNFR.PHSCL-SEQ-NBR                            CAT820DB
DJ0001             ,:DCLVTRNFR.PHSCL-SEQ-STTS-CD                        CAT820DB
DJ0001             ,:DCLVTRNFR.LGCL-SEQ-NBR                             CAT820DB
DJ0001             ,:DCLVTRNFR.LGCL-SEQ-NR-STS-CD                       CAT820DB
DJ0001             ,:DCLVTRNFR.RR-CD                                    CAT820DB
DJ0001             ,:DCLVTRNFR.BRANCH-CD                                CAT820DB
DJ0001             ,:DCLVTRNFR.DVDND-NAA-CD                             CAT820DB
DJ0001             ,:DCLVTRNFR.SELL-INSTN-NAA-CD                        CAT820DB
DJ0001             ,:DCLVTRNFR.CASH-SWEEP-NAA-CD                        CAT820DB
DJ0001             ,:DCLVTRNFR.PRTCP-CONTRA-CD                          CAT820DB
DJ0001             ,:DCLVTRNFR.ACM-HOLDER-NAA-CD                        CAT820DB
DJ0001             ,:DCLVTRNFR.ACCT-ACTIVITY-IND                        CAT820DB
DJ0001             ,:DCLVTRNFR.ACCT-ORDERS-IND                          CAT820DB
DJ0001             ,:DCLVTRNFR.ACCT-RJCT-RSBM-IND                       CAT820DB
DJ0001             ,:DCLVTRNFR.ACCT-DB-BAL-T1-IND                       CAT820DB
DJ0001             ,:DCLVTRNFR.ACCT-MRGN-DB-IND                         CAT820DB
DJ0001             ,:DCLVTRNFR.ACCT-SHRT-PSTN-IND                       CAT820DB
DJ0001             ,:DCLVTRNFR.ACCT-SEC-RSTRD-IND                       CAT820DB
DJ0001             ,:DCLVTRNFR.ACCT-AST-EXCS-IND                        CAT820DB
DJ0001             ,:DCLVTRNFR.ACCT-OPTN-PSTN-IND                       CAT820DB
DJ0001             ,:DCLVTRNFR.ACCT-LTD-PRTNR-IND                       CAT820DB
DJ0001             ,:DCLVTRNFR.ACCT-TIN-MSMTH-IND                       CAT820DB
DJ0001             ,:DCLVTRNFR.ACCT-DPLCT-TRN-IND                       CAT820DB
DJ0001             ,:DCLVTRNFR.ACCT-CUST-70-IND                         CAT820DB
DJ0001             ,:DCLVTRNFR.ACCT-QULFD-PLN-IND                       CAT820DB
DJ0001             ,:DCLVTRNFR.ACCT-MNGD-IND                            CAT820DB
DJ0001             ,:DCLVTRNFR.ACCT-PRVT-RNG-IND                        CAT820DB
DJ0001             ,:DCLVTRNFR.ACCT-BRKR-TIF-IND                        CAT820DB
DJ0001             ,:DCLVTRNFR.NSCC-NON-ADP-IND                         CAT820DB
DJ0001             ,:DCLVTRNFR.CYCLE-CD                                 CAT820DB
DJ0001             ,:DCLVTRNFR.DAYS-STTS-QTY                            CAT820DB
DJ0001             ,:DCLVTRNFR.STTLM-DT                                 CAT820DB
DJ0001             ,:DCLVTRNFR.ACCT-NA-UPDT-IND                         CAT820DB
DJ0001             ,:DCLVTRNFR.ACCT-TRNFR-FEE-AMT                       CAT820DB
DJ0001             ,:DCLVTRNFR.ACCT-IRA-TRMNT-AMT                       CAT820DB
DJ0001             ,:DCLVTRNFR.ACCT-IRA-MAINT-AMT                       CAT820DB
LRM006             ,:DCLVTRNFR.FOREIGN-FEE-AMT                          CAT820DB
DJ0001             ,:DCLVTRNFR.ACCT-DLRV-PRGR-IND                       CAT820DB
DJ0001             ,:DCLVTRNFR.ACCT-CD                                  CAT820DB
DJ0001             ,:DCLVTRNFR.STTLM-ASCTD-DT                           CAT820DB
DJ0001             ,:DCLVTRNFR.STTLM-ASCTD-STS-CD                       CAT820DB
DJ0001             ,:DCLVTRNFR.RCRD-LNGTH-STTS-CD                       CAT820DB
DJ0001             ,:DCLVTRNFR.RCRD-STTS-CD                             CAT820DB
DJ0001             ,:DCLVTRNFR.NSCC-PEND-CD                             CAT820DB
DJ0001             ,:DCLVTRNFR.NSCC-ACK-IND                             CAT820DB
DJ0001             ,:DCLVTRNFR.CICS-TERM-ID-CD                          CAT820DB
DJ0001             ,:DCLVTRNFR.PRGM-NM                                  CAT820DB
DJ0001             ,:DCLVTRNFR.CRT-TMSTP                                CAT820DB
DJ0001             ,:DCLVTRNFR.UPDT-TMSTP                               CAT820DB
DJ0001             ,:DCLVTRNFR.ACCT-EQUITY-AMT                          CAT820DB
DJ0001             ,:DCLVTRNFR.ALERT-IND                                CAT820DB
DJ0001             ,:DCLVTRNFR.ACCT-FRZN-IND                            CAT820DB
DJ0001             ,:DCLVTRNFR.CVRSN-ACCT-NBR                           CAT820DB
DJ0001         FROM  VTRNFR                                             CAT820DB
DJ0001          WHERE  CLIENT_NBR        = :WS-CLIENT-NBR               CAT820DB
DJ0001            AND  ACAT_CONTROL_NBR  = :CASH-CONTROL-NBR            CAT820DB
DJ0001     END-EXEC.                                                    CAT820DB
DJ0001 4200-EXIT. EXIT.                                                 CAT820DB
DJ0001 4300-INSERT-ACTITRF.                                             CAT820DB
DJ0001*** IF THERE ARE NO EXISTING ACTITRF,CREATE ONE OUT OF VTRNFR     CAT820DB
DJ0001*** CREATE REJECT FLAT IF ACCT FLAT OR DEBIT CASH ONLY            CAT820DB
DJ0001*** SET FLAT INDICATOR "'D" FOR ACCT FLAT RESULT OF FEES          CAT820DB
DJ0001                                                                  CAT820DB
DJ0001     MOVE CLIENT-NBR         OF DCLVTRNFR                         CAT820DB
DJ0001                             TO CLIENT-NBR         OF DCLACTITRF  CAT820DB
DJ0001     MOVE DSTBN-SIDE-CD      OF DCLVTRNFR                         CAT820DB
DJ0001                             TO DSTBN-SIDE-CD      OF DCLACTITRF  CAT820DB
DJ0001     MOVE ACAT-CONTROL-NBR   OF DCLVTRNFR                         CAT820DB
DJ0001                             TO ACAT-CONTROL-NBR   OF DCLACTITRF  CAT820DB
DJ0001     MOVE PRCS-DT            OF DCLVTRNFR                         CAT820DB
DJ0001                             TO PRCS-DT            OF DCLACTITRF  CAT820DB
DJ0001     MOVE CYCLE-CD           OF DCLVTRNFR                         CAT820DB
DJ0001                             TO CYCLE-CD           OF DCLACTITRF  CAT820DB
DJ0001     MOVE SYS-ACT-CD         OF DCLVTRNFR                         CAT820DB
DJ0001                             TO SYS-ACT-CD         OF DCLACTITRF  CAT820DB
DJ0001     MOVE SYS-RJCT-RSN-CD    OF DCLVTRNFR                         CAT820DB
DJ0001                             TO SYS-RJCT-RSN-CD    OF DCLACTITRF  CAT820DB
DJ0001     MOVE STTS-CD            OF DCLVTRNFR                         CAT820DB
DJ0001                             TO STTS-CD            OF DCLACTITRF  CAT820DB
DJ0001     MOVE DAYS-STTS-QTY      OF DCLVTRNFR                         CAT820DB
DJ0001                             TO DAYS-STTS-QTY      OF DCLACTITRF  CAT820DB
DJ0001     MOVE RCRD-STTS-CD       OF DCLVTRNFR                         CAT820DB
DJ0001                             TO RCRD-STTS-CD       OF DCLACTITRF  CAT820DB
DJ0001     MOVE RCRD-LNGTH-STTS-CD OF DCLVTRNFR                         CAT820DB
DJ0001                             TO RCRD-LNGTH-STTS-CD OF DCLACTITRF  CAT820DB
DJ0001     MOVE PHSCL-SEQ-STTS-CD  OF DCLVTRNFR                         CAT820DB
DJ0001                             TO PHSCL-SEQ-STTS-CD  OF DCLACTITRF  CAT820DB
DJ0001     MOVE LGCL-SEQ-NR-STS-CD OF DCLVTRNFR                         CAT820DB
DJ0001                             TO LGCL-SEQ-NR-STS-CD OF DCLACTITRF  CAT820DB
DJ0001     MOVE TRANS-TYPE-STTS-CD OF DCLVTRNFR                         CAT820DB
DJ0001                             TO TRANS-TYPE-STTS-CD OF DCLACTITRF  CAT820DB
DJ0001     MOVE CONTROL-NBR-STS-CD OF DCLVTRNFR                         CAT820DB
DJ0001                             TO CONTROL-NBR-STS-CD OF DCLACTITRF  CAT820DB
DJ0001     MOVE TRNFR-TYPE-STTS-CD OF DCLVTRNFR                         CAT820DB
DJ0001                             TO TRNFR-TYPE-STTS-CD OF DCLACTITRF  CAT820DB
DJ0001     MOVE SBMT-PRT-NR-STS-CD OF DCLVTRNFR                         CAT820DB
DJ0001                             TO SBMT-PRT-NR-STS-CD OF DCLACTITRF  CAT820DB
DJ0001     MOVE RCV-NBR-STTS-CD    OF DCLVTRNFR                         CAT820DB
DJ0001                             TO RCV-NBR-STTS-CD    OF DCLACTITRF  CAT820DB
DJ0001     MOVE DLVR-NBR-STTS-CD   OF DCLVTRNFR                         CAT820DB
DJ0001                             TO DLVR-NBR-STTS-CD   OF DCLACTITRF  CAT820DB
DJ0001     MOVE ACCT-RCV-STTS-CD   OF DCLVTRNFR                         CAT820DB
DJ0001                             TO ACCT-RCV-STTS-CD   OF DCLACTITRF  CAT820DB
DJ0001     MOVE RCV-CUST-NM-STS-CD OF DCLVTRNFR                         CAT820DB
DJ0001                             TO RCV-CUST-NM-STS-CD OF DCLACTITRF  CAT820DB
DJ0001     MOVE RCV-SS-PRIM-STS-CD OF DCLVTRNFR                         CAT820DB
DJ0001                             TO RCV-SS-PRIM-STS-CD OF DCLACTITRF  CAT820DB
DJ0001     MOVE RCV-SS-SCDY-STS-CD OF DCLVTRNFR                         CAT820DB
DJ0001                             TO RCV-SS-SCDY-STS-CD OF DCLACTITRF  CAT820DB
DJ0001     MOVE RCV-ACT-TYP-STS-CD OF DCLVTRNFR                         CAT820DB
DJ0001                             TO RCV-ACT-TYP-STS-CD OF DCLACTITRF  CAT820DB
DJ0001     MOVE RCV-OCC-STTS-CD    OF DCLVTRNFR                         CAT820DB
DJ0001                             TO RCV-OCC-STTS-CD    OF DCLACTITRF  CAT820DB
DJ0001     MOVE RCV-CRSPN-STTS-CD  OF DCLVTRNFR                         CAT820DB
DJ0001                             TO RCV-CRSPN-STTS-CD  OF DCLACTITRF  CAT820DB
DJ0001     MOVE ACCT-DLVR-STTS-CD  OF DCLVTRNFR                         CAT820DB
DJ0001                             TO ACCT-DLVR-STTS-CD  OF DCLACTITRF  CAT820DB
DJ0001     MOVE TRN-TYP-RJC-STS-CD OF DCLVTRNFR                         CAT820DB
DJ0001                             TO TRN-TYP-RJC-STS-CD OF DCLACTITRF  CAT820DB
DJ0001     MOVE CNTL-ASTD-STTS-CD  OF DCLVTRNFR                         CAT820DB
DJ0001                             TO CNTL-ASTD-STTS-CD  OF DCLACTITRF  CAT820DB
DJ0001     MOVE STTLM-ASCTD-STS-CD OF DCLVTRNFR                         CAT820DB
DJ0001                             TO STTLM-ASCTD-STS-CD OF DCLACTITRF  CAT820DB
DJ0001     MOVE TRANS-RFRN-STTS-CD OF DCLVTRNFR                         CAT820DB
DJ0001                             TO TRANS-RFRN-STTS-CD OF DCLACTITRF  CAT820DB
DJ0001     MOVE CMNT-STTS-CD       OF DCLVTRNFR                         CAT820DB
DJ0001                             TO CMNT-STTS-CD       OF DCLACTITRF  CAT820DB
DJ0001     MOVE PHSCL-SEQ-NBR      OF DCLVTRNFR                         CAT820DB
DJ0001                             TO PHSCL-SEQ-NBR      OF DCLACTITRF  CAT820DB
DJ0001     MOVE LGCL-SEQ-NBR       OF DCLVTRNFR                         CAT820DB
DJ0001                             TO LGCL-SEQ-NBR       OF DCLACTITRF  CAT820DB
DJ0001     MOVE TRANS-TYPE-CD      OF DCLVTRNFR                         CAT820DB
DJ0001                             TO TRANS-TYPE-CD      OF DCLACTITRF  CAT820DB
DJ0001     MOVE TRNFR-TYPE-CD      OF DCLVTRNFR                         CAT820DB
DJ0001                             TO TRNFR-TYPE-CD      OF DCLACTITRF  CAT820DB
DJ0001     MOVE DLVR-NBR           OF DCLVTRNFR                         CAT820DB
DJ0001                             TO SBMTG-PRTCP-NBR    OF DCLACTITRF  CAT820DB
DJ0001     MOVE RCV-NBR            OF DCLVTRNFR                         CAT820DB
DJ0001                             TO RCV-NBR            OF DCLACTITRF  CAT820DB
DJ0001     MOVE DLVR-NBR           OF DCLVTRNFR                         CAT820DB
DJ0001                             TO DLVR-NBR           OF DCLACTITRF  CAT820DB
DJ0001     MOVE ACCT-RCV-NBR       OF DCLVTRNFR                         CAT820DB
DJ0001                             TO ACCT-RCV-NBR       OF DCLACTITRF  CAT820DB
DJ0001     MOVE RCV-CUST-NM        OF DCLVTRNFR                         CAT820DB
DJ0001                             TO RCV-CUST-NM        OF DCLACTITRF  CAT820DB
DJ0001     MOVE RCV-SS-PRIM-NBR    OF DCLVTRNFR                         CAT820DB
DJ0001                             TO RCV-SS-PRIM-NBR    OF DCLACTITRF  CAT820DB
DJ0001     MOVE RCV-SS-SCNDY-NBR   OF DCLVTRNFR                         CAT820DB
DJ0001                             TO RCV-SS-SCNDY-NBR   OF DCLACTITRF  CAT820DB
DJ0001     MOVE RCV-ACCT-TYPE-CD   OF DCLVTRNFR                         CAT820DB
DJ0001                             TO RCV-ACCT-TYPE-CD   OF DCLACTITRF  CAT820DB
DJ0001     MOVE RCV-OCC-BRKR-NBR   OF DCLVTRNFR                         CAT820DB
DJ0001                             TO RCV-OCC-BRKR-NBR   OF DCLACTITRF  CAT820DB
DJ0001     MOVE RCV-CRSPN-NBR      OF DCLVTRNFR                         CAT820DB
DJ0001                             TO RCV-CRSPN-NBR      OF DCLACTITRF  CAT820DB
DJ0001     MOVE PRTCP-CONTRA-CD    OF DCLVTRNFR                         CAT820DB
DJ0001                             TO PRTCP-CONTRA-CD    OF DCLACTITRF  CAT820DB
DJ0001     MOVE ACCT-DLVR-NBR      OF DCLVTRNFR                         CAT820DB
DJ0001                             TO ACCT-DLVR-NBR      OF DCLACTITRF  CAT820DB
DJ0001     MOVE TRNFR-TYPE-RJCT-CD OF DCLVTRNFR                         CAT820DB
DJ0001                             TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF  CAT820DB
DJ0001     MOVE ACAT-CNTL-ASTD-NBR OF DCLVTRNFR                         CAT820DB
DJ0001                             TO ACAT-CNTL-ASTD-NBR OF DCLACTITRF  CAT820DB
DJ0001     MOVE STTLM-ASCTD-DT     OF DCLVTRNFR                         CAT820DB
DJ0001                             TO STTLM-ASCTD-DT     OF DCLACTITRF  CAT820DB
DJ0001     MOVE TRANS-RFRN-ID-CD   OF DCLVTRNFR                         CAT820DB
DJ0001                             TO TRANS-RFRN-ID-CD   OF DCLACTITRF  CAT820DB
DJ0001     MOVE ' '                TO CMNT-TXT           OF DCLACTITRF  CAT820DB
DJ0001     MOVE ' '                TO CICS-TERM-ID-CD    OF DCLACTITRF  CAT820DB
DJ0001     MOVE DB-CR-CD           OF DCLVTRNFR                         CAT820DB
DJ0001                             TO DB-CR-CD           OF DCLACTITRF  CAT820DB
DJ0001     MOVE NSCC-ACK-IND       OF DCLVTRNFR                         CAT820DB
DJ0001                             TO NSCC-ACK-IND       OF DCLACTITRF  CAT820DB
DJ0001     MOVE RR-CD              OF DCLVTRNFR                         CAT820DB
DJ0001                             TO RR-CD              OF DCLACTITRF  CAT820DB
DJ0001     MOVE TRNFR-TYPE-RJC1-CD OF DCLVTRNFR                         CAT820DB
DJ0001                             TO TRNFR-TYPE-RJC1-CD OF DCLACTITRF  CAT820DB
DJ0001     MOVE 'CAT820DB'         TO PRGM-NM            OF DCLACTITRF  CAT820DB
DJ0001     MOVE WS-TIMESTAMP       TO CRT-TMSTP          OF DCLACTITRF  CAT820DB
DJ0001     MOVE WS-TIMESTAMP       TO UPDT-TMSTP         OF DCLACTITRF  CAT820DB
DJ0001     MOVE ' '                TO NSCC-PEND-CD       OF DCLACTITRF  CAT820DB
DJ0001     MOVE '04'               TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF  CAT820DB
DJ0001     MOVE 'D'                TO TRNFR-TYPE-RJC2-CD OF DCLACTITRF  CAT820DB
DJ0001     MOVE 'R'                TO TRANS-TYPE-CD      OF DCLACTITRF  CAT820DB
DJ0001                                                                  CAT820DB
DJ0001     EXEC SQL                                                     CAT820DB
DJ0001         INSERT INTO ACTITRF                                      CAT820DB
DJ0001           (                                                      CAT820DB
DJ0001             CLIENT_NBR                                           CAT820DB
DJ0001            ,DSTBN_SIDE_CD                                        CAT820DB
DJ0001            ,ACAT_CONTROL_NBR                                     CAT820DB
DJ0001            ,PRCS_DT                                              CAT820DB
DJ0001            ,CYCLE_CD                                             CAT820DB
DJ0001            ,SYS_ACT_CD                                           CAT820DB
DJ0001            ,SYS_RJCT_RSN_CD                                      CAT820DB
DJ0001            ,STTS_CD                                              CAT820DB
DJ0001            ,DAYS_STTS_QTY                                        CAT820DB
DJ0001            ,RCRD_STTS_CD                                         CAT820DB
DJ0001            ,RCRD_LNGTH_STTS_CD                                   CAT820DB
DJ0001            ,PHSCL_SEQ_STTS_CD                                    CAT820DB
DJ0001            ,LGCL_SEQ_NR_STS_CD                                   CAT820DB
DJ0001            ,TRANS_TYPE_STTS_CD                                   CAT820DB
DJ0001            ,CONTROL_NBR_STS_CD                                   CAT820DB
DJ0001            ,TRNFR_TYPE_STTS_CD                                   CAT820DB
DJ0001            ,SBMT_PRT_NR_STS_CD                                   CAT820DB
DJ0001            ,RCV_NBR_STTS_CD                                      CAT820DB
DJ0001            ,DLVR_NBR_STTS_CD                                     CAT820DB
DJ0001            ,ACCT_RCV_STTS_CD                                     CAT820DB
DJ0001            ,RCV_CUST_NM_STS_CD                                   CAT820DB
DJ0001            ,RCV_SS_PRIM_STS_CD                                   CAT820DB
DJ0001            ,RCV_SS_SCDY_STS_CD                                   CAT820DB
DJ0001            ,RCV_ACT_TYP_STS_CD                                   CAT820DB
DJ0001            ,RCV_OCC_STTS_CD                                      CAT820DB
DJ0001            ,RCV_CRSPN_STTS_CD                                    CAT820DB
DJ0001            ,ACCT_DLVR_STTS_CD                                    CAT820DB
DJ0001            ,TRN_TYP_RJC_STS_CD                                   CAT820DB
DJ0001            ,CNTL_ASTD_STTS_CD                                    CAT820DB
DJ0001            ,STTLM_ASCTD_STS_CD                                   CAT820DB
DJ0001            ,TRANS_RFRN_STTS_CD                                   CAT820DB
DJ0001            ,CMNT_STTS_CD                                         CAT820DB
DJ0001            ,PHSCL_SEQ_NBR                                        CAT820DB
DJ0001            ,LGCL_SEQ_NBR                                         CAT820DB
DJ0001            ,TRANS_TYPE_CD                                        CAT820DB
DJ0001            ,TRNFR_TYPE_CD                                        CAT820DB
DJ0001            ,SBMTG_PRTCP_NBR                                      CAT820DB
DJ0001            ,RCV_NBR                                              CAT820DB
DJ0001            ,DLVR_NBR                                             CAT820DB
DJ0001            ,ACCT_RCV_NBR                                         CAT820DB
DJ0001            ,RCV_CUST_NM                                          CAT820DB
DJ0001            ,RCV_SS_PRIM_NBR                                      CAT820DB
DJ0001            ,RCV_SS_SCNDY_NBR                                     CAT820DB
DJ0001            ,RCV_ACCT_TYPE_CD                                     CAT820DB
DJ0001            ,RCV_OCC_BRKR_NBR                                     CAT820DB
DJ0001            ,RCV_CRSPN_NBR                                        CAT820DB
DJ0001            ,PRTCP_CONTRA_CD                                      CAT820DB
DJ0001            ,ACCT_DLVR_NBR                                        CAT820DB
DJ0001            ,TRNFR_TYPE_RJCT_CD                                   CAT820DB
DJ0001            ,ACAT_CNTL_ASTD_NBR                                   CAT820DB
DJ0001            ,STTLM_ASCTD_DT                                       CAT820DB
DJ0001            ,TRANS_RFRN_ID_CD                                     CAT820DB
DJ0001            ,CMNT_TXT                                             CAT820DB
DJ0001            ,CICS_TERM_ID_CD                                      CAT820DB
DJ0001            ,CRT_TMSTP                                            CAT820DB
DJ0001            ,DB_CR_CD                                             CAT820DB
DJ0001            ,NSCC_ACK_IND                                         CAT820DB
DJ0001            ,NSCC_PEND_CD                                         CAT820DB
DJ0001            ,PRGM_NM                                              CAT820DB
DJ0001            ,RR_CD                                                CAT820DB
DJ0001            ,TRNFR_TYPE_RJC1_CD                                   CAT820DB
DJ0001            ,TRNFR_TYPE_RJC2_CD                                   CAT820DB
DJ0001            ,UPDT_TMSTP                                           CAT820DB
DJ0001           )                                                      CAT820DB
DJ0001           VALUES                                                 CAT820DB
DJ0001           (                                                      CAT820DB
DJ0001             :DCLACTITRF.CLIENT-NBR                               CAT820DB
DJ0001            ,:DCLACTITRF.DSTBN-SIDE-CD                            CAT820DB
DJ0001            ,:DCLACTITRF.ACAT-CONTROL-NBR                         CAT820DB
DJ0001            ,:DCLACTITRF.PRCS-DT                                  CAT820DB
DJ0001            ,:DCLACTITRF.CYCLE-CD                                 CAT820DB
DJ0001            ,:DCLACTITRF.SYS-ACT-CD                               CAT820DB
DJ0001            ,:DCLACTITRF.SYS-RJCT-RSN-CD                          CAT820DB
DJ0001            ,:DCLACTITRF.STTS-CD                                  CAT820DB
DJ0001            ,:DCLACTITRF.DAYS-STTS-QTY                            CAT820DB
DJ0001            ,:DCLACTITRF.RCRD-STTS-CD                             CAT820DB
DJ0001            ,:DCLACTITRF.RCRD-LNGTH-STTS-CD                       CAT820DB
DJ0001            ,:DCLACTITRF.PHSCL-SEQ-STTS-CD                        CAT820DB
DJ0001            ,:DCLACTITRF.LGCL-SEQ-NR-STS-CD                       CAT820DB
DJ0001            ,:DCLACTITRF.TRANS-TYPE-STTS-CD                       CAT820DB
DJ0001            ,:DCLACTITRF.CONTROL-NBR-STS-CD                       CAT820DB
DJ0001            ,:DCLACTITRF.TRNFR-TYPE-STTS-CD                       CAT820DB
DJ0001            ,:DCLACTITRF.SBMT-PRT-NR-STS-CD                       CAT820DB
DJ0001            ,:DCLACTITRF.RCV-NBR-STTS-CD                          CAT820DB
DJ0001            ,:DCLACTITRF.DLVR-NBR-STTS-CD                         CAT820DB
DJ0001            ,:DCLACTITRF.ACCT-RCV-STTS-CD                         CAT820DB
DJ0001            ,:DCLACTITRF.RCV-CUST-NM-STS-CD                       CAT820DB
DJ0001            ,:DCLACTITRF.RCV-SS-PRIM-STS-CD                       CAT820DB
DJ0001            ,:DCLACTITRF.RCV-SS-SCDY-STS-CD                       CAT820DB
DJ0001            ,:DCLACTITRF.RCV-ACT-TYP-STS-CD                       CAT820DB
DJ0001            ,:DCLACTITRF.RCV-OCC-STTS-CD                          CAT820DB
DJ0001            ,:DCLACTITRF.RCV-CRSPN-STTS-CD                        CAT820DB
DJ0001            ,:DCLACTITRF.ACCT-DLVR-STTS-CD                        CAT820DB
DJ0001            ,:DCLACTITRF.TRN-TYP-RJC-STS-CD                       CAT820DB
DJ0001            ,:DCLACTITRF.CNTL-ASTD-STTS-CD                        CAT820DB
DJ0001            ,:DCLACTITRF.STTLM-ASCTD-STS-CD                       CAT820DB
DJ0001            ,:DCLACTITRF.TRANS-RFRN-STTS-CD                       CAT820DB
DJ0001            ,:DCLACTITRF.CMNT-STTS-CD                             CAT820DB
DJ0001            ,:DCLACTITRF.PHSCL-SEQ-NBR                            CAT820DB
DJ0001            ,:DCLACTITRF.LGCL-SEQ-NBR                             CAT820DB
DJ0001            ,:DCLACTITRF.TRANS-TYPE-CD                            CAT820DB
DJ0001            ,:DCLACTITRF.TRNFR-TYPE-CD                            CAT820DB
DJ0001            ,:DCLACTITRF.SBMTG-PRTCP-NBR                          CAT820DB
DJ0001            ,:DCLACTITRF.RCV-NBR                                  CAT820DB
DJ0001            ,:DCLACTITRF.DLVR-NBR                                 CAT820DB
DJ0001            ,:DCLACTITRF.ACCT-RCV-NBR                             CAT820DB
DJ0001            ,:DCLACTITRF.RCV-CUST-NM                              CAT820DB
DJ0001            ,:DCLACTITRF.RCV-SS-PRIM-NBR                          CAT820DB
DJ0001            ,:DCLACTITRF.RCV-SS-SCNDY-NBR                         CAT820DB
DJ0001            ,:DCLACTITRF.RCV-ACCT-TYPE-CD                         CAT820DB
DJ0001            ,:DCLACTITRF.RCV-OCC-BRKR-NBR                         CAT820DB
DJ0001            ,:DCLACTITRF.RCV-CRSPN-NBR                            CAT820DB
DJ0001            ,:DCLACTITRF.PRTCP-CONTRA-CD                          CAT820DB
DJ0001            ,:DCLACTITRF.ACCT-DLVR-NBR                            CAT820DB
DJ0001            ,:DCLACTITRF.TRNFR-TYPE-RJCT-CD                       CAT820DB
DJ0001            ,:DCLACTITRF.ACAT-CNTL-ASTD-NBR                       CAT820DB
DJ0001            ,:DCLACTITRF.STTLM-ASCTD-DT                           CAT820DB
DJ0001            ,:DCLACTITRF.TRANS-RFRN-ID-CD                         CAT820DB
DJ0001            ,:DCLACTITRF.CMNT-TXT                                 CAT820DB
DJ0001            ,:DCLACTITRF.CICS-TERM-ID-CD                          CAT820DB
DJ0001            ,:DCLACTITRF.CRT-TMSTP                                CAT820DB
DJ0001            ,:DCLACTITRF.DB-CR-CD                                 CAT820DB
DJ0001            ,:DCLACTITRF.NSCC-ACK-IND                             CAT820DB
DJ0001            ,:DCLACTITRF.NSCC-PEND-CD                             CAT820DB
DJ0001            ,:DCLACTITRF.PRGM-NM                                  CAT820DB
DJ0001            ,:DCLACTITRF.RR-CD                                    CAT820DB
DJ0001            ,:DCLACTITRF.TRNFR-TYPE-RJC1-CD                       CAT820DB
DJ0001            ,:DCLACTITRF.TRNFR-TYPE-RJC2-CD                       CAT820DB
DJ0001            ,:DCLACTITRF.UPDT-TMSTP                               CAT820DB
DJ0001           )                                                      CAT820DB
DJ0001     END-EXEC.                                                    CAT820DB
DJ0001     MOVE SQLCODE                  TO W-DB2-SQLCODE               CAT820DB
DJ0001     IF  SQLCODE  =  +0                                           CAT820DB
DJ0001         DISPLAY '   4150: ACTITRF REJECT FLAT CREATED'           CAT820DB
DJ0001          ADD 1 TO W-ACTITRF-ADD-CNT                              CAT820DB
DJ0001     ELSE                                                         CAT820DB
DJ0001         DISPLAY '   4150: ACTITRF REJECT FLAT NOT CREATED.'      CAT820DB
DJ0001         ' SQLCODE= ' W-DB2-SQLCODE                               CAT820DB
DJ0001         DISPLAY 'DCLACTITRF= 'DCLACTITRF                         CAT820DB
DJ0001     END-IF.                                                      CAT820DB
DJ0001                                                                  CAT820DB
DJ0001 4300-EXIT. EXIT.                                                 CAT820DB
DJ0001 4400-UPDATE-VTRNFR-FLAT.                                         CAT820DB
DJ0001*** SET FLAT INDICATOR "'D" FOR ACCT FLAT RESULT OF FEES          CAT820DB
DJ0001     MOVE 'D'                 TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR  CAT820DB
DJ0001     MOVE ' '                 TO CICS-TERM-ID-CD    OF DCLVTRNFR  CAT820DB
DJ0001     MOVE WS-TIMESTAMP        TO UPDT-TMSTP         OF DCLVTRNFR  CAT820DB
DJ0001     MOVE 'CAT820DB'          TO PRGM-NM            OF DCLVTRNFR  CAT820DB
DJ0001     EXEC SQL                                                     CAT820DB
DJ0001       UPDATE VTRNFR                                              CAT820DB
DJ0001          SET                                                     CAT820DB
DJ0001             TRNFR_TYPE_RJC2_CD  = :DCLVTRNFR.TRNFR-TYPE-RJC2-CD  CAT820DB
DJ0001            ,CICS_TERM_ID_CD     = :DCLVTRNFR.CICS-TERM-ID-CD     CAT820DB
DJ0001            ,UPDT_TMSTP          = :DCLVTRNFR.UPDT-TMSTP          CAT820DB
DJ0001            ,PRGM_NM             = :DCLVTRNFR.PRGM-NM             CAT820DB
DJ0001        WHERE CLIENT_NBR        = :WS-CLIENT-NBR                  CAT820DB
DJ0001          AND ACAT_CONTROL_NBR  = :CASH-CONTROL-NBR               CAT820DB
DJ0001     END-EXEC.                                                    CAT820DB
DJ0001     MOVE SQLCODE                  TO W-DB2-SQLCODE               CAT820DB
DJ0001     IF  SQLCODE  =  +0                                           CAT820DB
DJ0001         DISPLAY '   4200: VTRNFR FLAT FLAG SET'                  CAT820DB
DJ0001     ELSE                                                         CAT820DB
DJ0001         DISPLAY '   4200: VTRNFR FLAT FLAG NOT SET.'             CAT820DB
DJ0001         ' SQLCODE= ' W-DB2-SQLCODE                               CAT820DB
DJ0001         DISPLAY 'DCLVTRNFR= 'DCLVTRNFR                           CAT820DB
DJ0001     END-IF.                                                      CAT820DB
DJ0001 4400-EXIT. EXIT.                                                 CAT820DB
           EJECT                                                        CAT820DB
       8000-CHK-COMMIT.                                                 CAT820DB
           IF  W-COMMIT-CTR > +0                                        CAT820DB
               PERFORM 8100-SQL-COMMIT                                  CAT820DB
               MOVE 0 TO W-COMMIT-CTR                                   CAT820DB
           END-IF.                                                      CAT820DB
                                                                        CAT820DB
       8000-EXIT. EXIT.                                                 CAT820DB
                                                                        CAT820DB
       8100-SQL-COMMIT     SECTION.                                     CAT820DB
                                                                        CAT820DB
           EXEC SQL COMMIT                                              CAT820DB
           END-EXEC                                                     CAT820DB
                                                                        CAT820DB
           MOVE SQLCA   TO COMMIT-SQLCA                                 CAT820DB
           MOVE SQLCODE TO COMMIT-RETURN                                CAT820DB
                                                                        CAT820DB
           IF  COMMIT-AB                                                CAT820DB
               DISPLAY ' CAT820DB: '                                    CAT820DB
                   'SQL COMMIT FAILED. COMMIT-RETURN= '                 CAT820DB
                    COMMIT-RETURN                                       CAT820DB
                  ' INFILE-CNT= '           W-INFILE-CNT                CAT820DB
                    ' PREV-CNT= '           W-LAST-COMMIT-INFILE-CNT    CAT820DB
           ELSE                                                         CAT820DB
               DISPLAY ' CAT820DB: '                                    CAT820DB
                   'SQL COMMIT OK.'                                     CAT820DB
                     ' INP-CNT= '           W-INFILE-CNT                CAT820DB
                    ' PREV-CNT= '           W-LAST-COMMIT-INFILE-CNT    CAT820DB
               IF CASH-TRNFR-TYPE-SOURCE = 'INT'                        CAT820DB
                  DISPLAY 'LAST OTHER KEY PROCESSED '                   CAT820DB
                        CASH-DETAIL-KEY (1 : 3)  CASH-DLVR-ACCT         CAT820DB
                        CASH-TRNFR-TYPE-CD                              CAT820DB
               ELSE                                                     CAT820DB
                  DISPLAY '  LAST CASH KEY PROCESSED ' CASH-DETAIL-KEY  CAT820DB
           END-IF.                                                      CAT820DB
                                                                        CAT820DB
           MOVE W-INFILE-CNT             TO W-LAST-COMMIT-INFILE-CNT.   CAT820DB
                                                                        CAT820DB
       8500-SQL-ERROR      SECTION.                                     CAT820DB
           DISPLAY ' '                                                  CAT820DB
           DISPLAY '8500-SQL-ERROR'                                     CAT820DB
                  ' INFILE-CNT = ' W-INFILE-CNT                         CAT820DB
           ' LAST-COMMIT-INFILE-CNT = ' W-LAST-COMMIT-INFILE-CNT        CAT820DB
                                                                        CAT820DB
           DISPLAY ' '                                                  CAT820DB
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                  CAT820DB
                                    W-DB2-MESSAGE-LEN.                  CAT820DB
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                        CAT820DB
             UNTIL W-DB2-IDX GREATER THAN 12                            CAT820DB
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES              CAT820DB
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)               CAT820DB
                   END-IF                                               CAT820DB
           END-PERFORM.                                                 CAT820DB
           DISPLAY ' '                                                  CAT820DB
                                                                        CAT820DB
           PERFORM 8700-SQL-ROLLBACK THRU 8700-EXIT                     CAT820DB
                                                                        CAT820DB
           DISPLAY 'CAT820DB: U3999 - ABENDING ON BAD DB2 STATUS'       CAT820DB
           DISPLAY 'CAT820DB: PROGRAM ENDED ABNORMALLY'                 CAT820DB
           MOVE +3999 TO ABEND-CD                                       CAT820DB
           CALL  ABEND  USING ABEND-CD.                                 CAT820DB
                                                                        CAT820DB
       8500-EXIT. EXIT.                                                 CAT820DB
      /                                                                 CAT820DB
       8700-SQL-ROLLBACK   SECTION.                                     CAT820DB
           DISPLAY '8700-SQL-ROLLBACK'                                  CAT820DB
                  ' INFILE-CNT = ' W-INFILE-CNT                         CAT820DB
                  ' LAST-COMMIT-INFILE-CNT = '                          CAT820DB
                                            W-LAST-COMMIT-INFILE-CNT    CAT820DB
                                                                        CAT820DB
           EXEC SQL ROLLBACK WORK                                       CAT820DB
           END-EXEC                                                     CAT820DB
                                                                        CAT820DB
           MOVE SQLCA   TO ROLLBACK-SQLCA                               CAT820DB
           MOVE SQLCODE TO ROLLBACK-RETURN                              CAT820DB
                                                                        CAT820DB
           IF ROLLBACK-AB                                               CAT820DB
               DISPLAY                                                  CAT820DB
                   'AUTO ROLLBACK FAILED. ROLLBACK-RETURN = '           CAT820DB
                   ROLLBACK-RETURN                                      CAT820DB
           ELSE                                                         CAT820DB
               DISPLAY                                                  CAT820DB
                   'AUTO ROLLBACK SUCCESSFUL. ROLLBACK-RETURN = '       CAT820DB
                   ROLLBACK-RETURN                                      CAT820DB
           END-IF.                                                      CAT820DB
                                                                        CAT820DB
       8700-EXIT. EXIT.                                                 CAT820DB
*******#################################################################CAT820DB
