000001* PDX    - CAT910   C0151283 12/18/00 13:45:48 TBTIKUO            00001000
000001* PDX    - CAT910   C0119911 01/15/99 12:48:07 TBYOHON            00001000
000001* PDX    - CAT910   C0119637 12/23/98 14:14:58 TBYOHON            00001000
000001* PDX    - CAT910   C0116408 11/02/98 10:55:41 TBDOJUN            00001000
      * PDX    - CAT910   C0115988 10/10/98 07:32:33 TBYOHON            CAT910  
       IDENTIFICATION DIVISION.                                         CAT910  
       PROGRAM-ID.  CAT910.                                             CAT910  
      ******* CONVERT SIAC103(OLD ACAT) TO NEW NSCC MRO MULTI CYCLE     CAT910  
      ****** OUTPUT FORMAT FOR THE PURPOSE OF DAY 1 LOADING.            CAT910  
      ****                                                              CAT910  
       ENVIRONMENT DIVISION.                                            CAT910  
       INPUT-OUTPUT SECTION.                                            CAT910  
       FILE-CONTROL.                                                    CAT910  
                                                                        CAT910  
           SELECT NSCCFILE         ASSIGN       TO NSCCFILE.            CAT910  
           SELECT NCHGFILE         ASSIGN       TO NCHGFILE.            CAT910  
           SELECT S103FILE         ASSIGN       TO S103FILE.            CAT910  
                                                                        CAT910  
       DATA DIVISION.                                                   CAT910  
       FILE SECTION.                                                    CAT910  
       FD  NSCCFILE                                                     CAT910  
           RECORDING MODE IS V                                          CAT910  
           BLOCK CONTAINS 0 RECORDS.                                    CAT910  
       01  NSCCOTRN-TI-RECORD   PIC X(0481).                            CAT910  
       01  NSCCOTRN-AT-REG-RECORD   PIC X(0585).                        CAT910  
       01  NSCCOTRN-AT-OPT-RECORD   PIC X(0651).                        CAT910  
       01  NSCCOTRN-AT-MFD-RECORD   PIC X(0619).                        CAT910  
       01  NSCCOTRN-FR-MFR-RECORD   PIC X(3268).                        CAT910  
       01  DUMMY-LARGE-RECORD       PIC X(4000).                        CAT910  
                                                                        CAT910  
           COPY NSCCMHDR REPLACING ==:NSCCMHDR:== BY ==NSCCOHDR==.      CAT910  
                                                                        CAT910  
           COPY NSCCMTRL REPLACING ==:NSCCMTRL:== BY ==NSCCOTRL==.      CAT910  
                                                                        CAT910  
       FD  NCHGFILE                                                     CAT910  
           RECORDING MODE IS V                                          CAT910  
           BLOCK CONTAINS 0 RECORDS.                                    CAT910  
       01  NCHGOTRN-TI-RECORD   PIC X(0481).                            CAT910  
       01  NCHGOTRN-AT-REG-RECORD   PIC X(0585).                        CAT910  
       01  NCHGOTRN-AT-OPT-RECORD   PIC X(0651).                        CAT910  
       01  NCHGOTRN-AT-MFD-RECORD   PIC X(0619).                        CAT910  
       01  NCHGOTRN-FR-MFR-RECORD   PIC X(3268).                        CAT910  
       01  DUMMY-LARGE-RECORD2      PIC X(4000).                        CAT910  
                                                                        CAT910  
           COPY NSCCMHDR REPLACING ==:NSCCMHDR:== BY ==NCHGOHDR==.      CAT910  
                                                                        CAT910  
           COPY NSCCMTRL REPLACING ==:NSCCMTRL:== BY ==NCHGOTRL==.      CAT910  
                                                                        CAT910  
       FD  S103FILE.                                                    CAT910  
           COPY SIAC103.                                                CAT910  
                                                                        CAT910  
       WORKING-STORAGE SECTION.                                         CAT910  
       COPY PDXIDCOB.                                                   CAT910  
                                                                        CAT910  
           COPY NSCCMTRN REPLACING ==:NSCCMTRN:== BY ==NSCCOTRN==.      CAT910  
                                                                        CAT910  
       01  W-TI-RECORD   PIC X(0481).                                   CAT910  
       01  W-AT-RECORD   PIC X(3268).                                   CAT910  
       01  W-FIELDS.                                                    CAT910  
           05 W-SHARE-AREA.                                             CAT910  
             10 FILLER.                                                 CAT910  
                15 FILLER   PIC X(3) VALUE '000'.                       CAT910  
                15 W-SHARE-DIG  PIC 9(9).                               CAT910  
             10 FILLER      PIC X VALUE ','.                            CAT910  
             10 W-SHARE-FRA    PIC V9(4) VALUE 0.                       CAT910  
           05 W-NUM-4-A    PIC X(4).                                    CAT910  
           05 W-NUM-4-N REDEFINES W-NUM-4-A PIC 9(4).                   CAT910  
           05 WS-NUM-3-A    PIC X(3).                                   CAT910  
           05 WS-NUM-3-N REDEFINES WS-NUM-3-A PIC 9(3).                 CAT910  
           05 SAVE-CLR-NO      PIC X(4) VALUE '0000'.                   CAT910  
           05 W-CTL-NO.                                                 CAT910  
              10 W-CTL-NO-CCYY   PIC X(04).                             CAT910  
              10 W-CTL-NO-DDD   PIC X(3).                               CAT910  
              10 W-CTL-NO-SEQ   PIC X(7).                               CAT910  
           05  W-FIRST-TIME-SW           PIC  X(001) VALUE '0'.         CAT910  
               88 NOT-FIRST-TIME                     VALUE '1'.         CAT910  
           05  W-CHANGE-IND              PIC  X(001) VALUE '0'.         CAT910  
               88 THIS-IS-CHANGE                     VALUE 'Y'.         CAT910  
           05  END-OF-NSCCFILE-SW        PIC  X(001) VALUE '0'.         CAT910  
               88 END-OF-NSCCFILE                    VALUE '1'.         CAT910  
           05  NSCCFILE-STAT             PIC  X(002).                   CAT910  
               88 NSCCFILE-OKAY          VALUE '00' THRU '09', '97'.    CAT910  
               88 NSCCFILE-END-OF-FILE   VALUE '10'.                    CAT910  
               88 NSCCFILE-EMPTY-MISSING VALUE '35'.                    CAT910  
           05  NSCCFILE-DATE-SW          PIC  X(001) VALUE ' '.         CAT910  
               88 NSCCFILE-DATE-FOUND                VALUE 'Y'.         CAT910  
           05  ACATLOG-STAT              PIC  X(002).                   CAT910  
               88 ACATLOG-OKAY           VALUE '00' THRU '09', '97'.    CAT910  
               88 ACATLOG-END-OF-FILE    VALUE '10'.                    CAT910  
               88 ACATLOG-DUP-REC        VALUE '22'.                    CAT910  
               88 ACATLOG-NOTFND         VALUE '23'.                    CAT910  
               88 ACATLOG-EMPTY-MISSING  VALUE '35'.                    CAT910  
           05  W-TABLE-ENTRY-CNT         PIC  9(003) VALUE 0.           CAT910  
TCK001     05  ABEND-CD                  PIC S9(004) COMP SYNC VALUE 0. CAT910  
TCK001*    05  DUMP-SW                   PIC  X(001) VALUE 'D'.         CAT910  
           05  W-SYS-DATE                PIC  9(006) VALUE 0.           CAT910  
           05  FILLER  REDEFINES                                        CAT910  
               W-SYS-DATE.                                              CAT910  
               10  W-UPD-DATE            PIC  X(006).                   CAT910  
           05  W-SYS-TIME                PIC  9(008) VALUE 0.           CAT910  
           05  FILLER  REDEFINES                                        CAT910  
               W-SYS-TIME.                                              CAT910  
               10  W-UPD-TIME            PIC  X(006).                   CAT910  
               10  W-UPD-TIME-MS         PIC  X(002).                   CAT910  
           05  LD-PROC-DATE.                                            CAT910  
               10 LD-PROC-DATE-MM        PIC  X(002).                   CAT910  
               10 LD-PROC-DATE-DD        PIC  X(002).                   CAT910  
               10 LD-PROC-DATE-YY        PIC  X(002).                   CAT910  
           05  W-HDR-TRL-SW              PIC  X(001) VALUE 'T'.         CAT910  
               88 HDR-FOUND                          VALUE 'H'.         CAT910  
               88 TRL-FOUND                          VALUE 'T'.         CAT910  
           05  W-BRK-SW                  PIC  X(001) VALUE ' '.         CAT910  
               88 BRK-FOUND                          VALUE 'Y'.         CAT910  
           05  FILLER                    PIC  X(008) VALUE 'INPUTCNT'.  CAT910  
           05  W-NSCCFILE-CNT            PIC  9(009) VALUE 0.           CAT910  
           05  W-NCHGFILE-CNT            PIC  9(009) VALUE 0.           CAT910  
           05  FILLER                    PIC  X(008) VALUE 'DETAILCT'.  CAT910  
           05  W-DETAIL-CNT              PIC  9(011) VALUE 0.           CAT910  
           05  FILLER                    PIC  X(008) VALUE 'W-SUB1  '.  CAT910  
           05  W-SUB1                    PIC  9(004) VALUE 0.           CAT910  
           05  FILLER                    PIC  X(008) VALUE 'RECLENIN'.  CAT910  
           05  W-REC-LEN-IN              PIC  9(005) VALUE 0.           CAT910  
           05  FILLER                    PIC  X(008) VALUE 'NEWCYCLE'.  CAT910  
           05  W-NAME-WORK.                                             CAT910  
              10 W-N-W OCCURS 20 TIMES INDEXED BY IWNW   PIC X.         CAT910  
           05  W-NAME-WORKNEW.                                          CAT910  
              10 W-N-WN OCCURS 20 TIMES INDEXED BY IWNWN PIC X.         CAT910  
           05  W-NEXT-CYCLE.                                            CAT910  
               07  W-NEXT-CYCLE-N        PIC  9(004) VALUE 0.           CAT910  
           COPY BPDATESC.                                               CAT910  
TCK001     COPY STUBCPY.                                                        
       LINKAGE SECTION.                                                 CAT910  
       01  L-JCL-PARMS.                                                 CAT910  
           05  PARMLENGTH                PIC S9(004) COMP SYNC.         CAT910  
           05  L-STREAM                  PIC  X(001).                   CAT910  
               88  L-NEW-TRANSFER                    VALUE 'Y'.         CAT910  
           05  L-BYP-CYCLE-SW            PIC  X(001).                   CAT910  
               88  L-NEW-PARTIAL                     VALUE 'Y'.         CAT910  
       PROCEDURE DIVISION USING L-JCL-PARMS.                            CAT910  
           COPY MSGCOBO.                                                CAT910  
           MOVE 'CAT910'                  TO BPDATES-CALLING-PGM.       CAT910  
           SET  LNKDATZ-REQUEST           TO TRUE.                      CAT910  
TCK001     CALL  BPDATES  USING BPDATES-PARAMETERS.                     CAT910  
           MOVE BPD-PROC-DATE(3:2)        TO LD-PROC-DATE-YY.           CAT910  
           MOVE BPD-PROC-DATE(5:2)        TO LD-PROC-DATE-MM.           CAT910  
           MOVE BPD-PROC-DATE(7:2)        TO LD-PROC-DATE-DD.           CAT910  
           MOVE BPD-PROC-DATE(1:4)        TO W-CTL-NO-CCYY.             CAT910  
                                                                        CAT910  
           OPEN INPUT S103FILE                                          CAT910  
                OUTPUT NSCCFILE NCHGFILE.                               CAT910  
                                                                        CAT910  
           PERFORM 3000-READ-INPUT                                      CAT910  
                                                                        CAT910  
           PERFORM 1000-PROCESS                                         CAT910  
                       UNTIL  END-OF-NSCCFILE                           CAT910  
                                                                        CAT910  
           CLOSE NSCCFILE S103FILE NCHGFILE.                            CAT910  
                                                                        CAT910  
           GOBACK.                                                      CAT910  
                                                                        CAT910  
       1000-PROCESS.                                                    CAT910  
           IF  HEADER                                                   CAT910  
             MOVE ACAT-HDR-BROKER-CLR-NO   TO SAVE-CLR-NO               CAT910  
      *      IF SAVE-CLR-NO = '0573' OR '0057'                          CAT910  
                 PERFORM CONVERT-HEADER                                 CAT910  
                 PERFORM 3000-READ-INPUT                                CAT910  
                 PERFORM 2000-PROCESS                                   CAT910  
                       UNTIL  END-OF-NSCCFILE                           CAT910  
                          OR  TRAILER                                   CAT910  
                 PERFORM CONVERT-TRAILER                                CAT910  
                 PERFORM 3000-READ-INPUT                                CAT910  
      *       ELSE                                                      CAT910  
      *          PERFORM 3000-READ-INPUT                                CAT910  
      *                UNTIL  END-OF-NSCCFILE                           CAT910  
      *                   OR  ACAT-HDR-BROKER-CLR-NO NOT = SAVE-CLR-NO  CAT910  
      *       END-IF                                                    CAT910  
            ELSE                                                        CAT910  
               PERFORM 3000-READ-INPUT                                  CAT910  
                     UNTIL  END-OF-NSCCFILE                             CAT910  
                        OR  HEADER                                      CAT910  
           END-IF.                                                      CAT910  
                                                                        CAT910  
       2000-PROCESS.                                                    CAT910  
                                                                        CAT910  
           IF  ACAT-CONTROL                                             CAT910  
               PERFORM CONVERT-TRANSFER                                 CAT910  
           ELSE                                                         CAT910  
           IF  ACAT-ASSET                                               CAT910  
             IF ACAT-NEW-DEFAULT-REG OR ACAT-OLD-DEFAULT-REG            CAT910  
              OR ACAT-NEW-BROKER-REG OR ACAT-REJECT-OF-REG              CAT910  
               PERFORM CONVERT-MFREG                                    CAT910  
             ELSE                                                       CAT910  
               PERFORM CONVERT-ASSET                                    CAT910  
             END-IF                                                     CAT910  
           ELSE                                                         CAT910  
             IF  ACAT-SETTLEMENT                                        CAT910  
               PERFORM CONVERT-SETTLEMENT                               CAT910  
             ELSE                                                       CAT910  
               DISPLAY '        ' ACAT-IN-FILE-AREA                     CAT910  
               DISPLAY ' BAD REC-TYPE'                                  CAT910  
             END-IF                                                     CAT910  
             PERFORM 3000-READ-INPUT 3 TIMES                            CAT910  
           END-IF.                                                      CAT910  
                                                                        CAT910  
       3000-READ-INPUT.                                                 CAT910  
                                                                        CAT910  
           READ S103FILE                                                CAT910  
             AT END                                                     CAT910  
                   MOVE '1'              TO END-OF-NSCCFILE-SW          CAT910  
             NOT AT END                                                 CAT910  
                   IF  ACAT-REC-ID = 'H' OR '1' OR '2' OR '3' OR 'T'    CAT910  
                    CONTINUE                                            CAT910  
                   ELSE                                                 CAT910  
                    GO TO 3000-READ-INPUT                               CAT910  
                   END-IF                                               CAT910  
           END-READ.                                                    CAT910  
                                                                        CAT910  
       CONVERT-SETTLEMENT.                                              CAT910  
           MOVE 'H'         TO  NSCCOHDR-REC-TYPE.                      CAT910  
                                                                        CAT910  
       CONVERT-HEADER.                                                  CAT910  
                                                                        CAT910  
           MOVE 'H'         TO  NSCCOHDR-REC-TYPE.                      CAT910  
           MOVE  '0061'     TO NSCCOHDR-REC-LEN.                        CAT910  
           MOVE '02070716'  TO  NSCCOHDR-AUTORTE-PROD-ID                CAT910  
           MOVE  'MULTI-CYLE TRANSACTION MRO'                           CAT910  
                            TO  NSCCOHDR-FILE-DESC                      CAT910  
           MOVE SAVE-CLR-NO  TO NSCCOHDR-DIST-SIDE.                     CAT910  
           MOVE BPD-PROC-DATE TO NSCCOHDR-PROC-DATE                     CAT910  
           MOVE 'N'         TO NSCCOHDR-MULTI-CYCLE-IND.                CAT910  
           MOVE '0001'      TO NSCCOHDR-MULTI-CYCLE-NBR.                CAT910  
           MOVE '*'         TO NSCCOHDR-VAR-LEN-REC-IND.                CAT910  
           ADD  1                TO W-NSCCFILE-CNT                      CAT910  
           ADD  1                TO W-NCHGFILE-CNT                      CAT910  
           MOVE NSCCOHDR-RECORD   TO NCHGOHDR-RECORD.                   CAT910  
           MOVE '0002'      TO NCHGOHDR-MULTI-CYCLE-NBR.                CAT910  
           WRITE NSCCOHDR-RECORD.                                       CAT910  
           WRITE NCHGOHDR-RECORD.                                       CAT910  
                                                                        CAT910  
                                                                        CAT910  
       CONVERT-TRAILER.                                                 CAT910  
                                                                        CAT910  
           MOVE 'T'         TO  NSCCOTRL-REC-TYPE.                      CAT910  
           MOVE  '0070'     TO NSCCOTRL-REC-LEN.                        CAT910  
           MOVE '02070716'  TO  NSCCOTRL-AUTORTE-PROD-ID                CAT910  
           MOVE  'MULTI-CYLE TRANSACTION MRO'                           CAT910  
                            TO  NSCCOTRL-FILE-DESC                      CAT910  
           MOVE SAVE-CLR-NO  TO NSCCOTRL-DIST-SIDE.                     CAT910  
           MOVE BPD-PROC-DATE TO NSCCOTRL-PROC-DATE                     CAT910  
           MOVE 'N'         TO NSCCOTRL-MULTI-CYCLE-IND.                CAT910  
           MOVE '0001'      TO NSCCOTRL-MULTI-CYCLE-NBR.                CAT910  
           MOVE '*'         TO NSCCOTRL-VAR-LEN-REC-IND.                CAT910  
           ADD  1                TO W-NSCCFILE-CNT                      CAT910  
           ADD  1                TO W-NCHGFILE-CNT                      CAT910  
           MOVE  NSCCOTRL-RECORD TO NCHGOTRL-RECORD.                    CAT910  
           MOVE '0002'      TO NCHGOTRL-MULTI-CYCLE-NBR.                CAT910  
           MOVE  W-NSCCFILE-CNT         TO  NSCCOTRL-ITEM-CNT.          CAT910  
           MOVE  W-NCHGFILE-CNT         TO  NCHGOTRL-ITEM-CNT.          CAT910  
           MOVE 0                        TO W-NSCCFILE-CNT              CAT910  
           MOVE 0                        TO W-NCHGFILE-CNT              CAT910  
                                                                        CAT910  
           WRITE NSCCOTRL-RECORD.                                       CAT910  
           WRITE NCHGOTRL-RECORD.                                       CAT910  
                                                                        CAT910  
       CONVERT-TRANSFER.                                                CAT910  
                                                                        CAT910  
           PERFORM CONVERT-COMMON.                                      CAT910  
           PERFORM CONVERT-FIRST-CONTROL.                               CAT910  
                                                                        CAT910  
           PERFORM 3000-READ-INPUT                                      CAT910  
           PERFORM CONVERT-SECOND-CONTROL.                              CAT910  
                                                                        CAT910  
           PERFORM 3000-READ-INPUT                                      CAT910  
           PERFORM CONVERT-THIRD-CONTROL.                               CAT910  
                                                                        CAT910  
           PERFORM 3000-READ-INPUT                                      CAT910  
           IF NOT  NSCCOTRN-REJECT                                      CAT910  
             ADD  1                TO W-NSCCFILE-CNT                    CAT910  
             WRITE NSCCOTRN-TI-RECORD FROM NSCCOTRN-RECORD.             CAT910  
                                                                        CAT910  
                                                                        CAT910  
       CONVERT-ASSET.                                                   CAT910  
                                                                        CAT910  
           MOVE SPACE TO NSCCOTRN-RECORD.                               CAT910  
           PERFORM CONVERT-COMMON.                                      CAT910  
      *****PERFORM CONVERT-FIRST-CONTROL.                               CAT910  
      *****MOVE NSCCOTRN-RECORD  TO W-TI-RECORD.                        CAT910  
           MOVE ' '    TO W-CHANGE-IND.                                 CAT910  
           PERFORM CONVERT-FIRST-ASSET.                                 CAT910  
                                                                        CAT910  
           PERFORM 3000-READ-INPUT                                      CAT910  
           PERFORM CONVERT-SECOND-ASSET.                                CAT910  
                                                                        CAT910  
           PERFORM 3000-READ-INPUT                                      CAT910  
           PERFORM CONVERT-THIRD-ASSET.                                 CAT910  
           MOVE NSCCOTRN-RECORD  TO W-AT-RECORD.                        CAT910  
      *****MOVE W-TI-RECORD    TO NSCCOTRN-RECORD.                      CAT910  
      *****WRITE NSCCOTRN-TI-RECORD FROM NSCCOTRN-RECORD.               CAT910  
           MOVE W-AT-RECORD    TO NSCCOTRN-RECORD.                      CAT910  
           IF NOT (NSCCOTRN-REJECT OR THIS-IS-CHANGE)                   CAT910  
            IF        NSCCOTRN-AT-CHG                                   CAT910  
             OR      NSCCOTRN-AT-DEL                                    CAT910  
             ADD  1                TO W-NCHGFILE-CNT                    CAT910  
             IF NSCCOTRN-AT-STL-LOC = '10'                              CAT910  
                SET NSCCOTRN-AT-MF-LEN   TO TRUE                        CAT910  
                MOVE NSCCOTRN-REC-LEN   TO NSCCOTRN-AT-REC-LEN          CAT910  
                WRITE NCHGOTRN-AT-MFD-RECORD FROM NSCCOTRN-RECORD       CAT910  
             ELSE IF NSCCOTRN-AT-STL-LOC = '35'                         CAT910  
                SET NSCCOTRN-AT-OP-LEN   TO TRUE                        CAT910  
                MOVE NSCCOTRN-REC-LEN   TO NSCCOTRN-AT-REC-LEN          CAT910  
                WRITE NCHGOTRN-AT-OPT-RECORD FROM NSCCOTRN-RECORD       CAT910  
               ELSE                                                     CAT910  
                SET NSCCOTRN-AT-LEN   TO TRUE                           CAT910  
                MOVE NSCCOTRN-REC-LEN   TO NSCCOTRN-AT-REC-LEN          CAT910  
                WRITE NCHGOTRN-AT-REG-RECORD FROM NSCCOTRN-RECORD       CAT910  
                  END-IF                                                CAT910  
             END-IF                                                     CAT910  
           ELSE                                                         CAT910  
             ADD  1                TO W-NSCCFILE-CNT                    CAT910  
             IF NSCCOTRN-AT-STL-LOC = '10'                              CAT910  
               SET NSCCOTRN-AT-MF-LEN   TO TRUE                         CAT910  
               MOVE NSCCOTRN-REC-LEN   TO NSCCOTRN-AT-REC-LEN           CAT910  
               WRITE NSCCOTRN-AT-MFD-RECORD FROM NSCCOTRN-RECORD        CAT910  
             ELSE IF NSCCOTRN-AT-STL-LOC = '35'                         CAT910  
               SET NSCCOTRN-AT-OP-LEN   TO TRUE                         CAT910  
               MOVE NSCCOTRN-REC-LEN   TO NSCCOTRN-AT-REC-LEN           CAT910  
               WRITE NSCCOTRN-AT-OPT-RECORD FROM NSCCOTRN-RECORD        CAT910  
              ELSE                                                      CAT910  
               SET NSCCOTRN-AT-LEN   TO TRUE                            CAT910  
               MOVE NSCCOTRN-REC-LEN   TO NSCCOTRN-AT-REC-LEN           CAT910  
               WRITE NSCCOTRN-AT-REG-RECORD FROM NSCCOTRN-RECORD        CAT910  
                  END-IF                                                CAT910  
             END-IF                                                     CAT910  
            END-IF                                                      CAT910  
           END-IF.                                                      CAT910  
           PERFORM 3000-READ-INPUT.                                     CAT910  
                                                                        CAT910  
       CONVERT-MFREG.                                                   CAT910  
                                                                        CAT910  
           PERFORM CONVERT-COMMON.                                      CAT910  
           PERFORM 3000-READ-INPUT                                      CAT910  
           PERFORM 3000-READ-INPUT                                      CAT910  
           PERFORM 3000-READ-INPUT.                                     CAT910  
                                                                        CAT910  
       CONVERT-COMMON.                                                  CAT910  
                                                                        CAT910  
           INITIALIZE  NSCCOTRN-RECORD.                                 CAT910  
           MOVE 'M'  TO  NSCCOTRN-REC-TYPE.                             CAT910  
           IF  ACAT-CONTROL                                             CAT910  
              SET  NSCCOTRN-TRANSFER-OUTPUT TO TRUE                     CAT910  
              SET  NSCCOTRN-TI-LEN          TO TRUE                     CAT910  
              MOVE 0           TO NSCCOTRN-ASSET-SEQ-NBR                CAT910  
           ELSE IF  ACAT-ASSET                                          CAT910  
              SET  NSCCOTRN-ASSET-OUTPUT TO TRUE                        CAT910  
              SET  NSCCOTRN-AT-LEN       TO TRUE                        CAT910  
              IF  NOT ACAT-NON-OPTION                                   CAT910  
                    SET NSCCOTRN-AT-OP-LEN   TO TRUE                    CAT910  
              END-IF                                                    CAT910  
              MOVE ACAT-ASSET-SEQ-NO  TO W-NUM-4-A                      CAT910  
              MOVE W-NUM-4-N   TO NSCCOTRN-ASSET-SEQ-NBR                CAT910  
      *****88  NSCCOTRN-AT-MF-LEN              VALUE '0619'.            CAT910  
           END-IF.                                                      CAT910  
           SET     NSCCOTRN-PHYSICAL-SEQ-DEFAULT TO TRUE                CAT910  
           SET     NSCCOTRN-LOGICAL-SEQ-DEFAULT   TO TRUE               CAT910  
           IF  ACAT-CLNT-IS-RECEIVER                                    CAT910  
               SET NSCCOTRN-ORIGINAL-RECEIVER  TO TRUE                  CAT910  
           ELSE                                                         CAT910  
              SET  NSCCOTRN-ORIGINAL-DELIVERER    TO TRUE.              CAT910  
      ***********  NSCCOTRN-BOTH-ORIG-REC-DEL      VALUE 'B'.           CAT910  
           MOVE ACAT-CONTROL-NUM (1 : 3) TO  W-CTL-NO-DDD.              CAT910  
           MOVE '1999'    TO W-CTL-NO-CCYY                                      
           IF  W-CTL-NO-DDD > '200'                                     CAT910  
             AND  W-CTL-NO-DDD < '400'                                  CAT910  
               MOVE '1998'    TO W-CTL-NO-CCYY.                                 
           MOVE ACAT-CONTROL-NUM (4 : 5) TO  W-CTL-NO-SEQ(3 : 5)        CAT910  
           MOVE '00'                 TO  W-CTL-NO-SEQ(1 : 2)            CAT910  
           MOVE  W-CTL-NO            TO  NSCCOTRN-ACAT-CTL-NBR.         CAT910  
      ******** NEED TO MODIFY THIS ROUTINE FIRST                        CAT910  
           MOVE BPD-PROC-DATE        TO NSCCOTRN-PROC-DATE.             CAT910  
           MOVE '01'       TO  NSCCOTRN-CYCLE.                          CAT910  
           MOVE SAVE-CLR-NO   TO NSCCOTRN-DIST-PARTICIPANT              CAT910  
           IF ACAT-NOT-REJECTED                                         CAT910  
             SET   NSCCOTRN-ACCEPTED TO TRUE                            CAT910  
           ELSE                                                         CAT910  
             SET   NSCCOTRN-REJECTED TO TRUE.                           CAT910  
      ***********  NSCCOTRN-MODIFIED               VALUE '3'.           CAT910  
           MOVE ACAT-DAYS-CURRENT-STATUS   TO WS-NUM-3-A.               CAT910  
           IF ACAT-NEW                                                  CAT910  
             IF  ACAT-NOT-PAST-DUE                                      CAT910  
              SET  NSCCOTRN-REQ TO TRUE                                 CAT910  
              MOVE WS-NUM-3-N   TO NSCCOTRN-DAYS-IN-STATUS              CAT910  
            ELSE                                                        CAT910  
              SET  NSCCOTRN-REQ-PAST   TO TRUE                          CAT910  
              SUBTRACT 3 FROM WS-NUM-3-N GIVING NSCCOTRN-DAYS-IN-STATUS CAT910  
            END-IF                                                      CAT910  
           END-IF.                                                      CAT910  
           IF ACAT-PEND                                                 CAT910  
            IF ACAT-NOT-REJECTED                                        CAT910  
              SET  NSCCOTRN-REVIEW TO TRUE                              CAT910  
              MOVE WS-NUM-3-N   TO NSCCOTRN-DAYS-IN-STATUS              CAT910  
            ELSE                                                        CAT910  
              SET  NSCCOTRN-REVIEW-ERROR TO TRUE                        CAT910  
              MOVE WS-NUM-3-N   TO NSCCOTRN-DAYS-IN-STATUS              CAT910  
            END-IF                                                      CAT910  
           END-IF.                                                      CAT910  
           IF ACAT-PEND-ADJ                                             CAT910  
              SET  NSCCOTRN-REVIEW-ADJ TO TRUE                          CAT910  
              MOVE WS-NUM-3-N   TO NSCCOTRN-DAYS-IN-STATUS              CAT910  
           END-IF.                                                      CAT910  
           IF ACAT-SETTLE                                               CAT910  
              MOVE WS-NUM-3-N   TO NSCCOTRN-DAYS-IN-STATUS              CAT910  
              SET  NSCCOTRN-SETTLE-PREP TO TRUE.                        CAT910  
           IF ACAT-CLOSED                                               CAT910  
              MOVE WS-NUM-3-N   TO NSCCOTRN-DAYS-IN-STATUS              CAT910  
              SET  NSCCOTRN-CLOSE-PURGE TO TRUE.                        CAT910  
           IF ACAT-REJECTED                                             CAT910  
              SET  NSCCOTRN-REJECT TO TRUE.                             CAT910  
            SET  NSCCOTRN-PARTICIPANT-REG TO TRUE.                      CAT910  
                                                                        CAT910  
       CONVERT-FIRST-CONTROL.                                           CAT910  
            MOVE SPACES   TO  NSCCOTRN-TI-BODY.                         CAT910  
            MOVE W-CTL-NO TO  NSCCOTRN-TI-ACAT-CTL-NBR.                 CAT910  
            SET  NSCCOTRN-REC-TYPE-IS-TI  TO TRUE.                      CAT910  
            MOVE '481' TO NSCCOTRN-TI-REC-LEN.                          CAT910  
            MOVE '01'  TO NSCCOTRN-TI-PHSCL-SEQ-NBR                     CAT910  
            MOVE '01'  TO NSCCOTRN-TI-LGCL-SEQ-NBR                      CAT910  
            SET     NSCCOTRN-TI-ADD    TO TRUE.                         CAT910  
            IF ACAT-REJECTED                                            CAT910  
              SET NSCCOTRN-TI-REJECT TO TRUE.                           CAT910  
            MOVE W-CTL-NO    TO  NSCCOTRN-TI-ACAT-CTL-NBR               CAT910  
            MOVE 'FUL'  TO NSCCOTRN-TI-TFR-TYPE                         CAT910  
            IF ACAT-CONTROL-NUM(1 : 3) > '400'                          CAT910  
               MOVE 'RCR'  TO NSCCOTRN-TI-TFR-TYPE                      CAT910  
            END-IF.                                                     CAT910  
            MOVE ACAT-BROKER-CLEAR-NO TO                                CAT910  
                                          NSCCOTRN-TI-SUB-PART-NBR      CAT910  
            IF ACAT-CLNT-IS-RECEIVER                                    CAT910  
             MOVE ACAT-BROKER-CLEAR-NO TO NSCCOTRN-TI-RCV-NBR           CAT910  
             MOVE ACAT-CONTRA-BRK-NUM TO   NSCCOTRN-TI-DEL-NBR          CAT910  
             MOVE ACAT-CUST-BR-ACT    TO  W-NAME-WORK                   CAT910  
             PERFORM CLEAN-NAME                                         CAT910  
             MOVE W-NAME-WORKNEW      TO  NSCCOTRN-TI-RCV-ACCT-NBR      CAT910  
             MOVE ACAT-CONTRA-CUS-ACT TO  W-NAME-WORK                   CAT910  
             PERFORM CLEAN-NAME                                         CAT910  
             MOVE W-NAME-WORKNEW      TO  NSCCOTRN-TI-DEL-ACCT-NBR      CAT910  
             IF        NSCCOTRN-TI-TFR-TYPE = 'RCR'                     CAT910  
               MOVE ACAT-CONTRA-BRK-NUM TO                              CAT910  
                                          NSCCOTRN-TI-SUB-PART-NBR      CAT910  
             END-IF                                                     CAT910  
             IF        NSCCOTRN-TI-TFR-TYPE = 'RCR'                     CAT910  
               MOVE ACAT-CONTRA-BRK-NUM TO                              CAT910  
                                          NSCCOTRN-TI-SUB-PART-NBR      CAT910  
             END-IF                                                     CAT910  
            ELSE                                                        CAT910  
             MOVE ACAT-BROKER-CLEAR-NO TO NSCCOTRN-TI-DEL-NBR           CAT910  
             MOVE ACAT-CONTRA-BRK-NUM TO   NSCCOTRN-TI-RCV-NBR          CAT910  
             MOVE ACAT-CUST-BR-ACT    TO  W-NAME-WORK                   CAT910  
             PERFORM CLEAN-NAME                                         CAT910  
             MOVE W-NAME-WORKNEW      TO  NSCCOTRN-TI-DEL-ACCT-NBR      CAT910  
             MOVE ACAT-CONTRA-CUS-ACT TO  W-NAME-WORK                   CAT910  
             PERFORM CLEAN-NAME                                         CAT910  
             MOVE W-NAME-WORKNEW      TO  NSCCOTRN-TI-RCV-ACCT-NBR      CAT910  
             IF        NSCCOTRN-TI-TFR-TYPE = 'FUL'                     CAT910  
               MOVE ACAT-CONTRA-BRK-NUM TO                              CAT910  
                                          NSCCOTRN-TI-SUB-PART-NBR      CAT910  
             END-IF                                                     CAT910  
            END-IF.                                                     CAT910  
            MOVE ACAT-SOC-SEC-TAX-ID TO NSCCOTRN-TI-RCV-SSN-PRM         CAT910  
      *****  15  NSCCOTRN-TI-RCV-SSN-SEC                                CAT910  
            IF  ACAT-SINGLE-ACCT                                        CAT910  
             MOVE 'SN'     TO NSCCOTRN-TI-RCV-ACCT-TYPE                 CAT910  
            ELSE IF  ACAT-JOINT-ACCT                                    CAT910  
             MOVE 'JT'     TO NSCCOTRN-TI-RCV-ACCT-TYPE                 CAT910  
            ELSE IF  ACAT-ROLLOVER                                      CAT910  
             MOVE 'DR'     TO NSCCOTRN-TI-RCV-ACCT-TYPE                 CAT910  
            ELSE IF  ACAT-IRA                                           CAT910  
             MOVE 'IR'     TO NSCCOTRN-TI-RCV-ACCT-TYPE                 CAT910  
            ELSE IF  ACAT-PROF-PENSION                                  CAT910  
             MOVE 'QP'     TO NSCCOTRN-TI-RCV-ACCT-TYPE                 CAT910  
            ELSE IF  ACAT-OTHER-ACCT                                    CAT910  
             MOVE 'OT'     TO NSCCOTRN-TI-RCV-ACCT-TYPE                 CAT910  
            ELSE IF  ACAT-ESTATE-ACCT                                   CAT910  
             MOVE 'ES'     TO NSCCOTRN-TI-RCV-ACCT-TYPE                 CAT910  
            ELSE IF  ACAT-CUSTODIAN-ACCT                                CAT910  
             MOVE 'CU'     TO NSCCOTRN-TI-RCV-ACCT-TYPE                 CAT910  
            ELSE IF  ACAT-TRUST-ACCT                                    CAT910  
             MOVE 'TR'     TO NSCCOTRN-TI-RCV-ACCT-TYPE                 CAT910  
            ELSE IF  ACAT-CORP-ACCT                                     CAT910  
             MOVE 'CO'     TO NSCCOTRN-TI-RCV-ACCT-TYPE                 CAT910  
            END-IF.                                                     CAT910  
            MOVE ACAT-ACT-TITLE    TO NSCCOTRN-TI-RCV-CUST-NAME.        CAT910  
                                                                        CAT910  
             MOVE ' '                  TO                               CAT910  
                                              NSCCOTRN-TI-COMMENTS.     CAT910  
                                                                        CAT910  
       CONVERT-SECOND-CONTROL.                                          CAT910  
                                                                        CAT910  
                                                                        CAT910  
       CONVERT-THIRD-CONTROL.                                           CAT910  
           MOVE ACAT-REJ-REASON    TO NSCCOTRN-TI-TFR-TYPE-REJ.         CAT910  
           MOVE ACAT-PROCESS-DATE  TO NSCCOTRN-PROC-DATE(3 : 6).        CAT910  
           MOVE '19'               TO NSCCOTRN-PROC-DATE(1 : 2).        CAT910  
                                                                        CAT910  
       CONVERT-FIRST-ASSET.                                             CAT910  
                                                                        CAT910  
           SET  NSCCOTRN-REC-TYPE-IS-AT  TO TRUE.                       CAT910  
           MOVE '01'   TO  NSCCOTRN-AT-PHSCL-SEQ-NBR                    CAT910  
           MOVE '01' TO  NSCCOTRN-AT-LGCL-SEQ-NBR                       CAT910  
           MOVE 'FUL'  TO NSCCOTRN-AT-TFR-TYPE                          CAT910  
           IF ACAT-CONTROL-NUM(1 : 3) > '400'                           CAT910  
               MOVE 'RCR'  TO NSCCOTRN-AT-TFR-TYPE                      CAT910  
           END-IF.                                                      CAT910  
           MOVE W-CTL-NO   TO NSCCOTRN-AT-ACAT-CTL-NBR.                 CAT910  
                                                                        CAT910  
           MOVE ACAT-BROKER-CLEAR-NO TO                                 CAT910  
                                          NSCCOTRN-AT-SUB-PART-NBR      CAT910  
            IF ACAT-CLNT-IS-RECEIVER                                    CAT910  
             MOVE ACAT-BROKER-CLEAR-NO TO NSCCOTRN-AT-RCV-NBR           CAT910  
             MOVE ACAT-CONTRA-BRK-NUM TO   NSCCOTRN-AT-DEL-NBR          CAT910  
             MOVE ACAT-CONTRA-CUS-ACT TO  W-NAME-WORK                   CAT910  
             PERFORM CLEAN-NAME                                         CAT910  
             MOVE W-NAME-WORKNEW      TO  NSCCOTRN-AT-TRAN-REF-ID       CAT910  
             IF        NSCCOTRN-AT-TFR-TYPE = 'RCR'                     CAT910  
               MOVE ACAT-CONTRA-BRK-NUM TO                              CAT910  
                                          NSCCOTRN-TI-SUB-PART-NBR      CAT910  
             END-IF                                                     CAT910  
            ELSE                                                        CAT910  
             MOVE ACAT-BROKER-CLEAR-NO TO NSCCOTRN-AT-DEL-NBR           CAT910  
             MOVE ACAT-CONTRA-BRK-NUM TO   NSCCOTRN-AT-RCV-NBR          CAT910  
             MOVE ACAT-CUST-BR-ACT    TO  W-NAME-WORKNEW                CAT910  
             PERFORM CLEAN-NAME                                         CAT910  
             MOVE W-NAME-WORKNEW      TO  NSCCOTRN-AT-TRAN-REF-ID       CAT910  
             IF        NSCCOTRN-AT-TFR-TYPE = 'FUL'                     CAT910  
               MOVE ACAT-CONTRA-BRK-NUM TO                              CAT910  
                                          NSCCOTRN-TI-SUB-PART-NBR      CAT910  
             END-IF                                                     CAT910  
            END-IF.                                                     CAT910  
            MOVE ACAT-ASSET-SEQ-NO  TO W-NUM-4-A                        CAT910  
            MOVE W-NUM-4-N   TO NSCCOTRN-AT-ASSET-SEQ-NBR.              CAT910  
            IF ACAT-NON-OPTION                                          CAT910  
               SET   NSCCOTRN-AT-NON-OPT   TO TRUE                      CAT910  
            ELSE IF ACAT-EQUITY-OPTION                                  CAT910  
               SET   NSCCOTRN-AT-EQUITY-OPT TO TRUE                     CAT910  
            ELSE IF ACAT-NON-EQUITY-OPTION                              CAT910  
               SET   NSCCOTRN-AT-NON-EQUITY-OPT TO TRUE                 CAT910  
            ELSE IF ACAT-INTL-CURR-SYS-OPTION                           CAT910  
               SET   NSCCOTRN-AT-ICS-OPT   TO TRUE.                     CAT910  
           IF ACAT-ADJ-PRIOR-POS                                        CAT910  
              SET THIS-IS-CHANGE TO TRUE                                CAT910  
           END-IF.                                                      CAT910  
                                                                        CAT910  
       CONVERT-SECOND-ASSET.                                            CAT910  
                                                                        CAT910  
           IF ACAT-ASSET-ADD                                            CAT910  
              SET    NSCCOTRN-AT-ADD TO TRUE                            CAT910  
           ELSE IF ACAT-ASSET-CHANGE                                    CAT910  
              SET    NSCCOTRN-AT-CHG TO TRUE                            CAT910  
           ELSE IF ACAT-ASSET-DELETE                                    CAT910  
              SET    NSCCOTRN-AT-DEL TO TRUE.                           CAT910  
           MOVE 'US'     TO   NSCCOTRN-AT-SEC-CNTRY-CD                  CAT910  
           IF   NSCCOTRN-AT-ASSET-PRC-CATG = 'FEQU'                     CAT910  
             MOVE '  '     TO   NSCCOTRN-AT-SEC-CNTRY-CD.               CAT910  
           IF   NOT ACAT-CUSIP-IS-CASH-BAL                              CAT910  
              MOVE ACAT-CUSIP-NUM TO  NSCCOTRN-AT-SEC-ID.               CAT910  
      *********  NSCCOTRN-AT-SEC-CHKDGT            PIC X(0001).         CAT910  
           MOVE ACAT-SEC-DESC-1 TO   NSCCOTRN-AT-ASSET-DESC             CAT910  
           MOVE 'F' TO  NSCCOTRN-AT-ASSET-QTY-RQIND.                    CAT910  
           MOVE '2' TO  NSCCOTRN-AT-ASSET-REQ-TRNCD.                    CAT910  
           MOVE ACAT-ASSET-QUAN-WHOLE-NUM TO W-SHARE-DIG                CAT910  
           MOVE ACAT-ASSET-QUAN-FRACTION  TO W-SHARE-FRA                CAT910  
           IF W-SHARE-DIG NOT NUMERIC                                   CAT910  
             MOVE 0                         TO W-SHARE-DIG.             CAT910  
           IF W-SHARE-FRA NOT NUMERIC                                   CAT910  
             MOVE 0                         TO W-SHARE-FRA.             CAT910  
           MOVE W-SHARE-AREA     TO  NSCCOTRN-AT-ASSET-QTY              CAT910  
           MOVE 0                         TO W-SHARE-DIG                CAT910  
           MOVE 0                         TO W-SHARE-FRA                CAT910  
           MOVE W-SHARE-AREA     TO  NSCCOTRN-AT-ASSET-PCT              CAT910  
           IF ACAT-SHORT-POSITION                                       CAT910  
             SET     NSCCOTRN-AT-SHORT-POS  TO TRUE                     CAT910  
           ELSE                                                         CAT910  
             SET     NSCCOTRN-AT-LONG-POS   TO TRUE.                    CAT910  
      *********  NSCCOTRN-AT-ISO-CURCY-CD          PIC X(0003).         CAT910  
           IF NSCCOTRN-AT-NON-OPT                                       CAT910  
               PERFORM CONVERT-SECOND-MF                                CAT910  
           ELSE                                                         CAT910  
               PERFORM CONVERT-SECOND-OPTION.                           CAT910  
                                                                        CAT910  
       CONVERT-THIRD-ASSET.                                             CAT910  
           IF ACAT-RI-NOT-DELETED                                       CAT910  
              SET    NSCCOTRN-AT-ADD TO TRUE                            CAT910  
           ELSE                                                         CAT910  
              SET    NSCCOTRN-AT-DEL TO TRUE.                           CAT910  
           IF ACAT-EQUITIES                                             CAT910  
             MOVE 'CORP' TO  NSCCOTRN-AT-ASSET-PRC-CATG                 CAT910  
           ELSE IF ACAT-FOREIGN-SECURITY                                CAT910  
             MOVE 'FEQU' TO  NSCCOTRN-AT-ASSET-PRC-CATG                 CAT910  
           ELSE IF ACAT-CORPORATE-BONDS                                 CAT910  
             MOVE 'CORP' TO  NSCCOTRN-AT-ASSET-PRC-CATG                 CAT910  
           ELSE IF ACAT-MUNICIPAL-BONDS                                 CAT910  
             MOVE 'MUNI' TO  NSCCOTRN-AT-ASSET-PRC-CATG                 CAT910  
           ELSE IF ACAT-MF-NON-MONEY-MRKT                               CAT910  
             MOVE 'MFNM' TO  NSCCOTRN-AT-ASSET-PRC-CATG                 CAT910  
           ELSE IF ACAT-MF-MONEY-MRKT                                   CAT910  
             MOVE 'MFMM' TO  NSCCOTRN-AT-ASSET-PRC-CATG                 CAT910  
           ELSE IF ACAT-ZERO-COUPON-BONDS                               CAT910  
             MOVE 'ZERO' TO  NSCCOTRN-AT-ASSET-PRC-CATG                 CAT910  
           ELSE IF ACAT-LIMITED-PARNERSHIPS                             CAT910  
             MOVE 'LPAR' TO  NSCCOTRN-AT-ASSET-PRC-CATG                 CAT910  
           ELSE IF ACAT-CDS-AND-COMMERCIAL-PAPER                        CAT910  
             MOVE 'CDCP' TO  NSCCOTRN-AT-ASSET-PRC-CATG                 CAT910  
           ELSE IF ACAT-GOVT-BONDS-US-AND-FGN                           CAT910  
             MOVE 'GOVT' TO  NSCCOTRN-AT-ASSET-PRC-CATG                 CAT910  
           ELSE IF ACAT-UITS                                            CAT910  
             MOVE 'UIT ' TO  NSCCOTRN-AT-ASSET-PRC-CATG                 CAT910  
           ELSE IF ACAT-MORTGAGED-BACKED                                CAT910  
             MOVE 'MBS ' TO  NSCCOTRN-AT-ASSET-PRC-CATG                 CAT910  
           ELSE                                                         CAT910  
             MOVE 'OTH ' TO  NSCCOTRN-AT-ASSET-PRC-CATG.                CAT910  
                                                                        CAT910  
           IF ACAT-SETTL-CNS                                            CAT910  
             SET     NSCCOTRN-AT-CNS   TO TRUE                          CAT910  
             MOVE  SPACES TO        NSCCOTRN-AT-STL-LOC-RSN-CD          CAT910  
           ELSE IF ACAT-SETTL-MF-BOOK-ENTRY                             CAT910  
             SET     NSCCOTRN-AT-FUND-SERV TO TRUE                      CAT910  
             MOVE  SPACES TO        NSCCOTRN-AT-STL-LOC-RSN-CD          CAT910  
           ELSE IF ACAT-SETTL-XCNS                                      CAT910  
             SET     NSCCOTRN-AT-R-D       TO TRUE                      CAT910  
             MOVE  'XSET' TO        NSCCOTRN-AT-STL-LOC-RSN-CD          CAT910  
           ELSE IF ACAT-SETTL-DELAYED-DELIVERY                          CAT910  
                 OR ACAT-SETTL-NON-CNS                                  CAT910  
             SET     NSCCOTRN-AT-R-D       TO TRUE                      CAT910  
             MOVE  'DDEL' TO        NSCCOTRN-AT-STL-LOC-RSN-CD          CAT910  
           ELSE IF ACAT-SETTL-NOT-DELIVERABLE                           CAT910  
             SET     NSCCOTRN-AT-UNDELIVERABLE TO TRUE                  CAT910  
             MOVE SPACES  TO        NSCCOTRN-AT-STL-LOC-RSN-CD          CAT910  
           ELSE IF ACAT-SETTL-CASH-BALANCE                              CAT910  
             SET     NSCCOTRN-AT-CASH-BALANCE  TO TRUE                  CAT910  
             MOVE 'CRED'  TO        NSCCOTRN-AT-STL-LOC-RSN-CD          CAT910  
             IF  ACAT-CUSIP-NUM = ALL '9'                               CAT910  
               MOVE 'DEB '  TO        NSCCOTRN-AT-STL-LOC-RSN-CD        CAT910  
             END-IF                                                     CAT910  
           ELSE IF ACAT-SETTL-OPTION                                    CAT910  
             SET     NSCCOTRN-AT-OCC           TO TRUE                  CAT910  
             MOVE 'OPT '  TO        NSCCOTRN-AT-STL-LOC-RSN-CD          CAT910  
           ELSE IF ACAT-SETTL-SAFEKEEPING                               CAT910  
             SET     NSCCOTRN-AT-R-D           TO TRUE                  CAT910  
             MOVE 'SFK '  TO        NSCCOTRN-AT-STL-LOC-RSN-CD          CAT910  
           ELSE IF ACAT-SETTL-UNDERLY-CASH-BAL                          CAT910  
             SET     NSCCOTRN-AT-MEMO          TO TRUE                  CAT910  
             MOVE 'CASH'  TO        NSCCOTRN-AT-STL-LOC-RSN-CD          CAT910  
           ELSE IF ACAT-SETTL-EXPIRING-OPTION                           CAT910  
             SET     NSCCOTRN-AT-OCC           TO TRUE                  CAT910  
             MOVE 'EXPO'  TO        NSCCOTRN-AT-STL-LOC-RSN-CD          CAT910  
           ELSE IF ACAT-SETTL-MEMO                                      CAT910  
             SET     NSCCOTRN-AT-MEMO          TO TRUE                  CAT910  
             MOVE 'COMT'  TO        NSCCOTRN-AT-STL-LOC-RSN-CD          CAT910  
           ELSE IF ACAT-SETTL-SMA                                       CAT910  
             SET     NSCCOTRN-AT-MEMO          TO TRUE                  CAT910  
             MOVE 'SMA '  TO        NSCCOTRN-AT-STL-LOC-RSN-CD          CAT910  
           ELSE IF ACAT-SETTL-UNDERLY-SECURITY                          CAT910  
             SET     NSCCOTRN-AT-MEMO          TO TRUE                  CAT910  
             IF NOT NSCCOTRN-AT-NON-OPT                                 CAT910  
               SET NSCCOTRN-AT-OCC   TO TRUE                            CAT910  
             END-IF                                                     CAT910  
             MOVE 'USEC'  TO        NSCCOTRN-AT-STL-LOC-RSN-CD          CAT910  
           ELSE IF ACAT-SETTL-RESTRICTED-SEC                            CAT910  
             SET     NSCCOTRN-AT-R-D           TO TRUE                  CAT910  
             MOVE 'RSEC'  TO        NSCCOTRN-AT-STL-LOC-RSN-CD.         CAT910  
                                                                        CAT910  
           MOVE ACAT-ASSET-VALUE          TO W-SHARE-DIG                CAT910  
           MOVE ACAT-ASSET-VALUE          TO W-SHARE-FRA                CAT910  
           IF W-SHARE-DIG NOT NUMERIC                                   CAT910  
             MOVE 0                         TO W-SHARE-DIG.             CAT910  
           IF W-SHARE-FRA NOT NUMERIC                                   CAT910  
             MOVE 0                         TO W-SHARE-FRA.             CAT910  
           MOVE W-SHARE-AREA     TO  NSCCOTRN-AT-ASSET-AMT              CAT910  
           MOVE 'N'  TO  NSCCOTRN-AT-BEARER-BOND                        CAT910  
                         NSCCOTRN-AT-WHN-ISS-IND.                       CAT910  
           IF  ACAT-BEARER-BOND                                         CAT910  
             MOVE 'B'   TO NSCCOTRN-AT-BEARER-BOND.                     CAT910  
           IF  ACAT-WHEN-ISSUE                                          CAT910  
             MOVE 'W'   TO NSCCOTRN-AT-WHN-ISS-IND.                     CAT910  
                                                                        CAT910  
           IF ACAT-MARGIN-ACT                                           CAT910  
              SET    NSCCOTRN-AT-MARGIN  TO TRUE                        CAT910  
           ELSE IF ACAT-SHORT-ACT                                       CAT910  
              SET    NSCCOTRN-AT-SHORT   TO TRUE                        CAT910  
           ELSE                                                         CAT910  
              SET    NSCCOTRN-AT-CASH    TO TRUE.                       CAT910  
           MOVE ACAT-MF-RES-CREDIT-DESC-IND TO                          CAT910  
                                        NSCCOTRN-AT-TFR-TYPE-RSN.       CAT910  
      *********  NSCCOTRN-AT-MBS-SER-NT             PIC X(0003).        CAT910  
             MOVE ' '                TO                                 CAT910  
                                        NSCCOTRN-AT-ASSET-COMMENT.      CAT910  
           MOVE ACAT-SEC-DESC-2 TO   NSCCOTRN-AT-ASSET-DESC(97 : 24).   CAT910  
           IF NSCCOTRN-AT-NON-OPT                                       CAT910  
                 PERFORM CONVERT-THIRD-MF                               CAT910  
           ELSE                                                         CAT910  
                 PERFORM CONVERT-THIRD-OPTION.                          CAT910  
      ******************************************************************CAT910  
       CONVERT-SECOND-OPTION.                                           CAT910  
           MOVE ACAT-OPTION-SYMBOL    TO                                CAT910  
                            NSCCOTRN-ATO-OPT-SYM                        CAT910  
           MOVE ACAT-OPTION-DEL-BKR-NO TO                               CAT910  
                                  NSCCOTRN-ATO-OPT-OCC-DEL-NBR.         CAT910  
       CONVERT-THIRD-OPTION.                                            CAT910  
                                                                        CAT910  
           IF ACAT-OPT-BUY                                              CAT910  
              SET  NSCCOTRN-ATO-OPT-BUY TO TRUE                         CAT910  
           ELSE                                                         CAT910  
              SET  NSCCOTRN-ATO-OPT-SELL TO TRUE.                       CAT910  
           MOVE ACAT-OPT-PUT-CALL TO    NSCCOTRN-ATO-OPT-PC-IND.        CAT910  
           IF ACAT-OPT-OPEN                                             CAT910  
              SET NSCCOTRN-ATO-OPT-OPEN TO TRUE                         CAT910  
           ELSE IF ACAT-OPT-CLOSE                                       CAT910  
               SET NSCCOTRN-ATO-OPT-CLOSE TO TRUE.                      CAT910  
           MOVE ACAT-OPT-EXP-MM                                         CAT910  
               TO  NSCCOTRN-ATO-OPT-EXP-DT(1 : 2).                      CAT910  
           MOVE  ACAT-OPT-EXP-Y                                         CAT910  
               TO  NSCCOTRN-ATO-OPT-EXP-DT(4 : 1).                      CAT910  
           IF ACAT-OPT-EXP-Y < '8'                                      CAT910  
             MOVE '0'  TO  NSCCOTRN-ATO-OPT-EXP-DT(3 : 1)               CAT910  
             MOVE '20' TO  NSCCOTRN-ATO-OPT-EXP-DT(5 : 2)               CAT910  
           ELSE                                                         CAT910  
             MOVE '9'  TO  NSCCOTRN-ATO-OPT-EXP-DT(3 : 1)               CAT910  
             MOVE '19' TO  NSCCOTRN-ATO-OPT-EXP-DT(5 : 2).              CAT910  
               MOVE '00'     TO NSCCOTRN-ATO-OPT-STKPRC-INT(1 : 2)      CAT910  
               MOVE ACAT-OPT-PRICE                                      CAT910  
                                  TO NSCCOTRN-ATO-OPT-STKPRC-INT(3 : 3).CAT910  
               MOVE '0' TO NSCCOTRN-ATO-OPT-STKPRC-FRC(1 : 1).          CAT910  
               MOVE  ACAT-OPT-1-8TH-PRCE                                CAT910  
                    TO  NSCCOTRN-ATO-OPT-STKPRC-FRC(2 : 1).             CAT910  
               IF    ACAT-OPT-1-8TH-PRCE = ' '                          CAT910  
                 MOVE '0'   TO  NSCCOTRN-ATO-OPT-STKPRC-FRC(2 : 1).     CAT910  
            SET   NSCCOTRN-ATO-OPT-CUST  TO TRUE.                       CAT910  
      *******      88  NSCCOTRN-ATO-OPT-FIRM       VALUE 'F'.           CAT910  
      *******      88  NSCCOTRN-ATO-OPT-MARKET     VALUE 'M'.           CAT910  
              MOVE ACAT-REC-OCC-BKR-NO                                  CAT910  
                        TO  NSCCOTRN-ATO-SUB-ACCT-ID.                   CAT910  
              MOVE ' '                 TO                               CAT910  
                                          NSCCOTRN-ATO-OPT-COMMENT.     CAT910  
                                                                        CAT910  
       CONVERT-SECOND-MF.                                               CAT910  
            SET        NSCCOTRN-ATF-FULL-TFR  TO TRUE.                  CAT910  
            MOVE ACAT-MF-CUST-ACCT-AT-FUND   TO                         CAT910  
                                          NSCCOTRN-ATF-CUS-ACCT.        CAT910  
            MOVE ACAT-BOOK-PHYS-SHARE-IND    TO                         CAT910  
                                          NSCCOTRN-ATF-PHSCL-SHR-IND.   CAT910  
            MOVE ACAT-NETWORK-CNTL-IND       TO                         CAT910  
                                        NSCCOTRN-ATF-NTWRK-CTL-IND      CAT910  
            MOVE ACAT-ACCOUNT-TYPE-IND       TO                         CAT910  
                                        NSCCOTRN-ATF-ACCT-TYP-IND       CAT910  
            MOVE ACAT-MF-DIVIDEND-CODE       TO                         CAT910  
                                         NSCCOTRN-ATF-DIV-CD            CAT910  
            MOVE ACAT-MF-DIV-PAYEE-TYPE      TO                         CAT910  
                                          NSCCOTRN-ATF-DIV-PAYEE-IND    CAT910  
            MOVE ACAT-DELIVER-EXEC-BROKER    TO                         CAT910  
                                         NSCCOTRN-ATF-EXEC-BRKR.        CAT910  
       CONVERT-THIRD-MF.                                                CAT910  
            MOVE ACAT-MF-ACCT-LAST6   TO                                CAT910  
                                 NSCCOTRN-ATF-CUS-ACCT(13 : 6).         CAT910  
       CLEAN-NAME.                                                      CAT910  
           SET IWNWN TO 1. SET IWNWN DOWN BY 1.                         CAT910  
           MOVE SPACE   TO W-NAME-WORKNEW.                              CAT910  
                                                                        CAT910  
           PERFORM VARYING IWNW FROM 1 BY 1                             CAT910  
              UNTIL IWNW > 20                                           CAT910  
              IF  W-N-W (IWNW)  = '-' OR ' '                            CAT910  
               CONTINUE                                                 CAT910  
              ELSE                                                      CAT910  
               SET IWNWN UP BY 1                                        CAT910  
               MOVE W-N-W (IWNW)    TO W-N-WN(IWNWN)                    CAT910  
              END-IF                                                    CAT910  
           END-PERFORM.                                                 CAT910  
                                                                        CAT910  
