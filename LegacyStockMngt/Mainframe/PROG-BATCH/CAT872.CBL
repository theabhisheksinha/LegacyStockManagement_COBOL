000001* PDX    - CAT872   C0226130 10/20/05 11:43:24 TBLAMUR            00001000
LRM001* SSR 44394 CONTENTION ABEND.  ADD CLIENT NBR TO CURSOR                   
000001* PDX    - CAT872   C0155513 03/12/01 07:57:04 TBDOJUN            00001000
000001* PDX    - CAT872   C0123102 03/15/99 11:07:48 TBDOJUN            00001000
000001* PDX    - CAT872   C0121087 01/31/99 18:54:16 TBDOJUN            00001000
      * PDX    - CAT872   C0119787 12/28/98 11:52:30 TBLAMUR            CAT872  
      * PDX    - CAT872   C0117772 12/27/98 12:25:18 TBYOHON            CAT872  
       IDENTIFICATION DIVISION.                                         CAT872  
       PROGRAM-ID. CAT872.                                              CAT872  
      *--------------------------------------------------------------*  CAT872  
      *  CREATE ACTIVITY REPORT AND SET ACTIVITY INDICATOR              CAT872  
      *  BYPASS REQUEST STATUS DAY 1                                    CAT872  
      *--------------------------------------------------------------*  CAT872  
       ENVIRONMENT DIVISION.                                            CAT872  
       INPUT-OUTPUT SECTION.                                            CAT872  
       FILE-CONTROL.                                                    CAT872  
           SELECT IN-ACCT-BAL-FILE        ASSIGN TO UT-S-ACCTBAL.       CAT872  
           SELECT IN-B204-FILE            ASSIGN TO UT-S-INB204.        CAT872  
           SELECT TRAN-RPT-FILE           ASSIGN TO TRANRPT.            CAT872  
       DATA DIVISION.                                                   CAT872  
       FILE SECTION.                                                    CAT872  
                                                                        CAT872  
       FD  IN-ACCT-BAL-FILE                                             CAT872  
           LABEL RECORDS ARE STANDARD                                   CAT872  
           BLOCK CONTAINS 0 RECORDS.                                    CAT872  
           COPY OLMIABAL REPLACING ==:OLMI:== BY ==IABR==.              CAT872  
                                                                        CAT872  
       FD  IN-B204-FILE                                                 CAT872  
           LABEL RECORDS ARE STANDARD                                   CAT872  
           RECORDING MODE V                                             CAT872  
           BLOCK CONTAINS 0 RECORDS.                                    CAT872  
       01  IN-B204-FILE-RECORD        PIC X(500).                       CAT872  
       01  IN-B204-FILE-REC-H         PIC X(480).                       CAT872  
       01  IN-B204-FILE-REC-T         PIC X(300).                       CAT872  
       01  IN-B204-FILE-REC-U         PIC X(200).                       CAT872  
                                                                        CAT872  
       FD  TRAN-RPT-FILE                                                CAT872  
           RECORDING MODE IS F                                          CAT872  
           BLOCK CONTAINS 0 RECORDS.                                    CAT872  
       01  TRAN-RPT-RECORD             PIC X(143).                      CAT872  
       EJECT                                                            CAT872  
       WORKING-STORAGE SECTION.                                         CAT872  
           COPY PDXIDCOB.                                               CAT872  
                                                                        CAT872  
LRM001 01  WS-CURRENT-CLIENT           PIC X(4) VALUE '0000'.                   
       01  WS-RPT-RECORD.                                               CAT872  
           05 WS-RPT-133               PIC X(133).                      CAT872  
           05 WS-RPT-CLIENT            PIC 9(03) COMP-3.                CAT872  
           05 FILLER                   PIC X(08).                       CAT872  
       01  ACAT-CLT-HEADER.                                             CAT872  
           03  FILLER                  PIC X(01)  VALUE '1'.            CAT872  
           03  FILLER                  PIC X(10)  VALUE 'CAT872 CL '.   CAT872  
           03  DCH1-CLIENT             PIC 9(03).                       CAT872  
           03  FILLER                  PIC X(03)  VALUE SPACE.          CAT872  
           03  DCH1-CLIENT-NAME        PIC X(30).                       CAT872  
           03  FILLER                  PIC X(05)  VALUE SPACE.          CAT872  
           03  DCH1-REP-NAME           PIC X(45)  VALUE                 CAT872  
               'ACCOUNT WITH ACTIVITY IN TRANSFER'.                     CAT872  
           03  FILLER                  PIC X(05)  VALUE 'DATE '.        CAT872  
           03  DCH1-DATE.                                               CAT872  
               09 DCH1-DATE-MM         PIC X(02).                       CAT872  
               09 FILLER               PIC X(01) VALUE '/'.             CAT872  
               09 DCH1-DATE-DD         PIC X(02).                       CAT872  
               09 FILLER               PIC X(01) VALUE '/'.             CAT872  
               09 DCH1-DATE-YY         PIC X(02).                       CAT872  
           03  FILLER                  PIC X(02)  VALUE SPACE.          CAT872  
           03  FILLER                  PIC X(07)  VALUE 'PAGE  '.       CAT872  
           03  DCH1-PAGE               PIC ZZZZZZZZZ.                   CAT872  
      *                                                                 CAT872  
       01  ACAT-ACCT-HEADER.                                            CAT872  
           03  FILLER                  PIC X(01)  VALUE '0'.            CAT872  
           03  ACAT-BRANCH             PIC X(03)  VALUE SPACES.         CAT872  
           03  FILLER                  PIC X(01)  VALUE '-'.            CAT872  
           03  ACAT-ACCOUNT            PIC X(05)  VALUE SPACES.         CAT872  
           03  FILLER                  PIC X(01)  VALUE '-'.            CAT872  
           03  ACAT-CURR-SYMBOL        PIC X(02)  VALUE SPACES.         CAT872  
           03  FILLER                  PIC X(01)  VALUE '-'.            CAT872  
           03  ACAT-TC.                                                 CAT872  
               09 ACAT-TYPE            PIC X(01).                       CAT872  
               09 ACAT-CHECK           PIC X(01).                       CAT872  
           03  FILLER                  PIC X(07)  VALUE ' CNTL# '.      CAT872  
           03  ACAT-CONTROL-JUL        PIC X(7)  VALUE SPACES.          CAT872  
           03  FILLER                  PIC X(01)  VALUE '-'.            CAT872  
           03  ACAT-CONTROL-REST       PIC X(09)  VALUE SPACES.         CAT872  
           03  FILLER                  PIC X(07)  VALUE 'STATUS'.       CAT872  
           03  ACAT-TRANSFER-STATUS    PIC X(03)  VALUE SPACES.         CAT872  
           03  FILLER                  PIC X(06)  VALUE ' DAYS'.        CAT872  
           03  ACAT-DAYS-IN-STATUS     PIC 999.                         CAT872  
           03  FILLER                  PIC X(14)                        CAT872  
                       VALUE ' BALANCE OPEN '.                          CAT872  
           03  ACAT-OPEN-BAL           PIC ZZZZZZ,ZZZ,ZZZ,ZZ9.99-.      CAT872  
           03  FILLER                  PIC X(02)  VALUE SPACES.         CAT872  
           03  FILLER                  PIC X(06)                        CAT872  
                       VALUE 'CLOSE '.                                  CAT872  
           03  ACAT-CLOSE-BAL          PIC ZZZZZZ,ZZZ,ZZZ,ZZ9.99-.      CAT872  
           03  FILLER                  PIC X(050) VALUE SPACES.         CAT872  
       01 ACAT-REPORT-HEADER.                                           CAT872  
           03  FILLER                  PIC X(01)  VALUE '0'.            CAT872  
           03  FILLER              PIC X(15)  VALUE                     CAT872  
               '     QUANTITY  '.                                       CAT872  
           03  FILLER                  PIC X(30)  VALUE                 CAT872  
               '               DESCRIPTION   '.                         CAT872  
           03  FILLER                  PIC X(30)  VALUE                 CAT872  
               '             ENTRY      BATCH'.                         CAT872  
           03  FILLER                  PIC X(30)  VALUE                 CAT872  
               '               AMOUNT        '.                         CAT872  
           03  FILLER                  PIC X(120) VALUE SPACES.         CAT872  
      *                                                                 CAT872  
       01  ACAT-DETAIL-1.                                               CAT872  
           03  FILLER                  PIC X(01)  VALUE ' '.            CAT872  
           03  ACAT-QTY                PIC X(22)  VALUE SPACES.         CAT872  
           03  ACAT-QTY-F  REDEFINES ACAT-QTY                           CAT872  
                                       PIC ZZZ,ZZZ,ZZZ,ZZZ.ZZZZZ-.      CAT872  
           03  FILLER      REDEFINES ACAT-QTY.                          CAT872  
               05  ACAT-QTY-I          PIC ZZZ,ZZZ,ZZZ,ZZZ-.            CAT872  
               05  FILLER              PIC X(06).                       CAT872  
           03  FILLER                  PIC X(01)  VALUE SPACES.         CAT872  
           03  ACAT-DESC               PIC X(30).                       CAT872  
           03  FILLER                  PIC X(05)  VALUE SPACES.         CAT872  
           03  ACAT-ENTRY              PIC X(11)  VALUE SPACES.         CAT872  
           03  ACAT-BATCH-CODE         PIC X(11)  VALUE SPACES.         CAT872  
           03  FILLER                  PIC X(01)  VALUE SPACES.         CAT872  
           03  ACAT-AMOUNT             PIC X(22)  VALUE SPACES.         CAT872  
           03  ACAT-AMOUNT-F  REDEFINES ACAT-AMOUNT                     CAT872  
                                       PIC ZZZZZZ,ZZZ,ZZZ,ZZ9.99-.      CAT872  
           03  FILLER                  PIC X(01)  VALUE SPACES.         CAT872  
           03  FILLER                  PIC X(50)  VALUE SPACES.         CAT872  
      *                                                                 CAT872  
      *                                                                 CAT872  
       01  CHECK-DIG-ACCT.                                              CAT872  
           05  CK-BR                   PIC 999.                         CAT872  
           05  CK-ACCT                 PIC 9(5).                        CAT872  
           05  CK-TYPE                 PIC 9.                           CAT872  
       01  NO-OF-DIG                   PIC 99 VALUE 9.                  CAT872  
       01  D-PLUG-CHECK                PIC X VALUE SPACES.              CAT872  
       01  WS-AREA.                                                     CAT872  
           03  SAVE-CLIENT                 PIC X(03) VALUE SPACES.      CAT872  
           03  LINE-COUNT                  PIC 9(03) VALUE 0.           CAT872  
           03  WS-PAGE-NO                  PIC 9(09) VALUE 0.           CAT872  
           03  WS-COMMIT-COUNTER           PIC 9(05) VALUE 0.           CAT872  
           03  WS-BAL-CNT                  PIC 9(09) VALUE 0.           CAT872  
           03  WS-B204-CNT                 PIC 9(09) VALUE 0.           CAT872  
           03  WS-UPDATE-CNT               PIC 9(09) VALUE 0.           CAT872  
           03  WS-FETCH-CNT                PIC 9(09) VALUE 0.           CAT872  
           03  WS-QTY                      PIC S9(12)V9(05).            CAT872  
           03  FILLER REDEFINES WS-QTY.                                 CAT872  
               05 WS-QTY-I                 PIC S9(12).                  CAT872  
               05 WS-QTY-F                 PIC SV9(05).                 CAT872  
           03  PROCESS-THIS-B204           PIC X VALUE 'Y'.             CAT872  
           03  B204-IN-RANGE               PIC X VALUE ' '.             CAT872  
           03  B2-IDX                      PIC 9(03).                   CAT872  
           03  WS-IDX                      PIC 9(03).                   CAT872  
           03  WS-BAL-TYPE                 PIC 9(03).                   CAT872  
           03  WS-TODAY-DATE               PIC 9(08).                   CAT872  
           03  WS-PREV-DATE                PIC 9(08).                   CAT872  
           03  WS-CLOSE-BAL-TABLE.                                      CAT872  
               09 WS-CLOSE-BAL OCCURS 9 TIMES                           CAT872  
                                           PIC S9(15)V9(02) COMP-3.     CAT872  
           03  WS-OPEN-BAL-TABLE.                                       CAT872  
               09 WS-OPEN-BAL OCCURS 9 TIMES                            CAT872  
                                           PIC S9(15)V9(02) COMP-3.     CAT872  
       01  CUR-AREA.                                                    CAT872  
           02  CUR-ARGUMENT        PIC X(3).                            CAT872  
           02  CUR-RET-CODE        PIC X(1).                            CAT872  
           02  CUR-NUM             PIC X(3).                            CAT872  
           02  CUR-SYM             PIC X(2).                            CAT872  
           02  CUR-NAME            PIC X(16).                           CAT872  
       01  WS-KEY-AREA.                                                 CAT872  
           03  ITRF-KEY-15.                                             CAT872  
              05  ITRF-KEY.                                             CAT872  
                 09  ITRF-CLIENT             PIC XXX   VALUE SPACE.     CAT872  
                 09  ITRF-CLIENT-N REDEFINES ITRF-CLIENT                CAT872  
                                             PIC 9(03).                 CAT872  
                 09  ITRF-BRANCH             PIC XXX   VALUE SPACE.     CAT872  
                 09  ITRF-ACCOUNT            PIC X(5)  VALUE SPACE.     CAT872  
                 09  ITRF-CURRENCY           PIC XXX   VALUE SPACE.     CAT872  
              05  ITRF-TYPE                 PIC 9(01) VALUE 0.          CAT872  
           03  IACCTBAL-KEY.                                            CAT872  
              05  IACCTBAL-KEY-14.                                      CAT872  
                09  IACCTBAL-CLIENT         PIC XXX   VALUE SPACE.      CAT872  
                09  IACCTBAL-BRANCH         PIC XXX   VALUE SPACE.      CAT872  
                09  IACCTBAL-ACCOUNT        PIC X(5)  VALUE SPACE.      CAT872  
                09  IACCTBAL-CURRENCY       PIC XXX   VALUE SPACE.      CAT872  
              05  IACCTBAL-TYPE             PIC 9(01) VALUE 0.          CAT872  
           03  IB204-KEY.                                               CAT872  
              05 IB204-KEY-14.                                          CAT872  
                09  IB204-CLIENT            PIC XXX   VALUE SPACE.      CAT872  
                09  IB204-CLIENT-9 REDEFINES IB204-CLIENT               CAT872  
                                            PIC 9(03).                  CAT872  
                09  IB204-BRANCH            PIC XXX   VALUE SPACE.      CAT872  
                09  IB204-ACCOUNT           PIC X(5)  VALUE SPACE.      CAT872  
                09  IB204-CURRENCY          PIC XXX   VALUE SPACE.      CAT872  
              05  IB204-TYPE                PIC 9(01) VALUE 0.          CAT872  
                                                                        CAT872  
      *                                                                 CAT872  
           COPY RECB204X  REPLACING ==:B204:== BY ==B204==.             CAT872  
           COPY BHINFO.                                                 CAT872  
           COPY BHMRGN.                                                 CAT872  
           COPY BHBTS2.                                                 CAT872  
           COPY BHACAT.                                                 CAT872  
           COPY BHAT2.                                                  CAT872  
           COPY LKDTSRCH.                                               CAT872  
           COPY BPDATESC.                                               CAT872  
       EJECT                                                            CAT872  
      *---------------------------------------------------------------* CAT872  
      * SQLCA ERROR MESSAGE WORK AREAS                                * CAT872  
      *---------------------------------------------------------------* CAT872  
                                                                        CAT872  
       01  WS-ERRL-DATA.                                                CAT872  
           05  REQUEST-TYPE       PIC X(1).                             CAT872  
                 88 WRITE-ERROR-TO-LOG   VALUE 'W'.                     CAT872  
           05  CALLING-TRAN-ID    PIC X(04).                            CAT872  
           05  CALLING-PROGRAM-ID PIC X(08).                            CAT872  
           05  SQLCA-AREA         PIC X(136).                           CAT872  
                                                                        CAT872  
       01  MS-MESSAGE.                                                  CAT872  
           05  MS-MESSAGE1        PIC X(120)     VALUE SPACES.          CAT872  
           05  MS-MESSAGE2        PIC X(120)     VALUE SPACES.          CAT872  
           05  MS-MESSAGE3        PIC X(120)     VALUE SPACES.          CAT872  
                                                                        CAT872  
       01  WS-MESSAGE.                                                  CAT872  
           05  WS-ERR-LEN         PIC S9(4) COMP VALUE +1200.           CAT872  
           05  WS-ERR-TXT         PIC X(120) OCCURS 10 TIMES.           CAT872  
                                                                        CAT872  
       01  WS-ERROR-MSG.                                                CAT872  
           05  FILLER             PIC X(70)      VALUE                  CAT872  
           '**DB2** MESSAGE COULD NOT BE TRANSLATED ERROR IN DSNTIAR'.  CAT872  
           05  WS-DSNTIAR-RC      PIC X(08).                            CAT872  
                                                                        CAT872  
       01  OTHER-AREA-DATA.                                             CAT872  
           05  WS-SQL-SEQ-NUM         PIC 999         VALUE ZEROS.      CAT872  
           05  WS-LENGTH              PIC S9(09) COMP VALUE +240.       CAT872  
                                                                        CAT872  
      * COPY IN THE SQLCA AREA - THE COMMON COMMUNICATIONS AREA      *  CAT872  
      *--------------------------------------------------------------*  CAT872  
           EXEC SQL INCLUDE SQLCA END-EXEC.                             CAT872  
           EJECT                                                        CAT872  
                                                                        CAT872  
      *--------------------------------------------------------------*  CAT872  
      *      THE ACAT TRANSFER RECORD DESCRIPTION                    *  CAT872  
      *--------------------------------------------------------------*  CAT872  
           EXEC SQL INCLUDE                                             CAT872  
           VTRNFR END-EXEC.                                             CAT872  
           EJECT                                                        CAT872  
                                                                        CAT872  
      *---------------------------------------------------------------* CAT872  
      * SQL DECLARATION FOR INTFACE  - INTERFACE RECORD FOR CAGE/TRF  * CAT872  
      *---------------------------------------------------------------* CAT872  
                                                                        CAT872  
           EXEC SQL DECLARE ACATTRF CURSOR WITH HOLD FOR                CAT872  
                SELECT CLIENT_NBR, BRANCH_CD, ACCT_CD,                  CAT872  
                       ACCT_ACTIVITY_IND, ACAT_CONTROL_NBR,             CAT872  
                       STTS_CD, DAYS_STTS_QTY                           CAT872  
                FROM VTRNFR                                             CAT872  
LRM001          WHERE CLIENT_NBR = :WS-CURRENT-CLIENT                   CAT872  
                  AND ((STTS_CD < '310' AND STTS_CD >= '200')           CAT872  
                   OR  STTS_CD  = '100' OR  STTS_CD  = '110')           CAT872  
                      AND TRNFR_TYPE_CD = 'FUL'                         CAT872  
                      AND DSTBN_SIDE_CD = 'D'                           CAT872  
                ORDER BY BRANCH_CD, ACCT_CD                             CAT872  
                END-EXEC.                                               CAT872  
                                                                        CAT872  
           EJECT                                                        CAT872  
                                                                        CAT872  
      *********   END OF ERROR ROUTINE WORK AREAS    ***************    CAT872  
                                                                        CAT872  
       01 END-OF-FILES                     PIC X(1) VALUE 'N'.          CAT872  
           88 EOF-FLAG                     VALUE 'Y'.                   CAT872  
                                                                        CAT872  
      *---------------------------------------------------------------* CAT872  
       01 IN-DATABASE.                                                  CAT872  
           05 ID-CLIENT-NBR               PIC X(4)         VALUE ZEROS. CAT872  
           05 ID-BRANCH-CD                PIC X(3)         VALUE ZEROS. CAT872  
           05 ID-ACCT-CD                  PIC X(5)         VALUE ZEROS. CAT872  
           05 ID-ACCT-ACTIVITY-IND        PIC X(1)         VALUE ' '.   CAT872  
           05 ID-ACAT-CONTROL-NBR         PIC X(14)        VALUE ZEROS. CAT872  
           05 ID-STTS-CD                  PIC X(3)        VALUE ZEROS.  CAT872  
           05 ID-DAYS-STTS-QTY      PIC S9(4) USAGE COMP  VALUE ZEROS.  CAT872  
                                                                        CAT872  
      *---------------------------------------------------------------* CAT872  
       01 SAVE-TRNF-ID                    PIC X(12)     VALUE ZEROS.    CAT872  
                                                                        CAT872  
       01 TRNF-ID.                                                      CAT872  
           05 ND-CLIENT-NBR                PIC X(4)      VALUE ZEROS.   CAT872  
           05 ND-BRANCH-CD                 PIC X(3)      VALUE ZEROS.   CAT872  
           05 ND-ACCT-CD                   PIC X(5)      VALUE ZEROS.   CAT872  
                                                                        CAT872  
      /                                                                 CAT872  
      ***--->COBOL LE                                                   CAT872  
       01  W-ABEND-AREA.                                                CAT872  
           03  ABEND-CODE                PIC S9(04) COMP SYNC.          CAT872  
                                                                        CAT872  
           COPY STUBCPY.                                                CAT872  
           03  DSNTIAR                   PIC X(008) VALUE 'DSNTIAR'.    CAT872  
           03  CKDIGIT                   PIC X(008) VALUE 'CKDIGIT'.    CAT872  
      ***<---COBOL LE                                                   CAT872  
      /                                                                 CAT872  
       LINKAGE SECTION.                                                 CAT872  
       01  PARM-AREA.                                                   CAT872  
           10  PARM-LENGTH         PIC S9(4) COMP.                      CAT872  
           10  PARM-STREAM         PIC X.                               CAT872  
           10  PARM-ROLLBACK       PIC X.                               CAT872  
               88 ROLLBACK-YES     VALUE 'Y'.                           CAT872  
               88 ROLLBACK-NO      VALUE 'N'.                           CAT872  
                                                                        CAT872  
       PROCEDURE DIVISION USING PARM-AREA.                              CAT872  
           DISPLAY 'CAT872 - ACTIVITY REPORT AND SET ACTIVITY IND'.     CAT872  
                                                                        CAT872  
           COPY MSGCOBO.                                                CAT872  
      *                                                                 CAT872  
      * VALIDATE THE PARM FIELDS PASSED                                 CAT872  
      *                                                                 CAT872  
            DISPLAY 'ROLLBACK = ' PARM-ROLLBACK.                        CAT872  
            IF PARM-LENGTH > 0                                          CAT872  
                DISPLAY 'PARM-STREAM   = ' PARM-STREAM                  CAT872  
                DISPLAY 'PARM-ROLLBACK = ' PARM-ROLLBACK                CAT872  
            ELSE                                                        CAT872  
                DISPLAY 'INVALID SYSTEM PARM PASSED. MISSING JCL PARM'  CAT872  
                DISPLAY 'PARM DATA = ' PARM-STREAM                      CAT872  
                DISPLAY 'U3001- JCL PARM ERROR ABENDING PROGRAM CAT872' CAT872  
                MOVE 3001  TO ABEND-CODE                                CAT872  
                CALL  ABEND  USING ABEND-CODE                           CAT872  
            END-IF.                                                     CAT872  
                                                                        CAT872  
           PERFORM   0000-INIT-RTN                                      CAT872  
           PERFORM   1000-MAIN-RTN VARYING ITRF-CLIENT-N                CAT872  
                     FROM 1 BY 1                                                
                     UNTIL    ITRF-CLIENT-N  >  500                     CAT872  
                                                                        CAT872  
           CLOSE        IN-ACCT-BAL-FILE                                CAT872  
                        IN-B204-FILE                                    CAT872  
                        TRAN-RPT-FILE.                                  CAT872  
           DISPLAY 'WS-FETCH-CNT  = ' WS-FETCH-CNT                      CAT872  
           DISPLAY 'WS-BAL-CNT    = ' WS-BAL-CNT                        CAT872  
           DISPLAY 'WS-B204-CNT   = ' WS-B204-CNT                       CAT872  
           DISPLAY 'WS-UPDATE-CNT = ' WS-UPDATE-CNT                     CAT872  
                                                                        CAT872  
           IF ROLLBACK-YES                                              CAT872  
             EXEC SQL ROLLBACK                                          CAT872  
             END-EXEC                                                   CAT872  
           END-IF.                                                      CAT872  
      *                                                                 CAT872  
      *  CLOSE THE CURSOR (SAME AS CLOSING FILE)                        CAT872  
      *                                                                 CAT872  
                                                                        CAT872  
           GOBACK.                                                      CAT872  
      *                                                                 CAT872  
       EJECT                                                            CAT872  
      *                                                                 CAT872  
       0000-INIT-RTN.                                                   CAT872  
                                                                        CAT872  
           MOVE 'C'              TO BPDATES-REQ-TYPE.                   CAT872  
           CALL  BPDATES  USING BPDATES-PARAMETERS.                     CAT872  
           IF BPD-VALID-RETURN                                          CAT872  
               CONTINUE                                                 CAT872  
           ELSE                                                         CAT872  
              DISPLAY 'ERROR IN CALL TO BPDATES'                        CAT872  
              DISPLAY 'RETURN-CODE=' BPDATES-RETURN-CODE                CAT872  
              DISPLAY 'ERROR-CODE =' BPDATES-ERROR-CODE                 CAT872  
              DISPLAY 'ERROR-MSG  =' BPDATES-ERROR-MSG                  CAT872  
              DISPLAY 'U3002- BPDATES ERROR ABENDING PROGRAM CAT872'    CAT872  
              MOVE +3002  TO  ABEND-CODE                                CAT872  
              GO TO ABORT-RTN                                           CAT872  
           END-IF.                                                      CAT872  
                                                                        CAT872  
           DISPLAY 'PROCESSING DATE IS: ' BPD-PROC-DATE.                CAT872  
           MOVE BPD-PRIOR-PROC-DATE TO WS-PREV-DATE.                    CAT872  
           MOVE BPD-PROC-DATE       TO WS-TODAY-DATE.                   CAT872  
           MOVE WS-TODAY-DATE(3:2) TO DCH1-DATE-YY.                     CAT872  
           MOVE WS-TODAY-DATE(5:2) TO DCH1-DATE-MM.                     CAT872  
           MOVE WS-TODAY-DATE(7:2) TO DCH1-DATE-DD.                     CAT872  
                                                                        CAT872  
           OPEN  INPUT    IN-ACCT-BAL-FILE                              CAT872  
                          IN-B204-FILE                                  CAT872  
                 OUTPUT   TRAN-RPT-FILE.                                CAT872  
                                                                        CAT872  
       EJECT                                                            CAT872  
       1000-MAIN-RTN.                                                   CAT872  
                                                                        CAT872  
           PERFORM 3000-CLIENT-INITIAL                                  CAT872  
                                        THRU 3000-EXIT                  CAT872  
                                                                        CAT872  
           IF  PARM-STREAM NOT = BH-BROKER-MINI-MAXI-INDICATOR          CAT872  
LRM001     OR NOT BH-BROKER-ACTIVE                                              
LRM001     OR NOT BH-ACAT-ACTIVE                                                
LRM001         CONTINUE                                                 CAT872  
           ELSE                                                         CAT872  
LRM001        PERFORM 1400-OPEN-CURSOR                                  CAT872  
              PERFORM 9000-FETCH-TRANSFER                               CAT872  
                 THRU 9000-EXIT                                         CAT872  
              PERFORM 1500-PROCESS-CLIENT                               CAT872  
                  UNTIL SQLCODE NOT = ZERO                              CAT872  
              IF  WS-PAGE-NO = 0                                        CAT872  
               PERFORM   WRITE-NO-REPORT-MSG                            CAT872  
              END-IF                                                    CAT872  
LRM001        PERFORM 1420-CLOSE-CURSOR                                 CAT872  
           END-IF.                                                      CAT872  
                                                                        CAT872  
LRM001 1400-OPEN-CURSOR.                                                CAT872  
           MOVE '0'         TO WS-CURRENT-CLIENT(1 : 1).                        
           MOVE ITRF-CLIENT TO WS-CURRENT-CLIENT(2 : 3).                CAT872  
           MOVE 10 TO WS-SQL-SEQ-NUM.                                           
           EXEC SQL OPEN ACATTRF END-EXEC.                                      
           IF SQLCODE EQUAL ZERO                                                
              DISPLAY 'SQL OPEN  ACATTRF SUCCESSFUL FOR '                       
                WS-CURRENT-CLIENT                                               
           ELSE                                                                 
              DISPLAY 'SQL OPEN  ACATTRF ERROR FOR '                            
                WS-CURRENT-CLIENT                                               
              PERFORM 9600-ERRRTN.                                              
LRM001 1420-CLOSE-CURSOR.                                               CAT872  
           MOVE 20 TO WS-SQL-SEQ-NUM.                                   CAT872  
           EXEC SQL CLOSE ACATTRF END-EXEC.                             CAT872  
           IF SQLCODE EQUAL ZERO                                        CAT872  
              DISPLAY 'SQL CLOSE ACATTRF SUCCESSFUL'                    CAT872  
           ELSE                                                         CAT872  
              DISPLAY 'SQL CLOSE ACATTRF ERROR'                         CAT872  
              PERFORM 9600-ERRRTN.                                      CAT872  
       1500-PROCESS-CLIENT.                                             CAT872  
                                                                        CAT872  
           PERFORM 9100-READ-ACCT-BALANCE                               CAT872  
              THRU 9100-EXIT                                            CAT872  
             UNTIL (IACCTBAL-KEY-14 NOT < ITRF-KEY)                     CAT872  
                OR IACCTBAL-KEY-14 = HIGH-VALUE.                        CAT872  
                                                                        CAT872  
           PERFORM 9200-READ-B204                                       CAT872  
                                    THRU 9200-EXIT                      CAT872  
             UNTIL (IB204-KEY-14 NOT < ITRF-KEY)                        CAT872  
                OR IB204-KEY-14 = HIGH-VALUE.                           CAT872  
                                                                        CAT872  
           MOVE SPACE   TO  ID-ACCT-ACTIVITY-IND                        CAT872  
           PERFORM 2000-PROCESS-REPORT                                  CAT872  
              THRU 2000-EXIT                                            CAT872  
                                                                        CAT872  
           DISPLAY 'CLT=' ID-CLIENT-NBR                                 CAT872  
                          ' ACC=' ID-BRANCH-CD                          CAT872  
                              ' ' ID-ACCT-CD                            CAT872  
                          ' CTL=' ID-ACAT-CONTROL-NBR                   CAT872  
                          ' STA=' ID-STTS-CD                            CAT872  
                          ' DAY=' ID-DAYS-STTS-QTY                      CAT872  
                          ' IND=' ID-ACCT-ACTIVITY-IND                  CAT872  
                                                                        CAT872  
           MOVE 30 TO WS-SQL-SEQ-NUM                                    CAT872  
           EXEC SQL                                                     CAT872  
           UPDATE VTRNFR                                                CAT872  
               SET ACCT_ACTIVITY_IND  = :ID-ACCT-ACTIVITY-IND           CAT872  
               WHERE CLIENT_NBR       = :ID-CLIENT-NBR        AND       CAT872  
                     ACAT_CONTROL_NBR = :ID-ACAT-CONTROL-NBR            CAT872  
           END-EXEC.                                                    CAT872  
           IF SQLCODE EQUAL ZERO                                        CAT872  
               ADD 1 TO WS-UPDATE-CNT                                   CAT872  
               ADD 1 TO WS-COMMIT-COUNTER                               CAT872  
           ELSE IF SQLCODE EQUAL 10                                     CAT872  
               DISPLAY 'NOT FOUND'                                      CAT872  
               DISPLAY 'TRK KEY ' ID-CLIENT-NBR ' '                     CAT872  
                        ID-ACAT-CONTROL-NBR                             CAT872  
           ELSE                                                         CAT872  
               PERFORM 9600-ERRRTN.                                     CAT872  
      *                                                                 CAT872  
      *  ROLLBACK-NO                                                    CAT872  
      *                                                                 CAT872  
           IF WS-COMMIT-COUNTER > 10  AND NOT ROLLBACK-YES              CAT872  
              MOVE 0 TO WS-COMMIT-COUNTER                               CAT872  
              EXEC SQL  COMMIT  END-EXEC                                CAT872  
           END-IF.                                                      CAT872  
                                                                        CAT872  
           PERFORM 9000-FETCH-TRANSFER                                  CAT872  
              THRU 9000-EXIT.                                           CAT872  
                                                                        CAT872  
       EJECT                                                            CAT872  
                                                                        CAT872  
       2000-PROCESS-REPORT.                                             CAT872  
           IF  IB204-KEY-14 NOT = ITRF-KEY                              CAT872  
              GO TO   2000-EXIT.                                        CAT872  
                                                                        CAT872  
           MOVE 'Y'     TO  ID-ACCT-ACTIVITY-IND                        CAT872  
           MOVE LOW-VALUE TO WS-CLOSE-BAL-TABLE.                        CAT872  
           MOVE LOW-VALUE TO WS-OPEN-BAL-TABLE.                         CAT872  
           PERFORM GET-BAL-RTN                                          CAT872  
           PERFORM VARYING WS-IDX FROM 1 BY 1                           CAT872  
              UNTIL WS-IDX > 9                                          CAT872  
                MOVE WS-IDX TO          ITRF-TYPE                       CAT872  
                IF WS-CLOSE-BAL(WS-IDX) IS NUMERIC                      CAT872  
                OR WS-OPEN-BAL(WS-IDX) IS NUMERIC                       CAT872  
                   IF WS-CLOSE-BAL(WS-IDX) IS NUMERIC                   CAT872  
                      MOVE WS-CLOSE-BAL(WS-IDX) TO ACAT-CLOSE-BAL       CAT872  
                   ELSE                                                 CAT872  
                      MOVE ZERO                 TO ACAT-CLOSE-BAL       CAT872  
                   END-IF                                               CAT872  
                   IF WS-OPEN-BAL(WS-IDX) IS NUMERIC                    CAT872  
                      MOVE WS-OPEN-BAL(WS-IDX) TO ACAT-OPEN-BAL         CAT872  
                   ELSE                                                 CAT872  
                      MOVE ZERO                 TO ACAT-OPEN-BAL        CAT872  
                   END-IF                                               CAT872  
                   MOVE WS-IDX       TO ACAT-TYPE                       CAT872  
                   MOVE ITRF-BRANCH      TO CK-BR                       CAT872  
                   MOVE ITRF-ACCOUNT TO CK-ACCT                         CAT872  
                   MOVE WS-IDX           TO CK-TYPE                     CAT872  
                   CALL  CKDIGIT   USING CHECK-DIG-ACCT                 CAT872  
                                               NO-OF-DIG                CAT872  
                                               D-PLUG-CHECK             CAT872  
                   MOVE D-PLUG-CHECK   TO  ACAT-CHECK                   CAT872  
                END-IF                                                  CAT872  
                IF WS-CLOSE-BAL(WS-IDX) IS NUMERIC                      CAT872  
                OR WS-OPEN-BAL(WS-IDX) IS NUMERIC                       CAT872  
                OR IB204-KEY = ITRF-KEY-15                              CAT872  
                   MOVE ITRF-BRANCH       TO ACAT-BRANCH                CAT872  
                   MOVE ITRF-ACCOUNT      TO ACAT-ACCOUNT               CAT872  
                   MOVE ITRF-TYPE         TO ACAT-TYPE                  CAT872  
                   MOVE SPACE             TO ACAT-CURR-SYMBOL           CAT872  
                   MOVE ID-ACAT-CONTROL-NBR (1 : 7)                     CAT872  
                                          TO ACAT-CONTROL-JUL           CAT872  
                   MOVE ID-ACAT-CONTROL-NBR (8 : 7)                     CAT872  
                                          TO ACAT-CONTROL-REST          CAT872  
                   MOVE ID-STTS-CD        TO ACAT-TRANSFER-STATUS       CAT872  
                   MOVE ID-DAYS-STTS-QTY  TO ACAT-DAYS-IN-STATUS        CAT872  
                   PERFORM WRITE-ACCT-HEADER                            CAT872  
                END-IF                                                  CAT872  
                IF IB204-KEY = ITRF-KEY-15                              CAT872  
                   MOVE ACAT-REPORT-HEADER                              CAT872  
                     TO WS-RPT-133                                      CAT872  
                   WRITE TRAN-RPT-RECORD FROM WS-RPT-RECORD             CAT872  
                   ADD 2 TO LINE-COUNT                                  CAT872  
                END-IF                                                  CAT872  
                PERFORM UNTIL IB204-KEY > ITRF-KEY-15                   CAT872  
                       IF B204-RECORD-CODE = 'H'                        CAT872  
                          IF B204-BS-DD                                 CAT872  
                          AND B204-BKH-QTY > 0                          CAT872  
                              COMPUTE B204-BKH-QTY = B204-BKH-QTY * -1  CAT872  
                          END-IF                                        CAT872  
                          IF B204-BS-DD                                 CAT872  
                          AND B204-BKH-AMT > 0                          CAT872  
                              COMPUTE B204-BKH-AMT = B204-BKH-AMT * -1  CAT872  
                          END-IF                                        CAT872  
                          IF B204-BKH-QTY = 0                           CAT872  
                             MOVE SPACES TO ACAT-QTY                    CAT872  
                          ELSE                                          CAT872  
                             MOVE B204-BKH-QTY TO WS-QTY                CAT872  
                             IF WS-QTY-F = ZERO                         CAT872  
                                MOVE SPACES TO ACAT-QTY                 CAT872  
                                MOVE B204-BKH-QTY TO WS-QTY-I           CAT872  
                                MOVE WS-QTY-I                           CAT872  
                                  TO ACAT-QTY-I                         CAT872  
                             ELSE                                       CAT872  
                                MOVE B204-BKH-QTY                       CAT872  
                                  TO ACAT-QTY-F                         CAT872  
                             END-IF                                     CAT872  
                          END-IF                                        CAT872  
                          MOVE B204-BKH-ENTRY-CODE                      CAT872  
                            TO ACAT-ENTRY                               CAT872  
                          MOVE B204-BKH-BATCH-CODE                      CAT872  
                            TO ACAT-BATCH-CODE                          CAT872  
                          IF B204-BKH-AMT = 0                           CAT872  
                             MOVE SPACES TO ACAT-AMOUNT                 CAT872  
                          ELSE                                          CAT872  
                             MOVE B204-BKH-AMT                          CAT872  
                               TO ACAT-AMOUNT-F                         CAT872  
                          END-IF                                        CAT872  
                          MOVE B204-BKH-SEC-DESC-1                      CAT872  
                            TO ACAT-DESC                                CAT872  
                          PERFORM WRITE-DETAIL                          CAT872  
                       ELSE                                             CAT872  
                       IF B204-RECORD-CODE = 'T'                        CAT872  
                          IF B204-BKT-DESC(1) NOT = SPACES              CAT872  
                             MOVE SPACES TO ACAT-DETAIL-1               CAT872  
                             MOVE B204-BKT-DESC(1) TO ACAT-DESC         CAT872  
                             PERFORM WRITE-DETAIL                       CAT872  
                          END-IF                                        CAT872  
                          IF B204-BKT-DESC(2) NOT = SPACES              CAT872  
                             MOVE SPACES TO ACAT-DETAIL-1               CAT872  
                             MOVE B204-BKT-DESC(2) TO ACAT-DESC         CAT872  
                             PERFORM WRITE-DETAIL                       CAT872  
                          END-IF                                        CAT872  
                          IF B204-BKT-DESC(3) NOT = SPACES              CAT872  
                             MOVE SPACES TO ACAT-DETAIL-1               CAT872  
                             MOVE B204-BKT-DESC(3) TO ACAT-DESC         CAT872  
                             PERFORM WRITE-DETAIL                       CAT872  
                          END-IF                                        CAT872  
                          IF B204-BKT-US-TRAILER-2 NOT = SPACES         CAT872  
                             MOVE SPACES TO ACAT-DETAIL-1               CAT872  
                             MOVE B204-BKT-US-TRAILER-2 TO ACAT-DESC    CAT872  
                             PERFORM WRITE-DETAIL                       CAT872  
                          END-IF                                        CAT872  
                          IF B204-BKT-US-TRAILER-3 NOT = SPACES         CAT872  
                             MOVE SPACES TO ACAT-DETAIL-1               CAT872  
                             MOVE B204-BKT-US-TRAILER-3 TO ACAT-DESC    CAT872  
                             PERFORM WRITE-DETAIL                       CAT872  
                          END-IF                                        CAT872  
                       ELSE                                             CAT872  
                       IF B204-RECORD-CODE = 'U'                        CAT872  
                          IF B204-BKU-DESC(1) NOT = SPACES              CAT872  
                             MOVE SPACES TO ACAT-DETAIL-1               CAT872  
                             MOVE B204-BKU-DESC(1) TO ACAT-DESC         CAT872  
                             PERFORM WRITE-DETAIL                       CAT872  
                          END-IF                                        CAT872  
                          IF B204-BKU-DESC(2) NOT = SPACES              CAT872  
                             MOVE SPACES TO ACAT-DETAIL-1               CAT872  
                             MOVE B204-BKU-DESC(2) TO ACAT-DESC         CAT872  
                             PERFORM WRITE-DETAIL                       CAT872  
                          END-IF                                        CAT872  
                          IF B204-BKU-DESC(3) NOT = SPACES              CAT872  
                             MOVE SPACES TO ACAT-DETAIL-1               CAT872  
                             MOVE B204-BKU-DESC(3) TO ACAT-DESC         CAT872  
                             PERFORM WRITE-DETAIL                       CAT872  
                          END-IF                                        CAT872  
                          IF B204-BKU-DESC(4) NOT = SPACES              CAT872  
                             MOVE SPACES TO ACAT-DETAIL-1               CAT872  
                             MOVE B204-BKU-DESC(4) TO ACAT-DESC         CAT872  
                             PERFORM WRITE-DETAIL                       CAT872  
                          END-IF                                        CAT872  
                       END-IF END-IF END-IF                             CAT872  
                       PERFORM 9200-READ-B204                           CAT872  
                          THRU 9200-EXIT                                CAT872  
                END-PERFORM                                             CAT872  
           END-PERFORM.                                                 CAT872  
                                                                        CAT872  
                                                                        CAT872  
                                                                        CAT872  
       2000-EXIT.               EXIT.                                   CAT872  
                                                                        CAT872  
       EJECT                                                            CAT872  
                                                                        CAT872  
       GET-BAL-RTN.                                                     CAT872  
           PERFORM                                                      CAT872  
              UNTIL IACCTBAL-KEY-14 > ITRF-KEY                          CAT872  
                 MOVE  IABR-BAL-NUM-OCCURS TO WS-IDX                    CAT872  
                 MOVE IABR-BAL-TYPE TO WS-BAL-TYPE                      CAT872  
                 MOVE  ZERO TO WS-CLOSE-BAL(WS-BAL-TYPE)                CAT872  
                 MOVE  ZERO TO WS-OPEN-BAL(WS-BAL-TYPE)                 CAT872  
                 PERFORM UNTIL WS-IDX < 1                               CAT872  
                      OR WS-TODAY-DATE NOT <                            CAT872  
                         IABR-BAL-FROM-DATE(WS-IDX)                     CAT872  
                      SUBTRACT 1 FROM WS-IDX                            CAT872  
                 END-PERFORM                                            CAT872  
                 IF WS-IDX NOT < 1                                      CAT872  
                 AND WS-TODAY-DATE NOT > IABR-BAL-TO-DATE(WS-IDX)       CAT872  
                     MOVE IABR-BAL-BALANCE(WS-IDX)                      CAT872  
                       TO WS-CLOSE-BAL(WS-BAL-TYPE)                     CAT872  
                 END-IF                                                 CAT872  
                 IF WS-IDX NOT < 1                                      CAT872  
                    IF WS-PREV-DATE NOT < IABR-BAL-FROM-DATE(WS-IDX)    CAT872  
                    AND WS-PREV-DATE NOT > IABR-BAL-TO-DATE(WS-IDX)     CAT872  
                       MOVE IABR-BAL-BALANCE(WS-IDX)                    CAT872  
                         TO WS-OPEN-BAL(WS-BAL-TYPE)                    CAT872  
                    ELSE                                                CAT872  
                  IF WS-IDX > 1                                         CAT872  
                  AND WS-PREV-DATE NOT < IABR-BAL-FROM-DATE(WS-IDX - 1) CAT872  
                  AND WS-PREV-DATE NOT > IABR-BAL-TO-DATE(WS-IDX - 1)   CAT872  
                       MOVE IABR-BAL-BALANCE(WS-IDX - 1)                CAT872  
                         TO WS-OPEN-BAL(WS-BAL-TYPE)                    CAT872  
                  END-IF END-IF                                         CAT872  
                 END-IF                                                 CAT872  
                 PERFORM 9100-READ-ACCT-BALANCE                         CAT872  
                    THRU 9100-EXIT                                      CAT872  
           END-PERFORM.                                                 CAT872  
       EJECT                                                            CAT872  
       3000-CLIENT-INITIAL.                                             CAT872  
           MOVE ITRF-CLIENT TO BH-BROKER-NUMBER-N.                      CAT872  
           MOVE   '101'                 TO    BH-LOGICAL-RECORD-CODE.   CAT872  
           CALL     GETB1V     USING          BH-BROKER-HEADER-INFO     CAT872  
                                              BH-MARGIN-INFO.           CAT872  
           IF   BH-BROKER-ACTIVE                                        CAT872  
                MOVE    BH-BROKER-NAME  TO   DCH1-CLIENT-NAME           CAT872  
           END-IF                                                       CAT872  
           MOVE   '015'                 TO    BH-LOGICAL-RECORD-CODE.   CAT872  
           MOVE   '511000'              TO    BH-B2-INFO-ID.            CAT872  
           CALL     GETB1V     USING          BH-BROKER-HEADER-INFO     CAT872  
                                              BH-BTS2-INFO.             CAT872  
           MOVE   '015'                 TO    BH-LOGICAL-RECORD-CODE.   CAT872  
           MOVE   '434500'              TO    BH-B2-INFO-ID.            CAT872  
           CALL     GETB1V     USING          BH-BROKER-HEADER-INFO     CAT872  
                                              BH-ACAT-INFO.             CAT872  
           MOVE   '015'                 TO    BH-LOGICAL-RECORD-CODE.   CAT872  
           MOVE   '434900'              TO    BH-B2-INFO-ID.            CAT872  
           CALL     GETB1V     USING          BH-BROKER-HEADER-INFO     CAT872  
                                              BH-AT2-INFO.              CAT872  
           MOVE ITRF-CLIENT TO        DCH1-CLIENT.                      CAT872  
           MOVE 60 TO LINE-COUNT.                                       CAT872  
           MOVE ITRF-CLIENT-N TO      WS-RPT-CLIENT                     CAT872  
           MOVE  0 TO WS-PAGE-NO.                                       CAT872  
           MOVE ITRF-CLIENT TO SAVE-CLIENT.                             CAT872  
       3000-EXIT.   EXIT.                                               CAT872  
       EJECT                                                            CAT872  
       WRITE-ACCT-HEADER.                                               CAT872  
           IF LINE-COUNT > 50                                           CAT872  
              ADD 1 TO WS-PAGE-NO                                       CAT872  
              MOVE WS-PAGE-NO TO DCH1-PAGE                              CAT872  
              MOVE  ACAT-CLT-HEADER                                     CAT872  
                TO  WS-RPT-133                                          CAT872  
              WRITE TRAN-RPT-RECORD FROM WS-RPT-RECORD                  CAT872  
              MOVE 3 TO LINE-COUNT                                      CAT872  
           END-IF.                                                      CAT872  
           MOVE ACAT-ACCT-HEADER                                        CAT872  
             TO WS-RPT-133                                              CAT872  
           WRITE TRAN-RPT-RECORD FROM WS-RPT-RECORD                     CAT872  
           ADD 2 TO LINE-COUNT.                                         CAT872  
       EJECT                                                            CAT872  
       WRITE-DETAIL.                                                    CAT872  
           IF LINE-COUNT > 50                                           CAT872  
              ADD 1 TO WS-PAGE-NO                                       CAT872  
              MOVE WS-PAGE-NO TO DCH1-PAGE                              CAT872  
              MOVE ACAT-CLT-HEADER                                      CAT872  
                TO WS-RPT-133                                           CAT872  
              WRITE TRAN-RPT-RECORD FROM WS-RPT-RECORD                  CAT872  
              MOVE 3 TO LINE-COUNT                                      CAT872  
              MOVE ACAT-ACCT-HEADER                                     CAT872  
                TO WS-RPT-133                                           CAT872  
              WRITE TRAN-RPT-RECORD FROM WS-RPT-RECORD                  CAT872  
              MOVE ACAT-REPORT-HEADER                                   CAT872  
                TO WS-RPT-133                                           CAT872  
              WRITE TRAN-RPT-RECORD FROM WS-RPT-RECORD                  CAT872  
              ADD 4 TO LINE-COUNT                                       CAT872  
           END-IF.                                                      CAT872  
           MOVE ACAT-DETAIL-1                                           CAT872  
             TO WS-RPT-133                                              CAT872  
           WRITE TRAN-RPT-RECORD FROM WS-RPT-RECORD                     CAT872  
           ADD 1 TO LINE-COUNT.                                         CAT872  
       EJECT                                                            CAT872  
       WRITE-NO-REPORT-MSG.                                             CAT872  
           IF LINE-COUNT > 50                                           CAT872  
              ADD 1 TO WS-PAGE-NO                                       CAT872  
              MOVE WS-PAGE-NO TO DCH1-PAGE                              CAT872  
              MOVE  ACAT-CLT-HEADER                                     CAT872  
                TO  WS-RPT-133                                          CAT872  
              WRITE TRAN-RPT-RECORD FROM WS-RPT-RECORD                  CAT872  
              MOVE 3 TO LINE-COUNT                                      CAT872  
           END-IF.                                                      CAT872  
           MOVE ' NO TRANSACTION TO REPORT '                            CAT872  
             TO WS-RPT-133                                              CAT872  
           WRITE TRAN-RPT-RECORD FROM WS-RPT-RECORD                     CAT872  
           ADD 2 TO LINE-COUNT.                                         CAT872  
       EJECT                                                            CAT872  
       9000-FETCH-TRANSFER.                                             CAT872  
                                                                        CAT872  
           MOVE 50 TO WS-SQL-SEQ-NUM                                    CAT872  
           EXEC SQL FETCH ACATTRF                                       CAT872  
           INTO :ID-CLIENT-NBR,                                         CAT872  
                :ID-BRANCH-CD,                                          CAT872  
                :ID-ACCT-CD,                                            CAT872  
                :ID-ACCT-ACTIVITY-IND,                                  CAT872  
                :ID-ACAT-CONTROL-NBR,                                   CAT872  
                :ID-STTS-CD,                                            CAT872  
                :ID-DAYS-STTS-QTY                                       CAT872  
           END-EXEC                                                     CAT872  
      *                                                                 CAT872  
      *  CHECK IF THE ACAT TRANSFER WAS RETRIEVED SUCCESSFULLY          CAT872  
      *                                                                 CAT872  
           IF SQLCODE EQUAL ZERO                                        CAT872  
              ADD 1 TO WS-FETCH-CNT                                     CAT872  
           ELSE                                                         CAT872  
              IF SQLCODE EQUAL 100                                      CAT872  
                 DISPLAY 'SQLCODE IN FETCH = 100 '                      CAT872  
                 GO TO 9000-EXIT                                        CAT872  
              ELSE                                                      CAT872  
                 PERFORM 9600-ERRRTN                                    CAT872  
           END-IF.                                                      CAT872  
                                                                        CAT872  
      ***BYPASS REQUEST STATUS DAY 1                                    CAT872  
           IF (ID-STTS-CD = '100' OR '110')                             CAT872  
           AND ID-DAYS-STTS-QTY = 1                                     CAT872  
               GO TO 9000-FETCH-TRANSFER                                CAT872  
           END-IF.                                                      CAT872  
                                                                        CAT872  
           MOVE ID-CLIENT-NBR TO ND-CLIENT-NBR.                         CAT872  
           MOVE ID-BRANCH-CD TO ND-BRANCH-CD.                           CAT872  
           MOVE ID-ACCT-CD TO ND-ACCT-CD.                               CAT872  
                                                                        CAT872  
           IF SAVE-TRNF-ID = TRNF-ID                                    CAT872  
               DISPLAY 'DUPLICATE TFR: TRNF-ID:'  TRNF-ID               CAT872  
                          ' CLT=' ID-CLIENT-NBR                         CAT872  
                          ' ACC=' ID-BRANCH-CD                          CAT872  
                              ' ' ID-ACCT-CD                            CAT872  
                          ' CTL=' ID-ACAT-CONTROL-NBR                   CAT872  
                          ' STA=' ID-STTS-CD                            CAT872  
                          ' DAY=' ID-DAYS-STTS-QTY                      CAT872  
                          ' IND=' ID-ACCT-ACTIVITY-IND                  CAT872  
                          ' BYPASSED'                                   CAT872  
               GO TO 9000-FETCH-TRANSFER                                CAT872  
           ELSE                                                         CAT872  
               MOVE TRNF-ID TO SAVE-TRNF-ID                             CAT872  
           END-IF.                                                      CAT872  
                                                                        CAT872  
      *    DISPLAY 'FETCH WHOLE SEQUENCE ' TRNF-ID.                     CAT872  
                                                                        CAT872  
           MOVE  ID-CLIENT-NBR(2 : 3)      TO  ITRF-CLIENT.             CAT872  
           MOVE  '000'                     TO  ITRF-CURRENCY.           CAT872  
           MOVE  ID-BRANCH-CD              TO  ITRF-BRANCH.             CAT872  
           MOVE  ID-ACCT-CD                TO  ITRF-ACCOUNT.            CAT872  
                                                                        CAT872  
       9000-EXIT.                                                EXIT.  CAT872  
      *                                                                 CAT872  
       9200-READ-B204.                                                  CAT872  
           IF IB204-KEY = HIGH-VALUE                                    CAT872  
                      GO               TO  9200-EXIT.                   CAT872  
                                                                        CAT872  
           READ  IN-B204-FILE                                           CAT872  
             AT  END  MOVE HIGH-VALUE  TO  IB204-KEY                    CAT872  
                      GO               TO  9200-EXIT                    CAT872  
             NOT AT END MOVE IN-B204-FILE-RECORD  TO  B204-RECORD       CAT872  
           END-READ.                                                    CAT872  
                                                                        CAT872  
           ADD 1 TO WS-B204-CNT.                                        CAT872  
                                                                        CAT872  
           IF  B204-CLIENT IS NOT NUMERIC                               CAT872  
               GO  TO  9200-READ-B204.                                  CAT872  
                                                                        CAT872  
           IF B204-RECORD-CODE NOT = 'H'                                CAT872  
               GO  TO  9200-READ-B204.                                  CAT872  
                                                                        CAT872  
           IF  B204-TRID = 'A' OR 'B' OR 'C' OR 'D' OR 'E'              CAT872  
               CONTINUE                                                 CAT872  
           ELSE                                                         CAT872  
               GO  TO  9200-READ-B204.                                  CAT872  
                                                                        CAT872  
           MOVE 'Y'   TO PROCESS-THIS-B204.                             CAT872  
           IF  BH-ACAT-ACTIVE                                           CAT872  
            IF  B204-TRID = 'B' OR 'A'                                  CAT872  
              PERFORM 9250-B204-BATCH-ENTRY THRU 9250-EXIT.             CAT872  
                                                                        CAT872  
           IF  PROCESS-THIS-B204 NOT = 'Y'                              CAT872  
               GO  TO  9200-READ-B204.                                  CAT872  
                                                                        CAT872  
           IF  B204-BKH-AMT NOT NUMERIC                                 CAT872  
           OR  B204-BKH-QTY NOT NUMERIC                                 CAT872  
           OR (B204-BKH-AMT = 0 AND B204-BKH-QTY = 0)                   CAT872  
               GO  TO  9200-READ-B204.                                  CAT872  
                                                                        CAT872  
           MOVE  B204-CLIENT               TO  IB204-CLIENT-9.          CAT872  
           MOVE  B204-BRANCH               TO  IB204-BRANCH.            CAT872  
           MOVE  B204-ACCOUNT              TO  IB204-ACCOUNT.           CAT872  
           MOVE  B204-CURRENCY             TO  IB204-CURRENCY.          CAT872  
           MOVE  B204-TYPE                 TO  IB204-TYPE.              CAT872  
                                                                        CAT872  
       9200-EXIT.                                                EXIT.  CAT872  
      *                                                                 CAT872  
       9250-B204-BATCH-ENTRY.                                           CAT872  
           IF  B204-TRID = 'A'                                          CAT872  
             IF  BH-ACAT-LIQUID-FRAC-TRD-BK-IND = 'T' AND               CAT872  
                B204-PSH-BLOTTER-CODE = BH-ACAT-LIQUID-FRAC-BLOTTER     CAT872  
                  MOVE 'N'    TO PROCESS-THIS-B204                      CAT872  
             END-IF                                                     CAT872  
             GO TO 9250-EXIT                                            CAT872  
           END-IF.                                                      CAT872  
                                                                        CAT872  
           IF  BH-ACAT-LIQUID-FRAC-TRD-BK-IND NOT = 'T'                 CAT872  
            IF     B204-BKH-BATCH-CODE = BH-ACAT-LIQUID-FRAC-BATCH      CAT872  
             AND  B204-BKH-ENTRY-CODE = BH-ACAT-LIQUID-FRAC-ENTRY       CAT872  
                  MOVE 'N'    TO PROCESS-THIS-B204                      CAT872  
            END-IF                                                      CAT872  
           END-IF.                                                      CAT872  
                                                                        CAT872  
           IF B204-TYPE = '1' OR '3'                                    CAT872  
           IF     B204-BKH-BATCH-CODE = BH-ACAT-TYPE3-BATCH-CODE        CAT872  
             AND  B204-BKH-ENTRY-CODE = BH-ACAT-TYPE3-ENTRY-CODE        CAT872  
                  MOVE 'N'    TO PROCESS-THIS-B204                      CAT872  
           END-IF.                                                      CAT872  
           MOVE 'N'   TO B204-IN-RANGE.                                 CAT872  
           PERFORM VARYING B2-IDX    FROM 1 BY 1                        CAT872  
             UNTIL   B2-IDX > BH-ACAT-TRANSFER-FEE-NO                   CAT872  
                OR   B204-IN-RANGE = 'Y'                                CAT872  
                IF  B204-BR-ACCT NOT <                                  CAT872  
                         BH-ACAT-TRANSFER-FEE-ACT-LO (B2-IDX)           CAT872  
                 AND B204-BR-ACCT NOT >                                 CAT872  
                         BH-ACAT-TRANSFER-FEE-ACT-HI (B2-IDX)           CAT872  
                  MOVE 'Y'     TO B204-IN-RANGE                         CAT872  
                   IF      B204-BKH-BATCH-CODE =                        CAT872  
                               BH-ACAT-TRANSFER-FEE-BATCH (B2-IDX)      CAT872  
                      AND  B204-BKH-ENTRY-CODE =                        CAT872  
                               BH-ACAT-TRANSFER-FEE-ENT (B2-IDX)        CAT872  
                      MOVE 'N'    TO PROCESS-THIS-B204                  CAT872  
                   END-IF                                               CAT872  
                END-IF                                                  CAT872  
           END-PERFORM.                                                 CAT872  
                                                                        CAT872  
           IF  B204-IN-RANGE = 'Y'                                      CAT872  
            GO TO 9250-EXIT                                             CAT872  
           END-IF.                                                      CAT872  
                                                                        CAT872  
           IF     B204-BKH-BATCH-CODE = BH-ACAT-TRANS-FEE-BATCH-CODE    CAT872  
             AND  B204-BKH-ENTRY-CODE = BH-ACAT-TRANS-FEE-ENTRY-CODE    CAT872  
                  MOVE 'N'    TO PROCESS-THIS-B204                      CAT872  
           END-IF.                                                      CAT872  
                                                                        CAT872  
       9250-EXIT.                                                       CAT872  
           EXIT.                                                        CAT872  
                                                                        CAT872  
       9100-READ-ACCT-BALANCE.                                          CAT872  
           IF IACCTBAL-KEY = HIGH-VALUE                                 CAT872  
                      GO               TO  9100-EXIT.                   CAT872  
                                                                        CAT872  
           READ  IN-ACCT-BAL-FILE                                       CAT872  
             AT  END  MOVE HIGH-VALUE  TO  IACCTBAL-KEY                 CAT872  
                      GO               TO  9100-EXIT.                   CAT872  
                                                                        CAT872  
           ADD 1 TO WS-BAL-CNT.                                         CAT872  
                                                                        CAT872  
           IF  IABR-BAL-HDR                                             CAT872  
               GO  TO  9100-READ-ACCT-BALANCE.                          CAT872  
                                                                        CAT872  
           MOVE IABR-BAL-CLIENT      TO  IACCTBAL-CLIENT.               CAT872  
           MOVE IABR-BAL-CURRENCY    TO  IACCTBAL-CURRENCY.             CAT872  
           MOVE IABR-BAL-BRANCH      TO  IACCTBAL-BRANCH.               CAT872  
           MOVE IABR-BAL-ACCOUNT     TO  IACCTBAL-ACCOUNT.              CAT872  
           MOVE IABR-BAL-TYPE        TO  IACCTBAL-TYPE.                 CAT872  
                                                                        CAT872  
       9100-EXIT.                                                EXIT.  CAT872  
      *                                                                 CAT872  
       9600-ERRRTN.                                                     CAT872  
      *                                                                 CAT872  
      *    GENERAL ERROR ROUTINE                                        CAT872  
      *                                                                 CAT872  
           CALL  DSNTIAR  USING SQLCA-AREA                              CAT872  
                                WS-MESSAGE                              CAT872  
                                WS-LENGTH.                              CAT872  
           IF RETURN-CODE = 0                                           CAT872  
              MOVE WS-ERR-TXT(1) TO MS-MESSAGE1                         CAT872  
              MOVE WS-ERR-TXT(2) TO MS-MESSAGE2                         CAT872  
              DISPLAY 'ERROR-MSG = ' MS-MESSAGE1 MS-MESSAGE2            CAT872  
           ELSE                                                         CAT872  
              DISPLAY 'ERROR MSG = ' WS-ERROR-MSG.                      CAT872  
           DISPLAY 'SQL SEQ NUM = '  WS-SQL-SEQ-NUM.                    CAT872  
           EXEC SQL ROLLBACK END-EXEC.                                  CAT872  
           DISPLAY 'U3999- DB2 ERROR ABENDING PROGRAM CAT872'           CAT872  
           MOVE 3999 TO ABEND-CODE.                                     CAT872  
           GO TO ABORT-RTN.                                             CAT872  
      *                                                                 CAT872  
       ABORT-RTN.                                                       CAT872  
           CALL  ABEND  USING ABEND-CODE.                               CAT872  
