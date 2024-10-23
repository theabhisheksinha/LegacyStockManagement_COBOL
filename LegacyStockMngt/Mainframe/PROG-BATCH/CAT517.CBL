000001* PDX    - CAT517   C0249006 06/29/07 12:10:47 TBDOJUN            00001000
      * DJ0004 SSR 47339 SUPPORT DUALLY LISTED SECURITIES               CAT517  
      * DJ0004           POPULATE GETMSD-CLIENT-PL2 WHEN CALLING GETMSD CAT517  
000001* PDX    - CAT517   C0215169 02/14/05 07:53:19 TBDOJUN            00001000
      * DJ0003 SSR# 40633 RECOMPILED FOR NEW COPYBOOK (ANNUITY)         CAT517  
      * DJ0003 MIPS REDUCTION - CHANGE PIC 9 TO PIC 9 COMP-3            CAT517  
000001* PDX    - CAT517   C0155175 03/02/01 11:37:12 TBDOJUN            CAT517  
000001* PDX    - CAT517   C0151178 12/18/00 08:37:18 TBDOJUN            CAT517  
      * DJ0002 SSR# R2262400 W8 FIELDS. COBOL LE                        CAT517  
000001* PDX    - CAT517   C0129756 08/16/99 12:21:50 TBDOJUN            CAT517  
      * DJ0001 - COMMIT MORE OFTEN                                      CAT517  
000001* PDX    - CAT517   C0121087 01/30/99 12:26:11 TBDOJUN            CAT517  
000001* PDX    - CAT517   C0119389 01/04/99 15:37:13 TBDOJUN            CAT517  
000001* PDX    - CAT517   C0118401 11/25/98 10:59:40 TBDOJUN            CAT517  
000001* DJ     - FIX DSTBN-SIDE-CD LOGIC                                CAT517  
000001* PDX    - CAT517   C0109316 11/13/98 10:15:08 TBDOJUN            CAT517  
       IDENTIFICATION DIVISION.                                         CAT517  
       PROGRAM-ID.  CAT517.                                             CAT517  
      ***************************************************************** CAT517  
      * THIS PROGRAM CONTAINS DB2.                                    * CAT517  
      ***************************************************************** CAT517  
      * CAT517 - PROCESS FUND-REG ('F') TRANSACTIONS FROM NSCC.       * CAT517  
      *                                                               * CAT517  
      * PROCESS ONLY FUND-REG RECORDS FROM THE INPUT FILE.            * CAT517  
      *                                                               * CAT517  
      * IF WE RECEIVE A FUND-REG RECORD FROM NSCC, IT SHOULD ALWAYS   * CAT517  
      * BE FROM ADP AND IT SHOULD BE ON THE TABLES.                   * CAT517  
      *                                                               * CAT517  
      * ADD/UPDATE FUND-REG DB2 TABLES                                * CAT517  
      *                                                               * CAT517  
      * INPUT  -                                                      * CAT517  
      *        - EXTRACTED NSCC FILE.                                 * CAT517  
      *                                                               * CAT517  
      * OUTPUT -                                                      * CAT517  
      *        - EXTRACTED NSCC FILE. UPDATE SWITCHES.                * CAT517  
      *        - DB2 DATABASE UPDATED                                 * CAT517  
      *                                                               * CAT517  
      ***************************************************************** CAT517  
      * 07/20/98 DJ     NEW PROGRAM                                   * CAT517  
      * 08/16/99 DJ0001 COMMIT MORE OFTEN                             * CAT517  
      * 12/18/00 DJ0002 SSR# R2262400 W8 FIELDS                       * CAT517  
      ***************************************************************** CAT517  
      /                                                                 CAT517  
       ENVIRONMENT DIVISION.                                            CAT517  
       INPUT-OUTPUT SECTION.                                            CAT517  
       FILE-CONTROL.                                                    CAT517  
                                                                        CAT517  
           SELECT INFILE           ASSIGN       TO INFILE               CAT517  
                                   FILE STATUS  IS INFILE-STAT.         CAT517  
                                                                        CAT517  
      /                                                                 CAT517  
       DATA DIVISION.                                                   CAT517  
       FILE SECTION.                                                    CAT517  
       FD  INFILE                                                       CAT517  
           RECORDING MODE IS V                                          CAT517  
           RECORD IS VARYING IN SIZE FROM 1 TO 3326 CHARACTERS          CAT517  
              DEPENDING ON W-REC-LEN-IN                                 CAT517  
           BLOCK CONTAINS 0 RECORDS.                                    CAT517  
                                                                        CAT517  
           COPY NSCCMEXT REPLACING ==:NSCCMEXT:== BY ==INFILE==.        CAT517  
      /                                                                 CAT517  
       WORKING-STORAGE SECTION.                                         CAT517  
           COPY PDXIDCOB.                                               CAT517  
                                                                        CAT517  
       01  W-FIELDS.                                                    CAT517  
           05  W-PGM-NAME                PIC  X(008) VALUE 'CAT517'.    CAT517  
           05  W-ROUTINE-1               PIC  X(032) VALUE ' '.         CAT517  
           05  W-FIRST-TIME-SW           PIC  X(001) VALUE '0'.         CAT517  
               88 NOT-FIRST-TIME                     VALUE '1'.         CAT517  
           05  END-OF-INPUT-SW           PIC  X(001) VALUE '0'.         CAT517  
               88 END-OF-INPUT                       VALUE '1'.         CAT517  
           05  INFILE-STAT               PIC  X(002).                   CAT517  
               88 INFILE-OKAY            VALUE '00' THRU '09', '97'.    CAT517  
               88 INFILE-END-OF-FILE     VALUE '10'.                    CAT517  
               88 INFILE-EMPTY-MISSING VALUE '35'.                      CAT517  
           05  INFILE-DATE-SW            PIC  X(001) VALUE ' '.         CAT517  
               88 INFILE-DATE-FOUND                  VALUE 'Y'.         CAT517  
           05  W-SYS-DATE                PIC  9(006) VALUE 0.           CAT517  
           05  FILLER  REDEFINES                                        CAT517  
               W-SYS-DATE.                                              CAT517  
               10  W-UPD-DATE            PIC  X(006).                   CAT517  
           05  W-SYS-TIME                PIC  9(008) VALUE 0.           CAT517  
           05  FILLER  REDEFINES                                        CAT517  
               W-SYS-TIME.                                              CAT517  
               10  W-UPD-TIME            PIC  X(006).                   CAT517  
               10  W-UPD-TIME-MS         PIC  X(002).                   CAT517  
           05  LD-PROC-DATE.                                            CAT517  
               10 LD-PROC-DATE-MM        PIC  X(002).                   CAT517  
               10 LD-PROC-DATE-DD        PIC  X(002).                   CAT517  
               10 LD-PROC-DATE-YY        PIC  X(002).                   CAT517  
           05  W-HDR-TRL-SW              PIC  X(001) VALUE 'T'.         CAT517  
               88 HDR-FOUND                          VALUE 'H'.         CAT517  
               88 TRL-FOUND                          VALUE 'T'.         CAT517  
           05  W-BRK-SW                  PIC  X(001) VALUE ' '.         CAT517  
               88 BRK-FOUND                          VALUE 'Y'.         CAT517  
           05  FILLER                    PIC  X(008) VALUE 'INPUTCNT'.  CAT517  
           05  W-INFILE-CNT              PIC  9(009) VALUE 0.           CAT517  
           05  FILLER                    PIC  X(008) VALUE 'DETAILCT'.  CAT517  
           05  W-DETAIL-CNT              PIC  9(009) VALUE 0.           CAT517  
           05  FILLER                    PIC  X(008) VALUE 'LOAD-CNT'.  CAT517  
           05  W-LOAD-CNT                PIC  9(009) VALUE 0.           CAT517  
           05  FILLER                    PIC  X(008) VALUE 'RECLENIN'.  CAT517  
           05  W-REC-LEN-IN              PIC  9(005) VALUE 0.           CAT517  
           05  FILLER                    PIC  X(008) VALUE 'RECLENOT'.  CAT517  
           05  W-REC-LEN-OUT             PIC  9(005) VALUE 0.           CAT517  
           05  W-FR-CNT                  PIC  9(009) VALUE 0.           CAT517  
           05  W-SQL-CNT                 PIC  9(009) VALUE 0.           CAT517  
           05  W-VFNDRGST-ADD-CNT        PIC  9(009) VALUE 0.           CAT517  
           05  W-VFNDRGST-NOT-ADD-CNT    PIC  9(009) VALUE 0.           CAT517  
           05  W-VFNDRGST-UPD-CNT        PIC  9(009) VALUE 0.           CAT517  
           05  W-VFNDRGST-NOT-UPD-CNT    PIC  9(009) VALUE 0.           CAT517  
           05  W-VFNDRGST-DEL-CNT        PIC  9(009) VALUE 0.           CAT517  
           05  W-VFNDRGST-NOT-DEL-CNT    PIC  9(009) VALUE 0.           CAT517  
           05  W-VFNDNA-ADD-CNT          PIC  9(009) VALUE 0.           CAT517  
           05  W-VFNDNA-NOT-ADD-CNT      PIC  9(009) VALUE 0.           CAT517  
           05  W-VFNDNA-UPD-CNT          PIC  9(009) VALUE 0.           CAT517  
           05  W-VFNDNA-NOT-UPD-CNT      PIC  9(009) VALUE 0.           CAT517  
           05  W-VFNDNA-DEL-CNT          PIC  9(009) VALUE 0.           CAT517  
           05  W-VFNDNA-NOT-DEL-CNT      PIC  9(009) VALUE 0.           CAT517  
           05  W-VFNDPYBL-ADD-CNT        PIC  9(009) VALUE 0.           CAT517  
           05  W-VFNDPYBL-NOT-ADD-CNT    PIC  9(009) VALUE 0.           CAT517  
           05  W-VFNDPYBL-UPD-CNT        PIC  9(009) VALUE 0.           CAT517  
           05  W-VFNDPYBL-NOT-UPD-CNT    PIC  9(009) VALUE 0.           CAT517  
           05  W-VFNDPYBL-DEL-CNT        PIC  9(009) VALUE 0.           CAT517  
           05  W-VFNDPYBL-NOT-DEL-CNT    PIC  9(009) VALUE 0.           CAT517  
           05  W-VFNDPYNA-ADD-CNT        PIC  9(009) VALUE 0.           CAT517  
           05  W-VFNDPYNA-NOT-ADD-CNT    PIC  9(009) VALUE 0.           CAT517  
           05  W-VFNDPYNA-UPD-CNT        PIC  9(009) VALUE 0.           CAT517  
           05  W-VFNDPYNA-NOT-UPD-CNT    PIC  9(009) VALUE 0.           CAT517  
           05  W-VFNDPYNA-DEL-CNT        PIC  9(009) VALUE 0.           CAT517  
           05  W-VFNDPYNA-NOT-DEL-CNT    PIC  9(009) VALUE 0.           CAT517  
           05  W-MSD-FND-CNT             PIC  9(009) VALUE 0.           CAT517  
           05  W-MSD-NOTFND-CNT          PIC  9(009) VALUE 0.           CAT517  
           05  W-MSD-NOTFND-SW           PIC  X(001) VALUE ' '.         CAT517  
               88 W-MSD-NOTFND                       VALUE 'Y'.         CAT517  
      /                                                                 CAT517  
      ******************************************************************CAT517  
      * WORK FIELDS                                                    *CAT517  
      ******************************************************************CAT517  
       01  FILLER                        PIC  X(008) VALUE 'WORKFLDS'.  CAT517  
       01  W-WORK-FIELDS.                                               CAT517  
           05  W-ASSET-SEQ-NBR           PIC S9(004) COMP.              CAT517  
           05  W-CUS-NAME-END-LN         PIC S9(004) COMP.              CAT517  
           05  W-NBR-OF-PAY              PIC S9(004) COMP.              CAT517  
           05  W-DATE.                                                  CAT517  
               07  W-DATE-YEAR           PIC  X(04).                    CAT517  
               07  FILLER                PIC  X(01) VALUE '-'.          CAT517  
               07  W-DATE-MM             PIC  X(02).                    CAT517  
               07  FILLER                PIC  X(01) VALUE '-'.          CAT517  
               07  W-DATE-DD             PIC  X(02).                    CAT517  
           05  W-SUB1                    PIC  9(004) VALUE 0.           CAT517  
           05  W-SUB2                    PIC  9(004) VALUE 0.           CAT517  
           05  W-NA-LINE-CNT             PIC  9(003) VALUE 0.           CAT517  
           05  W-PAYABLE-CNT             PIC  9(003) VALUE 0.           CAT517  
           05  W-PAYABLE-NA-LINE-CNT     PIC  9(003) VALUE 0.           CAT517  
           05  W-NA-LINES.                                              CAT517  
               07  W-NA-LINE OCCURS 6 TIMES PIC  X(035).                CAT517  
DJ0004     05  W-CLIENT-X                PIC  X(003).                   CAT517  
DJ0004     05  W-CLIENT-NUM REDEFINES                                   CAT517  
DJ0004         W-CLIENT-X                PIC  9(003).                   CAT517  
      /                                                                 CAT517  
      ******************************************************************CAT517  
      * NSCC EXTRACT FILE                                              *CAT517  
      ******************************************************************CAT517  
       01  FILLER PIC X(016) VALUE 'CURRENT-RECORD='.                   CAT517  
       01  FILLER                        PIC X(008) VALUE 'W-NSCC'.     CAT517  
           COPY NSCCMEXT REPLACING ==:NSCCMEXT:==  BY ==W-NSCC==.       CAT517  
      /                                                                 CAT517  
      ******************************************************************CAT517  
      * GETMSD COMMAREA                                                *CAT517  
      ******************************************************************CAT517  
       01  FILLER                        PIC X(08) VALUE 'GETMSDCE'.    CAT517  
           COPY GETMSDCE.                                               CAT517  
      /                                                                 CAT517  
       01  FILLER                        PIC  X(08) VALUE 'BHINFO  '.   CAT517  
           COPY BHINFO.                                                 CAT517  
      /                                                                 CAT517  
       01  FILLER                        PIC  X(008) VALUE 'BHACAT  '.  CAT517  
           COPY BHACAT.                                                 CAT517  
      /                                                                 CAT517  
       01  FILLER                        PIC  X(008) VALUE 'BPDATESC'.  CAT517  
                                                                        CAT517  
           COPY BPDATESC.                                               CAT517  
      /                                                                 CAT517  
       01  FILLER                        PIC X(008) VALUE 'SQLCA   '.   CAT517  
           EXEC SQL INCLUDE SQLCA        END-EXEC.                      CAT517  
      /                                                                 CAT517  
       01  FILLER                        PIC X(008) VALUE 'VFNDRGST'.   CAT517  
           EXEC SQL INCLUDE VFNDRGST     END-EXEC.                      CAT517  
                                                                        CAT517  
       01  FILLER                        PIC X(008) VALUE 'VFNDNA'.     CAT517  
           EXEC SQL INCLUDE VFNDNA       END-EXEC.                      CAT517  
                                                                        CAT517  
       01  FILLER                        PIC X(008) VALUE 'VFNDPYBL'.   CAT517  
           EXEC SQL INCLUDE VFNDPYBL     END-EXEC.                      CAT517  
                                                                        CAT517  
       01  FILLER                        PIC X(008) VALUE 'VFNDPYNA'.   CAT517  
           EXEC SQL INCLUDE VFNDPYNA     END-EXEC.                      CAT517  
                                                                        CAT517  
       01  W-DB2-MESSAGE-AREA.                                          CAT517  
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.    CAT517  
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES     CAT517  
                   INDEXED BY W-DB2-IDX.                                CAT517  
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.     CAT517  
                                                                        CAT517  
       01  W-DB2-WORKAREA.                                              CAT517  
           05  ROLLBACK-SQLCA            PIC  X(122).                   CAT517  
           05  ROLLBACK-RETURN           PIC S9(009) COMP.              CAT517  
               88  ROLLBACK-OK                VALUE +0.                 CAT517  
               88  ROLLBACK-AB                VALUE -999 THRU -1        CAT517  
                                                    +1   THRU +999.     CAT517  
           05  COMMIT-SQLCA              PIC  X(122).                   CAT517  
           05  COMMIT-RETURN             PIC S9(009) COMP.              CAT517  
               88  COMMIT-OK                  VALUE +0.                 CAT517  
               88  COMMIT-AB                  VALUE -999 THRU -1        CAT517  
                                                    +1   THRU +999.     CAT517  
DJ0001     05  W-COMMIT-CNT              PIC  9(009) VALUE 0.           CAT517  
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(009) VALUE 0.           CAT517  
           05  W-DB2-TABLE-NAME          PIC  X(008).                   CAT517  
           05  W-DB2-ACTION              PIC  X(008).                   CAT517  
           05  W-DB2-SQLCODE             PIC  ---9.                     CAT517  
                                                                        CAT517  
       01  FILLER                        PIC  X(008) VALUE 'TIMESTMP'.  CAT517  
       01  W-CURRENT-TIMESTAMP           PIC  X(026).                   CAT517  
      /                                                                 CAT517  
DJ0002***===> COBOL LE                                                  CAT517  
DJ0002 01  W-ABEND-AREA.                                                CAT517  
DJ0002     05  ABEND-CODE                PIC S9(04) COMP SYNC.          CAT517  
DJ0002 01  CALL-MODULES.                                                CAT517  
DJ0002     05  DSNTIAR                   PIC  X(08) VALUE 'DSNTIAR '.   CAT517  
DJ0002 01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.   CAT517  
DJ0002     COPY STUBCPY.                                                CAT517  
DJ0002***<=== COBOL LE                                                  CAT517  
                                                                        CAT517  
       01  FILLER                        PIC  X(008) VALUE 'END-O-WS'.  CAT517  
      /                                                                 CAT517  
      ***************************************************************** CAT517  
      *    LINKAGE SECTION                                            * CAT517  
      ***************************************************************** CAT517  
       LINKAGE SECTION.                                                 CAT517  
       01  L-JCL-PARMS.                                                 CAT517  
           05  PARMLENGTH                PIC S9(004) COMP SYNC.         CAT517  
           05  L-BYP-DATECHK-SW          PIC  X(001).                   CAT517  
               88  L-BYP-DATECHK                     VALUE '1'.         CAT517  
           05  L-BYP-FILECHK-SW          PIC  X(001).                   CAT517  
               88  L-BYP-FILECHK                     VALUE '1'.         CAT517  
                                                                        CAT517  
       PROCEDURE DIVISION USING L-JCL-PARMS.                            CAT517  
      *                         ===========                             CAT517  
       0000-MAIN SECTION.                                               CAT517  
           DISPLAY 'CAT517 - PROCESS FUND-REG (FR) RECORDS'.            CAT517  
           DISPLAY '         UPDATE  FUND-REG TABLES'.                  CAT517  
           DISPLAY ' '.                                                 CAT517  
           COPY MSGCOBO.                                                CAT517  
           DISPLAY ' '.                                                 CAT517  
                                                                        CAT517  
           PERFORM 1000-INIT           THRU 1000-EXIT.                  CAT517  
                                                                        CAT517  
           PERFORM 2000-PROCESS-INPUT THRU 2000-EXIT                    CAT517  
                   UNTIL END-OF-INPUT.                                  CAT517  
                                                                        CAT517  
           PERFORM 9000-CLOSE-ROUTINE  THRU 9000-EXIT.                  CAT517  
                                                                        CAT517  
           GOBACK.                                                      CAT517  
      /                                                                 CAT517  
       1000-INIT                 SECTION.                               CAT517  
           MOVE '1000-INIT                     ' TO W-ROUTINE-1.        CAT517  
                                                                        CAT517  
           ACCEPT W-SYS-DATE              FROM DATE.                    CAT517  
           ACCEPT W-SYS-TIME              FROM TIME.                    CAT517  
           DISPLAY 'CAT517: SYS-DATE ' W-SYS-DATE                       CAT517  
                          ' SYS-TIME ' W-SYS-TIME.                      CAT517  
                                                                        CAT517  
           DISPLAY ' '.                                                 CAT517  
           DISPLAY 'CAT517: L-BYP-DATECHK-SW = '                        CAT517  
                            L-BYP-DATECHK-SW.                           CAT517  
           DISPLAY 'CAT517: L-BYP-FILECHK-SW = '                        CAT517  
                            L-BYP-FILECHK-SW.                           CAT517  
           IF  L-BYP-DATECHK                                            CAT517  
               DISPLAY 'CAT517: DATE CHECK WILL BE BYPASSED'            CAT517  
           ELSE                                                         CAT517  
               DISPLAY 'CAT517: DATE CHECK WILL BE PERFORMED'           CAT517  
           END-IF.                                                      CAT517  
           IF  L-BYP-FILECHK                                            CAT517  
               DISPLAY 'CAT517: FILE CHECK WILL BE BYPASSED'            CAT517  
           ELSE                                                         CAT517  
               DISPLAY 'CAT517: FILE CHECK WILL BE PERFORMED'           CAT517  
           END-IF.                                                      CAT517  
                                                                        CAT517  
           MOVE 'CAT517'                  TO BPDATES-CALLING-PGM.       CAT517  
           SET  LNKDATZ-REQUEST           TO TRUE.                      CAT517  
           CALL BPDATES  USING BPDATES-PARAMETERS.                      CAT517  
           MOVE BPD-PROC-DATE(3:2)        TO LD-PROC-DATE-YY.           CAT517  
           MOVE BPD-PROC-DATE(5:2)        TO LD-PROC-DATE-MM.           CAT517  
           MOVE BPD-PROC-DATE(7:2)        TO LD-PROC-DATE-DD.           CAT517  
                                                                        CAT517  
           DISPLAY ' '.                                                 CAT517  
           DISPLAY 'CAT517:       BPD-PROC-DATE= ' BPD-PROC-DATE        CAT517  
                                '  LD-PROC-DATE= ' LD-PROC-DATE.        CAT517  
           DISPLAY 'CAT517: BPD-PRIOR-PROC-DATE= ' BPD-PRIOR-PROC-DATE. CAT517  
           DISPLAY ' '.                                                 CAT517  
                                                                        CAT517  
           EXEC SQL                                                     CAT517  
               SET :W-CURRENT-TIMESTAMP = CURRENT TIMESTAMP             CAT517  
           END-EXEC                                                     CAT517  
                                                                        CAT517  
           MOVE SQLCODE TO W-DB2-SQLCODE                                CAT517  
           IF  SQLCODE = +0                                             CAT517  
               DISPLAY 'CAT517: W-CURRENT-TIMESTAMP = '                 CAT517  
                                                    W-CURRENT-TIMESTAMP CAT517  
           ELSE                                                         CAT517  
               DISPLAY '      SQLCODE = ' W-DB2-SQLCODE                 CAT517  
               PERFORM  8000-SQL-ERROR THRU 8000-EXIT                   CAT517  
           END-IF.                                                      CAT517  
                                                                        CAT517  
           DISPLAY ' '.                                                 CAT517  
                                                                        CAT517  
           MOVE '000'                  TO BH-BROKER-NUMBER              CAT517  
                                                                        CAT517  
           OPEN INPUT INFILE.                                           CAT517  
           DISPLAY 'CAT517: INFILE  OPENED FOR INPUT.  STATUS = '       CAT517  
                                               INFILE-STAT.             CAT517  
                                                                        CAT517  
           IF  INFILE-OKAY                                              CAT517  
               CONTINUE                                                 CAT517  
           ELSE                                                         CAT517  
               DISPLAY 'CAT517: ERROR OPENING INFILE'                   CAT517  
               DISPLAY 'CAT517: OPEN STATUS = ' INFILE-STAT             CAT517  
                            '.  INPUT-CNT = ' W-INFILE-CNT              CAT517  
               DISPLAY 'CAT517: U3001 - ABENDING ON BAD FILE STATUS'    CAT517  
               MOVE +3001    TO ABEND-CODE                              CAT517  
               CALL ABEND USING ABEND-CODE                              CAT517  
           END-IF.                                                      CAT517  
                                                                        CAT517  
           PERFORM 1500-CHECK-HDR-REC  THRU 1500-EXIT.                  CAT517  
                                                                        CAT517  
           DISPLAY ' '.                                                 CAT517  
                                                                        CAT517  
       1000-EXIT. EXIT.                                                 CAT517  
      /                                                                 CAT517  
      ******************************************************************CAT517  
      *  READ THE HDR REC  TO GET THE TIMESTAMP                         CAT517  
      *  FOR THE LAST TIME WE TRANSMITTED TO NSCC                       CAT517  
      ******************************************************************CAT517  
       1500-CHECK-HDR-REC        SECTION.                               CAT517  
                                                                        CAT517  
           PERFORM 3000-READ-INPUT THRU 3000-EXIT                       CAT517  
                                                                        CAT517  
           IF  END-OF-INPUT                                             CAT517  
               DISPLAY 'CAT517: END OF INPUT REACHED'                   CAT517  
               IF  L-BYP-FILECHK                                        CAT517  
                   DISPLAY 'CAT517: BYPASSING FILE CHECK PER JCLPARM'   CAT517  
                   GO TO 1500-EXIT                                      CAT517  
               ELSE                                                     CAT517  
                   DISPLAY 'CAT517: U3003 - ABENDING ON EMPTY FILE'     CAT517  
                   MOVE +3003    TO ABEND-CODE                          CAT517  
                   CALL ABEND USING ABEND-CODE                          CAT517  
               END-IF                                                   CAT517  
           END-IF.                                                      CAT517  
           IF  INFILE-HDR-RECORD                                        CAT517  
               SET INFILE-DATE-FOUND TO TRUE                            CAT517  
               DISPLAY 'CAT517: INFILE  DATE = '                        CAT517  
                                              INFILE-HDR-PROC-DATE      CAT517  
                             ', UPDT BY PGM=' INFILE-HDR-PGM-NAME       CAT517  
                                     ' DATE=' INFILE-HDR-SYS-DATE       CAT517  
                                     ' TIME=' INFILE-HDR-SYS-TIME       CAT517  
               IF  INFILE-HDR-PROC-DATE = LD-PROC-DATE                  CAT517  
                   DISPLAY 'CAT517: INFILE  DATE = PROC DATE. OKAY'     CAT517  
               ELSE                                                     CAT517  
                   DISPLAY 'CAT517: INFILE  DATE NOT = PROC DATE'       CAT517  
                   IF L-BYP-DATECHK                                     CAT517  
                   DISPLAY 'CAT517: BYPASSING DATE CHECK PER JCLPARM'   CAT517  
                   ELSE                                                 CAT517  
                      DISPLAY 'CAT517: U3004 - ABENDING ON BAD DATE'    CAT517  
                      MOVE +3004    TO ABEND-CODE                       CAT517  
                      CALL ABEND USING ABEND-CODE                       CAT517  
                   END-IF                                               CAT517  
               END-IF                                                   CAT517  
           ELSE                                                         CAT517  
               DISPLAY 'CAT517: INFILE  DATE RECORD MISSING'            CAT517  
                   IF L-BYP-DATECHK                                     CAT517  
                   DISPLAY 'CAT517: BYPASSING DATE CHECK PER JCLPARM'   CAT517  
                   ELSE                                                 CAT517  
                      DISPLAY 'CAT517: U3005 - ABENDING ON BAD DATE'    CAT517  
                      MOVE +3005    TO ABEND-CODE                       CAT517  
                      CALL ABEND USING ABEND-CODE                       CAT517  
                   END-IF                                               CAT517  
           END-IF.                                                      CAT517  
                                                                        CAT517  
           DISPLAY 'CAT517: INBOUND-CYCLE-NBR     = '                   CAT517  
                                         INFILE-HDR-CYCLE-NBR           CAT517  
                                                                        CAT517  
           DISPLAY ' '.                                                 CAT517  
                                                                        CAT517  
       1500-EXIT. EXIT.                                                 CAT517  
      /                                                                 CAT517  
      ******************************************************************CAT517  
      *  READ THE NSCC FILE AND PROCESS ONLY FUND-REG ('F') RECORDS.    CAT517  
      ******************************************************************CAT517  
       2000-PROCESS-INPUT        SECTION.                               CAT517  
           MOVE '2000-PROCESS-INPUT         ' TO W-ROUTINE-1.           CAT517  
                                                                        CAT517  
           PERFORM 3000-READ-INPUT THRU 3000-EXIT                       CAT517  
                                                                        CAT517  
           IF  END-OF-INPUT                                             CAT517  
               CONTINUE                                                 CAT517  
           ELSE                                                         CAT517  
               EVALUATE W-NSCC-REC-SUBTYPE                              CAT517  
                   WHEN 'F'    PERFORM 4000-LOAD      THRU 4000-EXIT    CAT517  
               END-EVALUATE                                             CAT517  
           END-IF.                                                      CAT517  
                                                                        CAT517  
       2000-EXIT. EXIT.                                                 CAT517  
      /                                                                 CAT517  
      ******************************************************************CAT517  
      *  READ THE NSCC FILE AND MOVE TO WORKING-STORAGE.                CAT517  
      ******************************************************************CAT517  
       3000-READ-INPUT           SECTION.                               CAT517  
           MOVE '3000-READ-INPUT            ' TO W-ROUTINE-1.           CAT517  
                                                                        CAT517  
           IF  END-OF-INPUT                                             CAT517  
               DISPLAY 'CAT517: WARNING - READING AFTER EOF'            CAT517  
               GO 3000-EXIT                                             CAT517  
           END-IF.                                                      CAT517  
                                                                        CAT517  
           READ INFILE                                                  CAT517  
                AT END                                                  CAT517  
                   MOVE '1'              TO END-OF-INPUT-SW             CAT517  
                   DISPLAY 'CAT517: END OF INPUT REACHED'               CAT517  
                            '.  INPUT-CNT = ' W-INFILE-CNT              CAT517  
                   GO TO 3000-EXIT                                      CAT517  
           END-READ.                                                    CAT517  
                                                                        CAT517  
           ADD  1                        TO W-INFILE-CNT.               CAT517  
                                                                        CAT517  
           IF  INFILE-OKAY                                              CAT517  
               CONTINUE                                                 CAT517  
           ELSE                                                         CAT517  
               DISPLAY 'CAT517: ERROR READING INFILE'                   CAT517  
               DISPLAY 'CAT517: READ STATUS = ' INFILE-STAT             CAT517  
                            '.  INPUT-CNT = ' W-INFILE-CNT              CAT517  
               DISPLAY 'CAT517: U3006 - ABENDING ON BAD FILE STATUS'    CAT517  
               MOVE +3006    TO ABEND-CODE                              CAT517  
               CALL ABEND USING ABEND-CODE                              CAT517  
           END-IF.                                                      CAT517  
                                                                        CAT517  
           MOVE SPACES                   TO W-NSCC-RECORD               CAT517  
           MOVE W-REC-LEN-IN             TO W-REC-LEN-OUT               CAT517  
                                                                        CAT517  
           MOVE INFILE-RECORD   (1 : W-REC-LEN-IN) TO                   CAT517  
                W-NSCC-RECORD   (1 : W-REC-LEN-IN)                      CAT517  
                                                                        CAT517  
           IF  INFILE-HDR-RECORD                                        CAT517  
               DISPLAY 'CAT517: INFILE-HDR-REC= '                       CAT517  
                                                 INFILE-HDR-REC (1:120) CAT517  
               GO TO 3000-EXIT                                          CAT517  
           ELSE                                                         CAT517  
               IF  INFILE-TRL-RECORD                                    CAT517  
               DISPLAY 'CAT517: INFILE-TRL-REC= '                       CAT517  
                                                 INFILE-TRL-REC (1:120) CAT517  
               DISPLAY 'CAT517: INFILE-TRL-REC-CNT = '                  CAT517  
                                                     INFILE-TRL-REC-CNT CAT517  
               DISPLAY 'CAT517: W-DETAIL-CNT       = '                  CAT517  
                                                     W-DETAIL-CNT       CAT517  
               GO TO 3000-READ-INPUT                                    CAT517  
               END-IF                                                   CAT517  
           END-IF.                                                      CAT517  
                                                                        CAT517  
           ADD  1                        TO W-DETAIL-CNT.               CAT517  
                                                                        CAT517  
           EVALUATE W-NSCC-REC-SUBTYPE                                  CAT517  
                    WHEN 'F'      ADD 1 TO W-FR-CNT                     CAT517  
           END-EVALUATE                                                 CAT517  
                                                                        CAT517  
           IF  W-NSCC-KEY-CLIENT-NBR(2:3) > '000'                       CAT517  
               IF  W-NSCC-KEY-CLIENT-NBR(2:3) = BH-BROKER-NUMBER        CAT517  
                   CONTINUE                                             CAT517  
               ELSE                                                     CAT517  
                   PERFORM 3500-GETB1 THRU 3500-EXIT                    CAT517  
               END-IF                                                   CAT517  
           END-IF.                                                      CAT517  
                                                                        CAT517  
           IF   W-NSCC-REC-SUBTYPE = 'F'                                CAT517  
                MOVE W-NSCC-ASSET-SEQ-NBR     TO W-ASSET-SEQ-NBR        CAT517  
           ELSE                                                         CAT517  
                MOVE ZEROES                   TO W-ASSET-SEQ-NBR        CAT517  
           END-IF.                                                      CAT517  
                                                                        CAT517  
       3000-EXIT. EXIT.                                                 CAT517  
      /                                                                 CAT517  
       3500-GETB1                SECTION.                               CAT517  
                                                                        CAT517  
           MOVE  ' '                       TO BH-BROKER-HEADER-INFO     CAT517  
                                              BH-ACAT-INFO              CAT517  
           MOVE W-NSCC-KEY-CLIENT-NBR(2:3) TO BH-BROKER-NUMBER          CAT517  
           MOVE  '015'                     TO BH-LOGICAL-RECORD-CODE    CAT517  
           MOVE  '434500'                  TO BH-B2-INFO-ID             CAT517  
           CALL  GETB1V                 USING BH-BROKER-HEADER-INFO,    CAT517  
                                              BH-ACAT-INFO              CAT517  
           END-CALL.                                                    CAT517  
           DISPLAY ' '                                                  CAT517  
           DISPLAY 'NEW-CLIENT = ' BH-BROKER-NUMBER                     CAT517  
                                       ' ' BH-BROKER-NAME               CAT517  
                               ' BRK-NO= ' BH-BROKER-OLD-CLEARING-HOUSE CAT517  
           DISPLAY ' '.                                                 CAT517  
       3500-EXIT. EXIT.                                                 CAT517  
      /                                                                 CAT517  
      ******************************************************************CAT517  
      *                                                                 CAT517  
      *     1. UPDATE THE ACTIVE-TABLE.                                 CAT517  
      *                                                                 CAT517  
      ******************************************************************CAT517  
       4000-LOAD                 SECTION.                               CAT517  
           MOVE '4000-LOAD                  ' TO W-ROUTINE-1.           CAT517  
                                                                        CAT517  
           ADD 1 TO W-LOAD-CNT                                          CAT517  
                                                                        CAT517  
           IF  W-NSCC-SYSTEM-ACTION = '2'                               CAT517  
               DISPLAY 'INP=' W-INFILE-CNT                              CAT517  
                            ' CLT=' W-NSCC-KEY-CLIENT-NBR               CAT517  
                            ' CTL=' W-NSCC-FR-ACAT-CTL-NBR              CAT517  
                            ' SEQ=' W-ASSET-SEQ-NBR                     CAT517  
                            ' ACT=' W-NSCC-SYSTEM-ACTION                CAT517  
                            ' REJ=' W-NSCC-SYSTEM-REJ-RSN               CAT517  
                            ' STA=' W-NSCC-STATUS                       CAT517  
                            ' SYSTEM REJECTED'                          CAT517  
                            ' BYPASS ADD/UPDATE'                        CAT517  
               GO TO 4000-EXIT                                          CAT517  
           END-IF                                                       CAT517  
                                                                        CAT517  
           PERFORM 4100-FNDRGST-UPDATE        THRU 4100-EXIT            CAT517  
                                                                        CAT517  
           IF   W-NA-LINE-CNT > 0                                       CAT517  
                PERFORM 4200-FNDNA-UPDATE     THRU 4200-EXIT            CAT517  
                        VARYING W-SUB1 FROM 1 BY 1                      CAT517  
                        UNTIL W-SUB1 > W-NA-LINE-CNT                    CAT517  
           END-IF                                                       CAT517  
                                                                        CAT517  
           IF   W-PAYABLE-CNT > 0                                       CAT517  
                PERFORM 4300-FNDPYBL-UPDATE   THRU 4300-EXIT            CAT517  
                        VARYING W-SUB1 FROM 1 BY 1                      CAT517  
                        UNTIL W-SUB1 > W-PAYABLE-CNT                    CAT517  
           END-IF                                                       CAT517  
                                                                        CAT517  
DJ0001     PERFORM 7100-SQL-COMMIT THRU 7100-EXIT.                      CAT517  
                                                                        CAT517  
       4000-EXIT. EXIT.                                                 CAT517  
      /                                                                 CAT517  
       4100-FNDRGST-UPDATE       SECTION.                               CAT517  
           MOVE '4100-FNDRGST-UPDATE        ' TO W-ROUTINE-1.           CAT517  
                                                                        CAT517  
           PERFORM 5100-MOVE-NSCC-TO-ACTIVE THRU 5100-EXIT              CAT517  
                                                                        CAT517  
           PERFORM 6100-UPDATE-VFNDRGST THRU 6100-EXIT                  CAT517  
                                                                        CAT517  
           IF  SQLCODE  =  +0                                           CAT517  
               ADD 1 TO W-VFNDRGST-UPD-CNT                              CAT517  
           ELSE                                                         CAT517  
               ADD 1 TO W-VFNDRGST-NOT-UPD-CNT                          CAT517  
***************DISPLAY*'INP='*W-INFILE-CNT******************************CAT517  
****************************'*CLT='*W-NSCC-KEY-CLIENT-NBR***************CAT517  
****************************'*CTL='*W-NSCC-FR-ACAT-CTL-NBR**************CAT517  
****************************'*SEQ='*W-ASSET-SEQ-NBR*********************CAT517  
****************************'*VFNDRGST*NOT*UPDATED'*********************CAT517  
****************************'*SQLCODE='*W-DB2-SQLCODE*******************CAT517  
               IF  SQLCODE  =  +100                                     CAT517  
                                                                        CAT517  
                   PERFORM 4150-FNDRGST-NOTFND   THRU 4150-EXIT         CAT517  
                                                                        CAT517  
               ELSE                                                     CAT517  
                   PERFORM  8000-SQL-ERROR THRU 8000-EXIT               CAT517  
               END-IF                                                   CAT517  
           END-IF.                                                      CAT517  
                                                                        CAT517  
       4100-EXIT. EXIT.                                                 CAT517  
      /                                                                 CAT517  
       4150-FNDRGST-NOTFND       SECTION.                               CAT517  
           MOVE '4150-FNDRGST-NOTFND        ' TO W-ROUTINE-1.           CAT517  
                                                                        CAT517  
           PERFORM 6120-INSERT-VFNDRGST  THRU 6120-EXIT                 CAT517  
                                                                        CAT517  
           IF  SQLCODE  =  +0                                           CAT517  
               ADD 1 TO W-VFNDRGST-ADD-CNT                              CAT517  
           ELSE                                                         CAT517  
               ADD 1 TO W-VFNDRGST-NOT-ADD-CNT                          CAT517  
               DISPLAY 'INP=' W-INFILE-CNT                              CAT517  
                            ' CLT=' W-NSCC-KEY-CLIENT-NBR               CAT517  
                            ' CTL=' W-NSCC-FR-ACAT-CTL-NBR              CAT517  
                            ' SEQ=' W-ASSET-SEQ-NBR                     CAT517  
                            ' VFNDRGST NOT INSERTED'                    CAT517  
                            ' SQLCODE=' W-DB2-SQLCODE                   CAT517  
               IF  SQLCODE  =  -803                                     CAT517  
                   CONTINUE                                             CAT517  
               ELSE                                                     CAT517  
                   PERFORM  8000-SQL-ERROR THRU 8000-EXIT               CAT517  
               END-IF                                                   CAT517  
           END-IF.                                                      CAT517  
                                                                        CAT517  
       4150-EXIT. EXIT.                                                 CAT517  
      /                                                                 CAT517  
       4200-FNDNA-UPDATE         SECTION.                               CAT517  
           MOVE '4200-FNDNA-UPDATE          ' TO W-ROUTINE-1.           CAT517  
                                                                        CAT517  
           PERFORM 5200-MOVE-FNDNA          THRU 5200-EXIT              CAT517  
                                                                        CAT517  
           PERFORM  6200-UPDATE-VFNDNA THRU 6200-EXIT                   CAT517  
                                                                        CAT517  
           IF  SQLCODE  =  +0                                           CAT517  
               ADD 1 TO W-VFNDNA-UPD-CNT                                CAT517  
           ELSE                                                         CAT517  
               ADD 1 TO W-VFNDNA-NOT-UPD-CNT                            CAT517  
***************DISPLAY*'INP='*W-INFILE-CNT******************************CAT517  
****************************'*CLT='*W-NSCC-KEY-CLIENT-NBR***************CAT517  
****************************'*CTL='*W-NSCC-FR-ACAT-CTL-NBR**************CAT517  
****************************'*SEQ='*W-ASSET-SEQ-NBR*********************CAT517  
****************************'*SUB='*W-SUB1******************************CAT517  
****************************'*VFNDNA*NOT*UPDATED'***********************CAT517  
****************************'*SQLCODE='*W-DB2-SQLCODE*******************CAT517  
               IF  SQLCODE  =  +100                                     CAT517  
                                                                        CAT517  
                   PERFORM 4250-FNDNA-NOTFND     THRU 4250-EXIT         CAT517  
                                                                        CAT517  
               ELSE                                                     CAT517  
                   PERFORM  8000-SQL-ERROR THRU 8000-EXIT               CAT517  
               END-IF                                                   CAT517  
           END-IF.                                                      CAT517  
                                                                        CAT517  
       4200-EXIT. EXIT.                                                 CAT517  
      /                                                                 CAT517  
       4250-FNDNA-NOTFND         SECTION.                               CAT517  
           MOVE '4250-FNDNA-NOTFND          ' TO W-ROUTINE-1.           CAT517  
                                                                        CAT517  
           PERFORM  6250-INSERT-VFNDNA THRU 6250-EXIT                   CAT517  
                                                                        CAT517  
           IF  SQLCODE  =  +0                                           CAT517  
               ADD 1 TO W-VFNDNA-ADD-CNT                                CAT517  
           ELSE                                                         CAT517  
               ADD 1 TO W-VFNDNA-NOT-ADD-CNT                            CAT517  
               DISPLAY 'INP=' W-INFILE-CNT                              CAT517  
                            ' CLT=' W-NSCC-KEY-CLIENT-NBR               CAT517  
                            ' CTL=' W-NSCC-FR-ACAT-CTL-NBR              CAT517  
                            ' SEQ=' W-ASSET-SEQ-NBR                     CAT517  
                            ' SUB=' W-SUB1                              CAT517  
                            ' VFNDNA NOT INSERTED'                      CAT517  
                            ' SQLCODE=' W-DB2-SQLCODE                   CAT517  
               IF  SQLCODE  =  +100                                     CAT517  
                   CONTINUE                                             CAT517  
               ELSE                                                     CAT517  
                   PERFORM  8000-SQL-ERROR THRU 8000-EXIT               CAT517  
               END-IF                                                   CAT517  
           END-IF.                                                      CAT517  
                                                                        CAT517  
       4250-EXIT. EXIT.                                                 CAT517  
      /                                                                 CAT517  
       4300-FNDPYBL-UPDATE       SECTION.                               CAT517  
           MOVE '4300-FNDPYBL-UPDATE        ' TO W-ROUTINE-1.           CAT517  
                                                                        CAT517  
           PERFORM 5300-MOVE-FNDPYBL        THRU 5300-EXIT.             CAT517  
                                                                        CAT517  
           MOVE 0 TO W-PAYABLE-NA-LINE-CNT                              CAT517  
           IF   W-NSCC-FR-PAY-NA-LINE1 (W-SUB1) > ' '                   CAT517  
                ADD 1 TO W-PAYABLE-NA-LINE-CNT                          CAT517  
                MOVE W-NSCC-FR-PAY-NA-LINE1 (W-SUB1) TO W-NA-LINE (1)   CAT517  
           END-IF                                                       CAT517  
           IF   W-NSCC-FR-PAY-NA-LINE2 (W-SUB1) > ' '                   CAT517  
                ADD 1 TO W-PAYABLE-NA-LINE-CNT                          CAT517  
                MOVE W-NSCC-FR-PAY-NA-LINE2 (W-SUB1) TO W-NA-LINE (2)   CAT517  
           END-IF                                                       CAT517  
           IF   W-NSCC-FR-PAY-NA-LINE3 (W-SUB1) > ' '                   CAT517  
                ADD 1 TO W-PAYABLE-NA-LINE-CNT                          CAT517  
                MOVE W-NSCC-FR-PAY-NA-LINE3 (W-SUB1) TO W-NA-LINE (3)   CAT517  
           END-IF                                                       CAT517  
           IF   W-NSCC-FR-PAY-NA-LINE4 (W-SUB1) > ' '                   CAT517  
                ADD 1 TO W-PAYABLE-NA-LINE-CNT                          CAT517  
                MOVE W-NSCC-FR-PAY-NA-LINE4 (W-SUB1) TO W-NA-LINE (4)   CAT517  
           END-IF                                                       CAT517  
           IF   W-NSCC-FR-PAY-NA-LINE5 (W-SUB1) > ' '                   CAT517  
                ADD 1 TO W-PAYABLE-NA-LINE-CNT                          CAT517  
                MOVE W-NSCC-FR-PAY-NA-LINE5 (W-SUB1) TO W-NA-LINE (5)   CAT517  
           END-IF                                                       CAT517  
           IF   W-NSCC-FR-PAY-NA-LINE6 (W-SUB1) > ' '                   CAT517  
                ADD 1 TO W-PAYABLE-NA-LINE-CNT                          CAT517  
                MOVE W-NSCC-FR-PAY-NA-LINE6 (W-SUB1) TO W-NA-LINE (6)   CAT517  
           END-IF                                                       CAT517  
                                                                        CAT517  
***********DISPLAY*'INP='*W-INFILE-CNT**********************************CAT517  
****************************'*CLT='*W-NSCC-KEY-CLIENT-NBR***************CAT517  
****************************'*CTL='*W-NSCC-FR-ACAT-CTL-NBR**************CAT517  
****************************'*SEQ='*W-ASSET-SEQ-NBR*********************CAT517  
********************'*PAYABLE-NBR='*W-SUB1******************************CAT517  
*************************'*NA-CNT='*W-PAYABLE-NA-LINE-CNT***************CAT517  
                                                                        CAT517  
           PERFORM 6300-UPDATE-VFNDPYBL THRU 6300-EXIT                  CAT517  
                                                                        CAT517  
           IF  SQLCODE  =  +0                                           CAT517  
               ADD 1 TO W-VFNDPYBL-UPD-CNT                              CAT517  
           ELSE                                                         CAT517  
               ADD 1 TO W-VFNDPYBL-NOT-UPD-CNT                          CAT517  
***************DISPLAY*'INP='*W-INFILE-CNT******************************CAT517  
****************************'*CLT='*W-NSCC-KEY-CLIENT-NBR***************CAT517  
****************************'*CTL='*W-NSCC-FR-ACAT-CTL-NBR**************CAT517  
****************************'*SEQ='*W-ASSET-SEQ-NBR*********************CAT517  
****************************'*SUB='*W-SUB1******************************CAT517  
****************************'*VFNDPYBL*NOT*UPDATED'*********************CAT517  
****************************'*SQLCODE='*W-DB2-SQLCODE*******************CAT517  
               IF  SQLCODE  =  +100                                     CAT517  
                                                                        CAT517  
                   PERFORM 4350-FNDPYBL-NOTFND   THRU 4350-EXIT         CAT517  
                                                                        CAT517  
               ELSE                                                     CAT517  
                   PERFORM  8000-SQL-ERROR THRU 8000-EXIT               CAT517  
               END-IF                                                   CAT517  
           END-IF.                                                      CAT517  
                                                                        CAT517  
           IF   W-PAYABLE-NA-LINE-CNT > 0                               CAT517  
                PERFORM 4400-FNDPYNA-UPDATE   THRU 4400-EXIT            CAT517  
                        VARYING W-SUB2 FROM 1 BY 1                      CAT517  
                        UNTIL   W-SUB2 > W-PAYABLE-NA-LINE-CNT          CAT517  
           END-IF.                                                      CAT517  
                                                                        CAT517  
       4300-EXIT. EXIT.                                                 CAT517  
      /                                                                 CAT517  
       4350-FNDPYBL-NOTFND       SECTION.                               CAT517  
           MOVE '4350-FNDPYBL-NOTFND        ' TO W-ROUTINE-1.           CAT517  
                                                                        CAT517  
           PERFORM 6350-INSERT-VFNDPYBL  THRU 6350-EXIT                 CAT517  
                                                                        CAT517  
           IF  SQLCODE  =  +0                                           CAT517  
               ADD 1 TO W-VFNDPYBL-ADD-CNT                              CAT517  
           ELSE                                                         CAT517  
               ADD 1 TO W-VFNDPYBL-NOT-ADD-CNT                          CAT517  
               DISPLAY 'INP=' W-INFILE-CNT                              CAT517  
                            ' CLT=' W-NSCC-KEY-CLIENT-NBR               CAT517  
                            ' CTL=' W-NSCC-FR-ACAT-CTL-NBR              CAT517  
                            ' SEQ=' W-ASSET-SEQ-NBR                     CAT517  
                            ' SUB=' W-SUB1                              CAT517  
                            ' VFNDPYBL NOT INSERTED'                    CAT517  
                            ' SQLCODE=' W-DB2-SQLCODE                   CAT517  
               IF  SQLCODE  =  +100                                     CAT517  
                   CONTINUE                                             CAT517  
               ELSE                                                     CAT517  
                   PERFORM  8000-SQL-ERROR THRU 8000-EXIT               CAT517  
               END-IF                                                   CAT517  
           END-IF.                                                      CAT517  
                                                                        CAT517  
           IF   W-PAYABLE-NA-LINE-CNT > 0                               CAT517  
                PERFORM 4400-FNDPYNA-UPDATE   THRU 4400-EXIT            CAT517  
                        VARYING W-SUB2 FROM 1 BY 1                      CAT517  
                        UNTIL   W-SUB2 > W-PAYABLE-NA-LINE-CNT          CAT517  
           END-IF.                                                      CAT517  
                                                                        CAT517  
       4350-EXIT. EXIT.                                                 CAT517  
      /                                                                 CAT517  
       4400-FNDPYNA-UPDATE       SECTION.                               CAT517  
           MOVE '4400-FNDPYNA-UPDATE        ' TO W-ROUTINE-1.           CAT517  
                                                                        CAT517  
           PERFORM 5400-MOVE-FNDPYNA        THRU 5400-EXIT.             CAT517  
                                                                        CAT517  
           PERFORM 6400-UPDATE-VFNDPYNA     THRU 6400-EXIT              CAT517  
                                                                        CAT517  
           IF  SQLCODE  =  +0                                           CAT517  
               ADD 1 TO W-VFNDPYNA-UPD-CNT                              CAT517  
***************DISPLAY*'INP='*W-INFILE-CNT******************************CAT517  
****************************'*CLT='*W-NSCC-KEY-CLIENT-NBR***************CAT517  
****************************'*CTL='*W-NSCC-FR-ACAT-CTL-NBR**************CAT517  
****************************'*SEQ='*W-ASSET-SEQ-NBR*********************CAT517  
****************************'*SUB='*W-SUB1******************************CAT517  
****************************'*SB2='*W-SUB2******************************CAT517  
****************************'*VFNDPYNA*******UPDATED'*******************CAT517  
                                                                        CAT517  
           ELSE                                                         CAT517  
               ADD 1 TO W-VFNDPYNA-NOT-UPD-CNT                          CAT517  
***************DISPLAY*'INP='*W-INFILE-CNT******************************CAT517  
****************************'*CLT='*W-NSCC-KEY-CLIENT-NBR***************CAT517  
****************************'*CTL='*W-NSCC-FR-ACAT-CTL-NBR**************CAT517  
****************************'*SEQ='*W-ASSET-SEQ-NBR*********************CAT517  
****************************'*SUB='*W-SUB1******************************CAT517  
****************************'*SB2='*W-SUB2******************************CAT517  
****************************'*VFNDPYNA*NOT*UPDATED'*********************CAT517  
****************************'*SQLCODE='*W-DB2-SQLCODE*******************CAT517  
               IF  SQLCODE  =  +100                                     CAT517  
                                                                        CAT517  
                   PERFORM 4450-FNDPYNA-NOTFND   THRU 4450-EXIT         CAT517  
                                                                        CAT517  
               ELSE                                                     CAT517  
                   PERFORM  8000-SQL-ERROR THRU 8000-EXIT               CAT517  
               END-IF                                                   CAT517  
           END-IF.                                                      CAT517  
                                                                        CAT517  
       4400-EXIT. EXIT.                                                 CAT517  
      /                                                                 CAT517  
       4450-FNDPYNA-NOTFND       SECTION.                               CAT517  
           MOVE '4450-FNDPYNA-NOTFND        ' TO W-ROUTINE-1.           CAT517  
                                                                        CAT517  
           PERFORM 6450-INSERT-VFNDPYNA  THRU 6450-EXIT                 CAT517  
                                                                        CAT517  
           IF  SQLCODE  =  +0                                           CAT517  
               ADD 1 TO W-VFNDPYNA-ADD-CNT                              CAT517  
           ELSE                                                         CAT517  
               ADD 1 TO W-VFNDPYNA-NOT-ADD-CNT                          CAT517  
               DISPLAY 'INP=' W-INFILE-CNT                              CAT517  
                            ' CLT=' W-NSCC-KEY-CLIENT-NBR               CAT517  
                            ' CTL=' W-NSCC-FR-ACAT-CTL-NBR              CAT517  
                            ' SEQ=' W-ASSET-SEQ-NBR                     CAT517  
                            ' SUB=' W-SUB1                              CAT517  
                            ' SB2=' W-SUB2                              CAT517  
                            ' VFNDPYNA NOT INSERTED'                    CAT517  
                            ' SQLCODE=' W-DB2-SQLCODE                   CAT517  
               IF  SQLCODE  =  +100                                     CAT517  
                   CONTINUE                                             CAT517  
               ELSE                                                     CAT517  
                   PERFORM  8000-SQL-ERROR THRU 8000-EXIT               CAT517  
               END-IF                                                   CAT517  
           END-IF.                                                      CAT517  
                                                                        CAT517  
       4450-EXIT. EXIT.                                                 CAT517  
      /                                                                 CAT517  
      ***************************************************************** CAT517  
      *  MOVE NSCC FIELDS TO ACTIVE TABLE,                              CAT517  
      ***************************************************************** CAT517  
       5100-MOVE-NSCC-TO-ACTIVE  SECTION.                               CAT517  
                                                                        CAT517  
           MOVE SPACES                                   TO DCLVFNDRGST CAT517  
           MOVE W-NSCC-KEY-CLIENT-NBR                                   CAT517  
                                    TO CLIENT-NBR        OF DCLVFNDRGST CAT517  
***********MOVE W-NSCC-DIST-SIDE                                        CAT517  
           IF  W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-DEL-NBR              CAT517  
               MOVE 'D'              TO DSTBN-SIDE-CD    OF DCLVFNDRGST CAT517  
           ELSE                                                         CAT517  
               MOVE 'R'              TO DSTBN-SIDE-CD    OF DCLVFNDRGST CAT517  
           END-IF                                                       CAT517  
                                                                        CAT517  
           MOVE W-NSCC-FR-ACAT-CTL-NBR                                  CAT517  
                                    TO ACAT-CONTROL-NBR  OF DCLVFNDRGST CAT517  
*          MOVE W-ASSET-SEQ-NBR                                         CAT517  
                                   TO ASSET-SEQ-NBR      OF DCLVFNDRGST CAT517  
                                                                        CAT517  
           MOVE W-NSCC-PROC-YEAR   TO W-DATE-YEAR                       CAT517  
           MOVE W-NSCC-PROC-MM     TO W-DATE-MM                         CAT517  
           MOVE W-NSCC-PROC-DD     TO W-DATE-DD                         CAT517  
           MOVE W-DATE             TO PRCS-DT            OF DCLVFNDRGST CAT517  
                                                                        CAT517  
           MOVE W-NSCC-SYSTEM-ACTION                                    CAT517  
                                   TO SYS-ACT-CD         OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-SYSTEM-REJ-RSN                                   CAT517  
                                   TO SYS-RJCT-RSN-CD    OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-REC-TYPE-ST                                   CAT517  
                                   TO RCRD-STTS-CD       OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-REC-LEN-ST                                    CAT517  
                                   TO RCRD-LNGTH-STTS-CD OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-PHSCL-SEQ-ST                                  CAT517  
                                   TO PHSCL-SEQ-STTS-CD  OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-LGCL-SEQ-ST                                   CAT517  
                                   TO LGCL-SEQ-NR-STS-CD OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-TRAN-TYPE-ST                                  CAT517  
                                   TO TRANS-TYPE-STTS-CD OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-ACAT-CTL-ST                                   CAT517  
                                   TO CONTROL-NBR-STS-CD OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-TFR-TYPE-ST                                   CAT517  
                                   TO TRNFR-TYPE-STTS-CD OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-SUB-PART-ST                                   CAT517  
                                   TO SBMT-PRT-NR-STS-CD OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-RCV-ST                                        CAT517  
                                   TO RCV-NBR-STTS-CD    OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-DEL-ST                                        CAT517  
                                   TO DLVR-NBR-STS-CD    OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-ASSET-SEQ-NBR-ST                              CAT517  
                                   TO AST-SEQ-NBR-STS-CD OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-SEC-CNTRY-CD-ST                               CAT517  
                                   TO ISIN-CNTRY-STTS-CD OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-SEC-ID-ST                                     CAT517  
                                   TO ISIN-SEC-IS-STS-CD OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-SEC-CHKDGT-ST                                 CAT517  
                                   TO ISIN-SEC-CD-STS-CD OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-MF-TRAN-TYPE-ST                               CAT517  
                                   TO MF-TRAN-TYP-STS-CD OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-FRAC-IND-ST                                   CAT517  
                                   TO FRCTN-STTS-CD      OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-NRA-TAX-PCT-ST                                CAT517  
                                   TO NRA-TAX-PCT-CD     OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-ATD-ACCR-CD-ST                                CAT517  
                                   TO DSBMT-ACCRL-STS-CD OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-ATD-FRAC-CASH-ST                              CAT517  
                                   TO DSBMT-FRCTN-STS-CD OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-ATD-RESID-CD-ST                               CAT517  
                                   TO DSBMT-RSDL-STS-CD  OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-PHSCL-SHR-IND-ST                              CAT517  
                                   TO BK-PHSC-SHR-STS-CD OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-PI-DEL-IND-ST                                 CAT517  
                                   TO PI-DLVRY-STTS-CD   OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-TPA-NBR-ST                                    CAT517  
                                   TO TPA-NBR-STTS-CD    OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-CUS-NAME-ST                                   CAT517  
                                   TO CUST-NM-STTS-CD    OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-FND-ACCT-IND-ST                               CAT517  
                                   TO FUND-ACCT-STTS-CD  OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-CUS-ACCT-NBR-ST                               CAT517  
                                   TO FND-ACT-NBR-STS-CD OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-EXEC-BRKR-ST                                  CAT517  
                                   TO BRKR-EXCTG-STTS-CD OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-NTWRK-CTL-IND-ST                              CAT517  
                                   TO NTWRK-CNTL-STTS-CD OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-SSN-IND-ST                                    CAT517  
                                   TO SS-TIN-STTS-CD     OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-SSN-NBR-ST                                    CAT517  
                                   TO SS-TIN-NBR-STTS-CD OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-DIV-CD-ST                                     CAT517  
                                   TO DVDND-STTS-CD      OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-WHLDNG-IND-ST                                 CAT517  
                                   TO WTHLD-STTS-CD      OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-PAY-INFO-IND-ST                               CAT517  
                                   TO PYBL-INFO-STTS-CD  OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-CUS-NAME-END-LN-ST                            CAT517  
                                   TO CUST-NM-LN-STTS-CD OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-CUS-ZIP-5-ST                                  CAT517  
                                   TO ZIP5-STTS-CD       OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-CUS-ZIP-4-ST                                  CAT517  
                                   TO ZIP4-STTS-CD       OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-SOCIAL-CD-ST                                  CAT517  
                                   TO SOC-STTS-CD        OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-NAV-ACCT-IND-ST                               CAT517  
                                   TO NAV-ACCT-STTS-CD   OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-MRGN-ACCT-IND-ST                              CAT517  
                                   TO MRGN-ACCT-STTS-CD  OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-CHK-WRTING-PRV-ST                             CAT517  
                                   TO CHCK-WRTNG-STTS-CD OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-STATE-CD-ST                                   CAT517  
                                   TO SL-ST-STTS-CD      OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-CNTRY-CD-ST                                   CAT517  
                                   TO CNTRY-ORGN-STTS-CD OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-ACCT-REP-NAME-ST                              CAT517  
                                   TO ACCT-RR-NM-STTS-CD OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-ACCT-REP-NBR-ST                               CAT517  
                                   TO ACCT-RR-STTS-CD    OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-BRNCH-ID-NBR-ST                               CAT517  
                                   TO BRCH-NBR-STTS-CD   OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-NBR-PAYABLE-ST                                CAT517  
                                   TO PYBL-QTY-STTS-CD   OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-MEMO-FLD-ST                                   CAT517  
                                   TO MEMO-STTS-CD       OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-ACH-IND-ST                                    CAT517  
                                   TO ACH-STTS-CD        OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-PAC-IND-ST                                    CAT517  
                                   TO PAC-STTS-CD        OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-SWP-IND-ST                                    CAT517  
                                   TO SWP-STTS-CD        OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-ROA-LOI-VAL-ST                                CAT517  
                                   TO ROA-LOI-STTS-CD    OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-LOI-NBR-DT-ST                                 CAT517  
                                   TO LOI-STTS-CD        OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-RLT-TRADE-IND-ST                              CAT517  
                                   TO TRD-RLTD-STTS-CD   OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-RLT-ACT-NBR-ST                                CAT517  
                                   TO ACCT-RLTD-STTS-CD  OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-RLT-ACT-NBR-IND-ST                            CAT517  
                                   TO ACCT-RLT-IN-STS-CD OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-SWP-PAC-EFF-DT-ST                             CAT517  
                                   TO SWP-PAC-DT-STTS-CD OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-CDSC-PAY-CD-ST                                CAT517  
                                   TO CDSC-PYMNT-STTS-CD OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-DSBRS-OPT-CD-ST                               CAT517  
                                   TO DSBMT-OPTN-STTS-CD OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-DSBRS-AMT-ST                                  CAT517  
                                   TO DSBMT-AMT-STTS-CD  OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-MNTH-PAY-IND-ST                               CAT517  
                                   TO PYMNT-MO-STTS-CD   OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-PAY-DT-VAL-ST                                 CAT517  
                                   TO PYMNT-DT-STTS-CD   OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-RETIRE-TAX-CD-ST                              CAT517  
                                   TO RTRMT-TAX-STTS-CD  OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-SHLD-BNKACT-NBR-ST                            CAT517  
                                   TO SHR-BNK-ACT-STS-CD OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-SHLD-BNKACT-TYP-ST                            CAT517  
                                   TO SHR-BNK-TYP-STS-CD OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-FIRST-CHK-DT-ST                               CAT517  
                                   TO CHCK-FRS-DT-STS-CD OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-ABA-ROUTE-NBR-ST                              CAT517  
                                   TO ABA-ROTNG-STTS-CD  OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-COST-BASIS-OPT-ST                             CAT517  
                                   TO COST-BS-OPT-STS-CD OF DCLVFNDRGST CAT517  
                                                                        CAT517  
           MOVE W-NSCC-FR-TFR-TYPE                                      CAT517  
                                   TO TRNFR-TYPE-CD      OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-SUB-PART-NBR                                  CAT517  
                                   TO SBMTG-PRTCP-NBR    OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-DEL-NBR                                       CAT517  
                                   TO DLVR-NBR           OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-SEC-CNTRY-CD                                  CAT517  
                                   TO ISIN-CNTRY-CD      OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-SEC-ID                                        CAT517  
                                   TO ISIN-SEC-ISSUE-CD  OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-SEC-CHKDGT                                    CAT517  
                                   TO ISIN-SEC-CDG-CD    OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-MF-TRAN-TYPE                                  CAT517  
                                   TO MF-TRANS-TYPE-CD   OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-FRAC-IND                                      CAT517  
                                   TO FRCTN-CD           OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-NRA-TAX-PCT                                   CAT517  
                                   TO NRA-TAX-PCT        OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-ATD-ACCR-CD                                   CAT517  
                                   TO DSBMT-ACCRL-CD     OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-ATD-CASH-CD                                   CAT517  
                                   TO DSBMT-FRCTN-CSH-CD OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-ATD-RESIDUAL-CD                               CAT517  
                                   TO DSBMT-RSDL-CD      OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-BOOK-SHR-IND                                  CAT517  
                                   TO BK-PHSCL-SHR-CD    OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-PI-DEL-IND                                    CAT517  
                                   TO PI-DLRVY-CD        OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-TPA-NBR                                       CAT517  
                                   TO TPA-NBR            OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-CUS-NAME                                      CAT517  
                                   TO CUST-NM            OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-FND-ACCT-IND                                  CAT517  
                                   TO FUND-ACCT-CD       OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-CUS-ACCT-NBR                                  CAT517  
                                   TO FNBR               OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-EXEC-BRKR                                     CAT517  
                                   TO BRKR-EXCTG-NBR     OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-NTWK-CTL-IND                                  CAT517  
                                   TO NTWRK-CNTL-CD      OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-SSN-IND                                       CAT517  
                                   TO SS-TIN-CD          OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-SSN-NBR                                       CAT517  
                                   TO SS-TIN-NBR         OF DCLVFNDRGST CAT517  
                                                                        CAT517  
*          IF   W-NSCC-FR-DIV-CD = '0' OR '2' OR '3' OR '4'             CAT517  
                MOVE 'C'           TO DVDND-CD           OF DCLVFNDRGST CAT517  
           ELSE                                                         CAT517  
                MOVE 'R'           TO DVDND-CD           OF DCLVFNDRGST CAT517  
           END-IF                                                       CAT517  
*          IF   W-NSCC-FR-DIV-CD = '0' OR '2' OR '5' OR '7'             CAT517  
                MOVE 'C'           TO LTCG-CD            OF DCLVFNDRGST CAT517  
           ELSE                                                         CAT517  
                MOVE 'R'           TO LTCG-CD            OF DCLVFNDRGST CAT517  
           END-IF                                                       CAT517  
*          IF   W-NSCC-FR-DIV-CD = '0' OR '4' OR '5' OR '6'             CAT517  
                MOVE 'C'           TO STCG-CD            OF DCLVFNDRGST CAT517  
           ELSE                                                         CAT517  
                MOVE 'R'           TO STCG-CD            OF DCLVFNDRGST CAT517  
           END-IF                                                       CAT517  
                                                                        CAT517  
           MOVE W-NSCC-FR-WTHOLDNG-IND                                  CAT517  
                                   TO WTHLD-CD           OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-PAY-INFO-IND                                  CAT517  
                                   TO PYBL-INFO-CD       OF DCLVFNDRGST CAT517  
                                                                        CAT517  
*          MOVE W-NSCC-FR-CUS-NAME-END-LN TO W-CUS-NAME-END-LN          CAT517  
           MOVE W-CUS-NAME-END-LN                                       CAT517  
                                   TO NM-END-LN-QTY      OF DCLVFNDRGST CAT517  
                                                                        CAT517  
           MOVE W-NSCC-FR-CUS-ZIP-5                                     CAT517  
                                   TO ZIP5-CD            OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-CUS-ZIP-4                                     CAT517  
                                   TO ZIP4-CD            OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-SOCIAL-CD                                     CAT517  
                                   TO SOC-CD             OF DCLVFNDRGST CAT517  
           IF   W-NSCC-FR-NAV-ACCT-IND  = '1'                           CAT517  
                MOVE 'Y'           TO NAV-ACCT-IND       OF DCLVFNDRGST CAT517  
           ELSE                                                         CAT517  
                MOVE 'N'           TO NAV-ACCT-IND       OF DCLVFNDRGST CAT517  
           END-IF                                                       CAT517  
           IF   W-NSCC-FR-MRGN-ACCT-IND = '1'                           CAT517  
                MOVE 'Y'           TO MRGN-ACCT-IND      OF DCLVFNDRGST CAT517  
           ELSE                                                         CAT517  
                MOVE 'N'           TO MRGN-ACCT-IND      OF DCLVFNDRGST CAT517  
           END-IF                                                       CAT517  
           IF   W-NSCC-FR-CHK-WRTNG-PRVG-IND = '1'                      CAT517  
                MOVE 'Y'           TO CHCK-WRTNG-IND     OF DCLVFNDRGST CAT517  
           ELSE                                                         CAT517  
                MOVE 'N'           TO CHCK-WRTNG-IND     OF DCLVFNDRGST CAT517  
           END-IF                                                       CAT517  
           MOVE W-NSCC-FR-STATE-CD                                      CAT517  
                                   TO SL-ST-CD           OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-CNTRY-CD                                      CAT517  
                                   TO CNTRY-ORGN-CD      OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-ACCT-REP-NAME                                 CAT517  
                                   TO ACCT-RR-NM         OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-ACCT-REP-NBR                                  CAT517  
                                   TO ACCT-RR-CD         OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-BRNCH-ID-NBR                                  CAT517  
                                   TO BRCH-NBR           OF DCLVFNDRGST CAT517  
                                                                        CAT517  
*          IF   W-NSCC-FR-NBR-OF-PAY NUMERIC                            CAT517  
*               MOVE W-NSCC-FR-NBR-OF-PAY TO W-NBR-OF-PAY               CAT517  
*          ELSE                                                         CAT517  
*               MOVE 0                    TO W-NBR-OF-PAY               CAT517  
*          END-IF                                                       CAT517  
           MOVE W-NBR-OF-PAY       TO W-PAYABLE-CNT                     CAT517  
           MOVE W-NBR-OF-PAY       TO PYBL-QTY           OF DCLVFNDRGST CAT517  
                                                                        CAT517  
           MOVE W-NSCC-FR-MEMO-FLD                                      CAT517  
                                   TO MEMO-TXT           OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-ACH-IND                                       CAT517  
                                   TO ACH-IND            OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-PAC-IND                                       CAT517  
                                   TO PAC-IND            OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-SWP-IND                                       CAT517  
                                   TO SWP-IND            OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-ROL-LOI-VAL                                   CAT517  
                                   TO ROA-LOI-AMT        OF DCLVFNDRGST CAT517  
                                                                        CAT517  
           IF   W-NSCC-FR-LOI-NBR-DT > ' '                              CAT517  
                MOVE W-NSCC-FR-LOI-NBR-YEAR  TO W-DATE-YEAR             CAT517  
                MOVE W-NSCC-FR-LOI-NBR-MM    TO W-DATE-MM               CAT517  
                MOVE W-NSCC-FR-LOI-NBR-DD    TO W-DATE-DD               CAT517  
           ELSE                                                         CAT517  
                MOVE '0001'                  TO W-DATE-YEAR             CAT517  
                MOVE '01'                    TO W-DATE-MM               CAT517  
                MOVE '01'                    TO W-DATE-DD               CAT517  
           END-IF                                                       CAT517  
           MOVE W-DATE             TO LOI-DT             OF DCLVFNDRGST CAT517  
                                                                        CAT517  
           IF   W-NSCC-FR-RLT-TRADE-IND = '1'                           CAT517  
                MOVE 'Y'           TO TRD-RLTD-IND       OF DCLVFNDRGST CAT517  
           ELSE                                                         CAT517  
                MOVE 'N'           TO TRD-RLTD-IND       OF DCLVFNDRGST CAT517  
           END-IF                                                       CAT517  
           MOVE W-NSCC-FR-RLT-ACCT-NBR                                  CAT517  
                                   TO ACCT-RLTD-NBR      OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-RLT-ACCT-NBR-IND                              CAT517  
                                   TO ACCT-RLTD-CD       OF DCLVFNDRGST CAT517  
                                                                        CAT517  
           IF   W-NSCC-FR-SWP-PAC-EFF-DT > ' '                          CAT517  
                MOVE W-NSCC-FR-SWP-PAC-EFF-YEAR TO W-DATE-YEAR          CAT517  
                MOVE W-NSCC-FR-SWP-PAC-EFF-MM   TO W-DATE-MM            CAT517  
                MOVE W-NSCC-FR-SWP-PAC-EFF-DD   TO W-DATE-DD            CAT517  
           ELSE                                                         CAT517  
                MOVE '0001'                  TO W-DATE-YEAR             CAT517  
                MOVE '01'                    TO W-DATE-MM               CAT517  
                MOVE '01'                    TO W-DATE-DD               CAT517  
           END-IF                                                       CAT517  
           MOVE W-DATE             TO SWP-PAC-EFFCT-DT   OF DCLVFNDRGST CAT517  
                                                                        CAT517  
           MOVE W-NSCC-FR-CDSC-PAY-CD                                   CAT517  
                                   TO CDSC-PYMNT-CD      OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-DSBRS-OPT-CD                                  CAT517  
                                   TO DSBMT-OPTN-CD      OF DCLVFNDRGST CAT517  
                                                                        CAT517  
*          IF   W-NSCC-FR-DSBRS-OPT-CD = '0'                            CAT517  
                MOVE W-NSCC-FR-DSBRS-AMT-1                              CAT517  
                                   TO DSBMT-AMT          OF DCLVFNDRGST CAT517  
           ELSE                                                         CAT517  
*            IF   W-NSCC-FR-DSBRS-OPT-CD = '1'                          CAT517  
                  MOVE W-NSCC-FR-DSBRS-AMT-2                            CAT517  
                                   TO DSBMT-AMT          OF DCLVFNDRGST CAT517  
             ELSE                                                       CAT517  
*              IF   W-NSCC-FR-DSBRS-OPT-CD = '2' OR '3'                 CAT517  
                    MOVE W-NSCC-FR-DSBRS-AMT-3                          CAT517  
                                   TO DSBMT-AMT          OF DCLVFNDRGST CAT517  
               ELSE                                                     CAT517  
                    MOVE 0         TO DSBMT-AMT          OF DCLVFNDRGST CAT517  
               END-IF                                                   CAT517  
             END-IF                                                     CAT517  
           END-IF.                                                      CAT517  
                                                                        CAT517  
           IF   W-NSCC-FR-PAY-JAN-IND = '1'                             CAT517  
                MOVE 'Y'           TO PYMNT-JAN-IND      OF DCLVFNDRGST CAT517  
           ELSE                                                         CAT517  
                MOVE 'N'           TO PYMNT-JAN-IND      OF DCLVFNDRGST CAT517  
           END-IF                                                       CAT517  
           IF   W-NSCC-FR-PAY-FEB-IND = '1'                             CAT517  
                MOVE 'Y'           TO PYMNT-FEB-IND      OF DCLVFNDRGST CAT517  
           ELSE                                                         CAT517  
                MOVE 'N'           TO PYMNT-FEB-IND      OF DCLVFNDRGST CAT517  
           END-IF                                                       CAT517  
           IF   W-NSCC-FR-PAY-MAR-IND = '1'                             CAT517  
                MOVE 'Y'           TO PYMNT-MAR-IND      OF DCLVFNDRGST CAT517  
           ELSE                                                         CAT517  
                MOVE 'N'           TO PYMNT-MAR-IND      OF DCLVFNDRGST CAT517  
           END-IF                                                       CAT517  
           IF   W-NSCC-FR-PAY-APR-IND = '1'                             CAT517  
                MOVE 'Y'           TO PYMNT-APR-IND      OF DCLVFNDRGST CAT517  
           ELSE                                                         CAT517  
                MOVE 'N'           TO PYMNT-APR-IND      OF DCLVFNDRGST CAT517  
           END-IF                                                       CAT517  
           IF   W-NSCC-FR-PAY-MAY-IND = '1'                             CAT517  
                MOVE 'Y'           TO PYMNT-MAY-IND      OF DCLVFNDRGST CAT517  
           ELSE                                                         CAT517  
                MOVE 'N'           TO PYMNT-MAY-IND      OF DCLVFNDRGST CAT517  
           END-IF                                                       CAT517  
           IF   W-NSCC-FR-PAY-JUN-IND = '1'                             CAT517  
                MOVE 'Y'           TO PYMNT-JUN-IND      OF DCLVFNDRGST CAT517  
           ELSE                                                         CAT517  
                MOVE 'N'           TO PYMNT-JUN-IND      OF DCLVFNDRGST CAT517  
           END-IF                                                       CAT517  
           IF   W-NSCC-FR-PAY-JUL-IND = '1'                             CAT517  
                MOVE 'Y'           TO PYMNT-JUL-IND      OF DCLVFNDRGST CAT517  
           ELSE                                                         CAT517  
                MOVE 'N'           TO PYMNT-JUL-IND      OF DCLVFNDRGST CAT517  
           END-IF                                                       CAT517  
           IF   W-NSCC-FR-PAY-AUG-IND = '1'                             CAT517  
                MOVE 'Y'           TO PYMNT-AUG-IND      OF DCLVFNDRGST CAT517  
           ELSE                                                         CAT517  
                MOVE 'N'           TO PYMNT-AUG-IND      OF DCLVFNDRGST CAT517  
           END-IF                                                       CAT517  
           IF   W-NSCC-FR-PAY-SEP-IND = '1'                             CAT517  
                MOVE 'Y'           TO PYMNT-SEP-IND      OF DCLVFNDRGST CAT517  
           ELSE                                                         CAT517  
                MOVE 'N'           TO PYMNT-SEP-IND      OF DCLVFNDRGST CAT517  
           END-IF                                                       CAT517  
           IF   W-NSCC-FR-PAY-OCT-IND = '1'                             CAT517  
                MOVE 'Y'           TO PYMNT-OCT-IND      OF DCLVFNDRGST CAT517  
           ELSE                                                         CAT517  
                MOVE 'N'           TO PYMNT-OCT-IND      OF DCLVFNDRGST CAT517  
           END-IF                                                       CAT517  
           IF   W-NSCC-FR-PAY-NOV-IND = '1'                             CAT517  
                MOVE 'Y'           TO PYMNT-NOV-IND      OF DCLVFNDRGST CAT517  
           ELSE                                                         CAT517  
                MOVE 'N'           TO PYMNT-NOV-IND      OF DCLVFNDRGST CAT517  
           END-IF                                                       CAT517  
           IF   W-NSCC-FR-PAY-DEC-IND = '1'                             CAT517  
                MOVE 'Y'           TO PYMNT-DEC-IND      OF DCLVFNDRGST CAT517  
           ELSE                                                         CAT517  
                MOVE 'N'           TO PYMNT-DEC-IND      OF DCLVFNDRGST CAT517  
           END-IF                                                       CAT517  
           MOVE W-NSCC-FR-PAY-DT-VAL                                    CAT517  
                                   TO PYMNT-DT-CD        OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-RETIRE-TAX-CD                                 CAT517  
                                   TO RTRMT-TAX-CD       OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-SHRHLD-BNK-ACT-NBR                            CAT517  
                                   TO SHRHR-BNK-ACCT-NBR OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-SHRHLD-BNK-ACT-TYP                            CAT517  
                                   TO SHRHR-BNK-TYPE-CD  OF DCLVFNDRGST CAT517  
                                                                        CAT517  
           IF   W-NSCC-FR-FIRST-CHK-DT   > ' '                          CAT517  
                MOVE W-NSCC-FR-FIRST-CHK-YEAR   TO W-DATE-YEAR          CAT517  
                MOVE W-NSCC-FR-FIRST-CHK-MM     TO W-DATE-MM            CAT517  
                MOVE W-NSCC-FR-FIRST-CHK-DD     TO W-DATE-DD            CAT517  
           ELSE                                                         CAT517  
                MOVE '0001'                  TO W-DATE-YEAR             CAT517  
                MOVE '01'                    TO W-DATE-MM               CAT517  
                MOVE '01'                    TO W-DATE-DD               CAT517  
           END-IF                                                       CAT517  
           MOVE W-DATE             TO CHCK-FRST-DT       OF DCLVFNDRGST CAT517  
                                                                        CAT517  
           MOVE W-NSCC-FR-ABA-ROUTE-NBR                                 CAT517  
                                   TO ABA-ROUTING-NBR    OF DCLVFNDRGST CAT517  
           MOVE W-NSCC-FR-COST-BASIS-CD                                 CAT517  
                                   TO COST-BSS-CD        OF DCLVFNDRGST CAT517  
                                                                        CAT517  
           MOVE W-PGM-NAME           TO PRGM-NM          OF DCLVFNDRGST CAT517  
           MOVE ' '                  TO CICS-TERM-ID-CD  OF DCLVFNDRGST CAT517  
           MOVE W-CURRENT-TIMESTAMP  TO CRT-TMSTP        OF DCLVFNDRGST CAT517  
           MOVE W-CURRENT-TIMESTAMP  TO UPDT-TMSTP       OF DCLVFNDRGST CAT517  
           MOVE 'A'                  TO NSCC-PEND-CD     OF DCLVFNDRGST CAT517  
           MOVE 'Y'                  TO NSCC-ACK-IND     OF DCLVFNDRGST CAT517  
           MOVE '0001-01-01'         TO CERT-DT          OF DCLVFNDRGST CAT517  
           MOVE '0001-01-01'         TO STTLM-ASCTD-DT   OF DCLVFNDRGST CAT517  
           MOVE '0001-01-01'         TO STTLM-DT         OF DCLVFNDRGST CAT517  
                                                                        CAT517  
           PERFORM 5150-GETMSDC THRU 5150-EXIT                          CAT517  
                                                                        CAT517  
           IF  GETMSD-RETURN-VALID                                      CAT517  
               ADD 1 TO W-MSD-FND-CNT                                   CAT517  
               MOVE 'N'            TO W-MSD-NOTFND-SW                   CAT517  
               MOVE MS-ADP-NO      TO SECURITY-ADP-NBR   OF DCLVFNDRGST CAT517  
           ELSE                                                         CAT517  
               ADD 1 TO W-MSD-NOTFND-CNT                                CAT517  
               MOVE 'Y'            TO W-MSD-NOTFND-SW                   CAT517  
               MOVE ' '            TO SECURITY-ADP-NBR   OF DCLVFNDRGST CAT517  
           END-IF                                                       CAT517  
                                                                        CAT517  
           MOVE 0 TO W-NA-LINE-CNT                                      CAT517  
           IF   W-NSCC-FR-CUS-NA-LINE1 > ' '                            CAT517  
                ADD 1 TO W-NA-LINE-CNT                                  CAT517  
                MOVE W-NSCC-FR-CUS-NA-LINE1   TO W-NA-LINE (1)          CAT517  
           END-IF                                                       CAT517  
           IF   W-NSCC-FR-CUS-NA-LINE2 > ' '                            CAT517  
                ADD 1 TO W-NA-LINE-CNT                                  CAT517  
                MOVE W-NSCC-FR-CUS-NA-LINE2   TO W-NA-LINE (2)          CAT517  
           END-IF                                                       CAT517  
           IF   W-NSCC-FR-CUS-NA-LINE3 > ' '                            CAT517  
                ADD 1 TO W-NA-LINE-CNT                                  CAT517  
                MOVE W-NSCC-FR-CUS-NA-LINE3   TO W-NA-LINE (3)          CAT517  
           END-IF                                                       CAT517  
           IF   W-NSCC-FR-CUS-NA-LINE4 > ' '                            CAT517  
                ADD 1 TO W-NA-LINE-CNT                                  CAT517  
                MOVE W-NSCC-FR-CUS-NA-LINE4   TO W-NA-LINE (4)          CAT517  
           END-IF                                                       CAT517  
           IF   W-NSCC-FR-CUS-NA-LINE5 > ' '                            CAT517  
                ADD 1 TO W-NA-LINE-CNT                                  CAT517  
                MOVE W-NSCC-FR-CUS-NA-LINE5   TO W-NA-LINE (5)          CAT517  
           END-IF                                                       CAT517  
           IF   W-NSCC-FR-CUS-NA-LINE6 > ' '                            CAT517  
                ADD 1 TO W-NA-LINE-CNT                                  CAT517  
                MOVE W-NSCC-FR-CUS-NA-LINE6   TO W-NA-LINE (6)          CAT517  
           END-IF                                                       CAT517  
                                                                        CAT517  
DJ0002     MOVE W-NSCC-FR-WHLDNG-IND-ST                                 CAT517  
DJ0002                             TO W8-WTHLD-STTS-CD   OF DCLVFNDRGST CAT517  
DJ0002     MOVE W-NSCC-FR-WTHOLDNG-IND                                  CAT517  
DJ0002                             TO W8-WTHLD-CD        OF DCLVFNDRGST CAT517  
DJ0002     MOVE W-NSCC-FR-W8-CRT-DT-ST                                  CAT517  
DJ0002                             TO W8-CERT-DT-STTS-CD OF DCLVFNDRGST CAT517  
DJ0002     MOVE W-NSCC-FR-W8-EXP-DT-ST                                  CAT517  
DJ0002                             TO W8-EXPTN-DT-STS-CD OF DCLVFNDRGST CAT517  
DJ0002     MOVE W-NSCC-FR-W8-OVR-RT-ST                                  CAT517  
DJ0002                             TO W8-SPCL-RT-STTS-CD OF DCLVFNDRGST CAT517  
DJ0002     MOVE W-NSCC-FR-W8-INTRM-IND-ST                               CAT517  
DJ0002                             TO W8-QLFD-INT-STS-CD OF DCLVFNDRGST CAT517  
DJ0002     MOVE W-NSCC-FR-W8-OVR-CNTRY-ST                               CAT517  
DJ0002                             TO W8-ORD-CTRY-STS-CD OF DCLVFNDRGST CAT517  
DJ0002                                                                  CAT517  
DJ0002     IF   W-NSCC-FR-W8-CRT-DT  > ' '                              CAT517  
DJ0002          MOVE W-NSCC-FR-W8-CRT-YEAR   TO W-DATE-YEAR             CAT517  
DJ0002          MOVE W-NSCC-FR-W8-CRT-MM     TO W-DATE-MM               CAT517  
DJ0002          MOVE W-NSCC-FR-W8-CRT-DD     TO W-DATE-DD               CAT517  
DJ0002     ELSE                                                         CAT517  
DJ0002          MOVE '0001'                  TO W-DATE-YEAR             CAT517  
DJ0002          MOVE '01'                    TO W-DATE-MM               CAT517  
DJ0002          MOVE '01'                    TO W-DATE-DD               CAT517  
DJ0002     END-IF                                                       CAT517  
DJ0002     MOVE W-DATE             TO W8-CERT-DT         OF DCLVFNDRGST CAT517  
                                                                        CAT517  
DJ0002     IF   W-NSCC-FR-W8-EXP-DT  > ' '                              CAT517  
DJ0002          MOVE W-NSCC-FR-W8-EXP-YEAR   TO W-DATE-YEAR             CAT517  
DJ0002          MOVE W-NSCC-FR-W8-EXP-MM     TO W-DATE-MM               CAT517  
DJ0002          MOVE W-NSCC-FR-W8-EXP-DD     TO W-DATE-DD               CAT517  
DJ0002     ELSE                                                         CAT517  
DJ0002          MOVE '0001'                  TO W-DATE-YEAR             CAT517  
DJ0002          MOVE '01'                    TO W-DATE-MM               CAT517  
DJ0002          MOVE '01'                    TO W-DATE-DD               CAT517  
DJ0002     END-IF                                                       CAT517  
DJ0002     MOVE W-DATE             TO W8-EXPTN-DT        OF DCLVFNDRGST CAT517  
                                                                        CAT517  
DJ0002     MOVE W-NSCC-FR-W8-OVR-SPC-RT                                 CAT517  
DJ0002                             TO W8-OVRD-NRA-SPC-RT OF DCLVFNDRGST CAT517  
DJ0002     MOVE W-NSCC-FR-W8-INTRM-IND                                  CAT517  
DJ0002                             TO W8-QULFD-INTRM-IND OF DCLVFNDRGST CAT517  
DJ0002     MOVE W-NSCC-FR-W8-OVR-CNTRY                                  CAT517  
DJ0002                             TO W8-OVRD-CNTRY-CD   OF DCLVFNDRGST CAT517  
                                                                        CAT517  
           DISPLAY 'INP=' W-INFILE-CNT                                  CAT517  
                            ' CLT=' W-NSCC-KEY-CLIENT-NBR               CAT517  
                            ' CTL=' W-NSCC-FR-ACAT-CTL-NBR              CAT517  
                            ' SEQ=' W-ASSET-SEQ-NBR                     CAT517  
                     ' NBR-OF-PAY=' W-PAYABLE-CNT                       CAT517  
                         ' NA-CNT=' W-NA-LINE-CNT                       CAT517  
           .                                                            CAT517  
       5100-EXIT. EXIT.                                                 CAT517  
      /                                                                 CAT517  
       5150-GETMSDC         SECTION.                                    CAT517  
                                                                        CAT517  
           MOVE 'D'                    TO   GETMSD-DEVICE-IND.          CAT517  
           MOVE 'R'                    TO   GETMSD-ACCESS-IND.          CAT517  
           MOVE 'E'                    TO   GETMSD-FORMAT-IND.          CAT517  
DJ0004     MOVE LOW-VALUES             TO   GETMSD-SEARCH-KEY-AREA      CAT517  
           MOVE W-NSCC-FR-SEC-ID       TO   GETMSD-SEARCH-KEY.          CAT517  
           MOVE ALL ZERO               TO   GETMSD-WI-CODE              CAT517  
DJ0004     MOVE W-NSCC-KEY-CLIENT-NBR(2:3) TO W-CLIENT-X                CAT517  
DJ0004     MOVE W-CLIENT-NUM           TO   GETMSD-CLIENT-PL2           CAT517  
                                                                        CAT517  
           CALL GETMSDC               USING MASTER-SECURITY-RECORD.     CAT517  
                                                                        CAT517  
       5150-EXIT. EXIT.                                                 CAT517  
      /                                                                 CAT517  
      ***************************************************************** CAT517  
      *  MOVE NAME AND ADDRESS LINES                                    CAT517  
      ***************************************************************** CAT517  
       5200-MOVE-FNDNA           SECTION.                               CAT517  
                                                                        CAT517  
           INITIALIZE DCLVFNDNA                                         CAT517  
           MOVE W-NSCC-KEY-CLIENT-NBR                                   CAT517  
                                    TO CLIENT-NBR        OF DCLVFNDNA   CAT517  
           MOVE W-NSCC-ACAT-CTL-NBR                                     CAT517  
                                    TO ACAT-CONTROL-NBR  OF DCLVFNDNA   CAT517  
           MOVE W-ASSET-SEQ-NBR                                         CAT517  
                                    TO ASSET-SEQ-NBR     OF DCLVFNDNA   CAT517  
           MOVE W-PGM-NAME          TO PRGM-NM           OF DCLVFNDNA   CAT517  
           MOVE ' '                 TO CICS-TERM-ID-CD   OF DCLVFNDNA   CAT517  
           MOVE W-CURRENT-TIMESTAMP TO CRT-TMSTP         OF DCLVFNDNA   CAT517  
           MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP        OF DCLVFNDNA   CAT517  
                                                                        CAT517  
           MOVE W-SUB1              TO NA-LINE-NBR       OF DCLVFNDNA   CAT517  
           MOVE W-NSCC-FR-CUS-NA-LINE-ST (W-SUB1)                       CAT517  
                                    TO CUST-NA-STTS-CD   OF DCLVFNDNA   CAT517  
           MOVE W-NA-LINE (W-SUB1)                                      CAT517  
                                    TO CUST-NA-LINE-TXT  OF DCLVFNDNA   CAT517  
           .                                                            CAT517  
       5200-EXIT. EXIT.                                                 CAT517  
      /                                                                 CAT517  
      ***************************************************************** CAT517  
      *  MOVE PAYABLE INFORMATION                                       CAT517  
      ***************************************************************** CAT517  
       5300-MOVE-FNDPYBL         SECTION.                               CAT517  
                                                                        CAT517  
           INITIALIZE DCLVFNDPYBL                                       CAT517  
           MOVE W-NSCC-KEY-CLIENT-NBR                                   CAT517  
                                   TO CLIENT-NBR         OF DCLVFNDPYBL CAT517  
           MOVE W-NSCC-ACAT-CTL-NBR                                     CAT517  
                                   TO ACAT-CONTROL-NBR   OF DCLVFNDPYBL CAT517  
           MOVE W-ASSET-SEQ-NBR                                         CAT517  
                                   TO ASSET-SEQ-NBR      OF DCLVFNDPYBL CAT517  
           MOVE W-PGM-NAME          TO PRGM-NM           OF DCLVFNDPYBL CAT517  
           MOVE ' '                 TO CICS-TERM-ID-CD   OF DCLVFNDPYBL CAT517  
           MOVE W-CURRENT-TIMESTAMP TO CRT-TMSTP         OF DCLVFNDPYBL CAT517  
           MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP        OF DCLVFNDPYBL CAT517  
                                                                        CAT517  
           MOVE W-NSCC-FR-PAY-ACCT-NBR-ST   (W-SUB1)                    CAT517  
                                   TO ACCT-PYBL-STTS-CD  OF DCLVFNDPYBL CAT517  
           MOVE W-NSCC-FR-PAY-ZIP-5-ST      (W-SUB1)                    CAT517  
                                   TO ZIP5-STTS-CD       OF DCLVFNDPYBL CAT517  
           MOVE W-NSCC-FR-PAY-ZIP-4-ST      (W-SUB1)                    CAT517  
                                   TO ZIP4-STTS-CD       OF DCLVFNDPYBL CAT517  
           MOVE W-NSCC-FR-PAY-NMEND-LN-ST   (W-SUB1)                    CAT517  
                                   TO NA-END-IND-STTS-CD OF DCLVFNDPYBL CAT517  
           MOVE W-NSCC-FR-PAY-ADDR-OPT-ST   (W-SUB1)                    CAT517  
                                   TO ADDRS-OPTN-STTS-CD OF DCLVFNDPYBL CAT517  
           MOVE W-NSCC-FR-PAY-ACCNBR-IND-ST (W-SUB1)                    CAT517  
                                   TO ACCT-NBR-STTS-CD   OF DCLVFNDPYBL CAT517  
           MOVE W-NSCC-FR-PAY-SEC-CNTRY-ST  (W-SUB1)                    CAT517  
                                   TO ISIN-CNTRY-STTS-CD OF DCLVFNDPYBL CAT517  
           MOVE W-NSCC-FR-PAY-SEC-ID-ST     (W-SUB1)                    CAT517  
                                   TO ISIN-SEC-IS-STS-CD OF DCLVFNDPYBL CAT517  
           MOVE W-NSCC-FR-PAY-SEC-CHKDGT-ST (W-SUB1)                    CAT517  
                                   TO ISIN-SEC-CD-STS-CD OF DCLVFNDPYBL CAT517  
           MOVE W-NSCC-FR-PAY-ALT-IND-ST    (W-SUB1)                    CAT517  
                                   TO PYBL-ALTNT-STTS-CD OF DCLVFNDPYBL CAT517  
           MOVE W-NSCC-FR-PAY-ALT-REASN-ST  (W-SUB1)                    CAT517  
                                   TO PYBL-ALT-RS-STS-CD OF DCLVFNDPYBL CAT517  
           MOVE W-SUB1             TO PYBL-NBR           OF DCLVFNDPYBL CAT517  
           MOVE W-NSCC-FR-PAY-ACT-NBR       (W-SUB1)                    CAT517  
                                   TO ACCT-NBR           OF DCLVFNDPYBL CAT517  
           MOVE W-NSCC-FR-PAY-ZIP-5         (W-SUB1)                    CAT517  
                                   TO ZIP5-CD            OF DCLVFNDPYBL CAT517  
           MOVE W-NSCC-FR-PAY-ZIP-4         (W-SUB1)                    CAT517  
                                   TO ZIP4-CD            OF DCLVFNDPYBL CAT517  
           MOVE W-NSCC-FR-PAY-NAM-ENDLNE  (W-SUB1)                      CAT517  
                                   TO NA-END-LINE-IND    OF DCLVFNDPYBL CAT517  
           IF  W-NSCC-FR-PAY-ADDR-OPT (W-SUB1) =                        CAT517  
                                      '1' OR '4' OR '5' OR '6'          CAT517  
               MOVE 'Y'            TO ADDRS-DVDND-IND    OF DCLVFNDPYBL CAT517  
           ELSE                                                         CAT517  
               MOVE 'N'            TO ADDRS-DVDND-IND    OF DCLVFNDPYBL CAT517  
           END-IF                                                       CAT517  
           IF  W-NSCC-FR-PAY-ADDR-OPT (W-SUB1) =                        CAT517  
                                      '2' OR '4' OR '6' OR '7'          CAT517  
               MOVE 'Y'            TO ADDRS-SYSWL-IND    OF DCLVFNDPYBL CAT517  
           ELSE                                                         CAT517  
               MOVE 'N'            TO ADDRS-SYSWL-IND    OF DCLVFNDPYBL CAT517  
           END-IF                                                       CAT517  
           IF  W-NSCC-FR-PAY-ADDR-OPT (W-SUB1) =                        CAT517  
                                      '3' OR '4' OR '5' OR '7'          CAT517  
               MOVE 'Y'            TO ADDRS-ATMDF-IND    OF DCLVFNDPYBL CAT517  
           ELSE                                                         CAT517  
               MOVE 'N'            TO ADDRS-ATMDF-IND    OF DCLVFNDPYBL CAT517  
           END-IF                                                       CAT517  
           IF  W-NSCC-FR-PAY-ADDR-OPT (W-SUB1) =                        CAT517  
                                      '8'                               CAT517  
               MOVE 'Y'            TO CRSS-FND-RNVST-IND OF DCLVFNDPYBL CAT517  
           ELSE                                                         CAT517  
               MOVE 'N'            TO CRSS-FND-RNVST-IND OF DCLVFNDPYBL CAT517  
           END-IF                                                       CAT517  
           IF  W-NSCC-FR-PAY-ADDR-OPT (W-SUB1) =                        CAT517  
                                      '9'                               CAT517  
               MOVE 'Y'            TO PYBL-ALTNT-CD      OF DCLVFNDPYBL CAT517  
           ELSE                                                         CAT517  
               MOVE 'N'            TO PYBL-ALTNT-CD      OF DCLVFNDPYBL CAT517  
           END-IF                                                       CAT517  
           MOVE W-NSCC-FR-PAY-ACT-NBR-IND (W-SUB1)                      CAT517  
                                   TO ACCT-PYBL-CD       OF DCLVFNDPYBL CAT517  
           MOVE W-NSCC-FR-PAY-SEC-CNTRY-CD(W-SUB1)                      CAT517  
                                   TO ISIN-CNTRY-CD      OF DCLVFNDPYBL CAT517  
           MOVE W-NSCC-FR-PAY-SEC-ID      (W-SUB1)                      CAT517  
                                   TO ISIN-SEC-ISSUE-CD  OF DCLVFNDPYBL CAT517  
           MOVE W-NSCC-FR-PAY-SEC-CHKDGT  (W-SUB1)                      CAT517  
                                   TO ISIN-SEC-CDG-CD    OF DCLVFNDPYBL CAT517  
           MOVE W-NSCC-FR-PAY-ALT-IND     (W-SUB1)                      CAT517  
                                   TO ALTNT-PYBL-IND     OF DCLVFNDPYBL CAT517  
           MOVE W-NSCC-FR-PAY-ALT-REASN   (W-SUB1)                      CAT517  
                                   TO PYBL-ALTNT-RSN-TXT OF DCLVFNDPYBL CAT517  
           MOVE SECURITY-ADP-NBR OF DCLVFNDRGST                         CAT517  
                                   TO SECURITY-ADP-NBR   OF DCLVFNDPYBL CAT517  
           .                                                            CAT517  
       5300-EXIT. EXIT.                                                 CAT517  
      /                                                                 CAT517  
      ***************************************************************** CAT517  
      *  MOVE PAYABLE NAME AND ADDRESS LINES                            CAT517  
      ***************************************************************** CAT517  
       5400-MOVE-FNDPYNA         SECTION.                               CAT517  
           INITIALIZE DCLVFNDPYNA                                       CAT517  
           MOVE W-NSCC-KEY-CLIENT-NBR                                   CAT517  
                                   TO CLIENT-NBR         OF DCLVFNDPYNA CAT517  
           MOVE W-NSCC-ACAT-CTL-NBR                                     CAT517  
                                   TO ACAT-CONTROL-NBR   OF DCLVFNDPYNA CAT517  
           MOVE W-ASSET-SEQ-NBR                                         CAT517  
                                   TO ASSET-SEQ-NBR      OF DCLVFNDPYNA CAT517  
           MOVE W-PGM-NAME          TO PRGM-NM           OF DCLVFNDPYNA CAT517  
           MOVE ' '                 TO CICS-TERM-ID-CD   OF DCLVFNDPYNA CAT517  
           MOVE W-CURRENT-TIMESTAMP TO CRT-TMSTP         OF DCLVFNDPYNA CAT517  
           MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP        OF DCLVFNDPYNA CAT517  
           MOVE W-SUB1             TO PYBL-NBR           OF DCLVFNDPYNA CAT517  
           MOVE W-SUB2             TO NA-LINE-NBR        OF DCLVFNDPYNA CAT517  
           MOVE W-NA-LINE (W-SUB2)                                      CAT517  
                                   TO PYBL-NA-LINE-TXT   OF DCLVFNDPYNA CAT517  
           MOVE W-NSCC-FR-PAY-NA-STATUS (W-SUB1, W-SUB2)                CAT517  
                                   TO PYBL-NA-LN-STTS-CD OF DCLVFNDPYNA CAT517  
           .                                                            CAT517  
       5400-EXIT. EXIT.                                                 CAT517  
      /                                                                 CAT517  
       6100-UPDATE-VFNDRGST      SECTION.                               CAT517  
           MOVE '6100-UPDATE-VFNDRGST            ' TO W-ROUTINE-1.      CAT517  
                                                                        CAT517  
           EXEC SQL                                                     CAT517  
             UPDATE VFNDRGST                                            CAT517  
                SET                                                     CAT517  
                   DSTBN_SIDE_CD       = :DCLVFNDRGST.DSTBN-SIDE-CD     CAT517  
                  ,PRCS_DT             = :DCLVFNDRGST.PRCS-DT           CAT517  
                  ,SYS_ACT_CD          = :DCLVFNDRGST.SYS-ACT-CD        CAT517  
                  ,SYS_RJCT_RSN_CD     = :DCLVFNDRGST.SYS-RJCT-RSN-CD   CAT517  
                  ,RCRD_STTS_CD        = :DCLVFNDRGST.RCRD-STTS-CD      CAT517  
                  ,RCRD_LNGTH_STTS_CD  = :DCLVFNDRGST.RCRD-LNGTH-STTS-CDCAT517  
                  ,PHSCL_SEQ_STTS_CD   = :DCLVFNDRGST.PHSCL-SEQ-STTS-CD CAT517  
                  ,LGCL_SEQ_NR_STS_CD  = :DCLVFNDRGST.LGCL-SEQ-NR-STS-CDCAT517  
                  ,TRANS_TYPE_STTS_CD  = :DCLVFNDRGST.TRANS-TYPE-STTS-CDCAT517  
                  ,CONTROL_NBR_STS_CD  = :DCLVFNDRGST.CONTROL-NBR-STS-CDCAT517  
                  ,TRNFR_TYPE_STTS_CD  = :DCLVFNDRGST.TRNFR-TYPE-STTS-CDCAT517  
                  ,SBMT_PRT_NR_STS_CD  = :DCLVFNDRGST.SBMT-PRT-NR-STS-CDCAT517  
                  ,RCV_NBR_STTS_CD     = :DCLVFNDRGST.RCV-NBR-STTS-CD   CAT517  
                  ,DLVR_NBR_STS_CD     = :DCLVFNDRGST.DLVR-NBR-STS-CD   CAT517  
                  ,AST_SEQ_NBR_STS_CD  = :DCLVFNDRGST.AST-SEQ-NBR-STS-CDCAT517  
                  ,ISIN_CNTRY_STTS_CD  = :DCLVFNDRGST.ISIN-CNTRY-STTS-CDCAT517  
                  ,ISIN_SEC_IS_STS_CD  = :DCLVFNDRGST.ISIN-SEC-IS-STS-CDCAT517  
                  ,ISIN_SEC_CD_STS_CD  = :DCLVFNDRGST.ISIN-SEC-CD-STS-CDCAT517  
                  ,MF_TRAN_TYP_STS_CD  = :DCLVFNDRGST.MF-TRAN-TYP-STS-CDCAT517  
                  ,FRCTN_STTS_CD       = :DCLVFNDRGST.FRCTN-STTS-CD     CAT517  
                  ,NRA_TAX_PCT_CD      = :DCLVFNDRGST.NRA-TAX-PCT-CD    CAT517  
                  ,DSBMT_ACCRL_STS_CD  = :DCLVFNDRGST.DSBMT-ACCRL-STS-CDCAT517  
                  ,DSBMT_FRCTN_STS_CD  = :DCLVFNDRGST.DSBMT-FRCTN-STS-CDCAT517  
                  ,DSBMT_RSDL_STS_CD   = :DCLVFNDRGST.DSBMT-RSDL-STS-CD CAT517  
                  ,BK_PHSC_SHR_STS_CD  = :DCLVFNDRGST.BK-PHSC-SHR-STS-CDCAT517  
                  ,PI_DLVRY_STTS_CD    = :DCLVFNDRGST.PI-DLVRY-STTS-CD  CAT517  
                  ,TPA_NBR_STTS_CD     = :DCLVFNDRGST.TPA-NBR-STTS-CD   CAT517  
                  ,CUST_NM_STTS_CD     = :DCLVFNDRGST.CUST-NM-STTS-CD   CAT517  
                  ,FUND_ACCT_STTS_CD   = :DCLVFNDRGST.FUND-ACCT-STTS-CD CAT517  
                  ,FND_ACT_NBR_STS_CD  = :DCLVFNDRGST.FND-ACT-NBR-STS-CDCAT517  
                  ,BRKR_EXCTG_STTS_CD  = :DCLVFNDRGST.BRKR-EXCTG-STTS-CDCAT517  
                  ,NTWRK_CNTL_STTS_CD  = :DCLVFNDRGST.NTWRK-CNTL-STTS-CDCAT517  
                  ,SS_TIN_STTS_CD      = :DCLVFNDRGST.SS-TIN-STTS-CD    CAT517  
                  ,SS_TIN_NBR_STTS_CD  = :DCLVFNDRGST.SS-TIN-NBR-STTS-CDCAT517  
                  ,DVDND_STTS_CD       = :DCLVFNDRGST.DVDND-STTS-CD     CAT517  
                  ,WTHLD_STTS_CD       = :DCLVFNDRGST.WTHLD-STTS-CD     CAT517  
                  ,PYBL_INFO_STTS_CD   = :DCLVFNDRGST.PYBL-INFO-STTS-CD CAT517  
???               ,CUST_NM_LN_STTS_CD  = :DCLVFNDRGST.CUST-NM-LN-STTS-CDCAT517  
???               ,NM_END_LN_STTS_CD   = :DCLVFNDRGST.NM-END-LN-STTS-CD CAT517  
                  ,ZIP5_STTS_CD        = :DCLVFNDRGST.ZIP5-STTS-CD      CAT517  
                  ,ZIP4_STTS_CD        = :DCLVFNDRGST.ZIP4-STTS-CD      CAT517  
                  ,SOC_STTS_CD         = :DCLVFNDRGST.SOC-STTS-CD       CAT517  
                  ,NAV_ACCT_STTS_CD    = :DCLVFNDRGST.NAV-ACCT-STTS-CD  CAT517  
                  ,MRGN_ACCT_STTS_CD   = :DCLVFNDRGST.MRGN-ACCT-STTS-CD CAT517  
                  ,CHCK_WRTNG_STTS_CD  = :DCLVFNDRGST.CHCK-WRTNG-STTS-CDCAT517  
                  ,SL_ST_STTS_CD       = :DCLVFNDRGST.SL-ST-STTS-CD     CAT517  
                  ,CNTRY_ORGN_STTS_CD  = :DCLVFNDRGST.CNTRY-ORGN-STTS-CDCAT517  
                  ,ACCT_RR_NM_STTS_CD  = :DCLVFNDRGST.ACCT-RR-NM-STTS-CDCAT517  
                  ,ACCT_RR_STTS_CD     = :DCLVFNDRGST.ACCT-RR-STTS-CD   CAT517  
                  ,BRCH_NBR_STTS_CD    = :DCLVFNDRGST.BRCH-NBR-STTS-CD  CAT517  
                  ,PYBL_QTY_STTS_CD    = :DCLVFNDRGST.PYBL-QTY-STTS-CD  CAT517  
                  ,MEMO_STTS_CD        = :DCLVFNDRGST.MEMO-STTS-CD      CAT517  
                  ,ACH_STTS_CD         = :DCLVFNDRGST.ACH-STTS-CD       CAT517  
                  ,PAC_STTS_CD         = :DCLVFNDRGST.PAC-STTS-CD       CAT517  
                  ,SWP_STTS_CD         = :DCLVFNDRGST.SWP-STTS-CD       CAT517  
                  ,ROA_LOI_STTS_CD     = :DCLVFNDRGST.ROA-LOI-STTS-CD   CAT517  
                  ,TRD_RLTD_STTS_CD    = :DCLVFNDRGST.TRD-RLTD-STTS-CD  CAT517  
                  ,LOI_STTS_CD         = :DCLVFNDRGST.LOI-STTS-CD       CAT517  
                  ,ACCT_RLTD_STTS_CD   = :DCLVFNDRGST.ACCT-RLTD-STTS-CD CAT517  
                  ,ACCT_RLT_IN_STS_CD  = :DCLVFNDRGST.ACCT-RLT-IN-STS-CDCAT517  
                  ,SWP_PAC_DT_STTS_CD  = :DCLVFNDRGST.SWP-PAC-DT-STTS-CDCAT517  
                  ,CDSC_PYMNT_STTS_CD  = :DCLVFNDRGST.CDSC-PYMNT-STTS-CDCAT517  
                  ,DSBMT_OPTN_STTS_CD  = :DCLVFNDRGST.DSBMT-OPTN-STTS-CDCAT517  
                  ,DSBMT_AMT_STTS_CD   = :DCLVFNDRGST.DSBMT-AMT-STTS-CD CAT517  
                  ,PYMNT_MO_STTS_CD    = :DCLVFNDRGST.PYMNT-MO-STTS-CD  CAT517  
                  ,PYMNT_DT_STTS_CD    = :DCLVFNDRGST.PYMNT-DT-STTS-CD  CAT517  
                  ,RTRMT_TAX_STTS_CD   = :DCLVFNDRGST.RTRMT-TAX-STTS-CD CAT517  
                  ,SHR_BNK_ACT_STS_CD  = :DCLVFNDRGST.SHR-BNK-ACT-STS-CDCAT517  
                  ,SHR_BNK_TYP_STS_CD  = :DCLVFNDRGST.SHR-BNK-TYP-STS-CDCAT517  
                  ,CHCK_FRS_DT_STS_CD  = :DCLVFNDRGST.CHCK-FRS-DT-STS-CDCAT517  
                  ,ABA_ROTNG_STTS_CD   = :DCLVFNDRGST.ABA-ROTNG-STTS-CD CAT517  
                  ,COST_BS_OPT_STS_CD  = :DCLVFNDRGST.COST-BS-OPT-STS-CDCAT517  
                  ,TRNFR_TYPE_CD       = :DCLVFNDRGST.TRNFR-TYPE-CD     CAT517  
                  ,SBMTG_PRTCP_NBR     = :DCLVFNDRGST.SBMTG-PRTCP-NBR   CAT517  
                  ,DLVR_NBR            = :DCLVFNDRGST.DLVR-NBR          CAT517  
                  ,ISIN_CNTRY_CD       = :DCLVFNDRGST.ISIN-CNTRY-CD     CAT517  
                  ,ISIN_SEC_ISSUE_CD   = :DCLVFNDRGST.ISIN-SEC-ISSUE-CD CAT517  
                  ,ISIN_SEC_CDG_CD     = :DCLVFNDRGST.ISIN-SEC-CDG-CD   CAT517  
                  ,MF_TRANS_TYPE_CD    = :DCLVFNDRGST.MF-TRANS-TYPE-CD  CAT517  
                  ,FRCTN_CD            = :DCLVFNDRGST.FRCTN-CD          CAT517  
                  ,NRA_TAX_PCT         = :DCLVFNDRGST.NRA-TAX-PCT       CAT517  
                  ,DSBMT_ACCRL_CD      = :DCLVFNDRGST.DSBMT-ACCRL-CD    CAT517  
                  ,DSBMT_FRCTN_CSH_CD  = :DCLVFNDRGST.DSBMT-FRCTN-CSH-CDCAT517  
                  ,DSBMT_RSDL_CD       = :DCLVFNDRGST.DSBMT-RSDL-CD     CAT517  
                  ,BK_PHSCL_SHR_CD     = :DCLVFNDRGST.BK-PHSCL-SHR-CD   CAT517  
                  ,PI_DLRVY_CD         = :DCLVFNDRGST.PI-DLRVY-CD       CAT517  
                  ,TPA_NBR             = :DCLVFNDRGST.TPA-NBR           CAT517  
                  ,CUST_NM             = :DCLVFNDRGST.CUST-NM           CAT517  
                  ,FUND_ACCT_CD        = :DCLVFNDRGST.FUND-ACCT-CD      CAT517  
                  ,FNBR                = :DCLVFNDRGST.FNBR              CAT517  
                  ,BRKR_EXCTG_NBR      = :DCLVFNDRGST.BRKR-EXCTG-NBR    CAT517  
                  ,NTWRK_CNTL_CD       = :DCLVFNDRGST.NTWRK-CNTL-CD     CAT517  
                  ,SS_TIN_CD           = :DCLVFNDRGST.SS-TIN-CD         CAT517  
                  ,SS_TIN_NBR          = :DCLVFNDRGST.SS-TIN-NBR        CAT517  
                  ,DVDND_CD            = :DCLVFNDRGST.DVDND-CD          CAT517  
                  ,LTCG_CD             = :DCLVFNDRGST.LTCG-CD           CAT517  
                  ,STCG_CD             = :DCLVFNDRGST.STCG-CD           CAT517  
                  ,WTHLD_CD            = :DCLVFNDRGST.WTHLD-CD          CAT517  
                  ,PYBL_INFO_CD        = :DCLVFNDRGST.PYBL-INFO-CD      CAT517  
                  ,NM_END_LN_QTY       = :DCLVFNDRGST.NM-END-LN-QTY     CAT517  
                  ,ZIP5_CD             = :DCLVFNDRGST.ZIP5-CD           CAT517  
                  ,ZIP4_CD             = :DCLVFNDRGST.ZIP4-CD           CAT517  
                  ,SOC_CD              = :DCLVFNDRGST.SOC-CD            CAT517  
                  ,NAV_ACCT_IND        = :DCLVFNDRGST.NAV-ACCT-IND      CAT517  
                  ,MRGN_ACCT_IND       = :DCLVFNDRGST.MRGN-ACCT-IND     CAT517  
                  ,CHCK_WRTNG_IND      = :DCLVFNDRGST.CHCK-WRTNG-IND    CAT517  
                  ,SL_ST_CD            = :DCLVFNDRGST.SL-ST-CD          CAT517  
                  ,CNTRY_ORGN_CD       = :DCLVFNDRGST.CNTRY-ORGN-CD     CAT517  
                  ,ACCT_RR_NM          = :DCLVFNDRGST.ACCT-RR-NM        CAT517  
                  ,ACCT_RR_CD          = :DCLVFNDRGST.ACCT-RR-CD        CAT517  
                  ,BRCH_NBR            = :DCLVFNDRGST.BRCH-NBR          CAT517  
                  ,PYBL_QTY            = :DCLVFNDRGST.PYBL-QTY          CAT517  
                  ,MEMO_TXT            = :DCLVFNDRGST.MEMO-TXT          CAT517  
                  ,ACH_IND             = :DCLVFNDRGST.ACH-IND           CAT517  
                  ,PAC_IND             = :DCLVFNDRGST.PAC-IND           CAT517  
                  ,SWP_IND             = :DCLVFNDRGST.SWP-IND           CAT517  
                  ,ROA_LOI_AMT         = :DCLVFNDRGST.ROA-LOI-AMT       CAT517  
                  ,LOI_DT              = :DCLVFNDRGST.LOI-DT            CAT517  
                  ,TRD_RLTD_IND        = :DCLVFNDRGST.TRD-RLTD-IND      CAT517  
                  ,ACCT_RLTD_NBR       = :DCLVFNDRGST.ACCT-RLTD-NBR     CAT517  
                  ,ACCT_RLTD_CD        = :DCLVFNDRGST.ACCT-RLTD-CD      CAT517  
                  ,SWP_PAC_EFFCT_DT    = :DCLVFNDRGST.SWP-PAC-EFFCT-DT  CAT517  
                  ,CDSC_PYMNT_CD       = :DCLVFNDRGST.CDSC-PYMNT-CD     CAT517  
                  ,DSBMT_OPTN_CD       = :DCLVFNDRGST.DSBMT-OPTN-CD     CAT517  
                  ,DSBMT_AMT           = :DCLVFNDRGST.DSBMT-AMT         CAT517  
                  ,PYMNT_JAN_IND       = :DCLVFNDRGST.PYMNT-JAN-IND     CAT517  
                  ,PYMNT_FEB_IND       = :DCLVFNDRGST.PYMNT-FEB-IND     CAT517  
                  ,PYMNT_MAR_IND       = :DCLVFNDRGST.PYMNT-MAR-IND     CAT517  
                  ,PYMNT_APR_IND       = :DCLVFNDRGST.PYMNT-APR-IND     CAT517  
                  ,PYMNT_MAY_IND       = :DCLVFNDRGST.PYMNT-MAY-IND     CAT517  
                  ,PYMNT_JUN_IND       = :DCLVFNDRGST.PYMNT-JUN-IND     CAT517  
                  ,PYMNT_JUL_IND       = :DCLVFNDRGST.PYMNT-JUL-IND     CAT517  
                  ,PYMNT_AUG_IND       = :DCLVFNDRGST.PYMNT-AUG-IND     CAT517  
                  ,PYMNT_SEP_IND       = :DCLVFNDRGST.PYMNT-SEP-IND     CAT517  
                  ,PYMNT_OCT_IND       = :DCLVFNDRGST.PYMNT-OCT-IND     CAT517  
                  ,PYMNT_NOV_IND       = :DCLVFNDRGST.PYMNT-NOV-IND     CAT517  
                  ,PYMNT_DEC_IND       = :DCLVFNDRGST.PYMNT-DEC-IND     CAT517  
                  ,PYMNT_DT_CD         = :DCLVFNDRGST.PYMNT-DT-CD       CAT517  
                  ,RTRMT_TAX_CD        = :DCLVFNDRGST.RTRMT-TAX-CD      CAT517  
                  ,SHRHR_BNK_ACCT_NBR  = :DCLVFNDRGST.SHRHR-BNK-ACCT-NBRCAT517  
                  ,SHRHR_BNK_TYPE_CD   = :DCLVFNDRGST.SHRHR-BNK-TYPE-CD CAT517  
                  ,CHCK_FRST_DT        = :DCLVFNDRGST.CHCK-FRST-DT      CAT517  
                  ,ABA_ROUTING_NBR     = :DCLVFNDRGST.ABA-ROUTING-NBR   CAT517  
                  ,COST_BSS_CD         = :DCLVFNDRGST.COST-BSS-CD       CAT517  
                  ,CICS_TERM_ID_CD     = :DCLVFNDRGST.CICS-TERM-ID-CD   CAT517  
                  ,UPDT_TMSTP          = :DCLVFNDRGST.UPDT-TMSTP        CAT517  
                  ,PRGM_NM             = :DCLVFNDRGST.PRGM-NM           CAT517  
                  ,NSCC_ACK_IND        = :DCLVFNDRGST.NSCC-ACK-IND      CAT517  
                  ,NSCC_PEND_CD        = :DCLVFNDRGST.NSCC-PEND-CD      CAT517  
                  ,W8_WTHLD_CD         = :DCLVFNDRGST.W8-WTHLD-CD       CAT517  
                  ,W8_CERT_DT          = :DCLVFNDRGST.W8-CERT-DT        CAT517  
                  ,W8_EXPTN_DT         = :DCLVFNDRGST.W8-EXPTN-DT       CAT517  
                  ,W8_OVRD_NRA_SPC_RT  = :DCLVFNDRGST.W8-OVRD-NRA-SPC-RTCAT517  
                  ,W8_QULFD_INTRM_IND  = :DCLVFNDRGST.W8-QULFD-INTRM-INDCAT517  
                  ,W8_OVRD_CNTRY_CD    = :DCLVFNDRGST.W8-OVRD-CNTRY-CD  CAT517  
                  ,W8_WTHLD_STTS_CD    = :DCLVFNDRGST.W8-WTHLD-STTS-CD  CAT517  
                  ,W8_CERT_DT_STTS_CD  = :DCLVFNDRGST.W8-CERT-DT-STTS-CDCAT517  
                  ,W8_EXPTN_DT_STS_CD  = :DCLVFNDRGST.W8-EXPTN-DT-STS-CDCAT517  
                  ,W8_SPCL_RT_STTS_CD  = :DCLVFNDRGST.W8-SPCL-RT-STTS-CDCAT517  
                  ,W8_QLFD_INT_STS_CD  = :DCLVFNDRGST.W8-QLFD-INT-STS-CDCAT517  
                  ,W8_ORD_CTRY_STS_CD  = :DCLVFNDRGST.W8-ORD-CTRY-STS-CDCAT517  
             WHERE CLIENT_NBR          = :W-NSCC-KEY-CLIENT-NBR         CAT517  
               AND ACAT_CONTROL_NBR    = :W-NSCC-FR-ACAT-CTL-NBR        CAT517  
               AND ASSET_SEQ_NBR       = :W-ASSET-SEQ-NBR               CAT517  
           END-EXEC.                                                    CAT517  
                                                                        CAT517  
           ADD 1 TO W-SQL-CNT                                           CAT517  
                                                                        CAT517  
           MOVE 'VFNDRGST'               TO W-DB2-TABLE-NAME            CAT517  
           MOVE 'UPDATE'                 TO W-DB2-ACTION                CAT517  
           MOVE SQLCODE                  TO W-DB2-SQLCODE               CAT517  
           .                                                            CAT517  
       6100-EXIT. EXIT.                                                 CAT517  
      /                                                                 CAT517  
       6120-INSERT-VFNDRGST      SECTION.                               CAT517  
           MOVE '6120-INSERT-VFNDRGST           ' TO W-ROUTINE-1.       CAT517  
                                                                        CAT517  
           EXEC SQL                                                     CAT517  
               INSERT INTO VFNDRGST                                     CAT517  
                 (                                                      CAT517  
                   CLIENT_NBR                                           CAT517  
                  ,ACAT_CONTROL_NBR                                     CAT517  
                  ,ASSET_SEQ_NBR                                        CAT517  
                  ,SBMTG_PRTCP_NBR                                      CAT517  
                  ,SBMT_PRT_NR_STS_CD                                   CAT517  
                  ,CONTROL_NBR_STS_CD                                   CAT517  
                  ,AST_SEQ_NBR_STS_CD                                   CAT517  
                  ,SYS_ACT_CD                                           CAT517  
                  ,SYS_RJCT_RSN_CD                                      CAT517  
                  ,MF_TRANS_TYPE_CD                                     CAT517  
                  ,MF_TRAN_TYP_STS_CD                                   CAT517  
                  ,RCRD_STTS_CD                                         CAT517  
                  ,NRA_TAX_PCT                                          CAT517  
                  ,NRA_TAX_PCT_CD                                       CAT517  
                  ,DSBMT_ACCRL_CD                                       CAT517  
                  ,DSBMT_ACCRL_STS_CD                                   CAT517  
                  ,DSBMT_FRCTN_CSH_CD                                   CAT517  
                  ,DSBMT_FRCTN_STS_CD                                   CAT517  
                  ,BK_PHSCL_SHR_CD                                      CAT517  
                  ,BK_PHSC_SHR_STS_CD                                   CAT517  
                  ,FRCTN_CD                                             CAT517  
                  ,FRCTN_STTS_CD                                        CAT517  
                  ,DLRVY_CD                                             CAT517  
                  ,TPA_NBR                                              CAT517  
                  ,TPA_NBR_STTS_CD                                      CAT517  
                  ,CUST_NM                                              CAT517  
                  ,CUST_NM_STTS_CD                                      CAT517  
                  ,FUND_ACCT_CD                                         CAT517  
                  ,FUND_ACCT_STTS_CD                                    CAT517  
                  ,BRKR_EXCTG_NBR                                       CAT517  
                  ,BRKR_EXCTG_STTS_CD                                   CAT517  
                  ,DSBMT_RSDL_CD                                        CAT517  
                  ,DSBMT_RSDL_STS_CD                                    CAT517  
                  ,NTWRK_CNTL_CD                                        CAT517  
                  ,NTWRK_CNTL_STTS_CD                                   CAT517  
                  ,DVDND_CD                                             CAT517  
                  ,DVDND_STTS_CD                                        CAT517  
                  ,FNBR                                                 CAT517  
                  ,FND_ACT_NBR_STS_CD                                   CAT517  
                  ,LTCG_CD                                              CAT517  
                  ,SS_TIN_CD                                            CAT517  
                  ,STCG_CD                                              CAT517  
                  ,WTHLD_CD                                             CAT517  
                  ,WTHLD_STTS_CD                                        CAT517  
                  ,PYBL_INFO_CD                                         CAT517  
                  ,PYBL_INFO_STTS_CD                                    CAT517  
                  ,ZIP5_CD                                              CAT517  
                  ,ZIP5_STTS_CD                                         CAT517  
                  ,ZIP4_CD                                              CAT517  
                  ,ZIP4_STTS_CD                                         CAT517  
                  ,SOC_CD                                               CAT517  
                  ,SOC_STTS_CD                                          CAT517  
                  ,NAV_ACCT_IND                                         CAT517  
                  ,NAV_ACCT_STTS_CD                                     CAT517  
                  ,MRGN_ACCT_IND                                        CAT517  
                  ,MRGN_ACCT_STTS_CD                                    CAT517  
                  ,CHCK_WRTNG_IND                                       CAT517  
                  ,CHCK_WRTNG_STTS_CD                                   CAT517  
                  ,SL_ST_CD                                             CAT517  
                  ,SL_ST_STTS_CD                                        CAT517  
                  ,CNTRY_ORGN_CD                                        CAT517  
                  ,CNTRY_ORGN_STTS_CD                                   CAT517  
                  ,ACCT_RR_NM                                           CAT517  
                  ,ACCT_RR_NM_STTS_CD                                   CAT517  
                  ,ACCT_RR_CD                                           CAT517  
                  ,ACCT_RR_STTS_CD                                      CAT517  
                  ,BRCH_NBR                                             CAT517  
                  ,BRCH_NBR_STTS_CD                                     CAT517  
                  ,PYBL_QTY                                             CAT517  
                  ,PYBL_QTY_STTS_CD                                     CAT517  
                  ,MEMO_TXT                                             CAT517  
                  ,MEMO_STTS_CD                                         CAT517  
                  ,ACH_IND                                              CAT517  
                  ,ACH_STTS_CD                                          CAT517  
                  ,PAC_IND                                              CAT517  
                  ,PAC_STTS_CD                                          CAT517  
                  ,SWP_IND                                              CAT517  
                  ,SWP_STTS_CD                                          CAT517  
                  ,ROA_LOI_AMT                                          CAT517  
                  ,ROA_LOI_STTS_CD                                      CAT517  
                  ,LOI_DT                                               CAT517  
                  ,LOI_STTS_CD                                          CAT517  
                  ,TRD_RLTD_IND                                         CAT517  
                  ,TRD_RLTD_STTS_CD                                     CAT517  
                  ,ACCT_RLTD_NBR                                        CAT517  
                  ,ACCT_RLTD_STTS_CD                                    CAT517  
                  ,ACCT_RLTD_CD                                         CAT517  
                  ,ACCT_RLT_IN_STS_CD                                   CAT517  
                  ,SWP_PAC_EFFCT_DT                                     CAT517  
                  ,SWP_PAC_DT_STTS_CD                                   CAT517  
                  ,CDSC_PYMNT_CD                                        CAT517  
                  ,CDSC_PYMNT_STTS_CD                                   CAT517  
                  ,DSBMT_OPTN_CD                                        CAT517  
                  ,DSBMT_OPTN_STTS_CD                                   CAT517  
                  ,DSBMT_AMT                                            CAT517  
                  ,DSBMT_AMT_STTS_CD                                    CAT517  
                  ,PYMNT_JAN_IND                                        CAT517  
                  ,PYMNT_FEB_IND                                        CAT517  
                  ,PYMNT_MAR_IND                                        CAT517  
                  ,PYMNT_APR_IND                                        CAT517  
                  ,PYMNT_MAY_IND                                        CAT517  
                  ,PYMNT_JUN_IND                                        CAT517  
                  ,PYMNT_JUL_IND                                        CAT517  
                  ,PYMNT_AUG_IND                                        CAT517  
                  ,PYMNT_SEP_IND                                        CAT517  
                  ,PYMNT_OCT_IND                                        CAT517  
                  ,PYMNT_NOV_IND                                        CAT517  
                  ,PYMNT_DEC_IND                                        CAT517  
                  ,PYMNT_MO_STTS_CD                                     CAT517  
                  ,PYMNT_DT_CD                                          CAT517  
                  ,PYMNT_DT_STTS_CD                                     CAT517  
                  ,RTRMT_TAX_CD                                         CAT517  
                  ,RTRMT_TAX_STTS_CD                                    CAT517  
                  ,SHRHR_BNK_ACCT_NBR                                   CAT517  
                  ,SHR_BNK_ACT_STS_CD                                   CAT517  
                  ,SHRHR_BNK_TYPE_CD                                    CAT517  
                  ,SHR_BNK_TYP_STS_CD                                   CAT517  
                  ,CHCK_FRST_DT                                         CAT517  
                  ,CHCK_FRS_DT_STS_CD                                   CAT517  
                  ,ABA_ROUTING_NBR                                      CAT517  
                  ,ABA_ROTNG_STTS_CD                                    CAT517  
                  ,COST_BSS_CD                                          CAT517  
                  ,COST_BS_OPT_STS_CD                                   CAT517  
                  ,RCRD_LNGTH_STTS_CD                                   CAT517  
                  ,SS_TIN_NBR                                           CAT517  
                  ,LGCL_SEQ_NR_STS_CD                                   CAT517  
                  ,TRANS_TYPE_STTS_CD                                   CAT517  
                  ,TRNFR_TYPE_CD                                        CAT517  
                  ,TRNFR_TYPE_STTS_CD                                   CAT517  
                  ,RCV_NBR_STTS_CD                                      CAT517  
                  ,DLVR_NBR_STS_CD                                      CAT517  
                  ,ISIN_CNTRY_CD                                        CAT517  
                  ,ISIN_CNTRY_STTS_CD                                   CAT517  
                  ,ISIN_SEC_ISSUE_CD                                    CAT517  
                  ,ISIN_SEC_IS_STS_CD                                   CAT517  
                  ,ISIN_SEC_CDG_CD                                      CAT517  
                  ,ISIN_SEC_CD_STS_CD                                   CAT517  
                  ,PI_DLRVY_CD                                          CAT517  
                  ,PI_DLVRY_STTS_CD                                     CAT517  
                  ,AST_PRC_CTG_STS_CD                                   CAT517  
                  ,SS_TIN_STTS_CD                                       CAT517  
                  ,SS_TIN_NBR_STTS_CD                                   CAT517  
                  ,CUST_NM_LN_STTS_CD                                   CAT517  
                  ,NM_END_LN_QTY                                        CAT517  
                  ,NM_END_LN_STTS_CD                                    CAT517  
                  ,PHSCL_SEQ_STTS_CD                                    CAT517  
                  ,DSTBN_SIDE_CD                                        CAT517  
                  ,PRCS_DT                                              CAT517  
                  ,ACTION_TYPE_CD                                       CAT517  
                  ,FND_SERV_CNTL_NBR                                    CAT517  
                  ,CUST_FUND_NM                                         CAT517  
                  ,CERT_NBR                                             CAT517  
                  ,ASSET_QTY                                            CAT517  
                  ,ASSET_ORGNL_QTY                                      CAT517  
                  ,ISO_CRNCY_CD                                         CAT517  
                  ,ASSET_AMT                                            CAT517  
                  ,DB_CR_CD                                             CAT517  
                  ,ASSET_DESC_TXT                                       CAT517  
                  ,CERT_DT                                              CAT517  
                  ,STTLM_ASCTD_DT                                       CAT517  
                  ,STTLM_DT                                             CAT517  
                  ,RJCT_CD                                              CAT517  
                  ,NSCC_NON_ADP_IND                                     CAT517  
                  ,NSCC_PEND_CD                                         CAT517  
                  ,NSCC_ACK_IND                                         CAT517  
                  ,CICS_TERM_ID_CD                                      CAT517  
                  ,PRGM_NM                                              CAT517  
                  ,CRT_TMSTP                                            CAT517  
                  ,UPDT_TMSTP                                           CAT517  
                  ,SECURITY_ADP_NBR                                     CAT517  
                  ,DLVR_NBR                                             CAT517  
                  ,ROA_LOI_CD                                           CAT517  
                  ,FUND_BK_CD                                           CAT517  
                  ,W8_WTHLD_CD                                          CAT517  
                  ,W8_CERT_DT                                           CAT517  
                  ,W8_EXPTN_DT                                          CAT517  
                  ,W8_OVRD_NRA_SPC_RT                                   CAT517  
                  ,W8_QULFD_INTRM_IND                                   CAT517  
                  ,W8_OVRD_CNTRY_CD                                     CAT517  
                  ,W8_WTHLD_STTS_CD                                     CAT517  
                  ,W8_CERT_DT_STTS_CD                                   CAT517  
                  ,W8_EXPTN_DT_STS_CD                                   CAT517  
                  ,W8_SPCL_RT_STTS_CD                                   CAT517  
                  ,W8_QLFD_INT_STS_CD                                   CAT517  
                  ,W8_ORD_CTRY_STS_CD                                   CAT517  
                 )                                                      CAT517  
                 VALUES                                                 CAT517  
                 (                                                      CAT517  
                   :DCLVFNDRGST.CLIENT-NBR                              CAT517  
                  ,:DCLVFNDRGST.ACAT-CONTROL-NBR                        CAT517  
                  ,:DCLVFNDRGST.ASSET-SEQ-NBR                           CAT517  
                  ,:DCLVFNDRGST.SBMTG-PRTCP-NBR                         CAT517  
                  ,:DCLVFNDRGST.SBMT-PRT-NR-STS-CD                      CAT517  
                  ,:DCLVFNDRGST.CONTROL-NBR-STS-CD                      CAT517  
                  ,:DCLVFNDRGST.AST-SEQ-NBR-STS-CD                      CAT517  
                  ,:DCLVFNDRGST.SYS-ACT-CD                              CAT517  
                  ,:DCLVFNDRGST.SYS-RJCT-RSN-CD                         CAT517  
                  ,:DCLVFNDRGST.MF-TRANS-TYPE-CD                        CAT517  
                  ,:DCLVFNDRGST.MF-TRAN-TYP-STS-CD                      CAT517  
                  ,:DCLVFNDRGST.RCRD-STTS-CD                            CAT517  
                  ,:DCLVFNDRGST.NRA-TAX-PCT                             CAT517  
                  ,:DCLVFNDRGST.NRA-TAX-PCT-CD                          CAT517  
                  ,:DCLVFNDRGST.DSBMT-ACCRL-CD                          CAT517  
                  ,:DCLVFNDRGST.DSBMT-ACCRL-STS-CD                      CAT517  
                  ,:DCLVFNDRGST.DSBMT-FRCTN-CSH-CD                      CAT517  
                  ,:DCLVFNDRGST.DSBMT-FRCTN-STS-CD                      CAT517  
                  ,:DCLVFNDRGST.BK-PHSCL-SHR-CD                         CAT517  
                  ,:DCLVFNDRGST.BK-PHSC-SHR-STS-CD                      CAT517  
                  ,:DCLVFNDRGST.FRCTN-CD                                CAT517  
                  ,:DCLVFNDRGST.FRCTN-STTS-CD                           CAT517  
                  ,:DCLVFNDRGST.DLRVY-CD                                CAT517  
                  ,:DCLVFNDRGST.TPA-NBR                                 CAT517  
                  ,:DCLVFNDRGST.TPA-NBR-STTS-CD                         CAT517  
                  ,:DCLVFNDRGST.CUST-NM                                 CAT517  
                  ,:DCLVFNDRGST.CUST-NM-STTS-CD                         CAT517  
                  ,:DCLVFNDRGST.FUND-ACCT-CD                            CAT517  
                  ,:DCLVFNDRGST.FUND-ACCT-STTS-CD                       CAT517  
                  ,:DCLVFNDRGST.BRKR-EXCTG-NBR                          CAT517  
                  ,:DCLVFNDRGST.BRKR-EXCTG-STTS-CD                      CAT517  
                  ,:DCLVFNDRGST.DSBMT-RSDL-CD                           CAT517  
                  ,:DCLVFNDRGST.DSBMT-RSDL-STS-CD                       CAT517  
                  ,:DCLVFNDRGST.NTWRK-CNTL-CD                           CAT517  
                  ,:DCLVFNDRGST.NTWRK-CNTL-STTS-CD                      CAT517  
                  ,:DCLVFNDRGST.DVDND-CD                                CAT517  
                  ,:DCLVFNDRGST.DVDND-STTS-CD                           CAT517  
                  ,:DCLVFNDRGST.FNBR                                    CAT517  
                  ,:DCLVFNDRGST.FND-ACT-NBR-STS-CD                      CAT517  
                  ,:DCLVFNDRGST.LTCG-CD                                 CAT517  
                  ,:DCLVFNDRGST.SS-TIN-CD                               CAT517  
                  ,:DCLVFNDRGST.STCG-CD                                 CAT517  
                  ,:DCLVFNDRGST.WTHLD-CD                                CAT517  
                  ,:DCLVFNDRGST.WTHLD-STTS-CD                           CAT517  
                  ,:DCLVFNDRGST.PYBL-INFO-CD                            CAT517  
                  ,:DCLVFNDRGST.PYBL-INFO-STTS-CD                       CAT517  
                  ,:DCLVFNDRGST.ZIP5-CD                                 CAT517  
                  ,:DCLVFNDRGST.ZIP5-STTS-CD                            CAT517  
                  ,:DCLVFNDRGST.ZIP4-CD                                 CAT517  
                  ,:DCLVFNDRGST.ZIP4-STTS-CD                            CAT517  
                  ,:DCLVFNDRGST.SOC-CD                                  CAT517  
                  ,:DCLVFNDRGST.SOC-STTS-CD                             CAT517  
                  ,:DCLVFNDRGST.NAV-ACCT-IND                            CAT517  
                  ,:DCLVFNDRGST.NAV-ACCT-STTS-CD                        CAT517  
                  ,:DCLVFNDRGST.MRGN-ACCT-IND                           CAT517  
                  ,:DCLVFNDRGST.MRGN-ACCT-STTS-CD                       CAT517  
                  ,:DCLVFNDRGST.CHCK-WRTNG-IND                          CAT517  
                  ,:DCLVFNDRGST.CHCK-WRTNG-STTS-CD                      CAT517  
                  ,:DCLVFNDRGST.SL-ST-CD                                CAT517  
                  ,:DCLVFNDRGST.SL-ST-STTS-CD                           CAT517  
                  ,:DCLVFNDRGST.CNTRY-ORGN-CD                           CAT517  
                  ,:DCLVFNDRGST.CNTRY-ORGN-STTS-CD                      CAT517  
                  ,:DCLVFNDRGST.ACCT-RR-NM                              CAT517  
                  ,:DCLVFNDRGST.ACCT-RR-NM-STTS-CD                      CAT517  
                  ,:DCLVFNDRGST.ACCT-RR-CD                              CAT517  
                  ,:DCLVFNDRGST.ACCT-RR-STTS-CD                         CAT517  
                  ,:DCLVFNDRGST.BRCH-NBR                                CAT517  
                  ,:DCLVFNDRGST.BRCH-NBR-STTS-CD                        CAT517  
                  ,:DCLVFNDRGST.PYBL-QTY                                CAT517  
                  ,:DCLVFNDRGST.PYBL-QTY-STTS-CD                        CAT517  
                  ,:DCLVFNDRGST.MEMO-TXT                                CAT517  
                  ,:DCLVFNDRGST.MEMO-STTS-CD                            CAT517  
                  ,:DCLVFNDRGST.ACH-IND                                 CAT517  
                  ,:DCLVFNDRGST.ACH-STTS-CD                             CAT517  
                  ,:DCLVFNDRGST.PAC-IND                                 CAT517  
                  ,:DCLVFNDRGST.PAC-STTS-CD                             CAT517  
                  ,:DCLVFNDRGST.SWP-IND                                 CAT517  
                  ,:DCLVFNDRGST.SWP-STTS-CD                             CAT517  
                  ,:DCLVFNDRGST.ROA-LOI-AMT                             CAT517  
                  ,:DCLVFNDRGST.ROA-LOI-STTS-CD                         CAT517  
                  ,:DCLVFNDRGST.LOI-DT                                  CAT517  
                  ,:DCLVFNDRGST.LOI-STTS-CD                             CAT517  
                  ,:DCLVFNDRGST.TRD-RLTD-IND                            CAT517  
                  ,:DCLVFNDRGST.TRD-RLTD-STTS-CD                        CAT517  
                  ,:DCLVFNDRGST.ACCT-RLTD-NBR                           CAT517  
                  ,:DCLVFNDRGST.ACCT-RLTD-STTS-CD                       CAT517  
                  ,:DCLVFNDRGST.ACCT-RLTD-CD                            CAT517  
                  ,:DCLVFNDRGST.ACCT-RLT-IN-STS-CD                      CAT517  
                  ,:DCLVFNDRGST.SWP-PAC-EFFCT-DT                        CAT517  
                  ,:DCLVFNDRGST.SWP-PAC-DT-STTS-CD                      CAT517  
                  ,:DCLVFNDRGST.CDSC-PYMNT-CD                           CAT517  
                  ,:DCLVFNDRGST.CDSC-PYMNT-STTS-CD                      CAT517  
                  ,:DCLVFNDRGST.DSBMT-OPTN-CD                           CAT517  
                  ,:DCLVFNDRGST.DSBMT-OPTN-STTS-CD                      CAT517  
                  ,:DCLVFNDRGST.DSBMT-AMT                               CAT517  
                  ,:DCLVFNDRGST.DSBMT-AMT-STTS-CD                       CAT517  
                  ,:DCLVFNDRGST.PYMNT-JAN-IND                           CAT517  
                  ,:DCLVFNDRGST.PYMNT-FEB-IND                           CAT517  
                  ,:DCLVFNDRGST.PYMNT-MAR-IND                           CAT517  
                  ,:DCLVFNDRGST.PYMNT-APR-IND                           CAT517  
                  ,:DCLVFNDRGST.PYMNT-MAY-IND                           CAT517  
                  ,:DCLVFNDRGST.PYMNT-JUN-IND                           CAT517  
                  ,:DCLVFNDRGST.PYMNT-JUL-IND                           CAT517  
                  ,:DCLVFNDRGST.PYMNT-AUG-IND                           CAT517  
                  ,:DCLVFNDRGST.PYMNT-SEP-IND                           CAT517  
                  ,:DCLVFNDRGST.PYMNT-OCT-IND                           CAT517  
                  ,:DCLVFNDRGST.PYMNT-NOV-IND                           CAT517  
                  ,:DCLVFNDRGST.PYMNT-DEC-IND                           CAT517  
                  ,:DCLVFNDRGST.PYMNT-MO-STTS-CD                        CAT517  
                  ,:DCLVFNDRGST.PYMNT-DT-CD                             CAT517  
                  ,:DCLVFNDRGST.PYMNT-DT-STTS-CD                        CAT517  
                  ,:DCLVFNDRGST.RTRMT-TAX-CD                            CAT517  
                  ,:DCLVFNDRGST.RTRMT-TAX-STTS-CD                       CAT517  
                  ,:DCLVFNDRGST.SHRHR-BNK-ACCT-NBR                      CAT517  
                  ,:DCLVFNDRGST.SHR-BNK-ACT-STS-CD                      CAT517  
                  ,:DCLVFNDRGST.SHRHR-BNK-TYPE-CD                       CAT517  
                  ,:DCLVFNDRGST.SHR-BNK-TYP-STS-CD                      CAT517  
                  ,:DCLVFNDRGST.CHCK-FRST-DT                            CAT517  
                  ,:DCLVFNDRGST.CHCK-FRS-DT-STS-CD                      CAT517  
                  ,:DCLVFNDRGST.ABA-ROUTING-NBR                         CAT517  
                  ,:DCLVFNDRGST.ABA-ROTNG-STTS-CD                       CAT517  
                  ,:DCLVFNDRGST.COST-BSS-CD                             CAT517  
                  ,:DCLVFNDRGST.COST-BS-OPT-STS-CD                      CAT517  
                  ,:DCLVFNDRGST.RCRD-LNGTH-STTS-CD                      CAT517  
                  ,:DCLVFNDRGST.SS-TIN-NBR                              CAT517  
                  ,:DCLVFNDRGST.LGCL-SEQ-NR-STS-CD                      CAT517  
                  ,:DCLVFNDRGST.TRANS-TYPE-STTS-CD                      CAT517  
                  ,:DCLVFNDRGST.TRNFR-TYPE-CD                           CAT517  
                  ,:DCLVFNDRGST.TRNFR-TYPE-STTS-CD                      CAT517  
                  ,:DCLVFNDRGST.RCV-NBR-STTS-CD                         CAT517  
                  ,:DCLVFNDRGST.DLVR-NBR-STS-CD                         CAT517  
                  ,:DCLVFNDRGST.ISIN-CNTRY-CD                           CAT517  
                  ,:DCLVFNDRGST.ISIN-CNTRY-STTS-CD                      CAT517  
                  ,:DCLVFNDRGST.ISIN-SEC-ISSUE-CD                       CAT517  
                  ,:DCLVFNDRGST.ISIN-SEC-IS-STS-CD                      CAT517  
                  ,:DCLVFNDRGST.ISIN-SEC-CDG-CD                         CAT517  
                  ,:DCLVFNDRGST.ISIN-SEC-CD-STS-CD                      CAT517  
                  ,:DCLVFNDRGST.PI-DLRVY-CD                             CAT517  
                  ,:DCLVFNDRGST.PI-DLVRY-STTS-CD                        CAT517  
                  ,:DCLVFNDRGST.AST-PRC-CTG-STS-CD                      CAT517  
                  ,:DCLVFNDRGST.SS-TIN-STTS-CD                          CAT517  
                  ,:DCLVFNDRGST.SS-TIN-NBR-STTS-CD                      CAT517  
                  ,:DCLVFNDRGST.CUST-NM-LN-STTS-CD                      CAT517  
                  ,:DCLVFNDRGST.NM-END-LN-QTY                           CAT517  
                  ,:DCLVFNDRGST.NM-END-LN-STTS-CD                       CAT517  
                  ,:DCLVFNDRGST.PHSCL-SEQ-STTS-CD                       CAT517  
                  ,:DCLVFNDRGST.DSTBN-SIDE-CD                           CAT517  
                  ,:DCLVFNDRGST.PRCS-DT                                 CAT517  
                  ,:DCLVFNDRGST.ACTION-TYPE-CD                          CAT517  
                  ,:DCLVFNDRGST.FND-SERV-CNTL-NBR                       CAT517  
                  ,:DCLVFNDRGST.CUST-FUND-NM                            CAT517  
                  ,:DCLVFNDRGST.CERT-NBR                                CAT517  
                  ,:DCLVFNDRGST.ASSET-QTY                               CAT517  
                  ,:DCLVFNDRGST.ASSET-ORGNL-QTY                         CAT517  
                  ,:DCLVFNDRGST.ISO-CRNCY-CD                            CAT517  
                  ,:DCLVFNDRGST.ASSET-AMT                               CAT517  
                  ,:DCLVFNDRGST.DB-CR-CD                                CAT517  
                  ,:DCLVFNDRGST.ASSET-DESC-TXT                          CAT517  
                  ,:DCLVFNDRGST.CERT-DT                                 CAT517  
                  ,:DCLVFNDRGST.STTLM-ASCTD-DT                          CAT517  
                  ,:DCLVFNDRGST.STTLM-DT                                CAT517  
                  ,:DCLVFNDRGST.RJCT-CD                                 CAT517  
                  ,:DCLVFNDRGST.NSCC-NON-ADP-IND                        CAT517  
                  ,:DCLVFNDRGST.NSCC-PEND-CD                            CAT517  
                  ,:DCLVFNDRGST.NSCC-ACK-IND                            CAT517  
                  ,:DCLVFNDRGST.CICS-TERM-ID-CD                         CAT517  
                  ,:DCLVFNDRGST.PRGM-NM                                 CAT517  
                  ,:DCLVFNDRGST.CRT-TMSTP                               CAT517  
                  ,:DCLVFNDRGST.UPDT-TMSTP                              CAT517  
                  ,:DCLVFNDRGST.SECURITY-ADP-NBR                        CAT517  
                  ,:DCLVFNDRGST.DLVR-NBR                                CAT517  
                  ,:DCLVFNDRGST.ROA-LOI-CD                              CAT517  
                  ,:DCLVFNDRGST.FUND-BK-CD                              CAT517  
                  ,:DCLVFNDRGST.W8-WTHLD-CD                             CAT517  
                  ,:DCLVFNDRGST.W8-CERT-DT                              CAT517  
                  ,:DCLVFNDRGST.W8-EXPTN-DT                             CAT517  
                  ,:DCLVFNDRGST.W8-OVRD-NRA-SPC-RT                      CAT517  
                  ,:DCLVFNDRGST.W8-QULFD-INTRM-IND                      CAT517  
                  ,:DCLVFNDRGST.W8-OVRD-CNTRY-CD                        CAT517  
                  ,:DCLVFNDRGST.W8-WTHLD-STTS-CD                        CAT517  
                  ,:DCLVFNDRGST.W8-CERT-DT-STTS-CD                      CAT517  
                  ,:DCLVFNDRGST.W8-EXPTN-DT-STS-CD                      CAT517  
                  ,:DCLVFNDRGST.W8-SPCL-RT-STTS-CD                      CAT517  
                  ,:DCLVFNDRGST.W8-QLFD-INT-STS-CD                      CAT517  
                  ,:DCLVFNDRGST.W8-ORD-CTRY-STS-CD                      CAT517  
                 )                                                      CAT517  
           END-EXEC.                                                    CAT517  
                                                                        CAT517  
           ADD 1 TO W-SQL-CNT                                           CAT517  
                                                                        CAT517  
           MOVE 'VFNDRGST'               TO W-DB2-TABLE-NAME            CAT517  
           MOVE 'INSERT'                 TO W-DB2-ACTION                CAT517  
           MOVE SQLCODE                  TO W-DB2-SQLCODE               CAT517  
           .                                                            CAT517  
       6120-EXIT. EXIT.                                                 CAT517  
      /                                                                 CAT517  
       6200-UPDATE-VFNDNA        SECTION.                               CAT517  
           MOVE '6200-UPDATE-VFNDNA            ' TO W-ROUTINE-1.        CAT517  
                                                                        CAT517  
           EXEC SQL                                                     CAT517  
             UPDATE VFNDNA                                              CAT517  
                SET                                                     CAT517  
                   CUST_NA_LINE_TXT    = :DCLVFNDNA.CUST-NA-LINE-TXT    CAT517  
                  ,CUST_NA_STTS_CD     = :DCLVFNDNA.CUST-NA-STTS-CD     CAT517  
                  ,CRT_TMSTP           = :DCLVFNDNA.CRT-TMSTP           CAT517  
                  ,UPDT_TMSTP          = :DCLVFNDNA.UPDT-TMSTP          CAT517  
                  ,CICS_TERM_ID_CD     = :DCLVFNDNA.CICS-TERM-ID-CD     CAT517  
                  ,PRGM_NM             = :DCLVFNDNA.PRGM-NM             CAT517  
             WHERE CLIENT_NBR          = :W-NSCC-KEY-CLIENT-NBR         CAT517  
               AND ACAT_CONTROL_NBR    = :W-NSCC-FR-ACAT-CTL-NBR        CAT517  
               AND ASSET_SEQ_NBR       = :W-ASSET-SEQ-NBR               CAT517  
               AND NA_LINE_NBR         = :DCLVFNDNA.NA-LINE-NBR         CAT517  
           END-EXEC.                                                    CAT517  
                                                                        CAT517  
           ADD 1 TO W-SQL-CNT                                           CAT517  
                                                                        CAT517  
           MOVE 'VFNDNA  '               TO W-DB2-TABLE-NAME            CAT517  
           MOVE 'UPDATE'                 TO W-DB2-ACTION                CAT517  
           MOVE SQLCODE                  TO W-DB2-SQLCODE               CAT517  
           .                                                            CAT517  
       6200-EXIT. EXIT.                                                 CAT517  
      /                                                                 CAT517  
       6250-INSERT-VFNDNA        SECTION.                               CAT517  
           MOVE '6250-INSERT-VFNDNA            ' TO W-ROUTINE-1.        CAT517  
                                                                        CAT517  
           EXEC SQL                                                     CAT517  
               INSERT INTO VFNDNA                                       CAT517  
                 (                                                      CAT517  
                   CLIENT_NBR                                           CAT517  
                  ,ACAT_CONTROL_NBR                                     CAT517  
                  ,ASSET_SEQ_NBR                                        CAT517  
                  ,NA_LINE_NBR                                          CAT517  
                  ,CUST_NA_LINE_TXT                                     CAT517  
                  ,CUST_NA_STTS_CD                                      CAT517  
                  ,CRT_TMSTP                                            CAT517  
                  ,UPDT_TMSTP                                           CAT517  
                  ,CICS_TERM_ID_CD                                      CAT517  
                  ,PRGM_NM                                              CAT517  
                 )                                                      CAT517  
                 VALUES                                                 CAT517  
                 (                                                      CAT517  
                   :DCLVFNDNA.CLIENT-NBR                                CAT517  
                  ,:DCLVFNDNA.ACAT-CONTROL-NBR                          CAT517  
                  ,:DCLVFNDNA.ASSET-SEQ-NBR                             CAT517  
                  ,:DCLVFNDNA.NA-LINE-NBR                               CAT517  
                  ,:DCLVFNDNA.CUST-NA-LINE-TXT                          CAT517  
                  ,:DCLVFNDNA.CUST-NA-STTS-CD                           CAT517  
                  ,:DCLVFNDNA.CRT-TMSTP                                 CAT517  
                  ,:DCLVFNDNA.UPDT-TMSTP                                CAT517  
                  ,:DCLVFNDNA.CICS-TERM-ID-CD                           CAT517  
                  ,:DCLVFNDNA.PRGM-NM                                   CAT517  
                 )                                                      CAT517  
           END-EXEC.                                                    CAT517  
                                                                        CAT517  
           ADD 1 TO W-SQL-CNT                                           CAT517  
                                                                        CAT517  
           MOVE 'VFNDNA  '               TO W-DB2-TABLE-NAME            CAT517  
           MOVE 'INSERT'                 TO W-DB2-ACTION                CAT517  
           MOVE SQLCODE                  TO W-DB2-SQLCODE               CAT517  
           .                                                            CAT517  
       6250-EXIT. EXIT.                                                 CAT517  
      /                                                                 CAT517  
       6300-UPDATE-VFNDPYBL      SECTION.                               CAT517  
           MOVE '6300-UPDATE-VFNDPYBL              ' TO W-ROUTINE-1.    CAT517  
                                                                        CAT517  
           EXEC SQL                                                     CAT517  
             UPDATE VFNDPYBL                                            CAT517  
                SET                                                     CAT517  
                   ACCT_NBR            = :DCLVFNDPYBL.ACCT-NBR          CAT517  
                  ,ACCT_NBR_STTS_CD    = :DCLVFNDPYBL.ACCT-NBR-STTS-CD  CAT517  
                  ,ZIP5_CD             = :DCLVFNDPYBL.ZIP5-CD           CAT517  
                  ,ZIP5_STTS_CD        = :DCLVFNDPYBL.ZIP5-STTS-CD      CAT517  
                  ,ZIP4_CD             = :DCLVFNDPYBL.ZIP4-CD           CAT517  
                  ,ZIP4_STTS_CD        = :DCLVFNDPYBL.ZIP4-STTS-CD      CAT517  
                  ,ADDRS_DVDND_IND     = :DCLVFNDPYBL.ADDRS-DVDND-IND   CAT517  
                  ,ADDRS_SYSWL_IND     = :DCLVFNDPYBL.ADDRS-SYSWL-IND   CAT517  
                  ,ADDRS_ATMDF_IND     = :DCLVFNDPYBL.ADDRS-ATMDF-IND   CAT517  
                  ,CRSS_FND_RNVST_IND  = :DCLVFNDPYBL.CRSS-FND-RNVST-INDCAT517  
                  ,ALTNT_PYBL_IND      = :DCLVFNDPYBL.ALTNT-PYBL-IND    CAT517  
                  ,ADDRS_OPTN_STTS_CD  = :DCLVFNDPYBL.ADDRS-OPTN-STTS-CDCAT517  
                  ,ACCT_PYBL_CD        = :DCLVFNDPYBL.ACCT-PYBL-CD      CAT517  
                  ,ACCT_PYBL_STTS_CD   = :DCLVFNDPYBL.ACCT-PYBL-STTS-CD CAT517  
                  ,ISIN_CNTRY_CD       = :DCLVFNDPYBL.ISIN-CNTRY-CD     CAT517  
                  ,ISIN_CNTRY_STTS_CD  = :DCLVFNDPYBL.ISIN-CNTRY-STTS-CDCAT517  
                  ,ISIN_SEC_ISSUE_CD   = :DCLVFNDPYBL.ISIN-SEC-ISSUE-CD CAT517  
                  ,ISIN_SEC_IS_STS_CD  = :DCLVFNDPYBL.ISIN-SEC-IS-STS-CDCAT517  
                  ,ISIN_SEC_CDG_CD     = :DCLVFNDPYBL.ISIN-SEC-CDG-CD   CAT517  
                  ,ISIN_SEC_CD_STS_CD  = :DCLVFNDPYBL.ISIN-SEC-CD-STS-CDCAT517  
                  ,PYBL_ALTNT_CD       = :DCLVFNDPYBL.PYBL-ALTNT-CD     CAT517  
                  ,PYBL_ALTNT_STTS_CD  = :DCLVFNDPYBL.PYBL-ALTNT-STTS-CDCAT517  
                  ,PYBL_ALTNT_RSN_TXT  = :DCLVFNDPYBL.PYBL-ALTNT-RSN-TXTCAT517  
                  ,PYBL_ALT_RS_STS_CD  = :DCLVFNDPYBL.PYBL-ALT-RS-STS-CDCAT517  
                  ,CRT_TMSTP           = :DCLVFNDPYBL.CRT-TMSTP         CAT517  
                  ,UPDT_TMSTP          = :DCLVFNDPYBL.UPDT-TMSTP        CAT517  
                  ,CICS_TERM_ID_CD     = :DCLVFNDPYBL.CICS-TERM-ID-CD   CAT517  
                  ,PRGM_NM             = :DCLVFNDPYBL.PRGM-NM           CAT517  
                  ,SECURITY_ADP_NBR    = :DCLVFNDPYBL.SECURITY-ADP-NBR  CAT517  
                  ,NA_END_LINE_IND     = :DCLVFNDPYBL.NA-END-LINE-IND   CAT517  
                  ,NA_END_IND_STTS_CD  = :DCLVFNDPYBL.NA-END-IND-STTS-CDCAT517  
             WHERE CLIENT_NBR          = :W-NSCC-KEY-CLIENT-NBR         CAT517  
               AND ACAT_CONTROL_NBR    = :W-NSCC-FR-ACAT-CTL-NBR        CAT517  
               AND ASSET_SEQ_NBR       = :W-ASSET-SEQ-NBR               CAT517  
               AND PYBL_NBR            = :DCLVFNDPYBL.PYBL-NBR          CAT517  
           END-EXEC.                                                    CAT517  
                                                                        CAT517  
           ADD 1 TO W-SQL-CNT                                           CAT517  
                                                                        CAT517  
           MOVE 'VFNDPYBL'               TO W-DB2-TABLE-NAME            CAT517  
           MOVE 'UPDATE'                 TO W-DB2-ACTION                CAT517  
           MOVE SQLCODE                  TO W-DB2-SQLCODE               CAT517  
           .                                                            CAT517  
       6300-EXIT. EXIT.                                                 CAT517  
      /                                                                 CAT517  
       6350-INSERT-VFNDPYBL      SECTION.                               CAT517  
           MOVE '6350-INSERT-VFNDPYBL              ' TO W-ROUTINE-1.    CAT517  
                                                                        CAT517  
           EXEC SQL                                                     CAT517  
               INSERT INTO VFNDPYBL                                     CAT517  
                 (                                                      CAT517  
                   CLIENT_NBR                                           CAT517  
                  ,ACAT_CONTROL_NBR                                     CAT517  
                  ,ASSET_SEQ_NBR                                        CAT517  
                  ,PYBL_NBR                                             CAT517  
                  ,ACCT_NBR                                             CAT517  
                  ,ACCT_NBR_STTS_CD                                     CAT517  
                  ,ZIP5_CD                                              CAT517  
                  ,ZIP5_STTS_CD                                         CAT517  
                  ,ZIP4_CD                                              CAT517  
                  ,ZIP4_STTS_CD                                         CAT517  
                  ,ADDRS_DVDND_IND                                      CAT517  
                  ,ADDRS_SYSWL_IND                                      CAT517  
                  ,ADDRS_ATMDF_IND                                      CAT517  
                  ,CRSS_FND_RNVST_IND                                   CAT517  
                  ,ALTNT_PYBL_IND                                       CAT517  
                  ,ADDRS_OPTN_STTS_CD                                   CAT517  
                  ,ACCT_PYBL_CD                                         CAT517  
                  ,ACCT_PYBL_STTS_CD                                    CAT517  
                  ,ISIN_CNTRY_CD                                        CAT517  
                  ,ISIN_CNTRY_STTS_CD                                   CAT517  
                  ,ISIN_SEC_ISSUE_CD                                    CAT517  
                  ,ISIN_SEC_IS_STS_CD                                   CAT517  
                  ,ISIN_SEC_CDG_CD                                      CAT517  
                  ,ISIN_SEC_CD_STS_CD                                   CAT517  
                  ,PYBL_ALTNT_CD                                        CAT517  
                  ,PYBL_ALTNT_STTS_CD                                   CAT517  
                  ,PYBL_ALTNT_RSN_TXT                                   CAT517  
                  ,PYBL_ALT_RS_STS_CD                                   CAT517  
                  ,CRT_TMSTP                                            CAT517  
                  ,UPDT_TMSTP                                           CAT517  
                  ,CICS_TERM_ID_CD                                      CAT517  
                  ,PRGM_NM                                              CAT517  
                  ,SECURITY_ADP_NBR                                     CAT517  
                  ,NA_END_LINE_IND                                      CAT517  
                  ,NA_END_IND_STTS_CD                                   CAT517  
                 )                                                      CAT517  
                 VALUES                                                 CAT517  
                 (                                                      CAT517  
                   :DCLVFNDPYBL.CLIENT-NBR                              CAT517  
                  ,:DCLVFNDPYBL.ACAT-CONTROL-NBR                        CAT517  
                  ,:DCLVFNDPYBL.ASSET-SEQ-NBR                           CAT517  
                  ,:DCLVFNDPYBL.PYBL-NBR                                CAT517  
                  ,:DCLVFNDPYBL.ACCT-NBR                                CAT517  
                  ,:DCLVFNDPYBL.ACCT-NBR-STTS-CD                        CAT517  
                  ,:DCLVFNDPYBL.ZIP5-CD                                 CAT517  
                  ,:DCLVFNDPYBL.ZIP5-STTS-CD                            CAT517  
                  ,:DCLVFNDPYBL.ZIP4-CD                                 CAT517  
                  ,:DCLVFNDPYBL.ZIP4-STTS-CD                            CAT517  
                  ,:DCLVFNDPYBL.ADDRS-DVDND-IND                         CAT517  
                  ,:DCLVFNDPYBL.ADDRS-SYSWL-IND                         CAT517  
                  ,:DCLVFNDPYBL.ADDRS-ATMDF-IND                         CAT517  
                  ,:DCLVFNDPYBL.CRSS-FND-RNVST-IND                      CAT517  
                  ,:DCLVFNDPYBL.ALTNT-PYBL-IND                          CAT517  
                  ,:DCLVFNDPYBL.ADDRS-OPTN-STTS-CD                      CAT517  
                  ,:DCLVFNDPYBL.ACCT-PYBL-CD                            CAT517  
                  ,:DCLVFNDPYBL.ACCT-PYBL-STTS-CD                       CAT517  
                  ,:DCLVFNDPYBL.ISIN-CNTRY-CD                           CAT517  
                  ,:DCLVFNDPYBL.ISIN-CNTRY-STTS-CD                      CAT517  
                  ,:DCLVFNDPYBL.ISIN-SEC-ISSUE-CD                       CAT517  
                  ,:DCLVFNDPYBL.ISIN-SEC-IS-STS-CD                      CAT517  
                  ,:DCLVFNDPYBL.ISIN-SEC-CDG-CD                         CAT517  
                  ,:DCLVFNDPYBL.ISIN-SEC-CD-STS-CD                      CAT517  
                  ,:DCLVFNDPYBL.PYBL-ALTNT-CD                           CAT517  
                  ,:DCLVFNDPYBL.PYBL-ALTNT-STTS-CD                      CAT517  
                  ,:DCLVFNDPYBL.PYBL-ALTNT-RSN-TXT                      CAT517  
                  ,:DCLVFNDPYBL.PYBL-ALT-RS-STS-CD                      CAT517  
                  ,:DCLVFNDPYBL.CRT-TMSTP                               CAT517  
                  ,:DCLVFNDPYBL.UPDT-TMSTP                              CAT517  
                  ,:DCLVFNDPYBL.CICS-TERM-ID-CD                         CAT517  
                  ,:DCLVFNDPYBL.PRGM-NM                                 CAT517  
                  ,:DCLVFNDPYBL.SECURITY-ADP-NBR                        CAT517  
                  ,:DCLVFNDPYBL.NA-END-LINE-IND                         CAT517  
                  ,:DCLVFNDPYBL.NA-END-IND-STTS-CD                      CAT517  
                 )                                                      CAT517  
           END-EXEC.                                                    CAT517  
                                                                        CAT517  
           ADD 1 TO W-SQL-CNT                                           CAT517  
                                                                        CAT517  
           MOVE 'VFNDPYBL'               TO W-DB2-TABLE-NAME            CAT517  
           MOVE 'INSERT'                 TO W-DB2-ACTION                CAT517  
           MOVE SQLCODE                  TO W-DB2-SQLCODE               CAT517  
           .                                                            CAT517  
       6350-EXIT. EXIT.                                                 CAT517  
      /                                                                 CAT517  
       6400-UPDATE-VFNDPYNA      SECTION.                               CAT517  
           MOVE '6400-UPDATE-VFNDPYNA            ' TO W-ROUTINE-1.      CAT517  
                                                                        CAT517  
           EXEC SQL                                                     CAT517  
             UPDATE VFNDPYNA                                            CAT517  
                SET                                                     CAT517  
                   PYBL_NA_LINE_TXT    = :DCLVFNDPYNA.PYBL-NA-LINE-TXT  CAT517  
                  ,CRT_TMSTP           = :DCLVFNDPYNA.CRT-TMSTP         CAT517  
                  ,UPDT_TMSTP          = :DCLVFNDPYNA.UPDT-TMSTP        CAT517  
                  ,PYBL_NA_LN_STTS_CD  = :DCLVFNDPYNA.PYBL-NA-LN-STTS-CDCAT517  
                  ,CICS_TERM_ID_CD     = :DCLVFNDPYNA.CICS-TERM-ID-CD   CAT517  
                  ,PRGM_NM             = :DCLVFNDPYNA.PRGM-NM           CAT517  
             WHERE CLIENT_NBR          = :W-NSCC-KEY-CLIENT-NBR         CAT517  
               AND ACAT_CONTROL_NBR    = :W-NSCC-FR-ACAT-CTL-NBR        CAT517  
               AND ASSET_SEQ_NBR       = :W-ASSET-SEQ-NBR               CAT517  
               AND PYBL_NBR            = :DCLVFNDPYNA.PYBL-NBR          CAT517  
               AND NA_LINE_NBR         = :DCLVFNDPYNA.NA-LINE-NBR       CAT517  
           END-EXEC.                                                    CAT517  
                                                                        CAT517  
           ADD 1 TO W-SQL-CNT                                           CAT517  
                                                                        CAT517  
           MOVE 'VFNDPYNA'               TO W-DB2-TABLE-NAME            CAT517  
           MOVE 'UPDATE'                 TO W-DB2-ACTION                CAT517  
           MOVE SQLCODE                  TO W-DB2-SQLCODE               CAT517  
           .                                                            CAT517  
       6400-EXIT. EXIT.                                                 CAT517  
      /                                                                 CAT517  
       6450-INSERT-VFNDPYNA      SECTION.                               CAT517  
           MOVE '6450-INSERT-VFNDPYNA              ' TO W-ROUTINE-1.    CAT517  
                                                                        CAT517  
           EXEC SQL                                                     CAT517  
               INSERT INTO VFNDPYNA                                     CAT517  
                 (                                                      CAT517  
                   CLIENT_NBR                                           CAT517  
                  ,ACAT_CONTROL_NBR                                     CAT517  
                  ,ASSET_SEQ_NBR                                        CAT517  
                  ,PYBL_NBR                                             CAT517  
                  ,NA_LINE_NBR                                          CAT517  
                  ,PYBL_NA_LINE_TXT                                     CAT517  
                  ,CRT_TMSTP                                            CAT517  
                  ,UPDT_TMSTP                                           CAT517  
                  ,PYBL_NA_LN_STTS_CD                                   CAT517  
                  ,CICS_TERM_ID_CD                                      CAT517  
                  ,PRGM_NM                                              CAT517  
                 )                                                      CAT517  
                 VALUES                                                 CAT517  
                 (                                                      CAT517  
                   :DCLVFNDPYNA.CLIENT-NBR                              CAT517  
                  ,:DCLVFNDPYNA.ACAT-CONTROL-NBR                        CAT517  
                  ,:DCLVFNDPYNA.ASSET-SEQ-NBR                           CAT517  
                  ,:DCLVFNDPYNA.PYBL-NBR                                CAT517  
                  ,:DCLVFNDPYNA.NA-LINE-NBR                             CAT517  
                  ,:DCLVFNDPYNA.PYBL-NA-LINE-TXT                        CAT517  
                  ,:DCLVFNDPYNA.CRT-TMSTP                               CAT517  
                  ,:DCLVFNDPYNA.UPDT-TMSTP                              CAT517  
                  ,:DCLVFNDPYNA.PYBL-NA-LN-STTS-CD                      CAT517  
                  ,:DCLVFNDPYNA.CICS-TERM-ID-CD                         CAT517  
                  ,:DCLVFNDPYNA.PRGM-NM                                 CAT517  
                 )                                                      CAT517  
           END-EXEC.                                                    CAT517  
                                                                        CAT517  
           ADD 1 TO W-SQL-CNT                                           CAT517  
                                                                        CAT517  
           MOVE 'VFNDPYNA'               TO W-DB2-TABLE-NAME            CAT517  
           MOVE 'INSERT'                 TO W-DB2-ACTION                CAT517  
           MOVE SQLCODE                  TO W-DB2-SQLCODE               CAT517  
           .                                                            CAT517  
       6450-EXIT. EXIT.                                                 CAT517  
      /                                                                 CAT517  
       7100-SQL-COMMIT     SECTION.                                     CAT517  
                                                                        CAT517  
           EXEC SQL COMMIT                                              CAT517  
           END-EXEC                                                     CAT517  
                                                                        CAT517  
           MOVE SQLCA   TO COMMIT-SQLCA                                 CAT517  
           MOVE SQLCODE TO COMMIT-RETURN                                CAT517  
                                                                        CAT517  
           IF  COMMIT-AB                                                CAT517  
               ACCEPT W-SYS-TIME            FROM TIME                   CAT517  
               DISPLAY 'TIME ' W-SYS-TIME                               CAT517  
                  ' SQL COMMIT FAILED.'                                 CAT517  
                          ' RC= '           COMMIT-RETURN               CAT517  
                     ' INP-CNT= '           W-INFILE-CNT                CAT517  
                    ' PREV-CNT= '           W-LAST-COMMIT-INFILE-CNT    CAT517  
                    ' LOAD-CNT= '           W-LOAD-CNT                  CAT517  
                     ' SQL-CNT= '           W-SQL-CNT                   CAT517  
           ELSE                                                         CAT517  
DJ0001         ADD 1 TO W-COMMIT-CNT                                    CAT517  
           END-IF.                                                      CAT517  
                                                                        CAT517  
           MOVE W-INFILE-CNT             TO W-LAST-COMMIT-INFILE-CNT    CAT517  
           .                                                            CAT517  
       7100-EXIT. EXIT.                                                 CAT517  
      /                                                                 CAT517  
       7200-SQL-ROLLBACK   SECTION.                                     CAT517  
           DISPLAY '7200-SQL-ROLLBACK'                                  CAT517  
                  ' INFILE-CNT = ' W-INFILE-CNT                         CAT517  
                  ' LAST-COMMIT-INFILE-CNT = '                          CAT517  
                                            W-LAST-COMMIT-INFILE-CNT    CAT517  
                                                                        CAT517  
           EXEC SQL ROLLBACK WORK                                       CAT517  
           END-EXEC                                                     CAT517  
                                                                        CAT517  
           MOVE SQLCA   TO ROLLBACK-SQLCA                               CAT517  
           MOVE SQLCODE TO ROLLBACK-RETURN                              CAT517  
                                                                        CAT517  
           IF ROLLBACK-AB                                               CAT517  
               DISPLAY 'CAT517: '                                       CAT517  
                   'AUTO ROLLBACK FAILED. ROLLBACK-RETURN = '           CAT517  
                   ROLLBACK-RETURN                                      CAT517  
           ELSE                                                         CAT517  
               DISPLAY 'CAT517: '                                       CAT517  
                   'AUTO ROLLBACK SUCCESSFUL. ROLLBACK-RETURN = '       CAT517  
                   ROLLBACK-RETURN                                      CAT517  
           END-IF.                                                      CAT517  
                                                                        CAT517  
       7200-EXIT. EXIT.                                                 CAT517  
      /                                                                 CAT517  
       8000-SQL-ERROR            SECTION.                               CAT517  
           DISPLAY ' '                                                  CAT517  
           DISPLAY '8000-SQL-ERROR'                                     CAT517  
                  ' INFILE-CNT = ' W-INFILE-CNT                         CAT517  
           ' LAST-COMMIT-INFILE-CNT = ' W-LAST-COMMIT-INFILE-CNT        CAT517  
                                                                        CAT517  
           PERFORM 8200-DISPLAY-DB2-MSG THRU 8200-EXIT                  CAT517  
           DISPLAY ' '                                                  CAT517  
                                                                        CAT517  
           PERFORM 7200-SQL-ROLLBACK THRU 7200-EXIT                     CAT517  
                                                                        CAT517  
           DISPLAY 'CAT517: U3999 - ABENDING ON BAD DB2 STATUS'         CAT517  
           MOVE +3999    TO ABEND-CODE                                  CAT517  
           CALL ABEND USING ABEND-CODE.                                 CAT517  
                                                                        CAT517  
       8000-EXIT. EXIT.                                                 CAT517  
      /                                                                 CAT517  
       8200-DISPLAY-DB2-MSG  SECTION.                                   CAT517  
                                                                        CAT517  
           DISPLAY ' '                                                  CAT517  
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                  CAT517  
                                    W-DB2-MESSAGE-LEN.                  CAT517  
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                        CAT517  
             UNTIL W-DB2-IDX GREATER THAN 12                            CAT517  
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES              CAT517  
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)               CAT517  
                   END-IF                                               CAT517  
           END-PERFORM.                                                 CAT517  
                                                                        CAT517  
       8200-EXIT. EXIT.                                                 CAT517  
      /                                                                 CAT517  
       9000-CLOSE-ROUTINE        SECTION.                               CAT517  
           MOVE '9000-CLOSE-ROUTINE            ' TO W-ROUTINE-1.        CAT517  
                                                                        CAT517  
           DISPLAY ' '.                                                 CAT517  
           DISPLAY ' '.                                                 CAT517  
           DISPLAY 'CAT517: INFILE  COUNT      = ' W-INFILE-CNT         CAT517  
                 ' (INCLUDES HEADER AND TRAILER)'                       CAT517  
           DISPLAY 'CAT517: DETAIL  COUNT      = ' W-DETAIL-CNT         CAT517  
                 ' (EXCLUDES HEADER AND TRAILER)'                       CAT517  
           DISPLAY 'CAT517: W-FR-CNT           = ' W-FR-CNT             CAT517  
           DISPLAY 'CAT517: W-LOAD-CNT         = ' W-LOAD-CNT           CAT517  
DJ0001     DISPLAY 'CAT517: W-COMMIT-CNT       = ' W-COMMIT-CNT         CAT517  
           DISPLAY 'CAT517: VFNDRGST-ADD-CNT   = ' W-VFNDRGST-ADD-CNT   CAT517  
                          ' VFNDRGST-NOTADD-CNT= '                      CAT517  
                                               W-VFNDRGST-NOT-ADD-CNT   CAT517  
           DISPLAY 'CAT517: VFNDRGST-UPD-CNT   = ' W-VFNDRGST-UPD-CNT   CAT517  
                          ' VFNDRGST-NOTUPD-CNT= '                      CAT517  
                                               W-VFNDRGST-NOT-UPD-CNT   CAT517  
           DISPLAY 'CAT517: VFNDNA-ADD-CNT     = ' W-VFNDNA-ADD-CNT     CAT517  
                          ' VFNDNA-NOTADD-CNT  = '                      CAT517  
                                               W-VFNDNA-NOT-ADD-CNT     CAT517  
           DISPLAY 'CAT517: VFNDNA-UPD-CNT     = ' W-VFNDNA-UPD-CNT     CAT517  
                          ' VFNDNA-NOTUPD-CNT  = '                      CAT517  
                                               W-VFNDNA-NOT-UPD-CNT     CAT517  
           DISPLAY 'CAT517: VFNDPYBL-ADD-CNT   = ' W-VFNDPYBL-ADD-CNT   CAT517  
                          ' VFNDPYBL-NOTADD-CNT= '                      CAT517  
                                               W-VFNDPYBL-NOT-ADD-CNT   CAT517  
           DISPLAY 'CAT517: VFNDPYBL-UPD-CNT   = ' W-VFNDPYBL-UPD-CNT   CAT517  
                          ' VFNDPYBL-NOTUPD-CNT= '                      CAT517  
                                               W-VFNDPYBL-NOT-UPD-CNT   CAT517  
           DISPLAY 'CAT517: VFNDPYNA-ADD-CNT   = ' W-VFNDPYNA-ADD-CNT   CAT517  
                          ' VFNDPYNA-NOTADD-CNT= '                      CAT517  
                                               W-VFNDPYNA-NOT-ADD-CNT   CAT517  
           DISPLAY 'CAT517: VFNDPYNA-UPD-CNT   = ' W-VFNDPYNA-UPD-CNT   CAT517  
                          ' VFNDPYNA-NOTUPD-CNT= '                      CAT517  
                                               W-VFNDPYNA-NOT-UPD-CNT   CAT517  
           DISPLAY 'CAT517: W-MSD-FND-CNT      = ' W-MSD-FND-CNT        CAT517  
                          ' W-MSD-NOTFND-CNT   = '                      CAT517  
                            W-MSD-NOTFND-CNT                            CAT517  
           DISPLAY ' '.                                                 CAT517  
           DISPLAY 'CAT517: PROGRAM ENDED SUCCESSFULLY'.                CAT517  
                                                                        CAT517  
       9000-EXIT. EXIT.                                                 CAT517  
      *################################################################ CAT517  
