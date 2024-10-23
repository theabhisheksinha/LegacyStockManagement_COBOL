000001* PDX    - CAT839   C0189201 07/24/03 10:19:07 TBEDTAK            00001000
       IDENTIFICATION DIVISION.                                         03/04/23
       PROGRAM-ID. CAT839.                                              CAT839  
       DATE-WRITTEN. JULY 2003.                                         CAT839  
      *REMARKS.                                                         CAT839  
      ***************************************************************** CAT839  
      *  THIS PROGRAM - CREATES AN OFAC REPORT FILE WHICH CONTAINS    * CAT839  
      *                 A LIST OF ACAT ACCOUNT NAMES FOUND IN OFAC    * CAT839  
      *                 NAMES LIST.                                   * CAT839  
      *                                                               * CAT839  
      *  INPUT  : B***.CAT838.OFACFL.SORTED                           * CAT839  
      *  OUTPUT : B***.CAT839.OFCPI                                   * CAT839  
      ***************************************************************** CAT839  
      *                                                                 CAT839  
       ENVIRONMENT DIVISION.                                            CAT839  
       INPUT-OUTPUT SECTION.                                            CAT839  
       FILE-CONTROL.                                                    CAT839  
           SELECT  OFAC-FILE           ASSIGN  TO  OFACFL.              CAT839  
           SELECT  REPORT-FILE         ASSIGN  TO  REPTFL.              CAT839  
      *                                                                 CAT839  
       DATA DIVISION.                                                   CAT839  
       FILE SECTION.                                                    CAT839  
      *                                                                 CAT839  
       FD  OFAC-FILE                                                    CAT839  
           RECORDING MODE IS F                                          CAT839  
           LABEL RECORDS STANDARD                                       CAT839  
           BLOCK CONTAINS 0 RECORDS.                                    CAT839  
           COPY CATOFAC  REPLACING ==:CAT:== BY ==IN==.                 CAT839  
                                                                        CAT839  
       FD  REPORT-FILE                                                  CAT839  
           RECORDING MODE IS F                                          CAT839  
           LABEL RECORDS STANDARD                                       CAT839  
           BLOCK CONTAINS 0 RECORDS.                                    CAT839  
       01  REPORT-RECORD               PIC X(143).                      CAT839  
      *                                                                 CAT839  
       WORKING-STORAGE  SECTION.                                        CAT839  
       77  PGM-NAME                         PIC X(06)  VALUE 'CAT839'.  CAT839  
       77  ABEND-CODE                       PIC S9(4)  COMP.            CAT839  
       01  WS-WORKING-AREA.                                             CAT839  
           03  WS-CLIENT-NBR.                                           CAT839  
               05  FILLER                   PIC X(01).                  CAT839  
               05  WS-CLIENT                PIC X(03).                  CAT839  
               05  WS-CLIENT-NUM    REDEFINES WS-CLIENT                 CAT839  
                                            PIC 9(03).                  CAT839  
           03  WS-BR-ACCT-NBR.                                          CAT839  
               05  WS-BRANCH                PIC X(03).                  CAT839  
               05  FILLER                   PIC X(01) VALUE '-'.        CAT839  
               05  WS-ACCT                  PIC X(05).                  CAT839  
           03  WS-OFAC-MATCH-IND            PIC X(01).                  CAT839  
           03  WS-CUST-NAME-ADDR.                                       CAT839  
               05  WS-CUST-NAME             PIC X(60).                  CAT839  
               05  WS-CUST-ADDRESS          PIC X(120).                 CAT839  
           03  WS-CUST-NAME-ADDR-TABLE REDEFINES WS-CUST-NAME-ADDR.     CAT839  
               05  WS-CUST-NAME-ADDR-TBL    PIC X(30) OCCURS 6 TIMES.   CAT839  
           03  WS-OFAC-NAME                 PIC X(200).                 CAT839  
           03  WS-OFAC-NAME-TABLE REDEFINES WS-OFAC-NAME.               CAT839  
               05  WS-OFAC-NAME-TBL         PIC X(50) OCCURS 4 TIMES.   CAT839  
           03  WS-ACAT-CUST-NAME            PIC X(30).                  CAT839  
           03  WS-OFAC-MATCH-NAME           PIC X(50).                  CAT839  
           03  OFAC-EOF-SW                  PIC X(01) VALUE SPACES.     CAT839  
               88  OFAC-EOF                           VALUE 'E'.        CAT839  
           03  WS-CLT-FOUND-SW              PIC X(01).                  CAT839  
               88  WS-CLT-FOUND                       VALUE 'Y'.        CAT839  
           03  WS-NAME-FND-SW               PIC X(01).                  CAT839  
               88  WS-NAME-FND                        VALUE 'Y'.        CAT839  
       01  WS-SUBSCRIPT-AREA.                                           CAT839  
           03  SUB                          PIC 9(4).                   CAT839  
           03  FROM-SUB                     PIC 9(4).                   CAT839  
           03  TBL-SUB                      PIC 9(4).                   CAT839  
           03  CLT-SUB                      PIC 9(4).                   CAT839  
           03  SAVE-CLT-SUB                 PIC 9(4).                   CAT839  
           03  CUST-SUB                     PIC 9(3).                   CAT839  
           03  OFAC-SUB                     PIC 9(3).                   CAT839  
       01  WS-OUT-LINE-AREA.                                            CAT839  
           03  WS-EXACT-MATCH-TITLE-OUT     PIC X(35) VALUE             CAT839  
               'O F A C   E X A C T   M A T C H E S'.                   CAT839  
           03  WS-FUZZY-MATCH-TITLE-OUT     PIC X(35) VALUE             CAT839  
               'O F A C   F U Z Z Y   M A T C H E S'.                   CAT839  
           03  WS-NO-EXACT-MATCH-MSG        PIC X(40) VALUE             CAT839  
               '****  NO EXACT MATCHES FOUND TODAY  ****'.              CAT839  
           03  WS-NO-FUZZY-MATCH-MSG        PIC X(40) VALUE             CAT839  
               '****  NO FUZZY MATCHES FOUND TODAY  ****'.              CAT839  
       01  WS-KEY-CONTROL-AREA.                                         CAT839  
           03  WS-CURRENT-KEY.                                          CAT839  
               05  WS-CURR-KEY-CLT          PIC X(04).                  CAT839  
               05  WS-CURR-KEY-MATCH-IND    PIC X(01).                  CAT839  
               05  WS-CURR-KEY-BR-AC.                                   CAT839  
                   07  WS-CURR-KEY-BRANCH   PIC X(03).                  CAT839  
                   07  WS-CURR-KEY-ACCT     PIC X(05).                  CAT839  
           03  WS-PREVIOUS-KEY.                                         CAT839  
               05  WS-PREV-KEY-CLT          PIC X(04).                  CAT839  
               05  WS-PREV-KEY-MATCH-IND    PIC X(01).                  CAT839  
               05  WS-PREV-KEY-BR-AC.                                   CAT839  
                   07  WS-PREV-KEY-BRANCH   PIC X(03).                  CAT839  
                   07  WS-PREV-KEY-ACCT     PIC X(05).                  CAT839  
       01  WS-DATE-AREA.                                                CAT839  
           03  WS-PROC-DATE-MDY.                                        CAT839  
               05  WS-PROC-DT-MM            PIC X(02).                  CAT839  
               05  WS-PROC-DT-DD            PIC X(02).                  CAT839  
               05  WS-PROC-DT-YY            PIC X(02).                  CAT839  
           03  WS-PROC-DATE-CYMD.                                       CAT839  
               05  WS-PROC-DATE-CC          PIC X(02).                  CAT839  
               05  WS-PROC-DATE-YY          PIC X(02).                  CAT839  
               05  WS-PROC-DATE-MM          PIC X(02).                  CAT839  
               05  WS-PROC-DATE-DD          PIC X(02).                  CAT839  
           03  WS-EDIT-DATE-MDCY.                                       CAT839  
               05  WS-EDIT-DATE-MM          PIC X(02).                  CAT839  
               05  FILLER                   PIC X(01) VALUE '/'.        CAT839  
               05  WS-EDIT-DATE-DD          PIC X(02).                  CAT839  
               05  FILLER                   PIC X(01) VALUE '/'.        CAT839  
               05  WS-EDIT-DATE-CC          PIC X(02).                  CAT839  
               05  WS-EDIT-DATE-YY          PIC X(02).                  CAT839  
           03  WS-JULIAN-DATE               PIC X(07).                  CAT839  
       01  WS-COUNT-AREA.                                               CAT839  
           03  LINECNT                      PIC 9(03) VALUE ZERO.       CAT839  
           03  PAGECNT                      PIC 9(03) VALUE ZERO.       CAT839  
           03  WS-READ-CNT                  PIC 9(07) VALUE ZERO.       CAT839  
           03  WS-NO-MATCH-CNT              PIC 9(07) VALUE ZERO.       CAT839  
           03  TBL-CNT                      PIC 9(03) VALUE ZERO.       CAT839  
           03  B1-SUB                       PIC 9(03) VALUE ZERO.       CAT839  
           03  B1-STREAM                    PIC X(01).                  CAT839  
       01  TBL-B1-AREA.                                                 CAT839  
           03  TBL-B1 OCCURS 500 TIMES.                                 CAT839  
               05 TBL-B1-CLT                PIC 9(04).                  CAT839  
               05 TBL-B1-CLT-NAME           PIC X(30).                  CAT839  
               05 TBL-MATCH-FND-IND.                                    CAT839  
                  07 TBL-EXACT-MATCH-FND-IND PIC X(01).                 CAT839  
                  07 TBL-FUZZY-MATCH-FND-IND PIC X(01).                 CAT839  
       EJECT                                                            CAT839  
      *                                                                 CAT839  
       COPY STUBCPY.                                                    CAT839  
       EJECT                                                            CAT839  
      *                                                                 CAT839  
       01  PIC X(32)  VALUE '        GETNA RECORD LAYOUTS    '.         CAT839  
       COPY GETNACOB.                                                   CAT839  
       01  GETNA-SEGMENT-INCLUDES.                                      CAT839  
           COPY NASEGHDR.                                               CAT839  
           COPY NASEGPPA.                                               CAT839  
           COPY NASEGPPB.                                               CAT839  
           COPY NASEGEND.                                               CAT839  
           EJECT                                                        CAT839  
      *                                                                 CAT839  
           COPY BPDATESC.                                               CAT839  
           COPY BHINFO.                                                 CAT839  
           COPY BHACAT.                                                 CAT839  
           EJECT                                                        CAT839  
      *                                                                 CAT839  
       01  HDR1-LINE.                                                   CAT839  
           03  HDR1-CC                 PIC X(01) VALUE '1'.             CAT839  
           03  FILLER                  PIC X(05) VALUE 'CLT: '.         CAT839  
           03  HDR1-CLT                PIC X(03).                       CAT839  
           03  FILLER                  PIC X(02) VALUE SPACES.          CAT839  
           03  HDR1-CLT-NAME           PIC X(30).                       CAT839  
           03  FILLER                  PIC X(12) VALUE SPACES.          CAT839  
           03  FILLER                  PIC X(22) VALUE                  CAT839  
               '** ACAT OFAC REPORT **'.                                CAT839  
           03  FILLER                  PIC X(32) VALUE SPACES.          CAT839  
           03  FILLER                  PIC X(14) VALUE                  CAT839  
               'CAT839  DATE: '.                                        CAT839  
           03  HDR1-DATE               PIC X(10).                       CAT839  
       01  HDR2-LINE.                                                   CAT839  
           03  HDR2-CC                 PIC X(01) VALUE ' '.             CAT839  
           03  FILLER                  PIC X(46) VALUE SPACES.          CAT839  
           03  HDR2-REP-NAME           PIC X(35).                       CAT839  
           03  FILLER                  PIC X(39) VALUE SPACES.          CAT839  
           03  FILLER                  PIC X(06) VALUE 'PAGE: '.        CAT839  
           03  HDR2-PAGE               PIC ZZZ9.                        CAT839  
       01  HDR3-LINE.                                                   CAT839  
           03  HDR3-CC                 PIC X(01) VALUE '0'.             CAT839  
           03  FILLER                  PIC X(22) VALUE                  CAT839  
               'BR ACCT    RR   D/R   '.                                CAT839  
           03  FILLER                  PIC X(32) VALUE                  CAT839  
               'ACAT CUST NAME                  '.                      CAT839  
           03  FILLER                  PIC X(12) VALUE                  CAT839  
               'OFAC#       '.                                          CAT839  
           03  FILLER                  PIC X(09) VALUE                  CAT839  
               'OFAC NAME'.                                             CAT839  
       01  HDR4-UNDERLINE.                                              CAT839  
           03  HDR4-CC                 PIC X(01) VALUE ' '.             CAT839  
           03  FILLER                  PIC X(22) VALUE                  CAT839  
               '---------  ---  ---   '.                                CAT839  
           03  FILLER                  PIC X(32) VALUE                  CAT839  
               '------------------------------  '.                      CAT839  
           03  FILLER                  PIC X(12) VALUE                  CAT839  
               '----------  '.                                          CAT839  
           03  FILLER                  PIC X(50) VALUE                  CAT839  
               '--------------------------------------------------'.    CAT839  
       01  DTL1-LINE.                                                   CAT839  
           03  DTL1-CC                 PIC X(01) VALUE '0'.             CAT839  
           03  DTL1-ACCT               PIC X(09).                       CAT839  
           03  FILLER                  PIC X(02) VALUE SPACES.          CAT839  
           03  DTL1-RR                 PIC X(03).                       CAT839  
           03  FILLER                  PIC X(02) VALUE SPACES.          CAT839  
           03  DTL1-DLV-RCV            PIC X(03).                       CAT839  
           03  FILLER                  PIC X(03) VALUE SPACES.          CAT839  
           03  DTL1-CUST-NAME1         PIC X(30).                       CAT839  
           03  FILLER                  PIC X(02) VALUE SPACES.          CAT839  
           03  DTL1-OFAC-NBR           PIC X(10).                       CAT839  
           03  FILLER                  PIC X(02) VALUE SPACES.          CAT839  
           03  DTL1-OFAC-NAME1         PIC X(50).                       CAT839  
       01  DTL2-LINE.                                                   CAT839  
           03  DTL2-CC                 PIC X(01) VALUE ' '.             CAT839  
           03  FILLER                  PIC X(22) VALUE SPACES.          CAT839  
           03  DTL2-CUST-NAME2         PIC X(30).                       CAT839  
           03  FILLER                  PIC X(14) VALUE SPACES.          CAT839  
           03  DTL2-OFAC-NAME2         PIC X(50).                       CAT839  
       01  DTL3-LINE.                                                   CAT839  
           03  DTL3-CC                 PIC X(01) VALUE '0'.             CAT839  
           03  FILLER                  PIC X(12) VALUE SPACES.          CAT839  
           03  DTL3-NO-MATCH-MSG       PIC X(40).                       CAT839  
       01  PRINT-REC.                                                   CAT839  
           03  PRINT-LINE      PIC X(133).                              CAT839  
           03  PRINT-TRAC.                                              CAT839  
               05  CLT-TAG     PIC 9(03) COMP-3.                        CAT839  
               05  FILLLER     PIC X(08).                               CAT839  
           EJECT                                                        CAT839  
      *                                                                 CAT839  
       LINKAGE SECTION.                                                 CAT839  
       01  PARM-AREA.                                                   CAT839  
           05  PARM-LENGTH                  PIC S9(4) COMP SYNC.        CAT839  
           05  PARM-INFO.                                               CAT839  
               10  PARM-STREAM              PIC X.                      CAT839  
                   88  PARM-STREAM-VALID                VALUES ARE      CAT839  
                       'A' THRU 'Z' '0' THRU '9'.                       CAT839  
      *                                                                 CAT839  
       PROCEDURE DIVISION USING PARM-AREA.                              CAT839  
           COPY MSGCOBO.                                                CAT839  
           DISPLAY ' '.                                                 CAT839  
           DISPLAY '** CAT839 STARTS HERE - OFAC NAMES LIST REPORT'.    CAT839  
                                                                        CAT839  
           PERFORM  1000-INIT-RTN.                                      CAT839  
           PERFORM  2000-MAIN-RTN  UNTIL OFAC-EOF.                      CAT839  
           PERFORM  3500-SEARCH-CLIENT-TBL.                             CAT839  
                                                                        CAT839  
           CLOSE    OFAC-FILE                                           CAT839  
                    REPORT-FILE.                                        CAT839  
                                                                        CAT839  
           PERFORM  VARYING SUB FROM 1 BY 1 UNTIL SUB > TBL-CNT         CAT839  
              IF  TBL-EXACT-MATCH-FND-IND (SUB) = 'Y'                   CAT839  
              AND TBL-FUZZY-MATCH-FND-IND (SUB) = 'Y'                   CAT839  
                  DISPLAY '  CLT=' TBL-B1-CLT (SUB)                     CAT839  
                          ' : *EXACT MATCH FOUND    '                   CAT839  
                           '  *FUZZY MATCH FOUND'                       CAT839  
              END-IF                                                    CAT839  
              IF  TBL-EXACT-MATCH-FND-IND (SUB) = 'Y'                   CAT839  
              AND TBL-FUZZY-MATCH-FND-IND (SUB) = 'N'                   CAT839  
                  DISPLAY '  CLT=' TBL-B1-CLT (SUB)                     CAT839  
                          ' : *EXACT MATCH FOUND    '                   CAT839  
                           '   FUZZY MATCH NOT FOUND'                   CAT839  
              END-IF                                                    CAT839  
              IF  TBL-EXACT-MATCH-FND-IND (SUB) = 'N'                   CAT839  
              AND TBL-FUZZY-MATCH-FND-IND (SUB) = 'Y'                   CAT839  
                  DISPLAY '  CLT=' TBL-B1-CLT (SUB)                     CAT839  
                          ' :  EXACT MATCH NOT FOUND'                   CAT839  
                           '  *FUZZY MATCH FOUND'                       CAT839  
              END-IF                                                    CAT839  
              IF  TBL-EXACT-MATCH-FND-IND (SUB) = 'N'                   CAT839  
              AND TBL-FUZZY-MATCH-FND-IND (SUB) = 'N'                   CAT839  
                  DISPLAY '  CLT=' TBL-B1-CLT (SUB)                     CAT839  
                          ' :  EXACT MATCH NOT FOUND'                   CAT839  
                           '   FUZZY MATCH NOT FOUND'                   CAT839  
              END-IF                                                    CAT839  
           END-PERFORM.                                                 CAT839  
                                                                        CAT839  
           DISPLAY ' '.                                                 CAT839  
           DISPLAY 'CAT839: OFAC FILE RECS READ = ' WS-READ-CNT         CAT839  
                   ' (INCLUDES HEADER)'.                                CAT839  
           DISPLAY ' '.                                                 CAT839  
           DISPLAY '** CAT839 COMPLETED SUCCESSFULY'.                   CAT839  
           GOBACK.                                                      CAT839  
       EJECT                                                            CAT839  
      *                                                                 CAT839  
       1000-INIT-RTN.                                                   CAT839  
           IF PARM-LENGTH > 0                                           CAT839  
              IF PARM-STREAM-VALID                                      CAT839  
                 CONTINUE                                               CAT839  
              ELSE                                                      CAT839  
                 DISPLAY 'CAT839 - INVALID STREAM ID PARM'              CAT839  
                 MOVE +1010             TO ABEND-CODE                   CAT839  
                 CALL  ABEND         USING ABEND-CODE                   CAT839  
              END-IF                                                    CAT839  
           ELSE                                                         CAT839  
              DISPLAY 'CAT839 - STREAM ID PARM REQUIRED'                CAT839  
              MOVE +1020             TO ABEND-CODE                      CAT839  
              CALL  ABEND         USING ABEND-CODE                      CAT839  
           END-IF.                                                      CAT839  
                                                                        CAT839  
           MOVE  PGM-NAME                TO BPDATES-CALLING-PGM.        CAT839  
           MOVE  'C'                     TO BPDATES-REQ-TYPE.           CAT839  
           CALL  BPDATES              USING BPDATES-PARAMETERS.         CAT839  
                                                                        CAT839  
           MOVE  BPD-PROC-DATE           TO WS-PROC-DATE-CYMD.          CAT839  
           MOVE  WS-PROC-DATE-CC         TO WS-EDIT-DATE-CC.            CAT839  
           MOVE  WS-PROC-DATE-YY         TO WS-EDIT-DATE-YY.            CAT839  
           MOVE  WS-PROC-DATE-MM         TO WS-EDIT-DATE-MM.            CAT839  
           MOVE  WS-PROC-DATE-DD         TO WS-EDIT-DATE-DD.            CAT839  
           MOVE  WS-EDIT-DATE-MDCY       TO HDR1-DATE.                  CAT839  
                                                                        CAT839  
           DISPLAY 'PROCESS DATE = ' WS-EDIT-DATE-MDCY.                 CAT839  
                                                                        CAT839  
           MOVE SPACES                   TO  TBL-B1-AREA.               CAT839  
           MOVE 0                        TO  TBL-CNT.                   CAT839  
                                                                        CAT839  
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500        CAT839  
                                                                        CAT839  
              MOVE  ' '                   TO  BH-BROKER-HEADER-INFO     CAT839  
                                              BH-ACAT-INFO              CAT839  
              MOVE  B1-SUB                TO  BH-BROKER-NUMBER-N        CAT839  
              MOVE  '015'                 TO  BH-LOGICAL-RECORD-CODE    CAT839  
              MOVE  '434500'              TO  BH-B2-INFO-ID             CAT839  
              CALL  GETB1V              USING BH-BROKER-HEADER-INFO     CAT839  
                                              BH-ACAT-INFO              CAT839  
                                                                        CAT839  
      **<<    B1=434682 -  BH-ACAT-OFAC-REPORT >>                       CAT839  
              IF  BH-BROKER-ACTIVE                                      CAT839  
                  IF  BH-ACAT-ACTIVE                                    CAT839  
                      MOVE BH-BROKER-MINI-MAXI-INDICATOR TO B1-STREAM   CAT839  
                      IF  (B1-STREAM =  PARM-STREAM)                    CAT839  
                      AND (BH-ACAT-OFAC-REPORT = '1')                   CAT839  
                            ADD 1 TO TBL-CNT                            CAT839  
                            MOVE BH-BROKER-NUMBER-N                     CAT839  
                                   TO TBL-B1-CLT              (TBL-CNT) CAT839  
                            MOVE BH-BROKER-NAME                         CAT839  
                                   TO TBL-B1-CLT-NAME         (TBL-CNT) CAT839  
                            MOVE 'N'                                    CAT839  
                                   TO TBL-EXACT-MATCH-FND-IND (TBL-CNT) CAT839  
                                      TBL-FUZZY-MATCH-FND-IND (TBL-CNT) CAT839  
                      END-IF                                            CAT839  
                  END-IF                                                CAT839  
              END-IF                                                    CAT839  
                                                                        CAT839  
           END-PERFORM.                                                 CAT839  
                                                                        CAT839  
           MOVE LOW-VALUES   TO WS-CURRENT-KEY                          CAT839  
                                WS-PREVIOUS-KEY.                        CAT839  
           MOVE 1            TO FROM-SUB.                               CAT839  
                                                                        CAT839  
           OPEN   INPUT   OFAC-FILE                                     CAT839  
                 OUTPUT   REPORT-FILE.                                  CAT839  
                                                                        CAT839  
           PERFORM 6000-READ-OFAC-FILE.                                 CAT839  
           IF IN-OFAC-HDR-REC                                           CAT839  
              PERFORM 6000-READ-OFAC-FILE                               CAT839  
           END-IF.                                                      CAT839  
       EJECT                                                            CAT839  
      *                                                                 CAT839  
       2000-MAIN-RTN.                                                   CAT839  
           IF WS-PREVIOUS-KEY = LOW-VALUES                              CAT839  
              PERFORM 3000-CLIENT-BREAK                                 CAT839  
           ELSE                                                         CAT839  
              IF WS-CURRENT-KEY = WS-PREVIOUS-KEY                       CAT839  
                 CONTINUE                                               CAT839  
              ELSE                                                      CAT839  
                 IF WS-CURR-KEY-CLT = WS-PREV-KEY-CLT                   CAT839  
                    IF WS-CURR-KEY-MATCH-IND = WS-PREV-KEY-MATCH-IND    CAT839  
                       CONTINUE                                         CAT839  
                    ELSE                                                CAT839  
                       PERFORM  3100-MATCH-IND-BREAK                    CAT839  
                    END-IF                                              CAT839  
                 ELSE                                                   CAT839  
                    PERFORM  3000-CLIENT-BREAK                          CAT839  
                 END-IF                                                 CAT839  
              END-IF                                                    CAT839  
           END-IF.                                                      CAT839  
                                                                        CAT839  
           PERFORM 3200-DETAIL-LINE-RTN.                                CAT839  
                                                                        CAT839  
           IF WS-CURRENT-KEY  NOT =  WS-PREVIOUS-KEY                    CAT839  
                MOVE WS-CURRENT-KEY   TO WS-PREVIOUS-KEY                CAT839  
           END-IF.                                                      CAT839  
                                                                        CAT839  
           PERFORM 6000-READ-OFAC-FILE.                                 CAT839  
       EJECT                                                            CAT839  
      *                                                                 CAT839  
       3000-CLIENT-BREAK.                                               CAT839  
           PERFORM  3500-SEARCH-CLIENT-TBL.                             CAT839  
                                                                        CAT839  
           IF  WS-CURR-KEY-MATCH-IND = 'A'                              CAT839  
               MOVE 'Y' TO TBL-EXACT-MATCH-FND-IND (CLT-SUB)            CAT839  
               MOVE  CLT-SUB  TO SAVE-CLT-SUB                           CAT839  
           ELSE                                                         CAT839  
               MOVE 'Y' TO TBL-FUZZY-MATCH-FND-IND (CLT-SUB)            CAT839  
               MOVE CLT-SUB TO SUB                                      CAT839  
               PERFORM 3600-NO-EXACT-MATCH-OUT-RTN                      CAT839  
           END-IF.                                                      CAT839  
                                                                        CAT839  
           MOVE ZERO TO PAGECNT.                                        CAT839  
           MOVE TBL-B1-CLT (CLT-SUB)      TO WS-CLIENT-NBR              CAT839  
           MOVE WS-CLIENT-NUM             TO CLT-TAG                    CAT839  
           MOVE WS-CLIENT                 TO HDR1-CLT                   CAT839  
           MOVE TBL-B1-CLT-NAME (CLT-SUB) TO HDR1-CLT-NAME              CAT839  
           MOVE HDR1-LINE                 TO PRINT-LINE                 CAT839  
           WRITE REPORT-RECORD FROM PRINT-REC.                          CAT839  
                                                                        CAT839  
           IF  WS-CURR-KEY-MATCH-IND = 'A'                              CAT839  
               MOVE WS-EXACT-MATCH-TITLE-OUT  TO HDR2-REP-NAME          CAT839  
           ELSE                                                         CAT839  
               MOVE WS-FUZZY-MATCH-TITLE-OUT  TO HDR2-REP-NAME          CAT839  
           END-IF.                                                      CAT839  
           ADD  1          TO PAGECNT.                                  CAT839  
           MOVE PAGECNT    TO HDR2-PAGE.                                CAT839  
           MOVE HDR2-LINE  TO PRINT-LINE                                CAT839  
           WRITE REPORT-RECORD FROM PRINT-REC.                          CAT839  
                                                                        CAT839  
           MOVE HDR3-LINE  TO PRINT-LINE                                CAT839  
           WRITE REPORT-RECORD FROM PRINT-REC.                          CAT839  
                                                                        CAT839  
           MOVE HDR4-UNDERLINE TO PRINT-LINE.                           CAT839  
           WRITE REPORT-RECORD FROM PRINT-REC.                          CAT839  
                                                                        CAT839  
           MOVE 6 TO LINECNT.                                           CAT839  
      *                                                                 CAT839  
       3100-MATCH-IND-BREAK.                                            CAT839  
           MOVE HDR1-LINE        TO PRINT-LINE                          CAT839  
           WRITE REPORT-RECORD FROM PRINT-REC.                          CAT839  
                                                                        CAT839  
           MOVE 'Y' TO TBL-FUZZY-MATCH-FND-IND (CLT-SUB).               CAT839  
                                                                        CAT839  
           MOVE WS-FUZZY-MATCH-TITLE-OUT  TO HDR2-REP-NAME.             CAT839  
           ADD  1          TO PAGECNT.                                  CAT839  
           MOVE PAGECNT    TO HDR2-PAGE.                                CAT839  
           MOVE HDR2-LINE  TO PRINT-LINE                                CAT839  
           WRITE REPORT-RECORD FROM PRINT-REC.                          CAT839  
                                                                        CAT839  
           MOVE HDR3-LINE  TO PRINT-LINE                                CAT839  
           WRITE REPORT-RECORD FROM PRINT-REC.                          CAT839  
                                                                        CAT839  
           MOVE HDR4-UNDERLINE  TO PRINT-LINE                           CAT839  
           WRITE REPORT-RECORD FROM PRINT-REC.                          CAT839  
                                                                        CAT839  
           MOVE 6 TO LINECNT.                                           CAT839  
       EJECT                                                            CAT839  
      *                                                                 CAT839  
       3200-DETAIL-LINE-RTN.                                            CAT839  
           IF LINECNT > 52                                              CAT839  
              MOVE HDR1-LINE     TO PRINT-LINE                          CAT839  
              WRITE REPORT-RECORD FROM PRINT-REC                        CAT839  
                                                                        CAT839  
              ADD  1          TO PAGECNT                                CAT839  
              MOVE PAGECNT    TO HDR2-PAGE                              CAT839  
              MOVE HDR2-LINE  TO PRINT-LINE                             CAT839  
              WRITE REPORT-RECORD FROM PRINT-REC                        CAT839  
                                                                        CAT839  
              MOVE HDR3-LINE  TO PRINT-LINE                             CAT839  
              WRITE REPORT-RECORD FROM PRINT-REC                        CAT839  
                                                                        CAT839  
              MOVE HDR4-UNDERLINE  TO PRINT-LINE                        CAT839  
              WRITE REPORT-RECORD FROM PRINT-REC                        CAT839  
                                                                        CAT839  
              MOVE 6 TO LINECNT.                                        CAT839  
                                                                        CAT839  
                                                                        CAT839  
      **<< DETAIL DISPLAY LINE 1 >>                                     CAT839  
           MOVE IN-OFAC-BRANCH      TO WS-BRANCH.                       CAT839  
           MOVE IN-OFAC-ACCOUNT     TO WS-ACCT.                         CAT839  
           MOVE WS-BR-ACCT-NBR      TO DTL1-ACCT.                       CAT839  
                                                                        CAT839  
           IF IN-OFAC-DELIVERER                                         CAT839  
              MOVE 'DLV'            TO DTL1-DLV-RCV                     CAT839  
           ELSE                                                         CAT839  
              MOVE 'RCV'            TO DTL1-DLV-RCV                     CAT839  
           END-IF.                                                      CAT839  
                                                                        CAT839  
           MOVE IN-OFAC-RR          TO DTL1-RR                          CAT839  
           MOVE IN-OFAC-OFAC-NBR    TO DTL1-OFAC-NBR                    CAT839  
                                                                        CAT839  
           MOVE IN-OFAC-ACAT-NAME   TO WS-CUST-NAME                     CAT839  
           MOVE IN-OFAC-ACAT-ADDR   TO WS-CUST-ADDRESS.                 CAT839  
           MOVE IN-OFAC-OFAC-NAME   TO WS-OFAC-NAME.                    CAT839  
                                                                        CAT839  
           MOVE SPACE  TO DTL1-CUST-NAME1                               CAT839  
                          DTL1-OFAC-NAME1.                              CAT839  
                                                                        CAT839  
           MOVE 1   TO CUST-SUB.                                        CAT839  
           PERFORM 3210-GET-CUST-NAME.                                  CAT839  
           IF WS-ACAT-CUST-NAME NOT = SPACE                             CAT839  
              MOVE WS-ACAT-CUST-NAME  TO DTL1-CUST-NAME1                CAT839  
           END-IF.                                                      CAT839  
                                                                        CAT839  
           MOVE  1  TO OFAC-SUB.                                        CAT839  
           PERFORM 3220-GET-OFAC-NAME.                                  CAT839  
           IF WS-OFAC-MATCH-NAME NOT = SPACE                            CAT839  
              MOVE WS-OFAC-MATCH-NAME TO DTL1-OFAC-NAME1                CAT839  
           END-IF.                                                      CAT839  
                                                                        CAT839  
           MOVE DTL1-LINE  TO PRINT-LINE                                CAT839  
           WRITE REPORT-RECORD FROM PRINT-REC.                          CAT839  
           ADD 2 TO LINECNT.                                            CAT839  
                                                                        CAT839  
      **<< DETAIL DISPLAY LINE 2 >>                                     CAT839  
                                                                        CAT839  
           MOVE SPACE  TO DTL2-CUST-NAME2                               CAT839  
                          DTL2-OFAC-NAME2.                              CAT839  
                                                                        CAT839  
           IF CUST-SUB < 7                                              CAT839  
              PERFORM 3210-GET-CUST-NAME                                CAT839  
              IF WS-ACAT-CUST-NAME NOT = SPACE                          CAT839  
                 MOVE WS-ACAT-CUST-NAME  TO DTL2-CUST-NAME2             CAT839  
              END-IF                                                    CAT839  
           END-IF.                                                      CAT839  
                                                                        CAT839  
           IF OFAC-SUB < 5                                              CAT839  
              PERFORM 3220-GET-OFAC-NAME                                CAT839  
              IF WS-OFAC-MATCH-NAME NOT = SPACE                         CAT839  
                 MOVE WS-OFAC-MATCH-NAME TO DTL2-OFAC-NAME2             CAT839  
              END-IF                                                    CAT839  
           END-IF.                                                      CAT839  
                                                                        CAT839  
           IF  DTL2-CUST-NAME2 > SPACE                                  CAT839  
           OR  DTL2-OFAC-NAME2 > SPACE                                  CAT839  
                 MOVE DTL2-LINE  TO PRINT-LINE                          CAT839  
                 WRITE REPORT-RECORD FROM PRINT-REC                     CAT839  
                 ADD 1 TO LINECNT                                       CAT839  
           END-IF.                                                      CAT839  
                                                                        CAT839  
      **<< DETAIL DISPLAY LINE 3 >>                                     CAT839  
                                                                        CAT839  
           MOVE SPACE  TO DTL2-CUST-NAME2                               CAT839  
                          DTL2-OFAC-NAME2.                              CAT839  
                                                                        CAT839  
           IF CUST-SUB < 7                                              CAT839  
              PERFORM 3210-GET-CUST-NAME                                CAT839  
              IF WS-ACAT-CUST-NAME NOT = SPACE                          CAT839  
                 MOVE WS-ACAT-CUST-NAME  TO DTL2-CUST-NAME2             CAT839  
              END-IF                                                    CAT839  
           END-IF.                                                      CAT839  
                                                                        CAT839  
           IF OFAC-SUB < 5                                              CAT839  
              PERFORM 3220-GET-OFAC-NAME                                CAT839  
              IF WS-OFAC-MATCH-NAME NOT = SPACE                         CAT839  
                 MOVE WS-OFAC-MATCH-NAME TO DTL2-OFAC-NAME2             CAT839  
              END-IF                                                    CAT839  
           END-IF.                                                      CAT839  
                                                                        CAT839  
           IF  DTL2-CUST-NAME2 > SPACE                                  CAT839  
           OR  DTL2-OFAC-NAME2 > SPACE                                  CAT839  
                 MOVE DTL2-LINE  TO PRINT-LINE                          CAT839  
                 WRITE REPORT-RECORD FROM PRINT-REC                     CAT839  
                 ADD 1 TO LINECNT                                       CAT839  
           END-IF.                                                      CAT839  
                                                                        CAT839  
      **<< DETAIL DISPLAY LINE 4 >>                                     CAT839  
                                                                        CAT839  
           MOVE SPACE  TO DTL2-CUST-NAME2                               CAT839  
                          DTL2-OFAC-NAME2.                              CAT839  
                                                                        CAT839  
           IF CUST-SUB < 7                                              CAT839  
              PERFORM 3210-GET-CUST-NAME                                CAT839  
              IF WS-ACAT-CUST-NAME NOT = SPACE                          CAT839  
                 MOVE WS-ACAT-CUST-NAME  TO DTL2-CUST-NAME2             CAT839  
              END-IF                                                    CAT839  
           END-IF.                                                      CAT839  
                                                                        CAT839  
           IF OFAC-SUB < 5                                              CAT839  
              PERFORM 3220-GET-OFAC-NAME                                CAT839  
              IF WS-OFAC-MATCH-NAME NOT = SPACE                         CAT839  
                 MOVE WS-OFAC-MATCH-NAME TO DTL2-OFAC-NAME2             CAT839  
              END-IF                                                    CAT839  
           END-IF.                                                      CAT839  
                                                                        CAT839  
           IF  DTL2-CUST-NAME2 > SPACE                                  CAT839  
           OR  DTL2-OFAC-NAME2 > SPACE                                  CAT839  
                 MOVE DTL2-LINE  TO PRINT-LINE                          CAT839  
                 WRITE REPORT-RECORD FROM PRINT-REC                     CAT839  
                 ADD 1 TO LINECNT                                       CAT839  
           END-IF.                                                      CAT839  
                                                                        CAT839  
      **<< DETAIL DISPLAY LINE 5 >>                                     CAT839  
                                                                        CAT839  
           MOVE SPACE  TO DTL2-CUST-NAME2                               CAT839  
                          DTL2-OFAC-NAME2.                              CAT839  
                                                                        CAT839  
           IF CUST-SUB < 7                                              CAT839  
              PERFORM 3210-GET-CUST-NAME                                CAT839  
              IF WS-ACAT-CUST-NAME NOT = SPACE                          CAT839  
                 MOVE WS-ACAT-CUST-NAME  TO DTL2-CUST-NAME2             CAT839  
              END-IF                                                    CAT839  
           END-IF.                                                      CAT839  
                                                                        CAT839  
           IF  DTL2-CUST-NAME2 > SPACE                                  CAT839  
                 MOVE DTL2-LINE  TO PRINT-LINE                          CAT839  
                 WRITE REPORT-RECORD FROM PRINT-REC                     CAT839  
                 ADD 1 TO LINECNT                                       CAT839  
           END-IF.                                                      CAT839  
                                                                        CAT839  
      **<< DETAIL DISPLAY LINE 6 >>                                     CAT839  
                                                                        CAT839  
           MOVE SPACE  TO DTL2-CUST-NAME2                               CAT839  
                          DTL2-OFAC-NAME2.                              CAT839  
                                                                        CAT839  
           IF CUST-SUB < 7                                              CAT839  
              PERFORM 3210-GET-CUST-NAME                                CAT839  
              IF WS-ACAT-CUST-NAME NOT = SPACE                          CAT839  
                 MOVE WS-ACAT-CUST-NAME  TO DTL2-CUST-NAME2             CAT839  
              END-IF                                                    CAT839  
           END-IF.                                                      CAT839  
                                                                        CAT839  
           IF  DTL2-CUST-NAME2 > SPACE                                  CAT839  
                 MOVE DTL2-LINE  TO PRINT-LINE                          CAT839  
                 WRITE REPORT-RECORD FROM PRINT-REC                     CAT839  
                 ADD 1 TO LINECNT                                       CAT839  
           END-IF.                                                      CAT839  
       EJECT                                                            CAT839  
      *                                                                 CAT839  
       3210-GET-CUST-NAME.                                              CAT839  
           MOVE SPACE TO WS-NAME-FND-SW                                 CAT839  
                         WS-ACAT-CUST-NAME.                             CAT839  
                                                                        CAT839  
           PERFORM UNTIL CUST-SUB > 6 OR WS-NAME-FND                    CAT839  
              IF WS-CUST-NAME-ADDR-TBL (CUST-SUB) = SPACE               CAT839  
                 CONTINUE                                               CAT839  
              ELSE                                                      CAT839  
                 SET WS-NAME-FND TO TRUE                                CAT839  
                 MOVE WS-CUST-NAME-ADDR-TBL (CUST-SUB)                  CAT839  
                   TO WS-ACAT-CUST-NAME                                 CAT839  
              END-IF                                                    CAT839  
              ADD 1 TO CUST-SUB                                         CAT839  
           END-PERFORM.                                                 CAT839  
      *                                                                 CAT839  
       3220-GET-OFAC-NAME.                                              CAT839  
           MOVE SPACE TO WS-NAME-FND-SW                                 CAT839  
                         WS-OFAC-MATCH-NAME.                            CAT839  
                                                                        CAT839  
           PERFORM UNTIL OFAC-SUB > 4 OR WS-NAME-FND                    CAT839  
              IF WS-OFAC-NAME-TBL (OFAC-SUB) = SPACE                    CAT839  
                 CONTINUE                                               CAT839  
              ELSE                                                      CAT839  
                 SET WS-NAME-FND TO TRUE                                CAT839  
                 MOVE WS-OFAC-NAME-TBL (OFAC-SUB)                       CAT839  
                   TO WS-OFAC-MATCH-NAME                                CAT839  
              END-IF                                                    CAT839  
              ADD 1 TO OFAC-SUB                                         CAT839  
           END-PERFORM.                                                 CAT839  
       EJECT                                                            CAT839  
      *                                                                 CAT839  
       3500-SEARCH-CLIENT-TBL.                                          CAT839  
           IF WS-PREV-KEY-MATCH-IND = 'A'                               CAT839  
               MOVE SAVE-CLT-SUB TO SUB                                 CAT839  
               PERFORM 3700-NO-FUZZY-MATCH-OUT-RTN                      CAT839  
           END-IF.                                                      CAT839  
                                                                        CAT839  
           MOVE SPACE TO WS-CLT-FOUND-SW.                               CAT839  
           PERFORM VARYING SUB FROM FROM-SUB BY 1                       CAT839  
                          UNTIL SUB > TBL-CNT                           CAT839  
                             OR WS-CLT-FOUND                            CAT839  
              IF WS-CURR-KEY-CLT = TBL-B1-CLT (SUB)                     CAT839  
                 MOVE SUB          TO CLT-SUB                           CAT839  
                 SET WS-CLT-FOUND  TO TRUE                              CAT839  
                 COMPUTE FROM-SUB = SUB + 1                             CAT839  
              ELSE                                                      CAT839  
                 IF WS-CURR-KEY-CLT > TBL-B1-CLT (SUB)                  CAT839  
                     PERFORM 3600-NO-EXACT-MATCH-OUT-RTN                CAT839  
                     PERFORM 3700-NO-FUZZY-MATCH-OUT-RTN                CAT839  
                 END-IF                                                 CAT839  
              END-IF                                                    CAT839  
           END-PERFORM.                                                 CAT839  
       EJECT                                                            CAT839  
      *                                                                 CAT839  
       3600-NO-EXACT-MATCH-OUT-RTN.                                     CAT839  
           MOVE ZERO TO PAGECNT.                                        CAT839  
           MOVE WS-EXACT-MATCH-TITLE-OUT  TO HDR2-REP-NAME.             CAT839  
           MOVE WS-NO-EXACT-MATCH-MSG     TO DTL3-NO-MATCH-MSG.         CAT839  
           PERFORM 3800-NO-MATCH-OUT-RTN.                               CAT839  
                                                                        CAT839  
       3700-NO-FUZZY-MATCH-OUT-RTN.                                     CAT839  
           MOVE WS-FUZZY-MATCH-TITLE-OUT  TO HDR2-REP-NAME.             CAT839  
           MOVE WS-NO-FUZZY-MATCH-MSG     TO DTL3-NO-MATCH-MSG.         CAT839  
           PERFORM 3800-NO-MATCH-OUT-RTN.                               CAT839  
                                                                        CAT839  
       3800-NO-MATCH-OUT-RTN.                                           CAT839  
           MOVE TBL-B1-CLT (SUB)          TO WS-CLIENT-NBR              CAT839  
           MOVE WS-CLIENT-NUM             TO CLT-TAG                    CAT839  
           MOVE WS-CLIENT                 TO HDR1-CLT                   CAT839  
           MOVE TBL-B1-CLT-NAME (SUB)     TO HDR1-CLT-NAME              CAT839  
           MOVE HDR1-LINE                 TO PRINT-LINE                 CAT839  
           WRITE REPORT-RECORD FROM PRINT-REC.                          CAT839  
                                                                        CAT839  
           ADD  1          TO PAGECNT.                                  CAT839  
           MOVE PAGECNT    TO HDR2-PAGE.                                CAT839  
           MOVE HDR2-LINE  TO PRINT-LINE                                CAT839  
           WRITE REPORT-RECORD FROM PRINT-REC.                          CAT839  
                                                                        CAT839  
           MOVE HDR3-LINE  TO PRINT-LINE                                CAT839  
           WRITE REPORT-RECORD FROM PRINT-REC.                          CAT839  
                                                                        CAT839  
           MOVE HDR4-UNDERLINE TO PRINT-LINE.                           CAT839  
           WRITE REPORT-RECORD FROM PRINT-REC.                          CAT839  
                                                                        CAT839  
           MOVE DTL3-LINE TO PRINT-LINE.                                CAT839  
           WRITE REPORT-RECORD FROM PRINT-REC.                          CAT839  
      *                                                                 CAT839  
       6000-READ-OFAC-FILE.                                             CAT839  
           READ OFAC-FILE                                               CAT839  
             AT END                                                     CAT839  
                 SET OFAC-EOF TO TRUE                                   CAT839  
                 MOVE WS-CURRENT-KEY TO WS-PREVIOUS-KEY                 CAT839  
                 MOVE HIGH-VALUES    TO WS-CURRENT-KEY                  CAT839  
             NOT AT END                                                 CAT839  
                 ADD 1 TO WS-READ-CNT                                   CAT839  
                 IF NOT IN-OFAC-HDR-REC                                 CAT839  
                    MOVE IN-OFAC-CLIENT-NUM   TO WS-CURR-KEY-CLT        CAT839  
                    MOVE IN-OFAC-MATCH-IND    TO WS-CURR-KEY-MATCH-IND  CAT839  
                    MOVE IN-OFAC-BRANCH       TO WS-CURR-KEY-BRANCH     CAT839  
                    MOVE IN-OFAC-ACCOUNT      TO WS-CURR-KEY-ACCT       CAT839  
                 END-IF                                                 CAT839  
           END-READ.                                                    CAT839  
      *##############################################################   CAT839  
