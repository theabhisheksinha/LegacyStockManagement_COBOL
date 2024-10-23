000001* PDX    - CAT660D  C0199096 01/23/04 13:36:06 TBEDTAK            00001000
000001* PDX    - CAT660D  C0191007 05/22/03 10:44:19 TBLAMUR            CAT660D 
000001* PDX    - CAT660D  C0179270 12/10/02 08:20:04 TBLAMUR            CAT660D 
000001* PDX    - CAT660D  C0150647 11/18/02 12:53:34 TBLAMUR            CAT660D 
       IDENTIFICATION DIVISION.                                         CAT660D 
       PROGRAM-ID.  CAT660D.                                            CAT660D 
       AUTHOR.     LARRY MUREY.                                         CAT660D 
      ***************************************************************** CAT660D 
      * THIS PROGRAM CONTAINS DB2 / READ ONLY.                        * CAT660D 
      ***************************************************************** CAT660D 
      * CAT660D - READ SIAC0720 TRANSMISSION FROM NSCC AND CREATE DST * CAT660D 
      *    FUND STATUS FEED.                                          * CAT660D 
      *                                                               * CAT660D 
      ***************************************************************** CAT660D 
      * 11/15/02       NEW PROGRAM                                    * CAT660D 
LRM001* 05/22/03  SSR 0033700 ADD ASSET SEQ NBR TO DST FEED.            CAT660D 
ET0001* JAN 2004  SSR 0035617 ADD ACCT TYPE & CHECK DIGIT ON DST FILE   CAT660D 
      ***************************************************************** CAT660D 
      /                                                                 CAT660D 
       ENVIRONMENT DIVISION.                                            CAT660D 
       INPUT-OUTPUT SECTION.                                            CAT660D 
       FILE-CONTROL.                                                    CAT660D 
                                                                        CAT660D 
           SELECT INFILE           ASSIGN       TO INFILE               CAT660D 
                                   FILE STATUS  IS INFILE-STAT.         CAT660D 
                                                                        CAT660D 
           SELECT IREG-FILE        ASSIGN  TO  IREG                     CAT660D 
                                   ORGANIZATION IS INDEXED              CAT660D 
                                   ACCESS MODE IS RANDOM                CAT660D 
                                   RECORD KEY IS REG-OPT-KEY-AREA       CAT660D 
                                   FILE STATUS IS WS-IREG-FILE-STATUS.  CAT660D 
                                                                        CAT660D 
           SELECT DST-FILE         ASSIGN       TO ACATDST.             CAT660D 
                                                                        CAT660D 
      /                                                                 CAT660D 
       DATA DIVISION.                                                   CAT660D 
       FILE SECTION.                                                    CAT660D 
       FD  INFILE                                                       CAT660D 
           RECORDING MODE IS V                                          CAT660D 
           RECORD IS VARYING IN SIZE FROM 1 TO 4000 CHARACTERS          CAT660D 
              DEPENDING ON W-REC-LEN-IN                                 CAT660D 
           BLOCK CONTAINS 0 RECORDS.                                    CAT660D 
                                                                        CAT660D 
       01  IN-RECORD                   PIC X(520).                      CAT660D 
                                                                        CAT660D 
           COPY NSCCMHDR REPLACING ==:NSCCMHDR:== BY ==NSCCMHDR==.      CAT660D 
                                                                        CAT660D 
           COPY NSCCMTRL REPLACING ==:NSCCMTRL:== BY ==NSCCMTRL==.      CAT660D 
                                                                        CAT660D 
           COPY NSCCF.                                                  CAT660D 
                                                                        CAT660D 
       01  DUMMY-LARGE-RECORD         PIC X(4000).                      CAT660D 
                                                                        CAT660D 
       FD  IREG-FILE                                                    CAT660D 
           BLOCK CONTAINS 0 RECORDS.                                    CAT660D 
       01  IREG-RECORD.                                                 CAT660D 
       COPY BNWREGOP.                                                   CAT660D 
                                                                        CAT660D 
       FD  DST-FILE                                                     CAT660D 
           RECORDING MODE IS F                                          CAT660D 
           BLOCK CONTAINS 0 RECORDS                                     CAT660D 
           LABEL RECORDS ARE STANDARD.                                  CAT660D 
                                                                        CAT660D 
       01  DST-RECORD                  PIC X(180).                      CAT660D 
                                                                        CAT660D 
      /                                                                 CAT660D 
       WORKING-STORAGE SECTION.                                         CAT660D 
       COPY PDXIDCOB.                                                   CAT660D 
                                                                        CAT660D 
       01  W-FIELDS.                                                    CAT660D 
           05  W-PGM-NAME                PIC  X(008) VALUE 'CAT660D'.   CAT660D 
           05  W-ROUTINE-1               PIC  X(032) VALUE ' '.         CAT660D 
           05  W-FIRST-TIME-SW           PIC  X(001) VALUE '0'.         CAT660D 
               88 NOT-FIRST-TIME                     VALUE '1'.         CAT660D 
           05  END-OF-INFILE-SW          PIC  X(001) VALUE '0'.         CAT660D 
               88 END-OF-INFILE                      VALUE '1'.         CAT660D 
           05  INFILE-STAT               PIC  X(002).                   CAT660D 
               88 INFILE-OKAY            VALUE '00' THRU '09', '97'.    CAT660D 
               88 INFILE-END-OF-FILE     VALUE '10'.                    CAT660D 
               88 INFILE-EMPTY-MISSING VALUE '35'.                      CAT660D 
           05  WS-IREG-FILE-STATUS       PIC  X(002).                   CAT660D 
               88 WS-IREG-FILE-STATUS-OK VALUE '00' THRU '09', '97'.    CAT660D 
               88 VALID-IREG-READ        VALUE '00', '23'.              CAT660D 
           05  OUTFILE-STAT              PIC  X(002).                   CAT660D 
               88 OUTFILE-OKAY           VALUE '00' THRU '09', '97'.    CAT660D 
               88 OUTFILE-END-OF-FILE    VALUE '10'.                    CAT660D 
               88 OUTFILE-EMPTY-MISSING VALUE '35'.                     CAT660D 
           05  MFNLFL-RECS        COMP     PIC S9(9)    VALUE +0.       CAT660D 
           05  WS-IREG-RECORD-IND          PIC X(01) VALUE 'N'.         CAT660D 
               88  WS-IREG-RECORD-FOUND              VALUE 'Y'.         CAT660D 
           05  WS-TIF-FOUND-IND            PIC X(01) VALUE 'N'.         CAT660D 
               88  TIF-FOUND                         VALUE 'Y'.         CAT660D 
           05  W-SYS-DATE                PIC  9(006) VALUE 0.           CAT660D 
           05  FILLER  REDEFINES                                        CAT660D 
               W-SYS-DATE.                                              CAT660D 
               10  W-UPD-DATE            PIC  X(006).                   CAT660D 
           05  W-SYS-TIME                PIC  9(008) VALUE 0.           CAT660D 
           05  FILLER  REDEFINES                                        CAT660D 
               W-SYS-TIME.                                              CAT660D 
               10  W-UPD-TIME            PIC  X(006).                   CAT660D 
               10  W-UPD-TIME-MS         PIC  X(002).                   CAT660D 
           05  LD-PROC-DATE.                                            CAT660D 
               10 LD-PROC-DATE-MM        PIC  X(002).                   CAT660D 
               10 LD-PROC-DATE-DD        PIC  X(002).                   CAT660D 
               10 LD-PROC-DATE-YY        PIC  X(002).                   CAT660D 
           05  WS-PROC-DATE-MMDDCCYY.                                   CAT660D 
               10  WS-PROC-MMDDCCYY-MM     PIC X(02).                   CAT660D 
               10  WS-PROC-MMDDCCYY-DD     PIC X(02).                   CAT660D 
               10  WS-PROC-MMDDCCYY-CC     PIC X(02).                   CAT660D 
               10  WS-PROC-MMDDCCYY-YY     PIC X(02).                   CAT660D 
           05  FILLER                    PIC  X(008) VALUE 'INPUTCNT'.  CAT660D 
           05  W-INFILE-CNT              PIC  9(009) VALUE 0.           CAT660D 
           05  FILLER                    PIC  X(008) VALUE 'OUTPUTCT'.  CAT660D 
           05  W-OUTFILE-CNT             PIC  9(009) VALUE 0.           CAT660D 
           05  FILLER                    PIC  X(008) VALUE 'DETAILCT'.  CAT660D 
           05  W-DETAIL-CNT              PIC  9(009) VALUE 0.           CAT660D 
           05  FILLER                    PIC  X(008) VALUE 'W-SUB1  '.  CAT660D 
           05  W-SUB1                    PIC  9(004) VALUE 0.           CAT660D 
           05  FILLER                    PIC  X(008) VALUE 'LOAD-CNT'.  CAT660D 
           05  W-LOAD-CNT                PIC  9(009) VALUE 0.           CAT660D 
           05  FILLER                    PIC  X(008) VALUE 'RECLENIN'.  CAT660D 
           05  W-REC-LEN-IN              PIC  9(005) VALUE 0.           CAT660D 
           05  FILLER                    PIC  X(008) VALUE 'RECLENOT'.  CAT660D 
           05  W-REC-LEN-OUT             PIC  9(005) VALUE 0.           CAT660D 
           05  FILLER                    PIC  X(008) VALUE 'NEWCYCLE'.  CAT660D 
           05  W-NEXT-CYCLE              PIC  9(004) VALUE 0.           CAT660D 
           05  W-SQL-CNT                 PIC  9(009) VALUE 0.           CAT660D 
           05  W-NON-DETAIL-CNT          PIC  9(009) VALUE 0.           CAT660D 
           05  W-DATE.                                                  CAT660D 
               07  W-DATE-YEAR           PIC  X(04).                    CAT660D 
               07  FILLER                PIC  X(01) VALUE '-'.          CAT660D 
               07  W-DATE-MM             PIC  X(02).                    CAT660D 
               07  FILLER                PIC  X(01) VALUE '-'.          CAT660D 
               07  W-DATE-DD             PIC  X(02).                    CAT660D 
           05  W-NSCC-DATE.                                             CAT660D 
               07  W-NSCC-DATE-YEAR      PIC  X(04).                    CAT660D 
               07  W-NSCC-DATE-MM        PIC  X(02).                    CAT660D 
               07  W-NSCC-DATE-DD        PIC  X(02).                    CAT660D 
           05  W-CERT-DATE.                                             CAT660D 
               07  W-CERT-DATE-MM        PIC  X(02).                    CAT660D 
               07  W-CERT-DATE-DD        PIC  X(02).                    CAT660D 
               07  W-CERT-DATE-YEAR      PIC  X(04).                    CAT660D 
           05  W-COMMA-PTR               PIC  9(002) VALUE 0.           CAT660D 
           05  W-QTY-PTR                 PIC  9(002) VALUE 0.           CAT660D 
           05  W-INT-PTR                 PIC  9(002) VALUE 0.           CAT660D 
           05  W-DEC-PTR                 PIC  9(002) VALUE 0.           CAT660D 
           05  W-COMMA-FND-SW            PIC  X(001) VALUE ' '.         CAT660D 
                                                                        CAT660D 
ET0001     05  W-ACCT-NBR.                                              CAT660D 
ET0001         07  W-ACCT-NUM            PIC  X(08).                    CAT660D 
ET0001         07  W-ACCT-TYPE           PIC  X(01).                    CAT660D 
ET0001         07  W-ACCT-CHK-DIG        PIC  X(01).                    CAT660D 
ET0001     05  CKDIGIT                   PIC  X(8) VALUE 'CKDIGIT'.     CAT660D 
ET0001     05  W-CHECK-DIGIT-LINK-AREA.                                 CAT660D 
ET0001         07 CHECK-DIG-ACCT.                                       CAT660D 
ET0001            09  CK-BR-AC           PIC X(8).                      CAT660D 
ET0001            09  CK-TYPE            PIC 9.                         CAT660D 
ET0001         07 NO-OF-DIG              PIC 99 VALUE 9.                CAT660D 
ET0001         07 D-PLUG-CHECK           PIC X VALUE SPACES.            CAT660D 
           05  W-QTY-X.                                                 CAT660D 
               07  W-QTY-BYTE            PIC X OCCURS 17 TIMES.         CAT660D 
           05  W-QTY REDEFINES W-QTY-X   PIC 9(17).                     CAT660D 
                                                                        CAT660D 
           05  W-QTY-N                   PIC 9(13)V9(4).                CAT660D 
           05  FILLER REDEFINES W-QTY-N.                                CAT660D 
               07  W-QTY-INT             PIC 9(13).                     CAT660D 
               07  W-QTY-DEC             PIC 9(04).                     CAT660D 
                                                                        CAT660D 
           05  W-INT                     PIC 9(17).                     CAT660D 
           05  W-INT-X REDEFINES W-INT.                                 CAT660D 
               07  W-INT-BYTE            PIC X OCCURS 17 TIMES.         CAT660D 
                                                                        CAT660D 
           05  W-DEC                     PIC 9(04).                     CAT660D 
           05  W-DEC-X REDEFINES W-DEC.                                 CAT660D 
               07  W-DEC-BYTE            PIC X OCCURS  4 TIMES.         CAT660D 
      /                                                                 CAT660D 
       01  FILLER                        PIC X(008) VALUE 'NSCC SEQ'.   CAT660D 
       01  WS-STAT-RECORD.                                              CAT660D 
           05  WS-STAT-KEY.                                             CAT660D 
               10  WS-STAT-CLIENT            PIC 9(03).                 CAT660D 
               10  WS-STAT-ACATS-CTRL-NBR    PIC X(14).                 CAT660D 
               10  WS-STAT-ASSET-SEQ-NBR     PIC 9(04).                 CAT660D 
               10  WS-STAT-LCTN-CD           PIC X(02).                 CAT660D 
           05  WS-STAT-DATA                  PIC X(490).                CAT660D 
           05  FILLER                        PIC X(07).                 CAT660D 
      /                                                                 CAT660D 
       01  FILLER                      PIC X(16) VALUE 'MFDST-REC-WS'.  CAT660D 
           COPY ACATDST   REPLACING ==:MFDST:==  BY  ==MFDST==.         CAT660D 
                                                                        CAT660D 
       01  FILLER                        PIC X(008) VALUE 'SQLCA   '.   CAT660D 
           EXEC SQL INCLUDE SQLCA        END-EXEC.                      CAT660D 
      /                                                                 CAT660D 
       01  FILLER                        PIC X(008) VALUE 'VTRNFR'.     CAT660D 
           EXEC SQL INCLUDE VTRNFR       END-EXEC.                      CAT660D 
                                                                        CAT660D 
      /                                                                 CAT660D 
       01  FILLER                        PIC X(008) VALUE 'VASSET'.     CAT660D 
           EXEC SQL INCLUDE VASSET       END-EXEC.                      CAT660D 
                                                                        CAT660D 
      /                                                                 CAT660D 
       01  FILLER                        PIC X(008) VALUE 'VTRNHSTY'.   CAT660D 
           EXEC SQL INCLUDE VTRNHSTY     END-EXEC.                      CAT660D 
                                                                        CAT660D 
      /                                                                 CAT660D 
       01  FILLER                        PIC X(008) VALUE 'VASTHSTY'.   CAT660D 
           EXEC SQL INCLUDE VASTHSTY     END-EXEC.                      CAT660D 
                                                                        CAT660D 
       01  W-DB2-MESSAGE-AREA.                                          CAT660D 
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.    CAT660D 
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES     CAT660D 
                   INDEXED BY W-DB2-IDX.                                CAT660D 
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.     CAT660D 
                                                                        CAT660D 
       01  W-DB2-WORKAREA.                                              CAT660D 
           05  ROLLBACK-SQLCA            PIC  X(122).                   CAT660D 
           05  ROLLBACK-RETURN           PIC S9(009) COMP.              CAT660D 
               88  ROLLBACK-OK                VALUE +0.                 CAT660D 
               88  ROLLBACK-AB                VALUE -999 THRU -1        CAT660D 
                                                    +1   THRU +999.     CAT660D 
           05  COMMIT-SQLCA              PIC  X(122).                   CAT660D 
           05  COMMIT-RETURN             PIC S9(009) COMP.              CAT660D 
               88  COMMIT-OK                  VALUE +0.                 CAT660D 
               88  COMMIT-AB                  VALUE -999 THRU -1        CAT660D 
                                                    +1   THRU +999.     CAT660D 
           05  W-COMMIT-CTR              PIC  9(009) COMP-3             CAT660D 
                                              VALUE 0.                  CAT660D 
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(009) VALUE 0.           CAT660D 
           05  W-DB2-TABLE-NAME          PIC  X(008).                   CAT660D 
           05  W-DB2-ACTION              PIC  X(008).                   CAT660D 
           05  W-DB2-SQLCODE             PIC  ---9.                     CAT660D 
                                                                        CAT660D 
      /                                                                 CAT660D 
      ***===> COBOL LE                                                  CAT660D 
       01  W-ABEND-AREA.                                                CAT660D 
           05  ABEND-CODE                PIC S9(04) COMP SYNC.          CAT660D 
       01  CALL-MODULES.                                                CAT660D 
           05  DSNTIAR                   PIC  X(08) VALUE 'DSNTIAR '.   CAT660D 
       01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.   CAT660D 
           COPY STUBCPY.                                                CAT660D 
      ***<=== COBOL LE                                                  CAT660D 
                                                                        CAT660D 
       COPY BPDATESC.                                                   CAT660D 
       01  FILLER                        PIC X(008) VALUE 'END-O-WS'.   CAT660D 
      /                                                                 CAT660D 
      ***************************************************************** CAT660D 
      *    LINKAGE SECTION                                            * CAT660D 
      ***************************************************************** CAT660D 
       LINKAGE SECTION.                                                 CAT660D 
       01  L-JCL-PARMS.                                                 CAT660D 
           05  PARMLENGTH                PIC S9(004) COMP SYNC.         CAT660D 
           05  L-BYP-DATECHK-SW          PIC  X(001).                   CAT660D 
               88  L-BYP-DATECHK                     VALUE '1'.         CAT660D 
           05  L-BYP-FILECHK-SW          PIC  X(001).                   CAT660D 
               88  L-BYP-FILECHK                     VALUE '1'.         CAT660D 
                                                                        CAT660D 
       PROCEDURE DIVISION USING L-JCL-PARMS.                            CAT660D 
      *                         ===========                             CAT660D 
       0000-MAIN SECTION.                                               CAT660D 
           COPY MSGCOBO.                                                CAT660D 
           DISPLAY 'CAT660D - READ ACATS FUND/SERV STATISTICS FILE'.    CAT660D 
           DISPLAY ' '.                                                 CAT660D 
                                                                        CAT660D 
           PERFORM 1000-INIT           THRU 1000-EXIT.                  CAT660D 
           PERFORM 2000-PROCESS        THRU 2000-EXIT                   CAT660D 
                   UNTIL END-OF-INFILE.                                 CAT660D 
           PERFORM 9100-CLOSE-ROUTINE  THRU 9100-EXIT.                  CAT660D 
                                                                        CAT660D 
           GOBACK.                                                      CAT660D 
      /                                                                 CAT660D 
       1000-INIT.                                                       CAT660D 
                                                                        CAT660D 
           DISPLAY ' '.                                                 CAT660D 
           DISPLAY 'CAT660D: L-BYP-DATECHK-SW = '                       CAT660D 
                            L-BYP-DATECHK-SW                            CAT660D 
           ' (1=BYPASS DATE CHECK)'                                     CAT660D 
           DISPLAY 'CAT660D: L-BYP-FILECHK-SW = '                       CAT660D 
                            L-BYP-FILECHK-SW                            CAT660D 
           ' (1=BYPASS FILE CHECK)'                                     CAT660D 
           IF  L-BYP-DATECHK                                            CAT660D 
               DISPLAY 'CAT660D: DATE CHECK WILL BE BYPASSED'           CAT660D 
           ELSE                                                         CAT660D 
               DISPLAY 'CAT660D: DATE CHECK WILL BE PERFORMED'          CAT660D 
           END-IF.                                                      CAT660D 
           IF  L-BYP-FILECHK                                            CAT660D 
               DISPLAY 'CAT660D: FILE CHECK WILL BE BYPASSED'           CAT660D 
           ELSE                                                         CAT660D 
               DISPLAY 'CAT660D: FILE CHECK WILL BE PERFORMED'          CAT660D 
           END-IF.                                                      CAT660D 
                                                                        CAT660D 
           MOVE 'CAT660D'                 TO BPDATES-CALLING-PGM.       CAT660D 
           SET  LNKDATZ-REQUEST           TO TRUE.                      CAT660D 
           CALL BPDATES USING BPDATES-PARAMETERS.                       CAT660D 
           MOVE BPD-PROC-DATE(1:2)        TO WS-PROC-MMDDCCYY-CC.       CAT660D 
           MOVE BPD-PROC-DATE(3:2)        TO LD-PROC-DATE-YY            CAT660D 
                                             WS-PROC-MMDDCCYY-YY        CAT660D 
           MOVE BPD-PROC-DATE(5:2)        TO LD-PROC-DATE-MM            CAT660D 
                                             WS-PROC-MMDDCCYY-MM.       CAT660D 
           MOVE BPD-PROC-DATE(7:2)        TO LD-PROC-DATE-DD            CAT660D 
                                             WS-PROC-MMDDCCYY-DD        CAT660D 
                                                                        CAT660D 
           DISPLAY ' '.                                                 CAT660D 
           DISPLAY 'CAT660D:       BPD-PROC-DATE= ' BPD-PROC-DATE       CAT660D 
                                '  LD-PROC-DATE= ' LD-PROC-DATE.        CAT660D 
           DISPLAY 'CAT660D: BPD-PRIOR-PROC-DATE= ' BPD-PRIOR-PROC-DATE.CAT660D 
           DISPLAY ' '.                                                 CAT660D 
                                                                        CAT660D 
           OPEN INPUT INFILE.                                           CAT660D 
           DISPLAY 'CAT660D: INFILE  OPENED FOR INPUT.  STATUS = '      CAT660D 
                                               INFILE-STAT.             CAT660D 
                                                                        CAT660D 
           IF  INFILE-OKAY                                              CAT660D 
               CONTINUE                                                 CAT660D 
           ELSE                                                         CAT660D 
               DISPLAY 'CAT660D: ERROR OPENING INFILE'                  CAT660D 
               DISPLAY 'CAT660D: OPEN STATUS = ' INFILE-STAT            CAT660D 
                            '.  INPUT-CNT = ' W-INFILE-CNT              CAT660D 
               DISPLAY 'CAT660D: U3001 - ABENDING ON BAD FILE STATUS'   CAT660D 
               MOVE +3001    TO ABEND-CODE                              CAT660D 
               CALL ABEND USING ABEND-CODE                              CAT660D 
           END-IF.                                                      CAT660D 
           PERFORM 3000-READ-INPUT THRU 3000-EXIT                       CAT660D 
              UNTIL NSCCMHDR-BROKER-CLR-NBR = '0740'                    CAT660D 
                  OR END-OF-INFILE.                                     CAT660D 
           IF NOT END-OF-INFILE                                         CAT660D 
              PERFORM 3500-EDIT-HEADER THRU 3500-EXIT                   CAT660D 
              PERFORM 3000-READ-INPUT THRU 3000-EXIT                    CAT660D 
           END-IF.                                                      CAT660D 
                                                                        CAT660D 
           OPEN INPUT  IREG-FILE.                                       CAT660D 
           IF  WS-IREG-FILE-STATUS-OK                                   CAT660D 
               CONTINUE                                                 CAT660D 
           ELSE                                                         CAT660D 
               DISPLAY 'OPEN IREG ERROR, FILE STATUS IS = '             CAT660D 
                        WS-IREG-FILE-STATUS                             CAT660D 
               MOVE +0004 TO ABEND-CODE                                 CAT660D 
               CALL  ABEND  USING ABEND-CODE                            CAT660D 
           END-IF.                                                      CAT660D 
                                                                        CAT660D 
           OPEN OUTPUT DST-FILE.                                        CAT660D 
           PERFORM 4200-WRITE-DST-HEADER-RTN.                           CAT660D 
                                                                        CAT660D 
           DISPLAY ' '.                                                 CAT660D 
                                                                        CAT660D 
       1000-EXIT.                                                       CAT660D 
           EXIT.                                                        CAT660D 
       2000-PROCESS.                                                    CAT660D 
                                                                        CAT660D 
           IF  NSCCMHDR-REC-TYPE NOT = 'F'                              CAT660D 
               MOVE '1'              TO END-OF-INFILE-SW                CAT660D 
               GO TO 2000-EXIT                                          CAT660D 
           END-IF.                                                      CAT660D 
                                                                        CAT660D 
           PERFORM 4000-READ-IREG-FILE THRU 4000-EXIT.                  CAT660D 
           IF WS-IREG-RECORD-FOUND                                      CAT660D 
           AND (PROCESSING-CODE OF IREG-RECORD = 'D')                   CAT660D 
              PERFORM 4220-WRITE-DST-RTN.                               CAT660D 
           PERFORM 3000-READ-INPUT THRU 3000-EXIT.                      CAT660D 
                                                                        CAT660D 
       2000-EXIT. EXIT.                                                 CAT660D 
      /                                                                 CAT660D 
       3000-READ-INPUT.                                                 CAT660D 
                                                                        CAT660D 
           READ INFILE                                                  CAT660D 
                AT END                                                  CAT660D 
                   MOVE '1'              TO END-OF-INFILE-SW            CAT660D 
                   DISPLAY 'CAT660D: END OF INPUT REACHED'              CAT660D 
                            '.  INPUT-CNT = ' W-INFILE-CNT              CAT660D 
                   GO TO 3000-EXIT                                      CAT660D 
           END-READ.                                                    CAT660D 
                                                                        CAT660D 
           ADD  1                        TO W-INFILE-CNT.               CAT660D 
                                                                        CAT660D 
           IF  INFILE-OKAY                                              CAT660D 
               MOVE IN-RECORD       (1 : W-REC-LEN-IN) TO               CAT660D 
                    NSCCF-RECORD   (1 : W-REC-LEN-IN)                   CAT660D 
           ELSE                                                         CAT660D 
               DISPLAY 'CAT660D: ERROR READING INFILE'                  CAT660D 
               DISPLAY 'CAT660D: READ STATUS = ' INFILE-STAT            CAT660D 
                            '.  INPUT-CNT = ' W-INFILE-CNT              CAT660D 
               DISPLAY 'CAT660D: U3007 - ABENDING ON BAD FILE STATUS'   CAT660D 
               MOVE +3007 TO ABEND-CODE                                 CAT660D 
               PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT                CAT660D 
           END-IF.                                                      CAT660D 
                                                                        CAT660D 
       3000-EXIT.                                                       CAT660D 
           EXIT.                                                        CAT660D 
      /                                                                 CAT660D 
       3500-EDIT-HEADER.                                                CAT660D 
                                                                        CAT660D 
           IF  NSCCMHDR-PROC-DATE = BPD-PROC-DATE                       CAT660D 
               CONTINUE                                                 CAT660D 
           ELSE                                                         CAT660D 
               DISPLAY 'CAT660D: NSCCMHDR-PROC-DATE('                   CAT660D 
                                NSCCMHDR-PROC-DATE ') NOT = '           CAT660D 
                       'BPD-PROC-DATE(' BPD-PROC-DATE ')'               CAT660D 
               IF L-BYP-DATECHK                                         CAT660D 
                   DISPLAY 'CAT660D: BYPASSING DATECHK PER JCLPARM'     CAT660D 
               ELSE                                                     CAT660D 
                   IF  L-BYP-FILECHK                                    CAT660D 
                     DISPLAY 'CAT660D: BYPASSING BAD DATE FILE PER JCL' CAT660D 
                   ELSE                                                 CAT660D 
                     DISPLAY 'CAT660D: U3009 - ABENDING ON BAD DATE'    CAT660D 
                     MOVE +3009 TO ABEND-CODE                           CAT660D 
                     PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT          CAT660D 
                   END-IF                                               CAT660D 
               END-IF                                                   CAT660D 
           END-IF.                                                      CAT660D 
                                                                        CAT660D 
           IF  NSCCMHDR-VAR-LEN-REC-IND = '*'                           CAT660D 
               CONTINUE                                                 CAT660D 
           ELSE                                                         CAT660D 
               DISPLAY 'CAT660D: NSCCMHDR-VAR-LEN-REC-IND '             CAT660D 
                            '(' NSCCMHDR-VAR-LEN-REC-IND ')'            CAT660D 
                            ' NOT = *'                                  CAT660D 
               IF  L-BYP-FILECHK                                        CAT660D 
                   DISPLAY 'CAT660D: BYPASSING BAD VAR-LEN-REC-IND'     CAT660D 
               ELSE                                                     CAT660D 
                   DISPLAY 'CAT660D: U3013 - ABENDING ON BAD VAR IND'   CAT660D 
                   MOVE +3013 TO ABEND-CODE                             CAT660D 
                   PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT            CAT660D 
               END-IF                                                   CAT660D 
           END-IF.                                                      CAT660D 
                                                                        CAT660D 
       3500-EXIT.                                                       CAT660D 
           EXIT.                                                        CAT660D 
      /                                                                 CAT660D 
       4000-READ-IREG-FILE.                                             CAT660D 
           IF CLIENT-NO OF IREG-RECORD   NUMERIC         AND            CAT660D 
              CLIENT-NO OF IREG-RECORD  = '274'          AND            CAT660D 
              NSCCF-ISIN-SEC-ID  = CUSIP-9   OF IREG-RECORD             CAT660D 
              CONTINUE                                                  CAT660D 
           ELSE                                                         CAT660D 
              MOVE SPACES                TO IREG-RECORD                 CAT660D 
              MOVE 274                   TO CLIENT-NO OF IREG-RECORD    CAT660D 
              MOVE NSCCF-ISIN-SEC-ID     TO CUSIP-9   OF IREG-RECORD    CAT660D 
              SET WS-IREG-RECORD-FOUND   TO TRUE                        CAT660D 
              READ IREG-FILE                                            CAT660D 
                   INVALID KEY MOVE SPACE TO WS-IREG-RECORD-IND         CAT660D 
              END-READ                                                  CAT660D 
              IF VALID-IREG-READ                                        CAT660D 
                  CONTINUE                                              CAT660D 
              ELSE                                                      CAT660D 
                  DISPLAY 'READ IREG ERROR, FILE STATUS IS = '          CAT660D 
                           WS-IREG-FILE-STATUS                          CAT660D 
                  MOVE +4000 TO ABEND-CODE                              CAT660D 
                  CALL  ABEND  USING ABEND-CODE                         CAT660D 
              END-IF                                                    CAT660D 
           END-IF.                                                      CAT660D 
                                                                        CAT660D 
       4000-EXIT. EXIT.                                                 CAT660D 
      /                                                                 CAT660D 
       4200-WRITE-DST-HEADER-RTN.                                       CAT660D 
           MOVE '0740'                 TO MFDST-HDR-CLEARING-NBR        CAT660D 
           MOVE WS-PROC-DATE-MMDDCCYY  TO MFDST-HDR-DATE-MMDDCCYY       CAT660D 
           WRITE DST-RECORD   FROM MFDST-HEADER-REC.                    CAT660D 
                                                                        CAT660D 
       4220-WRITE-DST-RTN.                                              CAT660D 
           MOVE SPACES TO MFDST-REC-WS.                                 CAT660D 
           IF NSCCF-ACTION-TYP = 'A'                                    CAT660D 
              SET MFDST-FUND-REG-ACCEPTED TO TRUE                       CAT660D 
           ELSE                                                         CAT660D 
           IF NSCCF-ACTION-TYP = 'P'                                    CAT660D 
              SET MFDST-FUND-REG-PENDING TO TRUE                        CAT660D 
           ELSE                                                         CAT660D 
           IF NSCCF-ACTION-TYP = 'R'                                    CAT660D 
              SET MFDST-FUND-REG-REJECTED TO TRUE                       CAT660D 
           ELSE                                                         CAT660D 
           IF NSCCF-ACTION-TYP = 'S'                                    CAT660D 
              SET MFDST-FUND-SYSTEM-PURGE TO TRUE                       CAT660D 
           END-IF.                                                      CAT660D 
           MOVE '0740'                    TO MFDST-CLEARING-NBR         CAT660D 
ET0001**   MOVE NSCCF-DEL-CUST-ACT-NBR    TO MFDST-CUST-ACCOUNT         CAT660D 
           MOVE NSCCF-ACATS-CTRL-NBR      TO MFDST-CONTROL-NUMBER       CAT660D 
LRM001     MOVE NSCCF-ASSET-SEQ-NBR       TO MFDST-ASSET-SEQ-NBR        CAT660D 
           PERFORM 5000-READ-VTRNFR-RTN THRU 5000-EXIT.                 CAT660D 
ET0001     IF DSTBN-SIDE-CD OF DCLVTRNFR = 'D'                          CAT660D 
ET0001        MOVE NSCCF-DEL-CUST-ACT-NBR    TO W-ACCT-NUM              CAT660D 
ET0001     ELSE                                                         CAT660D 
ET0001     IF DSTBN-SIDE-CD OF DCLVTRNFR = 'R'                          CAT660D 
ET0001        MOVE NSCCF-RCV-CUST-ACT-NBR    TO W-ACCT-NUM              CAT660D 
ET0001     END-IF.                                                      CAT660D 
ET0001                                                                  CAT660D 
ET0001     IF CSH-MGN-SHRT-CD OF DCLVASSET = 'C'                        CAT660D 
ET0001         MOVE '1'       TO W-ACCT-TYPE                            CAT660D 
ET0001     ELSE                                                         CAT660D 
ET0001     IF CSH-MGN-SHRT-CD OF DCLVASSET = 'M'                        CAT660D 
ET0001         MOVE '2'       TO W-ACCT-TYPE                            CAT660D 
ET0001     ELSE                                                         CAT660D 
ET0001     IF CSH-MGN-SHRT-CD OF DCLVASSET = 'S'                        CAT660D 
ET0001         MOVE '5'       TO W-ACCT-TYPE                            CAT660D 
ET0001     END-IF.                                                      CAT660D 
ET0001                                                                  CAT660D 
ET0001     MOVE W-ACCT-NUM      TO CK-BR-AC.                            CAT660D 
ET0001     MOVE W-ACCT-TYPE     TO CK-TYPE.                             CAT660D 
ET0001     CALL  CKDIGIT     USING CHECK-DIG-ACCT                       CAT660D 
ET0001                             NO-OF-DIG                            CAT660D 
ET0001                             D-PLUG-CHECK.                        CAT660D 
ET0001                                                                  CAT660D 
ET0001     MOVE  D-PLUG-CHECK   TO W-ACCT-CHK-DIG.                      CAT660D 
ET0001                                                                  CAT660D 
ET0001     IF DSTBN-SIDE-CD OF DCLVTRNFR = 'D'                          CAT660D 
ET0001        MOVE W-ACCT-NBR              TO MFDST-CUST-ACCOUNT        CAT660D 
ET0001        MOVE W-ACCT-NBR              TO MFDST-FROM-ACCOUNT        CAT660D 
ET0001        MOVE NSCCF-RCV-CUST-ACT-NBR  TO MFDST-TO-ACCOUNT          CAT660D 
ET0001     ELSE                                                         CAT660D 
ET0001     IF DSTBN-SIDE-CD OF DCLVTRNFR = 'R'                          CAT660D 
ET0001        MOVE NSCCF-DEL-CUST-ACT-NBR  TO MFDST-CUST-ACCOUNT        CAT660D 
ET0001        MOVE NSCCF-DEL-CUST-ACT-NBR  TO MFDST-FROM-ACCOUNT        CAT660D 
ET0001        MOVE W-ACCT-NBR              TO MFDST-TO-ACCOUNT          CAT660D 
ET0001     END-IF.                                                      CAT660D 
ET0001                                                                  CAT660D 
           IF TRNFR-TYPE-CD OF DCLVTRNFR = 'FUL'                        CAT660D 
              MOVE 'F'                    TO MFDST-FULL-PARTIAL-IND     CAT660D 
           ELSE                                                         CAT660D 
              MOVE 'P'                    TO MFDST-FULL-PARTIAL-IND     CAT660D 
           END-IF.                                                      CAT660D 
ET0001**   MOVE NSCCF-DEL-CUST-ACT-NBR    TO MFDST-FROM-ACCOUNT         CAT660D 
           IF NSCCF-FROM-ACCT-CUST-NM                                   CAT660D 
              MOVE 'B'                    TO MFDST-FROM-ACCOUNT-IND     CAT660D 
           ELSE                                                         CAT660D 
              MOVE 'F'                    TO MFDST-FROM-ACCOUNT-IND     CAT660D 
           END-IF.                                                      CAT660D 
           MOVE NSCCF-ISIN-SEC-ID         TO MFDST-CUSIP                CAT660D 
ET0001**   MOVE NSCCF-RCV-CUST-ACT-NBR    TO MFDST-TO-ACCOUNT           CAT660D 
           IF NSCCF-ACCT-FUND                                           CAT660D 
              MOVE 'F'                    TO MFDST-TO-ACCOUNT-IND       CAT660D 
           ELSE                                                         CAT660D 
           IF NSCCF-ACCT-FIRM                                           CAT660D 
              MOVE 'B'                    TO MFDST-TO-ACCOUNT-IND       CAT660D 
           END-IF.                                                      CAT660D 
                                                                        CAT660D 
           PERFORM 7000-REFORMAT-ASSET-QTY.                             CAT660D 
           MOVE W-QTY-N                   TO MFDST-QUANTITY             CAT660D 
                                                                        CAT660D 
           IF NSCCF-DIVIDEND-CD = '0'                                   CAT660D 
              MOVE 'C'                    TO MFDST-DIV-OPTION           CAT660D 
                                             MFDST-LTCG-OPTION          CAT660D 
                                             MFDST-STCG-OPTION          CAT660D 
           ELSE                                                         CAT660D 
           IF NSCCF-DIVIDEND-CD = '1'                                   CAT660D 
              MOVE 'R'                    TO MFDST-DIV-OPTION           CAT660D 
                                             MFDST-LTCG-OPTION          CAT660D 
                                             MFDST-STCG-OPTION          CAT660D 
           ELSE                                                         CAT660D 
           IF NSCCF-DIVIDEND-CD = '2'                                   CAT660D 
              MOVE 'C'                    TO MFDST-DIV-OPTION           CAT660D 
                                             MFDST-LTCG-OPTION          CAT660D 
              MOVE 'R'                    TO MFDST-STCG-OPTION          CAT660D 
           ELSE                                                         CAT660D 
           IF NSCCF-DIVIDEND-CD = '3'                                   CAT660D 
              MOVE 'C'                    TO MFDST-DIV-OPTION           CAT660D 
              MOVE 'R'                    TO MFDST-LTCG-OPTION          CAT660D 
                                             MFDST-STCG-OPTION          CAT660D 
           ELSE                                                         CAT660D 
           IF NSCCF-DIVIDEND-CD = '4'                                   CAT660D 
              MOVE 'C'                    TO MFDST-DIV-OPTION           CAT660D 
              MOVE 'R'                    TO MFDST-LTCG-OPTION          CAT660D 
              MOVE 'C'                    TO MFDST-STCG-OPTION          CAT660D 
           ELSE                                                         CAT660D 
           IF NSCCF-DIVIDEND-CD = '5'                                   CAT660D 
              MOVE 'R'                    TO MFDST-DIV-OPTION           CAT660D 
              MOVE 'C'                    TO MFDST-LTCG-OPTION          CAT660D 
                                             MFDST-STCG-OPTION          CAT660D 
           ELSE                                                         CAT660D 
           IF NSCCF-DIVIDEND-CD = '6'                                   CAT660D 
              MOVE 'R'                    TO MFDST-DIV-OPTION           CAT660D 
                                             MFDST-LTCG-OPTION          CAT660D 
              MOVE 'C'                    TO MFDST-STCG-OPTION          CAT660D 
           ELSE                                                         CAT660D 
           IF NSCCF-DIVIDEND-CD = '7'                                   CAT660D 
              MOVE 'R'                    TO MFDST-DIV-OPTION           CAT660D 
              MOVE 'C'                    TO MFDST-LTCG-OPTION          CAT660D 
              MOVE 'R'                    TO MFDST-STCG-OPTION          CAT660D 
           END-IF.                                                      CAT660D 
                                                                        CAT660D 
           IF DSTBN-SIDE-CD OF DCLVTRNFR = 'D'                          CAT660D 
              MOVE NSCCF-ORG-RCV-NBR      TO MFDST-CONTRA-BROKER        CAT660D 
              MOVE 'AD'                   TO MFDST-TRANSFER-TYPE        CAT660D 
           ELSE                                                         CAT660D 
              MOVE NSCCF-DSTRB-PART       TO MFDST-CONTRA-BROKER        CAT660D 
              MOVE 'AR'                   TO MFDST-TRANSFER-TYPE        CAT660D 
           END-IF.                                                      CAT660D 
                                                                        CAT660D 
           PERFORM 7200-REFORMAT-ASSET-AMT.                             CAT660D 
           MOVE W-QTY-N                    TO MFDST-AMOUNT              CAT660D 
           MOVE NSCCF-CUR-SETLMNT-DT       TO MFDST-SETTLEMENT-DATE     CAT660D 
           MOVE NSCCF-REJ-CD(1 : 2)        TO MFDST-REJECT-CODE         CAT660D 
           MOVE STTLM-LCTN-CD OF DCLVASSET TO MFDST-LOCATION-CODE       CAT660D 
           MOVE NSCCF-CRTF-DT              TO MFDST-FS-SETTLEMENT-DATE  CAT660D 
           IF NSCCF-CDSC-IND-FUND  > SPACES                             CAT660D 
              MOVE NSCCF-CDSC-IND-FUND        TO MFDST-CDSC-IND         CAT660D 
           ELSE                                                         CAT660D 
              MOVE '0'                        TO MFDST-CDSC-IND         CAT660D 
           END-IF.                                                      CAT660D 
                                                                        CAT660D 
           WRITE DST-RECORD            FROM MFDST-REC-WS.               CAT660D 
           ADD  +1                         TO W-OUTFILE-CNT.            CAT660D 
       4240-WRITE-DST-TRAILER-RTN.                                      CAT660D 
           MOVE '0740'                 TO MFDST-TRLR-CLEARING-NBR       CAT660D 
           MOVE  W-OUTFILE-CNT         TO MFDST-TRLR-DETAIL-REC-CNT.    CAT660D 
           WRITE DST-RECORD FROM MFDST-TRAILER-REC.                     CAT660D 
      /                                                                 CAT660D 
       5000-READ-VTRNFR-RTN.                                            CAT660D 
           MOVE 'N' TO WS-TIF-FOUND-IND.                                CAT660D 
           MOVE ' ' TO TRNFR-TYPE-CD OF DCLVTRNFR.                      CAT660D 
           MOVE '0274' TO CLIENT-NBR OF DCLVTRNFR.                      CAT660D 
           MOVE NSCCF-ACATS-CTRL-NBR    TO                              CAT660D 
                       ACAT-CONTROL-NBR OF DCLVTRNFR.                   CAT660D 
           EXEC SQL SELECT                                              CAT660D 
                  TRNFR_TYPE_CD                                         CAT660D 
                 ,DSTBN_SIDE_CD                                         CAT660D 
                  INTO                                                  CAT660D 
                   :DCLVTRNFR.TRNFR-TYPE-CD                             CAT660D 
                  ,:DCLVTRNFR.DSTBN-SIDE-CD                             CAT660D 
                  FROM VTRNFR                                           CAT660D 
                 WHERE (CLIENT_NBR                                      CAT660D 
                             = :DCLVTRNFR.CLIENT-NBR                    CAT660D 
                    AND ACAT_CONTROL_NBR                                CAT660D 
                             = :DCLVTRNFR.ACAT-CONTROL-NBR)             CAT660D 
           END-EXEC.                                                    CAT660D 
           EVALUATE SQLCODE                                             CAT660D 
               WHEN +0                                                  CAT660D 
                    SET TIF-FOUND TO TRUE                               CAT660D 
                    PERFORM 5010-READ-VASSET                            CAT660D 
               WHEN +100                                                CAT660D 
                    PERFORM 5050-READ-VTRNHSTY-RTN                      CAT660D 
               WHEN OTHER                                               CAT660D 
                    DISPLAY 'SQL ERROR ON VTRNFR SELECT ' SQLCODE       CAT660D 
                    PERFORM 8000-SQL-ERROR                              CAT660D 
           END-EVALUATE.                                                CAT660D 
       5000-EXIT. EXIT.                                                 CAT660D 
      /                                                                 CAT660D 
       5010-READ-VASSET.                                                CAT660D 
           MOVE ' ' TO STTLM-LCTN-CD OF DCLVASSET.                      CAT660D 
           MOVE '0274' TO CLIENT-NBR OF DCLVASSET.                      CAT660D 
           MOVE NSCCF-ACATS-CTRL-NBR    TO                              CAT660D 
                       ACAT-CONTROL-NBR OF DCLVASSET.                   CAT660D 
           MOVE NSCCF-ASSET-SEQ-NBR     TO                              CAT660D 
                       ASSET-SEQ-NBR OF DCLVASSET.                      CAT660D 
           EXEC SQL SELECT                                              CAT660D 
                  STTLM_LCTN_CD                                         CAT660D 
ET0001           ,CSH_MGN_SHRT_CD                                       CAT660D 
                  INTO                                                  CAT660D 
                   :DCLVASSET.STTLM-LCTN-CD                             CAT660D 
ET0001            ,:DCLVASSET.CSH-MGN-SHRT-CD                           CAT660D 
                  FROM VASSET                                           CAT660D 
                 WHERE (CLIENT_NBR                                      CAT660D 
                             = :DCLVASSET.CLIENT-NBR                    CAT660D 
                    AND ACAT_CONTROL_NBR                                CAT660D 
                             = :DCLVASSET.ACAT-CONTROL-NBR              CAT660D 
                    AND ASSET_SEQ_NBR                                   CAT660D 
                             = :DCLVASSET.ASSET-SEQ-NBR)                CAT660D 
           END-EXEC.                                                    CAT660D 
           EVALUATE SQLCODE                                             CAT660D 
               WHEN +0                                                  CAT660D 
                    CONTINUE                                            CAT660D 
               WHEN +100                                                CAT660D 
                    CONTINUE                                            CAT660D 
               WHEN OTHER                                               CAT660D 
                    DISPLAY 'SQL ERROR ON VASSET SELECT ' SQLCODE       CAT660D 
                    PERFORM 8000-SQL-ERROR                              CAT660D 
           END-EVALUATE.                                                CAT660D 
      /                                                                 CAT660D 
       5050-READ-VTRNHSTY-RTN.                                          CAT660D 
           MOVE '0274' TO CLIENT-NBR OF DCLVTRNHSTY.                    CAT660D 
           MOVE NSCCF-ACATS-CTRL-NBR    TO                              CAT660D 
                       ACAT-CONTROL-NBR OF DCLVTRNHSTY.                 CAT660D 
           EXEC SQL SELECT                                              CAT660D 
                  TRNFR_TYPE_CD                                         CAT660D 
                 ,DSTBN_SIDE_CD                                         CAT660D 
                  INTO                                                  CAT660D 
                   :DCLVTRNFR.TRNFR-TYPE-CD                             CAT660D 
                  ,:DCLVTRNFR.DSTBN-SIDE-CD                             CAT660D 
                  FROM VTRNHSTY                                         CAT660D 
                 WHERE (CLIENT_NBR                                      CAT660D 
                             = :DCLVTRNHSTY.CLIENT-NBR                  CAT660D 
                    AND ACAT_CONTROL_NBR                                CAT660D 
                             = :DCLVTRNHSTY.ACAT-CONTROL-NBR)           CAT660D 
           END-EXEC.                                                    CAT660D 
           EVALUATE SQLCODE                                             CAT660D 
               WHEN +0                                                  CAT660D 
                    SET TIF-FOUND TO TRUE                               CAT660D 
                    PERFORM 5060-READ-VASTHSTY                          CAT660D 
               WHEN +100                                                CAT660D 
                    CONTINUE                                            CAT660D 
               WHEN OTHER                                               CAT660D 
                    DISPLAY 'SQL ERROR ON VTRNHSTY SELECT ' SQLCODE     CAT660D 
                    PERFORM 8000-SQL-ERROR                              CAT660D 
           END-EVALUATE.                                                CAT660D 
      /                                                                 CAT660D 
       5060-READ-VASTHSTY.                                              CAT660D 
           MOVE '  ' TO STTLM-LCTN-CD OF DCLVASSET.                     CAT660D 
           MOVE '0274' TO CLIENT-NBR OF DCLVASTHSTY.                    CAT660D 
           MOVE NSCCF-ACATS-CTRL-NBR    TO                              CAT660D 
                       ACAT-CONTROL-NBR OF DCLVASTHSTY.                 CAT660D 
           MOVE NSCCF-ASSET-SEQ-NBR     TO                              CAT660D 
                       ASSET-SEQ-NBR OF DCLVASTHSTY.                    CAT660D 
           EXEC SQL SELECT                                              CAT660D 
                  STTLM_LCTN_CD                                         CAT660D 
                  INTO                                                  CAT660D 
                   :DCLVASSET.STTLM-LCTN-CD                             CAT660D 
                  FROM VASTHSTY                                         CAT660D 
                 WHERE (CLIENT_NBR                                      CAT660D 
                             = :DCLVASTHSTY.CLIENT-NBR                  CAT660D 
                    AND ACAT_CONTROL_NBR                                CAT660D 
                             = :DCLVASTHSTY.ACAT-CONTROL-NBR            CAT660D 
                    AND ASSET_SEQ_NBR                                   CAT660D 
                             = :DCLVASTHSTY.ASSET-SEQ-NBR)              CAT660D 
           END-EXEC.                                                    CAT660D 
           EVALUATE SQLCODE                                             CAT660D 
               WHEN +0                                                  CAT660D 
                    CONTINUE                                            CAT660D 
               WHEN +100                                                CAT660D 
                    CONTINUE                                            CAT660D 
               WHEN OTHER                                               CAT660D 
                    DISPLAY 'SQL ERROR ON VASTHSTY SELECT ' SQLCODE     CAT660D 
                    PERFORM 8000-SQL-ERROR                              CAT660D 
           END-EVALUATE.                                                CAT660D 
      /                                                                 CAT660D 
      ***************************************************************** CAT660D 
      *  REFORMAT ASSET QTY - UP TO 4 DECIMAL PLACES                    CAT660D 
      ***************************************************************** CAT660D 
       7000-REFORMAT-ASSET-QTY.                                         CAT660D 
                                                                        CAT660D 
           MOVE NSCCF-ORG-QNTY           TO W-QTY-X                     CAT660D 
           MOVE 0                        TO W-INT                       CAT660D 
                                            W-DEC                       CAT660D 
                                            W-QTY-N                     CAT660D 
           MOVE ' '                      TO W-COMMA-FND-SW              CAT660D 
                                                                        CAT660D 
           PERFORM VARYING W-COMMA-PTR FROM 1 BY 1                      CAT660D 
                     UNTIL W-COMMA-PTR > 17 OR W-COMMA-FND-SW = 'Y'     CAT660D 
                        IF W-QTY-BYTE(W-COMMA-PTR) = ','                CAT660D 
                           MOVE 'Y'      TO W-COMMA-FND-SW              CAT660D 
                        END-IF                                          CAT660D 
           END-PERFORM                                                  CAT660D 
                                                                        CAT660D 
           IF  W-COMMA-FND-SW = 'Y'                                     CAT660D 
               MOVE 17                   TO W-INT-PTR                   CAT660D 
               MOVE W-COMMA-PTR TO W-QTY-PTR                            CAT660D 
               SUBTRACT 2     FROM W-QTY-PTR                            CAT660D 
               PERFORM VARYING W-QTY-PTR FROM W-QTY-PTR BY -1           CAT660D 
                       UNTIL W-QTY-PTR = 0                              CAT660D 
                       MOVE W-QTY-BYTE(W-QTY-PTR)                       CAT660D 
                                         TO W-INT-BYTE(W-INT-PTR)       CAT660D 
                       SUBTRACT 1 FROM W-INT-PTR                        CAT660D 
               END-PERFORM                                              CAT660D 
               MOVE 1                    TO W-DEC-PTR                   CAT660D 
               MOVE W-COMMA-PTR TO W-QTY-PTR                            CAT660D 
               PERFORM VARYING W-QTY-PTR FROM W-QTY-PTR BY 1            CAT660D 
                       UNTIL (W-DEC-PTR > 4 OR W-QTY-PTR > 17)          CAT660D 
                       MOVE W-QTY-BYTE(W-QTY-PTR)                       CAT660D 
                                         TO W-DEC-BYTE(W-DEC-PTR)       CAT660D 
                       ADD 1        TO W-DEC-PTR                        CAT660D 
               END-PERFORM                                              CAT660D 
           ELSE                                                         CAT660D 
               MOVE W-QTY                TO W-INT                       CAT660D 
           END-IF.                                                      CAT660D 
           MOVE W-INT                    TO W-QTY-INT.                  CAT660D 
           MOVE W-DEC                    TO W-QTY-DEC.                  CAT660D 
           IF W-QTY-N NOT NUMERIC                                       CAT660D 
               MOVE ZEROS TO W-QTY-N                                    CAT660D 
               DISPLAY 'WIPED GARBAGE QTY FOR '                         CAT660D 
                                  W-INFILE-CNT                          CAT660D 
                              ' ' NSCCF-ACATS-CTRL-NBR                  CAT660D 
                              ' ' NSCCF-ASSET-SEQ-NBR                   CAT660D 
                        ' VALUE ' NSCCF-ORG-QNTY                        CAT660D 
           END-IF.                                                      CAT660D 
                                                                        CAT660D 
      /                                                                 CAT660D 
      ***************************************************************** CAT660D 
      *  REFORMAT ASSET AMT - UP TO 4 DECIMAL PLACES                    CAT660D 
      *                       IF ISO-CURR = USD  - UP TO 2 DECIMAL      CAT660D 
      *                       IF ISO-CURR = FCUR - UP TO 4 DECIMAL      CAT660D 
      ***************************************************************** CAT660D 
       7200-REFORMAT-ASSET-AMT.                                         CAT660D 
                                                                        CAT660D 
           MOVE NSCCF-AMOUNT             TO W-QTY-X                     CAT660D 
           MOVE 0                        TO W-INT                       CAT660D 
                                            W-DEC                       CAT660D 
                                            W-QTY-N                     CAT660D 
           MOVE ' '                      TO W-COMMA-FND-SW              CAT660D 
                                                                        CAT660D 
           PERFORM VARYING W-COMMA-PTR FROM 1 BY 1                      CAT660D 
                     UNTIL W-COMMA-PTR > 17 OR W-COMMA-FND-SW = 'Y'     CAT660D 
                        IF W-QTY-BYTE(W-COMMA-PTR) = ','                CAT660D 
                           MOVE 'Y'      TO W-COMMA-FND-SW              CAT660D 
                        END-IF                                          CAT660D 
           END-PERFORM                                                  CAT660D 
                                                                        CAT660D 
           IF  W-COMMA-FND-SW = 'Y'                                     CAT660D 
               MOVE 17                   TO W-INT-PTR                   CAT660D 
               MOVE W-COMMA-PTR TO W-QTY-PTR                            CAT660D 
               SUBTRACT 2     FROM W-QTY-PTR                            CAT660D 
               PERFORM VARYING W-QTY-PTR FROM W-QTY-PTR BY -1           CAT660D 
                       UNTIL W-QTY-PTR = 0                              CAT660D 
                       MOVE W-QTY-BYTE(W-QTY-PTR)                       CAT660D 
                                         TO W-INT-BYTE(W-INT-PTR)       CAT660D 
                       SUBTRACT 1 FROM W-INT-PTR                        CAT660D 
               END-PERFORM                                              CAT660D 
               MOVE 1                    TO W-DEC-PTR                   CAT660D 
               MOVE W-COMMA-PTR TO W-QTY-PTR                            CAT660D 
               PERFORM VARYING W-QTY-PTR FROM W-QTY-PTR BY 1            CAT660D 
                       UNTIL (W-DEC-PTR > 4 OR W-QTY-PTR > 17)          CAT660D 
                       MOVE W-QTY-BYTE(W-QTY-PTR)                       CAT660D 
                                         TO W-DEC-BYTE(W-DEC-PTR)       CAT660D 
                       ADD 1        TO W-DEC-PTR                        CAT660D 
               END-PERFORM                                              CAT660D 
           ELSE                                                         CAT660D 
               MOVE W-QTY                TO W-INT                       CAT660D 
           END-IF.                                                      CAT660D 
           MOVE W-INT                    TO W-QTY-INT.                  CAT660D 
           MOVE W-DEC                    TO W-QTY-DEC.                  CAT660D 
           IF W-QTY-N NOT NUMERIC                                       CAT660D 
               MOVE ZEROS TO W-QTY-N                                    CAT660D 
               DISPLAY 'WIPED GARBAGE QTY FOR '                         CAT660D 
                                  W-INFILE-CNT                          CAT660D 
                              ' ' NSCCF-ACATS-CTRL-NBR                  CAT660D 
                              ' ' NSCCF-ASSET-SEQ-NBR                   CAT660D 
                        ' VALUE ' NSCCF-AMOUNT                          CAT660D 
           END-IF.                                                      CAT660D 
                                                                        CAT660D 
       8000-SQL-ERROR.                                                  CAT660D 
           DISPLAY ' '                                                  CAT660D 
           DISPLAY '8000-SQL-ERROR'                                     CAT660D 
                  ' INFILE-CNT = ' W-INFILE-CNT                         CAT660D 
                                                                        CAT660D 
           PERFORM 8200-DISPLAY-DB2-MSG THRU 8200-EXIT                  CAT660D 
           DISPLAY ' '                                                  CAT660D 
                                                                        CAT660D 
           IF  L-BYP-FILECHK                                            CAT660D 
               DISPLAY 'CAT660D: FILE CHECK WILL BE BYPASSED PER JCL'   CAT660D 
           ELSE                                                         CAT660D 
               DISPLAY 'CAT660D: U3999 - ABENDING ON BAD DB2 STATUS'    CAT660D 
               MOVE +3999    TO ABEND-CODE                              CAT660D 
               CALL ABEND USING ABEND-CODE                              CAT660D 
           END-IF.                                                      CAT660D 
                                                                        CAT660D 
       8000-EXIT. EXIT.                                                 CAT660D 
      /                                                                 CAT660D 
       8200-DISPLAY-DB2-MSG.                                            CAT660D 
                                                                        CAT660D 
           DISPLAY ' '                                                  CAT660D 
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                  CAT660D 
                                    W-DB2-MESSAGE-LEN.                  CAT660D 
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                        CAT660D 
             UNTIL W-DB2-IDX GREATER THAN 12                            CAT660D 
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES              CAT660D 
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)               CAT660D 
                   END-IF                                               CAT660D 
           END-PERFORM.                                                 CAT660D 
                                                                        CAT660D 
       8200-EXIT. EXIT.                                                 CAT660D 
      /                                                                 CAT660D 
       9000-ABEND-ROUTINE.                                              CAT660D 
                                                                        CAT660D 
           DISPLAY ' '                                                  CAT660D 
           DISPLAY 'CAT660D: INPUT-CNT = ' W-INFILE-CNT                 CAT660D 
           CALL ABEND USING ABEND-CODE.                                 CAT660D 
                                                                        CAT660D 
       9000-EXIT.                                                       CAT660D 
           EXIT.                                                        CAT660D 
      /                                                                 CAT660D 
       9100-CLOSE-ROUTINE.                                              CAT660D 
                                                                        CAT660D 
           PERFORM 4240-WRITE-DST-TRAILER-RTN.                          CAT660D 
           CLOSE INFILE                                                 CAT660D 
                 DST-FILE                                               CAT660D 
                 IREG-FILE.                                             CAT660D 
                                                                        CAT660D 
           DISPLAY 'CAT660D: INFILE   CLOSED. STATUS = '                CAT660D 
                                             INFILE-STAT.               CAT660D 
                                                                        CAT660D 
           DISPLAY 'CAT660D: INFILE   COUNT = ' W-INFILE-CNT            CAT660D 
                          ' (BZZZ.SIAC0720.ACAT.FUND)'                  CAT660D 
           DISPLAY 'CAT660D: OUTFILE  COUNT = ' W-OUTFILE-CNT           CAT660D 
           DISPLAY ' '.                                                 CAT660D 
           DISPLAY 'CAT660D: PROGRAM ENDED SUCCESSFULLY'.               CAT660D 
                                                                        CAT660D 
       9100-EXIT.                                                       CAT660D 
           EXIT.                                                        CAT660D 
