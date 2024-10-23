000001* PDX    - ACAT34RB C0250441 06/25/07 16:14:58 TBLAMUR            00001000
000001* LRM002 - SSR 53075 SPIN-OFF CHANGES                                     
000001* PDX    - ACAT34RB C0210492 09/22/04 14:26:54 TBEDTAK            00001000
000001* ET0001 - SSR#34535 ADD CAGE TAG ON FAIL REVERSAL TRANSFER       00001000
000001* PDX    - ACAT34RB C0179244 12/04/02 12:23:15 TBEDTAK            00001000
       IDENTIFICATION DIVISION.                                         ACAT34RB
       PROGRAM-ID.    ACAT34RB.                                         ACAT34RB
       AUTHOR.  E.TAKAESU.                                              ACAT34RB
      *REMARKS.                                                         ACAT34RB
      ***************************************************************** ACAT34RB
      *              ACAT RESCIND/BLOCK FILE                          * ACAT34RB
      ***************************************************************** ACAT34RB
      * PURPOSE : THIS PROGRAM IS TO IDENTIFY ACCOUNTS TO BE FLAGGED  * ACAT34RB
      *           OR EXCLUDED FROM DELIVERY VIA ACATS.                * ACAT34RB
      *                                                               * ACAT34RB
      *           THREE TYPES OF BLOCK CODES.                         * ACAT34RB
      *           1. CLIENT RESCIND (BLOCK CODE = 'R')                * ACAT34RB
      *              REFERS TO TRANSFERS TO SPECIFIC CONTRA BROKERS.  * ACAT34RB
      *           2. RESTRICTED SECURITY (BLOCK CODE = 'S')           * ACAT34RB
      *              APPLIES TO SPECIFIC SECURITY IN A SPECIFIC ACCT. * ACAT34RB
      *           3. LEGAL BLOCK (BLOCK CODE = 'L')                   * ACAT34RB
      *              APPLIES TO THE SPECIFIC ACCOUNT.                 * ACAT34RB
ET0001*           4. FAIL REVERSAL BLOCK (BLOCK CODE = 'F')           * ACAT34RB
ET0001*              APPLIES TO THE ACCOUNT WITH SPECIFIC SECURITY    * ACAT34RB
ET0001*              AND SPECIFIC CONTRA BROKER.                      * ACAT34RB
      *                                                               * ACAT34RB
      * DATABASE: VRSDBLK (RESCIND/BLOCK ACCOUNT)                     * ACAT34RB
      *           VACTRBHY (HISTORY RESCIND/BLOCK ACCOUNT)            * ACAT34RB
      ***************************************************************** ACAT34RB
       ENVIRONMENT DIVISION.                                            ACAT34RB
       DATA DIVISION.                                                   ACAT34RB
       WORKING-STORAGE SECTION.                                         ACAT34RB
       COPY PDXIDCOB.                                                   ACAT34RB
       77  TWA-SIZE                       PIC S9(4) COMP.               ACAT34RB
       77  WS-EDITMOD                     PIC X(08) VALUE 'ACATEDIT'.   ACAT34RB
       77  WS-ACATMSD                     PIC X(08) VALUE 'ACATMSD'.    ACAT34RB
       77  WS-ACATSRCH                    PIC X(08) VALUE 'ACATSRCH'.   ACAT34RB
       77  CURR-EDIT-LEN                  PIC S9(4) COMP  VALUE +35.    ACAT34RB
      *                                                                 ACAT34RB
       01  TSQ-WORK-AREA.                                               ACAT34RB
           05  TWA-TSQ.                                                 ACAT34RB
               09  TSQ-NAME.                                            ACAT34RB
                   11 TERM-ID             PIC X(04).                    ACAT34RB
                   11 TRAN-ID             PIC X(04).                    ACAT34RB
               09  ITEM-NUM               PIC S9(04) COMP VALUE +1.     ACAT34RB
      *                                                                 ACAT34RB
       01  WS-DATE-AREA.                                                ACAT34RB
           05  WSABSTIME           PIC S9(08) COMP.                     ACAT34RB
           05  WSMMDDYY.                                                ACAT34RB
               09 WS-CUR-MM        PIC XX.                              ACAT34RB
               09  FILLER          PIC X.                               ACAT34RB
               09 WS-CUR-DD        PIC XX.                              ACAT34RB
               09  FILLER          PIC X.                               ACAT34RB
               09 WS-CUR-YY        PIC XX.                              ACAT34RB
           05  WSDATESEP           PIC X(01) VALUE '/'.                 ACAT34RB
           05  WSTIME.                                                  ACAT34RB
               09  WS-TIME-HH      PIC XX.                              ACAT34RB
               09  FILLER          PIC X.                               ACAT34RB
               09  WS-TIME-MM      PIC XX.                              ACAT34RB
               09  FILLER          PIC X.                               ACAT34RB
               09  WS-TIME-SS      PIC XX.                              ACAT34RB
           05  WSTIMESEP           PIC X(01) VALUE ':'.                 ACAT34RB
           05  WS-DB2-FORM-DATE.                                        ACAT34RB
               09  WS-DATE-CC      PIC X(02).                           ACAT34RB
               09  WS-DATE-YY      PIC X(02).                           ACAT34RB
               09  WS-HYPHON1      PIC X(01).                           ACAT34RB
               09  WS-DATE-MM      PIC X(02).                           ACAT34RB
               09  WS-HYPHON2      PIC X(01).                           ACAT34RB
               09  WS-DATE-DD      PIC X(02).                           ACAT34RB
           05  WS-EDITED-DATE.                                          ACAT34RB
               09  WS-EDITED-MM    PIC X(02).                           ACAT34RB
               09  FILLER          PIC X(01) VALUE '/'.                 ACAT34RB
               09  WS-EDITED-DD    PIC X(02).                           ACAT34RB
               09  FILLER          PIC X(01) VALUE '/'.                 ACAT34RB
               09  WS-EDITED-YY    PIC X(02).                           ACAT34RB
           05  WS-EXP-DATE.                                             ACAT34RB
               09  WS-EXP-MM       PIC X(02).                           ACAT34RB
               09  WS-EXP-SLASH1   PIC X(01).                           ACAT34RB
               09  WS-EXP-DD       PIC X(02).                           ACAT34RB
               09  WS-EXP-SLASH2   PIC X(01).                           ACAT34RB
               09  WS-EXP-YY       PIC X(02).                           ACAT34RB
               09  WS-EXP-YY-N   REDEFINES WS-EXP-YY                    ACAT34RB
                                   PIC 9(02).                           ACAT34RB
           05  WS-EXP-DATE-EDITED.                                      ACAT34RB
               09  WS-EXP-DT-CC    PIC X(02).                           ACAT34RB
               09  WS-EXP-DT-YY    PIC X(02).                           ACAT34RB
               09  WS-EXP-DT-MM    PIC X(02).                           ACAT34RB
               09  WS-EXP-DT-DD    PIC X(02).                           ACAT34RB
           05  WS-TOD-DATE.                                             ACAT34RB
               09  WS-TOD-CC       PIC X(02).                           ACAT34RB
               09  WS-TOD-YY       PIC X(02).                           ACAT34RB
               09  WS-TOD-MM       PIC X(02).                           ACAT34RB
               09  WS-TOD-DD       PIC X(02).                           ACAT34RB
           05  WS-MDY-DATE.                                             ACAT34RB
               09  WS-MMDDYY.                                           ACAT34RB
                   11  WS-MDY-MM   PIC X(02).                           ACAT34RB
                   11  WS-MDY-DD   PIC X(02).                           ACAT34RB
                   11  WS-MDY-YY   PIC X(02).                           ACAT34RB
               09  FILLER          PIC X(02).                           ACAT34RB
      *                                                                 ACAT34RB
       01  B1-RECORD.                                                   ACAT34RB
           05  B1-REC-ID.                                               ACAT34RB
               09  B1-CLIENT-NO          PIC 9(03) COMP-3.              ACAT34RB
               09  B1-CARD-NO            PIC 9(07) COMP-3.              ACAT34RB
               09  B1-CLIENT             PIC 9(03) COMP-3.              ACAT34RB
               09  B1-SEQUENCE           PIC 9(05) COMP-3 VALUE 1.      ACAT34RB
           05  B1-REC-TYP-3              PIC X(01) VALUE '3'.           ACAT34RB
           05  B1-COUNTRY                PIC X(03).                     ACAT34RB
           05  FILLER                    PIC X(07).                     ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
      *      EDITMOD WORK AREA                                          ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
       01  EDIT-AMT-AREA.                                               ACAT34RB
           05  WK-AMT-CODE                PIC X(01) VALUE 'D'.          ACAT34RB
           05  WK-AMT-NUM-ITEM            PIC S9(03) COMP-3 VALUE +1.   ACAT34RB
           05  WK-AMT-IN-LEN              PIC S9(03) COMP-3 VALUE +19.  ACAT34RB
           05  WK-AMT-OUT-LEN             PIC S9(03) COMP-3 VALUE +17.  ACAT34RB
           05  WK-AMT-IN                  PIC X(19) VALUE LOW-VALUE.    ACAT34RB
           05  WK-AMT-OUT                 PIC S9(15)V99.                ACAT34RB
           05  WK-AMT-DECIMAL-LEN         PIC S9(03) COMP-3 VALUE +2.   ACAT34RB
           05  WK-AMT-COMMAR              PIC X(01) VALUE 'Y'.          ACAT34RB
           05  WK-AMT-RET-CODE            PIC X(01) VALUE SPACE.        ACAT34RB
           05  FILLER                     PIC X(01) VALUE HIGH-VALUE.   ACAT34RB
                                                                        ACAT34RB
       01  WK-FORMATTED-AMT.                                            ACAT34RB
           05  WK-AMT-COMMAS-3      PIC ZZZ,ZZZ,ZZZ,ZZZ.99-.            ACAT34RB
           05  WK-AMT-COMMAS-2      PIC ZZZZZZZ,ZZZ,ZZZ.99-.            ACAT34RB
           05  WK-AMT-COMMAS-1      PIC ZZZZZZZZZZZ,ZZZ.99-.            ACAT34RB
           05  WK-AMT-COMMAS-0      PIC ZZZZZZZZZZZZZZZ.99-.            ACAT34RB
                                                                        ACAT34RB
       01  EDIT-QTY-AREA.                                               ACAT34RB
           05  WK-QTY-CODE                PIC X(01) VALUE 'D'.          ACAT34RB
           05  WK-QTY-NUM-ITEM            PIC S9(03) COMP-3 VALUE +1.   ACAT34RB
           05  WK-QTY-IN-LEN              PIC S9(03) COMP-3 VALUE +22.  ACAT34RB
           05  WK-QTY-OUT-LEN             PIC S9(03) COMP-3 VALUE +21.  ACAT34RB
           05  WK-QTY-IN                  PIC X(22) VALUE LOW-VALUE.    ACAT34RB
           05  WK-QTY-OUT.                                              ACAT34RB
               07  WK-QTY-OUT-WHOLE       PIC 9(17).                    ACAT34RB
               07  WK-QTY-OUT-FRACTION    PIC SV9(04).                  ACAT34RB
           05  WK-QTY-OUT-D1X REDEFINES WK-QTY-OUT.                     ACAT34RB
               07  FILLER                 PIC X.                        ACAT34RB
               07  WK-QTY-OUT-D1          PIC S9(16)V9.                 ACAT34RB
               07  FILLER                 PIC X(03).                    ACAT34RB
           05  WK-QTY-OUT-D2X REDEFINES WK-QTY-OUT.                     ACAT34RB
               07  FILLER                 PIC X(02).                    ACAT34RB
               07  WK-QTY-OUT-D2          PIC S9(15)V99.                ACAT34RB
               07  FILLER                 PIC X(02).                    ACAT34RB
           05  WK-QTY-OUT-D3X REDEFINES WK-QTY-OUT.                     ACAT34RB
               07  FILLER                 PIC X(03).                    ACAT34RB
               07  WK-QTY-OUT-D3          PIC S9(14)V999.               ACAT34RB
               07  FILLER                 PIC X.                        ACAT34RB
           05  WK-QTY-OUT-D4X REDEFINES WK-QTY-OUT.                     ACAT34RB
               07  FILLER                 PIC X(04).                    ACAT34RB
               07  WK-QTY-OUT-D4          PIC S9(13)V9999.              ACAT34RB
           05  WK-QTY-DECIMAL-LEN         PIC S9(03) COMP-3 VALUE +4.   ACAT34RB
           05  WK-QTY-COMMAR              PIC X(01) VALUE 'Y'.          ACAT34RB
           05  WK-QTY-RET-CODE            PIC X(01) VALUE SPACE.        ACAT34RB
           05  FILLER                     PIC X(01) VALUE HIGH-VALUE.   ACAT34RB
                                                                        ACAT34RB
       01  WS-MQTY-AREA.                                                ACAT34RB
           05  WS-MQTY-ED-D4           PIC ZZZZ,ZZZ,ZZZ,ZZZ.9999-.      ACAT34RB
           05  WS-MQTY-ED-D3 REDEFINES WS-MQTY-ED-D4                    ACAT34RB
                                       PIC ZZZZZ,ZZZ,ZZZ,ZZZ.999-.      ACAT34RB
           05  WS-MQTY-ED-D2 REDEFINES WS-MQTY-ED-D3                    ACAT34RB
                                       PIC ZZZZZZ,ZZZ,ZZZ,ZZZ.99-.      ACAT34RB
           05  WS-MQTY-ED-D1 REDEFINES WS-MQTY-ED-D2                    ACAT34RB
                                       PIC ZZZZZZZ,ZZZ,ZZZ,ZZZ.9-.      ACAT34RB
           05  WS-MQTY-ED-D0 REDEFINES WS-MQTY-ED-D1                    ACAT34RB
                                       PIC ZZZZZ,ZZZ,ZZZ,ZZZ,ZZZ-.      ACAT34RB
       01  WS-QTY                      USAGE COMP-2.                    ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
       01  WS-SWITCH-AREA.                                              ACAT34RB
           05  WK-ERROR-SW                PIC X(01) VALUE SPACE.        ACAT34RB
               88  WK-ERROR                         VALUE 'Y'.          ACAT34RB
           05  WK-MSG-ON-SW               PIC X(01) VALUE SPACE.        ACAT34RB
               88  WK-MSG-ON                        VALUE 'Y'.          ACAT34RB
           05  WS-NO-MORE-DATA-SW         PIC X(01) VALUE SPACE.        ACAT34RB
               88  WS-NO-MORE-DATA                  VALUE 'N'.          ACAT34RB
           05  WS-SEARCH-CHANGED-SW       PIC X(01) VALUE SPACE.        ACAT34RB
               88  WS-SEARCH-CHANGED                VALUE 'Y'.          ACAT34RB
           05  WS-VALID-QTY-SW            PIC X(01).                    ACAT34RB
               88  WS-VALID-QTY                     VALUE 'Y'.          ACAT34RB
           05  WK-BROWSE-FORWARD-FLAG     PIC X(01) VALUE 'Y'.          ACAT34RB
               88  WK-BROWSE-FORWARD      VALUE 'Y'.                    ACAT34RB
               88  WK-BROWSE-BACKWARD     VALUE 'N'.                    ACAT34RB
           05  ALARM-NEEDED-FLAG          PIC X(01)  VALUE 'N'.         ACAT34RB
               88  ALARM-NEEDED           VALUE  'Y'.                   ACAT34RB
           05  END-OF-DATA-FLAG           PIC X(01)  VALUE 'N'.         ACAT34RB
               88  END-OF-DATA            VALUE  'Y'.                   ACAT34RB
           05  INPUT-ERROR-FLAG           PIC X(01)  VALUE 'N'.         ACAT34RB
               88  INPUT-ERROR            VALUE  'Y'.                   ACAT34RB
           05  FIRST-TIME-FLAG            PIC X(01)  VALUE 'N'.         ACAT34RB
               88  FIRST-TIME             VALUE  'Y'.                   ACAT34RB
           05  WS-DELETE-FLAG             PIC X(01)  VALUE 'N'.         ACAT34RB
               88  WS-DELETE              VALUE 'Y'.                    ACAT34RB
           05  WS-ERROR-THIS-LINE-FLAG    PIC X(01)  VALUE 'N'.         ACAT34RB
               88  ERROR-THIS-LINE        VALUE  'Y'.                   ACAT34RB
           05  WK-TS-READ-FLAG            PIC X(01).                    ACAT34RB
               88 WK-TS-READ-OK           VALUE 'Y'.                    ACAT34RB
               88 WK-TS-READ-ERROR        VALUE 'N'.                    ACAT34RB
           05  WS-KEY-FOUND-SW            PIC X(01).                    ACAT34RB
               88  WS-KEY-FOUND                      VALUE 'Y'.         ACAT34RB
           05  INPUT-OPT-SPACE-FLAG       PIC X(01)  VALUE 'N'.         ACAT34RB
               88  INPUT-OPT-SPACE                   VALUE 'Y'.         ACAT34RB
           05  DATA-ONLY-FLAG             PIC X(01)  VALUE 'N'.         ACAT34RB
               88  DATA-ONLY                         VALUE 'Y'.         ACAT34RB
           05  WS-USER-ENTRY-FOUND-SW     PIC X(01).                    ACAT34RB
               88  WS-USER-ENTRY-FOUND               VALUE 'Y'.         ACAT34RB
           05  WS-SCR-CHANGED-SW          PIC X(01)  VALUE SPACE.       ACAT34RB
               88  WS-SCR-CHANGED                    VALUE 'Y'.         ACAT34RB
           05  WS-ACCT-DELETED-SW         PIC X(01).                    ACAT34RB
               88 WS-ACCT-DELETED                    VALUE 'Y'.         ACAT34RB
           05  WS-LEAP-YEAR-SW            PIC X(01).                    ACAT34RB
               88 WS-LEAP-YEAR                       VALUE 'Y'.         ACAT34RB
           05  WS-SETUP-SCR-BKWARD-SW     PIC X(01).                    ACAT34RB
               88 WS-SETUP-SCR-BKWARD                VALUE 'Y'.         ACAT34RB
           05  WS-VALID-EXP-DATE-SW       PIC X(01).                    ACAT34RB
               88 WS-VALID-EXP-DATE                  VALUE 'Y'.         ACAT34RB
       01  ACAT-WORK-AREA.                                              ACAT34RB
           05  CURRENCY-NUM               PIC 9(03).                    ACAT34RB
           05  CURRENCY-X REDEFINES CURRENCY-NUM                        ACAT34RB
                                          PIC X(03).                    ACAT34RB
           05  WORK-AUTH-BRANCH           PIC X(03).                    ACAT34RB
           05  WORK-AUTH-AE               PIC X(03).                    ACAT34RB
           05  CALLED-PROGRAM-NAME        PIC X(08).                    ACAT34RB
           05  WORK-QTY-X                 PIC X(20).                    ACAT34RB
           05  FILLER REDEFINES WORK-QTY-X.                             ACAT34RB
               09 WORK-QTY                PIC 9(12)V9(05).              ACAT34RB
               09 FILLER                  PIC X(03).                    ACAT34RB
           05  WORK-DATE-X.                                             ACAT34RB
               09 WORK-DATE-X-MM          PIC X(02).                    ACAT34RB
               09 FILLER                  PIC X(01).                    ACAT34RB
               09 WORK-DATE-X-YY          PIC X(02).                    ACAT34RB
           05  WORK-DATE.                                               ACAT34RB
               09 WORK-DATE-MM            PIC X(02).                    ACAT34RB
               09 WORK-DATE-YY            PIC X(02).                    ACAT34RB
           05  TWA-CLIENT-NO-X.                                         ACAT34RB
               09 TWA-CLIENT-NO-9         PIC 9(03).                    ACAT34RB
           05  WK-CLT.                                                  ACAT34RB
               09 FILLER                  PIC X(01) VALUE '0'.          ACAT34RB
               09 WK-CLT-NBR              PIC X(03).                    ACAT34RB
           05  WS-LOOP-CNT                PIC S9(07) COMP-3.            ACAT34RB
           05  WS-ADD-CNT                 PIC S9(03) COMP-3 VALUE ZERO. ACAT34RB
           05  WK-SUSPEND-COUNT           PIC S9(04) COMP VALUE ZERO.   ACAT34RB
           05  ERASE-KEY-VALUE            PIC S9(04) COMP VALUE +128.   ACAT34RB
           05  FILLER REDEFINES ERASE-KEY-VALUE.                        ACAT34RB
               09  FILLER                 PIC X(01).                    ACAT34RB
               09  ERASE-KEY              PIC X(01).                    ACAT34RB
           05  REFORMAT-TIME              PIC 9(07).                    ACAT34RB
           05  FILLER REDEFINES REFORMAT-TIME.                          ACAT34RB
               09  FILLER                 PIC X(01).                    ACAT34RB
               09  REFORMAT-HH            PIC X(02).                    ACAT34RB
               09  REFORMAT-MM            PIC X(02).                    ACAT34RB
               09  FILLER                 PIC X(02).                    ACAT34RB
           05  WORK-TIME.                                               ACAT34RB
               09  WORK-HH                PIC X(02).                    ACAT34RB
               09  FILLER                 PIC X(01) VALUE ':'.          ACAT34RB
               09  WORK-MM                PIC X(02).                    ACAT34RB
           05  WK-CURSOR                  PIC S9(04) COMP.              ACAT34RB
           05  WS-COMMENT.                                              ACAT34RB
               09  WS-COMMENT-1           PIC X(67).                    ACAT34RB
               09  WS-COMMENT-2           PIC X(53).                    ACAT34RB
           05  SYSTEM-MSG                 PIC X(79) VALUE SPACES.       ACAT34RB
           05  WK-DB2-ERROR-MSG.                                        ACAT34RB
               09  WK-DB2-ERROR           PIC X(60).                    ACAT34RB
               09  FILLER                 PIC X(13) VALUE               ACAT34RB
                   ' => SQLCODE: '.                                     ACAT34RB
               09  WK-ERR-SQLCODE         PIC -999.                     ACAT34RB
           05  ABEND-LINE.                                              ACAT34RB
               09  ABEND-MSG              PIC X(30).                    ACAT34RB
               09  FILLER                 PIC X(11) VALUE ' EIBRESP ='. ACAT34RB
               09  ABEND-EIBRESP          PIC 99.                       ACAT34RB
           05  UNAUTH-MESSAGE             PIC X(79)                     ACAT34RB
               VALUE 'UNAUTHORIZED USER.'.                              ACAT34RB
           05  SEC-MESSAGE                PIC X(79)                     ACAT34RB
               VALUE 'SIGN ON SECURITY NOT AVAILABLE, TRY AGAIN.'.      ACAT34RB
           05  ERROR-PROG-MSG.                                          ACAT34RB
               09  ERROR-PROG-NAME        PIC X(08).                    ACAT34RB
               09  FILLER                 PIC X(71)                     ACAT34RB
                   VALUE ' PROGRAM NOT AVAILIABLE.'.                    ACAT34RB
           05  WS-MAP-TITLE.                                            ACAT34RB
               09  WS-ACTIVE-FILE-TITLE   PIC X(43)                     ACAT34RB
                   VALUE '       ** RESCIND / BLOCK FILE **          '. ACAT34RB
               09  WS-HISTORY-FILE-TITLE  PIC X(43)                     ACAT34RB
                   VALUE '** HISTORICAL RESCIND/BLOCK FILE INQUIRY **'. ACAT34RB
           05  WS-ADPSEC-EDITED.                                        ACAT34RB
               09  WS-XX-ADPSEC           PIC X(02).                    ACAT34RB
               09  WS-ADPSEC              PIC X(07).                    ACAT34RB
               09  FILLER                 PIC X(03).                    ACAT34RB
           05  WS-RSND-KEY.                                             ACAT34RB
               09  WS-RSND-KEY-BR         PIC X(03).                    ACAT34RB
               09  WS-RSND-KEY-ACCT       PIC X(05).                    ACAT34RB
               09  WS-RSND-KEY-BLCKCD     PIC X(01).                    ACAT34RB
               09  WS-RSND-KEY-CBRKR      PIC X(04).                    ACAT34RB
               09  WS-RSND-KEY-SEC        PIC X(12).                    ACAT34RB
               09  WS-RSND-KEY-SEQ-NBR    PIC S9(4) COMP.               ACAT34RB
           05  WS-MAP-KEY1.                                             ACAT34RB
               09  WS-MAP-BLCKCD-KEY1     PIC X(01).                    ACAT34RB
               09  WS-MAP-BR-AC-KEY1.                                   ACAT34RB
                   11  WS-MAP-BR-KEY1     PIC X(03).                    ACAT34RB
                   11  WS-MAP-ACCT-KEY1   PIC X(05).                    ACAT34RB
               09  WS-MAP-CBRKR-KEY1      PIC X(04).                    ACAT34RB
               09  WS-MAP-SEC-KEY1        PIC X(12).                    ACAT34RB
           05  WS-MAP-KEY2.                                             ACAT34RB
               09  WS-MAP-BLCKCD-KEY2     PIC X(01).                    ACAT34RB
               09  WS-MAP-BR-AC-KEY2.                                   ACAT34RB
                   11  WS-MAP-BR-KEY2     PIC X(03).                    ACAT34RB
                   11  WS-MAP-ACCT-KEY2   PIC X(05).                    ACAT34RB
               09  WS-MAP-CBRKR-KEY2      PIC X(04).                    ACAT34RB
               09  WS-MAP-SEC-KEY2        PIC X(12).                    ACAT34RB
           05  DB2IO-ERR-MSG              PIC X(54).                    ACAT34RB
           05  SAVE-INTRAN-FLAG           PIC X(01).                    ACAT34RB
           05  PREV-INTRAN-FLAG           PIC X(01).                    ACAT34RB
           05  WS-DIVIDED                 PIC 9(03).                    ACAT34RB
           05  WS-REMAIN                  PIC 9(02).                    ACAT34RB
           05  WS-ACAT-NEXT               PIC X.                        ACAT34RB
           05  WS-INIT-TFR-ROWS           PIC 9(03).                    ACAT34RB
           05  WS-SECURITY                PIC X(12).                    ACAT34RB
           05  SUB                        PIC S9(09) COMP-3.            ACAT34RB
           05  SUB2                       PIC S9(09) COMP-3.            ACAT34RB
           05  SUB3                       PIC S9(09) COMP-3.            ACAT34RB
           05  C-IDX                      PIC S9(03) COMP-3.            ACAT34RB
      *                                                                 ACAT34RB
       01  ACATPPIO-CALL-AREA.                                          ACAT34RB
           COPY ACATPPIO.                                               ACAT34RB
           EJECT                                                        ACAT34RB
       01  ACATMSD-CALL-AREA.                                           ACAT34RB
           COPY ACATMSDI.                                               ACAT34RB
           EJECT                                                        ACAT34RB
       01  ACAT34IO-COMMAREA.                                           ACAT34RB
           COPY ACAT34IO.                                               ACAT34RB
           EJECT                                                        ACAT34RB
       01  WS-POP-UP-WORKAREA.                                          ACAT34RB
           COPY ACAT90TS.                                               ACAT34RB
           EJECT                                                        ACAT34RB
       01  ACATNAIO-CALL-AREA.                                          ACAT34RB
           COPY ACATNAIO.                                               ACAT34RB
           EJECT                                                        ACAT34RB
       COPY ACATCOM.                                                    ACAT34RB
           EJECT                                                        ACAT34RB
       COPY ACATSRCH.                                                   ACAT34RB
           EJECT                                                        ACAT34RB
       COPY SECLINKC.                                                   ACAT34RB
           EJECT                                                        ACAT34RB
       COPY ATTR.                                                       ACAT34RB
           EJECT                                                        ACAT34RB
       COPY DFHAID.                                                     ACAT34RB
           EJECT                                                        ACAT34RB
       COPY ACAT00M.                                                    ACAT34RB
       COPY ACAT34M.                                                    ACAT34RB
       01  ACAT34MR REDEFINES ACAT34MI.                                 ACAT34RB
           02  FILLER                          PIC X(58).               ACAT34RB
           02  RESCIND-INFO    OCCURS 2 TIMES.                          ACAT34RB
               03  ACTION-L                    PIC S9(4) COMP.          ACAT34RB
               03  ACTION-A                    PIC X(01).               ACAT34RB
               03  ACTION-O                    PIC X(01).               ACAT34RB
               03  BLCKCD-L                    PIC S9(4) COMP.          ACAT34RB
               03  BLCKCD-A                    PIC X(01).               ACAT34RB
               03  BLCKCD-O                    PIC X(01).               ACAT34RB
               03  BRANCH-L                    PIC S9(4) COMP.          ACAT34RB
               03  BRANCH-A                    PIC X(01).               ACAT34RB
               03  BRANCH-O                    PIC X(03).               ACAT34RB
               03  ACCT-L                      PIC S9(4) COMP.          ACAT34RB
               03  ACCT-A                      PIC X(01).               ACAT34RB
               03  ACCT-O                      PIC X(05).               ACAT34RB
               03  CBRKR-L                     PIC S9(4) COMP.          ACAT34RB
               03  CBRKR-A                     PIC X(01).               ACAT34RB
               03  CBRKR-O                     PIC X(04).               ACAT34RB
               03  SEC-L                       PIC S9(4) COMP.          ACAT34RB
               03  SEC-A                       PIC X(01).               ACAT34RB
               03  SEC-O                       PIC X(12).               ACAT34RB
               03  NAME1-L                     PIC S9(4) COMP.          ACAT34RB
               03  NAME1-A                     PIC X(01).               ACAT34RB
               03  NAME1-O                     PIC X(30).               ACAT34RB
               03  ADPSEC-L                    PIC S9(4) COMP.          ACAT34RB
               03  ADPSEC-A                    PIC X(01).               ACAT34RB
               03  ADPSEC-O                    PIC X(07).               ACAT34RB
               03  NAME2-L                     PIC S9(4) COMP.          ACAT34RB
               03  NAME2-A                     PIC X(01).               ACAT34RB
               03  NAME2-O                     PIC X(30).               ACAT34RB
               03  DESC1-L                     PIC S9(4) COMP.          ACAT34RB
               03  DESC1-A                     PIC X(01).               ACAT34RB
               03  DESC1-O                     PIC X(30).               ACAT34RB
               03  CRTDATE-L                   PIC S9(4) COMP.          ACAT34RB
               03  CRTDATE-A                   PIC X(01).               ACAT34RB
               03  CRTDATE-O                   PIC X(08).               ACAT34RB
               03  DESC2-L                     PIC S9(4) COMP.          ACAT34RB
               03  DESC2-A                     PIC X(01).               ACAT34RB
               03  DESC2-O                     PIC X(30).               ACAT34RB
               03  EXPDATE-L                   PIC S9(4) COMP.          ACAT34RB
               03  EXPDATE-A                   PIC X(01).               ACAT34RB
               03  EXPDATE-O                   PIC X(08).               ACAT34RB
               03  UPDDATE-L                   PIC S9(4) COMP.          ACAT34RB
               03  UPDDATE-A                   PIC X(01).               ACAT34RB
               03  UPDDATE-O                   PIC X(08).               ACAT34RB
               03  USER-L                      PIC S9(4) COMP.          ACAT34RB
               03  USER-A                      PIC X(01).               ACAT34RB
               03  USER-O                      PIC X(04).               ACAT34RB
               03  CMNT1-L                     PIC S9(4) COMP.          ACAT34RB
               03  CMNT1-A                     PIC X(01).               ACAT34RB
               03  CMNT1-O                     PIC X(67).               ACAT34RB
               03  CMNT2-L                     PIC S9(4) COMP.          ACAT34RB
               03  CMNT2-A                     PIC X(01).               ACAT34RB
               03  CMNT2-O                     PIC X(53).               ACAT34RB
           02  FILLER                          PIC X(04).               ACAT34RB
            EJECT                                                       ACAT34RB
       LINKAGE SECTION.                                                 ACAT34RB
       01  DFHCOMMAREA.                                                 ACAT34RB
           03  FILLER                          PIC X(2000).             ACAT34RB
                                                                        ACAT34RB
       COPY TWACOMMN.                                                   ACAT34RB
           03 TWA-ACAT-AREA.                                            ACAT34RB
              05 TWA-MAP-AREA.                                          ACAT34RB
                 07 TWA-MAP-RSND-AREA   OCCURS 2 TIMES.                 ACAT34RB
                    09 TWA-MAP-ACTION       PIC X(01).                  ACAT34RB
                    09 TWA-MAP-BLCKCD       PIC X(01).                  ACAT34RB
                    09 TWA-MAP-BR           PIC X(03).                  ACAT34RB
                    09 TWA-MAP-ACCT         PIC X(05).                  ACAT34RB
                    09 TWA-MAP-CBRKR        PIC X(04).                  ACAT34RB
                    09 TWA-MAP-SEC          PIC X(12).                  ACAT34RB
                    09 TWA-MAP-ADPSEC       PIC X(07).                  ACAT34RB
                    09 TWA-MAP-CRTDT        PIC X(08).                  ACAT34RB
                    09 TWA-MAP-EXPDT        PIC X(08).                  ACAT34RB
                    09 TWA-MAP-UPDDT        PIC X(08).                  ACAT34RB
                    09 TWA-MAP-USER         PIC X(04).                  ACAT34RB
                    09 TWA-MAP-NAME1        PIC X(30).                  ACAT34RB
                    09 TWA-MAP-NAME2        PIC X(30).                  ACAT34RB
                    09 TWA-MAP-DESC1        PIC X(30).                  ACAT34RB
                    09 TWA-MAP-DESC2        PIC X(30).                  ACAT34RB
                    09 TWA-MAP-CMNT1        PIC X(67).                  ACAT34RB
                    09 TWA-MAP-CMNT2        PIC X(53).                  ACAT34RB
                    09 TWA-MAP-HIST-SEQ     PIC S9(4) COMP.             ACAT34RB
                 07 TWA-MAP-NEXT            PIC X(01).                  ACAT34RB
              05 TWA-MAP-SAVE-AREA.                                     ACAT34RB
                 07 TWA-MAP-OCCURENCE-AREA OCCURS 2 TIMES.              ACAT34RB
                    09 TWA-ORIG-EXPDT       PIC X(08).                  ACAT34RB
                    09 TWA-ORIG-CMNT1       PIC X(67).                  ACAT34RB
                    09 TWA-ORIG-CMNT2       PIC X(53).                  ACAT34RB
                 07 TWA-MAP-CHG-IND         PIC X(01).                  ACAT34RB
                 07 TWA-UPDATE-IND          PIC X(01).                  ACAT34RB
                    88 TWA-UPDATE-ADD                 VALUE 'A'.        ACAT34RB
                    88 TWA-UPDATE-MOD                 VALUE 'M'.        ACAT34RB
                 07 TWA-SCR-LINE            PIC 9(02).                  ACAT34RB
              05 TWA-MAP-KEY-AREA.                                      ACAT34RB
                 07 TWA-MAP-KEY-1.                                      ACAT34RB
                    09 TWA-KEY-BR-1         PIC X(03).                  ACAT34RB
                    09 TWA-KEY-ACCT-1       PIC X(05).                  ACAT34RB
                    09 TWA-KEY-BLCKCD-1     PIC X(01).                  ACAT34RB
                    09 TWA-KEY-CBRKR-1      PIC X(04).                  ACAT34RB
                    09 TWA-KEY-SEC-1        PIC X(12).                  ACAT34RB
                    09 TWA-KEY-SEQ-1        PIC 9(4) COMP.              ACAT34RB
                 07 TWA-MAP-KEY-2.                                      ACAT34RB
                    09 TWA-KEY-BR-2         PIC X(03).                  ACAT34RB
                    09 TWA-KEY-ACCT-2       PIC X(05).                  ACAT34RB
                    09 TWA-KEY-BLCKCD-2     PIC X(01).                  ACAT34RB
                    09 TWA-KEY-CBRKR-2      PIC X(04).                  ACAT34RB
                    09 TWA-KEY-SEC-2        PIC X(12).                  ACAT34RB
                    09 TWA-KEY-SEQ-2        PIC 9(4) COMP.              ACAT34RB
              05 TWA-MAP-SEARCH.                                        ACAT34RB
                 07 TWA-MAP-MMBR            PIC X(3).                   ACAT34RB
                 07 TWA-MAP-MMAC            PIC X(5).                   ACAT34RB
                 07 TWA-MAP-MMRR            PIC X(3).                   ACAT34RB
                 07 TWA-MAP-MMTFR           PIC X(3).                   ACAT34RB
                 07 TWA-MAP-MMRD            PIC X(1).                   ACAT34RB
                 07 TWA-MAP-MMBKR           PIC X(4).                   ACAT34RB
                 07 TWA-MAP-MMSTAT          PIC X(3).                   ACAT34RB
                 07 TWA-MAP-MMSD            PIC X(6).                   ACAT34RB
              05 TWA-PREV-MAP-SEARCH.                                   ACAT34RB
                 07 TWA-PREV-MMBR           PIC X(3).                   ACAT34RB
                 07 TWA-PREV-MMAC           PIC X(5).                   ACAT34RB
                 07 TWA-PREV-MMRR           PIC X(3).                   ACAT34RB
                 07 TWA-PREV-MMTFR          PIC X(3).                   ACAT34RB
                 07 TWA-PREV-MMRD           PIC X(1).                   ACAT34RB
                 07 TWA-PREV-MMBKR          PIC X(4).                   ACAT34RB
                 07 TWA-PREV-MMSTAT         PIC X(3).                   ACAT34RB
                 07 TWA-PREV-MMSD           PIC X(6).                   ACAT34RB
              05 TWA-ACTIVE-HIST-SCR-IND    PIC X(01).                  ACAT34RB
                 88 TWA-ACTIVE-FILE-SCR               VALUE 'A'.        ACAT34RB
                 88 TWA-HISTORY-FILE-SCR              VALUE 'H'.        ACAT34RB
           EJECT                                                        ACAT34RB
      *                                                                 ACAT34RB
       PROCEDURE DIVISION.                                              ACAT34RB
       INITIALIZATION.                                                  ACAT34RB
           EXEC CICS IGNORE CONDITION DUPKEY DUPREC  ENDFILE  ERROR     ACAT34RB
                     ILLOGIC INVREQ   IOERR  ITEMERR LENGERR  MAPFAIL   ACAT34RB
                     NOSPACE NOSTG    NOTFND         PGMIDERR QIDERR    ACAT34RB
           END-EXEC.                                                    ACAT34RB
      *    EXEC CICS HANDLE CONDITION NOTOPEN (NOT-OPEN)                ACAT34RB
      *                              DISABLED (NOT-OPEN)                ACAT34RB
      *                              DSIDERR  (NOT-OPEN)                ACAT34RB
      *    END-EXEC.                                                    ACAT34RB
                                                                        ACAT34RB
           EXEC CICS ASSIGN TWALENG (TWA-SIZE)                          ACAT34RB
           END-EXEC.                                                    ACAT34RB
           IF TWA-SIZE = 0                                              ACAT34RB
              MOVE LOW-VALUE TO ACAT34MO                                ACAT34RB
              SET WK-ERROR TO TRUE                                      ACAT34RB
              MOVE 'TWA SIZE EQUAL ZERO, FATAL ERROR' TO SYSTEM-MSG     ACAT34RB
              PERFORM  9000-ERROR-RTN.                                  ACAT34RB
                                                                        ACAT34RB
           EXEC CICS ADDRESS TWA (ADDRESS OF TWA-AREA)                  ACAT34RB
           END-EXEC.                                                    ACAT34RB
                                                                        ACAT34RB
           EJECT                                                        ACAT34RB
                                                                        ACAT34RB
       MAIN-PROCESSING.                                                 ACAT34RB
           MOVE EIBTRMID TO TERM-ID.                                    ACAT34RB
           MOVE EIBTRNID TO TRAN-ID.                                    ACAT34RB
           MOVE TWA-CLIENT-NO TO TWA-CLIENT-NO-9.                       ACAT34RB
           MOVE 'N'           TO END-OF-DATA-FLAG.                      ACAT34RB
           MOVE SPACES        TO SYSTEM-MSG.                            ACAT34RB
           MOVE LOW-VALUE     TO HDRMAPO                                ACAT34RB
                                 ACAT34MO.                              ACAT34RB
           PERFORM 0100-GET-DATE-AND-TIME.                              ACAT34RB
           MOVE  DFHCOMMAREA     TO  ACATCOMM-COMMAREA.                 ACAT34RB
           MOVE  TWA-CLIENT-NO-X TO  WK-CLT-NBR.                        ACAT34RB
           MOVE  WK-CLT          TO  ACAT34-PASS-CLT.                   ACAT34RB
                                                                        ACAT34RB
           IF  ACAT-PROGRAM-NAME = 'ACAT34RB'                           ACAT34RB
               MOVE SPACES TO ACAT-CALLING-PROG-NAME                    ACAT34RB
               PERFORM 0900-CONTINUE-PROCESS                            ACAT34RB
           ELSE                                                         ACAT34RB
               MOVE 'ACAT34RB' TO ACAT-PROGRAM-NAME                     ACAT34RB
               MOVE SPACES TO ACAT-CALLING-PROG-NAME                    ACAT34RB
                              TWA-ACAT-AREA                             ACAT34RB
               MOVE ZEROES TO TWA-SCR-LINE                              ACAT34RB
               SET TWA-ACTIVE-FILE-SCR   TO TRUE                        ACAT34RB
               SET FIRST-TIME TO TRUE                                   ACAT34RB
               PERFORM 0200-FIRST-TIME-RTN.                             ACAT34RB
           EJECT                                                        ACAT34RB
                                                                        ACAT34RB
       0100-GET-DATE-AND-TIME.                                          ACAT34RB
           EXEC  CICS ASKTIME                                           ACAT34RB
                 ABSTIME(WSABSTIME)                                     ACAT34RB
           END-EXEC.                                                    ACAT34RB
           EXEC  CICS FORMATTIME                                        ACAT34RB
                 ABSTIME(WSABSTIME)                                     ACAT34RB
                 MMDDYY(WSMMDDYY)                                       ACAT34RB
                 DATESEP(WSDATESEP)                                     ACAT34RB
                 TIME(WSTIME)                                           ACAT34RB
                 TIMESEP(WSTIMESEP)                                     ACAT34RB
           END-EXEC.                                                    ACAT34RB
           EJECT                                                        ACAT34RB
      *                                                                 ACAT34RB
       0200-FIRST-TIME-RTN.                                             ACAT34RB
           MOVE '1' TO ACAT-NEXT.                                       ACAT34RB
           PERFORM 7010-DELETE-TSQ-RTN.                                 ACAT34RB
           PERFORM 2000-ATTRIB-TO-ASKIP.                                ACAT34RB
           MOVE ACAT-INP-BRANCH     TO  MMBRO   TWA-MAP-MMBR.           ACAT34RB
           MOVE ACAT-INP-ACCOUNT    TO  MMACO   TWA-MAP-MMAC.           ACAT34RB
           MOVE ACAT-INP-RR         TO  MMRRO   TWA-MAP-MMRR.           ACAT34RB
           MOVE ACAT-INP-TFR-TYP    TO  MMTFRO  TWA-MAP-MMTFR.          ACAT34RB
           MOVE ACAT-INP-RCV-DEL    TO  MMRDO   TWA-MAP-MMRD.           ACAT34RB
           MOVE ACAT-INP-CONTRA-BKR TO  MMBKRO  TWA-MAP-MMBKR.          ACAT34RB
           MOVE ACAT-INP-STATUS     TO  MMSTATO TWA-MAP-MMSTAT.         ACAT34RB
           MOVE ACAT-INP-STTL-DT    TO  MMSDO   TWA-MAP-MMSD.           ACAT34RB
           MOVE TWA-MAP-SEARCH      TO  TWA-PREV-MAP-SEARCH.            ACAT34RB
           MOVE  '1'   TO  ACAT-INP-SEL.                                ACAT34RB
                                                                        ACAT34RB
           IF TWA-ACTIVE-FILE-SCR                                       ACAT34RB
               MOVE WS-ACTIVE-FILE-TITLE TO MTITLEO                     ACAT34RB
               MOVE ATT-ASKIP            TO MTITLEA                     ACAT34RB
           ELSE                                                         ACAT34RB
           IF TWA-HISTORY-FILE-SCR                                      ACAT34RB
               MOVE WS-HISTORY-FILE-TITLE TO MTITLEO                    ACAT34RB
               MOVE ATT-ASKIP-BRT        TO MTITLEA                     ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           PERFORM 1140-VALIDATE-SRCH-ENGINE.                           ACAT34RB
           IF NOT WK-ERROR                                              ACAT34RB
              PERFORM 0400-REFRESH-MAP                                  ACAT34RB
              MOVE -1 TO MNEXTL.                                        ACAT34RB
                                                                        ACAT34RB
           PERFORM 7020-WRITE-TSQ-RTN.                                  ACAT34RB
           PERFORM 8000-SEND-MAP-ERASE.                                 ACAT34RB
           PERFORM 8800-RETURN-TO-CICS.                                 ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
      *      REFRESH MAP WITH NEW RESCIND ACCOUNT DATA               *  ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
       0400-REFRESH-MAP.                                                ACAT34RB
           MOVE SPACE TO WS-NO-MORE-DATA-SW.                            ACAT34RB
           IF TWA-ACTIVE-FILE-SCR                                       ACAT34RB
              PERFORM 0500-OPEN-RSND-ACCT-CSR                           ACAT34RB
           ELSE                                                         ACAT34RB
           IF TWA-HISTORY-FILE-SCR                                      ACAT34RB
              PERFORM 0700-OPEN-RSND-HIST-CSR                           ACAT34RB
           END-IF.                                                      ACAT34RB
           PERFORM VARYING SUB FROM 1 BY 1                              ACAT34RB
                       UNTIL WS-NO-MORE-DATA  OR  SUB > 2               ACAT34RB
              IF TWA-ACTIVE-FILE-SCR                                    ACAT34RB
                 PERFORM 0510-FETCH-RSND-ACCT-CSR                       ACAT34RB
              ELSE                                                      ACAT34RB
                 PERFORM 0710-FETCH-RSND-HIST-CSR                       ACAT34RB
              END-IF                                                    ACAT34RB
              IF WS-NO-MORE-DATA                                        ACAT34RB
                 IF SUB = 1                                             ACAT34RB
                    MOVE SPACE TO TWA-MAP-KEY-1 TWA-MAP-KEY-2           ACAT34RB
                    MOVE -1 TO MNEXTL                                   ACAT34RB
                    SET WK-MSG-ON TO TRUE                               ACAT34RB
                    MOVE 'NO RESCIND ACCOUNTS FOUND FOR THIS REQUEST'   ACAT34RB
                      TO  SYSTEM-MSG                                    ACAT34RB
                 END-IF                                                 ACAT34RB
              ELSE                                                      ACAT34RB
                 PERFORM 0800-SETUP-SCREEN                              ACAT34RB
              END-IF                                                    ACAT34RB
           END-PERFORM.                                                 ACAT34RB
           IF TWA-ACTIVE-FILE-SCR                                       ACAT34RB
              PERFORM 0520-CLOSE-RSND-ACCT-CSR                          ACAT34RB
           ELSE                                                         ACAT34RB
           IF TWA-HISTORY-FILE-SCR                                      ACAT34RB
              PERFORM 0720-CLOSE-RSND-HIST-CSR                          ACAT34RB
           END-IF.                                                      ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
      *          OPEN RESCIND ACCOUNT CURSOR TABLE                   *  ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
       0500-OPEN-RSND-ACCT-CSR.                                         ACAT34RB
           MOVE WK-CLT            TO ACAT34-PASS-CLT.                   ACAT34RB
           IF TWA-MAP-MMBR > SPACE                                      ACAT34RB
              MOVE TWA-MAP-MMBR   TO ACAT34-PASS-BR-FROM                ACAT34RB
           ELSE                                                         ACAT34RB
              MOVE SPACE          TO ACAT34-PASS-BR-FROM                ACAT34RB
           END-IF.                                                      ACAT34RB
           IF TWA-MAP-MMAC > SPACE                                      ACAT34RB
              MOVE TWA-MAP-MMAC   TO ACAT34-PASS-ACCT                   ACAT34RB
           ELSE                                                         ACAT34RB
              MOVE SPACE          TO ACAT34-PASS-ACCT                   ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           SET ACAT34-OPN-RSND-CSR TO TRUE.                             ACAT34RB
           PERFORM 7600-LINK-TO-ACAT34DB.                               ACAT34RB
           IF ACAT34-ERROR                                              ACAT34RB
LRM002        MOVE                                                      ACAT34RB
LRM002        'DB2 OPEN ERROR ON RESCIND ACCT TBL - CALL HELP DESK'     ACAT34RB
                TO  WK-DB2-ERROR                                        ACAT34RB
              PERFORM 0600-SEND-DB2-ERROR-MSG.                          ACAT34RB
      *                                                                 ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
      *         FETCH RESCIND ACCOUNT CURSOR TABLE                   *  ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
       0510-FETCH-RSND-ACCT-CSR.                                        ACAT34RB
           SET ACAT34-FET-RSND-CSR TO TRUE.                             ACAT34RB
           PERFORM 7600-LINK-TO-ACAT34DB.                               ACAT34RB
           IF ACAT34-NORMAL                                             ACAT34RB
              CONTINUE                                                  ACAT34RB
           ELSE                                                         ACAT34RB
           IF ACAT34-NOT-FOUND                                          ACAT34RB
              SET WS-NO-MORE-DATA TO TRUE                               ACAT34RB
           ELSE                                                         ACAT34RB
              PERFORM 0520-CLOSE-RSND-ACCT-CSR                          ACAT34RB
LRM002        MOVE                                                      ACAT34RB
LRM002        'DB2 FETCH ERROR ON RESCIND ACCT TBL - CALL HELP DESK'    ACAT34RB
                TO  WK-DB2-ERROR                                        ACAT34RB
              PERFORM 0600-SEND-DB2-ERROR-MSG.                          ACAT34RB
      *                                                                 ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
      *         CLOSE RESCIND ACCOUNT CURSOR TABLE                   *  ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
       0520-CLOSE-RSND-ACCT-CSR.                                        ACAT34RB
           SET ACAT34-CLO-RSND-CSR TO TRUE.                             ACAT34RB
           PERFORM 7600-LINK-TO-ACAT34DB.                               ACAT34RB
           IF ACAT34-ERROR                                              ACAT34RB
LRM002        MOVE                                                      ACAT34RB
LRM002        'DB2 CLOSE ERROR ON RESCIND ACCT TBL - CALL HELP DESK'    ACAT34RB
                TO  WK-DB2-ERROR                                        ACAT34RB
              PERFORM 0600-SEND-DB2-ERROR-MSG.                          ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
      *   OPEN RESCIND ACCOUNT CURSOR TABLE IN DESCENDING ORDER      *  ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
       0530-OPEN-RSND-ACCT-CSR-DESC.                                    ACAT34RB
           MOVE WK-CLT            TO ACAT34-PASS-CLT.                   ACAT34RB
           IF TWA-MAP-MMBR > SPACE                                      ACAT34RB
              MOVE TWA-MAP-MMBR   TO ACAT34-PASS-BR-FROM                ACAT34RB
           ELSE                                                         ACAT34RB
              MOVE SPACE          TO ACAT34-PASS-BR-FROM                ACAT34RB
           END-IF.                                                      ACAT34RB
           IF TWA-MAP-MMAC > SPACE                                      ACAT34RB
              MOVE TWA-MAP-MMAC   TO ACAT34-PASS-ACCT                   ACAT34RB
           ELSE                                                         ACAT34RB
              MOVE SPACE          TO ACAT34-PASS-ACCT                   ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           SET ACAT34-OPN-RSND-CSR-DESC TO TRUE.                        ACAT34RB
           PERFORM 7600-LINK-TO-ACAT34DB.                               ACAT34RB
           IF ACAT34-ERROR                                              ACAT34RB
              MOVE 'DB2 OPEN ERROR ON RESCIND CURSOR TBL IN DESCENDING OACAT34RB
LRM002-            'RDER - CALL HELP DESK'                              ACAT34RB
                TO  WK-DB2-ERROR                                        ACAT34RB
              PERFORM 0600-SEND-DB2-ERROR-MSG.                          ACAT34RB
      *                                                                 ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
      *  FETCH RESCIND ACCOUNT CURSOR TABLE IN DESCENDING ORDER      *  ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
       0540-FETCH-RSND-ACCT-CSR-DESC.                                   ACAT34RB
           SET ACAT34-FET-RSND-CSR-DESC TO TRUE.                        ACAT34RB
           PERFORM 7600-LINK-TO-ACAT34DB.                               ACAT34RB
           IF ACAT34-NORMAL                                             ACAT34RB
              CONTINUE                                                  ACAT34RB
           ELSE                                                         ACAT34RB
           IF ACAT34-NOT-FOUND                                          ACAT34RB
              SET WS-NO-MORE-DATA TO TRUE                               ACAT34RB
           ELSE                                                         ACAT34RB
              PERFORM 0550-CLOSE-RSND-ACCT-CSR-DESC                     ACAT34RB
              MOVE 'DB2 FETCH ERROR ON RESCIND CURSOR TBL IN DESCENDING ACAT34RB
LRM002-            'ORDER - CALL HELP DESK'                             ACAT34RB
                TO  WK-DB2-ERROR                                        ACAT34RB
              PERFORM 0600-SEND-DB2-ERROR-MSG.                          ACAT34RB
      *                                                                 ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
      *  CLOSE RESCIND ACCOUNT CURSOR TABLE IN DESCENDING ORDER      *  ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
       0550-CLOSE-RSND-ACCT-CSR-DESC.                                   ACAT34RB
           SET ACAT34-CLO-RSND-CSR-DESC TO TRUE.                        ACAT34RB
           PERFORM 7600-LINK-TO-ACAT34DB.                               ACAT34RB
           IF ACAT34-ERROR                                              ACAT34RB
              MOVE 'DB2 CLOSE ERROR ON RESCIND CURSOR TBL IN DESCENDING ACAT34RB
LRM002-            'ORDER - CALL HELP DESK'                             ACAT34RB
                TO  WK-DB2-ERROR                                        ACAT34RB
              PERFORM 0600-SEND-DB2-ERROR-MSG.                          ACAT34RB
      *                                                                 ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
      *        DB2 ERROR MESSAGE ROUTINE                             *  ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
       0600-SEND-DB2-ERROR-MSG.                                         ACAT34RB
           MOVE -1 TO MNEXTL.                                           ACAT34RB
           SET WK-ERROR TO TRUE.                                        ACAT34RB
           MOVE  ACAT34-SQLCODE   TO WK-ERR-SQLCODE.                    ACAT34RB
           MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG.                        ACAT34RB
           PERFORM 9000-ERROR-RTN.                                      ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
      *        OPEN RESCIND HISTORY CURSOR TABLE                     *  ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
       0700-OPEN-RSND-HIST-CSR.                                         ACAT34RB
           MOVE WK-CLT            TO ACAT34-PASS-CLT.                   ACAT34RB
           IF TWA-MAP-MMBR > SPACE                                      ACAT34RB
              MOVE TWA-MAP-MMBR   TO ACAT34-PASS-BR-FROM                ACAT34RB
           ELSE                                                         ACAT34RB
              MOVE SPACE          TO ACAT34-PASS-BR-FROM                ACAT34RB
           END-IF.                                                      ACAT34RB
           MOVE ACAT34-PASS-BR-FROM TO ACAT34-PASS-BR-TO.               ACAT34RB
           IF TWA-MAP-MMAC > SPACE                                      ACAT34RB
              MOVE TWA-MAP-MMAC   TO ACAT34-PASS-ACCT                   ACAT34RB
           ELSE                                                         ACAT34RB
              MOVE SPACE          TO ACAT34-PASS-ACCT                   ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           SET ACAT34-OPN-HIST-CSR TO TRUE.                             ACAT34RB
           PERFORM 7600-LINK-TO-ACAT34DB.                               ACAT34RB
           IF ACAT34-ERROR                                              ACAT34RB
LRM002        MOVE                                                      ACAT34RB
LRM002        'DB2 OPEN ERROR ON RESCIND HIST TBL - CALL HELP DESK'     ACAT34RB
                TO  WK-DB2-ERROR                                        ACAT34RB
              PERFORM 0600-SEND-DB2-ERROR-MSG.                          ACAT34RB
      *                                                                 ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
      *         FETCH RESCIND HISTORY CURSOR TABLE                   *  ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
       0710-FETCH-RSND-HIST-CSR.                                        ACAT34RB
           SET ACAT34-FET-HIST-CSR TO TRUE.                             ACAT34RB
           PERFORM 7600-LINK-TO-ACAT34DB.                               ACAT34RB
           IF ACAT34-NORMAL                                             ACAT34RB
              CONTINUE                                                  ACAT34RB
           ELSE                                                         ACAT34RB
           IF ACAT34-NOT-FOUND                                          ACAT34RB
              SET WS-NO-MORE-DATA TO TRUE                               ACAT34RB
           ELSE                                                         ACAT34RB
              PERFORM 0720-CLOSE-RSND-HIST-CSR                          ACAT34RB
LRM002        MOVE                                                      ACAT34RB
LRM002        'DB2 FETCH ERROR ON RESCIND HIST TBL - CALL HELP DESK'    ACAT34RB
                TO  WK-DB2-ERROR                                        ACAT34RB
              PERFORM 0600-SEND-DB2-ERROR-MSG.                          ACAT34RB
      *                                                                 ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
      *         CLOSE RESCIND HISTORY CURSOR TABLE                   *  ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
       0720-CLOSE-RSND-HIST-CSR.                                        ACAT34RB
           SET ACAT34-CLO-HIST-CSR TO TRUE.                             ACAT34RB
           PERFORM 7600-LINK-TO-ACAT34DB.                               ACAT34RB
           IF ACAT34-ERROR                                              ACAT34RB
LRM002        MOVE                                                      ACAT34RB
LRM002        'DB2 CLOSE ERROR ON RESCIND HIST TBL - CALL HELP DESK'    ACAT34RB
                TO  WK-DB2-ERROR                                        ACAT34RB
              PERFORM 0600-SEND-DB2-ERROR-MSG.                          ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
      *   OPEN RESCIND HISTORY CURSOR TABLE IN DESCENDING ORDER      *  ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
       0730-OPEN-RSND-HIST-CSR-DESC.                                    ACAT34RB
           MOVE WK-CLT            TO ACAT34-PASS-CLT.                   ACAT34RB
           IF TWA-MAP-MMBR > SPACE                                      ACAT34RB
              MOVE TWA-MAP-MMBR   TO ACAT34-PASS-BR-FROM                ACAT34RB
           ELSE                                                         ACAT34RB
              MOVE SPACE          TO ACAT34-PASS-BR-FROM                ACAT34RB
           END-IF.                                                      ACAT34RB
           IF TWA-KEY-BR-2 > SPACE                                      ACAT34RB
              MOVE TWA-KEY-BR-2   TO ACAT34-PASS-BR-TO                  ACAT34RB
           ELSE                                                         ACAT34RB
           IF TWA-KEY-BR-1 > SPACE                                      ACAT34RB
              MOVE TWA-KEY-BR-1   TO ACAT34-PASS-BR-TO                  ACAT34RB
           ELSE                                                         ACAT34RB
              MOVE SPACE          TO ACAT34-PASS-BR-TO                  ACAT34RB
           END-IF.                                                      ACAT34RB
           IF TWA-MAP-MMAC > SPACE                                      ACAT34RB
              MOVE TWA-MAP-MMAC   TO ACAT34-PASS-ACCT                   ACAT34RB
           ELSE                                                         ACAT34RB
              MOVE SPACE          TO ACAT34-PASS-ACCT                   ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           SET ACAT34-OPN-HIST-CSR-DESC TO TRUE.                        ACAT34RB
           PERFORM 7600-LINK-TO-ACAT34DB.                               ACAT34RB
           IF ACAT34-ERROR                                              ACAT34RB
              MOVE 'DB2 OPEN ERROR ON HISTORY CURSOR TBL IN DESCENDING OACAT34RB
LRM002-            'RDER - CALL HELP DESK'                              ACAT34RB
                TO  WK-DB2-ERROR                                        ACAT34RB
              PERFORM 0600-SEND-DB2-ERROR-MSG.                          ACAT34RB
      *                                                                 ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
      *  FETCH RESCIND HISTORY CURSOR TABLE IN DESCENDING ORDER      *  ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
       0740-FETCH-RSND-HIST-CSR-DESC.                                   ACAT34RB
           SET ACAT34-FET-HIST-CSR-DESC TO TRUE.                        ACAT34RB
           PERFORM 7600-LINK-TO-ACAT34DB.                               ACAT34RB
           IF ACAT34-NORMAL                                             ACAT34RB
              CONTINUE                                                  ACAT34RB
           ELSE                                                         ACAT34RB
           IF ACAT34-NOT-FOUND                                          ACAT34RB
              SET WS-NO-MORE-DATA TO TRUE                               ACAT34RB
           ELSE                                                         ACAT34RB
              PERFORM 0750-CLOSE-RSND-HIST-CSR-DESC                     ACAT34RB
              MOVE 'DB2 FETCH ERROR ON HISTORY CURSOR TBL IN DESCENDING ACAT34RB
LRM002-            'ORDER - CALL HELP DESK'                             ACAT34RB
                TO  WK-DB2-ERROR                                        ACAT34RB
              PERFORM 0600-SEND-DB2-ERROR-MSG.                          ACAT34RB
      *                                                                 ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
      *  CLOSE RESCIND HISTORY CURSOR TABLE IN DESCENDING ORDER      *  ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
       0750-CLOSE-RSND-HIST-CSR-DESC.                                   ACAT34RB
           SET ACAT34-CLO-HIST-CSR-DESC TO TRUE.                        ACAT34RB
           PERFORM 7600-LINK-TO-ACAT34DB.                               ACAT34RB
           IF ACAT34-ERROR                                              ACAT34RB
              MOVE 'DB2 CLOSE ERROR ON HISTORY CURSOR TBL IN DESCENDING ACAT34RB
LRM002-            'ORDER - CALL HELP DESK'                             ACAT34RB
                TO  WK-DB2-ERROR                                        ACAT34RB
              PERFORM 0600-SEND-DB2-ERROR-MSG.                          ACAT34RB
      *                                                                 ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
      *        MOVE DATA FROM DB2 TABLE TO MAP                       *  ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
       0800-SETUP-SCREEN.                                               ACAT34RB
           IF TWA-ACTIVE-FILE-SCR                                       ACAT34RB
              IF ACAT-SIGN-ON-UPDATE                                    ACAT34RB
                  SET TWA-UPDATE-MOD TO TRUE                            ACAT34RB
                  MOVE ATT-UNPROT TO ACTION-A  (SUB)                    ACAT34RB
                                     EXPDATE-A (SUB)                    ACAT34RB
                                     CMNT1-A   (SUB)                    ACAT34RB
                                     CMNT2-A   (SUB)                    ACAT34RB
              END-IF                                                    ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           IF TWA-HISTORY-FILE-SCR                                      ACAT34RB
              MOVE ACAT34-ACTION-CD  TO ACTION-O (SUB)                  ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           MOVE ACAT34-BRANCH   TO BRANCH-O (SUB) TWA-MAP-BR     (SUB). ACAT34RB
           MOVE ACAT34-ACCT     TO ACCT-O   (SUB) TWA-MAP-ACCT   (SUB). ACAT34RB
           MOVE ACAT34-BLCKCD   TO BLCKCD-O (SUB) TWA-MAP-BLCKCD (SUB). ACAT34RB
           MOVE ACAT34-RCV-NUM  TO CBRKR-O  (SUB) TWA-MAP-CBRKR  (SUB). ACAT34RB
           MOVE ACAT34-ISIN-SEC TO SEC-O    (SUB) TWA-MAP-SEC    (SUB). ACAT34RB
           MOVE ACAT34-ADP-SEC  TO ADPSEC-O (SUB) TWA-MAP-ADPSEC (SUB). ACAT34RB
           MOVE ACAT34-SNON-ID  TO USER-O   (SUB) TWA-MAP-USER   (SUB). ACAT34RB
           MOVE ACAT34-CMNT     TO WS-COMMENT                           ACAT34RB
           MOVE WS-COMMENT-1    TO CMNT1-O  (SUB) TWA-MAP-CMNT1  (SUB)  ACAT34RB
                                                  TWA-ORIG-CMNT1 (SUB). ACAT34RB
           MOVE WS-COMMENT-2    TO CMNT2-O  (SUB) TWA-MAP-CMNT2  (SUB)  ACAT34RB
                                                  TWA-ORIG-CMNT2 (SUB). ACAT34RB
           MOVE ACAT34-HIST-SEQ-NBR  TO TWA-MAP-HIST-SEQ (SUB).         ACAT34RB
                                                                        ACAT34RB
           SET ACATNAIO-NA-READ TO TRUE.                                ACAT34RB
           MOVE WK-CLT-NBR      TO ACATNAIO-CLIENT.                     ACAT34RB
           MOVE ACAT34-BRANCH   TO ACATNAIO-BR.                         ACAT34RB
           MOVE ACAT34-ACCT     TO ACATNAIO-AC.                         ACAT34RB
           PERFORM 7610-LINK-TO-ACATNAIO-RTN.                           ACAT34RB
           IF ACATNAIO-FOUND                                            ACAT34RB
              MOVE ACATNAIO-NAME  TO NAME1-O (SUB) TWA-MAP-NAME1 (SUB)  ACAT34RB
              MOVE ACATNAIO-NAME2 TO NAME2-O (SUB) TWA-MAP-NAME2 (SUB)  ACAT34RB
           ELSE                                                         ACAT34RB
              MOVE SPACE          TO NAME1-O (SUB) TWA-MAP-NAME1 (SUB)  ACAT34RB
                                     NAME2-O (SUB) TWA-MAP-NAME2 (SUB)  ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           MOVE ACAT34-CRT-TMSTP (1:10) TO WS-DB2-FORM-DATE.            ACAT34RB
           MOVE WS-DATE-MM      TO WS-EDITED-MM.                        ACAT34RB
           MOVE WS-DATE-DD      TO WS-EDITED-DD.                        ACAT34RB
           MOVE WS-DATE-YY      TO WS-EDITED-YY.                        ACAT34RB
           MOVE WS-EDITED-DATE  TO CRTDATE-O (SUB) TWA-MAP-CRTDT (SUB). ACAT34RB
                                                                        ACAT34RB
           IF ACAT34-EXP-DATE = '0001-01-01'                            ACAT34RB
              MOVE SPACE           TO EXPDATE-O (SUB)                   ACAT34RB
                                      TWA-MAP-EXPDT (SUB)               ACAT34RB
                                      TWA-ORIG-EXPDT (SUB)              ACAT34RB
           ELSE                                                         ACAT34RB
              MOVE ACAT34-EXP-DATE TO WS-DB2-FORM-DATE                  ACAT34RB
              MOVE WS-DATE-MM      TO WS-EDITED-MM                      ACAT34RB
              MOVE WS-DATE-DD      TO WS-EDITED-DD                      ACAT34RB
              MOVE WS-DATE-YY      TO WS-EDITED-YY                      ACAT34RB
              MOVE WS-EDITED-DATE  TO EXPDATE-O (SUB)                   ACAT34RB
                                      TWA-MAP-EXPDT (SUB)               ACAT34RB
                                      TWA-ORIG-EXPDT (SUB)              ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           MOVE ACAT34-UPD-TMSTP (1:10) TO WS-DB2-FORM-DATE.            ACAT34RB
           MOVE WS-DATE-MM      TO WS-EDITED-MM.                        ACAT34RB
           MOVE WS-DATE-DD      TO WS-EDITED-DD.                        ACAT34RB
           MOVE WS-DATE-YY      TO WS-EDITED-YY.                        ACAT34RB
           MOVE WS-EDITED-DATE  TO UPDDATE-O (SUB) TWA-MAP-UPDDT (SUB). ACAT34RB
                                                                        ACAT34RB
           MOVE ACAT34-ADP-SEC  TO ACATMSD-SEARCH-KEY.                  ACAT34RB
           SET ACATMSD-MSD-READ TO TRUE.                                ACAT34RB
           PERFORM 7900-LINK-TO-ACATMSD.                                ACAT34RB
           IF ACATMSD-FOUND                                             ACAT34RB
              MOVE ACATMSD-DESC  TO DESC1-O (SUB) TWA-MAP-DESC1 (SUB)   ACAT34RB
              MOVE ACATMSD-DESC2 TO DESC2-O (SUB) TWA-MAP-DESC2 (SUB)   ACAT34RB
           ELSE                                                         ACAT34RB
              MOVE SPACE         TO DESC1-O (SUB) TWA-MAP-DESC1 (SUB)   ACAT34RB
                                    DESC2-O (SUB) TWA-MAP-DESC2 (SUB)   ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           IF WS-SETUP-SCR-BKWARD                                       ACAT34RB
              IF SUB = 1                                                ACAT34RB
                 MOVE TWA-MAP-BR       (SUB) TO TWA-KEY-BR-1            ACAT34RB
                 MOVE TWA-MAP-ACCT     (SUB) TO TWA-KEY-ACCT-1          ACAT34RB
                 MOVE TWA-MAP-BLCKCD   (SUB) TO TWA-KEY-BLCKCD-1        ACAT34RB
                 MOVE TWA-MAP-CBRKR    (SUB) TO TWA-KEY-CBRKR-1         ACAT34RB
                 MOVE TWA-MAP-SEC      (SUB) TO TWA-KEY-SEC-1           ACAT34RB
                 MOVE TWA-MAP-HIST-SEQ (SUB) TO TWA-KEY-SEQ-1           ACAT34RB
              ELSE                                                      ACAT34RB
                 MOVE TWA-MAP-BR       (SUB) TO TWA-KEY-BR-2            ACAT34RB
                 MOVE TWA-MAP-ACCT     (SUB) TO TWA-KEY-ACCT-2          ACAT34RB
                 MOVE TWA-MAP-BLCKCD   (SUB) TO TWA-KEY-BLCKCD-2        ACAT34RB
                 MOVE TWA-MAP-CBRKR    (SUB) TO TWA-KEY-CBRKR-2         ACAT34RB
                 MOVE TWA-MAP-SEC      (SUB) TO TWA-KEY-SEC-2           ACAT34RB
                 MOVE TWA-MAP-HIST-SEQ (SUB) TO TWA-KEY-SEQ-2           ACAT34RB
              END-IF                                                    ACAT34RB
              MOVE 2 TO TWA-SCR-LINE                                    ACAT34RB
           ELSE                                                         ACAT34RB
              IF SUB = 1                                                ACAT34RB
                 MOVE TWA-MAP-BR       (SUB) TO TWA-KEY-BR-1            ACAT34RB
                 MOVE TWA-MAP-ACCT     (SUB) TO TWA-KEY-ACCT-1          ACAT34RB
                 MOVE TWA-MAP-BLCKCD   (SUB) TO TWA-KEY-BLCKCD-1        ACAT34RB
                 MOVE TWA-MAP-CBRKR    (SUB) TO TWA-KEY-CBRKR-1         ACAT34RB
                 MOVE TWA-MAP-SEC      (SUB) TO TWA-KEY-SEC-1           ACAT34RB
                 MOVE TWA-MAP-HIST-SEQ (SUB) TO TWA-KEY-SEQ-1           ACAT34RB
                 MOVE TWA-MAP-KEY-1        TO TWA-MAP-KEY-2             ACAT34RB
              ELSE                                                      ACAT34RB
                 MOVE TWA-MAP-BR       (SUB) TO TWA-KEY-BR-2            ACAT34RB
                 MOVE TWA-MAP-ACCT     (SUB) TO TWA-KEY-ACCT-2          ACAT34RB
                 MOVE TWA-MAP-BLCKCD   (SUB) TO TWA-KEY-BLCKCD-2        ACAT34RB
                 MOVE TWA-MAP-CBRKR    (SUB) TO TWA-KEY-CBRKR-2         ACAT34RB
                 MOVE TWA-MAP-SEC      (SUB) TO TWA-KEY-SEC-2           ACAT34RB
                 MOVE TWA-MAP-HIST-SEQ (SUB) TO TWA-KEY-SEQ-2           ACAT34RB
              END-IF                                                    ACAT34RB
              MOVE SUB TO TWA-SCR-LINE                                  ACAT34RB
           END-IF.                                                      ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
      *            AFTER FIRST-TIME                                  *  ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
       0900-CONTINUE-PROCESS.                                           ACAT34RB
           PERFORM 7000-READ-TSQ-RTN.                                   ACAT34RB
           PERFORM 7010-DELETE-TSQ-RTN.                                 ACAT34RB
           SET DATA-ONLY TO TRUE.                                       ACAT34RB
           EVALUATE TRUE                                                ACAT34RB
                WHEN EIBAID = DFHPF11 OR DFHCLEAR                       ACAT34RB
                     PERFORM 8700-RETURN-CONTROL-RTN                    ACAT34RB
                WHEN EIBAID = DFHPF10 OR DFHPF12                        ACAT34RB
                     PERFORM 8800-RETURN-TO-CICS                        ACAT34RB
                WHEN EIBAID = DFHENTER OR DFHPF5                        ACAT34RB
                     PERFORM 1000-ENTER-KEY                             ACAT34RB
                WHEN EIBAID = DFHPF2                                    ACAT34RB
                     PERFORM 3000-ADD-NEW-ACCT-RTN                      ACAT34RB
                WHEN EIBAID = DFHPF3                                    ACAT34RB
                     PERFORM 3100-EXIT-ADD-RTN                          ACAT34RB
                WHEN EIBAID = DFHPF4                                    ACAT34RB
                     PERFORM 4000-SWITCH-SCREEN                         ACAT34RB
                WHEN EIBAID = DFHPF7                                    ACAT34RB
                     PERFORM 6000-PREV-PAGE-RTN                         ACAT34RB
                WHEN EIBAID = DFHPF8                                    ACAT34RB
                     PERFORM 6100-NEXT-PAGE-RTN                         ACAT34RB
                WHEN OTHER                                              ACAT34RB
                     SET  WK-ERROR  TO TRUE                             ACAT34RB
                     MOVE LOW-VALUE TO ACAT34MO                         ACAT34RB
                     MOVE -1 TO MNEXTL                                  ACAT34RB
                     MOVE 'ERROR FUNCTION KEY'                          ACAT34RB
                       TO SYSTEM-MSG                                    ACAT34RB
                     PERFORM 9000-ERROR-RTN                             ACAT34RB
           END-EVALUATE.                                                ACAT34RB
           PERFORM 7020-WRITE-TSQ-RTN.                                  ACAT34RB
           PERFORM 8100-SEND-MAP-DATA-ONLY.                             ACAT34RB
           PERFORM 8800-RETURN-TO-CICS.                                 ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
      *            ENTER KEY ROUTINE                                 *  ACAT34RB
      *--------------------------------------------------------------*  ACAT34RB
       1000-ENTER-KEY.                                                  ACAT34RB
           PERFORM 8500-RECEIVE-MAP.                                    ACAT34RB
           MOVE SPACE  TO WK-ERROR-SW                                   ACAT34RB
                          WK-MSG-ON-SW.                                 ACAT34RB
                                                                        ACAT34RB
           PERFORM 1100-NEXT-SELECTION-RTN.                             ACAT34RB
                                                                        ACAT34RB
           IF TWA-UPDATE-MOD                                            ACAT34RB
              PERFORM 1200-EDIT-USER-ENTRY-FLDS                         ACAT34RB
                VARYING SUB FROM 1 BY 1                                 ACAT34RB
                  UNTIL SUB > 2  OR  SUB > TWA-SCR-LINE                 ACAT34RB
           ELSE                                                         ACAT34RB
           IF TWA-UPDATE-ADD                                            ACAT34RB
              PERFORM 1200-EDIT-USER-ENTRY-FLDS                         ACAT34RB
                VARYING SUB FROM 1 BY 1 UNTIL SUB > 2                   ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           IF TWA-UPDATE-MOD                                            ACAT34RB
              PERFORM 1210-VALIDATE-MODIFY-MODE                         ACAT34RB
           ELSE                                                         ACAT34RB
           IF TWA-UPDATE-ADD                                            ACAT34RB
              PERFORM 1250-VALIDATE-ADD-MODE                            ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           IF EIBAID = DFHPF5                                           ACAT34RB
              IF TWA-UPDATE-MOD OR TWA-UPDATE-ADD                       ACAT34RB
                 IF NOT WK-ERROR                                        ACAT34RB
                    IF WS-SCR-CHANGED OR WS-ADD-CNT > 0                 ACAT34RB
                       PERFORM 5000-UPDATE-RTN                          ACAT34RB
                    ELSE                                                ACAT34RB
                       MOVE -1 TO MNEXTL                                ACAT34RB
                       IF NOT WK-ERROR                                  ACAT34RB
                          SET WK-ERROR TO TRUE                          ACAT34RB
                          MOVE 'NO ENTRY MADE FOR UPDATE' TO SYSTEM-MSG ACAT34RB
                       END-IF                                           ACAT34RB
                    END-IF                                              ACAT34RB
                 END-IF                                                 ACAT34RB
              ELSE                                                      ACAT34RB
                 MOVE -1 TO MNEXTL                                      ACAT34RB
                 IF NOT WK-ERROR                                        ACAT34RB
                    SET WK-ERROR TO TRUE                                ACAT34RB
                    MOVE 'UPDATE (PF5) NOT ALLOWED' TO SYSTEM-MSG       ACAT34RB
                 END-IF                                                 ACAT34RB
              END-IF.                                                   ACAT34RB
                                                                        ACAT34RB
           IF NOT WK-ERROR                                              ACAT34RB
              MOVE -1    TO MNEXTL                                      ACAT34RB
              MOVE SPACE TO TRLMSGO.                                    ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
      *              JUMP TO NEXT SELECTION?                           *ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
       1100-NEXT-SELECTION-RTN.                                         ACAT34RB
           IF MMBRL > 0                                                 ACAT34RB
              IF MMBRI = TWA-MAP-MMBR                                   ACAT34RB
                 CONTINUE                                               ACAT34RB
              ELSE                                                      ACAT34RB
                 MOVE MMBRI TO TWA-MAP-MMBR                             ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
              IF MMBRA = ERASE-KEY                                      ACAT34RB
                 MOVE SPACES TO TWA-MAP-MMBR                            ACAT34RB
              END-IF.                                                   ACAT34RB
           IF TWA-MAP-MMBR = LOW-VALUE                                  ACAT34RB
              MOVE SPACE TO TWA-MAP-MMBR.                               ACAT34RB
           MOVE ATT-UNPROT TO MMBRA.                                    ACAT34RB
                                                                        ACAT34RB
           IF MMACL > 0                                                 ACAT34RB
              IF MMACI = TWA-MAP-MMAC                                   ACAT34RB
                 CONTINUE                                               ACAT34RB
              ELSE                                                      ACAT34RB
                 MOVE MMACI TO TWA-MAP-MMAC                             ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
              IF MMACA = ERASE-KEY                                      ACAT34RB
                 MOVE SPACES TO TWA-MAP-MMAC                            ACAT34RB
              END-IF.                                                   ACAT34RB
           IF TWA-MAP-MMAC = LOW-VALUE                                  ACAT34RB
              MOVE SPACE TO TWA-MAP-MMAC.                               ACAT34RB
           MOVE ATT-UNPROT TO MMACA.                                    ACAT34RB
                                                                        ACAT34RB
           IF MMRRL > 0                                                 ACAT34RB
              IF MMRRI = TWA-MAP-MMRR                                   ACAT34RB
                 CONTINUE                                               ACAT34RB
              ELSE                                                      ACAT34RB
                 MOVE MMRRI TO TWA-MAP-MMRR                             ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
              IF MMRRA = ERASE-KEY                                      ACAT34RB
                 MOVE SPACES TO TWA-MAP-MMRR                            ACAT34RB
              END-IF.                                                   ACAT34RB
           IF TWA-MAP-MMRR = LOW-VALUE                                  ACAT34RB
              MOVE SPACE TO TWA-MAP-MMRR.                               ACAT34RB
           MOVE ATT-UNPROT TO MMRRA.                                    ACAT34RB
                                                                        ACAT34RB
           IF MMTFRL > 0                                                ACAT34RB
              IF MMTFRI = TWA-MAP-MMTFR                                 ACAT34RB
                 CONTINUE                                               ACAT34RB
              ELSE                                                      ACAT34RB
                 MOVE MMTFRI TO TWA-MAP-MMTFR                           ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
              IF MMTFRA = ERASE-KEY                                     ACAT34RB
                 MOVE SPACES TO TWA-MAP-MMTFR                           ACAT34RB
              END-IF.                                                   ACAT34RB
           IF TWA-MAP-MMTFR = LOW-VALUE                                 ACAT34RB
              MOVE SPACE TO TWA-MAP-MMTFR.                              ACAT34RB
           MOVE ATT-UNPROT TO MMTFRA.                                   ACAT34RB
                                                                        ACAT34RB
           IF MMRDL > 0                                                 ACAT34RB
              IF MMRDI = TWA-MAP-MMRD                                   ACAT34RB
                 CONTINUE                                               ACAT34RB
              ELSE                                                      ACAT34RB
                 MOVE MMRDI TO TWA-MAP-MMRD                             ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
              IF MMRDA = ERASE-KEY                                      ACAT34RB
                 MOVE SPACES TO TWA-MAP-MMRD                            ACAT34RB
              END-IF.                                                   ACAT34RB
           IF TWA-MAP-MMRD = LOW-VALUE                                  ACAT34RB
              MOVE SPACE TO TWA-MAP-MMRD.                               ACAT34RB
           MOVE ATT-UNPROT TO MMRDA.                                    ACAT34RB
                                                                        ACAT34RB
           IF MMBKRL > 0                                                ACAT34RB
              IF MMBKRI = TWA-MAP-MMBKR                                 ACAT34RB
                 CONTINUE                                               ACAT34RB
              ELSE                                                      ACAT34RB
                 MOVE MMBKRI TO TWA-MAP-MMBKR                           ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
              IF MMBKRA = ERASE-KEY                                     ACAT34RB
                 MOVE SPACES TO TWA-MAP-MMBKR                           ACAT34RB
              END-IF.                                                   ACAT34RB
           IF TWA-MAP-MMBKR = LOW-VALUE                                 ACAT34RB
              MOVE SPACE TO TWA-MAP-MMBKR.                              ACAT34RB
           MOVE ATT-UNPROT TO MMBKRA.                                   ACAT34RB
                                                                        ACAT34RB
           IF MMSTATL > 0                                               ACAT34RB
              IF MMSTATI = TWA-MAP-MMSTAT                               ACAT34RB
                 CONTINUE                                               ACAT34RB
              ELSE                                                      ACAT34RB
                 MOVE MMSTATI TO TWA-MAP-MMSTAT                         ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
              IF MMSTATA = ERASE-KEY                                    ACAT34RB
                 MOVE SPACES TO TWA-MAP-MMSTAT                          ACAT34RB
              END-IF.                                                   ACAT34RB
           IF TWA-MAP-MMSTAT = LOW-VALUE                                ACAT34RB
              MOVE SPACE TO TWA-MAP-MMSTAT.                             ACAT34RB
           MOVE ATT-UNPROT TO MMSTATA.                                  ACAT34RB
                                                                        ACAT34RB
           IF MMSDL > 0                                                 ACAT34RB
              IF MMSDI = TWA-MAP-MMSD                                   ACAT34RB
                 CONTINUE                                               ACAT34RB
              ELSE                                                      ACAT34RB
                 MOVE MMSDI TO TWA-MAP-MMSD                             ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
              IF MMSDA = ERASE-KEY                                      ACAT34RB
                 MOVE SPACES TO TWA-MAP-MMSD                            ACAT34RB
              END-IF.                                                   ACAT34RB
           IF TWA-MAP-MMSD = LOW-VALUE                                  ACAT34RB
              MOVE SPACE TO TWA-MAP-MMSD.                               ACAT34RB
           MOVE ATT-UNPROT TO MMSDA.                                    ACAT34RB
                                                                        ACAT34RB
           MOVE TWA-MAP-MMBR   TO ACAT-INP-BRANCH.                      ACAT34RB
           MOVE TWA-MAP-MMAC   TO ACAT-INP-ACCOUNT.                     ACAT34RB
           MOVE TWA-MAP-MMRR   TO ACAT-INP-RR.                          ACAT34RB
           MOVE TWA-MAP-MMTFR  TO ACAT-INP-TFR-TYP.                     ACAT34RB
           MOVE TWA-MAP-MMRD   TO ACAT-INP-RCV-DEL.                     ACAT34RB
           MOVE TWA-MAP-MMBKR  TO ACAT-INP-CONTRA-BKR.                  ACAT34RB
           MOVE TWA-MAP-MMSTAT TO ACAT-INP-STATUS.                      ACAT34RB
           MOVE TWA-MAP-MMSD   TO ACAT-INP-STTL-DT.                     ACAT34RB
                                                                        ACAT34RB
           IF MNEXTL > 0                                                ACAT34RB
              IF MNEXTI = TWA-MAP-NEXT                                  ACAT34RB
                 CONTINUE                                               ACAT34RB
              ELSE                                                      ACAT34RB
                 MOVE MNEXTI TO TWA-MAP-NEXT                            ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
              IF MNEXTA = ERASE-KEY                                     ACAT34RB
                 MOVE SPACES TO TWA-MAP-NEXT                            ACAT34RB
              END-IF.                                                   ACAT34RB
      *                                                                 ACAT34RB
           IF TWA-MAP-NEXT = LOW-VALUE                                  ACAT34RB
              MOVE SPACE TO TWA-MAP-NEXT.                               ACAT34RB
           IF TWA-MAP-NEXT = '1'                                        ACAT34RB
              MOVE SPACE TO MNEXTO                                      ACAT34RB
                            TWA-MAP-NEXT.                               ACAT34RB
      *                                                                 ACAT34RB
           IF TWA-MAP-NEXT = SPACE                                      ACAT34RB
              PERFORM 1110-NEXT-SEL-SPACE-RTN                           ACAT34RB
           ELSE                                                         ACAT34RB
              MOVE TWA-MAP-NEXT TO ACAT-INP-SEL                         ACAT34RB
              PERFORM 1120-NEXT-SEL-ENTERED-RTN                         ACAT34RB
           END-IF.                                                      ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
      *         NO NEXT SELECTION ENTERED                              *ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
       1110-NEXT-SEL-SPACE-RTN.                                         ACAT34RB
           PERFORM 1140-VALIDATE-SRCH-ENGINE.                           ACAT34RB
           IF NOT WK-ERROR                                              ACAT34RB
              PERFORM 1150-CHECK-IF-SRCH-CHANGED                        ACAT34RB
              IF WS-SEARCH-CHANGED                                      ACAT34RB
                 PERFORM 0200-FIRST-TIME-RTN                            ACAT34RB
              END-IF                                                    ACAT34RB
           END-IF.                                                      ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
      *           NEXT SELECTION ENTERED                               *ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
       1120-NEXT-SEL-ENTERED-RTN.                                       ACAT34RB
           MOVE TWA-MAP-NEXT   TO WS-ACAT-NEXT.                         ACAT34RB
       COPY ACATJUMP.                                                   ACAT34RB
           IF CALLED-PROGRAM-NAME = SPACES                              ACAT34RB
              MOVE -1             TO MNEXTL                             ACAT34RB
              MOVE ATT-UNPROT-BRT TO MNEXTA                             ACAT34RB
              IF NOT WK-ERROR                                           ACAT34RB
                 SET  WK-ERROR   TO TRUE                                ACAT34RB
                 MOVE 'INVALID "NEXT" SELECTION'                        ACAT34RB
                   TO  SYSTEM-MSG                                       ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
              MOVE 'ACAT34RB'    TO ACAT-CALLING-PROG-NAME              ACAT34RB
              MOVE  TWA-MAP-NEXT TO ACAT-NEXT                           ACAT34RB
              PERFORM 7500-XCTL-TO-DETAIL-PROG.                         ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
      *           VALIDATE THE SEARCH ENGINE                           *ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
       1140-VALIDATE-SRCH-ENGINE.                                       ACAT34RB
           EXEC CICS LINK                                               ACAT34RB
                     PROGRAM(WS-ACATSRCH)                               ACAT34RB
                     COMMAREA(ACAT-SEARCH-AREA)                         ACAT34RB
                     LENGTH(LENGTH OF ACAT-SEARCH-AREA)                 ACAT34RB
           END-EXEC.                                                    ACAT34RB
           IF  ACAT-SRCH-MSG > SPACE                                    ACAT34RB
               IF NOT WK-ERROR                                          ACAT34RB
                  SET WK-ERROR TO TRUE                                  ACAT34RB
                  MOVE ACAT-SRCH-MSG TO SYSTEM-MSG                      ACAT34RB
               END-IF                                                   ACAT34RB
               IF  ACAT-SRCH-BR = 'N'                                   ACAT34RB
                   MOVE -1             TO MMBRL                         ACAT34RB
                   MOVE ATT-UNPROT-BRT TO MMBRA                         ACAT34RB
               END-IF                                                   ACAT34RB
               IF  ACAT-SRCH-ACCT = 'N'                                 ACAT34RB
                   MOVE -1             TO MMACL                         ACAT34RB
                   MOVE ATT-UNPROT-BRT TO MMACA                         ACAT34RB
               END-IF                                                   ACAT34RB
               IF  ACAT-SRCH-RR = 'N'                                   ACAT34RB
                   MOVE -1             TO MMRRL                         ACAT34RB
                   MOVE ATT-UNPROT-BRT TO MMRRA                         ACAT34RB
               END-IF                                                   ACAT34RB
               IF  ACAT-SRCH-TFR = 'N'                                  ACAT34RB
                   MOVE -1             TO MMTFRL                        ACAT34RB
                   MOVE ATT-UNPROT-BRT TO MMTFRA                        ACAT34RB
               END-IF                                                   ACAT34RB
               IF  ACAT-SRCH-RD = 'N'                                   ACAT34RB
                   MOVE -1             TO MMRDL                         ACAT34RB
                   MOVE ATT-UNPROT-BRT TO MMRDA                         ACAT34RB
               END-IF                                                   ACAT34RB
               IF  ACAT-SRCH-CONTRA-BKR = 'N'                           ACAT34RB
                   MOVE -1             TO MMBKRL                        ACAT34RB
                   MOVE ATT-UNPROT-BRT TO MMBKRA                        ACAT34RB
               END-IF                                                   ACAT34RB
               IF  ACAT-SRCH-STATUS = 'N'                               ACAT34RB
                   MOVE -1             TO MMSTATL                       ACAT34RB
                   MOVE ATT-UNPROT-BRT TO MMSTATA                       ACAT34RB
               END-IF                                                   ACAT34RB
               IF  ACAT-SRCH-STTLDT = 'N'                               ACAT34RB
                   MOVE -1             TO MMSDL                         ACAT34RB
                   MOVE ATT-UNPROT-BRT TO MMSDA                         ACAT34RB
               END-IF                                                   ACAT34RB
           END-IF.                                                      ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
      *             SEARCH ENGINE CHANGED?                             *ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
       1150-CHECK-IF-SRCH-CHANGED.                                      ACAT34RB
           MOVE SPACE TO WS-SEARCH-CHANGED-SW.                          ACAT34RB
           IF TWA-MAP-MMBR NOT = TWA-PREV-MMBR                          ACAT34RB
              MOVE TWA-MAP-MMBR TO TWA-PREV-MMBR                        ACAT34RB
              SET WS-SEARCH-CHANGED TO TRUE.                            ACAT34RB
           IF TWA-MAP-MMAC NOT = TWA-PREV-MMAC                          ACAT34RB
              MOVE TWA-MAP-MMAC TO TWA-PREV-MMAC                        ACAT34RB
              SET WS-SEARCH-CHANGED TO TRUE.                            ACAT34RB
           IF TWA-MAP-MMRR NOT = TWA-PREV-MMRR                          ACAT34RB
              MOVE TWA-MAP-MMRR TO TWA-PREV-MMRR                        ACAT34RB
              SET WS-SEARCH-CHANGED TO TRUE.                            ACAT34RB
           IF TWA-MAP-MMTFR NOT = TWA-PREV-MMTFR                        ACAT34RB
              MOVE TWA-MAP-MMTFR TO TWA-PREV-MMTFR                      ACAT34RB
              SET WS-SEARCH-CHANGED TO TRUE.                            ACAT34RB
           IF TWA-MAP-MMRD NOT = TWA-PREV-MMRD                          ACAT34RB
              MOVE TWA-MAP-MMRD TO TWA-PREV-MMRD                        ACAT34RB
              SET WS-SEARCH-CHANGED TO TRUE.                            ACAT34RB
           IF TWA-MAP-MMBKR NOT = TWA-PREV-MMBKR                        ACAT34RB
              MOVE TWA-MAP-MMBKR TO TWA-PREV-MMBKR                      ACAT34RB
              SET WS-SEARCH-CHANGED TO TRUE.                            ACAT34RB
           IF TWA-MAP-MMSTAT NOT = TWA-PREV-MMSTAT                      ACAT34RB
              MOVE TWA-MAP-MMSTAT TO TWA-PREV-MMSTAT                    ACAT34RB
              SET WS-SEARCH-CHANGED TO TRUE.                            ACAT34RB
           IF TWA-MAP-MMSD NOT = TWA-PREV-MMSD                          ACAT34RB
              MOVE TWA-MAP-MMSD TO TWA-PREV-MMSD                        ACAT34RB
              SET WS-SEARCH-CHANGED TO TRUE.                            ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
      *              SAVE USER ENTRY FLDS TO TWA AREA                  *ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
       1200-EDIT-USER-ENTRY-FLDS.                                       ACAT34RB
           IF ACTION-L (SUB) > 0                                        ACAT34RB
              IF ACTION-O (SUB) = TWA-MAP-ACTION (SUB)                  ACAT34RB
                 CONTINUE                                               ACAT34RB
              ELSE                                                      ACAT34RB
                 MOVE ACTION-O (SUB) TO TWA-MAP-ACTION (SUB)            ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
              IF ACTION-A (SUB) = ERASE-KEY                             ACAT34RB
                 MOVE SPACE TO TWA-MAP-ACTION (SUB)                     ACAT34RB
              END-IF                                                    ACAT34RB
           END-IF.                                                      ACAT34RB
           IF TWA-MAP-ACTION (SUB) = LOW-VALUE                          ACAT34RB
              MOVE SPACE TO TWA-MAP-ACTION (SUB)                        ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           IF BLCKCD-L (SUB) > 0                                        ACAT34RB
              IF BLCKCD-O (SUB) = TWA-MAP-BLCKCD (SUB)                  ACAT34RB
                 CONTINUE                                               ACAT34RB
              ELSE                                                      ACAT34RB
                 MOVE BLCKCD-O (SUB) TO TWA-MAP-BLCKCD (SUB)            ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
              IF BLCKCD-A (SUB) = ERASE-KEY                             ACAT34RB
                 MOVE SPACE TO TWA-MAP-BLCKCD (SUB)                     ACAT34RB
              END-IF                                                    ACAT34RB
           END-IF.                                                      ACAT34RB
           IF TWA-MAP-BLCKCD (SUB) = LOW-VALUE                          ACAT34RB
              MOVE SPACE TO TWA-MAP-BLCKCD (SUB)                        ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           IF BRANCH-L (SUB) > 0                                        ACAT34RB
              IF BRANCH-O (SUB) = TWA-MAP-BR (SUB)                      ACAT34RB
                 CONTINUE                                               ACAT34RB
              ELSE                                                      ACAT34RB
                 MOVE BRANCH-O (SUB) TO TWA-MAP-BR (SUB)                ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
              IF BRANCH-A (SUB) = ERASE-KEY                             ACAT34RB
                 MOVE SPACE TO TWA-MAP-BR (SUB)                         ACAT34RB
              END-IF                                                    ACAT34RB
           END-IF.                                                      ACAT34RB
           IF TWA-MAP-BR (SUB) = LOW-VALUE                              ACAT34RB
              MOVE SPACE TO TWA-MAP-BR (SUB)                            ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           IF ACCT-L (SUB) > 0                                          ACAT34RB
              IF ACCT-O (SUB) = TWA-MAP-ACCT (SUB)                      ACAT34RB
                 CONTINUE                                               ACAT34RB
              ELSE                                                      ACAT34RB
                 MOVE ACCT-O (SUB) TO TWA-MAP-ACCT (SUB)                ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
              IF ACCT-A (SUB) = ERASE-KEY                               ACAT34RB
                 MOVE SPACE TO TWA-MAP-ACCT (SUB)                       ACAT34RB
              END-IF                                                    ACAT34RB
           END-IF.                                                      ACAT34RB
           IF TWA-MAP-ACCT (SUB) = LOW-VALUE                            ACAT34RB
              MOVE SPACE TO TWA-MAP-ACCT (SUB)                          ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           IF CBRKR-L (SUB) > 0                                         ACAT34RB
              IF CBRKR-O (SUB) = TWA-MAP-CBRKR (SUB)                    ACAT34RB
                 CONTINUE                                               ACAT34RB
              ELSE                                                      ACAT34RB
                 MOVE CBRKR-O (SUB) TO TWA-MAP-CBRKR (SUB)              ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
              IF CBRKR-A (SUB) = ERASE-KEY                              ACAT34RB
                 MOVE SPACE TO TWA-MAP-CBRKR (SUB)                      ACAT34RB
              END-IF                                                    ACAT34RB
           END-IF.                                                      ACAT34RB
           IF TWA-MAP-CBRKR (SUB) = LOW-VALUE                           ACAT34RB
              MOVE SPACE TO TWA-MAP-CBRKR (SUB)                         ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           IF SEC-L (SUB) > 0                                           ACAT34RB
              IF SEC-O (SUB) = TWA-MAP-SEC (SUB)                        ACAT34RB
                 CONTINUE                                               ACAT34RB
              ELSE                                                      ACAT34RB
                 MOVE SEC-O (SUB) TO TWA-MAP-SEC (SUB)                  ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
              IF SEC-A (SUB) = ERASE-KEY                                ACAT34RB
                 MOVE SPACE TO TWA-MAP-SEC (SUB)                        ACAT34RB
              END-IF                                                    ACAT34RB
           END-IF.                                                      ACAT34RB
           IF TWA-MAP-SEC (SUB) = LOW-VALUE                             ACAT34RB
              MOVE SPACE TO TWA-MAP-SEC (SUB)                           ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           IF EXPDATE-L (SUB) > 0                                       ACAT34RB
              IF EXPDATE-O (SUB) = TWA-MAP-EXPDT (SUB)                  ACAT34RB
                 CONTINUE                                               ACAT34RB
              ELSE                                                      ACAT34RB
                 MOVE EXPDATE-O (SUB) TO TWA-MAP-EXPDT (SUB)            ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
              IF EXPDATE-A (SUB) = ERASE-KEY                            ACAT34RB
                 MOVE SPACE TO TWA-MAP-EXPDT (SUB)                      ACAT34RB
              END-IF                                                    ACAT34RB
           END-IF.                                                      ACAT34RB
           IF TWA-MAP-EXPDT (SUB) = LOW-VALUE                           ACAT34RB
              MOVE SPACE TO TWA-MAP-EXPDT (SUB)                         ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           IF CMNT1-L (SUB) > 0                                         ACAT34RB
              IF CMNT1-O (SUB) = TWA-MAP-CMNT1 (SUB)                    ACAT34RB
                 CONTINUE                                               ACAT34RB
              ELSE                                                      ACAT34RB
                 MOVE CMNT1-O (SUB) TO TWA-MAP-CMNT1 (SUB)              ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
              IF CMNT1-A (SUB) = ERASE-KEY                              ACAT34RB
                 MOVE SPACE TO TWA-MAP-CMNT1 (SUB)                      ACAT34RB
              END-IF                                                    ACAT34RB
           END-IF.                                                      ACAT34RB
           IF TWA-MAP-CMNT1 (SUB) = LOW-VALUE                           ACAT34RB
              MOVE SPACE TO TWA-MAP-CMNT1 (SUB)                         ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           IF CMNT2-L (SUB) > 0                                         ACAT34RB
              IF CMNT2-O (SUB) = TWA-MAP-CMNT2 (SUB)                    ACAT34RB
                 CONTINUE                                               ACAT34RB
              ELSE                                                      ACAT34RB
                 MOVE CMNT2-O (SUB) TO TWA-MAP-CMNT2 (SUB)              ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
              IF CMNT2-A (SUB) = ERASE-KEY                              ACAT34RB
                 MOVE SPACE TO TWA-MAP-CMNT2 (SUB)                      ACAT34RB
              END-IF                                                    ACAT34RB
           END-IF.                                                      ACAT34RB
           IF TWA-MAP-CMNT2 (SUB) = LOW-VALUE                           ACAT34RB
              MOVE SPACE TO TWA-MAP-CMNT2 (SUB)                         ACAT34RB
           END-IF.                                                      ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
      *        MODIFY OR DELETE RESCIND/BLOCK ACCOUNT?                 *ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
       1210-VALIDATE-MODIFY-MODE.                                       ACAT34RB
           PERFORM VARYING SUB FROM 1 BY 1                              ACAT34RB
                   UNTIL SUB > 2  OR  SUB > TWA-SCR-LINE                ACAT34RB
              PERFORM 1300-VALIDATE-ACTION                              ACAT34RB
              PERFORM 1800-VALIDATE-EXP-DATE                            ACAT34RB
              PERFORM 1900-VALIDATE-COMMENT                             ACAT34RB
           END-PERFORM.                                                 ACAT34RB
                                                                        ACAT34RB
           IF NOT WK-ERROR                                              ACAT34RB
              PERFORM VARYING SUB FROM 1 BY 1                           ACAT34RB
                   UNTIL SUB > 2 OR SUB > TWA-SCR-LINE OR WS-SCR-CHANGEDACAT34RB
                 IF TWA-MAP-ACTION (SUB) = 'D'                          ACAT34RB
                    SET  WS-SCR-CHANGED TO TRUE                         ACAT34RB
                 END-IF                                                 ACAT34RB
                 IF TWA-MAP-EXPDT (SUB) NOT = TWA-ORIG-EXPDT (SUB)      ACAT34RB
                    SET  WS-SCR-CHANGED TO TRUE                         ACAT34RB
                 END-IF                                                 ACAT34RB
                 IF TWA-MAP-CMNT1 (SUB) NOT = TWA-ORIG-CMNT1 (SUB)      ACAT34RB
                    SET  WS-SCR-CHANGED TO TRUE                         ACAT34RB
                 END-IF                                                 ACAT34RB
                 IF TWA-MAP-CMNT2 (SUB) NOT = TWA-ORIG-CMNT2 (SUB)      ACAT34RB
                    SET  WS-SCR-CHANGED TO TRUE                         ACAT34RB
                 END-IF                                                 ACAT34RB
              END-PERFORM                                               ACAT34RB
              IF WS-SCR-CHANGED                                         ACAT34RB
                 SET WK-MSG-ON TO TRUE                                  ACAT34RB
                 MOVE 'PRESS PF5 TO UPDATE (MODIFICATION/DELETION)'     ACAT34RB
                   TO  SYSTEM-MSG                                       ACAT34RB
              END-IF                                                    ACAT34RB
           END-IF.                                                      ACAT34RB
      *                                                                 ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
      *          ADD NEW RESCIND/BLOCK ACCOUNT?                        *ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
       1250-VALIDATE-ADD-MODE.                                          ACAT34RB
           MOVE ZERO TO WS-ADD-CNT.                                     ACAT34RB
           PERFORM VARYING SUB FROM 1 BY 1 UNTIL SUB > 2                ACAT34RB
              PERFORM 1400-VALIDATE-BLOCK-CODE                          ACAT34RB
              PERFORM 1500-VALIDATE-ACCOUNT                             ACAT34RB
              PERFORM 1600-VALIDATE-CONTRA                              ACAT34RB
              PERFORM 1700-VALIDATE-SECURITY                            ACAT34RB
              PERFORM 1800-VALIDATE-EXP-DATE                            ACAT34RB
              PERFORM 1900-VALIDATE-COMMENT                             ACAT34RB
           END-PERFORM.                                                 ACAT34RB
                                                                        ACAT34RB
           IF NOT WK-ERROR                                              ACAT34RB
              PERFORM VARYING SUB FROM 1 BY 1 UNTIL SUB > 2             ACAT34RB
                 IF TWA-MAP-BLCKCD (SUB) > SPACE                        ACAT34RB
                    PERFORM 1260-NEW-ACCT-CHECK                         ACAT34RB
                 END-IF                                                 ACAT34RB
              END-PERFORM                                               ACAT34RB
              IF (NOT WK-ERROR) AND (WS-ADD-CNT > +0)                   ACAT34RB
                 SET WK-MSG-ON    TO TRUE                               ACAT34RB
                 MOVE 'PRESS PF5 TO UPDATE'                             ACAT34RB
                   TO  SYSTEM-MSG                                       ACAT34RB
              END-IF                                                    ACAT34RB
           END-IF.                                                      ACAT34RB
      *                                                                 ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
      *          NEW RESCIND ACCOUNT CHECK ROUTINE                     *ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
       1260-NEW-ACCT-CHECK.                                             ACAT34RB
           IF SUB = 1                                                   ACAT34RB
              IF  TWA-MAP-BLCKCD (2) > SPACE                            ACAT34RB
              AND TWA-MAP-BR     (2) > SPACE                            ACAT34RB
              AND TWA-MAP-ACCT   (2) > SPACE                            ACAT34RB
      ****        PERFORM 1265-DUP-ENTRY-CHECK                          ACAT34RB
                  MOVE TWA-MAP-BLCKCD (1) TO WS-MAP-BLCKCD-KEY1         ACAT34RB
                  MOVE TWA-MAP-BR     (1) TO WS-MAP-BR-KEY1             ACAT34RB
                  MOVE TWA-MAP-ACCT   (1) TO WS-MAP-ACCT-KEY1           ACAT34RB
                  MOVE TWA-MAP-CBRKR  (1) TO WS-MAP-CBRKR-KEY1          ACAT34RB
                  MOVE TWA-MAP-SEC    (1) TO WS-MAP-SEC-KEY1            ACAT34RB
                  MOVE TWA-MAP-BLCKCD (2) TO WS-MAP-BLCKCD-KEY2         ACAT34RB
                  MOVE TWA-MAP-BR     (2) TO WS-MAP-BR-KEY2             ACAT34RB
                  MOVE TWA-MAP-ACCT   (2) TO WS-MAP-ACCT-KEY2           ACAT34RB
                  MOVE TWA-MAP-CBRKR  (2) TO WS-MAP-CBRKR-KEY2          ACAT34RB
                  MOVE TWA-MAP-SEC    (2) TO WS-MAP-SEC-KEY2            ACAT34RB
                  IF WS-MAP-KEY1 = WS-MAP-KEY2                          ACAT34RB
                     MOVE ATT-UNPROT-BRT  TO BLCKCD-A (1) BLCKCD-A (2)  ACAT34RB
                                             BRANCH-A (1) BRANCH-A (2)  ACAT34RB
                                             ACCT-A   (1) ACCT-A   (2)  ACAT34RB
                                             CBRKR-A  (1) CBRKR-A  (2)  ACAT34RB
                                             SEC-A    (1) SEC-A    (2)  ACAT34RB
                     MOVE -1 TO BLCKCD-L (1)                            ACAT34RB
                     IF NOT WK-ERROR                                    ACAT34RB
                        SET WK-ERROR TO TRUE                            ACAT34RB
                        MOVE 'DUPLICATE RESCIND/BLOCK ACCTS FOUND'      ACAT34RB
                          TO  SYSTEM-MSG                                ACAT34RB
                     END-IF                                             ACAT34RB
                  END-IF                                                ACAT34RB
              END-IF                                                    ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           PERFORM 5500-SET-ACAT34IO-PASSING-FLDS.                      ACAT34RB
           PERFORM 5800-CHECK-IF-ACCT-EXIST.                            ACAT34RB
           IF ACAT34-NOT-FOUND                                          ACAT34RB
      ****    PERFORM 1270-VALIDATE-NEW-ACCT                            ACAT34RB
              CONTINUE                                                  ACAT34RB
           ELSE                                                         ACAT34RB
           IF ACAT34-NORMAL                                             ACAT34RB
              MOVE ATT-UNPROT-BRT   TO BLCKCD-A (SUB)                   ACAT34RB
                                       BRANCH-A (SUB)                   ACAT34RB
                                       ACCT-A   (SUB)                   ACAT34RB
                                       CBRKR-A  (SUB)                   ACAT34RB
                                       SEC-A    (SUB)                   ACAT34RB
              MOVE -1 TO BLCKCD-L (SUB)                                 ACAT34RB
              IF NOT WK-ERROR                                           ACAT34RB
                 SET WK-ERROR TO TRUE                                   ACAT34RB
                 MOVE 'DUPLICATE RESCIND/BLOCK ACCOUNT FOUND'           ACAT34RB
                   TO  SYSTEM-MSG                                       ACAT34RB
              END-IF                                                    ACAT34RB
           END-IF.                                                      ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
      *    VALIDATE DUPLICATE SCREEN ENTRIES                           *ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
       1265-DUP-ENTRY-CHECK.                                            ACAT34RB
           MOVE TWA-MAP-BR     (1) TO WS-MAP-BR-KEY1.                   ACAT34RB
           MOVE TWA-MAP-ACCT   (1) TO WS-MAP-ACCT-KEY1.                 ACAT34RB
           MOVE TWA-MAP-CBRKR  (1) TO WS-MAP-CBRKR-KEY1.                ACAT34RB
           MOVE TWA-MAP-SEC    (1) TO WS-MAP-SEC-KEY1.                  ACAT34RB
           MOVE TWA-MAP-BR     (2) TO WS-MAP-BR-KEY2.                   ACAT34RB
           MOVE TWA-MAP-ACCT   (2) TO WS-MAP-ACCT-KEY2.                 ACAT34RB
           MOVE TWA-MAP-CBRKR  (2) TO WS-MAP-CBRKR-KEY2.                ACAT34RB
           MOVE TWA-MAP-SEC    (2) TO WS-MAP-SEC-KEY2.                  ACAT34RB
                                                                        ACAT34RB
           IF  TWA-MAP-BLCKCD (1) = 'L'                                 ACAT34RB
           AND TWA-MAP-BLCKCD (2) = 'L'                                 ACAT34RB
               IF WS-MAP-BR-AC-KEY1 = WS-MAP-BR-AC-KEY2                 ACAT34RB
                  MOVE ATT-UNPROT-BRT   TO BLCKCD-A (1) BLCKCD-A (2)    ACAT34RB
                                           BRANCH-A (1) BRANCH-A (2)    ACAT34RB
                                           ACCT-A   (1) ACCT-A   (2)    ACAT34RB
                                           CBRKR-A  (1) CBRKR-A  (2)    ACAT34RB
                                           SEC-A    (1) SEC-A    (2)    ACAT34RB
                  MOVE -1 TO BLCKCD-L (1)                               ACAT34RB
                  IF NOT WK-ERROR                                       ACAT34RB
                     SET WK-ERROR TO TRUE                               ACAT34RB
                     MOVE 'DUPLICATE "L" BLOCK CODE ACCTS FOUND'        ACAT34RB
                       TO  SYSTEM-MSG                                   ACAT34RB
                  END-IF                                                ACAT34RB
               END-IF                                                   ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           IF TWA-MAP-BLCKCD (1) = 'L'                                  ACAT34RB
           AND (TWA-MAP-BLCKCD (2) = 'R' OR 'S')                        ACAT34RB
               IF WS-MAP-BR-AC-KEY1 = WS-MAP-BR-AC-KEY2                 ACAT34RB
                  MOVE ATT-UNPROT-BRT   TO BLCKCD-A (1) BLCKCD-A (2)    ACAT34RB
                                           BRANCH-A (1) BRANCH-A (2)    ACAT34RB
                                           ACCT-A   (1) ACCT-A   (2)    ACAT34RB
                                           CBRKR-A  (1) CBRKR-A  (2)    ACAT34RB
                                           SEC-A    (1) SEC-A    (2)    ACAT34RB
                  MOVE -1 TO BLCKCD-L (1)                               ACAT34RB
                  IF NOT WK-ERROR                                       ACAT34RB
                     SET WK-ERROR TO TRUE                               ACAT34RB
                     MOVE '"L" BLOCK CODE WITH DUPLICATE ACCT FOUND'    ACAT34RB
                       TO  SYSTEM-MSG                                   ACAT34RB
                  END-IF                                                ACAT34RB
               END-IF                                                   ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           IF TWA-MAP-BLCKCD (1) = 'R' OR 'S'                           ACAT34RB
              IF WS-MAP-KEY1 = WS-MAP-KEY2                              ACAT34RB
                 MOVE ATT-UNPROT-BRT   TO BLCKCD-A (1) BLCKCD-A (2)     ACAT34RB
                                          BRANCH-A (1) BRANCH-A (2)     ACAT34RB
                                          ACCT-A   (1) ACCT-A   (2)     ACAT34RB
                                          CBRKR-A  (1) CBRKR-A  (2)     ACAT34RB
                                          SEC-A    (1) SEC-A    (2)     ACAT34RB
                 MOVE -1 TO BLCKCD-L (1)                                ACAT34RB
                 IF NOT WK-ERROR                                        ACAT34RB
                    SET WK-ERROR TO TRUE                                ACAT34RB
                    MOVE 'DUPLICATE ACCTS WITH SAME BLOCK CODE FOUND'   ACAT34RB
                      TO  SYSTEM-MSG                                    ACAT34RB
                  END-IF                                                ACAT34RB
               END-IF                                                   ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           IF  (TWA-MAP-BLCKCD (1) = 'R' OR 'S')                        ACAT34RB
           AND (TWA-MAP-BLCKCD (2) = 'L')                               ACAT34RB
              IF WS-MAP-BR-AC-KEY1 = WS-MAP-BR-AC-KEY2                  ACAT34RB
                 MOVE ATT-UNPROT-BRT   TO BLCKCD-A (1) BLCKCD-A (2)     ACAT34RB
                                          BRANCH-A (1) BRANCH-A (2)     ACAT34RB
                                          ACCT-A   (1) ACCT-A   (2)     ACAT34RB
                                          CBRKR-A  (1) CBRKR-A  (2)     ACAT34RB
                                          SEC-A    (1) SEC-A    (2)     ACAT34RB
                 MOVE -1 TO BLCKCD-L (1)                                ACAT34RB
                 IF NOT WK-ERROR                                        ACAT34RB
                    SET WK-ERROR TO TRUE                                ACAT34RB
                    MOVE 'DUPLICATE ACCT WITH "L" BLOCK CODE FOUND'     ACAT34RB
                      TO  SYSTEM-MSG                                    ACAT34RB
                  END-IF                                                ACAT34RB
              END-IF                                                    ACAT34RB
           END-IF.                                                      ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
      *          VALIDATE NEW RESCIND ACCOUNT                          *ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
       1270-VALIDATE-NEW-ACCT.                                          ACAT34RB
           IF TWA-MAP-BLCKCD (SUB) = 'R' OR 'S'                         ACAT34RB
              PERFORM 5810-FND-LEGAL-BLCKCD                             ACAT34RB
              IF ACAT34-NORMAL                                          ACAT34RB
                 MOVE ATT-UNPROT-BRT   TO BLCKCD-A (SUB)                ACAT34RB
                                          BRANCH-A (SUB)                ACAT34RB
                                          ACCT-A   (SUB)                ACAT34RB
                                          CBRKR-A  (SUB)                ACAT34RB
                                          SEC-A    (SUB)                ACAT34RB
                 MOVE -1 TO BLCKCD-L (SUB)                              ACAT34RB
                 IF NOT WK-ERROR                                        ACAT34RB
                    SET WK-ERROR TO TRUE                                ACAT34RB
                    MOVE '"L" BLOCK CODE WITH SAME ACCOUNT FOUND'       ACAT34RB
                      TO  SYSTEM-MSG                                    ACAT34RB
                 END-IF                                                 ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
           IF TWA-MAP-BLCKCD (SUB) = 'L'                                ACAT34RB
              PERFORM 5820-FND-RESCIND-BLCKCD                           ACAT34RB
              IF ACAT34-NORMAL                                          ACAT34RB
                 MOVE ATT-UNPROT-BRT   TO BLCKCD-A (SUB)                ACAT34RB
                                          BRANCH-A (SUB)                ACAT34RB
                                          ACCT-A   (SUB)                ACAT34RB
                                          CBRKR-A  (SUB)                ACAT34RB
                                          SEC-A    (SUB)                ACAT34RB
                 MOVE -1 TO BLCKCD-L (SUB)                              ACAT34RB
                 IF NOT WK-ERROR                                        ACAT34RB
                    SET WK-ERROR TO TRUE                                ACAT34RB
                    MOVE 'RESCIND "R" BLOCK CODE WITH SAME ACCT FOUND'  ACAT34RB
                      TO  SYSTEM-MSG                                    ACAT34RB
                 END-IF                                                 ACAT34RB
              END-IF                                                    ACAT34RB
              PERFORM 5830-FND-SECURITY-BLCKCD                          ACAT34RB
              IF ACAT34-NORMAL                                          ACAT34RB
                 MOVE ATT-UNPROT-BRT   TO BLCKCD-A (SUB)                ACAT34RB
                                          BRANCH-A (SUB)                ACAT34RB
                                          ACCT-A   (SUB)                ACAT34RB
                                          CBRKR-A  (SUB)                ACAT34RB
                                          SEC-A    (SUB)                ACAT34RB
                 MOVE -1 TO BLCKCD-L (SUB)                              ACAT34RB
                 IF NOT WK-ERROR                                        ACAT34RB
                    SET WK-ERROR TO TRUE                                ACAT34RB
                    MOVE 'SECURITY "S" BLOCK CODE WITH SAME ACCT FOUND' ACAT34RB
                      TO  SYSTEM-MSG                                    ACAT34RB
                 END-IF                                                 ACAT34RB
              END-IF                                                    ACAT34RB
           END-IF.                                                      ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
      *          VALIDATE ACTION                                       *ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
       1300-VALIDATE-ACTION.                                            ACAT34RB
           MOVE ATT-UNPROT TO ACTION-A (SUB).                           ACAT34RB
                                                                        ACAT34RB
           IF TWA-MAP-ACTION (SUB) = SPACE                              ACAT34RB
              CONTINUE                                                  ACAT34RB
           ELSE                                                         ACAT34RB
           IF TWA-MAP-ACTION (SUB) = 'D'                                ACAT34RB
              IF  (TWA-MAP-EXPDT (SUB) = TWA-ORIG-EXPDT (SUB))          ACAT34RB
              AND (TWA-MAP-CMNT1 (SUB) = TWA-ORIG-CMNT1 (SUB))          ACAT34RB
              AND (TWA-MAP-CMNT2 (SUB) = TWA-ORIG-CMNT2 (SUB))          ACAT34RB
                     CONTINUE                                           ACAT34RB
              ELSE                                                      ACAT34RB
                 IF TWA-MAP-EXPDT (SUB) NOT = TWA-ORIG-EXPDT (SUB)      ACAT34RB
                    MOVE ATT-UNPROT-BRT   TO EXPDATE-A (SUB)            ACAT34RB
                 END-IF                                                 ACAT34RB
                 IF TWA-MAP-CMNT1 (SUB) NOT = TWA-ORIG-CMNT1 (SUB)      ACAT34RB
                    MOVE ATT-UNPROT-BRT   TO CMNT1-A (SUB)              ACAT34RB
                 END-IF                                                 ACAT34RB
                 IF TWA-MAP-CMNT2 (SUB) NOT = TWA-ORIG-CMNT2 (SUB)      ACAT34RB
                    MOVE ATT-UNPROT-BRT   TO CMNT2-A (SUB)              ACAT34RB
                 END-IF                                                 ACAT34RB
                 MOVE ATT-UNPROT-BRT   TO ACTION-A (SUB)                ACAT34RB
                 MOVE -1 TO ACTION-L (SUB)                              ACAT34RB
                 IF NOT WK-ERROR                                        ACAT34RB
                    SET WK-ERROR TO TRUE                                ACAT34RB
                    MOVE 'BOTH DELETION AND MODIFICATION CAN NOT BE EXECACAT34RB
      -                  'UTED AT SAME TIME'                            ACAT34RB
                      TO  SYSTEM-MSG                                    ACAT34RB
                 END-IF                                                 ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
              MOVE ATT-UNPROT-BRT TO ACTION-A (SUB)                     ACAT34RB
              MOVE -1 TO ACTION-L (SUB)                                 ACAT34RB
              IF NOT WK-ERROR                                           ACAT34RB
                 SET WK-ERROR TO TRUE                                   ACAT34RB
                 MOVE 'ENTER "D" TO DELETE' TO SYSTEM-MSG               ACAT34RB
              END-IF.                                                   ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
      *          VALIDATE BLOCK CODE                                   *ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
      *    THREE TYPES OF BLOCK CODES.                                 *ACAT34RB
      *       1. CLIENT RESCIND (BLOCK CODE = 'R')                     *ACAT34RB
      *          -  REFERS TO TRANSFERS TO SPECIFIC CONTRA BROKERS.    *ACAT34RB
      *       2. RESTRICTED SECURITY (BLOCK CODE = 'S')                *ACAT34RB
      *          -  APPLIES TO SPECIFIC SECURITY IN A SPECIFIC ACCT.   *ACAT34RB
      *       3. LEGAL BLOCK (BLOCK CODE = 'L')                        *ACAT34RB
      *          -  APPLIES TO THE SPECIFIC ACCOUNT.                   *ACAT34RB
ET0001*       4. FAIL REVERSAL BLOCK (BLOCK CODE = 'F')                *ACAT34RB
ET0001*          -  APPLIES TO THE ACCT WITH SPECIFIC SECURITY AND     *ACAT34RB
ET0001*             SPECIFIC CONTRA BROKER.                            *ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
       1400-VALIDATE-BLOCK-CODE.                                        ACAT34RB
           MOVE ATT-UNPROT TO BLCKCD-A (SUB).                           ACAT34RB
                                                                        ACAT34RB
ET0001**   IF TWA-MAP-BLCKCD (SUB) = 'L' OR 'R' OR 'S'                  ACAT34RB
ET0001     IF TWA-MAP-BLCKCD (SUB) = 'L' OR 'R' OR 'S' OR 'F'           ACAT34RB
              ADD +1 TO WS-ADD-CNT                                      ACAT34RB
           ELSE                                                         ACAT34RB
           IF TWA-MAP-BLCKCD (SUB) = SPACE                              ACAT34RB
              IF TWA-MAP-BR    (SUB) > SPACE                            ACAT34RB
              OR TWA-MAP-ACCT  (SUB) > SPACE                            ACAT34RB
              OR TWA-MAP-CBRKR (SUB) > SPACE                            ACAT34RB
              OR TWA-MAP-SEC   (SUB) > SPACE                            ACAT34RB
              OR TWA-MAP-EXPDT (SUB) > SPACE                            ACAT34RB
              OR TWA-MAP-CMNT1 (SUB) > SPACE                            ACAT34RB
              OR TWA-MAP-CMNT2 (SUB) > SPACE                            ACAT34RB
                  MOVE -1 TO BLCKCD-L (SUB)                             ACAT34RB
                  IF NOT WK-ERROR                                       ACAT34RB
                     SET WK-ERROR TO TRUE                               ACAT34RB
ET0001               MOVE 'ENTER "L", "R", "S", OR "F" FOR A BLOCK CODE'ACAT34RB
                       TO  SYSTEM-MSG                                   ACAT34RB
                  END-IF                                                ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
              MOVE ATT-UNPROT-BRT TO BLCKCD-A (SUB)                     ACAT34RB
              MOVE -1 TO BLCKCD-L (SUB)                                 ACAT34RB
              IF NOT WK-ERROR                                           ACAT34RB
                 SET WK-ERROR TO TRUE                                   ACAT34RB
ET0001           MOVE 'INVALID BLOCK CODE - ENTER "L", "R", "S", OR "F"'ACAT34RB
                   TO  SYSTEM-MSG                                       ACAT34RB
              END-IF.                                                   ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
      *            VALIDATE BRANCH-ACCT                                *ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
       1500-VALIDATE-ACCOUNT.                                           ACAT34RB
           MOVE ATT-UNPROT TO BRANCH-A (SUB) ACCT-A (SUB).              ACAT34RB
           MOVE SPACE TO WS-USER-ENTRY-FOUND-SW.                        ACAT34RB
                                                                        ACAT34RB
           IF  TWA-MAP-BR   (SUB) = SPACE                               ACAT34RB
           AND TWA-MAP-ACCT (SUB) = SPACE                               ACAT34RB
                 MOVE SPACE  TO NAME1-O   (SUB) TWA-MAP-NAME1 (SUB)     ACAT34RB
                                NAME2-O   (SUB) TWA-MAP-NAME2 (SUB)     ACAT34RB
                                CRTDATE-O (SUB) TWA-MAP-CRTDT (SUB)     ACAT34RB
                                UPDDATE-O (SUB) TWA-MAP-UPDDT (SUB)     ACAT34RB
                                USER-O    (SUB) TWA-MAP-USER  (SUB)     ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           IF  TWA-MAP-BR   (SUB) > SPACE                               ACAT34RB
           AND TWA-MAP-ACCT (SUB) > SPACE                               ACAT34RB
               SET WS-USER-ENTRY-FOUND TO TRUE                          ACAT34RB
           ELSE                                                         ACAT34RB
           IF TWA-MAP-BLCKCD (SUB) > SPACE                              ACAT34RB
              IF TWA-MAP-BR (SUB) = SPACE                               ACAT34RB
                  MOVE ATT-UNPROT-BRT TO BRANCH-A (SUB)                 ACAT34RB
                  MOVE -1 TO BRANCH-L (SUB)                             ACAT34RB
                  IF NOT WK-ERROR                                       ACAT34RB
                     SET WK-ERROR TO TRUE                               ACAT34RB
                     MOVE 'ENTER BRANCH NUMBER' TO SYSTEM-MSG           ACAT34RB
                  END-IF                                                ACAT34RB
              ELSE                                                      ACAT34RB
              IF TWA-MAP-ACCT (SUB) = SPACE                             ACAT34RB
                  MOVE ATT-UNPROT-BRT TO ACCT-A (SUB)                   ACAT34RB
                  MOVE -1 TO ACCT-L (SUB)                               ACAT34RB
                  IF NOT WK-ERROR                                       ACAT34RB
                     SET WK-ERROR TO TRUE                               ACAT34RB
                     MOVE 'ENTER ACCOUNT NUMBER'                        ACAT34RB
                       TO  SYSTEM-MSG                                   ACAT34RB
                  END-IF                                                ACAT34RB
               END-IF.                                                  ACAT34RB
                                                                        ACAT34RB
           IF WS-USER-ENTRY-FOUND                                       ACAT34RB
              PERFORM 1510-CONTINUE-VALIDATE-ACCT                       ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
      *                                                                 ACAT34RB
       1510-CONTINUE-VALIDATE-ACCT.                                     ACAT34RB
           SET ACATNAIO-NA-READ    TO TRUE.                             ACAT34RB
           MOVE WK-CLT-NBR         TO ACATNAIO-CLIENT.                  ACAT34RB
           MOVE TWA-MAP-BR   (SUB) TO ACATNAIO-BR.                      ACAT34RB
           MOVE TWA-MAP-ACCT (SUB) TO ACATNAIO-AC.                      ACAT34RB
           PERFORM 7610-LINK-TO-ACATNAIO-RTN.                           ACAT34RB
                                                                        ACAT34RB
           IF NOT ACATNAIO-FOUND                                        ACAT34RB
              MOVE SPACE TO NAME1-O   (SUB)  TWA-MAP-NAME1 (SUB)        ACAT34RB
                            NAME2-O   (SUB)  TWA-MAP-NAME2 (SUB)        ACAT34RB
                            CRTDATE-O (SUB)  TWA-MAP-CRTDT (SUB)        ACAT34RB
                            UPDDATE-O (SUB)  TWA-MAP-UPDDT (SUB)        ACAT34RB
                            USER-O    (SUB)  TWA-MAP-USER  (SUB)        ACAT34RB
              MOVE ATT-UNPROT-BRT TO BRANCH-A (SUB) ACCT-A (SUB)        ACAT34RB
              MOVE -1 TO BRANCH-L (SUB)                                 ACAT34RB
              IF NOT WK-ERROR                                           ACAT34RB
                 SET WK-ERROR TO TRUE                                   ACAT34RB
                 MOVE 'INVALID ACCOUNT - NOT FOUND IN N&A FILE'         ACAT34RB
                   TO  SYSTEM-MSG                                       ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
              MOVE TWA-MAP-BR (SUB) TO SRCH-INP-BRANCH                  ACAT34RB
              PERFORM 7530-SIGNON-SECR-CHECK-RTN                        ACAT34RB
              IF SRCH-SIGNON-SECR-CHECK-FAIL                            ACAT34RB
                 MOVE SPACE TO NAME1-O   (SUB)  TWA-MAP-NAME1 (SUB)     ACAT34RB
                               NAME2-O   (SUB)  TWA-MAP-NAME2 (SUB)     ACAT34RB
                               CRTDATE-O (SUB)  TWA-MAP-CRTDT (SUB)     ACAT34RB
                               UPDDATE-O (SUB)  TWA-MAP-UPDDT (SUB)     ACAT34RB
                               USER-O    (SUB)  TWA-MAP-USER  (SUB)     ACAT34RB
                 MOVE ATT-UNPROT-BRT TO BRANCH-A (SUB) ACCT-A (SUB)     ACAT34RB
                 MOVE -1 TO BRANCH-L (SUB)                              ACAT34RB
                 IF NOT WK-ERROR                                        ACAT34RB
                    SET WK-ERROR TO TRUE                                ACAT34RB
                    MOVE SRCH-MSG TO SYSTEM-MSG                         ACAT34RB
                 END-IF                                                 ACAT34RB
              ELSE                                                      ACAT34RB
                 MOVE ACATNAIO-NAME                                     ACAT34RB
                   TO NAME1-O (SUB) TWA-MAP-NAME1 (SUB)                 ACAT34RB
                 MOVE ACATNAIO-NAME2                                    ACAT34RB
                   TO NAME2-O (SUB) TWA-MAP-NAME2 (SUB)                 ACAT34RB
                 MOVE WSMMDDYY                                          ACAT34RB
                   TO CRTDATE-O (SUB) TWA-MAP-CRTDT (SUB)               ACAT34RB
                      UPDDATE-O (SUB) TWA-MAP-UPDDT (SUB)               ACAT34RB
                 MOVE ACAT-SIGN-ON-ID                                   ACAT34RB
                   TO USER-O (SUB) TWA-MAP-USER (SUB)                   ACAT34RB
              END-IF.                                                   ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
      *            VALIDATE CONTRA BROKER                              *ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
       1600-VALIDATE-CONTRA.                                            ACAT34RB
           MOVE ATT-UNPROT TO CBRKR-A (SUB).                            ACAT34RB
           MOVE SPACE TO WS-USER-ENTRY-FOUND-SW.                        ACAT34RB
                                                                        ACAT34RB
           IF TWA-MAP-CBRKR (SUB) = SPACE                               ACAT34RB
ET0001        IF TWA-MAP-BLCKCD (SUB) = 'R' OR 'F'                      ACAT34RB
                 MOVE ATT-UNPROT-BRT TO CBRKR-A (SUB)                   ACAT34RB
                 MOVE -1 TO CBRKR-L (SUB)                               ACAT34RB
                 IF NOT WK-ERROR                                        ACAT34RB
                    SET WK-ERROR TO TRUE                                ACAT34RB
                    MOVE 'ENTER CONTRA BROKER NUMBER'                   ACAT34RB
                      TO  SYSTEM-MSG                                    ACAT34RB
                 END-IF                                                 ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
ET0001        IF TWA-MAP-BLCKCD (SUB) = 'R' OR 'F'                      ACAT34RB
                 SET WS-USER-ENTRY-FOUND TO TRUE                        ACAT34RB
              ELSE                                                      ACAT34RB
              IF TWA-MAP-BLCKCD (SUB) = 'L' OR 'S'                      ACAT34RB
                 MOVE ATT-UNPROT-BRT TO BLCKCD-A (SUB) CBRKR-A (SUB)    ACAT34RB
                 MOVE -1 TO CBRKR-L (SUB)                               ACAT34RB
                 IF NOT WK-ERROR                                        ACAT34RB
                    SET WK-ERROR TO TRUE                                ACAT34RB
                    MOVE 'CONTRA BROKER FLD MUST BE BLANK FOR "L" OR "S"ACAT34RB
      -                  ' BLOCK CODE'                                  ACAT34RB
                      TO  SYSTEM-MSG                                    ACAT34RB
                 END-IF                                                 ACAT34RB
              END-IF                                                    ACAT34RB
              END-IF                                                    ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           IF WS-USER-ENTRY-FOUND                                       ACAT34RB
              MOVE TWA-MAP-CBRKR (SUB) TO ACATPPIO-BRKR                 ACAT34RB
              SET ACATPPIO-READ TO TRUE                                 ACAT34RB
              PERFORM 7700-LINK-TO-ACATPPIO                             ACAT34RB
              IF NOT ACATPPIO-FOUND                                     ACAT34RB
                 MOVE ATT-UNPROT-BRT TO CBRKR-A (SUB)                   ACAT34RB
                 MOVE -1 TO CBRKR-L (SUB)                               ACAT34RB
                 IF NOT WK-ERROR                                        ACAT34RB
                    SET WK-ERROR TO TRUE                                ACAT34RB
                    MOVE 'INVALID CONTRA BROKER NUMBER' TO SYSTEM-MSG   ACAT34RB
                 END-IF                                                 ACAT34RB
              END-IF                                                    ACAT34RB
           END-IF.                                                      ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
      *          VALIDATE SECURITY/CUSIP/SYMBOL                        *ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
       1700-VALIDATE-SECURITY.                                          ACAT34RB
           MOVE ATT-UNPROT TO SEC-A (SUB).                              ACAT34RB
                                                                        ACAT34RB
           IF TWA-MAP-SEC (SUB) = SPACE                                 ACAT34RB
              MOVE SPACE TO DESC1-O  (SUB) TWA-MAP-DESC1  (SUB)         ACAT34RB
                            DESC2-O  (SUB) TWA-MAP-DESC2  (SUB)         ACAT34RB
                            ADPSEC-O (SUB) TWA-MAP-ADPSEC (SUB)         ACAT34RB
ET0001        IF TWA-MAP-BLCKCD (SUB) = 'S' OR 'F'                      ACAT34RB
                 MOVE ATT-UNPROT-BRT TO SEC-A (SUB)                     ACAT34RB
                 MOVE -1 TO SEC-L (SUB)                                 ACAT34RB
                 IF NOT WK-ERROR                                        ACAT34RB
                    SET WK-ERROR TO TRUE                                ACAT34RB
                    MOVE 'ENTER SECURITY NUMBER'                        ACAT34RB
                      TO  SYSTEM-MSG                                    ACAT34RB
                 END-IF                                                 ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
ET0001        IF TWA-MAP-BLCKCD (SUB) = 'S' OR 'F'                      ACAT34RB
                 PERFORM 1710-SECURITY-CHECK                            ACAT34RB
              ELSE                                                      ACAT34RB
              IF TWA-MAP-BLCKCD (SUB) = 'L' OR 'R'                      ACAT34RB
                 MOVE ATT-UNPROT-BRT TO BLCKCD-A (SUB) SEC-A (SUB)      ACAT34RB
                 MOVE -1 TO SEC-L (SUB)                                 ACAT34RB
                 IF NOT WK-ERROR                                        ACAT34RB
                    SET WK-ERROR TO TRUE                                ACAT34RB
                    MOVE 'SECURITY FLD MUST BE BLANK FOR "L" OR "R" BLOCACAT34RB
      -                  'K CODE'                                       ACAT34RB
                      TO  SYSTEM-MSG                                    ACAT34RB
                 END-IF                                                 ACAT34RB
              END-IF                                                    ACAT34RB
              END-IF                                                    ACAT34RB
           END-IF.                                                      ACAT34RB
      *                                                                 ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
      *          GET SECURITY AND DESCRIPTION FROM MSD                 *ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
       1710-SECURITY-CHECK.                                             ACAT34RB
           MOVE TWA-MAP-SEC (SUB) TO ACATMSD-SEARCH-KEY.                ACAT34RB
           SET ACATMSD-MSD-READ TO TRUE.                                ACAT34RB
           PERFORM 7900-LINK-TO-ACATMSD.                                ACAT34RB
           IF ACATMSD-FOUND                                             ACAT34RB
              IF ACATMSD-CUSIP (1:9) > SPACE                            ACAT34RB
                 MOVE ACATMSD-CUSIP    TO SEC-O (SUB) TWA-MAP-SEC (SUB) ACAT34RB
              ELSE                                                      ACAT34RB
                 MOVE SPACES           TO WS-ADPSEC-EDITED              ACAT34RB
                 MOVE 'XX'             TO WS-XX-ADPSEC                  ACAT34RB
                 MOVE ACATMSD-ADP-NBR  TO WS-ADPSEC                     ACAT34RB
                 MOVE WS-ADPSEC-EDITED TO SEC-O (SUB) TWA-MAP-SEC (SUB) ACAT34RB
              END-IF                                                    ACAT34RB
              MOVE ACATMSD-ADP-NBR TO ADPSEC-O(SUB) TWA-MAP-ADPSEC(SUB) ACAT34RB
              MOVE ACATMSD-DESC    TO DESC1-O (SUB) TWA-MAP-DESC1 (SUB) ACAT34RB
              MOVE ACATMSD-DESC2   TO DESC2-O (SUB) TWA-MAP-DESC2 (SUB) ACAT34RB
           ELSE                                                         ACAT34RB
           IF ACATMSD-NOT-AVAIL                                         ACAT34RB
              MOVE SPACE TO ADPSEC-O (SUB) TWA-MAP-ADPSEC (SUB)         ACAT34RB
                            DESC1-O  (SUB) TWA-MAP-DESC1  (SUB)         ACAT34RB
                            DESC2-O  (SUB) TWA-MAP-DESC2  (SUB)         ACAT34RB
              MOVE ATT-UNPROT-BRT TO SEC-A (SUB)                        ACAT34RB
              MOVE -1 TO SEC-L (SUB)                                    ACAT34RB
              IF NOT WK-ERROR                                           ACAT34RB
                 SET WK-ERROR TO TRUE                                   ACAT34RB
                 MOVE 'MSD FILE NOT AVAILABE NOW - TRY IT LATER AGAIN'  ACAT34RB
                   TO  SYSTEM-MSG                                       ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
              MOVE SPACE TO ADPSEC-O (SUB) TWA-MAP-ADPSEC (SUB)         ACAT34RB
                            DESC1-O  (SUB) TWA-MAP-DESC1  (SUB)         ACAT34RB
                            DESC2-O  (SUB) TWA-MAP-DESC2  (SUB)         ACAT34RB
              MOVE ATT-UNPROT-BRT TO SEC-A (SUB)                        ACAT34RB
              MOVE -1 TO SEC-L (SUB)                                    ACAT34RB
              IF NOT WK-ERROR                                           ACAT34RB
                 SET WK-ERROR TO TRUE                                   ACAT34RB
                 MOVE 'INVALID SECURITY' TO SYSTEM-MSG                  ACAT34RB
              END-IF                                                    ACAT34RB
           END-IF.                                                      ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
      *          VALIDATE EXPIRATEION DATE                             *ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
       1800-VALIDATE-EXP-DATE.                                          ACAT34RB
           MOVE ATT-UNPROT TO EXPDATE-A (SUB).                          ACAT34RB
                                                                        ACAT34RB
           IF TWA-MAP-EXPDT (SUB) = SPACE                               ACAT34RB
ET0001        IF TWA-MAP-BLCKCD (SUB) = 'R' OR 'S' OR 'F'               ACAT34RB
                 MOVE ATT-UNPROT-BRT TO EXPDATE-A (SUB)                 ACAT34RB
                 MOVE -1 TO EXPDATE-L (SUB)                             ACAT34RB
                 IF NOT WK-ERROR                                        ACAT34RB
                    SET WK-ERROR TO TRUE                                ACAT34RB
                    MOVE 'ENTER EXPIRATION DATE IN "MMDDYY" OR "MM/DD/YYACAT34RB
      -                  '" FORMAT'                                     ACAT34RB
                      TO  SYSTEM-MSG                                    ACAT34RB
                 END-IF                                                 ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
              PERFORM 1810-DATE-FORMAT-CHECK                            ACAT34RB
           END-IF.                                                      ACAT34RB
      *                                                                 ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
      *          DATE FORMAT CHECK                                     *ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
       1810-DATE-FORMAT-CHECK.                                          ACAT34RB
           MOVE SPACE TO WS-VALID-EXP-DATE-SW.                          ACAT34RB
           MOVE TWA-MAP-EXPDT (SUB)  TO WS-MDY-DATE.                    ACAT34RB
           IF WS-MMDDYY IS NUMERIC                                      ACAT34RB
              MOVE WS-MDY-MM  TO WS-EXP-MM                              ACAT34RB
              MOVE WS-MDY-DD  TO WS-EXP-DD                              ACAT34RB
              MOVE WS-MDY-YY  TO WS-EXP-YY                              ACAT34RB
              MOVE '/'        TO WS-EXP-SLASH1 WS-EXP-SLASH2            ACAT34RB
           ELSE                                                         ACAT34RB
              MOVE TWA-MAP-EXPDT (SUB)  TO WS-EXP-DATE                  ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           IF  WS-EXP-MM IS NUMERIC                                     ACAT34RB
           AND WS-EXP-DD IS NUMERIC                                     ACAT34RB
           AND WS-EXP-YY IS NUMERIC                                     ACAT34RB
              IF  WS-EXP-SLASH1 = '/'                                   ACAT34RB
              AND WS-EXP-SLASH2 = '/'                                   ACAT34RB
                  PERFORM 1820-DATE-CHECK                               ACAT34RB
              ELSE                                                      ACAT34RB
                  MOVE ATT-UNPROT-BRT TO EXPDATE-A (SUB)                ACAT34RB
                  MOVE -1 TO EXPDATE-L (SUB)                            ACAT34RB
                  IF NOT WK-ERROR                                       ACAT34RB
                     SET WK-ERROR TO TRUE                               ACAT34RB
                     MOVE 'INVALID DATE FORMAT (MMDDYY OR MM/DD/YY)'    ACAT34RB
                       TO  SYSTEM-MSG                                   ACAT34RB
                  END-IF                                                ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
              MOVE ATT-UNPROT-BRT TO EXPDATE-A (SUB)                    ACAT34RB
              MOVE -1 TO EXPDATE-L (SUB)                                ACAT34RB
              IF NOT WK-ERROR                                           ACAT34RB
                 SET WK-ERROR TO TRUE                                   ACAT34RB
                 MOVE 'INVALID DATE FORMAT (MMDDYY OR MM/DD/YY)'        ACAT34RB
                   TO  SYSTEM-MSG                                       ACAT34RB
              END-IF                                                    ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           IF WS-VALID-EXP-DATE                                         ACAT34RB
              MOVE WS-EXP-DATE TO TWA-MAP-EXPDT (SUB)                   ACAT34RB
                                  EXPDATE-O     (SUB)                   ACAT34RB
           END-IF.                                                      ACAT34RB
      *                                                                 ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
      *          EXPIRATION DATE CHECK                                 *ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
       1820-DATE-CHECK.                                                 ACAT34RB
           MOVE SPACE TO WS-LEAP-YEAR-SW.                               ACAT34RB
                                                                        ACAT34RB
           DIVIDE WS-EXP-YY-N BY 4                                      ACAT34RB
                  GIVING WS-DIVIDED REMAINDER WS-REMAIN.                ACAT34RB
           IF WS-REMAIN = 0                                             ACAT34RB
              SET WS-LEAP-YEAR TO TRUE                                  ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           IF WS-EXP-MM = '01' OR '03' OR '05' OR '07'                  ACAT34RB
                       OR '08' OR '10' OR '12'                          ACAT34RB
              IF WS-EXP-DD > '00' AND WS-EXP-DD < '32'                  ACAT34RB
                 CONTINUE                                               ACAT34RB
              ELSE                                                      ACAT34RB
                 MOVE ATT-UNPROT-BRT TO EXPDATE-A (SUB)                 ACAT34RB
                 MOVE -1 TO EXPDATE-L (SUB)                             ACAT34RB
                 IF NOT WK-ERROR                                        ACAT34RB
                    SET WK-ERROR TO TRUE                                ACAT34RB
                    MOVE 'INVALID EXPIRATION DATE'                      ACAT34RB
                      TO  SYSTEM-MSG                                    ACAT34RB
                 END-IF                                                 ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
           IF WS-EXP-MM = '04' OR '06' OR '09' OR '11'                  ACAT34RB
              IF WS-EXP-DD > '00' AND WS-EXP-DD < '31'                  ACAT34RB
                 CONTINUE                                               ACAT34RB
              ELSE                                                      ACAT34RB
                 MOVE ATT-UNPROT-BRT TO EXPDATE-A (SUB)                 ACAT34RB
                 MOVE -1 TO EXPDATE-L (SUB)                             ACAT34RB
                 IF NOT WK-ERROR                                        ACAT34RB
                    SET WK-ERROR TO TRUE                                ACAT34RB
                    MOVE 'INVALID EXPIRATION DATE'                      ACAT34RB
                      TO  SYSTEM-MSG                                    ACAT34RB
                 END-IF                                                 ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
           IF WS-EXP-MM = '02'                                          ACAT34RB
              IF WS-LEAP-YEAR                                           ACAT34RB
                 IF WS-EXP-DD > '00' AND WS-EXP-DD < '30'               ACAT34RB
                    CONTINUE                                            ACAT34RB
                 ELSE                                                   ACAT34RB
                    MOVE ATT-UNPROT-BRT TO EXPDATE-A (SUB)              ACAT34RB
                    MOVE -1 TO EXPDATE-L (SUB)                          ACAT34RB
                    IF NOT WK-ERROR                                     ACAT34RB
                       SET WK-ERROR TO TRUE                             ACAT34RB
                       MOVE 'INVALID EXPIRATION DATE'                   ACAT34RB
                         TO  SYSTEM-MSG                                 ACAT34RB
                    END-IF                                              ACAT34RB
                 END-IF                                                 ACAT34RB
              ELSE                                                      ACAT34RB
                 IF WS-EXP-DD > '00' AND WS-EXP-DD < '29'               ACAT34RB
                    CONTINUE                                            ACAT34RB
                 ELSE                                                   ACAT34RB
                    MOVE ATT-UNPROT-BRT TO EXPDATE-A (SUB)              ACAT34RB
                    MOVE -1 TO EXPDATE-L (SUB)                          ACAT34RB
                    IF NOT WK-ERROR                                     ACAT34RB
                       SET WK-ERROR TO TRUE                             ACAT34RB
                       MOVE 'INVALID EXPIRATION DATE'                   ACAT34RB
                         TO  SYSTEM-MSG                                 ACAT34RB
                    END-IF                                              ACAT34RB
                 END-IF                                                 ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
              MOVE ATT-UNPROT-BRT TO EXPDATE-A (SUB)                    ACAT34RB
              MOVE -1 TO EXPDATE-L (SUB)                                ACAT34RB
              IF NOT WK-ERROR                                           ACAT34RB
                 SET WK-ERROR TO TRUE                                   ACAT34RB
                 MOVE 'INVALID EXPIRATION DATE'                         ACAT34RB
                   TO  SYSTEM-MSG                                       ACAT34RB
              END-IF                                                    ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           IF NOT WK-ERROR                                              ACAT34RB
              MOVE '20'            TO WS-TOD-CC                         ACAT34RB
              MOVE WS-CUR-MM       TO WS-TOD-MM                         ACAT34RB
              MOVE WS-CUR-DD       TO WS-TOD-DD                         ACAT34RB
              MOVE WS-CUR-YY       TO WS-TOD-YY                         ACAT34RB
              MOVE '20'            TO WS-EXP-DT-CC                      ACAT34RB
              MOVE WS-EXP-MM       TO WS-EXP-DT-MM                      ACAT34RB
              MOVE WS-EXP-DD       TO WS-EXP-DT-DD                      ACAT34RB
              MOVE WS-EXP-YY       TO WS-EXP-DT-YY                      ACAT34RB
              IF WS-EXP-DATE-EDITED >= WS-TOD-DATE                      ACAT34RB
                 SET WS-VALID-EXP-DATE TO TRUE                          ACAT34RB
              ELSE                                                      ACAT34RB
                 MOVE ATT-UNPROT-BRT TO EXPDATE-A (SUB)                 ACAT34RB
                 MOVE -1 TO EXPDATE-L (SUB)                             ACAT34RB
                 IF NOT WK-ERROR                                        ACAT34RB
                    SET WK-ERROR TO TRUE                                ACAT34RB
                    MOVE 'EXP DATE MUST BE GREATER THAN OR EQUAL TO TODAACAT34RB
      -                  'YS DATE'                                      ACAT34RB
                      TO  SYSTEM-MSG                                    ACAT34RB
                 END-IF                                                 ACAT34RB
              END-IF.                                                   ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
      *             VALIDATE COMMENT FIELD                             *ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
       1900-VALIDATE-COMMENT.                                           ACAT34RB
ET0001     IF TWA-MAP-BLCKCD (SUB) = 'R' OR 'S' OR 'L' OR 'F'           ACAT34RB
              IF  TWA-MAP-CMNT1 (SUB) = SPACE                           ACAT34RB
              AND TWA-MAP-CMNT2 (SUB) = SPACE                           ACAT34RB
                 MOVE -1 TO CMNT1-L (SUB)                               ACAT34RB
                 IF NOT WK-ERROR                                        ACAT34RB
                    SET WK-ERROR TO TRUE                                ACAT34RB
                    MOVE 'COMMENT REQUIRED'                             ACAT34RB
                      TO  SYSTEM-MSG                                    ACAT34RB
                 END-IF                                                 ACAT34RB
              END-IF                                                    ACAT34RB
           END-IF.                                                      ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
      *             SET ALL SCREEN ATTRIBUTES TO ASKIP                 *ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
       2000-ATTRIB-TO-ASKIP.                                            ACAT34RB
           PERFORM VARYING SUB FROM 1 BY 1   UNTIL SUB > 2              ACAT34RB
               MOVE ATT-ASKIP TO ACTION-A  (SUB)                        ACAT34RB
                                 BLCKCD-A  (SUB)                        ACAT34RB
                                 BRANCH-A  (SUB)                        ACAT34RB
                                 ACCT-A    (SUB)                        ACAT34RB
                                 CBRKR-A   (SUB)                        ACAT34RB
                                 SEC-A     (SUB)                        ACAT34RB
                                 EXPDATE-A (SUB)                        ACAT34RB
                                 CMNT1-A   (SUB)                        ACAT34RB
                                 CMNT2-A   (SUB)                        ACAT34RB
           END-PERFORM.                                                 ACAT34RB
      *                                                                 ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
      *             CLEAR SCREEN WITH SPACES                           *ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
       2010-CLEAR-SCR.                                                  ACAT34RB
           PERFORM VARYING SUB FROM 1 BY 1   UNTIL SUB > 2              ACAT34RB
              MOVE SPACE   TO ACTION-O  (SUB)                           ACAT34RB
                              BLCKCD-O  (SUB)                           ACAT34RB
                              BRANCH-O  (SUB)                           ACAT34RB
                              ACCT-O    (SUB)                           ACAT34RB
                              CBRKR-O   (SUB)                           ACAT34RB
                              SEC-O     (SUB)                           ACAT34RB
                              NAME1-O   (SUB)                           ACAT34RB
                              ADPSEC-O  (SUB)                           ACAT34RB
                              NAME2-O   (SUB)                           ACAT34RB
                              DESC1-O   (SUB)                           ACAT34RB
                              CRTDATE-O (SUB)                           ACAT34RB
                              DESC2-O   (SUB)                           ACAT34RB
                              EXPDATE-O (SUB)                           ACAT34RB
                              UPDDATE-O (SUB)                           ACAT34RB
                              USER-O    (SUB)                           ACAT34RB
                              CMNT1-O   (SUB)                           ACAT34RB
                              CMNT2-O   (SUB)                           ACAT34RB
           END-PERFORM.                                                 ACAT34RB
           MOVE SPACE TO MNEXTO.                                        ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
      *         PF2: ADD NEW ACCOUNT ROUTINE                           *ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
       3000-ADD-NEW-ACCT-RTN.                                           ACAT34RB
           IF TWA-HISTORY-FILE-SCR                                      ACAT34RB
              MOVE LOW-VALUE TO ACAT34MO                                ACAT34RB
              MOVE -1 TO MNEXTL                                         ACAT34RB
              SET WK-ERROR TO TRUE                                      ACAT34RB
              MOVE 'BROWSE ONLY FOR HISTORICAL FILE'                    ACAT34RB
                TO  SYSTEM-MSG                                          ACAT34RB
              PERFORM 9000-ERROR-RTN                                    ACAT34RB
           END-IF.                                                      ACAT34RB
           IF NOT ACAT-SIGN-ON-UPDATE                                   ACAT34RB
              MOVE LOW-VALUE TO ACAT34MO                                ACAT34RB
              MOVE -1 TO MNEXTL                                         ACAT34RB
              SET WK-ERROR TO TRUE                                      ACAT34RB
              MOVE 'UNAUTHORIZED TO ADD'                                ACAT34RB
                TO  SYSTEM-MSG                                          ACAT34RB
              PERFORM 9000-ERROR-RTN                                    ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           MOVE SPACE  TO WK-ERROR-SW                                   ACAT34RB
                          WK-MSG-ON-SW                                  ACAT34RB
                          SYSTEM-MSG.                                   ACAT34RB
           MOVE SPACES TO TWA-MAP-AREA TWA-MAP-SAVE-AREA                ACAT34RB
                TWA-MAP-KEY-AREA TWA-MAP-SEARCH TWA-PREV-MAP-SEARCH.    ACAT34RB
           MOVE ZEROES TO TWA-SCR-LINE.                                 ACAT34RB
           SET TWA-UPDATE-ADD TO TRUE.                                  ACAT34RB
                                                                        ACAT34RB
           PERFORM 2010-CLEAR-SCR.                                      ACAT34RB
                                                                        ACAT34RB
           MOVE SPACES                                                  ACAT34RB
             TO MMBRO MMACO MMRRO MMTFRO MMRDO MMBKRO MMSTATO MMSDO.    ACAT34RB
                                                                        ACAT34RB
           PERFORM VARYING SUB FROM 1 BY 1 UNTIL SUB > 2                ACAT34RB
              MOVE ATT-ASKIP  TO ACTION-A  (SUB)                        ACAT34RB
              MOVE ATT-UNPROT TO BLCKCD-A  (SUB)                        ACAT34RB
                                 BRANCH-A  (SUB)                        ACAT34RB
                                 ACCT-A    (SUB)                        ACAT34RB
                                 CBRKR-A   (SUB)                        ACAT34RB
                                 SEC-A     (SUB)                        ACAT34RB
                                 EXPDATE-A (SUB)                        ACAT34RB
                                 CMNT1-A   (SUB)                        ACAT34RB
                                 CMNT2-A   (SUB)                        ACAT34RB
           END-PERFORM.                                                 ACAT34RB
           MOVE -1 TO BLCKCD-L (1).                                     ACAT34RB
           SET WK-MSG-ON TO TRUE.                                       ACAT34RB
           MOVE 'ENTER BLOCK CODE' TO SYSTEM-MSG.                       ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
      *         PF3: EXIT FROM ADD MODE                                *ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
       3100-EXIT-ADD-RTN.                                               ACAT34RB
           IF TWA-HISTORY-FILE-SCR                                      ACAT34RB
              MOVE LOW-VALUE TO ACAT34MO                                ACAT34RB
              MOVE -1 TO MNEXTL                                         ACAT34RB
              SET WK-ERROR TO TRUE                                      ACAT34RB
              MOVE 'ERROR FUNCTION KEY FOR HISTORICAL FILE'             ACAT34RB
                TO  SYSTEM-MSG                                          ACAT34RB
              PERFORM 9000-ERROR-RTN                                    ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           IF NOT TWA-UPDATE-ADD                                        ACAT34RB
              SET WK-ERROR TO TRUE                                      ACAT34RB
              MOVE LOW-VALUE TO ACAT34MO                                ACAT34RB
              MOVE -1 TO MNEXTL                                         ACAT34RB
              MOVE 'PF3 KEY CURRENTLY DISABLED'                         ACAT34RB
                TO  SYSTEM-MSG                                          ACAT34RB
              PERFORM 9000-ERROR-RTN                                    ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           MOVE SPACE TO WK-ERROR-SW                                    ACAT34RB
                         WK-MSG-ON-SW                                   ACAT34RB
                         SYSTEM-MSG.                                    ACAT34RB
           PERFORM 2010-CLEAR-SCR.                                      ACAT34RB
           PERFORM 0200-FIRST-TIME-RTN.                                 ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
      *    PF4: SWITCH FROM ACTIVE TO HISTORY DISPLAY OR VICE VERSA    *ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
       4000-SWITCH-SCREEN.                                              ACAT34RB
           IF TWA-ACTIVE-FILE-SCR                                       ACAT34RB
              SET TWA-HISTORY-FILE-SCR   TO TRUE                        ACAT34RB
           ELSE                                                         ACAT34RB
              SET TWA-ACTIVE-FILE-SCR   TO TRUE                         ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           MOVE SPACE TO WK-ERROR-SW                                    ACAT34RB
                         WK-MSG-ON-SW                                   ACAT34RB
                         SYSTEM-MSG.                                    ACAT34RB
           MOVE SPACES TO TWA-MAP-AREA                                  ACAT34RB
                          TWA-MAP-SAVE-AREA                             ACAT34RB
                          TWA-MAP-KEY-AREA                              ACAT34RB
                          TWA-MAP-SEARCH                                ACAT34RB
                          TWA-PREV-MAP-SEARCH.                          ACAT34RB
           MOVE ZEROES TO TWA-SCR-LINE.                                 ACAT34RB
           PERFORM 2010-CLEAR-SCR.                                      ACAT34RB
           PERFORM 0200-FIRST-TIME-RTN.                                 ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
      *            PF5: UPDATE (DEL/MOD/ADD)                           *ACAT34RB
      *----------------------------------------------------------------*ACAT34RB
       5000-UPDATE-RTN.                                                 ACAT34RB
           IF NOT ACAT-SIGN-ON-UPDATE                                   ACAT34RB
              PERFORM 2000-ATTRIB-TO-ASKIP                              ACAT34RB
              MOVE -1 TO MNEXTL                                         ACAT34RB
              SET WK-ERROR TO TRUE                                      ACAT34RB
              MOVE 'UNAUTHORIZED TO UPDATE'                             ACAT34RB
                TO  SYSTEM-MSG                                          ACAT34RB
              PERFORM 9000-ERROR-RTN                                    ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           IF TWA-UPDATE-MOD                                            ACAT34RB
              PERFORM 5100-MODIFY-RTN                                   ACAT34RB
                           VARYING SUB FROM 1 BY 1                      ACAT34RB
                             UNTIL SUB > 2 OR SUB > TWA-SCR-LINE        ACAT34RB
              IF WS-ACCT-DELETED                                        ACAT34RB
                 PERFORM 5200-RESET-SCR-AFTER-DEL                       ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
           IF TWA-UPDATE-ADD                                            ACAT34RB
              PERFORM 5300-ADD-RTN                                      ACAT34RB
                 THRU 5300-EXIT                                         ACAT34RB
                   VARYING SUB FROM 1 BY 1                              ACAT34RB
                     UNTIL SUB > 2                                      ACAT34RB
              PERFORM 3000-ADD-NEW-ACCT-RTN                             ACAT34RB
              MOVE 'UPDATE COMPLETED SUCESSFULLY - ENTER BLOCK CODE'    ACAT34RB
                TO  SYSTEM-MSG                                          ACAT34RB
           END-IF.                                                      ACAT34RB
      *                                                                 ACAT34RB
      *---------------------------------------------------------------* ACAT34RB
      *          DELETE/MODIFY RESCIND ACCOUNT                        * ACAT34RB
      *---------------------------------------------------------------* ACAT34RB
       5100-MODIFY-RTN.                                                 ACAT34RB
           PERFORM  5500-SET-ACAT34IO-PASSING-FLDS.                     ACAT34RB
                                                                        ACAT34RB
           IF TWA-MAP-ACTION (SUB) = 'D'                                ACAT34RB
               PERFORM 5110-DELETE-RSND-ACCT                            ACAT34RB
               SET WK-MSG-ON TO TRUE                                    ACAT34RB
               MOVE 'UPDATE COMPLETED SUCESSFULLY'                      ACAT34RB
                 TO  SYSTEM-MSG                                         ACAT34RB
           ELSE                                                         ACAT34RB
           IF TWA-MAP-EXPDT (SUB) NOT = TWA-ORIG-EXPDT (SUB)            ACAT34RB
           OR TWA-MAP-CMNT1 (SUB) NOT = TWA-ORIG-CMNT1 (SUB)            ACAT34RB
           OR TWA-MAP-CMNT2 (SUB) NOT = TWA-ORIG-CMNT2 (SUB)            ACAT34RB
                PERFORM 5120-MODIFY-RSND-ACCT                           ACAT34RB
                SET WK-MSG-ON TO TRUE                                   ACAT34RB
                MOVE 'UPDATE COMPLETED SUCESSFULLY'                     ACAT34RB
                  TO  SYSTEM-MSG                                        ACAT34RB
           END-IF.                                                      ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *---------------------------------------------------------------* ACAT34RB
      *           DELETE RESCIND/BLOCK ACCOUNT                        * ACAT34RB
      *---------------------------------------------------------------* ACAT34RB
      * THE PROGRAM DOES NOT PHYSICALLY DELETE RECORD FROM DATABASE   * ACAT34RB
      * INSTEAD IT MARKS 'D' FOR DELETION ON DB2 ACTION_CD FIELD.     * ACAT34RB
      *---------------------------------------------------------------* ACAT34RB
       5110-DELETE-RSND-ACCT.                                           ACAT34RB
           MOVE SPACE TO WS-ACCT-DELETED-SW.                            ACAT34RB
                                                                        ACAT34RB
           PERFORM 5800-CHECK-IF-ACCT-EXIST.                            ACAT34RB
           IF ACAT34-NOT-FOUND                                          ACAT34RB
              MOVE 'UPDATE FAILED - ACCT ALREADY DELETED BY OTHER USER' ACAT34RB
                   TO  WK-DB2-ERROR                                     ACAT34RB
              PERFORM 0600-SEND-DB2-ERROR-MSG                           ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           SET ACAT34-UPD-RSND-TO-DEL TO TRUE.                          ACAT34RB
           PERFORM 7600-LINK-TO-ACAT34DB.                               ACAT34RB
           IF ACAT34-ERROR                                              ACAT34RB
LRM002        MOVE                                                      ACAT34RB
LRM002       'DB2 UPD TO DELETE ERROR ON RESCIND TABLE - CALL HELP DESK'ACAT34RB
                TO  WK-DB2-ERROR                                        ACAT34RB
              PERFORM 0600-SEND-DB2-ERROR-MSG                           ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           SET WS-ACCT-DELETED TO TRUE.                                 ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *---------------------------------------------------------------* ACAT34RB
      *     MODIFY RESCIND/BLOCK ACCOUNT TABLE                        * ACAT34RB
      *---------------------------------------------------------------* ACAT34RB
       5120-MODIFY-RSND-ACCT.                                           ACAT34RB
           PERFORM 5800-CHECK-IF-ACCT-EXIST.                            ACAT34RB
           IF ACAT34-NOT-FOUND                                          ACAT34RB
              MOVE 'UPDATE FAILED - ACCT NOT FOUND IN DATABASE'         ACAT34RB
                TO  WK-DB2-ERROR                                        ACAT34RB
              PERFORM 0600-SEND-DB2-ERROR-MSG                           ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           SET ACAT34-UPD-RSND-TBL TO TRUE.                             ACAT34RB
           PERFORM 7600-LINK-TO-ACAT34DB.                               ACAT34RB
           IF ACAT34-ERROR                                              ACAT34RB
LRM002        MOVE 'DB2 UPDATE ERROR ON RESCIND TABLE - CALL HELP DESK' ACAT34RB
                TO  WK-DB2-ERROR                                        ACAT34RB
              PERFORM 0600-SEND-DB2-ERROR-MSG                           ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           MOVE TWA-MAP-EXPDT (SUB)  TO TWA-ORIG-EXPDT (SUB).           ACAT34RB
           MOVE TWA-MAP-CMNT1 (SUB)  TO TWA-ORIG-CMNT1 (SUB).           ACAT34RB
           MOVE TWA-MAP-CMNT2 (SUB)  TO TWA-ORIG-CMNT2 (SUB).           ACAT34RB
                                                                        ACAT34RB
           MOVE WSMMDDYY        TO UPDDATE-O (SUB) TWA-MAP-UPDDT (SUB). ACAT34RB
           MOVE ACAT-SIGN-ON-ID TO USER-O    (SUB) TWA-MAP-USER  (SUB). ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *---------------------------------------------------------------* ACAT34RB
      *      RESET MAP AFTER RESCIND ACCT IS DELETED                  * ACAT34RB
      *---------------------------------------------------------------* ACAT34RB
       5200-RESET-SCR-AFTER-DEL.                                        ACAT34RB
           PERFORM 2000-ATTRIB-TO-ASKIP.                                ACAT34RB
           PERFORM 2010-CLEAR-SCR.                                      ACAT34RB
                                                                        ACAT34RB
           PERFORM 0500-OPEN-RSND-ACCT-CSR.                             ACAT34RB
                                                                        ACAT34RB
           MOVE SPACE TO WS-NO-MORE-DATA-SW.                            ACAT34RB
           MOVE SPACE TO WS-KEY-FOUND-SW.                               ACAT34RB
           PERFORM  UNTIL WS-NO-MORE-DATA  OR  WS-KEY-FOUND             ACAT34RB
              PERFORM 0510-FETCH-RSND-ACCT-CSR                          ACAT34RB
              IF NOT WS-NO-MORE-DATA                                    ACAT34RB
                 MOVE ACAT34-BRANCH   TO WS-RSND-KEY-BR                 ACAT34RB
                 MOVE ACAT34-ACCT     TO WS-RSND-KEY-ACCT               ACAT34RB
                 MOVE ACAT34-BLCKCD   TO WS-RSND-KEY-BLCKCD             ACAT34RB
                 MOVE ACAT34-RCV-NUM  TO WS-RSND-KEY-CBRKR              ACAT34RB
                 MOVE ACAT34-ISIN-SEC TO WS-RSND-KEY-SEC                ACAT34RB
                 MOVE ZERO            TO WS-RSND-KEY-SEQ-NBR            ACAT34RB
                 IF WS-RSND-KEY >= TWA-MAP-KEY-1                        ACAT34RB
                    SET WS-KEY-FOUND TO TRUE                            ACAT34RB
                 END-IF                                                 ACAT34RB
              END-IF                                                    ACAT34RB
           END-PERFORM.                                                 ACAT34RB
                                                                        ACAT34RB
           IF WS-NO-MORE-DATA                                           ACAT34RB
              PERFORM 5210-CONTINUE-RESET-SCR                           ACAT34RB
           ELSE                                                         ACAT34RB
           IF WS-KEY-FOUND                                              ACAT34RB
              MOVE SPACES TO TWA-MAP-AREA TWA-MAP-SAVE-AREA             ACAT34RB
                             TWA-MAP-KEY-AREA                           ACAT34RB
              MOVE ZERO   TO TWA-SCR-LINE                               ACAT34RB
              PERFORM 2000-ATTRIB-TO-ASKIP                              ACAT34RB
              PERFORM 2010-CLEAR-SCR                                    ACAT34RB
              MOVE 0 TO SUB                                             ACAT34RB
              PERFORM UNTIL WS-NO-MORE-DATA OR SUB >= 2                 ACAT34RB
                 IF NOT WS-NO-MORE-DATA                                 ACAT34RB
                    ADD 1 TO SUB                                        ACAT34RB
                    PERFORM 0800-SETUP-SCREEN                           ACAT34RB
                 END-IF                                                 ACAT34RB
                 PERFORM 0510-FETCH-RSND-ACCT-CSR                       ACAT34RB
              END-PERFORM                                               ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           PERFORM 0520-CLOSE-RSND-ACCT-CSR.                            ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *---------------------------------------------------------------* ACAT34RB
      *   SET UP SCREEN FROM KEY CURSOR TABLE IN DESCENDING ORDER     * ACAT34RB
      *---------------------------------------------------------------* ACAT34RB
       5210-CONTINUE-RESET-SCR.                                         ACAT34RB
           PERFORM 0530-OPEN-RSND-ACCT-CSR-DESC.                        ACAT34RB
                                                                        ACAT34RB
           MOVE SPACE TO WS-NO-MORE-DATA-SW.                            ACAT34RB
           MOVE SPACE TO WS-KEY-FOUND-SW.                               ACAT34RB
           PERFORM  UNTIL WS-NO-MORE-DATA  OR  WS-KEY-FOUND             ACAT34RB
              PERFORM 0540-FETCH-RSND-ACCT-CSR-DESC                     ACAT34RB
              IF NOT WS-NO-MORE-DATA                                    ACAT34RB
                 MOVE ACAT34-BRANCH   TO WS-RSND-KEY-BR                 ACAT34RB
                 MOVE ACAT34-ACCT     TO WS-RSND-KEY-ACCT               ACAT34RB
                 MOVE ACAT34-BLCKCD   TO WS-RSND-KEY-BLCKCD             ACAT34RB
                 MOVE ACAT34-RCV-NUM  TO WS-RSND-KEY-CBRKR              ACAT34RB
                 MOVE ACAT34-ISIN-SEC TO WS-RSND-KEY-SEC                ACAT34RB
                 MOVE ZEROES          TO WS-RSND-KEY-SEQ-NBR            ACAT34RB
                 IF WS-RSND-KEY <= TWA-MAP-KEY-1                        ACAT34RB
                    SET WS-KEY-FOUND TO TRUE                            ACAT34RB
                 END-IF                                                 ACAT34RB
              END-IF                                                    ACAT34RB
           END-PERFORM.                                                 ACAT34RB
                                                                        ACAT34RB
           MOVE 3 TO SUB.                                               ACAT34RB
           IF WS-NO-MORE-DATA                                           ACAT34RB
              MOVE SPACES TO TWA-MAP-AREA TWA-MAP-SAVE-AREA             ACAT34RB
                             TWA-MAP-KEY-AREA TWA-MAP-SEARCH            ACAT34RB
                             TWA-PREV-MAP-SEARCH                        ACAT34RB
              MOVE -1 TO MNEXTL                                         ACAT34RB
              SET WK-MSG-ON TO TRUE                                     ACAT34RB
              MOVE 'NO RESCIND ACCOUNTS FOUND FOR THIS REQUEST'         ACAT34RB
                TO  SYSTEM-MSG                                          ACAT34RB
           ELSE                                                         ACAT34RB
              MOVE SPACES TO TWA-MAP-AREA TWA-MAP-SAVE-AREA             ACAT34RB
                             TWA-MAP-KEY-AREA                           ACAT34RB
              MOVE ZEROES TO TWA-SCR-LINE                               ACAT34RB
              PERFORM 2000-ATTRIB-TO-ASKIP                              ACAT34RB
              PERFORM 2010-CLEAR-SCR                                    ACAT34RB
              PERFORM UNTIL WS-NO-MORE-DATA OR SUB <= 1                 ACAT34RB
                 IF NOT WS-NO-MORE-DATA                                 ACAT34RB
                    SUBTRACT 1 FROM SUB                                 ACAT34RB
                    SET WS-SETUP-SCR-BKWARD TO TRUE                     ACAT34RB
                    PERFORM 0800-SETUP-SCREEN                           ACAT34RB
                 END-IF                                                 ACAT34RB
                 PERFORM 0540-FETCH-RSND-ACCT-CSR-DESC                  ACAT34RB
              END-PERFORM                                               ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           PERFORM 0550-CLOSE-RSND-ACCT-CSR-DESC.                       ACAT34RB
                                                                        ACAT34RB
           IF SUB = 2                                                   ACAT34RB
              PERFORM 0400-REFRESH-MAP                                  ACAT34RB
           END-IF.                                                      ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *---------------------------------------------------------------* ACAT34RB
      *    CREATE NEW RESCIND/BLOCK ACCOUNT FILE ROW                  * ACAT34RB
      *---------------------------------------------------------------* ACAT34RB
      *   IF DUPLICATE ACCT WITH 'D' IN ACTION_CD EXISTS, UPDATE THE  * ACAT34RB
      *   ROW WITH NEW DATA AND MOVE SPACE TO ACTION_CD.              * ACAT34RB
      *---------------------------------------------------------------* ACAT34RB
       5300-ADD-RTN.                                                    ACAT34RB
           IF  TWA-MAP-BR     (SUB) > SPACE                             ACAT34RB
           AND TWA-MAP-ACCT   (SUB) > SPACE                             ACAT34RB
           AND TWA-MAP-BLCKCD (SUB) > SPACE                             ACAT34RB
               CONTINUE                                                 ACAT34RB
           ELSE                                                         ACAT34RB
               GO TO 5300-EXIT                                          ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           PERFORM  5500-SET-ACAT34IO-PASSING-FLDS.                     ACAT34RB
                                                                        ACAT34RB
           PERFORM 5800-CHECK-IF-ACCT-EXIST.                            ACAT34RB
           IF ACAT34-NORMAL                                             ACAT34RB
              MOVE 'UPDATE FAILED - RESCIND ACCT ALREADY EXISTS'        ACAT34RB
                TO  WK-DB2-ERROR                                        ACAT34RB
              PERFORM 0600-SEND-DB2-ERROR-MSG                           ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           SET ACAT34-FND-ACTION-CD TO TRUE.                            ACAT34RB
           PERFORM 7600-LINK-TO-ACAT34DB.                               ACAT34RB
           IF ACAT34-NOT-FOUND                                          ACAT34RB
              SET ACAT34-INS-RSND-TBL TO TRUE                           ACAT34RB
              PERFORM 7600-LINK-TO-ACAT34DB                             ACAT34RB
              IF ACAT34-ERROR                                           ACAT34RB
LRM002           MOVE 'DB2 INSERT RESCIND TABLE ERROR - CALL HELP DESK' ACAT34RB
                   TO  WK-DB2-ERROR                                     ACAT34RB
                 PERFORM 0600-SEND-DB2-ERROR-MSG                        ACAT34RB
              END-IF                                                    ACAT34RB
           ELSE                                                         ACAT34RB
              SET ACAT34-UPD-DELETED-RSND TO TRUE                       ACAT34RB
              PERFORM 7600-LINK-TO-ACAT34DB                             ACAT34RB
              IF ACAT34-ERROR                                           ACAT34RB
LRM002           MOVE 'DB2 INSERT RESCIND TABLE ERROR - CALL HELP DESK' ACAT34RB
                   TO  WK-DB2-ERROR                                     ACAT34RB
                 PERFORM 0600-SEND-DB2-ERROR-MSG                        ACAT34RB
              END-IF                                                    ACAT34RB
           END-IF.                                                      ACAT34RB
       5300-EXIT.               EXIT.                                   ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *---------------------------------------------------------------* ACAT34RB
      *          SETUP ACAT34IO PARM PASSING FIELDS                   * ACAT34RB
      *---------------------------------------------------------------* ACAT34RB
       5500-SET-ACAT34IO-PASSING-FLDS.                                  ACAT34RB
           MOVE TWA-MAP-CMNT1 (SUB)  TO WS-COMMENT-1.                   ACAT34RB
           MOVE TWA-MAP-CMNT2 (SUB)  TO WS-COMMENT-2.                   ACAT34RB
                                                                        ACAT34RB
           IF TWA-MAP-EXPDT (SUB) = SPACE                               ACAT34RB
              MOVE '0001-01-01' TO WS-DB2-FORM-DATE                     ACAT34RB
           ELSE                                                         ACAT34RB
              MOVE TWA-MAP-EXPDT (SUB) TO WS-EXP-DATE                   ACAT34RB
              MOVE WS-EXP-MM           TO WS-DATE-MM                    ACAT34RB
              MOVE WS-EXP-DD           TO WS-DATE-DD                    ACAT34RB
              MOVE WS-EXP-YY           TO WS-DATE-YY                    ACAT34RB
              MOVE '20'                TO WS-DATE-CC                    ACAT34RB
              MOVE '-'                 TO WS-HYPHON1 WS-HYPHON2         ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           MOVE WK-CLT               TO ACAT34-PASS-CLT.                ACAT34RB
           MOVE TWA-MAP-BR     (SUB) TO ACAT34-PASS-BR.                 ACAT34RB
           MOVE TWA-MAP-ACCT   (SUB) TO ACAT34-PASS-ACCT.               ACAT34RB
           MOVE TWA-MAP-BLCKCD (SUB) TO ACAT34-PASS-BLCKCD.             ACAT34RB
           MOVE WS-COMMENT           TO ACAT34-PASS-CMNT.               ACAT34RB
           MOVE ACAT-ADP-BROKER      TO ACAT34-PASS-DLV-NUM.            ACAT34RB
           MOVE TWA-MAP-CBRKR  (SUB) TO ACAT34-PASS-RCV-NUM.            ACAT34RB
           MOVE TWA-MAP-SEC    (SUB) TO ACAT34-PASS-SEC.                ACAT34RB
           MOVE TWA-MAP-ADPSEC (SUB) TO ACAT34-PASS-ADP-NBR.            ACAT34RB
           MOVE WS-DB2-FORM-DATE     TO ACAT34-PASS-EXP-DATE.           ACAT34RB
           MOVE TWA-MAP-ACTION (SUB) TO ACAT34-PASS-ACT-CD.             ACAT34RB
           MOVE EIBTRMID             TO ACAT34-PASS-TERMID.             ACAT34RB
           MOVE ACAT-SIGN-ON-ID      TO ACAT34-PASS-SNON-ID.            ACAT34RB
           MOVE ACAT-SUPER-SIGN-ON-SEC-FLAG                             ACAT34RB
                                     TO ACAT34-PASS-SUPER-SNON-FLAG.    ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *---------------------------------------------------------------* ACAT34RB
      *         DOES DUPLICATE RESCIND ACCOUNT EXIST?                 * ACAT34RB
      *---------------------------------------------------------------* ACAT34RB
       5800-CHECK-IF-ACCT-EXIST.                                        ACAT34RB
           SET ACAT34-GET-RSND-TBL  TO TRUE.                            ACAT34RB
           PERFORM 7600-LINK-TO-ACAT34DB.                               ACAT34RB
           IF ACAT34-ERROR                                              ACAT34RB
LRM002        MOVE 'DB2 FIND ERROR ON RESCIND TABLE - CALL HELP DESK'   ACAT34RB
                TO  WK-DB2-ERROR                                        ACAT34RB
              PERFORM 0600-SEND-DB2-ERROR-MSG                           ACAT34RB
           END-IF.                                                      ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *---------------------------------------------------------------* ACAT34RB
      *         ANY OTHER RESCIND DUPLICATE ACCOUNT EXIST?            * ACAT34RB
      *---------------------------------------------------------------* ACAT34RB
       5810-FND-LEGAL-BLCKCD.                                           ACAT34RB
           SET  ACAT34-FND-LEGAL-BLCKCD  TO TRUE.                       ACAT34RB
           PERFORM 7600-LINK-TO-ACAT34DB.                               ACAT34RB
           IF ACAT34-ERROR                                              ACAT34RB
LRM002        MOVE 'DB2 FIND ERROR ON RESCIND TABLE - CALL HELP DESK'   ACAT34RB
                TO  WK-DB2-ERROR                                        ACAT34RB
              PERFORM 0600-SEND-DB2-ERROR-MSG                           ACAT34RB
           END-IF.                                                      ACAT34RB
      *                                                                 ACAT34RB
       5820-FND-RESCIND-BLCKCD.                                         ACAT34RB
           SET ACAT34-FND-RSND-BLCKCD  TO TRUE.                         ACAT34RB
           PERFORM 7600-LINK-TO-ACAT34DB.                               ACAT34RB
           IF ACAT34-ERROR                                              ACAT34RB
LRM002        MOVE 'DB2 FIND ERROR ON RESCIND TABLE - CALL HELP DESK'   ACAT34RB
                TO  WK-DB2-ERROR                                        ACAT34RB
              PERFORM 0600-SEND-DB2-ERROR-MSG                           ACAT34RB
           END-IF.                                                      ACAT34RB
      *                                                                 ACAT34RB
       5830-FND-SECURITY-BLCKCD.                                        ACAT34RB
           SET ACAT34-FND-SEC-BLCKCD TO TRUE.                           ACAT34RB
           PERFORM 7600-LINK-TO-ACAT34DB.                               ACAT34RB
           IF ACAT34-ERROR                                              ACAT34RB
LRM002        MOVE 'DB2 FIND ERROR ON RESCIND TABLE - CALL HELP DESK'   ACAT34RB
                TO  WK-DB2-ERROR                                        ACAT34RB
              PERFORM 0600-SEND-DB2-ERROR-MSG                           ACAT34RB
           END-IF.                                                      ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *---------------------------------------------------------------* ACAT34RB
      *          PF7:  PREVIOUSE PAGE                                 * ACAT34RB
      *---------------------------------------------------------------* ACAT34RB
       6000-PREV-PAGE-RTN.                                              ACAT34RB
           MOVE SPACE  TO WK-ERROR-SW                                   ACAT34RB
                          WK-MSG-ON-SW                                  ACAT34RB
                          SYSTEM-MSG.                                   ACAT34RB
                                                                        ACAT34RB
           IF TWA-ACTIVE-FILE-SCR                                       ACAT34RB
              IF TWA-UPDATE-ADD                                         ACAT34RB
                 SET WK-ERROR TO TRUE                                   ACAT34RB
                 MOVE LOW-VALUE TO ACAT34MO                             ACAT34RB
                 MOVE -1 TO MNEXTL                                      ACAT34RB
                 MOVE 'PF7 KEY CURRENTLY DISABLED'                      ACAT34RB
                   TO  SYSTEM-MSG                                       ACAT34RB
                 PERFORM 9000-ERROR-RTN                                 ACAT34RB
              END-IF.                                                   ACAT34RB
                                                                        ACAT34RB
           IF TWA-ACTIVE-FILE-SCR                                       ACAT34RB
              PERFORM 0530-OPEN-RSND-ACCT-CSR-DESC                      ACAT34RB
           ELSE                                                         ACAT34RB
           IF TWA-HISTORY-FILE-SCR                                      ACAT34RB
              PERFORM 0730-OPEN-RSND-HIST-CSR-DESC                      ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           MOVE SPACE TO WS-NO-MORE-DATA-SW.                            ACAT34RB
           MOVE SPACE TO WS-KEY-FOUND-SW.                               ACAT34RB
           PERFORM  UNTIL WS-NO-MORE-DATA  OR  WS-KEY-FOUND             ACAT34RB
              IF TWA-ACTIVE-FILE-SCR                                    ACAT34RB
                 PERFORM 0540-FETCH-RSND-ACCT-CSR-DESC                  ACAT34RB
              ELSE                                                      ACAT34RB
                 PERFORM 0740-FETCH-RSND-HIST-CSR-DESC                  ACAT34RB
              END-IF                                                    ACAT34RB
              IF NOT WS-NO-MORE-DATA                                    ACAT34RB
                 MOVE ACAT34-BRANCH       TO WS-RSND-KEY-BR             ACAT34RB
                 MOVE ACAT34-ACCT         TO WS-RSND-KEY-ACCT           ACAT34RB
                 MOVE ACAT34-BLCKCD       TO WS-RSND-KEY-BLCKCD         ACAT34RB
                 MOVE ACAT34-RCV-NUM      TO WS-RSND-KEY-CBRKR          ACAT34RB
                 MOVE ACAT34-ISIN-SEC     TO WS-RSND-KEY-SEC            ACAT34RB
                 MOVE ACAT34-HIST-SEQ-NBR TO WS-RSND-KEY-SEQ-NBR        ACAT34RB
                 IF WS-RSND-KEY < TWA-MAP-KEY-1                         ACAT34RB
                    SET WS-KEY-FOUND TO TRUE                            ACAT34RB
                 END-IF                                                 ACAT34RB
              END-IF                                                    ACAT34RB
           END-PERFORM.                                                 ACAT34RB
                                                                        ACAT34RB
           IF WS-NO-MORE-DATA                                           ACAT34RB
              IF TWA-ACTIVE-FILE-SCR                                    ACAT34RB
                 PERFORM 0550-CLOSE-RSND-ACCT-CSR-DESC                  ACAT34RB
              ELSE                                                      ACAT34RB
                 PERFORM 0750-CLOSE-RSND-HIST-CSR-DESC                  ACAT34RB
              END-IF                                                    ACAT34RB
              MOVE -1 TO MNEXTL                                         ACAT34RB
              SET WK-MSG-ON TO TRUE                                     ACAT34RB
              MOVE 'TOP PAGE' TO SYSTEM-MSG                             ACAT34RB
           ELSE                                                         ACAT34RB
              MOVE SPACES TO TWA-MAP-AREA TWA-MAP-SAVE-AREA             ACAT34RB
                             TWA-MAP-KEY-AREA                           ACAT34RB
              MOVE ZEROES TO TWA-SCR-LINE                               ACAT34RB
              PERFORM 2000-ATTRIB-TO-ASKIP                              ACAT34RB
              PERFORM 2010-CLEAR-SCR                                    ACAT34RB
                                                                        ACAT34RB
              MOVE 3 TO SUB                                             ACAT34RB
              PERFORM UNTIL WS-NO-MORE-DATA OR SUB <= 1                 ACAT34RB
                 IF NOT WS-NO-MORE-DATA                                 ACAT34RB
                    SUBTRACT 1 FROM SUB                                 ACAT34RB
                    SET WS-SETUP-SCR-BKWARD TO TRUE                     ACAT34RB
                    PERFORM 0800-SETUP-SCREEN                           ACAT34RB
                 END-IF                                                 ACAT34RB
                 IF TWA-ACTIVE-FILE-SCR                                 ACAT34RB
                    PERFORM 0540-FETCH-RSND-ACCT-CSR-DESC               ACAT34RB
                 ELSE                                                   ACAT34RB
                    PERFORM 0740-FETCH-RSND-HIST-CSR-DESC               ACAT34RB
                 END-IF                                                 ACAT34RB
              END-PERFORM                                               ACAT34RB
                                                                        ACAT34RB
              IF TWA-ACTIVE-FILE-SCR                                    ACAT34RB
                 PERFORM 0550-CLOSE-RSND-ACCT-CSR-DESC                  ACAT34RB
              ELSE                                                      ACAT34RB
                 PERFORM 0750-CLOSE-RSND-HIST-CSR-DESC                  ACAT34RB
              END-IF                                                    ACAT34RB
                                                                        ACAT34RB
              IF SUB > 1                                                ACAT34RB
                 PERFORM 0400-REFRESH-MAP                               ACAT34RB
              END-IF                                                    ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           MOVE -1 TO MNEXTL.                                           ACAT34RB
      *                                                                 ACAT34RB
      *---------------------------------------------------------------* ACAT34RB
      *           PF8:    NEXT PAGE                                   * ACAT34RB
      *---------------------------------------------------------------* ACAT34RB
       6100-NEXT-PAGE-RTN.                                              ACAT34RB
           MOVE SPACE  TO WK-ERROR-SW                                   ACAT34RB
                          WK-MSG-ON-SW                                  ACAT34RB
                          SYSTEM-MSG.                                   ACAT34RB
                                                                        ACAT34RB
           IF TWA-ACTIVE-FILE-SCR                                       ACAT34RB
              IF TWA-UPDATE-ADD                                         ACAT34RB
                 SET WK-ERROR TO TRUE                                   ACAT34RB
                 MOVE LOW-VALUE TO ACAT34MO                             ACAT34RB
                 MOVE -1 TO MNEXTL                                      ACAT34RB
                 MOVE 'PF8 KEY CURRENTLY DISABLED'                      ACAT34RB
                   TO  SYSTEM-MSG                                       ACAT34RB
                 PERFORM 9000-ERROR-RTN                                 ACAT34RB
              END-IF.                                                   ACAT34RB
                                                                        ACAT34RB
           IF TWA-ACTIVE-FILE-SCR                                       ACAT34RB
              PERFORM 0500-OPEN-RSND-ACCT-CSR                           ACAT34RB
           ELSE                                                         ACAT34RB
           IF TWA-HISTORY-FILE-SCR                                      ACAT34RB
              PERFORM 0700-OPEN-RSND-HIST-CSR                           ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
           MOVE SPACE TO WS-NO-MORE-DATA-SW.                            ACAT34RB
           MOVE SPACE TO WS-KEY-FOUND-SW.                               ACAT34RB
           PERFORM  UNTIL WS-NO-MORE-DATA  OR  WS-KEY-FOUND             ACAT34RB
              IF TWA-ACTIVE-FILE-SCR                                    ACAT34RB
                 PERFORM 0510-FETCH-RSND-ACCT-CSR                       ACAT34RB
              ELSE                                                      ACAT34RB
                 PERFORM 0710-FETCH-RSND-HIST-CSR                       ACAT34RB
              END-IF                                                    ACAT34RB
              IF NOT WS-NO-MORE-DATA                                    ACAT34RB
                 MOVE ACAT34-BRANCH       TO WS-RSND-KEY-BR             ACAT34RB
                 MOVE ACAT34-ACCT         TO WS-RSND-KEY-ACCT           ACAT34RB
                 MOVE ACAT34-BLCKCD       TO WS-RSND-KEY-BLCKCD         ACAT34RB
                 MOVE ACAT34-RCV-NUM      TO WS-RSND-KEY-CBRKR          ACAT34RB
                 MOVE ACAT34-ISIN-SEC     TO WS-RSND-KEY-SEC            ACAT34RB
                 MOVE ACAT34-HIST-SEQ-NBR TO WS-RSND-KEY-SEQ-NBR        ACAT34RB
                 IF WS-RSND-KEY > TWA-MAP-KEY-2                         ACAT34RB
                    SET WS-KEY-FOUND TO TRUE                            ACAT34RB
                 END-IF                                                 ACAT34RB
              END-IF                                                    ACAT34RB
           END-PERFORM.                                                 ACAT34RB
                                                                        ACAT34RB
           IF WS-NO-MORE-DATA                                           ACAT34RB
              MOVE -1 TO MNEXTL                                         ACAT34RB
              SET WK-MSG-ON TO TRUE                                     ACAT34RB
              MOVE 'BOTTOM PAGE' TO SYSTEM-MSG                          ACAT34RB
           ELSE                                                         ACAT34RB
           IF WS-KEY-FOUND                                              ACAT34RB
              MOVE SPACES TO TWA-MAP-AREA TWA-MAP-SAVE-AREA             ACAT34RB
                             TWA-MAP-KEY-AREA                           ACAT34RB
              MOVE ZERO   TO TWA-SCR-LINE                               ACAT34RB
              PERFORM 2000-ATTRIB-TO-ASKIP                              ACAT34RB
              PERFORM 2010-CLEAR-SCR                                    ACAT34RB
              MOVE 0 TO SUB                                             ACAT34RB
              PERFORM UNTIL WS-NO-MORE-DATA OR SUB >= 2                 ACAT34RB
                 IF NOT WS-NO-MORE-DATA                                 ACAT34RB
                    ADD 1 TO SUB                                        ACAT34RB
                    PERFORM 0800-SETUP-SCREEN                           ACAT34RB
                 END-IF                                                 ACAT34RB
                 IF TWA-ACTIVE-FILE-SCR                                 ACAT34RB
                    PERFORM 0510-FETCH-RSND-ACCT-CSR                    ACAT34RB
                 ELSE                                                   ACAT34RB
                    PERFORM 0710-FETCH-RSND-HIST-CSR                    ACAT34RB
                 END-IF                                                 ACAT34RB
              END-PERFORM                                               ACAT34RB
           END-IF.                                                      ACAT34RB
           IF TWA-ACTIVE-FILE-SCR                                       ACAT34RB
              PERFORM 0520-CLOSE-RSND-ACCT-CSR                          ACAT34RB
           ELSE                                                         ACAT34RB
           IF TWA-HISTORY-FILE-SCR                                      ACAT34RB
              PERFORM 0720-CLOSE-RSND-HIST-CSR                          ACAT34RB
           END-IF.                                                      ACAT34RB
           MOVE -1 TO MNEXTL.                                           ACAT34RB
       EJECT                                                            ACAT34RB
      *-------------------------------------------------------------*   ACAT34RB
      *           TS QUEUE FOR TWA AREA                             *   ACAT34RB
      *-------------------------------------------------------------*   ACAT34RB
       7000-READ-TSQ-RTN.                                               ACAT34RB
           MOVE EIBTRNID TO TRAN-ID.                                    ACAT34RB
           EXEC CICS READQ TS QUEUE(TSQ-NAME)                           ACAT34RB
                              INTO(TWA-AREA)                            ACAT34RB
                              LENGTH(LENGTH OF TWA-AREA)                ACAT34RB
                              ITEM(ITEM-NUM)                            ACAT34RB
           END-EXEC.                                                    ACAT34RB
           IF (EIBRESP NOT = +0)                                        ACAT34RB
           AND (NOT FIRST-TIME)                                         ACAT34RB
              SET  WK-ERROR  TO TRUE                                    ACAT34RB
              MOVE LOW-VALUE TO ACAT34MO                                ACAT34RB
              MOVE 'ACAT34RB READ TSQ ERROR'                            ACAT34RB
                TO SYSTEM-MSG                                           ACAT34RB
              PERFORM 9000-ERROR-RTN                                    ACAT34RB
           END-IF.                                                      ACAT34RB
                                                                        ACAT34RB
       7010-DELETE-TSQ-RTN.                                             ACAT34RB
           MOVE EIBTRNID TO TRAN-ID.                                    ACAT34RB
           EXEC CICS DELETEQ TS QUEUE(TSQ-NAME)                         ACAT34RB
           END-EXEC.                                                    ACAT34RB
                                                                        ACAT34RB
       7020-WRITE-TSQ-RTN.                                              ACAT34RB
           MOVE EIBTRNID TO TRAN-ID.                                    ACAT34RB
           EXEC CICS WRITEQ TS QUEUE(TSQ-NAME)                          ACAT34RB
                               FROM(TWA-AREA)                           ACAT34RB
                               LENGTH(LENGTH OF TWA-AREA)               ACAT34RB
                               ITEM(ITEM-NUM)                           ACAT34RB
           END-EXEC.                                                    ACAT34RB
           IF EIBRESP NOT = +0                                          ACAT34RB
              SET  WK-ERROR  TO TRUE                                    ACAT34RB
              MOVE LOW-VALUE TO ACAT34MO                                ACAT34RB
              MOVE 'ACAT34RB WRITE TSQ ERROR'                           ACAT34RB
                TO SYSTEM-MSG                                           ACAT34RB
           END-IF.                                                      ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *-------------------------------------------------------------*   ACAT34RB
      *               READ B1                                       *   ACAT34RB
      *-------------------------------------------------------------*   ACAT34RB
       7300-READ-B1-RTN.                                                ACAT34RB
           EXEC CICS READ                                               ACAT34RB
                     DATASET('B1PRINT')                                 ACAT34RB
                     INTO(B1-RECORD)                                    ACAT34RB
                     RIDFLD(B1-REC-ID)                                  ACAT34RB
                     LENGTH(LENGTH OF B1-RECORD)                        ACAT34RB
           END-EXEC.                                                    ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *-------------------------------------------------------------*   ACAT34RB
      *               XCTL TO OTHER PROGRAM                         *   ACAT34RB
      *-------------------------------------------------------------*   ACAT34RB
       7500-XCTL-TO-DETAIL-PROG.                                        ACAT34RB
           PERFORM 7510-SCREEN-SECURITY-CHECK.                          ACAT34RB
           EXEC CICS XCTL                                               ACAT34RB
                  PROGRAM(CALLED-PROGRAM-NAME)                          ACAT34RB
                  COMMAREA(ACATCOMM-COMMAREA)                           ACAT34RB
                  LENGTH(LENGTH OF ACATCOMM-COMMAREA)                   ACAT34RB
           END-EXEC.                                                    ACAT34RB
      *                                                                 ACAT34RB
       7510-SCREEN-SECURITY-CHECK.                                      ACAT34RB
           IF  ACAT-SUPER-SIGN-ON-UPDATE                                ACAT34RB
                OR                                                      ACAT34RB
               ACAT-SUPER-SIGN-ON-BROWSE                                ACAT34RB
                OR                                                      ACAT34RB
               ACAT-JUMP-ANYWHERE                                       ACAT34RB
                OR                                                      ACAT34RB
               ACAT-NEXT = '$'                                          ACAT34RB
                CONTINUE                                                ACAT34RB
           ELSE                                                         ACAT34RB
               MOVE ACAT-NEXT TO ACAT-SCREEN-IND                        ACAT34RB
               SET ACAT-UPDATE-MODE TO TRUE                             ACAT34RB
               MOVE SPACES    TO SECLINK-LIST                           ACAT34RB
               MOVE '2'       TO SECLINK-ACTION-CODE                    ACAT34RB
               MOVE 'SCON'    TO SECLINK-TYPE                           ACAT34RB
               MOVE ACAT-SEC-LIT TO SECLINK-ITEM                        ACAT34RB
               PERFORM 7520-CALL-SECLINK-RTN                            ACAT34RB
               IF SECLINK-RETURN-CODE = '00' OR '20'                    ACAT34RB
                  SET ACAT-SIGN-ON-UPDATE TO TRUE                       ACAT34RB
                  MOVE SECLINK-USER-ID TO ACAT-SIGN-ON-ID               ACAT34RB
               ELSE                                                     ACAT34RB
                  SET ACAT-BROWSE-MODE TO TRUE                          ACAT34RB
                  MOVE SPACES    TO SECLINK-LIST                        ACAT34RB
                  MOVE '2'       TO SECLINK-ACTION-CODE                 ACAT34RB
                  MOVE 'SCON'    TO SECLINK-TYPE                        ACAT34RB
                  MOVE ACAT-SEC-LIT TO SECLINK-ITEM                     ACAT34RB
                  PERFORM 7520-CALL-SECLINK-RTN                         ACAT34RB
                  IF SECLINK-RETURN-CODE = '00' OR '20'                 ACAT34RB
                     MOVE SPACE TO ACAT-SIGN-ON-SEC-FLAG                ACAT34RB
                  ELSE                                                  ACAT34RB
                     MOVE 'USER NOT AUTHORIZED TO USE NEXT SELECTION '  ACAT34RB
                          TO SYSTEM-MSG                                 ACAT34RB
                     MOVE ACAT-NEXT                                     ACAT34RB
                          TO SYSTEM-MSG(44 : 1)                         ACAT34RB
                     MOVE -1              TO MNEXTL                     ACAT34RB
                     MOVE ATT-UNPROT-BRT  TO MNEXTA                     ACAT34RB
                     SET WK-MSG-ON        TO TRUE                       ACAT34RB
                     MOVE 'ACAT34RB' TO ACAT-PROGRAM-NAME               ACAT34RB
                     MOVE '1'        TO ACAT-NEXT ACAT-INP-SEL          ACAT34RB
                     MOVE  SPACES    TO ACAT-CALLING-PROG-NAME          ACAT34RB
                     PERFORM 9000-ERROR-RTN                             ACAT34RB
                  END-IF                                                ACAT34RB
               END-IF                                                   ACAT34RB
           END-IF.                                                      ACAT34RB
      *                                                                 ACAT34RB
       7520-CALL-SECLINK-RTN.                                           ACAT34RB
           EXEC CICS LINK PROGRAM ('SECLINK')                           ACAT34RB
                COMMAREA(SECLINK-LIST)                                  ACAT34RB
                LENGTH(LENGTH OF SECLINK-LIST)                          ACAT34RB
           END-EXEC.                                                    ACAT34RB
                                                                        ACAT34RB
           EJECT                                                        ACAT34RB
      *                                                                 ACAT34RB
       7530-SIGNON-SECR-CHECK-RTN.                                      ACAT34RB
           SET SECURITY-LOOKUP TO TRUE.                                 ACAT34RB
           EXEC CICS LINK PROGRAM (WS-ACATSRCH)                         ACAT34RB
                COMMAREA(ACAT-SRCH-COMM-AREA)                           ACAT34RB
                LENGTH(LENGTH OF ACAT-SRCH-COMM-AREA)                   ACAT34RB
           END-EXEC.                                                    ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *-------------------------------------------------------------*   ACAT34RB
      *            CALL DB2 I/O MODULE ACAT34DB                     *   ACAT34RB
      *-------------------------------------------------------------*   ACAT34RB
       7600-LINK-TO-ACAT34DB.                                           ACAT34RB
           EXEC CICS LINK                                               ACAT34RB
                     PROGRAM('ACAT34DB')                                ACAT34RB
                     COMMAREA(ACAT34IO-COMMAREA)                        ACAT34RB
                     LENGTH(LENGTH OF ACAT34IO-COMMAREA)                ACAT34RB
           END-EXEC.                                                    ACAT34RB
      *                                                                 ACAT34RB
      *-------------------------------------------------------------*   ACAT34RB
      *     CALL NAME & ADDRESS I/O MODULE                          *   ACAT34RB
      *-------------------------------------------------------------*   ACAT34RB
       7610-LINK-TO-ACATNAIO-RTN.                                       ACAT34RB
           EXEC CICS LINK PROGRAM ('ACAT00NA')                          ACAT34RB
                COMMAREA(ACATNAIO-CALL-AREA)                            ACAT34RB
                LENGTH(LENGTH OF ACATNAIO-CALL-AREA)                    ACAT34RB
           END-EXEC.                                                    ACAT34RB
      *                                                                 ACAT34RB
      *-------------------------------------------------------------*   ACAT34RB
      *     CALL DB2 I/O MODULE - PARTICIPANT BROKER NAME SEARCH    *   ACAT34RB
      *-------------------------------------------------------------*   ACAT34RB
       7700-LINK-TO-ACATPPIO.                                           ACAT34RB
           EXEC CICS LINK PROGRAM ('ACATPPDB')                          ACAT34RB
                COMMAREA(ACATPPIO-CALL-AREA)                            ACAT34RB
                LENGTH(LENGTH OF ACATPPIO-CALL-AREA)                    ACAT34RB
           END-EXEC.                                                    ACAT34RB
      *                                                                 ACAT34RB
      *-------------------------------------------------------------*   ACAT34RB
      *       CALL NUMERIC EDIT MODULE                              *   ACAT34RB
      *-------------------------------------------------------------*   ACAT34RB
       7800-LINK-TO-EDITMOD.                                            ACAT34RB
           EXEC CICS LINK PROGRAM(WS-EDITMOD)                           ACAT34RB
                       COMMAREA(EDIT-QTY-AREA)                          ACAT34RB
                       LENGTH(LENGTH OF EDIT-QTY-AREA)                  ACAT34RB
           END-EXEC.                                                    ACAT34RB
      *                                                                 ACAT34RB
      *-------------------------------------------------------------*   ACAT34RB
      *       CALL ACAT MSD I/O MODULE                              *   ACAT34RB
      *-------------------------------------------------------------*   ACAT34RB
       7900-LINK-TO-ACATMSD.                                            ACAT34RB
           EXEC CICS LINK PROGRAM (WS-ACATMSD)                          ACAT34RB
                COMMAREA(ACATMSD-CALL-AREA)                             ACAT34RB
                LENGTH(LENGTH OF ACATMSD-CALL-AREA)                     ACAT34RB
           END-EXEC.                                                    ACAT34RB
       EJECT                                                            ACAT34RB
      *                                                                 ACAT34RB
      *-------------------------------------------------------------*   ACAT34RB
      *            SEND MAP ERASE FOR THE FIRST TIME                *   ACAT34RB
      *-------------------------------------------------------------*   ACAT34RB
       8000-SEND-MAP-ERASE.                                             ACAT34RB
           IF WK-ERROR OR WK-MSG-ON                                     ACAT34RB
              MOVE SYSTEM-MSG     TO TRLMSGO                            ACAT34RB
              MOVE ATT-ASKIP-BRT  TO TRLMSGA                            ACAT34RB
           ELSE                                                         ACAT34RB
              MOVE SPACE  TO TRLMSGO                                    ACAT34RB
           END-IF.                                                      ACAT34RB
           MOVE 'ACAX'    TO MTRANSO.                                   ACAT34RB
           MOVE WSTIME    TO MTIMEO.                                    ACAT34RB
           MOVE WSMMDDYY  TO MDATEO.                                    ACAT34RB
           MOVE WK-CLT    TO MCLINBO.                                   ACAT34RB
           EXEC CICS SEND MAP('HDRMAP')                                 ACAT34RB
                     MAPSET('ACAT00M')                                  ACAT34RB
                     FROM(HDRMAPO)                                      ACAT34RB
                     ACCUM                                              ACAT34RB
                     CURSOR                                             ACAT34RB
                     ERASE                                              ACAT34RB
           END-EXEC.                                                    ACAT34RB
           EXEC CICS SEND MAP('ACAT34M')                                ACAT34RB
                     MAPSET('ACAT34M')                                  ACAT34RB
                     FROM(ACAT34MO)                                     ACAT34RB
                     ACCUM                                              ACAT34RB
                     CURSOR                                             ACAT34RB
           END-EXEC.                                                    ACAT34RB
           EXEC CICS SEND MAP('TRLMAP')                                 ACAT34RB
                     MAPSET('ACAT00M')                                  ACAT34RB
                     FROM(TRLMAPO)                                      ACAT34RB
                     ACCUM                                              ACAT34RB
                     CURSOR                                             ACAT34RB
           END-EXEC.                                                    ACAT34RB
           EXEC CICS SEND PAGE                                          ACAT34RB
           END-EXEC.                                                    ACAT34RB
                                                                        ACAT34RB
       EJECT                                                            ACAT34RB
                                                                        ACAT34RB
       8100-SEND-MAP-DATA-ONLY.                                         ACAT34RB
           IF WK-ERROR OR WK-MSG-ON                                     ACAT34RB
              MOVE SYSTEM-MSG     TO TRLMSGO                            ACAT34RB
              MOVE ATT-ASKIP-BRT  TO TRLMSGA                            ACAT34RB
           ELSE                                                         ACAT34RB
              MOVE SPACE  TO TRLMSGO                                    ACAT34RB
           END-IF.                                                      ACAT34RB
      *                                                                 ACAT34RB
           MOVE 'ACAX'    TO MTRANSO.                                   ACAT34RB
           MOVE WSTIME    TO MTIMEO.                                    ACAT34RB
           MOVE WSMMDDYY  TO MDATEO.                                    ACAT34RB
           MOVE WK-CLT    TO MCLINBO.                                   ACAT34RB
      *    IF FIRST-TIME                                                ACAT34RB
      *    AND (WK-CURSOR NOT = 0)                                      ACAT34RB
              EXEC CICS SEND MAP('HDRMAP')                              ACAT34RB
                        MAPSET('ACAT00M')                               ACAT34RB
                        FROM(HDRMAPO)                                   ACAT34RB
                        CURSOR                                          ACAT34RB
                        DATAONLY                                        ACAT34RB
                        ACCUM                                           ACAT34RB
               END-EXEC                                                 ACAT34RB
               EXEC CICS SEND MAP('ACAT34M')                            ACAT34RB
                         MAPSET('ACAT34M')                              ACAT34RB
                         FROM(ACAT34MO)                                 ACAT34RB
                         CURSOR                                         ACAT34RB
                         DATAONLY                                       ACAT34RB
                         ACCUM                                          ACAT34RB
               END-EXEC                                                 ACAT34RB
               EXEC CICS SEND MAP('TRLMAP')                             ACAT34RB
                         MAPSET('ACAT00M')                              ACAT34RB
                         FROM(TRLMAPO)                                  ACAT34RB
                         CURSOR                                         ACAT34RB
                         DATAONLY                                       ACAT34RB
                         ACCUM                                          ACAT34RB
               END-EXEC                                                 ACAT34RB
               EXEC CICS SEND PAGE                                      ACAT34RB
               END-EXEC.                                                ACAT34RB
       EJECT                                                            ACAT34RB
                                                                        ACAT34RB
       8500-RECEIVE-MAP.                                                ACAT34RB
           EXEC CICS RECEIVE MAP('HDRMAP')                              ACAT34RB
                             MAPSET('ACAT00M')                          ACAT34RB
                             FROM(ACAT-RECEIVE-MAP)                     ACAT34RB
                             LENGTH(ACAT-RECEIVE-MAP-LENGTH)            ACAT34RB
           END-EXEC.                                                    ACAT34RB
           EXEC CICS RECEIVE MAP('ACAT34M')                             ACAT34RB
                             MAPSET('ACAT34M')                          ACAT34RB
                             FROM(ACAT-RECEIVE-MAP)                     ACAT34RB
                             INTO(ACAT34MI)                             ACAT34RB
                             LENGTH(ACAT-RECEIVE-MAP-LENGTH)            ACAT34RB
           END-EXEC.                                                    ACAT34RB
           EXEC CICS RECEIVE MAP('TRLMAP')                              ACAT34RB
                             MAPSET('ACAT00M')                          ACAT34RB
                             FROM(ACAT-RECEIVE-MAP)                     ACAT34RB
                             INTO(TRLMAPI)                              ACAT34RB
                             LENGTH(ACAT-RECEIVE-MAP-LENGTH)            ACAT34RB
           END-EXEC.                                                    ACAT34RB
                                                                        ACAT34RB
           EJECT                                                        ACAT34RB
                                                                        ACAT34RB
       8700-RETURN-CONTROL-RTN.                                         ACAT34RB
           EXEC CICS SEND CONTROL                                       ACAT34RB
                            ERASE                                       ACAT34RB
                           FREEKB                                       ACAT34RB
           END-EXEC.                                                    ACAT34RB
           EXEC CICS XCTL PROGRAM ('RATT01')                            ACAT34RB
           END-EXEC.                                                    ACAT34RB
           EXEC CICS RETURN                                             ACAT34RB
           END-EXEC.                                                    ACAT34RB
                                                                        ACAT34RB
           EJECT                                                        ACAT34RB
                                                                        ACAT34RB
       8800-RETURN-TO-CICS.                                             ACAT34RB
           EXEC CICS RETURN                                             ACAT34RB
                     TRANSID('ACAX')                                    ACAT34RB
                     COMMAREA(ACATCOMM-COMMAREA)                        ACAT34RB
           END-EXEC.                                                    ACAT34RB
       EJECT                                                            ACAT34RB
       9000-ERROR-RTN.                                                  ACAT34RB
           MOVE WSTIME         TO  MTIMEO.                              ACAT34RB
           MOVE WSMMDDYY       TO  MDATEO.                              ACAT34RB
           MOVE SYSTEM-MSG     TO  TRLMSGO.                             ACAT34RB
           MOVE ATT-ASKIP-BRT  TO  TRLMSGA.                             ACAT34RB
           PERFORM 7020-WRITE-TSQ-RTN.                                  ACAT34RB
           PERFORM 8100-SEND-MAP-DATA-ONLY.                             ACAT34RB
           PERFORM 8800-RETURN-TO-CICS.                                 ACAT34RB
                                                                        ACAT34RB
       HANG-CICS.                                                       ACAT34RB
           GOBACK.                                                      ACAT34RB
