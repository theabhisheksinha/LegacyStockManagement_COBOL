000001* PDX    - CAT918   C0151283 12/18/00 13:47:04 TBTIKUO            00001000
000001* PDX    - CAT918   C0119911 01/15/99 12:49:08 TBYOHON            00001000
000001* PDX    - CAT918   C0116408 11/05/98 14:52:40 TBDOJUN            00001000
      * PDX    - CAT918   C0115988 10/11/98 07:50:53 TBYOHON            CAT918  
       IDENTIFICATION DIVISION.                                         CAT918  
       PROGRAM-ID.  CAT918.                                             CAT918  
      *****CONVERT FUND REGISTRATION RECORD FROM OLD SYSTEM             CAT918  
       ENVIRONMENT DIVISION.                                            CAT918  
       INPUT-OUTPUT SECTION.                                            CAT918  
       FILE-CONTROL.                                                    CAT918  
                                                                        CAT918  
           SELECT NSCCFILE         ASSIGN       TO NSCCFILE.            CAT918  
           SELECT MFRGFILE         ASSIGN       TO MFRGFILE.            CAT918  
                                                                        CAT918  
       DATA DIVISION.                                                   CAT918  
       FILE SECTION.                                                    CAT918  
       FD  NSCCFILE                                                     CAT918  
           RECORDING MODE IS V                                          CAT918  
           BLOCK CONTAINS 0 RECORDS.                                    CAT918  
       01  NSCCOTRN-TI-RECORD   PIC X(0481).                            CAT918  
       01  NSCCOTRN-AT-REG-RECORD   PIC X(0585).                        CAT918  
       01  NSCCOTRN-AT-OPT-RECORD   PIC X(0651).                        CAT918  
       01  NSCCOTRN-AT-MFD-RECORD   PIC X(0619).                        CAT918  
       01  NSCCOTRN-FR-MFR-RECORD0  PIC X(0852).                        CAT918  
       01  NSCCOTRN-FR-MFR-RECORD1  PIC X(1131).                        CAT918  
       01  NSCCOTRN-FR-MFR-RECORD   PIC X(3268).                        CAT918  
                                                                        CAT918  
           COPY NSCCMHDR REPLACING ==:NSCCMHDR:== BY ==NSCCOHDR==.      CAT918  
                                                                        CAT918  
           COPY NSCCMTRL REPLACING ==:NSCCMTRL:== BY ==NSCCOTRL==.      CAT918  
                                                                        CAT918  
       FD  MFRGFILE.                                                    CAT918  
           COPY AMFRREC.                                                CAT918  
                                                                        CAT918  
       WORKING-STORAGE SECTION.                                         CAT918  
       COPY PDXIDCOB.                                                   CAT918  
                                                                        CAT918  
           COPY NSCCMTRN REPLACING ==:NSCCMTRN:== BY ==NSCCOTRN==.      CAT918  
                                                                        CAT918  
       01  W-TI-RECORD   PIC X(0481).                                   CAT918  
       01  W-AT-RECORD   PIC X(3268).                                   CAT918  
       01  W-FIELDS.                                                    CAT918  
           05 W-SHARE-AREA.                                             CAT918  
             10 FILLER.                                                 CAT918  
                15 FILLER   PIC X(3) VALUE '000'.                       CAT918  
                15 W-SHARE-DIG  PIC 9(9).                               CAT918  
             10 FILLER      PIC X VALUE ','.                            CAT918  
             10 W-SHARE-FRA    PIC V9(4) VALUE 0.                       CAT918  
           05 W-NUM-4-A    PIC X(4).                                    CAT918  
           05 W-NUM-4-N REDEFINES W-NUM-4-A PIC 9(4).                   CAT918  
           05 WS-NUM-3-A    PIC X(3).                                   CAT918  
           05 WS-NUM-3-N REDEFINES WS-NUM-3-A PIC 9(3).                 CAT918  
           05 SAVE-CLR-NO      PIC 9(4) VALUE 0.                        CAT918  
           05 SAVE-CLR-NO-A    REDEFINES SAVE-CLR-NO PIC X(4).          CAT918  
           05 W-CTL-NO.                                                 CAT918  
              10 W-CTL-NO-CCYY  PIC X(4).                               CAT918  
              10 W-CTL-NO-DDD   PIC X(3).                               CAT918  
              10 W-CTL-NO-SEQ   PIC X(7).                               CAT918  
           05  W-FIRST-TIME-SW           PIC  X(001) VALUE '0'.         CAT918  
               88 NOT-FIRST-TIME                     VALUE '1'.         CAT918  
           05  W-CHANGE-IND              PIC  X(001) VALUE '0'.         CAT918  
               88 THIS-IS-CHANGE                     VALUE 'Y'.         CAT918  
           05  END-OF-NSCCFILE-SW        PIC  X(001) VALUE '0'.         CAT918  
               88 END-OF-NSCCFILE                    VALUE '1'.         CAT918  
           05  NSCCFILE-STAT             PIC  X(002).                   CAT918  
               88 NSCCFILE-OKAY          VALUE '00' THRU '09', '97'.    CAT918  
               88 NSCCFILE-END-OF-FILE   VALUE '10'.                    CAT918  
               88 NSCCFILE-EMPTY-MISSING VALUE '35'.                    CAT918  
           05  NSCCFILE-DATE-SW          PIC  X(001) VALUE ' '.         CAT918  
               88 NSCCFILE-DATE-FOUND                VALUE 'Y'.         CAT918  
           05  ACATLOG-STAT              PIC  X(002).                   CAT918  
               88 ACATLOG-OKAY           VALUE '00' THRU '09', '97'.    CAT918  
               88 ACATLOG-END-OF-FILE    VALUE '10'.                    CAT918  
               88 ACATLOG-DUP-REC        VALUE '22'.                    CAT918  
               88 ACATLOG-NOTFND         VALUE '23'.                    CAT918  
               88 ACATLOG-EMPTY-MISSING  VALUE '35'.                    CAT918  
           05  W-TABLE-ENTRY-CNT         PIC  9(003) VALUE 0.           CAT918  
TCK001     05  ABEND-CD                  PIC S9(004) COMP SYNC VALUE 0. CAT918  
TCK001*    05  DUMP-SW                   PIC  X(001) VALUE 'D'.         CAT918  
           05  W-SYS-DATE                PIC  9(006) VALUE 0.           CAT918  
           05  FILLER  REDEFINES                                        CAT918  
               W-SYS-DATE.                                              CAT918  
               10  W-UPD-DATE            PIC  X(006).                   CAT918  
           05  W-SYS-TIME                PIC  9(008) VALUE 0.           CAT918  
           05  FILLER  REDEFINES                                        CAT918  
               W-SYS-TIME.                                              CAT918  
               10  W-UPD-TIME            PIC  X(006).                   CAT918  
               10  W-UPD-TIME-MS         PIC  X(002).                   CAT918  
           05  LD-PROC-DATE.                                            CAT918  
               10 LD-PROC-DATE-MM        PIC  X(002).                   CAT918  
               10 LD-PROC-DATE-DD        PIC  X(002).                   CAT918  
               10 LD-PROC-DATE-YY        PIC  X(002).                   CAT918  
           05  W-HDR-TRL-SW              PIC  X(001) VALUE 'T'.         CAT918  
               88 HDR-FOUND                          VALUE 'H'.         CAT918  
               88 TRL-FOUND                          VALUE 'T'.         CAT918  
           05  W-BRK-SW                  PIC  X(001) VALUE ' '.         CAT918  
               88 BRK-FOUND                          VALUE 'Y'.         CAT918  
           05  FILLER                    PIC  X(008) VALUE 'INPUTCNT'.  CAT918  
           05  W-NSCCFILE-CNT            PIC  9(009) VALUE 0.           CAT918  
           05  W-NCHGFILE-CNT            PIC  9(009) VALUE 0.           CAT918  
           05  FILLER                    PIC  X(008) VALUE 'DETAILCT'.  CAT918  
           05  W-DETAIL-CNT              PIC  9(011) VALUE 0.           CAT918  
           05  FILLER                    PIC  X(008) VALUE 'W-SUB1  '.  CAT918  
           05  W-SUB1                    PIC  9(004) VALUE 0.           CAT918  
           05  FILLER                    PIC  X(008) VALUE 'RECLENIN'.  CAT918  
           05  W-REC-LEN-IN              PIC  9(005) VALUE 0.           CAT918  
           05  FILLER                    PIC  X(008) VALUE 'NEWCYCLE'.  CAT918  
           05  W-NAME-WORK.                                             CAT918  
              10 W-N-W OCCURS 20 TIMES INDEXED BY IWNW   PIC X.         CAT918  
           05  W-NAME-WORKNEW.                                          CAT918  
              10 W-N-WN OCCURS 20 TIMES INDEXED BY IWNWN PIC X.         CAT918  
           05  W-NEXT-CYCLE.                                            CAT918  
               07  W-NEXT-CYCLE-N        PIC  9(004) VALUE 0.           CAT918  
           COPY BPDATESC.                                               CAT918  
TCK001     COPY STUBCPY.                                                CAT918  
       LINKAGE SECTION.                                                 CAT918  
       01  L-JCL-PARMS.                                                 CAT918  
           05  PARMLENGTH                PIC S9(004) COMP SYNC.         CAT918  
           05  L-STREAM                  PIC  X(001).                   CAT918  
               88  L-NEW-TRANSFER                    VALUE 'Y'.         CAT918  
           05  L-BYP-CYCLE-SW            PIC  X(001).                   CAT918  
               88  L-NEW-PARTIAL                     VALUE 'Y'.         CAT918  
       PROCEDURE DIVISION USING L-JCL-PARMS.                            CAT918  
      *                         ===========                             CAT918  
           COPY MSGCOBO.                                                CAT918  
           MOVE 'CAT918'                  TO BPDATES-CALLING-PGM.       CAT918  
           SET  LNKDATZ-REQUEST           TO TRUE.                      CAT918  
TCK001     CALL  BPDATES  USING BPDATES-PARAMETERS.                     CAT918  
           MOVE BPD-PROC-DATE(3:2)        TO LD-PROC-DATE-YY.           CAT918  
           MOVE BPD-PROC-DATE(5:2)        TO LD-PROC-DATE-MM.           CAT918  
           MOVE BPD-PROC-DATE(7:2)        TO LD-PROC-DATE-DD.           CAT918  
           MOVE BPD-PROC-DATE(1:4)        TO W-CTL-NO-CCYY.             CAT918  
                                                                        CAT918  
           OPEN INPUT MFRGFILE                                          CAT918  
                OUTPUT NSCCFILE.                                        CAT918  
                                                                        CAT918  
           PERFORM 3000-READ-INPUT                                      CAT918  
                                                                        CAT918  
           PERFORM 1000-PROCESS                                         CAT918  
                       UNTIL  END-OF-NSCCFILE                           CAT918  
                                                                        CAT918  
           CLOSE NSCCFILE MFRGFILE.                                     CAT918  
                                                                        CAT918  
           GOBACK.                                                      CAT918  
                                                                        CAT918  
       1000-PROCESS.                                                    CAT918  
             MOVE MFRR-RECEIVE-BROKER      TO SAVE-CLR-NO               CAT918  
      *      IF SAVE-CLR-NO =   573  OR    57                           CAT918  
                 PERFORM CONVERT-HEADER                                 CAT918  
                 PERFORM 2000-PROCESS                                   CAT918  
                       UNTIL  END-OF-NSCCFILE                           CAT918  
                          OR  MFRR-RECEIVE-BROKER NOT = SAVE-CLR-NO     CAT918  
                 PERFORM CONVERT-TRAILER                                CAT918  
            CONTINUE.                                                   CAT918  
       2000-PROCESS.                                                    CAT918  
                                                                        CAT918  
           PERFORM CONVERT-MFREG                                        CAT918  
           PERFORM 3000-READ-INPUT.                                     CAT918  
           IF   NSCCOTRN-FR-P0-LEN                                      CAT918  
             WRITE                                                      CAT918  
                 NSCCOTRN-FR-MFR-RECORD0  FROM NSCCOTRN-RECORD          CAT918  
           ELSE                                                         CAT918  
            WRITE                                                       CAT918  
                 NSCCOTRN-FR-MFR-RECORD1  FROM NSCCOTRN-RECORD.         CAT918  
                                                                        CAT918  
       3000-READ-INPUT.                                                 CAT918  
                                                                        CAT918  
           READ MFRGFILE                                                CAT918  
             AT END                                                     CAT918  
                   MOVE '1'              TO END-OF-NSCCFILE-SW          CAT918  
             NOT AT END                                                 CAT918  
                   IF  MFRR-KEY = LOW-VALUE                             CAT918  
                    GO TO 3000-READ-INPUT                               CAT918  
                   END-IF                                               CAT918  
           END-READ.                                                    CAT918  
                                                                        CAT918  
       CONVERT-HEADER.                                                  CAT918  
                                                                        CAT918  
           MOVE 'H'         TO  NSCCOHDR-REC-TYPE.                      CAT918  
           MOVE  '0061'     TO NSCCOHDR-REC-LEN.                        CAT918  
           MOVE '02070716'  TO  NSCCOHDR-AUTORTE-PROD-ID                CAT918  
           MOVE  'MULTI-CYLE TRANSACTION MRO'                           CAT918  
                            TO  NSCCOHDR-FILE-DESC                      CAT918  
           MOVE SAVE-CLR-NO-A TO NSCCOHDR-DIST-SIDE.                    CAT918  
           MOVE BPD-PROC-DATE TO NSCCOHDR-PROC-DATE                     CAT918  
           MOVE 'N'         TO NSCCOHDR-MULTI-CYCLE-IND.                CAT918  
           MOVE '0004'      TO NSCCOHDR-MULTI-CYCLE-NBR.                CAT918  
           MOVE '*'         TO NSCCOHDR-VAR-LEN-REC-IND.                CAT918  
           ADD  1                TO W-NSCCFILE-CNT                      CAT918  
           WRITE NSCCOHDR-RECORD.                                       CAT918  
                                                                        CAT918  
       CONVERT-TRAILER.                                                 CAT918  
                                                                        CAT918  
           MOVE 'T'         TO  NSCCOTRL-REC-TYPE.                      CAT918  
           MOVE  '0070'     TO NSCCOTRL-REC-LEN.                        CAT918  
           MOVE '02070716'  TO  NSCCOTRL-AUTORTE-PROD-ID                CAT918  
           MOVE  'MULTI-CYLE TRANSACTION MRO'                           CAT918  
                            TO  NSCCOTRL-FILE-DESC                      CAT918  
           MOVE SAVE-CLR-NO  TO NSCCOTRL-DIST-SIDE.                     CAT918  
           MOVE BPD-PROC-DATE TO NSCCOTRL-PROC-DATE                     CAT918  
           MOVE 'N'         TO NSCCOTRL-MULTI-CYCLE-IND.                CAT918  
           MOVE '0004'      TO NSCCOTRL-MULTI-CYCLE-NBR.                CAT918  
           MOVE '*'         TO NSCCOTRL-VAR-LEN-REC-IND.                CAT918  
           ADD  1                TO W-NSCCFILE-CNT                      CAT918  
           MOVE  W-NSCCFILE-CNT         TO  NSCCOTRL-ITEM-CNT.          CAT918  
           MOVE 0                        TO W-NSCCFILE-CNT              CAT918  
                                                                        CAT918  
           WRITE NSCCOTRL-RECORD.                                       CAT918  
                                                                        CAT918  
                                                                        CAT918  
       CONVERT-MFREG.                                                   CAT918  
                                                                        CAT918  
           INITIALIZE  NSCCOTRN-RECORD.                                 CAT918  
           MOVE 'M'  TO  NSCCOTRN-REC-TYPE.                             CAT918  
           SET  NSCCOTRN-FUND-REG-OUTPUT TO TRUE                        CAT918  
           SET  NSCCOTRN-FR-P0-LEN       TO TRUE                        CAT918  
           IF    MFRR-PAYABLE-LINE-IND > '0'                            CAT918  
              SET  NSCCOTRN-FR-P1-LEN       TO TRUE.                    CAT918  
           MOVE NSCCOTRN-REC-LEN   TO NSCCOTRN-FR-REC-LEN.              CAT918  
           MOVE MFRR-CONTROL-NUMBER (9 :4)   TO W-NUM-4-A               CAT918  
           MOVE W-NUM-4-N   TO NSCCOTRN-ASSET-SEQ-NBR                   CAT918  
                               NSCCOTRN-FR-ASSET-SEQ-NBR.               CAT918  
           SET     NSCCOTRN-PHYSICAL-SEQ-DEFAULT TO TRUE                CAT918  
           SET     NSCCOTRN-LOGICAL-SEQ-DEFAULT   TO TRUE               CAT918  
           MOVE '01'  TO NSCCOTRN-FR-PHSCL-SEQ-NBR                      CAT918  
           MOVE '01'  TO NSCCOTRN-FR-LGCL-SEQ-NBR                       CAT918  
           MOVE 'A'  TO NSCCOTRN-FR-TRAN-TYPE                           CAT918  
           SET NSCCOTRN-ORIGINAL-RECEIVER  TO TRUE                      CAT918  
           MOVE MFRR-CONTROL-NUMBER (1 : 3) TO  W-CTL-NO-DDD.           CAT918  
           MOVE '1999'   TO W-CTL-NO-CCYY.                                      
           IF  W-CTL-NO-DDD > '200'                                             
            AND W-CTL-NO-DDD < '400'                                            
             MOVE '1998'  TO W-CTL-NO-CCYY.                                     
                                                                                
           MOVE MFRR-CONTROL-NUMBER (4 : 5) TO  W-CTL-NO-SEQ(3 : 5)     CAT918  
           MOVE '00'                 TO  W-CTL-NO-SEQ(1 : 2)            CAT918  
           MOVE  W-CTL-NO            TO  NSCCOTRN-ACAT-CTL-NBR.         CAT918  
           MOVE BPD-PROC-DATE        TO NSCCOTRN-PROC-DATE.             CAT918  
           MOVE '01'       TO  NSCCOTRN-CYCLE.                          CAT918  
           MOVE SAVE-CLR-NO   TO NSCCOTRN-DIST-PARTICIPANT              CAT918  
           SET   NSCCOTRN-ACCEPTED TO TRUE                              CAT918  
           SET  NSCCOTRN-SETTLE-PREP TO TRUE                            CAT918  
           MOVE 1            TO NSCCOTRN-DAYS-IN-STATUS                 CAT918  
           SET  NSCCOTRN-PARTICIPANT-REG TO TRUE.                       CAT918  
           SET  NSCCOTRN-REC-TYPE-IS-FR  TO TRUE.                       CAT918  
           MOVE  MFRR-CUST-ACCT                                         CAT918  
                      TO NSCCOTRN-FR-FND-CUS-ACCT-NBR                   CAT918  
           MOVE  W-CTL-NO                                               CAT918  
                         TO NSCCOTRN-FR-ACAT-CTL-NBR.                   CAT918  
           MOVE 'FUL'                                                   CAT918  
                         TO NSCCOTRN-FR-TFR-TYPE.                       CAT918  
           IF  NSCCOTRN-FR-ACAT-CTL-NBR(5 : 3) > '400'                  CAT918  
             MOVE 'RCR'                                                 CAT918  
                         TO NSCCOTRN-FR-TFR-TYPE.                       CAT918  
           MOVE  MFRR-RECEIVE-BROKER                                    CAT918  
                         TO NSCCOTRN-FR-RCV-NBR                         CAT918  
                            NSCCOTRN-FR-SUB-PART-NBR.                   CAT918  
           MOVE  MFRR-DELIVER-BROKER                                    CAT918  
                         TO NSCCOTRN-FR-DEL-NBR                         CAT918  
           MOVE '  '     TO NSCCOTRN-FR-SEC-CNTRY-CD                    CAT918  
      ******                NSCCOTRN-FR-PAY-SEC-CNTRY-CD(1)             CAT918  
           MOVE  MFRR-FUND-CUSIP TO NSCCOTRN-FR-SEC-ID                  CAT918  
      ******                        NSCCOTRN-FR-PAY-SEC-ISS-ID  (1)     CAT918  
           MOVE  MFRR-TRANSACTION-TYPE                                  CAT918  
                         TO NSCCOTRN-FR-MF-TRAN-TYPE.                   CAT918  
           MOVE  MFRR-FRACTION-IND                                      CAT918  
                         TO NSCCOTRN-FR-FRAC-IND                        CAT918  
           MOVE  MFRR-NRA-TAX                                           CAT918  
                   TO NSCCOTRN-FR-NRA-TAX-PCT.                          CAT918  
           MOVE  MFRR-FUND-ACCT-IND                                     CAT918  
                      TO NSCCOTRN-FR-FND-ACCT-IND                       CAT918  
           IF    MFRR-FUND-ACCT-IND = '4'                               CAT918  
             MOVE '0' TO NSCCOTRN-FR-FND-ACCT-IND.                      CAT918  
           IF    MFRR-FUND-ACCT-IND = '5'                               CAT918  
             MOVE '1' TO NSCCOTRN-FR-FND-ACCT-IND.                      CAT918  
           IF    MFRR-FUND-ACCT-IND = '6'                               CAT918  
             MOVE '2' TO NSCCOTRN-FR-FND-ACCT-IND.                      CAT918  
           IF    MFRR-FUND-ACCT-IND = '7'                               CAT918  
             MOVE '3' TO NSCCOTRN-FR-FND-ACCT-IND.                      CAT918  
           MOVE  MFRR-BP-SHARE-IND                                      CAT918  
                 TO NSCCOTRN-FR-BOOK-SHR-IND.                           CAT918  
           MOVE  MFRR-ACCT-NA-LINE-1                                    CAT918  
                      TO NSCCOTRN-FR-CUS-NA-LINE1                       CAT918  
           MOVE  MFRR-ACCT-NA-LINE-2                                    CAT918  
                      TO NSCCOTRN-FR-CUS-NA-LINE2                       CAT918  
           MOVE  MFRR-ACCT-NA-LINE-3                                    CAT918  
                      TO NSCCOTRN-FR-CUS-NA-LINE3                       CAT918  
           MOVE  MFRR-ACCT-NA-LINE-4                                    CAT918  
                      TO NSCCOTRN-FR-CUS-NA-LINE4                       CAT918  
           MOVE  MFRR-ACCT-NA-LINE-5                                    CAT918  
                      TO NSCCOTRN-FR-CUS-NA-LINE5                       CAT918  
           MOVE  MFRR-ACCT-NA-LINE-6                                    CAT918  
                      TO NSCCOTRN-FR-CUS-NA-LINE6                       CAT918  
           MOVE  MFRR-RELATED-TRADE-IND                                 CAT918  
                      TO NSCCOTRN-FR-RLT-TRADE-IND                      CAT918  
           MOVE  MFRR-RELATED-ACCT                                      CAT918  
                      TO NSCCOTRN-FR-RLT-ACCT-NBR                       CAT918  
           MOVE ' '  TO NSCCOTRN-FR-RLT-ACCT-NBR-IND                    CAT918  
           IF  NSCCOTRN-FR-RLT-ACCT-NBR NOT = SPACES                    CAT918  
            MOVE '1'                                                    CAT918  
                                TO NSCCOTRN-FR-RLT-ACCT-NBR-IND.        CAT918  
           MOVE  MFRR-EXECUTE-BROKER                                    CAT918  
                      TO NSCCOTRN-FR-EXEC-BRKR                          CAT918  
           MOVE  MFRR-SOCIAL-CODE                                       CAT918  
                      TO NSCCOTRN-FR-SOCIAL-CD                          CAT918  
           MOVE  MFRR-NAV-ACCT-IND                                      CAT918  
                      TO NSCCOTRN-FR-NAV-ACCT-IND                       CAT918  
           MOVE  MFRR-MARGIN-ACCT-IND                                   CAT918  
                      TO NSCCOTRN-FR-MRGN-ACCT-IND                      CAT918  
           MOVE  MFRR-DIVIDEND-CODE                                     CAT918  
                      TO NSCCOTRN-FR-DIV-CD                             CAT918  
           MOVE  MFRR-SS-NO-IND                                         CAT918  
                      TO NSCCOTRN-FR-SSN-IND                            CAT918  
           MOVE  MFRR-SS-NO                                             CAT918  
                      TO NSCCOTRN-FR-SSN-NBR                            CAT918  
           MOVE  MFRR-WITHHOLD-IND                                      CAT918  
                      TO NSCCOTRN-FR-WTHOLDNG-IND                       CAT918  
           MOVE  MFRR-ACCT-LINE-IND                                     CAT918  
                      TO NSCCOTRN-FR-CUS-NAME-END-LN                    CAT918  
           MOVE  MFRR-CUST-ZIP                                          CAT918  
                      TO NSCCOTRN-FR-CUS-ZIP-5                          CAT918  
           MOVE  MFRR-PI-DELIVERY-IND                                   CAT918  
                      TO NSCCOTRN-FR-PI-DEL-IND                         CAT918  
           MOVE  MFRR-PAYABLE-INFO-IND                                  CAT918  
                      TO NSCCOTRN-FR-PAY-INFO-IND                       CAT918  
           MOVE  MFRR-NETWORK-CONTROL-IND                               CAT918  
                      TO NSCCOTRN-FR-NTWK-CTL-IND                       CAT918  
           MOVE  MFRR-CHECK-PRIV-IND                                    CAT918  
                      TO NSCCOTRN-FR-CHK-WRTNG-PRVG-IND                 CAT918  
           MOVE  MFRR-PRE-AUTH-CHECK-IND                                CAT918  
                      TO NSCCOTRN-FR-PAC-IND                            CAT918  
           MOVE  MFRR-AUTO-CLEAR-IND                                    CAT918  
                      TO NSCCOTRN-FR-ACH-IND                            CAT918  
           MOVE  MFRR-SYSTEMATIC-WITH-IND                               CAT918  
                      TO NSCCOTRN-FR-SWP-IND                            CAT918  
           MOVE  MFRR-ABA-ROUTING-NO                                    CAT918  
                      TO NSCCOTRN-FR-ABA-ROUTE-NBR                      CAT918  
           MOVE  MFRR-ROA-LOI-VALUE                                     CAT918  
                      TO NSCCOTRN-FR-ROL-LOI-VAL                        CAT918  
           MOVE  MFRR-LOI-NO-DATE                                       CAT918  
                      TO NSCCOTRN-FR-LOI-NBR-DT                         CAT918  
      **** MOVE  MFRR-ROA-LOI-IND                                       CAT918  
      **** MOVE  MFRR-SYMBOL                                            CAT918  
      **** MOVE  MFRR-LAST-ACTION                                       CAT918  
      **** MOVE  MFRR-HOUSE-REG                                         CAT918  
      **** MOVE  MFRR-HOUSE-ACCT                                        CAT918  
      **** MOVE  MFRR-NAME-IND                                          CAT918  
      ***  MOVE  MFRR-CUST-ACCT-IND                                     CAT918  
                                                                        CAT918  
      ****            TO NSCCOTRN-FR-BOOK-SHR-IND                       CAT918  
      ****            TO NSCCOTRN-FR-ATD-ACCR-CD                        CAT918  
      ****            TO NSCCOTRN-FR-ATD-CASH-CD                        CAT918  
      ****            TO NSCCOTRN-FR-ATD-RESIDUAL-CD                    CAT918  
      ****            TO NSCCOTRN-FR-SWP-PAC-EFF-DT                     CAT918  
      ****            TO NSCCOTRN-FR-CDSC-PAY-CD                        CAT918  
      ****            TO NSCCOTRN-FR-DSBRS-OPT-CD                       CAT918  
      ****            TO NSCCOTRN-FR-DSBRS-AMT                          CAT918  
      ****            TO NSCCOTRN-FR-MNTH-PAY-IND.                      CAT918  
      ****              TO NSCCOTRN-FR-PAY-JAN-IND                      CAT918  
      ****              TO NSCCOTRN-FR-PAY-FEB-IND                      CAT918  
      ****              TO NSCCOTRN-FR-PAY-MAR-IND                      CAT918  
      ****              TO NSCCOTRN-FR-PAY-APR-IND                      CAT918  
      ****              TO NSCCOTRN-FR-PAY-MAY-IND                      CAT918  
      ****              TO NSCCOTRN-FR-PAY-JUN-IND                      CAT918  
      ****              TO NSCCOTRN-FR-PAY-JUL-IND                      CAT918  
      ****              TO NSCCOTRN-FR-PAY-AUG-IND                      CAT918  
      ****              TO NSCCOTRN-FR-PAY-SEP-IND                      CAT918  
      ****              TO NSCCOTRN-FR-PAY-OCT-IND                      CAT918  
      ****              TO NSCCOTRN-FR-PAY-NOV-IND                      CAT918  
      ****              TO NSCCOTRN-FR-PAY-DEC-IND                      CAT918  
      ****            TO NSCCOTRN-FR-PAY-DT-VAL                         CAT918  
      ***  MOVE  MFRR-IRA-IND                                           CAT918  
      ****            TO NSCCOTRN-FR-RETIRE-TAX-CD                      CAT918  
      ****            TO NSCCOTRN-FR-SHRHLD-BNK-ACT-NBR                 CAT918  
      ****            TO NSCCOTRN-FR-SHRHLD-BNK-ACT-TYP                 CAT918  
      ****            TO NSCCOTRN-FR-FIRST-CHK-DT                       CAT918  
      ****            TO NSCCOTRN-FR-COST-BASIS-CD                      CAT918  
           MOVE  MFRR-STATE-OF-SALE                                     CAT918  
                      TO NSCCOTRN-FR-STATE-CD                           CAT918  
           MOVE  MFRR-COUNTRY-OF-ORIGIN                                 CAT918  
                      TO NSCCOTRN-FR-CNTRY-CD                           CAT918  
           MOVE  MFRR-AE-NAME                                           CAT918  
                      TO NSCCOTRN-FR-ACCT-REP-NAME                      CAT918  
           MOVE  MFRR-AE-NUMBER                                         CAT918  
                      TO NSCCOTRN-FR-ACCT-REP-NBR                       CAT918  
           MOVE  MFRR-BRANCH-ID-NO                                      CAT918  
                      TO NSCCOTRN-FR-BRNCH-ID-NBR                       CAT918  
           MOVE  MFRR-MEMO-FIELD                                        CAT918  
                      TO NSCCOTRN-FR-MEMO-FLD                           CAT918  
      ****************** NSCCOTRN-FR-PAYABLE-INFO OCCURS 6 TIMES.       CAT918  
           MOVE  MFRR-PAYABLE-ACCT                                      CAT918  
                        TO NSCCOTRN-FR-PAY-ACT-NBR     (1)              CAT918  
      ****              TO NSCCOTRN-FR-PAY-ACT-NBR-IND (1)              CAT918  
           MOVE  MFRR-PAYABLE-ZIP                                       CAT918  
                        TO NSCCOTRN-FR-PAY-ZIP-5       (1)              CAT918  
      ****************  TO NSCCOTRN-FR-PAY-ZIP-4       (1)              CAT918  
           IF    MFRR-PAYABLE-LINE-IND > '0'                            CAT918  
                       MOVE '01'  TO NSCCOTRN-FR-NBR-OF-PAY             CAT918  
               MOVE  MFRR-PAYABLE-LINE-IND                              CAT918  
                        TO NSCCOTRN-FR-PAY-NAM-ENDLNE  (1)              CAT918  
               MOVE  MFRR-PAYEE-NA-LINE-1                               CAT918  
                        TO NSCCOTRN-FR-PAY-NA-LINE1    (1)              CAT918  
               MOVE  MFRR-PAYEE-NA-LINE-2                               CAT918  
                        TO NSCCOTRN-FR-PAY-NA-LINE2    (1)              CAT918  
               MOVE  MFRR-PAYEE-NA-LINE-3                               CAT918  
                        TO NSCCOTRN-FR-PAY-NA-LINE3    (1)              CAT918  
               MOVE  MFRR-PAYEE-NA-LINE-4                               CAT918  
                        TO NSCCOTRN-FR-PAY-NA-LINE4    (1)              CAT918  
               MOVE  MFRR-PAYEE-NA-LINE-5                               CAT918  
                        TO NSCCOTRN-FR-PAY-NA-LINE5    (1)              CAT918  
               MOVE  MFRR-PAYEE-NA-LINE-6                               CAT918  
                        TO NSCCOTRN-FR-PAY-NA-LINE6    (1)              CAT918  
               MOVE  MFRR-PAYABLE-ADDR-OPT                              CAT918  
                        TO NSCCOTRN-FR-PAY-ADDR-OPT    (1).             CAT918  
           MOVE SPACE   TO NSCCOTRN-FR-PAY-SEC-CHKDGT  (1)              CAT918  
                           NSCCOTRN-FR-PAY-ALT-IND     (1)              CAT918  
      ***********       TO NSCCOTRN-FR-PAY-ALT-REASN   (1).             CAT918  
           CONTINUE.                                                    CAT918  
                                                                        CAT918  
       CLEAN-NAME.                                                      CAT918  
           SET IWNWN TO 1. SET IWNWN DOWN BY 1.                         CAT918  
           MOVE SPACE   TO W-NAME-WORKNEW.                              CAT918  
                                                                        CAT918  
           PERFORM VARYING IWNW FROM 1 BY 1                             CAT918  
              UNTIL IWNW > 20                                           CAT918  
              IF  W-N-W (IWNW)  = '-' OR ' '                            CAT918  
               CONTINUE                                                 CAT918  
              ELSE                                                      CAT918  
               SET IWNWN UP BY 1                                        CAT918  
               MOVE W-N-W (IWNW)    TO W-N-WN(IWNWN)                    CAT918  
              END-IF                                                    CAT918  
           END-PERFORM.                                                 CAT918  
                                                                        CAT918  
