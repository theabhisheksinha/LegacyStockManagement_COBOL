000001* PDX    - CAT916   C0149989 02/08/01 14:50:24 TBTIKUO            00001000
000001* PDX    - CAT916   C0122581 03/04/99 09:40:44 TBEDTAK            00001000
       IDENTIFICATION DIVISION.                                         CAT916  
       PROGRAM-ID. CAT916.                                              CAT916  
      *                                                                 CAT916  
       DATE-WRITTEN. SEPTEMBER 1998.                                    CAT916  
      *---------------------------------------------------------------* CAT916  
      *REMARKS.                                                       * CAT916  
      *                                                               * CAT916  
      *  CAT916   - THE PROGRAM CONVERTS AN OLD ACAT TRANSFER HISTORY * CAT916  
      *             FILE (CAT20.ACATPSD) INTO DB2 TRANSFER HISTORY    * CAT916  
      *             TABLE (VTRNHSTY).                                 * CAT916  
      *---------------------------------------------------------------* CAT916  
           EJECT                                                        CAT916  
       ENVIRONMENT DIVISION.                                            CAT916  
       INPUT-OUTPUT SECTION.                                            CAT916  
                                                                        CAT916  
       FILE-CONTROL.                                                    CAT916  
           SELECT ACAT-PSDR-FILE   ASSIGN TO UT-S-PSDR.                 CAT916  
                                                                        CAT916  
       DATA DIVISION.                                                   CAT916  
       FILE SECTION.                                                    CAT916  
                                                                        CAT916  
       FD  ACAT-PSDR-FILE                                               CAT916  
           RECORDING MODE F                                             CAT916  
           BLOCK CONTAINS 0 RECORDS                                     CAT916  
           LABEL RECORDS ARE STANDARD                                   CAT916  
           RECORD CONTAINS 62 CHARACTERS.                               CAT916  
       01  CAT-PSDR-RECORD             PIC X(62).                       CAT916  
                                                                        CAT916  
       WORKING-STORAGE SECTION.                                         CAT916  
                                                                        CAT916  
       01  WORK-AREA.                                                   CAT916  
           03  WS-NA-KEY.                                               CAT916  
               05  WS-NA-KEY-CLIENT      PIC X(03).                     CAT916  
               05  FILLER                PIC X(02) VALUE '00'.          CAT916  
               05  WS-NA-KEY-BRANCH3-5   PIC X(03).                     CAT916  
               05  FILLER                PIC X(05) VALUE '00000'.       CAT916  
               05  WS-NA-KEY-ACCOUNT6-10 PIC X(05).                     CAT916  
           03  WS-NA-DATA.                                              CAT916  
               05  WS-NAME.                                             CAT916  
                   07  WS-NAME-1         PIC X(30).                     CAT916  
                   07  WS-NAME-2         PIC X(30).                     CAT916  
               05  WS-RR                 PIC X(03).                     CAT916  
               05  WS-SS-NBR1            PIC X(09).                     CAT916  
               05  WS-SS-NBR2            PIC X(09).                     CAT916  
           03  WS-CLIENT-NBR.                                           CAT916  
               05  FILLER                PIC X(01) VALUE '0'.           CAT916  
               05  WS-CLT-NBR            PIC X(03).                     CAT916  
               05  WS-CLT-NBR-N    REDEFINES WS-CLT-NBR                 CAT916  
                                         PIC 9(03).                     CAT916  
           03  WS-CAT-CONTROL-NO.                                       CAT916  
               05  WS-CAT-DDD            PIC X(03).                     CAT916  
               05  WS-CAT-SEQ            PIC X(05).                     CAT916  
           03  WS-ACAT-CONTROL-NBR.                                     CAT916  
               05  WS-ACAT-CCYY.                                        CAT916  
                   07  WS-ACAT-CC        PIC X(02).                     CAT916  
                   07  WS-ACAT-YY        PIC X(02).                     CAT916  
               05  WS-ACAT-DDD           PIC X(03).                     CAT916  
               05  WS-ACAT-SEQ-NBR.                                     CAT916  
                   07  FILLER            PIC X(02) VALUE '00'.          CAT916  
                   07  WS-ACAT-SEQ       PIC X(05).                     CAT916  
       01  WORK-DATE-TIME-AREA.                                         CAT916  
           03  WS-SYS-DATE.                                             CAT916  
               05  WS-SYS-YY             PIC X(02).                     CAT916  
               05  WS-SYS-MM             PIC X(02).                     CAT916  
               05  WS-SYS-DD             PIC X(02).                     CAT916  
           03  WS-SYST-TIME.                                            CAT916  
               05  WS-SYST-HH            PIC X(02).                     CAT916  
               05  WS-SYST-MM            PIC X(02).                     CAT916  
               05  WS-SYST-SS            PIC X(02).                     CAT916  
               05  FILLER                PIC X(02).                     CAT916  
           03  WS-SYST-TIME-N REDEFINES WS-SYST-TIME                    CAT916  
                                         PIC 9(08).                     CAT916  
           03  WS-TIME-STAMP.                                           CAT916  
               05  WS-DT-STAMP-CC        PIC X(02).                     CAT916  
               05  WS-DT-STAMP-YY        PIC X(02).                     CAT916  
               05  FILLER                PIC X(01) VALUE '-'.           CAT916  
               05  WS-DT-STAMP-MM        PIC X(02).                     CAT916  
               05  FILLER                PIC X(01) VALUE '-'.           CAT916  
               05  WS-DT-STAMP-DD        PIC X(02).                     CAT916  
               05  FILLER                PIC X(01) VALUE '-'.           CAT916  
               05  WS-TM-STAMP-HH        PIC X(02).                     CAT916  
               05  FILLER                PIC X(01) VALUE '.'.           CAT916  
               05  WS-TM-STAMP-MM        PIC X(02).                     CAT916  
               05  FILLER                PIC X(01) VALUE '.'.           CAT916  
               05  WS-TM-STAMP-SS        PIC X(02).                     CAT916  
               05  FILLER                PIC X(07) VALUE '.000000'.     CAT916  
           03  WS-STTLM-DT.                                             CAT916  
               05  WS-STTLM-CCYY.                                       CAT916  
                   07  WS-STTLM-CC       PIC X(02).                     CAT916  
                   07  WS-STTLM-YY       PIC X(02).                     CAT916  
               05  WS-STTLM-CCYY-N  REDEFINES WS-STTLM-CCYY.            CAT916  
                   07  WS-STTLM-CC-N     PIC 9(02).                     CAT916  
                   07  WS-STTLM-YY-N     PIC 9(02).                     CAT916  
               05  WS-STTLM-MM           PIC X(02).                     CAT916  
               05  WS-STTLM-DD           PIC X(02).                     CAT916  
           03  WS-SETTLE-DATE.                                          CAT916  
               05  WS-SETTLE-CCYY        PIC X(04).                     CAT916  
               05  FILLER                PIC X(01) VALUE '-'.           CAT916  
               05  WS-SETTLE-MM          PIC X(02).                     CAT916  
               05  FILLER                PIC X(01) VALUE '-'.           CAT916  
               05  WS-SETTLE-DD          PIC X(02).                     CAT916  
           03  WS-PROC-DATE.                                            CAT916  
               05 WS-PROC-DATE-CCYY      PIC X(004).                    CAT916  
               05  FILLER                PIC X(01) VALUE '-'.           CAT916  
               05 WS-PROC-DATE-MM        PIC X(002).                    CAT916  
               05  FILLER                PIC X(01) VALUE '-'.           CAT916  
               05 WS-PROC-DATE-DD        PIC X(002).                    CAT916  
       01  WS-COUNTERS.                                                 CAT916  
           03  WS-ACAT-READ-CNT          PIC 9(7) VALUE 0.              CAT916  
           03  WS-ACAT-WRITE-CNT         PIC 9(7) VALUE 0.              CAT916  
           03  WS-SPACE-CNT              PIC 9(7) VALUE 0.              CAT916  
           03  WS-ROW-COUNT              PIC S9(9) COMP.                CAT916  
           03  W-GETNA-FND-CNT           PIC 9(7) VALUE 0.              CAT916  
           03  W-GETNA-NOTFND-CNT        PIC 9(7) VALUE 0.              CAT916  
       01  SWITCHES.                                                    CAT916  
           03  WS-EOF-SW                 PIC X(01) VALUE SPACE.         CAT916  
               88  WS-EOF                          VALUE 'Y'.           CAT916  
           03  WS-FOUND-HISTORY-TFR-SW   PIC X(01) VALUE SPACE.         CAT916  
               88  WS-FOUND-HISTORY-TFR            VALUE 'Y'.           CAT916  
       01  WS-SQL-ERR-MSG-OUT.                                          CAT916  
           03  WS-INSERT-ERR-OUT.                                       CAT916  
               05  FILLER                PIC X(32) VALUE                CAT916  
                  '** DB2 INSERT ERROR - SQLCODE = '.                   CAT916  
               05  WS-SQLCODE-OUT        PIC -999.                      CAT916  
           03  WS-ERR-ACCT-OUT.                                         CAT916  
               05  FILLER                PIC X(09) VALUE                CAT916  
                  '** CLT = '.                                          CAT916  
               05  WS-CLT-OUT            PIC 999.                       CAT916  
               05  FILLER                PIC X(09) VALUE                CAT916  
                  '  ACCT = '.                                          CAT916  
               05  WS-ACCT-OUT           PIC X(08).                     CAT916  
           03  WS-ERR-ACAT-OUT.                                         CAT916  
               05  FILLER                PIC X(21) VALUE                CAT916  
                  '** ACAT CONTROL NO = '.                              CAT916  
               05  WS-CONTROL-OUT        PIC X(08).                     CAT916  
       01  ABEND-PARAMETERS.                                            CAT916  
TCK001*    03  ABEND-CODE    PIC S9(8) COMP VALUE +1100.                CAT916  
TCK001     03  ABEND-CODE    PIC S9(4) COMP VALUE +1100.                CAT916  
           03  ABEND-DUMPSW  PIC X          VALUE 'D'.                  CAT916  
       EJECT                                                            CAT916  
       01  WS-ACAT-DELIVER-REC.                                         CAT916  
           COPY ACATPSDR.                                               CAT916  
       EJECT                                                            CAT916  
           COPY GETNACOB.                                               CAT916  
       EJECT                                                            CAT916  
       01  GETNA-SEGMENT-INCLUDES.                                      CAT916  
           COPY NASEGPPA.                                               CAT916  
       EJECT                                                            CAT916  
           COPY NASEGPPB.                                               CAT916  
       EJECT                                                            CAT916  
           COPY NASEGPPL.                                               CAT916  
       EJECT                                                            CAT916  
           COPY NASEGEND.                                               CAT916  
       EJECT                                                            CAT916  
           COPY BPDATESC.                                               CAT916  
       EJECT                                                            CAT916  
TCK001     COPY STUBCPY.                                                        
       EJECT                                                            CAT916  
           EXEC SQL                                                     CAT916  
              INCLUDE VTRNHSTY                                          CAT916  
           END-EXEC.                                                    CAT916  
       EJECT                                                            CAT916  
           EXEC SQL                                                     CAT916  
              INCLUDE SQLCA                                             CAT916  
           END-EXEC.                                                    CAT916  
      /                                                                 CAT916  
       01  FILLER                        PIC X(08) VALUE 'DB2AREA '.    CAT916  
       01  DB2-ABEND-WORK-AREA.                                         CAT916  
           03  DB2-ABEND-CODE                PIC S9(04) COMP.           CAT916  
           03  DSNTIAR                       PIC X(08)  VALUE 'DSNTIAR'.CAT916  
           03  WS-DB2-MESSAGE-AREA.                                     CAT916  
               05  WS-DB2-MSG-LEN            PIC S9(04) COMP VALUE +960.CAT916  
               05  WS-ERROR-MSG              PIC X(80)  OCCURS 12 TIMES CAT916  
                   INDEXED BY WS-ERROR-INDEX.                           CAT916  
           03  WS-ERR-LINE-LEN               PIC S9(09) COMP VALUE +80. CAT916  
           03  W-DB2-TABLE-NAME          PIC  X(008).                   CAT916  
           03  W-DB2-ACTION              PIC  X(008).                   CAT916  
           03  W-DB2-SQLCODE             PIC  ---9.                     CAT916  
                                                                        CAT916  
       01  FILLER                        PIC  X(008) VALUE 'TIMESTMP'.  CAT916  
       01  W-CURRENT-TIMESTAMP           PIC  X(026).                   CAT916  
       01  FILLER                        PIC X(08) VALUE 'END-O-WS'.    CAT916  
      ***************************************************************** CAT916  
       LINKAGE SECTION.                                                 CAT916  
      ***************************************************************** CAT916  
       01  PARM-AREA.                                                   CAT916  
           05  PARM-LENGTH                  PIC S9(4) COMP.             CAT916  
           05  PARM-INFO.                                               CAT916  
               10  PARM-STREAM              PIC X.                      CAT916  
                   88  PARM-STREAM-VALID                VALUES ARE      CAT916  
                       'A' THRU 'Z' '0' THRU '9'.                       CAT916  
               10  PARM-CLIENT              PIC XXX.                    CAT916  
       EJECT                                                            CAT916  
      ***************************************************************** CAT916  
       PROCEDURE DIVISION USING PARM-AREA.                              CAT916  
      ***************************************************************** CAT916  
           DISPLAY 'CAT916 - CONVERT CAT20.ACATPSD TO DB2 HISTORY'      CAT916  
           DISPLAY ' '.                                                 CAT916  
           COPY MSGCOBO.                                                CAT916  
           DISPLAY 'USING PARM=' PARM-INFO.                             CAT916  
           IF PARM-LENGTH = 0                                           CAT916  
              DISPLAY 'CAT916 - PARM REQUIRED'                          CAT916  
              MOVE +1001 TO ABEND-CODE                                  CAT916  
              GO TO CALL-ABEND                                          CAT916  
           ELSE                                                         CAT916  
           IF PARM-LENGTH > 1 AND < 4                                   CAT916  
              DISPLAY 'CAT916 - PARM CLIENT MUST BE 3 BYTE LONG'        CAT916  
              MOVE +1002 TO ABEND-CODE                                  CAT916  
              GO TO CALL-ABEND                                          CAT916  
           ELSE                                                         CAT916  
           IF PARM-CLIENT NOT NUMERIC                                   CAT916  
              IF PARM-CLIENT = 'ALL'                                    CAT916  
                 CONTINUE                                               CAT916  
              ELSE                                                      CAT916  
                 DISPLAY 'CAT916 - PARM CLIENT MUST BE NUMERIC'         CAT916  
                 MOVE +1003 TO ABEND-CODE                               CAT916  
                 GO TO CALL-ABEND.                                      CAT916  
                                                                        CAT916  
           EXEC SQL                                                     CAT916  
               SET :W-CURRENT-TIMESTAMP = CURRENT TIMESTAMP             CAT916  
           END-EXEC                                                     CAT916  
                                                                        CAT916  
           IF  SQLCODE = +0                                             CAT916  
               DISPLAY ' '                                              CAT916  
               DISPLAY 'CAT916: W-CURRENT-TIMESTAMP = '                 CAT916  
                                                    W-CURRENT-TIMESTAMP CAT916  
               DISPLAY ' '                                              CAT916  
           ELSE                                                         CAT916  
               DISPLAY 'CAT916: W-CURRENT-TIMESTAMP NOT SET'            CAT916  
               PERFORM 8500-SQL-ERROR-ROUTINE                           CAT916  
           END-IF.                                                      CAT916  
                                                                        CAT916  
           MOVE 'CAT916'                  TO BPDATES-CALLING-PGM.       CAT916  
           SET  LNKDATZ-REQUEST           TO TRUE.                      CAT916  
TCK001     CALL  BPDATES  USING BPDATES-PARAMETERS.                     CAT916  
           MOVE BPD-PROC-DATE(1:4)        TO WS-PROC-DATE-CCYY.         CAT916  
           MOVE BPD-PROC-DATE(5:2)        TO WS-PROC-DATE-MM.           CAT916  
           MOVE BPD-PROC-DATE(7:2)        TO WS-PROC-DATE-DD.           CAT916  
                                                                        CAT916  
                                                                        CAT916  
           ACCEPT WS-SYS-DATE    FROM DATE.                             CAT916  
           ACCEPT WS-SYST-TIME-N FROM TIME.                             CAT916  
           IF  WS-SYS-YY = '98' OR '99'                                 CAT916  
               MOVE '19' TO WS-DT-STAMP-CC                              CAT916  
           ELSE                                                         CAT916  
               MOVE '20' TO WS-DT-STAMP-CC.                             CAT916  
           MOVE WS-SYS-YY   TO WS-DT-STAMP-YY.                          CAT916  
           MOVE WS-SYS-MM   TO WS-DT-STAMP-MM.                          CAT916  
           MOVE WS-SYS-DD   TO WS-DT-STAMP-DD.                          CAT916  
           MOVE WS-SYST-HH  TO WS-TM-STAMP-HH.                          CAT916  
           MOVE WS-SYST-MM  TO WS-TM-STAMP-MM.                          CAT916  
           MOVE WS-SYST-SS  TO WS-TM-STAMP-SS.                          CAT916  
                                                                        CAT916  
           MOVE 'CAT916'                TO GETNA-PGM-NAME.              CAT916  
           SET GETNA-REQ-FUNC-OPEN      TO TRUE.                        CAT916  
           SET GETNA-REQ-FILE-EITHER    TO TRUE.                        CAT916  
           SET GETNA-REQ-FUNC2-DISK-RAN TO TRUE.                        CAT916  
           SET GETNA-REQ-YEAREND-NO     TO TRUE.                        CAT916  
           MOVE '00'                    TO GETNA-KEY-BRANCH1-2.         CAT916  
           MOVE '00000'                 TO GETNA-KEY-ACCOUNT1-5.        CAT916  
TCK001     CALL  GETNA  USING GETNA-PARAMETERS GETNA-SEGMENT-INCLUDES.  CAT916  
           SET GETNA-REQ-FUNC-READ-KEY TO TRUE.                         CAT916  
                                                                        CAT916  
           OPEN INPUT   ACAT-PSDR-FILE.                                 CAT916  
           PERFORM PROCESS-RTN UNTIL WS-EOF.                            CAT916  
           PERFORM END-RTN.                                             CAT916  
           GOBACK.                                                      CAT916  
       EJECT                                                            CAT916  
                                                                        CAT916  
       PROCESS-RTN.                                                     CAT916  
           PERFORM READ-ACAT-FILE.                                      CAT916  
           IF WS-EOF                                                    CAT916  
              CONTINUE                                                  CAT916  
           ELSE                                                         CAT916  
              ADD +1 TO WS-ACAT-READ-CNT                                CAT916  
              IF ACAT-SD-KEY = LOW-VALUE                                CAT916  
                 CONTINUE                                               CAT916  
              ELSE                                                      CAT916  
                 PERFORM CONVERSION-RTN THRU CONVERSION-EXIT.           CAT916  
      *                                                                 CAT916  
       READ-ACAT-FILE.                                                  CAT916  
           READ ACAT-PSDR-FILE INTO WS-ACAT-DELIVER-REC                 CAT916  
              AT END  SET WS-EOF TO TRUE.                               CAT916  
       EJECT                                                            CAT916  
                                                                        CAT916  
       CONVERSION-RTN.                                                  CAT916  
           MOVE ADP-CLIENT-NO TO WS-CLT-NBR-N.                          CAT916  
           IF PARM-CLIENT > SPACE                                       CAT916  
              IF PARM-CLIENT = 'ALL'                                    CAT916  
                 CONTINUE                                               CAT916  
              ELSE                                                      CAT916  
              IF WS-CLT-NBR NOT = PARM-CLIENT                           CAT916  
                 GO TO CONVERSION-EXIT.                                 CAT916  
                                                                        CAT916  
           MOVE 0 TO WS-SPACE-CNT.                                      CAT916  
           INSPECT ACCT-NO TALLYING WS-SPACE-CNT FOR ALL SPACES.        CAT916  
           IF WS-SPACE-CNT > 0                                          CAT916  
              GO TO CONVERSION-EXIT.                                    CAT916  
                                                                        CAT916  
           IF SETTLE-DATE > '199902'                                    CAT916  
              GO TO CONVERSION-EXIT.                                    CAT916  
                                                                        CAT916  
           MOVE WS-CLT-NBR    TO WS-NA-KEY-CLIENT.                      CAT916  
           MOVE BR-NO         TO WS-NA-KEY-BRANCH3-5.                   CAT916  
           MOVE ACCT-NO       TO WS-NA-KEY-ACCOUNT6-10.                 CAT916  
           MOVE WS-NA-KEY     TO GETNA-KEY.                             CAT916  
TCK001     CALL  GETNA  USING GETNA-PARAMETERS                          CAT916  
                              GETNA-SEGMENT-INCLUDES                    CAT916  
           END-CALL.                                                    CAT916  
           MOVE SPACE TO WS-NA-DATA.                                    CAT916  
           IF GETNA-RETURN-FOUND                                        CAT916  
              ADD 1 TO W-GETNA-FND-CNT                                  CAT916  
              MOVE NAPPA-RR1-3           TO WS-RR                       CAT916  
              MOVE NAPPA-SOC-SEC-TAX-ID1 TO WS-SS-NBR1                  CAT916  
              IF NAPPA-SOC-SEC-TAX-ID-N2 NOT = 0                        CAT916  
                 MOVE SPACE                 TO WS-SS-NBR2               CAT916  
              ELSE                                                      CAT916  
                 MOVE NAPPA-SOC-SEC-TAX-ID2 TO WS-SS-NBR2               CAT916  
              END-IF                                                    CAT916  
              IF NAPPB-SEGMENT-MISSING                                  CAT916  
                 MOVE SPACE TO WS-NAME-1 WS-NAME-2                      CAT916  
              ELSE                                                      CAT916  
                 MOVE NAPPB-NA-LINE1-30(1)     TO WS-NAME-1             CAT916  
                 IF NAPPB-NA-LINE-COUNT > 1                             CAT916  
                     MOVE NAPPB-NA-LINE1-30(2) TO WS-NAME-2             CAT916  
           ELSE                                                         CAT916  
              ADD 1 TO W-GETNA-NOTFND-CNT                               CAT916  
           END-IF.                                                      CAT916  
                                                                        CAT916  
           INITIALIZE DCLVTRNHSTY.                                      CAT916  
           MOVE ADP-CLIENT-NO        TO WS-CLT-NBR-N.                   CAT916  
           MOVE WS-CLIENT-NBR        TO CLIENT-NBR.                     CAT916  
           MOVE '1998'               TO WS-ACAT-CCYY.                   CAT916  
           MOVE SETTLE-DATE          TO WS-STTLM-DT.                    CAT916  
           MOVE ACATS-CONTROL-NO     TO WS-CAT-CONTROL-NO.              CAT916  
           IF WS-STTLM-MM = '01'   AND                                  CAT916  
              WS-CAT-DDD > '300'                                        CAT916  
                   CONTINUE                                             CAT916  
           ELSE                                                                 
                     GO TO CONVERSION-EXIT                              CAT916  
           END-IF.                                                              
           IF WS-CAT-DDD   < '100'                                      CAT916  
              MOVE '1999'    TO WS-ACAT-CCYY.                           CAT916  
                                                                        CAT916  
           MOVE WS-CAT-DDD           TO WS-ACAT-DDD.                    CAT916  
           MOVE WS-CAT-SEQ           TO WS-ACAT-SEQ.                    CAT916  
           MOVE WS-ACAT-CONTROL-NBR  TO ACAT-CONTROL-NBR.               CAT916  
                                                                        CAT916  
           PERFORM CHECK-IF-TRANSFER-EXISTS.                            CAT916  
           IF WS-FOUND-HISTORY-TFR                                      CAT916  
              GO TO CONVERSION-EXIT.                                    CAT916  
                                                                        CAT916  
           MOVE SPACE                TO SBMTG-PRTCP-NBR.                CAT916  
           MOVE BROKER-CLEARING-NUM  TO DLVR-NBR.                       CAT916  
           MOVE BR-ACCT-NO           TO ACCT-DLVR-NBR.                  CAT916  
           MOVE CONTRA-BROKER-NUM    TO RCV-NBR.                        CAT916  
           MOVE CONTRA-ACCOUNT       TO ACCT-RCV-NBR.                   CAT916  
           MOVE 'FUL'                TO TRNFR-TYPE-CD.                  CAT916  
           MOVE 'A'                  TO TRANS-TYPE-CD.                  CAT916  
           MOVE WS-NAME              TO RCV-CUST-NM.                    CAT916  
           MOVE WS-SS-NBR1           TO RCV-SS-PRIM-NBR.                CAT916  
           MOVE WS-SS-NBR2           TO RCV-SS-SCNDY-NBR.               CAT916  
           MOVE 'OT'                 TO RCV-ACCT-TYPE-CD                CAT916  
           MOVE SPACE                TO RCV-OCC-BRKR-NBR                CAT916  
           MOVE SPACE                TO RCV-CRSPN-NBR                   CAT916  
           MOVE WS-ACAT-CONTROL-NBR  TO ACAT-CNTL-ASTD-NBR.             CAT916  
           MOVE '2ND TRIAL - CONVERTED FROM CAT20.ACATPSD FILE'         CAT916  
                                     TO CMNT-TXT.                       CAT916  
           MOVE '310'                TO STTS-CD.                        CAT916  
           MOVE 'D'                  TO DSTBN-SIDE-CD.                  CAT916  
           MOVE SPACE                TO SYS-RJCT-RSN-CD.                CAT916  
           MOVE '00'                 TO TRNFR-TYPE-RJC1-CD.             CAT916  
           MOVE '00'                 TO TRNFR-TYPE-RJC2-CD.             CAT916  
           MOVE '00'                 TO TRNFR-TYPE-RJCT-CD.             CAT916  
           MOVE 1                    TO PHSCL-SEQ-NBR.                  CAT916  
           MOVE 1                    TO LGCL-SEQ-NBR.                   CAT916  
           MOVE WS-RR                TO RR-CD.                          CAT916  
           MOVE BR-NO                TO BRANCH-CD.                      CAT916  
           MOVE 1                    TO DAYS-STTS-QTY.                  CAT916  
           MOVE WS-STTLM-CCYY        TO WS-SETTLE-CCYY.                 CAT916  
           MOVE WS-STTLM-MM          TO WS-SETTLE-MM.                   CAT916  
           MOVE WS-STTLM-DD          TO WS-SETTLE-DD.                   CAT916  
           MOVE WS-SETTLE-DATE       TO STTLM-DT.                       CAT916  
           MOVE WS-SETTLE-DATE       TO PRCS-DT.                        CAT916  
           MOVE ACCT-NO              TO ACCT-CD.                        CAT916  
           MOVE WS-SETTLE-DATE       TO STTLM-ASCTD-DT.                 CAT916  
           MOVE SPACE                TO NSCC-PEND-CD.                   CAT916  
           MOVE SPACE                TO NSCC-ACK-IND.                   CAT916  
           MOVE 'CAT916'             TO PRGM-NM.                        CAT916  
           MOVE W-CURRENT-TIMESTAMP  TO CRT-TMSTP.                      CAT916  
           MOVE W-CURRENT-TIMESTAMP  TO UPDT-TMSTP.                     CAT916  
                                                                        CAT916  
           PERFORM CREATE-TRANSFER-HISTORY.                             CAT916  
       CONVERSION-EXIT.                                                 CAT916  
           EXIT.                                                        CAT916  
       EJECT                                                            CAT916  
                                                                        CAT916  
       CHECK-IF-TRANSFER-EXISTS.                                        CAT916  
           MOVE SPACE TO WS-FOUND-HISTORY-TFR-SW.                       CAT916  
           MOVE 0 TO WS-ROW-COUNT.                                      CAT916  
           EXEC SQL                                                     CAT916  
              SELECT  COUNT(*)                                          CAT916  
                INTO  :WS-ROW-COUNT                                     CAT916  
                FROM  VTRNHSTY                                          CAT916  
               WHERE  CLIENT_NBR = :CLIENT-NBR AND                      CAT916  
                      ACAT_CONTROL_NBR = :ACAT-CONTROL-NBR              CAT916  
            END-EXEC.                                                   CAT916  
            IF SQLCODE = 0                                              CAT916  
               IF WS-ROW-COUNT > 0                                      CAT916  
                  SET WS-FOUND-HISTORY-TFR TO TRUE                      CAT916  
               END-IF.                                                  CAT916  
       EJECT                                                            CAT916  
                                                                        CAT916  
       CREATE-TRANSFER-HISTORY.                                         CAT916  
           EXEC SQL                                                     CAT916  
              INSERT INTO VTRNHSTY                                      CAT916  
                  ( CLIENT_NBR                                          CAT916  
                   ,ACAT_CONTROL_NBR                                    CAT916  
                   ,SBMTG_PRTCP_NBR                                     CAT916  
                   ,SBMT_PRT_NR_STS_CD                                  CAT916  
                   ,CONTROL_NBR_STS_CD                                  CAT916  
                   ,DLVR_NBR                                            CAT916  
                   ,DLVR_NBR_STTS_CD                                    CAT916  
                   ,ACCT_DLVR_NBR                                       CAT916  
                   ,ACCT_DLVR_STTS_CD                                   CAT916  
                   ,RCV_NBR                                             CAT916  
                   ,RCV_NBR_STTS_CD                                     CAT916  
                   ,ACCT_RCV_NBR                                        CAT916  
                   ,ACCT_RCV_STTS_CD                                    CAT916  
                   ,TRNFR_TYPE_CD                                       CAT916  
                   ,TRNFR_TYPE_STTS_CD                                  CAT916  
                   ,TRANS_TYPE_CD                                       CAT916  
                   ,TRANS_TYPE_STTS_CD                                  CAT916  
                   ,RCV_CUST_NM                                         CAT916  
                   ,RCV_CUST_NM_STS_CD                                  CAT916  
                   ,RCV_SS_PRIM_NBR                                     CAT916  
                   ,RCV_SS_PRIM_STS_CD                                  CAT916  
                   ,RCV_SS_SCNDY_NBR                                    CAT916  
                   ,RCV_SS_SCDY_STS_CD                                  CAT916  
                   ,RCV_ACCT_TYPE_CD                                    CAT916  
                   ,RCV_ACT_TYP_STS_CD                                  CAT916  
                   ,RCV_OCC_BRKR_NBR                                    CAT916  
                   ,RCV_OCC_STTS_CD                                     CAT916  
                   ,RCV_CRSPN_NBR                                       CAT916  
                   ,RCV_CRSPN_STTS_CD                                   CAT916  
                   ,ACAT_CNTL_ASTD_NBR                                  CAT916  
                   ,CNTL_ASTD_STTS_CD                                   CAT916  
                   ,CMNT_TXT                                            CAT916  
                   ,CMNT_STTS_CD                                        CAT916  
                   ,PRCS_DT                                             CAT916  
                   ,STTS_CD                                             CAT916  
                   ,STTLM_TM_CD                                         CAT916  
                   ,VAL_FREE_CD                                         CAT916  
                   ,TRANS_RFRN_ID_CD                                    CAT916  
                   ,TRANS_RFRN_STTS_CD                                  CAT916  
                   ,DB_CR_CD                                            CAT916  
                   ,DSTBN_SIDE_CD                                       CAT916  
                   ,SYS_ACT_CD                                          CAT916  
                   ,SYS_RJCT_RSN_CD                                     CAT916  
                   ,TRNFR_TYPE_RJC1_CD                                  CAT916  
                   ,TRNFR_TYPE_RJC2_CD                                  CAT916  
                   ,TRNFR_TYPE_RJCT_CD                                  CAT916  
                   ,TRN_TYP_RJC_STS_CD                                  CAT916  
                   ,PHSCL_SEQ_NBR                                       CAT916  
                   ,PHSCL_SEQ_STTS_CD                                   CAT916  
                   ,LGCL_SEQ_NBR                                        CAT916  
                   ,LGCL_SEQ_NR_STS_CD                                  CAT916  
                   ,RR_CD                                               CAT916  
                   ,BRANCH_CD                                           CAT916  
                   ,DVDND_NAA_CD                                        CAT916  
                   ,SELL_INSTN_NAA_CD                                   CAT916  
                   ,CASH_SWEEP_NAA_CD                                   CAT916  
                   ,PRTCP_CONTRA_CD                                     CAT916  
                   ,ACM_HOLDER_NAA_CD                                   CAT916  
                   ,ACCT_ACTIVITY_IND                                   CAT916  
                   ,ACCT_ORDERS_IND                                     CAT916  
                   ,ACCT_RJCT_RSBM_IND                                  CAT916  
                   ,ACCT_DB_BAL_T1_IND                                  CAT916  
                   ,ACCT_MRGN_DB_IND                                    CAT916  
                   ,ACCT_SHRT_PSTN_IND                                  CAT916  
                   ,ACCT_SEC_RSTRD_IND                                  CAT916  
                   ,ACCT_AST_EXCS_IND                                   CAT916  
                   ,ACCT_OPTN_PSTN_IND                                  CAT916  
                   ,ACCT_LTD_PRTNR_IND                                  CAT916  
                   ,ACCT_TIN_MSMTH_IND                                  CAT916  
                   ,ACCT_DPLCT_TRN_IND                                  CAT916  
                   ,ACCT_CUST_70_IND                                    CAT916  
                   ,ACCT_QULFD_PLN_IND                                  CAT916  
                   ,ACCT_MNGD_IND                                       CAT916  
                   ,ACCT_PRVT_RNG_IND                                   CAT916  
                   ,ACCT_BRKR_TIF_IND                                   CAT916  
                   ,NSCC_NON_ADP_IND                                    CAT916  
                   ,CYCLE_CD                                            CAT916  
                   ,DAYS_STTS_QTY                                       CAT916  
                   ,STTLM_DT                                            CAT916  
                   ,ACCT_NA_UPDT_IND                                    CAT916  
                   ,ACCT_TRNFR_FEE_AMT                                  CAT916  
                   ,ACCT_IRA_TRMNT_AMT                                  CAT916  
                   ,ACCT_IRA_MAINT_AMT                                  CAT916  
                   ,ACCT_DLRV_PRGR_IND                                  CAT916  
                   ,ACCT_CD                                             CAT916  
                   ,STTLM_ASCTD_DT                                      CAT916  
                   ,STTLM_ASCTD_STS_CD                                  CAT916  
                   ,RCRD_LNGTH_STTS_CD                                  CAT916  
                   ,RCRD_STTS_CD                                        CAT916  
                   ,NSCC_PEND_CD                                        CAT916  
                   ,NSCC_ACK_IND                                        CAT916  
                   ,CICS_TERM_ID_CD                                     CAT916  
                   ,PRGM_NM                                             CAT916  
                   ,CRT_TMSTP                                           CAT916  
                   ,UPDT_TMSTP                                          CAT916  
                   ,ACCT_EQUITY_AMT                                     CAT916  
                  )                                                     CAT916  
              VALUES                                                    CAT916  
                 ( :CLIENT-NBR                                          CAT916  
                  ,:ACAT-CONTROL-NBR                                    CAT916  
                  ,:SBMTG-PRTCP-NBR                                     CAT916  
                  ,:SBMT-PRT-NR-STS-CD                                  CAT916  
                  ,:CONTROL-NBR-STS-CD                                  CAT916  
                  ,:DLVR-NBR                                            CAT916  
                  ,:DLVR-NBR-STTS-CD                                    CAT916  
                  ,:ACCT-DLVR-NBR                                       CAT916  
                  ,:ACCT-DLVR-STTS-CD                                   CAT916  
                  ,:RCV-NBR                                             CAT916  
                  ,:RCV-NBR-STTS-CD                                     CAT916  
                  ,:ACCT-RCV-NBR                                        CAT916  
                  ,:ACCT-RCV-STTS-CD                                    CAT916  
                  ,:TRNFR-TYPE-CD                                       CAT916  
                  ,:TRNFR-TYPE-STTS-CD                                  CAT916  
                  ,:TRANS-TYPE-CD                                       CAT916  
                  ,:TRANS-TYPE-STTS-CD                                  CAT916  
                  ,:RCV-CUST-NM                                         CAT916  
                  ,:RCV-CUST-NM-STS-CD                                  CAT916  
                  ,:RCV-SS-PRIM-NBR                                     CAT916  
                  ,:RCV-SS-PRIM-STS-CD                                  CAT916  
                  ,:RCV-SS-SCNDY-NBR                                    CAT916  
                  ,:RCV-SS-SCDY-STS-CD                                  CAT916  
                  ,:RCV-ACCT-TYPE-CD                                    CAT916  
                  ,:RCV-ACT-TYP-STS-CD                                  CAT916  
                  ,:RCV-OCC-BRKR-NBR                                    CAT916  
                  ,:RCV-OCC-STTS-CD                                     CAT916  
                  ,:RCV-CRSPN-NBR                                       CAT916  
                  ,:RCV-CRSPN-STTS-CD                                   CAT916  
                  ,:ACAT-CNTL-ASTD-NBR                                  CAT916  
                  ,:CNTL-ASTD-STTS-CD                                   CAT916  
                  ,:CMNT-TXT                                            CAT916  
                  ,:CMNT-STTS-CD                                        CAT916  
                  ,:PRCS-DT                                             CAT916  
                  ,:STTS-CD                                             CAT916  
                  ,:STTLM-TM-CD                                         CAT916  
                  ,:VAL-FREE-CD                                         CAT916  
                  ,:TRANS-RFRN-ID-CD                                    CAT916  
                  ,:TRANS-RFRN-STTS-CD                                  CAT916  
                  ,:DB-CR-CD                                            CAT916  
                  ,:DSTBN-SIDE-CD                                       CAT916  
                  ,:SYS-ACT-CD                                          CAT916  
                  ,:SYS-RJCT-RSN-CD                                     CAT916  
                  ,:TRNFR-TYPE-RJC1-CD                                  CAT916  
                  ,:TRNFR-TYPE-RJC2-CD                                  CAT916  
                  ,:TRNFR-TYPE-RJCT-CD                                  CAT916  
                  ,:TRN-TYP-RJC-STS-CD                                  CAT916  
                  ,:PHSCL-SEQ-NBR                                       CAT916  
                  ,:PHSCL-SEQ-STTS-CD                                   CAT916  
                  ,:LGCL-SEQ-NBR                                        CAT916  
                  ,:LGCL-SEQ-NR-STS-CD                                  CAT916  
                  ,:RR-CD                                               CAT916  
                  ,:BRANCH-CD                                           CAT916  
                  ,:DVDND-NAA-CD                                        CAT916  
                  ,:SELL-INSTN-NAA-CD                                   CAT916  
                  ,:CASH-SWEEP-NAA-CD                                   CAT916  
                  ,:PRTCP-CONTRA-CD                                     CAT916  
                  ,:ACM-HOLDER-NAA-CD                                   CAT916  
                  ,:ACCT-ACTIVITY-IND                                   CAT916  
                  ,:ACCT-ORDERS-IND                                     CAT916  
                  ,:ACCT-RJCT-RSBM-IND                                  CAT916  
                  ,:ACCT-DB-BAL-T1-IND                                  CAT916  
                  ,:ACCT-MRGN-DB-IND                                    CAT916  
                  ,:ACCT-SHRT-PSTN-IND                                  CAT916  
                  ,:ACCT-SEC-RSTRD-IND                                  CAT916  
                  ,:ACCT-AST-EXCS-IND                                   CAT916  
                  ,:ACCT-OPTN-PSTN-IND                                  CAT916  
                  ,:ACCT-LTD-PRTNR-IND                                  CAT916  
                  ,:ACCT-TIN-MSMTH-IND                                  CAT916  
                  ,:ACCT-DPLCT-TRN-IND                                  CAT916  
                  ,:ACCT-CUST-70-IND                                    CAT916  
                  ,:ACCT-QULFD-PLN-IND                                  CAT916  
                  ,:ACCT-MNGD-IND                                       CAT916  
                  ,:ACCT-PRVT-RNG-IND                                   CAT916  
                  ,:ACCT-BRKR-TIF-IND                                   CAT916  
                  ,:NSCC-NON-ADP-IND                                    CAT916  
                  ,:CYCLE-CD                                            CAT916  
                  ,:DAYS-STTS-QTY                                       CAT916  
                  ,:STTLM-DT                                            CAT916  
                  ,:ACCT-NA-UPDT-IND                                    CAT916  
                  ,:ACCT-TRNFR-FEE-AMT                                  CAT916  
                  ,:ACCT-IRA-TRMNT-AMT                                  CAT916  
                  ,:ACCT-IRA-MAINT-AMT                                  CAT916  
                  ,:ACCT-DLRV-PRGR-IND                                  CAT916  
                  ,:ACCT-CD                                             CAT916  
                  ,:STTLM-ASCTD-DT                                      CAT916  
                  ,:STTLM-ASCTD-STS-CD                                  CAT916  
                  ,:RCRD-LNGTH-STTS-CD                                  CAT916  
                  ,:RCRD-STTS-CD                                        CAT916  
                  ,:NSCC-PEND-CD                                        CAT916  
                  ,:NSCC-ACK-IND                                        CAT916  
                  ,:CICS-TERM-ID-CD                                     CAT916  
                  ,:PRGM-NM                                             CAT916  
                  ,:CRT-TMSTP                                           CAT916  
                  ,:UPDT-TMSTP                                          CAT916  
                  ,:ACCT-EQUITY-AMT )                                   CAT916  
            END-EXEC.                                                   CAT916  
            IF SQLCODE = 0                                              CAT916  
               ADD +1 TO WS-ACAT-WRITE-CNT                              CAT916  
               PERFORM DISPLAY-TRANSFER                                 CAT916  
            ELSE                                                        CAT916  
               MOVE ADP-CLIENT-NO TO WS-CLT-OUT                         CAT916  
               MOVE BR-ACCT-NO    TO WS-ACCT-OUT                        CAT916  
               MOVE ACATS-CONTROL-NO TO WS-CONTROL-OUT                  CAT916  
               MOVE SQLCODE  TO WS-SQLCODE-OUT                          CAT916  
               DISPLAY WS-INSERT-ERR-OUT                                CAT916  
               DISPLAY WS-ERR-ACCT-OUT                                  CAT916  
               DISPLAY WS-ERR-ACAT-OUT                                  CAT916  
               MOVE +2000 TO ABEND-CODE                                 CAT916  
               GO TO CALL-ABEND.                                        CAT916  
                                                                        CAT916  
      *                                                                 CAT916  
       DISPLAY-TRANSFER.                                                CAT916  
            DISPLAY ' ADD ==>  CLT: ' CLIENT-NBR                        CAT916  
                    '  CONTROL: ' ACAT-CONTROL-NBR                      CAT916  
                    '  ACCT: ' ACCT-DLVR-NBR                            CAT916  
                    '  SETTL-DATE: ' STTLM-DT.                          CAT916  
       EJECT                                                            CAT916  
                                                                        CAT916  
       END-RTN.                                                         CAT916  
           CLOSE ACAT-PSDR-FILE.                                        CAT916  
           DISPLAY '* NUMBER OF ACATPSR RECORD READ    = '              CAT916  
                    WS-ACAT-READ-CNT.                                   CAT916  
           DISPLAY '* NUMBER OF ACATPSR RECORD WRITTEN = '              CAT916  
                    WS-ACAT-WRITE-CNT.                                  CAT916  
           DISPLAY '* W-GETNA-FND-CNT                  = '              CAT916  
                      W-GETNA-FND-CNT.                                  CAT916  
           DISPLAY '* W-GETNA-NOTFND-CNT               = '              CAT916  
                      W-GETNA-NOTFND-CNT.                               CAT916  
                                                                        CAT916  
       CALL-ABEND.                                                      CAT916  
TCK001     CALL  ABEND  USING ABEND-CODE ABEND-DUMPSW.                  CAT916  
      /                                                                 CAT916  
       8500-SQL-ERROR-ROUTINE.                                          CAT916  
                                                                        CAT916  
           CALL DSNTIAR               USING  SQLCA                      CAT916  
                                             WS-DB2-MESSAGE-AREA        CAT916  
                                             WS-ERR-LINE-LEN            CAT916  
                                                                        CAT916  
           DISPLAY ' '                                                  CAT916  
                                                                        CAT916  
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                   CAT916  
              UNTIL WS-ERROR-INDEX GREATER THAN 12                      CAT916  
                 IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES              CAT916  
                    DISPLAY '*** ' WS-ERROR-MSG (WS-ERROR-INDEX)        CAT916  
                 END-IF                                                 CAT916  
           END-PERFORM                                                  CAT916  
                                                                        CAT916  
           DISPLAY ' '                                                  CAT916  
           DISPLAY ' *** CAT916 ABENDED ****'                           CAT916  
           DISPLAY ' '                                                  CAT916  
                                                                        CAT916  
           EXEC SQL  ROLLBACK  END-EXEC                                 CAT916  
           MOVE +3999 TO ABEND-CODE                                     CAT916  
TCK001     CALL  ABEND  USING ABEND-CODE ABEND-DUMPSW.                  CAT916  
      *#################################################################CAT916  
