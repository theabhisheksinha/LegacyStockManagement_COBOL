000001* PDX    - ACAT14RC C0360817 12/17/14 11:37:06 TBLAMUR            00001000
000001* LRM007 - SSR 99150 CONTRA CUSIP SUBMIT WARNING                          
000001* PDX    - ACAT14RC C0346519 12/10/13 16:41:57 TBLAMUR            00001000
000001* LRM006 - SSR 96477 INCLUDE BANK DEPOSIT MONEY IN DLVY EDIT,             
000001* LRM006 -   ADD TO CMBL-MM-FUND-YEST.                                    
000001* PDX    - ACAT14RC C0318727 01/11/12 13:32:21 TBLAMUR            00001000
000001* PDX    - ACAT14RC C0275063 01/09/09 12:57:55 TBLAMUR            00001000
000001* LRM005 - SSR 60245 RECOGNIZE WITHHELD ASSETS                            
000001* PDX    - ACAT14RC C0270299 09/15/08 16:30:05 TBLAMUR            00001000
000001* LRM SSRS 55766 55717 RECOMPILE ONLY FOR COPYS ACATCOM,90TS,JUMP.        
000001* PDX    - ACAT14RC C0250441 06/25/07 14:09:12 TBLAMUR            00001000
000001* LRM004 - SSR 53075 SPIN-OFF CHANGES                                     
000001* PDX    - ACAT14RC C0233602 04/10/06 14:15:13 TBLAMUR            00001000
000001* LRM003 SSR 40661 RETAIN USER ID OF INITIATOR.                           
000001* PDX    - ACAT14RC C0182233 02/14/03 11:51:38 TBLAMUR            00001000
      * LRM002 0029711 MARGIN RETOOL CALL CUSHOLIO AND CUSBALIO                 
000001* PDX    - ACAT14RC C0179784 09/26/02 14:34:15 TBEDTAK            00001000
000001* PDX    - ACAT14RC C0160324 06/25/01 08:32:20 TBLAMUR            00001000
000001* PDX    - ACAT14RC C0149052 10/24/00 13:03:04 TBLAMUR            00001000
000001* PDX    - ACAT14RC C0142755 08/28/00 10:56:46 TBDOJUN            00001000
000001* PDX    - ACAT14RC C0123136 03/24/99 16:52:54 TBEDTAK            ACAT14RC
000001* PDX    - ACAT14RC C0122848 03/09/99 10:24:43 TBEDTAK            ACAT14RC
000001* PDX    - ACAT14RC C0122627 03/03/99 15:54:28 TBEDTAK            ACAT14RC
000001* PDX    - ACAT14RC C0122453 03/01/99 11:26:43 TBLAMUR            ACAT14RC
000001* PDX    - ACAT14RC C0120330 01/31/99 16:26:48 TBCHLUO            ACAT14RC
000001* PDX    - ACAT14RC C0119329 12/31/98 11:22:26 TBEDTAK            ACAT14RC
000001* PDX    - ACAT14RC C0117817 12/08/98 12:19:26 TBEDTAK            ACAT14RC
000001* PDX    - ACAT14RC C0109165 10/27/98 17:13:53 TBEDTAK            ACAT14RC
       IDENTIFICATION DIVISION.                                         ACAT14RC
       PROGRAM-ID.    ACAT14RC.                                         ACAT14RC
       AUTHOR.  E.TAKAESU.                                              ACAT14RC
      *REMARKS.                                                         ACAT14RC
      ***************************************************************** ACAT14RC
      *              ACAT DELIVERER RESIDUAL CREDITS                  * ACAT14RC
      ***************************************************************** ACAT14RC
      *  THE OVERNIGHT BATCH SYSTEM PRODUCES ALL THE AVAILABLE        * ACAT14RC
      *  RESICUAL CREDIT BALANCES BASED ON PREVIOUS FULL TRANSFERS    * ACAT14RC
      *  FOR AN ACCOUNT DELIVERED OFF.  EACH NIGHT THE SYSTEM WILL    * ACAT14RC
      *  INSERT THESE CREDITS ON THE INIT-TRNFR AND INIT-ASSET TABLES * ACAT14RC
      *  WITH THE NSCC_PEND_IND SET TO SPACE FOR AUTO-SUBMIT OR 'H'   * ACAT14RC
      *  FOR HOLD (TO BE SUBMITTED BY USER).                          * ACAT14RC
      *     -  THE PURPOSE OF THE PROGRAM IS TO HAVE USER CHANGE      * ACAT14RC
      *        THE NSCC_PEND_IND 'H' STATUS TO SPACE FOR AUTO-SUBMIT  * ACAT14RC
      *        IF IT IS IN 'H' STATUS, OR CHANGE TO SPACE TO 'H'      * ACAT14RC
      *        STATUS FOR HOLD IF IT IS IN AUTO-SUBMIT STATUS.        * ACAT14RC
      *     -  THE PROGRAM DISPLAYS INITIAL TRANSFER WHERE            * ACAT14RC
      *        TRNFR_TYPE_CD = 'RCR'.                                 * ACAT14RC
      *     -  USER MUST ENTER REASON CODE PRIOR TO RELEASE(SUBMIT)   * ACAT14RC
      *        THE RESIDUAL CREDITS.                                  * ACAT14RC
      *     -  USER CAN TYPE "?" AT REASON CODE FIELD TO GET A        * ACAT14RC
      *        POP-UP REASON CODE SCREEN.                             * ACAT14RC
      *     -  THE PROGRAM ALSO HANDLES TO VIEW THE DETAILS OF PENDING* ACAT14RC
      *        RCR TRANSFER THRU "ACAT21PT" (PENDING INQUIRY) WHICH   * ACAT14RC
      *        TRANSFERS A PROGRAM CONTROL TO THIS PROGRAM.           * ACAT14RC
      ***************************************************************** ACAT14RC
DJ0001* 08/28/00 DJ0001 SSR# R52580 PERMIT USER TO WITHHOLD OR MODIFY   ACAT14RC
DJ0001*                 AN ASSET PRIOR TO SUBMISSION.  CONTINUE TO      ACAT14RC
DJ0001*                 VALIDATE THE ASSET AMOUNTS VERSUS MRGN.         ACAT14RC
DJ0001*                 UNPROTECT MBAL01, MBAL02, MBAL05, MQTY.         ACAT14RC
      ***************************************************************** ACAT14RC
       ENVIRONMENT DIVISION.                                            ACAT14RC
       DATA DIVISION.                                                   ACAT14RC
       WORKING-STORAGE SECTION.                                         ACAT14RC
       COPY PDXIDCOB.                                                   ACAT14RC
       77  TWA-SIZE                       PIC S9(4) COMP.               ACAT14RC
                                                                        ACAT14RC
       01  TSQ-WORK-AREA.                                               ACAT14RC
           05  TWA-TSQ.                                                 ACAT14RC
               09  TSQ-NAME.                                            ACAT14RC
                   11 TERM-ID             PIC X(04).                    ACAT14RC
                   11 TRAN-ID             PIC X(04).                    ACAT14RC
               09  ITEM-NUM               PIC S9(04) COMP VALUE +1.     ACAT14RC
           05  ASSET-TSQ.                                               ACAT14RC
               09  ASSET-TSQ-NAME.                                      ACAT14RC
                   11 ASSET-TERM          PIC X(04).                    ACAT14RC
                   11 FILLER              PIC X(04) VALUE '14AS'.       ACAT14RC
               09  ASSET-ITEM             PIC S9(04) COMP.              ACAT14RC
                                                                        ACAT14RC
       01  WS-DATE-AREA.                                                ACAT14RC
           05  WSABSTIME           PIC S9(08) COMP.                     ACAT14RC
           05  WSMMDDYY.                                                ACAT14RC
               09 WS-CUR-MM        PIC XX.                              ACAT14RC
               09  FILLER          PIC X.                               ACAT14RC
               09 WS-CUR-DD        PIC XX.                              ACAT14RC
               09  FILLER          PIC X.                               ACAT14RC
               09 WS-CUR-YY        PIC XX.                              ACAT14RC
           05  WSDATESEP           PIC X(01) VALUE '/'.                 ACAT14RC
           05  WSTIME.                                                  ACAT14RC
               09  WS-TIME-HH      PIC XX.                              ACAT14RC
               09  FILLER          PIC X.                               ACAT14RC
               09  WS-TIME-MM      PIC XX.                              ACAT14RC
               09  FILLER          PIC X.                               ACAT14RC
               09  WS-TIME-SS      PIC XX.                              ACAT14RC
           05  WSTIMESEP           PIC X(01) VALUE ':'.                 ACAT14RC
                                                                        ACAT14RC
      *--------------------------------------------------------------*  ACAT14RC
      *      ACATEDIT WORK AREA                                         ACAT14RC
      *--------------------------------------------------------------*  ACAT14RC
       01  EDIT-AMT-AREA.                                               ACAT14RC
           05  WS-AMT-CODE                PIC X(01) VALUE 'D'.          ACAT14RC
           05  WS-AMT-NUM-ITEM            PIC S9(03) COMP-3 VALUE +1.   ACAT14RC
           05  WS-AMT-IN-LEN              PIC S9(03) COMP-3 VALUE +19.  ACAT14RC
           05  WS-AMT-OUT-LEN             PIC S9(03) COMP-3 VALUE +17.  ACAT14RC
           05  WS-AMT-IN                  PIC X(19) VALUE LOW-VALUE.    ACAT14RC
           05  WS-AMT-OUT                 PIC S9(15)V99.                ACAT14RC
           05  WS-AMT-DECIMAL-LEN         PIC S9(03) COMP-3 VALUE +2.   ACAT14RC
           05  WS-AMT-COMMAR              PIC X(01) VALUE 'Y'.          ACAT14RC
           05  WS-AMT-RET-CODE            PIC X(01) VALUE SPACE.        ACAT14RC
           05  FILLER                     PIC X(01) VALUE HIGH-VALUE.   ACAT14RC
                                                                        ACAT14RC
       01  WS-FORMATTED-AMT.                                            ACAT14RC
           05  WS-AMT-DISPLAY             PIC ZZZ,ZZZ,ZZZ,ZZZ.99-.      ACAT14RC
           05  WS-AMT-UNSIGN              PIC  9(15)V9(2) COMP-3.       ACAT14RC
                                                                        ACAT14RC
       01  EDIT-QTY-AREA.                                               ACAT14RC
           05  WS-QTY-CODE                PIC X(01) VALUE 'D'.          ACAT14RC
           05  WS-QTY-NUM-ITEM            PIC S9(03) COMP-3 VALUE +1.   ACAT14RC
           05  WS-QTY-IN-LEN              PIC S9(03) COMP-3 VALUE +22.  ACAT14RC
           05  WS-QTY-OUT-LEN             PIC S9(03) COMP-3 VALUE +21.  ACAT14RC
           05  WS-QTY-IN                  PIC X(22) VALUE LOW-VALUE.    ACAT14RC
           05  WS-QTY-OUT.                                              ACAT14RC
               07  FILLER                 PIC X(04).                    ACAT14RC
               07  WS-QTY-OUT-D4          PIC S9(13)V9999.              ACAT14RC
           05  WS-QTY-DECIMAL-LEN         PIC S9(03) COMP-3 VALUE +4.   ACAT14RC
           05  WS-QTY-COMMAR              PIC X(01) VALUE 'Y'.          ACAT14RC
           05  WS-QTY-RET-CODE            PIC X(01) VALUE SPACE.        ACAT14RC
           05  FILLER                     PIC X(01) VALUE HIGH-VALUE.   ACAT14RC
                                                                        ACAT14RC
       01  WS-FORMATTED-QTY.                                            ACAT14RC
           05  WS-QTY-DISPLAY             PIC ZZZZ,ZZZ,ZZZ,ZZZ.9999-.   ACAT14RC
           05  WS-QTY-UNSIGN              PIC  9(13)V9(4) COMP-3.       ACAT14RC
       EJECT                                                            ACAT14RC
       01  WS-SWITCH-AREA.                                              ACAT14RC
           05  WS-ERROR-SW                PIC X(01) VALUE SPACE.        ACAT14RC
               88  WS-ERROR                         VALUE 'Y'.          ACAT14RC
           05  WS-MSG-ON-SW               PIC X(01) VALUE SPACE.        ACAT14RC
               88  WS-MSG-ON                        VALUE 'Y'.          ACAT14RC
           05  WS-NO-MORE-DATA-SW         PIC X(01) VALUE SPACE.        ACAT14RC
               88  WS-NO-MORE-DATA                     VALUE 'N'.       ACAT14RC
           05  WS-SEARCH-CHANGED-SW       PIC X(01) VALUE SPACE.        ACAT14RC
               88  WS-SEARCH-CHANGED                VALUE 'Y'.          ACAT14RC
           05  WS-VALID-QTY-SW            PIC X(01).                    ACAT14RC
               88  WS-VALID-QTY                     VALUE 'Y'.          ACAT14RC
           05  WS-UPDATE-SW               PIC X(01) VALUE SPACE.        ACAT14RC
               88  WS-UPDATE-OK                     VALUE 'Y'.          ACAT14RC
       01  ACAT-WORK-AREA.                                              ACAT14RC
           05  WS-SS-NUM.                                               ACAT14RC
               09  WS-SS-NUM1             PIC X(03).                    ACAT14RC
               09  FILLER                 PIC X(01) VALUE '-'.          ACAT14RC
               09  WS-SS-NUM2             PIC X(02).                    ACAT14RC
               09  FILLER                 PIC X(01) VALUE '-'.          ACAT14RC
               09  WS-SS-NUM3             PIC X(04).                    ACAT14RC
           05  WS-DLVR-ACCT.                                            ACAT14RC
               09  WS-BRANCH              PIC X(03).                    ACAT14RC
               09  WS-ACCT                PIC X(05).                    ACAT14RC
           05  WS-RESP                    PIC S9(8) COMP.               ACAT14RC
           05  WS-REASON.                                               ACAT14RC
               09  WS-REASON1             PIC X(01).                    ACAT14RC
               09  WS-REASON2             PIC X(01).                    ACAT14RC
           05  WS-DESC.                                                 ACAT14RC
               09  WS-DESC1               PIC X(60).                    ACAT14RC
               09  WS-DESC2               PIC X(60).                    ACAT14RC
           05  CURRENCY-NUM               PIC 9(03).                    ACAT14RC
           05  CURRENCY-X REDEFINES CURRENCY-NUM                        ACAT14RC
                                          PIC X(03).                    ACAT14RC
           05  WORK-AUTH-BRANCH           PIC X(03).                    ACAT14RC
           05  WORK-AUTH-AE               PIC X(03).                    ACAT14RC
           05  CALLED-PROGRAM-NAME        PIC X(08).                    ACAT14RC
           05  WORK-QTY-X                 PIC X(20).                    ACAT14RC
           05  FILLER REDEFINES WORK-QTY-X.                             ACAT14RC
               09 WORK-QTY                PIC 9(12)V9(05).              ACAT14RC
               09 FILLER                  PIC X(03).                    ACAT14RC
           05  WORK-DATE-X.                                             ACAT14RC
               09 WORK-DATE-X-MM          PIC X(02).                    ACAT14RC
               09 FILLER                  PIC X(01).                    ACAT14RC
               09 WORK-DATE-X-YY          PIC X(02).                    ACAT14RC
           05  WORK-DATE.                                               ACAT14RC
               09 WORK-DATE-MM            PIC X(02).                    ACAT14RC
               09 WORK-DATE-YY            PIC X(02).                    ACAT14RC
           05  TWA-CLIENT-NO-X.                                         ACAT14RC
               09 TWA-CLIENT-NO-9         PIC 9(03).                    ACAT14RC
           05  WS-CLT.                                                  ACAT14RC
               09 FILLER                  PIC X(01) VALUE '0'.          ACAT14RC
               09 WS-CLT-NBR              PIC X(03).                    ACAT14RC
           05  WS-BRW-KEY.                                              ACAT14RC
               09 WS-BRW-CLIENT           PIC X(03).                    ACAT14RC
               09 WS-BRW-RECORD-TYPE      PIC X(02)   VALUE '90'.       ACAT14RC
               09 WS-BRW-CUR-BR-AC.                                     ACAT14RC
                  15 WS-BRW-CURRENCY      PIC X(03).                    ACAT14RC
                  15 WS-BRW-BRANCH        PIC X(03).                    ACAT14RC
                  15 WS-BRW-ACCOUNT       PIC X(05).                    ACAT14RC
           05  WS-TFR-KEY.                                              ACAT14RC
               09  WS-KEY-CLT             PIC X(04).                    ACAT14RC
               09  WS-KEY-DLVR-NBR        PIC X(04).                    ACAT14RC
               09  WS-KEY-DLVR-ACCT       PIC X(20).                    ACAT14RC
               09  WS-KEY-RCV-NBR         PIC X(04).                    ACAT14RC
               09  WS-KEY-RCV-ACCT        PIC X(20).                    ACAT14RC
           05  WS-LOOP-CNT                PIC S9(07) COMP-3.            ACAT14RC
           05  TFR-WITH-ASSET-CNT         PIC S9(07) COMP-3.            ACAT14RC
           05  WS-SUSPEND-COUNT           PIC S9(04) COMP VALUE ZERO.   ACAT14RC
           05  WS-BROWSE-FORWARD-FLAG     PIC X(01) VALUE 'Y'.          ACAT14RC
               88  WS-BROWSE-FORWARD      VALUE 'Y'.                    ACAT14RC
               88  WS-BROWSE-BACKWARD     VALUE 'N'.                    ACAT14RC
           05  ALARM-NEEDED-FLAG          PIC X(01)  VALUE 'N'.         ACAT14RC
               88  ALARM-NEEDED           VALUE  'Y'.                   ACAT14RC
           05  END-OF-DATA-FLAG           PIC X(01)  VALUE 'N'.         ACAT14RC
               88  END-OF-DATA            VALUE  'Y'.                   ACAT14RC
           05  INPUT-ERROR-FLAG           PIC X(01)  VALUE 'N'.         ACAT14RC
               88  INPUT-ERROR            VALUE  'Y'.                   ACAT14RC
           05  FIRST-TIME-FLAG            PIC X(01)  VALUE 'N'.         ACAT14RC
               88  FIRST-TIME             VALUE  'Y'.                   ACAT14RC
           05  WS-DELETE-FLAG             PIC X(01)  VALUE 'N'.         ACAT14RC
               88  WS-DELETE              VALUE 'Y'.                    ACAT14RC
           05  WS-ERROR-THIS-LINE-FLAG    PIC X(01)  VALUE 'N'.         ACAT14RC
               88  ERROR-THIS-LINE        VALUE  'Y'.                   ACAT14RC
           05  WS-TS-READ-FLAG            PIC X(01).                    ACAT14RC
               88 WS-TS-READ-OK           VALUE 'Y'.                    ACAT14RC
               88 WS-TS-READ-ERROR        VALUE 'N'.                    ACAT14RC
           05  WS-SCROLL-KEY-FOUND-SW     PIC X(01).                    ACAT14RC
               88  WS-SCROLL-KEY-FOUND              VALUE 'Y'.          ACAT14RC
           05  WS-TFR-NOT-FOUND-SW        PIC X(01).                    ACAT14RC
               88  WS-TFR-NOT-FOUND                 VALUE 'N'.          ACAT14RC
           05  WS-ASSET-INIT-FOUND-SW     PIC X(01).                    ACAT14RC
               88  WS-ASSET-INIT-FOUND              VALUE 'Y'.          ACAT14RC
           05  WS-SUBMIT-NOT-ALLOWED-SW   PIC X(01).                    ACAT14RC
               88  WS-SUBMIT-NOT-ALLOWED            VALUE 'N'.          ACAT14RC
           05  WS-ASSET-POSITION-FOUND-SW PIC X(01).                    ACAT14RC
               88  WS-ASSET-POSITION-FOUND          VALUE 'Y'.          ACAT14RC
           05  WS-VALID-REASON-FLAG       PIC X(02).                    ACAT14RC
               88  VALID-REASON-CODE          VALUE '01' THRU '13'.     ACAT14RC
           05  ERASE-KEY-VALUE            PIC S9(04) COMP VALUE +128.   ACAT14RC
           05  FILLER REDEFINES ERASE-KEY-VALUE.                        ACAT14RC
               09  FILLER                 PIC X(01).                    ACAT14RC
               09  ERASE-KEY              PIC X(01).                    ACAT14RC
           05  REFORMAT-TIME              PIC 9(07).                    ACAT14RC
           05  FILLER REDEFINES REFORMAT-TIME.                          ACAT14RC
               09  FILLER                 PIC X(01).                    ACAT14RC
               09  REFORMAT-HH            PIC X(02).                    ACAT14RC
               09  REFORMAT-MM            PIC X(02).                    ACAT14RC
               09  FILLER                 PIC X(02).                    ACAT14RC
           05  WORK-TIME.                                               ACAT14RC
               09  WORK-HH                PIC X(02).                    ACAT14RC
               09  FILLER                 PIC X(01) VALUE ':'.          ACAT14RC
               09  WORK-MM                PIC X(02).                    ACAT14RC
           05  INPUT-OPT-SPACE-FLAG       PIC X(01)  VALUE 'N'.         ACAT14RC
               88  INPUT-OPT-SPACE        VALUE  'Y'.                   ACAT14RC
           05  DATA-ONLY-FLAG             PIC X(01)  VALUE 'N'.         ACAT14RC
               88  DATA-ONLY              VALUE  'Y'.                   ACAT14RC
           05  WS-CURSOR                  PIC S9(04) COMP.              ACAT14RC
           05  SYSTEM-MSG                 PIC X(79) VALUE SPACES.       ACAT14RC
           05  WS-DB2-ERROR-MSG.                                        ACAT14RC
               09  WS-DB2-ERROR           PIC X(60).                    ACAT14RC
               09  FILLER                 PIC X(13) VALUE               ACAT14RC
                   ' => SQLCODE: '.                                     ACAT14RC
               09  WS-ERR-SQLCODE         PIC -999.                     ACAT14RC
           05  ABEND-LINE.                                              ACAT14RC
               09  ABEND-MSG              PIC X(30).                    ACAT14RC
               09  FILLER                 PIC X(11) VALUE ' EIBRESP ='. ACAT14RC
               09  ABEND-EIBRESP          PIC 99.                       ACAT14RC
           05  UNAUTH-MESSAGE             PIC X(79)                     ACAT14RC
               VALUE 'UNAUTHORIZED USER.'.                              ACAT14RC
           05  SEC-MESSAGE                PIC X(79)                     ACAT14RC
               VALUE 'SIGN ON SECURITY NOT AVAILABLE, TRY AGAIN.'.      ACAT14RC
           05  ERROR-PROG-MSG.                                          ACAT14RC
               09  ERROR-PROG-NAME        PIC X(08).                    ACAT14RC
               09  FILLER                 PIC X(71)                     ACAT14RC
                   VALUE ' PROGRAM NOT AVAILIABLE.'.                    ACAT14RC
           05  DB2IO-ERR-MSG              PIC X(54).                    ACAT14RC
           05  SAVE-INTRAN-FLAG           PIC X(01).                    ACAT14RC
           05  PREV-INTRAN-FLAG           PIC X(01).                    ACAT14RC
           05  WS-ACAT-NEXT               PIC X.                        ACAT14RC
           05  WS-ACTION-COUNT            PIC 9(02).                    ACAT14RC
           05  WS-INIT-TFR-ROWS           PIC 9(03).                    ACAT14RC
           05  SUB                        PIC S9(09) COMP-3.            ACAT14RC
           05  C-IDX                      PIC S9(03) COMP-3.            ACAT14RC
LRM006     05  WS-ACATRST                 PIC X(08) VALUE 'ACATRST '.           
LRM006     05  WS-MRGRLBB                 PIC X(08) VALUE 'MRGRLBB '.           
LRM006 01  ACATRSTIO-CALL-AREA.                                                 
LRM006     COPY ACATRSIO.                                                       
LRM006 01  WS-BDF-SECURITY-TABLE.                                               
LRM006     03  WS-BDF-COUNT        PIC 9(02).                                   
LRM006     03  WS-BDF-SEC-ENTRY OCCURS 10 TIMES PIC X(07).                      
LRM006 01  LB-BANK-COMM-AREA.                                                   
LRM006     COPY LBBCOMM.                                                        
       01  FILLER                     PIC X(8) VALUE 'TS-ASSET'.        ACAT14RC
       01  TS-ASSET-AREA.                                               ACAT14RC
DJ0001     03  TS-SECURITY                PIC X(09).                    ACAT14RC
           03  TS-CTGRY                   PIC X(04).                    ACAT14RC
           03  TS-STTL-LOC                PIC X(02).                    ACAT14RC
           03  TS-DESC                    PIC X(140).                   ACAT14RC
           03  TS-QTY                     USAGE COMP-2.                 ACAT14RC
DJ0001     03  TS-AMT                     USAGE COMP-2.                 ACAT14RC
           03  TS-REASON                  PIC X(02).                    ACAT14RC
           03  TS-CMNTS                   PIC X(120).                   ACAT14RC
           03  TS-PSTN-CD                 PIC X(01).                    ACAT14RC
           03  TS-CS-MG-SH                PIC X(01).                    ACAT14RC
DJ0001     03  TS-SEC-CDG                 PIC X(01).                    ACAT14RC
DJ0001     03  TS-CNTRY                   PIC X(02).                    ACAT14RC
DJ0001     03  TS-ADP-SECNO               PIC X(07).                    ACAT14RC
LRM005     03  TS-NSCC-WTHLD-CD           PIC X(01).                    ACAT14RC
LRM007     03  TS-ORIG-WTHLD-CD           PIC X(01).                    ACAT14RC
           EJECT                                                        ACAT14RC
       01  FILLER                     PIC X(8) VALUE 'ACATPPIO'.        ACAT14RC
       01  ACATPPIO-CALL-AREA.                                          ACAT14RC
           COPY ACATPPIO.                                               ACAT14RC
           EJECT                                                        ACAT14RC
       01  FILLER                     PIC X(8) VALUE 'ACAT14IO'.        ACAT14RC
       01  ACAT14IO-COMMAREA.                                           ACAT14RC
           COPY ACAT14IO.                                               ACAT14RC
           EJECT                                                        ACAT14RC
       01  FILLER                     PIC X(8) VALUE 'ACAT90TS'.        ACAT14RC
       01  WS-POP-UP-WORKAREA.                                          ACAT14RC
           COPY ACAT90TS.                                               ACAT14RC
           EJECT                                                        ACAT14RC
       01  FILLER                     PIC X(8) VALUE 'ACATCOM '.        ACAT14RC
           COPY ACATCOM.                                                ACAT14RC
           EJECT                                                        ACAT14RC
       01  FILLER                     PIC X(8) VALUE 'ACATSRCH'.        ACAT14RC
           COPY ACATSRCH.                                               ACAT14RC
           EJECT                                                        ACAT14RC
       01  FILLER                     PIC X(8) VALUE 'SECLINKC'.        ACAT14RC
           COPY SECLINKC.                                               ACAT14RC
           EJECT                                                        ACAT14RC
       01  FILLER                     PIC X(8) VALUE 'ACAT00M '.        ACAT14RC
           COPY ACAT00M.                                                ACAT14RC
       01  FILLER                     PIC X(8) VALUE 'ACAT14M '.        ACAT14RC
           COPY ACAT14M.                                                ACAT14RC
           EJECT                                                        ACAT14RC
       01  FILLER                     PIC X(8) VALUE 'ATTR    '.        ACAT14RC
           COPY ATTR.                                                   ACAT14RC
           EJECT                                                        ACAT14RC
       01  FILLER                     PIC X(8) VALUE 'DFHAID  '.        ACAT14RC
           COPY DFHAID.                                                 ACAT14RC
           EJECT                                                        ACAT14RC
      ******************************************************************ACAT14RC
      *    WORKFIELDS FOR HOLIO AND BALIO                              *ACAT14RC
      ******************************************************************ACAT14RC
       01  FILLER                     PIC X(8) VALUE 'WS-HOLIO'.        ACAT14RC
       01  WS-HOLIO-KEY                   PIC X(42).                    ACAT14RC
       01  FILLER  REDEFINES WS-HOLIO-KEY.                              ACAT14RC
           10  WS-HOLIO-KEY-1.                                          ACAT14RC
               15  WS-HOLIO-KEY-1-A.                                    ACAT14RC
                   20  WS-HOLIO-CLIENT    PIC 9(05) COMP-3.             ACAT14RC
                   20  WS-HOLIO-BRANCH    PIC X(03).                    ACAT14RC
                   20  WS-HOLIO-ACCT      PIC X(05).                    ACAT14RC
                   20  WS-HOLIO-CURR-CODE PIC X(06).                    ACAT14RC
               15  WS-HOLIO-REC-TYPE      PIC X(02).                    ACAT14RC
               15  WS-HOLIO-ACCT-TYPE     PIC X(02).                    ACAT14RC
           10  WS-HOLIO-KEY-2.                                          ACAT14RC
               15  WS-HOLIO-SECURITY-NO   PIC X(15).                    ACAT14RC
               15  WS-HOLIO-WI-KEY        PIC X(01).                    ACAT14RC
               15  WS-HOLIO-FILLER        PIC X(01).                    ACAT14RC
               15  WS-HOLIO-SEQ-KEY       PIC 9(04).                    ACAT14RC
                                                                        ACAT14RC
       01  WS-BALIO-KEY.                                                ACAT14RC
           05  WS-BALIO-CLIENT            PIC 9(05) COMP-3.             ACAT14RC
           05  WS-BALIO-BRANCH            PIC X(03).                    ACAT14RC
           05  WS-BALIO-ACCOUNT           PIC X(05).                    ACAT14RC
           05  WS-BALIO-ID                PIC 9(02) VALUE 28.           ACAT14RC
           05  WS-BALIO-CURR              PIC 9(06).                    ACAT14RC
           05  FILLER                     PIC X(01) VALUE ' '.          ACAT14RC
                                                                        ACAT14RC
       01  WS-MRGN-QTY              PIC S9(12)V9(5) COMP-3 VALUE +0.    ACAT14RC
       01  WS-MRGN-BAL01              PIC S9(15)V99 COMP-3 VALUE +0.    ACAT14RC
       01  WS-MRGN-BAL02              PIC S9(15)V99 COMP-3 VALUE +0.    ACAT14RC
       01  WS-MRGN-BAL05              PIC S9(15)V99 COMP-3 VALUE +0.    ACAT14RC
                                                                        ACAT14RC
       01  WS-MRGN-BAL-MSG.                                             ACAT14RC
           05  WS-MRGN-BAL-MSG-LIT    PIC X(25) VALUE                   ACAT14RC
               'BALANCE > MRGN BALANCE   '.                             ACAT14RC
           05  WS-MRGN-BAL-MSG-AMT    PIC ZZZ,ZZZ,ZZZ,ZZZ.99-.          ACAT14RC
           05  FILLER                 PIC X(25) VALUE                   ACAT14RC
               '. PLEASE REENTER.'.                                     ACAT14RC
                                                                        ACAT14RC
       01  WS-MRGN-QTY-MSG.                                             ACAT14RC
           05  WS-MRGN-QTY-MSG-LIT    PIC X(25) VALUE                   ACAT14RC
               'QUANTITY > MRGN QUANTITY '.                             ACAT14RC
           05  WS-MRGN-QTY-MSG-QTY    PIC ZZZ,ZZZ,ZZZ,ZZZ.9999-.        ACAT14RC
           05  FILLER                 PIC X(25) VALUE                   ACAT14RC
               '. PLEASE REENTER.'.                                     ACAT14RC
                                                                        ACAT14RC
       01  WS-POSN-MSG.                                                 ACAT14RC
           05  WS-MRGN-QTY-MSG-LIT    PIC X(25) VALUE                   ACAT14RC
               'HOLIO REC NOT FOUND FOR  '.                             ACAT14RC
           05  WS-POSN-CLIENT         PIC 9(04).                        ACAT14RC
           05  WS-POSN-BRANCH         PIC X(03).                        ACAT14RC
           05  WS-POSN-ACCT           PIC X(05).                        ACAT14RC
           05  WS-POSN-CURR-CODE      PIC X(06).                        ACAT14RC
           05  WS-POSN-REC-TYPE       PIC X(02).                        ACAT14RC
           05  WS-POSN-ACCT-TYPE      PIC X(02).                        ACAT14RC
           05  WS-POSN-SECURITY-NO    PIC X(15).                        ACAT14RC
           05  WS-POSN-WI-KEY         PIC X(01).                        ACAT14RC
           05  WS-POSN-FILLER         PIC X(01).                        ACAT14RC
           05  WS-POSN-SEQ-KEY        PIC 9(04).                        ACAT14RC
                                                                        ACAT14RC
       01  ERR-MSG.                                                     ACAT14RC
           05  ERR-EIBDS              PIC X(8)  VALUE SPACES.           ACAT14RC
           05  ERR-MSG2               PIC X(70) VALUE SPACES.           ACAT14RC
                                                                        ACAT14RC
           EJECT                                                        ACAT14RC
      ******************************************************************ACAT14RC
      *    IOCOMALP - COMMAREA TO LINK TO HOLIO AND BALIO - 150 BYTES  *ACAT14RC
      ******************************************************************ACAT14RC
       01  FILLER                     PIC X(8) VALUE 'IOCOMALP'.        ACAT14RC
LRM002*01  WS-IO-COMMAREA.                                              ACAT14RC
LRM002***  COPY  IOCOMALP.                                              ACAT14RC
LRM002 01  CUSHOLIO-COMM-AREA.                                                  
LRM002     COPY  CUSHOLIO REPLACING ==:IO:== BY ==IOH==.                        
           SKIP3                                                                
LRM002 01  CUSBALIO-COMM-AREA.                                                  
LRM002     COPY  CUSBALIO REPLACING ==:IO:== BY ==IOB==.                        
                                                                        ACAT14RC
       01  FILLER                     PIC X(8) VALUE 'END-O-WS'.        ACAT14RC
      ******************************************************************ACAT14RC
      *    END OF WORKING STORAGE                                      *ACAT14RC
      ******************************************************************ACAT14RC
           EJECT                                                        ACAT14RC
       LINKAGE SECTION.                                                 ACAT14RC
       01  DFHCOMMAREA.                                                 ACAT14RC
           03  FILLER                    PIC X(2000).                   ACAT14RC
                                                                        ACAT14RC
       COPY TWACOMMN.                                                   ACAT14RC
           03  TWA-ACAT-AREA.                                           ACAT14RC
               05  TWA-SUBMIT-HOLD-IND          PIC X(01).              ACAT14RC
                   88  TWA-TFR-SUBMIT-ONLY               VALUE 'S'.     ACAT14RC
                   88  TWA-TFR-HOLD-ONLY                 VALUE 'H'.     ACAT14RC
               05  TWA-INQUIRY-SW               PIC X(01).              ACAT14RC
                   88  TWA-INQUIRY-ONLY                  VALUE 'I'.     ACAT14RC
               05  TWA-INQUIRY-TRNFR-SW         PIC X(01).              ACAT14RC
                   88  TWA-NO-INQUIRY-TRNFR-FND          VALUE 'N'.     ACAT14RC
               05  TWA-AST-PAGE-NUM             PIC 9(07) COMP-3.       ACAT14RC
               05  TWA-MAX-AST-PAGE             PIC 9(07) COMP-3.       ACAT14RC
               05  TWA-SCREEN                   PIC X(01).              ACAT14RC
               05  TWA-SAVE-CMNTS               PIC X(120).             ACAT14RC
               05  TWA-MAP-AREA.                                        ACAT14RC
                   07  TWA-MAP-BR               PIC X(3).               ACAT14RC
                   07  TWA-MAP-AC               PIC X(5).               ACAT14RC
                   07  TWA-MAP-RR               PIC X(3).               ACAT14RC
                   07  TWA-MAP-CBRKR            PIC X(4).               ACAT14RC
                   07  TWA-MAP-CBNAM            PIC X(30).              ACAT14RC
                   07  TWA-MAP-CTYPE            PIC X(2).               ACAT14RC
                   07  TWA-MAP-TSTAT            PIC X(8).               ACAT14RC
                   07  TWA-MAP-CACCT            PIC X(20).              ACAT14RC
                   07  TWA-MAP-STAT             PIC X(30).              ACAT14RC
                   07  TWA-MAP-NAME             PIC X(30).              ACAT14RC
                   07  TWA-MAP-SSN              PIC X(11).              ACAT14RC
                   07  TWA-MAP-NAME2            PIC X(30).              ACAT14RC
                   07  TWA-MAP-SSN2             PIC X(11).              ACAT14RC
                   07  TWA-MAP-BAL01            PIC X(19).              ACAT14RC
                   07  TWA-MAP-RSON1            PIC X(2).               ACAT14RC
                   07  TWA-MAP-BAL02            PIC X(19).              ACAT14RC
                   07  TWA-MAP-RSON2            PIC X(2).               ACAT14RC
                   07  TWA-MAP-BAL05            PIC X(19).              ACAT14RC
                   07  TWA-MAP-RSON3            PIC X(2).               ACAT14RC
DJ0001             07  TWA-MAP-CUSIP            PIC X(09).              ACAT14RC
DJ0001             07  TWA-MAP-ADP-SECNO        PIC X(07).              ACAT14RC
                   07  TWA-MAP-CATGR            PIC X(4).               ACAT14RC
                   07  TWA-MAP-SLOC             PIC X(2).               ACAT14RC
                   07  TWA-MAP-TYPE             PIC X(1).               ACAT14RC
                   07  TWA-MAP-DESC1            PIC X(60).              ACAT14RC
                   07  TWA-MAP-DESC2            PIC X(60).              ACAT14RC
DJ0001             07  TWA-MAP-CD               PIC X(01).              ACAT14RC
                   07  TWA-MAP-QTY              PIC X(22).              ACAT14RC
                   07  TWA-MAP-RSON4            PIC X(2).               ACAT14RC
DJ0001             07  TWA-MAP-AMT              PIC X(19).              ACAT14RC
                   07  TWA-MAP-NEXT             PIC X(1).               ACAT14RC
                   07  TWA-MAP-SUB              PIC X(1).               ACAT14RC
                   07  TWA-MAP-ACCT-DLVR        PIC X(20).              ACAT14RC
LRM005             07  TWA-MAP-WTHLD-CD         PIC X(1).                       
               05  TWA-MAP-SEARCH.                                      ACAT14RC
                   07  TWA-MAP-MMBR             PIC X(3).               ACAT14RC
                   07  TWA-MAP-MMAC             PIC X(5).               ACAT14RC
                   07  TWA-MAP-MMRR             PIC X(3).               ACAT14RC
                   07  TWA-MAP-MMTFR            PIC X(3).               ACAT14RC
                   07  TWA-MAP-MMRD             PIC X(1).               ACAT14RC
                   07  TWA-MAP-MMBKR            PIC X(4).               ACAT14RC
                   07  TWA-MAP-MMSTAT           PIC X(3).               ACAT14RC
                   07  TWA-MAP-MMSD             PIC X(6).               ACAT14RC
               05  TWA-PREV-MAP-SEARCH.                                 ACAT14RC
                   07  TWA-PREV-MMBR            PIC X(3).               ACAT14RC
                   07  TWA-PREV-MMAC            PIC X(5).               ACAT14RC
                   07  TWA-PREV-MMRR            PIC X(3).               ACAT14RC
                   07  TWA-PREV-MMTFR           PIC X(3).               ACAT14RC
                   07  TWA-PREV-MMRD            PIC X(1).               ACAT14RC
                   07  TWA-PREV-MMBKR           PIC X(4).               ACAT14RC
                   07  TWA-PREV-MMSTAT          PIC X(3).               ACAT14RC
                   07  TWA-PREV-MMSD            PIC X(6).               ACAT14RC
               05  TWA-TFR-KEY.                                         ACAT14RC
                   07  TWA-KEY-CLT              PIC X(04).              ACAT14RC
                   07  TWA-KEY-DLVR-NBR         PIC X(04).              ACAT14RC
                   07  TWA-KEY-DLVR-ACCT        PIC X(20).              ACAT14RC
                   07  TWA-KEY-RCV-NBR          PIC X(04).              ACAT14RC
                   07  TWA-KEY-RCV-ACCT         PIC X(20).              ACAT14RC
               05  TWA-AMT-QTY.                                         ACAT14RC
                   07  TWA-BAL01-9              PIC S9(15)V9(2) COMP-3. ACAT14RC
                   07  TWA-BAL02-9              PIC S9(15)V9(2) COMP-3. ACAT14RC
                   07  TWA-BAL05-9              PIC S9(15)V9(2) COMP-3. ACAT14RC
                   07  TWA-QTY-9                PIC S9(13)V9(4) COMP-3. ACAT14RC
                   07  TWA-AMT-9                PIC S9(15)V9(2) COMP-3. ACAT14RC
LRM007         05  TWA-WHI-STTS-CD              PIC X(01).              ACAT14RC
                                                                        ACAT14RC
      /                                                                 ACAT14RC
      ******************************************************************ACAT14RC
      *    ACBALALP - BALIO COPYBOOK FOR BALANCE FILE                  *ACAT14RC
      ******************************************************************ACAT14RC
       COPY ACBALALP.                                                   ACAT14RC
      /                                                                 ACAT14RC
      ******************************************************************ACAT14RC
      *    HOLDAVSM - HOLIO COPYBOOK FOR HOLDERS/POSITION FILE         *ACAT14RC
      ******************************************************************ACAT14RC
       COPY HOLDAVSM.                                                   ACAT14RC
      /                                                                 ACAT14RC
      ******************************************************************ACAT14RC
      *    OPNOAVSM - HOLIO COPYBOOK FOR OPEN ORDER POSITION FILE      *ACAT14RC
      ******************************************************************ACAT14RC
       COPY OPNOAVSM.                                                   ACAT14RC
           EJECT                                                        ACAT14RC
                                                                        ACAT14RC
       PROCEDURE DIVISION.                                              ACAT14RC
       INITIALIZATION.                                                  ACAT14RC
           EXEC CICS IGNORE CONDITION DUPKEY DUPREC  ENDFILE  ERROR     ACAT14RC
                     ILLOGIC INVREQ   IOERR  ITEMERR LENGERR  MAPFAIL   ACAT14RC
                     NOSPACE NOSTG    NOTFND         PGMIDERR QIDERR    ACAT14RC
           END-EXEC.                                                    ACAT14RC
           EXEC CICS ASSIGN TWALENG (TWA-SIZE)                          ACAT14RC
           END-EXEC.                                                    ACAT14RC
           IF TWA-SIZE = 0                                              ACAT14RC
              MOVE LOW-VALUE TO ACAT14MO                                ACAT14RC
              SET WS-ERROR TO TRUE                                      ACAT14RC
              MOVE 'TWA SIZE EQUAL ZERO, FATAL ERROR' TO SYSTEM-MSG     ACAT14RC
              PERFORM  8800-ERROR-RTN.                                  ACAT14RC
                                                                        ACAT14RC
           EXEC CICS ADDRESS TWA (ADDRESS OF TWA-AREA)                  ACAT14RC
           END-EXEC.                                                    ACAT14RC
                                                                        ACAT14RC
           EJECT                                                        ACAT14RC
                                                                        ACAT14RC
       MAIN-PROCESSING.                                                 ACAT14RC
           INITIALIZE ACAT14IO-COMMAREA.                                ACAT14RC
           MOVE EIBTRMID TO TERM-ID.                                    ACAT14RC
           MOVE '14RC'   TO TRAN-ID.                                    ACAT14RC
           MOVE TWA-CLIENT-NO TO TWA-CLIENT-NO-9.                       ACAT14RC
           MOVE 'N'           TO END-OF-DATA-FLAG.                      ACAT14RC
           MOVE SPACES        TO SYSTEM-MSG.                            ACAT14RC
           MOVE 0             TO WS-CURSOR.                             ACAT14RC
           MOVE LOW-VALUE     TO HDRMAPO                                ACAT14RC
                                 ACAT14MO.                              ACAT14RC
           PERFORM 0100-GET-DATE-AND-TIME.                              ACAT14RC
           MOVE  DFHCOMMAREA     TO  ACATCOMM-COMMAREA.                 ACAT14RC
           MOVE  TWA-CLIENT-NO-X TO WS-CLT-NBR.                         ACAT14RC
           MOVE  WS-CLT          TO  ACAT14-PASS-CLT.                   ACAT14RC
           MOVE SPACE            TO  WS-UPDATE-SW.                      ACAT14RC
           IF ACAT-SUPER-SIGN-ON-UPDATE                                 ACAT14RC
              SET WS-UPDATE-OK     TO TRUE                              ACAT14RC
           ELSE                                                         ACAT14RC
              PERFORM 0150-CHECK-UPDATE-MODE.                           ACAT14RC
                                                                        ACAT14RC
           IF  ACAT-CALLING-PROG-NAME = 'ACAT21PT'                      ACAT14RC
           AND ACAT-CONTROL-NBR > SPACE                                 ACAT14RC
           AND ACAT-BR-AC > SPACE                                       ACAT14RC
               PERFORM 0250-FROM-PENDING-INQUIRY                        ACAT14RC
           END-IF.                                                      ACAT14RC
                                                                        ACAT14RC
           IF  ACAT-PROGRAM-NAME = 'ACAT14RC'                           ACAT14RC
               MOVE SPACES TO ACAT-CALLING-PROG-NAME                    ACAT14RC
               PERFORM 0900-CONTINUE-PROCESS                            ACAT14RC
           ELSE                                                         ACAT14RC
               MOVE 'ACAT14RC' TO ACAT-PROGRAM-NAME                     ACAT14RC
               PERFORM 0200-FIRST-TIME-RTN.                             ACAT14RC
           EJECT                                                        ACAT14RC
                                                                        ACAT14RC
       0100-GET-DATE-AND-TIME.                                          ACAT14RC
           EXEC  CICS ASKTIME                                           ACAT14RC
                 ABSTIME(WSABSTIME)                                     ACAT14RC
           END-EXEC.                                                    ACAT14RC
           EXEC  CICS FORMATTIME                                        ACAT14RC
                 ABSTIME(WSABSTIME)                                     ACAT14RC
                 MMDDYY(WSMMDDYY)                                       ACAT14RC
                 DATESEP(WSDATESEP)                                     ACAT14RC
                 TIME(WSTIME)                                           ACAT14RC
                 TIMESEP(WSTIMESEP)                                     ACAT14RC
           END-EXEC.                                                    ACAT14RC
           EJECT                                                        ACAT14RC
       0150-CHECK-UPDATE-MODE.                                          ACAT14RC
           MOVE SPACES    TO SECLINK-LIST.                              ACAT14RC
           MOVE '2'       TO SECLINK-ACTION-CODE.                       ACAT14RC
           MOVE 'SCON'    TO SECLINK-TYPE.                              ACAT14RC
           MOVE 'ACAXMU'  TO SECLINK-ITEM.                              ACAT14RC
           PERFORM 1910-CALL-SECLINK-RTN.                               ACAT14RC
           IF SECLINK-RETURN-CODE = '00' OR '20'                        ACAT14RC
              SET WS-UPDATE-OK  TO TRUE.                                ACAT14RC
                                                                        ACAT14RC
       0200-FIRST-TIME-RTN.                                             ACAT14RC
           SET FIRST-TIME TO TRUE.                                      ACAT14RC
           MOVE 'M' TO ACAT-NEXT.                                       ACAT14RC
           IF EIBAID = DFHPF10                                          ACAT14RC
           AND ACAT-CALLING-PROG-NAME = 'ACAT90CM'                      ACAT14RC
              MOVE SPACES TO ACAT-CALLING-PROG-NAME                     ACAT14RC
              PERFORM 7000-READ-TSQ-RTN                                 ACAT14RC
              PERFORM 7010-DELETE-TSQ-RTN                               ACAT14RC
              PERFORM 0210-RETURNED-FROM-ACAT90CM                       ACAT14RC
              PERFORM 0300-RESET-MAP                                    ACAT14RC
              PERFORM 2000-VALIDATE-REASON-CODE                         ACAT14RC
              PERFORM 7020-WRITE-TSQ-RTN                                ACAT14RC
              PERFORM 8200-SEND-MAP-ERASE                               ACAT14RC
              PERFORM 9000-RETURN-TO-CICS.                              ACAT14RC
           INITIALIZE TWA-ACAT-AREA.                                    ACAT14RC
           PERFORM 7010-DELETE-TSQ-RTN.                                 ACAT14RC
           PERFORM 7210-DELETE-ASSET-TSQ.                               ACAT14RC
           MOVE SPACES TO ACAT-CALLING-PROG-NAME                        ACAT14RC
                          TWA-TFR-KEY.                                  ACAT14RC
           MOVE ATT-ASKIP TO MRSON1A                                    ACAT14RC
                             MRSON2A                                    ACAT14RC
                             MRSON3A                                    ACAT14RC
                             MRSON4A.                                   ACAT14RC
DJ0001     MOVE ATT-ASKIP TO MBAL01A                                    ACAT14RC
DJ0001                       MBAL02A                                    ACAT14RC
DJ0001                       MBAL05A                                    ACAT14RC
DJ0001                       MCDA                                       ACAT14RC
DJ0001                       MQTYA                                      ACAT14RC
DJ0001                       MAMTA.                                     ACAT14RC
           MOVE ACAT-INP-BRANCH     TO MMBRO   TWA-MAP-MMBR.            ACAT14RC
           MOVE ACAT-INP-ACCOUNT    TO MMACO   TWA-MAP-MMAC.            ACAT14RC
           MOVE ACAT-INP-RR         TO MMRRO   TWA-MAP-MMRR.            ACAT14RC
           MOVE ACAT-INP-TFR-TYP    TO MMTFRO  TWA-MAP-MMTFR.           ACAT14RC
           MOVE ACAT-INP-RCV-DEL    TO MMRDO   TWA-MAP-MMRD.            ACAT14RC
           MOVE ACAT-INP-CONTRA-BKR TO MMBKRO  TWA-MAP-MMBKR.           ACAT14RC
           MOVE ACAT-INP-STATUS     TO MMSTATO TWA-MAP-MMSTAT.          ACAT14RC
           MOVE ACAT-INP-STTL-DT    TO MMSDO   TWA-MAP-MMSD.            ACAT14RC
           MOVE TWA-MAP-SEARCH      TO TWA-PREV-MAP-SEARCH.             ACAT14RC
           PERFORM 1740-VALIDATE-SRCH-ENGINE.                           ACAT14RC
           IF NOT WS-ERROR                                              ACAT14RC
              PERFORM 0400-REFRESH-WITH-NEW-TFR.                        ACAT14RC
           PERFORM 7020-WRITE-TSQ-RTN.                                  ACAT14RC
           PERFORM 8200-SEND-MAP-ERASE.                                 ACAT14RC
           PERFORM 9000-RETURN-TO-CICS.                                 ACAT14RC
       EJECT                                                            ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *      PROGRAM CONTROL RETURNED FROM POP-UP SCREEN               *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       0210-RETURNED-FROM-ACAT90CM.                                     ACAT14RC
           MOVE 'ACA$'   TO TRAN-ID.                                    ACAT14RC
           EXEC CICS READQ TS QUEUE(TSQ-NAME)                           ACAT14RC
                              INTO(ACAT90CM-TS-AREA)                    ACAT14RC
                              LENGTH(LENGTH OF ACAT90CM-TS-AREA)        ACAT14RC
                              ITEM(ITEM-NUM)                            ACAT14RC
           END-EXEC.                                                    ACAT14RC
           IF EIBRESP = +0                                              ACAT14RC
              IF ACAT90CM-TS-SCREEN = 'A'                               ACAT14RC
                 MOVE ACAT90CM-TS-MCCMNT-X120 TO TWA-SAVE-CMNTS         ACAT14RC
                 MOVE -1 TO MNEXTL                                      ACAT14RC
              ELSE                                                      ACAT14RC
              IF ACAT90CM-TS-SCREEN = 'R'                               ACAT14RC
                 IF TWA-MAP-RSON1 (1:1) = '?' OR                        ACAT14RC
                    TWA-MAP-RSON1 (2:1) = '?'                           ACAT14RC
                      MOVE ACAT90CM-TS-MREAS TO TWA-MAP-RSON1           ACAT14RC
                      MOVE -1 TO MRSON1L                                ACAT14RC
                 ELSE                                                   ACAT14RC
                 IF TWA-MAP-RSON2 (1:1) = '?' OR                        ACAT14RC
                    TWA-MAP-RSON2 (2:1) = '?'                           ACAT14RC
                      MOVE ACAT90CM-TS-MREAS TO TWA-MAP-RSON2           ACAT14RC
                      MOVE -1 TO MRSON2L                                ACAT14RC
                 ELSE                                                   ACAT14RC
                 IF TWA-MAP-RSON3 (1:1) = '?' OR                        ACAT14RC
                    TWA-MAP-RSON3 (2:1) = '?'                           ACAT14RC
                      MOVE ACAT90CM-TS-MREAS TO TWA-MAP-RSON3           ACAT14RC
                      MOVE -1 TO MRSON3L                                ACAT14RC
                 ELSE                                                   ACAT14RC
                 IF TWA-MAP-RSON4 (1:1) = '?' OR                        ACAT14RC
                    TWA-MAP-RSON4 (2:1) = '?'                           ACAT14RC
                      MOVE ACAT90CM-TS-MREAS TO TWA-MAP-RSON4           ACAT14RC
                      MOVE -1 TO MRSON4L.                               ACAT14RC
                                                                        ACAT14RC
           MOVE SPACES   TO TWA-SCREEN.                                 ACAT14RC
           MOVE 'ACA$'   TO TRAN-ID.                                    ACAT14RC
           EXEC CICS DELETEQ TS QUEUE(TSQ-NAME)                         ACAT14RC
           END-EXEC.                                                    ACAT14RC
       EJECT                                                            ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *  THE PROGRAM CONTROL TRANSFERED FROM PENDING (ACAT21PT)        *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       0250-FROM-PENDING-INQUIRY.                                       ACAT14RC
           INITIALIZE TWA-ACAT-AREA.                                    ACAT14RC
           PERFORM 7010-DELETE-TSQ-RTN.                                 ACAT14RC
           PERFORM 7210-DELETE-ASSET-TSQ.                               ACAT14RC
           SET FIRST-TIME TO TRUE.                                      ACAT14RC
           SET TWA-INQUIRY-ONLY TO TRUE.                                ACAT14RC
                                                                        ACAT14RC
           MOVE 'M' TO ACAT-NEXT.                                       ACAT14RC
           MOVE SPACES TO ACAT-CALLING-PROG-NAME.                       ACAT14RC
           MOVE SPACES TO ACAT-BR-AC.                                   ACAT14RC
           MOVE 'ACAT14RC' TO ACAT-PROGRAM-NAME.                        ACAT14RC
           PERFORM 8100-CLEAR-SCR.                                      ACAT14RC
           MOVE ATT-ASKIP TO MSUBA                                      ACAT14RC
                             MMBRA MMACA MMRRA MMTFRA                   ACAT14RC
                             MMRDA MMBKRA MMSTATA MMSDA.                ACAT14RC
           MOVE ACAT-CONTROL-NBR TO ACAT14-PASS-ACAT.                   ACAT14RC
           PERFORM 0590-GET-ACTIVE-TRNFR.                               ACAT14RC
           PERFORM 1900-BR-AE-SECURITY.                                 ACAT14RC
           IF ACAT14-NOT-FOUND                                          ACAT14RC
              SET TWA-NO-INQUIRY-TRNFR-FND TO TRUE                      ACAT14RC
              SET WS-ERROR TO TRUE                                      ACAT14RC
              MOVE 'NO RESIDUAL CREDIT TRANSFER FOUND'                  ACAT14RC
                TO  SYSTEM-MSG                                          ACAT14RC
           ELSE                                                         ACAT14RC
           IF ACAT14-NORMAL  AND                                        ACAT14RC
               SRCH-SIGNON-SECR-CHECK-PASS                              ACAT14RC
              PERFORM 0650-SETUP-TFR-SCR                                ACAT14RC
              PERFORM 0591-OPEN-ACTIVE-ASSET                            ACAT14RC
              MOVE SPACE TO WS-NO-MORE-DATA-SW                          ACAT14RC
              PERFORM  UNTIL WS-NO-MORE-DATA                            ACAT14RC
                 PERFORM 0592-FETCH-ACTIVE-ASSET                        ACAT14RC
                 IF ACAT14-NORMAL                                       ACAT14RC
                    PERFORM 0630-SAVE-ASSETS-IN-TS                      ACAT14RC
                 END-IF                                                 ACAT14RC
              END-PERFORM                                               ACAT14RC
              PERFORM 0593-CLOSE-ACTIVE-ASSET                           ACAT14RC
              MOVE +1 TO ASSET-ITEM                                     ACAT14RC
              PERFORM 7200-READ-ASSET-TSQ                               ACAT14RC
              IF WS-TS-READ-OK                                          ACAT14RC
                 PERFORM 7201-SETUP-SCR-FROM-TSQ                        ACAT14RC
                 ADD +1 TO TWA-AST-PAGE-NUM                             ACAT14RC
              END-IF                                                    ACAT14RC
           END-IF.                                                      ACAT14RC
           MOVE -1 TO MNEXTL.                                           ACAT14RC
           PERFORM 7020-WRITE-TSQ-RTN.                                  ACAT14RC
           PERFORM 8200-SEND-MAP-ERASE.                                 ACAT14RC
           PERFORM 9000-RETURN-TO-CICS.                                 ACAT14RC
       EJECT                                                            ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *   RESET MAP UPON RETURNING FROM POP-UP SCREEN                  *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       0300-RESET-MAP.                                                  ACAT14RC
           MOVE TWA-MAP-BR     TO MBRO.                                 ACAT14RC
           MOVE TWA-MAP-AC     TO MACO.                                 ACAT14RC
           MOVE TWA-MAP-CBRKR  TO MCBRKRO.                              ACAT14RC
           MOVE TWA-MAP-CACCT  TO MCACCTO.                              ACAT14RC
           MOVE TWA-MAP-RR     TO MRRO.                                 ACAT14RC
           MOVE TWA-MAP-CBNAM  TO MCBNAMO.                              ACAT14RC
           MOVE TWA-MAP-CTYPE  TO MCTYPEO.                              ACAT14RC
           MOVE TWA-MAP-TSTAT  TO MTSTATO.                              ACAT14RC
           MOVE TWA-MAP-CACCT  TO MCACCTO.                              ACAT14RC
           MOVE TWA-MAP-STAT   TO MSTATO.                               ACAT14RC
           MOVE TWA-MAP-NAME   TO MNAMEO.                               ACAT14RC
           MOVE TWA-MAP-SSN    TO MSSNO.                                ACAT14RC
           MOVE TWA-MAP-NAME2  TO MNAME2O.                              ACAT14RC
           MOVE TWA-MAP-SSN2   TO MSSN2O.                               ACAT14RC
           MOVE TWA-MAP-BAL01  TO MBAL01I.                              ACAT14RC
           MOVE TWA-MAP-RSON1  TO MRSON1O.                              ACAT14RC
           MOVE TWA-MAP-BAL02  TO MBAL02I.                              ACAT14RC
           MOVE TWA-MAP-RSON2  TO MRSON2O.                              ACAT14RC
           MOVE TWA-MAP-BAL05  TO MBAL05I.                              ACAT14RC
           MOVE TWA-MAP-RSON3  TO MRSON3O.                              ACAT14RC
           MOVE TWA-MAP-CUSIP  TO MCUSIPO.                              ACAT14RC
           MOVE TWA-MAP-CATGR  TO MCATGRO.                              ACAT14RC
           MOVE TWA-MAP-SLOC   TO MSLOCO.                               ACAT14RC
           MOVE TWA-MAP-TYPE   TO MTYPEO.                               ACAT14RC
           MOVE TWA-MAP-DESC1  TO MDESC1O.                              ACAT14RC
           MOVE TWA-MAP-DESC2  TO MDESC2O.                              ACAT14RC
           MOVE TWA-MAP-QTY    TO MQTYI.                                ACAT14RC
           MOVE TWA-MAP-RSON4  TO MRSON4O.                              ACAT14RC
DJ0001     MOVE TWA-MAP-AMT    TO MAMTI.                                ACAT14RC
LRM005     MOVE TWA-MAP-WTHLD-CD TO MCDO.                               ACAT14RC
                                                                        ACAT14RC
           MOVE SPACE  TO MNEXTO TWA-MAP-NEXT                           ACAT14RC
                          MSUBO  TWA-MAP-SUB.                           ACAT14RC
                                                                        ACAT14RC
           MOVE TWA-MAP-MMBR   TO MMBRO.                                ACAT14RC
           MOVE TWA-MAP-MMAC   TO MMACO.                                ACAT14RC
           MOVE TWA-MAP-MMRR   TO MMRRO.                                ACAT14RC
           MOVE TWA-MAP-MMTFR  TO MMTFRO.                               ACAT14RC
           MOVE TWA-MAP-MMRD   TO MMRDO.                                ACAT14RC
           MOVE TWA-MAP-MMBKR  TO MMBKRO.                               ACAT14RC
           MOVE TWA-MAP-MMSTAT TO MMSTATO.                              ACAT14RC
           MOVE TWA-MAP-MMSD   TO MMSDO.                                ACAT14RC
           IF TWA-MAP-BAL01 > SPACE                                     ACAT14RC
              MOVE ATT-UNPROT TO MRSON1A                                ACAT14RC
DJ0001        MOVE ATT-UNPROT TO MBAL01A                                ACAT14RC
           ELSE                                                         ACAT14RC
              MOVE ATT-ASKIP  TO MRSON1A                                ACAT14RC
DJ0001        MOVE ATT-ASKIP  TO MBAL01A                                ACAT14RC
DJ0001     END-IF.                                                      ACAT14RC
           IF TWA-MAP-BAL02 > SPACE                                     ACAT14RC
              MOVE ATT-UNPROT TO MRSON2A                                ACAT14RC
DJ0001        MOVE ATT-UNPROT TO MBAL02A                                ACAT14RC
           ELSE                                                         ACAT14RC
              MOVE ATT-ASKIP  TO MRSON2A                                ACAT14RC
DJ0001        MOVE ATT-ASKIP  TO MBAL02A                                ACAT14RC
DJ0001     END-IF.                                                      ACAT14RC
           IF TWA-MAP-BAL05 > SPACE                                     ACAT14RC
              MOVE ATT-UNPROT TO MRSON3A                                ACAT14RC
DJ0001        MOVE ATT-UNPROT TO MBAL05A                                ACAT14RC
           ELSE                                                         ACAT14RC
              MOVE ATT-ASKIP  TO MRSON3A                                ACAT14RC
DJ0001        MOVE ATT-ASKIP  TO MBAL05A                                ACAT14RC
DJ0001     END-IF.                                                      ACAT14RC
           IF TWA-MAP-QTY   > SPACE                                     ACAT14RC
              MOVE ATT-UNPROT TO MRSON4A                                ACAT14RC
DJ0001        MOVE ATT-UNPROT TO MCDA                                   ACAT14RC
DJ0001        MOVE ATT-UNPROT TO MQTYA                                  ACAT14RC
DJ0001        MOVE ATT-UNPROT TO MAMTA                                  ACAT14RC
           ELSE                                                         ACAT14RC
              MOVE ATT-ASKIP  TO MRSON4A                                ACAT14RC
DJ0001        MOVE ATT-ASKIP  TO MCDA                                   ACAT14RC
DJ0001        MOVE ATT-ASKIP  TO MQTYA                                  ACAT14RC
DJ0001        MOVE ATT-ASKIP  TO MAMTA                                  ACAT14RC
DJ0001     END-IF.                                                      ACAT14RC
       EJECT                                                            ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *     RECALL RESIDUAL CREDIT TRANSFER FROM INITIAL TRANSFER TBL  *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       0400-REFRESH-WITH-NEW-TFR.                                       ACAT14RC
           PERFORM 0500-OPEN-TFR-CURSOR-TBL.                            ACAT14RC
           MOVE SPACE TO WS-ASSET-POSITION-FOUND-SW                     ACAT14RC
                         WS-TFR-NOT-FOUND-SW.                           ACAT14RC
           PERFORM 0410-GET-INIT-TRANSFER                               ACAT14RC
                UNTIL WS-ASSET-POSITION-FOUND OR WS-TFR-NOT-FOUND       ACAT14RC
           PERFORM 0550-CLOSE-TFR-CSR-TBL.                              ACAT14RC
           MOVE -1 TO MNEXTL.                                           ACAT14RC
           IF WS-TFR-NOT-FOUND                                          ACAT14RC
              SET WS-ERROR TO TRUE                                      ACAT14RC
              MOVE 'NO RESIDUAL CREDIT TRANSFERS FOUND'                 ACAT14RC
                TO  SYSTEM-MSG.                                         ACAT14RC
                                                                        ACAT14RC
       0410-GET-INIT-TRANSFER.                                          ACAT14RC
           PERFORM 0520-FETCH-TFR-CURSOR-TBL.                           ACAT14RC
           IF ACAT14-NORMAL  AND                                        ACAT14RC
               SRCH-SIGNON-SECR-CHECK-PASS                              ACAT14RC
              PERFORM 0600-SETUP-SCREEN THRU 0600-EXIT.                 ACAT14RC
       EJECT                                                            ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *          OPEN INITIAL TRANSFER CURSOR TABLE                    *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       0500-OPEN-TFR-CURSOR-TBL.                                        ACAT14RC
           MOVE ACAT-ADP-BROKER  TO ACAT14-PASS-DLVR-NBR.               ACAT14RC
           MOVE SPACE TO ACAT14-PASS-DLVR-ACCT.                         ACAT14RC
           IF ACAT-INP-BRANCH > SPACE                                   ACAT14RC
              IF ACAT-INP-ACCOUNT > SPACE                               ACAT14RC
                 MOVE ACAT-INP-BRANCH   TO WS-BRANCH                    ACAT14RC
                 MOVE ACAT-INP-ACCOUNT  TO WS-ACCT                      ACAT14RC
                 MOVE WS-DLVR-ACCT      TO ACAT14-PASS-DLVR-ACCT        ACAT14RC
              ELSE                                                      ACAT14RC
                 MOVE ACAT-INP-BRANCH   TO WS-BRANCH                    ACAT14RC
                 MOVE WS-DLVR-ACCT      TO ACAT14-PASS-DLVR-ACCT        ACAT14RC
              END-IF.                                                   ACAT14RC
           IF ACAT-INP-CONTRA-BKR > SPACE                               ACAT14RC
              MOVE ACAT-INP-CONTRA-BKR TO ACAT14-PASS-RCV-NBR           ACAT14RC
           ELSE                                                         ACAT14RC
              MOVE ALL '%' TO ACAT14-PASS-RCV-NBR.                      ACAT14RC
           IF ACAT-INP-RR > SPACE                                       ACAT14RC
              MOVE ACAT-INP-RR TO ACAT14-PASS-RR                        ACAT14RC
           ELSE                                                         ACAT14RC
              MOVE ALL '%' TO ACAT14-PASS-RR.                           ACAT14RC
                                                                        ACAT14RC
           SET ACAT14-OPN-TFRCSR TO TRUE.                               ACAT14RC
           PERFORM 7600-LINK-TO-ACAT14DB.                               ACAT14RC
           IF ACAT14-ERROR                                              ACAT14RC
LRM004        MOVE                                                      ACAT14RC
LRM004        'DB2 OPEN ERROR ON INIT TRANSFER TABLE - CALL HELP DESK'  ACAT14RC
                TO  WS-DB2-ERROR                                        ACAT14RC
              PERFORM 8700-SEND-DB2-ERROR-MSG.                          ACAT14RC
                                                                        ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *         FETCH INITIAL TRANSFER CURSOR TABLE                    *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       0520-FETCH-TFR-CURSOR-TBL.                                       ACAT14RC
           SET ACAT14-FET-TFRCSR TO TRUE.                               ACAT14RC
           PERFORM 7600-LINK-TO-ACAT14DB.                               ACAT14RC
           IF ACAT14-NORMAL                                             ACAT14RC
              CONTINUE                                                  ACAT14RC
           ELSE                                                         ACAT14RC
           IF ACAT14-NOT-FOUND                                          ACAT14RC
              SET WS-TFR-NOT-FOUND TO TRUE                              ACAT14RC
           ELSE                                                         ACAT14RC
              PERFORM 0550-CLOSE-TFR-CSR-TBL                            ACAT14RC
LRM004        MOVE                                                      ACAT14RC
LRM004        'DB2 FETCH ERROR ON INIT TRANSFER TABLE - CALL HELP DESK' ACAT14RC
                TO  WS-DB2-ERROR                                        ACAT14RC
              PERFORM 8700-SEND-DB2-ERROR-MSG.                          ACAT14RC
           IF ACAT-SUPER-SIGN-ON-UPDATE OR                              ACAT14RC
              ACAT-SUPER-SIGN-ON-BROWSE                                 ACAT14RC
               SET SRCH-SIGNON-SECR-CHECK-PASS  TO TRUE                 ACAT14RC
           ELSE                                                         ACAT14RC
               IF NOT ACAT14-NOT-FOUND                                  ACAT14RC
                  PERFORM 1900-BR-AE-SECURITY.                          ACAT14RC
                                                                        ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *         CLOSE INITIAL TRANSFER CURSOR TABLE                    *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       0550-CLOSE-TFR-CSR-TBL.                                          ACAT14RC
           SET ACAT14-CLO-TFRCSR TO TRUE.                               ACAT14RC
           INITIALIZE ACAT14-RET-VALUES.                                ACAT14RC
           PERFORM 7600-LINK-TO-ACAT14DB.                               ACAT14RC
           IF ACAT14-ERROR                                              ACAT14RC
LRM004        MOVE                                                      ACAT14RC
LRM004        'DB2 CLOSE ERROR ON INIT TRANSFER TABLE - CALL HELP DESK' ACAT14RC
                TO  WS-DB2-ERROR                                        ACAT14RC
              PERFORM 8700-SEND-DB2-ERROR-MSG.                          ACAT14RC
       EJECT                                                            ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *      OPEN INITIAL TRANSFER CURSOR TABLE IN DESCENDING ORDER   * ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       0560-OPEN-TFR-CUR-DESCEND.                                       ACAT14RC
           MOVE ACAT-ADP-BROKER  TO ACAT14-PASS-DLVR-NBR.               ACAT14RC
           MOVE SPACE TO ACAT14-PASS-DLVR-ACCT.                         ACAT14RC
           IF ACAT-INP-BRANCH > SPACE                                   ACAT14RC
              IF ACAT-INP-ACCOUNT > SPACE                               ACAT14RC
                 MOVE ACAT-INP-BRANCH   TO WS-BRANCH                    ACAT14RC
                 MOVE ACAT-INP-ACCOUNT  TO WS-ACCT                      ACAT14RC
                 MOVE WS-DLVR-ACCT      TO ACAT14-PASS-DLVR-ACCT        ACAT14RC
              ELSE                                                      ACAT14RC
                 MOVE ACAT-INP-BRANCH   TO WS-BRANCH                    ACAT14RC
                 MOVE WS-DLVR-ACCT      TO ACAT14-PASS-DLVR-ACCT        ACAT14RC
              END-IF.                                                   ACAT14RC
           IF ACAT-INP-CONTRA-BKR > SPACE                               ACAT14RC
              MOVE ACAT-INP-CONTRA-BKR TO ACAT14-PASS-RCV-NBR           ACAT14RC
           ELSE                                                         ACAT14RC
              MOVE ALL '%' TO ACAT14-PASS-RCV-NBR.                      ACAT14RC
           IF ACAT-INP-RR > SPACE                                       ACAT14RC
              MOVE ACAT-INP-RR TO ACAT14-PASS-RR                        ACAT14RC
           ELSE                                                         ACAT14RC
              MOVE ALL '%' TO ACAT14-PASS-RR.                           ACAT14RC
                                                                        ACAT14RC
           SET ACAT14-OPN-TFRCSR-D TO TRUE.                             ACAT14RC
           PERFORM 7600-LINK-TO-ACAT14DB.                               ACAT14RC
           IF ACAT14-ERROR                                              ACAT14RC
LRM004        MOVE                                                      ACAT14RC
LRM004        'DB2 OPEN ERROR ON INIT TFR DESCEND - CALL HELP DESK'     ACAT14RC
                TO  WS-DB2-ERROR                                        ACAT14RC
              PERFORM 8700-SEND-DB2-ERROR-MSG.                          ACAT14RC
                                                                        ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *     FETCH INITIAL TRANSFER CURSOR TABLE IN DESCENDING ORDER    *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       0570-FETCH-TFR-CUR-DESCEND.                                      ACAT14RC
           SET ACAT14-FET-TFRCSR-D TO TRUE.                             ACAT14RC
           PERFORM 7600-LINK-TO-ACAT14DB.                               ACAT14RC
           IF ACAT14-NORMAL                                             ACAT14RC
              CONTINUE                                                  ACAT14RC
           ELSE                                                         ACAT14RC
           IF ACAT14-NOT-FOUND                                          ACAT14RC
              SET WS-TFR-NOT-FOUND TO TRUE                              ACAT14RC
           ELSE                                                         ACAT14RC
              PERFORM 0550-CLOSE-TFR-CSR-TBL                            ACAT14RC
LRM004        MOVE                                                      ACAT14RC
LRM004        'DB2 FETCH ERROR ON INIT TFR DESCEND TBL - CALL HELP DESK'ACAT14RC
                TO  WS-DB2-ERROR                                        ACAT14RC
              PERFORM 8700-SEND-DB2-ERROR-MSG.                          ACAT14RC
           IF ACAT-SUPER-SIGN-ON-UPDATE OR                              ACAT14RC
              ACAT-SUPER-SIGN-ON-BROWSE                                 ACAT14RC
               SET SRCH-SIGNON-SECR-CHECK-PASS TO TRUE                  ACAT14RC
           ELSE                                                         ACAT14RC
               IF NOT ACAT14-NOT-FOUND                                  ACAT14RC
                  PERFORM 1900-BR-AE-SECURITY.                          ACAT14RC
                                                                        ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *     CLOSE INITIAL TRANSFER CURSOR TABLE IN DESCENDING ORDER    *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       0580-CLOSE-TFR-CUR-DESCEND.                                      ACAT14RC
           SET ACAT14-CLO-TFRCSR-D TO TRUE.                             ACAT14RC
           INITIALIZE ACAT14-RET-VALUES.                                ACAT14RC
           PERFORM 7600-LINK-TO-ACAT14DB.                               ACAT14RC
           IF ACAT14-ERROR                                              ACAT14RC
LRM004        MOVE                                                      ACAT14RC
LRM004        'DB2 CLOSE ERROR ON DESCEND TFR TABLE - CALL HELP DESK'   ACAT14RC
                TO  WS-DB2-ERROR                                        ACAT14RC
              PERFORM 8700-SEND-DB2-ERROR-MSG.                          ACAT14RC
       EJECT                                                            ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *          READ ACTIVE TRANSFER TABLE                            *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       0590-GET-ACTIVE-TRNFR.                                           ACAT14RC
           SET ACAT14-GET-TRANSFER TO TRUE.                             ACAT14RC
           PERFORM 7600-LINK-TO-ACAT14DB.                               ACAT14RC
           IF ACAT14-ERROR                                              ACAT14RC
LRM004        MOVE                                                      ACAT14RC
LRM004        'DB2 READ ERROR ON ACTIVE TRANSFER TBL - CALL HELP DESK'  ACAT14RC
                TO  WS-DB2-ERROR                                        ACAT14RC
              PERFORM 8700-SEND-DB2-ERROR-MSG.                          ACAT14RC
       EJECT                                                            ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *          OPEN ACTIVE ASSET CURSOR TABLE                        *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       0591-OPEN-ACTIVE-ASSET.                                          ACAT14RC
           SET ACAT14-OPN-ASSET TO TRUE.                                ACAT14RC
           PERFORM 7600-LINK-TO-ACAT14DB.                               ACAT14RC
           IF ACAT14-ERROR                                              ACAT14RC
LRM004        MOVE                                                      ACAT14RC
LRM004        'DB2 OPEN ERROR ON ACTIVE ASSET TBL - CALL HELP DESK'     ACAT14RC
                TO  WS-DB2-ERROR                                        ACAT14RC
              PERFORM 8700-SEND-DB2-ERROR-MSG.                          ACAT14RC
                                                                        ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *         FETCH ACTIVE ASSET CURSOR TABLE                        *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       0592-FETCH-ACTIVE-ASSET.                                         ACAT14RC
           SET ACAT14-FET-ASSET TO TRUE.                                ACAT14RC
           PERFORM 7600-LINK-TO-ACAT14DB.                               ACAT14RC
           IF ACAT14-NORMAL                                             ACAT14RC
              CONTINUE                                                  ACAT14RC
           ELSE                                                         ACAT14RC
           IF ACAT14-NOT-FOUND                                          ACAT14RC
              SET WS-NO-MORE-DATA TO TRUE                               ACAT14RC
           ELSE                                                         ACAT14RC
              PERFORM 0593-CLOSE-ACTIVE-ASSET                           ACAT14RC
LRM004        MOVE                                                      ACAT14RC
LRM004        'DB2 FETCH ERROR ON ACTIVE ASSET TBL - CALL HELP DESK'    ACAT14RC
                TO  WS-DB2-ERROR                                        ACAT14RC
              PERFORM 8700-SEND-DB2-ERROR-MSG.                          ACAT14RC
                                                                        ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *         CLOSE ACTIVE ASSET CURSOR TABLE                        *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       0593-CLOSE-ACTIVE-ASSET.                                         ACAT14RC
           SET ACAT14-CLO-ASSET TO TRUE.                                ACAT14RC
           PERFORM 7600-LINK-TO-ACAT14DB.                               ACAT14RC
           IF ACAT14-ERROR                                              ACAT14RC
LRM004        MOVE                                                      ACAT14RC
LRM004        'DB2 CLOSE ERROR ON ACTIVE ASSET TBL - CALL HELP DESK'    ACAT14RC
                TO  WS-DB2-ERROR                                        ACAT14RC
              PERFORM 8700-SEND-DB2-ERROR-MSG.                          ACAT14RC
       EJECT                                                            ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *         PREPARE TO MOVE DATA TO SCREEN AREA                    *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       0600-SETUP-SCREEN.                                               ACAT14RC
           MOVE 0 TO TWA-AST-PAGE-NUM                                   ACAT14RC
                     TWA-MAX-AST-PAGE.                                  ACAT14RC
           MOVE ACAT14-TFR-CLT         TO ACAT14-PASS-CLT.              ACAT14RC
           MOVE ACAT14-TFR-DLVR-NBR    TO ACAT14-PASS-DLVR-NBR.         ACAT14RC
           MOVE ACAT14-TFR-DLVR-ACCT   TO ACAT14-PASS-DLVR-ACCT.        ACAT14RC
           MOVE ACAT14-TFR-RCV-NBR     TO ACAT14-PASS-RCV-NBR.          ACAT14RC
           MOVE ACAT14-TFR-RCV-ACCT    TO ACAT14-PASS-RCV-ACCT.         ACAT14RC
           MOVE ACAT14-TFR-DLVR-ACCT   TO TWA-MAP-ACCT-DLVR.            ACAT14RC
      **<< ANY ASSET ROWS EXIST? >>                                     ACAT14RC
           SET ACAT14-CNT-ASTINI  TO TRUE.                              ACAT14RC
           PERFORM 7600-LINK-TO-ACAT14DB.                               ACAT14RC
           IF ACAT14-NOT-FOUND                                          ACAT14RC
              GO TO 0600-EXIT                                           ACAT14RC
           ELSE                                                         ACAT14RC
           IF ACAT14-ERROR                                              ACAT14RC
LRM004        MOVE                                                      ACAT14RC
LRM004        'DB2 COUNT ERROR ON INIT ASSET TABLE - CALL HELP DESK'    ACAT14RC
                TO  WS-DB2-ERROR                                        ACAT14RC
              PERFORM 8700-SEND-DB2-ERROR-MSG.                          ACAT14RC
           PERFORM 7210-DELETE-ASSET-TSQ.                               ACAT14RC
      **<< OPEN INITIAL ASSET >>                                        ACAT14RC
           SET ACAT14-OPN-ASTCRSR TO TRUE.                              ACAT14RC
           PERFORM 7600-LINK-TO-ACAT14DB.                               ACAT14RC
           IF ACAT14-ERROR                                              ACAT14RC
LRM004        MOVE                                                      ACAT14RC
LRM004        'DB2 OPEN ERROR ON INIT ASSET TABLE - CALL HELP DESK'     ACAT14RC
                TO  WS-DB2-ERROR                                        ACAT14RC
              PERFORM 8700-SEND-DB2-ERROR-MSG.                          ACAT14RC
      **<< FETCH INITIAL ASSET >>                                       ACAT14RC
           MOVE SPACE TO WS-NO-MORE-DATA-SW.                            ACAT14RC
           PERFORM 0620-READ-ASSET-TABLE                                ACAT14RC
                      UNTIL WS-NO-MORE-DATA.                            ACAT14RC
      **<< CLOSE INITIAL ASSET >>                                       ACAT14RC
           SET ACAT14-CLO-ASTCRSR TO TRUE.                              ACAT14RC
           PERFORM 7600-LINK-TO-ACAT14DB.                               ACAT14RC
           IF ACAT14-ERROR                                              ACAT14RC
LRM004        MOVE                                                      ACAT14RC
LRM004        'DB2 CLOSE ERROR ON INIT ASSET TABLE - CALL HELP DESK'    ACAT14RC
                TO  WS-DB2-ERROR                                        ACAT14RC
              PERFORM 8700-SEND-DB2-ERROR-MSG.                          ACAT14RC
           MOVE +1 TO ASSET-ITEM.                                       ACAT14RC
           PERFORM 7200-READ-ASSET-TSQ.                                 ACAT14RC
           IF WS-TS-READ-OK                                             ACAT14RC
              PERFORM 7201-SETUP-SCR-FROM-TSQ                           ACAT14RC
              ADD +1 TO TWA-AST-PAGE-NUM.                               ACAT14RC
           IF  WS-TS-READ-OK          OR                                ACAT14RC
              (TWA-MAP-BAL01 > SPACE) OR                                ACAT14RC
              (TWA-MAP-BAL02 > SPACE) OR                                ACAT14RC
              (TWA-MAP-BAL05 > SPACE)                                   ACAT14RC
                PERFORM 0650-SETUP-TFR-SCR                              ACAT14RC
                SET WS-ASSET-POSITION-FOUND TO TRUE.                    ACAT14RC
       0600-EXIT.                                           EXIT.       ACAT14RC
       EJECT                                                            ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *          FETCH INITIAL ASSET CURSOR                            *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       0620-READ-ASSET-TABLE.                                           ACAT14RC
           SET ACAT14-FET-ASTCRSR TO TRUE.                              ACAT14RC
           PERFORM 7600-LINK-TO-ACAT14DB.                               ACAT14RC
           IF ACAT14-NORMAL                                             ACAT14RC
              PERFORM 0630-SAVE-ASSETS-IN-TS                            ACAT14RC
           ELSE                                                         ACAT14RC
           IF ACAT14-NOT-FOUND                                          ACAT14RC
              SET WS-NO-MORE-DATA TO TRUE                               ACAT14RC
           ELSE                                                         ACAT14RC
              SET ACAT14-CLO-ASTCRSR TO TRUE                            ACAT14RC
              PERFORM 7600-LINK-TO-ACAT14DB                             ACAT14RC
LRM004        MOVE                                                      ACAT14RC
LRM004        'DB2 FETCH ERROR ON INIT ASSET TABLE - CALL HELP DESK'    ACAT14RC
                TO  WS-DB2-ERROR                                        ACAT14RC
              PERFORM 8700-SEND-DB2-ERROR-MSG.                          ACAT14RC
       EJECT                                                            ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *  MOVE CASH BALANCE DATA TO MAP AREA                            *ACAT14RC
      *  SAVE SECURITY DATA IN TEMP STORAGE                            *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       0630-SAVE-ASSETS-IN-TS.                                          ACAT14RC
           IF ACAT14-AST-STTL-LOC = '40'                                ACAT14RC
              IF ACAT14-AST-CS-MG-SH = 'C'                              ACAT14RC
                 IF ACAT14-AST-STTLM-RSN = 'CRED'                       ACAT14RC
DJ0001              MULTIPLY ACAT14-AST-AMT BY -1 GIVING TWA-BAL01-9    ACAT14RC
DJ0001              MOVE TWA-BAL01-9    TO MBAL01O                      ACAT14RC
                 ELSE                                                   ACAT14RC
DJ0001              MOVE ACAT14-AST-AMT TO TWA-BAL01-9                  ACAT14RC
DJ0001              MOVE TWA-BAL01-9    TO MBAL01O                      ACAT14RC
                 END-IF                                                 ACAT14RC
                 MOVE MBAL01I  TO TWA-MAP-BAL01                         ACAT14RC
                 MOVE ACAT14-AST-REASON TO MRSON1O TWA-MAP-RSON1        ACAT14RC
                 IF NOT TWA-INQUIRY-ONLY                                ACAT14RC
                    MOVE ATT-UNPROT TO MRSON1A                          ACAT14RC
DJ0001              MOVE ATT-UNPROT TO MBAL01A                          ACAT14RC
DJ0001           ELSE                                                   ACAT14RC
DJ0001              MOVE ATT-ASKIP  TO MRSON1A                          ACAT14RC
DJ0001              MOVE ATT-ASKIP  TO MBAL01A                          ACAT14RC
                 END-IF                                                 ACAT14RC
              END-IF                                                    ACAT14RC
              IF ACAT14-AST-CS-MG-SH = 'M'                              ACAT14RC
                 IF ACAT14-AST-STTLM-RSN = 'CRED'                       ACAT14RC
DJ0001              MULTIPLY ACAT14-AST-AMT BY -1 GIVING TWA-BAL02-9    ACAT14RC
DJ0001              MOVE TWA-BAL02-9    TO MBAL02O                      ACAT14RC
                 ELSE                                                   ACAT14RC
DJ0001              MOVE ACAT14-AST-AMT TO TWA-BAL02-9                  ACAT14RC
DJ0001              MOVE TWA-BAL02-9    TO MBAL02O                      ACAT14RC
                 END-IF                                                 ACAT14RC
                 MOVE MBAL02I  TO TWA-MAP-BAL02                         ACAT14RC
                 MOVE ACAT14-AST-REASON TO MRSON2O TWA-MAP-RSON2        ACAT14RC
                 IF NOT TWA-INQUIRY-ONLY                                ACAT14RC
                    MOVE ATT-UNPROT TO MRSON2A                          ACAT14RC
DJ0001              MOVE ATT-UNPROT TO MBAL02A                          ACAT14RC
DJ0001           ELSE                                                   ACAT14RC
DJ0001              MOVE ATT-ASKIP  TO MRSON2A                          ACAT14RC
DJ0001              MOVE ATT-ASKIP  TO MBAL02A                          ACAT14RC
                 END-IF                                                 ACAT14RC
              END-IF                                                    ACAT14RC
              IF ACAT14-AST-CS-MG-SH = 'S'                              ACAT14RC
                 IF ACAT14-AST-STTLM-RSN = 'CRED'                       ACAT14RC
DJ0001              MULTIPLY ACAT14-AST-AMT BY -1 GIVING TWA-BAL05-9    ACAT14RC
DJ0001              MOVE TWA-BAL05-9    TO MBAL05O                      ACAT14RC
                 ELSE                                                   ACAT14RC
DJ0001              MOVE ACAT14-AST-AMT TO TWA-BAL05-9                  ACAT14RC
DJ0001              MOVE TWA-BAL05-9    TO MBAL05O                      ACAT14RC
                 END-IF                                                 ACAT14RC
                 MOVE MBAL05I  TO TWA-MAP-BAL05                         ACAT14RC
                 MOVE ACAT14-AST-REASON TO MRSON3O TWA-MAP-RSON3        ACAT14RC
                 IF NOT TWA-INQUIRY-ONLY                                ACAT14RC
                    MOVE ATT-UNPROT TO MRSON3A                          ACAT14RC
DJ0001              MOVE ATT-UNPROT TO MBAL05A                          ACAT14RC
DJ0001           ELSE                                                   ACAT14RC
DJ0001              MOVE ATT-ASKIP  TO MRSON3A                          ACAT14RC
DJ0001              MOVE ATT-ASKIP  TO MBAL05A                          ACAT14RC
                 END-IF                                                 ACAT14RC
              END-IF                                                    ACAT14RC
           ELSE                                                         ACAT14RC
              INITIALIZE TS-ASSET-AREA                                  ACAT14RC
              MOVE ACAT14-AST-SEC        TO TS-SECURITY                 ACAT14RC
DJ0001        MOVE ACAT14-AST-SEC-CDG    TO TS-SEC-CDG                  ACAT14RC
DJ0001        MOVE ACAT14-AST-CNTRY      TO TS-CNTRY                    ACAT14RC
              MOVE ACAT14-AST-CTGRY      TO TS-CTGRY                    ACAT14RC
              MOVE ACAT14-AST-STTL-LOC   TO TS-STTL-LOC                 ACAT14RC
              MOVE ACAT14-AST-CS-MG-SH   TO TS-CS-MG-SH                 ACAT14RC
              MOVE ACAT14-AST-PSTN-CD    TO TS-PSTN-CD                  ACAT14RC
              MOVE ACAT14-AST-QTY        TO TS-QTY                      ACAT14RC
DJ0001        MOVE ACAT14-AST-AMT        TO TS-AMT                      ACAT14RC
              MOVE ACAT14-AST-DESC       TO TS-DESC                     ACAT14RC
              MOVE ACAT14-AST-CMNTS      TO TS-CMNTS                    ACAT14RC
              MOVE ACAT14-AST-REASON     TO TS-REASON                   ACAT14RC
              MOVE ACAT14-AST-ADP-SECNO  TO TS-ADP-SECNO                ACAT14RC
LRM005        IF ACAT14-NSCC-WTHLD-CD = 'W'                             ACAT14RC
LRM005           MOVE ACAT14-NSCC-WTHLD-CD TO TS-NSCC-WTHLD-CD  MCDO    ACAT14RC
LRM005        ELSE                                                              
LRM005           MOVE SPACE                TO TS-NSCC-WTHLD-CD  MCDO    ACAT14RC
LRM005        END-IF                                                            
LRM007        MOVE TS-NSCC-WTHLD-CD        TO TS-ORIG-WTHLD-CD          ACAT14RC
LRM007        MOVE ACAT14-WHI-STTS-CD    TO TWA-WHI-STTS-CD                     
              PERFORM 7220-WRITE-ASSET-TSQ                              ACAT14RC
              ADD +1 TO TWA-MAX-AST-PAGE                                ACAT14RC
           END-IF.                                                      ACAT14RC
       EJECT                                                            ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *      SETUP TRANSFER DATA TO MAP                                *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       0650-SETUP-TFR-SCR.                                              ACAT14RC
                                                                        ACAT14RC
           IF ACAT14-TFR-NSCC-PEND = 'H'                                ACAT14RC
              SET TWA-TFR-SUBMIT-ONLY  TO TRUE.                         ACAT14RC
                                                                        ACAT14RC
           IF ACAT14-TFR-NSCC-PEND = SPACE                              ACAT14RC
              SET TWA-TFR-HOLD-ONLY    TO TRUE.                         ACAT14RC
                                                                        ACAT14RC
           MOVE ACAT14-TFR-CMNTS     TO TWA-SAVE-CMNTS.                 ACAT14RC
           MOVE ACAT14-TFR-DLVR-ACCT TO WS-DLVR-ACCT.                   ACAT14RC
           MOVE WS-BRANCH            TO MBRO    TWA-MAP-BR.             ACAT14RC
           MOVE WS-ACCT              TO MACO    TWA-MAP-AC.             ACAT14RC
           MOVE ACAT14-TFR-RCV-NBR   TO MCBRKRO TWA-MAP-CBRKR.          ACAT14RC
           MOVE ACAT14-TFR-RCV-NBR   TO ACATPPIO-BRKR.                  ACAT14RC
           SET ACATPPIO-READ TO TRUE.                                   ACAT14RC
           PERFORM 7700-LINK-TO-ACATPPIO.                               ACAT14RC
           IF ACATPPIO-FOUND                                            ACAT14RC
              MOVE ACATPPIO-NAME TO MCBNAMO TWA-MAP-CBNAM               ACAT14RC
           END-IF.                                                      ACAT14RC
           MOVE ACAT14-TFR-RCV-ACCT TO MCACCTO TWA-MAP-CACCT.           ACAT14RC
           EVALUATE ACAT14-TFR-STTS                                     ACAT14RC
               WHEN '100'                                               ACAT14RC
                    MOVE '100-REQUEST'                                  ACAT14RC
                      TO  MSTATO                                        ACAT14RC
               WHEN '110'                                               ACAT14RC
                    MOVE '110-REQUEST ADJUST'                           ACAT14RC
                      TO  MSTATO                                        ACAT14RC
               WHEN '120'                                               ACAT14RC
                    MOVE '120-REQUEST ADJUST PAST'                      ACAT14RC
                      TO  MSTATO                                        ACAT14RC
               WHEN '130'                                               ACAT14RC
                    MOVE '130-REQUEST PAST'                             ACAT14RC
                      TO  MSTATO                                        ACAT14RC
               WHEN '140'                                               ACAT14RC
                    MOVE '140-REQUEST REJECT'                           ACAT14RC
                      TO  MSTATO                                        ACAT14RC
               WHEN '200'                                               ACAT14RC
                    MOVE '200-REVIEW'                                   ACAT14RC
                      TO  MSTATO                                        ACAT14RC
               WHEN '210'                                               ACAT14RC
                    MOVE '210-REVIEW ADJUST'                            ACAT14RC
                      TO  MSTATO                                        ACAT14RC
               WHEN '220'                                               ACAT14RC
                    MOVE '220-REVIEW ERROR'                             ACAT14RC
                      TO  MSTATO                                        ACAT14RC
               WHEN '230'                                               ACAT14RC
                    MOVE '230-REVIEW ACCELERATE'                        ACAT14RC
                      TO  MSTATO                                        ACAT14RC
               WHEN '300'                                               ACAT14RC
                    MOVE '300-SETTLE PREP'                              ACAT14RC
                      TO  MSTATO                                        ACAT14RC
               WHEN '310'                                               ACAT14RC
                    MOVE '310-SETTLE CLOSE'                             ACAT14RC
                      TO  MSTATO                                        ACAT14RC
               WHEN '400'                                               ACAT14RC
                    MOVE '400-CLOSE PURGE'                              ACAT14RC
                      TO  MSTATO                                        ACAT14RC
               WHEN '500'                                               ACAT14RC
                    MOVE '500-MEMO PARTIAL REQUEST'                     ACAT14RC
                      TO  MSTATO                                        ACAT14RC
               WHEN '510'                                               ACAT14RC
                    MOVE '510-MEMO PURGE PARTIAL REQUEST'               ACAT14RC
                      TO  MSTATO                                        ACAT14RC
               WHEN '600'                                               ACAT14RC
                    MOVE '600-REJECT'                                   ACAT14RC
                      TO  MSTATO                                        ACAT14RC
               WHEN OTHER                                               ACAT14RC
                    MOVE TWA-MAP-STAT                                   ACAT14RC
                      TO  MSTATO                                        ACAT14RC
           END-EVALUATE.                                                ACAT14RC
           MOVE MSTATO TO TWA-MAP-STAT.                                 ACAT14RC
           MOVE ACAT14-TFR-ACCT-TYPE TO MCTYPEO TWA-MAP-CTYPE.          ACAT14RC
           MOVE ACAT14-TFR-RR        TO MRRO    TWA-MAP-RR.             ACAT14RC
           MOVE ACAT14-TFR-NM1       TO MNAMEO  TWA-MAP-NAME.           ACAT14RC
           MOVE ACAT14-TFR-NM2       TO MNAME2O TWA-MAP-NAME2.          ACAT14RC
           IF ACAT14-TFR-SS1 = SPACE                                    ACAT14RC
              MOVE SPACE  TO MSSNO TWA-MAP-SSN                          ACAT14RC
           ELSE                                                         ACAT14RC
              MOVE ACAT14-TFR-SS1(1:3) TO WS-SS-NUM1                    ACAT14RC
              MOVE ACAT14-TFR-SS1(4:2) TO WS-SS-NUM2                    ACAT14RC
              MOVE ACAT14-TFR-SS1(6:4) TO WS-SS-NUM3                    ACAT14RC
              MOVE WS-SS-NUM           TO MSSNO TWA-MAP-SSN.            ACAT14RC
           IF ACAT14-TFR-SS2 = SPACE                                    ACAT14RC
              MOVE SPACE   TO MSSN2O TWA-MAP-SSN2                       ACAT14RC
           ELSE                                                         ACAT14RC
              MOVE ACAT14-TFR-SS1(1:3) TO WS-SS-NUM1                    ACAT14RC
              MOVE ACAT14-TFR-SS1(4:2) TO WS-SS-NUM2                    ACAT14RC
              MOVE ACAT14-TFR-SS1(6:4) TO WS-SS-NUM3                    ACAT14RC
              MOVE WS-SS-NUM           TO MSSN2O TWA-MAP-SSN2.          ACAT14RC
           IF TWA-INQUIRY-ONLY                                          ACAT14RC
              MOVE SPACE      TO MTSTATO TWA-MAP-TSTAT                  ACAT14RC
           ELSE                                                         ACAT14RC
              IF TWA-TFR-SUBMIT-ONLY                                    ACAT14RC
                 MOVE 'HOLD'     TO MTSTATO TWA-MAP-TSTAT               ACAT14RC
              END-IF                                                    ACAT14RC
              IF TWA-TFR-HOLD-ONLY                                      ACAT14RC
                 MOVE 'TRANSMIT' TO MTSTATO TWA-MAP-TSTAT               ACAT14RC
              END-IF                                                    ACAT14RC
           END-IF.                                                      ACAT14RC
                                                                        ACAT14RC
           MOVE ACAT14-TFR-CLT       TO TWA-KEY-CLT.                    ACAT14RC
           MOVE ACAT14-TFR-DLVR-NBR  TO TWA-KEY-DLVR-NBR.               ACAT14RC
           MOVE ACAT14-TFR-DLVR-ACCT TO TWA-KEY-DLVR-ACCT.              ACAT14RC
           MOVE ACAT14-TFR-RCV-NBR   TO TWA-KEY-RCV-NBR.                ACAT14RC
           MOVE ACAT14-TFR-RCV-ACCT  TO TWA-KEY-RCV-ACCT.               ACAT14RC
       EJECT                                                            ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *       CONTINUE PORCESS IF NOT FIRST-TIME-ROUTINE               *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       0900-CONTINUE-PROCESS.                                           ACAT14RC
           PERFORM 7000-READ-TSQ-RTN.                                   ACAT14RC
           PERFORM 7010-DELETE-TSQ-RTN.                                 ACAT14RC
           SET DATA-ONLY TO TRUE.                                       ACAT14RC
           EVALUATE TRUE                                                ACAT14RC
                WHEN EIBAID = DFHPF11 OR DFHCLEAR                       ACAT14RC
                     PERFORM 9900-RETURN-CONTROL-RTN                    ACAT14RC
                WHEN EIBAID = DFHPF10 OR DFHPF12                        ACAT14RC
                     PERFORM 9000-RETURN-TO-CICS                        ACAT14RC
                WHEN EIBAID = DFHPF1                                    ACAT14RC
                     IF TWA-TFR-SUBMIT-ONLY OR                          ACAT14RC
                        TWA-TFR-HOLD-ONLY   OR                          ACAT14RC
                        TWA-INQUIRY-ONLY                                ACAT14RC
                         MOVE 'A' TO TWA-SCREEN                         ACAT14RC
                         PERFORM 1800-SEND-POPUP-MAP-RTN                ACAT14RC
                     ELSE                                               ACAT14RC
                        SET  WS-ERROR  TO TRUE                          ACAT14RC
                        MOVE LOW-VALUE TO ACAT14MO                      ACAT14RC
                        MOVE -1 TO MNEXTL                               ACAT14RC
                        MOVE 'PF1 KEY DISABLED AT THIS TIME'            ACAT14RC
                          TO  SYSTEM-MSG                                ACAT14RC
                        PERFORM 8800-ERROR-RTN                          ACAT14RC
                     END-IF                                             ACAT14RC
                WHEN EIBAID = DFHENTER                                  ACAT14RC
                     PERFORM 1000-ENTER-KEY                             ACAT14RC
                WHEN EIBAID = DFHPF7                                    ACAT14RC
                     PERFORM 5000-PREV-TFR                              ACAT14RC
                WHEN EIBAID = DFHPF8                                    ACAT14RC
                     PERFORM 5100-NEXT-TFR                              ACAT14RC
                WHEN EIBAID = DFHPA1                                    ACAT14RC
                     PERFORM 6000-NEXT-ASSET                            ACAT14RC
                WHEN EIBAID = DFHPA2                                    ACAT14RC
                     PERFORM 6100-PREV-ASSET                            ACAT14RC
                WHEN OTHER                                              ACAT14RC
                     SET  WS-ERROR  TO TRUE                             ACAT14RC
                     MOVE LOW-VALUE TO ACAT14MO                         ACAT14RC
                     MOVE -1 TO MNEXTL                                  ACAT14RC
                     MOVE 'ERROR FUNCTION KEY'                          ACAT14RC
                       TO SYSTEM-MSG                                    ACAT14RC
                     PERFORM 8800-ERROR-RTN                             ACAT14RC
           END-EVALUATE.                                                ACAT14RC
       EJECT                                                            ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *       ENTER KEY ROUTINE                                        *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       1000-ENTER-KEY.                                                  ACAT14RC
                                                                        ACAT14RC
           PERFORM 1100-RECEIVE-MAP.                                    ACAT14RC
                                                                        ACAT14RC
           MOVE SPACE  TO WS-ERROR-SW                                   ACAT14RC
                          WS-MSG-ON-SW.                                 ACAT14RC
           IF TWA-INQUIRY-ONLY                                          ACAT14RC
              IF MNEXTL > 0                                             ACAT14RC
                 IF MNEXTI = TWA-MAP-NEXT                               ACAT14RC
                    CONTINUE                                            ACAT14RC
                 ELSE                                                   ACAT14RC
                    MOVE MNEXTI TO TWA-MAP-NEXT                         ACAT14RC
                 END-IF                                                 ACAT14RC
              ELSE                                                      ACAT14RC
                 IF MNEXTA = ERASE-KEY                                  ACAT14RC
                    MOVE SPACES TO TWA-MAP-NEXT                         ACAT14RC
                 END-IF                                                 ACAT14RC
              END-IF                                                    ACAT14RC
              IF TWA-MAP-NEXT = 'M'                                     ACAT14RC
                 MOVE SPACE TO MNEXTO TWA-MAP-NEXT                      ACAT14RC
              END-IF                                                    ACAT14RC
              IF TWA-MAP-NEXT > SPACE                                   ACAT14RC
                 MOVE TWA-MAP-NEXT TO ACAT-INP-SEL                      ACAT14RC
                 PERFORM 1720-NEXT-SEL-ENTERED-RTN                      ACAT14RC
              END-IF                                                    ACAT14RC
           ELSE                                                         ACAT14RC
              IF (TWA-TFR-SUBMIT-ONLY OR TWA-TFR-HOLD-ONLY) AND         ACAT14RC
                   WS-UPDATE-OK                                         ACAT14RC
                 PERFORM 2000-VALIDATE-REASON-CODE                      ACAT14RC
DJ0001           PERFORM 3000-VALIDATE-AMOUNT-FIELDS THRU 3000-EXIT     ACAT14RC
              END-IF                                                    ACAT14RC
              PERFORM 1700-NEXT-SELECTION-RTN                           ACAT14RC
              IF NOT WS-ERROR                                           ACAT14RC
                 PERFORM 4000-SUBMIT-RTN                                ACAT14RC
              END-IF                                                    ACAT14RC
           END-IF.                                                      ACAT14RC
           IF NOT WS-ERROR                                              ACAT14RC
              MOVE -1    TO MNEXTL                                      ACAT14RC
              MOVE SPACE TO TRLMSGO                                     ACAT14RC
           END-IF.                                                      ACAT14RC
           PERFORM  7020-WRITE-TSQ-RTN.                                 ACAT14RC
           IF FIRST-TIME                                                ACAT14RC
              PERFORM 8200-SEND-MAP-ERASE                               ACAT14RC
           ELSE                                                         ACAT14RC
              PERFORM 8900-SEND-MAP-DATA-ONLY.                          ACAT14RC
           PERFORM  9000-RETURN-TO-CICS.                                ACAT14RC
       EJECT                                                            ACAT14RC
       1100-RECEIVE-MAP.                                                ACAT14RC
                                                                        ACAT14RC
           EXEC CICS RECEIVE MAP('HDRMAP')                              ACAT14RC
                             MAPSET('ACAT00M')                          ACAT14RC
                             FROM(ACAT-RECEIVE-MAP)                     ACAT14RC
                             LENGTH(ACAT-RECEIVE-MAP-LENGTH)            ACAT14RC
           END-EXEC.                                                    ACAT14RC
           EXEC CICS RECEIVE MAP('ACAT14M')                             ACAT14RC
                             MAPSET('ACAT14M')                          ACAT14RC
                             FROM(ACAT-RECEIVE-MAP)                     ACAT14RC
                             INTO(ACAT14MI)                             ACAT14RC
                             LENGTH(ACAT-RECEIVE-MAP-LENGTH)            ACAT14RC
           END-EXEC.                                                    ACAT14RC
           EXEC CICS RECEIVE MAP('TRLMAP')                              ACAT14RC
                             MAPSET('ACAT00M')                          ACAT14RC
                             FROM(ACAT-RECEIVE-MAP)                     ACAT14RC
                             INTO(TRLMAPI)                              ACAT14RC
                             LENGTH(ACAT-RECEIVE-MAP-LENGTH)            ACAT14RC
           END-EXEC.                                                    ACAT14RC
       EJECT                                                            ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *              JUMP TO NEXT SELECTION                            *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       1700-NEXT-SELECTION-RTN.                                         ACAT14RC
           IF MMBRL > 0                                                 ACAT14RC
              IF MMBRI = TWA-MAP-MMBR                                   ACAT14RC
                 CONTINUE                                               ACAT14RC
              ELSE                                                      ACAT14RC
                 MOVE MMBRI TO TWA-MAP-MMBR                             ACAT14RC
              END-IF                                                    ACAT14RC
           ELSE                                                         ACAT14RC
              IF MMBRA = ERASE-KEY                                      ACAT14RC
                 MOVE SPACES TO TWA-MAP-MMBR                            ACAT14RC
              END-IF.                                                   ACAT14RC
           IF TWA-MAP-MMBR = LOW-VALUE                                  ACAT14RC
              MOVE SPACE TO TWA-MAP-MMBR.                               ACAT14RC
           MOVE ATT-UNPROT TO MMBRA.                                    ACAT14RC
                                                                        ACAT14RC
           IF MMACL > 0                                                 ACAT14RC
              IF MMACI = TWA-MAP-MMAC                                   ACAT14RC
                 CONTINUE                                               ACAT14RC
              ELSE                                                      ACAT14RC
                 MOVE MMACI TO TWA-MAP-MMAC                             ACAT14RC
              END-IF                                                    ACAT14RC
           ELSE                                                         ACAT14RC
              IF MMACA = ERASE-KEY                                      ACAT14RC
                 MOVE SPACES TO TWA-MAP-MMAC                            ACAT14RC
              END-IF.                                                   ACAT14RC
           IF TWA-MAP-MMAC = LOW-VALUE                                  ACAT14RC
              MOVE SPACE TO TWA-MAP-MMAC.                               ACAT14RC
           MOVE ATT-UNPROT TO MMACA.                                    ACAT14RC
                                                                        ACAT14RC
           IF MMRRL > 0                                                 ACAT14RC
              IF MMRRI = TWA-MAP-MMRR                                   ACAT14RC
                 CONTINUE                                               ACAT14RC
              ELSE                                                      ACAT14RC
                 MOVE MMRRI TO TWA-MAP-MMRR                             ACAT14RC
              END-IF                                                    ACAT14RC
           ELSE                                                         ACAT14RC
              IF MMRRA = ERASE-KEY                                      ACAT14RC
                 MOVE SPACES TO TWA-MAP-MMRR                            ACAT14RC
              END-IF.                                                   ACAT14RC
           IF TWA-MAP-MMRR = LOW-VALUE                                  ACAT14RC
              MOVE SPACE TO TWA-MAP-MMRR.                               ACAT14RC
           MOVE ATT-UNPROT TO MMRRA.                                    ACAT14RC
                                                                        ACAT14RC
           IF MMTFRL > 0                                                ACAT14RC
              IF MMTFRI = TWA-MAP-MMTFR                                 ACAT14RC
                 CONTINUE                                               ACAT14RC
              ELSE                                                      ACAT14RC
                 MOVE MMTFRI TO TWA-MAP-MMTFR                           ACAT14RC
              END-IF                                                    ACAT14RC
           ELSE                                                         ACAT14RC
              IF MMTFRA = ERASE-KEY                                     ACAT14RC
                 MOVE SPACES TO TWA-MAP-MMTFR                           ACAT14RC
              END-IF.                                                   ACAT14RC
           IF TWA-MAP-MMTFR = LOW-VALUE                                 ACAT14RC
              MOVE SPACE TO TWA-MAP-MMTFR.                              ACAT14RC
           MOVE ATT-UNPROT TO MMTFRA.                                   ACAT14RC
                                                                        ACAT14RC
           IF MMRDL > 0                                                 ACAT14RC
              IF MMRDI = TWA-MAP-MMRD                                   ACAT14RC
                 CONTINUE                                               ACAT14RC
              ELSE                                                      ACAT14RC
                 MOVE MMRDI TO TWA-MAP-MMRD                             ACAT14RC
              END-IF                                                    ACAT14RC
           ELSE                                                         ACAT14RC
              IF MMRDA = ERASE-KEY                                      ACAT14RC
                 MOVE SPACES TO TWA-MAP-MMRD                            ACAT14RC
              END-IF.                                                   ACAT14RC
           IF TWA-MAP-MMRD = LOW-VALUE                                  ACAT14RC
              MOVE SPACE TO TWA-MAP-MMRD.                               ACAT14RC
           MOVE ATT-UNPROT TO MMRDA.                                    ACAT14RC
                                                                        ACAT14RC
           IF MMBKRL > 0                                                ACAT14RC
              IF MMBKRI = TWA-MAP-MMBKR                                 ACAT14RC
                 CONTINUE                                               ACAT14RC
              ELSE                                                      ACAT14RC
                 MOVE MMBKRI TO TWA-MAP-MMBKR                           ACAT14RC
              END-IF                                                    ACAT14RC
           ELSE                                                         ACAT14RC
              IF MMBKRA = ERASE-KEY                                     ACAT14RC
                 MOVE SPACES TO TWA-MAP-MMBKR                           ACAT14RC
              END-IF.                                                   ACAT14RC
           IF TWA-MAP-MMBKR = LOW-VALUE                                 ACAT14RC
              MOVE SPACE TO TWA-MAP-MMBKR.                              ACAT14RC
           MOVE ATT-UNPROT TO MMBKRA.                                   ACAT14RC
                                                                        ACAT14RC
           IF MMSTATL > 0                                               ACAT14RC
              IF MMSTATI = TWA-MAP-MMSTAT                               ACAT14RC
                 CONTINUE                                               ACAT14RC
              ELSE                                                      ACAT14RC
                 MOVE MMSTATI TO TWA-MAP-MMSTAT                         ACAT14RC
              END-IF                                                    ACAT14RC
           ELSE                                                         ACAT14RC
              IF MMSTATA = ERASE-KEY                                    ACAT14RC
                 MOVE SPACES TO TWA-MAP-MMSTAT                          ACAT14RC
              END-IF.                                                   ACAT14RC
           IF TWA-MAP-MMSTAT = LOW-VALUE                                ACAT14RC
              MOVE SPACE TO TWA-MAP-MMSTAT.                             ACAT14RC
           MOVE ATT-UNPROT TO MMSTATA.                                  ACAT14RC
                                                                        ACAT14RC
           IF MMSDL > 0                                                 ACAT14RC
              IF MMSDI = TWA-MAP-MMSD                                   ACAT14RC
                 CONTINUE                                               ACAT14RC
              ELSE                                                      ACAT14RC
                 MOVE MMSDI TO TWA-MAP-MMSD                             ACAT14RC
              END-IF                                                    ACAT14RC
           ELSE                                                         ACAT14RC
              IF MMSDA = ERASE-KEY                                      ACAT14RC
                 MOVE SPACES TO TWA-MAP-MMSD                            ACAT14RC
              END-IF.                                                   ACAT14RC
           IF TWA-MAP-MMSD = LOW-VALUE                                  ACAT14RC
              MOVE SPACE TO TWA-MAP-MMSD.                               ACAT14RC
           MOVE ATT-UNPROT TO MMSDA.                                    ACAT14RC
                                                                        ACAT14RC
           MOVE TWA-MAP-MMBR   TO ACAT-INP-BRANCH.                      ACAT14RC
           MOVE TWA-MAP-MMAC   TO ACAT-INP-ACCOUNT.                     ACAT14RC
           MOVE TWA-MAP-MMRR   TO ACAT-INP-RR.                          ACAT14RC
           MOVE TWA-MAP-MMTFR  TO ACAT-INP-TFR-TYP.                     ACAT14RC
           MOVE TWA-MAP-MMRD   TO ACAT-INP-RCV-DEL.                     ACAT14RC
           MOVE TWA-MAP-MMBKR  TO ACAT-INP-CONTRA-BKR.                  ACAT14RC
           MOVE TWA-MAP-MMSTAT TO ACAT-INP-STATUS.                      ACAT14RC
           MOVE TWA-MAP-MMSD   TO ACAT-INP-STTL-DT.                     ACAT14RC
                                                                        ACAT14RC
           IF MNEXTL > 0                                                ACAT14RC
              IF MNEXTI = TWA-MAP-NEXT                                  ACAT14RC
                 CONTINUE                                               ACAT14RC
              ELSE                                                      ACAT14RC
                 MOVE MNEXTI TO TWA-MAP-NEXT                            ACAT14RC
              END-IF                                                    ACAT14RC
           ELSE                                                         ACAT14RC
              IF MNEXTA = ERASE-KEY                                     ACAT14RC
                 MOVE SPACES TO TWA-MAP-NEXT                            ACAT14RC
              END-IF.                                                   ACAT14RC
           IF TWA-MAP-NEXT = LOW-VALUE                                  ACAT14RC
              MOVE SPACE TO TWA-MAP-NEXT.                               ACAT14RC
           IF TWA-MAP-NEXT = 'M'                                        ACAT14RC
              MOVE SPACE TO MNEXTO                                      ACAT14RC
                            TWA-MAP-NEXT.                               ACAT14RC
                                                                        ACAT14RC
           IF TWA-MAP-NEXT = SPACE                                      ACAT14RC
              PERFORM 1710-NEXT-SEL-SPACE-RTN                           ACAT14RC
           ELSE                                                         ACAT14RC
              MOVE TWA-MAP-NEXT TO ACAT-INP-SEL                         ACAT14RC
              PERFORM 1720-NEXT-SEL-ENTERED-RTN.                        ACAT14RC
                                                                        ACAT14RC
       EJECT                                                            ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *           NEXT SELECTION WAS NOT ENTERED                       *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       1710-NEXT-SEL-SPACE-RTN.                                         ACAT14RC
           MOVE  'M'   TO  ACAT-INP-SEL.                                ACAT14RC
           IF TWA-MAP-SEARCH > SPACE                                    ACAT14RC
              PERFORM 1740-VALIDATE-SRCH-ENGINE                         ACAT14RC
              IF NOT WS-ERROR                                           ACAT14RC
                 PERFORM 1750-CHECK-IF-SRCH-CHANGED                     ACAT14RC
                 IF WS-SEARCH-CHANGED                                   ACAT14RC
                    MOVE SPACE TO TWA-SUBMIT-HOLD-IND                   ACAT14RC
                    PERFORM 8100-CLEAR-SCR                              ACAT14RC
                    PERFORM 0400-REFRESH-WITH-NEW-TFR                   ACAT14RC
                 END-IF                                                 ACAT14RC
              END-IF                                                    ACAT14RC
           ELSE                                                         ACAT14RC
              PERFORM 1750-CHECK-IF-SRCH-CHANGED                        ACAT14RC
              IF WS-SEARCH-CHANGED                                      ACAT14RC
                 MOVE SPACE TO TWA-SUBMIT-HOLD-IND                      ACAT14RC
                 PERFORM 8100-CLEAR-SCR                                 ACAT14RC
                 PERFORM 0400-REFRESH-WITH-NEW-TFR                      ACAT14RC
              END-IF.                                                   ACAT14RC
       EJECT                                                            ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *           NEXT SELECTION WAS ENTERED                           *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       1720-NEXT-SEL-ENTERED-RTN.                                       ACAT14RC
           MOVE TWA-MAP-NEXT   TO WS-ACAT-NEXT.                         ACAT14RC
       COPY ACATJUMP.                                                   ACAT14RC
           IF CALLED-PROGRAM-NAME = SPACES                              ACAT14RC
              MOVE -1             TO MNEXTL                             ACAT14RC
              MOVE ATT-UNPROT-BRT TO MNEXTA                             ACAT14RC
              IF NOT WS-ERROR                                           ACAT14RC
                 SET WS-ERROR     TO TRUE                               ACAT14RC
                 MOVE 'INVALID "NEXT" SELECTION'                        ACAT14RC
                   TO  SYSTEM-MSG                                       ACAT14RC
              END-IF                                                    ACAT14RC
           ELSE                                                         ACAT14RC
              PERFORM 1721-SCREEN-SECURITY-CHECK                        ACAT14RC
              PERFORM 7210-DELETE-ASSET-TSQ                             ACAT14RC
              MOVE 'ACAT14RC'    TO ACAT-CALLING-PROG-NAME              ACAT14RC
              MOVE  TWA-MAP-NEXT TO ACAT-NEXT                           ACAT14RC
              PERFORM 7500-XCTL-TO-DETAIL-PROG.                         ACAT14RC
                                                                        ACAT14RC
       1721-SCREEN-SECURITY-CHECK.                                      ACAT14RC
           IF  ACAT-SUPER-SIGN-ON-UPDATE                                ACAT14RC
                OR                                                      ACAT14RC
               ACAT-SUPER-SIGN-ON-BROWSE                                ACAT14RC
                OR                                                      ACAT14RC
               ACAT-JUMP-ANYWHERE                                       ACAT14RC
                OR                                                      ACAT14RC
               ACAT-NEXT = '$'                                          ACAT14RC
                CONTINUE                                                ACAT14RC
           ELSE                                                         ACAT14RC
               MOVE TWA-MAP-NEXT TO ACAT-SCREEN-IND                     ACAT14RC
               SET ACAT-UPDATE-MODE TO TRUE                             ACAT14RC
               MOVE SPACES    TO SECLINK-LIST                           ACAT14RC
               MOVE '2'       TO SECLINK-ACTION-CODE                    ACAT14RC
               MOVE 'SCON'    TO SECLINK-TYPE                           ACAT14RC
               MOVE ACAT-SEC-LIT TO SECLINK-ITEM                        ACAT14RC
               PERFORM 1910-CALL-SECLINK-RTN                            ACAT14RC
               IF SECLINK-RETURN-CODE = '00' OR '20'                    ACAT14RC
                  SET ACAT-SIGN-ON-UPDATE TO TRUE                       ACAT14RC
                  MOVE SECLINK-USER-ID TO ACAT-SIGN-ON-ID               ACAT14RC
               ELSE                                                     ACAT14RC
                  SET ACAT-BROWSE-MODE TO TRUE                          ACAT14RC
                  MOVE SPACES    TO SECLINK-LIST                        ACAT14RC
                  MOVE '2'       TO SECLINK-ACTION-CODE                 ACAT14RC
                  MOVE 'SCON'    TO SECLINK-TYPE                        ACAT14RC
                  MOVE ACAT-SEC-LIT TO SECLINK-ITEM                     ACAT14RC
                  PERFORM 1910-CALL-SECLINK-RTN                         ACAT14RC
                  IF SECLINK-RETURN-CODE = '00' OR '20'                 ACAT14RC
                     MOVE SPACE TO ACAT-SIGN-ON-SEC-FLAG                ACAT14RC
                  ELSE                                                  ACAT14RC
                     MOVE 'USER NOT AUTHORIZED TO USE NEXT SELECTION '  ACAT14RC
                          TO SYSTEM-MSG                                 ACAT14RC
                     MOVE TWA-MAP-NEXT                                  ACAT14RC
                          TO SYSTEM-MSG(44 : 1)                         ACAT14RC
                     MOVE 'M' TO ACAT-INP-SEL                           ACAT14RC
                     MOVE -1              TO MNEXTL                     ACAT14RC
                     MOVE ATT-UNPROT-BRT  TO MNEXTA                     ACAT14RC
                     SET WS-MSG-ON        TO TRUE                       ACAT14RC
                     PERFORM 8800-ERROR-RTN                             ACAT14RC
                  END-IF                                                ACAT14RC
               END-IF                                                   ACAT14RC
           END-IF.                                                      ACAT14RC
                                                                        ACAT14RC
       EJECT                                                            ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *           VALIDATE THE SEARCH ENGINED                          *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       1740-VALIDATE-SRCH-ENGINE.                                       ACAT14RC
           EXEC CICS LINK                                               ACAT14RC
                     PROGRAM('ACATSRCH')                                ACAT14RC
                     COMMAREA(ACAT-SEARCH-AREA)                         ACAT14RC
                     LENGTH(LENGTH OF ACAT-SEARCH-AREA)                 ACAT14RC
           END-EXEC.                                                    ACAT14RC
           IF  ACAT-SRCH-MSG > SPACE                                    ACAT14RC
               IF NOT WS-ERROR                                          ACAT14RC
                  SET WS-ERROR TO TRUE                                  ACAT14RC
                  MOVE ACAT-SRCH-MSG TO SYSTEM-MSG                      ACAT14RC
               END-IF                                                   ACAT14RC
               IF  ACAT-SRCH-BR = 'N'                                   ACAT14RC
                   MOVE -1             TO MMBRL                         ACAT14RC
                   MOVE ATT-UNPROT-BRT TO MMBRA                         ACAT14RC
               END-IF                                                   ACAT14RC
               IF  ACAT-SRCH-ACCT = 'N'                                 ACAT14RC
                   MOVE -1             TO MMACL                         ACAT14RC
                   MOVE ATT-UNPROT-BRT TO MMACA                         ACAT14RC
               END-IF                                                   ACAT14RC
               IF  ACAT-SRCH-RR = 'N'                                   ACAT14RC
                   MOVE -1             TO MMRRL                         ACAT14RC
                   MOVE ATT-UNPROT-BRT TO MMRRA                         ACAT14RC
               END-IF                                                   ACAT14RC
               IF  ACAT-SRCH-TFR = 'N'                                  ACAT14RC
                   MOVE -1             TO MMTFRL                        ACAT14RC
                   MOVE ATT-UNPROT-BRT TO MMTFRA                        ACAT14RC
               END-IF                                                   ACAT14RC
               IF  ACAT-SRCH-RD = 'N'                                   ACAT14RC
                   MOVE -1             TO MMRDL                         ACAT14RC
                   MOVE ATT-UNPROT-BRT TO MMRDA                         ACAT14RC
               END-IF                                                   ACAT14RC
               IF  ACAT-SRCH-CONTRA-BKR = 'N'                           ACAT14RC
                   MOVE -1             TO MMBKRL                        ACAT14RC
                   MOVE ATT-UNPROT-BRT TO MMBKRA                        ACAT14RC
               END-IF                                                   ACAT14RC
               IF  ACAT-SRCH-STATUS = 'N'                               ACAT14RC
                   MOVE -1             TO MMSTATL                       ACAT14RC
                   MOVE ATT-UNPROT-BRT TO MMSTATA                       ACAT14RC
               END-IF                                                   ACAT14RC
               IF  ACAT-SRCH-STTLDT = 'N'                               ACAT14RC
                   MOVE -1             TO MMSDL                         ACAT14RC
                   MOVE ATT-UNPROT-BRT TO MMSDA                         ACAT14RC
               END-IF                                                   ACAT14RC
           END-IF.                                                      ACAT14RC
       EJECT                                                            ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *             SEARCH ENGINE NEWLY ENTERED?                       *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       1750-CHECK-IF-SRCH-CHANGED.                                      ACAT14RC
           MOVE SPACE TO WS-SEARCH-CHANGED-SW.                          ACAT14RC
           IF TWA-MAP-MMBR NOT = TWA-PREV-MMBR                          ACAT14RC
              MOVE TWA-MAP-MMBR TO TWA-PREV-MMBR                        ACAT14RC
              SET WS-SEARCH-CHANGED TO TRUE.                            ACAT14RC
           IF TWA-MAP-MMAC NOT = TWA-PREV-MMAC                          ACAT14RC
              MOVE TWA-MAP-MMAC TO TWA-PREV-MMAC                        ACAT14RC
              SET WS-SEARCH-CHANGED TO TRUE.                            ACAT14RC
           IF TWA-MAP-MMRR NOT = TWA-PREV-MMRR                          ACAT14RC
              MOVE TWA-MAP-MMRR TO TWA-PREV-MMRR                        ACAT14RC
              SET WS-SEARCH-CHANGED TO TRUE.                            ACAT14RC
           IF TWA-MAP-MMTFR NOT = TWA-PREV-MMTFR                        ACAT14RC
              MOVE TWA-MAP-MMTFR TO TWA-PREV-MMTFR                      ACAT14RC
              SET WS-SEARCH-CHANGED TO TRUE.                            ACAT14RC
           IF TWA-MAP-MMRD NOT = TWA-PREV-MMRD                          ACAT14RC
              MOVE TWA-MAP-MMRD TO TWA-PREV-MMRD                        ACAT14RC
              SET WS-SEARCH-CHANGED TO TRUE.                            ACAT14RC
           IF TWA-MAP-MMBKR NOT = TWA-PREV-MMBKR                        ACAT14RC
              MOVE TWA-MAP-MMBKR TO TWA-PREV-MMBKR                      ACAT14RC
              SET WS-SEARCH-CHANGED TO TRUE.                            ACAT14RC
           IF TWA-MAP-MMSTAT NOT = TWA-PREV-MMSTAT                      ACAT14RC
              MOVE TWA-MAP-MMSTAT TO TWA-PREV-MMSTAT                    ACAT14RC
              SET WS-SEARCH-CHANGED TO TRUE.                            ACAT14RC
           IF TWA-MAP-MMSD NOT = TWA-PREV-MMSD                          ACAT14RC
              MOVE TWA-MAP-MMSD TO TWA-PREV-MMSD                        ACAT14RC
              SET WS-SEARCH-CHANGED TO TRUE.                            ACAT14RC
       EJECT                                                            ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *              POP-UP MENU ROUTINE                               *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       1800-SEND-POPUP-MAP-RTN.                                         ACAT14RC
           IF TWA-SCREEN = 'R'                                          ACAT14RC
              MOVE 'R' TO ACAT90CM-TS-SCREEN                            ACAT14RC
           ELSE                                                         ACAT14RC
           IF TWA-SCREEN = 'A'                                          ACAT14RC
              MOVE 'A' TO ACAT90CM-TS-SCREEN.                           ACAT14RC
                                                                        ACAT14RC
           PERFORM 7020-WRITE-TSQ-RTN.                                  ACAT14RC
           PERFORM 1810-ACAT90CM-TS-RTN.                                ACAT14RC
           MOVE '$' TO WS-ACAT-NEXT.                                    ACAT14RC
           MOVE 'ACAT90CM' TO CALLED-PROGRAM-NAME.                      ACAT14RC
           PERFORM 1820-INVOKE-DETAIL-PGM-RTN.                          ACAT14RC
                                                                        ACAT14RC
       EJECT                                                            ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *         TRANSFER CONTROL TO POP-UP MENU PGM                    *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       1810-ACAT90CM-TS-RTN.                                            ACAT14RC
           MOVE 'ACA$'   TO TRAN-ID.                                    ACAT14RC
           EXEC CICS DELETEQ TS QUEUE(TSQ-NAME)                         ACAT14RC
           END-EXEC.                                                    ACAT14RC
           IF TWA-INQUIRY-ONLY                                          ACAT14RC
              MOVE SPACE TO ACAT90CM-TS-UPDATE-IND                      ACAT14RC
           ELSE                                                         ACAT14RC
              MOVE 'Y'   TO ACAT90CM-TS-UPDATE-IND.                     ACAT14RC
           IF ACAT90CM-TS-SCREEN = 'A'                                  ACAT14RC
              MOVE TWA-SAVE-CMNTS  TO ACAT90CM-TS-MCCMNT-X120.          ACAT14RC
           MOVE TWA-MAP-BR     TO ACAT90CM-TS-MBR.                      ACAT14RC
           MOVE TWA-MAP-AC     TO ACAT90CM-TS-MAC.                      ACAT14RC
           MOVE TWA-MAP-RR     TO ACAT90CM-TS-MRR.                      ACAT14RC
           MOVE TWA-MAP-CTYPE  TO ACAT90CM-TS-MCTYPE.                   ACAT14RC
           MOVE TWA-MAP-CBRKR  TO ACAT90CM-TS-MCBRKR.                   ACAT14RC
           MOVE TWA-MAP-CACCT  TO ACAT90CM-TS-MCACCT.                   ACAT14RC
           MOVE TWA-MAP-CUSIP  TO ACAT90CM-TS-MNAME.                    ACAT14RC
           MOVE TWA-MAP-NAME   TO ACAT90CM-TS-MNAME2.                   ACAT14RC
           MOVE TWA-MAP-NAME2  TO ACAT90CM-TS-MNAME3.                   ACAT14RC
           MOVE 'ACA$' TO TRAN-ID.                                      ACAT14RC
           MOVE +1     TO ITEM-NUM.                                     ACAT14RC
           EXEC CICS WRITEQ TS QUEUE(TSQ-NAME)                          ACAT14RC
                               FROM(ACAT90CM-TS-AREA)                   ACAT14RC
                               LENGTH(LENGTH OF ACAT90CM-TS-AREA)       ACAT14RC
                               ITEM(ITEM-NUM)                           ACAT14RC
           END-EXEC.                                                    ACAT14RC
           IF EIBRESP NOT = +0                                          ACAT14RC
              MOVE LOW-VALUE TO ACAT14MO                                ACAT14RC
              MOVE 'ACAT14 WRITE TSQ ERROR ON ACA$'                     ACAT14RC
                TO SYSTEM-MSG                                           ACAT14RC
           END-IF.                                                      ACAT14RC
                                                                        ACAT14RC
       1820-INVOKE-DETAIL-PGM-RTN.                                      ACAT14RC
           EXEC CICS XCTL PROGRAM(CALLED-PROGRAM-NAME)                  ACAT14RC
                          COMMAREA(ACATCOMM-COMMAREA)                   ACAT14RC
           END-EXEC.                                                    ACAT14RC
           MOVE CALLED-PROGRAM-NAME TO ERROR-PROG-NAME.                 ACAT14RC
           MOVE 'M' TO ACAT-NEXT.                                       ACAT14RC
           MOVE ERROR-PROG-MSG    TO SYSTEM-MSG.                        ACAT14RC
           MOVE LOW-VALUE TO ACAT14MO.                                  ACAT14RC
           MOVE SPACES    TO ACAT-CALLING-PROG-NAME.                    ACAT14RC
       EJECT                                                            ACAT14RC
       1900-BR-AE-SECURITY.                                             ACAT14RC
           INITIALIZE ACAT-SRCH-COMM-AREA.                              ACAT14RC
           SET SECURITY-LOOKUP      TO TRUE.                            ACAT14RC
           MOVE ACAT14-TFR-DLVR-ACCT(1:3)   TO SRCH-INP-BRANCH.         ACAT14RC
           MOVE ACAT14-TFR-RR               TO SRCH-INP-RR.             ACAT14RC
           EXEC CICS LINK                                               ACAT14RC
                     PROGRAM('ACATSRCH')                                ACAT14RC
                     COMMAREA(ACAT-SRCH-COMM-AREA)                      ACAT14RC
                     LENGTH(LENGTH OF ACAT-SRCH-COMM-AREA)              ACAT14RC
           END-EXEC.                                                    ACAT14RC
                                                                        ACAT14RC
           EJECT                                                        ACAT14RC
       1910-CALL-SECLINK-RTN.                                           ACAT14RC
           EXEC CICS LINK PROGRAM ('SECLINK')                           ACAT14RC
                COMMAREA(SECLINK-LIST)                                  ACAT14RC
                LENGTH(LENGTH OF SECLINK-LIST)                          ACAT14RC
           END-EXEC.                                                    ACAT14RC
                                                                        ACAT14RC
       EJECT                                                            ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *              VALIDATE REASON CODE                              *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       2000-VALIDATE-REASON-CODE.                                       ACAT14RC
      **<< BALANCE 01 REASON CODE >>                                    ACAT14RC
           IF MRSON1L > 0                                               ACAT14RC
              IF MRSON1O = TWA-MAP-RSON1                                ACAT14RC
                 CONTINUE                                               ACAT14RC
              ELSE                                                      ACAT14RC
                 MOVE MRSON1O TO TWA-MAP-RSON1                          ACAT14RC
              END-IF                                                    ACAT14RC
           ELSE                                                         ACAT14RC
           IF MRSON1A = ERASE-KEY                                       ACAT14RC
              MOVE SPACE TO TWA-MAP-RSON1.                              ACAT14RC
           IF TWA-MAP-RSON1 = LOW-VALUE                                 ACAT14RC
              MOVE SPACE TO TWA-MAP-RSON1.                              ACAT14RC
                                                                        ACAT14RC
           IF TWA-MAP-BAL01 > SPACE                                     ACAT14RC
              MOVE ATT-UNPROT TO MRSON1A                                ACAT14RC
              IF TWA-MAP-RSON1 = SPACE                                  ACAT14RC
                 CONTINUE                                               ACAT14RC
              ELSE                                                      ACAT14RC
              IF TWA-MAP-RSON1 = '01' OR '02' OR '03' OR '04' OR        ACAT14RC
                                 '05' OR '06' OR '07' OR '08' OR        ACAT14RC
                                 '09' OR '10' OR '11' OR '12' OR '13'   ACAT14RC
                 CONTINUE                                               ACAT14RC
              ELSE                                                      ACAT14RC
              IF TWA-MAP-RSON1 (1:1) = '?' OR                           ACAT14RC
                 TWA-MAP-RSON1 (2:1) = '?'                              ACAT14RC
                   MOVE 'R' TO TWA-SCREEN                               ACAT14RC
                   PERFORM 1800-SEND-POPUP-MAP-RTN                      ACAT14RC
              ELSE                                                      ACAT14RC
                  MOVE -1  TO MRSON1L                                   ACAT14RC
                  MOVE ATT-UNPROT-BRT TO MRSON1A                        ACAT14RC
                  IF NOT WS-ERROR                                       ACAT14RC
                     SET WS-ERROR     TO TRUE                           ACAT14RC
                     MOVE 'INVALID REASON CODE - TYPE "?" TO SELECT THE ACAT14RC
      -                   'VALID REASON CODE'                           ACAT14RC
                       TO  SYSTEM-MSG                                   ACAT14RC
                  END-IF.                                               ACAT14RC
                                                                        ACAT14RC
      **<< BALANCE 02 REASON CODE >>                                    ACAT14RC
           IF MRSON2L > 0                                               ACAT14RC
              IF MRSON2O = TWA-MAP-RSON2                                ACAT14RC
                 CONTINUE                                               ACAT14RC
              ELSE                                                      ACAT14RC
                 MOVE MRSON2O TO TWA-MAP-RSON2                          ACAT14RC
              END-IF                                                    ACAT14RC
           ELSE                                                         ACAT14RC
           IF MRSON2A = ERASE-KEY                                       ACAT14RC
              MOVE SPACE TO TWA-MAP-RSON2.                              ACAT14RC
           IF TWA-MAP-RSON2 = LOW-VALUE                                 ACAT14RC
              MOVE SPACE TO TWA-MAP-RSON2.                              ACAT14RC
                                                                        ACAT14RC
           IF TWA-MAP-BAL02 > SPACE                                     ACAT14RC
              MOVE ATT-UNPROT TO MRSON2A                                ACAT14RC
              IF TWA-MAP-RSON2 = SPACE                                  ACAT14RC
                 CONTINUE                                               ACAT14RC
              ELSE                                                      ACAT14RC
              IF TWA-MAP-RSON2 = '01' OR '02' OR '03' OR '04' OR        ACAT14RC
                                 '05' OR '06' OR '07' OR '08' OR        ACAT14RC
                                 '09' OR '10' OR '11' OR '12' OR '13'   ACAT14RC
                 CONTINUE                                               ACAT14RC
              ELSE                                                      ACAT14RC
              IF TWA-MAP-RSON2 (1:1) = '?' OR                           ACAT14RC
                 TWA-MAP-RSON2 (2:1) = '?'                              ACAT14RC
                   MOVE 'R' TO TWA-SCREEN                               ACAT14RC
                   PERFORM 1800-SEND-POPUP-MAP-RTN                      ACAT14RC
              ELSE                                                      ACAT14RC
                  MOVE -1  TO MRSON2L                                   ACAT14RC
                  MOVE ATT-UNPROT-BRT TO MRSON2A                        ACAT14RC
                  IF NOT WS-ERROR                                       ACAT14RC
                     SET WS-ERROR     TO TRUE                           ACAT14RC
                     MOVE 'INVALID REASON CODE - TYPE "?" TO SELECT THE ACAT14RC
      -                   'VALID REASON CODE'                           ACAT14RC
                       TO  SYSTEM-MSG                                   ACAT14RC
                  END-IF.                                               ACAT14RC
                                                                        ACAT14RC
      **<< BALANCE 05 REASON CODE >>                                    ACAT14RC
           IF MRSON3L > 0                                               ACAT14RC
              IF MRSON3O = TWA-MAP-RSON3                                ACAT14RC
                 CONTINUE                                               ACAT14RC
              ELSE                                                      ACAT14RC
                 MOVE MRSON3O TO TWA-MAP-RSON3                          ACAT14RC
              END-IF                                                    ACAT14RC
           ELSE                                                         ACAT14RC
           IF MRSON3A = ERASE-KEY                                       ACAT14RC
              MOVE SPACE TO TWA-MAP-RSON3.                              ACAT14RC
           IF TWA-MAP-RSON3 = LOW-VALUE                                 ACAT14RC
              MOVE SPACE TO TWA-MAP-RSON3.                              ACAT14RC
                                                                        ACAT14RC
           IF TWA-MAP-BAL05 > SPACE                                     ACAT14RC
              MOVE ATT-UNPROT TO MRSON3A                                ACAT14RC
              IF TWA-MAP-RSON3 = SPACE                                  ACAT14RC
                 CONTINUE                                               ACAT14RC
              ELSE                                                      ACAT14RC
              IF TWA-MAP-RSON3 = '01' OR '02' OR '03' OR '04' OR        ACAT14RC
                                 '05' OR '06' OR '07' OR '08' OR        ACAT14RC
                                 '09' OR '10' OR '11' OR '12' OR '13'   ACAT14RC
                 CONTINUE                                               ACAT14RC
              ELSE                                                      ACAT14RC
              IF TWA-MAP-RSON3 (1:1) = '?' OR                           ACAT14RC
                 TWA-MAP-RSON3 (2:1) = '?'                              ACAT14RC
                   MOVE 'R' TO TWA-SCREEN                               ACAT14RC
                   PERFORM 1800-SEND-POPUP-MAP-RTN                      ACAT14RC
              ELSE                                                      ACAT14RC
                  MOVE -1  TO MRSON3L                                   ACAT14RC
                  MOVE ATT-UNPROT-BRT TO MRSON3A                        ACAT14RC
                  IF NOT WS-ERROR                                       ACAT14RC
                     SET WS-ERROR     TO TRUE                           ACAT14RC
                     MOVE 'INVALID REASON CODE - TYPE "?" TO SELECT THE ACAT14RC
      -                   'VALID REASON CODE'                           ACAT14RC
                       TO  SYSTEM-MSG                                   ACAT14RC
                  END-IF.                                               ACAT14RC
                                                                        ACAT14RC
      **<< SECURITY REASON CODE >>                                      ACAT14RC
           IF MRSON4L > 0                                               ACAT14RC
              IF MRSON4O = TWA-MAP-RSON4                                ACAT14RC
                 CONTINUE                                               ACAT14RC
              ELSE                                                      ACAT14RC
                 MOVE MRSON4O TO TWA-MAP-RSON4                          ACAT14RC
              END-IF                                                    ACAT14RC
           ELSE                                                         ACAT14RC
           IF MRSON4A = ERASE-KEY                                       ACAT14RC
              MOVE SPACE TO TWA-MAP-RSON4.                              ACAT14RC
           IF TWA-MAP-RSON4 = LOW-VALUE                                 ACAT14RC
              MOVE SPACE TO TWA-MAP-RSON4.                              ACAT14RC
                                                                        ACAT14RC
           IF TWA-MAP-QTY > SPACE                                       ACAT14RC
              MOVE ATT-UNPROT TO MRSON4A                                ACAT14RC
              IF TWA-MAP-RSON4 = SPACE OR                               ACAT14RC
                                 '01' OR '02' OR '03' OR '04' OR        ACAT14RC
                                 '05' OR '06' OR '07' OR '08' OR        ACAT14RC
                                 '09' OR '10' OR '11' OR '12' OR '13'   ACAT14RC
                 MOVE TWA-AST-PAGE-NUM TO ASSET-ITEM                    ACAT14RC
                 PERFORM 7200-READ-ASSET-TSQ                            ACAT14RC
                 MOVE TWA-MAP-RSON4 TO TS-REASON                        ACAT14RC
                 PERFORM 7230-REWRITE-ASSET-TSQ                         ACAT14RC
              ELSE                                                      ACAT14RC
              IF TWA-MAP-RSON4 (1:1) = '?' OR                           ACAT14RC
                 TWA-MAP-RSON4 (2:1) = '?'                              ACAT14RC
                   MOVE 'R' TO TWA-SCREEN                               ACAT14RC
                   PERFORM 1800-SEND-POPUP-MAP-RTN                      ACAT14RC
              ELSE                                                      ACAT14RC
                  MOVE -1  TO MRSON4L                                   ACAT14RC
                  MOVE ATT-UNPROT-BRT TO MRSON4A                        ACAT14RC
                  IF NOT WS-ERROR                                       ACAT14RC
                     SET WS-ERROR     TO TRUE                           ACAT14RC
                     MOVE 'INVALID REASON CODE - TYPE "?" TO SELECT THE ACAT14RC
      -                   'VALID REASON CODE'                           ACAT14RC
                       TO  SYSTEM-MSG                                   ACAT14RC
                  END-IF.                                               ACAT14RC
       EJECT                                                            ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *              VALIDATE AMOUNT FIELDS                            *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       3000-VALIDATE-AMOUNT-FIELDS.                                     ACAT14RC
           IF (MBAL01L > 0)                                             ACAT14RC
           OR (MBAL02L > 0)                                             ACAT14RC
           OR (MBAL05L > 0)                                             ACAT14RC
               PERFORM 3100-BALIO THRU 3100-EXIT                        ACAT14RC
           END-IF.                                                      ACAT14RC
                                                                        ACAT14RC
      **<< BALANCE 01 >>                                                ACAT14RC
           IF MBAL01L > 0                                               ACAT14RC
              IF MBAL01O = TWA-MAP-BAL01                                ACAT14RC
                 CONTINUE                                               ACAT14RC
              ELSE                                                      ACAT14RC
                 MOVE MBAL01O   TO WS-AMT-IN                            ACAT14RC
                 MOVE ' '       TO WS-AMT-RET-CODE                      ACAT14RC
                 MOVE 0         TO WS-AMT-OUT                           ACAT14RC
                 EXEC CICS LINK PROGRAM('ACATEDIT')                     ACAT14RC
                                COMMAREA(EDIT-AMT-AREA)                 ACAT14RC
                                LENGTH(LENGTH OF EDIT-AMT-AREA)         ACAT14RC
                 END-EXEC                                               ACAT14RC
                 IF WS-AMT-RET-CODE = SPACE                             ACAT14RC
                    IF WS-AMT-OUT > 0                                   ACAT14RC
                       MOVE -1             TO MBAL01L                   ACAT14RC
                       MOVE ATT-UNPROT-BRT TO MBAL01A                   ACAT14RC
                       SET WS-ERROR        TO TRUE                      ACAT14RC
                       MOVE 'DEBIT BALANCE NOT ALLOWED FOR RCR'         ACAT14RC
                       TO SYSTEM-MSG                                    ACAT14RC
                       PERFORM 8800-ERROR-RTN                           ACAT14RC
                    ELSE                                                ACAT14RC
                     IF WS-AMT-OUT < WS-MRGN-BAL01                      ACAT14RC
                        MOVE -1             TO MBAL01L                  ACAT14RC
                        MOVE ATT-UNPROT-BRT TO MBAL01A                  ACAT14RC
                        SET WS-ERROR        TO TRUE                     ACAT14RC
                        MOVE WS-MRGN-BAL01  TO WS-MRGN-BAL-MSG-AMT      ACAT14RC
                        MOVE WS-MRGN-BAL-MSG TO SYSTEM-MSG              ACAT14RC
                        PERFORM 8800-ERROR-RTN                          ACAT14RC
                     ELSE                                               ACAT14RC
                        MOVE WS-AMT-OUT      TO WS-AMT-DISPLAY          ACAT14RC
                                                TWA-BAL01-9             ACAT14RC
                        MOVE WS-AMT-DISPLAY  TO MBAL01O                 ACAT14RC
                                                TWA-MAP-BAL01           ACAT14RC
                        PERFORM 3301-UPDATE-BAL01                       ACAT14RC
                     END-IF                                             ACAT14RC
                    END-IF                                              ACAT14RC
                 ELSE                                                   ACAT14RC
                    MOVE -1             TO MBAL01L                      ACAT14RC
                    MOVE ATT-UNPROT-BRT TO MBAL01A                      ACAT14RC
                    SET WS-ERROR        TO TRUE                         ACAT14RC
                    MOVE 'BALANCE IS INVALID' TO SYSTEM-MSG             ACAT14RC
                    PERFORM 8800-ERROR-RTN                              ACAT14RC
              END-IF                                                    ACAT14RC
           ELSE                                                         ACAT14RC
              IF MBAL01A = ERASE-KEY                                    ACAT14RC
                 MOVE SPACE TO TWA-MAP-BAL01                            ACAT14RC
                 MOVE 0     TO TWA-BAL01-9                              ACAT14RC
              END-IF                                                    ACAT14RC
           END-IF.                                                      ACAT14RC
                                                                        ACAT14RC
      **<< BALANCE 02 >>                                                ACAT14RC
           IF MBAL02L > 0                                               ACAT14RC
              IF MBAL02O = TWA-MAP-BAL02                                ACAT14RC
                 CONTINUE                                               ACAT14RC
              ELSE                                                      ACAT14RC
                 MOVE MBAL02O   TO WS-AMT-IN                            ACAT14RC
                 MOVE ' '       TO WS-AMT-RET-CODE                      ACAT14RC
                 MOVE 0         TO WS-AMT-OUT                           ACAT14RC
                 EXEC CICS LINK PROGRAM('ACATEDIT')                     ACAT14RC
                                COMMAREA(EDIT-AMT-AREA)                 ACAT14RC
                                LENGTH(LENGTH OF EDIT-AMT-AREA)         ACAT14RC
                 END-EXEC                                               ACAT14RC
                 IF WS-AMT-RET-CODE = SPACE                             ACAT14RC
                    IF WS-AMT-OUT > 0                                   ACAT14RC
                       MOVE -1             TO MBAL02L                   ACAT14RC
                       MOVE ATT-UNPROT-BRT TO MBAL02A                   ACAT14RC
                       SET WS-ERROR        TO TRUE                      ACAT14RC
                       MOVE 'DEBIT BALANCE NOT ALLOWED FOR RCR'         ACAT14RC
                       TO SYSTEM-MSG                                    ACAT14RC
                       PERFORM 8800-ERROR-RTN                           ACAT14RC
                    ELSE                                                ACAT14RC
                     IF WS-AMT-OUT < WS-MRGN-BAL02                      ACAT14RC
                        MOVE -1             TO MBAL02L                  ACAT14RC
                        MOVE ATT-UNPROT-BRT TO MBAL02A                  ACAT14RC
                        SET WS-ERROR        TO TRUE                     ACAT14RC
                        MOVE WS-MRGN-BAL02  TO WS-MRGN-BAL-MSG-AMT      ACAT14RC
                        MOVE WS-MRGN-BAL-MSG TO SYSTEM-MSG              ACAT14RC
                        PERFORM 8800-ERROR-RTN                          ACAT14RC
                     ELSE                                               ACAT14RC
                        MOVE WS-AMT-OUT      TO WS-AMT-DISPLAY          ACAT14RC
                                                TWA-BAL02-9             ACAT14RC
                        MOVE WS-AMT-DISPLAY  TO MBAL02O                 ACAT14RC
                                                TWA-MAP-BAL02           ACAT14RC
                        PERFORM 3302-UPDATE-BAL02                       ACAT14RC
                     END-IF                                             ACAT14RC
                    END-IF                                              ACAT14RC
                 ELSE                                                   ACAT14RC
                    MOVE -1             TO MBAL02L                      ACAT14RC
                    MOVE ATT-UNPROT-BRT TO MBAL02A                      ACAT14RC
                    SET WS-ERROR        TO TRUE                         ACAT14RC
                    MOVE 'BALANCE IS INVALID' TO SYSTEM-MSG             ACAT14RC
                    PERFORM 8800-ERROR-RTN                              ACAT14RC
              END-IF                                                    ACAT14RC
           ELSE                                                         ACAT14RC
              IF MBAL02A = ERASE-KEY                                    ACAT14RC
                 MOVE SPACE TO TWA-MAP-BAL02                            ACAT14RC
                 MOVE 0     TO TWA-BAL02-9                              ACAT14RC
              END-IF                                                    ACAT14RC
           END-IF.                                                      ACAT14RC
                                                                        ACAT14RC
      **<< BALANCE 05 >>                                                ACAT14RC
           IF MBAL05L > 0                                               ACAT14RC
              IF MBAL05O = TWA-MAP-BAL05                                ACAT14RC
                 CONTINUE                                               ACAT14RC
              ELSE                                                      ACAT14RC
                 MOVE MBAL05O   TO WS-AMT-IN                            ACAT14RC
                 MOVE ' '       TO WS-AMT-RET-CODE                      ACAT14RC
                 MOVE 0         TO WS-AMT-OUT                           ACAT14RC
                 EXEC CICS LINK PROGRAM('ACATEDIT')                     ACAT14RC
                                COMMAREA(EDIT-AMT-AREA)                 ACAT14RC
                                LENGTH(LENGTH OF EDIT-AMT-AREA)         ACAT14RC
                 END-EXEC                                               ACAT14RC
                 IF WS-AMT-RET-CODE = SPACE                             ACAT14RC
                    IF WS-AMT-OUT > 0                                   ACAT14RC
                       MOVE -1             TO MBAL05L                   ACAT14RC
                       MOVE ATT-UNPROT-BRT TO MBAL05A                   ACAT14RC
                       SET WS-ERROR        TO TRUE                      ACAT14RC
                       MOVE 'DEBIT BALANCE NOT ALLOWED FOR RCR'         ACAT14RC
                       TO SYSTEM-MSG                                    ACAT14RC
                       PERFORM 8800-ERROR-RTN                           ACAT14RC
                    ELSE                                                ACAT14RC
                     IF WS-AMT-OUT < WS-MRGN-BAL05                      ACAT14RC
                        MOVE -1             TO MBAL05L                  ACAT14RC
                        MOVE ATT-UNPROT-BRT TO MBAL05A                  ACAT14RC
                        SET WS-ERROR        TO TRUE                     ACAT14RC
                        MOVE WS-MRGN-BAL05  TO WS-MRGN-BAL-MSG-AMT      ACAT14RC
                        MOVE WS-MRGN-BAL-MSG TO SYSTEM-MSG              ACAT14RC
                        PERFORM 8800-ERROR-RTN                          ACAT14RC
                     ELSE                                               ACAT14RC
                        MOVE WS-AMT-OUT     TO WS-AMT-DISPLAY           ACAT14RC
                                               TWA-BAL05-9              ACAT14RC
                        MOVE WS-AMT-DISPLAY TO MBAL05O                  ACAT14RC
                                               TWA-MAP-BAL05            ACAT14RC
                        PERFORM 3305-UPDATE-BAL05                       ACAT14RC
                     END-IF                                             ACAT14RC
                    END-IF                                              ACAT14RC
                 ELSE                                                   ACAT14RC
                    MOVE -1             TO MBAL05L                      ACAT14RC
                    MOVE ATT-UNPROT-BRT TO MBAL05A                      ACAT14RC
                    SET WS-ERROR        TO TRUE                         ACAT14RC
                    MOVE 'BALANCE IS INVALID' TO SYSTEM-MSG             ACAT14RC
                    PERFORM 8800-ERROR-RTN                              ACAT14RC
              END-IF                                                    ACAT14RC
           ELSE                                                         ACAT14RC
              IF MBAL05A = ERASE-KEY                                    ACAT14RC
                 MOVE SPACE TO TWA-MAP-BAL05                            ACAT14RC
                 MOVE 0     TO TWA-BAL05-9                              ACAT14RC
              END-IF                                                    ACAT14RC
           END-IF.                                                      ACAT14RC
                                                                        ACAT14RC
      **<< CD >>                                                        ACAT14RC
           IF MCDL > 0                                                  ACAT14RC
              IF MCDO = ' '                                             ACAT14RC
                 MOVE SPACE TO TWA-MAP-CD                               ACAT14RC
LRM007           IF TS-ORIG-WTHLD-CD = 'W'                              ACAT14RC
LRM007           AND TWA-WHI-STTS-CD = 'C'                              ACAT14RC
LRM007              MOVE TS-ORIG-WTHLD-CD TO MCDO TWA-MAP-CD            ACAT14RC
LRM007              MOVE -1             TO MCDL                         ACAT14RC
LRM007              MOVE ATT-UNPROT-BRT TO MCDA                         ACAT14RC
LRM007              SET WS-ERROR        TO TRUE                         ACAT14RC
LRM007              MOVE 'WARNING - SUBMITTING CONTRA CUSIP'            ACAT14RC
LRM007                TO SYSTEM-MSG                                     ACAT14RC
LRM007              MOVE SPACES TO TWA-WHI-STTS-CD                      ACAT14RC
LRM007              PERFORM 8800-ERROR-RTN                              ACAT14RC
LRM007           END-IF                                                 ACAT14RC
              ELSE                                                      ACAT14RC
                 MOVE MCDO  TO TWA-MAP-CD                               ACAT14RC
LRM005           IF MCDI = ' ' OR 'C' OR 'W'                            ACAT14RC
                    CONTINUE                                            ACAT14RC
                 ELSE                                                   ACAT14RC
                    MOVE -1             TO MCDL                         ACAT14RC
                    MOVE ATT-UNPROT-BRT TO MCDA                         ACAT14RC
                    SET WS-ERROR        TO TRUE                         ACAT14RC
LRM005              MOVE 'CD IS INVALID - C=CHANGE - W=WITHHELD'        ACAT14RC
                    TO SYSTEM-MSG                                       ACAT14RC
                    PERFORM 8800-ERROR-RTN                              ACAT14RC
                 END-IF                                                 ACAT14RC
LRM007           IF TS-ORIG-WTHLD-CD = 'W'                              ACAT14RC
LRM007           AND TWA-MAP-CD NOT = 'W'                               ACAT14RC
LRM007           AND TWA-WHI-STTS-CD = 'C'                              ACAT14RC
LRM007              MOVE TS-ORIG-WTHLD-CD TO MCDO TWA-MAP-CD            ACAT14RC
LRM007              MOVE -1             TO MCDL                         ACAT14RC
LRM007              MOVE ATT-UNPROT-BRT TO MCDA                         ACAT14RC
LRM007              SET WS-ERROR        TO TRUE                         ACAT14RC
LRM007              MOVE 'WARNING - SUBMITTING CONTRA CUSIP'            ACAT14RC
LRM007                TO SYSTEM-MSG                                     ACAT14RC
LRM007              MOVE SPACES TO TWA-WHI-STTS-CD                      ACAT14RC
LRM007              PERFORM 8800-ERROR-RTN                              ACAT14RC
LRM007           END-IF                                                 ACAT14RC
              END-IF                                                    ACAT14RC
           ELSE                                                         ACAT14RC
              IF MCDA = ERASE-KEY                                       ACAT14RC
              OR TWA-MAP-CD = LOW-VALUE                                 ACAT14RC
                 MOVE SPACE TO TWA-MAP-CD                               ACAT14RC
LRM007           IF TS-ORIG-WTHLD-CD = 'W'                              ACAT14RC
LRM007           AND TWA-WHI-STTS-CD = 'C'                              ACAT14RC
LRM007              MOVE TS-ORIG-WTHLD-CD TO MCDO TWA-MAP-CD            ACAT14RC
LRM007              MOVE -1             TO MCDL                         ACAT14RC
LRM007              MOVE ATT-UNPROT-BRT TO MCDA                         ACAT14RC
LRM007              SET WS-ERROR        TO TRUE                         ACAT14RC
LRM007              MOVE 'WARNING - SUBMITTING CONTRA CUSIP'            ACAT14RC
LRM007                TO SYSTEM-MSG                                     ACAT14RC
LRM007              MOVE SPACES TO TWA-WHI-STTS-CD                      ACAT14RC
LRM007              PERFORM 8800-ERROR-RTN                              ACAT14RC
LRM007           END-IF                                                 ACAT14RC
              END-IF                                                    ACAT14RC
           END-IF.                                                      ACAT14RC
                                                                        ACAT14RC
           IF MQTYL > 0                                                 ACAT14RC
           OR MAMTL > 0                                                 ACAT14RC
              IF MCDI = 'C'                                             ACAT14RC
                 CONTINUE                                               ACAT14RC
              ELSE                                                      ACAT14RC
                 MOVE -1             TO MCDL                            ACAT14RC
                 MOVE ATT-UNPROT-BRT TO MCDA                            ACAT14RC
                 SET WS-ERROR        TO TRUE                            ACAT14RC
                 MOVE 'CD IS REQUIRED - C=CHANGE'                       ACAT14RC
                 TO SYSTEM-MSG                                          ACAT14RC
                 PERFORM 8800-ERROR-RTN                                 ACAT14RC
              END-IF                                                    ACAT14RC
           END-IF.                                                      ACAT14RC
                                                                        ACAT14RC
           IF (MQTYL   > 0)                                             ACAT14RC
               PERFORM 3200-HOLIO THRU 3200-EXIT                        ACAT14RC
           END-IF.                                                      ACAT14RC
                                                                        ACAT14RC
      **<< QUANTITY   >>                                                ACAT14RC
           IF MQTYL > 0                                                 ACAT14RC
              IF MQTYO = TWA-MAP-QTY                                    ACAT14RC
                 CONTINUE                                               ACAT14RC
              ELSE                                                      ACAT14RC
                 MOVE MQTYO     TO WS-QTY-IN                            ACAT14RC
                 MOVE ' '       TO WS-QTY-RET-CODE                      ACAT14RC
                 MOVE 0         TO WS-QTY-OUT                           ACAT14RC
                 EXEC CICS LINK PROGRAM('ACATEDIT')                     ACAT14RC
                                COMMAREA(EDIT-QTY-AREA)                 ACAT14RC
                                LENGTH(LENGTH OF EDIT-QTY-AREA)         ACAT14RC
                 END-EXEC                                               ACAT14RC
                 IF WS-QTY-RET-CODE = SPACE                             ACAT14RC
                    IF WS-QTY-OUT-D4 < 0                                ACAT14RC
                       MOVE -1             TO MQTYL                     ACAT14RC
                       MOVE ATT-UNPROT-BRT TO MQTYA                     ACAT14RC
                       SET WS-ERROR        TO TRUE                      ACAT14RC
                       MOVE 'SHORT QUANTITY NOT ALLOWED FOR RCR'        ACAT14RC
                       TO SYSTEM-MSG                                    ACAT14RC
                       PERFORM 8800-ERROR-RTN                           ACAT14RC
                    ELSE                                                ACAT14RC
                       IF WS-QTY-OUT-D4 <= WS-MRGN-QTY                  ACAT14RC
                          MOVE WS-QTY-OUT-D4  TO WS-AMT-DISPLAY         ACAT14RC
                                                 TWA-QTY-9              ACAT14RC
                          MOVE WS-AMT-DISPLAY TO MQTYO                  ACAT14RC
                                                 TWA-MAP-QTY            ACAT14RC
                       ELSE                                             ACAT14RC
                          MOVE -1             TO MQTYL                  ACAT14RC
                          MOVE ATT-UNPROT-BRT TO MQTYA                  ACAT14RC
                          SET WS-ERROR        TO TRUE                   ACAT14RC
                          MOVE WS-MRGN-QTY    TO WS-MRGN-QTY-MSG-QTY    ACAT14RC
                          MOVE WS-MRGN-QTY-MSG TO SYSTEM-MSG            ACAT14RC
                          PERFORM 8800-ERROR-RTN                        ACAT14RC
                    END-IF                                              ACAT14RC
                 ELSE                                                   ACAT14RC
                    MOVE -1             TO MQTYL                        ACAT14RC
                    MOVE ATT-UNPROT-BRT TO MQTYA                        ACAT14RC
                    SET WS-ERROR        TO TRUE                         ACAT14RC
                    MOVE 'QUANTITY IS INVALID'                          ACAT14RC
                    TO SYSTEM-MSG                                       ACAT14RC
                    PERFORM 8800-ERROR-RTN                              ACAT14RC
                 END-IF                                                 ACAT14RC
              END-IF                                                    ACAT14RC
           ELSE                                                         ACAT14RC
              IF MQTYA = ERASE-KEY                                      ACAT14RC
                 MOVE SPACE TO TWA-MAP-QTY                              ACAT14RC
                 MOVE 0     TO TWA-QTY-9                                ACAT14RC
              END-IF                                                    ACAT14RC
           END-IF.                                                      ACAT14RC
                                                                        ACAT14RC
      **<< AMOUNT >>                                                    ACAT14RC
           IF MAMTL > 0                                                 ACAT14RC
              IF MAMTO = TWA-MAP-AMT                                    ACAT14RC
                 CONTINUE                                               ACAT14RC
              ELSE                                                      ACAT14RC
                 MOVE MAMTO     TO WS-AMT-IN                            ACAT14RC
                 MOVE ' '       TO WS-AMT-RET-CODE                      ACAT14RC
                 MOVE 0         TO WS-AMT-OUT                           ACAT14RC
                 EXEC CICS LINK PROGRAM('ACATEDIT')                     ACAT14RC
                                COMMAREA(EDIT-AMT-AREA)                 ACAT14RC
                                LENGTH(LENGTH OF EDIT-AMT-AREA)         ACAT14RC
                 END-EXEC                                               ACAT14RC
                 IF WS-AMT-RET-CODE = SPACE                             ACAT14RC
                    IF WS-AMT-OUT < 0                                   ACAT14RC
                       MOVE -1             TO MAMTL                     ACAT14RC
                       MOVE ATT-UNPROT-BRT TO MAMTA                     ACAT14RC
                       SET WS-ERROR        TO TRUE                      ACAT14RC
                       MOVE 'VALUE CANNOT BE NEGATIVE'                  ACAT14RC
                       TO SYSTEM-MSG                                    ACAT14RC
                       PERFORM 8800-ERROR-RTN                           ACAT14RC
                    ELSE                                                ACAT14RC
                        MOVE WS-AMT-OUT     TO WS-AMT-DISPLAY           ACAT14RC
                                               TWA-AMT-9                ACAT14RC
                        MOVE WS-AMT-DISPLAY TO MAMTO                    ACAT14RC
                                               TWA-MAP-AMT              ACAT14RC
                    END-IF                                              ACAT14RC
                 ELSE                                                   ACAT14RC
                    MOVE -1             TO MAMTL                        ACAT14RC
                    MOVE ATT-UNPROT-BRT TO MAMTA                        ACAT14RC
                    SET WS-ERROR        TO TRUE                         ACAT14RC
                    MOVE 'VALUE IS INVALID'                             ACAT14RC
                    TO SYSTEM-MSG                                       ACAT14RC
                    PERFORM 8800-ERROR-RTN                              ACAT14RC
                 END-IF                                                 ACAT14RC
              END-IF                                                    ACAT14RC
           ELSE                                                         ACAT14RC
              IF MAMTA = ERASE-KEY                                      ACAT14RC
                 MOVE -1             TO MAMTL                           ACAT14RC
                 MOVE ATT-UNPROT-BRT TO MAMTA                           ACAT14RC
                 SET WS-ERROR        TO TRUE                            ACAT14RC
                 MOVE 'VALUE IS REQUIRED'                               ACAT14RC
                 TO SYSTEM-MSG                                          ACAT14RC
                 PERFORM 8800-ERROR-RTN                                 ACAT14RC
              END-IF                                                    ACAT14RC
           END-IF.                                                      ACAT14RC
                                                                        ACAT14RC
           IF (TWA-AMT-9     < 0.01                                     ACAT14RC
               AND TWA-QTY-9 > 0)                                       ACAT14RC
              MOVE -1             TO MAMTL                              ACAT14RC
              MOVE ATT-UNPROT-BRT TO MAMTA                              ACAT14RC
              SET WS-ERROR        TO TRUE                               ACAT14RC
              MOVE 'VALUE MUST NOT BE LESS THAN 0.01'                   ACAT14RC
              TO SYSTEM-MSG                                             ACAT14RC
              PERFORM 8800-ERROR-RTN                                    ACAT14RC
           ELSE                                                         ACAT14RC
             IF (TWA-AMT-9  NOT = 0                                     ACAT14RC
                 AND TWA-QTY-9  = 0)                                    ACAT14RC
                MOVE -1             TO MAMTL                            ACAT14RC
                MOVE ATT-UNPROT-BRT TO MAMTA                            ACAT14RC
                SET WS-ERROR        TO TRUE                             ACAT14RC
                MOVE 'VALUE MUST BE ZERO IF QUANTITY IS ZERO'           ACAT14RC
                TO SYSTEM-MSG                                           ACAT14RC
                PERFORM 8800-ERROR-RTN                                  ACAT14RC
             END-IF                                                     ACAT14RC
           END-IF.                                                      ACAT14RC
                                                                        ACAT14RC
           IF NOT WS-ERROR                                              ACAT14RC
              IF (MCDI = 'C'                                            ACAT14RC
LRM005        OR (MCDI = 'W' AND MCDI NOT = TS-NSCC-WTHLD-CD)                   
LRM005        OR (MCDI = ' ' AND TS-NSCC-WTHLD-CD = 'W'))                       
LRM005           IF MCDI = 'W'                                                  
LRM005              MOVE MCDI        TO TS-NSCC-WTHLD-CD                        
LRM005                                  TWA-MAP-WTHLD-CD                        
LRM005                                  TWA-MAP-CD                      ACAT14RC
LRM005           ELSE                                                           
                    MOVE ' '            TO MCDO                         ACAT14RC
LRM005                                  TS-NSCC-WTHLD-CD                        
LRM005                                  TWA-MAP-WTHLD-CD                        
                                        TWA-MAP-CD                      ACAT14RC
LRM005           END-IF                                                         
                 PERFORM 3400-UPDATE-QTY-AMT                            ACAT14RC
                 MOVE 0              TO MQTYL                           ACAT14RC
                 MOVE 0              TO MAMTL                           ACAT14RC
                 MOVE ATT-UNPROT     TO MQTYA                           ACAT14RC
                 MOVE ATT-UNPROT     TO MAMTA                           ACAT14RC
              END-IF                                                    ACAT14RC
           END-IF.                                                      ACAT14RC
                                                                        ACAT14RC
       3000-EXIT. EXIT.                                                 ACAT14RC
       EJECT                                                            ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *    COMPARE BALANCE AGAINST MRGI BALANCE FILE                   *ACAT14RC
      *    INPUT CANNOT BE GREATER THAN WHAT IS ON THE FILE            *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       3100-BALIO.                                                      ACAT14RC
                                                                        ACAT14RC
           MOVE LOW-VALUES                      TO IOB-COMMAREA.        ACAT14RC
           MOVE 'R'                             TO IOB-FUNC-CODE.       ACAT14RC
           MOVE 'N'                             TO IOB-FUNC-CODE-NEW.   ACAT14RC
           MOVE TWA-CLIENT-NO                   TO WS-BALIO-CLIENT.     ACAT14RC
           MOVE TWA-MAP-BR                      TO WS-BALIO-BRANCH.     ACAT14RC
           MOVE TWA-MAP-AC                      TO WS-BALIO-ACCOUNT.    ACAT14RC
           MOVE ZERO                            TO WS-BALIO-CURR.       ACAT14RC
           MOVE WS-BALIO-KEY                    TO IOB-BAL-KEY.         ACAT14RC
           MOVE 'B'                             TO IOB-SHADOW-IND.      ACAT14RC
           MOVE ZERO                            TO WS-MRGN-BAL01        ACAT14RC
                                                   WS-MRGN-BAL02        ACAT14RC
                                                   WS-MRGN-BAL05        ACAT14RC
                                                                        ACAT14RC
           EXEC CICS LINK PROGRAM('CUSBALIO')                           ACAT14RC
                          COMMAREA(IOB-COMMAREA)                        ACAT14RC
                          LENGTH(LENGTH OF IOB-COMMAREA)                ACAT14RC
                          END-EXEC.                                     ACAT14RC
                                                                        ACAT14RC
           EVALUATE TRUE                                                ACAT14RC
               WHEN IOB-GOOD-RETURN   CONTINUE                          ACAT14RC
               WHEN IOB-INV-FUNC      GO TO 3101-BALIO-INVREQ           ACAT14RC
               WHEN IOB-FILE-CLOSED   GO TO 3102-BALIO-NOTOPEN          ACAT14RC
               WHEN IOB-NOT-FOUND     GO TO 3103-BALIO-NOTFOUND         ACAT14RC
               WHEN IOB-END-OF-FILE   GO TO 3104-BALIO-IOERROR          ACAT14RC
               WHEN IOB-TOP-OF-FILE   GO TO 3104-BALIO-IOERROR          ACAT14RC
               WHEN IOB-KEY-NOT-NUM   GO TO 3104-BALIO-IOERROR          ACAT14RC
               WHEN IOB-INV-SHADOW-IND GO TO 3104-BALIO-IOERROR         ACAT14RC
               WHEN IOB-OTHER-ERROR   GO TO 3104-BALIO-IOERROR          ACAT14RC
               WHEN OTHER             GO TO 3104-BALIO-IOERROR          ACAT14RC
           END-EVALUATE.                                                ACAT14RC
                                                                        ACAT14RC
           SET ADDRESS OF CMBL-CUSTOMER-BALANCE-SEGMENT                 ACAT14RC
                       TO IOB-RECORD-POINTER.                           ACAT14RC
                                                                        ACAT14RC
           IF WS-BALIO-KEY(1:14) NOT = CMBL-KEY(1:14)                   ACAT14RC
           OR CMBL-CURRENCY-CODE NOT = '000000'                         ACAT14RC
              GO TO 3100-EXIT.                                          ACAT14RC
                                                                        ACAT14RC
           IF CMBL-ACTYP1-PRESENT = 1                                   ACAT14RC
              MOVE CMBL1-TRADE-DATE-BAL-YSTDY (1) TO WS-MRGN-BAL01      ACAT14RC
              IF CMBL-MM-FUND-YEST NUMERIC                              ACAT14RC
                 SUBTRACT CMBL-MM-FUND-YEST     FROM WS-MRGN-BAL01      ACAT14RC
              END-IF                                                    ACAT14RC
           END-IF.                                                      ACAT14RC
LRM006     PERFORM READ-BANK-DEPOSIT-RTN.                                       
           IF CMBL-ACTYP2-PRESENT = 1                                   ACAT14RC
              MOVE CMBL2-TRADE-DATE-BAL-YSTDY (1) TO WS-MRGN-BAL02      ACAT14RC
           END-IF.                                                      ACAT14RC
           IF CMBL-ACTYP5-PRESENT = 1                                   ACAT14RC
              MOVE CMBL5-TRADE-DATE-BAL-YSTDY (1) TO WS-MRGN-BAL05      ACAT14RC
           END-IF.                                                      ACAT14RC
                                                                        ACAT14RC
       3100-EXIT. EXIT.                                                 ACAT14RC
                                                                        ACAT14RC
LRM006 READ-BANK-DEPOSIT-RTN.                                                   
LRM006     MOVE LOW-VALUE    TO LBB-COMMAREA                                    
LRM006     MOVE '0'              TO ACATRSIO-CLIENT-NBR(1:1)                    
LRM006     MOVE TWA-CLIENT-NO-X  TO ACATRSIO-CLIENT-NBR(2:3)                    
LRM006     MOVE TWA-MAP-BR     TO LBB-COMM-BRANCH                               
LRM006     MOVE TWA-MAP-AC     TO LBB-COMM-ACCOUNT                              
TEMP********  OBTAIN LIST OF BDF ADP NUMBERS FROM VRSTSEC M### ROWS             
LRM006     SET ACATRSIO-LOOKUP-BANK-DEPOSIT TO TRUE.                            
LRM006     MOVE ZERO TO ACATRSIO-BDF-COUNT                                      
LRM006     EXEC CICS LINK PROGRAM (WS-ACATRST)                                  
LRM006          COMMAREA(ACATRSTIO-CALL-AREA)                                   
LRM006          LENGTH(LENGTH OF ACATRSTIO-CALL-AREA)                           
LRM006     END-EXEC.                                                            
LRM006     IF ACATRSIO-FOUND                                                    
LRM006        MOVE TWA-CLIENT-NO-X       TO LBB-COMM-CLIENT-NO                  
LRM006        MOVE ACATRSIO-BDF-AREA     TO WS-BDF-SECURITY-TABLE               
LRM006        PERFORM VARYING SUB FROM 1 BY 1                                   
LRM006                UNTIL SUB > WS-BDF-COUNT                                  
LRM006           MOVE WS-BDF-SEC-ENTRY(SUB) TO LBB-COMM-SECURITY                
LRM006           EXEC CICS LINK PROGRAM(WS-MRGRLBB)                             
LRM006               COMMAREA(LB-BANK-COMM-AREA)                                
LRM006               LENGTH(LENGTH OF LB-BANK-COMM-AREA)                        
LRM006           END-EXEC                                                       
LRM006           IF LBB-COMM-GOOD-RETURN                                        
LRM006              SUBTRACT LBB-COMM-YEST-TOT-UNITS                            
LRM006                                         FROM WS-MRGN-BAL01               
LRM006           END-IF                                                         
LRM006        END-PERFORM                                                       
LRM006     END-IF.                                                              
       3101-BALIO-INVREQ.                                               ACAT14RC
            MOVE -1  TO MBAL01L                                         ACAT14RC
            MOVE EIBDS                   TO ERR-EIBDS.                  ACAT14RC
            MOVE 'BALIO INVALID REQUEST ERROR. CANNOT VERIFY ACCOUNT'   ACAT14RC
                  TO ERR-MSG2                                           ACAT14RC
            MOVE ERR-MSG TO SYSTEM-MSG.                                 ACAT14RC
            SET  WS-ERROR   TO TRUE                                     ACAT14RC
            PERFORM 8800-ERROR-RTN.                                     ACAT14RC
                                                                        ACAT14RC
       3102-BALIO-NOTOPEN.                                              ACAT14RC
            MOVE -1  TO MBAL01L                                         ACAT14RC
            MOVE EIBDS                   TO ERR-EIBDS.                  ACAT14RC
            MOVE 'BALIO FILE IS CLOSED. CANNOT VERIFY ACCOUNT'          ACAT14RC
                  TO ERR-MSG2                                           ACAT14RC
            MOVE ERR-MSG TO SYSTEM-MSG.                                 ACAT14RC
            SET  WS-ERROR   TO TRUE                                     ACAT14RC
            PERFORM 8800-ERROR-RTN.                                     ACAT14RC
                                                                        ACAT14RC
       3103-BALIO-NOTFOUND.                                             ACAT14RC
            MOVE EIBDS                   TO ERR-EIBDS.                  ACAT14RC
            MOVE 'BALIO RECORD NOT FOUND. CANNOT VERIFY ACCOUNT'        ACAT14RC
                  TO ERR-MSG2                                           ACAT14RC
            MOVE ERR-MSG TO SYSTEM-MSG.                                 ACAT14RC
            SET  WS-ERROR   TO TRUE                                     ACAT14RC
            PERFORM 8800-ERROR-RTN.                                     ACAT14RC
                                                                        ACAT14RC
       3104-BALIO-IOERROR.                                              ACAT14RC
            MOVE -1  TO MBAL01L                                         ACAT14RC
            MOVE EIBDS                   TO ERR-EIBDS.                  ACAT14RC
            MOVE 'BALIO I/O ERROR. CANNOT VERIFY ACCOUNT'               ACAT14RC
                  TO ERR-MSG2                                           ACAT14RC
            MOVE ERR-MSG TO SYSTEM-MSG.                                 ACAT14RC
            SET  WS-ERROR   TO TRUE                                     ACAT14RC
            PERFORM 8800-ERROR-RTN.                                     ACAT14RC
                                                                        ACAT14RC
       EJECT                                                            ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *    COMPARE QUANTITY AGAINST MRGI HOLDERS FILE                  *ACAT14RC
      *    INPUT CANNOT BE GREATER THAN WHAT IS ON THE FILE            *ACAT14RC
      *    HOLIO RETURNS ALL POSITIONS FOR THE ACCOUNT,                *ACAT14RC
      *    SO WE HAVE TO BROWSE TO FIND THE RIGHT ONE                  *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       3200-HOLIO.                                                      ACAT14RC
                                                                        ACAT14RC
           MOVE 0                        TO WS-MRGN-QTY                 ACAT14RC
           MOVE LOW-VALUES               TO IOH-COMMAREA                ACAT14RC
           MOVE LOW-VALUES               TO WS-HOLIO-KEY                ACAT14RC
                                                                        ACAT14RC
           MOVE TWA-CLIENT-NO            TO WS-HOLIO-CLIENT.            ACAT14RC
           MOVE TWA-MAP-BR               TO WS-HOLIO-BRANCH.            ACAT14RC
           MOVE TWA-MAP-AC               TO WS-HOLIO-ACCT.              ACAT14RC
           MOVE '000000'                 TO WS-HOLIO-CURR-CODE.         ACAT14RC
           MOVE '01'                     TO WS-HOLIO-REC-TYPE.          ACAT14RC
                                                                        ACAT14RC
           EVALUATE TS-CS-MG-SH                                         ACAT14RC
              WHEN 'C'         MOVE '01' TO WS-HOLIO-ACCT-TYPE          ACAT14RC
              WHEN 'M'         MOVE '02' TO WS-HOLIO-ACCT-TYPE          ACAT14RC
              WHEN 'S'         MOVE '05' TO WS-HOLIO-ACCT-TYPE          ACAT14RC
           END-EVALUATE.                                                ACAT14RC
                                                                        ACAT14RC
***********IF   TWA-MAP-ADP-SECNO > ' '                                 ACAT14RC
***********     MOVE TWA-MAP-ADP-SECNO   TO WS-HOLIO-SECURITY-NO        ACAT14RC
***********ELSE                                                         ACAT14RC
***********     MOVE TWA-MAP-CUSIP       TO WS-HOLIO-SECURITY-NO        ACAT14RC
***********END-IF.                                                      ACAT14RC
***********                                                             ACAT14RC
***********MOVE '0'                      TO WS-HOLIO-WI-KEY.            ACAT14RC
***********MOVE ' '                      TO WS-HOLIO-FILLER.            ACAT14RC
***********MOVE 0000                     TO WS-HOLIO-SEQ-KEY.           ACAT14RC
                                                                        ACAT14RC
           MOVE WS-HOLIO-KEY             TO IOH-HOL-KEY                 ACAT14RC
                                                                        ACAT14RC
           SET IOH-NEXT-REC              TO TRUE.                       ACAT14RC
           SET IOH-BOTH-SHADOW-AND-REAL  TO TRUE.                       ACAT14RC
           SET IOH-NEW-RECORD            TO TRUE.                       ACAT14RC
                                                                        ACAT14RC
       3200-HOLIO-READ-NEXT.                                            ACAT14RC
                                                                        ACAT14RC
           EXEC CICS LINK PROGRAM ('CUSHOLIO')                          ACAT14RC
                          COMMAREA(IOH-COMMAREA)                        ACAT14RC
                          LENGTH  (LENGTH OF IOH-COMMAREA)              ACAT14RC
           END-EXEC.                                                    ACAT14RC
                                                                        ACAT14RC
           EVALUATE TRUE                                                ACAT14RC
               WHEN IOH-GOOD-RETURN   CONTINUE                          ACAT14RC
               WHEN IOH-INV-FUNC      GO TO 3201-INVREQERR              ACAT14RC
               WHEN IOH-FILE-CLOSED   GO TO 3202-OPENERR                ACAT14RC
               WHEN IOH-NOT-FOUND     GO TO 3203-NOTFOUND               ACAT14RC
               WHEN IOH-END-OF-FILE   GO TO 3200-EXIT                   ACAT14RC
               WHEN IOH-TOP-OF-FILE   GO TO 3200-EXIT                   ACAT14RC
               WHEN IOH-KEY-NOT-NUM   GO TO 3200-EXIT                   ACAT14RC
               WHEN IOH-INV-SHADOW-IND GO TO 3204-IOERROR               ACAT14RC
               WHEN IOH-OTHER-ERROR   GO TO 3204-IOERROR                ACAT14RC
               WHEN OTHER             GO TO 3204-IOERROR                ACAT14RC
           END-EVALUATE.                                                ACAT14RC
                                                                        ACAT14RC
           SET ADDRESS OF CHLD-SUMMARY-SEGMENT TO IOH-RECORD-POINTER.   ACAT14RC
                                                                        ACAT14RC
           IF IOH-HOL-REC-TYPE = '21'                                   ACAT14RC
              SET ADDRESS OF CHOO-SUMMARY-SEGMENT TO IOH-RECORD-POINTER ACAT14RC
           END-IF.                                                      ACAT14RC
                                                                        ACAT14RC
           IF IOH-HOL-KEY-1 = WS-HOLIO-KEY-1                            ACAT14RC
              IF CHLD-SECURITY-NUMBER(1:7) = TWA-MAP-ADP-SECNO          ACAT14RC
              OR CHLD-SECURITY-NUMBER(1:9) = TWA-MAP-CUSIP(1:9)         ACAT14RC
                 MOVE CHLD-YESTERDAY-TOTAL-UNITS TO WS-MRGN-QTY         ACAT14RC
              ELSE                                                      ACAT14RC
                 GO TO 3200-HOLIO-READ-NEXT                             ACAT14RC
              END-IF                                                    ACAT14RC
           ELSE                                                         ACAT14RC
              GO TO 3203-NOTFOUND                                       ACAT14RC
           END-IF.                                                      ACAT14RC
                                                                        ACAT14RC
       3200-EXIT. EXIT.                                                 ACAT14RC
                                                                        ACAT14RC
                                                                        ACAT14RC
       3201-INVREQERR.                                                  ACAT14RC
            MOVE -1  TO MQTYL                                           ACAT14RC
            MOVE EIBDS      TO ERR-EIBDS.                               ACAT14RC
            MOVE 'HOLIO INVALID REQUEST ERROR. CANNOT VERIFY ACCOUNT'   ACAT14RC
                  TO ERR-MSG2                                           ACAT14RC
            MOVE ERR-MSG TO SYSTEM-MSG.                                 ACAT14RC
            SET  WS-ERROR   TO TRUE                                     ACAT14RC
            PERFORM 8800-ERROR-RTN.                                     ACAT14RC
                                                                        ACAT14RC
       3202-OPENERR.                                                    ACAT14RC
            MOVE -1  TO MQTYL                                           ACAT14RC
            MOVE EIBDS                   TO ERR-EIBDS.                  ACAT14RC
            MOVE 'HOLIO FILE IS CLOSED. CANNOT VERIFY ACCOUNT'          ACAT14RC
                  TO ERR-MSG2                                           ACAT14RC
            MOVE ERR-MSG TO SYSTEM-MSG.                                 ACAT14RC
            SET  WS-ERROR   TO TRUE                                     ACAT14RC
            PERFORM 8800-ERROR-RTN.                                     ACAT14RC
                                                                        ACAT14RC
       3203-NOTFOUND.                                                   ACAT14RC
            MOVE -1  TO MQTYL                                           ACAT14RC
            MOVE EIBDS                   TO ERR-EIBDS.                  ACAT14RC
************MOVE*WS-HOLIO-CLIENT*********TO*WS-POSN-CLIENT**************ACAT14RC
************MOVE*WS-HOLIO-BRANCH*********TO*WS-POSN-BRANCH**************ACAT14RC
************MOVE*WS-HOLIO-ACCT***********TO*WS-POSN-ACCT****************ACAT14RC
************MOVE*WS-HOLIO-CURR-CODE******TO*WS-POSN-CURR-CODE***********ACAT14RC
************MOVE*WS-HOLIO-REC-TYPE*******TO*WS-POSN-REC-TYPE************ACAT14RC
************MOVE*WS-HOLIO-ACCT-TYPE******TO*WS-POSN-ACCT-TYPE***********ACAT14RC
************MOVE*WS-HOLIO-SECURITY-NO****TO*WS-POSN-SECURITY-NO*********ACAT14RC
************MOVE*WS-HOLIO-WI-KEY*********TO*WS-POSN-WI-KEY**************ACAT14RC
************MOVE*WS-HOLIO-FILLER*********TO*WS-POSN-FILLER**************ACAT14RC
************MOVE*WS-HOLIO-SEQ-KEY********TO*WS-POSN-SEQ-KEY*************ACAT14RC
************MOVE*WS-POSN-MSG*************TO*ERR-MSG2.*******************ACAT14RC
            MOVE 'HOLIO RECORD NOT FOUND. CANNOT VERIFY ACCOUNT'        ACAT14RC
                  TO ERR-MSG2                                           ACAT14RC
            MOVE ERR-MSG TO SYSTEM-MSG.                                 ACAT14RC
            SET  WS-ERROR   TO TRUE                                     ACAT14RC
            PERFORM 8800-ERROR-RTN.                                     ACAT14RC
                                                                        ACAT14RC
       3204-IOERROR.                                                    ACAT14RC
            MOVE -1  TO MQTYL                                           ACAT14RC
            MOVE EIBDS                   TO ERR-EIBDS.                  ACAT14RC
            MOVE 'HOLIO FILE I/O ERROR. CANNOT VERIFY ACCOUNT'          ACAT14RC
                  TO ERR-MSG2                                           ACAT14RC
            MOVE ERR-MSG TO SYSTEM-MSG.                                 ACAT14RC
            SET  WS-ERROR   TO TRUE                                     ACAT14RC
            PERFORM 8800-ERROR-RTN.                                     ACAT14RC
                                                                        ACAT14RC
      ***-UPDATE VINITAST DATABASE WITH NEW CASH ACCOUNT BALANCE        ACAT14RC
       3301-UPDATE-BAL01.                                               ACAT14RC
           MOVE WS-CLT              TO ACAT14-PASS-CLT.                 ACAT14RC
           MOVE ACAT-CONTROL-NBR    TO ACAT14-PASS-ACAT.                ACAT14RC
           MOVE ACAT-ADP-BROKER     TO ACAT14-PASS-DLVR-NBR.            ACAT14RC
           MOVE TWA-MAP-ACCT-DLVR   TO ACAT14-PASS-DLVR-ACCT.           ACAT14RC
           MOVE TWA-MAP-CBRKR       TO ACAT14-PASS-RCV-NBR.             ACAT14RC
           MOVE TWA-MAP-CACCT       TO ACAT14-PASS-RCV-ACCT.            ACAT14RC
           MOVE EIBTRMID            TO ACAT14-PASS-TERMID.              ACAT14RC
           MOVE ' '                 TO ACAT14-PASS-CNTRY                ACAT14RC
           MOVE ' '                 TO ACAT14-PASS-SEC                  ACAT14RC
           MOVE ' '                 TO ACAT14-PASS-SEC-CDG              ACAT14RC
           MOVE '40'                TO ACAT14-PASS-STTL-LOC             ACAT14RC
           MOVE 'C'                 TO ACAT14-PASS-CS-MG-SH             ACAT14RC
           MOVE TWA-MAP-RSON1       TO ACAT14-PASS-REASON               ACAT14RC
           MOVE TWA-BAL01-9         TO WS-AMT-UNSIGN                    ACAT14RC
           MOVE WS-AMT-UNSIGN       TO ACAT14-PASS-AMT                  ACAT14RC
           MOVE 0                   TO ACAT14-PASS-QTY                  ACAT14RC
LRM005     MOVE ' '                 TO ACAT14-PASS-WTHLD-CD                     
           PERFORM 4900-CALL-PGM-TO-UPDATE.                             ACAT14RC
                                                                        ACAT14RC
      ***-UPDATE VINITAST DATABASE WITH NEW MARGIN ACCOUNT BALANCE      ACAT14RC
       3302-UPDATE-BAL02.                                               ACAT14RC
           MOVE WS-CLT              TO ACAT14-PASS-CLT.                 ACAT14RC
           MOVE ACAT-CONTROL-NBR    TO ACAT14-PASS-ACAT.                ACAT14RC
           MOVE ACAT-ADP-BROKER     TO ACAT14-PASS-DLVR-NBR.            ACAT14RC
           MOVE TWA-MAP-ACCT-DLVR   TO ACAT14-PASS-DLVR-ACCT.           ACAT14RC
           MOVE TWA-MAP-CBRKR       TO ACAT14-PASS-RCV-NBR.             ACAT14RC
           MOVE TWA-MAP-CACCT       TO ACAT14-PASS-RCV-ACCT.            ACAT14RC
           MOVE EIBTRMID            TO ACAT14-PASS-TERMID.              ACAT14RC
           MOVE ' '                 TO ACAT14-PASS-CNTRY                ACAT14RC
           MOVE ' '                 TO ACAT14-PASS-SEC                  ACAT14RC
           MOVE ' '                 TO ACAT14-PASS-SEC-CDG              ACAT14RC
           MOVE '40'                TO ACAT14-PASS-STTL-LOC             ACAT14RC
           MOVE 'M'                 TO ACAT14-PASS-CS-MG-SH             ACAT14RC
           MOVE TWA-MAP-RSON1       TO ACAT14-PASS-REASON               ACAT14RC
           MOVE TWA-BAL02-9         TO WS-AMT-UNSIGN                    ACAT14RC
           MOVE WS-AMT-UNSIGN       TO ACAT14-PASS-AMT                  ACAT14RC
           MOVE 0                   TO ACAT14-PASS-QTY                  ACAT14RC
LRM005     MOVE ' '                 TO ACAT14-PASS-WTHLD-CD                     
           PERFORM 4900-CALL-PGM-TO-UPDATE.                             ACAT14RC
                                                                        ACAT14RC
      ***-UPDATE VINITAST DATABASE WITH NEW SHORT ACCOUNT BALANCE       ACAT14RC
       3305-UPDATE-BAL05.                                               ACAT14RC
           MOVE WS-CLT              TO ACAT14-PASS-CLT.                 ACAT14RC
           MOVE ACAT-CONTROL-NBR    TO ACAT14-PASS-ACAT.                ACAT14RC
           MOVE ACAT-ADP-BROKER     TO ACAT14-PASS-DLVR-NBR.            ACAT14RC
           MOVE TWA-MAP-ACCT-DLVR   TO ACAT14-PASS-DLVR-ACCT.           ACAT14RC
           MOVE TWA-MAP-CBRKR       TO ACAT14-PASS-RCV-NBR.             ACAT14RC
           MOVE TWA-MAP-CACCT       TO ACAT14-PASS-RCV-ACCT.            ACAT14RC
           MOVE EIBTRMID            TO ACAT14-PASS-TERMID.              ACAT14RC
           MOVE ' '                 TO ACAT14-PASS-CNTRY                ACAT14RC
           MOVE ' '                 TO ACAT14-PASS-SEC                  ACAT14RC
           MOVE ' '                 TO ACAT14-PASS-SEC-CDG              ACAT14RC
           MOVE '40'                TO ACAT14-PASS-STTL-LOC             ACAT14RC
           MOVE 'S'                 TO ACAT14-PASS-CS-MG-SH             ACAT14RC
           MOVE TWA-MAP-RSON1       TO ACAT14-PASS-REASON               ACAT14RC
           MOVE TWA-BAL05-9         TO WS-AMT-UNSIGN                    ACAT14RC
           MOVE WS-AMT-UNSIGN       TO ACAT14-PASS-AMT                  ACAT14RC
           MOVE 0                   TO ACAT14-PASS-QTY                  ACAT14RC
LRM005     MOVE ' '                 TO ACAT14-PASS-WTHLD-CD                     
           PERFORM 4900-CALL-PGM-TO-UPDATE.                             ACAT14RC
                                                                        ACAT14RC
      ***-UPDATE VINITAST DATABASE WITH NEW SECURITY QTY AND AMT        ACAT14RC
       3400-UPDATE-QTY-AMT.                                             ACAT14RC
           MOVE WS-CLT              TO ACAT14-PASS-CLT.                 ACAT14RC
           MOVE ACAT-CONTROL-NBR    TO ACAT14-PASS-ACAT.                ACAT14RC
           MOVE ACAT-ADP-BROKER     TO ACAT14-PASS-DLVR-NBR.            ACAT14RC
           MOVE TWA-MAP-ACCT-DLVR   TO ACAT14-PASS-DLVR-ACCT.           ACAT14RC
           MOVE TWA-MAP-CBRKR       TO ACAT14-PASS-RCV-NBR.             ACAT14RC
           MOVE TWA-MAP-CACCT       TO ACAT14-PASS-RCV-ACCT.            ACAT14RC
           MOVE EIBTRMID            TO ACAT14-PASS-TERMID.              ACAT14RC
           MOVE TS-CNTRY            TO ACAT14-PASS-CNTRY                ACAT14RC
           MOVE TS-SECURITY         TO ACAT14-PASS-SEC                  ACAT14RC
           MOVE TS-SEC-CDG          TO ACAT14-PASS-SEC-CDG              ACAT14RC
           MOVE TS-STTL-LOC         TO ACAT14-PASS-STTL-LOC             ACAT14RC
           MOVE TS-CS-MG-SH         TO ACAT14-PASS-CS-MG-SH             ACAT14RC
           MOVE TS-REASON           TO ACAT14-PASS-REASON               ACAT14RC
           MOVE TWA-AMT-9           TO WS-AMT-UNSIGN                    ACAT14RC
           MOVE WS-AMT-UNSIGN       TO ACAT14-PASS-AMT                  ACAT14RC
           MOVE TWA-QTY-9           TO WS-QTY-UNSIGN                    ACAT14RC
           MOVE WS-QTY-UNSIGN       TO ACAT14-PASS-QTY                  ACAT14RC
LRM005     MOVE TWA-MAP-WTHLD-CD  TO ACAT14-PASS-WTHLD-CD.                      
LRM005     IF TWA-MAP-SUB = 'Y'                                         ACAT14RC
LRM005     AND TWA-MAP-WTHLD-CD NOT = 'W'                                       
LRM005        MOVE ' '            TO ACAT14-PASS-NSCC-PEND                      
LRM005     ELSE                                                                 
LRM005        MOVE 'H'            TO ACAT14-PASS-NSCC-PEND                      
LRM005     END-IF.                                                              
           PERFORM 4900-CALL-PGM-TO-UPDATE.                             ACAT14RC
       EJECT                                                            ACAT14RC
      *---------------------------------------------------------------* ACAT14RC
      *              SUBMIT RTN - UPDATE INITIAL TRANSFER TABLE       * ACAT14RC
      *---------------------------------------------------------------* ACAT14RC
       4000-SUBMIT-RTN.                                                 ACAT14RC
           IF MSUBL > 0                                                 ACAT14RC
              IF MSUBI = TWA-MAP-SUB                                    ACAT14RC
                 CONTINUE                                               ACAT14RC
              ELSE                                                      ACAT14RC
                 MOVE MSUBI TO TWA-MAP-SUB                              ACAT14RC
              END-IF                                                    ACAT14RC
           ELSE                                                         ACAT14RC
              IF MSUBA = ERASE-KEY                                      ACAT14RC
                 MOVE SPACES TO TWA-MAP-SUB                             ACAT14RC
              END-IF.                                                   ACAT14RC
           IF TWA-MAP-SUB = LOW-VALUE                                   ACAT14RC
              MOVE SPACE TO TWA-MAP-SUB                                 ACAT14RC
           END-IF.                                                      ACAT14RC
           MOVE ATT-UNPROT TO MSUBA.                                    ACAT14RC
           IF TWA-TFR-SUBMIT-ONLY                                       ACAT14RC
              PERFORM 4100-SUBMIT-ONLY                                  ACAT14RC
           ELSE                                                         ACAT14RC
           IF TWA-TFR-HOLD-ONLY                                         ACAT14RC
              PERFORM 4300-HOLD-ONLY.                                   ACAT14RC
       EJECT                                                            ACAT14RC
      *---------------------------------------------------------------* ACAT14RC
      *     SUBMIT TO ALLOWE THE TRANSFER RECORD TO BE TRANSMITTED    * ACAT14RC
      *---------------------------------------------------------------* ACAT14RC
       4100-SUBMIT-ONLY.                                                ACAT14RC
           IF TWA-MAP-SUB > SPACE                                       ACAT14RC
              IF TWA-MAP-SUB = 'Y'                                      ACAT14RC
                 IF NOT WS-UPDATE-OK                                    ACAT14RC
                    MOVE -1 TO MSUBL                                    ACAT14RC
                    MOVE ATT-UNPROT-BRT TO MSUBA                        ACAT14RC
                    IF NOT WS-ERROR                                     ACAT14RC
                       SET WS-ERROR TO TRUE                             ACAT14RC
                       MOVE 'UNAUTHORIZE TO SUBMIT'  TO SYSTEM-MSG      ACAT14RC
                    END-IF                                              ACAT14RC
                 ELSE                                                   ACAT14RC
                   PERFORM 4110-CHECK-IF-SUBMIT-ALLOWED THRU 4110-EXIT  ACAT14RC
                   IF WS-SUBMIT-NOT-ALLOWED                             ACAT14RC
                      MOVE -1 TO MSUBL                                  ACAT14RC
                      MOVE ATT-UNPROT-BRT TO MSUBA                      ACAT14RC
                      IF NOT WS-ERROR                                   ACAT14RC
                         SET WS-ERROR TO TRUE                           ACAT14RC
                       MOVE 'SUBMIT NOT ALLOWED AT THIS TIME - REASON COACAT14RC
      -                     'DE MISSING'                                ACAT14RC
                              TO  SYSTEM-MSG                            ACAT14RC
                      END-IF                                            ACAT14RC
                   ELSE                                                 ACAT14RC
DJ0001                PERFORM 4120-CHECK-NONZERO-AMT THRU 4120-EXIT     ACAT14RC
DJ0001                IF WS-SUBMIT-NOT-ALLOWED                          ACAT14RC
DJ0001                   MOVE -1             TO MSUBL                   ACAT14RC
DJ0001                   MOVE ATT-UNPROT-BRT TO MSUBA                   ACAT14RC
DJ0001                   IF NOT WS-ERROR                                ACAT14RC
DJ0001                      SET WS-ERROR     TO TRUE                    ACAT14RC
DJ0001                      MOVE 'SUBMIT NOT ALLOWED. NO ASSETS QUALIFY'ACAT14RC
DJ0001                        TO  SYSTEM-MSG                            ACAT14RC
DJ0001                   END-IF                                         ACAT14RC
DJ0001                ELSE                                              ACAT14RC
                         PERFORM 4200-UPDATE-TFR-SUBMIT                 ACAT14RC
DJ0001                END-IF                                            ACAT14RC
                   END-IF                                               ACAT14RC
              ELSE                                                      ACAT14RC
                 MOVE -1 TO MSUBL                                       ACAT14RC
                 MOVE ATT-UNPROT-BRT TO MSUBA                           ACAT14RC
                 IF NOT WS-ERROR                                        ACAT14RC
                    SET WS-ERROR TO TRUE                                ACAT14RC
                    MOVE 'TYPE "Y" TO SUBMIT A TRANSMISSION'            ACAT14RC
                      TO  SYSTEM-MSG                                    ACAT14RC
                 END-IF.                                                ACAT14RC
       EJECT                                                            ACAT14RC
      *---------------------------------------------------------------* ACAT14RC
      *          UPDATE NSCC-PEND-IND FROM 'H' TO SPACE               * ACAT14RC
      *---------------------------------------------------------------* ACAT14RC
       4110-CHECK-IF-SUBMIT-ALLOWED.                                    ACAT14RC
           MOVE SPACE TO WS-SUBMIT-NOT-ALLOWED-SW.                      ACAT14RC
           IF TWA-MAP-BAL01 > SPACE                                     ACAT14RC
              IF TWA-MAP-RSON1 = SPACE                                  ACAT14RC
                 SET WS-SUBMIT-NOT-ALLOWED TO TRUE                      ACAT14RC
                 GO TO 4110-EXIT                                        ACAT14RC
              ELSE                                                      ACAT14RC
                 MOVE TWA-MAP-RSON1 TO WS-VALID-REASON-FLAG             ACAT14RC
                 IF VALID-REASON-CODE                                   ACAT14RC
                    CONTINUE                                            ACAT14RC
                 ELSE                                                   ACAT14RC
                    SET WS-SUBMIT-NOT-ALLOWED TO TRUE                   ACAT14RC
                    GO TO 4110-EXIT                                     ACAT14RC
                 END-IF.                                                ACAT14RC
           IF TWA-MAP-BAL02 > SPACE                                     ACAT14RC
              IF TWA-MAP-RSON2 = SPACE                                  ACAT14RC
                 SET WS-SUBMIT-NOT-ALLOWED TO TRUE                      ACAT14RC
                 GO TO 4110-EXIT                                        ACAT14RC
              ELSE                                                      ACAT14RC
                 MOVE TWA-MAP-RSON2 TO WS-VALID-REASON-FLAG             ACAT14RC
                 IF VALID-REASON-CODE                                   ACAT14RC
                    CONTINUE                                            ACAT14RC
                 ELSE                                                   ACAT14RC
                    SET WS-SUBMIT-NOT-ALLOWED TO TRUE                   ACAT14RC
                    GO TO 4110-EXIT                                     ACAT14RC
                 END-IF.                                                ACAT14RC
           IF TWA-MAP-BAL05 > SPACE                                     ACAT14RC
              IF TWA-MAP-RSON3 = SPACE                                  ACAT14RC
                 SET WS-SUBMIT-NOT-ALLOWED TO TRUE                      ACAT14RC
                 GO TO 4110-EXIT                                        ACAT14RC
              ELSE                                                      ACAT14RC
                 MOVE TWA-MAP-RSON3 TO WS-VALID-REASON-FLAG             ACAT14RC
                 IF VALID-REASON-CODE                                   ACAT14RC
                    CONTINUE                                            ACAT14RC
                 ELSE                                                   ACAT14RC
                    SET WS-SUBMIT-NOT-ALLOWED TO TRUE                   ACAT14RC
                    GO TO 4110-EXIT                                     ACAT14RC
                 END-IF.                                                ACAT14RC
           MOVE +1 TO ASSET-ITEM.                                       ACAT14RC
           PERFORM  UNTIL ASSET-ITEM > TWA-MAX-AST-PAGE                 ACAT14RC
              PERFORM 7200-READ-ASSET-TSQ                               ACAT14RC
              IF TS-REASON = SPACE                                      ACAT14RC
                 SET WS-SUBMIT-NOT-ALLOWED TO TRUE                      ACAT14RC
                 MOVE TWA-MAX-AST-PAGE TO ASSET-ITEM                    ACAT14RC
              ELSE                                                      ACAT14RC
                 MOVE TS-REASON TO WS-VALID-REASON-FLAG                 ACAT14RC
                 IF VALID-REASON-CODE                                   ACAT14RC
                    CONTINUE                                            ACAT14RC
                 ELSE                                                   ACAT14RC
                    SET WS-SUBMIT-NOT-ALLOWED TO TRUE                   ACAT14RC
                    MOVE TWA-MAX-AST-PAGE TO ASSET-ITEM                 ACAT14RC
                 END-IF                                                 ACAT14RC
              END-IF                                                    ACAT14RC
              ADD +1 TO ASSET-ITEM                                      ACAT14RC
           END-PERFORM.                                                 ACAT14RC
       4110-EXIT.                                            EXIT.      ACAT14RC
       EJECT                                                            ACAT14RC
DJ0001*---------------------------------------------------------------* ACAT14RC
DJ0001*          UPDATE NSCC-PEND-IND FROM 'H' TO SPACE               * ACAT14RC
DJ0001*---------------------------------------------------------------* ACAT14RC
DJ0001 4120-CHECK-NONZERO-AMT.                                          ACAT14RC
DJ0001     MOVE SPACE TO WS-SUBMIT-NOT-ALLOWED-SW.                      ACAT14RC
DJ0001                                                                  ACAT14RC
DJ0001**<< ANY ASSET ROWS WITH NONZERO AMT EXIST? >>                    ACAT14RC
DJ0001**<< IF NONE EXIT, CANNOT SUBMIT            >>                    ACAT14RC
DJ0001     MOVE TWA-KEY-CLT              TO ACAT14-PASS-CLT.            ACAT14RC
DJ0001     MOVE TWA-KEY-DLVR-NBR         TO ACAT14-PASS-DLVR-NBR.       ACAT14RC
DJ0001     MOVE TWA-KEY-DLVR-ACCT        TO ACAT14-PASS-DLVR-ACCT.      ACAT14RC
DJ0001     MOVE TWA-KEY-RCV-NBR          TO ACAT14-PASS-RCV-NBR.        ACAT14RC
DJ0001     MOVE TWA-KEY-RCV-ACCT         TO ACAT14-PASS-RCV-ACCT.       ACAT14RC
DJ0001     SET ACAT14-CNT-ASTINI-NONZERO TO TRUE.                       ACAT14RC
DJ0001     PERFORM 7600-LINK-TO-ACAT14DB.                               ACAT14RC
DJ0001     IF ACAT14-FOUND                                              ACAT14RC
DJ0001        CONTINUE                                                  ACAT14RC
DJ0001     ELSE                                                         ACAT14RC
DJ0001        IF ACAT14-NOT-FOUND                                       ACAT14RC
DJ0001           SET WS-SUBMIT-NOT-ALLOWED TO TRUE                      ACAT14RC
DJ0001        ELSE                                                      ACAT14RC
DJ0001           IF ACAT14-ERROR                                        ACAT14RC
DJ0001              MOVE                                                ACAT14RC
DJ0001           'DB2 COUNT ERROR ON INIT ASSET TABLE - CALL HELP DESK' ACAT14RC
DJ0001              TO WS-DB2-ERROR                                     ACAT14RC
DJ0001              PERFORM 8700-SEND-DB2-ERROR-MSG                     ACAT14RC
DJ0001           END-IF                                                 ACAT14RC
DJ0001        END-IF                                                    ACAT14RC
DJ0001     END-IF.                                                      ACAT14RC
DJ0001                                                                  ACAT14RC
DJ0001 4120-EXIT.                                            EXIT.      ACAT14RC
       EJECT                                                            ACAT14RC
      *---------------------------------------------------------------* ACAT14RC
      *          UPDATE NSCC-PEND-IND FROM 'H' TO SPACE               * ACAT14RC
      *---------------------------------------------------------------* ACAT14RC
       4200-UPDATE-TFR-SUBMIT.                                          ACAT14RC
           MOVE ACAT-ADP-BROKER   TO ACAT14-PASS-DLVR-NBR.              ACAT14RC
           MOVE TWA-MAP-ACCT-DLVR TO ACAT14-PASS-DLVR-ACCT.             ACAT14RC
           MOVE TWA-MAP-CBRKR     TO ACAT14-PASS-RCV-NBR.               ACAT14RC
           MOVE TWA-MAP-CACCT     TO ACAT14-PASS-RCV-ACCT.              ACAT14RC
           MOVE EIBTRMID          TO ACAT14-PASS-TERMID.                ACAT14RC
           MOVE TWA-SAVE-CMNTS    TO ACAT14-PASS-CMNTS.                 ACAT14RC
           MOVE SPACE             TO ACAT14-PASS-NSCC-PEND              ACAT14RC
           SET ACAT14-GET-TFRINI  TO TRUE.                              ACAT14RC
LRM003     MOVE ACAT-SIGN-ON-ID      TO ACAT14-SNON-ID                          
LRM003     MOVE ACAT-CICS-NETNAME    TO ACAT14-NETNAME                          
LRM003     MOVE ACAT-CICS-USER-ID    TO ACAT14-USER-ID                          
LRM003     MOVE ACAT-CICS-USER-NAME  TO ACAT14-USER-NAME                        
           PERFORM 7600-LINK-TO-ACAT14DB.                               ACAT14RC
           IF ACAT14-NORMAL                                             ACAT14RC
              IF ACAT14-NSCC-PEND-CD = SPACE                            ACAT14RC
                 MOVE -1 TO MSUBL                                       ACAT14RC
                 MOVE ATT-UNPROT-BRT TO MSUBA                           ACAT14RC
                 SET WS-ERROR TO TRUE                                   ACAT14RC
                 MOVE 'SUBMIT FAILED - THE TRANSFER HAS BEEN ALREADY SUBACAT14RC
      -               'MITTED BY OTHER USER'                            ACAT14RC
                   TO  SYSTEM-MSG                                       ACAT14RC
                 PERFORM 8800-ERROR-RTN                                 ACAT14RC
              END-IF                                                    ACAT14RC
           ELSE                                                         ACAT14RC
           IF ACAT14-NOT-FOUND                                          ACAT14RC
              MOVE -1 TO MSUBL                                          ACAT14RC
              MOVE ATT-UNPROT-BRT TO MSUBA                              ACAT14RC
              SET WS-ERROR TO TRUE                                      ACAT14RC
              MOVE 'SUBMIT FAILED - ALREADY SUBMITTED BY OTHER USER'    ACAT14RC
                TO  SYSTEM-MSG                                          ACAT14RC
              PERFORM 8800-ERROR-RTN.                                   ACAT14RC
                                                                        ACAT14RC
           SET ACAT14-UPD-TFRINI TO TRUE.                               ACAT14RC
           PERFORM 7600-LINK-TO-ACAT14DB.                               ACAT14RC
           IF ACAT14-NORMAL                                             ACAT14RC
              PERFORM 4500-UPDATE-ASSET-SUBMIT                          ACAT14RC
              IF NOT WS-ERROR                                           ACAT14RC
                 MOVE SPACE      TO MSUBO   TWA-MAP-SUB                 ACAT14RC
                 MOVE 'TRANSMIT' TO MTSTATO TWA-MAP-TSTAT               ACAT14RC
                 SET TWA-TFR-HOLD-ONLY    TO TRUE                       ACAT14RC
                 SET WS-MSG-ON TO TRUE                                  ACAT14RC
                 MOVE 'RESIDUAL CREDIT COMPLETED SUCCESSFULLY'          ACAT14RC
                   TO  SYSTEM-MSG                                       ACAT14RC
              END-IF                                                    ACAT14RC
           ELSE                                                         ACAT14RC
           IF ACAT14-NOT-FOUND                                          ACAT14RC
              MOVE -1 TO MSUBL                                          ACAT14RC
              MOVE ATT-UNPROT TO MSUBA                                  ACAT14RC
              SET WS-ERROR TO TRUE                                      ACAT14RC
              MOVE 'SUBMIT FAILED - ALREADY SUBMITTED BY OTHER USER AND ACAT14RC
      -            'TRANSMITTED TO NSCC'                                ACAT14RC
                TO  SYSTEM-MSG                                          ACAT14RC
           ELSE                                                         ACAT14RC
              MOVE -1 TO MSUBL                                          ACAT14RC
              MOVE ATT-UNPROT TO MSUBA                                  ACAT14RC
LRM004        MOVE 'DB2 OPEN ERROR ON INIT ASSET TABLE - CALL HELP DESK'ACAT14RC
                TO  WS-DB2-ERROR                                        ACAT14RC
              PERFORM 8700-SEND-DB2-ERROR-MSG.                          ACAT14RC
       EJECT                                                            ACAT14RC
      *---------------------------------------------------------------* ACAT14RC
      *   CHANGE THE RECORD TRANSMISSION STATUS FROM SUBMIT TO HOLD   * ACAT14RC
      *---------------------------------------------------------------* ACAT14RC
       4300-HOLD-ONLY.                                                  ACAT14RC
           IF TWA-MAP-SUB > SPACE                                       ACAT14RC
              IF NOT WS-UPDATE-OK                                       ACAT14RC
                 MOVE -1 TO MSUBL                                       ACAT14RC
                 MOVE ATT-UNPROT-BRT TO MSUBA                           ACAT14RC
                 IF NOT WS-ERROR                                        ACAT14RC
                    SET WS-ERROR TO TRUE                                ACAT14RC
                    MOVE 'UNAUTHORIZE TO HOLD'   TO SYSTEM-MSG          ACAT14RC
                 END-IF                                                 ACAT14RC
              ELSE                                                      ACAT14RC
                IF TWA-MAP-SUB = 'H'                                    ACAT14RC
                   PERFORM 4400-UPDATE-TFR-HOLD                         ACAT14RC
                ELSE                                                    ACAT14RC
                   MOVE -1 TO MSUBL                                     ACAT14RC
                   MOVE ATT-UNPROT-BRT TO MSUBA                         ACAT14RC
                   IF NOT WS-ERROR                                      ACAT14RC
                      SET WS-ERROR TO TRUE                              ACAT14RC
                      MOVE 'TYPE "H" TO HOLD A TRANSMISSION'            ACAT14RC
                           TO  SYSTEM-MSG                               ACAT14RC
                   END-IF                                               ACAT14RC
                END-IF.                                                 ACAT14RC
       EJECT                                                            ACAT14RC
      *---------------------------------------------------------------* ACAT14RC
      *          UPDATE NSCC-PEND-IND SPACE TO 'H'                    * ACAT14RC
      *---------------------------------------------------------------* ACAT14RC
       4400-UPDATE-TFR-HOLD.                                            ACAT14RC
           MOVE ACAT-ADP-BROKER   TO ACAT14-PASS-DLVR-NBR.              ACAT14RC
           MOVE TWA-MAP-ACCT-DLVR TO ACAT14-PASS-DLVR-ACCT.             ACAT14RC
           MOVE TWA-MAP-CBRKR     TO ACAT14-PASS-RCV-NBR.               ACAT14RC
           MOVE TWA-MAP-CACCT     TO ACAT14-PASS-RCV-ACCT.              ACAT14RC
           MOVE EIBTRMID          TO ACAT14-PASS-TERMID.                ACAT14RC
           MOVE TWA-SAVE-CMNTS    TO ACAT14-PASS-CMNTS.                 ACAT14RC
           MOVE 'H'               TO ACAT14-PASS-NSCC-PEND              ACAT14RC
           SET ACAT14-GET-TFRINI  TO TRUE.                              ACAT14RC
           PERFORM 7600-LINK-TO-ACAT14DB.                               ACAT14RC
           IF ACAT14-NORMAL                                             ACAT14RC
              IF ACAT14-NSCC-PEND-CD = 'H'                              ACAT14RC
                 MOVE -1 TO MSUBL                                       ACAT14RC
                 MOVE ATT-UNPROT-BRT TO MSUBA                           ACAT14RC
                 SET WS-ERROR TO TRUE                                   ACAT14RC
                 MOVE 'SUBMIT FAILED - ALREADY CHANGED TO "HOLD" STATUS ACAT14RC
      -               'BY OTHER USER'                                   ACAT14RC
                   TO  SYSTEM-MSG                                       ACAT14RC
                PERFORM 8800-ERROR-RTN                                  ACAT14RC
              END-IF                                                    ACAT14RC
           ELSE                                                         ACAT14RC
           IF ACAT14-NOT-FOUND                                          ACAT14RC
              MOVE -1 TO MSUBL                                          ACAT14RC
              MOVE ATT-UNPROT-BRT TO MSUBA                              ACAT14RC
              SET WS-ERROR TO TRUE                                      ACAT14RC
              MOVE '"SUBMIT TO HOLD" FAILED - ALREADY TRANSMITTED TO NSCACAT14RC
      -            'C'                                                  ACAT14RC
                TO  SYSTEM-MSG                                          ACAT14RC
              PERFORM 8800-ERROR-RTN.                                   ACAT14RC
                                                                        ACAT14RC
           SET ACAT14-UPD-TFRINI TO TRUE.                               ACAT14RC
           PERFORM 7600-LINK-TO-ACAT14DB.                               ACAT14RC
           IF ACAT14-NORMAL                                             ACAT14RC
              PERFORM 4500-UPDATE-ASSET-SUBMIT                          ACAT14RC
              IF NOT WS-ERROR                                           ACAT14RC
                 MOVE SPACE   TO MSUBO    TWA-MAP-SUB                   ACAT14RC
                 MOVE 'HOLD'  TO MTSTATO  TWA-MAP-TSTAT                 ACAT14RC
                 SET TWA-TFR-SUBMIT-ONLY  TO TRUE                       ACAT14RC
                 SET WS-MSG-ON TO TRUE                                  ACAT14RC
                 MOVE '"SUBMIT TO HOLD" COMPLETED SUCCESSFULLY'         ACAT14RC
                   TO  SYSTEM-MSG                                       ACAT14RC
              END-IF                                                    ACAT14RC
           ELSE                                                         ACAT14RC
           IF ACAT14-NOT-FOUND                                          ACAT14RC
              MOVE -1 TO MSUBL                                          ACAT14RC
              MOVE ATT-UNPROT-BRT TO MSUBA                              ACAT14RC
              SET WS-ERROR TO TRUE                                      ACAT14RC
              MOVE 'SUBMIT FAILED - ALREADY TRANSMITTED TO NSCC'        ACAT14RC
                TO  SYSTEM-MSG                                          ACAT14RC
           ELSE                                                         ACAT14RC
              MOVE -1 TO MSUBL                                          ACAT14RC
              MOVE ATT-UNPROT-BRT TO MSUBA                              ACAT14RC
LRM004        MOVE 'DB2 OPEN ERROR ON INIT ASSET TABLE - CALL HELP DESK'ACAT14RC
                TO  WS-DB2-ERROR                                        ACAT14RC
              PERFORM 8700-SEND-DB2-ERROR-MSG.                          ACAT14RC
       EJECT                                                            ACAT14RC
      *---------------------------------------------------------------* ACAT14RC
      *             UPDATE REASON CODE FOR EACH ASSET                 * ACAT14RC
      *---------------------------------------------------------------* ACAT14RC
       4500-UPDATE-ASSET-SUBMIT.                                        ACAT14RC
      * << OPEN >>                                                      ACAT14RC
           SET ACAT14-OPN-ASTCRSR TO TRUE.                              ACAT14RC
           PERFORM 7600-LINK-TO-ACAT14DB.                               ACAT14RC
           IF ACAT14-ERROR                                              ACAT14RC
LRM004        MOVE 'DB2 OPEN ERROR ON INIT ASSET TABLE - CALL HELP DESK'ACAT14RC
                TO  WS-DB2-ERROR                                        ACAT14RC
              PERFORM 8700-SEND-DB2-ERROR-MSG.                          ACAT14RC
      * << FETCH >>                                                     ACAT14RC
           MOVE SPACE TO WS-NO-MORE-DATA-SW.                            ACAT14RC
           PERFORM 4520-READ-ASSET-TABLE                                ACAT14RC
                      UNTIL WS-NO-MORE-DATA.                            ACAT14RC
      * << CLOSE >>                                                     ACAT14RC
           SET ACAT14-CLO-ASTCRSR TO TRUE.                              ACAT14RC
           PERFORM 7600-LINK-TO-ACAT14DB.                               ACAT14RC
           IF ACAT14-ERROR                                              ACAT14RC
LRM004        MOVE                                                      ACAT14RC
LRM004       'DB2 CLOSE ERROR ON INIT TRANSFER TABLE - CALL HELP DESK'  ACAT14RC
                TO  WS-DB2-ERROR                                        ACAT14RC
              PERFORM 8700-SEND-DB2-ERROR-MSG.                          ACAT14RC
                                                                        ACAT14RC
       4520-READ-ASSET-TABLE.                                           ACAT14RC
           SET ACAT14-FET-ASTCRSR TO TRUE.                              ACAT14RC
           PERFORM 7600-LINK-TO-ACAT14DB.                               ACAT14RC
           IF ACAT14-NORMAL                                             ACAT14RC
              MOVE ACAT14-AST-CNTRY    TO ACAT14-PASS-CNTRY             ACAT14RC
              MOVE ACAT14-AST-SEC      TO ACAT14-PASS-SEC               ACAT14RC
              MOVE ACAT14-AST-SEC-CDG  TO ACAT14-PASS-SEC-CDG           ACAT14RC
              MOVE ACAT14-AST-STTL-LOC TO ACAT14-PASS-STTL-LOC          ACAT14RC
              MOVE ACAT14-AST-CS-MG-SH TO ACAT14-PASS-CS-MG-SH          ACAT14RC
              IF ACAT14-AST-STTL-LOC = '40'                             ACAT14RC
                 PERFORM 4530-UPDATE-CASH                               ACAT14RC
              ELSE                                                      ACAT14RC
                 PERFORM 4540-UPDATE-SECURITY                           ACAT14RC
                    VARYING ASSET-ITEM FROM 1 BY 1                      ACAT14RC
                       UNTIL ASSET-ITEM > TWA-MAX-AST-PAGE              ACAT14RC
              END-IF                                                    ACAT14RC
           ELSE                                                         ACAT14RC
           IF ACAT14-NOT-FOUND                                          ACAT14RC
              SET WS-NO-MORE-DATA TO TRUE                               ACAT14RC
           ELSE                                                         ACAT14RC
LRM004        MOVE                                                      ACAT14RC
LRM004        'DB2 FETCH ERROR ON INIT TRANSFER TABLE - CALL HELP DESK' ACAT14RC
                TO  WS-DB2-ERROR                                        ACAT14RC
              PERFORM 8700-SEND-DB2-ERROR-MSG.                          ACAT14RC
                                                                        ACAT14RC
       4530-UPDATE-CASH.                                                ACAT14RC
           IF ACAT14-AST-CS-MG-SH = 'C'                                 ACAT14RC
              MOVE TWA-MAP-RSON1 TO ACAT14-PASS-REASON                  ACAT14RC
DJ0001        MOVE TWA-BAL01-9   TO WS-AMT-UNSIGN                       ACAT14RC
DJ0001        MOVE WS-AMT-UNSIGN TO ACAT14-PASS-AMT                     ACAT14RC
DJ0001        MOVE 0             TO ACAT14-PASS-QTY                     ACAT14RC
           ELSE                                                         ACAT14RC
             IF ACAT14-AST-CS-MG-SH = 'M'                               ACAT14RC
                MOVE TWA-MAP-RSON2 TO ACAT14-PASS-REASON                ACAT14RC
DJ0001          MOVE TWA-BAL02-9   TO WS-AMT-UNSIGN                     ACAT14RC
DJ0001          MOVE WS-AMT-UNSIGN TO ACAT14-PASS-AMT                   ACAT14RC
DJ0001          MOVE 0             TO ACAT14-PASS-QTY                   ACAT14RC
             ELSE                                                       ACAT14RC
               IF ACAT14-AST-CS-MG-SH = 'S'                             ACAT14RC
                  MOVE TWA-MAP-RSON3 TO ACAT14-PASS-REASON              ACAT14RC
DJ0001            MOVE TWA-BAL05-9   TO WS-AMT-UNSIGN                   ACAT14RC
DJ0001            MOVE WS-AMT-UNSIGN TO ACAT14-PASS-AMT                 ACAT14RC
DJ0001            MOVE 0             TO ACAT14-PASS-QTY                 ACAT14RC
DJ0001         END-IF                                                   ACAT14RC
DJ0001       END-IF                                                     ACAT14RC
DJ0001     END-IF.                                                      ACAT14RC
LRM005     MOVE ' ' TO ACAT14-PASS-WTHLD-CD.                                    
           PERFORM 4940-CALL-PGM-TO-UPD-SUBMIT.                         ACAT14RC
                                                                        ACAT14RC
       4540-UPDATE-SECURITY.                                            ACAT14RC
           PERFORM 7200-READ-ASSET-TSQ.                                 ACAT14RC
           IF WS-TS-READ-OK                                             ACAT14RC
              IF TS-SECURITY = ACAT14-AST-SEC                           ACAT14RC
                 MOVE TWA-MAX-AST-PAGE TO ASSET-ITEM                    ACAT14RC
                 MOVE TS-REASON        TO ACAT14-PASS-REASON            ACAT14RC
DJ0001           MOVE TWA-AMT-9        TO WS-AMT-UNSIGN                 ACAT14RC
DJ0001           MOVE WS-AMT-UNSIGN    TO ACAT14-PASS-AMT               ACAT14RC
DJ0001           MOVE TWA-QTY-9        TO WS-QTY-UNSIGN                 ACAT14RC
DJ0001           MOVE WS-QTY-UNSIGN    TO ACAT14-PASS-QTY               ACAT14RC
LRM005           MOVE TS-NSCC-WTHLD-CD TO ACAT14-PASS-WTHLD-CD                  
                 PERFORM 4940-CALL-PGM-TO-UPD-SUBMIT.                   ACAT14RC
                                                                        ACAT14RC
       4900-CALL-PGM-TO-UPDATE.                                         ACAT14RC
           SET ACAT14-UPD-ASTINI TO TRUE                                ACAT14RC
           PERFORM 7600-LINK-TO-ACAT14DB                                ACAT14RC
           IF ACAT14-ERROR                                              ACAT14RC
              MOVE 'UPDATE FAILED - INIT ASSET UPDATE ERROR'            ACAT14RC
                TO  WS-DB2-ERROR                                        ACAT14RC
              PERFORM 8700-SEND-DB2-ERROR-MSG.                          ACAT14RC
                                                                                
       4940-CALL-PGM-TO-UPD-SUBMIT.                                     ACAT14RC
           SET ACAT14-UPD-ASTSUB TO TRUE                                ACAT14RC
LRM005     IF TWA-MAP-SUB = 'Y'                                         ACAT14RC
LRM005     AND TS-NSCC-WTHLD-CD NOT = 'W'                                       
LRM005        MOVE ' '            TO ACAT14-PASS-NSCC-PEND                      
LRM005     ELSE                                                                 
LRM005        MOVE 'H'            TO ACAT14-PASS-NSCC-PEND                      
LRM005     END-IF.                                                              
           PERFORM 7600-LINK-TO-ACAT14DB                                ACAT14RC
           IF ACAT14-ERROR                                              ACAT14RC
              MOVE 'SUBMIT FAILED - INIT ASSET UPDATE ERROR'            ACAT14RC
                TO  WS-DB2-ERROR                                        ACAT14RC
              PERFORM 8700-SEND-DB2-ERROR-MSG.                          ACAT14RC
       EJECT                                                            ACAT14RC
      *---------------------------------------------------------------* ACAT14RC
      *          PF7: ACCOUNT PREVIOUSE PAGE                          * ACAT14RC
      *---------------------------------------------------------------* ACAT14RC
       5000-PREV-TFR.                                                   ACAT14RC
           MOVE SPACE TO WS-ERROR-SW                                    ACAT14RC
                         SYSTEM-MSG.                                    ACAT14RC
           IF TWA-SUBMIT-HOLD-IND = SPACE                               ACAT14RC
           OR TWA-INQUIRY-ONLY                                          ACAT14RC
              SET WS-ERROR TO TRUE                                      ACAT14RC
              MOVE LOW-VALUE TO ACAT14MO                                ACAT14RC
              MOVE -1 TO MNEXTL                                         ACAT14RC
              MOVE 'TOP PAGE' TO SYSTEM-MSG                             ACAT14RC
              PERFORM 8800-ERROR-RTN                                    ACAT14RC
           END-IF.                                                      ACAT14RC
           MOVE SPACE TO WS-SCROLL-KEY-FOUND-SW                         ACAT14RC
                         WS-TFR-NOT-FOUND-SW                            ACAT14RC
                         SRCH-SECURITY.                                 ACAT14RC
           PERFORM 0560-OPEN-TFR-CUR-DESCEND.                           ACAT14RC
           PERFORM 5010-FIND-PF7-SCROLL-KEY                             ACAT14RC
                UNTIL WS-SCROLL-KEY-FOUND OR WS-TFR-NOT-FOUND           ACAT14RC
           PERFORM 0580-CLOSE-TFR-CUR-DESCEND.                          ACAT14RC
           IF WS-TFR-NOT-FOUND                                          ACAT14RC
              SET WS-ERROR TO TRUE                                      ACAT14RC
              MOVE LOW-VALUE TO ACAT14MO                                ACAT14RC
              MOVE -1 TO MNEXTL                                         ACAT14RC
              MOVE 'ACCOUNTS TOP PAGE' TO SYSTEM-MSG                    ACAT14RC
              PERFORM 8800-ERROR-RTN                                    ACAT14RC
           ELSE                                                         ACAT14RC
              IF WS-SCROLL-KEY-FOUND                                    ACAT14RC
                 PERFORM 7210-DELETE-ASSET-TSQ                          ACAT14RC
                 PERFORM 8100-CLEAR-SCR                                 ACAT14RC
                 PERFORM 0600-SETUP-SCREEN  THRU  0600-EXIT.            ACAT14RC
           MOVE -1 TO MNEXTL.                                           ACAT14RC
           PERFORM  7020-WRITE-TSQ-RTN.                                 ACAT14RC
           PERFORM  8900-SEND-MAP-DATA-ONLY.                            ACAT14RC
           PERFORM  9000-RETURN-TO-CICS.                                ACAT14RC
       EJECT                                                            ACAT14RC
      *---------------------------------------------------------------* ACAT14RC
      *        FIND THE TRANSFER TABLE KEY FOR THE PREVIOUSE PAGE     * ACAT14RC
      *---------------------------------------------------------------* ACAT14RC
       5010-FIND-PF7-SCROLL-KEY.                                        ACAT14RC
           PERFORM 0570-FETCH-TFR-CUR-DESCEND.                          ACAT14RC
           IF ACAT14-NOT-FOUND                                          ACAT14RC
              SET WS-TFR-NOT-FOUND TO TRUE                              ACAT14RC
           ELSE                                                         ACAT14RC
           IF ACAT14-NORMAL   AND                                       ACAT14RC
               SRCH-SIGNON-SECR-CHECK-PASS                              ACAT14RC
              MOVE ACAT14-TFR-CLT       TO WS-KEY-CLT                   ACAT14RC
              MOVE ACAT14-TFR-DLVR-NBR  TO WS-KEY-DLVR-NBR              ACAT14RC
              MOVE ACAT14-TFR-DLVR-ACCT TO WS-KEY-DLVR-ACCT             ACAT14RC
              MOVE ACAT14-TFR-RCV-NBR   TO WS-KEY-RCV-NBR               ACAT14RC
              MOVE ACAT14-TFR-RCV-ACCT  TO WS-KEY-RCV-ACCT              ACAT14RC
              IF WS-TFR-KEY < TWA-TFR-KEY                               ACAT14RC
                 MOVE ACAT14-TFR-CLT       TO ACAT14-PASS-CLT           ACAT14RC
                 MOVE ACAT14-TFR-DLVR-NBR  TO ACAT14-PASS-DLVR-NBR      ACAT14RC
                 MOVE ACAT14-TFR-DLVR-ACCT TO ACAT14-PASS-DLVR-ACCT     ACAT14RC
                 MOVE ACAT14-TFR-RCV-NBR   TO ACAT14-PASS-RCV-NBR       ACAT14RC
                 MOVE ACAT14-TFR-RCV-ACCT  TO ACAT14-PASS-RCV-ACCT      ACAT14RC
                 SET ACAT14-CNT-ASTINI  TO TRUE                         ACAT14RC
                 PERFORM 7600-LINK-TO-ACAT14DB                          ACAT14RC
                 IF ACAT14-FOUND                                        ACAT14RC
                    SET WS-SCROLL-KEY-FOUND TO TRUE.                    ACAT14RC
       EJECT                                                            ACAT14RC
      *---------------------------------------------------------------* ACAT14RC
      *          PF8: ACCOUNT NEXT PAGE                               * ACAT14RC
      *---------------------------------------------------------------* ACAT14RC
       5100-NEXT-TFR.                                                   ACAT14RC
           MOVE SPACE TO WS-ERROR-SW                                    ACAT14RC
                         SYSTEM-MSG.                                    ACAT14RC
           IF TWA-SUBMIT-HOLD-IND = SPACE                               ACAT14RC
           OR TWA-INQUIRY-ONLY                                          ACAT14RC
              SET WS-ERROR TO TRUE                                      ACAT14RC
              MOVE LOW-VALUE TO ACAT14MO                                ACAT14RC
              MOVE -1 TO MNEXTL                                         ACAT14RC
              MOVE 'BOTTOM PAGE' TO SYSTEM-MSG                          ACAT14RC
              PERFORM 8800-ERROR-RTN                                    ACAT14RC
           END-IF.                                                      ACAT14RC
           MOVE SPACE TO WS-SCROLL-KEY-FOUND-SW                         ACAT14RC
                         WS-TFR-NOT-FOUND-SW.                           ACAT14RC
           PERFORM 0500-OPEN-TFR-CURSOR-TBL.                            ACAT14RC
           PERFORM 5110-FIND-PF8-SCROLL-KEY                             ACAT14RC
                UNTIL WS-SCROLL-KEY-FOUND OR WS-TFR-NOT-FOUND           ACAT14RC
           PERFORM 0550-CLOSE-TFR-CSR-TBL.                              ACAT14RC
           IF WS-TFR-NOT-FOUND                                          ACAT14RC
              SET WS-ERROR TO TRUE                                      ACAT14RC
              MOVE LOW-VALUE TO ACAT14MO                                ACAT14RC
              MOVE -1 TO MNEXTL                                         ACAT14RC
              MOVE 'ACCOUNTS BOTTOM PAGE' TO SYSTEM-MSG                 ACAT14RC
              PERFORM 8800-ERROR-RTN                                    ACAT14RC
           ELSE                                                         ACAT14RC
              IF WS-SCROLL-KEY-FOUND                                    ACAT14RC
                 PERFORM 7210-DELETE-ASSET-TSQ                          ACAT14RC
                 PERFORM 8100-CLEAR-SCR                                 ACAT14RC
                 PERFORM 0600-SETUP-SCREEN   THRU  0600-EXIT.           ACAT14RC
                                                                        ACAT14RC
           MOVE -1 TO MNEXTL.                                           ACAT14RC
           PERFORM  7020-WRITE-TSQ-RTN.                                 ACAT14RC
           PERFORM  8900-SEND-MAP-DATA-ONLY.                            ACAT14RC
           PERFORM  9000-RETURN-TO-CICS.                                ACAT14RC
       EJECT                                                            ACAT14RC
      *---------------------------------------------------------------* ACAT14RC
      *        FIND THE TRANSFER TABLE KEY FOR THE NEXT PAGE          * ACAT14RC
      *---------------------------------------------------------------* ACAT14RC
       5110-FIND-PF8-SCROLL-KEY.                                        ACAT14RC
           PERFORM 0520-FETCH-TFR-CURSOR-TBL.                           ACAT14RC
           IF ACAT14-NOT-FOUND                                          ACAT14RC
              SET WS-TFR-NOT-FOUND TO TRUE                              ACAT14RC
           ELSE                                                         ACAT14RC
           IF ACAT14-NORMAL  AND                                        ACAT14RC
               SRCH-SIGNON-SECR-CHECK-PASS                              ACAT14RC
              MOVE ACAT14-TFR-CLT       TO WS-KEY-CLT                   ACAT14RC
              MOVE ACAT14-TFR-DLVR-NBR  TO WS-KEY-DLVR-NBR              ACAT14RC
              MOVE ACAT14-TFR-DLVR-ACCT TO WS-KEY-DLVR-ACCT             ACAT14RC
              MOVE ACAT14-TFR-RCV-NBR   TO WS-KEY-RCV-NBR               ACAT14RC
              MOVE ACAT14-TFR-RCV-ACCT  TO WS-KEY-RCV-ACCT              ACAT14RC
              IF WS-TFR-KEY > TWA-TFR-KEY                               ACAT14RC
                 MOVE ACAT14-TFR-CLT       TO ACAT14-PASS-CLT           ACAT14RC
                 MOVE ACAT14-TFR-DLVR-NBR  TO ACAT14-PASS-DLVR-NBR      ACAT14RC
                 MOVE ACAT14-TFR-DLVR-ACCT TO ACAT14-PASS-DLVR-ACCT     ACAT14RC
                 MOVE ACAT14-TFR-RCV-NBR   TO ACAT14-PASS-RCV-NBR       ACAT14RC
                 MOVE ACAT14-TFR-RCV-ACCT  TO ACAT14-PASS-RCV-ACCT      ACAT14RC
                 SET ACAT14-CNT-ASTINI  TO TRUE                         ACAT14RC
                 PERFORM 7600-LINK-TO-ACAT14DB                          ACAT14RC
                 IF ACAT14-FOUND                                        ACAT14RC
                    SET WS-SCROLL-KEY-FOUND TO TRUE.                    ACAT14RC
       EJECT                                                            ACAT14RC
      *---------------------------------------------------------------* ACAT14RC
      *          ASSETS NEXT PAGE RTN                                 * ACAT14RC
      *---------------------------------------------------------------* ACAT14RC
       6000-NEXT-ASSET.                                                 ACAT14RC
           MOVE SPACE TO WS-ERROR-SW                                    ACAT14RC
                         SYSTEM-MSG.                                    ACAT14RC
           IF TWA-SUBMIT-HOLD-IND = SPACE OR LOW-VALUE                  ACAT14RC
           OR TWA-NO-INQUIRY-TRNFR-FND                                  ACAT14RC
              SET WS-ERROR TO TRUE                                      ACAT14RC
              MOVE LOW-VALUE TO ACAT14MO                                ACAT14RC
              MOVE -1 TO MNEXTL                                         ACAT14RC
              MOVE 'ASSETS BOTTOM PAGE'                                 ACAT14RC
                TO SYSTEM-MSG                                           ACAT14RC
              PERFORM 8800-ERROR-RTN                                    ACAT14RC
           END-IF.                                                      ACAT14RC
           IF TWA-AST-PAGE-NUM = TWA-MAX-AST-PAGE                       ACAT14RC
              SET WS-ERROR TO TRUE                                      ACAT14RC
              MOVE 'ASSETS BOTTOM PAGE' TO SYSTEM-MSG                   ACAT14RC
           ELSE                                                         ACAT14RC
              ADD +1 TO TWA-AST-PAGE-NUM                                ACAT14RC
              MOVE TWA-AST-PAGE-NUM TO ASSET-ITEM                       ACAT14RC
              PERFORM 7200-READ-ASSET-TSQ                               ACAT14RC
              PERFORM 7201-SETUP-SCR-FROM-TSQ.                          ACAT14RC
           MOVE -1 TO MNEXTL.                                           ACAT14RC
           PERFORM  7020-WRITE-TSQ-RTN.                                 ACAT14RC
           PERFORM  8900-SEND-MAP-DATA-ONLY.                            ACAT14RC
           PERFORM  9000-RETURN-TO-CICS.                                ACAT14RC
       EJECT                                                            ACAT14RC
      *---------------------------------------------------------------* ACAT14RC
      *          ASSETS PREVIOUSE PAGE RTN                            * ACAT14RC
      *---------------------------------------------------------------* ACAT14RC
       6100-PREV-ASSET.                                                 ACAT14RC
           MOVE SPACE TO WS-ERROR-SW                                    ACAT14RC
                         SYSTEM-MSG.                                    ACAT14RC
           IF TWA-SUBMIT-HOLD-IND = SPACE OR LOW-VALUE                  ACAT14RC
           OR TWA-NO-INQUIRY-TRNFR-FND                                  ACAT14RC
              SET WS-ERROR TO TRUE                                      ACAT14RC
              MOVE LOW-VALUE TO ACAT14MO                                ACAT14RC
              MOVE -1 TO MNEXTL                                         ACAT14RC
              MOVE 'ASSET TOP PAGE'                                     ACAT14RC
                TO SYSTEM-MSG                                           ACAT14RC
              PERFORM 8800-ERROR-RTN                                    ACAT14RC
           END-IF.                                                      ACAT14RC
           IF TWA-AST-PAGE-NUM = +0 OR +1                               ACAT14RC
              MOVE -1 TO MNEXTL                                         ACAT14RC
              SET WS-ERROR TO TRUE                                      ACAT14RC
              MOVE 'ASSET FIRST PAGE' TO SYSTEM-MSG                     ACAT14RC
           ELSE                                                         ACAT14RC
              COMPUTE TWA-AST-PAGE-NUM = TWA-AST-PAGE-NUM - 1           ACAT14RC
              MOVE TWA-AST-PAGE-NUM TO ASSET-ITEM                       ACAT14RC
              PERFORM 7200-READ-ASSET-TSQ                               ACAT14RC
              PERFORM 7201-SETUP-SCR-FROM-TSQ.                          ACAT14RC
           MOVE -1 TO MNEXTL.                                           ACAT14RC
           PERFORM  7020-WRITE-TSQ-RTN.                                 ACAT14RC
           PERFORM  8900-SEND-MAP-DATA-ONLY.                            ACAT14RC
           PERFORM  9000-RETURN-TO-CICS.                                ACAT14RC
       EJECT                                                            ACAT14RC
      *-------------------------------------------------------------*   ACAT14RC
      *           TS QUEUE FOR TWA AREA                             *   ACAT14RC
      *-------------------------------------------------------------*   ACAT14RC
       7000-READ-TSQ-RTN.                                               ACAT14RC
           MOVE '14RC'   TO TRAN-ID.                                    ACAT14RC
           EXEC CICS READQ TS QUEUE(TSQ-NAME)                           ACAT14RC
                              INTO(TWA-AREA)                            ACAT14RC
                              LENGTH(LENGTH OF TWA-AREA)                ACAT14RC
                              ITEM(ITEM-NUM)                            ACAT14RC
           END-EXEC.                                                    ACAT14RC
           IF (EIBRESP NOT = +0)                                        ACAT14RC
           AND (NOT FIRST-TIME)                                         ACAT14RC
              SET  WS-ERROR  TO TRUE                                    ACAT14RC
              MOVE LOW-VALUE TO ACAT14MO                                ACAT14RC
              MOVE 'ACAT14RC READ TSQ ERROR'                            ACAT14RC
                TO SYSTEM-MSG                                           ACAT14RC
              PERFORM 8800-ERROR-RTN                                    ACAT14RC
           END-IF.                                                      ACAT14RC
                                                                        ACAT14RC
       7010-DELETE-TSQ-RTN.                                             ACAT14RC
           MOVE '14RC'   TO TRAN-ID.                                    ACAT14RC
           EXEC CICS DELETEQ TS QUEUE(TSQ-NAME)                         ACAT14RC
           END-EXEC.                                                    ACAT14RC
                                                                        ACAT14RC
       7020-WRITE-TSQ-RTN.                                              ACAT14RC
           MOVE '14RC'   TO TRAN-ID.                                    ACAT14RC
           EXEC CICS WRITEQ TS QUEUE(TSQ-NAME)                          ACAT14RC
                               FROM(TWA-AREA)                           ACAT14RC
                               LENGTH(LENGTH OF TWA-AREA)               ACAT14RC
                               ITEM(ITEM-NUM)                           ACAT14RC
           END-EXEC.                                                    ACAT14RC
           IF EIBRESP NOT = +0                                          ACAT14RC
              SET  WS-ERROR  TO TRUE                                    ACAT14RC
              MOVE LOW-VALUE TO ACAT14MO                                ACAT14RC
              MOVE 'ACAT14RC WRITE TSQ ERROR'                           ACAT14RC
                TO SYSTEM-MSG                                           ACAT14RC
              PERFORM 8800-ERROR-RTN                                    ACAT14RC
           END-IF.                                                      ACAT14RC
       EJECT                                                            ACAT14RC
      *-------------------------------------------------------------*   ACAT14RC
      *           TS QUEUE FOR INITIAL ASSET TABLE                  *   ACAT14RC
      *-------------------------------------------------------------*   ACAT14RC
       7200-READ-ASSET-TSQ.                                             ACAT14RC
           MOVE EIBTRMID TO ASSET-TERM.                                 ACAT14RC
           MOVE SPACE TO WS-TS-READ-FLAG.                               ACAT14RC
           EXEC CICS READQ TS QUEUE(ASSET-TSQ)                          ACAT14RC
                              INTO(TS-ASSET-AREA)                       ACAT14RC
                              LENGTH(LENGTH OF TS-ASSET-AREA)           ACAT14RC
                              ITEM(ASSET-ITEM)                          ACAT14RC
                              RESP(WS-RESP)                             ACAT14RC
           END-EXEC.                                                    ACAT14RC
           IF WS-RESP = 0                                               ACAT14RC
              SET WS-TS-READ-OK TO TRUE                                 ACAT14RC
           ELSE                                                         ACAT14RC
           IF WS-RESP = DFHRESP(ITEMERR)                                ACAT14RC
              SET WS-TS-READ-ERROR TO TRUE.                             ACAT14RC
                                                                        ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *      SETUP ASSET DATA FROM TS QUEUE TO MAP                     *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       7201-SETUP-SCR-FROM-TSQ.                                         ACAT14RC
           MOVE TS-SECURITY     TO MCUSIPO                              ACAT14RC
                                   TWA-MAP-CUSIP.                       ACAT14RC
           MOVE TS-CTGRY        TO MCATGRO                              ACAT14RC
                                   TWA-MAP-CATGR.                       ACAT14RC
           MOVE TS-STTL-LOC     TO MSLOCO                               ACAT14RC
                                   TWA-MAP-SLOC.                        ACAT14RC
           MOVE TS-CS-MG-SH     TO MTYPEO                               ACAT14RC
                                   TWA-MAP-TYPE.                        ACAT14RC
           MOVE TS-DESC (1:60)  TO MDESC1O                              ACAT14RC
                                   TWA-MAP-DESC1.                       ACAT14RC
           MOVE TS-DESC (61:60) TO MDESC2O                              ACAT14RC
                                   TWA-MAP-DESC2.                       ACAT14RC
           MOVE TS-REASON       TO MRSON4O                              ACAT14RC
                                   TWA-MAP-RSON4.                       ACAT14RC
           MOVE TS-ADP-SECNO    TO TWA-MAP-ADP-SECNO.                   ACAT14RC
LRM005     MOVE TS-NSCC-WTHLD-CD TO TWA-MAP-WTHLD-CD TWA-MAP-CD MCDO            
                                                                        ACAT14RC
      ***--SHORT POSITION: DISPLAY WITH A NEGATIVE SIGN                 ACAT14RC
           IF TS-PSTN-CD = 'S'                                          ACAT14RC
DJ0001        MULTIPLY TS-QTY BY -1 GIVING TWA-QTY-9                    ACAT14RC
DJ0001        MOVE TWA-QTY-9  TO MQTYO                                  ACAT14RC
              MOVE MQTYI      TO TWA-MAP-QTY                            ACAT14RC
DJ0001        MULTIPLY TS-AMT BY -1 GIVING TWA-AMT-9                    ACAT14RC
DJ0001        MOVE TWA-AMT-9  TO MAMTO                                  ACAT14RC
DJ0001        MOVE MAMTI      TO TWA-MAP-AMT                            ACAT14RC
           ELSE                                                         ACAT14RC
DJ0001        MOVE TS-QTY     TO TWA-QTY-9                              ACAT14RC
DJ0001        MOVE TWA-QTY-9  TO MQTYO                                  ACAT14RC
              MOVE MQTYI      TO TWA-MAP-QTY                            ACAT14RC
DJ0001        MOVE TS-AMT     TO TWA-AMT-9                              ACAT14RC
DJ0001        MOVE TWA-AMT-9  TO MAMTO                                  ACAT14RC
DJ0001        MOVE MAMTI      TO TWA-MAP-AMT                            ACAT14RC
DJ0001     END-IF.                                                      ACAT14RC
                                                                        ACAT14RC
           IF NOT TWA-INQUIRY-ONLY                                      ACAT14RC
              MOVE ATT-UNPROT TO MRSON4A                                ACAT14RC
DJ0001        MOVE ATT-UNPROT TO MCDA                                   ACAT14RC
DJ0001        MOVE ATT-UNPROT TO MQTYA                                  ACAT14RC
DJ0001        MOVE ATT-UNPROT TO MAMTA                                  ACAT14RC
DJ0001     ELSE                                                         ACAT14RC
DJ0001        MOVE ATT-ASKIP  TO MRSON4A                                ACAT14RC
DJ0001        MOVE ATT-ASKIP  TO MCDA                                   ACAT14RC
DJ0001        MOVE ATT-ASKIP  TO MQTYA                                  ACAT14RC
DJ0001        MOVE ATT-ASKIP  TO MAMTA                                  ACAT14RC
DJ0001     END-IF.                                                      ACAT14RC
DJ0001     MOVE TS-AMT          TO TWA-AMT-9.                           ACAT14RC
                                                                        ACAT14RC
       EJECT                                                            ACAT14RC
       7210-DELETE-ASSET-TSQ.                                           ACAT14RC
           MOVE EIBTRMID TO ASSET-TERM.                                 ACAT14RC
           EXEC CICS DELETEQ TS QUEUE(ASSET-TSQ)                        ACAT14RC
           END-EXEC.                                                    ACAT14RC
                                                                        ACAT14RC
                                                                        ACAT14RC
       7220-WRITE-ASSET-TSQ.                                            ACAT14RC
           MOVE EIBTRMID TO ASSET-TERM.                                 ACAT14RC
           EXEC CICS WRITEQ TS QUEUE(ASSET-TSQ)                         ACAT14RC
                               FROM(TS-ASSET-AREA)                      ACAT14RC
                               LENGTH(LENGTH OF TS-ASSET-AREA)          ACAT14RC
                               ITEM(ASSET-ITEM)                         ACAT14RC
           END-EXEC.                                                    ACAT14RC
           IF EIBRESP NOT = +0                                          ACAT14RC
              SET  WS-ERROR  TO TRUE                                    ACAT14RC
              MOVE LOW-VALUE TO ACAT14MO                                ACAT14RC
              MOVE 'ACAT14RC INITIAL ASSET WRITE TSQ ERROR'             ACAT14RC
                TO SYSTEM-MSG                                           ACAT14RC
              PERFORM 8800-ERROR-RTN                                    ACAT14RC
           END-IF.                                                      ACAT14RC
                                                                        ACAT14RC
       7230-REWRITE-ASSET-TSQ.                                          ACAT14RC
           MOVE EIBTRMID TO ASSET-TERM.                                 ACAT14RC
           EXEC CICS WRITEQ TS QUEUE(ASSET-TSQ)                         ACAT14RC
                               FROM(TS-ASSET-AREA)                      ACAT14RC
                               LENGTH(LENGTH OF TS-ASSET-AREA)          ACAT14RC
                               ITEM(ASSET-ITEM)                         ACAT14RC
                               REWRITE                                  ACAT14RC
           END-EXEC.                                                    ACAT14RC
           IF EIBRESP NOT = +0                                          ACAT14RC
              SET  WS-ERROR  TO TRUE                                    ACAT14RC
              MOVE LOW-VALUE TO ACAT14MO                                ACAT14RC
              MOVE 'ACAT14RC INITIAL ASSET REWRITE TSQ ERROR'           ACAT14RC
                TO SYSTEM-MSG                                           ACAT14RC
              PERFORM 8800-ERROR-RTN                                    ACAT14RC
           END-IF.                                                      ACAT14RC
           EJECT                                                        ACAT14RC
      *-------------------------------------------------------------*   ACAT14RC
      *               XCTL TO OTHER PROGRAM                         *   ACAT14RC
      *-------------------------------------------------------------*   ACAT14RC
       7500-XCTL-TO-DETAIL-PROG.                                        ACAT14RC
           EXEC CICS XCTL                                               ACAT14RC
                  PROGRAM(CALLED-PROGRAM-NAME)                          ACAT14RC
                  COMMAREA(ACATCOMM-COMMAREA)                           ACAT14RC
                  LENGTH(LENGTH OF ACATCOMM-COMMAREA)                   ACAT14RC
           END-EXEC.                                                    ACAT14RC
                                                                        ACAT14RC
      *-------------------------------------------------------------*   ACAT14RC
      *            CALL DB2 I/O MODULE ACAT14DB                     *   ACAT14RC
      *-------------------------------------------------------------*   ACAT14RC
       7600-LINK-TO-ACAT14DB.                                           ACAT14RC
           EXEC CICS LINK                                               ACAT14RC
                     PROGRAM('ACAT14DB')                                ACAT14RC
                     COMMAREA(ACAT14IO-COMMAREA)                        ACAT14RC
                     LENGTH(LENGTH OF ACAT14IO-COMMAREA)                ACAT14RC
           END-EXEC.                                                    ACAT14RC
                                                                        ACAT14RC
      *-------------------------------------------------------------*   ACAT14RC
      *     CALL DB2 I/O MODULE - PARTICIPANT BROKER NAME SEARCH    *   ACAT14RC
      *-------------------------------------------------------------*   ACAT14RC
       7700-LINK-TO-ACATPPIO.                                           ACAT14RC
           EXEC CICS LINK PROGRAM ('ACATPPDB')                          ACAT14RC
                COMMAREA(ACATPPIO-CALL-AREA)                            ACAT14RC
                LENGTH(LENGTH OF ACATPPIO-CALL-AREA)                    ACAT14RC
           END-EXEC.                                                    ACAT14RC
       EJECT                                                            ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *             CLEAR SCREEN WITH SPACE                            *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       8100-CLEAR-SCR.                                                  ACAT14RC
           MOVE SPACE TO TWA-MAP-AREA.                                  ACAT14RC
           MOVE SPACE TO MBRO                                           ACAT14RC
                         MACO                                           ACAT14RC
                         MRRO                                           ACAT14RC
                         MCBRKRO                                        ACAT14RC
                         MCBNAMO                                        ACAT14RC
                         MCTYPEO                                        ACAT14RC
                         MCACCTO                                        ACAT14RC
                         MSTATO                                         ACAT14RC
                         MNAMEO                                         ACAT14RC
                         MSSNO                                          ACAT14RC
                         MNAME2O                                        ACAT14RC
                         MSSN2O                                         ACAT14RC
                         MBAL01I                                        ACAT14RC
                         MRSON1O                                        ACAT14RC
                         MBAL02I                                        ACAT14RC
                         MRSON2O                                        ACAT14RC
                         MBAL05I                                        ACAT14RC
                         MRSON3O                                        ACAT14RC
                         MCUSIPO                                        ACAT14RC
                         MCATGRO                                        ACAT14RC
                         MSLOCO                                         ACAT14RC
                         MTYPEO                                         ACAT14RC
                         MDESC1O                                        ACAT14RC
                         MDESC2O                                        ACAT14RC
DJ0001                   MCDI                                           ACAT14RC
                         MQTYI                                          ACAT14RC
DJ0001                   MAMTI                                          ACAT14RC
                         MRSON4O                                        ACAT14RC
                         MNEXTO                                         ACAT14RC
                         MSUBO.                                         ACAT14RC
           MOVE ATT-ASKIP TO MRSON1A                                    ACAT14RC
                             MRSON2A                                    ACAT14RC
                             MRSON3A                                    ACAT14RC
                             MRSON4A.                                   ACAT14RC
DJ0001     MOVE ATT-ASKIP TO MBAL01A                                    ACAT14RC
DJ0001                       MBAL02A                                    ACAT14RC
DJ0001                       MBAL05A                                    ACAT14RC
DJ0001                       MCDA                                       ACAT14RC
DJ0001                       MQTYA                                      ACAT14RC
DJ0001                       MAMTA.                                     ACAT14RC
                                                                        ACAT14RC
       EJECT                                                            ACAT14RC
      *-------------------------------------------------------------*   ACAT14RC
      *            SEND MAP ERASE FOR THE FIRST TIME                *   ACAT14RC
      *-------------------------------------------------------------*   ACAT14RC
       8200-SEND-MAP-ERASE.                                             ACAT14RC
           IF WS-ERROR OR WS-MSG-ON                                     ACAT14RC
              MOVE SYSTEM-MSG     TO TRLMSGO                            ACAT14RC
              MOVE ATT-ASKIP-BRT  TO TRLMSGA                            ACAT14RC
           ELSE                                                         ACAT14RC
              MOVE SPACE  TO TRLMSGO                                    ACAT14RC
           END-IF.                                                      ACAT14RC
           MOVE 'ACAX'    TO MTRANSO.                                   ACAT14RC
           MOVE WSTIME    TO MTIMEO.                                    ACAT14RC
           MOVE WSMMDDYY  TO MDATEO.                                    ACAT14RC
           MOVE WS-CLT    TO MCLINBO.                                   ACAT14RC
           EXEC CICS SEND MAP('HDRMAP')                                 ACAT14RC
                     MAPSET('ACAT00M')                                  ACAT14RC
                     FROM(HDRMAPO)                                      ACAT14RC
                     ACCUM                                              ACAT14RC
                     CURSOR                                             ACAT14RC
                     ERASE                                              ACAT14RC
           END-EXEC.                                                    ACAT14RC
           EXEC CICS SEND MAP('ACAT14M')                                ACAT14RC
                     MAPSET('ACAT14M')                                  ACAT14RC
                     FROM(ACAT14MO)                                     ACAT14RC
                     ACCUM                                              ACAT14RC
                     CURSOR                                             ACAT14RC
           END-EXEC.                                                    ACAT14RC
           EXEC CICS SEND MAP('TRLMAP')                                 ACAT14RC
                     MAPSET('ACAT00M')                                  ACAT14RC
                     FROM(TRLMAPO)                                      ACAT14RC
                     ACCUM                                              ACAT14RC
                     CURSOR                                             ACAT14RC
           END-EXEC.                                                    ACAT14RC
           EXEC CICS SEND PAGE                                          ACAT14RC
           END-EXEC.                                                    ACAT14RC
                                                                        ACAT14RC
       EJECT                                                            ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
      *       DISPLAY DB2 ERROR MESSAGE ROUTINE                        *ACAT14RC
      *----------------------------------------------------------------*ACAT14RC
       8700-SEND-DB2-ERROR-MSG.                                         ACAT14RC
           MOVE -1 TO MNEXTL.                                           ACAT14RC
           SET WS-ERROR TO TRUE.                                        ACAT14RC
           MOVE  ACAT14-SQLCODE   TO WS-ERR-SQLCODE.                    ACAT14RC
           MOVE  WS-DB2-ERROR-MSG TO SYSTEM-MSG.                        ACAT14RC
           PERFORM 8800-ERROR-RTN.                                      ACAT14RC
                                                                        ACAT14RC
                                                                        ACAT14RC
       8800-ERROR-RTN.                                                  ACAT14RC
           MOVE WSTIME         TO  MTIMEO.                              ACAT14RC
           MOVE WSMMDDYY       TO  MDATEO.                              ACAT14RC
           MOVE SYSTEM-MSG     TO  TRLMSGO.                             ACAT14RC
           MOVE ATT-ASKIP-BRT  TO  TRLMSGA.                             ACAT14RC
           PERFORM 7020-WRITE-TSQ-RTN.                                  ACAT14RC
           PERFORM 8900-SEND-MAP-DATA-ONLY.                             ACAT14RC
           PERFORM 9000-RETURN-TO-CICS.                                 ACAT14RC
                                                                        ACAT14RC
                                                                        ACAT14RC
       8900-SEND-MAP-DATA-ONLY.                                         ACAT14RC
           IF WS-ERROR OR WS-MSG-ON                                     ACAT14RC
              MOVE SYSTEM-MSG     TO TRLMSGO                            ACAT14RC
              MOVE ATT-ASKIP-BRT  TO TRLMSGA                            ACAT14RC
           ELSE                                                         ACAT14RC
              MOVE SPACE  TO TRLMSGO                                    ACAT14RC
           END-IF.                                                      ACAT14RC
                                                                        ACAT14RC
           MOVE 'ACAX'    TO MTRANSO.                                   ACAT14RC
           MOVE WSTIME    TO MTIMEO.                                    ACAT14RC
           MOVE WSMMDDYY  TO MDATEO.                                    ACAT14RC
           MOVE WS-CLT    TO MCLINBO.                                   ACAT14RC
              EXEC CICS SEND MAP('HDRMAP')                              ACAT14RC
                        MAPSET('ACAT00M')                               ACAT14RC
                        FROM(HDRMAPO)                                   ACAT14RC
                        CURSOR                                          ACAT14RC
                        DATAONLY                                        ACAT14RC
                        ACCUM                                           ACAT14RC
               END-EXEC                                                 ACAT14RC
               EXEC CICS SEND MAP('ACAT14M')                            ACAT14RC
                         MAPSET('ACAT14M')                              ACAT14RC
                         FROM(ACAT14MO)                                 ACAT14RC
                         CURSOR                                         ACAT14RC
                         DATAONLY                                       ACAT14RC
                         ACCUM                                          ACAT14RC
               END-EXEC                                                 ACAT14RC
               EXEC CICS SEND MAP('TRLMAP')                             ACAT14RC
                         MAPSET('ACAT00M')                              ACAT14RC
                         FROM(TRLMAPO)                                  ACAT14RC
                         CURSOR                                         ACAT14RC
                         DATAONLY                                       ACAT14RC
                         ACCUM                                          ACAT14RC
               END-EXEC                                                 ACAT14RC
               EXEC CICS SEND PAGE                                      ACAT14RC
               END-EXEC.                                                ACAT14RC
           EJECT                                                        ACAT14RC
       9000-RETURN-TO-CICS.                                             ACAT14RC
                                                                        ACAT14RC
           IF  TWA-INQUIRY-ONLY                                         ACAT14RC
           AND ACAT-CALLING-PROG-NAME NOT = 'ACAT21PT'                  ACAT14RC
                MOVE 'ACAT21PT' TO ACAT-CALLING-PROG-NAME               ACAT14RC
           END-IF.                                                      ACAT14RC
                                                                        ACAT14RC
           EXEC CICS RETURN                                             ACAT14RC
                     TRANSID('ACAX')                                    ACAT14RC
                     COMMAREA(ACATCOMM-COMMAREA)                        ACAT14RC
           END-EXEC.                                                    ACAT14RC
                                                                        ACAT14RC
                                                                        ACAT14RC
                                                                        ACAT14RC
       9900-RETURN-CONTROL-RTN.                                         ACAT14RC
                                                                        ACAT14RC
           EXEC CICS SEND CONTROL                                       ACAT14RC
                            ERASE                                       ACAT14RC
                           FREEKB                                       ACAT14RC
           END-EXEC.                                                    ACAT14RC
                                                                        ACAT14RC
           EXEC CICS XCTL PROGRAM ('RATT01')                            ACAT14RC
           END-EXEC.                                                    ACAT14RC
                                                                        ACAT14RC
           EXEC CICS RETURN                                             ACAT14RC
           END-EXEC.                                                    ACAT14RC
                                                                        ACAT14RC
                                                                        ACAT14RC
                                                                        ACAT14RC
       HANG-CICS.                                                       ACAT14RC
           GOBACK.                                                      ACAT14RC
                                                                        ACAT14RC
