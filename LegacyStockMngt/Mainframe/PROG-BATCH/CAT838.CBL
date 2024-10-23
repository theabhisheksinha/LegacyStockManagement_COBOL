000001* PDX    - CAT838   C0348882 12/06/13 06:52:08 TBCHKOP            00001000
CSG001* SSR 0091356 MOVE SPACES TO BPDATES-CALENDAR-TYPE.                       
000001* PDX    - CAT838   C0272583 12/08/08 09:49:31 TBDOJUN            00001000
DJ0001* SSR 0061164 POSITION TRANSFER FUND(PTF)                                 
000001* PDX    - CAT838   C0250644 07/30/07 14:52:14 TBLAMUR            00001000
LRM002* SSR 0051065 PASS CLIENT NBR TO OFAC I/O MOD FACU1B                      
000001* PDX    - CAT838   C0216215 01/24/05 14:30:44 TBLAMUR            00001000
LRM001* SSR 0039561 INCLUDE PTR ON REPORT                                       
000001* PDX    - CAT838   C0189201 07/23/03 13:35:01 TBEDTAK            00001000
       IDENTIFICATION DIVISION.                                         CAT838  
       PROGRAM-ID. CAT838.                                              CAT838  
      ***************************************************************** CAT838  
      *REMARKS.                                                       * CAT838  
      *                                                               * CAT838  
      *  THIS PROGRAM CREATES A FILE THAT CONTAINS ACAT ACCOUNT NAMES * CAT838  
      *  FOUND IN OFAC NAMES LIST.                                    * CAT838  
      *                                                               * CAT838  
      *  INPUT : ACAT DATABASE                                        * CAT838  
      *          MMS/FAC DATABASE                                     * CAT838  
      *          N&A FILE                                             * CAT838  
      *  OUTPUT: B***.CAT838.OFACFL                                   * CAT838  
      ***************************************************************** CAT838  
      **                                                                CAT838  
       ENVIRONMENT DIVISION.                                            CAT838  
       INPUT-OUTPUT SECTION.                                            CAT838  
                                                                        CAT838  
       FILE-CONTROL.                                                    CAT838  
                                                                        CAT838  
           SELECT  OFAC-FILE           ASSIGN  TO  OFACFL.              CAT838  
                                                                        CAT838  
      ***************************************************************** CAT838  
       DATA DIVISION.                                                   CAT838  
      ***************************************************************** CAT838  
       FILE SECTION.                                                    CAT838  
                                                                        CAT838  
       FD  OFAC-FILE                                                    CAT838  
           RECORDING MODE IS F                                          CAT838  
           LABEL RECORDS STANDARD                                       CAT838  
           BLOCK CONTAINS 0 RECORDS.                                    CAT838  
           COPY CATOFAC     REPLACING    ==:CAT:== BY ==O==.            CAT838  
           EJECT                                                        CAT838  
      *                                                                 CAT838  
       WORKING-STORAGE  SECTION.                                        CAT838  
       77  PGM-NAME                         PIC X(08) VALUE 'CAT838'.   CAT838  
       77  ABEND-CODE                       PIC S9(4) COMP VALUE 1100.  CAT838  
      *                                                                 CAT838  
       01  WS-WORKING-AREA.                                             CAT838  
           03  WS-CLIENT-NBR                PIC X(04).                  CAT838  
           03  WS-BRANCH                    PIC X(03).                  CAT838  
           03  WS-ACCT                      PIC X(05).                  CAT838  
           03  WS-OFAC-MATCH-IND            PIC X(01).                  CAT838  
           03  WS-NAME-ADDRESS.                                         CAT838  
               05  WS-NAME.                                             CAT838  
                   07  WS-NAME-ADDR1        PIC X(30).                  CAT838  
                   07  WS-NAME-ADDR2        PIC X(30).                  CAT838  
               05  WS-ADDRESS.                                          CAT838  
                   07  WS-NAME-ADDR3        PIC X(30).                  CAT838  
                   07  WS-NAME-ADDR4        PIC X(30).                  CAT838  
                   07  WS-NAME-ADDR5        PIC X(30).                  CAT838  
                   07  WS-NAME-ADDR6        PIC X(30).                  CAT838  
           03  WS-NAME-TO-INVESTIGATE       PIC X(30).                  CAT838  
           03  WS-CNTL-NBR-MINUS-2DAYS      PIC X(14).                  CAT838  
           03  WS-CONTROL-NBR-FROM.                                     CAT838  
               05  WS-JULDATE-FROM          PIC X(07).                  CAT838  
               05  FILLER                   PIC X(07) VALUE ALL '0'.    CAT838  
           03  WS-TRNFR-NOT-FOUND-SW        PIC X(01).                  CAT838  
               88  WS-TRNFR-NOT-FOUND                 VALUE 'N'.        CAT838  
           03  WS-NO-MATCH-IND              PIC X(01).                  CAT838  
               88  WS-NO-MATCH                        VALUE 'N'.        CAT838  
       01  SUBSRIPT-AREA.                                               CAT838  
           03  SUB                          PIC 9(03) VALUE ZERO.       CAT838  
           03  B1-TBL-CNT                   PIC 9(03) VALUE ZERO.       CAT838  
           03  B1-SUB                       PIC 9(03) VALUE ZERO.       CAT838  
           03  B1-STREAM                    PIC X(01).                  CAT838  
       01  WS-DATE-AREA.                                                CAT838  
           03  WS-PROC-DATE-MDY.                                        CAT838  
               05  WS-PROC-DT-MM            PIC X(02).                  CAT838  
               05  WS-PROC-DT-DD            PIC X(02).                  CAT838  
               05  WS-PROC-DT-YY            PIC X(02).                  CAT838  
           03  WS-PROC-DATE-CYMD.                                       CAT838  
               05  WS-PROC-DATE-CC          PIC X(02).                  CAT838  
               05  WS-PROC-DATE-YY          PIC X(02).                  CAT838  
               05  WS-PROC-DATE-MM          PIC X(02).                  CAT838  
               05  WS-PROC-DATE-DD          PIC X(02).                  CAT838  
           03  WS-BPD-PROC-DATE-BASE        PIC X(08).                  CAT838  
           03  WS-JULIAN-DATE               PIC X(07).                  CAT838  
       01  WS-COUNT-AREA.                                               CAT838  
           03  WS-WRITE-CNT                 PIC 9(07) VALUE ZERO.       CAT838  
           03  WS-EXACT-CNT                 PIC 9(07) VALUE ZERO.       CAT838  
           03  WS-FUZZY-CNT                 PIC 9(07) VALUE ZERO.       CAT838  
           03  WS-OFAC-CNT                  PIC 9(07) VALUE ZERO.       CAT838  
           03  WS-FETCH-CNT                 PIC 9(07) VALUE ZERO.       CAT838  
      *                                                                 CAT838  
       01  FILLER                        PIC X(008) VALUE 'B1-TABLE'.   CAT838  
       01  B1-TABLE-AREA.                                               CAT838  
           03  B1-TABLE OCCURS 500 TIMES.                               CAT838  
               05  B1-ADP-CL-NO             PIC 9(04).                  CAT838  
               05  B1-CLI-NAME              PIC X(30).                  CAT838  
               05  B1-BKR-CLR-NO            PIC X(04).                  CAT838  
               05  B1-STATUS                PIC X(01).                  CAT838  
               05  B1-ACAT-STATUS           PIC X(01).                  CAT838  
       EJECT                                                            CAT838  
      *                                                                 CAT838  
       COPY STUBCPY.                                                    CAT838  
       EJECT                                                            CAT838  
       01  FACU1B                         PIC X(08) VALUE 'FACU1B  '.   CAT838  
      /                                                                 CAT838  
       COPY FACU1CA                                                     CAT838  
            REPLACING ==:P:==         BY ==  ==.                        CAT838  
      *                                                                 CAT838  
       01  PIC X(32)  VALUE '        GETNA RECORD LAYOUTS    '.         CAT838  
       COPY GETNACOB.                                                   CAT838  
       01  GETNA-SEGMENT-INCLUDES.                                      CAT838  
       COPY NASEGHDR.                                                   CAT838  
       COPY NASEGPPA.                                                   CAT838  
       COPY NASEGPPB.                                                   CAT838  
       COPY NNASGRPE.                                                   CAT838  
       COPY NASEGEND.                                                   CAT838  
           EJECT                                                        CAT838  
           COPY BPDATESC.                                               CAT838  
           COPY BHINFO.                                                 CAT838  
           COPY BHACAT.                                                 CAT838  
           EJECT                                                        CAT838  
      *                                                                 CAT838  
       01  DSNTIAR                       PIC X(008) VALUE 'DSNTIAR'.    CAT838  
       01  W-DB2-MESSAGE-AREA.                                          CAT838  
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.    CAT838  
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES     CAT838  
                   INDEXED BY W-DB2-IDX.                                CAT838  
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.     CAT838  
       01  W-DB2-ERR-MSG-OUT.                                           CAT838  
           05  FILLER            PIC X(04) VALUE '**  '.                CAT838  
           05  W-ERR-MSG-OUT     PIC X(50) VALUE SPACE.                 CAT838  
           05  FILLER            PIC X(12) VALUE '=> SQLCODE: '.        CAT838  
           05  W-SQLCODE-OUT     PIC -999.                              CAT838  
           EJECT                                                        CAT838  
      *                                                                 CAT838  
           EXEC SQL                                                     CAT838  
              INCLUDE SQLCA                                             CAT838  
           END-EXEC.                                                    CAT838  
           EJECT                                                        CAT838  
           EXEC SQL                                                     CAT838  
              INCLUDE VTRNFR                                            CAT838  
           END-EXEC.                                                    CAT838  
           EJECT                                                        CAT838  
           EXEC SQL                                                     CAT838  
             DECLARE  TRNFR_CSR  CURSOR FOR                             CAT838  
               SELECT                                                   CAT838  
                   CLIENT_NBR                                           CAT838  
                  ,ACAT_CONTROL_NBR                                     CAT838  
                  ,STTS_CD                                                      
                  ,RCV_NBR                                              CAT838  
                  ,TRNFR_TYPE_CD                                        CAT838  
                  ,RCV_CUST_NM                                          CAT838  
                  ,DSTBN_SIDE_CD                                        CAT838  
                  ,RR_CD                                                CAT838  
                  ,BRANCH_CD                                            CAT838  
                  ,ACCT_CD                                              CAT838  
               FROM                                                     CAT838  
                   VTRNFR                                               CAT838  
               WHERE CLIENT_NBR = :WS-CLIENT-NBR                        CAT838  
                 AND ACAT_CONTROL_NBR > :WS-CNTL-NBR-MINUS-2DAYS        CAT838  
                 AND (STTS_CD < '300'                                   CAT838  
LRM001           OR (STTS_CD = '500'                                            
DJ0001            AND TRNFR_TYPE_CD IN ('PTR', 'PTF')))                         
               ORDER BY                                                 CAT838  
                   CLIENT_NBR                                           CAT838  
                  ,BRANCH_CD                                            CAT838  
                  ,ACCT_CD                                              CAT838  
               FOR READ ONLY WITH UR                                            
           END-EXEC.                                                    CAT838  
           EJECT                                                        CAT838  
      *                                                                 CAT838  
       LINKAGE SECTION.                                                 CAT838  
       01  PARM-AREA.                                                   CAT838  
           05  PARM-LENGTH                  PIC S9(4) COMP SYNC.        CAT838  
           05  PARM-INFO.                                               CAT838  
               10  PARM-STREAM              PIC X.                      CAT838  
                   88  PARM-STREAM-VALID                VALUES ARE      CAT838  
                       'A' THRU 'Z' '0' THRU '9'.                       CAT838  
      *                                                                 CAT838  
       PROCEDURE DIVISION USING PARM-AREA.                              CAT838  
           COPY MSGCOBO.                                                CAT838  
                                                                        CAT838  
           DISPLAY ' '.                                                 CAT838  
           DISPLAY '** CAT838 STARTS HERE - CREATE OFAC NAME LIST FILE' CAT838  
                                                                        CAT838  
           PERFORM  1000-INIT-RTN.                                      CAT838  
           PERFORM  2000-MAIN-RTN.                                      CAT838  
                                                                        CAT838  
           CLOSE OFAC-FILE.                                             CAT838  
                                                                        CAT838  
           DISPLAY 'CAT838: VTRNFR FETCH COUNT     = ' WS-FETCH-CNT.    CAT838  
           DISPLAY 'CAT838: OUTPUT REC COUNT       = '                  CAT838  
                                  WS-WRITE-CNT ' (INCLUDES HEADER)'.    CAT838  
           DISPLAY 'CAT838: OFAC EXACT MATCH COUNT = ' WS-EXACT-CNT.    CAT838  
           DISPLAY 'CAT838: OFAC FUZZY MATCH COUNT = ' WS-FUZZY-CNT.    CAT838  
           DISPLAY 'CAT838: TOTAL OFAC MATCH COUNT = ' WS-OFAC-CNT.     CAT838  
           DISPLAY ' '.                                                 CAT838  
           DISPLAY '** CAT838 COMPLETED SUCCESSFULLY.'.                 CAT838  
           GOBACK.                                                      CAT838  
      *                                                                 CAT838  
       1000-INIT-RTN.                                                   CAT838  
           IF PARM-LENGTH > 0                                           CAT838  
              IF PARM-STREAM-VALID                                      CAT838  
                 CONTINUE                                               CAT838  
              ELSE                                                      CAT838  
                 DISPLAY 'CAT838 - INVALID STREAM ID PARM'              CAT838  
                 MOVE +1010  TO ABEND-CODE                              CAT838  
                 CALL  ABEND         USING ABEND-CODE                   CAT838  
              END-IF                                                    CAT838  
           ELSE                                                         CAT838  
              DISPLAY 'CAT838 - STREAM ID PARM REQUIRED'                CAT838  
              MOVE +1020  TO ABEND-CODE                                 CAT838  
              CALL  ABEND         USING ABEND-CODE                      CAT838  
           END-IF.                                                      CAT838  
           DISPLAY 'CAT838: RUNNING ON "' PARM-STREAM '" STREAM'.       CAT838  
                                                                        CAT838  
           MOVE  PGM-NAME                TO BPDATES-CALLING-PGM.        CAT838  
           MOVE  'C'                     TO BPDATES-REQ-TYPE.           CAT838  
           CALL  BPDATES              USING BPDATES-PARAMETERS.         CAT838  
           MOVE  BPD-PROC-DATE           TO  WS-PROC-DATE-CYMD.         CAT838  
           MOVE  BPD-JULIAN-PROC-DATE    TO  WS-JULIAN-DATE.            CAT838  
                                                                        CAT838  
           DISPLAY 'CAT838: PROCESS DATE = ' WS-PROC-DATE-CYMD.         CAT838  
           DISPLAY 'CAT838: JULIAN DATE  = ' WS-JULIAN-DATE.            CAT838  
                                                                        CAT838  
           MOVE  PGM-NAME                TO BPDATES-CALLING-PGM.        CAT838  
CSG001* MOVE SPACES TO BPDATES-CALENDAR-TYPE TO ALLOW BPDATES TO USE            
CSG001* THE DEFAULT CALENDAR.                                                   
CSG001*    MOVE  'US'                    TO BPDATES-CALENDAR-TYPE.      CAT838  
CSG001     MOVE  '  '                    TO BPDATES-CALENDAR-TYPE.      CAT838  
           MOVE  'D'                     TO BPDATES-REQ-TYPE.           CAT838  
           MOVE  WS-PROC-DATE-CYMD       TO WS-BPD-PROC-DATE-BASE.      CAT838  
           MOVE  WS-BPD-PROC-DATE-BASE   TO BPDATES-BASE-DATE.          CAT838  
           SET   BPD-DISP-TRADE-DATE     TO TRUE.                       CAT838  
           SET   BPD-DISP-MINUS          TO TRUE.                       CAT838  
           MOVE  2                       TO BPDATES-DTSEARCH-DISP.      CAT838  
           CALL  BPDATES              USING BPDATES-PARAMETERS.         CAT838  
                                                                        CAT838  
           MOVE  BPD-DT-JULDATE          TO  WS-JULDATE-FROM.           CAT838  
           MOVE  WS-CONTROL-NBR-FROM     TO  WS-CNTL-NBR-MINUS-2DAYS.   CAT838  
           DISPLAY 'CAT838: JULIAN DATE MINUS 2 BUSINESS DAYS = '       CAT838  
                                             WS-JULDATE-FROM.           CAT838  
                                                                        CAT838  
           DISPLAY 'CAT838: ALL CONTROL# GREATER THAN "'                CAT838  
                            WS-CONTROL-NBR-FROM                         CAT838  
                   '" ARE EXTRACTED FOR OFAC CHECK'.                    CAT838  
                                                                        CAT838  
           OPEN OUTPUT OFAC-FILE.                                       CAT838  
                                                                        CAT838  
           MOVE  SPACES             TO O-OFAC-HDR-RECORD.               CAT838  
           MOVE  LOW-VALUE          TO O-OFAC-HDR-CLIENT.               CAT838  
           MOVE  'DATE='            TO O-OFAC-HDR-DATE-LIT.             CAT838  
           MOVE  WS-PROC-DATE-CYMD  TO O-OFAC-HDR-PROC-DATE.            CAT838  
           MOVE  'JULIAN='          TO O-OFAC-HDR-JULIAN-LIT.           CAT838  
           MOVE  WS-JULIAN-DATE     TO O-OFAC-HDR-JULIAN-DATE.          CAT838  
           MOVE  'PGM='             TO O-OFAC-HDR-PGM-LIT.              CAT838  
           MOVE  PGM-NAME           TO O-OFAC-HDR-PROG-NAME.            CAT838  
           WRITE O-OFAC-RECORD.                                         CAT838  
           ADD 1 TO WS-WRITE-CNT.                                       CAT838  
                                                                        CAT838  
           DISPLAY ' '.                                                 CAT838  
           DISPLAY 'CAT838: OFAC REPORT REQUESTING CLIENTS LIST'        CAT838  
                                                                        CAT838  
           MOVE SPACES                   TO  B1-TABLE-AREA.             CAT838  
           MOVE 0                        TO  B1-TBL-CNT.                CAT838  
                                                                        CAT838  
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500        CAT838  
                                                                        CAT838  
             MOVE  ' '                   TO  BH-BROKER-HEADER-INFO      CAT838  
                                             BH-ACAT-INFO               CAT838  
             MOVE  B1-SUB                TO  BH-BROKER-NUMBER-N         CAT838  
             MOVE  '015'                 TO  BH-LOGICAL-RECORD-CODE     CAT838  
             MOVE  '434500'              TO  BH-B2-INFO-ID              CAT838  
             CALL  GETB1V              USING BH-BROKER-HEADER-INFO      CAT838  
                                             BH-ACAT-INFO               CAT838  
                                                                        CAT838  
      **<<   B1=434682 -  BH-ACAT-OFAC-REPORT >>                        CAT838  
             IF  BH-BROKER-ACTIVE                                       CAT838  
                 IF  BH-ACAT-ACTIVE                                     CAT838  
                     MOVE BH-BROKER-MINI-MAXI-INDICATOR TO B1-STREAM    CAT838  
                     IF  (B1-STREAM =  PARM-STREAM)                     CAT838  
                     AND (BH-ACAT-OFAC-REPORT = '1')                    CAT838  
                        ADD 1 TO B1-TBL-CNT                             CAT838  
                        MOVE  BH-BROKER-NUMBER-N                        CAT838  
                                         TO B1-ADP-CL-NO  (B1-TBL-CNT)  CAT838  
                        MOVE  BH-BROKER-NAME                            CAT838  
                                         TO B1-CLI-NAME   (B1-TBL-CNT)  CAT838  
                        MOVE  BH-BROKER-OLD-CLEARING-HOUSE (2:4)        CAT838  
                                         TO B1-BKR-CLR-NO (B1-TBL-CNT)  CAT838  
                        MOVE  BH-BROKER-STATUS                          CAT838  
                                         TO B1-STATUS     (B1-TBL-CNT)  CAT838  
                        MOVE  BH-ACAT-STATUS                            CAT838  
                                         TO B1-ACAT-STATUS(B1-TBL-CNT)  CAT838  
                        DISPLAY    '  STREAM=' B1-STREAM                CAT838  
                                   '  CLT=' B1-ADP-CL-NO  (B1-TBL-CNT)  CAT838  
                                        ' ' B1-CLI-NAME   (B1-TBL-CNT)  CAT838  
                                   ' STAT=' B1-STATUS     (B1-TBL-CNT)  CAT838  
                                   ' ACAT=' B1-ACAT-STATUS(B1-TBL-CNT)  CAT838  
                                   '  BKR=' B1-BKR-CLR-NO (B1-TBL-CNT)  CAT838  
                     END-IF                                             CAT838  
                 END-IF                                                 CAT838  
             END-IF                                                     CAT838  
                                                                        CAT838  
           END-PERFORM.                                                 CAT838  
                                                                        CAT838  
           DISPLAY ' '.                                                 CAT838  
           DISPLAY  'CAT838: OFAC REPORT REQUESTING CLT COUNT = '       CAT838  
                                                      B1-TBL-CNT.       CAT838  
           DISPLAY ' '.                                                 CAT838  
           MOVE PGM-NAME                TO GETNA-PGM-NAME.              CAT838  
           SET GETNA-REQ-FUNC-OPEN      TO TRUE.                        CAT838  
           SET GETNA-REQ-FILE-EITHER    TO TRUE.                        CAT838  
           SET GETNA-REQ-FUNC2-DISK-RAN TO TRUE.                        CAT838  
           SET GETNA-REQ-YEAREND-NO     TO TRUE.                        CAT838  
           MOVE '00'                    TO GETNA-KEY-BRANCH1-2.         CAT838  
           MOVE '00000'                 TO GETNA-KEY-ACCOUNT1-5.        CAT838  
           CALL  GETNA USING GETNA-PARAMETERS GETNA-SEGMENT-INCLUDES.   CAT838  
           SET GETNA-REQ-FUNC-READ-KEY TO TRUE.                         CAT838  
       EJECT                                                            CAT838  
      *                                                                 CAT838  
       2000-MAIN-RTN.                                                   CAT838  
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > B1-TBL-CNT CAT838  
              MOVE SPACE TO WS-TRNFR-NOT-FOUND-SW                       CAT838  
              MOVE B1-ADP-CL-NO (B1-SUB) TO WS-CLIENT-NBR               CAT838  
              PERFORM 5100-OPEN-TRNFR-CURSOR                            CAT838  
              PERFORM 5200-FETCH-TRNFR-CURSOR                           CAT838  
              PERFORM 2100-PROCESS-OFAC     UNTIL WS-TRNFR-NOT-FOUND    CAT838  
              PERFORM 5300-CLOSE-TRNFR-CURSOR                           CAT838  
           END-PERFORM.                                                 CAT838  
                                                                        CAT838  
       2100-PROCESS-OFAC.                                               CAT838  
           MOVE  BRANCH-CD  OF DCLVTRNFR    TO WS-BRANCH.               CAT838  
           MOVE  ACCT-CD    OF DCLVTRNFR    TO WS-ACCT.                 CAT838  
                                                                        CAT838  
           INITIALIZE  GETNA-PARAMETERS.                                CAT838  
           MOVE  'R'                        TO  GETNA-REQ-FUNC.         CAT838  
           MOVE  'R'                        TO  GETNA-REQ-FILE.         CAT838  
           MOVE  'R'                        TO  GETNA-REQ-FUNC2.        CAT838  
           MOVE  'N'                        TO  GETNA-REQ-YEAREND.      CAT838  
           MOVE  PGM-NAME                   TO  GETNA-PGM-NAME.         CAT838  
           MOVE  WS-CLIENT-NBR (2:3)        TO  GETNA-KEY-CLIENT.       CAT838  
           MOVE  '00'                       TO  GETNA-KEY-BRANCH1-2.    CAT838  
           MOVE  WS-BRANCH                  TO  GETNA-KEY-BRANCH3-5.    CAT838  
           MOVE  '00000'                    TO  GETNA-KEY-ACCOUNT1-5.   CAT838  
           MOVE  WS-ACCT                    TO  GETNA-KEY-ACCOUNT6-10.  CAT838  
           CALL   GETNA                   USING GETNA-PARAMETERS        CAT838  
                                                GETNA-SEGMENT-INCLUDES  CAT838  
           END-CALL.                                                    CAT838  
                                                                        CAT838  
           MOVE SPACES   TO WS-NAME-ADDRESS.                            CAT838  
           IF NAPPB-SEGMENT-LENGTH GREATER ZERO                         CAT838  
              IF NAPPB-NA-LINE-COUNT GREATER '5'                        CAT838  
                 MOVE NAPPB-NA-LINE1-30(1) TO WS-NAME-ADDR1             CAT838  
                 MOVE NAPPB-NA-LINE1-30(2) TO WS-NAME-ADDR2             CAT838  
                 MOVE NAPPB-NA-LINE1-30(3) TO WS-NAME-ADDR3             CAT838  
                 MOVE NAPPB-NA-LINE1-30(4) TO WS-NAME-ADDR4             CAT838  
                 MOVE NAPPB-NA-LINE1-30(5) TO WS-NAME-ADDR5             CAT838  
                 MOVE NAPPB-NA-LINE1-30(6) TO WS-NAME-ADDR6             CAT838  
              ELSE                                                      CAT838  
              IF NAPPB-NA-LINE-COUNT GREATER '4'                        CAT838  
                 MOVE NAPPB-NA-LINE1-30(1) TO WS-NAME-ADDR1             CAT838  
                 MOVE NAPPB-NA-LINE1-30(2) TO WS-NAME-ADDR2             CAT838  
                 MOVE NAPPB-NA-LINE1-30(3) TO WS-NAME-ADDR3             CAT838  
                 MOVE NAPPB-NA-LINE1-30(4) TO WS-NAME-ADDR4             CAT838  
                 MOVE NAPPB-NA-LINE1-30(5) TO WS-NAME-ADDR5             CAT838  
              ELSE                                                      CAT838  
              IF NAPPB-NA-LINE-COUNT GREATER '3'                        CAT838  
                 MOVE NAPPB-NA-LINE1-30(1) TO WS-NAME-ADDR1             CAT838  
                 MOVE NAPPB-NA-LINE1-30(2) TO WS-NAME-ADDR2             CAT838  
                 MOVE NAPPB-NA-LINE1-30(3) TO WS-NAME-ADDR3             CAT838  
                 MOVE NAPPB-NA-LINE1-30(4) TO WS-NAME-ADDR4             CAT838  
              ELSE                                                      CAT838  
              IF NAPPB-NA-LINE-COUNT GREATER '2'                        CAT838  
                 MOVE NAPPB-NA-LINE1-30(1) TO WS-NAME-ADDR1             CAT838  
                 MOVE NAPPB-NA-LINE1-30(2) TO WS-NAME-ADDR2             CAT838  
                 MOVE NAPPB-NA-LINE1-30(3) TO WS-NAME-ADDR3             CAT838  
              ELSE                                                      CAT838  
              IF NAPPB-NA-LINE-COUNT GREATER '1'                        CAT838  
                 MOVE NAPPB-NA-LINE1-30(1) TO WS-NAME-ADDR1             CAT838  
                 MOVE NAPPB-NA-LINE1-30(2) TO WS-NAME-ADDR2             CAT838  
              ELSE                                                      CAT838  
              IF NAPPB-NA-LINE-COUNT GREATER '0'                        CAT838  
                 MOVE NAPPB-NA-LINE1-30(1) TO WS-NAME-ADDR1.            CAT838  
                                                                        CAT838  
      **<< NNARPE-OFAC-STATUS = 'A' ==> MEANS EXACT MATCH >>            CAT838  
      **<< NNARPE-OFAC-STATUS = 'B' ==> MEANS FUZZY MATCH >>            CAT838  
      *                                                                 CAT838  
           MOVE SPACE TO WS-OFAC-MATCH-IND.                             CAT838  
           IF NNARPE-SEGMENT-LENGTH GREATER ZERO                        CAT838  
              IF (NNARPE-OFAC-STATUS = 'A' OR 'B')                      CAT838  
                 PERFORM  2200-SEARCH-OFAC-NAME THRU 2200-EX            CAT838  
                 IF WS-NO-MATCH                                         CAT838  
                    MOVE 'B'  TO WS-OFAC-MATCH-IND                              
                    ADD   1   TO WS-FUZZY-CNT  WS-OFAC-CNT                      
                 END-IF                                                 CAT838  
                 PERFORM  4000-WRITE-OFAC-NAME-RTN                      CAT838  
              END-IF                                                    CAT838  
           END-IF.                                                      CAT838  
                                                                        CAT838  
           PERFORM 5200-FETCH-TRNFR-CURSOR.                             CAT838  
       EJECT                                                            CAT838  
      *                                                                 CAT838  
       2200-SEARCH-OFAC-NAME.                                           CAT838  
           MOVE SPACE TO WS-NO-MATCH-IND.                               CAT838  
LRM002     MOVE  WS-CLIENT-NBR              TO  CA-I-CLIENT4.           CAT838  
                                                                        CAT838  
           IF  (NAPPA-SS-HOLDER-N IS NUMERIC)                           CAT838  
           AND (NAPPA-SS-HOLDER-N > ZERO)                               CAT838  
                 MOVE  NAPPA-SS-HOLDER-N  TO SUB                        CAT838  
           ELSE                                                         CAT838  
                 MOVE  1                  TO SUB                        CAT838  
           END-IF.                                                      CAT838  
                                                                        CAT838  
           IF NAPPB-NA-LINE1-30 (SUB) = SPACE                           CAT838  
              SET WS-NO-MATCH TO TRUE                                   CAT838  
              GO  TO  2200-EX                                           CAT838  
           ELSE                                                         CAT838  
              MOVE NAPPB-NA-LINE1-30(SUB) TO CA-I-NAME                  CAT838  
           END-IF.                                                      CAT838  
                                                                        CAT838  
           MOVE  PGM-NAME   TO CA-I-CALLER-PGM-ID.                      CAT838  
           CALL  FACU1B  USING  COMMAREA-FACU1.                         CAT838  
                                                                        CAT838  
           IF CA-S-RC-SUCCESSFUL                                        CAT838  
              IF CA-RM-NO-MATCHES                                       CAT838  
                  SET WS-NO-MATCH TO TRUE                               CAT838  
              ELSE                                                      CAT838  
                  IF CA-MT-IS-EXACT (1)                                 CAT838  
                      MOVE 'A'  TO WS-OFAC-MATCH-IND                    CAT838  
                      ADD   1   TO WS-EXACT-CNT  WS-OFAC-CNT            CAT838  
                  ELSE                                                  CAT838  
                      MOVE 'B'  TO WS-OFAC-MATCH-IND                    CAT838  
                      ADD   1   TO WS-FUZZY-CNT  WS-OFAC-CNT            CAT838  
                  END-IF                                                CAT838  
              END-IF                                                    CAT838  
           ELSE                                                         CAT838  
           IF CA-S-RETURN-CODE = '3'                                    CAT838  
              SET WS-NO-MATCH TO TRUE                                   CAT838  
           ELSE                                                         CAT838  
              DISPLAY '** CAT838 ABENDED CALLING FACU1B I/O MODULE'     CAT838  
              DISPLAY '   FACU1B RETURN CODE = ' CA-S-RETURN-CODE       CAT838  
              MOVE  +2100     TO ABEND-CODE                             CAT838  
              CALL  ABEND     USING ABEND-CODE                          CAT838  
           END-IF.                                                      CAT838  
                                                                        CAT838  
       2200-EX.               EXIT.                                     CAT838  
       EJECT                                                            CAT838  
      *                                                                 CAT838  
       4000-WRITE-OFAC-NAME-RTN.                                        CAT838  
           MOVE SPACE  TO  O-OFAC-DETAIL-REC                            CAT838  
           MOVE WS-CLIENT-NBR                 TO O-OFAC-CLIENT-NUM      CAT838  
           MOVE WS-OFAC-MATCH-IND             TO O-OFAC-MATCH-IND       CAT838  
           MOVE WS-BRANCH                     TO O-OFAC-BRANCH          CAT838  
           MOVE WS-ACCT                       TO O-OFAC-ACCOUNT         CAT838  
           MOVE ACAT-CONTROL-NBR OF DCLVTRNFR TO O-OFAC-ACAT-CNTL       CAT838  
           MOVE RR-CD            OF DCLVTRNFR TO O-OFAC-RR              CAT838  
           MOVE DSTBN-SIDE-CD    OF DCLVTRNFR TO O-OFAC-DEL-RCV-IND     CAT838  
           MOVE RCV-CUST-NM      OF DCLVTRNFR TO O-OFAC-ACAT-NAME       CAT838  
           MOVE WS-ADDRESS                    TO O-OFAC-ACAT-ADDR       CAT838  
           IF WS-NO-MATCH                                               CAT838  
              MOVE SPACES                     TO O-OFAC-OFAC-NBR        CAT838  
              MOVE SPACES                     TO O-OFAC-OFAC-NAME       CAT838  
           ELSE                                                                 
              MOVE CA-MT-ENTITY-NBR (1)       TO O-OFAC-OFAC-NBR        CAT838  
              MOVE CA-E-NAME                  TO O-OFAC-OFAC-NAME       CAT838  
           END-IF.                                                              
           MOVE TRNFR-TYPE-CD    OF DCLVTRNFR TO O-OFAC-ACAT-TRNF-TYP   CAT838  
           WRITE O-OFAC-RECORD.                                         CAT838  
           ADD 1 TO WS-WRITE-CNT.                                       CAT838  
      *                                                                 CAT838  
       5100-OPEN-TRNFR-CURSOR.                                          CAT838  
           EXEC SQL                                                     CAT838  
              OPEN TRNFR_CSR                                            CAT838  
           END-EXEC.                                                    CAT838  
           IF SQLCODE = 0                                               CAT838  
              CONTINUE                                                  CAT838  
           ELSE                                                         CAT838  
              PERFORM  9000-SQL-ERROR                                   CAT838  
              MOVE 'DB2 CURSOR STATEMENT OPEN ERROR' TO W-ERR-MSG-OUT   CAT838  
              MOVE SQLCODE TO W-SQLCODE-OUT                             CAT838  
              DISPLAY ' '                                               CAT838  
              DISPLAY W-DB2-ERR-MSG-OUT                                 CAT838  
              DISPLAY '** CAT838 ABENDED WITH DB2 OPEN CURSOR '         CAT838  
                      'STATEMENT ERROR'                                 CAT838  
              MOVE  +3100     TO ABEND-CODE                             CAT838  
              CALL  ABEND     USING ABEND-CODE                          CAT838  
           END-IF.                                                      CAT838  
       EJECT                                                            CAT838  
      *                                                                 CAT838  
       5200-FETCH-TRNFR-CURSOR.                                         CAT838  
           EXEC SQL                                                     CAT838  
              FETCH                                                     CAT838  
                 TRNFR_CSR                                              CAT838  
              INTO                                                      CAT838  
                 :CLIENT-NBR                                            CAT838  
                ,:ACAT-CONTROL-NBR                                      CAT838  
                ,:STTS-CD                                               CAT838  
                ,:RCV-NBR                                               CAT838  
                ,:TRNFR-TYPE-CD                                         CAT838  
                ,:RCV-CUST-NM                                           CAT838  
                ,:DSTBN-SIDE-CD                                         CAT838  
                ,:RR-CD                                                 CAT838  
                ,:BRANCH-CD                                             CAT838  
                ,:ACCT-CD                                               CAT838  
           END-EXEC.                                                    CAT838  
                                                                        CAT838  
           IF SQLCODE = 0                                               CAT838  
              ADD 1 TO WS-FETCH-CNT                                     CAT838  
           ELSE                                                         CAT838  
           IF SQLCODE = +100                                            CAT838  
              SET WS-TRNFR-NOT-FOUND TO TRUE                            CAT838  
           ELSE                                                         CAT838  
              PERFORM  9000-SQL-ERROR                                   CAT838  
              MOVE 'DB2 CURSOR STATEMENT FETCH ERROR' TO W-ERR-MSG-OUT  CAT838  
              MOVE SQLCODE TO W-SQLCODE-OUT                             CAT838  
              DISPLAY ' '                                               CAT838  
              DISPLAY W-DB2-ERR-MSG-OUT                                 CAT838  
              DISPLAY '** CAT838 ABENDED WITH DB2 FETCH CURSOR '        CAT838  
                      'STATEMENT ERROR'                                 CAT838  
              MOVE  +3200     TO ABEND-CODE                             CAT838  
              CALL  ABEND     USING ABEND-CODE                          CAT838  
           END-IF.                                                      CAT838  
       EJECT                                                            CAT838  
                                                                        CAT838  
       5300-CLOSE-TRNFR-CURSOR.                                         CAT838  
           EXEC SQL                                                     CAT838  
              CLOSE TRNFR_CSR                                           CAT838  
           END-EXEC.                                                    CAT838  
           IF SQLCODE = 0                                               CAT838  
              CONTINUE                                                  CAT838  
           ELSE                                                         CAT838  
              PERFORM  9000-SQL-ERROR                                   CAT838  
              MOVE 'DB2 CURSOR STATEMENT CLOSE ERROR' TO W-ERR-MSG-OUT  CAT838  
              MOVE SQLCODE TO W-SQLCODE-OUT                             CAT838  
              DISPLAY ' '                                               CAT838  
              DISPLAY W-DB2-ERR-MSG-OUT                                 CAT838  
              DISPLAY '** CAT838 ABENDED WITH DB2 CLOSE CURSOR '        CAT838  
                      'STATEMENT ERROR'                                 CAT838  
              MOVE  +3300     TO ABEND-CODE                             CAT838  
              CALL  ABEND     USING ABEND-CODE                          CAT838  
           END-IF.                                                      CAT838  
       EJECT                                                            CAT838  
      *                                                                 CAT838  
       9000-SQL-ERROR.                                                  CAT838  
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                  CAT838  
                                    W-DB2-MESSAGE-LEN.                  CAT838  
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                        CAT838  
             UNTIL W-DB2-IDX GREATER THAN 12                            CAT838  
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES              CAT838  
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)               CAT838  
                   END-IF                                               CAT838  
           END-PERFORM.                                                 CAT838  
