000001* PDX    - CAT912   C0151283 12/18/00 13:46:13 TBTIKUO            00001000
000001* PDX    - CAT912   C0119911 01/15/99 12:48:33 TBYOHON            00001000
000001* PDX    - CAT912   C0119637 12/23/98 14:28:18 TBYOHON            00001000
000001* PDX    - CAT912   C0116408 11/02/98 10:56:05 TBDOJUN            00001000
      * PDX    - CAT912   C0115988 10/10/98 09:26:23 TBYOHON            CAT912  
       IDENTIFICATION DIVISION.                                         CAT912  
       PROGRAM-ID.  CAT912.                                             CAT912  
      **** THIS IS TO CREATE ADDITION/CAHNGE/DELETE/REJECT              CAT912  
      **** FROM SIAC103 FILE IN NSCC MRO MULTI CYCLE TRANSACTION        CAT912  
      **** FORMAT.                                                      CAT912  
       ENVIRONMENT DIVISION.                                            CAT912  
       INPUT-OUTPUT SECTION.                                            CAT912  
       FILE-CONTROL.                                                    CAT912  
                                                                        CAT912  
           SELECT NSCCFILE         ASSIGN       TO NSCCFILE.            CAT912  
           SELECT S103FILE         ASSIGN       TO S103FILE.            CAT912  
                                                                        CAT912  
       DATA DIVISION.                                                   CAT912  
       FILE SECTION.                                                    CAT912  
       FD  NSCCFILE                                                     CAT912  
           RECORDING MODE IS V                                          CAT912  
           BLOCK CONTAINS 0 RECORDS.                                    CAT912  
       01  NSCCOTRN-TI-RECORD   PIC X(0481).                            CAT912  
       01  NSCCOTRN-AT-REG-RECORD   PIC X(0585).                        CAT912  
       01  NSCCOTRN-AT-OPT-RECORD   PIC X(0651).                        CAT912  
       01  NSCCOTRN-AT-MFD-RECORD   PIC X(0619).                        CAT912  
       01  NSCCOTRN-FR-MFR-RECORD   PIC X(3268).                        CAT912  
       01  DUMMY-LARGE-RECORD       PIC X(4000).                        CAT912  
                                                                        CAT912  
           COPY NSCCMHDR REPLACING ==:NSCCMHDR:== BY ==NSCCOHDR==.      CAT912  
                                                                        CAT912  
           COPY NSCCMTRL REPLACING ==:NSCCMTRL:== BY ==NSCCOTRL==.      CAT912  
                                                                        CAT912  
                                                                        CAT912  
       FD  S103FILE.                                                    CAT912  
           COPY SIAC103.                                                CAT912  
                                                                        CAT912  
       WORKING-STORAGE SECTION.                                         CAT912  
       COPY PDXIDCOB.                                                   CAT912  
                                                                        CAT912  
           COPY NSCCMTRN REPLACING ==:NSCCMTRN:== BY ==NSCCOTRN==.      CAT912  
                                                                        CAT912  
       01  W-TI-RECORD   PIC X(0481).                                   CAT912  
       01  W-AT-RECORD   PIC X(3268).                                   CAT912  
       01  W-FIELDS.                                                    CAT912  
           05 W-SHARE-AREA.                                             CAT912  
             10 FILLER.                                                 CAT912  
                15 FILLER   PIC X(3) VALUE '000'.                       CAT912  
                15 W-SHARE-DIG  PIC 9(9).                               CAT912  
             10 FILLER      PIC X VALUE ','.                            CAT912  
             10 W-SHARE-FRA    PIC V9(4) VALUE 0.                       CAT912  
           05 W-NUM-4-A    PIC X(4).                                    CAT912  
           05 W-NUM-4-N REDEFINES W-NUM-4-A PIC 9(4).                   CAT912  
           05 WS-NUM-3-A    PIC X(3).                                   CAT912  
           05 WS-NUM-3-N REDEFINES WS-NUM-3-A PIC 9(3).                 CAT912  
           05 SAVE-CLR-NO      PIC X(4) VALUE '0000'.                   CAT912  
           05 W-CTL-NO.                                                 CAT912  
              10 W-CTL-NO-CCYY  PIC X(4).                               CAT912  
              10 W-CTL-NO-DDD   PIC X(3).                               CAT912  
              10 W-CTL-NO-SEQ   PIC X(7).                               CAT912  
           05  W-FIRST-TIME-SW           PIC  X(001) VALUE '0'.         CAT912  
               88 NOT-FIRST-TIME                     VALUE '1'.         CAT912  
           05  W-CHANGE-IND              PIC  X(001) VALUE '0'.         CAT912  
               88 THIS-IS-CHANGE                     VALUE 'C'.         CAT912  
               88 THIS-IS-ADD                        VALUE 'A'.         CAT912  
               88 THIS-IS-REJECT                     VALUE 'R'.         CAT912  
               88 THIS-IS-DELETE                     VALUE 'D'.         CAT912  
           05  END-OF-NSCCFILE-SW        PIC  X(001) VALUE '0'.         CAT912  
               88 END-OF-NSCCFILE                    VALUE '1'.         CAT912  
           05  NSCCFILE-STAT             PIC  X(002).                   CAT912  
               88 NSCCFILE-OKAY          VALUE '00' THRU '09', '97'.    CAT912  
               88 NSCCFILE-END-OF-FILE   VALUE '10'.                    CAT912  
               88 NSCCFILE-EMPTY-MISSING VALUE '35'.                    CAT912  
           05  NSCCFILE-DATE-SW          PIC  X(001) VALUE ' '.         CAT912  
               88 NSCCFILE-DATE-FOUND                VALUE 'Y'.         CAT912  
           05  ACATLOG-STAT              PIC  X(002).                   CAT912  
               88 ACATLOG-OKAY           VALUE '00' THRU '09', '97'.    CAT912  
               88 ACATLOG-END-OF-FILE    VALUE '10'.                    CAT912  
               88 ACATLOG-DUP-REC        VALUE '22'.                    CAT912  
               88 ACATLOG-NOTFND         VALUE '23'.                    CAT912  
               88 ACATLOG-EMPTY-MISSING  VALUE '35'.                    CAT912  
           05  W-TABLE-ENTRY-CNT         PIC  9(003) VALUE 0.           CAT912  
TCK001     05  ABEND-CD                  PIC S9(004) COMP SYNC VALUE 0. CAT912  
TCK001*    05  DUMP-SW                   PIC  X(001) VALUE 'D'.         CAT912  
           05  W-SYS-DATE                PIC  9(006) VALUE 0.           CAT912  
           05  FILLER  REDEFINES                                        CAT912  
               W-SYS-DATE.                                              CAT912  
               10  W-UPD-DATE            PIC  X(006).                   CAT912  
           05  W-SYS-TIME                PIC  9(008) VALUE 0.           CAT912  
           05  FILLER  REDEFINES                                        CAT912  
               W-SYS-TIME.                                              CAT912  
               10  W-UPD-TIME            PIC  X(006).                   CAT912  
               10  W-UPD-TIME-MS         PIC  X(002).                   CAT912  
           05  LD-PROC-DATE.                                            CAT912  
               10 LD-PROC-DATE-MM        PIC  X(002).                   CAT912  
               10 LD-PROC-DATE-DD        PIC  X(002).                   CAT912  
               10 LD-PROC-DATE-YY        PIC  X(002).                   CAT912  
           05  W-HDR-TRL-SW              PIC  X(001) VALUE 'T'.         CAT912  
               88 HDR-FOUND                          VALUE 'H'.         CAT912  
               88 TRL-FOUND                          VALUE 'T'.         CAT912  
           05  W-BRK-SW                  PIC  X(001) VALUE ' '.         CAT912  
               88 BRK-FOUND                          VALUE 'Y'.         CAT912  
           05  FILLER                    PIC  X(008) VALUE 'INPUTCNT'.  CAT912  
           05  W-NSCCFILE-CNT            PIC  9(009) VALUE 0.           CAT912  
           05  W-NCHGFILE-CNT            PIC  9(009) VALUE 0.           CAT912  
           05  FILLER                    PIC  X(008) VALUE 'DETAILCT'.  CAT912  
           05  W-DETAIL-CNT              PIC  9(011) VALUE 0.           CAT912  
           05  FILLER                    PIC  X(008) VALUE 'W-SUB1  '.  CAT912  
           05  W-SUB1                    PIC  9(004) VALUE 0.           CAT912  
           05  FILLER                    PIC  X(008) VALUE 'RECLENIN'.  CAT912  
           05  W-REC-LEN-IN              PIC  9(005) VALUE 0.           CAT912  
           05  FILLER                    PIC  X(008) VALUE 'NEWCYCLE'.  CAT912  
           05  W-NAME-WORK.                                             CAT912  
              10 W-N-W OCCURS 20 TIMES INDEXED BY IWNW   PIC X.         CAT912  
           05  W-NAME-WORKNEW.                                          CAT912  
              10 W-N-WN OCCURS 20 TIMES INDEXED BY IWNWN PIC X.         CAT912  
           05  W-NEXT-CYCLE.                                            CAT912  
               07  W-NEXT-CYCLE-N        PIC  9(004) VALUE 0.           CAT912  
           COPY BPDATESC.                                               CAT912  
TCK001     COPY STUBCPY.                                                        
       LINKAGE SECTION.                                                 CAT912  
       01  L-JCL-PARMS.                                                 CAT912  
           05  PARMLENGTH                PIC S9(004) COMP SYNC.         CAT912  
           05  L-STREAM                  PIC  X(001).                   CAT912  
               88  L-NEW-TRANSFER                    VALUE 'Y'.         CAT912  
           05  L-BYP-CYCLE-SW            PIC  X(001).                   CAT912  
               88  L-NEW-PARTIAL                     VALUE 'Y'.         CAT912  
       PROCEDURE DIVISION USING L-JCL-PARMS.                            CAT912  
      *                         ===========                             CAT912  
           COPY MSGCOBO.                                                CAT912  
           MOVE 'CAT912'                  TO BPDATES-CALLING-PGM.       CAT912  
           SET  LNKDATZ-REQUEST           TO TRUE.                      CAT912  
TCK001     CALL  BPDATES  USING BPDATES-PARAMETERS.                     CAT912  
           MOVE BPD-PROC-DATE(3:2)        TO LD-PROC-DATE-YY.           CAT912  
           MOVE BPD-PROC-DATE(5:2)        TO LD-PROC-DATE-MM.           CAT912  
           MOVE BPD-PROC-DATE(7:2)        TO LD-PROC-DATE-DD.           CAT912  
           MOVE BPD-PROC-DATE(1:4)        TO W-CTL-NO-CCYY.             CAT912  
                                                                        CAT912  
           OPEN INPUT S103FILE                                          CAT912  
                OUTPUT NSCCFILE.                                        CAT912  
                                                                        CAT912  
           PERFORM 3000-READ-INPUT                                      CAT912  
                                                                        CAT912  
           PERFORM 1000-PROCESS                                         CAT912  
                       UNTIL  END-OF-NSCCFILE                           CAT912  
                                                                        CAT912  
           CLOSE NSCCFILE S103FILE.                                     CAT912  
                                                                        CAT912  
           GOBACK.                                                      CAT912  
                                                                        CAT912  
       1000-PROCESS.                                                    CAT912  
           IF  HEADER                                                   CAT912  
             MOVE ACAT-HDR-BROKER-CLR-NO   TO SAVE-CLR-NO               CAT912  
      *      IF SAVE-CLR-NO = '0573' OR '0057'                          CAT912  
                 PERFORM CONVERT-HEADER                                 CAT912  
                 PERFORM 3000-READ-INPUT                                CAT912  
                 PERFORM 2000-PROCESS                                   CAT912  
                       UNTIL  END-OF-NSCCFILE                           CAT912  
                          OR  TRAILER                                   CAT912  
                 PERFORM CONVERT-TRAILER                                CAT912  
                 PERFORM 3000-READ-INPUT                                CAT912  
      *       ELSE                                                      CAT912  
      *          PERFORM 3000-READ-INPUT                                CAT912  
      *                UNTIL  END-OF-NSCCFILE                           CAT912  
      *                   OR  ACAT-HDR-BROKER-CLR-NO NOT = SAVE-CLR-NO  CAT912  
      *       END-IF                                                    CAT912  
            ELSE                                                        CAT912  
               PERFORM 3000-READ-INPUT                                  CAT912  
                     UNTIL  END-OF-NSCCFILE                             CAT912  
                        OR  HEADER                                      CAT912  
           END-IF.                                                      CAT912  
                                                                        CAT912  
       2000-PROCESS.                                                    CAT912  
                                                                        CAT912  
           IF  ACAT-CONTROL                                             CAT912  
               PERFORM CONVERT-TRANSFER                                 CAT912  
           ELSE                                                         CAT912  
           IF  ACAT-ASSET                                               CAT912  
             IF ACAT-NEW-DEFAULT-REG OR ACAT-OLD-DEFAULT-REG            CAT912  
              OR ACAT-NEW-BROKER-REG OR ACAT-REJECT-OF-REG              CAT912  
               PERFORM CONVERT-MFREG                                    CAT912  
             ELSE                                                       CAT912  
               PERFORM CONVERT-ASSET                                    CAT912  
             END-IF                                                     CAT912  
           ELSE                                                         CAT912  
             IF  ACAT-SETTLEMENT                                        CAT912  
               PERFORM CONVERT-SETTLEMENT                               CAT912  
             ELSE                                                       CAT912  
               DISPLAY '        ' ACAT-IN-FILE-AREA                     CAT912  
               DISPLAY ' BAD REC-TYPE'                                  CAT912  
             END-IF                                                     CAT912  
             PERFORM 3000-READ-INPUT 3 TIMES                            CAT912  
           END-IF.                                                      CAT912  
                                                                        CAT912  
       3000-READ-INPUT.                                                 CAT912  
                                                                        CAT912  
           READ S103FILE                                                CAT912  
             AT END                                                     CAT912  
                   MOVE '1'              TO END-OF-NSCCFILE-SW          CAT912  
             NOT AT END                                                 CAT912  
                   IF  ACAT-REC-ID = 'H' OR '1' OR '2' OR '3' OR 'T'    CAT912  
                    CONTINUE                                            CAT912  
                   ELSE                                                 CAT912  
                    GO TO 3000-READ-INPUT                               CAT912  
                   END-IF                                               CAT912  
           END-READ.                                                    CAT912  
                                                                        CAT912  
       CONVERT-SETTLEMENT.                                              CAT912  
           MOVE 'H'         TO  NSCCOHDR-REC-TYPE.                      CAT912  
                                                                        CAT912  
       CONVERT-HEADER.                                                  CAT912  
                                                                        CAT912  
           MOVE 'H'         TO  NSCCOHDR-REC-TYPE.                      CAT912  
           MOVE  '0061'     TO NSCCOHDR-REC-LEN.                        CAT912  
           MOVE '02070716'  TO  NSCCOHDR-AUTORTE-PROD-ID                CAT912  
           MOVE  'MULTI-CYLE TRANSACTION MRO'                           CAT912  
                            TO  NSCCOHDR-FILE-DESC                      CAT912  
           MOVE SAVE-CLR-NO  TO NSCCOHDR-DIST-SIDE.                     CAT912  
           MOVE BPD-PROC-DATE TO NSCCOHDR-PROC-DATE                     CAT912  
           MOVE 'N'         TO NSCCOHDR-MULTI-CYCLE-IND.                CAT912  
           MOVE '0001'      TO NSCCOHDR-MULTI-CYCLE-NBR.                CAT912  
           MOVE '*'         TO NSCCOHDR-VAR-LEN-REC-IND.                CAT912  
           ADD  1                TO W-NSCCFILE-CNT                      CAT912  
           WRITE NSCCOHDR-RECORD.                                       CAT912  
                                                                        CAT912  
                                                                        CAT912  
       CONVERT-TRAILER.                                                 CAT912  
                                                                        CAT912  
           MOVE 'T'         TO  NSCCOTRL-REC-TYPE.                      CAT912  
           MOVE  '0070'     TO NSCCOTRL-REC-LEN.                        CAT912  
           MOVE '02070716'  TO  NSCCOTRL-AUTORTE-PROD-ID                CAT912  
           MOVE  'MULTI-CYLE TRANSACTION MRO'                           CAT912  
                            TO  NSCCOTRL-FILE-DESC                      CAT912  
           MOVE SAVE-CLR-NO  TO NSCCOTRL-DIST-SIDE.                     CAT912  
           MOVE BPD-PROC-DATE TO NSCCOTRL-PROC-DATE                     CAT912  
           MOVE 'N'         TO NSCCOTRL-MULTI-CYCLE-IND.                CAT912  
           MOVE '0001'      TO NSCCOTRL-MULTI-CYCLE-NBR.                CAT912  
           MOVE '*'         TO NSCCOTRL-VAR-LEN-REC-IND.                CAT912  
           ADD  1                TO W-NSCCFILE-CNT                      CAT912  
           MOVE  W-NSCCFILE-CNT         TO  NSCCOTRL-ITEM-CNT.          CAT912  
           MOVE 0                        TO W-NSCCFILE-CNT              CAT912  
                                                                        CAT912  
           WRITE NSCCOTRL-RECORD.                                       CAT912  
                                                                        CAT912  
       CONVERT-TRANSFER.                                                CAT912  
                                                                        CAT912  
           MOVE ' '    TO W-CHANGE-IND.                                 CAT912  
           PERFORM CONVERT-COMMON.                                      CAT912  
           PERFORM CONVERT-FIRST-CONTROL.                               CAT912  
                                                                        CAT912  
           PERFORM 3000-READ-INPUT                                      CAT912  
           PERFORM CONVERT-SECOND-CONTROL.                              CAT912  
                                                                        CAT912  
           PERFORM 3000-READ-INPUT                                      CAT912  
           PERFORM CONVERT-THIRD-CONTROL.                               CAT912  
                                                                        CAT912  
           PERFORM 3000-READ-INPUT                                      CAT912  
           IF THIS-IS-ADD OR NSCCOTRN-TI-REJECT                         CAT912  
             ADD  1                TO W-NSCCFILE-CNT                    CAT912  
             WRITE NSCCOTRN-TI-RECORD FROM NSCCOTRN-RECORD.             CAT912  
                                                                        CAT912  
                                                                        CAT912  
       CONVERT-ASSET.                                                   CAT912  
                                                                        CAT912  
           MOVE SPACE TO NSCCOTRN-RECORD.                               CAT912  
           MOVE ' '    TO W-CHANGE-IND.                                 CAT912  
           PERFORM CONVERT-COMMON.                                      CAT912  
           PERFORM CONVERT-FIRST-ASSET.                                 CAT912  
                                                                        CAT912  
           PERFORM 3000-READ-INPUT                                      CAT912  
           PERFORM CONVERT-SECOND-ASSET.                                CAT912  
                                                                        CAT912  
           PERFORM 3000-READ-INPUT                                      CAT912  
           PERFORM CONVERT-THIRD-ASSET.                                 CAT912  
           MOVE NSCCOTRN-RECORD  TO W-AT-RECORD.                        CAT912  
           MOVE W-AT-RECORD    TO NSCCOTRN-RECORD.                      CAT912  
           IF        NSCCOTRN-AT-CHG                                    CAT912  
             OR      NSCCOTRN-AT-DEL                                    CAT912  
             OR      NSCCOTRN-AT-ADD                                    CAT912  
             ADD  1                TO W-NSCCFILE-CNT                    CAT912  
             IF NSCCOTRN-AT-STL-LOC = '10'                              CAT912  
                SET NSCCOTRN-AT-MF-LEN   TO TRUE                        CAT912  
                MOVE NSCCOTRN-REC-LEN   TO NSCCOTRN-AT-REC-LEN          CAT912  
                WRITE NSCCOTRN-AT-MFD-RECORD FROM NSCCOTRN-RECORD       CAT912  
             ELSE IF NSCCOTRN-AT-STL-LOC = '35'                         CAT912  
                SET NSCCOTRN-AT-OP-LEN   TO TRUE                        CAT912  
                MOVE NSCCOTRN-REC-LEN   TO NSCCOTRN-AT-REC-LEN          CAT912  
                WRITE NSCCOTRN-AT-OPT-RECORD FROM NSCCOTRN-RECORD       CAT912  
               ELSE                                                     CAT912  
                SET NSCCOTRN-AT-LEN   TO TRUE                           CAT912  
                MOVE NSCCOTRN-REC-LEN   TO NSCCOTRN-AT-REC-LEN          CAT912  
                WRITE NSCCOTRN-AT-REG-RECORD FROM NSCCOTRN-RECORD       CAT912  
                  END-IF                                                CAT912  
             END-IF                                                     CAT912  
           END-IF.                                                      CAT912  
           PERFORM 3000-READ-INPUT.                                     CAT912  
                                                                        CAT912  
       CONVERT-MFREG.                                                   CAT912  
                                                                        CAT912  
           PERFORM CONVERT-COMMON.                                      CAT912  
           PERFORM 3000-READ-INPUT                                      CAT912  
           PERFORM 3000-READ-INPUT                                      CAT912  
           PERFORM 3000-READ-INPUT.                                     CAT912  
                                                                        CAT912  
       CONVERT-COMMON.                                                  CAT912  
                                                                        CAT912  
           INITIALIZE  NSCCOTRN-RECORD.                                 CAT912  
           MOVE 'M'  TO  NSCCOTRN-REC-TYPE.                             CAT912  
           IF  ACAT-CONTROL                                             CAT912  
              SET  NSCCOTRN-TRANSFER-OUTPUT TO TRUE                     CAT912  
              SET  NSCCOTRN-TI-LEN          TO TRUE                     CAT912  
              MOVE 0           TO NSCCOTRN-ASSET-SEQ-NBR                CAT912  
           ELSE IF  ACAT-ASSET                                          CAT912  
              SET  NSCCOTRN-ASSET-OUTPUT TO TRUE                        CAT912  
              SET  NSCCOTRN-AT-LEN       TO TRUE                        CAT912  
              IF  NOT ACAT-NON-OPTION                                   CAT912  
                    SET NSCCOTRN-AT-OP-LEN   TO TRUE                    CAT912  
              END-IF                                                    CAT912  
              MOVE ACAT-ASSET-SEQ-NO  TO W-NUM-4-A                      CAT912  
              MOVE W-NUM-4-N   TO NSCCOTRN-ASSET-SEQ-NBR                CAT912  
      *****88  NSCCOTRN-AT-MF-LEN              VALUE '0619'.            CAT912  
           END-IF.                                                      CAT912  
           SET     NSCCOTRN-PHYSICAL-SEQ-DEFAULT TO TRUE                CAT912  
           SET     NSCCOTRN-LOGICAL-SEQ-DEFAULT   TO TRUE               CAT912  
           IF  ACAT-CLNT-IS-RECEIVER                                    CAT912  
               SET NSCCOTRN-ORIGINAL-RECEIVER  TO TRUE                  CAT912  
           ELSE                                                         CAT912  
              SET  NSCCOTRN-ORIGINAL-DELIVERER    TO TRUE.              CAT912  
      ***********  NSCCOTRN-BOTH-ORIG-REC-DEL      VALUE 'B'.           CAT912  
           MOVE ACAT-CONTROL-NUM (1 : 3) TO  W-CTL-NO-DDD.              CAT912  
           MOVE '1999'     TO W-CTL-NO-CCYY                                     
           IF  W-CTL-NO-DDD > '200'                                             
           AND W-CTL-NO-DDD < '400'                                             
             MOVE '1998'     TO W-CTL-NO-CCYY.                                  
           MOVE ACAT-CONTROL-NUM (4 : 5) TO  W-CTL-NO-SEQ(3 : 5)        CAT912  
           MOVE '00'                 TO  W-CTL-NO-SEQ(1 : 2)            CAT912  
           MOVE  W-CTL-NO            TO  NSCCOTRN-ACAT-CTL-NBR.         CAT912  
      ******** NEED TO MODIFY THIS ROUTINE FIRST                        CAT912  
           MOVE BPD-PROC-DATE        TO NSCCOTRN-PROC-DATE.             CAT912  
           MOVE '01'       TO  NSCCOTRN-CYCLE.                          CAT912  
           MOVE SAVE-CLR-NO   TO NSCCOTRN-DIST-PARTICIPANT              CAT912  
           IF ACAT-NOT-REJECTED                                         CAT912  
             SET   NSCCOTRN-ACCEPTED TO TRUE                            CAT912  
           ELSE                                                         CAT912  
             SET   NSCCOTRN-REJECTED TO TRUE.                           CAT912  
      ***********  NSCCOTRN-MODIFIED               VALUE '3'.           CAT912  
           MOVE ACAT-DAYS-CURRENT-STATUS   TO WS-NUM-3-A.               CAT912  
           IF ACAT-NEW                                                  CAT912  
             IF  ACAT-NOT-PAST-DUE                                      CAT912  
              SET  NSCCOTRN-REQ TO TRUE                                 CAT912  
              MOVE WS-NUM-3-N   TO NSCCOTRN-DAYS-IN-STATUS              CAT912  
              IF  ACAT-CONTROL                                          CAT912  
               AND WS-NUM-3-N  = 1                                      CAT912  
                SET THIS-IS-ADD TO TRUE                                 CAT912  
              END-IF                                                    CAT912  
            ELSE                                                        CAT912  
              SET  NSCCOTRN-REQ-PAST   TO TRUE                          CAT912  
              SUBTRACT 3 FROM WS-NUM-3-N GIVING NSCCOTRN-DAYS-IN-STATUS CAT912  
            END-IF                                                      CAT912  
           END-IF.                                                      CAT912  
           IF ACAT-PEND                                                 CAT912  
            IF ACAT-NOT-REJECTED                                        CAT912  
              SET  NSCCOTRN-REVIEW TO TRUE                              CAT912  
              MOVE WS-NUM-3-N   TO NSCCOTRN-DAYS-IN-STATUS              CAT912  
              IF  ACAT-ASSET                                            CAT912  
               AND WS-NUM-3-N  = 1                                      CAT912  
                SET THIS-IS-ADD TO TRUE                                 CAT912  
              END-IF                                                    CAT912  
            ELSE                                                        CAT912  
              SET  NSCCOTRN-REVIEW-ERROR TO TRUE                        CAT912  
              MOVE WS-NUM-3-N   TO NSCCOTRN-DAYS-IN-STATUS              CAT912  
            END-IF                                                      CAT912  
           END-IF.                                                      CAT912  
           IF ACAT-PEND-ADJ                                             CAT912  
              SET  NSCCOTRN-REVIEW-ADJ TO TRUE                          CAT912  
              MOVE WS-NUM-3-N   TO NSCCOTRN-DAYS-IN-STATUS              CAT912  
           END-IF.                                                      CAT912  
           IF ACAT-SETTLE                                               CAT912  
              MOVE WS-NUM-3-N   TO NSCCOTRN-DAYS-IN-STATUS              CAT912  
              SET  NSCCOTRN-SETTLE-PREP TO TRUE.                        CAT912  
           IF ACAT-CLOSED                                               CAT912  
              MOVE WS-NUM-3-N   TO NSCCOTRN-DAYS-IN-STATUS              CAT912  
              SET  NSCCOTRN-CLOSE-PURGE TO TRUE.                        CAT912  
           IF ACAT-REJECTED                                             CAT912  
              SET  NSCCOTRN-REJECT TO TRUE.                             CAT912  
            SET  NSCCOTRN-PARTICIPANT-REG TO TRUE.                      CAT912  
                                                                        CAT912  
       CONVERT-FIRST-CONTROL.                                           CAT912  
            MOVE SPACES   TO  NSCCOTRN-TI-BODY.                         CAT912  
            MOVE W-CTL-NO TO  NSCCOTRN-TI-ACAT-CTL-NBR.                 CAT912  
            SET  NSCCOTRN-REC-TYPE-IS-TI  TO TRUE.                      CAT912  
            MOVE '481' TO NSCCOTRN-TI-REC-LEN.                          CAT912  
            MOVE '01'  TO NSCCOTRN-TI-PHSCL-SEQ-NBR                     CAT912  
            MOVE '01'  TO NSCCOTRN-TI-LGCL-SEQ-NBR                      CAT912  
            SET     NSCCOTRN-TI-ADD    TO TRUE.                         CAT912  
            IF ACAT-REJECTED                                            CAT912  
              SET NSCCOTRN-TI-REJECT TO TRUE.                           CAT912  
            MOVE W-CTL-NO    TO  NSCCOTRN-TI-ACAT-CTL-NBR               CAT912  
            MOVE 'FUL'  TO NSCCOTRN-TI-TFR-TYPE                         CAT912  
            IF ACAT-CONTROL-NUM(1 : 3) > '400'                          CAT912  
               MOVE 'RCR'  TO NSCCOTRN-TI-TFR-TYPE                      CAT912  
               IF ACAT-PEND                                             CAT912  
                 IF     ACAT-NOT-REJECTED                               CAT912  
                    AND  WS-NUM-3-N  = 1                                CAT912  
                SET THIS-IS-ADD TO TRUE                                 CAT912  
               END-IF END-IF                                            CAT912  
            END-IF.                                                     CAT912  
            MOVE ACAT-BROKER-CLEAR-NO TO                                CAT912  
                                          NSCCOTRN-TI-SUB-PART-NBR      CAT912  
            IF ACAT-CLNT-IS-RECEIVER                                    CAT912  
             MOVE ACAT-BROKER-CLEAR-NO TO NSCCOTRN-TI-RCV-NBR           CAT912  
             MOVE ACAT-CONTRA-BRK-NUM TO   NSCCOTRN-TI-DEL-NBR          CAT912  
             MOVE ACAT-CUST-BR-ACT    TO  W-NAME-WORK                   CAT912  
             PERFORM CLEAN-NAME                                         CAT912  
             MOVE W-NAME-WORKNEW      TO  NSCCOTRN-TI-RCV-ACCT-NBR      CAT912  
             MOVE ACAT-CONTRA-CUS-ACT TO  W-NAME-WORK                   CAT912  
             PERFORM CLEAN-NAME                                         CAT912  
             MOVE W-NAME-WORKNEW      TO  NSCCOTRN-TI-DEL-ACCT-NBR      CAT912  
             IF        NSCCOTRN-TI-TFR-TYPE = 'RCR'                     CAT912  
               MOVE ACAT-CONTRA-BRK-NUM TO                              CAT912  
                                          NSCCOTRN-TI-SUB-PART-NBR      CAT912  
             END-IF                                                     CAT912  
             IF        NSCCOTRN-TI-TFR-TYPE = 'RCR'                     CAT912  
               MOVE ACAT-CONTRA-BRK-NUM TO                              CAT912  
                                          NSCCOTRN-TI-SUB-PART-NBR      CAT912  
             END-IF                                                     CAT912  
            ELSE                                                        CAT912  
             MOVE ACAT-BROKER-CLEAR-NO TO NSCCOTRN-TI-DEL-NBR           CAT912  
             MOVE ACAT-CONTRA-BRK-NUM TO   NSCCOTRN-TI-RCV-NBR          CAT912  
             MOVE ACAT-CUST-BR-ACT    TO  W-NAME-WORK                   CAT912  
             PERFORM CLEAN-NAME                                         CAT912  
             MOVE W-NAME-WORKNEW      TO  NSCCOTRN-TI-DEL-ACCT-NBR      CAT912  
             MOVE ACAT-CONTRA-CUS-ACT TO  W-NAME-WORK                   CAT912  
             PERFORM CLEAN-NAME                                         CAT912  
             MOVE W-NAME-WORKNEW      TO  NSCCOTRN-TI-RCV-ACCT-NBR      CAT912  
             IF        NSCCOTRN-TI-TFR-TYPE = 'FUL'                     CAT912  
               MOVE ACAT-CONTRA-BRK-NUM TO                              CAT912  
                                          NSCCOTRN-TI-SUB-PART-NBR      CAT912  
             END-IF                                                     CAT912  
            END-IF.                                                     CAT912  
            MOVE ACAT-SOC-SEC-TAX-ID TO NSCCOTRN-TI-RCV-SSN-PRM         CAT912  
      *****  15  NSCCOTRN-TI-RCV-SSN-SEC                                CAT912  
            IF  ACAT-SINGLE-ACCT                                        CAT912  
             MOVE 'SN'     TO NSCCOTRN-TI-RCV-ACCT-TYPE                 CAT912  
            ELSE IF  ACAT-JOINT-ACCT                                    CAT912  
             MOVE 'JT'     TO NSCCOTRN-TI-RCV-ACCT-TYPE                 CAT912  
            ELSE IF  ACAT-ROLLOVER                                      CAT912  
             MOVE 'DR'     TO NSCCOTRN-TI-RCV-ACCT-TYPE                 CAT912  
            ELSE IF  ACAT-IRA                                           CAT912  
             MOVE 'IR'     TO NSCCOTRN-TI-RCV-ACCT-TYPE                 CAT912  
            ELSE IF  ACAT-PROF-PENSION                                  CAT912  
             MOVE 'QP'     TO NSCCOTRN-TI-RCV-ACCT-TYPE                 CAT912  
            ELSE IF  ACAT-OTHER-ACCT                                    CAT912  
             MOVE 'OT'     TO NSCCOTRN-TI-RCV-ACCT-TYPE                 CAT912  
            ELSE IF  ACAT-ESTATE-ACCT                                   CAT912  
             MOVE 'ES'     TO NSCCOTRN-TI-RCV-ACCT-TYPE                 CAT912  
            ELSE IF  ACAT-CUSTODIAN-ACCT                                CAT912  
             MOVE 'CU'     TO NSCCOTRN-TI-RCV-ACCT-TYPE                 CAT912  
            ELSE IF  ACAT-TRUST-ACCT                                    CAT912  
             MOVE 'TR'     TO NSCCOTRN-TI-RCV-ACCT-TYPE                 CAT912  
            ELSE IF  ACAT-CORP-ACCT                                     CAT912  
             MOVE 'CO'     TO NSCCOTRN-TI-RCV-ACCT-TYPE                 CAT912  
            END-IF.                                                     CAT912  
            MOVE ACAT-ACT-TITLE    TO NSCCOTRN-TI-RCV-CUST-NAME.        CAT912  
                                                                        CAT912  
             MOVE ' '                  TO                               CAT912  
                                              NSCCOTRN-TI-COMMENTS.     CAT912  
                                                                        CAT912  
       CONVERT-SECOND-CONTROL.                                          CAT912  
                                                                        CAT912  
                                                                        CAT912  
       CONVERT-THIRD-CONTROL.                                           CAT912  
           MOVE ACAT-REJ-REASON    TO NSCCOTRN-TI-TFR-TYPE-REJ.         CAT912  
           MOVE ACAT-PROCESS-DATE  TO NSCCOTRN-PROC-DATE(3 : 6).        CAT912  
           MOVE '19'               TO NSCCOTRN-PROC-DATE(1 : 2).        CAT912  
                                                                        CAT912  
       CONVERT-FIRST-ASSET.                                             CAT912  
                                                                        CAT912  
           SET  NSCCOTRN-REC-TYPE-IS-AT  TO TRUE.                       CAT912  
           MOVE '01'   TO  NSCCOTRN-AT-PHSCL-SEQ-NBR                    CAT912  
           MOVE '01' TO  NSCCOTRN-AT-LGCL-SEQ-NBR                       CAT912  
           MOVE 'FUL'  TO NSCCOTRN-AT-TFR-TYPE                          CAT912  
           IF ACAT-CONTROL-NUM(1 : 3) > '400'                           CAT912  
               MOVE 'RCR'  TO NSCCOTRN-AT-TFR-TYPE                      CAT912  
           END-IF.                                                      CAT912  
           MOVE W-CTL-NO   TO NSCCOTRN-AT-ACAT-CTL-NBR.                 CAT912  
                                                                        CAT912  
           MOVE ACAT-BROKER-CLEAR-NO TO                                 CAT912  
                                          NSCCOTRN-AT-SUB-PART-NBR      CAT912  
            IF ACAT-CLNT-IS-RECEIVER                                    CAT912  
             MOVE ACAT-BROKER-CLEAR-NO TO NSCCOTRN-AT-RCV-NBR           CAT912  
             MOVE ACAT-CONTRA-BRK-NUM TO   NSCCOTRN-AT-DEL-NBR          CAT912  
             MOVE ACAT-CONTRA-CUS-ACT TO  W-NAME-WORK                   CAT912  
             PERFORM CLEAN-NAME                                         CAT912  
             MOVE W-NAME-WORKNEW      TO  NSCCOTRN-AT-TRAN-REF-ID       CAT912  
             IF        NSCCOTRN-AT-TFR-TYPE = 'RCR'                     CAT912  
               MOVE ACAT-CONTRA-BRK-NUM TO                              CAT912  
                                          NSCCOTRN-TI-SUB-PART-NBR      CAT912  
             END-IF                                                     CAT912  
            ELSE                                                        CAT912  
             MOVE ACAT-BROKER-CLEAR-NO TO NSCCOTRN-AT-DEL-NBR           CAT912  
             MOVE ACAT-CONTRA-BRK-NUM TO   NSCCOTRN-AT-RCV-NBR          CAT912  
             MOVE ACAT-CUST-BR-ACT    TO  W-NAME-WORKNEW                CAT912  
             PERFORM CLEAN-NAME                                         CAT912  
             MOVE W-NAME-WORKNEW      TO  NSCCOTRN-AT-TRAN-REF-ID       CAT912  
             IF        NSCCOTRN-AT-TFR-TYPE = 'FUL'                     CAT912  
               MOVE ACAT-CONTRA-BRK-NUM TO                              CAT912  
                                          NSCCOTRN-TI-SUB-PART-NBR      CAT912  
             END-IF                                                     CAT912  
            END-IF.                                                     CAT912  
            MOVE ACAT-ASSET-SEQ-NO  TO W-NUM-4-A                        CAT912  
            MOVE W-NUM-4-N   TO NSCCOTRN-AT-ASSET-SEQ-NBR.              CAT912  
            IF ACAT-NON-OPTION                                          CAT912  
               SET   NSCCOTRN-AT-NON-OPT   TO TRUE                      CAT912  
            ELSE IF ACAT-EQUITY-OPTION                                  CAT912  
               SET   NSCCOTRN-AT-EQUITY-OPT TO TRUE                     CAT912  
            ELSE IF ACAT-NON-EQUITY-OPTION                              CAT912  
               SET   NSCCOTRN-AT-NON-EQUITY-OPT TO TRUE                 CAT912  
            ELSE IF ACAT-INTL-CURR-SYS-OPTION                           CAT912  
               SET   NSCCOTRN-AT-ICS-OPT   TO TRUE.                     CAT912  
           IF THIS-IS-ADD                                               CAT912  
              SET    NSCCOTRN-AT-ADD TO TRUE                            CAT912  
           ELSE IF ACAT-ADJ-NEW-POS                                     CAT912  
              SET    NSCCOTRN-AT-CHG TO TRUE.                           CAT912  
                                                                        CAT912  
       CONVERT-SECOND-ASSET.                                            CAT912  
                                                                        CAT912  
           MOVE 'US'     TO   NSCCOTRN-AT-SEC-CNTRY-CD                  CAT912  
           IF   NSCCOTRN-AT-ASSET-PRC-CATG = 'FEQU'                     CAT912  
             MOVE '  '     TO   NSCCOTRN-AT-SEC-CNTRY-CD.               CAT912  
           IF   NOT ACAT-CUSIP-IS-CASH-BAL                              CAT912  
              MOVE ACAT-CUSIP-NUM TO  NSCCOTRN-AT-SEC-ID.               CAT912  
      *********  NSCCOTRN-AT-SEC-CHKDGT            PIC X(0001).         CAT912  
           MOVE ACAT-SEC-DESC-1 TO   NSCCOTRN-AT-ASSET-DESC             CAT912  
           MOVE 'F' TO  NSCCOTRN-AT-ASSET-QTY-RQIND.                    CAT912  
           MOVE '2' TO  NSCCOTRN-AT-ASSET-REQ-TRNCD.                    CAT912  
           MOVE ACAT-ASSET-QUAN-WHOLE-NUM TO W-SHARE-DIG                CAT912  
           MOVE ACAT-ASSET-QUAN-FRACTION  TO W-SHARE-FRA                CAT912  
           IF W-SHARE-DIG NOT NUMERIC                                   CAT912  
             MOVE 0                         TO W-SHARE-DIG.             CAT912  
           IF W-SHARE-FRA NOT NUMERIC                                   CAT912  
             MOVE 0                         TO W-SHARE-FRA.             CAT912  
           MOVE W-SHARE-AREA     TO  NSCCOTRN-AT-ASSET-QTY              CAT912  
           MOVE 0                         TO W-SHARE-DIG                CAT912  
           MOVE 0                         TO W-SHARE-FRA                CAT912  
           MOVE W-SHARE-AREA     TO  NSCCOTRN-AT-ASSET-PCT              CAT912  
           IF ACAT-SHORT-POSITION                                       CAT912  
             SET     NSCCOTRN-AT-SHORT-POS  TO TRUE                     CAT912  
           ELSE                                                         CAT912  
             SET     NSCCOTRN-AT-LONG-POS   TO TRUE.                    CAT912  
      *********  NSCCOTRN-AT-ISO-CURCY-CD          PIC X(0003).         CAT912  
           IF NSCCOTRN-AT-NON-OPT                                       CAT912  
               PERFORM CONVERT-SECOND-MF                                CAT912  
           ELSE                                                         CAT912  
               PERFORM CONVERT-SECOND-OPTION.                           CAT912  
                                                                        CAT912  
       CONVERT-THIRD-ASSET.                                             CAT912  
                                                                        CAT912  
           IF NOT ACAT-RI-NOT-DELETED                                   CAT912  
              SET    NSCCOTRN-AT-DEL TO TRUE.                           CAT912  
                                                                        CAT912  
           IF ACAT-EQUITIES                                             CAT912  
             MOVE 'CORP' TO  NSCCOTRN-AT-ASSET-PRC-CATG                 CAT912  
           ELSE IF ACAT-FOREIGN-SECURITY                                CAT912  
             MOVE 'FEQU' TO  NSCCOTRN-AT-ASSET-PRC-CATG                 CAT912  
           ELSE IF ACAT-CORPORATE-BONDS                                 CAT912  
             MOVE 'CORP' TO  NSCCOTRN-AT-ASSET-PRC-CATG                 CAT912  
           ELSE IF ACAT-MUNICIPAL-BONDS                                 CAT912  
             MOVE 'MUNI' TO  NSCCOTRN-AT-ASSET-PRC-CATG                 CAT912  
           ELSE IF ACAT-MF-NON-MONEY-MRKT                               CAT912  
             MOVE 'MFNM' TO  NSCCOTRN-AT-ASSET-PRC-CATG                 CAT912  
           ELSE IF ACAT-MF-MONEY-MRKT                                   CAT912  
             MOVE 'MFMM' TO  NSCCOTRN-AT-ASSET-PRC-CATG                 CAT912  
           ELSE IF ACAT-ZERO-COUPON-BONDS                               CAT912  
             MOVE 'ZERO' TO  NSCCOTRN-AT-ASSET-PRC-CATG                 CAT912  
           ELSE IF ACAT-LIMITED-PARNERSHIPS                             CAT912  
             MOVE 'LPAR' TO  NSCCOTRN-AT-ASSET-PRC-CATG                 CAT912  
           ELSE IF ACAT-CDS-AND-COMMERCIAL-PAPER                        CAT912  
             MOVE 'CDCP' TO  NSCCOTRN-AT-ASSET-PRC-CATG                 CAT912  
           ELSE IF ACAT-GOVT-BONDS-US-AND-FGN                           CAT912  
             MOVE 'GOVT' TO  NSCCOTRN-AT-ASSET-PRC-CATG                 CAT912  
           ELSE IF ACAT-UITS                                            CAT912  
             MOVE 'UIT ' TO  NSCCOTRN-AT-ASSET-PRC-CATG                 CAT912  
           ELSE IF ACAT-MORTGAGED-BACKED                                CAT912  
             MOVE 'MBS ' TO  NSCCOTRN-AT-ASSET-PRC-CATG                 CAT912  
           ELSE                                                         CAT912  
             MOVE 'OTH ' TO  NSCCOTRN-AT-ASSET-PRC-CATG.                CAT912  
                                                                        CAT912  
           IF ACAT-SETTL-CNS                                            CAT912  
             SET     NSCCOTRN-AT-CNS   TO TRUE                          CAT912  
             MOVE  SPACES TO        NSCCOTRN-AT-STL-LOC-RSN-CD          CAT912  
           ELSE IF ACAT-SETTL-MF-BOOK-ENTRY                             CAT912  
             SET     NSCCOTRN-AT-FUND-SERV TO TRUE                      CAT912  
             MOVE  SPACES TO        NSCCOTRN-AT-STL-LOC-RSN-CD          CAT912  
           ELSE IF ACAT-SETTL-XCNS                                      CAT912  
             SET     NSCCOTRN-AT-R-D       TO TRUE                      CAT912  
             MOVE  'XSET' TO        NSCCOTRN-AT-STL-LOC-RSN-CD          CAT912  
           ELSE IF ACAT-SETTL-DELAYED-DELIVERY                          CAT912  
                 OR ACAT-SETTL-NON-CNS                                  CAT912  
             SET     NSCCOTRN-AT-R-D       TO TRUE                      CAT912  
             MOVE  'DDEL' TO        NSCCOTRN-AT-STL-LOC-RSN-CD          CAT912  
           ELSE IF ACAT-SETTL-NOT-DELIVERABLE                           CAT912  
             SET     NSCCOTRN-AT-UNDELIVERABLE TO TRUE                  CAT912  
             MOVE SPACES  TO        NSCCOTRN-AT-STL-LOC-RSN-CD          CAT912  
           ELSE IF ACAT-SETTL-CASH-BALANCE                              CAT912  
             SET     NSCCOTRN-AT-CASH-BALANCE  TO TRUE                  CAT912  
             MOVE 'CRED'  TO        NSCCOTRN-AT-STL-LOC-RSN-CD          CAT912  
             IF  ACAT-CUSIP-NUM = ALL '9'                               CAT912  
               MOVE 'DEB '  TO        NSCCOTRN-AT-STL-LOC-RSN-CD        CAT912  
             END-IF                                                     CAT912  
           ELSE IF ACAT-SETTL-OPTION                                    CAT912  
             SET     NSCCOTRN-AT-OCC           TO TRUE                  CAT912  
             MOVE 'OPT '  TO        NSCCOTRN-AT-STL-LOC-RSN-CD          CAT912  
           ELSE IF ACAT-SETTL-SAFEKEEPING                               CAT912  
             SET     NSCCOTRN-AT-R-D           TO TRUE                  CAT912  
             MOVE 'SFK '  TO        NSCCOTRN-AT-STL-LOC-RSN-CD          CAT912  
           ELSE IF ACAT-SETTL-UNDERLY-CASH-BAL                          CAT912  
             SET     NSCCOTRN-AT-MEMO          TO TRUE                  CAT912  
             MOVE 'CASH'  TO        NSCCOTRN-AT-STL-LOC-RSN-CD          CAT912  
           ELSE IF ACAT-SETTL-EXPIRING-OPTION                           CAT912  
             SET     NSCCOTRN-AT-OCC           TO TRUE                  CAT912  
             MOVE 'EXPO'  TO        NSCCOTRN-AT-STL-LOC-RSN-CD          CAT912  
           ELSE IF ACAT-SETTL-MEMO                                      CAT912  
             SET     NSCCOTRN-AT-MEMO          TO TRUE                  CAT912  
             MOVE 'COMT'  TO        NSCCOTRN-AT-STL-LOC-RSN-CD          CAT912  
           ELSE IF ACAT-SETTL-SMA                                       CAT912  
             SET     NSCCOTRN-AT-MEMO          TO TRUE                  CAT912  
             MOVE 'SMA '  TO        NSCCOTRN-AT-STL-LOC-RSN-CD          CAT912  
           ELSE IF ACAT-SETTL-UNDERLY-SECURITY                          CAT912  
             SET     NSCCOTRN-AT-MEMO          TO TRUE                  CAT912  
             IF NOT NSCCOTRN-AT-NON-OPT                                 CAT912  
               SET NSCCOTRN-AT-OCC   TO TRUE                            CAT912  
             END-IF                                                     CAT912  
             MOVE 'USEC'  TO        NSCCOTRN-AT-STL-LOC-RSN-CD          CAT912  
           ELSE IF ACAT-SETTL-RESTRICTED-SEC                            CAT912  
             SET     NSCCOTRN-AT-R-D           TO TRUE                  CAT912  
             MOVE 'RSEC'  TO        NSCCOTRN-AT-STL-LOC-RSN-CD.         CAT912  
                                                                        CAT912  
           MOVE ACAT-ASSET-VALUE          TO W-SHARE-DIG                CAT912  
           MOVE ACAT-ASSET-VALUE          TO W-SHARE-FRA                CAT912  
           IF W-SHARE-DIG NOT NUMERIC                                   CAT912  
             MOVE 0                         TO W-SHARE-DIG.             CAT912  
           IF W-SHARE-FRA NOT NUMERIC                                   CAT912  
             MOVE 0                         TO W-SHARE-FRA.             CAT912  
           MOVE W-SHARE-AREA     TO  NSCCOTRN-AT-ASSET-AMT              CAT912  
           MOVE 'N'  TO  NSCCOTRN-AT-BEARER-BOND                        CAT912  
                         NSCCOTRN-AT-WHN-ISS-IND.                       CAT912  
           IF  ACAT-BEARER-BOND                                         CAT912  
             MOVE 'B'   TO NSCCOTRN-AT-BEARER-BOND.                     CAT912  
           IF  ACAT-WHEN-ISSUE                                          CAT912  
             MOVE 'W'   TO NSCCOTRN-AT-WHN-ISS-IND.                     CAT912  
                                                                        CAT912  
           IF ACAT-MARGIN-ACT                                           CAT912  
              SET    NSCCOTRN-AT-MARGIN  TO TRUE                        CAT912  
           ELSE IF ACAT-SHORT-ACT                                       CAT912  
              SET    NSCCOTRN-AT-SHORT   TO TRUE                        CAT912  
           ELSE                                                         CAT912  
              SET    NSCCOTRN-AT-CASH    TO TRUE.                       CAT912  
           MOVE ACAT-MF-RES-CREDIT-DESC-IND TO                          CAT912  
                                        NSCCOTRN-AT-TFR-TYPE-RSN.       CAT912  
      *********  NSCCOTRN-AT-MBS-SER-NT             PIC X(0003).        CAT912  
             MOVE ' '                TO                                 CAT912  
                                        NSCCOTRN-AT-ASSET-COMMENT.      CAT912  
           MOVE ACAT-SEC-DESC-2 TO   NSCCOTRN-AT-ASSET-DESC(97 : 24).   CAT912  
           IF NSCCOTRN-AT-NON-OPT                                       CAT912  
                 PERFORM CONVERT-THIRD-MF                               CAT912  
           ELSE                                                         CAT912  
                 PERFORM CONVERT-THIRD-OPTION.                          CAT912  
      ******************************************************************CAT912  
       CONVERT-SECOND-OPTION.                                           CAT912  
           MOVE ACAT-OPTION-SYMBOL    TO                                CAT912  
                            NSCCOTRN-ATO-OPT-SYM                        CAT912  
           MOVE ACAT-OPTION-DEL-BKR-NO TO                               CAT912  
                                  NSCCOTRN-ATO-OPT-OCC-DEL-NBR.         CAT912  
       CONVERT-THIRD-OPTION.                                            CAT912  
                                                                        CAT912  
           IF ACAT-OPT-BUY                                              CAT912  
              SET  NSCCOTRN-ATO-OPT-BUY TO TRUE                         CAT912  
           ELSE                                                         CAT912  
              SET  NSCCOTRN-ATO-OPT-SELL TO TRUE.                       CAT912  
           MOVE ACAT-OPT-PUT-CALL TO    NSCCOTRN-ATO-OPT-PC-IND.        CAT912  
           IF ACAT-OPT-OPEN                                             CAT912  
              SET NSCCOTRN-ATO-OPT-OPEN TO TRUE                         CAT912  
           ELSE IF ACAT-OPT-CLOSE                                       CAT912  
               SET NSCCOTRN-ATO-OPT-CLOSE TO TRUE.                      CAT912  
           MOVE ACAT-OPT-EXP-MM                                         CAT912  
               TO  NSCCOTRN-ATO-OPT-EXP-DT(1 : 2).                      CAT912  
           MOVE  ACAT-OPT-EXP-Y                                         CAT912  
               TO  NSCCOTRN-ATO-OPT-EXP-DT(4 : 1).                      CAT912  
           IF ACAT-OPT-EXP-Y < '8'                                      CAT912  
             MOVE '0'  TO  NSCCOTRN-ATO-OPT-EXP-DT(3 : 1)               CAT912  
             MOVE '20' TO  NSCCOTRN-ATO-OPT-EXP-DT(5 : 2)               CAT912  
           ELSE                                                         CAT912  
             MOVE '9'  TO  NSCCOTRN-ATO-OPT-EXP-DT(3 : 1)               CAT912  
             MOVE '19' TO  NSCCOTRN-ATO-OPT-EXP-DT(5 : 2).              CAT912  
               MOVE '00'     TO NSCCOTRN-ATO-OPT-STKPRC-INT(1 : 2)      CAT912  
               MOVE ACAT-OPT-PRICE                                      CAT912  
                                  TO NSCCOTRN-ATO-OPT-STKPRC-INT(3 : 3).CAT912  
               MOVE '0' TO NSCCOTRN-ATO-OPT-STKPRC-FRC(1 : 1).          CAT912  
               MOVE  ACAT-OPT-1-8TH-PRCE                                CAT912  
                    TO  NSCCOTRN-ATO-OPT-STKPRC-FRC(2 : 1).             CAT912  
               IF    ACAT-OPT-1-8TH-PRCE = ' '                          CAT912  
                 MOVE '0'   TO  NSCCOTRN-ATO-OPT-STKPRC-FRC(2 : 1).     CAT912  
            SET   NSCCOTRN-ATO-OPT-CUST  TO TRUE.                       CAT912  
      *******      88  NSCCOTRN-ATO-OPT-FIRM       VALUE 'F'.           CAT912  
      *******      88  NSCCOTRN-ATO-OPT-MARKET     VALUE 'M'.           CAT912  
              MOVE ACAT-REC-OCC-BKR-NO                                  CAT912  
                        TO  NSCCOTRN-ATO-SUB-ACCT-ID.                   CAT912  
              MOVE ' '                 TO                               CAT912  
                                          NSCCOTRN-ATO-OPT-COMMENT.     CAT912  
                                                                        CAT912  
       CONVERT-SECOND-MF.                                               CAT912  
            SET        NSCCOTRN-ATF-FULL-TFR  TO TRUE.                  CAT912  
            MOVE ACAT-MF-CUST-ACCT-AT-FUND   TO                         CAT912  
                                          NSCCOTRN-ATF-CUS-ACCT.        CAT912  
            MOVE ACAT-BOOK-PHYS-SHARE-IND    TO                         CAT912  
                                          NSCCOTRN-ATF-PHSCL-SHR-IND.   CAT912  
            MOVE ACAT-NETWORK-CNTL-IND       TO                         CAT912  
                                        NSCCOTRN-ATF-NTWRK-CTL-IND      CAT912  
            MOVE ACAT-ACCOUNT-TYPE-IND       TO                         CAT912  
                                        NSCCOTRN-ATF-ACCT-TYP-IND       CAT912  
            MOVE ACAT-MF-DIVIDEND-CODE       TO                         CAT912  
                                         NSCCOTRN-ATF-DIV-CD            CAT912  
            MOVE ACAT-MF-DIV-PAYEE-TYPE      TO                         CAT912  
                                          NSCCOTRN-ATF-DIV-PAYEE-IND    CAT912  
            MOVE ACAT-DELIVER-EXEC-BROKER    TO                         CAT912  
                                         NSCCOTRN-ATF-EXEC-BRKR.        CAT912  
       CONVERT-THIRD-MF.                                                CAT912  
            MOVE ACAT-MF-ACCT-LAST6   TO                                CAT912  
                                 NSCCOTRN-ATF-CUS-ACCT(13 : 6).         CAT912  
       CLEAN-NAME.                                                      CAT912  
           SET IWNWN TO 1. SET IWNWN DOWN BY 1.                         CAT912  
           MOVE SPACE   TO W-NAME-WORKNEW.                              CAT912  
                                                                        CAT912  
           PERFORM VARYING IWNW FROM 1 BY 1                             CAT912  
              UNTIL IWNW > 20                                           CAT912  
              IF  W-N-W (IWNW)  = '-' OR ' '                            CAT912  
               CONTINUE                                                 CAT912  
              ELSE                                                      CAT912  
               SET IWNWN UP BY 1                                        CAT912  
               MOVE W-N-W (IWNW)    TO W-N-WN(IWNWN)                    CAT912  
              END-IF                                                    CAT912  
           END-PERFORM.                                                 CAT912  
                                                                        CAT912  
