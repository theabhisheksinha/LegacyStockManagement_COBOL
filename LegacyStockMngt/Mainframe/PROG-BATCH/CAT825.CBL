000001* PDX    - CAT825   C0361186 12/26/14 11:58:44 TBLAMUR            00001000
LRM004* SSR 103323 PASS PAPER STATEMENT FEE TO ASCENDIS RECOMPILE.              
000001* PDX    - CAT825   C0335509 02/15/13 12:58:03 TBLAMUR            00001000
LRM003* SSR 88349 CHANGE OUTBOUND NSCC AT RECORD LENGTH TO FIXED                
LRM003*  2,000 BYTES AND MOVE CURRENCY NUMBER INTO FILLER AT BYTE 1973.         
000001* PDX    - CAT825   C0328075 08/17/12 09:07:16 TBLAMUR            00001000
LRM002* SSR 83475 RECOMPILE ONLY DUE TO CHANGES IN COPY CATEXCP AND             
LRM002*  COPY CLIENT RECORDS FROM CAT519/CAT810 EXCP FILE TO OEXCP.             
000001* PDX    - CAT825   C0317345 11/15/11 09:31:36 TBLAMUR            00001000
LRM001* SSR 79096, 80728 RECOMPILE ONLY DUE TO CHANGES IN COPY                  
LRM001*     CATMATH, CATWHLD, CATEXCP                                           
000001* PDX    - CAT825   C0291396 01/26/10 14:23:32 TBLAMUR            00001000
000001* PDX    - CAT825   C0260091 07/07/08 11:41:15 TBDOJUN            00001000
      ***************************************************************** CAT825  
      * CAT825 - ACATS ASCENDIS(WORKFLOW) FILE SPLIT PROGRAM          * CAT825  
      *                                                               * CAT825  
      * PROGRAM WILL SPLIT FILES BY CLIENT NUMBER (4 BYTES)           * CAT825  
      * OR NSCC CLEARING NUMBER TO SEND TO ASCENDIS.                  * CAT825  
      * OUTPUT A HEADER RECORD.                                       * CAT825  
      * OUTPUT A TRAILER RECORD WITH RECORD COUNT.                    * CAT825  
      *                                                               * CAT825  
      * USE THE W-CYCLE-NBR IN THE RETURN-CODE TO TRIGGER FTP JOBS    * CAT825  
      *                                                               * CAT825  
      * INPUT  - B***.CAT519.WHLD           - BASED ON CLIENT NBR     * CAT825  
LRM002*        - B***.CAT519.EXCP           - BASED ON CLIENT NBR     * CAT825  
      *        - B***.CAT525.EXCP           - BASED ON CLIENT NBR     * CAT825  
      *        - B***.CAT821.ID.MATH        - BASED ON CLIENT NBR     * CAT825  
      *        - B***.CAT810.WHLD           - BASED ON CLIENT NBR     * CAT825  
      *        - B***.CAT821.MATH           - BASED ON CLIENT NBR     * CAT825  
      *        - B***.CAT825.EXCP           - BASED ON CLIENT NBR     * CAT825  
      *        - B***.CAT500A.NSCC          - BASED ON CLEARING NBR   * CAT825  
      *                                                               * CAT825  
      * OUTPUT - THE SUFFIX C999 IS THE CLIENT NBR (3 BYTES)          * CAT825  
      *        - B***.CAT525.WHLD.C999      - BASED ON CLIENT NBR     * CAT825  
      *        - B***.CAT525.EXCP.C999      - BASED ON CLIENT NBR     * CAT825  
      *        - B***.CAT525.MATH.C999      - BASED ON CLIENT NBR     * CAT825  
      *        - B***.CAT825.WHLD.C999      - BASED ON CLIENT NBR     * CAT825  
      *        - B***.CAT825.MATH.C999      - BASED ON CLIENT NBR     * CAT825  
      *        - B***.CAT825.EXCP.C999      - BASED ON CLIENT NBR     * CAT825  
      *        - B***.CAT500A.NSCC.C999     - BASED ON CLEARING NBR   * CAT825  
      *                                                               * CAT825  
      * THE NSCC FILE IS THE NSCC-INPUT LAYOUT. VARIABLE LENGTH       * CAT825  
      *                                                               * CAT825  
      ***************************************************************** CAT825  
      * 04/24/08 DJ SSR#XXXXX NEW PROGRAM                             * CAT825  
      * 01/26/10 LM SSR#69400 RECOPILE ONLY FOR NEW COPYBOOK CATEXCP  * CAT825  
      ***************************************************************** CAT825  
       IDENTIFICATION DIVISION.                                         CAT825  
       PROGRAM-ID.  CAT825.                                             CAT825  
                                                                        CAT825  
       ENVIRONMENT DIVISION.                                            CAT825  
       INPUT-OUTPUT SECTION.                                            CAT825  
       FILE-CONTROL.                                                    CAT825  
                                                                        CAT825  
           SELECT INEXCP           ASSIGN       TO INEXCP               CAT825  
                                   FILE STATUS  IS INEXCP-STAT.         CAT825  
LRM002     SELECT INEXCP2          ASSIGN       TO INEXCP2              CAT825  
LRM002                             FILE STATUS  IS INEXCP2-STAT.        CAT825  
           SELECT INWHLD           ASSIGN       TO INWHLD               CAT825  
                                   FILE STATUS  IS INWHLD-STAT.         CAT825  
           SELECT INMATH           ASSIGN       TO INMATH               CAT825  
                                   FILE STATUS  IS INMATH-STAT.         CAT825  
           SELECT INNSCC           ASSIGN       TO INNSCC               CAT825  
                                   FILE STATUS  IS INNSCC-STAT.         CAT825  
                                                                        CAT825  
           SELECT OTEXCP           ASSIGN       TO OTEXCP               CAT825  
                                   FILE STATUS  IS OTEXCP-STAT.         CAT825  
           SELECT OTWHLD           ASSIGN       TO OTWHLD               CAT825  
                                   FILE STATUS  IS OTWHLD-STAT.         CAT825  
           SELECT OTMATH           ASSIGN       TO OTMATH               CAT825  
                                   FILE STATUS  IS OTMATH-STAT.         CAT825  
           SELECT OTNSCC           ASSIGN       TO OTNSCC               CAT825  
                                   FILE STATUS  IS OTNSCC-STAT.         CAT825  
      /                                                                 CAT825  
       DATA DIVISION.                                                   CAT825  
       FILE SECTION.                                                    CAT825  
       FD  INEXCP                                                       CAT825  
           RECORDING MODE IS F                                          CAT825  
           BLOCK CONTAINS 0 RECORDS.                                    CAT825  
                                                                        CAT825  
           COPY CATEXCP REPLACING ==:CATEXCP:== BY ==INEXCP==.          CAT825  
                                                                        CAT825  
LRM002 FD  INEXCP2                                                      CAT825  
LRM002     RECORDING MODE IS F                                          CAT825  
LRM002     BLOCK CONTAINS 0 RECORDS.                                    CAT825  
LRM002                                                                  CAT825  
LRM002     COPY CATEXCP REPLACING ==:CATEXCP:== BY ==INEXCP2==.         CAT825  
                                                                        CAT825  
       FD  INWHLD                                                       CAT825  
           RECORDING MODE IS F                                          CAT825  
           BLOCK CONTAINS 0 RECORDS.                                    CAT825  
                                                                        CAT825  
           COPY CATWHLD REPLACING ==:CATWHLD:== BY ==INWHLD==.          CAT825  
                                                                        CAT825  
       FD  INMATH                                                       CAT825  
           RECORDING MODE IS F                                          CAT825  
           BLOCK CONTAINS 0 RECORDS.                                    CAT825  
                                                                        CAT825  
           COPY CATMATH REPLACING ==:CATMATH:== BY ==INMATH==.          CAT825  
                                                                        CAT825  
       FD  INNSCC                                                       CAT825  
           RECORDING MODE IS V                                          CAT825  
           RECORD IS VARYING IN SIZE FROM 80 TO 2991 CHARACTERS         CAT825  
              DEPENDING ON W-REC-LEN-IN                                 CAT825  
           BLOCK CONTAINS 0 RECORDS.                                    CAT825  
                                                                        CAT825  
       01  INNSCC-REC                             PIC  X(2991).         CAT825  
                                                                        CAT825  
       01  INNSCC-AT-MF-REC.                                            CAT825  
           05  INNSCC-AT-BASIC2                   PIC  X(431).          CAT825  
           05  INNSCC-AT-MF                       PIC  X(119).          CAT825  
                                                                        CAT825  
       01  INNSCC-AT-OPTN-REC.                                          CAT825  
           05  INNSCC-AT-BASIC1                   PIC  X(431).          CAT825  
           05  INNSCC-AT-OPTN                     PIC  X(066).          CAT825  
                                                                        CAT825  
       01  INNSCC-AT-REC                          PIC  X(431).          CAT825  
                                                                        CAT825  
       01  INNSCC-TI-REC                          PIC  X(356).          CAT825  
                                                                        CAT825  
       01  INNSCC-HEADER-TRAILER                  PIC  X(080).          CAT825  
                                                                        CAT825  
       FD  OTEXCP                                                       CAT825  
           RECORDING MODE IS F                                          CAT825  
           BLOCK CONTAINS 0 RECORDS.                                    CAT825  
                                                                        CAT825  
           COPY CATEXCP REPLACING ==:CATEXCP:== BY ==OTEXCP==.          CAT825  
                                                                        CAT825  
       FD  OTWHLD                                                       CAT825  
           RECORDING MODE IS F                                          CAT825  
           BLOCK CONTAINS 0 RECORDS.                                    CAT825  
                                                                        CAT825  
           COPY CATWHLD REPLACING ==:CATWHLD:== BY ==OTWHLD==.          CAT825  
                                                                        CAT825  
       FD  OTMATH                                                       CAT825  
           RECORDING MODE IS F                                          CAT825  
           BLOCK CONTAINS 0 RECORDS.                                    CAT825  
                                                                        CAT825  
           COPY CATMATH REPLACING ==:CATMATH:== BY ==OTMATH==.          CAT825  
                                                                        CAT825  
       FD  OTNSCC                                                       CAT825  
           RECORDING MODE IS V                                          CAT825  
           RECORD IS VARYING IN SIZE FROM 80 TO 2991 CHARACTERS         CAT825  
LRM003        DEPENDING ON W-REC-LEN-OUT                                CAT825  
           BLOCK CONTAINS 0 RECORDS.                                    CAT825  
                                                                        CAT825  
       01  OTNSCC-REC                             PIC  X(2991).         CAT825  
                                                                        CAT825  
       01  OTNSCC-AT-MF-REC.                                            CAT825  
           05  OTNSCC-AT-BASIC2                   PIC  X(431).          CAT825  
           05  OTNSCC-AT-MF                       PIC  X(119).          CAT825  
                                                                        CAT825  
       01  OTNSCC-AT-OPTN-REC.                                          CAT825  
           05  OTNSCC-AT-BASIC1                   PIC  X(431).          CAT825  
           05  OTNSCC-AT-OPTN                     PIC  X(066).          CAT825  
                                                                        CAT825  
LRM003 01  OTNSCC-AT-REC-EXP                      PIC  X(2000).         CAT825  
       01  OTNSCC-AT-REC                          PIC  X(431).          CAT825  
                                                                        CAT825  
       01  OTNSCC-TI-REC                          PIC  X(356).          CAT825  
                                                                        CAT825  
       01  OTNSCC-HEADER-TRAILER                  PIC  X(080).          CAT825  
                                                                        CAT825  
      /                                                                 CAT825  
       WORKING-STORAGE SECTION.                                         CAT825  
           COPY PDXIDCOB.                                               CAT825  
                                                                        CAT825  
       01  W-FIELDS.                                                    CAT825  
           05  W-PGM-NAME                PIC  X(008) VALUE 'CAT825'.    CAT825  
           05  W-FIRST-TIME-SW           PIC  X(001) VALUE '0'.         CAT825  
               88 NOT-FIRST-TIME                     VALUE '1'.         CAT825  
           05  END-OF-INEXCP-SW          PIC  X(001) VALUE '0'.         CAT825  
               88 END-OF-INEXCP                      VALUE '1'.         CAT825  
LRM002     05  END-OF-INEXCP2-SW         PIC  X(001) VALUE '0'.         CAT825  
LRM002         88 END-OF-INEXCP2                     VALUE '1'.         CAT825  
           05  END-OF-INWHLD-SW          PIC  X(001) VALUE '0'.         CAT825  
               88 END-OF-INWHLD                      VALUE '1'.         CAT825  
           05  END-OF-INMATH-SW          PIC  X(001) VALUE '0'.         CAT825  
               88 END-OF-INMATH                      VALUE '1'.         CAT825  
           05  END-OF-INNSCC-SW          PIC  X(001) VALUE '0'.         CAT825  
               88 END-OF-INNSCC                      VALUE '1'.         CAT825  
           05  INEXCP-STAT               PIC  X(002).                   CAT825  
               88 INEXCP-OKAY            VALUE '00' THRU '09', '97'.    CAT825  
               88 INEXCP-END-OF-FILE     VALUE '10'.                    CAT825  
               88 INEXCP-EMPTY-MISSING VALUE '35'.                      CAT825  
LRM002     05  INEXCP2-STAT              PIC  X(002).                   CAT825  
LRM002         88 INEXCP2-OKAY           VALUE '00' THRU '09', '97'.    CAT825  
LRM002         88 INEXCP2-END-OF-FILE    VALUE '10'.                    CAT825  
LRM002         88 INEXCP2-EMPTY-MISSING VALUE '35'.                     CAT825  
           05  INWHLD-STAT               PIC  X(002).                   CAT825  
               88 INWHLD-OKAY            VALUE '00' THRU '09', '97'.    CAT825  
               88 INWHLD-END-OF-FILE     VALUE '10'.                    CAT825  
               88 INWHLD-EMPTY-MISSING VALUE '35'.                      CAT825  
           05  INMATH-STAT               PIC  X(002).                   CAT825  
               88 INMATH-OKAY            VALUE '00' THRU '09', '97'.    CAT825  
               88 INMATH-END-OF-FILE     VALUE '10'.                    CAT825  
               88 INMATH-EMPTY-MISSING VALUE '35'.                      CAT825  
           05  INNSCC-STAT               PIC  X(002).                   CAT825  
               88 INNSCC-OKAY            VALUE '00' THRU '09', '97'.    CAT825  
               88 INNSCC-END-OF-FILE     VALUE '10'.                    CAT825  
               88 INNSCC-EMPTY-MISSING VALUE '35'.                      CAT825  
           05  OTEXCP-STAT               PIC  X(002).                   CAT825  
               88 OTEXCP-OKAY            VALUE '00' THRU '09', '97'.    CAT825  
               88 OTEXCP-EMPTY-MISSING VALUE '35'.                      CAT825  
           05  OTWHLD-STAT               PIC  X(002).                   CAT825  
               88 OTWHLD-OKAY            VALUE '00' THRU '09', '97'.    CAT825  
               88 OTWHLD-EMPTY-MISSING VALUE '35'.                      CAT825  
           05  OTMATH-STAT               PIC  X(002).                   CAT825  
               88 OTMATH-OKAY            VALUE '00' THRU '09', '97'.    CAT825  
               88 OTMATH-EMPTY-MISSING VALUE '35'.                      CAT825  
           05  OTNSCC-STAT               PIC  X(002).                   CAT825  
               88 OTNSCC-OKAY            VALUE '00' THRU '09', '97'.    CAT825  
               88 OTNSCC-EMPTY-MISSING VALUE '35'.                      CAT825  
           05  W-INEXCP-CNT              PIC  9(011) COMP-3 VALUE 0.    CAT825  
LRM002     05  W-INEXCP2-CNT             PIC  9(011) COMP-3 VALUE 0.    CAT825  
           05  W-OTEXCP-CNT              PIC  9(011) COMP-3 VALUE 0.    CAT825  
           05  W-INWHLD-CNT              PIC  9(011) COMP-3 VALUE 0.    CAT825  
           05  W-OTWHLD-CNT              PIC  9(011) COMP-3 VALUE 0.    CAT825  
           05  W-INMATH-CNT              PIC  9(011) COMP-3 VALUE 0.    CAT825  
           05  W-OTMATH-CNT              PIC  9(011) COMP-3 VALUE 0.    CAT825  
           05  W-INNSCC-CNT              PIC  9(011) COMP-3 VALUE 0.    CAT825  
           05  W-OTNSCC-CNT              PIC  9(011) COMP-3 VALUE 0.    CAT825  
           05  W-REC-LEN-IN              PIC  9(005) COMP-3 VALUE 0.    CAT825  
           05  W-REC-LEN-OUT             PIC  9(005) COMP-3 VALUE 0.    CAT825  
           05  W-CYCLE-NBR               PIC  9(002)        VALUE 0.    CAT825  
           05  LD-PROC-DATE.                                            CAT825  
               10 LD-PROC-DATE-MM        PIC  X(002).                   CAT825  
               10 LD-PROC-DATE-DD        PIC  X(002).                   CAT825  
               10 LD-PROC-DATE-YY        PIC  X(002).                   CAT825  
      /                                                                 CAT825  
      ******************************************************************CAT825  
      * ASCENDIS VERSION NSCC INPUT (GOING TO NSCC) RECORD LAYOUTS     *CAT825  
      ******************************************************************CAT825  
           COPY NSCCDHDR.                                               CAT825  
                                                                        CAT825  
           COPY NSCCDTRL.                                               CAT825  
                                                                        CAT825  
           COPY NSCCDTIA.                                               CAT825  
                                                                        CAT825  
           COPY NSCCDATA.                                               CAT825  
                                                                        CAT825  
           COPY NSCCDFRA.                                               CAT825  
      /                                                                 CAT825  
      ******************************************************************CAT825  
      * P2 HEADER  RECORD LAYOUT                                       *CAT825  
      ******************************************************************CAT825  
       01  HEADER-RECORD.                                               CAT825  
           05  H-DATE-LIT              PIC X(5)   VALUE 'DATE='.        CAT825  
           05  H-PROD-DATE             PIC X(6).                        CAT825  
           05  H-SYSTEM-DATE.                                           CAT825  
               10  H-SYSTEM-MONTH      PIC X(2).                        CAT825  
               10  H-SYSTEM-DAY        PIC X(2).                        CAT825  
               10  H-SYSTEM-YEAR       PIC X(2).                        CAT825  
           05  H-SYSTEM-TIME           PIC X(6).                        CAT825  
           05  FILLER                  PIC X(3)   VALUE SPACES.         CAT825  
           05  H-DATA-SET-NAME         PIC X(17).                       CAT825  
           05  H-PROGRAM-ID            PIC X(8).                        CAT825  
           05  H-CLIENT-NUMBER         PIC 9(3).                        CAT825  
           05  FILLER                  PIC X(26)  VALUE SPACES.         CAT825  
                                                                        CAT825  
      ******************************************************************CAT825  
      * P2 TRAILER RECORD LAYOUT                                       *CAT825  
      ******************************************************************CAT825  
       01  TRAILER-RECORD.                                              CAT825  
           05  T-REC-CNT-LIT           PIC X(8)   VALUE 'REC-CNT='.     CAT825  
           05  T-RECORD-COUNT          PIC 9(11).                       CAT825  
           05  T-PROD-DATE             PIC X(6).                        CAT825  
           05  T-SYSTEM-DATE           PIC X(6).                        CAT825  
           05  T-SYSTEM-TIME           PIC X(6).                        CAT825  
           05  T-PROGRAM-ID            PIC X(8).                        CAT825  
           05  T-CLIENT-NUMBER         PIC 9(3).                        CAT825  
           05  FILLER                  PIC X(32)  VALUE SPACES.         CAT825  
      /                                                                 CAT825  
      ******************************************************************CAT825  
      * P2HDTR  COPYBOOK                                               *CAT825  
      ******************************************************************CAT825  
       01  FILLER                        PIC X(008) VALUE 'CP2WS   '.   CAT825  
       01  W-HDR-TRL-LEN                     PIC 9(005) VALUE 120.      CAT825  
                                                                        CAT825  
           COPY CP2WS.                                                  CAT825  
      /                                                                 CAT825  
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.   CAT825  
                                                                        CAT825  
           COPY BPDATESC.                                               CAT825  
      /                                                                 CAT825  
      ***===> COBOL LE                                                  CAT825  
       01  W-ABEND-AREA.                                                CAT825  
           05  ABEND-CODE                PIC S9(04) COMP SYNC.          CAT825  
       01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.   CAT825  
           COPY STUBCPY.                                                CAT825  
      ***<=== COBOL LE                                                  CAT825  
       01  FILLER                        PIC X(008) VALUE 'END-O-WS'.   CAT825  
      /                                                                 CAT825  
      ***************************************************************** CAT825  
      *    LINKAGE SECTION                                            * CAT825  
      ***************************************************************** CAT825  
       LINKAGE SECTION.                                                 CAT825  
       01  L-JCL-PARMS.                                                 CAT825  
           05  PARMLENGTH                PIC S9(004) COMP SYNC.         CAT825  
           05  L-CLIENT-NBR              PIC  X(004).                   CAT825  
           05  L-CLEARING-NBR            PIC  X(004).                   CAT825  
           05  L-JOBNAME                 PIC  X(008).                   CAT825  
           05  L-BYP-DATECHK-SW          PIC  X(001).                   CAT825  
               88  L-BYP-DATECHK                     VALUE '1'.         CAT825  
           05  L-BYP-FILECHK-SW          PIC  X(001).                   CAT825  
               88  L-BYP-FILECHK                     VALUE '1'.         CAT825  
                                                                        CAT825  
       PROCEDURE DIVISION USING L-JCL-PARMS.                            CAT825  
      *                         ===========                             CAT825  
       0000-MAIN SECTION.                                               CAT825  
           DISPLAY 'CAT825 - ASCENDIS FILE SPLIT PROGRAM'               CAT825  
           DISPLAY '         SPLIT FILE BY CLIENT OR CLEARING NUMBER'   CAT825  
           DISPLAY ' '.                                                 CAT825  
           COPY MSGCOBO.                                                CAT825  
           DISPLAY ' '.                                                 CAT825  
                                                                        CAT825  
           PERFORM 1000-INIT           THRU 1000-EXIT.                  CAT825  
                                                                        CAT825  
           IF  INEXCP-OKAY                                              CAT825  
               PERFORM 2000-PROCESS-EXCP THRU 2000-EXIT                 CAT825  
           END-IF                                                       CAT825  
                                                                        CAT825  
LRM002     IF INEXCP2-OKAY                                              CAT825  
LRM002     AND NOT END-OF-INEXCP2                                       CAT825  
LRM002        PERFORM 2200-PROCESS-EXCP2 THRU 2200-EXIT                 CAT825  
LRM002     END-IF                                                       CAT825  
                                                                                
           IF  INWHLD-OKAY                                              CAT825  
               PERFORM 3000-PROCESS-WHLD THRU 3000-EXIT                 CAT825  
           END-IF                                                       CAT825  
                                                                        CAT825  
           IF  INMATH-OKAY                                              CAT825  
               PERFORM 4000-PROCESS-MATH THRU 4000-EXIT                 CAT825  
           END-IF                                                       CAT825  
                                                                        CAT825  
           IF  INNSCC-OKAY                                              CAT825  
               PERFORM 5000-PROCESS-NSCC THRU 5000-EXIT                 CAT825  
           END-IF                                                       CAT825  
                                                                        CAT825  
           PERFORM 9000-CLOSE-ROUTINE  THRU 9000-EXIT.                  CAT825  
                                                                        CAT825  
      **USE THE W-CYCLE-NBR IN THE RETURN-CODE TO TRIGGER FTP JOBS      CAT825  
           MOVE W-CYCLE-NBR TO RETURN-CODE.                             CAT825  
                                                                        CAT825  
           GOBACK.                                                      CAT825  
      /                                                                 CAT825  
       1000-INIT SECTION.                                               CAT825  
                                                                        CAT825  
           DISPLAY ' '.                                                 CAT825  
           DISPLAY 'CAT825: L-CLIENT-NBR     = '                        CAT825  
                            L-CLIENT-NBR                                CAT825  
           DISPLAY 'CAT825: L-CLEARING-NBR   = '                        CAT825  
                            L-CLEARING-NBR                              CAT825  
           DISPLAY 'CAT825: L-JOBNAME        = '                        CAT825  
                            L-JOBNAME                                   CAT825  
           DISPLAY 'CAT825: L-BYP-DATECHK-SW = '                        CAT825  
                            L-BYP-DATECHK-SW                            CAT825  
                   ' (1=BYPASS DATE CHECK)'                             CAT825  
           DISPLAY 'CAT825: L-BYP-FILECHK-SW = '                        CAT825  
                            L-BYP-FILECHK-SW                            CAT825  
                   ' (1=BYPASS FILE CHECK)'                             CAT825  
           IF  L-BYP-DATECHK                                            CAT825  
               DISPLAY 'CAT825: DATE CHECK WILL BE BYPASSED'            CAT825  
           ELSE                                                         CAT825  
               DISPLAY 'CAT825: DATE CHECK WILL BE PERFORMED'           CAT825  
           END-IF.                                                      CAT825  
           IF  L-BYP-FILECHK                                            CAT825  
               DISPLAY 'CAT825: FILE CHECK WILL BE BYPASSED'            CAT825  
           ELSE                                                         CAT825  
               DISPLAY 'CAT825: FILE CHECK WILL BE PERFORMED'           CAT825  
           END-IF.                                                      CAT825  
                                                                        CAT825  
           MOVE 'CAT511'                  TO BPDATES-CALLING-PGM.       CAT825  
           SET  LNKDATZ-REQUEST           TO TRUE.                      CAT825  
           CALL BPDATES USING BPDATES-PARAMETERS.                       CAT825  
           MOVE BPD-PROC-DATE(3:2)        TO LD-PROC-DATE-YY.           CAT825  
           MOVE BPD-PROC-DATE(5:2)        TO LD-PROC-DATE-MM.           CAT825  
           MOVE BPD-PROC-DATE(7:2)        TO LD-PROC-DATE-DD.           CAT825  
                                                                        CAT825  
           DISPLAY ' '.                                                 CAT825  
           DISPLAY 'CAT511:       BPD-PROC-DATE= ' BPD-PROC-DATE        CAT825  
                                '  LD-PROC-DATE= ' LD-PROC-DATE.        CAT825  
           DISPLAY ' '.                                                 CAT825  
                                                                        CAT825  
           OPEN INPUT INEXCP.                                           CAT825  
           DISPLAY 'CAT825: INEXCP   OPENED FOR INPUT.  STATUS = '      CAT825  
                                               INEXCP-STAT.             CAT825  
           IF  INEXCP-OKAY                                              CAT825  
               CONTINUE                                                 CAT825  
           ELSE                                                         CAT825  
               DISPLAY 'CAT825: ERROR OPENING INEXCP'                   CAT825  
               DISPLAY 'CAT825: OPEN STATUS = ' INEXCP-STAT             CAT825  
                            '.  INPUT-CNT = ' W-INEXCP-CNT              CAT825  
               IF L-BYP-FILECHK                                         CAT825  
                  CONTINUE                                              CAT825  
               ELSE                                                     CAT825  
                  DISPLAY 'CAT825: U3001 - ABENDING ON BAD FILE STATUS' CAT825  
                  MOVE +3001    TO ABEND-CODE                           CAT825  
                  CALL ABEND USING ABEND-CODE                           CAT825  
               END-IF                                                   CAT825  
           END-IF.                                                      CAT825  
                                                                        CAT825  
LRM002     OPEN INPUT INEXCP2.                                          CAT825  
LRM002     DISPLAY 'CAT825: INEXCP2  OPENED FOR INPUT.  STATUS = '      CAT825  
LRM002                                         INEXCP2-STAT.            CAT825  
LRM002     IF  INEXCP2-OKAY                                             CAT825  
LRM002         CONTINUE                                                 CAT825  
LRM002     ELSE                                                         CAT825  
LRM002         DISPLAY 'CAT825: ERROR OPENING INEXCP2'                  CAT825  
LRM002         DISPLAY 'CAT825: OPEN STATUS = ' INEXCP2-STAT            CAT825  
LRM002                      '.  INPUT-CNT = ' W-INEXCP2-CNT             CAT825  
LRM002         IF L-BYP-FILECHK                                         CAT825  
LRM002            CONTINUE                                              CAT825  
LRM002         ELSE                                                     CAT825  
LRM002            DISPLAY 'CAT825: U3005 - ABENDING ON BAD FILE STATUS' CAT825  
LRM002            MOVE +3005    TO ABEND-CODE                           CAT825  
LRM002            CALL ABEND USING ABEND-CODE                           CAT825  
LRM002         END-IF                                                   CAT825  
LRM002     END-IF.                                                      CAT825  
                                                                        CAT825  
           OPEN INPUT INWHLD.                                           CAT825  
           DISPLAY 'CAT825: INWHLD   OPENED FOR INPUT.  STATUS = '      CAT825  
                                               INWHLD-STAT.             CAT825  
           IF  INWHLD-OKAY                                              CAT825  
               CONTINUE                                                 CAT825  
           ELSE                                                         CAT825  
               DISPLAY 'CAT825: ERROR OPENING INWHLD'                   CAT825  
               DISPLAY 'CAT825: OPEN STATUS = ' INWHLD-STAT             CAT825  
                            '.  INPUT-CNT = ' W-INWHLD-CNT              CAT825  
               IF L-BYP-FILECHK                                         CAT825  
                  CONTINUE                                              CAT825  
               ELSE                                                     CAT825  
                  DISPLAY 'CAT825: U3001 - ABENDING ON BAD FILE STATUS' CAT825  
                  MOVE +3001    TO ABEND-CODE                           CAT825  
                  CALL ABEND USING ABEND-CODE                           CAT825  
               END-IF                                                   CAT825  
           END-IF.                                                      CAT825  
                                                                        CAT825  
           OPEN INPUT INMATH.                                           CAT825  
           DISPLAY 'CAT825: INMATH   OPENED FOR INPUT.  STATUS = '      CAT825  
                                               INMATH-STAT.             CAT825  
           IF  INMATH-OKAY                                              CAT825  
               CONTINUE                                                 CAT825  
           ELSE                                                         CAT825  
               IF L-BYP-FILECHK                                         CAT825  
                  CONTINUE                                              CAT825  
               ELSE                                                     CAT825  
                  DISPLAY 'CAT825: U3001 - ABENDING ON BAD FILE STATUS' CAT825  
                  MOVE +3001    TO ABEND-CODE                           CAT825  
                  CALL ABEND USING ABEND-CODE                           CAT825  
               END-IF                                                   CAT825  
           END-IF.                                                      CAT825  
           OPEN INPUT INNSCC.                                           CAT825  
           DISPLAY 'CAT825: INNSCC   OPENED FOR INPUT.  STATUS = '      CAT825  
                                               INNSCC-STAT.             CAT825  
           IF  INNSCC-OKAY                                              CAT825  
               CONTINUE                                                 CAT825  
           ELSE                                                         CAT825  
               IF L-BYP-FILECHK                                         CAT825  
                  CONTINUE                                              CAT825  
               ELSE                                                     CAT825  
                  DISPLAY 'CAT825: U3001 - ABENDING ON BAD FILE STATUS' CAT825  
                  MOVE +3001    TO ABEND-CODE                           CAT825  
                  CALL ABEND USING ABEND-CODE                           CAT825  
               END-IF                                                   CAT825  
           END-IF.                                                      CAT825  
                                                                        CAT825  
           DISPLAY ' '.                                                 CAT825  
       1000-EXIT.                                                       CAT825  
           EXIT.                                                        CAT825  
      /                                                                 CAT825  
       2000-PROCESS-EXCP SECTION.                                       CAT825  
                                                                        CAT825  
           OPEN OUTPUT OTEXCP.                                          CAT825  
           DISPLAY 'CAT825: OTEXCP  OPENED FOR OUTPUT. STATUS = '       CAT825  
                                               OTEXCP-STAT.             CAT825  
           IF  OTEXCP-OKAY                                              CAT825  
               CONTINUE                                                 CAT825  
           ELSE                                                         CAT825  
               DISPLAY 'CAT825: ERROR OPENING OTEXCP'                   CAT825  
               DISPLAY 'CAT825: OPEN STATUS = ' OTEXCP-STAT             CAT825  
               DISPLAY 'CAT825: U3002 - ABENDING ON BAD FILE STATUS'    CAT825  
               MOVE +3002    TO ABEND-CODE                              CAT825  
               CALL ABEND USING ABEND-CODE                              CAT825  
           END-IF.                                                      CAT825  
                                                                        CAT825  
       2000-READ-LOOP.                                                  CAT825  
                                                                        CAT825  
           PERFORM 2010-READ-EXCP THRU 2010-EXIT                        CAT825  
                                                                        CAT825  
           IF  END-OF-INEXCP                                            CAT825  
               GO 2000-EXIT                                             CAT825  
           END-IF.                                                      CAT825  
                                                                        CAT825  
           IF INEXCP-HDR-REC                                            CAT825  
              MOVE INEXCP-HEADER-RECORD  TO OTEXCP-HEADER-RECORD        CAT825  
              MOVE 'H'                   TO CP2-REQUEST-CODE            CAT825  
              MOVE L-JOBNAME             TO CP2-PROGRAM-ID              CAT825  
              IF   L-CLIENT-NBR NUMERIC                                 CAT825  
                   MOVE L-CLIENT-NBR     TO CP2-CLIENT-NUMBER           CAT825  
              ELSE                                                      CAT825  
                   MOVE 999              TO CP2-CLIENT-NUMBER           CAT825  
              END-IF                                                    CAT825  
              CALL P2HDTR             USING CP2-AREA OTEXCP             CAT825  
              MOVE CP2-RETURN-RECORD     TO HEADER-RECORD               CAT825  
              MOVE HEADER-RECORD(1:54)   TO OTEXCP-HEADER-RECORD(1:54)  CAT825  
              MOVE LD-PROC-DATE          TO OTEXCP-HDR-PROC-DATE        CAT825  
      *----GET THE CYCLE NUMBER FROM THIS FILE                          CAT825  
              MOVE OTEXCP-HEADER-RECORD(61:2) TO W-CYCLE-NBR            CAT825  
              DISPLAY '******************'                              CAT825  
              DISPLAY '*THIS CYCLE = ' W-CYCLE-NBR ' *'                 CAT825  
              DISPLAY '******************'                              CAT825  
              DISPLAY 'OTEXCP HEADER: '     OTEXCP-HEADER-RECORD(1:80)  CAT825  
              WRITE OTEXCP-RECORD                                       CAT825  
              GO TO 2000-READ-LOOP                                      CAT825  
           END-IF                                                       CAT825  
           IF INEXCP-TRL-REC                                            CAT825  
LRM002        IF INEXCP2-OKAY                                           CAT825  
LRM002            PERFORM 2200-PROCESS-EXCP2 THRU 2200-EXIT             CAT825  
LRM002        END-IF                                                    CAT825  
              MOVE INEXCP-TRAILER-RECORD TO OTEXCP-TRAILER-RECORD       CAT825  
              MOVE 'T'                   TO CP2-REQUEST-CODE            CAT825  
              MOVE L-JOBNAME             TO CP2-PROGRAM-ID              CAT825  
              IF   L-CLIENT-NBR NUMERIC                                 CAT825  
                   MOVE L-CLIENT-NBR     TO CP2-CLIENT-NUMBER           CAT825  
              ELSE                                                      CAT825  
                   MOVE 999              TO CP2-CLIENT-NUMBER           CAT825  
              END-IF                                                    CAT825  
              MOVE W-OTEXCP-CNT          TO CP2-RECORD-COUNT            CAT825  
              CALL P2HDTR             USING CP2-AREA OTEXCP             CAT825  
              MOVE CP2-RETURN-RECORD     TO TRAILER-RECORD              CAT825  
              MOVE TRAILER-RECORD(1:54)  TO OTEXCP-TRAILER-RECORD(1:54) CAT825  
              MOVE LD-PROC-DATE          TO OTEXCP-TRL-PROC-DATE        CAT825  
              DISPLAY 'OTEXCP TRAILER:'     OTEXCP-TRAILER-RECORD(1:80) CAT825  
              WRITE OTEXCP-RECORD                                       CAT825  
              GO TO 2000-READ-LOOP                                      CAT825  
           END-IF                                                       CAT825  
                                                                        CAT825  
           IF INEXCP-CLIENT-NBR = L-CLIENT-NBR                          CAT825  
              MOVE INEXCP-RECORD         TO OTEXCP-RECORD               CAT825  
              ADD 1 TO W-OTEXCP-CNT                                     CAT825  
              WRITE OTEXCP-RECORD                                       CAT825  
              GO TO 2000-READ-LOOP                                      CAT825  
           END-IF.                                                      CAT825  
                                                                        CAT825  
           GO TO 2000-READ-LOOP.                                        CAT825  
                                                                        CAT825  
       2000-EXIT.                                                       CAT825  
           EXIT.                                                        CAT825  
      /                                                                 CAT825  
       2010-READ-EXCP SECTION.                                          CAT825  
                                                                        CAT825  
           IF  END-OF-INEXCP                                            CAT825  
               GO 2010-EXIT                                             CAT825  
           END-IF.                                                      CAT825  
                                                                        CAT825  
           READ INEXCP                                                  CAT825  
                AT END                                                  CAT825  
                   MOVE '1'              TO END-OF-INEXCP-SW            CAT825  
                   DISPLAY 'CAT825: END OF INEXCP REACHED'              CAT825  
                            '.  INPUT-CNT = ' W-INEXCP-CNT              CAT825  
                   GO TO 2010-EXIT                                      CAT825  
           END-READ.                                                    CAT825  
                                                                        CAT825  
           ADD  1                        TO W-INEXCP-CNT.               CAT825  
                                                                        CAT825  
           IF  INEXCP-OKAY                                              CAT825  
               CONTINUE                                                 CAT825  
           ELSE                                                         CAT825  
               DISPLAY 'CAT825: ERROR READING INEXCP'                   CAT825  
               DISPLAY 'CAT825: READ STATUS = ' INEXCP-STAT             CAT825  
                            '.  INPUT-CNT = ' W-INEXCP-CNT              CAT825  
               DISPLAY 'CAT825: U3001 - ABENDING ON BAD FILE STATUS'    CAT825  
               MOVE +3001 TO ABEND-CODE                                 CAT825  
               CALL ABEND USING ABEND-CODE                              CAT825  
           END-IF.                                                      CAT825  
                                                                        CAT825  
       2010-EXIT.                                                       CAT825  
           EXIT.                                                        CAT825  
      /                                                                 CAT825  
LRM002 2200-PROCESS-EXCP2 SECTION.                                      CAT825  
LRM002     PERFORM 2210-READ-EXCP2 THRU 2210-EXIT                       CAT825  
LRM002                                                                  CAT825  
LRM002     IF  END-OF-INEXCP2                                           CAT825  
LRM002         GO 2200-EXIT                                             CAT825  
LRM002     END-IF.                                                      CAT825  
LRM002                                                                  CAT825  
LRM002     IF INEXCP2-HDR-REC                                           CAT825  
LRM002     OR INEXCP2-TRL-REC                                           CAT825  
LRM002        GO TO 2200-PROCESS-EXCP2                                  CAT825  
LRM002     END-IF                                                       CAT825  
LRM002                                                                  CAT825  
LRM002     IF INEXCP2-CLIENT-NBR = L-CLIENT-NBR                         CAT825  
LRM002        MOVE INEXCP2-RECORD        TO OTEXCP-RECORD               CAT825  
LRM002        ADD 1 TO W-OTEXCP-CNT                                     CAT825  
LRM002        WRITE OTEXCP-RECORD                                       CAT825  
LRM002        GO TO 2200-PROCESS-EXCP2                                  CAT825  
LRM002     END-IF.                                                      CAT825  
LRM002                                                                  CAT825  
LRM002     GO TO 2200-PROCESS-EXCP2.                                    CAT825  
LRM002                                                                  CAT825  
LRM002 2200-EXIT.                                                       CAT825  
LRM002     EXIT.                                                        CAT825  
      /                                                                 CAT825  
LRM002 2210-READ-EXCP2 SECTION.                                         CAT825  
LRM002                                                                  CAT825  
LRM002     IF  END-OF-INEXCP2                                           CAT825  
LRM002         GO 2210-EXIT                                             CAT825  
LRM002     END-IF.                                                      CAT825  
LRM002                                                                  CAT825  
LRM002     READ INEXCP2                                                 CAT825  
LRM002          AT END                                                  CAT825  
LRM002             MOVE '1'              TO END-OF-INEXCP2-SW           CAT825  
LRM002             DISPLAY 'CAT825: END OF INEXCP2 REACHED'             CAT825  
LRM002                      '.  INPUT-CNT = ' W-INEXCP2-CNT             CAT825  
LRM002             GO TO 2210-EXIT                                      CAT825  
LRM002     END-READ.                                                    CAT825  
LRM002                                                                  CAT825  
LRM002     ADD  1                        TO W-INEXCP2-CNT.              CAT825  
LRM002                                                                  CAT825  
LRM002     IF  INEXCP2-OKAY                                             CAT825  
LRM002         CONTINUE                                                 CAT825  
LRM002     ELSE                                                         CAT825  
LRM002         DISPLAY 'CAT825: ERROR READING INEXCP2'                  CAT825  
LRM002         DISPLAY 'CAT825: READ STATUS = ' INEXCP2-STAT            CAT825  
LRM002                      '.  INPUT-CNT = ' W-INEXCP2-CNT             CAT825  
LRM002         DISPLAY 'CAT825: U3006 - ABENDING ON BAD FILE STATUS'    CAT825  
LRM002         MOVE +3006 TO ABEND-CODE                                 CAT825  
LRM002         CALL ABEND USING ABEND-CODE                              CAT825  
LRM002     END-IF.                                                      CAT825  
LRM002                                                                  CAT825  
LRM002 2210-EXIT.                                                       CAT825  
LRM002     EXIT.                                                        CAT825  
      /                                                                 CAT825  
       3000-PROCESS-WHLD SECTION.                                       CAT825  
                                                                        CAT825  
           OPEN OUTPUT OTWHLD.                                          CAT825  
           DISPLAY 'CAT825: OTWHLD  OPENED FOR OUTPUT. STATUS = '       CAT825  
                                               OTWHLD-STAT.             CAT825  
           IF  OTWHLD-OKAY                                              CAT825  
               CONTINUE                                                 CAT825  
           ELSE                                                         CAT825  
               DISPLAY 'CAT825: ERROR OPENING OTWHLD'                   CAT825  
               DISPLAY 'CAT825: OPEN STATUS = ' OTWHLD-STAT             CAT825  
               DISPLAY 'CAT825: U3002 - ABENDING ON BAD FILE STATUS'    CAT825  
               MOVE +3002    TO ABEND-CODE                              CAT825  
               CALL ABEND USING ABEND-CODE                              CAT825  
           END-IF.                                                      CAT825  
                                                                        CAT825  
       3000-READ-LOOP.                                                  CAT825  
                                                                        CAT825  
           PERFORM 3010-READ-WHLD THRU 3010-EXIT                        CAT825  
                                                                        CAT825  
           IF  END-OF-INWHLD                                            CAT825  
               GO 3000-EXIT                                             CAT825  
           END-IF.                                                      CAT825  
                                                                        CAT825  
           IF INWHLD-HDR-REC                                            CAT825  
              MOVE INWHLD-HEADER-RECORD  TO OTWHLD-HEADER-RECORD        CAT825  
              MOVE 'H'                   TO CP2-REQUEST-CODE            CAT825  
              MOVE L-JOBNAME             TO CP2-PROGRAM-ID              CAT825  
              IF   L-CLIENT-NBR NUMERIC                                 CAT825  
                   MOVE L-CLIENT-NBR     TO CP2-CLIENT-NUMBER           CAT825  
              ELSE                                                      CAT825  
                   MOVE 999              TO CP2-CLIENT-NUMBER           CAT825  
              END-IF                                                    CAT825  
              CALL P2HDTR             USING CP2-AREA OTWHLD             CAT825  
              MOVE CP2-RETURN-RECORD     TO HEADER-RECORD               CAT825  
              MOVE HEADER-RECORD(1:54)   TO OTWHLD-HEADER-RECORD(1:54)  CAT825  
              MOVE LD-PROC-DATE          TO OTWHLD-HDR-PROC-DATE        CAT825  
              DISPLAY 'OTWHLD HEADER: '     OTWHLD-HEADER-RECORD        CAT825  
              WRITE OTWHLD-RECORD                                       CAT825  
              GO TO 3000-READ-LOOP                                      CAT825  
           END-IF                                                       CAT825  
           IF INWHLD-TRL-REC                                            CAT825  
              MOVE INWHLD-TRAILER-RECORD TO OTWHLD-TRAILER-RECORD       CAT825  
              MOVE 'T'                   TO CP2-REQUEST-CODE            CAT825  
              MOVE L-JOBNAME             TO CP2-PROGRAM-ID              CAT825  
              IF   L-CLIENT-NBR NUMERIC                                 CAT825  
                   MOVE L-CLIENT-NBR     TO CP2-CLIENT-NUMBER           CAT825  
              ELSE                                                      CAT825  
                   MOVE 999              TO CP2-CLIENT-NUMBER           CAT825  
              END-IF                                                    CAT825  
              MOVE W-OTWHLD-CNT          TO CP2-RECORD-COUNT            CAT825  
              CALL P2HDTR             USING CP2-AREA OTWHLD             CAT825  
              MOVE CP2-RETURN-RECORD     TO TRAILER-RECORD              CAT825  
              MOVE TRAILER-RECORD(1:54)  TO OTWHLD-TRAILER-RECORD(1:54) CAT825  
              MOVE LD-PROC-DATE          TO OTWHLD-TRL-PROC-DATE        CAT825  
              DISPLAY 'OTWHLD TRAILER:'     OTWHLD-TRAILER-RECORD       CAT825  
              WRITE OTWHLD-RECORD                                       CAT825  
              GO TO 3000-READ-LOOP                                      CAT825  
           END-IF                                                       CAT825  
                                                                        CAT825  
           IF INWHLD-CLIENT-NBR = L-CLIENT-NBR                          CAT825  
              MOVE INWHLD-RECORD         TO OTWHLD-RECORD               CAT825  
              ADD 1 TO W-OTWHLD-CNT                                     CAT825  
              WRITE OTWHLD-RECORD                                       CAT825  
              GO TO 3000-READ-LOOP                                      CAT825  
           END-IF.                                                      CAT825  
                                                                        CAT825  
           GO TO 3000-READ-LOOP.                                        CAT825  
                                                                        CAT825  
       3000-EXIT.                                                       CAT825  
           EXIT.                                                        CAT825  
      /                                                                 CAT825  
       3010-READ-WHLD SECTION.                                          CAT825  
                                                                        CAT825  
           IF  END-OF-INWHLD                                            CAT825  
               GO 3010-EXIT                                             CAT825  
           END-IF.                                                      CAT825  
                                                                        CAT825  
           READ INWHLD                                                  CAT825  
                AT END                                                  CAT825  
                   MOVE '1'              TO END-OF-INWHLD-SW            CAT825  
                   DISPLAY 'CAT825: END OF INWHLD REACHED'              CAT825  
                            '.  INPUT-CNT = ' W-INWHLD-CNT              CAT825  
                   GO TO 3010-EXIT                                      CAT825  
           END-READ.                                                    CAT825  
                                                                        CAT825  
           ADD  1                        TO W-INWHLD-CNT.               CAT825  
                                                                        CAT825  
           IF  INWHLD-OKAY                                              CAT825  
               CONTINUE                                                 CAT825  
           ELSE                                                         CAT825  
               DISPLAY 'CAT825: ERROR READING INWHLD'                   CAT825  
               DISPLAY 'CAT825: READ STATUS = ' INWHLD-STAT             CAT825  
                            '.  INPUT-CNT = ' W-INWHLD-CNT              CAT825  
               DISPLAY 'CAT825: U3002 - ABENDING ON BAD FILE STATUS'    CAT825  
               MOVE +3002 TO ABEND-CODE                                 CAT825  
               CALL ABEND USING ABEND-CODE                              CAT825  
           END-IF.                                                      CAT825  
                                                                        CAT825  
       3010-EXIT.                                                       CAT825  
           EXIT.                                                        CAT825  
      /                                                                 CAT825  
       4000-PROCESS-MATH SECTION.                                       CAT825  
                                                                        CAT825  
           OPEN OUTPUT OTMATH.                                          CAT825  
           DISPLAY 'CAT825: OTMATH  OPENED FOR OUTPUT. STATUS = '       CAT825  
                                               OTMATH-STAT.             CAT825  
           IF  OTMATH-OKAY                                              CAT825  
               CONTINUE                                                 CAT825  
           ELSE                                                         CAT825  
               DISPLAY 'CAT825: ERROR OPENING OTMATH'                   CAT825  
               DISPLAY 'CAT825: OPEN STATUS = ' OTMATH-STAT             CAT825  
               DISPLAY 'CAT825: U3002 - ABENDING ON BAD FILE STATUS'    CAT825  
               MOVE +3002    TO ABEND-CODE                              CAT825  
               CALL ABEND USING ABEND-CODE                              CAT825  
           END-IF.                                                      CAT825  
                                                                        CAT825  
       4000-READ-LOOP.                                                  CAT825  
                                                                        CAT825  
           PERFORM 4010-READ-MATH THRU 4010-EXIT                        CAT825  
                                                                        CAT825  
           IF  END-OF-INMATH                                            CAT825  
               GO 4000-EXIT                                             CAT825  
           END-IF.                                                      CAT825  
                                                                        CAT825  
           IF INMATH-HDR-REC                                            CAT825  
              MOVE INMATH-HEADER-RECORD  TO OTMATH-HEADER-RECORD        CAT825  
              MOVE 'H'                   TO CP2-REQUEST-CODE            CAT825  
              MOVE L-JOBNAME             TO CP2-PROGRAM-ID              CAT825  
              IF   L-CLIENT-NBR NUMERIC                                 CAT825  
                   MOVE L-CLIENT-NBR     TO CP2-CLIENT-NUMBER           CAT825  
              ELSE                                                      CAT825  
                   MOVE 999              TO CP2-CLIENT-NUMBER           CAT825  
              END-IF                                                    CAT825  
              CALL P2HDTR             USING CP2-AREA OTMATH             CAT825  
              MOVE CP2-RETURN-RECORD     TO HEADER-RECORD               CAT825  
              MOVE HEADER-RECORD(1:54)   TO OTMATH-HEADER-RECORD(1:54)  CAT825  
              MOVE LD-PROC-DATE          TO OTMATH-HDR-PROC-DATE        CAT825  
              DISPLAY 'OTMATH HEADER: '     OTMATH-HEADER-RECORD        CAT825  
              WRITE OTMATH-RECORD                                       CAT825  
              GO TO 4000-READ-LOOP                                      CAT825  
           END-IF                                                       CAT825  
           IF INMATH-TRL-REC                                            CAT825  
              MOVE INMATH-TRAILER-RECORD TO OTMATH-TRAILER-RECORD       CAT825  
              MOVE 'T'                   TO CP2-REQUEST-CODE            CAT825  
              MOVE L-JOBNAME             TO CP2-PROGRAM-ID              CAT825  
              IF   L-CLIENT-NBR NUMERIC                                 CAT825  
                   MOVE L-CLIENT-NBR     TO CP2-CLIENT-NUMBER           CAT825  
              ELSE                                                      CAT825  
                   MOVE 999              TO CP2-CLIENT-NUMBER           CAT825  
              END-IF                                                    CAT825  
              MOVE W-OTMATH-CNT          TO CP2-RECORD-COUNT            CAT825  
              CALL P2HDTR             USING CP2-AREA OTMATH             CAT825  
              MOVE CP2-RETURN-RECORD     TO TRAILER-RECORD              CAT825  
              MOVE TRAILER-RECORD(1:54)  TO OTMATH-TRAILER-RECORD(1:54) CAT825  
              MOVE LD-PROC-DATE          TO OTMATH-TRL-PROC-DATE        CAT825  
              DISPLAY 'OTMATH TRAILER:'     OTMATH-TRAILER-RECORD       CAT825  
              WRITE OTMATH-RECORD                                       CAT825  
              GO TO 4000-READ-LOOP                                      CAT825  
           END-IF                                                       CAT825  
                                                                        CAT825  
           IF INMATH-CLIENT-NBR = L-CLIENT-NBR                          CAT825  
              MOVE INMATH-RECORD         TO OTMATH-RECORD               CAT825  
              ADD 1 TO W-OTMATH-CNT                                     CAT825  
              WRITE OTMATH-RECORD                                       CAT825  
              GO TO 4000-READ-LOOP                                      CAT825  
           END-IF.                                                      CAT825  
                                                                        CAT825  
           GO TO 4000-READ-LOOP.                                        CAT825  
                                                                        CAT825  
       4000-EXIT.                                                       CAT825  
           EXIT.                                                        CAT825  
      /                                                                 CAT825  
       4010-READ-MATH SECTION.                                          CAT825  
                                                                        CAT825  
           IF  END-OF-INMATH                                            CAT825  
               GO 4010-EXIT                                             CAT825  
           END-IF.                                                      CAT825  
                                                                        CAT825  
           READ INMATH                                                  CAT825  
                AT END                                                  CAT825  
                   MOVE '1'              TO END-OF-INMATH-SW            CAT825  
                   DISPLAY 'CAT825: END OF INMATH REACHED'              CAT825  
                            '.  INPUT-CNT = ' W-INMATH-CNT              CAT825  
                   GO TO 4010-EXIT                                      CAT825  
           END-READ.                                                    CAT825  
                                                                        CAT825  
           ADD  1                        TO W-INMATH-CNT.               CAT825  
                                                                        CAT825  
           IF  INMATH-OKAY                                              CAT825  
               CONTINUE                                                 CAT825  
           ELSE                                                         CAT825  
               DISPLAY 'CAT825: ERROR READING INMATH'                   CAT825  
               DISPLAY 'CAT825: READ STATUS = ' INMATH-STAT             CAT825  
                            '.  INPUT-CNT = ' W-INMATH-CNT              CAT825  
               DISPLAY 'CAT825: U3003 - ABENDING ON BAD FILE STATUS'    CAT825  
               MOVE +3003 TO ABEND-CODE                                 CAT825  
               CALL ABEND USING ABEND-CODE                              CAT825  
           END-IF.                                                      CAT825  
                                                                        CAT825  
       4010-EXIT.                                                       CAT825  
           EXIT.                                                        CAT825  
      /                                                                 CAT825  
       5000-PROCESS-NSCC SECTION.                                       CAT825  
                                                                        CAT825  
           OPEN OUTPUT OTNSCC.                                          CAT825  
           DISPLAY 'CAT825: OTNSCC  OPENED FOR OUTPUT. STATUS = '       CAT825  
                                               OTNSCC-STAT.             CAT825  
           IF  OTNSCC-OKAY                                              CAT825  
               CONTINUE                                                 CAT825  
           ELSE                                                         CAT825  
               DISPLAY 'CAT825: ERROR OPENING OTNSCC'                   CAT825  
               DISPLAY 'CAT825: OPEN STATUS = ' OTNSCC-STAT             CAT825  
               DISPLAY 'CAT825: U3002 - ABENDING ON BAD FILE STATUS'    CAT825  
               MOVE +3002    TO ABEND-CODE                              CAT825  
               CALL ABEND USING ABEND-CODE                              CAT825  
           END-IF.                                                      CAT825  
                                                                        CAT825  
       5000-READ-LOOP.                                                  CAT825  
                                                                        CAT825  
           PERFORM 5010-READ-NSCC THRU 5010-EXIT                        CAT825  
                                                                        CAT825  
           IF  END-OF-INNSCC                                            CAT825  
               GO 5000-EXIT                                             CAT825  
           END-IF.                                                      CAT825  
                                                                        CAT825  
           IF INNSCC-REC(1:5) = 'HDR.S'                                 CAT825  
              MOVE INNSCC-REC            TO NSCC-HDR-RECORD             CAT825  
              MOVE L-CLEARING-NBR        TO NSCCDHDR-SUB-ORIGINATOR     CAT825  
              DISPLAY 'OTNSCC HEADER: '     NSCC-HDR-RECORD             CAT825  
              WRITE OTNSCC-HEADER-TRAILER FROM NSCC-HDR-RECORD          CAT825  
              GO TO 5000-READ-LOOP                                      CAT825  
           END-IF                                                       CAT825  
                                                                        CAT825  
           IF INNSCC-REC(1:2) = 'TI'                                    CAT825  
              MOVE INNSCC-REC            TO NSCCTI-RECORD               CAT825  
              IF NSCCTI-SUB-PART-NBR = L-CLEARING-NBR                   CAT825  
                 WRITE OTNSCC-TI-REC      FROM NSCCTI-RECORD            CAT825  
                 ADD 1 TO W-OTNSCC-CNT                                  CAT825  
                 GO TO 5000-READ-LOOP                                   CAT825  
              END-IF                                                    CAT825  
           END-IF                                                       CAT825  
                                                                        CAT825  
           IF INNSCC-REC(1:2) = 'AT'                                    CAT825  
LRM003        MOVE SPACES TO NSCCAT-AREA                                CAT825  
LRM003        MOVE INNSCC-REC(1 : W-REC-LEN-IN) TO NSCCAT-AREA          CAT825  
              IF NSCCAT-SUB-PART-NBR = L-CLEARING-NBR                   CAT825  
LRM003           MOVE NSCCAT-AREA TO OTNSCC-AT-REC-EXP                          
LRM003           IF  NSCCAT-AREA(312 : 17) = 'ORIGINAL CURRENCY'                
LRM003           AND NSCCAT-AREA(11 : 1) = 'A'                                  
LRM003           AND NSCCAT-AREA(330 : 3) > '000'                               
LRM003           AND NSCCAT-AREA(330 : 3) <= '999'                              
LRM003              MOVE NSCCAT-AREA(330 : 3)                                   
LRM003                              TO OTNSCC-AT-REC-EXP(1973 : 3)              
LRM003           END-IF                                                         
LRM003           IF  NSCCAT-AREA(89 : 3) = 'FCUR'                               
LRM003           AND NSCCAT-AREA(11 : 1) = 'A'                                  
LRM003           AND NSCCAT-AREA(76 : 3) > '000'                                
LRM003           AND NSCCAT-AREA(76 : 3) <= '999'                               
LRM003              MOVE NSCCAT-AREA(76 : 3)                                    
LRM003                              TO OTNSCC-AT-REC-EXP(1973 : 3)              
LRM003           END-IF                                                         
LRM003           MOVE 2000 TO W-REC-LEN-OUT                             CAT825  
LRM003           WRITE OTNSCC-AT-REC-EXP                                        
LRM003***        EVALUATE NSCCAT-REC-LENGTH                             CAT825  
LRM003***          WHEN 431                                             CAT825  
LRM003***             MOVE NSCCAT-RECORD         TO  OTNSCC-AT-REC      CAT825  
LRM003***             WRITE OTNSCC-AT-REC                               CAT825  
LRM003***          WHEN 550                                             CAT825  
LRM003***          WHEN 465                                             CAT825  
LRM003***             MOVE NSCCAT-RECORD         TO  OTNSCC-AT-BASIC2   CAT825  
LRM003***             MOVE NSCCAT-MF-AREA        TO  OTNSCC-AT-MF       CAT825  
LRM003***             WRITE OTNSCC-AT-MF-REC                            CAT825  
LRM003***          WHEN 497                                             CAT825  
LRM003***             MOVE NSCCAT-RECORD         TO  OTNSCC-AT-BASIC1   CAT825  
LRM003***             MOVE NSCCAT-OPTION-AREA    TO  OTNSCC-AT-OPTN     CAT825  
LRM003***             WRITE OTNSCC-AT-OPTN-REC                          CAT825  
LRM003***          WHEN OTHER                                           CAT825  
LRM003***             MOVE NSCCAT-RECORD         TO  OTNSCC-AT-BASIC1   CAT825  
LRM003***             MOVE NSCCAT-OPTION-AREA    TO  OTNSCC-AT-MF       CAT825  
LRM003***             WRITE OTNSCC-AT-OPTN-REC                          CAT825  
LRM003***        END-EVALUATE                                           CAT825  
                 ADD 1 TO W-OTNSCC-CNT                                  CAT825  
                 GO TO 5000-READ-LOOP                                   CAT825  
              END-IF                                                    CAT825  
           END-IF                                                       CAT825  
                                                                        CAT825  
           IF INNSCC-REC(1:5) = 'END.S'                                 CAT825  
              MOVE INNSCC-REC            TO NSCC-TRL-RECORD             CAT825  
              MOVE L-CLEARING-NBR        TO NSCCDTRL-SUB-ORIGINATOR     CAT825  
              MOVE W-OTNSCC-CNT          TO NSCCDTRL-REC-COUNT          CAT825  
              DISPLAY 'OTNSCC TRAILER:'     NSCC-TRL-RECORD             CAT825  
              WRITE OTNSCC-HEADER-TRAILER FROM NSCC-TRL-RECORD          CAT825  
              GO TO 5000-READ-LOOP                                      CAT825  
           END-IF                                                       CAT825  
                                                                        CAT825  
           GO TO 5000-READ-LOOP.                                        CAT825  
                                                                        CAT825  
       5000-EXIT.                                                       CAT825  
           EXIT.                                                        CAT825  
      /                                                                 CAT825  
       5010-READ-NSCC SECTION.                                          CAT825  
                                                                        CAT825  
           IF  END-OF-INNSCC                                            CAT825  
               GO 5010-EXIT                                             CAT825  
           END-IF.                                                      CAT825  
                                                                        CAT825  
           READ INNSCC                                                  CAT825  
                AT END                                                  CAT825  
                   MOVE '1'              TO END-OF-INNSCC-SW            CAT825  
                   DISPLAY 'CAT825: END OF INNSCC REACHED'              CAT825  
                            '.  INPUT-CNT = ' W-INNSCC-CNT              CAT825  
                   GO TO 5010-EXIT                                      CAT825  
           END-READ.                                                    CAT825  
                                                                        CAT825  
           ADD  1                        TO W-INNSCC-CNT.               CAT825  
                                                                        CAT825  
           IF  INNSCC-OKAY                                              CAT825  
LRM003         MOVE W-REC-LEN-IN TO W-REC-LEN-OUT                       CAT825  
           ELSE                                                         CAT825  
               DISPLAY 'CAT825: ERROR READING INNSCC'                   CAT825  
               DISPLAY 'CAT825: READ STATUS = ' INNSCC-STAT             CAT825  
                            '.  INPUT-CNT = ' W-INNSCC-CNT              CAT825  
               DISPLAY 'CAT825: U3004 - ABENDING ON BAD FILE STATUS'    CAT825  
               MOVE +3004 TO ABEND-CODE                                 CAT825  
               CALL ABEND USING ABEND-CODE                              CAT825  
           END-IF.                                                      CAT825  
                                                                        CAT825  
       5010-EXIT.                                                       CAT825  
           EXIT.                                                        CAT825  
      /                                                                 CAT825  
       9000-CLOSE-ROUTINE SECTION.                                      CAT825  
                                                                        CAT825  
           DISPLAY ' '.                                                 CAT825  
           CLOSE INEXCP                                                 CAT825  
           DISPLAY 'CAT825: INEXCP   CLOSED. STATUS = ' INEXCP-STAT     CAT825  
LRM002     CLOSE INEXCP2                                                CAT825  
LRM002     DISPLAY 'CAT825: INEXCP2  CLOSED. STATUS = ' INEXCP-STAT     CAT825  
           CLOSE OTEXCP                                                 CAT825  
           DISPLAY 'CAT825: OTEXCP   CLOSED. STATUS = ' OTEXCP-STAT     CAT825  
           CLOSE INWHLD                                                 CAT825  
           DISPLAY 'CAT825: INWHLD   CLOSED. STATUS = ' INWHLD-STAT     CAT825  
           CLOSE OTWHLD                                                 CAT825  
           DISPLAY 'CAT825: OTWHLD   CLOSED. STATUS = ' OTWHLD-STAT     CAT825  
           CLOSE INMATH                                                 CAT825  
           DISPLAY 'CAT825: INMATH   CLOSED. STATUS = ' INMATH-STAT     CAT825  
           CLOSE OTMATH                                                 CAT825  
           DISPLAY 'CAT825: OTMATH   CLOSED. STATUS = ' OTMATH-STAT     CAT825  
           CLOSE INNSCC                                                 CAT825  
           DISPLAY 'CAT825: INNSCC   CLOSED. STATUS = ' INNSCC-STAT     CAT825  
           CLOSE OTNSCC                                                 CAT825  
           DISPLAY 'CAT825: OTNSCC   CLOSED. STATUS = ' OTNSCC-STAT     CAT825  
           DISPLAY ' '.                                                 CAT825  
           DISPLAY 'CAT825: PROGRAM ENDED SUCCESSFULLY'.                CAT825  
                                                                        CAT825  
       9000-EXIT.                                                       CAT825  
           EXIT.                                                        CAT825  
      *################################################################ CAT825  
