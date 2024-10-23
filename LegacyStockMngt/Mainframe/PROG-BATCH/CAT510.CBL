000001* PDX    - CAT510   C0227086 11/02/05 08:17:43 TBLAMUR            00001000
LRM005* SSR 0032638 CAUSE RC=12 IF PRODUCTION SIAC0716 LESS 100 RECORDS         
000001* PDX    - CAT510   C0225456 10/14/05 11:15:03 TBDOJUN            00001000
      * DJ0004 OUTPUT '1' RECORD FOR CAT510B TO USE                     05/01/13
000001* PDX    - CAT510   C0215169 02/14/05 07:55:19 TBDOJUN            00001000
      * DJ0003 SSR# 40633 RECOMPILED FOR NEW COPYBOOK (ANNUITY)         05/01/13
      * DJ0003 MIPS REDUCTION - CHANGE PIC 9 TO PIC 9 COMP-3            05/01/13
000001* PDX    - CAT510   C0203650 09/14/04 14:50:17 TBEDTAK            CAT510  
      * ET0001 SSR# 037158                                              CAT510  
      *        PROCESS A NEW TRAN INPUT FILE FROM WEALTH MANAGEMENT VIA CAT510  
      *        NSCC/SIAC ON BEHALF OF CLT 235 (UBS).                    CAT510  
000001* PDX    - CAT510   C0155175 03/02/01 11:40:50 TBDOJUN            CAT510  
000001* PDX    - CAT510   C0151178 12/18/00 08:45:11 TBDOJUN            CAT510  
      * DJ0002 SSR# R2262400 W8 FIELDS COPYBOOK RECOMPILE. COBOL LE     CAT510  
000001* PDX    - CAT510   C0119389 01/04/99 15:39:51 TBDOJUN            CAT510  
000001* PDX    - CAT510   C0118401 11/19/98 15:50:48 TBDOJUN            CAT510  
000001* PDX    - CAT510   C0109316 11/13/98 10:40:38 TBDOJUN            CAT510  
       IDENTIFICATION DIVISION.                                         CAT510  
       PROGRAM-ID.  CAT510.                                             CAT510  
      ***************************************************************** CAT510  
      * CAT510 - ACCEPT 'M' FILE (ACAT.TRAN) FROM NSCC/SIAC           * CAT510  
      *          LOG IN NEW CYCLE, AND PERFORM FILE CHECKING.         * CAT510  
      *                                                               * CAT510  
      * PROGRAM WILL RUN ONLY AS A 'Z' JOB EACH TIME NSCC SENDS US    * CAT510  
      * THE 'M' FILE.  PRIMARY PURPOSE IS TO ENTER INTO THE           * CAT510  
      * CYCLE.LOG THAT ANOTHER 'M' FILE HAS ARRIVED AND TO TRIGGER    * CAT510  
      * THE INDEPENDENT STREAM JOBS CAT512 TO BEGIN EXTRACTION        * CAT510  
      * EACH 'M' FILE RECEIVED HAS A CYCLE SEQUENCE NUMBER THAT       * CAT510  
      * MUST BE CHECKED TO ENSURE THAT IT WAS INCREMENTED PROPERLY    * CAT510  
      * SINCE 9 OF THESE WILL BE SENT TO ADP EACH BUSINESS DAY WE     * CAT510  
      * MUST DETERMINE IF CAT510 SHOULD ABEND IF THEY SKIP OR MISS    * CAT510  
      * A CYCLE ON A GIVEN DAY.  THE CYCLE.LOG WILL BE USED TO        * CAT510  
      * DETERMINE IF THIS HAS OCCURRED.  CAT510 WILL ALSO PERFORM     * CAT510  
      * ANOTHER FUNCTION OF FILE CHECKING THE NUMBER OF PHYSICAL AND  * CAT510  
      * LOGICAL RECORDS BETWEEN EACH BROKERS HEADER AND TRAILER FOR   * CAT510  
      * COMPLETENESS.  AN ABEND CONDITION SHOULD OCCUR IF FILE IS     * CAT510  
      * CORRUPTED, OUT OF SEQUENCE, OR IS MISSING RECORDS INCLUDING ALL CAT510  
      * HEADER AND TRAILERS.                                          * CAT510  
      *                                                               * CAT510  
      * BYPASS FIRST RECORD - RECORD TYPE 1 FILE HEADER               * CAT510  
      *                                                               * CAT510  
      * INPUT  - NSCC ACATS TRANSACTION FILE (M FILE) VARIABLE LENGTH * CAT510  
      *        - B1 FILE FOR BROKER SELECTION.                        * CAT510  
      *                                                               * CAT510  
      * OUTPUT - LOG FILE TO KEEP OF CYCLE NBR                        * CAT510  
      *                                                               * CAT510  
      ***************************************************************** CAT510  
      * 06/13/98 DJ     NEW PROGRAM                                   * CAT510  
      * 12/18/00 DJ0002 SSR#R2262400 W8 FIELDS FOR FUND REG           * CAT510  
      ***************************************************************** CAT510  
      /                                                                 CAT510  
       ENVIRONMENT DIVISION.                                            CAT510  
       INPUT-OUTPUT SECTION.                                            CAT510  
       FILE-CONTROL.                                                    CAT510  
                                                                        CAT510  
           SELECT INFILE           ASSIGN       TO INFILE               CAT510  
                                   FILE STATUS  IS INFILE-STAT.         CAT510  
                                                                        CAT510  
           SELECT OUTFILE          ASSIGN       TO OUTFILE              CAT510  
                                   FILE STATUS  IS OUTFILE-STAT.        CAT510  
                                                                        CAT510  
           SELECT INLOG            ASSIGN       TO INLOG                CAT510  
                                   FILE STATUS  IS INLOG-STAT.          CAT510  
                                                                        CAT510  
           SELECT OUTLOG           ASSIGN       TO OUTLOG               CAT510  
                                   FILE STATUS  IS OUTLOG-STAT.         CAT510  
      /                                                                 CAT510  
       DATA DIVISION.                                                   CAT510  
       FILE SECTION.                                                    CAT510  
       FD  INFILE                                                       CAT510  
           RECORDING MODE IS V                                          CAT510  
           RECORD IS VARYING IN SIZE FROM 1 TO 4000 CHARACTERS          CAT510  
              DEPENDING ON W-REC-LEN-IN                                 CAT510  
           BLOCK CONTAINS 0 RECORDS.                                    CAT510  
                                                                        CAT510  
           COPY NSCCMTRN REPLACING ==:NSCCMTRN:== BY ==NSCCMTRN==.      CAT510  
                                                                        CAT510  
           COPY NSCCMHDR REPLACING ==:NSCCMHDR:== BY ==NSCCMHDR==.      CAT510  
                                                                        CAT510  
           COPY NSCCMTRL REPLACING ==:NSCCMTRL:== BY ==NSCCMTRL==.      CAT510  
                                                                        CAT510  
       01  DUMMY-LARGE-RECORD         PIC X(4000).                      CAT510  
                                                                        CAT510  
       FD  OUTFILE                                                      CAT510  
           RECORDING MODE IS V                                          CAT510  
           RECORD IS VARYING IN SIZE FROM 1 TO 3268 CHARACTERS          CAT510  
              DEPENDING ON W-REC-LEN-OUT                                CAT510  
           BLOCK CONTAINS 0 RECORDS.                                    CAT510  
                                                                        CAT510  
           COPY NSCCMTRN REPLACING ==:NSCCMTRN:== BY ==OUTFILE==.       CAT510  
                                                                        CAT510  
                                                                        CAT510  
       FD  INLOG                                                        CAT510  
           RECORDING MODE IS F                                          CAT510  
           BLOCK CONTAINS 0 RECORDS.                                    CAT510  
                                                                        CAT510  
           COPY CATLOG  REPLACING ==:CATLOG:== BY ==INLOG==.            CAT510  
                                                                        CAT510  
       FD  OUTLOG                                                       CAT510  
           RECORDING MODE IS F                                          CAT510  
           BLOCK CONTAINS 0 RECORDS.                                    CAT510  
                                                                        CAT510  
           COPY CATLOG  REPLACING ==:CATLOG:== BY ==OUTLOG==.           CAT510  
      /                                                                 CAT510  
       WORKING-STORAGE SECTION.                                         CAT510  
       COPY PDXIDCOB.                                                   CAT510  
                                                                        CAT510  
       01  W-FIELDS.                                                    CAT510  
           05  W-FIRST-TIME-SW           PIC  X(001) VALUE '0'.         CAT510  
               88 NOT-FIRST-TIME                     VALUE '1'.         CAT510  
           05  END-OF-INFILE-SW          PIC  X(001) VALUE '0'.         CAT510  
               88 END-OF-INFILE                      VALUE '1'.         CAT510  
           05  INFILE-STAT               PIC  X(002).                   CAT510  
               88 INFILE-OKAY            VALUE '00' THRU '09', '97'.    CAT510  
               88 INFILE-END-OF-FILE     VALUE '10'.                    CAT510  
               88 INFILE-EMPTY-MISSING VALUE '35'.                      CAT510  
           05  OUTFILE-STAT              PIC  X(002).                   CAT510  
               88 OUTFILE-OKAY           VALUE '00' THRU '09', '97'.    CAT510  
               88 OUTFILE-END-OF-FILE    VALUE '10'.                    CAT510  
               88 OUTFILE-EMPTY-MISSING VALUE '35'.                     CAT510  
           05  INFILE-DATE-SW            PIC  X(001) VALUE ' '.         CAT510  
               88 INFILE-DATE-FOUND                  VALUE 'Y'.         CAT510  
           05  INLOG-STAT                PIC  X(002).                   CAT510  
               88 INLOG-OKAY             VALUE '00' THRU '09', '97'.    CAT510  
               88 INLOG-END-OF-FILE      VALUE '10'.                    CAT510  
               88 INLOG-DUP-REC          VALUE '22'.                    CAT510  
               88 INLOG-NOTFND           VALUE '23'.                    CAT510  
               88 INLOG-EMPTY-MISSING    VALUE '35'.                    CAT510  
           05  END-OF-INLOG-SW           PIC  X(001) VALUE '0'.         CAT510  
               88 END-OF-INLOG                       VALUE '1'.         CAT510  
           05  OUTLOG-STAT               PIC  X(002).                   CAT510  
               88 OUTLOG-OKAY            VALUE '00' THRU '09', '97'.    CAT510  
               88 OUTLOG-END-OF-FILE     VALUE '10'.                    CAT510  
               88 OUTLOG-DUP-REC         VALUE '22'.                    CAT510  
               88 OUTLOG-NOTFND          VALUE '23'.                    CAT510  
               88 OUTLOG-EMPTY-MISSING   VALUE '35'.                    CAT510  
           05  W-SYS-DATE                PIC  9(006) VALUE 0.           CAT510  
           05  FILLER  REDEFINES                                        CAT510  
               W-SYS-DATE.                                              CAT510  
               10  W-UPD-DATE            PIC  X(006).                   CAT510  
           05  W-SYS-TIME                PIC  9(008) VALUE 0.           CAT510  
           05  FILLER  REDEFINES                                        CAT510  
               W-SYS-TIME.                                              CAT510  
               10  W-UPD-TIME            PIC  X(006).                   CAT510  
               10  W-UPD-TIME-MS         PIC  X(002).                   CAT510  
           05  LD-PROC-DATE.                                            CAT510  
               10 LD-PROC-DATE-MM        PIC  X(002).                   CAT510  
               10 LD-PROC-DATE-DD        PIC  X(002).                   CAT510  
               10 LD-PROC-DATE-YY        PIC  X(002).                   CAT510  
           05  W-HDR-TRL-SW              PIC  X(001) VALUE 'T'.         CAT510  
               88 HDR-FOUND                          VALUE 'H'.         CAT510  
               88 TRL-FOUND                          VALUE 'T'.         CAT510  
           05  W-BRK-SW                  PIC  X(001) VALUE ' '.         CAT510  
               88 BRK-FOUND                          VALUE 'Y'.         CAT510  
ET0001     05  W-TI-ACAT-NBR             PIC  X(014).                   CAT510  
ET0001     05  W-PAINE-WEBBER-ACCT       PIC  X(008).                   CAT510  
ET0001     05  FILLER                    PIC  X(008) VALUE 'PAINECNT'.  CAT510  
ET0001     05  W-PAINE-WEBBER-CNT        PIC  9(011) COMP-3 VALUE 0.    CAT510  
           05  FILLER                    PIC  X(008) VALUE 'INPUTCNT'.  CAT510  
           05  W-INFILE-CNT              PIC  9(011) COMP-3 VALUE 0.    CAT510  
           05  FILLER                    PIC  X(008) VALUE 'OUTPUTCT'.  CAT510  
           05  W-OUTFILE-CNT             PIC  9(011) COMP-3 VALUE 0.    CAT510  
           05  FILLER                    PIC  X(008) VALUE 'DETAILCT'.  CAT510  
           05  W-DETAIL-CNT              PIC  9(011) COMP-3 VALUE 0.    CAT510  
           05  FILLER                    PIC  X(008) VALUE 'W-SUB1  '.  CAT510  
           05  W-SUB1                    PIC  9(004) COMP-3 VALUE 0.    CAT510  
           05  FILLER                    PIC  X(008) VALUE 'RECLENIN'.  CAT510  
           05  W-REC-LEN-IN              PIC  9(005) COMP-3 VALUE 0.    CAT510  
           05  FILLER                    PIC  X(008) VALUE 'RECLENOT'.  CAT510  
           05  W-REC-LEN-OUT             PIC  9(005) COMP-3 VALUE 0.    CAT510  
           05  FILLER                    PIC  X(008) VALUE 'NEWCYCLE'.  CAT510  
           05  W-NEXT-CYCLE              PIC  9(004) VALUE 0.           CAT510  
                                                                                
       01  FILLER                        PIC X(008) VALUE 'SIAC-HDR'.   CAT510  
       01  W-SIAC-HEADER.                                               CAT510  
           05  FILLER                    PIC  X(006).                   CAT510  
           05  W-SIAC-HEADER-DATE        PIC  X(008).                   CAT510  
           05  FILLER                    PIC  X(040).                   CAT510  
           05  W-SIAC-HEADER-CYCLE.                                     CAT510  
               07  W-SIAC-HEADER-CYCLE-N PIC  9(002).                   CAT510  
           05  FILLER                    PIC  X(033).                   CAT510  
           05  FILLER                    PIC  X(044).                   CAT510  
      /                                                                 CAT510  
       01  FILLER                        PIC X(008) VALUE 'TRN-REC '.   CAT510  
           COPY NSCCMTRN REPLACING ==:NSCCMTRN:==  BY ==W-TRN==.        CAT510  
      /                                                                 CAT510  
       01  FILLER                        PIC X(008) VALUE 'HDR-REC '.   CAT510  
           COPY NSCCMHDR REPLACING ==:NSCCMHDR:== BY ==W-HDR==.         CAT510  
      /                                                                 CAT510  
       01  FILLER                        PIC X(008) VALUE 'TRL-REC '.   CAT510  
           COPY NSCCMTRL REPLACING ==:NSCCMTRL:== BY ==W-TRL==.         CAT510  
      /                                                                 CAT510  
       01  FILLER                        PIC X(008) VALUE 'W-LOG   '.   CAT510  
           COPY CATLOG  REPLACING ==:CATLOG:== BY ==W-LOG==.            CAT510  
      /                                                                 CAT510  
       01  FILLER                        PIC X(008) VALUE 'W-TAB   '.   CAT510  
       01  W-TAB-CNT                     PIC  9(003) COMP-3 VALUE 0.    CAT510  
       01  W-TAB-AREA.                                                  CAT510  
           05  W-TAB OCCURS 500 TIMES INDEXED BY TAB-X.                 CAT510  
               10 W-TAB-STREAM-CD            PIC X(001).                CAT510  
               10 W-TAB-CLIENT-NBR           PIC X(004).                CAT510  
               10 W-TAB-BRK-NBR              PIC X(004).                CAT510  
               10 W-TAB-HDR-SW               PIC X(001).                CAT510  
               10 W-TAB-HDR-DATE             PIC X(008).                CAT510  
               10 W-TAB-HDR-CYCLE            PIC X(004).                CAT510  
               10 W-TAB-TRL-SW               PIC X(001).                CAT510  
               10 W-TAB-TRL-DATE             PIC X(008).                CAT510  
               10 W-TAB-TRL-CYCLE            PIC X(004).                CAT510  
               10 W-TAB-ITEM-CNT             PIC 9(009).                CAT510  
               10 W-TAB-TOT-CNT              PIC 9(009).                CAT510  
                                                                        CAT510  
       01  FILLER                        PIC X(047) VALUE ' '.          CAT510  
       01  FILLER                        PIC X(008) VALUE 'CURR-TAB'.   CAT510  
       01  W-CURR-TAB.                                                  CAT510  
           05  W-CURR-STREAM-CD              PIC X(001).                CAT510  
           05  W-CURR-CLIENT-NBR             PIC X(004).                CAT510  
           05  W-CURR-BRK-NBR                PIC X(004).                CAT510  
           05  W-CURR-HDR-SW                 PIC X(001).                CAT510  
           05  W-CURR-HDR-DATE               PIC X(008).                CAT510  
           05  W-CURR-HDR-CYCLE              PIC X(004).                CAT510  
           05  W-CURR-TRL-SW                 PIC X(001).                CAT510  
           05  W-CURR-TRL-DATE               PIC X(008).                CAT510  
           05  W-CURR-TRL-CYCLE              PIC X(004).                CAT510  
           05  W-CURR-ITEM-CNT               PIC 9(009).                CAT510  
           05  W-CURR-TOT-CNT                PIC 9(009).                CAT510  
                                                                        CAT510  
       01  FILLER                        PIC X(008) VALUE 'B1-TABLE'.   CAT510  
       01  B1-WORK-FIELEDS.                                             CAT510  
           03  B1-TBL-CNT                   PIC 9(03) COMP-3 VALUE 0.   CAT510  
           03  B1-SUB                       PIC 9(03) COMP-3 VALUE 0.   CAT510  
       01  B1-TABLE-AREA.                                               CAT510  
           03  B1-TABLE OCCURS 500 TIMES.                               CAT510  
               05  B1-ADP-CL-NO             PIC 9(04).                  CAT510  
               05  B1-CLI-NAME              PIC X(30).                  CAT510  
               05  B1-BKR-CLR-NO            PIC X(04).                  CAT510  
               05  B1-STREAM                PIC X(01).                  CAT510  
               05  B1-STATUS                PIC X(01).                  CAT510  
               05  B1-ACAT-STATUS           PIC X(01).                  CAT510  
      /                                                                 CAT510  
      ******************************************************************CAT510  
      * B1 HEADER                                                      *CAT510  
      ******************************************************************CAT510  
       01  FILLER                        PIC X(08) VALUE 'BHINFO  '.    CAT510  
           COPY BHINFO.                                                 CAT510  
      /                                                                 CAT510  
      ******************************************************************CAT510  
      * B1 ACAT SECTION                                                *CAT510  
      ******************************************************************CAT510  
       01  FILLER                        PIC X(08) VALUE 'BHACAT  '.    CAT510  
           COPY BHACAT.                                                 CAT510  
      /                                                                 CAT510  
ET0001******************************************************************CAT510  
ET0001* B1 REQUEST SECTION                                             *CAT510  
ET0001******************************************************************CAT510  
ET0001 01  FILLER                        PIC X(08) VALUE 'BHREQ   '.    CAT510  
ET0001     COPY BHREQ.                                                  CAT510  
ET0001/                                                                 CAT510  
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.   CAT510  
                                                                        CAT510  
           COPY BPDATESC.                                               CAT510  
      /                                                                 CAT510  
DJ0002***===> COBOL LE                                                  CAT510  
DJ0002 01  W-ABEND-AREA.                                                CAT510  
DJ0002     05  ABEND-CODE                PIC S9(04) COMP SYNC.          CAT510  
DJ0002 01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.   CAT510  
DJ0002     COPY STUBCPY.                                                CAT510  
DJ0002***<=== COBOL LE                                                  CAT510  
                                                                        CAT510  
       01  FILLER                        PIC X(008) VALUE 'END-O-WS'.   CAT510  
      /                                                                 CAT510  
      ***************************************************************** CAT510  
      *    LINKAGE SECTION                                            * CAT510  
      ***************************************************************** CAT510  
       LINKAGE SECTION.                                                 CAT510  
       01  L-JCL-PARMS.                                                 CAT510  
           05  PARMLENGTH                PIC S9(004) COMP SYNC.         CAT510  
           05  L-BYP-CYCLE-SW            PIC  X(001).                   CAT510  
               88  L-BYP-CYCLE                       VALUE '1' '2' '3'. CAT510  
               88  L-USE-NEXT-CYCLE-NBR              VALUE '1'.         CAT510  
               88  L-USE-PREV-CYCLE-NBR              VALUE '2'.         CAT510  
               88  L-USE-NSCC-CYCLE-NBR              VALUE '3'.         CAT510  
           05  L-BYP-DATECHK-SW          PIC  X(001).                   CAT510  
               88  L-BYP-DATECHK                     VALUE '1'.         CAT510  
           05  L-BYP-FILECHK-SW          PIC  X(001).                   CAT510  
               88  L-BYP-FILECHK                     VALUE '1'.         CAT510  
LRM005     05  L-BYP-REC-CNT-SW          PIC  X(001).                           
LRM005         88  L-BYP-REC-CNT                     VALUE '1'.                 
ET0001     05  L-PROCESS-CLT-235-SW      PIC  X(003).                   CAT510  
ET0001         88  L-PROCESS-CLT-235                 VALUE '235'.       CAT510  
                                                                        CAT510  
       PROCEDURE DIVISION USING L-JCL-PARMS.                            CAT510  
      *                         ===========                             CAT510  
       0000-MAIN SECTION.                                               CAT510  
           DISPLAY 'CAT510 - EDIT NSCC ACATS TRANSACTIONS FILE'.        CAT510  
           DISPLAY '         INPUT=BZZZ.SIAC0716.ACAT.TRAN'.            CAT510  
           DISPLAY '         MAKE SURE PHYSICAL FILE IS COMPLETE'.      CAT510  
           DISPLAY '         MAKE SURE CYCLE NUMBER IS CORRECT'.        CAT510  
           DISPLAY ' '.                                                 CAT510  
           COPY MSGCOBO.                                                CAT510  
           DISPLAY ' '.                                                 CAT510  
                                                                        CAT510  
           PERFORM 1000-INIT           THRU 1000-EXIT.                  CAT510  
           PERFORM 1300-GET-LOG-HDR    THRU 1300-EXIT.                  CAT510  
           PERFORM 1500-LOAD-B1        THRU 1500-EXIT.                  CAT510  
           PERFORM 1600-LOAD-TABLE     THRU 1600-EXIT.                  CAT510  
           DISPLAY '2000-PROCESS - EDITING NSCC FILE'.                  CAT510  
           PERFORM 2000-PROCESS        THRU 2000-EXIT.                  CAT510  
           PERFORM 8500-UPDATE-LOG-HDR THRU 8500-EXIT.                  CAT510  
           PERFORM 9000-CLOSE-ROUTINE  THRU 9000-EXIT.                  CAT510  
                                                                        CAT510  
           GOBACK.                                                      CAT510  
      /                                                                 CAT510  
       1000-INIT SECTION.                                               CAT510  
                                                                        CAT510  
           ACCEPT W-SYS-DATE              FROM DATE.                    CAT510  
           ACCEPT W-SYS-TIME              FROM TIME.                    CAT510  
           DISPLAY 'CAT510: SYS-DATE ' W-SYS-DATE                       CAT510  
                          ' SYS-TIME ' W-SYS-TIME.                      CAT510  
                                                                        CAT510  
           DISPLAY ' '.                                                 CAT510  
           DISPLAY 'CAT510: L-BYP-CYCLE-SW   = '                        CAT510  
                            L-BYP-CYCLE-SW                              CAT510  
           ' (1=USE PREVIOUS CYCLE NBR)'                                CAT510  
           DISPLAY 'CAT510: L-BYP-DATECHK-SW = '                        CAT510  
                            L-BYP-DATECHK-SW                            CAT510  
           ' (1=BYPASS DATE CHECK)'                                     CAT510  
           DISPLAY 'CAT510: L-BYP-FILECHK-SW = '                        CAT510  
                            L-BYP-FILECHK-SW                            CAT510  
           ' (1=BYPASS FILE CHECK)'                                     CAT510  
ET0001     DISPLAY 'CAT510: L-PROCESS-CLT-235-SW = '                    CAT510  
ET0001                      L-PROCESS-CLT-235-SW                        CAT510  
ET0001     ' (235=PROCESS CLT 235 ONLY)'                                CAT510  
           IF  L-BYP-DATECHK                                            CAT510  
               DISPLAY 'CAT510: DATE CHECK WILL BE BYPASSED'            CAT510  
           ELSE                                                         CAT510  
               DISPLAY 'CAT510: DATE CHECK WILL BE PERFORMED'           CAT510  
           END-IF.                                                      CAT510  
           IF  L-BYP-FILECHK                                            CAT510  
               DISPLAY 'CAT510: FILE CHECK WILL BE BYPASSED'            CAT510  
           ELSE                                                         CAT510  
               DISPLAY 'CAT510: FILE CHECK WILL BE PERFORMED'           CAT510  
           END-IF.                                                      CAT510  
ET0001     IF  L-PROCESS-CLT-235                                        CAT510  
ET0001         DISPLAY 'CAT510: PROCESS CLIENT 235 (UBS) ONLY'          CAT510  
ET0001     END-IF.                                                      CAT510  
                                                                        CAT510  
           MOVE 'CAT510'                  TO BPDATES-CALLING-PGM.       CAT510  
           SET  LNKDATZ-REQUEST           TO TRUE.                      CAT510  
           CALL BPDATES USING BPDATES-PARAMETERS.                       CAT510  
           MOVE BPD-PROC-DATE(3:2)        TO LD-PROC-DATE-YY.           CAT510  
           MOVE BPD-PROC-DATE(5:2)        TO LD-PROC-DATE-MM.           CAT510  
           MOVE BPD-PROC-DATE(7:2)        TO LD-PROC-DATE-DD.           CAT510  
                                                                        CAT510  
           DISPLAY ' '.                                                 CAT510  
           DISPLAY 'CAT510:       BPD-PROC-DATE= ' BPD-PROC-DATE        CAT510  
                                '  LD-PROC-DATE= ' LD-PROC-DATE.        CAT510  
           DISPLAY 'CAT510: BPD-PRIOR-PROC-DATE= ' BPD-PRIOR-PROC-DATE. CAT510  
           DISPLAY ' '.                                                 CAT510  
                                                                        CAT510  
           OPEN INPUT INFILE.                                           CAT510  
           DISPLAY 'CAT510: INFILE  OPENED FOR INPUT.  STATUS = '       CAT510  
                                               INFILE-STAT.             CAT510  
                                                                        CAT510  
           IF  INFILE-OKAY                                              CAT510  
               CONTINUE                                                 CAT510  
           ELSE                                                         CAT510  
               DISPLAY 'CAT510: ERROR OPENING INFILE'                   CAT510  
               DISPLAY 'CAT510: OPEN STATUS = ' INFILE-STAT             CAT510  
                            '.  INPUT-CNT = ' W-INFILE-CNT              CAT510  
               DISPLAY 'CAT510: U3001 - ABENDING ON BAD FILE STATUS'    CAT510  
               MOVE +3001    TO ABEND-CODE                              CAT510  
               CALL ABEND USING ABEND-CODE                              CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
           OPEN INPUT INLOG.                                            CAT510  
           DISPLAY 'CAT510: INLOG   OPENED FOR INPUT.  STATUS = '       CAT510  
                                               INLOG-STAT.              CAT510  
                                                                        CAT510  
           IF  INLOG-OKAY                                               CAT510  
               CONTINUE                                                 CAT510  
           ELSE                                                         CAT510  
               DISPLAY 'CAT510: ERROR OPENING INLOG'                    CAT510  
               DISPLAY 'CAT510: OPEN STATUS = ' INLOG-STAT              CAT510  
               DISPLAY 'CAT510: U3002 - ABENDING ON BAD FILE STATUS'    CAT510  
               MOVE +3002    TO ABEND-CODE                              CAT510  
               CALL ABEND USING ABEND-CODE                              CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
           OPEN OUTPUT OUTFILE.                                         CAT510  
           DISPLAY 'CAT510: OUTFILE OPENED FOR OUTPUT. STATUS = '       CAT510  
                                               OUTFILE-STAT.            CAT510  
                                                                        CAT510  
           IF  OUTFILE-OKAY                                             CAT510  
               CONTINUE                                                 CAT510  
           ELSE                                                         CAT510  
               DISPLAY 'CAT510: ERROR OPENING OUTFILE'                  CAT510  
               DISPLAY 'CAT510: OPEN STATUS = ' OUTFILE-STAT            CAT510  
               DISPLAY 'CAT510: U3003 - ABENDING ON BAD FILE STATUS'    CAT510  
               MOVE +3003    TO ABEND-CODE                              CAT510  
               CALL ABEND USING ABEND-CODE                              CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
           OPEN OUTPUT OUTLOG.                                          CAT510  
           DISPLAY 'CAT510: OUTLOG  OPENED FOR OUTPUT. STATUS = '       CAT510  
                                               OUTLOG-STAT.             CAT510  
                                                                        CAT510  
           IF  OUTLOG-OKAY                                              CAT510  
               CONTINUE                                                 CAT510  
           ELSE                                                         CAT510  
               DISPLAY 'CAT510: ERROR OPENING OUTLOG'                   CAT510  
               DISPLAY 'CAT510: OPEN STATUS = ' OUTLOG-STAT             CAT510  
               DISPLAY 'CAT510: U3006 - ABENDING ON BAD FILE STATUS'    CAT510  
               MOVE +3006    TO ABEND-CODE                              CAT510  
               CALL ABEND USING ABEND-CODE                              CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
           DISPLAY ' '.                                                 CAT510  
           MOVE SPACES                   TO W-TAB-AREA.                 CAT510  
                                                                        CAT510  
       1000-EXIT.                                                       CAT510  
           EXIT.                                                        CAT510  
      /                                                                 CAT510  
       1300-GET-LOG-HDR SECTION.                                        CAT510  
                                                                        CAT510  
                                                                        CAT510  
           READ INLOG INTO W-LOG-RECORD                                 CAT510  
                AT END                                                  CAT510  
                   MOVE '1'              TO END-OF-INLOG-SW             CAT510  
                   INITIALIZE            W-LOG-RECORD                   CAT510  
                   DISPLAY 'CAT510: END OF INLOG REACHED'               CAT510  
                   DISPLAY 'CAT510: INLOG FILE IS EMPTY'                CAT510  
           END-READ.                                                    CAT510  
                                                                        CAT510  
           IF  END-OF-INLOG                                             CAT510  
               IF  L-BYP-FILECHK                                        CAT510  
                   DISPLAY 'CAT510: BYPASSING EMPTY INLOG PER JCL'      CAT510  
               ELSE                                                     CAT510  
                   DISPLAY 'CAT510: U3004 - ABENDING ON EMPTY FILE'     CAT510  
                   MOVE +3004 TO ABEND-CODE                             CAT510  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT510  
               END-IF                                                   CAT510  
           ELSE                                                         CAT510  
               IF  INLOG-OKAY                                           CAT510  
                   DISPLAY 'CAT510: INLOG-REC= ' W-LOG-RECORD           CAT510  
               ELSE                                                     CAT510  
                   DISPLAY ' '                                          CAT510  
                   DISPLAY 'CAT510: U3005 - INLOG READ ERROR '          CAT510  
                           ' FILE STATUS = ' INLOG-STAT                 CAT510  
                   DISPLAY 'CAT510: U3005 - ABENDING READ ERROR'        CAT510  
                   MOVE +3005    TO ABEND-CODE                          CAT510  
                   CALL ABEND USING ABEND-CODE                          CAT510  
               END-IF                                                   CAT510  
           END-IF                                                       CAT510  
                                                                        CAT510  
           IF  W-LOG-CYCLE-NBR NOT NUMERIC                              CAT510  
               MOVE 0000 TO W-LOG-CYCLE-NBR                             CAT510  
           END-IF                                                       CAT510  
                                                                        CAT510  
           DISPLAY 'CAT510: PREV-PROC-DATE   = '                        CAT510  
                                           W-LOG-PROC-DATE              CAT510  
           DISPLAY 'CAT510: PREV-CYCLE-NBR   = '                        CAT510  
                                           W-LOG-CYCLE-NBR              CAT510  
           DISPLAY 'CAT510: PREV-PGM-NAME    = '                        CAT510  
                                           W-LOG-PGM-NAME               CAT510  
           DISPLAY 'CAT510: PREV-SYS-DATE    = '                        CAT510  
                                           W-LOG-SYS-DATE               CAT510  
           DISPLAY 'CAT510: PREV-SYS-TIME    = '                        CAT510  
                                           W-LOG-SYS-TIME               CAT510  
                                                                        CAT510  
           IF  W-LOG-PROC-DATE = BPD-PROC-DATE                          CAT510  
               MOVE W-LOG-CYCLE-NBR TO W-NEXT-CYCLE                     CAT510  
               IF  L-USE-PREV-CYCLE-NBR                                 CAT510  
                   DISPLAY 'CAT510: USING PREV CYCLE NBR PER JCL'       CAT510  
               ELSE                                                     CAT510  
                   ADD 1            TO W-NEXT-CYCLE                     CAT510  
               END-IF                                                   CAT510  
           ELSE                                                         CAT510  
               DISPLAY 'CAT510: FIRST CYCLE OF THE DAY'                 CAT510  
               DISPLAY 'CAT510: STARTING LOG-CYCLE WITH ONE'            CAT510  
               MOVE 1               TO W-NEXT-CYCLE                     CAT510  
           END-IF                                                       CAT510  
                                                                        CAT510  
           IF  W-NEXT-CYCLE = 0                                         CAT510  
               MOVE 1    TO W-NEXT-CYCLE                                CAT510  
           END-IF                                                       CAT510  
                                                                        CAT510  
           DISPLAY 'CAT510: NEXT-CYCLE-NBR   = '  W-NEXT-CYCLE          CAT510  
                   ' (THIS IS THE CYCLE NBR EXPECTED FOR THIS RUN)'     CAT510  
           DISPLAY ' '.                                                 CAT510  
                                                                        CAT510  
       1300-EXIT.                                                       CAT510  
           EXIT.                                                        CAT510  
      /                                                                 CAT510  
       1500-LOAD-B1 SECTION.                                            CAT510  
           DISPLAY 'CAT510: 1500-LOAD-B1'.                              CAT510  
                                                                        CAT510  
           MOVE SPACES                   TO  B1-TABLE-AREA.             CAT510  
           MOVE 0                        TO  B1-TBL-CNT.                CAT510  
                                                                        CAT510  
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500        CAT510  
                                                                        CAT510  
             MOVE  ' '                   TO  BH-BROKER-HEADER-INFO      CAT510  
                                             BH-ACAT-INFO               CAT510  
             MOVE  B1-SUB                TO  BH-BROKER-NUMBER-N         CAT510  
             MOVE  '015'                 TO  BH-LOGICAL-RECORD-CODE     CAT510  
             MOVE  '434500'              TO  BH-B2-INFO-ID              CAT510  
             CALL  GETB1V              USING BH-BROKER-HEADER-INFO      CAT510  
                                             BH-ACAT-INFO               CAT510  
             IF   BH-BROKER-ACTIVE                                      CAT510  
              AND BH-ACAT-ACTIVE                                        CAT510  
                   ADD 1 TO B1-TBL-CNT                                  CAT510  
                   MOVE  BH-BROKER-NUMBER-N                             CAT510  
                                         TO B1-ADP-CL-NO  (B1-TBL-CNT)  CAT510  
                   MOVE  BH-BROKER-NAME                                 CAT510  
                                         TO B1-CLI-NAME   (B1-TBL-CNT)  CAT510  
                   MOVE  BH-BROKER-OLD-CLEARING-HOUSE (2:4)             CAT510  
                                         TO B1-BKR-CLR-NO (B1-TBL-CNT)  CAT510  
                   IF  BH-BROKER-MINI-MAXI-SUBGROUP > ' '               CAT510  
                       MOVE BH-BROKER-MINI-MAXI-SUBGROUP                CAT510  
                                         TO B1-STREAM     (B1-TBL-CNT)  CAT510  
                   ELSE                                                 CAT510  
                      MOVE BH-BROKER-MINI-MAXI-INDICATOR                CAT510  
                                         TO B1-STREAM     (B1-TBL-CNT)  CAT510  
                   END-IF                                               CAT510  
                   MOVE  BH-BROKER-STATUS                               CAT510  
                                         TO B1-STATUS     (B1-TBL-CNT)  CAT510  
                   MOVE  BH-ACAT-STATUS                                 CAT510  
                                         TO B1-ACAT-STATUS(B1-TBL-CNT)  CAT510  
                       DISPLAY     'CNT=' B1-TBL-CNT                    CAT510  
                                    ' CLT ' B1-ADP-CL-NO  (B1-TBL-CNT)  CAT510  
                                        ' ' B1-CLI-NAME   (B1-TBL-CNT)  CAT510  
                                    ' BKR ' B1-BKR-CLR-NO (B1-TBL-CNT)  CAT510  
                                    ' STR ' B1-STREAM     (B1-TBL-CNT)  CAT510  
                                    ' STA ' B1-STATUS     (B1-TBL-CNT)  CAT510  
                                   ' ACAT ' B1-ACAT-STATUS(B1-TBL-CNT)  CAT510  
ET0001**        << READ B1 032977 >>                                    CAT510  
ET0001             IF B1-SUB = 235                                      CAT510  
ET0001                MOVE ' '          TO  BH-B2-INFO-ID               CAT510  
ET0001                MOVE '114'        TO  BH-LOGICAL-RECORD-CODE      CAT510  
ET0001                CALL GETB1V     USING BH-BROKER-HEADER-INFO       CAT510  
ET0001                                      BH-REQ-INFO                 CAT510  
ET0001                END-CALL                                          CAT510  
ET0001                IF BH-REQ-ACTIVE                                  CAT510  
ET0001                   MOVE  BH-REQ-WEALTH-MGMT-OMNI-ACCT             CAT510  
ET0001                     TO  W-PAINE-WEBBER-ACCT                      CAT510  
ET0001                END-IF                                            CAT510  
ET0001             END-IF                                               CAT510  
             END-IF                                                     CAT510  
                                                                        CAT510  
           END-PERFORM.                                                 CAT510  
                                                                        CAT510  
           DISPLAY ' '.                                                 CAT510  
                                                                        CAT510  
           DISPLAY  'B1 TABLE COUNT = ' B1-TBL-CNT.                     CAT510  
           DISPLAY ' '.                                                 CAT510  
       1500-EXIT. EXIT.                                                 CAT510  
      /                                                                 CAT510  
       1600-LOAD-TABLE.                                                 CAT510  
                                                                        CAT510  
           PERFORM VARYING W-SUB1 FROM 1 BY 1                           CAT510  
                   UNTIL W-SUB1 > B1-TBL-CNT                            CAT510  
                   MOVE B1-STREAM     (W-SUB1)                          CAT510  
                                  TO W-TAB-STREAM-CD  (W-SUB1)          CAT510  
                   MOVE B1-ADP-CL-NO  (W-SUB1)                          CAT510  
                                  TO W-TAB-CLIENT-NBR (W-SUB1)          CAT510  
                   MOVE B1-BKR-CLR-NO (W-SUB1)                          CAT510  
                                  TO W-TAB-BRK-NBR    (W-SUB1)          CAT510  
                   MOVE 0         TO W-TAB-ITEM-CNT   (W-SUB1)          CAT510  
                   MOVE 0         TO W-TAB-TOT-CNT    (W-SUB1)          CAT510  
                   IF   B1-STREAM     (W-SUB1) > ' '                    CAT510  
                        ADD 1 TO W-TAB-CNT                              CAT510  
                   END-IF                                               CAT510  
           END-PERFORM.                                                 CAT510  
                                                                        CAT510  
           DISPLAY 'CAT510: W-TAB-CNT = ' W-TAB-CNT.                    CAT510  
           DISPLAY ' '.                                                 CAT510  
                                                                        CAT510  
       1600-EXIT.                                                       CAT510  
           EXIT.                                                        CAT510  
      /                                                                 CAT510  
       2000-PROCESS.                                                    CAT510  
                                                                        CAT510  
           PERFORM 3000-READ-INPUT THRU 3000-EXIT                       CAT510  
                                                                        CAT510  
           IF  END-OF-INFILE                                            CAT510  
               GO TO 2000-EXIT                                          CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
           IF  NSCCMHDR-REC-TYPE = '1'                                  CAT510  
               MOVE NSCCMTRN-RECORD TO W-SIAC-HEADER                    CAT510  
               DISPLAY ' '                                              CAT510  
               DISPLAY 'CAT510: THIS IS THE SIAC HEADER RECORD: '       CAT510  
               DISPLAY '        COLS.007 = SIAC HEADER DATE '           CAT510  
                                '(' W-SIAC-HEADER-DATE ')'              CAT510  
               DISPLAY '        COLS.055 = SIAC HEADER CYCLE NUMBER '   CAT510  
                                '(' W-SIAC-HEADER-CYCLE-N ')'           CAT510  
               DISPLAY 'COLS.001-063 => '                               CAT510  
                       '----+----1----+----2----+----3----+----4'       CAT510  
                       '----+----5----+----6---'                        CAT510  
               DISPLAY 'COLS.001-063 => ' NSCCMTRN-RECORD (1 : 63)      CAT510  
                       ' <= COLS.001-063'                               CAT510  
               DISPLAY ' '                                              CAT510  
               DISPLAY 'COLS.064-133 => '                               CAT510  
                       '-+----7----+----8----+----9----+----0'          CAT510  
                       '----+----1----+----2----+----3---'              CAT510  
               DISPLAY 'COLS.064-133 => ' NSCCMTRN-RECORD (64: 70)      CAT510  
                       ' <= COLS.064-133'                               CAT510  
               DISPLAY ' '                                              CAT510  
                                                                        CAT510  
               IF  W-SIAC-HEADER-CYCLE-N NOT NUMERIC                    CAT510  
                   DISPLAY 'CAT510: W-SIAC-HEADER-CYCLE-N '             CAT510  
                                '(' W-SIAC-HEADER-CYCLE-N ')'           CAT510  
                                ' NOT NUMERIC. REPLACE WITH 01'         CAT510  
                   MOVE 01          TO W-SIAC-HEADER-CYCLE-N            CAT510  
               END-IF                                                   CAT510  
                                                                        CAT510  
               IF  W-SIAC-HEADER-DATE = BPD-PROC-DATE                   CAT510  
                   DISPLAY 'CAT510: W-SIAC-HEADER-DATE'                 CAT510  
                                '(' W-SIAC-HEADER-DATE ')'              CAT510  
                                ' = BPD-PROC-DATE '                     CAT510  
                                '(' BPD-PROC-DATE '). OK'               CAT510  
               ELSE                                                     CAT510  
                   DISPLAY 'CAT510: W-SIAC-HEADER-DATE'                 CAT510  
                                '(' W-SIAC-HEADER-DATE ')'              CAT510  
                                ' NOT = BPD-PROC-DATE '                 CAT510  
                                '(' BPD-PROC-DATE ').NOT OKAY!!!!'      CAT510  
               END-IF                                                   CAT510  
                                                                        CAT510  
               IF  W-SIAC-HEADER-CYCLE-N = W-NEXT-CYCLE                 CAT510  
                   DISPLAY 'CAT510: W-SIAC-HEADER-CYCLE-N '             CAT510  
                                '(' W-SIAC-HEADER-CYCLE-N ')'           CAT510  
                                '   = W-NEXT-CYCLE '                    CAT510  
                                '(' W-NEXT-CYCLE ').      OK'           CAT510  
               ELSE                                                     CAT510  
                   DISPLAY 'CAT510: W-SIAC-HEADER-CYCLE-N '             CAT510  
                                '(' W-SIAC-HEADER-CYCLE-N ')'           CAT510  
                                '   NOT = W-NEXT-CYCLE '                CAT510  
                                '(' W-NEXT-CYCLE ').     NOT OKAY!!!!'  CAT510  
               END-IF                                                   CAT510  
                                                                        CAT510  
               IF  W-SIAC-HEADER-DATE NOT = BPD-PROC-DATE               CAT510  
                   IF  L-BYP-DATECHK                                    CAT510  
                       DISPLAY 'CAT510: BYPASS DATECHK PER JCLPARM'     CAT510  
                   ELSE                                                 CAT510  
                     DISPLAY ' '                                        CAT510  
                     DISPLAY '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'CAT510  
                             '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'CAT510  
                     DISPLAY 'CAT510: SIAC FILE HAS INVALID HEADER DATE'CAT510  
                     DISPLAY '        THIS JOB RUNS 5 TIMES A DAY AND ' CAT510  
                     DISPLAY '        BZZZ.SIAC0716.ACAT.TRAN(0)'       CAT510  
                                    ' COMES IN 5 TIMES A DAY '          CAT510  
                     DISPLAY '        CHECK THE TIMESTAMP ON THE FILE'  CAT510  
                     DISPLAY '        IF THE FILE IS LATE,'             CAT510  
                             ' RE-RUN THE JOB WHEN THE FILE COMES IN'   CAT510  
                     DISPLAY '        CHECK CONTENTS OF ALL TODAYS'     CAT510  
                             ' FILES.  MAKE SURE THEY ARE IN SEQUENCE'  CAT510  
                     DISPLAY '        MAKE SURE THE GDG FILES ARE IN'   CAT510  
                             ' CYCLE SEQUENCE (01,02,03,04,05)'         CAT510  
                     DISPLAY 'CAT510: U3021 - ABENDING ON BAD DATE'     CAT510  
                     DISPLAY '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'CAT510  
                             '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'CAT510  
                     MOVE +3021 TO ABEND-CODE                           CAT510  
                     PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT          CAT510  
                   END-IF                                               CAT510  
               END-IF                                                   CAT510  
                                                                        CAT510  
               IF  W-SIAC-HEADER-CYCLE-N NOT = W-NEXT-CYCLE             CAT510  
                   IF  L-BYP-CYCLE                                      CAT510  
                       DISPLAY 'CAT510: BYPASS CYCLE CHK PER JCLPARM'   CAT510  
                   ELSE                                                 CAT510  
                     DISPLAY ' '                                        CAT510  
                     DISPLAY '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'CAT510  
                             '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'CAT510  
                     DISPLAY 'CAT510: SIAC FILE HAS INVALID CYCLE NBR'  CAT510  
                     DISPLAY '        WE ARE EXPECTING CYCLE '          CAT510  
                                        W-NEXT-CYCLE                    CAT510  
                                    ' FOR PROCESS DATE ' BPD-PROC-DATE  CAT510  
                     DISPLAY '        THIS JOB RUNS 5 TIMES A DAY AND ' CAT510  
                     DISPLAY '        BZZZ.SIAC0716.ACAT.TRAN(0)'       CAT510  
                                    ' COMES IN 5 TIMES A DAY '          CAT510  
                     DISPLAY '        CHECK THE TIMESTAMP ON THE FILE'  CAT510  
                     DISPLAY '        IF THE FILE IS LATE,'             CAT510  
                             ' RE-RUN THE JOB WHEN THE FILE COMES IN'   CAT510  
                     DISPLAY '        CHECK CONTENTS OF ALL TODAYS'     CAT510  
                             ' FILES.  MAKE SURE THEY ARE IN SEQUENCE'  CAT510  
                     DISPLAY '        MAKE SURE THE GDG FILES ARE IN'   CAT510  
                             ' CYCLE SEQUENCE (01,02,03,04,05)'         CAT510  
                     DISPLAY 'CAT510: U3022 - ABENDING ON BAD CYCLE NBR'CAT510  
                     DISPLAY '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'CAT510  
                             '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'CAT510  
                       MOVE +3022 TO ABEND-CODE                         CAT510  
                       PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT        CAT510  
                   END-IF                                               CAT510  
               END-IF                                                   CAT510  
                                                                        CAT510  
*              IF  L-USE-NSCC-CYCLE-NBR                                 CAT510  
*                  MOVE W-SIAC-HEADER-CYCLE-N TO W-NEXT-CYCLE           CAT510  
*              END-IF                                                   CAT510  
                                                                        CAT510  
               DISPLAY ' '                                              CAT510  
DJ0004         PERFORM 7000-WRITE-OUTPUT THRU 7000-EXIT                 CAT510  
               GO TO 2000-PROCESS                                       CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
ET0001     IF  L-PROCESS-CLT-235                                        CAT510  
ET0001         PERFORM 2100-PROCESS-CLT-235-ONLY THRU 2100-EXIT         CAT510  
ET0001         GO TO 2000-PROCESS                                       CAT510  
ET0001     ELSE                                                         CAT510  
           IF  NSCCMHDR-REC-TYPE = 'H' OR 'M' OR 'T'                    CAT510  
               MOVE NSCCMTRN-RECORD TO W-TRN-RECORD                     CAT510  
               PERFORM 7000-WRITE-OUTPUT THRU 7000-EXIT                 CAT510  
           ELSE                                                         CAT510  
               DISPLAY 'CAT510: BYPASS UNKNOWN REC-TYPE:'               CAT510  
                              ' W-REC-LEN-IN=' W-REC-LEN-IN             CAT510  
               DISPLAY NSCCMTRN-RECORD (1 : W-REC-LEN-IN)               CAT510  
               DISPLAY ' '                                              CAT510  
               GO TO 2000-PROCESS                                       CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
           IF  NSCCMHDR-REC-TYPE = 'H'                                  CAT510  
               DISPLAY ' '                                              CAT510  
               DISPLAY 'HEADER :' NSCCMHDR-RECORD                       CAT510  
               MOVE NSCCMHDR-RECORD TO W-HDR-RECORD                     CAT510  
               IF  W-HDR-TRL-SW = 'T'                                   CAT510  
                   PERFORM 4000-EDIT-HEADER  THRU 4000-EXIT             CAT510  
               ELSE                                                     CAT510  
                   DISPLAY 'CAT510: MISSING TRAILER FOR PREV BROKER'    CAT510  
                   DISPLAY 'CAT510: U3031 - ABENDING ON BAD TRAILER'    CAT510  
                   MOVE +3031 TO ABEND-CODE                             CAT510  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT510  
               END-IF                                                   CAT510  
               MOVE 1 TO W-CURR-TOT-CNT                                 CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
           IF  NSCCMHDR-REC-TYPE = 'T'                                  CAT510  
               DISPLAY 'TRAILER:' NSCCMTRL-RECORD                       CAT510  
               MOVE NSCCMTRL-RECORD TO W-TRL-RECORD                     CAT510  
               ADD 1 TO W-CURR-TOT-CNT                                  CAT510  
               IF  W-HDR-TRL-SW = 'H'                                   CAT510  
                   PERFORM 6000-EDIT-TRAILER THRU 6000-EXIT             CAT510  
               ELSE                                                     CAT510  
                   DISPLAY 'CAT510: MISSING HEADER FOR THIS TRAILER'    CAT510  
                   DISPLAY 'CAT510: U3032 - ABENDING ON BAD TRAILER'    CAT510  
                   MOVE +3032 TO ABEND-CODE                             CAT510  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT510  
               END-IF                                                   CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
           IF  NSCCMHDR-REC-TYPE = 'M'                                  CAT510  
               ADD 1 TO W-DETAIL-CNT                                    CAT510  
               ADD 1 TO W-CURR-TOT-CNT                                  CAT510  
               IF  W-HDR-TRL-SW = 'H'                                   CAT510  
                   CONTINUE                                             CAT510  
               ELSE                                                     CAT510  
                   DISPLAY '        ' NSCCMTRN-RECORD (1 : W-REC-LEN-IN)CAT510  
                   DISPLAY 'CAT510: MISSING HEADER FOR THIS DETAIL'     CAT510  
                   DISPLAY 'CAT510: U3033 - ABENDING ON BAD HEADER'     CAT510  
                   MOVE +3033 TO ABEND-CODE                             CAT510  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT510  
               END-IF                                                   CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
           GO TO 2000-PROCESS.                                          CAT510  
                                                                        CAT510  
       2000-EXIT.                                                       CAT510  
           EXIT.                                                        CAT510  
      /                                                                 CAT510  
ET0001*                                                                 CAT510  
ET0001*--------------------------------------------------------------*  CAT510  
ET0001* PROCESS CLIENT 235 (UBS) RECORDS ONLY.                       *  CAT510  
ET0001* INBOUND FILE IS SENT FROM WEALTH MANAGEMENT VIA NSCC/SIAC    *  CAT510  
ET0001* ON BEHALF OF CLIENT 235 (BRKR NBR = 0642).                   *  CAT510  
ET0001* THE FILE MAY CONTAIN PAINE WEBBER'S BOOKING DATA RECORDS     *  CAT510  
ET0001* THAT SHOULD BE BYPASSED FOR ACAT PROCESS.                    *  CAT510  
ET0001*--------------------------------------------------------------*  CAT510  
ET0001 2100-PROCESS-CLT-235-ONLY.                                       CAT510  
           IF  NSCCMHDR-REC-TYPE = 'H'                                  CAT510  
               IF  NSCCMHDR-BROKER-CLR-NBR = '0642'                     CAT510  
                   MOVE NSCCMHDR-RECORD TO W-TRN-RECORD                 CAT510  
                   PERFORM 7000-WRITE-OUTPUT THRU 7000-EXIT             CAT510  
               ELSE                                                     CAT510  
                   GO TO 2100-EXIT                                      CAT510  
               END-IF                                                   CAT510  
           ELSE                                                         CAT510  
           IF  NSCCMHDR-REC-TYPE = 'T'                                  CAT510  
               IF  NSCCMTRL-BROKER-CLR-NBR = '0642'                     CAT510  
                   MOVE NSCCMTRL-RECORD TO W-TRN-RECORD                 CAT510  
                   PERFORM 7000-WRITE-OUTPUT THRU 7000-EXIT             CAT510  
               ELSE                                                     CAT510  
                   GO TO 2100-EXIT                                      CAT510  
               END-IF                                                   CAT510  
           ELSE                                                         CAT510  
           IF  NSCCMHDR-REC-TYPE = 'M'                                  CAT510  
               IF  NSCCMTRN-DIST-PARTICIPANT = '0642'                   CAT510  
                   PERFORM 2110-CHECK-PAINE-WEBBER-ACCT THRU 2110-EXIT  CAT510  
                   MOVE NSCCMTRN-RECORD TO W-TRN-RECORD                 CAT510  
                   PERFORM 7000-WRITE-OUTPUT THRU 7000-EXIT             CAT510  
               ELSE                                                     CAT510  
                   GO TO 2100-EXIT                                      CAT510  
               END-IF                                                   CAT510  
           ELSE                                                         CAT510  
               DISPLAY 'CAT510: BYPASS UNKNOWN REC-TYPE:'               CAT510  
                              ' W-REC-LEN-IN=' W-REC-LEN-IN             CAT510  
               DISPLAY NSCCMTRN-RECORD (1 : W-REC-LEN-IN)               CAT510  
               DISPLAY ' '                                              CAT510  
               GO TO 2100-EXIT                                          CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
           IF  NSCCMHDR-REC-TYPE = 'H'                                  CAT510  
               DISPLAY ' '                                              CAT510  
               DISPLAY 'HEADER :' NSCCMHDR-RECORD                       CAT510  
               MOVE NSCCMHDR-RECORD TO W-HDR-RECORD                     CAT510  
               IF  W-HDR-TRL-SW = 'T'                                   CAT510  
                   PERFORM 4000-EDIT-HEADER  THRU 4000-EXIT             CAT510  
               ELSE                                                     CAT510  
                   DISPLAY 'CAT510: MISSING TRAILER FOR PREV BROKER'    CAT510  
                   DISPLAY 'CAT510: U3031 - ABENDING ON BAD TRAILER'    CAT510  
                   MOVE +3031 TO ABEND-CODE                             CAT510  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT510  
               END-IF                                                   CAT510  
               MOVE 1 TO W-CURR-TOT-CNT                                 CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
           IF  NSCCMHDR-REC-TYPE = 'T'                                  CAT510  
               DISPLAY 'TRAILER:' NSCCMTRL-RECORD                       CAT510  
               MOVE NSCCMTRL-RECORD TO W-TRL-RECORD                     CAT510  
               ADD 1 TO W-CURR-TOT-CNT                                  CAT510  
               IF  W-HDR-TRL-SW = 'H'                                   CAT510  
                   PERFORM 6000-EDIT-TRAILER THRU 6000-EXIT             CAT510  
               ELSE                                                     CAT510  
                   DISPLAY 'CAT510: MISSING HEADER FOR THIS TRAILER'    CAT510  
                   DISPLAY 'CAT510: U3032 - ABENDING ON BAD TRAILER'    CAT510  
                   MOVE +3032 TO ABEND-CODE                             CAT510  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT510  
               END-IF                                                   CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
           IF  NSCCMHDR-REC-TYPE = 'M'                                  CAT510  
               ADD 1 TO W-DETAIL-CNT                                    CAT510  
               ADD 1 TO W-CURR-TOT-CNT                                  CAT510  
               IF  W-HDR-TRL-SW = 'H'                                   CAT510  
                   CONTINUE                                             CAT510  
               ELSE                                                     CAT510  
                   DISPLAY '        ' NSCCMTRN-RECORD (1 : W-REC-LEN-IN)CAT510  
                   DISPLAY 'CAT510: MISSING HEADER FOR THIS DETAIL'     CAT510  
                   DISPLAY 'CAT510: U3033 - ABENDING ON BAD HEADER'     CAT510  
                   MOVE +3033 TO ABEND-CODE                             CAT510  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT510  
               END-IF                                                   CAT510  
           END-IF.                                                      CAT510  
       2100-EXIT.                                                       CAT510  
           EXIT.                                                        CAT510  
      /                                                                 CAT510  
ET0001*                                                                 CAT510  
ET0001*--------------------------------------------------------------*  CAT510  
ET0001* DISPLAY WARNING MESSAGE IF ACCOUNT BELONGS TO PAINE WEBBER.  *  CAT510  
ET0001* CHECK "TI" RECORD ONLY.  "AT" AND "FR" RECORDS DO NOT CARRY  *  CAT510  
ET0001* ACCOUNT NUMBER.                                              *  CAT510  
ET0001*--------------------------------------------------------------*  CAT510  
ET0001 2110-CHECK-PAINE-WEBBER-ACCT.                                    CAT510  
           IF NSCCMTRN-TRANSFER-OUTPUT                                  CAT510  
              IF NSCCMTRN-TI-RCV-NBR = '0642'                           CAT510  
                 IF NSCCMTRN-TI-RCV-ACCT-NBR (1:8) = W-PAINE-WEBBER-ACCTCAT510  
                    ADD 1 TO W-PAINE-WEBBER-CNT                         CAT510  
                    MOVE NSCCMTRN-TI-ACAT-CTL-NBR TO W-TI-ACAT-NBR      CAT510  
                    DISPLAY 'CAT510: ** WARNING ** PAINE WEBBER '       CAT510  
                            'BOOKING ACCT "TI" RECORD FOUND'            CAT510  
                    DISPLAY ' ACAT CNTL:' NSCCMTRN-TI-ACAT-CTL-NBR      CAT510  
                             '  RCV NBR:' NSCCMTRN-TI-RCV-NBR           CAT510  
                            '  RCV ACCT:' NSCCMTRN-TI-RCV-ACCT-NBR      CAT510  
                             '  DEL NBR:' NSCCMTRN-TI-DEL-NBR           CAT510  
                            '  DEL ACCT:' NSCCMTRN-TI-DEL-ACCT-NBR      CAT510  
                 END-IF                                                 CAT510  
              ELSE                                                      CAT510  
              IF NSCCMTRN-TI-DEL-NBR = '0642'                           CAT510  
                 IF NSCCMTRN-TI-DEL-ACCT-NBR (1:8) = W-PAINE-WEBBER-ACCTCAT510  
                    ADD 1 TO W-PAINE-WEBBER-CNT                         CAT510  
                    MOVE NSCCMTRN-TI-ACAT-CTL-NBR TO W-TI-ACAT-NBR      CAT510  
                    DISPLAY 'CAT510: ** WARNING ** PAINE WEBBERS '      CAT510  
                            'BOOKING ACCT "TI" RECORD FOUND'            CAT510  
                    DISPLAY ' ACAT CNTL:' NSCCMTRN-TI-ACAT-CTL-NBR      CAT510  
                             '  RCV NBR:' NSCCMTRN-TI-RCV-NBR           CAT510  
                            '  RCV ACCT:' NSCCMTRN-TI-RCV-ACCT-NBR      CAT510  
                             '  DEL NBR:' NSCCMTRN-TI-DEL-NBR           CAT510  
                            '  DEL ACCT:' NSCCMTRN-TI-DEL-ACCT-NBR      CAT510  
                 END-IF                                                 CAT510  
              END-IF                                                    CAT510  
              END-IF                                                    CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
           IF NSCCMTRN-ASSET-OUTPUT                                     CAT510  
              IF (NSCCMTRN-AT-RCV-NBR = '0642')                         CAT510  
              OR (NSCCMTRN-AT-DEL-NBR = '0642')                         CAT510  
                 IF NSCCMTRN-AT-ACAT-CTL-NBR = W-TI-ACAT-NBR            CAT510  
                    ADD 1 TO W-PAINE-WEBBER-CNT                         CAT510  
                    DISPLAY 'CAT510: ** WARNING ** PAINE WEBBER '       CAT510  
                            'BOOKING ACCT "AT" RECORD FOUND'            CAT510  
                    DISPLAY ' ACAT CNTL:' NSCCMTRN-AT-ACAT-CTL-NBR      CAT510  
                             '  RCV NBR:' NSCCMTRN-AT-RCV-NBR           CAT510  
                             '  DEL NBR:' NSCCMTRN-AT-DEL-NBR           CAT510  
                 END-IF                                                 CAT510  
              END-IF                                                    CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
           IF NSCCMTRN-FUND-REG-OUTPUT                                  CAT510  
              IF (NSCCMTRN-FR-RCV-NBR = '0642')                         CAT510  
              OR (NSCCMTRN-FR-DEL-NBR = '0642')                         CAT510  
                 IF NSCCMTRN-FR-ACAT-CTL-NBR = W-TI-ACAT-NBR            CAT510  
                    ADD 1 TO W-PAINE-WEBBER-CNT                         CAT510  
                    DISPLAY 'CAT510: ** WARNING ** PAINE WEBBER '       CAT510  
                            'BOOKING ACCT "FR" RECORD FOUND'            CAT510  
                    DISPLAY ' ACAT CNTL:' NSCCMTRN-FR-ACAT-CTL-NBR      CAT510  
                             '  RCV NBR:' NSCCMTRN-FR-RCV-NBR           CAT510  
                             '  DEL NBR:' NSCCMTRN-FR-DEL-NBR           CAT510  
                 END-IF                                                 CAT510  
              END-IF                                                    CAT510  
           END-IF.                                                      CAT510  
       2110-EXIT.                                                       CAT510  
           EXIT.                                                        CAT510  
      /                                                                 CAT510  
       3000-READ-INPUT.                                                 CAT510  
                                                                        CAT510  
           IF  END-OF-INFILE                                            CAT510  
               GO 3000-EXIT                                             CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
           READ INFILE                                                  CAT510  
                AT END                                                  CAT510  
                   MOVE '1'              TO END-OF-INFILE-SW            CAT510  
                   DISPLAY 'CAT510: END OF INPUT REACHED'               CAT510  
                            '.  INPUT-CNT = ' W-INFILE-CNT              CAT510  
                   GO TO 3000-EXIT                                      CAT510  
           END-READ.                                                    CAT510  
                                                                        CAT510  
           ADD  1                        TO W-INFILE-CNT.               CAT510  
                                                                        CAT510  
           IF  INFILE-OKAY                                              CAT510  
               CONTINUE                                                 CAT510  
           ELSE                                                         CAT510  
               DISPLAY 'CAT510: ERROR READING INFILE'                   CAT510  
               DISPLAY 'CAT510: READ STATUS = ' INFILE-STAT             CAT510  
                            '.  INPUT-CNT = ' W-INFILE-CNT              CAT510  
               DISPLAY 'CAT510: U3007 - ABENDING ON BAD FILE STATUS'    CAT510  
               MOVE +3007 TO ABEND-CODE                                 CAT510  
               PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT                CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
       3000-EXIT.                                                       CAT510  
           EXIT.                                                        CAT510  
      /                                                                 CAT510  
       4000-EDIT-HEADER SECTION.                                        CAT510  
                                                                        CAT510  
           IF  W-CURR-BRK-NBR = NSCCMTRL-BROKER-CLR-NBR                 CAT510  
               IF  W-CURR-HDR-SW = 'Y'                                  CAT510  
                   DISPLAY 'CAT510: DUPLICATE HEADER'                   CAT510  
                                  ' FOR BROKER ' W-CURR-BRK-NBR         CAT510  
                   IF  L-BYP-FILECHK                                    CAT510  
                     DISPLAY 'CAT510: BYPASSING BAD FILE PER JCL'       CAT510  
                   ELSE                                                 CAT510  
                     DISPLAY 'CAT510: U3009 - ABENDING ON DUP BRK HDR'  CAT510  
                     MOVE +3009 TO ABEND-CODE                           CAT510  
                     PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT          CAT510  
                   END-IF                                               CAT510  
               END-IF                                                   CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
           MOVE ' '                         TO W-BRK-SW                 CAT510  
           SET TAB-X TO 1.                                              CAT510  
           SEARCH W-TAB VARYING TAB-X                                   CAT510  
               AT END                                                   CAT510  
                    MOVE ' '             TO W-BRK-SW                    CAT510  
                    MOVE ' '             TO W-CURR-TAB                  CAT510  
                    MOVE 0               TO W-CURR-ITEM-CNT             CAT510  
                    MOVE 0               TO W-CURR-TOT-CNT              CAT510  
               WHEN W-TAB-BRK-NBR (TAB-X) =                             CAT510  
                                            NSCCMHDR-BROKER-CLR-NBR     CAT510  
                    MOVE 'Y'             TO W-BRK-SW                    CAT510  
                    MOVE W-TAB (TAB-X)   TO W-CURR-TAB                  CAT510  
           END-SEARCH.                                                  CAT510  
                                                                        CAT510  
           IF   W-BRK-SW = 'Y'                                          CAT510  
                DISPLAY '======> BROKER FOUND  ' NSCCMHDR-BROKER-CLR-NBRCAT510  
                          ' INPUT-CNT=' W-INFILE-CNT                    CAT510  
                              ' CYCLE=' W-HDR-MULTI-CYCLE-NBR           CAT510  
                             ' STREAM=' W-CURR-STREAM-CD                CAT510  
                                ' CLT=' W-CURR-CLIENT-NBR               CAT510  
           ELSE                                                         CAT510  
                MOVE NSCCMHDR-BROKER-CLR-NBR TO W-CURR-BRK-NBR          CAT510  
                DISPLAY 'BYPASS: BROKER NOTFND ' NSCCMHDR-BROKER-CLR-NBRCAT510  
                          ' INPUT-CNT=' W-INFILE-CNT                    CAT510  
                              ' CYCLE=' W-HDR-MULTI-CYCLE-NBR           CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
           IF  NSCCMHDR-PROC-DATE = BPD-PROC-DATE                       CAT510  
               CONTINUE                                                 CAT510  
           ELSE                                                         CAT510  
               DISPLAY 'CAT510: NSCCMHDR-PROC-DATE('                    CAT510  
                                NSCCMHDR-PROC-DATE ') NOT = '           CAT510  
                       'BPD-PROC-DATE(' BPD-PROC-DATE ')'               CAT510  
               IF L-BYP-DATECHK                                         CAT510  
                   DISPLAY 'CAT510: BYPASSING DATECHK PER JCLPARM'      CAT510  
               ELSE                                                     CAT510  
                   IF  L-BYP-FILECHK                                    CAT510  
                     DISPLAY 'CAT510: BYPASSING BAD DATE FILE PER JCL'  CAT510  
                   ELSE                                                 CAT510  
                     DISPLAY 'CAT510: U3029 - ABENDING ON BAD DATE'     CAT510  
                     MOVE +3029 TO ABEND-CODE                           CAT510  
                     PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT          CAT510  
                   END-IF                                               CAT510  
               END-IF                                                   CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
           IF  NSCCMHDR-MULTI-CYCLE-IND = 'N'                           CAT510  
               CONTINUE                                                 CAT510  
           ELSE                                                         CAT510  
               DISPLAY 'CAT510: NSCCMHDR-MULTI-CYCLE-IND '              CAT510  
                            '(' NSCCMHDR-MULTI-CYCLE-IND ')'            CAT510  
                            ' NOT = N'                                  CAT510  
               IF  L-BYP-FILECHK                                        CAT510  
                   DISPLAY 'CAT510: BYPASSING BAD CYCLE IND'            CAT510  
               ELSE                                                     CAT510  
                   DISPLAY 'CAT510: U3010 - ABENDING ON BAD CYCLE IND'  CAT510  
                   MOVE +3010 TO ABEND-CODE                             CAT510  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT510  
               END-IF                                                   CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
           IF  NSCCMHDR-MULTI-CYCLE-NBR NUMERIC                         CAT510  
           AND NSCCMHDR-MULTI-CYCLE-NBR > '0000'                        CAT510  
               CONTINUE                                                 CAT510  
           ELSE                                                         CAT510  
               DISPLAY 'CAT510: NSCCMHDR-MULTI-CYCLE-NBR '              CAT510  
                            '(' NSCCMHDR-MULTI-CYCLE-NBR ')'            CAT510  
                            ' NOT NUMERIC'                              CAT510  
               IF  L-BYP-FILECHK                                        CAT510  
                   DISPLAY 'CAT510: BYPASSING BAD CYCLE NUMBER'         CAT510  
               ELSE                                                     CAT510  
                   DISPLAY 'CAT510: CHECK CONTENTS OF ALL TODAYS'       CAT510  
                           ' FILES. MAKE SURE THEY ARE IN SEQUENCE'     CAT510  
                   DISPLAY 'CAT510: MAKE SURE THE GDG FILES ARE IN'     CAT510  
                           ' CYCLE SEQUENCE (01,02,03,04,05)'           CAT510  
                   DISPLAY 'CAT510: U3011 - ABENDING ON BAD CYCLE NBR'  CAT510  
                   MOVE +3011 TO ABEND-CODE                             CAT510  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT510  
               END-IF                                                   CAT510  
           END-IF.                                                      CAT510  
*          IF  L-USE-NSCC-CYCLE-NBR                                     CAT510  
*              MOVE NSCCMHDR-MULTI-CYCLE-NBR TO W-NEXT-CYCLE            CAT510  
*          END-IF.                                                      CAT510  
                                                                        CAT510  
           IF  NSCCMHDR-MULTI-CYCLE-NBR = W-NEXT-CYCLE                  CAT510  
               CONTINUE                                                 CAT510  
           ELSE                                                         CAT510  
               DISPLAY 'CAT510: NSCCMHDR-MULTI-CYCLE-NBR '              CAT510  
                            '(' NSCCMHDR-MULTI-CYCLE-NBR ')'            CAT510  
                            ' NOT = W-NEXT-CYCLE '                      CAT510  
                                '(' W-NEXT-CYCLE ')'                    CAT510  
               IF  L-BYP-CYCLE                                          CAT510  
                   DISPLAY 'CAT510: BYPASSING BAD CYCLE PER JCLPARM'    CAT510  
               ELSE                                                     CAT510  
                   DISPLAY 'CAT510: CHECK CONTENTS OF ALL TODAYS'       CAT510  
                           ' FILES. MAKE SURE THEY ARE IN SEQUENCE'     CAT510  
                   DISPLAY 'CAT510: MAKE SURE THE GDG FILES ARE IN'     CAT510  
                           ' CYCLE SEQUENCE (01,02,03,04,05)'           CAT510  
                   DISPLAY 'CAT510: U3012 - ABENDING ON BAD CYCLE NBR'  CAT510  
                   MOVE +3012 TO ABEND-CODE                             CAT510  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT510  
               END-IF                                                   CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
           IF  NSCCMHDR-VAR-LEN-REC-IND = '*'                           CAT510  
               CONTINUE                                                 CAT510  
           ELSE                                                         CAT510  
               DISPLAY 'CAT510: NSCCMHDR-VAR-LEN-REC-IND '              CAT510  
                            '(' NSCCMHDR-VAR-LEN-REC-IND ')'            CAT510  
                            ' NOT = *'                                  CAT510  
               IF  L-BYP-FILECHK                                        CAT510  
                   DISPLAY 'CAT510: BYPASSING BAD VAR-LEN-REC-IND'      CAT510  
               ELSE                                                     CAT510  
                   DISPLAY 'CAT510: U3013 - ABENDING ON BAD VAR IND'    CAT510  
                   MOVE +3013 TO ABEND-CODE                             CAT510  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT510  
               END-IF                                                   CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
           MOVE 'Y'                       TO W-CURR-HDR-SW              CAT510  
           MOVE NSCCMHDR-PROC-DATE        TO W-CURR-HDR-DATE            CAT510  
           MOVE NSCCMHDR-MULTI-CYCLE-NBR  TO W-CURR-HDR-CYCLE.          CAT510  
                                                                        CAT510  
           MOVE 'H'               TO W-HDR-TRL-SW.                      CAT510  
                                                                        CAT510  
       4000-EXIT.                                                       CAT510  
           EXIT.                                                        CAT510  
      /                                                                 CAT510  
       6000-EDIT-TRAILER SECTION.                                       CAT510  
                                                                        CAT510  
           IF  W-CURR-BRK-NBR = NSCCMTRL-BROKER-CLR-NBR                 CAT510  
               IF  W-CURR-TRL-SW = 'Y'                                  CAT510  
                   DISPLAY 'CAT510: DUPLICATE TRAILER'                  CAT510  
                                  ' FOR BROKER ' W-CURR-BRK-NBR         CAT510  
                   IF  L-BYP-FILECHK                                    CAT510  
                       DISPLAY 'CAT510: BYPASSING DUPLICATE TRAILER'    CAT510  
                   ELSE                                                 CAT510  
                   DISPLAY 'CAT510: U3041 - ABENDING ON DUP TRAILER'    CAT510  
                       MOVE +3041 TO ABEND-CODE                         CAT510  
                       PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT        CAT510  
                   END-IF                                               CAT510  
               ELSE                                                     CAT510  
                   IF  W-CURR-HDR-SW NOT = 'Y'                          CAT510  
                       DISPLAY 'CAT510: MISSING HEADER'                 CAT510  
                   IF  L-BYP-FILECHK                                    CAT510  
                       DISPLAY 'CAT510: BYPASSING MISSING HEADER'       CAT510  
                   ELSE                                                 CAT510  
                   DISPLAY 'CAT510: U3042 - ABENDING ON MISSING HDR'    CAT510  
                       MOVE +3042 TO ABEND-CODE                         CAT510  
                       PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT        CAT510  
                   END-IF                                               CAT510  
                   END-IF                                               CAT510  
               END-IF                                                   CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
           MOVE 'Y'                       TO W-CURR-TRL-SW              CAT510  
           MOVE NSCCMTRL-PROC-DATE        TO W-CURR-TRL-DATE            CAT510  
           MOVE NSCCMTRL-MULTI-CYCLE-NBR  TO W-CURR-TRL-CYCLE.          CAT510  
           MOVE NSCCMTRL-ITEM-CNT         TO W-CURR-ITEM-CNT.           CAT510  
                                                                        CAT510  
           IF  NSCCMTRL-PROC-DATE = BPD-PROC-DATE                       CAT510  
               CONTINUE                                                 CAT510  
           ELSE                                                         CAT510  
               DISPLAY 'CAT510: NSCCMTRL-PROC-DATE('                    CAT510  
                                NSCCMTRL-PROC-DATE ') NOT = '           CAT510  
                       'BPD-PROC-DATE(' BPD-PROC-DATE ')'               CAT510  
               IF L-BYP-DATECHK                                         CAT510  
                   DISPLAY 'CAT510: BYPASSING DATECHK PER JCLPARM'      CAT510  
               ELSE                                                     CAT510  
                   IF  L-BYP-FILECHK                                    CAT510  
                     DISPLAY 'CAT510: BYPASSING BAD DATE FILE PER JCL'  CAT510  
                   ELSE                                                 CAT510  
                     DISPLAY 'CAT510: U3014 - ABENDING ON BAD DATE'     CAT510  
                     MOVE +3014 TO ABEND-CODE                           CAT510  
                     PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT          CAT510  
                   END-IF                                               CAT510  
               END-IF                                                   CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
           IF  NSCCMTRL-MULTI-CYCLE-IND = 'N'                           CAT510  
               CONTINUE                                                 CAT510  
           ELSE                                                         CAT510  
               DISPLAY 'CAT510: NSCCMTRL-MULTI-CYCLE-IND '              CAT510  
                            '(' NSCCMTRL-MULTI-CYCLE-IND ')'            CAT510  
                            ' NOT = N'                                  CAT510  
               IF  L-BYP-FILECHK                                        CAT510  
                   DISPLAY 'CAT510: BYPASSING BAD CYCLE IND'            CAT510  
               ELSE                                                     CAT510  
                   DISPLAY 'CAT510: U3015 - ABENDING ON BAD CYCLE IND'  CAT510  
                   MOVE +3015 TO ABEND-CODE                             CAT510  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT510  
               END-IF                                                   CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
           IF  NSCCMTRL-MULTI-CYCLE-NBR NUMERIC                         CAT510  
           AND NSCCMTRL-MULTI-CYCLE-NBR > '0000'                        CAT510  
               CONTINUE                                                 CAT510  
           ELSE                                                         CAT510  
               DISPLAY 'CAT510: NSCCMTRL-MULTI-CYCLE-NBR '              CAT510  
                            '(' NSCCMTRL-MULTI-CYCLE-NBR ')'            CAT510  
                            ' NOT NUMERIC'                              CAT510  
               IF  L-BYP-CYCLE                                          CAT510  
                   DISPLAY 'CAT510: BYPASSING BAD CYCLE PER JCLPARM'    CAT510  
               ELSE                                                     CAT510  
                   DISPLAY 'CAT510: U3016 - ABENDING ON BAD CYCLE NBR'  CAT510  
                   MOVE +3016 TO ABEND-CODE                             CAT510  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT510  
               END-IF                                                   CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
           IF  NSCCMTRL-MULTI-CYCLE-NBR = W-NEXT-CYCLE                  CAT510  
               CONTINUE                                                 CAT510  
           ELSE                                                         CAT510  
               DISPLAY 'CAT510: NSCCMTRL-MULTI-CYCLE-NBR '              CAT510  
                            '(' NSCCMTRL-MULTI-CYCLE-NBR ')'            CAT510  
                            ' NOT = W-NEXT-CYCLE '                      CAT510  
                                '(' W-NEXT-CYCLE ')'                    CAT510  
               IF  L-BYP-CYCLE                                          CAT510  
                   DISPLAY 'CAT510: BYPASSING BAD CYCLE PER JCLPARM'    CAT510  
               ELSE                                                     CAT510  
                   DISPLAY 'CAT510: CHECK CONTENTS OF ALL TODAYS'       CAT510  
                           ' FILES. MAKE SURE THEY ARE IN SEQUENCE'     CAT510  
                   DISPLAY 'CAT510: MAKE SURE THE GDG FILES ARE IN'     CAT510  
                           ' CYCLE SEQUENCE (01,02,03,04,05)'           CAT510  
                   DISPLAY 'CAT510: U3017 - ABENDING ON BAD CYCLE NBR'  CAT510  
                   MOVE +3017 TO ABEND-CODE                             CAT510  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT510  
               END-IF                                                   CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
           IF  NSCCMTRL-VAR-LEN-REC-IND = '*'                           CAT510  
               CONTINUE                                                 CAT510  
           ELSE                                                         CAT510  
               DISPLAY 'CAT510: NSCCMTRL-VAR-LEN-REC-IND '              CAT510  
                            '(' NSCCMTRL-VAR-LEN-REC-IND ')'            CAT510  
                            ' NOT = *'                                  CAT510  
               IF  L-BYP-FILECHK                                        CAT510  
                   DISPLAY 'CAT510: BYPASSING BAD VAR-LEN-REC-IND'      CAT510  
               ELSE                                                     CAT510  
                   DISPLAY 'CAT510: U3018 - ABENDING ON BAD VAR IND'    CAT510  
                   MOVE +3018 TO ABEND-CODE                             CAT510  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT510  
               END-IF                                                   CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
           IF  NSCCMTRL-ITEM-CNT NOT = W-CURR-TOT-CNT                   CAT510  
               DISPLAY 'CAT510: NSCCMTRL-ITEM-CNT '                     CAT510  
                            '(' NSCCMTRL-ITEM-CNT ')'                   CAT510  
                           ' NOT = W-CURR-TOT-CNT '                     CAT510  
                            '(' W-CURR-TOT-CNT ')'                      CAT510  
               IF  L-BYP-FILECHK                                        CAT510  
                   DISPLAY 'CAT510: BYPASSING BAD ITEM COUNT'           CAT510  
               ELSE                                                     CAT510  
                   DISPLAY 'CAT510: U3019 - ABENDING ON BAD ITEM COUNT' CAT510  
                   MOVE +3019 TO ABEND-CODE                             CAT510  
                   PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT            CAT510  
               END-IF                                                   CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
           IF  W-BRK-SW = 'Y'                                           CAT510  
               MOVE W-CURR-TAB           TO W-TAB (TAB-X)               CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
           MOVE 'T'               TO W-HDR-TRL-SW.                      CAT510  
                                                                        CAT510  
       6000-EXIT.                                                       CAT510  
           EXIT.                                                        CAT510  
      /                                                                 CAT510  
       7000-WRITE-OUTPUT  SECTION.                                      CAT510  
                                                                        CAT510  
           MOVE W-REC-LEN-IN             TO W-REC-LEN-OUT.              CAT510  
                                                                        CAT510  
           MOVE NSCCMTRN-RECORD  (1 : W-REC-LEN-IN)  TO                 CAT510  
                OUTFILE-RECORD   (1 : W-REC-LEN-OUT)                    CAT510  
                                                                        CAT510  
           WRITE OUTFILE-RECORD.                                        CAT510  
                                                                        CAT510  
           ADD  1 TO W-OUTFILE-CNT.                                     CAT510  
                                                                        CAT510  
       7000-EXIT.                                                       CAT510  
           EXIT.                                                        CAT510  
      /                                                                 CAT510  
       8000-ABEND-ROUTINE SECTION.                                      CAT510  
                                                                        CAT510  
           DISPLAY ' '                                                  CAT510  
           DISPLAY 'CAT510: INPUT-CNT = ' W-INFILE-CNT                  CAT510  
           DISPLAY 'CAT510: W-CURR-STREAM-CD  = '                       CAT510  
                            W-CURR-STREAM-CD                            CAT510  
           DISPLAY 'CAT510: W-CURR-CLIENT-NBR = '                       CAT510  
                            W-CURR-CLIENT-NBR                           CAT510  
           DISPLAY 'CAT510: W-CURR-BRK-NBR    = '                       CAT510  
                            W-CURR-BRK-NBR                              CAT510  
           DISPLAY 'CAT510: W-CURR-HDR-SW     = '                       CAT510  
                            W-CURR-HDR-SW                               CAT510  
           DISPLAY 'CAT510: W-CURR-HDR-DATE   = '                       CAT510  
                            W-CURR-HDR-DATE                             CAT510  
           DISPLAY 'CAT510: W-CURR-HDR-CYCLE  = '                       CAT510  
                            W-CURR-HDR-CYCLE                            CAT510  
           DISPLAY 'CAT510: W-CURR-TRL-SW     = '                       CAT510  
                            W-CURR-TRL-SW                               CAT510  
           DISPLAY 'CAT510: W-CURR-TRL-DATE   = '                       CAT510  
                            W-CURR-TRL-DATE                             CAT510  
           DISPLAY 'CAT510: W-CURR-TRL-CYCLE  = '                       CAT510  
                            W-CURR-TRL-CYCLE                            CAT510  
           DISPLAY 'CAT510: W-CURR-ITEM-CNT   = '                       CAT510  
                            W-CURR-ITEM-CNT                             CAT510  
           DISPLAY 'CAT510: W-CURR-TOT-CNT    = '                       CAT510  
                            W-CURR-TOT-CNT                              CAT510  
                                                                        CAT510  
           CALL ABEND USING ABEND-CODE.                                 CAT510  
                                                                        CAT510  
       8000-EXIT.                                                       CAT510  
           EXIT.                                                        CAT510  
      /                                                                 CAT510  
       8500-UPDATE-LOG-HDR SECTION.                                     CAT510  
                                                                        CAT510  
           DISPLAY ' '.                                                 CAT510  
           ACCEPT W-SYS-DATE              FROM DATE.                    CAT510  
           ACCEPT W-SYS-TIME              FROM TIME.                    CAT510  
           DISPLAY 'CAT510: SYS-DATE ' W-SYS-DATE                       CAT510  
                          ' SYS-TIME ' W-SYS-TIME.                      CAT510  
                                                                        CAT510  
           INITIALIZE                       W-LOG-RECORD                CAT510  
           MOVE BPD-PROC-DATE            TO W-LOG-PROC-DATE             CAT510  
           MOVE W-NEXT-CYCLE             TO W-LOG-CYCLE-NBR             CAT510  
           MOVE 'CAT510'                 TO W-LOG-PGM-NAME              CAT510  
           MOVE W-UPD-DATE               TO W-LOG-SYS-DATE              CAT510  
           MOVE W-UPD-TIME               TO W-LOG-SYS-TIME              CAT510  
           MOVE W-HDR-RECORD             TO W-LOG-NSCC-HDR              CAT510  
           MOVE W-TRL-ITEM-CNT           TO W-LOG-NSCC-CNT              CAT510  
           MOVE W-INFILE-CNT             TO W-LOG-TOT-REC-CNT           CAT510  
                                                                        CAT510  
           WRITE OUTLOG-RECORD FROM W-LOG-RECORD                        CAT510  
                                                                        CAT510  
           IF  OUTLOG-OKAY                                              CAT510  
               DISPLAY 'CAT510: OUTLOG HEADER RECORD WRITTEN'           CAT510  
           ELSE                                                         CAT510  
                  DISPLAY ' '                                           CAT510  
                  DISPLAY 'CAT510: U3020 - OUTLOG VSAM WRITE ERROR '    CAT510  
                         ' FILE STATUS = ' OUTLOG-STAT                  CAT510  
                  DISPLAY 'CAT510: WRITE KEY = W-LOG-KEY = '            CAT510  
                                               W-LOG-KEY                CAT510  
                  DISPLAY 'CAT510: U3020 - ABENDING ON WRITE ERROR '    CAT510  
                  MOVE +3020    TO ABEND-CODE                           CAT510  
                  CALL ABEND USING ABEND-CODE                           CAT510  
           END-IF.                                                      CAT510  
                                                                        CAT510  
           DISPLAY 'CAT510: THIS-PROC-DATE   = '                        CAT510  
                                           W-LOG-PROC-DATE              CAT510  
           DISPLAY 'CAT510: THIS-CYCLE-NBR   = '                        CAT510  
                                           W-LOG-CYCLE-NBR              CAT510  
           DISPLAY 'CAT510: THIS-REC-CNT     = '                        CAT510  
                                           W-LOG-TOT-REC-CNT            CAT510  
           DISPLAY ' '.                                                 CAT510  
                                                                        CAT510  
       8500-EXIT.                                                       CAT510  
           EXIT.                                                        CAT510  
      /                                                                 CAT510  
       9000-CLOSE-ROUTINE SECTION.                                      CAT510  
                                                                        CAT510  
           DISPLAY 'CAT510: W-TABLE = '                                 CAT510  
           PERFORM VARYING TAB-X FROM 1 BY 1 UNTIL TAB-X > 100          CAT510  
                   IF  W-TAB-STREAM-CD (TAB-X) > SPACES                 CAT510  
                       DISPLAY                                          CAT510  
                       ' STR='      W-TAB-STREAM-CD  (TAB-X)            CAT510  
                       ' CLT='      W-TAB-CLIENT-NBR (TAB-X)            CAT510  
                       ' BRK='      W-TAB-BRK-NBR    (TAB-X)            CAT510  
                       ' HDR='      W-TAB-HDR-SW     (TAB-X)            CAT510  
                                    W-TAB-HDR-DATE   (TAB-X)            CAT510  
                                    W-TAB-HDR-CYCLE  (TAB-X)            CAT510  
                       ' TRL='      W-TAB-TRL-SW     (TAB-X)            CAT510  
                                    W-TAB-TRL-DATE   (TAB-X)            CAT510  
                                    W-TAB-TRL-CYCLE  (TAB-X)            CAT510  
                       ' CNT='      W-TAB-ITEM-CNT   (TAB-X)            CAT510  
                       ' TOT='      W-TAB-TOT-CNT    (TAB-X)            CAT510  
                   END-IF                                               CAT510  
           END-PERFORM.                                                 CAT510  
                                                                        CAT510  
           DISPLAY ' '.                                                 CAT510  
           CLOSE INFILE                                                 CAT510  
           DISPLAY 'CAT510: INFILE   CLOSED. STATUS = '                 CAT510  
                                             INFILE-STAT.               CAT510  
           CLOSE INLOG.                                                 CAT510  
           DISPLAY 'CAT510: INLOG    CLOSED. STATUS = '                 CAT510  
                                             INLOG-STAT.                CAT510  
           CLOSE OUTFILE.                                               CAT510  
           DISPLAY 'CAT510: OUTFILE  CLOSED. STATUS = '                 CAT510  
                                             OUTFILE-STAT.              CAT510  
           CLOSE OUTLOG.                                                CAT510  
           DISPLAY 'CAT510: OUTLOG   CLOSED. STATUS = '                 CAT510  
                                             OUTLOG-STAT.               CAT510  
                                                                        CAT510  
           DISPLAY 'CAT510: INFILE   COUNT = ' W-INFILE-CNT             CAT510  
           DISPLAY 'CAT510: OUTFILE  COUNT = ' W-OUTFILE-CNT            CAT510  
           DISPLAY ' '.                                                 CAT510  
ET0001     DISPLAY 'CAT510: P.WEBBER COUNT = ' W-PAINE-WEBBER-CNT       CAT510  
ET0001     DISPLAY ' '.                                                 CAT510  
LRM005     IF W-INFILE-CNT < 100                                                
LRM005        DISPLAY 'CAT510: SIAC 716 TRANS FILE HAS LESS 100 RECS'           
LRM005        DISPLAY '   INPUT-CNT = ' W-INFILE-CNT                            
LRM005        IF L-BYP-REC-CNT                                                  
LRM005           DISPLAY 'CAT510 BYPASS ABEND DUE TO PARM'                      
LRM005        ELSE                                                              
LRM005           MOVE 12 TO RETURN-CODE                                         
LRM005          DISPLAY 'CAT510 ISSUES RETURN CODE 12'                          
LRM005          DISPLAY '*--------------------------------------------*'        
LRM005          DISPLAY 'PLEASE ALERT HELP DESK THAT ACATS INBOUND     '        
LRM005          DISPLAY 'CYCLE FILE BZZZ.SIAC0716.ACAT.TRAN(0) HAS VERY'        
LRM005          DISPLAY 'FEW RECORDS, AND TO INVESTIGATE THE CAUSE.    '        
LRM005          DISPLAY 'IF FILE IS DETERMINED TO BE CORRECT, THIS MAY 'CAT580  
LRM005          DISPLAY 'BE FORCE COMPLETED, ALL PROCESSING WAS DONE.  'CAT580  
LRM005          DISPLAY '*--------------------------------------------*'        
LRM005        END-IF                                                            
LRM005     END-IF.                                                              
           DISPLAY 'CAT510: PROGRAM ENDED SUCCESSFULLY'.                CAT510  
                                                                        CAT510  
       9000-EXIT.                                                       CAT510  
           EXIT.                                                        CAT510  
      *################################################################ CAT510  
