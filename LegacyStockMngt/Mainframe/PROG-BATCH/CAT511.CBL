000001* PDX    - CAT511   C0270214 10/13/08 09:37:53 TBDOJUN            00001000
      * DJ0006 USE CYCLE NO FROM SIAC FILE FOR HEADER RECORD            CAT511  
000001* PDX    - CAT511   C0260091 07/07/08 09:21:31 TBDOJUN            00001000
      * DJ0005 USE LD-PROC-DATE INSTEAD OF THE DATE FROM P2HDTR         CAT511  
000001* PDX    - CAT511   C0225456 10/14/05 11:15:29 TBDOJUN            00001000
      * DJ0004 BYPASS FILE HEADER '1' RECORD THAT IS USED BY CAT510B    CAT511  
000001* PDX    - CAT511   C0215169 02/14/05 07:55:50 TBDOJUN            00001000
      * DJ0003 SSR# 40633 BYPASS SUBTYPE=I (ANNUITY REGISTRATION REC)   CAT511  
      * DJ0003 ANNUITY ASSETS, EXTRACT ONLY 585 BYTES                   CAT511  
      * DJ0003 PROCESS ONLY SUBTYPE T,A,F                               CAT511  
      * DJ0003 MIPS REDUCTION - CHANGE PIC 9 TO PIC 9 COMP-3            CAT511  
000001* PDX    - CAT511   C0155175 03/02/01 11:41:26 TBDOJUN            CAT511  
000001* PDX    - CAT511   C0151178 12/18/00 08:45:37 TBDOJUN            CAT511  
      * DJ0002 SSR# R2262400 W8 FIELDS COPYBOOK RECOMPILE. COBOL LE     CAT511  
000001* PDX    - CAT511   C0124764 04/29/99 14:57:16 TBDOJUN            CAT511  
000001* PDX    - CAT511   C0118401 11/19/98 15:28:23 TBDOJUN            CAT511  
000001* PDX    - CAT511   C0109316 11/13/98 10:43:49 TBDOJUN            CAT511  
       IDENTIFICATION DIVISION.                                         CAT511  
       PROGRAM-ID.  CAT511.                                             CAT511  
      ***************************************************************** CAT511  
      * CAT511 - ACCEPT 'M' FILE FROM NSCC, LOG IN NEW CYCLE,         * CAT511  
      *          AND PERFORM FILE CHECKING, EXTRACT FOR THIS STREAM.  * CAT511  
      *          NSCC-OUTBOUND (ADP INBOUND)                          * CAT511  
      *                                                               * CAT511  
      * PROGRAM WILL RUN AT STREAM LEVEL EXTRACTING THE 'M' FILE DATA * CAT511  
      * APPLICABLE TO THAT STREAM.  CALL GETB1  TO TABLE THE CLIENTS  * CAT511  
      * BY STREAM FIRST.                                              * CAT511  
      *                                                               * CAT511  
      * ADD A KEY FOR SORTING TO FRONT OF RECORD (111 BYTES)          * CAT511  
      *                                                               * CAT511  
      *                                                               * CAT511  
      * INPUT  - NSCC ACATS TRANSACTION FILE   - GDG                  * CAT511  
      *        - B1 FILE FOR BROKER SELECTION  - VSAM                 * CAT511  
      *        - LOG FILE FROM LAST CYCLE      - GDG                  * CAT511  
      *                                                               * CAT511  
      * OUTPUT - LOG FILE FOR THIS CYCLE       - GDG                  * CAT511  
      *          EXTRACTED FILE BY STREAM      - GDG                  * CAT511  
      *                                                               * CAT511  
      ***************************************************************** CAT511  
      * 06/25/98 DJ     NEW PROGRAM                                   * CAT511  
      * 12/18/00 DJ0002 SSR#R2262400 W8 FIELDS FOR FUND REG           * CAT511  
      ***************************************************************** CAT511  
      /                                                                 CAT511  
       ENVIRONMENT DIVISION.                                            CAT511  
       INPUT-OUTPUT SECTION.                                            CAT511  
       FILE-CONTROL.                                                    CAT511  
                                                                        CAT511  
           SELECT INFILE           ASSIGN       TO INFILE               CAT511  
                                   FILE STATUS  IS INFILE-STAT.         CAT511  
                                                                        CAT511  
           SELECT INLOG            ASSIGN       TO INLOG                CAT511  
                                   FILE STATUS  IS INLOG-STAT.          CAT511  
                                                                        CAT511  
           SELECT OUTFILE          ASSIGN       TO OUTFILE              CAT511  
                                   FILE STATUS  IS OUTFILE-STAT.        CAT511  
                                                                        CAT511  
           SELECT OUTLOG           ASSIGN       TO OUTLOG               CAT511  
                                   FILE STATUS  IS OUTLOG-STAT.         CAT511  
                                                                        CAT511  
           SELECT SORT-FILE        ASSIGN       TO UT-S-SORTWK01.       CAT511  
      /                                                                 CAT511  
       DATA DIVISION.                                                   CAT511  
       FILE SECTION.                                                    CAT511  
       FD  INFILE                                                       CAT511  
           RECORDING MODE IS V                                          CAT511  
           RECORD IS VARYING IN SIZE FROM 1 TO 3268 CHARACTERS          CAT511  
              DEPENDING ON W-REC-LEN-IN                                 CAT511  
           BLOCK CONTAINS 0 RECORDS.                                    CAT511  
                                                                        CAT511  
           COPY NSCCMTRN REPLACING ==:NSCCMTRN:== BY ==INFILE==.        CAT511  
                                                                        CAT511  
           COPY NSCCMHDR REPLACING ==:NSCCMHDR:== BY ==NSCCMHDR==.      CAT511  
                                                                        CAT511  
           COPY NSCCMTRL REPLACING ==:NSCCMTRL:== BY ==NSCCMTRL==.      CAT511  
                                                                        CAT511  
       FD  OUTFILE                                                      CAT511  
           RECORDING MODE IS V                                          CAT511  
           RECORD IS VARYING IN SIZE FROM 1 TO 3326 CHARACTERS          CAT511  
              DEPENDING ON W-REC-LEN-OUT                                CAT511  
           BLOCK CONTAINS 0 RECORDS.                                    CAT511  
                                                                        CAT511  
           COPY NSCCMEXT REPLACING ==:NSCCMEXT:== BY ==OUTFILE==.       CAT511  
                                                                        CAT511  
       FD  INLOG                                                        CAT511  
           RECORDING MODE IS F                                          CAT511  
           BLOCK CONTAINS 0 RECORDS.                                    CAT511  
                                                                        CAT511  
           COPY CATLOG  REPLACING ==:CATLOG:== BY ==INLOG==.            CAT511  
                                                                        CAT511  
       FD  OUTLOG                                                       CAT511  
           RECORDING MODE IS F                                          CAT511  
           BLOCK CONTAINS 0 RECORDS.                                    CAT511  
                                                                        CAT511  
           COPY CATLOG  REPLACING ==:CATLOG:== BY ==OUTLOG==.           CAT511  
                                                                        CAT511  
       SD  SORT-FILE                                                    CAT511  
           RECORD IS VARYING IN SIZE FROM 1 TO 3326 CHARACTERS          CAT511  
              DEPENDING ON W-REC-LEN-SRT.                               CAT511  
                                                                        CAT511  
           COPY NSCCMEXT REPLACING ==:NSCCMEXT:== BY ==SORT==.          CAT511  
      /                                                                 CAT511  
       WORKING-STORAGE SECTION.                                         CAT511  
       COPY PDXIDCOB.                                                   CAT511  
                                                                        CAT511  
       01  W-FIELDS.                                                    CAT511  
           05  W-PGM-NAME                PIC  X(008) VALUE 'CAT511'.    CAT511  
           05  W-FIRST-TIME-SW           PIC  X(001) VALUE '0'.         CAT511  
               88 NOT-FIRST-TIME                     VALUE '1'.         CAT511  
           05  END-OF-INFILE-SW          PIC  X(001) VALUE '0'.         CAT511  
               88 END-OF-INFILE                      VALUE '1'.         CAT511  
           05  INFILE-STAT               PIC  X(002).                   CAT511  
               88 INFILE-OKAY            VALUE '00' THRU '09', '97'.    CAT511  
               88 INFILE-END-OF-FILE     VALUE '10'.                    CAT511  
               88 INFILE-EMPTY-MISSING VALUE '35'.                      CAT511  
           05  INFILE-DATE-SW            PIC  X(001) VALUE ' '.         CAT511  
               88 INFILE-DATE-FOUND                  VALUE 'Y'.         CAT511  
           05  OUTFILE-STAT              PIC  X(002).                   CAT511  
               88 OUTFILE-OKAY           VALUE '00' THRU '09', '97'.    CAT511  
               88 OUTFILE-END-OF-FILE    VALUE '10'.                    CAT511  
               88 OUTFILE-EMPTY-MISSING VALUE '35'.                     CAT511  
           05  INLOG-STAT                PIC  X(002).                   CAT511  
               88 INLOG-OKAY             VALUE '00' THRU '09', '97'.    CAT511  
               88 INLOG-END-OF-FILE      VALUE '10'.                    CAT511  
               88 INLOG-DUP-REC          VALUE '22'.                    CAT511  
               88 INLOG-NOTFND           VALUE '23'.                    CAT511  
               88 INLOG-EMPTY-MISSING    VALUE '35'.                    CAT511  
           05  END-OF-INLOG-SW           PIC  X(001) VALUE '0'.         CAT511  
               88 END-OF-INLOG                       VALUE '1'.         CAT511  
           05  OUTLOG-STAT               PIC  X(002).                   CAT511  
               88 OUTLOG-OKAY            VALUE '00' THRU '09', '97'.    CAT511  
               88 OUTLOG-END-OF-FILE     VALUE '10'.                    CAT511  
               88 OUTLOG-DUP-REC         VALUE '22'.                    CAT511  
               88 OUTLOG-NOTFND          VALUE '23'.                    CAT511  
               88 OUTLOG-EMPTY-MISSING   VALUE '35'.                    CAT511  
           05  W-SYS-DATE                PIC  9(006) VALUE 0.           CAT511  
           05  FILLER  REDEFINES                                        CAT511  
               W-SYS-DATE.                                              CAT511  
               10  W-UPD-DATE            PIC  X(006).                   CAT511  
           05  W-SYS-TIME                PIC  9(008) VALUE 0.           CAT511  
           05  FILLER  REDEFINES                                        CAT511  
               W-SYS-TIME.                                              CAT511  
               10  W-UPD-TIME            PIC  X(006).                   CAT511  
               10  W-UPD-TIME-MS         PIC  X(002).                   CAT511  
           05  LD-PROC-DATE.                                            CAT511  
               10 LD-PROC-DATE-MM        PIC  X(002).                   CAT511  
               10 LD-PROC-DATE-DD        PIC  X(002).                   CAT511  
               10 LD-PROC-DATE-YY        PIC  X(002).                   CAT511  
           05  W-HDR-TRL-SW              PIC  X(001) VALUE 'T'.         CAT511  
               88 HDR-FOUND                          VALUE 'H'.         CAT511  
               88 TRL-FOUND                          VALUE 'T'.         CAT511  
           05  W-BRK-SW                  PIC  X(001) VALUE ' '.         CAT511  
               88 BRK-FOUND                          VALUE 'Y'.         CAT511  
DJ0003     05  W-SUB1                    PIC  9(003) COMP-3 VALUE 0.    CAT511  
DJ0003     05  W-SUB2                    PIC  9(003) COMP-3 VALUE 0.    CAT511  
DJ0003     05  TAB-X                     PIC  9(003) COMP-3 VALUE 0.    CAT511  
           05  FILLER                    PIC  X(008) VALUE 'INPUTCNT'.  CAT511  
DJ0003     05  W-INFILE-CNT              PIC  9(011) COMP-3 VALUE 0.    CAT511  
           05  FILLER                    PIC  X(008) VALUE 'OTPUTCNT'.  CAT511  
DJ0003     05  W-OUTFILE-CNT             PIC  9(011) COMP-3 VALUE 0.    CAT511  
           05  FILLER                    PIC  X(008) VALUE 'DETAILCT'.  CAT511  
DJ0003     05  W-DETAIL-CNT              PIC  9(011) COMP-3 VALUE 0.    CAT511  
           05  FILLER                    PIC  X(008) VALUE 'RECLENIN'.  CAT511  
DJ0003     05  W-REC-LEN-IN              PIC  9(005) COMP-3 VALUE 0.    CAT511  
           05  FILLER                    PIC  X(008) VALUE 'RECLENOT'.  CAT511  
DJ0003     05  W-REC-LEN-OUT             PIC  9(005) COMP-3 VALUE 0.    CAT511  
           05  FILLER                    PIC  X(008) VALUE 'RECLENSR'.  CAT511  
DJ0003     05  W-REC-LEN-SRT             PIC  9(005) COMP-3 VALUE 0.    CAT511  
           05  FILLER                    PIC  X(008) VALUE 'NEWCYCLE'.  CAT511  
DJ0003     05  W-TI-CNT                  PIC  9(011) COMP-3 VALUE 0.    CAT511  
DJ0003     05  W-AT-CNT                  PIC  9(011) COMP-3 VALUE 0.    CAT511  
DJ0003     05  W-FR-CNT                  PIC  9(011) COMP-3 VALUE 0.    CAT511  
DJ0003     05  W-IR-CNT                  PIC  9(011) COMP-3 VALUE 0.    CAT511  
DJ0003     05  W-ATR-CNT                 PIC  9(011) COMP-3 VALUE 0.    CAT511  
DJ0003     05  W-ATO-CNT                 PIC  9(011) COMP-3 VALUE 0.    CAT511  
DJ0003     05  W-ATF-CNT                 PIC  9(011) COMP-3 VALUE 0.    CAT511  
DJ0003     05  W-ATI-CNT                 PIC  9(011) COMP-3 VALUE 0.    CAT511  
           05  W-PREV-CYCLE.                                            CAT511  
               07  W-PREV-CYCLE-N        PIC  9(004) VALUE 0.           CAT511  
           05  W-NEXT-CYCLE              PIC  9(004) VALUE 0.           CAT511  
           05  W-SORT-EOF                PIC  X(001) VALUE ' '.         CAT511  
               88  SORT-EOF              VALUE 'Y'.                     CAT511  
DJ0003     05  W-RELEASE-CNT             PIC  9(009) COMP-3 VALUE 0.    CAT511  
DJ0003     05  W-RETURN-CNT              PIC  9(009) COMP-3 VALUE 0.    CAT511  
           05  W-OTHER-BRK               PIC  X(004) VALUE ' '.         CAT511  
      /                                                                 CAT511  
DJ0006 01  FILLER                        PIC X(008) VALUE 'SIAC-HDR'.   CAT511  
DJ0006 01  W-SIAC-HEADER.                                               CAT511  
DJ0006     05  FILLER                    PIC  X(006).                   CAT511  
DJ0006     05  W-SIAC-HEADER-DATE        PIC  X(008).                   CAT511  
DJ0006     05  FILLER                    PIC  X(040).                   CAT511  
DJ0006     05  W-SIAC-HEADER-CYCLE-X.                                   CAT511  
DJ0006         07  W-SIAC-HEADER-CYCLE-N PIC  9(002).                   CAT511  
DJ0006     05  FILLER                    PIC  X(033).                   CAT511  
DJ0006     05  FILLER                    PIC  X(044).                   CAT511  
      /                                                                 CAT511  
       01  FILLER                        PIC X(008) VALUE 'TRN-REC '.   CAT511  
           COPY NSCCMTRN REPLACING ==:NSCCMTRN:== BY ==W-TRN==.         CAT511  
      /                                                                 CAT511  
       01  FILLER                        PIC X(008) VALUE 'HDR-REC '.   CAT511  
           COPY NSCCMHDR REPLACING ==:NSCCMHDR:== BY ==W-HDR==.         CAT511  
      /                                                                 CAT511  
       01  FILLER                        PIC X(008) VALUE 'TRL-REC '.   CAT511  
           COPY NSCCMTRL REPLACING ==:NSCCMTRL:== BY ==W-TRL==.         CAT511  
      /                                                                 CAT511  
       01  FILLER                        PIC X(008) VALUE 'HDR-REC '.   CAT511  
           COPY NSCCMEHD REPLACING ==:NSCCMEHD:== BY ==W-OUTHDR==.      CAT511  
      /                                                                 CAT511  
       01  FILLER                        PIC X(008) VALUE 'TRL-REC '.   CAT511  
           COPY NSCCMETL REPLACING ==:NSCCMETL:== BY ==W-OUTTRL==.      CAT511  
      /                                                                 CAT511  
       01  FILLER                        PIC X(008) VALUE 'W-LOG   '.   CAT511  
           COPY CATLOG   REPLACING ==:CATLOG:== BY ==W-LOG==.           CAT511  
      /                                                                 CAT511  
       01  FILLER                        PIC X(008) VALUE 'W-TAB   '.   CAT511  
DJ0003 01  W-TAB-CNT                     PIC  9(003) COMP-3 VALUE 0.    CAT511  
       01  W-TAB-AREA.                                                  CAT511  
           05  W-TAB OCCURS 100 TIMES.                                  CAT511  
               10 W-TAB-STREAM-CD            PIC X(001).                CAT511  
               10 W-TAB-CLIENT-NBR           PIC X(004).                CAT511  
               10 W-TAB-BRK-NBR              PIC X(004).                CAT511  
               10 W-TAB-HDR-SW               PIC X(001).                CAT511  
               10 W-TAB-HDR-DATE             PIC X(008).                CAT511  
               10 W-TAB-HDR-CYCLE            PIC X(004).                CAT511  
               10 W-TAB-TRL-SW               PIC X(001).                CAT511  
               10 W-TAB-TRL-DATE             PIC X(008).                CAT511  
               10 W-TAB-TRL-CYCLE            PIC X(004).                CAT511  
               10 W-TAB-ITEM-CNT             PIC 9(009).                CAT511  
               10 W-TAB-TOT-CNT              PIC 9(009).                CAT511  
                                                                        CAT511  
       01  FILLER                        PIC X(047) VALUE ' '.          CAT511  
       01  FILLER                        PIC X(008) VALUE 'CURR-TAB'.   CAT511  
       01  W-CURR-TAB.                                                  CAT511  
           05  W-CURR-STREAM-CD              PIC X(001).                CAT511  
           05  W-CURR-CLIENT-NBR             PIC X(004).                CAT511  
           05  W-CURR-BRK-NBR                PIC X(004).                CAT511  
           05  W-CURR-HDR-SW                 PIC X(001).                CAT511  
           05  W-CURR-HDR-DATE               PIC X(008).                CAT511  
           05  W-CURR-HDR-CYCLE              PIC X(004).                CAT511  
           05  W-CURR-TRL-SW                 PIC X(001).                CAT511  
           05  W-CURR-TRL-DATE               PIC X(008).                CAT511  
           05  W-CURR-TRL-CYCLE              PIC X(004).                CAT511  
           05  W-CURR-ITEM-CNT               PIC 9(009).                CAT511  
           05  W-CURR-TOT-CNT                PIC 9(009).                CAT511  
                                                                        CAT511  
       01  FILLER                        PIC X(008) VALUE 'B1-TABLE'.   CAT511  
       01  B1-WORK-FIELDS.                                              CAT511  
DJ0003     03  B1-TBL-CNT                   PIC 9(03) COMP-3 VALUE 0.   CAT511  
DJ0003     03  B1-SUB                       PIC 9(03) COMP-3 VALUE 0.   CAT511  
       01  B1-TABLE-AREA.                                               CAT511  
           03  B1-TABLE OCCURS 500 TIMES.                               CAT511  
               05  B1-ADP-CL-NO             PIC 9(04).                  CAT511  
               05  B1-CLI-NAME              PIC X(30).                  CAT511  
               05  B1-BKR-CLR-NO            PIC X(04).                  CAT511  
               05  B1-STREAM                PIC X(01).                  CAT511  
               05  B1-STATUS                PIC X(01).                  CAT511  
               05  B1-ACAT-STATUS           PIC X(01).                  CAT511  
      /                                                                 CAT511  
      ******************************************************************CAT511  
      * B1 HEADER                                                      *CAT511  
      ******************************************************************CAT511  
       01  FILLER                        PIC X(08) VALUE 'BHINFO  '.    CAT511  
           COPY BHINFO.                                                 CAT511  
      /                                                                 CAT511  
      ******************************************************************CAT511  
      * B1 ACAT SECTION                                                *CAT511  
      ******************************************************************CAT511  
       01  FILLER                        PIC X(08) VALUE 'BHACAT  '.    CAT511  
           COPY BHACAT.                                                 CAT511  
      /                                                                 CAT511  
       01  FILLER                        PIC X(008) VALUE 'CP2WS   '.   CAT511  
       01  W-HDR-TRL-LEN                     PIC 9(005) VALUE 120.      CAT511  
                                                                        CAT511  
           COPY CP2WS.                                                  CAT511  
      /                                                                 CAT511  
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.   CAT511  
                                                                        CAT511  
           COPY BPDATESC.                                               CAT511  
      /                                                                 CAT511  
DJ0002***===> COBOL LE                                                  CAT511  
DJ0002 01  W-ABEND-AREA.                                                CAT511  
DJ0002     05  ABEND-CODE                PIC S9(04) COMP SYNC.          CAT511  
DJ0002 01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.   CAT511  
DJ0002     COPY STUBCPY.                                                CAT511  
DJ0002***<=== COBOL LE                                                  CAT511  
                                                                        CAT511  
       01  FILLER                        PIC X(008) VALUE 'END-O-WS'.   CAT511  
      /                                                                 CAT511  
      ***************************************************************** CAT511  
      *    LINKAGE SECTION                                            * CAT511  
      ***************************************************************** CAT511  
       LINKAGE SECTION.                                                 CAT511  
       01  L-JCL-PARMS.                                                 CAT511  
           05  PARMLENGTH                PIC S9(004) COMP SYNC.         CAT511  
           05  L-STREAM                  PIC  X(001).                   CAT511  
               88  L-ALL-STREAM                      VALUE 'Z'.         CAT511  
           05  L-BYP-CYCLE-SW            PIC  X(001).                   CAT511  
               88  L-BYP-CYCLE                VALUE '1' '2' '3'.        CAT511  
               88  L-USE-NEXT-CYCLE-NBR              VALUE '1'.         CAT511  
               88  L-USE-PREV-CYCLE-NBR              VALUE '2'.         CAT511  
               88  L-USE-NSCC-CYCLE-NBR              VALUE '3'.         CAT511  
           05  L-BYP-DATECHK-SW          PIC  X(001).                   CAT511  
               88  L-BYP-DATECHK                     VALUE '1'.         CAT511  
           05  L-BYP-FILECHK-SW          PIC  X(001).                   CAT511  
               88  L-BYP-FILECHK                     VALUE '1'.         CAT511  
                                                                        CAT511  
       PROCEDURE DIVISION USING L-JCL-PARMS.                            CAT511  
      *                         ===========                             CAT511  
       0000-MAIN SECTION.                                               CAT511  
           DISPLAY 'CAT511 - EXTRACT NSCC/SIAC ACATS TRANSACTIONS'      CAT511  
                           ' BY STREAM AND GET CLIENT NBR'.             CAT511  
           DISPLAY '         INPUT=BZZZ.CAT510.ACATTRAN'                CAT511  
           DISPLAY '         CREATE A FILE WITH CLIENT NUMBER ON IT'    CAT511  
           DISPLAY ' '.                                                 CAT511  
           COPY MSGCOBO.                                                CAT511  
           DISPLAY ' '.                                                 CAT511  
                                                                        CAT511  
           PERFORM 1000-INIT           THRU 1000-EXIT.                  CAT511  
                                                                        CAT511  
           SORT SORT-FILE ON ASCENDING SORT-KEY                         CAT511  
                INPUT  PROCEDURE IS 2000-SORT-INPUT  THRU 2000-EXIT     CAT511  
                OUTPUT PROCEDURE IS 5000-SORT-OUTPUT THRU 5000-EXIT.    CAT511  
                                                                        CAT511  
           PERFORM 8500-UPDATE-LOG-HDR THRU 8500-EXIT.                  CAT511  
           PERFORM 9000-CLOSE-ROUTINE  THRU 9000-EXIT.                  CAT511  
                                                                        CAT511  
           GOBACK.                                                      CAT511  
      /                                                                 CAT511  
       1000-INIT SECTION.                                               CAT511  
                                                                        CAT511  
           ACCEPT W-SYS-DATE              FROM DATE.                    CAT511  
           ACCEPT W-SYS-TIME              FROM TIME.                    CAT511  
           DISPLAY 'CAT511: SYS-DATE ' W-SYS-DATE                       CAT511  
                          ' SYS-TIME ' W-SYS-TIME.                      CAT511  
                                                                        CAT511  
           DISPLAY ' '.                                                 CAT511  
           DISPLAY 'CAT511: L-STREAM         = '                        CAT511  
                            L-STREAM                                    CAT511  
           DISPLAY 'CAT511: L-BYP-CYCLE-SW   = '                        CAT511  
                            L-BYP-CYCLE-SW                              CAT511  
                   ' (1=BYPASS CYCLE NBR)'                              CAT511  
           DISPLAY 'CAT511: L-BYP-DATECHK-SW = '                        CAT511  
                            L-BYP-DATECHK-SW                            CAT511  
                   ' (1=BYPASS DATE CHECK)'                             CAT511  
           DISPLAY 'CAT511: L-BYP-FILECHK-SW = '                        CAT511  
                            L-BYP-FILECHK-SW                            CAT511  
                   ' (1=BYPASS FILE CHECK)'                             CAT511  
           IF  L-BYP-DATECHK                                            CAT511  
               DISPLAY 'CAT511: DATE CHECK WILL BE BYPASSED'            CAT511  
           ELSE                                                         CAT511  
               DISPLAY 'CAT511: DATE CHECK WILL BE PERFORMED'           CAT511  
           END-IF.                                                      CAT511  
           IF  L-BYP-FILECHK                                            CAT511  
               DISPLAY 'CAT511: FILE CHECK WILL BE BYPASSED'            CAT511  
           ELSE                                                         CAT511  
               DISPLAY 'CAT511: FILE CHECK WILL BE PERFORMED'           CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           MOVE 'CAT511'                  TO BPDATES-CALLING-PGM.       CAT511  
           SET  LNKDATZ-REQUEST           TO TRUE.                      CAT511  
           CALL BPDATES USING BPDATES-PARAMETERS.                       CAT511  
           MOVE BPD-PROC-DATE(3:2)        TO LD-PROC-DATE-YY.           CAT511  
           MOVE BPD-PROC-DATE(5:2)        TO LD-PROC-DATE-MM.           CAT511  
           MOVE BPD-PROC-DATE(7:2)        TO LD-PROC-DATE-DD.           CAT511  
                                                                        CAT511  
           DISPLAY ' '.                                                 CAT511  
           DISPLAY 'CAT511:       BPD-PROC-DATE= ' BPD-PROC-DATE        CAT511  
                                '  LD-PROC-DATE= ' LD-PROC-DATE.        CAT511  
           DISPLAY 'CAT511: BPD-PRIOR-PROC-DATE= ' BPD-PRIOR-PROC-DATE. CAT511  
           DISPLAY ' '.                                                 CAT511  
                                                                        CAT511  
           OPEN INPUT INFILE.                                           CAT511  
           DISPLAY 'CAT511: INFILE   OPENED FOR INPUT.  STATUS = '      CAT511  
                                               INFILE-STAT.             CAT511  
                                                                        CAT511  
           IF  INFILE-OKAY                                              CAT511  
               CONTINUE                                                 CAT511  
           ELSE                                                         CAT511  
               DISPLAY 'CAT511: ERROR OPENING INFILE'                   CAT511  
               DISPLAY 'CAT511: OPEN STATUS = ' INFILE-STAT             CAT511  
                            '.  INPUT-CNT = ' W-INFILE-CNT              CAT511  
               DISPLAY 'CAT511: U3001 - ABENDING ON BAD FILE STATUS'    CAT511  
               MOVE +3001    TO ABEND-CODE                              CAT511  
               CALL ABEND USING ABEND-CODE                              CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           OPEN OUTPUT OUTFILE.                                         CAT511  
           DISPLAY 'CAT511: OUTFILE  OPENED FOR OUTPUT. STATUS = '      CAT511  
                                               OUTFILE-STAT.            CAT511  
                                                                        CAT511  
           IF  OUTFILE-OKAY                                             CAT511  
               CONTINUE                                                 CAT511  
           ELSE                                                         CAT511  
               DISPLAY 'CAT511: ERROR OPENING OUTFILE'                  CAT511  
               DISPLAY 'CAT511: OPEN STATUS = ' OUTFILE-STAT            CAT511  
                            '.  INPUT-CNT = ' W-OUTFILE-CNT             CAT511  
               DISPLAY 'CAT511: U3002 - ABENDING ON BAD FILE STATUS'    CAT511  
               MOVE +3002    TO ABEND-CODE                              CAT511  
               CALL ABEND USING ABEND-CODE                              CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           OPEN INPUT INLOG.                                            CAT511  
           DISPLAY 'CAT511: INLOG    OPENED FOR INPUT.  STATUS = '      CAT511  
                                               INLOG-STAT.              CAT511  
                                                                        CAT511  
           IF  INLOG-OKAY                                               CAT511  
               CONTINUE                                                 CAT511  
           ELSE                                                         CAT511  
               DISPLAY 'CAT511: ERROR OPENING INLOG'                    CAT511  
               DISPLAY 'CAT511: OPEN STATUS = ' INLOG-STAT              CAT511  
               DISPLAY 'CAT511: U3003 - ABENDING ON BAD FILE STATUS'    CAT511  
               MOVE +3003    TO ABEND-CODE                              CAT511  
               CALL ABEND USING ABEND-CODE                              CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           OPEN OUTPUT OUTLOG.                                          CAT511  
           DISPLAY 'CAT511: OUTLOG   OPENED FOR OUTPUT. STATUS = '      CAT511  
                                               OUTLOG-STAT.             CAT511  
                                                                        CAT511  
           IF  OUTLOG-OKAY                                              CAT511  
               CONTINUE                                                 CAT511  
           ELSE                                                         CAT511  
               DISPLAY 'CAT511: ERROR OPENING OUTLOG'                   CAT511  
               DISPLAY 'CAT511: OPEN STATUS = ' OUTLOG-STAT             CAT511  
               DISPLAY 'CAT511: U3004 - ABENDING ON BAD FILE STATUS'    CAT511  
               MOVE +3004    TO ABEND-CODE                              CAT511  
               CALL ABEND USING ABEND-CODE                              CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           DISPLAY ' '                                                  CAT511  
           PERFORM 1100-GET-LOG-HDR       THRU 1100-EXIT.               CAT511  
DJ0006     PERFORM 1200-GET-SIAC-HDR      THRU 1200-EXIT.               CAT511  
           PERFORM 1300-WRITE-OUTFILE-HDR THRU 1300-EXIT.               CAT511  
           PERFORM 1500-LOAD-B1           THRU 1500-EXIT.               CAT511  
           PERFORM 1600-LOAD-TABLE        THRU 1600-EXIT.               CAT511  
                                                                        CAT511  
           DISPLAY ' '.                                                 CAT511  
                                                                        CAT511  
       1000-EXIT.                                                       CAT511  
           EXIT.                                                        CAT511  
      /                                                                 CAT511  
       1100-GET-LOG-HDR SECTION.                                        CAT511  
                                                                        CAT511  
      ******************************************************************CAT511  
      *  READ THE LOG FILE TO GET THE TIMESTAMP                         CAT511  
      *  FOR THE LAST TIME WE PROCESSED NSCC OUTBOUND (ADP INBOUND)     CAT511  
      ******************************************************************CAT511  
                                                                        CAT511  
           READ INLOG INTO W-LOG-RECORD                                 CAT511  
                AT END                                                  CAT511  
                   MOVE '1'              TO END-OF-INLOG-SW             CAT511  
                   INITIALIZE            W-LOG-RECORD                   CAT511  
                   DISPLAY 'CAT511: END OF INLOG REACHED'               CAT511  
                   DISPLAY 'CAT511: INLOG FILE IS EMPTY'                CAT511  
           END-READ.                                                    CAT511  
                                                                        CAT511  
           IF  END-OF-INLOG                                             CAT511  
               IF  L-BYP-FILECHK                                        CAT511  
                   DISPLAY 'CAT511: BYPASSING EMPTY INLOG PER JCL'      CAT511  
               ELSE                                                     CAT511  
                   DISPLAY 'CAT511: U3005 - ABENDING ON EMPTY FILE'     CAT511  
                   MOVE +3005 TO ABEND-CODE                             CAT511  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT511  
               END-IF                                                   CAT511  
           ELSE                                                         CAT511  
               IF  INLOG-OKAY                                           CAT511  
                   DISPLAY 'CAT511: INLOG STREAM ' L-STREAM             CAT511  
                                  ' NSCC OUTBOUND (ADP INBOUND)'        CAT511  
                                  ' CYCLE HEADER (O0) FOUND'            CAT511  
               ELSE                                                     CAT511  
                   DISPLAY ' '                                          CAT511  
                   DISPLAY 'CAT511: U3006 - INLOG READ ERROR '          CAT511  
                           ' FILE STATUS = ' INLOG-STAT                 CAT511  
                   MOVE +3006    TO ABEND-CODE                          CAT511  
                   CALL ABEND USING ABEND-CODE                          CAT511  
               END-IF                                                   CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           IF W-LOG-CYCLE-NBR NOT NUMERIC                               CAT511  
              MOVE 0000 TO W-LOG-CYCLE-NBR                              CAT511  
           END-IF                                                       CAT511  
                                                                        CAT511  
           DISPLAY 'CAT511: PREV-PROC-DATE   = '                        CAT511  
                                           W-LOG-PROC-DATE              CAT511  
           DISPLAY 'CAT511: PREV-CYCLE-NBR   = '                        CAT511  
                                           W-LOG-CYCLE-NBR              CAT511  
           DISPLAY 'CAT511: PREV-PGM-NAME    = '                        CAT511  
                                           W-LOG-PGM-NAME               CAT511  
           DISPLAY 'CAT511: PREV-SYS-DATE    = '                        CAT511  
                                           W-LOG-SYS-DATE               CAT511  
           DISPLAY 'CAT511: PREV-SYS-TIME    = '                        CAT511  
                                           W-LOG-SYS-TIME               CAT511  
                                                                        CAT511  
           IF  W-LOG-PROC-DATE = BPD-PROC-DATE                          CAT511  
               MOVE W-LOG-CYCLE-NBR TO W-NEXT-CYCLE                     CAT511  
               IF  L-USE-PREV-CYCLE-NBR                                 CAT511  
                   DISPLAY 'CAT511: USING PREV CYCLE NBR PER JCL'       CAT511  
               ELSE                                                     CAT511  
                   ADD 1            TO W-NEXT-CYCLE                     CAT511  
               END-IF                                                   CAT511  
           ELSE                                                         CAT511  
               DISPLAY 'CAT511: FIRST CYCLE OF THE DAY'                 CAT511  
               DISPLAY 'CAT511: STARTING LOG-CYCLE WITH ONE'            CAT511  
               MOVE 1               TO W-NEXT-CYCLE                     CAT511  
           END-IF                                                       CAT511  
                                                                        CAT511  
           IF  W-NEXT-CYCLE = 0                                         CAT511  
               MOVE 1    TO W-NEXT-CYCLE                                CAT511  
           END-IF                                                       CAT511  
                                                                        CAT511  
           DISPLAY 'CAT511: NEXT-CYCLE-NBR   = '  W-NEXT-CYCLE          CAT511  
           DISPLAY ' '.                                                 CAT511  
                                                                        CAT511  
       1100-EXIT.                                                       CAT511  
           EXIT.                                                        CAT511  
      /                                                                 CAT511  
DJ0006 1200-GET-SIAC-HDR SECTION.                                       CAT511  
DJ0006     DISPLAY '1200-GET-SIAC-HDR'.                                 CAT511  
DJ0006                                                                  CAT511  
DJ0006     READ INFILE                                                  CAT511  
DJ0006          AT END                                                  CAT511  
DJ0006             MOVE '1'              TO END-OF-INFILE-SW            CAT511  
DJ0006             DISPLAY 'CAT511: SIAC HEADER RECORD NOT FOUND #1'    CAT511  
DJ0006             DISPLAY 'CAT511: END OF INPUT REACHED #1'            CAT511  
DJ0006                      '.  INPUT-CNT = ' W-INFILE-CNT              CAT511  
DJ0006             GO TO 1200-EXIT                                      CAT511  
DJ0006     END-READ.                                                    CAT511  
DJ0006                                                                  CAT511  
DJ0006     IF END-OF-INFILE                                             CAT511  
DJ0006         GO 1200-EXIT                                             CAT511  
DJ0006     END-IF.                                                      CAT511  
DJ0006                                                                  CAT511  
DJ0006     IF  INFILE-REC-TYPE = '1'                                    CAT511  
DJ0006         MOVE INFILE-RECORD TO W-SIAC-HEADER                      CAT511  
DJ0006         DISPLAY ' '                                              CAT511  
DJ0006         DISPLAY 'CAT511: THIS IS THE SIAC HEADER RECORD: '       CAT511  
DJ0006         DISPLAY '        COLS.007 = SIAC HEADER DATE '           CAT511  
DJ0006                          '(' W-SIAC-HEADER-DATE ')'              CAT511  
DJ0006         DISPLAY '        COLS.055 = SIAC HEADER CYCLE NUMBER '   CAT511  
DJ0006                          '(' W-SIAC-HEADER-CYCLE-X ')'           CAT511  
DJ0006         ' <===  USED BY OUTPUT FILE'                             CAT511  
DJ0006         DISPLAY 'COLS.001-063 => '                               CAT511  
DJ0006                 '----+----1----+----2----+----3----+----4'       CAT511  
DJ0006                 '----+----5----+----6---'                        CAT511  
DJ0006         DISPLAY 'COLS.001-063 => ' INFILE-RECORD   (1 : 63)      CAT511  
DJ0006                 ' <= COLS.001-063'                               CAT511  
DJ0006         DISPLAY ' '                                              CAT511  
DJ0006         DISPLAY 'COLS.064-133 => '                               CAT511  
DJ0006                 '-+----7----+----8----+----9----+----0'          CAT511  
DJ0006                 '----+----1----+----2----+----3---'              CAT511  
DJ0006         DISPLAY 'COLS.064-133 => ' INFILE-RECORD   (64: 70)      CAT511  
DJ0006                 ' <= COLS.064-133'                               CAT511  
DJ0006         DISPLAY ' '                                              CAT511  
DJ0006     ELSE                                                         CAT511  
DJ0006             DISPLAY 'CAT511: SIAC HEADER RECORD NOT FOUND #2'    CAT511  
DJ0006     END-IF.                                                      CAT511  
DJ0006                                                                  CAT511  
DJ0006     ADD  1                        TO W-INFILE-CNT.               CAT511  
DJ0006                                                                  CAT511  
DJ0006 1200-EXIT.                                                       CAT511  
DJ0006     EXIT.                                                        CAT511  
      /                                                                 CAT511  
       1300-WRITE-OUTFILE-HDR SECTION.                                  CAT511  
                                                                        CAT511  
           MOVE 'H'                      TO CP2-REQUEST-CODE.           CAT511  
           MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.             CAT511  
           MOVE 999                      TO CP2-CLIENT-NUMBER.          CAT511  
                                                                        CAT511  
           CALL P2HDTR                USING CP2-AREA                    CAT511  
                                            OUTFILE.                    CAT511  
                                                                        CAT511  
           MOVE SPACES                   TO W-OUTHDR-REC                CAT511  
           MOVE CP2-RETURN-RECORD        TO W-OUTHDR-P2                 CAT511  
                                                                        CAT511  
DJ0005     MOVE LD-PROC-DATE             TO W-OUTHDR-PROC-DATE          CAT511  
DJ0006     MOVE W-SIAC-HEADER-CYCLE-X    TO W-OUTHDR-CYCLE-NBR-X        CAT511  
                                                                        CAT511  
           DISPLAY 'CAT511: OUT-HDR = '     W-OUTHDR-REC                CAT511  
                                                                        CAT511  
           MOVE W-HDR-TRL-LEN            TO W-REC-LEN-OUT.              CAT511  
                                                                        CAT511  
           MOVE W-OUTHDR-REC (1 : W-REC-LEN-OUT) TO                     CAT511  
                OUTFILE-HDR-REC  (1 : W-REC-LEN-OUT)                    CAT511  
                                                                        CAT511  
           WRITE OUTFILE-RECORD.                                        CAT511  
                                                                        CAT511  
       1300-EXIT.                                                       CAT511  
           EXIT.                                                        CAT511  
      /                                                                 CAT511  
       1500-LOAD-B1 SECTION.                                            CAT511  
           DISPLAY 'CAT511: 1500-LOAD-B1'.                              CAT511  
                                                                        CAT511  
           MOVE SPACES                   TO  B1-TABLE-AREA.             CAT511  
           MOVE 0                        TO  B1-TBL-CNT.                CAT511  
                                                                        CAT511  
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500        CAT511  
                                                                        CAT511  
             MOVE  ' '                   TO  BH-BROKER-HEADER-INFO      CAT511  
                                             BH-ACAT-INFO               CAT511  
             MOVE  B1-SUB                TO  BH-BROKER-NUMBER-N         CAT511  
             MOVE  '015'                 TO  BH-LOGICAL-RECORD-CODE     CAT511  
             MOVE  '434500'              TO  BH-B2-INFO-ID              CAT511  
             CALL  GETB1V              USING BH-BROKER-HEADER-INFO      CAT511  
                                             BH-ACAT-INFO               CAT511  
             IF   BH-BROKER-ACTIVE                                      CAT511  
              AND BH-ACAT-ACTIVE                                        CAT511  
                   ADD 1 TO B1-TBL-CNT                                  CAT511  
                   MOVE  BH-BROKER-NUMBER-N                             CAT511  
                                         TO B1-ADP-CL-NO  (B1-TBL-CNT)  CAT511  
                   MOVE  BH-BROKER-NAME                                 CAT511  
                                         TO B1-CLI-NAME   (B1-TBL-CNT)  CAT511  
                   MOVE  BH-BROKER-OLD-CLEARING-HOUSE (2:4)             CAT511  
                                         TO B1-BKR-CLR-NO (B1-TBL-CNT)  CAT511  
                   IF  BH-BROKER-MINI-MAXI-SUBGROUP > ' '               CAT511  
                       MOVE BH-BROKER-MINI-MAXI-SUBGROUP                CAT511  
                                         TO B1-STREAM     (B1-TBL-CNT)  CAT511  
                   ELSE                                                 CAT511  
                      MOVE BH-BROKER-MINI-MAXI-INDICATOR                CAT511  
                                         TO B1-STREAM     (B1-TBL-CNT)  CAT511  
                   END-IF                                               CAT511  
                   MOVE  BH-BROKER-STATUS                               CAT511  
                                         TO B1-STATUS     (B1-TBL-CNT)  CAT511  
                   MOVE  BH-ACAT-STATUS                                 CAT511  
                                         TO B1-ACAT-STATUS(B1-TBL-CNT)  CAT511  
                       DISPLAY     'CNT=' B1-TBL-CNT                    CAT511  
                                    ' CLT ' B1-ADP-CL-NO  (B1-TBL-CNT)  CAT511  
                                        ' ' B1-CLI-NAME   (B1-TBL-CNT)  CAT511  
                                    ' BKR ' B1-BKR-CLR-NO (B1-TBL-CNT)  CAT511  
                                    ' STR ' B1-STREAM     (B1-TBL-CNT)  CAT511  
                                    ' STA ' B1-STATUS     (B1-TBL-CNT)  CAT511  
                                   ' ACAT ' B1-ACAT-STATUS(B1-TBL-CNT)  CAT511  
             END-IF                                                     CAT511  
                                                                        CAT511  
           END-PERFORM.                                                 CAT511  
                                                                        CAT511  
           DISPLAY ' '.                                                 CAT511  
                                                                        CAT511  
           DISPLAY  'B1 TABLE COUNT = ' B1-TBL-CNT.                     CAT511  
           DISPLAY ' '.                                                 CAT511  
       1500-EXIT. EXIT.                                                 CAT511  
      /                                                                 CAT511  
       1600-LOAD-TABLE.                                                 CAT511  
                                                                        CAT511  
           MOVE 0 TO W-SUB2.                                            CAT511  
           PERFORM VARYING W-SUB1 FROM 1 BY 1                           CAT511  
                   UNTIL W-SUB1 > B1-TBL-CNT                            CAT511  
                IF B1-STREAM          (W-SUB1) = L-STREAM               CAT511  
                   ADD 1 TO W-SUB2                                      CAT511  
                   MOVE B1-STREAM     (W-SUB1)                          CAT511  
                                  TO W-TAB-STREAM-CD  (W-SUB2)          CAT511  
                   MOVE B1-ADP-CL-NO  (W-SUB1)                          CAT511  
                                  TO W-TAB-CLIENT-NBR (W-SUB2)          CAT511  
                   MOVE B1-BKR-CLR-NO (W-SUB1)                          CAT511  
                                  TO W-TAB-BRK-NBR    (W-SUB2)          CAT511  
                   MOVE 0         TO W-TAB-ITEM-CNT   (W-SUB2)          CAT511  
                   MOVE 0         TO W-TAB-TOT-CNT    (W-SUB2)          CAT511  
                   ADD 1 TO W-TAB-CNT                                   CAT511  
                   DISPLAY 'LOADED W-TAB ' W-SUB2 ' : '                 CAT511  
                           ' STREAM '       W-TAB-STREAM-CD  (W-SUB2)   CAT511  
                           ' CLT '          W-TAB-CLIENT-NBR (W-SUB2)   CAT511  
                           ' BRK '          W-TAB-BRK-NBR    (W-SUB2)   CAT511  
                END-IF                                                  CAT511  
           END-PERFORM.                                                 CAT511  
                                                                        CAT511  
           DISPLAY 'CAT511: W-TAB-CNT = ' W-TAB-CNT.                    CAT511  
           DISPLAY ' '.                                                 CAT511  
                                                                        CAT511  
       1600-EXIT.                                                       CAT511  
           EXIT.                                                        CAT511  
      /                                                                 CAT511  
       2000-SORT-INPUT SECTION.                                         CAT511  
                                                                        CAT511  
           PERFORM 2100-RELEASE-SORT THRU 2100-EXIT                     CAT511  
                   UNTIL END-OF-INFILE.                                 CAT511  
                                                                        CAT511  
       2000-EXIT.                                                       CAT511  
           EXIT.                                                        CAT511  
      /                                                                 CAT511  
       2100-RELEASE-SORT SECTION.                                       CAT511  
                                                                        CAT511  
           PERFORM 3000-READ-INPUT THRU 3000-EXIT                       CAT511  
                                                                        CAT511  
           IF  END-OF-INFILE                                            CAT511  
               GO TO 2100-EXIT                                          CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           IF  NSCCMHDR-REC-TYPE = 'H' OR 'M' OR 'T'                    CAT511  
               CONTINUE                                                 CAT511  
           ELSE                                                         CAT511  
               DISPLAY 'INPUT RECORD # =' W-INFILE-CNT                  CAT511  
                       ' UNKNOWN RECORD TYPE  '                         CAT511  
                       ' W-REC-LEN-IN=' W-REC-LEN-IN                    CAT511  
               DISPLAY 'INPUT = ' INFILE-RECORD (1 : W-REC-LEN-IN)      CAT511  
               IF  L-BYP-FILECHK                                        CAT511  
                   DISPLAY 'CAT511: BYPASSING BAD REC-TYPE PER JCL'     CAT511  
                   GO TO 2100-RELEASE-SORT                              CAT511  
               ELSE                                                     CAT511  
                   DISPLAY 'CAT511: U3007 - ABENDING ON BAD REC-TYPE'   CAT511  
                   MOVE +3007 TO ABEND-CODE                             CAT511  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT511  
               END-IF                                                   CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           MOVE SPACES        TO W-TRN-RECORD                           CAT511  
           MOVE INFILE-RECORD (1 : W-REC-LEN-IN) TO                     CAT511  
                W-TRN-RECORD  (1 : W-REC-LEN-IN)                        CAT511  
                                                                        CAT511  
           IF  NSCCMHDR-REC-TYPE = 'H'                                  CAT511  
               DISPLAY ' '                                              CAT511  
               DISPLAY 'INP=' W-INFILE-CNT                              CAT511  
               DISPLAY 'HEADER :' NSCCMHDR-RECORD                       CAT511  
               MOVE NSCCMHDR-RECORD TO W-HDR-RECORD                     CAT511  
               IF  W-HDR-TRL-SW = 'T'                                   CAT511  
                   PERFORM 4000-EDIT-HEADER  THRU 4000-EXIT             CAT511  
               ELSE                                                     CAT511  
                   DISPLAY 'CAT511: MISSING TRAILER FOR PREV BROKER'    CAT511  
                   IF  L-BYP-FILECHK                                    CAT511  
                       DISPLAY 'CAT511: BYPASSING BAD FILE PER JCLPARM' CAT511  
                   ELSE                                                 CAT511  
                       DISPLAY 'CAT511: ABENDING ON MISSING TRAILER'    CAT511  
                       MOVE +3001 TO ABEND-CODE                         CAT511  
                       PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT        CAT511  
                   END-IF                                               CAT511  
               END-IF                                                   CAT511  
               MOVE 1          TO W-CURR-TOT-CNT                        CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           IF  NSCCMHDR-REC-TYPE = 'T'                                  CAT511  
               DISPLAY 'INP=' W-INFILE-CNT                              CAT511  
               DISPLAY 'TRAILER:' NSCCMTRL-RECORD                       CAT511  
               MOVE NSCCMTRL-RECORD TO W-TRL-RECORD                     CAT511  
               ADD 1 TO W-CURR-TOT-CNT                                  CAT511  
               IF  W-HDR-TRL-SW = 'H'                                   CAT511  
                   PERFORM 4500-EDIT-TRAILER THRU 4500-EXIT             CAT511  
               ELSE                                                     CAT511  
                   DISPLAY 'CAT511: MISSING HEADER FOR THIS TRAILER'    CAT511  
                   IF  L-BYP-FILECHK                                    CAT511  
                       DISPLAY 'CAT511: BYPASSING BAD FILE PER JCLPARM' CAT511  
                   ELSE                                                 CAT511  
                       DISPLAY 'CAT511: ABENDING ON MISSING HEADER'     CAT511  
                       MOVE +3001 TO ABEND-CODE                         CAT511  
                       PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT        CAT511  
                   END-IF                                               CAT511  
               END-IF                                                   CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           IF  NSCCMHDR-REC-TYPE = 'M'                                  CAT511  
               ADD 1 TO W-DETAIL-CNT                                    CAT511  
               ADD 1 TO W-CURR-TOT-CNT                                  CAT511  
               IF  W-HDR-TRL-SW = 'H'                                   CAT511  
                   CONTINUE                                             CAT511  
               ELSE                                                     CAT511  
                   DISPLAY 'INPUT RECORD # =' W-INFILE-CNT              CAT511  
                   DISPLAY 'INPUT = ' INFILE-RECORD (1 : W-REC-LEN-IN)  CAT511  
                   DISPLAY 'CAT511: MISSING HEADER FOR THIS DETAIL'     CAT511  
                   IF  L-BYP-FILECHK                                    CAT511  
                       DISPLAY 'CAT511: BYPASSING BAD FILE PER JCLPARM' CAT511  
                   ELSE                                                 CAT511  
                       DISPLAY 'CAT511: ABENDING ON MISSING HEADER'     CAT511  
                       MOVE +3001 TO ABEND-CODE                         CAT511  
                       PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT        CAT511  
                   END-IF                                               CAT511  
               END-IF                                                   CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           IF  NSCCMHDR-REC-TYPE = 'M'                                  CAT511  
           AND W-BRK-SW = 'Y'                                           CAT511  
DJ0003     AND (W-TRN-REC-SUBTYPE = 'T' OR 'A' OR 'F')                  CAT511  
               PERFORM 2200-FORMAT-SORT THRU 2200-EXIT                  CAT511  
               RELEASE SORT-RECORD                                      CAT511  
               ADD 1                     TO W-RELEASE-CNT               CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
DJ0003     IF  (W-TRN-REC-SUBTYPE = 'I')                                CAT511  
DJ0003         ADD 1                     TO W-IR-CNT                    CAT511  
DJ0003     END-IF.                                                      CAT511  
                                                                        CAT511  
       2100-EXIT.                                                       CAT511  
           EXIT.                                                        CAT511  
      /                                                                 CAT511  
       2200-FORMAT-SORT    SECTION.                                     CAT511  
                                                                        CAT511  
           MOVE SPACES                   TO SORT-RECORD                 CAT511  
           MOVE W-TAB-STREAM-CD  (TAB-X) TO SORT-KEY-STREAM-CD          CAT511  
           MOVE W-TAB-CLIENT-NBR (TAB-X) TO SORT-KEY-CLIENT-NBR         CAT511  
                                                                        CAT511  
           IF  W-TRN-REC-SUBTYPE = 'T'                                  CAT511  
                   PERFORM 2210-MOVE-TI-DATA THRU 2210-EXIT             CAT511  
           ELSE                                                         CAT511  
               IF  W-TRN-REC-SUBTYPE = 'A'                              CAT511  
                   PERFORM 2220-MOVE-AT-DATA THRU 2220-EXIT             CAT511  
               ELSE                                                     CAT511  
                   PERFORM 2230-MOVE-FR-DATA THRU 2230-EXIT             CAT511  
               END-IF                                                   CAT511  
           END-IF                                                       CAT511  
                                                                        CAT511  
           MOVE W-REC-LEN-IN             TO W-REC-LEN-SRT.              CAT511  
                                                                        CAT511  
DJ0003***--ANNUITY ASSETS, EXTRACT ONLY 585 BYTES                       CAT511  
DJ0003     IF  W-TRN-AT-IN-LEN                                          CAT511  
DJ0003         MOVE '0585' TO W-TRN-REC-LEN                             CAT511  
DJ0003         MOVE W-TRN-RECORD    (1 : 585) TO                        CAT511  
DJ0003              SORT-TRN-REC    (1 : 585)                           CAT511  
DJ0003     ELSE                                                         CAT511  
               MOVE W-TRN-RECORD    (1 : W-REC-LEN-IN) TO               CAT511  
                    SORT-TRN-REC    (1 : W-REC-LEN-IN)                  CAT511  
DJ0003     END-IF.                                                      CAT511  
                                                                        CAT511  
           ADD  111                      TO W-REC-LEN-SRT.              CAT511  
                                                                        CAT511  
       2200-EXIT.                                                       CAT511  
           EXIT.                                                        CAT511  
      /                                                                 CAT511  
       2210-MOVE-TI-DATA  SECTION.                                      CAT511  
                                                                        CAT511  
           MOVE W-TRN-TI-ACAT-CTL-NBR                                   CAT511  
                                       TO SORT-KEY-ACAT-CTL-NBR         CAT511  
           MOVE ZEROES                                                  CAT511  
                                       TO SORT-KEY-ASSET-SEQ-NBR        CAT511  
           MOVE '10'                                                    CAT511  
                                       TO SORT-KEY-REC-TYPE.            CAT511  
           MOVE W-TRN-TI-TFR-TYPE                                       CAT511  
                                       TO SORT-KEY-TFR-TYPE             CAT511  
           ADD 1 TO W-TI-CNT.                                           CAT511  
                                                                        CAT511  
           IF  W-TRN-DIST-PARTICIPANT = W-TRN-TI-SUB-PART-NBR           CAT511  
               MOVE 'S'                TO SORT-S-SUBMIT-IND             CAT511  
           ELSE                                                         CAT511  
               MOVE ' '                TO SORT-S-SUBMIT-IND             CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           IF  W-TRN-DIST-PARTICIPANT   = W-TRN-TI-RCV-NBR              CAT511  
               MOVE 'R'                TO SORT-S-SIDE                   CAT511  
               MOVE W-TRN-TI-DEL-NBR   TO W-OTHER-BRK                   CAT511  
           ELSE                                                         CAT511  
               MOVE 'D'                TO SORT-S-SIDE                   CAT511  
               MOVE W-TRN-TI-RCV-NBR   TO W-OTHER-BRK                   CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           PERFORM 2800-GET-OTHER-SIDE THRU 2800-EXIT.                  CAT511  
                                                                        CAT511  
       2210-EXIT.                                                       CAT511  
           EXIT.                                                        CAT511  
      /                                                                 CAT511  
       2220-MOVE-AT-DATA  SECTION.                                      CAT511  
                                                                        CAT511  
           MOVE W-TRN-AT-ACAT-CTL-NBR                                   CAT511  
                                       TO SORT-KEY-ACAT-CTL-NBR         CAT511  
           MOVE W-TRN-AT-ASSET-SEQ-NBR                                  CAT511  
                                       TO SORT-KEY-ASSET-SEQ-NBR        CAT511  
           MOVE W-TRN-AT-TFR-TYPE                                       CAT511  
                                       TO SORT-KEY-TFR-TYPE             CAT511  
                                                                        CAT511  
           MOVE '20'                   TO SORT-KEY-REC-TYPE             CAT511  
           ADD 1 TO W-AT-CNT.                                           CAT511  
                                                                        CAT511  
           EVALUATE TRUE                                                CAT511  
                    WHEN W-TRN-AT-LEN     ADD 1 TO W-ATR-CNT            CAT511  
                    WHEN W-TRN-AT-OP-LEN  ADD 1 TO W-ATO-CNT            CAT511  
                    WHEN W-TRN-AT-MF-LEN  ADD 1 TO W-ATF-CNT            CAT511  
DJ0003              WHEN W-TRN-AT-IN-LEN  ADD 1 TO W-ATI-CNT            CAT511  
           END-EVALUATE                                                 CAT511  
                                                                        CAT511  
           IF  W-TRN-DIST-PARTICIPANT = W-TRN-AT-SUB-PART-NBR           CAT511  
               MOVE 'S'                TO SORT-S-SUBMIT-IND             CAT511  
           ELSE                                                         CAT511  
               MOVE ' '                TO SORT-S-SUBMIT-IND             CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           IF  W-TRN-DIST-PARTICIPANT   = W-TRN-AT-RCV-NBR              CAT511  
               MOVE 'R'                TO SORT-S-SIDE                   CAT511  
               MOVE W-TRN-AT-DEL-NBR   TO W-OTHER-BRK                   CAT511  
           ELSE                                                         CAT511  
               MOVE 'D'                TO SORT-S-SIDE                   CAT511  
               MOVE W-TRN-AT-RCV-NBR   TO W-OTHER-BRK                   CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           PERFORM 2800-GET-OTHER-SIDE THRU 2800-EXIT.                  CAT511  
                                                                        CAT511  
       2220-EXIT.                                                       CAT511  
           EXIT.                                                        CAT511  
      /                                                                 CAT511  
       2230-MOVE-FR-DATA  SECTION.                                      CAT511  
                                                                        CAT511  
           MOVE W-TRN-FR-ACAT-CTL-NBR                                   CAT511  
                                       TO SORT-KEY-ACAT-CTL-NBR         CAT511  
           MOVE W-TRN-FR-ASSET-SEQ-NBR                                  CAT511  
                                       TO SORT-KEY-ASSET-SEQ-NBR        CAT511  
           MOVE W-TRN-FR-TFR-TYPE                                       CAT511  
                                       TO SORT-KEY-TFR-TYPE             CAT511  
           MOVE '30'                                                    CAT511  
                                       TO SORT-KEY-REC-TYPE.            CAT511  
           ADD 1 TO W-FR-CNT.                                           CAT511  
                                                                        CAT511  
           IF  W-TRN-DIST-PARTICIPANT = W-TRN-FR-SUB-PART-NBR           CAT511  
               MOVE 'S'                TO SORT-S-SUBMIT-IND             CAT511  
           ELSE                                                         CAT511  
               MOVE ' '                TO SORT-S-SUBMIT-IND             CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           IF  W-TRN-DIST-PARTICIPANT   = W-TRN-FR-RCV-NBR              CAT511  
               MOVE 'R'                TO SORT-S-SIDE                   CAT511  
               MOVE W-TRN-FR-DEL-NBR   TO W-OTHER-BRK                   CAT511  
           ELSE                                                         CAT511  
               MOVE 'D'                TO SORT-S-SIDE                   CAT511  
               MOVE W-TRN-FR-RCV-NBR   TO W-OTHER-BRK                   CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           PERFORM 2800-GET-OTHER-SIDE THRU 2800-EXIT.                  CAT511  
                                                                        CAT511  
       2230-EXIT.                                                       CAT511  
           EXIT.                                                        CAT511  
      /                                                                 CAT511  
       2800-GET-OTHER-SIDE SECTION.                                     CAT511  
                                                                        CAT511  
           MOVE ' '                      TO SORT-S-OTHER-CLT            CAT511  
                                            SORT-S-OTHER-STREAM.        CAT511  
                                                                        CAT511  
           PERFORM VARYING W-SUB1 FROM 1 BY 1                           CAT511  
                   UNTIL W-SUB1 > W-TAB-CNT                             CAT511  
                IF B1-BKR-CLR-NO     (W-SUB1) = W-OTHER-BRK             CAT511  
                   MOVE B1-ADP-CL-NO (W-SUB1)                           CAT511  
                                         TO SORT-S-OTHER-CLT            CAT511  
                   MOVE B1-STREAM    (W-SUB1)                           CAT511  
                                         TO SORT-S-OTHER-STREAM         CAT511  
                END-IF                                                  CAT511  
           END-PERFORM.                                                 CAT511  
                                                                        CAT511  
       2800-EXIT.                                                       CAT511  
           EXIT.                                                        CAT511  
      /                                                                 CAT511  
       3000-READ-INPUT.                                                 CAT511  
                                                                        CAT511  
           IF  END-OF-INFILE                                            CAT511  
               GO 3000-EXIT                                             CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           READ INFILE                                                  CAT511  
                AT END                                                  CAT511  
                   MOVE '1'              TO END-OF-INFILE-SW            CAT511  
                   DISPLAY 'CAT511: END OF INPUT REACHED'               CAT511  
                            '.  INPUT-CNT = ' W-INFILE-CNT              CAT511  
                   GO TO 3000-EXIT                                      CAT511  
           END-READ.                                                    CAT511  
                                                                        CAT511  
           ADD  1                        TO W-INFILE-CNT.               CAT511  
                                                                        CAT511  
           IF  INFILE-OKAY                                              CAT511  
               CONTINUE                                                 CAT511  
           ELSE                                                         CAT511  
               DISPLAY 'CAT511: ERROR READING INFILE'                   CAT511  
               DISPLAY 'CAT511: READ STATUS = ' INFILE-STAT             CAT511  
                            '.  INPUT-CNT = ' W-INFILE-CNT              CAT511  
               DISPLAY 'CAT511: U3008 - ABENDING ON BAD FILE STATUS'    CAT511  
               MOVE +3008 TO ABEND-CODE                                 CAT511  
               PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT                CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
DJ0004     IF  NSCCMHDR-REC-TYPE = '1'                                  CAT511  
DJ0004         GO TO 3000-READ-INPUT                                    CAT511  
DJ0004     END-IF.                                                      CAT511  
                                                                        CAT511  
       3000-EXIT.                                                       CAT511  
           EXIT.                                                        CAT511  
      /                                                                 CAT511  
       4000-EDIT-HEADER SECTION.                                        CAT511  
***********DISPLAY '4000-EDIT-HEADER ' W-HDR-BROKER-CLR-NBR             CAT511  
                                                                        CAT511  
           IF  W-CURR-BRK-NBR = W-HDR-BROKER-CLR-NBR                    CAT511  
               IF  W-CURR-HDR-SW = 'Y'                                  CAT511  
                   DISPLAY 'CAT511: DUPLICATE HEADER'                   CAT511  
                           ' FOR BROKER ' W-CURR-BRK-NBR                CAT511  
                   IF  L-BYP-FILECHK                                    CAT511  
                     DISPLAY 'CAT511: BYPASSING DUPLICATE HDR PER JCL'  CAT511  
                   ELSE                                                 CAT511  
                     DISPLAY 'CAT511: U3009 - ABENDING ON BAD FILE'     CAT511  
                     MOVE +3009 TO ABEND-CODE                           CAT511  
                     PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT          CAT511  
                   END-IF                                               CAT511  
               END-IF                                                   CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           PERFORM 4050-CHECK-BROKER                                    CAT511  
                                                                        CAT511  
           IF  W-BRK-SW = 'Y'                                           CAT511  
               PERFORM 4100-EDIT-HEADER-FIELDS                          CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           MOVE 'H'               TO W-HDR-TRL-SW.                      CAT511  
           MOVE 'Y'                       TO W-CURR-HDR-SW              CAT511  
           MOVE W-HDR-PROC-DATE           TO W-CURR-HDR-DATE            CAT511  
           MOVE W-HDR-MULTI-CYCLE-NBR     TO W-CURR-HDR-CYCLE.          CAT511  
                                                                        CAT511  
       4000-EXIT.                                                       CAT511  
           EXIT.                                                        CAT511  
      /                                                                 CAT511  
       4050-CHECK-BROKER              SECTION.                          CAT511  
                                                                        CAT511  
           MOVE ' '             TO W-BRK-SW                             CAT511  
           INITIALIZE              W-CURR-TAB                           CAT511  
                                                                        CAT511  
           PERFORM VARYING W-SUB1 FROM 1 BY 1                           CAT511  
                   UNTIL W-SUB1 > W-TAB-CNT                             CAT511  
                   IF  W-TAB-BRK-NBR (W-SUB1) =                         CAT511  
                                         W-HDR-BROKER-CLR-NBR           CAT511  
                        MOVE 'Y'            TO W-BRK-SW                 CAT511  
                        MOVE W-TAB (W-SUB1) TO W-CURR-TAB               CAT511  
                        DISPLAY '======> BROKER FOUND  '                CAT511  
                                         W-HDR-BROKER-CLR-NBR           CAT511  
                              ' STREAM=' W-CURR-STREAM-CD               CAT511  
                                 ' CLT=' W-CURR-CLIENT-NBR              CAT511  
                               ' CYCLE=' W-HDR-MULTI-CYCLE-NBR          CAT511  
                         MOVE W-SUB1 TO TAB-X                           CAT511  
                   END-IF                                               CAT511  
           END-PERFORM.                                                 CAT511  
                                                                        CAT511  
           IF  W-BRK-SW = ' '                                           CAT511  
               MOVE W-HDR-BROKER-CLR-NBR TO W-CURR-BRK-NBR              CAT511  
                        DISPLAY 'BYPASS: BROKER NOTFND '                CAT511  
                                         W-HDR-BROKER-CLR-NBR           CAT511  
                              ' STREAM=' W-CURR-STREAM-CD               CAT511  
                                 ' CLT=' W-CURR-CLIENT-NBR              CAT511  
                               ' CYCLE=' W-HDR-MULTI-CYCLE-NBR          CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
       4050-EXIT.                                                       CAT511  
           EXIT.                                                        CAT511  
      /                                                                 CAT511  
       4100-EDIT-HEADER-FIELDS        SECTION.                          CAT511  
***********DISPLAY '4100-EDIT-HEADER-FIELDS'                            CAT511  
                                                                        CAT511  
           IF  W-HDR-PROC-DATE = BPD-PROC-DATE                          CAT511  
               CONTINUE                                                 CAT511  
           ELSE                                                         CAT511  
               DISPLAY 'CAT511: W-HDR-PROC-DATE'                        CAT511  
                            '(' W-HDR-PROC-DATE ') NOT = '              CAT511  
                               'BPD-PROC-DATE'                          CAT511  
                            '(' BPD-PROC-DATE   ')'                     CAT511  
               IF L-BYP-DATECHK                                         CAT511  
                   DISPLAY 'CAT511: BYPASSING DATECHK PER JCLPARM'      CAT511  
               ELSE                                                     CAT511  
                   IF  L-BYP-FILECHK                                    CAT511  
                     DISPLAY 'CAT511: BYPASSING BAD DATE FILE PER JCL'  CAT511  
                   ELSE                                                 CAT511  
                     DISPLAY 'CAT511: U3010 - ABENDING ON BAD DATE'     CAT511  
                     MOVE +3010 TO ABEND-CODE                           CAT511  
                     PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT          CAT511  
                   END-IF                                               CAT511  
               END-IF                                                   CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           IF  W-HDR-MULTI-CYCLE-IND = 'N'                              CAT511  
               CONTINUE                                                 CAT511  
           ELSE                                                         CAT511  
               DISPLAY 'CAT511: W-HDR-MULTI-CYCLE-IND '                 CAT511  
                            '(' W-HDR-MULTI-CYCLE-IND ')'               CAT511  
                            ' NOT = N'                                  CAT511  
               IF  L-BYP-FILECHK                                        CAT511  
                   DISPLAY 'CAT511: BYPASSING BAD CYCLE IND'            CAT511  
               ELSE                                                     CAT511  
                   DISPLAY 'CAT511: U3011 - ABENDING ON BAD CYCLE IND'  CAT511  
                   MOVE +3011 TO ABEND-CODE                             CAT511  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT511  
               END-IF                                                   CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           IF  W-HDR-MULTI-CYCLE-NBR NUMERIC                            CAT511  
           AND W-HDR-MULTI-CYCLE-NBR > '0000'                           CAT511  
               CONTINUE                                                 CAT511  
           ELSE                                                         CAT511  
               DISPLAY 'CAT511: W-HDR-MULTI-CYCLE-NBR '                 CAT511  
                            '(' W-HDR-MULTI-CYCLE-NBR ')'               CAT511  
                            ' NOT NUMERIC'                              CAT511  
               IF  L-BYP-CYCLE                                          CAT511  
                   DISPLAY 'CAT511: BYPASSING BAD CYCLE PER JCLPARM'    CAT511  
               ELSE                                                     CAT511  
                   DISPLAY 'CAT511: U3012 - ABENDING ON BAD CYCLE NBR'  CAT511  
                   MOVE +3012 TO ABEND-CODE                             CAT511  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT511  
               END-IF                                                   CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           IF  L-USE-NSCC-CYCLE-NBR                                     CAT511  
               MOVE W-HDR-MULTI-CYCLE-NBR TO W-NEXT-CYCLE               CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           IF  W-HDR-MULTI-CYCLE-NBR = W-NEXT-CYCLE                     CAT511  
               CONTINUE                                                 CAT511  
           ELSE                                                         CAT511  
               IF  W-HDR-MULTI-CYCLE-NBR = W-PREV-CYCLE                 CAT511  
                   DISPLAY 'CAT511: W-HDR-MULTI-CYCLE-NBR '             CAT511  
                            '(' W-HDR-MULTI-CYCLE-NBR ')'               CAT511  
                            '     = W-PREV-CYCLE '                      CAT511  
                                '(' W-PREV-CYCLE ')'                    CAT511  
               END-IF                                                   CAT511  
               DISPLAY ' '                                              CAT511  
               DISPLAY '##########################################'     CAT511  
               DISPLAY '##########################################'     CAT511  
               DISPLAY 'CAT511: W-HDR-MULTI-CYCLE-NBR '                 CAT511  
                            '(' W-HDR-MULTI-CYCLE-NBR ')'               CAT511  
                            ' NOT = W-NEXT-CYCLE '                      CAT511  
                                '(' W-NEXT-CYCLE ')'                    CAT511  
               IF  L-BYP-CYCLE                                          CAT511  
                   DISPLAY 'CAT511: BYPASSING BAD CYCLE PER JCLPARM'    CAT511  
               ELSE                                                     CAT511  
                  DISPLAY 'CAT511: TO BYPASS - CHANGE JCL AND RERUN'    CAT511  
                  DISPLAY 'CAT511: IF NEXT SIAC FILE ALREADY CAME IN'   CAT511  
                                 ' AND CAT5100Z ALREADY RAN,        '   CAT511  
                  DISPLAY 'CAT511: CHANGE GEN00A TO POINT TO CORRECT'   CAT511  
                                 ' GENERATION OF BZZZ.CAT510.ACATTRAN.' CAT511  
                  DISPLAY 'CAT511: CHECK CONTENTS OF ALL TODAYS'        CAT511  
                          ' FILES. MAKE SURE THEY ARE IN SEQUENCE'      CAT511  
                  DISPLAY 'CAT511: MAKE SURE THE GDG FILES ARE IN'      CAT511  
                          ' CYCLE SEQUENCE (01,02,03,04,05)'            CAT511  
                  DISPLAY 'CAT511: U3013 - ABENDING ON BAD CYCLE NBR'   CAT511  
                  DISPLAY '##########################################'  CAT511  
                  DISPLAY '##########################################'  CAT511  
                   MOVE +3013 TO ABEND-CODE                             CAT511  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT511  
               END-IF                                                   CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           IF  W-HDR-VAR-LEN-REC-IND = '*'                              CAT511  
               CONTINUE                                                 CAT511  
           ELSE                                                         CAT511  
               DISPLAY 'CAT511: W-HDR-VAR-LEN-REC-IND '                 CAT511  
                            '(' W-HDR-VAR-LEN-REC-IND ')'               CAT511  
                            ' NOT = *'                                  CAT511  
               IF  L-BYP-FILECHK                                        CAT511  
                   DISPLAY 'CAT511: BYPASSING BAD VAR-LEN-REC-IND'      CAT511  
               ELSE                                                     CAT511  
                   DISPLAY 'CAT511: U3014 - ABENDING ON BAD VAR IND'    CAT511  
                   MOVE +3014 TO ABEND-CODE                             CAT511  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT511  
               END-IF                                                   CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
                                                                        CAT511  
       4100-EXIT.                                                       CAT511  
           EXIT.                                                        CAT511  
      /                                                                 CAT511  
       4500-EDIT-TRAILER SECTION.                                       CAT511  
***********DISPLAY '4500-EDIT-TRAILER ' W-TRL-BROKER-CLR-NBR            CAT511  
                                                                        CAT511  
           IF  W-CURR-BRK-NBR = W-TRL-BROKER-CLR-NBR                    CAT511  
               IF  W-CURR-TRL-SW = 'Y'                                  CAT511  
                   DISPLAY 'CAT511: DUPLICATE TRAILER'                  CAT511  
                   IF  L-BYP-FILECHK                                    CAT511  
                     DISPLAY 'CAT511: BYPASSING DUPLICATE TRL PER JCL'  CAT511  
                   ELSE                                                 CAT511  
                     DISPLAY 'CAT511: U3015 - ABENDING ON BAD DATE'     CAT511  
                     MOVE +3015 TO ABEND-CODE                           CAT511  
                     PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT          CAT511  
                   END-IF                                               CAT511  
               ELSE                                                     CAT511  
                   IF  W-CURR-HDR-SW NOT = 'Y'                          CAT511  
                       DISPLAY 'CAT511: MISSING HEADER'                 CAT511  
                       MOVE +3001 TO ABEND-CODE                         CAT511  
                       PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT        CAT511  
                   END-IF                                               CAT511  
               END-IF                                                   CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           MOVE 'Y'                       TO W-CURR-TRL-SW              CAT511  
           MOVE W-TRL-PROC-DATE           TO W-CURR-TRL-DATE            CAT511  
           MOVE W-TRL-MULTI-CYCLE-NBR     TO W-CURR-TRL-CYCLE.          CAT511  
           MOVE W-TRL-ITEM-CNT            TO W-CURR-ITEM-CNT.           CAT511  
                                                                        CAT511  
           IF  W-BRK-SW = 'Y'                                           CAT511  
               PERFORM 4600-EDIT-TRAILER-FIELDS                         CAT511  
               MOVE W-CURR-TAB           TO W-TAB (TAB-X)               CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           MOVE 'T'               TO W-HDR-TRL-SW.                      CAT511  
                                                                        CAT511  
       4500-EXIT.                                                       CAT511  
           EXIT.                                                        CAT511  
      /                                                                 CAT511  
       4600-EDIT-TRAILER-FIELDS        SECTION.                         CAT511  
***********DISPLAY '4600-EDIT-TRAILER-FIELDS'                           CAT511  
                                                                        CAT511  
           IF  W-TRL-PROC-DATE = BPD-PROC-DATE                          CAT511  
               CONTINUE                                                 CAT511  
           ELSE                                                         CAT511  
               DISPLAY 'CAT511: W-TRL-PROC-DATE'                        CAT511  
                            '(' W-TRL-PROC-DATE ') NOT = '              CAT511  
                               'BPD-PROC-DATE'                          CAT511  
                            '(' BPD-PROC-DATE   ')'                     CAT511  
               IF L-BYP-DATECHK                                         CAT511  
                   DISPLAY 'CAT511: BYPASSING DATECHK PER JCLPARM'      CAT511  
               ELSE                                                     CAT511  
                   IF  L-BYP-FILECHK                                    CAT511  
                     DISPLAY 'CAT511: BYPASSING BAD DATE FILE PER JCL'  CAT511  
                   ELSE                                                 CAT511  
                     DISPLAY 'CAT511: U3016 - ABENDING ON BAD DATE'     CAT511  
                     MOVE +3016 TO ABEND-CODE                           CAT511  
                     PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT          CAT511  
                   END-IF                                               CAT511  
               END-IF                                                   CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           IF  W-TRL-MULTI-CYCLE-IND = 'N'                              CAT511  
               CONTINUE                                                 CAT511  
           ELSE                                                         CAT511  
               DISPLAY 'CAT511: W-TRL-MULTI-CYCLE-IND '                 CAT511  
                            '(' W-TRL-MULTI-CYCLE-IND ')'               CAT511  
                            ' NOT = N'                                  CAT511  
               IF  L-BYP-FILECHK                                        CAT511  
                   DISPLAY 'CAT511: BYPASSING BAD CYCLE IND'            CAT511  
               ELSE                                                     CAT511  
                   DISPLAY 'CAT511: U3017 - ABENDING ON BAD CYCLE IND'  CAT511  
                   MOVE +3017 TO ABEND-CODE                             CAT511  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT511  
               END-IF                                                   CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           IF  W-TRL-MULTI-CYCLE-NBR NUMERIC                            CAT511  
           AND W-TRL-MULTI-CYCLE-NBR > '0000'                           CAT511  
               CONTINUE                                                 CAT511  
           ELSE                                                         CAT511  
               DISPLAY 'CAT511: W-TRL-MULTI-CYCLE-NBR '                 CAT511  
                            '(' W-TRL-MULTI-CYCLE-NBR ')'               CAT511  
                            ' NOT NUMERIC'                              CAT511  
               IF  L-BYP-CYCLE                                          CAT511  
                   DISPLAY 'CAT511: BYPASSING BAD CYCLE PER JCLPARM'    CAT511  
               ELSE                                                     CAT511  
                   DISPLAY 'CAT511: CHECK CONTENTS OF ALL TODAYS'       CAT511  
                           ' FILES. MAKE SURE THEY ARE IN SEQUENCE'     CAT511  
                   DISPLAY 'CAT511: MAKE SURE THE GDG FILES ARE IN'     CAT511  
                          ' CYCLE SEQUENCE (01,02,03,04,05)'            CAT511  
                   DISPLAY 'CAT511: U3018 - ABENDING ON BAD CYCLE NBR'  CAT511  
                   MOVE +3018 TO ABEND-CODE                             CAT511  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT511  
               END-IF                                                   CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           IF  W-TRL-MULTI-CYCLE-NBR = W-NEXT-CYCLE                     CAT511  
               CONTINUE                                                 CAT511  
           ELSE                                                         CAT511  
               DISPLAY 'CAT511: W-TRL-MULTI-CYCLE-NBR '                 CAT511  
                            '(' W-TRL-MULTI-CYCLE-NBR ')'               CAT511  
                            ' NOT = W-NEXT-CYCLE '                      CAT511  
                                '(' W-NEXT-CYCLE ')'                    CAT511  
               IF  L-BYP-CYCLE                                          CAT511  
                   DISPLAY 'CAT511: BYPASSING BAD CYCLE PER JCLPARM'    CAT511  
               ELSE                                                     CAT511  
                   DISPLAY 'CAT511: CHECK CONTENTS OF ALL TODAYS'       CAT511  
                           ' FILES. MAKE SURE THEY ARE IN SEQUENCE'     CAT511  
                   DISPLAY 'CAT511: MAKE SURE THE GDG FILES ARE IN'     CAT511  
                          ' CYCLE SEQUENCE (01,02,03,04,05)'            CAT511  
                   DISPLAY 'CAT511: U3019 - ABENDING ON BAD CYCLE NBR'  CAT511  
                   MOVE +3019 TO ABEND-CODE                             CAT511  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT511  
               END-IF                                                   CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           IF  W-TRL-VAR-LEN-REC-IND = '*'                              CAT511  
               CONTINUE                                                 CAT511  
           ELSE                                                         CAT511  
               DISPLAY 'CAT511: W-TRL-VAR-LEN-REC-IND '                 CAT511  
                            '(' W-TRL-VAR-LEN-REC-IND ')'               CAT511  
                            ' NOT = *'                                  CAT511  
               IF  L-BYP-FILECHK                                        CAT511  
                   DISPLAY 'CAT511: BYPASSING BAD VAR-LEN-REC-IND'      CAT511  
               ELSE                                                     CAT511  
                   DISPLAY 'CAT511: U3020 - ABENDING ON BAD VAR IND'    CAT511  
                   MOVE +3020 TO ABEND-CODE                             CAT511  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT511  
               END-IF                                                   CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           IF  W-TRL-ITEM-CNT NOT = W-CURR-TOT-CNT                      CAT511  
               DISPLAY 'CAT511: W-TRL-ITEM-CNT '                        CAT511  
                            '(' W-TRL-ITEM-CNT ')'                      CAT511  
                           ' NOT = W-CURR-TOT-CNT '                     CAT511  
                            '(' W-CURR-TOT-CNT ')'                      CAT511  
               IF  L-BYP-FILECHK                                        CAT511  
                   DISPLAY 'CAT511: BYPASSING BAD ITEM COUNT'           CAT511  
               ELSE                                                     CAT511  
                   DISPLAY 'CAT511: U3021 - ABENDING ON BAD ITEM COUNT' CAT511  
                   MOVE +3021 TO ABEND-CODE                             CAT511  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT511  
               END-IF                                                   CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
       4600-EXIT.                                                       CAT511  
           EXIT.                                                        CAT511  
      /                                                                 CAT511  
       5000-SORT-OUTPUT    SECTION.                                     CAT511  
                                                                        CAT511  
           PERFORM 5120-RETURN-SORT THRU 5120-EXIT                      CAT511  
                   UNTIL SORT-EOF.                                      CAT511  
                                                                        CAT511  
       5000-EXIT.                                                       CAT511  
           EXIT.                                                        CAT511  
                                                                        CAT511  
       5120-RETURN-SORT    SECTION.                                     CAT511  
                                                                        CAT511  
           RETURN SORT-FILE                                             CAT511  
               AT END                                                   CAT511  
                     MOVE 'Y' TO W-SORT-EOF                             CAT511  
                     DISPLAY 'CAT511: SORT-EOF '                        CAT511  
                                   ' RET=' W-RETURN-CNT                 CAT511  
                   GO TO 5120-EXIT.                                     CAT511  
                                                                        CAT511  
           MOVE W-REC-LEN-SRT            TO W-REC-LEN-OUT.              CAT511  
                                                                        CAT511  
           MOVE SORT-RECORD      (1 : W-REC-LEN-SRT) TO                 CAT511  
                OUTFILE-RECORD   (1 : W-REC-LEN-SRT)                    CAT511  
                                                                        CAT511  
           WRITE OUTFILE-RECORD.                                        CAT511  
           ADD 1 TO W-OUTFILE-CNT.                                      CAT511  
                                                                        CAT511  
           ADD  1                        TO W-RETURN-CNT.               CAT511  
                                                                        CAT511  
       5120-EXIT.                                                       CAT511  
           EXIT.                                                        CAT511  
      /                                                                 CAT511  
       8000-ABEND-ROUTINE SECTION.                                      CAT511  
                                                                        CAT511  
           DISPLAY ' '                                                  CAT511  
           DISPLAY 'CAT511: INPUT-CNT = ' W-INFILE-CNT                  CAT511  
           DISPLAY 'CAT511: W-CURR-STREAM-CD = '                        CAT511  
                            W-CURR-STREAM-CD                            CAT511  
           DISPLAY 'CAT511: W-CURR-CLIENT-NBR = '                       CAT511  
                            W-CURR-CLIENT-NBR                           CAT511  
           DISPLAY 'CAT511: W-CURR-BRK-NBR    = '                       CAT511  
                            W-CURR-BRK-NBR                              CAT511  
           DISPLAY 'CAT511: W-CURR-HDR-SW     = '                       CAT511  
                            W-CURR-HDR-SW                               CAT511  
           DISPLAY 'CAT511: W-CURR-HDR-DATE   = '                       CAT511  
                            W-CURR-HDR-DATE                             CAT511  
           DISPLAY 'CAT511: W-CURR-HDR-CYCLE  = '                       CAT511  
                            W-CURR-HDR-CYCLE                            CAT511  
           DISPLAY 'CAT511: W-CURR-TRL-SW     = '                       CAT511  
                            W-CURR-TRL-SW                               CAT511  
           DISPLAY 'CAT511: W-CURR-TRL-DATE   = '                       CAT511  
                            W-CURR-TRL-DATE                             CAT511  
           DISPLAY 'CAT511: W-CURR-TRL-CYCLE  = '                       CAT511  
                            W-CURR-TRL-CYCLE                            CAT511  
           DISPLAY 'CAT511: W-CURR-ITEM-CNT   = '                       CAT511  
                            W-CURR-ITEM-CNT                             CAT511  
           DISPLAY 'CAT511: W-CURR-TOT-CNT    = '                       CAT511  
                            W-CURR-TOT-CNT                              CAT511  
           DISPLAY 'CAT511: PROGRAM IS ABENDING'.                       CAT511  
                                                                        CAT511  
           CALL ABEND USING ABEND-CODE.                                 CAT511  
                                                                        CAT511  
       8000-EXIT.                                                       CAT511  
           EXIT.                                                        CAT511  
      /                                                                 CAT511  
       8500-UPDATE-LOG-HDR SECTION.                                     CAT511  
                                                                        CAT511  
           DISPLAY ' '.                                                 CAT511  
           ACCEPT W-SYS-DATE              FROM DATE.                    CAT511  
           ACCEPT W-SYS-TIME              FROM TIME.                    CAT511  
           DISPLAY 'CAT511: SYS-DATE ' W-SYS-DATE                       CAT511  
                          ' SYS-TIME ' W-SYS-TIME.                      CAT511  
                                                                        CAT511  
           INITIALIZE                       W-LOG-RECORD                CAT511  
           MOVE BPD-PROC-DATE            TO W-LOG-PROC-DATE             CAT511  
           MOVE W-NEXT-CYCLE             TO W-LOG-CYCLE-NBR             CAT511  
           MOVE 'CAT511'                 TO W-LOG-PGM-NAME              CAT511  
           MOVE W-UPD-DATE               TO W-LOG-SYS-DATE              CAT511  
           MOVE W-UPD-TIME               TO W-LOG-SYS-TIME              CAT511  
           MOVE W-HDR-RECORD             TO W-LOG-NSCC-HDR              CAT511  
           MOVE W-TRL-ITEM-CNT           TO W-LOG-NSCC-CNT              CAT511  
           MOVE W-OUTFILE-CNT            TO W-LOG-TOT-REC-CNT           CAT511  
                                                                        CAT511  
           WRITE OUTLOG-RECORD FROM W-LOG-RECORD                        CAT511  
                                                                        CAT511  
           IF  OUTLOG-OKAY                                              CAT511  
               DISPLAY 'CAT511: OUTLOG HEADER RECORD WRITTEN'           CAT511  
           ELSE                                                         CAT511  
                  DISPLAY ' '                                           CAT511  
                  DISPLAY 'CAT511: U3022 - OUTLOG VSAM WRITE ERROR '    CAT511  
                         ' FILE STATUS = ' OUTLOG-STAT                  CAT511  
                  DISPLAY 'CAT511: WRITE KEY = W-LOG-KEY = '            CAT511  
                                               W-LOG-KEY                CAT511  
                  MOVE +3022    TO ABEND-CODE                           CAT511  
                  CALL ABEND USING ABEND-CODE                           CAT511  
           END-IF.                                                      CAT511  
           DISPLAY 'CAT511: THIS-STREAM      = '                        CAT511  
                                           L-STREAM                     CAT511  
           DISPLAY 'CAT511: THIS-PROC-DATE   = '                        CAT511  
                                           W-LOG-PROC-DATE              CAT511  
           DISPLAY 'CAT511: THIS-CYCLE-NBR   = '                        CAT511  
                                           W-LOG-CYCLE-NBR              CAT511  
           DISPLAY 'CAT511: THIS-REC-CNT     = '                        CAT511  
                                           W-LOG-TOT-REC-CNT            CAT511  
           DISPLAY ' '.                                                 CAT511  
                                                                        CAT511  
       8500-EXIT.                                                       CAT511  
           EXIT.                                                        CAT511  
      /                                                                 CAT511  
       9000-CLOSE-ROUTINE SECTION.                                      CAT511  
                                                                        CAT511  
           MOVE 'T'                      TO CP2-REQUEST-CODE.           CAT511  
           MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.             CAT511  
           MOVE W-OUTFILE-CNT            TO CP2-RECORD-COUNT.           CAT511  
           MOVE 999                      TO CP2-CLIENT-NUMBER.          CAT511  
                                                                        CAT511  
           CALL P2HDTR                USING CP2-AREA                    CAT511  
                                            OUTFILE.                    CAT511  
                                                                        CAT511  
           MOVE SPACES                   TO W-OUTTRL-REC                CAT511  
           MOVE CP2-RETURN-RECORD        TO W-OUTTRL-P2.                CAT511  
DJ0005     MOVE LD-PROC-DATE             TO W-OUTTRL-PROC-DATE          CAT511  
DJ0006     MOVE W-SIAC-HEADER-CYCLE-X    TO W-OUTTRL-CYCLE-NBR-X        CAT511  
           DISPLAY 'CAT511: OUT-TRL = '     W-OUTTRL-REC.               CAT511  
                                                                        CAT511  
           MOVE W-HDR-TRL-LEN            TO W-REC-LEN-OUT.              CAT511  
                                                                        CAT511  
           MOVE W-OUTTRL-REC     (1 : W-REC-LEN-OUT) TO                 CAT511  
                OUTFILE-TRL-REC  (1 : W-REC-LEN-OUT)                    CAT511  
                                                                        CAT511  
           WRITE OUTFILE-RECORD.                                        CAT511  
                                                                        CAT511  
           DISPLAY ' '.                                                 CAT511  
           DISPLAY 'CAT511: W-TAB = '                                   CAT511  
           PERFORM VARYING W-SUB1 FROM 1 BY 1                           CAT511  
                   UNTIL W-SUB1 > W-TAB-CNT                             CAT511  
                   IF  W-TAB-STREAM-CD (W-SUB1) > SPACES                CAT511  
                        DISPLAY                                         CAT511  
                        'STR='      W-TAB-STREAM-CD  (W-SUB1)           CAT511  
                       ' CLT='      W-TAB-CLIENT-NBR (W-SUB1)           CAT511  
                       ' BRK='      W-TAB-BRK-NBR    (W-SUB1)           CAT511  
                       ' HDR='      W-TAB-HDR-SW     (W-SUB1)           CAT511  
                                    W-TAB-HDR-DATE   (W-SUB1)           CAT511  
                                    W-TAB-HDR-CYCLE  (W-SUB1)           CAT511  
                       ' TRL='      W-TAB-TRL-SW     (W-SUB1)           CAT511  
                                    W-TAB-TRL-DATE   (W-SUB1)           CAT511  
                                    W-TAB-TRL-CYCLE  (W-SUB1)           CAT511  
                       ' CNT='      W-TAB-ITEM-CNT   (W-SUB1)           CAT511  
                       ' TOT='      W-TAB-TOT-CNT    (W-SUB1)           CAT511  
                   END-IF                                               CAT511  
           END-PERFORM.                                                 CAT511  
                                                                        CAT511  
           DISPLAY ' '.                                                 CAT511  
           CLOSE INFILE                                                 CAT511  
           DISPLAY 'CAT511: INFILE   CLOSED. STATUS = '                 CAT511  
                                             INFILE-STAT.               CAT511  
           CLOSE OUTFILE                                                CAT511  
           DISPLAY 'CAT511: OUTFILE  CLOSED. STATUS = '                 CAT511  
                                             OUTFILE-STAT.              CAT511  
           CLOSE INLOG.                                                 CAT511  
           DISPLAY 'CAT511: INLOG    CLOSED. STATUS = '                 CAT511  
                                             INLOG-STAT.                CAT511  
           CLOSE OUTLOG.                                                CAT511  
           DISPLAY 'CAT511: OUTLOG   CLOSED. STATUS = '                 CAT511  
                                             OUTLOG-STAT.               CAT511  
                                                                        CAT511  
           DISPLAY 'CAT511: INFILE     INPUT  COUNT = '                 CAT511  
                                                   W-INFILE-CNT         CAT511  
           DISPLAY 'CAT511: DETAIL            COUNT = '                 CAT511  
                                                   W-DETAIL-CNT         CAT511  
           DISPLAY 'CAT511: OUTFILE    OUTPUT COUNT = '                 CAT511  
                                                   W-OUTFILE-CNT        CAT511  
           DISPLAY 'CAT511: W-TI-CNT  (TRANSFER)    = ' W-TI-CNT        CAT511  
           DISPLAY 'CAT511: W-AT-CNT  (ALL ASSETS)  = ' W-AT-CNT        CAT511  
           DISPLAY 'CAT511: W-ATR-CNT (REGULAR)     = ' W-ATR-CNT       CAT511  
           DISPLAY 'CAT511: W-ATO-CNT (OPTION)      = ' W-ATO-CNT       CAT511  
           DISPLAY 'CAT511: W-ATF-CNT (MUTUAL FUND) = ' W-ATF-CNT       CAT511  
DJ0003     DISPLAY 'CAT511: W-ATI-CNT (INSURANCE)   = ' W-ATI-CNT       CAT511  
           DISPLAY 'CAT511: W-FR-CNT  (FUND REG)    = ' W-FR-CNT        CAT511  
DJ0003     DISPLAY 'CAT511: W-IR-CNT (INSURANCE REG)= ' W-IR-CNT        CAT511  
           DISPLAY ' '.                                                 CAT511  
           DISPLAY 'CAT511: PROGRAM ENDED SUCCESSFULLY'.                CAT511  
                                                                        CAT511  
       9000-EXIT.                                                       CAT511  
           EXIT.                                                        CAT511  
      *################################################################ CAT511  
