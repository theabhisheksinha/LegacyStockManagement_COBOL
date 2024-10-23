000001* PDX    - CAT840A  C0365423 05/11/15 10:35:24 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                         CAT840  
       PROGRAM-ID.  CAT840A.                                            CAT840  
      ***************************************************************** CAT840  
      * CAT840A - READ THRU REVERSAL FILE AND CREATE REPORTS.         * CAT840  
      *                                                               * CAT840  
      * ADD A KEY FOR SORTING TO FRONT OF RECORD (111 BYTES)          * CAT840  
      *                                                               * CAT840  
      *                                                               * CAT840  
      * INPUT  - NSCC ACATS REVERSAL FILE      - GDG                  * CAT840  
      *        - B1 FILE FOR BROKER SELECTION  - VSAM                 * CAT840  
      *                                                               * CAT840  
      * OUTPUT - TBD                           - GDG                  * CAT840  
      *                                                               * CAT840  
      ***************************************************************** CAT840  
      * 03/30/15 LRM    NEW PROGRAM                                   * CAT840  
      ***************************************************************** CAT840  
      /                                                                 CAT840  
       ENVIRONMENT DIVISION.                                            CAT840  
       INPUT-OUTPUT SECTION.                                            CAT840  
       FILE-CONTROL.                                                    CAT840  
                                                                        CAT840  
           SELECT INFILE           ASSIGN       TO INFILE               CAT840  
                                   FILE STATUS  IS INFILE-STAT.         CAT840  
                                                                        CAT840  
           SELECT OUTFILE          ASSIGN       TO OUTFILE              CAT840  
                                   FILE STATUS  IS OUTFILE-STAT.        CAT840  
                                                                        CAT840  
           SELECT SORT-FILE        ASSIGN       TO UT-S-SORTWK01.       CAT840  
      /                                                                 CAT840  
       DATA DIVISION.                                                   CAT840  
       FILE SECTION.                                                    CAT840  
       FD  INFILE                                                       CAT840  
           RECORDING MODE IS V                                          CAT840  
           RECORD IS VARYING IN SIZE FROM 1 TO 4000 CHARACTERS          CAT840  
              DEPENDING ON W-REC-LEN-IN                                 CAT840  
           BLOCK CONTAINS 0 RECORDS.                                    CAT840  
                                                                        CAT840  
           COPY ACATRVSE REPLACING ==:NSCCRVSE:== BY ==INFILE==.        CAT840  
                                                                        CAT840  
           COPY NSCCMHDR REPLACING ==:NSCCMHDR:== BY ==NSCCMHDR==.      CAT840  
                                                                        CAT840  
           COPY NSCCMTRL REPLACING ==:NSCCMTRL:== BY ==NSCCMTRL==.      CAT840  
       01  INFILE-LARGE-RECORD       PIC X(4000).                               
                                                                        CAT840  
       FD  OUTFILE                                                      CAT840  
           RECORDING MODE IS V                                          CAT840  
           RECORD IS VARYING IN SIZE FROM 1 TO 4000 CHARACTERS          CAT840  
              DEPENDING ON W-REC-LEN-OUT                                CAT840  
           BLOCK CONTAINS 0 RECORDS.                                    CAT840  
                                                                        CAT840  
           COPY ACATRVS  REPLACING ==:ACATRVSE:== BY ==OUTFILE==.       CAT840  
       01  OUTFILE-LARGE-RECORD         PIC X(4000).                            
                                                                        CAT840  
       SD  SORT-FILE                                                    CAT840  
           RECORD IS VARYING IN SIZE FROM 1 TO 4000 CHARACTERS          CAT840  
              DEPENDING ON W-REC-LEN-SRT.                               CAT840  
                                                                        CAT840  
           COPY ACATRVS REPLACING ==:ACATRVSE:== BY ==SORT==.           CAT840  
       01  SORT-LARGE-RECORD            PIC X(4000).                            
      /                                                                 CAT840  
       WORKING-STORAGE SECTION.                                         CAT840  
       COPY PDXIDCOB.                                                   CAT840  
                                                                        CAT840  
       01  W-FIELDS.                                                    CAT840  
           05  W-PGM-NAME                PIC  X(008) VALUE 'CAT840A'.   CAT840  
           05  W-FIRST-TIME-SW           PIC  X(001) VALUE '0'.         CAT840  
               88 NOT-FIRST-TIME                     VALUE '1'.         CAT840  
           05  END-OF-INFILE-SW          PIC  X(001) VALUE '0'.         CAT840  
               88 END-OF-INFILE                      VALUE '1'.         CAT840  
           05  INFILE-STAT               PIC  X(002).                   CAT840  
               88 INFILE-OKAY            VALUE '00' THRU '09', '97'.    CAT840  
               88 INFILE-END-OF-FILE     VALUE '10'.                    CAT840  
               88 INFILE-EMPTY-MISSING VALUE '35'.                      CAT840  
           05  INFILE-DATE-SW            PIC  X(001) VALUE ' '.         CAT840  
               88 INFILE-DATE-FOUND                  VALUE 'Y'.         CAT840  
           05  OUTFILE-STAT              PIC  X(002).                   CAT840  
               88 OUTFILE-OKAY           VALUE '00' THRU '09', '97'.    CAT840  
               88 OUTFILE-END-OF-FILE    VALUE '10'.                    CAT840  
               88 OUTFILE-EMPTY-MISSING VALUE '35'.                     CAT840  
           05  W-SYS-DATE                PIC  9(006) VALUE 0.           CAT840  
           05  FILLER  REDEFINES                                        CAT840  
               W-SYS-DATE.                                              CAT840  
               10  W-UPD-DATE            PIC  X(006).                   CAT840  
           05  W-SYS-TIME                PIC  9(008) VALUE 0.           CAT840  
           05  FILLER  REDEFINES                                        CAT840  
               W-SYS-TIME.                                              CAT840  
               10  W-UPD-TIME            PIC  X(006).                   CAT840  
               10  W-UPD-TIME-MS         PIC  X(002).                   CAT840  
           05  LD-PROC-DATE.                                            CAT840  
               10 LD-PROC-DATE-MM        PIC  X(002).                   CAT840  
               10 LD-PROC-DATE-DD        PIC  X(002).                   CAT840  
               10 LD-PROC-DATE-YY        PIC  X(002).                   CAT840  
           05  W-HDR-TRL-SW              PIC  X(001) VALUE 'T'.         CAT840  
               88 HDR-FOUND                          VALUE 'H'.         CAT840  
               88 TRL-FOUND                          VALUE 'T'.         CAT840  
           05  W-BRK-SW                  PIC  X(001) VALUE ' '.         CAT840  
               88 BRK-FOUND                          VALUE 'Y'.         CAT840  
DJ0003     05  W-SUB1                    PIC  9(003) COMP-3 VALUE 0.    CAT840  
DJ0003     05  W-SUB2                    PIC  9(003) COMP-3 VALUE 0.    CAT840  
DJ0003     05  TAB-X                     PIC  9(003) COMP-3 VALUE 0.    CAT840  
           05  FILLER                    PIC  X(008) VALUE 'INPUTCNT'.  CAT840  
DJ0003     05  W-INFILE-CNT              PIC  9(011) COMP-3 VALUE 0.    CAT840  
           05  FILLER                    PIC  X(008) VALUE 'OTPUTCNT'.  CAT840  
DJ0003     05  W-OUTFILE-CNT             PIC  9(011) COMP-3 VALUE 0.    CAT840  
           05  FILLER                    PIC  X(008) VALUE 'DETAILCT'.  CAT840  
DJ0003     05  W-DETAIL-CNT              PIC  9(011) COMP-3 VALUE 0.    CAT840  
           05  FILLER                    PIC  X(008) VALUE 'RECLENIN'.  CAT840  
DJ0003     05  W-REC-LEN-IN              PIC  9(005) COMP-3 VALUE 0.    CAT840  
           05  FILLER                    PIC  X(008) VALUE 'RECLENOT'.  CAT840  
DJ0003     05  W-REC-LEN-OUT             PIC  9(005) COMP-3 VALUE 0.    CAT840  
           05  FILLER                    PIC  X(008) VALUE 'RECLENSR'.  CAT840  
DJ0003     05  W-REC-LEN-SRT             PIC  9(005) COMP-3 VALUE 0.    CAT840  
           05  FILLER                    PIC  X(008) VALUE 'NEWCYCLE'.  CAT840  
DJ0003     05  W-TI-CNT                  PIC  9(011) COMP-3 VALUE 0.    CAT840  
DJ0003     05  W-AT-CNT                  PIC  9(011) COMP-3 VALUE 0.    CAT840  
DJ0003     05  W-FR-CNT                  PIC  9(011) COMP-3 VALUE 0.    CAT840  
DJ0003     05  W-IR-CNT                  PIC  9(011) COMP-3 VALUE 0.    CAT840  
DJ0003     05  W-ATR-CNT                 PIC  9(011) COMP-3 VALUE 0.    CAT840  
DJ0003     05  W-ATO-CNT                 PIC  9(011) COMP-3 VALUE 0.    CAT840  
DJ0003     05  W-ATF-CNT                 PIC  9(011) COMP-3 VALUE 0.    CAT840  
DJ0003     05  W-ATI-CNT                 PIC  9(011) COMP-3 VALUE 0.    CAT840  
           05  W-PREV-CYCLE.                                            CAT840  
               07  W-PREV-CYCLE-N        PIC  9(004) VALUE 0.           CAT840  
           05  W-NEXT-CYCLE              PIC  9(004) VALUE 0.           CAT840  
           05  W-SORT-EOF                PIC  X(001) VALUE ' '.         CAT840  
               88  SORT-EOF              VALUE 'Y'.                     CAT840  
DJ0003     05  W-RELEASE-CNT             PIC  9(009) COMP-3 VALUE 0.    CAT840  
DJ0003     05  W-RETURN-CNT              PIC  9(009) COMP-3 VALUE 0.    CAT840  
           05  W-OTHER-BRK               PIC  X(004) VALUE ' '.         CAT840  
      /                                                                 CAT840  
DJ0006 01  FILLER                        PIC X(008) VALUE 'SIAC-HDR'.   CAT840  
DJ0006 01  W-SIAC-HEADER.                                               CAT840  
DJ0006     05  FILLER                    PIC  X(006).                   CAT840  
DJ0006     05  W-SIAC-HEADER-DATE        PIC  X(008).                   CAT840  
DJ0006     05  FILLER                    PIC  X(040).                   CAT840  
DJ0006     05  W-SIAC-HEADER-CYCLE-X.                                   CAT840  
DJ0006         07  W-SIAC-HEADER-CYCLE-N PIC  9(002).                   CAT840  
DJ0006     05  FILLER                    PIC  X(033).                   CAT840  
DJ0006     05  FILLER                    PIC  X(044).                   CAT840  
      /                                                                 CAT840  
       01  FILLER                        PIC X(008) VALUE 'TRN-REC '.   CAT840  
           COPY ACATRVSE REPLACING ==:NSCCRVSE:== BY ==W-TRN==.         CAT840  
      /                                                                 CAT840  
       01  FILLER                        PIC X(008) VALUE 'HDR-REC '.   CAT840  
           COPY NSCCMHDR REPLACING ==:NSCCMHDR:== BY ==W-HDR==.         CAT840  
      /                                                                 CAT840  
       01  FILLER                        PIC X(008) VALUE 'TRL-REC '.   CAT840  
           COPY NSCCMTRL REPLACING ==:NSCCMTRL:== BY ==W-TRL==.         CAT840  
      /                                                                 CAT840  
       01  FILLER                        PIC X(008) VALUE 'HDR-REC '.   CAT840  
           COPY NSCCMEHD REPLACING ==:NSCCMEHD:== BY ==W-OUTHDR==.      CAT840  
******/                                                                 CAT840  
****** 01  FILLER                        PIC X(008) VALUE 'TRL-REC '.   CAT840  
******     COPY NSCCMETL REPLACING ==:NSCCMETL:== BY ==W-OUTTRL==.      CAT840  
      /                                                                 CAT840  
                                                                        CAT840  
       01  FILLER                        PIC X(047) VALUE ' '.          CAT840  
       01  FILLER                        PIC X(008) VALUE 'CURR-TAB'.   CAT840  
       01  W-CURR-TAB.                                                  CAT840  
           05  W-CURR-CLIENT-NBR             PIC X(004).                CAT840  
           05  W-CURR-BRK-NBR                PIC X(004).                CAT840  
           05  W-CURR-HDR-SW                 PIC X(001).                CAT840  
           05  W-CURR-HDR-DATE               PIC X(008).                CAT840  
           05  W-CURR-HDR-CYCLE              PIC X(004).                CAT840  
           05  W-CURR-TRL-SW                 PIC X(001).                CAT840  
           05  W-CURR-TRL-DATE               PIC X(008).                CAT840  
           05  W-CURR-TRL-CYCLE              PIC X(004).                CAT840  
           05  W-CURR-ITEM-CNT               PIC 9(009).                CAT840  
           05  W-CURR-TOT-CNT                PIC 9(009).                CAT840  
                                                                        CAT840  
       01  FILLER                        PIC X(008) VALUE 'B1-TABLE'.   CAT840  
       01  B1-WORK-FIELDS.                                              CAT840  
DJ0003     03  B1-TBL-CNT                   PIC 9(03) COMP-3 VALUE 0.   CAT840  
DJ0003     03  B1-SUB                       PIC 9(03) COMP-3 VALUE 0.   CAT840  
       01  B1-TABLE-AREA.                                               CAT840  
           03  B1-TABLE OCCURS 500 TIMES.                               CAT840  
               05  B1-ADP-CL-NO             PIC 9(04).                  CAT840  
               05  B1-CLI-NAME              PIC X(30).                  CAT840  
               05  B1-BKR-CLR-NO            PIC X(04).                  CAT840  
               05  B1-ACAT-REPORT           PIC X(01).                  CAT840  
      /                                                                 CAT840  
      ******************************************************************CAT840  
      * B1 HEADER                                                      *CAT840  
      ******************************************************************CAT840  
       01  FILLER                        PIC X(08) VALUE 'BHINFO  '.    CAT840  
           COPY BHINFO.                                                 CAT840  
      /                                                                 CAT840  
      ******************************************************************CAT840  
      * B1 ACAT SECTION                                                *CAT840  
      ******************************************************************CAT840  
       01  FILLER                        PIC X(08) VALUE 'BHACAT  '.    CAT840  
           COPY BHACAT.                                                 CAT840  
      /                                                                 CAT840  
       01  FILLER                        PIC X(008) VALUE 'CP2WS   '.   CAT840  
       01  W-HDR-TRL-LEN                     PIC 9(005) VALUE 80.       CAT840  
                                                                        CAT840  
           COPY CP2WS.                                                  CAT840  
      /                                                                 CAT840  
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.   CAT840  
                                                                        CAT840  
           COPY BPDATESC.                                               CAT840  
      /                                                                 CAT840  
DJ0002***===> COBOL LE                                                  CAT840  
DJ0002 01  W-ABEND-AREA.                                                CAT840  
DJ0002     05  ABEND-CODE                PIC S9(04) COMP SYNC.          CAT840  
DJ0002 01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.   CAT840  
DJ0002     COPY STUBCPY.                                                CAT840  
DJ0002***<=== COBOL LE                                                  CAT840  
                                                                        CAT840  
       01  FILLER                        PIC X(008) VALUE 'END-O-WS'.   CAT840  
      /                                                                 CAT840  
      ***************************************************************** CAT840  
      *    LINKAGE SECTION                                            * CAT840  
      ***************************************************************** CAT840  
       LINKAGE SECTION.                                                 CAT840  
       01  L-JCL-PARMS.                                                 CAT840  
           05  PARMLENGTH                PIC S9(004) COMP SYNC.         CAT840  
           05  L-BYP-CYCLE-SW            PIC  X(001).                   CAT840  
               88  L-BYP-CYCLE                VALUE '1' '2' '3'.        CAT840  
               88  L-USE-NEXT-CYCLE-NBR              VALUE '1'.         CAT840  
               88  L-USE-PREV-CYCLE-NBR              VALUE '2'.         CAT840  
               88  L-USE-NSCC-CYCLE-NBR              VALUE '3'.         CAT840  
           05  L-BYP-DATECHK-SW          PIC  X(001).                   CAT840  
               88  L-BYP-DATECHK                     VALUE '1'.         CAT840  
           05  L-BYP-FILECHK-SW          PIC  X(001).                   CAT840  
               88  L-BYP-FILECHK                     VALUE '1'.         CAT840  
                                                                        CAT840  
       PROCEDURE DIVISION USING L-JCL-PARMS.                            CAT840  
      *                         ===========                             CAT840  
       0000-MAIN SECTION.                                               CAT840  
           DISPLAY 'CAT840A - EXTRACT NSCC/SIAC ACATS TRANSACTIONS'     CAT840  
           DISPLAY '         INPUT=BZZZ.CAT510.ACATTRAN'                CAT840  
           DISPLAY '         CREATE A FILE WITH CLIENT NUMBER ON IT'    CAT840  
           DISPLAY ' '.                                                 CAT840  
           COPY MSGCOBO.                                                CAT840  
           DISPLAY ' '.                                                 CAT840  
                                                                        CAT840  
           PERFORM 1000-INIT           THRU 1000-EXIT.                  CAT840  
                                                                        CAT840  
           SORT SORT-FILE ON ASCENDING SORT-KEY                         CAT840  
                INPUT  PROCEDURE IS 2000-SORT-INPUT  THRU 2000-EXIT     CAT840  
                OUTPUT PROCEDURE IS 5000-SORT-OUTPUT THRU 5000-EXIT.    CAT840  
                                                                        CAT840  
           PERFORM 9000-CLOSE-ROUTINE  THRU 9000-EXIT.                  CAT840  
                                                                        CAT840  
           GOBACK.                                                      CAT840  
      /                                                                 CAT840  
       1000-INIT SECTION.                                               CAT840  
                                                                        CAT840  
           ACCEPT W-SYS-DATE              FROM DATE.                    CAT840  
           ACCEPT W-SYS-TIME              FROM TIME.                    CAT840  
           DISPLAY 'CAT840A: SYS-DATE ' W-SYS-DATE                      CAT840  
                           ' SYS-TIME ' W-SYS-TIME.                     CAT840  
                                                                        CAT840  
           DISPLAY ' '.                                                 CAT840  
           DISPLAY 'CAT840A: L-BYP-CYCLE-SW   = '                       CAT840  
                             L-BYP-CYCLE-SW                             CAT840  
                   ' (1=BYPASS CYCLE NBR)'                              CAT840  
           DISPLAY 'CAT840A: L-BYP-DATECHK-SW = '                       CAT840  
                             L-BYP-DATECHK-SW                           CAT840  
                   ' (1=BYPASS DATE CHECK)'                             CAT840  
           DISPLAY 'CAT840A: L-BYP-FILECHK-SW = '                       CAT840  
                             L-BYP-FILECHK-SW                           CAT840  
                   ' (1=BYPASS FILE CHECK)'                             CAT840  
           IF  L-BYP-DATECHK                                            CAT840  
               DISPLAY 'CAT840A: DATE CHECK WILL BE BYPASSED'           CAT840  
           ELSE                                                         CAT840  
               DISPLAY 'CAT840A: DATE CHECK WILL BE PERFORMED'          CAT840  
           END-IF.                                                      CAT840  
           IF  L-BYP-FILECHK                                            CAT840  
               DISPLAY 'CAT840A: FILE CHECK WILL BE BYPASSED'           CAT840  
           ELSE                                                         CAT840  
               DISPLAY 'CAT840A: FILE CHECK WILL BE PERFORMED'          CAT840  
           END-IF.                                                      CAT840  
                                                                        CAT840  
           MOVE 'CAT840A'                 TO BPDATES-CALLING-PGM.       CAT840  
           SET  LNKDATZ-REQUEST           TO TRUE.                      CAT840  
           CALL BPDATES USING BPDATES-PARAMETERS.                       CAT840  
           MOVE BPD-PROC-DATE(3:2)        TO LD-PROC-DATE-YY.           CAT840  
           MOVE BPD-PROC-DATE(5:2)        TO LD-PROC-DATE-MM.           CAT840  
           MOVE BPD-PROC-DATE(7:2)        TO LD-PROC-DATE-DD.           CAT840  
                                                                        CAT840  
           DISPLAY ' '.                                                 CAT840  
           DISPLAY 'CAT840A:      BPD-PROC-DATE= ' BPD-PROC-DATE        CAT840  
                                '  LD-PROC-DATE= ' LD-PROC-DATE.        CAT840  
           DISPLAY 'CAT840A: BPD-PRIOR-PROC-DATE= ' BPD-PRIOR-PROC-DATE. CAT840 
           DISPLAY ' '.                                                 CAT840  
                                                                        CAT840  
           OPEN INPUT INFILE.                                           CAT840  
           DISPLAY 'CAT840A: INFILE   OPENED FOR INPUT.  STATUS = '     CAT840  
                                               INFILE-STAT.             CAT840  
                                                                        CAT840  
           IF  INFILE-OKAY                                              CAT840  
               CONTINUE                                                 CAT840  
           ELSE                                                         CAT840  
               DISPLAY 'CAT840A: ERROR OPENING INFILE'                  CAT840  
               DISPLAY 'CAT840A: OPEN STATUS = ' INFILE-STAT            CAT840  
                             '.  INPUT-CNT = ' W-INFILE-CNT             CAT840  
               DISPLAY 'CAT840A: U3001 - ABENDING ON BAD FILE STATUS'   CAT840  
               MOVE +3001    TO ABEND-CODE                              CAT840  
               CALL ABEND USING ABEND-CODE                              CAT840  
           END-IF.                                                      CAT840  
                                                                        CAT840  
           OPEN OUTPUT OUTFILE.                                         CAT840  
           DISPLAY 'CAT840A: OUTFILE  OPENED FOR OUTPUT. STATUS = '     CAT840  
                                               OUTFILE-STAT.            CAT840  
                                                                        CAT840  
           IF  OUTFILE-OKAY                                             CAT840  
               CONTINUE                                                 CAT840  
           ELSE                                                         CAT840  
               DISPLAY 'CAT840A: ERROR OPENING OUTFILE'                 CAT840  
               DISPLAY 'CAT840A: OPEN STATUS = ' OUTFILE-STAT           CAT840  
                            '.  INPUT-CNT = ' W-OUTFILE-CNT             CAT840  
               DISPLAY 'CAT840A: U3002 - ABENDING ON BAD FILE STATUS'   CAT840  
               MOVE +3002    TO ABEND-CODE                              CAT840  
               CALL ABEND USING ABEND-CODE                              CAT840  
           END-IF.                                                      CAT840  
                                                                        CAT840  
           DISPLAY ' '                                                  CAT840  
DJ0006     PERFORM 1200-GET-SIAC-HDR      THRU 1200-EXIT.               CAT840  
                                                                        CAT840  
           DISPLAY ' '.                                                 CAT840  
                                                                        CAT840  
       1000-EXIT.                                                       CAT840  
           EXIT.                                                        CAT840  
      /                                                                 CAT840  
DJ0006 1200-GET-SIAC-HDR SECTION.                                       CAT840  
DJ0006     DISPLAY '1200-GET-SIAC-HDR'.                                 CAT840  
DJ0006                                                                  CAT840  
DJ0006     READ INFILE                                                  CAT840  
DJ0006          AT END                                                  CAT840  
DJ0006             MOVE '1'              TO END-OF-INFILE-SW            CAT840  
DJ0006             DISPLAY 'CAT840A: SIAC HEADER RECORD NOT FOUND #1'   CAT840  
DJ0006             DISPLAY 'CAT840A: END OF INPUT REACHED #1'           CAT840  
DJ0006                      '.  INPUT-CNT = ' W-INFILE-CNT              CAT840  
DJ0006             GO TO 1200-EXIT                                      CAT840  
DJ0006     END-READ.                                                    CAT840  
DJ0006                                                                  CAT840  
DJ0006     IF END-OF-INFILE                                             CAT840  
DJ0006         GO 1200-EXIT                                             CAT840  
DJ0006     END-IF.                                                      CAT840  
DJ0006                                                                  CAT840  
DJ0006     IF  INFILE-REC-TYPE = '1'                                    CAT840  
DJ0006         MOVE INFILE-RECORD TO W-SIAC-HEADER                      CAT840  
DJ0006         DISPLAY ' '                                              CAT840  
DJ0006         DISPLAY 'CAT840A: THIS IS THE SIAC HEADER RECORD: '      CAT840  
DJ0006         DISPLAY '        COLS.007 = SIAC HEADER DATE '           CAT840  
DJ0006                          '(' W-SIAC-HEADER-DATE ')'              CAT840  
DJ0006         DISPLAY '        COLS.055 = SIAC HEADER CYCLE NUMBER '   CAT840  
DJ0006                          '(' W-SIAC-HEADER-CYCLE-X ')'           CAT840  
DJ0006         ' <===  USED BY OUTPUT FILE'                             CAT840  
DJ0006         DISPLAY 'COLS.001-063 => '                               CAT840  
DJ0006                 '----+----1----+----2----+----3----+----4'       CAT840  
DJ0006                 '----+----5----+----6---'                        CAT840  
DJ0006         DISPLAY 'COLS.001-063 => ' INFILE-RECORD   (1 : 63)      CAT840  
DJ0006                 ' <= COLS.001-063'                               CAT840  
DJ0006         DISPLAY ' '                                              CAT840  
DJ0006         DISPLAY 'COLS.064-133 => '                               CAT840  
DJ0006                 '-+----7----+----8----+----9----+----0'          CAT840  
DJ0006                 '----+----1----+----2----+----3---'              CAT840  
DJ0006         DISPLAY 'COLS.064-133 => ' INFILE-RECORD   (64: 70)      CAT840  
DJ0006                 ' <= COLS.064-133'                               CAT840  
DJ0006         DISPLAY ' '                                              CAT840  
DJ0006     ELSE                                                         CAT840  
DJ0006         DISPLAY 'CAT840A: SIAC HEADER RECORD NOT FOUND'          CAT840  
DJ0006         DISPLAY 'PROGRAM ABENDS'                                 CAT840  
               MOVE +1200 TO ABEND-CODE                                 CAT840  
               PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT                CAT840  
DJ0006     END-IF.                                                      CAT840  
DJ0006                                                                  CAT840  
                                                                        CAT840  
           MOVE W-REC-LEN-IN TO W-REC-LEN-OUT                                   
           MOVE INFILE-RECORD (1 : W-REC-LEN-IN) TO                     CAT840  
                OUTFILE-RECORD  (1 : W-REC-LEN-IN)                      CAT840  
                                                                        CAT840  
           WRITE OUTFILE-RECORD.                                        CAT840  
DJ0006     ADD  1                        TO W-INFILE-CNT.               CAT840  
DJ0006                                                                  CAT840  
DJ0006 1200-EXIT.                                                       CAT840  
DJ0006     EXIT.                                                        CAT840  
      /                                                                 CAT840  
                                                                        CAT840  
       1500-LOAD-B1 SECTION.                                            CAT840  
           DISPLAY 'CAT840A: 1500-LOAD-B1'.                             CAT840  
                                                                        CAT840  
           MOVE SPACES                   TO  B1-TABLE-AREA.             CAT840  
           MOVE 0                        TO  B1-TBL-CNT.                CAT840  
                                                                        CAT840  
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500        CAT840  
                                                                        CAT840  
             MOVE  ' '                   TO  BH-BROKER-HEADER-INFO      CAT840  
                                             BH-ACAT-INFO               CAT840  
             MOVE  B1-SUB                TO  BH-BROKER-NUMBER-N         CAT840  
             MOVE  '015'                 TO  BH-LOGICAL-RECORD-CODE     CAT840  
             MOVE  '434500'              TO  BH-B2-INFO-ID              CAT840  
             CALL  GETB1V              USING BH-BROKER-HEADER-INFO      CAT840  
                                             BH-ACAT-INFO               CAT840  
             IF  BH-BROKER-ACTIVE                                       CAT840  
             AND BH-ACAT-ACTIVE                                         CAT840  
             AND BH-ACAT-FAIL-REVERSAL-REPORTS  = '1'                           
                   ADD 1 TO B1-TBL-CNT                                  CAT840  
                   MOVE  BH-BROKER-NUMBER-N                             CAT840  
                                         TO B1-ADP-CL-NO  (B1-TBL-CNT)  CAT840  
                   MOVE  BH-BROKER-NAME                                 CAT840  
                                         TO B1-CLI-NAME   (B1-TBL-CNT)  CAT840  
                   MOVE  BH-BROKER-OLD-CLEARING-HOUSE (2:4)             CAT840  
                                         TO B1-BKR-CLR-NO (B1-TBL-CNT)  CAT840  
                   MOVE BH-ACAT-FAIL-REVERSAL-REPORTS                           
                                         TO B1-ACAT-REPORT(B1-TBL-CNT)  CAT840  
                   DISPLAY     'CNT=' B1-TBL-CNT                        CAT840  
                                    ' CLT ' B1-ADP-CL-NO  (B1-TBL-CNT)  CAT840  
                                        ' ' B1-CLI-NAME   (B1-TBL-CNT)  CAT840  
                                    ' BKR ' B1-BKR-CLR-NO (B1-TBL-CNT)  CAT840  
                   MOVE SPACES     TO SORT-CLIENT-HEADER                ACATRVSE
                   MOVE B1-ADP-CL-NO (B1-TBL-CNT)                       CAT840  
                                           TO SORT-HDR-CLIENT-NBR       CAT840  
                   MOVE BH-BROKER-NAME     TO SORT-BROKER-NAME          CAT840SE
                   MOVE 35 TO W-REC-LEN-SRT                             CAT840  
                   RELEASE SORT-RECORD                                  CAT840  
             END-IF                                                     CAT840  
                                                                        CAT840  
           END-PERFORM.                                                 CAT840  
                                                                        CAT840  
           DISPLAY ' '.                                                 CAT840  
                                                                        CAT840  
           DISPLAY  'B1 TABLE COUNT = ' B1-TBL-CNT.                     CAT840  
           DISPLAY ' '.                                                 CAT840  
       1500-EXIT. EXIT.                                                 CAT840  
      /                                                                 CAT840  
       2000-SORT-INPUT SECTION.                                         CAT840  
                                                                        CAT840  
           PERFORM 1500-LOAD-B1           THRU 1500-EXIT.               CAT840  
           PERFORM 2100-RELEASE-SORT THRU 2100-EXIT                     CAT840  
                   UNTIL END-OF-INFILE.                                 CAT840  
                                                                        CAT840  
       2000-EXIT.                                                       CAT840  
           EXIT.                                                        CAT840  
      /                                                                 CAT840  
       2100-RELEASE-SORT SECTION.                                       CAT840  
                                                                        CAT840  
           PERFORM 3000-READ-INPUT THRU 3000-EXIT                       CAT840  
                                                                        CAT840  
           IF  END-OF-INFILE                                            CAT840  
               GO TO 2100-EXIT                                          CAT840  
           END-IF.                                                      CAT840  
                                                                        CAT840  
           IF  NSCCMHDR-REC-TYPE = 'H' OR 'R' OR 'T'                    CAT840  
               CONTINUE                                                 CAT840  
           ELSE                                                         CAT840  
               DISPLAY 'INPUT RECORD # =' W-INFILE-CNT                  CAT840  
                       ' UNKNOWN RECORD TYPE  '                         CAT840  
                       ' W-REC-LEN-IN=' W-REC-LEN-IN                    CAT840  
               DISPLAY 'INPUT = ' INFILE-RECORD (1 : W-REC-LEN-IN)      CAT840  
               IF  L-BYP-FILECHK                                        CAT840  
                   DISPLAY 'CAT840A: BYPASSING BAD REC-TYPE PER JCL'    CAT840  
                   GO TO 2100-RELEASE-SORT                              CAT840  
               ELSE                                                     CAT840  
                   DISPLAY 'CAT840A: U3007 - ABENDING ON BAD REC-TYPE'  CAT840  
                   MOVE +3007 TO ABEND-CODE                             CAT840  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT840  
               END-IF                                                   CAT840  
           END-IF.                                                      CAT840  
                                                                        CAT840  
           MOVE INFILE-RECORD (1 : W-REC-LEN-IN) TO                     CAT840  
                W-TRN-RECORD  (1 : W-REC-LEN-IN)                        CAT840  
                                                                        CAT840  
           IF  NSCCMHDR-REC-TYPE = 'H'                                  CAT840  
               DISPLAY ' '                                              CAT840  
               DISPLAY 'INP=' W-INFILE-CNT                              CAT840  
               DISPLAY 'HEADER :' NSCCMHDR-RECORD                       CAT840  
               MOVE NSCCMHDR-RECORD TO W-HDR-RECORD                     CAT840  
               IF  W-HDR-TRL-SW = 'T'                                   CAT840  
                   PERFORM 4000-EDIT-HEADER  THRU 4000-EXIT             CAT840  
               ELSE                                                     CAT840  
                   DISPLAY 'CAT840A: MISSING TRAILER FOR PREV BROKER'   CAT840  
                   IF  L-BYP-FILECHK                                    CAT840  
                       DISPLAY 'CAT840A: BYPASSING BAD FILE PER JCLPARM' CAT840 
                   ELSE                                                 CAT840  
                       DISPLAY 'CAT840A: ABENDING ON MISSING TRAILER'   CAT840  
                       MOVE +3001 TO ABEND-CODE                         CAT840  
                       PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT        CAT840  
                   END-IF                                               CAT840  
               END-IF                                                   CAT840  
               MOVE 1          TO W-CURR-TOT-CNT                        CAT840  
           END-IF.                                                      CAT840  
                                                                        CAT840  
           IF  NSCCMHDR-REC-TYPE = 'T'                                  CAT840  
               DISPLAY 'INP=' W-INFILE-CNT                              CAT840  
               DISPLAY 'TRAILER:' NSCCMTRL-RECORD                       CAT840  
               MOVE NSCCMTRL-RECORD TO W-TRL-RECORD                     CAT840  
               ADD 1 TO W-CURR-TOT-CNT                                  CAT840  
               IF  W-HDR-TRL-SW = 'H'                                   CAT840  
                   PERFORM 4500-EDIT-TRAILER THRU 4500-EXIT             CAT840  
               ELSE                                                     CAT840  
                   DISPLAY 'CAT840A: MISSING HEADER FOR THIS TRAILER'   CAT840  
                   IF  L-BYP-FILECHK                                    CAT840  
                       DISPLAY 'CAT840A: BYPASSING BAD FILE PER JCLPARM' CAT840 
                   ELSE                                                 CAT840  
                       DISPLAY 'CAT840A: ABENDING ON MISSING HEADER'    CAT840  
                       MOVE +3001 TO ABEND-CODE                         CAT840  
                       PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT        CAT840  
                   END-IF                                               CAT840  
               END-IF                                                   CAT840  
           END-IF.                                                      CAT840  
                                                                        CAT840  
           IF  NSCCMHDR-REC-TYPE = 'R'                                  CAT840  
               ADD 1 TO W-DETAIL-CNT                                    CAT840  
               ADD 1 TO W-CURR-TOT-CNT                                  CAT840  
               IF  W-HDR-TRL-SW = 'H'                                   CAT840  
                   CONTINUE                                             CAT840  
               ELSE                                                     CAT840  
                   DISPLAY 'INPUT RECORD # =' W-INFILE-CNT              CAT840  
                   DISPLAY 'INPUT = ' INFILE-RECORD (1 : W-REC-LEN-IN)  CAT840  
                   DISPLAY 'CAT840A: MISSING HEADER FOR THIS DETAIL'    CAT840  
                   IF  L-BYP-FILECHK                                    CAT840  
                       DISPLAY 'CAT840A: BYPASSING BAD FILE PER JCLPARM' CAT840 
                   ELSE                                                 CAT840  
                       DISPLAY 'CAT840A: ABENDING ON MISSING HEADER'    CAT840  
                       MOVE +3001 TO ABEND-CODE                         CAT840  
                       PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT        CAT840  
                   END-IF                                               CAT840  
               END-IF                                                   CAT840  
           END-IF.                                                      CAT840  
                                                                        CAT840  
           IF  NSCCMHDR-REC-TYPE = 'R'                                  CAT840  
           AND W-BRK-SW = 'Y'                                           CAT840  
              IF (W-TRN-REC-SUBTYPE = 'T')                              CAT840  
                  PERFORM 2210-MOVE-TI-DATA THRU 2210-EXIT              CAT840  
              ELSE                                                              
              IF (W-TRN-REC-SUBTYPE = 'A')                              CAT840  
                   PERFORM 2220-MOVE-AT-DATA THRU 2220-EXIT             CAT840  
                   MOVE INFILE-RECORD(1 : W-REC-LEN-IN)                 CAT840  
                                             TO SORT-COMMON-AREA                
                   ADD 67 W-REC-LEN-IN  GIVING W-REC-LEN-SRT            CAT840  
                   RELEASE SORT-RECORD                                  CAT840  
                   ADD 1                     TO W-RELEASE-CNT           CAT840  
           END-IF.                                                      CAT840  
                                                                        CAT840  
       2100-EXIT.                                                       CAT840  
           EXIT.                                                        CAT840  
      /                                                                 CAT840  
       2210-MOVE-TI-DATA  SECTION.                                      CAT840  
                                                                        CAT840  
           MOVE W-CURR-CLIENT-NBR      TO SORT-KEY-CLIENT-NBR           CAT840  
           MOVE W-TRN-TI-ACAT-CTL-NBR  TO SORT-KEY-ACAT-CTL-NBR         CAT840  
           MOVE W-TRN-ASSET-SEQ-NBR    TO SORT-KEY-ASSET-SEQ-NBR        CAT840  
           MOVE W-TRN-TI-RCV-ACCT-NBR  TO SORT-RCV-ACCT-NBR                     
           MOVE W-TRN-TI-DEL-ACCT-NBR  TO SORT-DEL-ACCT-NBR                     
           ADD 1 TO W-TI-CNT.                                           CAT840  
                                                                        CAT840  
           IF  W-TRN-DIST-PARTICIPANT   = W-TRN-TI-RCV-NBR              CAT840  
               MOVE 'R'                TO SORT-DSTBN-SIDE               CAT840  
               MOVE W-TRN-TI-DEL-NBR   TO W-OTHER-BRK                   CAT840  
           ELSE                                                         CAT840  
               MOVE 'D'                TO SORT-DSTBN-SIDE               CAT840  
               MOVE W-TRN-TI-RCV-NBR   TO W-OTHER-BRK                   CAT840  
           END-IF.                                                      CAT840  
                                                                        CAT840  
       2210-EXIT.                                                       CAT840  
           EXIT.                                                        CAT840  
      /                                                                 CAT840  
       2220-MOVE-AT-DATA  SECTION.                                      CAT840  
                                                                        CAT840  
           MOVE W-TRN-AT-ACAT-CTL-NBR                                   CAT840  
                                       TO SORT-KEY-ACAT-CTL-NBR         CAT840  
           MOVE W-TRN-AT-ASSET-SEQ-NBR                                  CAT840  
                                       TO SORT-KEY-ASSET-SEQ-NBR        CAT840  
           MOVE W-TRN-AT-STL-LOC                                        CAT840  
                                       TO SORT-KEY-AT-STL-LOC                   
                                                                        CAT840  
           ADD 1 TO W-AT-CNT.                                           CAT840  
                                                                        CAT840  
           IF  W-TRN-DIST-PARTICIPANT   = W-TRN-AT-RCV-NBR              CAT840  
               MOVE 'R'                TO SORT-DSTBN-SIDE               CAT840  
               MOVE W-TRN-AT-DEL-NBR   TO W-OTHER-BRK                   CAT840  
           ELSE                                                         CAT840  
               MOVE 'D'                TO SORT-DSTBN-SIDE               CAT840  
               MOVE W-TRN-AT-RCV-NBR   TO W-OTHER-BRK                   CAT840  
           END-IF.                                                      CAT840  
                                                                        CAT840  
       2220-EXIT.                                                       CAT840  
           EXIT.                                                        CAT840  
      /                                                                 CAT840  
       3000-READ-INPUT SECTION.                                         CAT840  
                                                                        CAT840  
           IF  END-OF-INFILE                                            CAT840  
               GO 3000-EXIT                                             CAT840  
           END-IF.                                                      CAT840  
                                                                        CAT840  
           READ INFILE                                                  CAT840  
                AT END                                                  CAT840  
                   MOVE '1'              TO END-OF-INFILE-SW            CAT840  
                   DISPLAY 'CAT840A: END OF INPUT REACHED'              CAT840  
                            '.  INPUT-CNT = ' W-INFILE-CNT              CAT840  
                   GO TO 3000-EXIT                                      CAT840  
           END-READ.                                                    CAT840  
                                                                        CAT840  
           ADD  1                        TO W-INFILE-CNT.               CAT840  
                                                                        CAT840  
           IF  INFILE-OKAY                                              CAT840  
               CONTINUE                                                 CAT840  
           ELSE                                                         CAT840  
               DISPLAY 'CAT840A: ERROR READING INFILE'                  CAT840  
               DISPLAY 'CAT840A: READ STATUS = ' INFILE-STAT            CAT840  
                            '.  INPUT-CNT = ' W-INFILE-CNT              CAT840  
               DISPLAY 'CAT840A: U3008 - ABENDING ON BAD FILE STATUS'   CAT840  
               MOVE +3008 TO ABEND-CODE                                 CAT840  
               PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT                CAT840  
           END-IF.                                                      CAT840  
                                                                        CAT840  
DJ0004     IF  NSCCMHDR-REC-TYPE = '1'                                  CAT840  
DJ0004         GO TO 3000-READ-INPUT                                    CAT840  
DJ0004     END-IF.                                                      CAT840  
                                                                        CAT840  
       3000-EXIT.                                                       CAT840  
           EXIT.                                                        CAT840  
      /                                                                 CAT840  
       4000-EDIT-HEADER SECTION.                                        CAT840  
***********DISPLAY '4000-EDIT-HEADER ' W-HDR-BROKER-CLR-NBR             CAT840  
                                                                        CAT840  
           IF  W-CURR-BRK-NBR = W-HDR-BROKER-CLR-NBR                    CAT840  
               IF  W-CURR-HDR-SW = 'Y'                                  CAT840  
                   DISPLAY 'CAT840A: DUPLICATE HEADER'                  CAT840  
                           ' FOR BROKER ' W-CURR-BRK-NBR                CAT840  
                   IF  L-BYP-FILECHK                                    CAT840  
                     DISPLAY 'CAT840A: BYPASSING DUPLICATE HDR PER JCL' CAT840  
                   ELSE                                                 CAT840  
                     DISPLAY 'CAT840A: U3009 - ABENDING ON BAD FILE'    CAT840  
                     MOVE +3009 TO ABEND-CODE                           CAT840  
                     PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT          CAT840  
                   END-IF                                               CAT840  
               END-IF                                                   CAT840  
           END-IF.                                                      CAT840  
                                                                        CAT840  
           PERFORM 4050-CHECK-BROKER                                    CAT840  
                                                                        CAT840  
           IF  W-BRK-SW = 'Y'                                           CAT840  
               PERFORM 4100-EDIT-HEADER-FIELDS                          CAT840  
           END-IF.                                                      CAT840  
                                                                        CAT840  
           MOVE 'H'               TO W-HDR-TRL-SW.                      CAT840  
           MOVE 'Y'                       TO W-CURR-HDR-SW              CAT840  
           MOVE W-HDR-PROC-DATE           TO W-CURR-HDR-DATE            CAT840  
           MOVE W-HDR-MULTI-CYCLE-NBR     TO W-CURR-HDR-CYCLE.          CAT840  
                                                                        CAT840  
       4000-EXIT.                                                       CAT840  
           EXIT.                                                        CAT840  
      /                                                                 CAT840  
       4050-CHECK-BROKER              SECTION.                          CAT840  
                                                                        CAT840  
           MOVE ' '             TO W-BRK-SW                             CAT840  
           INITIALIZE              W-CURR-TAB                           CAT840  
                                                                        CAT840  
           PERFORM VARYING B1-SUB FROM 1 BY 1                           CAT840  
                   UNTIL B1-SUB > B1-TBL-CNT                            CAT840  
                      OR W-BRK-SW = 'Y'                                 CAT840  
                   IF B1-BKR-CLR-NO (B1-SUB) =                          CAT840  
                                         W-HDR-BROKER-CLR-NBR           CAT840  
                        MOVE 'Y'            TO W-BRK-SW                 CAT840  
                        MOVE B1-ADP-CL-NO (B1-SUB) TO                   CAT840  
                                         W-CURR-CLIENT-NBR              CAT840  
                        DISPLAY '======> BROKER FOUND  '                CAT840  
                                         W-HDR-BROKER-CLR-NBR           CAT840  
                                 ' CLT=' W-CURR-CLIENT-NBR              CAT840  
                               ' CYCLE=' W-HDR-MULTI-CYCLE-NBR          CAT840  
                   END-IF                                               CAT840  
           END-PERFORM.                                                 CAT840  
                                                                        CAT840  
           IF  W-BRK-SW = ' '                                           CAT840  
               MOVE W-HDR-BROKER-CLR-NBR TO W-CURR-BRK-NBR              CAT840  
                        DISPLAY 'BYPASS: BROKER NOTFND '                CAT840  
                                         W-HDR-BROKER-CLR-NBR           CAT840  
                                 ' CLT=' W-CURR-CLIENT-NBR              CAT840  
                               ' CYCLE=' W-HDR-MULTI-CYCLE-NBR          CAT840  
           END-IF.                                                      CAT840  
                                                                        CAT840  
       4050-EXIT.                                                       CAT840  
           EXIT.                                                        CAT840  
      /                                                                 CAT840  
       4100-EDIT-HEADER-FIELDS        SECTION.                          CAT840  
***********DISPLAY '4100-EDIT-HEADER-FIELDS'                            CAT840  
                                                                        CAT840  
           IF  W-HDR-PROC-DATE = BPD-PROC-DATE                          CAT840  
               CONTINUE                                                 CAT840  
           ELSE                                                         CAT840  
               DISPLAY 'CAT840A: W-HDR-PROC-DATE'                       CAT840  
                            '(' W-HDR-PROC-DATE ') NOT = '              CAT840  
                               'BPD-PROC-DATE'                          CAT840  
                            '(' BPD-PROC-DATE   ')'                     CAT840  
               IF L-BYP-DATECHK                                         CAT840  
                   DISPLAY 'CAT840A: BYPASSING DATECHK PER JCLPARM'     CAT840  
               ELSE                                                     CAT840  
                   DISPLAY 'CAT840A: U3010 - ABENDING ON BAD DATE'      CAT840  
                   MOVE +3010 TO ABEND-CODE                             CAT840  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT840  
               END-IF                                                   CAT840  
           END-IF.                                                      CAT840  
                                                                        CAT840  
           IF  W-HDR-MULTI-CYCLE-NBR NUMERIC                            CAT840  
           AND W-HDR-MULTI-CYCLE-NBR > '0000'                           CAT840  
               DISPLAY 'CAT840A: W-HDR-MULTI-CYCLE-NBR '                CAT840  
                            '(' W-HDR-MULTI-CYCLE-NBR ')'               CAT840  
           ELSE                                                         CAT840  
               DISPLAY 'CAT840A: W-HDR-MULTI-CYCLE-NBR '                CAT840  
                            '(' W-HDR-MULTI-CYCLE-NBR ')'               CAT840  
                            ' NOT NUMERIC'                              CAT840  
           END-IF.                                                      CAT840  
                                                                        CAT840  
           IF  W-HDR-VAR-LEN-REC-IND = '*'                              CAT840  
               CONTINUE                                                 CAT840  
           ELSE                                                         CAT840  
               DISPLAY 'CAT840A: W-HDR-VAR-LEN-REC-IND '                CAT840  
                            '(' W-HDR-VAR-LEN-REC-IND ')'               CAT840  
                            ' NOT = *'                                  CAT840  
               IF  L-BYP-FILECHK                                        CAT840  
                   DISPLAY 'CAT840A: BYPASSING BAD VAR-LEN-REC-IND'     CAT840  
               ELSE                                                     CAT840  
                   DISPLAY 'CAT840A: U3014 - ABENDING ON BAD VAR IND'   CAT840  
                   MOVE +3014 TO ABEND-CODE                             CAT840  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT840  
               END-IF                                                   CAT840  
           END-IF.                                                      CAT840  
                                                                        CAT840  
       4100-EXIT.                                                       CAT840  
           EXIT.                                                        CAT840  
      /                                                                 CAT840  
       4500-EDIT-TRAILER SECTION.                                       CAT840  
***********DISPLAY '4500-EDIT-TRAILER ' W-TRL-BROKER-CLR-NBR            CAT840  
                                                                        CAT840  
           IF  W-CURR-BRK-NBR = W-TRL-BROKER-CLR-NBR                    CAT840  
               IF  W-CURR-TRL-SW = 'Y'                                  CAT840  
                   DISPLAY 'CAT840A: DUPLICATE TRAILER'                 CAT840  
                   IF  L-BYP-FILECHK                                    CAT840  
                     DISPLAY 'CAT840A: BYPASSING DUPLICATE TRL PER JCL' CAT840  
                   ELSE                                                 CAT840  
                     DISPLAY 'CAT840A: U3015 - ABENDING ON BAD DATE'    CAT840  
                     MOVE +3015 TO ABEND-CODE                           CAT840  
                     PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT          CAT840  
                   END-IF                                               CAT840  
               ELSE                                                     CAT840  
                   IF  W-CURR-HDR-SW NOT = 'Y'                          CAT840  
                       DISPLAY 'CAT840A: MISSING HEADER'                CAT840  
                       MOVE +3001 TO ABEND-CODE                         CAT840  
                       PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT        CAT840  
                   END-IF                                               CAT840  
               END-IF                                                   CAT840  
           END-IF.                                                      CAT840  
                                                                        CAT840  
           MOVE 'Y'                       TO W-CURR-TRL-SW              CAT840  
           MOVE W-TRL-PROC-DATE           TO W-CURR-TRL-DATE            CAT840  
           MOVE W-TRL-MULTI-CYCLE-NBR     TO W-CURR-TRL-CYCLE.          CAT840  
           MOVE W-TRL-ITEM-CNT            TO W-CURR-ITEM-CNT.           CAT840  
                                                                        CAT840  
           IF  W-BRK-SW = 'Y'                                           CAT840  
               PERFORM 4600-EDIT-TRAILER-FIELDS                         CAT840  
           END-IF.                                                      CAT840  
                                                                        CAT840  
           MOVE 'T'               TO W-HDR-TRL-SW.                      CAT840  
                                                                        CAT840  
       4500-EXIT.                                                       CAT840  
           EXIT.                                                        CAT840  
      /                                                                 CAT840  
       4600-EDIT-TRAILER-FIELDS        SECTION.                         CAT840  
***********DISPLAY '4600-EDIT-TRAILER-FIELDS'                           CAT840  
                                                                        CAT840  
           IF  W-TRL-PROC-DATE = BPD-PROC-DATE                          CAT840  
               CONTINUE                                                 CAT840  
           ELSE                                                         CAT840  
               DISPLAY 'CAT840A: W-TRL-PROC-DATE'                       CAT840  
                            '(' W-TRL-PROC-DATE ') NOT = '              CAT840  
                               'BPD-PROC-DATE'                          CAT840  
                            '(' BPD-PROC-DATE   ')'                     CAT840  
               IF L-BYP-DATECHK                                         CAT840  
                   DISPLAY 'CAT840A: BYPASSING DATECHK PER JCLPARM'     CAT840  
               ELSE                                                     CAT840  
                   DISPLAY 'CAT840A: U3016 - ABENDING ON BAD DATE'      CAT840  
                   MOVE +3016 TO ABEND-CODE                             CAT840  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT840  
               END-IF                                                   CAT840  
           END-IF.                                                      CAT840  
                                                                        CAT840  
           IF  W-TRL-MULTI-CYCLE-IND = 'N'                              CAT840  
               CONTINUE                                                 CAT840  
           ELSE                                                         CAT840  
               DISPLAY 'CAT840A: W-TRL-MULTI-CYCLE-IND '                CAT840  
                            '(' W-TRL-MULTI-CYCLE-IND ')'               CAT840  
                            ' NOT = N'                                  CAT840  
           END-IF.                                                      CAT840  
                                                                        CAT840  
           IF  W-TRL-MULTI-CYCLE-NBR NUMERIC                            CAT840  
           AND W-TRL-MULTI-CYCLE-NBR > '0000'                           CAT840  
               DISPLAY 'CAT840A: W-TRL-MULTI-CYCLE-NBR '                CAT840  
                            '(' W-TRL-MULTI-CYCLE-NBR ')'               CAT840  
           ELSE                                                         CAT840  
               DISPLAY 'CAT840A: W-TRL-MULTI-CYCLE-NBR '                CAT840  
                            '(' W-TRL-MULTI-CYCLE-NBR ')'               CAT840  
                            ' NOT NUMERIC'                              CAT840  
           END-IF.                                                      CAT840  
                                                                        CAT840  
           IF  W-TRL-VAR-LEN-REC-IND = '*'                              CAT840  
               CONTINUE                                                 CAT840  
           ELSE                                                         CAT840  
               DISPLAY 'CAT840A: W-TRL-VAR-LEN-REC-IND '                CAT840  
                            '(' W-TRL-VAR-LEN-REC-IND ')'               CAT840  
                            ' NOT = *'                                  CAT840  
               IF  L-BYP-FILECHK                                        CAT840  
                   DISPLAY 'CAT840A: BYPASSING BAD VAR-LEN-REC-IND'     CAT840  
               ELSE                                                     CAT840  
                   DISPLAY 'CAT840A: U3020 - ABENDING ON BAD VAR IND'   CAT840  
                   MOVE +3020 TO ABEND-CODE                             CAT840  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT840  
               END-IF                                                   CAT840  
           END-IF.                                                      CAT840  
                                                                        CAT840  
           IF  W-TRL-ITEM-CNT NOT = W-CURR-TOT-CNT                      CAT840  
               DISPLAY 'CAT840A: W-TRL-ITEM-CNT '                       CAT840  
                            '(' W-TRL-ITEM-CNT ')'                      CAT840  
                           ' NOT = W-CURR-TOT-CNT '                     CAT840  
                            '(' W-CURR-TOT-CNT ')'                      CAT840  
               IF  L-BYP-FILECHK                                        CAT840  
                   DISPLAY 'CAT840A: BYPASSING BAD ITEM COUNT'          CAT840  
               ELSE                                                     CAT840  
                   DISPLAY 'CAT840A: U3021 - ABENDING ON BAD ITEM COUNT' CAT840 
                   MOVE +3021 TO ABEND-CODE                             CAT840  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT840  
               END-IF                                                   CAT840  
           END-IF.                                                      CAT840  
                                                                        CAT840  
       4600-EXIT.                                                       CAT840  
           EXIT.                                                        CAT840  
      /                                                                 CAT840  
       5000-SORT-OUTPUT    SECTION.                                     CAT840  
                                                                        CAT840  
           PERFORM 5120-RETURN-SORT THRU 5120-EXIT                      CAT840  
                   UNTIL SORT-EOF.                                      CAT840  
                                                                        CAT840  
       5000-EXIT.                                                       CAT840  
           EXIT.                                                        CAT840  
                                                                        CAT840  
       5120-RETURN-SORT    SECTION.                                     CAT840  
                                                                        CAT840  
           RETURN SORT-FILE                                             CAT840  
               AT END                                                   CAT840  
                     MOVE 'Y' TO W-SORT-EOF                             CAT840  
                     DISPLAY 'CAT840A: SORT-EOF '                       CAT840  
                                   ' RET=' W-RETURN-CNT                 CAT840  
                   GO TO 5120-EXIT.                                     CAT840  
                                                                        CAT840  
           MOVE W-REC-LEN-SRT            TO W-REC-LEN-OUT.              CAT840  
                                                                        CAT840  
           MOVE SORT-RECORD      (1 : W-REC-LEN-SRT) TO                 CAT840  
                OUTFILE-RECORD   (1 : W-REC-LEN-SRT)                    CAT840  
                                                                        CAT840  
           WRITE OUTFILE-RECORD.                                        CAT840  
           ADD 1 TO W-OUTFILE-CNT.                                      CAT840  
                                                                        CAT840  
           ADD  1                        TO W-RETURN-CNT.               CAT840  
                                                                        CAT840  
       5120-EXIT.                                                       CAT840  
           EXIT.                                                        CAT840  
      /                                                                 CAT840  
       8000-ABEND-ROUTINE SECTION.                                      CAT840  
                                                                        CAT840  
           DISPLAY ' '                                                  CAT840  
           DISPLAY 'CAT840A: INPUT-CNT = ' W-INFILE-CNT                 CAT840  
           DISPLAY 'CAT840A: W-CURR-CLIENT-NBR = '                      CAT840  
                            W-CURR-CLIENT-NBR                           CAT840  
           DISPLAY 'CAT840A: W-CURR-BRK-NBR    = '                      CAT840  
                            W-CURR-BRK-NBR                              CAT840  
           DISPLAY 'CAT840A: W-CURR-HDR-SW     = '                      CAT840  
                            W-CURR-HDR-SW                               CAT840  
           DISPLAY 'CAT840A: W-CURR-HDR-DATE   = '                      CAT840  
                            W-CURR-HDR-DATE                             CAT840  
           DISPLAY 'CAT840A: W-CURR-HDR-CYCLE  = '                      CAT840  
                            W-CURR-HDR-CYCLE                            CAT840  
           DISPLAY 'CAT840A: W-CURR-TRL-SW     = '                      CAT840  
                            W-CURR-TRL-SW                               CAT840  
           DISPLAY 'CAT840A: W-CURR-TRL-DATE   = '                      CAT840  
                            W-CURR-TRL-DATE                             CAT840  
           DISPLAY 'CAT840A: W-CURR-TRL-CYCLE  = '                      CAT840  
                            W-CURR-TRL-CYCLE                            CAT840  
           DISPLAY 'CAT840A: W-CURR-ITEM-CNT   = '                      CAT840  
                            W-CURR-ITEM-CNT                             CAT840  
           DISPLAY 'CAT840A: W-CURR-TOT-CNT    = '                      CAT840  
                            W-CURR-TOT-CNT                              CAT840  
           DISPLAY 'CAT840A: PROGRAM IS ABENDING'.                      CAT840  
                                                                        CAT840  
           CALL ABEND USING ABEND-CODE.                                 CAT840  
                                                                        CAT840  
       8000-EXIT.                                                       CAT840  
           EXIT.                                                        CAT840  
      /                                                                 CAT840  
       9000-CLOSE-ROUTINE SECTION.                                      CAT840  
                                                                        CAT840  
           MOVE SPACES TO OUTFILE-TRL-REC.                              ACATRVSE
           MOVE '9999' TO OUTFILE-TRL-CLIENT-NBR                        CAT840  
           SET OUTFILE-TRL-RECORD TO TRUE                               ACATRVSE
           MOVE W-OUTFILE-CNT TO OUTFILE-TRL-REC-CNT                    CAT840  
           DISPLAY 'CAT840A: OUT-TRL = '  OUTFILE-TRL-REC               CAT840  
                                                                        CAT840  
           MOVE W-HDR-TRL-LEN            TO W-REC-LEN-OUT.              CAT840  
           WRITE OUTFILE-RECORD.                                        CAT840  
                                                                        CAT840  
           DISPLAY ' '.                                                 CAT840  
                                                                        CAT840  
           DISPLAY ' '.                                                 CAT840  
           CLOSE INFILE                                                 CAT840  
           DISPLAY 'CAT840A: INFILE   CLOSED. STATUS = '                CAT840  
                                             INFILE-STAT.               CAT840  
           CLOSE OUTFILE                                                CAT840  
           DISPLAY 'CAT840A: OUTFILE  CLOSED. STATUS = '                CAT840  
                                             OUTFILE-STAT.              CAT840  
           DISPLAY 'CAT840A: INFILE     INPUT  COUNT = '                CAT840  
                                                   W-INFILE-CNT         CAT840  
           DISPLAY 'CAT840A: DETAIL            COUNT = '                CAT840  
                                                   W-DETAIL-CNT         CAT840  
           DISPLAY 'CAT840A: OUTFILE    OUTPUT COUNT = '                CAT840  
                                                   W-OUTFILE-CNT        CAT840  
           DISPLAY 'CAT840A: W-TI-CNT  (TRANSFER)    = ' W-TI-CNT       CAT840  
           DISPLAY 'CAT840A: W-AT-CNT  (ALL ASSETS)  = ' W-AT-CNT       CAT840  
           DISPLAY 'CAT840A: W-ATR-CNT (REGULAR)     = ' W-ATR-CNT      CAT840  
           DISPLAY 'CAT840A: W-ATO-CNT (OPTION)      = ' W-ATO-CNT      CAT840  
           DISPLAY ' '.                                                 CAT840  
           DISPLAY 'CAT840A: PROGRAM ENDED SUCCESSFULLY'.               CAT840  
                                                                        CAT840  
       9000-EXIT.                                                       CAT840  
           EXIT.                                                        CAT840  
      *################################################################ CAT840  
